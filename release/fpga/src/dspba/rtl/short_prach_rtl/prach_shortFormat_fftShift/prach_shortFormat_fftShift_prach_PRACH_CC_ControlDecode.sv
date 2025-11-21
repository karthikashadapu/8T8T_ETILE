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

// SystemVerilog created from prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode
// SystemVerilog created on Wed Nov  6 19:28:32 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode (
    input wire [0:0] in_2_vin_tpl,
    input wire [7:0] in_3_chin_tpl,
    input wire [15:0] in_1_real_din_tpl,
    input wire [15:0] in_1_imag_din_tpl,
    input wire [7:0] in_5_SubFN_tpl,
    input wire [11:0] in_4_SFN_tpl,
    input wire [1:0] in_6_SCSby15_tpl,
    input wire [7:0] in_7_BWby10_tpl,
    output wire [0:0] out_2_vout_tpl,
    output wire [7:0] out_3_cout_tpl,
    output wire [15:0] out_1_real_dout_tpl,
    output wire [15:0] out_1_imag_dout_tpl,
    output wire [22:0] out_4_CPLen_tpl,
    output wire [3:0] out_5_FFTSize_tpl,
    output wire [3:0] out_6_NFFTs_tpl,
    output wire [0:0] out_7_SOP_tpl,
    output wire [7:0] out_8_qBWby10_tpl,
    output wire [28:0] out_9_TimeReference_tpl,
    input wire [7:0] in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl,
    input wire [2:0] in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl,
    input wire [0:0] in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl,
    input wire [0:0] in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [7:0] Add_a;
    wire [7:0] Add_b;
    logic [7:0] Add_o;
    wire [7:0] Add_q;
    wire [21:0] Add1_a;
    wire [21:0] Add1_b;
    logic [21:0] Add1_o;
    wire [21:0] Add1_q;
    wire [22:0] Add2_a;
    wire [22:0] Add2_b;
    logic [22:0] Add2_o;
    wire [22:0] Add2_q;
    wire [0:0] And1_qi;
    reg [0:0] And1_q;
    wire [0:0] And2_q;
    wire [28:0] BitCombine_q;
    wire [0:0] CmpEQ_qi;
    reg [0:0] CmpEQ_q;
    wire [3:0] CmpEQ12_b;
    wire [0:0] CmpEQ12_qi;
    reg [0:0] CmpEQ12_q;
    wire [6:0] Const3_q;
    wire [0:0] Or1_q;
    reg [16:0] Select_rsrvd_fix_q;
    wire [8:0] Sub_a;
    wire [8:0] Sub_b;
    logic [8:0] Sub_o;
    wire [8:0] Sub_q;
    wire [0:0] Xor_rsrvd_fix_qi;
    reg [0:0] Xor_rsrvd_fix_q;
    wire [7:0] CmpEQ11_0_x_b;
    wire [0:0] CmpEQ11_0_x_qi;
    reg [0:0] CmpEQ11_0_x_q;
    wire [7:0] CmpEQ11_1_x_b;
    wire [0:0] CmpEQ11_1_x_qi;
    reg [0:0] CmpEQ11_1_x_q;
    wire [7:0] CmpEQ11_2_x_b;
    wire [0:0] CmpEQ11_2_x_qi;
    reg [0:0] CmpEQ11_2_x_q;
    wire [7:0] CmpEQ11_3_x_b;
    wire [0:0] CmpEQ11_3_x_qi;
    reg [0:0] CmpEQ11_3_x_q;
    wire [7:0] CmpEQ11_4_x_b;
    wire [0:0] CmpEQ11_4_x_qi;
    reg [0:0] CmpEQ11_4_x_q;
    wire [7:0] CmpEQ11_5_x_b;
    wire [0:0] CmpEQ11_5_x_qi;
    reg [0:0] CmpEQ11_5_x_q;
    wire [7:0] CmpEQ11_6_x_b;
    wire [0:0] CmpEQ11_6_x_qi;
    reg [0:0] CmpEQ11_6_x_q;
    wire [7:0] CmpEQ11_7_x_b;
    wire [0:0] CmpEQ11_7_x_qi;
    reg [0:0] CmpEQ11_7_x_q;
    wire [7:0] CmpEQ11_8_x_b;
    wire [0:0] CmpEQ11_8_x_qi;
    reg [0:0] CmpEQ11_8_x_q;
    wire [7:0] CmpEQ11_9_x_b;
    wire [0:0] CmpEQ11_9_x_qi;
    reg [0:0] CmpEQ11_9_x_q;
    wire [7:0] Sub_PostCast_primWireOut_sel_x_b;
    wire [2:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add_x_a;
    wire [2:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add_x_b;
    logic [2:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add_x_o;
    wire [2:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add_x_q;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add1_x_a;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add1_x_b;
    logic [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add1_x_o;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add1_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const1_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const11_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const12_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const13_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const14_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const7_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const8_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const9_x_q;
    reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select1_x_q;
    reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select2_x_q;
    reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select3_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And10_x_qi;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And10_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And11_x_qi;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And11_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And12_x_qi;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And12_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And13_x_qi;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And13_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And14_x_qi;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And14_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And6_x_qi;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And6_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And7_x_qi;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And7_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And8_x_qi;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And8_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And9_x_qi;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And9_x_q;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE10_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE10_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE10_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE10_x_n;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE11_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE11_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE11_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE11_x_n;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE12_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE12_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE12_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE12_x_n;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x_n;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE4_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE4_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE4_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE4_x_n;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE5_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE5_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE5_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE5_x_n;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE6_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE6_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE6_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE6_x_n;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE7_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE7_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE7_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE7_x_n;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE8_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE8_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE8_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE8_x_n;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE9_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE9_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE9_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE9_x_n;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT10_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT10_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT10_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT10_x_c;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT11_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT11_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT11_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT11_x_c;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT12_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT12_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT12_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT12_x_c;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT4_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT4_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT4_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT4_x_c;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT5_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT5_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT5_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT5_x_c;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT6_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT6_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT6_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT6_x_c;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT7_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT7_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT7_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT7_x_c;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT8_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT8_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT8_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT8_x_c;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT9_x_a;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT9_x_b;
    logic [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT9_x_o;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT9_x_c;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const10_x_q;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const11_x_q;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const12_x_q;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const13_x_q;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const14_x_q;
    wire [6:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const6_x_q;
    wire [6:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const7_x_q;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const8_x_q;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const9_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ1_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ2_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const1_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const10_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const11_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const12_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const13_x_q;
    wire [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const15_x_q;
    wire [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const16_x_q;
    wire [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const17_x_q;
    wire [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const18_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const2_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const21_x_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const3_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const7_x_q;
    wire [2:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_x_a;
    wire [2:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_x_b;
    logic [2:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_x_o;
    wire [2:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_x_q;
    wire [4:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_x_a;
    wire [4:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_x_b;
    logic [4:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_x_o;
    wire [4:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const4_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or1_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or2_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RisingEdgeDetect_And3_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RisingEdgeDetect_Not_x_qi;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RisingEdgeDetect_Not_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_And_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_Not_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_Or_x_qi;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_Or_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SubFNChangeDetect_CmpNE_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SubFNChangeDetect_Not_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine1_x_q;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine2_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits_x_a;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits1_x_a;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits1_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits2_x_a;
    wire [2:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits2_x_q;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits3_x_a;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits3_x_q;
    wire [2:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Const2_x_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Const3_x_q;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_x16_PostCast_primWireOut_sel_x_b;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_PostCast_primWireOut_sel_x_b;
    reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0_q;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0_v;
    reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1_q;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1_v;
    reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2_q;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2_v;
    reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id3_q;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id3_v;
    reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0_q;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0_v;
    reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev2_id0_q;
    wire [6:0] sR_mergedSignalTM_uid305_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_x16_x_q;
    wire [13:0] xIfSign_mergedSignalTM_uid345_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_q;
    wire [17:0] aPostPad_uid350_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_q;
    wire [18:0] sub_uid351_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_a;
    wire [18:0] sub_uid351_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_b;
    logic [18:0] sub_uid351_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_o;
    wire [18:0] sub_uid351_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_q;
    wire [16:0] sR_uid354_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_in;
    wire [16:0] sR_uid354_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_b;
    reg [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select_x_opt_q;
    reg [8:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select1_x_opt_q;
    reg [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0_q;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0_v;
    reg [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1_q;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1_v;
    reg [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev1_id0_q;
    reg [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0_q;
    reg [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0_v;
    reg [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev1_id0_q;
    wire LutX_lutmem_reset0;
    wire LutX_lutmem_ena_NotRstA;
    wire [4:0] LutX_lutmem_ia;
    wire [7:0] LutX_lutmem_aa;
    wire [7:0] LutX_lutmem_ab;
    wire [4:0] LutX_lutmem_ir;
    wire [4:0] LutX_lutmem_r;
    wire LutY_lutmem_reset0;
    wire LutY_lutmem_ena_NotRstA;
    wire [0:0] LutY_lutmem_ia;
    wire [7:0] LutY_lutmem_aa;
    wire [7:0] LutY_lutmem_ab;
    wire [0:0] LutY_lutmem_ir;
    wire [0:0] LutY_lutmem_r;
    wire PRACHSymDuration_LUT_lutmem_reset0;
    wire [2:0] PRACHSymDuration_LUT_lutmem_ia;
    wire [7:0] PRACHSymDuration_LUT_lutmem_aa;
    wire [7:0] PRACHSymDuration_LUT_lutmem_ab;
    wire [2:0] PRACHSymDuration_LUT_lutmem_ir;
    wire [2:0] PRACHSymDuration_LUT_lutmem_r;
    wire PrachOccPerSlotMinus1_lutmem_reset0;
    wire [2:0] PrachOccPerSlotMinus1_lutmem_ia;
    wire [7:0] PrachOccPerSlotMinus1_lutmem_aa;
    wire [7:0] PrachOccPerSlotMinus1_lutmem_ab;
    wire [2:0] PrachOccPerSlotMinus1_lutmem_ir;
    wire [2:0] PrachOccPerSlotMinus1_lutmem_r;
    wire StartOfSymbol_LUT_lutmem_reset0;
    wire [3:0] StartOfSymbol_LUT_lutmem_ia;
    wire [7:0] StartOfSymbol_LUT_lutmem_aa;
    wire [7:0] StartOfSymbol_LUT_lutmem_ab;
    wire [3:0] StartOfSymbol_LUT_lutmem_ir;
    wire [3:0] StartOfSymbol_LUT_lutmem_r;
    wire ActiveSubF_LUT_0_x_lutmem_reset0;
    wire ActiveSubF_LUT_0_x_lutmem_ena_NotRstA;
    wire [4:0] ActiveSubF_LUT_0_x_lutmem_ia;
    wire [7:0] ActiveSubF_LUT_0_x_lutmem_aa;
    wire [7:0] ActiveSubF_LUT_0_x_lutmem_ab;
    wire [4:0] ActiveSubF_LUT_0_x_lutmem_ir;
    wire [4:0] ActiveSubF_LUT_0_x_lutmem_r;
    wire ActiveSubF_LUT_1_x_lutmem_reset0;
    wire ActiveSubF_LUT_1_x_lutmem_ena_NotRstA;
    wire [4:0] ActiveSubF_LUT_1_x_lutmem_ia;
    wire [7:0] ActiveSubF_LUT_1_x_lutmem_aa;
    wire [7:0] ActiveSubF_LUT_1_x_lutmem_ab;
    wire [4:0] ActiveSubF_LUT_1_x_lutmem_ir;
    wire [4:0] ActiveSubF_LUT_1_x_lutmem_r;
    wire ActiveSubF_LUT_2_x_lutmem_reset0;
    wire ActiveSubF_LUT_2_x_lutmem_ena_NotRstA;
    wire [4:0] ActiveSubF_LUT_2_x_lutmem_ia;
    wire [7:0] ActiveSubF_LUT_2_x_lutmem_aa;
    wire [7:0] ActiveSubF_LUT_2_x_lutmem_ab;
    wire [4:0] ActiveSubF_LUT_2_x_lutmem_ir;
    wire [4:0] ActiveSubF_LUT_2_x_lutmem_r;
    wire ActiveSubF_LUT_3_x_lutmem_reset0;
    wire ActiveSubF_LUT_3_x_lutmem_ena_NotRstA;
    wire [4:0] ActiveSubF_LUT_3_x_lutmem_ia;
    wire [7:0] ActiveSubF_LUT_3_x_lutmem_aa;
    wire [7:0] ActiveSubF_LUT_3_x_lutmem_ab;
    wire [4:0] ActiveSubF_LUT_3_x_lutmem_ir;
    wire [4:0] ActiveSubF_LUT_3_x_lutmem_r;
    wire ActiveSubF_LUT_4_x_lutmem_reset0;
    wire ActiveSubF_LUT_4_x_lutmem_ena_NotRstA;
    wire [4:0] ActiveSubF_LUT_4_x_lutmem_ia;
    wire [7:0] ActiveSubF_LUT_4_x_lutmem_aa;
    wire [7:0] ActiveSubF_LUT_4_x_lutmem_ab;
    wire [4:0] ActiveSubF_LUT_4_x_lutmem_ir;
    wire [4:0] ActiveSubF_LUT_4_x_lutmem_r;
    wire ActiveSubF_LUT_5_x_lutmem_reset0;
    wire ActiveSubF_LUT_5_x_lutmem_ena_NotRstA;
    wire [4:0] ActiveSubF_LUT_5_x_lutmem_ia;
    wire [7:0] ActiveSubF_LUT_5_x_lutmem_aa;
    wire [7:0] ActiveSubF_LUT_5_x_lutmem_ab;
    wire [4:0] ActiveSubF_LUT_5_x_lutmem_ir;
    wire [4:0] ActiveSubF_LUT_5_x_lutmem_r;
    wire ActiveSubF_LUT_6_x_lutmem_reset0;
    wire ActiveSubF_LUT_6_x_lutmem_ena_NotRstA;
    wire [4:0] ActiveSubF_LUT_6_x_lutmem_ia;
    wire [7:0] ActiveSubF_LUT_6_x_lutmem_aa;
    wire [7:0] ActiveSubF_LUT_6_x_lutmem_ab;
    wire [4:0] ActiveSubF_LUT_6_x_lutmem_ir;
    wire [4:0] ActiveSubF_LUT_6_x_lutmem_r;
    wire ActiveSubF_LUT_7_x_lutmem_reset0;
    wire ActiveSubF_LUT_7_x_lutmem_ena_NotRstA;
    wire [4:0] ActiveSubF_LUT_7_x_lutmem_ia;
    wire [7:0] ActiveSubF_LUT_7_x_lutmem_aa;
    wire [7:0] ActiveSubF_LUT_7_x_lutmem_ab;
    wire [4:0] ActiveSubF_LUT_7_x_lutmem_ir;
    wire [4:0] ActiveSubF_LUT_7_x_lutmem_r;
    wire ActiveSubF_LUT_8_x_lutmem_reset0;
    wire ActiveSubF_LUT_8_x_lutmem_ena_NotRstA;
    wire [4:0] ActiveSubF_LUT_8_x_lutmem_ia;
    wire [7:0] ActiveSubF_LUT_8_x_lutmem_aa;
    wire [7:0] ActiveSubF_LUT_8_x_lutmem_ab;
    wire [4:0] ActiveSubF_LUT_8_x_lutmem_ir;
    wire [4:0] ActiveSubF_LUT_8_x_lutmem_r;
    wire ActiveSubF_LUT_9_x_lutmem_reset0;
    wire ActiveSubF_LUT_9_x_lutmem_ena_NotRstA;
    wire [4:0] ActiveSubF_LUT_9_x_lutmem_ia;
    wire [7:0] ActiveSubF_LUT_9_x_lutmem_aa;
    wire [7:0] ActiveSubF_LUT_9_x_lutmem_ab;
    wire [4:0] ActiveSubF_LUT_9_x_lutmem_ir;
    wire [4:0] ActiveSubF_LUT_9_x_lutmem_r;
    wire [14:0] rightShiftStage0Idx1Rng1_uid436_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_b;
    wire [15:0] rightShiftStage0Idx1_uid438_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q;
    wire [13:0] rightShiftStage0Idx2Rng2_uid439_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_b;
    wire [15:0] rightShiftStage0Idx2_uid441_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q;
    wire [12:0] rightShiftStage0Idx3Rng3_uid442_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_b;
    wire [15:0] rightShiftStage0Idx3_uid444_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q;
    wire [1:0] rightShiftStage0_uid446_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_s;
    reg [15:0] rightShiftStage0_uid446_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q;
    wire [11:0] rightShiftStage1Idx1Rng4_uid447_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_b;
    wire [15:0] rightShiftStage1Idx1_uid449_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q;
    wire [0:0] rightShiftStage1_uid451_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_s;
    reg [15:0] rightShiftStage1_uid451_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q;
    wire [11:0] cz_uid455_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q;
    wire [1:0] leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_s;
    reg [12:0] leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q;
    wire [8:0] leftShiftStage1Idx1Rng4_uid469_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_in;
    wire [8:0] leftShiftStage1Idx1Rng4_uid469_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_b;
    wire [12:0] leftShiftStage1Idx1_uid470_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q;
    wire [7:0] leftShiftStage1Idx2Pad8_uid471_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q;
    wire [4:0] leftShiftStage1Idx2Rng8_uid472_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_in;
    wire [4:0] leftShiftStage1Idx2Rng8_uid472_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_b;
    wire [12:0] leftShiftStage1Idx2_uid473_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q;
    wire [0:0] leftShiftStage1Idx3Rng12_uid475_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_in;
    wire [0:0] leftShiftStage1Idx3Rng12_uid475_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_b;
    wire [12:0] leftShiftStage1Idx3_uid476_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q;
    wire [1:0] leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_s;
    reg [12:0] leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_0_s;
    reg [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_0_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_1_s;
    reg [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_1_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_2_s;
    reg [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_2_q;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_mfinal_s;
    reg [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_mfinal_q;
    wire Mult_cma_reset;
    (* preserve_syn_only *) reg [3:0] Mult_cma_ah [0:0];
    (* preserve_syn_only *) reg [9:0] Mult_cma_ch [0:0];
    wire [3:0] Mult_cma_a0;
    wire [9:0] Mult_cma_c0;
    wire [13:0] Mult_cma_s0;
    wire [13:0] Mult_cma_qq0;
    reg [6:0] Mult_cma_q;
    wire Mult_cma_ena0;
    wire Mult_cma_ena1;
    wire Mult_cma_ena2;
    wire Mult1_cma_reset;
    (* preserve_syn_only *) reg [12:0] Mult1_cma_ah [0:0];
    (* preserve_syn_only *) reg [12:0] Mult1_cma_bh [0:0];
    (* preserve_syn_only *) reg [9:0] Mult1_cma_ch [0:0];
    wire [12:0] Mult1_cma_a0;
    wire [12:0] Mult1_cma_b0;
    wire [9:0] Mult1_cma_c0;
    wire [22:0] Mult1_cma_s0;
    wire [22:0] Mult1_cma_qq0;
    reg [22:0] Mult1_cma_q;
    wire Mult1_cma_ena0;
    wire Mult1_cma_ena1;
    wire Mult1_cma_ena2;
    wire prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_reset;
    (* preserve_syn_only *) reg [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ah [0:0];
    (* preserve_syn_only *) reg [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ch [0:0];
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_a0;
    wire [9:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_c0;
    wire [21:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_s0;
    wire [21:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_qq0;
    reg [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_q;
    wire prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ena0;
    wire prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ena1;
    wire prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ena2;
    wire [3:0] PRACHSymDuration_LUT_PostCast_primWireOut_rnd_shift_q;
    wire [3:0] PRACHSymDuration_LUT_PostCast_primWireOut_rnd_shift_qint;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_selLSBs_bit_select_merged_in;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_selLSBs_bit_select_merged_b;
    wire [1:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_selLSBs_bit_select_merged_c;
    wire [1:0] rightShiftStageSel0Dto0_uid445_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_bit_select_merged_b;
    wire [0:0] rightShiftStageSel0Dto0_uid445_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_bit_select_merged_c;
    wire [1:0] leftShiftStageSel0Dto0_uid466_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_bit_select_merged_b;
    wire [1:0] leftShiftStageSel0Dto0_uid466_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_bit_select_merged_c;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_b;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_c;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_d;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_e;
    wire [12:0] xPadded_uid456_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q;
    wire [12:0] leftShiftStage0Idx1_uid459_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q;
    wire [12:0] leftShiftStage0Idx2_uid462_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q;
    wire [12:0] leftShiftStage0Idx3_uid465_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q;
    reg [0:0] redist0_rightShiftStageSel0Dto0_uid445_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_bit_select_merged_c_1_q;
    reg [12:0] redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_q;
    reg [12:0] redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_delay_0;
    reg [12:0] redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_delay_1;
    reg [12:0] redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_delay_2;
    reg [3:0] redist2_StartOfSymbol_LUT_lutmem_r_6_q;
    reg [3:0] redist3_StartOfSymbol_LUT_lutmem_r_15_q;
    reg [3:0] redist4_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev1_id0_q_10_q;
    reg [3:0] redist5_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select_x_opt_q_7_q;
    reg [16:0] redist6_sR_uid354_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_b_1_q;
    reg [11:0] redist7_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev2_id0_q_1_q;
    reg [1:0] redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_PostCast_primWireOut_sel_x_b_1_q;
    reg [1:0] redist10_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_PostCast_primWireOut_sel_x_b_8_q;
    reg [3:0] redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_1_q;
    reg [3:0] redist12_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_2_q;
    reg [3:0] redist13_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_10_q;
    reg [0:0] redist14_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ2_x_q_1_q;
    reg [0:0] redist15_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ1_x_q_1_q;
    reg [0:0] redist16_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ_x_q_1_q;
    reg [0:0] redist17_ChannelI3n_cunroll_x_in_2_vin_tpl_17_q;
    reg [7:0] redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_q;
    reg [7:0] redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_delay_0;
    reg [7:0] redist22_ChannelI3n_cunroll_x_in_5_SubFN_tpl_3_q;
    reg [7:0] redist23_ChannelI3n_cunroll_x_in_5_SubFN_tpl_4_q;
    reg [11:0] redist25_ChannelI3n_cunroll_x_in_4_SFN_tpl_2_q;
    reg [11:0] redist25_ChannelI3n_cunroll_x_in_4_SFN_tpl_2_delay_0;
    reg [1:0] redist27_ChannelI3n_cunroll_x_in_6_SCSby15_tpl_6_q;
    reg [0:0] redist30_Xor_rsrvd_fix_q_3_q;
    reg [0:0] redist30_Xor_rsrvd_fix_q_3_delay_0;
    reg [0:0] redist31_CmpEQ_q_5_q;
    reg [0:0] redist31_CmpEQ_q_5_delay_0;
    reg [0:0] redist31_CmpEQ_q_5_delay_1;
    reg [0:0] redist31_CmpEQ_q_5_delay_2;
    reg [0:0] redist32_And2_q_1_q;
    reg [0:0] redist33_And1_q_13_q;
    reg [12:0] redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_outputreg0_q;
    wire redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_reset0;
    wire [7:0] redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_ia;
    wire [2:0] redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_aa;
    wire [2:0] redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_ab;
    wire [7:0] redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_iq;
    wire [7:0] redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q;
    wire [2:0] redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_wraddr_i = 3'b111;
    wire [2:0] redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_offset_q;
    wire [3:0] redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_rdcnt_a;
    wire [3:0] redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_rdcnt_b;
    logic [3:0] redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_rdcnt_o;
    wire [3:0] redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_rdcnt_q;
    wire redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_reset0;
    wire [7:0] redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_ia;
    wire [4:0] redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_aa;
    wire [4:0] redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_ab;
    wire [7:0] redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_iq;
    wire [7:0] redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_q;
    wire [4:0] redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_wraddr_i = 5'b11111;
    wire [4:0] redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_offset_q;
    wire [5:0] redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_rdcnt_a;
    wire [5:0] redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_rdcnt_b;
    logic [5:0] redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_rdcnt_o;
    wire [5:0] redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_rdcnt_q;
    wire redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_reset0;
    wire [15:0] redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_ia;
    wire [4:0] redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_aa;
    wire [4:0] redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_ab;
    wire [15:0] redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_iq;
    wire [15:0] redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_q;
    wire [4:0] redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_wraddr_i = 5'b11111;
    wire [5:0] redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_rdcnt_a;
    wire [5:0] redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_rdcnt_b;
    logic [5:0] redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_rdcnt_o;
    wire [5:0] redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_rdcnt_q;
    wire redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_reset0;
    wire [15:0] redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_ia;
    wire [4:0] redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_aa;
    wire [4:0] redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_ab;
    wire [15:0] redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_iq;
    wire [15:0] redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_q;
    wire [4:0] redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_wraddr_i = 5'b11111;
    wire [5:0] redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_rdcnt_a;
    wire [5:0] redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_rdcnt_b;
    logic [5:0] redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_rdcnt_o;
    wire [5:0] redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_rdcnt_q;
    wire redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_reset0;
    wire redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_ena_OrRstB;
    wire [7:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_ia;
    wire [3:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_aa;
    wire [3:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_ab;
    wire [7:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_iq;
    wire [7:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_q;
    wire [3:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_q;
    (* preserve_syn_only *) reg [3:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_i;
    (* preserve_syn_only *) reg redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_eq;
    reg [3:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_wraddr_q;
    wire [4:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_last_q;
    wire [4:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_cmp_b;
    wire [0:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_cmp_q;
    (* preserve_syn_only *) reg [0:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_cmpReg_q;
    wire [0:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_notEnable_q;
    wire [0:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_nor_q;
    (* preserve_syn_only *) reg [0:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_sticky_ena_q;
    wire [0:0] redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_enaAnd_q;
    wire redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_reset0;
    wire redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_ena_OrRstB;
    wire [11:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_ia;
    wire [3:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_aa;
    wire [3:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_ab;
    wire [11:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_iq;
    wire [11:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_q;
    wire [3:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_q;
    (* preserve_syn_only *) reg [3:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_i;
    (* preserve_syn_only *) reg redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_eq;
    reg [3:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_wraddr_q;
    wire [4:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_last_q;
    wire [4:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_cmp_b;
    wire [0:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_cmp_q;
    (* preserve_syn_only *) reg [0:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_cmpReg_q;
    wire [0:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_notEnable_q;
    wire [0:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_nor_q;
    (* preserve_syn_only *) reg [0:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_sticky_ena_q;
    wire [0:0] redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_enaAnd_q;
    wire redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_reset0;
    wire [7:0] redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_ia;
    wire [2:0] redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_aa;
    wire [2:0] redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_ab;
    wire [7:0] redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_iq;
    wire [7:0] redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_q;
    wire [2:0] redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_wraddr_i = 3'b111;
    wire [3:0] redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_rdcnt_a;
    wire [3:0] redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_rdcnt_b;
    logic [3:0] redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_rdcnt_o;
    wire [3:0] redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_rdcnt_q;
    wire redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_reset0;
    wire [7:0] redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_ia;
    wire [3:0] redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_aa;
    wire [3:0] redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_ab;
    wire [7:0] redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_iq;
    wire [7:0] redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_q;
    wire [3:0] redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [3:0] redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_wraddr_i = 4'b1111;
    wire [4:0] redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_rdcnt_a;
    wire [4:0] redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_rdcnt_b;
    logic [4:0] redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_rdcnt_o;
    wire [4:0] redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_rdcnt_q;

    import prach_shortFormat_fftShift_prach_safe_path_ver::safe_path_ver;

    // redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_notEnable(LOGICAL,595)
    assign redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_notEnable_q = $unsigned(~ (VCC_q));

    // redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_nor(LOGICAL,596)
    assign redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_nor_q = ~ (redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_notEnable_q | redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_sticky_ena_q);

    // redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_last(CONSTANT,592)
    assign redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_last_q = $unsigned(5'b01100);

    // redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_cmp(LOGICAL,593)
    assign redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_cmp_b = {1'b0, redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_q};
    assign redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_cmp_q = $unsigned(redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_last_q == redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_cmp_b ? 1'b1 : 1'b0);

    // redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_cmpReg(REG,594)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_cmpReg_q <= $unsigned(redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_cmp_q);
        end
    end

    // redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_sticky_ena(REG,597)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_nor_q == 1'b1)
        begin
            redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_sticky_ena_q <= $unsigned(redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_cmpReg_q);
        end
    end

    // redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_enaAnd(LOGICAL,598)
    assign redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_enaAnd_q = redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_sticky_ena_q & VCC_q;

    // redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt(COUNTER,590)
    // low=0, high=13, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_i <= 4'd0;
            redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_eq <= 1'b0;
        end
        else
        begin
            if (redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_i == 4'd12)
            begin
                redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_eq <= 1'b1;
            end
            else
            begin
                redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_eq <= 1'b0;
            end
            if (redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_eq == 1'b1)
            begin
                redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_i <= $unsigned(redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_i) + $unsigned(4'd3);
            end
            else
            begin
                redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_i <= $unsigned(redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_i) + $unsigned(4'd1);
            end
        end
    end
    assign redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_q = redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_i[3:0];

    // redist25_ChannelI3n_cunroll_x_in_4_SFN_tpl_2(DELAY,553)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist25_ChannelI3n_cunroll_x_in_4_SFN_tpl_2_delay_0 <= '0;
        end
        else
        begin
            redist25_ChannelI3n_cunroll_x_in_4_SFN_tpl_2_delay_0 <= $unsigned(in_4_SFN_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist25_ChannelI3n_cunroll_x_in_4_SFN_tpl_2_q <= redist25_ChannelI3n_cunroll_x_in_4_SFN_tpl_2_delay_0;
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_wraddr(REG,591)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_wraddr_q <= $unsigned(4'b1101);
        end
        else
        begin
            redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_wraddr_q <= $unsigned(redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_q);
        end
    end

    // redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem(DUALMEM,589)
    assign redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_ia = $unsigned(redist25_ChannelI3n_cunroll_x_in_4_SFN_tpl_2_q);
    assign redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_aa = redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_wraddr_q;
    assign redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_ab = redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_rdcnt_q;
    assign redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_ena_OrRstB = areset | redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_enaAnd_q[0];
    assign redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(12),
        .widthad_a(4),
        .numwords_a(14),
        .width_b(12),
        .widthad_b(4),
        .numwords_b(14),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_dmem (
        .clocken1(redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_reset0),
        .clock1(clk),
        .address_a(redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_aa),
        .data_a(redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_ab),
        .q_b(redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
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
    assign redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_q = redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_iq[11:0];

    // redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_notEnable(LOGICAL,585)
    assign redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_notEnable_q = $unsigned(~ (VCC_q));

    // redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_nor(LOGICAL,586)
    assign redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_nor_q = ~ (redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_notEnable_q | redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_sticky_ena_q);

    // redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_last(CONSTANT,582)
    assign redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_last_q = $unsigned(5'b01010);

    // redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_cmp(LOGICAL,583)
    assign redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_cmp_b = {1'b0, redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_q};
    assign redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_cmp_q = $unsigned(redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_last_q == redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_cmp_b ? 1'b1 : 1'b0);

    // redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_cmpReg(REG,584)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_cmpReg_q <= $unsigned(redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_cmp_q);
        end
    end

    // redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_sticky_ena(REG,587)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_nor_q == 1'b1)
        begin
            redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_sticky_ena_q <= $unsigned(redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_cmpReg_q);
        end
    end

    // redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_enaAnd(LOGICAL,588)
    assign redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_enaAnd_q = redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_sticky_ena_q & VCC_q;

    // redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt(COUNTER,580)
    // low=0, high=11, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_i <= 4'd0;
            redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_eq <= 1'b0;
        end
        else
        begin
            if (redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_i == 4'd10)
            begin
                redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_eq <= 1'b1;
            end
            else
            begin
                redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_eq <= 1'b0;
            end
            if (redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_eq == 1'b1)
            begin
                redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_i <= $unsigned(redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_i) + $unsigned(4'd5);
            end
            else
            begin
                redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_i <= $unsigned(redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_i) + $unsigned(4'd1);
            end
        end
    end
    assign redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_q = redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_i[3:0];

    // redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2(DELAY,549)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_delay_0 <= '0;
        end
        else
        begin
            redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_delay_0 <= $unsigned(in_5_SubFN_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_q <= redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_delay_0;
        end
    end

    // redist22_ChannelI3n_cunroll_x_in_5_SubFN_tpl_3(DELAY,550)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist22_ChannelI3n_cunroll_x_in_5_SubFN_tpl_3_q <= $unsigned(redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_q);
        end
    end

    // redist23_ChannelI3n_cunroll_x_in_5_SubFN_tpl_4(DELAY,551)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist23_ChannelI3n_cunroll_x_in_5_SubFN_tpl_4_q <= '0;
        end
        else
        begin
            redist23_ChannelI3n_cunroll_x_in_5_SubFN_tpl_4_q <= $unsigned(redist22_ChannelI3n_cunroll_x_in_5_SubFN_tpl_3_q);
        end
    end

    // redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_wraddr(REG,581)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_wraddr_q <= $unsigned(4'b1011);
        end
        else
        begin
            redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_wraddr_q <= $unsigned(redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_q);
        end
    end

    // redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem(DUALMEM,579)
    assign redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_ia = $unsigned(redist23_ChannelI3n_cunroll_x_in_5_SubFN_tpl_4_q);
    assign redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_aa = redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_wraddr_q;
    assign redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_ab = redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_rdcnt_q;
    assign redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_ena_OrRstB = areset | redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_enaAnd_q[0];
    assign redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(8),
        .widthad_a(4),
        .numwords_a(12),
        .width_b(8),
        .widthad_b(4),
        .numwords_b(12),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_dmem (
        .clocken1(redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_reset0),
        .clock1(clk),
        .address_a(redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_aa),
        .data_a(redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_ab),
        .q_b(redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
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
    assign redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_q = redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_iq[7:0];

    // Xor_rsrvd_fix(LOGICAL,66)@14 + 1
    assign Xor_rsrvd_fix_qi = in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl ^ in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Xor_rsrvd_fix_delay ( .xin(Xor_rsrvd_fix_qi), .xout(Xor_rsrvd_fix_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist30_Xor_rsrvd_fix_q_3(DELAY,558)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist30_Xor_rsrvd_fix_q_3_delay_0 <= $unsigned(Xor_rsrvd_fix_q);
            redist30_Xor_rsrvd_fix_q_3_q <= redist30_Xor_rsrvd_fix_q_3_delay_0;
        end
    end

    // Const3(CONSTANT,47)
    assign Const3_q = $unsigned(7'b1000011);

    // Sub(SUB,64)@0
    assign Sub_a = $unsigned({1'b0, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl});
    assign Sub_b = $unsigned({2'b00, Const3_q});
    assign Sub_o = $unsigned($signed(Sub_a) - $signed(Sub_b));
    assign Sub_q = Sub_o[8:0];

    // Sub_PostCast_primWireOut_sel_x(BITSELECT,100)@0
    assign Sub_PostCast_primWireOut_sel_x_b = $unsigned(Sub_q[7:0]);

    // StartOfSymbol_LUT_lutmem(DUALMEM,422)@0 + 2
    assign StartOfSymbol_LUT_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("NONE"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_StartOfSymbol_LUT_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) StartOfSymbol_LUT_lutmem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(StartOfSymbol_LUT_lutmem_aa),
        .q_a(StartOfSymbol_LUT_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign StartOfSymbol_LUT_lutmem_r = StartOfSymbol_LUT_lutmem_ir[3:0];

    // redist2_StartOfSymbol_LUT_lutmem_r_6(DELAY,530)
    dspba_delay_ver #( .width(4), .depth(6), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist2_StartOfSymbol_LUT_lutmem_r_6 ( .xin(StartOfSymbol_LUT_lutmem_r), .xout(redist2_StartOfSymbol_LUT_lutmem_r_6_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist3_StartOfSymbol_LUT_lutmem_r_15(DELAY,531)
    dspba_delay_ver #( .width(4), .depth(9), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist3_StartOfSymbol_LUT_lutmem_r_15 ( .xin(redist2_StartOfSymbol_LUT_lutmem_r_6_q), .xout(redist3_StartOfSymbol_LUT_lutmem_r_15_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // BitCombine(BITJOIN,43)@17
    assign BitCombine_q = {redist26_ChannelI3n_cunroll_x_in_4_SFN_tpl_17_mem_q, redist24_ChannelI3n_cunroll_x_in_5_SubFN_tpl_17_mem_q, redist30_Xor_rsrvd_fix_q_3_q, redist4_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev1_id0_q_10_q, redist3_StartOfSymbol_LUT_lutmem_r_15_q};

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const13_x(CONSTANT,179)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const13_x_q = $unsigned(4'b1000);

    // redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_rdcnt(ADD,606)
    assign redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_rdcnt_a = {1'b0, redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_wraddr_q};
    assign redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_rdcnt_b = {1'b0, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const13_x_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_rdcnt_o <= $unsigned(redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_rdcnt_a) + $unsigned(redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_rdcnt_b);
        end
    end
    assign redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_rdcnt_q = redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_rdcnt_o[4:0];

    // redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_offset(CONSTANT,565)
    assign redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_offset_q = $unsigned(3'b101);

    // redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_rdcnt(ADD,602)
    assign redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_rdcnt_a = {1'b0, redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_wraddr_q};
    assign redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_rdcnt_b = {1'b0, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_rdcnt_o <= $unsigned(redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_rdcnt_a) + $unsigned(redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_rdcnt_b);
        end
    end
    assign redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_rdcnt_q = redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_rdcnt_o[3:0];

    // redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_wraddr(COUNTER,600)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_wraddr_i <= $unsigned(redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_wraddr_q = redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_wraddr_i[2:0];

    // redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem(DUALMEM,599)
    assign redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_ia = $unsigned(in_7_BWby10_tpl);
    assign redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_aa = redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_wraddr_q;
    assign redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_ab = redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_rdcnt_q[2:0];
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
    ) redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_aa),
        .data_a(redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_ab),
        .q_b(redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_iq),
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
    assign redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_q = redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_iq[7:0];

    // redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_wraddr(COUNTER,604)
    // low=0, high=15, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_wraddr_i <= $unsigned(redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_wraddr_i) + $unsigned(4'd1);
        end
    end
    assign redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_wraddr_q = redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_wraddr_i[3:0];

    // redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem(DUALMEM,603)
    assign redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_ia = $unsigned(redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_q);
    assign redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_aa = redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_wraddr_q;
    assign redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_ab = redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_rdcnt_q[3:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(8),
        .widthad_a(4),
        .numwords_a(16),
        .width_b(8),
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
    ) redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_aa),
        .data_a(redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_ab),
        .q_b(redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_iq),
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
    assign redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_q = redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_iq[7:0];

    // LutY_lutmem(DUALMEM,419)@0 + 2
    assign LutY_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    assign LutY_lutmem_ena_NotRstA = ~ (areset);
    assign LutY_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(1),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_LutY_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LutY_lutmem_dmem (
        .clocken0(LutY_lutmem_ena_NotRstA),
        .sclr(LutY_lutmem_reset0),
        .clock0(clk),
        .address_a(LutY_lutmem_aa),
        .q_a(LutY_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign LutY_lutmem_r = LutY_lutmem_ir[0:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const_x(CONSTANT,203)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const_x_q = $unsigned(4'b0000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits3_x(CHOOSEBITS,235)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits3_x_a = redist25_ChannelI3n_cunroll_x_in_4_SFN_tpl_2_q;
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits3_x_q = {prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits3_x_a[3:3], prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits3_x_a[2:2], prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits3_x_a[1:1], prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits3_x_a[0:0]};

    // LutX_lutmem(DUALMEM,418)@0 + 2
    assign LutX_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    assign LutX_lutmem_ena_NotRstA = ~ (areset);
    assign LutX_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(5),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_LutX_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LutX_lutmem_dmem (
        .clocken0(LutX_lutmem_ena_NotRstA),
        .sclr(LutX_lutmem_reset0),
        .clock0(clk),
        .address_a(LutX_lutmem_aa),
        .q_a(LutX_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign LutX_lutmem_r = LutX_lutmem_ir[4:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged(BITSELECT,520)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_b = LutX_lutmem_r[1:1];
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_c = LutX_lutmem_r[2:2];
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_d = LutX_lutmem_r[3:3];
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_e = LutX_lutmem_r[4:4];

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits2_x(CHOOSEBITS,234)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits2_x_a = redist25_ChannelI3n_cunroll_x_in_4_SFN_tpl_2_q;
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits2_x_q = {prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits2_x_a[2:2], prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits2_x_a[1:1], prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits2_x_a[0:0]};

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine2_x(BITJOIN,227)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine2_x_q = {GND_q, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits2_x_q};

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Const3_x(CONSTANT,238)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Const3_x_q = $unsigned(2'b00);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits1_x(CHOOSEBITS,233)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits1_x_a = redist25_ChannelI3n_cunroll_x_in_4_SFN_tpl_2_q;
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits1_x_q = {prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits1_x_a[1:1], prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits1_x_a[0:0]};

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine1_x(BITJOIN,226)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine1_x_q = {prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Const3_x_q, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits1_x_q};

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Const2_x(CONSTANT,237)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Const2_x_q = $unsigned(3'b000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits_x(CHOOSEBITS,232)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits_x_a = redist25_ChannelI3n_cunroll_x_in_4_SFN_tpl_2_q;
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits_x_a[0:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine_x(BITJOIN,225)@2
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine_x_q = {prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Const2_x_q, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits_x_q};

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0(SELECTOR,375)@2
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_b or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_c or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine1_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_d or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine2_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0_q = 4'b0;
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0_v = $unsigned(1'b0);
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_d == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine2_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0_v = $unsigned(1'b1);
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_c == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine1_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0_v = $unsigned(1'b1);
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_b == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitCombine_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0_v = $unsigned(1'b1);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev1_id0(SELECTOR,376)@2
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0_v or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_e or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits3_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev1_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const_x_q;
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_BitExtract_x_bit_select_merged_e == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev1_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_ChooseBits3_x_q;
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0_v == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev1_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev0_id0_q;
        end
    end

    // CmpEQ12(LOGICAL,45)@2 + 1
    assign CmpEQ12_b = {3'b000, LutY_lutmem_r};
    assign CmpEQ12_qi = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Select_x_opt_lev1_id0_q == CmpEQ12_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    CmpEQ12_delay ( .xin(CmpEQ12_qi), .xout(CmpEQ12_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ActiveSubF_LUT_9_x_lutmem(DUALMEM,432)@0 + 2
    assign ActiveSubF_LUT_9_x_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    assign ActiveSubF_LUT_9_x_lutmem_ena_NotRstA = ~ (areset);
    assign ActiveSubF_LUT_9_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(5),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_9_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) ActiveSubF_LUT_9_x_lutmem_dmem (
        .clocken0(ActiveSubF_LUT_9_x_lutmem_ena_NotRstA),
        .sclr(ActiveSubF_LUT_9_x_lutmem_reset0),
        .clock0(clk),
        .address_a(ActiveSubF_LUT_9_x_lutmem_aa),
        .q_a(ActiveSubF_LUT_9_x_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign ActiveSubF_LUT_9_x_lutmem_r = ActiveSubF_LUT_9_x_lutmem_ir[4:0];

    // CmpEQ11_9_x(LOGICAL,88)@2 + 1
    assign CmpEQ11_9_x_b = {3'b000, ActiveSubF_LUT_9_x_lutmem_r};
    assign CmpEQ11_9_x_qi = $unsigned(redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_q == CmpEQ11_9_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    CmpEQ11_9_x_delay ( .xin(CmpEQ11_9_x_qi), .xout(CmpEQ11_9_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ActiveSubF_LUT_8_x_lutmem(DUALMEM,431)@0 + 2
    assign ActiveSubF_LUT_8_x_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    assign ActiveSubF_LUT_8_x_lutmem_ena_NotRstA = ~ (areset);
    assign ActiveSubF_LUT_8_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(5),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_8_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) ActiveSubF_LUT_8_x_lutmem_dmem (
        .clocken0(ActiveSubF_LUT_8_x_lutmem_ena_NotRstA),
        .sclr(ActiveSubF_LUT_8_x_lutmem_reset0),
        .clock0(clk),
        .address_a(ActiveSubF_LUT_8_x_lutmem_aa),
        .q_a(ActiveSubF_LUT_8_x_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign ActiveSubF_LUT_8_x_lutmem_r = ActiveSubF_LUT_8_x_lutmem_ir[4:0];

    // CmpEQ11_8_x(LOGICAL,87)@2 + 1
    assign CmpEQ11_8_x_b = {3'b000, ActiveSubF_LUT_8_x_lutmem_r};
    assign CmpEQ11_8_x_qi = $unsigned(redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_q == CmpEQ11_8_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    CmpEQ11_8_x_delay ( .xin(CmpEQ11_8_x_qi), .xout(CmpEQ11_8_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ActiveSubF_LUT_7_x_lutmem(DUALMEM,430)@0 + 2
    assign ActiveSubF_LUT_7_x_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    assign ActiveSubF_LUT_7_x_lutmem_ena_NotRstA = ~ (areset);
    assign ActiveSubF_LUT_7_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(5),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_7_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) ActiveSubF_LUT_7_x_lutmem_dmem (
        .clocken0(ActiveSubF_LUT_7_x_lutmem_ena_NotRstA),
        .sclr(ActiveSubF_LUT_7_x_lutmem_reset0),
        .clock0(clk),
        .address_a(ActiveSubF_LUT_7_x_lutmem_aa),
        .q_a(ActiveSubF_LUT_7_x_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign ActiveSubF_LUT_7_x_lutmem_r = ActiveSubF_LUT_7_x_lutmem_ir[4:0];

    // CmpEQ11_7_x(LOGICAL,86)@2 + 1
    assign CmpEQ11_7_x_b = {3'b000, ActiveSubF_LUT_7_x_lutmem_r};
    assign CmpEQ11_7_x_qi = $unsigned(redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_q == CmpEQ11_7_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    CmpEQ11_7_x_delay ( .xin(CmpEQ11_7_x_qi), .xout(CmpEQ11_7_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ActiveSubF_LUT_6_x_lutmem(DUALMEM,429)@0 + 2
    assign ActiveSubF_LUT_6_x_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    assign ActiveSubF_LUT_6_x_lutmem_ena_NotRstA = ~ (areset);
    assign ActiveSubF_LUT_6_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(5),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_6_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) ActiveSubF_LUT_6_x_lutmem_dmem (
        .clocken0(ActiveSubF_LUT_6_x_lutmem_ena_NotRstA),
        .sclr(ActiveSubF_LUT_6_x_lutmem_reset0),
        .clock0(clk),
        .address_a(ActiveSubF_LUT_6_x_lutmem_aa),
        .q_a(ActiveSubF_LUT_6_x_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign ActiveSubF_LUT_6_x_lutmem_r = ActiveSubF_LUT_6_x_lutmem_ir[4:0];

    // CmpEQ11_6_x(LOGICAL,85)@2 + 1
    assign CmpEQ11_6_x_b = {3'b000, ActiveSubF_LUT_6_x_lutmem_r};
    assign CmpEQ11_6_x_qi = $unsigned(redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_q == CmpEQ11_6_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    CmpEQ11_6_x_delay ( .xin(CmpEQ11_6_x_qi), .xout(CmpEQ11_6_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ActiveSubF_LUT_5_x_lutmem(DUALMEM,428)@0 + 2
    assign ActiveSubF_LUT_5_x_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    assign ActiveSubF_LUT_5_x_lutmem_ena_NotRstA = ~ (areset);
    assign ActiveSubF_LUT_5_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(5),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_5_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) ActiveSubF_LUT_5_x_lutmem_dmem (
        .clocken0(ActiveSubF_LUT_5_x_lutmem_ena_NotRstA),
        .sclr(ActiveSubF_LUT_5_x_lutmem_reset0),
        .clock0(clk),
        .address_a(ActiveSubF_LUT_5_x_lutmem_aa),
        .q_a(ActiveSubF_LUT_5_x_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign ActiveSubF_LUT_5_x_lutmem_r = ActiveSubF_LUT_5_x_lutmem_ir[4:0];

    // CmpEQ11_5_x(LOGICAL,84)@2 + 1
    assign CmpEQ11_5_x_b = {3'b000, ActiveSubF_LUT_5_x_lutmem_r};
    assign CmpEQ11_5_x_qi = $unsigned(redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_q == CmpEQ11_5_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    CmpEQ11_5_x_delay ( .xin(CmpEQ11_5_x_qi), .xout(CmpEQ11_5_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ActiveSubF_LUT_4_x_lutmem(DUALMEM,427)@0 + 2
    assign ActiveSubF_LUT_4_x_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    assign ActiveSubF_LUT_4_x_lutmem_ena_NotRstA = ~ (areset);
    assign ActiveSubF_LUT_4_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(5),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_4_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) ActiveSubF_LUT_4_x_lutmem_dmem (
        .clocken0(ActiveSubF_LUT_4_x_lutmem_ena_NotRstA),
        .sclr(ActiveSubF_LUT_4_x_lutmem_reset0),
        .clock0(clk),
        .address_a(ActiveSubF_LUT_4_x_lutmem_aa),
        .q_a(ActiveSubF_LUT_4_x_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign ActiveSubF_LUT_4_x_lutmem_r = ActiveSubF_LUT_4_x_lutmem_ir[4:0];

    // CmpEQ11_4_x(LOGICAL,83)@2 + 1
    assign CmpEQ11_4_x_b = {3'b000, ActiveSubF_LUT_4_x_lutmem_r};
    assign CmpEQ11_4_x_qi = $unsigned(redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_q == CmpEQ11_4_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    CmpEQ11_4_x_delay ( .xin(CmpEQ11_4_x_qi), .xout(CmpEQ11_4_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ActiveSubF_LUT_3_x_lutmem(DUALMEM,426)@0 + 2
    assign ActiveSubF_LUT_3_x_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    assign ActiveSubF_LUT_3_x_lutmem_ena_NotRstA = ~ (areset);
    assign ActiveSubF_LUT_3_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(5),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_3_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) ActiveSubF_LUT_3_x_lutmem_dmem (
        .clocken0(ActiveSubF_LUT_3_x_lutmem_ena_NotRstA),
        .sclr(ActiveSubF_LUT_3_x_lutmem_reset0),
        .clock0(clk),
        .address_a(ActiveSubF_LUT_3_x_lutmem_aa),
        .q_a(ActiveSubF_LUT_3_x_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign ActiveSubF_LUT_3_x_lutmem_r = ActiveSubF_LUT_3_x_lutmem_ir[4:0];

    // CmpEQ11_3_x(LOGICAL,82)@2 + 1
    assign CmpEQ11_3_x_b = {3'b000, ActiveSubF_LUT_3_x_lutmem_r};
    assign CmpEQ11_3_x_qi = $unsigned(redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_q == CmpEQ11_3_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    CmpEQ11_3_x_delay ( .xin(CmpEQ11_3_x_qi), .xout(CmpEQ11_3_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ActiveSubF_LUT_2_x_lutmem(DUALMEM,425)@0 + 2
    assign ActiveSubF_LUT_2_x_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    assign ActiveSubF_LUT_2_x_lutmem_ena_NotRstA = ~ (areset);
    assign ActiveSubF_LUT_2_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(5),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_2_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) ActiveSubF_LUT_2_x_lutmem_dmem (
        .clocken0(ActiveSubF_LUT_2_x_lutmem_ena_NotRstA),
        .sclr(ActiveSubF_LUT_2_x_lutmem_reset0),
        .clock0(clk),
        .address_a(ActiveSubF_LUT_2_x_lutmem_aa),
        .q_a(ActiveSubF_LUT_2_x_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign ActiveSubF_LUT_2_x_lutmem_r = ActiveSubF_LUT_2_x_lutmem_ir[4:0];

    // CmpEQ11_2_x(LOGICAL,81)@2 + 1
    assign CmpEQ11_2_x_b = {3'b000, ActiveSubF_LUT_2_x_lutmem_r};
    assign CmpEQ11_2_x_qi = $unsigned(redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_q == CmpEQ11_2_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    CmpEQ11_2_x_delay ( .xin(CmpEQ11_2_x_qi), .xout(CmpEQ11_2_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ActiveSubF_LUT_1_x_lutmem(DUALMEM,424)@0 + 2
    assign ActiveSubF_LUT_1_x_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    assign ActiveSubF_LUT_1_x_lutmem_ena_NotRstA = ~ (areset);
    assign ActiveSubF_LUT_1_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(5),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_1_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) ActiveSubF_LUT_1_x_lutmem_dmem (
        .clocken0(ActiveSubF_LUT_1_x_lutmem_ena_NotRstA),
        .sclr(ActiveSubF_LUT_1_x_lutmem_reset0),
        .clock0(clk),
        .address_a(ActiveSubF_LUT_1_x_lutmem_aa),
        .q_a(ActiveSubF_LUT_1_x_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign ActiveSubF_LUT_1_x_lutmem_r = ActiveSubF_LUT_1_x_lutmem_ir[4:0];

    // CmpEQ11_1_x(LOGICAL,80)@2 + 1
    assign CmpEQ11_1_x_b = {3'b000, ActiveSubF_LUT_1_x_lutmem_r};
    assign CmpEQ11_1_x_qi = $unsigned(redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_q == CmpEQ11_1_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    CmpEQ11_1_x_delay ( .xin(CmpEQ11_1_x_qi), .xout(CmpEQ11_1_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ActiveSubF_LUT_0_x_lutmem(DUALMEM,423)@0 + 2
    assign ActiveSubF_LUT_0_x_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    assign ActiveSubF_LUT_0_x_lutmem_ena_NotRstA = ~ (areset);
    assign ActiveSubF_LUT_0_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(5),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ActiveSubF_LUT_0_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) ActiveSubF_LUT_0_x_lutmem_dmem (
        .clocken0(ActiveSubF_LUT_0_x_lutmem_ena_NotRstA),
        .sclr(ActiveSubF_LUT_0_x_lutmem_reset0),
        .clock0(clk),
        .address_a(ActiveSubF_LUT_0_x_lutmem_aa),
        .q_a(ActiveSubF_LUT_0_x_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign ActiveSubF_LUT_0_x_lutmem_r = ActiveSubF_LUT_0_x_lutmem_ir[4:0];

    // CmpEQ11_0_x(LOGICAL,79)@2 + 1
    assign CmpEQ11_0_x_b = {3'b000, ActiveSubF_LUT_0_x_lutmem_r};
    assign CmpEQ11_0_x_qi = $unsigned(redist21_ChannelI3n_cunroll_x_in_5_SubFN_tpl_2_q == CmpEQ11_0_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    CmpEQ11_0_x_delay ( .xin(CmpEQ11_0_x_qi), .xout(CmpEQ11_0_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // Or1(LOGICAL,54)@3
    assign Or1_q = CmpEQ11_0_x_q | CmpEQ11_1_x_q | CmpEQ11_2_x_q | CmpEQ11_3_x_q | CmpEQ11_4_x_q | CmpEQ11_5_x_q | CmpEQ11_6_x_q | CmpEQ11_7_x_q | CmpEQ11_8_x_q | CmpEQ11_9_x_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SubFNChangeDetect_CmpNE_x(LOGICAL,222)@3
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SubFNChangeDetect_CmpNE_x_q = $unsigned(redist22_ChannelI3n_cunroll_x_in_5_SubFN_tpl_3_q != redist23_ChannelI3n_cunroll_x_in_5_SubFN_tpl_4_q ? 1'b1 : 1'b0);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SubFNChangeDetect_Not_x(LOGICAL,223)@3
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SubFNChangeDetect_Not_x_q = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SubFNChangeDetect_CmpNE_x_q);

    // And1(LOGICAL,41)@3 + 1
    assign And1_qi = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SubFNChangeDetect_Not_x_q & Or1_q & CmpEQ12_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    And1_delay ( .xin(And1_qi), .xout(And1_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist33_And1_q_13(DELAY,561)
    dspba_delay_ver #( .width(1), .depth(12), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist33_And1_q_13 ( .xin(And1_q), .xout(redist33_And1_q_13_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist17_ChannelI3n_cunroll_x_in_2_vin_tpl_17(DELAY,545)
    dspba_delay_ver #( .width(1), .depth(17), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist17_ChannelI3n_cunroll_x_in_2_vin_tpl_17 ( .xin(in_2_vin_tpl), .xout(redist17_ChannelI3n_cunroll_x_in_2_vin_tpl_17_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // And2(LOGICAL,42)@16
    assign And2_q = redist17_ChannelI3n_cunroll_x_in_2_vin_tpl_17_q & redist33_And1_q_13_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_Not_x(LOGICAL,218)@16
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_Not_x_q = ~ (And2_q);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_And_x(LOGICAL,217)@16
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_And_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_Or_x_q & prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_Not_x_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RisingEdgeDetect_Not_x(LOGICAL,215)@15 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RisingEdgeDetect_Not_x_qi = ~ (redist33_And1_q_13_q);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RisingEdgeDetect_Not_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RisingEdgeDetect_Not_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RisingEdgeDetect_Not_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RisingEdgeDetect_And3_x(LOGICAL,214)@16
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RisingEdgeDetect_And3_x_q = redist33_And1_q_13_q & prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RisingEdgeDetect_Not_x_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_Or_x(LOGICAL,219)@16 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_Or_x_qi = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RisingEdgeDetect_And3_x_q | prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_And_x_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_Or_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_Or_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_Or_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const12_x(CONSTANT,178)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const12_x_q = $unsigned(4'b0100);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const12_x(CONSTANT,157)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const12_x_q = $unsigned(8'b11010011);

    // redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_rdcnt(ADD,566)
    assign redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_rdcnt_a = {1'b0, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_wraddr_q};
    assign redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_rdcnt_b = {1'b0, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_rdcnt_o <= $unsigned(redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_rdcnt_a) + $unsigned(redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_rdcnt_b);
        end
    end
    assign redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_rdcnt_q = redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_rdcnt_o[3:0];

    // redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_wraddr(COUNTER,564)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_wraddr_i <= $unsigned(redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_wraddr_q = redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_wraddr_i[2:0];

    // redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem(DUALMEM,563)
    assign redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_ia = $unsigned(in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl);
    assign redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_aa = redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_wraddr_q;
    assign redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_ab = redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_rdcnt_q[2:0];
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
    ) redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_aa),
        .data_a(redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_ab),
        .q_b(redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_iq),
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
    assign redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q = redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_iq[7:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT10_x(COMPARE,145)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT10_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT10_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const12_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT10_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT10_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT10_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT10_x_c[0] = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT10_x_o[9];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const11_x(CONSTANT,156)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const11_x_q = $unsigned(8'b10111101);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE10_x(COMPARE,135)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE10_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE10_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const11_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE10_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE10_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE10_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE10_x_n[0] = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE10_x_o[9]);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And12_x(LOGICAL,128)@6 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And12_x_qi = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE10_x_n & prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT10_x_c;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And12_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And12_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And12_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const10_x(CONSTANT,176)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const10_x_q = $unsigned(4'b0001);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT9_x(COMPARE,153)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT9_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT9_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const11_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT9_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT9_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT9_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT9_x_c[0] = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT9_x_o[9];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const10_x(CONSTANT,155)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const10_x_q = $unsigned(8'b10101001);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE9_x(COMPARE,144)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE9_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE9_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const10_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE9_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE9_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE9_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE9_x_n[0] = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE9_x_o[9]);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And11_x(LOGICAL,127)@6 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And11_x_qi = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE9_x_n & prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT9_x_c;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And11_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And11_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And11_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const21_x(CONSTANT,185)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const21_x_q = $unsigned(4'b1100);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT8_x(COMPARE,152)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT8_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT8_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const10_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT8_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT8_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT8_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT8_x_c[0] = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT8_x_o[9];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const9_x(CONSTANT,165)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const9_x_q = $unsigned(8'b10010001);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE8_x(COMPARE,143)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE8_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE8_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const9_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE8_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE8_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE8_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE8_x_n[0] = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE8_x_o[9]);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And10_x(LOGICAL,126)@6 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And10_x_qi = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE8_x_n & prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT8_x_c;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And10_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And10_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And10_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1(SELECTOR,373)@7
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And10_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const21_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And11_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const10_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And12_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const12_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1_q = 4'b0;
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1_v = $unsigned(1'b0);
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And12_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const12_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1_v = $unsigned(1'b1);
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And11_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const10_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1_v = $unsigned(1'b1);
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And10_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const21_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1_v = $unsigned(1'b1);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const4_x(CONSTANT,206)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const4_x_q = $unsigned(4'b0110);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const14_x(CONSTANT,159)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const14_x_q = $unsigned(8'b11110001);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x(COMPARE,138)@6 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const14_x_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x_o <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x_b);
        end
    end
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x_n[0] = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x_o[9]);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const8_x(CONSTANT,164)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const8_x_q = $unsigned(8'b10000101);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT6_x(COMPARE,150)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT6_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT6_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const8_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT6_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT6_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT6_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT6_x_c[0] = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT6_x_o[9];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const7_x(CONSTANT,163)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const7_x_q = $unsigned(7'b1101110);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE6_x(COMPARE,141)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE6_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE6_x_b = {3'b000, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const7_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE6_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE6_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE6_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE6_x_n[0] = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE6_x_o[9]);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And8_x(LOGICAL,133)@6 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And8_x_qi = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE6_x_n & prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT6_x_c;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And8_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And8_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And8_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or2_x(LOGICAL,212)@7
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or2_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And8_x_q | GND_q | prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x_n;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT12_x(COMPARE,147)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT12_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT12_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const14_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT12_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT12_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT12_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT12_x_c[0] = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT12_x_o[9];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const13_x(CONSTANT,158)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const13_x_q = $unsigned(8'b11100010);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE12_x(COMPARE,137)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE12_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE12_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const13_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE12_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE12_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE12_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE12_x_n[0] = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE12_x_o[9]);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And14_x(LOGICAL,130)@6 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And14_x_qi = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE12_x_n & prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT12_x_c;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And14_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And14_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And14_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT5_x(COMPARE,149)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT5_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT5_x_b = {3'b000, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const7_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT5_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT5_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT5_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT5_x_c[0] = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT5_x_o[9];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const6_x(CONSTANT,162)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const6_x_q = $unsigned(7'b1010111);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE5_x(COMPARE,140)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE5_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE5_x_b = {3'b000, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const6_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE5_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE5_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE5_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE5_x_n[0] = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE5_x_o[9]);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And7_x(LOGICAL,132)@6 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And7_x_qi = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE5_x_n & prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT5_x_c;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And7_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And7_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And7_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or1_x(LOGICAL,211)@7
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or1_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And7_x_q | GND_q | prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And14_x_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const11_x(CONSTANT,177)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const11_x_q = $unsigned(4'b0010);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT11_x(COMPARE,146)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT11_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT11_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const13_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT11_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT11_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT11_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT11_x_c[0] = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT11_x_o[9];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE11_x(COMPARE,136)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE11_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE11_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const12_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE11_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE11_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE11_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE11_x_n[0] = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE11_x_o[9]);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And13_x(LOGICAL,129)@6 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And13_x_qi = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE11_x_n & prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT11_x_c;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And13_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And13_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And13_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT7_x(COMPARE,151)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT7_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT7_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const9_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT7_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT7_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT7_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT7_x_c[0] = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT7_x_o[9];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE7_x(COMPARE,142)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE7_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE7_x_b = {2'b00, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const8_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE7_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE7_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE7_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE7_x_n[0] = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE7_x_o[9]);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And9_x(LOGICAL,134)@6 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And9_x_qi = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE7_x_n & prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT7_x_c;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And9_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And9_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And9_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT4_x(COMPARE,148)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT4_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT4_x_b = {3'b000, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_Const6_x_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT4_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT4_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT4_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT4_x_c[0] = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT4_x_o[9];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE4_x(COMPARE,139)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE4_x_a = {2'b00, redist8_RegField1_from_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_unsched_x_outBound_q_6_mem_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE4_x_b = {3'b000, Const3_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE4_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE4_x_a) - $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE4_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE4_x_n[0] = ~ (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE4_x_o[9]);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And6_x(LOGICAL,131)@6 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And6_x_qi = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE4_x_n & prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpLT4_x_c;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And6_x_delay ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And6_x_qi), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And6_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or_x(LOGICAL,210)@7
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And6_x_q | prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And9_x_q | prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And13_x_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0(SELECTOR,372)@7
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const11_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or1_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const12_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or2_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const4_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0_q = 4'b0;
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0_v = $unsigned(1'b0);
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or2_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const4_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0_v = $unsigned(1'b1);
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or1_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const12_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0_v = $unsigned(1'b1);
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Or_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const11_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0_v = $unsigned(1'b1);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev1_id0(SELECTOR,374)@7
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0_v or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1_v or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev1_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const_x_q;
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1_v == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev1_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id1_q;
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0_v == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev1_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev0_id0_q;
        end
    end

    // redist4_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev1_id0_q_10(DELAY,532)
    dspba_delay_ver #( .width(4), .depth(10), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist4_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev1_id0_q_10 ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev1_id0_q), .xout(redist4_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev1_id0_q_10_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const3_x(CONSTANT,190)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const3_x_q = $unsigned(2'b01);

    // redist27_ChannelI3n_cunroll_x_in_6_SCSby15_tpl_6(DELAY,555)
    dspba_delay_ver #( .width(2), .depth(6), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist27_ChannelI3n_cunroll_x_in_6_SCSby15_tpl_6 ( .xin(in_6_SCSby15_tpl), .xout(redist27_ChannelI3n_cunroll_x_in_6_SCSby15_tpl_6_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_x(SUB,201)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_x_a = $unsigned({1'b0, redist27_ChannelI3n_cunroll_x_in_6_SCSby15_tpl_6_q});
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_x_b = $unsigned({1'b0, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const3_x_q});
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_x_o = $unsigned($signed(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_x_a) - $signed(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_x_b));
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_x_o[2:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_PostCast_primWireOut_sel_x(BITSELECT,280)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_PostCast_primWireOut_sel_x_b = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_x_q[1:0]);

    // redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_PostCast_primWireOut_sel_x_b_1(DELAY,537)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_PostCast_primWireOut_sel_x_b);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const7_x(CONSTANT,193)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const7_x_q = $unsigned(4'b1101);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_2(MUX,510)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_2_s = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_selLSBs_bit_select_merged_b;
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_2_s or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const7_x_q)
    begin
        unique case (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_2_s)
            2'b00 : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_2_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const7_x_q;
            2'b01 : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_2_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const7_x_q;
            2'b10 : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_2_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const7_x_q;
            default : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_2_q = 4'b0;
        endcase
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_1(MUX,509)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_1_s = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_selLSBs_bit_select_merged_b;
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_1_s or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const21_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const7_x_q)
    begin
        unique case (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_1_s)
            2'b00 : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_1_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const21_x_q;
            2'b01 : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_1_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const21_x_q;
            2'b10 : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_1_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const7_x_q;
            2'b11 : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_1_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const7_x_q;
            default : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_1_q = 4'b0;
        endcase
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const2_x(CONSTANT,184)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const2_x_q = $unsigned(4'b1011);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const1_x(CONSTANT,175)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const1_x_q = $unsigned(4'b1010);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_x(CONSTANT,173)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_x_q = $unsigned(4'b1111);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_0(MUX,508)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_0_s = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_selLSBs_bit_select_merged_b;
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_0_s or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const1_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const2_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const21_x_q)
    begin
        unique case (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_0_s)
            2'b00 : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_x_q;
            2'b01 : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const1_x_q;
            2'b10 : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const2_x_q;
            2'b11 : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const21_x_q;
            default : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_0_q = 4'b0;
        endcase
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_selLSBs_bit_select_merged(BITSELECT,517)@6
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_selLSBs_bit_select_merged_in = redist28_ChannelI3n_cunroll_x_in_7_BWby10_tpl_6_mem_q[3:0];
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_selLSBs_bit_select_merged_b = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_selLSBs_bit_select_merged_in[1:0];
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_selLSBs_bit_select_merged_c = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_selLSBs_bit_select_merged_in[3:2];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_mfinal(MUX,511)@6 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_mfinal_s = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_selLSBs_bit_select_merged_c;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_mfinal_s)
                2'b00 : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_mfinal_q <= prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_0_q;
                2'b01 : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_mfinal_q <= prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_1_q;
                2'b10 : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_mfinal_q <= prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_msplit_2_q;
                default : prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_mfinal_q <= 4'b0;
            endcase
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_x(SUB,202)@7
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_x_a = $unsigned({1'b0, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Mux_x_mfinal_q});
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_x_b = $unsigned({3'b000, redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_PostCast_primWireOut_sel_x_b_1_q});
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_x_o = $unsigned($signed(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_x_a) - $signed(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_x_b));
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_x_o[4:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x(BITSELECT,279)@7
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_x_q[3:0]);

    // redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_1(DELAY,539)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b);
        end
    end

    // redist12_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_2(DELAY,540)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist12_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_2_q <= $unsigned(redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_1_q);
        end
    end

    // redist13_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_10(DELAY,541)
    dspba_delay_ver #( .width(4), .depth(8), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist13_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_10 ( .xin(redist12_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_2_q), .xout(redist13_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_10_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // PRACHSymDuration_LUT_lutmem(DUALMEM,420)@0 + 2
    assign PRACHSymDuration_LUT_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(3),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("NONE"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_PRACHSymDuration_LUT_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) PRACHSymDuration_LUT_lutmem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(PRACHSymDuration_LUT_lutmem_aa),
        .q_a(PRACHSymDuration_LUT_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign PRACHSymDuration_LUT_lutmem_r = PRACHSymDuration_LUT_lutmem_ir[2:0];

    // PRACHSymDuration_LUT_PostCast_primWireOut_rnd_shift(BITSHIFT,515)@2
    assign PRACHSymDuration_LUT_PostCast_primWireOut_rnd_shift_qint = { PRACHSymDuration_LUT_lutmem_r, 1'b0 };
    assign PRACHSymDuration_LUT_PostCast_primWireOut_rnd_shift_q = PRACHSymDuration_LUT_PostCast_primWireOut_rnd_shift_qint[3:0];

    // Mult_cma(CHAINMULTADD,512)@2 + 5
    // out q@8
    assign Mult_cma_reset = areset;
    assign Mult_cma_ena0 = 1'b1;
    assign Mult_cma_ena1 = Mult_cma_ena0;
    assign Mult_cma_ena2 = Mult_cma_ena0;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Mult_cma_ah[0] <= PRACHSymDuration_LUT_PostCast_primWireOut_rnd_shift_q;
            Mult_cma_ch[0] <= {7'b0000000, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl[2:0]};
        end
    end

    assign Mult_cma_a0 = Mult_cma_ah[0];
    assign Mult_cma_c0 = Mult_cma_ch[0];
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(4),
        .ax_clken("0"),
        .ax_width(10),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(14)
    ) Mult_cma_DSP0 (
        .clk(clk),
        .ena({ Mult_cma_ena2, Mult_cma_ena1, Mult_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult_cma_a0),
        .ax(Mult_cma_c0),
        .resulta(Mult_cma_s0),
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
    dspba_delay_ver #( .width(14), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult_cma_delay0 ( .xin(Mult_cma_s0), .xout(Mult_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult_cma_q = $unsigned(Mult_cma_qq0[6:0]);

    // Add(ADD,38)@8 + 1
    assign Add_a = {4'b0000, redist2_StartOfSymbol_LUT_lutmem_r_6_q};
    assign Add_b = {1'b0, Mult_cma_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Add_o <= $unsigned(Add_a) + $unsigned(Add_b);
        end
    end
    assign Add_q = Add_o[7:0];

    // leftShiftStage1Idx3Rng12_uid475_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x(BITSELECT,474)@9
    assign leftShiftStage1Idx3Rng12_uid475_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_in = leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q[0:0];
    assign leftShiftStage1Idx3Rng12_uid475_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_b = leftShiftStage1Idx3Rng12_uid475_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_in[0:0];

    // cz_uid455_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x(CONSTANT,454)
    assign cz_uid455_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = $unsigned(12'b000000000000);

    // leftShiftStage1Idx3_uid476_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x(BITJOIN,475)@9
    assign leftShiftStage1Idx3_uid476_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = {leftShiftStage1Idx3Rng12_uid475_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_b, cz_uid455_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q};

    // leftShiftStage1Idx2Rng8_uid472_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x(BITSELECT,471)@9
    assign leftShiftStage1Idx2Rng8_uid472_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_in = leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q[4:0];
    assign leftShiftStage1Idx2Rng8_uid472_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_b = leftShiftStage1Idx2Rng8_uid472_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_in[4:0];

    // leftShiftStage1Idx2Pad8_uid471_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x(CONSTANT,470)
    assign leftShiftStage1Idx2Pad8_uid471_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = $unsigned(8'b00000000);

    // leftShiftStage1Idx2_uid473_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x(BITJOIN,472)@9
    assign leftShiftStage1Idx2_uid473_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = {leftShiftStage1Idx2Rng8_uid472_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_b, leftShiftStage1Idx2Pad8_uid471_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q};

    // leftShiftStage1Idx1Rng4_uid469_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x(BITSELECT,468)@9
    assign leftShiftStage1Idx1Rng4_uid469_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_in = leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q[8:0];
    assign leftShiftStage1Idx1Rng4_uid469_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_b = leftShiftStage1Idx1Rng4_uid469_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_in[8:0];

    // leftShiftStage1Idx1_uid470_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x(BITJOIN,469)@9
    assign leftShiftStage1Idx1_uid470_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = {leftShiftStage1Idx1Rng4_uid469_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_b, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const_x_q};

    // leftShiftStage0Idx3_uid465_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const(CONSTANT,527)
    assign leftShiftStage0Idx3_uid465_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q = $unsigned(13'b0000000001000);

    // leftShiftStage0Idx2_uid462_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const(CONSTANT,525)
    assign leftShiftStage0Idx2_uid462_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q = $unsigned(13'b0000000000100);

    // leftShiftStage0Idx1_uid459_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const(CONSTANT,523)
    assign leftShiftStage0Idx1_uid459_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q = $unsigned(13'b0000000000010);

    // xPadded_uid456_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const(CONSTANT,521)
    assign xPadded_uid456_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q = $unsigned(13'b0000000000001);

    // leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x(MUX,466)@9
    assign leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_s = leftShiftStageSel0Dto0_uid466_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_bit_select_merged_b;
    always @(leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_s or xPadded_uid456_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q or leftShiftStage0Idx1_uid459_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q or leftShiftStage0Idx2_uid462_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q or leftShiftStage0Idx3_uid465_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q)
    begin
        unique case (leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_s)
            2'b00 : leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = xPadded_uid456_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q;
            2'b01 : leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = leftShiftStage0Idx1_uid459_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q;
            2'b10 : leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = leftShiftStage0Idx2_uid462_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q;
            2'b11 : leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = leftShiftStage0Idx3_uid465_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_const_q;
            default : leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = 13'b0;
        endcase
    end

    // leftShiftStageSel0Dto0_uid466_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_bit_select_merged(BITSELECT,519)@9
    assign leftShiftStageSel0Dto0_uid466_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_bit_select_merged_b = redist12_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_2_q[1:0];
    assign leftShiftStageSel0Dto0_uid466_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_bit_select_merged_c = redist12_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_2_q[3:2];

    // leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x(MUX,477)@9
    assign leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_s = leftShiftStageSel0Dto0_uid466_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_bit_select_merged_c;
    always @(leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_s or leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q or leftShiftStage1Idx1_uid470_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q or leftShiftStage1Idx2_uid473_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q or leftShiftStage1Idx3_uid476_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q)
    begin
        unique case (leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_s)
            2'b00 : leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = leftShiftStage0_uid467_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q;
            2'b01 : leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = leftShiftStage1Idx1_uid470_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q;
            2'b10 : leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = leftShiftStage1Idx2_uid473_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q;
            2'b11 : leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = leftShiftStage1Idx3_uid476_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q;
            default : leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q = 13'b0;
        endcase
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const15_x(CONSTANT,180)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const15_x_q = $unsigned(9'b000100100);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const18_x(CONSTANT,183)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const18_x_q = $unsigned(9'b100100000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ2_x(LOGICAL,169)@8
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ2_x_q = $unsigned(redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_1_q == prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const21_x_q ? 1'b1 : 1'b0);

    // redist14_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ2_x_q_1(DELAY,542)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist14_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ2_x_q_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ2_x_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const17_x(CONSTANT,182)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const17_x_q = $unsigned(9'b010010000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ1_x(LOGICAL,168)@8
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ1_x_q = $unsigned(redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_1_q == prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const2_x_q ? 1'b1 : 1'b0);

    // redist15_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ1_x_q_1(DELAY,543)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist15_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ1_x_q_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ1_x_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const16_x(CONSTANT,181)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const16_x_q = $unsigned(9'b001001000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ_x(LOGICAL,167)@8
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ_x_q = $unsigned(redist11_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_1_q == prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const1_x_q ? 1'b1 : 1'b0);

    // redist16_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ_x_q_1(DELAY,544)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist16_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ_x_q_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ_x_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select1_x_opt(SELECTOR,371)@9
    always @(redist16_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ_x_q_1_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const16_x_q or redist15_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ1_x_q_1_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const17_x_q or redist14_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ2_x_q_1_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const18_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const15_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select1_x_opt_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const15_x_q;
        if (redist14_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ2_x_q_1_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select1_x_opt_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const18_x_q;
        end
        if (redist15_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ1_x_q_1_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select1_x_opt_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const17_x_q;
        end
        if (redist16_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ_x_q_1_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select1_x_opt_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const16_x_q;
        end
    end

    // Mult1_cma(CHAINMULTADD,513)@9 + 5
    // out q@15
    assign Mult1_cma_reset = areset;
    assign Mult1_cma_ena0 = 1'b1;
    assign Mult1_cma_ena1 = Mult1_cma_ena0;
    assign Mult1_cma_ena2 = Mult1_cma_ena0;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Mult1_cma_ah[0] <= {4'b0000, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select1_x_opt_q[8:0]};
            Mult1_cma_bh[0] <= leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q;
            Mult1_cma_ch[0] <= {2'b00, Add_q[7:0]};
        end
    end

    assign Mult1_cma_a0 = Mult1_cma_ah[0];
    assign Mult1_cma_b0 = Mult1_cma_bh[0];
    assign Mult1_cma_c0 = Mult1_cma_ch[0];
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(13),
        .operand_source_may("preadder"),
        .az_clken("0"),
        .az_width(13),
        .ax_clken("0"),
        .ax_width(10),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(23)
    ) Mult1_cma_DSP0 (
        .clk(clk),
        .ena({ Mult1_cma_ena2, Mult1_cma_ena1, Mult1_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult1_cma_a0),
        .az(Mult1_cma_b0),
        .ax(Mult1_cma_c0),
        .resulta(Mult1_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
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
    dspba_delay_ver #( .width(23), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult1_cma_delay0 ( .xin(Mult1_cma_s0), .xout(Mult1_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult1_cma_q = $unsigned(Mult1_cma_qq0[22:0]);

    // redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5(DELAY,529)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_delay_0 <= $unsigned(leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q);
            redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_delay_1 <= redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_delay_0;
            redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_delay_2 <= redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_delay_1;
            redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_q <= redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_delay_2;
        end
    end

    // redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_outputreg0(DELAY,562)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_outputreg0_q <= $unsigned(redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_q);
        end
    end

    // xIfSign_mergedSignalTM_uid345_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x(BITJOIN,344)@14
    assign xIfSign_mergedSignalTM_uid345_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_q = {GND_q, redist1_leftShiftStage1_uid478_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_LShift_x_q_5_outputreg0_q};

    // aPostPad_uid350_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x(BITJOIN,349)@14
    assign aPostPad_uid350_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_q = {xIfSign_mergedSignalTM_uid345_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_q, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const_x_q};

    // sub_uid351_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x(SUB,350)@14
    assign sub_uid351_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_a = $unsigned({{1{aPostPad_uid350_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_q[17]}}, aPostPad_uid350_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_q});
    assign sub_uid351_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_b = $unsigned({{5{xIfSign_mergedSignalTM_uid345_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_q[13]}}, xIfSign_mergedSignalTM_uid345_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_q});
    assign sub_uid351_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_o = $unsigned($signed(sub_uid351_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_a) - $signed(sub_uid351_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_b));
    assign sub_uid351_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_q = sub_uid351_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_o[18:0];

    // sR_uid354_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x(BITSELECT,353)@14
    assign sR_uid354_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_in = sub_uid351_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_q[16:0];
    assign sR_uid354_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_b = sR_uid354_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_in[16:0];

    // redist6_sR_uid354_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_b_1(DELAY,534)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_sR_uid354_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_b_1_q <= $unsigned(sR_uid354_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_b);
        end
    end

    // Select_rsrvd_fix(SELECTOR,61)@15
    always @(Xor_rsrvd_fix_q or redist6_sR_uid354_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_b_1_q or GND_q)
    begin
        Select_rsrvd_fix_q = {16'b0000000000000000, GND_q};
        if (Xor_rsrvd_fix_q == 1'b1)
        begin
            Select_rsrvd_fix_q = redist6_sR_uid354_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const_Mult_x_b_1_q;
        end
    end

    // Add1(ADD,39)@15 + 1
    assign Add1_a = {5'b00000, Select_rsrvd_fix_q};
    assign Add1_b = Mult1_cma_q[21:0];
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Add1_o <= $unsigned(Add1_a) + $unsigned(Add1_b);
        end
    end
    assign Add1_q = Add1_o[21:0];

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select_x_opt(SELECTOR,370)@8
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const11_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ1_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const12_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ2_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const13_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const10_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select_x_opt_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const10_x_q;
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ2_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select_x_opt_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const13_x_q;
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ1_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select_x_opt_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const12_x_q;
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_CmpEQ_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select_x_opt_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Const11_x_q;
        end
    end

    // redist5_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select_x_opt_q_7(DELAY,533)
    dspba_delay_ver #( .width(4), .depth(7), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist5_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select_x_opt_q_7 ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select_x_opt_q), .xout(redist5_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select_x_opt_q_7_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // sR_mergedSignalTM_uid305_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_x16_x(BITJOIN,304)@15
    assign sR_mergedSignalTM_uid305_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_x16_x_q = {redist5_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select_x_opt_q_7_q, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Const2_x_q};

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_x16_PostCast_primWireOut_sel_x(BITSELECT,258)@15
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_x16_PostCast_primWireOut_sel_x_b = {1'b0, sR_mergedSignalTM_uid305_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_x16_x_q[6:0]};

    // rightShiftStage1Idx1Rng4_uid447_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x(BITSELECT,446)@15
    assign rightShiftStage1Idx1Rng4_uid447_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_b = rightShiftStage0_uid446_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q[15:4];

    // rightShiftStage1Idx1_uid449_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x(BITJOIN,448)@15
    assign rightShiftStage1Idx1_uid449_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q = {prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Const_x_q, rightShiftStage1Idx1Rng4_uid447_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_b};

    // rightShiftStage0Idx3Rng3_uid442_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x(BITSELECT,441)@14
    assign rightShiftStage0Idx3Rng3_uid442_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_b = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_q[15:3];

    // rightShiftStage0Idx3_uid444_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x(BITJOIN,443)@14
    assign rightShiftStage0Idx3_uid444_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q = {prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Const2_x_q, rightShiftStage0Idx3Rng3_uid442_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_b};

    // rightShiftStage0Idx2Rng2_uid439_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x(BITSELECT,438)@14
    assign rightShiftStage0Idx2Rng2_uid439_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_b = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_q[15:2];

    // rightShiftStage0Idx2_uid441_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x(BITJOIN,440)@14
    assign rightShiftStage0Idx2_uid441_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q = {prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_rem_Const3_x_q, rightShiftStage0Idx2Rng2_uid439_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_b};

    // rightShiftStage0Idx1Rng1_uid436_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x(BITSELECT,435)@14
    assign rightShiftStage0Idx1Rng1_uid436_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_b = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_q[15:1];

    // rightShiftStage0Idx1_uid438_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x(BITJOIN,437)@14
    assign rightShiftStage0Idx1_uid438_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q = {GND_q, rightShiftStage0Idx1Rng1_uid436_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_b};

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const_x(CONSTANT,103)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const_x_q = $unsigned(12'b000100100000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const11_x(CONSTANT,106)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const11_x_q = $unsigned(12'b001101100000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const14_x(CONSTANT,109)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const14_x_q = $unsigned(12'b000111111000);

    // PrachOccPerSlotMinus1_lutmem(DUALMEM,421)@0 + 2
    assign PrachOccPerSlotMinus1_lutmem_aa = Sub_PostCast_primWireOut_sel_x_b;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(3),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("NONE"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_PrachOccPerSlotMinus1_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) PrachOccPerSlotMinus1_lutmem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(PrachOccPerSlotMinus1_lutmem_aa),
        .q_a(PrachOccPerSlotMinus1_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign PrachOccPerSlotMinus1_lutmem_r = PrachOccPerSlotMinus1_lutmem_ir[2:0];

    // CmpEQ(LOGICAL,44)@2 + 1
    assign CmpEQ_qi = $unsigned(PrachOccPerSlotMinus1_lutmem_r == in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    CmpEQ_delay ( .xin(CmpEQ_qi), .xout(CmpEQ_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist31_CmpEQ_q_5(DELAY,559)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist31_CmpEQ_q_5_delay_0 <= $unsigned(CmpEQ_q);
            redist31_CmpEQ_q_5_delay_1 <= redist31_CmpEQ_q_5_delay_0;
            redist31_CmpEQ_q_5_delay_2 <= redist31_CmpEQ_q_5_delay_1;
            redist31_CmpEQ_q_5_q <= redist31_CmpEQ_q_5_delay_2;
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select3_x(SELECTOR,123)@7
    always @(redist31_CmpEQ_q_5_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const14_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const11_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select3_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const11_x_q;
        if (redist31_CmpEQ_q_5_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select3_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const14_x_q;
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const1_x(CONSTANT,104)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const1_x_q = $unsigned(12'b001001000000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const13_x(CONSTANT,108)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const13_x_q = $unsigned(12'b000101101000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select1_x(SELECTOR,121)@7
    always @(redist31_CmpEQ_q_5_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const13_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const1_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select1_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const1_x_q;
        if (redist31_CmpEQ_q_5_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select1_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const13_x_q;
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id3(SELECTOR,292)@7
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And14_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select1_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x_n or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select3_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id3_q = 12'b0;
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id3_v = $unsigned(1'b0);
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_CmpGE13_x_n == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id3_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select3_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id3_v = $unsigned(1'b1);
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And14_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id3_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select1_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id3_v = $unsigned(1'b1);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const12_x(CONSTANT,107)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const12_x_q = $unsigned(12'b000011011000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select2_x(SELECTOR,122)@7
    always @(redist31_CmpEQ_q_5_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const12_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select2_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const_x_q;
        if (redist31_CmpEQ_q_5_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select2_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const12_x_q;
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const9_x(CONSTANT,118)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const9_x_q = $unsigned(12'b100000000000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const8_x(CONSTANT,117)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const8_x_q = $unsigned(12'b010011011000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2(SELECTOR,291)@7
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And11_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const8_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And12_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const9_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And13_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select2_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2_q = 12'b0;
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2_v = $unsigned(1'b0);
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And13_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select2_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2_v = $unsigned(1'b1);
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And12_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const9_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2_v = $unsigned(1'b1);
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And11_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const8_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2_v = $unsigned(1'b1);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const7_x(CONSTANT,116)
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const7_x_q = $unsigned(12'b001110101000);

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1(SELECTOR,290)@7
    always @(GND_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const13_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const14_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And10_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const7_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1_q = 12'b0;
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1_v = $unsigned(1'b0);
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And10_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const7_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1_v = $unsigned(1'b1);
        end
        if (GND_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const14_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1_v = $unsigned(1'b1);
        end
        if (GND_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const13_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1_v = $unsigned(1'b1);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0(SELECTOR,289)@7
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And7_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const1_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And8_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const11_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And9_x_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const12_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0_q = 12'b0;
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0_v = $unsigned(1'b0);
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And9_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const12_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0_v = $unsigned(1'b1);
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And8_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const11_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0_v = $unsigned(1'b1);
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_DecodeFormat_And7_x_q == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const1_x_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0_v = $unsigned(1'b1);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0(SELECTOR,293)@7
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0_v or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1_v or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2_v or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0_q = 12'b0;
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0_v = $unsigned(1'b0);
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2_v == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id2_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0_v = $unsigned(1'b1);
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1_v == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id1_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0_v = $unsigned(1'b1);
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0_v == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id0_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0_v = $unsigned(1'b1);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev2_id0(SELECTOR,294)@7
    always @(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0_v or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id3_v or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id3_q or prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const_x_q)
    begin
        prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev2_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Const_x_q;
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id3_v == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev2_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev0_id3_q;
        end
        if (prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0_v == 1'b1)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev2_id0_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev1_id0_q;
        end
    end

    // redist7_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev2_id0_q_1(DELAY,535)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist7_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev2_id0_q_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev2_id0_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma(CHAINMULTADD,514)@8 + 5
    // out q@14
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_reset = areset;
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ena0 = 1'b1;
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ena1 = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ena0;
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ena2 = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ena0;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ah[0] <= redist7_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Select_x_opt_lev2_id0_q_1_q;
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ch[0] <= {6'b000000, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Select_x_opt_q[3:0]};
        end
    end

    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_a0 = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ah[0];
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_c0 = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ch[0];
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(12),
        .ax_clken("0"),
        .ax_width(10),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(22)
    ) prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_DSP0 (
        .clk(clk),
        .ena({ prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ena2, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ena1, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_a0),
        .ax(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_c0),
        .resulta(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_s0),
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
    dspba_delay_ver #( .width(22), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_delay0 ( .xin(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_s0), .xout(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_q = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_qq0[15:0]);

    // redist10_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_PostCast_primWireOut_sel_x_b_8(DELAY,538)
    dspba_delay_ver #( .width(2), .depth(7), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist10_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_PostCast_primWireOut_sel_x_b_8 ( .xin(redist9_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_PostCast_primWireOut_sel_x_b_1_q), .xout(redist10_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_PostCast_primWireOut_sel_x_b_8_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add_x(ADD,101)@14
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add_x_a = {1'b0, redist10_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub_PostCast_primWireOut_sel_x_b_8_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add_x_b = {2'b00, VCC_q};
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add_x_o = $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add_x_a) + $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add_x_b);
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add_x_o[2:0];

    // rightShiftStageSel0Dto0_uid445_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_bit_select_merged(BITSELECT,518)@14
    assign rightShiftStageSel0Dto0_uid445_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_bit_select_merged_b = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add_x_q[1:0];
    assign rightShiftStageSel0Dto0_uid445_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_bit_select_merged_c = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add_x_q[2:2];

    // rightShiftStage0_uid446_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x(MUX,445)@14 + 1
    assign rightShiftStage0_uid446_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_s = rightShiftStageSel0Dto0_uid445_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_bit_select_merged_b;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (rightShiftStage0_uid446_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_s)
                2'b00 : rightShiftStage0_uid446_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q <= prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Mult_x_cma_q;
                2'b01 : rightShiftStage0_uid446_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q <= rightShiftStage0Idx1_uid438_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q;
                2'b10 : rightShiftStage0_uid446_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q <= rightShiftStage0Idx2_uid441_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q;
                2'b11 : rightShiftStage0_uid446_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q <= rightShiftStage0Idx3_uid444_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q;
                default : rightShiftStage0_uid446_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q <= 16'b0;
            endcase
        end
    end

    // redist0_rightShiftStageSel0Dto0_uid445_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_bit_select_merged_c_1(DELAY,528)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_rightShiftStageSel0Dto0_uid445_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_bit_select_merged_c_1_q <= $unsigned(rightShiftStageSel0Dto0_uid445_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_bit_select_merged_c);
        end
    end

    // rightShiftStage1_uid451_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x(MUX,450)@15
    assign rightShiftStage1_uid451_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_s = redist0_rightShiftStageSel0Dto0_uid445_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_bit_select_merged_c_1_q;
    always @(rightShiftStage1_uid451_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_s or rightShiftStage0_uid446_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q or rightShiftStage1Idx1_uid449_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q)
    begin
        unique case (rightShiftStage1_uid451_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_s)
            1'b0 : rightShiftStage1_uid451_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q = rightShiftStage0_uid446_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q;
            1'b1 : rightShiftStage1_uid451_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q = rightShiftStage1Idx1_uid449_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q;
            default : rightShiftStage1_uid451_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q = 16'b0;
        endcase
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add1_x(ADD,102)@15 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add1_x_a = rightShiftStage1_uid451_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Shift_x_q;
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add1_x_b = {8'b00000000, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_x16_PostCast_primWireOut_sel_x_b};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add1_x_o <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add1_x_a) + $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add1_x_b);
        end
    end
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add1_x_q = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add1_x_o[15:0];

    // Add2(ADD,40)@16 + 1
    assign Add2_a = {7'b0000000, prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_CPLenDecode_Add1_x_q};
    assign Add2_b = {1'b0, Add1_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Add2_o <= $unsigned(Add2_a) + $unsigned(Add2_b);
        end
    end
    assign Add2_q = Add2_o[22:0];

    // redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_offset(CONSTANT,569)
    assign redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_offset_q = $unsigned(5'b10001);

    // redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_rdcnt(ADD,578)
    assign redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_rdcnt_a = {1'b0, redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_wraddr_q};
    assign redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_rdcnt_b = {1'b0, redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_rdcnt_o <= $unsigned(redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_rdcnt_a) + $unsigned(redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_rdcnt_b);
        end
    end
    assign redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_rdcnt_q = redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_rdcnt_o[5:0];

    // redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_wraddr(COUNTER,576)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_wraddr_i <= $unsigned(redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_wraddr_q = redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_wraddr_i[4:0];

    // redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem(DUALMEM,575)
    assign redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_ia = $unsigned(in_1_imag_din_tpl);
    assign redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_aa = redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_wraddr_q;
    assign redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_ab = redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_rdcnt_q[4:0];
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
    ) redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_aa),
        .data_a(redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_ab),
        .q_b(redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_iq),
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
    assign redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_q = redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_iq[15:0];

    // redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_rdcnt(ADD,574)
    assign redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_rdcnt_a = {1'b0, redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_wraddr_q};
    assign redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_rdcnt_b = {1'b0, redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_rdcnt_o <= $unsigned(redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_rdcnt_a) + $unsigned(redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_rdcnt_b);
        end
    end
    assign redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_rdcnt_q = redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_rdcnt_o[5:0];

    // redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_wraddr(COUNTER,572)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_wraddr_i <= $unsigned(redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_wraddr_q = redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_wraddr_i[4:0];

    // redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem(DUALMEM,571)
    assign redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_ia = $unsigned(in_1_real_din_tpl);
    assign redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_aa = redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_wraddr_q;
    assign redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_ab = redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_rdcnt_q[4:0];
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
    ) redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_aa),
        .data_a(redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_ab),
        .q_b(redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_iq),
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
    assign redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_q = redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_iq[15:0];

    // redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_rdcnt(ADD,570)
    assign redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_rdcnt_a = {1'b0, redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_wraddr_q};
    assign redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_rdcnt_b = {1'b0, redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_rdcnt_o <= $unsigned(redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_rdcnt_a) + $unsigned(redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_rdcnt_b);
        end
    end
    assign redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_rdcnt_q = redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_rdcnt_o[5:0];

    // redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_wraddr(COUNTER,568)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_wraddr_i <= $unsigned(redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_wraddr_q = redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_wraddr_i[4:0];

    // redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem(DUALMEM,567)
    assign redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_ia = $unsigned(in_3_chin_tpl);
    assign redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_aa = redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_wraddr_q;
    assign redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_ab = redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_rdcnt_q[4:0];
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
    ) redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_aa),
        .data_a(redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_ab),
        .q_b(redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_iq),
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
    assign redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_q = redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_iq[7:0];

    // redist32_And2_q_1(DELAY,560)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist32_And2_q_1_q <= '0;
        end
        else
        begin
            redist32_And2_q_1_q <= $unsigned(And2_q);
        end
    end

    // ChannelOu3t_cunroll_x(PORTOUT,78)@17 + 1
    assign out_2_vout_tpl = redist32_And2_q_1_q;
    assign out_3_cout_tpl = redist18_ChannelI3n_cunroll_x_in_3_chin_tpl_18_mem_q;
    assign out_1_real_dout_tpl = redist19_ChannelI3n_cunroll_x_in_1_real_din_tpl_18_mem_q;
    assign out_1_imag_dout_tpl = redist20_ChannelI3n_cunroll_x_in_1_imag_din_tpl_18_mem_q;
    assign out_4_CPLen_tpl = Add2_q;
    assign out_5_FFTSize_tpl = redist13_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_FFTSizeDecode_Sub1_PostCast_primWireOut_sel_x_b_10_q;
    assign out_6_NFFTs_tpl = redist4_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_NumberOfFFTDecode_Select_x_opt_lev1_id0_q_10_q;
    assign out_7_SOP_tpl = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_SRlatch_PS_Or_x_q;
    assign out_8_qBWby10_tpl = redist29_ChannelI3n_cunroll_x_in_7_BWby10_tpl_17_mem_q;
    assign out_9_TimeReference_tpl = BitCombine_q;

endmodule
