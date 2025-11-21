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

// SystemVerilog created from prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv
// SystemVerilog created on Wed Nov  6 19:28:32 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv (
    input wire [0:0] in_1_vin_tpl,
    input wire [7:0] in_2_chin_tpl,
    input wire [15:0] in_3_real_din_tpl,
    input wire [15:0] in_3_imag_din_tpl,
    input wire [3:0] in_4_FFTSize_tpl,
    input wire [0:0] in_5_SOP_tpl,
    input wire [7:0] in_6_BWby10_tpl,
    input wire [28:0] in_7_TimeReference_tpl,
    output wire [0:0] out_1_vout_tpl,
    output wire [7:0] out_2_cout_tpl,
    output wire [3:0] out_3_qFFTSize_tpl,
    output wire [15:0] out_4_real_q_tpl,
    output wire [15:0] out_4_imag_q_tpl,
    output wire [7:0] out_5_qBWby10_tpl,
    output wire [28:0] out_6_Tref_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [7:0] Convert3_sel_x_b;
    wire [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_BitCombine1_x_q;
    wire [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Const3_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Not_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_latch_0L_Mux_x_s;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_latch_0L_Mux_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And1_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And2_x_q;
    wire [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitCombine1_x_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitExtract_x_b;
    wire [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const8_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Not_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Or_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_BitReverse_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Const2_x_q;
    wire [4:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_x_a;
    wire [4:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_x_b;
    logic [4:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_x_o;
    wire [4:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_s;
    reg [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_s;
    reg [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert5_sel_x_b;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_running;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_pending;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v;
    reg [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q0;
    reg [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_e0;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_f0;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_l0;
    reg [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q1;
    reg [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_e1;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_f1;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_l1;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_imag_x_s;
    reg [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_imag_x_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_real_x_s;
    reg [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_real_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_0_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_1_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_2_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_3_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_0_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_1_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_2_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_3_x_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_0_x_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_1_x_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_2_x_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_3_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x_b;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert2_sel_x_b;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_running;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_pending;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_v;
    reg [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q0;
    reg [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e0;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_f0;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_l0;
    reg [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q1;
    reg [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e1;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_f1;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_l1;
    reg [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q2;
    reg [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e2;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_f2;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_l2;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_PostCast_primWireOut_sel_x_b;
    wire [11:0] cz_uid88_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q;
    wire [2:0] leftShiftStage0Idx3Pad3_uid96_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q;
    wire [1:0] leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_s;
    reg [12:0] leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q;
    wire [3:0] leftShiftStage1Idx1Pad4_uid101_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q;
    wire [8:0] leftShiftStage1Idx1Rng4_uid102_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_in;
    wire [8:0] leftShiftStage1Idx1Rng4_uid102_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_b;
    wire [12:0] leftShiftStage1Idx1_uid103_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q;
    wire [7:0] leftShiftStage1Idx2Pad8_uid104_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q;
    wire [4:0] leftShiftStage1Idx2Rng8_uid105_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_in;
    wire [4:0] leftShiftStage1Idx2Rng8_uid105_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_b;
    wire [12:0] leftShiftStage1Idx2_uid106_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q;
    wire [0:0] leftShiftStage1Idx3Rng12_uid108_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_in;
    wire [0:0] leftShiftStage1Idx3Rng12_uid108_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_b;
    wire [12:0] leftShiftStage1Idx3_uid109_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q;
    wire [1:0] leftShiftStage1_uid111_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_s;
    reg [12:0] leftShiftStage1_uid111_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q;
    wire [1:0] leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_s;
    reg [12:0] leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q;
    wire [8:0] leftShiftStage1Idx1Rng4_uid129_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_in;
    wire [8:0] leftShiftStage1Idx1Rng4_uid129_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_b;
    wire [12:0] leftShiftStage1Idx1_uid130_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q;
    wire [4:0] leftShiftStage1Idx2Rng8_uid132_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_in;
    wire [4:0] leftShiftStage1Idx2Rng8_uid132_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_b;
    wire [12:0] leftShiftStage1Idx2_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q;
    wire [0:0] leftShiftStage1Idx3Rng12_uid135_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_in;
    wire [0:0] leftShiftStage1Idx3Rng12_uid135_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_b;
    wire [12:0] leftShiftStage1Idx3_uid136_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q;
    wire [1:0] leftShiftStage1_uid138_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_s;
    reg [12:0] leftShiftStage1_uid138_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q;
    wire [10:0] rightShiftStage0Idx1Rng1_uid142_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b;
    wire [11:0] rightShiftStage0Idx1_uid144_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q;
    wire [9:0] rightShiftStage0Idx2Rng2_uid145_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b;
    wire [11:0] rightShiftStage0Idx2_uid147_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q;
    wire [8:0] rightShiftStage0Idx3Rng3_uid148_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b;
    wire [11:0] rightShiftStage0Idx3_uid150_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q;
    wire [1:0] rightShiftStage0_uid152_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_s;
    reg [11:0] rightShiftStage0_uid152_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q;
    wire [7:0] rightShiftStage1Idx1Rng4_uid153_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b;
    wire [11:0] rightShiftStage1Idx1_uid155_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q;
    wire [3:0] rightShiftStage1Idx2Rng8_uid156_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b;
    wire [11:0] rightShiftStage1Idx2_uid158_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q;
    wire [1:0] rightShiftStage1_uid161_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_s;
    reg [11:0] rightShiftStage1_uid161_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q;
    wire [1:0] MemArray_0_imag_x_addrA_hi_b;
    reg [0:0] MemArray_0_imag_x_csA0_h;
    reg [0:0] MemArray_0_imag_x_csA0_e;
    wire [0:0] MemArray_0_imag_x_csA0_c;
    reg [0:0] MemArray_0_imag_x_csA1_h;
    reg [0:0] MemArray_0_imag_x_csA1_e;
    wire [0:0] MemArray_0_imag_x_csA1_c;
    reg [0:0] MemArray_0_imag_x_csA2_h;
    reg [0:0] MemArray_0_imag_x_csA2_e;
    wire [0:0] MemArray_0_imag_x_csA2_c;
    reg [0:0] MemArray_0_imag_x_csA3_h;
    reg [0:0] MemArray_0_imag_x_csA3_e;
    wire [0:0] MemArray_0_imag_x_csA3_c;
    wire [10:0] MemArray_0_imag_x_addrA_lo_in;
    wire [10:0] MemArray_0_imag_x_addrA_lo_b;
    wire [1:0] MemArray_0_imag_x_addrB_hi_b;
    reg [0:0] MemArray_0_imag_x_csB0_h;
    reg [0:0] MemArray_0_imag_x_csB1_h;
    reg [0:0] MemArray_0_imag_x_csB2_h;
    reg [0:0] MemArray_0_imag_x_csB3_h;
    wire [10:0] MemArray_0_imag_x_addrB_lo_in;
    wire [10:0] MemArray_0_imag_x_addrB_lo_b;
    wire MemArray_0_imag_x_part0_reset0;
    wire MemArray_0_imag_x_part0_ena_NotRstA;
    wire [15:0] MemArray_0_imag_x_part0_ia;
    wire [10:0] MemArray_0_imag_x_part0_aa;
    wire [10:0] MemArray_0_imag_x_part0_ab;
    wire [15:0] MemArray_0_imag_x_part0_iq;
    wire [15:0] MemArray_0_imag_x_part0_q;
    wire MemArray_0_imag_x_part1_reset0;
    wire MemArray_0_imag_x_part1_ena_NotRstA;
    wire [15:0] MemArray_0_imag_x_part1_ia;
    wire [10:0] MemArray_0_imag_x_part1_aa;
    wire [10:0] MemArray_0_imag_x_part1_ab;
    wire [15:0] MemArray_0_imag_x_part1_iq;
    wire [15:0] MemArray_0_imag_x_part1_q;
    wire MemArray_0_imag_x_part2_reset0;
    wire MemArray_0_imag_x_part2_ena_NotRstA;
    wire [15:0] MemArray_0_imag_x_part2_ia;
    wire [10:0] MemArray_0_imag_x_part2_aa;
    wire [10:0] MemArray_0_imag_x_part2_ab;
    wire [15:0] MemArray_0_imag_x_part2_iq;
    wire [15:0] MemArray_0_imag_x_part2_q;
    wire MemArray_0_imag_x_part3_reset0;
    wire MemArray_0_imag_x_part3_ena_NotRstA;
    wire [15:0] MemArray_0_imag_x_part3_ia;
    wire [10:0] MemArray_0_imag_x_part3_aa;
    wire [10:0] MemArray_0_imag_x_part3_ab;
    wire [15:0] MemArray_0_imag_x_part3_iq;
    wire [15:0] MemArray_0_imag_x_part3_q;
    wire [15:0] MemArray_0_imag_x_qB_l0_or0_q;
    reg [0:0] MemArray_0_real_x_csA0_h;
    reg [0:0] MemArray_0_real_x_csA0_e;
    wire [0:0] MemArray_0_real_x_csA0_c;
    reg [0:0] MemArray_0_real_x_csA1_h;
    reg [0:0] MemArray_0_real_x_csA1_e;
    wire [0:0] MemArray_0_real_x_csA1_c;
    reg [0:0] MemArray_0_real_x_csA2_h;
    reg [0:0] MemArray_0_real_x_csA2_e;
    wire [0:0] MemArray_0_real_x_csA2_c;
    reg [0:0] MemArray_0_real_x_csA3_h;
    reg [0:0] MemArray_0_real_x_csA3_e;
    wire [0:0] MemArray_0_real_x_csA3_c;
    reg [0:0] MemArray_0_real_x_csB0_h;
    reg [0:0] MemArray_0_real_x_csB1_h;
    reg [0:0] MemArray_0_real_x_csB2_h;
    reg [0:0] MemArray_0_real_x_csB3_h;
    wire MemArray_0_real_x_part0_reset0;
    wire MemArray_0_real_x_part0_ena_NotRstA;
    wire [15:0] MemArray_0_real_x_part0_ia;
    wire [10:0] MemArray_0_real_x_part0_aa;
    wire [10:0] MemArray_0_real_x_part0_ab;
    wire [15:0] MemArray_0_real_x_part0_iq;
    wire [15:0] MemArray_0_real_x_part0_q;
    wire MemArray_0_real_x_part1_reset0;
    wire MemArray_0_real_x_part1_ena_NotRstA;
    wire [15:0] MemArray_0_real_x_part1_ia;
    wire [10:0] MemArray_0_real_x_part1_aa;
    wire [10:0] MemArray_0_real_x_part1_ab;
    wire [15:0] MemArray_0_real_x_part1_iq;
    wire [15:0] MemArray_0_real_x_part1_q;
    wire MemArray_0_real_x_part2_reset0;
    wire MemArray_0_real_x_part2_ena_NotRstA;
    wire [15:0] MemArray_0_real_x_part2_ia;
    wire [10:0] MemArray_0_real_x_part2_aa;
    wire [10:0] MemArray_0_real_x_part2_ab;
    wire [15:0] MemArray_0_real_x_part2_iq;
    wire [15:0] MemArray_0_real_x_part2_q;
    wire MemArray_0_real_x_part3_reset0;
    wire MemArray_0_real_x_part3_ena_NotRstA;
    wire [15:0] MemArray_0_real_x_part3_ia;
    wire [10:0] MemArray_0_real_x_part3_aa;
    wire [10:0] MemArray_0_real_x_part3_ab;
    wire [15:0] MemArray_0_real_x_part3_iq;
    wire [15:0] MemArray_0_real_x_part3_q;
    wire [15:0] MemArray_0_real_x_qB_l0_or0_q;
    reg [0:0] MemArray_1_imag_x_csA0_h;
    reg [0:0] MemArray_1_imag_x_csA0_e;
    wire [0:0] MemArray_1_imag_x_csA0_c;
    reg [0:0] MemArray_1_imag_x_csA1_h;
    reg [0:0] MemArray_1_imag_x_csA1_e;
    wire [0:0] MemArray_1_imag_x_csA1_c;
    reg [0:0] MemArray_1_imag_x_csA2_h;
    reg [0:0] MemArray_1_imag_x_csA2_e;
    wire [0:0] MemArray_1_imag_x_csA2_c;
    reg [0:0] MemArray_1_imag_x_csA3_h;
    reg [0:0] MemArray_1_imag_x_csA3_e;
    wire [0:0] MemArray_1_imag_x_csA3_c;
    reg [0:0] MemArray_1_imag_x_csB0_h;
    reg [0:0] MemArray_1_imag_x_csB1_h;
    reg [0:0] MemArray_1_imag_x_csB2_h;
    reg [0:0] MemArray_1_imag_x_csB3_h;
    wire MemArray_1_imag_x_part0_reset0;
    wire MemArray_1_imag_x_part0_ena_NotRstA;
    wire [15:0] MemArray_1_imag_x_part0_ia;
    wire [10:0] MemArray_1_imag_x_part0_aa;
    wire [10:0] MemArray_1_imag_x_part0_ab;
    wire [15:0] MemArray_1_imag_x_part0_iq;
    wire [15:0] MemArray_1_imag_x_part0_q;
    wire MemArray_1_imag_x_part1_reset0;
    wire MemArray_1_imag_x_part1_ena_NotRstA;
    wire [15:0] MemArray_1_imag_x_part1_ia;
    wire [10:0] MemArray_1_imag_x_part1_aa;
    wire [10:0] MemArray_1_imag_x_part1_ab;
    wire [15:0] MemArray_1_imag_x_part1_iq;
    wire [15:0] MemArray_1_imag_x_part1_q;
    wire MemArray_1_imag_x_part2_reset0;
    wire MemArray_1_imag_x_part2_ena_NotRstA;
    wire [15:0] MemArray_1_imag_x_part2_ia;
    wire [10:0] MemArray_1_imag_x_part2_aa;
    wire [10:0] MemArray_1_imag_x_part2_ab;
    wire [15:0] MemArray_1_imag_x_part2_iq;
    wire [15:0] MemArray_1_imag_x_part2_q;
    wire MemArray_1_imag_x_part3_reset0;
    wire MemArray_1_imag_x_part3_ena_NotRstA;
    wire [15:0] MemArray_1_imag_x_part3_ia;
    wire [10:0] MemArray_1_imag_x_part3_aa;
    wire [10:0] MemArray_1_imag_x_part3_ab;
    wire [15:0] MemArray_1_imag_x_part3_iq;
    wire [15:0] MemArray_1_imag_x_part3_q;
    wire [15:0] MemArray_1_imag_x_qB_l0_or0_q;
    reg [0:0] MemArray_1_real_x_csA0_h;
    reg [0:0] MemArray_1_real_x_csA0_e;
    wire [0:0] MemArray_1_real_x_csA0_c;
    reg [0:0] MemArray_1_real_x_csA1_h;
    reg [0:0] MemArray_1_real_x_csA1_e;
    wire [0:0] MemArray_1_real_x_csA1_c;
    reg [0:0] MemArray_1_real_x_csA2_h;
    reg [0:0] MemArray_1_real_x_csA2_e;
    wire [0:0] MemArray_1_real_x_csA2_c;
    reg [0:0] MemArray_1_real_x_csA3_h;
    reg [0:0] MemArray_1_real_x_csA3_e;
    wire [0:0] MemArray_1_real_x_csA3_c;
    reg [0:0] MemArray_1_real_x_csB0_h;
    reg [0:0] MemArray_1_real_x_csB1_h;
    reg [0:0] MemArray_1_real_x_csB2_h;
    reg [0:0] MemArray_1_real_x_csB3_h;
    wire MemArray_1_real_x_part0_reset0;
    wire MemArray_1_real_x_part0_ena_NotRstA;
    wire [15:0] MemArray_1_real_x_part0_ia;
    wire [10:0] MemArray_1_real_x_part0_aa;
    wire [10:0] MemArray_1_real_x_part0_ab;
    wire [15:0] MemArray_1_real_x_part0_iq;
    wire [15:0] MemArray_1_real_x_part0_q;
    wire MemArray_1_real_x_part1_reset0;
    wire MemArray_1_real_x_part1_ena_NotRstA;
    wire [15:0] MemArray_1_real_x_part1_ia;
    wire [10:0] MemArray_1_real_x_part1_aa;
    wire [10:0] MemArray_1_real_x_part1_ab;
    wire [15:0] MemArray_1_real_x_part1_iq;
    wire [15:0] MemArray_1_real_x_part1_q;
    wire MemArray_1_real_x_part2_reset0;
    wire MemArray_1_real_x_part2_ena_NotRstA;
    wire [15:0] MemArray_1_real_x_part2_ia;
    wire [10:0] MemArray_1_real_x_part2_aa;
    wire [10:0] MemArray_1_real_x_part2_ab;
    wire [15:0] MemArray_1_real_x_part2_iq;
    wire [15:0] MemArray_1_real_x_part2_q;
    wire MemArray_1_real_x_part3_reset0;
    wire MemArray_1_real_x_part3_ena_NotRstA;
    wire [15:0] MemArray_1_real_x_part3_ia;
    wire [10:0] MemArray_1_real_x_part3_aa;
    wire [10:0] MemArray_1_real_x_part3_ab;
    wire [15:0] MemArray_1_real_x_part3_iq;
    wire [15:0] MemArray_1_real_x_part3_q;
    wire [15:0] MemArray_1_real_x_qB_l0_or0_q;
    reg [0:0] MemArray_2_imag_x_csA0_h;
    reg [0:0] MemArray_2_imag_x_csA0_e;
    wire [0:0] MemArray_2_imag_x_csA0_c;
    reg [0:0] MemArray_2_imag_x_csA1_h;
    reg [0:0] MemArray_2_imag_x_csA1_e;
    wire [0:0] MemArray_2_imag_x_csA1_c;
    reg [0:0] MemArray_2_imag_x_csA2_h;
    reg [0:0] MemArray_2_imag_x_csA2_e;
    wire [0:0] MemArray_2_imag_x_csA2_c;
    reg [0:0] MemArray_2_imag_x_csA3_h;
    reg [0:0] MemArray_2_imag_x_csA3_e;
    wire [0:0] MemArray_2_imag_x_csA3_c;
    reg [0:0] MemArray_2_imag_x_csB0_h;
    reg [0:0] MemArray_2_imag_x_csB1_h;
    reg [0:0] MemArray_2_imag_x_csB2_h;
    reg [0:0] MemArray_2_imag_x_csB3_h;
    wire MemArray_2_imag_x_part0_reset0;
    wire MemArray_2_imag_x_part0_ena_NotRstA;
    wire [15:0] MemArray_2_imag_x_part0_ia;
    wire [10:0] MemArray_2_imag_x_part0_aa;
    wire [10:0] MemArray_2_imag_x_part0_ab;
    wire [15:0] MemArray_2_imag_x_part0_iq;
    wire [15:0] MemArray_2_imag_x_part0_q;
    wire MemArray_2_imag_x_part1_reset0;
    wire MemArray_2_imag_x_part1_ena_NotRstA;
    wire [15:0] MemArray_2_imag_x_part1_ia;
    wire [10:0] MemArray_2_imag_x_part1_aa;
    wire [10:0] MemArray_2_imag_x_part1_ab;
    wire [15:0] MemArray_2_imag_x_part1_iq;
    wire [15:0] MemArray_2_imag_x_part1_q;
    wire MemArray_2_imag_x_part2_reset0;
    wire MemArray_2_imag_x_part2_ena_NotRstA;
    wire [15:0] MemArray_2_imag_x_part2_ia;
    wire [10:0] MemArray_2_imag_x_part2_aa;
    wire [10:0] MemArray_2_imag_x_part2_ab;
    wire [15:0] MemArray_2_imag_x_part2_iq;
    wire [15:0] MemArray_2_imag_x_part2_q;
    wire MemArray_2_imag_x_part3_reset0;
    wire MemArray_2_imag_x_part3_ena_NotRstA;
    wire [15:0] MemArray_2_imag_x_part3_ia;
    wire [10:0] MemArray_2_imag_x_part3_aa;
    wire [10:0] MemArray_2_imag_x_part3_ab;
    wire [15:0] MemArray_2_imag_x_part3_iq;
    wire [15:0] MemArray_2_imag_x_part3_q;
    wire [15:0] MemArray_2_imag_x_qB_l0_or0_q;
    reg [0:0] MemArray_2_real_x_csA0_h;
    reg [0:0] MemArray_2_real_x_csA0_e;
    wire [0:0] MemArray_2_real_x_csA0_c;
    reg [0:0] MemArray_2_real_x_csA1_h;
    reg [0:0] MemArray_2_real_x_csA1_e;
    wire [0:0] MemArray_2_real_x_csA1_c;
    reg [0:0] MemArray_2_real_x_csA2_h;
    reg [0:0] MemArray_2_real_x_csA2_e;
    wire [0:0] MemArray_2_real_x_csA2_c;
    reg [0:0] MemArray_2_real_x_csA3_h;
    reg [0:0] MemArray_2_real_x_csA3_e;
    wire [0:0] MemArray_2_real_x_csA3_c;
    reg [0:0] MemArray_2_real_x_csB0_h;
    reg [0:0] MemArray_2_real_x_csB1_h;
    reg [0:0] MemArray_2_real_x_csB2_h;
    reg [0:0] MemArray_2_real_x_csB3_h;
    wire MemArray_2_real_x_part0_reset0;
    wire MemArray_2_real_x_part0_ena_NotRstA;
    wire [15:0] MemArray_2_real_x_part0_ia;
    wire [10:0] MemArray_2_real_x_part0_aa;
    wire [10:0] MemArray_2_real_x_part0_ab;
    wire [15:0] MemArray_2_real_x_part0_iq;
    wire [15:0] MemArray_2_real_x_part0_q;
    wire MemArray_2_real_x_part1_reset0;
    wire MemArray_2_real_x_part1_ena_NotRstA;
    wire [15:0] MemArray_2_real_x_part1_ia;
    wire [10:0] MemArray_2_real_x_part1_aa;
    wire [10:0] MemArray_2_real_x_part1_ab;
    wire [15:0] MemArray_2_real_x_part1_iq;
    wire [15:0] MemArray_2_real_x_part1_q;
    wire MemArray_2_real_x_part2_reset0;
    wire MemArray_2_real_x_part2_ena_NotRstA;
    wire [15:0] MemArray_2_real_x_part2_ia;
    wire [10:0] MemArray_2_real_x_part2_aa;
    wire [10:0] MemArray_2_real_x_part2_ab;
    wire [15:0] MemArray_2_real_x_part2_iq;
    wire [15:0] MemArray_2_real_x_part2_q;
    wire MemArray_2_real_x_part3_reset0;
    wire MemArray_2_real_x_part3_ena_NotRstA;
    wire [15:0] MemArray_2_real_x_part3_ia;
    wire [10:0] MemArray_2_real_x_part3_aa;
    wire [10:0] MemArray_2_real_x_part3_ab;
    wire [15:0] MemArray_2_real_x_part3_iq;
    wire [15:0] MemArray_2_real_x_part3_q;
    wire [15:0] MemArray_2_real_x_qB_l0_or0_q;
    reg [0:0] MemArray_3_imag_x_csA0_h;
    reg [0:0] MemArray_3_imag_x_csA0_e;
    wire [0:0] MemArray_3_imag_x_csA0_c;
    reg [0:0] MemArray_3_imag_x_csA1_h;
    reg [0:0] MemArray_3_imag_x_csA1_e;
    wire [0:0] MemArray_3_imag_x_csA1_c;
    reg [0:0] MemArray_3_imag_x_csA2_h;
    reg [0:0] MemArray_3_imag_x_csA2_e;
    wire [0:0] MemArray_3_imag_x_csA2_c;
    reg [0:0] MemArray_3_imag_x_csA3_h;
    reg [0:0] MemArray_3_imag_x_csA3_e;
    wire [0:0] MemArray_3_imag_x_csA3_c;
    reg [0:0] MemArray_3_imag_x_csB0_h;
    reg [0:0] MemArray_3_imag_x_csB1_h;
    reg [0:0] MemArray_3_imag_x_csB2_h;
    reg [0:0] MemArray_3_imag_x_csB3_h;
    wire MemArray_3_imag_x_part0_reset0;
    wire MemArray_3_imag_x_part0_ena_NotRstA;
    wire [15:0] MemArray_3_imag_x_part0_ia;
    wire [10:0] MemArray_3_imag_x_part0_aa;
    wire [10:0] MemArray_3_imag_x_part0_ab;
    wire [15:0] MemArray_3_imag_x_part0_iq;
    wire [15:0] MemArray_3_imag_x_part0_q;
    wire MemArray_3_imag_x_part1_reset0;
    wire MemArray_3_imag_x_part1_ena_NotRstA;
    wire [15:0] MemArray_3_imag_x_part1_ia;
    wire [10:0] MemArray_3_imag_x_part1_aa;
    wire [10:0] MemArray_3_imag_x_part1_ab;
    wire [15:0] MemArray_3_imag_x_part1_iq;
    wire [15:0] MemArray_3_imag_x_part1_q;
    wire MemArray_3_imag_x_part2_reset0;
    wire MemArray_3_imag_x_part2_ena_NotRstA;
    wire [15:0] MemArray_3_imag_x_part2_ia;
    wire [10:0] MemArray_3_imag_x_part2_aa;
    wire [10:0] MemArray_3_imag_x_part2_ab;
    wire [15:0] MemArray_3_imag_x_part2_iq;
    wire [15:0] MemArray_3_imag_x_part2_q;
    wire MemArray_3_imag_x_part3_reset0;
    wire MemArray_3_imag_x_part3_ena_NotRstA;
    wire [15:0] MemArray_3_imag_x_part3_ia;
    wire [10:0] MemArray_3_imag_x_part3_aa;
    wire [10:0] MemArray_3_imag_x_part3_ab;
    wire [15:0] MemArray_3_imag_x_part3_iq;
    wire [15:0] MemArray_3_imag_x_part3_q;
    wire [15:0] MemArray_3_imag_x_qB_l0_or0_q;
    reg [0:0] MemArray_3_real_x_csA0_h;
    reg [0:0] MemArray_3_real_x_csA0_e;
    wire [0:0] MemArray_3_real_x_csA0_c;
    reg [0:0] MemArray_3_real_x_csA1_h;
    reg [0:0] MemArray_3_real_x_csA1_e;
    wire [0:0] MemArray_3_real_x_csA1_c;
    reg [0:0] MemArray_3_real_x_csA2_h;
    reg [0:0] MemArray_3_real_x_csA2_e;
    wire [0:0] MemArray_3_real_x_csA2_c;
    reg [0:0] MemArray_3_real_x_csA3_h;
    reg [0:0] MemArray_3_real_x_csA3_e;
    wire [0:0] MemArray_3_real_x_csA3_c;
    reg [0:0] MemArray_3_real_x_csB0_h;
    reg [0:0] MemArray_3_real_x_csB1_h;
    reg [0:0] MemArray_3_real_x_csB2_h;
    reg [0:0] MemArray_3_real_x_csB3_h;
    wire MemArray_3_real_x_part0_reset0;
    wire MemArray_3_real_x_part0_ena_NotRstA;
    wire [15:0] MemArray_3_real_x_part0_ia;
    wire [10:0] MemArray_3_real_x_part0_aa;
    wire [10:0] MemArray_3_real_x_part0_ab;
    wire [15:0] MemArray_3_real_x_part0_iq;
    wire [15:0] MemArray_3_real_x_part0_q;
    wire MemArray_3_real_x_part1_reset0;
    wire MemArray_3_real_x_part1_ena_NotRstA;
    wire [15:0] MemArray_3_real_x_part1_ia;
    wire [10:0] MemArray_3_real_x_part1_aa;
    wire [10:0] MemArray_3_real_x_part1_ab;
    wire [15:0] MemArray_3_real_x_part1_iq;
    wire [15:0] MemArray_3_real_x_part1_q;
    wire MemArray_3_real_x_part2_reset0;
    wire MemArray_3_real_x_part2_ena_NotRstA;
    wire [15:0] MemArray_3_real_x_part2_ia;
    wire [10:0] MemArray_3_real_x_part2_aa;
    wire [10:0] MemArray_3_real_x_part2_ab;
    wire [15:0] MemArray_3_real_x_part2_iq;
    wire [15:0] MemArray_3_real_x_part2_q;
    wire MemArray_3_real_x_part3_reset0;
    wire MemArray_3_real_x_part3_ena_NotRstA;
    wire [15:0] MemArray_3_real_x_part3_ia;
    wire [10:0] MemArray_3_real_x_part3_aa;
    wire [10:0] MemArray_3_real_x_part3_ab;
    wire [15:0] MemArray_3_real_x_part3_iq;
    wire [15:0] MemArray_3_real_x_part3_q;
    wire [15:0] MemArray_3_real_x_qB_l0_or0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_imag_x_addrA_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_imag_x_addrA_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_imag_x_addrA_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_imag_x_addrA_hifan_reg3_q;
    (* preserve_syn_only *) reg [0:0] MemArray_0_imag_x_weA_fan_reg0_q;
    (* preserve_syn_only *) reg [0:0] MemArray_0_imag_x_weA_fan_reg1_q;
    (* preserve_syn_only *) reg [0:0] MemArray_0_imag_x_weA_fan_reg2_q;
    (* preserve_syn_only *) reg [0:0] MemArray_0_imag_x_weA_fan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_imag_x_addrA_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_imag_x_addrA_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_imag_x_addrA_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_imag_x_addrA_lofan_reg3_q;
    (* preserve_syn_only *) reg [15:0] MemArray_0_imag_x_dataA_lofan_reg0_q;
    (* preserve_syn_only *) reg [15:0] MemArray_0_imag_x_dataA_lofan_reg1_q;
    (* preserve_syn_only *) reg [15:0] MemArray_0_imag_x_dataA_lofan_reg2_q;
    (* preserve_syn_only *) reg [15:0] MemArray_0_imag_x_dataA_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_imag_x_addrB_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_imag_x_addrB_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_imag_x_addrB_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_imag_x_addrB_hifan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_imag_x_addrB_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_imag_x_addrB_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_imag_x_addrB_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_imag_x_addrB_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_real_x_addrA_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_real_x_addrA_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_real_x_addrA_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_real_x_addrA_hifan_reg3_q;
    (* preserve_syn_only *) reg [0:0] MemArray_0_real_x_weA_fan_reg0_q;
    (* preserve_syn_only *) reg [0:0] MemArray_0_real_x_weA_fan_reg1_q;
    (* preserve_syn_only *) reg [0:0] MemArray_0_real_x_weA_fan_reg2_q;
    (* preserve_syn_only *) reg [0:0] MemArray_0_real_x_weA_fan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_real_x_addrA_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_real_x_addrA_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_real_x_addrA_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_real_x_addrA_lofan_reg3_q;
    (* preserve_syn_only *) reg [15:0] MemArray_0_real_x_dataA_lofan_reg0_q;
    (* preserve_syn_only *) reg [15:0] MemArray_0_real_x_dataA_lofan_reg1_q;
    (* preserve_syn_only *) reg [15:0] MemArray_0_real_x_dataA_lofan_reg2_q;
    (* preserve_syn_only *) reg [15:0] MemArray_0_real_x_dataA_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_real_x_addrB_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_real_x_addrB_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_real_x_addrB_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_0_real_x_addrB_hifan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_real_x_addrB_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_real_x_addrB_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_real_x_addrB_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_0_real_x_addrB_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_imag_x_addrA_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_imag_x_addrA_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_imag_x_addrA_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_imag_x_addrA_hifan_reg3_q;
    (* preserve_syn_only *) reg [0:0] MemArray_1_imag_x_weA_fan_reg0_q;
    (* preserve_syn_only *) reg [0:0] MemArray_1_imag_x_weA_fan_reg1_q;
    (* preserve_syn_only *) reg [0:0] MemArray_1_imag_x_weA_fan_reg2_q;
    (* preserve_syn_only *) reg [0:0] MemArray_1_imag_x_weA_fan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_imag_x_addrA_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_imag_x_addrA_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_imag_x_addrA_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_imag_x_addrA_lofan_reg3_q;
    (* preserve_syn_only *) reg [15:0] MemArray_1_imag_x_dataA_lofan_reg0_q;
    (* preserve_syn_only *) reg [15:0] MemArray_1_imag_x_dataA_lofan_reg1_q;
    (* preserve_syn_only *) reg [15:0] MemArray_1_imag_x_dataA_lofan_reg2_q;
    (* preserve_syn_only *) reg [15:0] MemArray_1_imag_x_dataA_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_imag_x_addrB_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_imag_x_addrB_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_imag_x_addrB_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_imag_x_addrB_hifan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_imag_x_addrB_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_imag_x_addrB_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_imag_x_addrB_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_imag_x_addrB_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_real_x_addrA_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_real_x_addrA_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_real_x_addrA_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_real_x_addrA_hifan_reg3_q;
    (* preserve_syn_only *) reg [0:0] MemArray_1_real_x_weA_fan_reg0_q;
    (* preserve_syn_only *) reg [0:0] MemArray_1_real_x_weA_fan_reg1_q;
    (* preserve_syn_only *) reg [0:0] MemArray_1_real_x_weA_fan_reg2_q;
    (* preserve_syn_only *) reg [0:0] MemArray_1_real_x_weA_fan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_real_x_addrA_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_real_x_addrA_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_real_x_addrA_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_real_x_addrA_lofan_reg3_q;
    (* preserve_syn_only *) reg [15:0] MemArray_1_real_x_dataA_lofan_reg0_q;
    (* preserve_syn_only *) reg [15:0] MemArray_1_real_x_dataA_lofan_reg1_q;
    (* preserve_syn_only *) reg [15:0] MemArray_1_real_x_dataA_lofan_reg2_q;
    (* preserve_syn_only *) reg [15:0] MemArray_1_real_x_dataA_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_real_x_addrB_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_real_x_addrB_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_real_x_addrB_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_1_real_x_addrB_hifan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_real_x_addrB_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_real_x_addrB_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_real_x_addrB_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_1_real_x_addrB_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_imag_x_addrA_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_imag_x_addrA_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_imag_x_addrA_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_imag_x_addrA_hifan_reg3_q;
    (* preserve_syn_only *) reg [0:0] MemArray_2_imag_x_weA_fan_reg0_q;
    (* preserve_syn_only *) reg [0:0] MemArray_2_imag_x_weA_fan_reg1_q;
    (* preserve_syn_only *) reg [0:0] MemArray_2_imag_x_weA_fan_reg2_q;
    (* preserve_syn_only *) reg [0:0] MemArray_2_imag_x_weA_fan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_imag_x_addrA_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_imag_x_addrA_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_imag_x_addrA_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_imag_x_addrA_lofan_reg3_q;
    (* preserve_syn_only *) reg [15:0] MemArray_2_imag_x_dataA_lofan_reg0_q;
    (* preserve_syn_only *) reg [15:0] MemArray_2_imag_x_dataA_lofan_reg1_q;
    (* preserve_syn_only *) reg [15:0] MemArray_2_imag_x_dataA_lofan_reg2_q;
    (* preserve_syn_only *) reg [15:0] MemArray_2_imag_x_dataA_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_imag_x_addrB_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_imag_x_addrB_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_imag_x_addrB_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_imag_x_addrB_hifan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_imag_x_addrB_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_imag_x_addrB_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_imag_x_addrB_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_imag_x_addrB_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_real_x_addrA_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_real_x_addrA_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_real_x_addrA_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_real_x_addrA_hifan_reg3_q;
    (* preserve_syn_only *) reg [0:0] MemArray_2_real_x_weA_fan_reg0_q;
    (* preserve_syn_only *) reg [0:0] MemArray_2_real_x_weA_fan_reg1_q;
    (* preserve_syn_only *) reg [0:0] MemArray_2_real_x_weA_fan_reg2_q;
    (* preserve_syn_only *) reg [0:0] MemArray_2_real_x_weA_fan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_real_x_addrA_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_real_x_addrA_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_real_x_addrA_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_real_x_addrA_lofan_reg3_q;
    (* preserve_syn_only *) reg [15:0] MemArray_2_real_x_dataA_lofan_reg0_q;
    (* preserve_syn_only *) reg [15:0] MemArray_2_real_x_dataA_lofan_reg1_q;
    (* preserve_syn_only *) reg [15:0] MemArray_2_real_x_dataA_lofan_reg2_q;
    (* preserve_syn_only *) reg [15:0] MemArray_2_real_x_dataA_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_real_x_addrB_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_real_x_addrB_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_real_x_addrB_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_2_real_x_addrB_hifan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_real_x_addrB_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_real_x_addrB_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_real_x_addrB_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_2_real_x_addrB_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_imag_x_addrA_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_imag_x_addrA_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_imag_x_addrA_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_imag_x_addrA_hifan_reg3_q;
    (* preserve_syn_only *) reg [0:0] MemArray_3_imag_x_weA_fan_reg0_q;
    (* preserve_syn_only *) reg [0:0] MemArray_3_imag_x_weA_fan_reg1_q;
    (* preserve_syn_only *) reg [0:0] MemArray_3_imag_x_weA_fan_reg2_q;
    (* preserve_syn_only *) reg [0:0] MemArray_3_imag_x_weA_fan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_imag_x_addrA_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_imag_x_addrA_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_imag_x_addrA_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_imag_x_addrA_lofan_reg3_q;
    (* preserve_syn_only *) reg [15:0] MemArray_3_imag_x_dataA_lofan_reg0_q;
    (* preserve_syn_only *) reg [15:0] MemArray_3_imag_x_dataA_lofan_reg1_q;
    (* preserve_syn_only *) reg [15:0] MemArray_3_imag_x_dataA_lofan_reg2_q;
    (* preserve_syn_only *) reg [15:0] MemArray_3_imag_x_dataA_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_imag_x_addrB_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_imag_x_addrB_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_imag_x_addrB_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_imag_x_addrB_hifan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_imag_x_addrB_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_imag_x_addrB_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_imag_x_addrB_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_imag_x_addrB_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_real_x_addrA_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_real_x_addrA_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_real_x_addrA_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_real_x_addrA_hifan_reg3_q;
    (* preserve_syn_only *) reg [0:0] MemArray_3_real_x_weA_fan_reg0_q;
    (* preserve_syn_only *) reg [0:0] MemArray_3_real_x_weA_fan_reg1_q;
    (* preserve_syn_only *) reg [0:0] MemArray_3_real_x_weA_fan_reg2_q;
    (* preserve_syn_only *) reg [0:0] MemArray_3_real_x_weA_fan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_real_x_addrA_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_real_x_addrA_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_real_x_addrA_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_real_x_addrA_lofan_reg3_q;
    (* preserve_syn_only *) reg [15:0] MemArray_3_real_x_dataA_lofan_reg0_q;
    (* preserve_syn_only *) reg [15:0] MemArray_3_real_x_dataA_lofan_reg1_q;
    (* preserve_syn_only *) reg [15:0] MemArray_3_real_x_dataA_lofan_reg2_q;
    (* preserve_syn_only *) reg [15:0] MemArray_3_real_x_dataA_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_real_x_addrB_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_real_x_addrB_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_real_x_addrB_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] MemArray_3_real_x_addrB_hifan_reg3_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_real_x_addrB_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_real_x_addrB_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_real_x_addrB_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] MemArray_3_real_x_addrB_lofan_reg3_q;
    wire [1:0] leftShiftStageSel0Dto0_uid126_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_bit_select_merged_b;
    wire [1:0] leftShiftStageSel0Dto0_uid126_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_bit_select_merged_c;
    wire [1:0] leftShiftStageSel0Dto0_uid99_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_bit_select_merged_b;
    wire [1:0] leftShiftStageSel0Dto0_uid99_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_bit_select_merged_c;
    wire [1:0] rightShiftStageSel0Dto0_uid151_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_bit_select_merged_b;
    wire [1:0] rightShiftStageSel0Dto0_uid151_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_bit_select_merged_c;
    wire [12:0] xPadded_uid89_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q_const_q;
    wire [12:0] leftShiftStage0Idx3_uid98_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q_const_q;
    reg [1:0] redist0_rightShiftStageSel0Dto0_uid151_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_bit_select_merged_c_1_q;
    reg [0:0] redist1_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert2_sel_x_b_1_q;
    reg [0:0] redist2_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v_4_q;
    reg [0:0] redist2_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v_4_delay_0;
    reg [0:0] redist2_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v_4_delay_1;
    reg [0:0] redist2_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v_4_delay_2;
    reg [1:0] redist3_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_3_q;
    reg [1:0] redist3_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_3_delay_0;
    reg [1:0] redist3_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_3_delay_1;
    reg [1:0] redist4_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_4_q;
    reg [3:0] redist5_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_1_q;
    reg [3:0] redist6_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_5_q;
    reg [3:0] redist6_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_5_delay_0;
    reg [3:0] redist6_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_5_delay_1;
    reg [3:0] redist6_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_5_delay_2;
    reg [3:0] redist7_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q_1_q;
    reg [1:0] redist8_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitExtract_x_b_1_q;
    reg [0:0] redist9_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And2_x_q_1_q;
    reg [0:0] redist10_ChannelIn_cunroll_x_in_1_vin_tpl_2_q;
    reg [0:0] redist10_ChannelIn_cunroll_x_in_1_vin_tpl_2_delay_0;
    reg [15:0] redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q;
    reg [15:0] redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_delay_0;
    reg [15:0] redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q;
    reg [15:0] redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_delay_0;
    wire redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_reset0;
    wire [7:0] redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_ia;
    wire [2:0] redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_aa;
    wire [2:0] redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_ab;
    wire [7:0] redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_iq;
    wire [7:0] redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_q;
    wire [2:0] redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_wraddr_i = 3'b111;
    wire [2:0] redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_offset_q;
    wire [3:0] redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_rdcnt_a;
    wire [3:0] redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_rdcnt_b;
    logic [3:0] redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_rdcnt_o;
    wire [3:0] redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_rdcnt_q;
    wire redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_reset0;
    wire [28:0] redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_ia;
    wire [2:0] redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_aa;
    wire [2:0] redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_ab;
    wire [28:0] redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_iq;
    wire [28:0] redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_q;
    wire [2:0] redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_wraddr_i = 3'b111;
    wire [3:0] redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_rdcnt_a;
    wire [3:0] redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_rdcnt_b;
    logic [3:0] redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_rdcnt_o;
    wire [3:0] redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_rdcnt_q;

    import prach_shortFormat_fftShift_prach_safe_path_ver::safe_path_ver;

    // redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_offset(CONSTANT,573)
    assign redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_offset_q = $unsigned(3'b101);

    // redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_rdcnt(ADD,578)
    assign redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_rdcnt_a = {1'b0, redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_wraddr_q};
    assign redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_rdcnt_b = {1'b0, redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_rdcnt_o <= $unsigned(redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_rdcnt_a) + $unsigned(redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_rdcnt_b);
        end
    end
    assign redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_rdcnt_q = redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_rdcnt_o[3:0];

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_wraddr(COUNTER,576)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_wraddr_i <= $unsigned(redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_wraddr_q = redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_wraddr_i[2:0];

    // redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem(DUALMEM,575)
    assign redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_ia = $unsigned(in_7_TimeReference_tpl);
    assign redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_aa = redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_wraddr_q;
    assign redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_ab = redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_rdcnt_q[2:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(29),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(29),
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
    ) redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_aa),
        .data_a(redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_ab),
        .q_b(redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_iq),
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
    assign redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_q = redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_iq[28:0];

    // redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_rdcnt(ADD,574)
    assign redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_rdcnt_a = {1'b0, redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_wraddr_q};
    assign redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_rdcnt_b = {1'b0, redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_rdcnt_o <= $unsigned(redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_rdcnt_a) + $unsigned(redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_rdcnt_b);
        end
    end
    assign redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_rdcnt_q = redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_rdcnt_o[3:0];

    // redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_wraddr(COUNTER,572)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_wraddr_i <= $unsigned(redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_wraddr_q = redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_wraddr_i[2:0];

    // redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem(DUALMEM,571)
    assign redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_ia = $unsigned(in_6_BWby10_tpl);
    assign redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_aa = redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_wraddr_q;
    assign redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_ab = redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_rdcnt_q[2:0];
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
    ) redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_aa),
        .data_a(redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_ab),
        .q_b(redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_iq),
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
    assign redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_q = redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_iq[7:0];

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Const3_x(CONSTANT,17)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Const3_x_q = $unsigned(13'b0000000000100);

    // leftShiftStage1Idx3Rng12_uid135_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x(BITSELECT,134)@0
    assign leftShiftStage1Idx3Rng12_uid135_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_in = leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q[0:0];
    assign leftShiftStage1Idx3Rng12_uid135_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_b = leftShiftStage1Idx3Rng12_uid135_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_in[0:0];

    // cz_uid88_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x(CONSTANT,87)
    assign cz_uid88_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = $unsigned(12'b000000000000);

    // leftShiftStage1Idx3_uid136_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x(BITJOIN,135)@0
    assign leftShiftStage1Idx3_uid136_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q = {leftShiftStage1Idx3Rng12_uid135_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_b, cz_uid88_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q};

    // leftShiftStage1Idx2Rng8_uid132_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x(BITSELECT,131)@0
    assign leftShiftStage1Idx2Rng8_uid132_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_in = leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q[4:0];
    assign leftShiftStage1Idx2Rng8_uid132_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_b = leftShiftStage1Idx2Rng8_uid132_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_in[4:0];

    // leftShiftStage1Idx2Pad8_uid104_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x(CONSTANT,103)
    assign leftShiftStage1Idx2Pad8_uid104_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = $unsigned(8'b00000000);

    // leftShiftStage1Idx2_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x(BITJOIN,132)@0
    assign leftShiftStage1Idx2_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q = {leftShiftStage1Idx2Rng8_uid132_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_b, leftShiftStage1Idx2Pad8_uid104_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q};

    // leftShiftStage1Idx1Rng4_uid129_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x(BITSELECT,128)@0
    assign leftShiftStage1Idx1Rng4_uid129_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_in = leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q[8:0];
    assign leftShiftStage1Idx1Rng4_uid129_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_b = leftShiftStage1Idx1Rng4_uid129_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_in[8:0];

    // leftShiftStage1Idx1Pad4_uid101_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x(CONSTANT,100)
    assign leftShiftStage1Idx1Pad4_uid101_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = $unsigned(4'b0000);

    // leftShiftStage1Idx1_uid130_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x(BITJOIN,129)@0
    assign leftShiftStage1Idx1_uid130_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q = {leftShiftStage1Idx1Rng4_uid129_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_b, leftShiftStage1Idx1Pad4_uid101_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q};

    // leftShiftStage0Idx3_uid98_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q_const(CONSTANT,555)
    assign leftShiftStage0Idx3_uid98_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q_const_q = $unsigned(13'b0000000001000);

    // xPadded_uid89_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q_const(CONSTANT,549)
    assign xPadded_uid89_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q_const_q = $unsigned(13'b0000000000001);

    // leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x(MUX,126)@0
    assign leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_s = leftShiftStageSel0Dto0_uid126_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_bit_select_merged_b;
    always @(leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_s or xPadded_uid89_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q_const_q or prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const8_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Const3_x_q or leftShiftStage0Idx3_uid98_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q_const_q)
    begin
        unique case (leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_s)
            2'b00 : leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q = xPadded_uid89_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q_const_q;
            2'b01 : leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const8_x_q;
            2'b10 : leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Const3_x_q;
            2'b11 : leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q = leftShiftStage0Idx3_uid98_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q_const_q;
            default : leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q = 13'b0;
        endcase
    end

    // redist7_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q_1(DELAY,563)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist7_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist7_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x(MUX,40)@0
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_s = in_5_SOP_tpl;
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_s or redist7_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q_1_q or in_4_FFTSize_tpl)
    begin
        unique case (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_s)
            1'b0 : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q = redist7_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q_1_q;
            1'b1 : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q = in_4_FFTSize_tpl;
            default : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q = 4'b0;
        endcase
    end

    // leftShiftStageSel0Dto0_uid126_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_bit_select_merged(BITSELECT,546)@0
    assign leftShiftStageSel0Dto0_uid126_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_bit_select_merged_b = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q[1:0];
    assign leftShiftStageSel0Dto0_uid126_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_bit_select_merged_c = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q[3:2];

    // leftShiftStage1_uid138_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x(MUX,137)@0
    assign leftShiftStage1_uid138_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_s = leftShiftStageSel0Dto0_uid126_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_bit_select_merged_c;
    always @(leftShiftStage1_uid138_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_s or leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q or leftShiftStage1Idx1_uid130_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q or leftShiftStage1Idx2_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q or leftShiftStage1Idx3_uid136_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q)
    begin
        unique case (leftShiftStage1_uid138_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_s)
            2'b00 : leftShiftStage1_uid138_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q = leftShiftStage0_uid127_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q;
            2'b01 : leftShiftStage1_uid138_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q = leftShiftStage1Idx1_uid130_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q;
            2'b10 : leftShiftStage1_uid138_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q = leftShiftStage1Idx2_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q;
            2'b11 : leftShiftStage1_uid138_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q = leftShiftStage1Idx3_uid136_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q;
            default : leftShiftStage1_uid138_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q = 13'b0;
        endcase
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const8_x(CONSTANT,31)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const8_x_q = $unsigned(13'b0000000000010);

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And_x(LOGICAL,24)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_l0 & prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_l1 & prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_l2;

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Or_x(LOGICAL,34)@0
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Or_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And_x_q | in_5_SOP_tpl;

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x(LOOP,74)@0 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_running <= $unsigned(1'b0);
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_pending <= $unsigned(1'b0);
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q0 <= 13'b0;
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e0 <= '1;
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q1 <= 13'b0;
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e1 <= '1;
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q2 <= 13'b0;
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e2 <= '1;
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_v <= $unsigned(1'b0);
        end
        else
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_v <= $unsigned(1'b0);
            if (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Or_x_q == 1'b1)
            begin
                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e0 <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const8_x_q) - $unsigned(13'd1);
                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q0 <= 13'b0;
                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e1 <= $unsigned(leftShiftStage1_uid138_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_LShift1_x_q) - $unsigned(13'd1);
                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q1 <= 13'b0;
                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e2 <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Const3_x_q) - $unsigned(13'd1);
                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q2 <= 13'b0;
                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_running <= $unsigned(1'b1);
                if (in_1_vin_tpl == 1'b1)
                begin
                    prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_pending <= $unsigned(1'b0);
                    prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (in_1_vin_tpl == 1'b1)
                begin
                    if (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_pending == 1'b1)
                    begin
                        prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_v <= $unsigned(1'b1);
                    end
                    else if (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_running == 1'b1)
                    begin
                        prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_v <= $unsigned(1'b1);
                        if (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q2 == prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e2)
                        begin
                            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q2 <= 13'b0;
                            if (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q1 == prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e1)
                            begin
                                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q1 <= 13'b0;
                                if (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q0 == prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e0)
                                begin
                                    prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q0 <= 13'b0;
                                    prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_running <= $unsigned(1'b0);
                                    prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_v <= $unsigned(1'b0);
                                end
                                else
                                begin
                                    prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q0 <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q0) + $unsigned(13'd1);
                                end
                            end
                            else
                            begin
                                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q1 <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q1) + $unsigned(13'd1);
                            end
                        end
                        else
                        begin
                            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q2 <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q2) + $unsigned(13'd1);
                        end
                    end
                    prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_f2 = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q2 == 13'b0000000000000 ? 1'b1 : 1'b0);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_l2 = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q2 == prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e2 ? 1'b1 : 1'b0);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_f1 = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q1 == 13'b0000000000000 ? 1'b1 : 1'b0);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_l1 = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q1 == prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e1 ? 1'b1 : 1'b0);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_f0 = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q0 == 13'b0000000000000 ? 1'b1 : 1'b0);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_l0 = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q0 == prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_e0 ? 1'b1 : 1'b0);

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And2_x(LOGICAL,26)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And2_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_l1 & prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_l2 & prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_v;

    // redist9_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And2_x_q_1(DELAY,565)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist9_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And2_x_q_1_q <= '0;
        end
        else
        begin
            redist9_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And2_x_q_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And2_x_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_latch_0L_Mux_x(MUX,21)@2 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_latch_0L_Mux_x_s = redist9_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And2_x_q_1_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_latch_0L_Mux_x_q <= 1'b0;
        end
        else
        begin
            unique case (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_latch_0L_Mux_x_s)
                1'b0 : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_latch_0L_Mux_x_q <= prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_latch_0L_Mux_x_q;
                1'b1 : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_latch_0L_Mux_x_q <= prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Not_x_q;
                default : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_latch_0L_Mux_x_q <= 1'b0;
            endcase
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Not_x(LOGICAL,20)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Not_x_q = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_latch_0L_Mux_x_q);

    // leftShiftStage1Idx3Rng12_uid108_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x(BITSELECT,107)@1
    assign leftShiftStage1Idx3Rng12_uid108_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_in = leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q[0:0];
    assign leftShiftStage1Idx3Rng12_uid108_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_b = leftShiftStage1Idx3Rng12_uid108_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_in[0:0];

    // leftShiftStage1Idx3_uid109_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x(BITJOIN,108)@1
    assign leftShiftStage1Idx3_uid109_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = {leftShiftStage1Idx3Rng12_uid108_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_b, cz_uid88_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q};

    // leftShiftStage1Idx2Rng8_uid105_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x(BITSELECT,104)@1
    assign leftShiftStage1Idx2Rng8_uid105_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_in = leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q[4:0];
    assign leftShiftStage1Idx2Rng8_uid105_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_b = leftShiftStage1Idx2Rng8_uid105_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_in[4:0];

    // leftShiftStage1Idx2_uid106_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x(BITJOIN,105)@1
    assign leftShiftStage1Idx2_uid106_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = {leftShiftStage1Idx2Rng8_uid105_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_b, leftShiftStage1Idx2Pad8_uid104_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q};

    // leftShiftStage1Idx1Rng4_uid102_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x(BITSELECT,101)@1
    assign leftShiftStage1Idx1Rng4_uid102_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_in = leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q[8:0];
    assign leftShiftStage1Idx1Rng4_uid102_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_b = leftShiftStage1Idx1Rng4_uid102_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_in[8:0];

    // leftShiftStage1Idx1_uid103_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x(BITJOIN,102)@1
    assign leftShiftStage1Idx1_uid103_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = {leftShiftStage1Idx1Rng4_uid102_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_b, leftShiftStage1Idx1Pad4_uid101_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q};

    // leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x(MUX,99)@1
    assign leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_s = leftShiftStageSel0Dto0_uid99_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_bit_select_merged_b;
    always @(leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_s or xPadded_uid89_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q_const_q or prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const8_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Const3_x_q or leftShiftStage0Idx3_uid98_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q_const_q)
    begin
        unique case (leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_s)
            2'b00 : leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = xPadded_uid89_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q_const_q;
            2'b01 : leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const8_x_q;
            2'b10 : leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Const3_x_q;
            2'b11 : leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = leftShiftStage0Idx3_uid98_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q_const_q;
            default : leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = 13'b0;
        endcase
    end

    // redist5_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_1(DELAY,561)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist5_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist5_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Not_x(LOGICAL,33)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Not_x_q = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_l0);

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And1_x(LOGICAL,25)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And1_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_l2 & prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_l1 & prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Not_x_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x(MUX,42)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_s = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And1_x_q;
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_s or redist5_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_1_q or redist7_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q_1_q)
    begin
        unique case (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_s)
            1'b0 : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q = redist5_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_1_q;
            1'b1 : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q = redist7_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q_1_q;
            default : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q = 4'b0;
        endcase
    end

    // leftShiftStageSel0Dto0_uid99_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_bit_select_merged(BITSELECT,547)@1
    assign leftShiftStageSel0Dto0_uid99_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_bit_select_merged_b = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q[1:0];
    assign leftShiftStageSel0Dto0_uid99_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_bit_select_merged_c = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q[3:2];

    // leftShiftStage1_uid111_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x(MUX,110)@1
    assign leftShiftStage1_uid111_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_s = leftShiftStageSel0Dto0_uid99_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_bit_select_merged_c;
    always @(leftShiftStage1_uid111_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_s or leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q or leftShiftStage1Idx1_uid103_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q or leftShiftStage1Idx2_uid106_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q or leftShiftStage1Idx3_uid109_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q)
    begin
        unique case (leftShiftStage1_uid111_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_s)
            2'b00 : leftShiftStage1_uid111_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = leftShiftStage0_uid100_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q;
            2'b01 : leftShiftStage1_uid111_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = leftShiftStage1Idx1_uid103_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q;
            2'b10 : leftShiftStage1_uid111_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = leftShiftStage1Idx2_uid106_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q;
            2'b11 : leftShiftStage1_uid111_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = leftShiftStage1Idx3_uid109_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q;
            default : leftShiftStage1_uid111_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = 13'b0;
        endcase
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x(LOOP,57)@1 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_running <= $unsigned(1'b0);
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_pending <= $unsigned(1'b0);
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q0 <= 13'b0;
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_e0 <= '1;
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q1 <= 13'b0;
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_e1 <= '1;
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v <= $unsigned(1'b0);
        end
        else
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v <= $unsigned(1'b0);
            if (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And2_x_q == 1'b1)
            begin
                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_e0 <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Const3_x_q) - $unsigned(13'd1);
                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q0 <= 13'b0;
                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_e1 <= $unsigned(leftShiftStage1_uid111_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q) - $unsigned(13'd1);
                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q1 <= 13'b0;
                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_running <= $unsigned(1'b1);
                if (VCC_q == 1'b1)
                begin
                    prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_pending <= $unsigned(1'b0);
                    prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (VCC_q == 1'b1)
                begin
                    if (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_pending == 1'b1)
                    begin
                        prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v <= $unsigned(1'b1);
                    end
                    else if (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_running == 1'b1)
                    begin
                        prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v <= $unsigned(1'b1);
                        if (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q1 == prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_e1)
                        begin
                            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q1 <= 13'b0;
                            if (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q0 == prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_e0)
                            begin
                                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q0 <= 13'b0;
                                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_running <= $unsigned(1'b0);
                                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v <= $unsigned(1'b0);
                            end
                            else
                            begin
                                prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q0 <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q0) + $unsigned(13'd1);
                            end
                        end
                        else
                        begin
                            prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q1 <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q1) + $unsigned(13'd1);
                        end
                    end
                    prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_f1 = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q1 == 13'b0000000000000 ? 1'b1 : 1'b0);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_l1 = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q1 == prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_e1 ? 1'b1 : 1'b0);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_f0 = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q0 == 13'b0000000000000 ? 1'b1 : 1'b0);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_l0 = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q0 == prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_e0 ? 1'b1 : 1'b0);

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert5_sel_x(BITSELECT,56)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert5_sel_x_b = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q1[11:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_BitCombine1_x(BITJOIN,15)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_BitCombine1_x_q = {prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Not_x_q, prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert5_sel_x_b};

    // MemArray_0_imag_x_addrB_hi(BITSELECT,172)@2
    assign MemArray_0_imag_x_addrB_hi_b = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_BitCombine1_x_q[12:11];

    // MemArray_3_imag_x_addrB_hifan_reg3(REG,517)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrB_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_3_imag_x_csB3(LOOKUP,321)@3
    always @(MemArray_3_imag_x_addrB_hifan_reg3_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_imag_x_addrB_hifan_reg3_q)
            2'b11 : MemArray_3_imag_x_csB3_h = 1'b1;
            default : MemArray_3_imag_x_csB3_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_0_imag_x_addrB_lo(BITSELECT,178)@2
    assign MemArray_0_imag_x_addrB_lo_in = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_BitCombine1_x_q[10:0]);
    assign MemArray_0_imag_x_addrB_lo_b = $unsigned(MemArray_0_imag_x_addrB_lo_in[10:0]);

    // MemArray_3_imag_x_addrB_lofan_reg3(REG,521)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrB_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2(DELAY,568)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_delay_0 <= $unsigned(in_3_imag_din_tpl);
            redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q <= redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_delay_0;
        end
    end

    // MemArray_3_imag_x_dataA_lofan_reg3(REG,513)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_dataA_lofan_reg3_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // redist10_ChannelIn_cunroll_x_in_1_vin_tpl_2(DELAY,566)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist10_ChannelIn_cunroll_x_in_1_vin_tpl_2_delay_0 <= '0;
        end
        else
        begin
            redist10_ChannelIn_cunroll_x_in_1_vin_tpl_2_delay_0 <= $unsigned(in_1_vin_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist10_ChannelIn_cunroll_x_in_1_vin_tpl_2_q <= redist10_ChannelIn_cunroll_x_in_1_vin_tpl_2_delay_0;
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitExtract_x(BITSELECT,28)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitExtract_x_b = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q2[1:0];

    // redist8_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitExtract_x_b_1(DELAY,564)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist8_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitExtract_x_b_1_q <= '0;
        end
        else
        begin
            redist8_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitExtract_x_b_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitExtract_x_b);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_3_x(CONSTANT,71)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_3_x_q = $unsigned(2'b11);

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_3_x(LOGICAL,67)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_3_x_q = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_3_x_q == redist8_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitExtract_x_b_1_q ? 1'b1 : 1'b0);

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_3_x(LOGICAL,63)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_3_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_3_x_q & redist10_ChannelIn_cunroll_x_in_1_vin_tpl_2_q;

    // MemArray_3_imag_x_weA_fan_reg3(REG,505)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_3_imag_x_weA_fan_reg3_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_3_imag_x_weA_fan_reg3_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_3_x_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert2_sel_x(BITSELECT,73)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert2_sel_x_b = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q0[0:0];

    // redist1_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert2_sel_x_b_1(DELAY,557)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert2_sel_x_b_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert2_sel_x_b);
        end
    end

    // rightShiftStage1Idx2Rng8_uid156_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x(BITSELECT,155)@2
    assign rightShiftStage1Idx2Rng8_uid156_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b = rightShiftStage0_uid152_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q[11:8];

    // rightShiftStage1Idx2_uid158_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x(BITJOIN,157)@2
    assign rightShiftStage1Idx2_uid158_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q = {leftShiftStage1Idx2Pad8_uid104_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q, rightShiftStage1Idx2Rng8_uid156_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b};

    // rightShiftStage1Idx1Rng4_uid153_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x(BITSELECT,152)@2
    assign rightShiftStage1Idx1Rng4_uid153_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b = rightShiftStage0_uid152_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q[11:4];

    // rightShiftStage1Idx1_uid155_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x(BITJOIN,154)@2
    assign rightShiftStage1Idx1_uid155_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q = {leftShiftStage1Idx1Pad4_uid101_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q, rightShiftStage1Idx1Rng4_uid153_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b};

    // leftShiftStage0Idx3Pad3_uid96_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x(CONSTANT,95)
    assign leftShiftStage0Idx3Pad3_uid96_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q = $unsigned(3'b000);

    // rightShiftStage0Idx3Rng3_uid148_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x(BITSELECT,147)@1
    assign rightShiftStage0Idx3Rng3_uid148_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_BitReverse_x_q[11:3];

    // rightShiftStage0Idx3_uid150_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x(BITJOIN,149)@1
    assign rightShiftStage0Idx3_uid150_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q = {leftShiftStage0Idx3Pad3_uid96_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q, rightShiftStage0Idx3Rng3_uid148_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b};

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_0_x(CONSTANT,68)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_0_x_q = $unsigned(2'b00);

    // rightShiftStage0Idx2Rng2_uid145_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x(BITSELECT,144)@1
    assign rightShiftStage0Idx2Rng2_uid145_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_BitReverse_x_q[11:2];

    // rightShiftStage0Idx2_uid147_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x(BITJOIN,146)@1
    assign rightShiftStage0Idx2_uid147_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q = {prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_0_x_q, rightShiftStage0Idx2Rng2_uid145_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b};

    // rightShiftStage0Idx1Rng1_uid142_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x(BITSELECT,141)@1
    assign rightShiftStage0Idx1Rng1_uid142_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_BitReverse_x_q[11:1];

    // rightShiftStage0Idx1_uid144_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x(BITJOIN,143)@1
    assign rightShiftStage0Idx1_uid144_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q = {GND_q, rightShiftStage0Idx1Rng1_uid142_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_b};

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x(BITSELECT,72)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x_b = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_WriteOnlyLoop_vunroll_x_q1[11:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_BitReverse_x(LOGICAL,36)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_BitReverse_x_q = {prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x_b[0:0], prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x_b[1:1], prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x_b[2:2], prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x_b[3:3], prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x_b[4:4], prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x_b[5:5], prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x_b[6:6], prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x_b[7:7], prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x_b[8:8], prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x_b[9:9], prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x_b[10:10], prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert1_sel_x_b[11:11]};

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Const2_x(CONSTANT,37)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Const2_x_q = $unsigned(4'b1100);

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_x(SUB,39)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_x_a = $unsigned({1'b0, prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Const2_x_q});
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_x_b = $unsigned({1'b0, redist7_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L_Mux_x_q_1_q});
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_x_o = $unsigned($signed(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_x_a) - $signed(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_x_b));
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_x_o[4:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_PostCast_primWireOut_sel_x(BITSELECT,75)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_PostCast_primWireOut_sel_x_b = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_x_q[3:0]);

    // rightShiftStageSel0Dto0_uid151_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_bit_select_merged(BITSELECT,548)@1
    assign rightShiftStageSel0Dto0_uid151_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_bit_select_merged_b = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_PostCast_primWireOut_sel_x_b[1:0];
    assign rightShiftStageSel0Dto0_uid151_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_bit_select_merged_c = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Sub_PostCast_primWireOut_sel_x_b[3:2];

    // rightShiftStage0_uid152_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x(MUX,151)@1 + 1
    assign rightShiftStage0_uid152_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_s = rightShiftStageSel0Dto0_uid151_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_bit_select_merged_b;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (rightShiftStage0_uid152_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_s)
                2'b00 : rightShiftStage0_uid152_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q <= prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_BitReverse_x_q;
                2'b01 : rightShiftStage0_uid152_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q <= rightShiftStage0Idx1_uid144_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q;
                2'b10 : rightShiftStage0_uid152_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q <= rightShiftStage0Idx2_uid147_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q;
                2'b11 : rightShiftStage0_uid152_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q <= rightShiftStage0Idx3_uid150_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q;
                default : rightShiftStage0_uid152_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q <= 12'b0;
            endcase
        end
    end

    // redist0_rightShiftStageSel0Dto0_uid151_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_bit_select_merged_c_1(DELAY,556)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_rightShiftStageSel0Dto0_uid151_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_bit_select_merged_c_1_q <= $unsigned(rightShiftStageSel0Dto0_uid151_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_bit_select_merged_c);
        end
    end

    // rightShiftStage1_uid161_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x(MUX,160)@2
    assign rightShiftStage1_uid161_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_s = redist0_rightShiftStageSel0Dto0_uid151_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_bit_select_merged_c_1_q;
    always @(rightShiftStage1_uid161_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_s or rightShiftStage0_uid152_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q or rightShiftStage1Idx1_uid155_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q or rightShiftStage1Idx2_uid158_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q or cz_uid88_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q)
    begin
        unique case (rightShiftStage1_uid161_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_s)
            2'b00 : rightShiftStage1_uid161_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q = rightShiftStage0_uid152_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q;
            2'b01 : rightShiftStage1_uid161_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q = rightShiftStage1Idx1_uid155_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q;
            2'b10 : rightShiftStage1_uid161_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q = rightShiftStage1Idx2_uid158_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q;
            2'b11 : rightShiftStage1_uid161_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q = cz_uid88_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_LShift1_x_q;
            default : rightShiftStage1_uid161_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q = 12'b0;
        endcase
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitCombine1_x(BITJOIN,27)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitCombine1_x_q = {redist1_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Convert2_sel_x_b_1_q, rightShiftStage1_uid161_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_bitrev_Shift_x_q};

    // MemArray_0_imag_x_addrA_hi(BITSELECT,162)@2
    assign MemArray_0_imag_x_addrA_hi_b = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitCombine1_x_q[12:11];

    // MemArray_3_imag_x_addrA_hifan_reg3(REG,501)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrA_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_3_imag_x_csA3(LOOKUP,312)@3
    assign MemArray_3_imag_x_csA3_c = $unsigned(MemArray_3_imag_x_weA_fan_reg3_q);
    always @(MemArray_3_imag_x_addrA_hifan_reg3_q or MemArray_3_imag_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_imag_x_addrA_hifan_reg3_q)
            2'b11 : begin
                        MemArray_3_imag_x_csA3_h = 1'b1;
                        MemArray_3_imag_x_csA3_e = MemArray_3_imag_x_csA3_c;
                    end
            default : begin
                          MemArray_3_imag_x_csA3_h = 1'b0;
                          MemArray_3_imag_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_0_imag_x_addrA_lo(BITSELECT,169)@2
    assign MemArray_0_imag_x_addrA_lo_in = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitCombine1_x_q[10:0]);
    assign MemArray_0_imag_x_addrA_lo_b = $unsigned(MemArray_0_imag_x_addrA_lo_in[10:0]);

    // MemArray_3_imag_x_addrA_lofan_reg3(REG,509)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrA_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_3_imag_x_part3(DUALMEM,327)@3 + 2
    assign MemArray_3_imag_x_part3_ia = $unsigned(MemArray_3_imag_x_dataA_lofan_reg3_q);
    assign MemArray_3_imag_x_part3_aa = MemArray_3_imag_x_addrA_lofan_reg3_q;
    assign MemArray_3_imag_x_part3_ab = MemArray_3_imag_x_addrB_lofan_reg3_q;
    assign MemArray_3_imag_x_part3_ena_NotRstA = ~ (areset);
    assign MemArray_3_imag_x_part3_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_3_imag_x_part3_dmem (
        .clocken0(MemArray_3_imag_x_part3_ena_NotRstA),
        .sclr(MemArray_3_imag_x_part3_reset0),
        .clock0(clk),
        .address_a(MemArray_3_imag_x_part3_aa),
        .data_a(MemArray_3_imag_x_part3_ia),
        .wren_a(MemArray_3_imag_x_csA3_e[0]),
        .address_b(MemArray_3_imag_x_part3_ab),
        .q_b(MemArray_3_imag_x_part3_iq),
        .rden_b(MemArray_3_imag_x_csB3_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_3_imag_x_part3_q = MemArray_3_imag_x_part3_iq[15:0];

    // MemArray_3_imag_x_addrB_hifan_reg2(REG,516)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrB_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_3_imag_x_csB2(LOOKUP,320)@3
    always @(MemArray_3_imag_x_addrB_hifan_reg2_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_imag_x_addrB_hifan_reg2_q)
            2'b10 : MemArray_3_imag_x_csB2_h = 1'b1;
            default : MemArray_3_imag_x_csB2_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_3_imag_x_addrB_lofan_reg2(REG,520)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrB_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_3_imag_x_dataA_lofan_reg2(REG,512)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_dataA_lofan_reg2_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // MemArray_3_imag_x_weA_fan_reg2(REG,504)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_3_imag_x_weA_fan_reg2_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_3_imag_x_weA_fan_reg2_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_3_x_q);
        end
    end

    // MemArray_3_imag_x_addrA_hifan_reg2(REG,500)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrA_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_3_imag_x_csA2(LOOKUP,311)@3
    assign MemArray_3_imag_x_csA2_c = $unsigned(MemArray_3_imag_x_weA_fan_reg2_q);
    always @(MemArray_3_imag_x_addrA_hifan_reg2_q or MemArray_3_imag_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_imag_x_addrA_hifan_reg2_q)
            2'b10 : begin
                        MemArray_3_imag_x_csA2_h = 1'b1;
                        MemArray_3_imag_x_csA2_e = MemArray_3_imag_x_csA2_c;
                    end
            default : begin
                          MemArray_3_imag_x_csA2_h = 1'b0;
                          MemArray_3_imag_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_3_imag_x_addrA_lofan_reg2(REG,508)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrA_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_3_imag_x_part2(DUALMEM,326)@3 + 2
    assign MemArray_3_imag_x_part2_ia = $unsigned(MemArray_3_imag_x_dataA_lofan_reg2_q);
    assign MemArray_3_imag_x_part2_aa = MemArray_3_imag_x_addrA_lofan_reg2_q;
    assign MemArray_3_imag_x_part2_ab = MemArray_3_imag_x_addrB_lofan_reg2_q;
    assign MemArray_3_imag_x_part2_ena_NotRstA = ~ (areset);
    assign MemArray_3_imag_x_part2_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_3_imag_x_part2_dmem (
        .clocken0(MemArray_3_imag_x_part2_ena_NotRstA),
        .sclr(MemArray_3_imag_x_part2_reset0),
        .clock0(clk),
        .address_a(MemArray_3_imag_x_part2_aa),
        .data_a(MemArray_3_imag_x_part2_ia),
        .wren_a(MemArray_3_imag_x_csA2_e[0]),
        .address_b(MemArray_3_imag_x_part2_ab),
        .q_b(MemArray_3_imag_x_part2_iq),
        .rden_b(MemArray_3_imag_x_csB2_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_3_imag_x_part2_q = MemArray_3_imag_x_part2_iq[15:0];

    // MemArray_3_imag_x_addrB_hifan_reg1(REG,515)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrB_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_3_imag_x_csB1(LOOKUP,319)@3
    always @(MemArray_3_imag_x_addrB_hifan_reg1_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_imag_x_addrB_hifan_reg1_q)
            2'b01 : MemArray_3_imag_x_csB1_h = 1'b1;
            default : MemArray_3_imag_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_3_imag_x_addrB_lofan_reg1(REG,519)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrB_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_3_imag_x_dataA_lofan_reg1(REG,511)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_dataA_lofan_reg1_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // MemArray_3_imag_x_weA_fan_reg1(REG,503)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_3_imag_x_weA_fan_reg1_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_3_imag_x_weA_fan_reg1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_3_x_q);
        end
    end

    // MemArray_3_imag_x_addrA_hifan_reg1(REG,499)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrA_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_3_imag_x_csA1(LOOKUP,310)@3
    assign MemArray_3_imag_x_csA1_c = $unsigned(MemArray_3_imag_x_weA_fan_reg1_q);
    always @(MemArray_3_imag_x_addrA_hifan_reg1_q or MemArray_3_imag_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_imag_x_addrA_hifan_reg1_q)
            2'b01 : begin
                        MemArray_3_imag_x_csA1_h = 1'b1;
                        MemArray_3_imag_x_csA1_e = MemArray_3_imag_x_csA1_c;
                    end
            default : begin
                          MemArray_3_imag_x_csA1_h = 1'b0;
                          MemArray_3_imag_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_3_imag_x_addrA_lofan_reg1(REG,507)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrA_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_3_imag_x_part1(DUALMEM,325)@3 + 2
    assign MemArray_3_imag_x_part1_ia = $unsigned(MemArray_3_imag_x_dataA_lofan_reg1_q);
    assign MemArray_3_imag_x_part1_aa = MemArray_3_imag_x_addrA_lofan_reg1_q;
    assign MemArray_3_imag_x_part1_ab = MemArray_3_imag_x_addrB_lofan_reg1_q;
    assign MemArray_3_imag_x_part1_ena_NotRstA = ~ (areset);
    assign MemArray_3_imag_x_part1_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_3_imag_x_part1_dmem (
        .clocken0(MemArray_3_imag_x_part1_ena_NotRstA),
        .sclr(MemArray_3_imag_x_part1_reset0),
        .clock0(clk),
        .address_a(MemArray_3_imag_x_part1_aa),
        .data_a(MemArray_3_imag_x_part1_ia),
        .wren_a(MemArray_3_imag_x_csA1_e[0]),
        .address_b(MemArray_3_imag_x_part1_ab),
        .q_b(MemArray_3_imag_x_part1_iq),
        .rden_b(MemArray_3_imag_x_csB1_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_3_imag_x_part1_q = MemArray_3_imag_x_part1_iq[15:0];

    // MemArray_3_imag_x_addrB_hifan_reg0(REG,514)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrB_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_3_imag_x_csB0(LOOKUP,318)@3
    always @(MemArray_3_imag_x_addrB_hifan_reg0_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_imag_x_addrB_hifan_reg0_q)
            2'b00 : MemArray_3_imag_x_csB0_h = 1'b1;
            default : MemArray_3_imag_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_3_imag_x_addrB_lofan_reg0(REG,518)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrB_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_3_imag_x_dataA_lofan_reg0(REG,510)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_dataA_lofan_reg0_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // MemArray_3_imag_x_weA_fan_reg0(REG,502)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_3_imag_x_weA_fan_reg0_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_3_imag_x_weA_fan_reg0_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_3_x_q);
        end
    end

    // MemArray_3_imag_x_addrA_hifan_reg0(REG,498)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrA_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_3_imag_x_csA0(LOOKUP,309)@3
    assign MemArray_3_imag_x_csA0_c = $unsigned(MemArray_3_imag_x_weA_fan_reg0_q);
    always @(MemArray_3_imag_x_addrA_hifan_reg0_q or MemArray_3_imag_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_imag_x_addrA_hifan_reg0_q)
            2'b00 : begin
                        MemArray_3_imag_x_csA0_h = 1'b1;
                        MemArray_3_imag_x_csA0_e = MemArray_3_imag_x_csA0_c;
                    end
            default : begin
                          MemArray_3_imag_x_csA0_h = 1'b0;
                          MemArray_3_imag_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_3_imag_x_addrA_lofan_reg0(REG,506)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_imag_x_addrA_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_3_imag_x_part0(DUALMEM,324)@3 + 2
    assign MemArray_3_imag_x_part0_ia = $unsigned(MemArray_3_imag_x_dataA_lofan_reg0_q);
    assign MemArray_3_imag_x_part0_aa = MemArray_3_imag_x_addrA_lofan_reg0_q;
    assign MemArray_3_imag_x_part0_ab = MemArray_3_imag_x_addrB_lofan_reg0_q;
    assign MemArray_3_imag_x_part0_ena_NotRstA = ~ (areset);
    assign MemArray_3_imag_x_part0_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_3_imag_x_part0_dmem (
        .clocken0(MemArray_3_imag_x_part0_ena_NotRstA),
        .sclr(MemArray_3_imag_x_part0_reset0),
        .clock0(clk),
        .address_a(MemArray_3_imag_x_part0_aa),
        .data_a(MemArray_3_imag_x_part0_ia),
        .wren_a(MemArray_3_imag_x_csA0_e[0]),
        .address_b(MemArray_3_imag_x_part0_ab),
        .q_b(MemArray_3_imag_x_part0_iq),
        .rden_b(MemArray_3_imag_x_csB0_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_3_imag_x_part0_q = MemArray_3_imag_x_part0_iq[15:0];

    // MemArray_3_imag_x_qB_l0_or0(LOGICAL,329)@5
    assign MemArray_3_imag_x_qB_l0_or0_q = MemArray_3_imag_x_part0_q | MemArray_3_imag_x_part1_q | MemArray_3_imag_x_part2_q | MemArray_3_imag_x_part3_q;

    // MemArray_2_imag_x_addrB_hifan_reg3(REG,469)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrB_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_2_imag_x_csB3(LOOKUP,273)@3
    always @(MemArray_2_imag_x_addrB_hifan_reg3_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_imag_x_addrB_hifan_reg3_q)
            2'b11 : MemArray_2_imag_x_csB3_h = 1'b1;
            default : MemArray_2_imag_x_csB3_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_2_imag_x_addrB_lofan_reg3(REG,473)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrB_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_2_imag_x_dataA_lofan_reg3(REG,465)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_dataA_lofan_reg3_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_2_x(CONSTANT,70)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_2_x_q = $unsigned(2'b10);

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_2_x(LOGICAL,66)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_2_x_q = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_2_x_q == redist8_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitExtract_x_b_1_q ? 1'b1 : 1'b0);

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_2_x(LOGICAL,62)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_2_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_2_x_q & redist10_ChannelIn_cunroll_x_in_1_vin_tpl_2_q;

    // MemArray_2_imag_x_weA_fan_reg3(REG,457)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_2_imag_x_weA_fan_reg3_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_2_imag_x_weA_fan_reg3_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_2_x_q);
        end
    end

    // MemArray_2_imag_x_addrA_hifan_reg3(REG,453)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrA_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_2_imag_x_csA3(LOOKUP,264)@3
    assign MemArray_2_imag_x_csA3_c = $unsigned(MemArray_2_imag_x_weA_fan_reg3_q);
    always @(MemArray_2_imag_x_addrA_hifan_reg3_q or MemArray_2_imag_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_imag_x_addrA_hifan_reg3_q)
            2'b11 : begin
                        MemArray_2_imag_x_csA3_h = 1'b1;
                        MemArray_2_imag_x_csA3_e = MemArray_2_imag_x_csA3_c;
                    end
            default : begin
                          MemArray_2_imag_x_csA3_h = 1'b0;
                          MemArray_2_imag_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_2_imag_x_addrA_lofan_reg3(REG,461)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrA_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_2_imag_x_part3(DUALMEM,279)@3 + 2
    assign MemArray_2_imag_x_part3_ia = $unsigned(MemArray_2_imag_x_dataA_lofan_reg3_q);
    assign MemArray_2_imag_x_part3_aa = MemArray_2_imag_x_addrA_lofan_reg3_q;
    assign MemArray_2_imag_x_part3_ab = MemArray_2_imag_x_addrB_lofan_reg3_q;
    assign MemArray_2_imag_x_part3_ena_NotRstA = ~ (areset);
    assign MemArray_2_imag_x_part3_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_2_imag_x_part3_dmem (
        .clocken0(MemArray_2_imag_x_part3_ena_NotRstA),
        .sclr(MemArray_2_imag_x_part3_reset0),
        .clock0(clk),
        .address_a(MemArray_2_imag_x_part3_aa),
        .data_a(MemArray_2_imag_x_part3_ia),
        .wren_a(MemArray_2_imag_x_csA3_e[0]),
        .address_b(MemArray_2_imag_x_part3_ab),
        .q_b(MemArray_2_imag_x_part3_iq),
        .rden_b(MemArray_2_imag_x_csB3_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_2_imag_x_part3_q = MemArray_2_imag_x_part3_iq[15:0];

    // MemArray_2_imag_x_addrB_hifan_reg2(REG,468)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrB_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_2_imag_x_csB2(LOOKUP,272)@3
    always @(MemArray_2_imag_x_addrB_hifan_reg2_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_imag_x_addrB_hifan_reg2_q)
            2'b10 : MemArray_2_imag_x_csB2_h = 1'b1;
            default : MemArray_2_imag_x_csB2_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_2_imag_x_addrB_lofan_reg2(REG,472)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrB_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_2_imag_x_dataA_lofan_reg2(REG,464)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_dataA_lofan_reg2_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // MemArray_2_imag_x_weA_fan_reg2(REG,456)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_2_imag_x_weA_fan_reg2_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_2_imag_x_weA_fan_reg2_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_2_x_q);
        end
    end

    // MemArray_2_imag_x_addrA_hifan_reg2(REG,452)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrA_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_2_imag_x_csA2(LOOKUP,263)@3
    assign MemArray_2_imag_x_csA2_c = $unsigned(MemArray_2_imag_x_weA_fan_reg2_q);
    always @(MemArray_2_imag_x_addrA_hifan_reg2_q or MemArray_2_imag_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_imag_x_addrA_hifan_reg2_q)
            2'b10 : begin
                        MemArray_2_imag_x_csA2_h = 1'b1;
                        MemArray_2_imag_x_csA2_e = MemArray_2_imag_x_csA2_c;
                    end
            default : begin
                          MemArray_2_imag_x_csA2_h = 1'b0;
                          MemArray_2_imag_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_2_imag_x_addrA_lofan_reg2(REG,460)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrA_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_2_imag_x_part2(DUALMEM,278)@3 + 2
    assign MemArray_2_imag_x_part2_ia = $unsigned(MemArray_2_imag_x_dataA_lofan_reg2_q);
    assign MemArray_2_imag_x_part2_aa = MemArray_2_imag_x_addrA_lofan_reg2_q;
    assign MemArray_2_imag_x_part2_ab = MemArray_2_imag_x_addrB_lofan_reg2_q;
    assign MemArray_2_imag_x_part2_ena_NotRstA = ~ (areset);
    assign MemArray_2_imag_x_part2_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_2_imag_x_part2_dmem (
        .clocken0(MemArray_2_imag_x_part2_ena_NotRstA),
        .sclr(MemArray_2_imag_x_part2_reset0),
        .clock0(clk),
        .address_a(MemArray_2_imag_x_part2_aa),
        .data_a(MemArray_2_imag_x_part2_ia),
        .wren_a(MemArray_2_imag_x_csA2_e[0]),
        .address_b(MemArray_2_imag_x_part2_ab),
        .q_b(MemArray_2_imag_x_part2_iq),
        .rden_b(MemArray_2_imag_x_csB2_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_2_imag_x_part2_q = MemArray_2_imag_x_part2_iq[15:0];

    // MemArray_2_imag_x_addrB_hifan_reg1(REG,467)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrB_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_2_imag_x_csB1(LOOKUP,271)@3
    always @(MemArray_2_imag_x_addrB_hifan_reg1_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_imag_x_addrB_hifan_reg1_q)
            2'b01 : MemArray_2_imag_x_csB1_h = 1'b1;
            default : MemArray_2_imag_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_2_imag_x_addrB_lofan_reg1(REG,471)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrB_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_2_imag_x_dataA_lofan_reg1(REG,463)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_dataA_lofan_reg1_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // MemArray_2_imag_x_weA_fan_reg1(REG,455)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_2_imag_x_weA_fan_reg1_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_2_imag_x_weA_fan_reg1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_2_x_q);
        end
    end

    // MemArray_2_imag_x_addrA_hifan_reg1(REG,451)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrA_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_2_imag_x_csA1(LOOKUP,262)@3
    assign MemArray_2_imag_x_csA1_c = $unsigned(MemArray_2_imag_x_weA_fan_reg1_q);
    always @(MemArray_2_imag_x_addrA_hifan_reg1_q or MemArray_2_imag_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_imag_x_addrA_hifan_reg1_q)
            2'b01 : begin
                        MemArray_2_imag_x_csA1_h = 1'b1;
                        MemArray_2_imag_x_csA1_e = MemArray_2_imag_x_csA1_c;
                    end
            default : begin
                          MemArray_2_imag_x_csA1_h = 1'b0;
                          MemArray_2_imag_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_2_imag_x_addrA_lofan_reg1(REG,459)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrA_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_2_imag_x_part1(DUALMEM,277)@3 + 2
    assign MemArray_2_imag_x_part1_ia = $unsigned(MemArray_2_imag_x_dataA_lofan_reg1_q);
    assign MemArray_2_imag_x_part1_aa = MemArray_2_imag_x_addrA_lofan_reg1_q;
    assign MemArray_2_imag_x_part1_ab = MemArray_2_imag_x_addrB_lofan_reg1_q;
    assign MemArray_2_imag_x_part1_ena_NotRstA = ~ (areset);
    assign MemArray_2_imag_x_part1_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_2_imag_x_part1_dmem (
        .clocken0(MemArray_2_imag_x_part1_ena_NotRstA),
        .sclr(MemArray_2_imag_x_part1_reset0),
        .clock0(clk),
        .address_a(MemArray_2_imag_x_part1_aa),
        .data_a(MemArray_2_imag_x_part1_ia),
        .wren_a(MemArray_2_imag_x_csA1_e[0]),
        .address_b(MemArray_2_imag_x_part1_ab),
        .q_b(MemArray_2_imag_x_part1_iq),
        .rden_b(MemArray_2_imag_x_csB1_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_2_imag_x_part1_q = MemArray_2_imag_x_part1_iq[15:0];

    // MemArray_2_imag_x_addrB_hifan_reg0(REG,466)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrB_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_2_imag_x_csB0(LOOKUP,270)@3
    always @(MemArray_2_imag_x_addrB_hifan_reg0_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_imag_x_addrB_hifan_reg0_q)
            2'b00 : MemArray_2_imag_x_csB0_h = 1'b1;
            default : MemArray_2_imag_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_2_imag_x_addrB_lofan_reg0(REG,470)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrB_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_2_imag_x_dataA_lofan_reg0(REG,462)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_dataA_lofan_reg0_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // MemArray_2_imag_x_weA_fan_reg0(REG,454)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_2_imag_x_weA_fan_reg0_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_2_imag_x_weA_fan_reg0_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_2_x_q);
        end
    end

    // MemArray_2_imag_x_addrA_hifan_reg0(REG,450)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrA_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_2_imag_x_csA0(LOOKUP,261)@3
    assign MemArray_2_imag_x_csA0_c = $unsigned(MemArray_2_imag_x_weA_fan_reg0_q);
    always @(MemArray_2_imag_x_addrA_hifan_reg0_q or MemArray_2_imag_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_imag_x_addrA_hifan_reg0_q)
            2'b00 : begin
                        MemArray_2_imag_x_csA0_h = 1'b1;
                        MemArray_2_imag_x_csA0_e = MemArray_2_imag_x_csA0_c;
                    end
            default : begin
                          MemArray_2_imag_x_csA0_h = 1'b0;
                          MemArray_2_imag_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_2_imag_x_addrA_lofan_reg0(REG,458)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_imag_x_addrA_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_2_imag_x_part0(DUALMEM,276)@3 + 2
    assign MemArray_2_imag_x_part0_ia = $unsigned(MemArray_2_imag_x_dataA_lofan_reg0_q);
    assign MemArray_2_imag_x_part0_aa = MemArray_2_imag_x_addrA_lofan_reg0_q;
    assign MemArray_2_imag_x_part0_ab = MemArray_2_imag_x_addrB_lofan_reg0_q;
    assign MemArray_2_imag_x_part0_ena_NotRstA = ~ (areset);
    assign MemArray_2_imag_x_part0_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_2_imag_x_part0_dmem (
        .clocken0(MemArray_2_imag_x_part0_ena_NotRstA),
        .sclr(MemArray_2_imag_x_part0_reset0),
        .clock0(clk),
        .address_a(MemArray_2_imag_x_part0_aa),
        .data_a(MemArray_2_imag_x_part0_ia),
        .wren_a(MemArray_2_imag_x_csA0_e[0]),
        .address_b(MemArray_2_imag_x_part0_ab),
        .q_b(MemArray_2_imag_x_part0_iq),
        .rden_b(MemArray_2_imag_x_csB0_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_2_imag_x_part0_q = MemArray_2_imag_x_part0_iq[15:0];

    // MemArray_2_imag_x_qB_l0_or0(LOGICAL,281)@5
    assign MemArray_2_imag_x_qB_l0_or0_q = MemArray_2_imag_x_part0_q | MemArray_2_imag_x_part1_q | MemArray_2_imag_x_part2_q | MemArray_2_imag_x_part3_q;

    // MemArray_1_imag_x_addrB_hifan_reg3(REG,421)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrB_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_1_imag_x_csB3(LOOKUP,225)@3
    always @(MemArray_1_imag_x_addrB_hifan_reg3_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_imag_x_addrB_hifan_reg3_q)
            2'b11 : MemArray_1_imag_x_csB3_h = 1'b1;
            default : MemArray_1_imag_x_csB3_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_1_imag_x_addrB_lofan_reg3(REG,425)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrB_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_1_imag_x_dataA_lofan_reg3(REG,417)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_dataA_lofan_reg3_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_1_x(CONSTANT,69)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_1_x_q = $unsigned(2'b01);

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_1_x(LOGICAL,65)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_1_x_q = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_1_x_q == redist8_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitExtract_x_b_1_q ? 1'b1 : 1'b0);

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_1_x(LOGICAL,61)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_1_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_1_x_q & redist10_ChannelIn_cunroll_x_in_1_vin_tpl_2_q;

    // MemArray_1_imag_x_weA_fan_reg3(REG,409)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_1_imag_x_weA_fan_reg3_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_1_imag_x_weA_fan_reg3_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_1_x_q);
        end
    end

    // MemArray_1_imag_x_addrA_hifan_reg3(REG,405)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrA_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_1_imag_x_csA3(LOOKUP,216)@3
    assign MemArray_1_imag_x_csA3_c = $unsigned(MemArray_1_imag_x_weA_fan_reg3_q);
    always @(MemArray_1_imag_x_addrA_hifan_reg3_q or MemArray_1_imag_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_imag_x_addrA_hifan_reg3_q)
            2'b11 : begin
                        MemArray_1_imag_x_csA3_h = 1'b1;
                        MemArray_1_imag_x_csA3_e = MemArray_1_imag_x_csA3_c;
                    end
            default : begin
                          MemArray_1_imag_x_csA3_h = 1'b0;
                          MemArray_1_imag_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_1_imag_x_addrA_lofan_reg3(REG,413)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrA_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_1_imag_x_part3(DUALMEM,231)@3 + 2
    assign MemArray_1_imag_x_part3_ia = $unsigned(MemArray_1_imag_x_dataA_lofan_reg3_q);
    assign MemArray_1_imag_x_part3_aa = MemArray_1_imag_x_addrA_lofan_reg3_q;
    assign MemArray_1_imag_x_part3_ab = MemArray_1_imag_x_addrB_lofan_reg3_q;
    assign MemArray_1_imag_x_part3_ena_NotRstA = ~ (areset);
    assign MemArray_1_imag_x_part3_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_1_imag_x_part3_dmem (
        .clocken0(MemArray_1_imag_x_part3_ena_NotRstA),
        .sclr(MemArray_1_imag_x_part3_reset0),
        .clock0(clk),
        .address_a(MemArray_1_imag_x_part3_aa),
        .data_a(MemArray_1_imag_x_part3_ia),
        .wren_a(MemArray_1_imag_x_csA3_e[0]),
        .address_b(MemArray_1_imag_x_part3_ab),
        .q_b(MemArray_1_imag_x_part3_iq),
        .rden_b(MemArray_1_imag_x_csB3_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_1_imag_x_part3_q = MemArray_1_imag_x_part3_iq[15:0];

    // MemArray_1_imag_x_addrB_hifan_reg2(REG,420)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrB_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_1_imag_x_csB2(LOOKUP,224)@3
    always @(MemArray_1_imag_x_addrB_hifan_reg2_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_imag_x_addrB_hifan_reg2_q)
            2'b10 : MemArray_1_imag_x_csB2_h = 1'b1;
            default : MemArray_1_imag_x_csB2_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_1_imag_x_addrB_lofan_reg2(REG,424)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrB_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_1_imag_x_dataA_lofan_reg2(REG,416)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_dataA_lofan_reg2_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // MemArray_1_imag_x_weA_fan_reg2(REG,408)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_1_imag_x_weA_fan_reg2_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_1_imag_x_weA_fan_reg2_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_1_x_q);
        end
    end

    // MemArray_1_imag_x_addrA_hifan_reg2(REG,404)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrA_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_1_imag_x_csA2(LOOKUP,215)@3
    assign MemArray_1_imag_x_csA2_c = $unsigned(MemArray_1_imag_x_weA_fan_reg2_q);
    always @(MemArray_1_imag_x_addrA_hifan_reg2_q or MemArray_1_imag_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_imag_x_addrA_hifan_reg2_q)
            2'b10 : begin
                        MemArray_1_imag_x_csA2_h = 1'b1;
                        MemArray_1_imag_x_csA2_e = MemArray_1_imag_x_csA2_c;
                    end
            default : begin
                          MemArray_1_imag_x_csA2_h = 1'b0;
                          MemArray_1_imag_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_1_imag_x_addrA_lofan_reg2(REG,412)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrA_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_1_imag_x_part2(DUALMEM,230)@3 + 2
    assign MemArray_1_imag_x_part2_ia = $unsigned(MemArray_1_imag_x_dataA_lofan_reg2_q);
    assign MemArray_1_imag_x_part2_aa = MemArray_1_imag_x_addrA_lofan_reg2_q;
    assign MemArray_1_imag_x_part2_ab = MemArray_1_imag_x_addrB_lofan_reg2_q;
    assign MemArray_1_imag_x_part2_ena_NotRstA = ~ (areset);
    assign MemArray_1_imag_x_part2_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_1_imag_x_part2_dmem (
        .clocken0(MemArray_1_imag_x_part2_ena_NotRstA),
        .sclr(MemArray_1_imag_x_part2_reset0),
        .clock0(clk),
        .address_a(MemArray_1_imag_x_part2_aa),
        .data_a(MemArray_1_imag_x_part2_ia),
        .wren_a(MemArray_1_imag_x_csA2_e[0]),
        .address_b(MemArray_1_imag_x_part2_ab),
        .q_b(MemArray_1_imag_x_part2_iq),
        .rden_b(MemArray_1_imag_x_csB2_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_1_imag_x_part2_q = MemArray_1_imag_x_part2_iq[15:0];

    // MemArray_1_imag_x_addrB_hifan_reg1(REG,419)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrB_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_1_imag_x_csB1(LOOKUP,223)@3
    always @(MemArray_1_imag_x_addrB_hifan_reg1_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_imag_x_addrB_hifan_reg1_q)
            2'b01 : MemArray_1_imag_x_csB1_h = 1'b1;
            default : MemArray_1_imag_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_1_imag_x_addrB_lofan_reg1(REG,423)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrB_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_1_imag_x_dataA_lofan_reg1(REG,415)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_dataA_lofan_reg1_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // MemArray_1_imag_x_weA_fan_reg1(REG,407)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_1_imag_x_weA_fan_reg1_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_1_imag_x_weA_fan_reg1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_1_x_q);
        end
    end

    // MemArray_1_imag_x_addrA_hifan_reg1(REG,403)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrA_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_1_imag_x_csA1(LOOKUP,214)@3
    assign MemArray_1_imag_x_csA1_c = $unsigned(MemArray_1_imag_x_weA_fan_reg1_q);
    always @(MemArray_1_imag_x_addrA_hifan_reg1_q or MemArray_1_imag_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_imag_x_addrA_hifan_reg1_q)
            2'b01 : begin
                        MemArray_1_imag_x_csA1_h = 1'b1;
                        MemArray_1_imag_x_csA1_e = MemArray_1_imag_x_csA1_c;
                    end
            default : begin
                          MemArray_1_imag_x_csA1_h = 1'b0;
                          MemArray_1_imag_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_1_imag_x_addrA_lofan_reg1(REG,411)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrA_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_1_imag_x_part1(DUALMEM,229)@3 + 2
    assign MemArray_1_imag_x_part1_ia = $unsigned(MemArray_1_imag_x_dataA_lofan_reg1_q);
    assign MemArray_1_imag_x_part1_aa = MemArray_1_imag_x_addrA_lofan_reg1_q;
    assign MemArray_1_imag_x_part1_ab = MemArray_1_imag_x_addrB_lofan_reg1_q;
    assign MemArray_1_imag_x_part1_ena_NotRstA = ~ (areset);
    assign MemArray_1_imag_x_part1_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_1_imag_x_part1_dmem (
        .clocken0(MemArray_1_imag_x_part1_ena_NotRstA),
        .sclr(MemArray_1_imag_x_part1_reset0),
        .clock0(clk),
        .address_a(MemArray_1_imag_x_part1_aa),
        .data_a(MemArray_1_imag_x_part1_ia),
        .wren_a(MemArray_1_imag_x_csA1_e[0]),
        .address_b(MemArray_1_imag_x_part1_ab),
        .q_b(MemArray_1_imag_x_part1_iq),
        .rden_b(MemArray_1_imag_x_csB1_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_1_imag_x_part1_q = MemArray_1_imag_x_part1_iq[15:0];

    // MemArray_1_imag_x_addrB_hifan_reg0(REG,418)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrB_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_1_imag_x_csB0(LOOKUP,222)@3
    always @(MemArray_1_imag_x_addrB_hifan_reg0_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_imag_x_addrB_hifan_reg0_q)
            2'b00 : MemArray_1_imag_x_csB0_h = 1'b1;
            default : MemArray_1_imag_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_1_imag_x_addrB_lofan_reg0(REG,422)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrB_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_1_imag_x_dataA_lofan_reg0(REG,414)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_dataA_lofan_reg0_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // MemArray_1_imag_x_weA_fan_reg0(REG,406)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_1_imag_x_weA_fan_reg0_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_1_imag_x_weA_fan_reg0_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_1_x_q);
        end
    end

    // MemArray_1_imag_x_addrA_hifan_reg0(REG,402)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrA_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_1_imag_x_csA0(LOOKUP,213)@3
    assign MemArray_1_imag_x_csA0_c = $unsigned(MemArray_1_imag_x_weA_fan_reg0_q);
    always @(MemArray_1_imag_x_addrA_hifan_reg0_q or MemArray_1_imag_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_imag_x_addrA_hifan_reg0_q)
            2'b00 : begin
                        MemArray_1_imag_x_csA0_h = 1'b1;
                        MemArray_1_imag_x_csA0_e = MemArray_1_imag_x_csA0_c;
                    end
            default : begin
                          MemArray_1_imag_x_csA0_h = 1'b0;
                          MemArray_1_imag_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_1_imag_x_addrA_lofan_reg0(REG,410)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_imag_x_addrA_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_1_imag_x_part0(DUALMEM,228)@3 + 2
    assign MemArray_1_imag_x_part0_ia = $unsigned(MemArray_1_imag_x_dataA_lofan_reg0_q);
    assign MemArray_1_imag_x_part0_aa = MemArray_1_imag_x_addrA_lofan_reg0_q;
    assign MemArray_1_imag_x_part0_ab = MemArray_1_imag_x_addrB_lofan_reg0_q;
    assign MemArray_1_imag_x_part0_ena_NotRstA = ~ (areset);
    assign MemArray_1_imag_x_part0_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_1_imag_x_part0_dmem (
        .clocken0(MemArray_1_imag_x_part0_ena_NotRstA),
        .sclr(MemArray_1_imag_x_part0_reset0),
        .clock0(clk),
        .address_a(MemArray_1_imag_x_part0_aa),
        .data_a(MemArray_1_imag_x_part0_ia),
        .wren_a(MemArray_1_imag_x_csA0_e[0]),
        .address_b(MemArray_1_imag_x_part0_ab),
        .q_b(MemArray_1_imag_x_part0_iq),
        .rden_b(MemArray_1_imag_x_csB0_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_1_imag_x_part0_q = MemArray_1_imag_x_part0_iq[15:0];

    // MemArray_1_imag_x_qB_l0_or0(LOGICAL,233)@5
    assign MemArray_1_imag_x_qB_l0_or0_q = MemArray_1_imag_x_part0_q | MemArray_1_imag_x_part1_q | MemArray_1_imag_x_part2_q | MemArray_1_imag_x_part3_q;

    // MemArray_0_imag_x_addrB_hifan_reg3(REG,373)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrB_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_0_imag_x_csB3(LOOKUP,177)@3
    always @(MemArray_0_imag_x_addrB_hifan_reg3_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_imag_x_addrB_hifan_reg3_q)
            2'b11 : MemArray_0_imag_x_csB3_h = 1'b1;
            default : MemArray_0_imag_x_csB3_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_0_imag_x_addrB_lofan_reg3(REG,377)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrB_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_0_imag_x_dataA_lofan_reg3(REG,369)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_dataA_lofan_reg3_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_0_x(LOGICAL,64)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_0_x_q = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_Const10_0_x_q == redist8_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_BitExtract_x_b_1_q ? 1'b1 : 1'b0);

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_0_x(LOGICAL,60)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_0_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_CmpEQ4_0_x_q & redist10_ChannelIn_cunroll_x_in_1_vin_tpl_2_q;

    // MemArray_0_imag_x_weA_fan_reg3(REG,361)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_0_imag_x_weA_fan_reg3_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_0_imag_x_weA_fan_reg3_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_0_x_q);
        end
    end

    // MemArray_0_imag_x_addrA_hifan_reg3(REG,357)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrA_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_0_imag_x_csA3(LOOKUP,168)@3
    assign MemArray_0_imag_x_csA3_c = $unsigned(MemArray_0_imag_x_weA_fan_reg3_q);
    always @(MemArray_0_imag_x_addrA_hifan_reg3_q or MemArray_0_imag_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_imag_x_addrA_hifan_reg3_q)
            2'b11 : begin
                        MemArray_0_imag_x_csA3_h = 1'b1;
                        MemArray_0_imag_x_csA3_e = MemArray_0_imag_x_csA3_c;
                    end
            default : begin
                          MemArray_0_imag_x_csA3_h = 1'b0;
                          MemArray_0_imag_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_0_imag_x_addrA_lofan_reg3(REG,365)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrA_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_0_imag_x_part3(DUALMEM,183)@3 + 2
    assign MemArray_0_imag_x_part3_ia = $unsigned(MemArray_0_imag_x_dataA_lofan_reg3_q);
    assign MemArray_0_imag_x_part3_aa = MemArray_0_imag_x_addrA_lofan_reg3_q;
    assign MemArray_0_imag_x_part3_ab = MemArray_0_imag_x_addrB_lofan_reg3_q;
    assign MemArray_0_imag_x_part3_ena_NotRstA = ~ (areset);
    assign MemArray_0_imag_x_part3_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_0_imag_x_part3_dmem (
        .clocken0(MemArray_0_imag_x_part3_ena_NotRstA),
        .sclr(MemArray_0_imag_x_part3_reset0),
        .clock0(clk),
        .address_a(MemArray_0_imag_x_part3_aa),
        .data_a(MemArray_0_imag_x_part3_ia),
        .wren_a(MemArray_0_imag_x_csA3_e[0]),
        .address_b(MemArray_0_imag_x_part3_ab),
        .q_b(MemArray_0_imag_x_part3_iq),
        .rden_b(MemArray_0_imag_x_csB3_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_0_imag_x_part3_q = MemArray_0_imag_x_part3_iq[15:0];

    // MemArray_0_imag_x_addrB_hifan_reg2(REG,372)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrB_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_0_imag_x_csB2(LOOKUP,176)@3
    always @(MemArray_0_imag_x_addrB_hifan_reg2_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_imag_x_addrB_hifan_reg2_q)
            2'b10 : MemArray_0_imag_x_csB2_h = 1'b1;
            default : MemArray_0_imag_x_csB2_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_0_imag_x_addrB_lofan_reg2(REG,376)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrB_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_0_imag_x_dataA_lofan_reg2(REG,368)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_dataA_lofan_reg2_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // MemArray_0_imag_x_weA_fan_reg2(REG,360)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_0_imag_x_weA_fan_reg2_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_0_imag_x_weA_fan_reg2_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_0_x_q);
        end
    end

    // MemArray_0_imag_x_addrA_hifan_reg2(REG,356)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrA_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_0_imag_x_csA2(LOOKUP,167)@3
    assign MemArray_0_imag_x_csA2_c = $unsigned(MemArray_0_imag_x_weA_fan_reg2_q);
    always @(MemArray_0_imag_x_addrA_hifan_reg2_q or MemArray_0_imag_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_imag_x_addrA_hifan_reg2_q)
            2'b10 : begin
                        MemArray_0_imag_x_csA2_h = 1'b1;
                        MemArray_0_imag_x_csA2_e = MemArray_0_imag_x_csA2_c;
                    end
            default : begin
                          MemArray_0_imag_x_csA2_h = 1'b0;
                          MemArray_0_imag_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_0_imag_x_addrA_lofan_reg2(REG,364)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrA_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_0_imag_x_part2(DUALMEM,182)@3 + 2
    assign MemArray_0_imag_x_part2_ia = $unsigned(MemArray_0_imag_x_dataA_lofan_reg2_q);
    assign MemArray_0_imag_x_part2_aa = MemArray_0_imag_x_addrA_lofan_reg2_q;
    assign MemArray_0_imag_x_part2_ab = MemArray_0_imag_x_addrB_lofan_reg2_q;
    assign MemArray_0_imag_x_part2_ena_NotRstA = ~ (areset);
    assign MemArray_0_imag_x_part2_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_0_imag_x_part2_dmem (
        .clocken0(MemArray_0_imag_x_part2_ena_NotRstA),
        .sclr(MemArray_0_imag_x_part2_reset0),
        .clock0(clk),
        .address_a(MemArray_0_imag_x_part2_aa),
        .data_a(MemArray_0_imag_x_part2_ia),
        .wren_a(MemArray_0_imag_x_csA2_e[0]),
        .address_b(MemArray_0_imag_x_part2_ab),
        .q_b(MemArray_0_imag_x_part2_iq),
        .rden_b(MemArray_0_imag_x_csB2_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_0_imag_x_part2_q = MemArray_0_imag_x_part2_iq[15:0];

    // MemArray_0_imag_x_addrB_hifan_reg1(REG,371)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrB_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_0_imag_x_csB1(LOOKUP,175)@3
    always @(MemArray_0_imag_x_addrB_hifan_reg1_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_imag_x_addrB_hifan_reg1_q)
            2'b01 : MemArray_0_imag_x_csB1_h = 1'b1;
            default : MemArray_0_imag_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_0_imag_x_addrB_lofan_reg1(REG,375)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrB_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_0_imag_x_dataA_lofan_reg1(REG,367)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_dataA_lofan_reg1_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // MemArray_0_imag_x_weA_fan_reg1(REG,359)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_0_imag_x_weA_fan_reg1_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_0_imag_x_weA_fan_reg1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_0_x_q);
        end
    end

    // MemArray_0_imag_x_addrA_hifan_reg1(REG,355)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrA_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_0_imag_x_csA1(LOOKUP,166)@3
    assign MemArray_0_imag_x_csA1_c = $unsigned(MemArray_0_imag_x_weA_fan_reg1_q);
    always @(MemArray_0_imag_x_addrA_hifan_reg1_q or MemArray_0_imag_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_imag_x_addrA_hifan_reg1_q)
            2'b01 : begin
                        MemArray_0_imag_x_csA1_h = 1'b1;
                        MemArray_0_imag_x_csA1_e = MemArray_0_imag_x_csA1_c;
                    end
            default : begin
                          MemArray_0_imag_x_csA1_h = 1'b0;
                          MemArray_0_imag_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_0_imag_x_addrA_lofan_reg1(REG,363)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrA_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_0_imag_x_part1(DUALMEM,181)@3 + 2
    assign MemArray_0_imag_x_part1_ia = $unsigned(MemArray_0_imag_x_dataA_lofan_reg1_q);
    assign MemArray_0_imag_x_part1_aa = MemArray_0_imag_x_addrA_lofan_reg1_q;
    assign MemArray_0_imag_x_part1_ab = MemArray_0_imag_x_addrB_lofan_reg1_q;
    assign MemArray_0_imag_x_part1_ena_NotRstA = ~ (areset);
    assign MemArray_0_imag_x_part1_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_0_imag_x_part1_dmem (
        .clocken0(MemArray_0_imag_x_part1_ena_NotRstA),
        .sclr(MemArray_0_imag_x_part1_reset0),
        .clock0(clk),
        .address_a(MemArray_0_imag_x_part1_aa),
        .data_a(MemArray_0_imag_x_part1_ia),
        .wren_a(MemArray_0_imag_x_csA1_e[0]),
        .address_b(MemArray_0_imag_x_part1_ab),
        .q_b(MemArray_0_imag_x_part1_iq),
        .rden_b(MemArray_0_imag_x_csB1_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_0_imag_x_part1_q = MemArray_0_imag_x_part1_iq[15:0];

    // MemArray_0_imag_x_addrB_hifan_reg0(REG,370)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrB_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_0_imag_x_csB0(LOOKUP,174)@3
    always @(MemArray_0_imag_x_addrB_hifan_reg0_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_imag_x_addrB_hifan_reg0_q)
            2'b00 : MemArray_0_imag_x_csB0_h = 1'b1;
            default : MemArray_0_imag_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_0_imag_x_addrB_lofan_reg0(REG,374)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrB_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_0_imag_x_dataA_lofan_reg0(REG,366)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_dataA_lofan_reg0_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_3_imag_din_tpl_2_q);
        end
    end

    // MemArray_0_imag_x_weA_fan_reg0(REG,358)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_0_imag_x_weA_fan_reg0_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_0_imag_x_weA_fan_reg0_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_0_x_q);
        end
    end

    // MemArray_0_imag_x_addrA_hifan_reg0(REG,354)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrA_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_0_imag_x_csA0(LOOKUP,165)@3
    assign MemArray_0_imag_x_csA0_c = $unsigned(MemArray_0_imag_x_weA_fan_reg0_q);
    always @(MemArray_0_imag_x_addrA_hifan_reg0_q or MemArray_0_imag_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_imag_x_addrA_hifan_reg0_q)
            2'b00 : begin
                        MemArray_0_imag_x_csA0_h = 1'b1;
                        MemArray_0_imag_x_csA0_e = MemArray_0_imag_x_csA0_c;
                    end
            default : begin
                          MemArray_0_imag_x_csA0_h = 1'b0;
                          MemArray_0_imag_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_0_imag_x_addrA_lofan_reg0(REG,362)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_imag_x_addrA_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_0_imag_x_part0(DUALMEM,180)@3 + 2
    assign MemArray_0_imag_x_part0_ia = $unsigned(MemArray_0_imag_x_dataA_lofan_reg0_q);
    assign MemArray_0_imag_x_part0_aa = MemArray_0_imag_x_addrA_lofan_reg0_q;
    assign MemArray_0_imag_x_part0_ab = MemArray_0_imag_x_addrB_lofan_reg0_q;
    assign MemArray_0_imag_x_part0_ena_NotRstA = ~ (areset);
    assign MemArray_0_imag_x_part0_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_0_imag_x_part0_dmem (
        .clocken0(MemArray_0_imag_x_part0_ena_NotRstA),
        .sclr(MemArray_0_imag_x_part0_reset0),
        .clock0(clk),
        .address_a(MemArray_0_imag_x_part0_aa),
        .data_a(MemArray_0_imag_x_part0_ia),
        .wren_a(MemArray_0_imag_x_csA0_e[0]),
        .address_b(MemArray_0_imag_x_part0_ab),
        .q_b(MemArray_0_imag_x_part0_iq),
        .rden_b(MemArray_0_imag_x_csB0_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_0_imag_x_part0_q = MemArray_0_imag_x_part0_iq[15:0];

    // MemArray_0_imag_x_qB_l0_or0(LOGICAL,185)@5
    assign MemArray_0_imag_x_qB_l0_or0_q = MemArray_0_imag_x_part0_q | MemArray_0_imag_x_part1_q | MemArray_0_imag_x_part2_q | MemArray_0_imag_x_part3_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x(BITSELECT,55)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_q0[1:0];

    // redist3_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_3(DELAY,559)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_3_delay_0 <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b);
            redist3_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_3_delay_1 <= redist3_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_3_delay_0;
            redist3_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_3_q <= redist3_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_3_delay_1;
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_imag_x(MUX,58)@5 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_imag_x_s = redist3_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_3_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_imag_x_s)
                2'b00 : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_imag_x_q <= MemArray_0_imag_x_qB_l0_or0_q;
                2'b01 : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_imag_x_q <= MemArray_1_imag_x_qB_l0_or0_q;
                2'b10 : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_imag_x_q <= MemArray_2_imag_x_qB_l0_or0_q;
                2'b11 : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_imag_x_q <= MemArray_3_imag_x_qB_l0_or0_q;
                default : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_imag_x_q <= 16'b0;
            endcase
        end
    end

    // MemArray_3_real_x_addrB_hifan_reg3(REG,541)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrB_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_3_real_x_csB3(LOOKUP,345)@3
    always @(MemArray_3_real_x_addrB_hifan_reg3_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_real_x_addrB_hifan_reg3_q)
            2'b11 : MemArray_3_real_x_csB3_h = 1'b1;
            default : MemArray_3_real_x_csB3_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_3_real_x_addrB_lofan_reg3(REG,545)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrB_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2(DELAY,567)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_delay_0 <= $unsigned(in_3_real_din_tpl);
            redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q <= redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_delay_0;
        end
    end

    // MemArray_3_real_x_dataA_lofan_reg3(REG,537)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_dataA_lofan_reg3_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_3_real_x_weA_fan_reg3(REG,529)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_3_real_x_weA_fan_reg3_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_3_real_x_weA_fan_reg3_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_3_x_q);
        end
    end

    // MemArray_3_real_x_addrA_hifan_reg3(REG,525)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrA_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_3_real_x_csA3(LOOKUP,336)@3
    assign MemArray_3_real_x_csA3_c = $unsigned(MemArray_3_real_x_weA_fan_reg3_q);
    always @(MemArray_3_real_x_addrA_hifan_reg3_q or MemArray_3_real_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_real_x_addrA_hifan_reg3_q)
            2'b11 : begin
                        MemArray_3_real_x_csA3_h = 1'b1;
                        MemArray_3_real_x_csA3_e = MemArray_3_real_x_csA3_c;
                    end
            default : begin
                          MemArray_3_real_x_csA3_h = 1'b0;
                          MemArray_3_real_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_3_real_x_addrA_lofan_reg3(REG,533)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrA_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_3_real_x_part3(DUALMEM,351)@3 + 2
    assign MemArray_3_real_x_part3_ia = $unsigned(MemArray_3_real_x_dataA_lofan_reg3_q);
    assign MemArray_3_real_x_part3_aa = MemArray_3_real_x_addrA_lofan_reg3_q;
    assign MemArray_3_real_x_part3_ab = MemArray_3_real_x_addrB_lofan_reg3_q;
    assign MemArray_3_real_x_part3_ena_NotRstA = ~ (areset);
    assign MemArray_3_real_x_part3_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_3_real_x_part3_dmem (
        .clocken0(MemArray_3_real_x_part3_ena_NotRstA),
        .sclr(MemArray_3_real_x_part3_reset0),
        .clock0(clk),
        .address_a(MemArray_3_real_x_part3_aa),
        .data_a(MemArray_3_real_x_part3_ia),
        .wren_a(MemArray_3_real_x_csA3_e[0]),
        .address_b(MemArray_3_real_x_part3_ab),
        .q_b(MemArray_3_real_x_part3_iq),
        .rden_b(MemArray_3_real_x_csB3_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_3_real_x_part3_q = MemArray_3_real_x_part3_iq[15:0];

    // MemArray_3_real_x_addrB_hifan_reg2(REG,540)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrB_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_3_real_x_csB2(LOOKUP,344)@3
    always @(MemArray_3_real_x_addrB_hifan_reg2_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_real_x_addrB_hifan_reg2_q)
            2'b10 : MemArray_3_real_x_csB2_h = 1'b1;
            default : MemArray_3_real_x_csB2_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_3_real_x_addrB_lofan_reg2(REG,544)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrB_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_3_real_x_dataA_lofan_reg2(REG,536)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_dataA_lofan_reg2_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_3_real_x_weA_fan_reg2(REG,528)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_3_real_x_weA_fan_reg2_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_3_real_x_weA_fan_reg2_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_3_x_q);
        end
    end

    // MemArray_3_real_x_addrA_hifan_reg2(REG,524)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrA_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_3_real_x_csA2(LOOKUP,335)@3
    assign MemArray_3_real_x_csA2_c = $unsigned(MemArray_3_real_x_weA_fan_reg2_q);
    always @(MemArray_3_real_x_addrA_hifan_reg2_q or MemArray_3_real_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_real_x_addrA_hifan_reg2_q)
            2'b10 : begin
                        MemArray_3_real_x_csA2_h = 1'b1;
                        MemArray_3_real_x_csA2_e = MemArray_3_real_x_csA2_c;
                    end
            default : begin
                          MemArray_3_real_x_csA2_h = 1'b0;
                          MemArray_3_real_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_3_real_x_addrA_lofan_reg2(REG,532)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrA_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_3_real_x_part2(DUALMEM,350)@3 + 2
    assign MemArray_3_real_x_part2_ia = $unsigned(MemArray_3_real_x_dataA_lofan_reg2_q);
    assign MemArray_3_real_x_part2_aa = MemArray_3_real_x_addrA_lofan_reg2_q;
    assign MemArray_3_real_x_part2_ab = MemArray_3_real_x_addrB_lofan_reg2_q;
    assign MemArray_3_real_x_part2_ena_NotRstA = ~ (areset);
    assign MemArray_3_real_x_part2_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_3_real_x_part2_dmem (
        .clocken0(MemArray_3_real_x_part2_ena_NotRstA),
        .sclr(MemArray_3_real_x_part2_reset0),
        .clock0(clk),
        .address_a(MemArray_3_real_x_part2_aa),
        .data_a(MemArray_3_real_x_part2_ia),
        .wren_a(MemArray_3_real_x_csA2_e[0]),
        .address_b(MemArray_3_real_x_part2_ab),
        .q_b(MemArray_3_real_x_part2_iq),
        .rden_b(MemArray_3_real_x_csB2_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_3_real_x_part2_q = MemArray_3_real_x_part2_iq[15:0];

    // MemArray_3_real_x_addrB_hifan_reg1(REG,539)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrB_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_3_real_x_csB1(LOOKUP,343)@3
    always @(MemArray_3_real_x_addrB_hifan_reg1_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_real_x_addrB_hifan_reg1_q)
            2'b01 : MemArray_3_real_x_csB1_h = 1'b1;
            default : MemArray_3_real_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_3_real_x_addrB_lofan_reg1(REG,543)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrB_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_3_real_x_dataA_lofan_reg1(REG,535)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_dataA_lofan_reg1_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_3_real_x_weA_fan_reg1(REG,527)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_3_real_x_weA_fan_reg1_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_3_real_x_weA_fan_reg1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_3_x_q);
        end
    end

    // MemArray_3_real_x_addrA_hifan_reg1(REG,523)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrA_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_3_real_x_csA1(LOOKUP,334)@3
    assign MemArray_3_real_x_csA1_c = $unsigned(MemArray_3_real_x_weA_fan_reg1_q);
    always @(MemArray_3_real_x_addrA_hifan_reg1_q or MemArray_3_real_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_real_x_addrA_hifan_reg1_q)
            2'b01 : begin
                        MemArray_3_real_x_csA1_h = 1'b1;
                        MemArray_3_real_x_csA1_e = MemArray_3_real_x_csA1_c;
                    end
            default : begin
                          MemArray_3_real_x_csA1_h = 1'b0;
                          MemArray_3_real_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_3_real_x_addrA_lofan_reg1(REG,531)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrA_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_3_real_x_part1(DUALMEM,349)@3 + 2
    assign MemArray_3_real_x_part1_ia = $unsigned(MemArray_3_real_x_dataA_lofan_reg1_q);
    assign MemArray_3_real_x_part1_aa = MemArray_3_real_x_addrA_lofan_reg1_q;
    assign MemArray_3_real_x_part1_ab = MemArray_3_real_x_addrB_lofan_reg1_q;
    assign MemArray_3_real_x_part1_ena_NotRstA = ~ (areset);
    assign MemArray_3_real_x_part1_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_3_real_x_part1_dmem (
        .clocken0(MemArray_3_real_x_part1_ena_NotRstA),
        .sclr(MemArray_3_real_x_part1_reset0),
        .clock0(clk),
        .address_a(MemArray_3_real_x_part1_aa),
        .data_a(MemArray_3_real_x_part1_ia),
        .wren_a(MemArray_3_real_x_csA1_e[0]),
        .address_b(MemArray_3_real_x_part1_ab),
        .q_b(MemArray_3_real_x_part1_iq),
        .rden_b(MemArray_3_real_x_csB1_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_3_real_x_part1_q = MemArray_3_real_x_part1_iq[15:0];

    // MemArray_3_real_x_addrB_hifan_reg0(REG,538)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrB_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_3_real_x_csB0(LOOKUP,342)@3
    always @(MemArray_3_real_x_addrB_hifan_reg0_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_real_x_addrB_hifan_reg0_q)
            2'b00 : MemArray_3_real_x_csB0_h = 1'b1;
            default : MemArray_3_real_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_3_real_x_addrB_lofan_reg0(REG,542)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrB_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_3_real_x_dataA_lofan_reg0(REG,534)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_dataA_lofan_reg0_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_3_real_x_weA_fan_reg0(REG,526)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_3_real_x_weA_fan_reg0_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_3_real_x_weA_fan_reg0_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_3_x_q);
        end
    end

    // MemArray_3_real_x_addrA_hifan_reg0(REG,522)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrA_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_3_real_x_csA0(LOOKUP,333)@3
    assign MemArray_3_real_x_csA0_c = $unsigned(MemArray_3_real_x_weA_fan_reg0_q);
    always @(MemArray_3_real_x_addrA_hifan_reg0_q or MemArray_3_real_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_3_real_x_addrA_hifan_reg0_q)
            2'b00 : begin
                        MemArray_3_real_x_csA0_h = 1'b1;
                        MemArray_3_real_x_csA0_e = MemArray_3_real_x_csA0_c;
                    end
            default : begin
                          MemArray_3_real_x_csA0_h = 1'b0;
                          MemArray_3_real_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_3_real_x_addrA_lofan_reg0(REG,530)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_3_real_x_addrA_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_3_real_x_part0(DUALMEM,348)@3 + 2
    assign MemArray_3_real_x_part0_ia = $unsigned(MemArray_3_real_x_dataA_lofan_reg0_q);
    assign MemArray_3_real_x_part0_aa = MemArray_3_real_x_addrA_lofan_reg0_q;
    assign MemArray_3_real_x_part0_ab = MemArray_3_real_x_addrB_lofan_reg0_q;
    assign MemArray_3_real_x_part0_ena_NotRstA = ~ (areset);
    assign MemArray_3_real_x_part0_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_3_real_x_part0_dmem (
        .clocken0(MemArray_3_real_x_part0_ena_NotRstA),
        .sclr(MemArray_3_real_x_part0_reset0),
        .clock0(clk),
        .address_a(MemArray_3_real_x_part0_aa),
        .data_a(MemArray_3_real_x_part0_ia),
        .wren_a(MemArray_3_real_x_csA0_e[0]),
        .address_b(MemArray_3_real_x_part0_ab),
        .q_b(MemArray_3_real_x_part0_iq),
        .rden_b(MemArray_3_real_x_csB0_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_3_real_x_part0_q = MemArray_3_real_x_part0_iq[15:0];

    // MemArray_3_real_x_qB_l0_or0(LOGICAL,353)@5
    assign MemArray_3_real_x_qB_l0_or0_q = MemArray_3_real_x_part0_q | MemArray_3_real_x_part1_q | MemArray_3_real_x_part2_q | MemArray_3_real_x_part3_q;

    // MemArray_2_real_x_addrB_hifan_reg3(REG,493)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrB_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_2_real_x_csB3(LOOKUP,297)@3
    always @(MemArray_2_real_x_addrB_hifan_reg3_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_real_x_addrB_hifan_reg3_q)
            2'b11 : MemArray_2_real_x_csB3_h = 1'b1;
            default : MemArray_2_real_x_csB3_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_2_real_x_addrB_lofan_reg3(REG,497)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrB_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_2_real_x_dataA_lofan_reg3(REG,489)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_dataA_lofan_reg3_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_2_real_x_weA_fan_reg3(REG,481)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_2_real_x_weA_fan_reg3_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_2_real_x_weA_fan_reg3_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_2_x_q);
        end
    end

    // MemArray_2_real_x_addrA_hifan_reg3(REG,477)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrA_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_2_real_x_csA3(LOOKUP,288)@3
    assign MemArray_2_real_x_csA3_c = $unsigned(MemArray_2_real_x_weA_fan_reg3_q);
    always @(MemArray_2_real_x_addrA_hifan_reg3_q or MemArray_2_real_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_real_x_addrA_hifan_reg3_q)
            2'b11 : begin
                        MemArray_2_real_x_csA3_h = 1'b1;
                        MemArray_2_real_x_csA3_e = MemArray_2_real_x_csA3_c;
                    end
            default : begin
                          MemArray_2_real_x_csA3_h = 1'b0;
                          MemArray_2_real_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_2_real_x_addrA_lofan_reg3(REG,485)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrA_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_2_real_x_part3(DUALMEM,303)@3 + 2
    assign MemArray_2_real_x_part3_ia = $unsigned(MemArray_2_real_x_dataA_lofan_reg3_q);
    assign MemArray_2_real_x_part3_aa = MemArray_2_real_x_addrA_lofan_reg3_q;
    assign MemArray_2_real_x_part3_ab = MemArray_2_real_x_addrB_lofan_reg3_q;
    assign MemArray_2_real_x_part3_ena_NotRstA = ~ (areset);
    assign MemArray_2_real_x_part3_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_2_real_x_part3_dmem (
        .clocken0(MemArray_2_real_x_part3_ena_NotRstA),
        .sclr(MemArray_2_real_x_part3_reset0),
        .clock0(clk),
        .address_a(MemArray_2_real_x_part3_aa),
        .data_a(MemArray_2_real_x_part3_ia),
        .wren_a(MemArray_2_real_x_csA3_e[0]),
        .address_b(MemArray_2_real_x_part3_ab),
        .q_b(MemArray_2_real_x_part3_iq),
        .rden_b(MemArray_2_real_x_csB3_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_2_real_x_part3_q = MemArray_2_real_x_part3_iq[15:0];

    // MemArray_2_real_x_addrB_hifan_reg2(REG,492)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrB_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_2_real_x_csB2(LOOKUP,296)@3
    always @(MemArray_2_real_x_addrB_hifan_reg2_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_real_x_addrB_hifan_reg2_q)
            2'b10 : MemArray_2_real_x_csB2_h = 1'b1;
            default : MemArray_2_real_x_csB2_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_2_real_x_addrB_lofan_reg2(REG,496)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrB_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_2_real_x_dataA_lofan_reg2(REG,488)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_dataA_lofan_reg2_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_2_real_x_weA_fan_reg2(REG,480)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_2_real_x_weA_fan_reg2_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_2_real_x_weA_fan_reg2_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_2_x_q);
        end
    end

    // MemArray_2_real_x_addrA_hifan_reg2(REG,476)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrA_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_2_real_x_csA2(LOOKUP,287)@3
    assign MemArray_2_real_x_csA2_c = $unsigned(MemArray_2_real_x_weA_fan_reg2_q);
    always @(MemArray_2_real_x_addrA_hifan_reg2_q or MemArray_2_real_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_real_x_addrA_hifan_reg2_q)
            2'b10 : begin
                        MemArray_2_real_x_csA2_h = 1'b1;
                        MemArray_2_real_x_csA2_e = MemArray_2_real_x_csA2_c;
                    end
            default : begin
                          MemArray_2_real_x_csA2_h = 1'b0;
                          MemArray_2_real_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_2_real_x_addrA_lofan_reg2(REG,484)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrA_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_2_real_x_part2(DUALMEM,302)@3 + 2
    assign MemArray_2_real_x_part2_ia = $unsigned(MemArray_2_real_x_dataA_lofan_reg2_q);
    assign MemArray_2_real_x_part2_aa = MemArray_2_real_x_addrA_lofan_reg2_q;
    assign MemArray_2_real_x_part2_ab = MemArray_2_real_x_addrB_lofan_reg2_q;
    assign MemArray_2_real_x_part2_ena_NotRstA = ~ (areset);
    assign MemArray_2_real_x_part2_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_2_real_x_part2_dmem (
        .clocken0(MemArray_2_real_x_part2_ena_NotRstA),
        .sclr(MemArray_2_real_x_part2_reset0),
        .clock0(clk),
        .address_a(MemArray_2_real_x_part2_aa),
        .data_a(MemArray_2_real_x_part2_ia),
        .wren_a(MemArray_2_real_x_csA2_e[0]),
        .address_b(MemArray_2_real_x_part2_ab),
        .q_b(MemArray_2_real_x_part2_iq),
        .rden_b(MemArray_2_real_x_csB2_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_2_real_x_part2_q = MemArray_2_real_x_part2_iq[15:0];

    // MemArray_2_real_x_addrB_hifan_reg1(REG,491)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrB_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_2_real_x_csB1(LOOKUP,295)@3
    always @(MemArray_2_real_x_addrB_hifan_reg1_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_real_x_addrB_hifan_reg1_q)
            2'b01 : MemArray_2_real_x_csB1_h = 1'b1;
            default : MemArray_2_real_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_2_real_x_addrB_lofan_reg1(REG,495)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrB_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_2_real_x_dataA_lofan_reg1(REG,487)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_dataA_lofan_reg1_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_2_real_x_weA_fan_reg1(REG,479)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_2_real_x_weA_fan_reg1_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_2_real_x_weA_fan_reg1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_2_x_q);
        end
    end

    // MemArray_2_real_x_addrA_hifan_reg1(REG,475)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrA_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_2_real_x_csA1(LOOKUP,286)@3
    assign MemArray_2_real_x_csA1_c = $unsigned(MemArray_2_real_x_weA_fan_reg1_q);
    always @(MemArray_2_real_x_addrA_hifan_reg1_q or MemArray_2_real_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_real_x_addrA_hifan_reg1_q)
            2'b01 : begin
                        MemArray_2_real_x_csA1_h = 1'b1;
                        MemArray_2_real_x_csA1_e = MemArray_2_real_x_csA1_c;
                    end
            default : begin
                          MemArray_2_real_x_csA1_h = 1'b0;
                          MemArray_2_real_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_2_real_x_addrA_lofan_reg1(REG,483)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrA_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_2_real_x_part1(DUALMEM,301)@3 + 2
    assign MemArray_2_real_x_part1_ia = $unsigned(MemArray_2_real_x_dataA_lofan_reg1_q);
    assign MemArray_2_real_x_part1_aa = MemArray_2_real_x_addrA_lofan_reg1_q;
    assign MemArray_2_real_x_part1_ab = MemArray_2_real_x_addrB_lofan_reg1_q;
    assign MemArray_2_real_x_part1_ena_NotRstA = ~ (areset);
    assign MemArray_2_real_x_part1_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_2_real_x_part1_dmem (
        .clocken0(MemArray_2_real_x_part1_ena_NotRstA),
        .sclr(MemArray_2_real_x_part1_reset0),
        .clock0(clk),
        .address_a(MemArray_2_real_x_part1_aa),
        .data_a(MemArray_2_real_x_part1_ia),
        .wren_a(MemArray_2_real_x_csA1_e[0]),
        .address_b(MemArray_2_real_x_part1_ab),
        .q_b(MemArray_2_real_x_part1_iq),
        .rden_b(MemArray_2_real_x_csB1_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_2_real_x_part1_q = MemArray_2_real_x_part1_iq[15:0];

    // MemArray_2_real_x_addrB_hifan_reg0(REG,490)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrB_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_2_real_x_csB0(LOOKUP,294)@3
    always @(MemArray_2_real_x_addrB_hifan_reg0_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_real_x_addrB_hifan_reg0_q)
            2'b00 : MemArray_2_real_x_csB0_h = 1'b1;
            default : MemArray_2_real_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_2_real_x_addrB_lofan_reg0(REG,494)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrB_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_2_real_x_dataA_lofan_reg0(REG,486)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_dataA_lofan_reg0_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_2_real_x_weA_fan_reg0(REG,478)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_2_real_x_weA_fan_reg0_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_2_real_x_weA_fan_reg0_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_2_x_q);
        end
    end

    // MemArray_2_real_x_addrA_hifan_reg0(REG,474)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrA_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_2_real_x_csA0(LOOKUP,285)@3
    assign MemArray_2_real_x_csA0_c = $unsigned(MemArray_2_real_x_weA_fan_reg0_q);
    always @(MemArray_2_real_x_addrA_hifan_reg0_q or MemArray_2_real_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_2_real_x_addrA_hifan_reg0_q)
            2'b00 : begin
                        MemArray_2_real_x_csA0_h = 1'b1;
                        MemArray_2_real_x_csA0_e = MemArray_2_real_x_csA0_c;
                    end
            default : begin
                          MemArray_2_real_x_csA0_h = 1'b0;
                          MemArray_2_real_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_2_real_x_addrA_lofan_reg0(REG,482)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_2_real_x_addrA_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_2_real_x_part0(DUALMEM,300)@3 + 2
    assign MemArray_2_real_x_part0_ia = $unsigned(MemArray_2_real_x_dataA_lofan_reg0_q);
    assign MemArray_2_real_x_part0_aa = MemArray_2_real_x_addrA_lofan_reg0_q;
    assign MemArray_2_real_x_part0_ab = MemArray_2_real_x_addrB_lofan_reg0_q;
    assign MemArray_2_real_x_part0_ena_NotRstA = ~ (areset);
    assign MemArray_2_real_x_part0_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_2_real_x_part0_dmem (
        .clocken0(MemArray_2_real_x_part0_ena_NotRstA),
        .sclr(MemArray_2_real_x_part0_reset0),
        .clock0(clk),
        .address_a(MemArray_2_real_x_part0_aa),
        .data_a(MemArray_2_real_x_part0_ia),
        .wren_a(MemArray_2_real_x_csA0_e[0]),
        .address_b(MemArray_2_real_x_part0_ab),
        .q_b(MemArray_2_real_x_part0_iq),
        .rden_b(MemArray_2_real_x_csB0_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_2_real_x_part0_q = MemArray_2_real_x_part0_iq[15:0];

    // MemArray_2_real_x_qB_l0_or0(LOGICAL,305)@5
    assign MemArray_2_real_x_qB_l0_or0_q = MemArray_2_real_x_part0_q | MemArray_2_real_x_part1_q | MemArray_2_real_x_part2_q | MemArray_2_real_x_part3_q;

    // MemArray_1_real_x_addrB_hifan_reg3(REG,445)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrB_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_1_real_x_csB3(LOOKUP,249)@3
    always @(MemArray_1_real_x_addrB_hifan_reg3_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_real_x_addrB_hifan_reg3_q)
            2'b11 : MemArray_1_real_x_csB3_h = 1'b1;
            default : MemArray_1_real_x_csB3_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_1_real_x_addrB_lofan_reg3(REG,449)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrB_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_1_real_x_dataA_lofan_reg3(REG,441)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_dataA_lofan_reg3_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_1_real_x_weA_fan_reg3(REG,433)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_1_real_x_weA_fan_reg3_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_1_real_x_weA_fan_reg3_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_1_x_q);
        end
    end

    // MemArray_1_real_x_addrA_hifan_reg3(REG,429)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrA_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_1_real_x_csA3(LOOKUP,240)@3
    assign MemArray_1_real_x_csA3_c = $unsigned(MemArray_1_real_x_weA_fan_reg3_q);
    always @(MemArray_1_real_x_addrA_hifan_reg3_q or MemArray_1_real_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_real_x_addrA_hifan_reg3_q)
            2'b11 : begin
                        MemArray_1_real_x_csA3_h = 1'b1;
                        MemArray_1_real_x_csA3_e = MemArray_1_real_x_csA3_c;
                    end
            default : begin
                          MemArray_1_real_x_csA3_h = 1'b0;
                          MemArray_1_real_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_1_real_x_addrA_lofan_reg3(REG,437)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrA_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_1_real_x_part3(DUALMEM,255)@3 + 2
    assign MemArray_1_real_x_part3_ia = $unsigned(MemArray_1_real_x_dataA_lofan_reg3_q);
    assign MemArray_1_real_x_part3_aa = MemArray_1_real_x_addrA_lofan_reg3_q;
    assign MemArray_1_real_x_part3_ab = MemArray_1_real_x_addrB_lofan_reg3_q;
    assign MemArray_1_real_x_part3_ena_NotRstA = ~ (areset);
    assign MemArray_1_real_x_part3_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_1_real_x_part3_dmem (
        .clocken0(MemArray_1_real_x_part3_ena_NotRstA),
        .sclr(MemArray_1_real_x_part3_reset0),
        .clock0(clk),
        .address_a(MemArray_1_real_x_part3_aa),
        .data_a(MemArray_1_real_x_part3_ia),
        .wren_a(MemArray_1_real_x_csA3_e[0]),
        .address_b(MemArray_1_real_x_part3_ab),
        .q_b(MemArray_1_real_x_part3_iq),
        .rden_b(MemArray_1_real_x_csB3_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_1_real_x_part3_q = MemArray_1_real_x_part3_iq[15:0];

    // MemArray_1_real_x_addrB_hifan_reg2(REG,444)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrB_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_1_real_x_csB2(LOOKUP,248)@3
    always @(MemArray_1_real_x_addrB_hifan_reg2_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_real_x_addrB_hifan_reg2_q)
            2'b10 : MemArray_1_real_x_csB2_h = 1'b1;
            default : MemArray_1_real_x_csB2_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_1_real_x_addrB_lofan_reg2(REG,448)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrB_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_1_real_x_dataA_lofan_reg2(REG,440)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_dataA_lofan_reg2_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_1_real_x_weA_fan_reg2(REG,432)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_1_real_x_weA_fan_reg2_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_1_real_x_weA_fan_reg2_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_1_x_q);
        end
    end

    // MemArray_1_real_x_addrA_hifan_reg2(REG,428)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrA_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_1_real_x_csA2(LOOKUP,239)@3
    assign MemArray_1_real_x_csA2_c = $unsigned(MemArray_1_real_x_weA_fan_reg2_q);
    always @(MemArray_1_real_x_addrA_hifan_reg2_q or MemArray_1_real_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_real_x_addrA_hifan_reg2_q)
            2'b10 : begin
                        MemArray_1_real_x_csA2_h = 1'b1;
                        MemArray_1_real_x_csA2_e = MemArray_1_real_x_csA2_c;
                    end
            default : begin
                          MemArray_1_real_x_csA2_h = 1'b0;
                          MemArray_1_real_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_1_real_x_addrA_lofan_reg2(REG,436)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrA_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_1_real_x_part2(DUALMEM,254)@3 + 2
    assign MemArray_1_real_x_part2_ia = $unsigned(MemArray_1_real_x_dataA_lofan_reg2_q);
    assign MemArray_1_real_x_part2_aa = MemArray_1_real_x_addrA_lofan_reg2_q;
    assign MemArray_1_real_x_part2_ab = MemArray_1_real_x_addrB_lofan_reg2_q;
    assign MemArray_1_real_x_part2_ena_NotRstA = ~ (areset);
    assign MemArray_1_real_x_part2_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_1_real_x_part2_dmem (
        .clocken0(MemArray_1_real_x_part2_ena_NotRstA),
        .sclr(MemArray_1_real_x_part2_reset0),
        .clock0(clk),
        .address_a(MemArray_1_real_x_part2_aa),
        .data_a(MemArray_1_real_x_part2_ia),
        .wren_a(MemArray_1_real_x_csA2_e[0]),
        .address_b(MemArray_1_real_x_part2_ab),
        .q_b(MemArray_1_real_x_part2_iq),
        .rden_b(MemArray_1_real_x_csB2_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_1_real_x_part2_q = MemArray_1_real_x_part2_iq[15:0];

    // MemArray_1_real_x_addrB_hifan_reg1(REG,443)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrB_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_1_real_x_csB1(LOOKUP,247)@3
    always @(MemArray_1_real_x_addrB_hifan_reg1_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_real_x_addrB_hifan_reg1_q)
            2'b01 : MemArray_1_real_x_csB1_h = 1'b1;
            default : MemArray_1_real_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_1_real_x_addrB_lofan_reg1(REG,447)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrB_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_1_real_x_dataA_lofan_reg1(REG,439)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_dataA_lofan_reg1_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_1_real_x_weA_fan_reg1(REG,431)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_1_real_x_weA_fan_reg1_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_1_real_x_weA_fan_reg1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_1_x_q);
        end
    end

    // MemArray_1_real_x_addrA_hifan_reg1(REG,427)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrA_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_1_real_x_csA1(LOOKUP,238)@3
    assign MemArray_1_real_x_csA1_c = $unsigned(MemArray_1_real_x_weA_fan_reg1_q);
    always @(MemArray_1_real_x_addrA_hifan_reg1_q or MemArray_1_real_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_real_x_addrA_hifan_reg1_q)
            2'b01 : begin
                        MemArray_1_real_x_csA1_h = 1'b1;
                        MemArray_1_real_x_csA1_e = MemArray_1_real_x_csA1_c;
                    end
            default : begin
                          MemArray_1_real_x_csA1_h = 1'b0;
                          MemArray_1_real_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_1_real_x_addrA_lofan_reg1(REG,435)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrA_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_1_real_x_part1(DUALMEM,253)@3 + 2
    assign MemArray_1_real_x_part1_ia = $unsigned(MemArray_1_real_x_dataA_lofan_reg1_q);
    assign MemArray_1_real_x_part1_aa = MemArray_1_real_x_addrA_lofan_reg1_q;
    assign MemArray_1_real_x_part1_ab = MemArray_1_real_x_addrB_lofan_reg1_q;
    assign MemArray_1_real_x_part1_ena_NotRstA = ~ (areset);
    assign MemArray_1_real_x_part1_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_1_real_x_part1_dmem (
        .clocken0(MemArray_1_real_x_part1_ena_NotRstA),
        .sclr(MemArray_1_real_x_part1_reset0),
        .clock0(clk),
        .address_a(MemArray_1_real_x_part1_aa),
        .data_a(MemArray_1_real_x_part1_ia),
        .wren_a(MemArray_1_real_x_csA1_e[0]),
        .address_b(MemArray_1_real_x_part1_ab),
        .q_b(MemArray_1_real_x_part1_iq),
        .rden_b(MemArray_1_real_x_csB1_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_1_real_x_part1_q = MemArray_1_real_x_part1_iq[15:0];

    // MemArray_1_real_x_addrB_hifan_reg0(REG,442)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrB_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_1_real_x_csB0(LOOKUP,246)@3
    always @(MemArray_1_real_x_addrB_hifan_reg0_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_real_x_addrB_hifan_reg0_q)
            2'b00 : MemArray_1_real_x_csB0_h = 1'b1;
            default : MemArray_1_real_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_1_real_x_addrB_lofan_reg0(REG,446)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrB_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_1_real_x_dataA_lofan_reg0(REG,438)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_dataA_lofan_reg0_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_1_real_x_weA_fan_reg0(REG,430)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_1_real_x_weA_fan_reg0_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_1_real_x_weA_fan_reg0_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_1_x_q);
        end
    end

    // MemArray_1_real_x_addrA_hifan_reg0(REG,426)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrA_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_1_real_x_csA0(LOOKUP,237)@3
    assign MemArray_1_real_x_csA0_c = $unsigned(MemArray_1_real_x_weA_fan_reg0_q);
    always @(MemArray_1_real_x_addrA_hifan_reg0_q or MemArray_1_real_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_1_real_x_addrA_hifan_reg0_q)
            2'b00 : begin
                        MemArray_1_real_x_csA0_h = 1'b1;
                        MemArray_1_real_x_csA0_e = MemArray_1_real_x_csA0_c;
                    end
            default : begin
                          MemArray_1_real_x_csA0_h = 1'b0;
                          MemArray_1_real_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_1_real_x_addrA_lofan_reg0(REG,434)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_1_real_x_addrA_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_1_real_x_part0(DUALMEM,252)@3 + 2
    assign MemArray_1_real_x_part0_ia = $unsigned(MemArray_1_real_x_dataA_lofan_reg0_q);
    assign MemArray_1_real_x_part0_aa = MemArray_1_real_x_addrA_lofan_reg0_q;
    assign MemArray_1_real_x_part0_ab = MemArray_1_real_x_addrB_lofan_reg0_q;
    assign MemArray_1_real_x_part0_ena_NotRstA = ~ (areset);
    assign MemArray_1_real_x_part0_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_1_real_x_part0_dmem (
        .clocken0(MemArray_1_real_x_part0_ena_NotRstA),
        .sclr(MemArray_1_real_x_part0_reset0),
        .clock0(clk),
        .address_a(MemArray_1_real_x_part0_aa),
        .data_a(MemArray_1_real_x_part0_ia),
        .wren_a(MemArray_1_real_x_csA0_e[0]),
        .address_b(MemArray_1_real_x_part0_ab),
        .q_b(MemArray_1_real_x_part0_iq),
        .rden_b(MemArray_1_real_x_csB0_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_1_real_x_part0_q = MemArray_1_real_x_part0_iq[15:0];

    // MemArray_1_real_x_qB_l0_or0(LOGICAL,257)@5
    assign MemArray_1_real_x_qB_l0_or0_q = MemArray_1_real_x_part0_q | MemArray_1_real_x_part1_q | MemArray_1_real_x_part2_q | MemArray_1_real_x_part3_q;

    // MemArray_0_real_x_addrB_hifan_reg3(REG,397)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrB_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_0_real_x_csB3(LOOKUP,201)@3
    always @(MemArray_0_real_x_addrB_hifan_reg3_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_real_x_addrB_hifan_reg3_q)
            2'b11 : MemArray_0_real_x_csB3_h = 1'b1;
            default : MemArray_0_real_x_csB3_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_0_real_x_addrB_lofan_reg3(REG,401)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrB_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_0_real_x_dataA_lofan_reg3(REG,393)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_dataA_lofan_reg3_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_0_real_x_weA_fan_reg3(REG,385)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_0_real_x_weA_fan_reg3_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_0_real_x_weA_fan_reg3_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_0_x_q);
        end
    end

    // MemArray_0_real_x_addrA_hifan_reg3(REG,381)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrA_hifan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_0_real_x_csA3(LOOKUP,192)@3
    assign MemArray_0_real_x_csA3_c = $unsigned(MemArray_0_real_x_weA_fan_reg3_q);
    always @(MemArray_0_real_x_addrA_hifan_reg3_q or MemArray_0_real_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_real_x_addrA_hifan_reg3_q)
            2'b11 : begin
                        MemArray_0_real_x_csA3_h = 1'b1;
                        MemArray_0_real_x_csA3_e = MemArray_0_real_x_csA3_c;
                    end
            default : begin
                          MemArray_0_real_x_csA3_h = 1'b0;
                          MemArray_0_real_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_0_real_x_addrA_lofan_reg3(REG,389)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrA_lofan_reg3_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_0_real_x_part3(DUALMEM,207)@3 + 2
    assign MemArray_0_real_x_part3_ia = $unsigned(MemArray_0_real_x_dataA_lofan_reg3_q);
    assign MemArray_0_real_x_part3_aa = MemArray_0_real_x_addrA_lofan_reg3_q;
    assign MemArray_0_real_x_part3_ab = MemArray_0_real_x_addrB_lofan_reg3_q;
    assign MemArray_0_real_x_part3_ena_NotRstA = ~ (areset);
    assign MemArray_0_real_x_part3_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_0_real_x_part3_dmem (
        .clocken0(MemArray_0_real_x_part3_ena_NotRstA),
        .sclr(MemArray_0_real_x_part3_reset0),
        .clock0(clk),
        .address_a(MemArray_0_real_x_part3_aa),
        .data_a(MemArray_0_real_x_part3_ia),
        .wren_a(MemArray_0_real_x_csA3_e[0]),
        .address_b(MemArray_0_real_x_part3_ab),
        .q_b(MemArray_0_real_x_part3_iq),
        .rden_b(MemArray_0_real_x_csB3_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_0_real_x_part3_q = MemArray_0_real_x_part3_iq[15:0];

    // MemArray_0_real_x_addrB_hifan_reg2(REG,396)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrB_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_0_real_x_csB2(LOOKUP,200)@3
    always @(MemArray_0_real_x_addrB_hifan_reg2_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_real_x_addrB_hifan_reg2_q)
            2'b10 : MemArray_0_real_x_csB2_h = 1'b1;
            default : MemArray_0_real_x_csB2_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_0_real_x_addrB_lofan_reg2(REG,400)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrB_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_0_real_x_dataA_lofan_reg2(REG,392)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_dataA_lofan_reg2_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_0_real_x_weA_fan_reg2(REG,384)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_0_real_x_weA_fan_reg2_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_0_real_x_weA_fan_reg2_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_0_x_q);
        end
    end

    // MemArray_0_real_x_addrA_hifan_reg2(REG,380)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrA_hifan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_0_real_x_csA2(LOOKUP,191)@3
    assign MemArray_0_real_x_csA2_c = $unsigned(MemArray_0_real_x_weA_fan_reg2_q);
    always @(MemArray_0_real_x_addrA_hifan_reg2_q or MemArray_0_real_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_real_x_addrA_hifan_reg2_q)
            2'b10 : begin
                        MemArray_0_real_x_csA2_h = 1'b1;
                        MemArray_0_real_x_csA2_e = MemArray_0_real_x_csA2_c;
                    end
            default : begin
                          MemArray_0_real_x_csA2_h = 1'b0;
                          MemArray_0_real_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_0_real_x_addrA_lofan_reg2(REG,388)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrA_lofan_reg2_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_0_real_x_part2(DUALMEM,206)@3 + 2
    assign MemArray_0_real_x_part2_ia = $unsigned(MemArray_0_real_x_dataA_lofan_reg2_q);
    assign MemArray_0_real_x_part2_aa = MemArray_0_real_x_addrA_lofan_reg2_q;
    assign MemArray_0_real_x_part2_ab = MemArray_0_real_x_addrB_lofan_reg2_q;
    assign MemArray_0_real_x_part2_ena_NotRstA = ~ (areset);
    assign MemArray_0_real_x_part2_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_0_real_x_part2_dmem (
        .clocken0(MemArray_0_real_x_part2_ena_NotRstA),
        .sclr(MemArray_0_real_x_part2_reset0),
        .clock0(clk),
        .address_a(MemArray_0_real_x_part2_aa),
        .data_a(MemArray_0_real_x_part2_ia),
        .wren_a(MemArray_0_real_x_csA2_e[0]),
        .address_b(MemArray_0_real_x_part2_ab),
        .q_b(MemArray_0_real_x_part2_iq),
        .rden_b(MemArray_0_real_x_csB2_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_0_real_x_part2_q = MemArray_0_real_x_part2_iq[15:0];

    // MemArray_0_real_x_addrB_hifan_reg1(REG,395)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrB_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_0_real_x_csB1(LOOKUP,199)@3
    always @(MemArray_0_real_x_addrB_hifan_reg1_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_real_x_addrB_hifan_reg1_q)
            2'b01 : MemArray_0_real_x_csB1_h = 1'b1;
            default : MemArray_0_real_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_0_real_x_addrB_lofan_reg1(REG,399)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrB_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_0_real_x_dataA_lofan_reg1(REG,391)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_dataA_lofan_reg1_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_0_real_x_weA_fan_reg1(REG,383)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_0_real_x_weA_fan_reg1_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_0_real_x_weA_fan_reg1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_0_x_q);
        end
    end

    // MemArray_0_real_x_addrA_hifan_reg1(REG,379)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrA_hifan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_0_real_x_csA1(LOOKUP,190)@3
    assign MemArray_0_real_x_csA1_c = $unsigned(MemArray_0_real_x_weA_fan_reg1_q);
    always @(MemArray_0_real_x_addrA_hifan_reg1_q or MemArray_0_real_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_real_x_addrA_hifan_reg1_q)
            2'b01 : begin
                        MemArray_0_real_x_csA1_h = 1'b1;
                        MemArray_0_real_x_csA1_e = MemArray_0_real_x_csA1_c;
                    end
            default : begin
                          MemArray_0_real_x_csA1_h = 1'b0;
                          MemArray_0_real_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_0_real_x_addrA_lofan_reg1(REG,387)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrA_lofan_reg1_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_0_real_x_part1(DUALMEM,205)@3 + 2
    assign MemArray_0_real_x_part1_ia = $unsigned(MemArray_0_real_x_dataA_lofan_reg1_q);
    assign MemArray_0_real_x_part1_aa = MemArray_0_real_x_addrA_lofan_reg1_q;
    assign MemArray_0_real_x_part1_ab = MemArray_0_real_x_addrB_lofan_reg1_q;
    assign MemArray_0_real_x_part1_ena_NotRstA = ~ (areset);
    assign MemArray_0_real_x_part1_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_0_real_x_part1_dmem (
        .clocken0(MemArray_0_real_x_part1_ena_NotRstA),
        .sclr(MemArray_0_real_x_part1_reset0),
        .clock0(clk),
        .address_a(MemArray_0_real_x_part1_aa),
        .data_a(MemArray_0_real_x_part1_ia),
        .wren_a(MemArray_0_real_x_csA1_e[0]),
        .address_b(MemArray_0_real_x_part1_ab),
        .q_b(MemArray_0_real_x_part1_iq),
        .rden_b(MemArray_0_real_x_csB1_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_0_real_x_part1_q = MemArray_0_real_x_part1_iq[15:0];

    // MemArray_0_real_x_addrB_hifan_reg0(REG,394)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrB_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_hi_b);
        end
    end

    // MemArray_0_real_x_csB0(LOOKUP,198)@3
    always @(MemArray_0_real_x_addrB_hifan_reg0_q)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_real_x_addrB_hifan_reg0_q)
            2'b00 : MemArray_0_real_x_csB0_h = 1'b1;
            default : MemArray_0_real_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // MemArray_0_real_x_addrB_lofan_reg0(REG,398)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrB_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrB_lo_b);
        end
    end

    // MemArray_0_real_x_dataA_lofan_reg0(REG,390)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_dataA_lofan_reg0_q <= $unsigned(redist11_ChannelIn_cunroll_x_in_3_real_din_tpl_2_q);
        end
    end

    // MemArray_0_real_x_weA_fan_reg0(REG,382)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            MemArray_0_real_x_weA_fan_reg0_q <= $unsigned(1'b0);
        end
        else
        begin
            MemArray_0_real_x_weA_fan_reg0_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_WrCtrl_And6_0_x_q);
        end
    end

    // MemArray_0_real_x_addrA_hifan_reg0(REG,378)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrA_hifan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_hi_b);
        end
    end

    // MemArray_0_real_x_csA0(LOOKUP,189)@3
    assign MemArray_0_real_x_csA0_c = $unsigned(MemArray_0_real_x_weA_fan_reg0_q);
    always @(MemArray_0_real_x_addrA_hifan_reg0_q or MemArray_0_real_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (MemArray_0_real_x_addrA_hifan_reg0_q)
            2'b00 : begin
                        MemArray_0_real_x_csA0_h = 1'b1;
                        MemArray_0_real_x_csA0_e = MemArray_0_real_x_csA0_c;
                    end
            default : begin
                          MemArray_0_real_x_csA0_h = 1'b0;
                          MemArray_0_real_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // MemArray_0_real_x_addrA_lofan_reg0(REG,386)@2 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            MemArray_0_real_x_addrA_lofan_reg0_q <= $unsigned(MemArray_0_imag_x_addrA_lo_b);
        end
    end

    // MemArray_0_real_x_part0(DUALMEM,204)@3 + 2
    assign MemArray_0_real_x_part0_ia = $unsigned(MemArray_0_real_x_dataA_lofan_reg0_q);
    assign MemArray_0_real_x_part0_aa = MemArray_0_real_x_addrA_lofan_reg0_q;
    assign MemArray_0_real_x_part0_ab = MemArray_0_real_x_addrB_lofan_reg0_q;
    assign MemArray_0_real_x_part0_ena_NotRstA = ~ (areset);
    assign MemArray_0_real_x_part0_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) MemArray_0_real_x_part0_dmem (
        .clocken0(MemArray_0_real_x_part0_ena_NotRstA),
        .sclr(MemArray_0_real_x_part0_reset0),
        .clock0(clk),
        .address_a(MemArray_0_real_x_part0_aa),
        .data_a(MemArray_0_real_x_part0_ia),
        .wren_a(MemArray_0_real_x_csA0_e[0]),
        .address_b(MemArray_0_real_x_part0_ab),
        .q_b(MemArray_0_real_x_part0_iq),
        .rden_b(MemArray_0_real_x_csB0_h[0]),
        .wren_b(),
        .rden_a(),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign MemArray_0_real_x_part0_q = MemArray_0_real_x_part0_iq[15:0];

    // MemArray_0_real_x_qB_l0_or0(LOGICAL,209)@5
    assign MemArray_0_real_x_qB_l0_or0_q = MemArray_0_real_x_part0_q | MemArray_0_real_x_part1_q | MemArray_0_real_x_part2_q | MemArray_0_real_x_part3_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_real_x(MUX,59)@5 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_real_x_s = redist3_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_3_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_real_x_s)
                2'b00 : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_real_x_q <= MemArray_0_real_x_qB_l0_or0_q;
                2'b01 : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_real_x_q <= MemArray_1_real_x_qB_l0_or0_q;
                2'b10 : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_real_x_q <= MemArray_2_real_x_qB_l0_or0_q;
                2'b11 : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_real_x_q <= MemArray_3_real_x_qB_l0_or0_q;
                default : prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_real_x_q <= 16'b0;
            endcase
        end
    end

    // redist6_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_5(DELAY,562)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist6_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_5_delay_0 <= '0;
        end
        else
        begin
            redist6_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_5_delay_0 <= $unsigned(redist5_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_1_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_5_delay_1 <= redist6_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_5_delay_0;
            redist6_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_5_delay_2 <= redist6_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_5_delay_1;
            redist6_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_5_q <= redist6_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_5_delay_2;
        end
    end

    // redist4_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_4(DELAY,560)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_4_q <= $unsigned(redist3_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_3_q);
        end
    end

    // Convert3_sel_x(BITSELECT,14)@6
    assign Convert3_sel_x_b = {6'b000000, redist4_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_Convert2_sel_x_b_4_q[1:0]};

    // redist2_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v_4(DELAY,558)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v_4_delay_0 <= '0;
        end
        else
        begin
            redist2_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v_4_delay_0 <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v_4_delay_1 <= redist2_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v_4_delay_0;
            redist2_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v_4_delay_2 <= redist2_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v_4_delay_1;
            redist2_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v_4_q <= redist2_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v_4_delay_2;
        end
    end

    // ChannelOut_cunroll_x(PORTOUT,13)@6 + 1
    assign out_1_vout_tpl = redist2_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_RdAddrGen_ReadLoop1_vunroll_x_v_4_q;
    assign out_2_cout_tpl = Convert3_sel_x_b;
    assign out_3_qFFTSize_tpl = redist6_prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_latch_0L1_Mux_x_q_5_q;
    assign out_4_real_q_tpl = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_real_x_q;
    assign out_4_imag_q_tpl = prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv_Vector_Mux_Mux_imag_x_q;
    assign out_5_qBWby10_tpl = redist13_ChannelIn_cunroll_x_in_6_BWby10_tpl_6_mem_q;
    assign out_6_Tref_tpl = redist14_ChannelIn_cunroll_x_in_7_TimeReference_tpl_6_mem_q;

endmodule
