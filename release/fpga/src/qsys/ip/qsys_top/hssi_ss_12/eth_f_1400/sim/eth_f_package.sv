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


// (C) 2001-2019 Intel Corporation. All rights reserved.
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


//-----------------------------------------------------------------------------
// This confidential and proprietary software may be used only as authorized by
// a licensing agreement from ALTERA
// copyright notice must be reproduced on all authorized copies.
//-----------------------------------------------------------------------------
// Copyright ?? 2015 Altera Corporation. All rights reserved.  Altera products are
// protected under numerous U.S. and foreign patents, maskwork rights, copyrights and
// other intellectual property laws.
//-----------------------------------------------------------------------------
//  Project Name:  ehip
//  Author      :  ngulston
//  Date        :
//-----------------------------------------------------------------------------
//Description:
//  This is a package for the EHIP design. It contains declarations for the
//  shared constants, shared data types, and shared functions used in the
//  design
//
//-----------------------------------------------------------------------------
//Package Declaration
// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

package eth_f_package;

//-----------------------------------------------------------------------------

    // common parameters
    localparam  EHP_PLD_WIDTH               =   78;
    
    //Pin position parameter. These must match the mapping spreadsheet
    localparam  EPRT_TX_VALID               =   38;
    localparam  EPRT_STATS_SNAPSHOT         =   76;
    localparam  EPRT_TX_MAC_DATA_0          =   0;
    localparam  EPRT_TX_MAC_DATA_1          =   39;
    localparam  EPRT_TX_ERROR               =   32;
    localparam  EPRT_TX_EOP_EMPTY           =   33;
    localparam  EPRT_TX_INFRAME             =   36;
    localparam  EPRT_TX_SKIP_CRC            =   37;
    localparam  EPRT_RX_DATA_0              =   0;
    localparam  EPRT_RX_DATA_1              =   39;
    localparam  EPRT_RX_FCS_ERROR           =   71;
    localparam  EPRT_RX_VALID               =   38;
    localparam  EPRT_RX_EOP_EMPTY           =   32;
    localparam  EPRT_RX_INFRAME             =   74;
    localparam  EPRT_RX_ERROR               =   72;
    localparam  EPRT_RX_STATUS              =   35;
    localparam  EPRT_RX_PAUSE               =   35;
    localparam  EPRT_RX_PFC0                =   36;
    localparam  EPRT_RX_PFC1                =   37;
    localparam  EPRT_RX_PFC2                =   38;
    localparam  EPRT_RX_PFC3                =   71;
    localparam  EPRT_RX_PFC4                =   72;
    localparam  EPRT_RX_PFC5                =   73;
    localparam  EPRT_RX_PFC6                =   75;
    localparam  EPRT_RX_PFC7                =   76;
    localparam  EPRT_TX_READY               =   76;
    localparam  EPRT_DESKEW                 =   77;
    localparam  EPRT_TX_PAUSE               =   71;
    localparam  EPRT_TX_PFC0                =   71;
    localparam  EPRT_TX_PFC1                =   72;
    localparam  EPRT_TX_PFC2                =   73;
    localparam  EPRT_TX_PFC3                =   72;
    localparam  EPRT_TX_PFC4                =   73;
    localparam  EPRT_TX_PFC5                =   74;
    localparam  EPRT_TX_PFC6                =   75;
    localparam  EPRT_TX_PFC7                =   76;
    localparam  EPRT_CUSTOM_CADENCE         =   75;

    localparam  EPRT_TX_AM_VALID            =   37;
    localparam  EPRT_RX_AM_VALID            =   37;
    localparam  EPRT_TX_PCS66_DATA_0        =   0;
    localparam  EPRT_TX_PCS66_DATA_1        =   39;
    localparam  EPRT_RX_WORD_ALIGN_GOOD     =   36;


