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
// Module            : hssi_ss_ip_wrapper.sv
// Description       : 
// Author            : Sibajit Patnaik
// Created           : 04-Aug-2020
// Description       : This file is the top level wrapper for all the ports with in the subsystem
//                   : this is wrapper of IP core and the datapath bridges


// ==========================================================================
// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on



module hssi_ss_ip_wrapper_n5d742a
#(
// -----------------------------------------------------
// Parameters Name              = Default  //Description
// -----------------------------------------------------
//  Child IP parameters, port wise
//  HSSI SS top level parameters

    parameter PORT0_XCVR_CHANNEL   = 1, //No of XCVR channels
    parameter PORT0_DATA_WIDTH     = 64,
    parameter [3:0] PORT0_AXI_READY_LATENCY  = 0,
    parameter [0:0] PORT0_PTP_TX_CLASSIFIER_ENABLE  = 0,
    parameter [0:0] PORT0_PKT_SEG_PARITY_EN         = 0,
    parameter PORT0_PROFILE        = "10GbE",
    parameter ENABLE_ECC    = 0,
    parameter SIM_MODE = 0,
    parameter Tiles    = "E")(
  // ---------------
  // Reset Interface
  // --------------- 
        //Reset signals from SRC to ehip and other modules
        input                               p0_tx_rst_n,
        input                               p0_rx_rst_n,
        input                               p0_axi_st_bridge_tx_rst_n,
        input                               p0_axi_st_bridge_rx_rst_n,
        input                               p0_csr_rst_n,
        input                               p0_reconfig_rst,
        input  [2:0]                        i_clk_ref,
        input                               i_p0_clk_tx_tod,
        input                               i_p0_clk_rx_tod,
        input                               i_p0_clk_ptp_sample,
        output                              o_p0_clk_pll,
        output                              o_p0_clk_tx_div,
        output                              o_p0_clk_rec_div64,
        output                              o_p0_clk_rec_div,
        input                               i_p0_reconfig_clk,
        input                               i_p0_tx_clkena_half_rate,
        input                               i_p0_rx_clkena_half_rate,

        output  [1:0]                       o_ehip_core0_ptp_clk_pll,
        output  [1:0]                       o_ehip_core0_ptp_clk_tx_div,
        output  [1:0]                       o_ehip_core0_ptp_clk_rec_div64,
        output  [1:0]                       o_ehip_core0_ptp_clk_rec_div,
        //External AIB enable
        output                              o_ehip_core0_aib_clk,
        output                              o_ehip_core0_aib_2x_clk,
        output                              o_ehip_core0_aib_pll_locked,
        output                              o_ehip_core0_aib_tx_serial_data,
        output  [1:0]                       o_ehip_core0_ptp_aib_tx_pll_locked,
        output  [1:0]                       o_ehip_core1_ptp_clk_pll,
        output  [1:0]                       o_ehip_core1_ptp_clk_tx_div,
        output  [1:0]                       o_ehip_core1_ptp_clk_rec_div64,
        output  [1:0]                       o_ehip_core1_ptp_clk_rec_div,
        //External AIB enable
        output                              o_ehip_core1_aib_clk,
        output                              o_ehip_core1_aib_2x_clk,
        output                              o_ehip_core1_aib_pll_locked,
        output                              o_ehip_core1_aib_tx_serial_data,
        output  [1:0]                       o_ehip_core1_ptp_aib_tx_pll_locked,
        output  [1:0]                       o_ehip_core2_ptp_clk_pll,
        output  [1:0]                       o_ehip_core2_ptp_clk_tx_div,
        output  [1:0]                       o_ehip_core2_ptp_clk_rec_div64,
        output  [1:0]                       o_ehip_core2_ptp_clk_rec_div,
        //External AIB enable
        output                              o_ehip_core2_aib_clk,
        output                              o_ehip_core2_aib_2x_clk,
        output                              o_ehip_core2_aib_pll_locked,
        output                              o_ehip_core2_aib_tx_serial_data,
        output  [1:0]                       o_ehip_core2_ptp_aib_tx_pll_locked,
        output  [1:0]                       o_ehip_core3_ptp_clk_pll,
        output  [1:0]                       o_ehip_core3_ptp_clk_tx_div,
        output  [1:0]                       o_ehip_core3_ptp_clk_rec_div64,
        output  [1:0]                       o_ehip_core3_ptp_clk_rec_div,
        //External AIB enable
        output                              o_ehip_core3_aib_clk,
        output                              o_ehip_core3_aib_2x_clk,
        output                              o_ehip_core3_aib_pll_locked,
        output                              o_ehip_core3_aib_tx_serial_data,
        output  [1:0]                       o_ehip_core3_ptp_aib_tx_pll_locked,


// Logic port declaration for AXI4 Bridge  
          input  [5:0]  i_p0_port_profile, 
          //
          input  [11:0] p0_eth_reconfig_address,
          input         p0_eth_reconfig_read,
          input         p0_eth_reconfig_write,
          output        p0_eth_reconfig_waitrequest,
          output        p0_eth_reconfig_readdatavalid,
          output [31:0] p0_eth_reconfig_readdata,
          input  [31:0] p0_eth_reconfig_writedata,
          //
          input  [16:0] p0_c0_xcvr_reconfig_address,
          input         p0_c0_xcvr_reconfig_read,
          input         p0_c0_xcvr_reconfig_write,
          output        p0_c0_xcvr_reconfig_waitrequest,
          output        p0_c0_xcvr_reconfig_readdatavalid,
          output [7:0]  p0_c0_xcvr_reconfig_readdata,
          input  [7:0]  p0_c0_xcvr_reconfig_writedata,
          // FEC reconfig AVMM
          //PTP reconfig AVMM 
//
  // ----------------------------------
  // AXI ST TX/RX Client Interface Signals, valid for eth with MAC enable, otherwise empty list 
  // ----------------------------------
    input                               app_ss_p0_st_client_clk,
    input                               app_ss_p0_tx_tvalid,
    output                              ss_app_p0_tx_tready,
    input  [PORT0_DATA_WIDTH-1:0] app_ss_p0_tx_tdata,
    input  [(PORT0_DATA_WIDTH/8)-1:0]app_ss_p0_tx_tkeep,
    input                               app_ss_p0_tx_tlast,
    input  [93:0]                       app_ss_p0_tx_tuser_ptp,
    input  [327:0]                      app_ss_p0_tx_tuser_ptp_extended,
    input  [1:0]                        app_ss_p0_tx_tuser_client,
		input                               app_ss_p0_tx_tuser_pkt_seg_parity,
    // ----------------------------------
    input                               app_ss_p0_st_clk,
    output                              ss_app_p0_rx_tvalid,
    output [PORT0_DATA_WIDTH-1:0] ss_app_p0_rx_tdata,
    output [(PORT0_DATA_WIDTH/8)-1:0]ss_app_p0_rx_tkeep,
    output                              ss_app_p0_rx_tlast,
    output [6:0]                        ss_app_p0_rx_tuser_client,
    output [4:0]                        ss_app_p0_rx_tuser_sts,
    output [31:0]                       ss_app_p0_rx_tuser_sts_extended,
    output                              ss_app_p0_rx_tuser_pkt_seg_parity,
// 100G <---> 25G MAC+PCS mode DR
  // ------------------------
  // AXI ST PHY Direct Functional Signals
  // ---------------------------------------
  input                           app_ss_p0_st_txphydirect_clk,
  input                           app_ss_p0_st_txphydirect_areset_n,
  input  [PORT0_DATA_WIDTH-1:0]      app_ss_p0_st_txphydirect_data,
  input                           app_ss_p0_st_txphydirect_valid,
  output                          ss_app_p0_st_txphydirect_tready,
  input                           app_ss_p0_st_rxphydirect_clk,
  input                           app_ss_p0_st_rxphydirect_areset_n,
  output [PORT0_DATA_WIDTH-1:0]   ss_app_p0_st_rxphydirect_data,
  output                          ss_app_p0_st_rxphydirect_valid,
  // ---------------------------------------                                 
// 25G <---> CPRI DR 
  // -------------------------------
  // AXI ST Tx/Rx ToD Interface Signals
  // -------------------------------
  input              app_ss_p0_st_txtod_tvalid,
  input  [95:0]      app_ss_p0_st_txtod_tdata,
  input              app_ss_p0_st_rxtod_tvalid,
  input  [95:0]      app_ss_p0_st_rxtod_tdata,
  // ----------------------------------------------
  // AXI ST Tx/Rx Egress Timestamp Interface Signals
  // ----------------------------------------------
  output             ss_app_p0_st_txegrts0_tvalid,
  output [103:0]     ss_app_p0_st_txegrts0_tdata,
  output             ss_app_p0_st_txegrts1_tvalid,
  output [103:0]     ss_app_p0_st_txegrts1_tdata,
  // ----------------------------------------------
  // AXI ST Rx ingress Timestamp Interface Signals, Valid only in F-tile
  // ----------------------------------------------
  output             ss_app_p0_st_rxingrts0_tvalid,
  output [95:0]      ss_app_p0_st_rxingrts0_tdata,
  output             ss_app_p0_st_rxingrts1_tvalid,
  output [95:0]      ss_app_p0_st_rxingrts1_tdata,
  // -----------------
  // Flow control signals, valid for MAC case only
  // -----------------
  input                i_p0_tx_pause, 
  input  [7:0]         i_p0_tx_pfc,
  output               o_p0_rx_pause,
  output [7:0]         o_p0_rx_pfc,
// 100G <---> 25G MAC+PCS mode DR
  // -------------------
  // PHY Serial I/O Pins
  // -------------------
  input  [PORT0_XCVR_CHANNEL-1:0]      p0_rx_serial,
  input  [PORT0_XCVR_CHANNEL-1:0]      p0_rx_serial_n,
  output [PORT0_XCVR_CHANNEL-1:0]      p0_tx_serial,
  output [PORT0_XCVR_CHANNEL-1:0]      p0_tx_serial_n,
  //
  // -----------------
  // Ten Bit Interface
  // -----------------
  output [9:0]         p0_tbi_tx_d,
  input                p0_tbi_tx_clk,
  input                p0_tbi_rx_clk,
  input  [9:0]         p0_tbi_rx_d,
  // --------------
  // MDIO Interface
  // --------------
  input                p0_mdio_in,
  output               p0_mdio_out,
  output               p0_mdio_oen,
  output               p0_mdc,
  // -----------------------
  // Status Signal Interface
  // -----------------------
  output               p0_led_link,
  output               p0_led_panel_link,
  output               p0_led_crs,
  output               p0_led_col,
  output               p0_led_an,
  output               p0_led_char_err,
  output               p0_led_disp_err,
  // -----------------------------------------
  // Miscellaneous Functional Signal Interface
  // -----------------------------------------
  output               p0_tx_lanes_stable,
  output               p0_rx_pcs_ready,
  output               p0_tx_fifo_eccstatus,
  output               p0_axi_st_tx_parity_error,
  output               o_p0_rx_pcs_fully_aligned,
  output               o_p0_tx_pll_locked,
  output               o_p0_tx_ptp_ready, 
  output               o_p0_rx_ptp_ready,
  // ---------------------------------
  // General PHY Direct Status Signals
  // ---------------------------------
  output               p0_tx_pma_ready_a,
  output               p0_rx_pma_ready_a,
  //
  output               p0_tx_maib_fifo_full,
  output               p0_tx_maib_fifo_empty_a,
  output               p0_tx_maib_fifo_pfull,
  output               p0_tx_maib_fifo_pempty_a,
  //
  input                p0_rx_maib_fifo_rd_en,  //TBD rxfifo_rd_en?
  output               p0_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output               p0_rx_maib_fifo_empty,
  output               p0_rx_maib_fifo_pfull_a,
  output               p0_rx_maib_fifo_pempty,
  input                i_p0_custom_cadence, 

// 25G <---> CPRI DR 
  // -------------------------------
  // Deterministic Latency Interface
  // -------------------------------
  output             o_p0_sl_tx_dl_async_pulse,
  output             o_p0_sl_rx_dl_async_pulse,
  input              i_p0_sl_latency_sclk,
  input              i_p0_sl_tx_dl_measure_sel,
  input              i_p0_sl_rx_dl_measure_sel,
  // ---------------------
  // Custom Rate Interface
  // ---------------------
  output         o_p0_txfifo_pfull, //TBD already there
  output         o_p0_txfifo_pempty,
  output         o_p0_txfifo_overflow,
  output         o_p0_txfifo_underflow,
// SS CSR signals
        output               o_p0_rx_block_lock,
        output               o_p0_rx_am_lock,
        output               o_p0_local_fault_status,
        output               o_p0_remote_fault_status,
        output               o_p0_rx_hi_ber,
        output               o_p0_ehip_ready,
        output               o_p0_cdr_lock,
        output [2:0]         o_p0_link_status,
  input  [31:0] hotplug_control,
  input         po_pma_cal_done,
  output [15:0][7:0] hotplug_status,
  output [15:0] o_xcvr_ready,
  output [15:0] o_tx_pma_ready,
  output [15:0] o_rx_pma_ready,
  input  [15:0] i_hotplug_disable_fm,
  input  [15:0] i_hotplug_lpbk_en_fm,
  output [15:0] o_hotplug_paused_fm,
  output tp //dummy
);

