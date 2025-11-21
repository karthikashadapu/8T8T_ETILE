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
//PTP Adapter HIP level module for F-Tile
//=============================================================================
//Declaration

//synthesis translate_off
`timescale 1ns / 1ps
//synthesis translate_on

(* tile_ip_hip *)
module eth_ptp_adpt_f_hip
(
    input   wire                        i_clk_rx,
    input   wire                        i_clk_tx,
    output wire                         o_clk_pll, // from aib7
    input   wire                        i_rx_rst_n,
    input   wire                        i_tx_rst_n, // NOT USED

    input   wire [79:0]                 tx_parallel_ptp_data_aib6,
    output  wire [79:0]                 rx_parallel_ptp_data_aib6,
    input   wire [79:0]                 tx_parallel_ptp_data_aib7,
    output  wire [79:0]                 rx_parallel_ptp_data_aib7,
    
    input   wire [23:0]                 pld_adapter_rx_pld_rst_n,
    input   wire [23:0]                 pld_rx_dll_lock_req,
    input   wire [23:0]                 pld_adapter_tx_pld_rst_n,
    input   wire [23:0]                 pld_tx_dll_lock_req,
    output  wire [23:0]                 pld_aib_fabric_tx_dcd_cal_done,
    output  wire [23:0]                 pld_aib_hssi_tx_dll_lock,
    output  wire [23:0]                 pld_tx_fifo_ready,
    output  wire [23:0]                 pld_fabric_tx_transfer_en,
    output  wire [23:0]                 pld_aib_fabric_rx_dcd_cal_done,
    output  wire [23:0]                 pld_aib_fabric_rx_dll_lock,
    output  wire [23:0]                 pld_rx_fifo_ready,
    output  wire [23:0]                 pld_hssi_rx_transfer_en,
    
    output  wire [1:0]                  pld_ptp_avmm1_busy,
    input   wire [1:0]                  pld_ptp_avmm1_clk_rowclk,
    output  wire [1:0]                  pld_ptp_avmm1_cmdfifo_wr_full,
    output  wire [1:0]                  pld_ptp_avmm1_cmdfifo_wr_pfull,
    input   wire [1:0]                  pld_ptp_avmm1_read,
    output  wire [1:0][7:0]             pld_ptp_avmm1_readdata,
    output  wire [1:0]                  pld_ptp_avmm1_readdatavalid,
    input   wire [1:0][9:0]             pld_ptp_avmm1_reg_addr,
    input   wire [1:0]                  pld_ptp_avmm1_request,
    input   wire [1:0][8:0]             pld_ptp_avmm1_reserved_in,
    output  wire [1:0][2:0]             pld_ptp_avmm1_reserved_out,
    input   wire [1:0]                  pld_ptp_avmm1_write,
    input   wire [1:0][7:0]             pld_ptp_avmm1_writedata,
    output  wire [1:0]                  pld_ptp_chnl_cal_done,
    output  wire [1:0]                  pld_ptp_hssi_osc_transfer_en,

    output `ifndef __TILE_IP__ tri0 `else wire `endif                        ptp_link
);

    wire [1:0]                 aib_rx_ptp_link;
    wire [1:0]                 aib_tx_ptp_link;
    wire [1:0]                 adapt_tx_ptp_link;
    wire [1:0]                 adapt_rx_ptp_link;
    wire [1:0]                 avmm1_ptp_link;