// VIRTUAL AIB MAPPING PARAMETERS 

    localparam	AIB_PCS_RX_SF		    =  25;
    localparam	AIB_FEC_NOT_LOCKED	    =  27;
    localparam	AIB_FEC_NOT_ALIGN	    =  29;
 
    localparam  AIB_HIP_READY               =  11; 
    localparam  AIB_TX_RESET_ACK            =  10;   
    localparam  AIB_RX_BLOCK_LOCK           =  9;   
    localparam  AIB_RX_DESKEW_DONE          =  8;  
    localparam  AIB_RX_AM_LOCK              =  7;  
    localparam  AIB_RX_PCS_FULLY_ALIGNED    =  6;    
    localparam  AIB_HI_BER                  =  5;   
    localparam  AIB_RX_PCS_INTERNAL_ERROR   =  4;    
    localparam  AIB_LOCAL_FAULT             =  3;    
    localparam  AIB_REMOTE_FAULT            =  2;    
    localparam  AIB_RX_PAUSE                =  1;
    localparam  AIB_RX_RESET_ACK            =  0;                   
    localparam  AIB_RX_PFC_7                = 21; 
    localparam  AIB_RX_PFC_6                = 18; 
    localparam  AIB_RX_PFC_5                = 17; 
    localparam  AIB_RX_PFC_4                = 16; 
    localparam  AIB_RX_PFC_3                = 15; 
    localparam  AIB_RX_PFC_2                = 14; 
    localparam  AIB_RX_PFC_1                = 19; 
    localparam  AIB_RX_PFC_0                = 20; 
      

    localparam  REC_CLK_DIV64               = 12; 
    localparam  REC_CLK_DIV66               = 13; 
    localparam  PLL_CLK                     = 22;  
    localparam  DIV66_CLK                   = 23; 

    localparam  AIB_PLD_READY               = 27;    
    localparam  AIB_SIGNAL_OK               = 26;   
    localparam  AIB_CLEAR_INTERNAL          = 25; 
    localparam  AIB_TX_PAUSE                = 24; 
    localparam  AIB_TX_PFC_7                = 23;
    localparam  AIB_TX_PFC_6                = 22;
    localparam  AIB_TX_PFC_5                = 21;
    localparam  AIB_TX_PFC_4                = 20;
    localparam  AIB_TX_PFC_3                = 19;
    localparam  AIB_TX_PFC_2                = 18;
    localparam  AIB_TX_PFC_1                = 17;
    localparam  AIB_TX_PFC_0                = 16;
  


// SIP PARAMETERS  
    // EHIP_RATE
    localparam EHIP_RATE_10G                =   3'd0;
    localparam EHIP_RATE_25G                =   3'd1;
    localparam EHIP_RATE_40G                =   3'd2;
    localparam EHIP_RATE_50G                =   3'd3;
    localparam EHIP_RATE_100G               =   3'd4;
    localparam EHIP_RATE_200G               =   3'd5;
    localparam EHIP_RATE_400G               =   3'd6;
    // RSFEC TYPE
    localparam RSFEC_NO_FEC                 =   3'd0;
    localparam RSFEC_FC_FEC                 =   3'd1;
    localparam RSFEC_KR_FEC                 =   3'd2;
    localparam RSFEC_KP_FEC                 =   3'd3;
    localparam RSFEC_LL_FEC                 =   3'd4;

