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


//------------------------------------------------------------------------------
//
// Filename         : eth_f_ptp.sv
//
//==============================================================================

//------------------------------------------------------------------------------
//
// Description :-
//               ptp_state_ctrl
//               ptp_ref_ts_capture
//               ptp_opcode_writer
//               ptp_ts_conversion
//------------------------------------------------------------------------------

`timescale 1ns / 1ns
module eth_f_ptp 
import eth_f_package::*;
#(
    parameter APUL_MEAS         = 0,
    parameter PL                = 1,
    parameter WORDS             = 1,
    parameter PKT_CYL           = 1,
    parameter XCVR_TYPE         = 0,
    parameter PTP_FP_WIDTH      = 8,
    parameter BCMSIM_EN         = 0,
    parameter DEBUG             = 0
) (
    // Configuration [quasi-static]
    input  logic                [2:0] i_cfg_speed,
    input  logic                [2:0] i_cfg_rsfec,
    input  logic                [4:0] i_cfg_pl,
    input  logic                      i_cfg_tx_pp,

    // Clock and Reset
    input  logic                      i_ptp_clk,          // sys/2
    input  logic                      i_ptp_sample_clk,   // 250MHz or 114.28 MHz (TBD)
    input  logic                      i_tx_tod_clk,
    input  logic                      i_rx_tod_clk,
    input  logic                      i_tx_srst_n,
    input  logic                      i_rx_srst_n,
    input  logic                      i_tx_tod_srst_n,
    input  logic                      i_rx_tod_srst_n,
    input  logic                      i_tx_samp_srst_n,
    input  logic                      i_rx_samp_srst_n,

    // CSR: calculation data to user [ptp_clk, sample_clk]
    output logic                      o_tx_apulse_wdly_valid,   // sample_clk
    output logic                      o_tx_apulse_offset_valid, // sample_clk
    output logic                      o_tx_apulse_time_valid,   // ptp_clk
    output logic                      o_rx_apulse_wdly_valid,   // sample_clk
    output logic                      o_rx_apulse_offset_valid, // sample_clk
    output logic                      o_rx_apulse_time_valid,   // ptp_clk
    output logic [PL-1:0][19:0]       o_tx_apulse_wdly,         // sample_clk
    output logic [PL-1:0][31:0]       o_tx_apulse_offset,       // sample_clk
    output logic [PL-1:0][27:0]       o_tx_apulse_time,         // ptp_clk
    output logic [PL-1:0][19:0]       o_rx_apulse_wdly,         // sample_clk
    output logic [PL-1:0][31:0]       o_rx_apulse_offset,       // sample_clk
    output logic [PL-1:0][27:0]       o_rx_apulse_time,         // ptp_clk
    output logic               [31:0] o_tx_const_adjust,        // combi
    output logic               [31:0] o_rx_const_adjust,        // combi
    // CSR: Reference lane [tod_clk]
    input  logic                [2:0] i_tx_ref_lane,
    input  logic                [2:0] i_rx_lal,
    // CSR: TAM adjust [ptp_clk]
    input  logic               [31:0] i_tx_calc_adjust,
    input  logic               [31:0] i_rx_calc_adjust,
    // CSR & EHIP Interface: 50G/100G nonFEC only - RX virtual lane offset user cfg done [ptp_clk]
    output logic                      o_rx_ptp_vl_snapshot,       // (shared interface) request HIP to snapshot raw data, at the same time notify user via CSR that HIP has snapshot
    // CSR: FEC only - RX FEC codeword position user cfg done [ptp_clk]
    input  logic                      i_rx_fec_cw_pos_user_cfg_done,
    // CSR: User Configuration done [ptp_clk]
    input  logic                      i_tx_ptp_user_cfg_done,
    input  logic                      i_rx_ptp_user_cfg_done,
    output logic                      o_tx_ptp_user_cfg_done_clrn,
    output logic                      o_rx_ptp_user_cfg_done_clrn,
    // CSR: UI measurement [ptp_clk]
    output logic                      o_tx_tam_valid,
    output logic               [15:0] o_tx_tam_cnt,  
    output logic               [47:0] o_tx_tam_ui,   
    output logic                      o_rx_tam_valid,
    output logic               [15:0] o_rx_tam_cnt,  
    output logic               [47:0] o_rx_tam_ui,   
    
    // User Interface: TX Framing Interface [ptp_clk]
    input  logic                      i_tx_pkt_valid,
    input  logic [WORDS-1:0]          i_tx_pkt_inframe,
    input  logic [WORDS-1:0][63:0]    i_tx_pkt_data,
    input  logic [WORDS-1:0][2:0]     i_tx_pkt_empty,
    input  logic [WORDS-1:0]          i_tx_pkt_error,
    input  logic [WORDS-1:0]          i_tx_pkt_skip_crc,
    // EHIP Interface: TX Framing Interface [ptp_clk]
    output logic                      o_tx_pkt_valid,
    output logic [WORDS-1:0]          o_tx_pkt_inframe,
    output logic [WORDS-1:0][63:0]    o_tx_pkt_data,
    output logic [WORDS-1:0][2:0]     o_tx_pkt_empty,
    output logic [WORDS-1:0]          o_tx_pkt_error,
    output logic [WORDS-1:0]          o_tx_pkt_skip_crc,
    
    // EHIP Interface: RX Framing Interface [ptp_clk]
    input  logic                      i_rx_pkt_valid,
    input  logic [WORDS-1:0]          i_rx_pkt_inframe,
    input  logic [WORDS-1:0][63:0]    i_rx_pkt_data,
    input  logic [WORDS-1:0][2:0]     i_rx_pkt_empty,
    input  logic [WORDS-1:0][1:0]     i_rx_pkt_error,
    input  logic [WORDS-1:0]          i_rx_pkt_fcs_error,
    input  logic [WORDS-1:0][2:0]     i_rx_pkt_status,
    // User Interface: RX Framing Interface [ptp_clk]
    output logic                      o_rx_pkt_valid,
    output logic [WORDS-1:0]          o_rx_pkt_inframe,
    output logic [WORDS-1:0][63:0]    o_rx_pkt_data,
    output logic [WORDS-1:0][2:0]     o_rx_pkt_empty,
    output logic [WORDS-1:0][1:0]     o_rx_pkt_error,
    output logic [WORDS-1:0]          o_rx_pkt_fcs_error,
    output logic [WORDS-1:0][2:0]     o_rx_pkt_status,
    
    // User Interface: TOD Interface [ptp_clk, tod_clk]
    input  logic                      i_tx_ptp_tod_valid,
    input  logic               [95:0] i_tx_ptp_tod,
    input  logic                      i_rx_ptp_tod_valid,
    input  logic               [95:0] i_rx_ptp_tod,
    // User Interface: TX 1-step Command [ptp_clk]
    input  logic [PKT_CYL-1:0]        i_tx_ptp_ins_ets,
    input  logic [PKT_CYL-1:0]        i_tx_ptp_ins_cf,
    input  logic [PKT_CYL-1:0]        i_tx_ptp_ins_cs,
    input  logic [PKT_CYL-1:0]        i_tx_ptp_ins_eb,
    input  logic [PKT_CYL-1:0]        i_tx_ptp_ets_format,
    input  logic [PKT_CYL-1:0]        i_tx_ptp_ins_asm,
    input  logic [PKT_CYL-1:0]        i_tx_ptp_ins_p2p,
    input  logic [PKT_CYL-1:0]        i_tx_ptp_asm_sign,
    input  logic [PKT_CYL-1:0][6:0]   i_tx_ptp_asm_p2p_idx,
    input  logic [PKT_CYL-1:0][15:0]  i_tx_ptp_offset_ts,
    input  logic [PKT_CYL-1:0][15:0]  i_tx_ptp_offset_cf,
    input  logic [PKT_CYL-1:0][15:0]  i_tx_ptp_offset_cs,
    input  logic [PKT_CYL-1:0][95:0]  i_tx_ptp_rt_its,
    // User Interface: TX 2-step Timestamp Request [ptp_clk]
    input  logic [PKT_CYL-1:0]        i_tx_ptp_req_ets,
    input  logic [PKT_CYL-1:0][PTP_FP_WIDTH-1:0]   i_tx_ptp_req_fp,
    // EHIP Interface: TX 1-step and 2-step Command [ptp_clk]
    output logic [WORDS-1:0][2:0]     o_tx_ptp_ins_type,
    output logic [WORDS-1:0][4:0]     o_tx_ptp_ts,
    output logic [WORDS-1:0]          o_tx_ptp_fp,
    
    // EHIP Interface: TX 2-step Timestamp Return [ptp_clk]
    input  logic [PKT_CYL-1:0]        i_tx_ptp_ets_valid,
    input  logic [WORDS-1:0][2:0]     i_tx_ptp_ets,
    input  logic [WORDS-1:0]          i_tx_ptp_ets_fp,
    input  logic [PKT_CYL-1:0][3:0]   i_tx_ptp_ets_vl,
    // User Interface: TX 2-step Timestamp Return [ptp_clk]
    output logic [PKT_CYL-1:0]        o_tx_ptp_ets_valid,
    output logic [PKT_CYL-1:0][95:0]  o_tx_ptp_ets,
    output logic [PKT_CYL-1:0][PTP_FP_WIDTH-1:0]   o_tx_ptp_ets_fp,
    output logic [PKT_CYL-1:0][4:0]   o_tx_ptp_ets_vl,
    // EHIP Interface: RX Timestamp Return [ptp_clk]
    input  logic [WORDS-1:0]          i_rx_ptp_its,
    input  logic [PKT_CYL-1:0][3:0]   i_rx_ptp_its_vl,
    // User Interface: RX Timestamp Return [ptp_clk]
    output logic [PKT_CYL-1:0]        o_rx_ptp_its_valid,
    output logic [PKT_CYL-1:0][95:0]  o_rx_ptp_its,
    output logic [PKT_CYL-1:0][4:0]   o_rx_ptp_its_vl,
    
    // EHIP Interface: Reference Timestamp
    output logic [PL-1:0]             o_tx_ptp_async_cal_sel,
    output logic [PL-1:0]             o_rx_ptp_async_cal_sel,
    output logic [PL-1:0]             o_ptp_async_cal_pulse,
    input  logic [PL-1:0]             i_tx_ptp_async_pulse,
    input  logic [PL-1:0]             i_rx_ptp_async_pulse,
    input  logic                      i_tx_ptp_sync_am,
    input  logic                      i_rx_ptp_sync_am,

    // EHIP Interface: Status [async]
    input  logic [PL-1:0]             i_stat_rxpll_lock,
    input  logic                      i_rx_rst_ack_n, // 0: indicate TILE is in reset ; 1: does NOT indicate TILE out of reset
    // SRC to assert ehip_signal_ok
    output logic                      o_sclk_sent,
    // CSR & User Interface: PTP Status [ptp_clk]
    output logic                      o_tx_ptp_offset_data_valid,
    output logic                      o_rx_ptp_offset_data_valid,
    output logic                      o_tx_ptp_ready,
    output logic                      o_rx_ptp_ready
    
);
`ifdef ALTERA_RESERVED_QIS  // hw mode
    localparam SIM_MODE = BCMSIM_EN? 1: 0;
