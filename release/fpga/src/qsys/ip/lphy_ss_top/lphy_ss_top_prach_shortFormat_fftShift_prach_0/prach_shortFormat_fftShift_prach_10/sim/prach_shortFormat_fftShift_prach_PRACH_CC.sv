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

// SystemVerilog created from prach_shortFormat_fftShift_prach_PRACH_CC
// SystemVerilog created on Wed Nov  6 19:28:33 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module prach_shortFormat_fftShift_prach_PRACH_CC (
    input wire [15:0] in_1_imag_din0_tpl,
    input wire [15:0] in_1_real_din0_tpl,
    input wire [0:0] in_2_vin0_tpl,
    input wire [7:0] in_3_chin0_tpl,
    input wire [11:0] in_4_SFN_tpl,
    input wire [7:0] in_5_SubFN_tpl,
    input wire [1:0] in_6_SCSby15_tpl,
    input wire [7:0] in_7_BWby10_tpl,
    input wire [22:0] in_8_CPLen_cplane_tpl,
    input wire [22:0] in_9_timeoffset_cplane_tpl,
    input wire [3:0] in_10_numsym_cplane_tpl,
    input wire [1:0] in_11_slotID_cplane_tpl,
    input wire [3:0] in_12_startsym_cplane_tpl,
    input wire [28:0] in_13_timerefin_cplane_tpl,
    input wire [1:0] in_14_cur_slot_tpl,
    input wire [7:0] in_15_SubFN_cplane_tpl,
    input wire [0:0] in_16_cbar_mplane_sel_tpl,
    input wire [22:0] in_17_time_offset_bias_tpl,
    input wire [22:0] in_18_startsym_bias_tpl,
    input wire [15:0] in_19_gain_in_re_tpl,
    input wire [15:0] in_20_gain_in_im_tpl,
    input wire [7:0] in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl,
    input wire [2:0] in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl,
    input wire [0:0] in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl,
    input wire [0:0] in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl,
    input wire [7:0] in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl,
    input wire [11:0] in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl,
    output wire [0:0] out_1_qv_tpl,
    output wire [7:0] out_2_qch_tpl,
    output wire [15:0] out_3_imag_q_tpl,
    output wire [15:0] out_3_real_q_tpl,
    output wire [0:0] out_4_qv139_tpl,
    output wire [13:0] out_5_qFreqBinIdx_tpl,
    output wire [0:0] out_6_fftShift_v_tpl,
    output wire [7:0] out_7_fftShift_c_tpl,
    output wire [15:0] out_8_imag_fftShift_d_tpl,
    output wire [15:0] out_8_real_fftShift_d_tpl,
    output wire [28:0] out_9_TimeReference_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] Cbar_mplane_selection_cunroll_x_out_1_vout_tpl;
    wire [7:0] Cbar_mplane_selection_cunroll_x_out_2_cout_tpl;
    wire [15:0] Cbar_mplane_selection_cunroll_x_out_3_imag_dout_tpl;
    wire [15:0] Cbar_mplane_selection_cunroll_x_out_3_real_dout_tpl;
    wire [3:0] Cbar_mplane_selection_cunroll_x_out_4_qFFTSize_tpl;
    wire [0:0] Cbar_mplane_selection_cunroll_x_out_5_qSOP_tpl;
    wire [7:0] Cbar_mplane_selection_cunroll_x_out_6_qBWby10_tpl;
    wire [28:0] Cbar_mplane_selection_cunroll_x_out_7_T_ref_tpl;
    wire [3:0] Cbar_mplane_selection_cunroll_x_out_8_qNFFT_tpl;
    wire [25:0] Cbar_mplane_selection_cunroll_x_out_9_CPLen_tpl;
    wire [15:0] ControlDecode_cunroll_x_out_1_imag_dout_tpl;
    wire [15:0] ControlDecode_cunroll_x_out_1_real_dout_tpl;
    wire [0:0] ControlDecode_cunroll_x_out_2_vout_tpl;
    wire [7:0] ControlDecode_cunroll_x_out_3_cout_tpl;
    wire [22:0] ControlDecode_cunroll_x_out_4_CPLen_tpl;
    wire [3:0] ControlDecode_cunroll_x_out_5_FFTSize_tpl;
    wire [3:0] ControlDecode_cunroll_x_out_6_NFFTs_tpl;
    wire [0:0] ControlDecode_cunroll_x_out_7_SOP_tpl;
    wire [7:0] ControlDecode_cunroll_x_out_8_qBWby10_tpl;
    wire [28:0] ControlDecode_cunroll_x_out_9_TimeReference_tpl;
    wire [0:0] RemoveCP_cunroll_x_out_1_vout_tpl;
    wire [7:0] RemoveCP_cunroll_x_out_2_cout_tpl;
    wire [15:0] RemoveCP_cunroll_x_out_3_imag_dout_tpl;
    wire [15:0] RemoveCP_cunroll_x_out_3_real_dout_tpl;
    wire [3:0] RemoveCP_cunroll_x_out_4_qFFTSize_tpl;
    wire [0:0] RemoveCP_cunroll_x_out_5_qSOP_tpl;
    wire [7:0] RemoveCP_cunroll_x_out_6_qBWby10_tpl;
    wire [28:0] RemoveCP_cunroll_x_out_7_T_ref_tpl;
    wire [0:0] ScaleAndSelect_cunroll_x_out_1_qv_tpl;
    wire [7:0] ScaleAndSelect_cunroll_x_out_2_qch_tpl;
    wire [15:0] ScaleAndSelect_cunroll_x_out_3_imag_q_tpl;
    wire [15:0] ScaleAndSelect_cunroll_x_out_3_real_q_tpl;
    wire [0:0] ScaleAndSelect_cunroll_x_out_4_qv139_tpl;
    wire [13:0] ScaleAndSelect_cunroll_x_out_5_FreqBinIdx_tpl;
    wire [0:0] ScaleAndSelect_cunroll_x_out_6_vout_FFTshift_tpl;
    wire [7:0] ScaleAndSelect_cunroll_x_out_7_cout_FFTshift_tpl;
    wire [15:0] ScaleAndSelect_cunroll_x_out_8_imag_dout_FFTshift_tpl;
    wire [15:0] ScaleAndSelect_cunroll_x_out_8_real_dout_FFTshift_tpl;
    wire [28:0] ScaleAndSelect_cunroll_x_out_9_Tref_tpl;
    wire [0:0] Stream2BlockConv_cunroll_x_out_1_vout_tpl;
    wire [7:0] Stream2BlockConv_cunroll_x_out_2_cout_tpl;
    wire [3:0] Stream2BlockConv_cunroll_x_out_3_qFFTSize_tpl;
    wire [15:0] Stream2BlockConv_cunroll_x_out_4_imag_q_tpl;
    wire [15:0] Stream2BlockConv_cunroll_x_out_4_real_q_tpl;
    wire [7:0] Stream2BlockConv_cunroll_x_out_5_qBWby10_tpl;
    wire [28:0] Stream2BlockConv_cunroll_x_out_6_Tref_tpl;
    wire [0:0] VFFT_cunroll_x_out_1_qv_tpl;
    wire [7:0] VFFT_cunroll_x_out_2_qc_tpl;
    wire [3:0] VFFT_cunroll_x_out_3_qsize_tpl;
    wire [28:0] VFFT_cunroll_x_out_4_imag_q_tpl;
    wire [28:0] VFFT_cunroll_x_out_4_real_q_tpl;
    wire [7:0] VFFT_cunroll_x_out_5_qBWby10_tpl;
    wire [28:0] VFFT_cunroll_x_out_6_Tref_tpl;
    wire [0:0] control_decode_cplane_cunroll_x_out_1_vout_tpl;
    wire [7:0] control_decode_cplane_cunroll_x_out_2_cout_tpl;
    wire [15:0] control_decode_cplane_cunroll_x_out_3_imag_dout_tpl;
    wire [15:0] control_decode_cplane_cunroll_x_out_3_real_dout_tpl;
    wire [3:0] control_decode_cplane_cunroll_x_out_4_qFFTSize_tpl;
    wire [0:0] control_decode_cplane_cunroll_x_out_5_qSOP_tpl;
    wire [3:0] control_decode_cplane_cunroll_x_out_6_qBWby10_tpl;
    wire [28:0] control_decode_cplane_cunroll_x_out_7_T_ref_tpl;
    wire [3:0] control_decode_cplane_cunroll_x_out_8_qNFFT_tpl;
    wire [25:0] control_decode_cplane_cunroll_x_out_9_CPLen_tpl;
    wire [15:0] gain_cunroll_x_out_1_imag_data_out_tpl;
    wire [15:0] gain_cunroll_x_out_1_real_data_out_tpl;
    wire [0:0] gain_cunroll_x_out_2_valid_out_tpl;
    wire [7:0] gain_cunroll_x_out_3_ch_no_tpl;

    import prach_shortFormat_fftShift_prach_safe_path_ver::safe_path_ver;

    // control_decode_cplane_cunroll_x(BLACKBOX,8)
    prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane thecontrol_decode_cplane_cunroll_x (
        .in_1_imag_din_tpl(in_1_imag_din0_tpl),
        .in_1_real_din_tpl(in_1_real_din0_tpl),
        .in_2_vin_tpl(in_2_vin0_tpl),
        .in_3_chin_tpl(in_3_chin0_tpl),
        .in_4_CPLen_cplane_tpl(in_8_CPLen_cplane_tpl),
        .in_5_timeoffset_cplane_tpl(in_9_timeoffset_cplane_tpl),
        .in_6_numsym_cplane_tpl(in_10_numsym_cplane_tpl),
        .in_7_slotID_cplane_tpl(in_11_slotID_cplane_tpl),
        .in_8_startsym_cplane_tpl(in_12_startsym_cplane_tpl),
        .in_9_TimeReference_tpl(in_13_timerefin_cplane_tpl),
        .in_10_cur_SubFN_tpl(in_5_SubFN_tpl),
        .in_11_cur_slot_tpl(in_14_cur_slot_tpl),
        .in_12_SubFN_cplane_tpl(in_15_SubFN_cplane_tpl),
        .in_13_time_offset_bias_tpl(in_17_time_offset_bias_tpl),
        .in_14_startsym_bias_tpl(in_18_startsym_bias_tpl),
        .in_15_SFN_tpl(in_4_SFN_tpl),
        .out_1_vout_tpl(control_decode_cplane_cunroll_x_out_1_vout_tpl),
        .out_2_cout_tpl(control_decode_cplane_cunroll_x_out_2_cout_tpl),
        .out_3_imag_dout_tpl(control_decode_cplane_cunroll_x_out_3_imag_dout_tpl),
        .out_3_real_dout_tpl(control_decode_cplane_cunroll_x_out_3_real_dout_tpl),
        .out_4_qFFTSize_tpl(control_decode_cplane_cunroll_x_out_4_qFFTSize_tpl),
        .out_5_qSOP_tpl(control_decode_cplane_cunroll_x_out_5_qSOP_tpl),
        .out_6_qBWby10_tpl(control_decode_cplane_cunroll_x_out_6_qBWby10_tpl),
        .out_7_T_ref_tpl(control_decode_cplane_cunroll_x_out_7_T_ref_tpl),
        .out_8_qNFFT_tpl(control_decode_cplane_cunroll_x_out_8_qNFFT_tpl),
        .out_9_CPLen_tpl(control_decode_cplane_cunroll_x_out_9_CPLen_tpl),
        .clk(clk),
        .areset(areset)
    );

    // ControlDecode_cunroll_x(BLACKBOX,3)
    prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode theControlDecode_cunroll_x (
        .in_1_imag_din_tpl(in_1_imag_din0_tpl),
        .in_1_real_din_tpl(in_1_real_din0_tpl),
        .in_2_vin_tpl(in_2_vin0_tpl),
        .in_3_chin_tpl(in_3_chin0_tpl),
        .in_4_SFN_tpl(in_4_SFN_tpl),
        .in_5_SubFN_tpl(in_5_SubFN_tpl),
        .in_6_SCSby15_tpl(in_6_SCSby15_tpl),
        .in_7_BWby10_tpl(in_7_BWby10_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl(in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl(in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl(in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl(in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl),
        .out_1_imag_dout_tpl(ControlDecode_cunroll_x_out_1_imag_dout_tpl),
        .out_1_real_dout_tpl(ControlDecode_cunroll_x_out_1_real_dout_tpl),
        .out_2_vout_tpl(ControlDecode_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(ControlDecode_cunroll_x_out_3_cout_tpl),
        .out_4_CPLen_tpl(ControlDecode_cunroll_x_out_4_CPLen_tpl),
        .out_5_FFTSize_tpl(ControlDecode_cunroll_x_out_5_FFTSize_tpl),
        .out_6_NFFTs_tpl(ControlDecode_cunroll_x_out_6_NFFTs_tpl),
        .out_7_SOP_tpl(ControlDecode_cunroll_x_out_7_SOP_tpl),
        .out_8_qBWby10_tpl(ControlDecode_cunroll_x_out_8_qBWby10_tpl),
        .out_9_TimeReference_tpl(ControlDecode_cunroll_x_out_9_TimeReference_tpl),
        .clk(clk),
        .areset(areset)
    );

    // Cbar_mplane_selection_cunroll_x(BLACKBOX,2)
    prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection theCbar_mplane_selection_cunroll_x (
        .in_1_valid_m_tpl(ControlDecode_cunroll_x_out_2_vout_tpl),
        .in_2_c_m_tpl(ControlDecode_cunroll_x_out_3_cout_tpl),
        .in_3_imag_din_m_tpl(ControlDecode_cunroll_x_out_1_imag_dout_tpl),
        .in_3_real_din_m_tpl(ControlDecode_cunroll_x_out_1_real_dout_tpl),
        .in_4_fftsize_m_tpl(ControlDecode_cunroll_x_out_5_FFTSize_tpl),
        .in_5_sop_m_tpl(ControlDecode_cunroll_x_out_7_SOP_tpl),
        .in_6_bwby10_m_tpl(ControlDecode_cunroll_x_out_8_qBWby10_tpl),
        .in_7_tref_m_tpl(ControlDecode_cunroll_x_out_9_TimeReference_tpl),
        .in_8_NFFT_m_tpl(ControlDecode_cunroll_x_out_6_NFFTs_tpl),
        .in_9_cplen_m_tpl(ControlDecode_cunroll_x_out_4_CPLen_tpl),
        .in_10_cbar_mplane_sel_tpl(in_16_cbar_mplane_sel_tpl),
        .in_11_valid_c_tpl(control_decode_cplane_cunroll_x_out_1_vout_tpl),
        .in_12_c_c_tpl(control_decode_cplane_cunroll_x_out_2_cout_tpl),
        .in_13_imag_din_c_tpl(control_decode_cplane_cunroll_x_out_3_imag_dout_tpl),
        .in_13_real_din_c_tpl(control_decode_cplane_cunroll_x_out_3_real_dout_tpl),
        .in_14_fftsize_c_tpl(control_decode_cplane_cunroll_x_out_4_qFFTSize_tpl),
        .in_15_sop_c_tpl(control_decode_cplane_cunroll_x_out_5_qSOP_tpl),
        .in_16_bwby10_c_tpl(control_decode_cplane_cunroll_x_out_6_qBWby10_tpl),
        .in_17_tref_c_tpl(control_decode_cplane_cunroll_x_out_7_T_ref_tpl),
        .in_18_NFFT_c_tpl(control_decode_cplane_cunroll_x_out_8_qNFFT_tpl),
        .in_19_cplen_c_tpl(control_decode_cplane_cunroll_x_out_9_CPLen_tpl),
        .out_1_vout_tpl(Cbar_mplane_selection_cunroll_x_out_1_vout_tpl),
        .out_2_cout_tpl(Cbar_mplane_selection_cunroll_x_out_2_cout_tpl),
        .out_3_imag_dout_tpl(Cbar_mplane_selection_cunroll_x_out_3_imag_dout_tpl),
        .out_3_real_dout_tpl(Cbar_mplane_selection_cunroll_x_out_3_real_dout_tpl),
        .out_4_qFFTSize_tpl(Cbar_mplane_selection_cunroll_x_out_4_qFFTSize_tpl),
        .out_5_qSOP_tpl(Cbar_mplane_selection_cunroll_x_out_5_qSOP_tpl),
        .out_6_qBWby10_tpl(Cbar_mplane_selection_cunroll_x_out_6_qBWby10_tpl),
        .out_7_T_ref_tpl(Cbar_mplane_selection_cunroll_x_out_7_T_ref_tpl),
        .out_8_qNFFT_tpl(Cbar_mplane_selection_cunroll_x_out_8_qNFFT_tpl),
        .out_9_CPLen_tpl(Cbar_mplane_selection_cunroll_x_out_9_CPLen_tpl),
        .clk(clk),
        .areset(areset)
    );

    // RemoveCP_cunroll_x(BLACKBOX,4)
    prach_shortFormat_fftShift_prach_PRACH_CC_RemoveCP theRemoveCP_cunroll_x (
        .in_1_imag_din_tpl(Cbar_mplane_selection_cunroll_x_out_3_imag_dout_tpl),
        .in_1_real_din_tpl(Cbar_mplane_selection_cunroll_x_out_3_real_dout_tpl),
        .in_2_vin_tpl(Cbar_mplane_selection_cunroll_x_out_1_vout_tpl),
        .in_3_chin_tpl(Cbar_mplane_selection_cunroll_x_out_2_cout_tpl),
        .in_4_CPLen_tpl(Cbar_mplane_selection_cunroll_x_out_9_CPLen_tpl),
        .in_5_FFTSize_tpl(Cbar_mplane_selection_cunroll_x_out_4_qFFTSize_tpl),
        .in_6_NumberOfFFTs_tpl(Cbar_mplane_selection_cunroll_x_out_8_qNFFT_tpl),
        .in_7_SOP_tpl(Cbar_mplane_selection_cunroll_x_out_5_qSOP_tpl),
        .in_8_BW_x_10_x_tpl(Cbar_mplane_selection_cunroll_x_out_6_qBWby10_tpl),
        .in_9_TimeReference_tpl(Cbar_mplane_selection_cunroll_x_out_7_T_ref_tpl),
        .out_1_vout_tpl(RemoveCP_cunroll_x_out_1_vout_tpl),
        .out_2_cout_tpl(RemoveCP_cunroll_x_out_2_cout_tpl),
        .out_3_imag_dout_tpl(RemoveCP_cunroll_x_out_3_imag_dout_tpl),
        .out_3_real_dout_tpl(RemoveCP_cunroll_x_out_3_real_dout_tpl),
        .out_4_qFFTSize_tpl(RemoveCP_cunroll_x_out_4_qFFTSize_tpl),
        .out_5_qSOP_tpl(RemoveCP_cunroll_x_out_5_qSOP_tpl),
        .out_6_qBWby10_tpl(RemoveCP_cunroll_x_out_6_qBWby10_tpl),
        .out_7_T_ref_tpl(RemoveCP_cunroll_x_out_7_T_ref_tpl),
        .clk(clk),
        .areset(areset)
    );

    // Stream2BlockConv_cunroll_x(BLACKBOX,6)
    prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv theStream2BlockConv_cunroll_x (
        .in_1_vin_tpl(RemoveCP_cunroll_x_out_1_vout_tpl),
        .in_2_chin_tpl(RemoveCP_cunroll_x_out_2_cout_tpl),
        .in_3_imag_din_tpl(RemoveCP_cunroll_x_out_3_imag_dout_tpl),
        .in_3_real_din_tpl(RemoveCP_cunroll_x_out_3_real_dout_tpl),
        .in_4_FFTSize_tpl(RemoveCP_cunroll_x_out_4_qFFTSize_tpl),
        .in_5_SOP_tpl(RemoveCP_cunroll_x_out_5_qSOP_tpl),
        .in_6_BWby10_tpl(RemoveCP_cunroll_x_out_6_qBWby10_tpl),
        .in_7_TimeReference_tpl(RemoveCP_cunroll_x_out_7_T_ref_tpl),
        .out_1_vout_tpl(Stream2BlockConv_cunroll_x_out_1_vout_tpl),
        .out_2_cout_tpl(Stream2BlockConv_cunroll_x_out_2_cout_tpl),
        .out_3_qFFTSize_tpl(Stream2BlockConv_cunroll_x_out_3_qFFTSize_tpl),
        .out_4_imag_q_tpl(Stream2BlockConv_cunroll_x_out_4_imag_q_tpl),
        .out_4_real_q_tpl(Stream2BlockConv_cunroll_x_out_4_real_q_tpl),
        .out_5_qBWby10_tpl(Stream2BlockConv_cunroll_x_out_5_qBWby10_tpl),
        .out_6_Tref_tpl(Stream2BlockConv_cunroll_x_out_6_Tref_tpl),
        .clk(clk),
        .areset(areset)
    );

    // gain_cunroll_x(BLACKBOX,9)
    prach_shortFormat_fftShift_prach_PRACH_CC_gain thegain_cunroll_x (
        .in_1_imag_data_in_tpl(Stream2BlockConv_cunroll_x_out_4_imag_q_tpl),
        .in_1_real_data_in_tpl(Stream2BlockConv_cunroll_x_out_4_real_q_tpl),
        .in_2_data_valid_tpl(Stream2BlockConv_cunroll_x_out_1_vout_tpl),
        .in_3_chin_tpl(Stream2BlockConv_cunroll_x_out_2_cout_tpl),
        .in_4_imag_gain_tpl(in_20_gain_in_im_tpl),
        .in_4_real_gain_tpl(in_19_gain_in_re_tpl),
        .out_1_imag_data_out_tpl(gain_cunroll_x_out_1_imag_data_out_tpl),
        .out_1_real_data_out_tpl(gain_cunroll_x_out_1_real_data_out_tpl),
        .out_2_valid_out_tpl(gain_cunroll_x_out_2_valid_out_tpl),
        .out_3_ch_no_tpl(gain_cunroll_x_out_3_ch_no_tpl),
        .clk(clk),
        .areset(areset)
    );

    // VFFT_cunroll_x(BLACKBOX,7)
    prach_shortFormat_fftShift_prach_PRACH_CC_VFFT theVFFT_cunroll_x (
        .in_1_v_tpl(gain_cunroll_x_out_2_valid_out_tpl),
        .in_2_c_tpl(gain_cunroll_x_out_3_ch_no_tpl),
        .in_3_size_tpl(Stream2BlockConv_cunroll_x_out_3_qFFTSize_tpl),
        .in_4_imag_d_tpl(gain_cunroll_x_out_1_imag_data_out_tpl),
        .in_4_real_d_tpl(gain_cunroll_x_out_1_real_data_out_tpl),
        .in_5_BWby10_tpl(Stream2BlockConv_cunroll_x_out_5_qBWby10_tpl),
        .in_6_TimeReference_tpl(Stream2BlockConv_cunroll_x_out_6_Tref_tpl),
        .out_1_qv_tpl(VFFT_cunroll_x_out_1_qv_tpl),
        .out_2_qc_tpl(VFFT_cunroll_x_out_2_qc_tpl),
        .out_3_qsize_tpl(VFFT_cunroll_x_out_3_qsize_tpl),
        .out_4_imag_q_tpl(VFFT_cunroll_x_out_4_imag_q_tpl),
        .out_4_real_q_tpl(VFFT_cunroll_x_out_4_real_q_tpl),
        .out_5_qBWby10_tpl(VFFT_cunroll_x_out_5_qBWby10_tpl),
        .out_6_Tref_tpl(VFFT_cunroll_x_out_6_Tref_tpl),
        .clk(clk),
        .areset(areset)
    );

    // ScaleAndSelect_cunroll_x(BLACKBOX,5)
    prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect theScaleAndSelect_cunroll_x (
        .in_1_vin_tpl(VFFT_cunroll_x_out_1_qv_tpl),
        .in_2_chin_tpl(VFFT_cunroll_x_out_2_qc_tpl),
        .in_3_FFTSize_tpl(VFFT_cunroll_x_out_3_qsize_tpl),
        .in_4_imag_d_tpl(VFFT_cunroll_x_out_4_imag_q_tpl),
        .in_4_real_d_tpl(VFFT_cunroll_x_out_4_real_q_tpl),
        .in_5_BWby10_tpl(VFFT_cunroll_x_out_5_qBWby10_tpl),
        .in_6_TimeReference_tpl(VFFT_cunroll_x_out_6_Tref_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl(in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl(in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl),
        .out_1_qv_tpl(ScaleAndSelect_cunroll_x_out_1_qv_tpl),
        .out_2_qch_tpl(ScaleAndSelect_cunroll_x_out_2_qch_tpl),
        .out_3_imag_q_tpl(ScaleAndSelect_cunroll_x_out_3_imag_q_tpl),
        .out_3_real_q_tpl(ScaleAndSelect_cunroll_x_out_3_real_q_tpl),
        .out_4_qv139_tpl(ScaleAndSelect_cunroll_x_out_4_qv139_tpl),
        .out_5_FreqBinIdx_tpl(ScaleAndSelect_cunroll_x_out_5_FreqBinIdx_tpl),
        .out_6_vout_FFTshift_tpl(ScaleAndSelect_cunroll_x_out_6_vout_FFTshift_tpl),
        .out_7_cout_FFTshift_tpl(ScaleAndSelect_cunroll_x_out_7_cout_FFTshift_tpl),
        .out_8_imag_dout_FFTshift_tpl(ScaleAndSelect_cunroll_x_out_8_imag_dout_FFTshift_tpl),
        .out_8_real_dout_FFTshift_tpl(ScaleAndSelect_cunroll_x_out_8_real_dout_FFTshift_tpl),
        .out_9_Tref_tpl(ScaleAndSelect_cunroll_x_out_9_Tref_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_1_qv_tpl(GPOUT,37)
    assign out_1_qv_tpl = ScaleAndSelect_cunroll_x_out_1_qv_tpl;

    // out_2_qch_tpl(GPOUT,38)
    assign out_2_qch_tpl = ScaleAndSelect_cunroll_x_out_2_qch_tpl;

    // out_3_imag_q_tpl(GPOUT,39)
    assign out_3_imag_q_tpl = ScaleAndSelect_cunroll_x_out_3_imag_q_tpl;

    // out_3_real_q_tpl(GPOUT,40)
    assign out_3_real_q_tpl = ScaleAndSelect_cunroll_x_out_3_real_q_tpl;

    // out_4_qv139_tpl(GPOUT,41)
    assign out_4_qv139_tpl = ScaleAndSelect_cunroll_x_out_4_qv139_tpl;

    // out_5_qFreqBinIdx_tpl(GPOUT,42)
    assign out_5_qFreqBinIdx_tpl = ScaleAndSelect_cunroll_x_out_5_FreqBinIdx_tpl;

    // out_6_fftShift_v_tpl(GPOUT,43)
    assign out_6_fftShift_v_tpl = ScaleAndSelect_cunroll_x_out_6_vout_FFTshift_tpl;

    // out_7_fftShift_c_tpl(GPOUT,44)
    assign out_7_fftShift_c_tpl = ScaleAndSelect_cunroll_x_out_7_cout_FFTshift_tpl;

    // out_8_imag_fftShift_d_tpl(GPOUT,45)
    assign out_8_imag_fftShift_d_tpl = ScaleAndSelect_cunroll_x_out_8_imag_dout_FFTshift_tpl;

    // out_8_real_fftShift_d_tpl(GPOUT,46)
    assign out_8_real_fftShift_d_tpl = ScaleAndSelect_cunroll_x_out_8_real_dout_FFTshift_tpl;

    // out_9_TimeReference_tpl(GPOUT,47)
    assign out_9_TimeReference_tpl = ScaleAndSelect_cunroll_x_out_9_Tref_tpl;

endmodule
