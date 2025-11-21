// (C) 2001-2024 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


/* Author : Abu Bakar Ismail
 * Date   : 12 oct 2020
 * Design objective: To bridge AXI-S into AVST, non PCIE format 
 * Feature: Supports data width: 256, 512 or 1024
 */
//`timescale 1ns/1ps
module axis_avst_tx_adaptor # (
        parameter payload_width   = 512,  // AXI-S & AVST width
        parameter channel_width   = 6,
        parameter user_width      = 9,
        parameter empty_byte_width= 6,
        parameter error_width     = 3,
        parameter ST_readyLatency = 15,
        parameter axi_fifo_awidth = 5,
        parameter AVST_REVERSE_DATA_ORDERING = 0
       )
(
  input                           axi_st_clk,
  input                           coreclkout_hip,
  input                           warm_rst_n,
  input                           axi_st_areset_n,
  // AXI-S signals - input
  input                           app_ss_st_tx_tvalid,
  input   [payload_width - 1:0]   app_ss_st_tx_tdata,
  input   [payload_width/8 - 1:0] app_ss_st_tx_tkeep,
  input                           app_ss_st_tx_tlast,
  input   [channel_width - 1:0]   app_ss_st_tx_tid,
  input   [error_width+user_width - 1:0]   app_ss_st_tx_tuser,
  output                          app_ss_st_tx_tready,
  // AVST signals - output
  input                           tx_st_ready,
  output                          tx_st_valid,
  output                          tx_st_sop,
  output                          tx_st_eop,
  output  [empty_byte_width - 1:0] tx_st_empty,
  output  [channel_width - 1:0]   tx_st_channel,
  output  [user_width - 1:0]      tx_st_user,
  output  [error_width - 1:0]     tx_st_error,
  output  [payload_width - 1:0]   tx_st_data
);

localparam  AXI_ST_FIFO_WIDTH = payload_width + payload_width/8 + channel_width + error_width + user_width + 1;
localparam  FIFO_BUFFER       = 4;  // Select 4 for FIFO sync registers
localparam  DC_FIFO_AWIDTH    = $clog2 (2**axi_fifo_awidth  + ST_readyLatency + FIFO_BUFFER);
localparam  LATENCY_DLY       = ST_readyLatency != 0 ? ST_readyLatency : 1;

reg                                     dc_fifo_rdreq_r;
reg                                     tlast_reg;
reg   [5:0]                             empty_arr [0:(payload_width/(8*32))-1];
reg                                     app_ss_st_tx_tready_r;
//reg   [ST_readyLatency: 0]              count_latency;

reg   [LATENCY_DLY - 1: 0]              latency_ready_r;

wire                                    latency_ready;
wire  [AXI_ST_FIFO_WIDTH - 1:0]         dc_fifo_in_fixed;
wire                                    dc_fifo_in_tlast;
wire  [payload_width/8 - 1: 0]          dc_fifo_in_tkeep;
wire                                    dc_fifo_rdreq, dc_fifo_wrreq;
wire                                    rd_req_ahead;
wire                                    dc_fifo_wrfull, dc_fifo_rdempty;
wire                                    fifo_out_tlast;
wire  [error_width + user_width - 1:0]  fifo_out_tuser;
wire  [payload_width/8 - 1:0]           fifo_out_tkeep;
wire  [payload_width-1:0]               fifo_out_tdata;
wire  [AXI_ST_FIFO_WIDTH - 1:0]         dc_fifo_in, axis_in;
wire  [AXI_ST_FIFO_WIDTH - 1:0]         dc_fifo_out;
wire  [DC_FIFO_AWIDTH - 1:0]            dc_fifo_wrusedw;
wire  [payload_width - 1:0]             tx_tdata_in_f;
wire  [channel_width - 1:0]             fifo_out_tid;
wire  [payload_width - 1:0]             tx_st_data_i;
wire                                    xfer_to_avst;
wire                                    latency_trig;
wire                                    dc_fifo_almost_full;

wire  [$clog2(payload_width/8):0]       empty_cal; 
wire  [empty_byte_width - 1:0]          empty_adj;

wire [7:0]                              data_byte_array      [0: (payload_width/8)-1];
wire [7:0]                              data_byte_array_end  [0: (payload_width/8)-1];

genvar gi;
integer i;