//*********************************************************************************
//************************* EHIP IP TOP level for each ports ********************** 
//*********************************************************************************





        localparam EHIP0_CHANNEL = 1;
        localparam EHIP0_XCVR_CHANNEL = 1;

        localparam EHIP0_DATA_WIDTH  = PORT0_DATA_WIDTH; 


        localparam [3:0] EHIP0_AXI_READY_LATENCY [1-1:0]  = {
                                        PORT0_AXI_READY_LATENCY 
                                        };

        localparam [0:0] EHIP0_PTP_TX_CLASSIFIER_ENABLE [1-1:0]  = {
                                        PORT0_PTP_TX_CLASSIFIER_ENABLE 
                                        };

localparam [0:0] EHIP0_PKT_SEG_PARITY_EN [1-1:0]  = {
                                        PORT0_PKT_SEG_PARITY_EN 
                                        };

        wire [EHIP0_CHANNEL-1:0] i_ehip0_clk_tx_tod;
        wire [EHIP0_CHANNEL-1:0] i_ehip0_clk_rx_tod;
        wire                              i_ehip0_aib_clk;
        wire                              i_ehip0_aib_2x_clk;
        wire                              i_ehip0_clk_ptp_sample;
        wire                              i_ehip0_reconfig_clk;
        wire [EHIP0_CHANNEL-1:0] o_ehip0_clk_pll;
        wire [EHIP0_CHANNEL-1:0] o_ehip0_clk_tx_div;
        wire [EHIP0_CHANNEL-1:0] o_ehip0_clk_rec_div64;
        wire [EHIP0_CHANNEL-1:0] o_ehip0_clk_rec_div;
        wire [1:0]                        ehip_inst0_ptp_clk_pll;
        wire [1:0]                        ehip_inst0_ptp_clk_tx_div;
        wire [1:0]                        ehip_inst0_ptp_clk_rec_div64;
        wire [1:0]                        ehip_inst0_ptp_clk_rec_div;
        wire [1:0]                        ehip_inst0_ptp_pll_locked;
        wire                              i_ehip_inst0_aib_clk;
        wire                              i_ehip_inst0_aib_2x_clk;
        wire                              i_ehip_inst0_aib_pll_locked;

        //
        wire [EHIP0_CHANNEL-1:0] ehip0_csr_rst_n;
        wire [EHIP0_CHANNEL-1:0] ehip0_tx_rst_n;
        wire [EHIP0_CHANNEL-1:0] ehip0_rx_rst_n;
        wire                              ehip0_reconfig_rst_n;
        //
        wire [EHIP0_XCVR_CHANNEL-1:0] ehip0_rx_serial;
        wire [EHIP0_XCVR_CHANNEL-1:0] ehip0_rx_serial_n;
        wire [EHIP0_XCVR_CHANNEL-1:0] ehip0_tx_serial;
        wire [EHIP0_XCVR_CHANNEL-1:0] ehip0_tx_serial_n;
        //

