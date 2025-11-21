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

// SystemVerilog created from dec_dly_comp_DUT_DUT_Polyphase_Decimator
// SystemVerilog created on Tue Jan  7 17:06:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module dec_dly_comp_DUT_DUT_Polyphase_Decimator (
    input wire [15:0] in_1_0_imag_d_tpl,
    input wire [15:0] in_1_0_real_d_tpl,
    input wire [15:0] in_1_1_imag_d_tpl,
    input wire [15:0] in_1_1_real_d_tpl,
    input wire [15:0] in_1_2_imag_d_tpl,
    input wire [15:0] in_1_2_real_d_tpl,
    input wire [15:0] in_1_3_imag_d_tpl,
    input wire [15:0] in_1_3_real_d_tpl,
    input wire [15:0] in_1_4_imag_d_tpl,
    input wire [15:0] in_1_4_real_d_tpl,
    input wire [15:0] in_1_5_imag_d_tpl,
    input wire [15:0] in_1_5_real_d_tpl,
    input wire [15:0] in_1_6_imag_d_tpl,
    input wire [15:0] in_1_6_real_d_tpl,
    input wire [15:0] in_1_7_imag_d_tpl,
    input wire [15:0] in_1_7_real_d_tpl,
    input wire [0:0] in_2_v_tpl,
    input wire [7:0] in_3_c_tpl,
    output wire [15:0] out_1_0_imag_q_tpl,
    output wire [15:0] out_1_0_real_q_tpl,
    output wire [15:0] out_1_1_imag_q_tpl,
    output wire [15:0] out_1_1_real_q_tpl,
    output wire [15:0] out_1_2_imag_q_tpl,
    output wire [15:0] out_1_2_real_q_tpl,
    output wire [15:0] out_1_3_imag_q_tpl,
    output wire [15:0] out_1_3_real_q_tpl,
    output wire [0:0] out_2_qv_tpl,
    output wire [7:0] out_3_qc_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [38:0] HB3_im_xOut_0;
    wire [38:0] HB3_im_xOut_1;
    wire [38:0] HB3_im_xOut_2;
    wire [38:0] HB3_im_xOut_3;
    wire [0:0] HB3_im_xOut_v;
    wire [7:0] HB3_im_xOut_c;
    wire [38:0] HB3_re_xOut_0;
    wire [38:0] HB3_re_xOut_1;
    wire [38:0] HB3_re_xOut_2;
    wire [38:0] HB3_re_xOut_3;
    wire [0:0] HB3_re_xOut_v;
    wire [7:0] HB3_re_xOut_c;
    wire [15:0] scale_HB3_im_qOut_0;
    wire [15:0] scale_HB3_im_qOut_1;
    wire [15:0] scale_HB3_im_qOut_2;
    wire [15:0] scale_HB3_im_qOut_3;
    wire [15:0] scale_HB3_re_qOut_0;
    wire [15:0] scale_HB3_re_qOut_1;
    wire [15:0] scale_HB3_re_qOut_2;
    wire [15:0] scale_HB3_re_qOut_3;
    wire [0:0] scale_HB3_re_qOut_v;
    wire [7:0] scale_HB3_re_qOut_c;

    import dec_dly_comp_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // HB3_im(BLACKBOX,2)
    dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_im theHB3_im (
        .xIn_0(in_1_0_imag_d_tpl),
        .xIn_1(in_1_1_imag_d_tpl),
        .xIn_2(in_1_2_imag_d_tpl),
        .xIn_3(in_1_3_imag_d_tpl),
        .xIn_4(in_1_4_imag_d_tpl),
        .xIn_5(in_1_5_imag_d_tpl),
        .xIn_6(in_1_6_imag_d_tpl),
        .xIn_7(in_1_7_imag_d_tpl),
        .xIn_v(in_2_v_tpl),
        .xIn_c(in_3_c_tpl),
        .xOut_0(HB3_im_xOut_0),
        .xOut_1(HB3_im_xOut_1),
        .xOut_2(HB3_im_xOut_2),
        .xOut_3(HB3_im_xOut_3),
        .xOut_v(HB3_im_xOut_v),
        .xOut_c(HB3_im_xOut_c),
        .clk(clk),
        .areset(areset)
    );

    // scale_HB3_im(BLACKBOX,6)
    dec_dly_comp_DUT_DUT_Polyphase_Decimator_scale_HB3_im thescale_HB3_im (
        .xIn_0(HB3_im_xOut_0),
        .xIn_1(HB3_im_xOut_1),
        .xIn_2(HB3_im_xOut_2),
        .xIn_3(HB3_im_xOut_3),
        .xIn_v(HB3_im_xOut_v),
        .xIn_c(HB3_im_xOut_c),
        .gain_i(GND_q),
        .qOut_0(scale_HB3_im_qOut_0),
        .qOut_1(scale_HB3_im_qOut_1),
        .qOut_2(scale_HB3_im_qOut_2),
        .qOut_3(scale_HB3_im_qOut_3),
        .qOut_v(),
        .qOut_c(),
        .eOut_0(),
        .eOut_1(),
        .eOut_2(),
        .eOut_3(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_0_imag_q_tpl(GPOUT,26)
    assign out_1_0_imag_q_tpl = scale_HB3_im_qOut_0;

    // HB3_re(BLACKBOX,3)
    dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re theHB3_re (
        .xIn_0(in_1_0_real_d_tpl),
        .xIn_1(in_1_1_real_d_tpl),
        .xIn_2(in_1_2_real_d_tpl),
        .xIn_3(in_1_3_real_d_tpl),
        .xIn_4(in_1_4_real_d_tpl),
        .xIn_5(in_1_5_real_d_tpl),
        .xIn_6(in_1_6_real_d_tpl),
        .xIn_7(in_1_7_real_d_tpl),
        .xIn_v(in_2_v_tpl),
        .xIn_c(in_3_c_tpl),
        .xOut_0(HB3_re_xOut_0),
        .xOut_1(HB3_re_xOut_1),
        .xOut_2(HB3_re_xOut_2),
        .xOut_3(HB3_re_xOut_3),
        .xOut_v(HB3_re_xOut_v),
        .xOut_c(HB3_re_xOut_c),
        .clk(clk),
        .areset(areset)
    );

    // scale_HB3_re(BLACKBOX,7)
    dec_dly_comp_DUT_DUT_Polyphase_Decimator_scale_HB3_re thescale_HB3_re (
        .xIn_0(HB3_re_xOut_0),
        .xIn_1(HB3_re_xOut_1),
        .xIn_2(HB3_re_xOut_2),
        .xIn_3(HB3_re_xOut_3),
        .xIn_v(HB3_re_xOut_v),
        .xIn_c(HB3_re_xOut_c),
        .gain_i(GND_q),
        .qOut_0(scale_HB3_re_qOut_0),
        .qOut_1(scale_HB3_re_qOut_1),
        .qOut_2(scale_HB3_re_qOut_2),
        .qOut_3(scale_HB3_re_qOut_3),
        .qOut_v(scale_HB3_re_qOut_v),
        .qOut_c(scale_HB3_re_qOut_c),
        .eOut_0(),
        .eOut_1(),
        .eOut_2(),
        .eOut_3(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_0_real_q_tpl(GPOUT,27)
    assign out_1_0_real_q_tpl = scale_HB3_re_qOut_0;

    // out_1_1_imag_q_tpl(GPOUT,28)
    assign out_1_1_imag_q_tpl = scale_HB3_im_qOut_1;

    // out_1_1_real_q_tpl(GPOUT,29)
    assign out_1_1_real_q_tpl = scale_HB3_re_qOut_1;

    // out_1_2_imag_q_tpl(GPOUT,30)
    assign out_1_2_imag_q_tpl = scale_HB3_im_qOut_2;

    // out_1_2_real_q_tpl(GPOUT,31)
    assign out_1_2_real_q_tpl = scale_HB3_re_qOut_2;

    // out_1_3_imag_q_tpl(GPOUT,32)
    assign out_1_3_imag_q_tpl = scale_HB3_im_qOut_3;

    // out_1_3_real_q_tpl(GPOUT,33)
    assign out_1_3_real_q_tpl = scale_HB3_re_qOut_3;

    // out_2_qv_tpl(GPOUT,34)
    assign out_2_qv_tpl = scale_HB3_re_qOut_v;

    // out_3_qc_tpl(GPOUT,35)
    assign out_3_qc_tpl = scale_HB3_re_qOut_c;

endmodule