// Reset synchronizer
  altera_std_synchronizer coreclk_warm_rst_n_sync
  (
    .clk      (coreclkout_hip),
    .reset_n  (warm_rst_n),
    .din      (1'b1),
    .dout     (warm_rst_n_coreclk)
  );

// FIFO & logics
//assign  dc_fifo_almost_full = (dc_fifo_wrusedw > (2**DC_FIFO_AWIDTH - (ST_readyLatency + 5)));
if (ST_readyLatency == 0) begin: rdy_latency_0
  assign latency_ready = app_ss_st_tx_tready_r;
end
else begin: rdy_latency
  assign latency_ready = latency_ready_r[ST_readyLatency - 1];
end

//assign  dc_fifo_wrreq =  app_ss_st_tx_tvalid & (~dc_fifo_wrfull) & !count_latency[ST_readyLatency];
assign  dc_fifo_wrreq =  app_ss_st_tx_tvalid & (~dc_fifo_wrfull) & latency_ready;
assign  dc_fifo_rdreq = (tx_st_ready | rd_req_ahead) & (~dc_fifo_rdempty); // Read ahead when tx_st_ready is de-asserted
assign  dc_fifo_in =  {app_ss_st_tx_tlast, app_ss_st_tx_tid, app_ss_st_tx_tuser, app_ss_st_tx_tkeep, app_ss_st_tx_tdata};

assign  dc_fifo_almost_full = (dc_fifo_wrusedw >= (2**DC_FIFO_AWIDTH - (ST_readyLatency + FIFO_BUFFER)));
assign  latency_trig = (dc_fifo_wrusedw == (2**DC_FIFO_AWIDTH - (ST_readyLatency + FIFO_BUFFER)));

// Adding Pipeline to data and writereq
always @(posedge axi_st_clk or negedge axi_st_areset_n)
begin
  if (!axi_st_areset_n) begin
    app_ss_st_tx_tready_r <= 1'b0;
    //count_latency <= {(ST_readyLatency+1){1'b1}};
    latency_ready_r <= 0;
  end
  else begin
    app_ss_st_tx_tready_r <= ~dc_fifo_almost_full;

    latency_ready_r[0] <= app_ss_st_tx_tready_r;
    for (i=1; i < ST_readyLatency; i=i+1) 
      latency_ready_r[i] <= latency_ready_r[i-1];
  end
end

 dcfifo  # (
    .lpm_width                (AXI_ST_FIFO_WIDTH),
    .lpm_widthu               (DC_FIFO_AWIDTH),
    .lpm_numwords             (2**DC_FIFO_AWIDTH),
    .overflow_checking        ("OFF"),
    .underflow_checking       ("OFF"),
    .use_eab                  ("ON"),
    .lpm_showahead            ("OFF")
 ) axi_st_intf_fifo (
    .data (dc_fifo_in),
    .rdclk (coreclkout_hip),
    .rdreq (dc_fifo_rdreq),
    .wrclk (axi_st_clk),
    .wrreq (dc_fifo_wrreq),
    .q (dc_fifo_out),
    .rdempty (dc_fifo_rdempty),
    .wrfull (dc_fifo_wrfull),
    .aclr (~axi_st_areset_n),
    .eccstatus (),
    .rdfull (),
    .rdusedw (),
    .wrempty (),
    .wrusedw (dc_fifo_wrusedw)
);

// split output
assign  fifo_out_tlast =  dc_fifo_out[payload_width + payload_width/8 + error_width + user_width + channel_width];
assign  fifo_out_tid =  dc_fifo_out[payload_width + payload_width/8 + error_width + user_width +: channel_width];
assign  fifo_out_tuser = dc_fifo_out[payload_width + payload_width/8 +: error_width + user_width];
assign  fifo_out_tkeep = dc_fifo_out[payload_width +: payload_width/8];
assign  fifo_out_tdata = dc_fifo_out[0 +: payload_width];

always @(posedge coreclkout_hip or negedge warm_rst_n_coreclk)
begin
  if (!warm_rst_n_coreclk)
  begin
    dc_fifo_rdreq_r <= 1'b0;
  end
  else
  begin
    if (tx_st_ready | rd_req_ahead)
      dc_fifo_rdreq_r <= dc_fifo_rdreq; // only updated after tx_st_ready is asserted
  end
end

assign rd_req_ahead = ~dc_fifo_rdreq_r & ~tx_st_ready;  // reading FIFO ahead when previous data is already used 
// Calculate Empty
function reg [$clog2(payload_width/8):0] convert_tkeep (input reg [payload_width/8 - 1:0] value);
begin
  for (convert_tkeep = 0; value > 0; convert_tkeep = convert_tkeep + 1) begin
    value = value >> 1;
  end
end
endfunction

