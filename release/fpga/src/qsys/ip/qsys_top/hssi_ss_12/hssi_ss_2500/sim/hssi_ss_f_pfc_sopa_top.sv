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

// ==========================================================================
// Project           : HSSI Subsystem 
// Module            : hssi_ss_f_pfc_sopa_top.sv
// Description       : 
// Author            : 
// Created           : 
// Changes           : 
// Design TODO       : 1.Provide highest priority to Q0. Let Pause frame hit Q0. Q0 is always present with higher buffer size
//                     2.Read latency. User need to provide read latency lesser than PFC module ready latency
// ==========================================================================

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module hssi_ss_f_pfc_sopa_top #(

  //Common for both PFC_SOPA_TX & PFC_SOPA_RX
  parameter NUM_QUEUES                                           = 7,
  parameter QUEUE_WIDTH                                          = (NUM_QUEUES > 3) ? 3: (NUM_QUEUES > 1) ? 2: 1,
  // parameter QUEUE_WIDTH                                          = (NUM_QUEUES == 1) ? $clog2(NUM_QUEUES) : 1,
  parameter AXI_DATA_WIDTH                                       = 64,
  parameter AXI_NUM_BYTES                                        = 8,
  parameter [3:0] AXI_READY_LATENCY                              = 0,
  
  //PFC_SOPA_TX
  parameter AXI_TX_TUSER_WIDTH                                   = 7, 
  parameter [31:0] TX_QUEUE_SIZE      [8-1:0]                    = '{default:512}, //Queue size interms of no of words (word length = data_width). 
  parameter [31:0] TX_QUEUE_WIDTH     [8-1:0]                    = '{default:9}, 
  
 //PFC_SOPA_RX
  parameter AXI_RX_TUSER_WIDTH                                   = 7,    
  parameter [31:0] RX_QUEUE_SIZE      [8-1:0]                    = '{default:512}, //Queue size interms of no of words (word length = data_width). 
  parameter [31:0] RX_QUEUE_WIDTH     [8-1:0]                    = '{default:9}, 
  
  //Other common parameters
  //parameter ENABLE_ECC                                           = 0,
  parameter PREAMBLE_EN                                          = 0,
  parameter FLOW_CONTROL_EN                                      = 0,
  parameter BUFFER_EN                                            = 0,
  parameter SIM_EMULATE                                          = 1
) (
  // PFC CSR 
  input                                                          i_pfccsr_clk,
  input                                                          i_pfccsr_rst_n,
  input [31:0]                                                   i_pfccsr_writedata,
  input                                                          i_pfccsr_read,
  input                                                          i_pfccsr_write,
  input [3:0]                                                    i_pfccsr_byteenable,
  input [7:0]                                                    i_pfccsr_address,
  output reg [31:0]                                              o_pfccsr_readdata,
  output reg                                                     o_pfccsr_readdatavalid,
  output reg                                                     o_pfccsr_waitrequest,
    
  input                                                          i_tx_preamble_pass_thr_en ,
  input                                                          i_rx_preamble_pass_thr_en,

  // AXI ST TX Interface
  // From User to PFC 
  input                                                          i_tx_clk,
  input                                                          i_tx_rst_n,
  output                                                         o_axi_app_tx_tready, 
  input                                                          i_axi_app_tx_tvalid,
  input      [AXI_DATA_WIDTH-1:0]                                i_axi_app_tx_tdata,
  input      [AXI_NUM_BYTES-1:0]                                 i_axi_app_tx_tkeep,
  input                                                          i_axi_app_tx_tlast,
  input      [AXI_TX_TUSER_WIDTH-1:0]                            i_axi_app_tx_tuser, 
  
  // From PFC to MAC side
  input                                                          i_axi_mac_tx_tready, 
  output                                                         o_axi_mac_tx_tvalid,
  output     [AXI_DATA_WIDTH-1:0]                                o_axi_mac_tx_tdata, 
  output     [AXI_NUM_BYTES-1:0]                                 o_axi_mac_tx_tkeep,
  output                                                         o_axi_mac_tx_tlast,
  output                                                         o_axi_mac_tx_tlast_segment, //bit width [NUM_SEG-1:0], NUM_SEG = 1 for SOPA
  output                                                         o_axi_mac_tx_ttrunc , //bit width [NUM_SEG-1:0], NUM_SEG = 1 for SOPA
  output     [AXI_TX_TUSER_WIDTH-1:0]                            o_axi_mac_tx_tuser,
  
  // Control signal on user side 
  output     [NUM_QUEUES-1:0]                                    o_app_tx_queue_level, 
  
  // Control signal from Rx MAC side to stall TX buffer
  input      [8-1:0]                                             i_rx_pfc,  
  input                                                          i_rx_pause, 
 
  // AXI ST RX Interface
  // From MAC Side to PFC
  input                                                          i_rx_clk,
  input                                                          i_rx_rst_n,
  input                                                          i_axi_app_rx_tvalid,
  input      [AXI_DATA_WIDTH-1:0]                                i_axi_app_rx_tdata,
  input      [AXI_NUM_BYTES-1:0]                                 i_axi_app_rx_tkeep,
  input                                                          i_axi_app_rx_tlast,
  input      [AXI_RX_TUSER_WIDTH-1:0]                            i_axi_app_rx_tuser, 
  
  // From PFC to User
  output                                                         o_axi_app_rx_tvalid,
  output     [AXI_DATA_WIDTH-1:0]                                o_axi_app_rx_tdata,
  output     [AXI_NUM_BYTES-1:0]                                 o_axi_app_rx_tkeep,
  output                                                         o_axi_app_rx_tlast,
  output                                                         o_axi_app_rx_tlast_segment, //bit width [NUM_SEG-1:0], NUM_SEG = 1 for SOPA
  output     [AXI_RX_TUSER_WIDTH-1:0]                            o_axi_app_rx_tuser, 
  output                                                         o_axi_app_rx_tlast_buf_pkt_truncation,
  // output     [NUM_QUEUES-1:0]                                    o_axi_app_rx_tlast_buf_pkt_truncation,
  
  //Control signal from User
  input      [NUM_QUEUES-1:0]                                    i_app_rx_eop_stall,
  
  //Control signal to MAC side
  output                                                         o_tx_pause,
  output      [8-1:0]                                            o_tx_pfc
);
  wire                                                           pfccsr_flow_control_en;
  wire                                                           pfccsr_sel;
  wire                                                           pfccsr_tx_pri_arb;
  wire                                                           pfccsr_rx_pri_arb;
  wire                                                           pfccsr_tx_stat_clear;
  wire                                                           pfccsr_rx_stat_clear;
  wire [8-1:0][2:0]                                              pfccsr_tx_th;
  wire [8-1:0][5:0]                                              pfccsr_rx_low_th;
  wire [8-1:0][5:0]                                              pfccsr_rx_high_th;
  wire [8-1:0] [15:0]                                            pfccsr_tx_buf_drop_pkt_cntr; 
  wire [8-1:0] [15:0]                                            pfccsr_rx_buf_drop_pkt_cntr; 

  wire                                                           pfccsr_cfg_flow_control_en_gui_value;

  reg  [2:0]                                                     pfccsr_wait_cntr;
  wire                                                           pfccsr_readdatavalid_tmp;
  wire                                                           pfccsr_rdreq_latch;
  wire                                                           pfccsr_wrreq_latch;