//*********************************************************************************
//*********************************************************************************
        wire [EHIP0_CHANNEL-1:0][5:0]  ehip0_port_profile;
        wire [EHIP0_CHANNEL-1:0][11:0] i_ehip0_eth_reconfig_address;
        wire [EHIP0_CHANNEL-1:0]       i_ehip0_eth_reconfig_read;
        wire [EHIP0_CHANNEL-1:0]       i_ehip0_eth_reconfig_write;
        wire [EHIP0_CHANNEL-1:0]       o_ehip0_eth_reconfig_waitrequest;
        wire [EHIP0_CHANNEL-1:0]       o_ehip0_eth_reconfig_readdatavalid;
        wire [EHIP0_CHANNEL-1:0][31:0] o_ehip0_eth_reconfig_readdata;
        wire [EHIP0_CHANNEL-1:0][31:0] i_ehip0_eth_reconfig_writedata;
        //
        wire [EHIP0_XCVR_CHANNEL-1:0][16:0] i_ehip0_xcvr_reconfig_address;
        wire [EHIP0_XCVR_CHANNEL-1:0]       i_ehip0_xcvr_reconfig_read;
        wire [EHIP0_XCVR_CHANNEL-1:0]       i_ehip0_xcvr_reconfig_write;
        wire [EHIP0_XCVR_CHANNEL-1:0]       o_ehip0_xcvr_reconfig_waitrequest;
        wire [EHIP0_XCVR_CHANNEL-1:0]       o_ehip0_xcvr_reconfig_readdatavalid;
        wire [EHIP0_XCVR_CHANNEL-1:0][7:0]  o_ehip0_xcvr_reconfig_readdata;
        wire [EHIP0_XCVR_CHANNEL-1:0][7:0]  i_ehip0_xcvr_reconfig_writedata;
        //



