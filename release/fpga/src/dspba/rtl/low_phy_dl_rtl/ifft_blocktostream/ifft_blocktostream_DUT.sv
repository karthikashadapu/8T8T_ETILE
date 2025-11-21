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

// SystemVerilog created from ifft_blocktostream_DUT
// SystemVerilog created on Thu Jun 12 21:17:49 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ifft_blocktostream_DUT (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [15:0] data1_im,
    input wire [15:0] data1_re,
    input wire [0:0] valid1_s,
    input wire [7:0] channel1_s,
    input wire [3:0] size1_s,
    input wire [10:0] cplen1_s,
    input wire [11:0] nsc1_s,
    input wire [15:0] ifft_gain_re_l1_s,
    input wire [15:0] ifft_gain_im_l1_s,
    input wire [3:0] ifft_shift_l1_s,
    input wire [15:0] ifft_mux_const_l1_s,
    input wire [0:0] muxsel_l1_s,
    input wire [0:0] DC_SC_EN_s,
    input wire [0:0] CP_EN1_s,
    input wire [0:0] ripple_comp_en_s,
    input wire [0:0] rc_bw_sel_s,
    input wire [63:0] timeref_in_s,
    output wire [0:0] vout2_s,
    output wire [1:0] cout2_s,
    output wire [15:0] dout2_im,
    output wire [15:0] dout2_re,
    output wire [15:0] td_ifft_out_data_im,
    output wire [15:0] td_ifft_out_data_re,
    output wire [7:0] td_ifft_out_ch_s,
    output wire [0:0] td_ifft_out_valid_s,
    output wire [3:0] ifft_size_out_s,
    output wire [11:0] ifft_nprb_out_s,
    output wire [10:0] ifft_cp_out_s,
    output wire [0:0] fd_data_v_s,
    output wire [7:0] fd_data_c_s,
    output wire [15:0] fd_data_q_im,
    output wire [15:0] fd_data_q_re,
    output wire [63:0] fd_timeref_out_s,
    output wire [31:0] version_out_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [31:0] busFabric_busOut_readdata;
    wire [0:0] busFabric_busOut_readdatavalid;
    wire [31:0] busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_RegField4_x_tpl;
    wire [31:0] busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl;
    wire [0:0] busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl;
    wire [31:0] busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl;
    wire [0:0] busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl;
    wire [15:0] busFabric_out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [15:0] busFabric_out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    wire [0:0] low_phy_dl_cunroll_x_out_1_vout2_tpl;
    wire [1:0] low_phy_dl_cunroll_x_out_2_cout2_tpl;
    wire [15:0] low_phy_dl_cunroll_x_out_3_imag_dout2_tpl;
    wire [15:0] low_phy_dl_cunroll_x_out_3_real_dout2_tpl;
    wire [15:0] low_phy_dl_cunroll_x_out_4_imag_td_ifft_out_d_tpl;
    wire [15:0] low_phy_dl_cunroll_x_out_4_real_td_ifft_out_d_tpl;
    wire [7:0] low_phy_dl_cunroll_x_out_5_td_ifft_out_ch_tpl;
    wire [0:0] low_phy_dl_cunroll_x_out_6_td_ifft_out_v_tpl;
    wire [3:0] low_phy_dl_cunroll_x_out_7_ifft_size_out_tpl;
    wire [11:0] low_phy_dl_cunroll_x_out_8_ifft_nprb_out_tpl;
    wire [10:0] low_phy_dl_cunroll_x_out_9_ifft_cp_out_tpl;
    wire [0:0] low_phy_dl_cunroll_x_out_10_fd_data_v_tpl;
    wire [7:0] low_phy_dl_cunroll_x_out_11_fd_data_c_tpl;
    wire [15:0] low_phy_dl_cunroll_x_out_12_imag_fd_data_q_tpl;
    wire [15:0] low_phy_dl_cunroll_x_out_12_real_fd_data_q_tpl;
    wire [63:0] low_phy_dl_cunroll_x_out_13_fd_timeref_out_tpl;
    wire [31:0] low_phy_dl_cunroll_x_out_14_version_out_tpl;
    wire [11:0] low_phy_dl_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [11:0] low_phy_dl_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    wire [15:0] low_phy_dl_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [15:0] low_phy_dl_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    reg [0:0] ifft_blocktostream_DUT_readDelayed_q;
    reg [0:0] ifft_blocktostream_DUT_readDelayed_delay_0;
    reg [0:0] ifft_blocktostream_DUT_readDelayed_delay_1;
    wire [0:0] ifft_blocktostream_DUT_readDataValid_q;

    import ifft_blocktostream_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // low_phy_dl_cunroll_x(BLACKBOX,8)
    ifft_blocktostream_DUT_low_phy_dl thelow_phy_dl_cunroll_x (
        .in_1_valid1_tpl(valid1_s),
        .in_2_ifft_gain_re_l1_tpl(ifft_gain_re_l1_s),
        .in_3_ifft_gain_im_l1_tpl(ifft_gain_im_l1_s),
        .in_4_ifft_shift_l1_tpl(ifft_shift_l1_s),
        .in_5_ifft_mux_const_l1_tpl(ifft_mux_const_l1_s),
        .in_6_muxsel_l1_tpl(muxsel_l1_s),
        .in_7_DC_SC_EN_tpl(DC_SC_EN_s),
        .in_8_imag_data1_tpl(data1_im),
        .in_8_real_data1_tpl(data1_re),
        .in_9_channel1_tpl(channel1_s),
        .in_10_size1_tpl(size1_s),
        .in_11_nsc1_tpl(nsc1_s),
        .in_12_cplen1_tpl(cplen1_s),
        .in_13_CP_EN1_tpl(CP_EN1_s),
        .in_14_ripple_comp_en_tpl(ripple_comp_en_s),
        .in_15_rc_bw_sel_tpl(rc_bw_sel_s),
        .in_16_timeref_in_tpl(timeref_in_s),
        .in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_RegField4_x_tpl(busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_RegField4_x_tpl),
        .in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl(busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl),
        .in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl(busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl),
        .in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl(busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl),
        .in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl(busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl),
        .in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(busFabric_out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(busFabric_out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .out_1_vout2_tpl(low_phy_dl_cunroll_x_out_1_vout2_tpl),
        .out_2_cout2_tpl(low_phy_dl_cunroll_x_out_2_cout2_tpl),
        .out_3_imag_dout2_tpl(low_phy_dl_cunroll_x_out_3_imag_dout2_tpl),
        .out_3_real_dout2_tpl(low_phy_dl_cunroll_x_out_3_real_dout2_tpl),
        .out_4_imag_td_ifft_out_d_tpl(low_phy_dl_cunroll_x_out_4_imag_td_ifft_out_d_tpl),
        .out_4_real_td_ifft_out_d_tpl(low_phy_dl_cunroll_x_out_4_real_td_ifft_out_d_tpl),
        .out_5_td_ifft_out_ch_tpl(low_phy_dl_cunroll_x_out_5_td_ifft_out_ch_tpl),
        .out_6_td_ifft_out_v_tpl(low_phy_dl_cunroll_x_out_6_td_ifft_out_v_tpl),
        .out_7_ifft_size_out_tpl(low_phy_dl_cunroll_x_out_7_ifft_size_out_tpl),
        .out_8_ifft_nprb_out_tpl(low_phy_dl_cunroll_x_out_8_ifft_nprb_out_tpl),
        .out_9_ifft_cp_out_tpl(low_phy_dl_cunroll_x_out_9_ifft_cp_out_tpl),
        .out_10_fd_data_v_tpl(low_phy_dl_cunroll_x_out_10_fd_data_v_tpl),
        .out_11_fd_data_c_tpl(low_phy_dl_cunroll_x_out_11_fd_data_c_tpl),
        .out_12_imag_fd_data_q_tpl(low_phy_dl_cunroll_x_out_12_imag_fd_data_q_tpl),
        .out_12_real_fd_data_q_tpl(low_phy_dl_cunroll_x_out_12_real_fd_data_q_tpl),
        .out_13_fd_timeref_out_tpl(low_phy_dl_cunroll_x_out_13_fd_timeref_out_tpl),
        .out_14_version_out_tpl(low_phy_dl_cunroll_x_out_14_version_out_tpl),
        .out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(low_phy_dl_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(low_phy_dl_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(low_phy_dl_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(low_phy_dl_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .clk(clk),
        .areset(areset)
    );

    // busFabric(BLACKBOX,2)
    busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz thebusFabric (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(low_phy_dl_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .in_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(low_phy_dl_cunroll_x_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .in_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(low_phy_dl_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .in_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(low_phy_dl_cunroll_x_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .busOut_readdata(busFabric_busOut_readdata),
        .busOut_readdatavalid(busFabric_busOut_readdatavalid),
        .out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_RegField4_x_tpl(busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_RegField4_x_tpl),
        .out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl(busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl),
        .out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl(busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl),
        .out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl(busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl),
        .out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl(busFabric_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl),
        .out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(busFabric_out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(busFabric_out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // ifft_blocktostream_DUT_readDelayed(DELAY,47)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            ifft_blocktostream_DUT_readDelayed_delay_0 <= '0;
        end
        else
        begin
            ifft_blocktostream_DUT_readDelayed_delay_0 <= $unsigned(busIn_read);
        end
    end
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            ifft_blocktostream_DUT_readDelayed_delay_1 <= ifft_blocktostream_DUT_readDelayed_delay_0;
            ifft_blocktostream_DUT_readDelayed_q <= ifft_blocktostream_DUT_readDelayed_delay_1;
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // ifft_blocktostream_DUT_readDataValid(LOGICAL,48)
    assign ifft_blocktostream_DUT_readDataValid_q = busFabric_busOut_readdatavalid | ifft_blocktostream_DUT_readDelayed_q;

    // busOut(BUSOUT,4)
    assign busOut_readdatavalid = ifft_blocktostream_DUT_readDataValid_q;
    assign busOut_readdata = busFabric_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // vout2_s(GPOUT,26)
    assign vout2_s = low_phy_dl_cunroll_x_out_1_vout2_tpl;

    // cout2_s(GPOUT,27)
    assign cout2_s = low_phy_dl_cunroll_x_out_2_cout2_tpl;

    // dout2_im(GPOUT,28)
    assign dout2_im = low_phy_dl_cunroll_x_out_3_imag_dout2_tpl;

    // dout2_re(GPOUT,29)
    assign dout2_re = low_phy_dl_cunroll_x_out_3_real_dout2_tpl;

    // td_ifft_out_data_im(GPOUT,30)
    assign td_ifft_out_data_im = low_phy_dl_cunroll_x_out_4_imag_td_ifft_out_d_tpl;

    // td_ifft_out_data_re(GPOUT,31)
    assign td_ifft_out_data_re = low_phy_dl_cunroll_x_out_4_real_td_ifft_out_d_tpl;

    // td_ifft_out_ch_s(GPOUT,32)
    assign td_ifft_out_ch_s = low_phy_dl_cunroll_x_out_5_td_ifft_out_ch_tpl;

    // td_ifft_out_valid_s(GPOUT,33)
    assign td_ifft_out_valid_s = low_phy_dl_cunroll_x_out_6_td_ifft_out_v_tpl;

    // ifft_size_out_s(GPOUT,34)
    assign ifft_size_out_s = low_phy_dl_cunroll_x_out_7_ifft_size_out_tpl;

    // ifft_nprb_out_s(GPOUT,35)
    assign ifft_nprb_out_s = low_phy_dl_cunroll_x_out_8_ifft_nprb_out_tpl;

    // ifft_cp_out_s(GPOUT,36)
    assign ifft_cp_out_s = low_phy_dl_cunroll_x_out_9_ifft_cp_out_tpl;

    // fd_data_v_s(GPOUT,37)
    assign fd_data_v_s = low_phy_dl_cunroll_x_out_10_fd_data_v_tpl;

    // fd_data_c_s(GPOUT,38)
    assign fd_data_c_s = low_phy_dl_cunroll_x_out_11_fd_data_c_tpl;

    // fd_data_q_im(GPOUT,39)
    assign fd_data_q_im = low_phy_dl_cunroll_x_out_12_imag_fd_data_q_tpl;

    // fd_data_q_re(GPOUT,40)
    assign fd_data_q_re = low_phy_dl_cunroll_x_out_12_real_fd_data_q_tpl;

    // fd_timeref_out_s(GPOUT,41)
    assign fd_timeref_out_s = low_phy_dl_cunroll_x_out_13_fd_timeref_out_tpl;

    // version_out_s(GPOUT,42)
    assign version_out_s = low_phy_dl_cunroll_x_out_14_version_out_tpl;

endmodule
