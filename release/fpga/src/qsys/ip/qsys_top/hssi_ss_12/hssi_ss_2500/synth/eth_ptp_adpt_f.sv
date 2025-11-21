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

module eth_ptp_adpt_f
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

    logic [1:0]                  pld_ptp_avmm1_busy;
    logic [1:0]                  pld_ptp_avmm1_clk_rowclk;
    logic [1:0]                  pld_ptp_avmm1_cmdfifo_wr_full;
    logic [1:0]                  pld_ptp_avmm1_cmdfifo_wr_pfull;
    logic [1:0]                  pld_ptp_avmm1_read;
    logic [1:0][7:0]             pld_ptp_avmm1_readdata;
    logic [1:0]                  pld_ptp_avmm1_readdatavalid;
    logic [1:0][9:0]             pld_ptp_avmm1_reg_addr;
    logic [1:0]                  pld_ptp_avmm1_request;
    logic [1:0][8:0]             pld_ptp_avmm1_reserved_in;
    logic [1:0][2:0]             pld_ptp_avmm1_reserved_out;
    logic [1:0]                  pld_ptp_avmm1_write;
    logic [1:0][7:0]             pld_ptp_avmm1_writedata;
    logic [1:0]                  pld_ptp_chnl_cal_done;
    logic [1:0]                  pld_ptp_hssi_osc_transfer_en;

    // AIB to Core
    logic   [79:0]               a2c_aib_6;
    logic   [79:0]               a2c_aib_7;

    // Core to AIB
    logic   [79:0]               c2a_aib_6;
    logic   [79:0]               c2a_aib_7;



(* tile_ip_hip *)    eth_ptp_adpt_f_hip hip_inst (
        .i_clk_rx                               (i_sys_clk                       ),
        .i_clk_tx                               (i_sys_clk                       ),
        .o_clk_pll                              (o_clk_pll                       ),
        .i_rx_rst_n                             (i_rst_n                         ),
        .i_tx_rst_n                             (i_rst_n                         ),

        .ptp_link                               (ptp_link                        ),

        .tx_parallel_ptp_data_aib6              (c2a_aib_6                       ),
        .rx_parallel_ptp_data_aib6              (a2c_aib_6                       ),
        .tx_parallel_ptp_data_aib7              (c2a_aib_7                       ),
        .rx_parallel_ptp_data_aib7              (a2c_aib_7                       ),

        .pld_ptp_avmm1_busy                     ( pld_ptp_avmm1_busy             ),
        .pld_ptp_avmm1_clk_rowclk               ( pld_ptp_avmm1_clk_rowclk       ),
        .pld_ptp_avmm1_cmdfifo_wr_full          ( pld_ptp_avmm1_cmdfifo_wr_full  ),
        .pld_ptp_avmm1_cmdfifo_wr_pfull         ( pld_ptp_avmm1_cmdfifo_wr_pfull ),
        .pld_ptp_avmm1_read                     ( pld_ptp_avmm1_read             ),
        .pld_ptp_avmm1_readdata                 ( pld_ptp_avmm1_readdata         ),
        .pld_ptp_avmm1_readdatavalid            ( pld_ptp_avmm1_readdatavalid    ),
        .pld_ptp_avmm1_reg_addr                 ( pld_ptp_avmm1_reg_addr         ),
        .pld_ptp_avmm1_request                  ( pld_ptp_avmm1_request          ),
        .pld_ptp_avmm1_reserved_in              ( pld_ptp_avmm1_reserved_in      ),
        .pld_ptp_avmm1_reserved_out             ( pld_ptp_avmm1_reserved_out     ),
        .pld_ptp_avmm1_write                    ( pld_ptp_avmm1_write            ),
        .pld_ptp_avmm1_writedata                ( pld_ptp_avmm1_writedata        ),
        .pld_ptp_chnl_cal_done                  ( pld_ptp_chnl_cal_done          ),
        .pld_ptp_hssi_osc_transfer_en           ( pld_ptp_hssi_osc_transfer_en   )
    );

