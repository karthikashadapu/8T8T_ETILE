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


// (C) 2001-2020 Intel Corporation. All rights reserved.
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

module pciess_rx_converter
#(
  parameter channel_width                 = 8,
  parameter user_width                    = 64,
  parameter error_width                   = 1,
  parameter empty_byte_width              = 6,
  parameter payload_width                 = 512,
  parameter fifo_awidth                   = 3,
  parameter AVST_REVERSE_DATA_ORDERING    = 0
)(
  //clock and reset
  input                                   avst_clk,
  input                                   axi_st_clk,
  input                                   axi_st_areset_n,

  //AVST
  input                                   avst_sop_i,
  input                                   avst_eop_i,
  input                                   avst_valid_i,
  input [channel_width-1:0]               avst_channel_i,
  input [user_width-1:0]                  avst_user_i,
  input [error_width-1:0]                 avst_error_i,
  input [empty_byte_width-1:0]            avst_empty_i,
  input [payload_width-1:0]               avst_data_i,
  output                                  avst_ready_o,

  //AXI
  input                                   axi_st_tready_i,
  output                                  axi_st_tlast_o,
  output                                  axi_st_tvalid_o,
  output [channel_width-1:0]              axi_st_tid_o,
  output [error_width+user_width-1:0]     axi_st_tuser_o,
  output [payload_width/8-1:0]            axi_st_tkeep_o,
  output [payload_width-1:0]              axi_st_tdata_o
);
  localparam fifo_dwidth = 1 + channel_width + user_width + error_width + payload_width/8 + payload_width;

  wire                                    tlast_fifo;
  wire [channel_width-1:0]                tid_fifo;
  wire [error_width+user_width-1:0]       tuser_fifo;
  wire [payload_width/8-1:0]              tkeep_fifo;
  wire [payload_width-1:0]                tdata_reverse;
  wire [payload_width-1:0]                tdata_fifo;
  wire                                    fifo_wrreq;
  wire                                    fifo_wrfull;
  wire [fifo_dwidth-1:0]                  fifo_data;
  wire                                    fifo_rdreq;
  wire                                    fifo_rdempty;
  wire [fifo_dwidth-1:0]                  fifo_q;
  reg                                     tvalid_fifo;

  assign tlast_fifo       = avst_eop_i;
  assign tid_fifo         = avst_channel_i;
  assign tuser_fifo       = {avst_error_i,avst_user_i};
  assign tkeep_fifo       = {(payload_width/8){1'b1}} >> (avst_empty_i*(payload_width/8/(2**empty_byte_width)));
  assign tdata_fifo       = AVST_REVERSE_DATA_ORDERING ? tdata_reverse : avst_data_i;
  assign fifo_wrreq       = avst_valid_i & ~fifo_wrfull;
  assign fifo_data        = {tlast_fifo,tid_fifo,tuser_fifo,tkeep_fifo,tdata_fifo};
  assign avst_ready_o     = ~fifo_wrfull;

  genvar byte_count;
  generate
    for(byte_count=0; byte_count<(payload_width/8); byte_count=byte_count+1) begin : data_reverse_ordering
      assign tdata_reverse[byte_count*8+:8] = avst_data_i[((payload_width/8)-byte_count-1)*8+:8];
    end
  endgenerate

  dcfifo #(
    .lpm_width           ( fifo_dwidth      ),
    .lpm_widthu          ( fifo_awidth      ),
    .lpm_numwords        ( 2**fifo_awidth   ),
    .underflow_checking  ( "OFF"            ),
    .overflow_checking   ( "OFF"            ),
    .use_eab             ( "ON"             ),
    .write_aclr_synch    ( "ON"             )
  ) u_avst2axist_fifo (
    .aclr                ( ~axi_st_areset_n ),
    .wrclk               ( avst_clk         ),
    .wrreq               ( fifo_wrreq       ),
    .data                ( fifo_data        ),
    .wrusedw             (                  ),
    .wrempty             (                  ),
    .wrfull              ( fifo_wrfull      ),
    .rdclk               ( axi_st_clk       ),
    .rdreq               ( fifo_rdreq       ),
    .rdfull              (                  ),
    .rdempty             ( fifo_rdempty     ),
    .rdusedw             (                  ),
    .q                   ( fifo_q           ),
    .eccstatus           (                  )
  );

  always@(posedge axi_st_clk or negedge axi_st_areset_n) begin
    if(!axi_st_areset_n)
      tvalid_fifo        <= 1'b0;
    else
      tvalid_fifo        <= fifo_rdreq;
  end

  assign fifo_rdreq       = ~fifo_rdempty & axi_st_tready_i;
  assign axi_st_tvalid_o  = tvalid_fifo;
  assign {axi_st_tlast_o,axi_st_tid_o,axi_st_tuser_o,axi_st_tkeep_o,axi_st_tdata_o} = tvalid_fifo? fifo_q : {fifo_dwidth{1'b0}};

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6yussv2ZjtJhsetS4meYgl/+ET+H/w8+II4Xc8VpJ3QQfscGIenBLCgztz44lPYh7A/v8uoSvIvOTWXVNpAwh4+OGlcqjOLeHIucUhGB7QLRyXXECUwCIqDEEmRnj+IpkWla5euTV0dAXOKO8igyKJdAR/s3vgOqSWtMfF/UgdF6DGzdMExhXWcaHKbWLlGrvUiLGNG9Y64eYHx6n126Jh9UpWFtv8oi+YOsExztKQUVYpU7CR/JF05b9qiwjELOhM3q0REMHIk2/k7W/YMXcdWOwL3ClVgWpFvev9pM06mtMSrYRl+9KDm3qI+CLwW5liGHQZXPWGluRrL9PDHw0/DjjI1sEwkxANspkYIGPWgnERv6vX1bHXf3wKSvNUsEcjIUfjJ52Bm4jMDRT/zGCw1/RqYlh13KtpwnE4BGTSx3jkRg8mjxt9aWhtxzlOAA44aKNMs13ZVVi1y4gZH4cavGyb5aKy9an+uF5d9/+F5YEDBbVp3jmTuvbir25vpOgvwGPwvli+AbaYu8bepHhfcWgy+MB3Kuxh+qEQzGSRjxlLiwnDpsW1S7MUVp06x1axrB2zc40p7HMU1FARCvXLGXR3AgooisfAo+XpVX+58doOwkUknQ9FVgNnLIiI0NwFcgEBh97ekXCOKAkffBx13BD0eUJqWPNULcMIFT+BBpZXiasw1T4epLht79zzEidPv4VLkYT+CJvEo6fAmBAq2Sz/BhSfU+BpMBQjq6ZuPyLA1c2qXYKNiFXCsYv16fataDu/myTLddDWci4OGDswWd"
`endif