`else   // sim mode
    localparam SIM_MODE = 1;
`endif
    
    // internal connection
    logic [WORDS:0]     tx_rst_n;     
    logic [WORDS:0]     rx_rst_n;
    logic               tx_meas_restart, tx_meas_wdly, tx_meas_dt, tx_meas_time, tx_en_tam_load;
    logic               rx_meas_restart, rx_meas_wdly, rx_meas_dt, rx_meas_time, rx_en_tam_load;
    logic               req_tx_tam_load;
    logic               req_rx_tam_load;
    logic [95:0]        tx_tam;
    logic [95:0]        rx_tam;
    logic               tx_tam_load_complete;
    logic               rx_tam_load_complete;
    logic               tx_ptp_tod_valid_ptp;
    logic               rx_ptp_tod_valid_ptp;

    // -----------------------------------------------
    //  eth interface and ptp interface byte reverse
    logic                      rev_in_tx_pkt_valid   , rev_out_tx_pkt_valid      ;
    logic [WORDS-1:0]          rev_in_tx_pkt_inframe , rev_out_tx_pkt_inframe    ;
    logic [WORDS-1:0][63:0]    rev_in_tx_pkt_data    , rev_out_tx_pkt_data       ;
    logic [WORDS-1:0][2:0]     rev_in_tx_pkt_empty   , rev_out_tx_pkt_empty      ;
    logic [WORDS-1:0]          rev_in_tx_pkt_error   , rev_out_tx_pkt_error      ;
    logic [WORDS-1:0]          rev_in_tx_pkt_skip_crc, rev_out_tx_pkt_skip_crc   ;
    logic                      rev_in_rx_pkt_valid    , rev_out_rx_pkt_valid        ;
    logic [WORDS-1:0]          rev_in_rx_pkt_inframe  , rev_out_rx_pkt_inframe      ;
    logic [WORDS-1:0][63:0]    rev_in_rx_pkt_data     , rev_out_rx_pkt_data         ;
    logic [WORDS-1:0][2:0]     rev_in_rx_pkt_empty    , rev_out_rx_pkt_empty        ;
    logic [WORDS-1:0][1:0]     rev_in_rx_pkt_error    , rev_out_rx_pkt_error        ;
    logic [WORDS-1:0]          rev_in_rx_pkt_fcs_error, rev_out_rx_pkt_fcs_error    ;
    logic [WORDS-1:0][2:0]     rev_in_rx_pkt_status   , rev_out_rx_pkt_status       ;
    
    logic [PKT_CYL-1:0]        rev_in_tx_ptp_ins_ets, rev_in_tx_ptp_ins_cf, rev_in_tx_ptp_ins_cs, rev_in_tx_ptp_ins_eb;
    logic [PKT_CYL-1:0]        rev_in_tx_ptp_ets_format, rev_in_tx_ptp_ins_asm, rev_in_tx_ptp_ins_p2p, rev_in_tx_ptp_asm_sign;
    logic [PKT_CYL-1:0]        rev_in_tx_ptp_req_ets;
    logic [PKT_CYL-1:0][7:0]   rev_in_tx_ptp_req_fp;
    logic [PKT_CYL-1:0][6:0]   rev_in_tx_ptp_asm_p2p_idx;
    logic [PKT_CYL-1:0][95:0]  rev_in_tx_ptp_rt_its;
    logic [PKT_CYL-1:0][15:0]  rev_in_tx_ptp_offset_ts;
    logic [PKT_CYL-1:0][15:0]  rev_in_tx_ptp_offset_cf;
    logic [PKT_CYL-1:0][15:0]  rev_in_tx_ptp_offset_cs;
    logic [WORDS-1:0][2:0]     rev_out_tx_ptp_ins_type;
    logic [WORDS-1:0][4:0]     rev_out_tx_ptp_ts;
    logic [WORDS-1:0]          rev_out_tx_ptp_fp;
    logic [PKT_CYL-1:0]        rev_in_tx_ptp_ets_valid;
    logic [WORDS-1:0][2:0]     rev_in_tx_ptp_ets;
    logic [WORDS-1:0]          rev_in_tx_ptp_ets_fp;
    logic [PKT_CYL-1:0][3:0]   rev_in_tx_ptp_ets_vl;
    logic [PKT_CYL-1:0]        rev_out_tx_ptp_ets_valid;
    logic [PKT_CYL-1:0]        rev_out_tx_ptp_ets_valid_early;
    logic [PKT_CYL-1:0][95:0]  rev_out_tx_ptp_ets;
    logic [PKT_CYL-1:0][7:0]   rev_out_tx_ptp_ets_fp;
    logic [PKT_CYL-1:0][4:0]   rev_out_tx_ptp_ets_vl;
    logic [WORDS-1:0]          rev_in_rx_ptp_its;
    logic [PKT_CYL-1:0][3:0]   rev_in_rx_ptp_its_vl;
    logic [PKT_CYL-1:0]        rev_out_rx_ptp_its_valid;
    logic [PKT_CYL-1:0][95:0]  rev_out_rx_ptp_its;
    logic [PKT_CYL-1:0][4:0]   rev_out_rx_ptp_its_vl;
    logic [PKT_CYL-1:0][7:0]   tx_ptp_req_fp;
    logic [PKT_CYL-1:0][7:0]   tx_ptp_ets_fp_early;
    logic [PKT_CYL-1:0]        tx_ptp_ets_valid_early;
    logic [PKT_CYL-1:0][7:0]   rev_out_tx_ptp_ets_fp_early;
    
    eth_f_ptp_if_remap #(
        .WORDS          (WORDS),
        .PKT_CYL        (PKT_CYL)
    )ptp_if_remap (
        // --  TX in & out
        .i_tx_pkt_valid         (i_tx_pkt_valid),
        .i_tx_pkt_inframe       (i_tx_pkt_inframe),
        .i_tx_pkt_data          (i_tx_pkt_data),
        .i_tx_pkt_empty         (i_tx_pkt_empty),
        .i_tx_pkt_error         (i_tx_pkt_error),
        .i_tx_pkt_skip_crc      (i_tx_pkt_skip_crc),
        .o_rev_tx_pkt_valid     (rev_in_tx_pkt_valid),
        .o_rev_tx_pkt_inframe   (rev_in_tx_pkt_inframe),
        .o_rev_tx_pkt_data      (rev_in_tx_pkt_data),
        .o_rev_tx_pkt_empty     (rev_in_tx_pkt_empty),
        .o_rev_tx_pkt_error     (rev_in_tx_pkt_error),
        .o_rev_tx_pkt_skip_crc  (rev_in_tx_pkt_skip_crc),
        .i_rev_tx_pkt_valid     (rev_out_tx_pkt_valid),
        .i_rev_tx_pkt_inframe   (rev_out_tx_pkt_inframe),
        .i_rev_tx_pkt_data      (rev_out_tx_pkt_data),
        .i_rev_tx_pkt_empty     (rev_out_tx_pkt_empty),
        .i_rev_tx_pkt_error     (rev_out_tx_pkt_error),
        .i_rev_tx_pkt_skip_crc  (rev_out_tx_pkt_skip_crc),
        .o_tx_pkt_valid         (o_tx_pkt_valid),
        .o_tx_pkt_inframe       (o_tx_pkt_inframe),
        .o_tx_pkt_data          (o_tx_pkt_data),
        .o_tx_pkt_empty         (o_tx_pkt_empty),
        .o_tx_pkt_error         (o_tx_pkt_error),
        .o_tx_pkt_skip_crc      (o_tx_pkt_skip_crc),
        //---  RX in & out
        .i_rx_pkt_valid         (i_rx_pkt_valid),
        .i_rx_pkt_inframe       (i_rx_pkt_inframe),
        .i_rx_pkt_data          (i_rx_pkt_data),
        .i_rx_pkt_empty         (i_rx_pkt_empty),
        .i_rx_pkt_error         (i_rx_pkt_error),
        .i_rx_pkt_fcs_error     (i_rx_pkt_fcs_error),
        .i_rx_pkt_status        (i_rx_pkt_status),
        .o_rev_rx_pkt_valid     (rev_in_rx_pkt_valid),
        .o_rev_rx_pkt_inframe   (rev_in_rx_pkt_inframe),
        .o_rev_rx_pkt_data      (rev_in_rx_pkt_data),
        .o_rev_rx_pkt_empty     (rev_in_rx_pkt_empty),
        .o_rev_rx_pkt_error     (rev_in_rx_pkt_error),
        .o_rev_rx_pkt_fcs_error (rev_in_rx_pkt_fcs_error), 
        .o_rev_rx_pkt_status    (rev_in_rx_pkt_status),
        .i_rev_rx_pkt_valid     (rev_out_rx_pkt_valid),
        .i_rev_rx_pkt_inframe   (rev_out_rx_pkt_inframe),
        .i_rev_rx_pkt_data      (rev_out_rx_pkt_data),
        .i_rev_rx_pkt_empty     (rev_out_rx_pkt_empty),
        .i_rev_rx_pkt_error     (rev_out_rx_pkt_error),
        .i_rev_rx_pkt_fcs_error (rev_out_rx_pkt_fcs_error),
        .i_rev_rx_pkt_status    (rev_out_rx_pkt_status),
        .o_rx_pkt_valid         (o_rx_pkt_valid),
        .o_rx_pkt_inframe       (o_rx_pkt_inframe),
        .o_rx_pkt_data          (o_rx_pkt_data),
        .o_rx_pkt_empty         (o_rx_pkt_empty),
        .o_rx_pkt_error         (o_rx_pkt_error),
        .o_rx_pkt_fcs_error     (o_rx_pkt_fcs_error),
        .o_rx_pkt_status        (o_rx_pkt_status),
        //---  PTP TX in & out
        .i_tx_ptp_bus           ({i_tx_ptp_ins_ets       , i_tx_ptp_ins_cf     , i_tx_ptp_ins_cs       , i_tx_ptp_ins_eb,
                                  i_tx_ptp_ets_format    , i_tx_ptp_ins_asm    , i_tx_ptp_ins_p2p      , i_tx_ptp_asm_sign,
                                  i_tx_ptp_req_ets       , tx_ptp_req_fp     , i_tx_ptp_asm_p2p_idx  , i_tx_ptp_rt_its,
                                  i_tx_ptp_offset_ts     , i_tx_ptp_offset_cf  , i_tx_ptp_offset_cs}),
        .o_rev_tx_ptp_bus       ({rev_in_tx_ptp_ins_ets     , rev_in_tx_ptp_ins_cf   , rev_in_tx_ptp_ins_cs     , rev_in_tx_ptp_ins_eb,
                                  rev_in_tx_ptp_ets_format  , rev_in_tx_ptp_ins_asm  , rev_in_tx_ptp_ins_p2p    , rev_in_tx_ptp_asm_sign,
                                  rev_in_tx_ptp_req_ets     , rev_in_tx_ptp_req_fp   , rev_in_tx_ptp_asm_p2p_idx, rev_in_tx_ptp_rt_its,
                                  rev_in_tx_ptp_offset_ts   , rev_in_tx_ptp_offset_cf, rev_in_tx_ptp_offset_cs}),
        .i_rev_tx_ptp_bus       ({rev_out_tx_ptp_ins_type, rev_out_tx_ptp_ts, rev_out_tx_ptp_fp}),                      
        .o_tx_ptp_bus           ({o_tx_ptp_ins_type  , o_tx_ptp_ts  , o_tx_ptp_fp}), 
        //--- PTP TX ETS in & out                       
        .i_tx_ets_bus           ({i_tx_ptp_ets_valid        , i_tx_ptp_ets_vl       , i_tx_ptp_ets      , i_tx_ptp_ets_fp}),
        .o_rev_tx_ets_bus       ({rev_in_tx_ptp_ets_valid   , rev_in_tx_ptp_ets_vl  , rev_in_tx_ptp_ets , rev_in_tx_ptp_ets_fp}),
        .i_rev_tx_ets_bus       ({rev_out_tx_ptp_ets_valid  , rev_out_tx_ptp_ets_valid_early, rev_out_tx_ptp_ets_vl , rev_out_tx_ptp_ets, rev_out_tx_ptp_ets_fp_early}),                     
        .o_tx_ets_bus           ({o_tx_ptp_ets_valid        , tx_ptp_ets_valid_early, o_tx_ptp_ets_vl       , o_tx_ptp_ets      , tx_ptp_ets_fp_early}),
        //---  PTP RX ITS in & out
        .i_rx_its_bus           ({i_rx_ptp_its_vl       , i_rx_ptp_its}),
        .o_rev_rx_its_bus       ({rev_in_rx_ptp_its_vl  , rev_in_rx_ptp_its}),
        .i_rev_rx_its_bus       ({rev_out_rx_ptp_its_valid  , rev_out_rx_ptp_its_vl , rev_out_rx_ptp_its}),
        .o_rx_its_bus           ({o_rx_ptp_its_valid        , o_rx_ptp_its_vl       , o_rx_ptp_its})
    );
    
    // -----------------------------------------------
    //  PTP state control
    
    eth_f_ptp_state_ctrl #(
        .ENABLE_DT      (APUL_MEAS),
        .WORDS          (WORDS),
        .PL             (PL)
    )ptp_state_ctrl_u(
        // Reset in
        .i_ptp_clk          (i_ptp_clk),
        .i_tx_srst_n        (i_tx_srst_n),
        .i_rx_srst_n        (i_rx_srst_n),
        .i_tx_tod_clk       (i_tx_tod_clk),
        .i_rx_tod_clk       (i_rx_tod_clk),
        .i_tx_tod_srst_n    (i_tx_tod_srst_n),
        .i_rx_tod_srst_n    (i_rx_tod_srst_n),
        // Reset out (sync-ed, multiple fan out)
        .o_tx_rst_n         (tx_rst_n),
        .o_rx_rst_n         (rx_rst_n),
        // Config
        .i_cfg_speed                    (i_cfg_speed),
        .i_cfg_rsfec                    (i_cfg_rsfec),
        .i_cfg_pl                       (i_cfg_pl),
        // EHIP status in
        .i_tx_ptp_tod_valid             (i_tx_ptp_tod_valid),
        .i_rx_ptp_tod_valid             (i_rx_ptp_tod_valid),
        .o_tx_ptp_tod_valid_ptp         (tx_ptp_tod_valid_ptp),
        .o_rx_ptp_tod_valid_ptp         (rx_ptp_tod_valid_ptp),
        // Internal status in
        .i_sclk_sent                    (o_sclk_sent),
        .i_tx_apulse_wdly_valid         (o_tx_apulse_wdly_valid),
        .i_rx_apulse_wdly_valid         (o_rx_apulse_wdly_valid),
        .i_tx_apulse_time_valid         (o_tx_apulse_time_valid),
        .i_rx_apulse_time_valid         (o_rx_apulse_time_valid),
        .i_tx_apulse_offset_valid       (o_tx_apulse_offset_valid),
        .i_rx_apulse_offset_valid       (o_rx_apulse_offset_valid),
        .i_rx_ptp_vl_snapshot           (o_rx_ptp_vl_snapshot),
        .i_tx_tam_load_complete         (tx_tam_load_complete),
        .i_rx_tam_load_complete         (rx_tam_load_complete),
        // User status in
        .i_rxpll_lock                   (i_stat_rxpll_lock),
        .i_rx_fec_cw_pos_user_cfg_done  (i_rx_fec_cw_pos_user_cfg_done),
        .i_tx_ptp_user_cfg_done         (i_tx_ptp_user_cfg_done),
        .i_rx_ptp_user_cfg_done         (i_rx_ptp_user_cfg_done),
        .o_tx_ptp_user_cfg_done_clrn    (o_tx_ptp_user_cfg_done_clrn),
        .o_rx_ptp_user_cfg_done_clrn    (o_rx_ptp_user_cfg_done_clrn),
        // Status out
        .o_tx_meas_restart              (tx_meas_restart),
        .o_tx_meas_wdly                 (tx_meas_wdly),
        .o_tx_meas_dt                   (tx_meas_dt),
        .o_tx_meas_time                 (tx_meas_time),
        .o_rx_meas_restart              (rx_meas_restart),
        .o_rx_meas_wdly                 (rx_meas_wdly),
        .o_rx_meas_dt                   (rx_meas_dt),
        .o_rx_meas_time                 (rx_meas_time),
        .o_tx_en_tam_load               (tx_en_tam_load),
        .o_rx_en_tam_load               (rx_en_tam_load),
        .o_tx_ptp_offset_data_valid     (o_tx_ptp_offset_data_valid),
        .o_rx_ptp_offset_data_valid     (o_rx_ptp_offset_data_valid),
        .o_tx_ptp_ready                 (o_tx_ptp_ready),
        .o_rx_ptp_ready                 (o_rx_ptp_ready)
    );
    
    // -----------------------------------------------
    // Reference Time Capture
    eth_f_ptp_ref_ts_capture  #(
        .BCMSIM_EN       (BCMSIM_EN),
        .SIM_MODE        (SIM_MODE), 
        .ENABLE_DT       (APUL_MEAS), 
        .XCVR_TYPE       (XCVR_TYPE),
        .PL              (PL)
    )ptp_ref_ts_capture_u(
        .i_cfg_speed            (i_cfg_speed),
        .i_cfg_rsfec            (i_cfg_rsfec),
        .i_cfg_pl               (i_cfg_pl),
        .i_clk                  (i_ptp_clk),
        .i_samp_clk             (i_ptp_sample_clk),
        .i_tx_tod_clk           (i_tx_tod_clk),
        .i_rx_tod_clk           (i_rx_tod_clk),
        .i_tx_rst_n             (tx_rst_n[WORDS]),
        .i_rx_rst_n             (rx_rst_n[WORDS]),
        .i_tx_samp_rst_n        (i_tx_samp_srst_n),
        .i_rx_samp_rst_n        (i_rx_samp_srst_n),
        .i_tx_tod_rst_n         (i_tx_tod_srst_n),
        .i_rx_tod_rst_n         (i_rx_tod_srst_n),
        .i_tx_ptp_tod_valid     (tx_ptp_tod_valid_ptp), // valid=0 is widen
        .i_rx_ptp_tod_valid     (rx_ptp_tod_valid_ptp), // valid=0 is widen
        .i_tx_ptp_tod           (i_tx_ptp_tod),
        .i_rx_ptp_tod           (i_rx_ptp_tod),
        //
        .i_tx_meas_restart      (tx_meas_restart),
        .i_tx_meas_wdly         (tx_meas_wdly),
        .i_tx_meas_dt           (tx_meas_dt),
        .i_tx_meas_time         (tx_meas_time),
        .i_tx_cap_tam           (tx_en_tam_load),
        .i_rx_meas_restart      (rx_meas_restart),
        .i_rx_meas_wdly         (rx_meas_wdly),
        .i_rx_meas_dt           (rx_meas_dt),
        .i_rx_meas_time         (rx_meas_time),
        .i_rx_cap_tam           (rx_en_tam_load),
        .i_rxpll_lock           (i_stat_rxpll_lock),
        .i_rx_rst_ack_n         (i_rx_rst_ack_n),
        //
        .o_sclk_sent            (o_sclk_sent),
        .o_sclk                 (o_ptp_async_cal_pulse),
        .o_tx_mux_select        (o_tx_ptp_async_cal_sel),
        .o_rx_mux_select        (o_rx_ptp_async_cal_sel),
        .i_tx_sclk_return       (i_tx_ptp_async_pulse),
        .i_rx_sclk_return       (i_rx_ptp_async_pulse),
        .i_tx_am                (i_tx_ptp_sync_am),
        .i_rx_am                (i_rx_ptp_sync_am),
        //
        .o_tx_const_adjust      (o_tx_const_adjust),
        .o_rx_const_adjust      (o_rx_const_adjust),
        .o_tx_wdly_valid        (o_tx_apulse_wdly_valid),
        .o_rx_wdly_valid        (o_rx_apulse_wdly_valid),
        .o_tx_time_valid        (o_tx_apulse_time_valid),
        .o_rx_time_valid        (o_rx_apulse_time_valid),
        .o_tx_offset_valid      (o_tx_apulse_offset_valid),
        .o_rx_offset_valid      (o_rx_apulse_offset_valid),
        .o_tx_wdly              (o_tx_apulse_wdly),
        .o_rx_wdly              (o_rx_apulse_wdly),
        .o_tx_time              (o_tx_apulse_time),
        .o_rx_time              (o_rx_apulse_time),
        .o_tx_offset            (o_tx_apulse_offset),
        .o_rx_offset            (o_rx_apulse_offset),
        .o_rx_ptp_vl_snapshot   (o_rx_ptp_vl_snapshot),
        //
        .i_tx_ref_lane          (i_tx_ref_lane),
        .i_rx_lal               (i_rx_lal),
        //
        .o_tx_tam               (tx_tam),
        .o_rx_tam               (rx_tam),
        .o_req_tx_tam_load      (req_tx_tam_load),
        .o_req_rx_tam_load      (req_rx_tam_load),
        .o_tx_tam_valid         (o_tx_tam_valid),
        .o_tx_tam_cnt           (o_tx_tam_cnt),
        .o_tx_tam_ui            (o_tx_tam_ui),
        .o_rx_tam_valid         (o_rx_tam_valid),
        .o_rx_tam_cnt           (o_rx_tam_cnt),
        .o_rx_tam_ui            (o_rx_tam_ui)
    );
    
    // -----------------------------------------------
    // Send to Hard IP: Opcode Writer
    eth_f_ptp_opcode_writer #(
        .PKT_CYL            (PKT_CYL),
        .WORDS              (WORDS)
    )ptp_opcode_writer_u(
        .i_clk                      (i_ptp_clk),
        .i_rst_n                    (tx_rst_n),
        .i_cfg_tx_pp                (i_cfg_tx_pp),
        .i_tx_ptp_ins_ets           (rev_in_tx_ptp_ins_ets),
        .i_tx_ptp_ins_cf            (rev_in_tx_ptp_ins_cf),
        .i_tx_ptp_ins_cs            (rev_in_tx_ptp_ins_cs),
        .i_tx_ptp_ins_eb            (rev_in_tx_ptp_ins_eb),
        .i_tx_ptp_ets_format        (rev_in_tx_ptp_ets_format),
        .i_tx_ptp_ins_asm           (rev_in_tx_ptp_ins_asm),
        .i_tx_ptp_ins_p2p           (rev_in_tx_ptp_ins_p2p),
        .i_tx_ptp_asm_sign          (rev_in_tx_ptp_asm_sign),
        .i_tx_ptp_asm_p2p_idx       (rev_in_tx_ptp_asm_p2p_idx),
        .i_tx_ptp_offset_ts         (rev_in_tx_ptp_offset_ts),
        .i_tx_ptp_offset_cf         (rev_in_tx_ptp_offset_cf),
        .i_tx_ptp_offset_cs         (rev_in_tx_ptp_offset_cs),
        .i_tx_ptp_rt_its            (rev_in_tx_ptp_rt_its),
        .i_tx_ptp_req_ets           (rev_in_tx_ptp_req_ets),
        .i_tx_ptp_req_fp            (rev_in_tx_ptp_req_fp),
        .i_tx_data                  (rev_in_tx_pkt_data),
        .i_tx_valid                 (rev_in_tx_pkt_valid),
        .i_tx_inframe               (rev_in_tx_pkt_inframe),
        .i_tx_empty                 (rev_in_tx_pkt_empty),
        .i_tx_error                 (rev_in_tx_pkt_error),
        .i_tx_skip_crc              (rev_in_tx_pkt_skip_crc),
        .i_req_tx_tam_load          (req_tx_tam_load),
        .i_req_rx_tam_load          (req_rx_tam_load),
        .i_tx_tam                   (tx_tam),
        .i_rx_tam                   (rx_tam),
        .i_tx_tam_adj               (i_tx_calc_adjust),
        .i_rx_tam_adj               (i_rx_calc_adjust),
        .o_tx_ptp_ins_type          (rev_out_tx_ptp_ins_type),
        .o_tx_ptp_ts                (rev_out_tx_ptp_ts),
        .o_tx_ptp_fp                (rev_out_tx_ptp_fp),
        .o_tx_data                  (rev_out_tx_pkt_data),
        .o_tx_valid                 (rev_out_tx_pkt_valid),
        .o_tx_inframe               (rev_out_tx_pkt_inframe),
        .o_tx_empty                 (rev_out_tx_pkt_empty),
        .o_tx_error                 (rev_out_tx_pkt_error),
        .o_tx_skip_crc              (rev_out_tx_pkt_skip_crc),
        .o_tx_tam_load_complete     (tx_tam_load_complete),
        .o_rx_tam_load_complete     (rx_tam_load_complete)
    );
    
        
    // -----------------------------------------------
    // SIM force tam, and tam_adj load
    // tam_adj first, tam later (estimate around 20 clock cycles delay))
