// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.3 (Release Build #f9894c94f4)
// Quartus Prime development tool and MATLAB/Simulink Interface
// 
// Legal Notice: Copyright 2023 Intel Corporation.  All rights reserved.
// Your use of  Intel Corporation's design tools,  logic functions and other
// software and  tools, and its AMPP partner logic functions, and any output
// files any  of the foregoing (including  device programming  or simulation
// files), and  any associated  documentation  or information  are expressly
// subject  to the terms and  conditions of the  Intel FPGA Software License
// Agreement, Intel MegaCore Function License Agreement, or other applicable
// license agreement,  including,  without limitation,  that your use is for
// the  sole  purpose of  programming  logic devices  manufactured by  Intel
// and  sold by Intel  or its authorized  distributors. Please refer  to the
// applicable agreement for further details.
// ---------------------------------------------------------------------------

// SystemVerilog created from ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp
// SystemVerilog created on Thu Jun 12 21:17:49 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp (
    input wire [0:0] in_1_vin_tpl,
    input wire [7:0] in_2_chin_tpl,
    input wire [28:0] in_3_real_din_tpl,
    input wire [28:0] in_3_imag_din_tpl,
    input wire [3:0] in_4_size_tpl,
    input wire [10:0] in_5_cplen_tpl,
    input wire [15:0] in_6_ifft_gain_re_tpl,
    input wire [15:0] in_7_ifft_gain_im_tpl,
    input wire [3:0] in_8_ifft_shift_tpl,
    input wire [15:0] in_9_ifft_mux_const_tpl,
    input wire [0:0] in_10_muxsel_tpl,
    output wire [0:0] out_1_vout_tpl,
    output wire [7:0] out_2_chout_tpl,
    output wire [15:0] out_3_real_dout_tpl,
    output wire [15:0] out_3_imag_dout_tpl,
    output wire [3:0] out_4_size_out_tpl,
    output wire [10:0] out_5_cplen_out_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [34:0] Scale1_imag_hcmp_x_a;
    wire [34:0] Scale1_imag_hcmp_x_b;
    logic [34:0] Scale1_imag_hcmp_x_o;
    wire [0:0] Scale1_imag_hcmp_x_n;
    wire [15:0] Scale1_imag_hconst_x_q;
    wire [34:0] Scale1_imag_lcmp_x_a;
    wire [34:0] Scale1_imag_lcmp_x_b;
    logic [34:0] Scale1_imag_lcmp_x_o;
    wire [0:0] Scale1_imag_lcmp_x_n;
    wire [15:0] Scale1_imag_lconst_x_q;
    reg [15:0] Scale1_imag_mux_x_q;
    wire [34:0] Scale1_real_hcmp_x_a;
    wire [34:0] Scale1_real_hcmp_x_b;
    logic [34:0] Scale1_real_hcmp_x_o;
    wire [0:0] Scale1_real_hcmp_x_n;
    wire [34:0] Scale1_real_lcmp_x_a;
    wire [34:0] Scale1_real_lcmp_x_b;
    logic [34:0] Scale1_real_lcmp_x_o;
    wire [0:0] Scale1_real_lcmp_x_n;
    reg [15:0] Scale1_real_mux_x_q;
    wire [15:0] Mux_1_imagZero_x_q;
    wire [0:0] Mux_imag_x_s;
    reg [30:0] Mux_imag_x_q;
    wire [0:0] Mux_real_x_s;
    reg [30:0] Mux_real_x_q;
    wire [0:0] dupName_0_Scale1_imag_x_q;
    wire [0:0] dupName_0_Scale1_real_x_q;
    wire [0:0] dupName_1_Scale1_imag_x_q;
    wire [0:0] dupName_1_Scale1_real_x_q;
    wire [15:0] Scale1_imag_sel_x_b;
    wire [15:0] Scale1_real_sel_x_b;
    wire [30:0] Mux_real_PreShift_0_q;
    wire [30:0] Mux_real_PreShift_0_qint;
    wire [30:0] Mux_imag_PreShift_0_q;
    wire [30:0] Mux_imag_PreShift_0_qint;
    wire [0:0] xMSB_uid38_Shift1_imag_x_b;
    wire [29:0] rightShiftStage0Idx1Rng1_uid40_Shift1_imag_x_b;
    wire [30:0] rightShiftStage0Idx1_uid41_Shift1_imag_x_q;
    wire [1:0] seMsb_to2_uid42_in;
    wire [1:0] seMsb_to2_uid42_b;
    wire [28:0] rightShiftStage0Idx2Rng2_uid43_Shift1_imag_x_b;
    wire [30:0] rightShiftStage0Idx2_uid44_Shift1_imag_x_q;
    wire [2:0] seMsb_to3_uid45_in;
    wire [2:0] seMsb_to3_uid45_b;
    wire [27:0] rightShiftStage0Idx3Rng3_uid46_Shift1_imag_x_b;
    wire [30:0] rightShiftStage0Idx3_uid47_Shift1_imag_x_q;
    wire [1:0] rightShiftStage0_uid49_Shift1_imag_x_s;
    reg [30:0] rightShiftStage0_uid49_Shift1_imag_x_q;
    wire [3:0] seMsb_to4_uid50_in;
    wire [3:0] seMsb_to4_uid50_b;
    wire [26:0] rightShiftStage1Idx1Rng4_uid51_Shift1_imag_x_b;
    wire [30:0] rightShiftStage1Idx1_uid52_Shift1_imag_x_q;
    wire [7:0] seMsb_to8_uid53_in;
    wire [7:0] seMsb_to8_uid53_b;
    wire [22:0] rightShiftStage1Idx2Rng8_uid54_Shift1_imag_x_b;
    wire [30:0] rightShiftStage1Idx2_uid55_Shift1_imag_x_q;
    wire [11:0] seMsb_to12_uid56_in;
    wire [11:0] seMsb_to12_uid56_b;
    wire [18:0] rightShiftStage1Idx3Rng12_uid57_Shift1_imag_x_b;
    wire [30:0] rightShiftStage1Idx3_uid58_Shift1_imag_x_q;
    wire [1:0] rightShiftStage1_uid60_Shift1_imag_x_s;
    reg [30:0] rightShiftStage1_uid60_Shift1_imag_x_q;
    wire [0:0] xMSB_uid62_Shift1_real_x_b;
    wire [29:0] rightShiftStage0Idx1Rng1_uid64_Shift1_real_x_b;
    wire [30:0] rightShiftStage0Idx1_uid65_Shift1_real_x_q;
    wire [1:0] seMsb_to2_uid66_in;
    wire [1:0] seMsb_to2_uid66_b;
    wire [28:0] rightShiftStage0Idx2Rng2_uid67_Shift1_real_x_b;
    wire [30:0] rightShiftStage0Idx2_uid68_Shift1_real_x_q;
    wire [2:0] seMsb_to3_uid69_in;
    wire [2:0] seMsb_to3_uid69_b;
    wire [27:0] rightShiftStage0Idx3Rng3_uid70_Shift1_real_x_b;
    wire [30:0] rightShiftStage0Idx3_uid71_Shift1_real_x_q;
    wire [1:0] rightShiftStage0_uid73_Shift1_real_x_s;
    reg [30:0] rightShiftStage0_uid73_Shift1_real_x_q;
    wire [3:0] seMsb_to4_uid74_in;
    wire [3:0] seMsb_to4_uid74_b;
    wire [26:0] rightShiftStage1Idx1Rng4_uid75_Shift1_real_x_b;
    wire [30:0] rightShiftStage1Idx1_uid76_Shift1_real_x_q;
    wire [7:0] seMsb_to8_uid77_in;
    wire [7:0] seMsb_to8_uid77_b;
    wire [22:0] rightShiftStage1Idx2Rng8_uid78_Shift1_real_x_b;
    wire [30:0] rightShiftStage1Idx2_uid79_Shift1_real_x_q;
    wire [11:0] seMsb_to12_uid80_in;
    wire [11:0] seMsb_to12_uid80_b;
    wire [18:0] rightShiftStage1Idx3Rng12_uid81_Shift1_real_x_b;
    wire [30:0] rightShiftStage1Idx3_uid82_Shift1_real_x_q;
    wire [1:0] rightShiftStage1_uid84_Shift1_real_x_s;
    reg [30:0] rightShiftStage1_uid84_Shift1_real_x_q;
    wire [18:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjA2_q;
    wire [16:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjB4_q;
    wire [18:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjA6_q;
    wire [16:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjB8_q;
    wire [48:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_align_1_q;
    wire [48:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_align_1_qint;
    wire [50:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_result_add_0_0_a;
    wire [50:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_result_add_0_0_b;
    logic [50:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_result_add_0_0_o;
    wire [49:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_result_add_0_0_q;
    wire [48:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_align_1_q;
    wire [48:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_align_1_qint;
    wire [49:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_result_add_0_0_a;
    wire [49:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_result_add_0_0_b;
    logic [49:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_result_add_0_0_o;
    wire [49:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_result_add_0_0_q;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_reset;
    wire [16:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_a0;
    wire [18:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_c0;
    wire [16:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_a1;
    wire [18:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_c1;
    wire [36:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_s0;
    wire [36:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_qq0;
    reg [36:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_q;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_ena0;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_ena1;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_ena2;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_reset;
    wire [12:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_a0;
    wire [16:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_c0;
    wire [12:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_a1;
    wire [16:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_c1;
    wire [30:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_s0;
    wire [30:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_qq0;
    reg [30:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_q;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_ena0;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_ena1;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_ena2;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_reset;
    wire [16:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_a0;
    wire [18:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_c0;
    wire [16:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_a1;
    wire [18:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_c1;
    wire [36:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_s0;
    wire [0:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_sna;
    wire [36:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_qq0;
    reg [36:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_q;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_ena0;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_ena1;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_ena2;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_reset;
    wire [12:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_a0;
    wire [16:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_c0;
    wire [12:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_a1;
    wire [16:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_c1;
    wire [30:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_s0;
    wire [0:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_sna;
    wire [30:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_qq0;
    reg [30:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_q;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_ena0;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_ena1;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_ena2;
    wire [1:0] Scale1_imag_rnd_x_bias_q;
    wire [32:0] Scale1_imag_rnd_x_trunc_q;
    wire [46:0] Scale1_imag_rnd_x_trunc_qint;
    wire [33:0] Scale1_imag_rnd_x_add_a;
    wire [33:0] Scale1_imag_rnd_x_add_b;
    logic [33:0] Scale1_imag_rnd_x_add_o;
    wire [33:0] Scale1_imag_rnd_x_add_q;
    wire [32:0] Scale1_imag_rnd_x_shift_q;
    wire [33:0] Scale1_imag_rnd_x_shift_qint;
    wire [32:0] Scale1_real_rnd_x_trunc_q;
    wire [46:0] Scale1_real_rnd_x_trunc_qint;
    wire [33:0] Scale1_real_rnd_x_add_a;
    wire [33:0] Scale1_real_rnd_x_add_b;
    logic [33:0] Scale1_real_rnd_x_add_o;
    wire [33:0] Scale1_real_rnd_x_add_q;
    wire [32:0] Scale1_real_rnd_x_shift_q;
    wire [33:0] Scale1_real_rnd_x_shift_qint;
    wire [1:0] rightShiftStageSel0Dto0_uid48_Shift1_imag_x_bit_select_merged_b;
    wire [1:0] rightShiftStageSel0Dto0_uid48_Shift1_imag_x_bit_select_merged_c;
    wire [17:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs1_bit_select_merged_b;
    wire [12:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs1_bit_select_merged_c;
    wire [17:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs5_bit_select_merged_b;
    wire [12:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs5_bit_select_merged_c;
    reg [32:0] redist0_Scale1_real_rnd_x_shift_q_1_q;
    reg [32:0] redist1_Scale1_real_rnd_x_trunc_q_1_q;
    reg [32:0] redist2_Scale1_imag_rnd_x_shift_q_1_q;
    reg [32:0] redist3_Scale1_imag_rnd_x_trunc_q_1_q;
    reg [30:0] redist4_Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_q_1_q;
    reg [36:0] redist5_Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_q_1_q;
    reg [30:0] redist6_Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_q_1_q;
    reg [36:0] redist7_Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_q_1_q;
    reg [15:0] redist8_Scale1_real_sel_x_b_1_q;
    reg [15:0] redist9_Scale1_imag_sel_x_b_1_q;
    reg [0:0] redist10_ChannelIn_cunroll_x_in_1_vin_tpl_9_q;
    reg [3:0] redist12_ChannelIn_cunroll_x_in_4_size_tpl_9_q;
    wire redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_reset0;
    wire [7:0] redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_ia;
    wire [2:0] redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_aa;
    wire [2:0] redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_ab;
    wire [7:0] redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_iq;
    wire [7:0] redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_q;
    wire [2:0] redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_wraddr_i = 3'b111;
    wire [2:0] redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_offset_q;
    wire [3:0] redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_rdcnt_a;
    wire [3:0] redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_rdcnt_b;
    logic [3:0] redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_rdcnt_o;
    wire [3:0] redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_rdcnt_q;
    wire redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_reset0;
    wire [10:0] redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_ia;
    wire [2:0] redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_aa;
    wire [2:0] redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_ab;
    wire [10:0] redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_iq;
    wire [10:0] redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_q;
    wire [2:0] redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_wraddr_i = 3'b111;
    wire [3:0] redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_rdcnt_a;
    wire [3:0] redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_rdcnt_b;
    logic [3:0] redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_rdcnt_o;
    wire [3:0] redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_rdcnt_q;

    import ifft_blocktostream_DUT_safe_path_ver::safe_path_ver;

    // redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_offset(CONSTANT,158)
    assign redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_offset_q = $unsigned(3'b010);

    // redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_rdcnt(ADD,163)
    assign redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_rdcnt_a = {1'b0, redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_wraddr_q};
    assign redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_rdcnt_b = {1'b0, redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_rdcnt_o <= $unsigned(redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_rdcnt_a) + $unsigned(redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_rdcnt_b);
        end
    end
    assign redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_rdcnt_q = redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_rdcnt_o[3:0];

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_wraddr(COUNTER,161)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_wraddr_i <= $unsigned(redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_wraddr_q = redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_wraddr_i[2:0];

    // redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem(DUALMEM,160)
    assign redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_ia = $unsigned(in_5_cplen_tpl);
    assign redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_aa = redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_wraddr_q;
    assign redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_ab = redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_rdcnt_q[2:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(11),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(11),
        .widthad_b(3),
        .numwords_b(8),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_aa),
        .data_a(redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_ab),
        .q_b(redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .addressstall_a(),
        .addressstall_b(),
        .byteena_a(),
        .byteena_b(),
        .eccencbypass(),
        .eccencparity(),
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_q = redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_iq[10:0];

    // redist12_ChannelIn_cunroll_x_in_4_size_tpl_9(DELAY,154)
    dspba_delay_ver #( .width(4), .depth(9), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist12_ChannelIn_cunroll_x_in_4_size_tpl_9 ( .xin(in_4_size_tpl), .xout(redist12_ChannelIn_cunroll_x_in_4_size_tpl_9_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // Scale1_imag_rnd_x_bias(CONSTANT,129)
    assign Scale1_imag_rnd_x_bias_q = $unsigned(2'b01);

    // Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjB4(BITJOIN,89)@0
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjB4_q = {GND_q, in_6_ifft_gain_re_tpl};

    // Mux_1_imagZero_x(CONSTANT,22)
    assign Mux_1_imagZero_x_q = $unsigned(16'b0000000000000000);

    // Mux_imag_PreShift_0(BITSHIFT,34)@0
    assign Mux_imag_PreShift_0_qint = { in_3_imag_din_tpl, 2'b00 };
    assign Mux_imag_PreShift_0_q = Mux_imag_PreShift_0_qint[30:0];

    // Mux_imag_x(MUX,23)@0
    assign Mux_imag_x_s = in_10_muxsel_tpl;
    always @(Mux_imag_x_s or Mux_imag_PreShift_0_q or Mux_1_imagZero_x_q)
    begin
        unique case (Mux_imag_x_s)
            1'b0 : Mux_imag_x_q = Mux_imag_PreShift_0_q;
            1'b1 : Mux_imag_x_q = {{15{Mux_1_imagZero_x_q[15]}}, Mux_1_imagZero_x_q};
            default : Mux_imag_x_q = 31'b0;
        endcase
    end

    // xMSB_uid38_Shift1_imag_x(BITSELECT,37)@0
    assign xMSB_uid38_Shift1_imag_x_b = $unsigned(Mux_imag_x_q[30:30]);

    // seMsb_to12_uid56(BITSELECT,55)@0
    assign seMsb_to12_uid56_in = $unsigned({{11{xMSB_uid38_Shift1_imag_x_b[0]}}, xMSB_uid38_Shift1_imag_x_b});
    assign seMsb_to12_uid56_b = $unsigned(seMsb_to12_uid56_in[11:0]);

    // rightShiftStage1Idx3Rng12_uid57_Shift1_imag_x(BITSELECT,56)@0
    assign rightShiftStage1Idx3Rng12_uid57_Shift1_imag_x_b = $unsigned(rightShiftStage0_uid49_Shift1_imag_x_q[30:12]);

    // rightShiftStage1Idx3_uid58_Shift1_imag_x(BITJOIN,57)@0
    assign rightShiftStage1Idx3_uid58_Shift1_imag_x_q = {seMsb_to12_uid56_b, rightShiftStage1Idx3Rng12_uid57_Shift1_imag_x_b};

    // seMsb_to8_uid53(BITSELECT,52)@0
    assign seMsb_to8_uid53_in = $unsigned({{7{xMSB_uid38_Shift1_imag_x_b[0]}}, xMSB_uid38_Shift1_imag_x_b});
    assign seMsb_to8_uid53_b = $unsigned(seMsb_to8_uid53_in[7:0]);

    // rightShiftStage1Idx2Rng8_uid54_Shift1_imag_x(BITSELECT,53)@0
    assign rightShiftStage1Idx2Rng8_uid54_Shift1_imag_x_b = $unsigned(rightShiftStage0_uid49_Shift1_imag_x_q[30:8]);

    // rightShiftStage1Idx2_uid55_Shift1_imag_x(BITJOIN,54)@0
    assign rightShiftStage1Idx2_uid55_Shift1_imag_x_q = {seMsb_to8_uid53_b, rightShiftStage1Idx2Rng8_uid54_Shift1_imag_x_b};

    // seMsb_to4_uid50(BITSELECT,49)@0
    assign seMsb_to4_uid50_in = $unsigned({{3{xMSB_uid38_Shift1_imag_x_b[0]}}, xMSB_uid38_Shift1_imag_x_b});
    assign seMsb_to4_uid50_b = $unsigned(seMsb_to4_uid50_in[3:0]);

    // rightShiftStage1Idx1Rng4_uid51_Shift1_imag_x(BITSELECT,50)@0
    assign rightShiftStage1Idx1Rng4_uid51_Shift1_imag_x_b = $unsigned(rightShiftStage0_uid49_Shift1_imag_x_q[30:4]);

    // rightShiftStage1Idx1_uid52_Shift1_imag_x(BITJOIN,51)@0
    assign rightShiftStage1Idx1_uid52_Shift1_imag_x_q = {seMsb_to4_uid50_b, rightShiftStage1Idx1Rng4_uid51_Shift1_imag_x_b};

    // seMsb_to3_uid45(BITSELECT,44)@0
    assign seMsb_to3_uid45_in = $unsigned({{2{xMSB_uid38_Shift1_imag_x_b[0]}}, xMSB_uid38_Shift1_imag_x_b});
    assign seMsb_to3_uid45_b = $unsigned(seMsb_to3_uid45_in[2:0]);

    // rightShiftStage0Idx3Rng3_uid46_Shift1_imag_x(BITSELECT,45)@0
    assign rightShiftStage0Idx3Rng3_uid46_Shift1_imag_x_b = $unsigned(Mux_imag_x_q[30:3]);

    // rightShiftStage0Idx3_uid47_Shift1_imag_x(BITJOIN,46)@0
    assign rightShiftStage0Idx3_uid47_Shift1_imag_x_q = {seMsb_to3_uid45_b, rightShiftStage0Idx3Rng3_uid46_Shift1_imag_x_b};

    // seMsb_to2_uid42(BITSELECT,41)@0
    assign seMsb_to2_uid42_in = $unsigned({{1{xMSB_uid38_Shift1_imag_x_b[0]}}, xMSB_uid38_Shift1_imag_x_b});
    assign seMsb_to2_uid42_b = $unsigned(seMsb_to2_uid42_in[1:0]);

    // rightShiftStage0Idx2Rng2_uid43_Shift1_imag_x(BITSELECT,42)@0
    assign rightShiftStage0Idx2Rng2_uid43_Shift1_imag_x_b = $unsigned(Mux_imag_x_q[30:2]);

    // rightShiftStage0Idx2_uid44_Shift1_imag_x(BITJOIN,43)@0
    assign rightShiftStage0Idx2_uid44_Shift1_imag_x_q = {seMsb_to2_uid42_b, rightShiftStage0Idx2Rng2_uid43_Shift1_imag_x_b};

    // rightShiftStage0Idx1Rng1_uid40_Shift1_imag_x(BITSELECT,39)@0
    assign rightShiftStage0Idx1Rng1_uid40_Shift1_imag_x_b = $unsigned(Mux_imag_x_q[30:1]);

    // rightShiftStage0Idx1_uid41_Shift1_imag_x(BITJOIN,40)@0
    assign rightShiftStage0Idx1_uid41_Shift1_imag_x_q = {xMSB_uid38_Shift1_imag_x_b, rightShiftStage0Idx1Rng1_uid40_Shift1_imag_x_b};

    // rightShiftStage0_uid49_Shift1_imag_x(MUX,48)@0
    assign rightShiftStage0_uid49_Shift1_imag_x_s = rightShiftStageSel0Dto0_uid48_Shift1_imag_x_bit_select_merged_b;
    always @(rightShiftStage0_uid49_Shift1_imag_x_s or Mux_imag_x_q or rightShiftStage0Idx1_uid41_Shift1_imag_x_q or rightShiftStage0Idx2_uid44_Shift1_imag_x_q or rightShiftStage0Idx3_uid47_Shift1_imag_x_q)
    begin
        unique case (rightShiftStage0_uid49_Shift1_imag_x_s)
            2'b00 : rightShiftStage0_uid49_Shift1_imag_x_q = Mux_imag_x_q;
            2'b01 : rightShiftStage0_uid49_Shift1_imag_x_q = rightShiftStage0Idx1_uid41_Shift1_imag_x_q;
            2'b10 : rightShiftStage0_uid49_Shift1_imag_x_q = rightShiftStage0Idx2_uid44_Shift1_imag_x_q;
            2'b11 : rightShiftStage0_uid49_Shift1_imag_x_q = rightShiftStage0Idx3_uid47_Shift1_imag_x_q;
            default : rightShiftStage0_uid49_Shift1_imag_x_q = 31'b0;
        endcase
    end

    // rightShiftStageSel0Dto0_uid48_Shift1_imag_x_bit_select_merged(BITSELECT,139)@0
    assign rightShiftStageSel0Dto0_uid48_Shift1_imag_x_bit_select_merged_b = in_8_ifft_shift_tpl[1:0];
    assign rightShiftStageSel0Dto0_uid48_Shift1_imag_x_bit_select_merged_c = in_8_ifft_shift_tpl[3:2];

    // rightShiftStage1_uid60_Shift1_imag_x(MUX,59)@0
    assign rightShiftStage1_uid60_Shift1_imag_x_s = rightShiftStageSel0Dto0_uid48_Shift1_imag_x_bit_select_merged_c;
    always @(rightShiftStage1_uid60_Shift1_imag_x_s or rightShiftStage0_uid49_Shift1_imag_x_q or rightShiftStage1Idx1_uid52_Shift1_imag_x_q or rightShiftStage1Idx2_uid55_Shift1_imag_x_q or rightShiftStage1Idx3_uid58_Shift1_imag_x_q)
    begin
        unique case (rightShiftStage1_uid60_Shift1_imag_x_s)
            2'b00 : rightShiftStage1_uid60_Shift1_imag_x_q = rightShiftStage0_uid49_Shift1_imag_x_q;
            2'b01 : rightShiftStage1_uid60_Shift1_imag_x_q = rightShiftStage1Idx1_uid52_Shift1_imag_x_q;
            2'b10 : rightShiftStage1_uid60_Shift1_imag_x_q = rightShiftStage1Idx2_uid55_Shift1_imag_x_q;
            2'b11 : rightShiftStage1_uid60_Shift1_imag_x_q = rightShiftStage1Idx3_uid58_Shift1_imag_x_q;
            default : rightShiftStage1_uid60_Shift1_imag_x_q = 31'b0;
        endcase
    end

    // Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs1_bit_select_merged(BITSELECT,140)@0
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs1_bit_select_merged_b = $unsigned(rightShiftStage1_uid60_Shift1_imag_x_q[17:0]);
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs1_bit_select_merged_c = $unsigned(rightShiftStage1_uid60_Shift1_imag_x_q[30:18]);

    // Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjB8(BITJOIN,93)@0
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjB8_q = {GND_q, in_7_ifft_gain_im_tpl};

    // Mux_real_PreShift_0(BITSHIFT,33)@0
    assign Mux_real_PreShift_0_qint = { in_3_real_din_tpl, 2'b00 };
    assign Mux_real_PreShift_0_q = Mux_real_PreShift_0_qint[30:0];

    // Mux_real_x(MUX,24)@0
    assign Mux_real_x_s = in_10_muxsel_tpl;
    always @(Mux_real_x_s or Mux_real_PreShift_0_q or in_9_ifft_mux_const_tpl)
    begin
        unique case (Mux_real_x_s)
            1'b0 : Mux_real_x_q = Mux_real_PreShift_0_q;
            1'b1 : Mux_real_x_q = {{15{in_9_ifft_mux_const_tpl[15]}}, in_9_ifft_mux_const_tpl};
            default : Mux_real_x_q = 31'b0;
        endcase
    end

    // xMSB_uid62_Shift1_real_x(BITSELECT,61)@0
    assign xMSB_uid62_Shift1_real_x_b = $unsigned(Mux_real_x_q[30:30]);

    // seMsb_to12_uid80(BITSELECT,79)@0
    assign seMsb_to12_uid80_in = $unsigned({{11{xMSB_uid62_Shift1_real_x_b[0]}}, xMSB_uid62_Shift1_real_x_b});
    assign seMsb_to12_uid80_b = $unsigned(seMsb_to12_uid80_in[11:0]);

    // rightShiftStage1Idx3Rng12_uid81_Shift1_real_x(BITSELECT,80)@0
    assign rightShiftStage1Idx3Rng12_uid81_Shift1_real_x_b = $unsigned(rightShiftStage0_uid73_Shift1_real_x_q[30:12]);

    // rightShiftStage1Idx3_uid82_Shift1_real_x(BITJOIN,81)@0
    assign rightShiftStage1Idx3_uid82_Shift1_real_x_q = {seMsb_to12_uid80_b, rightShiftStage1Idx3Rng12_uid81_Shift1_real_x_b};

    // seMsb_to8_uid77(BITSELECT,76)@0
    assign seMsb_to8_uid77_in = $unsigned({{7{xMSB_uid62_Shift1_real_x_b[0]}}, xMSB_uid62_Shift1_real_x_b});
    assign seMsb_to8_uid77_b = $unsigned(seMsb_to8_uid77_in[7:0]);

    // rightShiftStage1Idx2Rng8_uid78_Shift1_real_x(BITSELECT,77)@0
    assign rightShiftStage1Idx2Rng8_uid78_Shift1_real_x_b = $unsigned(rightShiftStage0_uid73_Shift1_real_x_q[30:8]);

    // rightShiftStage1Idx2_uid79_Shift1_real_x(BITJOIN,78)@0
    assign rightShiftStage1Idx2_uid79_Shift1_real_x_q = {seMsb_to8_uid77_b, rightShiftStage1Idx2Rng8_uid78_Shift1_real_x_b};

    // seMsb_to4_uid74(BITSELECT,73)@0
    assign seMsb_to4_uid74_in = $unsigned({{3{xMSB_uid62_Shift1_real_x_b[0]}}, xMSB_uid62_Shift1_real_x_b});
    assign seMsb_to4_uid74_b = $unsigned(seMsb_to4_uid74_in[3:0]);

    // rightShiftStage1Idx1Rng4_uid75_Shift1_real_x(BITSELECT,74)@0
    assign rightShiftStage1Idx1Rng4_uid75_Shift1_real_x_b = $unsigned(rightShiftStage0_uid73_Shift1_real_x_q[30:4]);

    // rightShiftStage1Idx1_uid76_Shift1_real_x(BITJOIN,75)@0
    assign rightShiftStage1Idx1_uid76_Shift1_real_x_q = {seMsb_to4_uid74_b, rightShiftStage1Idx1Rng4_uid75_Shift1_real_x_b};

    // seMsb_to3_uid69(BITSELECT,68)@0
    assign seMsb_to3_uid69_in = $unsigned({{2{xMSB_uid62_Shift1_real_x_b[0]}}, xMSB_uid62_Shift1_real_x_b});
    assign seMsb_to3_uid69_b = $unsigned(seMsb_to3_uid69_in[2:0]);

    // rightShiftStage0Idx3Rng3_uid70_Shift1_real_x(BITSELECT,69)@0
    assign rightShiftStage0Idx3Rng3_uid70_Shift1_real_x_b = $unsigned(Mux_real_x_q[30:3]);

    // rightShiftStage0Idx3_uid71_Shift1_real_x(BITJOIN,70)@0
    assign rightShiftStage0Idx3_uid71_Shift1_real_x_q = {seMsb_to3_uid69_b, rightShiftStage0Idx3Rng3_uid70_Shift1_real_x_b};

    // seMsb_to2_uid66(BITSELECT,65)@0
    assign seMsb_to2_uid66_in = $unsigned({{1{xMSB_uid62_Shift1_real_x_b[0]}}, xMSB_uid62_Shift1_real_x_b});
    assign seMsb_to2_uid66_b = $unsigned(seMsb_to2_uid66_in[1:0]);

    // rightShiftStage0Idx2Rng2_uid67_Shift1_real_x(BITSELECT,66)@0
    assign rightShiftStage0Idx2Rng2_uid67_Shift1_real_x_b = $unsigned(Mux_real_x_q[30:2]);

    // rightShiftStage0Idx2_uid68_Shift1_real_x(BITJOIN,67)@0
    assign rightShiftStage0Idx2_uid68_Shift1_real_x_q = {seMsb_to2_uid66_b, rightShiftStage0Idx2Rng2_uid67_Shift1_real_x_b};

    // rightShiftStage0Idx1Rng1_uid64_Shift1_real_x(BITSELECT,63)@0
    assign rightShiftStage0Idx1Rng1_uid64_Shift1_real_x_b = $unsigned(Mux_real_x_q[30:1]);

    // rightShiftStage0Idx1_uid65_Shift1_real_x(BITJOIN,64)@0
    assign rightShiftStage0Idx1_uid65_Shift1_real_x_q = {xMSB_uid62_Shift1_real_x_b, rightShiftStage0Idx1Rng1_uid64_Shift1_real_x_b};

    // rightShiftStage0_uid73_Shift1_real_x(MUX,72)@0
    assign rightShiftStage0_uid73_Shift1_real_x_s = rightShiftStageSel0Dto0_uid48_Shift1_imag_x_bit_select_merged_b;
    always @(rightShiftStage0_uid73_Shift1_real_x_s or Mux_real_x_q or rightShiftStage0Idx1_uid65_Shift1_real_x_q or rightShiftStage0Idx2_uid68_Shift1_real_x_q or rightShiftStage0Idx3_uid71_Shift1_real_x_q)
    begin
        unique case (rightShiftStage0_uid73_Shift1_real_x_s)
            2'b00 : rightShiftStage0_uid73_Shift1_real_x_q = Mux_real_x_q;
            2'b01 : rightShiftStage0_uid73_Shift1_real_x_q = rightShiftStage0Idx1_uid65_Shift1_real_x_q;
            2'b10 : rightShiftStage0_uid73_Shift1_real_x_q = rightShiftStage0Idx2_uid68_Shift1_real_x_q;
            2'b11 : rightShiftStage0_uid73_Shift1_real_x_q = rightShiftStage0Idx3_uid71_Shift1_real_x_q;
            default : rightShiftStage0_uid73_Shift1_real_x_q = 31'b0;
        endcase
    end

    // rightShiftStage1_uid84_Shift1_real_x(MUX,83)@0
    assign rightShiftStage1_uid84_Shift1_real_x_s = rightShiftStageSel0Dto0_uid48_Shift1_imag_x_bit_select_merged_c;
    always @(rightShiftStage1_uid84_Shift1_real_x_s or rightShiftStage0_uid73_Shift1_real_x_q or rightShiftStage1Idx1_uid76_Shift1_real_x_q or rightShiftStage1Idx2_uid79_Shift1_real_x_q or rightShiftStage1Idx3_uid82_Shift1_real_x_q)
    begin
        unique case (rightShiftStage1_uid84_Shift1_real_x_s)
            2'b00 : rightShiftStage1_uid84_Shift1_real_x_q = rightShiftStage0_uid73_Shift1_real_x_q;
            2'b01 : rightShiftStage1_uid84_Shift1_real_x_q = rightShiftStage1Idx1_uid76_Shift1_real_x_q;
            2'b10 : rightShiftStage1_uid84_Shift1_real_x_q = rightShiftStage1Idx2_uid79_Shift1_real_x_q;
            2'b11 : rightShiftStage1_uid84_Shift1_real_x_q = rightShiftStage1Idx3_uid82_Shift1_real_x_q;
            default : rightShiftStage1_uid84_Shift1_real_x_q = 31'b0;
        endcase
    end

    // Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs5_bit_select_merged(BITSELECT,141)@0
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs5_bit_select_merged_b = $unsigned(rightShiftStage1_uid84_Shift1_real_x_q[17:0]);
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs5_bit_select_merged_c = $unsigned(rightShiftStage1_uid84_Shift1_real_x_q[30:18]);

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma(CHAINMULTADD,126)@0 + 5
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_reset = areset;
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_ena0 = 1'b1;
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_ena1 = Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_ena0;
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_ena2 = Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_ena0;

    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_a0 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs5_bit_select_merged_c);
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_c0 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjB8_q);
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_a1 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs1_bit_select_merged_c);
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_c1 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjB4_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("none"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(13),
        .by_clken("0"),
        .by_width(13),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(17),
        .bx_width(17),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(31)
    ) Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_DSP0 (
        .clk(clk),
        .ena({ Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_ena2, Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_ena1, Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_a1),
        .by(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_a0),
        .ax(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_c1),
        .bx(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_c0),
        .resulta(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(31), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_delay0 ( .xin(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_s0), .xout(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_q = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_qq0[30:0]);

    // redist6_Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_q_1(DELAY,148)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_q_1_q <= $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_q);
        end
    end

    // Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_align_1(BITSHIFT,102)@6
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_align_1_qint = { redist6_Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma9_cma_q_1_q, 18'b000000000000000000 };
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_align_1_q = Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_align_1_qint[48:0];

    // Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjA2(BITJOIN,87)@0
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjA2_q = {GND_q, Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs1_bit_select_merged_b};

    // Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjA6(BITJOIN,91)@0
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjA6_q = {GND_q, Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs5_bit_select_merged_b};

    // Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma(CHAINMULTADD,125)@0 + 5
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_reset = areset;
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_ena0 = 1'b1;
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_ena1 = Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_ena0;
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_ena2 = Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_ena0;

    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_a0 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjB8_q);
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_c0 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjA6_q);
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_a1 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjB4_q);
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_c1 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjA2_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("none"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(19),
        .by_clken("0"),
        .by_width(19),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(17),
        .bx_width(17),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(37)
    ) Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_DSP0 (
        .clk(clk),
        .ena({ Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_ena2, Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_ena1, Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_c1),
        .by(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_c0),
        .ax(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_a1),
        .bx(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_a0),
        .resulta(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(37), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_delay0 ( .xin(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_s0), .xout(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_q = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_qq0[36:0]);

    // redist7_Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_q_1(DELAY,149)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist7_Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_q_1_q <= $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_q);
        end
    end

    // Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_result_add_0_0(ADD,104)@6
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_result_add_0_0_a = $unsigned({14'b00000000000000, redist7_Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_ma0_cma_q_1_q});
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_result_add_0_0_b = $unsigned({{2{Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_align_1_q[48]}}, Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_align_1_q});
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_result_add_0_0_o = $unsigned($signed(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_result_add_0_0_a) + $signed(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_result_add_0_0_b));
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_result_add_0_0_q = Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_result_add_0_0_o[49:0];

    // Scale1_imag_rnd_x_trunc(BITSHIFT,130)@6
    assign Scale1_imag_rnd_x_trunc_qint = Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_sums_result_add_0_0_q[46:0];
    assign Scale1_imag_rnd_x_trunc_q = Scale1_imag_rnd_x_trunc_qint[46:14];

    // redist3_Scale1_imag_rnd_x_trunc_q_1(DELAY,145)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_Scale1_imag_rnd_x_trunc_q_1_q <= $unsigned(Scale1_imag_rnd_x_trunc_q);
        end
    end

    // Scale1_imag_rnd_x_add(ADD,131)@7
    assign Scale1_imag_rnd_x_add_a = $unsigned({{1{redist3_Scale1_imag_rnd_x_trunc_q_1_q[32]}}, redist3_Scale1_imag_rnd_x_trunc_q_1_q});
    assign Scale1_imag_rnd_x_add_b = $unsigned({{32{Scale1_imag_rnd_x_bias_q[1]}}, Scale1_imag_rnd_x_bias_q});
    assign Scale1_imag_rnd_x_add_o = $unsigned($signed(Scale1_imag_rnd_x_add_a) + $signed(Scale1_imag_rnd_x_add_b));
    assign Scale1_imag_rnd_x_add_q = Scale1_imag_rnd_x_add_o[33:0];

    // Scale1_imag_rnd_x_shift(BITSHIFT,132)@7
    assign Scale1_imag_rnd_x_shift_qint = Scale1_imag_rnd_x_add_q;
    assign Scale1_imag_rnd_x_shift_q = Scale1_imag_rnd_x_shift_qint[33:1];

    // redist2_Scale1_imag_rnd_x_shift_q_1(DELAY,144)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_Scale1_imag_rnd_x_shift_q_1_q <= $unsigned(Scale1_imag_rnd_x_shift_q);
        end
    end

    // Scale1_imag_sel_x(BITSELECT,31)@8
    assign Scale1_imag_sel_x_b = $unsigned(redist2_Scale1_imag_rnd_x_shift_q_1_q[15:0]);

    // redist9_Scale1_imag_sel_x_b_1(DELAY,151)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_Scale1_imag_sel_x_b_1_q <= $unsigned(Scale1_imag_sel_x_b);
        end
    end

    // Scale1_imag_hconst_x(CONSTANT,3)
    assign Scale1_imag_hconst_x_q = $unsigned(16'b0111111111111111);

    // Scale1_imag_hcmp_x(COMPARE,2)@8 + 1
    assign Scale1_imag_hcmp_x_a = $unsigned({{19{Scale1_imag_hconst_x_q[15]}}, Scale1_imag_hconst_x_q});
    assign Scale1_imag_hcmp_x_b = $unsigned({{2{redist2_Scale1_imag_rnd_x_shift_q_1_q[32]}}, redist2_Scale1_imag_rnd_x_shift_q_1_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Scale1_imag_hcmp_x_o <= $unsigned($signed(Scale1_imag_hcmp_x_a) - $signed(Scale1_imag_hcmp_x_b));
        end
    end
    assign Scale1_imag_hcmp_x_n[0] = ~ (Scale1_imag_hcmp_x_o[34]);

    // dupName_1_Scale1_imag_x(LOGICAL,29)@9
    assign dupName_1_Scale1_imag_x_q = ~ (Scale1_imag_hcmp_x_n);

    // Scale1_imag_lconst_x(CONSTANT,5)
    assign Scale1_imag_lconst_x_q = $unsigned(16'b1000000000000001);

    // Scale1_imag_lcmp_x(COMPARE,4)@8 + 1
    assign Scale1_imag_lcmp_x_a = $unsigned({{2{redist2_Scale1_imag_rnd_x_shift_q_1_q[32]}}, redist2_Scale1_imag_rnd_x_shift_q_1_q});
    assign Scale1_imag_lcmp_x_b = $unsigned({{19{Scale1_imag_lconst_x_q[15]}}, Scale1_imag_lconst_x_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Scale1_imag_lcmp_x_o <= $unsigned($signed(Scale1_imag_lcmp_x_a) - $signed(Scale1_imag_lcmp_x_b));
        end
    end
    assign Scale1_imag_lcmp_x_n[0] = ~ (Scale1_imag_lcmp_x_o[34]);

    // dupName_0_Scale1_imag_x(LOGICAL,27)@9
    assign dupName_0_Scale1_imag_x_q = ~ (Scale1_imag_lcmp_x_n);

    // Scale1_imag_mux_x(SELECTOR,6)@9
    always @(dupName_0_Scale1_imag_x_q or Scale1_imag_lconst_x_q or dupName_1_Scale1_imag_x_q or Scale1_imag_hconst_x_q or redist9_Scale1_imag_sel_x_b_1_q)
    begin
        Scale1_imag_mux_x_q = $unsigned(redist9_Scale1_imag_sel_x_b_1_q);
        if (dupName_1_Scale1_imag_x_q == 1'b1)
        begin
            Scale1_imag_mux_x_q = $unsigned(Scale1_imag_hconst_x_q);
        end
        if (dupName_0_Scale1_imag_x_q == 1'b1)
        begin
            Scale1_imag_mux_x_q = $unsigned(Scale1_imag_lconst_x_q);
        end
    end

    // Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma(CHAINMULTADD,128)@0 + 5
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_reset = areset;
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_ena0 = 1'b1;
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_ena1 = Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_ena0;
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_ena2 = Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_ena0;

    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_a0 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs1_bit_select_merged_c);
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_c0 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjB8_q);
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_a1 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bs5_bit_select_merged_c);
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_c1 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjB4_q);
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("none"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(13),
        .by_clken("0"),
        .by_width(13),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(17),
        .bx_width(17),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(31)
    ) Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_DSP0 (
        .clk(clk),
        .ena({ Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_ena2, Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_ena1, Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .sub(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_sna[0]),
        .negate(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_sna[0]),
        .ay(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_a1),
        .by(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_a0),
        .ax(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_c1),
        .bx(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_c0),
        .resulta(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(31), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_delay0 ( .xin(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_s0), .xout(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_q = $unsigned(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_qq0[30:0]);

    // redist4_Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_q_1(DELAY,146)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_q_1_q <= $unsigned(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_q);
        end
    end

    // Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_align_1(BITSHIFT,122)@6
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_align_1_qint = { redist4_Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma9_cma_q_1_q, 18'b000000000000000000 };
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_align_1_q = Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_align_1_qint[48:0];

    // Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma(CHAINMULTADD,127)@0 + 5
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_reset = areset;
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_ena0 = 1'b1;
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_ena1 = Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_ena0;
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_ena2 = Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_ena0;

    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_a0 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjB8_q);
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_c0 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjA2_q);
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_a1 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjB4_q);
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_c1 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_bjA6_q);
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("none"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(19),
        .by_clken("0"),
        .by_width(19),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(17),
        .bx_width(17),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(37)
    ) Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_DSP0 (
        .clk(clk),
        .ena({ Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_ena2, Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_ena1, Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .sub(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_sna[0]),
        .negate(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_sna[0]),
        .ay(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_c1),
        .by(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_c0),
        .ax(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_a1),
        .bx(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_a0),
        .resulta(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(37), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_delay0 ( .xin(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_s0), .xout(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_q = $unsigned(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_qq0[36:0]);

    // redist5_Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_q_1(DELAY,147)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_q_1_q <= $unsigned(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_q);
        end
    end

    // Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_result_add_0_0(ADD,124)@6
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_result_add_0_0_a = $unsigned({{13{redist5_Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_q_1_q[36]}}, redist5_Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_ma0_cma_q_1_q});
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_result_add_0_0_b = $unsigned({{1{Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_align_1_q[48]}}, Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_align_1_q});
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_result_add_0_0_o = $unsigned($signed(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_result_add_0_0_a) + $signed(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_result_add_0_0_b));
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_result_add_0_0_q = Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_result_add_0_0_o[49:0];

    // Scale1_real_rnd_x_trunc(BITSHIFT,135)@6
    assign Scale1_real_rnd_x_trunc_qint = Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_sums_result_add_0_0_q[46:0];
    assign Scale1_real_rnd_x_trunc_q = Scale1_real_rnd_x_trunc_qint[46:14];

    // redist1_Scale1_real_rnd_x_trunc_q_1(DELAY,143)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_Scale1_real_rnd_x_trunc_q_1_q <= $unsigned(Scale1_real_rnd_x_trunc_q);
        end
    end

    // Scale1_real_rnd_x_add(ADD,136)@7
    assign Scale1_real_rnd_x_add_a = $unsigned({{1{redist1_Scale1_real_rnd_x_trunc_q_1_q[32]}}, redist1_Scale1_real_rnd_x_trunc_q_1_q});
    assign Scale1_real_rnd_x_add_b = $unsigned({{32{Scale1_imag_rnd_x_bias_q[1]}}, Scale1_imag_rnd_x_bias_q});
    assign Scale1_real_rnd_x_add_o = $unsigned($signed(Scale1_real_rnd_x_add_a) + $signed(Scale1_real_rnd_x_add_b));
    assign Scale1_real_rnd_x_add_q = Scale1_real_rnd_x_add_o[33:0];

    // Scale1_real_rnd_x_shift(BITSHIFT,137)@7
    assign Scale1_real_rnd_x_shift_qint = Scale1_real_rnd_x_add_q;
    assign Scale1_real_rnd_x_shift_q = Scale1_real_rnd_x_shift_qint[33:1];

    // redist0_Scale1_real_rnd_x_shift_q_1(DELAY,142)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_Scale1_real_rnd_x_shift_q_1_q <= $unsigned(Scale1_real_rnd_x_shift_q);
        end
    end

    // Scale1_real_sel_x(BITSELECT,32)@8
    assign Scale1_real_sel_x_b = $unsigned(redist0_Scale1_real_rnd_x_shift_q_1_q[15:0]);

    // redist8_Scale1_real_sel_x_b_1(DELAY,150)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_Scale1_real_sel_x_b_1_q <= $unsigned(Scale1_real_sel_x_b);
        end
    end

    // Scale1_real_hcmp_x(COMPARE,8)@8 + 1
    assign Scale1_real_hcmp_x_a = $unsigned({{19{Scale1_imag_hconst_x_q[15]}}, Scale1_imag_hconst_x_q});
    assign Scale1_real_hcmp_x_b = $unsigned({{2{redist0_Scale1_real_rnd_x_shift_q_1_q[32]}}, redist0_Scale1_real_rnd_x_shift_q_1_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Scale1_real_hcmp_x_o <= $unsigned($signed(Scale1_real_hcmp_x_a) - $signed(Scale1_real_hcmp_x_b));
        end
    end
    assign Scale1_real_hcmp_x_n[0] = ~ (Scale1_real_hcmp_x_o[34]);

    // dupName_1_Scale1_real_x(LOGICAL,30)@9
    assign dupName_1_Scale1_real_x_q = ~ (Scale1_real_hcmp_x_n);

    // Scale1_real_lcmp_x(COMPARE,10)@8 + 1
    assign Scale1_real_lcmp_x_a = $unsigned({{2{redist0_Scale1_real_rnd_x_shift_q_1_q[32]}}, redist0_Scale1_real_rnd_x_shift_q_1_q});
    assign Scale1_real_lcmp_x_b = $unsigned({{19{Scale1_imag_lconst_x_q[15]}}, Scale1_imag_lconst_x_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Scale1_real_lcmp_x_o <= $unsigned($signed(Scale1_real_lcmp_x_a) - $signed(Scale1_real_lcmp_x_b));
        end
    end
    assign Scale1_real_lcmp_x_n[0] = ~ (Scale1_real_lcmp_x_o[34]);

    // dupName_0_Scale1_real_x(LOGICAL,28)@9
    assign dupName_0_Scale1_real_x_q = ~ (Scale1_real_lcmp_x_n);

    // Scale1_real_mux_x(SELECTOR,12)@9
    always @(dupName_0_Scale1_real_x_q or Scale1_imag_lconst_x_q or dupName_1_Scale1_real_x_q or Scale1_imag_hconst_x_q or redist8_Scale1_real_sel_x_b_1_q)
    begin
        Scale1_real_mux_x_q = $unsigned(redist8_Scale1_real_sel_x_b_1_q);
        if (dupName_1_Scale1_real_x_q == 1'b1)
        begin
            Scale1_real_mux_x_q = $unsigned(Scale1_imag_hconst_x_q);
        end
        if (dupName_0_Scale1_real_x_q == 1'b1)
        begin
            Scale1_real_mux_x_q = $unsigned(Scale1_imag_lconst_x_q);
        end
    end

    // redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_rdcnt(ADD,159)
    assign redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_rdcnt_a = {1'b0, redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_wraddr_q};
    assign redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_rdcnt_b = {1'b0, redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_rdcnt_o <= $unsigned(redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_rdcnt_a) + $unsigned(redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_rdcnt_b);
        end
    end
    assign redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_rdcnt_q = redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_rdcnt_o[3:0];

    // redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_wraddr(COUNTER,157)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_wraddr_i <= $unsigned(redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_wraddr_q = redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_wraddr_i[2:0];

    // redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem(DUALMEM,156)
    assign redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_ia = $unsigned(in_2_chin_tpl);
    assign redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_aa = redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_wraddr_q;
    assign redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_ab = redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_rdcnt_q[2:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(8),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(8),
        .widthad_b(3),
        .numwords_b(8),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_aa),
        .data_a(redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_ab),
        .q_b(redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .addressstall_a(),
        .addressstall_b(),
        .byteena_a(),
        .byteena_b(),
        .eccencbypass(),
        .eccencparity(),
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_q = redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_iq[7:0];

    // redist10_ChannelIn_cunroll_x_in_1_vin_tpl_9(DELAY,152)
    dspba_delay_ver #( .width(1), .depth(9), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist10_ChannelIn_cunroll_x_in_1_vin_tpl_9 ( .xin(in_1_vin_tpl), .xout(redist10_ChannelIn_cunroll_x_in_1_vin_tpl_9_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ChannelOut_cunroll_x(PORTOUT,15)@9 + 1
    assign out_1_vout_tpl = redist10_ChannelIn_cunroll_x_in_1_vin_tpl_9_q;
    assign out_2_chout_tpl = redist11_ChannelIn_cunroll_x_in_2_chin_tpl_9_mem_q;
    assign out_3_real_dout_tpl = Scale1_real_mux_x_q;
    assign out_3_imag_dout_tpl = Scale1_imag_mux_x_q;
    assign out_4_size_out_tpl = redist12_ChannelIn_cunroll_x_in_4_size_tpl_9_q;
    assign out_5_cplen_out_tpl = redist13_ChannelIn_cunroll_x_in_5_cplen_tpl_9_mem_q;

endmodule
