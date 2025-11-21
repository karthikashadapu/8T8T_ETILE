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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT (
    input wire [15:0] in_1_imag_din_tpl,
    input wire [15:0] in_1_real_din_tpl,
    input wire [0:0] in_2_vin_tpl,
    input wire [7:0] in_3_cin_tpl,
    input wire [0:0] in_4_resetin_tpl,
    input wire [15:0] in_5_imag_gainin_tpl,
    input wire [15:0] in_5_real_gainin_tpl,
    output wire [15:0] out_1_imag_dout_tpl,
    output wire [15:0] out_1_real_dout_tpl,
    output wire [0:0] out_2_vout_tpl,
    output wire [7:0] out_3_cout_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [15:0] Scale_qOut_0;
    wire [0:0] Scale_qOut_v;
    wire [7:0] Scale_qOut_c;
    wire [15:0] Scale1_qOut_0;
    wire [0:0] FFT1_cunroll_x_out_1_qv_tpl;
    wire [7:0] FFT1_cunroll_x_out_2_qc_tpl;
    wire [26:0] FFT1_cunroll_x_out_3_imag_q_tpl;
    wire [26:0] FFT1_cunroll_x_out_3_real_q_tpl;
    wire [15:0] S2B_cunroll_x_out_1_imag_data_out_tpl;
    wire [15:0] S2B_cunroll_x_out_1_real_data_out_tpl;
    wire [0:0] S2B_cunroll_x_out_2_valid_out_tpl;
    wire [7:0] S2B_cunroll_x_out_3_ch_no_tpl;
    wire [15:0] gain_cunroll_x_out_1_imag_data_out_tpl;
    wire [15:0] gain_cunroll_x_out_1_real_data_out_tpl;
    wire [0:0] gain_cunroll_x_out_2_valid_out_tpl;
    wire [7:0] gain_cunroll_x_out_3_ch_no_tpl;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // S2B_cunroll_x(BLACKBOX,6)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B theS2B_cunroll_x (
        .in_1_imag_data_in_tpl(in_1_imag_din_tpl),
        .in_1_real_data_in_tpl(in_1_real_din_tpl),
        .in_2_data_valid_tpl(in_2_vin_tpl),
        .in_3_chin_tpl(in_3_cin_tpl),
        .in_4_resetin_tpl(in_4_resetin_tpl),
        .out_1_imag_data_out_tpl(S2B_cunroll_x_out_1_imag_data_out_tpl),
        .out_1_real_data_out_tpl(S2B_cunroll_x_out_1_real_data_out_tpl),
        .out_2_valid_out_tpl(S2B_cunroll_x_out_2_valid_out_tpl),
        .out_3_ch_no_tpl(S2B_cunroll_x_out_3_ch_no_tpl),
        .clk(clk),
        .areset(areset)
    );

    // gain_cunroll_x(BLACKBOX,7)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_gain thegain_cunroll_x (
        .in_1_imag_data_in_tpl(S2B_cunroll_x_out_1_imag_data_out_tpl),
        .in_1_real_data_in_tpl(S2B_cunroll_x_out_1_real_data_out_tpl),
        .in_2_data_valid_tpl(S2B_cunroll_x_out_2_valid_out_tpl),
        .in_3_chin_tpl(S2B_cunroll_x_out_3_ch_no_tpl),
        .in_4_imag_gain_tpl(in_5_imag_gainin_tpl),
        .in_4_real_gain_tpl(in_5_real_gainin_tpl),
        .out_1_imag_data_out_tpl(gain_cunroll_x_out_1_imag_data_out_tpl),
        .out_1_real_data_out_tpl(gain_cunroll_x_out_1_real_data_out_tpl),
        .out_2_valid_out_tpl(gain_cunroll_x_out_2_valid_out_tpl),
        .out_3_ch_no_tpl(gain_cunroll_x_out_3_ch_no_tpl),
        .clk(clk),
        .areset(areset)
    );

    // FFT1_cunroll_x(BLACKBOX,5)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_FFT1 theFFT1_cunroll_x (
        .in_1_v_tpl(gain_cunroll_x_out_2_valid_out_tpl),
        .in_2_c_tpl(gain_cunroll_x_out_3_ch_no_tpl),
        .in_3_imag_d_tpl(gain_cunroll_x_out_1_imag_data_out_tpl),
        .in_3_real_d_tpl(gain_cunroll_x_out_1_real_data_out_tpl),
        .out_1_qv_tpl(FFT1_cunroll_x_out_1_qv_tpl),
        .out_2_qc_tpl(FFT1_cunroll_x_out_2_qc_tpl),
        .out_3_imag_q_tpl(FFT1_cunroll_x_out_3_imag_q_tpl),
        .out_3_real_q_tpl(FFT1_cunroll_x_out_3_real_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // Scale1(BLACKBOX,4)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_Scale1 theScale1 (
        .xIn_0(FFT1_cunroll_x_out_3_imag_q_tpl),
        .xIn_v(FFT1_cunroll_x_out_1_qv_tpl),
        .xIn_c(FFT1_cunroll_x_out_2_qc_tpl),
        .gain_i(VCC_q),
        .qOut_0(Scale1_qOut_0),
        .qOut_v(),
        .qOut_c(),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_imag_dout_tpl(GPOUT,15)
    assign out_1_imag_dout_tpl = Scale1_qOut_0;

    // Scale(BLACKBOX,3)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_Scale theScale (
        .xIn_0(FFT1_cunroll_x_out_3_real_q_tpl),
        .xIn_v(FFT1_cunroll_x_out_1_qv_tpl),
        .xIn_c(FFT1_cunroll_x_out_2_qc_tpl),
        .gain_i(VCC_q),
        .qOut_0(Scale_qOut_0),
        .qOut_v(Scale_qOut_v),
        .qOut_c(Scale_qOut_c),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_real_dout_tpl(GPOUT,16)
    assign out_1_real_dout_tpl = Scale_qOut_0;

    // out_2_vout_tpl(GPOUT,17)
    assign out_2_vout_tpl = Scale_qOut_v;

    // out_3_cout_tpl(GPOUT,18)
    assign out_3_cout_tpl = Scale_qOut_c;

endmodule
