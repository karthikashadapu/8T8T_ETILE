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


`timescale 1 ps / 1 ps

import ecpri_pkg::*;

module packet_queue_fifo
#(
parameter DEVICE_FAMILY     = "Stratix 10",
parameter PTP_EN            = 1,  //Remain param but not used, get ptp indicated signal from packet parser, ptp_o
parameter BITSPERSYMBOL     = 8,                                    // Streaming Data symbol width in bits
parameter SYMBOLSPERBEAT    = 8,                                    // Streaming Number of symbols per symb
parameter DATA_WIDTH        = (BITSPERSYMBOL * SYMBOLSPERBEAT),     // Streaming Data bit width
parameter READY_LATENCY     = 3,                                    // Streaming ready latency
parameter ERROR_WIDTH       = 1,                                    // Streaming port error width
parameter QUEUE_COUNT       = 10,                                    // Streaming Empty width
parameter EMPTY_WIDTH       = 3,                                     // Streaming Empty width,
parameter QUEUE_DFIFO_DEPTH = 256,
parameter QUEUE_CFIFO_DEPTH = (QUEUE_DFIFO_DEPTH/6), // Division based on the minimum header byte size per packet without IPv4, IPv6 for now
parameter DESC_WIDTH        = 6,
parameter BYPASS_PIPELINE   = 0
)
(
//Common clock and Reset
input  logic                     data_sink_clk,
input  logic                     data_source_clk,
input  logic                     reset_n,
input  logic                     reset_n_src_clk,

//Avalon St logic DataIn (Sink) Interface from Packet Parser/Classifier
input  logic                     data_sink_sop,
input  logic                     data_sink_eop,
input  logic                     data_sink_valid,
output logic                     data_sink_ready,
input  logic [(DATA_WIDTH)-1:0]  data_sink_data,
input  logic [EMPTY_WIDTH-1:0]   data_sink_empty,
input  logic [(ERROR_WIDTH)-1:0] data_sink_error,
input  logic [DESC_WIDTH-1:0]    data_sink_desc,
input  logic                     data_sink_desc_valid,
input  logic [2:0]               data_sink_vlan_pcp,
input  logic [95:0]              data_sink_ingress_timestamp_96b_data,

//Avalon St logic DataOut (Source) Interface to Ethernet MAC
output logic                     data_source_sop,
output logic                     data_source_eop,
output logic                     data_source_valid,
input  logic                     data_source_ready,
output logic [(DATA_WIDTH)-1:0]  data_source_data,
output logic [EMPTY_WIDTH-1:0]   data_source_empty,
output logic [(ERROR_WIDTH)-1:0] data_source_error,
output logic [DESC_WIDTH-1:0]    data_source_desc, 
output logic                     data_source_desc_valid,
output logic [2:0]               data_source_vlan_pcp,
output logic [95:0]              data_source_ingress_timestamp_96b_data,
output logic                     queue_fifo_dout_ready,
output logic                     queue_priority_flag,
output logic                     data_source_ptp,//23.3 new port, indicator for ptp, 1 = ptp.

input logic                      ptp_o,
input logic                      ipv4_o,
input logic                      ipv6_o,
input logic [3:0]                ptp_message_type_o,
input logic                      vlan_o,
input logic                      svlan_o,

//implemented to ext sink 
input  logic                     queue_clr_cnt,
input  logic                     queue_sop_cnt_en,
input  logic                     en_pq_starvation,//from csr starvation value
//PTP frame byte offset
output logic                     one_step_en,
output logic                     two_step_en,
output logic [15:0]              offset_timestamp,
output logic [15:0]              offset_correction_field
);

localparam LREADY_LATENCY          = (READY_LATENCY > 0) ? (READY_LATENCY-1) : 0;
localparam LREADY_LAT_USE          = (READY_LATENCY > 1) ? (READY_LATENCY-1) : 0;
localparam QUEUE_FIFO_WIDTH        = DATA_WIDTH+EMPTY_WIDTH+ERROR_WIDTH+2; // valid output from FIFO should be generate using empty

localparam DATA_FIFO_WIDTH         = QUEUE_FIFO_WIDTH + DESC_WIDTH + 96 + 1;//1 bit for desc_valid
localparam CONTROL_PTP_WIDTH       = 1+1+16+16+3+1;     //REMOVE PTP_EN dependent, always highest width, extra 1 bit for ptp_indicator (ptp_o)

//TODO
localparam QUEUE_DFIFO_USEDW       = $clog2(QUEUE_DFIFO_DEPTH);
localparam QUEUE_CFIFO_USEDW       = $clog2(QUEUE_CFIFO_DEPTH);
localparam QUEUE_CFIFO_DEPC        = 2 ** (QUEUE_CFIFO_USEDW);
localparam QUEUE_DFIFO_ALMOST_FULL = QUEUE_DFIFO_DEPTH - READY_LATENCY - 4 - 1;
localparam QUEUE_CFIFO_ALMOST_FULL = QUEUE_CFIFO_DEPC - 2;
localparam FIFO_RATE_MATCHING_EN   = 0;

logic                         queue_sink_ready;
logic                         queue_fifo_read_empty;
logic [DATA_FIFO_WIDTH-1:0]   queue_fifo_din;
logic [DATA_FIFO_WIDTH-1:0]   queue_fifo_dout;
logic [QUEUE_DFIFO_USEDW-1:0] queue_fifo_wr_pfull_out;
// need to synchronize the reset to the write clock for cross domain scenario
logic                         sync_reset_n;

logic                         data_source_sop_early;
logic                         data_source_eop_early;
logic                         data_source_valid_early;
logic [(DATA_WIDTH)-1:0]      data_source_data_early;
logic [(DESC_WIDTH)-1:0]      data_source_desc_early;
logic                         data_source_desc_valid_early;
logic [EMPTY_WIDTH-1:0]       data_source_empty_early;
logic [(ERROR_WIDTH)-1:0]     data_source_error_early;
logic [2:0]                   data_source_vlan_pcp_early;
logic [95:0]                  data_source_ingress_timestamp_96b_data_early;
logic                         ptp_o_early;

logic                         data_wrreq;
logic                         data_rdreq;
logic                         control_wrreq;
logic                         control_rdreq;
logic                         control_fifo_empty /* synthesis maxfan = 1 */ ;
logic [QUEUE_CFIFO_USEDW-1:0] control_fifo_wr_pfull_out;
logic [QUEUE_CFIFO_USEDW-1:0] control_fifo_rd_usedw;
logic [3:0]                   ctrl_cnt;
logic                         queue_cnt_select;
logic [15:0]                  ptp_offset_correction_field;
logic [15:0]                  ptp_offset_timestamp;
logic [15:0]                  ptp_offset_correction_field_d;
logic [15:0]                  ptp_offset_timestamp_d;
logic [CONTROL_PTP_WIDTH-1:0] ptp_ctrl_din;
logic [CONTROL_PTP_WIDTH-1:0] ptp_ctrl_dout;
logic [15:0]                  offset_timestamp_early;
logic [15:0]                  offset_correction_field_early;
logic                         ptp_vlan;
logic                         ptp_svlan;
logic                         ptp_ipv4;
logic                         ptp_ipv6;
logic                         ptp_only;
logic                         control_fifo_full;
logic                         queue_fifo_full;
logic                         ptp_one_step_en;
logic                         ptp_two_step_en;
logic                         ptp_one_step_en_d;
logic                         ptp_two_step_en_d;
logic                         ptp_two_step_en_early;
logic                         ptp_one_step_en_early;
//logic                         data_sink_ptp_pipe;//new added, for propagate ptp_o signal to output with data sink
logic                         data_sink_sop_pipe;
logic                         data_sink_eop_pipe;
logic                         data_sink_valid_pipe;
logic [(DATA_WIDTH)-1:0]      data_sink_data_pipe;
logic [EMPTY_WIDTH-1:0]       data_sink_empty_pipe;
logic [(ERROR_WIDTH)-1:0]     data_sink_error_pipe;
logic [DESC_WIDTH-1:0]        data_sink_desc_pipe;
logic                         data_sink_desc_valid_pipe;
logic [95:0]                  data_sink_ingress_timestamp_96b_data_pipe;
logic [2:0]                   data_sink_vlan_pcp_pipe;
logic                         ptp_o_pipe;


// PCP pipeline
always_ff @(posedge data_sink_clk) begin
   if (sync_reset_n == 1'b0) begin
      data_sink_vlan_pcp_pipe <= 3'b0;
      ptp_o_pipe              <= 1'b0;
   end else begin
      data_sink_vlan_pcp_pipe <= data_sink_vlan_pcp;
      ptp_o_pipe              <= ptp_o;
   end
end


alt_ecpri_std_synchronizer_nocut #(.depth(3), .rst_value(0)) reset_n_sync (.clk(data_sink_clk),  .reset_n(reset_n),  .din(1'b1), .dout(sync_reset_n));

generate
  if(BYPASS_PIPELINE) begin : byp_pipe_data_sink
     //assign data_sink_ptp_pipe        = ptp_o;
     assign data_sink_sop_pipe        = data_sink_sop;
     assign data_sink_eop_pipe        = data_sink_eop;
     assign data_sink_valid_pipe      = data_sink_valid;
     assign data_sink_data_pipe       = data_sink_data;
     assign data_sink_empty_pipe      = data_sink_empty;
     assign data_sink_error_pipe      = data_sink_error;
     assign data_sink_desc_pipe       = data_sink_desc;
     assign data_sink_desc_valid_pipe = data_sink_desc_valid;
  end else begin : ena_pipe_data_sink
     always_ff @(posedge data_sink_clk) begin
        if (sync_reset_n == 1'b0) begin
            data_sink_valid_pipe <= 1'b0;
        end else begin
            data_sink_valid_pipe <= data_sink_valid;
        end
     end
     always_ff @(posedge data_sink_clk) begin
        //data_sink_ptp_pipe        <= ptp_o;
        data_sink_sop_pipe        <= data_sink_sop;
        data_sink_eop_pipe        <= data_sink_eop;
        data_sink_data_pipe       <= data_sink_data;
        data_sink_empty_pipe      <= data_sink_empty;
        data_sink_error_pipe      <= data_sink_error;
        data_sink_desc_pipe       <= data_sink_desc;
        data_sink_desc_valid_pipe <= data_sink_desc_valid;
     end
  end

endgenerate

generate
   if(BYPASS_PIPELINE) begin : byp_pipe_96b_data
      assign data_sink_ingress_timestamp_96b_data_pipe = (ptp_o)? data_sink_ingress_timestamp_96b_data : 96'h0;
   end else begin: ena_pipe_96b_data
      always_ff @(posedge data_sink_clk) begin
         data_sink_ingress_timestamp_96b_data_pipe <= (ptp_o)? data_sink_ingress_timestamp_96b_data : 96'h0;
      end
   end
endgenerate
always_comb begin
   case (ptp_message_type_o)
       4'h0: begin // Sync
          ptp_one_step_en = (ptp_o)? 1'b1 : 1'b0;
          ptp_two_step_en = (ptp_o)? 1'b1 : 1'b0;
      end
      4'h1:  begin // Delay_Req
          ptp_one_step_en = (ptp_o)? 1'b0 : 1'b0;
          ptp_two_step_en = (ptp_o)? 1'b1 : 1'b0;
      end
      4'h2:  begin // PDelay_Req
          ptp_one_step_en = (ptp_o)? 1'b0 : 1'b0;
          ptp_two_step_en = (ptp_o)? 1'b1 : 1'b0;
      end
      4'h3:  begin  // PDelay_Resp
          ptp_one_step_en = (ptp_o)? 1'b0 : 1'b0;
          ptp_two_step_en = (ptp_o)? 1'b1 : 1'b0;
      end
      default: begin
          ptp_one_step_en = 1'b0;
          ptp_two_step_en = 1'b0;
      end
   endcase
end

always_ff @(posedge data_sink_clk) begin
   if (sync_reset_n == 1'b0) begin
      ptp_ipv4  <= 1'b0;
      ptp_ipv6  <= 1'b0;
      ptp_only  <= 1'b0;
      ptp_vlan  <= 1'b0;
      ptp_svlan <= 1'b0;
   end else begin
      ptp_ipv4  <= ipv4_o & ptp_o;
      ptp_ipv6  <= ipv6_o & ptp_o;
      ptp_only  <= ptp_o & (~ipv4_o) & (~ipv6_o);
      ptp_vlan  <= vlan_o;
      ptp_svlan <= svlan_o;
   end
end

always_comb begin
   if (ptp_only) begin
      if (ptp_vlan) begin
         ptp_offset_correction_field = 16'd26;
         ptp_offset_timestamp        = 16'd52;
      end else if (ptp_svlan) begin
         ptp_offset_correction_field = 16'd30;
         ptp_offset_timestamp        = 16'd56;
      end else begin
         ptp_offset_correction_field = 16'd22;
         ptp_offset_timestamp        = 16'd48;
      end
   end else if (ptp_ipv4) begin
      if (ptp_vlan) begin
         ptp_offset_correction_field = 16'd54;
         ptp_offset_timestamp        = 16'd80;
      end else if (ptp_svlan) begin
         ptp_offset_correction_field = 16'd58;
         ptp_offset_timestamp        = 16'd84;
      end else begin
         ptp_offset_correction_field = 16'd50;
         ptp_offset_timestamp        = 16'd76;
      end
   end else if (ptp_ipv6) begin
      if (ptp_vlan) begin
         ptp_offset_correction_field = 16'd74;
         ptp_offset_timestamp        = 16'd100;
      end else if (ptp_svlan) begin
         ptp_offset_correction_field = 16'd78;
         ptp_offset_timestamp        = 16'd104;
      end else begin
         ptp_offset_correction_field = 16'd70;
         ptp_offset_timestamp        = 16'd96;
      end
   end else begin
      ptp_offset_correction_field     = 16'd0;
      ptp_offset_timestamp            = 16'd0;
   end
end

always_ff @(posedge data_sink_clk) begin
   if (sync_reset_n == 1'b0) begin
      ptp_one_step_en_d <= 1'b0;
      ptp_two_step_en_d <= 1'b0;
   end else begin
      ptp_one_step_en_d <= ptp_one_step_en;
      ptp_two_step_en_d <= ptp_two_step_en;
   end
end

always_ff @(posedge data_sink_clk) begin
   if (sync_reset_n == 1'b0) begin
      ptp_offset_correction_field_d <= 16'd0;
      ptp_offset_timestamp_d        <= 16'd0;
   end else begin
      ptp_offset_correction_field_d <= ptp_offset_correction_field;
      ptp_offset_timestamp_d        <= ptp_offset_timestamp;
   end
end

assign ptp_o_early                   = ptp_ctrl_dout[CONTROL_PTP_WIDTH-1];
assign ptp_two_step_en_early         = ptp_ctrl_dout[CONTROL_PTP_WIDTH-2];
assign ptp_one_step_en_early         = ptp_ctrl_dout[CONTROL_PTP_WIDTH-3];
assign offset_timestamp_early        = ptp_ctrl_dout[19 +: 16];
assign offset_correction_field_early = ptp_ctrl_dout[03 +: 16];
assign data_source_vlan_pcp_early    = ptp_ctrl_dout[00 +: 03];
assign ptp_ctrl_din                  = {ptp_o_pipe,ptp_two_step_en_d,ptp_one_step_en_d,ptp_offset_timestamp_d,ptp_offset_correction_field_d,data_sink_vlan_pcp_pipe};

alt_ecpri_fifo #(
    .DEVICE_FAMILY (DEVICE_FAMILY),
    .DEPTH         (QUEUE_CFIFO_DEPC),
    .WIDTH         (CONTROL_PTP_WIDTH),
    .ADDR_WIDTH    (QUEUE_CFIFO_USEDW),
    .SKID_BUFFER_D2(1),
    .DUAL_CLOCK    (1)
) control_fifo (
    .aclr          (~reset_n),
    .sclr          (~reset_n_src_clk),
    .wrclk         (data_sink_clk), //clock domain from external HPS
    .data          (ptp_ctrl_din),
    .wrreq         (control_wrreq),
    .wrfull        (),
    .wrusedw       (control_fifo_wr_pfull_out),
    .rdclk         (data_source_clk), //clk_txmac
    .q             (ptp_ctrl_dout),
    .rdreq         (control_rdreq),
    .rdempty       (control_fifo_empty),
    .rdusedw       (),

    .clock         (),
    .empty         (),
    .usedw         (),
    .almost_full   ()
);

always_ff @(posedge data_source_clk) begin
   if (reset_n_src_clk == 1'b0) begin
      queue_priority_flag <= 1'b0;
   end else begin
      queue_priority_flag <= (en_pq_starvation && ctrl_cnt >= QUEUE_COUNT) ? 1'b1 : 1'b0; // Set to raise the misc FIFO priority once whenever 10 packets of eCPRI or PTP are transferred
   end
end

always_ff @(posedge data_source_clk) begin
   if (reset_n_src_clk == 1'b0) begin
      queue_cnt_select <= 1'b0;
      ctrl_cnt <= 4'd0;
   end else begin
      queue_cnt_select <= (~queue_priority_flag & queue_sop_cnt_en) & queue_fifo_dout_ready;
      if (~queue_clr_cnt) begin
         if (queue_cnt_select) begin
            ctrl_cnt <= ctrl_cnt + 4'd1;
         end
      end else begin
         ctrl_cnt <= 4'd0;
      end
   end
end

always_ff @(posedge data_source_clk) begin: pipeline_out_ready
   if (reset_n_src_clk == 1'b0) begin
      queue_fifo_dout_ready <= 1'b0;
   end else if (~control_fifo_empty)begin
      queue_fifo_dout_ready <= 1'b1;
   end else if (control_fifo_empty & data_source_valid /*& data_source_eop*/)begin
      queue_fifo_dout_ready <= 1'b0;
   end
end

assign control_wrreq         = data_sink_eop_pipe & data_sink_valid_pipe;
// the empty from both control and data/queue fifo will not be in sync, that one will assert/deassert in early/later cycle than the other
// control_fifo_empty will be the final qualifier as it need to wait for the last EOP from the Queue/Data fifo
assign control_rdreq         = data_source_eop_early & ~control_fifo_empty & data_source_ready;
assign queue_fifo_full       = (queue_fifo_wr_pfull_out   < QUEUE_DFIFO_ALMOST_FULL) ? 1'b0 : 1'b1;
assign control_fifo_full     = (control_fifo_wr_pfull_out < QUEUE_CFIFO_ALMOST_FULL) ? 1'b0 : 1'b1;

//Ensure the reset sync before propagate into the FIFO
always_ff @(posedge data_sink_clk) begin
  if (sync_reset_n == 1'b0) begin
     queue_sink_ready      <= 1'b0;
  end else begin
     queue_sink_ready      <= ~(control_fifo_full | queue_fifo_full);
  end
end

assign data_sink_ready = queue_sink_ready; //output to HPS

generate if (FIFO_RATE_MATCHING_EN == 1) begin : FIFO_RATEMATCHING_ON
    alt_ecpri_fifo_ratematch #(
        .DEVICE_FAMILY     (DEVICE_FAMILY),
        .DEPTH             (QUEUE_DFIFO_DEPTH),
        .WIDTH             (DATA_FIFO_WIDTH),
        .ADDR_WIDTH        (QUEUE_DFIFO_USEDW),
        .SKID_BUFFER_D2    (1),
        .DUAL_CLOCK        (1),
        .DATA_WIDTH        (DATA_WIDTH),
        .ERROR_WIDTH       (ERROR_WIDTH),
        .EMPTY_WIDTH       (EMPTY_WIDTH),
        .EOP_THRESHOLD     (37),
        .STORE_AND_FORWARD (0)
    ) data_fifo (
        .aclr          (~reset_n),
        .sclr          (~reset_n_src_clk),
        .wrclk         (data_sink_clk), //clock domain from external HPS
        .data          (queue_fifo_din),
        .wrreq         (data_wrreq),
        .wrfull        (),
        .wrusedw       (queue_fifo_wr_pfull_out),
        .rdclk         (data_source_clk), //clk_txmac
        .q             (queue_fifo_dout),
        .rdreq         (data_rdreq),
        .rdempty       (queue_fifo_read_empty),
        .rdusedw       (),
    
        .clock         (),
        .empty         (),
        .usedw         (),
        .almost_full   ()
    );
end : FIFO_RATEMATCHING_ON
else begin : FIFO_RATEMATCHING_OFF
    alt_ecpri_fifo #(
        .DEVICE_FAMILY (DEVICE_FAMILY),
        .DEPTH         (QUEUE_DFIFO_DEPTH),
        .WIDTH         (DATA_FIFO_WIDTH),
        .ADDR_WIDTH    (QUEUE_DFIFO_USEDW),
        .SKID_BUFFER_D2(1),
        .DUAL_CLOCK    (1)
    ) data_fifo (
        .aclr          (~reset_n),
        .sclr          (~reset_n_src_clk),
        .wrclk         (data_sink_clk), //clock domain from external HPS
        .data          (queue_fifo_din),
        .wrreq         (data_wrreq),
        .wrfull        (),
        .wrusedw       (queue_fifo_wr_pfull_out),
        .rdclk         (data_source_clk), //clk_txmac
        .q             (queue_fifo_dout),
        .rdreq         (data_rdreq),
        .rdempty       (queue_fifo_read_empty),
        .rdusedw       (),
    
        .clock         (),
        .empty         (),
        .usedw         (),
        .almost_full   ()
    );
end : FIFO_RATEMATCHING_OFF
endgenerate
//TODO cntr fifo (Rate Matching fifo implementation)]

assign queue_fifo_din                               = {data_sink_ingress_timestamp_96b_data_pipe, data_sink_desc_pipe, data_sink_desc_valid_pipe, data_sink_sop_pipe, data_sink_eop_pipe, data_sink_empty_pipe, data_sink_error_pipe, data_sink_data_pipe};

assign data_rdreq               = data_source_ready & ~queue_fifo_read_empty;
assign data_wrreq               = data_sink_valid_pipe;
assign data_source_valid_early  = ~queue_fifo_read_empty;

assign data_source_ingress_timestamp_96b_data_early = queue_fifo_dout[DATA_WIDTH + ERROR_WIDTH +  EMPTY_WIDTH + 3 + DESC_WIDTH +: 96];//+1 middle for desc valid signal
assign data_source_desc_early                       = queue_fifo_dout[DATA_WIDTH + ERROR_WIDTH +  EMPTY_WIDTH + 3 +: DESC_WIDTH];
assign data_source_desc_valid_early                 = queue_fifo_dout[DATA_WIDTH + ERROR_WIDTH +  EMPTY_WIDTH + 2];
assign data_source_sop_early                        = queue_fifo_dout[DATA_WIDTH + ERROR_WIDTH +  EMPTY_WIDTH + 1];
assign data_source_eop_early                        = queue_fifo_dout[DATA_WIDTH + ERROR_WIDTH +  EMPTY_WIDTH];
assign data_source_empty_early                      = queue_fifo_dout[DATA_WIDTH + ERROR_WIDTH +: EMPTY_WIDTH];
assign data_source_error_early                      = queue_fifo_dout[DATA_WIDTH               +: ERROR_WIDTH];
assign data_source_data_early                       = queue_fifo_dout[DATA_WIDTH -1             :0];

logic data_source_vld_nxt;
assign data_source_valid = data_source_vld_nxt & data_source_ready;
always_ff @(posedge data_source_clk) begin: pipeline_out_ctrl
  if (reset_n_src_clk == 1'b0) begin
       data_source_vld_nxt         <= 1'b0;
       data_source_sop             <= 1'b0;
       data_source_eop             <= 1'b0;
       data_source_empty           <= {EMPTY_WIDTH{1'b0}};
       data_source_error           <= {ERROR_WIDTH{1'b0}};
       data_source_ingress_timestamp_96b_data     <= 96'h0;
  end else begin
       if (data_source_ready) begin
           data_source_vld_nxt     <= data_source_valid_early;
           data_source_sop         <= data_source_sop_early;
           data_source_eop         <= data_source_eop_early;
           data_source_empty       <= data_source_empty_early;
           data_source_error       <= data_source_error_early;
           data_source_ingress_timestamp_96b_data <= data_source_ingress_timestamp_96b_data_early;
       end
    end
end

always_ff @(posedge data_source_clk) begin: pipeline_out_data
   if (data_source_ready) begin
      data_source_data        <= data_source_data_early;
      data_source_desc        <= data_source_desc_early;
      data_source_desc_valid  <= data_source_desc_valid_early;
   end
end
always_ff @(posedge data_source_clk) begin: pipeline
   if (reset_n_src_clk == 1'b0) begin
      offset_timestamp        <= {16{1'b0}};
      offset_correction_field <= {16{1'b0}};
      one_step_en             <= 1'b0;
      two_step_en             <= 1'b0;
   end else begin
      offset_timestamp        <= offset_timestamp_early;
      offset_correction_field <= offset_correction_field_early;
      one_step_en             <= ptp_one_step_en_early;
      two_step_en             <= ptp_two_step_en_early;
   end
end

always_ff @(posedge data_source_clk) begin
      if (reset_n_src_clk == 1'b0) begin
         data_source_vlan_pcp        <= 3'h0;
         data_source_ptp             <= 1'b0;
      end else begin
          data_source_vlan_pcp        <= data_source_vlan_pcp_early;
          data_source_ptp             <= ptp_o_early;
      end
end

endmodule
