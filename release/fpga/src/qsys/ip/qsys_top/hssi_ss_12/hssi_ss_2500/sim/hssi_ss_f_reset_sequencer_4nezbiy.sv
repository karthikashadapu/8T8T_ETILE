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


module hssi_ss_f_reset_sequencer_4nezbiy #(
  parameter [23:0] SUBSYSTEM_RST_ACK_DEASSERT_DELAY = 24'h00C000,
  parameter [23:0] TX_RST_ACK_DEASSERT_DELAY = 24'h002000,
  parameter [23:0] RX_RST_ACK_DEASSERT_DELAY = 24'h002000,
  parameter NUM_PORTS = 0, //Numer of enabled ports
  parameter TILES = "E", //EHIP type 
  parameter NUM_DR_PORTS = 0 //Numer of DR enabled ports
)(
  input                       i_p0_app_ss_st_client_clk,      // AXI ST Bridge Clock Input
  input                       i_p0_app_ss_st_clk,             //
  input                       i_p0_clk_rx,                    // QHIp Rx Clock Input
  input                       i_p0_clk_tx,                    // QHIP Tx Clock Input
  input                       i_p0_rx_rst_n,                  // User QHIP Rx Reset, Active Low
  output                      o_p0_rx_rst_ack_n,              // User side QHIP Rx Reset Ack, Active Low
  input                       i_p0_tx_rst_n,                  // User QHIP Tx Reset, Active Low
  output                      o_p0_tx_rst_ack_n,              // User side QHIP Tx Reset Ack, Active Low
  input                       i_p0_app_ss_st_client_areset_n, // AXI ST Bridge Clock Input
  input                       i_p0_app_ss_st_areset_n,        //
  output                      o_p0_axi_st_bridge_rx_rst_n,    // AXI ST Rx Bridge Reset, Active low
  output                      o_p0_axi_st_bridge_tx_rst_n,    // AXI ST Tx Bridge Reset, Active low
  output                      o_p0_rx_rst_n,                  // EHIP side QHIP Rx Reset, Active Low
  input                       i_p0_rx_rst_ack_n,              // EHIP side QHIP Rx Reset, Active Low
  output                      o_p0_tx_rst_n,                  // EHIP side QHIP Tx Reset, Active Low
  input                       i_p0_tx_rst_ack_n,              // EHIP side QHIP Tx Ack, Active Low
  output                      o_p0_csr_rst_n,					  // EHIP side QHIP CSR Reset, Active Low
  input                       i_p0_csr_rst_ack_n,				  // EHIP side QHIP CSR Ack, Active Low
  output                      o_p0_ereset_n,

  input                       i_p0_pio_axi_st_bridge_rst_n,   // PIO_0 from NIOS
  input                       i_p0_pio_ehip_tx_rst_n,         // PIO_1 from NIOS
  input                       i_p0_pio_ehip_rx_rst_n,         // PIO_2 from NIOS
  input                       i_p0_pio_ereset_n,              // PIO_3 from NIOS

  output                      o_p0_reconfig_rst,              // QHIP Reconfig Reset, Active High
  

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

  localparam NUM_INITIATORS = (NUM_PORTS*7) + (NUM_DR_PORTS*7) + 3;  // o_rx_rst_n(LSB), o_tx_rst_n, o_axi_st_bridge_rx_rst_n, o_axi_st_bridge_tx_rst_n, o_csr_rst_n, o_ereset_n, o_reconfig_rst,
                                                // o_axi_lite_bridge_rst_n, o_ss_csr_rst_n, o_nios_rst_n(MSB)
  localparam ONE = {{(NUM_RESPONDERS-1){1'b0}},1'b1};

  localparam [NUM_INITIATORS-1:0] INIT_ACK_MODE_SELECT = {3'b0, {(NUM_PORTS+NUM_DR_PORTS){7'b0010011}}};  	//10'b0000001011, //support ACknowledge from Initiator interface 
																					    	// o_rx_rst_n(LSB), o_tx_rst_n, o_axi_st_bridge_rx_rst_n, o_axi_st_bridge_tx_rst_n, o_csr_rst_n, o_ereset_n, o_reconfig_rst,
                                               								 // o_axi_lite_bridge_rst_n, o_ss_csr_rst_n, o_nios_rst_n(MSB)
  
  localparam [NUM_RESPONDERS-1:0]INIT_RESP_IN_EN_PATTERN[NUM_INITIATORS-1:0] = {
                                   (ONE<<(NUM_RESPONDERS-2))                            // INIT_RESP_IN_EN_PATTERN for o_nios_rst_n
                                  ,(ONE<<(NUM_RESPONDERS-2))                            // INIT_RESP_IN_EN_PATTERN for o_ss_csr_rst_n
                                  ,(ONE<<(NUM_RESPONDERS-2)) | (ONE<<(NUM_RESPONDERS-1))  // INIT_RESP_IN_EN_PATTERN for o_axi_lite_bridge_rst_n
                                  ,(ONE<<(NUM_RESPONDERS-2))      // INIT_RESP_IN_EN_PATTERN for o_p0_reconfig_rst
                                  ,(ONE<<7)                                           // INIT_RESP_IN_EN_PATTERN for o_p0_ereset_n
                                  ,(ONE<<(NUM_RESPONDERS-2))               // INIT_RESP_IN_EN_PATTERN for o_p0_csr_rst_n
                                  ,(ONE<<1) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<2) | (ONE<<4)  // INIT_RESP_IN_EN_PATTERN for o_p0_axi_st_bridge_tx_rst_n
                                  ,(ONE<<0) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<3) | (ONE<<4)  // INIT_RESP_IN_EN_PATTERN for o_p0_axi_st_bridge_rx_rst_n
                                  ,(ONE<<1) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<5)         // INIT_RESP_IN_EN_PATTERN for o_p0_tx_rst_n
                                  ,(ONE<<0) | (ONE<<(NUM_RESPONDERS-2)) | (ONE<<6)         // INIT_RESP_IN_EN_PATTERN for o_p0_rx_rst_n
                                  };

  //This is to make ack_n low for application of reset_n, i.e. to make ack_n 1--->0 when reset_n is 1--->0 
  localparam [DLY_COUNTWIDTH-1:0]RESP_ACK_ASSERT_DELAY_CYCLE_COUNT[NUM_RESPONDERS-1:0] = '{default:32};

  //This is to make ack_n high for removal of reset_n, i.e. to make ack_n 0--->1 when reset_n is 0--->1 
  localparam [DLY_COUNTWIDTH-1:0]RESP_ACK_DEASSERT_DELAY_CYCLE_COUNT[NUM_RESPONDERS-1:0] = {
                                   24'd32       // Delay for app_ss_lite_areset_n
                                  ,24'd32        // Delay for i_subsystem_cold_rst_n
                                  ,24'd32       // Delay for i_p0_pio_ereset_n
                                  ,24'd32       // Delay for i_p0_pio_ehip_rx_rst_n
                                  ,24'd32       // Delay for i_p0_pio_ehip_tx_rst_n
                                  ,24'd32       // Delay for i_p0_pio_axi_st_bridge_rst_n
                                  ,24'd32       // Delay for i_p0_app_ss_st_areset_n
                                  ,24'd32       // Delay for i_p0_app_ss_st_client_areset_n
                                  ,24'd32       // Delay for i_0_tx_rstn ack gen, for initiator which doesn't give ack like brige_tx_rst
                                  ,24'd32       // Delay for i_0_rx_rstn ack gen, for initiator which doesn't give ack like brige_rx_rst
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
  wire w_subsystem_cold_rst_ack_n;
  wire csr_common_rst_n;
  wire w_axi_lite_bridge_rst_n;
  wire w_ss_csr_rst_n;
  wire w_nios_rst_n;
  wire [NUM_RESPONDERS-1:0] resp_reset_n;
  wire [NUM_RESPONDERS-1:0] resp_reset_ack_n;
  wire [NUM_INITIATORS-1:0] init_reset_n;
  wire [NUM_INITIATORS-1:0] init_reset_ack_n;
  genvar i;

  //reg  w_nios_rst_n_d1, w_nios_rst_n_d2, w_nios_rst_n_d3, w_nios_rst_n_nedge;
  //reg  [3:0] dr_rst_cntr;
  //wire w_dr_rst_n;
  
  wire ninit_done;
  reg [3:0] rst_count = 4'd0;
  reg  dr_reset_n;
  reg  carr;

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

  assign init_reset_ack_n[0] = i_p0_rx_rst_ack_n;
  assign init_reset_ack_n[1] = i_p0_tx_rst_ack_n;
  assign init_reset_ack_n[2] = 1'b1;
  assign init_reset_ack_n[3] = 1'b1;
  assign init_reset_ack_n[4] = i_p0_csr_rst_ack_n;
  assign init_reset_ack_n[5] = 1'b1;
  assign init_reset_ack_n[6] = 1'b1;

  assign resp_reset_n[NUM_RESPONDERS-2] = i_subsystem_cold_rst_n;
  assign resp_reset_n[NUM_RESPONDERS-1] = i_app_ss_lite_areset_n;
  assign w_subsystem_cold_rst_ack_n     = resp_reset_ack_n[(NUM_PORTS*8)+(NUM_DR_PORTS*8)];
  assign w_axi_lite_bridge_rst_n        = init_reset_n[NUM_INITIATORS-3];
  assign w_ss_csr_rst_n                 = init_reset_n[NUM_INITIATORS-2];
  assign w_nios_rst_n                   = init_reset_n[NUM_INITIATORS-1];
  assign init_reset_ack_n[NUM_INITIATORS-3] = 1'b1;
  assign init_reset_ack_n[NUM_INITIATORS-2] = 1'b1;
  assign init_reset_ack_n[NUM_INITIATORS-1] = 1'b1;

  //----------------------------------------
  // SS_RST_SEQ IP
  //----------------------------------------
  
  SS_RST_SEQ #(
    .NUM_RESPONDERS             (NUM_RESPONDERS),
    .NUM_INITIATORS             (NUM_INITIATORS),
    .NUM_RESPONDER_HANDSHAKES   (1),
    .DLY_COUNTWIDTH             (DLY_COUNTWIDTH),
	 .INIT_ACK_MODE_SELECT		  (INIT_ACK_MODE_SELECT),
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
	  .init_reset_ack_n			      ( init_reset_ack_n),
  
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
  hssi_ss_std_synchronizer_nocut #(.rst_value(1)) p0_out_sync_rcfg_rstn  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din (~w_p0_reconfig_rst), .dout (o_p0_reconfig_rst));
  //hssi_ss_std_synchronizer_nocut #(.rst_value(1)) p0_out_sync_rcfg_rstn  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din (~w_p0_reconfig_rst), .dout (o_p0_reconfig_rst));
  //hssi_ss_std_synchronizer_nocut p0_out_sync_rx_ackn    (.clk (i_p0_clk_rx), .reset_n (1'b1), .din (w_p0_rx_rst_ack_n), .dout (o_p0_rx_rst_ack_n));
  //hssi_ss_std_synchronizer_nocut p0_out_sync_tx_ackn    (.clk (i_p0_clk_tx), .reset_n (1'b1), .din (w_p0_tx_rst_ack_n), .dout (o_p0_tx_rst_ack_n));
  assign o_p0_rx_rst_ack_n  = w_p0_rx_rst_ack_n;
  assign o_p0_tx_rst_ack_n  = w_p0_tx_rst_ack_n;
  hssi_ss_std_synchronizer_nocut int_csr_common_rst_sync  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din(w_axi_lite_bridge_rst_n), .dout (csr_common_rst_n));
  hssi_ss_std_synchronizer_nocut out_sync_lite_rstn  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din(csr_common_rst_n), .dout (o_axi_lite_bridge_rst_n));
  //hssi_ss_std_synchronizer_nocut out_sync_lite_rstn  (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din(w_axi_lite_bridge_rst_n), .dout (o_axi_lite_bridge_rst_n));
  //hssi_ss_std_synchronizer_nocut out_sync_sscsr_rstn (.clk (i_app_ss_lite_clk), .reset_n (1'b1), .din (w_ss_csr_rst_n), .dout (o_ss_csr_rst_n));
  hssi_ss_std_synchronizer_nocut out_sync_nios_rstn  (.clk (i_nios_clk),        .reset_n (w_nios_rst_n),   .din (1'b1), .dout (o_nios_rst_n));

  assign o_subsystem_cold_rst_ack_n = w_subsystem_cold_rst_ack_n;

  //DR control IP reset gen 
/*
//DR controller needs reset to be de-assert fast before the eth_f IP reset
  always @(posedge i_app_ss_lite_clk) 
  begin
    w_nios_rst_n_d1 <= w_nios_rst_n;
    w_nios_rst_n_d2 <= w_nios_rst_n_d1;
    w_nios_rst_n_d3 <= w_nios_rst_n_d2;
    w_nios_rst_n_nedge <= ~w_nios_rst_n_d2 && w_nios_rst_n_d3;
  end

  always @(posedge i_app_ss_lite_clk) 
  begin
    if(w_nios_rst_n_nedge)
      dr_rst_cntr <= 4'd0;
    else if(dr_rst_cntr < 4'd15)
      dr_rst_cntr <= dr_rst_cntr + 1'b1;
    else
      dr_rst_cntr <= 4'd15;
  end

  assign w_dr_rst_n = (dr_rst_cntr == 4'd15)? 1'b1 : 1'b0;

  //hssi_ss_std_synchronizer_nocut out_sync_dr_ctrl_rstn  (.clk (i_app_ss_lite_clk), .reset_n (w_dr_rst_n), .din (1'b1), .dout (o_dr_ctrl_ip_rst_n));
*/
endmodule
//------------------------------------------------------------------------------
//
//
// End hssi_ss_reset_sequencer.sv
//
//------------------------------------------------------------------------------