//assign empty_cal = payload_width/8 - convert_tkeep (fifo_out_tkeep);
assign empty_cal = -(convert_tkeep (fifo_out_tkeep)); // the MSB is not used
assign xfer_to_avst = dc_fifo_rdreq_r;

// Regs 
always @(posedge coreclkout_hip or negedge warm_rst_n_coreclk)
begin
  if (!warm_rst_n_coreclk)
  begin
    tlast_reg <= 1'b1;
  end
  else
  begin
    if (xfer_to_avst & tx_st_ready)
    begin
        tlast_reg <= fifo_out_tlast;
    end
  end
end

generate
  if (empty_byte_width == $clog2(payload_width/8))
  begin: no_adj_empty
    assign  empty_adj =  empty_cal[$clog2(payload_width/8) - 1:0];
  end
  else if (empty_byte_width > $clog2(payload_width/8))
  begin: adj_up_empty
    assign  empty_adj = {empty_cal[$clog2(payload_width/8) - 1:0], {empty_byte_width-($clog2(payload_width/8)){1'b0}}}; 
  end
  else if (empty_byte_width < $clog2(payload_width/8))
  begin: adj_down_empty
    assign  empty_adj =  empty_cal[$clog2(payload_width/8) - 1:0] >> (($clog2(payload_width/8)) - empty_byte_width); 
  end
endgenerate

assign  app_ss_st_tx_tready = app_ss_st_tx_tready_r;  
assign  tx_st_valid = xfer_to_avst;
assign  tx_st_sop = xfer_to_avst ? tlast_reg : 1'b0; 
assign  tx_st_eop = xfer_to_avst ? fifo_out_tlast : 1'b0;
assign  tx_st_empty = xfer_to_avst & fifo_out_tlast ? empty_adj : 0; 
assign  tx_st_channel = xfer_to_avst ? fifo_out_tid : 0;
assign  tx_st_user = xfer_to_avst ? fifo_out_tuser[ user_width-1:0] : 0;
assign  tx_st_error = xfer_to_avst ? fifo_out_tuser[error_width+user_width-1:user_width] : 0;

if (AVST_REVERSE_DATA_ORDERING == 1) begin 
  for (gi=0; gi < (payload_width/8); gi=gi+1)
  begin: data_out_byte_array
    assign data_byte_array[gi] = fifo_out_tdata[(gi+1)*8-1:gi*8];
  end

  for (gi=0; gi < (payload_width/8); gi=gi+1)
  begin: re_combined_data_out
    assign tx_st_data_i[(gi+1)*8-1:gi*8] = data_byte_array[payload_width/8 - 1 - gi];
  end

  assign  tx_st_data = xfer_to_avst ? tx_st_data_i : 0;
end
else begin
  assign  tx_st_data = xfer_to_avst ? fifo_out_tdata: 0;
end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6ysHgKBCguBYVqWiqteFVnYODbMuKff59UKIc7iRgqOFAv0UAFyRBPNOuQpZQg/FNC4pP5tqqhxXEFErN2ArEnwUa8XrC497BCWg44x2m96IihLi7BMG239W778Rs6PfXurQbzZvbS/N2oDi5cmH/Rwgq6KJvtyZl6DemZ9dpRvfBKJl3uGl8HKbwtLmvFGv2tz4OEnck3lvC8Ovjo/rs+v0TSf2nOFyC8bBO9cme6eviwzG8fNLPju0+3z1uI/7cXM9hqG+l3NyTcEh1/G71JUoB+hejuRUeLeHqexkRBe+3Np+QitZb3zHt4z461rgTW7sVEp187T0AXNaGUFbI4Lck8oVtqyqEwordscz0pWAzBxDrUktmDA9LPzqZ5qGvBFObM+Adgo3FZH/Rqs0o2WMVLqG+v8XxcDcj68wD/hKFf/5+S0AVnlrMpzL8MdckEv+WMQqNpj+93Or467TlUsBB/MCe2Q5enlFtBlcxeiN77vLvndaxVzC2eZ2CU3+VUcZaufhncSbma1vRIeRL8/i/atS3aSEw4m7Upbe7MHOgwy37Ub6SyfQGZDodjEp8FybxWbSPruLsI+226jbeSdsBPyg0oEpkmx5NVVWChKhYMkJGo8J/LcXpOIX+KMdWnoFOIwPvZDatmoD/3gfNUczrC4lA2P4Xb7YyI8ub4KVwjKvLvnGoJwovuPj2A3DLveTR9B5LJh6GQ6NMvzPk+Bw7/smFnkeNBPinxQJHLWmWY/HDQ20Ii9lJciRj5UQa4eah5+o1baXXc4euwN96IGB"
`endif