(* tile_ip_sip *)    eth_ptp_adpt_f_sip #(
        .ADDR_WIDTH     (ADDR_WIDTH),
        .TX_WIDTH       (TX_WIDTH),
        .RX_WIDTH       (RX_WIDTH)
    ) sip_inst (
        .i_sys_clk                          (i_sys_clk                          ),
        .i_rst_n                            (i_rst_n                            ),
        .i_reconfig_clk                     (i_reconfig_clk                     ),
        .i_reconfig_reset                   (i_reconfig_reset                   ),
        .i_reconfig_ptp_asym_addr           (i_reconfig_ptp_asym_addr           ),
        .i_reconfig_ptp_asym_writedata      (i_reconfig_ptp_asym_writedata      ),
        .i_reconfig_ptp_asym_write          (i_reconfig_ptp_asym_write          ),
        .i_reconfig_ptp_asym_read           (i_reconfig_ptp_asym_read           ),
        .i_reconfig_ptp_asym_byteenable     (i_reconfig_ptp_asym_byteenable     ),
        .o_reconfig_ptp_asym_readdata       (o_reconfig_ptp_asym_readdata       ),
        .o_reconfig_ptp_asym_waitrequest    (o_reconfig_ptp_asym_waitrequest    ),
        .o_reconfig_ptp_asym_readdata_valid (o_reconfig_ptp_asym_readdata_valid ),
        .i_reconfig_ptp_p2p_addr            (i_reconfig_ptp_p2p_addr            ),
        .i_reconfig_ptp_p2p_writedata       (i_reconfig_ptp_p2p_writedata       ),
        .i_reconfig_ptp_p2p_write           (i_reconfig_ptp_p2p_write           ),
        .i_reconfig_ptp_p2p_read            (i_reconfig_ptp_p2p_read            ),
        .i_reconfig_ptp_p2p_byteenable      (i_reconfig_ptp_p2p_byteenable      ),
        .o_reconfig_ptp_p2p_readdata        (o_reconfig_ptp_p2p_readdata        ),
        .o_reconfig_ptp_p2p_waitrequest     (o_reconfig_ptp_p2p_waitrequest     ),
        .o_reconfig_ptp_p2p_readdata_valid  (o_reconfig_ptp_p2p_readdata_valid  ),
        .pld_ptp_avmm1_busy                 ( pld_ptp_avmm1_busy                ),
        .pld_ptp_avmm1_clk_rowclk           ( pld_ptp_avmm1_clk_rowclk          ),
        .pld_ptp_avmm1_cmdfifo_wr_full      ( pld_ptp_avmm1_cmdfifo_wr_full     ),
        .pld_ptp_avmm1_cmdfifo_wr_pfull     ( pld_ptp_avmm1_cmdfifo_wr_pfull    ),
        .pld_ptp_avmm1_read                 ( pld_ptp_avmm1_read                ),
        .pld_ptp_avmm1_readdata             ( pld_ptp_avmm1_readdata            ),
        .pld_ptp_avmm1_readdatavalid        ( pld_ptp_avmm1_readdatavalid       ),
        .pld_ptp_avmm1_reg_addr             ( pld_ptp_avmm1_reg_addr            ),
        .pld_ptp_avmm1_request              ( pld_ptp_avmm1_request             ),
        .pld_ptp_avmm1_reserved_in          ( pld_ptp_avmm1_reserved_in         ),
        .pld_ptp_avmm1_reserved_out         ( pld_ptp_avmm1_reserved_out        ),
        .pld_ptp_avmm1_write                ( pld_ptp_avmm1_write               ),
        .pld_ptp_avmm1_writedata            ( pld_ptp_avmm1_writedata           ),
        .pld_ptp_chnl_cal_done              ( pld_ptp_chnl_cal_done             ),
        .pld_ptp_hssi_osc_transfer_en       ( pld_ptp_hssi_osc_transfer_en      ),
        .i_a2c_aib_6                        (a2c_aib_6                          ),
        .i_a2c_aib_7                        (a2c_aib_7                          ),
        .o_c2a_aib_6                        (c2a_aib_6                          ),
        .o_c2a_aib_7                        (c2a_aib_7                          )
        // .tx_ptp                             (                                   ), // TileIP autoconnect
        // .rx_ptp                             (                                   )  // TileIP autoconnect
    );

endmodule



