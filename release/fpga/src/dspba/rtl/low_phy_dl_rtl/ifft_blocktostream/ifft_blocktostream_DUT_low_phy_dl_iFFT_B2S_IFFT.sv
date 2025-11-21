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

// SystemVerilog created from ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT
// SystemVerilog created on Thu Jun 12 21:17:49 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT (
    input wire [15:0] in_1_imag_data1_tpl,
    input wire [15:0] in_1_real_data1_tpl,
    input wire [0:0] in_2_valid1_tpl,
    input wire [7:0] in_3_channel1_tpl,
    input wire [3:0] in_4_size1_tpl,
    input wire [10:0] in_5_cplen1_tpl,
    input wire [11:0] in_6_nsc1_tpl,
    input wire [15:0] in_7_ifft_gain_re_l1_tpl,
    input wire [15:0] in_8_ifft_gain_im_l1_tpl,
    input wire [3:0] in_9_ifft_shift_l1_tpl,
    input wire [15:0] in_10_ifft_mux_const_l1_tpl,
    input wire [0:0] in_11_muxsel_l1_tpl,
    input wire [0:0] in_12_DC_SC_EN_tpl,
    input wire [0:0] in_13_ripple_comp_en_tpl,
    input wire [0:0] in_14_rc_bw_sel_tpl,
    input wire [63:0] in_15_time_in_tpl,
    input wire [15:0] in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    input wire [15:0] in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    output wire [0:0] out_1_vout1_tpl,
    output wire [7:0] out_2_cout1_tpl,
    output wire [15:0] out_3_imag_dout1_tpl,
    output wire [15:0] out_3_real_dout1_tpl,
    output wire [3:0] out_4_sizeout1_tpl,
    output wire [10:0] out_5_cpout1_tpl,
    output wire [11:0] out_6_nprb_tpl,
    output wire [0:0] out_7_fd_data_v_tpl,
    output wire [7:0] out_8_fd_data_c_tpl,
    output wire [15:0] out_9_imag_fd_data_q_tpl,
    output wire [15:0] out_9_real_fd_data_q_tpl,
    output wire [63:0] out_10_fd_time_out_tpl,
    output wire [11:0] out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    output wire [11:0] out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    output wire [15:0] out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    output wire [15:0] out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] Input_signal_latch_cunroll_x_out_1_qvalid_tpl;
    wire [7:0] Input_signal_latch_cunroll_x_out_2_qchannel_tpl;
    wire [15:0] Input_signal_latch_cunroll_x_out_3_imag_qdata_tpl;
    wire [15:0] Input_signal_latch_cunroll_x_out_3_real_qdata_tpl;
    wire [3:0] Input_signal_latch_cunroll_x_out_4_qfftsize_tpl;
    wire [11:0] Input_signal_latch_cunroll_x_out_5_q_nprb_tpl;
    wire [10:0] Input_signal_latch_cunroll_x_out_6_qcplen_tpl;
    wire [0:0] Input_signal_latch_cunroll_x_out_7_q_dc_sc_en_tpl;
    wire [15:0] Input_signal_latch_cunroll_x_out_8_qfft_gain_real_tpl;
    wire [15:0] Input_signal_latch_cunroll_x_out_9_qf_ift_gain_imag_tpl;
    wire [3:0] Input_signal_latch_cunroll_x_out_10_q_ifftshift_tpl;
    wire [15:0] Input_signal_latch_cunroll_x_out_11_q_ifft_mux_const_data_tpl;
    wire [0:0] Input_signal_latch_cunroll_x_out_12_q_muxsel_tpl;
    wire [63:0] Input_signal_latch_cunroll_x_out_13_time_out_tpl;
    wire [15:0] VIFFT_cunroll_x_out_1_imag_dout_tpl;
    wire [15:0] VIFFT_cunroll_x_out_1_real_dout_tpl;
    wire [0:0] VIFFT_cunroll_x_out_2_vout_tpl;
    wire [7:0] VIFFT_cunroll_x_out_3_cout_tpl;
    wire [3:0] VIFFT_cunroll_x_out_4_sizeout_tpl;
    wire [10:0] VIFFT_cunroll_x_out_5_cplen_Out_tpl;
    wire [11:0] VIFFT_cunroll_x_out_6_nprb_tpl;
    wire [0:0] VIFFT_cunroll_x_out_7_fd_data_v_tpl;
    wire [7:0] VIFFT_cunroll_x_out_8_fd_data_c_tpl;
    wire [15:0] VIFFT_cunroll_x_out_9_imag_fd_data_q_tpl;
    wire [15:0] VIFFT_cunroll_x_out_9_real_fd_data_q_tpl;
    wire [63:0] VIFFT_cunroll_x_out_10_fd_time_out_tpl;
    wire [11:0] VIFFT_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [11:0] VIFFT_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    wire [15:0] VIFFT_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [15:0] VIFFT_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;

    import ifft_blocktostream_DUT_safe_path_ver::safe_path_ver;

    // Input_signal_latch_cunroll_x(BLACKBOX,2)
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch theInput_signal_latch_cunroll_x (
        .in_1_valid_tpl(in_2_valid1_tpl),
        .in_2_ch_tpl(in_3_channel1_tpl),
        .in_3_imag_data_tpl(in_1_imag_data1_tpl),
        .in_3_real_data_tpl(in_1_real_data1_tpl),
        .in_4_FFTSize_tpl(in_4_size1_tpl),
        .in_5_NSubCarr_tpl(in_6_nsc1_tpl),
        .in_6_cplen_tpl(in_5_cplen1_tpl),
        .in_7_DC_SC_EN1_tpl(in_12_DC_SC_EN_tpl),
        .in_8_iftgain_real_tpl(in_7_ifft_gain_re_l1_tpl),
        .in_9_ifftgain_imag_tpl(in_8_ifft_gain_im_l1_tpl),
        .in_10_ifftshift_tpl(in_9_ifft_shift_l1_tpl),
        .in_11_ifft_mux_const_data_tpl(in_10_ifft_mux_const_l1_tpl),
        .in_12_muxsel_tpl(in_11_muxsel_l1_tpl),
        .in_13_time_in_tpl(in_15_time_in_tpl),
        .out_1_qvalid_tpl(Input_signal_latch_cunroll_x_out_1_qvalid_tpl),
        .out_2_qchannel_tpl(Input_signal_latch_cunroll_x_out_2_qchannel_tpl),
        .out_3_imag_qdata_tpl(Input_signal_latch_cunroll_x_out_3_imag_qdata_tpl),
        .out_3_real_qdata_tpl(Input_signal_latch_cunroll_x_out_3_real_qdata_tpl),
        .out_4_qfftsize_tpl(Input_signal_latch_cunroll_x_out_4_qfftsize_tpl),
        .out_5_q_nprb_tpl(Input_signal_latch_cunroll_x_out_5_q_nprb_tpl),
        .out_6_qcplen_tpl(Input_signal_latch_cunroll_x_out_6_qcplen_tpl),
        .out_7_q_dc_sc_en_tpl(Input_signal_latch_cunroll_x_out_7_q_dc_sc_en_tpl),
        .out_8_qfft_gain_real_tpl(Input_signal_latch_cunroll_x_out_8_qfft_gain_real_tpl),
        .out_9_qf_ift_gain_imag_tpl(Input_signal_latch_cunroll_x_out_9_qf_ift_gain_imag_tpl),
        .out_10_q_ifftshift_tpl(Input_signal_latch_cunroll_x_out_10_q_ifftshift_tpl),
        .out_11_q_ifft_mux_const_data_tpl(Input_signal_latch_cunroll_x_out_11_q_ifft_mux_const_data_tpl),
        .out_12_q_muxsel_tpl(Input_signal_latch_cunroll_x_out_12_q_muxsel_tpl),
        .out_13_time_out_tpl(Input_signal_latch_cunroll_x_out_13_time_out_tpl),
        .clk(clk),
        .areset(areset)
    );

    // VIFFT_cunroll_x(BLACKBOX,3)
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT theVIFFT_cunroll_x (
        .in_1_imag_data_tpl(Input_signal_latch_cunroll_x_out_3_imag_qdata_tpl),
        .in_1_real_data_tpl(Input_signal_latch_cunroll_x_out_3_real_qdata_tpl),
        .in_2_valid_tpl(Input_signal_latch_cunroll_x_out_1_qvalid_tpl),
        .in_3_channel_tpl(Input_signal_latch_cunroll_x_out_2_qchannel_tpl),
        .in_4_size_tpl(Input_signal_latch_cunroll_x_out_4_qfftsize_tpl),
        .in_5_cplen_tpl(Input_signal_latch_cunroll_x_out_6_qcplen_tpl),
        .in_6_nsc_tpl(Input_signal_latch_cunroll_x_out_5_q_nprb_tpl),
        .in_7_ifft_gain_re_tpl(Input_signal_latch_cunroll_x_out_8_qfft_gain_real_tpl),
        .in_8_ifft_gain_im_tpl(Input_signal_latch_cunroll_x_out_9_qf_ift_gain_imag_tpl),
        .in_9_ifft_shift_tpl(Input_signal_latch_cunroll_x_out_10_q_ifftshift_tpl),
        .in_10_ifft_mux_const_tpl(Input_signal_latch_cunroll_x_out_11_q_ifft_mux_const_data_tpl),
        .in_11_muxsel_tpl(Input_signal_latch_cunroll_x_out_12_q_muxsel_tpl),
        .in_12_DC_SC_EN_tpl(Input_signal_latch_cunroll_x_out_7_q_dc_sc_en_tpl),
        .in_13_ripple_comp_en_tpl(in_13_ripple_comp_en_tpl),
        .in_14_rc_bw_sel_tpl(in_14_rc_bw_sel_tpl),
        .in_15_time_in_tpl(Input_signal_latch_cunroll_x_out_13_time_out_tpl),
        .in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .out_1_imag_dout_tpl(VIFFT_cunroll_x_out_1_imag_dout_tpl),
        .out_1_real_dout_tpl(VIFFT_cunroll_x_out_1_real_dout_tpl),
        .out_2_vout_tpl(VIFFT_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(VIFFT_cunroll_x_out_3_cout_tpl),
        .out_4_sizeout_tpl(VIFFT_cunroll_x_out_4_sizeout_tpl),
        .out_5_cplen_Out_tpl(VIFFT_cunroll_x_out_5_cplen_Out_tpl),
        .out_6_nprb_tpl(VIFFT_cunroll_x_out_6_nprb_tpl),
        .out_7_fd_data_v_tpl(VIFFT_cunroll_x_out_7_fd_data_v_tpl),
        .out_8_fd_data_c_tpl(VIFFT_cunroll_x_out_8_fd_data_c_tpl),
        .out_9_imag_fd_data_q_tpl(VIFFT_cunroll_x_out_9_imag_fd_data_q_tpl),
        .out_9_real_fd_data_q_tpl(VIFFT_cunroll_x_out_9_real_fd_data_q_tpl),
        .out_10_fd_time_out_tpl(VIFFT_cunroll_x_out_10_fd_time_out_tpl),
        .out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(VIFFT_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(VIFFT_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(VIFFT_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(VIFFT_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_1_vout1_tpl(GPOUT,22)
    assign out_1_vout1_tpl = VIFFT_cunroll_x_out_2_vout_tpl;

    // out_2_cout1_tpl(GPOUT,23)
    assign out_2_cout1_tpl = VIFFT_cunroll_x_out_3_cout_tpl;

    // out_3_imag_dout1_tpl(GPOUT,24)
    assign out_3_imag_dout1_tpl = VIFFT_cunroll_x_out_1_imag_dout_tpl;

    // out_3_real_dout1_tpl(GPOUT,25)
    assign out_3_real_dout1_tpl = VIFFT_cunroll_x_out_1_real_dout_tpl;

    // out_4_sizeout1_tpl(GPOUT,26)
    assign out_4_sizeout1_tpl = VIFFT_cunroll_x_out_4_sizeout_tpl;

    // out_5_cpout1_tpl(GPOUT,27)
    assign out_5_cpout1_tpl = VIFFT_cunroll_x_out_5_cplen_Out_tpl;

    // out_6_nprb_tpl(GPOUT,28)
    assign out_6_nprb_tpl = VIFFT_cunroll_x_out_6_nprb_tpl;

    // out_7_fd_data_v_tpl(GPOUT,29)
    assign out_7_fd_data_v_tpl = VIFFT_cunroll_x_out_7_fd_data_v_tpl;

    // out_8_fd_data_c_tpl(GPOUT,30)
    assign out_8_fd_data_c_tpl = VIFFT_cunroll_x_out_8_fd_data_c_tpl;

    // out_9_imag_fd_data_q_tpl(GPOUT,31)
    assign out_9_imag_fd_data_q_tpl = VIFFT_cunroll_x_out_9_imag_fd_data_q_tpl;

    // out_9_real_fd_data_q_tpl(GPOUT,32)
    assign out_9_real_fd_data_q_tpl = VIFFT_cunroll_x_out_9_real_fd_data_q_tpl;

    // out_10_fd_time_out_tpl(GPOUT,33)
    assign out_10_fd_time_out_tpl = VIFFT_cunroll_x_out_10_fd_time_out_tpl;

    // out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(GPOUT,34)
    assign out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl = VIFFT_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;

    // out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(GPOUT,35)
    assign out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl = VIFFT_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;

    // out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(GPOUT,36)
    assign out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl = VIFFT_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;

    // out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(GPOUT,37)
    assign out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl = VIFFT_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;

endmodule
