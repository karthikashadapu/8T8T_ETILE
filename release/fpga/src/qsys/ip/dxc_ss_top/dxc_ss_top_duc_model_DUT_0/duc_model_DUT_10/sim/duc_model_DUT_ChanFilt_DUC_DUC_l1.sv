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

// SystemVerilog created from duc_model_DUT_ChanFilt_DUC_DUC_l1
// SystemVerilog created on Thu Jan  9 15:34:39 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module duc_model_DUT_ChanFilt_DUC_DUC_l1 (
    input wire [15:0] in_1_imag_a_tpl,
    input wire [15:0] in_1_real_a_tpl,
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

    wire [15:0] HB1_vunroll_cunroll_x_out_1_0_imag_q_tpl;
    wire [15:0] HB1_vunroll_cunroll_x_out_1_0_real_q_tpl;
    wire [15:0] HB1_vunroll_cunroll_x_out_1_1_imag_q_tpl;
    wire [15:0] HB1_vunroll_cunroll_x_out_1_1_real_q_tpl;
    wire [0:0] HB1_vunroll_cunroll_x_out_2_qv_tpl;
    wire [7:0] HB1_vunroll_cunroll_x_out_3_qc_tpl;
    wire [15:0] HB2_vunroll_cunroll_x_out_1_0_imag_q_tpl;
    wire [15:0] HB2_vunroll_cunroll_x_out_1_0_real_q_tpl;
    wire [15:0] HB2_vunroll_cunroll_x_out_1_1_imag_q_tpl;
    wire [15:0] HB2_vunroll_cunroll_x_out_1_1_real_q_tpl;
    wire [15:0] HB2_vunroll_cunroll_x_out_1_2_imag_q_tpl;
    wire [15:0] HB2_vunroll_cunroll_x_out_1_2_real_q_tpl;
    wire [15:0] HB2_vunroll_cunroll_x_out_1_3_imag_q_tpl;
    wire [15:0] HB2_vunroll_cunroll_x_out_1_3_real_q_tpl;
    wire [0:0] HB2_vunroll_cunroll_x_out_2_qv_tpl;
    wire [7:0] HB2_vunroll_cunroll_x_out_3_qc_tpl;

    import duc_model_DUT_safe_path_ver::safe_path_ver;

    // HB1_vunroll_cunroll_x(BLACKBOX,2)
    duc_model_DUT_ChanFilt_DUC_DUC_l1_HB1 theHB1_vunroll_cunroll_x (
        .in_1_imag_a_tpl(in_1_imag_a_tpl),
        .in_1_real_a_tpl(in_1_real_a_tpl),
        .in_2_v_tpl(in_2_v_tpl),
        .in_3_c_tpl(in_3_c_tpl),
        .out_1_0_imag_q_tpl(HB1_vunroll_cunroll_x_out_1_0_imag_q_tpl),
        .out_1_0_real_q_tpl(HB1_vunroll_cunroll_x_out_1_0_real_q_tpl),
        .out_1_1_imag_q_tpl(HB1_vunroll_cunroll_x_out_1_1_imag_q_tpl),
        .out_1_1_real_q_tpl(HB1_vunroll_cunroll_x_out_1_1_real_q_tpl),
        .out_2_qv_tpl(HB1_vunroll_cunroll_x_out_2_qv_tpl),
        .out_3_qc_tpl(HB1_vunroll_cunroll_x_out_3_qc_tpl),
        .clk(clk),
        .areset(areset)
    );

    // HB2_vunroll_cunroll_x(BLACKBOX,3)
    duc_model_DUT_ChanFilt_DUC_DUC_l1_HB2 theHB2_vunroll_cunroll_x (
        .in_1_0_imag_a_tpl(HB1_vunroll_cunroll_x_out_1_0_imag_q_tpl),
        .in_1_0_real_a_tpl(HB1_vunroll_cunroll_x_out_1_0_real_q_tpl),
        .in_1_1_imag_a_tpl(HB1_vunroll_cunroll_x_out_1_1_imag_q_tpl),
        .in_1_1_real_a_tpl(HB1_vunroll_cunroll_x_out_1_1_real_q_tpl),
        .in_2_v_tpl(HB1_vunroll_cunroll_x_out_2_qv_tpl),
        .in_3_c_tpl(HB1_vunroll_cunroll_x_out_3_qc_tpl),
        .out_1_0_imag_q_tpl(HB2_vunroll_cunroll_x_out_1_0_imag_q_tpl),
        .out_1_0_real_q_tpl(HB2_vunroll_cunroll_x_out_1_0_real_q_tpl),
        .out_1_1_imag_q_tpl(HB2_vunroll_cunroll_x_out_1_1_imag_q_tpl),
        .out_1_1_real_q_tpl(HB2_vunroll_cunroll_x_out_1_1_real_q_tpl),
        .out_1_2_imag_q_tpl(HB2_vunroll_cunroll_x_out_1_2_imag_q_tpl),
        .out_1_2_real_q_tpl(HB2_vunroll_cunroll_x_out_1_2_real_q_tpl),
        .out_1_3_imag_q_tpl(HB2_vunroll_cunroll_x_out_1_3_imag_q_tpl),
        .out_1_3_real_q_tpl(HB2_vunroll_cunroll_x_out_1_3_real_q_tpl),
        .out_2_qv_tpl(HB2_vunroll_cunroll_x_out_2_qv_tpl),
        .out_3_qc_tpl(HB2_vunroll_cunroll_x_out_3_qc_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_1_0_imag_q_tpl(GPOUT,8)
    assign out_1_0_imag_q_tpl = HB2_vunroll_cunroll_x_out_1_0_imag_q_tpl;

    // out_1_0_real_q_tpl(GPOUT,9)
    assign out_1_0_real_q_tpl = HB2_vunroll_cunroll_x_out_1_0_real_q_tpl;

    // out_1_1_imag_q_tpl(GPOUT,10)
    assign out_1_1_imag_q_tpl = HB2_vunroll_cunroll_x_out_1_1_imag_q_tpl;

    // out_1_1_real_q_tpl(GPOUT,11)
    assign out_1_1_real_q_tpl = HB2_vunroll_cunroll_x_out_1_1_real_q_tpl;

    // out_1_2_imag_q_tpl(GPOUT,12)
    assign out_1_2_imag_q_tpl = HB2_vunroll_cunroll_x_out_1_2_imag_q_tpl;

    // out_1_2_real_q_tpl(GPOUT,13)
    assign out_1_2_real_q_tpl = HB2_vunroll_cunroll_x_out_1_2_real_q_tpl;

    // out_1_3_imag_q_tpl(GPOUT,14)
    assign out_1_3_imag_q_tpl = HB2_vunroll_cunroll_x_out_1_3_imag_q_tpl;

    // out_1_3_real_q_tpl(GPOUT,15)
    assign out_1_3_real_q_tpl = HB2_vunroll_cunroll_x_out_1_3_real_q_tpl;

    // out_2_qv_tpl(GPOUT,16)
    assign out_2_qv_tpl = HB2_vunroll_cunroll_x_out_2_qv_tpl;

    // out_3_qc_tpl(GPOUT,17)
    assign out_3_qc_tpl = HB2_vunroll_cunroll_x_out_3_qc_tpl;

endmodule