//*********************************************************************************************
    //
    // ----------------------------------
    wire [EHIP0_CHANNEL-1:0]                             ehip0_axi_st_bridge_tx_rst_n;
    wire [EHIP0_CHANNEL-1:0]                             app_ss_ehip0_st_client_clk;
    wire [EHIP0_CHANNEL-1:0]                             app_ss_ehip0_tx_tvalid;
    wire [EHIP0_CHANNEL-1:0]                             ss_app_ehip0_tx_tready;
    wire [EHIP0_CHANNEL-1:0][EHIP0_DATA_WIDTH-1:0] app_ss_ehip0_tx_tdata; 
    wire [EHIP0_CHANNEL-1:0][(EHIP0_DATA_WIDTH/8)-1:0]app_ss_ehip0_tx_tkeep;
    wire [EHIP0_CHANNEL-1:0]                             app_ss_ehip0_tx_tlast;
    wire [EHIP0_CHANNEL-1:0][93:0]                        app_ss_ehip0_tx_tuser_ptp;
    wire [EHIP0_CHANNEL-1:0][327:0]                       app_ss_ehip0_tx_tuser_ptp_extended;
    wire [EHIP0_CHANNEL-1:0][1:0]                         app_ss_ehip0_tx_tuser_client;
    wire [EHIP0_CHANNEL-1:0]                              app_ss_ehip0_tx_tuser_pkt_seg_parity;
    // ----------------------------------
    wire [EHIP0_CHANNEL-1:0]                             ehip0_axi_st_bridge_rx_rst_n;
    wire [EHIP0_CHANNEL-1:0]                             app_ss_ehip0_st_clk;
    wire [EHIP0_CHANNEL-1:0]                             ss_app_ehip0_rx_tvalid;
    wire [EHIP0_CHANNEL-1:0][EHIP0_DATA_WIDTH-1:0] ss_app_ehip0_rx_tdata;
    wire [EHIP0_CHANNEL-1:0][(EHIP0_DATA_WIDTH/8)-1:0]ss_app_ehip0_rx_tkeep;
    wire [EHIP0_CHANNEL-1:0]                             ss_app_ehip0_rx_tlast;
    wire [EHIP0_CHANNEL-1:0][6:0]                         ss_app_ehip0_rx_tuser_client;
    wire [EHIP0_CHANNEL-1:0][4:0]                         ss_app_ehip0_rx_tuser_sts;
    wire [EHIP0_CHANNEL-1:0][31:0]                        ss_app_ehip0_rx_tuser_sts_extended;
    wire [EHIP0_CHANNEL-1:0]                              ss_app_ehip0_rx_tuser_pkt_seg_parity;

    wire [EHIP0_CHANNEL-1:0]               i_ehip0_tx_pause; 
    wire [EHIP0_CHANNEL-1:0][7:0]          i_ehip0_tx_pfc;
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_rx_pause;
    wire [EHIP0_CHANNEL-1:0][7:0]          o_ehip0_rx_pfc;
  //
    wire [EHIP0_CHANNEL-1:0]               app_ss_ehip0_st_txtod_tvalid;
    wire [EHIP0_CHANNEL-1:0][95:0]         app_ss_ehip0_st_txtod_tdata;
    wire [EHIP0_CHANNEL-1:0]               app_ss_ehip0_st_rxtod_tvalid;
    wire [EHIP0_CHANNEL-1:0][95:0]         app_ss_ehip0_st_rxtod_tdata;
  //
    wire [EHIP0_CHANNEL-1:0]               ss_app_ehip0_st_txegrts0_tvalid;
    wire [EHIP0_CHANNEL-1:0][103:0]        ss_app_ehip0_st_txegrts0_tdata;
    wire [EHIP0_CHANNEL-1:0]               ss_app_ehip0_st_rxingrts0_tvalid;
    wire [EHIP0_CHANNEL-1:0][95:0]         ss_app_ehip0_st_rxingrts0_tdata;

    wire [EHIP0_CHANNEL-1:0]               o_ehip0_tx_ptp_ready; 
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_rx_ptp_ready;
  //
    wire [EHIP0_CHANNEL-1:0]               ehip0_tx_lanes_stable;
    wire [EHIP0_CHANNEL-1:0]               ehip0_rx_pcs_ready;
    wire [EHIP0_CHANNEL-1:0]               ehip0_tx_fifo_eccstatus;
    wire [EHIP0_CHANNEL-1:0]               ehip0_axi_st_tx_parity_error;
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_rx_pcs_fully_aligned;
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_tx_pll_locked;
  //
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_sl_tx_dl_async_pulse;
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_sl_rx_dl_async_pulse;
    wire [EHIP0_CHANNEL-1:0]               i_ehip0_sl_latency_sclk;
    wire [EHIP0_CHANNEL-1:0]               i_ehip0_sl_tx_dl_measure_sel;
    wire [EHIP0_CHANNEL-1:0]               i_ehip0_sl_rx_dl_measure_sel;
  //
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_txfifo_pfull; 
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_txfifo_pempty;
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_txfifo_overflow;
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_txfifo_underflow;
    wire [EHIP0_CHANNEL-1:0]               i_ehip0_custom_cadence; 
  //
    //n other cases width is no of chs and common register for DR and non-DR port
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_rx_am_lock;
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_rx_block_lock;
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_local_fault_status;
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_remote_fault_status;
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_rx_hi_ber;
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_ehip_ready;
    wire [EHIP0_CHANNEL-1:0]               o_ehip0_cdr_lock;
    wire [EHIP0_CHANNEL-1:0] [2:0]         o_ehip0_link_status;
    wire [EHIP0_XCVR_CHANNEL-1:0]          o_ehip0_xcvr_ready;
    wire [EHIP0_XCVR_CHANNEL-1:0]          o_ehip0_tx_pma_ready;
    wire [EHIP0_XCVR_CHANNEL-1:0]          o_ehip0_rx_pma_ready;
    wire [EHIP0_XCVR_CHANNEL-1:0] [7:0]    ehip0_hotplug_status;
    wire [EHIP0_XCVR_CHANNEL-1:0]          i_ehip0_hotplug_disable_fm;
    wire [EHIP0_XCVR_CHANNEL-1:0]          i_ehip0_hotplug_lpbk_en_fm;
    wire [EHIP0_XCVR_CHANNEL-1:0]          o_ehip0_hotplug_paused_fm;

//*********************************************************************************
//*************** DR port related signals declaration  **************************** 
//*********************************************************************************


// 25G - CPRI DR

    // ----------------------------------
    // ----------------------------------
  //


