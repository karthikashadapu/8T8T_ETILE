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
// Module            : hssi_ss_ip_top.sv
// Description       : 
// Author            : Sibajit Patnaik
// Created           : 04-Aug-2020
// Description       : This file is the top level wrapper for all the ports with in the subsystem
//                   : this is wrapper of IP core and the datapath bridges
// ==========================================================================
// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module hssi_ss_ip_top_p0_n5d742a #(
// -----------------------------------------------------
// Parameters Name              = Default  //Description
// -----------------------------------------------------
//  Child IP parameters, port wise
    parameter NUM_CHANNELS        = 1,
    parameter NUM_XCVR_CHANNELS   = 1,
    parameter DATA_WIDTH          = 64,
    parameter NO_OF_BYTES         = 8, 
    parameter [3:0] AXI_READY_LATENCY [NUM_CHANNELS-1:0] = '{default:0},
    parameter PORT_PROFILE        = "10GbE",
    parameter Tiles               = "E",
    parameter [0:0] PTP_TX_CLASSIFIER_ENABLE [NUM_CHANNELS-1:0] = '{default:0},
    parameter [0:0] PKT_SEG_PARITY_EN [NUM_CHANNELS-1:0]        = '{default:0},
    parameter HOTPLUG_EN          = 0,
    parameter PREAMBLE_EN         = 0,
    parameter ENABLE_ECC          = 0,
    //
    parameter max_refclk          = 1,
    parameter max_clkout          = 1,
    parameter sim_mode            = "disable"        //             {"disable" "enable"}

    )
   (

    // Clock and Resets
   input  wire [2:0]	                      i_clk_ref, //Native PHY IP reference clock
   input  wire [NUM_CHANNELS-1:0] [5:0]	    i_port_port_profile,
    
   //input  wire [NUM_CHANNELS-1:0]				    i_clk_tx, //TX Avalon-ST interface clock, in synchronous mode connect o_clk_pll_div64 to this
   //input  wire [NUM_CHANNELS-1:0]				    i_clk_rx, //RX Avalon-ST interface clock, in synchronous mode connect o_clk_pll_div64 to this
   input  wire [NUM_CHANNELS-1:0]           i_clk_tx_tod, //TX Avalon-ST interface clock, in synchronous mode connect o_clk_pll_div66 to this
   input  wire [NUM_CHANNELS-1:0]           i_clk_rx_tod, //TX Avalon-ST interface clock, in synchronous mode connect o_clk_pll_div66 to this
   input  wire [NUM_CHANNELS-1:0]           i_async_clk_tx, //TX Avalon-ST interface clock, in synchronous mode connect o_clk_pll_div66 to this
   input  wire [NUM_CHANNELS-1:0]           i_async_clk_rx, //TX Avalon-ST interface clock, in synchronous mode connect o_clk_pll_div66 to this   
   //output wire [NUM_CHANNELS-1:0]		        o_usr_app_clk, // this is /64 clock (402.83 MHz) EHIP system clock
   output wire [NUM_CHANNELS-1:0]		        o_clk_pll, // this is /64 clock (402.83 MHz) EHIP system clock
   output wire [NUM_CHANNELS-1:0]		        o_clk_pll_div, // this is /66 clock (390.625 MHz) EHIP system clock times 64/66
   output wire [NUM_CHANNELS-1:0]		        o_clk_rec_div64, // this is /64 clock (402.83 MHz), receovered clock
   output wire [NUM_CHANNELS-1:0]		        o_clk_rec_div, // this is /66 clock (390.625 MHz), receovered clock
   input wire 				                      i_reconfig_clk, 
   input wire  [0:0]                        i_clk_ptp_sample,
   //Reset Signals
   input wire  [NUM_CHANNELS-1:0]				    i_csr_rst_n, // Resets the entire Ethernet core. Active low.
   input wire  [NUM_CHANNELS-1:0]				    i_tx_rst_n, //Resets the TX digital path (Ethernet MAC and Ethernet PCS)
   input wire  [NUM_CHANNELS-1:0]				    i_rx_rst_n, // Resets the RX digital path (Ethernet MAC, PCS)
   input wire 				                      i_reconfig_reset,
    
    // High speed serial Pins
   input  wire [NUM_XCVR_CHANNELS-1:0]      i_rx_serial,
   output wire [NUM_XCVR_CHANNELS-1:0]      o_tx_serial,
   input  wire [NUM_XCVR_CHANNELS-1:0]      i_rx_serial_n,
   output wire [NUM_XCVR_CHANNELS-1:0]      o_tx_serial_n,
   //Reconfig interface

   input  wire [12*NUM_CHANNELS-1:0]        i_eth_reconfig_addr,
   input  wire [NUM_CHANNELS-1:0]           i_eth_reconfig_read,
   input  wire [NUM_CHANNELS-1:0]           i_eth_reconfig_write,
   input  wire [32*NUM_CHANNELS-1:0]        i_eth_reconfig_writedata,
   output wire [32*NUM_CHANNELS-1:0]        o_eth_reconfig_readdata,
   output wire [NUM_CHANNELS-1:0]           o_eth_reconfig_readdatavalid,
   output wire [NUM_CHANNELS-1:0]           o_eth_reconfig_waitrequest,

  //XCVR Reconfig Interface, seperate one for each lane


   // Seperate XCVR reconfig Interfaces for each xcvr lane
   input wire [17*NUM_XCVR_CHANNELS-1:0]    i_xcvr_reconfig_address,
   input wire [NUM_XCVR_CHANNELS-1:0]       i_xcvr_reconfig_read,
   input wire [NUM_XCVR_CHANNELS-1:0]       i_xcvr_reconfig_write,
   input wire [8*NUM_XCVR_CHANNELS-1:0]     i_xcvr_reconfig_writedata, 
   output reg [8*NUM_XCVR_CHANNELS-1:0]     o_xcvr_reconfig_readdata,
   output reg [NUM_XCVR_CHANNELS-1:0]       o_xcvr_reconfig_readdatavalid,
   output wire [NUM_XCVR_CHANNELS-1:0]      o_xcvr_reconfig_waitrequest, 	//AVMM stalling signal. The read/write cycle is only complete when this signal goes low

   //PTP Parser AXI interface
	 input   [NUM_CHANNELS-1:0][7:0]          ptp_parser_reconfig_awaddr, 
	 input   [NUM_CHANNELS-1:0][2:0]          ptp_parser_reconfig_awprot, 
	 input   [NUM_CHANNELS-1:0]               ptp_parser_reconfig_awvalid,
	 output  [NUM_CHANNELS-1:0]               ptp_parser_reconfig_awready,
	 input   [NUM_CHANNELS-1:0][31:0]         ptp_parser_reconfig_wdata,  
	 input   [NUM_CHANNELS-1:0][3:0]          ptp_parser_reconfig_wstrb,  
	 input   [NUM_CHANNELS-1:0]               ptp_parser_reconfig_wvalid, 
	 output  [NUM_CHANNELS-1:0]               ptp_parser_reconfig_wready, 
	 output  [NUM_CHANNELS-1:0][1:0]          ptp_parser_reconfig_bresp,  
	 output  [NUM_CHANNELS-1:0]               ptp_parser_reconfig_bvalid, 
	 input   [NUM_CHANNELS-1:0]               ptp_parser_reconfig_bready, 
	 input   [NUM_CHANNELS-1:0][7:0]          ptp_parser_reconfig_araddr, 
	 input   [NUM_CHANNELS-1:0][2:0]          ptp_parser_reconfig_arprot, 
	 input   [NUM_CHANNELS-1:0]               ptp_parser_reconfig_arvalid,
	 output  [NUM_CHANNELS-1:0]               ptp_parser_reconfig_arready,
	 output  [NUM_CHANNELS-1:0][31:0]         ptp_parser_reconfig_rdata,  
	 output  [NUM_CHANNELS-1:0][1:0]          ptp_parser_reconfig_rresp,  
	 output  [NUM_CHANNELS-1:0]               ptp_parser_reconfig_rvalid, 
	 input   [NUM_CHANNELS-1:0]               ptp_parser_reconfig_rready, 

    // TX MAC Interface
   input  [NUM_CHANNELS-1:0]                app_ss_st_client_clk,
   input  [NUM_CHANNELS-1:0]                app_ss_st_client_areset_n,
   input  [NUM_CHANNELS-1:0]                app_ss_tx_tvalid,
   output [NUM_CHANNELS-1:0]                ss_app_tx_tready,
   input  [NUM_CHANNELS-1:0][DATA_WIDTH-1:0]  app_ss_tx_tdata,
   input  [NUM_CHANNELS-1:0][NO_OF_BYTES-1:0] app_ss_tx_tkeep,
   input  [NUM_CHANNELS-1:0]                app_ss_tx_tlast,
   input  [NUM_CHANNELS-1:0][1:0]           app_ss_tx_tuser_client,
   input  [NUM_CHANNELS-1:0][93:0]          app_ss_tx_tuser_ptp,
   input  [NUM_CHANNELS-1:0][327:0]         app_ss_tx_tuser_ptp_extended,
	 input  [NUM_CHANNELS-1:0]                app_ss_tx_tuser_pkt_seg_parity,
    // RX MAC Interface
   input  [NUM_CHANNELS-1:0]                app_ss_st_clk,
   input  [NUM_CHANNELS-1:0]                app_ss_st_areset_n,
   output [NUM_CHANNELS-1:0]                ss_app_rx_tvalid,
   output [NUM_CHANNELS-1:0][DATA_WIDTH-1:0]  ss_app_rx_tdata,
   output [NUM_CHANNELS-1:0][NO_OF_BYTES-1:0] ss_app_rx_tkeep,
   output [NUM_CHANNELS-1:0]                ss_app_rx_tlast,
   output [NUM_CHANNELS-1:0][6:0]           ss_app_rx_tuser_client,
   output [NUM_CHANNELS-1:0][4:0]           ss_app_rx_tuser_sts,
   output [NUM_CHANNELS-1:0][31:0]          ss_app_rx_tuser_sts_extended,
   output [NUM_CHANNELS-1:0]                ss_app_rx_tuser_pkt_seg_parity,
   // ----------------------------------
   //PHY Direct Interface
   input  [NUM_CHANNELS-1:0]                app_ss_st_txphydirect_clk,
   input  [NUM_CHANNELS-1:0]                app_ss_st_txphydirect_areset_n,
   input  [NUM_CHANNELS*DATA_WIDTH-1:0]     app_ss_st_txphydirect_data,
   input  [NUM_CHANNELS-1:0]                app_ss_st_txphydirect_valid,
   output [NUM_CHANNELS-1:0]                ss_app_st_txphydirect_tready,
   input  [NUM_CHANNELS-1:0]                app_ss_st_rxphydirect_clk,
   input  [NUM_CHANNELS-1:0]                app_ss_st_rxphydirect_areset_n,
   output [NUM_CHANNELS*DATA_WIDTH-1:0]     ss_app_st_rxphydirect_data,
   output [NUM_CHANNELS-1:0]                ss_app_st_rxphydirect_valid,

   //rev_2_givx.Port wise.1bit/ehip
   output  [NUM_CHANNELS-1:0]            o_sl_rx_pma_ready,
   output  [NUM_CHANNELS-1:0]            o_sl_tx_pma_ready,
   output  [NUM_CHANNELS-1:0]            o_sl_aib_txfifo_empty,
   output  [NUM_CHANNELS-1:0]            o_sl_aib_txfifo_full,
   output  [NUM_CHANNELS-1:0]            o_sl_aib_txfifo_pempty,
   output  [NUM_CHANNELS-1:0]            o_sl_aib_txfifo_pfull,
   output  [NUM_CHANNELS-1:0]            o_sl_aib_rxfifo_empty,
   output  [NUM_CHANNELS-1:0]            o_sl_aib_rxfifo_full,
   output  [NUM_CHANNELS-1:0]            o_sl_aib_rxfifo_pempty,
   output  [NUM_CHANNELS-1:0]            o_sl_aib_rxfifo_pfull,
   input   [NUM_CHANNELS-1:0]            i_sl_aib_rxfifo_rd_en, //TBD
   
   // ----------------------------------
   // Flow Control
   input  wire [NUM_CHANNELS-1:0]           i_tx_pause,         // Only available if pause flow control is enabled. Asserted to send a pause frame.
   input  wire [8*NUM_CHANNELS-1:0]         i_tx_pfc,           // Only available if priority flow control is enabled. Used to send a pfc frame
   output wire [NUM_CHANNELS-1:0]           o_rx_pause,          // Indicates that a pause frame was received.
   output wire [8*NUM_CHANNELS-1:0]         o_rx_pfc,            // Indicates that a pfc frame was received for priority queue n, where n is the bit number that was asserted. 
   // PTP
   input  wire [NUM_CHANNELS-1:0]           app_ss_st_txtod_tvalid,
   input  wire [NUM_CHANNELS*96-1:0]        app_ss_st_txtod_tdata,
   input  wire [NUM_CHANNELS-1:0]           app_ss_st_rxtod_tvalid,
   input  wire [NUM_CHANNELS*96-1:0]        app_ss_st_rxtod_tdata,

   // User Interface: TX 2-step Timestamp Return
   output wire [NUM_CHANNELS-1:0]           ss_app_st_txegrts0_tvalid,
   output wire [NUM_CHANNELS*104-1:0]       ss_app_st_txegrts0_tdata,
   output wire [NUM_CHANNELS-1:0]           ss_app_st_rxingrts0_tvalid,
   output wire [NUM_CHANNELS*96-1:0]        ss_app_st_rxingrts0_tdata,
   //output wire                              o_ptp_rx_its_valid, 

   // User Interface: PTP Status
   //1ns
   output wire [NUM_CHANNELS-1:0]           o_tx_ptp_ready,
   output wire [NUM_CHANNELS-1:0]           o_rx_ptp_ready,

   // Custom Rate Interface
   input  wire [NUM_CHANNELS-1:0]           i_custom_cadence,

   // Deterministic Latency Interface
   output wire [NUM_CHANNELS-1:0]           o_sl_tx_dl_async_pulse,
   output wire [NUM_CHANNELS-1:0]           o_sl_rx_dl_async_pulse,
   input  wire [NUM_CHANNELS-1:0]           i_sl_latency_sclk,
   input  wire [NUM_CHANNELS-1:0]           i_sl_tx_dl_measure_sel,
   input  wire [NUM_CHANNELS-1:0]           i_sl_rx_dl_measure_sel,
   
   // Status
   output wire [NUM_CHANNELS-1:0]	          o_rx_pcs_fully_aligned,  //Signal to indicate that the TX PLL has locked.
   output wire [NUM_CHANNELS-1:0]	          o_tx_pll_locked,         //Signal to indicate that the TX PLL has locked.
   output wire [NUM_CHANNELS-1:0]						o_rx_am_lock,            // Asserted when RX PCS has found detected alignment markers and deskewed PCS lanes.
   output wire [NUM_CHANNELS-1:0]		        o_cdr_lock,              //Signal to indicate that the PMA has locked to data.
   output wire [NUM_CHANNELS-1:0]	[2:0]     o_link_status,  
   output wire [NUM_XCVR_CHANNELS-1:0]		  o_xcvr_ready,
   output wire [NUM_XCVR_CHANNELS-1:0]      o_tx_pma_ready,
   output wire [NUM_XCVR_CHANNELS-1:0]      o_rx_pma_ready,

   output wire [NUM_CHANNELS-1:0]           o_tx_lanes_stable,       // Asserted when TX MAC is ready to send data
   output wire [NUM_CHANNELS-1:0]           o_rx_pcs_ready,          // Asserted when RX PCS is ready to receive data
   output wire [NUM_CHANNELS-1:0]           o_rx_block_lock,         // Asserted when 66b block alignment is finished on all PCS lanes
   output wire [NUM_CHANNELS-1:0]           o_local_fault_status,    // The RX PCS has detected a problem that prevents it from being able to receive data
   output wire [NUM_CHANNELS-1:0]           o_remote_fault_status,   // The remote link partner has sent remote fault ordered sets indicating that it is unable to receive data.
   output wire [NUM_CHANNELS-1:0]           o_rx_hi_ber,             // Indicates RX PCS Hi BER state in the selected channel
   output wire [NUM_CHANNELS-1:0]           o_ehip_ready,            //Signal to indicate that EHIP CSRs are ready.

   //hotplug status/control
   input                                    po_pma_cal_done,
   input  [31:0]                            hotplug_control,
   output [NUM_XCVR_CHANNELS-1:0] [7:0]     hotplug_status,
	 input  [NUM_XCVR_CHANNELS-1:0] 					hotplug_disable_fm,			 //This per XCVR channel, so in 100G case FM must write 0xF to disable all 4 channels hotplug
	 input  [NUM_XCVR_CHANNELS-1:0] 					hotplug_lpbk_en_fm,			 //This per XCVR channel, so in 100G case FM must write 0xF to disable all 4 channels hotplug
	 output [NUM_XCVR_CHANNELS-1:0] 					hotplug_paused_fm,
  //
   output      [NUM_CHANNELS-1:0]           o_tx_fifo_eccstatus,	
   output      [NUM_CHANNELS-1:0]  			    o_axi_st_tx_parity_error,	

   // XCVR FIFO Interface
   output wire [NUM_CHANNELS-1:0]           o_sl_txfifo_pfull,
   output wire [NUM_CHANNELS-1:0]           o_sl_txfifo_pempty,
   output wire [NUM_CHANNELS-1:0]           o_sl_txfifo_overflow,
   output wire [NUM_CHANNELS-1:0]           o_sl_txfifo_underflow

);