// AVMM2 PARAMETERS
  // localparam to define unused bus
  localparam RD_UNUSED                          = 8'h0;

  // localparams for common capability registers
  localparam AGX_F_ADDR_ID_0                   = 10'h0;
  localparam AGX_F_ADDR_ID_1                   = 10'h1;
  localparam AGX_F_ADDR_ID_2                   = 10'h2;
  localparam AGX_F_ADDR_ID_3                   = 10'h3;
  localparam AGX_F_ADDR_STATUS_EN              = 10'h4;
  localparam AGX_F_ADDR_CONTROL_EN             = 10'h5;
  // Reserve Address 10'h6 to 10'hF for common capablities

  // native phy capability
  localparam AGX_F_ADDR_NAT_CHNLS              = 10'h10;
  localparam AGX_F_ADDR_NAT_CHNL_NUM           = 10'h11;
  localparam AGX_F_ADDR_NAT_DUPLEX             = 10'h12;
  localparam AGX_F_ADDR_NAT_DUAL_CHNL          = 10'h13;
  localparam AGX_F_ADDR_NAT_DUAL_CHNL_MASTER   = 10'h14;

  // localparams for csr for lock to ref and lock to data
  localparam AGX_F_ADDR_GP_RD_LTR              = 10'h80;
  localparam AGX_F_OFFSET_RD_LTD               = 0;
  localparam AGX_F_OFFSET_LTR_UNUSED           = 1;
  localparam AGX_F_LTR_UNUSED_LEN              = 7;

  // localparam for reading the stat signals from the resets
  localparam AGX_F_ADDR_GP_RD_CHNL_STATUS      = 10'h81;
  localparam AGX_F_OFFSET_TX_RST_READY         = 0;
  localparam AGX_F_OFFSET_RX_RST_READY         = 1;
  localparam AGX_F_OFFSET_CHNL_STATUS_UNUSED   = 2;
  localparam AGX_F_RST_CHNL_STATUS_UNUSED_LEN  = 6;

  // localparam for reading the stat signals from the AIB for transfer ready
  localparam AGX_F_ADDR_XFER_STATUS            = 10'h82;
  localparam AGX_F_OFFSET_TX_XFER_READY        = 0;
  localparam AGX_F_OFFSET_RX_XFER_READY        = 1;
  localparam AGX_F_OFFSET_XFER_STATUS_UNUSED   = 2;
  localparam AGX_F_XFER_STATUS_UNUSED_LEN      = 6;

  // localparams for setting channel resets
  localparam AGX_F_ADDR_CHNL_RESET             = 10'hE2;
  localparam AGX_F_OFFSET_RX_ANA               = 0; 
  localparam AGX_F_OFFSET_RX_DIG               = 1; 
  localparam AGX_F_OFFSET_TX_ANA               = 2; 
  localparam AGX_F_OFFSET_TX_DIG               = 3; 
  localparam AGX_F_OFFSET_RX_ANA_OVR           = 4; 
  localparam AGX_F_OFFSET_RX_DIG_OVR           = 5; 
  localparam AGX_F_OFFSET_TX_ANA_OVR           = 6; 
  localparam AGX_F_OFFSET_TX_DIG_OVR           = 7; 

  // localparam for reading the stat signals from the resets
  localparam AGX_F_ADDR_CHNL_TX_RESET_CTRL     = 10'hE3;
  localparam AGX_F_OFFSET_TX_RESET             = 0;  
  localparam AGX_F_OFFSET_TX_RESET_OVERRIDE    = 1;  
  localparam AGX_F_OFFSET_TX_RESET_REQ         = 2;
  localparam AGX_F_OFFSET_TX_RESET_ACK         = 3;
  localparam AGX_F_OFFSET_TX_RESET_STAT        = 4;
  localparam AGX_F_OFFSET_TX_RESET_TIMEOUT     = 5;
  localparam AGX_F_OFFSET_TX_RESET_CTRL_UNUSED = 6;
  localparam AGX_F_TX_RESET_CTRL_UNUSED_LEN    = 2;

  // localparam for reading the stat signals from the resets
  localparam AGX_F_ADDR_CHNL_RX_RESET_CTRL     = 10'hE4;
  localparam AGX_F_OFFSET_RX_RESET             = 0;  
  localparam AGX_F_OFFSET_RX_RESET_OVERRIDE    = 1;  
  localparam AGX_F_OFFSET_RX_RESET_REQ         = 2;
  localparam AGX_F_OFFSET_RX_RESET_ACK         = 3;
  localparam AGX_F_OFFSET_RX_RESET_STAT        = 4;
  localparam AGX_F_OFFSET_RX_RESET_TIMEOUT     = 5;
  localparam AGX_F_OFFSET_RX_RESET_CTRL_UNUSED = 6;
  localparam AGX_F_RX_RESET_CTRL_UNUSED_LEN    = 2;

endpackage
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onp+AyHwnR09aXqYPq41GayI8jny9+MNMOTv+NdKR5tjreMxG4qS0C1bcmLvUauor5LbgyyiGasTpDTswoG+KE8gvj4mIzk07zN5gz4yVBRY4+8iW880H3sFcG2bjLC3RZCrLwx5ikGlBjfeIVrzQITbWUTzHsJifxLcXP/RXFfOcqmZU1w4q9il4gM9aH4bcZ7QRfHjn5JrLktFG3u/IPzOYoLcuoF1maPiYagq5hbvhGeruE4yfxu1Z7XOKovewt6TzInlBn+DxQ0qz3EQe1CAIeU9GyXzIDjvtgkrV9T+N9vbcnI9P8XBWOnEgtuysLloMnKwI20QSqGDLJGEJJlNgAtp9pXTOLPIveXY12RlHMEplDPCosGMdg6/3RZu1rXB3Fm5kbVTUZUwi3F7A64yH9EVA1FPnWoiWWV9Ht7rTUQ/Tsn2z7Gf8yM7RRSfO5PVVKDVfnmAn6UtjffdZ9JSCbn32mj7XbRBngF6cUQEr3IyLW5WCCiAcIxrfyCz9W71p4SX1JMSiH3meNBp5tyEYW4MbUwlEvoePKw478Fu53Cdtw/EFRClg5EEHSyzVPcoqkFkkDod28Y1HFpfEnvFDbnl9s8ZLBORuyni3Xuoo1LMcreeusq40u3X2Q15fRSs6gOqxYK3UOPKjCpP8eW1BDBEdHlS12nfd6UjbEWgz1g4rDH+YLoXtTUOcOubBRpHbkjbv9h3DiFaAhpa8b1/CSJ8fDtW51M+eLEXjq5dBH8uPx5Z8EWCSYpDZLKBV0eyvYYQ8+7QsVTH3WBVRw3P"
`endif