// (C) 2001-2022 Intel Corporation. All rights reserved.
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


`timescale 1 ps / 1 ps
module pp_tod_stack #(
        parameter NUMPORTS               = 1

    )(
        input   wire             i_reconfig_clk,
        input   wire             i_reconfig_reset,

        input  wire              i_clk_tx_tod,
        input  wire              i_clk_rx_tod,
        input  wire              i_clk_master_tod,
        input  wire              i_clk_todsync_sample,
        input  wire              i_clk_todsync_sample_locked,
        input  wire              i_ptp_master_tod_rst_n,
        input  wire [95:0]       i_ptp_master_tod,
        input  wire              i_ptp_master_tod_valid,
        input  wire              i_tx_pll_locked,

        output wire  [95:0]       ptp_tx_tod,
        output wire               ptp_tx_tod_valid,
        output wire  [95:0]       ptp_rx_tod,
        output wire               ptp_rx_tod_valid
);


//---------------------------------------------------------------
    // PTP signals
    logic                        clk_tx_tod;
    logic                        clk_rx_tod;
    logic                        tx_tod_rst_n;
    logic                        rx_tod_rst_n;
	
    logic                        tx_pll_locked_sync;
    logic                        tx_todsync_sampling_clk_locked_sync;
    logic                        rx_todsync_sampling_clk_locked_sync;


//---------------------------------------------------------------


logic tx_pll_locked_reconfig_sync;


altera_eth_1588_tod_synchronizer_std_synchr_nocut tx_pll_locked_reconfig_sync_inst (
    .clk        (i_reconfig_clk),
    .reset_n    (1'b1),
    .din        (i_tx_pll_locked),
    .dout       (tx_pll_locked_reconfig_sync)
);


    // PTP Timestamp Accuracy Mode = "1:Advanced"
    assign clk_tx_tod  = i_clk_tx_tod;
    assign clk_rx_tod  = i_clk_rx_tod;

    logic tx_pll_locked_reg;

    always @(posedge i_reconfig_clk) begin
        tx_pll_locked_reg   <= tx_pll_locked_reconfig_sync;
    end
	
    altera_eth_1588_tod_synchronizer_std_synchr_nocut tx_pll_locked_sync_inst (
        .clk        (clk_tx_tod),
        .reset_n    (1'b1),
        .din        (tx_pll_locked_reg),
        .dout       (tx_pll_locked_sync)
    );
	
    //------------------------------------------------------------------------------------
    logic tx_tod_rst_n_wire;
    logic tx_tod_rst_n_reg;
    logic rx_tod_rst_n_wire;
    logic rx_tod_rst_n_reg;

    altera_eth_1588_tod_synchronizer_std_synchr_nocut tx_todsync_sampling_locked_sync_inst (
        .clk        (clk_tx_tod),
        .reset_n    (1'b1),
        .din        (i_clk_todsync_sample_locked),
        .dout       (tx_todsync_sampling_clk_locked_sync)
    );
    altera_eth_1588_tod_synchronizer_std_synchr_nocut rx_todsync_sampling_locked_sync_inst (
        .clk        (clk_rx_tod),
        .reset_n    (1'b1),
        .din        (i_clk_todsync_sample_locked),
        .dout       (rx_todsync_sampling_clk_locked_sync)
    );

    assign tx_tod_rst_n_wire = tx_pll_locked_sync & tx_todsync_sampling_clk_locked_sync;
    assign rx_tod_rst_n_wire = rx_todsync_sampling_clk_locked_sync;
    
    // flops to fix recovery time violation from tx_tod_rst_n to tod_sync inst
    always @(posedge clk_tx_tod) begin
        tx_tod_rst_n_reg   <= tx_tod_rst_n_wire;
        tx_tod_rst_n       <= tx_tod_rst_n_reg;
    end
    always @(posedge clk_rx_tod) begin
        rx_tod_rst_n_reg   <= rx_tod_rst_n_wire;
        rx_tod_rst_n       <= rx_tod_rst_n_reg;
    end

    eth_f_ptp_stod_top tx_tod (
        .i_clk_reconfig             (i_reconfig_clk),
        .i_reconfig_rst_n           (~i_reconfig_reset),
        .i_clk_mtod                 (i_clk_master_tod),
        .i_clk_stod                 (clk_tx_tod),
        .i_clk_todsync_sampling     (i_clk_todsync_sample),
        .i_mtod_rst_n               (i_ptp_master_tod_rst_n),
        .i_stod_rst_n               (tx_tod_rst_n),
        .i_mtod_data                (i_ptp_master_tod),
        .i_mtod_valid               (i_ptp_master_tod_valid),
        .o_stod_data                (ptp_tx_tod),
        .o_stod_valid               (ptp_tx_tod_valid)
    );
    eth_f_ptp_stod_top rx_tod (
        .i_clk_reconfig             (i_reconfig_clk),
        .i_reconfig_rst_n           (~i_reconfig_reset),
        .i_clk_mtod                 (i_clk_master_tod),
        .i_clk_stod                 (clk_rx_tod),
        .i_clk_todsync_sampling     (i_clk_todsync_sample),
        .i_mtod_rst_n               (i_ptp_master_tod_rst_n),
        .i_stod_rst_n               (rx_tod_rst_n),
        .i_mtod_data                (i_ptp_master_tod),
        .i_mtod_valid               (i_ptp_master_tod_valid),
        .o_stod_data                (ptp_rx_tod),
        .o_stod_valid               (ptp_rx_tod_valid)
    );

   

   


//---------------------------------------------------------------
endmodule //

