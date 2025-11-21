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
// Module            : Reset sequencer wrapper
// Description       : 
// Author            : 
// Created           : 
// Changes           : 
//                   : 
// ==========================================================================
//
//
module hssi_ss_reset_sequencer_wctteii #(
  parameter [23:0] SUBSYSTEM_RST_ACK_DEASSERT_DELAY = 24'h00C000,
  parameter [23:0] TX_RST_ACK_DEASSERT_DELAY = 24'h002000,
  parameter [23:0] RX_RST_ACK_DEASSERT_DELAY = 24'h002000,
  parameter NUM_PORTS = 0, //Numer of enabled ports
  parameter NUM_DR_PORTS = 0 //Numer of DR enabled ports
)(
  input                       i_p0_app_ss_st_client_clk,      // AXI ST Bridge Clock Input
  input                       i_p0_app_ss_st_clk,             //
  input                       i_p0_clk_rx,                    // QHIp Rx Clock Input
  input                       i_p0_clk_tx,                    // QHIP Tx Clock Input
  input                       i_p0_rx_rst_n,                  // QHIP Rx Reset, Active Low
  input                       i_p0_tx_rst_n,                  // QHIP Tx Reset, Active Low
  input                       i_p0_app_ss_st_client_areset_n, // AXI ST Bridge Clock Input
  input                       i_p0_app_ss_st_areset_n,        //
  output                      o_p0_axi_st_bridge_rx_rst_n,    // AXI ST Rx Bridge Reset, Active low
  output                      o_p0_axi_st_bridge_tx_rst_n,    // AXI ST Tx Bridge Reset, Active low
  output                      o_p0_rx_rst_n,                  // QHIP Rx Reset, Active Low
  output                      o_p0_rx_rst_ack_n,              // QHIP Rx Reset Ack, Active Low
  output                      o_p0_tx_rst_n,                  // QHIP Tx Reset, Active Low
  output                      o_p0_tx_rst_ack_n,              // QHIP Tx Reset Ack, Active Low
  output                      o_p0_csr_rst_n,                 // QHIP CSR Reset, Active Low
  output                      o_p0_ereset_n,

  input                       i_p0_pio_axi_st_bridge_rst_n,   // PIO_0 from NIOS
  input                       i_p0_pio_ehip_tx_rst_n,         // PIO_1 from NIOS
  input                       i_p0_pio_ehip_rx_rst_n,         // PIO_2 from NIOS
  input                       i_p0_pio_ereset_n,              // PIO_3 from NIOS

  output                      o_p0_reconfig_rst,              // QHIP Reconfig Reset, Active High
  
  input                       i_p1_app_ss_st_client_clk,      // AXI ST Bridge Clock Input
  input                       i_p1_app_ss_st_clk,             //
  input                       i_p1_clk_rx,                    // QHIp Rx Clock Input
  input                       i_p1_clk_tx,                    // QHIP Tx Clock Input
  input                       i_p1_rx_rst_n,                  // QHIP Rx Reset, Active Low
  input                       i_p1_tx_rst_n,                  // QHIP Tx Reset, Active Low
  input                       i_p1_app_ss_st_client_areset_n, // AXI ST Bridge Clock Input
  input                       i_p1_app_ss_st_areset_n,        //
  output                      o_p1_axi_st_bridge_rx_rst_n,    // AXI ST Rx Bridge Reset, Active low
  output                      o_p1_axi_st_bridge_tx_rst_n,    // AXI ST Tx Bridge Reset, Active low
  output                      o_p1_rx_rst_n,                  // QHIP Rx Reset, Active Low
  output                      o_p1_rx_rst_ack_n,              // QHIP Rx Reset Ack, Active Low
  output                      o_p1_tx_rst_n,                  // QHIP Tx Reset, Active Low
  output                      o_p1_tx_rst_ack_n,              // QHIP Tx Reset Ack, Active Low
  output                      o_p1_csr_rst_n,                 // QHIP CSR Reset, Active Low
  output                      o_p1_ereset_n,

  input                       i_p1_pio_axi_st_bridge_rst_n,   // PIO_0 from NIOS
  input                       i_p1_pio_ehip_tx_rst_n,         // PIO_1 from NIOS
  input                       i_p1_pio_ehip_rx_rst_n,         // PIO_2 from NIOS
  input                       i_p1_pio_ereset_n,              // PIO_3 from NIOS

  output                      o_p1_reconfig_rst,              // QHIP Reconfig Reset, Active High
  
  input                       i_p2_app_ss_st_client_clk,      // AXI ST Bridge Clock Input
  input                       i_p2_app_ss_st_clk,             //
  input                       i_p2_clk_rx,                    // QHIp Rx Clock Input
  input                       i_p2_clk_tx,                    // QHIP Tx Clock Input
  input                       i_p2_rx_rst_n,                  // QHIP Rx Reset, Active Low
  input                       i_p2_tx_rst_n,                  // QHIP Tx Reset, Active Low
  input                       i_p2_app_ss_st_client_areset_n, // AXI ST Bridge Clock Input
  input                       i_p2_app_ss_st_areset_n,        //
  output                      o_p2_axi_st_bridge_rx_rst_n,    // AXI ST Rx Bridge Reset, Active low
  output                      o_p2_axi_st_bridge_tx_rst_n,    // AXI ST Tx Bridge Reset, Active low
  output                      o_p2_rx_rst_n,                  // QHIP Rx Reset, Active Low
  output                      o_p2_rx_rst_ack_n,              // QHIP Rx Reset Ack, Active Low
  output                      o_p2_tx_rst_n,                  // QHIP Tx Reset, Active Low
  output                      o_p2_tx_rst_ack_n,              // QHIP Tx Reset Ack, Active Low
  output                      o_p2_csr_rst_n,                 // QHIP CSR Reset, Active Low
  output                      o_p2_ereset_n,

  input                       i_p2_pio_axi_st_bridge_rst_n,   // PIO_0 from NIOS
  input                       i_p2_pio_ehip_tx_rst_n,         // PIO_1 from NIOS
  input                       i_p2_pio_ehip_rx_rst_n,         // PIO_2 from NIOS
  input                       i_p2_pio_ereset_n,              // PIO_3 from NIOS

  output                      o_p2_reconfig_rst,              // QHIP Reconfig Reset, Active High
  
  input                       i_p3_app_ss_st_client_clk,      // AXI ST Bridge Clock Input
  input                       i_p3_app_ss_st_clk,             //
  input                       i_p3_clk_rx,                    // QHIp Rx Clock Input
  input                       i_p3_clk_tx,                    // QHIP Tx Clock Input
  input                       i_p3_rx_rst_n,                  // QHIP Rx Reset, Active Low
  input                       i_p3_tx_rst_n,                  // QHIP Tx Reset, Active Low
  input                       i_p3_app_ss_st_client_areset_n, // AXI ST Bridge Clock Input
  input                       i_p3_app_ss_st_areset_n,        //
  output                      o_p3_axi_st_bridge_rx_rst_n,    // AXI ST Rx Bridge Reset, Active low
  output                      o_p3_axi_st_bridge_tx_rst_n,    // AXI ST Tx Bridge Reset, Active low
  output                      o_p3_rx_rst_n,                  // QHIP Rx Reset, Active Low
  output                      o_p3_rx_rst_ack_n,              // QHIP Rx Reset Ack, Active Low
  output                      o_p3_tx_rst_n,                  // QHIP Tx Reset, Active Low
  output                      o_p3_tx_rst_ack_n,              // QHIP Tx Reset Ack, Active Low
  output                      o_p3_csr_rst_n,                 // QHIP CSR Reset, Active Low
  output                      o_p3_ereset_n,

  input                       i_p3_pio_axi_st_bridge_rst_n,   // PIO_0 from NIOS
  input                       i_p3_pio_ehip_tx_rst_n,         // PIO_1 from NIOS
  input                       i_p3_pio_ehip_rx_rst_n,         // PIO_2 from NIOS
  input                       i_p3_pio_ereset_n,              // PIO_3 from NIOS

  output                      o_p3_reconfig_rst,              // QHIP Reconfig Reset, Active High
  

  input                       i_subsystem_cold_rst_n,         // Subsystem cold reset input, Active Low
  output                      o_subsystem_cold_rst_ack_n,     // Subsystem cold reset ack, Active Low
  input                       i_app_ss_lite_clk,              // AXI Lite bridge Clock Input
  input                       i_app_ss_lite_areset_n,         // AXI Lite bridge Reset Input
  input                       i_nios_clk,                     // NIOS Clock Input
  output                      o_axi_lite_bridge_rst_n,        // AXI Lite bridge Reset, Active Low
  //output                      o_ss_csr_rst_n,                 // Subsystem CSR Reset, Active low
  output                      o_nios_rst_n                    // NIOS Reset, Active Low
);

  //----------------------------------------
  // Parameters
  //----------------------------------------
                           
  localparam DLY_COUNTWIDTH = 24;
  localparam NUM_RESPONDERS = (NUM_PORTS*8) + (NUM_DR_PORTS*8) + 2;  // i_rx_rst_n, i_tx_rst_n, app_ss_st_client_areset_n, app_ss_st_areset_n, pio_axi_st_bridge, pio_ehip_tx, pio_ehip_rx, pio_ereset,
                                                // i_subsystem_cold_rst_n, app_ss_lite_areset_n

  localparam NUM_INITIATORS = (NUM_PORTS*7) + (NUM_DR_PORTS*7) + 3;  // o_rx_rst_n, o_rx_rst_n, o_axi_st_bridge_rx_rst_n, o_axi_st_bridge_tx_rst_n, o_csr_rst_n, o_ereset_n, o_reconfig_rst,
                                                // o_axi_lite_bridge_rst_n, o_ss_csr_rst_n, o_nios_rst_n
  localparam ONE = {{(NUM_RESPONDERS-1){1'b0}},1'b1};
  localparam [NUM_RESPONDERS-1:0]INIT_RESP_IN_EN_PATTERN[NUM_INITIATORS-1:0] = {
                                   (ONE<<(NUM_RESPONDERS-2))                            // INIT_RESP_IN_EN_PATTERN for o_nios_rst_n
                                  ,(ONE<<(NUM_RESPONDERS-2))                            // INIT_RESP_IN_EN_PATTERN for o_ss_csr_rst_n
                                  ,(ONE<<(NUM_RESPONDERS-2)) | (ONE<<(NUM_RESPONDERS-1))  // INIT_RESP_IN_EN_PATTERN for o_axi_lite_bridge_rst_n
                                  ,(ONE<<(NUM_RESPONDERS-2)) | (ONE<<(NUM_RESPONDERS-1))       // INIT_RESP_IN_EN_PATTERN for o_p3_reconfig_rst
                                  ,(ONE<<31)                                           // INIT_RESP_IN_EN_PATTERN for o_p3_ereset_n
                                  ,(ONE<<(NUM_RESPONDERS-2))               // INIT_RESP_IN_EN_PATTERN for o_p3_csr_rst_n
                                  ,(ONE<<25) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<26) | (ONE<<28)  // INIT_RESP_IN_EN_PATTERN for o_p3_axi_st_bridge_tx_rst_n
                                  ,(ONE<<24) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<27) | (ONE<<28)  // INIT_RESP_IN_EN_PATTERN for o_p3_axi_st_bridge_rx_rst_n
                                  ,(ONE<<25) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<29)         // INIT_RESP_IN_EN_PATTERN for o_p3_tx_rst_n
                                  ,(ONE<<24) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<30)         // INIT_RESP_IN_EN_PATTERN for o_p3_rx_rst_n
                                  ,(ONE<<(NUM_RESPONDERS-2)) | (ONE<<(NUM_RESPONDERS-1))       // INIT_RESP_IN_EN_PATTERN for o_p2_reconfig_rst
                                  ,(ONE<<23)                                           // INIT_RESP_IN_EN_PATTERN for o_p2_ereset_n
                                  ,(ONE<<(NUM_RESPONDERS-2))               // INIT_RESP_IN_EN_PATTERN for o_p2_csr_rst_n
                                  ,(ONE<<17) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<18) | (ONE<<20)  // INIT_RESP_IN_EN_PATTERN for o_p2_axi_st_bridge_tx_rst_n
                                  ,(ONE<<16) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<19) | (ONE<<20)  // INIT_RESP_IN_EN_PATTERN for o_p2_axi_st_bridge_rx_rst_n
                                  ,(ONE<<17) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<21)         // INIT_RESP_IN_EN_PATTERN for o_p2_tx_rst_n
                                  ,(ONE<<16) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<22)         // INIT_RESP_IN_EN_PATTERN for o_p2_rx_rst_n
                                  ,(ONE<<(NUM_RESPONDERS-2)) | (ONE<<(NUM_RESPONDERS-1))       // INIT_RESP_IN_EN_PATTERN for o_p1_reconfig_rst
                                  ,(ONE<<15)                                           // INIT_RESP_IN_EN_PATTERN for o_p1_ereset_n
                                  ,(ONE<<(NUM_RESPONDERS-2))               // INIT_RESP_IN_EN_PATTERN for o_p1_csr_rst_n
                                  ,(ONE<<9) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<10) | (ONE<<12)  // INIT_RESP_IN_EN_PATTERN for o_p1_axi_st_bridge_tx_rst_n
                                  ,(ONE<<8) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<11) | (ONE<<12)  // INIT_RESP_IN_EN_PATTERN for o_p1_axi_st_bridge_rx_rst_n
                                  ,(ONE<<9) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<13)         // INIT_RESP_IN_EN_PATTERN for o_p1_tx_rst_n
                                  ,(ONE<<8) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<14)         // INIT_RESP_IN_EN_PATTERN for o_p1_rx_rst_n
                                  ,(ONE<<(NUM_RESPONDERS-2)) | (ONE<<(NUM_RESPONDERS-1))       // INIT_RESP_IN_EN_PATTERN for o_p0_reconfig_rst
                                  ,(ONE<<7)                                           // INIT_RESP_IN_EN_PATTERN for o_p0_ereset_n
                                  ,(ONE<<(NUM_RESPONDERS-2))               // INIT_RESP_IN_EN_PATTERN for o_p0_csr_rst_n
                                  ,(ONE<<1) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<2) | (ONE<<4)  // INIT_RESP_IN_EN_PATTERN for o_p0_axi_st_bridge_tx_rst_n
                                  ,(ONE<<0) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<3) | (ONE<<4)  // INIT_RESP_IN_EN_PATTERN for o_p0_axi_st_bridge_rx_rst_n
                                  ,(ONE<<1) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<5)         // INIT_RESP_IN_EN_PATTERN for o_p0_tx_rst_n
                                  ,(ONE<<0) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<6)         // INIT_RESP_IN_EN_PATTERN for o_p0_rx_rst_n
                                  };

  localparam [DLY_COUNTWIDTH-1:0]RESP_ACK_ASSERT_DELAY_CYCLE_COUNT[NUM_RESPONDERS-1:0] = '{default:32};
  localparam [DLY_COUNTWIDTH-1:0]RESP_ACK_DEASSERT_DELAY_CYCLE_COUNT[NUM_RESPONDERS-1:0] = {
                                   24'd32       // Delay for app_ss_lite_areset_n
                                  ,SUBSYSTEM_RST_ACK_DEASSERT_DELAY     // Delay for i_subsystem_cold_rst_n
                                  ,24'd32       // Delay for i_p3_pio_ereset_n
                                  ,24'd32       // Delay for i_p3_pio_ehip_rx_rst_n
                                  ,24'd32       // Delay for i_p3_pio_ehip_tx_rst_n
                                  ,24'd32       // Delay for i_p3_pio_axi_st_bridge_rst_n
                                  ,24'd32       // Delay for i_p3_app_ss_st_areset_n
                                  ,24'd32       // Delay for i_p3_app_ss_st_client_areset_n
                                  ,TX_RST_ACK_DEASSERT_DELAY // Delay for i_3_tx_rstn
                                  ,RX_RST_ACK_DEASSERT_DELAY // Delay for i_3_rx_rstn
                                  ,24'd32       // Delay for i_p2_pio_ereset_n
                                  ,24'd32       // Delay for i_p2_pio_ehip_rx_rst_n
                                  ,24'd32       // Delay for i_p2_pio_ehip_tx_rst_n
                                  ,24'd32       // Delay for i_p2_pio_axi_st_bridge_rst_n
                                  ,24'd32       // Delay for i_p2_app_ss_st_areset_n
                                  ,24'd32       // Delay for i_p2_app_ss_st_client_areset_n
                                  ,TX_RST_ACK_DEASSERT_DELAY // Delay for i_2_tx_rstn
                                  ,RX_RST_ACK_DEASSERT_DELAY // Delay for i_2_rx_rstn
                                  ,24'd32       // Delay for i_p1_pio_ereset_n
                                  ,24'd32       // Delay for i_p1_pio_ehip_rx_rst_n
                                  ,24'd32       // Delay for i_p1_pio_ehip_tx_rst_n
                                  ,24'd32       // Delay for i_p1_pio_axi_st_bridge_rst_n
                                  ,24'd32       // Delay for i_p1_app_ss_st_areset_n
                                  ,24'd32       // Delay for i_p1_app_ss_st_client_areset_n
                                  ,TX_RST_ACK_DEASSERT_DELAY // Delay for i_1_tx_rstn
                                  ,RX_RST_ACK_DEASSERT_DELAY // Delay for i_1_rx_rstn
                                  ,24'd32       // Delay for i_p0_pio_ereset_n
                                  ,24'd32       // Delay for i_p0_pio_ehip_rx_rst_n
                                  ,24'd32       // Delay for i_p0_pio_ehip_tx_rst_n
                                  ,24'd32       // Delay for i_p0_pio_axi_st_bridge_rst_n
                                  ,24'd32       // Delay for i_p0_app_ss_st_areset_n
                                  ,24'd32       // Delay for i_p0_app_ss_st_client_areset_n
                                  ,TX_RST_ACK_DEASSERT_DELAY // Delay for i_0_tx_rstn
                                  ,RX_RST_ACK_DEASSERT_DELAY // Delay for i_0_rx_rstn
                                 }; 
                                 
  
  //----------------------------------------
  // Signals
  //----------------------------------------
  
  wire w_p0_rx_rst_ack_n;
  wire w_p0_tx_rst_ack_n;
  wire w_p0_rx_rst_n;
  wire w_p0_tx_rst_n;
  wire w_p0_axi_st_bridge_rx_rst_n;
  wire w_p0_axi_st_bridge_tx_rst_n;
  wire w_p0_csr_rst_n;
  wire w_p0_ereset_n;
  wire w_p0_reconfig_rst;
  wire w_p1_rx_rst_ack_n;
  wire w_p1_tx_rst_ack_n;
  wire w_p1_rx_rst_n;
  wire w_p1_tx_rst_n;
  wire w_p1_axi_st_bridge_rx_rst_n;
  wire w_p1_axi_st_bridge_tx_rst_n;
  wire w_p1_csr_rst_n;
  wire w_p1_ereset_n;
  wire w_p1_reconfig_rst;
  wire w_p2_rx_rst_ack_n;
  wire w_p2_tx_rst_ack_n;
  wire w_p2_rx_rst_n;
  wire w_p2_tx_rst_n;
  wire w_p2_axi_st_bridge_rx_rst_n;
  wire w_p2_axi_st_bridge_tx_rst_n;
  wire w_p2_csr_rst_n;
  wire w_p2_ereset_n;
  wire w_p2_reconfig_rst;
  wire w_p3_rx_rst_ack_n;
  wire w_p3_tx_rst_ack_n;
  wire w_p3_rx_rst_n;
  wire w_p3_tx_rst_n;
  wire w_p3_axi_st_bridge_rx_rst_n;
  wire w_p3_axi_st_bridge_tx_rst_n;
  wire w_p3_csr_rst_n;
  wire w_p3_ereset_n;
  wire w_p3_reconfig_rst;
  wire w_subsystem_cold_rst_ack_n;
  wire csr_common_rst_n;
  wire w_axi_lite_bridge_rst_n;
  wire w_ss_csr_rst_n;
  wire w_nios_rst_n;
  wire [NUM_RESPONDERS-1:0] resp_reset_n;
  wire [NUM_RESPONDERS-1:0] resp_reset_ack_n;
  wire [NUM_INITIATORS-1:0] init_reset_n;
  genvar i;

  //----------------------------------------
  // SS_RST_SEQ decode
  //----------------------------------------
  
  assign resp_reset_n[0] = i_p0_rx_rst_n;
  assign resp_reset_n[1] = i_p0_tx_rst_n;
  assign resp_reset_n[2] = i_p0_app_ss_st_client_areset_n;
  assign resp_reset_n[3] = i_p0_app_ss_st_areset_n;
  assign resp_reset_n[4] = i_p0_pio_axi_st_bridge_rst_n;
  assign resp_reset_n[5] = i_p0_pio_ehip_tx_rst_n;
  assign resp_reset_n[6] = i_p0_pio_ehip_rx_rst_n;
  assign resp_reset_n[7] = i_p0_pio_ereset_n;
  
  assign w_p0_rx_rst_ack_n  = resp_reset_ack_n[0];
  assign w_p0_tx_rst_ack_n  = resp_reset_ack_n[1];
  
  assign w_p0_rx_rst_n      = init_reset_n[0];
  assign w_p0_tx_rst_n      = init_reset_n[1];
  assign w_p0_axi_st_bridge_rx_rst_n = init_reset_n[2];
  assign w_p0_axi_st_bridge_tx_rst_n = init_reset_n[3];
  assign w_p0_csr_rst_n     = init_reset_n[4];
  assign w_p0_ereset_n      = init_reset_n[5];
  assign w_p0_reconfig_rst  = init_reset_n[6];
  assign resp_reset_n[8] = i_p1_rx_rst_n;
  assign resp_reset_n[9] = i_p1_tx_rst_n;
  assign resp_reset_n[10] = i_p1_app_ss_st_client_areset_n;
  assign resp_reset_n[11] = i_p1_app_ss_st_areset_n;
  assign resp_reset_n[12] = i_p1_pio_axi_st_bridge_rst_n;
  assign resp_reset_n[13] = i_p1_pio_ehip_tx_rst_n;
  assign resp_reset_n[14] = i_p1_pio_ehip_rx_rst_n;
  assign resp_reset_n[15] = i_p1_pio_ereset_n;
  
  assign w_p1_rx_rst_ack_n  = resp_reset_ack_n[8];
  assign w_p1_tx_rst_ack_n  = resp_reset_ack_n[9];
  
  assign w_p1_rx_rst_n      = init_reset_n[7];
  assign w_p1_tx_rst_n      = init_reset_n[8];
  assign w_p1_axi_st_bridge_rx_rst_n = init_reset_n[9];
  assign w_p1_axi_st_bridge_tx_rst_n = init_reset_n[10];
  assign w_p1_csr_rst_n     = init_reset_n[11];
  assign w_p1_ereset_n      = init_reset_n[12];
  assign w_p1_reconfig_rst  = init_reset_n[13];
  assign resp_reset_n[16] = i_p2_rx_rst_n;
  assign resp_reset_n[17] = i_p2_tx_rst_n;
  assign resp_reset_n[18] = i_p2_app_ss_st_client_areset_n;
  assign resp_reset_n[19] = i_p2_app_ss_st_areset_n;
  assign resp_reset_n[20] = i_p2_pio_axi_st_bridge_rst_n;
  assign resp_reset_n[21] = i_p2_pio_ehip_tx_rst_n;
  assign resp_reset_n[22] = i_p2_pio_ehip_rx_rst_n;
  assign resp_reset_n[23] = i_p2_pio_ereset_n;
  
  assign w_p2_rx_rst_ack_n  = resp_reset_ack_n[16];
  assign w_p2_tx_rst_ack_n  = resp_reset_ack_n[17];
  
  assign w_p2_rx_rst_n      = init_reset_n[14];
  assign w_p2_tx_rst_n      = init_reset_n[15];
  assign w_p2_axi_st_bridge_rx_rst_n = init_reset_n[16];
  assign w_p2_axi_st_bridge_tx_rst_n = init_reset_n[17];
  assign w_p2_csr_rst_n     = init_reset_n[18];
  assign w_p2_ereset_n      = init_reset_n[19];
  assign w_p2_reconfig_rst  = init_reset_n[20];
  assign resp_reset_n[24] = i_p3_rx_rst_n;
  assign resp_reset_n[25] = i_p3_tx_rst_n;
  assign resp_reset_n[26] = i_p3_app_ss_st_client_areset_n;
  assign resp_reset_n[27] = i_p3_app_ss_st_areset_n;
  assign resp_reset_n[28] = i_p3_pio_axi_st_bridge_rst_n;
  assign resp_reset_n[29] = i_p3_pio_ehip_tx_rst_n;
  assign resp_reset_n[30] = i_p3_pio_ehip_rx_rst_n;
  assign resp_reset_n[31] = i_p3_pio_ereset_n;
  
  assign w_p3_rx_rst_ack_n  = resp_reset_ack_n[24];
  assign w_p3_tx_rst_ack_n  = resp_reset_ack_n[25];
  
  assign w_p3_rx_rst_n      = init_reset_n[21];
  assign w_p3_tx_rst_n      = init_reset_n[22];
  assign w_p3_axi_st_bridge_rx_rst_n = init_reset_n[23];
  assign w_p3_axi_st_bridge_tx_rst_n = init_reset_n[24];
  assign w_p3_csr_rst_n     = init_reset_n[25];
  assign w_p3_ereset_n      = init_reset_n[26];
  assign w_p3_reconfig_rst  = init_reset_n[27];

  assign resp_reset_n[NUM_RESPONDERS-2] = i_subsystem_cold_rst_n;
  assign resp_reset_n[NUM_RESPONDERS-1] = i_app_ss_lite_areset_n;
  assign w_subsystem_cold_rst_ack_n     = resp_reset_ack_n[(NUM_PORTS*8)+(NUM_DR_PORTS*8)];
  assign w_axi_lite_bridge_rst_n        = init_reset_n[NUM_INITIATORS-3];
  assign w_ss_csr_rst_n                 = init_reset_n[NUM_INITIATORS-2];
  assign w_nios_rst_n                   = init_reset_n[NUM_INITIATORS-1];

  //----------------------------------------
  // SS_RST_SEQ IP
  //----------------------------------------
  
  SS_RST_SEQ #(
    .NUM_RESPONDERS             (NUM_RESPONDERS),
    .NUM_INITIATORS             (NUM_INITIATORS),
    .NUM_RESPONDER_HANDSHAKES   (1),
    .DLY_COUNTWIDTH             (DLY_COUNTWIDTH),
    .INIT_RESP_IN_EN_PATTERN    (INIT_RESP_IN_EN_PATTERN),
    .RESP_ACK_ASSERT_DELAY_CYCLE_COUNT   (RESP_ACK_ASSERT_DELAY_CYCLE_COUNT),
    .RESP_ACK_DEASSERT_DELAY_CYCLE_COUNT (RESP_ACK_DEASSERT_DELAY_CYCLE_COUNT)
  ) SS_RST_SEQ (
    .rst_seq_clk                ( i_app_ss_lite_clk ),
    .reset_n                    ( 1'b1 ),
    .resp_reset_n               ( resp_reset_n ),
    .resp_reset_ack_n           ( resp_reset_ack_n ),
    .resp_handshakes_req        ( '{default:0}),
    .resp_handshakes_ready      (  ),
    .init_reset_n               ( init_reset_n ),
    .init_handshakes_req        (  ),
    .init_handshakes_ready      ( '{default:0})
  );

  //----------------------------------------
  // Output Synchronizers
  //----------------------------------------

  hssi_ss_std_synchronizer_nocut p0_out_sync_rx_rstn    (.clk (i_p0_clk_rx), .reset_n (w_p0_rx_rst_n), .din (1'b1), .dout (o_p0_rx_rst_n));
  hssi_ss_std_synchronizer_nocut p0_out_sync_tx_rstn    (.clk (i_p0_clk_tx), .reset_n (w_p0_tx_rst_n), .din (1'b1), .dout (o_p0_tx_rst_n));
  hssi_ss_std_synchronizer_nocut p0_out_sync_rx_arstn   (.clk (i_p0_app_ss_st_clk),        .reset_n (w_p0_axi_st_bridge_rx_rst_n), .din (1'b1), .dout (o_p0_axi_st_bridge_rx_rst_n));
  hssi_ss_std_synchronizer_nocut p0_out_sync_tx_arstn   (.clk (i_p0_app_ss_st_client_clk), .reset_n (w_p0_axi_st_bridge_tx_rst_n), .din (1'b1), .dout (o_p0_axi_st_bridge_tx_rst_n));
  hssi_ss_std_synchronizer_nocut p0_out_sync_csr_rstn   (.clk (i_app_ss_lite_clk), .reset_n (w_p0_csr_rst_n), .din (1'b1), .dout (o_p0_csr_rst_n));
  hssi_ss_std_synchronizer_nocut p0_out_sync_erstn      (.clk (i_app_ss_lite_clk), .reset_n (w_p0_ereset_n),  .din (1'b1), .dout (o_p0_ereset_n));
  hssi_ss_std_synchronizer_nocut #(.rst_value(1)) p0_out_sync_rcfg_rstn  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din (~csr_common_rst_n), .dout (o_p0_reconfig_rst));
  //hssi_ss_std_synchronizer_nocut #(.rst_value(1)) p0_out_sync_rcfg_rstn  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din (~w_p0_reconfig_rst), .dout (o_p0_reconfig_rst));
  //hssi_ss_std_synchronizer_nocut p0_out_sync_rx_ackn    (.clk (i_p0_clk_rx), .reset_n (1'b1), .din (w_p0_rx_rst_ack_n), .dout (o_p0_rx_rst_ack_n));
  //hssi_ss_std_synchronizer_nocut p0_out_sync_tx_ackn    (.clk (i_p0_clk_tx), .reset_n (1'b1), .din (w_p0_tx_rst_ack_n), .dout (o_p0_tx_rst_ack_n));
  assign o_p0_rx_rst_ack_n = w_p0_rx_rst_ack_n;
  assign o_p0_tx_rst_ack_n = w_p0_tx_rst_ack_n;
  
  hssi_ss_std_synchronizer_nocut p1_out_sync_rx_rstn    (.clk (i_p1_clk_rx), .reset_n (w_p1_rx_rst_n), .din (1'b1), .dout (o_p1_rx_rst_n));
  hssi_ss_std_synchronizer_nocut p1_out_sync_tx_rstn    (.clk (i_p1_clk_tx), .reset_n (w_p1_tx_rst_n), .din (1'b1), .dout (o_p1_tx_rst_n));
  hssi_ss_std_synchronizer_nocut p1_out_sync_rx_arstn   (.clk (i_p1_app_ss_st_clk),        .reset_n (w_p1_axi_st_bridge_rx_rst_n), .din (1'b1), .dout (o_p1_axi_st_bridge_rx_rst_n));
  hssi_ss_std_synchronizer_nocut p1_out_sync_tx_arstn   (.clk (i_p1_app_ss_st_client_clk), .reset_n (w_p1_axi_st_bridge_tx_rst_n), .din (1'b1), .dout (o_p1_axi_st_bridge_tx_rst_n));
  hssi_ss_std_synchronizer_nocut p1_out_sync_csr_rstn   (.clk (i_app_ss_lite_clk), .reset_n (w_p1_csr_rst_n), .din (1'b1), .dout (o_p1_csr_rst_n));
  hssi_ss_std_synchronizer_nocut p1_out_sync_erstn      (.clk (i_app_ss_lite_clk), .reset_n (w_p1_ereset_n),  .din (1'b1), .dout (o_p1_ereset_n));
  hssi_ss_std_synchronizer_nocut #(.rst_value(1)) p1_out_sync_rcfg_rstn  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din (~csr_common_rst_n), .dout (o_p1_reconfig_rst));
  //hssi_ss_std_synchronizer_nocut #(.rst_value(1)) p1_out_sync_rcfg_rstn  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din (~w_p1_reconfig_rst), .dout (o_p1_reconfig_rst));
  //hssi_ss_std_synchronizer_nocut p1_out_sync_rx_ackn    (.clk (i_p1_clk_rx), .reset_n (1'b1), .din (w_p1_rx_rst_ack_n), .dout (o_p1_rx_rst_ack_n));
  //hssi_ss_std_synchronizer_nocut p1_out_sync_tx_ackn    (.clk (i_p1_clk_tx), .reset_n (1'b1), .din (w_p1_tx_rst_ack_n), .dout (o_p1_tx_rst_ack_n));
  assign o_p1_rx_rst_ack_n = w_p1_rx_rst_ack_n;
  assign o_p1_tx_rst_ack_n = w_p1_tx_rst_ack_n;
  
  hssi_ss_std_synchronizer_nocut p2_out_sync_rx_rstn    (.clk (i_p2_clk_rx), .reset_n (w_p2_rx_rst_n), .din (1'b1), .dout (o_p2_rx_rst_n));
  hssi_ss_std_synchronizer_nocut p2_out_sync_tx_rstn    (.clk (i_p2_clk_tx), .reset_n (w_p2_tx_rst_n), .din (1'b1), .dout (o_p2_tx_rst_n));
  hssi_ss_std_synchronizer_nocut p2_out_sync_rx_arstn   (.clk (i_p2_app_ss_st_clk),        .reset_n (w_p2_axi_st_bridge_rx_rst_n), .din (1'b1), .dout (o_p2_axi_st_bridge_rx_rst_n));
  hssi_ss_std_synchronizer_nocut p2_out_sync_tx_arstn   (.clk (i_p2_app_ss_st_client_clk), .reset_n (w_p2_axi_st_bridge_tx_rst_n), .din (1'b1), .dout (o_p2_axi_st_bridge_tx_rst_n));
  hssi_ss_std_synchronizer_nocut p2_out_sync_csr_rstn   (.clk (i_app_ss_lite_clk), .reset_n (w_p2_csr_rst_n), .din (1'b1), .dout (o_p2_csr_rst_n));
  hssi_ss_std_synchronizer_nocut p2_out_sync_erstn      (.clk (i_app_ss_lite_clk), .reset_n (w_p2_ereset_n),  .din (1'b1), .dout (o_p2_ereset_n));
  hssi_ss_std_synchronizer_nocut #(.rst_value(1)) p2_out_sync_rcfg_rstn  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din (~csr_common_rst_n), .dout (o_p2_reconfig_rst));
  //hssi_ss_std_synchronizer_nocut #(.rst_value(1)) p2_out_sync_rcfg_rstn  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din (~w_p2_reconfig_rst), .dout (o_p2_reconfig_rst));
  //hssi_ss_std_synchronizer_nocut p2_out_sync_rx_ackn    (.clk (i_p2_clk_rx), .reset_n (1'b1), .din (w_p2_rx_rst_ack_n), .dout (o_p2_rx_rst_ack_n));
  //hssi_ss_std_synchronizer_nocut p2_out_sync_tx_ackn    (.clk (i_p2_clk_tx), .reset_n (1'b1), .din (w_p2_tx_rst_ack_n), .dout (o_p2_tx_rst_ack_n));
  assign o_p2_rx_rst_ack_n = w_p2_rx_rst_ack_n;
  assign o_p2_tx_rst_ack_n = w_p2_tx_rst_ack_n;
  
  hssi_ss_std_synchronizer_nocut p3_out_sync_rx_rstn    (.clk (i_p3_clk_rx), .reset_n (w_p3_rx_rst_n), .din (1'b1), .dout (o_p3_rx_rst_n));
  hssi_ss_std_synchronizer_nocut p3_out_sync_tx_rstn    (.clk (i_p3_clk_tx), .reset_n (w_p3_tx_rst_n), .din (1'b1), .dout (o_p3_tx_rst_n));
  hssi_ss_std_synchronizer_nocut p3_out_sync_rx_arstn   (.clk (i_p3_app_ss_st_clk),        .reset_n (w_p3_axi_st_bridge_rx_rst_n), .din (1'b1), .dout (o_p3_axi_st_bridge_rx_rst_n));
  hssi_ss_std_synchronizer_nocut p3_out_sync_tx_arstn   (.clk (i_p3_app_ss_st_client_clk), .reset_n (w_p3_axi_st_bridge_tx_rst_n), .din (1'b1), .dout (o_p3_axi_st_bridge_tx_rst_n));
  hssi_ss_std_synchronizer_nocut p3_out_sync_csr_rstn   (.clk (i_app_ss_lite_clk), .reset_n (w_p3_csr_rst_n), .din (1'b1), .dout (o_p3_csr_rst_n));
  hssi_ss_std_synchronizer_nocut p3_out_sync_erstn      (.clk (i_app_ss_lite_clk), .reset_n (w_p3_ereset_n),  .din (1'b1), .dout (o_p3_ereset_n));
  hssi_ss_std_synchronizer_nocut #(.rst_value(1)) p3_out_sync_rcfg_rstn  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din (~csr_common_rst_n), .dout (o_p3_reconfig_rst));
  //hssi_ss_std_synchronizer_nocut #(.rst_value(1)) p3_out_sync_rcfg_rstn  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din (~w_p3_reconfig_rst), .dout (o_p3_reconfig_rst));
  //hssi_ss_std_synchronizer_nocut p3_out_sync_rx_ackn    (.clk (i_p3_clk_rx), .reset_n (1'b1), .din (w_p3_rx_rst_ack_n), .dout (o_p3_rx_rst_ack_n));
  //hssi_ss_std_synchronizer_nocut p3_out_sync_tx_ackn    (.clk (i_p3_clk_tx), .reset_n (1'b1), .din (w_p3_tx_rst_ack_n), .dout (o_p3_tx_rst_ack_n));
  assign o_p3_rx_rst_ack_n = w_p3_rx_rst_ack_n;
  assign o_p3_tx_rst_ack_n = w_p3_tx_rst_ack_n;
  
  hssi_ss_std_synchronizer_nocut int_csr_common_rst_sync  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din(w_axi_lite_bridge_rst_n), .dout (csr_common_rst_n));
  hssi_ss_std_synchronizer_nocut out_sync_lite_rstn  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din(csr_common_rst_n), .dout (o_axi_lite_bridge_rst_n));
  //hssi_ss_std_synchronizer_nocut out_sync_lite_rstn  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din(w_axi_lite_bridge_rst_n), .dout (o_axi_lite_bridge_rst_n));
  //hssi_ss_std_synchronizer_nocut out_sync_sscsr_rstn (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din (w_ss_csr_rst_n), .dout (o_ss_csr_rst_n));
  hssi_ss_std_synchronizer_nocut out_sync_nios_rstn  (.clk (i_nios_clk),        .reset_n (w_nios_rst_n),   .din (1'b1), .dout (o_nios_rst_n));

  assign o_subsystem_cold_rst_ack_n = w_subsystem_cold_rst_ack_n;

endmodule
//------------------------------------------------------------------------------
//
//
// End hssi_ss_reset_sequencer.sv
//
//------------------------------------------------------------------------------