assign pfccsr_cfg_flow_control_en_gui_value = FLOW_CONTROL_EN;
assign o_axi_mac_tx_tlast_segment = '0;
assign o_axi_app_rx_tlast_segment = '0;

//***************************************************************************//
//                           PFC CSR
//***************************************************************************//

 hssi_ss_f_pfc_csr U_HSSI_SS_PFC_CSR (
  .clk                                                          (i_pfccsr_clk),
  .reset                                                        (~i_pfccsr_rst_n),
  .address                                                      (i_pfccsr_address),
  .byteenable                                                   (i_pfccsr_byteenable),
  .writedata                                                    (i_pfccsr_writedata),
  .write                                                        (i_pfccsr_write),
  .readdata                                                     (o_pfccsr_readdata),
  .read                                                         (i_pfccsr_read),
  .readdatavalid                                                (pfccsr_readdatavalid_tmp),
  .pfccsrif_control_cfg_flow_control_en                         (pfccsr_flow_control_en), 
  .pfccsrif_control_cfg_flow_control_en_gui_value               (pfccsr_cfg_flow_control_en_gui_value),
  .pfccsrif_control_cfg_pfc_sel                                 (pfccsr_sel),
  .pfccsrif_control_cfg_tx_pri_arb                              (pfccsr_tx_pri_arb),
  .pfccsrif_control_cfg_rx_pri_arb                              (pfccsr_rx_pri_arb),
  .pfccsrif_control_cfg_tx_stat_clear                           (pfccsr_tx_stat_clear),
  .pfccsrif_control_cfg_rx_stat_clear                           (pfccsr_rx_stat_clear),
  .pfccsrif_tx_threshold_queue0_cfg_tx_th                       (pfccsr_tx_th[0]),
  .pfccsrif_tx_threshold_queue1_cfg_tx_th                       (pfccsr_tx_th[1]),
  .pfccsrif_tx_threshold_queue2_cfg_tx_th                       (pfccsr_tx_th[2]),
  .pfccsrif_tx_threshold_queue3_cfg_tx_th                       (pfccsr_tx_th[3]),
  .pfccsrif_tx_threshold_queue4_cfg_tx_th                       (pfccsr_tx_th[4]),
  .pfccsrif_tx_threshold_queue5_cfg_tx_th                       (pfccsr_tx_th[5]),
  .pfccsrif_tx_threshold_queue6_cfg_tx_th                       (pfccsr_tx_th[6]),
  .pfccsrif_tx_threshold_queue7_cfg_tx_th                       (pfccsr_tx_th[7]),
  .pfccsrif_rx_threshold_queue0_cfg_rx_low_th                   (pfccsr_rx_low_th[0]),
  .pfccsrif_rx_threshold_queue1_cfg_rx_low_th                   (pfccsr_rx_low_th[1]),
  .pfccsrif_rx_threshold_queue2_cfg_rx_low_th                   (pfccsr_rx_low_th[2]),
  .pfccsrif_rx_threshold_queue3_cfg_rx_low_th                   (pfccsr_rx_low_th[3]),
  .pfccsrif_rx_threshold_queue4_cfg_rx_low_th                   (pfccsr_rx_low_th[4]),
  .pfccsrif_rx_threshold_queue5_cfg_rx_low_th                   (pfccsr_rx_low_th[5]),
  .pfccsrif_rx_threshold_queue6_cfg_rx_low_th                   (pfccsr_rx_low_th[6]),
  .pfccsrif_rx_threshold_queue7_cfg_rx_low_th                   (pfccsr_rx_low_th[7]),
  .pfccsrif_rx_threshold_queue0_cfg_rx_high_th                  (pfccsr_rx_high_th[0]),
  .pfccsrif_rx_threshold_queue1_cfg_rx_high_th                  (pfccsr_rx_high_th[1]),
  .pfccsrif_rx_threshold_queue2_cfg_rx_high_th                  (pfccsr_rx_high_th[2]),
  .pfccsrif_rx_threshold_queue3_cfg_rx_high_th                  (pfccsr_rx_high_th[3]),
  .pfccsrif_rx_threshold_queue4_cfg_rx_high_th                  (pfccsr_rx_high_th[4]),
  .pfccsrif_rx_threshold_queue5_cfg_rx_high_th                  (pfccsr_rx_high_th[5]),
  .pfccsrif_rx_threshold_queue6_cfg_rx_high_th                  (pfccsr_rx_high_th[6]),
  .pfccsrif_rx_threshold_queue7_cfg_rx_high_th                  (pfccsr_rx_high_th[7]),
  .pfccsrif_tx_stat_queue0_drop_pkt_cntr_i                      (pfccsr_tx_buf_drop_pkt_cntr[0]),
  .pfccsrif_tx_stat_queue1_drop_pkt_cntr_i                      (pfccsr_tx_buf_drop_pkt_cntr[1]),
  .pfccsrif_tx_stat_queue2_drop_pkt_cntr_i                      (pfccsr_tx_buf_drop_pkt_cntr[2]),
  .pfccsrif_tx_stat_queue3_drop_pkt_cntr_i                      (pfccsr_tx_buf_drop_pkt_cntr[3]),
  .pfccsrif_tx_stat_queue4_drop_pkt_cntr_i                      (pfccsr_tx_buf_drop_pkt_cntr[4]),
  .pfccsrif_tx_stat_queue5_drop_pkt_cntr_i                      (pfccsr_tx_buf_drop_pkt_cntr[5]),
  .pfccsrif_tx_stat_queue6_drop_pkt_cntr_i                      (pfccsr_tx_buf_drop_pkt_cntr[6]),
  .pfccsrif_tx_stat_queue7_drop_pkt_cntr_i                      (pfccsr_tx_buf_drop_pkt_cntr[7]),
  .pfccsrif_rx_stat_queue0_drop_pkt_cntr_i                      (pfccsr_rx_buf_drop_pkt_cntr[0]),
  .pfccsrif_rx_stat_queue1_drop_pkt_cntr_i                      (pfccsr_rx_buf_drop_pkt_cntr[1]),
  .pfccsrif_rx_stat_queue2_drop_pkt_cntr_i                      (pfccsr_rx_buf_drop_pkt_cntr[2]),
  .pfccsrif_rx_stat_queue3_drop_pkt_cntr_i                      (pfccsr_rx_buf_drop_pkt_cntr[3]),
  .pfccsrif_rx_stat_queue4_drop_pkt_cntr_i                      (pfccsr_rx_buf_drop_pkt_cntr[4]),
  .pfccsrif_rx_stat_queue5_drop_pkt_cntr_i                      (pfccsr_rx_buf_drop_pkt_cntr[5]),
  .pfccsrif_rx_stat_queue6_drop_pkt_cntr_i                      (pfccsr_rx_buf_drop_pkt_cntr[6]),
  .pfccsrif_rx_stat_queue7_drop_pkt_cntr_i                      (pfccsr_rx_buf_drop_pkt_cntr[7])
);

