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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer (
    input wire [15:0] in_1_imag_din1_tpl,
    input wire [15:0] in_1_real_din1_tpl,
    input wire [0:0] in_2_vin_tpl,
    input wire [7:0] in_3_cin_tpl,
    input wire [17:0] in_4_sin_tpl,
    input wire [17:0] in_5_cos_tpl,
    output wire [15:0] out_1_imag_dout1_tpl,
    output wire [15:0] out_1_real_dout1_tpl,
    output wire [0:0] out_2_vout_tpl,
    output wire [7:0] out_3_cout_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [34:0] ComplexMixer_iOut_0;
    wire [34:0] ComplexMixer_qOut_0;
    wire [0:0] ComplexMixer_Out_v;
    wire [7:0] ComplexMixer_Out_c;
    wire [15:0] Scalei_qOut_0;
    wire [0:0] Scalei_qOut_v;
    wire [7:0] Scalei_qOut_c;
    wire [15:0] Scaleq_qOut_0;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // ComplexMixer(BLACKBOX,2)
    streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer theComplexMixer (
        .iIn_0(in_1_real_din1_tpl),
        .qIn_0(in_1_imag_din1_tpl),
        .In_v(in_2_vin_tpl),
        .In_c(in_3_cin_tpl),
        .sIn_0(in_4_sin_tpl),
        .cIn_0(in_5_cos_tpl),
        .iOut_0(ComplexMixer_iOut_0),
        .qOut_0(ComplexMixer_qOut_0),
        .Out_v(ComplexMixer_Out_v),
        .Out_c(ComplexMixer_Out_c),
        .clk(clk),
        .areset(areset)
    );

    // Scaleq(BLACKBOX,5)
    streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_Scaleq theScaleq (
        .xIn_0(ComplexMixer_qOut_0),
        .xIn_v(ComplexMixer_Out_v),
        .xIn_c(ComplexMixer_Out_c),
        .gain_i(VCC_q),
        .qOut_0(Scaleq_qOut_0),
        .qOut_v(),
        .qOut_c(),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_imag_dout1_tpl(GPOUT,12)
    assign out_1_imag_dout1_tpl = Scaleq_qOut_0;

    // Scalei(BLACKBOX,4)
    streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_Scalei theScalei (
        .xIn_0(ComplexMixer_iOut_0),
        .xIn_v(ComplexMixer_Out_v),
        .xIn_c(ComplexMixer_Out_c),
        .gain_i(VCC_q),
        .qOut_0(Scalei_qOut_0),
        .qOut_v(Scalei_qOut_v),
        .qOut_c(Scalei_qOut_c),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_real_dout1_tpl(GPOUT,13)
    assign out_1_real_dout1_tpl = Scalei_qOut_0;

    // out_2_vout_tpl(GPOUT,14)
    assign out_2_vout_tpl = Scalei_qOut_v;

    // out_3_cout_tpl(GPOUT,15)
    assign out_3_cout_tpl = Scalei_qOut_c;

endmodule