`ifdef ALTERA_RESERVED_QIS  // hw mode
    // Nothing
`else   // sim mode
    logic [3:0]       sim_tx_tam_adj_load;
    logic [3:0][31:0] sim_tx_tam_adj;
    logic [3:0]       sim_tx_tam_load;
    logic [3:0][95:0] sim_tx_tam;
    logic [3:0]       sim_rx_tam_adj_load;
    logic [3:0][31:0] sim_rx_tam_adj;
    logic [3:0]       sim_rx_tam_load;
    logic [3:0][95:0] sim_rx_tam;
    logic [19:0] pl_tx_tam_load;
    logic [19:0] pl_rx_tam_load;

    always @(posedge i_ptp_clk) begin
        pl_tx_tam_load[19:0]      <= {pl_tx_tam_load[18:0], req_tx_tam_load};
        pl_rx_tam_load[19:0]      <= {pl_rx_tam_load[18:0], req_rx_tam_load};
    end
    assign sim_tx_tam_adj_load[0]  = req_tx_tam_load;
    assign sim_tx_tam_adj[0]       = i_tx_calc_adjust[31:0];
    assign sim_tx_tam_load[0]      = pl_tx_tam_load[19];
    assign sim_tx_tam[0]           = tx_tam[95:0];
    assign sim_rx_tam_adj_load[0]  = req_rx_tam_load;
    assign sim_rx_tam_adj[0]       = i_rx_calc_adjust[31:0];
    assign sim_rx_tam_load[0]      = pl_rx_tam_load[19];
    assign sim_rx_tam[0]           = rx_tam[95:0];

    assign sim_tx_tam_adj_load[3:1]  = 0;
    assign sim_tx_tam_adj[3:1]       = 0;
    assign sim_tx_tam_load[3:1]      = 0;
    assign sim_tx_tam[3:1]           = 0;
    assign sim_rx_tam_adj_load[3:1]  = 0;
    assign sim_rx_tam_adj[3:1]       = 0;
    assign sim_rx_tam_load[3:1]      = 0;
    assign sim_rx_tam[3:1]           = 0;
