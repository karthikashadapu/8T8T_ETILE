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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage3
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage3 (
    input wire [15:0] in_1_imag_data_in_tpl,
    input wire [15:0] in_1_real_data_in_tpl,
    input wire [0:0] in_2_valid_in_tpl,
    input wire [7:0] in_3_ch_in_tpl,
    output wire [15:0] out_1_imag_data_out_tpl,
    output wire [15:0] out_1_real_data_out_tpl,
    output wire [0:0] out_2_valid_out_tpl,
    output wire [7:0] out_3_ch_out_tpl,
    input wire clk,
    input wire areset
    );

    wire [15:0] Filt_DEC_by_2_stage3_cunroll_x_out_1_imag_dout_tpl;
    wire [15:0] Filt_DEC_by_2_stage3_cunroll_x_out_1_real_dout_tpl;
    wire [0:0] Filt_DEC_by_2_stage3_cunroll_x_out_2_vout_tpl;
    wire [7:0] Filt_DEC_by_2_stage3_cunroll_x_out_3_cout_tpl;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // Filt_DEC_by_2_stage3_cunroll_x(BLACKBOX,2)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000Filt_DEC_by_2_stage3 theFilt_DEC_by_2_stage3_cunroll_x (
        .in_1_imag_din_tpl(in_1_imag_data_in_tpl),
        .in_1_real_din_tpl(in_1_real_data_in_tpl),
        .in_2_vin_tpl(in_2_valid_in_tpl),
        .in_3_cin_tpl(in_3_ch_in_tpl),
        .out_1_imag_dout_tpl(Filt_DEC_by_2_stage3_cunroll_x_out_1_imag_dout_tpl),
        .out_1_real_dout_tpl(Filt_DEC_by_2_stage3_cunroll_x_out_1_real_dout_tpl),
        .out_2_vout_tpl(Filt_DEC_by_2_stage3_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(Filt_DEC_by_2_stage3_cunroll_x_out_3_cout_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_1_imag_data_out_tpl(GPOUT,7)
    assign out_1_imag_data_out_tpl = Filt_DEC_by_2_stage3_cunroll_x_out_1_imag_dout_tpl;

    // out_1_real_data_out_tpl(GPOUT,8)
    assign out_1_real_data_out_tpl = Filt_DEC_by_2_stage3_cunroll_x_out_1_real_dout_tpl;

    // out_2_valid_out_tpl(GPOUT,9)
    assign out_2_valid_out_tpl = Filt_DEC_by_2_stage3_cunroll_x_out_2_vout_tpl;

    // out_3_ch_out_tpl(GPOUT,10)
    assign out_3_ch_out_tpl = Filt_DEC_by_2_stage3_cunroll_x_out_3_cout_tpl;

endmodule
