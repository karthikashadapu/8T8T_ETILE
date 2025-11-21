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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate (
    input wire [0:0] in_1_v_tpl,
    input wire [7:0] in_2_c_tpl,
    input wire [15:0] in_3_real_d1_tpl,
    input wire [15:0] in_3_imag_d1_tpl,
    input wire [15:0] in_4_Tsym1_tpl,
    input wire [15:0] in_5_cp_T1_tpl,
    input wire [0:0] in_6_CP_EN1_tpl,
    input wire [63:0] in_7_fft_size_tpl,
    input wire [63:0] in_8_CPLen_tpl,
    input wire [63:0] in_9_nsc_tpl,
    input wire [1:0] in_10_eAxC_tpl,
    input wire [63:0] in_11_sym_metadata_tpl,
    input wire [63:0] in_12_ul_timerefin_tpl,
    output wire [0:0] out_2_vout_tpl,
    output wire [7:0] out_3_cout_tpl,
    output wire [15:0] out_1_real_dout1_tpl,
    output wire [15:0] out_1_imag_dout1_tpl,
    output wire [17:0] out_4_sin_tpl,
    output wire [17:0] out_5_cos_tpl,
    output wire [63:0] out_6_fft_size_out_tpl,
    output wire [63:0] out_7_CPLenout_tpl,
    output wire [63:0] out_8_nsc_out_tpl,
    output wire [1:0] out_9_eAxC_out_tpl,
    output wire [63:0] out_10_sym_metadata_out_tpl,
    output wire [63:0] out_11_ul_timeref_out_tpl,
    input wire [31:0] in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl,
    input wire [0:0] in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl,
    input wire [31:0] in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl,
    input wire [0:0] in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [0:0] And_rsrvd_fix_q;
    wire [63:0] BitCombine_q;
    wire [0:0] ChooseBits_a;
    wire [0:0] ChooseBits_q;
    wire [33:0] CmpGE_a;
    wire [33:0] CmpGE_b;
    logic [33:0] CmpGE_o;
    wire [0:0] CmpGE_n;
    wire [15:0] Const1_q;
    wire [15:0] Const2_q;
    wire [15:0] Const5_q;
    reg [50:0] Lut1_q;
    wire [0:0] Mux1_s;
    reg [32:0] Mux1_q;
    wire [39:0] Convert1_sel_x_b;
    wire [15:0] Convert3_sel_x_b;
    wire [15:0] Convert5_sel_x_b;
    wire [31:0] CmpGE_PreShift_1_q;
    wire [31:0] CmpGE_PreShift_1_qint;
    wire [31:0] Sub_PreShift_1_q;
    wire [31:0] Sub_PreShift_1_qint;
    wire [28:0] Mux1_PreShift_0_q;
    wire [28:0] Mux1_PreShift_0_qint;
    wire [15:0] CORDIC_CnstNegPiOv2_q;
    wire [17:0] CORDIC_CmpPiOv2_00_a;
    wire [17:0] CORDIC_CmpPiOv2_00_b;
    logic [17:0] CORDIC_CmpPiOv2_00_o;
    wire [0:0] CORDIC_CmpPiOv2_00_c;
    wire [17:0] CORDIC_CmpNegPiOv2_00_a;
    wire [17:0] CORDIC_CmpNegPiOv2_00_b;
    logic [17:0] CORDIC_CmpNegPiOv2_00_o;
    wire [0:0] CORDIC_CmpNegPiOv2_00_c;
    wire [0:0] CORDIC_AorB_00_qi;
    reg [0:0] CORDIC_AorB_00_q;
    wire [15:0] CORDIC_CnstAtan_s0_q;
    wire [0:0] CORDIC_CmpPGeZero_s0_q;
    wire [0:0] CORDIC_CmpPLtZero_s0_q;
    wire [18:0] CORDIC_Yout_s0_a;
    wire [18:0] CORDIC_Yout_s0_b;
    logic [18:0] CORDIC_Yout_s0_o;
    wire [0:0] CORDIC_Yout_s0_s;
    wire [17:0] CORDIC_Yout_s0_q;
    wire [18:0] CORDIC_Pout_s0_a;
    wire [18:0] CORDIC_Pout_s0_b;
    logic [18:0] CORDIC_Pout_s0_o;
    wire [0:0] CORDIC_Pout_s0_s;
    wire [17:0] CORDIC_Pout_s0_q;
    wire [15:0] CORDIC_CnstAtan_s1_q;
    wire [0:0] CORDIC_CmpPGeZero_s1_q;
    wire [0:0] CORDIC_CmpPLtZero_s1_q;
    wire [16:0] CORDIC_ShiftY_s1_b;
    wire [18:0] CORDIC_Xout_s1_a;
    wire [18:0] CORDIC_Xout_s1_b;
    logic [18:0] CORDIC_Xout_s1_o;
    wire [0:0] CORDIC_Xout_s1_s;
    wire [17:0] CORDIC_Xout_s1_q;
    wire [18:0] CORDIC_Yout_s1_a;
    wire [18:0] CORDIC_Yout_s1_b;
    logic [18:0] CORDIC_Yout_s1_o;
    wire [0:0] CORDIC_Yout_s1_s;
    wire [17:0] CORDIC_Yout_s1_q;
    wire [18:0] CORDIC_Pout_s1_a;
    wire [18:0] CORDIC_Pout_s1_b;
    logic [18:0] CORDIC_Pout_s1_o;
    wire [0:0] CORDIC_Pout_s1_s;
    wire [17:0] CORDIC_Pout_s1_q;
    wire [15:0] CORDIC_CnstAtan_s2_q;
    wire [0:0] CORDIC_CmpPGeZero_s2_q;
    wire [0:0] CORDIC_CmpPLtZero_s2_q;
    wire [15:0] CORDIC_ShiftX_s2_b;
    wire [15:0] CORDIC_ShiftY_s2_b;
    wire [18:0] CORDIC_Xout_s2_a;
    wire [18:0] CORDIC_Xout_s2_b;
    logic [18:0] CORDIC_Xout_s2_o;
    wire [0:0] CORDIC_Xout_s2_s;
    wire [17:0] CORDIC_Xout_s2_q;
    wire [18:0] CORDIC_Yout_s2_a;
    wire [18:0] CORDIC_Yout_s2_b;
    logic [18:0] CORDIC_Yout_s2_o;
    wire [0:0] CORDIC_Yout_s2_s;
    wire [17:0] CORDIC_Yout_s2_q;
    wire [18:0] CORDIC_Pout_s2_a;
    wire [18:0] CORDIC_Pout_s2_b;
    logic [18:0] CORDIC_Pout_s2_o;
    wire [0:0] CORDIC_Pout_s2_s;
    wire [17:0] CORDIC_Pout_s2_q;
    wire [15:0] CORDIC_CnstAtan_s3_q;
    wire [0:0] CORDIC_CmpPGeZero_s3_q;
    wire [0:0] CORDIC_CmpPLtZero_s3_q;
    wire [14:0] CORDIC_ShiftX_s3_b;
    wire [14:0] CORDIC_ShiftY_s3_b;
    wire [18:0] CORDIC_Xout_s3_a;
    wire [18:0] CORDIC_Xout_s3_b;
    logic [18:0] CORDIC_Xout_s3_o;
    wire [0:0] CORDIC_Xout_s3_s;
    wire [17:0] CORDIC_Xout_s3_q;
    wire [18:0] CORDIC_Yout_s3_a;
    wire [18:0] CORDIC_Yout_s3_b;
    logic [18:0] CORDIC_Yout_s3_o;
    wire [0:0] CORDIC_Yout_s3_s;
    wire [17:0] CORDIC_Yout_s3_q;
    wire [18:0] CORDIC_Pout_s3_a;
    wire [18:0] CORDIC_Pout_s3_b;
    logic [18:0] CORDIC_Pout_s3_o;
    wire [0:0] CORDIC_Pout_s3_s;
    wire [17:0] CORDIC_Pout_s3_q;
    wire [15:0] CORDIC_CnstAtan_s4_q;
    wire [0:0] CORDIC_CmpPGeZero_s4_q;
    wire [0:0] CORDIC_CmpPLtZero_s4_q;
    wire [13:0] CORDIC_ShiftX_s4_b;
    wire [13:0] CORDIC_ShiftY_s4_b;
    wire [18:0] CORDIC_Xout_s4_a;
    wire [18:0] CORDIC_Xout_s4_b;
    logic [18:0] CORDIC_Xout_s4_o;
    wire [0:0] CORDIC_Xout_s4_s;
    wire [17:0] CORDIC_Xout_s4_q;
    wire [18:0] CORDIC_Yout_s4_a;
    wire [18:0] CORDIC_Yout_s4_b;
    logic [18:0] CORDIC_Yout_s4_o;
    wire [0:0] CORDIC_Yout_s4_s;
    wire [17:0] CORDIC_Yout_s4_q;
    wire [18:0] CORDIC_Pout_s4_a;
    wire [18:0] CORDIC_Pout_s4_b;
    logic [18:0] CORDIC_Pout_s4_o;
    wire [0:0] CORDIC_Pout_s4_s;
    wire [17:0] CORDIC_Pout_s4_q;
    wire [15:0] CORDIC_CnstAtan_s5_q;
    wire [0:0] CORDIC_CmpPGeZero_s5_q;
    wire [0:0] CORDIC_CmpPLtZero_s5_q;
    wire [12:0] CORDIC_ShiftX_s5_b;
    wire [12:0] CORDIC_ShiftY_s5_b;
    wire [18:0] CORDIC_Xout_s5_a;
    wire [18:0] CORDIC_Xout_s5_b;
    logic [18:0] CORDIC_Xout_s5_o;
    wire [0:0] CORDIC_Xout_s5_s;
    wire [17:0] CORDIC_Xout_s5_q;
    wire [18:0] CORDIC_Yout_s5_a;
    wire [18:0] CORDIC_Yout_s5_b;
    logic [18:0] CORDIC_Yout_s5_o;
    wire [0:0] CORDIC_Yout_s5_s;
    wire [17:0] CORDIC_Yout_s5_q;
    wire [18:0] CORDIC_Pout_s5_a;
    wire [18:0] CORDIC_Pout_s5_b;
    logic [18:0] CORDIC_Pout_s5_o;
    wire [0:0] CORDIC_Pout_s5_s;
    wire [17:0] CORDIC_Pout_s5_q;
    wire [15:0] CORDIC_CnstAtan_s6_q;
    wire [0:0] CORDIC_CmpPGeZero_s6_q;
    wire [0:0] CORDIC_CmpPLtZero_s6_q;
    wire [11:0] CORDIC_ShiftX_s6_b;
    wire [11:0] CORDIC_ShiftY_s6_b;
    wire [18:0] CORDIC_Xout_s6_a;
    wire [18:0] CORDIC_Xout_s6_b;
    logic [18:0] CORDIC_Xout_s6_o;
    wire [0:0] CORDIC_Xout_s6_s;
    wire [17:0] CORDIC_Xout_s6_q;
    wire [18:0] CORDIC_Yout_s6_a;
    wire [18:0] CORDIC_Yout_s6_b;
    logic [18:0] CORDIC_Yout_s6_o;
    wire [0:0] CORDIC_Yout_s6_s;
    wire [17:0] CORDIC_Yout_s6_q;
    wire [18:0] CORDIC_Pout_s6_a;
    wire [18:0] CORDIC_Pout_s6_b;
    logic [18:0] CORDIC_Pout_s6_o;
    wire [0:0] CORDIC_Pout_s6_s;
    wire [17:0] CORDIC_Pout_s6_q;
    wire [15:0] CORDIC_CnstAtan_s7_q;
    wire [0:0] CORDIC_CmpPGeZero_s7_q;
    wire [0:0] CORDIC_CmpPLtZero_s7_q;
    wire [10:0] CORDIC_ShiftX_s7_b;
    wire [10:0] CORDIC_ShiftY_s7_b;
    wire [18:0] CORDIC_Xout_s7_a;
    wire [18:0] CORDIC_Xout_s7_b;
    logic [18:0] CORDIC_Xout_s7_o;
    wire [0:0] CORDIC_Xout_s7_s;
    wire [17:0] CORDIC_Xout_s7_q;
    wire [18:0] CORDIC_Yout_s7_a;
    wire [18:0] CORDIC_Yout_s7_b;
    logic [18:0] CORDIC_Yout_s7_o;
    wire [0:0] CORDIC_Yout_s7_s;
    wire [17:0] CORDIC_Yout_s7_q;
    wire [18:0] CORDIC_Pout_s7_a;
    wire [18:0] CORDIC_Pout_s7_b;
    logic [18:0] CORDIC_Pout_s7_o;
    wire [0:0] CORDIC_Pout_s7_s;
    wire [17:0] CORDIC_Pout_s7_q;
    wire [15:0] CORDIC_CnstAtan_s8_q;
    wire [0:0] CORDIC_CmpPGeZero_s8_q;
    wire [0:0] CORDIC_CmpPLtZero_s8_q;
    wire [9:0] CORDIC_ShiftX_s8_b;
    wire [9:0] CORDIC_ShiftY_s8_b;
    wire [18:0] CORDIC_Xout_s8_a;
    wire [18:0] CORDIC_Xout_s8_b;
    logic [18:0] CORDIC_Xout_s8_o;
    wire [0:0] CORDIC_Xout_s8_s;
    wire [17:0] CORDIC_Xout_s8_q;
    wire [18:0] CORDIC_Yout_s8_a;
    wire [18:0] CORDIC_Yout_s8_b;
    logic [18:0] CORDIC_Yout_s8_o;
    wire [0:0] CORDIC_Yout_s8_s;
    wire [17:0] CORDIC_Yout_s8_q;
    wire [18:0] CORDIC_Pout_s8_a;
    wire [18:0] CORDIC_Pout_s8_b;
    logic [18:0] CORDIC_Pout_s8_o;
    wire [0:0] CORDIC_Pout_s8_s;
    wire [17:0] CORDIC_Pout_s8_q;
    wire [15:0] CORDIC_CnstAtan_s9_q;
    wire [0:0] CORDIC_CmpPGeZero_s9_q;
    wire [0:0] CORDIC_CmpPLtZero_s9_q;
    wire [8:0] CORDIC_ShiftX_s9_b;
    wire [8:0] CORDIC_ShiftY_s9_b;
    wire [18:0] CORDIC_Xout_s9_a;
    wire [18:0] CORDIC_Xout_s9_b;
    logic [18:0] CORDIC_Xout_s9_o;
    wire [0:0] CORDIC_Xout_s9_s;
    wire [17:0] CORDIC_Xout_s9_q;
    wire [18:0] CORDIC_Yout_s9_a;
    wire [18:0] CORDIC_Yout_s9_b;
    logic [18:0] CORDIC_Yout_s9_o;
    wire [0:0] CORDIC_Yout_s9_s;
    wire [17:0] CORDIC_Yout_s9_q;
    wire [18:0] CORDIC_Pout_s9_a;
    wire [18:0] CORDIC_Pout_s9_b;
    logic [18:0] CORDIC_Pout_s9_o;
    wire [0:0] CORDIC_Pout_s9_s;
    wire [17:0] CORDIC_Pout_s9_q;
    wire [15:0] CORDIC_CnstAtan_s10_q;
    wire [0:0] CORDIC_CmpPGeZero_s10_q;
    wire [0:0] CORDIC_CmpPLtZero_s10_q;
    wire [7:0] CORDIC_ShiftX_s10_b;
    wire [7:0] CORDIC_ShiftY_s10_b;
    wire [18:0] CORDIC_Xout_s10_a;
    wire [18:0] CORDIC_Xout_s10_b;
    logic [18:0] CORDIC_Xout_s10_o;
    wire [0:0] CORDIC_Xout_s10_s;
    wire [17:0] CORDIC_Xout_s10_q;
    wire [18:0] CORDIC_Yout_s10_a;
    wire [18:0] CORDIC_Yout_s10_b;
    logic [18:0] CORDIC_Yout_s10_o;
    wire [0:0] CORDIC_Yout_s10_s;
    wire [17:0] CORDIC_Yout_s10_q;
    wire [18:0] CORDIC_Pout_s10_a;
    wire [18:0] CORDIC_Pout_s10_b;
    logic [18:0] CORDIC_Pout_s10_o;
    wire [0:0] CORDIC_Pout_s10_s;
    wire [17:0] CORDIC_Pout_s10_q;
    wire [15:0] CORDIC_CnstAtan_s11_q;
    wire [0:0] CORDIC_CmpPGeZero_s11_q;
    wire [0:0] CORDIC_CmpPLtZero_s11_q;
    wire [6:0] CORDIC_ShiftX_s11_b;
    wire [6:0] CORDIC_ShiftY_s11_b;
    wire [18:0] CORDIC_Xout_s11_a;
    wire [18:0] CORDIC_Xout_s11_b;
    logic [18:0] CORDIC_Xout_s11_o;
    wire [0:0] CORDIC_Xout_s11_s;
    wire [17:0] CORDIC_Xout_s11_q;
    wire [18:0] CORDIC_Yout_s11_a;
    wire [18:0] CORDIC_Yout_s11_b;
    logic [18:0] CORDIC_Yout_s11_o;
    wire [0:0] CORDIC_Yout_s11_s;
    wire [17:0] CORDIC_Yout_s11_q;
    wire [18:0] CORDIC_Pout_s11_a;
    wire [18:0] CORDIC_Pout_s11_b;
    logic [18:0] CORDIC_Pout_s11_o;
    wire [0:0] CORDIC_Pout_s11_s;
    wire [17:0] CORDIC_Pout_s11_q;
    wire [15:0] CORDIC_CnstAtan_s12_q;
    wire [0:0] CORDIC_CmpPGeZero_s12_q;
    wire [0:0] CORDIC_CmpPLtZero_s12_q;
    wire [5:0] CORDIC_ShiftX_s12_b;
    wire [5:0] CORDIC_ShiftY_s12_b;
    wire [18:0] CORDIC_Xout_s12_a;
    wire [18:0] CORDIC_Xout_s12_b;
    logic [18:0] CORDIC_Xout_s12_o;
    wire [0:0] CORDIC_Xout_s12_s;
    wire [17:0] CORDIC_Xout_s12_q;
    wire [18:0] CORDIC_Yout_s12_a;
    wire [18:0] CORDIC_Yout_s12_b;
    logic [18:0] CORDIC_Yout_s12_o;
    wire [0:0] CORDIC_Yout_s12_s;
    wire [17:0] CORDIC_Yout_s12_q;
    wire [18:0] CORDIC_Pout_s12_a;
    wire [18:0] CORDIC_Pout_s12_b;
    logic [18:0] CORDIC_Pout_s12_o;
    wire [0:0] CORDIC_Pout_s12_s;
    wire [17:0] CORDIC_Pout_s12_q;
    wire [15:0] CORDIC_CnstAtan_s13_q;
    wire [0:0] CORDIC_CmpPGeZero_s13_q;
    wire [0:0] CORDIC_CmpPLtZero_s13_q;
    wire [4:0] CORDIC_ShiftX_s13_b;
    wire [4:0] CORDIC_ShiftY_s13_b;
    wire [18:0] CORDIC_Xout_s13_a;
    wire [18:0] CORDIC_Xout_s13_b;
    logic [18:0] CORDIC_Xout_s13_o;
    wire [0:0] CORDIC_Xout_s13_s;
    wire [17:0] CORDIC_Xout_s13_q;
    wire [18:0] CORDIC_Yout_s13_a;
    wire [18:0] CORDIC_Yout_s13_b;
    logic [18:0] CORDIC_Yout_s13_o;
    wire [0:0] CORDIC_Yout_s13_s;
    wire [17:0] CORDIC_Yout_s13_q;
    wire [18:0] CORDIC_Pout_s13_a;
    wire [18:0] CORDIC_Pout_s13_b;
    logic [18:0] CORDIC_Pout_s13_o;
    wire [0:0] CORDIC_Pout_s13_s;
    wire [17:0] CORDIC_Pout_s13_q;
    wire [0:0] CORDIC_CmpPGeZero_s14_qi;
    reg [0:0] CORDIC_CmpPGeZero_s14_q;
    wire [0:0] CORDIC_CmpPLtZero_s14_qi;
    reg [0:0] CORDIC_CmpPLtZero_s14_q;
    wire [3:0] CORDIC_ShiftX_s14_b;
    wire [3:0] CORDIC_ShiftY_s14_b;
    wire [18:0] CORDIC_Xout_s14_a;
    wire [18:0] CORDIC_Xout_s14_b;
    logic [18:0] CORDIC_Xout_s14_o;
    wire [0:0] CORDIC_Xout_s14_s;
    wire [17:0] CORDIC_Xout_s14_q;
    wire [18:0] CORDIC_Yout_s14_a;
    wire [18:0] CORDIC_Yout_s14_b;
    logic [18:0] CORDIC_Yout_s14_o;
    wire [0:0] CORDIC_Yout_s14_s;
    wire [17:0] CORDIC_Yout_s14_q;
    wire [2:0] CORDIC_ShiftX_s15_b;
    wire [2:0] CORDIC_ShiftY_s15_b;
    wire [18:0] CORDIC_Xout_s15_a;
    wire [18:0] CORDIC_Xout_s15_b;
    logic [18:0] CORDIC_Xout_s15_o;
    wire [0:0] CORDIC_Xout_s15_s;
    wire [17:0] CORDIC_Xout_s15_q;
    wire [18:0] CORDIC_Yout_s15_a;
    wire [18:0] CORDIC_Yout_s15_b;
    logic [18:0] CORDIC_Yout_s15_o;
    wire [0:0] CORDIC_Yout_s15_s;
    wire [17:0] CORDIC_Yout_s15_q;
    wire [1:0] CORDIC_ShiftX_s16_b;
    wire [1:0] CORDIC_ShiftY_s16_b;
    wire [18:0] CORDIC_Xout_s16_a;
    wire [18:0] CORDIC_Xout_s16_b;
    logic [18:0] CORDIC_Xout_s16_o;
    wire [0:0] CORDIC_Xout_s16_s;
    wire [17:0] CORDIC_Xout_s16_q;
    wire [18:0] CORDIC_Yout_s16_a;
    wire [18:0] CORDIC_Yout_s16_b;
    logic [18:0] CORDIC_Yout_s16_o;
    wire [0:0] CORDIC_Yout_s16_s;
    wire [17:0] CORDIC_Yout_s16_q;
    wire [17:0] CORDIC_ConstZero_Last_q;
    wire [18:0] CORDIC_ZeroAddSubX_Last_a;
    wire [18:0] CORDIC_ZeroAddSubX_Last_b;
    logic [18:0] CORDIC_ZeroAddSubX_Last_o;
    wire [0:0] CORDIC_ZeroAddSubX_Last_s;
    wire [17:0] CORDIC_ZeroAddSubX_Last_q;
    wire [18:0] CORDIC_ZeroAddSubY_Last_a;
    wire [18:0] CORDIC_ZeroAddSubY_Last_b;
    logic [18:0] CORDIC_ZeroAddSubY_Last_o;
    wire [0:0] CORDIC_ZeroAddSubY_Last_s;
    wire [17:0] CORDIC_ZeroAddSubY_Last_q;
    wire [78:0] Mult_sums_align_1_q;
    wire [78:0] Mult_sums_align_1_qint;
    wire [0:0] lowRangeB_uid337_Mult1_in;
    wire [0:0] lowRangeB_uid337_Mult1_b;
    wire [14:0] highBBits_uid338_Mult1_b;
    wire [16:0] addsumAHighB_uid339_Mult1_a;
    wire [16:0] addsumAHighB_uid339_Mult1_b;
    logic [16:0] addsumAHighB_uid339_Mult1_o;
    wire [16:0] addsumAHighB_uid339_Mult1_q;
    wire [17:0] add_uid340_Mult1_q;
    wire [2:0] lowRangeB_uid343_Mult1_in;
    wire [2:0] lowRangeB_uid343_Mult1_b;
    wire [12:0] highBBits_uid344_Mult1_b;
    wire [16:0] addsumAHighB_uid345_Mult1_a;
    wire [16:0] addsumAHighB_uid345_Mult1_b;
    logic [16:0] addsumAHighB_uid345_Mult1_o;
    wire [16:0] addsumAHighB_uid345_Mult1_q;
    wire [19:0] add_uid346_Mult1_q;
    wire [3:0] lowRangeB_uid348_Mult1_in;
    wire [3:0] lowRangeB_uid348_Mult1_b;
    wire [11:0] highBBits_uid349_Mult1_b;
    wire [20:0] a_subconst_145_sumAHighB_uid350_Mult1_a;
    wire [20:0] a_subconst_145_sumAHighB_uid350_Mult1_b;
    logic [20:0] a_subconst_145_sumAHighB_uid350_Mult1_o;
    wire [20:0] a_subconst_145_sumAHighB_uid350_Mult1_q;
    wire [24:0] a_subconst_145_uid351_Mult1_q;
    wire [18:0] a_subconst_3217_sumAHighB_uid355_Mult1_a;
    wire [18:0] a_subconst_3217_sumAHighB_uid355_Mult1_b;
    logic [18:0] a_subconst_3217_sumAHighB_uid355_Mult1_o;
    wire [18:0] a_subconst_3217_sumAHighB_uid355_Mult1_q;
    wire [28:0] a_subconst_3217_uid356_Mult1_q;
    wire [2:0] sR_bottomExtension_uid359_Mult1_q;
    wire [31:0] sR_mergedSignalTM_uid361_Mult1_q;
    wire [33:0] Sub_Mux_merged_a;
    wire [33:0] Sub_Mux_merged_b;
    wire [33:0] Sub_Mux_merged_i;
    wire [33:0] Sub_Mux_merged_a1;
    wire [33:0] Sub_Mux_merged_b1;
    logic [33:0] Sub_Mux_merged_o;
    wire [32:0] Sub_Mux_merged_q;
    wire [18:0] Negate_Mux2_merged_a;
    wire [18:0] Negate_Mux2_merged_b;
    wire [18:0] Negate_Mux2_merged_i;
    wire [18:0] Negate_Mux2_merged_a1;
    wire [18:0] Negate_Mux2_merged_b1;
    logic [18:0] Negate_Mux2_merged_o;
    wire [17:0] Negate_Mux2_merged_q;
    wire [18:0] CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_a;
    wire [18:0] CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_b;
    wire [18:0] CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_i;
    wire [18:0] CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_a1;
    wire [18:0] CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_b1;
    logic [18:0] CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_o;
    wire [0:0] CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_s;
    wire [17:0] CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_q;
    wire Mult_im0_cma_reset;
    wire [26:0] Mult_im0_cma_a0;
    wire [26:0] Mult_im0_cma_c0;
    wire [53:0] Mult_im0_cma_s0;
    wire [53:0] Mult_im0_cma_qq0;
    reg [53:0] Mult_im0_cma_q;
    wire Mult_im0_cma_ena0;
    wire Mult_im0_cma_ena1;
    wire Mult_im0_cma_ena2;
    wire Mult_im8_cma_reset;
    wire [23:0] Mult_im8_cma_a0;
    wire [12:0] Mult_im8_cma_c0;
    wire [36:0] Mult_im8_cma_s0;
    wire [36:0] Mult_im8_cma_qq0;
    reg [36:0] Mult_im8_cma_q;
    wire Mult_im8_cma_ena0;
    wire Mult_im8_cma_ena1;
    wire Mult_im8_cma_ena2;
    wire Mult_ma3_cma_reset;
    wire [23:0] Mult_ma3_cma_a0;
    wire [26:0] Mult_ma3_cma_c0;
    wire [23:0] Mult_ma3_cma_a1;
    wire [26:0] Mult_ma3_cma_c1;
    wire [51:0] Mult_ma3_cma_s0;
    wire [63:0] Mult_ma3_cma_s1;
    wire [51:0] Mult_ma3_cma_qq0;
    reg [51:0] Mult_ma3_cma_q;
    wire Mult_ma3_cma_ena0;
    wire Mult_ma3_cma_ena1;
    wire Mult_ma3_cma_ena2;
    wire [12:0] Mult_sums_result_add_0_0_UpperBits_for_b_q;
    wire [59:0] Mult_sums_result_add_0_0_p1_of_2_a;
    wire [59:0] Mult_sums_result_add_0_0_p1_of_2_b;
    logic [59:0] Mult_sums_result_add_0_0_p1_of_2_o;
    wire [0:0] Mult_sums_result_add_0_0_p1_of_2_c;
    wire [58:0] Mult_sums_result_add_0_0_p1_of_2_q;
    wire [34:0] Mult_sums_result_add_0_0_p2_of_2_a;
    wire [34:0] Mult_sums_result_add_0_0_p2_of_2_b;
    logic [34:0] Mult_sums_result_add_0_0_p2_of_2_o;
    wire [0:0] Mult_sums_result_add_0_0_p2_of_2_cin;
    wire [32:0] Mult_sums_result_add_0_0_p2_of_2_q;
    wire [91:0] Mult_sums_result_add_0_0_BitJoin_for_q_q;
    wire [58:0] Mult_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q;
    wire [32:0] Mult_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q;
    wire [32:0] Mult_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q;
    wire [1:0] Convert3_rnd_bias_q;
    wire [43:0] Convert3_rnd_trunc_q;
    wire [90:0] Convert3_rnd_trunc_qint;
    wire [46:0] Convert3_rnd_add_a;
    wire [46:0] Convert3_rnd_add_b;
    logic [46:0] Convert3_rnd_add_o;
    wire [45:0] Convert3_rnd_add_q;
    wire [44:0] Convert3_rnd_shift_q;
    wire [45:0] Convert3_rnd_shift_qint;
    wire [43:0] Convert3_rnd_bs_in;
    wire [43:0] Convert3_rnd_bs_b;
    wire [18:0] Convert5_rnd_trunc_q;
    wire [32:0] Convert5_rnd_trunc_qint;
    wire [19:0] Convert5_rnd_add_a;
    wire [19:0] Convert5_rnd_add_b;
    logic [19:0] Convert5_rnd_add_o;
    wire [19:0] Convert5_rnd_add_q;
    wire [18:0] Convert5_rnd_shift_q;
    wire [19:0] Convert5_rnd_shift_qint;
    wire [26:0] Mult_bs1_bit_select_merged_b;
    wire [23:0] Mult_bs1_bit_select_merged_c;
    wire [26:0] Mult_bs2_bit_select_merged_b;
    wire [12:0] Mult_bs2_bit_select_merged_c;
    wire [58:0] Mult_sums_result_add_0_0_BitSelect_for_b_tessel0_0_bit_select_merged_b;
    wire [19:0] Mult_sums_result_add_0_0_BitSelect_for_b_tessel0_0_bit_select_merged_c;
    wire [9:0] lowRangeB_uid353_Mult1_bit_select_merged_b;
    wire [14:0] lowRangeB_uid353_Mult1_bit_select_merged_c;
    wire [4:0] Mult_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_b;
    wire [31:0] Mult_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c;
    wire [15:0] muxopt_assign_id0_q_const_q;
    wire [16:0] CORDIC_ShiftX_s1_b_const_q;
    wire [17:0] CORDIC_Xout_s0_bit_select_b_const_q;
    reg [31:0] redist0_Mult_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c_1_q;
    reg [9:0] redist1_lowRangeB_uid353_Mult1_bit_select_merged_b_1_q;
    reg [19:0] redist2_Mult_sums_result_add_0_0_BitSelect_for_b_tessel0_0_bit_select_merged_c_1_q;
    reg [26:0] redist3_Mult_bs2_bit_select_merged_b_1_q;
    reg [12:0] redist4_Mult_bs2_bit_select_merged_c_1_q;
    reg [26:0] redist5_Mult_bs1_bit_select_merged_b_1_q;
    reg [23:0] redist6_Mult_bs1_bit_select_merged_c_1_q;
    reg [18:0] redist7_Convert5_rnd_trunc_q_1_q;
    reg [58:0] redist8_Mult_sums_result_add_0_0_p1_of_2_q_1_q;
    reg [51:0] redist9_Mult_ma3_cma_q_1_q;
    reg [36:0] redist10_Mult_im8_cma_q_1_q;
    reg [53:0] redist11_Mult_im0_cma_q_1_q;
    reg [31:0] redist12_sR_mergedSignalTM_uid361_Mult1_q_1_q;
    reg [3:0] redist13_lowRangeB_uid348_Mult1_b_1_q;
    reg [0:0] redist14_lowRangeB_uid337_Mult1_b_1_q;
    reg [0:0] redist15_CORDIC_CmpPLtZero_s14_q_2_q;
    reg [0:0] redist16_CORDIC_CmpPLtZero_s14_q_3_q;
    reg [0:0] redist17_CORDIC_CmpPGeZero_s14_q_2_q;
    reg [0:0] redist18_CORDIC_CmpPGeZero_s14_q_3_q;
    reg [0:0] redist19_CORDIC_AorB_00_q_19_q;
    reg [0:0] redist20_CORDIC_CmpNegPiOv2_00_c_2_q;
    reg [15:0] redist21_Convert5_sel_x_b_1_q;
    reg [15:0] redist22_Convert5_sel_x_b_3_q;
    reg [15:0] redist22_Convert5_sel_x_b_3_delay_0;
    reg [15:0] redist23_Convert3_sel_x_b_1_q;
    reg [15:0] redist24_Convert3_sel_x_b_2_q;
    reg [0:0] redist25_ChannelIn_cunroll_x_in_1_v_tpl_38_q;
    reg [7:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_q;
    reg [7:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_delay_0;
    reg [7:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_delay_1;
    reg [7:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_delay_2;
    reg [7:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_delay_3;
    reg [0:0] redist29_ChannelIn_cunroll_x_in_6_CP_EN1_tpl_15_q;
    reg [1:0] redist33_ChannelIn_cunroll_x_in_10_eAxC_tpl_38_q;
    wire redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_reset0;
    wire [15:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_ia;
    wire [1:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_aa;
    wire [1:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_ab;
    wire [15:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_iq;
    wire [15:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_q;
    wire [1:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_wraddr_i = 2'b11;
    wire [1:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_offset_q;
    wire [2:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_rdcnt_a;
    wire [2:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_rdcnt_b;
    logic [2:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_rdcnt_o;
    wire [2:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_rdcnt_q;
    wire redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_reset0;
    wire [15:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_ia;
    wire [1:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_aa;
    wire [1:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_ab;
    wire [15:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_iq;
    wire [15:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_q;
    wire [1:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_wraddr_i = 2'b11;
    wire [2:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_rdcnt_a;
    wire [2:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_rdcnt_b;
    logic [2:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_rdcnt_o;
    wire [2:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_rdcnt_q;
    wire redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_reset0;
    wire [63:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_ia;
    wire [1:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_aa;
    wire [1:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_ab;
    wire [63:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_iq;
    wire [63:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_q;
    wire [1:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_wraddr_i = 2'b11;
    wire [2:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_rdcnt_a;
    wire [2:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_rdcnt_b;
    logic [2:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_rdcnt_o;
    wire [2:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_rdcnt_q;
    wire redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_reset0;
    wire [63:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_ia;
    wire [1:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_aa;
    wire [1:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_ab;
    wire [63:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_iq;
    wire [63:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_q;
    wire [1:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_wraddr_i = 2'b11;
    wire [2:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_rdcnt_a;
    wire [2:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_rdcnt_b;
    logic [2:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_rdcnt_o;
    wire [2:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_rdcnt_q;
    wire redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_reset0;
    wire [63:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_ia;
    wire [1:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_aa;
    wire [1:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_ab;
    wire [63:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_iq;
    wire [63:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_q;
    wire [1:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_wraddr_i = 2'b11;
    wire [2:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_rdcnt_a;
    wire [2:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_rdcnt_b;
    logic [2:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_rdcnt_o;
    wire [2:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_rdcnt_q;
    wire redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_reset0;
    wire [63:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_ia;
    wire [1:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_aa;
    wire [1:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_ab;
    wire [63:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_iq;
    wire [63:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_q;
    wire [1:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_wraddr_i = 2'b11;
    wire [2:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_rdcnt_a;
    wire [2:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_rdcnt_b;
    logic [2:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_rdcnt_o;
    wire [2:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_rdcnt_q;
    wire redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_reset0;
    wire [63:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_ia;
    wire [1:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_aa;
    wire [1:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_ab;
    wire [63:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_iq;
    wire [63:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_q;
    wire [1:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_wraddr_i = 2'b11;
    wire [2:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_rdcnt_a;
    wire [2:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_rdcnt_b;
    logic [2:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_rdcnt_o;
    wire [2:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_rdcnt_q;
    wire redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_reset0;
    wire [7:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_ia;
    wire [4:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_aa;
    wire [4:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_ab;
    wire [7:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_iq;
    wire [7:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_q;
    wire [4:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_wraddr_i = 5'b11111;
    wire [4:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_offset_q;
    wire [5:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_rdcnt_a;
    wire [5:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_rdcnt_b;
    logic [5:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_rdcnt_o;
    wire [5:0] redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_rdcnt_q;
    wire redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_reset0;
    wire [15:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_ia;
    wire [4:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_aa;
    wire [4:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_ab;
    wire [15:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_iq;
    wire [15:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_q;
    wire [4:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_wraddr_i = 5'b11111;
    wire [5:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_rdcnt_a;
    wire [5:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_rdcnt_b;
    logic [5:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_rdcnt_o;
    wire [5:0] redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_rdcnt_q;
    wire redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_reset0;
    wire [15:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_ia;
    wire [4:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_aa;
    wire [4:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_ab;
    wire [15:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_iq;
    wire [15:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_q;
    wire [4:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_wraddr_i = 5'b11111;
    wire [5:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_rdcnt_a;
    wire [5:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_rdcnt_b;
    logic [5:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_rdcnt_o;
    wire [5:0] redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_rdcnt_q;
    wire redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_reset0;
    wire [63:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_ia;
    wire [4:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_aa;
    wire [4:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_ab;
    wire [63:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_iq;
    wire [63:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_q;
    wire [4:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_wraddr_i = 5'b11111;
    wire [5:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_rdcnt_a;
    wire [5:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_rdcnt_b;
    logic [5:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_rdcnt_o;
    wire [5:0] redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_rdcnt_q;
    wire redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_reset0;
    wire [63:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_ia;
    wire [4:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_aa;
    wire [4:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_ab;
    wire [63:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_iq;
    wire [63:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_q;
    wire [4:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_wraddr_i = 5'b11111;
    wire [5:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_rdcnt_a;
    wire [5:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_rdcnt_b;
    logic [5:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_rdcnt_o;
    wire [5:0] redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_rdcnt_q;
    wire redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_reset0;
    wire [63:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_ia;
    wire [4:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_aa;
    wire [4:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_ab;
    wire [63:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_iq;
    wire [63:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_q;
    wire [4:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_wraddr_i = 5'b11111;
    wire [5:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_rdcnt_a;
    wire [5:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_rdcnt_b;
    logic [5:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_rdcnt_o;
    wire [5:0] redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_rdcnt_q;
    wire redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_reset0;
    wire [63:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_ia;
    wire [4:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_aa;
    wire [4:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_ab;
    wire [63:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_iq;
    wire [63:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_q;
    wire [4:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_wraddr_i = 5'b11111;
    wire [5:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_rdcnt_a;
    wire [5:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_rdcnt_b;
    logic [5:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_rdcnt_o;
    wire [5:0] redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_rdcnt_q;
    wire redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_reset0;
    wire [63:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_ia;
    wire [4:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_aa;
    wire [4:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_ab;
    wire [63:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_iq;
    wire [63:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_q;
    wire [4:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_wraddr_i = 5'b11111;
    wire [5:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_rdcnt_a;
    wire [5:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_rdcnt_b;
    logic [5:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_rdcnt_o;
    wire [5:0] redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_rdcnt_q;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_offset(CONSTANT,544)
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_offset_q = $unsigned(2'b10);

    // redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_rdcnt(ADD,569)
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_rdcnt_a = {1'b0, redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_wraddr_q};
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_rdcnt_b = {1'b0, redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_rdcnt_o <= $unsigned(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_rdcnt_a) + $unsigned(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_rdcnt_b);
        end
    end
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_rdcnt_q = redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_rdcnt_o[2:0];

    // redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_offset(CONSTANT,572)
    assign redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_offset_q = $unsigned(5'b00010);

    // redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_rdcnt(ADD,601)
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_rdcnt_a = {1'b0, redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_wraddr_q};
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_rdcnt_b = {1'b0, redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_rdcnt_o <= $unsigned(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_rdcnt_a) + $unsigned(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_rdcnt_b);
        end
    end
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_rdcnt_q = redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_rdcnt_o[5:0];

    // redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_wraddr(COUNTER,599)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_wraddr_i <= $unsigned(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_wraddr_q = redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_wraddr_i[4:0];

    // redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem(DUALMEM,598)
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_ia = $unsigned(in_12_ul_timerefin_tpl);
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_aa = redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_wraddr_q;
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_ab = redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_rdcnt_q[4:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(64),
        .widthad_b(5),
        .numwords_b(32),
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
    ) redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_aa),
        .data_a(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_ab),
        .q_b(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_iq),
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
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_q = redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_iq[63:0];

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_wraddr(COUNTER,567)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_wraddr_i <= $unsigned(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_wraddr_q = redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_wraddr_i[1:0];

    // redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem(DUALMEM,566)
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_ia = $unsigned(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_split_0_mem_q);
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_aa = redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_wraddr_q;
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_ab = redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(64),
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
    ) redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_aa),
        .data_a(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_ab),
        .q_b(redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_iq),
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
    assign redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_q = redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_iq[63:0];

    // redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_rdcnt(ADD,565)
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_rdcnt_a = {1'b0, redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_wraddr_q};
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_rdcnt_b = {1'b0, redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_rdcnt_o <= $unsigned(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_rdcnt_a) + $unsigned(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_rdcnt_b);
        end
    end
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_rdcnt_q = redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_rdcnt_o[2:0];

    // redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_rdcnt(ADD,597)
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_rdcnt_a = {1'b0, redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_wraddr_q};
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_rdcnt_b = {1'b0, redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_rdcnt_o <= $unsigned(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_rdcnt_a) + $unsigned(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_rdcnt_b);
        end
    end
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_rdcnt_q = redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_rdcnt_o[5:0];

    // redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_wraddr(COUNTER,595)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_wraddr_i <= $unsigned(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_wraddr_q = redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_wraddr_i[4:0];

    // redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem(DUALMEM,594)
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_ia = $unsigned(in_11_sym_metadata_tpl);
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_aa = redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_wraddr_q;
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_ab = redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_rdcnt_q[4:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(64),
        .widthad_b(5),
        .numwords_b(32),
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
    ) redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_aa),
        .data_a(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_ab),
        .q_b(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_iq),
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
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_q = redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_iq[63:0];

    // redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_wraddr(COUNTER,563)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_wraddr_i <= $unsigned(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_wraddr_q = redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_wraddr_i[1:0];

    // redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem(DUALMEM,562)
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_ia = $unsigned(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_split_0_mem_q);
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_aa = redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_wraddr_q;
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_ab = redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(64),
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
    ) redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_aa),
        .data_a(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_ab),
        .q_b(redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_iq),
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
    assign redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_q = redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_iq[63:0];

    // redist33_ChannelIn_cunroll_x_in_10_eAxC_tpl_38(DELAY,531)
    dspba_delay_ver #( .width(2), .depth(38), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist33_ChannelIn_cunroll_x_in_10_eAxC_tpl_38 ( .xin(in_10_eAxC_tpl), .xout(redist33_ChannelIn_cunroll_x_in_10_eAxC_tpl_38_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_rdcnt(ADD,561)
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_rdcnt_a = {1'b0, redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_wraddr_q};
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_rdcnt_b = {1'b0, redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_rdcnt_o <= $unsigned(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_rdcnt_a) + $unsigned(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_rdcnt_b);
        end
    end
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_rdcnt_q = redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_rdcnt_o[2:0];

    // redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_rdcnt(ADD,593)
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_rdcnt_a = {1'b0, redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_wraddr_q};
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_rdcnt_b = {1'b0, redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_rdcnt_o <= $unsigned(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_rdcnt_a) + $unsigned(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_rdcnt_b);
        end
    end
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_rdcnt_q = redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_rdcnt_o[5:0];

    // redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_wraddr(COUNTER,591)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_wraddr_i <= $unsigned(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_wraddr_q = redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_wraddr_i[4:0];

    // redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem(DUALMEM,590)
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_ia = $unsigned(in_9_nsc_tpl);
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_aa = redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_wraddr_q;
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_ab = redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_rdcnt_q[4:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(64),
        .widthad_b(5),
        .numwords_b(32),
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
    ) redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_aa),
        .data_a(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_ab),
        .q_b(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_iq),
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
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_q = redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_iq[63:0];

    // redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_wraddr(COUNTER,559)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_wraddr_i <= $unsigned(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_wraddr_q = redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_wraddr_i[1:0];

    // redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem(DUALMEM,558)
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_ia = $unsigned(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_split_0_mem_q);
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_aa = redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_wraddr_q;
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_ab = redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(64),
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
    ) redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_aa),
        .data_a(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_ab),
        .q_b(redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_iq),
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
    assign redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_q = redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_iq[63:0];

    // redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_rdcnt(ADD,557)
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_rdcnt_a = {1'b0, redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_wraddr_q};
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_rdcnt_b = {1'b0, redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_rdcnt_o <= $unsigned(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_rdcnt_a) + $unsigned(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_rdcnt_b);
        end
    end
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_rdcnt_q = redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_rdcnt_o[2:0];

    // redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_rdcnt(ADD,589)
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_rdcnt_a = {1'b0, redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_wraddr_q};
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_rdcnt_b = {1'b0, redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_rdcnt_o <= $unsigned(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_rdcnt_a) + $unsigned(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_rdcnt_b);
        end
    end
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_rdcnt_q = redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_rdcnt_o[5:0];

    // redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_wraddr(COUNTER,587)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_wraddr_i <= $unsigned(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_wraddr_q = redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_wraddr_i[4:0];

    // redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem(DUALMEM,586)
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_ia = $unsigned(in_8_CPLen_tpl);
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_aa = redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_wraddr_q;
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_ab = redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_rdcnt_q[4:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(64),
        .widthad_b(5),
        .numwords_b(32),
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
    ) redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_aa),
        .data_a(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_ab),
        .q_b(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_iq),
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
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_q = redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_iq[63:0];

    // redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_wraddr(COUNTER,555)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_wraddr_i <= $unsigned(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_wraddr_q = redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_wraddr_i[1:0];

    // redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem(DUALMEM,554)
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_ia = $unsigned(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_split_0_mem_q);
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_aa = redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_wraddr_q;
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_ab = redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(64),
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
    ) redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_aa),
        .data_a(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_ab),
        .q_b(redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_iq),
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
    assign redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_q = redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_iq[63:0];

    // redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_rdcnt(ADD,553)
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_rdcnt_a = {1'b0, redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_wraddr_q};
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_rdcnt_b = {1'b0, redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_rdcnt_o <= $unsigned(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_rdcnt_a) + $unsigned(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_rdcnt_b);
        end
    end
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_rdcnt_q = redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_rdcnt_o[2:0];

    // redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_rdcnt(ADD,585)
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_rdcnt_a = {1'b0, redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_wraddr_q};
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_rdcnt_b = {1'b0, redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_rdcnt_o <= $unsigned(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_rdcnt_a) + $unsigned(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_rdcnt_b);
        end
    end
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_rdcnt_q = redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_rdcnt_o[5:0];

    // redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_wraddr(COUNTER,583)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_wraddr_i <= $unsigned(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_wraddr_q = redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_wraddr_i[4:0];

    // redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem(DUALMEM,582)
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_ia = $unsigned(in_7_fft_size_tpl);
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_aa = redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_wraddr_q;
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_ab = redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_rdcnt_q[4:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(64),
        .widthad_b(5),
        .numwords_b(32),
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
    ) redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_aa),
        .data_a(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_ab),
        .q_b(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_iq),
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
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_q = redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_iq[63:0];

    // redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_wraddr(COUNTER,551)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_wraddr_i <= $unsigned(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_wraddr_q = redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_wraddr_i[1:0];

    // redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem(DUALMEM,550)
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_ia = $unsigned(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_split_0_mem_q);
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_aa = redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_wraddr_q;
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_ab = redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(64),
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
    ) redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_aa),
        .data_a(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_ab),
        .q_b(redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_iq),
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
    assign redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_q = redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_iq[63:0];

    // CORDIC_CnstNegPiOv2(CONSTANT,53)
    assign CORDIC_CnstNegPiOv2_q = $unsigned(16'b1100110110111100);

    // Convert3_rnd_bias(CONSTANT,480)
    assign Convert3_rnd_bias_q = $unsigned(2'b01);

    // Const1(CONSTANT,9)
    assign Const1_q = $unsigned(16'b0011001001000100);

    // CmpGE_PreShift_1(BITSHIFT,47)@13
    assign CmpGE_PreShift_1_qint = { Const1_q, 16'b0000000000000000 };
    assign CmpGE_PreShift_1_q = CmpGE_PreShift_1_qint[31:0];

    // BitCombine(BITJOIN,3)@0
    assign BitCombine_q = {in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl, in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl};

    // Convert1_sel_x(BITSELECT,33)@0
    assign Convert1_sel_x_b = BitCombine_q[39:0];

    // Mult_bs2_bit_select_merged(BITSELECT,491)@0
    assign Mult_bs2_bit_select_merged_b = Convert1_sel_x_b[26:0];
    assign Mult_bs2_bit_select_merged_c = Convert1_sel_x_b[39:27];

    // Lut1(LOOKUP,19)@0
    always @(in_2_c_tpl)
    begin
        // Begin reserved scope level
        unique case (in_2_c_tpl)
            8'b00000000 : Lut1_q = 51'b000000010110011000010010101010101010101010101010101;
            8'b00000001 : Lut1_q = 51'b000100101101000110110101010101010101010101010101011;
            8'b00000010 : Lut1_q = 51'b001001000011110101011000000000000000000000000000000;
            8'b00000011 : Lut1_q = 51'b001101011010100011111010101010101010101010101010100;
            8'b00000100 : Lut1_q = 51'b010001110001010010011101010101010101010101010101100;
            8'b00000101 : Lut1_q = 51'b010110001000000001000000000000000000000000000000000;
            8'b00000110 : Lut1_q = 51'b011010011110101111100010101010101010101010101010100;
            8'b00000111 : Lut1_q = 51'b011110110101011110000101010101010101010101010101100;
            8'b00001000 : Lut1_q = 51'b100011001100001100101000000000000000000000000000000;
            8'b00001001 : Lut1_q = 51'b100111100010111011001010101010101010101010101010100;
            8'b00001010 : Lut1_q = 51'b101011111001101001101101010101010101010101010101100;
            8'b00001011 : Lut1_q = 51'b110000010000011000010000000000000000000000000000000;
            8'b00001100 : Lut1_q = 51'b110100100111000110110010101010101010101010101010100;
            8'b00001101 : Lut1_q = 51'b111000111101110101010101010101010101010101010101100;
            default : Lut1_q = 51'b000000010110011000010010101010101010101010101010101;
        endcase
        // End reserved scope level
    end

    // Mult_bs1_bit_select_merged(BITSELECT,490)@0
    assign Mult_bs1_bit_select_merged_b = Lut1_q[26:0];
    assign Mult_bs1_bit_select_merged_c = Lut1_q[50:27];

    // redist5_Mult_bs1_bit_select_merged_b_1(DELAY,503)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_Mult_bs1_bit_select_merged_b_1_q <= $unsigned(Mult_bs1_bit_select_merged_b);
        end
    end

    // redist4_Mult_bs2_bit_select_merged_c_1(DELAY,502)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_Mult_bs2_bit_select_merged_c_1_q <= $unsigned(Mult_bs2_bit_select_merged_c);
        end
    end

    // Mult_ma3_cma(CHAINMULTADD,459)@0 + 5
    // in e@1
    // in g@1
    // out q@6
    assign Mult_ma3_cma_reset = areset;
    assign Mult_ma3_cma_ena0 = 1'b1;
    assign Mult_ma3_cma_ena1 = Mult_ma3_cma_ena0;
    assign Mult_ma3_cma_ena2 = Mult_ma3_cma_ena0;

    assign Mult_ma3_cma_a0 = {11'b00000000000, redist4_Mult_bs2_bit_select_merged_c_1_q[12:0]};
    assign Mult_ma3_cma_c0 = redist5_Mult_bs1_bit_select_merged_b_1_q;
    assign Mult_ma3_cma_a1 = Mult_bs1_bit_select_merged_c;
    assign Mult_ma3_cma_c1 = Mult_bs2_bit_select_merged_b;
    tennm_mac #(
        .operation_mode("m27x27"),
        .chain_inout_width(64),
        .clear_type("none"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(24),
        .ax_clken("0"),
        .ax_width(27),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1")
    ) Mult_ma3_cma_DSP1 (
        .clk(clk),
        .ena({ Mult_ma3_cma_ena2, Mult_ma3_cma_ena1, Mult_ma3_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult_ma3_cma_a1),
        .ax(Mult_ma3_cma_c1),
        .chainout(Mult_ma3_cma_s1),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m27x27"),
        .chain_inout_width(64),
        .clear_type("none"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(24),
        .ax_clken("0"),
        .ax_width(27),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(52)
    ) Mult_ma3_cma_DSP0 (
        .clk(clk),
        .ena({ Mult_ma3_cma_ena2, Mult_ma3_cma_ena1, Mult_ma3_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult_ma3_cma_a0),
        .ax(Mult_ma3_cma_c0),
        .chainin(Mult_ma3_cma_s1),
        .resulta(Mult_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(52), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult_ma3_cma_delay0 ( .xin(Mult_ma3_cma_s0), .xout(Mult_ma3_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult_ma3_cma_q = $unsigned(Mult_ma3_cma_qq0[51:0]);

    // redist9_Mult_ma3_cma_q_1(DELAY,507)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_Mult_ma3_cma_q_1_q <= $unsigned(Mult_ma3_cma_q);
        end
    end

    // Mult_sums_align_1(BITSHIFT,325)@7
    assign Mult_sums_align_1_qint = { redist9_Mult_ma3_cma_q_1_q, 27'b000000000000000000000000000 };
    assign Mult_sums_align_1_q = Mult_sums_align_1_qint[78:0];

    // Mult_sums_result_add_0_0_BitSelect_for_b_tessel0_0_bit_select_merged(BITSELECT,492)@7
    assign Mult_sums_result_add_0_0_BitSelect_for_b_tessel0_0_bit_select_merged_b = $unsigned(Mult_sums_align_1_q[58:0]);
    assign Mult_sums_result_add_0_0_BitSelect_for_b_tessel0_0_bit_select_merged_c = $unsigned(Mult_sums_align_1_q[78:59]);

    // redist6_Mult_bs1_bit_select_merged_c_1(DELAY,504)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_Mult_bs1_bit_select_merged_c_1_q <= $unsigned(Mult_bs1_bit_select_merged_c);
        end
    end

    // Mult_im8_cma(CHAINMULTADD,458)@1 + 5
    assign Mult_im8_cma_reset = areset;
    assign Mult_im8_cma_ena0 = 1'b1;
    assign Mult_im8_cma_ena1 = Mult_im8_cma_ena0;
    assign Mult_im8_cma_ena2 = Mult_im8_cma_ena0;

    assign Mult_im8_cma_a0 = redist6_Mult_bs1_bit_select_merged_c_1_q;
    assign Mult_im8_cma_c0 = redist4_Mult_bs2_bit_select_merged_c_1_q;
    tennm_mac #(
        .operation_mode("m27x27"),
        .clear_type("none"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(24),
        .ax_clken("0"),
        .ax_width(13),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(37)
    ) Mult_im8_cma_DSP0 (
        .clk(clk),
        .ena({ Mult_im8_cma_ena2, Mult_im8_cma_ena1, Mult_im8_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult_im8_cma_a0),
        .ax(Mult_im8_cma_c0),
        .resulta(Mult_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
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
    Mult_im8_cma_delay0 ( .xin(Mult_im8_cma_s0), .xout(Mult_im8_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult_im8_cma_q = $unsigned(Mult_im8_cma_qq0[36:0]);

    // redist10_Mult_im8_cma_q_1(DELAY,508)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist10_Mult_im8_cma_q_1_q <= $unsigned(Mult_im8_cma_q);
        end
    end

    // Mult_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged(BITSELECT,494)@7
    assign Mult_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_b = $unsigned(redist10_Mult_im8_cma_q_1_q[4:0]);
    assign Mult_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c = $unsigned(redist10_Mult_im8_cma_q_1_q[36:5]);

    // redist3_Mult_bs2_bit_select_merged_b_1(DELAY,501)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_Mult_bs2_bit_select_merged_b_1_q <= $unsigned(Mult_bs2_bit_select_merged_b);
        end
    end

    // Mult_im0_cma(CHAINMULTADD,457)@1 + 5
    assign Mult_im0_cma_reset = areset;
    assign Mult_im0_cma_ena0 = 1'b1;
    assign Mult_im0_cma_ena1 = Mult_im0_cma_ena0;
    assign Mult_im0_cma_ena2 = Mult_im0_cma_ena0;

    assign Mult_im0_cma_a0 = redist5_Mult_bs1_bit_select_merged_b_1_q;
    assign Mult_im0_cma_c0 = redist3_Mult_bs2_bit_select_merged_b_1_q;
    tennm_mac #(
        .operation_mode("m27x27"),
        .clear_type("none"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(27),
        .ax_clken("0"),
        .ax_width(27),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(54)
    ) Mult_im0_cma_DSP0 (
        .clk(clk),
        .ena({ Mult_im0_cma_ena2, Mult_im0_cma_ena1, Mult_im0_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult_im0_cma_a0),
        .ax(Mult_im0_cma_c0),
        .resulta(Mult_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
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
    dspba_delay_ver #( .width(54), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult_im0_cma_delay0 ( .xin(Mult_im0_cma_s0), .xout(Mult_im0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult_im0_cma_q = $unsigned(Mult_im0_cma_qq0[53:0]);

    // redist11_Mult_im0_cma_q_1(DELAY,509)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist11_Mult_im0_cma_q_1_q <= $unsigned(Mult_im0_cma_q);
        end
    end

    // Mult_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b(BITJOIN,471)@7
    assign Mult_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q = {Mult_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_b, redist11_Mult_im0_cma_q_1_q};

    // Mult_sums_result_add_0_0_p1_of_2(ADD,466)@7 + 1
    assign Mult_sums_result_add_0_0_p1_of_2_a = {1'b0, Mult_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q};
    assign Mult_sums_result_add_0_0_p1_of_2_b = {1'b0, Mult_sums_result_add_0_0_BitSelect_for_b_tessel0_0_bit_select_merged_b};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Mult_sums_result_add_0_0_p1_of_2_o <= $unsigned(Mult_sums_result_add_0_0_p1_of_2_a) + $unsigned(Mult_sums_result_add_0_0_p1_of_2_b);
        end
    end
    assign Mult_sums_result_add_0_0_p1_of_2_c[0] = Mult_sums_result_add_0_0_p1_of_2_o[59];
    assign Mult_sums_result_add_0_0_p1_of_2_q = Mult_sums_result_add_0_0_p1_of_2_o[58:0];

    // Mult_sums_result_add_0_0_UpperBits_for_b(CONSTANT,463)
    assign Mult_sums_result_add_0_0_UpperBits_for_b_q = $unsigned(13'b0000000000000);

    // redist2_Mult_sums_result_add_0_0_BitSelect_for_b_tessel0_0_bit_select_merged_c_1(DELAY,500)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_Mult_sums_result_add_0_0_BitSelect_for_b_tessel0_0_bit_select_merged_c_1_q <= $unsigned(Mult_sums_result_add_0_0_BitSelect_for_b_tessel0_0_bit_select_merged_c);
        end
    end

    // Mult_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,479)@8
    assign Mult_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q = {Mult_sums_result_add_0_0_UpperBits_for_b_q, redist2_Mult_sums_result_add_0_0_BitSelect_for_b_tessel0_0_bit_select_merged_c_1_q};

    // redist0_Mult_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c_1(DELAY,498)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_Mult_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c_1_q <= $unsigned(Mult_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c);
        end
    end

    // Mult_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,474)@8
    assign Mult_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q = {GND_q, redist0_Mult_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c_1_q};

    // Mult_sums_result_add_0_0_p2_of_2(ADD,467)@8 + 1
    assign Mult_sums_result_add_0_0_p2_of_2_cin = Mult_sums_result_add_0_0_p1_of_2_c;
    assign Mult_sums_result_add_0_0_p2_of_2_a = { {1'b0, Mult_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign Mult_sums_result_add_0_0_p2_of_2_b = { {1'b0, Mult_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q}, Mult_sums_result_add_0_0_p2_of_2_cin[0] };
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Mult_sums_result_add_0_0_p2_of_2_o <= $unsigned(Mult_sums_result_add_0_0_p2_of_2_a) + $unsigned(Mult_sums_result_add_0_0_p2_of_2_b);
        end
    end
    assign Mult_sums_result_add_0_0_p2_of_2_q = Mult_sums_result_add_0_0_p2_of_2_o[33:1];

    // redist8_Mult_sums_result_add_0_0_p1_of_2_q_1(DELAY,506)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_Mult_sums_result_add_0_0_p1_of_2_q_1_q <= $unsigned(Mult_sums_result_add_0_0_p1_of_2_q);
        end
    end

    // Mult_sums_result_add_0_0_BitJoin_for_q(BITJOIN,468)@9
    assign Mult_sums_result_add_0_0_BitJoin_for_q_q = {Mult_sums_result_add_0_0_p2_of_2_q, redist8_Mult_sums_result_add_0_0_p1_of_2_q_1_q};

    // Convert3_rnd_trunc(BITSHIFT,481)@9
    assign Convert3_rnd_trunc_qint = Mult_sums_result_add_0_0_BitJoin_for_q_q[90:0];
    assign Convert3_rnd_trunc_q = Convert3_rnd_trunc_qint[90:47];

    // Convert3_rnd_add(ADD,482)@9
    assign Convert3_rnd_add_a = $unsigned({3'b000, Convert3_rnd_trunc_q});
    assign Convert3_rnd_add_b = $unsigned({{45{Convert3_rnd_bias_q[1]}}, Convert3_rnd_bias_q});
    assign Convert3_rnd_add_o = $unsigned($signed(Convert3_rnd_add_a) + $signed(Convert3_rnd_add_b));
    assign Convert3_rnd_add_q = Convert3_rnd_add_o[45:0];

    // Convert3_rnd_shift(BITSHIFT,483)@9
    assign Convert3_rnd_shift_qint = Convert3_rnd_add_q;
    assign Convert3_rnd_shift_q = Convert3_rnd_shift_qint[45:1];

    // Convert3_rnd_bs(BITSELECT,484)@9
    assign Convert3_rnd_bs_in = Convert3_rnd_shift_q[43:0];
    assign Convert3_rnd_bs_b = Convert3_rnd_bs_in[43:0];

    // Convert3_sel_x(BITSELECT,34)@9
    assign Convert3_sel_x_b = Convert3_rnd_bs_b[15:0];

    // redist23_Convert3_sel_x_b_1(DELAY,521)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist23_Convert3_sel_x_b_1_q <= $unsigned(Convert3_sel_x_b);
        end
    end

    // redist24_Convert3_sel_x_b_2(DELAY,522)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist24_Convert3_sel_x_b_2_q <= $unsigned(redist23_Convert3_sel_x_b_1_q);
        end
    end

    // highBBits_uid349_Mult1(BITSELECT,348)@11
    assign highBBits_uid349_Mult1_b = redist24_Convert3_sel_x_b_2_q[15:4];

    // highBBits_uid344_Mult1(BITSELECT,343)@10
    assign highBBits_uid344_Mult1_b = redist23_Convert3_sel_x_b_1_q[15:3];

    // addsumAHighB_uid345_Mult1(ADD,344)@10 + 1
    assign addsumAHighB_uid345_Mult1_a = {1'b0, redist23_Convert3_sel_x_b_1_q};
    assign addsumAHighB_uid345_Mult1_b = {4'b0000, highBBits_uid344_Mult1_b};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            addsumAHighB_uid345_Mult1_o <= $unsigned(addsumAHighB_uid345_Mult1_a) + $unsigned(addsumAHighB_uid345_Mult1_b);
        end
    end
    assign addsumAHighB_uid345_Mult1_q = addsumAHighB_uid345_Mult1_o[16:0];

    // lowRangeB_uid343_Mult1(BITSELECT,342)@11
    assign lowRangeB_uid343_Mult1_in = redist24_Convert3_sel_x_b_2_q[2:0];
    assign lowRangeB_uid343_Mult1_b = lowRangeB_uid343_Mult1_in[2:0];

    // add_uid346_Mult1(BITJOIN,345)@11
    assign add_uid346_Mult1_q = {addsumAHighB_uid345_Mult1_q, lowRangeB_uid343_Mult1_b};

    // a_subconst_145_sumAHighB_uid350_Mult1(ADD,349)@11 + 1
    assign a_subconst_145_sumAHighB_uid350_Mult1_a = {1'b0, add_uid346_Mult1_q};
    assign a_subconst_145_sumAHighB_uid350_Mult1_b = {9'b000000000, highBBits_uid349_Mult1_b};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            a_subconst_145_sumAHighB_uid350_Mult1_o <= $unsigned(a_subconst_145_sumAHighB_uid350_Mult1_a) + $unsigned(a_subconst_145_sumAHighB_uid350_Mult1_b);
        end
    end
    assign a_subconst_145_sumAHighB_uid350_Mult1_q = a_subconst_145_sumAHighB_uid350_Mult1_o[20:0];

    // lowRangeB_uid348_Mult1(BITSELECT,347)@11
    assign lowRangeB_uid348_Mult1_in = redist24_Convert3_sel_x_b_2_q[3:0];
    assign lowRangeB_uid348_Mult1_b = lowRangeB_uid348_Mult1_in[3:0];

    // redist13_lowRangeB_uid348_Mult1_b_1(DELAY,511)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_lowRangeB_uid348_Mult1_b_1_q <= $unsigned(lowRangeB_uid348_Mult1_b);
        end
    end

    // a_subconst_145_uid351_Mult1(BITJOIN,350)@12
    assign a_subconst_145_uid351_Mult1_q = {a_subconst_145_sumAHighB_uid350_Mult1_q, redist13_lowRangeB_uid348_Mult1_b_1_q};

    // lowRangeB_uid353_Mult1_bit_select_merged(BITSELECT,493)@12
    assign lowRangeB_uid353_Mult1_bit_select_merged_b = a_subconst_145_uid351_Mult1_q[9:0];
    assign lowRangeB_uid353_Mult1_bit_select_merged_c = a_subconst_145_uid351_Mult1_q[24:10];

    // highBBits_uid338_Mult1(BITSELECT,337)@11
    assign highBBits_uid338_Mult1_b = redist24_Convert3_sel_x_b_2_q[15:1];

    // addsumAHighB_uid339_Mult1(ADD,338)@11 + 1
    assign addsumAHighB_uid339_Mult1_a = {1'b0, redist24_Convert3_sel_x_b_2_q};
    assign addsumAHighB_uid339_Mult1_b = {2'b00, highBBits_uid338_Mult1_b};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            addsumAHighB_uid339_Mult1_o <= $unsigned(addsumAHighB_uid339_Mult1_a) + $unsigned(addsumAHighB_uid339_Mult1_b);
        end
    end
    assign addsumAHighB_uid339_Mult1_q = addsumAHighB_uid339_Mult1_o[16:0];

    // lowRangeB_uid337_Mult1(BITSELECT,336)@11
    assign lowRangeB_uid337_Mult1_in = redist24_Convert3_sel_x_b_2_q[0:0];
    assign lowRangeB_uid337_Mult1_b = lowRangeB_uid337_Mult1_in[0:0];

    // redist14_lowRangeB_uid337_Mult1_b_1(DELAY,512)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist14_lowRangeB_uid337_Mult1_b_1_q <= $unsigned(lowRangeB_uid337_Mult1_b);
        end
    end

    // add_uid340_Mult1(BITJOIN,339)@12
    assign add_uid340_Mult1_q = {addsumAHighB_uid339_Mult1_q, redist14_lowRangeB_uid337_Mult1_b_1_q};

    // a_subconst_3217_sumAHighB_uid355_Mult1(ADD,354)@12 + 1
    assign a_subconst_3217_sumAHighB_uid355_Mult1_a = {1'b0, add_uid340_Mult1_q};
    assign a_subconst_3217_sumAHighB_uid355_Mult1_b = {4'b0000, lowRangeB_uid353_Mult1_bit_select_merged_c};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            a_subconst_3217_sumAHighB_uid355_Mult1_o <= $unsigned(a_subconst_3217_sumAHighB_uid355_Mult1_a) + $unsigned(a_subconst_3217_sumAHighB_uid355_Mult1_b);
        end
    end
    assign a_subconst_3217_sumAHighB_uid355_Mult1_q = a_subconst_3217_sumAHighB_uid355_Mult1_o[18:0];

    // redist1_lowRangeB_uid353_Mult1_bit_select_merged_b_1(DELAY,499)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_lowRangeB_uid353_Mult1_bit_select_merged_b_1_q <= $unsigned(lowRangeB_uid353_Mult1_bit_select_merged_b);
        end
    end

    // a_subconst_3217_uid356_Mult1(BITJOIN,355)@13
    assign a_subconst_3217_uid356_Mult1_q = {a_subconst_3217_sumAHighB_uid355_Mult1_q, redist1_lowRangeB_uid353_Mult1_bit_select_merged_b_1_q};

    // sR_bottomExtension_uid359_Mult1(CONSTANT,358)
    assign sR_bottomExtension_uid359_Mult1_q = $unsigned(3'b000);

    // sR_mergedSignalTM_uid361_Mult1(BITJOIN,360)@13
    assign sR_mergedSignalTM_uid361_Mult1_q = {a_subconst_3217_uid356_Mult1_q, sR_bottomExtension_uid359_Mult1_q};

    // CmpGE(COMPARE,7)@13 + 1
    assign CmpGE_a = $unsigned({{2{sR_mergedSignalTM_uid361_Mult1_q[31]}}, sR_mergedSignalTM_uid361_Mult1_q});
    assign CmpGE_b = $unsigned({{2{CmpGE_PreShift_1_q[31]}}, CmpGE_PreShift_1_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            CmpGE_o <= $unsigned($signed(CmpGE_a) - $signed(CmpGE_b));
        end
    end
    assign CmpGE_n[0] = ~ (CmpGE_o[33]);

    // Const2(CONSTANT,10)
    assign Const2_q = $unsigned(16'b0110010010001000);

    // Sub_PreShift_1(BITSHIFT,48)@14
    assign Sub_PreShift_1_qint = { Const2_q, 16'b0000000000000000 };
    assign Sub_PreShift_1_q = Sub_PreShift_1_qint[31:0];

    // redist12_sR_mergedSignalTM_uid361_Mult1_q_1(DELAY,510)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist12_sR_mergedSignalTM_uid361_Mult1_q_1_q <= $unsigned(sR_mergedSignalTM_uid361_Mult1_q);
        end
    end

    // Sub_Mux_merged(SUB,413)@14 + 1
    assign Sub_Mux_merged_a = $unsigned({{2{redist12_sR_mergedSignalTM_uid361_Mult1_q_1_q[31]}}, redist12_sR_mergedSignalTM_uid361_Mult1_q_1_q});
    assign Sub_Mux_merged_b = $unsigned({{2{Sub_PreShift_1_q[31]}}, Sub_PreShift_1_q});
    assign Sub_Mux_merged_i = Sub_Mux_merged_a;
    assign Sub_Mux_merged_a1 = Sub_Mux_merged_i;
    assign Sub_Mux_merged_b1 = CmpGE_n == 1'b0 ? 34'b0 : Sub_Mux_merged_b;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Sub_Mux_merged_o <= $unsigned($signed(Sub_Mux_merged_a1) - $signed(Sub_Mux_merged_b1));
        end
    end
    assign Sub_Mux_merged_q = Sub_Mux_merged_o[32:0];

    // Const5(CONSTANT,13)
    assign Const5_q = $unsigned(16'b0000000000000000);

    // Mux1_PreShift_0(BITSHIFT,49)@15
    assign Mux1_PreShift_0_qint = { Const5_q, 13'b0000000000000 };
    assign Mux1_PreShift_0_q = Mux1_PreShift_0_qint[28:0];

    // redist29_ChannelIn_cunroll_x_in_6_CP_EN1_tpl_15(DELAY,527)
    dspba_delay_ver #( .width(1), .depth(15), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist29_ChannelIn_cunroll_x_in_6_CP_EN1_tpl_15 ( .xin(in_6_CP_EN1_tpl), .xout(redist29_ChannelIn_cunroll_x_in_6_CP_EN1_tpl_15_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ChooseBits(CHOOSEBITS,6)@15
    assign ChooseBits_a = redist29_ChannelIn_cunroll_x_in_6_CP_EN1_tpl_15_q;
    assign ChooseBits_q = ChooseBits_a[0:0];

    // And_rsrvd_fix(LOGICAL,2)@15
    assign And_rsrvd_fix_q = in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl & ChooseBits_q;

    // Mux1(MUX,24)@15
    assign Mux1_s = And_rsrvd_fix_q;
    always @(Mux1_s or Mux1_PreShift_0_q or Sub_Mux_merged_q)
    begin
        unique case (Mux1_s)
            1'b0 : Mux1_q = {{4{Mux1_PreShift_0_q[28]}}, Mux1_PreShift_0_q};
            1'b1 : Mux1_q = Sub_Mux_merged_q;
            default : Mux1_q = 33'b0;
        endcase
    end

    // Convert5_rnd_trunc(BITSHIFT,486)@15
    assign Convert5_rnd_trunc_qint = Mux1_q;
    assign Convert5_rnd_trunc_q = Convert5_rnd_trunc_qint[32:14];

    // redist7_Convert5_rnd_trunc_q_1(DELAY,505)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist7_Convert5_rnd_trunc_q_1_q <= $unsigned(Convert5_rnd_trunc_q);
        end
    end

    // Convert5_rnd_add(ADD,487)@16
    assign Convert5_rnd_add_a = $unsigned({{1{redist7_Convert5_rnd_trunc_q_1_q[18]}}, redist7_Convert5_rnd_trunc_q_1_q});
    assign Convert5_rnd_add_b = $unsigned({{18{Convert3_rnd_bias_q[1]}}, Convert3_rnd_bias_q});
    assign Convert5_rnd_add_o = $unsigned($signed(Convert5_rnd_add_a) + $signed(Convert5_rnd_add_b));
    assign Convert5_rnd_add_q = Convert5_rnd_add_o[19:0];

    // Convert5_rnd_shift(BITSHIFT,488)@16
    assign Convert5_rnd_shift_qint = Convert5_rnd_add_q;
    assign Convert5_rnd_shift_q = Convert5_rnd_shift_qint[19:1];

    // Convert5_sel_x(BITSELECT,35)@16
    assign Convert5_sel_x_b = $unsigned(Convert5_rnd_shift_q[15:0]);

    // redist21_Convert5_sel_x_b_1(DELAY,519)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist21_Convert5_sel_x_b_1_q <= $unsigned(Convert5_sel_x_b);
        end
    end

    // CORDIC_CmpNegPiOv2_00(COMPARE,60)@17 + 1
    assign CORDIC_CmpNegPiOv2_00_a = $unsigned({{2{redist21_Convert5_sel_x_b_1_q[15]}}, redist21_Convert5_sel_x_b_1_q});
    assign CORDIC_CmpNegPiOv2_00_b = $unsigned({{2{CORDIC_CnstNegPiOv2_q[15]}}, CORDIC_CnstNegPiOv2_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            CORDIC_CmpNegPiOv2_00_o <= $unsigned($signed(CORDIC_CmpNegPiOv2_00_a) - $signed(CORDIC_CmpNegPiOv2_00_b));
        end
    end
    assign CORDIC_CmpNegPiOv2_00_c[0] = CORDIC_CmpNegPiOv2_00_o[17];

    // CORDIC_CmpPiOv2_00(COMPARE,59)@17 + 1
    assign CORDIC_CmpPiOv2_00_a = $unsigned({{2{Const1_q[15]}}, Const1_q});
    assign CORDIC_CmpPiOv2_00_b = $unsigned({{2{redist21_Convert5_sel_x_b_1_q[15]}}, redist21_Convert5_sel_x_b_1_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            CORDIC_CmpPiOv2_00_o <= $unsigned($signed(CORDIC_CmpPiOv2_00_a) - $signed(CORDIC_CmpPiOv2_00_b));
        end
    end
    assign CORDIC_CmpPiOv2_00_c[0] = CORDIC_CmpPiOv2_00_o[17];

    // CORDIC_AorB_00(LOGICAL,61)@18 + 1
    assign CORDIC_AorB_00_qi = ~ (CORDIC_CmpPiOv2_00_c | CORDIC_CmpNegPiOv2_00_c);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    CORDIC_AorB_00_delay ( .xin(CORDIC_AorB_00_qi), .xout(CORDIC_AorB_00_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist19_CORDIC_AorB_00_q_19(DELAY,517)
    dspba_delay_ver #( .width(1), .depth(18), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist19_CORDIC_AorB_00_q_19 ( .xin(CORDIC_AorB_00_q), .xout(redist19_CORDIC_AorB_00_q_19_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // CORDIC_CmpPLtZero_s13(LOGICAL,240)@33
    assign CORDIC_CmpPLtZero_s13_q = $unsigned(CORDIC_Pout_s12_q[17:17]);

    // CORDIC_CnstAtan_s13(CONSTANT,235)
    assign CORDIC_CnstAtan_s13_q = $unsigned(16'b0000000000000001);

    // CORDIC_CmpPLtZero_s12(LOGICAL,227)@32
    assign CORDIC_CmpPLtZero_s12_q = $unsigned(CORDIC_Pout_s11_q[17:17]);

    // CORDIC_CnstAtan_s12(CONSTANT,222)
    assign CORDIC_CnstAtan_s12_q = $unsigned(16'b0000000000000010);

    // CORDIC_CmpPLtZero_s11(LOGICAL,214)@31
    assign CORDIC_CmpPLtZero_s11_q = $unsigned(CORDIC_Pout_s10_q[17:17]);

    // CORDIC_CnstAtan_s11(CONSTANT,209)
    assign CORDIC_CnstAtan_s11_q = $unsigned(16'b0000000000000100);

    // CORDIC_CmpPLtZero_s10(LOGICAL,201)@30
    assign CORDIC_CmpPLtZero_s10_q = $unsigned(CORDIC_Pout_s9_q[17:17]);

    // CORDIC_CnstAtan_s10(CONSTANT,196)
    assign CORDIC_CnstAtan_s10_q = $unsigned(16'b0000000000001000);

    // CORDIC_CmpPLtZero_s9(LOGICAL,188)@29
    assign CORDIC_CmpPLtZero_s9_q = $unsigned(CORDIC_Pout_s8_q[17:17]);

    // CORDIC_CnstAtan_s9(CONSTANT,183)
    assign CORDIC_CnstAtan_s9_q = $unsigned(16'b0000000000010000);

    // CORDIC_CmpPLtZero_s8(LOGICAL,175)@28
    assign CORDIC_CmpPLtZero_s8_q = $unsigned(CORDIC_Pout_s7_q[17:17]);

    // CORDIC_CnstAtan_s8(CONSTANT,170)
    assign CORDIC_CnstAtan_s8_q = $unsigned(16'b0000000000100000);

    // CORDIC_CmpPLtZero_s7(LOGICAL,162)@27
    assign CORDIC_CmpPLtZero_s7_q = $unsigned(CORDIC_Pout_s6_q[17:17]);

    // CORDIC_CnstAtan_s7(CONSTANT,157)
    assign CORDIC_CnstAtan_s7_q = $unsigned(16'b0000000001000000);

    // CORDIC_CmpPLtZero_s6(LOGICAL,149)@26
    assign CORDIC_CmpPLtZero_s6_q = $unsigned(CORDIC_Pout_s5_q[17:17]);

    // CORDIC_CnstAtan_s6(CONSTANT,144)
    assign CORDIC_CnstAtan_s6_q = $unsigned(16'b0000000010000000);

    // CORDIC_CmpPLtZero_s5(LOGICAL,136)@25
    assign CORDIC_CmpPLtZero_s5_q = $unsigned(CORDIC_Pout_s4_q[17:17]);

    // CORDIC_CnstAtan_s5(CONSTANT,131)
    assign CORDIC_CnstAtan_s5_q = $unsigned(16'b0000000100000000);

    // CORDIC_CmpPLtZero_s4(LOGICAL,123)@24
    assign CORDIC_CmpPLtZero_s4_q = $unsigned(CORDIC_Pout_s3_q[17:17]);

    // CORDIC_CnstAtan_s4(CONSTANT,118)
    assign CORDIC_CnstAtan_s4_q = $unsigned(16'b0000000111111111);

    // CORDIC_CmpPLtZero_s3(LOGICAL,110)@23
    assign CORDIC_CmpPLtZero_s3_q = $unsigned(CORDIC_Pout_s2_q[17:17]);

    // CORDIC_CnstAtan_s3(CONSTANT,105)
    assign CORDIC_CnstAtan_s3_q = $unsigned(16'b0000001111111011);

    // CORDIC_CmpPLtZero_s2(LOGICAL,97)@22
    assign CORDIC_CmpPLtZero_s2_q = $unsigned(CORDIC_Pout_s1_q[17:17]);

    // CORDIC_CnstAtan_s2(CONSTANT,92)
    assign CORDIC_CnstAtan_s2_q = $unsigned(16'b0000011111010111);

    // CORDIC_CmpPLtZero_s1(LOGICAL,84)@21
    assign CORDIC_CmpPLtZero_s1_q = $unsigned(CORDIC_Pout_s0_q[17:17]);

    // CORDIC_CnstAtan_s1(CONSTANT,79)
    assign CORDIC_CnstAtan_s1_q = $unsigned(16'b0000111011010110);

    // CORDIC_CmpPLtZero_s0(LOGICAL,71)@20
    assign CORDIC_CmpPLtZero_s0_q = $unsigned(CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_q[17:17]);

    // CORDIC_CnstAtan_s0(CONSTANT,66)
    assign CORDIC_CnstAtan_s0_q = $unsigned(16'b0001100100100010);

    // redist20_CORDIC_CmpNegPiOv2_00_c_2(DELAY,518)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist20_CORDIC_CmpNegPiOv2_00_c_2_q <= $unsigned(CORDIC_CmpNegPiOv2_00_c);
        end
    end

    // redist22_Convert5_sel_x_b_3(DELAY,520)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist22_Convert5_sel_x_b_3_delay_0 <= $unsigned(redist21_Convert5_sel_x_b_1_q);
            redist22_Convert5_sel_x_b_3_q <= redist22_Convert5_sel_x_b_3_delay_0;
        end
    end

    // CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged(ADDSUB,416)@19 + 1
    assign CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_s = redist20_CORDIC_CmpNegPiOv2_00_c_2_q;
    assign CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_a = $unsigned({{3{redist22_Convert5_sel_x_b_3_q[15]}}, redist22_Convert5_sel_x_b_3_q});
    assign CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_b = $unsigned({{3{Const2_q[15]}}, Const2_q});
    assign CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_i = CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_a;
    assign CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_a1 = CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_i;
    assign CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_b1 = CORDIC_AorB_00_q == 1'b1 ? 19'b0 : CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_b;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_s == 1'b1)
            begin
                CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_o <= $unsigned($signed(CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_a1) + $signed(CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_b1));
            end
            else
            begin
                CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_o <= $unsigned($signed(CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_a1) - $signed(CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_b1));
            end
        end
    end
    assign CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_q = CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_o[17:0];

    // CORDIC_Pout_s0(ADDSUB,77)@20 + 1
    assign CORDIC_Pout_s0_s = CORDIC_CmpPLtZero_s0_q;
    assign CORDIC_Pout_s0_a = $unsigned({{1{CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_q[17]}}, CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_q});
    assign CORDIC_Pout_s0_b = $unsigned({{3{CORDIC_CnstAtan_s0_q[15]}}, CORDIC_CnstAtan_s0_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Pout_s0_s == 1'b1)
            begin
                CORDIC_Pout_s0_o <= $unsigned($signed(CORDIC_Pout_s0_a) + $signed(CORDIC_Pout_s0_b));
            end
            else
            begin
                CORDIC_Pout_s0_o <= $unsigned($signed(CORDIC_Pout_s0_a) - $signed(CORDIC_Pout_s0_b));
            end
        end
    end
    assign CORDIC_Pout_s0_q = CORDIC_Pout_s0_o[17:0];

    // CORDIC_Pout_s1(ADDSUB,90)@21 + 1
    assign CORDIC_Pout_s1_s = CORDIC_CmpPLtZero_s1_q;
    assign CORDIC_Pout_s1_a = $unsigned({{1{CORDIC_Pout_s0_q[17]}}, CORDIC_Pout_s0_q});
    assign CORDIC_Pout_s1_b = $unsigned({{3{CORDIC_CnstAtan_s1_q[15]}}, CORDIC_CnstAtan_s1_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Pout_s1_s == 1'b1)
            begin
                CORDIC_Pout_s1_o <= $unsigned($signed(CORDIC_Pout_s1_a) + $signed(CORDIC_Pout_s1_b));
            end
            else
            begin
                CORDIC_Pout_s1_o <= $unsigned($signed(CORDIC_Pout_s1_a) - $signed(CORDIC_Pout_s1_b));
            end
        end
    end
    assign CORDIC_Pout_s1_q = CORDIC_Pout_s1_o[17:0];

    // CORDIC_Pout_s2(ADDSUB,103)@22 + 1
    assign CORDIC_Pout_s2_s = CORDIC_CmpPLtZero_s2_q;
    assign CORDIC_Pout_s2_a = $unsigned({{1{CORDIC_Pout_s1_q[17]}}, CORDIC_Pout_s1_q});
    assign CORDIC_Pout_s2_b = $unsigned({{3{CORDIC_CnstAtan_s2_q[15]}}, CORDIC_CnstAtan_s2_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Pout_s2_s == 1'b1)
            begin
                CORDIC_Pout_s2_o <= $unsigned($signed(CORDIC_Pout_s2_a) + $signed(CORDIC_Pout_s2_b));
            end
            else
            begin
                CORDIC_Pout_s2_o <= $unsigned($signed(CORDIC_Pout_s2_a) - $signed(CORDIC_Pout_s2_b));
            end
        end
    end
    assign CORDIC_Pout_s2_q = CORDIC_Pout_s2_o[17:0];

    // CORDIC_Pout_s3(ADDSUB,116)@23 + 1
    assign CORDIC_Pout_s3_s = CORDIC_CmpPLtZero_s3_q;
    assign CORDIC_Pout_s3_a = $unsigned({{1{CORDIC_Pout_s2_q[17]}}, CORDIC_Pout_s2_q});
    assign CORDIC_Pout_s3_b = $unsigned({{3{CORDIC_CnstAtan_s3_q[15]}}, CORDIC_CnstAtan_s3_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Pout_s3_s == 1'b1)
            begin
                CORDIC_Pout_s3_o <= $unsigned($signed(CORDIC_Pout_s3_a) + $signed(CORDIC_Pout_s3_b));
            end
            else
            begin
                CORDIC_Pout_s3_o <= $unsigned($signed(CORDIC_Pout_s3_a) - $signed(CORDIC_Pout_s3_b));
            end
        end
    end
    assign CORDIC_Pout_s3_q = CORDIC_Pout_s3_o[17:0];

    // CORDIC_Pout_s4(ADDSUB,129)@24 + 1
    assign CORDIC_Pout_s4_s = CORDIC_CmpPLtZero_s4_q;
    assign CORDIC_Pout_s4_a = $unsigned({{1{CORDIC_Pout_s3_q[17]}}, CORDIC_Pout_s3_q});
    assign CORDIC_Pout_s4_b = $unsigned({{3{CORDIC_CnstAtan_s4_q[15]}}, CORDIC_CnstAtan_s4_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Pout_s4_s == 1'b1)
            begin
                CORDIC_Pout_s4_o <= $unsigned($signed(CORDIC_Pout_s4_a) + $signed(CORDIC_Pout_s4_b));
            end
            else
            begin
                CORDIC_Pout_s4_o <= $unsigned($signed(CORDIC_Pout_s4_a) - $signed(CORDIC_Pout_s4_b));
            end
        end
    end
    assign CORDIC_Pout_s4_q = CORDIC_Pout_s4_o[17:0];

    // CORDIC_Pout_s5(ADDSUB,142)@25 + 1
    assign CORDIC_Pout_s5_s = CORDIC_CmpPLtZero_s5_q;
    assign CORDIC_Pout_s5_a = $unsigned({{1{CORDIC_Pout_s4_q[17]}}, CORDIC_Pout_s4_q});
    assign CORDIC_Pout_s5_b = $unsigned({{3{CORDIC_CnstAtan_s5_q[15]}}, CORDIC_CnstAtan_s5_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Pout_s5_s == 1'b1)
            begin
                CORDIC_Pout_s5_o <= $unsigned($signed(CORDIC_Pout_s5_a) + $signed(CORDIC_Pout_s5_b));
            end
            else
            begin
                CORDIC_Pout_s5_o <= $unsigned($signed(CORDIC_Pout_s5_a) - $signed(CORDIC_Pout_s5_b));
            end
        end
    end
    assign CORDIC_Pout_s5_q = CORDIC_Pout_s5_o[17:0];

    // CORDIC_Pout_s6(ADDSUB,155)@26 + 1
    assign CORDIC_Pout_s6_s = CORDIC_CmpPLtZero_s6_q;
    assign CORDIC_Pout_s6_a = $unsigned({{1{CORDIC_Pout_s5_q[17]}}, CORDIC_Pout_s5_q});
    assign CORDIC_Pout_s6_b = $unsigned({{3{CORDIC_CnstAtan_s6_q[15]}}, CORDIC_CnstAtan_s6_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Pout_s6_s == 1'b1)
            begin
                CORDIC_Pout_s6_o <= $unsigned($signed(CORDIC_Pout_s6_a) + $signed(CORDIC_Pout_s6_b));
            end
            else
            begin
                CORDIC_Pout_s6_o <= $unsigned($signed(CORDIC_Pout_s6_a) - $signed(CORDIC_Pout_s6_b));
            end
        end
    end
    assign CORDIC_Pout_s6_q = CORDIC_Pout_s6_o[17:0];

    // CORDIC_Pout_s7(ADDSUB,168)@27 + 1
    assign CORDIC_Pout_s7_s = CORDIC_CmpPLtZero_s7_q;
    assign CORDIC_Pout_s7_a = $unsigned({{1{CORDIC_Pout_s6_q[17]}}, CORDIC_Pout_s6_q});
    assign CORDIC_Pout_s7_b = $unsigned({{3{CORDIC_CnstAtan_s7_q[15]}}, CORDIC_CnstAtan_s7_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Pout_s7_s == 1'b1)
            begin
                CORDIC_Pout_s7_o <= $unsigned($signed(CORDIC_Pout_s7_a) + $signed(CORDIC_Pout_s7_b));
            end
            else
            begin
                CORDIC_Pout_s7_o <= $unsigned($signed(CORDIC_Pout_s7_a) - $signed(CORDIC_Pout_s7_b));
            end
        end
    end
    assign CORDIC_Pout_s7_q = CORDIC_Pout_s7_o[17:0];

    // CORDIC_Pout_s8(ADDSUB,181)@28 + 1
    assign CORDIC_Pout_s8_s = CORDIC_CmpPLtZero_s8_q;
    assign CORDIC_Pout_s8_a = $unsigned({{1{CORDIC_Pout_s7_q[17]}}, CORDIC_Pout_s7_q});
    assign CORDIC_Pout_s8_b = $unsigned({{3{CORDIC_CnstAtan_s8_q[15]}}, CORDIC_CnstAtan_s8_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Pout_s8_s == 1'b1)
            begin
                CORDIC_Pout_s8_o <= $unsigned($signed(CORDIC_Pout_s8_a) + $signed(CORDIC_Pout_s8_b));
            end
            else
            begin
                CORDIC_Pout_s8_o <= $unsigned($signed(CORDIC_Pout_s8_a) - $signed(CORDIC_Pout_s8_b));
            end
        end
    end
    assign CORDIC_Pout_s8_q = CORDIC_Pout_s8_o[17:0];

    // CORDIC_Pout_s9(ADDSUB,194)@29 + 1
    assign CORDIC_Pout_s9_s = CORDIC_CmpPLtZero_s9_q;
    assign CORDIC_Pout_s9_a = $unsigned({{1{CORDIC_Pout_s8_q[17]}}, CORDIC_Pout_s8_q});
    assign CORDIC_Pout_s9_b = $unsigned({{3{CORDIC_CnstAtan_s9_q[15]}}, CORDIC_CnstAtan_s9_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Pout_s9_s == 1'b1)
            begin
                CORDIC_Pout_s9_o <= $unsigned($signed(CORDIC_Pout_s9_a) + $signed(CORDIC_Pout_s9_b));
            end
            else
            begin
                CORDIC_Pout_s9_o <= $unsigned($signed(CORDIC_Pout_s9_a) - $signed(CORDIC_Pout_s9_b));
            end
        end
    end
    assign CORDIC_Pout_s9_q = CORDIC_Pout_s9_o[17:0];

    // CORDIC_Pout_s10(ADDSUB,207)@30 + 1
    assign CORDIC_Pout_s10_s = CORDIC_CmpPLtZero_s10_q;
    assign CORDIC_Pout_s10_a = $unsigned({{1{CORDIC_Pout_s9_q[17]}}, CORDIC_Pout_s9_q});
    assign CORDIC_Pout_s10_b = $unsigned({{3{CORDIC_CnstAtan_s10_q[15]}}, CORDIC_CnstAtan_s10_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Pout_s10_s == 1'b1)
            begin
                CORDIC_Pout_s10_o <= $unsigned($signed(CORDIC_Pout_s10_a) + $signed(CORDIC_Pout_s10_b));
            end
            else
            begin
                CORDIC_Pout_s10_o <= $unsigned($signed(CORDIC_Pout_s10_a) - $signed(CORDIC_Pout_s10_b));
            end
        end
    end
    assign CORDIC_Pout_s10_q = CORDIC_Pout_s10_o[17:0];

    // CORDIC_Pout_s11(ADDSUB,220)@31 + 1
    assign CORDIC_Pout_s11_s = CORDIC_CmpPLtZero_s11_q;
    assign CORDIC_Pout_s11_a = $unsigned({{1{CORDIC_Pout_s10_q[17]}}, CORDIC_Pout_s10_q});
    assign CORDIC_Pout_s11_b = $unsigned({{3{CORDIC_CnstAtan_s11_q[15]}}, CORDIC_CnstAtan_s11_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Pout_s11_s == 1'b1)
            begin
                CORDIC_Pout_s11_o <= $unsigned($signed(CORDIC_Pout_s11_a) + $signed(CORDIC_Pout_s11_b));
            end
            else
            begin
                CORDIC_Pout_s11_o <= $unsigned($signed(CORDIC_Pout_s11_a) - $signed(CORDIC_Pout_s11_b));
            end
        end
    end
    assign CORDIC_Pout_s11_q = CORDIC_Pout_s11_o[17:0];

    // CORDIC_Pout_s12(ADDSUB,233)@32 + 1
    assign CORDIC_Pout_s12_s = CORDIC_CmpPLtZero_s12_q;
    assign CORDIC_Pout_s12_a = $unsigned({{1{CORDIC_Pout_s11_q[17]}}, CORDIC_Pout_s11_q});
    assign CORDIC_Pout_s12_b = $unsigned({{3{CORDIC_CnstAtan_s12_q[15]}}, CORDIC_CnstAtan_s12_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Pout_s12_s == 1'b1)
            begin
                CORDIC_Pout_s12_o <= $unsigned($signed(CORDIC_Pout_s12_a) + $signed(CORDIC_Pout_s12_b));
            end
            else
            begin
                CORDIC_Pout_s12_o <= $unsigned($signed(CORDIC_Pout_s12_a) - $signed(CORDIC_Pout_s12_b));
            end
        end
    end
    assign CORDIC_Pout_s12_q = CORDIC_Pout_s12_o[17:0];

    // CORDIC_Pout_s13(ADDSUB,246)@33
    assign CORDIC_Pout_s13_s = CORDIC_CmpPLtZero_s13_q;
    assign CORDIC_Pout_s13_a = $unsigned({{1{CORDIC_Pout_s12_q[17]}}, CORDIC_Pout_s12_q});
    assign CORDIC_Pout_s13_b = $unsigned({{3{CORDIC_CnstAtan_s13_q[15]}}, CORDIC_CnstAtan_s13_q});
    always @(CORDIC_Pout_s13_a or CORDIC_Pout_s13_b or CORDIC_Pout_s13_s)
    begin
        if (CORDIC_Pout_s13_s == 1'b1)
        begin
            CORDIC_Pout_s13_o = $unsigned($signed(CORDIC_Pout_s13_a) + $signed(CORDIC_Pout_s13_b));
        end
        else
        begin
            CORDIC_Pout_s13_o = $unsigned($signed(CORDIC_Pout_s13_a) - $signed(CORDIC_Pout_s13_b));
        end
    end
    assign CORDIC_Pout_s13_q = CORDIC_Pout_s13_o[17:0];

    // CORDIC_CmpPLtZero_s14(LOGICAL,253)@33 + 1
    assign CORDIC_CmpPLtZero_s14_qi = $unsigned(CORDIC_Pout_s13_q[17:17]);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    CORDIC_CmpPLtZero_s14_delay ( .xin(CORDIC_CmpPLtZero_s14_qi), .xout(CORDIC_CmpPLtZero_s14_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist15_CORDIC_CmpPLtZero_s14_q_2(DELAY,513)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist15_CORDIC_CmpPLtZero_s14_q_2_q <= $unsigned(CORDIC_CmpPLtZero_s14_q);
        end
    end

    // redist16_CORDIC_CmpPLtZero_s14_q_3(DELAY,514)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist16_CORDIC_CmpPLtZero_s14_q_3_q <= $unsigned(redist15_CORDIC_CmpPLtZero_s14_q_2_q);
        end
    end

    // CORDIC_CmpPGeZero_s14(LOGICAL,250)@33 + 1
    assign CORDIC_CmpPGeZero_s14_qi = $unsigned(~ (CORDIC_Pout_s13_q[17:17]));
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    CORDIC_CmpPGeZero_s14_delay ( .xin(CORDIC_CmpPGeZero_s14_qi), .xout(CORDIC_CmpPGeZero_s14_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist17_CORDIC_CmpPGeZero_s14_q_2(DELAY,515)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist17_CORDIC_CmpPGeZero_s14_q_2_q <= $unsigned(CORDIC_CmpPGeZero_s14_q);
        end
    end

    // CORDIC_CmpPGeZero_s13(LOGICAL,237)@33
    assign CORDIC_CmpPGeZero_s13_q = $unsigned(~ (CORDIC_Pout_s12_q[17:17]));

    // CORDIC_CmpPGeZero_s11(LOGICAL,211)@31
    assign CORDIC_CmpPGeZero_s11_q = $unsigned(~ (CORDIC_Pout_s10_q[17:17]));

    // CORDIC_CmpPGeZero_s9(LOGICAL,185)@29
    assign CORDIC_CmpPGeZero_s9_q = $unsigned(~ (CORDIC_Pout_s8_q[17:17]));

    // CORDIC_CmpPGeZero_s7(LOGICAL,159)@27
    assign CORDIC_CmpPGeZero_s7_q = $unsigned(~ (CORDIC_Pout_s6_q[17:17]));

    // CORDIC_CmpPGeZero_s5(LOGICAL,133)@25
    assign CORDIC_CmpPGeZero_s5_q = $unsigned(~ (CORDIC_Pout_s4_q[17:17]));

    // CORDIC_CmpPGeZero_s3(LOGICAL,107)@23
    assign CORDIC_CmpPGeZero_s3_q = $unsigned(~ (CORDIC_Pout_s2_q[17:17]));

    // CORDIC_CmpPGeZero_s1(LOGICAL,81)@21
    assign CORDIC_CmpPGeZero_s1_q = $unsigned(~ (CORDIC_Pout_s0_q[17:17]));

    // CORDIC_ShiftX_s1_b_const(CONSTANT,496)
    assign CORDIC_ShiftX_s1_b_const_q = $unsigned(17'b00010011011011101);

    // CORDIC_CmpPGeZero_s0(LOGICAL,68)@20
    assign CORDIC_CmpPGeZero_s0_q = $unsigned(~ (CORDIC_PAddSubPi_00_CORDIC_SelectP_00_merged_q[17:17]));

    // muxopt_assign_id0_q_const(CONSTANT,495)
    assign muxopt_assign_id0_q_const_q = $unsigned(16'b0100110110111010);

    // CORDIC_Yout_s0(ADDSUB,76)@20 + 1
    assign CORDIC_Yout_s0_s = CORDIC_CmpPGeZero_s0_q;
    assign CORDIC_Yout_s0_a = $unsigned({{3{Const5_q[15]}}, Const5_q});
    assign CORDIC_Yout_s0_b = $unsigned({{3{muxopt_assign_id0_q_const_q[15]}}, muxopt_assign_id0_q_const_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s0_s == 1'b1)
            begin
                CORDIC_Yout_s0_o <= $unsigned($signed(CORDIC_Yout_s0_a) + $signed(CORDIC_Yout_s0_b));
            end
            else
            begin
                CORDIC_Yout_s0_o <= $unsigned($signed(CORDIC_Yout_s0_a) - $signed(CORDIC_Yout_s0_b));
            end
        end
    end
    assign CORDIC_Yout_s0_q = CORDIC_Yout_s0_o[17:0];

    // CORDIC_Yout_s1(ADDSUB,89)@21 + 1
    assign CORDIC_Yout_s1_s = CORDIC_CmpPGeZero_s1_q;
    assign CORDIC_Yout_s1_a = $unsigned({{1{CORDIC_Yout_s0_q[17]}}, CORDIC_Yout_s0_q});
    assign CORDIC_Yout_s1_b = $unsigned({{2{CORDIC_ShiftX_s1_b_const_q[16]}}, CORDIC_ShiftX_s1_b_const_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s1_s == 1'b1)
            begin
                CORDIC_Yout_s1_o <= $unsigned($signed(CORDIC_Yout_s1_a) + $signed(CORDIC_Yout_s1_b));
            end
            else
            begin
                CORDIC_Yout_s1_o <= $unsigned($signed(CORDIC_Yout_s1_a) - $signed(CORDIC_Yout_s1_b));
            end
        end
    end
    assign CORDIC_Yout_s1_q = CORDIC_Yout_s1_o[17:0];

    // CORDIC_ShiftY_s2(BITSELECT,100)@22
    assign CORDIC_ShiftY_s2_b = $unsigned(CORDIC_Yout_s1_q[17:2]);

    // CORDIC_ShiftY_s1(BITSELECT,87)@21
    assign CORDIC_ShiftY_s1_b = $unsigned(CORDIC_Yout_s0_q[17:1]);

    // CORDIC_Xout_s0_bit_select_b_const(CONSTANT,497)
    assign CORDIC_Xout_s0_bit_select_b_const_q = $unsigned(18'b000100110110111010);

    // CORDIC_Xout_s1(ADDSUB,88)@21 + 1
    assign CORDIC_Xout_s1_s = CORDIC_CmpPLtZero_s1_q;
    assign CORDIC_Xout_s1_a = $unsigned({{1{CORDIC_Xout_s0_bit_select_b_const_q[17]}}, CORDIC_Xout_s0_bit_select_b_const_q});
    assign CORDIC_Xout_s1_b = $unsigned({{2{CORDIC_ShiftY_s1_b[16]}}, CORDIC_ShiftY_s1_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s1_s == 1'b1)
            begin
                CORDIC_Xout_s1_o <= $unsigned($signed(CORDIC_Xout_s1_a) + $signed(CORDIC_Xout_s1_b));
            end
            else
            begin
                CORDIC_Xout_s1_o <= $unsigned($signed(CORDIC_Xout_s1_a) - $signed(CORDIC_Xout_s1_b));
            end
        end
    end
    assign CORDIC_Xout_s1_q = CORDIC_Xout_s1_o[17:0];

    // CORDIC_Xout_s2(ADDSUB,101)@22 + 1
    assign CORDIC_Xout_s2_s = CORDIC_CmpPLtZero_s2_q;
    assign CORDIC_Xout_s2_a = $unsigned({{1{CORDIC_Xout_s1_q[17]}}, CORDIC_Xout_s1_q});
    assign CORDIC_Xout_s2_b = $unsigned({{3{CORDIC_ShiftY_s2_b[15]}}, CORDIC_ShiftY_s2_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s2_s == 1'b1)
            begin
                CORDIC_Xout_s2_o <= $unsigned($signed(CORDIC_Xout_s2_a) + $signed(CORDIC_Xout_s2_b));
            end
            else
            begin
                CORDIC_Xout_s2_o <= $unsigned($signed(CORDIC_Xout_s2_a) - $signed(CORDIC_Xout_s2_b));
            end
        end
    end
    assign CORDIC_Xout_s2_q = CORDIC_Xout_s2_o[17:0];

    // CORDIC_ShiftX_s3(BITSELECT,112)@23
    assign CORDIC_ShiftX_s3_b = $unsigned(CORDIC_Xout_s2_q[17:3]);

    // CORDIC_CmpPGeZero_s2(LOGICAL,94)@22
    assign CORDIC_CmpPGeZero_s2_q = $unsigned(~ (CORDIC_Pout_s1_q[17:17]));

    // CORDIC_ShiftX_s2(BITSELECT,99)@22
    assign CORDIC_ShiftX_s2_b = $unsigned(CORDIC_Xout_s1_q[17:2]);

    // CORDIC_Yout_s2(ADDSUB,102)@22 + 1
    assign CORDIC_Yout_s2_s = CORDIC_CmpPGeZero_s2_q;
    assign CORDIC_Yout_s2_a = $unsigned({{1{CORDIC_Yout_s1_q[17]}}, CORDIC_Yout_s1_q});
    assign CORDIC_Yout_s2_b = $unsigned({{3{CORDIC_ShiftX_s2_b[15]}}, CORDIC_ShiftX_s2_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s2_s == 1'b1)
            begin
                CORDIC_Yout_s2_o <= $unsigned($signed(CORDIC_Yout_s2_a) + $signed(CORDIC_Yout_s2_b));
            end
            else
            begin
                CORDIC_Yout_s2_o <= $unsigned($signed(CORDIC_Yout_s2_a) - $signed(CORDIC_Yout_s2_b));
            end
        end
    end
    assign CORDIC_Yout_s2_q = CORDIC_Yout_s2_o[17:0];

    // CORDIC_Yout_s3(ADDSUB,115)@23 + 1
    assign CORDIC_Yout_s3_s = CORDIC_CmpPGeZero_s3_q;
    assign CORDIC_Yout_s3_a = $unsigned({{1{CORDIC_Yout_s2_q[17]}}, CORDIC_Yout_s2_q});
    assign CORDIC_Yout_s3_b = $unsigned({{4{CORDIC_ShiftX_s3_b[14]}}, CORDIC_ShiftX_s3_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s3_s == 1'b1)
            begin
                CORDIC_Yout_s3_o <= $unsigned($signed(CORDIC_Yout_s3_a) + $signed(CORDIC_Yout_s3_b));
            end
            else
            begin
                CORDIC_Yout_s3_o <= $unsigned($signed(CORDIC_Yout_s3_a) - $signed(CORDIC_Yout_s3_b));
            end
        end
    end
    assign CORDIC_Yout_s3_q = CORDIC_Yout_s3_o[17:0];

    // CORDIC_ShiftY_s4(BITSELECT,126)@24
    assign CORDIC_ShiftY_s4_b = $unsigned(CORDIC_Yout_s3_q[17:4]);

    // CORDIC_ShiftY_s3(BITSELECT,113)@23
    assign CORDIC_ShiftY_s3_b = $unsigned(CORDIC_Yout_s2_q[17:3]);

    // CORDIC_Xout_s3(ADDSUB,114)@23 + 1
    assign CORDIC_Xout_s3_s = CORDIC_CmpPLtZero_s3_q;
    assign CORDIC_Xout_s3_a = $unsigned({{1{CORDIC_Xout_s2_q[17]}}, CORDIC_Xout_s2_q});
    assign CORDIC_Xout_s3_b = $unsigned({{4{CORDIC_ShiftY_s3_b[14]}}, CORDIC_ShiftY_s3_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s3_s == 1'b1)
            begin
                CORDIC_Xout_s3_o <= $unsigned($signed(CORDIC_Xout_s3_a) + $signed(CORDIC_Xout_s3_b));
            end
            else
            begin
                CORDIC_Xout_s3_o <= $unsigned($signed(CORDIC_Xout_s3_a) - $signed(CORDIC_Xout_s3_b));
            end
        end
    end
    assign CORDIC_Xout_s3_q = CORDIC_Xout_s3_o[17:0];

    // CORDIC_Xout_s4(ADDSUB,127)@24 + 1
    assign CORDIC_Xout_s4_s = CORDIC_CmpPLtZero_s4_q;
    assign CORDIC_Xout_s4_a = $unsigned({{1{CORDIC_Xout_s3_q[17]}}, CORDIC_Xout_s3_q});
    assign CORDIC_Xout_s4_b = $unsigned({{5{CORDIC_ShiftY_s4_b[13]}}, CORDIC_ShiftY_s4_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s4_s == 1'b1)
            begin
                CORDIC_Xout_s4_o <= $unsigned($signed(CORDIC_Xout_s4_a) + $signed(CORDIC_Xout_s4_b));
            end
            else
            begin
                CORDIC_Xout_s4_o <= $unsigned($signed(CORDIC_Xout_s4_a) - $signed(CORDIC_Xout_s4_b));
            end
        end
    end
    assign CORDIC_Xout_s4_q = CORDIC_Xout_s4_o[17:0];

    // CORDIC_ShiftX_s5(BITSELECT,138)@25
    assign CORDIC_ShiftX_s5_b = $unsigned(CORDIC_Xout_s4_q[17:5]);

    // CORDIC_CmpPGeZero_s4(LOGICAL,120)@24
    assign CORDIC_CmpPGeZero_s4_q = $unsigned(~ (CORDIC_Pout_s3_q[17:17]));

    // CORDIC_ShiftX_s4(BITSELECT,125)@24
    assign CORDIC_ShiftX_s4_b = $unsigned(CORDIC_Xout_s3_q[17:4]);

    // CORDIC_Yout_s4(ADDSUB,128)@24 + 1
    assign CORDIC_Yout_s4_s = CORDIC_CmpPGeZero_s4_q;
    assign CORDIC_Yout_s4_a = $unsigned({{1{CORDIC_Yout_s3_q[17]}}, CORDIC_Yout_s3_q});
    assign CORDIC_Yout_s4_b = $unsigned({{5{CORDIC_ShiftX_s4_b[13]}}, CORDIC_ShiftX_s4_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s4_s == 1'b1)
            begin
                CORDIC_Yout_s4_o <= $unsigned($signed(CORDIC_Yout_s4_a) + $signed(CORDIC_Yout_s4_b));
            end
            else
            begin
                CORDIC_Yout_s4_o <= $unsigned($signed(CORDIC_Yout_s4_a) - $signed(CORDIC_Yout_s4_b));
            end
        end
    end
    assign CORDIC_Yout_s4_q = CORDIC_Yout_s4_o[17:0];

    // CORDIC_Yout_s5(ADDSUB,141)@25 + 1
    assign CORDIC_Yout_s5_s = CORDIC_CmpPGeZero_s5_q;
    assign CORDIC_Yout_s5_a = $unsigned({{1{CORDIC_Yout_s4_q[17]}}, CORDIC_Yout_s4_q});
    assign CORDIC_Yout_s5_b = $unsigned({{6{CORDIC_ShiftX_s5_b[12]}}, CORDIC_ShiftX_s5_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s5_s == 1'b1)
            begin
                CORDIC_Yout_s5_o <= $unsigned($signed(CORDIC_Yout_s5_a) + $signed(CORDIC_Yout_s5_b));
            end
            else
            begin
                CORDIC_Yout_s5_o <= $unsigned($signed(CORDIC_Yout_s5_a) - $signed(CORDIC_Yout_s5_b));
            end
        end
    end
    assign CORDIC_Yout_s5_q = CORDIC_Yout_s5_o[17:0];

    // CORDIC_ShiftY_s6(BITSELECT,152)@26
    assign CORDIC_ShiftY_s6_b = $unsigned(CORDIC_Yout_s5_q[17:6]);

    // CORDIC_ShiftY_s5(BITSELECT,139)@25
    assign CORDIC_ShiftY_s5_b = $unsigned(CORDIC_Yout_s4_q[17:5]);

    // CORDIC_Xout_s5(ADDSUB,140)@25 + 1
    assign CORDIC_Xout_s5_s = CORDIC_CmpPLtZero_s5_q;
    assign CORDIC_Xout_s5_a = $unsigned({{1{CORDIC_Xout_s4_q[17]}}, CORDIC_Xout_s4_q});
    assign CORDIC_Xout_s5_b = $unsigned({{6{CORDIC_ShiftY_s5_b[12]}}, CORDIC_ShiftY_s5_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s5_s == 1'b1)
            begin
                CORDIC_Xout_s5_o <= $unsigned($signed(CORDIC_Xout_s5_a) + $signed(CORDIC_Xout_s5_b));
            end
            else
            begin
                CORDIC_Xout_s5_o <= $unsigned($signed(CORDIC_Xout_s5_a) - $signed(CORDIC_Xout_s5_b));
            end
        end
    end
    assign CORDIC_Xout_s5_q = CORDIC_Xout_s5_o[17:0];

    // CORDIC_Xout_s6(ADDSUB,153)@26 + 1
    assign CORDIC_Xout_s6_s = CORDIC_CmpPLtZero_s6_q;
    assign CORDIC_Xout_s6_a = $unsigned({{1{CORDIC_Xout_s5_q[17]}}, CORDIC_Xout_s5_q});
    assign CORDIC_Xout_s6_b = $unsigned({{7{CORDIC_ShiftY_s6_b[11]}}, CORDIC_ShiftY_s6_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s6_s == 1'b1)
            begin
                CORDIC_Xout_s6_o <= $unsigned($signed(CORDIC_Xout_s6_a) + $signed(CORDIC_Xout_s6_b));
            end
            else
            begin
                CORDIC_Xout_s6_o <= $unsigned($signed(CORDIC_Xout_s6_a) - $signed(CORDIC_Xout_s6_b));
            end
        end
    end
    assign CORDIC_Xout_s6_q = CORDIC_Xout_s6_o[17:0];

    // CORDIC_ShiftX_s7(BITSELECT,164)@27
    assign CORDIC_ShiftX_s7_b = $unsigned(CORDIC_Xout_s6_q[17:7]);

    // CORDIC_CmpPGeZero_s6(LOGICAL,146)@26
    assign CORDIC_CmpPGeZero_s6_q = $unsigned(~ (CORDIC_Pout_s5_q[17:17]));

    // CORDIC_ShiftX_s6(BITSELECT,151)@26
    assign CORDIC_ShiftX_s6_b = $unsigned(CORDIC_Xout_s5_q[17:6]);

    // CORDIC_Yout_s6(ADDSUB,154)@26 + 1
    assign CORDIC_Yout_s6_s = CORDIC_CmpPGeZero_s6_q;
    assign CORDIC_Yout_s6_a = $unsigned({{1{CORDIC_Yout_s5_q[17]}}, CORDIC_Yout_s5_q});
    assign CORDIC_Yout_s6_b = $unsigned({{7{CORDIC_ShiftX_s6_b[11]}}, CORDIC_ShiftX_s6_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s6_s == 1'b1)
            begin
                CORDIC_Yout_s6_o <= $unsigned($signed(CORDIC_Yout_s6_a) + $signed(CORDIC_Yout_s6_b));
            end
            else
            begin
                CORDIC_Yout_s6_o <= $unsigned($signed(CORDIC_Yout_s6_a) - $signed(CORDIC_Yout_s6_b));
            end
        end
    end
    assign CORDIC_Yout_s6_q = CORDIC_Yout_s6_o[17:0];

    // CORDIC_Yout_s7(ADDSUB,167)@27 + 1
    assign CORDIC_Yout_s7_s = CORDIC_CmpPGeZero_s7_q;
    assign CORDIC_Yout_s7_a = $unsigned({{1{CORDIC_Yout_s6_q[17]}}, CORDIC_Yout_s6_q});
    assign CORDIC_Yout_s7_b = $unsigned({{8{CORDIC_ShiftX_s7_b[10]}}, CORDIC_ShiftX_s7_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s7_s == 1'b1)
            begin
                CORDIC_Yout_s7_o <= $unsigned($signed(CORDIC_Yout_s7_a) + $signed(CORDIC_Yout_s7_b));
            end
            else
            begin
                CORDIC_Yout_s7_o <= $unsigned($signed(CORDIC_Yout_s7_a) - $signed(CORDIC_Yout_s7_b));
            end
        end
    end
    assign CORDIC_Yout_s7_q = CORDIC_Yout_s7_o[17:0];

    // CORDIC_ShiftY_s8(BITSELECT,178)@28
    assign CORDIC_ShiftY_s8_b = $unsigned(CORDIC_Yout_s7_q[17:8]);

    // CORDIC_ShiftY_s7(BITSELECT,165)@27
    assign CORDIC_ShiftY_s7_b = $unsigned(CORDIC_Yout_s6_q[17:7]);

    // CORDIC_Xout_s7(ADDSUB,166)@27 + 1
    assign CORDIC_Xout_s7_s = CORDIC_CmpPLtZero_s7_q;
    assign CORDIC_Xout_s7_a = $unsigned({{1{CORDIC_Xout_s6_q[17]}}, CORDIC_Xout_s6_q});
    assign CORDIC_Xout_s7_b = $unsigned({{8{CORDIC_ShiftY_s7_b[10]}}, CORDIC_ShiftY_s7_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s7_s == 1'b1)
            begin
                CORDIC_Xout_s7_o <= $unsigned($signed(CORDIC_Xout_s7_a) + $signed(CORDIC_Xout_s7_b));
            end
            else
            begin
                CORDIC_Xout_s7_o <= $unsigned($signed(CORDIC_Xout_s7_a) - $signed(CORDIC_Xout_s7_b));
            end
        end
    end
    assign CORDIC_Xout_s7_q = CORDIC_Xout_s7_o[17:0];

    // CORDIC_Xout_s8(ADDSUB,179)@28 + 1
    assign CORDIC_Xout_s8_s = CORDIC_CmpPLtZero_s8_q;
    assign CORDIC_Xout_s8_a = $unsigned({{1{CORDIC_Xout_s7_q[17]}}, CORDIC_Xout_s7_q});
    assign CORDIC_Xout_s8_b = $unsigned({{9{CORDIC_ShiftY_s8_b[9]}}, CORDIC_ShiftY_s8_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s8_s == 1'b1)
            begin
                CORDIC_Xout_s8_o <= $unsigned($signed(CORDIC_Xout_s8_a) + $signed(CORDIC_Xout_s8_b));
            end
            else
            begin
                CORDIC_Xout_s8_o <= $unsigned($signed(CORDIC_Xout_s8_a) - $signed(CORDIC_Xout_s8_b));
            end
        end
    end
    assign CORDIC_Xout_s8_q = CORDIC_Xout_s8_o[17:0];

    // CORDIC_ShiftX_s9(BITSELECT,190)@29
    assign CORDIC_ShiftX_s9_b = $unsigned(CORDIC_Xout_s8_q[17:9]);

    // CORDIC_CmpPGeZero_s8(LOGICAL,172)@28
    assign CORDIC_CmpPGeZero_s8_q = $unsigned(~ (CORDIC_Pout_s7_q[17:17]));

    // CORDIC_ShiftX_s8(BITSELECT,177)@28
    assign CORDIC_ShiftX_s8_b = $unsigned(CORDIC_Xout_s7_q[17:8]);

    // CORDIC_Yout_s8(ADDSUB,180)@28 + 1
    assign CORDIC_Yout_s8_s = CORDIC_CmpPGeZero_s8_q;
    assign CORDIC_Yout_s8_a = $unsigned({{1{CORDIC_Yout_s7_q[17]}}, CORDIC_Yout_s7_q});
    assign CORDIC_Yout_s8_b = $unsigned({{9{CORDIC_ShiftX_s8_b[9]}}, CORDIC_ShiftX_s8_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s8_s == 1'b1)
            begin
                CORDIC_Yout_s8_o <= $unsigned($signed(CORDIC_Yout_s8_a) + $signed(CORDIC_Yout_s8_b));
            end
            else
            begin
                CORDIC_Yout_s8_o <= $unsigned($signed(CORDIC_Yout_s8_a) - $signed(CORDIC_Yout_s8_b));
            end
        end
    end
    assign CORDIC_Yout_s8_q = CORDIC_Yout_s8_o[17:0];

    // CORDIC_Yout_s9(ADDSUB,193)@29 + 1
    assign CORDIC_Yout_s9_s = CORDIC_CmpPGeZero_s9_q;
    assign CORDIC_Yout_s9_a = $unsigned({{1{CORDIC_Yout_s8_q[17]}}, CORDIC_Yout_s8_q});
    assign CORDIC_Yout_s9_b = $unsigned({{10{CORDIC_ShiftX_s9_b[8]}}, CORDIC_ShiftX_s9_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s9_s == 1'b1)
            begin
                CORDIC_Yout_s9_o <= $unsigned($signed(CORDIC_Yout_s9_a) + $signed(CORDIC_Yout_s9_b));
            end
            else
            begin
                CORDIC_Yout_s9_o <= $unsigned($signed(CORDIC_Yout_s9_a) - $signed(CORDIC_Yout_s9_b));
            end
        end
    end
    assign CORDIC_Yout_s9_q = CORDIC_Yout_s9_o[17:0];

    // CORDIC_ShiftY_s10(BITSELECT,204)@30
    assign CORDIC_ShiftY_s10_b = $unsigned(CORDIC_Yout_s9_q[17:10]);

    // CORDIC_ShiftY_s9(BITSELECT,191)@29
    assign CORDIC_ShiftY_s9_b = $unsigned(CORDIC_Yout_s8_q[17:9]);

    // CORDIC_Xout_s9(ADDSUB,192)@29 + 1
    assign CORDIC_Xout_s9_s = CORDIC_CmpPLtZero_s9_q;
    assign CORDIC_Xout_s9_a = $unsigned({{1{CORDIC_Xout_s8_q[17]}}, CORDIC_Xout_s8_q});
    assign CORDIC_Xout_s9_b = $unsigned({{10{CORDIC_ShiftY_s9_b[8]}}, CORDIC_ShiftY_s9_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s9_s == 1'b1)
            begin
                CORDIC_Xout_s9_o <= $unsigned($signed(CORDIC_Xout_s9_a) + $signed(CORDIC_Xout_s9_b));
            end
            else
            begin
                CORDIC_Xout_s9_o <= $unsigned($signed(CORDIC_Xout_s9_a) - $signed(CORDIC_Xout_s9_b));
            end
        end
    end
    assign CORDIC_Xout_s9_q = CORDIC_Xout_s9_o[17:0];

    // CORDIC_Xout_s10(ADDSUB,205)@30 + 1
    assign CORDIC_Xout_s10_s = CORDIC_CmpPLtZero_s10_q;
    assign CORDIC_Xout_s10_a = $unsigned({{1{CORDIC_Xout_s9_q[17]}}, CORDIC_Xout_s9_q});
    assign CORDIC_Xout_s10_b = $unsigned({{11{CORDIC_ShiftY_s10_b[7]}}, CORDIC_ShiftY_s10_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s10_s == 1'b1)
            begin
                CORDIC_Xout_s10_o <= $unsigned($signed(CORDIC_Xout_s10_a) + $signed(CORDIC_Xout_s10_b));
            end
            else
            begin
                CORDIC_Xout_s10_o <= $unsigned($signed(CORDIC_Xout_s10_a) - $signed(CORDIC_Xout_s10_b));
            end
        end
    end
    assign CORDIC_Xout_s10_q = CORDIC_Xout_s10_o[17:0];

    // CORDIC_ShiftX_s11(BITSELECT,216)@31
    assign CORDIC_ShiftX_s11_b = $unsigned(CORDIC_Xout_s10_q[17:11]);

    // CORDIC_CmpPGeZero_s10(LOGICAL,198)@30
    assign CORDIC_CmpPGeZero_s10_q = $unsigned(~ (CORDIC_Pout_s9_q[17:17]));

    // CORDIC_ShiftX_s10(BITSELECT,203)@30
    assign CORDIC_ShiftX_s10_b = $unsigned(CORDIC_Xout_s9_q[17:10]);

    // CORDIC_Yout_s10(ADDSUB,206)@30 + 1
    assign CORDIC_Yout_s10_s = CORDIC_CmpPGeZero_s10_q;
    assign CORDIC_Yout_s10_a = $unsigned({{1{CORDIC_Yout_s9_q[17]}}, CORDIC_Yout_s9_q});
    assign CORDIC_Yout_s10_b = $unsigned({{11{CORDIC_ShiftX_s10_b[7]}}, CORDIC_ShiftX_s10_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s10_s == 1'b1)
            begin
                CORDIC_Yout_s10_o <= $unsigned($signed(CORDIC_Yout_s10_a) + $signed(CORDIC_Yout_s10_b));
            end
            else
            begin
                CORDIC_Yout_s10_o <= $unsigned($signed(CORDIC_Yout_s10_a) - $signed(CORDIC_Yout_s10_b));
            end
        end
    end
    assign CORDIC_Yout_s10_q = CORDIC_Yout_s10_o[17:0];

    // CORDIC_Yout_s11(ADDSUB,219)@31 + 1
    assign CORDIC_Yout_s11_s = CORDIC_CmpPGeZero_s11_q;
    assign CORDIC_Yout_s11_a = $unsigned({{1{CORDIC_Yout_s10_q[17]}}, CORDIC_Yout_s10_q});
    assign CORDIC_Yout_s11_b = $unsigned({{12{CORDIC_ShiftX_s11_b[6]}}, CORDIC_ShiftX_s11_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s11_s == 1'b1)
            begin
                CORDIC_Yout_s11_o <= $unsigned($signed(CORDIC_Yout_s11_a) + $signed(CORDIC_Yout_s11_b));
            end
            else
            begin
                CORDIC_Yout_s11_o <= $unsigned($signed(CORDIC_Yout_s11_a) - $signed(CORDIC_Yout_s11_b));
            end
        end
    end
    assign CORDIC_Yout_s11_q = CORDIC_Yout_s11_o[17:0];

    // CORDIC_ShiftY_s12(BITSELECT,230)@32
    assign CORDIC_ShiftY_s12_b = $unsigned(CORDIC_Yout_s11_q[17:12]);

    // CORDIC_ShiftY_s11(BITSELECT,217)@31
    assign CORDIC_ShiftY_s11_b = $unsigned(CORDIC_Yout_s10_q[17:11]);

    // CORDIC_Xout_s11(ADDSUB,218)@31 + 1
    assign CORDIC_Xout_s11_s = CORDIC_CmpPLtZero_s11_q;
    assign CORDIC_Xout_s11_a = $unsigned({{1{CORDIC_Xout_s10_q[17]}}, CORDIC_Xout_s10_q});
    assign CORDIC_Xout_s11_b = $unsigned({{12{CORDIC_ShiftY_s11_b[6]}}, CORDIC_ShiftY_s11_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s11_s == 1'b1)
            begin
                CORDIC_Xout_s11_o <= $unsigned($signed(CORDIC_Xout_s11_a) + $signed(CORDIC_Xout_s11_b));
            end
            else
            begin
                CORDIC_Xout_s11_o <= $unsigned($signed(CORDIC_Xout_s11_a) - $signed(CORDIC_Xout_s11_b));
            end
        end
    end
    assign CORDIC_Xout_s11_q = CORDIC_Xout_s11_o[17:0];

    // CORDIC_Xout_s12(ADDSUB,231)@32 + 1
    assign CORDIC_Xout_s12_s = CORDIC_CmpPLtZero_s12_q;
    assign CORDIC_Xout_s12_a = $unsigned({{1{CORDIC_Xout_s11_q[17]}}, CORDIC_Xout_s11_q});
    assign CORDIC_Xout_s12_b = $unsigned({{13{CORDIC_ShiftY_s12_b[5]}}, CORDIC_ShiftY_s12_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s12_s == 1'b1)
            begin
                CORDIC_Xout_s12_o <= $unsigned($signed(CORDIC_Xout_s12_a) + $signed(CORDIC_Xout_s12_b));
            end
            else
            begin
                CORDIC_Xout_s12_o <= $unsigned($signed(CORDIC_Xout_s12_a) - $signed(CORDIC_Xout_s12_b));
            end
        end
    end
    assign CORDIC_Xout_s12_q = CORDIC_Xout_s12_o[17:0];

    // CORDIC_ShiftX_s13(BITSELECT,242)@33
    assign CORDIC_ShiftX_s13_b = $unsigned(CORDIC_Xout_s12_q[17:13]);

    // CORDIC_CmpPGeZero_s12(LOGICAL,224)@32
    assign CORDIC_CmpPGeZero_s12_q = $unsigned(~ (CORDIC_Pout_s11_q[17:17]));

    // CORDIC_ShiftX_s12(BITSELECT,229)@32
    assign CORDIC_ShiftX_s12_b = $unsigned(CORDIC_Xout_s11_q[17:12]);

    // CORDIC_Yout_s12(ADDSUB,232)@32 + 1
    assign CORDIC_Yout_s12_s = CORDIC_CmpPGeZero_s12_q;
    assign CORDIC_Yout_s12_a = $unsigned({{1{CORDIC_Yout_s11_q[17]}}, CORDIC_Yout_s11_q});
    assign CORDIC_Yout_s12_b = $unsigned({{13{CORDIC_ShiftX_s12_b[5]}}, CORDIC_ShiftX_s12_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s12_s == 1'b1)
            begin
                CORDIC_Yout_s12_o <= $unsigned($signed(CORDIC_Yout_s12_a) + $signed(CORDIC_Yout_s12_b));
            end
            else
            begin
                CORDIC_Yout_s12_o <= $unsigned($signed(CORDIC_Yout_s12_a) - $signed(CORDIC_Yout_s12_b));
            end
        end
    end
    assign CORDIC_Yout_s12_q = CORDIC_Yout_s12_o[17:0];

    // CORDIC_Yout_s13(ADDSUB,245)@33 + 1
    assign CORDIC_Yout_s13_s = CORDIC_CmpPGeZero_s13_q;
    assign CORDIC_Yout_s13_a = $unsigned({{1{CORDIC_Yout_s12_q[17]}}, CORDIC_Yout_s12_q});
    assign CORDIC_Yout_s13_b = $unsigned({{14{CORDIC_ShiftX_s13_b[4]}}, CORDIC_ShiftX_s13_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s13_s == 1'b1)
            begin
                CORDIC_Yout_s13_o <= $unsigned($signed(CORDIC_Yout_s13_a) + $signed(CORDIC_Yout_s13_b));
            end
            else
            begin
                CORDIC_Yout_s13_o <= $unsigned($signed(CORDIC_Yout_s13_a) - $signed(CORDIC_Yout_s13_b));
            end
        end
    end
    assign CORDIC_Yout_s13_q = CORDIC_Yout_s13_o[17:0];

    // CORDIC_ShiftY_s14(BITSELECT,256)@34
    assign CORDIC_ShiftY_s14_b = $unsigned(CORDIC_Yout_s13_q[17:14]);

    // CORDIC_ShiftY_s13(BITSELECT,243)@33
    assign CORDIC_ShiftY_s13_b = $unsigned(CORDIC_Yout_s12_q[17:13]);

    // CORDIC_Xout_s13(ADDSUB,244)@33 + 1
    assign CORDIC_Xout_s13_s = CORDIC_CmpPLtZero_s13_q;
    assign CORDIC_Xout_s13_a = $unsigned({{1{CORDIC_Xout_s12_q[17]}}, CORDIC_Xout_s12_q});
    assign CORDIC_Xout_s13_b = $unsigned({{14{CORDIC_ShiftY_s13_b[4]}}, CORDIC_ShiftY_s13_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s13_s == 1'b1)
            begin
                CORDIC_Xout_s13_o <= $unsigned($signed(CORDIC_Xout_s13_a) + $signed(CORDIC_Xout_s13_b));
            end
            else
            begin
                CORDIC_Xout_s13_o <= $unsigned($signed(CORDIC_Xout_s13_a) - $signed(CORDIC_Xout_s13_b));
            end
        end
    end
    assign CORDIC_Xout_s13_q = CORDIC_Xout_s13_o[17:0];

    // CORDIC_Xout_s14(ADDSUB,257)@34 + 1
    assign CORDIC_Xout_s14_s = CORDIC_CmpPLtZero_s14_q;
    assign CORDIC_Xout_s14_a = $unsigned({{1{CORDIC_Xout_s13_q[17]}}, CORDIC_Xout_s13_q});
    assign CORDIC_Xout_s14_b = $unsigned({{15{CORDIC_ShiftY_s14_b[3]}}, CORDIC_ShiftY_s14_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s14_s == 1'b1)
            begin
                CORDIC_Xout_s14_o <= $unsigned($signed(CORDIC_Xout_s14_a) + $signed(CORDIC_Xout_s14_b));
            end
            else
            begin
                CORDIC_Xout_s14_o <= $unsigned($signed(CORDIC_Xout_s14_a) - $signed(CORDIC_Xout_s14_b));
            end
        end
    end
    assign CORDIC_Xout_s14_q = CORDIC_Xout_s14_o[17:0];

    // CORDIC_ShiftX_s15(BITSELECT,268)@35
    assign CORDIC_ShiftX_s15_b = $unsigned(CORDIC_Xout_s14_q[17:15]);

    // CORDIC_ShiftX_s14(BITSELECT,255)@34
    assign CORDIC_ShiftX_s14_b = $unsigned(CORDIC_Xout_s13_q[17:14]);

    // CORDIC_Yout_s14(ADDSUB,258)@34 + 1
    assign CORDIC_Yout_s14_s = CORDIC_CmpPGeZero_s14_q;
    assign CORDIC_Yout_s14_a = $unsigned({{1{CORDIC_Yout_s13_q[17]}}, CORDIC_Yout_s13_q});
    assign CORDIC_Yout_s14_b = $unsigned({{15{CORDIC_ShiftX_s14_b[3]}}, CORDIC_ShiftX_s14_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s14_s == 1'b1)
            begin
                CORDIC_Yout_s14_o <= $unsigned($signed(CORDIC_Yout_s14_a) + $signed(CORDIC_Yout_s14_b));
            end
            else
            begin
                CORDIC_Yout_s14_o <= $unsigned($signed(CORDIC_Yout_s14_a) - $signed(CORDIC_Yout_s14_b));
            end
        end
    end
    assign CORDIC_Yout_s14_q = CORDIC_Yout_s14_o[17:0];

    // CORDIC_Yout_s15(ADDSUB,271)@35 + 1
    assign CORDIC_Yout_s15_s = redist17_CORDIC_CmpPGeZero_s14_q_2_q;
    assign CORDIC_Yout_s15_a = $unsigned({{1{CORDIC_Yout_s14_q[17]}}, CORDIC_Yout_s14_q});
    assign CORDIC_Yout_s15_b = $unsigned({{16{CORDIC_ShiftX_s15_b[2]}}, CORDIC_ShiftX_s15_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s15_s == 1'b1)
            begin
                CORDIC_Yout_s15_o <= $unsigned($signed(CORDIC_Yout_s15_a) + $signed(CORDIC_Yout_s15_b));
            end
            else
            begin
                CORDIC_Yout_s15_o <= $unsigned($signed(CORDIC_Yout_s15_a) - $signed(CORDIC_Yout_s15_b));
            end
        end
    end
    assign CORDIC_Yout_s15_q = CORDIC_Yout_s15_o[17:0];

    // CORDIC_ShiftY_s16(BITSELECT,282)@36
    assign CORDIC_ShiftY_s16_b = $unsigned(CORDIC_Yout_s15_q[17:16]);

    // CORDIC_ShiftY_s15(BITSELECT,269)@35
    assign CORDIC_ShiftY_s15_b = $unsigned(CORDIC_Yout_s14_q[17:15]);

    // CORDIC_Xout_s15(ADDSUB,270)@35 + 1
    assign CORDIC_Xout_s15_s = redist15_CORDIC_CmpPLtZero_s14_q_2_q;
    assign CORDIC_Xout_s15_a = $unsigned({{1{CORDIC_Xout_s14_q[17]}}, CORDIC_Xout_s14_q});
    assign CORDIC_Xout_s15_b = $unsigned({{16{CORDIC_ShiftY_s15_b[2]}}, CORDIC_ShiftY_s15_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s15_s == 1'b1)
            begin
                CORDIC_Xout_s15_o <= $unsigned($signed(CORDIC_Xout_s15_a) + $signed(CORDIC_Xout_s15_b));
            end
            else
            begin
                CORDIC_Xout_s15_o <= $unsigned($signed(CORDIC_Xout_s15_a) - $signed(CORDIC_Xout_s15_b));
            end
        end
    end
    assign CORDIC_Xout_s15_q = CORDIC_Xout_s15_o[17:0];

    // CORDIC_Xout_s16(ADDSUB,283)@36 + 1
    assign CORDIC_Xout_s16_s = redist16_CORDIC_CmpPLtZero_s14_q_3_q;
    assign CORDIC_Xout_s16_a = $unsigned({{1{CORDIC_Xout_s15_q[17]}}, CORDIC_Xout_s15_q});
    assign CORDIC_Xout_s16_b = $unsigned({{17{CORDIC_ShiftY_s16_b[1]}}, CORDIC_ShiftY_s16_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Xout_s16_s == 1'b1)
            begin
                CORDIC_Xout_s16_o <= $unsigned($signed(CORDIC_Xout_s16_a) + $signed(CORDIC_Xout_s16_b));
            end
            else
            begin
                CORDIC_Xout_s16_o <= $unsigned($signed(CORDIC_Xout_s16_a) - $signed(CORDIC_Xout_s16_b));
            end
        end
    end
    assign CORDIC_Xout_s16_q = CORDIC_Xout_s16_o[17:0];

    // CORDIC_ConstZero_Last(CONSTANT,286)
    assign CORDIC_ConstZero_Last_q = $unsigned(18'b000000000000000000);

    // CORDIC_ZeroAddSubX_Last(ADDSUB,289)@37 + 1
    assign CORDIC_ZeroAddSubX_Last_s = redist19_CORDIC_AorB_00_q_19_q;
    assign CORDIC_ZeroAddSubX_Last_a = $unsigned({{1{CORDIC_ConstZero_Last_q[17]}}, CORDIC_ConstZero_Last_q});
    assign CORDIC_ZeroAddSubX_Last_b = $unsigned({{1{CORDIC_Xout_s16_q[17]}}, CORDIC_Xout_s16_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_ZeroAddSubX_Last_s == 1'b1)
            begin
                CORDIC_ZeroAddSubX_Last_o <= $unsigned($signed(CORDIC_ZeroAddSubX_Last_a) + $signed(CORDIC_ZeroAddSubX_Last_b));
            end
            else
            begin
                CORDIC_ZeroAddSubX_Last_o <= $unsigned($signed(CORDIC_ZeroAddSubX_Last_a) - $signed(CORDIC_ZeroAddSubX_Last_b));
            end
        end
    end
    assign CORDIC_ZeroAddSubX_Last_q = CORDIC_ZeroAddSubX_Last_o[17:0];

    // redist18_CORDIC_CmpPGeZero_s14_q_3(DELAY,516)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist18_CORDIC_CmpPGeZero_s14_q_3_q <= $unsigned(redist17_CORDIC_CmpPGeZero_s14_q_2_q);
        end
    end

    // CORDIC_ShiftX_s16(BITSELECT,281)@36
    assign CORDIC_ShiftX_s16_b = $unsigned(CORDIC_Xout_s15_q[17:16]);

    // CORDIC_Yout_s16(ADDSUB,284)@36 + 1
    assign CORDIC_Yout_s16_s = redist18_CORDIC_CmpPGeZero_s14_q_3_q;
    assign CORDIC_Yout_s16_a = $unsigned({{1{CORDIC_Yout_s15_q[17]}}, CORDIC_Yout_s15_q});
    assign CORDIC_Yout_s16_b = $unsigned({{17{CORDIC_ShiftX_s16_b[1]}}, CORDIC_ShiftX_s16_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_Yout_s16_s == 1'b1)
            begin
                CORDIC_Yout_s16_o <= $unsigned($signed(CORDIC_Yout_s16_a) + $signed(CORDIC_Yout_s16_b));
            end
            else
            begin
                CORDIC_Yout_s16_o <= $unsigned($signed(CORDIC_Yout_s16_a) - $signed(CORDIC_Yout_s16_b));
            end
        end
    end
    assign CORDIC_Yout_s16_q = CORDIC_Yout_s16_o[17:0];

    // CORDIC_ZeroAddSubY_Last(ADDSUB,290)@37 + 1
    assign CORDIC_ZeroAddSubY_Last_s = redist19_CORDIC_AorB_00_q_19_q;
    assign CORDIC_ZeroAddSubY_Last_a = $unsigned({{1{CORDIC_ConstZero_Last_q[17]}}, CORDIC_ConstZero_Last_q});
    assign CORDIC_ZeroAddSubY_Last_b = $unsigned({{1{CORDIC_Yout_s16_q[17]}}, CORDIC_Yout_s16_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            if (CORDIC_ZeroAddSubY_Last_s == 1'b1)
            begin
                CORDIC_ZeroAddSubY_Last_o <= $unsigned($signed(CORDIC_ZeroAddSubY_Last_a) + $signed(CORDIC_ZeroAddSubY_Last_b));
            end
            else
            begin
                CORDIC_ZeroAddSubY_Last_o <= $unsigned($signed(CORDIC_ZeroAddSubY_Last_a) - $signed(CORDIC_ZeroAddSubY_Last_b));
            end
        end
    end
    assign CORDIC_ZeroAddSubY_Last_q = CORDIC_ZeroAddSubY_Last_o[17:0];

    // Negate_Mux2_merged(SUB,414)@38
    assign Negate_Mux2_merged_a = $unsigned({{18{GND_q[0]}}, GND_q});
    assign Negate_Mux2_merged_b = $unsigned({{1{CORDIC_ZeroAddSubY_Last_q[17]}}, CORDIC_ZeroAddSubY_Last_q});
    assign Negate_Mux2_merged_i = Negate_Mux2_merged_b;
    assign Negate_Mux2_merged_a1 = in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl == 1'b0 ? Negate_Mux2_merged_i : Negate_Mux2_merged_a;
    assign Negate_Mux2_merged_b1 = in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl == 1'b0 ? 19'b0 : Negate_Mux2_merged_b;
    assign Negate_Mux2_merged_o = $unsigned($signed(Negate_Mux2_merged_a1) - $signed(Negate_Mux2_merged_b1));
    assign Negate_Mux2_merged_q = Negate_Mux2_merged_o[17:0];

    // redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_rdcnt(ADD,549)
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_rdcnt_a = {1'b0, redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_wraddr_q};
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_rdcnt_b = {1'b0, redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_rdcnt_o <= $unsigned(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_rdcnt_a) + $unsigned(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_rdcnt_b);
        end
    end
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_rdcnt_q = redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_rdcnt_o[2:0];

    // redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_rdcnt(ADD,581)
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_rdcnt_a = {1'b0, redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_wraddr_q};
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_rdcnt_b = {1'b0, redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_rdcnt_o <= $unsigned(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_rdcnt_a) + $unsigned(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_rdcnt_b);
        end
    end
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_rdcnt_q = redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_rdcnt_o[5:0];

    // redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_wraddr(COUNTER,579)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_wraddr_i <= $unsigned(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_wraddr_q = redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_wraddr_i[4:0];

    // redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem(DUALMEM,578)
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_ia = $unsigned(in_3_imag_d1_tpl);
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_aa = redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_wraddr_q;
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_ab = redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_rdcnt_q[4:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(16),
        .widthad_b(5),
        .numwords_b(32),
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
    ) redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_aa),
        .data_a(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_ab),
        .q_b(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_iq),
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
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_q = redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_iq[15:0];

    // redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_wraddr(COUNTER,547)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_wraddr_i <= $unsigned(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_wraddr_q = redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_wraddr_i[1:0];

    // redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem(DUALMEM,546)
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_ia = $unsigned(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_split_0_mem_q);
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_aa = redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_wraddr_q;
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_ab = redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_rdcnt_q[1:0];
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
    ) redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_aa),
        .data_a(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_ab),
        .q_b(redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_iq),
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
    assign redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_q = redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_iq[15:0];

    // redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_rdcnt(ADD,545)
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_rdcnt_a = {1'b0, redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_wraddr_q};
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_rdcnt_b = {1'b0, redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_rdcnt_o <= $unsigned(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_rdcnt_a) + $unsigned(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_rdcnt_b);
        end
    end
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_rdcnt_q = redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_rdcnt_o[2:0];

    // redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_rdcnt(ADD,577)
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_rdcnt_a = {1'b0, redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_wraddr_q};
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_rdcnt_b = {1'b0, redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_rdcnt_o <= $unsigned(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_rdcnt_a) + $unsigned(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_rdcnt_b);
        end
    end
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_rdcnt_q = redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_rdcnt_o[5:0];

    // redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_wraddr(COUNTER,575)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_wraddr_i <= $unsigned(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_wraddr_q = redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_wraddr_i[4:0];

    // redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem(DUALMEM,574)
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_ia = $unsigned(in_3_real_d1_tpl);
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_aa = redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_wraddr_q;
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_ab = redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_rdcnt_q[4:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(16),
        .widthad_b(5),
        .numwords_b(32),
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
    ) redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_aa),
        .data_a(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_ab),
        .q_b(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_iq),
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
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_q = redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_iq[15:0];

    // redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_wraddr(COUNTER,543)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_wraddr_i <= $unsigned(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_wraddr_q = redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_wraddr_i[1:0];

    // redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem(DUALMEM,542)
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_ia = $unsigned(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_split_0_mem_q);
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_aa = redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_wraddr_q;
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_ab = redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_rdcnt_q[1:0];
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
    ) redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_aa),
        .data_a(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_ab),
        .q_b(redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_iq),
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
    assign redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_q = redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_iq[15:0];

    // redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_rdcnt(ADD,573)
    assign redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_rdcnt_a = {1'b0, redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_wraddr_q};
    assign redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_rdcnt_b = {1'b0, redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_rdcnt_o <= $unsigned(redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_rdcnt_a) + $unsigned(redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_rdcnt_b);
        end
    end
    assign redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_rdcnt_q = redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_rdcnt_o[5:0];

    // redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_wraddr(COUNTER,571)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_wraddr_i <= $unsigned(redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_wraddr_q = redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_wraddr_i[4:0];

    // redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem(DUALMEM,570)
    assign redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_ia = $unsigned(in_2_c_tpl);
    assign redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_aa = redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_wraddr_q;
    assign redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_ab = redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_rdcnt_q[4:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(8),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(8),
        .widthad_b(5),
        .numwords_b(32),
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
    ) redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_aa),
        .data_a(redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_ab),
        .q_b(redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_iq),
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
    assign redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_q = redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_iq[7:0];

    // redist26_ChannelIn_cunroll_x_in_2_c_tpl_38(DELAY,524)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_delay_0 <= $unsigned(redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_split_0_mem_q);
            redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_delay_1 <= redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_delay_0;
            redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_delay_2 <= redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_delay_1;
            redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_delay_3 <= redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_delay_2;
            redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_q <= redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_delay_3;
        end
    end

    // redist25_ChannelIn_cunroll_x_in_1_v_tpl_38(DELAY,523)
    dspba_delay_ver #( .width(1), .depth(38), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist25_ChannelIn_cunroll_x_in_1_v_tpl_38 ( .xin(in_1_v_tpl), .xout(redist25_ChannelIn_cunroll_x_in_1_v_tpl_38_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ChannelOut_cunroll_x(PORTOUT,31)@38 + 1
    assign out_2_vout_tpl = redist25_ChannelIn_cunroll_x_in_1_v_tpl_38_q;
    assign out_3_cout_tpl = redist26_ChannelIn_cunroll_x_in_2_c_tpl_38_q;
    assign out_1_real_dout1_tpl = redist27_ChannelIn_cunroll_x_in_3_real_d1_tpl_38_mem_q;
    assign out_1_imag_dout1_tpl = redist28_ChannelIn_cunroll_x_in_3_imag_d1_tpl_38_mem_q;
    assign out_4_sin_tpl = Negate_Mux2_merged_q;
    assign out_5_cos_tpl = CORDIC_ZeroAddSubX_Last_q;
    assign out_6_fft_size_out_tpl = redist30_ChannelIn_cunroll_x_in_7_fft_size_tpl_38_mem_q;
    assign out_7_CPLenout_tpl = redist31_ChannelIn_cunroll_x_in_8_CPLen_tpl_38_mem_q;
    assign out_8_nsc_out_tpl = redist32_ChannelIn_cunroll_x_in_9_nsc_tpl_38_mem_q;
    assign out_9_eAxC_out_tpl = redist33_ChannelIn_cunroll_x_in_10_eAxC_tpl_38_q;
    assign out_10_sym_metadata_out_tpl = redist34_ChannelIn_cunroll_x_in_11_sym_metadata_tpl_38_mem_q;
    assign out_11_ul_timeref_out_tpl = redist35_ChannelIn_cunroll_x_in_12_ul_timerefin_tpl_38_mem_q;

endmodule
