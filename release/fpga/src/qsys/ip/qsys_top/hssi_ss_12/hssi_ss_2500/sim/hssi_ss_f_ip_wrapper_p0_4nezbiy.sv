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
//                   : 1. AXI ST to AVST bridge 
//                   : 2. PTP TX Classifier 
//                   : 3. HOTPLUG module
//                   : 4. Glue logic for datapath 
// ==========================================================================
// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module hssi_ss_f_ip_wrapper_p0_4nezbiy #(
// -----------------------------------------------------
// Parameters Name              = Default  //Description
// -----------------------------------------------------
//  Child IP parameters, port wise
    parameter Max_No_of_ports     = 1,
    parameter NUM_CHANNELS        = 1,
    parameter NUM_XCVR_CHANNELS   = 1,
    parameter DATA_WIDTH          = 64,
    parameter NO_OF_BYTES         = DATA_WIDTH/8, 
    parameter AXI_READY_LATENCY   = 0,
    parameter PORT_PROFILE        = "10GbE",
    parameter NUM_OF_SEG          = DATA_WIDTH/8, 
    parameter NUM_MAX_PORTS       = 4,
    parameter Tiles               = "E",
    parameter PTP_TX_CLASSIFIER_ENABLE  =0,
    parameter PORT_CLIENT_IF      = 0,  // 0 - MAC SEG, 1 - SOP aligned
    parameter PKT_SEG_PARITY_EN   = 0,
    parameter AVST_DATA_WIDTH     = DATA_WIDTH,
    parameter EMPTY_BITS          = 3,
    parameter PREAMBLE_EN         = 0,
    parameter ENABLE_ECC          = 0,
    parameter PKT_CYL             = (PORT_PROFILE == "400GAUI-4" || PORT_PROFILE == "400GAUI-8") ? 2 : 1,
    parameter ENABLE_MULTI_STREAM = 0,
    parameter NUM_OF_STREAM       = 1,
    parameter TID                 = 8,
    //
    //parameter max_refclk          = 1, 
    //parameter max_clkout          = 1,
    parameter TX_TUSER_CLIENT_WIDTH                      = 1,
    parameter RX_TUSER_CLIENT_WIDTH                      = 1,
    parameter RX_TUSER_STATS_WIDTH                       = 1,
    parameter ASYNC_ADAPTERS_EN                          = 0,    
    parameter PFC_NUM_QUEUES                             = 1,
    parameter FLOW_CONTROL_EN                            = 1,
    parameter PFC_TX_BUFFER_EN                           = 1,
    parameter [31:0] TX_QUEUE_SIZE      [8-1:0]          = '{default:512}, 
    parameter [31:0] TX_QUEUE_WIDTH     [8-1:0]          = '{default:9}, 
    parameter [31:0] RX_QUEUE_SIZE      [8-1:0]          = '{default:512}, 
    parameter [31:0] RX_QUEUE_WIDTH     [8-1:0]          = '{default:9}, 
    parameter sim_mode            = "disable"        //             {"disable" "enable"}

    )
   (

   input  wire                                    i_reconfig_clk, 
   input  wire                                    i_reconfig_reset_n,
   input  [5:0]                                   i_profile_sel,
   output [NUM_MAX_PORTS-1:0]                     o_port_active_mask_reg,
   output [2:0]                                   o_data_width,
   output [5:0]                                   o_speed_sel,

   //PTP Parser AXI interface
   input   [7:0]          ptp_parser_reconfig_awaddr, 
   input   [2:0]          ptp_parser_reconfig_awprot, 
   input                  ptp_parser_reconfig_awvalid,
   output                 ptp_parser_reconfig_awready,
   input   [31:0]         ptp_parser_reconfig_wdata,  
   input   [3:0]          ptp_parser_reconfig_wstrb,  
   input                  ptp_parser_reconfig_wvalid, 
   output                 ptp_parser_reconfig_wready, 
   output  [1:0]          ptp_parser_reconfig_bresp,  
   output                 ptp_parser_reconfig_bvalid, 
   input                  ptp_parser_reconfig_bready, 
   input   [7:0]          ptp_parser_reconfig_araddr, 
   input   [2:0]          ptp_parser_reconfig_arprot, 
   input                  ptp_parser_reconfig_arvalid,
   output                 ptp_parser_reconfig_arready,
   output  [31:0]         ptp_parser_reconfig_rdata,  
   output  [1:0]          ptp_parser_reconfig_rresp,  
   output                 ptp_parser_reconfig_rvalid, 
   input                  ptp_parser_reconfig_rready, 
   input                  i_tx_preamble_pass_thr_en,
   input                  i_rx_preamble_pass_thr_en,
  
// PTP Signals
   // output  [1:0]          o_av_st_tx_ptp_ts_valid,
   // output  [0:0]          o_av_st_tx_ptp_ts_req,
   // output  [0:0]          o_av_st_tx_ptp_ins_ets,
   // output  [63:0]         o_av_st_tx_ptp_fp,
   // output  [0:0]          o_av_st_tx_ptp_ins_cf,
   // output  [95:0]        o_av_st_tx_ptp_tx_its,
   // output  [6:0]         o_av_st_tx_ptp_asym_p2p_idx,
   // output  [0:0]          o_av_st_tx_ptp_asym_sign,
   // output  [0:0]          o_av_st_tx_ptp_asym,
   // output  [0:0]          o_av_st_tx_ptp_p2p,
   // 
   // output                 o_av_st_tx_ptp_ts_format, 
   // output                 o_av_st_tx_ptp_update_eb, 
   // output                 o_av_st_tx_ptp_zero_csum, 
   // output  [15:0]         o_av_st_tx_ptp_eb_offset, 
   // output  [15:0]         o_av_st_tx_ptp_csum_offset, 
   // output  [15:0]         o_av_st_tx_ptp_cf_offset, 
   // output  [15:0]         o_av_st_tx_ptp_ts_offset,
    output [Max_No_of_ports-1: 0][PKT_CYL*1-1:0]    o_av_st_tx_ptp_ts_format, 
    output [Max_No_of_ports-1: 0][PKT_CYL*16-1:0]   o_av_st_tx_ptp_eb_offset, 
    output [Max_No_of_ports-1: 0][2-1:0]            o_av_st_tx_ptp_ts_valid,
    output [Max_No_of_ports-1: 0][PKT_CYL*1-1:0]    o_av_st_tx_ptp_ins_ets,
    output [Max_No_of_ports-1: 0][PKT_CYL*1-1:0]    o_av_st_tx_ptp_ins_cf,
    output [Max_No_of_ports-1: 0][PKT_CYL*1-1:0]    o_av_st_tx_ptp_zero_csum,
    output [Max_No_of_ports-1: 0][PKT_CYL*1-1:0]    o_av_st_tx_ptp_update_eb,
    output [Max_No_of_ports-1: 0][PKT_CYL*16-1:0]   o_av_st_tx_ptp_ts_offset,
    output [Max_No_of_ports-1: 0][PKT_CYL*16-1:0]   o_av_st_tx_ptp_cf_offset,
    output [Max_No_of_ports-1: 0][PKT_CYL*16-1:0]   o_av_st_tx_ptp_csum_offset,
    output [Max_No_of_ports-1: 0][PKT_CYL*1-1:0]    o_av_st_tx_ptp_p2p,
    output [Max_No_of_ports-1: 0][PKT_CYL*1-1:0]    o_av_st_tx_ptp_asym,
    output [Max_No_of_ports-1: 0][PKT_CYL*1-1:0]    o_av_st_tx_ptp_asym_sign,
    output [Max_No_of_ports-1: 0][PKT_CYL*7-1:0]    o_av_st_tx_ptp_asym_p2p_idx,
    output [Max_No_of_ports-1: 0][PKT_CYL*1-1:0]    o_av_st_tx_ptp_ts_req,
    output [Max_No_of_ports-1: 0][PKT_CYL*32-1:0]   o_av_st_tx_ptp_fp,
    output [Max_No_of_ports-1: 0][PKT_CYL*96 -1:0]  o_av_st_tx_ptp_tx_its,
   
   input   [Max_No_of_ports-1:0][191:0]             i_av_st_ptp_rx_its,
   input                                            p0_app_ss_st_client_clk,
   input                                            p1_app_ss_st_client_clk,
   input                                            p2_app_ss_st_client_clk,
   input                                            p3_app_ss_st_client_clk,
   input                                            p0_app_ss_st_client_areset_n,
   input                                            p1_app_ss_st_client_areset_n,
   input                                            p2_app_ss_st_client_areset_n,
   input                                            p3_app_ss_st_client_areset_n,
   // TX Client Interface
   input  [Max_No_of_ports-1:0]             app_ss_tx_tvalid,
   output [Max_No_of_ports-1:0]             ss_app_tx_tready,
   input  [DATA_WIDTH-1:0]                  app_ss_tx_tdata,
   //input  [NO_OF_BYTES-1:0] app_ss_tx_tkeep,
   input  [(DATA_WIDTH/8)-1:0]              app_ss_tx_tkeep,
   input  [Max_No_of_ports-1:0]             app_ss_tx_tlast,
   input  [TX_TUSER_CLIENT_WIDTH-1:0]       app_ss_tx_tuser_client,
   //input  [93:0]            app_ss_tx_tuser_ptp,
   //input [327:0]           app_ss_tx_tuser_ptp_extended,
   //-------------------------------------------------
   input  [NUM_OF_SEG-1:0]                              app_ss_st_tx_tuser_last_segment,
   //input [NUM_OF_SEG * NO_OF_BYTES-1:0]      app_ss_st_tx_tkeep_segment,
   input  [((PORT_CLIENT_IF == 1)? (NUM_MAX_PORTS -1) : (NUM_OF_SEG - 1)):0]  app_ss_st_tx_tuser_pkt_seg_parity,
   input  [TID-1:0]                                     app_ss_st_tx_tid,
   //-------------------------------------------------
   //TBD: Not in HAS. Currently, we made common for both multi streaming & non multi
   output [Max_No_of_ports-1:0]                 ss_app_st_rxingrts0_tvalid,
   output [Max_No_of_ports*96-1:0]              ss_app_st_rxingrts0_tdata,
   output [Max_No_of_ports-1:0]                 ss_app_st_rxingrts1_tvalid,
   output [Max_No_of_ports*96-1:0]              ss_app_st_rxingrts1_tdata,
   
   input                                        p0_app_ss_st_clk,
   input                                        p1_app_ss_st_clk,
   input                                        p2_app_ss_st_clk,
   input                                        p3_app_ss_st_clk,
   input                                        p0_app_ss_st_areset_n,
   input                                        p1_app_ss_st_areset_n,
   input                                        p2_app_ss_st_areset_n,
   input                                        p3_app_ss_st_areset_n,
   //To be changed as multi streaming interface while changing  parser module
   input  [(Max_No_of_ports*94)-1:0]            app_ss_tx_tuser_ptp,
   input  [(Max_No_of_ports*328)-1:0]           app_ss_tx_tuser_ptp_extended,
    // RX Client Interface
   output [Max_No_of_ports-1:0]                         ss_app_rx_tvalid,
   output [DATA_WIDTH-1:0]                              ss_app_rx_tdata,
   output [(DATA_WIDTH/8)-1:0]                          ss_app_rx_tkeep,
   output [Max_No_of_ports-1:0]                         ss_app_rx_tlast,
   output [RX_TUSER_CLIENT_WIDTH-1:0]                   ss_app_rx_tuser_client,
   output [RX_TUSER_STATS_WIDTH-1:0]                    ss_app_rx_tuser_sts,
   output [31:0]                                        ss_app_rx_tuser_sts_extended,
   output [NUM_OF_SEG-1:0]                              ss_app_st_rx_tuser_last_segment,
   output [((PORT_CLIENT_IF == 1)? (NUM_MAX_PORTS -1) : (NUM_OF_SEG - 1)):0]   ss_app_st_rx_tuser_pkt_seg_parity,
   output [TID-1:0]                                     ss_app_st_rx_tid,
  //--------------------------------------------------- 

   output [Max_No_of_ports-1:0][2-1:0]                    o_tx_fifo_eccstatus,  
   output [Max_No_of_ports-1:0]                           o_axi_st_tx_parity_error,  

   
  //MAC segemented
   output [DATA_WIDTH-1:0]               o_tx_mac_data,
   output [Max_No_of_ports-1:0]          o_tx_mac_valid,
   output [NUM_OF_SEG-1:0]               o_tx_mac_inframe,
   output [(NUM_OF_SEG*EMPTY_BITS)-1:0]  o_tx_mac_eop_empty,
   input  [Max_No_of_ports-1:0]          i_tx_mac_ready,
   output [NUM_OF_SEG-1:0]               o_tx_mac_error,
   output [NUM_OF_SEG-1:0]               o_tx_mac_skip_crc,
   input  [DATA_WIDTH-1:0]               i_rx_mac_data,
   input  [Max_No_of_ports-1:0]          i_rx_mac_valid,
   input  [NUM_OF_SEG-1:0]               i_rx_mac_inframe,
   input  [(NUM_OF_SEG*EMPTY_BITS)-1:0]  i_rx_mac_eop_empty,
   input  [(NUM_OF_SEG*2)-1:0]           i_rx_mac_error,
   input  [NUM_OF_SEG-1:0]               i_rx_mac_fcs_error,
   input  [(NUM_OF_SEG*3)-1:0]           i_rx_mac_status,



////////////////////////////////////////////////////////////////
//    //MULTI PACKET COMPATIBLE SIGNALS    
//    input  [NUM_SEG-1:0]                    i_axi_st_tx_tlast_segment,
//    input  [NUM_SEG*AXIST_NO_OF_BYTES-1:0]        i_axi_st_tx_tkeep_segment,
//    input  [4:0]                               i_axi_st_tx_tuser_sts,
//
//  //MAC_SEGMENTED COMPATIBLE SIGNALS    
//    output reg  [NUM_SEG-1:0]                   o_av_st_tx_inframe,
//    output reg  [NUM_SEG*AVST_EMPTY_BITS-1:0]        o_av_st_tx_eop_empty,
//    output reg  [AVST_ERR-1:0]                  o_av_st_tx_mac_error,
//    //output reg  [MAC_STS-1:0]                  o_av_st_txstatus_data
//
//  //MAC_SEGMENTED COMPATIBLE SIGNALS    
//    input   [NUM_SEG-1:0]                     i_av_st_rx_inframe,
//    input   [NUM_SEG*AVST_EMPTY_BITS-1:0]         i_av_st_rx_eop_empty,
//    input   [AVST_ERR-1:0]                    i_av_st_rx_mac_error,
//    input   [AVST_FCS_ERR-1:0]                i_av_st_rx_fcs_error,
//    input   [AVST_MAC_STS-1:0]                i_av_st_rx_mac_status,
//
//  //MULTI PACKET COMPATIBLE SIGNALS    
//    output reg [NUM_SEG-1:0]                  o_axi_st_rx_tlast_segment,
//    output reg [NUM_SEG*AXIST_NO_OF_BYTES-1:0]      o_axi_st_rx_tkeep_segment
   /////////////////////////////////////////////////////
      output tp
   );

