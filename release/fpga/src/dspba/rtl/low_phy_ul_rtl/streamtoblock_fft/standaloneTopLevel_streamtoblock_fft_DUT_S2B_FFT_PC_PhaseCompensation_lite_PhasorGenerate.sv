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

// SystemVerilog created from standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [0:0] v_s,
    input wire [7:0] c_s,
    input wire [15:0] d1_im,
    input wire [15:0] d1_re,
    input wire [15:0] Tsym1_s,
    input wire [15:0] cp_T1_s,
    input wire [0:0] CP_EN1_s,
    input wire [63:0] fft_size_s,
    input wire [63:0] CPLen_s,
    input wire [63:0] nsc_s,
    input wire [1:0] eAxC_s,
    input wire [63:0] sym_metadata_s,
    input wire [63:0] ul_timerefin_s,
    output wire [15:0] dout1_im,
    output wire [15:0] dout1_re,
    output wire [0:0] vout_s,
    output wire [7:0] cout_s,
    output wire [17:0] sin_s,
    output wire [17:0] cos_s,
    output wire [63:0] fft_size_out_s,
    output wire [63:0] CPLenout_s,
    output wire [63:0] nsc_out_s,
    output wire [1:0] eAxC_out_s,
    output wire [63:0] sym_metadata_out_s,
    output wire [63:0] ul_timeref_out_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_1_imag_dout1_tpl;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_1_real_dout1_tpl;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_2_vout_tpl;
    wire [7:0] streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_3_cout_tpl;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_4_sin_tpl;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_5_cos_tpl;
    wire [63:0] streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_6_fft_size_out_tpl;
    wire [63:0] streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_7_CPLenout_tpl;
    wire [63:0] streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_8_nsc_out_tpl;
    wire [1:0] streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_9_eAxC_out_tpl;
    wire [63:0] streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_10_sym_metadata_out_tpl;
    wire [63:0] streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_11_ul_timeref_out_tpl;
    wire [31:0] busFabric_streamtoblock_fft_DUT_x_busOut_readdata;
    wire [0:0] busFabric_streamtoblock_fft_DUT_x_busOut_readdatavalid;
    wire [31:0] busFabric_streamtoblock_fft_DUT_x_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl;
    wire [0:0] busFabric_streamtoblock_fft_DUT_x_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl;
    wire [31:0] busFabric_streamtoblock_fft_DUT_x_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl;
    wire [0:0] busFabric_streamtoblock_fft_DUT_x_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl;
    wire [11:0] sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_gnd_x_q;
    wire [15:0] sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_gnd_x_q;
    reg [0:0] standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDelayed_q;
    reg [0:0] standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDelayed_delay_0;
    reg [0:0] standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDelayed_delay_1;
    wire [0:0] standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDataValid_q;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_gnd_x(CONSTANT,38)
    assign sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_gnd_x_q = $unsigned(16'b0000000000000000);

    // sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_gnd_x(CONSTANT,36)
    assign sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_gnd_x_q = $unsigned(12'b000000000000);

    // busFabric_streamtoblock_fft_DUT_x(BLACKBOX,5)
    busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz thebusFabric_streamtoblock_fft_DUT_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_gnd_x_q),
        .in_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_gnd_x_q),
        .in_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_gnd_x_q),
        .in_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_gnd_x_q),
        .busOut_readdata(busFabric_streamtoblock_fft_DUT_x_busOut_readdata),
        .busOut_readdatavalid(busFabric_streamtoblock_fft_DUT_x_busOut_readdatavalid),
        .out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl(busFabric_streamtoblock_fft_DUT_x_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl),
        .out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl(busFabric_streamtoblock_fft_DUT_x_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl),
        .out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl(busFabric_streamtoblock_fft_DUT_x_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl),
        .out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl(busFabric_streamtoblock_fft_DUT_x_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDelayed(DELAY,51)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDelayed_delay_0 <= '0;
        end
        else
        begin
            standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDelayed_delay_0 <= $unsigned(busIn_read);
        end
    end
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDelayed_delay_1 <= standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDelayed_delay_0;
            standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDelayed_q <= standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDelayed_delay_1;
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDataValid(LOGICAL,52)
    assign standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDataValid_q = busFabric_streamtoblock_fft_DUT_x_busOut_readdatavalid | standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDelayed_q;

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_readDataValid_q;
    assign busOut_readdata = busFabric_streamtoblock_fft_DUT_x_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate(BLACKBOX,4)
    streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate thestreamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate (
        .in_1_v_tpl(v_s),
        .in_2_c_tpl(c_s),
        .in_3_imag_d1_tpl(d1_im),
        .in_3_real_d1_tpl(d1_re),
        .in_4_Tsym1_tpl(Tsym1_s),
        .in_5_cp_T1_tpl(cp_T1_s),
        .in_6_CP_EN1_tpl(CP_EN1_s),
        .in_7_fft_size_tpl(fft_size_s),
        .in_8_CPLen_tpl(CPLen_s),
        .in_9_nsc_tpl(nsc_s),
        .in_10_eAxC_tpl(eAxC_s),
        .in_11_sym_metadata_tpl(sym_metadata_s),
        .in_12_ul_timerefin_tpl(ul_timerefin_s),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl(busFabric_streamtoblock_fft_DUT_x_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl(busFabric_streamtoblock_fft_DUT_x_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl(busFabric_streamtoblock_fft_DUT_x_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl(busFabric_streamtoblock_fft_DUT_x_out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl),
        .out_1_imag_dout1_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_1_imag_dout1_tpl),
        .out_1_real_dout1_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_1_real_dout1_tpl),
        .out_2_vout_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_2_vout_tpl),
        .out_3_cout_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_3_cout_tpl),
        .out_4_sin_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_4_sin_tpl),
        .out_5_cos_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_5_cos_tpl),
        .out_6_fft_size_out_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_6_fft_size_out_tpl),
        .out_7_CPLenout_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_7_CPLenout_tpl),
        .out_8_nsc_out_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_8_nsc_out_tpl),
        .out_9_eAxC_out_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_9_eAxC_out_tpl),
        .out_10_sym_metadata_out_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_10_sym_metadata_out_tpl),
        .out_11_ul_timeref_out_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_11_ul_timeref_out_tpl),
        .clk(clk),
        .areset(areset)
    );

    // dout1_im(GPOUT,19)
    assign dout1_im = streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_1_imag_dout1_tpl;

    // dout1_re(GPOUT,20)
    assign dout1_re = streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_1_real_dout1_tpl;

    // vout_s(GPOUT,21)
    assign vout_s = streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_2_vout_tpl;

    // cout_s(GPOUT,22)
    assign cout_s = streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_3_cout_tpl;

    // sin_s(GPOUT,23)
    assign sin_s = streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_4_sin_tpl;

    // cos_s(GPOUT,24)
    assign cos_s = streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_5_cos_tpl;

    // fft_size_out_s(GPOUT,25)
    assign fft_size_out_s = streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_6_fft_size_out_tpl;

    // CPLenout_s(GPOUT,26)
    assign CPLenout_s = streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_7_CPLenout_tpl;

    // nsc_out_s(GPOUT,27)
    assign nsc_out_s = streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_8_nsc_out_tpl;

    // eAxC_out_s(GPOUT,28)
    assign eAxC_out_s = streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_9_eAxC_out_tpl;

    // sym_metadata_out_s(GPOUT,29)
    assign sym_metadata_out_s = streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_10_sym_metadata_out_tpl;

    // ul_timeref_out_s(GPOUT,30)
    assign ul_timeref_out_s = streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_out_11_ul_timeref_out_tpl;

endmodule