generate
genvar i;
if(NUM_QUEUES < 8)
begin : CNTR_DIS_QUEUES
  for (i=NUM_QUEUES; i<8; i=i+1)
  begin : DIS_QUEUES
    assign pfccsr_tx_buf_drop_pkt_cntr[i] = 16'd0;
    assign pfccsr_rx_buf_drop_pkt_cntr[i] = 16'd0;
    assign o_tx_pfc[i] = 1'b0;
  end
end
endgenerate  

generate if (BUFFER_EN)
begin : PFC_BUFFER_ENABLE
hssi_ss_f_pfc_sopa_tx #(
  .AXI_DATA_WIDTH                                               (AXI_DATA_WIDTH),    
  .AXI_NUM_BYTES                                                (AXI_NUM_BYTES),     
  .AXI_TUSER_WIDTH                                              (AXI_TX_TUSER_WIDTH),    
  .AXI_READY_LATENCY                                            (AXI_READY_LATENCY),    
  .NUM_QUEUES                                                   (NUM_QUEUES),    
  .QUEUE_WIDTH                                                  (QUEUE_WIDTH),    
  .TX_QUEUE_SIZE                                                (TX_QUEUE_SIZE),    
  .TX_QUEUE_WIDTH                                               (TX_QUEUE_WIDTH),    
  //.ENABLE_ECC                                                   (ENABLE_ECC),    
  .PREAMBLE_EN                                                  (PREAMBLE_EN),    
  .SIM_EMULATE                                                  (SIM_EMULATE)    
) U_hssi_ss_f_pfc_sopa_tx (
  .i_reconfig_clk                                               (i_pfccsr_clk),
  .i_reconfig_read                                              (i_pfccsr_read),
  .i_reconfig_address                                           (i_pfccsr_address),
  .i_rdreq_latch                                                (pfccsr_rdreq_latch),
  .i_wrreq_latch                                                (pfccsr_wrreq_latch),
  
  // .i_pause_pfc_sel                                              (1'b1),
  // .i_flow_cntrol_en                                             (1'b1), 
  // .i_pfc_tx_arb_sel                                             (1'b0),
  // .i_pfc_tx_th_cfg                                              ('d4),
  // .i_pfc_tx_stat_clear                                          (1'd0),
  // .i_preamble_pass_thr_en                                       (1'd0),

  .i_pause_pfc_sel                                              (pfccsr_sel),
  .i_flow_cntrol_en                                             (pfccsr_flow_control_en), 
  .i_pfc_tx_arb_sel                                             (pfccsr_tx_pri_arb),
  .i_pfc_tx_th_cfg                                              (pfccsr_tx_th),
  .i_pfc_tx_stat_clear                                          (pfccsr_tx_stat_clear),
  .i_preamble_pass_thr_en                                       (i_tx_preamble_pass_thr_en),

  .i_tx_clk                                                     (i_tx_clk), 
  .i_tx_rst_n                                                   (i_tx_rst_n),
  
  .o_axi_app_tx_tready                                          (o_axi_app_tx_tready),
  .i_axi_app_tx_tvalid                                          (i_axi_app_tx_tvalid),
  .i_axi_app_tx_tdata                                           (i_axi_app_tx_tdata),
  .i_axi_app_tx_tkeep                                           (i_axi_app_tx_tkeep),
  .i_axi_app_tx_tlast                                           (i_axi_app_tx_tlast),
  .i_axi_app_tx_tuser                                           (i_axi_app_tx_tuser), 
  
  .i_axi_mac_tx_tready                                          (i_axi_mac_tx_tready),
  .o_axi_mac_tx_tdata                                           (o_axi_mac_tx_tdata), 
  .o_axi_mac_tx_tkeep                                           (o_axi_mac_tx_tkeep), 
  .o_axi_mac_tx_tlast                                           (o_axi_mac_tx_tlast), 
  .o_axi_mac_tx_tvalid                                          (o_axi_mac_tx_tvalid),
  .o_axi_mac_tx_ttrunc                                          (o_axi_mac_tx_ttrunc),
  .o_axi_mac_tx_tuser                                           (o_axi_mac_tx_tuser), 
  
  .o_app_tx_queue_level                                         (o_app_tx_queue_level),
  
  .i_rx_pfc                                                     (i_rx_pfc), 
  .i_rx_pause                                                   (i_rx_pause),  
  
  .o_tx_buf_drop_pkt_cntr                                       (pfccsr_tx_buf_drop_pkt_cntr)
);
end
else begin : PFC_BUFFER_DISABLE
   assign o_axi_mac_tx_tdata          = i_axi_app_tx_tdata;
   assign o_axi_mac_tx_tkeep          = i_axi_app_tx_tkeep;
   assign o_axi_mac_tx_tlast          = i_axi_app_tx_tlast;
   assign o_axi_mac_tx_tvalid         = i_axi_app_tx_tvalid;
   assign o_axi_mac_tx_tuser          = i_axi_app_tx_tuser;
   assign o_axi_app_tx_tready         = i_axi_mac_tx_tready;
   assign o_axi_mac_tx_ttrunc         = 1'b0;
   assign o_app_tx_queue_level        = 'd0;
   assign pfccsr_tx_buf_drop_pkt_cntr = 'd0;