//*********************************************************************************
//************** Conv AVMM of multiple channels of a port to a single Bus**********
//*********************************************************************************
    assign i_ehip0_clk_tx_tod[0]     = i_p0_clk_tx_tod;
    assign i_ehip0_clk_rx_tod[0]     = i_p0_clk_rx_tod;
    assign o_p0_clk_pll        = o_ehip0_clk_pll[0];
    assign o_p0_clk_tx_div     = o_ehip0_clk_tx_div[0];
    assign o_p0_clk_rec_div64  = o_ehip0_clk_rec_div64[0];
    assign o_p0_clk_rec_div    = o_ehip0_clk_rec_div[0];
        //
    assign ehip0_csr_rst_n[0]      = p0_csr_rst_n;
    assign ehip0_tx_rst_n[0]       = p0_tx_rst_n;
    assign ehip0_rx_rst_n[0]       = p0_rx_rst_n;
        //       
    assign ehip0_rx_serial[0]   = p0_rx_serial; //TBD 
    assign ehip0_rx_serial_n[0] = p0_rx_serial_n;
    assign p0_tx_serial   = ehip0_tx_serial[0];
    assign p0_tx_serial_n = ehip0_tx_serial_n[0];
    assign o_xcvr_ready[0] = o_ehip0_xcvr_ready[0];
    assign o_tx_pma_ready[0] = o_ehip0_tx_pma_ready[0];
    assign o_rx_pma_ready[0] = o_ehip0_rx_pma_ready[0];
    assign hotplug_status[0] = ehip0_hotplug_status[0];
    assign o_hotplug_paused_fm[0] = o_ehip0_hotplug_paused_fm[0];
    assign i_ehip0_hotplug_disable_fm[0] = i_hotplug_disable_fm[0];
    assign i_ehip0_hotplug_lpbk_en_fm[0] = i_hotplug_lpbk_en_fm[0];
        //
    assign o_xcvr_ready[1]   = 1'b0; 
    assign o_tx_pma_ready[1] = 1'b0; 
    assign o_rx_pma_ready[1] = 1'b0; 
    assign hotplug_status[1] = 8'd0; 
    assign o_hotplug_paused_fm[1] = 1'b0;
    assign o_xcvr_ready[2]   = 1'b0; 
    assign o_tx_pma_ready[2] = 1'b0; 
    assign o_rx_pma_ready[2] = 1'b0; 
    assign hotplug_status[2] = 8'd0; 
    assign o_hotplug_paused_fm[2] = 1'b0;
    assign o_xcvr_ready[3]   = 1'b0; 
    assign o_tx_pma_ready[3] = 1'b0; 
    assign o_rx_pma_ready[3] = 1'b0; 
    assign hotplug_status[3] = 8'd0; 
    assign o_hotplug_paused_fm[3] = 1'b0;
    assign o_xcvr_ready[4]   = 1'b0; 
    assign o_tx_pma_ready[4] = 1'b0; 
    assign o_rx_pma_ready[4] = 1'b0; 
    assign hotplug_status[4] = 8'd0; 
    assign o_hotplug_paused_fm[4] = 1'b0;
    assign o_xcvr_ready[5]   = 1'b0; 
    assign o_tx_pma_ready[5] = 1'b0; 
    assign o_rx_pma_ready[5] = 1'b0; 
    assign hotplug_status[5] = 8'd0; 
    assign o_hotplug_paused_fm[5] = 1'b0;
    assign o_xcvr_ready[6]   = 1'b0; 
    assign o_tx_pma_ready[6] = 1'b0; 
    assign o_rx_pma_ready[6] = 1'b0; 
    assign hotplug_status[6] = 8'd0; 
    assign o_hotplug_paused_fm[6] = 1'b0;
    assign o_xcvr_ready[7]   = 1'b0; 
    assign o_tx_pma_ready[7] = 1'b0; 
    assign o_rx_pma_ready[7] = 1'b0; 
    assign hotplug_status[7] = 8'd0; 
    assign o_hotplug_paused_fm[7] = 1'b0;
    assign o_xcvr_ready[8]   = 1'b0; 
    assign o_tx_pma_ready[8] = 1'b0; 
    assign o_rx_pma_ready[8] = 1'b0; 
    assign hotplug_status[8] = 8'd0; 
    assign o_hotplug_paused_fm[8] = 1'b0;
    assign o_xcvr_ready[9]   = 1'b0; 
    assign o_tx_pma_ready[9] = 1'b0; 
    assign o_rx_pma_ready[9] = 1'b0; 
    assign hotplug_status[9] = 8'd0; 
    assign o_hotplug_paused_fm[9] = 1'b0;
    assign o_xcvr_ready[10]   = 1'b0; 
    assign o_tx_pma_ready[10] = 1'b0; 
    assign o_rx_pma_ready[10] = 1'b0; 
    assign hotplug_status[10] = 8'd0; 
    assign o_hotplug_paused_fm[10] = 1'b0;
    assign o_xcvr_ready[11]   = 1'b0; 
    assign o_tx_pma_ready[11] = 1'b0; 
    assign o_rx_pma_ready[11] = 1'b0; 
    assign hotplug_status[11] = 8'd0; 
    assign o_hotplug_paused_fm[11] = 1'b0;
    assign o_xcvr_ready[12]   = 1'b0; 
    assign o_tx_pma_ready[12] = 1'b0; 
    assign o_rx_pma_ready[12] = 1'b0; 
    assign hotplug_status[12] = 8'd0; 
    assign o_hotplug_paused_fm[12] = 1'b0;
    assign o_xcvr_ready[13]   = 1'b0; 
    assign o_tx_pma_ready[13] = 1'b0; 
    assign o_rx_pma_ready[13] = 1'b0; 
    assign hotplug_status[13] = 8'd0; 
    assign o_hotplug_paused_fm[13] = 1'b0;
    assign o_xcvr_ready[14]   = 1'b0; 
    assign o_tx_pma_ready[14] = 1'b0; 
    assign o_rx_pma_ready[14] = 1'b0; 
    assign hotplug_status[14] = 8'd0; 
    assign o_hotplug_paused_fm[14] = 1'b0;
    assign o_xcvr_ready[15]   = 1'b0; 
    assign o_tx_pma_ready[15] = 1'b0; 
    assign o_rx_pma_ready[15] = 1'b0; 
    assign hotplug_status[15] = 8'd0; 
    assign o_hotplug_paused_fm[15] = 1'b0;









        assign o_ehip_core0_ptp_aib_tx_pll_locked = 2'd0;








        assign o_ehip_core1_ptp_aib_tx_pll_locked = 2'd0;








        assign o_ehip_core2_ptp_aib_tx_pll_locked = 2'd0;








        assign o_ehip_core3_ptp_aib_tx_pll_locked = 2'd0;


