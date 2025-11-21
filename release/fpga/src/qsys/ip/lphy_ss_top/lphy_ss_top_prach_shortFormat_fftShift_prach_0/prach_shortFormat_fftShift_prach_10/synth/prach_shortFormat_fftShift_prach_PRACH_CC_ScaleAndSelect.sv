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

// SystemVerilog created from prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect
// SystemVerilog created on Wed Nov  6 19:28:32 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect (
    input wire [0:0] in_1_vin_tpl,
    input wire [7:0] in_2_chin_tpl,
    input wire [3:0] in_3_FFTSize_tpl,
    input wire [28:0] in_4_real_d_tpl,
    input wire [28:0] in_4_imag_d_tpl,
    input wire [7:0] in_5_BWby10_tpl,
    input wire [28:0] in_6_TimeReference_tpl,
    output wire [0:0] out_1_qv_tpl,
    output wire [7:0] out_2_qch_tpl,
    output wire [15:0] out_3_real_q_tpl,
    output wire [15:0] out_3_imag_q_tpl,
    output wire [0:0] out_4_qv139_tpl,
    output wire [13:0] out_5_FreqBinIdx_tpl,
    output wire [0:0] out_6_vout_FFTshift_tpl,
    output wire [7:0] out_7_cout_FFTshift_tpl,
    output wire [15:0] out_8_real_dout_FFTshift_tpl,
    output wire [15:0] out_8_imag_dout_FFTshift_tpl,
    output wire [28:0] out_9_Tref_tpl,
    input wire [7:0] in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl,
    input wire [11:0] in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [17:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hcmp_x_a;
    wire [17:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hcmp_x_b;
    logic [17:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hcmp_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hcmp_x_n;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hconst_x_q;
    reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_mux_x_q;
    wire [0:0] And_rsrvd_fix_q;
    wire [0:0] And1_q;
    wire [0:0] CmpEQ_q;
    wire [7:0] Const_rsrvd_fix_q;
    wire [13:0] Sub_a;
    wire [13:0] Sub_b;
    logic [13:0] Sub_o;
    wire [13:0] Sub_q;
    wire [0:0] dupName_0_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_PostCast_primWireOut_x_q;
    wire [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_x_a;
    wire [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_x_b;
    logic [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_x_o;
    wire [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_x_q;
    wire [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitCombine_x_q;
    wire [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitCombine1_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitExtract_x_b;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_CmpEQ_x_qi;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_CmpEQ_x_q;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const1_x_q;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const2_x_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const6_x_q;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_q;
    (* preserve_syn_only *) reg [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_i;
    (* preserve_syn_only *) reg prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_eq;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_q;
    (* preserve_syn_only *) reg [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_i;
    (* preserve_syn_only *) reg prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_eq;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_RisingEdgeDetect_And3_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_RisingEdgeDetect_Not_x_q;
    wire [10:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_a;
    wire [10:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_b;
    wire [10:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_i;
    wire [10:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_a1;
    wire [10:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_b1;
    logic [10:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_o;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_qi;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_BitExtract_x_b;
    wire [10:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_CmpGE_x_a;
    wire [10:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_CmpGE_x_b;
    logic [10:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_CmpGE_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_CmpGE_x_n;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Const5_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Mux_x_s;
    reg [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Mux_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_latch_0L_Mux_x_s;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_latch_0L_Mux_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_Not1_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_s;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x_s;
    reg [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_And_x_q;
    wire [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_BitCombine1_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_BitExtract1_x_b;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_running;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_pending;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_v;
    reg [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_q0;
    reg [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_e0;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_f0;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_l0;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Not_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Or1_x_q;
    wire [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_qi;
    reg [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_q;
    wire [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add_x_a;
    wire [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add_x_b;
    logic [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add_x_o;
    wire [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_And_x_qi;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_And_x_q;
    wire [10:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_BitExtract1_x_b;
    wire [14:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpGE_x_a;
    wire [14:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpGE_x_b;
    logic [14:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpGE_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpGE_x_n;
    wire [14:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpLT_x_a;
    wire [14:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpLT_x_b;
    logic [14:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpLT_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpLT_x_c;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const4_x_q;
    wire [13:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_x_a;
    wire [13:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_x_b;
    logic [13:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_x_o;
    wire [13:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const1_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const10_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const11_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const2_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const3_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const4_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const5_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const6_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const7_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const8_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const9_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_s;
    reg [28:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_PostCast_primWireOut_sel_x_b;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b;
    wire prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_reset0;
    wire prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_ena_NotRstA;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_ia;
    wire [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_aa;
    wire [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_ab;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_iq;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_q;
    wire prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_reset0;
    wire prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_ena_NotRstA;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_ia;
    wire [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_aa;
    wire [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_ab;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_iq;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_q;
    wire [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x_b;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_PostCast_primWireOut_sel_x_b;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_PostCast_primWireOut_sel_x_b;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_0_0_a;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_0_0_b;
    logic [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_0_0_o;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_0_0_q;
    wire [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_1_0_a;
    wire [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_1_0_b;
    logic [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_1_0_o;
    wire [12:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_1_0_q;
    wire [12:0] addsumAHighB_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_a;
    wire [12:0] addsumAHighB_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_b;
    logic [12:0] addsumAHighB_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_o;
    wire [12:0] addsumAHighB_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_q;
    wire [13:0] add_uid134_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_q;
    wire [1:0] sR_bottomExtension_uid137_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_q;
    wire [15:0] sR_mergedSignalTM_uid139_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_q;
    wire [1:0] leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_s;
    reg [12:0] leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q;
    wire [3:0] leftShiftStage1Idx1Pad4_uid204_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q;
    wire [8:0] leftShiftStage1Idx1Rng4_uid205_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_in;
    wire [8:0] leftShiftStage1Idx1Rng4_uid205_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_b;
    wire [12:0] leftShiftStage1Idx1_uid206_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q;
    wire [4:0] leftShiftStage1Idx2Rng8_uid208_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_in;
    wire [4:0] leftShiftStage1Idx2Rng8_uid208_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_b;
    wire [12:0] leftShiftStage1Idx2_uid209_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q;
    wire [0:0] leftShiftStage1Idx3Rng12_uid211_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_in;
    wire [0:0] leftShiftStage1Idx3Rng12_uid211_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_b;
    wire [12:0] leftShiftStage1Idx3_uid212_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q;
    wire [1:0] leftShiftStage1_uid214_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_s;
    reg [12:0] leftShiftStage1_uid214_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_0_s;
    reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_0_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_1_s;
    reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_1_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_2_s;
    reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_2_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_mfinal_s;
    reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_mfinal_q;
    wire [0:0] xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b;
    wire [4:0] wIntCst_uid251_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
    wire [9:0] shiftedOut_uid252_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_a;
    wire [9:0] shiftedOut_uid252_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b;
    logic [9:0] shiftedOut_uid252_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_o;
    wire [0:0] shiftedOut_uid252_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_n;
    wire [27:0] rightShiftStage0Idx1Rng1_uid253_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b;
    wire [28:0] rightShiftStage0Idx1_uid254_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
    wire [1:0] seMsb_to2_uid255_in;
    wire [1:0] seMsb_to2_uid255_b;
    wire [26:0] rightShiftStage0Idx2Rng2_uid256_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b;
    wire [28:0] rightShiftStage0Idx2_uid257_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
    wire [2:0] seMsb_to3_uid258_in;
    wire [2:0] seMsb_to3_uid258_b;
    wire [25:0] rightShiftStage0Idx3Rng3_uid259_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b;
    wire [28:0] rightShiftStage0Idx3_uid260_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
    wire [1:0] rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s;
    reg [28:0] rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
    wire [3:0] seMsb_to4_uid263_in;
    wire [3:0] seMsb_to4_uid263_b;
    wire [24:0] rightShiftStage1Idx1Rng4_uid264_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b;
    wire [28:0] rightShiftStage1Idx1_uid265_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
    wire [7:0] seMsb_to8_uid266_in;
    wire [7:0] seMsb_to8_uid266_b;
    wire [20:0] rightShiftStage1Idx2Rng8_uid267_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b;
    wire [28:0] rightShiftStage1Idx2_uid268_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
    wire [11:0] seMsb_to12_uid269_in;
    wire [11:0] seMsb_to12_uid269_b;
    wire [16:0] rightShiftStage1Idx3Rng12_uid270_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b;
    wire [28:0] rightShiftStage1Idx3_uid271_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
    wire [1:0] rightShiftStage1_uid273_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s;
    reg [28:0] rightShiftStage1_uid273_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
    wire [15:0] seMsb_to16_uid274_in;
    wire [15:0] seMsb_to16_uid274_b;
    wire [12:0] rightShiftStage2Idx1Rng16_uid275_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b;
    wire [28:0] rightShiftStage2Idx1_uid276_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
    wire [0:0] rightShiftStage2_uid278_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s;
    reg [28:0] rightShiftStage2_uid278_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
    wire [28:0] shiftOutConstant_to29_uid279_in;
    wire [28:0] shiftOutConstant_to29_uid279_b;
    wire [0:0] r_uid281_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s;
    reg [28:0] r_uid281_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
    wire [15:0] shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_in;
    wire [15:0] shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b;
    wire [0:0] xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b;
    wire [27:0] rightShiftStage0Idx1Rng1_uid287_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b;
    wire [28:0] rightShiftStage0Idx1_uid288_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
    wire [1:0] seMsb_to2_uid289_in;
    wire [1:0] seMsb_to2_uid289_b;
    wire [26:0] rightShiftStage0Idx2Rng2_uid290_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b;
    wire [28:0] rightShiftStage0Idx2_uid291_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
    wire [2:0] seMsb_to3_uid292_in;
    wire [2:0] seMsb_to3_uid292_b;
    wire [25:0] rightShiftStage0Idx3Rng3_uid293_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b;
    wire [28:0] rightShiftStage0Idx3_uid294_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
    wire [1:0] rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s;
    reg [28:0] rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
    wire [3:0] seMsb_to4_uid297_in;
    wire [3:0] seMsb_to4_uid297_b;
    wire [24:0] rightShiftStage1Idx1Rng4_uid298_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b;
    wire [28:0] rightShiftStage1Idx1_uid299_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
    wire [7:0] seMsb_to8_uid300_in;
    wire [7:0] seMsb_to8_uid300_b;
    wire [20:0] rightShiftStage1Idx2Rng8_uid301_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b;
    wire [28:0] rightShiftStage1Idx2_uid302_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
    wire [11:0] seMsb_to12_uid303_in;
    wire [11:0] seMsb_to12_uid303_b;
    wire [16:0] rightShiftStage1Idx3Rng12_uid304_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b;
    wire [28:0] rightShiftStage1Idx3_uid305_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
    wire [1:0] rightShiftStage1_uid307_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s;
    reg [28:0] rightShiftStage1_uid307_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
    wire [15:0] seMsb_to16_uid308_in;
    wire [15:0] seMsb_to16_uid308_b;
    wire [12:0] rightShiftStage2Idx1Rng16_uid309_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b;
    wire [28:0] rightShiftStage2Idx1_uid310_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
    wire [0:0] rightShiftStage2_uid312_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s;
    reg [28:0] rightShiftStage2_uid312_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
    wire [28:0] shiftOutConstant_to29_uid313_in;
    wire [28:0] shiftOutConstant_to29_uid313_b;
    wire [0:0] r_uid315_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s;
    reg [28:0] r_uid315_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
    wire [15:0] shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_in;
    wire [15:0] shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b;
    wire [1:0] leftShiftStageSel0Dto0_uid202_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_bit_select_merged_b;
    wire [1:0] leftShiftStageSel0Dto0_uid202_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_bit_select_merged_c;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_selLSBs_bit_select_merged_in;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_selLSBs_bit_select_merged_b;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_selLSBs_bit_select_merged_c;
    wire [0:0] lowRangeB_uid131_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_bit_select_merged_b;
    wire [10:0] lowRangeB_uid131_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_bit_select_merged_c;
    wire [4:0] rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_in;
    wire [1:0] rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_b;
    wire [1:0] rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_c;
    wire [0:0] rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_d;
    wire [12:0] xPadded_uid192_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q;
    wire [12:0] leftShiftStage0Idx1_uid195_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q;
    wire [12:0] leftShiftStage0Idx2_uid198_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q;
    wire [12:0] leftShiftStage0Idx3_uid201_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q;
    reg [0:0] redist0_lowRangeB_uid131_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_bit_select_merged_b_1_q;
    reg [11:0] redist5_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x_b_1_q;
    reg [11:0] redist6_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x_b_2_q;
    reg [8:0] redist7_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q;
    reg [7:0] redist8_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b_4_q;
    reg [7:0] redist8_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b_4_delay_0;
    reg [7:0] redist8_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b_4_delay_1;
    reg [7:0] redist8_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b_4_delay_2;
    reg [10:0] redist10_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_BitExtract1_x_b_1_q;
    reg [12:0] redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_q_3_q;
    reg [12:0] redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_q_3_delay_0;
    reg [11:0] redist12_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_BitExtract1_x_b_1_q;
    reg [7:0] redist13_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x_q_2_q;
    reg [0:0] redist14_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_q_1_q;
    reg [0:0] redist15_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_2_q;
    reg [0:0] redist16_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_3_q;
    reg [0:0] redist17_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_4_q;
    reg [0:0] redist18_ChannelIn_cunroll_x_in_1_vin_tpl_1_q;
    reg [0:0] redist19_ChannelIn_cunroll_x_in_1_vin_tpl_2_q;
    reg [0:0] redist20_ChannelIn_cunroll_x_in_1_vin_tpl_6_q;
    reg [0:0] redist20_ChannelIn_cunroll_x_in_1_vin_tpl_6_delay_0;
    reg [0:0] redist20_ChannelIn_cunroll_x_in_1_vin_tpl_6_delay_1;
    reg [0:0] redist20_ChannelIn_cunroll_x_in_1_vin_tpl_6_delay_2;
    reg [7:0] redist22_ChannelIn_cunroll_x_in_2_chin_tpl_10_q;
    reg [7:0] redist22_ChannelIn_cunroll_x_in_2_chin_tpl_10_delay_0;
    reg [7:0] redist22_ChannelIn_cunroll_x_in_2_chin_tpl_10_delay_1;
    reg [7:0] redist22_ChannelIn_cunroll_x_in_2_chin_tpl_10_delay_2;
    reg [0:0] redist23_And1_q_4_q;
    reg [0:0] redist23_And1_q_4_delay_0;
    reg [0:0] redist23_And1_q_4_delay_1;
    reg [0:0] redist23_And1_q_4_delay_2;
    reg [11:0] redist24_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_mux_x_q_1_q;
    reg [15:0] redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_inputreg0_q;
    wire redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_reset0;
    wire [15:0] redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_ia;
    wire [1:0] redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_aa;
    wire [1:0] redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_ab;
    wire [15:0] redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_iq;
    wire [15:0] redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_q;
    wire [1:0] redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_wraddr_i = 2'b11;
    wire [2:0] redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_rdcnt_a;
    wire [2:0] redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_rdcnt_b;
    logic [2:0] redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_rdcnt_o;
    wire [2:0] redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_rdcnt_q;
    wire redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_reset0;
    wire [15:0] redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_ia;
    wire [1:0] redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_aa;
    wire [1:0] redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_ab;
    wire [15:0] redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_iq;
    wire [15:0] redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_q;
    wire [1:0] redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_wraddr_i = 2'b11;
    wire [1:0] redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_offset_q;
    wire [2:0] redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_rdcnt_a;
    wire [2:0] redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_rdcnt_b;
    logic [2:0] redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_rdcnt_o;
    wire [2:0] redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_rdcnt_q;
    reg [15:0] redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_inputreg0_q;
    wire redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_reset0;
    wire [15:0] redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_ia;
    wire [1:0] redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_aa;
    wire [1:0] redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_ab;
    wire [15:0] redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_iq;
    wire [15:0] redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_q;
    wire [1:0] redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_wraddr_i = 2'b11;
    wire [2:0] redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_rdcnt_a;
    wire [2:0] redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_rdcnt_b;
    logic [2:0] redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_rdcnt_o;
    wire [2:0] redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_rdcnt_q;
    wire redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_reset0;
    wire [15:0] redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_ia;
    wire [1:0] redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_aa;
    wire [1:0] redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_ab;
    wire [15:0] redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_iq;
    wire [15:0] redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_q;
    wire [1:0] redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_wraddr_i = 2'b11;
    wire [2:0] redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_rdcnt_a;
    wire [2:0] redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_rdcnt_b;
    logic [2:0] redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_rdcnt_o;
    wire [2:0] redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_rdcnt_q;
    wire redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_reset0;
    wire [28:0] redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_ia;
    wire [3:0] redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_aa;
    wire [3:0] redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_ab;
    wire [28:0] redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_iq;
    wire [28:0] redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_q;
    wire [3:0] redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [3:0] redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_wraddr_i = 4'b1111;
    wire [3:0] redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_offset_q;
    wire [4:0] redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_rdcnt_a;
    wire [4:0] redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_rdcnt_b;
    logic [4:0] redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_rdcnt_o;
    wire [4:0] redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_rdcnt_q;
    wire redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_reset0;
    wire [7:0] redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_ia;
    wire [2:0] redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_aa;
    wire [2:0] redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_ab;
    wire [7:0] redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_iq;
    wire [7:0] redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_q;
    wire [2:0] redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_wraddr_i = 3'b111;
    wire [2:0] redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_offset_q;
    wire [3:0] redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_rdcnt_a;
    wire [3:0] redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_rdcnt_b;
    logic [3:0] redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_rdcnt_o;
    wire [3:0] redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_rdcnt_q;

    import prach_shortFormat_fftShift_prach_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // lowRangeB_uid131_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_bit_select_merged(BITSELECT,318)@1
    assign lowRangeB_uid131_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_bit_select_merged_b = in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl[0:0];
    assign lowRangeB_uid131_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_bit_select_merged_c = in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl[11:1];

    // addsumAHighB_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x(ADD,132)@1 + 1
    assign addsumAHighB_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_a = {1'b0, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl};
    assign addsumAHighB_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_b = {2'b00, lowRangeB_uid131_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_bit_select_merged_c};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            addsumAHighB_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_o <= 13'b0;
        end
        else
        begin
            addsumAHighB_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_o <= $unsigned(addsumAHighB_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_a) + $unsigned(addsumAHighB_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_b);
        end
    end
    assign addsumAHighB_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_q = addsumAHighB_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_o[12:0];

    // redist0_lowRangeB_uid131_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_bit_select_merged_b_1(DELAY,327)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_lowRangeB_uid131_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_bit_select_merged_b_1_q <= '0;
        end
        else
        begin
            redist0_lowRangeB_uid131_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_bit_select_merged_b_1_q <= $unsigned(lowRangeB_uid131_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_bit_select_merged_b);
        end
    end

    // add_uid134_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x(BITJOIN,133)@2
    assign add_uid134_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_q = {addsumAHighB_uid133_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_q, redist0_lowRangeB_uid131_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_bit_select_merged_b_1_q};

    // sR_bottomExtension_uid137_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x(CONSTANT,136)
    assign sR_bottomExtension_uid137_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_q = $unsigned(2'b00);

    // sR_mergedSignalTM_uid139_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x(BITJOIN,138)@2
    assign sR_mergedSignalTM_uid139_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_q = {add_uid134_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_q, sR_bottomExtension_uid137_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_q};

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_PostCast_primWireOut_sel_x(BITSELECT,119)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_PostCast_primWireOut_sel_x_b = sR_mergedSignalTM_uid139_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_q[11:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hconst_x(CONSTANT,9)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hconst_x_q = $unsigned(12'b111111111111);

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hcmp_x(COMPARE,8)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hcmp_x_a = {6'b000000, prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hconst_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hcmp_x_b = {2'b00, sR_mergedSignalTM_uid139_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hcmp_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hcmp_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hcmp_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hcmp_x_n[0] = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hcmp_x_o[17]);

    // dupName_0_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_PostCast_primWireOut_x(LOGICAL,23)@2
    assign dupName_0_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_PostCast_primWireOut_x_q = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hcmp_x_n);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_mux_x(SELECTOR,10)@2
    always @(dupName_0_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_PostCast_primWireOut_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hconst_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_PostCast_primWireOut_sel_x_b)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_mux_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_PostCast_primWireOut_sel_x_b;
        if (dupName_0_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const_Mult_PostCast_primWireOut_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_mux_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_hconst_x_q;
        end
    end

    // redist24_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_mux_x_q_1(DELAY,351)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist24_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_mux_x_q_1_q <= '0;
        end
        else
        begin
            redist24_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_mux_x_q_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_mux_x_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const6_x(CONSTANT,32)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const6_x_q = $unsigned(2'b10);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const11_x(CONSTANT,83)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const11_x_q = $unsigned(12'b110011001100);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const3_x(CONSTANT,85)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const3_x_q = $unsigned(12'b101101111100);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const2_x(CONSTANT,84)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const2_x_q = $unsigned(12'b101000101100);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_2(MUX,246)@0
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_2_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_selLSBs_bit_select_merged_b;
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_2_s or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const2_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const3_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const11_x_q)
    begin
        unique case (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_2_s)
            2'b00 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_2_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const2_x_q;
            2'b01 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_2_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const3_x_q;
            2'b10 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_2_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const11_x_q;
            default : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_2_q = 12'b0;
        endcase
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const9_x(CONSTANT,91)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const9_x_q = $unsigned(12'b100011011100);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const7_x(CONSTANT,89)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const7_x_q = $unsigned(12'b011110011000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const8_x(CONSTANT,90)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const8_x_q = $unsigned(12'b011000111100);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const4_x(CONSTANT,86)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const4_x_q = $unsigned(12'b010011111000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_1(MUX,245)@0
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_1_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_selLSBs_bit_select_merged_b;
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_1_s or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const4_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const8_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const7_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const9_x_q)
    begin
        unique case (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_1_s)
            2'b00 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_1_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const4_x_q;
            2'b01 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_1_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const8_x_q;
            2'b10 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_1_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const7_x_q;
            2'b11 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_1_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const9_x_q;
            default : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_1_q = 12'b0;
        endcase
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const6_x(CONSTANT,88)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const6_x_q = $unsigned(12'b001110101000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const1_x(CONSTANT,81)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const1_x_q = $unsigned(12'b001001100100);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const5_x(CONSTANT,87)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const5_x_q = $unsigned(12'b000100100000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const10_x(CONSTANT,82)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const10_x_q = $unsigned(12'b000000000000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_0(MUX,244)@0
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_0_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_selLSBs_bit_select_merged_b;
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_0_s or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const10_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const5_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const1_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const6_x_q)
    begin
        unique case (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_0_s)
            2'b00 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const10_x_q;
            2'b01 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const5_x_q;
            2'b10 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const1_x_q;
            2'b11 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const6_x_q;
            default : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_0_q = 12'b0;
        endcase
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_selLSBs_bit_select_merged(BITSELECT,317)@0
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_selLSBs_bit_select_merged_in = in_5_BWby10_tpl[3:0];
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_selLSBs_bit_select_merged_b = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_selLSBs_bit_select_merged_in[1:0];
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_selLSBs_bit_select_merged_c = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_selLSBs_bit_select_merged_in[3:2];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_mfinal(MUX,247)@0 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_mfinal_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_selLSBs_bit_select_merged_c;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_mfinal_q <= 12'b0;
        end
        else
        begin
            unique case (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_mfinal_s)
                2'b00 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_mfinal_q <= prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_0_q;
                2'b01 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_mfinal_q <= prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_1_q;
                2'b10 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_mfinal_q <= prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_msplit_2_q;
                default : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_mfinal_q <= 12'b0;
            endcase
        end
    end

    // leftShiftStage1Idx3Rng12_uid211_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x(BITSELECT,210)@0
    assign leftShiftStage1Idx3Rng12_uid211_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_in = leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q[0:0];
    assign leftShiftStage1Idx3Rng12_uid211_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_b = leftShiftStage1Idx3Rng12_uid211_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_in[0:0];

    // leftShiftStage1Idx3_uid212_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x(BITJOIN,211)@0
    assign leftShiftStage1Idx3_uid212_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q = {leftShiftStage1Idx3Rng12_uid211_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_b, prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Const10_x_q};

    // leftShiftStage1Idx2Rng8_uid208_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x(BITSELECT,207)@0
    assign leftShiftStage1Idx2Rng8_uid208_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_in = leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q[4:0];
    assign leftShiftStage1Idx2Rng8_uid208_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_b = leftShiftStage1Idx2Rng8_uid208_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_in[4:0];

    // Const_rsrvd_fix(CONSTANT,18)
    assign Const_rsrvd_fix_q = $unsigned(8'b00000000);

    // leftShiftStage1Idx2_uid209_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x(BITJOIN,208)@0
    assign leftShiftStage1Idx2_uid209_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q = {leftShiftStage1Idx2Rng8_uid208_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_b, Const_rsrvd_fix_q};

    // leftShiftStage1Idx1Rng4_uid205_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x(BITSELECT,204)@0
    assign leftShiftStage1Idx1Rng4_uid205_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_in = leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q[8:0];
    assign leftShiftStage1Idx1Rng4_uid205_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_b = leftShiftStage1Idx1Rng4_uid205_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_in[8:0];

    // leftShiftStage1Idx1Pad4_uid204_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x(CONSTANT,203)
    assign leftShiftStage1Idx1Pad4_uid204_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q = $unsigned(4'b0000);

    // leftShiftStage1Idx1_uid206_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x(BITJOIN,205)@0
    assign leftShiftStage1Idx1_uid206_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q = {leftShiftStage1Idx1Rng4_uid205_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_b, leftShiftStage1Idx1Pad4_uid204_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q};

    // leftShiftStage0Idx3_uid201_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const(CONSTANT,326)
    assign leftShiftStage0Idx3_uid201_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q = $unsigned(13'b0000000001000);

    // leftShiftStage0Idx2_uid198_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const(CONSTANT,324)
    assign leftShiftStage0Idx2_uid198_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q = $unsigned(13'b0000000000100);

    // leftShiftStage0Idx1_uid195_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const(CONSTANT,322)
    assign leftShiftStage0Idx1_uid195_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q = $unsigned(13'b0000000000010);

    // xPadded_uid192_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const(CONSTANT,320)
    assign xPadded_uid192_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q = $unsigned(13'b0000000000001);

    // leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x(MUX,202)@0
    assign leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_s = leftShiftStageSel0Dto0_uid202_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_bit_select_merged_b;
    always @(leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_s or xPadded_uid192_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q or leftShiftStage0Idx1_uid195_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q or leftShiftStage0Idx2_uid198_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q or leftShiftStage0Idx3_uid201_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q)
    begin
        unique case (leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_s)
            2'b00 : leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q = xPadded_uid192_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q;
            2'b01 : leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q = leftShiftStage0Idx1_uid195_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q;
            2'b10 : leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q = leftShiftStage0Idx2_uid198_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q;
            2'b11 : leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q = leftShiftStage0Idx3_uid201_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q_const_q;
            default : leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q = 13'b0;
        endcase
    end

    // leftShiftStageSel0Dto0_uid202_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_bit_select_merged(BITSELECT,316)@0
    assign leftShiftStageSel0Dto0_uid202_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_bit_select_merged_b = in_3_FFTSize_tpl[1:0];
    assign leftShiftStageSel0Dto0_uid202_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_bit_select_merged_c = in_3_FFTSize_tpl[3:2];

    // leftShiftStage1_uid214_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x(MUX,213)@0 + 1
    assign leftShiftStage1_uid214_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_s = leftShiftStageSel0Dto0_uid202_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_bit_select_merged_c;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            leftShiftStage1_uid214_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q <= 13'b0;
        end
        else
        begin
            unique case (leftShiftStage1_uid214_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_s)
                2'b00 : leftShiftStage1_uid214_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q <= leftShiftStage0_uid203_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q;
                2'b01 : leftShiftStage1_uid214_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q <= leftShiftStage1Idx1_uid206_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q;
                2'b10 : leftShiftStage1_uid214_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q <= leftShiftStage1Idx2_uid209_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q;
                2'b11 : leftShiftStage1_uid214_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q <= leftShiftStage1Idx3_uid212_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q;
                default : leftShiftStage1_uid214_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q <= 13'b0;
            endcase
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_x(SUB,80)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_x_a = $unsigned({1'b0, leftShiftStage1_uid214_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q});
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_x_b = $unsigned({2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_DecodeNSizeGrid_Mux_x_mfinal_q});
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_x_o = $unsigned($signed(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_x_a) - $signed(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_x_b));
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_x_o[13:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_PostCast_primWireOut_sel_x(BITSELECT,121)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_PostCast_primWireOut_sel_x_b = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_x_q[11:0]);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_BitExtract1_x(BITSELECT,72)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_BitExtract1_x_b = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Sub_PostCast_primWireOut_sel_x_b[11:1];

    // redist10_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_BitExtract1_x_b_1(DELAY,337)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist10_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_BitExtract1_x_b_1_q <= '0;
        end
        else
        begin
            redist10_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_BitExtract1_x_b_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_BitExtract1_x_b);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_0_0(ADD,122)@2 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_0_0_a = {1'b0, redist10_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_BitExtract1_x_b_1_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_0_0_b = {10'b0000000000, prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const6_x_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_0_0_o <= 12'b0;
        end
        else
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_0_0_o <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_0_0_a) + $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_0_0_b);
        end
    end
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_0_0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_0_0_o[11:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_1_0(ADD,123)@3
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_1_0_a = {1'b0, prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_0_0_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_1_0_b = {1'b0, redist24_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_x_Const_Mult_PostCast_primWireOut_mux_x_q_1_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_1_0_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_1_0_a) + $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_1_0_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_1_0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_1_0_o[12:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x(BITSELECT,116)@3
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x_b = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_x_re_add_1_0_q[11:0];

    // redist5_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x_b_1(DELAY,332)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist5_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist5_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x_b);
        end
    end

    // redist6_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x_b_2(DELAY,333)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x_b_2_q <= $unsigned(redist5_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x_b_1_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_BitExtract1_x(BITSELECT,58)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_BitExtract1_x_b = leftShiftStage1_uid214_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q[12:1];

    // redist12_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_BitExtract1_x_b_1(DELAY,339)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist12_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_BitExtract1_x_b_1_q <= '0;
        end
        else
        begin
            redist12_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_BitExtract1_x_b_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_BitExtract1_x_b);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_BitCombine1_x(BITJOIN,57)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_BitCombine1_x_q = {GND_q, redist12_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_BitExtract1_x_b_1_q};

    // redist18_ChannelIn_cunroll_x_in_1_vin_tpl_1(DELAY,345)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist18_ChannelIn_cunroll_x_in_1_vin_tpl_1_q <= '0;
        end
        else
        begin
            redist18_ChannelIn_cunroll_x_in_1_vin_tpl_1_q <= $unsigned(in_1_vin_tpl);
        end
    end

    // redist19_ChannelIn_cunroll_x_in_1_vin_tpl_2(DELAY,346)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist19_ChannelIn_cunroll_x_in_1_vin_tpl_2_q <= $unsigned(redist18_ChannelIn_cunroll_x_in_1_vin_tpl_1_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Not_x(LOGICAL,63)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Not_x_q = ~ (redist19_ChannelIn_cunroll_x_in_1_vin_tpl_2_q);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_And_x(LOGICAL,56)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_And_x_q = redist18_ChannelIn_cunroll_x_in_1_vin_tpl_1_q & prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Not_x_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Or1_x(LOGICAL,64)@1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Or1_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_l0 | prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_And_x_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x(LOOP,62)@1 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_running <= $unsigned(1'b0);
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_pending <= $unsigned(1'b0);
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_q0 <= 13'b0;
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_e0 <= '1;
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_v <= $unsigned(1'b0);
        end
        else
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_v <= $unsigned(1'b0);
            if (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Or1_x_q == 1'b1)
            begin
                prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_e0 <= $unsigned(leftShiftStage1_uid214_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_LShift_x_q) - $unsigned(13'd1);
                prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_q0 <= 13'b0;
                prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_running <= $unsigned(1'b1);
                if (redist18_ChannelIn_cunroll_x_in_1_vin_tpl_1_q == 1'b1)
                begin
                    prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_pending <= $unsigned(1'b0);
                    prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (redist18_ChannelIn_cunroll_x_in_1_vin_tpl_1_q == 1'b1)
                begin
                    if (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_pending == 1'b1)
                    begin
                        prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_v <= $unsigned(1'b1);
                    end
                    else if (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_running == 1'b1)
                    begin
                        prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_v <= $unsigned(1'b1);
                        if (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_q0 == prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_e0)
                        begin
                            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_q0 <= 13'b0;
                            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_running <= $unsigned(1'b0);
                            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_q0 <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_q0) + $unsigned(13'd1);
                        end
                    end
                    prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_f0 = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_q0 == 13'b0000000000000 ? 1'b1 : 1'b0);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_l0 = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_q0 == prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_e0 ? 1'b1 : 1'b0);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x(LOGICAL,67)@2 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_qi = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Loop_x_q0 ^ prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_BitCombine1_x_q;
    dspba_delay_ver #( .width(13), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_q_3(DELAY,338)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_q_3_delay_0 <= '0;
        end
        else
        begin
            redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_q_3_delay_0 <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_q_3_q <= redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_q_3_delay_0;
        end
    end

    // Sub(SUB,19)@5 + 1
    assign Sub_a = $unsigned({1'b0, redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_q_3_q});
    assign Sub_b = $unsigned({2'b00, redist6_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x_b_2_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Sub_o <= $unsigned($signed(Sub_a) - $signed(Sub_b));
        end
    end
    assign Sub_q = Sub_o[13:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const4_x(CONSTANT,76)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const4_x_q = $unsigned(8'b10001011);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add_x(ADD,68)@4 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add_x_a = {5'b00000, prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Const4_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add_x_b = {1'b0, redist5_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x_b_1_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add_x_o <= 13'b0;
        end
        else
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add_x_o <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add_x_a) + $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add_x_b);
        end
    end
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add_x_o[12:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpLT_x(COMPARE,74)@5
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpLT_x_a = {2'b00, redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_q_3_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpLT_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpLT_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpLT_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpLT_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpLT_x_c[0] = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpLT_x_o[14];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpGE_x(COMPARE,73)@5
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpGE_x_a = {2'b00, redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_IndexCounter_Xor3_x_q_3_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpGE_x_b = {3'b000, redist6_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_Add1_PostCast_primWireOut_sel_x_b_2_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpGE_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpGE_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpGE_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpGE_x_n[0] = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpGE_x_o[14]);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_And_x(LOGICAL,71)@5 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_And_x_qi = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpGE_x_n & prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_CmpLT_x_c;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_And_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_And_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_And_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // And1(LOGICAL,16)@6
    assign And1_q = redist20_ChannelIn_cunroll_x_in_1_vin_tpl_6_q & prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_And_x_q;

    // redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_rdcnt(ADD,365)
    assign redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_rdcnt_a = {1'b0, redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_wraddr_q};
    assign redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_rdcnt_b = {1'b0, prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const6_x_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_rdcnt_o <= $unsigned(redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_rdcnt_a) + $unsigned(redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_rdcnt_b);
        end
    end
    assign redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_rdcnt_q = redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_rdcnt_o[2:0];

    // xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITSELECT,248)@0
    assign xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b = $unsigned(in_4_imag_d_tpl[28:28]);

    // shiftOutConstant_to29_uid279(BITSELECT,278)@0
    assign shiftOutConstant_to29_uid279_in = $unsigned({{28{xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b[0]}}, xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b});
    assign shiftOutConstant_to29_uid279_b = $unsigned(shiftOutConstant_to29_uid279_in[28:0]);

    // seMsb_to16_uid274(BITSELECT,273)@0
    assign seMsb_to16_uid274_in = $unsigned({{15{xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b[0]}}, xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b});
    assign seMsb_to16_uid274_b = $unsigned(seMsb_to16_uid274_in[15:0]);

    // rightShiftStage2Idx1Rng16_uid275_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITSELECT,274)@0
    assign rightShiftStage2Idx1Rng16_uid275_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b = $unsigned(rightShiftStage1_uid273_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q[28:16]);

    // rightShiftStage2Idx1_uid276_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITJOIN,275)@0
    assign rightShiftStage2Idx1_uid276_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = {seMsb_to16_uid274_b, rightShiftStage2Idx1Rng16_uid275_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b};

    // seMsb_to12_uid269(BITSELECT,268)@0
    assign seMsb_to12_uid269_in = $unsigned({{11{xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b[0]}}, xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b});
    assign seMsb_to12_uid269_b = $unsigned(seMsb_to12_uid269_in[11:0]);

    // rightShiftStage1Idx3Rng12_uid270_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITSELECT,269)@0
    assign rightShiftStage1Idx3Rng12_uid270_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b = $unsigned(rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q[28:12]);

    // rightShiftStage1Idx3_uid271_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITJOIN,270)@0
    assign rightShiftStage1Idx3_uid271_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = {seMsb_to12_uid269_b, rightShiftStage1Idx3Rng12_uid270_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b};

    // seMsb_to8_uid266(BITSELECT,265)@0
    assign seMsb_to8_uid266_in = $unsigned({{7{xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b[0]}}, xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b});
    assign seMsb_to8_uid266_b = $unsigned(seMsb_to8_uid266_in[7:0]);

    // rightShiftStage1Idx2Rng8_uid267_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITSELECT,266)@0
    assign rightShiftStage1Idx2Rng8_uid267_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b = $unsigned(rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q[28:8]);

    // rightShiftStage1Idx2_uid268_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITJOIN,267)@0
    assign rightShiftStage1Idx2_uid268_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = {seMsb_to8_uid266_b, rightShiftStage1Idx2Rng8_uid267_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b};

    // seMsb_to4_uid263(BITSELECT,262)@0
    assign seMsb_to4_uid263_in = $unsigned({{3{xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b[0]}}, xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b});
    assign seMsb_to4_uid263_b = $unsigned(seMsb_to4_uid263_in[3:0]);

    // rightShiftStage1Idx1Rng4_uid264_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITSELECT,263)@0
    assign rightShiftStage1Idx1Rng4_uid264_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b = $unsigned(rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q[28:4]);

    // rightShiftStage1Idx1_uid265_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITJOIN,264)@0
    assign rightShiftStage1Idx1_uid265_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = {seMsb_to4_uid263_b, rightShiftStage1Idx1Rng4_uid264_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b};

    // seMsb_to3_uid258(BITSELECT,257)@0
    assign seMsb_to3_uid258_in = $unsigned({{2{xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b[0]}}, xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b});
    assign seMsb_to3_uid258_b = $unsigned(seMsb_to3_uid258_in[2:0]);

    // rightShiftStage0Idx3Rng3_uid259_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITSELECT,258)@0
    assign rightShiftStage0Idx3Rng3_uid259_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b = $unsigned(in_4_imag_d_tpl[28:3]);

    // rightShiftStage0Idx3_uid260_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITJOIN,259)@0
    assign rightShiftStage0Idx3_uid260_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = {seMsb_to3_uid258_b, rightShiftStage0Idx3Rng3_uid259_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b};

    // seMsb_to2_uid255(BITSELECT,254)@0
    assign seMsb_to2_uid255_in = $unsigned({{1{xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b[0]}}, xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b});
    assign seMsb_to2_uid255_b = $unsigned(seMsb_to2_uid255_in[1:0]);

    // rightShiftStage0Idx2Rng2_uid256_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITSELECT,255)@0
    assign rightShiftStage0Idx2Rng2_uid256_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b = $unsigned(in_4_imag_d_tpl[28:2]);

    // rightShiftStage0Idx2_uid257_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITJOIN,256)@0
    assign rightShiftStage0Idx2_uid257_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = {seMsb_to2_uid255_b, rightShiftStage0Idx2Rng2_uid256_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b};

    // rightShiftStage0Idx1Rng1_uid253_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITSELECT,252)@0
    assign rightShiftStage0Idx1Rng1_uid253_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b = $unsigned(in_4_imag_d_tpl[28:1]);

    // rightShiftStage0Idx1_uid254_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITJOIN,253)@0
    assign rightShiftStage0Idx1_uid254_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = {xMSB_uid249_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b, rightShiftStage0Idx1Rng1_uid253_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b};

    // rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(MUX,261)@0
    assign rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s = rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_b;
    always @(rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s or in_4_imag_d_tpl or rightShiftStage0Idx1_uid254_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q or rightShiftStage0Idx2_uid257_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q or rightShiftStage0Idx3_uid260_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q)
    begin
        unique case (rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s)
            2'b00 : rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = in_4_imag_d_tpl;
            2'b01 : rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = rightShiftStage0Idx1_uid254_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
            2'b10 : rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = rightShiftStage0Idx2_uid257_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
            2'b11 : rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = rightShiftStage0Idx3_uid260_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
            default : rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = 29'b0;
        endcase
    end

    // rightShiftStage1_uid273_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(MUX,272)@0
    assign rightShiftStage1_uid273_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s = rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_c;
    always @(rightShiftStage1_uid273_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s or rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q or rightShiftStage1Idx1_uid265_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q or rightShiftStage1Idx2_uid268_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q or rightShiftStage1Idx3_uid271_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q)
    begin
        unique case (rightShiftStage1_uid273_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s)
            2'b00 : rightShiftStage1_uid273_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = rightShiftStage0_uid262_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
            2'b01 : rightShiftStage1_uid273_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = rightShiftStage1Idx1_uid265_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
            2'b10 : rightShiftStage1_uid273_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = rightShiftStage1Idx2_uid268_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
            2'b11 : rightShiftStage1_uid273_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = rightShiftStage1Idx3_uid271_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
            default : rightShiftStage1_uid273_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = 29'b0;
        endcase
    end

    // rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged(BITSELECT,319)@0
    assign rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_in = in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl[4:0];
    assign rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_b = rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_in[1:0];
    assign rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_c = rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_in[3:2];
    assign rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_d = rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_in[4:4];

    // rightShiftStage2_uid278_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(MUX,277)@0
    assign rightShiftStage2_uid278_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s = rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_d;
    always @(rightShiftStage2_uid278_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s or rightShiftStage1_uid273_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q or rightShiftStage2Idx1_uid276_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q)
    begin
        unique case (rightShiftStage2_uid278_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s)
            1'b0 : rightShiftStage2_uid278_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = rightShiftStage1_uid273_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
            1'b1 : rightShiftStage2_uid278_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = rightShiftStage2Idx1_uid276_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
            default : rightShiftStage2_uid278_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = 29'b0;
        endcase
    end

    // wIntCst_uid251_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(CONSTANT,250)
    assign wIntCst_uid251_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = $unsigned(5'b11101);

    // shiftedOut_uid252_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(COMPARE,251)@0
    assign shiftedOut_uid252_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_a = {2'b00, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl};
    assign shiftedOut_uid252_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b = {5'b00000, wIntCst_uid251_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q};
    assign shiftedOut_uid252_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_o = $unsigned(shiftedOut_uid252_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_a) - $unsigned(shiftedOut_uid252_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b);
    assign shiftedOut_uid252_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_n[0] = ~ (shiftedOut_uid252_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_o[9]);

    // r_uid281_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(MUX,280)@0
    assign r_uid281_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s = shiftedOut_uid252_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_n;
    always @(r_uid281_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s or rightShiftStage2_uid278_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q or shiftOutConstant_to29_uid279_b)
    begin
        unique case (r_uid281_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_s)
            1'b0 : r_uid281_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = rightShiftStage2_uid278_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q;
            1'b1 : r_uid281_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = shiftOutConstant_to29_uid279_b;
            default : r_uid281_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q = 29'b0;
        endcase
    end

    // shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x(BITSELECT,281)@0
    assign shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_in = $unsigned(r_uid281_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_q[15:0]);
    assign shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b = $unsigned(shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_in[15:0]);

    // redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_inputreg0(DELAY,361)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_inputreg0_q <= $unsigned(shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b);
        end
    end

    // redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_wraddr(COUNTER,363)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_wraddr_i <= $unsigned(redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_wraddr_q = redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_wraddr_i[1:0];

    // redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem(DUALMEM,362)
    assign redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_ia = $unsigned(redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_inputreg0_q);
    assign redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_aa = redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_wraddr_q;
    assign redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_ab = redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(4),
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
    ) redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_aa),
        .data_a(redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_ab),
        .q_b(redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_iq),
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
    assign redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_q = redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_iq[15:0];

    // redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_rdcnt(ADD,356)
    assign redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_rdcnt_a = {1'b0, redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_wraddr_q};
    assign redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_rdcnt_b = {1'b0, prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const6_x_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_rdcnt_o <= $unsigned(redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_rdcnt_a) + $unsigned(redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_rdcnt_b);
        end
    end
    assign redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_rdcnt_q = redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_rdcnt_o[2:0];

    // xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITSELECT,282)@0
    assign xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b = $unsigned(in_4_real_d_tpl[28:28]);

    // shiftOutConstant_to29_uid313(BITSELECT,312)@0
    assign shiftOutConstant_to29_uid313_in = $unsigned({{28{xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b[0]}}, xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b});
    assign shiftOutConstant_to29_uid313_b = $unsigned(shiftOutConstant_to29_uid313_in[28:0]);

    // seMsb_to16_uid308(BITSELECT,307)@0
    assign seMsb_to16_uid308_in = $unsigned({{15{xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b[0]}}, xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b});
    assign seMsb_to16_uid308_b = $unsigned(seMsb_to16_uid308_in[15:0]);

    // rightShiftStage2Idx1Rng16_uid309_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITSELECT,308)@0
    assign rightShiftStage2Idx1Rng16_uid309_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b = $unsigned(rightShiftStage1_uid307_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q[28:16]);

    // rightShiftStage2Idx1_uid310_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITJOIN,309)@0
    assign rightShiftStage2Idx1_uid310_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = {seMsb_to16_uid308_b, rightShiftStage2Idx1Rng16_uid309_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b};

    // seMsb_to12_uid303(BITSELECT,302)@0
    assign seMsb_to12_uid303_in = $unsigned({{11{xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b[0]}}, xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b});
    assign seMsb_to12_uid303_b = $unsigned(seMsb_to12_uid303_in[11:0]);

    // rightShiftStage1Idx3Rng12_uid304_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITSELECT,303)@0
    assign rightShiftStage1Idx3Rng12_uid304_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b = $unsigned(rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q[28:12]);

    // rightShiftStage1Idx3_uid305_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITJOIN,304)@0
    assign rightShiftStage1Idx3_uid305_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = {seMsb_to12_uid303_b, rightShiftStage1Idx3Rng12_uid304_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b};

    // seMsb_to8_uid300(BITSELECT,299)@0
    assign seMsb_to8_uid300_in = $unsigned({{7{xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b[0]}}, xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b});
    assign seMsb_to8_uid300_b = $unsigned(seMsb_to8_uid300_in[7:0]);

    // rightShiftStage1Idx2Rng8_uid301_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITSELECT,300)@0
    assign rightShiftStage1Idx2Rng8_uid301_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b = $unsigned(rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q[28:8]);

    // rightShiftStage1Idx2_uid302_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITJOIN,301)@0
    assign rightShiftStage1Idx2_uid302_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = {seMsb_to8_uid300_b, rightShiftStage1Idx2Rng8_uid301_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b};

    // seMsb_to4_uid297(BITSELECT,296)@0
    assign seMsb_to4_uid297_in = $unsigned({{3{xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b[0]}}, xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b});
    assign seMsb_to4_uid297_b = $unsigned(seMsb_to4_uid297_in[3:0]);

    // rightShiftStage1Idx1Rng4_uid298_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITSELECT,297)@0
    assign rightShiftStage1Idx1Rng4_uid298_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b = $unsigned(rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q[28:4]);

    // rightShiftStage1Idx1_uid299_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITJOIN,298)@0
    assign rightShiftStage1Idx1_uid299_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = {seMsb_to4_uid297_b, rightShiftStage1Idx1Rng4_uid298_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b};

    // seMsb_to3_uid292(BITSELECT,291)@0
    assign seMsb_to3_uid292_in = $unsigned({{2{xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b[0]}}, xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b});
    assign seMsb_to3_uid292_b = $unsigned(seMsb_to3_uid292_in[2:0]);

    // rightShiftStage0Idx3Rng3_uid293_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITSELECT,292)@0
    assign rightShiftStage0Idx3Rng3_uid293_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b = $unsigned(in_4_real_d_tpl[28:3]);

    // rightShiftStage0Idx3_uid294_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITJOIN,293)@0
    assign rightShiftStage0Idx3_uid294_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = {seMsb_to3_uid292_b, rightShiftStage0Idx3Rng3_uid293_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b};

    // seMsb_to2_uid289(BITSELECT,288)@0
    assign seMsb_to2_uid289_in = $unsigned({{1{xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b[0]}}, xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b});
    assign seMsb_to2_uid289_b = $unsigned(seMsb_to2_uid289_in[1:0]);

    // rightShiftStage0Idx2Rng2_uid290_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITSELECT,289)@0
    assign rightShiftStage0Idx2Rng2_uid290_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b = $unsigned(in_4_real_d_tpl[28:2]);

    // rightShiftStage0Idx2_uid291_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITJOIN,290)@0
    assign rightShiftStage0Idx2_uid291_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = {seMsb_to2_uid289_b, rightShiftStage0Idx2Rng2_uid290_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b};

    // rightShiftStage0Idx1Rng1_uid287_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITSELECT,286)@0
    assign rightShiftStage0Idx1Rng1_uid287_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b = $unsigned(in_4_real_d_tpl[28:1]);

    // rightShiftStage0Idx1_uid288_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITJOIN,287)@0
    assign rightShiftStage0Idx1_uid288_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = {xMSB_uid283_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b, rightShiftStage0Idx1Rng1_uid287_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b};

    // rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(MUX,295)@0
    assign rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s = rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_b;
    always @(rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s or in_4_real_d_tpl or rightShiftStage0Idx1_uid288_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q or rightShiftStage0Idx2_uid291_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q or rightShiftStage0Idx3_uid294_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q)
    begin
        unique case (rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s)
            2'b00 : rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = in_4_real_d_tpl;
            2'b01 : rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = rightShiftStage0Idx1_uid288_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
            2'b10 : rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = rightShiftStage0Idx2_uid291_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
            2'b11 : rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = rightShiftStage0Idx3_uid294_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
            default : rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = 29'b0;
        endcase
    end

    // rightShiftStage1_uid307_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(MUX,306)@0
    assign rightShiftStage1_uid307_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s = rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_c;
    always @(rightShiftStage1_uid307_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s or rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q or rightShiftStage1Idx1_uid299_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q or rightShiftStage1Idx2_uid302_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q or rightShiftStage1Idx3_uid305_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q)
    begin
        unique case (rightShiftStage1_uid307_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s)
            2'b00 : rightShiftStage1_uid307_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = rightShiftStage0_uid296_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
            2'b01 : rightShiftStage1_uid307_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = rightShiftStage1Idx1_uid299_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
            2'b10 : rightShiftStage1_uid307_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = rightShiftStage1Idx2_uid302_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
            2'b11 : rightShiftStage1_uid307_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = rightShiftStage1Idx3_uid305_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
            default : rightShiftStage1_uid307_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = 29'b0;
        endcase
    end

    // rightShiftStage2_uid312_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(MUX,311)@0
    assign rightShiftStage2_uid312_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s = rightShiftStageSel0Dto0_uid261_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_bit_select_merged_d;
    always @(rightShiftStage2_uid312_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s or rightShiftStage1_uid307_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q or rightShiftStage2Idx1_uid310_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q)
    begin
        unique case (rightShiftStage2_uid312_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s)
            1'b0 : rightShiftStage2_uid312_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = rightShiftStage1_uid307_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
            1'b1 : rightShiftStage2_uid312_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = rightShiftStage2Idx1_uid310_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
            default : rightShiftStage2_uid312_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = 29'b0;
        endcase
    end

    // r_uid315_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(MUX,314)@0
    assign r_uid315_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s = shiftedOut_uid252_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_n;
    always @(r_uid315_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s or rightShiftStage2_uid312_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q or shiftOutConstant_to29_uid313_b)
    begin
        unique case (r_uid315_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_s)
            1'b0 : r_uid315_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = rightShiftStage2_uid312_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q;
            1'b1 : r_uid315_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = shiftOutConstant_to29_uid313_b;
            default : r_uid315_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q = 29'b0;
        endcase
    end

    // shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x(BITSELECT,315)@0
    assign shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_in = $unsigned(r_uid315_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_q[15:0]);
    assign shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b = $unsigned(shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_in[15:0]);

    // redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_inputreg0(DELAY,352)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_inputreg0_q <= $unsigned(shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b);
        end
    end

    // redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_wraddr(COUNTER,354)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_wraddr_i <= $unsigned(redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_wraddr_q = redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_wraddr_i[1:0];

    // redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem(DUALMEM,353)
    assign redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_ia = $unsigned(redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_inputreg0_q);
    assign redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_aa = redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_wraddr_q;
    assign redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_ab = redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(4),
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
    ) redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_aa),
        .data_a(redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_ab),
        .q_b(redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_iq),
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
    assign redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_q = redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_iq[15:0];

    // redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_offset(CONSTANT,376)
    assign redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_offset_q = $unsigned(3'b101);

    // redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_rdcnt(ADD,377)
    assign redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_rdcnt_a = {1'b0, redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_wraddr_q};
    assign redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_rdcnt_b = {1'b0, redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_rdcnt_o <= $unsigned(redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_rdcnt_a) + $unsigned(redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_rdcnt_b);
        end
    end
    assign redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_rdcnt_q = redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_rdcnt_o[3:0];

    // redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_wraddr(COUNTER,375)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_wraddr_i <= $unsigned(redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_wraddr_q = redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_wraddr_i[2:0];

    // redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem(DUALMEM,374)
    assign redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_ia = $unsigned(in_2_chin_tpl);
    assign redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_aa = redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_wraddr_q;
    assign redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_ab = redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_rdcnt_q[2:0];
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
    ) redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_aa),
        .data_a(redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_ab),
        .q_b(redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_iq),
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
    assign redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_q = redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_iq[7:0];

    // redist20_ChannelIn_cunroll_x_in_1_vin_tpl_6(DELAY,347)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist20_ChannelIn_cunroll_x_in_1_vin_tpl_6_delay_0 <= $unsigned(redist19_ChannelIn_cunroll_x_in_1_vin_tpl_2_q);
            redist20_ChannelIn_cunroll_x_in_1_vin_tpl_6_delay_1 <= redist20_ChannelIn_cunroll_x_in_1_vin_tpl_6_delay_0;
            redist20_ChannelIn_cunroll_x_in_1_vin_tpl_6_delay_2 <= redist20_ChannelIn_cunroll_x_in_1_vin_tpl_6_delay_1;
            redist20_ChannelIn_cunroll_x_in_1_vin_tpl_6_q <= redist20_ChannelIn_cunroll_x_in_1_vin_tpl_6_delay_2;
        end
    end

    // ChannelOut_cunroll_x(PORTOUT,21)@6 + 1
    assign out_1_qv_tpl = redist20_ChannelIn_cunroll_x_in_1_vin_tpl_6_q;
    assign out_2_qch_tpl = redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_q;
    assign out_3_real_q_tpl = redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_q;
    assign out_3_imag_q_tpl = redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_q;
    assign out_4_qv139_tpl = And1_q;
    assign out_5_FreqBinIdx_tpl = Sub_q;

    // redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_offset(CONSTANT,372)
    assign redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_offset_q = $unsigned(4'b1000);

    // redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_rdcnt(ADD,373)
    assign redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_rdcnt_a = {1'b0, redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_wraddr_q};
    assign redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_rdcnt_b = {1'b0, redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_rdcnt_o <= $unsigned(redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_rdcnt_a) + $unsigned(redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_rdcnt_b);
        end
    end
    assign redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_rdcnt_q = redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_rdcnt_o[4:0];

    // CmpEQ(LOGICAL,17)@0
    assign CmpEQ_q = $unsigned(Const_rsrvd_fix_q == in_2_chin_tpl ? 1'b1 : 1'b0);

    // And_rsrvd_fix(LOGICAL,15)@0
    assign And_rsrvd_fix_q = CmpEQ_q & in_1_vin_tpl;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x(MUX,93)@0 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_s = And_rsrvd_fix_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q <= 29'b0;
        end
        else
        begin
            unique case (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_s)
                1'b0 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q <= prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q;
                1'b1 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q <= in_6_TimeReference_tpl;
                default : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q <= 29'b0;
            endcase
        end
    end

    // redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_wraddr(COUNTER,371)
    // low=0, high=15, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_wraddr_i <= $unsigned(redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_wraddr_i) + $unsigned(4'd1);
        end
    end
    assign redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_wraddr_q = redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_wraddr_i[3:0];

    // redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem(DUALMEM,370)
    assign redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_ia = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q);
    assign redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_aa = redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_wraddr_q;
    assign redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_ab = redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_rdcnt_q[3:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(29),
        .widthad_a(4),
        .numwords_a(16),
        .width_b(29),
        .widthad_b(4),
        .numwords_b(16),
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
    ) redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_aa),
        .data_a(redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_ab),
        .q_b(redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_iq),
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
    assign redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_q = redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_iq[28:0];

    // redist22_ChannelIn_cunroll_x_in_2_chin_tpl_10(DELAY,349)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist22_ChannelIn_cunroll_x_in_2_chin_tpl_10_delay_0 <= $unsigned(redist21_ChannelIn_cunroll_x_in_2_chin_tpl_6_mem_q);
            redist22_ChannelIn_cunroll_x_in_2_chin_tpl_10_delay_1 <= redist22_ChannelIn_cunroll_x_in_2_chin_tpl_10_delay_0;
            redist22_ChannelIn_cunroll_x_in_2_chin_tpl_10_delay_2 <= redist22_ChannelIn_cunroll_x_in_2_chin_tpl_10_delay_1;
            redist22_ChannelIn_cunroll_x_in_2_chin_tpl_10_q <= redist22_ChannelIn_cunroll_x_in_2_chin_tpl_10_delay_2;
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitExtract_x(BITSELECT,28)@10
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitExtract_x_b = redist22_ChannelIn_cunroll_x_in_2_chin_tpl_10_q[0:0];

    // redist14_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_q_1(DELAY,341)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist14_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist14_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_q_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const1_x(CONSTANT,30)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const1_x_q = $unsigned(8'b10001001);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x(COUNTER,33)@6 + 1
    // low=0, high=138, step=1, init=138
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_i <= 8'd138;
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_eq <= 1'b1;
        end
        else if (And1_q == 1'b1)
        begin
            if (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_i == 8'd137)
            begin
                prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_eq <= 1'b1;
            end
            else
            begin
                prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_eq <= 1'b0;
            end
            if (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_eq == 1'b1)
            begin
                prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_i <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_i) + $unsigned(8'd118);
            end
            else
            begin
                prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_i <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_i) + $unsigned(8'd1);
            end
        end
    end
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_i[7:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_CmpEQ_x(LOGICAL,29)@7 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_CmpEQ_x_qi = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter_x_q == prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const1_x_q ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_CmpEQ_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_CmpEQ_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_CmpEQ_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_latch_0L_Mux_x(MUX,49)@7 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_latch_0L_Mux_x_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_CmpEQ_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_latch_0L_Mux_x_q <= 1'b0;
        end
        else
        begin
            unique case (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_latch_0L_Mux_x_s)
                1'b0 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_latch_0L_Mux_x_q <= prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_latch_0L_Mux_x_q;
                1'b1 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_latch_0L_Mux_x_q <= prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_CmpEQ_x_q;
                default : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_latch_0L_Mux_x_q <= 1'b0;
            endcase
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const2_x(CONSTANT,31)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const2_x_q = $unsigned(8'b10010000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Const5_x(CONSTANT,45)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Const5_x_q = $unsigned(2'b11);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_BitExtract_x(BITSELECT,42)@7
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_BitExtract_x_b = $unsigned(redist7_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q[8:8]);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Mux_x(MUX,47)@7
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Mux_x_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_BitExtract_x_b;
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Mux_x_s or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Const5_x_q or GND_q)
    begin
        unique case (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Mux_x_s)
            1'b0 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Mux_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Const5_x_q;
            1'b1 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Mux_x_q = {1'b0, GND_q};
            default : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Mux_x_q = 2'b0;
        endcase
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x(ADD,39)@7
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_a = $unsigned({{2{redist7_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q[8]}}, redist7_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q});
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_b = $unsigned({{9{prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Mux_x_q[1]}}, prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_Mux_x_q});
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_i = $unsigned({3'b000, prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const2_x_q});
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_a1 = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_CmpEQ_x_q == 1'b1 ? prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_i : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_a;
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_b1 = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_CmpEQ_x_q == 1'b1 ? 11'b0 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_b;
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_o = $unsigned($signed(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_a1) + $signed(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_b1));
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_o[9:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x(BITSELECT,105)@7
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_x_q[8:0]);

    // redist7_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1(DELAY,334)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist7_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist7_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_CmpGE_x(COMPARE,43)@8
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_CmpGE_x_a = $unsigned({{2{redist7_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q[8]}}, redist7_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q});
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_CmpGE_x_b = $unsigned({10'b0000000000, VCC_q});
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_CmpGE_x_o = $unsigned($signed(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_CmpGE_x_a) - $signed(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_CmpGE_x_b));
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_CmpGE_x_n[0] = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_CmpGE_x_o[10]);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x(LOGICAL,41)@8 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_qi = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_CmpGE_x_n & prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_latch_0L_Mux_x_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist15_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_2(DELAY,342)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist15_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_2_q <= '0;
        end
        else
        begin
            redist15_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_2_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_Not1_x(LOGICAL,51)@10
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_Not1_x_q = ~ (redist15_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_2_q);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x(MUX,52)@10
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_Not1_x_q;
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_s or redist14_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_q_1_q or prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitExtract_x_b)
    begin
        unique case (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_s)
            1'b0 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_q = redist14_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_q_1_q;
            1'b1 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitExtract_x_b;
            default : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_q = 1'b0;
        endcase
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x(COUNTER,34)@9 + 1
    // low=0, high=143, step=1, init=143
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_i <= 8'd143;
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_eq <= 1'b1;
        end
        else if (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q == 1'b1)
        begin
            if (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_i == 8'd142)
            begin
                prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_eq <= 1'b1;
            end
            else
            begin
                prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_eq <= 1'b0;
            end
            if (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_eq == 1'b1)
            begin
                prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_i <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_i) + $unsigned(8'd113);
            end
            else
            begin
                prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_i <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_i) + $unsigned(8'd1);
            end
        end
    end
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_i[7:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitCombine1_x(BITJOIN,27)@10
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitCombine1_x_q = {prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_channel_latch_latch_0L_Mux_x_q, prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Counter1_x_q};

    // redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_offset(CONSTANT,359)
    assign redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_offset_q = $unsigned(2'b11);

    // redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_rdcnt(ADD,369)
    assign redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_rdcnt_a = {1'b0, redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_wraddr_q};
    assign redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_rdcnt_b = {1'b0, redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_rdcnt_o <= $unsigned(redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_rdcnt_a) + $unsigned(redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_rdcnt_b);
        end
    end
    assign redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_rdcnt_q = redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_rdcnt_o[2:0];

    // redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_wraddr(COUNTER,367)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_wraddr_i <= $unsigned(redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_wraddr_q = redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_wraddr_i[1:0];

    // redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem(DUALMEM,366)
    assign redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_ia = $unsigned(redist3_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_6_mem_q);
    assign redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_aa = redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_wraddr_q;
    assign redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_ab = redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(4),
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
    ) redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_aa),
        .data_a(redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_ab),
        .q_b(redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_iq),
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
    assign redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_q = redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_iq[15:0];

    // redist23_And1_q_4(DELAY,350)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist23_And1_q_4_delay_0 <= '0;
        end
        else
        begin
            redist23_And1_q_4_delay_0 <= $unsigned(And1_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist23_And1_q_4_delay_1 <= redist23_And1_q_4_delay_0;
            redist23_And1_q_4_delay_2 <= redist23_And1_q_4_delay_1;
            redist23_And1_q_4_q <= redist23_And1_q_4_delay_2;
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x(BITSELECT,102)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b = $unsigned(Sub_q[7:0]);

    // redist8_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b_4(DELAY,335)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b_4_delay_0 <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b);
            redist8_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b_4_delay_1 <= redist8_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b_4_delay_0;
            redist8_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b_4_delay_2 <= redist8_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b_4_delay_1;
            redist8_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b_4_q <= redist8_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b_4_delay_2;
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_x(ADD,24)@10
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_x_a = {1'b0, redist8_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Convert_sel_x_b_4_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_x_b = {7'b0000000, prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Const6_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_x_a) + $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_x_o[8:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_PostCast_primWireOut_sel_x(BITSELECT,101)@10
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_PostCast_primWireOut_sel_x_b = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_x_q[7:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitCombine_x(BITJOIN,26)@10
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitCombine_x_q = {prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitExtract_x_b, prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_Add_PostCast_primWireOut_sel_x_b};

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x(DUALMEM,103)@10 + 2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_ia = $unsigned(redist4_shifter_uid282_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_imag_x_b_10_mem_q);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_aa = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitCombine_x_q;
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_ab = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitCombine1_x_q;
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_ena_NotRstA = ~ (areset);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(9),
        .numwords_a(512),
        .width_b(16),
        .widthad_b(9),
        .numwords_b(512),
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
        .intended_device_family("Agilex 7")
    ) prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_dmem (
        .clocken0(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_ena_NotRstA),
        .sclr(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_reset0),
        .clock0(clk),
        .address_a(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_aa),
        .data_a(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_ia),
        .wren_a(redist23_And1_q_4_q[0]),
        .address_b(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_ab),
        .q_b(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_iq[15:0];

    // redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_rdcnt(ADD,360)
    assign redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_rdcnt_a = {1'b0, redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_wraddr_q};
    assign redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_rdcnt_b = {1'b0, redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_rdcnt_o <= $unsigned(redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_rdcnt_a) + $unsigned(redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_rdcnt_b);
        end
    end
    assign redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_rdcnt_q = redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_rdcnt_o[2:0];

    // redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_wraddr(COUNTER,358)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_wraddr_i <= $unsigned(redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_wraddr_q = redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_wraddr_i[1:0];

    // redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem(DUALMEM,357)
    assign redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_ia = $unsigned(redist1_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_6_mem_q);
    assign redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_aa = redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_wraddr_q;
    assign redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_ab = redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(4),
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
    ) redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_aa),
        .data_a(redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_ab),
        .q_b(redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_iq),
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
    assign redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_q = redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_iq[15:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x(DUALMEM,104)@10 + 2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_ia = $unsigned(redist2_shifter_uid316_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_Shift_real_x_b_10_mem_q);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_aa = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitCombine_x_q;
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_ab = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_BitCombine1_x_q;
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_ena_NotRstA = ~ (areset);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(9),
        .numwords_a(512),
        .width_b(16),
        .widthad_b(9),
        .numwords_b(512),
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
        .intended_device_family("Agilex 7")
    ) prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_dmem (
        .clocken0(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_ena_NotRstA),
        .sclr(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_reset0),
        .clock0(clk),
        .address_a(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_aa),
        .data_a(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_ia),
        .wren_a(redist23_And1_q_4_q[0]),
        .address_b(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_ab),
        .q_b(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_iq[15:0];

    // redist16_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_3(DELAY,343)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist16_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_3_q <= $unsigned(redist15_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_2_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_RisingEdgeDetect_Not_x(LOGICAL,37)@10
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_RisingEdgeDetect_Not_x_q = ~ (redist16_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_3_q);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_RisingEdgeDetect_And3_x(LOGICAL,36)@10
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_RisingEdgeDetect_And3_x_q = redist15_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_2_q & prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_RisingEdgeDetect_Not_x_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x(MUX,54)@10 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_RisingEdgeDetect_And3_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x_q <= 8'b0;
        end
        else
        begin
            unique case (prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x_s)
                1'b0 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x_q <= prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x_q;
                1'b1 : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x_q <= redist22_ChannelIn_cunroll_x_in_2_chin_tpl_10_q;
                default : prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x_q <= 8'b0;
            endcase
        end
    end

    // redist13_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x_q_2(DELAY,340)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x_q_2_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x_q);
        end
    end

    // redist17_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_4(DELAY,344)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist17_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_4_q <= $unsigned(redist16_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_3_q);
        end
    end

    // ChannelOut1_cunroll_x(PORTOUT,22)@12 + 1
    assign out_6_vout_FFTshift_tpl = redist17_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_StretchPulse_And_x_q_4_q;
    assign out_7_cout_FFTshift_tpl = redist13_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_latch_0L_Mux_x_q_2_q;
    assign out_8_real_dout_FFTshift_tpl = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_real_x_q;
    assign out_8_imag_dout_FFTshift_tpl = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_FFT_Shift_MemArray_imag_x_q;
    assign out_9_Tref_tpl = redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_latch_0L_Mux_x_q_12_mem_q;

endmodule
