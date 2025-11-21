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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite (
    input wire [0:0] in_1_v_tpl,
    input wire [7:0] in_2_c_tpl,
    input wire [15:0] in_3_imag_d1_tpl,
    input wire [15:0] in_3_real_d1_tpl,
    input wire [0:0] in_4_CP_EN1_tpl,
    input wire [63:0] in_5_fft_size_tpl,
    input wire [63:0] in_6_CPLen_tpl,
    input wire [63:0] in_7_nsc_tpl,
    input wire [1:0] in_8_eAxC_tpl,
    input wire [63:0] in_9_sym_metadata_tpl,
    input wire [63:0] in_10_timerefin_tpl,
    input wire [31:0] in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl,
    input wire [0:0] in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl,
    input wire [31:0] in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl,
    input wire [0:0] in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl,
    output wire [15:0] out_1_imag_dout1_tpl,
    output wire [15:0] out_1_real_dout1_tpl,
    output wire [0:0] out_2_vout_tpl,
    output wire [7:0] out_3_cout_tpl,
    output wire [63:0] out_4_fft_size_out_tpl,
    output wire [63:0] out_5_CPLenout_tpl,
    output wire [63:0] out_6_nsc_out_tpl,
    output wire [1:0] out_7_eAxCout_tpl,
    output wire [63:0] out_8_sym_metadataout_tpl,
    output wire [63:0] out_9_timeref_out_tpl,
    output wire [0:0] out_10_eop_eAxC_tpl,
    output wire [0:0] out_11_eop_sym_tpl,
    output wire [0:0] out_12_sop_eAxC_tpl,
    output wire [0:0] out_13_sop_sym_tpl,
    input wire clk,
    input wire areset
    );

    wire [15:0] Const1_q;
    wire FIFO1_reset;
    wire [0:0] FIFO1_f;
    wire [0:0] FIFO1_e;
    wire [0:0] FIFO1_t;
    wire [1:0] FIFO1_q;
    wire [0:0] FIFO1_empty;
    wire [0:0] FIFO1_v;
    wire FIFO2_reset;
    wire [0:0] FIFO2_f;
    wire [0:0] FIFO2_e;
    wire [0:0] FIFO2_t;
    wire [63:0] FIFO2_q;
    wire [0:0] FIFO2_empty;
    wire [0:0] FIFO2_v;
    wire FIFO3_reset;
    wire [0:0] FIFO3_f;
    wire [0:0] FIFO3_e;
    wire [0:0] FIFO3_t;
    wire [63:0] FIFO3_q;
    wire [0:0] FIFO3_empty;
    wire [0:0] FIFO3_v;
    wire [15:0] ComplexMixer_cunroll_x_out_1_imag_dout1_tpl;
    wire [15:0] ComplexMixer_cunroll_x_out_1_real_dout1_tpl;
    wire [0:0] ComplexMixer_cunroll_x_out_2_vout_tpl;
    wire [7:0] ComplexMixer_cunroll_x_out_3_cout_tpl;
    wire [15:0] PhasorGenerate_cunroll_x_out_1_imag_dout1_tpl;
    wire [15:0] PhasorGenerate_cunroll_x_out_1_real_dout1_tpl;
    wire [0:0] PhasorGenerate_cunroll_x_out_2_vout_tpl;
    wire [7:0] PhasorGenerate_cunroll_x_out_3_cout_tpl;
    wire [17:0] PhasorGenerate_cunroll_x_out_4_sin_tpl;
    wire [17:0] PhasorGenerate_cunroll_x_out_5_cos_tpl;
    wire [63:0] PhasorGenerate_cunroll_x_out_6_fft_size_out_tpl;
    wire [63:0] PhasorGenerate_cunroll_x_out_7_CPLenout_tpl;
    wire [63:0] PhasorGenerate_cunroll_x_out_8_nsc_out_tpl;
    wire [1:0] PhasorGenerate_cunroll_x_out_9_eAxC_out_tpl;
    wire [63:0] PhasorGenerate_cunroll_x_out_10_sym_metadata_out_tpl;
    wire [63:0] PhasorGenerate_cunroll_x_out_11_ul_timeref_out_tpl;
    wire [0:0] SOP_EOP_gen_cunroll_x_out_1_vout_tpl;
    wire [7:0] SOP_EOP_gen_cunroll_x_out_2_chout_tpl;
    wire [15:0] SOP_EOP_gen_cunroll_x_out_3_imag_dout_tpl;
    wire [15:0] SOP_EOP_gen_cunroll_x_out_3_real_dout_tpl;
    wire [1:0] SOP_EOP_gen_cunroll_x_out_4_eAxC_out_tpl;
    wire [0:0] SOP_EOP_gen_cunroll_x_out_5_eop_eAxC_tpl;
    wire [0:0] SOP_EOP_gen_cunroll_x_out_6_eop_sym_tpl;
    wire [0:0] SOP_EOP_gen_cunroll_x_out_7_sop_eAxC_tpl;
    wire [0:0] SOP_EOP_gen_cunroll_x_out_8_sop_sym_tpl;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // Const1(CONSTANT,2)
    assign Const1_q = $unsigned(16'b0000000000000000);

    // PhasorGenerate_cunroll_x(BLACKBOX,8)
    streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate thePhasorGenerate_cunroll_x (
        .in_1_v_tpl(in_1_v_tpl),
        .in_2_c_tpl(in_2_c_tpl),
        .in_3_imag_d1_tpl(in_3_imag_d1_tpl),
        .in_3_real_d1_tpl(in_3_real_d1_tpl),
        .in_4_Tsym1_tpl(Const1_q),
        .in_5_cp_T1_tpl(Const1_q),
        .in_6_CP_EN1_tpl(in_4_CP_EN1_tpl),
        .in_7_fft_size_tpl(in_5_fft_size_tpl),
        .in_8_CPLen_tpl(in_6_CPLen_tpl),
        .in_9_nsc_tpl(in_7_nsc_tpl),
        .in_10_eAxC_tpl(in_8_eAxC_tpl),
        .in_11_sym_metadata_tpl(in_9_sym_metadata_tpl),
        .in_12_ul_timerefin_tpl(in_10_timerefin_tpl),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl(in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl(in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl(in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl),
        .in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl(in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl),
        .out_1_imag_dout1_tpl(PhasorGenerate_cunroll_x_out_1_imag_dout1_tpl),
        .out_1_real_dout1_tpl(PhasorGenerate_cunroll_x_out_1_real_dout1_tpl),
        .out_2_vout_tpl(PhasorGenerate_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(PhasorGenerate_cunroll_x_out_3_cout_tpl),
        .out_4_sin_tpl(PhasorGenerate_cunroll_x_out_4_sin_tpl),
        .out_5_cos_tpl(PhasorGenerate_cunroll_x_out_5_cos_tpl),
        .out_6_fft_size_out_tpl(PhasorGenerate_cunroll_x_out_6_fft_size_out_tpl),
        .out_7_CPLenout_tpl(PhasorGenerate_cunroll_x_out_7_CPLenout_tpl),
        .out_8_nsc_out_tpl(PhasorGenerate_cunroll_x_out_8_nsc_out_tpl),
        .out_9_eAxC_out_tpl(PhasorGenerate_cunroll_x_out_9_eAxC_out_tpl),
        .out_10_sym_metadata_out_tpl(PhasorGenerate_cunroll_x_out_10_sym_metadata_out_tpl),
        .out_11_ul_timeref_out_tpl(PhasorGenerate_cunroll_x_out_11_ul_timeref_out_tpl),
        .clk(clk),
        .areset(areset)
    );

    // FIFO1(FIFO,4)
    assign FIFO1_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(64),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(128),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(2),
        .lpm_widthu(7),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) FIFO1_fifo (
        .aclr(1'b0),
        .sclr(FIFO1_reset),
        .clock(clk),
        .rdreq(ComplexMixer_cunroll_x_out_2_vout_tpl[0]),
        .wrreq(PhasorGenerate_cunroll_x_out_2_vout_tpl[0]),
        .data(PhasorGenerate_cunroll_x_out_9_eAxC_out_tpl),
        .almost_full(FIFO1_f[0]),
        .almost_empty(FIFO1_t[0]),
        .empty(FIFO1_empty[0]),
        .q(FIFO1_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign FIFO1_e = ~ (FIFO1_t);
    assign FIFO1_v = ~ (FIFO1_empty);

    // ComplexMixer_cunroll_x(BLACKBOX,7)
    streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer theComplexMixer_cunroll_x (
        .in_1_imag_din1_tpl(PhasorGenerate_cunroll_x_out_1_imag_dout1_tpl),
        .in_1_real_din1_tpl(PhasorGenerate_cunroll_x_out_1_real_dout1_tpl),
        .in_2_vin_tpl(PhasorGenerate_cunroll_x_out_2_vout_tpl),
        .in_3_cin_tpl(PhasorGenerate_cunroll_x_out_3_cout_tpl),
        .in_4_sin_tpl(PhasorGenerate_cunroll_x_out_4_sin_tpl),
        .in_5_cos_tpl(PhasorGenerate_cunroll_x_out_5_cos_tpl),
        .out_1_imag_dout1_tpl(ComplexMixer_cunroll_x_out_1_imag_dout1_tpl),
        .out_1_real_dout1_tpl(ComplexMixer_cunroll_x_out_1_real_dout1_tpl),
        .out_2_vout_tpl(ComplexMixer_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(ComplexMixer_cunroll_x_out_3_cout_tpl),
        .clk(clk),
        .areset(areset)
    );

    // SOP_EOP_gen_cunroll_x(BLACKBOX,9)
    streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen theSOP_EOP_gen_cunroll_x (
        .in_1_vin_tpl(ComplexMixer_cunroll_x_out_2_vout_tpl),
        .in_2_chin_tpl(ComplexMixer_cunroll_x_out_3_cout_tpl),
        .in_3_imag_din_tpl(ComplexMixer_cunroll_x_out_1_imag_dout1_tpl),
        .in_3_real_din_tpl(ComplexMixer_cunroll_x_out_1_real_dout1_tpl),
        .in_4_eAxC_in_tpl(FIFO1_q),
        .out_1_vout_tpl(SOP_EOP_gen_cunroll_x_out_1_vout_tpl),
        .out_2_chout_tpl(SOP_EOP_gen_cunroll_x_out_2_chout_tpl),
        .out_3_imag_dout_tpl(SOP_EOP_gen_cunroll_x_out_3_imag_dout_tpl),
        .out_3_real_dout_tpl(SOP_EOP_gen_cunroll_x_out_3_real_dout_tpl),
        .out_4_eAxC_out_tpl(SOP_EOP_gen_cunroll_x_out_4_eAxC_out_tpl),
        .out_5_eop_eAxC_tpl(SOP_EOP_gen_cunroll_x_out_5_eop_eAxC_tpl),
        .out_6_eop_sym_tpl(SOP_EOP_gen_cunroll_x_out_6_eop_sym_tpl),
        .out_7_sop_eAxC_tpl(SOP_EOP_gen_cunroll_x_out_7_sop_eAxC_tpl),
        .out_8_sop_sym_tpl(SOP_EOP_gen_cunroll_x_out_8_sop_sym_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_1_imag_dout1_tpl(GPOUT,25)
    assign out_1_imag_dout1_tpl = SOP_EOP_gen_cunroll_x_out_3_imag_dout_tpl;

    // out_1_real_dout1_tpl(GPOUT,26)
    assign out_1_real_dout1_tpl = SOP_EOP_gen_cunroll_x_out_3_real_dout_tpl;

    // out_2_vout_tpl(GPOUT,27)
    assign out_2_vout_tpl = SOP_EOP_gen_cunroll_x_out_1_vout_tpl;

    // out_3_cout_tpl(GPOUT,28)
    assign out_3_cout_tpl = SOP_EOP_gen_cunroll_x_out_2_chout_tpl;

    // out_4_fft_size_out_tpl(GPOUT,29)
    assign out_4_fft_size_out_tpl = PhasorGenerate_cunroll_x_out_6_fft_size_out_tpl;

    // out_5_CPLenout_tpl(GPOUT,30)
    assign out_5_CPLenout_tpl = PhasorGenerate_cunroll_x_out_7_CPLenout_tpl;

    // out_6_nsc_out_tpl(GPOUT,31)
    assign out_6_nsc_out_tpl = PhasorGenerate_cunroll_x_out_8_nsc_out_tpl;

    // out_7_eAxCout_tpl(GPOUT,32)
    assign out_7_eAxCout_tpl = SOP_EOP_gen_cunroll_x_out_4_eAxC_out_tpl;

    // FIFO2(FIFO,5)
    assign FIFO2_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(64),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(64),
        .lpm_widthu(6),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) FIFO2_fifo (
        .aclr(1'b0),
        .sclr(FIFO2_reset),
        .clock(clk),
        .rdreq(SOP_EOP_gen_cunroll_x_out_1_vout_tpl[0]),
        .wrreq(PhasorGenerate_cunroll_x_out_2_vout_tpl[0]),
        .data(PhasorGenerate_cunroll_x_out_10_sym_metadata_out_tpl),
        .almost_full(FIFO2_f[0]),
        .almost_empty(FIFO2_t[0]),
        .empty(FIFO2_empty[0]),
        .q(FIFO2_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign FIFO2_e = ~ (FIFO2_t);
    assign FIFO2_v = ~ (FIFO2_empty);

    // out_8_sym_metadataout_tpl(GPOUT,33)
    assign out_8_sym_metadataout_tpl = FIFO2_q;

    // FIFO3(FIFO,6)
    assign FIFO3_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(64),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(64),
        .lpm_widthu(6),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) FIFO3_fifo (
        .aclr(1'b0),
        .sclr(FIFO3_reset),
        .clock(clk),
        .rdreq(SOP_EOP_gen_cunroll_x_out_1_vout_tpl[0]),
        .wrreq(PhasorGenerate_cunroll_x_out_2_vout_tpl[0]),
        .data(PhasorGenerate_cunroll_x_out_11_ul_timeref_out_tpl),
        .almost_full(FIFO3_f[0]),
        .almost_empty(FIFO3_t[0]),
        .empty(FIFO3_empty[0]),
        .q(FIFO3_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign FIFO3_e = ~ (FIFO3_t);
    assign FIFO3_v = ~ (FIFO3_empty);

    // out_9_timeref_out_tpl(GPOUT,34)
    assign out_9_timeref_out_tpl = FIFO3_q;

    // out_10_eop_eAxC_tpl(GPOUT,35)
    assign out_10_eop_eAxC_tpl = SOP_EOP_gen_cunroll_x_out_5_eop_eAxC_tpl;

    // out_11_eop_sym_tpl(GPOUT,36)
    assign out_11_eop_sym_tpl = SOP_EOP_gen_cunroll_x_out_6_eop_sym_tpl;

    // out_12_sop_eAxC_tpl(GPOUT,37)
    assign out_12_sop_eAxC_tpl = SOP_EOP_gen_cunroll_x_out_7_sop_eAxC_tpl;

    // out_13_sop_sym_tpl(GPOUT,38)
    assign out_13_sop_sym_tpl = SOP_EOP_gen_cunroll_x_out_8_sop_sym_tpl;

endmodule