//*********************************************************************************
//************** Conv AVMM of multiple channels of a port to a single Bus**********
//*********************************************************************************

      assign i_ehip0_eth_reconfig_address[0]    = p0_eth_reconfig_address;
      assign i_ehip0_eth_reconfig_read[0]       = p0_eth_reconfig_read; 
      assign i_ehip0_eth_reconfig_write[0]      = p0_eth_reconfig_write; 
      assign i_ehip0_eth_reconfig_writedata[0]  = p0_eth_reconfig_writedata;
      assign p0_eth_reconfig_waitrequest                = o_ehip0_eth_reconfig_waitrequest[0]; 
      assign p0_eth_reconfig_readdatavalid              = o_ehip0_eth_reconfig_readdatavalid[0]; 
      assign p0_eth_reconfig_readdata                   = o_ehip0_eth_reconfig_readdata[0]; 
        //

      assign ehip0_port_profile[0] = i_p0_port_profile;
        //


      assign i_ehip0_xcvr_reconfig_address[0]    = p0_c0_xcvr_reconfig_address; 
      assign i_ehip0_xcvr_reconfig_read[0]       = p0_c0_xcvr_reconfig_read; 
      assign i_ehip0_xcvr_reconfig_write[0]      = p0_c0_xcvr_reconfig_write; 
      assign i_ehip0_xcvr_reconfig_writedata[0]  = p0_c0_xcvr_reconfig_writedata[7:0];
      assign p0_c0_xcvr_reconfig_waitrequest      = o_ehip0_xcvr_reconfig_waitrequest[0];
      assign p0_c0_xcvr_reconfig_readdatavalid    = o_ehip0_xcvr_reconfig_readdatavalid[0];
      assign p0_c0_xcvr_reconfig_readdata         = o_ehip0_xcvr_reconfig_readdata[0];
          //



      assign app_ss_ehip0_st_client_clk[0]   = app_ss_p0_st_client_clk;
      assign ehip0_axi_st_bridge_tx_rst_n[0] = p0_axi_st_bridge_tx_rst_n;
      assign app_ss_ehip0_tx_tvalid[0]       = app_ss_p0_tx_tvalid;
      assign app_ss_ehip0_tx_tlast[0]        = app_ss_p0_tx_tlast;
      assign app_ss_ehip0_tx_tkeep[0]        = app_ss_p0_tx_tkeep;
      assign app_ss_ehip0_tx_tdata[0]        = app_ss_p0_tx_tdata;
      assign app_ss_ehip0_tx_tuser_client[0] = app_ss_p0_tx_tuser_client;
      assign app_ss_ehip0_tx_tuser_ptp[0]    = app_ss_p0_tx_tuser_ptp;
      assign app_ss_ehip0_tx_tuser_ptp_extended[0] = app_ss_p0_tx_tuser_ptp_extended;
      assign app_ss_ehip0_tx_tuser_pkt_seg_parity[0] = app_ss_p0_tx_tuser_pkt_seg_parity;
      assign ss_app_p0_tx_tready                     = ss_app_ehip0_tx_tready[0]; 

      assign app_ss_ehip0_st_clk[0]   = app_ss_p0_st_clk;
      assign ehip0_axi_st_bridge_rx_rst_n[0] = p0_axi_st_bridge_rx_rst_n;
      assign ss_app_p0_rx_tvalid              = ss_app_ehip0_rx_tvalid[0]; 
      assign ss_app_p0_rx_tlast               = ss_app_ehip0_rx_tlast [0]; 
      assign ss_app_p0_rx_tkeep               = ss_app_ehip0_rx_tkeep[0];
      assign ss_app_p0_rx_tdata               = ss_app_ehip0_rx_tdata[0];
      assign ss_app_p0_rx_tuser_client        = ss_app_ehip0_rx_tuser_client[0];
      assign ss_app_p0_rx_tuser_sts           = ss_app_ehip0_rx_tuser_sts[0];
      assign ss_app_p0_rx_tuser_sts_extended  = ss_app_ehip0_rx_tuser_sts_extended[0];
      assign ss_app_p0_rx_tuser_pkt_seg_parity  = ss_app_ehip0_rx_tuser_pkt_seg_parity[0];



        //

    assign i_ehip0_tx_pause[0] = i_p0_tx_pause;
    assign i_ehip0_tx_pfc[0]   = i_p0_tx_pfc;
    assign o_p0_rx_pause = o_ehip0_rx_pause[0];
    assign o_p0_rx_pfc   = o_ehip0_rx_pfc[0];
  //
    assign app_ss_ehip0_st_txtod_tvalid[0] = app_ss_p0_st_txtod_tvalid;
    assign app_ss_ehip0_st_txtod_tdata[0]  = app_ss_p0_st_txtod_tdata;
    assign app_ss_ehip0_st_rxtod_tvalid[0] = app_ss_p0_st_rxtod_tvalid;
    assign app_ss_ehip0_st_rxtod_tdata[0]  = app_ss_p0_st_rxtod_tdata;
  //
    assign ss_app_p0_st_txegrts0_tvalid  = ss_app_ehip0_st_txegrts0_tvalid[0];
    assign ss_app_p0_st_txegrts0_tdata   = ss_app_ehip0_st_txegrts0_tdata[0];
    assign ss_app_p0_st_rxingrts0_tvalid = ss_app_ehip0_st_rxingrts0_tvalid[0];
    assign ss_app_p0_st_rxingrts0_tdata  = ss_app_ehip0_st_rxingrts0_tdata[0];

    assign o_p0_tx_ptp_ready         = o_ehip0_tx_ptp_ready[0];
    assign o_p0_rx_ptp_ready         = o_ehip0_rx_ptp_ready[0];
  //
    assign p0_tx_lanes_stable        = ehip0_tx_lanes_stable[0];
    assign p0_rx_pcs_ready           = ehip0_rx_pcs_ready[0];
    assign p0_tx_fifo_eccstatus      = ehip0_tx_fifo_eccstatus[0];
    assign p0_axi_st_tx_parity_error = ehip0_axi_st_tx_parity_error[0];
    assign o_p0_rx_pcs_fully_aligned = o_ehip0_rx_pcs_fully_aligned[0];
    assign o_p0_tx_pll_locked        = o_ehip0_tx_pll_locked[0];
  //
    assign o_p0_sl_tx_dl_async_pulse = o_ehip0_sl_tx_dl_async_pulse[0];
    assign o_p0_sl_rx_dl_async_pulse = o_ehip0_sl_rx_dl_async_pulse[0];
    assign i_ehip0_sl_latency_sclk[0]      = i_p0_sl_latency_sclk;
    assign i_ehip0_sl_tx_dl_measure_sel[0] = i_p0_sl_tx_dl_measure_sel;
    assign i_ehip0_sl_rx_dl_measure_sel[0] = i_p0_sl_rx_dl_measure_sel;
  //
    assign o_p0_txfifo_pfull     = o_ehip0_txfifo_pfull[0];
    assign o_p0_txfifo_pempty    = o_ehip0_txfifo_pempty[0];
    assign o_p0_txfifo_overflow  = o_ehip0_txfifo_overflow[0];
    assign o_p0_txfifo_underflow = o_ehip0_txfifo_underflow[0];
    assign i_ehip0_custom_cadence[0]   = i_p0_custom_cadence; 
  //

    assign o_p0_rx_block_lock       = o_ehip0_rx_block_lock[0];
    assign o_p0_rx_am_lock          = o_ehip0_rx_am_lock[0]; //setting same value to all ports
    assign o_p0_local_fault_status  = o_ehip0_local_fault_status[0];
    assign o_p0_remote_fault_status = o_ehip0_remote_fault_status[0];
    assign o_p0_rx_hi_ber           = o_ehip0_rx_hi_ber[0];
    assign o_p0_ehip_ready          = o_ehip0_ehip_ready[0];
    assign o_p0_cdr_lock            = o_ehip0_cdr_lock[0];
    assign o_p0_link_status         = o_ehip0_link_status[0];
        //