end
endgenerate

hssi_ss_f_pfc_sopa_rx #(
  .AXI_DATA_WIDTH                                               (AXI_DATA_WIDTH),    
  .AXI_NUM_BYTES                                                (AXI_NUM_BYTES),     
  .AXI_TUSER_WIDTH                                              (AXI_RX_TUSER_WIDTH),    
  .AXI_READY_LATENCY                                            (AXI_READY_LATENCY),//TODO    
  .NUM_QUEUES                                                   (NUM_QUEUES),    
  .QUEUE_WIDTH                                                  (QUEUE_WIDTH),    
  .RX_QUEUE_SIZE                                                (RX_QUEUE_SIZE),    
  .RX_QUEUE_WIDTH                                               (RX_QUEUE_WIDTH),    
  //.ENABLE_ECC                                                   (ENABLE_ECC),    
  .PREAMBLE_EN                                                  (PREAMBLE_EN),    
  .SIM_EMULATE                                                  (SIM_EMULATE)    
) U_hssi_ss_f_pfc_sopa_rx (
  .i_reconfig_clk                                               (i_pfccsr_clk),
  .i_reconfig_read                                              (i_pfccsr_read),
  .i_reconfig_address                                           (i_pfccsr_address),
  .i_rdreq_latch                                                (pfccsr_rdreq_latch),
  .i_wrreq_latch                                                (pfccsr_wrreq_latch),
  
  .i_pause_pfc_sel                                              (pfccsr_sel),
  .i_flow_cntrol_en                                             (pfccsr_flow_control_en), 
  .i_pfc_rx_arb_sel                                             (pfccsr_rx_pri_arb),
  .i_pfc_rx_high_th_cfg                                         (pfccsr_rx_high_th),
  .i_pfc_rx_low_th_cfg                                          (pfccsr_rx_low_th),
  .i_pfc_rx_stat_clear                                          (pfccsr_rx_stat_clear),
  .i_preamble_pass_thr_en                                       (i_rx_preamble_pass_thr_en),  
  
  .i_rx_clk                                                     (i_rx_clk), 
  .i_rx_rst_n                                                   (i_rx_rst_n),
  
  .i_axi_app_rx_tvalid                                          (i_axi_app_rx_tvalid),
  .i_axi_app_rx_tdata                                           (i_axi_app_rx_tdata),
  .i_axi_app_rx_tuser                                           (i_axi_app_rx_tuser),
  .i_axi_app_rx_tkeep                                           (i_axi_app_rx_tkeep),
  .i_axi_app_rx_tlast                                           (i_axi_app_rx_tlast),
  
  .o_axi_app_rx_tvalid                                          (o_axi_app_rx_tvalid),
  .o_axi_app_rx_tdata                                           (o_axi_app_rx_tdata),
  .o_axi_app_rx_tuser                                           (o_axi_app_rx_tuser),
  .o_axi_app_rx_tkeep                                           (o_axi_app_rx_tkeep),
  .o_axi_app_rx_tlast                                           (o_axi_app_rx_tlast),
  .o_axi_app_rx_tlast_buf_pkt_truncation                        (o_axi_app_rx_tlast_buf_pkt_truncation),
  
  .i_app_rx_eop_stall                                           (i_app_rx_eop_stall),
  
  .o_tx_pfc                                                     (o_tx_pfc),
  .o_tx_pause                                                   (o_tx_pause),
  
  .o_rx_buf_drop_pkt_cntr                                       (pfccsr_rx_buf_drop_pkt_cntr)
);

