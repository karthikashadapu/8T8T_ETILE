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
// Module            : hssi_ss_f_cntrl_path_wrapper.sv
// Description       : 
// Author            : 
// Created           : 
// Changes           : This is a wrapper for file for control path modules, instantiates the 
//                   : 1. axi lite bridge 
//                   : 2. SS CSR module 
//                   : 3. NIOS/SAL DR module 
//                   : 4. Internal JTAG module 
//                   : 5. Glue logic related to csr and reconfig interfaces

// ==========================================================================
// synthesis translate_off

`timescale 1ns / 1ps
// synthesis translate_on
(* altera_attribute = "-name UNCONNECTED_OUTPUT_PORT_MESSAGE_LEVEL OFF" *)

// ==========================================================================
// Module Declaration
// ==========================================================================























module hssi_ss_f_cntrl_path_wrapper_4nezbiy 
#(
// -----------------------------------------------------
// Parameters Name              = Default  //Description
// -----------------------------------------------------
//  HSSI SS top level parameters
    parameter PORT0_ENABLED      	        = 0,
    parameter PORT0_PROFILE                = "10GbE",
    parameter PORT0_SUB_PROFILE            = "MAC+PCS",
    parameter PORT0_RSFEC        	        = 0,
    parameter PORT0_PTP          	        = 0,
    parameter [3:0] PORT0_READY_LATENCY    = 4'h0,
    parameter PORT0_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT0_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT0_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT1_ENABLED      	        = 0,
    parameter PORT1_PROFILE                = "10GbE",
    parameter PORT1_SUB_PROFILE            = "MAC+PCS",
    parameter PORT1_RSFEC        	        = 0,
    parameter PORT1_PTP          	        = 0,
    parameter [3:0] PORT1_READY_LATENCY    = 4'h0,
    parameter PORT1_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT1_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT1_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT2_ENABLED      	        = 0,
    parameter PORT2_PROFILE                = "10GbE",
    parameter PORT2_SUB_PROFILE            = "MAC+PCS",
    parameter PORT2_RSFEC        	        = 0,
    parameter PORT2_PTP          	        = 0,
    parameter [3:0] PORT2_READY_LATENCY    = 4'h0,
    parameter PORT2_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT2_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT2_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT3_ENABLED      	        = 0,
    parameter PORT3_PROFILE                = "10GbE",
    parameter PORT3_SUB_PROFILE            = "MAC+PCS",
    parameter PORT3_RSFEC        	        = 0,
    parameter PORT3_PTP          	        = 0,
    parameter [3:0] PORT3_READY_LATENCY    = 4'h0,
    parameter PORT3_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT3_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT3_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT4_ENABLED      	        = 0,
    parameter PORT4_PROFILE                = "10GbE",
    parameter PORT4_SUB_PROFILE            = "MAC+PCS",
    parameter PORT4_RSFEC        	        = 0,
    parameter PORT4_PTP          	        = 0,
    parameter [3:0] PORT4_READY_LATENCY    = 4'h0,
    parameter PORT4_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT4_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT4_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT5_ENABLED      	        = 0,
    parameter PORT5_PROFILE                = "10GbE",
    parameter PORT5_SUB_PROFILE            = "MAC+PCS",
    parameter PORT5_RSFEC        	        = 0,
    parameter PORT5_PTP          	        = 0,
    parameter [3:0] PORT5_READY_LATENCY    = 4'h0,
    parameter PORT5_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT5_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT5_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT6_ENABLED      	        = 0,
    parameter PORT6_PROFILE                = "10GbE",
    parameter PORT6_SUB_PROFILE            = "MAC+PCS",
    parameter PORT6_RSFEC        	        = 0,
    parameter PORT6_PTP          	        = 0,
    parameter [3:0] PORT6_READY_LATENCY    = 4'h0,
    parameter PORT6_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT6_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT6_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT7_ENABLED      	        = 0,
    parameter PORT7_PROFILE                = "10GbE",
    parameter PORT7_SUB_PROFILE            = "MAC+PCS",
    parameter PORT7_RSFEC        	        = 0,
    parameter PORT7_PTP          	        = 0,
    parameter [3:0] PORT7_READY_LATENCY    = 4'h0,
    parameter PORT7_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT7_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT7_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT8_ENABLED      	        = 0,
    parameter PORT8_PROFILE                = "10GbE",
    parameter PORT8_SUB_PROFILE            = "MAC+PCS",
    parameter PORT8_RSFEC        	        = 0,
    parameter PORT8_PTP          	        = 0,
    parameter [3:0] PORT8_READY_LATENCY    = 4'h0,
    parameter PORT8_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT8_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT8_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT9_ENABLED      	        = 0,
    parameter PORT9_PROFILE                = "10GbE",
    parameter PORT9_SUB_PROFILE            = "MAC+PCS",
    parameter PORT9_RSFEC        	        = 0,
    parameter PORT9_PTP          	        = 0,
    parameter [3:0] PORT9_READY_LATENCY    = 4'h0,
    parameter PORT9_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT9_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT9_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT10_ENABLED      	        = 0,
    parameter PORT10_PROFILE                = "10GbE",
    parameter PORT10_SUB_PROFILE            = "MAC+PCS",
    parameter PORT10_RSFEC        	        = 0,
    parameter PORT10_PTP          	        = 0,
    parameter [3:0] PORT10_READY_LATENCY    = 4'h0,
    parameter PORT10_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT10_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT10_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT11_ENABLED      	        = 0,
    parameter PORT11_PROFILE                = "10GbE",
    parameter PORT11_SUB_PROFILE            = "MAC+PCS",
    parameter PORT11_RSFEC        	        = 0,
    parameter PORT11_PTP          	        = 0,
    parameter [3:0] PORT11_READY_LATENCY    = 4'h0,
    parameter PORT11_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT11_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT11_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT12_ENABLED      	        = 0,
    parameter PORT12_PROFILE                = "10GbE",
    parameter PORT12_SUB_PROFILE            = "MAC+PCS",
    parameter PORT12_RSFEC        	        = 0,
    parameter PORT12_PTP          	        = 0,
    parameter [3:0] PORT12_READY_LATENCY    = 4'h0,
    parameter PORT12_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT12_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT12_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT13_ENABLED      	        = 0,
    parameter PORT13_PROFILE                = "10GbE",
    parameter PORT13_SUB_PROFILE            = "MAC+PCS",
    parameter PORT13_RSFEC        	        = 0,
    parameter PORT13_PTP          	        = 0,
    parameter [3:0] PORT13_READY_LATENCY    = 4'h0,
    parameter PORT13_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT13_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT13_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT14_ENABLED      	        = 0,
    parameter PORT14_PROFILE                = "10GbE",
    parameter PORT14_SUB_PROFILE            = "MAC+PCS",
    parameter PORT14_RSFEC        	        = 0,
    parameter PORT14_PTP          	        = 0,
    parameter [3:0] PORT14_READY_LATENCY    = 4'h0,
    parameter PORT14_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT14_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT14_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT15_ENABLED      	        = 0,
    parameter PORT15_PROFILE                = "10GbE",
    parameter PORT15_SUB_PROFILE            = "MAC+PCS",
    parameter PORT15_RSFEC        	        = 0,
    parameter PORT15_PTP          	        = 0,
    parameter [3:0] PORT15_READY_LATENCY    = 4'h0,
    parameter PORT15_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT15_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT15_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT16_ENABLED      	        = 0,
    parameter PORT16_PROFILE                = "10GbE",
    parameter PORT16_SUB_PROFILE            = "MAC+PCS",
    parameter PORT16_RSFEC        	        = 0,
    parameter PORT16_PTP          	        = 0,
    parameter [3:0] PORT16_READY_LATENCY    = 4'h0,
    parameter PORT16_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT16_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT16_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT17_ENABLED      	        = 0,
    parameter PORT17_PROFILE                = "10GbE",
    parameter PORT17_SUB_PROFILE            = "MAC+PCS",
    parameter PORT17_RSFEC        	        = 0,
    parameter PORT17_PTP          	        = 0,
    parameter [3:0] PORT17_READY_LATENCY    = 4'h0,
    parameter PORT17_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT17_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT17_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT18_ENABLED      	        = 0,
    parameter PORT18_PROFILE                = "10GbE",
    parameter PORT18_SUB_PROFILE            = "MAC+PCS",
    parameter PORT18_RSFEC        	        = 0,
    parameter PORT18_PTP          	        = 0,
    parameter [3:0] PORT18_READY_LATENCY    = 4'h0,
    parameter PORT18_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT18_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT18_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter PORT19_ENABLED      	        = 0,
    parameter PORT19_PROFILE                = "10GbE",
    parameter PORT19_SUB_PROFILE            = "MAC+PCS",
    parameter PORT19_RSFEC        	        = 0,
    parameter PORT19_PTP          	        = 0,
    parameter [3:0] PORT19_READY_LATENCY    = 4'h0,
    parameter PORT19_DR_EXT_SUBSYS	        = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
    parameter PORT19_PR_DR_ENABLE    	      = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
    parameter PORT19_LOW_SPEED_ETH          = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter tiles	                                = "E",     //FPGA tiles. Supported keyword "E", "H", F". Grey out if DM/DM2 (eASIC) and A10 are selected as product
    parameter NUM_PORTS                             = 5'h8,    //Number of Ethernet ports, Enabled+Disabled, within the subsystem. Supported value 1-16. 
    parameter [4:0] NUM_ENABLED_PORTS               = 5'h8,    //Number of Enabled Ethernet ports within the subsystem. Supported value 1-16. 
    parameter ENABLE_JTAG                           = 0,       //Indicate the JTAG master instantiation. 0 - Disable, 1 - Enable
    parameter PARAM_DATA                            = 32,      //AXI-Lite Data Width
    parameter SWITCH_EXT_SUBSYS                     = 0,       //Indicate presence of L2 Switch Extension Subsystem presence. Supported value 0-1.
    parameter [0:0]  SET_AXI_LITE_RESPONSE_TO_ZERO  = 1'b0,
    parameter [7:0]  DFHv0_FEA_VER                  = 8'h01,
    parameter [3:0]  DFHv0_FEA_MINOR                = 4'h0,
    parameter [0:0]  DFHv0_FEA_EOL                  = 1'b0,
    parameter [23:0] DFHv0_FEA_NXT                  = 24'h001000,
    parameter [3:0]  DFHv0_FEA_REV                  = 4'h1,
    parameter [11:0] DFHv0_FEA_FEAID                = 12'h015,
    parameter [3:0]  DFHv0_FEA_FEATYPE              = 4'h3,
    parameter [15:0] DFHv1_INSTID                   = 16'h0000,
    parameter MAJOR_VERSION                         = 16'h0002,
    parameter MINOR_VERSION                         = 8'h00,
    parameter DISABLE_DR_CPU                        = 0,
    parameter SIM_MODE                              = 0,
    parameter SIM_FAST_EN                           = 0,
    parameter ENABLE_DUMMY_WAIT_REQ_GEN             = 1'b1, 
    parameter HUNG_WAIT_TIME                        = 32'd1250000
    )(
  // ---------------
  // Clock Interface
  // --------------- 
  input                           app_ss_lite_clk, //set as clock type in tcl
  // ---------------
  // Reset Interface
  // --------------- 
  input                           i_axi_lite_bridge_rst_n,
  input                           i_ss_csr_rst_n,  
  input                           i_ss_nios_rst_n,  
  // --------------------------------------------------------------
  // AXI Lite Control path Interface (one control interface for all
  // PORTS/Channels
  // --------------------------------------------------------------
  // -- Input Write Address Channel  
  input  [25:0]                   app_ss_lite_awaddr,
  input  [2:0]                    app_ss_lite_awprot,
  input                           app_ss_lite_awvalid,
  output                          ss_app_lite_awready,

  // -- Input Write Data Channel
  input  [PARAM_DATA-1:0]         app_ss_lite_wdata,
  input  [PARAM_DATA/8-1:0]       app_ss_lite_wstrb,
  input                           app_ss_lite_wvalid,
  output                          ss_app_lite_wready,

  // -- Output Write REsponse Channel
  output [1:0]                    ss_app_lite_bresp,
  output                          ss_app_lite_bvalid,
  input                           app_ss_lite_bready,

  // -- Input Read Address Channel
  input  [25:0]                   app_ss_lite_araddr,
  input  [2:0]                    app_ss_lite_arprot,
  input                           app_ss_lite_arvalid,
  output                          ss_app_lite_arready,
  // -- Output Read Data Channel
  input                           app_ss_lite_rready,
  output [PARAM_DATA-1:0]         ss_app_lite_rdata,
  output                          ss_app_lite_rvalid,
  output [1:0]                    ss_app_lite_rresp,
  // -----------------------------------------
  // -----------------------------------------
          //EHIP eth reconfig AVMM
  output [13:0]                   o_p0_eth_reconfig_address,
  output                          o_p0_eth_reconfig_read,
  output                          o_p0_eth_reconfig_write,
  input                           i_p0_eth_reconfig_waitrequest,
  input                           i_p0_eth_reconfig_readdatavalid,
  output [3:0]                    o_p0_eth_reconfig_byteenable,
  input  [31:0]                   i_p0_eth_reconfig_readdata,
  output [31:0]                   o_p0_eth_reconfig_writedata,

          //EHIP XCVR AVMM reconfig
  output [17:0]                   o_p0_c0_xcvr_reconfig_address,
  output                          o_p0_c0_xcvr_reconfig_read,
  output                          o_p0_c0_xcvr_reconfig_write,
  input                           i_p0_c0_xcvr_reconfig_waitrequest,
  input                           i_p0_c0_xcvr_reconfig_readdatavalid,
  output [3:0]                    o_p0_c0_xcvr_reconfig_byteenable,
  input  [31:0]                   i_p0_c0_xcvr_reconfig_readdata,
  output [31:0]                   o_p0_c0_xcvr_reconfig_writedata,

  //PTP TX classifier reconfig interface

  input                           i_dr_in_progress,
//PFC reconfig interface
//Reconfig interface to PTP tile adaptor
  output [16:0]                   o_ptp_asym_reconfig_address,
  output                          o_ptp_asym_reconfig_read,
  output                          o_ptp_asym_reconfig_write,
  input                           i_ptp_asym_reconfig_waitrequest,
  input                           i_ptp_asym_reconfig_readdatavalid,
  output [3:0]                    o_ptp_asym_reconfig_byteenable,
  input  [31:0]                   i_ptp_asym_reconfig_readdata,
  output [31:0]                   o_ptp_asym_reconfig_writedata,
  //Reconfig interface to PTP tile adaptor
  output [16:0]                   o_ptp_p2p_reconfig_address,
  output                          o_ptp_p2p_reconfig_read,
  output                          o_ptp_p2p_reconfig_write,
  input                           i_ptp_p2p_reconfig_waitrequest,
  input                           i_ptp_p2p_reconfig_readdatavalid,
  output [3:0]                    o_ptp_p2p_reconfig_byteenable,
  input  [31:0]                   i_ptp_p2p_reconfig_readdata,
  output [31:0]                   o_ptp_p2p_reconfig_writedata,
  // -----------------------------------------
  //          SS CSR module signals 
  // -----------------------------------------
  //EHIP output status signals connected to CSR
  input                           i_p0_rx_block_lock,
  input                           i_p0_rx_am_lock,
  input                           i_p0_local_fault_status,
  input                           i_p0_remote_fault_status,
  input                           i_p0_rx_hi_ber,
  input                           i_p0_ehip_ready,
  input                           i_p0_cdr_lock,
  input [2:0]                     i_p0_link_status,

  input [2-1:0]                   i_p0_tx_fifo_eccstatus,      
  input                           i_p0_axi_st_tx_parity_error,
//-----------------------------------------------------------------------
  //LED debug control/status signals
  output [5:0]                    o_csr_led_override_port,
  output                          o_csr_led_override_en,
  output [7:0]                    o_csr_led_pulse_cntr,
  output [2:0]                    o_csr_led_status,
  output [2:0]                    o_csr_led_speed,
  input  [20-1:0][7:0]    i_hotplug_status_all,
  output [31:0]                   o_hotplug_control,
  // -----------------------------------------
  //              NIOS/SAL module signals
  // -----------------------------------------
  output                                    o_po_pma_cal_done,
  input  [20-1:0]                   i_xcvr_ready,
  input  [20-1:0]                   i_tx_pma_ready,
  input  [20-1:0]                   i_rx_pma_ready,
  output [20-1:0]                   o_hotplug_disable_fm,
  input  [20-1:0]                   i_hotplug_paused_fm,

  input [19:0]                    i_p0_port_params,
  output                          o_p0_ereset_n,
  output                          o_p0_pio_axi_st_bridge_rst_n,
  output                          o_p0_pio_ehip_tx_rst_n,
  output                          o_p0_pio_ehip_rx_rst_n,
  input                           i_p0_ehip_tx_rst_ack_n,
  input                           i_p0_ehip_rx_rst_ack_n,
  input [19:0]                    i_p1_port_params,
  input [19:0]                    i_p2_port_params,
  input [19:0]                    i_p3_port_params,
  input [19:0]                    i_p4_port_params,
  input [19:0]                    i_p5_port_params,
  input [19:0]                    i_p6_port_params,
  input [19:0]                    i_p7_port_params,
  input [19:0]                    i_p8_port_params,
  input [19:0]                    i_p9_port_params,
  input [19:0]                    i_p10_port_params,
  input [19:0]                    i_p11_port_params,
  input [19:0]                    i_p12_port_params,
  input [19:0]                    i_p13_port_params,
  input [19:0]                    i_p14_port_params,
  input [19:0]                    i_p15_port_params,
  input [19:0]                    i_p16_port_params,
  input [19:0]                    i_p17_port_params,
  input [19:0]                    i_p18_port_params,
  input [19:0]                    i_p19_port_params,
  output tp //dummy
);

//[31:16]
localparam [15:0] DFHv0_FEA_NXT_LO  = (DFHv0_FEA_NXT & 16'hFFFF);
//[39:32]
localparam [7:0] DFHv0_FEA_NXT_HI   = (DFHv0_FEA_NXT >> 16) & (8'hFF);
// =========================================================================

     wire anlt_dummy_port_en; 
     wire anlt_read_write_en; 
     reg  anlt_read_write_en_d1;  
     reg  anlt_read_write_en_d2;   
     reg  anlt_read_write_en_d3;   
     reg  anlt_dummy_waitrequest;  
     reg  anlt_dummy_readdatavalid;
     wire ecc_event;


// ==========================================================================
// Logic port declaration for AXI4 Bridge  
// ==========================================================================
 
    logic                         po_pma_cal_done;
    wire                          axi_lite_bridge_rst_n;        // AXI Lite bridge Reset, Active Low
    wire                          ss_app_lite_arready_brdige;
    wire                          ss_app_lite_awready_brdige;
    wire                          ss_app_lite_wready_brdige;
    wire [1:0]                    ss_app_lite_bresp_bridge;
    wire                          ss_app_lite_bvalid_bridge;
    wire [1:0]                    ss_app_lite_rresp_bridge;
    wire [PARAM_DATA-1:0]         ss_app_lite_rdata_bridge;
    wire                          ss_app_lite_rvalid_bridge;
    reg                           axi_lite_ready_en;
    reg  [31:0]                   axi_lite_rd_hung_cntr;
    reg  [31:0]                   axi_lite_wr_hung_cntr;
    reg                           axi_lite_wr_pending, axi_lite_rd_pending;
    reg                           axi_lite_rd_hung_det, axi_lite_wr_hung_det;
    reg                           axi_lite_hung_rst_n;
    reg                           axi_lite_hung_rvalid, axi_lite_hung_bvalid;
    reg                           axi_lite_rresp_sent, axi_lite_bresp_sent;
    reg  [1:0]                    axi_lite_rd_resp_pending_cntr;

    wire [9:0]                    ss_reconfig_address;
    wire                          ss_reconfig_read;
    wire                          ss_reconfig_write;
    reg                           ss_reconfig_waitrequest;
    wire                          ss_reconfig_readdatavalid;
    wire [31:0]                   ss_reconfig_readdata;
    wire [3:0]                    ss_reconfig_byteenable;
    wire [31:0]                   ss_reconfig_writedata;

    reg  [2:0]                    ss_reconfig_wait_cntr;
    reg                           ss_reconfig_readdatavalid_tmp;
    wire [20-1:0]         port_enable;

    // JTAG Master
    wire [25:0]                   jtag_addr;
    wire                          jtag_read;
    reg  [31:0]                   jtag_readdata_tmp;
    wire [31:0]                   jtag_readdata;
    wire                          jtag_write;
    wire [31:0]                   jtag_writedata_tmp;
    reg  [31:0]                   jtag_writedata;
    wire                          jtag_waitrequest;
    wire                          jtag_readdata_valid;
    wire [31:0]                   av_addr;
    wire [3:0]                    jtag_byteenable_tmp; 
    wire [3:0]                    jtag_byteenable; 
    // NIOS CPU Master
    wire [25:0]                   cpu_reconfig_addr;
    reg  [25:0]                   cpu_reconfig_addr_reg;
    wire                          cpu_reconfig_read;
    reg                           cpu_reconfig_read_reg;
    wire [31:0]                   cpu_reconfig_readdata;
    reg  [31:0]                   cpu_reconfig_readdata_reg;
    wire                          cpu_reconfig_write;
    reg                           cpu_reconfig_write_reg;
    wire [31:0]                   cpu_reconfig_writedata;
    reg  [31:0]                   cpu_reconfig_writedata_reg;
    wire [3:0]                    cpu_reconfig_byteenable;
    reg  [3:0]                    cpu_reconfig_byteenable_reg;
    wire                          cpu_reconfig_waitrequest;
    reg                           cpu_reconfig_waitrequest_reg;
    wire                          cpu_reconfig_readdata_valid;
    reg                           cpu_reconfig_readdata_valid_reg;

    wire [14:0]                   anlt_reconfig_address;
    reg  [14:0]                   anlt_reconfig_address_d1;
    wire                          anlt_reconfig_read;
    wire [31:0]                   anlt_reconfig_readdata;
    wire                          anlt_reconfig_write;
    wire [31:0]                   anlt_reconfig_writedata;
    wire [3:0]                    anlt_reconfig_byteenable;
    wire                          anlt_reconfig_waitrequest;
    wire                          anlt_reconfig_readdata_valid;

    wire [20-1:0]         anlt_reconfig_waitrequest_temp;
    wire [20-1:0]         anlt_reconfig_readdatavalid_temp;
    wire [20:0][31:0]     anlt_reconfig_readdata_temp;


 		wire [15:0]                   p0_eth_reconfig_address;
  	wire [19:0]                   p0_c0_xcvr_reconfig_address;

    wire  [20-1:0]        load_recipe_error;
    wire  [20-1:0]        xcvr_cal_error;
    wire  [7:0]                   hotplug_status;

    wire  [31:0]                  cpu_reconfig_readdata_nios;
	  logic                         nios_cpu_rd_wr_hung_det;
	  logic                         nios_cpu_rd_wr_hung_det_d1, nios_cpu_rd_wr_hung_det_d2;
	  logic                         nios_cpu_hung_readdata_valid;
	  logic                         nios_cpu_hung_waitrequest;
	  logic                         nios_cpu_rd_wr_pending;
    logic [31:0]                  nios_cpu_rd_wr_hung_cntr;
    wire                          nios_command_start;
    reg                           nios_command_start_r;
    reg                           nios_hung_error;

    wire                          nios_command_complete;
    reg                           nios_command_complete_d1;
    reg                           nios_command_complete_d2;

    wire                          sscsrif_hssi_cmd_sts_read_command;
    wire                          sscsrif_hssi_cmd_sts_write_command;
    wire [1:0]                    sscsrif_hssi_cmd_sts_xcvr_reg_byte_no;
    wire [7:0]                    sscsrif_hssi_ctrl_addr_sal_command;
    wire [7:0]                    sscsrif_hssi_ctrl_addr_port_addr;
    wire [15:0]                   sscsrif_hssi_ctrl_addr_addr_msb;
    wire [31:0]                   sscsrif_hssi_rd_data_write_data_i;
    wire [31:0]                   sscsrif_hssi_wr_data_write_data;
    wire                          sscsrif_hssi_tse_ctrl_Magic_sleep_n;
    reg                           sscsrif_hssi_cmd_sts_read_command_d1;
    reg                           sscsrif_hssi_cmd_sts_read_command_d2;
    reg                           sscsrif_hssi_cmd_sts_read_command_pos_edge;
    reg                           sscsrif_hssi_cmd_sts_write_command_d1;
    reg                           sscsrif_hssi_cmd_sts_write_command_d2;
    reg                           sscsrif_hssi_cmd_sts_write_command_pos_edge;
    wire                          nios_command_error;
    reg                           nios_command_complete_ack;
    wire                          sscsrif_hssi_cmd_sts_ack_trans;
    reg                           sscsrif_hssi_cmd_sts_busy_i;
    reg                           rd_or_wr_pend_for_nios;
    reg                           sscsrif_hssi_cmd_sts_error_i;
    reg                           sscsrif_hssi_cmd_sts_ack_trans_hwset;
    
    wire                          sscsrif_hssi_eth_port0_status_link_fault_gen_en_i;
    wire                          sscsrif_hssi_eth_port0_status_unidirectional_en_i;
    wire                          sscsrif_hssi_eth_port0_status_unidirectional_force_remote_fault_i;
    wire                          sscsrif_hssi_eth_port0_status_unidirectional_remote_fault_dis_i;
    wire [1:0]                    sscsrif_hssi_eth_port0_status_pcs_eccstatus_i;
    wire [1:0]                    sscsrif_hssi_eth_port0_status_mac_eccstatus_i;
    wire                          sscsrif_hssi_eth_port0_status_set_10_i;
    wire                          sscsrif_hssi_eth_port0_status_set_1000_i;
    wire                          sscsrif_hssi_eth_port0_status_ena_10_i;
    wire                          sscsrif_hssi_eth_port0_status_eth_mode_i;

    reg                           rd_one_cmd_only_accept;
    reg                           wr_one_cmd_only_accept;
    reg                           app_ss_lite_awvalid_reg;
    reg                           app_ss_lite_arvalid_reg;
    reg                           ss_app_lite_bvalid_reg;
    reg                           ss_app_lite_rvalid_reg;

    reg                           cpu_rd_cmd_ack_pend;
    reg                           cpu_reconfig_read_q;
    reg                           cpu_reconfig_write_q;
    reg                           cpu_wr_cmd_ack_pend;
  
//***************************************************************************************************
//*************************************** JTAG AVMM IF  ******************************************
//***************************************************************************************************

generate
if (ENABLE_JTAG)
begin : GEN_JTAG_AVMM

    //assign jtag_addr = av_addr[27:0]; //no need to shift offset address
    assign jtag_addr = av_addr[25:0]; //no needto shift offset address
    //this is to make same with axi lite interface and ehip internal jtag

    hssi_ss_jtag_int jtag_master_hssi_ss (
        .clk_clk                (app_ss_lite_clk),
        .clk_reset_reset        (~axi_lite_bridge_rst_n),
        .master_address         (av_addr),
        .master_readdata        (jtag_readdata_tmp),
        .master_read            (jtag_read),
        .master_write           (jtag_write),
        .master_writedata       (jtag_writedata_tmp),
        .master_waitrequest     (jtag_waitrequest),
        .master_readdatavalid   (jtag_readdata_valid),
        .master_byteenable      (jtag_byteenable),
        .master_reset_reset     ()
    );


    //As address is shifted, all address are word aligned (not byte wise) 
    //shifting data and byte enable as address is shifted 
    //assign jtag_byteenable   = (jtag_byteenable_tmp << jtag_addr[1:0]);
    always_comb
    begin
      case(jtag_addr[1:0])
        2'b01 : jtag_writedata[31:0]   <= {jtag_writedata_tmp[31:16], jtag_writedata_tmp[7:0], 8'd0};
        2'b10 : jtag_writedata[31:0]   <= {jtag_writedata_tmp[31:24], jtag_writedata_tmp[7:0], 16'd0};
        2'b11 : jtag_writedata[31:0]   <= {jtag_writedata_tmp[7:0], 24'd0};
        default : jtag_writedata[31:0] <= jtag_writedata_tmp[31:0];
      endcase
    end

    always_comb
    begin
      case(jtag_addr[1:0])
        2'b01 : jtag_readdata_tmp[31:0]   <= {24'd0, jtag_readdata[15:8]};
        2'b10 : jtag_readdata_tmp[31:0]   <= {24'd0, jtag_readdata[23:16]};
        2'b11 : jtag_readdata_tmp[31:0]   <= {24'd0, jtag_readdata[31:24]};
        default : jtag_readdata_tmp[31:0] <= jtag_readdata[31:0];
      endcase
    end

    //assign jtag_writedata    = (jtag_writedata_tmp << (jtag_addr[1:0] << 3));
    //assign jtag_readdata_tmp = (jtag_readdata >> (jtag_addr[1:0] << 3));
end
endgenerate


//***************************************************************************************************
//*************************************** AXI4 Lite Bridge ******************************************
//***************************************************************************************************

//holding the axi lite read and write ready till the nios comes-up and executes the PMA adapatation in HW mode
//PMA adaptation is not executed in simulation so ready signals are released immediatley after reset w/o waiting for NIOS to come-up
generate
if (SIM_MODE == 1)
begin
always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
begin
  if(~axi_lite_bridge_rst_n)
    axi_lite_ready_en <= 1'b0;
  else if(axi_lite_rd_hung_det | axi_lite_wr_hung_det | nios_cpu_rd_wr_hung_det)
    axi_lite_ready_en <= 1'b0;
  else
    axi_lite_ready_en <= 1'b1;
end
end
else
begin
  always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
  begin
    if(~axi_lite_bridge_rst_n)
      axi_lite_ready_en <= 1'b0;
    else if(axi_lite_rd_hung_det | axi_lite_wr_hung_det | nios_cpu_rd_wr_hung_det)
      axi_lite_ready_en <= 1'b0;
    else if(nios_command_complete_d2) //TBD
      axi_lite_ready_en <= 1'b1;
    else
      axi_lite_ready_en <= axi_lite_ready_en; 
  end
end
endgenerate

//on reset assertion bridge is not making ready signals low, due to this access is failing (delay due to reset sync module)
//so making ready low on reset
assign ss_app_lite_arready = ss_app_lite_arready_brdige && axi_lite_ready_en && rd_one_cmd_only_accept;
assign ss_app_lite_awready = ss_app_lite_awready_brdige && axi_lite_ready_en && wr_one_cmd_only_accept;
assign ss_app_lite_wready  = ss_app_lite_wready_brdige  && axi_lite_ready_en && wr_one_cmd_only_accept;
//
//assign rd_hung_cntr_increment = ss_app_lite_arready_brdige && ~rd_one_cmd_only_accept;
//assign wr_hung_cntr_increment = ss_app_lite_awready_brdige && ~wr_one_cmd_only_accept;

  always @(posedge app_ss_lite_clk)
  begin
    app_ss_lite_awvalid_reg <= app_ss_lite_awvalid; //ss_app_lite_awready_brdige;
		app_ss_lite_arvalid_reg <= app_ss_lite_arvalid;
		ss_app_lite_bvalid_reg <= ss_app_lite_bvalid;
		ss_app_lite_rvalid_reg <= ss_app_lite_rvalid;
  end

  always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
  begin
    if(~axi_lite_bridge_rst_n)
       wr_one_cmd_only_accept <= 1'b1;
    else begin 
			if(app_ss_lite_awvalid && ss_app_lite_awready) //~app_ss_lite_awvalid_reg)
         wr_one_cmd_only_accept <= 1'b0;
      if(ss_app_lite_bvalid && ~ss_app_lite_bvalid_reg)
         wr_one_cmd_only_accept <= 1'b1;
    end
  end

  always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
  begin
    if(~axi_lite_bridge_rst_n)
       rd_one_cmd_only_accept <= 1'b1;
    else begin
       if(app_ss_lite_arvalid && ss_app_lite_arready)  //app_ss_lite_arvalid_reg)
          rd_one_cmd_only_accept <= 1'b0;
       if(ss_app_lite_rvalid && ~ss_app_lite_rvalid_reg)
          rd_one_cmd_only_accept <= 1'b1;
    end
  end

  always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
  begin
    if(~axi_lite_bridge_rst_n) begin
      rd_or_wr_pend_for_nios <= 1'b0;
    end else if(nios_command_start) begin
      rd_or_wr_pend_for_nios <= 1'b1;
    end else if(nios_command_complete_d1 && ~nios_command_complete_d2) begin
      rd_or_wr_pend_for_nios <= 1'b0;
    end
    //else if(nios_cntr == )
    //  sscsrif_hssi_cmd_sts_busy_i <= 1'b0;
  end


assign ss_app_lite_bvalid = ss_app_lite_bvalid_bridge | axi_lite_hung_bvalid;
assign ss_app_lite_bresp  = SET_AXI_LITE_RESPONSE_TO_ZERO ? 2'd0 : (axi_lite_hung_bvalid ? 2'd3 : ss_app_lite_bresp_bridge);

assign ss_app_lite_rvalid = ss_app_lite_rvalid_bridge | axi_lite_hung_rvalid;
assign ss_app_lite_rresp  = SET_AXI_LITE_RESPONSE_TO_ZERO ? 2'd0 : (axi_lite_hung_rvalid ? 2'd3 : ss_app_lite_rresp_bridge);
assign ss_app_lite_rdata  = axi_lite_hung_rvalid ? ((PARAM_DATA == 32) ? 32'hDEADC0DE : 64'hDEADC0DE_DEADC0DE) : ss_app_lite_rdata_bridge;


assign cpu_reconfig_readdata_nios  = nios_cpu_hung_readdata_valid ? 32'hDEADC0DE : cpu_reconfig_readdata; 

//Reseting the axi lite bridge if any slave does not complete the access within 10msec
//reseting the bridge will terminate the current read/write cycle by de-asserting the read/write signal. 
// before resetting the bridge, logic checks for any current pending actions to complete (which are other than the stuck access)
//if both read and write are stuck then reset is applied immediately 
//resonse to the user is generated for the stuck access with error code -- only one read and/or write response is generated 

//AXI Lite write, AXI lite read, NIOS r/w are treated as 3 masters, can access 3 diffretent slaves at at time.
//So if any master is stuck, then logic waits till the other master access to get complete, then applies reset to the bridge

//TBD - if NIOS is in DR process in Ch-x, and AXI wr/rd to Ch-y got stuck then pause DR process still reset is applied.  Wait till nios commnad completes.
//or to stop nios from issuing new writes/reads or complete the current nios access and hold the next access till reset is applied

generate 
  if(ENABLE_DUMMY_WAIT_REQ_GEN)
  begin

    always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
    begin
      if(~axi_lite_bridge_rst_n)
        axi_lite_rd_hung_cntr <= 32'd0;
      else if(rd_one_cmd_only_accept)  //ss_app_lite_arready_brdige
        axi_lite_rd_hung_cntr <= 32'd0;
      else if(axi_lite_rd_hung_cntr >= HUNG_WAIT_TIME)
        axi_lite_rd_hung_cntr <= HUNG_WAIT_TIME;
      else
        axi_lite_rd_hung_cntr <= axi_lite_rd_hung_cntr + 'd1;
    end

    always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
    begin
      if(~axi_lite_bridge_rst_n)
        axi_lite_wr_hung_cntr <= 32'd0;
      else if(wr_one_cmd_only_accept)
        axi_lite_wr_hung_cntr <= 32'd0;
      else if(axi_lite_wr_hung_cntr >= HUNG_WAIT_TIME)
        axi_lite_wr_hung_cntr <= HUNG_WAIT_TIME;
      else
        axi_lite_wr_hung_cntr <= axi_lite_wr_hung_cntr + 'd1;
    end

    always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
    begin
      if(~axi_lite_bridge_rst_n)
        nios_cpu_rd_wr_hung_cntr <= 32'd0;
      else if(cpu_rd_cmd_ack_pend | cpu_wr_cmd_ack_pend)  //cpu_reconfig_read_reg | cpu_reconfig_write_reg)
      begin
        if(nios_cpu_rd_wr_hung_cntr >= HUNG_WAIT_TIME)
      	   nios_cpu_rd_wr_hung_cntr <= HUNG_WAIT_TIME;
      	else
      	   nios_cpu_rd_wr_hung_cntr <= nios_cpu_rd_wr_hung_cntr + 'd1;
      end
      else
        nios_cpu_rd_wr_hung_cntr <= 32'd0;
    end

    always @(posedge app_ss_lite_clk)
    begin
      axi_lite_wr_pending     <= (~ss_app_lite_awready_brdige && ~axi_lite_wr_hung_det);
      axi_lite_rd_pending     <= (~ss_app_lite_arready_brdige && ~axi_lite_rd_hung_det);
      nios_cpu_rd_wr_pending  <= ((cpu_rd_cmd_ack_pend | cpu_wr_cmd_ack_pend) && ~nios_cpu_rd_wr_hung_det); //rd_or_wr_pend_for_nios // cpu_reconfig_read_reg | cpu_reconfig_write_reg ////(sscsrif_hssi_cmd_sts_read_command | sscsrif_hssi_cmd_sts_write_command)
      axi_lite_rd_hung_det    <= (axi_lite_rd_hung_cntr >= HUNG_WAIT_TIME) ? 1'b1 : 1'b0;
      axi_lite_wr_hung_det    <= (axi_lite_wr_hung_cntr >= HUNG_WAIT_TIME) ? 1'b1 : 1'b0;
      nios_cpu_rd_wr_hung_det <= (nios_cpu_rd_wr_hung_cntr >= HUNG_WAIT_TIME) ? 1'b1 : 1'b0;
      nios_command_start_r    <= nios_command_start;
    end

    //logic to send missing response but wait request is there from slave
    //assuming 1/2 pending requests
    always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
    begin
      if(~axi_lite_bridge_rst_n)
        axi_lite_rd_resp_pending_cntr <= 2'b0;
      else if((app_ss_lite_arvalid && ss_app_lite_arready) && (app_ss_lite_rready && ss_app_lite_rvalid)) //both req and resp
        axi_lite_rd_resp_pending_cntr <= axi_lite_rd_resp_pending_cntr;
      else if(app_ss_lite_arvalid && ss_app_lite_arready)  //req
        axi_lite_rd_resp_pending_cntr <= axi_lite_rd_resp_pending_cntr + 2'b1;
      else if(app_ss_lite_rready && ss_app_lite_rvalid) //resp
        axi_lite_rd_resp_pending_cntr <= axi_lite_rd_resp_pending_cntr - 2'b1;
      else
        axi_lite_rd_resp_pending_cntr <= axi_lite_rd_resp_pending_cntr;
    end
    //keep under reset till the response is sent  -- TBD
    always @(posedge app_ss_lite_clk)
    begin
      if(axi_lite_rd_hung_det && axi_lite_wr_hung_det && nios_cpu_rd_wr_hung_det)
      begin
        axi_lite_hung_rst_n <= 1'b0; 
      end
      else if(axi_lite_rd_hung_det)
      begin
        if((axi_lite_wr_pending == 1'b0) && (nios_cpu_rd_wr_pending == 1'b0))
          axi_lite_hung_rst_n <= 1'b0; 
        else
          axi_lite_hung_rst_n <= 1'b1; 
      end
      else if(axi_lite_wr_hung_det)
      begin
        if((axi_lite_rd_pending == 1'b0) && (nios_cpu_rd_wr_pending == 1'b0))
          axi_lite_hung_rst_n <= 1'b0; 
        else
          axi_lite_hung_rst_n <= 1'b1; 
      end
      else if(nios_cpu_rd_wr_hung_det)
      begin
        if((axi_lite_rd_pending == 1'b0) && (axi_lite_wr_pending == 1'b0))
          axi_lite_hung_rst_n <= 1'b0; 
        else
          axi_lite_hung_rst_n <= 1'b1; 
      end
      else
      begin
        axi_lite_hung_rst_n <= 1'b1; 
      end
    end

    //Response generation
    always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
    begin
      if(~axi_lite_bridge_rst_n)
      begin
        axi_lite_hung_rvalid <= 1'b0;
        axi_lite_rresp_sent  <= 1'b0;
      end
      else if(axi_lite_rd_hung_det && app_ss_lite_rready && !axi_lite_rresp_sent)
      begin
        axi_lite_hung_rvalid <= 1'b1;
        //axi_lite_rresp_sent  <= 1'b1;
        axi_lite_rresp_sent  <= (axi_lite_rd_resp_pending_cntr > 2'd1) ? 1'b0 : 1'b1; //sending resp for pending req assuming rready is high
      end
      else
      begin
        axi_lite_hung_rvalid <= 1'b0; 
        axi_lite_rresp_sent  <= axi_lite_rresp_sent;
      end
    end

    always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
    begin
      if(~axi_lite_bridge_rst_n)
      begin
        axi_lite_hung_bvalid <= 1'b0;
        axi_lite_bresp_sent  <= 1'b0;
      end
      else if(axi_lite_wr_hung_det && app_ss_lite_bready && !axi_lite_bresp_sent)
      begin
        axi_lite_hung_bvalid <= 1'b1;
        axi_lite_bresp_sent  <= 1'b1;
      end
      else
      begin
        axi_lite_hung_bvalid <= 1'b0;
        axi_lite_bresp_sent  <= axi_lite_bresp_sent;
      end
    end

//  end

  always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
  begin
  	if (~axi_lite_bridge_rst_n)
  	begin
  	      nios_cpu_rd_wr_hung_det_d1   <= 1'b0;
  	      nios_cpu_rd_wr_hung_det_d2   <= 1'b0;
  	      nios_cpu_hung_waitrequest    <= 1'b1;
  	      nios_cpu_hung_readdata_valid <= 1'b0;
  	end
  	else 
  	begin
  	      nios_cpu_rd_wr_hung_det_d1   <= nios_cpu_rd_wr_hung_det;
  	      nios_cpu_rd_wr_hung_det_d2   <= nios_cpu_rd_wr_hung_det_d1;
  	      nios_cpu_hung_waitrequest    <= ~(nios_cpu_rd_wr_hung_det_d1 && ~nios_cpu_rd_wr_hung_det_d2); //this should include rst sync delay 
  	      nios_cpu_hung_readdata_valid <= cpu_rd_cmd_ack_pend && ~nios_cpu_hung_waitrequest;  //sscsrif_hssi_cmd_sts_read_command && sscsrif_hssi_cmd_sts_busy_i; //cpu_reconfig_read_reg    
  	end
  end

  always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
  begin
    if(~axi_lite_bridge_rst_n)
      cpu_rd_cmd_ack_pend <= 1'b0; 
    else if(cpu_reconfig_read & ~cpu_reconfig_read_q)
      cpu_rd_cmd_ack_pend <= 1'b1;
    else if(cpu_reconfig_readdata_valid)
      cpu_rd_cmd_ack_pend <= 1'b0;
  end

  always @(posedge app_ss_lite_clk) cpu_reconfig_read_q <= cpu_reconfig_read;
  always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
  begin
    if(~axi_lite_bridge_rst_n)
      cpu_wr_cmd_ack_pend <= 1'b0; 
    else if(cpu_reconfig_write & ~cpu_reconfig_write_q)
      cpu_wr_cmd_ack_pend <= 1'b1;
    else if(nios_command_complete_d1 | cpu_reconfig_readdata_valid)
      cpu_wr_cmd_ack_pend <= 1'b0;
  end

  always @(posedge app_ss_lite_clk) cpu_reconfig_write_q <= cpu_reconfig_write;

    always @(posedge app_ss_lite_clk or negedge i_ss_nios_rst_n)
    begin
      if(~i_ss_nios_rst_n)
          nios_hung_error <= 1'b0;
       else if(nios_cpu_rd_wr_hung_det)
          nios_hung_error <= 1'b1;
       else if(nios_command_start)
          nios_hung_error <= 1'b0;
    end

end
else
  begin
    always @(posedge app_ss_lite_clk)
    begin
      axi_lite_rd_hung_det <= 1'b0; 
      axi_lite_wr_hung_det <= 1'b0; 
      axi_lite_hung_rst_n  <= 1'b1;
      axi_lite_hung_rvalid <= 1'b0;
      axi_lite_hung_bvalid <= 1'b0;
      nios_cpu_hung_readdata_valid <= 1'b0;
      nios_cpu_hung_waitrequest <= 1'b0;
      nios_hung_error      <= 1'b0;
    end
  end	  

endgenerate


//Below pipeline added for timing
    always @(posedge app_ss_lite_clk or negedge axi_lite_bridge_rst_n)
    begin
      if(~axi_lite_bridge_rst_n)
      begin
        cpu_reconfig_addr_reg       <= 26'd0;
        cpu_reconfig_writedata_reg  <= 32'd0;
        cpu_reconfig_byteenable_reg <= 4'd0;
        cpu_reconfig_read_reg       <= 1'b0;
        cpu_reconfig_write_reg      <= 1'b0;
      end
      else
      begin
        cpu_reconfig_addr_reg       <= cpu_reconfig_addr; 
        cpu_reconfig_writedata_reg  <= cpu_reconfig_writedata; 
        cpu_reconfig_byteenable_reg <= cpu_reconfig_byteenable; 
        if (~(cpu_reconfig_waitrequest && nios_cpu_hung_waitrequest))
        begin
          cpu_reconfig_read_reg  <= 1'b0;
          cpu_reconfig_write_reg <= 1'b0;
        end
        else if (~cpu_reconfig_waitrequest_reg) //this is assuming back-to-back nios access will not happen
        begin
          cpu_reconfig_read_reg  <= 1'b0;
          cpu_reconfig_write_reg <= 1'b0;
        end
        else
        begin
          cpu_reconfig_read_reg  <= cpu_reconfig_read; 
          cpu_reconfig_write_reg <= cpu_reconfig_write; 
        end
      end
    end

    //always @(posedge app_ss_lite_clk)
    //begin
       assign cpu_reconfig_waitrequest_reg    = (nios_cpu_rd_wr_hung_det == 0) ? cpu_reconfig_waitrequest : nios_cpu_hung_waitrequest; 
       assign cpu_reconfig_readdata_valid_reg = cpu_reconfig_readdata_valid || nios_cpu_hung_readdata_valid; 
       assign cpu_reconfig_readdata_reg       = cpu_reconfig_readdata_nios; 
    //end

wire [25:0] axi_lite_pp_awaddr;
wire [2:0]  axi_lite_pp_awprot;
wire        axi_lite_pp_awvalid;
wire        axi_lite_pp_awready;
wire [31:0] axi_lite_pp_wdata;
wire [3:0]  axi_lite_pp_wstrb;
wire        axi_lite_pp_wvalid;
wire        axi_lite_pp_wready;
wire [1:0]  axi_lite_pp_bresp;
wire        axi_lite_pp_bvalid;
wire        axi_lite_pp_bready;
wire [25:0] axi_lite_pp_araddr;
wire [2:0]  axi_lite_pp_arprot;
wire        axi_lite_pp_arvalid;
wire        axi_lite_pp_arready;
wire [31:0] axi_lite_pp_rdata;
wire [1:0]  axi_lite_pp_rresp;
wire        axi_lite_pp_rvalid;
wire        axi_lite_pp_rready;


//	axi_piepeline_bridge U_axilite_pipeline_bridge (
//		.axilite_bridge_slave_m0_awaddr  (axi_lite_pp_awaddr),  //  output,  width = 26, axilite_bridge_slave_m0.awaddr
//		.axilite_bridge_slave_m0_awprot  (axi_lite_pp_awprot),  //  output,   width = 3,                        .awprot
//		.axilite_bridge_slave_m0_awvalid (axi_lite_pp_awvalid), //  output,   width = 1,                        .awvalid
//		.axilite_bridge_slave_m0_awready (axi_lite_pp_awready), //   input,   width = 1,                        .awready
//		.axilite_bridge_slave_m0_wdata   (axi_lite_pp_wdata),   //  output,  width = 32,                        .wdata
//		.axilite_bridge_slave_m0_wstrb   (axi_lite_pp_wstrb),   //  output,   width = 4,                        .wstrb
//		.axilite_bridge_slave_m0_wvalid  (axi_lite_pp_wvalid),  //  output,   width = 1,                        .wvalid
//		.axilite_bridge_slave_m0_wready  (axi_lite_pp_wready),  //   input,   width = 1,                        .wready
//		.axilite_bridge_slave_m0_bresp   (axi_lite_pp_bresp),   //   input,   width = 2,                        .bresp
//		.axilite_bridge_slave_m0_bvalid  (axi_lite_pp_bvalid),  //   input,   width = 1,                        .bvalid
//		.axilite_bridge_slave_m0_bready  (axi_lite_pp_bready),  //  output,   width = 1,                        .bready
//		.axilite_bridge_slave_m0_araddr  (axi_lite_pp_araddr),  //  output,  width = 26,                        .araddr
//		.axilite_bridge_slave_m0_arprot  (axi_lite_pp_arprot),  //  output,   width = 3,                        .arprot
//		.axilite_bridge_slave_m0_arvalid (axi_lite_pp_arvalid), //  output,   width = 1,                        .arvalid
//		.axilite_bridge_slave_m0_arready (axi_lite_pp_arready), //   input,   width = 1,                        .arready
//		.axilite_bridge_slave_m0_rdata   (axi_lite_pp_rdata),   //   input,  width = 32,                        .rdata
//		.axilite_bridge_slave_m0_rresp   (axi_lite_pp_rresp),   //   input,   width = 2,                        .rresp
//		.axilite_bridge_slave_m0_rvalid  (axi_lite_pp_rvalid),  //   input,   width = 1,                        .rvalid
//		.axilite_bridge_slave_m0_rready  (axi_lite_pp_rready),  //  output,   width = 1,                        .rready
//		.axi_bridge_0_s0_awaddr          (app_ss_lite_awaddr),          //   input,  width = 26,         axi_bridge_0_s0.awaddr
//		.axi_bridge_0_s0_awprot          (app_ss_lite_awprot),          //   input,   width = 3,                        .awprot
//		.axi_bridge_0_s0_awvalid         (app_ss_lite_awvalid && axi_lite_ready_en),         //   input,   width = 1,                        .awvalid
//		.axi_bridge_0_s0_awready         (ss_app_lite_awready_brdige),         //  output,   width = 1,                        .awready
//		.axi_bridge_0_s0_wdata           (app_ss_lite_wdata),           //   input,  width = 32,                        .wdata
//		.axi_bridge_0_s0_wstrb           (app_ss_lite_wstrb),           //   input,   width = 4,                        .wstrb
//		.axi_bridge_0_s0_wvalid          (app_ss_lite_wvalid && axi_lite_ready_en),          //   input,   width = 1,                        .wvalid
//		.axi_bridge_0_s0_wready          (ss_app_lite_wready_brdige),          //  output,   width = 1,                        .wready
//		.axi_bridge_0_s0_bresp           (ss_app_lite_bresp_bridge),           //  output,   width = 2,                        .bresp
//		.axi_bridge_0_s0_bvalid          (ss_app_lite_bvalid_bridge),          //  output,   width = 1,                        .bvalid
//		.axi_bridge_0_s0_bready          (app_ss_lite_bready),          //   input,   width = 1,                        .bready
//		.axi_bridge_0_s0_araddr          (app_ss_lite_araddr),          //   input,  width = 26,                        .araddr
//		.axi_bridge_0_s0_arprot          (app_ss_lite_arprot),          //   input,   width = 3,                        .arprot
//		.axi_bridge_0_s0_arvalid         (app_ss_lite_arvalid && axi_lite_ready_en),         //   input,   width = 1,                        .arvalid
//		.axi_bridge_0_s0_arready         (ss_app_lite_arready_brdige),         //  output,   width = 1,                        .arready
//		.axi_bridge_0_s0_rdata           (ss_app_lite_rdata_bridge),           //  output,  width = 32,                        .rdata
//		.axi_bridge_0_s0_rresp           (ss_app_lite_rresp_bridge),           //  output,   width = 2,                        .rresp
//		.axi_bridge_0_s0_rvalid          (ss_app_lite_rvalid_bridge),          //  output,   width = 1,                        .rvalid
//		.axi_bridge_0_s0_rready          (app_ss_lite_rready),          //   input,   width = 1,                        .rready
//		.clk_clk                         (app_ss_lite_clk),                         //   input,   width = 1,                     clk.clk
//		.mm_bridge_0_s0_waitrequest      (cpu_reconfig_waitrequest),      //  output,   width = 1,          mm_bridge_0_s0.waitrequest
//		.mm_bridge_0_s0_readdata         (cpu_reconfig_readdata),         //  output,  width = 32,                        .readdata
//		.mm_bridge_0_s0_readdatavalid    (cpu_reconfig_readdata_valid),    //  output,   width = 1,                        .readdatavalid
//		.mm_bridge_0_s0_burstcount       (1'b0),       //   input,   width = 1,                        .burstcount
//		.mm_bridge_0_s0_writedata        (cpu_reconfig_writedata),        //   input,  width = 32,                        .writedata
//		.mm_bridge_0_s0_address          (cpu_reconfig_addr),          //   input,  width = 26,                        .address
//		.mm_bridge_0_s0_write            (cpu_reconfig_write),            //   input,   width = 1,                        .write
//		.mm_bridge_0_s0_read             (cpu_reconfig_read),             //   input,   width = 1,                        .read
//		.mm_bridge_0_s0_byteenable       (cpu_reconfig_byteenable),       //   input,   width = 4,                        .byteenable
//		.mm_bridge_0_s0_debugaccess      (1'b0),      //   input,   width = 1,                        .debugaccess
//		.jtag_avmm_master_0_s0_waitrequest   (jtag_waitrequest),   //  output,   width = 1,   jtag_avmm_master_0_s0.waitrequest
//		.jtag_avmm_master_0_s0_readdata      (jtag_readdata),      //  output,  width = 32,                        .readdata
//		.jtag_avmm_master_0_s0_readdatavalid (jtag_readdata_valid), //  output,   width = 1,                        .readdatavalid
//		.jtag_avmm_master_0_s0_burstcount    (1'b0),    //   input,   width = 1,                        .burstcount
//		.jtag_avmm_master_0_s0_writedata     (jtag_writedata),     //   input,  width = 32,                        .writedata
//		.jtag_avmm_master_0_s0_address       (jtag_addr),       //   input,  width = 26,                        .address
//		.jtag_avmm_master_0_s0_write         (jtag_write),         //   input,   width = 1,                        .write
//		.jtag_avmm_master_0_s0_read          (jtag_read),          //   input,   width = 1,                        .read
//		.jtag_avmm_master_0_s0_byteenable    (jtag_byteenable),    //   input,   width = 4,                        .byteenable
//		.jtag_avmm_master_0_s0_debugaccess   (1'b0),   //   input,   width = 1,                        .debugaccess
//		.reset_reset                     (~axi_lite_bridge_rst_n)                      //   input,   width = 1,                   reset.reset
//	);


hssi_ss_axilite_avmm_bridge U_hssi_ss_axilite_avmm_bridge (
          .clk_clk                                      (app_ss_lite_clk),
          .reset_reset_n                                (axi_lite_bridge_rst_n),
          //
		      .axi_bridge_0_s0_awaddr          (app_ss_lite_awaddr),          //   input,  width = 26,         axi_bridge_0_s0.awaddr
		      .axi_bridge_0_s0_awprot          (app_ss_lite_awprot),          //   input,   width = 3,                        .awprot
		      .axi_bridge_0_s0_awvalid         (app_ss_lite_awvalid && axi_lite_ready_en && wr_one_cmd_only_accept),         //   input,   width = 1,                        .awvalid
		      .axi_bridge_0_s0_awready         (ss_app_lite_awready_brdige),         //  output,   width = 1,                        .awready
		      .axi_bridge_0_s0_wdata           (app_ss_lite_wdata),           //   input,  width = 32,                        .wdata
		      .axi_bridge_0_s0_wstrb           (app_ss_lite_wstrb),           //   input,   width = 4,                        .wstrb
		      .axi_bridge_0_s0_wvalid          (app_ss_lite_wvalid && axi_lite_ready_en && wr_one_cmd_only_accept),          //   input,   width = 1,                        .wvalid
		      .axi_bridge_0_s0_wready          (ss_app_lite_wready_brdige),          //  output,   width = 1,                        .wready
		      .axi_bridge_0_s0_bresp           (ss_app_lite_bresp_bridge),           //  output,   width = 2,                        .bresp
		      .axi_bridge_0_s0_bvalid          (ss_app_lite_bvalid_bridge),          //  output,   width = 1,                        .bvalid
		      .axi_bridge_0_s0_bready          (app_ss_lite_bready),          //   input,   width = 1,                        .bready
		      .axi_bridge_0_s0_araddr          (app_ss_lite_araddr),          //   input,  width = 26,                        .araddr
		      .axi_bridge_0_s0_arprot          (app_ss_lite_arprot),          //   input,   width = 3,                        .arprot
		      .axi_bridge_0_s0_arvalid         (app_ss_lite_arvalid && axi_lite_ready_en && rd_one_cmd_only_accept),         //   input,   width = 1,                        .arvalid
		      .axi_bridge_0_s0_arready         (ss_app_lite_arready_brdige),         //  output,   width = 1,                        .arready
		      .axi_bridge_0_s0_rdata           (ss_app_lite_rdata_bridge),           //  output,  width = 32,                        .rdata
		      .axi_bridge_0_s0_rresp           (ss_app_lite_rresp_bridge),           //  output,   width = 2,                        .rresp
		      .axi_bridge_0_s0_rvalid          (ss_app_lite_rvalid_bridge),          //  output,   width = 1,                        .rvalid
		      .axi_bridge_0_s0_rready          (app_ss_lite_rready),          //   input,   width = 1,                        .rready
		      .cpu_reconfig_s0_waitrequest    (cpu_reconfig_waitrequest),      //  output,   width = 1,          mm_bridge_0_s0.waitrequest
		      .cpu_reconfig_s0_readdata       (cpu_reconfig_readdata),         //  output,  width = 32,                        .readdata
		      .cpu_reconfig_s0_readdatavalid  (cpu_reconfig_readdata_valid),    //  output,   width = 1,                        .readdatavalid
		      .cpu_reconfig_s0_burstcount     (1'b1),       //   input,   width = 1,                        .burstcount
		      .cpu_reconfig_s0_writedata      (cpu_reconfig_writedata),        //   input,  width = 32,                        .writedata
		      .cpu_reconfig_s0_address        (cpu_reconfig_addr),          //   input,  width = 26,                        .address
		      .cpu_reconfig_s0_write          (cpu_reconfig_write),            //   input,   width = 1,                        .write
		      .cpu_reconfig_s0_read           (cpu_reconfig_read),             //   input,   width = 1,                        .read
		      .cpu_reconfig_s0_byteenable     (cpu_reconfig_byteenable),       //   input,   width = 4,                        .byteenable
		      .cpu_reconfig_s0_debugaccess    (1'b0),      //   input,   width = 1,                        .debugaccess
          //.cpu_reconfig_address                         (cpu_reconfig_addr_reg),
          //.cpu_reconfig_read                            (cpu_reconfig_read_reg),
          //.cpu_reconfig_write                           (cpu_reconfig_write_reg),
          //.cpu_reconfig_writedata                       (cpu_reconfig_writedata_reg),
          //.cpu_reconfig_readdata                        (cpu_reconfig_readdata),
          //.cpu_reconfig_readdatavalid                   (cpu_reconfig_readdata_valid),
          //.cpu_reconfig_waitrequest                     (cpu_reconfig_waitrequest),
          //.cpu_reconfig_byteenable                      (cpu_reconfig_byteenable_reg),
          //.cpu_reconfig_burstcount                      (1'b0),
                            
          //AVMM Slaves
          .p0_eth_reconfig_address             (p0_eth_reconfig_address),
          .p0_eth_reconfig_read                (o_p0_eth_reconfig_read),
          .p0_eth_reconfig_write               (o_p0_eth_reconfig_write),
          .p0_eth_reconfig_waitrequest         (i_p0_eth_reconfig_waitrequest),
          .p0_eth_reconfig_readdatavalid       (i_p0_eth_reconfig_readdatavalid),
          .p0_eth_reconfig_readdata            (i_p0_eth_reconfig_readdata),
          .p0_eth_reconfig_writedata           (o_p0_eth_reconfig_writedata),
          .p0_eth_reconfig_byteenable          (o_p0_eth_reconfig_byteenable),
          //
          .p0_c0_xcvr_reconfig_address       (p0_c0_xcvr_reconfig_address),
          .p0_c0_xcvr_reconfig_read          (o_p0_c0_xcvr_reconfig_read),
          .p0_c0_xcvr_reconfig_write         (o_p0_c0_xcvr_reconfig_write),
          .p0_c0_xcvr_reconfig_waitrequest   (i_p0_c0_xcvr_reconfig_waitrequest),
          .p0_c0_xcvr_reconfig_readdatavalid (i_p0_c0_xcvr_reconfig_readdatavalid),
          .p0_c0_xcvr_reconfig_readdata      (i_p0_c0_xcvr_reconfig_readdata),
          .p0_c0_xcvr_reconfig_writedata     (o_p0_c0_xcvr_reconfig_writedata),
          .p0_c0_xcvr_reconfig_byteenable    (o_p0_c0_xcvr_reconfig_byteenable),
          //PTP Tile adaptor reconfig AVMM slaves
          .ptp_asym_reconfig_address                    (o_ptp_asym_reconfig_address),
          .ptp_asym_reconfig_read                       (o_ptp_asym_reconfig_read),
          .ptp_asym_reconfig_write                      (o_ptp_asym_reconfig_write),
          .ptp_asym_reconfig_waitrequest                (i_ptp_asym_reconfig_waitrequest),
          .ptp_asym_reconfig_readdatavalid              (i_ptp_asym_reconfig_readdatavalid),
          .ptp_asym_reconfig_readdata                   (i_ptp_asym_reconfig_readdata),
          .ptp_asym_reconfig_writedata                  (o_ptp_asym_reconfig_writedata),
          .ptp_asym_reconfig_byteenable                 (o_ptp_asym_reconfig_byteenable),
          //
          .ptp_p2p_reconfig_address                     (o_ptp_p2p_reconfig_address),
          .ptp_p2p_reconfig_read                        (o_ptp_p2p_reconfig_read),
          .ptp_p2p_reconfig_write                       (o_ptp_p2p_reconfig_write),
          .ptp_p2p_reconfig_waitrequest                 (i_ptp_p2p_reconfig_waitrequest),
          .ptp_p2p_reconfig_readdatavalid               (i_ptp_p2p_reconfig_readdatavalid),
          .ptp_p2p_reconfig_readdata                    (i_ptp_p2p_reconfig_readdata),
          .ptp_p2p_reconfig_writedata                   (o_ptp_p2p_reconfig_writedata),
          .ptp_p2p_reconfig_byteenable                  (o_ptp_p2p_reconfig_byteenable),

          // SS reconfig AVMM slave
          .ss_reconfig_address                          (ss_reconfig_address),
          .ss_reconfig_read                             (ss_reconfig_read),
          .ss_reconfig_write                            (ss_reconfig_write),
          .ss_reconfig_waitrequest                      (ss_reconfig_waitrequest),
          .ss_reconfig_readdatavalid                    (ss_reconfig_readdatavalid_tmp),
          .ss_reconfig_readdata                         (ss_reconfig_readdata),
          .ss_reconfig_byteenable                       (ss_reconfig_byteenable),
          .ss_reconfig_writedata                        (ss_reconfig_writedata)
    );

          assign  anlt_reconfig_address = 15'h7FFF;
          assign  anlt_reconfig_read    = 1'b0;
          assign  anlt_reconfig_write   = 1'b0;


hssi_ss_std_synchronizer_nocut U_out_sync_lite_rstn  
        ( 
        .clk      (app_ss_lite_clk), 
        .reset_n  (1'b1), 
        .din      (i_axi_lite_bridge_rst_n && axi_lite_hung_rst_n), 
        .dout     (axi_lite_bridge_rst_n)
        );

//INST map is for getting the ANLT instance no from reconfig address, mapping b/w port and anlt instance
localparam [4:0] ANLT_INST_MAP [0:31] = {20, 20, 20, 20, 20, 20, 20, 20, 
                                         20, 20, 20,20,20,20,20,20, 
                                         20,20,20,20,5'd20    , 5'd20    , 5'd20     , 5'd20,
                                         5'd20    , 5'd20    , 5'd20    , 5'd20     ,5'd20    , 5'd20    , 5'd20     , 5'd20};
//PORT map is for getting the ANLT instance channel no (i.e. the channel with in the instance) from reconfig address, mapping b/w port and anlt channel
localparam [4:0] ANLT_PORT_MAP [0:31] = {0, 0, 0, 0, 0, 0, 0, 0, 
                                         0, 0, 0,0,0,0,0,0, 
                                         0,0,0,0,5'd0              , 5'd0             , 5'd0             , 5'd0             ,
                                         5'd0              , 5'd0             , 5'd0             , 5'd0             ,5'd0              , 5'd0             , 5'd0             , 5'd0             };
//PORT En is the ANLT enabled or not config info, it is for generating dummy waitrequest for anlt disabled ports 
localparam [0:0] ANLT_PORT_EN [0:31] = {0, 0, 0, 0, 0, 0, 0, 0, 
                                        0, 0, 0,0,0,0,0,0, 
                                        0,0,0,0,1'd0              , 1'd0             , 1'd0             , 1'd0             ,
                                        1'd0              , 1'd0             , 1'd0             , 1'd0             ,1'd0              , 1'd0             , 1'd0             , 1'd0             };
//*********************************************************************************
//                                ANLT port to inst mux        
//*********************************************************************************


        assign anlt_reconfig_waitrequest_temp[0]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[0] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[0]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[1]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[1] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[1]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[2]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[2] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[2]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[3]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[3] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[3]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[4]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[4] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[4]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[5]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[5] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[5]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[6]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[6] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[6]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[7]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[7] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[7]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[8]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[8] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[8]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[9]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[9] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[9]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[10]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[10] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[10]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[11]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[11] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[11]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[12]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[12] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[12]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[13]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[13] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[13]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[14]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[14] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[14]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[15]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[15] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[15]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[16]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[16] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[16]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[17]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[17] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[17]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[18]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[18] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[18]      = 32'h0; 

        assign anlt_reconfig_waitrequest_temp[19]   = anlt_dummy_waitrequest; 
        assign anlt_reconfig_readdatavalid_temp[19] = anlt_dummy_readdatavalid; 
        assign anlt_reconfig_readdata_temp[19]      = 32'h0; 
        assign anlt_reconfig_readdata_temp[20] = 32'h0; 
        assign anlt_reconfig_waitrequest   = &anlt_reconfig_waitrequest_temp; 
        assign anlt_reconfig_readdatavalid = |anlt_reconfig_readdatavalid_temp; 
        assign anlt_reconfig_readdata      = anlt_reconfig_readdata_temp[ANLT_INST_MAP[anlt_reconfig_address_d1[14:10]]]; 


      //dummy waitrequest and readdatavalid generation for non-ANLT enabled ports
      //if address from the bridge is for the non-ANLT enabled port
      assign anlt_dummy_port_en = (ANLT_PORT_EN[anlt_reconfig_address[14:10]] == 1'b0) ? 1'b1 : 1'b0;
      assign anlt_read_write_en = (anlt_reconfig_read | anlt_reconfig_write) && anlt_dummy_port_en;

      always @(posedge app_ss_lite_clk)
      begin
        anlt_reconfig_address_d1  <= anlt_reconfig_address;
        anlt_read_write_en_d1     <= anlt_read_write_en;
        anlt_read_write_en_d2     <= anlt_read_write_en_d1;
        anlt_read_write_en_d3     <= anlt_read_write_en_d2;
        anlt_dummy_waitrequest    <= (anlt_read_write_en_d2 && ~anlt_read_write_en_d3) ? 1'b0 : 1'b1;
        anlt_dummy_readdatavalid  <= ~anlt_dummy_waitrequest && anlt_reconfig_read; 
      end

//*********************************************************************************
// -- CSR Address Decoder Instantiation
//*********************************************************************************

  always @(posedge app_ss_lite_clk or negedge i_ss_nios_rst_n)
  begin
    if(~i_ss_nios_rst_n)
      ss_reconfig_wait_cntr <= 3'd0;
    else if(ss_reconfig_write | ss_reconfig_read)
      ss_reconfig_wait_cntr <= ss_reconfig_wait_cntr + 3'd1;
    else
      ss_reconfig_wait_cntr <= 3'd0;
  end

  always @(posedge app_ss_lite_clk or negedge i_ss_nios_rst_n)
  begin
    if(~i_ss_nios_rst_n)
      ss_reconfig_waitrequest <= 1'b1;
    else if((ss_reconfig_wait_cntr == 'd6) && ss_reconfig_write)
      ss_reconfig_waitrequest <= 1'b0;
    else if((ss_reconfig_wait_cntr == 'd6) && ss_reconfig_read)
      ss_reconfig_waitrequest <= 1'b0;
    else
      ss_reconfig_waitrequest <= 1'b1;
  end

  always @(posedge app_ss_lite_clk)
  begin
    ss_reconfig_readdatavalid_tmp <= (ss_reconfig_wait_cntr == 'd7) && ss_reconfig_read;
  end

	assign port_enable[0] = i_p0_port_params[0];
  assign o_p0_eth_reconfig_address[13:0] = p0_eth_reconfig_address[15:2];
  assign o_p0_c0_xcvr_reconfig_address[17:0] = p0_c0_xcvr_reconfig_address[19:2];
	assign port_enable[1] = i_p1_port_params[0];
	assign port_enable[2] = i_p2_port_params[0];
	assign port_enable[3] = i_p3_port_params[0];
	assign port_enable[4] = i_p4_port_params[0];
	assign port_enable[5] = i_p5_port_params[0];
	assign port_enable[6] = i_p6_port_params[0];
	assign port_enable[7] = i_p7_port_params[0];
	assign port_enable[8] = i_p8_port_params[0];
	assign port_enable[9] = i_p9_port_params[0];
	assign port_enable[10] = i_p10_port_params[0];
	assign port_enable[11] = i_p11_port_params[0];
	assign port_enable[12] = i_p12_port_params[0];
	assign port_enable[13] = i_p13_port_params[0];
	assign port_enable[14] = i_p14_port_params[0];
	assign port_enable[15] = i_p15_port_params[0];
	assign port_enable[16] = i_p16_port_params[0];
	assign port_enable[17] = i_p17_port_params[0];
	assign port_enable[18] = i_p18_port_params[0];
	assign port_enable[19] = i_p19_port_params[0];

//generate
//genvar i;
//for(i=0; i<20; i=i+1)
//begin: HOTPLUG_STATUS
  assign hotplug_status[7:0] = 8'd0; 
//  //assign hotplug_status[7:0] = (o_hotplug_control[11:8] == i) ? i_hotplug_status_all[i][7:0] : 8'hzz;
//end
//endgenerate

wire [1-1 : 0] or_ed_ecc;

          assign or_ed_ecc[0] = i_p0_tx_fifo_eccstatus[0]; 

hssi_ss_f_csr U_HSSI_SS_CSR
          (
          .clk(app_ss_lite_clk),
          .reset(~i_ss_nios_rst_n),
          //AVMM IF
          .address(ss_reconfig_address),
          .byteenable(ss_reconfig_byteenable),
          .writedata(ss_reconfig_writedata),
          .write(ss_reconfig_write),
          .readdata(ss_reconfig_readdata),
          .read(ss_reconfig_read),
          .readdatavalid(ss_reconfig_readdatavalid),
          //NIOS Control and Status
          .sscsrif_hssi_cmd_sts_read_command(sscsrif_hssi_cmd_sts_read_command),
          .sscsrif_hssi_cmd_sts_write_command(sscsrif_hssi_cmd_sts_write_command),
          .sscsrif_hssi_cmd_sts_xcvr_reg_byte_no(sscsrif_hssi_cmd_sts_xcvr_reg_byte_no),
          .sscsrif_hssi_ctrl_addr_sal_command(sscsrif_hssi_ctrl_addr_sal_command),
          .sscsrif_hssi_ctrl_addr_port_addr(sscsrif_hssi_ctrl_addr_port_addr),
          .sscsrif_hssi_ctrl_addr_addr_msb(sscsrif_hssi_ctrl_addr_addr_msb),
          //inputs from nios
          .sscsrif_hssi_cmd_sts_ack_trans_hwset(sscsrif_hssi_cmd_sts_ack_trans_hwset), 
          .sscsrif_hssi_cmd_sts_busy_i(sscsrif_hssi_cmd_sts_busy_i),
          .sscsrif_hssi_cmd_sts_error_i(sscsrif_hssi_cmd_sts_error_i),
          .sscsrif_hssi_rd_data_write_data_i(sscsrif_hssi_rd_data_write_data_i),
          //outputs nios
          .sscsrif_hssi_cmd_sts_ack_trans(sscsrif_hssi_cmd_sts_ack_trans), 
          .sscsrif_hssi_wr_data_write_data(sscsrif_hssi_wr_data_write_data),
          ///////////////////
          //EHIP Control Status
          .sscsrif_hssi_tse_ctrl_Magic_sleep_n(sscsrif_hssi_tse_ctrl_Magic_sleep_n),
          .sscsrif_version_min_ver_i(MINOR_VERSION),
          .sscsrif_version_maj_ver_i(MAJOR_VERSION),
          .sscsrif_feature_list_axi4_support_i(1'b1),
          .sscsrif_feature_list_hssi_num_ports_i(NUM_ENABLED_PORTS),
          .sscsrif_feature_list_physical_port_enable_i(port_enable),
          //.sscsrif_hssi_general_status_ecc_error_m20k_i({1'b0,(|or_ed_ecc),1'b0}),
          .sscsrif_hssi_general_status_ecc_error_m20k_sal_nios_hwset(1'b0),
          .sscsrif_hssi_general_status_ecc_error_m20k_avst_hwset(|or_ed_ecc),
          .sscsrif_hssi_general_status_ecc_error_m20k_jtag_hwset(1'b0),
				 	.sscsrif_hssi_dr_csr_dr_flags_i(i_dr_in_progress),
          .sscsrif_port0_param_port_0_profile_i(i_p0_port_params[6:1]),
          .sscsrif_port0_param_port_0_subprofile_i(i_p0_port_params[16:12]),
          .sscsrif_port0_param_port_0_databus_width_i(i_p0_port_params[9:7]),
          .sscsrif_port0_param_port_0_lowspeed_eth_param_i(i_p0_port_params[11:10]),
          .sscsrif_port0_param_port_0_rsfec_enable_i(i_p0_port_params[17]),
          .sscsrif_port0_param_port_0_anlt_enable_i(i_p0_port_params[18]),
          .sscsrif_port0_param_port_0_ptp_enable_i(i_p0_port_params[19]),
          .sscsrif_port0_param_port_0_drinpr_presence_i(1'b0),
          .sscsrif_port1_param_port_1_profile_i(i_p1_port_params[6:1]),
          .sscsrif_port1_param_port_1_subprofile_i(i_p1_port_params[16:12]),
          .sscsrif_port1_param_port_1_databus_width_i(i_p1_port_params[9:7]),
          .sscsrif_port1_param_port_1_lowspeed_eth_param_i(i_p1_port_params[11:10]),
          .sscsrif_port1_param_port_1_rsfec_enable_i(i_p1_port_params[17]),
          .sscsrif_port1_param_port_1_anlt_enable_i(i_p1_port_params[18]),
          .sscsrif_port1_param_port_1_ptp_enable_i(i_p1_port_params[19]),
          .sscsrif_port1_param_port_1_drinpr_presence_i(1'b0),
          .sscsrif_port2_param_port_2_profile_i(i_p2_port_params[6:1]),
          .sscsrif_port2_param_port_2_subprofile_i(i_p2_port_params[16:12]),
          .sscsrif_port2_param_port_2_databus_width_i(i_p2_port_params[9:7]),
          .sscsrif_port2_param_port_2_lowspeed_eth_param_i(i_p2_port_params[11:10]),
          .sscsrif_port2_param_port_2_rsfec_enable_i(i_p2_port_params[17]),
          .sscsrif_port2_param_port_2_anlt_enable_i(i_p2_port_params[18]),
          .sscsrif_port2_param_port_2_ptp_enable_i(i_p2_port_params[19]),
          .sscsrif_port2_param_port_2_drinpr_presence_i(1'b0),
          .sscsrif_port3_param_port_3_profile_i(i_p3_port_params[6:1]),
          .sscsrif_port3_param_port_3_subprofile_i(i_p3_port_params[16:12]),
          .sscsrif_port3_param_port_3_databus_width_i(i_p3_port_params[9:7]),
          .sscsrif_port3_param_port_3_lowspeed_eth_param_i(i_p3_port_params[11:10]),
          .sscsrif_port3_param_port_3_rsfec_enable_i(i_p3_port_params[17]),
          .sscsrif_port3_param_port_3_anlt_enable_i(i_p3_port_params[18]),
          .sscsrif_port3_param_port_3_ptp_enable_i(i_p3_port_params[19]),
          .sscsrif_port3_param_port_3_drinpr_presence_i(1'b0),
          .sscsrif_port4_param_port_4_profile_i(i_p4_port_params[6:1]),
          .sscsrif_port4_param_port_4_subprofile_i(i_p4_port_params[16:12]),
          .sscsrif_port4_param_port_4_databus_width_i(i_p4_port_params[9:7]),
          .sscsrif_port4_param_port_4_lowspeed_eth_param_i(i_p4_port_params[11:10]),
          .sscsrif_port4_param_port_4_rsfec_enable_i(i_p4_port_params[17]),
          .sscsrif_port4_param_port_4_anlt_enable_i(i_p4_port_params[18]),
          .sscsrif_port4_param_port_4_ptp_enable_i(i_p4_port_params[19]),
          .sscsrif_port4_param_port_4_drinpr_presence_i(1'b0),
          .sscsrif_port5_param_port_5_profile_i(i_p5_port_params[6:1]),
          .sscsrif_port5_param_port_5_subprofile_i(i_p5_port_params[16:12]),
          .sscsrif_port5_param_port_5_databus_width_i(i_p5_port_params[9:7]),
          .sscsrif_port5_param_port_5_lowspeed_eth_param_i(i_p5_port_params[11:10]),
          .sscsrif_port5_param_port_5_rsfec_enable_i(i_p5_port_params[17]),
          .sscsrif_port5_param_port_5_anlt_enable_i(i_p5_port_params[18]),
          .sscsrif_port5_param_port_5_ptp_enable_i(i_p5_port_params[19]),
          .sscsrif_port5_param_port_5_drinpr_presence_i(1'b0),
          .sscsrif_port6_param_port_6_profile_i(i_p6_port_params[6:1]),
          .sscsrif_port6_param_port_6_subprofile_i(i_p6_port_params[16:12]),
          .sscsrif_port6_param_port_6_databus_width_i(i_p6_port_params[9:7]),
          .sscsrif_port6_param_port_6_lowspeed_eth_param_i(i_p6_port_params[11:10]),
          .sscsrif_port6_param_port_6_rsfec_enable_i(i_p6_port_params[17]),
          .sscsrif_port6_param_port_6_anlt_enable_i(i_p6_port_params[18]),
          .sscsrif_port6_param_port_6_ptp_enable_i(i_p6_port_params[19]),
          .sscsrif_port6_param_port_6_drinpr_presence_i(1'b0),
          .sscsrif_port7_param_port_7_profile_i(i_p7_port_params[6:1]),
          .sscsrif_port7_param_port_7_subprofile_i(i_p7_port_params[16:12]),
          .sscsrif_port7_param_port_7_databus_width_i(i_p7_port_params[9:7]),
          .sscsrif_port7_param_port_7_lowspeed_eth_param_i(i_p7_port_params[11:10]),
          .sscsrif_port7_param_port_7_rsfec_enable_i(i_p7_port_params[17]),
          .sscsrif_port7_param_port_7_anlt_enable_i(i_p7_port_params[18]),
          .sscsrif_port7_param_port_7_ptp_enable_i(i_p7_port_params[19]),
          .sscsrif_port7_param_port_7_drinpr_presence_i(1'b0),
          .sscsrif_port8_param_port_8_profile_i(i_p8_port_params[6:1]),
          .sscsrif_port8_param_port_8_subprofile_i(i_p8_port_params[16:12]),
          .sscsrif_port8_param_port_8_databus_width_i(i_p8_port_params[9:7]),
          .sscsrif_port8_param_port_8_lowspeed_eth_param_i(i_p8_port_params[11:10]),
          .sscsrif_port8_param_port_8_rsfec_enable_i(i_p8_port_params[17]),
          .sscsrif_port8_param_port_8_anlt_enable_i(i_p8_port_params[18]),
          .sscsrif_port8_param_port_8_ptp_enable_i(i_p8_port_params[19]),
          .sscsrif_port8_param_port_8_drinpr_presence_i(1'b0),
          .sscsrif_port9_param_port_9_profile_i(i_p9_port_params[6:1]),
          .sscsrif_port9_param_port_9_subprofile_i(i_p9_port_params[16:12]),
          .sscsrif_port9_param_port_9_databus_width_i(i_p9_port_params[9:7]),
          .sscsrif_port9_param_port_9_lowspeed_eth_param_i(i_p9_port_params[11:10]),
          .sscsrif_port9_param_port_9_rsfec_enable_i(i_p9_port_params[17]),
          .sscsrif_port9_param_port_9_anlt_enable_i(i_p9_port_params[18]),
          .sscsrif_port9_param_port_9_ptp_enable_i(i_p9_port_params[19]),
          .sscsrif_port9_param_port_9_drinpr_presence_i(1'b0),
          .sscsrif_port10_param_port_10_profile_i(i_p10_port_params[6:1]),
          .sscsrif_port10_param_port_10_subprofile_i(i_p10_port_params[16:12]),
          .sscsrif_port10_param_port_10_databus_width_i(i_p10_port_params[9:7]),
          .sscsrif_port10_param_port_10_lowspeed_eth_param_i(i_p10_port_params[11:10]),
          .sscsrif_port10_param_port_10_rsfec_enable_i(i_p10_port_params[17]),
          .sscsrif_port10_param_port_10_anlt_enable_i(i_p10_port_params[18]),
          .sscsrif_port10_param_port_10_ptp_enable_i(i_p10_port_params[19]),
          .sscsrif_port10_param_port_10_drinpr_presence_i(1'b0),
          .sscsrif_port11_param_port_11_profile_i(i_p11_port_params[6:1]),
          .sscsrif_port11_param_port_11_subprofile_i(i_p11_port_params[16:12]),
          .sscsrif_port11_param_port_11_databus_width_i(i_p11_port_params[9:7]),
          .sscsrif_port11_param_port_11_lowspeed_eth_param_i(i_p11_port_params[11:10]),
          .sscsrif_port11_param_port_11_rsfec_enable_i(i_p11_port_params[17]),
          .sscsrif_port11_param_port_11_anlt_enable_i(i_p11_port_params[18]),
          .sscsrif_port11_param_port_11_ptp_enable_i(i_p11_port_params[19]),
          .sscsrif_port11_param_port_11_drinpr_presence_i(1'b0),
          .sscsrif_port12_param_port_12_profile_i(i_p12_port_params[6:1]),
          .sscsrif_port12_param_port_12_subprofile_i(i_p12_port_params[16:12]),
          .sscsrif_port12_param_port_12_databus_width_i(i_p12_port_params[9:7]),
          .sscsrif_port12_param_port_12_lowspeed_eth_param_i(i_p12_port_params[11:10]),
          .sscsrif_port12_param_port_12_rsfec_enable_i(i_p12_port_params[17]),
          .sscsrif_port12_param_port_12_anlt_enable_i(i_p12_port_params[18]),
          .sscsrif_port12_param_port_12_ptp_enable_i(i_p12_port_params[19]),
          .sscsrif_port12_param_port_12_drinpr_presence_i(1'b0),
          .sscsrif_port13_param_port_13_profile_i(i_p13_port_params[6:1]),
          .sscsrif_port13_param_port_13_subprofile_i(i_p13_port_params[16:12]),
          .sscsrif_port13_param_port_13_databus_width_i(i_p13_port_params[9:7]),
          .sscsrif_port13_param_port_13_lowspeed_eth_param_i(i_p13_port_params[11:10]),
          .sscsrif_port13_param_port_13_rsfec_enable_i(i_p13_port_params[17]),
          .sscsrif_port13_param_port_13_anlt_enable_i(i_p13_port_params[18]),
          .sscsrif_port13_param_port_13_ptp_enable_i(i_p13_port_params[19]),
          .sscsrif_port13_param_port_13_drinpr_presence_i(1'b0),
          .sscsrif_port14_param_port_14_profile_i(i_p14_port_params[6:1]),
          .sscsrif_port14_param_port_14_subprofile_i(i_p14_port_params[16:12]),
          .sscsrif_port14_param_port_14_databus_width_i(i_p14_port_params[9:7]),
          .sscsrif_port14_param_port_14_lowspeed_eth_param_i(i_p14_port_params[11:10]),
          .sscsrif_port14_param_port_14_rsfec_enable_i(i_p14_port_params[17]),
          .sscsrif_port14_param_port_14_anlt_enable_i(i_p14_port_params[18]),
          .sscsrif_port14_param_port_14_ptp_enable_i(i_p14_port_params[19]),
          .sscsrif_port14_param_port_14_drinpr_presence_i(1'b0),
          .sscsrif_port15_param_port_15_profile_i(i_p15_port_params[6:1]),
          .sscsrif_port15_param_port_15_subprofile_i(i_p15_port_params[16:12]),
          .sscsrif_port15_param_port_15_databus_width_i(i_p15_port_params[9:7]),
          .sscsrif_port15_param_port_15_lowspeed_eth_param_i(i_p15_port_params[11:10]),
          .sscsrif_port15_param_port_15_rsfec_enable_i(i_p15_port_params[17]),
          .sscsrif_port15_param_port_15_anlt_enable_i(i_p15_port_params[18]),
          .sscsrif_port15_param_port_15_ptp_enable_i(i_p15_port_params[19]),
          .sscsrif_port15_param_port_15_drinpr_presence_i(1'b0),
          .sscsrif_port16_param_port_16_profile_i(i_p16_port_params[6:1]),
          .sscsrif_port16_param_port_16_subprofile_i(i_p16_port_params[16:12]),
          .sscsrif_port16_param_port_16_databus_width_i(i_p16_port_params[9:7]),
          .sscsrif_port16_param_port_16_lowspeed_eth_param_i(i_p16_port_params[11:10]),
          .sscsrif_port16_param_port_16_rsfec_enable_i(i_p16_port_params[17]),
          .sscsrif_port16_param_port_16_anlt_enable_i(i_p16_port_params[18]),
          .sscsrif_port16_param_port_16_ptp_enable_i(i_p16_port_params[19]),
          .sscsrif_port16_param_port_16_drinpr_presence_i(1'b0),
          .sscsrif_port17_param_port_17_profile_i(i_p17_port_params[6:1]),
          .sscsrif_port17_param_port_17_subprofile_i(i_p17_port_params[16:12]),
          .sscsrif_port17_param_port_17_databus_width_i(i_p17_port_params[9:7]),
          .sscsrif_port17_param_port_17_lowspeed_eth_param_i(i_p17_port_params[11:10]),
          .sscsrif_port17_param_port_17_rsfec_enable_i(i_p17_port_params[17]),
          .sscsrif_port17_param_port_17_anlt_enable_i(i_p17_port_params[18]),
          .sscsrif_port17_param_port_17_ptp_enable_i(i_p17_port_params[19]),
          .sscsrif_port17_param_port_17_drinpr_presence_i(1'b0),
          .sscsrif_port18_param_port_18_profile_i(i_p18_port_params[6:1]),
          .sscsrif_port18_param_port_18_subprofile_i(i_p18_port_params[16:12]),
          .sscsrif_port18_param_port_18_databus_width_i(i_p18_port_params[9:7]),
          .sscsrif_port18_param_port_18_lowspeed_eth_param_i(i_p18_port_params[11:10]),
          .sscsrif_port18_param_port_18_rsfec_enable_i(i_p18_port_params[17]),
          .sscsrif_port18_param_port_18_anlt_enable_i(i_p18_port_params[18]),
          .sscsrif_port18_param_port_18_ptp_enable_i(i_p18_port_params[19]),
          .sscsrif_port18_param_port_18_drinpr_presence_i(1'b0),
          .sscsrif_port19_param_port_19_profile_i(i_p19_port_params[6:1]),
          .sscsrif_port19_param_port_19_subprofile_i(i_p19_port_params[16:12]),
          .sscsrif_port19_param_port_19_databus_width_i(i_p19_port_params[9:7]),
          .sscsrif_port19_param_port_19_lowspeed_eth_param_i(i_p19_port_params[11:10]),
          .sscsrif_port19_param_port_19_rsfec_enable_i(i_p19_port_params[17]),
          .sscsrif_port19_param_port_19_anlt_enable_i(i_p19_port_params[18]),
          .sscsrif_port19_param_port_19_ptp_enable_i(i_p19_port_params[19]),
          .sscsrif_port19_param_port_19_drinpr_presence_i(1'b0),

          .sscsrif_port0_param_port_0_ready_latency_i(PORT0_READY_LATENCY),
          .sscsrif_port1_param_port_1_ready_latency_i(PORT1_READY_LATENCY),
          .sscsrif_port2_param_port_2_ready_latency_i(PORT2_READY_LATENCY),
          .sscsrif_port3_param_port_3_ready_latency_i(PORT3_READY_LATENCY),
          .sscsrif_port4_param_port_4_ready_latency_i(PORT4_READY_LATENCY),
          .sscsrif_port5_param_port_5_ready_latency_i(PORT5_READY_LATENCY),
          .sscsrif_port6_param_port_6_ready_latency_i(PORT6_READY_LATENCY),
          .sscsrif_port7_param_port_7_ready_latency_i(PORT7_READY_LATENCY),
          .sscsrif_port8_param_port_8_ready_latency_i(PORT8_READY_LATENCY),
          .sscsrif_port9_param_port_9_ready_latency_i(PORT9_READY_LATENCY),
          .sscsrif_port10_param_port_10_ready_latency_i(PORT10_READY_LATENCY),
          .sscsrif_port11_param_port_11_ready_latency_i(PORT11_READY_LATENCY),
          .sscsrif_port12_param_port_12_ready_latency_i(PORT12_READY_LATENCY),
          .sscsrif_port13_param_port_13_ready_latency_i(PORT13_READY_LATENCY),
          .sscsrif_port14_param_port_14_ready_latency_i(PORT14_READY_LATENCY),
          .sscsrif_port15_param_port_15_ready_latency_i(PORT15_READY_LATENCY),
          .sscsrif_port16_param_port_16_ready_latency_i(PORT16_READY_LATENCY),
          .sscsrif_port17_param_port_17_ready_latency_i(PORT17_READY_LATENCY),
          .sscsrif_port18_param_port_18_ready_latency_i(PORT18_READY_LATENCY),
          .sscsrif_port19_param_port_19_ready_latency_i(PORT19_READY_LATENCY),
          //
		  .sscsrif_hssi_eth_port0_status_o_ehip_ready_i(i_p0_ehip_ready),
          .sscsrif_hssi_eth_port0_status_o_rx_hi_ber_i(i_p0_rx_hi_ber),
          .sscsrif_hssi_eth_port0_status_o_cdr_lock_i(i_p0_cdr_lock),
          .sscsrif_hssi_eth_port0_status_rx_am_lock_i(i_p0_rx_am_lock),
          .sscsrif_hssi_eth_port0_status_rx_block_lock_i(i_p0_rx_block_lock),
          .sscsrif_hssi_eth_port0_status_rx_pcs_ready_i(i_p0_link_status[2]),
          .sscsrif_hssi_eth_port0_status_tx_lanes_stable_i(i_p0_link_status[1]),
          .sscsrif_hssi_eth_port0_status_tx_pll_locked_i(i_p0_link_status[0]),
          .sscsrif_hssi_eth_port0_status_o_ehip0_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port0_status_o_ehip1_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port0_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port0_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port0_status_local_fault_status_hwset(i_p0_local_fault_status),
          .sscsrif_hssi_eth_port0_status_remote_fault_status_hwset(i_p0_remote_fault_status),
          .sscsrif_hssi_eth_port0_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port0_status_unidirectional_remote_fault_dis_i(1'b0),
	      .sscsrif_hssi_eth_port0_status_parity_error_hwset (i_p0_axi_st_tx_parity_error),
          .sscsrif_hssi_eth_port0_status_local_fault_status_direct_i(i_p0_local_fault_status),
          .sscsrif_hssi_eth_port0_status_remote_fault_status_direct_i(i_p0_remote_fault_status),
          //
          .sscsrif_hssi_eth_port0_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port0_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port0_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port0_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port0_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port0_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port0_status_load_recipe_err_i('0), //load_recipe_error[0]),
          .sscsrif_hssi_eth_port0_status_cal_err_i('0),
          .sscsrif_hssi_eth_port1_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port1_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port1_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port1_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port1_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port1_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port1_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port1_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port1_status_o_ehip0_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port1_status_o_ehip1_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port1_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port1_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port1_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port1_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port1_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port1_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port1_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port1_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port1_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port1_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port1_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port1_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port1_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port1_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port1_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port1_status_load_recipe_err_i('0),//load_recipe_error[1]),
          .sscsrif_hssi_eth_port1_status_cal_err_i('0),//xcvr_cal_error[1]),
          .sscsrif_hssi_eth_port2_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port2_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port2_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port2_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port2_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port2_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port2_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port2_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port2_status_o_ehip0_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port2_status_o_ehip1_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port2_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port2_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port2_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port2_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port2_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port2_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port2_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port2_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port2_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port2_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port2_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port2_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port2_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port2_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port2_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port2_status_load_recipe_err_i('0),//load_recipe_error[2]),
          .sscsrif_hssi_eth_port2_status_cal_err_i('0),//xcvr_cal_error[2]),
          .sscsrif_hssi_eth_port3_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port3_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port3_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port3_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port3_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port3_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port3_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port3_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port3_status_o_ehip0_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port3_status_o_ehip1_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port3_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port3_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port3_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port3_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port3_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port3_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port3_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port3_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port3_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port3_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port3_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port3_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port3_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port3_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port3_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port3_status_load_recipe_err_i('0),//load_recipe_error[3]),
          .sscsrif_hssi_eth_port3_status_cal_err_i('0),//xcvr_cal_error[3]),
          .sscsrif_hssi_eth_port4_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port4_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port4_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port4_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port4_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port4_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port4_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port4_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port4_status_o_ehip2_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port4_status_o_ehip3_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port4_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port4_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port4_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port4_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port4_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port4_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port4_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port4_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port4_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port4_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port4_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port4_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port4_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port4_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port4_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port4_status_load_recipe_err_i('0),//load_recipe_error[4]),
          .sscsrif_hssi_eth_port4_status_cal_err_i('0),//xcvr_cal_error[4]),
          .sscsrif_hssi_eth_port5_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port5_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port5_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port5_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port5_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port5_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port5_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port5_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port5_status_o_ehip2_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port5_status_o_ehip3_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port5_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port5_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port5_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port5_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port5_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port5_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port5_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port5_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port5_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port5_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port5_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port5_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port5_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port5_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port5_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port5_status_load_recipe_err_i('0),//load_recipe_error[5]),
          .sscsrif_hssi_eth_port5_status_cal_err_i('0),//xcvr_cal_error[5]),
          .sscsrif_hssi_eth_port6_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port6_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port6_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port6_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port6_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port6_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port6_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port6_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port6_status_o_ehip2_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port6_status_o_ehip3_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port6_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port6_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port6_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port6_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port6_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port6_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port6_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port6_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port6_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port6_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port6_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port6_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port6_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port6_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port6_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port6_status_load_recipe_err_i('0),//load_recipe_error[6]),
          .sscsrif_hssi_eth_port6_status_cal_err_i('0),//xcvr_cal_error[6]),
          .sscsrif_hssi_eth_port7_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port7_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port7_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port7_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port7_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port7_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port7_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port7_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port7_status_o_ehip2_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port7_status_o_ehip3_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port7_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port7_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port7_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port7_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port7_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port7_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port7_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port7_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port7_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port7_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port7_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port7_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port7_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port7_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port7_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port7_status_load_recipe_err_i('0),//load_recipe_error[7]),
          .sscsrif_hssi_eth_port7_status_cal_err_i('0),//xcvr_cal_error[7]),
          .sscsrif_hssi_eth_port8_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port8_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port8_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port8_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port8_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port8_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port8_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port8_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port8_status_o_ehip4_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port8_status_o_ehip5_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port8_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port8_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port8_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port8_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port8_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port8_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port8_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port8_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port8_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port8_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port8_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port8_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port8_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port8_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port8_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port8_status_load_recipe_err_i('0),//load_recipe_error[8]),
          .sscsrif_hssi_eth_port8_status_cal_err_i('0),//xcvr_cal_error[8]),
          .sscsrif_hssi_eth_port9_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port9_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port9_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port9_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port9_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port9_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port9_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port9_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port9_status_o_ehip4_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port9_status_o_ehip5_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port9_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port9_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port9_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port9_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port9_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port9_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port9_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port9_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port9_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port9_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port9_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port9_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port9_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port9_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port9_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port9_status_load_recipe_err_i('0),//load_recipe_error[9]),
          .sscsrif_hssi_eth_port9_status_cal_err_i('0),//xcvr_cal_error[9]),
          .sscsrif_hssi_eth_port10_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port10_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port10_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port10_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port10_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port10_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port10_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port10_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port10_status_o_ehip4_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port10_status_o_ehip5_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port10_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port10_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port10_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port10_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port10_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port10_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port10_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port10_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port10_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port10_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port10_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port10_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port10_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port10_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port10_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port10_status_load_recipe_err_i('0),//load_recipe_error[10]),
          .sscsrif_hssi_eth_port10_status_cal_err_i('0),//xcvr_cal_error[10]),
          .sscsrif_hssi_eth_port11_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port11_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port11_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port11_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port11_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port11_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port11_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port11_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port11_status_o_ehip4_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port11_status_o_ehip5_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port11_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port11_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port11_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port11_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port11_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port11_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port11_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port11_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port11_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port11_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port11_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port11_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port11_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port11_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port11_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port11_status_load_recipe_err_i('0),//load_recipe_error[11]),
          .sscsrif_hssi_eth_port11_status_cal_err_i('0),//xcvr_cal_error[11]),
          .sscsrif_hssi_eth_port12_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port12_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port12_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port12_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port12_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port12_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port12_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port12_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port12_status_o_ehip6_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port12_status_o_ehip7_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port12_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port12_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port12_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port12_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port12_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port12_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port12_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port12_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port12_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port12_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port12_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port12_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port12_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port12_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port12_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port12_status_load_recipe_err_i('0),//load_recipe_error[12]),
          .sscsrif_hssi_eth_port12_status_cal_err_i('0),//xcvr_cal_error[12]),
          .sscsrif_hssi_eth_port13_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port13_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port13_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port13_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port13_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port13_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port13_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port13_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port13_status_o_ehip6_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port13_status_o_ehip7_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port13_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port13_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port13_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port13_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port13_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port13_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port13_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port13_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port13_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port13_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port13_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port13_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port13_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port13_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port13_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port13_status_load_recipe_err_i('0),//load_recipe_error[13]),
          .sscsrif_hssi_eth_port13_status_cal_err_i('0),//xcvr_cal_error[13]),
          .sscsrif_hssi_eth_port14_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port14_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port14_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port14_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port14_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port14_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port14_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port14_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port14_status_o_ehip6_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port14_status_o_ehip7_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port14_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port14_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port14_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port14_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port14_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port14_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port14_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port14_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port14_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port14_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port14_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port14_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port14_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port14_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port14_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port14_status_load_recipe_err_i('0),//load_recipe_error[14]),
          .sscsrif_hssi_eth_port14_status_cal_err_i('0),//xcvr_cal_error[14]),
          .sscsrif_hssi_eth_port15_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port15_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port15_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port15_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port15_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port15_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port15_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port15_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port15_status_o_ehip6_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port15_status_o_ehip7_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port15_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port15_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port15_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port15_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port15_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port15_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port15_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port15_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port15_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port15_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port15_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port15_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port15_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port15_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port15_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port15_status_load_recipe_err_i('0),//load_recipe_error[15]),
          .sscsrif_hssi_eth_port15_status_cal_err_i('0),//xcvr_cal_error[15]),
          .sscsrif_hssi_eth_port16_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port16_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port16_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port16_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port16_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port16_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port16_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port16_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port16_status_o_ehip8_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port16_status_o_ehip9_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port16_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port16_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port16_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port16_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port16_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port16_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port16_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port16_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port16_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port16_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port16_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port16_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port16_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port16_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port16_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port16_status_load_recipe_err_i('0),//load_recipe_error[16]),
          .sscsrif_hssi_eth_port16_status_cal_err_i('0),//xcvr_cal_error[16]),
          .sscsrif_hssi_eth_port17_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port17_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port17_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port17_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port17_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port17_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port17_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port17_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port17_status_o_ehip8_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port17_status_o_ehip9_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port17_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port17_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port17_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port17_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port17_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port17_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port17_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port17_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port17_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port17_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port17_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port17_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port17_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port17_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port17_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port17_status_load_recipe_err_i('0),//load_recipe_error[17]),
          .sscsrif_hssi_eth_port17_status_cal_err_i('0),//xcvr_cal_error[17]),
          .sscsrif_hssi_eth_port18_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port18_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port18_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port18_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port18_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port18_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port18_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port18_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port18_status_o_ehip8_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port18_status_o_ehip9_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port18_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port18_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port18_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port18_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port18_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port18_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port18_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port18_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port18_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port18_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port18_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port18_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port18_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port18_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port18_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port18_status_load_recipe_err_i('0),//load_recipe_error[18]),
          .sscsrif_hssi_eth_port18_status_cal_err_i('0),//xcvr_cal_error[18]),
          .sscsrif_hssi_eth_port19_status_o_ehip_ready_i(1'b0),
          .sscsrif_hssi_eth_port19_status_o_rx_hi_ber_i(1'b0),
          .sscsrif_hssi_eth_port19_status_o_cdr_lock_i(1'b0),
          .sscsrif_hssi_eth_port19_status_rx_am_lock_i(1'b0),
          .sscsrif_hssi_eth_port19_status_rx_block_lock_i(1'b0),
          .sscsrif_hssi_eth_port19_status_rx_pcs_ready_i(1'b0),
          .sscsrif_hssi_eth_port19_status_tx_lanes_stable_i(1'b0),
          .sscsrif_hssi_eth_port19_status_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port19_status_o_ehip8_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port19_status_o_ehip9_tx_pll_locked_i(1'b0),
          .sscsrif_hssi_eth_port19_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port19_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port19_status_local_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port19_status_remote_fault_status_hwset(1'b0),
          .sscsrif_hssi_eth_port19_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port19_status_unidirectional_remote_fault_dis_i(1'b0),
	  .sscsrif_hssi_eth_port19_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port19_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port19_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port19_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port19_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port19_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port19_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port19_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port19_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port19_status_load_recipe_err_i('0),//load_recipe_error[19]),
          .sscsrif_hssi_eth_port19_status_cal_err_i('0),//xcvr_cal_error[19]),

         .sscsrif_hssi_eth_port0_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port1_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port2_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port3_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port4_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port5_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port6_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port7_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port8_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port9_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port10_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port11_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port12_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port13_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port14_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port15_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port16_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port17_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port18_status_anlt_port_state_i('0),
         .sscsrif_hssi_eth_port19_status_anlt_port_state_i('0),
          //
          .sscsrif_feature_guid_l_low_low_guid_i(32'h1841_8b9d),
          .sscsrif_feature_guid_l_high_low_guid_i(32'h99a_078ad),
          .sscsrif_feature_guid_h_low_high_guid_i(32'hd9db_4a9b),
          .sscsrif_feature_guid_h_high_high_guid_i(32'h4118_a7cb),
          .sscsrif_csr_addr_l_csr_rel_i(1'b0),
          .sscsrif_csr_addr_l_feature_csr_i(31'h60),
          .sscsrif_csr_addr_h_feature_csr_i(32'h00),
          .sscsrif_csr_size_grp_l_instance_id_i(DFHv1_INSTID),
          .sscsrif_csr_size_grp_l_grouping_id_i(15'h0),
          .sscsrif_csr_size_grp_l_has_params_i(1'b0),
          .sscsrif_csr_size_grp_h_csr_size_i(32'h31C),
          //
          .sscsrif_dfh_hi_feature_minor_revision_i(DFHv0_FEA_MINOR),
          .sscsrif_dfh_hi_dfh_version_i(DFHv0_FEA_VER),
          //
          .sscsrif_dfh_lo_feature_id_i(DFHv0_FEA_FEAID),
          .sscsrif_dfh_lo_feature_rev_i(DFHv0_FEA_REV),
          .sscsrif_dfh_lo_dfh_byte_offset_i(DFHv0_FEA_NXT_LO),
          .sscsrif_dfh_hi_dfh_byte_offset_i(DFHv0_FEA_NXT_HI),
          .sscsrif_dfh_hi_end_of_list_i(DFHv0_FEA_EOL),
          .sscsrif_dfh_hi_feature_type_i(DFHv0_FEA_FEATYPE),
          .sscsrif_gmii_xgmii_tx_latency_tx_latency_i(24'd0),
          .sscsrif_gmii_xgmii_rx_latency_rx_latency_i(24'h0),
          .sscsrif_hssi_tse_ctrl_Magic_wakeup_i(1'b0),
          //
          //.sscsrif_hssi_hotplug_debug_ctrl_hotplug_control(o_hotplug_control),
          //.sscsrif_hssi_hotplug_debug_sts_hotplug_status_i(hotplug_status),
          
          .sscsrif_hssi_hotplug_debug_sts_hotplug_complete_i(1'b0),
          .sscsrif_hssi_hotplug_debug_sts_hotplug_vsr_lr_i(1'b0),
          .sscsrif_hssi_hotplug_debug_sts_hotplug_busy_i(1'b0),
          .sscsrif_hssi_hotplug_debug_sts_hotplug_paused_i(1'b0),
          .sscsrif_hssi_hotplug_debug_sts_hotplug_disabled_i(1'b0),
          .sscsrif_hssi_hotplug_debug_sts_hotplug_fail_i(1'b0),

          .sscsrif_hssi_debug_ctrl_override_led_speed(o_csr_led_speed),
          .sscsrif_hssi_debug_ctrl_override_led_status(o_csr_led_status),
          .sscsrif_hssi_debug_ctrl_port_led_status_override(o_csr_led_override_port),
          .sscsrif_hssi_debug_ctrl_led_status_override_enable(o_csr_led_override_en),
          .sscsrif_hssi_debug_ctrl_led_status_blinking_timer(o_csr_led_pulse_cntr)
          //
          );

//*********************************************************************************
// -- NIOS processor for Mail box and DR 
//*********************************************************************************

generate
if (DISABLE_DR_CPU == 0)
begin : NIOS_CPU

  always @(posedge app_ss_lite_clk)
  begin
    sscsrif_hssi_cmd_sts_read_command_d1 <= (sscsrif_hssi_cmd_sts_read_command && ~sscsrif_hssi_cmd_sts_write_command && ~sscsrif_hssi_cmd_sts_ack_trans);
    sscsrif_hssi_cmd_sts_read_command_d2 <= sscsrif_hssi_cmd_sts_read_command_d1;
    sscsrif_hssi_cmd_sts_read_command_pos_edge <= sscsrif_hssi_cmd_sts_read_command_d1 && ~sscsrif_hssi_cmd_sts_read_command_d2;
    sscsrif_hssi_cmd_sts_write_command_d1 <= (sscsrif_hssi_cmd_sts_write_command && ~sscsrif_hssi_cmd_sts_read_command && ~sscsrif_hssi_cmd_sts_ack_trans);
    sscsrif_hssi_cmd_sts_write_command_d2 <= sscsrif_hssi_cmd_sts_write_command_d1;
    sscsrif_hssi_cmd_sts_write_command_pos_edge <= sscsrif_hssi_cmd_sts_write_command_d1 && ~sscsrif_hssi_cmd_sts_write_command_d2;
    nios_command_complete_d1 <= nios_command_complete;
    nios_command_complete_d2 <= nios_command_complete_d1;
  end

  assign nios_command_start = (sscsrif_hssi_cmd_sts_read_command_pos_edge | sscsrif_hssi_cmd_sts_write_command_pos_edge);

  always @(posedge app_ss_lite_clk or negedge i_ss_nios_rst_n)
  begin
    if(~i_ss_nios_rst_n)
      sscsrif_hssi_cmd_sts_ack_trans_hwset <= 1'b0; //nios cpu sets to 1 after cpu intialiation
    else if(nios_command_start)
      sscsrif_hssi_cmd_sts_ack_trans_hwset <= 1'b0;
    else if(nios_command_complete_d1 && ~nios_command_complete_d2)
      sscsrif_hssi_cmd_sts_ack_trans_hwset <= 1'b1;
  end

  always @(posedge app_ss_lite_clk or negedge i_ss_nios_rst_n)
  begin
    if(~i_ss_nios_rst_n) begin
      sscsrif_hssi_cmd_sts_busy_i <= 1'b1;
      //rd_or_wr_pend_for_nios <= 1'b0;
    end else if(nios_command_start) begin
      sscsrif_hssi_cmd_sts_busy_i <= 1'b1;
      //rd_or_wr_pend_for_nios <= 1'b1;
    end else if(nios_command_complete_d1 && ~nios_command_complete_d2) begin
      sscsrif_hssi_cmd_sts_busy_i <= 1'b0;
      //rd_or_wr_pend_for_nios <= 1'b0;
    end
    //else if(nios_cntr == )
    //  sscsrif_hssi_cmd_sts_busy_i <= 1'b0;
  end

  always @(posedge app_ss_lite_clk or negedge i_ss_nios_rst_n)
  begin
    if(~i_ss_nios_rst_n)
      sscsrif_hssi_cmd_sts_error_i <= 1'b0;
    else if(nios_command_start)
      sscsrif_hssi_cmd_sts_error_i <= 1'b0;
    else if(nios_command_complete_d1 && ~nios_command_complete_d2)
      sscsrif_hssi_cmd_sts_error_i <= nios_command_error | nios_hung_error;
    //else if(sscsrif_hssi_cmd_sts_busy_i)
    //  sscsrif_hssi_cmd_sts_error_i <= nios_hung_error;
    //else if(nios_cntr == )
    //  sscsrif_hssi_cmd_sts_error_i <= 1'b1;
  end

  always @(posedge app_ss_lite_clk or negedge i_ss_nios_rst_n)
  begin
    if(~i_ss_nios_rst_n)
      nios_command_complete_ack <= 1'b0;
    else if(~nios_command_complete_d1 && nios_command_complete_d2)
      nios_command_complete_ack <= 1'b0;
    else if(nios_command_complete_d1 && ~nios_command_complete_d2)
      nios_command_complete_ack <= 1'b1;
  end

  hssi_ss_f_dr #(.DISABLE_DR_CPU(DISABLE_DR_CPU), .SIM_MODE(SIM_MODE), .SIM_FAST_EN(SIM_FAST_EN)) U_HSSI_SS_CPU
          (
          .i_reconfig_clk(app_ss_lite_clk),
          .i_csr_rst_in(~i_ss_nios_rst_n),
          .i_ss_rst_done(1'b1),
          //
          .i_cpu_cmd_type({nios_command_complete_ack, sscsrif_hssi_cmd_sts_ack_trans, sscsrif_hssi_cmd_sts_write_command, sscsrif_hssi_cmd_sts_read_command}),
          .i_xcvr_reg_byte_no(sscsrif_hssi_cmd_sts_xcvr_reg_byte_no),
          .i_cpu_cmd_start(nios_command_start),
          .i_cpu_command({sscsrif_hssi_ctrl_addr_addr_msb, sscsrif_hssi_ctrl_addr_port_addr, sscsrif_hssi_ctrl_addr_sal_command}),
          .i_cpu_wr_data(sscsrif_hssi_wr_data_write_data),
          .o_cpu_cmd_complete(nios_command_complete),
          .o_cpu_cmd_error(nios_command_error),
          .o_cpu_rd_data(sscsrif_hssi_rd_data_write_data_i),
          //
          .i_p0_port_params(i_p0_port_params),
          .i_p1_port_params(i_p1_port_params),
          .i_p2_port_params(i_p2_port_params),
          .i_p3_port_params(i_p3_port_params),
          .i_p4_port_params(i_p4_port_params),
          .i_p5_port_params(i_p5_port_params),
          .i_p6_port_params(i_p6_port_params),
          .i_p7_port_params(i_p7_port_params),
          .i_p8_port_params(i_p8_port_params),
          .i_p9_port_params(i_p9_port_params),
          .i_p10_port_params(i_p10_port_params),
          .i_p11_port_params(i_p11_port_params),
          .i_p12_port_params(i_p12_port_params),
          .i_p13_port_params(i_p13_port_params),
          .i_p14_port_params(i_p14_port_params),
          .i_p15_port_params(i_p15_port_params),
          .i_p16_port_params(i_p16_port_params),
          .i_p17_port_params(i_p17_port_params),
          .i_p18_port_params(i_p18_port_params),
          .i_p19_port_params(i_p19_port_params),
          .o_p0_pio_axi_st_bridge_rst_n(o_p0_pio_axi_st_bridge_rst_n),   // PIO_0 from NIOS
          .o_p0_pio_ehip_tx_rst_n(o_p0_pio_ehip_tx_rst_n),         // PIO_1 from NIOS
          .o_p0_pio_ehip_rx_rst_n(o_p0_pio_ehip_rx_rst_n),         // PIO_2 from NIOS
          .i_p0_pio_ehip_tx_rst_ack_n(i_p0_ehip_tx_rst_ack_n),     // reset ack from ehip to nios 
          .i_p0_pio_ehip_rx_rst_ack_n(i_p0_ehip_rx_rst_ack_n),     // reset ack from ehip to nios 
          .o_p0_pio_ereset_n(o_p0_ereset_n),                   // PIO_3 from NIOS
          .i_xcvr_ready(i_xcvr_ready),
          .i_tx_pma_ready(i_tx_pma_ready),
          .i_rx_pma_ready(i_rx_pma_ready),
          .o_load_recipe_error(load_recipe_error),
          .o_xcvr_cal_error(xcvr_cal_error),
          .o_hotplug_disable_fm(o_hotplug_disable_fm),
          .i_hotplug_paused_fm(i_hotplug_paused_fm),
          //
          .o_cpu_reconfig_addr(cpu_reconfig_addr),
          .o_cpu_reconfig_read(cpu_reconfig_read),
          .o_cpu_reconfig_write(cpu_reconfig_write),
          .o_cpu_reconfig_writedata(cpu_reconfig_writedata),
          .o_cpu_reconfig_byteenable(cpu_reconfig_byteenable),
          .i_cpu_reconfig_readdata(cpu_reconfig_readdata_reg),
          .i_cpu_reconfig_readdata_valid(cpu_reconfig_readdata_valid_reg),
          .i_cpu_reconfig_waitrequest(cpu_reconfig_waitrequest_reg)
          );

  always @(posedge app_ss_lite_clk or negedge i_ss_nios_rst_n)
  begin
    if(~i_ss_nios_rst_n)
        po_pma_cal_done <= 1'b0;
    else if(nios_command_complete_d2 || (SIM_MODE == 1)) //TBD
        po_pma_cal_done <= 1'b1;
    else
        po_pma_cal_done <= po_pma_cal_done; 
  end
end
else
begin : NO_NIOS

  always_comb 
  begin
      sscsrif_hssi_cmd_sts_ack_trans_hwset <= 1'b0;
      sscsrif_hssi_cmd_sts_busy_i          <= 1'b0;
      sscsrif_hssi_cmd_sts_error_i         <= 1'b0;
      po_pma_cal_done                      <= 1'b1;
  end
  assign o_po_pma_cal_done = po_pma_cal_done;
  assign cpu_reconfig_addr = 'd0;
  assign cpu_reconfig_read = 'd0;
  assign cpu_reconfig_write = 'd0;
  assign cpu_reconfig_writedata = 'd0;
  assign cpu_reconfig_byteenable = 'd0;
  assign sscsrif_hssi_rd_data_write_data_i = 'd0;

end
endgenerate

endmodule


