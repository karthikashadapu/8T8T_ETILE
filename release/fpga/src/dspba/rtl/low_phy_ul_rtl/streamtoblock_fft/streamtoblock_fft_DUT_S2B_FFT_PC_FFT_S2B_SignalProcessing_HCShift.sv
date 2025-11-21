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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    input wire [0:0] in_1_vin_tpl,
    input wire [7:0] in_2_cin_tpl,
    input wire [15:0] in_3_imag_din_tpl,
    input wire [15:0] in_3_real_din_tpl,
    input wire [0:0] in_4_sync_tpl,
    input wire [3:0] in_5_size_tpl,
    input wire [15:0] in_6_nsc_tpl,
    input wire [0:0] in_7_hcs_bypass_tpl,
    input wire [63:0] in_8_SFNin_tpl,
    input wire [1:0] in_9_eAxC_tpl,
    input wire [63:0] in_10_sym_metadata_tpl,
    output wire [0:0] out_1_vout_tpl,
    output wire [7:0] out_2_cout_tpl,
    output wire [16:0] out_3_imag_dout_tpl,
    output wire [16:0] out_3_real_dout_tpl,
    output wire [15:0] out_4_nsc_out_tpl,
    output wire [3:0] out_5_size_out_tpl,
    output wire [63:0] out_6_SFNout_tpl,
    output wire [1:0] out_7_eAxC_out_tpl,
    output wire [63:0] out_8_sym_metadataout_tpl,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [34:0] ComplexMixer_iOut_0;
    wire [34:0] ComplexMixer_qOut_0;
    wire [0:0] ComplexMixer_Out_v;
    wire [7:0] ComplexMixer_Out_c;
    wire [29:0] Const5_q;
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
    wire [1:0] FIFO3_q;
    wire [0:0] FIFO3_empty;
    wire [0:0] FIFO3_v;
    wire FIFO4_reset;
    wire [0:0] FIFO4_f;
    wire [0:0] FIFO4_e;
    wire [0:0] FIFO4_t;
    wire [63:0] FIFO4_q;
    wire [0:0] FIFO4_empty;
    wire [0:0] FIFO4_v;
    wire [31:0] NCO_busOut_readdata;
    wire [0:0] NCO_busOut_readdatavalid;
    wire [17:0] NCO_sinOut_0;
    wire [17:0] NCO_cosOut_0;
    wire [0:0] NCO_ncoOut_v;
    wire [7:0] NCO_ncoOut_c;
    wire [15:0] Scale_qOut_0;
    wire [15:0] Scale_qOut_1;
    wire [0:0] Scale_qOut_v;
    wire [7:0] Scale_qOut_c;
    wire FIFO_imag_x_reset;
    wire [0:0] FIFO_imag_x_f;
    wire [0:0] FIFO_imag_x_e;
    wire [0:0] FIFO_imag_x_t;
    wire [15:0] FIFO_imag_x_q;
    wire [0:0] FIFO_imag_x_empty;
    wire [0:0] FIFO_imag_x_v;
    wire FIFO_real_x_reset;
    wire [0:0] FIFO_real_x_f;
    wire [0:0] FIFO_real_x_e;
    wire [0:0] FIFO_real_x_t;
    wire [15:0] FIFO_real_x_q;
    wire [0:0] FIFO_real_x_empty;
    wire [0:0] FIFO_real_x_v;
    wire FIFO1_imag_x_reset;
    wire [0:0] FIFO1_imag_x_f;
    wire [0:0] FIFO1_imag_x_e;
    wire [0:0] FIFO1_imag_x_t;
    wire [15:0] FIFO1_imag_x_q;
    wire [0:0] FIFO1_imag_x_empty;
    wire [0:0] FIFO1_imag_x_v;
    wire FIFO1_real_x_reset;
    wire [0:0] FIFO1_real_x_f;
    wire [0:0] FIFO1_real_x_e;
    wire [0:0] FIFO1_real_x_t;
    wire [15:0] FIFO1_real_x_q;
    wire [0:0] FIFO1_real_x_empty;
    wire [0:0] FIFO1_real_x_v;
    wire [0:0] Subsystem_cunroll_x_out_1_Out1_tpl;
    wire [7:0] Subsystem_cunroll_x_out_2_Out2_tpl;
    wire [16:0] Subsystem_cunroll_x_out_3_imag_Out3_tpl;
    wire [16:0] Subsystem_cunroll_x_out_3_real_Out3_tpl;
    wire [15:0] Subsystem_cunroll_x_out_4_nsc_out_tpl;
    wire [3:0] Subsystem_cunroll_x_out_5_size_out_tpl;
    wire [63:0] Subsystem_cunroll_x_out_6_SFN_tpl;
    wire [1:0] Subsystem_cunroll_x_out_7_eAxC_out_tpl;
    wire [63:0] Subsystem_cunroll_x_out_8_sym_metadataout_tpl;
    wire [0:0] pipe_cunroll_x_out_1_v_out_tpl;
    wire [7:0] pipe_cunroll_x_out_2_ch_out_tpl;
    wire [15:0] pipe_cunroll_x_out_3_imag_d_out1_tpl;
    wire [15:0] pipe_cunroll_x_out_3_real_d_out1_tpl;
    wire [17:0] pipe_cunroll_x_out_4_d_out2_tpl;
    wire [17:0] pipe_cunroll_x_out_5_d_out3_tpl;
    wire [0:0] pipe1_vunroll_x_out_1_v_out_tpl;
    wire [7:0] pipe1_vunroll_x_out_2_ch_out_tpl;
    wire [34:0] pipe1_vunroll_x_out_3_0_d_out1_tpl;
    wire [34:0] pipe1_vunroll_x_out_3_1_d_out1_tpl;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // Const5(CONSTANT,4)
    assign Const5_q = $unsigned(30'b000000000000000000000000000000);

    // NCO(BLACKBOX,8)
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_NCO theNCO (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .xIn_c(in_2_cin_tpl),
        .xIn_v(in_1_vin_tpl),
        .xIn_p_0(Const5_q),
        .xIn_s_0(in_4_sync_tpl),
        .busOut_readdata(NCO_busOut_readdata),
        .busOut_readdatavalid(NCO_busOut_readdatavalid),
        .sinOut_0(NCO_sinOut_0),
        .cosOut_0(NCO_cosOut_0),
        .ncoOut_v(NCO_ncoOut_v),
        .ncoOut_c(NCO_ncoOut_c),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // busOut(BUSOUT,11)
    assign busOut_readdatavalid = NCO_busOut_readdatavalid;
    assign busOut_readdata = NCO_busOut_readdata;

    // FIFO4(FIFO,7)
    assign FIFO4_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(32),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(64),
        .lpm_widthu(5),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) FIFO4_fifo (
        .aclr(1'b0),
        .sclr(FIFO4_reset),
        .clock(clk),
        .rdreq(Scale_qOut_v[0]),
        .wrreq(in_1_vin_tpl[0]),
        .data(in_10_sym_metadata_tpl),
        .almost_full(FIFO4_f[0]),
        .almost_empty(FIFO4_t[0]),
        .empty(FIFO4_empty[0]),
        .q(FIFO4_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign FIFO4_e = ~ (FIFO4_t);
    assign FIFO4_v = ~ (FIFO4_empty);

    // FIFO3(FIFO,6)
    assign FIFO3_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(32),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(2),
        .lpm_widthu(5),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) FIFO3_fifo (
        .aclr(1'b0),
        .sclr(FIFO3_reset),
        .clock(clk),
        .rdreq(Scale_qOut_v[0]),
        .wrreq(in_1_vin_tpl[0]),
        .data(in_9_eAxC_tpl),
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
        .rdreq(Scale_qOut_v[0]),
        .wrreq(in_1_vin_tpl[0]),
        .data(in_8_SFNin_tpl),
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

    // FIFO_real_x(FIFO,14)
    assign FIFO_real_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(32),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(16),
        .lpm_widthu(5),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) FIFO_real_x_fifo (
        .aclr(1'b0),
        .sclr(FIFO_real_x_reset),
        .clock(clk),
        .rdreq(NCO_ncoOut_v[0]),
        .wrreq(in_1_vin_tpl[0]),
        .data(in_3_real_din_tpl),
        .almost_full(FIFO_real_x_f[0]),
        .almost_empty(FIFO_real_x_t[0]),
        .empty(FIFO_real_x_empty[0]),
        .q(FIFO_real_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign FIFO_real_x_e = ~ (FIFO_real_x_t);
    assign FIFO_real_x_v = ~ (FIFO_real_x_empty);

    // FIFO_imag_x(FIFO,13)
    assign FIFO_imag_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(32),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(16),
        .lpm_widthu(5),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) FIFO_imag_x_fifo (
        .aclr(1'b0),
        .sclr(FIFO_imag_x_reset),
        .clock(clk),
        .rdreq(NCO_ncoOut_v[0]),
        .wrreq(in_1_vin_tpl[0]),
        .data(in_3_imag_din_tpl),
        .almost_full(FIFO_imag_x_f[0]),
        .almost_empty(FIFO_imag_x_t[0]),
        .empty(FIFO_imag_x_empty[0]),
        .q(FIFO_imag_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign FIFO_imag_x_e = ~ (FIFO_imag_x_t);
    assign FIFO_imag_x_v = ~ (FIFO_imag_x_empty);

    // pipe_cunroll_x(BLACKBOX,20)
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe thepipe_cunroll_x (
        .in_1_v_in_tpl(NCO_ncoOut_v),
        .in_2_ch_in_tpl(NCO_ncoOut_c),
        .in_3_imag_d_in1_tpl(FIFO_imag_x_q),
        .in_3_real_d_in1_tpl(FIFO_real_x_q),
        .in_4_d_in2_tpl(NCO_sinOut_0),
        .in_5_d_in3_tpl(NCO_cosOut_0),
        .out_1_v_out_tpl(pipe_cunroll_x_out_1_v_out_tpl),
        .out_2_ch_out_tpl(pipe_cunroll_x_out_2_ch_out_tpl),
        .out_3_imag_d_out1_tpl(pipe_cunroll_x_out_3_imag_d_out1_tpl),
        .out_3_real_d_out1_tpl(pipe_cunroll_x_out_3_real_d_out1_tpl),
        .out_4_d_out2_tpl(pipe_cunroll_x_out_4_d_out2_tpl),
        .out_5_d_out3_tpl(pipe_cunroll_x_out_5_d_out3_tpl),
        .clk(clk),
        .areset(areset)
    );

    // ComplexMixer(BLACKBOX,2)
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_ComplexMixer theComplexMixer (
        .iIn_0(pipe_cunroll_x_out_3_real_d_out1_tpl),
        .qIn_0(pipe_cunroll_x_out_3_imag_d_out1_tpl),
        .In_v(pipe_cunroll_x_out_1_v_out_tpl),
        .In_c(pipe_cunroll_x_out_2_ch_out_tpl),
        .sIn_0(pipe_cunroll_x_out_4_d_out2_tpl),
        .cIn_0(pipe_cunroll_x_out_5_d_out3_tpl),
        .iOut_0(ComplexMixer_iOut_0),
        .qOut_0(ComplexMixer_qOut_0),
        .Out_v(ComplexMixer_Out_v),
        .Out_c(ComplexMixer_Out_c),
        .clk(clk),
        .areset(areset)
    );

    // pipe1_vunroll_x(BLACKBOX,21)
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe1 thepipe1_vunroll_x (
        .in_1_v_in_tpl(ComplexMixer_Out_v),
        .in_2_ch_in_tpl(ComplexMixer_Out_c),
        .in_3_0_d_in1_tpl(ComplexMixer_iOut_0),
        .in_3_1_d_in1_tpl(ComplexMixer_qOut_0),
        .out_1_v_out_tpl(pipe1_vunroll_x_out_1_v_out_tpl),
        .out_2_ch_out_tpl(pipe1_vunroll_x_out_2_ch_out_tpl),
        .out_3_0_d_out1_tpl(pipe1_vunroll_x_out_3_0_d_out1_tpl),
        .out_3_1_d_out1_tpl(pipe1_vunroll_x_out_3_1_d_out1_tpl),
        .clk(clk),
        .areset(areset)
    );

    // Scale(BLACKBOX,9)
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Scale theScale (
        .xIn_0(pipe1_vunroll_x_out_3_0_d_out1_tpl),
        .xIn_1(pipe1_vunroll_x_out_3_1_d_out1_tpl),
        .xIn_v(pipe1_vunroll_x_out_1_v_out_tpl),
        .xIn_c(pipe1_vunroll_x_out_2_ch_out_tpl),
        .gain_i(GND_q),
        .qOut_0(Scale_qOut_0),
        .qOut_1(Scale_qOut_1),
        .qOut_v(Scale_qOut_v),
        .qOut_c(Scale_qOut_c),
        .eOut_0(),
        .eOut_1(),
        .clk(clk),
        .areset(areset)
    );

    // FIFO1_real_x(FIFO,16)
    assign FIFO1_real_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(32),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(16),
        .lpm_widthu(5),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) FIFO1_real_x_fifo (
        .aclr(1'b0),
        .sclr(FIFO1_real_x_reset),
        .clock(clk),
        .rdreq(Scale_qOut_v[0]),
        .wrreq(NCO_ncoOut_v[0]),
        .data(FIFO_real_x_q),
        .almost_full(FIFO1_real_x_f[0]),
        .almost_empty(FIFO1_real_x_t[0]),
        .empty(FIFO1_real_x_empty[0]),
        .q(FIFO1_real_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign FIFO1_real_x_e = ~ (FIFO1_real_x_t);
    assign FIFO1_real_x_v = ~ (FIFO1_real_x_empty);

    // FIFO1_imag_x(FIFO,15)
    assign FIFO1_imag_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(32),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(16),
        .lpm_widthu(5),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) FIFO1_imag_x_fifo (
        .aclr(1'b0),
        .sclr(FIFO1_imag_x_reset),
        .clock(clk),
        .rdreq(Scale_qOut_v[0]),
        .wrreq(NCO_ncoOut_v[0]),
        .data(FIFO_imag_x_q),
        .almost_full(FIFO1_imag_x_f[0]),
        .almost_empty(FIFO1_imag_x_t[0]),
        .empty(FIFO1_imag_x_empty[0]),
        .q(FIFO1_imag_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign FIFO1_imag_x_e = ~ (FIFO1_imag_x_t);
    assign FIFO1_imag_x_v = ~ (FIFO1_imag_x_empty);

    // Subsystem_cunroll_x(BLACKBOX,19)
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem theSubsystem_cunroll_x (
        .in_1_imag_din_tpl(FIFO1_imag_x_q),
        .in_1_real_din_tpl(FIFO1_real_x_q),
        .in_2_vin_tpl(Scale_qOut_v),
        .in_3_cin_tpl(Scale_qOut_c),
        .in_4_imag_dout_tpl(Scale_qOut_1),
        .in_4_real_dout_tpl(Scale_qOut_0),
        .in_5_vout_tpl(Scale_qOut_v),
        .in_6_cout_tpl(Scale_qOut_c),
        .in_7_size_tpl(in_5_size_tpl),
        .in_8_nsc_tpl(in_6_nsc_tpl),
        .in_9_hcs_bypass_tpl(in_7_hcs_bypass_tpl),
        .in_10_TimeRef_SFN_tpl(FIFO2_q),
        .in_11_eAxC_tpl(FIFO3_q),
        .in_12_sym_metadata_tpl(FIFO4_q),
        .out_1_Out1_tpl(Subsystem_cunroll_x_out_1_Out1_tpl),
        .out_2_Out2_tpl(Subsystem_cunroll_x_out_2_Out2_tpl),
        .out_3_imag_Out3_tpl(Subsystem_cunroll_x_out_3_imag_Out3_tpl),
        .out_3_real_Out3_tpl(Subsystem_cunroll_x_out_3_real_Out3_tpl),
        .out_4_nsc_out_tpl(Subsystem_cunroll_x_out_4_nsc_out_tpl),
        .out_5_size_out_tpl(Subsystem_cunroll_x_out_5_size_out_tpl),
        .out_6_SFN_tpl(Subsystem_cunroll_x_out_6_SFN_tpl),
        .out_7_eAxC_out_tpl(Subsystem_cunroll_x_out_7_eAxC_out_tpl),
        .out_8_sym_metadataout_tpl(Subsystem_cunroll_x_out_8_sym_metadataout_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_1_vout_tpl(GPOUT,33)
    assign out_1_vout_tpl = Subsystem_cunroll_x_out_1_Out1_tpl;

    // out_2_cout_tpl(GPOUT,34)
    assign out_2_cout_tpl = Subsystem_cunroll_x_out_2_Out2_tpl;

    // out_3_imag_dout_tpl(GPOUT,35)
    assign out_3_imag_dout_tpl = Subsystem_cunroll_x_out_3_imag_Out3_tpl;

    // out_3_real_dout_tpl(GPOUT,36)
    assign out_3_real_dout_tpl = Subsystem_cunroll_x_out_3_real_Out3_tpl;

    // out_4_nsc_out_tpl(GPOUT,37)
    assign out_4_nsc_out_tpl = Subsystem_cunroll_x_out_4_nsc_out_tpl;

    // out_5_size_out_tpl(GPOUT,38)
    assign out_5_size_out_tpl = Subsystem_cunroll_x_out_5_size_out_tpl;

    // out_6_SFNout_tpl(GPOUT,39)
    assign out_6_SFNout_tpl = Subsystem_cunroll_x_out_6_SFN_tpl;

    // out_7_eAxC_out_tpl(GPOUT,40)
    assign out_7_eAxC_out_tpl = Subsystem_cunroll_x_out_7_eAxC_out_tpl;

    // out_8_sym_metadataout_tpl(GPOUT,41)
    assign out_8_sym_metadataout_tpl = Subsystem_cunroll_x_out_8_sym_metadataout_tpl;

endmodule
