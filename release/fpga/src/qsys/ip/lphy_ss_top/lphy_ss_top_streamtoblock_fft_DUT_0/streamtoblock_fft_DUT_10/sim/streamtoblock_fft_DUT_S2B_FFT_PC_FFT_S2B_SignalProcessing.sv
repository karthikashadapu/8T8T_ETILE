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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    input wire [0:0] in_1_fft_v_in_tpl,
    input wire [7:0] in_2_cin_tpl,
    input wire [15:0] in_3_imag_din_tpl,
    input wire [15:0] in_3_real_din_tpl,
    input wire [0:0] in_4_sync_tpl,
    input wire [15:0] in_5_nsc_tpl,
    input wire [3:0] in_6_size_tpl,
    input wire [63:0] in_7_SFNin_tpl,
    input wire [15:0] in_8_fft_gain_re_tpl,
    input wire [15:0] in_9_fft_gain_im_tpl,
    input wire [0:0] in_10_hcs_bypass_tpl,
    input wire [3:0] in_11_fft_shift_tpl,
    input wire [0:0] in_12_DC_SC_EN_tpl,
    input wire [0:0] in_13_ripple_comp_en_tpl,
    input wire [0:0] in_14_rc_bw_sel_tpl,
    input wire [1:0] in_15_eAxc_tpl,
    input wire [63:0] in_16_sym_metadata_tpl,
    input wire [15:0] in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    input wire [15:0] in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    output wire [0:0] out_1_rxnat_vout_tpl,
    output wire [7:0] out_2_rxnat_chout_tpl,
    output wire [15:0] out_3_imag_rxnat_dout_tpl,
    output wire [15:0] out_3_real_rxnat_dout_tpl,
    output wire [63:0] out_4_rx_time_out_tpl,
    output wire [0:0] out_5_td_fft_in_v_tpl,
    output wire [7:0] out_6_td_fft_in_ch_tpl,
    output wire [15:0] out_7_imag_td_fft_in_d_tpl,
    output wire [15:0] out_7_real_td_fft_in_d_tpl,
    output wire [15:0] out_8_nsc_out_tpl,
    output wire [3:0] out_9_size_out_tpl,
    output wire [63:0] out_10_td_time_out_tpl,
    output wire [0:0] out_11_fd_v_tpl,
    output wire [7:0] out_12_fd_c_tpl,
    output wire [15:0] out_13_imag_fd_q_tpl,
    output wire [15:0] out_13_real_fd_q_tpl,
    output wire [1:0] out_14_eAxC_tpl,
    output wire [63:0] out_15_metadata_sym_out_tpl,
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
    wire [0:0] BRandSCSelect1_cunroll_x_out_1_qv_tpl;
    wire [7:0] BRandSCSelect1_cunroll_x_out_2_qc_tpl;
    wire [15:0] BRandSCSelect1_cunroll_x_out_3_imag_q_tpl;
    wire [15:0] BRandSCSelect1_cunroll_x_out_3_real_q_tpl;
    wire [63:0] BRandSCSelect1_cunroll_x_out_5_time_out_tpl;
    wire [1:0] BRandSCSelect1_cunroll_x_out_6_eAxC_out_tpl;
    wire [63:0] BRandSCSelect1_cunroll_x_out_7_meatadata_sym_out_tpl;
    wire [11:0] BRandSCSelect1_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [11:0] BRandSCSelect1_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    wire [15:0] BRandSCSelect1_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [15:0] BRandSCSelect1_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    wire [31:0] HCShift_cunroll_x_busOut_readdata;
    wire [0:0] HCShift_cunroll_x_busOut_readdatavalid;
    wire [0:0] HCShift_cunroll_x_out_1_vout_tpl;
    wire [7:0] HCShift_cunroll_x_out_2_cout_tpl;
    wire [16:0] HCShift_cunroll_x_out_3_imag_dout_tpl;
    wire [16:0] HCShift_cunroll_x_out_3_real_dout_tpl;
    wire [15:0] HCShift_cunroll_x_out_4_nsc_out_tpl;
    wire [3:0] HCShift_cunroll_x_out_5_size_out_tpl;
    wire [63:0] HCShift_cunroll_x_out_6_SFNout_tpl;
    wire [1:0] HCShift_cunroll_x_out_7_eAxC_out_tpl;
    wire [63:0] HCShift_cunroll_x_out_8_sym_metadataout_tpl;
    wire [0:0] RXGainComp_cunroll_x_out_1_vout_tpl;
    wire [7:0] RXGainComp_cunroll_x_out_2_chout_tpl;
    wire [15:0] RXGainComp_cunroll_x_out_3_imag_dout_tpl;
    wire [15:0] RXGainComp_cunroll_x_out_3_real_dout_tpl;
    wire [15:0] RXGainComp_cunroll_x_out_4_nsc_out_tpl;
    wire [3:0] RXGainComp_cunroll_x_out_5_size_out_tpl;
    wire [63:0] RXGainComp_cunroll_x_out_6_time_out_tpl;
    wire [1:0] RXGainComp_cunroll_x_out_7_eAxC_out_tpl;
    wire [63:0] RXGainComp_cunroll_x_out_8_sym_metadata_out_tpl;
    wire [0:0] RXScaling_cunroll_x_out_1_vout_tpl;
    wire [7:0] RXScaling_cunroll_x_out_2_chout_tpl;
    wire [15:0] RXScaling_cunroll_x_out_3_imag_dout_tpl;
    wire [15:0] RXScaling_cunroll_x_out_3_real_dout_tpl;
    wire [3:0] RXScaling_cunroll_x_out_4_size_out_tpl;
    wire [15:0] RXScaling_cunroll_x_out_5_nsc_out_tpl;
    wire [63:0] RXScaling_cunroll_x_out_6_time_out_tpl;
    wire [1:0] RXScaling_cunroll_x_out_7_eAxCout_tpl;
    wire [63:0] RXScaling_cunroll_x_out_8_sym_metadataout_tpl;
    wire [0:0] VFFT_btb_cunroll_x_out_1_qv_tpl;
    wire [7:0] VFFT_btb_cunroll_x_out_2_qc_tpl;
    wire [3:0] VFFT_btb_cunroll_x_out_5_qsize_tpl;
    wire [28:0] VFFT_btb_cunroll_x_out_6_imag_q_tpl;
    wire [28:0] VFFT_btb_cunroll_x_out_6_real_q_tpl;
    wire [15:0] VFFT_btb_cunroll_x_out_7_qnsc_tpl;
    wire [63:0] VFFT_btb_cunroll_x_out_8_time_out_tpl;
    wire [1:0] VFFT_btb_cunroll_x_out_9_eAxC_tpl;
    wire [63:0] VFFT_btb_cunroll_x_out_10_metadata_sym_tpl;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // HCShift_cunroll_x(BLACKBOX,8)
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift theHCShift_cunroll_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_1_vin_tpl(in_1_fft_v_in_tpl),
        .in_2_cin_tpl(in_2_cin_tpl),
        .in_3_imag_din_tpl(in_3_imag_din_tpl),
        .in_3_real_din_tpl(in_3_real_din_tpl),
        .in_4_sync_tpl(in_4_sync_tpl),
        .in_5_size_tpl(in_6_size_tpl),
        .in_6_nsc_tpl(in_5_nsc_tpl),
        .in_7_hcs_bypass_tpl(in_10_hcs_bypass_tpl),
        .in_8_SFNin_tpl(in_7_SFNin_tpl),
        .in_9_eAxC_tpl(in_15_eAxc_tpl),
        .in_10_sym_metadata_tpl(in_16_sym_metadata_tpl),
        .busOut_readdata(HCShift_cunroll_x_busOut_readdata),
        .busOut_readdatavalid(HCShift_cunroll_x_busOut_readdatavalid),
        .out_1_vout_tpl(HCShift_cunroll_x_out_1_vout_tpl),
        .out_2_cout_tpl(HCShift_cunroll_x_out_2_cout_tpl),
        .out_3_imag_dout_tpl(HCShift_cunroll_x_out_3_imag_dout_tpl),
        .out_3_real_dout_tpl(HCShift_cunroll_x_out_3_real_dout_tpl),
        .out_4_nsc_out_tpl(HCShift_cunroll_x_out_4_nsc_out_tpl),
        .out_5_size_out_tpl(HCShift_cunroll_x_out_5_size_out_tpl),
        .out_6_SFNout_tpl(HCShift_cunroll_x_out_6_SFNout_tpl),
        .out_7_eAxC_out_tpl(HCShift_cunroll_x_out_7_eAxC_out_tpl),
        .out_8_sym_metadataout_tpl(HCShift_cunroll_x_out_8_sym_metadataout_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = HCShift_cunroll_x_busOut_readdatavalid;
    assign busOut_readdata = HCShift_cunroll_x_busOut_readdata;

    // RXGainComp_cunroll_x(BLACKBOX,9)
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXGainComp theRXGainComp_cunroll_x (
        .in_1_vin_tpl(HCShift_cunroll_x_out_1_vout_tpl),
        .in_2_chin_tpl(HCShift_cunroll_x_out_2_cout_tpl),
        .in_3_imag_din_tpl(HCShift_cunroll_x_out_3_imag_dout_tpl),
        .in_3_real_din_tpl(HCShift_cunroll_x_out_3_real_dout_tpl),
        .in_4_nsc_tpl(HCShift_cunroll_x_out_4_nsc_out_tpl),
        .in_5_size_tpl(HCShift_cunroll_x_out_5_size_out_tpl),
        .in_6_fft_gain_re_tpl(in_8_fft_gain_re_tpl),
        .in_7_fft_gain_im_tpl(in_9_fft_gain_im_tpl),
        .in_8_time_in_tpl(HCShift_cunroll_x_out_6_SFNout_tpl),
        .in_9_eAxC_tpl(HCShift_cunroll_x_out_7_eAxC_out_tpl),
        .in_10_sym_metadata_tpl(HCShift_cunroll_x_out_8_sym_metadataout_tpl),
        .out_1_vout_tpl(RXGainComp_cunroll_x_out_1_vout_tpl),
        .out_2_chout_tpl(RXGainComp_cunroll_x_out_2_chout_tpl),
        .out_3_imag_dout_tpl(RXGainComp_cunroll_x_out_3_imag_dout_tpl),
        .out_3_real_dout_tpl(RXGainComp_cunroll_x_out_3_real_dout_tpl),
        .out_4_nsc_out_tpl(RXGainComp_cunroll_x_out_4_nsc_out_tpl),
        .out_5_size_out_tpl(RXGainComp_cunroll_x_out_5_size_out_tpl),
        .out_6_time_out_tpl(RXGainComp_cunroll_x_out_6_time_out_tpl),
        .out_7_eAxC_out_tpl(RXGainComp_cunroll_x_out_7_eAxC_out_tpl),
        .out_8_sym_metadata_out_tpl(RXGainComp_cunroll_x_out_8_sym_metadata_out_tpl),
        .clk(clk),
        .areset(areset)
    );

    // VFFT_btb_cunroll_x(BLACKBOX,11)
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb theVFFT_btb_cunroll_x (
        .in_1_v_tpl(RXGainComp_cunroll_x_out_1_vout_tpl),
        .in_2_c_tpl(RXGainComp_cunroll_x_out_2_chout_tpl),
        .in_3_sop_tpl(RXGainComp_cunroll_x_out_1_vout_tpl),
        .in_4_imag_d_tpl(RXGainComp_cunroll_x_out_3_imag_dout_tpl),
        .in_4_real_d_tpl(RXGainComp_cunroll_x_out_3_real_dout_tpl),
        .in_5_nsc_tpl(RXGainComp_cunroll_x_out_4_nsc_out_tpl),
        .in_6_size_tpl(RXGainComp_cunroll_x_out_5_size_out_tpl),
        .in_7_time_in_tpl(RXGainComp_cunroll_x_out_6_time_out_tpl),
        .in_8_eAxC_no_tpl(RXGainComp_cunroll_x_out_7_eAxC_out_tpl),
        .in_9_sym_metadata_tpl(RXGainComp_cunroll_x_out_8_sym_metadata_out_tpl),
        .out_1_qv_tpl(VFFT_btb_cunroll_x_out_1_qv_tpl),
        .out_2_qc_tpl(VFFT_btb_cunroll_x_out_2_qc_tpl),
        .out_3_qsop_tpl(),
        .out_4_qeop_tpl(),
        .out_5_qsize_tpl(VFFT_btb_cunroll_x_out_5_qsize_tpl),
        .out_6_imag_q_tpl(VFFT_btb_cunroll_x_out_6_imag_q_tpl),
        .out_6_real_q_tpl(VFFT_btb_cunroll_x_out_6_real_q_tpl),
        .out_7_qnsc_tpl(VFFT_btb_cunroll_x_out_7_qnsc_tpl),
        .out_8_time_out_tpl(VFFT_btb_cunroll_x_out_8_time_out_tpl),
        .out_9_eAxC_tpl(VFFT_btb_cunroll_x_out_9_eAxC_tpl),
        .out_10_metadata_sym_tpl(VFFT_btb_cunroll_x_out_10_metadata_sym_tpl),
        .clk(clk),
        .areset(areset)
    );

    // RXScaling_cunroll_x(BLACKBOX,10)
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling theRXScaling_cunroll_x (
        .in_1_vin_tpl(VFFT_btb_cunroll_x_out_1_qv_tpl),
        .in_2_chin_tpl(VFFT_btb_cunroll_x_out_2_qc_tpl),
        .in_3_size_tpl(VFFT_btb_cunroll_x_out_5_qsize_tpl),
        .in_4_imag_din_tpl(VFFT_btb_cunroll_x_out_6_imag_q_tpl),
        .in_4_real_din_tpl(VFFT_btb_cunroll_x_out_6_real_q_tpl),
        .in_5_nsc_tpl(VFFT_btb_cunroll_x_out_7_qnsc_tpl),
        .in_6_fft_shift_tpl(in_11_fft_shift_tpl),
        .in_7_time_in_tpl(VFFT_btb_cunroll_x_out_8_time_out_tpl),
        .in_8_eAxC_tpl(VFFT_btb_cunroll_x_out_9_eAxC_tpl),
        .in_9_sym_metadata_tpl(VFFT_btb_cunroll_x_out_10_metadata_sym_tpl),
        .out_1_vout_tpl(RXScaling_cunroll_x_out_1_vout_tpl),
        .out_2_chout_tpl(RXScaling_cunroll_x_out_2_chout_tpl),
        .out_3_imag_dout_tpl(RXScaling_cunroll_x_out_3_imag_dout_tpl),
        .out_3_real_dout_tpl(RXScaling_cunroll_x_out_3_real_dout_tpl),
        .out_4_size_out_tpl(RXScaling_cunroll_x_out_4_size_out_tpl),
        .out_5_nsc_out_tpl(RXScaling_cunroll_x_out_5_nsc_out_tpl),
        .out_6_time_out_tpl(RXScaling_cunroll_x_out_6_time_out_tpl),
        .out_7_eAxCout_tpl(RXScaling_cunroll_x_out_7_eAxCout_tpl),
        .out_8_sym_metadataout_tpl(RXScaling_cunroll_x_out_8_sym_metadataout_tpl),
        .clk(clk),
        .areset(areset)
    );

    // BRandSCSelect1_cunroll_x(BLACKBOX,5)
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1 theBRandSCSelect1_cunroll_x (
        .in_1_v_tpl(RXScaling_cunroll_x_out_1_vout_tpl),
        .in_2_c_tpl(RXScaling_cunroll_x_out_2_chout_tpl),
        .in_3_imag_x_tpl(RXScaling_cunroll_x_out_3_imag_dout_tpl),
        .in_3_real_x_tpl(RXScaling_cunroll_x_out_3_real_dout_tpl),
        .in_4_FFTSize_tpl(RXScaling_cunroll_x_out_4_size_out_tpl),
        .in_5_NSubCarr_tpl(RXScaling_cunroll_x_out_5_nsc_out_tpl),
        .in_6_time_in_tpl(RXScaling_cunroll_x_out_6_time_out_tpl),
        .in_7_DC_SC_EN_tpl(in_12_DC_SC_EN_tpl),
        .in_8_ripple_comp_en_tpl(in_13_ripple_comp_en_tpl),
        .in_9_rc_bw_sel_tpl(in_14_rc_bw_sel_tpl),
        .in_10_eAxC_tpl(RXScaling_cunroll_x_out_7_eAxCout_tpl),
        .in_11_metadata_in_tpl(RXScaling_cunroll_x_out_8_sym_metadataout_tpl),
        .in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .out_1_qv_tpl(BRandSCSelect1_cunroll_x_out_1_qv_tpl),
        .out_2_qc_tpl(BRandSCSelect1_cunroll_x_out_2_qc_tpl),
        .out_3_imag_q_tpl(BRandSCSelect1_cunroll_x_out_3_imag_q_tpl),
        .out_3_real_q_tpl(BRandSCSelect1_cunroll_x_out_3_real_q_tpl),
        .out_4_qsizeout_tpl(),
        .out_5_time_out_tpl(BRandSCSelect1_cunroll_x_out_5_time_out_tpl),
        .out_6_eAxC_out_tpl(BRandSCSelect1_cunroll_x_out_6_eAxC_out_tpl),
        .out_7_meatadata_sym_out_tpl(BRandSCSelect1_cunroll_x_out_7_meatadata_sym_out_tpl),
        .out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(BRandSCSelect1_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(BRandSCSelect1_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(BRandSCSelect1_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(BRandSCSelect1_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_1_rxnat_vout_tpl(GPOUT,31)
    assign out_1_rxnat_vout_tpl = BRandSCSelect1_cunroll_x_out_1_qv_tpl;

    // out_2_rxnat_chout_tpl(GPOUT,32)
    assign out_2_rxnat_chout_tpl = BRandSCSelect1_cunroll_x_out_2_qc_tpl;

    // out_3_imag_rxnat_dout_tpl(GPOUT,33)
    assign out_3_imag_rxnat_dout_tpl = BRandSCSelect1_cunroll_x_out_3_imag_q_tpl;

    // out_3_real_rxnat_dout_tpl(GPOUT,34)
    assign out_3_real_rxnat_dout_tpl = BRandSCSelect1_cunroll_x_out_3_real_q_tpl;

    // out_4_rx_time_out_tpl(GPOUT,35)
    assign out_4_rx_time_out_tpl = BRandSCSelect1_cunroll_x_out_5_time_out_tpl;

    // out_5_td_fft_in_v_tpl(GPOUT,36)
    assign out_5_td_fft_in_v_tpl = RXGainComp_cunroll_x_out_1_vout_tpl;

    // out_6_td_fft_in_ch_tpl(GPOUT,37)
    assign out_6_td_fft_in_ch_tpl = RXGainComp_cunroll_x_out_2_chout_tpl;

    // out_7_imag_td_fft_in_d_tpl(GPOUT,38)
    assign out_7_imag_td_fft_in_d_tpl = RXGainComp_cunroll_x_out_3_imag_dout_tpl;

    // out_7_real_td_fft_in_d_tpl(GPOUT,39)
    assign out_7_real_td_fft_in_d_tpl = RXGainComp_cunroll_x_out_3_real_dout_tpl;

    // out_8_nsc_out_tpl(GPOUT,40)
    assign out_8_nsc_out_tpl = RXGainComp_cunroll_x_out_4_nsc_out_tpl;

    // out_9_size_out_tpl(GPOUT,41)
    assign out_9_size_out_tpl = RXGainComp_cunroll_x_out_5_size_out_tpl;

    // out_10_td_time_out_tpl(GPOUT,42)
    assign out_10_td_time_out_tpl = RXGainComp_cunroll_x_out_6_time_out_tpl;

    // out_11_fd_v_tpl(GPOUT,43)
    assign out_11_fd_v_tpl = RXScaling_cunroll_x_out_1_vout_tpl;

    // out_12_fd_c_tpl(GPOUT,44)
    assign out_12_fd_c_tpl = RXScaling_cunroll_x_out_2_chout_tpl;

    // out_13_imag_fd_q_tpl(GPOUT,45)
    assign out_13_imag_fd_q_tpl = RXScaling_cunroll_x_out_3_imag_dout_tpl;

    // out_13_real_fd_q_tpl(GPOUT,46)
    assign out_13_real_fd_q_tpl = RXScaling_cunroll_x_out_3_real_dout_tpl;

    // out_14_eAxC_tpl(GPOUT,47)
    assign out_14_eAxC_tpl = BRandSCSelect1_cunroll_x_out_6_eAxC_out_tpl;

    // out_15_metadata_sym_out_tpl(GPOUT,48)
    assign out_15_metadata_sym_out_tpl = BRandSCSelect1_cunroll_x_out_7_meatadata_sym_out_tpl;

    // out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(GPOUT,49)
    assign out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl = BRandSCSelect1_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;

    // out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(GPOUT,50)
    assign out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl = BRandSCSelect1_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;

    // out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(GPOUT,51)
    assign out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl = BRandSCSelect1_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;

    // out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(GPOUT,52)
    assign out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl = BRandSCSelect1_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;

endmodule
