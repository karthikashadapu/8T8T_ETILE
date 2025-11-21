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

// SystemVerilog created from ifft_blocktostream_DUT_low_phy_dl
// SystemVerilog created on Thu Jun 12 21:17:49 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ifft_blocktostream_DUT_low_phy_dl (
    input wire [0:0] in_1_valid1_tpl,
    input wire [15:0] in_2_ifft_gain_re_l1_tpl,
    input wire [15:0] in_3_ifft_gain_im_l1_tpl,
    input wire [3:0] in_4_ifft_shift_l1_tpl,
    input wire [15:0] in_5_ifft_mux_const_l1_tpl,
    input wire [0:0] in_6_muxsel_l1_tpl,
    input wire [0:0] in_7_DC_SC_EN_tpl,
    input wire [15:0] in_8_imag_data1_tpl,
    input wire [15:0] in_8_real_data1_tpl,
    input wire [7:0] in_9_channel1_tpl,
    input wire [3:0] in_10_size1_tpl,
    input wire [11:0] in_11_nsc1_tpl,
    input wire [10:0] in_12_cplen1_tpl,
    input wire [0:0] in_13_CP_EN1_tpl,
    input wire [0:0] in_14_ripple_comp_en_tpl,
    input wire [0:0] in_15_rc_bw_sel_tpl,
    input wire [63:0] in_16_timeref_in_tpl,
    input wire [31:0] in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_RegField4_x_tpl,
    input wire [31:0] in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl,
    input wire [0:0] in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl,
    input wire [31:0] in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl,
    input wire [0:0] in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl,
    input wire [15:0] in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    input wire [15:0] in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    output wire [0:0] out_1_vout2_tpl,
    output wire [1:0] out_2_cout2_tpl,
    output wire [15:0] out_3_imag_dout2_tpl,
    output wire [15:0] out_3_real_dout2_tpl,
    output wire [15:0] out_4_imag_td_ifft_out_d_tpl,
    output wire [15:0] out_4_real_td_ifft_out_d_tpl,
    output wire [7:0] out_5_td_ifft_out_ch_tpl,
    output wire [0:0] out_6_td_ifft_out_v_tpl,
    output wire [3:0] out_7_ifft_size_out_tpl,
    output wire [11:0] out_8_ifft_nprb_out_tpl,
    output wire [10:0] out_9_ifft_cp_out_tpl,
    output wire [0:0] out_10_fd_data_v_tpl,
    output wire [7:0] out_11_fd_data_c_tpl,
    output wire [15:0] out_12_imag_fd_data_q_tpl,
    output wire [15:0] out_12_real_fd_data_q_tpl,
    output wire [63:0] out_13_fd_timeref_out_tpl,
    output wire [31:0] out_14_version_out_tpl,
    output wire [11:0] out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    output wire [11:0] out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    output wire [15:0] out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    output wire [15:0] out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [15:0] PhaseCompensation_lite_cunroll_x_out_1_imag_dout1_tpl;
    wire [15:0] PhaseCompensation_lite_cunroll_x_out_1_real_dout1_tpl;
    wire [0:0] PhaseCompensation_lite_cunroll_x_out_2_vout_tpl;
    wire [7:0] PhaseCompensation_lite_cunroll_x_out_3_cout_tpl;
    wire [3:0] PhaseCompensation_lite_cunroll_x_out_4_fft_size_out_tpl;
    wire [10:0] PhaseCompensation_lite_cunroll_x_out_5_CPLenout_tpl;
    wire [11:0] PhaseCompensation_lite_cunroll_x_out_6_nsc_out_tpl;
    wire [63:0] PhaseCompensation_lite_cunroll_x_out_9_timeref_out_tpl;
    wire [0:0] iFFT_B2S_cunroll_x_out_1_vout1_tpl;
    wire [1:0] iFFT_B2S_cunroll_x_out_2_cout1_tpl;
    wire [15:0] iFFT_B2S_cunroll_x_out_3_imag_dout1_tpl;
    wire [15:0] iFFT_B2S_cunroll_x_out_3_real_dout1_tpl;
    wire [15:0] iFFT_B2S_cunroll_x_out_4_imag_td_ifft_out_d_tpl;
    wire [15:0] iFFT_B2S_cunroll_x_out_4_real_td_ifft_out_d_tpl;
    wire [7:0] iFFT_B2S_cunroll_x_out_5_td_ifft_out_ch_tpl;
    wire [0:0] iFFT_B2S_cunroll_x_out_6_td_ifft_out_v_tpl;
    wire [3:0] iFFT_B2S_cunroll_x_out_7_ifft_size_out_tpl;
    wire [11:0] iFFT_B2S_cunroll_x_out_8_ifft_nprb_out_tpl;
    wire [10:0] iFFT_B2S_cunroll_x_out_9_ifft_cp_out_tpl;
    wire [0:0] iFFT_B2S_cunroll_x_out_10_fd_data_v_tpl;
    wire [7:0] iFFT_B2S_cunroll_x_out_11_fd_data_c_tpl;
    wire [15:0] iFFT_B2S_cunroll_x_out_12_imag_fd_data_q_tpl;
    wire [15:0] iFFT_B2S_cunroll_x_out_12_real_fd_data_q_tpl;
    wire [63:0] iFFT_B2S_cunroll_x_out_13_fd_time_out_tpl;
    wire [11:0] iFFT_B2S_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [11:0] iFFT_B2S_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    wire [15:0] iFFT_B2S_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [15:0] iFFT_B2S_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;

    import ifft_blocktostream_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // PhaseCompensation_lite_cunroll_x(BLACKBOX,3)
    ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite thePhaseCompensation_lite_cunroll_x (
        .in_1_v_tpl(in_1_valid1_tpl),
        .in_2_c_tpl(in_9_channel1_tpl),
        .in_3_imag_d1_tpl(in_8_imag_data1_tpl),
        .in_3_real_d1_tpl(in_8_real_data1_tpl),
        .in_4_CP_EN1_tpl(in_13_CP_EN1_tpl),
        .in_5_fft_size_tpl(in_10_size1_tpl),
        .in_6_CPLen_tpl(in_12_cplen1_tpl),
        .in_7_nsc_tpl(in_11_nsc1_tpl),
        .in_8_eAxC_tpl(GND_q),
        .in_9_sym_metadata_tpl(GND_q),
        .in_10_timerefin_tpl(in_16_timeref_in_tpl),
        .in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl(in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl),
        .in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl(in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl),
        .in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl(in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl),
        .in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl(in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl),
        .out_1_imag_dout1_tpl(PhaseCompensation_lite_cunroll_x_out_1_imag_dout1_tpl),
        .out_1_real_dout1_tpl(PhaseCompensation_lite_cunroll_x_out_1_real_dout1_tpl),
        .out_2_vout_tpl(PhaseCompensation_lite_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(PhaseCompensation_lite_cunroll_x_out_3_cout_tpl),
        .out_4_fft_size_out_tpl(PhaseCompensation_lite_cunroll_x_out_4_fft_size_out_tpl),
        .out_5_CPLenout_tpl(PhaseCompensation_lite_cunroll_x_out_5_CPLenout_tpl),
        .out_6_nsc_out_tpl(PhaseCompensation_lite_cunroll_x_out_6_nsc_out_tpl),
        .out_7_eAxCout_tpl(),
        .out_8_sym_metadataout_tpl(),
        .out_9_timeref_out_tpl(PhaseCompensation_lite_cunroll_x_out_9_timeref_out_tpl),
        .out_10_eop_eAxC_tpl(),
        .out_11_eop_sym_tpl(),
        .out_12_sop_eAxC_tpl(),
        .out_13_sop_sym_tpl(),
        .clk(clk),
        .areset(areset)
    );

    // iFFT_B2S_cunroll_x(BLACKBOX,5)
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S theiFFT_B2S_cunroll_x (
        .in_1_imag_data1_tpl(PhaseCompensation_lite_cunroll_x_out_1_imag_dout1_tpl),
        .in_1_real_data1_tpl(PhaseCompensation_lite_cunroll_x_out_1_real_dout1_tpl),
        .in_2_valid_tpl(PhaseCompensation_lite_cunroll_x_out_2_vout_tpl),
        .in_3_channel1_tpl(PhaseCompensation_lite_cunroll_x_out_3_cout_tpl),
        .in_4_size1_tpl(PhaseCompensation_lite_cunroll_x_out_4_fft_size_out_tpl),
        .in_5_cplen1_tpl(PhaseCompensation_lite_cunroll_x_out_5_CPLenout_tpl),
        .in_6_nsc1_tpl(PhaseCompensation_lite_cunroll_x_out_6_nsc_out_tpl),
        .in_7_ifft_gain_re_l1_tpl(in_2_ifft_gain_re_l1_tpl),
        .in_8_ifft_gain_im_l1_tpl(in_3_ifft_gain_im_l1_tpl),
        .in_9_ifft_shift_l1_tpl(in_4_ifft_shift_l1_tpl),
        .in_10_ifft_mux_const_l1_tpl(in_5_ifft_mux_const_l1_tpl),
        .in_11_muxsel_l1_tpl(in_6_muxsel_l1_tpl),
        .in_12_DC_SC_EN_tpl(in_7_DC_SC_EN_tpl),
        .in_13_ripple_comp_en_tpl(in_14_ripple_comp_en_tpl),
        .in_14_rc_bw_sel_tpl(in_15_rc_bw_sel_tpl),
        .in_15_time_in_tpl(PhaseCompensation_lite_cunroll_x_out_9_timeref_out_tpl),
        .in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .out_1_vout1_tpl(iFFT_B2S_cunroll_x_out_1_vout1_tpl),
        .out_2_cout1_tpl(iFFT_B2S_cunroll_x_out_2_cout1_tpl),
        .out_3_imag_dout1_tpl(iFFT_B2S_cunroll_x_out_3_imag_dout1_tpl),
        .out_3_real_dout1_tpl(iFFT_B2S_cunroll_x_out_3_real_dout1_tpl),
        .out_4_imag_td_ifft_out_d_tpl(iFFT_B2S_cunroll_x_out_4_imag_td_ifft_out_d_tpl),
        .out_4_real_td_ifft_out_d_tpl(iFFT_B2S_cunroll_x_out_4_real_td_ifft_out_d_tpl),
        .out_5_td_ifft_out_ch_tpl(iFFT_B2S_cunroll_x_out_5_td_ifft_out_ch_tpl),
        .out_6_td_ifft_out_v_tpl(iFFT_B2S_cunroll_x_out_6_td_ifft_out_v_tpl),
        .out_7_ifft_size_out_tpl(iFFT_B2S_cunroll_x_out_7_ifft_size_out_tpl),
        .out_8_ifft_nprb_out_tpl(iFFT_B2S_cunroll_x_out_8_ifft_nprb_out_tpl),
        .out_9_ifft_cp_out_tpl(iFFT_B2S_cunroll_x_out_9_ifft_cp_out_tpl),
        .out_10_fd_data_v_tpl(iFFT_B2S_cunroll_x_out_10_fd_data_v_tpl),
        .out_11_fd_data_c_tpl(iFFT_B2S_cunroll_x_out_11_fd_data_c_tpl),
        .out_12_imag_fd_data_q_tpl(iFFT_B2S_cunroll_x_out_12_imag_fd_data_q_tpl),
        .out_12_real_fd_data_q_tpl(iFFT_B2S_cunroll_x_out_12_real_fd_data_q_tpl),
        .out_13_fd_time_out_tpl(iFFT_B2S_cunroll_x_out_13_fd_time_out_tpl),
        .out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(iFFT_B2S_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(iFFT_B2S_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(iFFT_B2S_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(iFFT_B2S_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_1_vout2_tpl(GPOUT,30)
    assign out_1_vout2_tpl = iFFT_B2S_cunroll_x_out_1_vout1_tpl;

    // out_2_cout2_tpl(GPOUT,31)
    assign out_2_cout2_tpl = iFFT_B2S_cunroll_x_out_2_cout1_tpl;

    // out_3_imag_dout2_tpl(GPOUT,32)
    assign out_3_imag_dout2_tpl = iFFT_B2S_cunroll_x_out_3_imag_dout1_tpl;

    // out_3_real_dout2_tpl(GPOUT,33)
    assign out_3_real_dout2_tpl = iFFT_B2S_cunroll_x_out_3_real_dout1_tpl;

    // out_4_imag_td_ifft_out_d_tpl(GPOUT,34)
    assign out_4_imag_td_ifft_out_d_tpl = iFFT_B2S_cunroll_x_out_4_imag_td_ifft_out_d_tpl;

    // out_4_real_td_ifft_out_d_tpl(GPOUT,35)
    assign out_4_real_td_ifft_out_d_tpl = iFFT_B2S_cunroll_x_out_4_real_td_ifft_out_d_tpl;

    // out_5_td_ifft_out_ch_tpl(GPOUT,36)
    assign out_5_td_ifft_out_ch_tpl = iFFT_B2S_cunroll_x_out_5_td_ifft_out_ch_tpl;

    // out_6_td_ifft_out_v_tpl(GPOUT,37)
    assign out_6_td_ifft_out_v_tpl = iFFT_B2S_cunroll_x_out_6_td_ifft_out_v_tpl;

    // out_7_ifft_size_out_tpl(GPOUT,38)
    assign out_7_ifft_size_out_tpl = iFFT_B2S_cunroll_x_out_7_ifft_size_out_tpl;

    // out_8_ifft_nprb_out_tpl(GPOUT,39)
    assign out_8_ifft_nprb_out_tpl = iFFT_B2S_cunroll_x_out_8_ifft_nprb_out_tpl;

    // out_9_ifft_cp_out_tpl(GPOUT,40)
    assign out_9_ifft_cp_out_tpl = iFFT_B2S_cunroll_x_out_9_ifft_cp_out_tpl;

    // out_10_fd_data_v_tpl(GPOUT,41)
    assign out_10_fd_data_v_tpl = iFFT_B2S_cunroll_x_out_10_fd_data_v_tpl;

    // out_11_fd_data_c_tpl(GPOUT,42)
    assign out_11_fd_data_c_tpl = iFFT_B2S_cunroll_x_out_11_fd_data_c_tpl;

    // out_12_imag_fd_data_q_tpl(GPOUT,43)
    assign out_12_imag_fd_data_q_tpl = iFFT_B2S_cunroll_x_out_12_imag_fd_data_q_tpl;

    // out_12_real_fd_data_q_tpl(GPOUT,44)
    assign out_12_real_fd_data_q_tpl = iFFT_B2S_cunroll_x_out_12_real_fd_data_q_tpl;

    // out_13_fd_timeref_out_tpl(GPOUT,45)
    assign out_13_fd_timeref_out_tpl = iFFT_B2S_cunroll_x_out_13_fd_time_out_tpl;

    // out_14_version_out_tpl(GPOUT,46)
    assign out_14_version_out_tpl = in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_RegField4_x_tpl;

    // out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(GPOUT,47)
    assign out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl = iFFT_B2S_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;

    // out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(GPOUT,48)
    assign out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl = iFFT_B2S_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;

    // out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(GPOUT,49)
    assign out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl = iFFT_B2S_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;

    // out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(GPOUT,50)
    assign out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl = iFFT_B2S_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;

endmodule
