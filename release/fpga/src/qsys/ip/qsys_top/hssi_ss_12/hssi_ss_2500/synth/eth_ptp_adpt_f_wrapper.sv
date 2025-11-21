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


//=============================================================================
//Description
//PTP Tile Adapter top level module for F-Tile
//=============================================================================
//Declaration

//synthesis translate_off
`timescale 1ns / 1ps
//synthesis translate_on

module eth_ptp_adpt_f_wrapper
#(
    // Fixed parameter (USER DO NOT MODIFY)
    parameter   ADDR_WIDTH                  =   17,
    parameter   TX_WIDTH                    =   3+1+5+1,
    parameter   RX_WIDTH                    =   3+1*9

)
(
    // User-connection Ports
    // Clock
    input   logic                           i_sys_clk,
    input   logic                           i_reconfig_clk,
    output  logic                           o_clk_pll,
    // User-connection Ports
    // Reset
    input   logic                           i_rst_n,
    input   logic                           i_reconfig_reset,

    // User-connection Ports
    // CSR - Asymmetry
    //     - connect to hip that instantiate AVMM1 via soft AVMM1 adapter
    input   logic   [ADDR_WIDTH-1:0]        i_reconfig_ptp_asym_addr,
    input   logic   [3:0]                   i_reconfig_ptp_asym_byteenable,
    input   logic                           i_reconfig_ptp_asym_write,
    input   logic   [31:0]                  i_reconfig_ptp_asym_writedata,
    input   logic                           i_reconfig_ptp_asym_read,
    output  logic   [31:0]                  o_reconfig_ptp_asym_readdata,
    output  logic                           o_reconfig_ptp_asym_readdata_valid,
    output  logic                           o_reconfig_ptp_asym_waitrequest,

    // User-connection Ports
    // CSR - Peer-to-peer
    //     - connect to hip that instantiate AVMM1 via soft AVMM1 adapter
    input   logic   [ADDR_WIDTH-1:0]        i_reconfig_ptp_p2p_addr,
    input   logic   [3:0]                   i_reconfig_ptp_p2p_byteenable,
    input   logic                           i_reconfig_ptp_p2p_write,
    input   logic   [31:0]                  i_reconfig_ptp_p2p_writedata,
    input   logic                           i_reconfig_ptp_p2p_read,
    output  logic   [31:0]                  o_reconfig_ptp_p2p_readdata,
    output  logic                           o_reconfig_ptp_p2p_readdata_valid,
    output  logic                           o_reconfig_ptp_p2p_waitrequest,

(* tile_ip_find_net *) output logic         ptp_link

);

eth_ptp_adpt_f #(
        .ADDR_WIDTH     (ADDR_WIDTH),
        .TX_WIDTH       (TX_WIDTH),
        .RX_WIDTH       (RX_WIDTH)
       ) ptp_adpt(
        .i_sys_clk                                 (i_sys_clk),
        .i_reconfig_clk                            (i_reconfig_clk),
        
        .o_clk_pll                                 (o_clk_pll),
        
        .i_rst_n                                   (i_rst_n),
        .i_reconfig_reset                          (i_reconfig_reset),
        
        //soft AVMM1 adapter
        .i_reconfig_ptp_asym_addr                  (i_reconfig_ptp_asym_addr),
        .i_reconfig_ptp_asym_byteenable            (i_reconfig_ptp_asym_byteenable),
        .i_reconfig_ptp_asym_write                 (i_reconfig_ptp_asym_write),
        .i_reconfig_ptp_asym_writedata             (i_reconfig_ptp_asym_writedata),
        .i_reconfig_ptp_asym_read                  (i_reconfig_ptp_asym_read),
        .o_reconfig_ptp_asym_readdata              (o_reconfig_ptp_asym_readdata),
        .o_reconfig_ptp_asym_readdata_valid        (o_reconfig_ptp_asym_readdata_valid),
        .o_reconfig_ptp_asym_waitrequest           (o_reconfig_ptp_asym_waitrequest),
        
        // soft AVMM1 adapter
        .i_reconfig_ptp_p2p_addr                   (i_reconfig_ptp_p2p_addr),
        .i_reconfig_ptp_p2p_byteenable             (i_reconfig_ptp_p2p_byteenable),
        .i_reconfig_ptp_p2p_write                  (i_reconfig_ptp_p2p_write),
        .i_reconfig_ptp_p2p_writedata              (i_reconfig_ptp_p2p_writedata),
        .i_reconfig_ptp_p2p_read                   (i_reconfig_ptp_p2p_read),
        .o_reconfig_ptp_p2p_readdata               (o_reconfig_ptp_p2p_readdata),
        .o_reconfig_ptp_p2p_readdata_valid         (o_reconfig_ptp_p2p_readdata_valid),
        .o_reconfig_ptp_p2p_waitrequest            (o_reconfig_ptp_p2p_waitrequest),
        
        .ptp_link                                  (ptp_link)

        );



endmodule