`endif

    // -----------------------------------------------
    // teng_rx_valid is meant to flush out all rx_pkt_dly pipeline content
    logic [1:0] free_run_cnt;
    logic       int_rx_valid, teng_rx_valid, free_run_rx_valid;
    logic       rx_inframe_p1;
    logic       idle_sop, idle_period;
    
    assign idle_period = (idle_sop & ~(rev_in_rx_pkt_valid & |rev_in_rx_pkt_inframe & ~rx_inframe_p1)); // exclude sop
    // block assignment
    always @ (*) begin
        if(idle_period) begin
            teng_rx_valid = free_run_rx_valid;
        end
        else begin
            teng_rx_valid = rev_in_rx_pkt_valid;
        end
    end
    
    // fake rx_valid based on slowest possible case
    // 25G: 32/33 assertion rate.
    // 10G: 11.6/33 assertion rate. (450MHz) ==> 11/33 or 1/3
    // 10G: 13/33 assertion rate. (402.83MHz)
    // 10G: 32/33 assertion rate. (161MHz)
    always @ (posedge i_ptp_clk) begin
        if (~rx_rst_n[0]) begin
            rx_inframe_p1       <= 1'b0;
            free_run_cnt        <= 2'b00;
            free_run_rx_valid   <= 1'b0;
            idle_sop            <= 1'b0;
        end
        else begin
            if (rev_in_rx_pkt_valid) begin
                rx_inframe_p1   <= |rev_in_rx_pkt_inframe;
                
                idle_sop     <= (~(|rev_in_rx_pkt_inframe) &  rx_inframe_p1) ? 1'b1 :
                                ( |rev_in_rx_pkt_inframe & ~rx_inframe_p1) ? 1'b0 :
                                idle_sop;
            end
            
            // free run counter counting 0 1 2 0 1 2 ..
            // equivalent to rx_valid    0 0 1 0 0 1 .. (1/3 assertion rate)
            if (~idle_sop) begin // reset cnt when not used
                free_run_cnt        <= 2'b00;
            end 
            else if (free_run_cnt[1]) begin // pattern 0 1 2 0 ..
                free_run_cnt        <= 2'b00;
            end
            else begin
                free_run_cnt        <= 2'(free_run_cnt + 2'b01);
            end
            free_run_rx_valid   <= free_run_cnt[1];
        end
    end
    
    // apply to 10G/25G in general
    assign int_rx_valid = (WORDS == 1) ? teng_rx_valid : rev_in_rx_pkt_valid;
    
    // -----------------------------------------------
    // Receive from Hard IP: Timestamps Conversion

    eth_f_ptp_ts_conversion #(
        .DEBUG              (DEBUG),
        .PKT_CYL            (PKT_CYL),
        .WORDS              (WORDS)
        )ptp_ts_conversion_u(
        .i_clk              (i_ptp_clk),
        .i_tx_tod_clk       (i_tx_tod_clk),
        .i_tx_rst_n         (tx_rst_n),
        .i_rx_rst_n         (rx_rst_n),
        .i_tx_tod_rst_n     (i_tx_tod_srst_n),
        .i_tx_ptp_tod       (i_tx_ptp_tod),
        .i_rx_data          (rev_in_rx_pkt_data),
        .i_rx_valid         (int_rx_valid),
        .i_rx_inframe       (rev_in_rx_pkt_inframe),
        .i_rx_empty         (rev_in_rx_pkt_empty),
        .i_rx_error         (rev_in_rx_pkt_error),
        .i_rx_fcs_error     (rev_in_rx_pkt_fcs_error),
        .i_rx_status        (rev_in_rx_pkt_status),
        .i_tx_ptp_ets_valid (rev_in_tx_ptp_ets_valid),
        .i_tx_ptp_ets       (rev_in_tx_ptp_ets),
        .i_tx_ptp_ets_fp    (rev_in_tx_ptp_ets_fp),
        .i_tx_ptp_ets_vl    (rev_in_tx_ptp_ets_vl),
        .i_rx_ptp_its       (rev_in_rx_ptp_its),
        .i_rx_ptp_its_vl    (rev_in_rx_ptp_its_vl),
        .o_rx_data          (rev_out_rx_pkt_data),
        .o_rx_valid         (rev_out_rx_pkt_valid),
        .o_rx_inframe       (rev_out_rx_pkt_inframe),
        .o_rx_empty         (rev_out_rx_pkt_empty),
        .o_rx_error         (rev_out_rx_pkt_error),
        .o_rx_fcs_error     (rev_out_rx_pkt_fcs_error),
        .o_rx_status        (rev_out_rx_pkt_status),
        .o_tx_ptp_ets_valid (rev_out_tx_ptp_ets_valid),
        .o_tx_ptp_ets_valid_early (rev_out_tx_ptp_ets_valid_early),
        .o_tx_ptp_ets       (rev_out_tx_ptp_ets),
        .o_tx_ptp_ets_fp    (rev_out_tx_ptp_ets_fp),
        .o_tx_ptp_ets_fp_early (rev_out_tx_ptp_ets_fp_early),
        .o_tx_ptp_ets_vl    (rev_out_tx_ptp_ets_vl),
        .o_rx_ptp_its_vl    (rev_out_rx_ptp_its_vl),
        .o_rx_ptp_its       (rev_out_rx_ptp_its),
        .o_rx_ptp_its_valid (rev_out_rx_ptp_its_valid)
    );
    
    eth_f_ptp_fp_ext #(
    .WORDS(WORDS),
    .PKT_CYL(PKT_CYL),
    .PTP_FP_WIDTH(PTP_FP_WIDTH),
    .SIM(SIM_MODE)
    ) fp_ext (
        .i_clk(i_ptp_clk),
        .i_reset(~tx_rst_n[0]),
        .i_tx_valid(i_tx_pkt_valid),
        .i_tx_inframe(i_tx_pkt_inframe),
        .i_fp_valid(tx_ptp_ets_valid_early),
        .i_ptp_fp_ext(i_tx_ptp_req_fp),
        .o_ptp_fp_ext(o_tx_ptp_ets_fp),
        .o_ptp_fp(tx_ptp_req_fp),
        .i_ptp_fp(tx_ptp_ets_fp_early)
    );

endmodule : eth_f_ptp

//============================================================================//
//                           E N D   O F   F I L E                            //
//============================================================================//
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX/wUIWq3azA7uTtrUNr08/7yQO8viQ3yRogJxUnPbm0E70d3UYxb/GbkKz5bKf45iNEcPnfIWZZrhPVB4MnJ3+Bo+C1bQTj2uL8ICRekLuMWhg6F+nD9rolZioZ2pyc1i7EpOU9kbHJvX5R2GGjYw3sw5EQiNP8iSSLvU/lQAqo7c4eeBD20wUFZajo7wWINjEs9LqIFVnOPzoK9J2x4K/sSfDDvoVkQOgbwF6NoeUdhJ31lh+EMFBvJrNxC16xQf6JgK1XuselmJLY5AuzYexKpAxFcgJCFIKx5ML1rt0rERwuZMd9drEwupUxJuTR8TFqyS9GXwrFNbZWrdH6LDRFgAbscCOVF8VLcyXDfdMocE0jioX0whBNNhSgIuCosrWkmZHfvWPVVDau5J6i5XC5uBMH8e3DFxxu9tBj+2yyU7RVBjK4bXFw4KzkW5Dqe6vWezdIRR4JmTWfgzZLJklDJfW80IQzcdSI6ZbcLDDCHc45J/ZY6NjZ6qXSDmmvWIR4Qun2RI+zC3TSk1AS6CwP11+IVgHc74fx6kAqP7ZvQsV5dHJSTp1tDs+fiDLKILrq6nT58mHpdArr/dFq6WzLm+769Fkc+yYonSvD4obPeaLZELe4mQz614uckj+aqWx5ONtBLbV2gJbQze98Zd5YajTcJv8l5bPbLmEpbP1HOGaQw+SrlZw6fjEjwUKdvP0KjrRXLk7kbmjGoql6qDPKsdX/JJ+Xdd317Kv49DqU1WOfKDpoA8wTtfnHDgjFOYwLw+sP84I8llhMJhUFBHPi"
`endif