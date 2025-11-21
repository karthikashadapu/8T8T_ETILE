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
// Module            : hssi_ss_top.sv
// Description       : 
// Author            : Sibajit Patnaik
// Created           : 04-Aug-2020
// Changes           : Initial top interface and parameter to support PO - 
//                   : 2x4x10GE which is 8x10GE for HSSI SS
// ==========================================================================
// synthesis translate_off

`timescale 1ns / 1ps
// synthesis translate_on
(* altera_attribute = "-name UNCONNECTED_OUTPUT_PORT_MESSAGE_LEVEL OFF" *)

// ==========================================================================
// Module Declaration
// ==========================================================================

module hssi_ss_1_hssi_ss_2500_q5p32my 
#(
// -----------------------------------------------------
// Parameters Name              = Default  //Description
// -----------------------------------------------------
//  Child IP parameters, port wise
//  HSSI SS top level parameters
     parameter PORT0_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT0_ENABLED      	                  = 0,
     parameter PORT0_PROFILE                         = "10GbE",
     parameter PORT0_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT0_RSFEC        	                  = 0,
     parameter PORT0_PTP          	                  = 0,
     parameter [0:0] PORT0_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT0_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT0_READY_LATENCY             = 4'h0,
     parameter PORT0_DATA_WIDTH                      = 64,
     parameter PORT0_PHY_RATE                        = 0,
     parameter PORT0_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT0_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT0_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT1_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT1_ENABLED      	                  = 0,
     parameter PORT1_PROFILE                         = "10GbE",
     parameter PORT1_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT1_RSFEC        	                  = 0,
     parameter PORT1_PTP          	                  = 0,
     parameter [0:0] PORT1_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT1_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT1_READY_LATENCY             = 4'h0,
     parameter PORT1_DATA_WIDTH                      = 64,
     parameter PORT1_PHY_RATE                        = 0,
     parameter PORT1_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT1_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT1_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT2_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT2_ENABLED      	                  = 0,
     parameter PORT2_PROFILE                         = "10GbE",
     parameter PORT2_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT2_RSFEC        	                  = 0,
     parameter PORT2_PTP          	                  = 0,
     parameter [0:0] PORT2_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT2_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT2_READY_LATENCY             = 4'h0,
     parameter PORT2_DATA_WIDTH                      = 64,
     parameter PORT2_PHY_RATE                        = 0,
     parameter PORT2_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT2_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT2_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT3_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT3_ENABLED      	                  = 0,
     parameter PORT3_PROFILE                         = "10GbE",
     parameter PORT3_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT3_RSFEC        	                  = 0,
     parameter PORT3_PTP          	                  = 0,
     parameter [0:0] PORT3_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT3_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT3_READY_LATENCY             = 4'h0,
     parameter PORT3_DATA_WIDTH                      = 64,
     parameter PORT3_PHY_RATE                        = 0,
     parameter PORT3_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT3_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT3_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT4_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT4_ENABLED      	                  = 0,
     parameter PORT4_PROFILE                         = "10GbE",
     parameter PORT4_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT4_RSFEC        	                  = 0,
     parameter PORT4_PTP          	                  = 0,
     parameter [0:0] PORT4_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT4_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT4_READY_LATENCY             = 4'h0,
     parameter PORT4_DATA_WIDTH                      = 64,
     parameter PORT4_PHY_RATE                        = 0,
     parameter PORT4_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT4_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT4_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT5_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT5_ENABLED      	                  = 0,
     parameter PORT5_PROFILE                         = "10GbE",
     parameter PORT5_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT5_RSFEC        	                  = 0,
     parameter PORT5_PTP          	                  = 0,
     parameter [0:0] PORT5_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT5_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT5_READY_LATENCY             = 4'h0,
     parameter PORT5_DATA_WIDTH                      = 64,
     parameter PORT5_PHY_RATE                        = 0,
     parameter PORT5_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT5_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT5_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT6_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT6_ENABLED      	                  = 0,
     parameter PORT6_PROFILE                         = "10GbE",
     parameter PORT6_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT6_RSFEC        	                  = 0,
     parameter PORT6_PTP          	                  = 0,
     parameter [0:0] PORT6_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT6_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT6_READY_LATENCY             = 4'h0,
     parameter PORT6_DATA_WIDTH                      = 64,
     parameter PORT6_PHY_RATE                        = 0,
     parameter PORT6_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT6_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT6_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT7_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT7_ENABLED      	                  = 0,
     parameter PORT7_PROFILE                         = "10GbE",
     parameter PORT7_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT7_RSFEC        	                  = 0,
     parameter PORT7_PTP          	                  = 0,
     parameter [0:0] PORT7_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT7_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT7_READY_LATENCY             = 4'h0,
     parameter PORT7_DATA_WIDTH                      = 64,
     parameter PORT7_PHY_RATE                        = 0,
     parameter PORT7_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT7_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT7_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT8_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT8_ENABLED      	                  = 0,
     parameter PORT8_PROFILE                         = "10GbE",
     parameter PORT8_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT8_RSFEC        	                  = 0,
     parameter PORT8_PTP          	                  = 0,
     parameter [0:0] PORT8_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT8_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT8_READY_LATENCY             = 4'h0,
     parameter PORT8_DATA_WIDTH                      = 64,
     parameter PORT8_PHY_RATE                        = 0,
     parameter PORT8_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT8_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT8_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT9_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT9_ENABLED      	                  = 0,
     parameter PORT9_PROFILE                         = "10GbE",
     parameter PORT9_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT9_RSFEC        	                  = 0,
     parameter PORT9_PTP          	                  = 0,
     parameter [0:0] PORT9_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT9_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT9_READY_LATENCY             = 4'h0,
     parameter PORT9_DATA_WIDTH                      = 64,
     parameter PORT9_PHY_RATE                        = 0,
     parameter PORT9_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT9_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT9_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT10_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT10_ENABLED      	                  = 0,
     parameter PORT10_PROFILE                         = "10GbE",
     parameter PORT10_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT10_RSFEC        	                  = 0,
     parameter PORT10_PTP          	                  = 0,
     parameter [0:0] PORT10_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT10_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT10_READY_LATENCY             = 4'h0,
     parameter PORT10_DATA_WIDTH                      = 64,
     parameter PORT10_PHY_RATE                        = 0,
     parameter PORT10_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT10_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT10_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT11_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT11_ENABLED      	                  = 0,
     parameter PORT11_PROFILE                         = "10GbE",
     parameter PORT11_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT11_RSFEC        	                  = 0,
     parameter PORT11_PTP          	                  = 0,
     parameter [0:0] PORT11_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT11_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT11_READY_LATENCY             = 4'h0,
     parameter PORT11_DATA_WIDTH                      = 64,
     parameter PORT11_PHY_RATE                        = 0,
     parameter PORT11_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT11_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT11_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT12_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT12_ENABLED      	                  = 0,
     parameter PORT12_PROFILE                         = "10GbE",
     parameter PORT12_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT12_RSFEC        	                  = 0,
     parameter PORT12_PTP          	                  = 0,
     parameter [0:0] PORT12_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT12_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT12_READY_LATENCY             = 4'h0,
     parameter PORT12_DATA_WIDTH                      = 64,
     parameter PORT12_PHY_RATE                        = 0,
     parameter PORT12_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT12_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT12_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT13_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT13_ENABLED      	                  = 0,
     parameter PORT13_PROFILE                         = "10GbE",
     parameter PORT13_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT13_RSFEC        	                  = 0,
     parameter PORT13_PTP          	                  = 0,
     parameter [0:0] PORT13_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT13_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT13_READY_LATENCY             = 4'h0,
     parameter PORT13_DATA_WIDTH                      = 64,
     parameter PORT13_PHY_RATE                        = 0,
     parameter PORT13_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT13_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT13_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT14_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT14_ENABLED      	                  = 0,
     parameter PORT14_PROFILE                         = "10GbE",
     parameter PORT14_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT14_RSFEC        	                  = 0,
     parameter PORT14_PTP          	                  = 0,
     parameter [0:0] PORT14_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT14_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT14_READY_LATENCY             = 4'h0,
     parameter PORT14_DATA_WIDTH                      = 64,
     parameter PORT14_PHY_RATE                        = 0,
     parameter PORT14_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT14_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT14_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
     parameter PORT15_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT15_ENABLED      	                  = 0,
     parameter PORT15_PROFILE                         = "10GbE",
     parameter PORT15_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT15_RSFEC        	                  = 0,
     parameter PORT15_PTP          	                  = 0,
     parameter [0:0] PORT15_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT15_PKT_SEG_PARITY_EN         = 0,
     parameter [3:0] PORT15_READY_LATENCY             = 4'h0,
     parameter PORT15_DATA_WIDTH                      = 64,
     parameter PORT15_PHY_RATE                        = 0,
     parameter PORT15_DR_EXT_SUBSYS	                  = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT15_PR_DR_ENABLE    	              = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT15_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    //parameter PORT16_TBI_INTERFACE  = 0,       //Indicate the subsystem support for TBI interface. Supported value 0-1.
    //parameter PORT16_MDIO_INTERFACE = 0,       //Indicate the subsystem support for MDIO interface. Supported value 0-1.
    //parameter PORT16_PTP_CLOCK_MODE = "00",    //Use this signal to specify the clock mode. Supported value 0-3.
    //parameter PORT16_DR_AIB_MAP     = 16,      //source/destination port mapping after the dynamic reconfiguration. Value 16-32.
    parameter product               = "Agilex",//FPGA or eASIC products. Supported keyword "Agilex", "S10", "A10", "DM" and "DM2"
    parameter tiles	                = "E",     //FPGA tiles. Supported keyword "E", "H", F". Grey out if DM/DM2 (eASIC) and A10 are selected as product
    parameter NUM_PORTS             = 5'h8,    //Number of Ethernet ports, Enabled+Disabled, within the subsystem. Supported value 1-16. 
    parameter [4:0] NUM_ENABLED_PORTS = 5'h8,  //Number of Enabled Ethernet ports within the subsystem. Supported value 1-16. 
    parameter ENABLE_JTAG           = 0,       //Indicate the JTAG master instantiation. 0 - Disable, 1 - Enable
    parameter PARAM_DATA            = 32,      //AXI-Lite Data Width
    parameter SWITCH_EXT_SUBSYS     = 0,       //Indicate presence of L2 Switch Extension Subsystem presence. Supported value 0-1.
    parameter [23:0] SUBSYSTEM_RST_ACK_DEASSERT_DELAY = 24'h00C000,
    parameter [23:0] TX_RST_ACK_DEASSERT_DELAY = 24'h002000,
    parameter [23:0] RX_RST_ACK_DEASSERT_DELAY = 24'h002000,
    parameter [0:0]  SET_AXI_LITE_RESPONSE_TO_ZERO = 1'b0,
    parameter [7:0]  DFHv0_FEA_VER   = 8'h01,
    parameter [3:0]  DFHv0_FEA_MINOR    = 4'h0,
    parameter [0:0]  DFHv0_FEA_EOL      = 1'b0,
    parameter [23:0] DFHv0_FEA_NXT      = 24'h001000,
    parameter [3:0]  DFHv0_FEA_REV      = 4'h1,
    parameter [11:0] DFHv0_FEA_FEAID    = 12'h015,
    parameter [3:0]  DFHv0_FEA_FEATYPE  = 4'h3,
    parameter [15:0] DFHv1_INSTID   = 16'h0000,
    parameter DISABLE_DR_CPU        = 0,
    parameter ENABLE_ECC            = 0,    
    parameter SIM_MODE              = 0
    )(
  // ---------------
  // Reset Interface
  // --------------- 
  input                           subsystem_cold_rst_n,  //Complete SS reset, will resets SS, EHIP and NIOS
  output                          subsystem_cold_rst_ack_n,
        //Reset signals from SRC to ehip and other modules
  input                           i_p0_tx_rst_n,
  input                           i_p0_rx_rst_n,
  output                          o_p0_rx_rst_ack_n,
  output                          o_p0_tx_rst_ack_n,
  output                          o_p0_ereset_n,
  input                           i_p1_tx_rst_n,
  input                           i_p1_rx_rst_n,
  output                          o_p1_rx_rst_ack_n,
  output                          o_p1_tx_rst_ack_n,
  output                          o_p1_ereset_n,
  input                           i_p2_tx_rst_n,
  input                           i_p2_rx_rst_n,
  output                          o_p2_rx_rst_ack_n,
  output                          o_p2_tx_rst_ack_n,
  output                          o_p2_ereset_n,
  input                           i_p3_tx_rst_n,
  input                           i_p3_rx_rst_n,
  output                          o_p3_rx_rst_ack_n,
  output                          o_p3_tx_rst_ack_n,
  output                          o_p3_ereset_n,
  input                           i_p4_tx_rst_n,
  input                           i_p4_rx_rst_n,
  output                          o_p4_rx_rst_ack_n,
  output                          o_p4_tx_rst_ack_n,
  output                          o_p4_ereset_n,
  input                           i_p5_tx_rst_n,
  input                           i_p5_rx_rst_n,
  output                          o_p5_rx_rst_ack_n,
  output                          o_p5_tx_rst_ack_n,
  output                          o_p5_ereset_n,
  input                           i_p6_tx_rst_n,
  input                           i_p6_rx_rst_n,
  output                          o_p6_rx_rst_ack_n,
  output                          o_p6_tx_rst_ack_n,
  output                          o_p6_ereset_n,
  input                           i_p7_tx_rst_n,
  input                           i_p7_rx_rst_n,
  output                          o_p7_rx_rst_ack_n,
  output                          o_p7_tx_rst_ack_n,
  output                          o_p7_ereset_n,
  input                           i_p8_tx_rst_n,
  input                           i_p8_rx_rst_n,
  output                          o_p8_rx_rst_ack_n,
  output                          o_p8_tx_rst_ack_n,
  output                          o_p8_ereset_n,
  input                           i_p9_tx_rst_n,
  input                           i_p9_rx_rst_n,
  output                          o_p9_rx_rst_ack_n,
  output                          o_p9_tx_rst_ack_n,
  output                          o_p9_ereset_n,
  input                           i_p10_tx_rst_n,
  input                           i_p10_rx_rst_n,
  output                          o_p10_rx_rst_ack_n,
  output                          o_p10_tx_rst_ack_n,
  output                          o_p10_ereset_n,
  input                           i_p11_tx_rst_n,
  input                           i_p11_rx_rst_n,
  output                          o_p11_rx_rst_ack_n,
  output                          o_p11_tx_rst_ack_n,
  output                          o_p11_ereset_n,
  input                           i_p12_tx_rst_n,
  input                           i_p12_rx_rst_n,
  output                          o_p12_rx_rst_ack_n,
  output                          o_p12_tx_rst_ack_n,
  output                          o_p12_ereset_n,
  input                           i_p13_tx_rst_n,
  input                           i_p13_rx_rst_n,
  output                          o_p13_rx_rst_ack_n,
  output                          o_p13_tx_rst_ack_n,
  output                          o_p13_ereset_n,
  input                           i_p14_tx_rst_n,
  input                           i_p14_rx_rst_n,
  output                          o_p14_rx_rst_ack_n,
  output                          o_p14_tx_rst_ack_n,
  output                          o_p14_ereset_n,
  input                           i_p15_tx_rst_n,
  input                           i_p15_rx_rst_n,
  output                          o_p15_rx_rst_ack_n,
  output                          o_p15_tx_rst_ack_n,
  output                          o_p15_ereset_n,
  // ---------------
  // Clock Interface
  // --------------- 

  input  [2:0]                    i_clk_ref,
  input                           i_clk_sys, 
  input                           i_p0_clk_tx_tod,
  input                           i_p0_clk_rx_tod,
  output                          o_p0_clk_pll,
  output                          o_p0_clk_tx_div,
  output                          o_p0_clk_rec_div64,
  output                          o_p0_clk_rec_div,
  input                           i_p0_clk_ptp_sample,
  input                           p0_tx_clkena_half_rate,
  input                           p0_rx_clkena_half_rate,
  input                           i_p1_clk_tx_tod,
  input                           i_p1_clk_rx_tod,
  output                          o_p1_clk_pll,
  output                          o_p1_clk_tx_div,
  output                          o_p1_clk_rec_div64,
  output                          o_p1_clk_rec_div,
  input                           i_p1_clk_ptp_sample,
  input                           p1_tx_clkena_half_rate,
  input                           p1_rx_clkena_half_rate,
  input                           i_p2_clk_tx_tod,
  input                           i_p2_clk_rx_tod,
  output                          o_p2_clk_pll,
  output                          o_p2_clk_tx_div,
  output                          o_p2_clk_rec_div64,
  output                          o_p2_clk_rec_div,
  input                           i_p2_clk_ptp_sample,
  input                           p2_tx_clkena_half_rate,
  input                           p2_rx_clkena_half_rate,
  input                           i_p3_clk_tx_tod,
  input                           i_p3_clk_rx_tod,
  output                          o_p3_clk_pll,
  output                          o_p3_clk_tx_div,
  output                          o_p3_clk_rec_div64,
  output                          o_p3_clk_rec_div,
  input                           i_p3_clk_ptp_sample,
  input                           p3_tx_clkena_half_rate,
  input                           p3_rx_clkena_half_rate,
  input                           i_p4_clk_tx_tod,
  input                           i_p4_clk_rx_tod,
  output                          o_p4_clk_pll,
  output                          o_p4_clk_tx_div,
  output                          o_p4_clk_rec_div64,
  output                          o_p4_clk_rec_div,
  input                           i_p4_clk_ptp_sample,
  input                           p4_tx_clkena_half_rate,
  input                           p4_rx_clkena_half_rate,
  input                           i_p5_clk_tx_tod,
  input                           i_p5_clk_rx_tod,
  output                          o_p5_clk_pll,
  output                          o_p5_clk_tx_div,
  output                          o_p5_clk_rec_div64,
  output                          o_p5_clk_rec_div,
  input                           i_p5_clk_ptp_sample,
  input                           p5_tx_clkena_half_rate,
  input                           p5_rx_clkena_half_rate,
  input                           i_p6_clk_tx_tod,
  input                           i_p6_clk_rx_tod,
  output                          o_p6_clk_pll,
  output                          o_p6_clk_tx_div,
  output                          o_p6_clk_rec_div64,
  output                          o_p6_clk_rec_div,
  input                           i_p6_clk_ptp_sample,
  input                           p6_tx_clkena_half_rate,
  input                           p6_rx_clkena_half_rate,
  input                           i_p7_clk_tx_tod,
  input                           i_p7_clk_rx_tod,
  output                          o_p7_clk_pll,
  output                          o_p7_clk_tx_div,
  output                          o_p7_clk_rec_div64,
  output                          o_p7_clk_rec_div,
  input                           i_p7_clk_ptp_sample,
  input                           p7_tx_clkena_half_rate,
  input                           p7_rx_clkena_half_rate,
  input                           i_p8_clk_tx_tod,
  input                           i_p8_clk_rx_tod,
  output                          o_p8_clk_pll,
  output                          o_p8_clk_tx_div,
  output                          o_p8_clk_rec_div64,
  output                          o_p8_clk_rec_div,
  input                           i_p8_clk_ptp_sample,
  input                           p8_tx_clkena_half_rate,
  input                           p8_rx_clkena_half_rate,
  input                           i_p9_clk_tx_tod,
  input                           i_p9_clk_rx_tod,
  output                          o_p9_clk_pll,
  output                          o_p9_clk_tx_div,
  output                          o_p9_clk_rec_div64,
  output                          o_p9_clk_rec_div,
  input                           i_p9_clk_ptp_sample,
  input                           p9_tx_clkena_half_rate,
  input                           p9_rx_clkena_half_rate,
  input                           i_p10_clk_tx_tod,
  input                           i_p10_clk_rx_tod,
  output                          o_p10_clk_pll,
  output                          o_p10_clk_tx_div,
  output                          o_p10_clk_rec_div64,
  output                          o_p10_clk_rec_div,
  input                           i_p10_clk_ptp_sample,
  input                           p10_tx_clkena_half_rate,
  input                           p10_rx_clkena_half_rate,
  input                           i_p11_clk_tx_tod,
  input                           i_p11_clk_rx_tod,
  output                          o_p11_clk_pll,
  output                          o_p11_clk_tx_div,
  output                          o_p11_clk_rec_div64,
  output                          o_p11_clk_rec_div,
  input                           i_p11_clk_ptp_sample,
  input                           p11_tx_clkena_half_rate,
  input                           p11_rx_clkena_half_rate,
  input                           i_p12_clk_tx_tod,
  input                           i_p12_clk_rx_tod,
  output                          o_p12_clk_pll,
  output                          o_p12_clk_tx_div,
  output                          o_p12_clk_rec_div64,
  output                          o_p12_clk_rec_div,
  input                           i_p12_clk_ptp_sample,
  input                           p12_tx_clkena_half_rate,
  input                           p12_rx_clkena_half_rate,
  input                           i_p13_clk_tx_tod,
  input                           i_p13_clk_rx_tod,
  output                          o_p13_clk_pll,
  output                          o_p13_clk_tx_div,
  output                          o_p13_clk_rec_div64,
  output                          o_p13_clk_rec_div,
  input                           i_p13_clk_ptp_sample,
  input                           p13_tx_clkena_half_rate,
  input                           p13_rx_clkena_half_rate,
  input                           i_p14_clk_tx_tod,
  input                           i_p14_clk_rx_tod,
  output                          o_p14_clk_pll,
  output                          o_p14_clk_tx_div,
  output                          o_p14_clk_rec_div64,
  output                          o_p14_clk_rec_div,
  input                           i_p14_clk_ptp_sample,
  input                           p14_tx_clkena_half_rate,
  input                           p14_rx_clkena_half_rate,
  input                           i_p15_clk_tx_tod,
  input                           i_p15_clk_rx_tod,
  output                          o_p15_clk_pll,
  output                          o_p15_clk_tx_div,
  output                          o_p15_clk_rec_div64,
  output                          o_p15_clk_rec_div,
  input                           i_p15_clk_ptp_sample,
  input                           p15_tx_clkena_half_rate,
  input                           p15_rx_clkena_half_rate,

  output  [1:0]                   o_ehip0_ptp_clk_pll,
  output  [1:0]                   o_ehip0_ptp_clk_tx_div,
  output  [1:0]                   o_ehip0_ptp_clk_rec_div64,
  output  [1:0]                   o_ehip0_ptp_clk_rec_div,
  output                          o_ehip0_aib_clk,
  output                          o_ehip0_aib_2x_clk,
  output                          o_ehip0_tx_pll_locked,
  output                          o_ehip0_aib_tx_serial_data,
  output  [1:0]                   o_ehip1_ptp_clk_pll,
  output  [1:0]                   o_ehip1_ptp_clk_tx_div,
  output  [1:0]                   o_ehip1_ptp_clk_rec_div64,
  output  [1:0]                   o_ehip1_ptp_clk_rec_div,
  output                          o_ehip1_aib_clk,
  output                          o_ehip1_aib_2x_clk,
  output                          o_ehip1_tx_pll_locked,
  output                          o_ehip1_aib_tx_serial_data,
  output  [1:0]                   o_ehip2_ptp_clk_pll,
  output  [1:0]                   o_ehip2_ptp_clk_tx_div,
  output  [1:0]                   o_ehip2_ptp_clk_rec_div64,
  output  [1:0]                   o_ehip2_ptp_clk_rec_div,
  output                          o_ehip2_aib_clk,
  output                          o_ehip2_aib_2x_clk,
  output                          o_ehip2_tx_pll_locked,
  output                          o_ehip2_aib_tx_serial_data,
  output  [1:0]                   o_ehip3_ptp_clk_pll,
  output  [1:0]                   o_ehip3_ptp_clk_tx_div,
  output  [1:0]                   o_ehip3_ptp_clk_rec_div64,
  output  [1:0]                   o_ehip3_ptp_clk_rec_div,
  output                          o_ehip3_aib_clk,
  output                          o_ehip3_aib_2x_clk,
  output                          o_ehip3_tx_pll_locked,
  output                          o_ehip3_aib_tx_serial_data,

  // --------------------------------------------------------------
  // AXI Lite Control path Interface (one control interface for all
  // PORTS/Channels
  // --------------------------------------------------------------
  input                           app_ss_lite_clk, //set as clock type in tcl
  input                           app_ss_lite_areset_n, //set as reset type in tcl
  // -- Input Write Address Channel  
  input  [25:0]                   app_ss_lite_awaddr,
  input  [2:0]                    app_ss_lite_awprot,
  input                           app_ss_lite_awvalid,
  output                          ss_app_lite_awready,

  // -- Input Write Data Channel
  input  [PARAM_DATA-1:0]         app_ss_lite_wdata,
  input  [PARAM_DATA/8-1:0]                  app_ss_lite_wstrb,
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
  // ----------------------------------
  // AXI ST TX/RX Client Interface Signals, valid for eth with MAC enable, otherwise empty list 
  // ----------------------------------
  // these singals are per port, as data width maybe different for each port, and width is no if channels
  input                           p0_app_ss_st_tx_clk,
  input                           p0_app_ss_st_tx_areset_n,
  input                           p0_app_ss_st_tx_tvalid,
  output                          p0_ss_app_st_tx_tready,
  input  [PORT0_DATA_WIDTH-1:0]    p0_app_ss_st_tx_tdata, 
  input  [(PORT0_DATA_WIDTH/8)-1:0]   p0_app_ss_st_tx_tkeep,
  input                           p0_app_ss_st_tx_tlast,
  input  [1:0]                    p0_app_ss_st_tx_tuser_client,
  input                           p0_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p0_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p0_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p0_app_ss_st_rx_clk,
  input                           p0_app_ss_st_rx_areset_n,
  output                          p0_ss_app_st_rx_tvalid,
  output [PORT0_DATA_WIDTH-1:0]     p0_ss_app_st_rx_tdata,
  output [(PORT0_DATA_WIDTH/8)-1:0] p0_ss_app_st_rx_tkeep,
  output                          p0_ss_app_st_rx_tlast,
  output [6:0]                    p0_ss_app_st_rx_tuser_client,
  output [4:0]                    p0_ss_app_st_rx_tuser_sts,
  output                          p0_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p0_ss_app_st_rx_tuser_sts_extended,
  input                           p1_app_ss_st_tx_clk,
  input                           p1_app_ss_st_tx_areset_n,
  input                           p1_app_ss_st_tx_tvalid,
  output                          p1_ss_app_st_tx_tready,
  input  [PORT1_DATA_WIDTH-1:0]    p1_app_ss_st_tx_tdata, 
  input  [(PORT1_DATA_WIDTH/8)-1:0]   p1_app_ss_st_tx_tkeep,
  input                           p1_app_ss_st_tx_tlast,
  input  [1:0]                    p1_app_ss_st_tx_tuser_client,
  input                           p1_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p1_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p1_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p1_app_ss_st_rx_clk,
  input                           p1_app_ss_st_rx_areset_n,
  output                          p1_ss_app_st_rx_tvalid,
  output [PORT1_DATA_WIDTH-1:0]     p1_ss_app_st_rx_tdata,
  output [(PORT1_DATA_WIDTH/8)-1:0] p1_ss_app_st_rx_tkeep,
  output                          p1_ss_app_st_rx_tlast,
  output [6:0]                    p1_ss_app_st_rx_tuser_client,
  output [4:0]                    p1_ss_app_st_rx_tuser_sts,
  output                          p1_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p1_ss_app_st_rx_tuser_sts_extended,
  input                           p2_app_ss_st_tx_clk,
  input                           p2_app_ss_st_tx_areset_n,
  input                           p2_app_ss_st_tx_tvalid,
  output                          p2_ss_app_st_tx_tready,
  input  [PORT2_DATA_WIDTH-1:0]    p2_app_ss_st_tx_tdata, 
  input  [(PORT2_DATA_WIDTH/8)-1:0]   p2_app_ss_st_tx_tkeep,
  input                           p2_app_ss_st_tx_tlast,
  input  [1:0]                    p2_app_ss_st_tx_tuser_client,
  input                           p2_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p2_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p2_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p2_app_ss_st_rx_clk,
  input                           p2_app_ss_st_rx_areset_n,
  output                          p2_ss_app_st_rx_tvalid,
  output [PORT2_DATA_WIDTH-1:0]     p2_ss_app_st_rx_tdata,
  output [(PORT2_DATA_WIDTH/8)-1:0] p2_ss_app_st_rx_tkeep,
  output                          p2_ss_app_st_rx_tlast,
  output [6:0]                    p2_ss_app_st_rx_tuser_client,
  output [4:0]                    p2_ss_app_st_rx_tuser_sts,
  output                          p2_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p2_ss_app_st_rx_tuser_sts_extended,
  input                           p3_app_ss_st_tx_clk,
  input                           p3_app_ss_st_tx_areset_n,
  input                           p3_app_ss_st_tx_tvalid,
  output                          p3_ss_app_st_tx_tready,
  input  [PORT3_DATA_WIDTH-1:0]    p3_app_ss_st_tx_tdata, 
  input  [(PORT3_DATA_WIDTH/8)-1:0]   p3_app_ss_st_tx_tkeep,
  input                           p3_app_ss_st_tx_tlast,
  input  [1:0]                    p3_app_ss_st_tx_tuser_client,
  input                           p3_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p3_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p3_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p3_app_ss_st_rx_clk,
  input                           p3_app_ss_st_rx_areset_n,
  output                          p3_ss_app_st_rx_tvalid,
  output [PORT3_DATA_WIDTH-1:0]     p3_ss_app_st_rx_tdata,
  output [(PORT3_DATA_WIDTH/8)-1:0] p3_ss_app_st_rx_tkeep,
  output                          p3_ss_app_st_rx_tlast,
  output [6:0]                    p3_ss_app_st_rx_tuser_client,
  output [4:0]                    p3_ss_app_st_rx_tuser_sts,
  output                          p3_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p3_ss_app_st_rx_tuser_sts_extended,
  input                           p4_app_ss_st_tx_clk,
  input                           p4_app_ss_st_tx_areset_n,
  input                           p4_app_ss_st_tx_tvalid,
  output                          p4_ss_app_st_tx_tready,
  input  [PORT4_DATA_WIDTH-1:0]    p4_app_ss_st_tx_tdata, 
  input  [(PORT4_DATA_WIDTH/8)-1:0]   p4_app_ss_st_tx_tkeep,
  input                           p4_app_ss_st_tx_tlast,
  input  [1:0]                    p4_app_ss_st_tx_tuser_client,
  input                           p4_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p4_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p4_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p4_app_ss_st_rx_clk,
  input                           p4_app_ss_st_rx_areset_n,
  output                          p4_ss_app_st_rx_tvalid,
  output [PORT4_DATA_WIDTH-1:0]     p4_ss_app_st_rx_tdata,
  output [(PORT4_DATA_WIDTH/8)-1:0] p4_ss_app_st_rx_tkeep,
  output                          p4_ss_app_st_rx_tlast,
  output [6:0]                    p4_ss_app_st_rx_tuser_client,
  output [4:0]                    p4_ss_app_st_rx_tuser_sts,
  output                          p4_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p4_ss_app_st_rx_tuser_sts_extended,
  input                           p5_app_ss_st_tx_clk,
  input                           p5_app_ss_st_tx_areset_n,
  input                           p5_app_ss_st_tx_tvalid,
  output                          p5_ss_app_st_tx_tready,
  input  [PORT5_DATA_WIDTH-1:0]    p5_app_ss_st_tx_tdata, 
  input  [(PORT5_DATA_WIDTH/8)-1:0]   p5_app_ss_st_tx_tkeep,
  input                           p5_app_ss_st_tx_tlast,
  input  [1:0]                    p5_app_ss_st_tx_tuser_client,
  input                           p5_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p5_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p5_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p5_app_ss_st_rx_clk,
  input                           p5_app_ss_st_rx_areset_n,
  output                          p5_ss_app_st_rx_tvalid,
  output [PORT5_DATA_WIDTH-1:0]     p5_ss_app_st_rx_tdata,
  output [(PORT5_DATA_WIDTH/8)-1:0] p5_ss_app_st_rx_tkeep,
  output                          p5_ss_app_st_rx_tlast,
  output [6:0]                    p5_ss_app_st_rx_tuser_client,
  output [4:0]                    p5_ss_app_st_rx_tuser_sts,
  output                          p5_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p5_ss_app_st_rx_tuser_sts_extended,
  input                           p6_app_ss_st_tx_clk,
  input                           p6_app_ss_st_tx_areset_n,
  input                           p6_app_ss_st_tx_tvalid,
  output                          p6_ss_app_st_tx_tready,
  input  [PORT6_DATA_WIDTH-1:0]    p6_app_ss_st_tx_tdata, 
  input  [(PORT6_DATA_WIDTH/8)-1:0]   p6_app_ss_st_tx_tkeep,
  input                           p6_app_ss_st_tx_tlast,
  input  [1:0]                    p6_app_ss_st_tx_tuser_client,
  input                           p6_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p6_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p6_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p6_app_ss_st_rx_clk,
  input                           p6_app_ss_st_rx_areset_n,
  output                          p6_ss_app_st_rx_tvalid,
  output [PORT6_DATA_WIDTH-1:0]     p6_ss_app_st_rx_tdata,
  output [(PORT6_DATA_WIDTH/8)-1:0] p6_ss_app_st_rx_tkeep,
  output                          p6_ss_app_st_rx_tlast,
  output [6:0]                    p6_ss_app_st_rx_tuser_client,
  output [4:0]                    p6_ss_app_st_rx_tuser_sts,
  output                          p6_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p6_ss_app_st_rx_tuser_sts_extended,
  input                           p7_app_ss_st_tx_clk,
  input                           p7_app_ss_st_tx_areset_n,
  input                           p7_app_ss_st_tx_tvalid,
  output                          p7_ss_app_st_tx_tready,
  input  [PORT7_DATA_WIDTH-1:0]    p7_app_ss_st_tx_tdata, 
  input  [(PORT7_DATA_WIDTH/8)-1:0]   p7_app_ss_st_tx_tkeep,
  input                           p7_app_ss_st_tx_tlast,
  input  [1:0]                    p7_app_ss_st_tx_tuser_client,
  input                           p7_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p7_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p7_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p7_app_ss_st_rx_clk,
  input                           p7_app_ss_st_rx_areset_n,
  output                          p7_ss_app_st_rx_tvalid,
  output [PORT7_DATA_WIDTH-1:0]     p7_ss_app_st_rx_tdata,
  output [(PORT7_DATA_WIDTH/8)-1:0] p7_ss_app_st_rx_tkeep,
  output                          p7_ss_app_st_rx_tlast,
  output [6:0]                    p7_ss_app_st_rx_tuser_client,
  output [4:0]                    p7_ss_app_st_rx_tuser_sts,
  output                          p7_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p7_ss_app_st_rx_tuser_sts_extended,
  input                           p8_app_ss_st_tx_clk,
  input                           p8_app_ss_st_tx_areset_n,
  input                           p8_app_ss_st_tx_tvalid,
  output                          p8_ss_app_st_tx_tready,
  input  [PORT8_DATA_WIDTH-1:0]    p8_app_ss_st_tx_tdata, 
  input  [(PORT8_DATA_WIDTH/8)-1:0]   p8_app_ss_st_tx_tkeep,
  input                           p8_app_ss_st_tx_tlast,
  input  [1:0]                    p8_app_ss_st_tx_tuser_client,
  input                           p8_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p8_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p8_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p8_app_ss_st_rx_clk,
  input                           p8_app_ss_st_rx_areset_n,
  output                          p8_ss_app_st_rx_tvalid,
  output [PORT8_DATA_WIDTH-1:0]     p8_ss_app_st_rx_tdata,
  output [(PORT8_DATA_WIDTH/8)-1:0] p8_ss_app_st_rx_tkeep,
  output                          p8_ss_app_st_rx_tlast,
  output [6:0]                    p8_ss_app_st_rx_tuser_client,
  output [4:0]                    p8_ss_app_st_rx_tuser_sts,
  output                          p8_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p8_ss_app_st_rx_tuser_sts_extended,
  input                           p9_app_ss_st_tx_clk,
  input                           p9_app_ss_st_tx_areset_n,
  input                           p9_app_ss_st_tx_tvalid,
  output                          p9_ss_app_st_tx_tready,
  input  [PORT9_DATA_WIDTH-1:0]    p9_app_ss_st_tx_tdata, 
  input  [(PORT9_DATA_WIDTH/8)-1:0]   p9_app_ss_st_tx_tkeep,
  input                           p9_app_ss_st_tx_tlast,
  input  [1:0]                    p9_app_ss_st_tx_tuser_client,
  input                           p9_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p9_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p9_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p9_app_ss_st_rx_clk,
  input                           p9_app_ss_st_rx_areset_n,
  output                          p9_ss_app_st_rx_tvalid,
  output [PORT9_DATA_WIDTH-1:0]     p9_ss_app_st_rx_tdata,
  output [(PORT9_DATA_WIDTH/8)-1:0] p9_ss_app_st_rx_tkeep,
  output                          p9_ss_app_st_rx_tlast,
  output [6:0]                    p9_ss_app_st_rx_tuser_client,
  output [4:0]                    p9_ss_app_st_rx_tuser_sts,
  output                          p9_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p9_ss_app_st_rx_tuser_sts_extended,
  input                           p10_app_ss_st_tx_clk,
  input                           p10_app_ss_st_tx_areset_n,
  input                           p10_app_ss_st_tx_tvalid,
  output                          p10_ss_app_st_tx_tready,
  input  [PORT10_DATA_WIDTH-1:0]    p10_app_ss_st_tx_tdata, 
  input  [(PORT10_DATA_WIDTH/8)-1:0]   p10_app_ss_st_tx_tkeep,
  input                           p10_app_ss_st_tx_tlast,
  input  [1:0]                    p10_app_ss_st_tx_tuser_client,
  input                           p10_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p10_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p10_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p10_app_ss_st_rx_clk,
  input                           p10_app_ss_st_rx_areset_n,
  output                          p10_ss_app_st_rx_tvalid,
  output [PORT10_DATA_WIDTH-1:0]     p10_ss_app_st_rx_tdata,
  output [(PORT10_DATA_WIDTH/8)-1:0] p10_ss_app_st_rx_tkeep,
  output                          p10_ss_app_st_rx_tlast,
  output [6:0]                    p10_ss_app_st_rx_tuser_client,
  output [4:0]                    p10_ss_app_st_rx_tuser_sts,
  output                          p10_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p10_ss_app_st_rx_tuser_sts_extended,
  input                           p11_app_ss_st_tx_clk,
  input                           p11_app_ss_st_tx_areset_n,
  input                           p11_app_ss_st_tx_tvalid,
  output                          p11_ss_app_st_tx_tready,
  input  [PORT11_DATA_WIDTH-1:0]    p11_app_ss_st_tx_tdata, 
  input  [(PORT11_DATA_WIDTH/8)-1:0]   p11_app_ss_st_tx_tkeep,
  input                           p11_app_ss_st_tx_tlast,
  input  [1:0]                    p11_app_ss_st_tx_tuser_client,
  input                           p11_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p11_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p11_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p11_app_ss_st_rx_clk,
  input                           p11_app_ss_st_rx_areset_n,
  output                          p11_ss_app_st_rx_tvalid,
  output [PORT11_DATA_WIDTH-1:0]     p11_ss_app_st_rx_tdata,
  output [(PORT11_DATA_WIDTH/8)-1:0] p11_ss_app_st_rx_tkeep,
  output                          p11_ss_app_st_rx_tlast,
  output [6:0]                    p11_ss_app_st_rx_tuser_client,
  output [4:0]                    p11_ss_app_st_rx_tuser_sts,
  output                          p11_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p11_ss_app_st_rx_tuser_sts_extended,
  input                           p12_app_ss_st_tx_clk,
  input                           p12_app_ss_st_tx_areset_n,
  input                           p12_app_ss_st_tx_tvalid,
  output                          p12_ss_app_st_tx_tready,
  input  [PORT12_DATA_WIDTH-1:0]    p12_app_ss_st_tx_tdata, 
  input  [(PORT12_DATA_WIDTH/8)-1:0]   p12_app_ss_st_tx_tkeep,
  input                           p12_app_ss_st_tx_tlast,
  input  [1:0]                    p12_app_ss_st_tx_tuser_client,
  input                           p12_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p12_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p12_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p12_app_ss_st_rx_clk,
  input                           p12_app_ss_st_rx_areset_n,
  output                          p12_ss_app_st_rx_tvalid,
  output [PORT12_DATA_WIDTH-1:0]     p12_ss_app_st_rx_tdata,
  output [(PORT12_DATA_WIDTH/8)-1:0] p12_ss_app_st_rx_tkeep,
  output                          p12_ss_app_st_rx_tlast,
  output [6:0]                    p12_ss_app_st_rx_tuser_client,
  output [4:0]                    p12_ss_app_st_rx_tuser_sts,
  output                          p12_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p12_ss_app_st_rx_tuser_sts_extended,
  input                           p13_app_ss_st_tx_clk,
  input                           p13_app_ss_st_tx_areset_n,
  input                           p13_app_ss_st_tx_tvalid,
  output                          p13_ss_app_st_tx_tready,
  input  [PORT13_DATA_WIDTH-1:0]    p13_app_ss_st_tx_tdata, 
  input  [(PORT13_DATA_WIDTH/8)-1:0]   p13_app_ss_st_tx_tkeep,
  input                           p13_app_ss_st_tx_tlast,
  input  [1:0]                    p13_app_ss_st_tx_tuser_client,
  input                           p13_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p13_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p13_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p13_app_ss_st_rx_clk,
  input                           p13_app_ss_st_rx_areset_n,
  output                          p13_ss_app_st_rx_tvalid,
  output [PORT13_DATA_WIDTH-1:0]     p13_ss_app_st_rx_tdata,
  output [(PORT13_DATA_WIDTH/8)-1:0] p13_ss_app_st_rx_tkeep,
  output                          p13_ss_app_st_rx_tlast,
  output [6:0]                    p13_ss_app_st_rx_tuser_client,
  output [4:0]                    p13_ss_app_st_rx_tuser_sts,
  output                          p13_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p13_ss_app_st_rx_tuser_sts_extended,
  input                           p14_app_ss_st_tx_clk,
  input                           p14_app_ss_st_tx_areset_n,
  input                           p14_app_ss_st_tx_tvalid,
  output                          p14_ss_app_st_tx_tready,
  input  [PORT14_DATA_WIDTH-1:0]    p14_app_ss_st_tx_tdata, 
  input  [(PORT14_DATA_WIDTH/8)-1:0]   p14_app_ss_st_tx_tkeep,
  input                           p14_app_ss_st_tx_tlast,
  input  [1:0]                    p14_app_ss_st_tx_tuser_client,
  input                           p14_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p14_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p14_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p14_app_ss_st_rx_clk,
  input                           p14_app_ss_st_rx_areset_n,
  output                          p14_ss_app_st_rx_tvalid,
  output [PORT14_DATA_WIDTH-1:0]     p14_ss_app_st_rx_tdata,
  output [(PORT14_DATA_WIDTH/8)-1:0] p14_ss_app_st_rx_tkeep,
  output                          p14_ss_app_st_rx_tlast,
  output [6:0]                    p14_ss_app_st_rx_tuser_client,
  output [4:0]                    p14_ss_app_st_rx_tuser_sts,
  output                          p14_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p14_ss_app_st_rx_tuser_sts_extended,
  input                           p15_app_ss_st_tx_clk,
  input                           p15_app_ss_st_tx_areset_n,
  input                           p15_app_ss_st_tx_tvalid,
  output                          p15_ss_app_st_tx_tready,
  input  [PORT15_DATA_WIDTH-1:0]    p15_app_ss_st_tx_tdata, 
  input  [(PORT15_DATA_WIDTH/8)-1:0]   p15_app_ss_st_tx_tkeep,
  input                           p15_app_ss_st_tx_tlast,
  input  [1:0]                    p15_app_ss_st_tx_tuser_client,
  input                           p15_app_ss_st_tx_tuser_pkt_seg_parity,
  input  [93:0]                   p15_app_ss_st_tx_tuser_ptp,
  input  [327:0]                  p15_app_ss_st_tx_tuser_ptp_extended,
  // ----------------------------------
  input                           p15_app_ss_st_rx_clk,
  input                           p15_app_ss_st_rx_areset_n,
  output                          p15_ss_app_st_rx_tvalid,
  output [PORT15_DATA_WIDTH-1:0]     p15_ss_app_st_rx_tdata,
  output [(PORT15_DATA_WIDTH/8)-1:0] p15_ss_app_st_rx_tkeep,
  output                          p15_ss_app_st_rx_tlast,
  output [6:0]                    p15_ss_app_st_rx_tuser_client,
  output [4:0]                    p15_ss_app_st_rx_tuser_sts,
  output                          p15_ss_app_st_rx_tuser_pkt_seg_parity,
  output [31:0]                   p15_ss_app_st_rx_tuser_sts_extended,
// 100G <---> 25G MAC+PCS mode DR
  // ------------------------
  // AXI ST PHY Direct Functional Signals
  // ---------------------------------------
  input                           p0_app_ss_st_txphydirect_clk,
  input                           p0_app_ss_st_txphydirect_areset_n,
  input  [PORT0_DATA_WIDTH-1:0]   p0_app_ss_st_txphydirect_tdata,
  input                           p0_app_ss_st_txphydirect_tvalid,
  output                          p0_ss_app_st_txphydirect_tready,
  input                           p0_app_ss_st_rxphydirect_clk,
  input                           p0_app_ss_st_rxphydirect_areset_n,
  output [PORT0_DATA_WIDTH-1:0]   p0_ss_app_st_rxphydirect_tdata,
  output                          p0_ss_app_st_rxphydirect_tvalid,
  input                           p1_app_ss_st_txphydirect_clk,
  input                           p1_app_ss_st_txphydirect_areset_n,
  input  [PORT1_DATA_WIDTH-1:0]   p1_app_ss_st_txphydirect_tdata,
  input                           p1_app_ss_st_txphydirect_tvalid,
  output                          p1_ss_app_st_txphydirect_tready,
  input                           p1_app_ss_st_rxphydirect_clk,
  input                           p1_app_ss_st_rxphydirect_areset_n,
  output [PORT1_DATA_WIDTH-1:0]   p1_ss_app_st_rxphydirect_tdata,
  output                          p1_ss_app_st_rxphydirect_tvalid,
  input                           p2_app_ss_st_txphydirect_clk,
  input                           p2_app_ss_st_txphydirect_areset_n,
  input  [PORT2_DATA_WIDTH-1:0]   p2_app_ss_st_txphydirect_tdata,
  input                           p2_app_ss_st_txphydirect_tvalid,
  output                          p2_ss_app_st_txphydirect_tready,
  input                           p2_app_ss_st_rxphydirect_clk,
  input                           p2_app_ss_st_rxphydirect_areset_n,
  output [PORT2_DATA_WIDTH-1:0]   p2_ss_app_st_rxphydirect_tdata,
  output                          p2_ss_app_st_rxphydirect_tvalid,
  input                           p3_app_ss_st_txphydirect_clk,
  input                           p3_app_ss_st_txphydirect_areset_n,
  input  [PORT3_DATA_WIDTH-1:0]   p3_app_ss_st_txphydirect_tdata,
  input                           p3_app_ss_st_txphydirect_tvalid,
  output                          p3_ss_app_st_txphydirect_tready,
  input                           p3_app_ss_st_rxphydirect_clk,
  input                           p3_app_ss_st_rxphydirect_areset_n,
  output [PORT3_DATA_WIDTH-1:0]   p3_ss_app_st_rxphydirect_tdata,
  output                          p3_ss_app_st_rxphydirect_tvalid,
  input                           p4_app_ss_st_txphydirect_clk,
  input                           p4_app_ss_st_txphydirect_areset_n,
  input  [PORT4_DATA_WIDTH-1:0]   p4_app_ss_st_txphydirect_tdata,
  input                           p4_app_ss_st_txphydirect_tvalid,
  output                          p4_ss_app_st_txphydirect_tready,
  input                           p4_app_ss_st_rxphydirect_clk,
  input                           p4_app_ss_st_rxphydirect_areset_n,
  output [PORT4_DATA_WIDTH-1:0]   p4_ss_app_st_rxphydirect_tdata,
  output                          p4_ss_app_st_rxphydirect_tvalid,
  input                           p5_app_ss_st_txphydirect_clk,
  input                           p5_app_ss_st_txphydirect_areset_n,
  input  [PORT5_DATA_WIDTH-1:0]   p5_app_ss_st_txphydirect_tdata,
  input                           p5_app_ss_st_txphydirect_tvalid,
  output                          p5_ss_app_st_txphydirect_tready,
  input                           p5_app_ss_st_rxphydirect_clk,
  input                           p5_app_ss_st_rxphydirect_areset_n,
  output [PORT5_DATA_WIDTH-1:0]   p5_ss_app_st_rxphydirect_tdata,
  output                          p5_ss_app_st_rxphydirect_tvalid,
  input                           p6_app_ss_st_txphydirect_clk,
  input                           p6_app_ss_st_txphydirect_areset_n,
  input  [PORT6_DATA_WIDTH-1:0]   p6_app_ss_st_txphydirect_tdata,
  input                           p6_app_ss_st_txphydirect_tvalid,
  output                          p6_ss_app_st_txphydirect_tready,
  input                           p6_app_ss_st_rxphydirect_clk,
  input                           p6_app_ss_st_rxphydirect_areset_n,
  output [PORT6_DATA_WIDTH-1:0]   p6_ss_app_st_rxphydirect_tdata,
  output                          p6_ss_app_st_rxphydirect_tvalid,
  input                           p7_app_ss_st_txphydirect_clk,
  input                           p7_app_ss_st_txphydirect_areset_n,
  input  [PORT7_DATA_WIDTH-1:0]   p7_app_ss_st_txphydirect_tdata,
  input                           p7_app_ss_st_txphydirect_tvalid,
  output                          p7_ss_app_st_txphydirect_tready,
  input                           p7_app_ss_st_rxphydirect_clk,
  input                           p7_app_ss_st_rxphydirect_areset_n,
  output [PORT7_DATA_WIDTH-1:0]   p7_ss_app_st_rxphydirect_tdata,
  output                          p7_ss_app_st_rxphydirect_tvalid,
  input                           p8_app_ss_st_txphydirect_clk,
  input                           p8_app_ss_st_txphydirect_areset_n,
  input  [PORT8_DATA_WIDTH-1:0]   p8_app_ss_st_txphydirect_tdata,
  input                           p8_app_ss_st_txphydirect_tvalid,
  output                          p8_ss_app_st_txphydirect_tready,
  input                           p8_app_ss_st_rxphydirect_clk,
  input                           p8_app_ss_st_rxphydirect_areset_n,
  output [PORT8_DATA_WIDTH-1:0]   p8_ss_app_st_rxphydirect_tdata,
  output                          p8_ss_app_st_rxphydirect_tvalid,
  input                           p9_app_ss_st_txphydirect_clk,
  input                           p9_app_ss_st_txphydirect_areset_n,
  input  [PORT9_DATA_WIDTH-1:0]   p9_app_ss_st_txphydirect_tdata,
  input                           p9_app_ss_st_txphydirect_tvalid,
  output                          p9_ss_app_st_txphydirect_tready,
  input                           p9_app_ss_st_rxphydirect_clk,
  input                           p9_app_ss_st_rxphydirect_areset_n,
  output [PORT9_DATA_WIDTH-1:0]   p9_ss_app_st_rxphydirect_tdata,
  output                          p9_ss_app_st_rxphydirect_tvalid,
  input                           p10_app_ss_st_txphydirect_clk,
  input                           p10_app_ss_st_txphydirect_areset_n,
  input  [PORT10_DATA_WIDTH-1:0]   p10_app_ss_st_txphydirect_tdata,
  input                           p10_app_ss_st_txphydirect_tvalid,
  output                          p10_ss_app_st_txphydirect_tready,
  input                           p10_app_ss_st_rxphydirect_clk,
  input                           p10_app_ss_st_rxphydirect_areset_n,
  output [PORT10_DATA_WIDTH-1:0]   p10_ss_app_st_rxphydirect_tdata,
  output                          p10_ss_app_st_rxphydirect_tvalid,
  input                           p11_app_ss_st_txphydirect_clk,
  input                           p11_app_ss_st_txphydirect_areset_n,
  input  [PORT11_DATA_WIDTH-1:0]   p11_app_ss_st_txphydirect_tdata,
  input                           p11_app_ss_st_txphydirect_tvalid,
  output                          p11_ss_app_st_txphydirect_tready,
  input                           p11_app_ss_st_rxphydirect_clk,
  input                           p11_app_ss_st_rxphydirect_areset_n,
  output [PORT11_DATA_WIDTH-1:0]   p11_ss_app_st_rxphydirect_tdata,
  output                          p11_ss_app_st_rxphydirect_tvalid,
  input                           p12_app_ss_st_txphydirect_clk,
  input                           p12_app_ss_st_txphydirect_areset_n,
  input  [PORT12_DATA_WIDTH-1:0]   p12_app_ss_st_txphydirect_tdata,
  input                           p12_app_ss_st_txphydirect_tvalid,
  output                          p12_ss_app_st_txphydirect_tready,
  input                           p12_app_ss_st_rxphydirect_clk,
  input                           p12_app_ss_st_rxphydirect_areset_n,
  output [PORT12_DATA_WIDTH-1:0]   p12_ss_app_st_rxphydirect_tdata,
  output                          p12_ss_app_st_rxphydirect_tvalid,
  input                           p13_app_ss_st_txphydirect_clk,
  input                           p13_app_ss_st_txphydirect_areset_n,
  input  [PORT13_DATA_WIDTH-1:0]   p13_app_ss_st_txphydirect_tdata,
  input                           p13_app_ss_st_txphydirect_tvalid,
  output                          p13_ss_app_st_txphydirect_tready,
  input                           p13_app_ss_st_rxphydirect_clk,
  input                           p13_app_ss_st_rxphydirect_areset_n,
  output [PORT13_DATA_WIDTH-1:0]   p13_ss_app_st_rxphydirect_tdata,
  output                          p13_ss_app_st_rxphydirect_tvalid,
  input                           p14_app_ss_st_txphydirect_clk,
  input                           p14_app_ss_st_txphydirect_areset_n,
  input  [PORT14_DATA_WIDTH-1:0]   p14_app_ss_st_txphydirect_tdata,
  input                           p14_app_ss_st_txphydirect_tvalid,
  output                          p14_ss_app_st_txphydirect_tready,
  input                           p14_app_ss_st_rxphydirect_clk,
  input                           p14_app_ss_st_rxphydirect_areset_n,
  output [PORT14_DATA_WIDTH-1:0]   p14_ss_app_st_rxphydirect_tdata,
  output                          p14_ss_app_st_rxphydirect_tvalid,
  input                           p15_app_ss_st_txphydirect_clk,
  input                           p15_app_ss_st_txphydirect_areset_n,
  input  [PORT15_DATA_WIDTH-1:0]   p15_app_ss_st_txphydirect_tdata,
  input                           p15_app_ss_st_txphydirect_tvalid,
  output                          p15_ss_app_st_txphydirect_tready,
  input                           p15_app_ss_st_rxphydirect_clk,
  input                           p15_app_ss_st_rxphydirect_areset_n,
  output [PORT15_DATA_WIDTH-1:0]   p15_ss_app_st_rxphydirect_tdata,
  output                          p15_ss_app_st_rxphydirect_tvalid,
  // ---------------------------------------                                 
// 25G <---> CPRI DR 
  // -------------------------------
  // AXI ST Tx/Rx ToD Interface Signals
  // -------------------------------
  input                           p0_app_ss_st_txtod_tvalid,
  input  [95:0]                   p0_app_ss_st_txtod_tdata,
  input                           p0_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p0_app_ss_st_rxtod_tdata,
  input                           p1_app_ss_st_txtod_tvalid,
  input  [95:0]                   p1_app_ss_st_txtod_tdata,
  input                           p1_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p1_app_ss_st_rxtod_tdata,
  input                           p2_app_ss_st_txtod_tvalid,
  input  [95:0]                   p2_app_ss_st_txtod_tdata,
  input                           p2_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p2_app_ss_st_rxtod_tdata,
  input                           p3_app_ss_st_txtod_tvalid,
  input  [95:0]                   p3_app_ss_st_txtod_tdata,
  input                           p3_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p3_app_ss_st_rxtod_tdata,
  input                           p4_app_ss_st_txtod_tvalid,
  input  [95:0]                   p4_app_ss_st_txtod_tdata,
  input                           p4_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p4_app_ss_st_rxtod_tdata,
  input                           p5_app_ss_st_txtod_tvalid,
  input  [95:0]                   p5_app_ss_st_txtod_tdata,
  input                           p5_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p5_app_ss_st_rxtod_tdata,
  input                           p6_app_ss_st_txtod_tvalid,
  input  [95:0]                   p6_app_ss_st_txtod_tdata,
  input                           p6_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p6_app_ss_st_rxtod_tdata,
  input                           p7_app_ss_st_txtod_tvalid,
  input  [95:0]                   p7_app_ss_st_txtod_tdata,
  input                           p7_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p7_app_ss_st_rxtod_tdata,
  input                           p8_app_ss_st_txtod_tvalid,
  input  [95:0]                   p8_app_ss_st_txtod_tdata,
  input                           p8_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p8_app_ss_st_rxtod_tdata,
  input                           p9_app_ss_st_txtod_tvalid,
  input  [95:0]                   p9_app_ss_st_txtod_tdata,
  input                           p9_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p9_app_ss_st_rxtod_tdata,
  input                           p10_app_ss_st_txtod_tvalid,
  input  [95:0]                   p10_app_ss_st_txtod_tdata,
  input                           p10_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p10_app_ss_st_rxtod_tdata,
  input                           p11_app_ss_st_txtod_tvalid,
  input  [95:0]                   p11_app_ss_st_txtod_tdata,
  input                           p11_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p11_app_ss_st_rxtod_tdata,
  input                           p12_app_ss_st_txtod_tvalid,
  input  [95:0]                   p12_app_ss_st_txtod_tdata,
  input                           p12_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p12_app_ss_st_rxtod_tdata,
  input                           p13_app_ss_st_txtod_tvalid,
  input  [95:0]                   p13_app_ss_st_txtod_tdata,
  input                           p13_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p13_app_ss_st_rxtod_tdata,
  input                           p14_app_ss_st_txtod_tvalid,
  input  [95:0]                   p14_app_ss_st_txtod_tdata,
  input                           p14_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p14_app_ss_st_rxtod_tdata,
  input                           p15_app_ss_st_txtod_tvalid,
  input  [95:0]                   p15_app_ss_st_txtod_tdata,
  input                           p15_app_ss_st_rxtod_tvalid,
  input  [95:0]                   p15_app_ss_st_rxtod_tdata,
  // ----------------------------------------------
  // AXI ST Tx/Rx Egress Timestamp Interface Signals
  // ----------------------------------------------
  output                          p0_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p0_ss_app_st_txegrts0_tdata,
  output                          p0_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p0_ss_app_st_txegrts1_tdata,
  output                          p1_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p1_ss_app_st_txegrts0_tdata,
  output                          p1_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p1_ss_app_st_txegrts1_tdata,
  output                          p2_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p2_ss_app_st_txegrts0_tdata,
  output                          p2_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p2_ss_app_st_txegrts1_tdata,
  output                          p3_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p3_ss_app_st_txegrts0_tdata,
  output                          p3_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p3_ss_app_st_txegrts1_tdata,
  output                          p4_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p4_ss_app_st_txegrts0_tdata,
  output                          p4_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p4_ss_app_st_txegrts1_tdata,
  output                          p5_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p5_ss_app_st_txegrts0_tdata,
  output                          p5_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p5_ss_app_st_txegrts1_tdata,
  output                          p6_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p6_ss_app_st_txegrts0_tdata,
  output                          p6_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p6_ss_app_st_txegrts1_tdata,
  output                          p7_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p7_ss_app_st_txegrts0_tdata,
  output                          p7_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p7_ss_app_st_txegrts1_tdata,
  output                          p8_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p8_ss_app_st_txegrts0_tdata,
  output                          p8_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p8_ss_app_st_txegrts1_tdata,
  output                          p9_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p9_ss_app_st_txegrts0_tdata,
  output                          p9_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p9_ss_app_st_txegrts1_tdata,
  output                          p10_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p10_ss_app_st_txegrts0_tdata,
  output                          p10_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p10_ss_app_st_txegrts1_tdata,
  output                          p11_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p11_ss_app_st_txegrts0_tdata,
  output                          p11_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p11_ss_app_st_txegrts1_tdata,
  output                          p12_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p12_ss_app_st_txegrts0_tdata,
  output                          p12_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p12_ss_app_st_txegrts1_tdata,
  output                          p13_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p13_ss_app_st_txegrts0_tdata,
  output                          p13_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p13_ss_app_st_txegrts1_tdata,
  output                          p14_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p14_ss_app_st_txegrts0_tdata,
  output                          p14_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p14_ss_app_st_txegrts1_tdata,
  output                          p15_ss_app_st_txegrts0_tvalid,
  output [103:0]                  p15_ss_app_st_txegrts0_tdata,
  output                          p15_ss_app_st_txegrts1_tvalid,
  output [103:0]                  p15_ss_app_st_txegrts1_tdata,
  // ----------------------------------------------
  // AXI ST Rx ingress Timestamp Interface Signals, Valid only in F-tile
  // ----------------------------------------------
  output                          p0_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p0_ss_app_st_rxingrts0_tdata,
  output                          p0_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p0_ss_app_st_rxingrts1_tdata,
  output                          p1_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p1_ss_app_st_rxingrts0_tdata,
  output                          p1_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p1_ss_app_st_rxingrts1_tdata,
  output                          p2_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p2_ss_app_st_rxingrts0_tdata,
  output                          p2_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p2_ss_app_st_rxingrts1_tdata,
  output                          p3_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p3_ss_app_st_rxingrts0_tdata,
  output                          p3_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p3_ss_app_st_rxingrts1_tdata,
  output                          p4_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p4_ss_app_st_rxingrts0_tdata,
  output                          p4_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p4_ss_app_st_rxingrts1_tdata,
  output                          p5_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p5_ss_app_st_rxingrts0_tdata,
  output                          p5_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p5_ss_app_st_rxingrts1_tdata,
  output                          p6_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p6_ss_app_st_rxingrts0_tdata,
  output                          p6_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p6_ss_app_st_rxingrts1_tdata,
  output                          p7_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p7_ss_app_st_rxingrts0_tdata,
  output                          p7_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p7_ss_app_st_rxingrts1_tdata,
  output                          p8_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p8_ss_app_st_rxingrts0_tdata,
  output                          p8_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p8_ss_app_st_rxingrts1_tdata,
  output                          p9_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p9_ss_app_st_rxingrts0_tdata,
  output                          p9_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p9_ss_app_st_rxingrts1_tdata,
  output                          p10_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p10_ss_app_st_rxingrts0_tdata,
  output                          p10_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p10_ss_app_st_rxingrts1_tdata,
  output                          p11_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p11_ss_app_st_rxingrts0_tdata,
  output                          p11_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p11_ss_app_st_rxingrts1_tdata,
  output                          p12_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p12_ss_app_st_rxingrts0_tdata,
  output                          p12_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p12_ss_app_st_rxingrts1_tdata,
  output                          p13_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p13_ss_app_st_rxingrts0_tdata,
  output                          p13_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p13_ss_app_st_rxingrts1_tdata,
  output                          p14_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p14_ss_app_st_rxingrts0_tdata,
  output                          p14_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p14_ss_app_st_rxingrts1_tdata,
  output                          p15_ss_app_st_rxingrts0_tvalid,
  output [95:0]                   p15_ss_app_st_rxingrts0_tdata,
  output                          p15_ss_app_st_rxingrts1_tvalid,
  output [95:0]                   p15_ss_app_st_rxingrts1_tdata,
  // -----------------
  // Flow control signals, valid for MAC case only
  // -----------------
  input                           i_p0_tx_pause,
  input  [7:0]                    i_p0_tx_pfc,
  output                          o_p0_rx_pause,
  output [7:0]                    o_p0_rx_pfc,
  input                           i_p1_tx_pause,
  input  [7:0]                    i_p1_tx_pfc,
  output                          o_p1_rx_pause,
  output [7:0]                    o_p1_rx_pfc,
  input                           i_p2_tx_pause,
  input  [7:0]                    i_p2_tx_pfc,
  output                          o_p2_rx_pause,
  output [7:0]                    o_p2_rx_pfc,
  input                           i_p3_tx_pause,
  input  [7:0]                    i_p3_tx_pfc,
  output                          o_p3_rx_pause,
  output [7:0]                    o_p3_rx_pfc,
  input                           i_p4_tx_pause,
  input  [7:0]                    i_p4_tx_pfc,
  output                          o_p4_rx_pause,
  output [7:0]                    o_p4_rx_pfc,
  input                           i_p5_tx_pause,
  input  [7:0]                    i_p5_tx_pfc,
  output                          o_p5_rx_pause,
  output [7:0]                    o_p5_rx_pfc,
  input                           i_p6_tx_pause,
  input  [7:0]                    i_p6_tx_pfc,
  output                          o_p6_rx_pause,
  output [7:0]                    o_p6_rx_pfc,
  input                           i_p7_tx_pause,
  input  [7:0]                    i_p7_tx_pfc,
  output                          o_p7_rx_pause,
  output [7:0]                    o_p7_rx_pfc,
  input                           i_p8_tx_pause,
  input  [7:0]                    i_p8_tx_pfc,
  output                          o_p8_rx_pause,
  output [7:0]                    o_p8_rx_pfc,
  input                           i_p9_tx_pause,
  input  [7:0]                    i_p9_tx_pfc,
  output                          o_p9_rx_pause,
  output [7:0]                    o_p9_rx_pfc,
  input                           i_p10_tx_pause,
  input  [7:0]                    i_p10_tx_pfc,
  output                          o_p10_rx_pause,
  output [7:0]                    o_p10_rx_pfc,
  input                           i_p11_tx_pause,
  input  [7:0]                    i_p11_tx_pfc,
  output                          o_p11_rx_pause,
  output [7:0]                    o_p11_rx_pfc,
  input                           i_p12_tx_pause,
  input  [7:0]                    i_p12_tx_pfc,
  output                          o_p12_rx_pause,
  output [7:0]                    o_p12_rx_pfc,
  input                           i_p13_tx_pause,
  input  [7:0]                    i_p13_tx_pfc,
  output                          o_p13_rx_pause,
  output [7:0]                    o_p13_rx_pfc,
  input                           i_p14_tx_pause,
  input  [7:0]                    i_p14_tx_pfc,
  output                          o_p14_rx_pause,
  output [7:0]                    o_p14_rx_pfc,
  input                           i_p15_tx_pause,
  input  [7:0]                    i_p15_tx_pfc,
  output                          o_p15_rx_pause,
  output [7:0]                    o_p15_rx_pfc,
// 100G <---> 25G MAC+PCS mode DR
  // -------------------
  // PHY Serial I/O Pins
  // -------------------
  input  [PORT0_XCVR_CHANNEL-1:0]      p0_rx_serial,
  input  [PORT0_XCVR_CHANNEL-1:0]      p0_rx_serial_n,
  output [PORT0_XCVR_CHANNEL-1:0]      p0_tx_serial,
  output [PORT0_XCVR_CHANNEL-1:0]      p0_tx_serial_n,
  input  [PORT1_XCVR_CHANNEL-1:0]      p1_rx_serial,
  input  [PORT1_XCVR_CHANNEL-1:0]      p1_rx_serial_n,
  output [PORT1_XCVR_CHANNEL-1:0]      p1_tx_serial,
  output [PORT1_XCVR_CHANNEL-1:0]      p1_tx_serial_n,
  input  [PORT2_XCVR_CHANNEL-1:0]      p2_rx_serial,
  input  [PORT2_XCVR_CHANNEL-1:0]      p2_rx_serial_n,
  output [PORT2_XCVR_CHANNEL-1:0]      p2_tx_serial,
  output [PORT2_XCVR_CHANNEL-1:0]      p2_tx_serial_n,
  input  [PORT3_XCVR_CHANNEL-1:0]      p3_rx_serial,
  input  [PORT3_XCVR_CHANNEL-1:0]      p3_rx_serial_n,
  output [PORT3_XCVR_CHANNEL-1:0]      p3_tx_serial,
  output [PORT3_XCVR_CHANNEL-1:0]      p3_tx_serial_n,
  input  [PORT4_XCVR_CHANNEL-1:0]      p4_rx_serial,
  input  [PORT4_XCVR_CHANNEL-1:0]      p4_rx_serial_n,
  output [PORT4_XCVR_CHANNEL-1:0]      p4_tx_serial,
  output [PORT4_XCVR_CHANNEL-1:0]      p4_tx_serial_n,
  input  [PORT5_XCVR_CHANNEL-1:0]      p5_rx_serial,
  input  [PORT5_XCVR_CHANNEL-1:0]      p5_rx_serial_n,
  output [PORT5_XCVR_CHANNEL-1:0]      p5_tx_serial,
  output [PORT5_XCVR_CHANNEL-1:0]      p5_tx_serial_n,
  input  [PORT6_XCVR_CHANNEL-1:0]      p6_rx_serial,
  input  [PORT6_XCVR_CHANNEL-1:0]      p6_rx_serial_n,
  output [PORT6_XCVR_CHANNEL-1:0]      p6_tx_serial,
  output [PORT6_XCVR_CHANNEL-1:0]      p6_tx_serial_n,
  input  [PORT7_XCVR_CHANNEL-1:0]      p7_rx_serial,
  input  [PORT7_XCVR_CHANNEL-1:0]      p7_rx_serial_n,
  output [PORT7_XCVR_CHANNEL-1:0]      p7_tx_serial,
  output [PORT7_XCVR_CHANNEL-1:0]      p7_tx_serial_n,
  input  [PORT8_XCVR_CHANNEL-1:0]      p8_rx_serial,
  input  [PORT8_XCVR_CHANNEL-1:0]      p8_rx_serial_n,
  output [PORT8_XCVR_CHANNEL-1:0]      p8_tx_serial,
  output [PORT8_XCVR_CHANNEL-1:0]      p8_tx_serial_n,
  input  [PORT9_XCVR_CHANNEL-1:0]      p9_rx_serial,
  input  [PORT9_XCVR_CHANNEL-1:0]      p9_rx_serial_n,
  output [PORT9_XCVR_CHANNEL-1:0]      p9_tx_serial,
  output [PORT9_XCVR_CHANNEL-1:0]      p9_tx_serial_n,
  input  [PORT10_XCVR_CHANNEL-1:0]      p10_rx_serial,
  input  [PORT10_XCVR_CHANNEL-1:0]      p10_rx_serial_n,
  output [PORT10_XCVR_CHANNEL-1:0]      p10_tx_serial,
  output [PORT10_XCVR_CHANNEL-1:0]      p10_tx_serial_n,
  input  [PORT11_XCVR_CHANNEL-1:0]      p11_rx_serial,
  input  [PORT11_XCVR_CHANNEL-1:0]      p11_rx_serial_n,
  output [PORT11_XCVR_CHANNEL-1:0]      p11_tx_serial,
  output [PORT11_XCVR_CHANNEL-1:0]      p11_tx_serial_n,
  input  [PORT12_XCVR_CHANNEL-1:0]      p12_rx_serial,
  input  [PORT12_XCVR_CHANNEL-1:0]      p12_rx_serial_n,
  output [PORT12_XCVR_CHANNEL-1:0]      p12_tx_serial,
  output [PORT12_XCVR_CHANNEL-1:0]      p12_tx_serial_n,
  input  [PORT13_XCVR_CHANNEL-1:0]      p13_rx_serial,
  input  [PORT13_XCVR_CHANNEL-1:0]      p13_rx_serial_n,
  output [PORT13_XCVR_CHANNEL-1:0]      p13_tx_serial,
  output [PORT13_XCVR_CHANNEL-1:0]      p13_tx_serial_n,
  input  [PORT14_XCVR_CHANNEL-1:0]      p14_rx_serial,
  input  [PORT14_XCVR_CHANNEL-1:0]      p14_rx_serial_n,
  output [PORT14_XCVR_CHANNEL-1:0]      p14_tx_serial,
  output [PORT14_XCVR_CHANNEL-1:0]      p14_tx_serial_n,
  input  [PORT15_XCVR_CHANNEL-1:0]      p15_rx_serial,
  input  [PORT15_XCVR_CHANNEL-1:0]      p15_rx_serial_n,
  output [PORT15_XCVR_CHANNEL-1:0]      p15_tx_serial,
  output [PORT15_XCVR_CHANNEL-1:0]      p15_tx_serial_n,
  // -----------------
  // Ten Bit Interface
  // -----------------
  output [9:0]                    p0_tbi_tx_d,
  input                           p0_tbi_tx_clk,
  input                           p0_tbi_rx_clk,
  input  [9:0]                    p0_tbi_rx_d,
  output [9:0]                    p1_tbi_tx_d,
  input                           p1_tbi_tx_clk,
  input                           p1_tbi_rx_clk,
  input  [9:0]                    p1_tbi_rx_d,
  output [9:0]                    p2_tbi_tx_d,
  input                           p2_tbi_tx_clk,
  input                           p2_tbi_rx_clk,
  input  [9:0]                    p2_tbi_rx_d,
  output [9:0]                    p3_tbi_tx_d,
  input                           p3_tbi_tx_clk,
  input                           p3_tbi_rx_clk,
  input  [9:0]                    p3_tbi_rx_d,
  output [9:0]                    p4_tbi_tx_d,
  input                           p4_tbi_tx_clk,
  input                           p4_tbi_rx_clk,
  input  [9:0]                    p4_tbi_rx_d,
  output [9:0]                    p5_tbi_tx_d,
  input                           p5_tbi_tx_clk,
  input                           p5_tbi_rx_clk,
  input  [9:0]                    p5_tbi_rx_d,
  output [9:0]                    p6_tbi_tx_d,
  input                           p6_tbi_tx_clk,
  input                           p6_tbi_rx_clk,
  input  [9:0]                    p6_tbi_rx_d,
  output [9:0]                    p7_tbi_tx_d,
  input                           p7_tbi_tx_clk,
  input                           p7_tbi_rx_clk,
  input  [9:0]                    p7_tbi_rx_d,
  output [9:0]                    p8_tbi_tx_d,
  input                           p8_tbi_tx_clk,
  input                           p8_tbi_rx_clk,
  input  [9:0]                    p8_tbi_rx_d,
  output [9:0]                    p9_tbi_tx_d,
  input                           p9_tbi_tx_clk,
  input                           p9_tbi_rx_clk,
  input  [9:0]                    p9_tbi_rx_d,
  output [9:0]                    p10_tbi_tx_d,
  input                           p10_tbi_tx_clk,
  input                           p10_tbi_rx_clk,
  input  [9:0]                    p10_tbi_rx_d,
  output [9:0]                    p11_tbi_tx_d,
  input                           p11_tbi_tx_clk,
  input                           p11_tbi_rx_clk,
  input  [9:0]                    p11_tbi_rx_d,
  output [9:0]                    p12_tbi_tx_d,
  input                           p12_tbi_tx_clk,
  input                           p12_tbi_rx_clk,
  input  [9:0]                    p12_tbi_rx_d,
  output [9:0]                    p13_tbi_tx_d,
  input                           p13_tbi_tx_clk,
  input                           p13_tbi_rx_clk,
  input  [9:0]                    p13_tbi_rx_d,
  output [9:0]                    p14_tbi_tx_d,
  input                           p14_tbi_tx_clk,
  input                           p14_tbi_rx_clk,
  input  [9:0]                    p14_tbi_rx_d,
  output [9:0]                    p15_tbi_tx_d,
  input                           p15_tbi_tx_clk,
  input                           p15_tbi_rx_clk,
  input  [9:0]                    p15_tbi_rx_d,
  // --------------
  // MDIO Interface
  // --------------
  input                           p0_mdio_in,
  output                          p0_mdio_out,
  output                          p0_mdio_oen,
  output                          p0_mdc,
  input                           p1_mdio_in,
  output                          p1_mdio_out,
  output                          p1_mdio_oen,
  output                          p1_mdc,
  input                           p2_mdio_in,
  output                          p2_mdio_out,
  output                          p2_mdio_oen,
  output                          p2_mdc,
  input                           p3_mdio_in,
  output                          p3_mdio_out,
  output                          p3_mdio_oen,
  output                          p3_mdc,
  input                           p4_mdio_in,
  output                          p4_mdio_out,
  output                          p4_mdio_oen,
  output                          p4_mdc,
  input                           p5_mdio_in,
  output                          p5_mdio_out,
  output                          p5_mdio_oen,
  output                          p5_mdc,
  input                           p6_mdio_in,
  output                          p6_mdio_out,
  output                          p6_mdio_oen,
  output                          p6_mdc,
  input                           p7_mdio_in,
  output                          p7_mdio_out,
  output                          p7_mdio_oen,
  output                          p7_mdc,
  input                           p8_mdio_in,
  output                          p8_mdio_out,
  output                          p8_mdio_oen,
  output                          p8_mdc,
  input                           p9_mdio_in,
  output                          p9_mdio_out,
  output                          p9_mdio_oen,
  output                          p9_mdc,
  input                           p10_mdio_in,
  output                          p10_mdio_out,
  output                          p10_mdio_oen,
  output                          p10_mdc,
  input                           p11_mdio_in,
  output                          p11_mdio_out,
  output                          p11_mdio_oen,
  output                          p11_mdc,
  input                           p12_mdio_in,
  output                          p12_mdio_out,
  output                          p12_mdio_oen,
  output                          p12_mdc,
  input                           p13_mdio_in,
  output                          p13_mdio_out,
  output                          p13_mdio_oen,
  output                          p13_mdc,
  input                           p14_mdio_in,
  output                          p14_mdio_out,
  output                          p14_mdio_oen,
  output                          p14_mdc,
  input                           p15_mdio_in,
  output                          p15_mdio_out,
  output                          p15_mdio_oen,
  output                          p15_mdc,
  // -----------------------
  // Status Signal Interface
  // -----------------------
  output                          p0_led_link,
  output                          p0_led_panel_link,
  output                          p0_led_crs,
  output                          p0_led_col,
  output                          p0_led_an,
  output                          p0_led_char_err,
  output                          p0_led_disp_err,
  output                          p1_led_link,
  output                          p1_led_panel_link,
  output                          p1_led_crs,
  output                          p1_led_col,
  output                          p1_led_an,
  output                          p1_led_char_err,
  output                          p1_led_disp_err,
  output                          p2_led_link,
  output                          p2_led_panel_link,
  output                          p2_led_crs,
  output                          p2_led_col,
  output                          p2_led_an,
  output                          p2_led_char_err,
  output                          p2_led_disp_err,
  output                          p3_led_link,
  output                          p3_led_panel_link,
  output                          p3_led_crs,
  output                          p3_led_col,
  output                          p3_led_an,
  output                          p3_led_char_err,
  output                          p3_led_disp_err,
  output                          p4_led_link,
  output                          p4_led_panel_link,
  output                          p4_led_crs,
  output                          p4_led_col,
  output                          p4_led_an,
  output                          p4_led_char_err,
  output                          p4_led_disp_err,
  output                          p5_led_link,
  output                          p5_led_panel_link,
  output                          p5_led_crs,
  output                          p5_led_col,
  output                          p5_led_an,
  output                          p5_led_char_err,
  output                          p5_led_disp_err,
  output                          p6_led_link,
  output                          p6_led_panel_link,
  output                          p6_led_crs,
  output                          p6_led_col,
  output                          p6_led_an,
  output                          p6_led_char_err,
  output                          p6_led_disp_err,
  output                          p7_led_link,
  output                          p7_led_panel_link,
  output                          p7_led_crs,
  output                          p7_led_col,
  output                          p7_led_an,
  output                          p7_led_char_err,
  output                          p7_led_disp_err,
  output                          p8_led_link,
  output                          p8_led_panel_link,
  output                          p8_led_crs,
  output                          p8_led_col,
  output                          p8_led_an,
  output                          p8_led_char_err,
  output                          p8_led_disp_err,
  output                          p9_led_link,
  output                          p9_led_panel_link,
  output                          p9_led_crs,
  output                          p9_led_col,
  output                          p9_led_an,
  output                          p9_led_char_err,
  output                          p9_led_disp_err,
  output                          p10_led_link,
  output                          p10_led_panel_link,
  output                          p10_led_crs,
  output                          p10_led_col,
  output                          p10_led_an,
  output                          p10_led_char_err,
  output                          p10_led_disp_err,
  output                          p11_led_link,
  output                          p11_led_panel_link,
  output                          p11_led_crs,
  output                          p11_led_col,
  output                          p11_led_an,
  output                          p11_led_char_err,
  output                          p11_led_disp_err,
  output                          p12_led_link,
  output                          p12_led_panel_link,
  output                          p12_led_crs,
  output                          p12_led_col,
  output                          p12_led_an,
  output                          p12_led_char_err,
  output                          p12_led_disp_err,
  output                          p13_led_link,
  output                          p13_led_panel_link,
  output                          p13_led_crs,
  output                          p13_led_col,
  output                          p13_led_an,
  output                          p13_led_char_err,
  output                          p13_led_disp_err,
  output                          p14_led_link,
  output                          p14_led_panel_link,
  output                          p14_led_crs,
  output                          p14_led_col,
  output                          p14_led_an,
  output                          p14_led_char_err,
  output                          p14_led_disp_err,
  output                          p15_led_link,
  output                          p15_led_panel_link,
  output                          p15_led_crs,
  output                          p15_led_col,
  output                          p15_led_an,
  output                          p15_led_char_err,
  output                          p15_led_disp_err,
  // -----------------------------------------
  // Miscellaneous Functional Signal Interface
  // -----------------------------------------
  output                          p0_tx_lanes_stable,
  output                          p0_rx_pcs_ready,
  output                          o_p0_rx_pcs_fully_aligned,
  output                          o_p0_tx_pll_locked,
  output                          o_p0_tx_ptp_ready,
  output                          o_p0_rx_ptp_ready,
  output                          p1_tx_lanes_stable,
  output                          p1_rx_pcs_ready,
  output                          o_p1_rx_pcs_fully_aligned,
  output                          o_p1_tx_pll_locked,
  output                          o_p1_tx_ptp_ready,
  output                          o_p1_rx_ptp_ready,
  output                          p2_tx_lanes_stable,
  output                          p2_rx_pcs_ready,
  output                          o_p2_rx_pcs_fully_aligned,
  output                          o_p2_tx_pll_locked,
  output                          o_p2_tx_ptp_ready,
  output                          o_p2_rx_ptp_ready,
  output                          p3_tx_lanes_stable,
  output                          p3_rx_pcs_ready,
  output                          o_p3_rx_pcs_fully_aligned,
  output                          o_p3_tx_pll_locked,
  output                          o_p3_tx_ptp_ready,
  output                          o_p3_rx_ptp_ready,
  output                          p4_tx_lanes_stable,
  output                          p4_rx_pcs_ready,
  output                          o_p4_rx_pcs_fully_aligned,
  output                          o_p4_tx_pll_locked,
  output                          o_p4_tx_ptp_ready,
  output                          o_p4_rx_ptp_ready,
  output                          p5_tx_lanes_stable,
  output                          p5_rx_pcs_ready,
  output                          o_p5_rx_pcs_fully_aligned,
  output                          o_p5_tx_pll_locked,
  output                          o_p5_tx_ptp_ready,
  output                          o_p5_rx_ptp_ready,
  output                          p6_tx_lanes_stable,
  output                          p6_rx_pcs_ready,
  output                          o_p6_rx_pcs_fully_aligned,
  output                          o_p6_tx_pll_locked,
  output                          o_p6_tx_ptp_ready,
  output                          o_p6_rx_ptp_ready,
  output                          p7_tx_lanes_stable,
  output                          p7_rx_pcs_ready,
  output                          o_p7_rx_pcs_fully_aligned,
  output                          o_p7_tx_pll_locked,
  output                          o_p7_tx_ptp_ready,
  output                          o_p7_rx_ptp_ready,
  output                          p8_tx_lanes_stable,
  output                          p8_rx_pcs_ready,
  output                          o_p8_rx_pcs_fully_aligned,
  output                          o_p8_tx_pll_locked,
  output                          o_p8_tx_ptp_ready,
  output                          o_p8_rx_ptp_ready,
  output                          p9_tx_lanes_stable,
  output                          p9_rx_pcs_ready,
  output                          o_p9_rx_pcs_fully_aligned,
  output                          o_p9_tx_pll_locked,
  output                          o_p9_tx_ptp_ready,
  output                          o_p9_rx_ptp_ready,
  output                          p10_tx_lanes_stable,
  output                          p10_rx_pcs_ready,
  output                          o_p10_rx_pcs_fully_aligned,
  output                          o_p10_tx_pll_locked,
  output                          o_p10_tx_ptp_ready,
  output                          o_p10_rx_ptp_ready,
  output                          p11_tx_lanes_stable,
  output                          p11_rx_pcs_ready,
  output                          o_p11_rx_pcs_fully_aligned,
  output                          o_p11_tx_pll_locked,
  output                          o_p11_tx_ptp_ready,
  output                          o_p11_rx_ptp_ready,
  output                          p12_tx_lanes_stable,
  output                          p12_rx_pcs_ready,
  output                          o_p12_rx_pcs_fully_aligned,
  output                          o_p12_tx_pll_locked,
  output                          o_p12_tx_ptp_ready,
  output                          o_p12_rx_ptp_ready,
  output                          p13_tx_lanes_stable,
  output                          p13_rx_pcs_ready,
  output                          o_p13_rx_pcs_fully_aligned,
  output                          o_p13_tx_pll_locked,
  output                          o_p13_tx_ptp_ready,
  output                          o_p13_rx_ptp_ready,
  output                          p14_tx_lanes_stable,
  output                          p14_rx_pcs_ready,
  output                          o_p14_rx_pcs_fully_aligned,
  output                          o_p14_tx_pll_locked,
  output                          o_p14_tx_ptp_ready,
  output                          o_p14_rx_ptp_ready,
  output                          p15_tx_lanes_stable,
  output                          p15_rx_pcs_ready,
  output                          o_p15_rx_pcs_fully_aligned,
  output                          o_p15_tx_pll_locked,
  output                          o_p15_tx_ptp_ready,
  output                          o_p15_rx_ptp_ready,
  // ---------------------------------
  // General PHY Direct Status Signals
  // ---------------------------------
  output                          p0_tx_pma_ready_a,
  output                          p0_rx_pma_ready_a,
  //
  output                          p0_tx_maib_fifo_full,
  output                          p0_tx_maib_fifo_empty_a,
  output                          p0_tx_maib_fifo_pfull,
  output                          p0_tx_maib_fifo_pempty_a,
  //
  input                           p0_rx_maib_fifo_rd_en,
  output                          p0_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p0_rx_maib_fifo_empty,
  output                          p0_rx_maib_fifo_pfull_a,
  output                          p0_rx_maib_fifo_pempty,
  input                           i_p0_custom_cadence, 
  output                          p1_tx_pma_ready_a,
  output                          p1_rx_pma_ready_a,
  //
  output                          p1_tx_maib_fifo_full,
  output                          p1_tx_maib_fifo_empty_a,
  output                          p1_tx_maib_fifo_pfull,
  output                          p1_tx_maib_fifo_pempty_a,
  //
  input                           p1_rx_maib_fifo_rd_en,
  output                          p1_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p1_rx_maib_fifo_empty,
  output                          p1_rx_maib_fifo_pfull_a,
  output                          p1_rx_maib_fifo_pempty,
  input                           i_p1_custom_cadence, 
  output                          p2_tx_pma_ready_a,
  output                          p2_rx_pma_ready_a,
  //
  output                          p2_tx_maib_fifo_full,
  output                          p2_tx_maib_fifo_empty_a,
  output                          p2_tx_maib_fifo_pfull,
  output                          p2_tx_maib_fifo_pempty_a,
  //
  input                           p2_rx_maib_fifo_rd_en,
  output                          p2_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p2_rx_maib_fifo_empty,
  output                          p2_rx_maib_fifo_pfull_a,
  output                          p2_rx_maib_fifo_pempty,
  input                           i_p2_custom_cadence, 
  output                          p3_tx_pma_ready_a,
  output                          p3_rx_pma_ready_a,
  //
  output                          p3_tx_maib_fifo_full,
  output                          p3_tx_maib_fifo_empty_a,
  output                          p3_tx_maib_fifo_pfull,
  output                          p3_tx_maib_fifo_pempty_a,
  //
  input                           p3_rx_maib_fifo_rd_en,
  output                          p3_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p3_rx_maib_fifo_empty,
  output                          p3_rx_maib_fifo_pfull_a,
  output                          p3_rx_maib_fifo_pempty,
  input                           i_p3_custom_cadence, 
  output                          p4_tx_pma_ready_a,
  output                          p4_rx_pma_ready_a,
  //
  output                          p4_tx_maib_fifo_full,
  output                          p4_tx_maib_fifo_empty_a,
  output                          p4_tx_maib_fifo_pfull,
  output                          p4_tx_maib_fifo_pempty_a,
  //
  input                           p4_rx_maib_fifo_rd_en,
  output                          p4_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p4_rx_maib_fifo_empty,
  output                          p4_rx_maib_fifo_pfull_a,
  output                          p4_rx_maib_fifo_pempty,
  input                           i_p4_custom_cadence, 
  output                          p5_tx_pma_ready_a,
  output                          p5_rx_pma_ready_a,
  //
  output                          p5_tx_maib_fifo_full,
  output                          p5_tx_maib_fifo_empty_a,
  output                          p5_tx_maib_fifo_pfull,
  output                          p5_tx_maib_fifo_pempty_a,
  //
  input                           p5_rx_maib_fifo_rd_en,
  output                          p5_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p5_rx_maib_fifo_empty,
  output                          p5_rx_maib_fifo_pfull_a,
  output                          p5_rx_maib_fifo_pempty,
  input                           i_p5_custom_cadence, 
  output                          p6_tx_pma_ready_a,
  output                          p6_rx_pma_ready_a,
  //
  output                          p6_tx_maib_fifo_full,
  output                          p6_tx_maib_fifo_empty_a,
  output                          p6_tx_maib_fifo_pfull,
  output                          p6_tx_maib_fifo_pempty_a,
  //
  input                           p6_rx_maib_fifo_rd_en,
  output                          p6_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p6_rx_maib_fifo_empty,
  output                          p6_rx_maib_fifo_pfull_a,
  output                          p6_rx_maib_fifo_pempty,
  input                           i_p6_custom_cadence, 
  output                          p7_tx_pma_ready_a,
  output                          p7_rx_pma_ready_a,
  //
  output                          p7_tx_maib_fifo_full,
  output                          p7_tx_maib_fifo_empty_a,
  output                          p7_tx_maib_fifo_pfull,
  output                          p7_tx_maib_fifo_pempty_a,
  //
  input                           p7_rx_maib_fifo_rd_en,
  output                          p7_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p7_rx_maib_fifo_empty,
  output                          p7_rx_maib_fifo_pfull_a,
  output                          p7_rx_maib_fifo_pempty,
  input                           i_p7_custom_cadence, 
  output                          p8_tx_pma_ready_a,
  output                          p8_rx_pma_ready_a,
  //
  output                          p8_tx_maib_fifo_full,
  output                          p8_tx_maib_fifo_empty_a,
  output                          p8_tx_maib_fifo_pfull,
  output                          p8_tx_maib_fifo_pempty_a,
  //
  input                           p8_rx_maib_fifo_rd_en,
  output                          p8_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p8_rx_maib_fifo_empty,
  output                          p8_rx_maib_fifo_pfull_a,
  output                          p8_rx_maib_fifo_pempty,
  input                           i_p8_custom_cadence, 
  output                          p9_tx_pma_ready_a,
  output                          p9_rx_pma_ready_a,
  //
  output                          p9_tx_maib_fifo_full,
  output                          p9_tx_maib_fifo_empty_a,
  output                          p9_tx_maib_fifo_pfull,
  output                          p9_tx_maib_fifo_pempty_a,
  //
  input                           p9_rx_maib_fifo_rd_en,
  output                          p9_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p9_rx_maib_fifo_empty,
  output                          p9_rx_maib_fifo_pfull_a,
  output                          p9_rx_maib_fifo_pempty,
  input                           i_p9_custom_cadence, 
  output                          p10_tx_pma_ready_a,
  output                          p10_rx_pma_ready_a,
  //
  output                          p10_tx_maib_fifo_full,
  output                          p10_tx_maib_fifo_empty_a,
  output                          p10_tx_maib_fifo_pfull,
  output                          p10_tx_maib_fifo_pempty_a,
  //
  input                           p10_rx_maib_fifo_rd_en,
  output                          p10_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p10_rx_maib_fifo_empty,
  output                          p10_rx_maib_fifo_pfull_a,
  output                          p10_rx_maib_fifo_pempty,
  input                           i_p10_custom_cadence, 
  output                          p11_tx_pma_ready_a,
  output                          p11_rx_pma_ready_a,
  //
  output                          p11_tx_maib_fifo_full,
  output                          p11_tx_maib_fifo_empty_a,
  output                          p11_tx_maib_fifo_pfull,
  output                          p11_tx_maib_fifo_pempty_a,
  //
  input                           p11_rx_maib_fifo_rd_en,
  output                          p11_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p11_rx_maib_fifo_empty,
  output                          p11_rx_maib_fifo_pfull_a,
  output                          p11_rx_maib_fifo_pempty,
  input                           i_p11_custom_cadence, 
  output                          p12_tx_pma_ready_a,
  output                          p12_rx_pma_ready_a,
  //
  output                          p12_tx_maib_fifo_full,
  output                          p12_tx_maib_fifo_empty_a,
  output                          p12_tx_maib_fifo_pfull,
  output                          p12_tx_maib_fifo_pempty_a,
  //
  input                           p12_rx_maib_fifo_rd_en,
  output                          p12_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p12_rx_maib_fifo_empty,
  output                          p12_rx_maib_fifo_pfull_a,
  output                          p12_rx_maib_fifo_pempty,
  input                           i_p12_custom_cadence, 
  output                          p13_tx_pma_ready_a,
  output                          p13_rx_pma_ready_a,
  //
  output                          p13_tx_maib_fifo_full,
  output                          p13_tx_maib_fifo_empty_a,
  output                          p13_tx_maib_fifo_pfull,
  output                          p13_tx_maib_fifo_pempty_a,
  //
  input                           p13_rx_maib_fifo_rd_en,
  output                          p13_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p13_rx_maib_fifo_empty,
  output                          p13_rx_maib_fifo_pfull_a,
  output                          p13_rx_maib_fifo_pempty,
  input                           i_p13_custom_cadence, 
  output                          p14_tx_pma_ready_a,
  output                          p14_rx_pma_ready_a,
  //
  output                          p14_tx_maib_fifo_full,
  output                          p14_tx_maib_fifo_empty_a,
  output                          p14_tx_maib_fifo_pfull,
  output                          p14_tx_maib_fifo_pempty_a,
  //
  input                           p14_rx_maib_fifo_rd_en,
  output                          p14_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p14_rx_maib_fifo_empty,
  output                          p14_rx_maib_fifo_pfull_a,
  output                          p14_rx_maib_fifo_pempty,
  input                           i_p14_custom_cadence, 
  output                          p15_tx_pma_ready_a,
  output                          p15_rx_pma_ready_a,
  //
  output                          p15_tx_maib_fifo_full,
  output                          p15_tx_maib_fifo_empty_a,
  output                          p15_tx_maib_fifo_pfull,
  output                          p15_tx_maib_fifo_pempty_a,
  //
  input                           p15_rx_maib_fifo_rd_en,
  output                          p15_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p15_rx_maib_fifo_empty,
  output                          p15_rx_maib_fifo_pfull_a,
  output                          p15_rx_maib_fifo_pempty,
  input                           i_p15_custom_cadence, 

// 25G <---> CPRI DR 
  // -------------------------------
  // Deterministic Latency Interface
  // -------------------------------
  output                          o_p0_sl_tx_dl_async_pulse,
  output                          o_p0_sl_rx_dl_async_pulse,
  input                           i_p0_sl_latency_sclk,
  input                           i_p0_sl_tx_dl_measure_sel,
  input                           i_p0_sl_rx_dl_measure_sel,
  output                          o_p1_sl_tx_dl_async_pulse,
  output                          o_p1_sl_rx_dl_async_pulse,
  input                           i_p1_sl_latency_sclk,
  input                           i_p1_sl_tx_dl_measure_sel,
  input                           i_p1_sl_rx_dl_measure_sel,
  output                          o_p2_sl_tx_dl_async_pulse,
  output                          o_p2_sl_rx_dl_async_pulse,
  input                           i_p2_sl_latency_sclk,
  input                           i_p2_sl_tx_dl_measure_sel,
  input                           i_p2_sl_rx_dl_measure_sel,
  output                          o_p3_sl_tx_dl_async_pulse,
  output                          o_p3_sl_rx_dl_async_pulse,
  input                           i_p3_sl_latency_sclk,
  input                           i_p3_sl_tx_dl_measure_sel,
  input                           i_p3_sl_rx_dl_measure_sel,
  output                          o_p4_sl_tx_dl_async_pulse,
  output                          o_p4_sl_rx_dl_async_pulse,
  input                           i_p4_sl_latency_sclk,
  input                           i_p4_sl_tx_dl_measure_sel,
  input                           i_p4_sl_rx_dl_measure_sel,
  output                          o_p5_sl_tx_dl_async_pulse,
  output                          o_p5_sl_rx_dl_async_pulse,
  input                           i_p5_sl_latency_sclk,
  input                           i_p5_sl_tx_dl_measure_sel,
  input                           i_p5_sl_rx_dl_measure_sel,
  output                          o_p6_sl_tx_dl_async_pulse,
  output                          o_p6_sl_rx_dl_async_pulse,
  input                           i_p6_sl_latency_sclk,
  input                           i_p6_sl_tx_dl_measure_sel,
  input                           i_p6_sl_rx_dl_measure_sel,
  output                          o_p7_sl_tx_dl_async_pulse,
  output                          o_p7_sl_rx_dl_async_pulse,
  input                           i_p7_sl_latency_sclk,
  input                           i_p7_sl_tx_dl_measure_sel,
  input                           i_p7_sl_rx_dl_measure_sel,
  output                          o_p8_sl_tx_dl_async_pulse,
  output                          o_p8_sl_rx_dl_async_pulse,
  input                           i_p8_sl_latency_sclk,
  input                           i_p8_sl_tx_dl_measure_sel,
  input                           i_p8_sl_rx_dl_measure_sel,
  output                          o_p9_sl_tx_dl_async_pulse,
  output                          o_p9_sl_rx_dl_async_pulse,
  input                           i_p9_sl_latency_sclk,
  input                           i_p9_sl_tx_dl_measure_sel,
  input                           i_p9_sl_rx_dl_measure_sel,
  output                          o_p10_sl_tx_dl_async_pulse,
  output                          o_p10_sl_rx_dl_async_pulse,
  input                           i_p10_sl_latency_sclk,
  input                           i_p10_sl_tx_dl_measure_sel,
  input                           i_p10_sl_rx_dl_measure_sel,
  output                          o_p11_sl_tx_dl_async_pulse,
  output                          o_p11_sl_rx_dl_async_pulse,
  input                           i_p11_sl_latency_sclk,
  input                           i_p11_sl_tx_dl_measure_sel,
  input                           i_p11_sl_rx_dl_measure_sel,
  output                          o_p12_sl_tx_dl_async_pulse,
  output                          o_p12_sl_rx_dl_async_pulse,
  input                           i_p12_sl_latency_sclk,
  input                           i_p12_sl_tx_dl_measure_sel,
  input                           i_p12_sl_rx_dl_measure_sel,
  output                          o_p13_sl_tx_dl_async_pulse,
  output                          o_p13_sl_rx_dl_async_pulse,
  input                           i_p13_sl_latency_sclk,
  input                           i_p13_sl_tx_dl_measure_sel,
  input                           i_p13_sl_rx_dl_measure_sel,
  output                          o_p14_sl_tx_dl_async_pulse,
  output                          o_p14_sl_rx_dl_async_pulse,
  input                           i_p14_sl_latency_sclk,
  input                           i_p14_sl_tx_dl_measure_sel,
  input                           i_p14_sl_rx_dl_measure_sel,
  output                          o_p15_sl_tx_dl_async_pulse,
  output                          o_p15_sl_rx_dl_async_pulse,
  input                           i_p15_sl_latency_sclk,
  input                           i_p15_sl_tx_dl_measure_sel,
  input                           i_p15_sl_rx_dl_measure_sel,
  // ---------------------
  // Custom Rate Interface
  // ---------------------
  output                          o_p0_txfifo_pfull, //TBD already there
  output                          o_p0_txfifo_pempty,
  output                          o_p0_txfifo_overflow,
  output                          o_p0_txfifo_underflow,
  output                          o_p1_txfifo_pfull, //TBD already there
  output                          o_p1_txfifo_pempty,
  output                          o_p1_txfifo_overflow,
  output                          o_p1_txfifo_underflow,
  output                          o_p2_txfifo_pfull, //TBD already there
  output                          o_p2_txfifo_pempty,
  output                          o_p2_txfifo_overflow,
  output                          o_p2_txfifo_underflow,
  output                          o_p3_txfifo_pfull, //TBD already there
  output                          o_p3_txfifo_pempty,
  output                          o_p3_txfifo_overflow,
  output                          o_p3_txfifo_underflow,
  output                          o_p4_txfifo_pfull, //TBD already there
  output                          o_p4_txfifo_pempty,
  output                          o_p4_txfifo_overflow,
  output                          o_p4_txfifo_underflow,
  output                          o_p5_txfifo_pfull, //TBD already there
  output                          o_p5_txfifo_pempty,
  output                          o_p5_txfifo_overflow,
  output                          o_p5_txfifo_underflow,
  output                          o_p6_txfifo_pfull, //TBD already there
  output                          o_p6_txfifo_pempty,
  output                          o_p6_txfifo_overflow,
  output                          o_p6_txfifo_underflow,
  output                          o_p7_txfifo_pfull, //TBD already there
  output                          o_p7_txfifo_pempty,
  output                          o_p7_txfifo_overflow,
  output                          o_p7_txfifo_underflow,
  output                          o_p8_txfifo_pfull, //TBD already there
  output                          o_p8_txfifo_pempty,
  output                          o_p8_txfifo_overflow,
  output                          o_p8_txfifo_underflow,
  output                          o_p9_txfifo_pfull, //TBD already there
  output                          o_p9_txfifo_pempty,
  output                          o_p9_txfifo_overflow,
  output                          o_p9_txfifo_underflow,
  output                          o_p10_txfifo_pfull, //TBD already there
  output                          o_p10_txfifo_pempty,
  output                          o_p10_txfifo_overflow,
  output                          o_p10_txfifo_underflow,
  output                          o_p11_txfifo_pfull, //TBD already there
  output                          o_p11_txfifo_pempty,
  output                          o_p11_txfifo_overflow,
  output                          o_p11_txfifo_underflow,
  output                          o_p12_txfifo_pfull, //TBD already there
  output                          o_p12_txfifo_pempty,
  output                          o_p12_txfifo_overflow,
  output                          o_p12_txfifo_underflow,
  output                          o_p13_txfifo_pfull, //TBD already there
  output                          o_p13_txfifo_pempty,
  output                          o_p13_txfifo_overflow,
  output                          o_p13_txfifo_underflow,
  output                          o_p14_txfifo_pfull, //TBD already there
  output                          o_p14_txfifo_pempty,
  output                          o_p14_txfifo_overflow,
  output                          o_p14_txfifo_underflow,
  output                          o_p15_txfifo_pfull, //TBD already there
  output                          o_p15_txfifo_pempty,
  output                          o_p15_txfifo_overflow,
  output                          o_p15_txfifo_underflow,
  output [2:0]                    port0_led_speed,
  output [2:0]                    port0_led_status,
  output [2:0]                    port1_led_speed,
  output [2:0]                    port1_led_status,
  output [2:0]                    port2_led_speed,
  output [2:0]                    port2_led_status,
  output [2:0]                    port3_led_speed,
  output [2:0]                    port3_led_status,
  output [2:0]                    port4_led_speed,
  output [2:0]                    port4_led_status,
  output [2:0]                    port5_led_speed,
  output [2:0]                    port5_led_status,
  output [2:0]                    port6_led_speed,
  output [2:0]                    port6_led_status,
  output [2:0]                    port7_led_speed,
  output [2:0]                    port7_led_status,
  output [2:0]                    port8_led_speed,
  output [2:0]                    port8_led_status,
  output [2:0]                    port9_led_speed,
  output [2:0]                    port9_led_status,
  output [2:0]                    port10_led_speed,
  output [2:0]                    port10_led_status,
  output [2:0]                    port11_led_speed,
  output [2:0]                    port11_led_status,
  output [2:0]                    port12_led_speed,
  output [2:0]                    port12_led_status,
  output [2:0]                    port13_led_speed,
  output [2:0]                    port13_led_status,
  output [2:0]                    port14_led_speed,
  output [2:0]                    port14_led_status,
  output [2:0]                    port15_led_speed,
  output [2:0]                    port15_led_status,
  output tp //dummy
);

//TOP level user parameter is not used, SIM_MODE_EN is set based on synth or sim files
localparam SIM_MODE_EN  = 0;
localparam ENABLE_DUMMY_WAIT_REQ_GEN = 1'b1; 
localparam HUNG_WAIT_TIME   = SIM_MODE_EN ? (32'd1000000 / 10) : 32'd1000000; 

// ==========================================================================
// Logic port declaration for AXI4 Bridge  
// ==========================================================================
wire ecc_event;
          wire [5:0]  p0_curr_profile;
          //eth reconfig AVMM
          wire [13:0] p0_eth_reconfig_address;
          wire        p0_eth_reconfig_read;
          wire        p0_eth_reconfig_write;
          wire        p0_eth_reconfig_waitrequest;
          wire        p0_eth_reconfig_readdatavalid;
          wire [31:0] p0_eth_reconfig_readdata;
          wire [31:0] p0_eth_reconfig_writedata;
          //XCVR AVMM reconfig
          wire [16:0] p0_c0_xcvr_reconfig_address;
          wire        p0_c0_xcvr_reconfig_read;
          wire        p0_c0_xcvr_reconfig_write;
          wire        p0_c0_xcvr_reconfig_waitrequest;
          wire        p0_c0_xcvr_reconfig_readdatavalid;
          wire [7:0]  p0_c0_xcvr_reconfig_readdata;
          wire [7:0]  p0_c0_xcvr_reconfig_writedata;
          //FEC Reconfig AVMM
          wire [9:0]   p0_rsfec_reconfig_address;
          wire         p0_rsfec_reconfig_read;
          wire         p0_rsfec_reconfig_write;
          wire         p0_rsfec_reconfig_waitrequest;
          wire         p0_rsfec_reconfig_readdatavalid;
          wire [7:0]   p0_rsfec_reconfig_readdata;
          wire [7:0]   p0_rsfec_reconfig_writedata;
//  Two AVMM bus for PTP, per EHIP core (not per port or per channel)
            wire [16:0] p0_ptp0_reconfig_address;
            wire        p0_ptp0_reconfig_read;
            wire        p0_ptp0_reconfig_write;
            wire        p0_ptp0_reconfig_waitrequest;
            wire        p0_ptp0_reconfig_readdatavalid;
            wire [7:0]  p0_ptp0_reconfig_readdata;
            wire [7:0]  p0_ptp0_reconfig_writedata;
            wire [16:0] p0_ptp1_reconfig_address;
            wire        p0_ptp1_reconfig_read;
            wire        p0_ptp1_reconfig_write;
            wire        p0_ptp1_reconfig_waitrequest;
            wire        p0_ptp1_reconfig_readdatavalid;
            wire [7:0]  p0_ptp1_reconfig_readdata;
            wire [7:0]  p0_ptp1_reconfig_writedata;
          wire [5:0]  p1_curr_profile;
          //eth reconfig AVMM
          wire [13:0] p1_eth_reconfig_address;
          wire        p1_eth_reconfig_read;
          wire        p1_eth_reconfig_write;
          wire        p1_eth_reconfig_waitrequest;
          wire        p1_eth_reconfig_readdatavalid;
          wire [31:0] p1_eth_reconfig_readdata;
          wire [31:0] p1_eth_reconfig_writedata;
          //XCVR AVMM reconfig
          wire [16:0] p1_c0_xcvr_reconfig_address;
          wire        p1_c0_xcvr_reconfig_read;
          wire        p1_c0_xcvr_reconfig_write;
          wire        p1_c0_xcvr_reconfig_waitrequest;
          wire        p1_c0_xcvr_reconfig_readdatavalid;
          wire [7:0]  p1_c0_xcvr_reconfig_readdata;
          wire [7:0]  p1_c0_xcvr_reconfig_writedata;
          //FEC Reconfig AVMM
//  Two AVMM bus for PTP, per EHIP core (not per port or per channel)
          wire [5:0]  p2_curr_profile;
          //eth reconfig AVMM
          wire [13:0] p2_eth_reconfig_address;
          wire        p2_eth_reconfig_read;
          wire        p2_eth_reconfig_write;
          wire        p2_eth_reconfig_waitrequest;
          wire        p2_eth_reconfig_readdatavalid;
          wire [31:0] p2_eth_reconfig_readdata;
          wire [31:0] p2_eth_reconfig_writedata;
          //XCVR AVMM reconfig
          wire [16:0] p2_c0_xcvr_reconfig_address;
          wire        p2_c0_xcvr_reconfig_read;
          wire        p2_c0_xcvr_reconfig_write;
          wire        p2_c0_xcvr_reconfig_waitrequest;
          wire        p2_c0_xcvr_reconfig_readdatavalid;
          wire [7:0]  p2_c0_xcvr_reconfig_readdata;
          wire [7:0]  p2_c0_xcvr_reconfig_writedata;
          //FEC Reconfig AVMM
//  Two AVMM bus for PTP, per EHIP core (not per port or per channel)
          wire [5:0]  p3_curr_profile;
          //eth reconfig AVMM
          wire [13:0] p3_eth_reconfig_address;
          wire        p3_eth_reconfig_read;
          wire        p3_eth_reconfig_write;
          wire        p3_eth_reconfig_waitrequest;
          wire        p3_eth_reconfig_readdatavalid;
          wire [31:0] p3_eth_reconfig_readdata;
          wire [31:0] p3_eth_reconfig_writedata;
          //XCVR AVMM reconfig
          wire [16:0] p3_c0_xcvr_reconfig_address;
          wire        p3_c0_xcvr_reconfig_read;
          wire        p3_c0_xcvr_reconfig_write;
          wire        p3_c0_xcvr_reconfig_waitrequest;
          wire        p3_c0_xcvr_reconfig_readdatavalid;
          wire [7:0]  p3_c0_xcvr_reconfig_readdata;
          wire [7:0]  p3_c0_xcvr_reconfig_writedata;
          //FEC Reconfig AVMM
//  Two AVMM bus for PTP, per EHIP core (not per port or per channel)

		    wire [7:0]  p0_ptp_parser_reconfig_awaddr;  
		    wire [2:0]  p0_ptp_parser_reconfig_awprot;  
		    wire        p0_ptp_parser_reconfig_awvalid; 
		    wire        p0_ptp_parser_reconfig_awready; 
		    wire [31:0] p0_ptp_parser_reconfig_wdata;   
		    wire [3:0]  p0_ptp_parser_reconfig_wstrb;   
		    wire        p0_ptp_parser_reconfig_wvalid;  
		    wire        p0_ptp_parser_reconfig_wready;  
		    wire [1:0]  p0_ptp_parser_reconfig_bresp;   
		    wire        p0_ptp_parser_reconfig_bvalid;  
		    wire        p0_ptp_parser_reconfig_bready;  
		    wire [7:0]  p0_ptp_parser_reconfig_araddr;  
		    wire [2:0]  p0_ptp_parser_reconfig_arprot;  
		    wire        p0_ptp_parser_reconfig_arvalid; 
		    wire        p0_ptp_parser_reconfig_arready; 
		    wire [31:0] p0_ptp_parser_reconfig_rdata;   
		    wire [1:0]  p0_ptp_parser_reconfig_rresp;   
		    wire        p0_ptp_parser_reconfig_rvalid;  
		    wire        p0_ptp_parser_reconfig_rready;  
		    wire [7:0]  p1_ptp_parser_reconfig_awaddr;  
		    wire [2:0]  p1_ptp_parser_reconfig_awprot;  
		    wire        p1_ptp_parser_reconfig_awvalid; 
		    wire        p1_ptp_parser_reconfig_awready; 
		    wire [31:0] p1_ptp_parser_reconfig_wdata;   
		    wire [3:0]  p1_ptp_parser_reconfig_wstrb;   
		    wire        p1_ptp_parser_reconfig_wvalid;  
		    wire        p1_ptp_parser_reconfig_wready;  
		    wire [1:0]  p1_ptp_parser_reconfig_bresp;   
		    wire        p1_ptp_parser_reconfig_bvalid;  
		    wire        p1_ptp_parser_reconfig_bready;  
		    wire [7:0]  p1_ptp_parser_reconfig_araddr;  
		    wire [2:0]  p1_ptp_parser_reconfig_arprot;  
		    wire        p1_ptp_parser_reconfig_arvalid; 
		    wire        p1_ptp_parser_reconfig_arready; 
		    wire [31:0] p1_ptp_parser_reconfig_rdata;   
		    wire [1:0]  p1_ptp_parser_reconfig_rresp;   
		    wire        p1_ptp_parser_reconfig_rvalid;  
		    wire        p1_ptp_parser_reconfig_rready;  
		    wire [7:0]  p2_ptp_parser_reconfig_awaddr;  
		    wire [2:0]  p2_ptp_parser_reconfig_awprot;  
		    wire        p2_ptp_parser_reconfig_awvalid; 
		    wire        p2_ptp_parser_reconfig_awready; 
		    wire [31:0] p2_ptp_parser_reconfig_wdata;   
		    wire [3:0]  p2_ptp_parser_reconfig_wstrb;   
		    wire        p2_ptp_parser_reconfig_wvalid;  
		    wire        p2_ptp_parser_reconfig_wready;  
		    wire [1:0]  p2_ptp_parser_reconfig_bresp;   
		    wire        p2_ptp_parser_reconfig_bvalid;  
		    wire        p2_ptp_parser_reconfig_bready;  
		    wire [7:0]  p2_ptp_parser_reconfig_araddr;  
		    wire [2:0]  p2_ptp_parser_reconfig_arprot;  
		    wire        p2_ptp_parser_reconfig_arvalid; 
		    wire        p2_ptp_parser_reconfig_arready; 
		    wire [31:0] p2_ptp_parser_reconfig_rdata;   
		    wire [1:0]  p2_ptp_parser_reconfig_rresp;   
		    wire        p2_ptp_parser_reconfig_rvalid;  
		    wire        p2_ptp_parser_reconfig_rready;  
		    wire [7:0]  p3_ptp_parser_reconfig_awaddr;  
		    wire [2:0]  p3_ptp_parser_reconfig_awprot;  
		    wire        p3_ptp_parser_reconfig_awvalid; 
		    wire        p3_ptp_parser_reconfig_awready; 
		    wire [31:0] p3_ptp_parser_reconfig_wdata;   
		    wire [3:0]  p3_ptp_parser_reconfig_wstrb;   
		    wire        p3_ptp_parser_reconfig_wvalid;  
		    wire        p3_ptp_parser_reconfig_wready;  
		    wire [1:0]  p3_ptp_parser_reconfig_bresp;   
		    wire        p3_ptp_parser_reconfig_bvalid;  
		    wire        p3_ptp_parser_reconfig_bready;  
		    wire [7:0]  p3_ptp_parser_reconfig_araddr;  
		    wire [2:0]  p3_ptp_parser_reconfig_arprot;  
		    wire        p3_ptp_parser_reconfig_arvalid; 
		    wire        p3_ptp_parser_reconfig_arready; 
		    wire [31:0] p3_ptp_parser_reconfig_rdata;   
		    wire [1:0]  p3_ptp_parser_reconfig_rresp;   
		    wire        p3_ptp_parser_reconfig_rvalid;  
		    wire        p3_ptp_parser_reconfig_rready;  

    wire        ss_app_lite_arready_brdige;
    wire        ss_app_lite_awready_brdige;
    wire        ss_app_lite_wready_brdige;
    wire [1:0]  ss_app_lite_bresp_bridge;
    wire        ss_app_lite_bvalid_bridge;
    wire [1:0]  ss_app_lite_rresp_bridge;
    wire [PARAM_DATA-1:0] ss_app_lite_rdata_bridge;
    wire        ss_app_lite_rvalid_bridge;
    reg         axi_lite_ready_en;
    reg  [31:0] axi_lite_rd_hung_cntr;
    reg  [31:0] axi_lite_wr_hung_cntr;
    reg         axi_lite_wr_pending, axi_lite_rd_pending;
    reg         axi_lite_rd_hung_det, axi_lite_wr_hung_det;
    reg         axi_lite_hung_rst_n;
    reg         axi_lite_hung_rvalid, axi_lite_hung_bvalid;
    reg         axi_lite_rresp_sent, axi_lite_bresp_sent;
    wire        nios_command_complete;
    reg         nios_command_complete_d1;
    reg         nios_command_complete_d2;

    wire [8:0]  ss_reconfig_address;
    wire        ss_reconfig_read;
    wire        ss_reconfig_write;
    reg         ss_reconfig_waitrequest;
    wire        ss_reconfig_readdatavalid;
    wire [31:0] ss_reconfig_readdata;
    wire [3:0]  ss_reconfig_byteenable;
    wire [31:0] ss_reconfig_writedata;

    reg  [2:0] ss_reconfig_wait_cntr;
    reg        ss_reconfig_readdatavalid_tmp;
    wire [15:0] port_enable;

    // JTAG Master
    wire    [25:0]      jtag_addr;
    wire                jtag_read;
    reg     [31:0]      jtag_readdata_tmp;
    wire    [31:0]      jtag_readdata;
    wire                jtag_write;
    wire    [31:0]      jtag_writedata_tmp;
    reg     [31:0]      jtag_writedata;
    wire                jtag_waitrequest;
    wire                jtag_readdata_valid;
    wire    [31:0]      av_addr;
    wire    [3:0]       jtag_byteenable_tmp; 
    wire    [3:0]       jtag_byteenable; 
    // NIOS CPU Master
    wire    [25:0]      cpu_reconfig_addr;
    wire                cpu_reconfig_read;
    wire    [31:0]      cpu_reconfig_readdata;
    wire                cpu_reconfig_write;
    wire    [31:0]      cpu_reconfig_writedata;
    wire    [3:0]       cpu_reconfig_byteenable;
    wire                cpu_reconfig_waitrequest;
    wire                cpu_reconfig_readdata_valid;

    //wire [25:0] default_reconfig_address;
    //wire        default_reconfig_read;
    //wire        default_reconfig_write;
    //reg         default_reconfig_waitrequest;
    //wire        default_reconfig_readdatavalid;
    //wire [31:0] default_reconfig_readdata;
    //wire [31:0] default_reconfig_writedata;
    //reg  default_reconfig_write_d1, default_reconfig_write_d2, default_reconfig_write_d3;
    //reg  default_reconfig_read_d1, default_reconfig_read_d2, default_reconfig_read_d3;
    //reg  default_reconfig_write_pos_edge, default_reconfig_read_pos_edge;


        wire [19:0]                      p0_port_params;
        //EHIP output status signals connected to CSR, not as SS output
        wire                             p0_rx_block_lock;
        wire                             p0_rx_am_lock;
        wire                             p0_local_fault_status;
        wire                             p0_remote_fault_status;
        wire                             p0_rx_hi_ber;
        wire                             p0_ehip_ready;
        wire                             p0_cdr_lock;
        wire [2:0]                       p0_link_status;
        wire [19:0]                      p1_port_params;
        //EHIP output status signals connected to CSR, not as SS output
        wire                             p1_rx_block_lock;
        wire                             p1_rx_am_lock;
        wire                             p1_local_fault_status;
        wire                             p1_remote_fault_status;
        wire                             p1_rx_hi_ber;
        wire                             p1_ehip_ready;
        wire                             p1_cdr_lock;
        wire [2:0]                       p1_link_status;
        wire [19:0]                      p2_port_params;
        //EHIP output status signals connected to CSR, not as SS output
        wire                             p2_rx_block_lock;
        wire                             p2_rx_am_lock;
        wire                             p2_local_fault_status;
        wire                             p2_remote_fault_status;
        wire                             p2_rx_hi_ber;
        wire                             p2_ehip_ready;
        wire                             p2_cdr_lock;
        wire [2:0]                       p2_link_status;
        wire [19:0]                      p3_port_params;
        //EHIP output status signals connected to CSR, not as SS output
        wire                             p3_rx_block_lock;
        wire                             p3_rx_am_lock;
        wire                             p3_local_fault_status;
        wire                             p3_remote_fault_status;
        wire                             p3_rx_hi_ber;
        wire                             p3_ehip_ready;
        wire                             p3_cdr_lock;
        wire [2:0]                       p3_link_status;
        wire [19:0]                      p4_port_params;
        wire [19:0]                      p5_port_params;
        wire [19:0]                      p6_port_params;
        wire [19:0]                      p7_port_params;
        wire [19:0]                      p8_port_params;
        wire [19:0]                      p9_port_params;
        wire [19:0]                      p10_port_params;
        wire [19:0]                      p11_port_params;
        wire [19:0]                      p12_port_params;
        wire [19:0]                      p13_port_params;
        wire [19:0]                      p14_port_params;
        wire [19:0]                      p15_port_params;

        //Reset signals from SRC to ehip and other modules
        wire                             p0_axi_st_bridge_tx_rst_n;
        wire                             p0_axi_st_bridge_rx_rst_n;
        wire                             p0_rx_rst_n;
        wire                             p0_tx_rst_n;
        wire                             p0_csr_rst_n;
        wire                             p0_ereset_n;
        wire                             p0_pio_axi_st_bridge_rst_n;
        wire                             p0_pio_ehip_tx_rst_n;
        wire                             p0_pio_ehip_rx_rst_n;
        wire                             p0_pio_ereset_n;
        wire                             p1_axi_st_bridge_tx_rst_n;
        wire                             p1_axi_st_bridge_rx_rst_n;
        wire                             p1_rx_rst_n;
        wire                             p1_tx_rst_n;
        wire                             p1_csr_rst_n;
        wire                             p1_ereset_n;
        wire                             p1_pio_axi_st_bridge_rst_n;
        wire                             p1_pio_ehip_tx_rst_n;
        wire                             p1_pio_ehip_rx_rst_n;
        wire                             p1_pio_ereset_n;
        wire                             p2_axi_st_bridge_tx_rst_n;
        wire                             p2_axi_st_bridge_rx_rst_n;
        wire                             p2_rx_rst_n;
        wire                             p2_tx_rst_n;
        wire                             p2_csr_rst_n;
        wire                             p2_ereset_n;
        wire                             p2_pio_axi_st_bridge_rst_n;
        wire                             p2_pio_ehip_tx_rst_n;
        wire                             p2_pio_ehip_rx_rst_n;
        wire                             p2_pio_ereset_n;
        wire                             p3_axi_st_bridge_tx_rst_n;
        wire                             p3_axi_st_bridge_rx_rst_n;
        wire                             p3_rx_rst_n;
        wire                             p3_tx_rst_n;
        wire                             p3_csr_rst_n;
        wire                             p3_ereset_n;
        wire                             p3_pio_axi_st_bridge_rst_n;
        wire                             p3_pio_ehip_tx_rst_n;
        wire                             p3_pio_ehip_rx_rst_n;
        wire                             p3_pio_ereset_n;

        wire                [15:0] i_ncycles_to_ss_rst_ack = 'h6000;        // Minimum value is 1, Maximum 255
        wire                [15:0] i_ncycles_to_rx_rst_ack = 'h2000;        // Minimum value is 1, Maximum 255
        wire                [15:0] i_ncycles_to_tx_rst_ack = 'h2000;        // Minimum value is 1, Maximum 255
        wire                      axi_lite_bridge_src_rst_n;        // AXI Lite bridge Reset, Active Low
        wire                      axi_lite_bridge_rst_n;        // AXI Lite bridge Reset, Active Low
        //wire                      ss_csr_rst_n;                 // Subsystem CSR Reset, Active low
        wire                      nios_rst_n;                   // NIOS Reset, Active Low
        wire                [15:0] load_recipe_error;
        wire                [15:0] xcvr_cal_error;
        wire                [15:0] xcvr_ready;
        wire                [15:0] tx_pma_ready;
        wire                [15:0] rx_pma_ready;
        wire                [15:0] hotplug_disable_fm;
        wire                [15:0] hotplug_lpbk_en_fm;
        wire                [15:0] hotplug_paused_fm;

        wire                [1:0]  ehip0_ptp_aib_tx_pll_locked;
        wire                [1:0]  ehip1_ptp_aib_tx_pll_locked;
        wire                [1:0]  ehip2_ptp_aib_tx_pll_locked;
        wire                [1:0]  ehip3_ptp_aib_tx_pll_locked;

  wire    	    [31:0]       cpu_reconfig_readdata_nios;
	logic                      nios_cpu_rd_wr_hung_det;
	logic                      nios_cpu_rd_wr_hung_det_d1, nios_cpu_rd_wr_hung_det_d2;
	logic                      nios_cpu_hung_readdata_valid;
	logic                      nios_cpu_hung_waitrequest;
	logic                      nios_cpu_rd_wr_pending;
  logic        	    [31:0]   nios_cpu_rd_wr_hung_cntr;
  wire                       nios_command_start;
  reg                        nios_hung_error;

        logic               [3:0]  csr_led_override_port;
        logic                      csr_led_override_en;
        logic               [31:0] pulse_10msec_cntr;
        logic               [7:0]  led_pulse_cntr;
        logic                      led_pulse;
        logic               [12:0] led_pulse_reg;
        logic                      led_pulse_ext;
        logic               [7:0]  csr_led_pulse_cntr;
        logic               [2:0]  csr_led_status;
        logic               [2:0]  csr_led_speed;
        //
        wire [15:0][7:0]                       hotplug_status_all;
        wire [31:0]                            hotplug_control;
        wire [7:0]                             hotplug_status;
        reg                                    po_pma_cal_done;

  wire                          w0_tx_fifo_eccstatus;
  wire                          w0_axi_st_tx_parity_error;
  wire                          w1_tx_fifo_eccstatus;
  wire                          w1_axi_st_tx_parity_error;
  wire                          w2_tx_fifo_eccstatus;
  wire                          w2_axi_st_tx_parity_error;
  wire                          w3_tx_fifo_eccstatus;
  wire                          w3_axi_st_tx_parity_error;
  wire                          w4_tx_fifo_eccstatus;
  wire                          w4_axi_st_tx_parity_error;
  wire                          w5_tx_fifo_eccstatus;
  wire                          w5_axi_st_tx_parity_error;
  wire                          w6_tx_fifo_eccstatus;
  wire                          w6_axi_st_tx_parity_error;
  wire                          w7_tx_fifo_eccstatus;
  wire                          w7_axi_st_tx_parity_error;
  wire                          w8_tx_fifo_eccstatus;
  wire                          w8_axi_st_tx_parity_error;
  wire                          w9_tx_fifo_eccstatus;
  wire                          w9_axi_st_tx_parity_error;
  wire                          w10_tx_fifo_eccstatus;
  wire                          w10_axi_st_tx_parity_error;
  wire                          w11_tx_fifo_eccstatus;
  wire                          w11_axi_st_tx_parity_error;
  wire                          w12_tx_fifo_eccstatus;
  wire                          w12_axi_st_tx_parity_error;
  wire                          w13_tx_fifo_eccstatus;
  wire                          w13_axi_st_tx_parity_error;
  wire                          w14_tx_fifo_eccstatus;
  wire                          w14_axi_st_tx_parity_error;
  wire                          w15_tx_fifo_eccstatus;
  wire                          w15_axi_st_tx_parity_error;
//*********************************************************************************
// Core Logic 
//*********************************************************************************
// -- <IF ANY> -- //

//*********************************************************************************
//************************* EHIP IP TOP level for all ports *********************** 
//*********************************************************************************

hssi_ss_ip_wrapper_q5p32my #(
          .PORT0_XCVR_CHANNEL              (PORT0_XCVR_CHANNEL),
          .PORT0_DATA_WIDTH                (PORT0_DATA_WIDTH),
          .PORT0_AXI_READY_LATENCY         (PORT0_READY_LATENCY),
          .PORT0_PTP_TX_CLASSIFIER_ENABLE  (PORT0_PTP_TX_CLASSIFIER_ENABLE),
          .PORT0_PKT_SEG_PARITY_EN         (PORT0_PKT_SEG_PARITY_EN),
          .PORT0_PROFILE                   (PORT0_PROFILE),
          .PORT1_XCVR_CHANNEL              (PORT1_XCVR_CHANNEL),
          .PORT1_DATA_WIDTH                (PORT1_DATA_WIDTH),
          .PORT1_AXI_READY_LATENCY         (PORT1_READY_LATENCY),
          .PORT1_PTP_TX_CLASSIFIER_ENABLE  (PORT1_PTP_TX_CLASSIFIER_ENABLE),
          .PORT1_PKT_SEG_PARITY_EN         (PORT1_PKT_SEG_PARITY_EN),
          .PORT1_PROFILE                   (PORT1_PROFILE),
          .PORT2_XCVR_CHANNEL              (PORT2_XCVR_CHANNEL),
          .PORT2_DATA_WIDTH                (PORT2_DATA_WIDTH),
          .PORT2_AXI_READY_LATENCY         (PORT2_READY_LATENCY),
          .PORT2_PTP_TX_CLASSIFIER_ENABLE  (PORT2_PTP_TX_CLASSIFIER_ENABLE),
          .PORT2_PKT_SEG_PARITY_EN         (PORT2_PKT_SEG_PARITY_EN),
          .PORT2_PROFILE                   (PORT2_PROFILE),
          .PORT3_XCVR_CHANNEL              (PORT3_XCVR_CHANNEL),
          .PORT3_DATA_WIDTH                (PORT3_DATA_WIDTH),
          .PORT3_AXI_READY_LATENCY         (PORT3_READY_LATENCY),
          .PORT3_PTP_TX_CLASSIFIER_ENABLE  (PORT3_PTP_TX_CLASSIFIER_ENABLE),
          .PORT3_PKT_SEG_PARITY_EN         (PORT3_PKT_SEG_PARITY_EN),
          .PORT3_PROFILE                   (PORT3_PROFILE),
          .ENABLE_ECC                   (ENABLE_ECC),
          .SIM_MODE                     (SIM_MODE_EN), 
          .Tiles                        (tiles)
	  ) U_hssi_ss_ip_wrapper (
    //Reset Interfaces
      .p0_tx_rst_n(p0_tx_rst_n),
      .p0_rx_rst_n(p0_rx_rst_n),
      .p0_axi_st_bridge_tx_rst_n(p0_axi_st_bridge_tx_rst_n),
      .p0_axi_st_bridge_rx_rst_n(p0_axi_st_bridge_rx_rst_n),
      .p0_csr_rst_n(p0_csr_rst_n),
      .p0_reconfig_rst(p0_reconfig_rst),
      .p1_tx_rst_n(p1_tx_rst_n),
      .p1_rx_rst_n(p1_rx_rst_n),
      .p1_axi_st_bridge_tx_rst_n(p1_axi_st_bridge_tx_rst_n),
      .p1_axi_st_bridge_rx_rst_n(p1_axi_st_bridge_rx_rst_n),
      .p1_csr_rst_n(p1_csr_rst_n),
      .p1_reconfig_rst(p1_reconfig_rst),
      .p2_tx_rst_n(p2_tx_rst_n),
      .p2_rx_rst_n(p2_rx_rst_n),
      .p2_axi_st_bridge_tx_rst_n(p2_axi_st_bridge_tx_rst_n),
      .p2_axi_st_bridge_rx_rst_n(p2_axi_st_bridge_rx_rst_n),
      .p2_csr_rst_n(p2_csr_rst_n),
      .p2_reconfig_rst(p2_reconfig_rst),
      .p3_tx_rst_n(p3_tx_rst_n),
      .p3_rx_rst_n(p3_rx_rst_n),
      .p3_axi_st_bridge_tx_rst_n(p3_axi_st_bridge_tx_rst_n),
      .p3_axi_st_bridge_rx_rst_n(p3_axi_st_bridge_rx_rst_n),
      .p3_csr_rst_n(p3_csr_rst_n),
      .p3_reconfig_rst(p3_reconfig_rst),
    //Clock Interfaces
      .i_clk_ref(i_clk_ref),

      .i_p0_clk_tx_tod(i_p0_clk_tx_tod),
      .i_p0_clk_rx_tod(i_p0_clk_rx_tod),
      .i_p0_clk_ptp_sample(i_p0_clk_ptp_sample), //TBD tod clk?

      .o_p0_clk_pll(o_p0_clk_pll),
      .o_p0_clk_tx_div(o_p0_clk_tx_div),
      .o_p0_clk_rec_div64(o_p0_clk_rec_div64),
      .o_p0_clk_rec_div(o_p0_clk_rec_div),

      .i_p0_reconfig_clk(app_ss_lite_clk),

      .i_p0_tx_clkena_half_rate(p0_tx_clkena_half_rate), 
      .i_p0_rx_clkena_half_rate(p0_rx_clkena_half_rate),

      .i_p1_clk_tx_tod(i_p1_clk_tx_tod),
      .i_p1_clk_rx_tod(i_p1_clk_rx_tod),
      .i_p1_clk_ptp_sample(i_p1_clk_ptp_sample), //TBD tod clk?

      .o_p1_clk_pll(o_p1_clk_pll),
      .o_p1_clk_tx_div(o_p1_clk_tx_div),
      .o_p1_clk_rec_div64(o_p1_clk_rec_div64),
      .o_p1_clk_rec_div(o_p1_clk_rec_div),

      .i_p1_reconfig_clk(app_ss_lite_clk),

      .i_p1_tx_clkena_half_rate(p1_tx_clkena_half_rate), 
      .i_p1_rx_clkena_half_rate(p1_rx_clkena_half_rate),

      .i_p2_clk_tx_tod(i_p2_clk_tx_tod),
      .i_p2_clk_rx_tod(i_p2_clk_rx_tod),
      .i_p2_clk_ptp_sample(i_p2_clk_ptp_sample), //TBD tod clk?

      .o_p2_clk_pll(o_p2_clk_pll),
      .o_p2_clk_tx_div(o_p2_clk_tx_div),
      .o_p2_clk_rec_div64(o_p2_clk_rec_div64),
      .o_p2_clk_rec_div(o_p2_clk_rec_div),

      .i_p2_reconfig_clk(app_ss_lite_clk),

      .i_p2_tx_clkena_half_rate(p2_tx_clkena_half_rate), 
      .i_p2_rx_clkena_half_rate(p2_rx_clkena_half_rate),

      .i_p3_clk_tx_tod(i_p3_clk_tx_tod),
      .i_p3_clk_rx_tod(i_p3_clk_rx_tod),
      .i_p3_clk_ptp_sample(i_p3_clk_ptp_sample), //TBD tod clk?

      .o_p3_clk_pll(o_p3_clk_pll),
      .o_p3_clk_tx_div(o_p3_clk_tx_div),
      .o_p3_clk_rec_div64(o_p3_clk_rec_div64),
      .o_p3_clk_rec_div(o_p3_clk_rec_div),

      .i_p3_reconfig_clk(app_ss_lite_clk),

      .i_p3_tx_clkena_half_rate(p3_tx_clkena_half_rate), 
      .i_p3_rx_clkena_half_rate(p3_rx_clkena_half_rate),

      .o_ehip_core0_ptp_clk_pll(o_ehip0_ptp_clk_pll),
      .o_ehip_core0_ptp_clk_tx_div(o_ehip0_ptp_clk_tx_div),
      .o_ehip_core0_ptp_clk_rec_div64(o_ehip0_ptp_clk_rec_div64),
      .o_ehip_core0_ptp_clk_rec_div(o_ehip0_ptp_clk_rec_div),
      .o_ehip_core0_aib_clk(o_ehip0_aib_clk),
      .o_ehip_core0_aib_2x_clk(o_ehip0_aib_2x_clk),
      .o_ehip_core0_aib_pll_locked(o_ehip0_tx_pll_locked),
      .o_ehip_core0_aib_tx_serial_data(o_ehip0_aib_tx_serial_data),
      .o_ehip_core0_ptp_aib_tx_pll_locked(ehip0_ptp_aib_tx_pll_locked),
      .o_ehip_core1_ptp_clk_pll(o_ehip1_ptp_clk_pll),
      .o_ehip_core1_ptp_clk_tx_div(o_ehip1_ptp_clk_tx_div),
      .o_ehip_core1_ptp_clk_rec_div64(o_ehip1_ptp_clk_rec_div64),
      .o_ehip_core1_ptp_clk_rec_div(o_ehip1_ptp_clk_rec_div),
      .o_ehip_core1_aib_clk(o_ehip1_aib_clk),
      .o_ehip_core1_aib_2x_clk(o_ehip1_aib_2x_clk),
      .o_ehip_core1_aib_pll_locked(o_ehip1_tx_pll_locked),
      .o_ehip_core1_aib_tx_serial_data(o_ehip1_aib_tx_serial_data),
      .o_ehip_core1_ptp_aib_tx_pll_locked(ehip1_ptp_aib_tx_pll_locked),
      .o_ehip_core2_ptp_clk_pll(o_ehip2_ptp_clk_pll),
      .o_ehip_core2_ptp_clk_tx_div(o_ehip2_ptp_clk_tx_div),
      .o_ehip_core2_ptp_clk_rec_div64(o_ehip2_ptp_clk_rec_div64),
      .o_ehip_core2_ptp_clk_rec_div(o_ehip2_ptp_clk_rec_div),
      .o_ehip_core2_aib_clk(o_ehip2_aib_clk),
      .o_ehip_core2_aib_2x_clk(o_ehip2_aib_2x_clk),
      .o_ehip_core2_aib_pll_locked(o_ehip2_tx_pll_locked),
      .o_ehip_core2_aib_tx_serial_data(o_ehip2_aib_tx_serial_data),
      .o_ehip_core2_ptp_aib_tx_pll_locked(ehip2_ptp_aib_tx_pll_locked),
      .o_ehip_core3_ptp_clk_pll(o_ehip3_ptp_clk_pll),
      .o_ehip_core3_ptp_clk_tx_div(o_ehip3_ptp_clk_tx_div),
      .o_ehip_core3_ptp_clk_rec_div64(o_ehip3_ptp_clk_rec_div64),
      .o_ehip_core3_ptp_clk_rec_div(o_ehip3_ptp_clk_rec_div),
      .o_ehip_core3_aib_clk(o_ehip3_aib_clk),
      .o_ehip_core3_aib_2x_clk(o_ehip3_aib_2x_clk),
      .o_ehip_core3_aib_pll_locked(o_ehip3_tx_pll_locked),
      .o_ehip_core3_aib_tx_serial_data(o_ehip3_aib_tx_serial_data),
      .o_ehip_core3_ptp_aib_tx_pll_locked(ehip3_ptp_aib_tx_pll_locked),
  // ----------------------------------
  // AXI ST TX/RX Client Interface Signals, valid for eth with MAC enable, otherwise empty list 
  // ----------------------------------
    .app_ss_p0_st_client_clk         (p0_app_ss_st_tx_clk),
    .app_ss_p0_st_clk                (p0_app_ss_st_rx_clk),
    .app_ss_p0_tx_tuser_ptp          (p0_app_ss_st_tx_tuser_ptp),
    .app_ss_p0_tx_tuser_ptp_extended (p0_app_ss_st_tx_tuser_ptp_extended),
    .ss_app_p0_rx_tuser_sts_extended (p0_ss_app_st_rx_tuser_sts_extended),
    .app_ss_p0_tx_tdata              (p0_app_ss_st_tx_tdata), 
    .ss_app_p0_rx_tdata              (p0_ss_app_st_rx_tdata),
    .app_ss_p0_tx_tkeep              (p0_app_ss_st_tx_tkeep),
    .ss_app_p0_rx_tkeep              (p0_ss_app_st_rx_tkeep),
    .app_ss_p0_tx_tvalid             (p0_app_ss_st_tx_tvalid),
    .ss_app_p0_tx_tready             (p0_ss_app_st_tx_tready),
    .app_ss_p0_tx_tlast              (p0_app_ss_st_tx_tlast),
    .app_ss_p0_tx_tuser_client       (p0_app_ss_st_tx_tuser_client),
    .app_ss_p0_tx_tuser_pkt_seg_parity (p0_app_ss_st_tx_tuser_pkt_seg_parity),
    // ----------------------------------
    .ss_app_p0_rx_tvalid             (p0_ss_app_st_rx_tvalid),
    .ss_app_p0_rx_tlast              (p0_ss_app_st_rx_tlast),
    .ss_app_p0_rx_tuser_client       (p0_ss_app_st_rx_tuser_client),
    .ss_app_p0_rx_tuser_sts          (p0_ss_app_st_rx_tuser_sts),
    .ss_app_p0_rx_tuser_pkt_seg_parity	(p0_ss_app_st_rx_tuser_pkt_seg_parity),
    .app_ss_p1_st_client_clk         (p1_app_ss_st_tx_clk),
    .app_ss_p1_st_clk                (p1_app_ss_st_rx_clk),
    .app_ss_p1_tx_tuser_ptp          (p1_app_ss_st_tx_tuser_ptp),
    .app_ss_p1_tx_tuser_ptp_extended (p1_app_ss_st_tx_tuser_ptp_extended),
    .ss_app_p1_rx_tuser_sts_extended (p1_ss_app_st_rx_tuser_sts_extended),
    .app_ss_p1_tx_tdata              (p1_app_ss_st_tx_tdata), 
    .ss_app_p1_rx_tdata              (p1_ss_app_st_rx_tdata),
    .app_ss_p1_tx_tkeep              (p1_app_ss_st_tx_tkeep),
    .ss_app_p1_rx_tkeep              (p1_ss_app_st_rx_tkeep),
    .app_ss_p1_tx_tvalid             (p1_app_ss_st_tx_tvalid),
    .ss_app_p1_tx_tready             (p1_ss_app_st_tx_tready),
    .app_ss_p1_tx_tlast              (p1_app_ss_st_tx_tlast),
    .app_ss_p1_tx_tuser_client       (p1_app_ss_st_tx_tuser_client),
    .app_ss_p1_tx_tuser_pkt_seg_parity (p1_app_ss_st_tx_tuser_pkt_seg_parity),
    // ----------------------------------
    .ss_app_p1_rx_tvalid             (p1_ss_app_st_rx_tvalid),
    .ss_app_p1_rx_tlast              (p1_ss_app_st_rx_tlast),
    .ss_app_p1_rx_tuser_client       (p1_ss_app_st_rx_tuser_client),
    .ss_app_p1_rx_tuser_sts          (p1_ss_app_st_rx_tuser_sts),
    .ss_app_p1_rx_tuser_pkt_seg_parity	(p1_ss_app_st_rx_tuser_pkt_seg_parity),
    .app_ss_p2_st_client_clk         (p2_app_ss_st_tx_clk),
    .app_ss_p2_st_clk                (p2_app_ss_st_rx_clk),
    .app_ss_p2_tx_tuser_ptp          (p2_app_ss_st_tx_tuser_ptp),
    .app_ss_p2_tx_tuser_ptp_extended (p2_app_ss_st_tx_tuser_ptp_extended),
    .ss_app_p2_rx_tuser_sts_extended (p2_ss_app_st_rx_tuser_sts_extended),
    .app_ss_p2_tx_tdata              (p2_app_ss_st_tx_tdata), 
    .ss_app_p2_rx_tdata              (p2_ss_app_st_rx_tdata),
    .app_ss_p2_tx_tkeep              (p2_app_ss_st_tx_tkeep),
    .ss_app_p2_rx_tkeep              (p2_ss_app_st_rx_tkeep),
    .app_ss_p2_tx_tvalid             (p2_app_ss_st_tx_tvalid),
    .ss_app_p2_tx_tready             (p2_ss_app_st_tx_tready),
    .app_ss_p2_tx_tlast              (p2_app_ss_st_tx_tlast),
    .app_ss_p2_tx_tuser_client       (p2_app_ss_st_tx_tuser_client),
    .app_ss_p2_tx_tuser_pkt_seg_parity (p2_app_ss_st_tx_tuser_pkt_seg_parity),
    // ----------------------------------
    .ss_app_p2_rx_tvalid             (p2_ss_app_st_rx_tvalid),
    .ss_app_p2_rx_tlast              (p2_ss_app_st_rx_tlast),
    .ss_app_p2_rx_tuser_client       (p2_ss_app_st_rx_tuser_client),
    .ss_app_p2_rx_tuser_sts          (p2_ss_app_st_rx_tuser_sts),
    .ss_app_p2_rx_tuser_pkt_seg_parity	(p2_ss_app_st_rx_tuser_pkt_seg_parity),
    .app_ss_p3_st_client_clk         (p3_app_ss_st_tx_clk),
    .app_ss_p3_st_clk                (p3_app_ss_st_rx_clk),
    .app_ss_p3_tx_tuser_ptp          (p3_app_ss_st_tx_tuser_ptp),
    .app_ss_p3_tx_tuser_ptp_extended (p3_app_ss_st_tx_tuser_ptp_extended),
    .ss_app_p3_rx_tuser_sts_extended (p3_ss_app_st_rx_tuser_sts_extended),
    .app_ss_p3_tx_tdata              (p3_app_ss_st_tx_tdata), 
    .ss_app_p3_rx_tdata              (p3_ss_app_st_rx_tdata),
    .app_ss_p3_tx_tkeep              (p3_app_ss_st_tx_tkeep),
    .ss_app_p3_rx_tkeep              (p3_ss_app_st_rx_tkeep),
    .app_ss_p3_tx_tvalid             (p3_app_ss_st_tx_tvalid),
    .ss_app_p3_tx_tready             (p3_ss_app_st_tx_tready),
    .app_ss_p3_tx_tlast              (p3_app_ss_st_tx_tlast),
    .app_ss_p3_tx_tuser_client       (p3_app_ss_st_tx_tuser_client),
    .app_ss_p3_tx_tuser_pkt_seg_parity (p3_app_ss_st_tx_tuser_pkt_seg_parity),
    // ----------------------------------
    .ss_app_p3_rx_tvalid             (p3_ss_app_st_rx_tvalid),
    .ss_app_p3_rx_tlast              (p3_ss_app_st_rx_tlast),
    .ss_app_p3_rx_tuser_client       (p3_ss_app_st_rx_tuser_client),
    .ss_app_p3_rx_tuser_sts          (p3_ss_app_st_rx_tuser_sts),
    .ss_app_p3_rx_tuser_pkt_seg_parity	(p3_ss_app_st_rx_tuser_pkt_seg_parity),
  // ------------------------
  // AXI ST PHY Direct Functional Signals
  // ---------------------------------------
  .app_ss_p0_st_txphydirect_clk      (p0_app_ss_st_txphydirect_clk),
  .app_ss_p0_st_txphydirect_areset_n (p0_axi_st_bridge_tx_rst_n),
  .app_ss_p0_st_txphydirect_data     (p0_app_ss_st_txphydirect_tdata),
  .app_ss_p0_st_txphydirect_valid    (p0_app_ss_st_txphydirect_tvalid),
  .ss_app_p0_st_txphydirect_tready   (p0_ss_app_st_txphydirect_tready),
  // ---------------------------------------                                 
  .app_ss_p0_st_rxphydirect_clk      (p0_app_ss_st_rxphydirect_clk),
  .app_ss_p0_st_rxphydirect_areset_n (p0_axi_st_bridge_rx_rst_n),
  .ss_app_p0_st_rxphydirect_data     (p0_ss_app_st_rxphydirect_tdata),
  .ss_app_p0_st_rxphydirect_valid    (p0_ss_app_st_rxphydirect_tvalid),
  .app_ss_p1_st_txphydirect_clk      (p1_app_ss_st_txphydirect_clk),
  .app_ss_p1_st_txphydirect_areset_n (p1_axi_st_bridge_tx_rst_n),
  .app_ss_p1_st_txphydirect_data     (p1_app_ss_st_txphydirect_tdata),
  .app_ss_p1_st_txphydirect_valid    (p1_app_ss_st_txphydirect_tvalid),
  .ss_app_p1_st_txphydirect_tready   (p1_ss_app_st_txphydirect_tready),
  // ---------------------------------------                                 
  .app_ss_p1_st_rxphydirect_clk      (p1_app_ss_st_rxphydirect_clk),
  .app_ss_p1_st_rxphydirect_areset_n (p1_axi_st_bridge_rx_rst_n),
  .ss_app_p1_st_rxphydirect_data     (p1_ss_app_st_rxphydirect_tdata),
  .ss_app_p1_st_rxphydirect_valid    (p1_ss_app_st_rxphydirect_tvalid),
  .app_ss_p2_st_txphydirect_clk      (p2_app_ss_st_txphydirect_clk),
  .app_ss_p2_st_txphydirect_areset_n (p2_axi_st_bridge_tx_rst_n),
  .app_ss_p2_st_txphydirect_data     (p2_app_ss_st_txphydirect_tdata),
  .app_ss_p2_st_txphydirect_valid    (p2_app_ss_st_txphydirect_tvalid),
  .ss_app_p2_st_txphydirect_tready   (p2_ss_app_st_txphydirect_tready),
  // ---------------------------------------                                 
  .app_ss_p2_st_rxphydirect_clk      (p2_app_ss_st_rxphydirect_clk),
  .app_ss_p2_st_rxphydirect_areset_n (p2_axi_st_bridge_rx_rst_n),
  .ss_app_p2_st_rxphydirect_data     (p2_ss_app_st_rxphydirect_tdata),
  .ss_app_p2_st_rxphydirect_valid    (p2_ss_app_st_rxphydirect_tvalid),
  .app_ss_p3_st_txphydirect_clk      (p3_app_ss_st_txphydirect_clk),
  .app_ss_p3_st_txphydirect_areset_n (p3_axi_st_bridge_tx_rst_n),
  .app_ss_p3_st_txphydirect_data     (p3_app_ss_st_txphydirect_tdata),
  .app_ss_p3_st_txphydirect_valid    (p3_app_ss_st_txphydirect_tvalid),
  .ss_app_p3_st_txphydirect_tready   (p3_ss_app_st_txphydirect_tready),
  // ---------------------------------------                                 
  .app_ss_p3_st_rxphydirect_clk      (p3_app_ss_st_rxphydirect_clk),
  .app_ss_p3_st_rxphydirect_areset_n (p3_axi_st_bridge_rx_rst_n),
  .ss_app_p3_st_rxphydirect_data     (p3_ss_app_st_rxphydirect_tdata),
  .ss_app_p3_st_rxphydirect_valid    (p3_ss_app_st_rxphydirect_tvalid),
  // -------------------------------
  // AXI ST Tx/Rx ToD Interface Signals
  // -------------------------------
  .app_ss_p0_st_txtod_tvalid (p0_app_ss_st_txtod_tvalid),
  .app_ss_p0_st_txtod_tdata  (p0_app_ss_st_txtod_tdata),
  .app_ss_p0_st_rxtod_tvalid (p0_app_ss_st_rxtod_tvalid),
  .app_ss_p0_st_rxtod_tdata  (p0_app_ss_st_rxtod_tdata),
  .app_ss_p1_st_txtod_tvalid (p1_app_ss_st_txtod_tvalid),
  .app_ss_p1_st_txtod_tdata  (p1_app_ss_st_txtod_tdata),
  .app_ss_p1_st_rxtod_tvalid (p1_app_ss_st_rxtod_tvalid),
  .app_ss_p1_st_rxtod_tdata  (p1_app_ss_st_rxtod_tdata),
  .app_ss_p2_st_txtod_tvalid (p2_app_ss_st_txtod_tvalid),
  .app_ss_p2_st_txtod_tdata  (p2_app_ss_st_txtod_tdata),
  .app_ss_p2_st_rxtod_tvalid (p2_app_ss_st_rxtod_tvalid),
  .app_ss_p2_st_rxtod_tdata  (p2_app_ss_st_rxtod_tdata),
  .app_ss_p3_st_txtod_tvalid (p3_app_ss_st_txtod_tvalid),
  .app_ss_p3_st_txtod_tdata  (p3_app_ss_st_txtod_tdata),
  .app_ss_p3_st_rxtod_tvalid (p3_app_ss_st_rxtod_tvalid),
  .app_ss_p3_st_rxtod_tdata  (p3_app_ss_st_rxtod_tdata),
  // ----------------------------------------------
  // AXI ST Tx/Rx Egress Timestamp Interface Signals
  // ----------------------------------------------
  .ss_app_p0_st_txegrts0_tvalid (p0_ss_app_st_txegrts0_tvalid),
  .ss_app_p0_st_txegrts0_tdata  (p0_ss_app_st_txegrts0_tdata),
  .ss_app_p0_st_txegrts1_tvalid (p0_ss_app_st_txegrts1_tvalid),
  .ss_app_p0_st_txegrts1_tdata  (p0_ss_app_st_txegrts1_tdata),
  .ss_app_p1_st_txegrts0_tvalid (p1_ss_app_st_txegrts0_tvalid),
  .ss_app_p1_st_txegrts0_tdata  (p1_ss_app_st_txegrts0_tdata),
  .ss_app_p1_st_txegrts1_tvalid (p1_ss_app_st_txegrts1_tvalid),
  .ss_app_p1_st_txegrts1_tdata  (p1_ss_app_st_txegrts1_tdata),
  .ss_app_p2_st_txegrts0_tvalid (p2_ss_app_st_txegrts0_tvalid),
  .ss_app_p2_st_txegrts0_tdata  (p2_ss_app_st_txegrts0_tdata),
  .ss_app_p2_st_txegrts1_tvalid (p2_ss_app_st_txegrts1_tvalid),
  .ss_app_p2_st_txegrts1_tdata  (p2_ss_app_st_txegrts1_tdata),
  .ss_app_p3_st_txegrts0_tvalid (p3_ss_app_st_txegrts0_tvalid),
  .ss_app_p3_st_txegrts0_tdata  (p3_ss_app_st_txegrts0_tdata),
  .ss_app_p3_st_txegrts1_tvalid (p3_ss_app_st_txegrts1_tvalid),
  .ss_app_p3_st_txegrts1_tdata  (p3_ss_app_st_txegrts1_tdata),
  // ----------------------------------------------
  // AXI ST Rx ingress Timestamp Interface Signals, Valid only in F-tile
  // ----------------------------------------------
  .ss_app_p0_st_rxingrts0_tvalid (p0_ss_app_st_rxingrts0_tvalid),
  .ss_app_p0_st_rxingrts0_tdata  (p0_ss_app_st_rxingrts0_tdata),
  .ss_app_p0_st_rxingrts1_tvalid (p0_ss_app_st_rxingrts1_tvalid),
  .ss_app_p0_st_rxingrts1_tdata  (p0_ss_app_st_rxingrts1_tdata),
  .ss_app_p1_st_rxingrts0_tvalid (p1_ss_app_st_rxingrts0_tvalid),
  .ss_app_p1_st_rxingrts0_tdata  (p1_ss_app_st_rxingrts0_tdata),
  .ss_app_p1_st_rxingrts1_tvalid (p1_ss_app_st_rxingrts1_tvalid),
  .ss_app_p1_st_rxingrts1_tdata  (p1_ss_app_st_rxingrts1_tdata),
  .ss_app_p2_st_rxingrts0_tvalid (p2_ss_app_st_rxingrts0_tvalid),
  .ss_app_p2_st_rxingrts0_tdata  (p2_ss_app_st_rxingrts0_tdata),
  .ss_app_p2_st_rxingrts1_tvalid (p2_ss_app_st_rxingrts1_tvalid),
  .ss_app_p2_st_rxingrts1_tdata  (p2_ss_app_st_rxingrts1_tdata),
  .ss_app_p3_st_rxingrts0_tvalid (p3_ss_app_st_rxingrts0_tvalid),
  .ss_app_p3_st_rxingrts0_tdata  (p3_ss_app_st_rxingrts0_tdata),
  .ss_app_p3_st_rxingrts1_tvalid (p3_ss_app_st_rxingrts1_tvalid),
  .ss_app_p3_st_rxingrts1_tdata  (p3_ss_app_st_rxingrts1_tdata),
  // -----------------
  // Flow control signals, valid for MAC case only
  // -----------------
  .i_p0_tx_pause (i_p0_tx_pause),
  .i_p0_tx_pfc   (i_p0_tx_pfc),
  .o_p0_rx_pause (o_p0_rx_pause),
  .o_p0_rx_pfc   (o_p0_rx_pfc),
  .i_p1_tx_pause (i_p1_tx_pause),
  .i_p1_tx_pfc   (i_p1_tx_pfc),
  .o_p1_rx_pause (o_p1_rx_pause),
  .o_p1_rx_pfc   (o_p1_rx_pfc),
  .i_p2_tx_pause (i_p2_tx_pause),
  .i_p2_tx_pfc   (i_p2_tx_pfc),
  .o_p2_rx_pause (o_p2_rx_pause),
  .o_p2_rx_pfc   (o_p2_rx_pfc),
  .i_p3_tx_pause (i_p3_tx_pause),
  .i_p3_tx_pfc   (i_p3_tx_pfc),
  .o_p3_rx_pause (o_p3_rx_pause),
  .o_p3_rx_pfc   (o_p3_rx_pfc),
  // -------------------
  // PHY Serial I/O Pins
  // -------------------
  .p0_tx_serial      (p0_tx_serial),
  .p0_tx_serial_n    (p0_tx_serial_n),
  .p0_rx_serial      (p0_rx_serial),
  .p0_rx_serial_n    (p0_rx_serial_n),
  .p1_tx_serial      (p1_tx_serial),
  .p1_tx_serial_n    (p1_tx_serial_n),
  .p1_rx_serial      (p1_rx_serial),
  .p1_rx_serial_n    (p1_rx_serial_n),
  .p2_tx_serial      (p2_tx_serial),
  .p2_tx_serial_n    (p2_tx_serial_n),
  .p2_rx_serial      (p2_rx_serial),
  .p2_rx_serial_n    (p2_rx_serial_n),
  .p3_tx_serial      (p3_tx_serial),
  .p3_tx_serial_n    (p3_tx_serial_n),
  .p3_rx_serial      (p3_rx_serial),
  .p3_rx_serial_n    (p3_rx_serial_n),
  // -----------------
  // Ten Bit Interface
  // -----------------
  .p0_tbi_tx_d   (p0_tbi_tx_d),
  .p0_tbi_tx_clk (p0_tbi_tx_clk),
  .p0_tbi_rx_clk (p0_tbi_rx_clk),
  .p0_tbi_rx_d   (p0_tbi_rx_d),
  .p1_tbi_tx_d   (p1_tbi_tx_d),
  .p1_tbi_tx_clk (p1_tbi_tx_clk),
  .p1_tbi_rx_clk (p1_tbi_rx_clk),
  .p1_tbi_rx_d   (p1_tbi_rx_d),
  .p2_tbi_tx_d   (p2_tbi_tx_d),
  .p2_tbi_tx_clk (p2_tbi_tx_clk),
  .p2_tbi_rx_clk (p2_tbi_rx_clk),
  .p2_tbi_rx_d   (p2_tbi_rx_d),
  .p3_tbi_tx_d   (p3_tbi_tx_d),
  .p3_tbi_tx_clk (p3_tbi_tx_clk),
  .p3_tbi_rx_clk (p3_tbi_rx_clk),
  .p3_tbi_rx_d   (p3_tbi_rx_d),
  // --------------
  // MDIO Interface
  // --------------
  .p0_mdio_in  (p0_mdio_in),
  .p0_mdio_out (p0_mdio_out),
  .p0_mdio_oen (p0_mdio_oen),
  .p0_mdc      (p0_mdc),
  .p1_mdio_in  (p1_mdio_in),
  .p1_mdio_out (p1_mdio_out),
  .p1_mdio_oen (p1_mdio_oen),
  .p1_mdc      (p1_mdc),
  .p2_mdio_in  (p2_mdio_in),
  .p2_mdio_out (p2_mdio_out),
  .p2_mdio_oen (p2_mdio_oen),
  .p2_mdc      (p2_mdc),
  .p3_mdio_in  (p3_mdio_in),
  .p3_mdio_out (p3_mdio_out),
  .p3_mdio_oen (p3_mdio_oen),
  .p3_mdc      (p3_mdc),
  // -----------------------
  // Status Signal Interface
  // -----------------------
  .p0_led_link       (p0_led_link),
  .p0_led_panel_link (p0_led_panel_link),
  .p0_led_crs        (p0_led_crs),
  .p0_led_col        (p0_led_col),
  .p0_led_an         (p0_led_an),
  .p0_led_char_err   (p0_led_char_err),
  .p0_led_disp_err   (p0_led_disp_err),
  .p1_led_link       (p1_led_link),
  .p1_led_panel_link (p1_led_panel_link),
  .p1_led_crs        (p1_led_crs),
  .p1_led_col        (p1_led_col),
  .p1_led_an         (p1_led_an),
  .p1_led_char_err   (p1_led_char_err),
  .p1_led_disp_err   (p1_led_disp_err),
  .p2_led_link       (p2_led_link),
  .p2_led_panel_link (p2_led_panel_link),
  .p2_led_crs        (p2_led_crs),
  .p2_led_col        (p2_led_col),
  .p2_led_an         (p2_led_an),
  .p2_led_char_err   (p2_led_char_err),
  .p2_led_disp_err   (p2_led_disp_err),
  .p3_led_link       (p3_led_link),
  .p3_led_panel_link (p3_led_panel_link),
  .p3_led_crs        (p3_led_crs),
  .p3_led_col        (p3_led_col),
  .p3_led_an         (p3_led_an),
  .p3_led_char_err   (p3_led_char_err),
  .p3_led_disp_err   (p3_led_disp_err),
  // -----------------------------------------
  // Miscellaneous Functional Signal Interface
  // -----------------------------------------
  .p0_tx_lanes_stable        (p0_tx_lanes_stable),
  .p0_rx_pcs_ready           (p0_rx_pcs_ready),
  .p0_tx_fifo_eccstatus      (w0_tx_fifo_eccstatus),
  .p0_axi_st_tx_parity_error (w0_axi_st_tx_parity_error),
  .o_p0_rx_pcs_fully_aligned (o_p0_rx_pcs_fully_aligned),
  .o_p0_tx_pll_locked        (o_p0_tx_pll_locked),
  .o_p0_tx_ptp_ready         (o_p0_tx_ptp_ready),
  .o_p0_rx_ptp_ready         (o_p0_rx_ptp_ready),
  .p1_tx_lanes_stable        (p1_tx_lanes_stable),
  .p1_rx_pcs_ready           (p1_rx_pcs_ready),
  .p1_tx_fifo_eccstatus      (w1_tx_fifo_eccstatus),
  .p1_axi_st_tx_parity_error (w1_axi_st_tx_parity_error),
  .o_p1_rx_pcs_fully_aligned (o_p1_rx_pcs_fully_aligned),
  .o_p1_tx_pll_locked        (o_p1_tx_pll_locked),
  .o_p1_tx_ptp_ready         (o_p1_tx_ptp_ready),
  .o_p1_rx_ptp_ready         (o_p1_rx_ptp_ready),
  .p2_tx_lanes_stable        (p2_tx_lanes_stable),
  .p2_rx_pcs_ready           (p2_rx_pcs_ready),
  .p2_tx_fifo_eccstatus      (w2_tx_fifo_eccstatus),
  .p2_axi_st_tx_parity_error (w2_axi_st_tx_parity_error),
  .o_p2_rx_pcs_fully_aligned (o_p2_rx_pcs_fully_aligned),
  .o_p2_tx_pll_locked        (o_p2_tx_pll_locked),
  .o_p2_tx_ptp_ready         (o_p2_tx_ptp_ready),
  .o_p2_rx_ptp_ready         (o_p2_rx_ptp_ready),
  .p3_tx_lanes_stable        (p3_tx_lanes_stable),
  .p3_rx_pcs_ready           (p3_rx_pcs_ready),
  .p3_tx_fifo_eccstatus      (w3_tx_fifo_eccstatus),
  .p3_axi_st_tx_parity_error (w3_axi_st_tx_parity_error),
  .o_p3_rx_pcs_fully_aligned (o_p3_rx_pcs_fully_aligned),
  .o_p3_tx_pll_locked        (o_p3_tx_pll_locked),
  .o_p3_tx_ptp_ready         (o_p3_tx_ptp_ready),
  .o_p3_rx_ptp_ready         (o_p3_rx_ptp_ready),
  // ---------------------------------
  // General PHY Direct Status Signals
  // ---------------------------------
  .p0_tx_pma_ready_a          (p0_tx_pma_ready_a),
  .p0_tx_maib_fifo_full       (p0_tx_maib_fifo_full),
  .p0_tx_maib_fifo_empty_a    (p0_tx_maib_fifo_empty_a),
  .p0_tx_maib_fifo_pfull      (p0_tx_maib_fifo_pfull),
  .p0_tx_maib_fifo_pempty_a   (p0_tx_maib_fifo_pempty_a),
  .p0_rx_maib_fifo_full_a     (p0_rx_maib_fifo_full_a), 
  .p0_rx_maib_fifo_empty      (p0_rx_maib_fifo_empty),
  .p0_rx_maib_fifo_pfull_a    (p0_rx_maib_fifo_pfull_a),
  .p0_rx_maib_fifo_pempty     (p0_rx_maib_fifo_pempty),
  .p0_rx_maib_fifo_rd_en      (p0_rx_maib_fifo_rd_en),
  .p0_rx_pma_ready_a          (p0_rx_pma_ready_a),
  .i_p0_custom_cadence        (i_p0_custom_cadence), 
  .p1_tx_pma_ready_a          (p1_tx_pma_ready_a),
  .p1_tx_maib_fifo_full       (p1_tx_maib_fifo_full),
  .p1_tx_maib_fifo_empty_a    (p1_tx_maib_fifo_empty_a),
  .p1_tx_maib_fifo_pfull      (p1_tx_maib_fifo_pfull),
  .p1_tx_maib_fifo_pempty_a   (p1_tx_maib_fifo_pempty_a),
  .p1_rx_maib_fifo_full_a     (p1_rx_maib_fifo_full_a), 
  .p1_rx_maib_fifo_empty      (p1_rx_maib_fifo_empty),
  .p1_rx_maib_fifo_pfull_a    (p1_rx_maib_fifo_pfull_a),
  .p1_rx_maib_fifo_pempty     (p1_rx_maib_fifo_pempty),
  .p1_rx_maib_fifo_rd_en      (p1_rx_maib_fifo_rd_en),
  .p1_rx_pma_ready_a          (p1_rx_pma_ready_a),
  .i_p1_custom_cadence        (i_p1_custom_cadence), 
  .p2_tx_pma_ready_a          (p2_tx_pma_ready_a),
  .p2_tx_maib_fifo_full       (p2_tx_maib_fifo_full),
  .p2_tx_maib_fifo_empty_a    (p2_tx_maib_fifo_empty_a),
  .p2_tx_maib_fifo_pfull      (p2_tx_maib_fifo_pfull),
  .p2_tx_maib_fifo_pempty_a   (p2_tx_maib_fifo_pempty_a),
  .p2_rx_maib_fifo_full_a     (p2_rx_maib_fifo_full_a), 
  .p2_rx_maib_fifo_empty      (p2_rx_maib_fifo_empty),
  .p2_rx_maib_fifo_pfull_a    (p2_rx_maib_fifo_pfull_a),
  .p2_rx_maib_fifo_pempty     (p2_rx_maib_fifo_pempty),
  .p2_rx_maib_fifo_rd_en      (p2_rx_maib_fifo_rd_en),
  .p2_rx_pma_ready_a          (p2_rx_pma_ready_a),
  .i_p2_custom_cadence        (i_p2_custom_cadence), 
  .p3_tx_pma_ready_a          (p3_tx_pma_ready_a),
  .p3_tx_maib_fifo_full       (p3_tx_maib_fifo_full),
  .p3_tx_maib_fifo_empty_a    (p3_tx_maib_fifo_empty_a),
  .p3_tx_maib_fifo_pfull      (p3_tx_maib_fifo_pfull),
  .p3_tx_maib_fifo_pempty_a   (p3_tx_maib_fifo_pempty_a),
  .p3_rx_maib_fifo_full_a     (p3_rx_maib_fifo_full_a), 
  .p3_rx_maib_fifo_empty      (p3_rx_maib_fifo_empty),
  .p3_rx_maib_fifo_pfull_a    (p3_rx_maib_fifo_pfull_a),
  .p3_rx_maib_fifo_pempty     (p3_rx_maib_fifo_pempty),
  .p3_rx_maib_fifo_rd_en      (p3_rx_maib_fifo_rd_en),
  .p3_rx_pma_ready_a          (p3_rx_pma_ready_a),
  .i_p3_custom_cadence        (i_p3_custom_cadence), 
  // -------------------------------
  // Deterministic Latency Interface
  // -------------------------------
  .o_p0_sl_tx_dl_async_pulse (o_p0_sl_tx_dl_async_pulse),
  .o_p0_sl_rx_dl_async_pulse (o_p0_sl_rx_dl_async_pulse),
  .i_p0_sl_latency_sclk      (i_p0_sl_latency_sclk),
  .i_p0_sl_tx_dl_measure_sel (i_p0_sl_tx_dl_measure_sel),
  .i_p0_sl_rx_dl_measure_sel (i_p0_sl_rx_dl_measure_sel),
  .o_p1_sl_tx_dl_async_pulse (o_p1_sl_tx_dl_async_pulse),
  .o_p1_sl_rx_dl_async_pulse (o_p1_sl_rx_dl_async_pulse),
  .i_p1_sl_latency_sclk      (i_p1_sl_latency_sclk),
  .i_p1_sl_tx_dl_measure_sel (i_p1_sl_tx_dl_measure_sel),
  .i_p1_sl_rx_dl_measure_sel (i_p1_sl_rx_dl_measure_sel),
  .o_p2_sl_tx_dl_async_pulse (o_p2_sl_tx_dl_async_pulse),
  .o_p2_sl_rx_dl_async_pulse (o_p2_sl_rx_dl_async_pulse),
  .i_p2_sl_latency_sclk      (i_p2_sl_latency_sclk),
  .i_p2_sl_tx_dl_measure_sel (i_p2_sl_tx_dl_measure_sel),
  .i_p2_sl_rx_dl_measure_sel (i_p2_sl_rx_dl_measure_sel),
  .o_p3_sl_tx_dl_async_pulse (o_p3_sl_tx_dl_async_pulse),
  .o_p3_sl_rx_dl_async_pulse (o_p3_sl_rx_dl_async_pulse),
  .i_p3_sl_latency_sclk      (i_p3_sl_latency_sclk),
  .i_p3_sl_tx_dl_measure_sel (i_p3_sl_tx_dl_measure_sel),
  .i_p3_sl_rx_dl_measure_sel (i_p3_sl_rx_dl_measure_sel),
  // ---------------------
  // Custom Rate Interface
  // ---------------------
  .o_p0_txfifo_pfull     (o_p0_txfifo_pfull),
  .o_p0_txfifo_pempty    (o_p0_txfifo_pempty),
  .o_p0_txfifo_overflow  (o_p0_txfifo_overflow),
  .o_p0_txfifo_underflow (o_p0_txfifo_underflow),
  .o_p1_txfifo_pfull     (o_p1_txfifo_pfull),
  .o_p1_txfifo_pempty    (o_p1_txfifo_pempty),
  .o_p1_txfifo_overflow  (o_p1_txfifo_overflow),
  .o_p1_txfifo_underflow (o_p1_txfifo_underflow),
  .o_p2_txfifo_pfull     (o_p2_txfifo_pfull),
  .o_p2_txfifo_pempty    (o_p2_txfifo_pempty),
  .o_p2_txfifo_overflow  (o_p2_txfifo_overflow),
  .o_p2_txfifo_underflow (o_p2_txfifo_underflow),
  .o_p3_txfifo_pfull     (o_p3_txfifo_pfull),
  .o_p3_txfifo_pempty    (o_p3_txfifo_pempty),
  .o_p3_txfifo_overflow  (o_p3_txfifo_overflow),
  .o_p3_txfifo_underflow (o_p3_txfifo_underflow),
  // ---------------------
    //AXI4 Lite Bridge Signals
  // ---------------------
          .i_p0_port_profile       (p0_curr_profile),
          //
          .p0_eth_reconfig_address         (p0_eth_reconfig_address[13:2]),
          .p0_eth_reconfig_read            (p0_eth_reconfig_read),
          .p0_eth_reconfig_write           (p0_eth_reconfig_write),
          .p0_eth_reconfig_waitrequest     (p0_eth_reconfig_waitrequest),
          .p0_eth_reconfig_readdatavalid   (p0_eth_reconfig_readdatavalid),
          .p0_eth_reconfig_readdata        (p0_eth_reconfig_readdata),
          .p0_eth_reconfig_writedata       (p0_eth_reconfig_writedata),
          //
          .p0_c0_xcvr_reconfig_address        (p0_c0_xcvr_reconfig_address),
          .p0_c0_xcvr_reconfig_read           (p0_c0_xcvr_reconfig_read),
          .p0_c0_xcvr_reconfig_write          (p0_c0_xcvr_reconfig_write),
          .p0_c0_xcvr_reconfig_waitrequest    (p0_c0_xcvr_reconfig_waitrequest),
          .p0_c0_xcvr_reconfig_readdatavalid  (p0_c0_xcvr_reconfig_readdatavalid),
          .p0_c0_xcvr_reconfig_readdata       (p0_c0_xcvr_reconfig_readdata[7:0]),
          .p0_c0_xcvr_reconfig_writedata      (p0_c0_xcvr_reconfig_writedata[7:0]),
//  FEC AVMM reconifg
          .p0_rsfec_reconfig_address         (p0_rsfec_reconfig_address),
          .p0_rsfec_reconfig_read            (p0_rsfec_reconfig_read),
          .p0_rsfec_reconfig_write           (p0_rsfec_reconfig_write),
          .p0_rsfec_reconfig_waitrequest     (p0_rsfec_reconfig_waitrequest),
          .p0_rsfec_reconfig_readdatavalid   (p0_rsfec_reconfig_readdatavalid),
          .p0_rsfec_reconfig_readdata        (p0_rsfec_reconfig_readdata[7:0]),
          .p0_rsfec_reconfig_writedata       (p0_rsfec_reconfig_writedata[7:0]),
//   PTP AVMM reconfig
            .p0_ptp0_reconfig_address         (p0_ptp0_reconfig_address),
            .p0_ptp0_reconfig_read            (p0_ptp0_reconfig_read),
            .p0_ptp0_reconfig_write           (p0_ptp0_reconfig_write),
            .p0_ptp0_reconfig_waitrequest     (p0_ptp0_reconfig_waitrequest),
            .p0_ptp0_reconfig_readdatavalid   (p0_ptp0_reconfig_readdatavalid),
            .p0_ptp0_reconfig_readdata        (p0_ptp0_reconfig_readdata[7:0]),
            .p0_ptp0_reconfig_writedata       (p0_ptp0_reconfig_writedata[7:0]),
            .p0_ptp1_reconfig_address         (p0_ptp1_reconfig_address),
            .p0_ptp1_reconfig_read            (p0_ptp1_reconfig_read),
            .p0_ptp1_reconfig_write           (p0_ptp1_reconfig_write),
            .p0_ptp1_reconfig_waitrequest     (p0_ptp1_reconfig_waitrequest),
            .p0_ptp1_reconfig_readdatavalid   (p0_ptp1_reconfig_readdatavalid),
            .p0_ptp1_reconfig_readdata        (p0_ptp1_reconfig_readdata[7:0]),
            .p0_ptp1_reconfig_writedata       (p0_ptp1_reconfig_writedata[7:0]),
          .i_p1_port_profile       (p1_curr_profile),
          //
          .p1_eth_reconfig_address         (p1_eth_reconfig_address[13:2]),
          .p1_eth_reconfig_read            (p1_eth_reconfig_read),
          .p1_eth_reconfig_write           (p1_eth_reconfig_write),
          .p1_eth_reconfig_waitrequest     (p1_eth_reconfig_waitrequest),
          .p1_eth_reconfig_readdatavalid   (p1_eth_reconfig_readdatavalid),
          .p1_eth_reconfig_readdata        (p1_eth_reconfig_readdata),
          .p1_eth_reconfig_writedata       (p1_eth_reconfig_writedata),
          //
          .p1_c0_xcvr_reconfig_address        (p1_c0_xcvr_reconfig_address),
          .p1_c0_xcvr_reconfig_read           (p1_c0_xcvr_reconfig_read),
          .p1_c0_xcvr_reconfig_write          (p1_c0_xcvr_reconfig_write),
          .p1_c0_xcvr_reconfig_waitrequest    (p1_c0_xcvr_reconfig_waitrequest),
          .p1_c0_xcvr_reconfig_readdatavalid  (p1_c0_xcvr_reconfig_readdatavalid),
          .p1_c0_xcvr_reconfig_readdata       (p1_c0_xcvr_reconfig_readdata[7:0]),
          .p1_c0_xcvr_reconfig_writedata      (p1_c0_xcvr_reconfig_writedata[7:0]),
//  FEC AVMM reconifg
//   PTP AVMM reconfig
          .i_p2_port_profile       (p2_curr_profile),
          //
          .p2_eth_reconfig_address         (p2_eth_reconfig_address[13:2]),
          .p2_eth_reconfig_read            (p2_eth_reconfig_read),
          .p2_eth_reconfig_write           (p2_eth_reconfig_write),
          .p2_eth_reconfig_waitrequest     (p2_eth_reconfig_waitrequest),
          .p2_eth_reconfig_readdatavalid   (p2_eth_reconfig_readdatavalid),
          .p2_eth_reconfig_readdata        (p2_eth_reconfig_readdata),
          .p2_eth_reconfig_writedata       (p2_eth_reconfig_writedata),
          //
          .p2_c0_xcvr_reconfig_address        (p2_c0_xcvr_reconfig_address),
          .p2_c0_xcvr_reconfig_read           (p2_c0_xcvr_reconfig_read),
          .p2_c0_xcvr_reconfig_write          (p2_c0_xcvr_reconfig_write),
          .p2_c0_xcvr_reconfig_waitrequest    (p2_c0_xcvr_reconfig_waitrequest),
          .p2_c0_xcvr_reconfig_readdatavalid  (p2_c0_xcvr_reconfig_readdatavalid),
          .p2_c0_xcvr_reconfig_readdata       (p2_c0_xcvr_reconfig_readdata[7:0]),
          .p2_c0_xcvr_reconfig_writedata      (p2_c0_xcvr_reconfig_writedata[7:0]),
//  FEC AVMM reconifg
//   PTP AVMM reconfig
          .i_p3_port_profile       (p3_curr_profile),
          //
          .p3_eth_reconfig_address         (p3_eth_reconfig_address[13:2]),
          .p3_eth_reconfig_read            (p3_eth_reconfig_read),
          .p3_eth_reconfig_write           (p3_eth_reconfig_write),
          .p3_eth_reconfig_waitrequest     (p3_eth_reconfig_waitrequest),
          .p3_eth_reconfig_readdatavalid   (p3_eth_reconfig_readdatavalid),
          .p3_eth_reconfig_readdata        (p3_eth_reconfig_readdata),
          .p3_eth_reconfig_writedata       (p3_eth_reconfig_writedata),
          //
          .p3_c0_xcvr_reconfig_address        (p3_c0_xcvr_reconfig_address),
          .p3_c0_xcvr_reconfig_read           (p3_c0_xcvr_reconfig_read),
          .p3_c0_xcvr_reconfig_write          (p3_c0_xcvr_reconfig_write),
          .p3_c0_xcvr_reconfig_waitrequest    (p3_c0_xcvr_reconfig_waitrequest),
          .p3_c0_xcvr_reconfig_readdatavalid  (p3_c0_xcvr_reconfig_readdatavalid),
          .p3_c0_xcvr_reconfig_readdata       (p3_c0_xcvr_reconfig_readdata[7:0]),
          .p3_c0_xcvr_reconfig_writedata      (p3_c0_xcvr_reconfig_writedata[7:0]),
//  FEC AVMM reconifg
//   PTP AVMM reconfig
		    .p0_ptp_parser_reconfig_awaddr         (p0_ptp_parser_reconfig_awaddr),     
		    .p0_ptp_parser_reconfig_awprot         (p0_ptp_parser_reconfig_awprot),     
		    .p0_ptp_parser_reconfig_awvalid        (p0_ptp_parser_reconfig_awvalid),    
		    .p0_ptp_parser_reconfig_awready        (p0_ptp_parser_reconfig_awready),    
		    .p0_ptp_parser_reconfig_wdata          (p0_ptp_parser_reconfig_wdata),      
		    .p0_ptp_parser_reconfig_wstrb          (p0_ptp_parser_reconfig_wstrb),      
		    .p0_ptp_parser_reconfig_wvalid         (p0_ptp_parser_reconfig_wvalid),     
		    .p0_ptp_parser_reconfig_wready         (p0_ptp_parser_reconfig_wready),     
		    .p0_ptp_parser_reconfig_bresp          (p0_ptp_parser_reconfig_bresp),      
		    .p0_ptp_parser_reconfig_bvalid         (p0_ptp_parser_reconfig_bvalid),     
		    .p0_ptp_parser_reconfig_bready         (p0_ptp_parser_reconfig_bready),     
		    .p0_ptp_parser_reconfig_araddr         (p0_ptp_parser_reconfig_araddr),     
		    .p0_ptp_parser_reconfig_arprot         (p0_ptp_parser_reconfig_arprot),     
		    .p0_ptp_parser_reconfig_arvalid        (p0_ptp_parser_reconfig_arvalid),    
		    .p0_ptp_parser_reconfig_arready        (p0_ptp_parser_reconfig_arready),    
		    .p0_ptp_parser_reconfig_rdata          (p0_ptp_parser_reconfig_rdata),      
		    .p0_ptp_parser_reconfig_rresp          (p0_ptp_parser_reconfig_rresp),      
		    .p0_ptp_parser_reconfig_rvalid         (p0_ptp_parser_reconfig_rvalid),     
		    .p0_ptp_parser_reconfig_rready         (p0_ptp_parser_reconfig_rready),     
		    .p1_ptp_parser_reconfig_awaddr         (p1_ptp_parser_reconfig_awaddr),     
		    .p1_ptp_parser_reconfig_awprot         (p1_ptp_parser_reconfig_awprot),     
		    .p1_ptp_parser_reconfig_awvalid        (p1_ptp_parser_reconfig_awvalid),    
		    .p1_ptp_parser_reconfig_awready        (p1_ptp_parser_reconfig_awready),    
		    .p1_ptp_parser_reconfig_wdata          (p1_ptp_parser_reconfig_wdata),      
		    .p1_ptp_parser_reconfig_wstrb          (p1_ptp_parser_reconfig_wstrb),      
		    .p1_ptp_parser_reconfig_wvalid         (p1_ptp_parser_reconfig_wvalid),     
		    .p1_ptp_parser_reconfig_wready         (p1_ptp_parser_reconfig_wready),     
		    .p1_ptp_parser_reconfig_bresp          (p1_ptp_parser_reconfig_bresp),      
		    .p1_ptp_parser_reconfig_bvalid         (p1_ptp_parser_reconfig_bvalid),     
		    .p1_ptp_parser_reconfig_bready         (p1_ptp_parser_reconfig_bready),     
		    .p1_ptp_parser_reconfig_araddr         (p1_ptp_parser_reconfig_araddr),     
		    .p1_ptp_parser_reconfig_arprot         (p1_ptp_parser_reconfig_arprot),     
		    .p1_ptp_parser_reconfig_arvalid        (p1_ptp_parser_reconfig_arvalid),    
		    .p1_ptp_parser_reconfig_arready        (p1_ptp_parser_reconfig_arready),    
		    .p1_ptp_parser_reconfig_rdata          (p1_ptp_parser_reconfig_rdata),      
		    .p1_ptp_parser_reconfig_rresp          (p1_ptp_parser_reconfig_rresp),      
		    .p1_ptp_parser_reconfig_rvalid         (p1_ptp_parser_reconfig_rvalid),     
		    .p1_ptp_parser_reconfig_rready         (p1_ptp_parser_reconfig_rready),     
		    .p2_ptp_parser_reconfig_awaddr         (p2_ptp_parser_reconfig_awaddr),     
		    .p2_ptp_parser_reconfig_awprot         (p2_ptp_parser_reconfig_awprot),     
		    .p2_ptp_parser_reconfig_awvalid        (p2_ptp_parser_reconfig_awvalid),    
		    .p2_ptp_parser_reconfig_awready        (p2_ptp_parser_reconfig_awready),    
		    .p2_ptp_parser_reconfig_wdata          (p2_ptp_parser_reconfig_wdata),      
		    .p2_ptp_parser_reconfig_wstrb          (p2_ptp_parser_reconfig_wstrb),      
		    .p2_ptp_parser_reconfig_wvalid         (p2_ptp_parser_reconfig_wvalid),     
		    .p2_ptp_parser_reconfig_wready         (p2_ptp_parser_reconfig_wready),     
		    .p2_ptp_parser_reconfig_bresp          (p2_ptp_parser_reconfig_bresp),      
		    .p2_ptp_parser_reconfig_bvalid         (p2_ptp_parser_reconfig_bvalid),     
		    .p2_ptp_parser_reconfig_bready         (p2_ptp_parser_reconfig_bready),     
		    .p2_ptp_parser_reconfig_araddr         (p2_ptp_parser_reconfig_araddr),     
		    .p2_ptp_parser_reconfig_arprot         (p2_ptp_parser_reconfig_arprot),     
		    .p2_ptp_parser_reconfig_arvalid        (p2_ptp_parser_reconfig_arvalid),    
		    .p2_ptp_parser_reconfig_arready        (p2_ptp_parser_reconfig_arready),    
		    .p2_ptp_parser_reconfig_rdata          (p2_ptp_parser_reconfig_rdata),      
		    .p2_ptp_parser_reconfig_rresp          (p2_ptp_parser_reconfig_rresp),      
		    .p2_ptp_parser_reconfig_rvalid         (p2_ptp_parser_reconfig_rvalid),     
		    .p2_ptp_parser_reconfig_rready         (p2_ptp_parser_reconfig_rready),     
		    .p3_ptp_parser_reconfig_awaddr         (p3_ptp_parser_reconfig_awaddr),     
		    .p3_ptp_parser_reconfig_awprot         (p3_ptp_parser_reconfig_awprot),     
		    .p3_ptp_parser_reconfig_awvalid        (p3_ptp_parser_reconfig_awvalid),    
		    .p3_ptp_parser_reconfig_awready        (p3_ptp_parser_reconfig_awready),    
		    .p3_ptp_parser_reconfig_wdata          (p3_ptp_parser_reconfig_wdata),      
		    .p3_ptp_parser_reconfig_wstrb          (p3_ptp_parser_reconfig_wstrb),      
		    .p3_ptp_parser_reconfig_wvalid         (p3_ptp_parser_reconfig_wvalid),     
		    .p3_ptp_parser_reconfig_wready         (p3_ptp_parser_reconfig_wready),     
		    .p3_ptp_parser_reconfig_bresp          (p3_ptp_parser_reconfig_bresp),      
		    .p3_ptp_parser_reconfig_bvalid         (p3_ptp_parser_reconfig_bvalid),     
		    .p3_ptp_parser_reconfig_bready         (p3_ptp_parser_reconfig_bready),     
		    .p3_ptp_parser_reconfig_araddr         (p3_ptp_parser_reconfig_araddr),     
		    .p3_ptp_parser_reconfig_arprot         (p3_ptp_parser_reconfig_arprot),     
		    .p3_ptp_parser_reconfig_arvalid        (p3_ptp_parser_reconfig_arvalid),    
		    .p3_ptp_parser_reconfig_arready        (p3_ptp_parser_reconfig_arready),    
		    .p3_ptp_parser_reconfig_rdata          (p3_ptp_parser_reconfig_rdata),      
		    .p3_ptp_parser_reconfig_rresp          (p3_ptp_parser_reconfig_rresp),      
		    .p3_ptp_parser_reconfig_rvalid         (p3_ptp_parser_reconfig_rvalid),     
		    .p3_ptp_parser_reconfig_rready         (p3_ptp_parser_reconfig_rready),     
    //CSR registers
        .o_p0_rx_block_lock      (p0_rx_block_lock),
        .o_p0_rx_am_lock         (p0_rx_am_lock), 
        .o_p0_local_fault_status (p0_local_fault_status),
        .o_p0_remote_fault_status(p0_remote_fault_status), 
        .o_p0_rx_hi_ber          (p0_rx_hi_ber),
        .o_p0_ehip_ready         (p0_ehip_ready),
        .o_p0_cdr_lock           (p0_cdr_lock), 
        .o_p0_link_status        (p0_link_status), 
        .o_p1_rx_block_lock      (p1_rx_block_lock),
        .o_p1_rx_am_lock         (p1_rx_am_lock), 
        .o_p1_local_fault_status (p1_local_fault_status),
        .o_p1_remote_fault_status(p1_remote_fault_status), 
        .o_p1_rx_hi_ber          (p1_rx_hi_ber),
        .o_p1_ehip_ready         (p1_ehip_ready),
        .o_p1_cdr_lock           (p1_cdr_lock), 
        .o_p1_link_status        (p1_link_status), 
        .o_p2_rx_block_lock      (p2_rx_block_lock),
        .o_p2_rx_am_lock         (p2_rx_am_lock), 
        .o_p2_local_fault_status (p2_local_fault_status),
        .o_p2_remote_fault_status(p2_remote_fault_status), 
        .o_p2_rx_hi_ber          (p2_rx_hi_ber),
        .o_p2_ehip_ready         (p2_ehip_ready),
        .o_p2_cdr_lock           (p2_cdr_lock), 
        .o_p2_link_status        (p2_link_status), 
        .o_p3_rx_block_lock      (p3_rx_block_lock),
        .o_p3_rx_am_lock         (p3_rx_am_lock), 
        .o_p3_local_fault_status (p3_local_fault_status),
        .o_p3_remote_fault_status(p3_remote_fault_status), 
        .o_p3_rx_hi_ber          (p3_rx_hi_ber),
        .o_p3_ehip_ready         (p3_ehip_ready),
        .o_p3_cdr_lock           (p3_cdr_lock), 
        .o_p3_link_status        (p3_link_status), 
    .o_xcvr_ready         (xcvr_ready),
    .o_tx_pma_ready       (tx_pma_ready),
    .o_rx_pma_ready       (rx_pma_ready),
    .hotplug_status       (hotplug_status_all),
    .hotplug_control      (hotplug_control[31:0]),
    .po_pma_cal_done      (po_pma_cal_done),
    .i_hotplug_disable_fm (hotplug_disable_fm),
    .i_hotplug_lpbk_en_fm (hotplug_lpbk_en_fm),
    .o_hotplug_paused_fm  (hotplug_paused_fm),
    .tp()
	  );

//***************************************************************************************************
//*************************************** JTAG AVMM IF  ******************************************
//***************************************************************************************************

generate
if (ENABLE_JTAG)
begin : GEN_JTAG_AVMM

    //assign jtag_addr = av_addr[27:0]; //no need to shift offset address
    assign jtag_addr = av_addr[27:2]; //needto shift offset address
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
        .master_byteenable      (jtag_byteenable_tmp),
        .master_reset_reset     ()
    );


    //As address is shifted, all address are word aligned (not byte wise) 
    //shifting data and byte enable as address is shifted 
    assign jtag_byteenable   = (jtag_byteenable_tmp << jtag_addr[1:0]);
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
if (SIM_MODE_EN == 1)
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
    else
      axi_lite_ready_en <= 1'b1;
    //else if(nios_command_complete_d2) //TBD
    //  axi_lite_ready_en <= 1'b1;
    //else
    //  axi_lite_ready_en <= axi_lite_ready_en; 
  end
end
endgenerate

//on reset assertion bridge is not making ready signals low, due to this access is failing (delay due to reset sync module)
//so making ready low on reset
assign ss_app_lite_arready = ss_app_lite_arready_brdige && axi_lite_ready_en;
assign ss_app_lite_awready = ss_app_lite_awready_brdige && axi_lite_ready_en;
assign ss_app_lite_wready  = ss_app_lite_wready_brdige && axi_lite_ready_en;
//
assign ss_app_lite_bvalid = ss_app_lite_bvalid_bridge | axi_lite_hung_bvalid;
assign ss_app_lite_bresp  = SET_AXI_LITE_RESPONSE_TO_ZERO ? 2'd0 : (axi_lite_hung_bvalid ? 2'd3 : ss_app_lite_bresp_bridge);

assign ss_app_lite_rvalid = ss_app_lite_rvalid_bridge | axi_lite_hung_rvalid;
assign ss_app_lite_rresp  = SET_AXI_LITE_RESPONSE_TO_ZERO ? 2'd0 : (axi_lite_hung_rvalid ? 2'd3 : ss_app_lite_rresp_bridge);
//assign ss_app_lite_rdata  = axi_lite_hung_rvalid ? 32'hDEADC0DE : ss_app_lite_rdata_bridge;
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
      else if(ss_app_lite_arready_brdige)
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
      else if(ss_app_lite_awready_brdige)
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
      else if(cpu_reconfig_read | cpu_reconfig_write)
      begin
	if (cpu_reconfig_waitrequest == 1'b0) //This for back-to-back access
          nios_cpu_rd_wr_hung_cntr <= 32'd0;
      	else if(nios_cpu_rd_wr_hung_cntr >= HUNG_WAIT_TIME)
      	  nios_cpu_rd_wr_hung_cntr <= HUNG_WAIT_TIME;
      	else
      	  nios_cpu_rd_wr_hung_cntr <= nios_cpu_rd_wr_hung_cntr + 'd1;
      end
      else
        nios_cpu_rd_wr_hung_cntr <= 32'd0;
    end

    always @(posedge app_ss_lite_clk)
    begin
      axi_lite_wr_pending  <= (~ss_app_lite_awready_brdige && ~axi_lite_wr_hung_det);
      axi_lite_rd_pending  <= (~ss_app_lite_arready_brdige && ~axi_lite_rd_hung_det);
      nios_cpu_rd_wr_pending <= ((cpu_reconfig_read | cpu_reconfig_write) && ~nios_cpu_rd_wr_hung_det);
      axi_lite_rd_hung_det <= (axi_lite_rd_hung_cntr >= HUNG_WAIT_TIME) ? 1'b1 : 1'b0;
      axi_lite_wr_hung_det <= (axi_lite_wr_hung_cntr >= HUNG_WAIT_TIME) ? 1'b1 : 1'b0;
      nios_cpu_rd_wr_hung_det <= (nios_cpu_rd_wr_hung_cntr >= HUNG_WAIT_TIME) ? 1'b1 : 1'b0;
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
        axi_lite_rresp_sent  <= 1'b1;
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
  	      nios_cpu_hung_readdata_valid <= cpu_reconfig_read && ~nios_cpu_hung_waitrequest;
  	end
  end

    always @(posedge app_ss_lite_clk or negedge nios_rst_n)
    begin
      if(~nios_rst_n)
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

hssi_ss_axilite_avmm_bridge U_hssi_ss_axilite_avmm_bridge (
          .clk_clk                                      (app_ss_lite_clk),
          .reset_reset_n                                (axi_lite_bridge_rst_n),
          //
          .axi4_lite_awaddr                             (app_ss_lite_awaddr),
          .axi4_lite_awvalid                            (app_ss_lite_awvalid && axi_lite_ready_en),
          .axi4_lite_awready                            (ss_app_lite_awready_brdige),
          .axi4_lite_awprot                             (app_ss_lite_awprot),
          .axi4_lite_wvalid                             (app_ss_lite_wvalid && axi_lite_ready_en),
          .axi4_lite_wready                             (ss_app_lite_wready_brdige),
          .axi4_lite_wdata                              (app_ss_lite_wdata),
          .axi4_lite_wstrb                              (app_ss_lite_wstrb), //wstrb is supported by brigdge, but ignored as per HAS
          .axi4_lite_bresp                              (ss_app_lite_bresp_bridge),
          .axi4_lite_bvalid                             (ss_app_lite_bvalid_bridge),
          .axi4_lite_bready                             (app_ss_lite_bready), 
          .axi4_lite_araddr                             (app_ss_lite_araddr),
          .axi4_lite_arprot                             (app_ss_lite_arprot),
          .axi4_lite_arvalid                            (app_ss_lite_arvalid && axi_lite_ready_en),
          .axi4_lite_arready                            (ss_app_lite_arready_brdige),
          .axi4_lite_rdata                              (ss_app_lite_rdata_bridge),
          .axi4_lite_rresp                              (ss_app_lite_rresp_bridge),
          .axi4_lite_rvalid                             (ss_app_lite_rvalid_bridge),
          .axi4_lite_rready                             (app_ss_lite_rready),
          //
          .cpu_reconfig_address                         (cpu_reconfig_addr),
          .cpu_reconfig_read                            (cpu_reconfig_read),
          .cpu_reconfig_write                           (cpu_reconfig_write),
          .cpu_reconfig_writedata                       (cpu_reconfig_writedata),
          .cpu_reconfig_readdata                        (cpu_reconfig_readdata),
          .cpu_reconfig_readdatavalid                   (cpu_reconfig_readdata_valid),
          .cpu_reconfig_waitrequest                     (cpu_reconfig_waitrequest),
          .cpu_reconfig_byteenable                      (cpu_reconfig_byteenable),
          .cpu_reconfig_burstcount                      (1'b0),
                            
          //AVMM Slaves
          .p0_eth_reconfig_address             (p0_eth_reconfig_address),
          .p0_eth_reconfig_read                (p0_eth_reconfig_read),
          .p0_eth_reconfig_write               (p0_eth_reconfig_write),
          .p0_eth_reconfig_waitrequest         (p0_eth_reconfig_waitrequest),
          .p0_eth_reconfig_readdatavalid       (p0_eth_reconfig_readdatavalid),
          .p0_eth_reconfig_readdata            (p0_eth_reconfig_readdata),
          .p0_eth_reconfig_writedata           (p0_eth_reconfig_writedata),
          //
          .p0_c0_xcvr_reconfig_address            (p0_c0_xcvr_reconfig_address),
          .p0_c0_xcvr_reconfig_read               (p0_c0_xcvr_reconfig_read),
          .p0_c0_xcvr_reconfig_write              (p0_c0_xcvr_reconfig_write),
          .p0_c0_xcvr_reconfig_waitrequest        (p0_c0_xcvr_reconfig_waitrequest),
          .p0_c0_xcvr_reconfig_readdatavalid      (p0_c0_xcvr_reconfig_readdatavalid),
          .p0_c0_xcvr_reconfig_readdata           (p0_c0_xcvr_reconfig_readdata[7:0]),
          .p0_c0_xcvr_reconfig_writedata          (p0_c0_xcvr_reconfig_writedata[7:0]),
          // FEC reconfig AVMM slaves
          .p0_rsfec_reconfig_address         (p0_rsfec_reconfig_address),
          .p0_rsfec_reconfig_read            (p0_rsfec_reconfig_read),
          .p0_rsfec_reconfig_write           (p0_rsfec_reconfig_write),
          .p0_rsfec_reconfig_waitrequest     (p0_rsfec_reconfig_waitrequest),
          .p0_rsfec_reconfig_readdatavalid   (p0_rsfec_reconfig_readdatavalid),
          .p0_rsfec_reconfig_readdata        (p0_rsfec_reconfig_readdata[7:0]),
          .p0_rsfec_reconfig_writedata       (p0_rsfec_reconfig_writedata[7:0]),
      //PTP reconfig AVMM slaves
            .p0_ptp0_reconfig_address            (p0_ptp0_reconfig_address),
            .p0_ptp0_reconfig_read               (p0_ptp0_reconfig_read),
            .p0_ptp0_reconfig_write              (p0_ptp0_reconfig_write),
            .p0_ptp0_reconfig_waitrequest        (p0_ptp0_reconfig_waitrequest),
            .p0_ptp0_reconfig_readdatavalid      (p0_ptp0_reconfig_readdatavalid),
            .p0_ptp0_reconfig_readdata           (p0_ptp0_reconfig_readdata[7:0]),
            .p0_ptp0_reconfig_writedata          (p0_ptp0_reconfig_writedata[7:0]),
            .p0_ptp1_reconfig_address            (p0_ptp1_reconfig_address),
            .p0_ptp1_reconfig_read               (p0_ptp1_reconfig_read),
            .p0_ptp1_reconfig_write              (p0_ptp1_reconfig_write),
            .p0_ptp1_reconfig_waitrequest        (p0_ptp1_reconfig_waitrequest),
            .p0_ptp1_reconfig_readdatavalid      (p0_ptp1_reconfig_readdatavalid),
            .p0_ptp1_reconfig_readdata           (p0_ptp1_reconfig_readdata[7:0]),
            .p0_ptp1_reconfig_writedata          (p0_ptp1_reconfig_writedata[7:0]),
//
          .p1_eth_reconfig_address             (p1_eth_reconfig_address),
          .p1_eth_reconfig_read                (p1_eth_reconfig_read),
          .p1_eth_reconfig_write               (p1_eth_reconfig_write),
          .p1_eth_reconfig_waitrequest         (p1_eth_reconfig_waitrequest),
          .p1_eth_reconfig_readdatavalid       (p1_eth_reconfig_readdatavalid),
          .p1_eth_reconfig_readdata            (p1_eth_reconfig_readdata),
          .p1_eth_reconfig_writedata           (p1_eth_reconfig_writedata),
          //
          .p1_c0_xcvr_reconfig_address            (p1_c0_xcvr_reconfig_address),
          .p1_c0_xcvr_reconfig_read               (p1_c0_xcvr_reconfig_read),
          .p1_c0_xcvr_reconfig_write              (p1_c0_xcvr_reconfig_write),
          .p1_c0_xcvr_reconfig_waitrequest        (p1_c0_xcvr_reconfig_waitrequest),
          .p1_c0_xcvr_reconfig_readdatavalid      (p1_c0_xcvr_reconfig_readdatavalid),
          .p1_c0_xcvr_reconfig_readdata           (p1_c0_xcvr_reconfig_readdata[7:0]),
          .p1_c0_xcvr_reconfig_writedata          (p1_c0_xcvr_reconfig_writedata[7:0]),
          // FEC reconfig AVMM slaves
      //PTP reconfig AVMM slaves
//
          .p2_eth_reconfig_address             (p2_eth_reconfig_address),
          .p2_eth_reconfig_read                (p2_eth_reconfig_read),
          .p2_eth_reconfig_write               (p2_eth_reconfig_write),
          .p2_eth_reconfig_waitrequest         (p2_eth_reconfig_waitrequest),
          .p2_eth_reconfig_readdatavalid       (p2_eth_reconfig_readdatavalid),
          .p2_eth_reconfig_readdata            (p2_eth_reconfig_readdata),
          .p2_eth_reconfig_writedata           (p2_eth_reconfig_writedata),
          //
          .p2_c0_xcvr_reconfig_address            (p2_c0_xcvr_reconfig_address),
          .p2_c0_xcvr_reconfig_read               (p2_c0_xcvr_reconfig_read),
          .p2_c0_xcvr_reconfig_write              (p2_c0_xcvr_reconfig_write),
          .p2_c0_xcvr_reconfig_waitrequest        (p2_c0_xcvr_reconfig_waitrequest),
          .p2_c0_xcvr_reconfig_readdatavalid      (p2_c0_xcvr_reconfig_readdatavalid),
          .p2_c0_xcvr_reconfig_readdata           (p2_c0_xcvr_reconfig_readdata[7:0]),
          .p2_c0_xcvr_reconfig_writedata          (p2_c0_xcvr_reconfig_writedata[7:0]),
          // FEC reconfig AVMM slaves
      //PTP reconfig AVMM slaves
//
          .p3_eth_reconfig_address             (p3_eth_reconfig_address),
          .p3_eth_reconfig_read                (p3_eth_reconfig_read),
          .p3_eth_reconfig_write               (p3_eth_reconfig_write),
          .p3_eth_reconfig_waitrequest         (p3_eth_reconfig_waitrequest),
          .p3_eth_reconfig_readdatavalid       (p3_eth_reconfig_readdatavalid),
          .p3_eth_reconfig_readdata            (p3_eth_reconfig_readdata),
          .p3_eth_reconfig_writedata           (p3_eth_reconfig_writedata),
          //
          .p3_c0_xcvr_reconfig_address            (p3_c0_xcvr_reconfig_address),
          .p3_c0_xcvr_reconfig_read               (p3_c0_xcvr_reconfig_read),
          .p3_c0_xcvr_reconfig_write              (p3_c0_xcvr_reconfig_write),
          .p3_c0_xcvr_reconfig_waitrequest        (p3_c0_xcvr_reconfig_waitrequest),
          .p3_c0_xcvr_reconfig_readdatavalid      (p3_c0_xcvr_reconfig_readdatavalid),
          .p3_c0_xcvr_reconfig_readdata           (p3_c0_xcvr_reconfig_readdata[7:0]),
          .p3_c0_xcvr_reconfig_writedata          (p3_c0_xcvr_reconfig_writedata[7:0]),
          // FEC reconfig AVMM slaves
      //PTP reconfig AVMM slaves
//
		    .p0_ptp_parser_reconfig_awaddr         (p0_ptp_parser_reconfig_awaddr),     
		    .p0_ptp_parser_reconfig_awprot         (p0_ptp_parser_reconfig_awprot),     
		    .p0_ptp_parser_reconfig_awvalid        (p0_ptp_parser_reconfig_awvalid),    
		    .p0_ptp_parser_reconfig_awready        (p0_ptp_parser_reconfig_awready),    
		    .p0_ptp_parser_reconfig_wdata          (p0_ptp_parser_reconfig_wdata),      
		    .p0_ptp_parser_reconfig_wstrb          (p0_ptp_parser_reconfig_wstrb),      
		    .p0_ptp_parser_reconfig_wvalid         (p0_ptp_parser_reconfig_wvalid),     
		    .p0_ptp_parser_reconfig_wready         (p0_ptp_parser_reconfig_wready),     
		    .p0_ptp_parser_reconfig_bresp          (p0_ptp_parser_reconfig_bresp),      
		    .p0_ptp_parser_reconfig_bvalid         (p0_ptp_parser_reconfig_bvalid),     
		    .p0_ptp_parser_reconfig_bready         (p0_ptp_parser_reconfig_bready),     
		    .p0_ptp_parser_reconfig_araddr         (p0_ptp_parser_reconfig_araddr),     
		    .p0_ptp_parser_reconfig_arprot         (p0_ptp_parser_reconfig_arprot),     
		    .p0_ptp_parser_reconfig_arvalid        (p0_ptp_parser_reconfig_arvalid),    
		    .p0_ptp_parser_reconfig_arready        (p0_ptp_parser_reconfig_arready),    
		    .p0_ptp_parser_reconfig_rdata          (p0_ptp_parser_reconfig_rdata),      
		    .p0_ptp_parser_reconfig_rresp          (p0_ptp_parser_reconfig_rresp),      
		    .p0_ptp_parser_reconfig_rvalid         (p0_ptp_parser_reconfig_rvalid),     
		    .p0_ptp_parser_reconfig_rready         (p0_ptp_parser_reconfig_rready),     
		    .p1_ptp_parser_reconfig_awaddr         (p1_ptp_parser_reconfig_awaddr),     
		    .p1_ptp_parser_reconfig_awprot         (p1_ptp_parser_reconfig_awprot),     
		    .p1_ptp_parser_reconfig_awvalid        (p1_ptp_parser_reconfig_awvalid),    
		    .p1_ptp_parser_reconfig_awready        (p1_ptp_parser_reconfig_awready),    
		    .p1_ptp_parser_reconfig_wdata          (p1_ptp_parser_reconfig_wdata),      
		    .p1_ptp_parser_reconfig_wstrb          (p1_ptp_parser_reconfig_wstrb),      
		    .p1_ptp_parser_reconfig_wvalid         (p1_ptp_parser_reconfig_wvalid),     
		    .p1_ptp_parser_reconfig_wready         (p1_ptp_parser_reconfig_wready),     
		    .p1_ptp_parser_reconfig_bresp          (p1_ptp_parser_reconfig_bresp),      
		    .p1_ptp_parser_reconfig_bvalid         (p1_ptp_parser_reconfig_bvalid),     
		    .p1_ptp_parser_reconfig_bready         (p1_ptp_parser_reconfig_bready),     
		    .p1_ptp_parser_reconfig_araddr         (p1_ptp_parser_reconfig_araddr),     
		    .p1_ptp_parser_reconfig_arprot         (p1_ptp_parser_reconfig_arprot),     
		    .p1_ptp_parser_reconfig_arvalid        (p1_ptp_parser_reconfig_arvalid),    
		    .p1_ptp_parser_reconfig_arready        (p1_ptp_parser_reconfig_arready),    
		    .p1_ptp_parser_reconfig_rdata          (p1_ptp_parser_reconfig_rdata),      
		    .p1_ptp_parser_reconfig_rresp          (p1_ptp_parser_reconfig_rresp),      
		    .p1_ptp_parser_reconfig_rvalid         (p1_ptp_parser_reconfig_rvalid),     
		    .p1_ptp_parser_reconfig_rready         (p1_ptp_parser_reconfig_rready),     
		    .p2_ptp_parser_reconfig_awaddr         (p2_ptp_parser_reconfig_awaddr),     
		    .p2_ptp_parser_reconfig_awprot         (p2_ptp_parser_reconfig_awprot),     
		    .p2_ptp_parser_reconfig_awvalid        (p2_ptp_parser_reconfig_awvalid),    
		    .p2_ptp_parser_reconfig_awready        (p2_ptp_parser_reconfig_awready),    
		    .p2_ptp_parser_reconfig_wdata          (p2_ptp_parser_reconfig_wdata),      
		    .p2_ptp_parser_reconfig_wstrb          (p2_ptp_parser_reconfig_wstrb),      
		    .p2_ptp_parser_reconfig_wvalid         (p2_ptp_parser_reconfig_wvalid),     
		    .p2_ptp_parser_reconfig_wready         (p2_ptp_parser_reconfig_wready),     
		    .p2_ptp_parser_reconfig_bresp          (p2_ptp_parser_reconfig_bresp),      
		    .p2_ptp_parser_reconfig_bvalid         (p2_ptp_parser_reconfig_bvalid),     
		    .p2_ptp_parser_reconfig_bready         (p2_ptp_parser_reconfig_bready),     
		    .p2_ptp_parser_reconfig_araddr         (p2_ptp_parser_reconfig_araddr),     
		    .p2_ptp_parser_reconfig_arprot         (p2_ptp_parser_reconfig_arprot),     
		    .p2_ptp_parser_reconfig_arvalid        (p2_ptp_parser_reconfig_arvalid),    
		    .p2_ptp_parser_reconfig_arready        (p2_ptp_parser_reconfig_arready),    
		    .p2_ptp_parser_reconfig_rdata          (p2_ptp_parser_reconfig_rdata),      
		    .p2_ptp_parser_reconfig_rresp          (p2_ptp_parser_reconfig_rresp),      
		    .p2_ptp_parser_reconfig_rvalid         (p2_ptp_parser_reconfig_rvalid),     
		    .p2_ptp_parser_reconfig_rready         (p2_ptp_parser_reconfig_rready),     
		    .p3_ptp_parser_reconfig_awaddr         (p3_ptp_parser_reconfig_awaddr),     
		    .p3_ptp_parser_reconfig_awprot         (p3_ptp_parser_reconfig_awprot),     
		    .p3_ptp_parser_reconfig_awvalid        (p3_ptp_parser_reconfig_awvalid),    
		    .p3_ptp_parser_reconfig_awready        (p3_ptp_parser_reconfig_awready),    
		    .p3_ptp_parser_reconfig_wdata          (p3_ptp_parser_reconfig_wdata),      
		    .p3_ptp_parser_reconfig_wstrb          (p3_ptp_parser_reconfig_wstrb),      
		    .p3_ptp_parser_reconfig_wvalid         (p3_ptp_parser_reconfig_wvalid),     
		    .p3_ptp_parser_reconfig_wready         (p3_ptp_parser_reconfig_wready),     
		    .p3_ptp_parser_reconfig_bresp          (p3_ptp_parser_reconfig_bresp),      
		    .p3_ptp_parser_reconfig_bvalid         (p3_ptp_parser_reconfig_bvalid),     
		    .p3_ptp_parser_reconfig_bready         (p3_ptp_parser_reconfig_bready),     
		    .p3_ptp_parser_reconfig_araddr         (p3_ptp_parser_reconfig_araddr),     
		    .p3_ptp_parser_reconfig_arprot         (p3_ptp_parser_reconfig_arprot),     
		    .p3_ptp_parser_reconfig_arvalid        (p3_ptp_parser_reconfig_arvalid),    
		    .p3_ptp_parser_reconfig_arready        (p3_ptp_parser_reconfig_arready),    
		    .p3_ptp_parser_reconfig_rdata          (p3_ptp_parser_reconfig_rdata),      
		    .p3_ptp_parser_reconfig_rresp          (p3_ptp_parser_reconfig_rresp),      
		    .p3_ptp_parser_reconfig_rvalid         (p3_ptp_parser_reconfig_rvalid),     
		    .p3_ptp_parser_reconfig_rready         (p3_ptp_parser_reconfig_rready),     
          // SS reconfig AVMM slave
          .ss_reconfig_address                    (ss_reconfig_address),
          .ss_reconfig_read                       (ss_reconfig_read),
          .ss_reconfig_write                      (ss_reconfig_write),
          .ss_reconfig_waitrequest                (ss_reconfig_waitrequest),
          .ss_reconfig_readdatavalid              (ss_reconfig_readdatavalid_tmp),
          .ss_reconfig_readdata                   (ss_reconfig_readdata),
          .ss_reconfig_byteenable                 (ss_reconfig_byteenable),
          .ss_reconfig_writedata                  (ss_reconfig_writedata)
    );





//*********************************************************************************
// -- Soft Reset Controller
//*********************************************************************************
hssi_ss_reset_sequencer_q5p32my #(
    .NUM_PORTS(NUM_ENABLED_PORTS),
    .SUBSYSTEM_RST_ACK_DEASSERT_DELAY(SUBSYSTEM_RST_ACK_DEASSERT_DELAY),
    .TX_RST_ACK_DEASSERT_DELAY(TX_RST_ACK_DEASSERT_DELAY),
    .RX_RST_ACK_DEASSERT_DELAY(RX_RST_ACK_DEASSERT_DELAY))
     U_SRC_RST_CONTROLLER (
        .i_p0_app_ss_st_client_clk(p0_app_ss_st_tx_clk),      // AXI ST Bridge Clock Input
        .i_p0_app_ss_st_clk(p0_app_ss_st_rx_clk),             //
        .i_p0_clk_rx(o_p0_clk_pll),                    // QHIp Rx Clock Input
        .i_p0_clk_tx(o_p0_clk_pll),                    // QHIP Tx Clock Input
        .i_p0_rx_rst_n(i_p0_rx_rst_n),                  // QHIP Rx Reset, Active Low
        .i_p0_tx_rst_n(i_p0_tx_rst_n),                  // QHIP Tx Reset, Active Low
        .i_p0_app_ss_st_client_areset_n(p0_app_ss_st_tx_areset_n), // AXI ST Bridge Clock Input
        .i_p0_app_ss_st_areset_n(p0_app_ss_st_rx_areset_n),         //
        .o_p0_axi_st_bridge_rx_rst_n(p0_axi_st_bridge_rx_rst_n),    // AXI ST Rx Bridge Reset, Active low
        .o_p0_axi_st_bridge_tx_rst_n(p0_axi_st_bridge_tx_rst_n),    // AXI ST Tx Bridge Reset, Active low
        .o_p0_rx_rst_n(p0_rx_rst_n),                  // QHIP Rx Reset, Active Low
        .o_p0_rx_rst_ack_n(o_p0_rx_rst_ack_n),              // QHIP Rx Reset Ack, Active Low
        .o_p0_tx_rst_n(p0_tx_rst_n),                  // QHIP Tx Reset, Active Low
        .o_p0_tx_rst_ack_n(o_p0_tx_rst_ack_n),              // QHIP Tx Reset Ack, Active Low
        .o_p0_csr_rst_n(p0_csr_rst_n),                 // QHIP CSR Reset, Active Low
        .o_p0_ereset_n(o_p0_ereset_n),

        .i_p0_pio_axi_st_bridge_rst_n(p0_pio_axi_st_bridge_rst_n),   // PIO_0 from NIOS
        .i_p0_pio_ehip_tx_rst_n(p0_pio_ehip_tx_rst_n),         // PIO_1 from NIOS
        .i_p0_pio_ehip_rx_rst_n(p0_pio_ehip_rx_rst_n),         // PIO_2 from NIOS
        .i_p0_pio_ereset_n(p0_pio_ereset_n),              // PIO_3 from NIOS

        .o_p0_reconfig_rst(p0_reconfig_rst),                 // QHIP Reconfig Reset, Active High
        .i_p1_app_ss_st_client_clk(p1_app_ss_st_tx_clk),      // AXI ST Bridge Clock Input
        .i_p1_app_ss_st_clk(p1_app_ss_st_rx_clk),             //
        .i_p1_clk_rx(o_p1_clk_pll),                    // QHIp Rx Clock Input
        .i_p1_clk_tx(o_p1_clk_pll),                    // QHIP Tx Clock Input
        .i_p1_rx_rst_n(i_p1_rx_rst_n),                  // QHIP Rx Reset, Active Low
        .i_p1_tx_rst_n(i_p1_tx_rst_n),                  // QHIP Tx Reset, Active Low
        .i_p1_app_ss_st_client_areset_n(p1_app_ss_st_tx_areset_n), // AXI ST Bridge Clock Input
        .i_p1_app_ss_st_areset_n(p1_app_ss_st_rx_areset_n),         //
        .o_p1_axi_st_bridge_rx_rst_n(p1_axi_st_bridge_rx_rst_n),    // AXI ST Rx Bridge Reset, Active low
        .o_p1_axi_st_bridge_tx_rst_n(p1_axi_st_bridge_tx_rst_n),    // AXI ST Tx Bridge Reset, Active low
        .o_p1_rx_rst_n(p1_rx_rst_n),                  // QHIP Rx Reset, Active Low
        .o_p1_rx_rst_ack_n(o_p1_rx_rst_ack_n),              // QHIP Rx Reset Ack, Active Low
        .o_p1_tx_rst_n(p1_tx_rst_n),                  // QHIP Tx Reset, Active Low
        .o_p1_tx_rst_ack_n(o_p1_tx_rst_ack_n),              // QHIP Tx Reset Ack, Active Low
        .o_p1_csr_rst_n(p1_csr_rst_n),                 // QHIP CSR Reset, Active Low
        .o_p1_ereset_n(o_p1_ereset_n),

        .i_p1_pio_axi_st_bridge_rst_n(p1_pio_axi_st_bridge_rst_n),   // PIO_0 from NIOS
        .i_p1_pio_ehip_tx_rst_n(p1_pio_ehip_tx_rst_n),         // PIO_1 from NIOS
        .i_p1_pio_ehip_rx_rst_n(p1_pio_ehip_rx_rst_n),         // PIO_2 from NIOS
        .i_p1_pio_ereset_n(p1_pio_ereset_n),              // PIO_3 from NIOS

        .o_p1_reconfig_rst(p1_reconfig_rst),                 // QHIP Reconfig Reset, Active High
        .i_p2_app_ss_st_client_clk(p2_app_ss_st_tx_clk),      // AXI ST Bridge Clock Input
        .i_p2_app_ss_st_clk(p2_app_ss_st_rx_clk),             //
        .i_p2_clk_rx(o_p2_clk_pll),                    // QHIp Rx Clock Input
        .i_p2_clk_tx(o_p2_clk_pll),                    // QHIP Tx Clock Input
        .i_p2_rx_rst_n(i_p2_rx_rst_n),                  // QHIP Rx Reset, Active Low
        .i_p2_tx_rst_n(i_p2_tx_rst_n),                  // QHIP Tx Reset, Active Low
        .i_p2_app_ss_st_client_areset_n(p2_app_ss_st_tx_areset_n), // AXI ST Bridge Clock Input
        .i_p2_app_ss_st_areset_n(p2_app_ss_st_rx_areset_n),         //
        .o_p2_axi_st_bridge_rx_rst_n(p2_axi_st_bridge_rx_rst_n),    // AXI ST Rx Bridge Reset, Active low
        .o_p2_axi_st_bridge_tx_rst_n(p2_axi_st_bridge_tx_rst_n),    // AXI ST Tx Bridge Reset, Active low
        .o_p2_rx_rst_n(p2_rx_rst_n),                  // QHIP Rx Reset, Active Low
        .o_p2_rx_rst_ack_n(o_p2_rx_rst_ack_n),              // QHIP Rx Reset Ack, Active Low
        .o_p2_tx_rst_n(p2_tx_rst_n),                  // QHIP Tx Reset, Active Low
        .o_p2_tx_rst_ack_n(o_p2_tx_rst_ack_n),              // QHIP Tx Reset Ack, Active Low
        .o_p2_csr_rst_n(p2_csr_rst_n),                 // QHIP CSR Reset, Active Low
        .o_p2_ereset_n(o_p2_ereset_n),

        .i_p2_pio_axi_st_bridge_rst_n(p2_pio_axi_st_bridge_rst_n),   // PIO_0 from NIOS
        .i_p2_pio_ehip_tx_rst_n(p2_pio_ehip_tx_rst_n),         // PIO_1 from NIOS
        .i_p2_pio_ehip_rx_rst_n(p2_pio_ehip_rx_rst_n),         // PIO_2 from NIOS
        .i_p2_pio_ereset_n(p2_pio_ereset_n),              // PIO_3 from NIOS

        .o_p2_reconfig_rst(p2_reconfig_rst),                 // QHIP Reconfig Reset, Active High
        .i_p3_app_ss_st_client_clk(p3_app_ss_st_tx_clk),      // AXI ST Bridge Clock Input
        .i_p3_app_ss_st_clk(p3_app_ss_st_rx_clk),             //
        .i_p3_clk_rx(o_p3_clk_pll),                    // QHIp Rx Clock Input
        .i_p3_clk_tx(o_p3_clk_pll),                    // QHIP Tx Clock Input
        .i_p3_rx_rst_n(i_p3_rx_rst_n),                  // QHIP Rx Reset, Active Low
        .i_p3_tx_rst_n(i_p3_tx_rst_n),                  // QHIP Tx Reset, Active Low
        .i_p3_app_ss_st_client_areset_n(p3_app_ss_st_tx_areset_n), // AXI ST Bridge Clock Input
        .i_p3_app_ss_st_areset_n(p3_app_ss_st_rx_areset_n),         //
        .o_p3_axi_st_bridge_rx_rst_n(p3_axi_st_bridge_rx_rst_n),    // AXI ST Rx Bridge Reset, Active low
        .o_p3_axi_st_bridge_tx_rst_n(p3_axi_st_bridge_tx_rst_n),    // AXI ST Tx Bridge Reset, Active low
        .o_p3_rx_rst_n(p3_rx_rst_n),                  // QHIP Rx Reset, Active Low
        .o_p3_rx_rst_ack_n(o_p3_rx_rst_ack_n),              // QHIP Rx Reset Ack, Active Low
        .o_p3_tx_rst_n(p3_tx_rst_n),                  // QHIP Tx Reset, Active Low
        .o_p3_tx_rst_ack_n(o_p3_tx_rst_ack_n),              // QHIP Tx Reset Ack, Active Low
        .o_p3_csr_rst_n(p3_csr_rst_n),                 // QHIP CSR Reset, Active Low
        .o_p3_ereset_n(o_p3_ereset_n),

        .i_p3_pio_axi_st_bridge_rst_n(p3_pio_axi_st_bridge_rst_n),   // PIO_0 from NIOS
        .i_p3_pio_ehip_tx_rst_n(p3_pio_ehip_tx_rst_n),         // PIO_1 from NIOS
        .i_p3_pio_ehip_rx_rst_n(p3_pio_ehip_rx_rst_n),         // PIO_2 from NIOS
        .i_p3_pio_ereset_n(p3_pio_ereset_n),              // PIO_3 from NIOS

        .o_p3_reconfig_rst(p3_reconfig_rst),                 // QHIP Reconfig Reset, Active High

//         .i_ncycles_to_ss_rst_ack(i_ncycles_to_ss_rst_ack),           // Minimum value is 1, Maximum 255
//         .i_ncycles_to_rx_rst_ack(i_ncycles_to_rx_rst_ack),           // Minimum value is 1, Maximum 255
//         .i_ncycles_to_tx_rst_ack(i_ncycles_to_tx_rst_ack),           // Minimum value is 1, Maximum 255
        
        .i_subsystem_cold_rst_n(subsystem_cold_rst_n),            // Subsystem cold reset input, Active Low
        .o_subsystem_cold_rst_ack_n(subsystem_cold_rst_ack_n),
        .i_app_ss_lite_clk(app_ss_lite_clk),                 // AXI Lite bridge Clock Input
        .i_app_ss_lite_areset_n(app_ss_lite_areset_n),            // AXI Lite bridge Reset Input
        .i_nios_clk(app_ss_lite_clk), //i_nios_clk),                        // NIOS Clock Input
        .o_axi_lite_bridge_rst_n(axi_lite_bridge_src_rst_n),           // AXI Lite bridge Reset, Active Low
        //.o_ss_csr_rst_n(ss_csr_rst_n),                    // Subsystem CSR Reset, Active low
        .o_nios_rst_n(nios_rst_n)                       // NIOS Reset, Active Low
        );


  hssi_ss_std_synchronizer_nocut out_sync_lite_rstn  (.clk (app_ss_lite_clk), .reset_n (1'b1), .din(axi_lite_bridge_src_rst_n && axi_lite_hung_rst_n), .dout (axi_lite_bridge_rst_n));

//*********************************************************************************
// -- CSR Address Decoder Instantiation
//*********************************************************************************

wire        sscsrif_hssi_cmd_sts_read_command;
wire        sscsrif_hssi_cmd_sts_write_command;
wire [1:0]  sscsrif_hssi_cmd_sts_xcvr_reg_byte_no;
wire [7:0]  sscsrif_hssi_ctrl_addr_sal_command;
wire [3:0]  sscsrif_hssi_ctrl_addr_port_addr;
wire [3:0]  sscsrif_hssi_ctrl_addr_channel_addr;
wire [15:0] sscsrif_hssi_ctrl_addr_addr_msb;
wire [31:0] sscsrif_hssi_rd_data_write_data_i;
wire [31:0] sscsrif_hssi_wr_data_write_data;
wire        sscsrif_hssi_tse_ctrl_Magic_sleep_n;
reg         sscsrif_hssi_cmd_sts_read_command_d1;
reg         sscsrif_hssi_cmd_sts_read_command_d2;
reg         sscsrif_hssi_cmd_sts_read_command_pos_edge;
reg         sscsrif_hssi_cmd_sts_write_command_d1;
reg         sscsrif_hssi_cmd_sts_write_command_d2;
reg         sscsrif_hssi_cmd_sts_write_command_pos_edge;
wire        nios_command_error;
reg         nios_command_complete_ack;
wire        sscsrif_hssi_cmd_sts_ack_trans;
reg         sscsrif_hssi_cmd_sts_busy_i;
reg         sscsrif_hssi_cmd_sts_error_i;
reg         sscsrif_hssi_cmd_sts_ack_trans_hwset;

wire        sscsrif_hssi_eth_port0_status_link_fault_gen_en_i;
wire        sscsrif_hssi_eth_port0_status_unidirectional_en_i;
wire        sscsrif_hssi_eth_port0_status_unidirectional_force_remote_fault_i;
wire        sscsrif_hssi_eth_port0_status_unidirectional_remote_fault_dis_i;
wire [1:0]  sscsrif_hssi_eth_port0_status_pcs_eccstatus_i;
wire [1:0]  sscsrif_hssi_eth_port0_status_mac_eccstatus_i;
wire        sscsrif_hssi_eth_port0_status_set_10_i;
wire        sscsrif_hssi_eth_port0_status_set_1000_i;
wire        sscsrif_hssi_eth_port0_status_ena_10_i;
wire        sscsrif_hssi_eth_port0_status_eth_mode_i;


localparam  MAJOR_VERSION = 16'h0001;
localparam  MINOR_VERSION = 8'h00;
//[31:16]
localparam [15:0] DFHv0_FEA_NXT_LO   = (DFHv0_FEA_NXT & 16'hFFFF);
//[39:32]
localparam [7:0] DFHv0_FEA_NXT_HI   = (DFHv0_FEA_NXT >> 16) & (8'hFF);
//localparam DFHv0_FEA_REV      = 4'h1;
//localparam DFHv0_FEA_FEAID    = 12'h015;
//localparam DFHv0_FEA_FEATYPE  = 4'h3;
//localparam DFHv0_FEA_EOL      = 1'b0;
//localparam DFHv0_FEA_MINOR    = 4'h0;
localparam CSR_ADDROFF        = 32'h58;
//localparam DFHv0_FEA_VER      = 8'h00;  //As per HAS, current version is V0.5 till it approves we have to keep version 0x0

  always @(posedge app_ss_lite_clk or negedge nios_rst_n)
  begin
    if(~nios_rst_n)
      ss_reconfig_wait_cntr <= 3'd0;
    else if(ss_reconfig_write | ss_reconfig_read)
      ss_reconfig_wait_cntr <= ss_reconfig_wait_cntr + 3'd1;
    else
      ss_reconfig_wait_cntr <= 3'd0;
  end

  always @(posedge app_ss_lite_clk or negedge nios_rst_n)
  begin
    if(~nios_rst_n)
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

 assign port_enable[0] = p0_port_params[0];
 assign port_enable[1] = p1_port_params[0];
 assign port_enable[2] = p2_port_params[0];
 assign port_enable[3] = p3_port_params[0];
 assign port_enable[4] = p4_port_params[0];
 assign port_enable[5] = p5_port_params[0];
 assign port_enable[6] = p6_port_params[0];
 assign port_enable[7] = p7_port_params[0];
 assign port_enable[8] = p8_port_params[0];
 assign port_enable[9] = p9_port_params[0];
 assign port_enable[10] = p10_port_params[0];
 assign port_enable[11] = p11_port_params[0];
 assign port_enable[12] = p12_port_params[0];
 assign port_enable[13] = p13_port_params[0];
 assign port_enable[14] = p14_port_params[0];
 assign port_enable[15] = p15_port_params[0];

generate
genvar i;
for(i=0; i<16; i=i+1)
begin: HOTPLUG_STATUS
  assign hotplug_status[7:0] = (hotplug_control[11:8] == i) ? hotplug_status_all[i][7:0] : 8'hzz;
end
endgenerate

wire [4-1 : 0] or_ed_ecc;

       assign or_ed_ecc[0] = w0_tx_fifo_eccstatus; 
       assign or_ed_ecc[1] = w1_tx_fifo_eccstatus; 
       assign or_ed_ecc[2] = w2_tx_fifo_eccstatus; 
       assign or_ed_ecc[3] = w3_tx_fifo_eccstatus; 
  hssi_ss_csr U_HSSI_SS_CSR
          (
          .clk(app_ss_lite_clk),
          .reset(~nios_rst_n),
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
          .sscsrif_hssi_ctrl_addr_channel_addr(sscsrif_hssi_ctrl_addr_channel_addr),
          .sscsrif_hssi_ctrl_addr_addr_msb(sscsrif_hssi_ctrl_addr_addr_msb),
          //inputs
          .sscsrif_hssi_cmd_sts_ack_trans_hwset(sscsrif_hssi_cmd_sts_ack_trans_hwset), 
          .sscsrif_hssi_cmd_sts_busy_i(sscsrif_hssi_cmd_sts_busy_i),
          .sscsrif_hssi_cmd_sts_error_i(sscsrif_hssi_cmd_sts_error_i),
          .sscsrif_hssi_rd_data_write_data_i(sscsrif_hssi_rd_data_write_data_i),
          //outputs
          .sscsrif_hssi_cmd_sts_ack_trans(sscsrif_hssi_cmd_sts_ack_trans), 
          .sscsrif_hssi_wr_data_write_data(sscsrif_hssi_wr_data_write_data),
          //EHIP Control Status
          .sscsrif_hssi_tse_ctrl_Magic_sleep_n(sscsrif_hssi_tse_ctrl_Magic_sleep_n),
          .sscsrif_version_min_ver_i(MINOR_VERSION),
          .sscsrif_version_maj_ver_i(MAJOR_VERSION),
          .sscsrif_feature_list_axi4_support_i(1'b1),
          .sscsrif_feature_list_hssi_num_ports_i(NUM_ENABLED_PORTS),
          .sscsrif_feature_list_physical_port_enable_i(port_enable),
          /////////////////
          .sscsrif_hssi_eth_port0_status_parity_error_hwset (w0_axi_st_tx_parity_error), 
          .sscsrif_hssi_eth_port1_status_parity_error_hwset (w1_axi_st_tx_parity_error), 
          .sscsrif_hssi_eth_port2_status_parity_error_hwset (w2_axi_st_tx_parity_error), 
          .sscsrif_hssi_eth_port3_status_parity_error_hwset (w3_axi_st_tx_parity_error), 
          .sscsrif_hssi_eth_port4_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port5_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port6_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port7_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port8_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port9_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port10_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port11_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port12_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port13_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port14_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_eth_port15_status_parity_error_hwset (1'b0), 
          .sscsrif_hssi_general_status_ecc_error_m20k_sal_nios_hwset(1'b0),
          .sscsrif_hssi_general_status_ecc_error_m20k_avst_hwset(|or_ed_ecc),
          .sscsrif_hssi_general_status_ecc_error_m20k_jtag_hwset(1'b0),
          /////////////////
          .sscsrif_port0_param_port_0_profile_i(p0_port_params[6:1]),
          .sscsrif_port0_param_port_0_subprofile_i(p0_port_params[16:12]),
          .sscsrif_port0_param_port_0_databus_width_i(p0_port_params[9:7]),
          .sscsrif_port0_param_port_0_lowspeed_eth_param_i(p0_port_params[11:10]),
          .sscsrif_port0_param_port_0_rsfec_enable_i(p0_port_params[17]),
          .sscsrif_port0_param_port_0_anlt_enable_i(p0_port_params[18]),
          .sscsrif_port0_param_port_0_ptp_enable_i(p0_port_params[19]),
          .sscsrif_port0_param_port_0_drinpr_presence_i(1'b0),
          .sscsrif_port1_param_port_1_profile_i(p1_port_params[6:1]),
          .sscsrif_port1_param_port_1_subprofile_i(p1_port_params[16:12]),
          .sscsrif_port1_param_port_1_databus_width_i(p1_port_params[9:7]),
          .sscsrif_port1_param_port_1_lowspeed_eth_param_i(p1_port_params[11:10]),
          .sscsrif_port1_param_port_1_rsfec_enable_i(p1_port_params[17]),
          .sscsrif_port1_param_port_1_anlt_enable_i(p1_port_params[18]),
          .sscsrif_port1_param_port_1_ptp_enable_i(p1_port_params[19]),
          .sscsrif_port1_param_port_1_drinpr_presence_i(1'b0),
          .sscsrif_port2_param_port_2_profile_i(p2_port_params[6:1]),
          .sscsrif_port2_param_port_2_subprofile_i(p2_port_params[16:12]),
          .sscsrif_port2_param_port_2_databus_width_i(p2_port_params[9:7]),
          .sscsrif_port2_param_port_2_lowspeed_eth_param_i(p2_port_params[11:10]),
          .sscsrif_port2_param_port_2_rsfec_enable_i(p2_port_params[17]),
          .sscsrif_port2_param_port_2_anlt_enable_i(p2_port_params[18]),
          .sscsrif_port2_param_port_2_ptp_enable_i(p2_port_params[19]),
          .sscsrif_port2_param_port_2_drinpr_presence_i(1'b0),
          .sscsrif_port3_param_port_3_profile_i(p3_port_params[6:1]),
          .sscsrif_port3_param_port_3_subprofile_i(p3_port_params[16:12]),
          .sscsrif_port3_param_port_3_databus_width_i(p3_port_params[9:7]),
          .sscsrif_port3_param_port_3_lowspeed_eth_param_i(p3_port_params[11:10]),
          .sscsrif_port3_param_port_3_rsfec_enable_i(p3_port_params[17]),
          .sscsrif_port3_param_port_3_anlt_enable_i(p3_port_params[18]),
          .sscsrif_port3_param_port_3_ptp_enable_i(p3_port_params[19]),
          .sscsrif_port3_param_port_3_drinpr_presence_i(1'b0),
          .sscsrif_port4_param_port_4_profile_i(p4_port_params[6:1]),
          .sscsrif_port4_param_port_4_subprofile_i(p4_port_params[16:12]),
          .sscsrif_port4_param_port_4_databus_width_i(p4_port_params[9:7]),
          .sscsrif_port4_param_port_4_lowspeed_eth_param_i(p4_port_params[11:10]),
          .sscsrif_port4_param_port_4_rsfec_enable_i(p4_port_params[17]),
          .sscsrif_port4_param_port_4_anlt_enable_i(p4_port_params[18]),
          .sscsrif_port4_param_port_4_ptp_enable_i(p4_port_params[19]),
          .sscsrif_port4_param_port_4_drinpr_presence_i(1'b0),
          .sscsrif_port5_param_port_5_profile_i(p5_port_params[6:1]),
          .sscsrif_port5_param_port_5_subprofile_i(p5_port_params[16:12]),
          .sscsrif_port5_param_port_5_databus_width_i(p5_port_params[9:7]),
          .sscsrif_port5_param_port_5_lowspeed_eth_param_i(p5_port_params[11:10]),
          .sscsrif_port5_param_port_5_rsfec_enable_i(p5_port_params[17]),
          .sscsrif_port5_param_port_5_anlt_enable_i(p5_port_params[18]),
          .sscsrif_port5_param_port_5_ptp_enable_i(p5_port_params[19]),
          .sscsrif_port5_param_port_5_drinpr_presence_i(1'b0),
          .sscsrif_port6_param_port_6_profile_i(p6_port_params[6:1]),
          .sscsrif_port6_param_port_6_subprofile_i(p6_port_params[16:12]),
          .sscsrif_port6_param_port_6_databus_width_i(p6_port_params[9:7]),
          .sscsrif_port6_param_port_6_lowspeed_eth_param_i(p6_port_params[11:10]),
          .sscsrif_port6_param_port_6_rsfec_enable_i(p6_port_params[17]),
          .sscsrif_port6_param_port_6_anlt_enable_i(p6_port_params[18]),
          .sscsrif_port6_param_port_6_ptp_enable_i(p6_port_params[19]),
          .sscsrif_port6_param_port_6_drinpr_presence_i(1'b0),
          .sscsrif_port7_param_port_7_profile_i(p7_port_params[6:1]),
          .sscsrif_port7_param_port_7_subprofile_i(p7_port_params[16:12]),
          .sscsrif_port7_param_port_7_databus_width_i(p7_port_params[9:7]),
          .sscsrif_port7_param_port_7_lowspeed_eth_param_i(p7_port_params[11:10]),
          .sscsrif_port7_param_port_7_rsfec_enable_i(p7_port_params[17]),
          .sscsrif_port7_param_port_7_anlt_enable_i(p7_port_params[18]),
          .sscsrif_port7_param_port_7_ptp_enable_i(p7_port_params[19]),
          .sscsrif_port7_param_port_7_drinpr_presence_i(1'b0),
          .sscsrif_port8_param_port_8_profile_i(p8_port_params[6:1]),
          .sscsrif_port8_param_port_8_subprofile_i(p8_port_params[16:12]),
          .sscsrif_port8_param_port_8_databus_width_i(p8_port_params[9:7]),
          .sscsrif_port8_param_port_8_lowspeed_eth_param_i(p8_port_params[11:10]),
          .sscsrif_port8_param_port_8_rsfec_enable_i(p8_port_params[17]),
          .sscsrif_port8_param_port_8_anlt_enable_i(p8_port_params[18]),
          .sscsrif_port8_param_port_8_ptp_enable_i(p8_port_params[19]),
          .sscsrif_port8_param_port_8_drinpr_presence_i(1'b0),
          .sscsrif_port9_param_port_9_profile_i(p9_port_params[6:1]),
          .sscsrif_port9_param_port_9_subprofile_i(p9_port_params[16:12]),
          .sscsrif_port9_param_port_9_databus_width_i(p9_port_params[9:7]),
          .sscsrif_port9_param_port_9_lowspeed_eth_param_i(p9_port_params[11:10]),
          .sscsrif_port9_param_port_9_rsfec_enable_i(p9_port_params[17]),
          .sscsrif_port9_param_port_9_anlt_enable_i(p9_port_params[18]),
          .sscsrif_port9_param_port_9_ptp_enable_i(p9_port_params[19]),
          .sscsrif_port9_param_port_9_drinpr_presence_i(1'b0),
          .sscsrif_port10_param_port_10_profile_i(p10_port_params[6:1]),
          .sscsrif_port10_param_port_10_subprofile_i(p10_port_params[16:12]),
          .sscsrif_port10_param_port_10_databus_width_i(p10_port_params[9:7]),
          .sscsrif_port10_param_port_10_lowspeed_eth_param_i(p10_port_params[11:10]),
          .sscsrif_port10_param_port_10_rsfec_enable_i(p10_port_params[17]),
          .sscsrif_port10_param_port_10_anlt_enable_i(p10_port_params[18]),
          .sscsrif_port10_param_port_10_ptp_enable_i(p10_port_params[19]),
          .sscsrif_port10_param_port_10_drinpr_presence_i(1'b0),
          .sscsrif_port11_param_port_11_profile_i(p11_port_params[6:1]),
          .sscsrif_port11_param_port_11_subprofile_i(p11_port_params[16:12]),
          .sscsrif_port11_param_port_11_databus_width_i(p11_port_params[9:7]),
          .sscsrif_port11_param_port_11_lowspeed_eth_param_i(p11_port_params[11:10]),
          .sscsrif_port11_param_port_11_rsfec_enable_i(p11_port_params[17]),
          .sscsrif_port11_param_port_11_anlt_enable_i(p11_port_params[18]),
          .sscsrif_port11_param_port_11_ptp_enable_i(p11_port_params[19]),
          .sscsrif_port11_param_port_11_drinpr_presence_i(1'b0),
          .sscsrif_port12_param_port_12_profile_i(p12_port_params[6:1]),
          .sscsrif_port12_param_port_12_subprofile_i(p12_port_params[16:12]),
          .sscsrif_port12_param_port_12_databus_width_i(p12_port_params[9:7]),
          .sscsrif_port12_param_port_12_lowspeed_eth_param_i(p12_port_params[11:10]),
          .sscsrif_port12_param_port_12_rsfec_enable_i(p12_port_params[17]),
          .sscsrif_port12_param_port_12_anlt_enable_i(p12_port_params[18]),
          .sscsrif_port12_param_port_12_ptp_enable_i(p12_port_params[19]),
          .sscsrif_port12_param_port_12_drinpr_presence_i(1'b0),
          .sscsrif_port13_param_port_13_profile_i(p13_port_params[6:1]),
          .sscsrif_port13_param_port_13_subprofile_i(p13_port_params[16:12]),
          .sscsrif_port13_param_port_13_databus_width_i(p13_port_params[9:7]),
          .sscsrif_port13_param_port_13_lowspeed_eth_param_i(p13_port_params[11:10]),
          .sscsrif_port13_param_port_13_rsfec_enable_i(p13_port_params[17]),
          .sscsrif_port13_param_port_13_anlt_enable_i(p13_port_params[18]),
          .sscsrif_port13_param_port_13_ptp_enable_i(p13_port_params[19]),
          .sscsrif_port13_param_port_13_drinpr_presence_i(1'b0),
          .sscsrif_port14_param_port_14_profile_i(p14_port_params[6:1]),
          .sscsrif_port14_param_port_14_subprofile_i(p14_port_params[16:12]),
          .sscsrif_port14_param_port_14_databus_width_i(p14_port_params[9:7]),
          .sscsrif_port14_param_port_14_lowspeed_eth_param_i(p14_port_params[11:10]),
          .sscsrif_port14_param_port_14_rsfec_enable_i(p14_port_params[17]),
          .sscsrif_port14_param_port_14_anlt_enable_i(p14_port_params[18]),
          .sscsrif_port14_param_port_14_ptp_enable_i(p14_port_params[19]),
          .sscsrif_port14_param_port_14_drinpr_presence_i(1'b0),
          .sscsrif_port15_param_port_15_profile_i(p15_port_params[6:1]),
          .sscsrif_port15_param_port_15_subprofile_i(p15_port_params[16:12]),
          .sscsrif_port15_param_port_15_databus_width_i(p15_port_params[9:7]),
          .sscsrif_port15_param_port_15_lowspeed_eth_param_i(p15_port_params[11:10]),
          .sscsrif_port15_param_port_15_rsfec_enable_i(p15_port_params[17]),
          .sscsrif_port15_param_port_15_anlt_enable_i(p15_port_params[18]),
          .sscsrif_port15_param_port_15_ptp_enable_i(p15_port_params[19]),
          .sscsrif_port15_param_port_15_drinpr_presence_i(1'b0),
          //
          .sscsrif_port0_param_port_0_ready_latency_i(PORT0_READY_LATENCY)  ,
          .sscsrif_hssi_eth_port0_status_o_ehip_ready_i(p0_ehip_ready),
          .sscsrif_hssi_eth_port0_status_o_rx_hi_ber_i(p0_rx_hi_ber),
          .sscsrif_hssi_eth_port0_status_o_cdr_lock_i(p0_cdr_lock),
          .sscsrif_hssi_eth_port0_status_rx_am_lock_i(p0_rx_am_lock),
          .sscsrif_hssi_eth_port0_status_rx_block_lock_i(p0_rx_block_lock),
          .sscsrif_hssi_eth_port0_status_rx_pcs_ready_i(p0_link_status[2]),
          .sscsrif_hssi_eth_port0_status_tx_lanes_stable_i(p0_link_status[1]),
          .sscsrif_hssi_eth_port0_status_tx_pll_locked_i(p0_link_status[0]),
          .sscsrif_hssi_eth_port0_status_o_ehip0_tx_pll_locked_i(ehip0_ptp_aib_tx_pll_locked[0]),
          .sscsrif_hssi_eth_port0_status_o_ehip1_tx_pll_locked_i(ehip0_ptp_aib_tx_pll_locked[1]),
          .sscsrif_hssi_eth_port0_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port0_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port0_status_local_fault_status_hwset(p0_local_fault_status),
          .sscsrif_hssi_eth_port0_status_remote_fault_status_hwset(p0_remote_fault_status),
          .sscsrif_hssi_eth_port0_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port0_status_unidirectional_remote_fault_dis_i(1'b0),
          .sscsrif_hssi_eth_port0_status_local_fault_status_direct_i(p0_local_fault_status),
          .sscsrif_hssi_eth_port0_status_remote_fault_status_direct_i(p0_remote_fault_status),
          //
          .sscsrif_hssi_eth_port0_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port0_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port0_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port0_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port0_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port0_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port0_status_load_recipe_err_i(load_recipe_error[0]),
          .sscsrif_hssi_eth_port0_status_cal_err_i(xcvr_cal_error[0]),
          .sscsrif_port1_param_port_1_ready_latency_i(PORT0_READY_LATENCY)  ,
          .sscsrif_hssi_eth_port1_status_o_ehip_ready_i(p1_ehip_ready),
          .sscsrif_hssi_eth_port1_status_o_rx_hi_ber_i(p1_rx_hi_ber),
          .sscsrif_hssi_eth_port1_status_o_cdr_lock_i(p1_cdr_lock),
          .sscsrif_hssi_eth_port1_status_rx_am_lock_i(p1_rx_am_lock),
          .sscsrif_hssi_eth_port1_status_rx_block_lock_i(p1_rx_block_lock),
          .sscsrif_hssi_eth_port1_status_rx_pcs_ready_i(p1_link_status[2]),
          .sscsrif_hssi_eth_port1_status_tx_lanes_stable_i(p1_link_status[1]),
          .sscsrif_hssi_eth_port1_status_tx_pll_locked_i(p1_link_status[0]),
          .sscsrif_hssi_eth_port1_status_o_ehip0_tx_pll_locked_i(ehip0_ptp_aib_tx_pll_locked[0]),
          .sscsrif_hssi_eth_port1_status_o_ehip1_tx_pll_locked_i(ehip0_ptp_aib_tx_pll_locked[1]),
          .sscsrif_hssi_eth_port1_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port1_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port1_status_local_fault_status_hwset(p1_local_fault_status),
          .sscsrif_hssi_eth_port1_status_remote_fault_status_hwset(p1_remote_fault_status),
          .sscsrif_hssi_eth_port1_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port1_status_unidirectional_remote_fault_dis_i(1'b0),
          .sscsrif_hssi_eth_port1_status_local_fault_status_direct_i(p1_local_fault_status),
          .sscsrif_hssi_eth_port1_status_remote_fault_status_direct_i(p1_remote_fault_status),
          //
          .sscsrif_hssi_eth_port1_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port1_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port1_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port1_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port1_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port1_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port1_status_load_recipe_err_i(load_recipe_error[1]),
          .sscsrif_hssi_eth_port1_status_cal_err_i(xcvr_cal_error[1]),
          .sscsrif_port2_param_port_2_ready_latency_i(PORT0_READY_LATENCY)  ,
          .sscsrif_hssi_eth_port2_status_o_ehip_ready_i(p2_ehip_ready),
          .sscsrif_hssi_eth_port2_status_o_rx_hi_ber_i(p2_rx_hi_ber),
          .sscsrif_hssi_eth_port2_status_o_cdr_lock_i(p2_cdr_lock),
          .sscsrif_hssi_eth_port2_status_rx_am_lock_i(p2_rx_am_lock),
          .sscsrif_hssi_eth_port2_status_rx_block_lock_i(p2_rx_block_lock),
          .sscsrif_hssi_eth_port2_status_rx_pcs_ready_i(p2_link_status[2]),
          .sscsrif_hssi_eth_port2_status_tx_lanes_stable_i(p2_link_status[1]),
          .sscsrif_hssi_eth_port2_status_tx_pll_locked_i(p2_link_status[0]),
          .sscsrif_hssi_eth_port2_status_o_ehip0_tx_pll_locked_i(ehip0_ptp_aib_tx_pll_locked[0]),
          .sscsrif_hssi_eth_port2_status_o_ehip1_tx_pll_locked_i(ehip0_ptp_aib_tx_pll_locked[1]),
          .sscsrif_hssi_eth_port2_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port2_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port2_status_local_fault_status_hwset(p2_local_fault_status),
          .sscsrif_hssi_eth_port2_status_remote_fault_status_hwset(p2_remote_fault_status),
          .sscsrif_hssi_eth_port2_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port2_status_unidirectional_remote_fault_dis_i(1'b0),
          .sscsrif_hssi_eth_port2_status_local_fault_status_direct_i(p2_local_fault_status),
          .sscsrif_hssi_eth_port2_status_remote_fault_status_direct_i(p2_remote_fault_status),
          //
          .sscsrif_hssi_eth_port2_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port2_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port2_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port2_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port2_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port2_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port2_status_load_recipe_err_i(load_recipe_error[2]),
          .sscsrif_hssi_eth_port2_status_cal_err_i(xcvr_cal_error[2]),
          .sscsrif_port3_param_port_3_ready_latency_i(PORT0_READY_LATENCY)  ,
          .sscsrif_hssi_eth_port3_status_o_ehip_ready_i(p3_ehip_ready),
          .sscsrif_hssi_eth_port3_status_o_rx_hi_ber_i(p3_rx_hi_ber),
          .sscsrif_hssi_eth_port3_status_o_cdr_lock_i(p3_cdr_lock),
          .sscsrif_hssi_eth_port3_status_rx_am_lock_i(p3_rx_am_lock),
          .sscsrif_hssi_eth_port3_status_rx_block_lock_i(p3_rx_block_lock),
          .sscsrif_hssi_eth_port3_status_rx_pcs_ready_i(p3_link_status[2]),
          .sscsrif_hssi_eth_port3_status_tx_lanes_stable_i(p3_link_status[1]),
          .sscsrif_hssi_eth_port3_status_tx_pll_locked_i(p3_link_status[0]),
          .sscsrif_hssi_eth_port3_status_o_ehip0_tx_pll_locked_i(ehip0_ptp_aib_tx_pll_locked[0]),
          .sscsrif_hssi_eth_port3_status_o_ehip1_tx_pll_locked_i(ehip0_ptp_aib_tx_pll_locked[1]),
          .sscsrif_hssi_eth_port3_status_link_fault_gen_en_i(1'b0),
          .sscsrif_hssi_eth_port3_status_unidirectional_en_i(1'b0),
          .sscsrif_hssi_eth_port3_status_local_fault_status_hwset(p3_local_fault_status),
          .sscsrif_hssi_eth_port3_status_remote_fault_status_hwset(p3_remote_fault_status),
          .sscsrif_hssi_eth_port3_status_unidirectional_force_remote_fault_i(1'b0),
          .sscsrif_hssi_eth_port3_status_unidirectional_remote_fault_dis_i(1'b0),
          .sscsrif_hssi_eth_port3_status_local_fault_status_direct_i(p3_local_fault_status),
          .sscsrif_hssi_eth_port3_status_remote_fault_status_direct_i(p3_remote_fault_status),
          //
          .sscsrif_hssi_eth_port3_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port3_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port3_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port3_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port3_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port3_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port3_status_load_recipe_err_i(load_recipe_error[3]),
          .sscsrif_hssi_eth_port3_status_cal_err_i(xcvr_cal_error[3]),
          .sscsrif_port4_param_port_4_ready_latency_i(PORT4_READY_LATENCY)  ,
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
          .sscsrif_hssi_eth_port4_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port4_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port4_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port4_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port4_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port4_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port4_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port4_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port4_status_load_recipe_err_i(load_recipe_error[4]),
          .sscsrif_hssi_eth_port4_status_cal_err_i(xcvr_cal_error[4]),
          .sscsrif_port5_param_port_5_ready_latency_i(PORT5_READY_LATENCY)  ,
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
          .sscsrif_hssi_eth_port5_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port5_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port5_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port5_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port5_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port5_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port5_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port5_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port5_status_load_recipe_err_i(load_recipe_error[5]),
          .sscsrif_hssi_eth_port5_status_cal_err_i(xcvr_cal_error[5]),
          .sscsrif_port6_param_port_6_ready_latency_i(PORT6_READY_LATENCY)  ,
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
          .sscsrif_hssi_eth_port6_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port6_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port6_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port6_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port6_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port6_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port6_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port6_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port6_status_load_recipe_err_i(load_recipe_error[6]),
          .sscsrif_hssi_eth_port6_status_cal_err_i(xcvr_cal_error[6]),
          .sscsrif_port7_param_port_7_ready_latency_i(PORT7_READY_LATENCY)  ,
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
          .sscsrif_hssi_eth_port7_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port7_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port7_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port7_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port7_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port7_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port7_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port7_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port7_status_load_recipe_err_i(load_recipe_error[7]),
          .sscsrif_hssi_eth_port7_status_cal_err_i(xcvr_cal_error[7]),
          .sscsrif_port8_param_port_8_ready_latency_i(PORT8_READY_LATENCY)  ,
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
          .sscsrif_hssi_eth_port8_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port8_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port8_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port8_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port8_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port8_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port8_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port8_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port8_status_load_recipe_err_i(load_recipe_error[8]),
          .sscsrif_hssi_eth_port8_status_cal_err_i(xcvr_cal_error[8]),
          .sscsrif_port9_param_port_9_ready_latency_i(PORT9_READY_LATENCY)  ,
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
          .sscsrif_hssi_eth_port9_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port9_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port9_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port9_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port9_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port9_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port9_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port9_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port9_status_load_recipe_err_i(load_recipe_error[9]),
          .sscsrif_hssi_eth_port9_status_cal_err_i(xcvr_cal_error[9]),
          .sscsrif_port10_param_port_10_ready_latency_i(PORT10_READY_LATENCY)  ,
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
          .sscsrif_hssi_eth_port10_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port10_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port10_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port10_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port10_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port10_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port10_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port10_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port10_status_load_recipe_err_i(load_recipe_error[10]),
          .sscsrif_hssi_eth_port10_status_cal_err_i(xcvr_cal_error[10]),
          .sscsrif_port11_param_port_11_ready_latency_i(PORT11_READY_LATENCY)  ,
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
          .sscsrif_hssi_eth_port11_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port11_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port11_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port11_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port11_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port11_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port11_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port11_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port11_status_load_recipe_err_i(load_recipe_error[11]),
          .sscsrif_hssi_eth_port11_status_cal_err_i(xcvr_cal_error[11]),
          .sscsrif_port12_param_port_12_ready_latency_i(PORT12_READY_LATENCY)  ,
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
          .sscsrif_hssi_eth_port12_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port12_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port12_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port12_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port12_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port12_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port12_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port12_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port12_status_load_recipe_err_i(load_recipe_error[12]),
          .sscsrif_hssi_eth_port12_status_cal_err_i(xcvr_cal_error[12]),
          .sscsrif_port13_param_port_13_ready_latency_i(PORT13_READY_LATENCY)  ,
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
          .sscsrif_hssi_eth_port13_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port13_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port13_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port13_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port13_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port13_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port13_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port13_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port13_status_load_recipe_err_i(load_recipe_error[13]),
          .sscsrif_hssi_eth_port13_status_cal_err_i(xcvr_cal_error[13]),
          .sscsrif_port14_param_port_14_ready_latency_i(PORT14_READY_LATENCY)  ,
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
          .sscsrif_hssi_eth_port14_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port14_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port14_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port14_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port14_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port14_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port14_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port14_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port14_status_load_recipe_err_i(load_recipe_error[14]),
          .sscsrif_hssi_eth_port14_status_cal_err_i(xcvr_cal_error[14]),
          .sscsrif_port15_param_port_15_ready_latency_i(PORT15_READY_LATENCY)  ,
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
          .sscsrif_hssi_eth_port15_status_local_fault_status_direct_i(1'b0),
          .sscsrif_hssi_eth_port15_status_remote_fault_status_direct_i(1'b0),
          //
          .sscsrif_hssi_eth_port15_status_pcs_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port15_status_mac_eccstatus_i(2'd0),
          .sscsrif_hssi_eth_port15_status_set_10_i(1'b0),
          .sscsrif_hssi_eth_port15_status_set_1000_i(1'b0),
          .sscsrif_hssi_eth_port15_status_ena_10_i(1'b0),
          .sscsrif_hssi_eth_port15_status_eth_mode_i(1'b0),
          .sscsrif_hssi_eth_port15_status_load_recipe_err_i(load_recipe_error[15]),
          .sscsrif_hssi_eth_port15_status_cal_err_i(xcvr_cal_error[15]),
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
          .sscsrif_csr_size_grp_h_csr_size_i(32'h44),
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
          .sscsrif_hssi_hotplug_debug_ctrl_hotplug_control(hotplug_control),
          .sscsrif_hssi_hotplug_debug_sts_hotplug_status_i(hotplug_status),
          //
          .sscsrif_hssi_debug_ctrl_override_led_speed(csr_led_speed),
          .sscsrif_hssi_debug_ctrl_override_led_status(csr_led_status),
          .sscsrif_hssi_debug_ctrl_port_led_status_override(csr_led_override_port[3:0]),
          .sscsrif_hssi_debug_ctrl_led_status_override_enable(csr_led_override_en),
          .sscsrif_hssi_debug_ctrl_led_status_blinking_timer( csr_led_pulse_cntr)
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

  always @(posedge app_ss_lite_clk or negedge nios_rst_n)
  begin
    if(~nios_rst_n)
      sscsrif_hssi_cmd_sts_ack_trans_hwset <= 1'b0; //nios cpu sets to 1 after cpu intialiation
    else if(nios_command_start)
      sscsrif_hssi_cmd_sts_ack_trans_hwset <= 1'b0;
    else if(nios_command_complete_d1 && ~nios_command_complete_d2)
      sscsrif_hssi_cmd_sts_ack_trans_hwset <= 1'b1;
  end

  always @(posedge app_ss_lite_clk or negedge nios_rst_n)
  begin
    if(~nios_rst_n)
      sscsrif_hssi_cmd_sts_busy_i <= 1'b1;
    else if(nios_command_start)
      sscsrif_hssi_cmd_sts_busy_i <= 1'b1;
    else if(nios_command_complete_d1 && ~nios_command_complete_d2)
      sscsrif_hssi_cmd_sts_busy_i <= 1'b0;
    //else if(nios_cntr == )
    //  sscsrif_hssi_cmd_sts_busy_i <= 1'b0;
  end

  always @(posedge app_ss_lite_clk or negedge nios_rst_n)
  begin
    if(~nios_rst_n)
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

  always @(posedge app_ss_lite_clk or negedge nios_rst_n)
  begin
    if(~nios_rst_n)
      nios_command_complete_ack <= 1'b0;
    else if(~nios_command_complete_d1 && nios_command_complete_d2)
      nios_command_complete_ack <= 1'b0;
    else if(nios_command_complete_d1 && ~nios_command_complete_d2)
      nios_command_complete_ack <= 1'b1;
  end

  hssi_ss_dr #(.DISABLE_DR_CPU(DISABLE_DR_CPU), .SIM_MODE(SIM_MODE_EN)) U_HSSI_SS_CPU
          (
          .i_reconfig_clk(app_ss_lite_clk),
          .i_csr_rst_in(~nios_rst_n),
          .i_ss_rst_done(subsystem_cold_rst_ack_n),
          //
          .i_cpu_cmd_type({nios_command_complete_ack, sscsrif_hssi_cmd_sts_ack_trans, sscsrif_hssi_cmd_sts_write_command, sscsrif_hssi_cmd_sts_read_command}),
          .i_xcvr_reg_byte_no(sscsrif_hssi_cmd_sts_xcvr_reg_byte_no),
          .i_cpu_cmd_start(nios_command_start),
          .i_cpu_command({sscsrif_hssi_ctrl_addr_addr_msb, sscsrif_hssi_ctrl_addr_channel_addr, sscsrif_hssi_ctrl_addr_port_addr, sscsrif_hssi_ctrl_addr_sal_command}),
          .i_cpu_wr_data(sscsrif_hssi_wr_data_write_data),
          .o_cpu_cmd_complete(nios_command_complete),
          .o_cpu_cmd_error(nios_command_error),
          .o_cpu_rd_data(sscsrif_hssi_rd_data_write_data_i),
          //
          .o_cpu_p0_port_params(p0_port_params),
          .o_cpu_p0_port_profile(p0_curr_profile),
          .o_cpu_p1_port_params(p1_port_params),
          .o_cpu_p1_port_profile(p1_curr_profile),
          .o_cpu_p2_port_params(p2_port_params),
          .o_cpu_p2_port_profile(p2_curr_profile),
          .o_cpu_p3_port_params(p3_port_params),
          .o_cpu_p3_port_profile(p3_curr_profile),
          .o_cpu_p4_port_params(p4_port_params),
          .o_cpu_p5_port_params(p5_port_params),
          .o_cpu_p6_port_params(p6_port_params),
          .o_cpu_p7_port_params(p7_port_params),
          .o_cpu_p8_port_params(p8_port_params),
          .o_cpu_p9_port_params(p9_port_params),
          .o_cpu_p10_port_params(p10_port_params),
          .o_cpu_p11_port_params(p11_port_params),
          .o_cpu_p12_port_params(p12_port_params),
          .o_cpu_p13_port_params(p13_port_params),
          .o_cpu_p14_port_params(p14_port_params),
          .o_cpu_p15_port_params(p15_port_params),

        .o_p0_pio_axi_st_bridge_rst_n(p0_pio_axi_st_bridge_rst_n),   // PIO_0 from NIOS
        .o_p0_pio_ehip_tx_rst_n(p0_pio_ehip_tx_rst_n),         // PIO_1 from NIOS
        .o_p0_pio_ehip_rx_rst_n(p0_pio_ehip_rx_rst_n),         // PIO_2 from NIOS
        .o_p0_pio_ereset_n(p0_pio_ereset_n),              // PIO_3 from NIOS
        .o_p1_pio_axi_st_bridge_rst_n(p1_pio_axi_st_bridge_rst_n),   // PIO_0 from NIOS
        .o_p1_pio_ehip_tx_rst_n(p1_pio_ehip_tx_rst_n),         // PIO_1 from NIOS
        .o_p1_pio_ehip_rx_rst_n(p1_pio_ehip_rx_rst_n),         // PIO_2 from NIOS
        .o_p1_pio_ereset_n(p1_pio_ereset_n),              // PIO_3 from NIOS
        .o_p2_pio_axi_st_bridge_rst_n(p2_pio_axi_st_bridge_rst_n),   // PIO_0 from NIOS
        .o_p2_pio_ehip_tx_rst_n(p2_pio_ehip_tx_rst_n),         // PIO_1 from NIOS
        .o_p2_pio_ehip_rx_rst_n(p2_pio_ehip_rx_rst_n),         // PIO_2 from NIOS
        .o_p2_pio_ereset_n(p2_pio_ereset_n),              // PIO_3 from NIOS
        .o_p3_pio_axi_st_bridge_rst_n(p3_pio_axi_st_bridge_rst_n),   // PIO_0 from NIOS
        .o_p3_pio_ehip_tx_rst_n(p3_pio_ehip_tx_rst_n),         // PIO_1 from NIOS
        .o_p3_pio_ehip_rx_rst_n(p3_pio_ehip_rx_rst_n),         // PIO_2 from NIOS
        .o_p3_pio_ereset_n(p3_pio_ereset_n),              // PIO_3 from NIOS

          .i_xcvr_ready(xcvr_ready),
          .i_tx_pma_ready(tx_pma_ready),
          .i_rx_pma_ready(rx_pma_ready),
          .o_load_recipe_error(load_recipe_error),
          .o_xcvr_cal_error(xcvr_cal_error),
          .o_hotplug_disable_fm(hotplug_disable_fm),
          .o_hotplug_lpbk_en_fm(hotplug_lpbk_en_fm),
          .i_hotplug_paused_fm(hotplug_paused_fm),
          //
          .o_cpu_reconfig_addr(cpu_reconfig_addr),
          .o_cpu_reconfig_read(cpu_reconfig_read),
          .o_cpu_reconfig_write(cpu_reconfig_write),
          .o_cpu_reconfig_writedata(cpu_reconfig_writedata),
          .o_cpu_reconfig_byteenable(cpu_reconfig_byteenable),
          .i_cpu_reconfig_readdata(cpu_reconfig_readdata_nios),
          .i_cpu_reconfig_readdata_valid(cpu_reconfig_readdata_valid | nios_cpu_hung_readdata_valid),
          .i_cpu_reconfig_waitrequest(cpu_reconfig_waitrequest && nios_cpu_hung_waitrequest)
          );

  always @(posedge app_ss_lite_clk or negedge nios_rst_n)
  begin
    if(~nios_rst_n)
      po_pma_cal_done <= 1'b0;
    else if(nios_command_complete_d2 || (SIM_MODE_EN == 1)) //TBD
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

  assign cpu_reconfig_addr = 'd0;
  assign cpu_reconfig_read = 'd0;
  assign cpu_reconfig_write = 'd0;
  assign cpu_reconfig_writedata = 'd0;
  assign cpu_reconfig_byteenable = 'd0;
  assign sscsrif_hssi_rd_data_write_data_i = 'd0;

end
endgenerate
////////     LED STATUS   ///////
	localparam PULSE_10MSEC_CNT = SIM_MODE_EN ? 32'd125 : 32'd1250000;
	always@(posedge app_ss_lite_clk or negedge nios_rst_n)
	begin
		if(~nios_rst_n)
			pulse_10msec_cntr <= 32'd0;	
		else if(pulse_10msec_cntr >= (PULSE_10MSEC_CNT-1'd1))
			pulse_10msec_cntr <= 32'd0;	
		else
			pulse_10msec_cntr <= pulse_10msec_cntr + 32'd1;
	end

  always@(posedge app_ss_lite_clk or negedge nios_rst_n)
  begin
    if(~nios_rst_n)
    begin
      led_pulse_cntr <= 8'd0;
      led_pulse      <= 1'b0;
    end
    else if(pulse_10msec_cntr == (PULSE_10MSEC_CNT-1'd1))
    begin
      if(led_pulse_cntr >= csr_led_pulse_cntr[7:0])
      begin
        led_pulse_cntr <= 8'd0;
        led_pulse 		 <= 1'b1;
      end
      else
      begin	
      led_pulse_cntr <= led_pulse_cntr + 8'd1;
      led_pulse 		 <= 1'b0;
    end
  end
  else
    led_pulse      <= 1'b0;
  end

  always @(posedge app_ss_lite_clk or negedge nios_rst_n)
  begin
    if(~nios_rst_n)
      led_pulse_reg <= 13'd0;
    else
      led_pulse_reg <= {led_pulse_reg[11:0], led_pulse};
  end

  assign led_pulse_ext = |(led_pulse_reg);


  
	hssi_ss_led_status  hssi_ss_led_p0 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 0) ? csr_led_override_en : 1'b0),
	.port_params(p0_port_params),
          .cdr_lock(p0_cdr_lock),
  	      .tx_lanes_stable(p0_tx_lanes_stable),
  	      .rx_pcs_ready(p0_rx_pcs_ready),	
  .tx_clk(o_p0_clk_pll),
  .rx_clk(o_p0_clk_pll),
	.tx_tvalid(p0_app_ss_st_tx_tvalid && p0_ss_app_st_tx_tready),
	.rx_tvalid(p0_ss_app_st_rx_tvalid),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port0_led_status),
	.led_speed(port0_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p1 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 1) ? csr_led_override_en : 1'b0),
	.port_params(p1_port_params),
          .cdr_lock(p1_cdr_lock),
  	      .tx_lanes_stable(p1_tx_lanes_stable),
  	      .rx_pcs_ready(p1_rx_pcs_ready),	
  .tx_clk(o_p1_clk_pll),
  .rx_clk(o_p1_clk_pll),
	.tx_tvalid(p1_app_ss_st_tx_tvalid && p1_ss_app_st_tx_tready),
	.rx_tvalid(p1_ss_app_st_rx_tvalid),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port1_led_status),
	.led_speed(port1_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p2 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 2) ? csr_led_override_en : 1'b0),
	.port_params(p2_port_params),
          .cdr_lock(p2_cdr_lock),
  	      .tx_lanes_stable(p2_tx_lanes_stable),
  	      .rx_pcs_ready(p2_rx_pcs_ready),	
  .tx_clk(o_p2_clk_pll),
  .rx_clk(o_p2_clk_pll),
	.tx_tvalid(p2_app_ss_st_tx_tvalid && p2_ss_app_st_tx_tready),
	.rx_tvalid(p2_ss_app_st_rx_tvalid),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port2_led_status),
	.led_speed(port2_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p3 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 3) ? csr_led_override_en : 1'b0),
	.port_params(p3_port_params),
          .cdr_lock(p3_cdr_lock),
  	      .tx_lanes_stable(p3_tx_lanes_stable),
  	      .rx_pcs_ready(p3_rx_pcs_ready),	
  .tx_clk(o_p3_clk_pll),
  .rx_clk(o_p3_clk_pll),
	.tx_tvalid(p3_app_ss_st_tx_tvalid && p3_ss_app_st_tx_tready),
	.rx_tvalid(p3_ss_app_st_rx_tvalid),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port3_led_status),
	.led_speed(port3_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p4 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 4) ? csr_led_override_en : 1'b0),
	.port_params(p4_port_params),
	.cdr_lock(1'b0),
  .tx_lanes_stable(1'b0),
  .rx_pcs_ready(1'b0),
	.tx_clk(app_ss_lite_clk),
	.rx_clk(app_ss_lite_clk),
	.tx_tvalid(1'b0),
	.rx_tvalid(1'b0),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port4_led_status),
	.led_speed(port4_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p5 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 5) ? csr_led_override_en : 1'b0),
	.port_params(p5_port_params),
	.cdr_lock(1'b0),
  .tx_lanes_stable(1'b0),
  .rx_pcs_ready(1'b0),
	.tx_clk(app_ss_lite_clk),
	.rx_clk(app_ss_lite_clk),
	.tx_tvalid(1'b0),
	.rx_tvalid(1'b0),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port5_led_status),
	.led_speed(port5_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p6 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 6) ? csr_led_override_en : 1'b0),
	.port_params(p6_port_params),
	.cdr_lock(1'b0),
  .tx_lanes_stable(1'b0),
  .rx_pcs_ready(1'b0),
	.tx_clk(app_ss_lite_clk),
	.rx_clk(app_ss_lite_clk),
	.tx_tvalid(1'b0),
	.rx_tvalid(1'b0),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port6_led_status),
	.led_speed(port6_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p7 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 7) ? csr_led_override_en : 1'b0),
	.port_params(p7_port_params),
	.cdr_lock(1'b0),
  .tx_lanes_stable(1'b0),
  .rx_pcs_ready(1'b0),
	.tx_clk(app_ss_lite_clk),
	.rx_clk(app_ss_lite_clk),
	.tx_tvalid(1'b0),
	.rx_tvalid(1'b0),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port7_led_status),
	.led_speed(port7_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p8 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 8) ? csr_led_override_en : 1'b0),
	.port_params(p8_port_params),
	.cdr_lock(1'b0),
  .tx_lanes_stable(1'b0),
  .rx_pcs_ready(1'b0),
	.tx_clk(app_ss_lite_clk),
	.rx_clk(app_ss_lite_clk),
	.tx_tvalid(1'b0),
	.rx_tvalid(1'b0),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port8_led_status),
	.led_speed(port8_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p9 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 9) ? csr_led_override_en : 1'b0),
	.port_params(p9_port_params),
	.cdr_lock(1'b0),
  .tx_lanes_stable(1'b0),
  .rx_pcs_ready(1'b0),
	.tx_clk(app_ss_lite_clk),
	.rx_clk(app_ss_lite_clk),
	.tx_tvalid(1'b0),
	.rx_tvalid(1'b0),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port9_led_status),
	.led_speed(port9_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p10 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 10) ? csr_led_override_en : 1'b0),
	.port_params(p10_port_params),
	.cdr_lock(1'b0),
  .tx_lanes_stable(1'b0),
  .rx_pcs_ready(1'b0),
	.tx_clk(app_ss_lite_clk),
	.rx_clk(app_ss_lite_clk),
	.tx_tvalid(1'b0),
	.rx_tvalid(1'b0),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port10_led_status),
	.led_speed(port10_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p11 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 11) ? csr_led_override_en : 1'b0),
	.port_params(p11_port_params),
	.cdr_lock(1'b0),
  .tx_lanes_stable(1'b0),
  .rx_pcs_ready(1'b0),
	.tx_clk(app_ss_lite_clk),
	.rx_clk(app_ss_lite_clk),
	.tx_tvalid(1'b0),
	.rx_tvalid(1'b0),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port11_led_status),
	.led_speed(port11_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p12 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 12) ? csr_led_override_en : 1'b0),
	.port_params(p12_port_params),
	.cdr_lock(1'b0),
  .tx_lanes_stable(1'b0),
  .rx_pcs_ready(1'b0),
	.tx_clk(app_ss_lite_clk),
	.rx_clk(app_ss_lite_clk),
	.tx_tvalid(1'b0),
	.rx_tvalid(1'b0),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port12_led_status),
	.led_speed(port12_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p13 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 13) ? csr_led_override_en : 1'b0),
	.port_params(p13_port_params),
	.cdr_lock(1'b0),
  .tx_lanes_stable(1'b0),
  .rx_pcs_ready(1'b0),
	.tx_clk(app_ss_lite_clk),
	.rx_clk(app_ss_lite_clk),
	.tx_tvalid(1'b0),
	.rx_tvalid(1'b0),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port13_led_status),
	.led_speed(port13_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p14 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 14) ? csr_led_override_en : 1'b0),
	.port_params(p14_port_params),
	.cdr_lock(1'b0),
  .tx_lanes_stable(1'b0),
  .rx_pcs_ready(1'b0),
	.tx_clk(app_ss_lite_clk),
	.rx_clk(app_ss_lite_clk),
	.tx_tvalid(1'b0),
	.rx_tvalid(1'b0),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port14_led_status),
	.led_speed(port14_led_speed)
	);

  
	hssi_ss_led_status  hssi_ss_led_p15 
		(
	.reconfig_clk(app_ss_lite_clk),
	.csr_rst_n(nios_rst_n),
    	.pulse_10msec(led_pulse_ext),
    	.led_override_en((csr_led_override_port == 15) ? csr_led_override_en : 1'b0),
	.port_params(p15_port_params),
	.cdr_lock(1'b0),
  .tx_lanes_stable(1'b0),
  .rx_pcs_ready(1'b0),
	.tx_clk(app_ss_lite_clk),
	.rx_clk(app_ss_lite_clk),
	.tx_tvalid(1'b0),
	.rx_tvalid(1'b0),
    	.csr_led_status(csr_led_status),
    	.csr_led_speed(csr_led_speed),
	.led_status(port15_led_status),
	.led_speed(port15_led_speed)
	);

endmodule

