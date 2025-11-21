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

// SystemVerilog created from ddc_model_DUT_DUT_DDC_l1_x_HB1
// SystemVerilog created on Thu Jan  9 15:36:33 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ddc_model_DUT_DUT_DDC_l1_x_HB1 (
    output wire [15:0] out_1_imag_q_tpl,
    output wire [15:0] out_1_real_q_tpl,
    output wire [0:0] out_2_qv_tpl,
    output wire [7:0] out_3_qc_tpl,
    input wire [15:0] in_1_0_imag_d_tpl,
    input wire [15:0] in_1_0_real_d_tpl,
    input wire [15:0] in_1_1_imag_d_tpl,
    input wire [15:0] in_1_1_real_d_tpl,
    input wire [0:0] in_2_v_tpl,
    input wire [7:0] in_3_c_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [38:0] HB1_im_xOut_0;
    wire [0:0] HB1_im_xOut_v;
    wire [7:0] HB1_im_xOut_c;
    wire [38:0] HB1_re_xOut_0;
    wire [0:0] HB1_re_xOut_v;
    wire [7:0] HB1_re_xOut_c;
    wire [15:0] scale_HB1_im_qOut_0;
    wire [15:0] scale_HB1_re_qOut_0;
    wire [0:0] scale_HB1_re_qOut_v;
    wire [7:0] scale_HB1_re_qOut_c;

    import ddc_model_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // HB1_im(BLACKBOX,2)
    ddc_model_DUT_DUT_DDC_l1_x_HB1_HB1_im theHB1_im (
        .xIn_0(in_1_0_imag_d_tpl),
        .xIn_1(in_1_1_imag_d_tpl),
        .xIn_v(in_2_v_tpl),
        .xIn_c(in_3_c_tpl),
        .xOut_0(HB1_im_xOut_0),
        .xOut_v(HB1_im_xOut_v),
        .xOut_c(HB1_im_xOut_c),
        .clk(clk),
        .areset(areset)
    );

    // scale_HB1_im(BLACKBOX,6)
    ddc_model_DUT_DUT_DDC_l1_x_HB1_scale_HB1_im thescale_HB1_im (
        .xIn_0(HB1_im_xOut_0),
        .xIn_v(HB1_im_xOut_v),
        .xIn_c(HB1_im_xOut_c),
        .gain_i(GND_q),
        .qOut_0(scale_HB1_im_qOut_0),
        .qOut_v(),
        .qOut_c(),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_imag_q_tpl(GPOUT,8)
    assign out_1_imag_q_tpl = scale_HB1_im_qOut_0;

    // HB1_re(BLACKBOX,3)
    ddc_model_DUT_DUT_DDC_l1_x_HB1_HB1_re theHB1_re (
        .xIn_0(in_1_0_real_d_tpl),
        .xIn_1(in_1_1_real_d_tpl),
        .xIn_v(in_2_v_tpl),
        .xIn_c(in_3_c_tpl),
        .xOut_0(HB1_re_xOut_0),
        .xOut_v(HB1_re_xOut_v),
        .xOut_c(HB1_re_xOut_c),
        .clk(clk),
        .areset(areset)
    );

    // scale_HB1_re(BLACKBOX,7)
    ddc_model_DUT_DUT_DDC_l1_x_HB1_scale_HB1_re thescale_HB1_re (
        .xIn_0(HB1_re_xOut_0),
        .xIn_v(HB1_re_xOut_v),
        .xIn_c(HB1_re_xOut_c),
        .gain_i(GND_q),
        .qOut_0(scale_HB1_re_qOut_0),
        .qOut_v(scale_HB1_re_qOut_v),
        .qOut_c(scale_HB1_re_qOut_c),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_real_q_tpl(GPOUT,9)
    assign out_1_real_q_tpl = scale_HB1_re_qOut_0;

    // out_2_qv_tpl(GPOUT,10)
    assign out_2_qv_tpl = scale_HB1_re_qOut_v;

    // out_3_qc_tpl(GPOUT,11)
    assign out_3_qc_tpl = scale_HB1_re_qOut_c;

endmodule