//************************************************************************************
//************** DR Conv AVMM of multiple channels of a port to a single Bus**********
//************************************************************************************
//*********************************************************************************

//*********************************************************************************
//********************* non-DR EHIP IP TOP level for each ports *******************
//*********************************************************************************

        hssi_ss_ip_top_p0_n5d742a
        #(
// EHIP paramters for all ports within the inst are same
// Taking 1st port paramters with inthe inst

          .NUM_CHANNELS                  (EHIP0_CHANNEL),
          .NUM_XCVR_CHANNELS             (EHIP0_XCVR_CHANNEL),
          .DATA_WIDTH                    (PORT0_DATA_WIDTH),
          .NO_OF_BYTES                   (PORT0_DATA_WIDTH/8),
          .AXI_READY_LATENCY             (EHIP0_AXI_READY_LATENCY),
          .PTP_TX_CLASSIFIER_ENABLE      (EHIP0_PTP_TX_CLASSIFIER_ENABLE),
          .PKT_SEG_PARITY_EN             (EHIP0_PKT_SEG_PARITY_EN),
          .PORT_PROFILE                  (PORT0_PROFILE),
          .ENABLE_ECC                    (ENABLE_ECC),
          .sim_mode                      (SIM_MODE ? "enable" : "disable"),
          .Tiles                         (Tiles)
          ) U_hssi_ss_ip_top_p0
        (
      .i_clk_ref(i_clk_ref),

      .i_clk_tx_tod(i_ehip0_clk_tx_tod), 
      .i_clk_rx_tod(i_ehip0_clk_rx_tod),

      .i_clk_ptp_sample(i_p0_clk_ptp_sample), 
      .i_reconfig_clk(i_p0_reconfig_clk),
      .i_port_port_profile(ehip0_port_profile),

      .o_clk_pll(o_ehip0_clk_pll),  
      .o_clk_pll_div(o_ehip0_clk_tx_div),
      .o_clk_rec_div64(o_ehip0_clk_rec_div64),
      .o_clk_rec_div(o_ehip0_clk_rec_div),


      .i_csr_rst_n(ehip0_csr_rst_n),
      .i_tx_rst_n(ehip0_tx_rst_n),  
      .i_rx_rst_n(ehip0_rx_rst_n),

      .i_reconfig_reset(p0_reconfig_rst),

      //Srl interface signals
      .i_rx_serial(ehip0_rx_serial),
      .i_rx_serial_n(ehip0_rx_serial_n),
      .o_tx_serial(ehip0_tx_serial),
      .o_tx_serial_n(ehip0_tx_serial_n),
    //AXI4 Lite Bridge Signals
      .i_eth_reconfig_addr            (i_ehip0_eth_reconfig_address),
      .i_eth_reconfig_read            (i_ehip0_eth_reconfig_read),
      .i_eth_reconfig_write           (i_ehip0_eth_reconfig_write),
      .o_eth_reconfig_waitrequest     (o_ehip0_eth_reconfig_waitrequest),
      .o_eth_reconfig_readdatavalid   (o_ehip0_eth_reconfig_readdatavalid),
      .o_eth_reconfig_readdata        (o_ehip0_eth_reconfig_readdata),
      .i_eth_reconfig_writedata       (i_ehip0_eth_reconfig_writedata),
      //.i_stats_snapshot(),
      //
      .i_xcvr_reconfig_address        (i_ehip0_xcvr_reconfig_address),
      .i_xcvr_reconfig_read           (i_ehip0_xcvr_reconfig_read),
      .i_xcvr_reconfig_write          (i_ehip0_xcvr_reconfig_write),
      .o_xcvr_reconfig_waitrequest    (o_ehip0_xcvr_reconfig_waitrequest),
      .o_xcvr_reconfig_readdatavalid  (o_ehip0_xcvr_reconfig_readdatavalid),
      .o_xcvr_reconfig_readdata       (o_ehip0_xcvr_reconfig_readdata),
      .i_xcvr_reconfig_writedata      (i_ehip0_xcvr_reconfig_writedata),
      //
      //AXI Stream Tx, from User interface
      .app_ss_st_client_clk(app_ss_ehip0_st_client_clk),
      .app_ss_st_client_areset_n(ehip0_axi_st_bridge_tx_rst_n),
      .ss_app_tx_tready(ss_app_ehip0_tx_tready),
      .app_ss_tx_tvalid(app_ss_ehip0_tx_tvalid),
      .app_ss_tx_tdata(app_ss_ehip0_tx_tdata),
      .app_ss_tx_tlast(app_ss_ehip0_tx_tlast),
      .app_ss_tx_tkeep(app_ss_ehip0_tx_tkeep),
      .app_ss_tx_tuser_client(app_ss_ehip0_tx_tuser_client),
      .app_ss_tx_tuser_ptp(app_ss_ehip0_tx_tuser_ptp),
      .app_ss_tx_tuser_ptp_extended(app_ss_ehip0_tx_tuser_ptp_extended),
      .app_ss_tx_tuser_pkt_seg_parity(app_ss_ehip0_tx_tuser_pkt_seg_parity),
      //AXI Stream Rx, to User interface
      .app_ss_st_clk(app_ss_ehip0_st_clk),
      .app_ss_st_areset_n(ehip0_axi_st_bridge_rx_rst_n),
      .ss_app_rx_tvalid(ss_app_ehip0_rx_tvalid),
      .ss_app_rx_tdata(ss_app_ehip0_rx_tdata),
      .ss_app_rx_tlast(ss_app_ehip0_rx_tlast),
      .ss_app_rx_tkeep(ss_app_ehip0_rx_tkeep),
      .ss_app_rx_tuser_client(ss_app_ehip0_rx_tuser_client),
      .ss_app_rx_tuser_pkt_seg_parity(ss_app_ehip0_rx_tuser_pkt_seg_parity),    
      .ss_app_rx_tuser_sts(ss_app_ehip0_rx_tuser_sts),
      .ss_app_rx_tuser_sts_extended(ss_app_ehip0_rx_tuser_sts_extended),
      //
      .i_tx_pause(i_ehip0_tx_pause),
      .i_tx_pfc(i_ehip0_tx_pfc),
      .o_rx_pause(o_ehip0_rx_pause),
      .o_rx_pfc(o_ehip0_rx_pfc),
      //
      .app_ss_st_txtod_tvalid(app_ss_ehip0_st_txtod_tvalid),
      .app_ss_st_txtod_tdata(app_ss_ehip0_st_txtod_tdata),
      .app_ss_st_rxtod_tvalid(app_ss_ehip0_st_rxtod_tvalid),
      .app_ss_st_rxtod_tdata(app_ss_ehip0_st_rxtod_tdata),
      //
      .ss_app_st_txegrts0_tvalid(ss_app_ehip0_st_txegrts0_tvalid),
      .ss_app_st_txegrts0_tdata(ss_app_ehip0_st_txegrts0_tdata),
      //
      .ss_app_st_rxingrts0_tvalid(ss_app_ehip0_st_rxingrts0_tvalid),
      .ss_app_st_rxingrts0_tdata(ss_app_ehip0_st_rxingrts0_tdata),
      //.o_ptp_rx_its_valid(o_ptp_rx_its_valid),
      //
      .o_tx_ptp_ready(o_ehip0_tx_ptp_ready),
      .o_rx_ptp_ready(o_ehip0_rx_ptp_ready),
      .i_custom_cadence(i_ehip0_custom_cadence),
      //DL
      .o_sl_tx_dl_async_pulse(o_ehip0_sl_tx_dl_async_pulse),
      .o_sl_rx_dl_async_pulse(o_ehip0_sl_rx_dl_async_pulse),
      .i_sl_latency_sclk(i_ehip0_sl_latency_sclk),
      .i_sl_tx_dl_measure_sel(i_ehip0_sl_tx_dl_measure_sel),
      .i_sl_rx_dl_measure_sel(i_ehip0_sl_rx_dl_measure_sel),
      //
      .o_xcvr_ready(o_ehip0_xcvr_ready), 
      .o_tx_pma_ready(o_ehip0_tx_pma_ready),
      .o_rx_pma_ready(o_ehip0_rx_pma_ready),
      .o_cdr_lock(o_ehip0_cdr_lock), //CSR 100g=1, 25G=n 
      .o_link_status(o_ehip0_link_status),
      .o_tx_pll_locked(o_ehip0_tx_pll_locked), //100G=1,25G=n
      .o_rx_pcs_fully_aligned(o_ehip0_rx_pcs_fully_aligned), //TBD not there in gen ip 
      //
      .o_tx_lanes_stable(ehip0_tx_lanes_stable),
      .o_rx_pcs_ready(ehip0_rx_pcs_ready), 
      .o_tx_fifo_eccstatus(ehip0_tx_fifo_eccstatus),
      .o_axi_st_tx_parity_error(ehip0_axi_st_tx_parity_error), 
      .o_rx_block_lock(o_ehip0_rx_block_lock), //CSR of SS
      .o_rx_am_lock(o_ehip0_rx_am_lock),  //CSR
      .o_local_fault_status(o_ehip0_local_fault_status), //CSR
      .o_remote_fault_status(o_ehip0_remote_fault_status), //CSR
      .o_rx_hi_ber(o_ehip0_rx_hi_ber), //CSR
      .o_ehip_ready(o_ehip0_ehip_ready), //CSR
      //
      .po_pma_cal_done(po_pma_cal_done),
      .hotplug_control(hotplug_control),
      .hotplug_status(ehip0_hotplug_status),
      .hotplug_disable_fm(i_ehip0_hotplug_disable_fm), 
      .hotplug_lpbk_en_fm(i_ehip0_hotplug_lpbk_en_fm), 
      .hotplug_paused_fm(o_ehip0_hotplug_paused_fm), 

      //PHY Direct Interface
      //clock resetn?

      //Gen PHY Direct signals

      //AXI PHY Direct signals
      //Custom interface signals
      .o_sl_txfifo_pfull(o_ehip0_txfifo_pfull),  //TBD fifo signals are not there for 100G
      .o_sl_txfifo_pempty(o_ehip0_txfifo_pempty),
      .o_sl_txfifo_overflow(o_ehip0_txfifo_overflow),
      .o_sl_txfifo_underflow(o_ehip0_txfifo_underflow)
    );



//***********************************************************************************
//********************* 100G DR  EHIP IP TOP level for each ports *******************
//***********************************************************************************


//*********************************************************************************
//********************* DR EHIP IP TOP level for each ports *******************
//*********************************************************************************

//********************************************************************************************************************
//                                        NPHY instantiation for external AIB clock gen
//********************************************************************************************************************



endmodule

