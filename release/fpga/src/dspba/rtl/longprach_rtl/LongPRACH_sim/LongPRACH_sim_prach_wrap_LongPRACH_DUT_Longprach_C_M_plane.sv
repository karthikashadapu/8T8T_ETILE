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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane (
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
    input wire [7:0] in_5_SubFrame_tpl,
    input wire [15:0] in_6_prach_cfg_idx_tpl,
    input wire [20:0] in_7_cp_len_tpl,
    input wire [20:0] in_8_offset_tpl,
    input wire [0:0] in_9_c_m_plane_sel_tpl,
    input wire [0:0] in_10_prach_tech_tpl,
    input wire [15:0] in_11_prach_sym_start_tpl,
    input wire [18:0] in_12_prach_sym_end_tpl,
    input wire [6:0] in_13_prach_out_start_tpl,
    input wire [9:0] in_14_prach_out_end_tpl,
    input wire [0:0] in_15_filt_flush_en_tpl,
    input wire [3:0] in_16_start_sym_tpl,
    input wire [7:0] in_17_SubFrame_cplane_tpl,
    input wire [15:0] in_18_gain_re_tpl,
    input wire [15:0] in_19_gain_im_tpl,
    input wire [15:0] in_20_ch0_info_tpl,
    input wire [15:0] in_21_ch1_info_tpl,
    input wire [15:0] in_22_ch2_info_tpl,
    input wire [15:0] in_23_ch3_info_tpl,
    input wire [11:0] in_24_RFN_cplane_tpl,
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
    wire [31:0] Const6_q;
    wire [31:0] LongPRACH_core_cunroll_x_busOut_readdata;
    wire [0:0] LongPRACH_core_cunroll_x_busOut_readdatavalid;
    wire [15:0] LongPRACH_core_cunroll_x_out_1_imag_dout_tpl;
    wire [15:0] LongPRACH_core_cunroll_x_out_1_real_dout_tpl;
    wire [0:0] LongPRACH_core_cunroll_x_out_2_vout_tpl;
    wire [7:0] LongPRACH_core_cunroll_x_out_3_cout_tpl;
    wire [31:0] LongPRACH_core_cunroll_x_out_4_TimeReference_tpl;
    wire [15:0] LongPRACH_core_cunroll_x_out_5_ch_info_tpl;
    wire [15:0] MUX_ConfigId_cunroll_x_out_1_imag_dout_tpl;
    wire [15:0] MUX_ConfigId_cunroll_x_out_1_real_dout_tpl;
    wire [0:0] MUX_ConfigId_cunroll_x_out_2_vout_tpl;
    wire [7:0] MUX_ConfigId_cunroll_x_out_3_cout_tpl;
    wire [31:0] MUX_ConfigId_cunroll_x_out_4_TimeReference_tpl;
    wire [21:0] MUX_ConfigId_cunroll_x_out_5_cp_start_tpl;
    wire [22:0] MUX_ConfigId_cunroll_x_out_6_gt_end_tpl;
    wire [6:0] MUX_ConfigId_cunroll_x_out_7_prach_outstart_tpl;
    wire [9:0] MUX_ConfigId_cunroll_x_out_8_prach_outend_tpl;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // MUX_ConfigId_cunroll_x(BLACKBOX,9)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId theMUX_ConfigId_cunroll_x (
        .in_1_imag_din0_tpl(in_3_imag_din0_tpl),
        .in_1_real_din0_tpl(in_3_real_din0_tpl),
        .in_2_vin0_tpl(in_1_vin0_tpl),
        .in_3_chin0_tpl(in_2_chin0_tpl),
        .in_4_SFN_tpl(in_4_RFN_tpl),
        .in_5_SubFrame_tpl(in_5_SubFrame_tpl),
        .in_6_prach_config_index_tpl(in_6_prach_cfg_idx_tpl),
        .in_7_cp_len_tpl(in_7_cp_len_tpl),
        .in_8_offset_tpl(in_8_offset_tpl),
        .in_9_c_m_plane_sel_tpl(in_9_c_m_plane_sel_tpl),
        .in_10_prach_tech_tpl(in_10_prach_tech_tpl),
        .in_11_prcah_sym_start_tpl(in_11_prach_sym_start_tpl),
        .in_12_prcah_sym_end_tpl(in_12_prach_sym_end_tpl),
        .in_13_prach_out_start_tpl(in_13_prach_out_start_tpl),
        .in_14_prach_out_end_tpl(in_14_prach_out_end_tpl),
        .in_15_start_sym_tpl(in_16_start_sym_tpl),
        .in_16_Subframe_cplane_tpl(in_17_SubFrame_cplane_tpl),
        .in_17_SFN_cplane_tpl(in_24_RFN_cplane_tpl),
        .out_1_imag_dout_tpl(MUX_ConfigId_cunroll_x_out_1_imag_dout_tpl),
        .out_1_real_dout_tpl(MUX_ConfigId_cunroll_x_out_1_real_dout_tpl),
        .out_2_vout_tpl(MUX_ConfigId_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(MUX_ConfigId_cunroll_x_out_3_cout_tpl),
        .out_4_TimeReference_tpl(MUX_ConfigId_cunroll_x_out_4_TimeReference_tpl),
        .out_5_cp_start_tpl(MUX_ConfigId_cunroll_x_out_5_cp_start_tpl),
        .out_6_gt_end_tpl(MUX_ConfigId_cunroll_x_out_6_gt_end_tpl),
        .out_7_prach_outstart_tpl(MUX_ConfigId_cunroll_x_out_7_prach_outstart_tpl),
        .out_8_prach_outend_tpl(MUX_ConfigId_cunroll_x_out_8_prach_outend_tpl),
        .clk(clk),
        .areset(areset)
    );

    // LongPRACH_core_cunroll_x(BLACKBOX,8)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core theLongPRACH_core_cunroll_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_1_imag_din_tpl(MUX_ConfigId_cunroll_x_out_1_imag_dout_tpl),
        .in_1_real_din_tpl(MUX_ConfigId_cunroll_x_out_1_real_dout_tpl),
        .in_2_vin_tpl(MUX_ConfigId_cunroll_x_out_2_vout_tpl),
        .in_3_cin_tpl(MUX_ConfigId_cunroll_x_out_3_cout_tpl),
        .in_4_TimeRef_tpl(MUX_ConfigId_cunroll_x_out_4_TimeReference_tpl),
        .in_5_cp_start_tpl(MUX_ConfigId_cunroll_x_out_5_cp_start_tpl),
        .in_6_gt_end_tpl(MUX_ConfigId_cunroll_x_out_6_gt_end_tpl),
        .in_7_prach_outstart_tpl(MUX_ConfigId_cunroll_x_out_7_prach_outstart_tpl),
        .in_8_prach_outend_tpl(MUX_ConfigId_cunroll_x_out_8_prach_outend_tpl),
        .in_9_filt_flush_en_tpl(in_15_filt_flush_en_tpl),
        .in_10_imag_gainin_tpl(in_19_gain_im_tpl),
        .in_10_real_gainin_tpl(in_18_gain_re_tpl),
        .in_11_ch0_info_tpl(in_20_ch0_info_tpl),
        .in_12_ch1_info_tpl(in_21_ch1_info_tpl),
        .in_13_ch2_info_tpl(in_22_ch2_info_tpl),
        .in_14_ch3_info_tpl(in_23_ch3_info_tpl),
        .busOut_readdata(LongPRACH_core_cunroll_x_busOut_readdata),
        .busOut_readdatavalid(LongPRACH_core_cunroll_x_busOut_readdatavalid),
        .out_1_imag_dout_tpl(LongPRACH_core_cunroll_x_out_1_imag_dout_tpl),
        .out_1_real_dout_tpl(LongPRACH_core_cunroll_x_out_1_real_dout_tpl),
        .out_2_vout_tpl(LongPRACH_core_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(LongPRACH_core_cunroll_x_out_3_cout_tpl),
        .out_4_TimeReference_tpl(LongPRACH_core_cunroll_x_out_4_TimeReference_tpl),
        .out_5_ch_info_tpl(LongPRACH_core_cunroll_x_out_5_ch_info_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // busOut(BUSOUT,4)
    assign busOut_readdatavalid = LongPRACH_core_cunroll_x_busOut_readdatavalid;
    assign busOut_readdata = LongPRACH_core_cunroll_x_busOut_readdata;

    // out_1_imag_dout_tpl(GPOUT,35)
    assign out_1_imag_dout_tpl = LongPRACH_core_cunroll_x_out_1_imag_dout_tpl;

    // out_1_real_dout_tpl(GPOUT,36)
    assign out_1_real_dout_tpl = LongPRACH_core_cunroll_x_out_1_real_dout_tpl;

    // out_2_vout_tpl(GPOUT,37)
    assign out_2_vout_tpl = LongPRACH_core_cunroll_x_out_2_vout_tpl;

    // out_3_cout_tpl(GPOUT,38)
    assign out_3_cout_tpl = LongPRACH_core_cunroll_x_out_3_cout_tpl;

    // out_4_TimeReference_tpl(GPOUT,39)
    assign out_4_TimeReference_tpl = LongPRACH_core_cunroll_x_out_4_TimeReference_tpl;

    // Const6(CONSTANT,2)
    assign Const6_q = $unsigned(32'b00000000000000000000001000000001);

    // out_5_version_info_tpl(GPOUT,40)
    assign out_5_version_info_tpl = Const6_q;

    // out_6_ch_info_tpl(GPOUT,41)
    assign out_6_ch_info_tpl = LongPRACH_core_cunroll_x_out_5_ch_info_tpl;

endmodule