//************************************************************************************************
//************************************************************************************************
localparam EMPTY_BITS = 3;
localparam SIM_EMULATE = (sim_mode == "enable") ? 1'b1 : 1'b0;
localparam PHY_DIRECT_MODE = 0 ;
//TBD 100G mode PCS, PMA mode width ?
localparam PCS_DW = (DATA_WIDTH == 'd80) ? 'd64 : 'd256;
localparam PCS66_DW = (DATA_WIDTH == 'd80) ? 'd66 : 'd264;
//localparam PCS_BW = (DATA_WIDTH == 'd80) ? 'd8 : 'd64;
localparam PCS_BW = (DATA_WIDTH == 'd80) ? 'd8 : 'd32;
localparam PHY_DIRECT_DW  = 'd80;


wire [max_clkout-1:0]		            o_tx_pll_clk_div64;
wire [max_clkout-1:0]		            o_tx_pll_clk_div66;
wire [max_clkout-1:0]		            o_rx_pll_clk_div64;
wire [max_clkout-1:0]		            o_rx_pll_clk_div66;
wire [NUM_CHANNELS-1:0]				      i_cpri_csr_rst_n;
wire [NUM_CHANNELS-1:0]				      i_cpri_tx_rst_n;
wire [NUM_CHANNELS-1:0]				      i_cpri_rx_rst_n;
wire 			                          i_cpri_reconfig_reset;

reg  [19*NUM_XCVR_CHANNELS-1:0]     i_xcvr_reconfig_address_int;
reg  [19*2-1:0]                     i_ptp_reconfig_address_int;
wire [11-1:0]                       i_rsfec_reconfig_addr_int;
wire                                o_rsfec_reconfig_waitrequest_int;
wire [7:0]                          o_rsfec_reconfig_readdata_int;
wire                                i_rsfec_reconfig_read_int;
reg  [10:0]                         rsfec_wait_cntr;
wire [NUM_XCVR_CHANNELS-1:0]        o_xcvr_reconfig_waitrequest_int;
wire [8*NUM_XCVR_CHANNELS-1:0]      o_xcvr_reconfig_readdata_int;
wire [1:0]                          o_ptp_reconfig_waitrequest_int;
wire [8*2-1:0]                      o_ptp_reconfig_readdata_int;
wire [19*NUM_CHANNELS-1:0]          i_eth_reconfig_addr_int;
wire [19*NUM_CHANNELS-1:0]          ehip_eth_reconfig_addr_int;
wire [12*NUM_CHANNELS-1:0]          ehip_eth_reconfig_addr;
wire [NUM_CHANNELS-1:0]             ehip_eth_reconfig_read;
wire [NUM_CHANNELS-1:0]             ehip_eth_reconfig_write;
wire [32*NUM_CHANNELS-1:0]          ehip_eth_reconfig_writedata;
wire [32*NUM_CHANNELS-1:0]          ehip_eth_reconfig_readdata;
wire [NUM_CHANNELS-1:0]             ehip_eth_reconfig_readdatavalid;
wire [NUM_CHANNELS-1:0]             ehip_eth_reconfig_waitrequest;
//muxed reconfig bus from hotplug
wire [19*NUM_CHANNELS-1:0]          eth_reconfig_hp_mux_address;
wire [NUM_CHANNELS-1:0]             eth_reconfig_hp_mux_read;
wire [NUM_CHANNELS-1:0]             eth_reconfig_hp_mux_write;
wire [32*NUM_CHANNELS-1:0]          eth_reconfig_hp_mux_writedata;
wire [32*NUM_CHANNELS-1:0]          eth_reconfig_hp_mux_readdata;
wire [NUM_CHANNELS-1:0]             eth_reconfig_hp_mux_waitrequest;
wire [NUM_CHANNELS-1:0]             eth_reconfig_hp_mux_readdatavalid;
//
wire [19*NUM_XCVR_CHANNELS-1:0]     xcvr_reconfig_address;
wire [NUM_XCVR_CHANNELS-1:0]        xcvr_reconfig_read;
wire [NUM_XCVR_CHANNELS-1:0]        xcvr_reconfig_write;
wire [NUM_XCVR_CHANNELS-1:0]        xcvr_reconfig_waitrequest;
wire [8*NUM_XCVR_CHANNELS-1:0]      xcvr_reconfig_readdata;
wire [8*NUM_XCVR_CHANNELS-1:0]      xcvr_reconfig_writedata;

wire                                o_rx_am_lock_int;
wire [NUM_CHANNELS*96-1:0]          o_ptp_ets;
wire [NUM_CHANNELS*8-1:0]           o_ptp_ets_fp;
wire [NUM_CHANNELS*96-1:0]          o_ptp_rx_its;
//reg  [NUM_CHANNELS*96-1:0]          app_ss_st_txtod_tdata_reg;
//reg  [NUM_CHANNELS*96-1:0]          app_ss_st_rxtod_tdata_reg;

wire 								                o_rx_am_lock_sync;
wire [NUM_XCVR_CHANNELS-1:0]		    o_cdr_lock_int;
wire [NUM_XCVR_CHANNELS-1:0]		    o_cdr_lock_sync;
wire [NUM_CHANNELS-1:0]             o_rx_block_lock_int;
wire [NUM_CHANNELS-1:0]             o_local_fault_status_int;
wire [NUM_CHANNELS-1:0]             o_remote_fault_status_int;
wire [NUM_CHANNELS-1:0]             o_rx_hi_ber_int;
wire [NUM_CHANNELS-1:0]             o_ehip_ready_int;
wire [NUM_XCVR_CHANNELS-1:0]		    o_xcvr_ready_int;
wire [NUM_XCVR_CHANNELS-1:0]        o_tx_pma_ready_int;
wire [NUM_XCVR_CHANNELS-1:0]        o_rx_pma_ready_int;

wire [NUM_CHANNELS-1:0]             i_av_st_tx_ready;
wire [NUM_CHANNELS-1:0]             o_av_st_tx_valid;
wire [NUM_CHANNELS-1:0][DATA_WIDTH-1:0]  o_av_st_tx_data;
wire [NUM_CHANNELS-1:0]             o_av_st_tx_startofpacket;
wire [NUM_CHANNELS-1:0]             o_av_st_tx_endofpacket;
wire [NUM_CHANNELS-1:0][EMPTY_BITS-1:0]  o_av_st_tx_empty;
wire [NUM_CHANNELS-1:0]             o_av_st_tx_error;
wire [NUM_CHANNELS-1:0]             o_av_st_tx_skip_crc;

wire [NUM_CHANNELS-1:0][1:0]        o_av_st_tx_ptp_ts_valid;
wire [NUM_CHANNELS-1:0]        o_av_st_tx_ptp_ts_req;
wire [NUM_CHANNELS-1:0]        o_av_st_tx_ptp_ins_ets;
wire [NUM_CHANNELS-1:0][31:0]  o_av_st_tx_ptp_fp;
wire [NUM_CHANNELS-1:0]        o_av_st_tx_ptp_ins_cf;
wire [NUM_CHANNELS-1:0][95:0]  o_av_st_tx_ptp_tx_its;
wire [NUM_CHANNELS-1:0][6:0]   o_av_st_tx_ptp_asym_p2p_idx;
wire [NUM_CHANNELS-1:0]        o_av_st_tx_ptp_asym_sign;
wire [NUM_CHANNELS-1:0]        o_av_st_tx_ptp_asym;
wire [NUM_CHANNELS-1:0]        o_av_st_tx_ptp_p2p;

wire [NUM_CHANNELS-1:0]             o_av_st_tx_ptp_ts_format; 
wire [NUM_CHANNELS-1:0]             o_av_st_tx_ptp_update_eb; 
wire [NUM_CHANNELS-1:0]             o_av_st_tx_ptp_zero_csum; 
wire [NUM_CHANNELS-1:0][15:0]       o_av_st_tx_ptp_eb_offset; 
wire [NUM_CHANNELS-1:0][15:0]       o_av_st_tx_ptp_csum_offset; 
wire [NUM_CHANNELS-1:0][15:0]       o_av_st_tx_ptp_cf_offset; 
wire [NUM_CHANNELS-1:0][15:0]       o_av_st_tx_ptp_ts_offset; 

wire [NUM_CHANNELS-1:0]                i_av_st_rx_valid;
wire [NUM_CHANNELS-1:0][DATA_WIDTH-1:0]i_av_st_rx_data;
wire [NUM_CHANNELS-1:0]                i_av_st_rx_startofpacket;
wire [NUM_CHANNELS-1:0]                i_av_st_rx_endofpacket;
wire [NUM_CHANNELS-1:0][EMPTY_BITS-1:0]i_av_st_rx_empty;
wire [NUM_CHANNELS-1:0][5:0]           i_av_st_rx_error;
wire [NUM_CHANNELS-1:0][39:0]          i_av_st_rxstatus_data;
wire [NUM_CHANNELS-1:0]                i_av_st_rxstatus_valid;
wire [NUM_CHANNELS-1:0][95:0]          i_av_st_ptp_rx_its;

// 10/25/100G TX MAC Interface
wire [NUM_CHANNELS-1:0]				         o_tx_ready; // Indicates that the MAC is ready to accept new data.
wire [DATA_WIDTH*NUM_CHANNELS-1:0]     i_tx_data;          // Input data to the MAC. Bits 0 is the LSB
wire [NUM_CHANNELS-1:0]						     i_tx_valid; //Indicates data TX data is valid. Must remain high throughout transmission of packet
wire [NUM_CHANNELS-1:0]						     i_tx_startofpacket; //Start of packet (SOP). Asserted for one cycle at the beginning of frame
wire [NUM_CHANNELS-1:0]						     i_tx_endofpacket; //End of packet (EOP). Asserted for one cycle on the last cycle of the frame
wire [EMPTY_BITS*NUM_CHANNELS-1:0]     i_tx_empty; // Indicates the number of empty bytes at the end of the frame. Must be valid when EOP is asserted.    
wire [NUM_CHANNELS-1:0]						     i_tx_error; // A valid high on this signal aligned with an eop will cause the tx frame to be treated as an error. 
wire [NUM_CHANNELS-1:0]						     i_tx_skip_crc;
//10/25/100G RX MAC Interface
wire [DATA_WIDTH*NUM_CHANNELS-1:0]     o_rx_data; // output data from the MAC, Bit 0 is LSB
wire [NUM_CHANNELS-1:0]                o_rx_valid; // Indicates data RX data, EOP, and SOP are valid.
wire [NUM_CHANNELS-1:0]                o_rx_startofpacket; // Start of packet (SOP). Asserted for one cycle at the beginning of frame
wire [NUM_CHANNELS-1:0]                o_rx_endofpacket; // End of packet (EOP). Asserted for one cycle on the last cycle of the frame
wire [EMPTY_BITS*NUM_CHANNELS-1:0]     o_rx_empty; // Indicates the number of empty bytes at the end of the frame. Must be valid when EOP is asserted.
wire [6*NUM_CHANNELS-1:0]              o_rx_error; // RX error bits asserted on the EOP cycle.[0] : malformed block, [1] : crc error, [2] : reserved, [3] : reserved, [4] : length error, [5] : reserved
wire [40*NUM_CHANNELS-1:0]             o_rxstatus_data; //RX frame status information. Valid on EOP cycle.[0:31] : reserved, [32] : stacked vlan frame ,[33] : vlan frame ,[34] : control frame, [35] : pause frame, [36:38] : reserved, [39] : pfc frame
wire [NUM_CHANNELS-1:0]                o_rxstatus_valid; //asserted to indicate that bits on o_rxstatus_data are valid

// User Interface: TX 2-step Timestamp Request
wire [NUM_CHANNELS-1:0]             i_ptp_ts_req;
wire [8*NUM_CHANNELS-1:0]           i_ptp_fp;
// User Interface: TX 1-step Command
wire [NUM_CHANNELS-1:0]             i_ptp_ins_ets;
wire [NUM_CHANNELS-1:0]             i_ptp_ins_cf;
wire [96*NUM_CHANNELS-1:0]          i_ptp_tx_its;
wire [NUM_CHANNELS-1:0]             i_ptp_zero_csum;
wire [NUM_CHANNELS-1:0]             i_ptp_update_eb;
wire [NUM_CHANNELS-1:0]             i_ptp_ts_format;
wire [16*NUM_CHANNELS-1:0]          i_ptp_ts_offset;
wire [16*NUM_CHANNELS-1:0]          i_ptp_cf_offset;
wire [16*NUM_CHANNELS-1:0]          i_ptp_csum_offset;
wire [16*NUM_CHANNELS-1:0]          i_ptp_eb_offset;
wire [3:0]                          hotplug_lane_down; // used only in 100G-ANLT
wire [3:0]                          hotplug_anlt_pause_state; // used only in 100G-ANLT

//************************************************************************************************
//****************************************** Signals TBD   ***************************************
//************************************************************************************************

 // TX MAC Interface
logic [NUM_CHANNELS-1:0]                app_ss_tx_mux_tvalid;
logic [NUM_CHANNELS-1:0]                ss_app_tx_mux_tready;
logic [NUM_CHANNELS-1:0][DATA_WIDTH-1:0]  app_ss_tx_mux_tdata;
logic [NUM_CHANNELS-1:0][NO_OF_BYTES-1:0] app_ss_tx_mux_tkeep;
logic [NUM_CHANNELS-1:0]                app_ss_tx_mux_tlast;
logic [NUM_CHANNELS-1:0][1:0]           app_ss_tx_mux_tuser_client;
logic [NUM_CHANNELS-1:0][0:0]           app_ss_tx_mux_tuser_pkt_seg_parity;
logic [NUM_CHANNELS-1:0][47:0]          app_ss_tx_mux_tuser_ptp_tmp;
logic [NUM_CHANNELS-1:0][94-1:0]        app_ss_tx_mux_tuser_ptp;
logic [NUM_CHANNELS-1:0][327:0]         app_ss_tx_mux_tuser_ptp_extended;
logic [NUM_CHANNELS-1:0][163:0]         app_ss_tx_mux_tuser_ptp_extended_tmp;

logic [NUM_CHANNELS-1:0]                parser_result_pkt_recognized;
logic [NUM_CHANNELS-1:0]                ptp_parser_rst_n;


wire  [NUM_CHANNELS-1:0] [2-1:0]        tx_fifo_eccstatus;
wire  [NUM_CHANNELS-1:0]              	axi_st_tx_parity_error;	
genvar i,j;

//************************************************************************************************
//************************************** Data Path Bridge ****************************************
//************************************************************************************************

//********************************* PTP Packet Parser ***********************************
    generate
    for (i=0; i<NUM_CHANNELS; i=i+1)
    begin : PTP_PARSER_LOOP
      if (PTP_TX_CLASSIFIER_ENABLE[i] == 1)
      begin : PTP_PARSER

        hssi_ss_std_synchronizer_nocut U_PARSER_RST_SYNC (
            .clk                            (app_ss_st_client_clk[i]), 
            .reset_n                        (app_ss_st_client_areset_n[i]),
            .din                            (1'b1), 
            .dout                           (ptp_parser_rst_n[i])
           );

	      ptp_tx_adp_mpm_parser_custom_wrapper #(
           .PREAMBLE_EN                (PREAMBLE_EN),
           .DST_ST_LATENCY             (AXI_READY_LATENCY[i]),
           .DATA_WIDTH                 (DATA_WIDTH),
           .TID_WIDTH                  (1),
           .NUM_OF_SEG                 (1),
           .NUM_OF_SOP                 (1),
           .HSSI_TX_TUSER_CLIENT_WIDTH ('d2+'d1),
           .ENABLE_STATS_CNTRS         (1),
           .BASE_OFFSET                ('h100)
        ) U_PTP_PARSER(
           .clk                                       (app_ss_st_client_clk[i]),
           .rst_n                                     (ptp_parser_rst_n[i]),
           .axi_sl_clk                                (i_reconfig_clk),
           .axi_sl_rst_n                              (~i_reconfig_reset),
  
           .app_pp_TREADY                             (ss_app_tx_tready[i]), // dr vs non-dr  
           .app_pp_TVALID                             (app_ss_tx_tvalid[i]),
           .app_pp_TLAST                              (app_ss_tx_tlast[i]),
           .app_pp_TDATA                              (app_ss_tx_tdata[i]),
           .app_pp_TKEEP                              (app_ss_tx_tkeep[i]),
           .app_pp_tid                                ('0),
           .app_pp_tuser_last_segment                 ('0),
           .app_pp_tuser_ppmetadata                   ('0),
           .app_pp_tuser_usermetadata                 ('0),
           .app_pp_tx_tuser_ptp                       (app_ss_tx_tuser_ptp[i][47:0]),
           .app_pp_tx_tuser_ptp_extended              (app_ss_tx_tuser_ptp_extended[i][163:0]),
           .app_pp_tx_tuser_client                    ({app_ss_tx_tuser_client[i],app_ss_tx_tuser_pkt_seg_parity[i]}),
        
           .pp_app_TREADY                             (ss_app_tx_mux_tready[i]),
           .pp_app_TVALID                             (app_ss_tx_mux_tvalid[i]),
           .pp_app_TLAST                              (app_ss_tx_mux_tlast[i]),
           .pp_app_TDATA                              (app_ss_tx_mux_tdata[i]),
           .pp_app_TKEEP                              (app_ss_tx_mux_tkeep[i]),
           .pp_app_tid                                (),
           .pp_app_tuser_last_segment                 (),
           .pp_app_tuser_ppmetadata                   (),
           .pp_app_tuser_usermetadata                 (),
           .pp_app_tx_tuser_ptp                       (app_ss_tx_mux_tuser_ptp_tmp[i]),
           .pp_app_tx_tuser_ptp_extended              (app_ss_tx_mux_tuser_ptp_extended_tmp[i]),
           .pp_app_tx_tuser_client                    ({app_ss_tx_mux_tuser_client[i],app_ss_tx_mux_tuser_pkt_seg_parity[i]}),
        
           .app_pp_axi_sl_AWREADY                     (ptp_parser_reconfig_awready[i]),
           .app_pp_axi_sl_AWVALID                     (ptp_parser_reconfig_awvalid[i]),
           .app_pp_axi_sl_AWADDR                      ({3'b1, ptp_parser_reconfig_awaddr[i]}),
        
           .app_pp_axi_sl_WREADY                      (ptp_parser_reconfig_wready[i]),
           .app_pp_axi_sl_WVALID                      (ptp_parser_reconfig_wvalid[i]),
           .app_pp_axi_sl_WSTRB                       (ptp_parser_reconfig_wstrb[i]),
           .app_pp_axi_sl_WDATA                       (ptp_parser_reconfig_wdata[i]),
        
           .app_pp_axi_sl_BREADY                      (ptp_parser_reconfig_bready[i]),
           .app_pp_axi_sl_BVALID                      (ptp_parser_reconfig_bvalid[i]),
           .app_pp_axi_sl_BRESP                       (ptp_parser_reconfig_bresp[i]),
        
           .app_pp_axi_sl_ARREADY                     (ptp_parser_reconfig_arready[i]),
           .app_pp_axi_sl_ARVALID                     (ptp_parser_reconfig_arvalid[i]),
           .app_pp_axi_sl_ARADDR                      ({3'b1, ptp_parser_reconfig_araddr[i]}),
        
           .app_pp_axi_sl_RREADY                      (ptp_parser_reconfig_rready[i]),
           .app_pp_axi_sl_RVALID                      (ptp_parser_reconfig_rvalid[i]),
           .app_pp_axi_sl_RRESP                       (ptp_parser_reconfig_rresp[i]),
           .app_pp_axi_sl_RDATA                       (ptp_parser_reconfig_rdata[i]),
        /// 
           .o_ptp_pkt_recognized                      (parser_result_pkt_recognized[i]),
        
           .out_axis_tvalid                           (),
           .out_axis_tlast                            (),
           .out_axis_tdata                            (),
           .out_axis_tkeep                            ()
        );					 
					 
/*
        ptp_tx_adp_parser_custom_wrapper #(
           .DATA_WIDTH                     (DATA_WIDTH),
           .DST_ST_LATENCY                 (AXI_READY_LATENCY[i]),
           .HSSI_TX_TUSER_CLIENT_WIDTH     ('d2),
           .ENABLE_STATS_CNTRS             (1),
           .PREAMBLE_EN                    (PREAMBLE_EN),
           .BASE_OFFSET                    ('h100) 
        ) U_PTP_PARSER (
           .clk                            (app_ss_st_client_clk[i]),
           .rst_n                          (ptp_parser_rst_n[i]),
           .axi_sl_clk                     (i_reconfig_clk),
           .axi_sl_rst_n                   (~i_reconfig_reset),
           //AXIs sink/input
           .app_pp_TREADY                  (ss_app_tx_tready[i]),
           .app_pp_TVALID                  (app_ss_tx_tvalid[i]),
           .app_pp_TLAST                   (app_ss_tx_tlast[i]),
           .app_pp_TDATA                   (app_ss_tx_tdata[i]),
           .app_pp_TKEEP                   (app_ss_tx_tkeep[i]),
           .app_pp_tx_tuser_ptp            (app_ss_tx_tuser_ptp[i][47:0]),
           .app_pp_tx_tuser_ptp_extended   (app_ss_tx_tuser_ptp_extended[i][163:0]),
           .app_pp_tx_tuser_client         (app_ss_tx_tuser_client[i]),
           //
           .app_pp_tid                     (1'b0),
           .app_pp_tuser_last_segment      (1'b0),
           .app_pp_tuser_ppmetadata        (1'b0),
           .app_pp_tuser_usermetadata      (1'b0),
           //AXIs source/output
           .pp_app_TREADY                  (ss_app_tx_mux_tready[i]),
           .pp_app_TVALID                  (app_ss_tx_mux_tvalid[i]),
           .pp_app_TLAST                   (app_ss_tx_mux_tlast[i]),
           .pp_app_TDATA                   (app_ss_tx_mux_tdata[i]),
           .pp_app_TKEEP                   (app_ss_tx_mux_tkeep[i]),
           .pp_app_tx_tuser_ptp            (app_ss_tx_mux_tuser_ptp_tmp[i]),
           .pp_app_tx_tuser_ptp_extended   (app_ss_tx_mux_tuser_ptp_extended_tmp[i]),
           .pp_app_tx_tuser_client         (app_ss_tx_mux_tuser_client[i]),
           //AXI slave Write Address Channel
           .app_pp_axi_sl_AWREADY          (ptp_parser_reconfig_awready[i]),
           .app_pp_axi_sl_AWVALID          (ptp_parser_reconfig_awvalid[i]),
           .app_pp_axi_sl_AWADDR           ({1'b1, ptp_parser_reconfig_awaddr[i]}),
           //AXI slave Write Data Channel
           .app_pp_axi_sl_WREADY           (ptp_parser_reconfig_wready[i]),
           .app_pp_axi_sl_WVALID           (ptp_parser_reconfig_wvalid[i]),
           .app_pp_axi_sl_WSTRB            (ptp_parser_reconfig_wstrb[i]),
           .app_pp_axi_sl_WDATA            (ptp_parser_reconfig_wdata[i]),
           //AXI slave Write Response Channel
           .app_pp_axi_sl_BREADY           (ptp_parser_reconfig_bready[i]),
           .app_pp_axi_sl_BVALID           (ptp_parser_reconfig_bvalid[i]),
           .app_pp_axi_sl_BRESP            (ptp_parser_reconfig_bresp[i]),
           //AXI slave Read Address Channel
           .app_pp_axi_sl_ARREADY          (ptp_parser_reconfig_arready[i]),
           .app_pp_axi_sl_ARVALID          (ptp_parser_reconfig_arvalid[i]),
           .app_pp_axi_sl_ARADDR           ({1'b1, ptp_parser_reconfig_araddr[i]}),
           //AXI slave Read Data Channel
           .app_pp_axi_sl_RREADY           (ptp_parser_reconfig_rready[i]),
           .app_pp_axi_sl_RVALID           (ptp_parser_reconfig_rvalid[i]),
           .app_pp_axi_sl_RRESP            (ptp_parser_reconfig_rresp[i]),
           .app_pp_axi_sl_RDATA            (ptp_parser_reconfig_rdata[i]),
           //result
           .o_ptp_pkt_recognized           (parser_result_pkt_recognized[i])
        );
*/
        assign app_ss_tx_mux_tuser_ptp[i]              = {48'd0, app_ss_tx_mux_tuser_ptp_tmp[i][45:0]};
        assign app_ss_tx_mux_tuser_ptp_extended[i][327:0]    = {164'd0, app_ss_tx_mux_tuser_ptp_extended_tmp[i][163:0]};

      end //end of parser
      else
      begin : NO_PTP_PARSER

        assign ss_app_tx_tready[i]                 = ss_app_tx_mux_tready[i];
        assign app_ss_tx_mux_tvalid[i]             = app_ss_tx_tvalid[i];
        assign app_ss_tx_mux_tdata[i]              = app_ss_tx_tdata[i];
        assign app_ss_tx_mux_tkeep[i]              = app_ss_tx_tkeep[i];
        assign app_ss_tx_mux_tlast[i]              = app_ss_tx_tlast[i];
        assign app_ss_tx_mux_tuser_client[i]       = app_ss_tx_tuser_client[i];
        assign app_ss_tx_mux_tuser_ptp[i]          = app_ss_tx_tuser_ptp[i];
        assign app_ss_tx_mux_tuser_ptp_extended[i] = app_ss_tx_tuser_ptp_extended[i];
        assign app_ss_tx_mux_tuser_pkt_seg_parity[i] = app_ss_tx_tuser_pkt_seg_parity[i]; 

        assign ptp_parser_reconfig_awready[i]      = 1'b1;
        assign ptp_parser_reconfig_wready[i]       = 1'b1;
        assign ptp_parser_reconfig_bvalid[i]       = ptp_parser_reconfig_wvalid[i];
        assign ptp_parser_reconfig_bresp[i]        = 'd0;
        assign ptp_parser_reconfig_arready[i]      = 1'b1;
        assign ptp_parser_reconfig_rvalid[i]       = ptp_parser_reconfig_arvalid[i];
        assign ptp_parser_reconfig_rresp[i]        = 'd0;
        assign ptp_parser_reconfig_rdata[i]        = 32'hDEADC0DE;


      end
    end //end of for loop
endgenerate    

    generate
    for (i=0; i<NUM_CHANNELS; i=i+1)
    begin : Axi2Avst_Bridge
    hssi_axist_to_avst_bridge_wrapper #(
      .TDATA_WIDTH                (DATA_WIDTH),
			.DATA_WIDTH                 (DATA_WIDTH),
      .NO_OF_BYTES                (NO_OF_BYTES),
      .EMPTY_BITS                 (EMPTY_BITS),
      .ST_READY_LATENCY           (PTP_TX_CLASSIFIER_ENABLE[i] ? 4'd1 :  AXI_READY_LATENCY[i]),
      .TILES                      (Tiles),
      .PORT_CLIENT_IF             (1),
      .PKT_SEG_PARITY_EN          (PKT_SEG_PARITY_EN[i]),
      .PKT_SEG_PARITY_WIDTH        (1), 
      .ENABLE_ECC                 (ENABLE_ECC),
      .TX_TUSER_CLIENT_WIDTH      (2),
      .RX_TUSER_CLIENT_WIDTH      (7),
      .RX_TUSER_STATS_WIDTH       (5),
      .PORT_PROFILE               (PORT_PROFILE),
      .ASYNC_ADAPTERS_EN          (0),
      .SIM_EMULATE                (SIM_EMULATE)
    ) U_st_bridge_instance (
      .i_tx_clk_p0                    (app_ss_st_client_clk[i]), 
      .i_tx_clk_p1                    (app_ss_st_client_clk[i]), 
      .i_tx_clk_p2                    (app_ss_st_client_clk[i]), 
      .i_tx_clk_p3                    (app_ss_st_client_clk[i]), 
      .i_rx_clk_p0                    (app_ss_st_clk[i]),
      .i_rx_clk_p1                    (app_ss_st_clk[i]),
      .i_rx_clk_p2                    (app_ss_st_clk[i]),
      .i_rx_clk_p3                    (app_ss_st_clk[i]),
      .i_tx_rst_n_p0                  (app_ss_st_client_areset_n[i]),
      .i_tx_rst_n_p1                  (app_ss_st_client_areset_n[i]),
      .i_tx_rst_n_p2                  (app_ss_st_client_areset_n[i]),
      .i_tx_rst_n_p3                  (app_ss_st_client_areset_n[i]),
      .i_rx_rst_n_p0                  (app_ss_st_areset_n[i]),
      .i_rx_rst_n_p1                  (app_ss_st_areset_n[i]),
      .i_rx_rst_n_p2                  (app_ss_st_areset_n[i]),
      .i_rx_rst_n_p3                  (app_ss_st_areset_n[i]),
      .i_profile_sel_reg              ('0),
      .o_port_active_mask_reg         (),
      .o_data_width                   (),
      .o_speed_sel                    (),      
      //AXI Stream Tx, from User interface
      .o_axi_st_tx_tready             (ss_app_tx_mux_tready[i]),
      .i_axi_st_tx_tvalid             (app_ss_tx_mux_tvalid[i]),
      .i_axi_st_tx_tdata              (app_ss_tx_mux_tdata[i]),
      .i_axi_st_tx_tlast              (app_ss_tx_mux_tlast[i]),
      .i_axi_st_tx_tkeep              (app_ss_tx_mux_tkeep[i]),
      .i_axi_st_tx_tuser_client       (app_ss_tx_mux_tuser_client[i]),
      .i_axi_st_tx_tuser_ptp          (app_ss_tx_mux_tuser_ptp[i]),
      .i_axi_st_tx_tuser_ptp_extended (app_ss_tx_mux_tuser_ptp_extended[i]),
      .i_axi_st_tx_pkt_seg_parity     (app_ss_tx_mux_tuser_pkt_seg_parity[i]),
      //Avalon Stream Tx, to EHIP/MAC interface
      //.i_av_st_tx_ready               (i_av_st_tx_ready),
      //.o_av_st_tx_valid               (o_av_st_tx_valid),
      //.o_av_st_tx_data                (o_av_st_tx_data),
      //.o_av_st_tx_startofpacket       (o_av_st_tx_startofpacket),
      //.o_av_st_tx_endofpacket         (o_av_st_tx_endofpacket),
      //.o_av_st_tx_empty               (o_av_st_tx_empty),
      //.o_av_st_tx_error               (o_av_st_tx_error),
      //.o_av_st_tx_skip_crc            (o_av_st_tx_skip_crc),
      .i_tx_avst_ready                (i_av_st_tx_ready[i]),
      .o_tx_avst_valid               (o_av_st_tx_valid[i]),
      .o_tx_avst_data                (o_av_st_tx_data[i]),
      .o_tx_avst_startofpacket       (o_av_st_tx_startofpacket[i]),
      .o_tx_avst_endofpacket         (o_av_st_tx_endofpacket[i]),
      .o_tx_avst_empty               (o_av_st_tx_empty[i]),
      .o_tx_avst_error               (o_av_st_tx_error[i]),
      .o_tx_avst_skip_crc            (o_av_st_tx_skip_crc[i]),
      //tx_ptp avalon side
      .o_av_st_tx_ptp_ts_valid        (o_av_st_tx_ptp_ts_valid[i]),
      .o_av_st_tx_ptp_ts_req          (o_av_st_tx_ptp_ts_req[i]),
      .o_av_st_tx_ptp_ins_ets         (o_av_st_tx_ptp_ins_ets[i]),
      .o_av_st_tx_ptp_fp              (o_av_st_tx_ptp_fp[i]),
      .o_av_st_tx_ptp_ins_cf          (o_av_st_tx_ptp_ins_cf[i]),
      .o_av_st_tx_ptp_tx_its          (o_av_st_tx_ptp_tx_its[i]),
      .o_av_st_tx_ptp_asym_p2p_idx    (o_av_st_tx_ptp_asym_p2p_idx[i]),
      .o_av_st_tx_ptp_asym_sign       (o_av_st_tx_ptp_asym_sign[i]),
      .o_av_st_tx_ptp_asym            (o_av_st_tx_ptp_asym[i]),
      .o_av_st_tx_ptp_p2p             (o_av_st_tx_ptp_p2p[i]),
      //
      .o_av_st_tx_ptp_ts_format       (o_av_st_tx_ptp_ts_format[i]), 
      .o_av_st_tx_ptp_update_eb       (o_av_st_tx_ptp_update_eb[i]), 
      .o_av_st_tx_ptp_zero_csum       (o_av_st_tx_ptp_zero_csum[i]), 
      .o_av_st_tx_ptp_eb_offset       (o_av_st_tx_ptp_eb_offset[i]), 
      .o_av_st_tx_ptp_csum_offset     (o_av_st_tx_ptp_csum_offset[i]), 
      .o_av_st_tx_ptp_cf_offset       (o_av_st_tx_ptp_cf_offset[i]), 
      .o_av_st_tx_ptp_ts_offset       (o_av_st_tx_ptp_ts_offset[i]), 
      //Avalon Stream Rx, from EHIP/MAC interface
      //.i_av_st_rx_valid               (i_av_st_rx_valid),
      //.i_av_st_rx_data                (i_av_st_rx_data),
      //.i_av_st_rx_startofpacket       (i_av_st_rx_startofpacket),
      //.i_av_st_rx_endofpacket         (i_av_st_rx_endofpacket),
      //.i_av_st_rx_empty               (i_av_st_rx_empty),
      //.i_av_st_rx_error               (i_av_st_rx_error),
      //.i_av_st_rxstatus_data          (i_av_st_rxstatus_data),
      //.i_av_st_rxstatus_valid         (i_av_st_rxstatus_valid),
      //.i_av_st_ptp_rx_its             (i_av_st_ptp_rx_its),
      .i_rx_avst_valid               (i_av_st_rx_valid[i]),
      .i_rx_avst_data                (i_av_st_rx_data[i]),
      .i_rx_avst_startofpacket       (i_av_st_rx_startofpacket[i]),
      .i_rx_avst_endofpacket         (i_av_st_rx_endofpacket[i]),
      .i_rx_avst_empty               (i_av_st_rx_empty[i]),
      .i_rx_avst_error               (i_av_st_rx_error[i]),
      .i_rxstatus_avst_data          (i_av_st_rxstatus_data[i]),
      .i_rxstatus_avst_valid         (i_av_st_rxstatus_valid[i]),
      .i_rx_avst_ptp_rx_its          ({96'b0,i_av_st_ptp_rx_its[i]}),
      //AXI Stream Rx, to User interface
      .o_axi_st_rx_tvalid             (ss_app_rx_tvalid[i]),
      .o_axi_st_rx_tdata              (ss_app_rx_tdata[i]),
      .o_axi_st_rx_tlast              (ss_app_rx_tlast[i]),
      .o_axi_st_rx_tkeep              (ss_app_rx_tkeep[i]),
      .o_axi_st_rx_tuser_client       (ss_app_rx_tuser_client[i]),
      .o_axi_st_rx_tuser_sts          (ss_app_rx_tuser_sts[i]),
      .o_axi_st_rx_tuser_sts_extended (ss_app_rx_tuser_sts_extended[i]),
      .o_axi_st_rx_ingrts0_tvalid     (ss_app_st_rxingrts0_tvalid[i]),
      .o_axi_st_rx_pkt_seg_parity     (ss_app_rx_tuser_pkt_seg_parity[i]),
      .o_axi_st_rx_ingrts0_tdata      (ss_app_st_rxingrts0_tdata[((i+1)*96)-1:(i*96)]),


      // Ported from F-tile for completeness
  //-------------------------------------------------------------------------    
      .i_rx_avst_preamble             ('0),
      .o_tx_avst_preamble             (),
      .i_axi_st_tx_tlast_segment      ('0),      
      .i_axi_st_tx_tkeep_segment      ('0),       
      .o_axi_st_rx_tlast_segment      (),
      .o_axi_st_rx_tkeep_segment      (),
      .o_tx_fifo_eccstatus	      (tx_fifo_eccstatus[i]),
      .i_tx_mac_ready              ('0),
      .i_rx_mac_data ('0), 
      .i_rx_mac_valid ('0),
      .i_rx_mac_inframe ('0),
      .i_rx_mac_eop_empty ('0),
      .i_rx_mac_error ('0),         
      .i_rx_mac_fcs_error ('0),
      .i_rx_mac_status ('0),
      .o_axi_st_tx_parity_error       (axi_st_tx_parity_error[i])
  //-------------------------------------------------
    );

    end //end of for loop
endgenerate  

////////////////////////////////////////////////////
generate
for (i=0; i<NUM_CHANNELS; i=i+1)
begin : ECC_PARITY
hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_ECC_STATUS_SYNC ( 
      .clk     (i_reconfig_clk),
      .reset   (1'b0),
      .d       (tx_fifo_eccstatus[i][0]),
      .q       (o_tx_fifo_eccstatus[i])
    );

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_PARITY_ERR_SYNC (
      .clk     (i_reconfig_clk),
      .reset   (1'b0),
      .d       (axi_st_tx_parity_error[i]),
      .q       (o_axi_st_tx_parity_error[i])
    );

end //end of for loop
endgenerate

///////////////////////

    generate
    for(i=0; i< NUM_CHANNELS; i=i+1)
    begin : AXI_ST_2D_MUX
      assign i_av_st_tx_ready[i]   = o_tx_ready[i];
      assign i_tx_data[((i+1)*DATA_WIDTH)-1:(i*DATA_WIDTH)] = o_av_st_tx_data[i];
      assign i_tx_empty[((i+1)*EMPTY_BITS)-1:(i*EMPTY_BITS)] = o_av_st_tx_empty[i];
      assign i_tx_valid[i]         = o_av_st_tx_valid[i];
      assign i_tx_startofpacket[i] = o_av_st_tx_startofpacket[i];
      assign i_tx_endofpacket[i]   = o_av_st_tx_endofpacket[i];
      assign i_tx_error[i]         = o_av_st_tx_error[i];
      assign i_tx_skip_crc[i]      = o_av_st_tx_skip_crc[i];
      //These Signals are 2 copies incase of F-tile, for E-tile LSB's are valid
      assign i_ptp_ts_req[i]         = o_av_st_tx_ptp_ts_req[i];
      assign i_ptp_ins_ets[i]        = o_av_st_tx_ptp_ins_ets[i];
      assign i_ptp_fp[(i*8)+7:(i*8)] = o_av_st_tx_ptp_fp[i][7:0];
      assign i_ptp_ins_cf[i]         = o_av_st_tx_ptp_ins_cf[i];
      assign i_ptp_tx_its[(i*96)+95:(i*96)]       = o_av_st_tx_ptp_tx_its[i];
      //assign  = o_av_st_tx_ptp_ts_valid; //TBD
      assign i_ptp_zero_csum[i]    = o_av_st_tx_ptp_zero_csum[i];
      assign i_ptp_update_eb[i]    = o_av_st_tx_ptp_update_eb[i]; 
      assign i_ptp_ts_format[i]    = o_av_st_tx_ptp_ts_format[i];
      assign i_ptp_ts_offset[(i*16)+15:(i*16)]    = o_av_st_tx_ptp_ts_offset[i];
      assign i_ptp_cf_offset[(i*16)+15:(i*16)]    = o_av_st_tx_ptp_cf_offset[i];
      assign i_ptp_csum_offset[(i*16)+15:(i*16)]  = o_av_st_tx_ptp_csum_offset[i];
      assign i_ptp_eb_offset[(i*16)+15:(i*16)]    = o_av_st_tx_ptp_eb_offset[i];
      //below are valid in F-tile only
      //assign  = o_av_st_tx_ptp_asym_p2p_idx;
      //assign  = o_av_st_tx_ptp_asym_sign;
      //assign  = o_av_st_tx_ptp_asym;
      //assign  = o_av_st_tx_ptp_p2p;
      //
      assign i_av_st_rx_data[i][DATA_WIDTH-1:0]  = o_rx_data[((i+1)*DATA_WIDTH)-1:(i*DATA_WIDTH)];
      assign i_av_st_rx_valid[i]                 = o_rx_valid[i];
      assign i_av_st_rx_startofpacket[i]         = o_rx_startofpacket[i];
      assign i_av_st_rx_endofpacket[i]           = o_rx_endofpacket[i];
      assign i_av_st_rx_empty[i][EMPTY_BITS-1:0] = o_rx_empty[((i+1)*EMPTY_BITS)-1:(i*EMPTY_BITS)];
      assign i_av_st_rx_error[i][5:0]            = o_rx_error[(i*6)+5:(i*6)];
      assign i_av_st_rxstatus_data[i][39:0]      = o_rxstatus_data[(i*40)+39:(i*40)];
      assign i_av_st_rxstatus_valid[i]           = o_rxstatus_valid[i];
      assign i_av_st_ptp_rx_its[i][95:0]         = 96'd0; 
    end //end of for loop 
    endgenerate
//************************************************************************************************
//********************************** PHY Direct Data Path Bridge *********************************
//************************************************************************************************

    generate
    for(i=0; i< NUM_XCVR_CHANNELS; i=i+1)
    begin : PTP_ADDR
      //readata valid to axi lite bridge should be given after waitrequest
      //so delaying read data and valid extra cycle
      always @(posedge i_reconfig_clk)
      begin
        o_xcvr_reconfig_readdatavalid[i]        <= i_xcvr_reconfig_read[i] && ~o_xcvr_reconfig_waitrequest[i];
        o_xcvr_reconfig_readdata[(i*8)+7:(i*8)] <= o_xcvr_reconfig_readdata_int[(i*8)+7:(i*8)];
      end

      //waitrequest from ehip is staying low till next xcvr access so forcing to 1'b1 after access towards bridge
      assign o_xcvr_reconfig_waitrequest[i] = (i_xcvr_reconfig_read[i] | i_xcvr_reconfig_write[i]) ? o_xcvr_reconfig_waitrequest_int[i] : 1'b1;

      always_comb 
      begin
        if(i_xcvr_reconfig_address[(i*17)+16] == 1'b1) //0x1_0000 - 0x1_FFFF
          i_xcvr_reconfig_address_int[(i*19)+18:(i*19)] = {3'd0, i_xcvr_reconfig_address[(i*17)+15:(i*17)]};
        else   //0x0_0000 - 0x0_FFFF
          i_xcvr_reconfig_address_int[(i*19)+18:(i*19)] = {3'd4, i_xcvr_reconfig_address[(i*17)+15:(i*17)]};
      end
    end
    endgenerate



    assign ehip_eth_reconfig_addr       = i_eth_reconfig_addr; 
    assign ehip_eth_reconfig_write      = i_eth_reconfig_write; 
    assign ehip_eth_reconfig_writedata  = i_eth_reconfig_writedata; 
    assign ehip_eth_reconfig_read       = i_eth_reconfig_read; 
    assign o_eth_reconfig_readdatavalid = ehip_eth_reconfig_readdatavalid; 
    assign o_eth_reconfig_readdata      = ehip_eth_reconfig_readdata; 
    assign o_eth_reconfig_waitrequest   = ehip_eth_reconfig_waitrequest; 

    generate
    for(i=0; i< NUM_CHANNELS; i=i+1)
    begin : ETH_ADDR
      assign ehip_eth_reconfig_addr_int[(i*19)+18:(i*19)] = {7'd0, ehip_eth_reconfig_addr[(i*12)+11:(i*12)]};
    end
    endgenerate




    //assign o_clk_pll[NUM_CHANNELS-1:0]       = o_tx_pll_clk_div64[NUM_CHANNELS-1:0];
    assign o_clk_pll_div[NUM_CHANNELS-1:0]   = o_tx_pll_clk_div66[NUM_CHANNELS-1:0];
    assign o_clk_rec_div64[NUM_CHANNELS-1:0] = o_rx_pll_clk_div64[NUM_CHANNELS-1:0];
    assign o_clk_rec_div[NUM_CHANNELS-1:0]   = o_rx_pll_clk_div66[NUM_CHANNELS-1:0];

    assign o_clk_pll[NUM_CHANNELS-1:0] = o_tx_pll_clk_div64[NUM_CHANNELS-1:0];


//Synchronization of status signals to reconfig clock

alt_xcvr_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_XCVR_CHANNELS),  .INIT_VALUE(0)
    ) cdr_lock_sync_inst (
      .clk     (i_reconfig_clk),
      .reset   (1'b0),
      .d       (o_cdr_lock_int),
      .q       (o_cdr_lock_sync)
    );

  assign o_cdr_lock = o_cdr_lock_sync;


alt_xcvr_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
    ) rx_block_lock_sync_inst (
      .clk     (i_reconfig_clk),
      .reset   (1'b0),
      .d       (o_rx_block_lock_int),
      .q       (o_rx_block_lock)
    );

alt_xcvr_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
    ) local_fault_sync_inst (
      .clk     (i_reconfig_clk),
      .reset   (1'b0),
      .d       (o_local_fault_status_int),
      .q       (o_local_fault_status)
    );

alt_xcvr_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
    ) remote_fault_sync_inst (
      .clk     (i_reconfig_clk),
      .reset   (1'b0),
      .d       (o_remote_fault_status_int),
      .q       (o_remote_fault_status)
    );

alt_xcvr_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
    ) rx_hi_ber_sync_inst (
      .clk     (i_reconfig_clk),
      .reset   (1'b0),
      .d       (o_rx_hi_ber_int),
      .q       (o_rx_hi_ber)
    );

alt_xcvr_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
    ) ehip_ready_sync_inst (
      .clk     (i_reconfig_clk),
      .reset   (1'b0),
      .d       (o_ehip_ready_int),
      .q       (o_ehip_ready)
    );

    assign o_rx_am_lock = {NUM_CHANNELS{1'b0}};

    assign o_rx_pcs_fully_aligned = 'd0;

    assign o_xcvr_ready_int      = o_tx_pll_locked; //alt_ehipc3_fm_0.alt_ehipc3_fm_top_p0.sl_tx_transfer_ready[NUM_XCVR_CHANNELS-1:0];

    `ifndef QUARTUS_CDC
    assign o_tx_pma_ready_int    = alt_ehipc3_fm_0.alt_ehipc3_fm_top_p0.o_sl_tx_pma_ready;
    assign o_rx_pma_ready_int    = alt_ehipc3_fm_0.alt_ehipc3_fm_top_p0.o_sl_rx_pma_ready;
    assign o_cdr_lock_int        = alt_ehipc3_fm_0.alt_ehipc3_fm_top_p0.sl_rx_is_lockedtodata;
    `else
    assign o_tx_pma_ready_int    = 1'b1; 
    assign o_rx_pma_ready_int    = 1'b1;
    `endif

alt_xcvr_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_XCVR_CHANNELS),  .INIT_VALUE(0)
    ) xcvr_ready_sync_inst (
      .clk     (i_reconfig_clk),
      .reset   (1'b0),
      .d       (o_xcvr_ready_int),
      .q       (o_xcvr_ready)
    );

alt_xcvr_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_XCVR_CHANNELS),  .INIT_VALUE(0)
    ) TX_PMA_READY (
      .clk     (i_reconfig_clk),
      .reset   (1'b0),
      .d       (o_tx_pma_ready_int),
      .q       (o_tx_pma_ready)
    );

alt_xcvr_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_XCVR_CHANNELS),  .INIT_VALUE(0)
    ) RX_PMA_READY (
      .clk     (i_reconfig_clk),
      .reset   (1'b0),
      .d       (o_rx_pma_ready_int),
      .q       (o_rx_pma_ready)
    );

generate
for(i=0; i< NUM_CHANNELS; i=i+1)
begin : LINK_STS

alt_xcvr_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(3),  .INIT_VALUE(0)
    ) link_sts_sync (
      .clk     (i_reconfig_clk),
      .reset   (1'b0),
      .d       ({o_rx_pcs_ready[i], o_tx_lanes_stable[i], o_tx_pll_locked[i]}),
      .q       (o_link_status[i])
    );
end
endgenerate

//******************************************************************************************
//                                  Hotplug Logic per XCVR channel
//******************************************************************************************


generate
if(HOTPLUG_EN)
begin : HOTPLUG

reg  [16:0] pulse_1msec_cntr;
wire pulse_1msec; 
wire [NUM_XCVR_CHANNELS-1:0] o_anlt_paused;
wire [NUM_CHANNELS-1:0] [3:0] anlt_fsm_state;
wire [NUM_CHANNELS-1:0] anlt_data_good_state;

localparam PULSE_1MSEC_CNTR = (SIM_EMULATE == 1) ? 'd1250 : 'd125000;

always@(posedge i_reconfig_clk or negedge i_csr_rst_n[0])
begin
  if(~i_csr_rst_n[0])
    pulse_1msec_cntr <= 17'd0;
  else if(pulse_1msec_cntr >= (PULSE_1MSEC_CNTR-1'd1))
    pulse_1msec_cntr <= 17'd0;
  else
    pulse_1msec_cntr <= pulse_1msec_cntr + 1'd1;
end

assign pulse_1msec = (pulse_1msec_cntr == (PULSE_1MSEC_CNTR-1'd1)) ? 1'b1 : 1'b0;

  for (i=0; i<NUM_XCVR_CHANNELS; i=i+1)
  begin : hotplug_non_anlt
    hssi_ss_hotplug #(.NUM_CHANNELS(1), .PORT_PROFILE(PORT_PROFILE), .PORT_ANLT_EN(0), .PORT_DR_EN(0), .SIM_MODE(SIM_EMULATE)) U_HOTPLUG 
        (
        .i_reconfig_reset(i_reconfig_reset),
        .i_reconfig_clk(i_reconfig_clk),
        .i_pulse_1ms(pulse_1msec),
        .i_csr_rst_n(i_csr_rst_n[i]),
        .i_rx_is_lockedtodata(o_cdr_lock_sync[i]),
        .i_rx_is_lockedtodata_all(o_cdr_lock_sync[i]),
        .i_port_profile(i_port_port_profile[i]),
        .i_rx_pcs_ready(1'b0),
        .i_rx_pma_ready(o_rx_pma_ready[i]),
        .i_po_cal_done(po_pma_cal_done),
        //
        .i_hotplug_disable(hotplug_control[0] || hotplug_disable_fm[i]),
        .i_hotplug_lpbk_en_fm(hotplug_lpbk_en_fm[i]),
        .i_load_recipe_disable(hotplug_control[1]),
        .i_load_lr_recipe_only(hotplug_control[2]),
        .i_load_vsr_recipe_only(hotplug_control[3] || hotplug_lpbk_en_fm[i]),
        .i_hotplug_pause(hotplug_control[4]),
        .i_hotplug_ilb_cal_disable(hotplug_control[5]),
        .i_sig_wait_cntr(hotplug_control[31:16]),
        .o_hotplug_complete(hotplug_status[i][0]),
        .o_vsr_lr_recipe_enabled(hotplug_status[i][1]),
        .o_hotplug_busy(hotplug_status[i][2]),
        .o_hotplug_paused(hotplug_status[i][3]),
        .o_hotplug_disabled(hotplug_status[i][4]),
        .o_anlt_paused(o_anlt_paused[i]),
        .i_any_lane_down(1'b0),
        .i_all_anlt_pause_state(1'b1),
        .i_port_ch_enable(1'b1),
        .i_anlt_paused(o_anlt_paused[i]),
        //reconfig if from bridge
        .i_xcvr_reconfig_address(i_xcvr_reconfig_address_int[(i*19)+18:(i*19)]),
        .i_xcvr_reconfig_read(i_xcvr_reconfig_read[i]),
        .i_xcvr_reconfig_write(i_xcvr_reconfig_write[i]),
        .i_xcvr_reconfig_writedata(i_xcvr_reconfig_writedata[(i*8)+7:(i*8)]),
        .o_xcvr_reconfig_readdata(o_xcvr_reconfig_readdata_int[(i*8)+7:(i*8)]),
        .o_xcvr_reconfig_waitrequest(o_xcvr_reconfig_waitrequest_int[i]),
        // reconfig if to C3
        .xcvr_reconfig_address(xcvr_reconfig_address[(i*19)+18:(i*19)]),
        .xcvr_reconfig_read(xcvr_reconfig_read[i]),
        .xcvr_reconfig_write(xcvr_reconfig_write[i]),
        .xcvr_reconfig_writedata(xcvr_reconfig_writedata[(i*8)+7:(i*8)]),
        .xcvr_reconfig_readdata(xcvr_reconfig_readdata[(i*8)+7:(i*8)]),
        .xcvr_reconfig_waitrequest(xcvr_reconfig_waitrequest[i])
        );

		assign hotplug_paused_fm[i]   = hotplug_status[i][4];
    assign hotplug_status[i][7:5] = 3'd0;
  end //end of for loop
    //
    assign eth_reconfig_hp_mux_address      = ehip_eth_reconfig_addr_int; 
    assign eth_reconfig_hp_mux_read         = ehip_eth_reconfig_read;
    assign eth_reconfig_hp_mux_write        = ehip_eth_reconfig_write;
    assign eth_reconfig_hp_mux_writedata    = ehip_eth_reconfig_writedata;
    assign ehip_eth_reconfig_readdata       = eth_reconfig_hp_mux_readdata;
    assign ehip_eth_reconfig_waitrequest    = eth_reconfig_hp_mux_waitrequest;
    assign ehip_eth_reconfig_readdatavalid  = eth_reconfig_hp_mux_readdatavalid;
end //end of hotplug en == 1
else //else of hotplug en
begin : NO_HOTPLUG
  assign xcvr_reconfig_address            = i_xcvr_reconfig_address_int;
  assign xcvr_reconfig_read               = i_xcvr_reconfig_read;
  assign xcvr_reconfig_write              = i_xcvr_reconfig_write;
  assign xcvr_reconfig_writedata          = i_xcvr_reconfig_writedata;
  assign o_xcvr_reconfig_readdata_int     = xcvr_reconfig_readdata;
  assign o_xcvr_reconfig_waitrequest_int  = xcvr_reconfig_waitrequest;
	assign hotplug_paused_fm                = {NUM_XCVR_CHANNELS{1'b1}}; 
  assign hotplug_status                   = {NUM_XCVR_CHANNELS{8'd0}};
  //
  assign eth_reconfig_hp_mux_address      = ehip_eth_reconfig_addr_int; 
  assign eth_reconfig_hp_mux_read         = ehip_eth_reconfig_read;
  assign eth_reconfig_hp_mux_write        = ehip_eth_reconfig_write;
  assign eth_reconfig_hp_mux_writedata    = ehip_eth_reconfig_writedata;
  assign ehip_eth_reconfig_readdata       = eth_reconfig_hp_mux_readdata;
  assign ehip_eth_reconfig_waitrequest    = eth_reconfig_hp_mux_waitrequest;
  assign ehip_eth_reconfig_readdatavalid  = eth_reconfig_hp_mux_readdatavalid;
end
endgenerate

//************************************************************************************************
//************************************** Data Path Bridge ****************************************
//************************************************************************************************
// Core_Variant = 0 - single ch 10/25G
//                1 - 1 to 4 ch's 10/25G
//                2 - single ch 100G
//                3 - act ch =0 : 10/25G, act_ch=1 : 100G 
//Core_Variant = 3 is only supported others are not, so core_variant=3 and act_ch=1 then 100G else 10/25G
       

	  alt_ehipc3_fm_top_p0 #(.rx_pause_daddr("1652522221569"))  
	   alt_ehipc3_fm_0 (
      //Clock singlas
	  	.i_clk_ref                        ({max_refclk{i_clk_ref[0]}}), // 156.25 eth, otn, pcs
	  	.o_clk_pll_div64                  (o_tx_pll_clk_div64), 
	  	.o_clk_pll_div66                  (o_tx_pll_clk_div66),
	  	.o_clk_rec_div64                  (o_rx_pll_clk_div64),
	  	.o_clk_rec_div66                  (o_rx_pll_clk_div66), 
	  	.i_reconfig_clk                   (i_reconfig_clk),
      //
	  	.i_sl_clk_tx                      (o_clk_pll),
	  	.i_sl_clk_rx                      (o_clk_pll), 
      //
      //Reset signals
	  	.i_csr_rst_n                      (i_csr_rst_n[0]),
	  	.i_sl_csr_rst_n                   (i_csr_rst_n),
	  	.i_sl_tx_rst_n                    (i_tx_rst_n),
	  	.i_sl_rx_rst_n                    (i_rx_rst_n), 
	  	.i_reconfig_reset                 (i_reconfig_reset), 
      //Serial interface
	  	.o_tx_serial                      (o_tx_serial), 
	  	.i_rx_serial                      (i_rx_serial), 
	  	.o_tx_serial_n                    (o_tx_serial_n), 
	  	.i_rx_serial_n                    (i_rx_serial_n),
      // Eth AVMM - disabled only incase of core_variant = 0, 1, 4, 5
      //TBD PMA mode
	  	.i_sl_eth_reconfig_addr           (eth_reconfig_hp_mux_address),
	  	.i_sl_eth_reconfig_read           (eth_reconfig_hp_mux_read),   
	  	.i_sl_eth_reconfig_write          (eth_reconfig_hp_mux_write), 
	  	.o_sl_eth_reconfig_readdata       (eth_reconfig_hp_mux_readdata),
	  	.o_sl_eth_reconfig_readdata_valid (eth_reconfig_hp_mux_readdatavalid), 
	  	.i_sl_eth_reconfig_writedata      (eth_reconfig_hp_mux_writedata), 
	  	.o_sl_eth_reconfig_waitrequest    (eth_reconfig_hp_mux_waitrequest),  
	  	.i_sl_stats_snapshot              ({NUM_CHANNELS{1'b0}}),
      //eth reconfig always present in EHIP C3, connected to avoid lint errors
	  	.i_eth_reconfig_addr              (21'd0), 
	  	.i_eth_reconfig_read              (1'b0),  
	  	.i_eth_reconfig_write             (1'b0),  
	  	.o_eth_reconfig_readdata          (),      
	  	.o_eth_reconfig_readdata_valid    (),      
	  	.i_eth_reconfig_writedata         (32'd0), 
	  	.o_eth_reconfig_waitrequest       (),      
      // FEC AVMM
      // PTP AVMM
	  	.i_ptp_reconfig_address           (38'd0),    
	  	.i_ptp_reconfig_read              (2'b0),           
	  	.i_ptp_reconfig_write             (2'b0),          
	  	.i_ptp_reconfig_writedata         (16'd0),      
      // XCVR AVMM
	  	.i_xcvr_reconfig_address          (xcvr_reconfig_address),   
	  	.i_xcvr_reconfig_read             (xcvr_reconfig_read),          
	  	.i_xcvr_reconfig_write            (xcvr_reconfig_write),         
	  	.o_xcvr_reconfig_readdata         (xcvr_reconfig_readdata),  
	  	.i_xcvr_reconfig_writedata        (xcvr_reconfig_writedata),     
	  	.o_xcvr_reconfig_waitrequest      (xcvr_reconfig_waitrequest),
      // PTP IF
      //100G PTP
      //Custom IF
      //Misc Signals
	  	.o_tx_pll_locked                  (o_tx_pll_locked),     
	  	.o_sl_tx_lanes_stable             (o_tx_lanes_stable),    
	  	.o_sl_rx_pcs_ready                (o_rx_pcs_ready),       
      //
	  	.o_sl_txfifo_pfull                (o_sl_txfifo_pfull),    
	  	.o_sl_txfifo_pempty               (o_sl_txfifo_pempty),   
	  	.o_sl_txfifo_overflow             (o_sl_txfifo_overflow), 
	  	.o_sl_txfifo_underflow            (o_sl_txfifo_underflow),
      //CSR HAS
      //common
	  	.o_cdr_lock                       (),       
      //Datapath Interface
      //MAC+PCS mode
	  	.o_sl_tx_ready                    (o_tx_ready),         
	  	.o_sl_rx_valid                    (o_rx_valid),         
	  	.i_sl_tx_valid                    (i_tx_valid),         
	  	.i_sl_tx_data                     (i_tx_data),          
	  	.o_sl_rx_data                     (o_rx_data),          
	  	.i_sl_tx_error                    (i_tx_error),         
	  	.i_sl_tx_startofpacket            (i_tx_startofpacket), 
	  	.i_sl_tx_endofpacket              (i_tx_endofpacket),   
	  	.i_sl_tx_empty                    (i_tx_empty),         
	  	.i_sl_tx_skip_crc                 (i_tx_skip_crc),      
	  	.o_sl_rx_startofpacket            (o_rx_startofpacket), 
	  	.o_sl_rx_endofpacket              (o_rx_endofpacket),   
	  	.o_sl_rx_empty                    (o_rx_empty),         
	  	.o_sl_rx_error                    (o_rx_error),         
	  	.o_sl_rxstatus_data               (o_rxstatus_data),    
	  	.o_sl_rxstatus_valid              (o_rxstatus_valid),   
      //
	  	.i_sl_tx_pfc                      (i_tx_pfc),           
	  	.o_sl_rx_pfc                      (o_rx_pfc),           
	  	.i_sl_tx_pause                    (i_tx_pause),         
	  	.o_sl_rx_pause                    (o_rx_pause),         
      //100G Datapath
      //include_alternate_ports  && PCS/PMA modes //TBD
      //
      //
      //
      //
      //
      //
      //10G/25G EHIP signals
	  	.o_sl_rx_hi_ber                   (o_rx_hi_ber_int),
	  	.o_sl_ehip_ready                  (o_ehip_ready_int),
	  	.o_sl_rx_block_lock               (o_rx_block_lock_int),
	  	.o_sl_local_fault_status          (o_local_fault_status_int),
	  	.o_sl_remote_fault_status         (o_remote_fault_status_int)
	  );



endmodule

