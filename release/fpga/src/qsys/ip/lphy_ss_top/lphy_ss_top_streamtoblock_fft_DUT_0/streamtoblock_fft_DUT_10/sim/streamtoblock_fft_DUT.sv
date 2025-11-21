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

// SystemVerilog created from streamtoblock_fft_DUT
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [0:0] rx_vin_s,
    input wire [7:0] rx_chin_s,
    input wire [15:0] rx_din_im,
    input wire [15:0] rx_din_re,
    input wire [3:0] fft_in_s,
    input wire [15:0] cp_in_s,
    input wire [15:0] nprb_s,
    input wire [0:0] hcs_bypass_s,
    input wire [15:0] fft_gain_s,
    input wire [15:0] fft_gain_im_s,
    input wire [3:0] fft_shift_s,
    input wire [63:0] time_ref_in_s,
    input wire [0:0] DC_SC_EN_s,
    input wire [0:0] CP_EN_s,
    input wire [0:0] ripple_comp_en_s,
    input wire [0:0] rc_bw_sel_s,
    input wire [63:0] sym_metadata_in_s,
    input wire [0:0] sym_metadata_in_valid_s,
    output wire [0:0] rx_valid_s,
    output wire [7:0] rx_chout_s,
    output wire [15:0] rx_dout_im,
    output wire [15:0] rx_dout_re,
    output wire [63:0] rx_time_out_s,
    output wire [0:0] fft_vout_s,
    output wire [7:0] fft_chout_s,
    output wire [15:0] fft_dout_im,
    output wire [15:0] fft_dout_re,
    output wire [15:0] nsc_out_s,
    output wire [3:0] size_out_s,
    output wire [63:0] td_time_out_s,
    output wire [0:0] fd_data_v_s,
    output wire [7:0] fd_data_c_s,
    output wire [15:0] fd_data_q_im,
    output wire [15:0] fd_data_q_re,
    output wire [1:0] eAxCout_s,
    output wire [63:0] symmetadataout_s,
    output wire [0:0] eop_eAxC_s,
    output wire [0:0] eop_sym_s,
    output wire [0:0] sop_eAxC_s,
    output wire [0:0] sop_sym_s,
    output wire [31:0] version_out1_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [31:0] busFabric_busOut_readdata;
    wire [0:0] busFabric_busOut_readdatavalid;
    wire [31:0] busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_RegField4_x_tpl;
    wire [31:0] busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl;
    wire [0:0] busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl;
    wire [31:0] busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl;
    wire [0:0] busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl;
    wire [15:0] busFabric_out_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [15:0] busFabric_out_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    reg [31:0] bus_selector_q;
    reg [0:0] bus_selector_v;
    wire [31:0] S2B_FFT_PC_cunroll_x_busOut_readdata;
    wire [0:0] S2B_FFT_PC_cunroll_x_busOut_readdatavalid;
    wire [0:0] S2B_FFT_PC_cunroll_x_out_1_rx_valid_tpl;
    wire [7:0] S2B_FFT_PC_cunroll_x_out_2_rx_chout_tpl;
    wire [15:0] S2B_FFT_PC_cunroll_x_out_3_imag_rx_dout_tpl;
    wire [15:0] S2B_FFT_PC_cunroll_x_out_3_real_rx_dout_tpl;
    wire [63:0] S2B_FFT_PC_cunroll_x_out_4_rx_time_out_tpl;
    wire [0:0] S2B_FFT_PC_cunroll_x_out_5_td_fft_in_v_tpl;
    wire [7:0] S2B_FFT_PC_cunroll_x_out_6_td_fft_in_chout_tpl;
    wire [15:0] S2B_FFT_PC_cunroll_x_out_7_imag_td_fft_in_d_tpl;
    wire [15:0] S2B_FFT_PC_cunroll_x_out_7_real_td_fft_in_d_tpl;
    wire [15:0] S2B_FFT_PC_cunroll_x_out_8_nsc_out_tpl;
    wire [3:0] S2B_FFT_PC_cunroll_x_out_9_size_out_tpl;
    wire [63:0] S2B_FFT_PC_cunroll_x_out_10_td_time_out_tpl;
    wire [0:0] S2B_FFT_PC_cunroll_x_out_11_fd_data_v_tpl;
    wire [7:0] S2B_FFT_PC_cunroll_x_out_12_fd_data_c_tpl;
    wire [15:0] S2B_FFT_PC_cunroll_x_out_13_imag_fd_data_q_tpl;
    wire [15:0] S2B_FFT_PC_cunroll_x_out_13_real_fd_data_q_tpl;
    wire [1:0] S2B_FFT_PC_cunroll_x_out_14_eAxCout_tpl;
    wire [63:0] S2B_FFT_PC_cunroll_x_out_15_symmetadataout_tpl;
    wire [0:0] S2B_FFT_PC_cunroll_x_out_16_eop_eAxC_tpl;
    wire [0:0] S2B_FFT_PC_cunroll_x_out_17_eop_sym_tpl;
    wire [0:0] S2B_FFT_PC_cunroll_x_out_18_sop_eAxC_tpl;
    wire [0:0] S2B_FFT_PC_cunroll_x_out_19_sop_sym_tpl;
    wire [11:0] S2B_FFT_PC_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [11:0] S2B_FFT_PC_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    wire [15:0] S2B_FFT_PC_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [15:0] S2B_FFT_PC_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_rdv_q;
    reg [31:0] streamtoblock_fft_DUT_S2B_FFT_PC_d_q;
    reg [0:0] streamtoblock_fft_DUT_readDelayed_q;
    reg [0:0] streamtoblock_fft_DUT_readDelayed_delay_0;
    reg [0:0] streamtoblock_fft_DUT_readDelayed_delay_1;
    reg [0:0] streamtoblock_fft_DUT_readDelayed_delay_2;
    wire [0:0] streamtoblock_fft_DUT_readDataValid_q;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // S2B_FFT_PC_cunroll_x(BLACKBOX,11)
    streamtoblock_fft_DUT_S2B_FFT_PC theS2B_FFT_PC_cunroll_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_1_rx_vin1_tpl(rx_vin_s),
        .in_2_rx_chin1_tpl(rx_chin_s),
        .in_3_imag_rx_din1_tpl(rx_din_im),
        .in_3_real_rx_din1_tpl(rx_din_re),
        .in_4_fft_in1_tpl(fft_in_s),
        .in_5_cp_in1_tpl(cp_in_s),
        .in_6_nprb1_tpl(nprb_s),
        .in_7_hcs_bypass_l1_tpl(hcs_bypass_s),
        .in_8_fft_gain_l1_tpl(fft_gain_s),
        .in_9_fft_gain_im_l1_tpl(fft_gain_im_s),
        .in_10_fft_shift_l1_tpl(fft_shift_s),
        .in_11_time_ref_in1_tpl(time_ref_in_s),
        .in_12_DC_SC_EN_tpl(DC_SC_EN_s),
        .in_13_CP_EN1_tpl(CP_EN_s),
        .in_14_ripple_comp_en_tpl(ripple_comp_en_s),
        .in_15_rc_bw_sel_tpl(rc_bw_sel_s),
        .in_16_sym_metadata_in_tpl(sym_metadata_in_s),
        .in_17_sym_metadata_in_valid_tpl(sym_metadata_in_valid_s),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl(busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl(busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl(busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl(busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl),
        .in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(busFabric_out_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(busFabric_out_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .busOut_readdata(S2B_FFT_PC_cunroll_x_busOut_readdata),
        .busOut_readdatavalid(S2B_FFT_PC_cunroll_x_busOut_readdatavalid),
        .out_1_rx_valid_tpl(S2B_FFT_PC_cunroll_x_out_1_rx_valid_tpl),
        .out_2_rx_chout_tpl(S2B_FFT_PC_cunroll_x_out_2_rx_chout_tpl),
        .out_3_imag_rx_dout_tpl(S2B_FFT_PC_cunroll_x_out_3_imag_rx_dout_tpl),
        .out_3_real_rx_dout_tpl(S2B_FFT_PC_cunroll_x_out_3_real_rx_dout_tpl),
        .out_4_rx_time_out_tpl(S2B_FFT_PC_cunroll_x_out_4_rx_time_out_tpl),
        .out_5_td_fft_in_v_tpl(S2B_FFT_PC_cunroll_x_out_5_td_fft_in_v_tpl),
        .out_6_td_fft_in_chout_tpl(S2B_FFT_PC_cunroll_x_out_6_td_fft_in_chout_tpl),
        .out_7_imag_td_fft_in_d_tpl(S2B_FFT_PC_cunroll_x_out_7_imag_td_fft_in_d_tpl),
        .out_7_real_td_fft_in_d_tpl(S2B_FFT_PC_cunroll_x_out_7_real_td_fft_in_d_tpl),
        .out_8_nsc_out_tpl(S2B_FFT_PC_cunroll_x_out_8_nsc_out_tpl),
        .out_9_size_out_tpl(S2B_FFT_PC_cunroll_x_out_9_size_out_tpl),
        .out_10_td_time_out_tpl(S2B_FFT_PC_cunroll_x_out_10_td_time_out_tpl),
        .out_11_fd_data_v_tpl(S2B_FFT_PC_cunroll_x_out_11_fd_data_v_tpl),
        .out_12_fd_data_c_tpl(S2B_FFT_PC_cunroll_x_out_12_fd_data_c_tpl),
        .out_13_imag_fd_data_q_tpl(S2B_FFT_PC_cunroll_x_out_13_imag_fd_data_q_tpl),
        .out_13_real_fd_data_q_tpl(S2B_FFT_PC_cunroll_x_out_13_real_fd_data_q_tpl),
        .out_14_eAxCout_tpl(S2B_FFT_PC_cunroll_x_out_14_eAxCout_tpl),
        .out_15_symmetadataout_tpl(S2B_FFT_PC_cunroll_x_out_15_symmetadataout_tpl),
        .out_16_eop_eAxC_tpl(S2B_FFT_PC_cunroll_x_out_16_eop_eAxC_tpl),
        .out_17_eop_sym_tpl(S2B_FFT_PC_cunroll_x_out_17_eop_sym_tpl),
        .out_18_sop_eAxC_tpl(S2B_FFT_PC_cunroll_x_out_18_sop_eAxC_tpl),
        .out_19_sop_sym_tpl(S2B_FFT_PC_cunroll_x_out_19_sop_sym_tpl),
        .out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(S2B_FFT_PC_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(S2B_FFT_PC_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(S2B_FFT_PC_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(S2B_FFT_PC_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // busFabric(BLACKBOX,2)
    busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz thebusFabric (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(S2B_FFT_PC_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .in_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(S2B_FFT_PC_cunroll_x_out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .in_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(S2B_FFT_PC_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .in_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(S2B_FFT_PC_cunroll_x_out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .busOut_readdata(busFabric_busOut_readdata),
        .busOut_readdatavalid(busFabric_busOut_readdatavalid),
        .out_AMMregisterWireData_streamtoblock_fft_DUT_RegField4_x_tpl(busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_RegField4_x_tpl),
        .out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl(busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl),
        .out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl(busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl),
        .out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl(busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl),
        .out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl(busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl),
        .out_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(busFabric_out_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(busFabric_out_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // streamtoblock_fft_DUT_S2B_FFT_PC_d(DELAY,66)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_d_q <= '0;
        end
        else
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_d_q <= $unsigned(S2B_FFT_PC_cunroll_x_busOut_readdata);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_rdv(DELAY,65)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_rdv_q <= '0;
        end
        else
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_rdv_q <= $unsigned(S2B_FFT_PC_cunroll_x_busOut_readdatavalid);
        end
    end

    // bus_selector(SELECTOR,5)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            bus_selector_q <= 32'b0;
            bus_selector_v <= 1'b0;
        end
        else
        begin
            bus_selector_q <= {31'b0000000000000000000000000000000, GND_q};
            bus_selector_v <= $unsigned(1'b0);
            if (busFabric_busOut_readdatavalid == 1'b1)
            begin
                bus_selector_q <= busFabric_busOut_readdata;
                bus_selector_v <= $unsigned(1'b1);
            end
            if (streamtoblock_fft_DUT_S2B_FFT_PC_rdv_q == 1'b1)
            begin
                bus_selector_q <= streamtoblock_fft_DUT_S2B_FFT_PC_d_q;
                bus_selector_v <= $unsigned(1'b1);
            end
        end
    end

    // streamtoblock_fft_DUT_readDelayed(DELAY,67)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            streamtoblock_fft_DUT_readDelayed_delay_0 <= '0;
        end
        else
        begin
            streamtoblock_fft_DUT_readDelayed_delay_0 <= $unsigned(busIn_read);
        end
    end
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            streamtoblock_fft_DUT_readDelayed_delay_1 <= streamtoblock_fft_DUT_readDelayed_delay_0;
            streamtoblock_fft_DUT_readDelayed_delay_2 <= streamtoblock_fft_DUT_readDelayed_delay_1;
            streamtoblock_fft_DUT_readDelayed_q <= streamtoblock_fft_DUT_readDelayed_delay_2;
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // streamtoblock_fft_DUT_readDataValid(LOGICAL,68)
    assign streamtoblock_fft_DUT_readDataValid_q = bus_selector_v | streamtoblock_fft_DUT_readDelayed_q;

    // busOut(BUSOUT,4)
    assign busOut_readdatavalid = streamtoblock_fft_DUT_readDataValid_q;
    assign busOut_readdata = bus_selector_q;
    assign busOut_waitrequest = GND_q;

    // rx_valid_s(GPOUT,32)
    assign rx_valid_s = S2B_FFT_PC_cunroll_x_out_1_rx_valid_tpl;

    // rx_chout_s(GPOUT,33)
    assign rx_chout_s = S2B_FFT_PC_cunroll_x_out_2_rx_chout_tpl;

    // rx_dout_im(GPOUT,34)
    assign rx_dout_im = S2B_FFT_PC_cunroll_x_out_3_imag_rx_dout_tpl;

    // rx_dout_re(GPOUT,35)
    assign rx_dout_re = S2B_FFT_PC_cunroll_x_out_3_real_rx_dout_tpl;

    // rx_time_out_s(GPOUT,36)
    assign rx_time_out_s = S2B_FFT_PC_cunroll_x_out_4_rx_time_out_tpl;

    // fft_vout_s(GPOUT,37)
    assign fft_vout_s = S2B_FFT_PC_cunroll_x_out_5_td_fft_in_v_tpl;

    // fft_chout_s(GPOUT,38)
    assign fft_chout_s = S2B_FFT_PC_cunroll_x_out_6_td_fft_in_chout_tpl;

    // fft_dout_im(GPOUT,39)
    assign fft_dout_im = S2B_FFT_PC_cunroll_x_out_7_imag_td_fft_in_d_tpl;

    // fft_dout_re(GPOUT,40)
    assign fft_dout_re = S2B_FFT_PC_cunroll_x_out_7_real_td_fft_in_d_tpl;

    // nsc_out_s(GPOUT,41)
    assign nsc_out_s = S2B_FFT_PC_cunroll_x_out_8_nsc_out_tpl;

    // size_out_s(GPOUT,42)
    assign size_out_s = S2B_FFT_PC_cunroll_x_out_9_size_out_tpl;

    // td_time_out_s(GPOUT,43)
    assign td_time_out_s = S2B_FFT_PC_cunroll_x_out_10_td_time_out_tpl;

    // fd_data_v_s(GPOUT,44)
    assign fd_data_v_s = S2B_FFT_PC_cunroll_x_out_11_fd_data_v_tpl;

    // fd_data_c_s(GPOUT,45)
    assign fd_data_c_s = S2B_FFT_PC_cunroll_x_out_12_fd_data_c_tpl;

    // fd_data_q_im(GPOUT,46)
    assign fd_data_q_im = S2B_FFT_PC_cunroll_x_out_13_imag_fd_data_q_tpl;

    // fd_data_q_re(GPOUT,47)
    assign fd_data_q_re = S2B_FFT_PC_cunroll_x_out_13_real_fd_data_q_tpl;

    // eAxCout_s(GPOUT,48)
    assign eAxCout_s = S2B_FFT_PC_cunroll_x_out_14_eAxCout_tpl;

    // symmetadataout_s(GPOUT,49)
    assign symmetadataout_s = S2B_FFT_PC_cunroll_x_out_15_symmetadataout_tpl;

    // eop_eAxC_s(GPOUT,50)
    assign eop_eAxC_s = S2B_FFT_PC_cunroll_x_out_16_eop_eAxC_tpl;

    // eop_sym_s(GPOUT,51)
    assign eop_sym_s = S2B_FFT_PC_cunroll_x_out_17_eop_sym_tpl;

    // sop_eAxC_s(GPOUT,52)
    assign sop_eAxC_s = S2B_FFT_PC_cunroll_x_out_18_sop_eAxC_tpl;

    // sop_sym_s(GPOUT,53)
    assign sop_sym_s = S2B_FFT_PC_cunroll_x_out_19_sop_sym_tpl;

    // version_out1_s(GPOUT,54)
    assign version_out1_s = busFabric_out_AMMregisterWireData_streamtoblock_fft_DUT_RegField4_x_tpl;

endmodule
