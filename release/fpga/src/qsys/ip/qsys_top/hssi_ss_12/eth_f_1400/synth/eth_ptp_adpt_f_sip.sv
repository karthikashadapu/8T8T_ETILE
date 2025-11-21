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
//PTP Adapter SIP level module for F-Tile
//=============================================================================
//Declaration

//synthesis translate_off
`timescale 1ps / 1ps
//synthesis translate_on

(* tile_ip_sip *)
module eth_ptp_adpt_f_sip
#(
    parameter   ADDR_WIDTH      =   17,
    parameter   TX_WIDTH        =   3+1+5+1,
    parameter   RX_WIDTH        =   3+1*9
)
(
    input  logic                        i_sys_clk,
    input  logic                        i_rst_n,
    input  logic                        i_reconfig_clk,
    input  logic                        i_reconfig_reset,

    // User-connection Ports
    // CSR - Asymmetry
    // AIB 6
    input   logic   [ADDR_WIDTH-1:0]    i_reconfig_ptp_asym_addr,
    input   logic   [3:0]               i_reconfig_ptp_asym_byteenable,
    input   logic                       i_reconfig_ptp_asym_write,
    input   logic   [31:0]              i_reconfig_ptp_asym_writedata,
    input   logic                       i_reconfig_ptp_asym_read,
    output  logic   [31:0]              o_reconfig_ptp_asym_readdata,
    output  logic                       o_reconfig_ptp_asym_readdata_valid,
    output  logic                       o_reconfig_ptp_asym_waitrequest,

    // User-connection Ports
    // CSR - Peer-to-peer
    // AIB 7
    input   logic   [ADDR_WIDTH-1:0]    i_reconfig_ptp_p2p_addr,
    input   logic   [3:0]               i_reconfig_ptp_p2p_byteenable,
    input   logic                       i_reconfig_ptp_p2p_write,
    input   logic   [31:0]              i_reconfig_ptp_p2p_writedata,
    input   logic                       i_reconfig_ptp_p2p_read,
    output  logic   [31:0]              o_reconfig_ptp_p2p_readdata,
    output  logic                       o_reconfig_ptp_p2p_readdata_valid,
    output  logic                       o_reconfig_ptp_p2p_waitrequest,

    input   logic   [1:0]               pld_ptp_avmm1_busy,
    output  logic   [1:0]               pld_ptp_avmm1_clk_rowclk,
    input   logic   [1:0]               pld_ptp_avmm1_cmdfifo_wr_full,
    input   logic   [1:0]               pld_ptp_avmm1_cmdfifo_wr_pfull,
    output  logic   [1:0]               pld_ptp_avmm1_read,
    input   logic   [1:0][7:0]          pld_ptp_avmm1_readdata,
    input   logic   [1:0]               pld_ptp_avmm1_readdatavalid,
    output  logic   [1:0][9:0]          pld_ptp_avmm1_reg_addr,
    output  logic   [1:0]               pld_ptp_avmm1_request,
    output  logic   [1:0][8:0]          pld_ptp_avmm1_reserved_in,
    input   logic   [1:0][2:0]          pld_ptp_avmm1_reserved_out,
    output  logic   [1:0]               pld_ptp_avmm1_write,
    output  logic   [1:0][7:0]          pld_ptp_avmm1_writedata,
    input   logic   [1:0]               pld_ptp_chnl_cal_done,
    input   logic   [1:0]               pld_ptp_hssi_osc_transfer_en,

    // AIB to Core
    input  logic   [79:0]               i_a2c_aib_6,
    input  logic   [79:0]               i_a2c_aib_7,

    // Core to AIB
    output logic   [79:0]               o_c2a_aib_6,
    output logic   [79:0]               o_c2a_aib_7,

    // Auto-connection Ports
    // Ethernet SIP (Option 1: 2D packed array) - Preferred
    (* intfc_name="ptp_mux", intfc_type_key="slot", intfc_subtype_key="hub" *)
    input   tri0   [15:0][TX_WIDTH-1:0] tx_ptp,
    (* intfc_name="ptp_mux", intfc_type_key="slot", intfc_subtype_key="hub" *)
    output         [15:0][RX_WIDTH-1:0] rx_ptp

);

    genvar i;

    // TX deskew pulse - Distribute to AIB 6/7 and other AIB used by Ethernet SIP via PTP-SIP connection
    logic                           tx_dsk_pulse;

    // Core to AIB
    logic   [1:0][79:0]             c2a_aib;
    logic   [15:0][TX_WIDTH-1:0]    c2a_sip;

    logic   [15:0]                  snapshot_ptp_vl_data;
    logic   [15:0][4:0]             ptp_ts;
    logic   [15:0]                  ptp_tx_fp_c2a;
    logic   [15:0][2:0]             ptp_ins_type;

    // AIB to Core
    logic   [1:0][79:0]             a2c_aib;
    logic   [15:0][RX_WIDTH-1:0]    a2c_sip;

    logic   [23:0]                  ptp_debug;

    logic   [15:0][2:0]             ptp_tx_ts;
    logic   [15:0]                  tx_am;
    logic   [15:0]                  ptp_tx_ts_valid;
    logic   [15:0]                  ptp_tx_fp_a2c;
    logic   [15:0]                  rx_am;
    logic   [15:0]                  ptp_rx_ts;
    logic   [15:0]                  ptp_tx_debug;
    logic   [15:0]                  ptp_rx_debug;
    logic   [15:0]                  rx_aib_dsk;


    // Core to AIB
    assign o_c2a_aib_7    =   c2a_aib[0];
    assign o_c2a_aib_6    =   c2a_aib[1];

generate
    // Make sure all unused pins are connected
    assign c2a_aib[0][38] = 1'b0;
    assign c2a_aib[1][38] = 1'b0;
    assign c2a_aib[0][39] = 1'b0;
    assign c2a_aib[1][39] = 1'b0;
    assign c2a_aib[0][79] = 1'b1;
    assign c2a_aib[1][79] = 1'b1;

    // TX deskew pulse
    assign c2a_aib[0][78] = tx_dsk_pulse;
    assign c2a_aib[1][78] = tx_dsk_pulse;

    // Snapshot VL data for 50G/100G non-FEC variants
    assign c2a_aib[0][36] = snapshot_ptp_vl_data[0];
    assign c2a_aib[0][37] = snapshot_ptp_vl_data[2];
    assign c2a_aib[0][76] = snapshot_ptp_vl_data[4];
    assign c2a_aib[0][77] = snapshot_ptp_vl_data[6];
    assign c2a_aib[1][36] = snapshot_ptp_vl_data[8];
    assign c2a_aib[1][37] = snapshot_ptp_vl_data[10];
    assign c2a_aib[1][76] = snapshot_ptp_vl_data[12];
    assign c2a_aib[1][77] = snapshot_ptp_vl_data[14];

    // Per AIB data
    for (i = 0; i < 16; i = i + 1)
    begin:c2a_aib_remap

        assign c2a_sip[15-i]                =   tx_ptp[i];
        assign {snapshot_ptp_vl_data[i],
                ptp_ts              [i],
                ptp_tx_fp_c2a       [i],
                ptp_ins_type        [i]}    =   c2a_sip[i];


        // Per stream data remapping
        // AIB 7 lsb
         // i=3 ins_type  = b27 to b29
         // i=0: ins_type = b0  to b2
        if ( i < 4 ) begin
            assign c2a_aib[0][(i*9)+:3]         =   ptp_ins_type[i];
            assign c2a_aib[0][(i*9)+3]          =   ptp_tx_fp_c2a[i];
            assign c2a_aib[0][(i*9)+4+:5]       =   ptp_ts[i];
        end

        // AIB 7 msb
         // i=7 ins_type  = b67 to b69
         // i=4: ins_type = b40 to b42
        else if ( i > 3 && i < 8) begin
            assign c2a_aib[0][(i*9+4)+:3]       =   ptp_ins_type[i];
            assign c2a_aib[0][(i*9+4)+3]        =   ptp_tx_fp_c2a[i];
            assign c2a_aib[0][(i*9+4)+4+:5]     =   ptp_ts[i];
        end

        // AIB 6 lsb
        else if ( i > 7 && i < 12) begin
            assign c2a_aib[1][((i-8)*9)+:3]     =   ptp_ins_type[i];
            assign c2a_aib[1][((i-8)*9)+3]      =   ptp_tx_fp_c2a[i];
            assign c2a_aib[1][((i-8)*9)+4+:5]   =   ptp_ts[i];
        end

        // AIB 6 msb
        else if ( i > 11 && i < 16) begin
            assign c2a_aib[1][((i-8)*9+4)+:3]   =   ptp_ins_type[i];
            assign c2a_aib[1][((i-8)*9+4)+3]    =   ptp_tx_fp_c2a[i];
            assign c2a_aib[1][((i-8)*9+4)+4+:5] =   ptp_ts[i];
        end
    end:c2a_aib_remap


    // -----------------------------------------------------------------------
    // AIB to Core
    assign a2c_aib[0]   =   i_a2c_aib_7;
    assign a2c_aib[1]   =   i_a2c_aib_6;

    for (i=0; i<16; i=i+1)
    begin:a2c_aib_remap

        // Per stream data remapping
        // AIB 7 lsb
        if ( i < 4 ) begin
            assign ptp_tx_ts        [i] =   a2c_aib[0][(i*8)+:3];
            assign tx_am            [i] =   a2c_aib[0][(i*8)+3];
            assign ptp_tx_ts_valid  [i] =   a2c_aib[0][(i*8)+4];
            assign ptp_tx_fp_a2c    [i] =   a2c_aib[0][(i*8)+5];
            assign rx_am            [i] =   a2c_aib[0][(i*8)+6];
            assign ptp_rx_ts        [i] =   a2c_aib[0][(i*8)+7];
        end

        // AIB 7 msb
        else if ( i > 3 && i < 8) begin
            assign ptp_tx_ts        [i] =   a2c_aib[0][(i*8+8)+:3];
            assign tx_am            [i] =   a2c_aib[0][(i*8+8)+3];
            assign ptp_tx_ts_valid  [i] =   a2c_aib[0][(i*8+8)+4];
            assign ptp_tx_fp_a2c    [i] =   a2c_aib[0][(i*8+8)+5];
            assign rx_am            [i] =   a2c_aib[0][(i*8+8)+6];
            assign ptp_rx_ts        [i] =   a2c_aib[0][(i*8+8)+7];
        end

        // AIB 6 lsb
        else if ( i > 7 && i < 12) begin
            assign ptp_tx_ts        [i] =   a2c_aib[1][((i-8)*8)+:3];
            assign tx_am            [i] =   a2c_aib[1][((i-8)*8)+3];
            assign ptp_tx_ts_valid  [i] =   a2c_aib[1][((i-8)*8)+4];
            assign ptp_tx_fp_a2c    [i] =   a2c_aib[1][((i-8)*8)+5];
            assign rx_am            [i] =   a2c_aib[1][((i-8)*8)+6];
            assign ptp_rx_ts        [i] =   a2c_aib[1][((i-8)*8)+7];
        end

        // AIB 6 msb
        else if ( i > 11 && i < 16) begin
            assign ptp_tx_ts        [i] =   a2c_aib[1][((i-8)*8+8)+:3];
            assign tx_am            [i] =   a2c_aib[1][((i-8)*8+8)+3];
            assign ptp_tx_ts_valid  [i] =   a2c_aib[1][((i-8)*8+8)+4];
            assign ptp_tx_fp_a2c    [i] =   a2c_aib[1][((i-8)*8+8)+5];
            assign rx_am            [i] =   a2c_aib[1][((i-8)*8+8)+6];
            assign ptp_rx_ts        [i] =   a2c_aib[1][((i-8)*8+8)+7];
        end

        // RX deskew - duplicate for each stream
        // AIB 6
        if ( i < 8 ) begin
            assign rx_aib_dsk       [i] =   a2c_aib[0][78];
        end
        
        // AIB 7
        else begin
            assign rx_aib_dsk       [i] =   a2c_aib[1][78];
        end

        // Merge into single bus for each stream
        assign a2c_sip[i]       =  {tx_dsk_pulse     ,
                                    rx_aib_dsk      [i],
                                    ptp_rx_debug    [i],
                                    ptp_tx_debug    [i],
                                    ptp_rx_ts       [i],
                                    rx_am           [i],
                                    ptp_tx_fp_a2c   [i],
                                    ptp_tx_ts_valid [i],
                                    tx_am           [i],
                                    ptp_tx_ts       [i]};
        assign rx_ptp[i]        =   a2c_sip         [15-i];

    end:a2c_aib_remap
endgenerate

// Debug port that indicates Virtual Lane ID
// Mapping of 24-bit PTP debug signal to stream
// ptp_debug    400g        200g    100g    50g     aib map
// 0            tx 1pkt     tx[0]   tx[0]   tx[0]   ch0
// 1            tx 1pkt     tx[0]   tx[0]   tx[1]   ch2
// 2            tx 1pkt     tx[0]   tx[0]           ch3
// 3            tx 1pkt             tx[1]   tx[2]   ch4
// 4                                tx[1]   tx[3]   ch6
// 5                                tx[1]           ch7
// 6            tx 2pkt     tx[1]   tx[2]   tx[4]   ch8
// 7            tx 2pkt     tx[1]   tx[2]   tx[5]   ch10
// 8            tx 2pkt     tx[1]   tx[2]           ch11
// 9            tx 2pkt             tx[3]   tx[6]   ch12
// 10                               tx[3]   tx[7]   ch14
// 11                               tx[3]           ch15
// 12           rx 1pkt     rx[0]   rx[0]   rx[0]   ch0
// 13           rx 1pkt     rx[0]   rx[0]   rx[1]   ch2
// 14           rx 1pkt     rx[0]   rx[0]           ch3
// 15           rx 1pkt             rx[1]   rx[2]   ch4
// 16                               rx[1]   rx[3]   ch6
// 17                               rx[1]           ch7
// 18           rx 2pkt     rx[1]   rx[2]   rx[4]   ch8
// 19           rx 2pkt     rx[1]   rx[2]   rx[5]   ch10
// 20           rx 2pkt     rx[1]   rx[2]           ch11
// 21           rx 2pkt             rx{3]   rx[6]   ch12
// 22                               rx{3]   rx[7]   ch14
// 23                               rx{3]           ch15

    assign ptp_debug[ 2: 0] =   a2c_aib[0][34:32];
    assign ptp_debug[ 5: 3] =   a2c_aib[0][74:72];
    assign ptp_debug[ 8: 6] =   a2c_aib[1][34:32];
    assign ptp_debug[11: 9] =   a2c_aib[1][74:72];
    assign ptp_debug[14:12] =   a2c_aib[0][37:35];
    assign ptp_debug[17:15] =   a2c_aib[0][77:75];
    assign ptp_debug[20:18] =   a2c_aib[1][37:35];
    assign ptp_debug[23:21] =   a2c_aib[1][77:75];

    assign ptp_tx_debug [0] =   ptp_debug[0];
    assign ptp_tx_debug [1] =   1'b0;
    assign ptp_tx_debug [2] =   ptp_debug[1];
    assign ptp_tx_debug [3] =   ptp_debug[2];
    assign ptp_tx_debug [4] =   ptp_debug[3];
    assign ptp_tx_debug [5] =   1'b0;
    assign ptp_tx_debug [6] =   ptp_debug[4];
    assign ptp_tx_debug [7] =   ptp_debug[5];
    assign ptp_tx_debug [8] =   ptp_debug[6];
    assign ptp_tx_debug [9] =   1'b0;
    assign ptp_tx_debug[10] =   ptp_debug[7];
    assign ptp_tx_debug[11] =   ptp_debug[8];
    assign ptp_tx_debug[12] =   ptp_debug[9];
    assign ptp_tx_debug[13] =   1'b0;
    assign ptp_tx_debug[14] =   ptp_debug[10];
    assign ptp_tx_debug[15] =   ptp_debug[11];

    assign ptp_rx_debug [0] =   ptp_debug[12];
    assign ptp_rx_debug [1] =   1'b0;
    assign ptp_rx_debug [2] =   ptp_debug[13];
    assign ptp_rx_debug [3] =   ptp_debug[14];
    assign ptp_rx_debug [4] =   ptp_debug[15];
    assign ptp_rx_debug [5] =   1'b0;
    assign ptp_rx_debug [6] =   ptp_debug[16];
    assign ptp_rx_debug [7] =   ptp_debug[17];
    assign ptp_rx_debug [8] =   ptp_debug[18];
    assign ptp_rx_debug [9] =   1'b0;
    assign ptp_rx_debug[10] =   ptp_debug[19];
    assign ptp_rx_debug[11] =   ptp_debug[20];
    assign ptp_rx_debug[12] =   ptp_debug[21];
    assign ptp_rx_debug[13] =   1'b0;
    assign ptp_rx_debug[14] =   ptp_debug[22];
    assign ptp_rx_debug[15] =   ptp_debug[23];

eth_f_ptp_avmm_adapt #(
    .ADDR_WIDTH    (ADDR_WIDTH)
    ) ptp_avmm_adapt (
    .i_clk                              (i_reconfig_clk                     ),
    .i_rst                              (i_reconfig_reset                   ),
    .i_avmm_s32_addr_aib6               (i_reconfig_ptp_asym_addr           ),
    .i_avmm_s32_wdata_aib6              (i_reconfig_ptp_asym_writedata      ),
    .i_avmm_s32_write_aib6              (i_reconfig_ptp_asym_write          ),
    .i_avmm_s32_read_aib6               (i_reconfig_ptp_asym_read           ),
    .i_avmm_s32_byte_enable_aib6        (i_reconfig_ptp_asym_byteenable     ),
    .o_avmm_s32_readdata_aib6           (o_reconfig_ptp_asym_readdata       ),
    .o_avmm_s32_waitrequest_aib6        (o_reconfig_ptp_asym_waitrequest    ),
    .o_avmm_s32_readdatavalid_aib6      (o_reconfig_ptp_asym_readdata_valid ),
    .pld_avmm1_busy_aib6                ( pld_ptp_avmm1_busy             [1]),
    .pld_avmm1_clk_rowclk_aib6          ( pld_ptp_avmm1_clk_rowclk       [1]),
    .pld_avmm1_cmdfifo_wr_full_aib6     ( pld_ptp_avmm1_cmdfifo_wr_full  [1]),
    .pld_avmm1_cmdfifo_wr_pfull_aib6    ( pld_ptp_avmm1_cmdfifo_wr_pfull [1]),
    .pld_avmm1_read_aib6                ( pld_ptp_avmm1_read             [1]),
    .pld_avmm1_readdata_aib6            ( pld_ptp_avmm1_readdata         [1]),
    .pld_avmm1_readdatavalid_aib6       ( pld_ptp_avmm1_readdatavalid    [1]),
    .pld_avmm1_reg_addr_aib6            ( pld_ptp_avmm1_reg_addr         [1]),
    .pld_avmm1_request_aib6             ( pld_ptp_avmm1_request          [1]),
    .pld_avmm1_reserved_in_aib6         ( pld_ptp_avmm1_reserved_in      [1]),
    .pld_avmm1_reserved_out_aib6        ( pld_ptp_avmm1_reserved_out     [1]),
    .pld_avmm1_write_aib6               ( pld_ptp_avmm1_write            [1]),
    .pld_avmm1_writedata_aib6           ( pld_ptp_avmm1_writedata        [1]),
    .pld_chnl_cal_done_aib6             ( pld_ptp_chnl_cal_done          [1]),
    .pld_hssi_osc_transfer_en_aib6      ( pld_ptp_hssi_osc_transfer_en   [1]),
    .i_avmm_s32_addr_aib7               (i_reconfig_ptp_p2p_addr            ),
    .i_avmm_s32_wdata_aib7              (i_reconfig_ptp_p2p_writedata       ),
    .i_avmm_s32_write_aib7              (i_reconfig_ptp_p2p_write           ),
    .i_avmm_s32_read_aib7               (i_reconfig_ptp_p2p_read            ),
    .i_avmm_s32_byte_enable_aib7        (i_reconfig_ptp_p2p_byteenable      ),
    .o_avmm_s32_readdata_aib7           (o_reconfig_ptp_p2p_readdata        ),
    .o_avmm_s32_waitrequest_aib7        (o_reconfig_ptp_p2p_waitrequest     ),
    .o_avmm_s32_readdatavalid_aib7      (o_reconfig_ptp_p2p_readdata_valid  ),
    .pld_avmm1_busy_aib7                ( pld_ptp_avmm1_busy             [0]),
    .pld_avmm1_clk_rowclk_aib7          ( pld_ptp_avmm1_clk_rowclk       [0]),
    .pld_avmm1_cmdfifo_wr_full_aib7     ( pld_ptp_avmm1_cmdfifo_wr_full  [0]),
    .pld_avmm1_cmdfifo_wr_pfull_aib7    ( pld_ptp_avmm1_cmdfifo_wr_pfull [0]),
    .pld_avmm1_read_aib7                ( pld_ptp_avmm1_read             [0]),
    .pld_avmm1_readdata_aib7            ( pld_ptp_avmm1_readdata         [0]),
    .pld_avmm1_readdatavalid_aib7       ( pld_ptp_avmm1_readdatavalid    [0]),
    .pld_avmm1_reg_addr_aib7            ( pld_ptp_avmm1_reg_addr         [0]),
    .pld_avmm1_request_aib7             ( pld_ptp_avmm1_request          [0]),
    .pld_avmm1_reserved_in_aib7         ( pld_ptp_avmm1_reserved_in      [0]),
    .pld_avmm1_reserved_out_aib7        ( pld_ptp_avmm1_reserved_out     [0]),
    .pld_avmm1_write_aib7               ( pld_ptp_avmm1_write            [0]),
    .pld_avmm1_writedata_aib7           ( pld_ptp_avmm1_writedata        [0]),
    .pld_chnl_cal_done_aib7             ( pld_ptp_chnl_cal_done          [0]),
    .pld_hssi_osc_transfer_en_aib7      ( pld_ptp_hssi_osc_transfer_en   [0])
    );

  eth_f_tx_deskew #(
      .LANES      (1)
  ) ptp_tx_dsk_inst (
      .i_clk      (i_sys_clk),
      .i_resetn   (i_rst_n),
      .o_dsk      (tx_dsk_pulse)
  );


endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX+qUe1dBFVm+uNpyUJ/f/R7qTjt8ZpFc2x84a0kZOcLqZGtyO+spDjdLuhiKGokZw8ltNWSxKxmsrEcFQInn5QoTdq5u3rJ4URn6OcBHn2siuohUBuSYrBq0PA9RtHxt9oF3nPu84pPJZa0MUnS2lSTvtGdLKxJM/t5O8Zetekdb5KdJ444C+fumpXPJRTqzlEukeHX8qbpSxynsmbgtSIWCT3hGK4n6tRNA+RR3Gj9GqTyuLISmCLtbyHnN+d/P6ND46cy7TW62KPhJkWqFutIg7QbQlYtHaLDw5+OMwNHG4djYrogojflKorujryF8kyn32+nLjEcXqXl0JkNUUyMEgmy846Q+MZgn66Wp5Sk5vyA1fWRqhIZjT1s7jaOk41vBegiiP26+uUH0So5X8w68/Vd5TTPDerLLk/fpnfHtg1+f1VDO67eL392KDl1A7GqgNfi82U82QvPd4VvLlww/VOA/3lJ8okdg5EvGMEexO1FqK86j9ialcXcvy6IVaaNnWFJIYZxS6qDIVdVrD94dAZuRULqt4Z6D+Wnau/jbaB1RZvm7R1F4kr6esewLLOh55AHsbCVpwAJdPJ5KJaBr+XyZAS4GhJL/FJNAfUt+NV3pp/e9KR2+ViI7V3FxgVnSGZ5pkaM8nJw87tiHadX+RbbN1ZInsK4TKpss3t5ewK8WLOCl0kIcb7W/bp3UCnJqWIZz2IA6bTdLF0dxcxCjgmvsIcDgkA3jgtAVccz9Cg36KFJXMPGakXPW0a3qFNq+0Txq9kl8zrZX4bqckzi"
`endif