//*********************************************************************************
// -- PFC CSR Waitrequest Control
//*********************************************************************************
assign pfccsr_rdreq_latch = o_pfccsr_waitrequest && i_pfccsr_read;
assign pfccsr_wrreq_latch = o_pfccsr_waitrequest && i_pfccsr_write;

always @(posedge i_pfccsr_clk or negedge i_pfccsr_rst_n)
begin
  if(~i_pfccsr_rst_n)
    pfccsr_wait_cntr <= 3'd0;
  else if(i_pfccsr_write || i_pfccsr_read)
    pfccsr_wait_cntr <= pfccsr_wait_cntr + 3'd1;
  else
    pfccsr_wait_cntr <= 3'd0;
end

always @(posedge i_pfccsr_clk or negedge i_pfccsr_rst_n)
begin
  if(~i_pfccsr_rst_n)
    o_pfccsr_waitrequest <= 1'b1;
  else if((pfccsr_wait_cntr == 'd6) && i_pfccsr_write)
    o_pfccsr_waitrequest <= 1'b0;
  else if((pfccsr_wait_cntr == 'd6) && i_pfccsr_read)
    o_pfccsr_waitrequest <= 1'b0;
  else
    o_pfccsr_waitrequest <= 1'b1;
end

always @(posedge i_pfccsr_clk)
begin
  o_pfccsr_readdatavalid <= (pfccsr_wait_cntr == 'd7) && i_pfccsr_read;
end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6yt2ttCu4MiShHb8ct+ES9ik2QnD88Ce6kzOjb+XXtR8ygegQ03pyOW+1nZLbpzPsxNsCU48kmV67hICG17gG2lUFGU7izyNydfe8uqNjCz0VHxwC80TtZTYzzIPAovfQoXjiVaibGHVeySvFfOv45oHwGdfwTDyJ0SMglz3rDw1hDEAUIo7fbw1vgNaljVSVIDYCYs5qeuKpy5l2HnW8b4UuZ27jXxcUl7cZQ/H9LqpfpuavKPDqy7DmplO1GPliX8rWvODDs47laDy+GSroaQYTh0QoySgpEUGkdy8zRlq7APntVzvlvP1O9t4Q7Y7fz2ZC4QIwVHu8qDcQwDj4UvupA3H7EE9uM2MToPyCrWaACUFhxtscSZsM15sptc0DYfIPBGfkSDCLLyPinF/OZoGIa0gxdv+YjsYdHpEj+LkGnUBuDiZrch0WWd72tMFpzbu+QLrHQfhwse7rfW4H7FR8bekqNs4TKRhpWZaa1nMejeYXnawBbt1rsNQuuzdxuLrRXNIPsWMwBUR1eL+33fWqWH50e6b7BY8EvM3NTYpL5VWyFJSHZu0wRxmzuY/KxzfCvgcl83r69E7jI6jwtZ2miwkGR+/wEjLlP+A+dl07mrJOlqRHuaiuoz9PvMnXgivuTnuAeffLRKnJWXMjnWuOLoBYQl0A3pb+ymBF3sYaiym3vfR7SIADOJkr9d76DNwCYWO0itUKd0CBaeQ6P8N4HrTAhLjJT8+Pd2N+Qp/jSBVjU0ir1noqSOxy1FB2t3lD+xIeW8zLT1cH1VM0jgO"
`endif