//************************************************************************************************
//************************************************************************************************
localparam SIM_EMULATE = (sim_mode == "enable") ? 1'b1 : 1'b0;
localparam PHY_DIRECT_MODE = 0 ;
//TBD 100G mode PCS, PMA mode width ?
localparam PCS_DW = (DATA_WIDTH == 'd80) ? 'd64 : 'd256;
localparam PCS66_DW = (DATA_WIDTH == 'd80) ? 'd66 : 'd264;
//localparam PCS_BW = (DATA_WIDTH == 'd80) ? 'd8 : 'd64;
localparam PCS_BW = (DATA_WIDTH == 'd80) ? 'd8 : 'd32;
localparam PHY_DIRECT_DW  = 'd80;

logic  [2-1:0][47:0]    sig_app_ss_tx_tuser_ptp;
logic  [2-1:0][163:0]   sig_app_ss_tx_tuser_ptp_extended;
logic  [2-1:0][47:0]    sig_app_ss_tx_mux_tuser_ptp_tmp;
logic  [2-1:0][163:0]   sig_app_ss_tx_mux_tuser_ptp_extended_tmp;
logic  [2-1:0][47:0]    app_ss_tx_mux_tuser_ptp_tmp;
logic  [2-1:0][163:0]   app_ss_tx_mux_tuser_ptp_extended_tmp;

//wire [max_clkout-1:0]                o_tx_pll_clk_div64;
//wire [max_clkout-1:0]                o_tx_pll_clk_div66;
//wire [max_clkout-1:0]                o_rx_pll_clk_div64;
//wire [max_clkout-1:0]                o_rx_pll_clk_div66;
//wire [NUM_CHANNELS-1:0]              i_cpri_csr_rst_n;
//wire [NUM_CHANNELS-1:0]              i_cpri_tx_rst_n;
//wire [NUM_CHANNELS-1:0]              i_cpri_rx_rst_n;
//wire                                 i_cpri_reconfig_reset;

//reg  [19*NUM_XCVR_CHANNELS-1:0]     i_xcvr_reconfig_address_int;
//reg  [19*2-1:0]                     i_ptp_reconfig_address_int;
//wire [11-1:0]                       i_rsfec_reconfig_addr_int;
//wire                                o_rsfec_reconfig_waitrequest_int;
//wire [7:0]                          o_rsfec_reconfig_readdata_int;
//wire                                i_rsfec_reconfig_read_int;
//reg  [10:0]                         rsfec_wait_cntr;
//wire [NUM_XCVR_CHANNELS-1:0]        o_xcvr_reconfig_waitrequest_int;
//wire [8*NUM_XCVR_CHANNELS-1:0]      o_xcvr_reconfig_readdata_int;
//wire [1:0]                          o_ptp_reconfig_waitrequest_int;
//wire [8*2-1:0]                      o_ptp_reconfig_readdata_int;
//wire [19*NUM_CHANNELS-1:0]          i_eth_reconfig_addr_int;
//wire [19*NUM_CHANNELS-1:0]          ehip_eth_reconfig_addr_int;
//wire [12*NUM_CHANNELS-1:0]          ehip_eth_reconfig_addr;
//wire [NUM_CHANNELS-1:0]             ehip_eth_reconfig_read;
//wire [NUM_CHANNELS-1:0]             ehip_eth_reconfig_write;
//wire [32*NUM_CHANNELS-1:0]          ehip_eth_reconfig_writedata;
//wire [32*NUM_CHANNELS-1:0]          ehip_eth_reconfig_readdata;
//wire [NUM_CHANNELS-1:0]             ehip_eth_reconfig_readdatavalid;
//wire [NUM_CHANNELS-1:0]             ehip_eth_reconfig_waitrequest;

//wire                                o_rx_am_lock_int;
//wire [NUM_CHANNELS*96-1:0]          o_ptp_ets;
//wire [NUM_CHANNELS*8-1:0]           o_ptp_ets_fp;
//wire [NUM_CHANNELS*96-1:0]          o_ptp_rx_its;
//reg  [NUM_CHANNELS*96-1:0]          app_ss_st_txtod_tdata_reg;
//reg  [NUM_CHANNELS*96-1:0]          app_ss_st_rxtod_tdata_reg;

//wire                                 o_rx_am_lock_sync;
//wire [NUM_CHANNELS-1:0]              o_cdr_lock_int;
//wire [NUM_CHANNELS-1:0]             o_rx_block_lock_int;
//wire [NUM_CHANNELS-1:0]             o_local_fault_status_int;
//wire [NUM_CHANNELS-1:0]             o_remote_fault_status_int;
//wire [NUM_CHANNELS-1:0]             o_rx_hi_ber_int;
//wire [NUM_CHANNELS-1:0]             o_ehip_ready_int;
//wire [3:0]                          o_xcvr_ready_int;
//wire [NUM_CHANNELS-1:0]              o_xcvr_ready_int;

///////////////////////////////////// hac
//wire [NUM_CHANNELS-1:0]             i_av_st_tx_ready;
//wire [NUM_CHANNELS-1:0]             o_av_st_tx_valid;
//wire [NUM_CHANNELS-1:0][DATA_WIDTH-1:0]  o_av_st_tx_data;
//wire [NUM_CHANNELS-1:0]             o_av_st_tx_startofpacket;
//wire [NUM_CHANNELS-1:0]             o_av_st_tx_endofpacket;
//wire [NUM_CHANNELS-1:0][EMPTY_BITS-1:0]  o_av_st_tx_empty;
//wire [NUM_CHANNELS-1:0]             o_av_st_tx_error;
//wire [NUM_CHANNELS-1:0]             o_av_st_tx_skip_crc;

//wire [NUM_CHANNELS-1:0][1:0]        o_av_st_tx_ptp_ts_valid;
//wire [NUM_CHANNELS-1:0][1:0]        o_av_st_tx_ptp_ts_req;
//wire [NUM_CHANNELS-1:0][1:0]        o_av_st_tx_ptp_ins_ets;
//wire [NUM_CHANNELS-1:0][63:0]       o_av_st_tx_ptp_fp;
//wire [NUM_CHANNELS-1:0][1:0]        o_av_st_tx_ptp_ins_cf;
//wire [NUM_CHANNELS-1:0][191:0]      o_av_st_tx_ptp_tx_its;
//wire [NUM_CHANNELS-1:0][13:0]       o_av_st_tx_ptp_asym_p2p_idx;
//wire [NUM_CHANNELS-1:0][1:0]        o_av_st_tx_ptp_asym_sign;
//wire [NUM_CHANNELS-1:0][1:0]        o_av_st_tx_ptp_asym;
//wire [NUM_CHANNELS-1:0][1:0]        o_av_st_tx_ptp_p2p;

//wire [NUM_CHANNELS-1:0]             o_av_st_tx_ptp_ts_format; 
//wire [NUM_CHANNELS-1:0]             o_av_st_tx_ptp_update_eb; 
//wire [NUM_CHANNELS-1:0]             o_av_st_tx_ptp_zero_csum; 
//wire [NUM_CHANNELS-1:0][15:0]       o_av_st_tx_ptp_eb_offset; 
//wire [NUM_CHANNELS-1:0][15:0]       o_av_st_tx_ptp_csum_offset; 
//wire [NUM_CHANNELS-1:0][15:0]       o_av_st_tx_ptp_cf_offset; 
//wire [NUM_CHANNELS-1:0][15:0]       o_av_st_tx_ptp_ts_offset; 

//wire [NUM_CHANNELS-1:0]                i_av_st_rx_valid;
//wire [NUM_CHANNELS-1:0][DATA_WIDTH-1:0]i_av_st_rx_data;
//wire [NUM_CHANNELS-1:0]                i_av_st_rx_startofpacket;
//wire [NUM_CHANNELS-1:0]                i_av_st_rx_endofpacket;
//wire [NUM_CHANNELS-1:0][EMPTY_BITS-1:0]i_av_st_rx_empty;
//wire [NUM_CHANNELS-1:0][5:0]           i_av_st_rx_error;
//wire [NUM_CHANNELS-1:0][39:0]          i_av_st_rxstatus_data;
//wire [NUM_CHANNELS-1:0]                i_av_st_rxstatus_valid;
//wire [NUM_CHANNELS-1:0][95:0]          i_av_st_ptp_rx_its;

// 10/25/100G TX MAC Interface
//wire [NUM_CHANNELS-1:0]                 o_tx_ready; // Indicates that the MAC is ready to accept new data.
//wire [DATA_WIDTH*NUM_CHANNELS-1:0]     i_tx_data;          // Input data to the MAC. Bits 0 is the LSB
//wire [NUM_CHANNELS-1:0]                 i_tx_valid; //Indicates data TX data is valid. Must remain high throughout transmission of packet
//wire [NUM_CHANNELS-1:0]                 i_tx_startofpacket; //Start of packet (SOP). Asserted for one cycle at the beginning of frame
//wire [NUM_CHANNELS-1:0]                 i_tx_endofpacket; //End of packet (EOP). Asserted for one cycle on the last cycle of the frame
//wire [EMPTY_BITS*NUM_CHANNELS-1:0]     i_tx_empty; // Indicates the number of empty bytes at the end of the frame. Must be valid when EOP is asserted.    
//wire [NUM_CHANNELS-1:0]                 i_tx_error; // A valid high on this signal aligned with an eop will cause the tx frame to be treated as an error. 
//wire [NUM_CHANNELS-1:0]                 i_tx_skip_crc;
////10/25/100G RX MAC Interface
//wire [DATA_WIDTH*NUM_CHANNELS-1:0]     o_rx_data; // output data from the MAC, Bit 0 is LSB
//wire [NUM_CHANNELS-1:0]                o_rx_valid; // Indicates data RX data, EOP, and SOP are valid.
//wire [NUM_CHANNELS-1:0]                o_rx_startofpacket; // Start of packet (SOP). Asserted for one cycle at the beginning of frame
//wire [NUM_CHANNELS-1:0]                o_rx_endofpacket; // End of packet (EOP). Asserted for one cycle on the last cycle of the frame
//wire [EMPTY_BITS*NUM_CHANNELS-1:0]     o_rx_empty; // Indicates the number of empty bytes at the end of the frame. Must be valid when EOP is asserted.
//wire [6*NUM_CHANNELS-1:0]              o_rx_error; // RX error bits asserted on the EOP cycle.[0] : malformed block, [1] : crc error, [2] : reserved, [3] : reserved, [4] : length error, [5] : reserved
//wire [40*NUM_CHANNELS-1:0]             o_rxstatus_data; //RX frame status information. Valid on EOP cycle.[0:31] : reserved, [32] : stacked vlan frame ,[33] : vlan frame ,[34] : control frame, [35] : pause frame, [36:38] : reserved, [39] : pfc frame
//wire [NUM_CHANNELS-1:0]                o_rxstatus_valid; //asserted to indicate that bits on o_rxstatus_data are valid
//
//// User Interface: TX 2-step Timestamp Request
//wire [NUM_CHANNELS-1:0]             i_ptp_ts_req;
//wire [8*NUM_CHANNELS-1:0]           i_ptp_fp;
//// User Interface: TX 1-step Command
//wire [NUM_CHANNELS-1:0]             i_ptp_ins_ets;
//wire [NUM_CHANNELS-1:0]             i_ptp_ins_cf;
//wire [96*NUM_CHANNELS-1:0]          i_ptp_tx_its;
//wire [NUM_CHANNELS-1:0]             i_ptp_zero_csum;
//wire [NUM_CHANNELS-1:0]             i_ptp_update_eb;
//wire [NUM_CHANNELS-1:0]             i_ptp_ts_format;
//wire [16*NUM_CHANNELS-1:0]          i_ptp_ts_offset;
//wire [16*NUM_CHANNELS-1:0]          i_ptp_cf_offset;
//wire [16*NUM_CHANNELS-1:0]          i_ptp_csum_offset;
//wire [16*NUM_CHANNELS-1:0]          i_ptp_eb_offset;

 // TX Interface
     logic [Max_No_of_ports-1:0]                app_ss_tx_mux_tvalid;
     logic [Max_No_of_ports-1:0]                ss_app_tx_mux_tready;
     logic [DATA_WIDTH-1:0]  app_ss_tx_mux_tdata;
     logic [(DATA_WIDTH/8)-1:0]                 app_ss_tx_mux_tkeep;
     logic [Max_No_of_ports-1:0]                app_ss_tx_mux_tlast;
     logic [TX_TUSER_CLIENT_WIDTH-1:0]          app_ss_tx_mux_tuser_client;
     //logic [Max_No_of_ports-1:0][47:0]          app_ss_tx_mux_tuser_ptp_tmp;
     logic [Max_No_of_ports-1:0][93:0]          app_ss_tx_mux_tuser_ptp;
     logic [Max_No_of_ports-1:0][327:0]         app_ss_tx_mux_tuser_ptp_extended;
     //logic [Max_No_of_ports-1:0][163:0]         app_ss_tx_mux_tuser_ptp_extended_tmp;
     
     logic [Max_No_of_ports-1:0]                parser_result_pkt_recognized;
     logic [Max_No_of_ports-1:0]                ptp_parser_rst_n;
     
     logic [NUM_OF_SEG-1:0]                     app_ss_st_tx_mux_tuser_last_segment;  
     //logic  [NUM_OF_SEG * NO_OF_BYTES-1:0]    app_ss_st_tx_mux_tkeep_segment;       
     logic [((PORT_CLIENT_IF == 1)? (NUM_MAX_PORTS -1) : (NUM_OF_SEG - 1)):0]   app_ss_st_tx_mux_tuser_pkt_seg_parity;
     //givxlogic  [NUM_OF_SEG-1:0]              ss_app_st_rx_mux_tuser_last_segment;
     //logic  [NUM_OF_SEG * NO_OF_BYTES-1:0]    ss_app_st_rx_mux_tkeep_segment;
     //logic  [(DATA_WIDTH/64)-1:0]             ss_app_st_rx_mux_tuser_pkt_seg_parity;
     ////changed nameswire [(NUM_OF_SEG*8)-1:0] axi_st_rx_tkeep_segment;
     ////changed nameswire [(DATA_WIDTH/8)-1:0] axi_st_rx_tkeep;
       logic [TID-1:0]                                  app_ss_st_tx_mux_tid;
       // Added RX Client Interface
       logic [Max_No_of_ports-1:0]                      ss_app_rx_mux_tvalid;
       logic [DATA_WIDTH-1:0]                           ss_app_rx_mux_tdata;
       logic [(DATA_WIDTH/8)-1:0]                       ss_app_rx_mux_tkeep;
       logic [Max_No_of_ports-1:0]                      ss_app_rx_mux_tlast;
       logic [(DATA_WIDTH/8)-1:0]                       axi_st_rx_mux_tkeep;
       logic [(NUM_OF_SEG*8)-1:0]                       axi_st_rx_mux_tkeep_segment;
       logic [RX_TUSER_CLIENT_WIDTH-1:0]                ss_app_rx_mux_tuser_client;
       logic [RX_TUSER_STATS_WIDTH-1:0]                 ss_app_rx_mux_tuser_sts;
       logic [31:0]                                     ss_app_rx_mux_tuser_sts_extended;
       logic [NUM_OF_SEG-1:0]                           ss_app_st_rx_mux_tuser_last_segment;
       logic [((PORT_CLIENT_IF == 1)? (NUM_MAX_PORTS -1) : (NUM_OF_SEG - 1)):0]  ss_app_st_rx_mux_tuser_pkt_seg_parity;
       logic [TID-1:0]                                  ss_app_st_rx_mux_tid;
       logic [Max_No_of_ports-1:0]                      ss_app_st_mux_rxingrts0_tvalid;
       logic [Max_No_of_ports*96-1:0]                   ss_app_st_mux_rxingrts0_tdata;
       logic [Max_No_of_ports-1:0]                      ss_app_st_mux_rxingrts1_tvalid;
       logic [Max_No_of_ports*96-1:0]                   ss_app_st_mux_rxingrts1_tdata;
  
     wire   [Max_No_of_ports-1:0][2-1:0]                tx_fifo_eccstatus;  
     wire   [Max_No_of_ports-1:0]                       axi_st_tx_parity_error;  
     


assign sig_app_ss_tx_tuser_ptp[0] = app_ss_tx_tuser_ptp[47:0];
assign sig_app_ss_tx_tuser_ptp[1] = (PKT_CYL == 2) ? {2'd0,app_ss_tx_tuser_ptp[93:48]} : '0;

assign sig_app_ss_tx_tuser_ptp_extended[0] = app_ss_tx_tuser_ptp_extended[163:0];
assign sig_app_ss_tx_tuser_ptp_extended[1] = (PKT_CYL == 2) ? app_ss_tx_tuser_ptp_extended[327:164] : '0;


assign sig_app_ss_tx_mux_tuser_ptp_tmp[0] = app_ss_tx_mux_tuser_ptp_tmp[0][47:0];                                           
assign sig_app_ss_tx_mux_tuser_ptp_tmp[1] = (PKT_CYL == 2) ? app_ss_tx_mux_tuser_ptp_tmp[1][47:0] : '0;                     

assign sig_app_ss_tx_mux_tuser_ptp_extended_tmp[0] = app_ss_tx_mux_tuser_ptp_extended_tmp[0][163:0];                        
assign sig_app_ss_tx_mux_tuser_ptp_extended_tmp[1] = (PKT_CYL == 2) ? app_ss_tx_mux_tuser_ptp_extended_tmp[1][163:0] : '0;  

genvar i,j;

//************************************************************************************************
//************************************** Data Path Bridge ****************************************
//************************************************************************************************

//********************************* PFC Extension Subsystem ***********************************

//********************************* PTP Packet Parser ***********************************
    //generate
    //for (i=0; i<NUM_CHANNELS; i=i+1)
    //begin : PTP_PARSER_LOOP
      if (PTP_TX_CLASSIFIER_ENABLE)
      begin : PTP_PARSER

        hssi_ss_std_synchronizer_nocut U_PARSER_RST_SYNC (
            .clk                            (p0_app_ss_st_client_clk), 
            .reset_n                        (p0_app_ss_st_client_areset_n),
            .din                            (1'b1), 
            .dout                           (ptp_parser_rst_n)
           );
 ptp_tx_adp_mpm_parser_custom_wrapper #(
           .PREAMBLE_EN                (PREAMBLE_EN),
           .DST_ST_LATENCY             (AXI_READY_LATENCY),
           .DATA_WIDTH                 (DATA_WIDTH),
           .TID_WIDTH                  (TID),
           .NUM_OF_SEG                 (NUM_OF_SEG),  //PKT_CYL,
           .NUM_OF_SOP                 (1),
           .HSSI_TX_TUSER_CLIENT_WIDTH ((PORT_CLIENT_IF == 1) ? ('d2 + NUM_MAX_PORTS)  : ((2*NUM_OF_SEG)+(NUM_OF_SEG))),  //TUSER_CLIENT_WIDTH + PKT_SEG_PARITY WIDTH
           .ENABLE_STATS_CNTRS         (1),
           .BASE_OFFSET                ('h100)
        ) U_PTP_PARSER(
           .clk                                       (p0_app_ss_st_client_clk),
           .rst_n                                     (ptp_parser_rst_n),
           .axi_sl_clk                                (i_reconfig_clk),
           .axi_sl_rst_n                              (i_reconfig_reset_n),
           .app_pp_TREADY                             (ss_app_tx_tready),
           .app_pp_TVALID                             (app_ss_tx_tvalid),
           .app_pp_TLAST                              (app_ss_tx_tlast),
           .app_pp_TDATA                              (app_ss_tx_tdata),
           .app_pp_TKEEP                              (app_ss_tx_tkeep),
           .app_pp_tid                                (app_ss_st_tx_tid),
           .app_pp_tuser_last_segment                 (app_ss_st_tx_tuser_last_segment),
           .app_pp_tuser_ppmetadata                   ('0),
           .app_pp_tuser_usermetadata                 ('0),        
           .app_pp_tx_tuser_client                    ({app_ss_tx_tuser_client,app_ss_st_tx_tuser_pkt_seg_parity}),
           
           
           .app_pp_tx_tuser_ptp                       (sig_app_ss_tx_tuser_ptp[0]),
           .app_pp_tx_tuser_ptp_extended              (sig_app_ss_tx_tuser_ptp_extended[0]),
        
           .pp_app_TREADY                             (ss_app_tx_mux_tready),
           .pp_app_TVALID                             (app_ss_tx_mux_tvalid),
           .pp_app_TLAST                              (app_ss_tx_mux_tlast),
           .pp_app_TDATA                              (app_ss_tx_mux_tdata),
           .pp_app_TKEEP                              (app_ss_tx_mux_tkeep),
           .pp_app_tid                                (),
           .pp_app_tuser_last_segment                 (app_ss_st_tx_mux_tuser_last_segment),
           .pp_app_tuser_ppmetadata                   (),
           .pp_app_tuser_usermetadata                 (),
           .pp_app_tx_tuser_ptp                       (app_ss_tx_mux_tuser_ptp_tmp),
           .pp_app_tx_tuser_ptp_extended              (app_ss_tx_mux_tuser_ptp_extended_tmp),
           .pp_app_tx_tuser_client                    ({app_ss_tx_mux_tuser_client,app_ss_st_tx_mux_tuser_pkt_seg_parity}),
        
           .app_pp_axi_sl_AWREADY                     (ptp_parser_reconfig_awready),
           .app_pp_axi_sl_AWVALID                     (ptp_parser_reconfig_awvalid),
           .app_pp_axi_sl_AWADDR                      ({3'd1, ptp_parser_reconfig_awaddr}),
        
           .app_pp_axi_sl_WREADY                      (ptp_parser_reconfig_wready),
           .app_pp_axi_sl_WVALID                      (ptp_parser_reconfig_wvalid),
           .app_pp_axi_sl_WSTRB                       (ptp_parser_reconfig_wstrb),
           .app_pp_axi_sl_WDATA                       (ptp_parser_reconfig_wdata),
        
           .app_pp_axi_sl_BREADY                      (ptp_parser_reconfig_bready),
           .app_pp_axi_sl_BVALID                      (ptp_parser_reconfig_bvalid),
           .app_pp_axi_sl_BRESP                       (ptp_parser_reconfig_bresp),
        
           .app_pp_axi_sl_ARREADY                     (ptp_parser_reconfig_arready),
           .app_pp_axi_sl_ARVALID                     (ptp_parser_reconfig_arvalid),
           .app_pp_axi_sl_ARADDR                      ({3'd1, ptp_parser_reconfig_araddr}),
        
           .app_pp_axi_sl_RREADY                      (ptp_parser_reconfig_rready),
           .app_pp_axi_sl_RVALID                      (ptp_parser_reconfig_rvalid),
           .app_pp_axi_sl_RRESP                       (ptp_parser_reconfig_rresp),
           .app_pp_axi_sl_RDATA                       (ptp_parser_reconfig_rdata),
        /// 
           .o_ptp_pkt_recognized                      (parser_result_pkt_recognized),
        
           .out_axis_tvalid                           (),
           .out_axis_tlast                            (),
           .out_axis_tdata                            (),
           .out_axis_tkeep                            ()
        );  
/*           
        ptp_tx_adp_parser_custom_wrapper #(
           .DATA_WIDTH                     (DATA_WIDTH),
           .DST_ST_LATENCY                 (AXI_READY_LATENCY),
           .HSSI_TX_TUSER_CLIENT_WIDTH     ('d2),
           .ENABLE_STATS_CNTRS             (1),
           .PREAMBLE_EN                    (PREAMBLE_EN),
           .BASE_OFFSET                    ('h100) 
        ) U_PTP_PARSER (
           .clk                            (app_ss_st_client_clk),
           .rst_n                          (ptp_parser_rst_n),
           .axi_sl_clk                     (i_reconfig_clk),
           .axi_sl_rst_n                   (~i_reconfig_reset),
           //AXIs sink/input
           .app_pp_TREADY                  (ss_app_tx_tready),
           .app_pp_TVALID                  (app_ss_tx_tvalid),
           .app_pp_TLAST                   (app_ss_tx_tlast),
           .app_pp_TDATA                   (app_ss_tx_tdata),
           .app_pp_TKEEP                   (app_ss_tx_tkeep),
           .app_pp_tx_tuser_ptp            (app_ss_tx_tuser_ptp[47:0]),
           .app_pp_tx_tuser_ptp_extended   (app_ss_tx_tuser_ptp_extended[163:0]),
           .app_pp_tx_tuser_client         (app_ss_tx_tuser_client),
          //----------------------------------------
           //.app_ss_st_tx_tuser_last_segment   (app_ss_st_tx_mux_tuser_last_segment),      
           //.app_ss_st_tx_tkeep_segment        (app_ss_st_tx_mux_tkeep_segment),
           //.app_ss_st_tx_tuser_pkt_seg_parity (app_ss_st_tx_mux_tuser_pkt_seg_parity),
           //----------------------------------
           .app_pp_tid                     (app_ss_st_tx_tid),
           .app_pp_tuser_last_segment      (app_ss_st_tx_tuser_last_segment),
           .app_pp_tuser_ppmetadata        (1'b0),
           .app_pp_tuser_usermetadata      (1'b0),
           //AXIs source/output
           .pp_app_TREADY                  (ss_app_tx_mux_tready),
           .pp_app_TVALID                  (app_ss_tx_mux_tvalid),
           .pp_app_TLAST                   (app_ss_tx_mux_tlast),
           .pp_app_TDATA                   (app_ss_tx_mux_tdata),
           .pp_app_TKEEP                   (app_ss_tx_mux_tkeep),
           .pp_app_tx_tuser_ptp            (app_ss_tx_mux_tuser_ptp_tmp),
           .pp_app_tx_tuser_ptp_extended   (app_ss_tx_mux_tuser_ptp_extended_tmp),
           .pp_app_tx_tuser_client         (app_ss_tx_mux_tuser_client),
           .pp_app_tuser_last_segment      (app_ss_st_tx_mux_tuser_last_segment),
           //AXI slave Write Address Channel
           .app_pp_axi_sl_AWREADY          (ptp_parser_reconfig_awready),
           .app_pp_axi_sl_AWVALID          (ptp_parser_reconfig_awvalid),
           .app_pp_axi_sl_AWADDR           ({1'b1, ptp_parser_reconfig_awaddr}),
           //AXI slave Write Data Channel
           .app_pp_axi_sl_WREADY           (ptp_parser_reconfig_wready),
           .app_pp_axi_sl_WVALID           (ptp_parser_reconfig_wvalid),
           .app_pp_axi_sl_WSTRB            (ptp_parser_reconfig_wstrb),
           .app_pp_axi_sl_WDATA            (ptp_parser_reconfig_wdata),
           //AXI slave Write Response Channel
           .app_pp_axi_sl_BREADY           (ptp_parser_reconfig_bready),
           .app_pp_axi_sl_BVALID           (ptp_parser_reconfig_bvalid),
           .app_pp_axi_sl_BRESP            (ptp_parser_reconfig_bresp),
           //AXI slave Read Address Channel
           .app_pp_axi_sl_ARREADY          (ptp_parser_reconfig_arready),
           .app_pp_axi_sl_ARVALID          (ptp_parser_reconfig_arvalid),
           .app_pp_axi_sl_ARADDR           ({1'b1, ptp_parser_reconfig_araddr}),
           //AXI slave Read Data Channel
           .app_pp_axi_sl_RREADY           (ptp_parser_reconfig_rready),
           .app_pp_axi_sl_RVALID           (ptp_parser_reconfig_rvalid),
           .app_pp_axi_sl_RRESP            (ptp_parser_reconfig_rresp),
           .app_pp_axi_sl_RDATA            (ptp_parser_reconfig_rdata),
           //result
           .o_ptp_pkt_recognized           (parser_result_pkt_recognized)
        );
*/
        assign app_ss_tx_mux_tuser_ptp                       = {sig_app_ss_tx_mux_tuser_ptp_tmp[1][45:0],sig_app_ss_tx_mux_tuser_ptp_tmp[0]};
        assign app_ss_tx_mux_tuser_ptp_extended[0][327:0]    = {sig_app_ss_tx_mux_tuser_ptp_extended_tmp[1][163:0], sig_app_ss_tx_mux_tuser_ptp_extended_tmp[0][163:0]}; //TODO based on port rate
        //assign app_ss_st_tx_mux_tuser_pkt_seg_parity       = '0;

      end //end of parser
      else
      begin : NO_PTP_PARSER

        assign ss_app_tx_tready                 = ss_app_tx_mux_tready;
        assign app_ss_tx_mux_tvalid             = app_ss_tx_tvalid;
        assign app_ss_tx_mux_tdata              = app_ss_tx_tdata;
        assign app_ss_tx_mux_tkeep              = app_ss_tx_tkeep;
        assign app_ss_tx_mux_tlast              = app_ss_tx_tlast;
        assign app_ss_tx_mux_tuser_client       = app_ss_tx_tuser_client;
        assign app_ss_tx_mux_tuser_ptp          = app_ss_tx_tuser_ptp;
        assign app_ss_tx_mux_tuser_ptp_extended = app_ss_tx_tuser_ptp_extended;
        assign app_ss_st_tx_mux_tid[0]          = '0;

        assign app_ss_st_tx_mux_tuser_last_segment     = app_ss_st_tx_tuser_last_segment;   
       // assign app_ss_st_tx_mux_tkeep_segment          = app_ss_st_tx_tkeep_segment;       
        assign app_ss_st_tx_mux_tuser_pkt_seg_parity   = app_ss_st_tx_tuser_pkt_seg_parity;
        
        
        //RX
        //assign ss_app_rx_tvalid                     = ss_app_rx_mux_tvalid[0];
        //assign ss_app_rx_tdata                      = ss_app_rx_mux_tdata[0];
        //assign ss_app_rx_tlast                      = ss_app_rx_mux_tlast[0];
        ////assign ss_app_rx_tkeep                      = ss_app_rx_mux_tkeep[0];
        //assign ss_app_rx_tuser_client               = ss_app_rx_mux_tuser_client[0];
        //assign ss_app_rx_tuser_sts                  = ss_app_rx_mux_tuser_sts[0];
        //assign ss_app_rx_tuser_sts_extended         = ss_app_rx_mux_tuser_sts_extended[0];
        //assign ss_app_st_rx_tuser_last_segment      = ss_app_st_rx_mux_tuser_last_segment[0];
        //assign ss_app_st_rx_tuser_pkt_seg_parity    = ss_app_st_rx_mux_tuser_pkt_seg_parity[0];
        //assign ss_app_st_rx_tid                     = ss_app_st_rx_mux_tid[0];
        assign ptp_parser_reconfig_awready      = 1'b1;
        assign ptp_parser_reconfig_wready       = 1'b1;
        assign ptp_parser_reconfig_bvalid       = ptp_parser_reconfig_wvalid;
        assign ptp_parser_reconfig_bresp        = 'd0;
        assign ptp_parser_reconfig_arready      = 1'b1;
        assign ptp_parser_reconfig_rvalid       = ptp_parser_reconfig_arvalid;
        assign ptp_parser_reconfig_rresp        = 'd0;
        assign ptp_parser_reconfig_rdata        = 32'hDEADC0DE;
      end
   // end //end of for loop
//endgenerate    


/////////////////////////////////////////////////////////////////
    if (ENABLE_MULTI_STREAM)
      begin : RX_SIG_MS_ENABLED    
        //RX
         assign ss_app_rx_tvalid                     = ss_app_rx_mux_tvalid;
        assign ss_app_rx_tdata                      = ss_app_rx_mux_tdata;
        assign ss_app_rx_tlast                      = ss_app_rx_mux_tlast;
        //assign ss_app_rx_tkeep                      = ss_app_rx_mux_tkeep[0];
        assign ss_app_rx_tuser_client               = ss_app_rx_mux_tuser_client;
        assign ss_app_rx_tuser_sts                  = ss_app_rx_mux_tuser_sts;
        assign ss_app_rx_tuser_sts_extended         = ss_app_rx_mux_tuser_sts_extended;
        assign ss_app_st_rx_tuser_last_segment      = ss_app_st_rx_mux_tuser_last_segment;
        assign ss_app_st_rx_tuser_pkt_seg_parity    = ss_app_st_rx_mux_tuser_pkt_seg_parity;
        assign ss_app_st_rx_tid                     = ss_app_st_rx_mux_tid;
      end else begin
      
        
        assign ss_app_rx_tvalid                     = ss_app_rx_mux_tvalid;
        assign ss_app_rx_tdata                      = ss_app_rx_mux_tdata;
        assign ss_app_rx_tlast                      = ss_app_rx_mux_tlast;
        //assign ss_app_rx_tkeep                      = ss_app_rx_mux_tkeep[0];
        assign ss_app_rx_tuser_client               = ss_app_rx_mux_tuser_client;
        assign ss_app_rx_tuser_sts                  = ss_app_rx_mux_tuser_sts;
        assign ss_app_rx_tuser_sts_extended         = ss_app_rx_mux_tuser_sts_extended;
        assign ss_app_st_rx_tuser_last_segment      = ss_app_st_rx_mux_tuser_last_segment;
        assign ss_app_st_rx_tuser_pkt_seg_parity    = ss_app_st_rx_mux_tuser_pkt_seg_parity;
        assign ss_app_st_rx_tid                     = ss_app_st_rx_mux_tid;
        assign ss_app_st_rxingrts0_tvalid           = ss_app_st_mux_rxingrts0_tvalid;
        assign ss_app_st_rxingrts1_tvalid           = ss_app_st_mux_rxingrts1_tvalid; 				
        assign ss_app_st_rxingrts0_tdata            = ss_app_st_mux_rxingrts0_tdata;
        assign ss_app_st_rxingrts1_tdata            = ss_app_st_mux_rxingrts1_tdata; 
				        
        
    end    

/////////////////////////////////////////////////////////////////    
   hssi_axist_to_avst_bridge_wrapper #(
      .NUM_CHANNELS         (NUM_CHANNELS), //100g=1 ch
      .TDATA_WIDTH          (DATA_WIDTH),
      .NO_OF_BYTES          (NO_OF_BYTES),
      .DATA_WIDTH           (AVST_DATA_WIDTH),
      .NUM_MAX_PORTS        (NUM_MAX_PORTS),
      .EMPTY_BITS           (EMPTY_BITS),
      .PORT_PROFILE         (PORT_PROFILE),
    //  .ENABLE_MULTI_STREAM (ENABLE_MULTI_STREAM),
      .NUM_OF_STREAM        (NUM_OF_STREAM),
      .TID                  (TID),
      .ST_READY_LATENCY     (PTP_TX_CLASSIFIER_ENABLE ? 4'd1 :  AXI_READY_LATENCY),
      .TILES                (Tiles),
      .PORT_CLIENT_IF       (PORT_CLIENT_IF),
      .PREAMBLE_PASS_TH_EN  (0),
      .DR_ENABLE            (0),
      .PKT_SEG_PARITY_EN    (PKT_SEG_PARITY_EN),
      .PKT_SEG_PARITY_WIDTH ((PORT_CLIENT_IF == 1)? NUM_MAX_PORTS : NUM_OF_SEG),
      .ENABLE_ECC           (ENABLE_ECC),
      .PKT_CYL              (PKT_CYL),
      .TX_TUSER_CLIENT_WIDTH         (TX_TUSER_CLIENT_WIDTH),
      .RX_TUSER_CLIENT_WIDTH         (RX_TUSER_CLIENT_WIDTH),
      .RX_TUSER_STATS_WIDTH          (RX_TUSER_STATS_WIDTH),
      .ASYNC_ADAPTERS_EN             (ASYNC_ADAPTERS_EN),
      .SIM_EMULATE      (SIM_EMULATE)
    ) U_st_bridge_instance (
      .i_tx_clk_p0                    (p0_app_ss_st_client_clk), 
      .i_tx_clk_p1                    (p1_app_ss_st_client_clk), 
      .i_tx_clk_p2                    (p2_app_ss_st_client_clk), 
      .i_tx_clk_p3                    (p3_app_ss_st_client_clk), 
      .i_rx_clk_p0                    (p0_app_ss_st_clk),
      .i_rx_clk_p1                    (p1_app_ss_st_clk),
      .i_rx_clk_p2                    (p2_app_ss_st_clk),
      .i_rx_clk_p3                    (p3_app_ss_st_clk),
      .i_tx_rst_n_p0                  (p0_app_ss_st_client_areset_n),
      .i_tx_rst_n_p1                  (p1_app_ss_st_client_areset_n),
      .i_tx_rst_n_p2                  (p2_app_ss_st_client_areset_n),
      .i_tx_rst_n_p3                  (p3_app_ss_st_client_areset_n),
      .i_rx_rst_n_p0                  (p0_app_ss_st_areset_n),
      .i_rx_rst_n_p1                  (p1_app_ss_st_areset_n),
      .i_rx_rst_n_p2                  (p2_app_ss_st_areset_n),
      .i_rx_rst_n_p3                  (p3_app_ss_st_areset_n),
      .i_profile_sel_reg              (i_profile_sel),
      .o_port_active_mask_reg         (o_port_active_mask_reg),
      .o_data_width                   (o_data_width),
      .o_speed_sel                    (o_speed_sel),
    //AXI Stream Tx, from User interface
      .o_axi_st_tx_tready             (ss_app_tx_mux_tready),
      .i_axi_st_tx_tvalid             (app_ss_tx_mux_tvalid),
      .i_axi_st_tx_tdata              (app_ss_tx_mux_tdata),
      .i_axi_st_tx_tlast              (app_ss_tx_mux_tlast),
      .i_axi_st_tx_tkeep              (app_ss_tx_mux_tkeep),
      .i_axi_st_tx_tuser_client       (app_ss_tx_mux_tuser_client),
      .i_axi_st_tx_tuser_ptp          (app_ss_tx_mux_tuser_ptp),
      .i_axi_st_tx_tuser_ptp_extended (app_ss_tx_mux_tuser_ptp_extended),  
  //-------------------------------------------------------------------------    
      .i_axi_st_tx_tlast_segment      (app_ss_st_tx_mux_tuser_last_segment),      
     // .i_axi_st_tx_tkeep_segment      (app_ss_st_tx_mux_tkeep_segment),      
        // Passed same value of tkeep to both tkeep & tkeep_segment to bridge. SEG is handled by bridge
           .i_axi_st_tx_tkeep_segment      (app_ss_tx_mux_tkeep),       
      .i_axi_st_tx_pkt_seg_parity     (app_ss_st_tx_mux_tuser_pkt_seg_parity),
  //-------------------------------------------------
      .i_axi_st_tx_tid                ('0),//app_ss_st_tx_mux_tid
      //AXI Stream Rx, to User interface
      .o_axi_st_rx_tvalid             (ss_app_rx_mux_tvalid),
      .o_axi_st_rx_tdata              (ss_app_rx_mux_tdata),
      .o_axi_st_rx_tlast              (ss_app_rx_mux_tlast),
      .o_axi_st_rx_tkeep              (axi_st_rx_mux_tkeep),
      .o_axi_st_rx_tuser_client       (ss_app_rx_mux_tuser_client),
      .o_axi_st_rx_tuser_sts          (ss_app_rx_mux_tuser_sts),
      .o_axi_st_rx_tuser_sts_extended (ss_app_rx_mux_tuser_sts_extended),
      .o_axi_st_rx_ingrts0_tvalid     (ss_app_st_mux_rxingrts0_tvalid),
      .o_axi_st_rx_ingrts1_tvalid     (ss_app_st_mux_rxingrts1_tvalid),
      .o_axi_st_rx_ingrts0_tdata      (ss_app_st_mux_rxingrts0_tdata),
      .o_axi_st_rx_ingrts1_tdata      (ss_app_st_mux_rxingrts1_tdata),
     //------------------------------------------- 
      .o_axi_st_rx_tlast_segment      (ss_app_st_rx_mux_tuser_last_segment),
      .o_axi_st_rx_tkeep_segment      (axi_st_rx_mux_tkeep_segment),//ss_app_st_rx_tkeep_segment,
      .o_axi_st_rx_pkt_seg_parity     (ss_app_st_rx_mux_tuser_pkt_seg_parity),
      .o_axi_st_rx_tid                (ss_app_st_rx_mux_tid),
     //----------------------------------------------  
      //Uncomment after DINKER adds
      //.o_axi_st_rx_ingrts1_tvalid     (ss_app_st_rxingrts1_tvalid),
      //.o_axi_st_rx_ingrts1_tdata      (ss_app_st_rxingrts1_tdata),
      //hac //MULTI PACKET COMPATIBLE SIGNALS    
      // o_axi_st_rx_tlast_segment(),
      // o_axi_st_rx_tkeep_segment()
    
    //hac MULTI PACKET COMPATIBLE SIGNALS    
      //i_axi_st_tx_tlast_segment (),
      //i_axi_st_tx_tkeep_segment(),
      //i_axi_st_tx_tuser_sts(),

      .o_tx_fifo_eccstatus         (tx_fifo_eccstatus),
      .o_axi_st_tx_parity_error    (axi_st_tx_parity_error),
      //MAC segemented
      .o_tx_mac_data                    (o_tx_mac_data       ),     
      .o_tx_mac_valid                   (o_tx_mac_valid      ),
      .o_tx_mac_inframe                 (o_tx_mac_inframe    ),
      .o_tx_mac_eop_empty               (o_tx_mac_eop_empty  ),
      .i_tx_mac_ready                   (i_tx_mac_ready      ),
      .o_tx_mac_error                   (o_tx_mac_error      ),
      .o_tx_mac_skip_crc                (o_tx_mac_skip_crc   ),
      .i_rx_mac_data                    (i_rx_mac_data       ),
      .i_rx_mac_valid                   (i_rx_mac_valid      ),
      .i_rx_mac_inframe                 (i_rx_mac_inframe    ),
      .i_rx_mac_eop_empty               (i_rx_mac_eop_empty  ),
      .i_rx_mac_error                   (i_rx_mac_error      ),
      .i_rx_mac_fcs_error               (i_rx_mac_fcs_error  ),
      .i_rx_mac_status                  (i_rx_mac_status     ),

    //tx_ptp avalon side
      .o_av_st_tx_ptp_ts_valid        (o_av_st_tx_ptp_ts_valid),
      .o_av_st_tx_ptp_ts_req          (o_av_st_tx_ptp_ts_req),
      .o_av_st_tx_ptp_ins_ets         (o_av_st_tx_ptp_ins_ets),
      .o_av_st_tx_ptp_fp              (o_av_st_tx_ptp_fp),
      .o_av_st_tx_ptp_ins_cf          (o_av_st_tx_ptp_ins_cf),
      .o_av_st_tx_ptp_tx_its          (o_av_st_tx_ptp_tx_its),
      .o_av_st_tx_ptp_asym_p2p_idx    (o_av_st_tx_ptp_asym_p2p_idx),
      .o_av_st_tx_ptp_asym_sign       (o_av_st_tx_ptp_asym_sign),
      .o_av_st_tx_ptp_asym            (o_av_st_tx_ptp_asym),
      .o_av_st_tx_ptp_p2p             (o_av_st_tx_ptp_p2p),
      //
      .o_av_st_tx_ptp_ts_format       (o_av_st_tx_ptp_ts_format), 
      .o_av_st_tx_ptp_update_eb       (o_av_st_tx_ptp_update_eb), 
      .o_av_st_tx_ptp_zero_csum       (o_av_st_tx_ptp_zero_csum), 
      .o_av_st_tx_ptp_eb_offset       (o_av_st_tx_ptp_eb_offset), 
      .o_av_st_tx_ptp_csum_offset     (o_av_st_tx_ptp_csum_offset), 
      .o_av_st_tx_ptp_cf_offset       (o_av_st_tx_ptp_cf_offset), 
      .o_av_st_tx_ptp_ts_offset       (o_av_st_tx_ptp_ts_offset), 
      .i_rx_avst_ptp_rx_its           (i_av_st_ptp_rx_its)  
    
    
    //Avalon Stream Tx, to EHIP/MAC interface
      //.i_av_st_tx_ready               (i_av_st_tx_ready),
      //.o_av_st_tx_valid               (o_av_st_tx_valid),
      //.o_av_st_tx_data                (o_av_st_tx_data),
      //.o_av_st_tx_startofpacket       (o_av_st_tx_startofpacket),
      //.o_av_st_tx_endofpacket         (o_av_st_tx_endofpacket),
      //.o_av_st_tx_empty               (o_av_st_tx_empty),
      //.o_av_st_tx_error               (o_av_st_tx_error),
      //.o_av_st_tx_skip_crc            (o_av_st_tx_skip_crc),
      ////hac //MAC_SEGMENTED COMPATIBLE SIGNALS    
      //.o_av_st_tx_inframe             (o_av_st_tx_inframe),
      //.o_av_st_tx_eop_empty           (o_av_st_tx_eop_empty),
      //.o_av_st_tx_mac_error           (o_av_st_tx_mac_error),
    //output reg  [MAC_STS-1:0]                  o_av_st_txstatus_data
    
    //Avalon Stream Rx, from EHIP/MAC interface
      //.i_av_st_rx_valid               (i_av_st_rx_valid),
      //.i_av_st_rx_data                (i_av_st_rx_data),
      //.i_av_st_rx_startofpacket       (i_av_st_rx_startofpacket),
      //.i_av_st_rx_endofpacket         (i_av_st_rx_endofpacket),
      //.i_av_st_rx_empty               (i_av_st_rx_empty),
      //.i_av_st_rx_error               (i_av_st_rx_error),
      //.i_av_st_rxstatus_data          (i_av_st_rxstatus_data),
      //.i_av_st_rxstatus_valid         (i_av_st_rxstatus_valid),
      
      ////hac  //MAC_SEGMENTED COMPATIBLE SIGNALS    
      //.i_av_st_rx_inframe             (i_av_st_rx_inframe),
      //.i_av_st_rx_eop_empty           (i_av_st_rx_eop_empty),
      //.i_av_st_rx_mac_error           (i_av_st_rx_mac_error),
      //.i_av_st_rx_fcs_error           (i_av_st_rx_fcs_error),
      //.i_av_st_rx_mac_status          (i_av_st_rx_mac_status),
      

    );



             assign ss_app_rx_tkeep =  axi_st_rx_mux_tkeep_segment;


hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(Max_No_of_ports*2),  .INIT_VALUE(0)
    ) U_ECC_STATUS_SYNC ( 
      .clk     (i_reconfig_clk),
      .reset   (1'b0),
      .d       (tx_fifo_eccstatus),
      .q       (o_tx_fifo_eccstatus)
    );

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(Max_No_of_ports),  .INIT_VALUE(0)
    ) U_PARITY_ERR_SYNC (
      .clk     (i_reconfig_clk),
      .reset   (1'b0),
      .d       (axi_st_tx_parity_error),
      .q       (o_axi_st_tx_parity_error)
    );

////////////////////////////////////////////////// hac
//    generate
//    for(i=0; i< NUM_CHANNELS; i=i+1)
//    begin : AXI_ST_2D_MUX
//      assign i_av_st_tx_ready[i]   = o_tx_ready[i];
//      assign i_tx_data[((i+1)*DATA_WIDTH)-1:(i*DATA_WIDTH)] = o_av_st_tx_data[i];
//      assign i_tx_empty[((i+1)*EMPTY_BITS)-1:(i*EMPTY_BITS)] = o_av_st_tx_empty[i];
//      assign i_tx_valid[i]         = o_av_st_tx_valid[i];
//     assign i_tx_startofpacket[i] = o_av_st_tx_startofpacket[i];
//      assign i_tx_endofpacket[i]   = o_av_st_tx_endofpacket[i];
//      assign i_tx_error[i]         = o_av_st_tx_error[i];
//      assign i_tx_skip_crc[i]      = o_av_st_tx_skip_crc[i];
//      //These Signals are 2 copies incase of F-tile, for E-tile LSB's are valid
//      assign i_ptp_ts_req[i]         = o_av_st_tx_ptp_ts_req[i][0];
//      assign i_ptp_ins_ets[i]        = o_av_st_tx_ptp_ins_ets[i][0];
//      assign i_ptp_fp[(i*8)+7:(i*8)] = o_av_st_tx_ptp_fp[i][7:0];
//      assign i_ptp_ins_cf[i]         = o_av_st_tx_ptp_ins_cf[i][0];
//      assign i_ptp_tx_its[(i*96)+95:(i*96)]       = o_av_st_tx_ptp_tx_its[i][95:0];
      //assign  = o_av_st_tx_ptp_ts_valid; //TBD
//      assign i_ptp_zero_csum[i]    = o_av_st_tx_ptp_zero_csum[i];
//      assign i_ptp_update_eb[i]    = o_av_st_tx_ptp_update_eb[i]; 
//      assign i_ptp_ts_format[i]    = o_av_st_tx_ptp_ts_format[i];
//      assign i_ptp_ts_offset[(i*16)+15:(i*16)]    = o_av_st_tx_ptp_ts_offset[i][15:0];
//      assign i_ptp_cf_offset[(i*16)+15:(i*16)]    = o_av_st_tx_ptp_cf_offset[i][15:0];
//      assign i_ptp_csum_offset[(i*16)+15:(i*16)]  = o_av_st_tx_ptp_csum_offset[i][15:0];
//      assign i_ptp_eb_offset[(i*16)+15:(i*16)]    = o_av_st_tx_ptp_eb_offset[i][15:0];
      //below are valid in F-tile only
      //assign  = o_av_st_tx_ptp_asym_p2p_idx;
      //assign  = o_av_st_tx_ptp_asym_sign;
      //assign  = o_av_st_tx_ptp_asym;
      //assign  = o_av_st_tx_ptp_p2p;
      //
     // assign i_av_st_rx_data[i][DATA_WIDTH-1:0]  = o_rx_data[((i+1)*DATA_WIDTH)-1:(i*DATA_WIDTH)];
     // assign i_av_st_rx_valid[i]                 = o_rx_valid[i];
     // assign i_av_st_rx_startofpacket[i]         = o_rx_startofpacket[i];
     // assign i_av_st_rx_endofpacket[i]           = o_rx_endofpacket[i];
     // assign i_av_st_rx_empty[i][EMPTY_BITS-1:0] = o_rx_empty[((i+1)*EMPTY_BITS)-1:(i*EMPTY_BITS)];
     // assign i_av_st_rx_error[i][5:0]            = o_rx_error[(i*6)+5:(i*6)];
     // assign i_av_st_rxstatus_data[i][39:0]      = o_rxstatus_data[(i*40)+39:(i*40)];
     // assign i_av_st_rxstatus_valid[i]           = o_rxstatus_valid[i];
//      assign i_av_st_ptp_rx_its[i][95:0]         = o_ptp_rx_its[(i*96)+95:(i*96)];
//      assign i_av_st_ptp_rx_its[i][95:0]         = 96'd0; 
//    end //end of for loop 
//    endgenerate
/////////////////////////////////////////////////////////////


////Synchronization of status signals to reconfig clock
//alt_xcvr_resync_std #(
//  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
//    ) cdr_lock_sync_inst (
//      .clk     (i_reconfig_clk),
//      .reset   (1'b0),
//      .d       (o_cdr_lock_int),
//      .q       (o_cdr_lock)
//    );
//
//alt_xcvr_resync_std #(
//  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
//    ) rx_block_lock_sync_inst (
//      .clk     (i_reconfig_clk),
//      .reset   (1'b0),
//      .d       (o_rx_block_lock_int),
//      .q       (o_rx_block_lock)
//    );
//
//alt_xcvr_resync_std #(
//  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
//    ) local_fault_sync_inst (
//      .clk     (i_reconfig_clk),
//      .reset   (1'b0),
//      .d       (o_local_fault_status_int),
//      .q       (o_local_fault_status)
//    );
//
//alt_xcvr_resync_std #(
//  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
//    ) remote_fault_sync_inst (
//      .clk     (i_reconfig_clk),
//      .reset   (1'b0),
//      .d       (o_remote_fault_status_int),
//      .q       (o_remote_fault_status)
//    );
//
//alt_xcvr_resync_std #(
//  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
//    ) rx_hi_ber_sync_inst (
//      .clk     (i_reconfig_clk),
//      .reset   (1'b0),
//      .d       (o_rx_hi_ber_int),
//      .q       (o_rx_hi_ber)
//    );
//
//alt_xcvr_resync_std #(
//  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
//    ) ehip_ready_sync_inst (
//      .clk     (i_reconfig_clk),
//      .reset   (1'b0),
//      .d       (o_ehip_ready_int),
//      .q       (o_ehip_ready)
//    );

//////////////////////////////////////////////// hac

//alt_xcvr_resync_std #(
//  .SYNC_CHAIN_LENGTH(3),    .WIDTH(7),  .INIT_VALUE(0)
//    ) link_sts_sync (
//      .clk     (i_reconfig_clk),
//      .reset   (1'b0),
//      .d       ({o_cdr_lock_int,o_rx_block_lock_int,o_local_fault_status_int,o_remote_fault_status_int,o_rx_hi_ber_int,o_ehip_ready_int}),
//      .q       ({o_cdr_lock,o_rx_block_lock,o_local_fault_status,o_remote_fault_status,o_rx_hi_ber,o_ehip_ready})
//    );
//
///////////////////////////////////////////////////


//    assign o_rx_am_lock = {NUM_CHANNELS{1'b0}};
//
//    assign o_rx_pcs_fully_aligned = 'd0;
//
//    assign o_xcvr_ready_int = o_tx_pll_locked; //alt_ehipc3_fm_0.alt_ehipc3_fm_top_p0.sl_tx_transfer_ready[NUM_XCVR_CHANNELS-1:0];
//
//alt_xcvr_resync_std #(
//  .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
//    ) xcvr_ready_sync_inst (
//      .clk     (i_reconfig_clk),
//      .reset   (1'b0),
//      .d       (o_xcvr_ready_int),
//      .q       (o_xcvr_ready)
//    );
//
//generate
//for(i=0; i< NUM_CHANNELS; i=i+1)
//begin : LINK_STS
//
//alt_xcvr_resync_std #(
//  .SYNC_CHAIN_LENGTH(3),    .WIDTH(3),  .INIT_VALUE(0)
//    ) link_sts_sync (
//      .clk     (i_reconfig_clk),
//      .reset   (1'b0),
//      .d       ({o_rx_pcs_ready[i], o_tx_lanes_stable[i], o_tx_pll_locked[i]}),
//      .q       (o_link_status[i])
//    );
//end
//endgenerate


endmodule

