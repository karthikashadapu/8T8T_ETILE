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
// Changes           : hssi ss top module for F-tile design 
//                   : 
// ==========================================================================
// synthesis translate_off

`timescale 1ns / 1ps
// synthesis translate_on
(* altera_attribute = "-name UNCONNECTED_OUTPUT_PORT_MESSAGE_LEVEL OFF" *)

// ==========================================================================
// Module Declaration
// ==========================================================================







module hssi_ss_1_hssi_ss_2500_4nezbiy 
#(
// -----------------------------------------------------
// Parameters Name              = Default  //Description
// -----------------------------------------------------
//  HSSI SS top level parameters
     parameter PORT0_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT0_ENABLED                          = 0,
     parameter PORT0_PROFILE                         = "10GbE",
     parameter PORT0_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT0_RSFEC                           = 0,
     parameter PORT0_PTP                             = 0,
     parameter [0:0] PORT0_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT0_PKT_SEG_PARITY_EN         = 0,
     parameter PORT0_ENABLE_MULTI_STREAM             = 0,
     parameter PORT0_NUM_OF_STREAM                   = 1,
     parameter PORT0_TID                             = 8,
     parameter [3:0] PORT0_READY_LATENCY             = 4'h0,
     parameter PORT0_DATA_WIDTH                      = 64,
     parameter PORT0_NUM_OF_SEG                      = (0 == 1) ? 1: PORT0_DATA_WIDTH/64,
     parameter PORT0_NO_OF_BYTES                     = PORT0_DATA_WIDTH/8 ,
     parameter PORT0_PHY_RATE                        = 0,
     parameter PORT0_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT0_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT0_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT0_PTP_FP_WIDTH                    = 32,
    parameter  PORT0_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT0_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT0_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT0_FLOW_CONTROL_EN                 = 0,
    parameter  PORT0_PFC_NUM_QUEUES                  = 1,
    parameter  PORT0_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT0_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT0_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT0_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT0_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT0_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT0_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT0_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT0_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT0_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT0_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT0_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT0_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT0_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT0_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT0_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT0_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT1_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT1_ENABLED                          = 0,
     parameter PORT1_PROFILE                         = "10GbE",
     parameter PORT1_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT1_RSFEC                           = 0,
     parameter PORT1_PTP                             = 0,
     parameter [0:0] PORT1_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT1_PKT_SEG_PARITY_EN         = 0,
     parameter PORT1_ENABLE_MULTI_STREAM             = 0,
     parameter PORT1_NUM_OF_STREAM                   = 1,
     parameter PORT1_TID                             = 8,
     parameter [3:0] PORT1_READY_LATENCY             = 4'h0,
     parameter PORT1_DATA_WIDTH                      = 64,
     parameter PORT1_NUM_OF_SEG                      = (0 == 1) ? 1: PORT1_DATA_WIDTH/64,
     parameter PORT1_NO_OF_BYTES                     = PORT1_DATA_WIDTH/8 ,
     parameter PORT1_PHY_RATE                        = 0,
     parameter PORT1_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT1_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT1_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT1_PTP_FP_WIDTH                    = 32,
    parameter  PORT1_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT1_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT1_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT1_FLOW_CONTROL_EN                 = 0,
    parameter  PORT1_PFC_NUM_QUEUES                  = 1,
    parameter  PORT1_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT1_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT1_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT1_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT1_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT1_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT1_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT1_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT1_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT1_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT1_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT1_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT1_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT1_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT1_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT1_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT1_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT2_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT2_ENABLED                          = 0,
     parameter PORT2_PROFILE                         = "10GbE",
     parameter PORT2_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT2_RSFEC                           = 0,
     parameter PORT2_PTP                             = 0,
     parameter [0:0] PORT2_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT2_PKT_SEG_PARITY_EN         = 0,
     parameter PORT2_ENABLE_MULTI_STREAM             = 0,
     parameter PORT2_NUM_OF_STREAM                   = 1,
     parameter PORT2_TID                             = 8,
     parameter [3:0] PORT2_READY_LATENCY             = 4'h0,
     parameter PORT2_DATA_WIDTH                      = 64,
     parameter PORT2_NUM_OF_SEG                      = (0 == 1) ? 1: PORT2_DATA_WIDTH/64,
     parameter PORT2_NO_OF_BYTES                     = PORT2_DATA_WIDTH/8 ,
     parameter PORT2_PHY_RATE                        = 0,
     parameter PORT2_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT2_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT2_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT2_PTP_FP_WIDTH                    = 8,
    parameter  PORT2_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT2_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT2_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT2_FLOW_CONTROL_EN                 = 0,
    parameter  PORT2_PFC_NUM_QUEUES                  = 1,
    parameter  PORT2_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT2_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT2_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT2_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT2_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT2_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT2_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT2_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT2_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT2_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT2_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT2_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT2_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT2_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT2_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT2_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT2_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT3_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT3_ENABLED                          = 0,
     parameter PORT3_PROFILE                         = "10GbE",
     parameter PORT3_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT3_RSFEC                           = 0,
     parameter PORT3_PTP                             = 0,
     parameter [0:0] PORT3_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT3_PKT_SEG_PARITY_EN         = 0,
     parameter PORT3_ENABLE_MULTI_STREAM             = 0,
     parameter PORT3_NUM_OF_STREAM                   = 1,
     parameter PORT3_TID                             = 8,
     parameter [3:0] PORT3_READY_LATENCY             = 4'h0,
     parameter PORT3_DATA_WIDTH                      = 64,
     parameter PORT3_NUM_OF_SEG                      = (0 == 1) ? 1: PORT3_DATA_WIDTH/64,
     parameter PORT3_NO_OF_BYTES                     = PORT3_DATA_WIDTH/8 ,
     parameter PORT3_PHY_RATE                        = 0,
     parameter PORT3_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT3_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT3_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT3_PTP_FP_WIDTH                    = 8,
    parameter  PORT3_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT3_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT3_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT3_FLOW_CONTROL_EN                 = 0,
    parameter  PORT3_PFC_NUM_QUEUES                  = 1,
    parameter  PORT3_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT3_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT3_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT3_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT3_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT3_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT3_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT3_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT3_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT3_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT3_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT3_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT3_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT3_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT3_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT3_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT3_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT4_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT4_ENABLED                          = 0,
     parameter PORT4_PROFILE                         = "10GbE",
     parameter PORT4_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT4_RSFEC                           = 0,
     parameter PORT4_PTP                             = 0,
     parameter [0:0] PORT4_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT4_PKT_SEG_PARITY_EN         = 0,
     parameter PORT4_ENABLE_MULTI_STREAM             = 0,
     parameter PORT4_NUM_OF_STREAM                   = 1,
     parameter PORT4_TID                             = 8,
     parameter [3:0] PORT4_READY_LATENCY             = 4'h0,
     parameter PORT4_DATA_WIDTH                      = 64,
     parameter PORT4_NUM_OF_SEG                      = (0 == 1) ? 1: PORT4_DATA_WIDTH/64,
     parameter PORT4_NO_OF_BYTES                     = PORT4_DATA_WIDTH/8 ,
     parameter PORT4_PHY_RATE                        = 0,
     parameter PORT4_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT4_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT4_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT4_PTP_FP_WIDTH                    = 8,
    parameter  PORT4_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT4_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT4_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT4_FLOW_CONTROL_EN                 = 0,
    parameter  PORT4_PFC_NUM_QUEUES                  = 1,
    parameter  PORT4_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT4_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT4_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT4_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT4_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT4_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT4_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT4_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT4_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT4_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT4_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT4_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT4_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT4_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT4_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT4_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT4_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT5_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT5_ENABLED                          = 0,
     parameter PORT5_PROFILE                         = "10GbE",
     parameter PORT5_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT5_RSFEC                           = 0,
     parameter PORT5_PTP                             = 0,
     parameter [0:0] PORT5_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT5_PKT_SEG_PARITY_EN         = 0,
     parameter PORT5_ENABLE_MULTI_STREAM             = 0,
     parameter PORT5_NUM_OF_STREAM                   = 1,
     parameter PORT5_TID                             = 8,
     parameter [3:0] PORT5_READY_LATENCY             = 4'h0,
     parameter PORT5_DATA_WIDTH                      = 64,
     parameter PORT5_NUM_OF_SEG                      = (0 == 1) ? 1: PORT5_DATA_WIDTH/64,
     parameter PORT5_NO_OF_BYTES                     = PORT5_DATA_WIDTH/8 ,
     parameter PORT5_PHY_RATE                        = 0,
     parameter PORT5_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT5_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT5_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT5_PTP_FP_WIDTH                    = 8,
    parameter  PORT5_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT5_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT5_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT5_FLOW_CONTROL_EN                 = 0,
    parameter  PORT5_PFC_NUM_QUEUES                  = 1,
    parameter  PORT5_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT5_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT5_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT5_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT5_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT5_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT5_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT5_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT5_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT5_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT5_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT5_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT5_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT5_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT5_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT5_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT5_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT6_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT6_ENABLED                          = 0,
     parameter PORT6_PROFILE                         = "10GbE",
     parameter PORT6_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT6_RSFEC                           = 0,
     parameter PORT6_PTP                             = 0,
     parameter [0:0] PORT6_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT6_PKT_SEG_PARITY_EN         = 0,
     parameter PORT6_ENABLE_MULTI_STREAM             = 0,
     parameter PORT6_NUM_OF_STREAM                   = 1,
     parameter PORT6_TID                             = 8,
     parameter [3:0] PORT6_READY_LATENCY             = 4'h0,
     parameter PORT6_DATA_WIDTH                      = 64,
     parameter PORT6_NUM_OF_SEG                      = (0 == 1) ? 1: PORT6_DATA_WIDTH/64,
     parameter PORT6_NO_OF_BYTES                     = PORT6_DATA_WIDTH/8 ,
     parameter PORT6_PHY_RATE                        = 0,
     parameter PORT6_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT6_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT6_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT6_PTP_FP_WIDTH                    = 8,
    parameter  PORT6_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT6_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT6_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT6_FLOW_CONTROL_EN                 = 0,
    parameter  PORT6_PFC_NUM_QUEUES                  = 1,
    parameter  PORT6_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT6_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT6_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT6_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT6_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT6_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT6_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT6_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT6_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT6_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT6_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT6_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT6_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT6_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT6_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT6_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT6_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT7_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT7_ENABLED                          = 0,
     parameter PORT7_PROFILE                         = "10GbE",
     parameter PORT7_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT7_RSFEC                           = 0,
     parameter PORT7_PTP                             = 0,
     parameter [0:0] PORT7_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT7_PKT_SEG_PARITY_EN         = 0,
     parameter PORT7_ENABLE_MULTI_STREAM             = 0,
     parameter PORT7_NUM_OF_STREAM                   = 1,
     parameter PORT7_TID                             = 8,
     parameter [3:0] PORT7_READY_LATENCY             = 4'h0,
     parameter PORT7_DATA_WIDTH                      = 64,
     parameter PORT7_NUM_OF_SEG                      = (0 == 1) ? 1: PORT7_DATA_WIDTH/64,
     parameter PORT7_NO_OF_BYTES                     = PORT7_DATA_WIDTH/8 ,
     parameter PORT7_PHY_RATE                        = 0,
     parameter PORT7_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT7_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT7_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT7_PTP_FP_WIDTH                    = 8,
    parameter  PORT7_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT7_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT7_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT7_FLOW_CONTROL_EN                 = 0,
    parameter  PORT7_PFC_NUM_QUEUES                  = 1,
    parameter  PORT7_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT7_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT7_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT7_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT7_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT7_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT7_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT7_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT7_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT7_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT7_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT7_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT7_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT7_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT7_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT7_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT7_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT8_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT8_ENABLED                          = 0,
     parameter PORT8_PROFILE                         = "10GbE",
     parameter PORT8_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT8_RSFEC                           = 0,
     parameter PORT8_PTP                             = 0,
     parameter [0:0] PORT8_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT8_PKT_SEG_PARITY_EN         = 0,
     parameter PORT8_ENABLE_MULTI_STREAM             = 0,
     parameter PORT8_NUM_OF_STREAM                   = 1,
     parameter PORT8_TID                             = 8,
     parameter [3:0] PORT8_READY_LATENCY             = 4'h0,
     parameter PORT8_DATA_WIDTH                      = 64,
     parameter PORT8_NUM_OF_SEG                      = (0 == 1) ? 1: PORT8_DATA_WIDTH/64,
     parameter PORT8_NO_OF_BYTES                     = PORT8_DATA_WIDTH/8 ,
     parameter PORT8_PHY_RATE                        = 0,
     parameter PORT8_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT8_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT8_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT8_PTP_FP_WIDTH                    = 32,
    parameter  PORT8_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT8_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT8_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT8_FLOW_CONTROL_EN                 = 0,
    parameter  PORT8_PFC_NUM_QUEUES                  = 1,
    parameter  PORT8_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT8_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT8_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT8_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT8_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT8_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT8_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT8_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT8_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT8_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT8_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT8_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT8_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT8_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT8_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT8_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT8_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT9_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT9_ENABLED                          = 0,
     parameter PORT9_PROFILE                         = "10GbE",
     parameter PORT9_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT9_RSFEC                           = 0,
     parameter PORT9_PTP                             = 0,
     parameter [0:0] PORT9_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT9_PKT_SEG_PARITY_EN         = 0,
     parameter PORT9_ENABLE_MULTI_STREAM             = 0,
     parameter PORT9_NUM_OF_STREAM                   = 1,
     parameter PORT9_TID                             = 8,
     parameter [3:0] PORT9_READY_LATENCY             = 4'h0,
     parameter PORT9_DATA_WIDTH                      = 64,
     parameter PORT9_NUM_OF_SEG                      = (0 == 1) ? 1: PORT9_DATA_WIDTH/64,
     parameter PORT9_NO_OF_BYTES                     = PORT9_DATA_WIDTH/8 ,
     parameter PORT9_PHY_RATE                        = 0,
     parameter PORT9_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT9_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT9_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT9_PTP_FP_WIDTH                    = 32,
    parameter  PORT9_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT9_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT9_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT9_FLOW_CONTROL_EN                 = 0,
    parameter  PORT9_PFC_NUM_QUEUES                  = 1,
    parameter  PORT9_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT9_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT9_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT9_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT9_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT9_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT9_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT9_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT9_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT9_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT9_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT9_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT9_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT9_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT9_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT9_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT9_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT10_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT10_ENABLED                          = 0,
     parameter PORT10_PROFILE                         = "10GbE",
     parameter PORT10_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT10_RSFEC                           = 0,
     parameter PORT10_PTP                             = 0,
     parameter [0:0] PORT10_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT10_PKT_SEG_PARITY_EN         = 0,
     parameter PORT10_ENABLE_MULTI_STREAM             = 0,
     parameter PORT10_NUM_OF_STREAM                   = 1,
     parameter PORT10_TID                             = 8,
     parameter [3:0] PORT10_READY_LATENCY             = 4'h0,
     parameter PORT10_DATA_WIDTH                      = 64,
     parameter PORT10_NUM_OF_SEG                      = (0 == 1) ? 1: PORT10_DATA_WIDTH/64,
     parameter PORT10_NO_OF_BYTES                     = PORT10_DATA_WIDTH/8 ,
     parameter PORT10_PHY_RATE                        = 0,
     parameter PORT10_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT10_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT10_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT10_PTP_FP_WIDTH                    = 8,
    parameter  PORT10_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT10_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT10_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT10_FLOW_CONTROL_EN                 = 0,
    parameter  PORT10_PFC_NUM_QUEUES                  = 1,
    parameter  PORT10_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT10_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT10_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT10_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT10_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT10_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT10_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT10_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT10_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT10_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT10_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT10_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT10_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT10_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT10_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT10_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT10_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT11_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT11_ENABLED                          = 0,
     parameter PORT11_PROFILE                         = "10GbE",
     parameter PORT11_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT11_RSFEC                           = 0,
     parameter PORT11_PTP                             = 0,
     parameter [0:0] PORT11_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT11_PKT_SEG_PARITY_EN         = 0,
     parameter PORT11_ENABLE_MULTI_STREAM             = 0,
     parameter PORT11_NUM_OF_STREAM                   = 1,
     parameter PORT11_TID                             = 8,
     parameter [3:0] PORT11_READY_LATENCY             = 4'h0,
     parameter PORT11_DATA_WIDTH                      = 64,
     parameter PORT11_NUM_OF_SEG                      = (0 == 1) ? 1: PORT11_DATA_WIDTH/64,
     parameter PORT11_NO_OF_BYTES                     = PORT11_DATA_WIDTH/8 ,
     parameter PORT11_PHY_RATE                        = 0,
     parameter PORT11_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT11_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT11_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT11_PTP_FP_WIDTH                    = 8,
    parameter  PORT11_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT11_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT11_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT11_FLOW_CONTROL_EN                 = 0,
    parameter  PORT11_PFC_NUM_QUEUES                  = 1,
    parameter  PORT11_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT11_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT11_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT11_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT11_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT11_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT11_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT11_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT11_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT11_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT11_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT11_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT11_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT11_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT11_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT11_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT11_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT12_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT12_ENABLED                          = 0,
     parameter PORT12_PROFILE                         = "10GbE",
     parameter PORT12_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT12_RSFEC                           = 0,
     parameter PORT12_PTP                             = 0,
     parameter [0:0] PORT12_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT12_PKT_SEG_PARITY_EN         = 0,
     parameter PORT12_ENABLE_MULTI_STREAM             = 0,
     parameter PORT12_NUM_OF_STREAM                   = 1,
     parameter PORT12_TID                             = 8,
     parameter [3:0] PORT12_READY_LATENCY             = 4'h0,
     parameter PORT12_DATA_WIDTH                      = 64,
     parameter PORT12_NUM_OF_SEG                      = (0 == 1) ? 1: PORT12_DATA_WIDTH/64,
     parameter PORT12_NO_OF_BYTES                     = PORT12_DATA_WIDTH/8 ,
     parameter PORT12_PHY_RATE                        = 0,
     parameter PORT12_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT12_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT12_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT12_PTP_FP_WIDTH                    = 32,
    parameter  PORT12_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT12_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT12_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT12_FLOW_CONTROL_EN                 = 0,
    parameter  PORT12_PFC_NUM_QUEUES                  = 1,
    parameter  PORT12_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT12_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT12_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT12_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT12_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT12_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT12_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT12_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT12_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT12_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT12_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT12_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT12_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT12_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT12_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT12_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT12_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT13_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT13_ENABLED                          = 0,
     parameter PORT13_PROFILE                         = "10GbE",
     parameter PORT13_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT13_RSFEC                           = 0,
     parameter PORT13_PTP                             = 0,
     parameter [0:0] PORT13_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT13_PKT_SEG_PARITY_EN         = 0,
     parameter PORT13_ENABLE_MULTI_STREAM             = 0,
     parameter PORT13_NUM_OF_STREAM                   = 1,
     parameter PORT13_TID                             = 8,
     parameter [3:0] PORT13_READY_LATENCY             = 4'h0,
     parameter PORT13_DATA_WIDTH                      = 64,
     parameter PORT13_NUM_OF_SEG                      = (0 == 1) ? 1: PORT13_DATA_WIDTH/64,
     parameter PORT13_NO_OF_BYTES                     = PORT13_DATA_WIDTH/8 ,
     parameter PORT13_PHY_RATE                        = 0,
     parameter PORT13_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT13_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT13_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT13_PTP_FP_WIDTH                    = 8,
    parameter  PORT13_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT13_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT13_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT13_FLOW_CONTROL_EN                 = 0,
    parameter  PORT13_PFC_NUM_QUEUES                  = 1,
    parameter  PORT13_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT13_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT13_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT13_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT13_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT13_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT13_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT13_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT13_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT13_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT13_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT13_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT13_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT13_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT13_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT13_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT13_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT14_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT14_ENABLED                          = 0,
     parameter PORT14_PROFILE                         = "10GbE",
     parameter PORT14_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT14_RSFEC                           = 0,
     parameter PORT14_PTP                             = 0,
     parameter [0:0] PORT14_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT14_PKT_SEG_PARITY_EN         = 0,
     parameter PORT14_ENABLE_MULTI_STREAM             = 0,
     parameter PORT14_NUM_OF_STREAM                   = 1,
     parameter PORT14_TID                             = 8,
     parameter [3:0] PORT14_READY_LATENCY             = 4'h0,
     parameter PORT14_DATA_WIDTH                      = 64,
     parameter PORT14_NUM_OF_SEG                      = (0 == 1) ? 1: PORT14_DATA_WIDTH/64,
     parameter PORT14_NO_OF_BYTES                     = PORT14_DATA_WIDTH/8 ,
     parameter PORT14_PHY_RATE                        = 0,
     parameter PORT14_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT14_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT14_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT14_PTP_FP_WIDTH                    = 8,
    parameter  PORT14_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT14_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT14_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT14_FLOW_CONTROL_EN                 = 0,
    parameter  PORT14_PFC_NUM_QUEUES                  = 1,
    parameter  PORT14_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT14_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT14_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT14_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT14_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT14_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT14_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT14_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT14_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT14_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT14_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT14_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT14_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT14_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT14_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT14_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT14_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT15_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT15_ENABLED                          = 0,
     parameter PORT15_PROFILE                         = "10GbE",
     parameter PORT15_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT15_RSFEC                           = 0,
     parameter PORT15_PTP                             = 0,
     parameter [0:0] PORT15_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT15_PKT_SEG_PARITY_EN         = 0,
     parameter PORT15_ENABLE_MULTI_STREAM             = 0,
     parameter PORT15_NUM_OF_STREAM                   = 1,
     parameter PORT15_TID                             = 8,
     parameter [3:0] PORT15_READY_LATENCY             = 4'h0,
     parameter PORT15_DATA_WIDTH                      = 64,
     parameter PORT15_NUM_OF_SEG                      = (0 == 1) ? 1: PORT15_DATA_WIDTH/64,
     parameter PORT15_NO_OF_BYTES                     = PORT15_DATA_WIDTH/8 ,
     parameter PORT15_PHY_RATE                        = 0,
     parameter PORT15_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT15_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT15_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT15_PTP_FP_WIDTH                    = 8,
    parameter  PORT15_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT15_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT15_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT15_FLOW_CONTROL_EN                 = 0,
    parameter  PORT15_PFC_NUM_QUEUES                  = 1,
    parameter  PORT15_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT15_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT15_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT15_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT15_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT15_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT15_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT15_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT15_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT15_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT15_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT15_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT15_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT15_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT15_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT15_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT15_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT16_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT16_ENABLED                          = 0,
     parameter PORT16_PROFILE                         = "10GbE",
     parameter PORT16_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT16_RSFEC                           = 0,
     parameter PORT16_PTP                             = 0,
     parameter [0:0] PORT16_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT16_PKT_SEG_PARITY_EN         = 0,
     parameter PORT16_ENABLE_MULTI_STREAM             = 0,
     parameter PORT16_NUM_OF_STREAM                   = 1,
     parameter PORT16_TID                             = 8,
     parameter [3:0] PORT16_READY_LATENCY             = 4'h0,
     parameter PORT16_DATA_WIDTH                      = 64,
     parameter PORT16_NUM_OF_SEG                      = (0 == 1) ? 1: PORT16_DATA_WIDTH/64,
     parameter PORT16_NO_OF_BYTES                     = PORT16_DATA_WIDTH/8 ,
     parameter PORT16_PHY_RATE                        = 0,
     parameter PORT16_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT16_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT16_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT16_PTP_FP_WIDTH                    = 8,
    parameter  PORT16_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT16_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT16_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT16_FLOW_CONTROL_EN                 = 0,
    parameter  PORT16_PFC_NUM_QUEUES                  = 1,
    parameter  PORT16_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT16_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT16_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT16_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT16_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT16_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT16_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT16_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT16_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT16_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT16_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT16_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT16_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT16_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT16_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT16_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT16_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT17_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT17_ENABLED                          = 0,
     parameter PORT17_PROFILE                         = "10GbE",
     parameter PORT17_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT17_RSFEC                           = 0,
     parameter PORT17_PTP                             = 0,
     parameter [0:0] PORT17_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT17_PKT_SEG_PARITY_EN         = 0,
     parameter PORT17_ENABLE_MULTI_STREAM             = 0,
     parameter PORT17_NUM_OF_STREAM                   = 1,
     parameter PORT17_TID                             = 8,
     parameter [3:0] PORT17_READY_LATENCY             = 4'h0,
     parameter PORT17_DATA_WIDTH                      = 64,
     parameter PORT17_NUM_OF_SEG                      = (0 == 1) ? 1: PORT17_DATA_WIDTH/64,
     parameter PORT17_NO_OF_BYTES                     = PORT17_DATA_WIDTH/8 ,
     parameter PORT17_PHY_RATE                        = 0,
     parameter PORT17_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT17_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT17_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT17_PTP_FP_WIDTH                    = 8,
    parameter  PORT17_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT17_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT17_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT17_FLOW_CONTROL_EN                 = 0,
    parameter  PORT17_PFC_NUM_QUEUES                  = 1,
    parameter  PORT17_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT17_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT17_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT17_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT17_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT17_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT17_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT17_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT17_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT17_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT17_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT17_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT17_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT17_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT17_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT17_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT17_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT18_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT18_ENABLED                          = 0,
     parameter PORT18_PROFILE                         = "10GbE",
     parameter PORT18_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT18_RSFEC                           = 0,
     parameter PORT18_PTP                             = 0,
     parameter [0:0] PORT18_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT18_PKT_SEG_PARITY_EN         = 0,
     parameter PORT18_ENABLE_MULTI_STREAM             = 0,
     parameter PORT18_NUM_OF_STREAM                   = 1,
     parameter PORT18_TID                             = 8,
     parameter [3:0] PORT18_READY_LATENCY             = 4'h0,
     parameter PORT18_DATA_WIDTH                      = 64,
     parameter PORT18_NUM_OF_SEG                      = (0 == 1) ? 1: PORT18_DATA_WIDTH/64,
     parameter PORT18_NO_OF_BYTES                     = PORT18_DATA_WIDTH/8 ,
     parameter PORT18_PHY_RATE                        = 0,
     parameter PORT18_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT18_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT18_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT18_PTP_FP_WIDTH                    = 8,
    parameter  PORT18_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT18_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT18_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT18_FLOW_CONTROL_EN                 = 0,
    parameter  PORT18_PFC_NUM_QUEUES                  = 1,
    parameter  PORT18_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT18_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT18_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT18_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT18_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT18_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT18_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT18_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT18_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT18_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT18_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT18_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT18_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT18_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT18_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT18_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT18_PFC_RX_QUEUE7_SIZE    = 512,
     parameter PORT19_XCVR_CHANNEL                    = 1, //Number of Transceiver Channels
     parameter PORT19_ENABLED                          = 0,
     parameter PORT19_PROFILE                         = "10GbE",
     parameter PORT19_SUB_PROFILE                     = "MAC+PCS",
     parameter PORT19_RSFEC                           = 0,
     parameter PORT19_PTP                             = 0,
     parameter [0:0] PORT19_PTP_TX_CLASSIFIER_ENABLE  = 0,
     parameter [0:0] PORT19_PKT_SEG_PARITY_EN         = 0,
     parameter PORT19_ENABLE_MULTI_STREAM             = 0,
     parameter PORT19_NUM_OF_STREAM                   = 1,
     parameter PORT19_TID                             = 8,
     parameter [3:0] PORT19_READY_LATENCY             = 4'h0,
     parameter PORT19_DATA_WIDTH                      = 64,
     parameter PORT19_NUM_OF_SEG                      = (0 == 1) ? 1: PORT19_DATA_WIDTH/64,
     parameter PORT19_NO_OF_BYTES                     = PORT19_DATA_WIDTH/8 ,
     parameter PORT19_PHY_RATE                        = 0,
     parameter PORT19_DR_EXT_SUBSYS                   = 0,       //Indicate presence of Dynamic Reconfiguration Extension Subsystem presence. Supported value 0-1. 
     parameter PORT19_PR_DR_ENABLE                    = 0,       //Indicate presence of 100G Partial Reconfiguration Dynamic Reconfiguration. Supported value 0-1. 
     parameter PORT19_LOW_SPEED_ETH                   = "GMII",  //Indicate the subsystem support for Low Speed MII interface. Support keyword "XGMII", "GMII", "MII"
    parameter  PORT19_PTP_FP_WIDTH                    = 8,
    parameter  PORT19_STARTUP_PROFILE_SEL             = 6'b000000,
    parameter  PORT19_STARTUP_FEC_TYPE                = 12'b000_000_000_000,
    parameter  PORT19_STARTUP_SEL_25G_10G             = 4'b0000,
    
    //PFC Level Parameters
    parameter  PORT19_FLOW_CONTROL_EN                 = 0,
    parameter  PORT19_PFC_NUM_QUEUES                  = 1,
    parameter  PORT19_PFC_TX_BUFFER_EN                = 1,

    //Either change HDL param or keep max value
    parameter  PORT19_PFC_TX_QUEUE0_SIZE    = 512,
    parameter  PORT19_PFC_RX_QUEUE0_SIZE    = 512,
    parameter  PORT19_PFC_TX_QUEUE1_SIZE    = 512,
    parameter  PORT19_PFC_RX_QUEUE1_SIZE    = 512,
    parameter  PORT19_PFC_TX_QUEUE2_SIZE    = 512,
    parameter  PORT19_PFC_RX_QUEUE2_SIZE    = 512,
    parameter  PORT19_PFC_TX_QUEUE3_SIZE    = 512,
    parameter  PORT19_PFC_RX_QUEUE3_SIZE    = 512,
    parameter  PORT19_PFC_TX_QUEUE4_SIZE    = 512,
    parameter  PORT19_PFC_RX_QUEUE4_SIZE    = 512,
    parameter  PORT19_PFC_TX_QUEUE5_SIZE    = 512,
    parameter  PORT19_PFC_RX_QUEUE5_SIZE    = 512,
    parameter  PORT19_PFC_TX_QUEUE6_SIZE    = 512,
    parameter  PORT19_PFC_RX_QUEUE6_SIZE    = 512,
    parameter  PORT19_PFC_TX_QUEUE7_SIZE    = 512,
    parameter  PORT19_PFC_RX_QUEUE7_SIZE    = 512,
    //parameter PORT20_TBI_INTERFACE  = 0,       //Indicate the subsystem support for TBI interface. Supported value 0-1.
    //parameter PORT20_MDIO_INTERFACE = 0,       //Indicate the subsystem support for MDIO interface. Supported value 0-1.
   //parameter PORT20_PTP_CLOCK_MODE = "00",    //Use this signal to specify the clock mode. Supported value 0-3.
    //parameter PORT20_DR_AIB_MAP     = 16,      //source/destination port mapping after the dynamic reconfiguration. Value 16-32.
    parameter product               = "Agilex",//FPGA or eASIC products. Supported keyword "Agilex", "S10", "A10", "DM" and "DM2"
    parameter tiles                 = "F",     //FPGA tiles. Supported keyword "E", "H", F". Grey out if DM/DM2 (eASIC) and A10 are selected as product
    parameter NUM_PORTS             = 5'h8,    //Number of Ethernet ports, Enabled+Disabled, within the subsystem. Supported value 1-16. 
    parameter [4:0] NUM_ENABLED_PORTS = 5'h8,  //Number of Enabled Ethernet ports within the subsystem. Supported value 1-16. 
    parameter ENABLE_JTAG           = 0,       //Indicate the JTAG master instantiation. 0 - Disable, 1 - Enable
    parameter PARAM_DATA            = 32,      //AXI-Lite Data Width
    parameter SWITCH_EXT_SUBSYS     = 0,       //Indicate presence of L2 Switch Extension Subsystem presence. Supported value 0-1.
    parameter [23:0] SUBSYSTEM_RST_ACK_DEASSERT_DELAY = 24'h000_040,
    parameter [23:0] TX_RST_ACK_DEASSERT_DELAY = 24'h002000,
    parameter [23:0] RX_RST_ACK_DEASSERT_DELAY = 24'h002000,
    parameter [0:0]  SET_AXI_LITE_RESPONSE_TO_ZERO = 1'b0,
    parameter [7:0]  DFHv0_FEA_VER      = 8'h01,
    parameter [3:0]  DFHv0_FEA_MINOR    = 4'h0,
    parameter [0:0]  DFHv0_FEA_EOL      = 1'b0,
    parameter [23:0] DFHv0_FEA_NXT      = 24'h001000,
    parameter [3:0]  DFHv0_FEA_REV      = 4'h2,
    parameter [11:0] DFHv0_FEA_FEAID    = 12'h015,
    parameter [3:0]  DFHv0_FEA_FEATYPE  = 4'h3,
    parameter [15:0] DFHv1_INSTID       = 16'h0000,
    parameter DISABLE_DR_CPU            = 0,
    parameter ENABLE_ECC                = 0,
    parameter EN_SYS_PLL                = 1,
    parameter SIM_MODE                  = 0,
    parameter SIM_FAST_EN               = 0
    //parameter SIM_MODE_HUNG_TIME        = 32'd1000000  //10 msec default 40000 // 400 usec at 100 MHz 
    )(
  // ---------------
  // Reset Interface
  // --------------- 
  input                           subsystem_cold_rst_n,  //Complete SS reset, will resets SS, EHIP and NIOS
  output                          subsystem_cold_rst_ack_n,
 
  // ---------------
  // Clock Interface
  // --------------- 
  input  [1:0]                    i_clk_ref,
  input                           i_clk_sys, 

  //Reset signals from SRC to ehip and other modules
  input                           i_p0_tx_rst_n,
  input                           i_p0_rx_rst_n,
  output                          o_p0_rx_rst_ack_n,
  output                          o_p0_tx_rst_ack_n,
  output                          o_p0_ereset_n,

  output                          o_p0_clk_pll,
  input                           i_p0_clk_ptp_sample,
  input                           i_p0_clk_tx_tod,
  input                           i_p0_clk_rx_tod,
  output                          o_p0_clk_tx_div,
  output                          o_p0_clk_rec_div64,
  output                          o_p0_clk_rec_div,
  input                           p0_tx_clkena_half_rate,
  input                           p0_rx_clkena_half_rate,
  input                           i_p1_tx_rst_n,
  input                           i_p1_rx_rst_n,
  output                          o_p1_rx_rst_ack_n,
  output                          o_p1_tx_rst_ack_n,
  output                          o_p1_ereset_n,

  output                          o_p1_clk_pll,
  input                           i_p1_clk_ptp_sample,
  input                           i_p1_clk_tx_tod,
  input                           i_p1_clk_rx_tod,
  output                          o_p1_clk_tx_div,
  output                          o_p1_clk_rec_div64,
  output                          o_p1_clk_rec_div,
  input                           p1_tx_clkena_half_rate,
  input                           p1_rx_clkena_half_rate,
  input                           i_p2_tx_rst_n,
  input                           i_p2_rx_rst_n,
  output                          o_p2_rx_rst_ack_n,
  output                          o_p2_tx_rst_ack_n,
  output                          o_p2_ereset_n,

  output                          o_p2_clk_pll,
  input                           i_p2_clk_ptp_sample,
  input                           i_p2_clk_tx_tod,
  input                           i_p2_clk_rx_tod,
  output                          o_p2_clk_tx_div,
  output                          o_p2_clk_rec_div64,
  output                          o_p2_clk_rec_div,
  input                           p2_tx_clkena_half_rate,
  input                           p2_rx_clkena_half_rate,
  input                           i_p3_tx_rst_n,
  input                           i_p3_rx_rst_n,
  output                          o_p3_rx_rst_ack_n,
  output                          o_p3_tx_rst_ack_n,
  output                          o_p3_ereset_n,

  output                          o_p3_clk_pll,
  input                           i_p3_clk_ptp_sample,
  input                           i_p3_clk_tx_tod,
  input                           i_p3_clk_rx_tod,
  output                          o_p3_clk_tx_div,
  output                          o_p3_clk_rec_div64,
  output                          o_p3_clk_rec_div,
  input                           p3_tx_clkena_half_rate,
  input                           p3_rx_clkena_half_rate,
  input                           i_p4_tx_rst_n,
  input                           i_p4_rx_rst_n,
  output                          o_p4_rx_rst_ack_n,
  output                          o_p4_tx_rst_ack_n,
  output                          o_p4_ereset_n,

  output                          o_p4_clk_pll,
  input                           i_p4_clk_ptp_sample,
  input                           i_p4_clk_tx_tod,
  input                           i_p4_clk_rx_tod,
  output                          o_p4_clk_tx_div,
  output                          o_p4_clk_rec_div64,
  output                          o_p4_clk_rec_div,
  input                           p4_tx_clkena_half_rate,
  input                           p4_rx_clkena_half_rate,
  input                           i_p5_tx_rst_n,
  input                           i_p5_rx_rst_n,
  output                          o_p5_rx_rst_ack_n,
  output                          o_p5_tx_rst_ack_n,
  output                          o_p5_ereset_n,

  output                          o_p5_clk_pll,
  input                           i_p5_clk_ptp_sample,
  input                           i_p5_clk_tx_tod,
  input                           i_p5_clk_rx_tod,
  output                          o_p5_clk_tx_div,
  output                          o_p5_clk_rec_div64,
  output                          o_p5_clk_rec_div,
  input                           p5_tx_clkena_half_rate,
  input                           p5_rx_clkena_half_rate,
  input                           i_p6_tx_rst_n,
  input                           i_p6_rx_rst_n,
  output                          o_p6_rx_rst_ack_n,
  output                          o_p6_tx_rst_ack_n,
  output                          o_p6_ereset_n,

  output                          o_p6_clk_pll,
  input                           i_p6_clk_ptp_sample,
  input                           i_p6_clk_tx_tod,
  input                           i_p6_clk_rx_tod,
  output                          o_p6_clk_tx_div,
  output                          o_p6_clk_rec_div64,
  output                          o_p6_clk_rec_div,
  input                           p6_tx_clkena_half_rate,
  input                           p6_rx_clkena_half_rate,
  input                           i_p7_tx_rst_n,
  input                           i_p7_rx_rst_n,
  output                          o_p7_rx_rst_ack_n,
  output                          o_p7_tx_rst_ack_n,
  output                          o_p7_ereset_n,

  output                          o_p7_clk_pll,
  input                           i_p7_clk_ptp_sample,
  input                           i_p7_clk_tx_tod,
  input                           i_p7_clk_rx_tod,
  output                          o_p7_clk_tx_div,
  output                          o_p7_clk_rec_div64,
  output                          o_p7_clk_rec_div,
  input                           p7_tx_clkena_half_rate,
  input                           p7_rx_clkena_half_rate,
  input                           i_p8_tx_rst_n,
  input                           i_p8_rx_rst_n,
  output                          o_p8_rx_rst_ack_n,
  output                          o_p8_tx_rst_ack_n,
  output                          o_p8_ereset_n,

  output                          o_p8_clk_pll,
  input                           i_p8_clk_ptp_sample,
  input                           i_p8_clk_tx_tod,
  input                           i_p8_clk_rx_tod,
  output                          o_p8_clk_tx_div,
  output                          o_p8_clk_rec_div64,
  output                          o_p8_clk_rec_div,
  input                           p8_tx_clkena_half_rate,
  input                           p8_rx_clkena_half_rate,
  input                           i_p9_tx_rst_n,
  input                           i_p9_rx_rst_n,
  output                          o_p9_rx_rst_ack_n,
  output                          o_p9_tx_rst_ack_n,
  output                          o_p9_ereset_n,

  output                          o_p9_clk_pll,
  input                           i_p9_clk_ptp_sample,
  input                           i_p9_clk_tx_tod,
  input                           i_p9_clk_rx_tod,
  output                          o_p9_clk_tx_div,
  output                          o_p9_clk_rec_div64,
  output                          o_p9_clk_rec_div,
  input                           p9_tx_clkena_half_rate,
  input                           p9_rx_clkena_half_rate,
  input                           i_p10_tx_rst_n,
  input                           i_p10_rx_rst_n,
  output                          o_p10_rx_rst_ack_n,
  output                          o_p10_tx_rst_ack_n,
  output                          o_p10_ereset_n,

  output                          o_p10_clk_pll,
  input                           i_p10_clk_ptp_sample,
  input                           i_p10_clk_tx_tod,
  input                           i_p10_clk_rx_tod,
  output                          o_p10_clk_tx_div,
  output                          o_p10_clk_rec_div64,
  output                          o_p10_clk_rec_div,
  input                           p10_tx_clkena_half_rate,
  input                           p10_rx_clkena_half_rate,
  input                           i_p11_tx_rst_n,
  input                           i_p11_rx_rst_n,
  output                          o_p11_rx_rst_ack_n,
  output                          o_p11_tx_rst_ack_n,
  output                          o_p11_ereset_n,

  output                          o_p11_clk_pll,
  input                           i_p11_clk_ptp_sample,
  input                           i_p11_clk_tx_tod,
  input                           i_p11_clk_rx_tod,
  output                          o_p11_clk_tx_div,
  output                          o_p11_clk_rec_div64,
  output                          o_p11_clk_rec_div,
  input                           p11_tx_clkena_half_rate,
  input                           p11_rx_clkena_half_rate,
  input                           i_p12_tx_rst_n,
  input                           i_p12_rx_rst_n,
  output                          o_p12_rx_rst_ack_n,
  output                          o_p12_tx_rst_ack_n,
  output                          o_p12_ereset_n,

  output                          o_p12_clk_pll,
  input                           i_p12_clk_ptp_sample,
  input                           i_p12_clk_tx_tod,
  input                           i_p12_clk_rx_tod,
  output                          o_p12_clk_tx_div,
  output                          o_p12_clk_rec_div64,
  output                          o_p12_clk_rec_div,
  input                           p12_tx_clkena_half_rate,
  input                           p12_rx_clkena_half_rate,
  input                           i_p13_tx_rst_n,
  input                           i_p13_rx_rst_n,
  output                          o_p13_rx_rst_ack_n,
  output                          o_p13_tx_rst_ack_n,
  output                          o_p13_ereset_n,

  output                          o_p13_clk_pll,
  input                           i_p13_clk_ptp_sample,
  input                           i_p13_clk_tx_tod,
  input                           i_p13_clk_rx_tod,
  output                          o_p13_clk_tx_div,
  output                          o_p13_clk_rec_div64,
  output                          o_p13_clk_rec_div,
  input                           p13_tx_clkena_half_rate,
  input                           p13_rx_clkena_half_rate,
  input                           i_p14_tx_rst_n,
  input                           i_p14_rx_rst_n,
  output                          o_p14_rx_rst_ack_n,
  output                          o_p14_tx_rst_ack_n,
  output                          o_p14_ereset_n,

  output                          o_p14_clk_pll,
  input                           i_p14_clk_ptp_sample,
  input                           i_p14_clk_tx_tod,
  input                           i_p14_clk_rx_tod,
  output                          o_p14_clk_tx_div,
  output                          o_p14_clk_rec_div64,
  output                          o_p14_clk_rec_div,
  input                           p14_tx_clkena_half_rate,
  input                           p14_rx_clkena_half_rate,
  input                           i_p15_tx_rst_n,
  input                           i_p15_rx_rst_n,
  output                          o_p15_rx_rst_ack_n,
  output                          o_p15_tx_rst_ack_n,
  output                          o_p15_ereset_n,

  output                          o_p15_clk_pll,
  input                           i_p15_clk_ptp_sample,
  input                           i_p15_clk_tx_tod,
  input                           i_p15_clk_rx_tod,
  output                          o_p15_clk_tx_div,
  output                          o_p15_clk_rec_div64,
  output                          o_p15_clk_rec_div,
  input                           p15_tx_clkena_half_rate,
  input                           p15_rx_clkena_half_rate,
  input                           i_p16_tx_rst_n,
  input                           i_p16_rx_rst_n,
  output                          o_p16_rx_rst_ack_n,
  output                          o_p16_tx_rst_ack_n,
  output                          o_p16_ereset_n,

  output                          o_p16_clk_pll,
  input                           i_p16_clk_ptp_sample,
  input                           i_p16_clk_tx_tod,
  input                           i_p16_clk_rx_tod,
  output                          o_p16_clk_tx_div,
  output                          o_p16_clk_rec_div64,
  output                          o_p16_clk_rec_div,
  input                           p16_tx_clkena_half_rate,
  input                           p16_rx_clkena_half_rate,
  input                           i_p17_tx_rst_n,
  input                           i_p17_rx_rst_n,
  output                          o_p17_rx_rst_ack_n,
  output                          o_p17_tx_rst_ack_n,
  output                          o_p17_ereset_n,

  output                          o_p17_clk_pll,
  input                           i_p17_clk_ptp_sample,
  input                           i_p17_clk_tx_tod,
  input                           i_p17_clk_rx_tod,
  output                          o_p17_clk_tx_div,
  output                          o_p17_clk_rec_div64,
  output                          o_p17_clk_rec_div,
  input                           p17_tx_clkena_half_rate,
  input                           p17_rx_clkena_half_rate,
  input                           i_p18_tx_rst_n,
  input                           i_p18_rx_rst_n,
  output                          o_p18_rx_rst_ack_n,
  output                          o_p18_tx_rst_ack_n,
  output                          o_p18_ereset_n,

  output                          o_p18_clk_pll,
  input                           i_p18_clk_ptp_sample,
  input                           i_p18_clk_tx_tod,
  input                           i_p18_clk_rx_tod,
  output                          o_p18_clk_tx_div,
  output                          o_p18_clk_rec_div64,
  output                          o_p18_clk_rec_div,
  input                           p18_tx_clkena_half_rate,
  input                           p18_rx_clkena_half_rate,
  input                           i_p19_tx_rst_n,
  input                           i_p19_rx_rst_n,
  output                          o_p19_rx_rst_ack_n,
  output                          o_p19_tx_rst_ack_n,
  output                          o_p19_ereset_n,

  output                          o_p19_clk_pll,
  input                           i_p19_clk_ptp_sample,
  input                           i_p19_clk_tx_tod,
  input                           i_p19_clk_rx_tod,
  output                          o_p19_clk_tx_div,
  output                          o_p19_clk_rec_div64,
  output                          o_p19_clk_rec_div,
  input                           p19_tx_clkena_half_rate,
  input                           p19_rx_clkena_half_rate,
 
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
  // AXI Lite Control path Interface one control interface for all
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
  // ----------------------------------
  // AXI ST TX/RX Client Interface Signals, valid for eth with MAC enable, otherwise empty list 
  // ----------------------------------
  // these singals are per port, as data width maybe different for each port, and width is no if channels
  input                                             p0_app_ss_st_tx_clk,
  input                                             p0_app_ss_st_tx_areset_n,
  input  [1-1:0]              p0_app_ss_st_tx_tvalid,
  output [1-1:0]              p0_ss_app_st_tx_tready,
  input  [PORT0_DATA_WIDTH-1:0]            p0_app_ss_st_tx_tdata,
  input  [(PORT0_DATA_WIDTH/8)-1:0]        p0_app_ss_st_tx_tkeep,
//  input  [PORT0_NO_OF_BYTES-1:0]   p0_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT0_NUM_OF_SEG * PORT0_NO_OF_BYTES)-1:0]  p0_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p0_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p0_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p0_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p0_app_ss_st_tx_tuser_client,
  input  [PORT0_NUM_OF_SEG-1:0]            p0_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT0_NUM_OF_SEG - 1)):0]     p0_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p0_app_ss_st_rx_clk,
  input                                             p0_app_ss_st_rx_areset_n,
  output [1-1:0]              p0_ss_app_st_rx_tvalid,
  output [PORT0_DATA_WIDTH-1:0]            p0_ss_app_st_rx_tdata,
  output [(PORT0_DATA_WIDTH/8)-1:0]        p0_ss_app_st_rx_tkeep,
  output [1-1:0]              p0_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p0_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p0_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p0_ss_app_st_rx_tuser_sts_extended,
  output [PORT0_NUM_OF_SEG-1:0]            p0_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT0_NUM_OF_SEG - 1)):0]   p0_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p1_app_ss_st_tx_clk,
  input                                             p1_app_ss_st_tx_areset_n,
  input  [1-1:0]              p1_app_ss_st_tx_tvalid,
  output [1-1:0]              p1_ss_app_st_tx_tready,
  input  [PORT1_DATA_WIDTH-1:0]            p1_app_ss_st_tx_tdata,
  input  [(PORT1_DATA_WIDTH/8)-1:0]        p1_app_ss_st_tx_tkeep,
//  input  [PORT1_NO_OF_BYTES-1:0]   p1_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT1_NUM_OF_SEG * PORT1_NO_OF_BYTES)-1:0]  p1_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p1_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p1_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p1_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p1_app_ss_st_tx_tuser_client,
  input  [PORT1_NUM_OF_SEG-1:0]            p1_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT1_NUM_OF_SEG - 1)):0]     p1_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p1_app_ss_st_rx_clk,
  input                                             p1_app_ss_st_rx_areset_n,
  output [1-1:0]              p1_ss_app_st_rx_tvalid,
  output [PORT1_DATA_WIDTH-1:0]            p1_ss_app_st_rx_tdata,
  output [(PORT1_DATA_WIDTH/8)-1:0]        p1_ss_app_st_rx_tkeep,
  output [1-1:0]              p1_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p1_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p1_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p1_ss_app_st_rx_tuser_sts_extended,
  output [PORT1_NUM_OF_SEG-1:0]            p1_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT1_NUM_OF_SEG - 1)):0]   p1_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p2_app_ss_st_tx_clk,
  input                                             p2_app_ss_st_tx_areset_n,
  input  [1-1:0]              p2_app_ss_st_tx_tvalid,
  output [1-1:0]              p2_ss_app_st_tx_tready,
  input  [PORT2_DATA_WIDTH-1:0]            p2_app_ss_st_tx_tdata,
  input  [(PORT2_DATA_WIDTH/8)-1:0]        p2_app_ss_st_tx_tkeep,
//  input  [PORT2_NO_OF_BYTES-1:0]   p2_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT2_NUM_OF_SEG * PORT2_NO_OF_BYTES)-1:0]  p2_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p2_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p2_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p2_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p2_app_ss_st_tx_tuser_client,
  input  [PORT2_NUM_OF_SEG-1:0]            p2_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT2_NUM_OF_SEG - 1)):0]     p2_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p2_app_ss_st_rx_clk,
  input                                             p2_app_ss_st_rx_areset_n,
  output [1-1:0]              p2_ss_app_st_rx_tvalid,
  output [PORT2_DATA_WIDTH-1:0]            p2_ss_app_st_rx_tdata,
  output [(PORT2_DATA_WIDTH/8)-1:0]        p2_ss_app_st_rx_tkeep,
  output [1-1:0]              p2_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p2_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p2_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p2_ss_app_st_rx_tuser_sts_extended,
  output [PORT2_NUM_OF_SEG-1:0]            p2_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT2_NUM_OF_SEG - 1)):0]   p2_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p3_app_ss_st_tx_clk,
  input                                             p3_app_ss_st_tx_areset_n,
  input  [1-1:0]              p3_app_ss_st_tx_tvalid,
  output [1-1:0]              p3_ss_app_st_tx_tready,
  input  [PORT3_DATA_WIDTH-1:0]            p3_app_ss_st_tx_tdata,
  input  [(PORT3_DATA_WIDTH/8)-1:0]        p3_app_ss_st_tx_tkeep,
//  input  [PORT3_NO_OF_BYTES-1:0]   p3_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT3_NUM_OF_SEG * PORT3_NO_OF_BYTES)-1:0]  p3_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p3_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p3_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p3_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p3_app_ss_st_tx_tuser_client,
  input  [PORT3_NUM_OF_SEG-1:0]            p3_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT3_NUM_OF_SEG - 1)):0]     p3_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p3_app_ss_st_rx_clk,
  input                                             p3_app_ss_st_rx_areset_n,
  output [1-1:0]              p3_ss_app_st_rx_tvalid,
  output [PORT3_DATA_WIDTH-1:0]            p3_ss_app_st_rx_tdata,
  output [(PORT3_DATA_WIDTH/8)-1:0]        p3_ss_app_st_rx_tkeep,
  output [1-1:0]              p3_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p3_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p3_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p3_ss_app_st_rx_tuser_sts_extended,
  output [PORT3_NUM_OF_SEG-1:0]            p3_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT3_NUM_OF_SEG - 1)):0]   p3_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p4_app_ss_st_tx_clk,
  input                                             p4_app_ss_st_tx_areset_n,
  input  [1-1:0]              p4_app_ss_st_tx_tvalid,
  output [1-1:0]              p4_ss_app_st_tx_tready,
  input  [PORT4_DATA_WIDTH-1:0]            p4_app_ss_st_tx_tdata,
  input  [(PORT4_DATA_WIDTH/8)-1:0]        p4_app_ss_st_tx_tkeep,
//  input  [PORT4_NO_OF_BYTES-1:0]   p4_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT4_NUM_OF_SEG * PORT4_NO_OF_BYTES)-1:0]  p4_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p4_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p4_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p4_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p4_app_ss_st_tx_tuser_client,
  input  [PORT4_NUM_OF_SEG-1:0]            p4_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT4_NUM_OF_SEG - 1)):0]     p4_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p4_app_ss_st_rx_clk,
  input                                             p4_app_ss_st_rx_areset_n,
  output [1-1:0]              p4_ss_app_st_rx_tvalid,
  output [PORT4_DATA_WIDTH-1:0]            p4_ss_app_st_rx_tdata,
  output [(PORT4_DATA_WIDTH/8)-1:0]        p4_ss_app_st_rx_tkeep,
  output [1-1:0]              p4_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p4_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p4_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p4_ss_app_st_rx_tuser_sts_extended,
  output [PORT4_NUM_OF_SEG-1:0]            p4_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT4_NUM_OF_SEG - 1)):0]   p4_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p5_app_ss_st_tx_clk,
  input                                             p5_app_ss_st_tx_areset_n,
  input  [1-1:0]              p5_app_ss_st_tx_tvalid,
  output [1-1:0]              p5_ss_app_st_tx_tready,
  input  [PORT5_DATA_WIDTH-1:0]            p5_app_ss_st_tx_tdata,
  input  [(PORT5_DATA_WIDTH/8)-1:0]        p5_app_ss_st_tx_tkeep,
//  input  [PORT5_NO_OF_BYTES-1:0]   p5_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT5_NUM_OF_SEG * PORT5_NO_OF_BYTES)-1:0]  p5_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p5_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p5_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p5_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p5_app_ss_st_tx_tuser_client,
  input  [PORT5_NUM_OF_SEG-1:0]            p5_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT5_NUM_OF_SEG - 1)):0]     p5_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p5_app_ss_st_rx_clk,
  input                                             p5_app_ss_st_rx_areset_n,
  output [1-1:0]              p5_ss_app_st_rx_tvalid,
  output [PORT5_DATA_WIDTH-1:0]            p5_ss_app_st_rx_tdata,
  output [(PORT5_DATA_WIDTH/8)-1:0]        p5_ss_app_st_rx_tkeep,
  output [1-1:0]              p5_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p5_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p5_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p5_ss_app_st_rx_tuser_sts_extended,
  output [PORT5_NUM_OF_SEG-1:0]            p5_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT5_NUM_OF_SEG - 1)):0]   p5_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p6_app_ss_st_tx_clk,
  input                                             p6_app_ss_st_tx_areset_n,
  input  [1-1:0]              p6_app_ss_st_tx_tvalid,
  output [1-1:0]              p6_ss_app_st_tx_tready,
  input  [PORT6_DATA_WIDTH-1:0]            p6_app_ss_st_tx_tdata,
  input  [(PORT6_DATA_WIDTH/8)-1:0]        p6_app_ss_st_tx_tkeep,
//  input  [PORT6_NO_OF_BYTES-1:0]   p6_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT6_NUM_OF_SEG * PORT6_NO_OF_BYTES)-1:0]  p6_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p6_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p6_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p6_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p6_app_ss_st_tx_tuser_client,
  input  [PORT6_NUM_OF_SEG-1:0]            p6_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT6_NUM_OF_SEG - 1)):0]     p6_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p6_app_ss_st_rx_clk,
  input                                             p6_app_ss_st_rx_areset_n,
  output [1-1:0]              p6_ss_app_st_rx_tvalid,
  output [PORT6_DATA_WIDTH-1:0]            p6_ss_app_st_rx_tdata,
  output [(PORT6_DATA_WIDTH/8)-1:0]        p6_ss_app_st_rx_tkeep,
  output [1-1:0]              p6_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p6_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p6_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p6_ss_app_st_rx_tuser_sts_extended,
  output [PORT6_NUM_OF_SEG-1:0]            p6_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT6_NUM_OF_SEG - 1)):0]   p6_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p7_app_ss_st_tx_clk,
  input                                             p7_app_ss_st_tx_areset_n,
  input  [1-1:0]              p7_app_ss_st_tx_tvalid,
  output [1-1:0]              p7_ss_app_st_tx_tready,
  input  [PORT7_DATA_WIDTH-1:0]            p7_app_ss_st_tx_tdata,
  input  [(PORT7_DATA_WIDTH/8)-1:0]        p7_app_ss_st_tx_tkeep,
//  input  [PORT7_NO_OF_BYTES-1:0]   p7_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT7_NUM_OF_SEG * PORT7_NO_OF_BYTES)-1:0]  p7_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p7_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p7_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p7_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p7_app_ss_st_tx_tuser_client,
  input  [PORT7_NUM_OF_SEG-1:0]            p7_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT7_NUM_OF_SEG - 1)):0]     p7_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p7_app_ss_st_rx_clk,
  input                                             p7_app_ss_st_rx_areset_n,
  output [1-1:0]              p7_ss_app_st_rx_tvalid,
  output [PORT7_DATA_WIDTH-1:0]            p7_ss_app_st_rx_tdata,
  output [(PORT7_DATA_WIDTH/8)-1:0]        p7_ss_app_st_rx_tkeep,
  output [1-1:0]              p7_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p7_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p7_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p7_ss_app_st_rx_tuser_sts_extended,
  output [PORT7_NUM_OF_SEG-1:0]            p7_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT7_NUM_OF_SEG - 1)):0]   p7_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p8_app_ss_st_tx_clk,
  input                                             p8_app_ss_st_tx_areset_n,
  input  [1-1:0]              p8_app_ss_st_tx_tvalid,
  output [1-1:0]              p8_ss_app_st_tx_tready,
  input  [PORT8_DATA_WIDTH-1:0]            p8_app_ss_st_tx_tdata,
  input  [(PORT8_DATA_WIDTH/8)-1:0]        p8_app_ss_st_tx_tkeep,
//  input  [PORT8_NO_OF_BYTES-1:0]   p8_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT8_NUM_OF_SEG * PORT8_NO_OF_BYTES)-1:0]  p8_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p8_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p8_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p8_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p8_app_ss_st_tx_tuser_client,
  input  [PORT8_NUM_OF_SEG-1:0]            p8_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT8_NUM_OF_SEG - 1)):0]     p8_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p8_app_ss_st_rx_clk,
  input                                             p8_app_ss_st_rx_areset_n,
  output [1-1:0]              p8_ss_app_st_rx_tvalid,
  output [PORT8_DATA_WIDTH-1:0]            p8_ss_app_st_rx_tdata,
  output [(PORT8_DATA_WIDTH/8)-1:0]        p8_ss_app_st_rx_tkeep,
  output [1-1:0]              p8_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p8_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p8_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p8_ss_app_st_rx_tuser_sts_extended,
  output [PORT8_NUM_OF_SEG-1:0]            p8_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT8_NUM_OF_SEG - 1)):0]   p8_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p9_app_ss_st_tx_clk,
  input                                             p9_app_ss_st_tx_areset_n,
  input  [1-1:0]              p9_app_ss_st_tx_tvalid,
  output [1-1:0]              p9_ss_app_st_tx_tready,
  input  [PORT9_DATA_WIDTH-1:0]            p9_app_ss_st_tx_tdata,
  input  [(PORT9_DATA_WIDTH/8)-1:0]        p9_app_ss_st_tx_tkeep,
//  input  [PORT9_NO_OF_BYTES-1:0]   p9_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT9_NUM_OF_SEG * PORT9_NO_OF_BYTES)-1:0]  p9_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p9_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p9_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p9_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p9_app_ss_st_tx_tuser_client,
  input  [PORT9_NUM_OF_SEG-1:0]            p9_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT9_NUM_OF_SEG - 1)):0]     p9_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p9_app_ss_st_rx_clk,
  input                                             p9_app_ss_st_rx_areset_n,
  output [1-1:0]              p9_ss_app_st_rx_tvalid,
  output [PORT9_DATA_WIDTH-1:0]            p9_ss_app_st_rx_tdata,
  output [(PORT9_DATA_WIDTH/8)-1:0]        p9_ss_app_st_rx_tkeep,
  output [1-1:0]              p9_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p9_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p9_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p9_ss_app_st_rx_tuser_sts_extended,
  output [PORT9_NUM_OF_SEG-1:0]            p9_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT9_NUM_OF_SEG - 1)):0]   p9_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p10_app_ss_st_tx_clk,
  input                                             p10_app_ss_st_tx_areset_n,
  input  [1-1:0]              p10_app_ss_st_tx_tvalid,
  output [1-1:0]              p10_ss_app_st_tx_tready,
  input  [PORT10_DATA_WIDTH-1:0]            p10_app_ss_st_tx_tdata,
  input  [(PORT10_DATA_WIDTH/8)-1:0]        p10_app_ss_st_tx_tkeep,
//  input  [PORT10_NO_OF_BYTES-1:0]   p10_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT10_NUM_OF_SEG * PORT10_NO_OF_BYTES)-1:0]  p10_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p10_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p10_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p10_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p10_app_ss_st_tx_tuser_client,
  input  [PORT10_NUM_OF_SEG-1:0]            p10_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT10_NUM_OF_SEG - 1)):0]     p10_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p10_app_ss_st_rx_clk,
  input                                             p10_app_ss_st_rx_areset_n,
  output [1-1:0]              p10_ss_app_st_rx_tvalid,
  output [PORT10_DATA_WIDTH-1:0]            p10_ss_app_st_rx_tdata,
  output [(PORT10_DATA_WIDTH/8)-1:0]        p10_ss_app_st_rx_tkeep,
  output [1-1:0]              p10_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p10_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p10_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p10_ss_app_st_rx_tuser_sts_extended,
  output [PORT10_NUM_OF_SEG-1:0]            p10_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT10_NUM_OF_SEG - 1)):0]   p10_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p11_app_ss_st_tx_clk,
  input                                             p11_app_ss_st_tx_areset_n,
  input  [1-1:0]              p11_app_ss_st_tx_tvalid,
  output [1-1:0]              p11_ss_app_st_tx_tready,
  input  [PORT11_DATA_WIDTH-1:0]            p11_app_ss_st_tx_tdata,
  input  [(PORT11_DATA_WIDTH/8)-1:0]        p11_app_ss_st_tx_tkeep,
//  input  [PORT11_NO_OF_BYTES-1:0]   p11_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT11_NUM_OF_SEG * PORT11_NO_OF_BYTES)-1:0]  p11_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p11_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p11_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p11_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p11_app_ss_st_tx_tuser_client,
  input  [PORT11_NUM_OF_SEG-1:0]            p11_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT11_NUM_OF_SEG - 1)):0]     p11_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p11_app_ss_st_rx_clk,
  input                                             p11_app_ss_st_rx_areset_n,
  output [1-1:0]              p11_ss_app_st_rx_tvalid,
  output [PORT11_DATA_WIDTH-1:0]            p11_ss_app_st_rx_tdata,
  output [(PORT11_DATA_WIDTH/8)-1:0]        p11_ss_app_st_rx_tkeep,
  output [1-1:0]              p11_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p11_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p11_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p11_ss_app_st_rx_tuser_sts_extended,
  output [PORT11_NUM_OF_SEG-1:0]            p11_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT11_NUM_OF_SEG - 1)):0]   p11_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p12_app_ss_st_tx_clk,
  input                                             p12_app_ss_st_tx_areset_n,
  input  [1-1:0]              p12_app_ss_st_tx_tvalid,
  output [1-1:0]              p12_ss_app_st_tx_tready,
  input  [PORT12_DATA_WIDTH-1:0]            p12_app_ss_st_tx_tdata,
  input  [(PORT12_DATA_WIDTH/8)-1:0]        p12_app_ss_st_tx_tkeep,
//  input  [PORT12_NO_OF_BYTES-1:0]   p12_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT12_NUM_OF_SEG * PORT12_NO_OF_BYTES)-1:0]  p12_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p12_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p12_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p12_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p12_app_ss_st_tx_tuser_client,
  input  [PORT12_NUM_OF_SEG-1:0]            p12_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT12_NUM_OF_SEG - 1)):0]     p12_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p12_app_ss_st_rx_clk,
  input                                             p12_app_ss_st_rx_areset_n,
  output [1-1:0]              p12_ss_app_st_rx_tvalid,
  output [PORT12_DATA_WIDTH-1:0]            p12_ss_app_st_rx_tdata,
  output [(PORT12_DATA_WIDTH/8)-1:0]        p12_ss_app_st_rx_tkeep,
  output [1-1:0]              p12_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p12_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p12_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p12_ss_app_st_rx_tuser_sts_extended,
  output [PORT12_NUM_OF_SEG-1:0]            p12_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT12_NUM_OF_SEG - 1)):0]   p12_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p13_app_ss_st_tx_clk,
  input                                             p13_app_ss_st_tx_areset_n,
  input  [1-1:0]              p13_app_ss_st_tx_tvalid,
  output [1-1:0]              p13_ss_app_st_tx_tready,
  input  [PORT13_DATA_WIDTH-1:0]            p13_app_ss_st_tx_tdata,
  input  [(PORT13_DATA_WIDTH/8)-1:0]        p13_app_ss_st_tx_tkeep,
//  input  [PORT13_NO_OF_BYTES-1:0]   p13_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT13_NUM_OF_SEG * PORT13_NO_OF_BYTES)-1:0]  p13_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p13_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p13_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p13_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p13_app_ss_st_tx_tuser_client,
  input  [PORT13_NUM_OF_SEG-1:0]            p13_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT13_NUM_OF_SEG - 1)):0]     p13_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p13_app_ss_st_rx_clk,
  input                                             p13_app_ss_st_rx_areset_n,
  output [1-1:0]              p13_ss_app_st_rx_tvalid,
  output [PORT13_DATA_WIDTH-1:0]            p13_ss_app_st_rx_tdata,
  output [(PORT13_DATA_WIDTH/8)-1:0]        p13_ss_app_st_rx_tkeep,
  output [1-1:0]              p13_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p13_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p13_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p13_ss_app_st_rx_tuser_sts_extended,
  output [PORT13_NUM_OF_SEG-1:0]            p13_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT13_NUM_OF_SEG - 1)):0]   p13_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p14_app_ss_st_tx_clk,
  input                                             p14_app_ss_st_tx_areset_n,
  input  [1-1:0]              p14_app_ss_st_tx_tvalid,
  output [1-1:0]              p14_ss_app_st_tx_tready,
  input  [PORT14_DATA_WIDTH-1:0]            p14_app_ss_st_tx_tdata,
  input  [(PORT14_DATA_WIDTH/8)-1:0]        p14_app_ss_st_tx_tkeep,
//  input  [PORT14_NO_OF_BYTES-1:0]   p14_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT14_NUM_OF_SEG * PORT14_NO_OF_BYTES)-1:0]  p14_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p14_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p14_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p14_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p14_app_ss_st_tx_tuser_client,
  input  [PORT14_NUM_OF_SEG-1:0]            p14_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT14_NUM_OF_SEG - 1)):0]     p14_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p14_app_ss_st_rx_clk,
  input                                             p14_app_ss_st_rx_areset_n,
  output [1-1:0]              p14_ss_app_st_rx_tvalid,
  output [PORT14_DATA_WIDTH-1:0]            p14_ss_app_st_rx_tdata,
  output [(PORT14_DATA_WIDTH/8)-1:0]        p14_ss_app_st_rx_tkeep,
  output [1-1:0]              p14_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p14_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p14_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p14_ss_app_st_rx_tuser_sts_extended,
  output [PORT14_NUM_OF_SEG-1:0]            p14_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT14_NUM_OF_SEG - 1)):0]   p14_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p15_app_ss_st_tx_clk,
  input                                             p15_app_ss_st_tx_areset_n,
  input  [1-1:0]              p15_app_ss_st_tx_tvalid,
  output [1-1:0]              p15_ss_app_st_tx_tready,
  input  [PORT15_DATA_WIDTH-1:0]            p15_app_ss_st_tx_tdata,
  input  [(PORT15_DATA_WIDTH/8)-1:0]        p15_app_ss_st_tx_tkeep,
//  input  [PORT15_NO_OF_BYTES-1:0]   p15_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT15_NUM_OF_SEG * PORT15_NO_OF_BYTES)-1:0]  p15_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p15_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p15_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p15_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p15_app_ss_st_tx_tuser_client,
  input  [PORT15_NUM_OF_SEG-1:0]            p15_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT15_NUM_OF_SEG - 1)):0]     p15_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p15_app_ss_st_rx_clk,
  input                                             p15_app_ss_st_rx_areset_n,
  output [1-1:0]              p15_ss_app_st_rx_tvalid,
  output [PORT15_DATA_WIDTH-1:0]            p15_ss_app_st_rx_tdata,
  output [(PORT15_DATA_WIDTH/8)-1:0]        p15_ss_app_st_rx_tkeep,
  output [1-1:0]              p15_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p15_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p15_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p15_ss_app_st_rx_tuser_sts_extended,
  output [PORT15_NUM_OF_SEG-1:0]            p15_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT15_NUM_OF_SEG - 1)):0]   p15_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p16_app_ss_st_tx_clk,
  input                                             p16_app_ss_st_tx_areset_n,
  input  [1-1:0]              p16_app_ss_st_tx_tvalid,
  output [1-1:0]              p16_ss_app_st_tx_tready,
  input  [PORT16_DATA_WIDTH-1:0]            p16_app_ss_st_tx_tdata,
  input  [(PORT16_DATA_WIDTH/8)-1:0]        p16_app_ss_st_tx_tkeep,
//  input  [PORT16_NO_OF_BYTES-1:0]   p16_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT16_NUM_OF_SEG * PORT16_NO_OF_BYTES)-1:0]  p16_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p16_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p16_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p16_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p16_app_ss_st_tx_tuser_client,
  input  [PORT16_NUM_OF_SEG-1:0]            p16_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT16_NUM_OF_SEG - 1)):0]     p16_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p16_app_ss_st_rx_clk,
  input                                             p16_app_ss_st_rx_areset_n,
  output [1-1:0]              p16_ss_app_st_rx_tvalid,
  output [PORT16_DATA_WIDTH-1:0]            p16_ss_app_st_rx_tdata,
  output [(PORT16_DATA_WIDTH/8)-1:0]        p16_ss_app_st_rx_tkeep,
  output [1-1:0]              p16_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p16_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p16_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p16_ss_app_st_rx_tuser_sts_extended,
  output [PORT16_NUM_OF_SEG-1:0]            p16_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT16_NUM_OF_SEG - 1)):0]   p16_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p17_app_ss_st_tx_clk,
  input                                             p17_app_ss_st_tx_areset_n,
  input  [1-1:0]              p17_app_ss_st_tx_tvalid,
  output [1-1:0]              p17_ss_app_st_tx_tready,
  input  [PORT17_DATA_WIDTH-1:0]            p17_app_ss_st_tx_tdata,
  input  [(PORT17_DATA_WIDTH/8)-1:0]        p17_app_ss_st_tx_tkeep,
//  input  [PORT17_NO_OF_BYTES-1:0]   p17_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT17_NUM_OF_SEG * PORT17_NO_OF_BYTES)-1:0]  p17_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p17_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p17_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p17_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p17_app_ss_st_tx_tuser_client,
  input  [PORT17_NUM_OF_SEG-1:0]            p17_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT17_NUM_OF_SEG - 1)):0]     p17_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p17_app_ss_st_rx_clk,
  input                                             p17_app_ss_st_rx_areset_n,
  output [1-1:0]              p17_ss_app_st_rx_tvalid,
  output [PORT17_DATA_WIDTH-1:0]            p17_ss_app_st_rx_tdata,
  output [(PORT17_DATA_WIDTH/8)-1:0]        p17_ss_app_st_rx_tkeep,
  output [1-1:0]              p17_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p17_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p17_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p17_ss_app_st_rx_tuser_sts_extended,
  output [PORT17_NUM_OF_SEG-1:0]            p17_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT17_NUM_OF_SEG - 1)):0]   p17_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p18_app_ss_st_tx_clk,
  input                                             p18_app_ss_st_tx_areset_n,
  input  [1-1:0]              p18_app_ss_st_tx_tvalid,
  output [1-1:0]              p18_ss_app_st_tx_tready,
  input  [PORT18_DATA_WIDTH-1:0]            p18_app_ss_st_tx_tdata,
  input  [(PORT18_DATA_WIDTH/8)-1:0]        p18_app_ss_st_tx_tkeep,
//  input  [PORT18_NO_OF_BYTES-1:0]   p18_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT18_NUM_OF_SEG * PORT18_NO_OF_BYTES)-1:0]  p18_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p18_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p18_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p18_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p18_app_ss_st_tx_tuser_client,
  input  [PORT18_NUM_OF_SEG-1:0]            p18_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT18_NUM_OF_SEG - 1)):0]     p18_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p18_app_ss_st_rx_clk,
  input                                             p18_app_ss_st_rx_areset_n,
  output [1-1:0]              p18_ss_app_st_rx_tvalid,
  output [PORT18_DATA_WIDTH-1:0]            p18_ss_app_st_rx_tdata,
  output [(PORT18_DATA_WIDTH/8)-1:0]        p18_ss_app_st_rx_tkeep,
  output [1-1:0]              p18_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p18_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p18_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p18_ss_app_st_rx_tuser_sts_extended,
  output [PORT18_NUM_OF_SEG-1:0]            p18_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT18_NUM_OF_SEG - 1)):0]   p18_ss_app_st_rx_tuser_pkt_seg_parity,
  input                                             p19_app_ss_st_tx_clk,
  input                                             p19_app_ss_st_tx_areset_n,
  input  [1-1:0]              p19_app_ss_st_tx_tvalid,
  output [1-1:0]              p19_ss_app_st_tx_tready,
  input  [PORT19_DATA_WIDTH-1:0]            p19_app_ss_st_tx_tdata,
  input  [(PORT19_DATA_WIDTH/8)-1:0]        p19_app_ss_st_tx_tkeep,
//  input  [PORT19_NO_OF_BYTES-1:0]   p19_app_ss_st_tx_tkeep,
// We are using same signal tkeep for both AVST & MAC_SEG
//  input  [(PORT19_NUM_OF_SEG * PORT19_NO_OF_BYTES)-1:0]  p19_app_ss_st_tx_tkeep_segment,
  input  [1-1:0]              p19_app_ss_st_tx_tlast,
  input  [(1*94)-1:0]         p19_app_ss_st_tx_tuser_ptp,
  input  [(1*328)-1:0]        p19_app_ss_st_tx_tuser_ptp_extended,
  input  [2*64/64-1:0]     p19_app_ss_st_tx_tuser_client,
  input  [PORT19_NUM_OF_SEG-1:0]            p19_app_ss_st_tx_tuser_last_segment,
  input  [((0 == 1)? (1-1) : (PORT19_NUM_OF_SEG - 1)):0]     p19_app_ss_st_tx_tuser_pkt_seg_parity,
  // ----------------------------------------------------------------------
  input                                             p19_app_ss_st_rx_clk,
  input                                             p19_app_ss_st_rx_areset_n,
  output [1-1:0]              p19_ss_app_st_rx_tvalid,
  output [PORT19_DATA_WIDTH-1:0]            p19_ss_app_st_rx_tdata,
  output [(PORT19_DATA_WIDTH/8)-1:0]        p19_ss_app_st_rx_tkeep,
  output [1-1:0]              p19_ss_app_st_rx_tlast,
  output [7*64/64-1:0]     p19_ss_app_st_rx_tuser_client,
  output [5*64/64-1:0]        p19_ss_app_st_rx_tuser_sts,
  output [31:0]                                     p19_ss_app_st_rx_tuser_sts_extended,
  output [PORT19_NUM_OF_SEG-1:0]            p19_ss_app_st_rx_tuser_last_segment,
  output [((0 == 1)? (1-1) : (PORT19_NUM_OF_SEG - 1)):0]   p19_ss_app_st_rx_tuser_pkt_seg_parity,
    
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
  input                           p16_app_ss_st_txphydirect_clk,
  input                           p16_app_ss_st_txphydirect_areset_n,
  input  [PORT16_DATA_WIDTH-1:0]   p16_app_ss_st_txphydirect_tdata,
  input                           p16_app_ss_st_txphydirect_tvalid,
  output                          p16_ss_app_st_txphydirect_tready,
  input                           p16_app_ss_st_rxphydirect_clk,
  input                           p16_app_ss_st_rxphydirect_areset_n,
  output [PORT16_DATA_WIDTH-1:0]   p16_ss_app_st_rxphydirect_tdata,
  output                          p16_ss_app_st_rxphydirect_tvalid,
  input                           p17_app_ss_st_txphydirect_clk,
  input                           p17_app_ss_st_txphydirect_areset_n,
  input  [PORT17_DATA_WIDTH-1:0]   p17_app_ss_st_txphydirect_tdata,
  input                           p17_app_ss_st_txphydirect_tvalid,
  output                          p17_ss_app_st_txphydirect_tready,
  input                           p17_app_ss_st_rxphydirect_clk,
  input                           p17_app_ss_st_rxphydirect_areset_n,
  output [PORT17_DATA_WIDTH-1:0]   p17_ss_app_st_rxphydirect_tdata,
  output                          p17_ss_app_st_rxphydirect_tvalid,
  input                           p18_app_ss_st_txphydirect_clk,
  input                           p18_app_ss_st_txphydirect_areset_n,
  input  [PORT18_DATA_WIDTH-1:0]   p18_app_ss_st_txphydirect_tdata,
  input                           p18_app_ss_st_txphydirect_tvalid,
  output                          p18_ss_app_st_txphydirect_tready,
  input                           p18_app_ss_st_rxphydirect_clk,
  input                           p18_app_ss_st_rxphydirect_areset_n,
  output [PORT18_DATA_WIDTH-1:0]   p18_ss_app_st_rxphydirect_tdata,
  output                          p18_ss_app_st_rxphydirect_tvalid,
  input                           p19_app_ss_st_txphydirect_clk,
  input                           p19_app_ss_st_txphydirect_areset_n,
  input  [PORT19_DATA_WIDTH-1:0]   p19_app_ss_st_txphydirect_tdata,
  input                           p19_app_ss_st_txphydirect_tvalid,
  output                          p19_ss_app_st_txphydirect_tready,
  input                           p19_app_ss_st_rxphydirect_clk,
  input                           p19_app_ss_st_rxphydirect_areset_n,
  output [PORT19_DATA_WIDTH-1:0]   p19_ss_app_st_rxphydirect_tdata,
  output                          p19_ss_app_st_rxphydirect_tvalid,
  // ---------------------------------------                                 
// 25G <---> CPRI DR 
  // -------------------------------
  // AXI ST Tx/Rx ToD Interface Signals
  // -------------------------------
  // Keeping same as MRIP interface
  input                           p0_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p0_app_ss_st_txtod_tdata,
  input                           p0_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p0_app_ss_st_rxtod_tdata,
  input                           p1_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p1_app_ss_st_txtod_tdata,
  input                           p1_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p1_app_ss_st_rxtod_tdata,
  input                           p2_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p2_app_ss_st_txtod_tdata,
  input                           p2_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p2_app_ss_st_rxtod_tdata,
  input                           p3_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p3_app_ss_st_txtod_tdata,
  input                           p3_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p3_app_ss_st_rxtod_tdata,
  input                           p4_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p4_app_ss_st_txtod_tdata,
  input                           p4_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p4_app_ss_st_rxtod_tdata,
  input                           p5_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p5_app_ss_st_txtod_tdata,
  input                           p5_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p5_app_ss_st_rxtod_tdata,
  input                           p6_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p6_app_ss_st_txtod_tdata,
  input                           p6_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p6_app_ss_st_rxtod_tdata,
  input                           p7_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p7_app_ss_st_txtod_tdata,
  input                           p7_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p7_app_ss_st_rxtod_tdata,
  input                           p8_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p8_app_ss_st_txtod_tdata,
  input                           p8_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p8_app_ss_st_rxtod_tdata,
  input                           p9_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p9_app_ss_st_txtod_tdata,
  input                           p9_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p9_app_ss_st_rxtod_tdata,
  input                           p10_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p10_app_ss_st_txtod_tdata,
  input                           p10_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p10_app_ss_st_rxtod_tdata,
  input                           p11_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p11_app_ss_st_txtod_tdata,
  input                           p11_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p11_app_ss_st_rxtod_tdata,
  input                           p12_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p12_app_ss_st_txtod_tdata,
  input                           p12_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p12_app_ss_st_rxtod_tdata,
  input                           p13_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p13_app_ss_st_txtod_tdata,
  input                           p13_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p13_app_ss_st_rxtod_tdata,
  input                           p14_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p14_app_ss_st_txtod_tdata,
  input                           p14_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p14_app_ss_st_rxtod_tdata,
  input                           p15_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p15_app_ss_st_txtod_tdata,
  input                           p15_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p15_app_ss_st_rxtod_tdata,
  input                           p16_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p16_app_ss_st_txtod_tdata,
  input                           p16_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p16_app_ss_st_rxtod_tdata,
  input                           p17_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p17_app_ss_st_txtod_tdata,
  input                           p17_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p17_app_ss_st_rxtod_tdata,
  input                           p18_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p18_app_ss_st_txtod_tdata,
  input                           p18_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p18_app_ss_st_rxtod_tdata,
  input                           p19_app_ss_st_txtod_tvalid,
  input  [96-1:0]                 p19_app_ss_st_txtod_tdata,
  input                           p19_app_ss_st_rxtod_tvalid,
  input  [96-1:0]                 p19_app_ss_st_rxtod_tdata,


  // ----------------------------------------------
  // AXI ST Tx/Rx Egress Timestamp Interface Signals
  // ----------------------------------------------
  output                                           p0_ss_app_st_txegrts0_tvalid,
  output [(PORT0_PTP_FP_WIDTH+96)-1:0]    p0_ss_app_st_txegrts0_tdata,
  output                                           p0_ss_app_st_txegrts1_tvalid,
  output [(PORT0_PTP_FP_WIDTH+96)-1:0]    p0_ss_app_st_txegrts1_tdata,
  output                                           p1_ss_app_st_txegrts0_tvalid,
  output [(PORT1_PTP_FP_WIDTH+96)-1:0]    p1_ss_app_st_txegrts0_tdata,
  output                                           p1_ss_app_st_txegrts1_tvalid,
  output [(PORT1_PTP_FP_WIDTH+96)-1:0]    p1_ss_app_st_txegrts1_tdata,
  output                                           p2_ss_app_st_txegrts0_tvalid,
  output [(PORT2_PTP_FP_WIDTH+96)-1:0]    p2_ss_app_st_txegrts0_tdata,
  output                                           p2_ss_app_st_txegrts1_tvalid,
  output [(PORT2_PTP_FP_WIDTH+96)-1:0]    p2_ss_app_st_txegrts1_tdata,
  output                                           p3_ss_app_st_txegrts0_tvalid,
  output [(PORT3_PTP_FP_WIDTH+96)-1:0]    p3_ss_app_st_txegrts0_tdata,
  output                                           p3_ss_app_st_txegrts1_tvalid,
  output [(PORT3_PTP_FP_WIDTH+96)-1:0]    p3_ss_app_st_txegrts1_tdata,
  output                                           p4_ss_app_st_txegrts0_tvalid,
  output [(PORT4_PTP_FP_WIDTH+96)-1:0]    p4_ss_app_st_txegrts0_tdata,
  output                                           p4_ss_app_st_txegrts1_tvalid,
  output [(PORT4_PTP_FP_WIDTH+96)-1:0]    p4_ss_app_st_txegrts1_tdata,
  output                                           p5_ss_app_st_txegrts0_tvalid,
  output [(PORT5_PTP_FP_WIDTH+96)-1:0]    p5_ss_app_st_txegrts0_tdata,
  output                                           p5_ss_app_st_txegrts1_tvalid,
  output [(PORT5_PTP_FP_WIDTH+96)-1:0]    p5_ss_app_st_txegrts1_tdata,
  output                                           p6_ss_app_st_txegrts0_tvalid,
  output [(PORT6_PTP_FP_WIDTH+96)-1:0]    p6_ss_app_st_txegrts0_tdata,
  output                                           p6_ss_app_st_txegrts1_tvalid,
  output [(PORT6_PTP_FP_WIDTH+96)-1:0]    p6_ss_app_st_txegrts1_tdata,
  output                                           p7_ss_app_st_txegrts0_tvalid,
  output [(PORT7_PTP_FP_WIDTH+96)-1:0]    p7_ss_app_st_txegrts0_tdata,
  output                                           p7_ss_app_st_txegrts1_tvalid,
  output [(PORT7_PTP_FP_WIDTH+96)-1:0]    p7_ss_app_st_txegrts1_tdata,
  output                                           p8_ss_app_st_txegrts0_tvalid,
  output [(PORT8_PTP_FP_WIDTH+96)-1:0]    p8_ss_app_st_txegrts0_tdata,
  output                                           p8_ss_app_st_txegrts1_tvalid,
  output [(PORT8_PTP_FP_WIDTH+96)-1:0]    p8_ss_app_st_txegrts1_tdata,
  output                                           p9_ss_app_st_txegrts0_tvalid,
  output [(PORT9_PTP_FP_WIDTH+96)-1:0]    p9_ss_app_st_txegrts0_tdata,
  output                                           p9_ss_app_st_txegrts1_tvalid,
  output [(PORT9_PTP_FP_WIDTH+96)-1:0]    p9_ss_app_st_txegrts1_tdata,
  output                                           p10_ss_app_st_txegrts0_tvalid,
  output [(PORT10_PTP_FP_WIDTH+96)-1:0]    p10_ss_app_st_txegrts0_tdata,
  output                                           p10_ss_app_st_txegrts1_tvalid,
  output [(PORT10_PTP_FP_WIDTH+96)-1:0]    p10_ss_app_st_txegrts1_tdata,
  output                                           p11_ss_app_st_txegrts0_tvalid,
  output [(PORT11_PTP_FP_WIDTH+96)-1:0]    p11_ss_app_st_txegrts0_tdata,
  output                                           p11_ss_app_st_txegrts1_tvalid,
  output [(PORT11_PTP_FP_WIDTH+96)-1:0]    p11_ss_app_st_txegrts1_tdata,
  output                                           p12_ss_app_st_txegrts0_tvalid,
  output [(PORT12_PTP_FP_WIDTH+96)-1:0]    p12_ss_app_st_txegrts0_tdata,
  output                                           p12_ss_app_st_txegrts1_tvalid,
  output [(PORT12_PTP_FP_WIDTH+96)-1:0]    p12_ss_app_st_txegrts1_tdata,
  output                                           p13_ss_app_st_txegrts0_tvalid,
  output [(PORT13_PTP_FP_WIDTH+96)-1:0]    p13_ss_app_st_txegrts0_tdata,
  output                                           p13_ss_app_st_txegrts1_tvalid,
  output [(PORT13_PTP_FP_WIDTH+96)-1:0]    p13_ss_app_st_txegrts1_tdata,
  output                                           p14_ss_app_st_txegrts0_tvalid,
  output [(PORT14_PTP_FP_WIDTH+96)-1:0]    p14_ss_app_st_txegrts0_tdata,
  output                                           p14_ss_app_st_txegrts1_tvalid,
  output [(PORT14_PTP_FP_WIDTH+96)-1:0]    p14_ss_app_st_txegrts1_tdata,
  output                                           p15_ss_app_st_txegrts0_tvalid,
  output [(PORT15_PTP_FP_WIDTH+96)-1:0]    p15_ss_app_st_txegrts0_tdata,
  output                                           p15_ss_app_st_txegrts1_tvalid,
  output [(PORT15_PTP_FP_WIDTH+96)-1:0]    p15_ss_app_st_txegrts1_tdata,
  output                                           p16_ss_app_st_txegrts0_tvalid,
  output [(PORT16_PTP_FP_WIDTH+96)-1:0]    p16_ss_app_st_txegrts0_tdata,
  output                                           p16_ss_app_st_txegrts1_tvalid,
  output [(PORT16_PTP_FP_WIDTH+96)-1:0]    p16_ss_app_st_txegrts1_tdata,
  output                                           p17_ss_app_st_txegrts0_tvalid,
  output [(PORT17_PTP_FP_WIDTH+96)-1:0]    p17_ss_app_st_txegrts0_tdata,
  output                                           p17_ss_app_st_txegrts1_tvalid,
  output [(PORT17_PTP_FP_WIDTH+96)-1:0]    p17_ss_app_st_txegrts1_tdata,
  output                                           p18_ss_app_st_txegrts0_tvalid,
  output [(PORT18_PTP_FP_WIDTH+96)-1:0]    p18_ss_app_st_txegrts0_tdata,
  output                                           p18_ss_app_st_txegrts1_tvalid,
  output [(PORT18_PTP_FP_WIDTH+96)-1:0]    p18_ss_app_st_txegrts1_tdata,
  output                                           p19_ss_app_st_txegrts0_tvalid,
  output [(PORT19_PTP_FP_WIDTH+96)-1:0]    p19_ss_app_st_txegrts0_tdata,
  output                                           p19_ss_app_st_txegrts1_tvalid,
  output [(PORT19_PTP_FP_WIDTH+96)-1:0]    p19_ss_app_st_txegrts1_tdata,


  output             p0_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p0_ss_app_st_rxingrts0_tdata,
  output             p0_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p0_ss_app_st_rxingrts1_tdata,
  output             p1_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p1_ss_app_st_rxingrts0_tdata,
  output             p1_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p1_ss_app_st_rxingrts1_tdata,
  output             p2_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p2_ss_app_st_rxingrts0_tdata,
  output             p2_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p2_ss_app_st_rxingrts1_tdata,
  output             p3_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p3_ss_app_st_rxingrts0_tdata,
  output             p3_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p3_ss_app_st_rxingrts1_tdata,
  output             p4_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p4_ss_app_st_rxingrts0_tdata,
  output             p4_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p4_ss_app_st_rxingrts1_tdata,
  output             p5_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p5_ss_app_st_rxingrts0_tdata,
  output             p5_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p5_ss_app_st_rxingrts1_tdata,
  output             p6_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p6_ss_app_st_rxingrts0_tdata,
  output             p6_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p6_ss_app_st_rxingrts1_tdata,
  output             p7_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p7_ss_app_st_rxingrts0_tdata,
  output             p7_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p7_ss_app_st_rxingrts1_tdata,
  output             p8_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p8_ss_app_st_rxingrts0_tdata,
  output             p8_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p8_ss_app_st_rxingrts1_tdata,
  output             p9_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p9_ss_app_st_rxingrts0_tdata,
  output             p9_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p9_ss_app_st_rxingrts1_tdata,
  output             p10_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p10_ss_app_st_rxingrts0_tdata,
  output             p10_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p10_ss_app_st_rxingrts1_tdata,
  output             p11_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p11_ss_app_st_rxingrts0_tdata,
  output             p11_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p11_ss_app_st_rxingrts1_tdata,
  output             p12_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p12_ss_app_st_rxingrts0_tdata,
  output             p12_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p12_ss_app_st_rxingrts1_tdata,
  output             p13_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p13_ss_app_st_rxingrts0_tdata,
  output             p13_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p13_ss_app_st_rxingrts1_tdata,
  output             p14_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p14_ss_app_st_rxingrts0_tdata,
  output             p14_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p14_ss_app_st_rxingrts1_tdata,
  output             p15_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p15_ss_app_st_rxingrts0_tdata,
  output             p15_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p15_ss_app_st_rxingrts1_tdata,
  output             p16_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p16_ss_app_st_rxingrts0_tdata,
  output             p16_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p16_ss_app_st_rxingrts1_tdata,
  output             p17_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p17_ss_app_st_rxingrts0_tdata,
  output             p17_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p17_ss_app_st_rxingrts1_tdata,
  output             p18_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p18_ss_app_st_rxingrts0_tdata,
  output             p18_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p18_ss_app_st_rxingrts1_tdata,
  output             p19_ss_app_st_rxingrts0_tvalid,
  output [96-1:0]    p19_ss_app_st_rxingrts0_tdata,
  output             p19_ss_app_st_rxingrts1_tvalid,
  output [96-1:0]    p19_ss_app_st_rxingrts1_tdata,


  // -----------------
  // Flow control signals, valid for MAC case only
  // -----------------
  input                        i_p0_tx_pause,
  output                       o_p0_rx_pause,
  input                        i_p1_tx_pause,
  output                       o_p1_rx_pause,
  input                        i_p2_tx_pause,
  output                       o_p2_rx_pause,
  input                        i_p3_tx_pause,
  output                       o_p3_rx_pause,
  input                        i_p4_tx_pause,
  output                       o_p4_rx_pause,
  input                        i_p5_tx_pause,
  output                       o_p5_rx_pause,
  input                        i_p6_tx_pause,
  output                       o_p6_rx_pause,
  input                        i_p7_tx_pause,
  output                       o_p7_rx_pause,
  input                        i_p8_tx_pause,
  output                       o_p8_rx_pause,
  input                        i_p9_tx_pause,
  output                       o_p9_rx_pause,
  input                        i_p10_tx_pause,
  output                       o_p10_rx_pause,
  input                        i_p11_tx_pause,
  output                       o_p11_rx_pause,
  input                        i_p12_tx_pause,
  output                       o_p12_rx_pause,
  input                        i_p13_tx_pause,
  output                       o_p13_rx_pause,
  input                        i_p14_tx_pause,
  output                       o_p14_rx_pause,
  input                        i_p15_tx_pause,
  output                       o_p15_rx_pause,
  input                        i_p16_tx_pause,
  output                       o_p16_rx_pause,
  input                        i_p17_tx_pause,
  output                       o_p17_rx_pause,
  input                        i_p18_tx_pause,
  output                       o_p18_rx_pause,
  input                        i_p19_tx_pause,
  output                       o_p19_rx_pause,

  input  [8-1:0]               i_p0_tx_pfc,
  output [8-1:0]               o_p0_rx_pfc,
  input  [8-1:0]               i_p1_tx_pfc,
  output [8-1:0]               o_p1_rx_pfc,
  input  [8-1:0]               i_p2_tx_pfc,
  output [8-1:0]               o_p2_rx_pfc,
  input  [8-1:0]               i_p3_tx_pfc,
  output [8-1:0]               o_p3_rx_pfc,
  input  [8-1:0]               i_p4_tx_pfc,
  output [8-1:0]               o_p4_rx_pfc,
  input  [8-1:0]               i_p5_tx_pfc,
  output [8-1:0]               o_p5_rx_pfc,
  input  [8-1:0]               i_p6_tx_pfc,
  output [8-1:0]               o_p6_rx_pfc,
  input  [8-1:0]               i_p7_tx_pfc,
  output [8-1:0]               o_p7_rx_pfc,
  input  [8-1:0]               i_p8_tx_pfc,
  output [8-1:0]               o_p8_rx_pfc,
  input  [8-1:0]               i_p9_tx_pfc,
  output [8-1:0]               o_p9_rx_pfc,
  input  [8-1:0]               i_p10_tx_pfc,
  output [8-1:0]               o_p10_rx_pfc,
  input  [8-1:0]               i_p11_tx_pfc,
  output [8-1:0]               o_p11_rx_pfc,
  input  [8-1:0]               i_p12_tx_pfc,
  output [8-1:0]               o_p12_rx_pfc,
  input  [8-1:0]               i_p13_tx_pfc,
  output [8-1:0]               o_p13_rx_pfc,
  input  [8-1:0]               i_p14_tx_pfc,
  output [8-1:0]               o_p14_rx_pfc,
  input  [8-1:0]               i_p15_tx_pfc,
  output [8-1:0]               o_p15_rx_pfc,
  input  [8-1:0]               i_p16_tx_pfc,
  output [8-1:0]               o_p16_rx_pfc,
  input  [8-1:0]               i_p17_tx_pfc,
  output [8-1:0]               o_p17_rx_pfc,
  input  [8-1:0]               i_p18_tx_pfc,
  output [8-1:0]               o_p18_rx_pfc,
  input  [8-1:0]               i_p19_tx_pfc,
  output [8-1:0]               o_p19_rx_pfc,


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

  input  [PORT16_XCVR_CHANNEL-1:0]      p16_rx_serial,
  input  [PORT16_XCVR_CHANNEL-1:0]      p16_rx_serial_n,
  output [PORT16_XCVR_CHANNEL-1:0]      p16_tx_serial,
  output [PORT16_XCVR_CHANNEL-1:0]      p16_tx_serial_n,

  input  [PORT17_XCVR_CHANNEL-1:0]      p17_rx_serial,
  input  [PORT17_XCVR_CHANNEL-1:0]      p17_rx_serial_n,
  output [PORT17_XCVR_CHANNEL-1:0]      p17_tx_serial,
  output [PORT17_XCVR_CHANNEL-1:0]      p17_tx_serial_n,

  input  [PORT18_XCVR_CHANNEL-1:0]      p18_rx_serial,
  input  [PORT18_XCVR_CHANNEL-1:0]      p18_rx_serial_n,
  output [PORT18_XCVR_CHANNEL-1:0]      p18_tx_serial,
  output [PORT18_XCVR_CHANNEL-1:0]      p18_tx_serial_n,

  input  [PORT19_XCVR_CHANNEL-1:0]      p19_rx_serial,
  input  [PORT19_XCVR_CHANNEL-1:0]      p19_rx_serial_n,
  output [PORT19_XCVR_CHANNEL-1:0]      p19_tx_serial,
  output [PORT19_XCVR_CHANNEL-1:0]      p19_tx_serial_n,

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
  output [9:0]                    p16_tbi_tx_d,
  input                           p16_tbi_tx_clk,
  input                           p16_tbi_rx_clk,
  input  [9:0]                    p16_tbi_rx_d,
  output [9:0]                    p17_tbi_tx_d,
  input                           p17_tbi_tx_clk,
  input                           p17_tbi_rx_clk,
  input  [9:0]                    p17_tbi_rx_d,
  output [9:0]                    p18_tbi_tx_d,
  input                           p18_tbi_tx_clk,
  input                           p18_tbi_rx_clk,
  input  [9:0]                    p18_tbi_rx_d,
  output [9:0]                    p19_tbi_tx_d,
  input                           p19_tbi_tx_clk,
  input                           p19_tbi_rx_clk,
  input  [9:0]                    p19_tbi_rx_d,
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
  input                           p16_mdio_in,
  output                          p16_mdio_out,
  output                          p16_mdio_oen,
  output                          p16_mdc,
  input                           p17_mdio_in,
  output                          p17_mdio_out,
  output                          p17_mdio_oen,
  output                          p17_mdc,
  input                           p18_mdio_in,
  output                          p18_mdio_out,
  output                          p18_mdio_oen,
  output                          p18_mdc,
  input                           p19_mdio_in,
  output                          p19_mdio_out,
  output                          p19_mdio_oen,
  output                          p19_mdc,
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

  output                          p16_led_link,
  output                          p16_led_panel_link,
  output                          p16_led_crs,
  output                          p16_led_col,
  output                          p16_led_an,
  output                          p16_led_char_err,
  output                          p16_led_disp_err,

  output                          p17_led_link,
  output                          p17_led_panel_link,
  output                          p17_led_crs,
  output                          p17_led_col,
  output                          p17_led_an,
  output                          p17_led_char_err,
  output                          p17_led_disp_err,

  output                          p18_led_link,
  output                          p18_led_panel_link,
  output                          p18_led_crs,
  output                          p18_led_col,
  output                          p18_led_an,
  output                          p18_led_char_err,
  output                          p18_led_disp_err,

  output                          p19_led_link,
  output                          p19_led_panel_link,
  output                          p19_led_crs,
  output                          p19_led_col,
  output                          p19_led_an,
  output                          p19_led_char_err,
  output                          p19_led_disp_err,


  // -----------------------------------------
  // Multi Streaming AXI Interface. Declare everytime?
  // -----------------------------------------

  // -----------------------------------------
  // Miscellaneous Functional Signal Interface
  // -----------------------------------------
  output                          p0_tx_lanes_stable,
  output                          p0_rx_pcs_ready,
  output                          o_p0_rx_pcs_fully_aligned,
  output                          o_p0_tx_pll_locked,
  output                          o_p0_tx_ptp_ready,
  output                          o_p0_rx_ptp_ready,
  output                          o_p0_tx_ptp_offset_data_valid,
  output                          o_p0_rx_ptp_offset_data_valid,
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
  output                          p16_tx_pma_ready_a,
  output                          p16_rx_pma_ready_a,
  //
  output                          p16_tx_maib_fifo_full,
  output                          p16_tx_maib_fifo_empty_a,
  output                          p16_tx_maib_fifo_pfull,
  output                          p16_tx_maib_fifo_pempty_a,
  //
  input                           p16_rx_maib_fifo_rd_en,
  output                          p16_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p16_rx_maib_fifo_empty,
  output                          p16_rx_maib_fifo_pfull_a,
  output                          p16_rx_maib_fifo_pempty,
  input                           i_p16_custom_cadence, 
  output                          p17_tx_pma_ready_a,
  output                          p17_rx_pma_ready_a,
  //
  output                          p17_tx_maib_fifo_full,
  output                          p17_tx_maib_fifo_empty_a,
  output                          p17_tx_maib_fifo_pfull,
  output                          p17_tx_maib_fifo_pempty_a,
  //
  input                           p17_rx_maib_fifo_rd_en,
  output                          p17_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p17_rx_maib_fifo_empty,
  output                          p17_rx_maib_fifo_pfull_a,
  output                          p17_rx_maib_fifo_pempty,
  input                           i_p17_custom_cadence, 
  output                          p18_tx_pma_ready_a,
  output                          p18_rx_pma_ready_a,
  //
  output                          p18_tx_maib_fifo_full,
  output                          p18_tx_maib_fifo_empty_a,
  output                          p18_tx_maib_fifo_pfull,
  output                          p18_tx_maib_fifo_pempty_a,
  //
  input                           p18_rx_maib_fifo_rd_en,
  output                          p18_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p18_rx_maib_fifo_empty,
  output                          p18_rx_maib_fifo_pfull_a,
  output                          p18_rx_maib_fifo_pempty,
  input                           i_p18_custom_cadence, 
  output                          p19_tx_pma_ready_a,
  output                          p19_rx_pma_ready_a,
  //
  output                          p19_tx_maib_fifo_full,
  output                          p19_tx_maib_fifo_empty_a,
  output                          p19_tx_maib_fifo_pfull,
  output                          p19_tx_maib_fifo_pempty_a,
  //
  input                           p19_rx_maib_fifo_rd_en,
  output                          p19_rx_maib_fifo_full_a, //TBD rxfifo_rd_en?
  output                          p19_rx_maib_fifo_empty,
  output                          p19_rx_maib_fifo_pfull_a,
  output                          p19_rx_maib_fifo_pempty,
  input                           i_p19_custom_cadence, 

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
  output                          o_p16_sl_tx_dl_async_pulse,
  output                          o_p16_sl_rx_dl_async_pulse,
  input                           i_p16_sl_latency_sclk,
  input                           i_p16_sl_tx_dl_measure_sel,
  input                           i_p16_sl_rx_dl_measure_sel,
  output                          o_p17_sl_tx_dl_async_pulse,
  output                          o_p17_sl_rx_dl_async_pulse,
  input                           i_p17_sl_latency_sclk,
  input                           i_p17_sl_tx_dl_measure_sel,
  input                           i_p17_sl_rx_dl_measure_sel,
  output                          o_p18_sl_tx_dl_async_pulse,
  output                          o_p18_sl_rx_dl_async_pulse,
  input                           i_p18_sl_latency_sclk,
  input                           i_p18_sl_tx_dl_measure_sel,
  input                           i_p18_sl_rx_dl_measure_sel,
  output                          o_p19_sl_tx_dl_async_pulse,
  output                          o_p19_sl_rx_dl_async_pulse,
  input                           i_p19_sl_latency_sclk,
  input                           i_p19_sl_tx_dl_measure_sel,
  input                           i_p19_sl_rx_dl_measure_sel,
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
  output                          o_p16_txfifo_pfull, //TBD already there
  output                          o_p16_txfifo_pempty,
  output                          o_p16_txfifo_overflow,
  output                          o_p16_txfifo_underflow,
  output                          o_p17_txfifo_pfull, //TBD already there
  output                          o_p17_txfifo_pempty,
  output                          o_p17_txfifo_overflow,
  output                          o_p17_txfifo_underflow,
  output                          o_p18_txfifo_pfull, //TBD already there
  output                          o_p18_txfifo_pempty,
  output                          o_p18_txfifo_overflow,
  output                          o_p18_txfifo_underflow,
  output                          o_p19_txfifo_pfull, //TBD already there
  output                          o_p19_txfifo_pempty,
  output                          o_p19_txfifo_overflow,
  output                          o_p19_txfifo_underflow,
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
  output [2:0]                    port16_led_speed,
  output [2:0]                    port16_led_status,
  output [2:0]                    port17_led_speed,
  output [2:0]                    port17_led_status,
  output [2:0]                    port18_led_speed,
  output [2:0]                    port18_led_status,
  output [2:0]                    port19_led_speed,
  output [2:0]                    port19_led_status,
  
  output tp //dummy
);


    localparam SIM_MODE_EN      = 0;
    localparam ENABLE_DUMMY_WAIT_REQ_GEN             = 1'b1; 
    localparam MAJOR_VERSION    = 16'h0002;
    localparam MINOR_VERSION    = 8'h00;
    //In Sim mode => This is equivalent to 1 msec if you configure  IP GUI at 100 MHZ i/p axil-ite freq and operating at same frequency. 
    //But, if you configure 100MHz in GUI(By default its 100 MHZ) and operate at 1G axi-lite frequency, this value comes to 100 usec(1000usec/10 === 100 usec).
    // In HW => Hung waittime is 10 msec 
    localparam HUNG_WAIT_TIME   = SIM_MODE_EN ? (32'd1000000 / 10) : 32'd1000000; //(32'd1000000 / 25) 
    localparam PULSE_10MSEC_CNT = SIM_MODE_EN ? 32'd125   : 32'd250_0000;  //10msec pulse counter
// ==========================================================================
// Logic port declaration for AXI4 Bridge  
// ==========================================================================
          reg  [19:0]                         p0_port_params;  
          wire [2:0]                          databus_width_p0;  
          wire [5:0]                          speed_sel_p0;  
          wire [1-1:0]  active_ports_p0;  

          //eth reconfig AVMM
          wire [13:0] p0_eth_reconfig_address;
          wire        p0_eth_reconfig_read;
          wire        p0_eth_reconfig_write;
          wire        p0_eth_reconfig_waitrequest;
          wire        p0_eth_reconfig_readdatavalid;
          wire [3:0]  p0_eth_reconfig_byteenable;
          wire [31:0] p0_eth_reconfig_readdata;
          wire [31:0] p0_eth_reconfig_writedata;


         reg  [13:0]  p0_eth_reconfig_reg_address;
         reg          p0_eth_reconfig_reg_read;
         reg          p0_eth_reconfig_reg_write;
         reg  [3:0]   p0_eth_reconfig_reg_byteenable;
         reg  [31:0]  p0_eth_reconfig_reg_writedata;
   reg  [31:0]  p0_eth_reconfig_reg_readdata;
         reg          p0_eth_reconfig_reg_readdatavalid;         
         reg          p0_eth_reconfig_reg_waitrequest;
          reg  [19:0]                         p1_port_params;  
          wire [2:0]                          databus_width_p1;  
          wire [5:0]                          speed_sel_p1;  
          wire [1-1:0]  active_ports_p1;  

          reg  [19:0]                         p2_port_params;  
          wire [2:0]                          databus_width_p2;  
          wire [5:0]                          speed_sel_p2;  
          wire [1-1:0]  active_ports_p2;  

          reg  [19:0]                         p3_port_params;  
          wire [2:0]                          databus_width_p3;  
          wire [5:0]                          speed_sel_p3;  
          wire [1-1:0]  active_ports_p3;  

          reg  [19:0]                         p4_port_params;  
          wire [2:0]                          databus_width_p4;  
          wire [5:0]                          speed_sel_p4;  
          wire [1-1:0]  active_ports_p4;  

          reg  [19:0]                         p5_port_params;  
          wire [2:0]                          databus_width_p5;  
          wire [5:0]                          speed_sel_p5;  
          wire [1-1:0]  active_ports_p5;  

          reg  [19:0]                         p6_port_params;  
          wire [2:0]                          databus_width_p6;  
          wire [5:0]                          speed_sel_p6;  
          wire [1-1:0]  active_ports_p6;  

          reg  [19:0]                         p7_port_params;  
          wire [2:0]                          databus_width_p7;  
          wire [5:0]                          speed_sel_p7;  
          wire [1-1:0]  active_ports_p7;  

          reg  [19:0]                         p8_port_params;  
          wire [2:0]                          databus_width_p8;  
          wire [5:0]                          speed_sel_p8;  
          wire [1-1:0]  active_ports_p8;  

          reg  [19:0]                         p9_port_params;  
          wire [2:0]                          databus_width_p9;  
          wire [5:0]                          speed_sel_p9;  
          wire [1-1:0]  active_ports_p9;  

          reg  [19:0]                         p10_port_params;  
          wire [2:0]                          databus_width_p10;  
          wire [5:0]                          speed_sel_p10;  
          wire [1-1:0]  active_ports_p10;  

          reg  [19:0]                         p11_port_params;  
          wire [2:0]                          databus_width_p11;  
          wire [5:0]                          speed_sel_p11;  
          wire [1-1:0]  active_ports_p11;  

          reg  [19:0]                         p12_port_params;  
          wire [2:0]                          databus_width_p12;  
          wire [5:0]                          speed_sel_p12;  
          wire [1-1:0]  active_ports_p12;  

          reg  [19:0]                         p13_port_params;  
          wire [2:0]                          databus_width_p13;  
          wire [5:0]                          speed_sel_p13;  
          wire [1-1:0]  active_ports_p13;  

          reg  [19:0]                         p14_port_params;  
          wire [2:0]                          databus_width_p14;  
          wire [5:0]                          speed_sel_p14;  
          wire [1-1:0]  active_ports_p14;  

          reg  [19:0]                         p15_port_params;  
          wire [2:0]                          databus_width_p15;  
          wire [5:0]                          speed_sel_p15;  
          wire [1-1:0]  active_ports_p15;  

          reg  [19:0]                         p16_port_params;  
          wire [2:0]                          databus_width_p16;  
          wire [5:0]                          speed_sel_p16;  
          wire [1-1:0]  active_ports_p16;  

          reg  [19:0]                         p17_port_params;  
          wire [2:0]                          databus_width_p17;  
          wire [5:0]                          speed_sel_p17;  
          wire [1-1:0]  active_ports_p17;  

          reg  [19:0]                         p18_port_params;  
          wire [2:0]                          databus_width_p18;  
          wire [5:0]                          speed_sel_p18;  
          wire [1-1:0]  active_ports_p18;  

          reg  [19:0]                         p19_port_params;  
          wire [2:0]                          databus_width_p19;  
          wire [5:0]                          speed_sel_p19;  
          wire [1-1:0]  active_ports_p19;  

          //XCVR AVMM reconfig
          wire [17:0] p0_c0_xcvr_reconfig_address;
          wire        p0_c0_xcvr_reconfig_read;
          wire        p0_c0_xcvr_reconfig_write;
          wire        p0_c0_xcvr_reconfig_waitrequest;
          wire        p0_c0_xcvr_reconfig_readdatavalid;
          wire [31:0] p0_c0_xcvr_reconfig_readdata;
          wire [3:0]  p0_c0_xcvr_reconfig_byteenable;
          wire [31:0] p0_c0_xcvr_reconfig_writedata;

//  Two AVMM bus for PTP, per EHIP core (not per port or per channel)
            wire [16:0] ptp_asym_reconfig_address;
            wire        ptp_asym_reconfig_read;
            wire        ptp_asym_reconfig_write;
            wire        ptp_asym_reconfig_waitrequest;
            wire        ptp_asym_reconfig_readdatavalid;
            wire [31:0] ptp_asym_reconfig_readdata;
            wire [31:0] ptp_asym_reconfig_writedata;
            wire [3:0]  ptp_asym_reconfig_byteenable; 

            wire [16:0] ptp_p2p_reconfig_address;
            wire        ptp_p2p_reconfig_read;
            wire        ptp_p2p_reconfig_write;
            wire        ptp_p2p_reconfig_waitrequest;
            wire        ptp_p2p_reconfig_readdatavalid;
            wire [31:0] ptp_p2p_reconfig_readdata;
            wire [31:0] ptp_p2p_reconfig_writedata;
            wire [3:0]  ptp_p2p_reconfig_byteenable;
 


           // 100G is expecting 4 valid & ready and data width expected is same as hssi
           // This is not generalized since DW is changing in 100G based on CLIENT_INT_GUI
              //Depending on NUM_OF_SEG , in hssi NUM_OF_SEG = PORT_DATA_WIDTH/64 
              //40G chooses 100G-4 as base profile ==> NUM_OF_SEG is 4 in MAC seg & 8 in AVST in case of eth_f_dr. In hssi_ss,PORT_DATA_WIDTH= 64*2 ==> NUM_OF_SEG = 2.Hence doubling required   
              //50G NRZ chooses 100G-2 as base profile ==> NUM_OF_SEG is 4 in MAC seg & 8 in AVST in case of eth_f_dr. In hssi_ss,PORT_DATA_WIDTH= 64*2 ==> NUM_OF_SEG = 2. Hence doubling required  
              //100G NRZ chooses 100G-4 as base profile ==> NUM_OF_SEG is 4 in MAC seg & 8 in AVST in case of eth_f_dr. In hssi_ss,PORT_DATA_WIDTH= 64*4 OR 64*8 ==> NUM_OF_SEG = 4 OR 8. Hence doubling isn't required  
              //MAC segemented
              wire  [PORT0_DATA_WIDTH-1:0]               p0_avst_tx_mac_data;
              wire  [PORT0_NUM_OF_SEG-1:0]               p0_avst_tx_mac_inframe;
              wire  [(PORT0_NUM_OF_SEG*3)-1:0] p0_avst_tx_mac_eop_empty;
              wire  [PORT0_NUM_OF_SEG-1:0]               p0_avst_tx_mac_error;
              wire  [PORT0_NUM_OF_SEG-1:0]               p0_avst_tx_mac_skip_crc;
              wire  [PORT0_DATA_WIDTH-1:0]               p0_avst_rx_mac_data;
              wire  [PORT0_NUM_OF_SEG-1:0]               p0_avst_rx_mac_inframe;
              wire  [(PORT0_NUM_OF_SEG*3)-1:0] p0_avst_rx_mac_eop_empty;
              wire  [(PORT0_NUM_OF_SEG*2)-1:0]           p0_avst_rx_mac_error;
              wire  [PORT0_NUM_OF_SEG-1:0]               p0_avst_rx_mac_fcs_error;
              wire  [(PORT0_NUM_OF_SEG*3)-1:0]           p0_avst_rx_mac_status;
              wire  [1-1 : 0]         p0_avst_tx_mac_valid;
              wire  [1-1 : 0]         p0_avst_tx_mac_ready;
              wire  [1-1 : 0]         p0_avst_rx_mac_valid;


        wire  [1-1 : 0][   1:0]        p0_ptp_tx_tod_valid;        
        wire  [1-1 : 0][96-1:0]        p0_ptp_tx_tod;              
        wire  [1-1 : 0]                p0_ptp_rx_tod_valid;        
        wire  [1-1 : 0][96-1:0]        p0_ptp_rx_tod;              
        wire  [1-1 : 0][1*1-1:0]       p0_ptp_ins_ets;             
        wire  [1-1 : 0][1*1-1:0]       p0_ptp_ins_cf;              
        wire  [1-1 : 0][1*1-1:0]       p0_ptp_zero_csum;           
        wire  [1-1 : 0][1*1-1:0]       p0_ptp_update_eb;           
        wire  [1-1 : 0][1*1-1:0]       p0_ptp_p2p;                 
        wire  [1-1 : 0][1*1-1:0]       p0_ptp_asym;                
        wire  [1-1 : 0][1*1-1:0]       p0_ptp_asym_sign;           
        wire  [1-1 : 0][1*7-1:0]       p0_ptp_asym_p2p_idx;        
        wire  [1-1 : 0][1*16-1:0]      p0_ptp_ts_offset;           
        wire  [1-1 : 0][1*16-1:0]      p0_ptp_cf_offset;           
        wire  [1-1 : 0][1*16-1:0]      p0_ptp_csum_offset;         
        wire  [1-1 : 0][1*96 -1:0]     p0_ptp_tx_its;              
        wire  [1-1 : 0][1*1-1:0]       p0_ptp_ts_req;              
        wire  [1-1 : 0][1*32-1:0]      p0_ptp_fp;                  
        wire  [1-1 : 0]                p0_ptp_ets_valid;           
        wire  [1-1 : 0][96-1:0]        p0_ptp_ets;                 
        //wire  [1-1 : 0][96-1:0]        p0_ptp_rx_its;              



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
        wire                             p0_tx_rst_ack_n;
        wire                             p0_rx_rst_ack_n;

  wire                          p0_anlt_port_state;
  wire                          p1_anlt_port_state;
  wire                          p2_anlt_port_state;
  wire                          p3_anlt_port_state;
  wire                          p4_anlt_port_state;
  wire                          p5_anlt_port_state;
  wire                          p6_anlt_port_state;
  wire                          p7_anlt_port_state;
  wire                          p8_anlt_port_state;
  wire                          p9_anlt_port_state;
  wire                          p10_anlt_port_state;
  wire                          p11_anlt_port_state;
  wire                          p12_anlt_port_state;
  wire                          p13_anlt_port_state;
  wire                          p14_anlt_port_state;
  wire                          p15_anlt_port_state;
  wire                          p16_anlt_port_state;
  wire                          p17_anlt_port_state;
  wire                          p18_anlt_port_state;
  wire                          p19_anlt_port_state;

  wire [1-1:0]         w0_ss_app_st_rxingrts0_tvalid;
  wire [(1*96)-1:0]    w0_ss_app_st_rxingrts0_tdata;
  wire [1-1:0]         w0_ss_app_st_rxingrts1_tvalid;
  wire [(1*96)-1:0]    w0_ss_app_st_rxingrts1_tdata;
       
      assign p0_ss_app_st_rxingrts0_tvalid  = w0_ss_app_st_rxingrts0_tvalid;
      assign p0_ss_app_st_rxingrts0_tdata   = w0_ss_app_st_rxingrts0_tdata;
      assign p0_ss_app_st_rxingrts1_tvalid  = w0_ss_app_st_rxingrts1_tvalid;
      assign p0_ss_app_st_rxingrts1_tdata   = w0_ss_app_st_rxingrts1_tdata;

        wire  [20-1:0]           xcvr_ready;
        wire  [20-1:0]           xcvr_ready_int;

//----------------------------------------------------------
        wire                             p0_reconfig_rst;
        wire  [1-1:0][2-1:0]                    p0_tx_fifo_eccstatus;
        wire  [1-1:0]                           p0_axi_st_tx_parity_error;
//-------------------------------------------------------------

        wire  p0_cdr_lock;
        wire  p0_rx_block_lock;
        wire  p0_local_fault_status;
        wire  p0_remote_fault_status;
        wire  p0_rx_hi_ber;
        wire  p0_rx_am_lock;

        wire  p0_sync_cdr_lock;
        wire  p0_sync_rx_block_lock;
        wire  p0_sync_local_fault_status;
        wire  p0_sync_remote_fault_status;
        wire  p0_sync_rx_hi_ber;
        wire  p0_sync_rx_am_lock;

        wire  [2:0] p0_sync_link_status; 
  //TX MUX Output //Maintain same tkeep signal for both client interface
  //wire   [1-1:0]          p0_app_ss_st_tx_tvalid_mux              ; 
  //wire   [PORT0_DATA_WIDTH-1:0]        p0_app_ss_st_tx_tdata_mux               ; 
  //wire   [1-1:0]          p0_app_ss_st_tx_tlast_mux               ; 
  //wire   [(PORT0_DATA_WIDTH/8)-1:0]    p0_app_ss_st_tx_tkeep_mux               ; 
  //wire   [2*64/64-1:0] p0_app_ss_st_tx_tuser_client_mux        ; 
  //wire   [(1*94)-1:0]     p0_app_ss_st_tx_tuser_ptp_mux           ; 
  //wire   [(1*328)-1:0]    p0_app_ss_st_tx_tuser_ptp_extended_mux  ; 
  //wire   [PORT0_NUM_OF_SEG-1:0]        p0_app_ss_st_tx_tuser_last_segment_mux  ; 
  //wire   [(1-1):0]        p0_ss_app_st_tx_tready_mux; 
  //wire   [((0 == 1)? (1-1) : (PORT0_NUM_OF_SEG - 1)):0] p0_app_ss_st_tx_tuser_pkt_seg_parity_mux ;
    
  //TX PFC Output 
  //wire   [1-1:0]          p0_pfc_mac_st_tx_tvalid              ; 
  //wire   [PORT0_DATA_WIDTH-1:0]        p0_pfc_mac_st_tx_tdata               ; 
  //wire   [1-1:0]          p0_pfc_mac_st_tx_tlast               ; 
  //wire   [(PORT0_DATA_WIDTH/8)-1:0]    p0_pfc_mac_st_tx_tkeep               ; 
  //wire   [2*64/64-1:0] p0_pfc_mac_st_tx_tuser_client        ; 
  //wire   [(1*94)-1:0]     p0_pfc_mac_st_tx_tuser_ptp           ; 
  //wire   [(1*328)-1:0]    p0_pfc_mac_st_tx_tuser_ptp_extended  ; 
  //wire   [PORT0_NUM_OF_SEG-1:0]        p0_pfc_mac_st_tx_tuser_last_segment  ; 
  //wire   [((0 == 1)? (1-1) : (PORT0_NUM_OF_SEG - 1)):0] p0_pfc_mac_st_tx_tuser_pkt_seg_parity;
  //wire   [(1-1):0]        p0_pfc_app_st_tx_tready               ; 

  //RX PFC Output
  //wire  [1-1:0]           p0_pfc_app_st_rx_tvalid             ; 
  //wire  [PORT0_DATA_WIDTH-1:0]         p0_pfc_app_st_rx_tdata              ; 
  //wire  [1-1:0]           p0_pfc_app_st_rx_tlast              ; 
  //wire  [PORT0_NUM_OF_SEG-1:0]         p0_pfc_app_st_rx_tuser_last_segment ; 
  //wire  [(PORT0_DATA_WIDTH/8)-1:0]     p0_pfc_app_st_rx_tkeep              ; 
  //wire  [7*64/64-1:0]  p0_pfc_app_st_rx_tuser_client        ; 
  //wire  [5*64/64-1:0 ]    p0_pfc_app_st_rx_tuser_sts           ; 
  //wire  [31:0]                                  p0_pfc_app_st_rx_tuser_sts_extended ; 
  //wire  [((0 == 1)? (1-1) : (PORT0_NUM_OF_SEG - 1)):0]  p0_pfc_app_st_rx_tuser_pkt_seg_parity;

  //RX MUX Output
  //wire  [1-1:0]           p0_ss_app_st_rx_tvalid_mux;        
  //wire  [PORT0_DATA_WIDTH-1:0]         p0_ss_app_st_rx_tdata_mux;
  //wire  [1-1:0]           p0_ss_app_st_rx_tlast_mux;
  //wire  [PORT0_NUM_OF_SEG-1:0]         p0_ss_app_st_rx_tuser_last_segment_mux;
  //wire  [(PORT0_DATA_WIDTH/8)-1:0]     p0_ss_app_st_rx_tkeep_mux;
  //wire  [7*64/64-1:0]  p0_ss_app_st_rx_tuser_client_mux;                                                        
  //wire  [5*64/64-1:0 ]    p0_ss_app_st_rx_tuser_sts_mux;           
  //wire  [31:0]                                  p0_ss_app_st_rx_tuser_sts_extended_mux;
  //wire  [((0 == 1)? (1-1) : (PORT0_NUM_OF_SEG - 1)):0]  p0_ss_app_st_rx_tuser_pkt_seg_parity_mux;
      
  wire  [8-1:0]                                 p0_tx_pfc_from_pfc;
  wire                                          p0_tx_pause_from_pfc;
  wire  [8-1:0]                                 p0_tx_pfc_mux;
  wire                                          p0_tx_pause_mux;
  wire  [8-1:0]                                 p0_rx_pfc_from_mac;
  wire                                          p0_rx_pause_from_mac;


        wire  sys_clk_830mhz;
        wire  clk_ref_fgt;
        wire  clk_ref_fht;
        wire  p8_eth_f_cdr_divclk; 
        wire  p12_eth_f_cdr_divclk; 

        logic [5:0]  csr_led_override_port;
        logic        csr_led_override_en;
        logic [31:0] pulse_10msec_cntr;
        logic [7:0]  led_pulse_cntr;
        logic        led_pulse;
        logic [15:0] led_pulse_reg;
        logic        led_pulse_ext;
        logic [7:0]  csr_led_pulse_cntr;
        logic [2:0]  csr_led_status;
        logic [2:0]  csr_led_speed;

        wire         ptp_link;                     
        wire         ptp_adpt_f_sys_clk; // this clock must share the same system clock source with all associated eth_f IPs
        wire         ptp_adpt_f_rst_n_src, ptp_adpt_f_rst_n; // sysclk/2_lock status signal is available from any eth_f IP. // For system design involving DR and eth_f IP with PTP is not always active, could 'OR' all available tx_pll_locked

        wire         ptp_adpt_o_clk_pll;

        wire         dr_ctrl_ip_rst_n;
        logic        clk_100G; 
        wire         dr_ctrl_clk;
        wire [63:0]  dummy_wire;
        wire [2:0]   dummy_wire2;

//*********************************************************************************
// Core Logic 
//*********************************************************************************

  //F-tile system pll, always configured in 830Mhz o/p with i_clk_ref[0] (156.25) as input
  generate
  if (EN_SYS_PLL == 1)
  begin : SYS_PLL
    hssi_ss_f_systemclk_pll U_sys_pll(
      .in_refclk_fgt_0(i_clk_ref[0]),        
      .out_refclk_fgt_0(clk_ref_fgt),      
      .out_systempll_clk_0(sys_clk_830mhz) 
      );   
  end else begin : DIS_SYS_PLL  
    assign clk_ref_fgt      = i_clk_ref[0];
    assign clk_ref_fht      = i_clk_ref[1];
    assign o_p8_cdr_divclk  = p8_eth_f_cdr_divclk;
    assign o_p12_cdr_divclk = p12_eth_f_cdr_divclk;
    assign sys_clk_830mhz   = i_clk_sys;
  end
  endgenerate

//***************************************************************************//
//                 Preamble Passthrough Tapping Logic
//***************************************************************************//
/*
wire preamble_pass_thr_en_p0;
wire preamble_pass_thr_en_p0_sync;
wire rd_p0 = p0_eth_reconfig_read;
wire addr_p0 = p0_eth_reconfig_address;
 
wire    rd_preamble_sel_p0     =   rd_p0  & (addr_p0  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p0_csr_rst_n)
   if (!p0_csr_rst_n)  begin
      preamble_pass_thr_en_p0 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p0) begin 
      preamble_pass_thr_en_p0   <=  p0_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p0 (
      .clk     (p0_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p0),
      .q       (preamble_pass_thr_en_p0_sync)
    );
wire preamble_pass_thr_en_p1;
wire preamble_pass_thr_en_p1_sync;
wire rd_p1 = p1_eth_reconfig_read;
wire addr_p1 = p1_eth_reconfig_address;
 
wire    rd_preamble_sel_p1     =   rd_p1  & (addr_p1  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p1_csr_rst_n)
   if (!p1_csr_rst_n)  begin
      preamble_pass_thr_en_p1 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p1) begin 
      preamble_pass_thr_en_p1   <=  p1_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p1 (
      .clk     (p1_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p1),
      .q       (preamble_pass_thr_en_p1_sync)
    );
wire preamble_pass_thr_en_p2;
wire preamble_pass_thr_en_p2_sync;
wire rd_p2 = p2_eth_reconfig_read;
wire addr_p2 = p2_eth_reconfig_address;
 
wire    rd_preamble_sel_p2     =   rd_p2  & (addr_p2  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p2_csr_rst_n)
   if (!p2_csr_rst_n)  begin
      preamble_pass_thr_en_p2 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p2) begin 
      preamble_pass_thr_en_p2   <=  p2_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p2 (
      .clk     (p2_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p2),
      .q       (preamble_pass_thr_en_p2_sync)
    );
wire preamble_pass_thr_en_p3;
wire preamble_pass_thr_en_p3_sync;
wire rd_p3 = p3_eth_reconfig_read;
wire addr_p3 = p3_eth_reconfig_address;
 
wire    rd_preamble_sel_p3     =   rd_p3  & (addr_p3  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p3_csr_rst_n)
   if (!p3_csr_rst_n)  begin
      preamble_pass_thr_en_p3 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p3) begin 
      preamble_pass_thr_en_p3   <=  p3_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p3 (
      .clk     (p3_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p3),
      .q       (preamble_pass_thr_en_p3_sync)
    );
wire preamble_pass_thr_en_p4;
wire preamble_pass_thr_en_p4_sync;
wire rd_p4 = p4_eth_reconfig_read;
wire addr_p4 = p4_eth_reconfig_address;
 
wire    rd_preamble_sel_p4     =   rd_p4  & (addr_p4  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p4_csr_rst_n)
   if (!p4_csr_rst_n)  begin
      preamble_pass_thr_en_p4 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p4) begin 
      preamble_pass_thr_en_p4   <=  p4_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p4 (
      .clk     (p4_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p4),
      .q       (preamble_pass_thr_en_p4_sync)
    );
wire preamble_pass_thr_en_p5;
wire preamble_pass_thr_en_p5_sync;
wire rd_p5 = p5_eth_reconfig_read;
wire addr_p5 = p5_eth_reconfig_address;
 
wire    rd_preamble_sel_p5     =   rd_p5  & (addr_p5  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p5_csr_rst_n)
   if (!p5_csr_rst_n)  begin
      preamble_pass_thr_en_p5 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p5) begin 
      preamble_pass_thr_en_p5   <=  p5_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p5 (
      .clk     (p5_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p5),
      .q       (preamble_pass_thr_en_p5_sync)
    );
wire preamble_pass_thr_en_p6;
wire preamble_pass_thr_en_p6_sync;
wire rd_p6 = p6_eth_reconfig_read;
wire addr_p6 = p6_eth_reconfig_address;
 
wire    rd_preamble_sel_p6     =   rd_p6  & (addr_p6  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p6_csr_rst_n)
   if (!p6_csr_rst_n)  begin
      preamble_pass_thr_en_p6 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p6) begin 
      preamble_pass_thr_en_p6   <=  p6_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p6 (
      .clk     (p6_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p6),
      .q       (preamble_pass_thr_en_p6_sync)
    );
wire preamble_pass_thr_en_p7;
wire preamble_pass_thr_en_p7_sync;
wire rd_p7 = p7_eth_reconfig_read;
wire addr_p7 = p7_eth_reconfig_address;
 
wire    rd_preamble_sel_p7     =   rd_p7  & (addr_p7  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p7_csr_rst_n)
   if (!p7_csr_rst_n)  begin
      preamble_pass_thr_en_p7 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p7) begin 
      preamble_pass_thr_en_p7   <=  p7_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p7 (
      .clk     (p7_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p7),
      .q       (preamble_pass_thr_en_p7_sync)
    );
wire preamble_pass_thr_en_p8;
wire preamble_pass_thr_en_p8_sync;
wire rd_p8 = p8_eth_reconfig_read;
wire addr_p8 = p8_eth_reconfig_address;
 
wire    rd_preamble_sel_p8     =   rd_p8  & (addr_p8  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p8_csr_rst_n)
   if (!p8_csr_rst_n)  begin
      preamble_pass_thr_en_p8 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p8) begin 
      preamble_pass_thr_en_p8   <=  p8_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p8 (
      .clk     (p8_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p8),
      .q       (preamble_pass_thr_en_p8_sync)
    );
wire preamble_pass_thr_en_p9;
wire preamble_pass_thr_en_p9_sync;
wire rd_p9 = p9_eth_reconfig_read;
wire addr_p9 = p9_eth_reconfig_address;
 
wire    rd_preamble_sel_p9     =   rd_p9  & (addr_p9  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p9_csr_rst_n)
   if (!p9_csr_rst_n)  begin
      preamble_pass_thr_en_p9 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p9) begin 
      preamble_pass_thr_en_p9   <=  p9_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p9 (
      .clk     (p9_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p9),
      .q       (preamble_pass_thr_en_p9_sync)
    );
wire preamble_pass_thr_en_p10;
wire preamble_pass_thr_en_p10_sync;
wire rd_p10 = p10_eth_reconfig_read;
wire addr_p10 = p10_eth_reconfig_address;
 
wire    rd_preamble_sel_p10     =   rd_p10  & (addr_p10  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p10_csr_rst_n)
   if (!p10_csr_rst_n)  begin
      preamble_pass_thr_en_p10 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p10) begin 
      preamble_pass_thr_en_p10   <=  p10_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p10 (
      .clk     (p10_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p10),
      .q       (preamble_pass_thr_en_p10_sync)
    );
wire preamble_pass_thr_en_p11;
wire preamble_pass_thr_en_p11_sync;
wire rd_p11 = p11_eth_reconfig_read;
wire addr_p11 = p11_eth_reconfig_address;
 
wire    rd_preamble_sel_p11     =   rd_p11  & (addr_p11  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p11_csr_rst_n)
   if (!p11_csr_rst_n)  begin
      preamble_pass_thr_en_p11 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p11) begin 
      preamble_pass_thr_en_p11   <=  p11_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p11 (
      .clk     (p11_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p11),
      .q       (preamble_pass_thr_en_p11_sync)
    );
wire preamble_pass_thr_en_p12;
wire preamble_pass_thr_en_p12_sync;
wire rd_p12 = p12_eth_reconfig_read;
wire addr_p12 = p12_eth_reconfig_address;
 
wire    rd_preamble_sel_p12     =   rd_p12  & (addr_p12  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p12_csr_rst_n)
   if (!p12_csr_rst_n)  begin
      preamble_pass_thr_en_p12 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p12) begin 
      preamble_pass_thr_en_p12   <=  p12_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p12 (
      .clk     (p12_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p12),
      .q       (preamble_pass_thr_en_p12_sync)
    );
wire preamble_pass_thr_en_p13;
wire preamble_pass_thr_en_p13_sync;
wire rd_p13 = p13_eth_reconfig_read;
wire addr_p13 = p13_eth_reconfig_address;
 
wire    rd_preamble_sel_p13     =   rd_p13  & (addr_p13  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p13_csr_rst_n)
   if (!p13_csr_rst_n)  begin
      preamble_pass_thr_en_p13 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p13) begin 
      preamble_pass_thr_en_p13   <=  p13_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p13 (
      .clk     (p13_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p13),
      .q       (preamble_pass_thr_en_p13_sync)
    );
wire preamble_pass_thr_en_p14;
wire preamble_pass_thr_en_p14_sync;
wire rd_p14 = p14_eth_reconfig_read;
wire addr_p14 = p14_eth_reconfig_address;
 
wire    rd_preamble_sel_p14     =   rd_p14  & (addr_p14  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p14_csr_rst_n)
   if (!p14_csr_rst_n)  begin
      preamble_pass_thr_en_p14 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p14) begin 
      preamble_pass_thr_en_p14   <=  p14_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p14 (
      .clk     (p14_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p14),
      .q       (preamble_pass_thr_en_p14_sync)
    );
wire preamble_pass_thr_en_p15;
wire preamble_pass_thr_en_p15_sync;
wire rd_p15 = p15_eth_reconfig_read;
wire addr_p15 = p15_eth_reconfig_address;
 
wire    rd_preamble_sel_p15     =   rd_p15  & (addr_p15  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p15_csr_rst_n)
   if (!p15_csr_rst_n)  begin
      preamble_pass_thr_en_p15 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p15) begin 
      preamble_pass_thr_en_p15   <=  p15_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p15 (
      .clk     (p15_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p15),
      .q       (preamble_pass_thr_en_p15_sync)
    );
wire preamble_pass_thr_en_p16;
wire preamble_pass_thr_en_p16_sync;
wire rd_p16 = p16_eth_reconfig_read;
wire addr_p16 = p16_eth_reconfig_address;
 
wire    rd_preamble_sel_p16     =   rd_p16  & (addr_p16  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p16_csr_rst_n)
   if (!p16_csr_rst_n)  begin
      preamble_pass_thr_en_p16 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p16) begin 
      preamble_pass_thr_en_p16   <=  p16_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p16 (
      .clk     (p16_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p16),
      .q       (preamble_pass_thr_en_p16_sync)
    );
wire preamble_pass_thr_en_p17;
wire preamble_pass_thr_en_p17_sync;
wire rd_p17 = p17_eth_reconfig_read;
wire addr_p17 = p17_eth_reconfig_address;
 
wire    rd_preamble_sel_p17     =   rd_p17  & (addr_p17  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p17_csr_rst_n)
   if (!p17_csr_rst_n)  begin
      preamble_pass_thr_en_p17 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p17) begin 
      preamble_pass_thr_en_p17   <=  p17_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p17 (
      .clk     (p17_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p17),
      .q       (preamble_pass_thr_en_p17_sync)
    );
wire preamble_pass_thr_en_p18;
wire preamble_pass_thr_en_p18_sync;
wire rd_p18 = p18_eth_reconfig_read;
wire addr_p18 = p18_eth_reconfig_address;
 
wire    rd_preamble_sel_p18     =   rd_p18  & (addr_p18  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p18_csr_rst_n)
   if (!p18_csr_rst_n)  begin
      preamble_pass_thr_en_p18 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p18) begin 
      preamble_pass_thr_en_p18   <=  p18_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p18 (
      .clk     (p18_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p18),
      .q       (preamble_pass_thr_en_p18_sync)
    );
wire preamble_pass_thr_en_p19;
wire preamble_pass_thr_en_p19_sync;
wire rd_p19 = p19_eth_reconfig_read;
wire addr_p19 = p19_eth_reconfig_address;
 
wire    rd_preamble_sel_p19     =   rd_p19  & (addr_p19  == 32'h810);   
 
always @(posedge app_ss_lite_clk, negedge p19_csr_rst_n)
   if (!p19_csr_rst_n)  begin
      preamble_pass_thr_en_p19 <= 0; 
   end
   else begin
   if (rd_preamble_sel_p19) begin 
      preamble_pass_thr_en_p19   <=  p19_eth_reconfig_readdata[31:0]; 
   end
end

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(2),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_preamble_en_sync_p19 (
      .clk     (p19_app_ss_st_tx_clk),
      .reset   (1'b0),
      .d       (preamble_pass_thr_en_p19),
      .q       (preamble_pass_thr_en_p19_sync)
    );
*/
////////////////////////////////////////////////////////////////////////////
//////--------------TAP ETH_RECONFIG_INTERFACE------------------------------
wire axi_lite_bridge_rst_n;
wire  [5:0] profile_sel_profile_sel_p0_cdc;
assign  profile_sel_profile_sel_p0_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p1_cdc;
assign  profile_sel_profile_sel_p1_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p2_cdc;
assign  profile_sel_profile_sel_p2_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p3_cdc;
assign  profile_sel_profile_sel_p3_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p4_cdc;
assign  profile_sel_profile_sel_p4_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p5_cdc;
assign  profile_sel_profile_sel_p5_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p6_cdc;
assign  profile_sel_profile_sel_p6_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p7_cdc;
assign  profile_sel_profile_sel_p7_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p8_cdc;
assign  profile_sel_profile_sel_p8_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p9_cdc;
assign  profile_sel_profile_sel_p9_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p10_cdc;
assign  profile_sel_profile_sel_p10_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p11_cdc;
assign  profile_sel_profile_sel_p11_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p12_cdc;
assign  profile_sel_profile_sel_p12_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p13_cdc;
assign  profile_sel_profile_sel_p13_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p14_cdc;
assign  profile_sel_profile_sel_p14_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p15_cdc;
assign  profile_sel_profile_sel_p15_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p16_cdc;
assign  profile_sel_profile_sel_p16_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p17_cdc;
assign  profile_sel_profile_sel_p17_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p18_cdc;
assign  profile_sel_profile_sel_p18_cdc = 6'd0;
wire  [5:0] profile_sel_profile_sel_p19_cdc;
assign  profile_sel_profile_sel_p19_cdc = 6'd0;

////////////////////////////////////////////////////////////////////////
logic   tx_preamble_passthrough_en_p0;
logic   rx_preamble_passthrough_en_p0;

// A write byte enable for each register
wire      tx_we_preamble_passthrough_p0       =   p0_eth_reconfig_write  && (p0_eth_reconfig_address  == 14'h484) ?  1'b1  :   1'b0; //in control path addr/4 === 0x1210/4 === 0x484
wire      rx_we_preamble_passthrough_p0       =   p0_eth_reconfig_write  && (p0_eth_reconfig_address  == 14'h48A) ?  1'b1  :   1'b0; //in control path addr/4 === 0x1228/4 === 0x48A

always @(posedge app_ss_lite_clk, negedge p0_csr_rst_n)
   if (!p0_csr_rst_n)  begin
      tx_preamble_passthrough_en_p0 <= 0; //{4{1'd0}}; 
      rx_preamble_passthrough_en_p0 <= 0; //{4{1'd0}}; 
   end
   else begin
   if (tx_we_preamble_passthrough_p0) begin 
      tx_preamble_passthrough_en_p0   <=  p0_eth_reconfig_writedata[0]; 
   end
   if (rx_we_preamble_passthrough_p0) begin 
      rx_preamble_passthrough_en_p0   <=  p0_eth_reconfig_writedata[0]; 
   end	 
end

logic   tx_preamble_passthrough_en_p1;
logic   rx_preamble_passthrough_en_p1;

assign tx_preamble_passthrough_en_p1  =  1'd0;
assign rx_preamble_passthrough_en_p1  =  1'd0;
logic   tx_preamble_passthrough_en_p2;
logic   rx_preamble_passthrough_en_p2;

assign tx_preamble_passthrough_en_p2  =  1'd0;
assign rx_preamble_passthrough_en_p2  =  1'd0;
logic   tx_preamble_passthrough_en_p3;
logic   rx_preamble_passthrough_en_p3;

assign tx_preamble_passthrough_en_p3  =  1'd0;
assign rx_preamble_passthrough_en_p3  =  1'd0;
logic   tx_preamble_passthrough_en_p4;
logic   rx_preamble_passthrough_en_p4;

assign tx_preamble_passthrough_en_p4  =  1'd0;
assign rx_preamble_passthrough_en_p4  =  1'd0;
logic   tx_preamble_passthrough_en_p5;
logic   rx_preamble_passthrough_en_p5;

assign tx_preamble_passthrough_en_p5  =  1'd0;
assign rx_preamble_passthrough_en_p5  =  1'd0;
logic   tx_preamble_passthrough_en_p6;
logic   rx_preamble_passthrough_en_p6;

assign tx_preamble_passthrough_en_p6  =  1'd0;
assign rx_preamble_passthrough_en_p6  =  1'd0;
logic   tx_preamble_passthrough_en_p7;
logic   rx_preamble_passthrough_en_p7;

assign tx_preamble_passthrough_en_p7  =  1'd0;
assign rx_preamble_passthrough_en_p7  =  1'd0;
logic   tx_preamble_passthrough_en_p8;
logic   rx_preamble_passthrough_en_p8;

assign tx_preamble_passthrough_en_p8  =  1'd0;
assign rx_preamble_passthrough_en_p8  =  1'd0;
logic   tx_preamble_passthrough_en_p9;
logic   rx_preamble_passthrough_en_p9;

assign tx_preamble_passthrough_en_p9  =  1'd0;
assign rx_preamble_passthrough_en_p9  =  1'd0;
logic   tx_preamble_passthrough_en_p10;
logic   rx_preamble_passthrough_en_p10;

assign tx_preamble_passthrough_en_p10  =  1'd0;
assign rx_preamble_passthrough_en_p10  =  1'd0;
logic   tx_preamble_passthrough_en_p11;
logic   rx_preamble_passthrough_en_p11;

assign tx_preamble_passthrough_en_p11  =  1'd0;
assign rx_preamble_passthrough_en_p11  =  1'd0;
logic   tx_preamble_passthrough_en_p12;
logic   rx_preamble_passthrough_en_p12;

assign tx_preamble_passthrough_en_p12  =  1'd0;
assign rx_preamble_passthrough_en_p12  =  1'd0;
logic   tx_preamble_passthrough_en_p13;
logic   rx_preamble_passthrough_en_p13;

assign tx_preamble_passthrough_en_p13  =  1'd0;
assign rx_preamble_passthrough_en_p13  =  1'd0;
logic   tx_preamble_passthrough_en_p14;
logic   rx_preamble_passthrough_en_p14;

assign tx_preamble_passthrough_en_p14  =  1'd0;
assign rx_preamble_passthrough_en_p14  =  1'd0;
logic   tx_preamble_passthrough_en_p15;
logic   rx_preamble_passthrough_en_p15;

assign tx_preamble_passthrough_en_p15  =  1'd0;
assign rx_preamble_passthrough_en_p15  =  1'd0;
logic   tx_preamble_passthrough_en_p16;
logic   rx_preamble_passthrough_en_p16;

assign tx_preamble_passthrough_en_p16  =  1'd0;
assign rx_preamble_passthrough_en_p16  =  1'd0;
logic   tx_preamble_passthrough_en_p17;
logic   rx_preamble_passthrough_en_p17;

assign tx_preamble_passthrough_en_p17  =  1'd0;
assign rx_preamble_passthrough_en_p17  =  1'd0;
logic   tx_preamble_passthrough_en_p18;
logic   rx_preamble_passthrough_en_p18;

assign tx_preamble_passthrough_en_p18  =  1'd0;
assign rx_preamble_passthrough_en_p18  =  1'd0;
logic   tx_preamble_passthrough_en_p19;
logic   rx_preamble_passthrough_en_p19;

assign tx_preamble_passthrough_en_p19  =  1'd0;
assign rx_preamble_passthrough_en_p19  =  1'd0;
//---------------------------------------------------------------
//---------------------------------------------------------------
// PTP Adapter IP
//---------------------------------------------------------------

assign ptp_adpt_f_sys_clk = ptp_adpt_o_clk_pll;

//assign ptp_adpt_f_rst_n_src = o_p0_tx_pll_locked;  //TBD


eth_ptp_adpt_f_wrapper  ptp_adpt_f (
    .o_clk_pll                          (ptp_adpt_o_clk_pll                  ), // When PTP is enabled, ptp_adpt_f's and ALL eth_f's clock is driven by same sysclk/2 from ptp_adpt_f
    .i_sys_clk                          (ptp_adpt_f_sys_clk                  ),
    .i_rst_n                            (nios_rst_n                          ),  //TODO
    .i_reconfig_clk                     (app_ss_lite_clk                     ),
    .i_reconfig_reset                   (~axi_lite_bridge_rst_n              ),

    .i_reconfig_ptp_asym_addr           (ptp_asym_reconfig_address),
    .i_reconfig_ptp_asym_byteenable     (ptp_asym_reconfig_byteenable),
    .i_reconfig_ptp_asym_write          (ptp_asym_reconfig_write),
    .i_reconfig_ptp_asym_writedata      (ptp_asym_reconfig_writedata),
    .i_reconfig_ptp_asym_read           (ptp_asym_reconfig_read),
    .o_reconfig_ptp_asym_readdata       (ptp_asym_reconfig_readdata),
    .o_reconfig_ptp_asym_readdata_valid (ptp_asym_reconfig_readdatavalid),
    .o_reconfig_ptp_asym_waitrequest    (ptp_asym_reconfig_waitrequest),
    
    .i_reconfig_ptp_p2p_addr            (ptp_p2p_reconfig_address),
    .i_reconfig_ptp_p2p_byteenable      (ptp_p2p_reconfig_byteenable),
    .i_reconfig_ptp_p2p_write           (ptp_p2p_reconfig_write),
    .i_reconfig_ptp_p2p_writedata       (ptp_p2p_reconfig_writedata),
    .i_reconfig_ptp_p2p_read            (ptp_p2p_reconfig_read),
    .o_reconfig_ptp_p2p_readdata        (ptp_p2p_reconfig_readdata),
    .o_reconfig_ptp_p2p_readdata_valid  (ptp_p2p_reconfig_readdatavalid),
    .o_reconfig_ptp_p2p_waitrequest     (ptp_p2p_reconfig_waitrequest),
    
    .ptp_link                           (ptp_link                           )
    );

generate
if (SIM_MODE_EN == 1)
begin : SIM_DR_CLK
    //synthesis translate_off
     initial begin 
        clk_100G = 0;
     end
     always #5ps  clk_100G = ~clk_100G;
    //synthesis translate_on  
  assign dr_ctrl_clk = clk_100G;
end  
else
begin : SYNTH_DR_CLK
  assign dr_ctrl_clk = app_ss_lite_clk;
end
endgenerate


// If none of the ports has DR enabled then drive the CSR register with zero.
assign dr_in_progress = 1'b0;





        wire [1-1:0][191:0] p0_av_st_ptp_rx_its;
        wire [96-1:0]            p0_ptp_rx_its;
        wire [1-1:0][191:0] p1_av_st_ptp_rx_its;
        wire [96-1:0]            p1_ptp_rx_its;
        wire [1-1:0][191:0] p2_av_st_ptp_rx_its;
        wire [96-1:0]            p2_ptp_rx_its;
        wire [1-1:0][191:0] p3_av_st_ptp_rx_its;
        wire [96-1:0]            p3_ptp_rx_its;
        wire [1-1:0][191:0] p4_av_st_ptp_rx_its;
        wire [96-1:0]            p4_ptp_rx_its;
        wire [1-1:0][191:0] p5_av_st_ptp_rx_its;
        wire [96-1:0]            p5_ptp_rx_its;
        wire [1-1:0][191:0] p6_av_st_ptp_rx_its;
        wire [96-1:0]            p6_ptp_rx_its;
        wire [1-1:0][191:0] p7_av_st_ptp_rx_its;
        wire [96-1:0]            p7_ptp_rx_its;
        wire [1-1:0][191:0] p8_av_st_ptp_rx_its;
        wire [96-1:0]            p8_ptp_rx_its;
        wire [1-1:0][191:0] p9_av_st_ptp_rx_its;
        wire [96-1:0]            p9_ptp_rx_its;
        wire [1-1:0][191:0] p10_av_st_ptp_rx_its;
        wire [96-1:0]            p10_ptp_rx_its;
        wire [1-1:0][191:0] p11_av_st_ptp_rx_its;
        wire [96-1:0]            p11_ptp_rx_its;
        wire [1-1:0][191:0] p12_av_st_ptp_rx_its;
        wire [96-1:0]            p12_ptp_rx_its;
        wire [1-1:0][191:0] p13_av_st_ptp_rx_its;
        wire [96-1:0]            p13_ptp_rx_its;
        wire [1-1:0][191:0] p14_av_st_ptp_rx_its;
        wire [96-1:0]            p14_ptp_rx_its;
        wire [1-1:0][191:0] p15_av_st_ptp_rx_its;
        wire [96-1:0]            p15_ptp_rx_its;
        wire [1-1:0][191:0] p16_av_st_ptp_rx_its;
        wire [96-1:0]            p16_ptp_rx_its;
        wire [1-1:0][191:0] p17_av_st_ptp_rx_its;
        wire [96-1:0]            p17_ptp_rx_its;
        wire [1-1:0][191:0] p18_av_st_ptp_rx_its;
        wire [96-1:0]            p18_ptp_rx_its;
        wire [1-1:0][191:0] p19_av_st_ptp_rx_its;
        wire [96-1:0]            p19_ptp_rx_its;
             assign p0_av_st_ptp_rx_its[0] = {96'b0,p0_ptp_rx_its}; 
                 assign p1_av_st_ptp_rx_its[0] = 192'b0;
                 assign p2_av_st_ptp_rx_its[0] = 192'b0;
                 assign p3_av_st_ptp_rx_its[0] = 192'b0;
                 assign p4_av_st_ptp_rx_its[0] = 192'b0;
                 assign p5_av_st_ptp_rx_its[0] = 192'b0;
                 assign p6_av_st_ptp_rx_its[0] = 192'b0;
                 assign p7_av_st_ptp_rx_its[0] = 192'b0;
                 assign p8_av_st_ptp_rx_its[0] = 192'b0;
                 assign p9_av_st_ptp_rx_its[0] = 192'b0;
                 assign p10_av_st_ptp_rx_its[0] = 192'b0;
                 assign p11_av_st_ptp_rx_its[0] = 192'b0;
                 assign p12_av_st_ptp_rx_its[0] = 192'b0;
                 assign p13_av_st_ptp_rx_its[0] = 192'b0;
                 assign p14_av_st_ptp_rx_its[0] = 192'b0;
                 assign p15_av_st_ptp_rx_its[0] = 192'b0;
                 assign p16_av_st_ptp_rx_its[0] = 192'b0;
                 assign p17_av_st_ptp_rx_its[0] = 192'b0;
                 assign p18_av_st_ptp_rx_its[0] = 192'b0;
                 assign p19_av_st_ptp_rx_its[0] = 192'b0;


//*********************************************************************************
//************************* EHIP IP TOP level for all ports *********************** 
//*********************************************************************************
             
hssi_ss_f_ip_wrapper_p0_4nezbiy #(
          .NUM_XCVR_CHANNELS             (PORT0_XCVR_CHANNEL),
          .DATA_WIDTH                    (PORT0_DATA_WIDTH),
          .NO_OF_BYTES                   (PORT0_NO_OF_BYTES),
          .AXI_READY_LATENCY             (PORT0_READY_LATENCY),
          .PTP_TX_CLASSIFIER_ENABLE      (PORT0_PTP_TX_CLASSIFIER_ENABLE),
          .PORT_PROFILE                  (PORT0_PROFILE),
          .Max_No_of_ports               (1),
          .NUM_MAX_PORTS                 (1),
          //.ENABLE_MULTI_STREAM           (PORT0_ENABLE_MULTI_STREAM), USE only when Multi stream feature is added
          //.NUM_OF_STREAM                 (PORT0_NUM_OF_STREAM),
          .TID                           (PORT0_TID),
          .PORT_CLIENT_IF                (0),
          .PKT_SEG_PARITY_EN             (PORT0_PKT_SEG_PARITY_EN),
          .NUM_OF_SEG                    (PORT0_NUM_OF_SEG),
          .ENABLE_ECC                    (ENABLE_ECC),
          .PKT_CYL                       (1),
          .EMPTY_BITS                    (3),
          .sim_mode                      (SIM_MODE_EN ? "enable" : "disable"),
          .TX_TUSER_CLIENT_WIDTH         (2*64/64),
          .RX_TUSER_CLIENT_WIDTH         (7*64/64),
          .RX_TUSER_STATS_WIDTH          (5*64/64),
          .ASYNC_ADAPTERS_EN             (0),
          .PFC_NUM_QUEUES                (PORT0_PFC_NUM_QUEUES),
          .PFC_TX_BUFFER_EN              (PORT0_PFC_TX_BUFFER_EN),
          .FLOW_CONTROL_EN               (PORT0_FLOW_CONTROL_EN),
          .TX_QUEUE_SIZE                 ({PORT0_PFC_TX_QUEUE7_SIZE,PORT0_PFC_TX_QUEUE6_SIZE,PORT0_PFC_TX_QUEUE5_SIZE,PORT0_PFC_TX_QUEUE4_SIZE,PORT0_PFC_TX_QUEUE3_SIZE,PORT0_PFC_TX_QUEUE2_SIZE,PORT0_PFC_TX_QUEUE1_SIZE,PORT0_PFC_TX_QUEUE0_SIZE}),  
          .TX_QUEUE_WIDTH                ({$clog2(PORT0_PFC_TX_QUEUE7_SIZE),$clog2(PORT0_PFC_TX_QUEUE6_SIZE),$clog2(PORT0_PFC_TX_QUEUE5_SIZE),$clog2(PORT0_PFC_TX_QUEUE4_SIZE),$clog2(PORT0_PFC_TX_QUEUE3_SIZE),$clog2(PORT0_PFC_TX_QUEUE2_SIZE),$clog2(PORT0_PFC_TX_QUEUE1_SIZE),$clog2(PORT0_PFC_TX_QUEUE0_SIZE)}),  
          .RX_QUEUE_SIZE                 ({PORT0_PFC_RX_QUEUE7_SIZE,PORT0_PFC_RX_QUEUE6_SIZE,PORT0_PFC_RX_QUEUE5_SIZE,PORT0_PFC_RX_QUEUE4_SIZE,PORT0_PFC_RX_QUEUE3_SIZE,PORT0_PFC_RX_QUEUE2_SIZE,PORT0_PFC_RX_QUEUE1_SIZE,PORT0_PFC_RX_QUEUE0_SIZE}),  
          .RX_QUEUE_WIDTH                ({$clog2(PORT0_PFC_RX_QUEUE7_SIZE),$clog2(PORT0_PFC_RX_QUEUE6_SIZE),$clog2(PORT0_PFC_RX_QUEUE5_SIZE),$clog2(PORT0_PFC_RX_QUEUE4_SIZE),$clog2(PORT0_PFC_RX_QUEUE3_SIZE),$clog2(PORT0_PFC_RX_QUEUE2_SIZE),$clog2(PORT0_PFC_RX_QUEUE1_SIZE),$clog2(PORT0_PFC_RX_QUEUE0_SIZE)}),  
          .Tiles                         (tiles)
    ) U_hssi_ss_ip_wrapper_p0 (

      .i_reconfig_clk                                     (app_ss_lite_clk),
      .i_reconfig_reset_n                                 (axi_lite_bridge_rst_n),
      .i_profile_sel                                      (profile_sel_profile_sel_p0_cdc),
      .o_port_active_mask_reg                             (active_ports_p0),
      .o_data_width                                       (databus_width_p0),
      .o_speed_sel                                        (speed_sel_p0),
      .i_tx_preamble_pass_thr_en                          (tx_preamble_passthrough_en_p0),   
      .i_rx_preamble_pass_thr_en                          (rx_preamble_passthrough_en_p0),   
      //AXI Stream Tx, from User interface
      
      .p0_app_ss_st_client_clk                               (p0_app_ss_st_tx_clk),
      .p1_app_ss_st_client_clk                               (p0_app_ss_st_tx_clk),
      .p2_app_ss_st_client_clk                               (p0_app_ss_st_tx_clk),
      .p3_app_ss_st_client_clk                               (p0_app_ss_st_tx_clk),
      .p0_app_ss_st_client_areset_n                          (p0_axi_st_bridge_tx_rst_n),
      .p1_app_ss_st_client_areset_n                          (p0_axi_st_bridge_tx_rst_n),
      .p2_app_ss_st_client_areset_n                          (p0_axi_st_bridge_tx_rst_n),
      .p3_app_ss_st_client_areset_n                          (p0_axi_st_bridge_tx_rst_n),
      .p0_app_ss_st_clk                                      (p0_app_ss_st_rx_clk),
      .p1_app_ss_st_clk                                      (p0_app_ss_st_rx_clk),
      .p2_app_ss_st_clk                                      (p0_app_ss_st_rx_clk),
      .p3_app_ss_st_clk                                      (p0_app_ss_st_rx_clk),
      .p0_app_ss_st_areset_n                                 (p0_axi_st_bridge_rx_rst_n),
      .p1_app_ss_st_areset_n                                 (p0_axi_st_bridge_rx_rst_n),
      .p2_app_ss_st_areset_n                                 (p0_axi_st_bridge_rx_rst_n),
      .p3_app_ss_st_areset_n                                 (p0_axi_st_bridge_rx_rst_n),
      .ss_app_tx_tready                     (p0_ss_app_st_tx_tready),
      .app_ss_tx_tvalid                     (p0_app_ss_st_tx_tvalid),
      .app_ss_tx_tdata                      (p0_app_ss_st_tx_tdata),
      .app_ss_tx_tlast                      (p0_app_ss_st_tx_tlast),
      .app_ss_tx_tkeep                      (p0_app_ss_st_tx_tkeep),
      //.app_ss_st_tx_tkeep_segment           (p0_app_ss_st_tx_tkeep_segment),
      .app_ss_tx_tuser_client               (p0_app_ss_st_tx_tuser_client),
      .app_ss_tx_tuser_ptp                  (p0_app_ss_st_tx_tuser_ptp),
      .app_ss_tx_tuser_ptp_extended         (p0_app_ss_st_tx_tuser_ptp_extended),
   //-------------------------------------------------
      .app_ss_st_tx_tuser_last_segment     (p0_app_ss_st_tx_tuser_last_segment),
      .app_ss_st_tx_tuser_pkt_seg_parity   (p0_app_ss_st_tx_tuser_pkt_seg_parity),
      .app_ss_st_tx_tid                    ('0),
   //-------------------------------------------------
   
   //AXI Stream Rx, to User interface
      .ss_app_rx_tvalid                     (p0_ss_app_st_rx_tvalid),
      .ss_app_rx_tdata                      (p0_ss_app_st_rx_tdata),
      .ss_app_rx_tlast                      (p0_ss_app_st_rx_tlast),
      .ss_app_rx_tkeep                      (p0_ss_app_st_rx_tkeep),
      //.ss_app_st_rx_tkeep_segment           (p0_ss_app_st_rx_tkeep_segment_mux),
      .ss_app_rx_tuser_client               (p0_ss_app_st_rx_tuser_client),
      .ss_app_rx_tuser_sts                  (p0_ss_app_st_rx_tuser_sts),
      .ss_app_rx_tuser_sts_extended         (p0_ss_app_st_rx_tuser_sts_extended),
     //------------------------------------------- 
      .ss_app_st_rx_tuser_last_segment      (p0_ss_app_st_rx_tuser_last_segment),
      .ss_app_st_rx_tuser_pkt_seg_parity    (p0_ss_app_st_rx_tuser_pkt_seg_parity),
      .ss_app_st_rx_tid                     (),
     //----------------------------------------------  

     //.ss_app_st_txegrts0_tvalid(ss_app_ehip0_st_txegrts0_tvalid),
      //.ss_app_st_txegrts0_tdata(ss_app_ehip0_st_txegrts0_tdata),
      //
      .ss_app_st_rxingrts0_tvalid           (w0_ss_app_st_rxingrts0_tvalid),
      .ss_app_st_rxingrts0_tdata            (w0_ss_app_st_rxingrts0_tdata),
      .ss_app_st_rxingrts1_tvalid           (w0_ss_app_st_rxingrts1_tvalid),
      .ss_app_st_rxingrts1_tdata            (w0_ss_app_st_rxingrts1_tdata),

      .i_av_st_ptp_rx_its                   (p0_av_st_ptp_rx_its),
      
        //tx_ptp avalon side
        .o_av_st_tx_ptp_ts_valid        (p0_ptp_tx_tod_valid),
        .o_av_st_tx_ptp_ts_req          (p0_ptp_ts_req),
        .o_av_st_tx_ptp_ins_ets         (p0_ptp_ins_ets),
        .o_av_st_tx_ptp_fp              (p0_ptp_fp),
        .o_av_st_tx_ptp_ins_cf          (p0_ptp_ins_cf),
        .o_av_st_tx_ptp_tx_its          (p0_ptp_tx_its),
        .o_av_st_tx_ptp_asym_p2p_idx    (p0_ptp_asym_p2p_idx),
        .o_av_st_tx_ptp_asym_sign       (p0_ptp_asym_sign),
        .o_av_st_tx_ptp_asym            (p0_ptp_asym),
        .o_av_st_tx_ptp_p2p             (p0_ptp_p2p),
        //
        .o_av_st_tx_ptp_ts_format       (), 
        .o_av_st_tx_ptp_update_eb       (p0_ptp_update_eb), 
        .o_av_st_tx_ptp_zero_csum       (p0_ptp_zero_csum), 
        .o_av_st_tx_ptp_eb_offset       (), 
        .o_av_st_tx_ptp_csum_offset     (p0_ptp_csum_offset), 
        .o_av_st_tx_ptp_cf_offset       (p0_ptp_cf_offset), 
        .o_av_st_tx_ptp_ts_offset       (p0_ptp_ts_offset), 
   
        .o_tx_fifo_eccstatus            (p0_tx_fifo_eccstatus),
        .o_axi_st_tx_parity_error       (p0_axi_st_tx_parity_error),
      //MAC segemented
      .o_tx_mac_data                      (p0_avst_tx_mac_data),
      //.o_tx_mac_valid                     (p0_avst_tx_mac_valid),
      .o_tx_mac_inframe                   (p0_avst_tx_mac_inframe),
      .o_tx_mac_eop_empty                 (p0_avst_tx_mac_eop_empty),
      //.i_tx_mac_ready                     (p0_avst_tx_mac_ready),
      .o_tx_mac_error                     (p0_avst_tx_mac_error),
      .o_tx_mac_skip_crc                  (p0_avst_tx_mac_skip_crc),
      .i_rx_mac_data                      (p0_avst_rx_mac_data),
      //.i_rx_mac_valid                     (p0_avst_rx_mac_valid),
      .i_rx_mac_inframe                   (p0_avst_rx_mac_inframe),
      .i_rx_mac_eop_empty                 (p0_avst_rx_mac_eop_empty),
      .i_rx_mac_error                     (p0_avst_rx_mac_error),
      .i_rx_mac_fcs_error                 (p0_avst_rx_mac_fcs_error),
      .i_rx_mac_status                    (p0_avst_rx_mac_status),
      .o_tx_mac_valid                     (p0_avst_tx_mac_valid),
      .i_tx_mac_ready                     (p0_avst_tx_mac_ready),
      .i_rx_mac_valid                     (p0_avst_rx_mac_valid),

      //Avalon Stream Tx, to EHIP/MAC interface
      //.i_av_st_tx_ready               (o_tx_mac_ready),
      //.o_av_st_tx_valid               (i_tx_mac_valid),
      //.o_av_st_tx_data                (i_tx_mac_data),
      //.o_av_st_tx_startofpacket       (),
      //.o_av_st_tx_endofpacket         (),
      //.o_av_st_tx_empty               (),
      //.o_av_st_tx_error               (),
      //.o_av_st_tx_skip_crc            (i_tx_mac_skip_crc),
      //hac //MAC_SEGMENTED COMPATIBLE SIGNALS    
      // o_av_st_tx_inframe             (i_tx_mac_inframe),
      // o_av_st_tx_eop_empty           (i_tx_mac_eop_empty),
      // o_av_st_tx_mac_error           (i_tx_mac_error),
     // output reg  [MAC_STS-1:0]                  o_av_st_txstatus_data


      //Avalon Stream Rx, from EHIP/MAC interface
      //.i_av_st_rx_valid               (o_rx_mac_valid),
      //.i_av_st_rx_data                (o_rx_mac_data),
      //.i_av_st_rx_startofpacket       (),
      //.i_av_st_rx_endofpacket         (),
      //.i_av_st_rx_empty               (),
      //.i_av_st_rx_error               (),
      //.i_av_st_rxstatus_data          (),
      //.i_av_st_rxstatus_valid         (),
      //.i_av_st_ptp_rx_its             (),
      ////hac  //MAC_SEGMENTED COMPATIBLE SIGNALS    
      //.i_av_st_rx_inframe             (o_rx_mac_inframe),
      //.i_av_st_rx_eop_empty           (o_rx_mac_eop_empty),
      //.i_av_st_rx_mac_error           (o_rx_mac_error),
      //.i_av_st_rx_fcs_error           (o_rx_mac_fcs_error),
      //.i_av_st_rx_mac_status          (o_rx_mac_status)
      .tp()
    );


  


//************************************************************************************************
//************************************** eth_f EHIP IP ****************************************
//************************************************************************************************
//Incase of PTP enabled ports, sending o_clk_pll from tile adaptor to the user
        assign o_p0_clk_pll = ptp_adpt_o_clk_pll;  

//        assign p0_xcvr_reconfig_address[0]        = p0_c0_xcvr_reconfig_address;   
//        assign p0_xcvr_reconfig_read[0]           = p0_c0_xcvr_reconfig_read;          
//        assign p0_xcvr_reconfig_write[0]          = p0_c0_xcvr_reconfig_write;         
//        assign p0_xcvr_reconfig_byteenable[0]     = p0_c0_xcvr_reconfig_byteenable;         
//        assign p0_xcvr_reconfig_readdata[0]       = p0_c0_xcvr_reconfig_readdata;  
//        assign p0_xcvr_reconfig_readdatavalid[0]  = p0_c0_xcvr_reconfig_readdatavalid;  
//        assign p0_xcvr_reconfig_writedata[0]      = p0_c0_xcvr_reconfig_writedata;     
//        assign p0_xcvr_reconfig_waitrequest[0]    = p0_c0_xcvr_reconfig_waitrequest;


        eth_f_top_p0
             U_eth_f_inst_p0 (
              //Clock singlas
              .i_clk_ref                        (clk_ref_fgt), // 156.25 FGT eth,
                .i_clk_sys                        (sys_clk_830mhz),
              .o_clk_tx_div                     (o_p0_clk_tx_div),
              .o_clk_rec_div64                  (o_p0_clk_rec_div64),
              .o_clk_rec_div                    (o_p0_clk_rec_div), 
              .i_reconfig_clk                   (app_ss_lite_clk),
              //
              .i_clk_tx                         (o_p0_clk_pll),
              .i_clk_rx                         (o_p0_clk_pll),
        
              .i_clk_tx_tod                     (i_p0_clk_tx_tod),          // width = NUM_CHANNELS, only incase of 10/25G enhanced PTP, TBD 100G no enhanced PTP?
              .i_clk_rx_tod                     (i_p0_clk_rx_tod),
              .i_clk_ptp_sample                 (i_p0_clk_ptp_sample), 
              //Reset signals
              .i_reconfig_reset                 (p0_reconfig_rst), 
              .i_rst_n                          (p0_csr_rst_n),
              .i_tx_rst_n                       (p0_tx_rst_n),
              .i_rx_rst_n                       (p0_rx_rst_n), 
                .o_rst_ack_n                      (p0_csr_rst_ack_n),
                .o_tx_rst_ack_n                   (p0_tx_rst_ack_n),
                .o_rx_rst_ack_n                   (p0_rx_rst_ack_n),
              //Serial interface
              .o_tx_serial                      (p0_tx_serial), 
              .i_rx_serial                      (p0_rx_serial), 
              .o_tx_serial_n                    (p0_tx_serial_n), 
              .i_rx_serial_n                    (p0_rx_serial_n),
              // Eth AVMM - disabled only incase of core_variant = 0, 1, 4, 5
              //TBD PMA mode
              .i_reconfig_eth_addr              (p0_eth_reconfig_reg_address), 
              .i_reconfig_eth_read              (p0_eth_reconfig_read & p0_eth_reconfig_reg_read & p0_eth_reconfig_reg_waitrequest),  
              .i_reconfig_eth_write             (p0_eth_reconfig_write & p0_eth_reconfig_reg_write & p0_eth_reconfig_reg_waitrequest), 
              .i_reconfig_eth_byteenable        (p0_eth_reconfig_reg_byteenable), 
              .o_reconfig_eth_readdata          (p0_eth_reconfig_readdata), 
              .o_reconfig_eth_readdata_valid    (p0_eth_reconfig_readdatavalid),
              .i_reconfig_eth_writedata         (p0_eth_reconfig_reg_writedata), 
              .o_reconfig_eth_waitrequest       (p0_eth_reconfig_waitrequest),
              // XCVR AVMM
              .i_reconfig_xcvr0_addr             (p0_c0_xcvr_reconfig_address),   
              .i_reconfig_xcvr0_read             (p0_c0_xcvr_reconfig_read),          
              .i_reconfig_xcvr0_write            (p0_c0_xcvr_reconfig_write),         
              .i_reconfig_xcvr0_byteenable       (p0_c0_xcvr_reconfig_byteenable),         
              .o_reconfig_xcvr0_readdata         (p0_c0_xcvr_reconfig_readdata),  
              .o_reconfig_xcvr0_readdata_valid   (p0_c0_xcvr_reconfig_readdatavalid),  
              .i_reconfig_xcvr0_writedata        (p0_c0_xcvr_reconfig_writedata),     
              .o_reconfig_xcvr0_waitrequest      (p0_c0_xcvr_reconfig_waitrequest),
               //Datapath Interface
              //MAC segemented
              .i_tx_mac_data                      (p0_avst_tx_mac_data),
              .i_tx_mac_valid                     (p0_avst_tx_mac_valid),
              .i_tx_mac_inframe                   (p0_avst_tx_mac_inframe),
              .i_tx_mac_eop_empty                 (p0_avst_tx_mac_eop_empty),
              .o_tx_mac_ready                     (p0_avst_tx_mac_ready),
              .i_tx_mac_error                     (p0_avst_tx_mac_error),
              .i_tx_mac_skip_crc                  (p0_avst_tx_mac_skip_crc),
              .o_rx_mac_data                      (p0_avst_rx_mac_data),
              .o_rx_mac_valid                     (p0_avst_rx_mac_valid),
              .o_rx_mac_inframe                   (p0_avst_rx_mac_inframe),
              .o_rx_mac_eop_empty                 (p0_avst_rx_mac_eop_empty),
              .o_rx_mac_error                     (p0_avst_rx_mac_error),
              .o_rx_mac_fcs_error                 (p0_avst_rx_mac_fcs_error),
              .o_rx_mac_status                    (p0_avst_rx_mac_status),
              .i_tx_pause                    (p0_tx_pause_mux),
              .o_rx_pause                    (p0_rx_pause_from_mac),
              // PFC support is added only for C0 devices in case of 200G and 400G
              .i_tx_pfc                      (p0_tx_pfc_mux),
              .o_rx_pfc                      (p0_rx_pfc_from_mac),

              // PTP IF
               .i_ptp_tx_tod_valid                 (p0_app_ss_st_txtod_tvalid),               
               .i_ptp_tx_tod                       (p0_app_ss_st_txtod_tdata),                     
               .i_ptp_rx_tod_valid                 (p0_app_ss_st_rxtod_tvalid),               
               .i_ptp_rx_tod                       (p0_app_ss_st_rxtod_tdata),                     
               //.o_p0_ptp_ets_valid               (p0_ss_app_st_txegrts0_tvalid),               
               //.o_p0_ptp_ets                     (p0_ss_app_st_txegrts0_tdata[95:0]),
               //.o_p0_ptp_ets_fp                  (p0_ss_app_st_txegrts0_tdata[PORT0_PTP_FP_WIDTH+95:96]), 
              // from ip top/bridge
               //.ptp_link                         (ptp_link),                            
               .i_ptp_ins_ets                      (p0_ptp_ins_ets),                    
               .i_ptp_ins_cf                       (p0_ptp_ins_cf),                     
               .i_ptp_zero_csum                    (p0_ptp_zero_csum),                  
               .i_ptp_update_eb                    (p0_ptp_update_eb),               
               .i_ptp_p2p                          (p0_ptp_p2p),                     
               .i_ptp_asym                         (p0_ptp_asym),                    
               .i_ptp_asym_sign                    (p0_ptp_asym_sign),               
               .i_ptp_asym_p2p_idx                 (p0_ptp_asym_p2p_idx),            
               .i_ptp_ts_offset                    (p0_ptp_ts_offset),               
               .i_ptp_cf_offset                    (p0_ptp_cf_offset),               
               .i_ptp_csum_offset                  (p0_ptp_csum_offset),             
               .i_ptp_tx_its                       (p0_ptp_tx_its),                  
               .i_ptp_ts_req                       (p0_ptp_ts_req),                  
               .i_ptp_fp                           (p0_ptp_fp[0][PORT0_PTP_FP_WIDTH-1:0]),
               //.o_p0_ptp_rx_its                  (p0_ptp_rx_its),                  
               //.o_p0_tx_ptp_offset_data_valid    (o_p0_tx_ptp_offset_data_valid),   //ask CY 
               //.o_p0_rx_ptp_offset_data_valid    (o_p0_rx_ptp_offset_data_valid),   //ask CY
               //.o_p0_tx_ptp_ready                (o_p0_tx_ptp_ready),                          
               //.o_p0_rx_ptp_ready                (o_p0_rx_ptp_ready),                
               .ptp_link                           (ptp_link),                            
                .o_ptp_ets_valid                    (p0_ss_app_st_txegrts0_tvalid),               
               .o_ptp_ets                          (p0_ss_app_st_txegrts0_tdata[95:0]),
               .o_ptp_ets_fp                       (p0_ss_app_st_txegrts0_tdata[PORT0_PTP_FP_WIDTH+95:96]),
               .o_ptp_rx_its                       (p0_ptp_rx_its),                  
               .o_tx_ptp_offset_data_valid         (o_p0_tx_ptp_offset_data_valid),   //ask CY 
               .o_rx_ptp_offset_data_valid         (o_p0_rx_ptp_offset_data_valid),   //ask CY
               .o_tx_ptp_ready                     (o_p0_tx_ptp_ready),                          
               .o_rx_ptp_ready                     (o_p0_rx_ptp_ready),                
    
        ///////////////////////////////////////////////////////////////
              //Status signals goes to user if
              .o_tx_lanes_stable                (p0_tx_lanes_stable),    
              .o_rx_pcs_ready                   (p0_rx_pcs_ready),       
                .o_rx_pcs_fully_aligned           (o_p0_rx_pcs_fully_aligned),
                .o_tx_pll_locked                  (o_p0_tx_pll_locked),         //Signal to indicate that the TX PLL has locked.
                //stauts siganls to SS CSR module
                .o_rx_block_lock                  (p0_rx_block_lock),                   // Asserted when 66b block alignment is finished on all PCS lanes.
                .o_rx_am_lock                     (p0_rx_am_lock),                      // Asserted when RX PCS has found detected alignment markers and deskewed PCS lanes.
                .o_local_fault_status             (p0_local_fault_status),              // The RX PCS has detected a problem that prevents it from being able to receive data.
                .o_remote_fault_status            (p0_remote_fault_status),             // The remote link partner has sent remote fault ordered sets indicating that it is unable to receive data.
                .o_rx_hi_ber                      (p0_rx_hi_ber),                       // Signal to indicate that the PMA has locked to data.
                                                                                              
                .o_cdr_lock                       (p0_cdr_lock),                        //Signal to indicate that the PMA has locked to data.
              //.o_sys_pll_locked                    (p0_sys_pll_locked),          //Signal to indicate that the o_clk_pll is good to use
            
              //Custom IF
           //   .i_sl_custom_cadence              (i_custom_cadence),  //this needs to be driven in CPRI PCS case also
              //DL IF
           //   .o_sl_tx_dl_async_pulse           (o_sl_tx_dl_async_pulse),
           //   .o_sl_rx_dl_async_pulse           (o_sl_rx_dl_async_pulse),
           //   .i_sl_latency_sclk                (i_sl_latency_sclk),
           //   .i_sl_tx_dl_measure_sel           (i_sl_tx_dl_measure_sel),
           //   .i_sl_rx_dl_measure_sel           (i_sl_rx_dl_measure_sel),
              //
          //    .o_sl_txfifo_pfull                (o_sl_txfifo_pfull),    
          //    .o_sl_txfifo_pempty               (o_sl_txfifo_pempty),   
          //    .o_sl_txfifo_overflow             (o_sl_txfifo_overflow), 
          //    .o_sl_txfifo_underflow            (o_sl_txfifo_underflow),
                     
          //    .o_rx_am_lock                     (o_rx_am_lock_int),     
              //common
              .i_stats_snapshot                 (1'b0)                                 // Record snapshot of current state of statistics registers.      
            );



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Start of MRIP
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


       assign o_p0_txfifo_pfull     = 1'b0;
       assign o_p0_txfifo_pempty    = 1'b0;
       assign o_p0_txfifo_overflow  = 1'b0;
       assign o_p0_txfifo_underflow = 1'b0;
     

//***************************************************************************************************
//************************************* Control path Wrapper  ***************************************
//***************************************************************************************************

wire [1-1:0] p0_tx_rst_ack_n_mask;
wire [1-1:0] p0_rx_rst_ack_n_mask;
wire [1-1:0] p0_csr_rst_ack_n_mask;
wire                               w_p0_tx_rst_ack_n;
wire                               w_p0_rx_rst_ack_n;
wire [1-1:0] p1_tx_rst_ack_n_mask;
wire [1-1:0] p1_rx_rst_ack_n_mask;
wire [1-1:0] p1_csr_rst_ack_n_mask;
wire                               w_p1_tx_rst_ack_n;
wire                               w_p1_rx_rst_ack_n;
wire [1-1:0] p2_tx_rst_ack_n_mask;
wire [1-1:0] p2_rx_rst_ack_n_mask;
wire [1-1:0] p2_csr_rst_ack_n_mask;
wire                               w_p2_tx_rst_ack_n;
wire                               w_p2_rx_rst_ack_n;
wire [1-1:0] p3_tx_rst_ack_n_mask;
wire [1-1:0] p3_rx_rst_ack_n_mask;
wire [1-1:0] p3_csr_rst_ack_n_mask;
wire                               w_p3_tx_rst_ack_n;
wire                               w_p3_rx_rst_ack_n;
wire [1-1:0] p4_tx_rst_ack_n_mask;
wire [1-1:0] p4_rx_rst_ack_n_mask;
wire [1-1:0] p4_csr_rst_ack_n_mask;
wire                               w_p4_tx_rst_ack_n;
wire                               w_p4_rx_rst_ack_n;
wire [1-1:0] p5_tx_rst_ack_n_mask;
wire [1-1:0] p5_rx_rst_ack_n_mask;
wire [1-1:0] p5_csr_rst_ack_n_mask;
wire                               w_p5_tx_rst_ack_n;
wire                               w_p5_rx_rst_ack_n;
wire [1-1:0] p6_tx_rst_ack_n_mask;
wire [1-1:0] p6_rx_rst_ack_n_mask;
wire [1-1:0] p6_csr_rst_ack_n_mask;
wire                               w_p6_tx_rst_ack_n;
wire                               w_p6_rx_rst_ack_n;
wire [1-1:0] p7_tx_rst_ack_n_mask;
wire [1-1:0] p7_rx_rst_ack_n_mask;
wire [1-1:0] p7_csr_rst_ack_n_mask;
wire                               w_p7_tx_rst_ack_n;
wire                               w_p7_rx_rst_ack_n;
wire [1-1:0] p8_tx_rst_ack_n_mask;
wire [1-1:0] p8_rx_rst_ack_n_mask;
wire [1-1:0] p8_csr_rst_ack_n_mask;
wire                               w_p8_tx_rst_ack_n;
wire                               w_p8_rx_rst_ack_n;
wire [1-1:0] p9_tx_rst_ack_n_mask;
wire [1-1:0] p9_rx_rst_ack_n_mask;
wire [1-1:0] p9_csr_rst_ack_n_mask;
wire                               w_p9_tx_rst_ack_n;
wire                               w_p9_rx_rst_ack_n;
wire [1-1:0] p10_tx_rst_ack_n_mask;
wire [1-1:0] p10_rx_rst_ack_n_mask;
wire [1-1:0] p10_csr_rst_ack_n_mask;
wire                               w_p10_tx_rst_ack_n;
wire                               w_p10_rx_rst_ack_n;
wire [1-1:0] p11_tx_rst_ack_n_mask;
wire [1-1:0] p11_rx_rst_ack_n_mask;
wire [1-1:0] p11_csr_rst_ack_n_mask;
wire                               w_p11_tx_rst_ack_n;
wire                               w_p11_rx_rst_ack_n;
wire [1-1:0] p12_tx_rst_ack_n_mask;
wire [1-1:0] p12_rx_rst_ack_n_mask;
wire [1-1:0] p12_csr_rst_ack_n_mask;
wire                               w_p12_tx_rst_ack_n;
wire                               w_p12_rx_rst_ack_n;
wire [1-1:0] p13_tx_rst_ack_n_mask;
wire [1-1:0] p13_rx_rst_ack_n_mask;
wire [1-1:0] p13_csr_rst_ack_n_mask;
wire                               w_p13_tx_rst_ack_n;
wire                               w_p13_rx_rst_ack_n;
wire [1-1:0] p14_tx_rst_ack_n_mask;
wire [1-1:0] p14_rx_rst_ack_n_mask;
wire [1-1:0] p14_csr_rst_ack_n_mask;
wire                               w_p14_tx_rst_ack_n;
wire                               w_p14_rx_rst_ack_n;
wire [1-1:0] p15_tx_rst_ack_n_mask;
wire [1-1:0] p15_rx_rst_ack_n_mask;
wire [1-1:0] p15_csr_rst_ack_n_mask;
wire                               w_p15_tx_rst_ack_n;
wire                               w_p15_rx_rst_ack_n;
wire [1-1:0] p16_tx_rst_ack_n_mask;
wire [1-1:0] p16_rx_rst_ack_n_mask;
wire [1-1:0] p16_csr_rst_ack_n_mask;
wire                               w_p16_tx_rst_ack_n;
wire                               w_p16_rx_rst_ack_n;
wire [1-1:0] p17_tx_rst_ack_n_mask;
wire [1-1:0] p17_rx_rst_ack_n_mask;
wire [1-1:0] p17_csr_rst_ack_n_mask;
wire                               w_p17_tx_rst_ack_n;
wire                               w_p17_rx_rst_ack_n;
wire [1-1:0] p18_tx_rst_ack_n_mask;
wire [1-1:0] p18_rx_rst_ack_n_mask;
wire [1-1:0] p18_csr_rst_ack_n_mask;
wire                               w_p18_tx_rst_ack_n;
wire                               w_p18_rx_rst_ack_n;
wire [1-1:0] p19_tx_rst_ack_n_mask;
wire [1-1:0] p19_rx_rst_ack_n_mask;
wire [1-1:0] p19_csr_rst_ack_n_mask;
wire                               w_p19_tx_rst_ack_n;
wire                               w_p19_rx_rst_ack_n;


//*********************************************************************************
// -- Soft Reset Controller
//*********************************************************************************
hssi_ss_f_reset_sequencer_4nezbiy #(
    .NUM_PORTS(1),
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
        .o_p0_rx_rst_n(p0_rx_rst_n),                                // QHIP Rx Reset, Active Low
        .i_p0_rx_rst_ack_n(p0_rx_rst_ack_n_mask[0]),                        // QHIP Rx Reset Ack, Active Low
        .o_p0_rx_rst_ack_n(w_p0_rx_rst_ack_n),                      // QHIP Rx Reset Ack, Active Low
        .o_p0_tx_rst_n(p0_tx_rst_n),                                // QHIP Tx Reset, Active Low
        .i_p0_tx_rst_ack_n(p0_tx_rst_ack_n_mask[0]),                        // tx reset ack from EHIP to SRC & NIOS
        .o_p0_tx_rst_ack_n(w_p0_tx_rst_ack_n),                      // tx reset ack from SRC to user
        .o_p0_csr_rst_n(p0_csr_rst_n),                              // QHIP CSR Reset, Active Low
        .i_p0_csr_rst_ack_n(p0_csr_rst_ack_n_mask[0]),                              // QHIP CSR Reset, Active Low
        .o_p0_ereset_n(o_p0_ereset_n),

        .i_p0_pio_axi_st_bridge_rst_n(p0_pio_axi_st_bridge_rst_n),   // PIO_0 from NIOS
        .i_p0_pio_ehip_tx_rst_n(p0_pio_ehip_tx_rst_n),         // PIO_1 from NIOS
        .i_p0_pio_ehip_rx_rst_n(p0_pio_ehip_rx_rst_n),         // PIO_2 from NIOS
        .i_p0_pio_ereset_n (p0_pio_ereset_n),              // PIO_3 from NIOS

        .o_p0_reconfig_rst(p0_reconfig_rst),                 // QHIP Reconfig Reset, Active High
        .i_subsystem_cold_rst_n(subsystem_cold_rst_n),            // Subsystem cold reset input, Active Low
        .o_subsystem_cold_rst_ack_n(subsystem_cold_rst_ack_n),
        .i_app_ss_lite_clk(app_ss_lite_clk),                 // AXI Lite bridge Clock Input
        .i_app_ss_lite_areset_n(app_ss_lite_areset_n),            // AXI Lite bridge Reset Input
        .i_nios_clk(app_ss_lite_clk), //i_nios_clk),                        // NIOS Clock Input
        .o_axi_lite_bridge_rst_n(axi_lite_bridge_rst_n),           // AXI Lite bridge Reset, Active Low
        .o_nios_rst_n(nios_rst_n)                       // NIOS Reset, Active Low
        );

// ==========================================================================
//  PFC 
// ==========================================================================

//Muxing b/w PFC & NON-PFC AXI ST
      // assign p0_app_ss_st_tx_tvalid_mux                = (0) ? p0_pfc_mac_st_tx_tvalid               : p0_app_ss_st_tx_tvalid;
      // assign p0_app_ss_st_tx_tdata_mux                 = (0) ? p0_pfc_mac_st_tx_tdata                : p0_app_ss_st_tx_tdata;
      // assign p0_app_ss_st_tx_tlast_mux                 = (0) ? p0_pfc_mac_st_tx_tlast                : p0_app_ss_st_tx_tlast;
      // assign p0_app_ss_st_tx_tkeep_mux                 = (0) ? p0_pfc_mac_st_tx_tkeep                : p0_app_ss_st_tx_tkeep;
      // assign p0_app_ss_st_tx_tuser_client_mux          = (0) ? p0_pfc_mac_st_tx_tuser_client         : p0_app_ss_st_tx_tuser_client;
      // assign p0_app_ss_st_tx_tuser_ptp_mux             = (0) ? p0_pfc_mac_st_tx_tuser_ptp            : p0_app_ss_st_tx_tuser_ptp;
      // assign p0_app_ss_st_tx_tuser_ptp_extended_mux    = (0) ? p0_pfc_mac_st_tx_tuser_ptp_extended   : p0_app_ss_st_tx_tuser_ptp_extended;
      // assign p0_app_ss_st_tx_tuser_last_segment_mux    = (0) ? 'd0 : (0) ?  p0_pfc_mac_st_tx_tuser_last_segment   : p0_app_ss_st_tx_tuser_last_segment;
      // assign p0_app_ss_st_tx_tuser_pkt_seg_parity_mux  = (0) ? p0_pfc_mac_st_tx_tuser_pkt_seg_parity : p0_app_ss_st_tx_tuser_pkt_seg_parity;
      
      // assign p0_ss_app_st_tx_tready                    = (0) ? p0_pfc_app_st_tx_tready               : p0_ss_app_st_tx_tready_mux;
//TODO:check with harish if disabled
//assign o_p0_rx_pfc                               = (0) ? p0_rx_pfc_from_pfc                    : p0_rx_pfc_from_mac;
//assign p0_tx_pfc_mux                             = (0) ? p0_tx_pfc_from_pfc                    : i_p0_tx_pfc;
      
//TODO: If buffering en without flow control. Is it possible? OR GUI restrict 
     assign p0_tx_pfc_mux   = i_p0_tx_pfc;
     assign o_p0_rx_pfc     = p0_rx_pfc_from_mac;
     assign p0_tx_pause_mux = i_p0_tx_pause;
     assign o_p0_rx_pause   = p0_rx_pause_from_mac;

//RX 
     //assign p0_ss_app_st_rx_tvalid               = 0 ? p0_pfc_app_st_rx_tvalid                  : p0_ss_app_st_rx_tvalid_mux;  
     //assign p0_ss_app_st_rx_tdata                = 0 ? p0_pfc_app_st_rx_tdata                   : p0_ss_app_st_rx_tdata_mux;
     //assign p0_ss_app_st_rx_tlast                = 0 ? p0_pfc_app_st_rx_tlast                   : p0_ss_app_st_rx_tlast_mux;
     //assign p0_ss_app_st_rx_tuser_last_segment   = 0 ? 'd0 : 0 ? p0_pfc_app_st_rx_tuser_last_segment      : p0_ss_app_st_rx_tuser_last_segment_mux;
     //assign p0_ss_app_st_rx_tkeep                = 0 ? p0_pfc_app_st_rx_tkeep                   : p0_ss_app_st_rx_tkeep_mux;
     //assign p0_ss_app_st_rx_tuser_client         = 0 ? p0_pfc_app_st_rx_tuser_client             : p0_ss_app_st_rx_tuser_client_mux;                                                        
     //assign p0_ss_app_st_rx_tuser_sts            = 0 ? p0_pfc_app_st_rx_tuser_sts                : p0_ss_app_st_rx_tuser_sts_mux;           
     //assign p0_ss_app_st_rx_tuser_sts_extended   = 0 ? p0_pfc_app_st_rx_tuser_sts_extended      : p0_ss_app_st_rx_tuser_sts_extended_mux;
     //assign p0_ss_app_st_rx_tuser_pkt_seg_parity = 0 ? p0_pfc_app_st_rx_tuser_pkt_seg_parity    : p0_ss_app_st_rx_tuser_pkt_seg_parity_mux;

// ==========================================================================
//  Contorl path wrapper for axi lite bridge, csr, nios,jtag 
// ==========================================================================
hssi_ss_f_cntrl_path_wrapper_4nezbiy 
#(
//  HSSI SS top level parameters
     .PORT0_ENABLED               (PORT0_ENABLED), 
     .PORT0_PROFILE               (PORT0_PROFILE), 
     .PORT0_SUB_PROFILE           (PORT0_SUB_PROFILE), 
     .PORT0_RSFEC                 (PORT0_RSFEC), 
     .PORT0_PTP                   (PORT0_PTP), 
     .PORT0_READY_LATENCY         (PORT0_READY_LATENCY), 
     .PORT0_DR_EXT_SUBSYS         (PORT0_DR_EXT_SUBSYS), 
     .PORT0_PR_DR_ENABLE           (PORT0_PR_DR_ENABLE), 
     .PORT0_LOW_SPEED_ETH         (PORT0_LOW_SPEED_ETH), 
     .PORT1_ENABLED               (PORT1_ENABLED), 
     .PORT1_PROFILE               (PORT1_PROFILE), 
     .PORT1_SUB_PROFILE           (PORT1_SUB_PROFILE), 
     .PORT1_RSFEC                 (PORT1_RSFEC), 
     .PORT1_PTP                   (PORT1_PTP), 
     .PORT1_READY_LATENCY         (PORT1_READY_LATENCY), 
     .PORT1_DR_EXT_SUBSYS         (PORT1_DR_EXT_SUBSYS), 
     .PORT1_PR_DR_ENABLE           (PORT1_PR_DR_ENABLE), 
     .PORT1_LOW_SPEED_ETH         (PORT1_LOW_SPEED_ETH), 
     .PORT2_ENABLED               (PORT2_ENABLED), 
     .PORT2_PROFILE               (PORT2_PROFILE), 
     .PORT2_SUB_PROFILE           (PORT2_SUB_PROFILE), 
     .PORT2_RSFEC                 (PORT2_RSFEC), 
     .PORT2_PTP                   (PORT2_PTP), 
     .PORT2_READY_LATENCY         (PORT2_READY_LATENCY), 
     .PORT2_DR_EXT_SUBSYS         (PORT2_DR_EXT_SUBSYS), 
     .PORT2_PR_DR_ENABLE           (PORT2_PR_DR_ENABLE), 
     .PORT2_LOW_SPEED_ETH         (PORT2_LOW_SPEED_ETH), 
     .PORT3_ENABLED               (PORT3_ENABLED), 
     .PORT3_PROFILE               (PORT3_PROFILE), 
     .PORT3_SUB_PROFILE           (PORT3_SUB_PROFILE), 
     .PORT3_RSFEC                 (PORT3_RSFEC), 
     .PORT3_PTP                   (PORT3_PTP), 
     .PORT3_READY_LATENCY         (PORT3_READY_LATENCY), 
     .PORT3_DR_EXT_SUBSYS         (PORT3_DR_EXT_SUBSYS), 
     .PORT3_PR_DR_ENABLE           (PORT3_PR_DR_ENABLE), 
     .PORT3_LOW_SPEED_ETH         (PORT3_LOW_SPEED_ETH), 
     .PORT4_ENABLED               (PORT4_ENABLED), 
     .PORT4_PROFILE               (PORT4_PROFILE), 
     .PORT4_SUB_PROFILE           (PORT4_SUB_PROFILE), 
     .PORT4_RSFEC                 (PORT4_RSFEC), 
     .PORT4_PTP                   (PORT4_PTP), 
     .PORT4_READY_LATENCY         (PORT4_READY_LATENCY), 
     .PORT4_DR_EXT_SUBSYS         (PORT4_DR_EXT_SUBSYS), 
     .PORT4_PR_DR_ENABLE           (PORT4_PR_DR_ENABLE), 
     .PORT4_LOW_SPEED_ETH         (PORT4_LOW_SPEED_ETH), 
     .PORT5_ENABLED               (PORT5_ENABLED), 
     .PORT5_PROFILE               (PORT5_PROFILE), 
     .PORT5_SUB_PROFILE           (PORT5_SUB_PROFILE), 
     .PORT5_RSFEC                 (PORT5_RSFEC), 
     .PORT5_PTP                   (PORT5_PTP), 
     .PORT5_READY_LATENCY         (PORT5_READY_LATENCY), 
     .PORT5_DR_EXT_SUBSYS         (PORT5_DR_EXT_SUBSYS), 
     .PORT5_PR_DR_ENABLE           (PORT5_PR_DR_ENABLE), 
     .PORT5_LOW_SPEED_ETH         (PORT5_LOW_SPEED_ETH), 
     .PORT6_ENABLED               (PORT6_ENABLED), 
     .PORT6_PROFILE               (PORT6_PROFILE), 
     .PORT6_SUB_PROFILE           (PORT6_SUB_PROFILE), 
     .PORT6_RSFEC                 (PORT6_RSFEC), 
     .PORT6_PTP                   (PORT6_PTP), 
     .PORT6_READY_LATENCY         (PORT6_READY_LATENCY), 
     .PORT6_DR_EXT_SUBSYS         (PORT6_DR_EXT_SUBSYS), 
     .PORT6_PR_DR_ENABLE           (PORT6_PR_DR_ENABLE), 
     .PORT6_LOW_SPEED_ETH         (PORT6_LOW_SPEED_ETH), 
     .PORT7_ENABLED               (PORT7_ENABLED), 
     .PORT7_PROFILE               (PORT7_PROFILE), 
     .PORT7_SUB_PROFILE           (PORT7_SUB_PROFILE), 
     .PORT7_RSFEC                 (PORT7_RSFEC), 
     .PORT7_PTP                   (PORT7_PTP), 
     .PORT7_READY_LATENCY         (PORT7_READY_LATENCY), 
     .PORT7_DR_EXT_SUBSYS         (PORT7_DR_EXT_SUBSYS), 
     .PORT7_PR_DR_ENABLE           (PORT7_PR_DR_ENABLE), 
     .PORT7_LOW_SPEED_ETH         (PORT7_LOW_SPEED_ETH), 
     .PORT8_ENABLED               (PORT8_ENABLED), 
     .PORT8_PROFILE               (PORT8_PROFILE), 
     .PORT8_SUB_PROFILE           (PORT8_SUB_PROFILE), 
     .PORT8_RSFEC                 (PORT8_RSFEC), 
     .PORT8_PTP                   (PORT8_PTP), 
     .PORT8_READY_LATENCY         (PORT8_READY_LATENCY), 
     .PORT8_DR_EXT_SUBSYS         (PORT8_DR_EXT_SUBSYS), 
     .PORT8_PR_DR_ENABLE           (PORT8_PR_DR_ENABLE), 
     .PORT8_LOW_SPEED_ETH         (PORT8_LOW_SPEED_ETH), 
     .PORT9_ENABLED               (PORT9_ENABLED), 
     .PORT9_PROFILE               (PORT9_PROFILE), 
     .PORT9_SUB_PROFILE           (PORT9_SUB_PROFILE), 
     .PORT9_RSFEC                 (PORT9_RSFEC), 
     .PORT9_PTP                   (PORT9_PTP), 
     .PORT9_READY_LATENCY         (PORT9_READY_LATENCY), 
     .PORT9_DR_EXT_SUBSYS         (PORT9_DR_EXT_SUBSYS), 
     .PORT9_PR_DR_ENABLE           (PORT9_PR_DR_ENABLE), 
     .PORT9_LOW_SPEED_ETH         (PORT9_LOW_SPEED_ETH), 
     .PORT10_ENABLED               (PORT10_ENABLED), 
     .PORT10_PROFILE               (PORT10_PROFILE), 
     .PORT10_SUB_PROFILE           (PORT10_SUB_PROFILE), 
     .PORT10_RSFEC                 (PORT10_RSFEC), 
     .PORT10_PTP                   (PORT10_PTP), 
     .PORT10_READY_LATENCY         (PORT10_READY_LATENCY), 
     .PORT10_DR_EXT_SUBSYS         (PORT10_DR_EXT_SUBSYS), 
     .PORT10_PR_DR_ENABLE           (PORT10_PR_DR_ENABLE), 
     .PORT10_LOW_SPEED_ETH         (PORT10_LOW_SPEED_ETH), 
     .PORT11_ENABLED               (PORT11_ENABLED), 
     .PORT11_PROFILE               (PORT11_PROFILE), 
     .PORT11_SUB_PROFILE           (PORT11_SUB_PROFILE), 
     .PORT11_RSFEC                 (PORT11_RSFEC), 
     .PORT11_PTP                   (PORT11_PTP), 
     .PORT11_READY_LATENCY         (PORT11_READY_LATENCY), 
     .PORT11_DR_EXT_SUBSYS         (PORT11_DR_EXT_SUBSYS), 
     .PORT11_PR_DR_ENABLE           (PORT11_PR_DR_ENABLE), 
     .PORT11_LOW_SPEED_ETH         (PORT11_LOW_SPEED_ETH), 
     .PORT12_ENABLED               (PORT12_ENABLED), 
     .PORT12_PROFILE               (PORT12_PROFILE), 
     .PORT12_SUB_PROFILE           (PORT12_SUB_PROFILE), 
     .PORT12_RSFEC                 (PORT12_RSFEC), 
     .PORT12_PTP                   (PORT12_PTP), 
     .PORT12_READY_LATENCY         (PORT12_READY_LATENCY), 
     .PORT12_DR_EXT_SUBSYS         (PORT12_DR_EXT_SUBSYS), 
     .PORT12_PR_DR_ENABLE           (PORT12_PR_DR_ENABLE), 
     .PORT12_LOW_SPEED_ETH         (PORT12_LOW_SPEED_ETH), 
     .PORT13_ENABLED               (PORT13_ENABLED), 
     .PORT13_PROFILE               (PORT13_PROFILE), 
     .PORT13_SUB_PROFILE           (PORT13_SUB_PROFILE), 
     .PORT13_RSFEC                 (PORT13_RSFEC), 
     .PORT13_PTP                   (PORT13_PTP), 
     .PORT13_READY_LATENCY         (PORT13_READY_LATENCY), 
     .PORT13_DR_EXT_SUBSYS         (PORT13_DR_EXT_SUBSYS), 
     .PORT13_PR_DR_ENABLE           (PORT13_PR_DR_ENABLE), 
     .PORT13_LOW_SPEED_ETH         (PORT13_LOW_SPEED_ETH), 
     .PORT14_ENABLED               (PORT14_ENABLED), 
     .PORT14_PROFILE               (PORT14_PROFILE), 
     .PORT14_SUB_PROFILE           (PORT14_SUB_PROFILE), 
     .PORT14_RSFEC                 (PORT14_RSFEC), 
     .PORT14_PTP                   (PORT14_PTP), 
     .PORT14_READY_LATENCY         (PORT14_READY_LATENCY), 
     .PORT14_DR_EXT_SUBSYS         (PORT14_DR_EXT_SUBSYS), 
     .PORT14_PR_DR_ENABLE           (PORT14_PR_DR_ENABLE), 
     .PORT14_LOW_SPEED_ETH         (PORT14_LOW_SPEED_ETH), 
     .PORT15_ENABLED               (PORT15_ENABLED), 
     .PORT15_PROFILE               (PORT15_PROFILE), 
     .PORT15_SUB_PROFILE           (PORT15_SUB_PROFILE), 
     .PORT15_RSFEC                 (PORT15_RSFEC), 
     .PORT15_PTP                   (PORT15_PTP), 
     .PORT15_READY_LATENCY         (PORT15_READY_LATENCY), 
     .PORT15_DR_EXT_SUBSYS         (PORT15_DR_EXT_SUBSYS), 
     .PORT15_PR_DR_ENABLE           (PORT15_PR_DR_ENABLE), 
     .PORT15_LOW_SPEED_ETH         (PORT15_LOW_SPEED_ETH), 
     .PORT16_ENABLED               (PORT16_ENABLED), 
     .PORT16_PROFILE               (PORT16_PROFILE), 
     .PORT16_SUB_PROFILE           (PORT16_SUB_PROFILE), 
     .PORT16_RSFEC                 (PORT16_RSFEC), 
     .PORT16_PTP                   (PORT16_PTP), 
     .PORT16_READY_LATENCY         (PORT16_READY_LATENCY), 
     .PORT16_DR_EXT_SUBSYS         (PORT16_DR_EXT_SUBSYS), 
     .PORT16_PR_DR_ENABLE           (PORT16_PR_DR_ENABLE), 
     .PORT16_LOW_SPEED_ETH         (PORT16_LOW_SPEED_ETH), 
     .PORT17_ENABLED               (PORT17_ENABLED), 
     .PORT17_PROFILE               (PORT17_PROFILE), 
     .PORT17_SUB_PROFILE           (PORT17_SUB_PROFILE), 
     .PORT17_RSFEC                 (PORT17_RSFEC), 
     .PORT17_PTP                   (PORT17_PTP), 
     .PORT17_READY_LATENCY         (PORT17_READY_LATENCY), 
     .PORT17_DR_EXT_SUBSYS         (PORT17_DR_EXT_SUBSYS), 
     .PORT17_PR_DR_ENABLE           (PORT17_PR_DR_ENABLE), 
     .PORT17_LOW_SPEED_ETH         (PORT17_LOW_SPEED_ETH), 
     .PORT18_ENABLED               (PORT18_ENABLED), 
     .PORT18_PROFILE               (PORT18_PROFILE), 
     .PORT18_SUB_PROFILE           (PORT18_SUB_PROFILE), 
     .PORT18_RSFEC                 (PORT18_RSFEC), 
     .PORT18_PTP                   (PORT18_PTP), 
     .PORT18_READY_LATENCY         (PORT18_READY_LATENCY), 
     .PORT18_DR_EXT_SUBSYS         (PORT18_DR_EXT_SUBSYS), 
     .PORT18_PR_DR_ENABLE           (PORT18_PR_DR_ENABLE), 
     .PORT18_LOW_SPEED_ETH         (PORT18_LOW_SPEED_ETH), 
     .PORT19_ENABLED               (PORT19_ENABLED), 
     .PORT19_PROFILE               (PORT19_PROFILE), 
     .PORT19_SUB_PROFILE           (PORT19_SUB_PROFILE), 
     .PORT19_RSFEC                 (PORT19_RSFEC), 
     .PORT19_PTP                   (PORT19_PTP), 
     .PORT19_READY_LATENCY         (PORT19_READY_LATENCY), 
     .PORT19_DR_EXT_SUBSYS         (PORT19_DR_EXT_SUBSYS), 
     .PORT19_PR_DR_ENABLE           (PORT19_PR_DR_ENABLE), 
     .PORT19_LOW_SPEED_ETH         (PORT19_LOW_SPEED_ETH), 
     .tiles                                 (tiles), 
     .NUM_PORTS                            (NUM_PORTS), 
     .NUM_ENABLED_PORTS                    (NUM_ENABLED_PORTS), 
     .ENABLE_JTAG                          (ENABLE_JTAG), 
     .PARAM_DATA                           (PARAM_DATA), 
     .SWITCH_EXT_SUBSYS                    (SWITCH_EXT_SUBSYS), 
     .SET_AXI_LITE_RESPONSE_TO_ZERO        (SET_AXI_LITE_RESPONSE_TO_ZERO), 
     .DFHv0_FEA_VER                        (DFHv0_FEA_VER), 
     .DFHv0_FEA_MINOR                      (DFHv0_FEA_MINOR), 
     .DFHv0_FEA_EOL                        (DFHv0_FEA_EOL), 
     .DFHv0_FEA_NXT                        (DFHv0_FEA_NXT), 
     .DFHv0_FEA_REV                        (DFHv0_FEA_REV), 
     .DFHv0_FEA_FEAID                      (DFHv0_FEA_FEAID), 
     .DFHv0_FEA_FEATYPE                    (DFHv0_FEA_FEATYPE), 
     .DFHv1_INSTID                         (DFHv1_INSTID), 
     .MAJOR_VERSION                        (MAJOR_VERSION),
     .MINOR_VERSION                        (MINOR_VERSION),
     .DISABLE_DR_CPU                       (DISABLE_DR_CPU), 
     .SIM_MODE                             (SIM_MODE_EN), 
     .SIM_FAST_EN                          (SIM_FAST_EN), 
     .ENABLE_DUMMY_WAIT_REQ_GEN            (ENABLE_DUMMY_WAIT_REQ_GEN), 
     .HUNG_WAIT_TIME                       (HUNG_WAIT_TIME) 
    ) U_hssi_ss_ip_cntrl_path_wrapper(
  // ---------------
  // Clock Interface
  // --------------- 
  .app_ss_lite_clk                                        (app_ss_lite_clk), //set as clock type in tcl
  // ---------------
  // Reset Interface
  // --------------- 
  .i_axi_lite_bridge_rst_n                                (axi_lite_bridge_rst_n),
  .i_ss_csr_rst_n                                         (nios_rst_n),  
  .i_ss_nios_rst_n                                        (nios_rst_n),  
  // --------------------------------------------------------------
  // AXI Lite Control path Interface one control interface for all
  // PORTS/Channels
  // --------------------------------------------------------------
  // -- Input Write Address Channel  
  .app_ss_lite_awaddr                                     (app_ss_lite_awaddr),
  .app_ss_lite_awprot                                     (app_ss_lite_awprot),
  .app_ss_lite_awvalid                                    (app_ss_lite_awvalid),
  .ss_app_lite_awready                                    (ss_app_lite_awready),
                                                                               
  // -- Input Write Data Channel                                               
  .app_ss_lite_wdata                                      (app_ss_lite_wdata),
  .app_ss_lite_wstrb                                      (app_ss_lite_wstrb),
  .app_ss_lite_wvalid                                     (app_ss_lite_wvalid),
  .ss_app_lite_wready                                     (ss_app_lite_wready),
                                                                               
  // -- Output Write REsponse Channel                      
  .ss_app_lite_bresp                                      (ss_app_lite_bresp),
  .ss_app_lite_bvalid                                     (ss_app_lite_bvalid),
  .app_ss_lite_bready                                     (app_ss_lite_bready),
                                                                              
  // -- Input Read Address Channel                         
  .app_ss_lite_araddr                                     (app_ss_lite_araddr),
  .app_ss_lite_arprot                                     (app_ss_lite_arprot),
  .app_ss_lite_arvalid                                    (app_ss_lite_arvalid),
  .ss_app_lite_arready                                    (ss_app_lite_arready),
  // -- Output Read Data Channel                                              
  .app_ss_lite_rready                                     (app_ss_lite_rready),
  .ss_app_lite_rdata                                      (ss_app_lite_rdata),
  .ss_app_lite_rvalid                                     (ss_app_lite_rvalid),
  .ss_app_lite_rresp                                      (ss_app_lite_rresp), 
  // -----------------------------------------
  // -----------------------------------------
          //EHIP eth reconfig AVMM
  .o_p0_eth_reconfig_address                       (p0_eth_reconfig_address   ),
  .o_p0_eth_reconfig_read                          (p0_eth_reconfig_read      ),
  .o_p0_eth_reconfig_write                         (p0_eth_reconfig_write     ),
  .i_p0_eth_reconfig_waitrequest                   (p0_eth_reconfig_reg_waitrequest),
  .i_p0_eth_reconfig_readdatavalid                 (p0_eth_reconfig_reg_readdatavalid),
  .o_p0_eth_reconfig_byteenable                    (p0_eth_reconfig_byteenable),
  .i_p0_eth_reconfig_readdata                      (p0_eth_reconfig_reg_readdata  ),
  .o_p0_eth_reconfig_writedata                     (p0_eth_reconfig_writedata ),
          //EHIP XCVR AVMM reconfig
  .o_p0_c0_xcvr_reconfig_address            (p0_c0_xcvr_reconfig_address),     
  .o_p0_c0_xcvr_reconfig_read               (p0_c0_xcvr_reconfig_read),        
  .o_p0_c0_xcvr_reconfig_write              (p0_c0_xcvr_reconfig_write),       
  .i_p0_c0_xcvr_reconfig_waitrequest        (p0_c0_xcvr_reconfig_waitrequest),  
  .i_p0_c0_xcvr_reconfig_readdatavalid      (p0_c0_xcvr_reconfig_readdatavalid),    
  .o_p0_c0_xcvr_reconfig_byteenable         (p0_c0_xcvr_reconfig_byteenable),
  .i_p0_c0_xcvr_reconfig_readdata           (p0_c0_xcvr_reconfig_readdata),   
  .o_p0_c0_xcvr_reconfig_writedata          (p0_c0_xcvr_reconfig_writedata), 

  .i_dr_in_progress                                          (dr_in_progress), 
  //PTP TX classifier reconfig interface


  //Reconfig interface to PTP tile adaptor
  .o_ptp_asym_reconfig_address                                (ptp_asym_reconfig_address),
  .o_ptp_asym_reconfig_read                                   (ptp_asym_reconfig_read),
  .o_ptp_asym_reconfig_write                                  (ptp_asym_reconfig_write),
  .i_ptp_asym_reconfig_waitrequest                            (ptp_asym_reconfig_waitrequest),
  .i_ptp_asym_reconfig_readdatavalid                          (ptp_asym_reconfig_readdatavalid),
  .o_ptp_asym_reconfig_byteenable                             (ptp_asym_reconfig_byteenable),
  .i_ptp_asym_reconfig_readdata                               (ptp_asym_reconfig_readdata),
  .o_ptp_asym_reconfig_writedata                              (ptp_asym_reconfig_writedata),
  //Reconfig interface to PTP tile adaptor
  .o_ptp_p2p_reconfig_address                                 (ptp_p2p_reconfig_address),
  .o_ptp_p2p_reconfig_read                                    (ptp_p2p_reconfig_read),
  .o_ptp_p2p_reconfig_write                                   (ptp_p2p_reconfig_write),
  .i_ptp_p2p_reconfig_waitrequest                             (ptp_p2p_reconfig_waitrequest),
  .i_ptp_p2p_reconfig_readdatavalid                           (ptp_p2p_reconfig_readdatavalid),
  .o_ptp_p2p_reconfig_byteenable                              (ptp_p2p_reconfig_byteenable),
  .i_ptp_p2p_reconfig_readdata                                (ptp_p2p_reconfig_readdata),
  .o_ptp_p2p_reconfig_writedata                               (ptp_p2p_reconfig_writedata),
      
  // -----------------------------------------
  //          SS CSR module signals 
  // -----------------------------------------
  //EHIP output status signals connected to CSR
  .i_p0_rx_block_lock                                (p0_sync_rx_block_lock),
  .i_p0_rx_am_lock                                   (p0_sync_rx_am_lock),
  .i_p0_local_fault_status                           (p0_sync_local_fault_status),
  .i_p0_remote_fault_status                          (p0_sync_remote_fault_status),
  .i_p0_rx_hi_ber                                    (p0_sync_rx_hi_ber),
  .i_p0_ehip_ready                                   (1'b0), 
  .i_p0_cdr_lock                                     (p0_sync_cdr_lock),
  .i_p0_link_status                                  (p0_sync_link_status),

  .i_p0_tx_fifo_eccstatus                            (p0_tx_fifo_eccstatus[0]),
  .i_p0_axi_st_tx_parity_error                       (p0_axi_st_tx_parity_error[0]),
//-----------------------------------------------------------
  //LED debug control/status signals
  .o_csr_led_override_port                                    (csr_led_override_port),
  .o_csr_led_override_en                                      (csr_led_override_en),
  .o_csr_led_pulse_cntr                                       (csr_led_pulse_cntr),
  .o_csr_led_status                                           (csr_led_status),
  .o_csr_led_speed                                            (csr_led_speed),
  .i_hotplug_status_all                                       ({20{8'b0}}),
  .o_hotplug_control                                          (),
  // -----------------------------------------
  //              NIOS/SAL module signals
  // -----------------------------------------
  .o_po_pma_cal_done                                          (),
  .i_xcvr_ready                                               (xcvr_ready),
  .i_tx_pma_ready                                             ({20{1'b1}}),
  .i_rx_pma_ready                                             ({20{1'b1}}),
  .o_hotplug_disable_fm                                       (),
  .i_hotplug_paused_fm                                        ({20{1'b1}}),

  .i_p0_port_params                                  (p0_port_params), //Ftile p0_port_params drived locally
  .o_p0_ereset_n                                     (p0_pio_ereset_n),
  .o_p0_pio_axi_st_bridge_rst_n                      (p0_pio_axi_st_bridge_rst_n),
  .o_p0_pio_ehip_tx_rst_n                            (p0_pio_ehip_tx_rst_n),
  .o_p0_pio_ehip_rx_rst_n                            (p0_pio_ehip_rx_rst_n),
  .i_p0_ehip_tx_rst_ack_n                            (p0_tx_rst_ack_n_mask[0]),
  .i_p0_ehip_rx_rst_ack_n                            (p0_rx_rst_ack_n_mask[0]),
  .i_p1_port_params                                  (p1_port_params), //Ftile p1_port_params drived locally
  .i_p2_port_params                                  (p2_port_params), //Ftile p2_port_params drived locally
  .i_p3_port_params                                  (p3_port_params), //Ftile p3_port_params drived locally
  .i_p4_port_params                                  (p4_port_params), //Ftile p4_port_params drived locally
  .i_p5_port_params                                  (p5_port_params), //Ftile p5_port_params drived locally
  .i_p6_port_params                                  (p6_port_params), //Ftile p6_port_params drived locally
  .i_p7_port_params                                  (p7_port_params), //Ftile p7_port_params drived locally
  .i_p8_port_params                                  (p8_port_params), //Ftile p8_port_params drived locally
  .i_p9_port_params                                  (p9_port_params), //Ftile p9_port_params drived locally
  .i_p10_port_params                                  (p10_port_params), //Ftile p10_port_params drived locally
  .i_p11_port_params                                  (p11_port_params), //Ftile p11_port_params drived locally
  .i_p12_port_params                                  (p12_port_params), //Ftile p12_port_params drived locally
  .i_p13_port_params                                  (p13_port_params), //Ftile p13_port_params drived locally
  .i_p14_port_params                                  (p14_port_params), //Ftile p14_port_params drived locally
  .i_p15_port_params                                  (p15_port_params), //Ftile p15_port_params drived locally
  .i_p16_port_params                                  (p16_port_params), //Ftile p16_port_params drived locally
  .i_p17_port_params                                  (p17_port_params), //Ftile p17_port_params drived locally
  .i_p18_port_params                                  (p18_port_params), //Ftile p18_port_params drived locally
  .i_p19_port_params                                  (p19_port_params), //Ftile p19_port_params drived locally

  .tp //dummy
);
// Register signals to relax timing on eth_reconfig interface
  always@(posedge app_ss_lite_clk, negedge axi_lite_bridge_rst_n)
  begin
       if (!axi_lite_bridge_rst_n) begin
         p0_eth_reconfig_reg_address       <= '0; 
         p0_eth_reconfig_reg_read          <= '0; 
         p0_eth_reconfig_reg_write         <= '0; 
         p0_eth_reconfig_reg_byteenable    <= '0; 
         p0_eth_reconfig_reg_writedata     <= '0; 
         p0_eth_reconfig_reg_readdata      <= '0; 
         p0_eth_reconfig_reg_readdatavalid <= '0; 
         p0_eth_reconfig_reg_waitrequest   <= '1; 
       end else begin
         p0_eth_reconfig_reg_address       <=  p0_eth_reconfig_address;
         p0_eth_reconfig_reg_read          <=  p0_eth_reconfig_read;
         p0_eth_reconfig_reg_write         <=  p0_eth_reconfig_write;
         p0_eth_reconfig_reg_byteenable    <=  p0_eth_reconfig_byteenable;
         p0_eth_reconfig_reg_writedata     <=  p0_eth_reconfig_writedata;
         p0_eth_reconfig_reg_readdata      <=  p0_eth_reconfig_readdata;
         p0_eth_reconfig_reg_readdatavalid <=  p0_eth_reconfig_readdatavalid;
         p0_eth_reconfig_reg_waitrequest   <=  p0_eth_reconfig_waitrequest;
    end
    end

//------------------------------------------------------------------------------------------------------
////////     LED STATUS   ///////
//------------------------------------------------------------------------------------------------------

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
        led_pulse      <= 1'b1;
      end
      else
      begin  
        led_pulse_cntr <= led_pulse_cntr + 8'd1;
        led_pulse      <= 1'b0;
      end
  end
  else
    led_pulse      <= 1'b0;
  end

  always @(posedge app_ss_lite_clk or negedge nios_rst_n)
  begin
    if(~nios_rst_n)
      led_pulse_reg <= 16'd0;
    else
      led_pulse_reg <= {led_pulse_reg[14:0], led_pulse};
  end

  assign led_pulse_ext = |(led_pulse_reg);



      wire sig_p0_app_ss_st_tx_tvalid = p0_app_ss_st_tx_tvalid[0];
      wire sig_p0_ss_app_st_rx_tvalid = p0_ss_app_st_rx_tvalid[0];
      wire sig_p0_ss_app_st_tx_tready = p0_ss_app_st_tx_tready[0];
      wire sig_p1_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p1_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p1_ss_app_st_tx_tready = 1'b0;
      wire sig_p2_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p2_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p2_ss_app_st_tx_tready = 1'b0;
      wire sig_p3_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p3_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p3_ss_app_st_tx_tready = 1'b0;
      wire sig_p4_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p4_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p4_ss_app_st_tx_tready = 1'b0;
      wire sig_p5_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p5_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p5_ss_app_st_tx_tready = 1'b0;
      wire sig_p6_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p6_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p6_ss_app_st_tx_tready = 1'b0;
      wire sig_p7_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p7_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p7_ss_app_st_tx_tready = 1'b0;
      wire sig_p8_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p8_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p8_ss_app_st_tx_tready = 1'b0;
      wire sig_p9_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p9_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p9_ss_app_st_tx_tready = 1'b0;
      wire sig_p10_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p10_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p10_ss_app_st_tx_tready = 1'b0;
      wire sig_p11_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p11_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p11_ss_app_st_tx_tready = 1'b0;
      wire sig_p12_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p12_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p12_ss_app_st_tx_tready = 1'b0;
      wire sig_p13_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p13_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p13_ss_app_st_tx_tready = 1'b0;
      wire sig_p14_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p14_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p14_ss_app_st_tx_tready = 1'b0;
      wire sig_p15_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p15_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p15_ss_app_st_tx_tready = 1'b0;
      wire sig_p16_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p16_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p16_ss_app_st_tx_tready = 1'b0;
      wire sig_p17_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p17_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p17_ss_app_st_tx_tready = 1'b0;
      wire sig_p18_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p18_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p18_ss_app_st_tx_tready = 1'b0;
      wire sig_p19_app_ss_st_tx_tvalid = 1'b0;   
      wire sig_p19_ss_app_st_rx_tvalid = 1'b0;
      wire sig_p19_ss_app_st_tx_tready = 1'b0;

  hssi_ss_led_status  U_hssi_ss_led_p0 
    (
        .reconfig_clk(app_ss_lite_clk),
        .csr_rst_n(nios_rst_n),
        .pulse_10msec(led_pulse_ext),
        .led_override_en((csr_led_override_port == 0) ? csr_led_override_en : 1'b0),
        .port_params(p0_port_params),
        .cdr_lock(p0_sync_cdr_lock),
        .tx_lanes_stable(p0_sync_link_status[1]),
        .rx_pcs_ready(p0_sync_link_status[2]), 
        .tx_clk(p0_app_ss_st_tx_clk),
        .rx_clk(p0_app_ss_st_rx_clk),       
         .tx_tvalid(sig_p0_app_ss_st_tx_tvalid && sig_p0_ss_app_st_tx_tready),
         .rx_tvalid(sig_p0_ss_app_st_rx_tvalid),
        .csr_led_status(csr_led_status),
        .csr_led_speed(csr_led_speed),
        .led_status(port0_led_status),
        .led_speed(port0_led_speed)
        );
  hssi_ss_led_status  U_hssi_ss_led_p1 
    (
        .reconfig_clk(app_ss_lite_clk),
        .csr_rst_n(nios_rst_n),
        .pulse_10msec(led_pulse_ext),
        .led_override_en((csr_led_override_port == 1) ? csr_led_override_en : 1'b0),
        .port_params(p1_port_params),
        .cdr_lock(1'b0),
        .tx_lanes_stable(1'b0),
        .rx_pcs_ready(1'b0),
        .tx_clk(app_ss_lite_clk),
        .rx_clk(app_ss_lite_clk),
        .tx_tvalid(1'b0),
        .rx_tvalid(1'b0),
        .csr_led_status(csr_led_status),
        .csr_led_speed(csr_led_speed),
        .led_status(port1_led_status),
        .led_speed(port1_led_speed)
        );
  hssi_ss_led_status  U_hssi_ss_led_p2 
    (
        .reconfig_clk(app_ss_lite_clk),
        .csr_rst_n(nios_rst_n),
        .pulse_10msec(led_pulse_ext),
        .led_override_en((csr_led_override_port == 2) ? csr_led_override_en : 1'b0),
        .port_params(p2_port_params),
        .cdr_lock(1'b0),
        .tx_lanes_stable(1'b0),
        .rx_pcs_ready(1'b0),
        .tx_clk(app_ss_lite_clk),
        .rx_clk(app_ss_lite_clk),
        .tx_tvalid(1'b0),
        .rx_tvalid(1'b0),
        .csr_led_status(csr_led_status),
        .csr_led_speed(csr_led_speed),
        .led_status(port2_led_status),
        .led_speed(port2_led_speed)
        );
  hssi_ss_led_status  U_hssi_ss_led_p3 
    (
        .reconfig_clk(app_ss_lite_clk),
        .csr_rst_n(nios_rst_n),
        .pulse_10msec(led_pulse_ext),
        .led_override_en((csr_led_override_port == 3) ? csr_led_override_en : 1'b0),
        .port_params(p3_port_params),
        .cdr_lock(1'b0),
        .tx_lanes_stable(1'b0),
        .rx_pcs_ready(1'b0),
        .tx_clk(app_ss_lite_clk),
        .rx_clk(app_ss_lite_clk),
        .tx_tvalid(1'b0),
        .rx_tvalid(1'b0),
        .csr_led_status(csr_led_status),
        .csr_led_speed(csr_led_speed),
        .led_status(port3_led_status),
        .led_speed(port3_led_speed)
        );
  hssi_ss_led_status  U_hssi_ss_led_p4 
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
  hssi_ss_led_status  U_hssi_ss_led_p5 
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
  hssi_ss_led_status  U_hssi_ss_led_p6 
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
  hssi_ss_led_status  U_hssi_ss_led_p7 
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
  hssi_ss_led_status  U_hssi_ss_led_p8 
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
  hssi_ss_led_status  U_hssi_ss_led_p9 
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
  hssi_ss_led_status  U_hssi_ss_led_p10 
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
  hssi_ss_led_status  U_hssi_ss_led_p11 
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
  hssi_ss_led_status  U_hssi_ss_led_p12 
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
  hssi_ss_led_status  U_hssi_ss_led_p13 
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
  hssi_ss_led_status  U_hssi_ss_led_p14 
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
  hssi_ss_led_status  U_hssi_ss_led_p15 
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
  hssi_ss_led_status  U_hssi_ss_led_p16 
    (
        .reconfig_clk(app_ss_lite_clk),
        .csr_rst_n(nios_rst_n),
        .pulse_10msec(led_pulse_ext),
        .led_override_en((csr_led_override_port == 16) ? csr_led_override_en : 1'b0),
        .port_params(p16_port_params),
        .cdr_lock(1'b0),
        .tx_lanes_stable(1'b0),
        .rx_pcs_ready(1'b0),
        .tx_clk(app_ss_lite_clk),
        .rx_clk(app_ss_lite_clk),
        .tx_tvalid(1'b0),
        .rx_tvalid(1'b0),
        .csr_led_status(csr_led_status),
        .csr_led_speed(csr_led_speed),
        .led_status(port16_led_status),
        .led_speed(port16_led_speed)
        );
  hssi_ss_led_status  U_hssi_ss_led_p17 
    (
        .reconfig_clk(app_ss_lite_clk),
        .csr_rst_n(nios_rst_n),
        .pulse_10msec(led_pulse_ext),
        .led_override_en((csr_led_override_port == 17) ? csr_led_override_en : 1'b0),
        .port_params(p17_port_params),
        .cdr_lock(1'b0),
        .tx_lanes_stable(1'b0),
        .rx_pcs_ready(1'b0),
        .tx_clk(app_ss_lite_clk),
        .rx_clk(app_ss_lite_clk),
        .tx_tvalid(1'b0),
        .rx_tvalid(1'b0),
        .csr_led_status(csr_led_status),
        .csr_led_speed(csr_led_speed),
        .led_status(port17_led_status),
        .led_speed(port17_led_speed)
        );
  hssi_ss_led_status  U_hssi_ss_led_p18 
    (
        .reconfig_clk(app_ss_lite_clk),
        .csr_rst_n(nios_rst_n),
        .pulse_10msec(led_pulse_ext),
        .led_override_en((csr_led_override_port == 18) ? csr_led_override_en : 1'b0),
        .port_params(p18_port_params),
        .cdr_lock(1'b0),
        .tx_lanes_stable(1'b0),
        .rx_pcs_ready(1'b0),
        .tx_clk(app_ss_lite_clk),
        .rx_clk(app_ss_lite_clk),
        .tx_tvalid(1'b0),
        .rx_tvalid(1'b0),
        .csr_led_status(csr_led_status),
        .csr_led_speed(csr_led_speed),
        .led_status(port18_led_status),
        .led_speed(port18_led_speed)
        );
  hssi_ss_led_status  U_hssi_ss_led_p19 
    (
        .reconfig_clk(app_ss_lite_clk),
        .csr_rst_n(nios_rst_n),
        .pulse_10msec(led_pulse_ext),
        .led_override_en((csr_led_override_port == 19) ? csr_led_override_en : 1'b0),
        .port_params(p19_port_params),
        .cdr_lock(1'b0),
        .tx_lanes_stable(1'b0),
        .rx_pcs_ready(1'b0),
        .tx_clk(app_ss_lite_clk),
        .rx_clk(app_ss_lite_clk),
        .tx_tvalid(1'b0),
        .rx_tvalid(1'b0),
        .csr_led_status(csr_led_status),
        .csr_led_speed(csr_led_speed),
        .led_status(port19_led_status),
        .led_speed(port19_led_speed)
        );
////////////////////////////////////////////////

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(6),  .INIT_VALUE(0)
    ) U_sts_sync_p0 (
      .clk     (app_ss_lite_clk),
      .reset   (1'b0),
      .d       ({p0_cdr_lock,p0_rx_am_lock,p0_rx_block_lock,p0_local_fault_status,p0_remote_fault_status,p0_rx_hi_ber}),
      .q       ({p0_sync_cdr_lock,p0_sync_rx_am_lock,p0_sync_rx_block_lock,p0_sync_local_fault_status,p0_sync_remote_fault_status,p0_sync_rx_hi_ber})
    );

///////////////////////////////////////////////////

hssi_ss_resync_std #(
        .SYNC_CHAIN_LENGTH(3),    .WIDTH(3),  .INIT_VALUE(0)
          ) U_link_sts_sync_p0 (
            .clk     (app_ss_lite_clk),
            .reset   (1'b0),
            .d       ({p0_rx_pcs_ready, p0_tx_lanes_stable, o_p0_tx_pll_locked}),
            .q       (p0_sync_link_status)
    );

//////////////////////////////////////////////////

assign xcvr_ready_int[0] = o_p0_tx_pll_locked; 

hssi_ss_resync_std #(
  .SYNC_CHAIN_LENGTH(3),    .WIDTH(1),  .INIT_VALUE(0)
    ) U_xcvr_ready_sync_inst_p0 (
      .clk     (app_ss_lite_clk),
      .reset   (1'b0),
      .d       (xcvr_ready_int[0]),
      .q       (xcvr_ready[0])
    );
    assign xcvr_ready[1] = 1'b0; 
    assign xcvr_ready[2] = 1'b0; 
    assign xcvr_ready[3] = 1'b0; 
    assign xcvr_ready[4] = 1'b0; 
    assign xcvr_ready[5] = 1'b0; 
    assign xcvr_ready[6] = 1'b0; 
    assign xcvr_ready[7] = 1'b0; 
    assign xcvr_ready[8] = 1'b0; 
    assign xcvr_ready[9] = 1'b0; 
    assign xcvr_ready[10] = 1'b0; 
    assign xcvr_ready[11] = 1'b0; 
    assign xcvr_ready[12] = 1'b0; 
    assign xcvr_ready[13] = 1'b0; 
    assign xcvr_ready[14] = 1'b0; 
    assign xcvr_ready[15] = 1'b0; 
    assign xcvr_ready[16] = 1'b0; 
    assign xcvr_ready[17] = 1'b0; 
    assign xcvr_ready[18] = 1'b0; 
    assign xcvr_ready[19] = 1'b0; 

  always@(posedge app_ss_lite_clk or negedge nios_rst_n) begin
    if(~nios_rst_n) begin
    p0_port_params <= 20'd0;
    p1_port_params <= 20'd0;
    p2_port_params <= 20'd0;
    p3_port_params <= 20'd0;
    p4_port_params <= 20'd0;
    p5_port_params <= 20'd0;
    p6_port_params <= 20'd0;
    p7_port_params <= 20'd0;
    p8_port_params <= 20'd0;
    p9_port_params <= 20'd0;
    p10_port_params <= 20'd0;
    p11_port_params <= 20'd0;
    p12_port_params <= 20'd0;
    p13_port_params <= 20'd0;
    p14_port_params <= 20'd0;
    p15_port_params <= 20'd0;
    p16_port_params <= 20'd0;
    p17_port_params <= 20'd0;
    p18_port_params <= 20'd0;
    p19_port_params <= 20'd0;
    end else begin
     p0_port_params[0] <= '1; 
     p0_port_params[9:7] <= PORT0_DATA_WIDTH == 64  ? 3'd1:
                                    PORT0_DATA_WIDTH == 128 ? 3'd2:
                                    PORT0_DATA_WIDTH == 256 ? 3'd3:
                                    PORT0_DATA_WIDTH == 512 ? 3'd4:
                                    PORT0_DATA_WIDTH == 1024 ? 3'd5: 3'd0;

               p0_port_params[6:1] <= 6'd21; 

     p0_port_params[11:10] <= 2'b00; //lowspeed_eth_param
     p0_port_params[16:12] <= 5'b00100; // subprofile == MAC+PCS == h'04
     p0_port_params[17]    <=  1'b1; //  derive locally 
     p0_port_params[18]    <= 1'b0; //anlt_enable from TCL
     p0_port_params[19]    <= 1'b1; //ptp_enable
     ///////
    
     p1_port_params[0]     <= '0; 
     p1_port_params[6:1]   <= '0; 
     p1_port_params[9:7]   <= '0; 
     p1_port_params[11:10] <= 2'b00;
     p1_port_params[16:12] <= 5'b00000;
     p1_port_params[17]    <= 1'b0;
     p1_port_params[18]    <= 1'b0;
     p1_port_params[19]    <= 1'b0;
     ///////
     p2_port_params[0]     <= '0; 
     p2_port_params[6:1]   <= '0; 
     p2_port_params[9:7]   <= '0; 
     p2_port_params[11:10] <= 2'b00;
     p2_port_params[16:12] <= 5'b00000;
     p2_port_params[17]    <= 1'b0;
     p2_port_params[18]    <= 1'b0;
     p2_port_params[19]    <= 1'b0;
     ///////
     p3_port_params[0]     <= '0; 
     p3_port_params[6:1]   <= '0; 
     p3_port_params[9:7]   <= '0; 
     p3_port_params[11:10] <= 2'b00;
     p3_port_params[16:12] <= 5'b00000;
     p3_port_params[17]    <= 1'b0;
     p3_port_params[18]    <= 1'b0;
     p3_port_params[19]    <= 1'b0;
     ///////
     p4_port_params[0]     <= '0; 
     p4_port_params[6:1]   <= '0; 
     p4_port_params[9:7]   <= '0; 
     p4_port_params[11:10] <= 2'b00;
     p4_port_params[16:12] <= 5'b00000;
     p4_port_params[17]    <= 1'b0;
     p4_port_params[18]    <= 1'b0;
     p4_port_params[19]    <= 1'b0;
     ///////
     p5_port_params[0]     <= '0; 
     p5_port_params[6:1]   <= '0; 
     p5_port_params[9:7]   <= '0; 
     p5_port_params[11:10] <= 2'b00;
     p5_port_params[16:12] <= 5'b00000;
     p5_port_params[17]    <= 1'b0;
     p5_port_params[18]    <= 1'b0;
     p5_port_params[19]    <= 1'b0;
     ///////
     p6_port_params[0]     <= '0; 
     p6_port_params[6:1]   <= '0; 
     p6_port_params[9:7]   <= '0; 
     p6_port_params[11:10] <= 2'b00;
     p6_port_params[16:12] <= 5'b00000;
     p6_port_params[17]    <= 1'b0;
     p6_port_params[18]    <= 1'b0;
     p6_port_params[19]    <= 1'b0;
     ///////
     p7_port_params[0]     <= '0; 
     p7_port_params[6:1]   <= '0; 
     p7_port_params[9:7]   <= '0; 
     p7_port_params[11:10] <= 2'b00;
     p7_port_params[16:12] <= 5'b00000;
     p7_port_params[17]    <= 1'b0;
     p7_port_params[18]    <= 1'b0;
     p7_port_params[19]    <= 1'b0;
     ///////
     p8_port_params[0]     <= '0; 
     p8_port_params[6:1]   <= '0; 
     p8_port_params[9:7]   <= '0; 
     p8_port_params[11:10] <= 2'b00;
     p8_port_params[16:12] <= 5'b00000;
     p8_port_params[17]    <= 1'b0;
     p8_port_params[18]    <= 1'b0;
     p8_port_params[19]    <= 1'b0;
     ///////
     p9_port_params[0]     <= '0; 
     p9_port_params[6:1]   <= '0; 
     p9_port_params[9:7]   <= '0; 
     p9_port_params[11:10] <= 2'b00;
     p9_port_params[16:12] <= 5'b00000;
     p9_port_params[17]    <= 1'b0;
     p9_port_params[18]    <= 1'b0;
     p9_port_params[19]    <= 1'b0;
     ///////
     p10_port_params[0]     <= '0; 
     p10_port_params[6:1]   <= '0; 
     p10_port_params[9:7]   <= '0; 
     p10_port_params[11:10] <= 2'b00;
     p10_port_params[16:12] <= 5'b00000;
     p10_port_params[17]    <= 1'b0;
     p10_port_params[18]    <= 1'b0;
     p10_port_params[19]    <= 1'b0;
     ///////
     p11_port_params[0]     <= '0; 
     p11_port_params[6:1]   <= '0; 
     p11_port_params[9:7]   <= '0; 
     p11_port_params[11:10] <= 2'b00;
     p11_port_params[16:12] <= 5'b00000;
     p11_port_params[17]    <= 1'b0;
     p11_port_params[18]    <= 1'b0;
     p11_port_params[19]    <= 1'b0;
     ///////
     p12_port_params[0]     <= '0; 
     p12_port_params[6:1]   <= '0; 
     p12_port_params[9:7]   <= '0; 
     p12_port_params[11:10] <= 2'b00;
     p12_port_params[16:12] <= 5'b00000;
     p12_port_params[17]    <= 1'b0;
     p12_port_params[18]    <= 1'b0;
     p12_port_params[19]    <= 1'b0;
     ///////
     p13_port_params[0]     <= '0; 
     p13_port_params[6:1]   <= '0; 
     p13_port_params[9:7]   <= '0; 
     p13_port_params[11:10] <= 2'b00;
     p13_port_params[16:12] <= 5'b00000;
     p13_port_params[17]    <= 1'b0;
     p13_port_params[18]    <= 1'b0;
     p13_port_params[19]    <= 1'b0;
     ///////
     p14_port_params[0]     <= '0; 
     p14_port_params[6:1]   <= '0; 
     p14_port_params[9:7]   <= '0; 
     p14_port_params[11:10] <= 2'b00;
     p14_port_params[16:12] <= 5'b00000;
     p14_port_params[17]    <= 1'b0;
     p14_port_params[18]    <= 1'b0;
     p14_port_params[19]    <= 1'b0;
     ///////
     p15_port_params[0]     <= '0; 
     p15_port_params[6:1]   <= '0; 
     p15_port_params[9:7]   <= '0; 
     p15_port_params[11:10] <= 2'b00;
     p15_port_params[16:12] <= 5'b00000;
     p15_port_params[17]    <= 1'b0;
     p15_port_params[18]    <= 1'b0;
     p15_port_params[19]    <= 1'b0;
     ///////
     p16_port_params[0]     <= '0; 
     p16_port_params[6:1]   <= '0; 
     p16_port_params[9:7]   <= '0; 
     p16_port_params[11:10] <= 2'b00;
     p16_port_params[16:12] <= 5'b00000;
     p16_port_params[17]    <= 1'b0;
     p16_port_params[18]    <= 1'b0;
     p16_port_params[19]    <= 1'b0;
     ///////
     p17_port_params[0]     <= '0; 
     p17_port_params[6:1]   <= '0; 
     p17_port_params[9:7]   <= '0; 
     p17_port_params[11:10] <= 2'b00;
     p17_port_params[16:12] <= 5'b00000;
     p17_port_params[17]    <= 1'b0;
     p17_port_params[18]    <= 1'b0;
     p17_port_params[19]    <= 1'b0;
     ///////
     p18_port_params[0]     <= '0; 
     p18_port_params[6:1]   <= '0; 
     p18_port_params[9:7]   <= '0; 
     p18_port_params[11:10] <= 2'b00;
     p18_port_params[16:12] <= 5'b00000;
     p18_port_params[17]    <= 1'b0;
     p18_port_params[18]    <= 1'b0;
     p18_port_params[19]    <= 1'b0;
     ///////
     p19_port_params[0]     <= '0; 
     p19_port_params[6:1]   <= '0; 
     p19_port_params[9:7]   <= '0; 
     p19_port_params[11:10] <= 2'b00;
     p19_port_params[16:12] <= 5'b00000;
     p19_port_params[17]    <= 1'b0;
     p19_port_params[18]    <= 1'b0;
     p19_port_params[19]    <= 1'b0;
     ///////
end
end

//RESET ACK LOGIC which is connected to SRC INPUT
    // In case of non DR we are sending ack directly from SRIP
    assign p0_tx_rst_ack_n_mask  =  p0_tx_rst_ack_n ;
    assign p0_rx_rst_ack_n_mask  =  p0_rx_rst_ack_n ;
    assign p0_csr_rst_ack_n_mask =  p0_csr_rst_ack_n;
//RESET ACK LOGIC which is connected to USER O/p
    // In case of non DR we are sending ack directly from SRIP
    assign o_p0_tx_rst_ack_n  = w_p0_tx_rst_ack_n;
    assign o_p0_rx_rst_ack_n  = w_p0_rx_rst_ack_n;




endmodule


