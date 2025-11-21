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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage3_Filt_DEC_by_2_stage3
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000Filt_DEC_by_2_stage3 (
    input wire [15:0] in_1_imag_din_tpl,
    input wire [15:0] in_1_real_din_tpl,
    input wire [0:0] in_2_vin_tpl,
    input wire [7:0] in_3_cin_tpl,
    output wire [15:0] out_1_imag_dout_tpl,
    output wire [15:0] out_1_real_dout_tpl,
    output wire [0:0] out_2_vout_tpl,
    output wire [7:0] out_3_cout_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [35:0] DecimatingFIR_xOut_0;
    wire [0:0] DecimatingFIR_xOut_v;
    wire [7:0] DecimatingFIR_xOut_c;
    wire [35:0] DecimatingFIR1_xOut_0;
    wire [0:0] DecimatingFIR1_xOut_v;
    wire [7:0] DecimatingFIR1_xOut_c;
    wire [15:0] Scale_qOut_0;
    wire [0:0] Scale_qOut_v;
    wire [7:0] Scale_qOut_c;
    wire [15:0] Scale1_qOut_0;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // DecimatingFIR1(BLACKBOX,5)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000tage3_DecimatingFIR1 theDecimatingFIR1 (
        .xIn_0(in_1_imag_din_tpl),
        .xIn_v(in_2_vin_tpl),
        .xIn_c(in_3_cin_tpl),
        .xOut_0(DecimatingFIR1_xOut_0),
        .xOut_v(DecimatingFIR1_xOut_v),
        .xOut_c(DecimatingFIR1_xOut_c),
        .clk(clk),
        .areset(areset)
    );

    // Scale1(BLACKBOX,7)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000C_by_2_stage3_Scale1 theScale1 (
        .xIn_0(DecimatingFIR1_xOut_0),
        .xIn_v(DecimatingFIR1_xOut_v),
        .xIn_c(DecimatingFIR1_xOut_c),
        .gain_i(VCC_q),
        .qOut_0(Scale1_qOut_0),
        .qOut_v(),
        .qOut_c(),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_imag_dout_tpl(GPOUT,12)
    assign out_1_imag_dout_tpl = Scale1_qOut_0;

    // DecimatingFIR(BLACKBOX,4)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000stage3_DecimatingFIR theDecimatingFIR (
        .xIn_0(in_1_real_din_tpl),
        .xIn_v(in_2_vin_tpl),
        .xIn_c(in_3_cin_tpl),
        .xOut_0(DecimatingFIR_xOut_0),
        .xOut_v(DecimatingFIR_xOut_v),
        .xOut_c(DecimatingFIR_xOut_c),
        .clk(clk),
        .areset(areset)
    );

    // Scale(BLACKBOX,6)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000EC_by_2_stage3_Scale theScale (
        .xIn_0(DecimatingFIR_xOut_0),
        .xIn_v(DecimatingFIR_xOut_v),
        .xIn_c(DecimatingFIR_xOut_c),
        .gain_i(VCC_q),
        .qOut_0(Scale_qOut_0),
        .qOut_v(Scale_qOut_v),
        .qOut_c(Scale_qOut_c),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_real_dout_tpl(GPOUT,13)
    assign out_1_real_dout_tpl = Scale_qOut_0;

    // out_2_vout_tpl(GPOUT,14)
    assign out_2_vout_tpl = Scale_qOut_v;

    // out_3_cout_tpl(GPOUT,15)
    assign out_3_cout_tpl = Scale_qOut_c;

endmodule
