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

// SystemVerilog created from standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl
// SystemVerilog created on Thu Jun 12 21:17:48 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [0:0] valid1_s,
    input wire [15:0] ifft_gain_re_l1_s,
    input wire [15:0] ifft_gain_im_l1_s,
    input wire [3:0] ifft_shift_l1_s,
    input wire [15:0] ifft_mux_const_l1_s,
    input wire [0:0] muxsel_l1_s,
    input wire [0:0] DC_SC_EN_s,
    input wire [15:0] data1_im,
    input wire [15:0] data1_re,
    input wire [7:0] channel1_s,
    input wire [3:0] size1_s,
    input wire [11:0] nsc1_s,
    input wire [10:0] cplen1_s,
    input wire [0:0] CP_EN1_s,
    input wire [0:0] ripple_comp_en_s,
    input wire [0:0] rc_bw_sel_s,
    input wire [63:0] timeref_in_s,
    output wire [0:0] vout2_s,
    output wire [1:0] cout2_s,
    output wire [15:0] dout2_im,
    output wire [15:0] dout2_re,
    output wire [15:0] td_ifft_out_d_im,
    output wire [15:0] td_ifft_out_d_re,
    output wire [7:0] td_ifft_out_ch_s,
    output wire [0:0] td_ifft_out_v_s,
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
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_out_1_vout2_tpl;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_out_2_cout2_tpl;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_out_3_imag_dout2_tpl;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_out_3_real_dout2_tpl;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_out_4_imag_td_ifft_out_d_tpl;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_out_4_real_td_ifft_out_d_tpl;
    wire [7:0] ifft_blocktostream_DUT_low_phy_dl_out_5_td_ifft_out_ch_tpl;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_out_6_td_ifft_out_v_tpl;
    wire [3:0] ifft_blocktostream_DUT_low_phy_dl_out_7_ifft_size_out_tpl;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_out_8_ifft_nprb_out_tpl;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_out_9_ifft_cp_out_tpl;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_out_10_fd_data_v_tpl;
    wire [7:0] ifft_blocktostream_DUT_low_phy_dl_out_11_fd_data_c_tpl;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_out_12_imag_fd_data_q_tpl;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_out_12_real_fd_data_q_tpl;
    wire [63:0] ifft_blocktostream_DUT_low_phy_dl_out_13_fd_timeref_out_tpl;
    wire [31:0] ifft_blocktostream_DUT_low_phy_dl_out_14_version_out_tpl;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    wire [31:0] busFabric_ifft_blocktostream_DUT_x_busOut_readdata;
    wire [0:0] busFabric_ifft_blocktostream_DUT_x_busOut_readdatavalid;
    wire [31:0] busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_RegField4_x_tpl;
    wire [31:0] busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl;
    wire [0:0] busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl;
    wire [31:0] busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl;
    wire [0:0] busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl;
    wire [15:0] busFabric_ifft_blocktostream_DUT_x_out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
    wire [15:0] busFabric_ifft_blocktostream_DUT_x_out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
    reg [0:0] standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDelayed_q;
    reg [0:0] standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDelayed_delay_0;
    reg [0:0] standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDelayed_delay_1;
    wire [0:0] standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDataValid_q;

    import ifft_blocktostream_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // ifft_blocktostream_DUT_low_phy_dl(BLACKBOX,4)
    ifft_blocktostream_DUT_low_phy_dl theifft_blocktostream_DUT_low_phy_dl (
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
        .in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_RegField4_x_tpl(busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_RegField4_x_tpl),
        .in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl(busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl),
        .in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl(busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl),
        .in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl(busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl),
        .in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl(busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl),
        .in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(busFabric_ifft_blocktostream_DUT_x_out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(busFabric_ifft_blocktostream_DUT_x_out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .out_1_vout2_tpl(ifft_blocktostream_DUT_low_phy_dl_out_1_vout2_tpl),
        .out_2_cout2_tpl(ifft_blocktostream_DUT_low_phy_dl_out_2_cout2_tpl),
        .out_3_imag_dout2_tpl(ifft_blocktostream_DUT_low_phy_dl_out_3_imag_dout2_tpl),
        .out_3_real_dout2_tpl(ifft_blocktostream_DUT_low_phy_dl_out_3_real_dout2_tpl),
        .out_4_imag_td_ifft_out_d_tpl(ifft_blocktostream_DUT_low_phy_dl_out_4_imag_td_ifft_out_d_tpl),
        .out_4_real_td_ifft_out_d_tpl(ifft_blocktostream_DUT_low_phy_dl_out_4_real_td_ifft_out_d_tpl),
        .out_5_td_ifft_out_ch_tpl(ifft_blocktostream_DUT_low_phy_dl_out_5_td_ifft_out_ch_tpl),
        .out_6_td_ifft_out_v_tpl(ifft_blocktostream_DUT_low_phy_dl_out_6_td_ifft_out_v_tpl),
        .out_7_ifft_size_out_tpl(ifft_blocktostream_DUT_low_phy_dl_out_7_ifft_size_out_tpl),
        .out_8_ifft_nprb_out_tpl(ifft_blocktostream_DUT_low_phy_dl_out_8_ifft_nprb_out_tpl),
        .out_9_ifft_cp_out_tpl(ifft_blocktostream_DUT_low_phy_dl_out_9_ifft_cp_out_tpl),
        .out_10_fd_data_v_tpl(ifft_blocktostream_DUT_low_phy_dl_out_10_fd_data_v_tpl),
        .out_11_fd_data_c_tpl(ifft_blocktostream_DUT_low_phy_dl_out_11_fd_data_c_tpl),
        .out_12_imag_fd_data_q_tpl(ifft_blocktostream_DUT_low_phy_dl_out_12_imag_fd_data_q_tpl),
        .out_12_real_fd_data_q_tpl(ifft_blocktostream_DUT_low_phy_dl_out_12_real_fd_data_q_tpl),
        .out_13_fd_timeref_out_tpl(ifft_blocktostream_DUT_low_phy_dl_out_13_fd_timeref_out_tpl),
        .out_14_version_out_tpl(ifft_blocktostream_DUT_low_phy_dl_out_14_version_out_tpl),
        .out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(ifft_blocktostream_DUT_low_phy_dl_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(ifft_blocktostream_DUT_low_phy_dl_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(ifft_blocktostream_DUT_low_phy_dl_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(ifft_blocktostream_DUT_low_phy_dl_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .clk(clk),
        .areset(areset)
    );

    // busFabric_ifft_blocktostream_DUT_x(BLACKBOX,5)
    busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz thebusFabric_ifft_blocktostream_DUT_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(ifft_blocktostream_DUT_low_phy_dl_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .in_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(ifft_blocktostream_DUT_low_phy_dl_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .in_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(ifft_blocktostream_DUT_low_phy_dl_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .in_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(ifft_blocktostream_DUT_low_phy_dl_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .busOut_readdata(busFabric_ifft_blocktostream_DUT_x_busOut_readdata),
        .busOut_readdatavalid(busFabric_ifft_blocktostream_DUT_x_busOut_readdatavalid),
        .out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_RegField4_x_tpl(busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_RegField4_x_tpl),
        .out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl(busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl),
        .out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl(busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl),
        .out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl(busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl),
        .out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl(busFabric_ifft_blocktostream_DUT_x_out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl),
        .out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(busFabric_ifft_blocktostream_DUT_x_out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl),
        .out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(busFabric_ifft_blocktostream_DUT_x_out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDelayed(DELAY,56)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDelayed_delay_0 <= '0;
        end
        else
        begin
            standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDelayed_delay_0 <= $unsigned(busIn_read);
        end
    end
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDelayed_delay_1 <= standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDelayed_delay_0;
            standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDelayed_q <= standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDelayed_delay_1;
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDataValid(LOGICAL,57)
    assign standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDataValid_q = busFabric_ifft_blocktostream_DUT_x_busOut_readdatavalid | standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDelayed_q;

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_readDataValid_q;
    assign busOut_readdata = busFabric_ifft_blocktostream_DUT_x_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // vout2_s(GPOUT,23)
    assign vout2_s = ifft_blocktostream_DUT_low_phy_dl_out_1_vout2_tpl;

    // cout2_s(GPOUT,24)
    assign cout2_s = ifft_blocktostream_DUT_low_phy_dl_out_2_cout2_tpl;

    // dout2_im(GPOUT,25)
    assign dout2_im = ifft_blocktostream_DUT_low_phy_dl_out_3_imag_dout2_tpl;

    // dout2_re(GPOUT,26)
    assign dout2_re = ifft_blocktostream_DUT_low_phy_dl_out_3_real_dout2_tpl;

    // td_ifft_out_d_im(GPOUT,27)
    assign td_ifft_out_d_im = ifft_blocktostream_DUT_low_phy_dl_out_4_imag_td_ifft_out_d_tpl;

    // td_ifft_out_d_re(GPOUT,28)
    assign td_ifft_out_d_re = ifft_blocktostream_DUT_low_phy_dl_out_4_real_td_ifft_out_d_tpl;

    // td_ifft_out_ch_s(GPOUT,29)
    assign td_ifft_out_ch_s = ifft_blocktostream_DUT_low_phy_dl_out_5_td_ifft_out_ch_tpl;

    // td_ifft_out_v_s(GPOUT,30)
    assign td_ifft_out_v_s = ifft_blocktostream_DUT_low_phy_dl_out_6_td_ifft_out_v_tpl;

    // ifft_size_out_s(GPOUT,31)
    assign ifft_size_out_s = ifft_blocktostream_DUT_low_phy_dl_out_7_ifft_size_out_tpl;

    // ifft_nprb_out_s(GPOUT,32)
    assign ifft_nprb_out_s = ifft_blocktostream_DUT_low_phy_dl_out_8_ifft_nprb_out_tpl;

    // ifft_cp_out_s(GPOUT,33)
    assign ifft_cp_out_s = ifft_blocktostream_DUT_low_phy_dl_out_9_ifft_cp_out_tpl;

    // fd_data_v_s(GPOUT,34)
    assign fd_data_v_s = ifft_blocktostream_DUT_low_phy_dl_out_10_fd_data_v_tpl;

    // fd_data_c_s(GPOUT,35)
    assign fd_data_c_s = ifft_blocktostream_DUT_low_phy_dl_out_11_fd_data_c_tpl;

    // fd_data_q_im(GPOUT,36)
    assign fd_data_q_im = ifft_blocktostream_DUT_low_phy_dl_out_12_imag_fd_data_q_tpl;

    // fd_data_q_re(GPOUT,37)
    assign fd_data_q_re = ifft_blocktostream_DUT_low_phy_dl_out_12_real_fd_data_q_tpl;

    // fd_timeref_out_s(GPOUT,38)
    assign fd_timeref_out_s = ifft_blocktostream_DUT_low_phy_dl_out_13_fd_timeref_out_tpl;

    // version_out_s(GPOUT,39)
    assign version_out_s = ifft_blocktostream_DUT_low_phy_dl_out_14_version_out_tpl;

endmodule
