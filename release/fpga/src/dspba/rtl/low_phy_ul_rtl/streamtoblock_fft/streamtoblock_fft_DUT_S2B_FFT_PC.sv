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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    input wire [0:0] in_1_rx_vin1_tpl,
    input wire [7:0] in_2_rx_chin1_tpl,
    input wire [15:0] in_3_imag_rx_din1_tpl,
    input wire [15:0] in_3_real_rx_din1_tpl,
    input wire [3:0] in_4_fft_in1_tpl,
    input wire [15:0] in_5_cp_in1_tpl,
    input wire [15:0] in_6_nprb1_tpl,
    input wire [0:0] in_7_hcs_bypass_l1_tpl,
    input wire [15:0] in_8_fft_gain_l1_tpl,
    input wire [15:0] in_9_fft_gain_im_l1_tpl,
    input wire [3:0] in_10_fft_shift_l1_tpl,
    input wire [63:0] in_11_time_ref_in1_tpl,
    input wire [0:0] in_12_DC_SC_EN_tpl,
    input wire [0:0] in_13_CP_EN1_tpl,
    input wire [0:0] in_14_ripple_comp_en_tpl,
    input wire [0:0] in_15_rc_bw_sel_tpl,
    input wire [63:0] in_16_sym_metadata_in_tpl,
    input wire [0:0] in_17_sym_metadata_in_valid_tpl,
    input wire [31:0] in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl,
    input wire [0:0] in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl,
    input wire [31:0] in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl,
    input wire [0:0] in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl,
    input wire [15:0] in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    input wire [15:0] in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    output wire [0:0] out_1_rx_valid_tpl,
    output wire [7:0] out_2_rx_chout_tpl,
    output wire [15:0] out_3_imag_rx_dout_tpl,
    output wire [15:0] out_3_real_rx_dout_tpl,
    output wire [63:0] out_4_rx_time_out_tpl,
    output wire [0:0] out_5_td_fft_in_v_tpl,
    output wire [7:0] out_6_td_fft_in_chout_tpl,
    output wire [15:0] out_7_imag_td_fft_in_d_tpl,
    output wire [15:0] out_7_real_td_fft_in_d_tpl,
    output wire [15:0] out_8_nsc_out_tpl,
    output wire [3:0] out_9_size_out_tpl,
    output wire [63:0] out_10_td_time_out_tpl,
    output wire [0:0] out_11_fd_data_v_tpl,
    output wire [7:0] out_12_fd_data_c_tpl,
    output wire [15:0] out_13_imag_fd_data_q_tpl,
    output wire [15:0] out_13_real_fd_data_q_tpl,
    output wire [1:0] out_14_eAxCout_tpl,
    output wire [63:0] out_15_symmetadataout_tpl,
    output wire [0:0] out_16_eop_eAxC_tpl,
    output wire [0:0] out_17_eop_sym_tpl,
    output wire [0:0] out_18_sop_eAxC_tpl,
    output wire [0:0] out_19_sop_sym_tpl,
    output wire [11:0] out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    output wire [11:0] out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    output wire [15:0] out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    output wire [15:0] out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [63:0] Constant_rsrvd_fix_q;
    wire [31:0] FFT_S2B_cunroll_x_busOut_readdata;
    wire [0:0] FFT_S2B_cunroll_x_busOut_readdatavalid;
    wire [0:0] FFT_S2B_cunroll_x_out_1_rx_valid_tpl;
    wire [7:0] FFT_S2B_cunroll_x_out_2_rx_chout_tpl;
    wire [15:0] FFT_S2B_cunroll_x_out_3_imag_rx_dout_tpl;
    wire [15:0] FFT_S2B_cunroll_x_out_3_real_rx_dout_tpl;
    wire [63:0] FFT_S2B_cunroll_x_out_4_rx_time_out_tpl;
    wire [0:0] FFT_S2B_cunroll_x_out_5_td_fft_in_v_tpl;
    wire [7:0] FFT_S2B_cunroll_x_out_6_td_fft_in_ch_tpl;
    wire [15:0] FFT_S2B_cunroll_x_out_7_imag_td_fft_in_d_tpl;
    wire [15:0] FFT_S2B_cunroll_x_out_7_real_td_fft_in_d_tpl;
    wire [15:0] FFT_S2B_cunroll_x_out_8_nsc_out_tpl;
    wire [3:0] FFT_S2B_cunroll_x_out_9_size_out_tpl;
    wire [63:0] FFT_S2B_cunroll_x_out_10_td_time_out_tpl;
    wire [0:0] FFT_S2B_cunroll_x_out_11_fd_data_v_tpl;
    wire [7:0] FFT_S2B_cunroll_x_out_12_fd_data_c_tpl;
    wire [15:0] FFT_S2B_cunroll_x_out_13_imag_fd_data_q_tpl;
    wire [15:0] FFT_S2B_cunroll_x_out_13_real_fd_data_q_tpl;
    wire [1:0] FFT_S2B_cunroll_x_out_14_eAxC_tpl;
    wire [63:0] FFT_S2B_cunroll_x_out_15_metadata_sym_out_tpl;
    wire [11:0] FFT_S2B_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [11:0] FFT_S2B_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    wire [15:0] FFT_S2B_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [15:0] FFT_S2B_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    wire [15:0] PhaseCompensation_lite_cunroll_x_out_1_imag_dout1_tpl;
    wire [15:0] PhaseCompensation_lite_cunroll_x_out_1_real_dout1_tpl;
    wire [0:0] PhaseCompensation_lite_cunroll_x_out_2_vout_tpl;
    wire [7:0] PhaseCompensation_lite_cunroll_x_out_3_cout_tpl;
    wire [1:0] PhaseCompensation_lite_cunroll_x_out_7_eAxCout_tpl;
    wire [63:0] PhaseCompensation_lite_cunroll_x_out_8_sym_metadataout_tpl;
    wire [63:0] PhaseCompensation_lite_cunroll_x_out_9_timeref_out_tpl;
    wire [0:0] PhaseCompensation_lite_cunroll_x_out_10_eop_eAxC_tpl;
    wire [0:0] PhaseCompensation_lite_cunroll_x_out_11_eop_sym_tpl;
    wire [0:0] PhaseCompensation_lite_cunroll_x_out_12_sop_eAxC_tpl;
    wire [0:0] PhaseCompensation_lite_cunroll_x_out_13_sop_sym_tpl;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // FFT_S2B_cunroll_x(BLACKBOX,8)
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B theFFT_S2B_cunroll_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_1_rx_vin1_tpl(in_1_rx_vin1_tpl),
        .in_2_imag_rx_din1_tpl(in_3_imag_rx_din1_tpl),
        .in_2_real_rx_din1_tpl(in_3_real_rx_din1_tpl),
        .in_3_fft_in1_tpl(in_4_fft_in1_tpl),
        .in_4_cp_in1_tpl(in_5_cp_in1_tpl),
        .in_5_nprb1_tpl(in_6_nprb1_tpl),
        .in_6_hcs_bypass_l1_tpl(in_7_hcs_bypass_l1_tpl),
        .in_7_fft_gain_re_l1_tpl(in_8_fft_gain_l1_tpl),
        .in_8_fft_gain_im_l1_tpl(in_9_fft_gain_im_l1_tpl),
        .in_9_fft_shift_l1_tpl(in_10_fft_shift_l1_tpl),
        .in_10_time_in1_tpl(in_11_time_ref_in1_tpl),
        .in_11_DC_SC_EN_tpl(in_12_DC_SC_EN_tpl),
        .in_12_rx_ch_in_tpl(in_2_rx_chin1_tpl),
        .in_13_ripple_comp_en_tpl(in_14_ripple_comp_en_tpl),
        .in_14_rc_bw_sel_tpl(in_15_rc_bw_sel_tpl),
        .in_15_sym_metadata_in_tpl(in_16_sym_metadata_in_tpl),
        .in_16_sym_metadata_in_valid_tpl(in_17_sym_metadata_in_valid_tpl),
        .in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .busOut_readdata(FFT_S2B_cunroll_x_busOut_readdata),
        .busOut_readdatavalid(FFT_S2B_cunroll_x_busOut_readdatavalid),
        .out_1_rx_valid_tpl(FFT_S2B_cunroll_x_out_1_rx_valid_tpl),
        .out_2_rx_chout_tpl(FFT_S2B_cunroll_x_out_2_rx_chout_tpl),
        .out_3_imag_rx_dout_tpl(FFT_S2B_cunroll_x_out_3_imag_rx_dout_tpl),
        .out_3_real_rx_dout_tpl(FFT_S2B_cunroll_x_out_3_real_rx_dout_tpl),
        .out_4_rx_time_out_tpl(FFT_S2B_cunroll_x_out_4_rx_time_out_tpl),
        .out_5_td_fft_in_v_tpl(FFT_S2B_cunroll_x_out_5_td_fft_in_v_tpl),
        .out_6_td_fft_in_ch_tpl(FFT_S2B_cunroll_x_out_6_td_fft_in_ch_tpl),
        .out_7_imag_td_fft_in_d_tpl(FFT_S2B_cunroll_x_out_7_imag_td_fft_in_d_tpl),
        .out_7_real_td_fft_in_d_tpl(FFT_S2B_cunroll_x_out_7_real_td_fft_in_d_tpl),
        .out_8_nsc_out_tpl(FFT_S2B_cunroll_x_out_8_nsc_out_tpl),
        .out_9_size_out_tpl(FFT_S2B_cunroll_x_out_9_size_out_tpl),
        .out_10_td_time_out_tpl(FFT_S2B_cunroll_x_out_10_td_time_out_tpl),
        .out_11_fd_data_v_tpl(FFT_S2B_cunroll_x_out_11_fd_data_v_tpl),
        .out_12_fd_data_c_tpl(FFT_S2B_cunroll_x_out_12_fd_data_c_tpl),
        .out_13_imag_fd_data_q_tpl(FFT_S2B_cunroll_x_out_13_imag_fd_data_q_tpl),
        .out_13_real_fd_data_q_tpl(FFT_S2B_cunroll_x_out_13_real_fd_data_q_tpl),
        .out_14_eAxC_tpl(FFT_S2B_cunroll_x_out_14_eAxC_tpl),
        .out_15_metadata_sym_out_tpl(FFT_S2B_cunroll_x_out_15_metadata_sym_out_tpl),
        .out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(FFT_S2B_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(FFT_S2B_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(FFT_S2B_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(FFT_S2B_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // busOut(BUSOUT,4)
    assign busOut_readdatavalid = FFT_S2B_cunroll_x_busOut_readdatavalid;
    assign busOut_readdata = FFT_S2B_cunroll_x_busOut_readdata;

    // Constant_rsrvd_fix(FLOATCONSTANT,2)
    assign Constant_rsrvd_fix_q = $unsigned(64'b0000000000000000000000000000000000000000000000000000000000000000);

    // PhaseCompensation_lite_cunroll_x(BLACKBOX,9)
    streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite thePhaseCompensation_lite_cunroll_x (
        .in_1_v_tpl(FFT_S2B_cunroll_x_out_1_rx_valid_tpl),
        .in_2_c_tpl(FFT_S2B_cunroll_x_out_2_rx_chout_tpl),
        .in_3_imag_d1_tpl(FFT_S2B_cunroll_x_out_3_imag_rx_dout_tpl),
        .in_3_real_d1_tpl(FFT_S2B_cunroll_x_out_3_real_rx_dout_tpl),
        .in_4_CP_EN1_tpl(in_13_CP_EN1_tpl),
        .in_5_fft_size_tpl(Constant_rsrvd_fix_q),
        .in_6_CPLen_tpl(Constant_rsrvd_fix_q),
        .in_7_nsc_tpl(Constant_rsrvd_fix_q),
        .in_8_eAxC_tpl(FFT_S2B_cunroll_x_out_14_eAxC_tpl),
        .in_9_sym_metadata_tpl(FFT_S2B_cunroll_x_out_15_metadata_sym_out_tpl),
        .in_10_timerefin_tpl(FFT_S2B_cunroll_x_out_4_rx_time_out_tpl),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl(in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl(in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl(in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl(in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl),
        .out_1_imag_dout1_tpl(PhaseCompensation_lite_cunroll_x_out_1_imag_dout1_tpl),
        .out_1_real_dout1_tpl(PhaseCompensation_lite_cunroll_x_out_1_real_dout1_tpl),
        .out_2_vout_tpl(PhaseCompensation_lite_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(PhaseCompensation_lite_cunroll_x_out_3_cout_tpl),
        .out_4_fft_size_out_tpl(),
        .out_5_CPLenout_tpl(),
        .out_6_nsc_out_tpl(),
        .out_7_eAxCout_tpl(PhaseCompensation_lite_cunroll_x_out_7_eAxCout_tpl),
        .out_8_sym_metadataout_tpl(PhaseCompensation_lite_cunroll_x_out_8_sym_metadataout_tpl),
        .out_9_timeref_out_tpl(PhaseCompensation_lite_cunroll_x_out_9_timeref_out_tpl),
        .out_10_eop_eAxC_tpl(PhaseCompensation_lite_cunroll_x_out_10_eop_eAxC_tpl),
        .out_11_eop_sym_tpl(PhaseCompensation_lite_cunroll_x_out_11_eop_sym_tpl),
        .out_12_sop_eAxC_tpl(PhaseCompensation_lite_cunroll_x_out_12_sop_eAxC_tpl),
        .out_13_sop_sym_tpl(PhaseCompensation_lite_cunroll_x_out_13_sop_sym_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_1_rx_valid_tpl(GPOUT,34)
    assign out_1_rx_valid_tpl = PhaseCompensation_lite_cunroll_x_out_2_vout_tpl;

    // out_2_rx_chout_tpl(GPOUT,35)
    assign out_2_rx_chout_tpl = PhaseCompensation_lite_cunroll_x_out_3_cout_tpl;

    // out_3_imag_rx_dout_tpl(GPOUT,36)
    assign out_3_imag_rx_dout_tpl = PhaseCompensation_lite_cunroll_x_out_1_imag_dout1_tpl;

    // out_3_real_rx_dout_tpl(GPOUT,37)
    assign out_3_real_rx_dout_tpl = PhaseCompensation_lite_cunroll_x_out_1_real_dout1_tpl;

    // out_4_rx_time_out_tpl(GPOUT,38)
    assign out_4_rx_time_out_tpl = PhaseCompensation_lite_cunroll_x_out_9_timeref_out_tpl;

    // out_5_td_fft_in_v_tpl(GPOUT,39)
    assign out_5_td_fft_in_v_tpl = FFT_S2B_cunroll_x_out_5_td_fft_in_v_tpl;

    // out_6_td_fft_in_chout_tpl(GPOUT,40)
    assign out_6_td_fft_in_chout_tpl = FFT_S2B_cunroll_x_out_6_td_fft_in_ch_tpl;

    // out_7_imag_td_fft_in_d_tpl(GPOUT,41)
    assign out_7_imag_td_fft_in_d_tpl = FFT_S2B_cunroll_x_out_7_imag_td_fft_in_d_tpl;

    // out_7_real_td_fft_in_d_tpl(GPOUT,42)
    assign out_7_real_td_fft_in_d_tpl = FFT_S2B_cunroll_x_out_7_real_td_fft_in_d_tpl;

    // out_8_nsc_out_tpl(GPOUT,43)
    assign out_8_nsc_out_tpl = FFT_S2B_cunroll_x_out_8_nsc_out_tpl;

    // out_9_size_out_tpl(GPOUT,44)
    assign out_9_size_out_tpl = FFT_S2B_cunroll_x_out_9_size_out_tpl;

    // out_10_td_time_out_tpl(GPOUT,45)
    assign out_10_td_time_out_tpl = FFT_S2B_cunroll_x_out_10_td_time_out_tpl;

    // out_11_fd_data_v_tpl(GPOUT,46)
    assign out_11_fd_data_v_tpl = FFT_S2B_cunroll_x_out_11_fd_data_v_tpl;

    // out_12_fd_data_c_tpl(GPOUT,47)
    assign out_12_fd_data_c_tpl = FFT_S2B_cunroll_x_out_12_fd_data_c_tpl;

    // out_13_imag_fd_data_q_tpl(GPOUT,48)
    assign out_13_imag_fd_data_q_tpl = FFT_S2B_cunroll_x_out_13_imag_fd_data_q_tpl;

    // out_13_real_fd_data_q_tpl(GPOUT,49)
    assign out_13_real_fd_data_q_tpl = FFT_S2B_cunroll_x_out_13_real_fd_data_q_tpl;

    // out_14_eAxCout_tpl(GPOUT,50)
    assign out_14_eAxCout_tpl = PhaseCompensation_lite_cunroll_x_out_7_eAxCout_tpl;

    // out_15_symmetadataout_tpl(GPOUT,51)
    assign out_15_symmetadataout_tpl = PhaseCompensation_lite_cunroll_x_out_8_sym_metadataout_tpl;

    // out_16_eop_eAxC_tpl(GPOUT,52)
    assign out_16_eop_eAxC_tpl = PhaseCompensation_lite_cunroll_x_out_10_eop_eAxC_tpl;

    // out_17_eop_sym_tpl(GPOUT,53)
    assign out_17_eop_sym_tpl = PhaseCompensation_lite_cunroll_x_out_11_eop_sym_tpl;

    // out_18_sop_eAxC_tpl(GPOUT,54)
    assign out_18_sop_eAxC_tpl = PhaseCompensation_lite_cunroll_x_out_12_sop_eAxC_tpl;

    // out_19_sop_sym_tpl(GPOUT,55)
    assign out_19_sop_sym_tpl = PhaseCompensation_lite_cunroll_x_out_13_sop_sym_tpl;

    // out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(GPOUT,56)
    assign out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl = FFT_S2B_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;

    // out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(GPOUT,57)
    assign out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl = FFT_S2B_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;

    // out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(GPOUT,58)
    assign out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl = FFT_S2B_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;

    // out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(GPOUT,59)
    assign out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl = FFT_S2B_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;

endmodule
