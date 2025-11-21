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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT (
    input wire [31:0] busIn_writedata,
    input wire [1:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    input wire [0:0] in_1_vin0_tpl,
    input wire [7:0] in_2_chin0_tpl,
    input wire [15:0] in_3_imag_din0_tpl,
    input wire [15:0] in_3_real_din0_tpl,
    input wire [11:0] in_4_RFN_tpl,
    input wire [7:0] in_5_subframe_tpl,
    input wire [15:0] in_6_prach_cfg_idx_tpl,
    input wire [20:0] in_7_cp_len_tpl,
    input wire [20:0] in_8_offset_tpl,
    input wire [0:0] in_9_c_m_plane_sel_tpl,
    input wire [0:0] in_10_prach_tech_tpl,
    input wire [0:0] in_11_filt_flush_en_tpl,
    input wire [3:0] in_12_start_sym_tpl,
    input wire [7:0] in_13_SubFrame_cplane_tpl,
    input wire [15:0] in_14_gain_re_tpl,
    input wire [15:0] in_15_gain_im_tpl,
    input wire [15:0] in_16_ch0_info_tpl,
    input wire [15:0] in_17_ch1_info_tpl,
    input wire [15:0] in_18_ch2_info_tpl,
    input wire [15:0] in_19_ch3_info_tpl,
    input wire [11:0] in_20_RFN_cplane_tpl,
    output wire [15:0] out_1_imag_dout_tpl,
    output wire [15:0] out_1_real_dout_tpl,
    output wire [0:0] out_2_vout_tpl,
    output wire [7:0] out_3_cout_tpl,
    output wire [31:0] out_4_TimeReference_tpl,
    output wire [31:0] out_5_version_info_tpl,
    output wire [15:0] out_6_ch_info_tpl,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [6:0] Const10_q;
    wire [9:0] Const12_q;
    wire [15:0] Const2_q;
    wire [18:0] Const8_q;
    wire [31:0] Longprach_C_M_plane_cunroll_x_busOut_readdata;
    wire [0:0] Longprach_C_M_plane_cunroll_x_busOut_readdatavalid;
    wire [15:0] Longprach_C_M_plane_cunroll_x_out_1_imag_dout_tpl;
    wire [15:0] Longprach_C_M_plane_cunroll_x_out_1_real_dout_tpl;
    wire [0:0] Longprach_C_M_plane_cunroll_x_out_2_vout_tpl;
    wire [7:0] Longprach_C_M_plane_cunroll_x_out_3_cout_tpl;
    wire [31:0] Longprach_C_M_plane_cunroll_x_out_4_TimeReference_tpl;
    wire [31:0] Longprach_C_M_plane_cunroll_x_out_5_version_info_tpl;
    wire [15:0] Longprach_C_M_plane_cunroll_x_out_6_ch_info_tpl;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // Const12(CONSTANT,3)
    assign Const12_q = $unsigned(10'b1110100100);

    // Const10(CONSTANT,2)
    assign Const10_q = $unsigned(7'b1011101);

    // Const8(CONSTANT,5)
    assign Const8_q = $unsigned(19'b1101100011000000000);

    // Const2(CONSTANT,4)
    assign Const2_q = $unsigned(16'b1100011000000000);

    // Longprach_C_M_plane_cunroll_x(BLACKBOX,11)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane theLongprach_C_M_plane_cunroll_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_1_vin0_tpl(in_1_vin0_tpl),
        .in_2_chin0_tpl(in_2_chin0_tpl),
        .in_3_imag_din0_tpl(in_3_imag_din0_tpl),
        .in_3_real_din0_tpl(in_3_real_din0_tpl),
        .in_4_RFN_tpl(in_4_RFN_tpl),
        .in_5_SubFrame_tpl(in_5_subframe_tpl),
        .in_6_prach_cfg_idx_tpl(in_6_prach_cfg_idx_tpl),
        .in_7_cp_len_tpl(in_7_cp_len_tpl),
        .in_8_offset_tpl(in_8_offset_tpl),
        .in_9_c_m_plane_sel_tpl(in_9_c_m_plane_sel_tpl),
        .in_10_prach_tech_tpl(in_10_prach_tech_tpl),
        .in_11_prach_sym_start_tpl(Const2_q),
        .in_12_prach_sym_end_tpl(Const8_q),
        .in_13_prach_out_start_tpl(Const10_q),
        .in_14_prach_out_end_tpl(Const12_q),
        .in_15_filt_flush_en_tpl(in_11_filt_flush_en_tpl),
        .in_16_start_sym_tpl(in_12_start_sym_tpl),
        .in_17_SubFrame_cplane_tpl(in_13_SubFrame_cplane_tpl),
        .in_18_gain_re_tpl(in_14_gain_re_tpl),
        .in_19_gain_im_tpl(in_15_gain_im_tpl),
        .in_20_ch0_info_tpl(in_16_ch0_info_tpl),
        .in_21_ch1_info_tpl(in_17_ch1_info_tpl),
        .in_22_ch2_info_tpl(in_18_ch2_info_tpl),
        .in_23_ch3_info_tpl(in_19_ch3_info_tpl),
        .in_24_RFN_cplane_tpl(in_20_RFN_cplane_tpl),
        .busOut_readdata(Longprach_C_M_plane_cunroll_x_busOut_readdata),
        .busOut_readdatavalid(Longprach_C_M_plane_cunroll_x_busOut_readdatavalid),
        .out_1_imag_dout_tpl(Longprach_C_M_plane_cunroll_x_out_1_imag_dout_tpl),
        .out_1_real_dout_tpl(Longprach_C_M_plane_cunroll_x_out_1_real_dout_tpl),
        .out_2_vout_tpl(Longprach_C_M_plane_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(Longprach_C_M_plane_cunroll_x_out_3_cout_tpl),
        .out_4_TimeReference_tpl(Longprach_C_M_plane_cunroll_x_out_4_TimeReference_tpl),
        .out_5_version_info_tpl(Longprach_C_M_plane_cunroll_x_out_5_version_info_tpl),
        .out_6_ch_info_tpl(Longprach_C_M_plane_cunroll_x_out_6_ch_info_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // busOut(BUSOUT,7)
    assign busOut_readdatavalid = Longprach_C_M_plane_cunroll_x_busOut_readdatavalid;
    assign busOut_readdata = Longprach_C_M_plane_cunroll_x_busOut_readdata;

    // out_1_imag_dout_tpl(GPOUT,33)
    assign out_1_imag_dout_tpl = Longprach_C_M_plane_cunroll_x_out_1_imag_dout_tpl;

    // out_1_real_dout_tpl(GPOUT,34)
    assign out_1_real_dout_tpl = Longprach_C_M_plane_cunroll_x_out_1_real_dout_tpl;

    // out_2_vout_tpl(GPOUT,35)
    assign out_2_vout_tpl = Longprach_C_M_plane_cunroll_x_out_2_vout_tpl;

    // out_3_cout_tpl(GPOUT,36)
    assign out_3_cout_tpl = Longprach_C_M_plane_cunroll_x_out_3_cout_tpl;

    // out_4_TimeReference_tpl(GPOUT,37)
    assign out_4_TimeReference_tpl = Longprach_C_M_plane_cunroll_x_out_4_TimeReference_tpl;

    // out_5_version_info_tpl(GPOUT,38)
    assign out_5_version_info_tpl = Longprach_C_M_plane_cunroll_x_out_5_version_info_tpl;

    // out_6_ch_info_tpl(GPOUT,39)
    assign out_6_ch_info_tpl = Longprach_C_M_plane_cunroll_x_out_6_ch_info_tpl;

endmodule