`ifdef __TILE_IP__
    // PTP bb - begin
    // PTP bb attributes value follows ETH_IP attributes value (constant or dynamic) unless specified.
    bb_f_aib
    #(
        // .location                            ("AIB7"),
        .silicon_rev                            ("10nm8agdrb"),
    	.aib_hssi_tx_transfer_clk_hz            ("830078125"),
		.aib_hssi_rx_transfer_clk_hz            ("830078125"),
		// .aib_tx_user_clk_hz                  (bb_f_aib_tx_user_clk_hz), // PTP=0 or do not set
		// .aib_rx_user_clk_hz                  (bb_f_aib_rx_user_clk_hz), // PTP=0 or do not set
        .aibadapt_tx_loopback_mode              ("AIBADAPT_TX_LOOPBACK_DISABLE"),
        .aibadapt_tx_tx_user_clk_sel            ("AIBADAPT_TX_TX_USER_CLK_EHIP"),
        .aibadapt_rx_rx_user_clk_sel            ("AIBADAPT_RX_RX_USER_CLK_EHIP"),
        .aibadapt_tx_sup_mode                   ("AIBADAPT_TX_USER_MODE"),
        .aibadapt_rx_rx_datapath_tb_sel         ("AIBADAPT_RX_PCS_CHNL_TB")
    )
    x_bb_f_aib_ch7
    (
        .ip_data_link                           (/*no-link-needed-for-ptp*/),
        .aib_rx_data_link                       (aib_rx_ptp_link[0]),
        .aib_tx_data_link                       (aib_tx_ptp_link[0]),
        .avmm1_link                             (avmm1_ptp_link[0])
    );

    bb_m_aib_rx
    #(
        // .location                           ("MAIB7")
       .silicon_rev                         ("10nm8agdrb")
    )
    x_bb_m_aib_rx_ch7
    (
        .aib_rx_data_link                   (aib_rx_ptp_link[0]),
        .adapt_rx_data_link                 (adapt_rx_ptp_link[0]),
        .avmm1_link                         (avmm1_ptp_link[0])
    );

    bb_m_aib_tx
    #(
        // .location                           ("MAIB7"),
        .silicon_rev                        ("10nm8agdrb"),
        .sup_mode                           ("USER_MODE")
    )
    x_bb_m_aib_tx_ch7
    (
        .aib_tx_data_link                   (aib_tx_ptp_link[0]),
        .adapt_tx_data_link                 (adapt_tx_ptp_link[0]),
        .avmm1_link                         (avmm1_ptp_link[0])
    );
  
    bb_m_hdpldadapt_rx
    #(
        // .location                               ("MAIB7"),
        .silicon_rev                            ("10nm8agdrb"),
        .hdpldadapt_pld_rx_clk1_dcm_hz          ("415039062"),
        .hdpldadapt_speed_grade                 ("HDPLDADAPT_DASH_2"       ),
        .pld_clk1_sel                           ("PLD_CLK1_DCM"                 ),
        .fifo_mode                              ("PHASE_COMP"),
        .fifo_width                             ("FIFO_DOUBLE_WIDTH")
    )
    x_bb_m_hdpldadapt_rx_ch7
    (
        .ptp_slave_link                         (),                 // Left open, this is not in a ETH data-path IP
        .ptp_master_link                        (),                 // Left open, this is not AIB6 in the PTP IP
        .ptp_pairing_link                       (ptp_link),         // Connects to PTP AIB6 ptp_master_link
        .placement_virtual                      (),                 // Left open, this is not in a ETH data-path IP
        .pld_10g_krfec_rx_blk_lock_real         (),
        .pld_10g_krfec_rx_clr_errblk_cnt_real   (),
        .pld_10g_krfec_rx_diag_data_status_real (),
        .pld_10g_krfec_rx_frame_real            (),
        .pld_10g_rx_clr_ber_count_real          (),
        .pld_10g_rx_crc32_err_real              (),
        .pld_10g_rx_frame_lock_real             (),
        .pld_10g_rx_hi_ber_real                 (),
        .pld_8g_a1a2_k1k2_flag_real             (),
        .pld_8g_a1a2_size_real                  (),
        .pld_8g_bitloc_rev_en_real              (),
        .pld_8g_byte_rev_en_real                (),
        .pld_8g_eidleinfersel_real              (),
        .pld_8g_empty_rmf_real                  (),
        .pld_8g_encdt_real                      (),
        .pld_8g_full_rmf_real                   (),
        .pld_8g_rxelecidle_real                 (),
        .pld_8g_signal_detect_out_real          (), 
        .pld_8g_wa_boundary_real                (),
        .pld_adapter_rx_pld_rst_n_real          (pld_adapter_rx_pld_rst_n[7]),
        .pld_aib_fabric_rx_dll_lock_real        (pld_aib_fabric_rx_dll_lock[7]),
        .pld_aib_fabric_rx_dll_lock_req_real    (),
        .pld_aib_hssi_rx_dcd_cal_done_real      (pld_aib_fabric_rx_dcd_cal_done[7]),
        .pld_aib_hssi_rx_dcd_cal_req_real       (),
        .pld_rx_fifo_ready_real                 (pld_rx_fifo_ready[7]),
        .pld_bitslip_real                       (),
        .pld_fabric_asn_dll_lock_en_real        (),
        .pld_fsr_load_real                      (),
        .pld_hssi_asn_dll_lock_en_real          (),
        .pld_hssi_rx_transfer_en_real           (),
        .pld_ltr_real                           (),
        .pld_pcs_rx_clk_out1_dcm_real           (),
        .pld_pcs_rx_clk_out1_hioint_real        (),
        .pld_pcs_rx_clk_out2_dcm_real           (),
        .pld_pcs_rx_clk_out2_hioint_real        (),
        .pld_pcs_rx_pld_rst_n_real              (i_rx_rst_n), // ehip_rx_rst_n
        .pld_pma_adapt_done_real                (),
        .pld_pma_adapt_start_real               (),
        .pld_pma_coreclkin_rowclk_real          (),
        .pld_pma_early_eios_real                (),
        .pld_pma_eye_monitor_real               (),
        .pld_pma_hclk_hioint_real               (),
        .pld_pma_internal_clk1_hioint_real      (),
        .pld_pma_internal_clk2_hioint_real      (),
        .pld_pma_ltd_b_real                     (),
        .pld_pma_pcie_sw_done_real              (),
        .pld_pma_pcie_switch_real               (),
        .pld_pma_pfdmode_lock_real              (),
        .pld_pma_ppm_lock_real                  (),
        .pld_pma_reserved_in_real               (),
        .pld_pma_reserved_out_real              (),
        .pld_pma_rs_lpbk_b_real                 (),
        .pld_pma_rx_detect_valid_real           (),
        .pld_pma_rx_found_real                  (),
        .pld_pma_rxpll_lock_real                (),
        .pld_pma_rxpma_rstb_real                (),
        .pld_pma_signal_ok_real                 (),
        .pld_pma_testbus_real                   (),
        .pld_pmaif_rxclkslip_real               (),
        .pld_polinv_rx_real                     (),
        .pld_rx_clk1_dcm_real                   (i_clk_rx), 
        .pld_rx_clk1_rowclk_real                (),
        .pld_rx_clk2_rowclk_real                (),
        .pld_rx_dll_lock_req_real               (pld_rx_dll_lock_req[7]),
        .pld_rx_fabric_align_done_real          (),
        .pld_rx_fabric_data_out_real            (rx_parallel_ptp_data_aib7[79:0]),
        .pld_rx_fabric_fifo_align_clr_real      (),
        .pld_rx_fabric_fifo_del_real            (),
        .pld_rx_fabric_fifo_empty_real          (),
        .pld_rx_fabric_fifo_full_real           (),
        .pld_rx_fabric_fifo_insert_real         (),
        .pld_rx_fabric_fifo_latency_pulse_real  (),
        .pld_rx_fabric_fifo_pempty_real         (),
        .pld_rx_fabric_fifo_pfull_real          (),
        .pld_rx_fabric_fifo_rd_en_real          (),
        .pld_rx_fifo_latency_adj_en_real        (),
        .pld_rx_hssi_fifo_empty_real            (),
        .pld_rx_hssi_fifo_full_real             (),
        .pld_rx_hssi_fifo_latency_pulse_real    (),
        .pld_rx_prbs_done_real                  (),
        .pld_rx_prbs_err_real                   (),
        .pld_rx_prbs_err_clr_real               (),
        .pld_rx_ssr_reserved_in_real            (),
        .pld_rx_ssr_reserved_out_real           (),
        .pld_sclk1_rowclk_real                  (),
        .pld_sclk2_rowclk_real                  (),
        .pld_ssr_load_real                      (),
        .pld_syncsm_en_real                     (),
        .pld_test_data_real                     (),
        .adapt_rx_data_link                     (adapt_rx_ptp_link[0]),
        .avmm1_link                             (avmm1_ptp_link[0])
    );

    bb_m_hdpldadapt_tx
    #(
        // .location                                       ("MAIB7"),
        .silicon_rev                                    ("10nm8agdrb"),
        .hdpldadapt_pld_tx_clk1_dcm_hz                  ("415039062"),
        .hdpldadapt_speed_grade                         ("HDPLDADAPT_DASH_2"       ),
        .pld_clk1_sel                                   ("PLD_CLK1_DCM"                 ),
        .duplex_mode                                    ("ENABLE"),
        .fifo_mode                                      ("PHASE_COMP"),
        .fifo_width                                     ("FIFO_DOUBLE_WIDTH")
    )
    x_bb_m_hdpldadapt_tx_ch7
    (
        .hip_aib_fsr_in_real                            (),
        .hip_aib_fsr_out_real                           (),
        .hip_aib_ssr_in_real                            (),
        .hip_aib_ssr_out_real                           (),
        .pld_10g_krfec_tx_frame_real                    (),
        .pld_10g_tx_bitslip_real                        (),
        .pld_10g_tx_burst_en_real                       (),
        .pld_10g_tx_burst_en_exe_real                   (),
        .pld_10g_tx_diag_status_real                    (),
        .pld_10g_tx_wordslip_real                       (),
        .pld_8g_tx_boundary_sel_real                    (),
        .pld_adapter_tx_pld_rst_n_real                  (pld_adapter_tx_pld_rst_n[7]),
        .pld_aib_fabric_tx_dcd_cal_done_real            (pld_aib_fabric_tx_dcd_cal_done[7]),
        .pld_aib_fabric_tx_dcd_cal_req_real             (),
        .pld_aib_hssi_tx_dcd_cal_done_real              (),
        .pld_aib_hssi_tx_dcd_cal_req_real               (),
        .pld_aib_hssi_tx_dll_lock_real                  (pld_aib_hssi_tx_dll_lock[7]),
        .pld_aib_hssi_tx_dll_lock_req_real              (),
        .pld_fabric_tx_transfer_en_real                 (),
        .pld_fpll_shared_direct_async_in_real           (),
        .pld_fpll_shared_direct_async_in_dcm_real       (),
        .pld_fpll_shared_direct_async_in_rowclk_real    (),
        .pld_fpll_shared_direct_async_out_real          (),
        .pld_fpll_shared_direct_async_out_dcm_real      (),
        .pld_fpll_shared_direct_async_out_hioint_real   (),
        .pld_krfec_tx_alignment_real                    (),
        .pld_pcs_tx_clk_out1_dcm_real                   (o_clk_pll),
        .pld_pcs_tx_clk_out1_hioint_real                (),
        .pld_pcs_tx_clk_out2_dcm_real                   (),
        .pld_pcs_tx_clk_out2_hioint_real                (),
        .pld_pcs_tx_pld_rst_n_real                      (),
        .pld_pma_csr_test_dis_real                      (),
        .pld_pma_fpll_clk0bad_real                      (),
        .pld_pma_fpll_clk1bad_real                      (),
        .pld_pma_fpll_clksel_real                       (),
        .pld_pma_fpll_cnt_sel_real                      (),
        .pld_pma_fpll_extswitch_real                    (),
        .pld_pma_fpll_lc_csr_test_dis_real              (),
        .pld_pma_fpll_num_phase_shifts_real             (),
        .pld_pma_fpll_pfden_real                        (),
        .pld_pma_fpll_phase_done_real                   (),
        .pld_pma_fpll_up_dn_lc_lf_rstn_real             (),
        .pld_pma_nrpi_freeze_real                       (),
        .pld_pma_rx_qpi_pullup_real                     (),
        .pld_pma_tx_bitslip_real                        (),
        .pld_pma_tx_qpi_pulldn_real                     (),
        .pld_pma_tx_qpi_pullup_real                     (),
        .pld_pma_txdetectrx_real                        (),
        .pld_pma_txpma_rstb_real                        (),
        .pld_pmaif_mask_tx_pll_real                     (),
        .pld_polinv_tx_real                             (),
        .pld_tx_clk1_dcm_real                           (i_clk_tx),
        .pld_tx_clk1_rowclk_real                        (),
        .pld_tx_clk2_dcm_real                           (i_clk_tx),
        .pld_tx_clk2_rowclk_real                        (),
        .pld_tx_dll_lock_req_real                       (pld_tx_dll_lock_req[7]),
        .pld_tx_fifo_ready_real                         (pld_tx_fifo_ready[7]),
        .pld_tx_fabric_data_in_real                     (tx_parallel_ptp_data_aib7[79:0]),
        .pld_tx_fabric_fifo_empty_real                  (),
        .pld_tx_fabric_fifo_full_real                   (),
        .pld_tx_fabric_fifo_latency_pulse_real          (),
        .pld_tx_fabric_fifo_pempty_real                 (),
        .pld_tx_fabric_fifo_pfull_real                  (),
        .pld_tx_fifo_latency_adj_en_real                (),
        .pld_tx_hssi_align_done_real                    (),
        .pld_tx_hssi_fifo_empty_real                    (),
        .pld_tx_hssi_fifo_full_real                     (),
        .pld_tx_hssi_fifo_latency_pulse_real            (),
        .pld_tx_ssr_reserved_in_real                    (),
        .pld_tx_ssr_reserved_out_real                   (),
        .pld_txelecidle_real                            (),
        .adapt_tx_data_link                             (adapt_tx_ptp_link[0]),
        .avmm1_link                                     (avmm1_ptp_link[0])
    );

    bb_f_aib
    #(
        // .location                            ("AIB6"),
        .silicon_rev                            ("10nm8agdrb"),
    	.aib_hssi_tx_transfer_clk_hz            ("830078125"),
		.aib_hssi_rx_transfer_clk_hz            ("830078125"),
		// .aib_tx_user_clk_hz                  (bb_f_aib_tx_user_clk_hz), // PTP=0 or do not set
		// .aib_rx_user_clk_hz                  (bb_f_aib_rx_user_clk_hz), // PTP=0 or do not set
        .aibadapt_tx_loopback_mode              ("AIBADAPT_TX_LOOPBACK_DISABLE"),
        .aibadapt_tx_tx_user_clk_sel            ("AIBADAPT_TX_TX_USER_CLK_EHIP"),
        .aibadapt_rx_rx_user_clk_sel            ("AIBADAPT_RX_RX_USER_CLK_EHIP"),
        .aibadapt_tx_sup_mode                   ("AIBADAPT_TX_USER_MODE"),
        .aibadapt_rx_rx_datapath_tb_sel         ("AIBADAPT_RX_PCS_CHNL_TB")
    )
    x_bb_f_aib_ch6
    (
        .ip_data_link                           (/*no-link-needed-for-ptp*/),
        .aib_rx_data_link                       (aib_rx_ptp_link[1]),
        .aib_tx_data_link                       (aib_tx_ptp_link[1]),
        .avmm1_link                             (avmm1_ptp_link[1])
    );

    bb_m_aib_rx
    #(
        // .location                       ("MAIB6")
       .silicon_rev                         ("10nm8agdrb")
    )
    x_bb_m_aib_rx_ch6
    (
        .aib_rx_data_link                   (aib_rx_ptp_link[1]),
        .adapt_rx_data_link                 (adapt_rx_ptp_link[1]),
        .avmm1_link                         (avmm1_ptp_link[1])
    );

    bb_m_aib_tx
    #(
        // .location                       ("MAIB6"),
        .silicon_rev                        ("10nm8agdrb"),
        .sup_mode                           ("USER_MODE")
    )
    x_bb_m_aib_tx_ch6
    (
        .aib_tx_data_link                   (aib_tx_ptp_link[1]),
        .adapt_tx_data_link                 (adapt_tx_ptp_link[1]),
        .avmm1_link                         (avmm1_ptp_link[1])
    );

    bb_m_hdpldadapt_rx
    #(
        // .location                                       ("MAIB6"),
        .silicon_rev                            ("10nm8agdrb"),
        .hdpldadapt_pld_rx_clk1_dcm_hz          ("415039062"),
        .hdpldadapt_speed_grade                 ("HDPLDADAPT_DASH_2"       ),
        .pld_clk1_sel                           ("PLD_CLK1_DCM"                 ),
        .fifo_mode                              ("PHASE_COMP"),
        .fifo_width                             ("FIFO_DOUBLE_WIDTH")
    )
    x_bb_m_hdpldadapt_rx_ch6
    (
        .ptp_slave_link                                 (),                 // Left open, this is not in a ETH data-path IP
        .ptp_master_link                                (ptp_link),         // Connects to AIB7 and the ETH data-path AIB ptp_slave_link
        .ptp_pairing_link                               (),                 // Left open, this is not AIB7 in a PTP IP
        .placement_virtual                              (),                 // Left open, this is not in a ETH data-path IP
        .pld_10g_krfec_rx_blk_lock_real                 (),
        .pld_10g_krfec_rx_clr_errblk_cnt_real           (),
        .pld_10g_krfec_rx_diag_data_status_real         (),
        .pld_10g_krfec_rx_frame_real                    (),
        .pld_10g_rx_clr_ber_count_real                  (),
        .pld_10g_rx_crc32_err_real                      (),
        .pld_10g_rx_frame_lock_real                     (),
        .pld_10g_rx_hi_ber_real                         (),
        .pld_8g_a1a2_k1k2_flag_real                     (),
        .pld_8g_a1a2_size_real                          (),
        .pld_8g_bitloc_rev_en_real                      (),
        .pld_8g_byte_rev_en_real                        (),
        .pld_8g_eidleinfersel_real                      (),
        .pld_8g_empty_rmf_real                          (),
        .pld_8g_encdt_real                              (),
        .pld_8g_full_rmf_real                           (),
        .pld_8g_rxelecidle_real                         (),
        .pld_8g_signal_detect_out_real                  (), 
        .pld_8g_wa_boundary_real                        (),
        .pld_adapter_rx_pld_rst_n_real                  (pld_adapter_rx_pld_rst_n[6]),
        .pld_aib_fabric_rx_dll_lock_real                (pld_aib_fabric_rx_dll_lock[6]),
        .pld_aib_fabric_rx_dll_lock_req_real            (),
        .pld_aib_hssi_rx_dcd_cal_done_real              (pld_aib_fabric_rx_dcd_cal_done[6]),
        .pld_rx_fifo_ready_real                         (pld_rx_fifo_ready[6]),
        .pld_aib_hssi_rx_dcd_cal_req_real               (),
        .pld_bitslip_real                               (),
        .pld_fabric_asn_dll_lock_en_real                (),
        .pld_fsr_load_real                              (),
        .pld_hssi_asn_dll_lock_en_real                  (),
        .pld_hssi_rx_transfer_en_real                   (),
        .pld_ltr_real                                   (),
        .pld_pcs_rx_clk_out1_dcm_real                   (),
        .pld_pcs_rx_clk_out1_hioint_real                (),
        .pld_pcs_rx_clk_out2_dcm_real                   (),
        .pld_pcs_rx_clk_out2_hioint_real                (),
        .pld_pcs_rx_pld_rst_n_real                      (i_rx_rst_n),
        .pld_pma_adapt_done_real                        (),
        .pld_pma_adapt_start_real                       (),
        .pld_pma_coreclkin_rowclk_real                  (),
        .pld_pma_early_eios_real                        (),
        .pld_pma_eye_monitor_real                       (),
        .pld_pma_hclk_hioint_real                       (),
        .pld_pma_internal_clk1_hioint_real              (),
        .pld_pma_internal_clk2_hioint_real              (),
        .pld_pma_ltd_b_real                             (),
        .pld_pma_pcie_sw_done_real                      (),
        .pld_pma_pcie_switch_real                       (),
        .pld_pma_pfdmode_lock_real                      (),
        .pld_pma_ppm_lock_real                          (),
        .pld_pma_reserved_in_real                       (),
        .pld_pma_reserved_out_real                      (),
        .pld_pma_rs_lpbk_b_real                         (),
        .pld_pma_rx_detect_valid_real                   (),
        .pld_pma_rx_found_real                          (),
        .pld_pma_rxpll_lock_real                        (),
        .pld_pma_rxpma_rstb_real                        (),
        .pld_pma_signal_ok_real                         (),
        .pld_pma_testbus_real                           (),
        .pld_pmaif_rxclkslip_real                       (),
        .pld_polinv_rx_real                             (),
        .pld_rx_clk1_dcm_real                           (i_clk_rx), 
        .pld_rx_clk1_rowclk_real                        (),
        .pld_rx_clk2_rowclk_real                        (),
        .pld_rx_dll_lock_req_real                       (pld_rx_dll_lock_req[6]),
        .pld_rx_fabric_align_done_real                  (),
        .pld_rx_fabric_data_out_real                    (rx_parallel_ptp_data_aib6[79:0]),
        .pld_rx_fabric_fifo_align_clr_real              (),
        .pld_rx_fabric_fifo_del_real                    (),
        .pld_rx_fabric_fifo_empty_real                  (),
        .pld_rx_fabric_fifo_full_real                   (),
        .pld_rx_fabric_fifo_insert_real                 (),
        .pld_rx_fabric_fifo_latency_pulse_real          (),
        .pld_rx_fabric_fifo_pempty_real                 (),
        .pld_rx_fabric_fifo_pfull_real                  (),
        .pld_rx_fabric_fifo_rd_en_real                  (),
        .pld_rx_fifo_latency_adj_en_real                (),
        .pld_rx_hssi_fifo_empty_real                    (),
        .pld_rx_hssi_fifo_full_real                     (),
        .pld_rx_hssi_fifo_latency_pulse_real            (),
        .pld_rx_prbs_done_real                          (),
        .pld_rx_prbs_err_real                           (),
        .pld_rx_prbs_err_clr_real                       (),
        .pld_rx_ssr_reserved_in_real                    (),
        .pld_rx_ssr_reserved_out_real                   (),
        .pld_sclk1_rowclk_real                          (),
        .pld_sclk2_rowclk_real                          (),
        .pld_ssr_load_real                              (),
        .pld_syncsm_en_real                             (),
        .pld_test_data_real                             (),
        .adapt_rx_data_link                             (adapt_rx_ptp_link[1]),
        .avmm1_link                                     (avmm1_ptp_link[1])
    );

    bb_m_hdpldadapt_tx
    #(
        // .location                                           ("MAIB6"),
        .silicon_rev                                    ("10nm8agdrb"),
        .hdpldadapt_pld_tx_clk1_dcm_hz                  ("415039062"),
        .hdpldadapt_speed_grade                         ("HDPLDADAPT_DASH_2"       ),
        .pld_clk1_sel                                   ("PLD_CLK1_DCM"                 ),
        .duplex_mode                                    ("ENABLE"),
        .fifo_mode                                      ("PHASE_COMP"),
        .fifo_width                                     ("FIFO_DOUBLE_WIDTH")
    )
    x_bb_m_hdpldadapt_tx_ch6
    (
        .hip_aib_fsr_in_real                                (),
        .hip_aib_fsr_out_real                               (),
        .hip_aib_ssr_in_real                                (),
        .hip_aib_ssr_out_real                               (),
        .pld_10g_krfec_tx_frame_real                        (),
        .pld_10g_tx_bitslip_real                            (),
        .pld_10g_tx_burst_en_real                           (),
        .pld_10g_tx_burst_en_exe_real                       (),
        .pld_10g_tx_diag_status_real                        (),
        .pld_10g_tx_wordslip_real                           (),
        .pld_8g_tx_boundary_sel_real                        (),
        .pld_adapter_tx_pld_rst_n_real                      (pld_adapter_tx_pld_rst_n[6]),
        .pld_aib_fabric_tx_dcd_cal_done_real                (pld_aib_fabric_tx_dcd_cal_done[6]),
        .pld_aib_fabric_tx_dcd_cal_req_real                 (),
        .pld_aib_hssi_tx_dcd_cal_done_real                  (),
        .pld_aib_hssi_tx_dcd_cal_req_real                   (),
        .pld_aib_hssi_tx_dll_lock_real                      (pld_aib_hssi_tx_dll_lock[6]),
        .pld_aib_hssi_tx_dll_lock_req_real                  (),
        .pld_fabric_tx_transfer_en_real                     (),
        .pld_fpll_shared_direct_async_in_real               (),
        .pld_fpll_shared_direct_async_in_dcm_real           (),
        .pld_fpll_shared_direct_async_in_rowclk_real        (),
        .pld_fpll_shared_direct_async_out_real              (),
        .pld_fpll_shared_direct_async_out_dcm_real          (),
        .pld_fpll_shared_direct_async_out_hioint_real       (),
        .pld_krfec_tx_alignment_real                        (),
        .pld_pcs_tx_clk_out1_dcm_real                       (),
        .pld_pcs_tx_clk_out1_hioint_real                    (),
        .pld_pcs_tx_clk_out2_dcm_real                       (),
        .pld_pcs_tx_clk_out2_hioint_real                    (),
        .pld_pcs_tx_pld_rst_n_real                          (),
        .pld_pma_csr_test_dis_real                          (),
        .pld_pma_fpll_clk0bad_real                          (),
        .pld_pma_fpll_clk1bad_real                          (),
        .pld_pma_fpll_clksel_real                           (),
        .pld_pma_fpll_cnt_sel_real                          (),
        .pld_pma_fpll_extswitch_real                        (),
        .pld_pma_fpll_lc_csr_test_dis_real                  (),
        .pld_pma_fpll_num_phase_shifts_real                 (),
        .pld_pma_fpll_pfden_real                            (),
        .pld_pma_fpll_phase_done_real                       (),
        .pld_pma_fpll_up_dn_lc_lf_rstn_real                 (),
        .pld_pma_nrpi_freeze_real                           (),
        .pld_pma_rx_qpi_pullup_real                         (),
        .pld_pma_tx_bitslip_real                            (),
        .pld_pma_tx_qpi_pulldn_real                         (),
        .pld_pma_tx_qpi_pullup_real                         (),
        .pld_pma_txdetectrx_real                            (),
        .pld_pma_txpma_rstb_real                            (),
        .pld_pmaif_mask_tx_pll_real                         (),
        .pld_polinv_tx_real                                 (),
        .pld_tx_clk1_dcm_real                               (i_clk_tx),
        .pld_tx_clk1_rowclk_real                            (),
        .pld_tx_clk2_dcm_real                               (i_clk_tx),
        .pld_tx_clk2_rowclk_real                            (),
        .pld_tx_dll_lock_req_real                           (pld_tx_dll_lock_req[6]),
        .pld_tx_fifo_ready_real                             (pld_tx_fifo_ready[6]),
        .pld_tx_fabric_data_in_real                         (tx_parallel_ptp_data_aib6[79:0]),
        .pld_tx_fabric_fifo_empty_real                      (),
        .pld_tx_fabric_fifo_full_real                       (),
        .pld_tx_fabric_fifo_latency_pulse_real              (),
        .pld_tx_fabric_fifo_pempty_real                     (),
        .pld_tx_fabric_fifo_pfull_real                      (),
        .pld_tx_fifo_latency_adj_en_real                    (),
        .pld_tx_hssi_align_done_real                        (),
        .pld_tx_hssi_fifo_empty_real                        (),
        .pld_tx_hssi_fifo_full_real                         (),
        .pld_tx_hssi_fifo_latency_pulse_real                (),
        .pld_tx_ssr_reserved_in_real                        (),
        .pld_tx_ssr_reserved_out_real                       (),
        .pld_txelecidle_real                                (),
        .adapt_tx_data_link                                 (adapt_tx_ptp_link[1]),
        .avmm1_link                                         (avmm1_ptp_link[1])
    );
    
    // Always instantiated
    bb_m_hdpldadapt_avmm1 
    #(
        .location                           ("MAIB7")
    )
    x_bb_f_avmm1_ch7
    (
        .pld_avmm1_busy_real                ( pld_ptp_avmm1_busy[0]),
        .pld_avmm1_clk_rowclk_real          ( pld_ptp_avmm1_clk_rowclk[0]),
        .pld_avmm1_cmdfifo_wr_full_real     ( pld_ptp_avmm1_cmdfifo_wr_full[0]),
        .pld_avmm1_cmdfifo_wr_pfull_real    ( pld_ptp_avmm1_cmdfifo_wr_pfull[0]),
        .pld_avmm1_read_real                ( pld_ptp_avmm1_read[0]),
        .pld_avmm1_readdata_real            ( pld_ptp_avmm1_readdata[0]),
        .pld_avmm1_readdatavalid_real       ( pld_ptp_avmm1_readdatavalid[0]),
        .pld_avmm1_reg_addr_real            ( pld_ptp_avmm1_reg_addr[0]),
        .pld_avmm1_request_real             ( pld_ptp_avmm1_request[0]),
        .pld_avmm1_reserved_in_real         ( pld_ptp_avmm1_reserved_in[0]),
        .pld_avmm1_reserved_out_real        ( pld_ptp_avmm1_reserved_out[0]),
        .pld_avmm1_write_real               ( pld_ptp_avmm1_write[0]),
        .pld_avmm1_writedata_real           ( pld_ptp_avmm1_writedata[0]),
        .pld_chnl_cal_done_real             ( pld_ptp_chnl_cal_done[0]),
        .pld_hssi_osc_transfer_en_real      ( pld_ptp_hssi_osc_transfer_en[0]),

        .avmm1_link                         (avmm1_ptp_link[0])
    );
    
    bb_m_hdpldadapt_avmm1 
    #(
        .location                           ("MAIB6")
    )
    x_bb_f_avmm1_ch6
    (
        .pld_avmm1_busy_real                ( pld_ptp_avmm1_busy[1]), 
        .pld_avmm1_clk_rowclk_real          ( pld_ptp_avmm1_clk_rowclk[1]),
        .pld_avmm1_cmdfifo_wr_full_real     ( pld_ptp_avmm1_cmdfifo_wr_full[1]),
        .pld_avmm1_cmdfifo_wr_pfull_real    ( pld_ptp_avmm1_cmdfifo_wr_pfull[1]),
        .pld_avmm1_read_real                ( pld_ptp_avmm1_read[1]),
        .pld_avmm1_readdata_real            ( pld_ptp_avmm1_readdata[1]),
        .pld_avmm1_readdatavalid_real       ( pld_ptp_avmm1_readdatavalid[1]),
        .pld_avmm1_reg_addr_real            ( pld_ptp_avmm1_reg_addr[1]),
        .pld_avmm1_request_real             ( pld_ptp_avmm1_request[1]),
        .pld_avmm1_reserved_in_real         ( pld_ptp_avmm1_reserved_in[1]),
        .pld_avmm1_reserved_out_real        ( pld_ptp_avmm1_reserved_out[1]),
        .pld_avmm1_write_real               ( pld_ptp_avmm1_write[1]),
        .pld_avmm1_writedata_real           ( pld_ptp_avmm1_writedata[1]),
        .pld_chnl_cal_done_real             ( pld_ptp_chnl_cal_done[1]),
        .pld_hssi_osc_transfer_en_real      ( pld_ptp_hssi_osc_transfer_en[1]),
        
        .avmm1_link                         ( avmm1_ptp_link[1])
    );
    // PTP bb - end
`endif

endmodule



