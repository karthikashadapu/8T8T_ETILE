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

// SystemVerilog created from ddc_model_DUT_DUT_COMPLEX_MIXER1
// SystemVerilog created on Thu Jan  9 15:36:33 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ddc_model_DUT_DUT_COMPLEX_MIXER1 (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    input wire [31:0] in_1_0_imag_d0_tpl,
    input wire [31:0] in_1_0_real_d0_tpl,
    input wire [31:0] in_1_1_imag_d0_tpl,
    input wire [31:0] in_1_1_real_d0_tpl,
    input wire [31:0] in_1_2_imag_d0_tpl,
    input wire [31:0] in_1_2_real_d0_tpl,
    input wire [31:0] in_1_3_imag_d0_tpl,
    input wire [31:0] in_1_3_real_d0_tpl,
    input wire [0:0] in_2_v_tpl,
    input wire [7:0] in_3_c_tpl,
    input wire [0:0] in_4_0_sync_tpl,
    input wire [0:0] in_4_1_sync_tpl,
    input wire [0:0] in_4_2_sync_tpl,
    input wire [0:0] in_4_3_sync_tpl,
    output wire [15:0] out_1_0_imag_q0_tpl,
    output wire [15:0] out_1_0_real_q0_tpl,
    output wire [15:0] out_1_1_imag_q0_tpl,
    output wire [15:0] out_1_1_real_q0_tpl,
    output wire [15:0] out_1_2_imag_q0_tpl,
    output wire [15:0] out_1_2_real_q0_tpl,
    output wire [15:0] out_1_3_imag_q0_tpl,
    output wire [15:0] out_1_3_real_q0_tpl,
    output wire [0:0] out_2_qv_tpl,
    output wire [7:0] out_3_qc_tpl,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [48:0] ComplexMixer_iOut_0;
    wire [48:0] ComplexMixer_iOut_1;
    wire [48:0] ComplexMixer_iOut_2;
    wire [48:0] ComplexMixer_iOut_3;
    wire [48:0] ComplexMixer_qOut_0;
    wire [48:0] ComplexMixer_qOut_1;
    wire [48:0] ComplexMixer_qOut_2;
    wire [48:0] ComplexMixer_qOut_3;
    wire [0:0] ComplexMixer_Out_v;
    wire [7:0] ComplexMixer_Out_c;
    wire [15:0] ComplexMixer_Scale_qOut_0;
    wire [15:0] ComplexMixer_Scale_qOut_1;
    wire [15:0] ComplexMixer_Scale_qOut_2;
    wire [15:0] ComplexMixer_Scale_qOut_3;
    wire [15:0] ComplexMixer_Scale_qOut_4;
    wire [15:0] ComplexMixer_Scale_qOut_5;
    wire [15:0] ComplexMixer_Scale_qOut_6;
    wire [15:0] ComplexMixer_Scale_qOut_7;
    wire [0:0] ComplexMixer_Scale_qOut_v;
    wire [7:0] ComplexMixer_Scale_qOut_c;
    wire [31:0] Complex_NCO_busOut_readdata;
    wire [0:0] Complex_NCO_busOut_readdatavalid;
    wire [15:0] Complex_NCO_sinOut_0;
    wire [15:0] Complex_NCO_sinOut_1;
    wire [15:0] Complex_NCO_sinOut_2;
    wire [15:0] Complex_NCO_sinOut_3;
    wire [15:0] Complex_NCO_cosOut_0;
    wire [15:0] Complex_NCO_cosOut_1;
    wire [15:0] Complex_NCO_cosOut_2;
    wire [15:0] Complex_NCO_cosOut_3;
    wire [0:0] Complex_NCO_ncoOut_v;
    wire [7:0] Complex_NCO_ncoOut_c;
    wire [31:0] Const1_0_x_q;
    wire delay_FIFO_0_imag_x_reset;
    wire [0:0] delay_FIFO_0_imag_x_f;
    wire [0:0] delay_FIFO_0_imag_x_e;
    wire [0:0] delay_FIFO_0_imag_x_t;
    wire [31:0] delay_FIFO_0_imag_x_q;
    wire [0:0] delay_FIFO_0_imag_x_empty;
    wire [0:0] delay_FIFO_0_imag_x_v;
    wire delay_FIFO_0_real_x_reset;
    wire [0:0] delay_FIFO_0_real_x_f;
    wire [0:0] delay_FIFO_0_real_x_e;
    wire [0:0] delay_FIFO_0_real_x_t;
    wire [31:0] delay_FIFO_0_real_x_q;
    wire [0:0] delay_FIFO_0_real_x_empty;
    wire [0:0] delay_FIFO_0_real_x_v;
    wire delay_FIFO_1_imag_x_reset;
    wire [0:0] delay_FIFO_1_imag_x_f;
    wire [0:0] delay_FIFO_1_imag_x_e;
    wire [0:0] delay_FIFO_1_imag_x_t;
    wire [31:0] delay_FIFO_1_imag_x_q;
    wire [0:0] delay_FIFO_1_imag_x_empty;
    wire [0:0] delay_FIFO_1_imag_x_v;
    wire delay_FIFO_1_real_x_reset;
    wire [0:0] delay_FIFO_1_real_x_f;
    wire [0:0] delay_FIFO_1_real_x_e;
    wire [0:0] delay_FIFO_1_real_x_t;
    wire [31:0] delay_FIFO_1_real_x_q;
    wire [0:0] delay_FIFO_1_real_x_empty;
    wire [0:0] delay_FIFO_1_real_x_v;
    wire delay_FIFO_2_imag_x_reset;
    wire [0:0] delay_FIFO_2_imag_x_f;
    wire [0:0] delay_FIFO_2_imag_x_e;
    wire [0:0] delay_FIFO_2_imag_x_t;
    wire [31:0] delay_FIFO_2_imag_x_q;
    wire [0:0] delay_FIFO_2_imag_x_empty;
    wire [0:0] delay_FIFO_2_imag_x_v;
    wire delay_FIFO_2_real_x_reset;
    wire [0:0] delay_FIFO_2_real_x_f;
    wire [0:0] delay_FIFO_2_real_x_e;
    wire [0:0] delay_FIFO_2_real_x_t;
    wire [31:0] delay_FIFO_2_real_x_q;
    wire [0:0] delay_FIFO_2_real_x_empty;
    wire [0:0] delay_FIFO_2_real_x_v;
    wire delay_FIFO_3_imag_x_reset;
    wire [0:0] delay_FIFO_3_imag_x_f;
    wire [0:0] delay_FIFO_3_imag_x_e;
    wire [0:0] delay_FIFO_3_imag_x_t;
    wire [31:0] delay_FIFO_3_imag_x_q;
    wire [0:0] delay_FIFO_3_imag_x_empty;
    wire [0:0] delay_FIFO_3_imag_x_v;
    wire delay_FIFO_3_real_x_reset;
    wire [0:0] delay_FIFO_3_real_x_f;
    wire [0:0] delay_FIFO_3_real_x_e;
    wire [0:0] delay_FIFO_3_real_x_t;
    wire [31:0] delay_FIFO_3_real_x_q;
    wire [0:0] delay_FIFO_3_real_x_empty;
    wire [0:0] delay_FIFO_3_real_x_v;

    import ddc_model_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // Const1_0_x(CONSTANT,11)
    assign Const1_0_x_q = $unsigned(32'b00000000000000000000000000000000);

    // Complex_NCO(BLACKBOX,4)
    ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO theComplex_NCO (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .xIn_c(in_3_c_tpl),
        .xIn_v(in_2_v_tpl),
        .xIn_p_0(Const1_0_x_q),
        .xIn_p_1(Const1_0_x_q),
        .xIn_p_2(Const1_0_x_q),
        .xIn_p_3(Const1_0_x_q),
        .xIn_s_0(in_4_0_sync_tpl),
        .xIn_s_1(in_4_1_sync_tpl),
        .xIn_s_2(in_4_2_sync_tpl),
        .xIn_s_3(in_4_3_sync_tpl),
        .busOut_readdata(Complex_NCO_busOut_readdata),
        .busOut_readdatavalid(Complex_NCO_busOut_readdatavalid),
        .sinOut_0(Complex_NCO_sinOut_0),
        .sinOut_1(Complex_NCO_sinOut_1),
        .sinOut_2(Complex_NCO_sinOut_2),
        .sinOut_3(Complex_NCO_sinOut_3),
        .cosOut_0(Complex_NCO_cosOut_0),
        .cosOut_1(Complex_NCO_cosOut_1),
        .cosOut_2(Complex_NCO_cosOut_2),
        .cosOut_3(Complex_NCO_cosOut_3),
        .ncoOut_v(Complex_NCO_ncoOut_v),
        .ncoOut_c(Complex_NCO_ncoOut_c),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // busOut(BUSOUT,7)
    assign busOut_readdatavalid = Complex_NCO_busOut_readdatavalid;
    assign busOut_readdata = Complex_NCO_busOut_readdata;

    // delay_FIFO_3_imag_x(FIFO,21)
    assign delay_FIFO_3_imag_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(63),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(64),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(32),
        .lpm_widthu(6),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) delay_FIFO_3_imag_x_fifo (
        .aclr(1'b0),
        .sclr(delay_FIFO_3_imag_x_reset),
        .clock(clk),
        .rdreq(Complex_NCO_ncoOut_v[0]),
        .wrreq(in_2_v_tpl[0]),
        .data(in_1_3_imag_d0_tpl),
        .almost_full(delay_FIFO_3_imag_x_f[0]),
        .almost_empty(delay_FIFO_3_imag_x_t[0]),
        .empty(delay_FIFO_3_imag_x_empty[0]),
        .q(delay_FIFO_3_imag_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign delay_FIFO_3_imag_x_e = ~ (delay_FIFO_3_imag_x_t);
    assign delay_FIFO_3_imag_x_v = ~ (delay_FIFO_3_imag_x_empty);

    // delay_FIFO_2_imag_x(FIFO,19)
    assign delay_FIFO_2_imag_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(63),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(64),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(32),
        .lpm_widthu(6),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) delay_FIFO_2_imag_x_fifo (
        .aclr(1'b0),
        .sclr(delay_FIFO_2_imag_x_reset),
        .clock(clk),
        .rdreq(Complex_NCO_ncoOut_v[0]),
        .wrreq(in_2_v_tpl[0]),
        .data(in_1_2_imag_d0_tpl),
        .almost_full(delay_FIFO_2_imag_x_f[0]),
        .almost_empty(delay_FIFO_2_imag_x_t[0]),
        .empty(delay_FIFO_2_imag_x_empty[0]),
        .q(delay_FIFO_2_imag_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign delay_FIFO_2_imag_x_e = ~ (delay_FIFO_2_imag_x_t);
    assign delay_FIFO_2_imag_x_v = ~ (delay_FIFO_2_imag_x_empty);

    // delay_FIFO_1_imag_x(FIFO,17)
    assign delay_FIFO_1_imag_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(63),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(64),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(32),
        .lpm_widthu(6),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) delay_FIFO_1_imag_x_fifo (
        .aclr(1'b0),
        .sclr(delay_FIFO_1_imag_x_reset),
        .clock(clk),
        .rdreq(Complex_NCO_ncoOut_v[0]),
        .wrreq(in_2_v_tpl[0]),
        .data(in_1_1_imag_d0_tpl),
        .almost_full(delay_FIFO_1_imag_x_f[0]),
        .almost_empty(delay_FIFO_1_imag_x_t[0]),
        .empty(delay_FIFO_1_imag_x_empty[0]),
        .q(delay_FIFO_1_imag_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign delay_FIFO_1_imag_x_e = ~ (delay_FIFO_1_imag_x_t);
    assign delay_FIFO_1_imag_x_v = ~ (delay_FIFO_1_imag_x_empty);

    // delay_FIFO_0_imag_x(FIFO,15)
    assign delay_FIFO_0_imag_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(63),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(64),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(32),
        .lpm_widthu(6),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) delay_FIFO_0_imag_x_fifo (
        .aclr(1'b0),
        .sclr(delay_FIFO_0_imag_x_reset),
        .clock(clk),
        .rdreq(Complex_NCO_ncoOut_v[0]),
        .wrreq(in_2_v_tpl[0]),
        .data(in_1_0_imag_d0_tpl),
        .almost_full(delay_FIFO_0_imag_x_f[0]),
        .almost_empty(delay_FIFO_0_imag_x_t[0]),
        .empty(delay_FIFO_0_imag_x_empty[0]),
        .q(delay_FIFO_0_imag_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign delay_FIFO_0_imag_x_e = ~ (delay_FIFO_0_imag_x_t);
    assign delay_FIFO_0_imag_x_v = ~ (delay_FIFO_0_imag_x_empty);

    // delay_FIFO_3_real_x(FIFO,22)
    assign delay_FIFO_3_real_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(63),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(64),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(32),
        .lpm_widthu(6),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) delay_FIFO_3_real_x_fifo (
        .aclr(1'b0),
        .sclr(delay_FIFO_3_real_x_reset),
        .clock(clk),
        .rdreq(Complex_NCO_ncoOut_v[0]),
        .wrreq(in_2_v_tpl[0]),
        .data(in_1_3_real_d0_tpl),
        .almost_full(delay_FIFO_3_real_x_f[0]),
        .almost_empty(delay_FIFO_3_real_x_t[0]),
        .empty(delay_FIFO_3_real_x_empty[0]),
        .q(delay_FIFO_3_real_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign delay_FIFO_3_real_x_e = ~ (delay_FIFO_3_real_x_t);
    assign delay_FIFO_3_real_x_v = ~ (delay_FIFO_3_real_x_empty);

    // delay_FIFO_2_real_x(FIFO,20)
    assign delay_FIFO_2_real_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(63),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(64),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(32),
        .lpm_widthu(6),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) delay_FIFO_2_real_x_fifo (
        .aclr(1'b0),
        .sclr(delay_FIFO_2_real_x_reset),
        .clock(clk),
        .rdreq(Complex_NCO_ncoOut_v[0]),
        .wrreq(in_2_v_tpl[0]),
        .data(in_1_2_real_d0_tpl),
        .almost_full(delay_FIFO_2_real_x_f[0]),
        .almost_empty(delay_FIFO_2_real_x_t[0]),
        .empty(delay_FIFO_2_real_x_empty[0]),
        .q(delay_FIFO_2_real_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign delay_FIFO_2_real_x_e = ~ (delay_FIFO_2_real_x_t);
    assign delay_FIFO_2_real_x_v = ~ (delay_FIFO_2_real_x_empty);

    // delay_FIFO_1_real_x(FIFO,18)
    assign delay_FIFO_1_real_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(63),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(64),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(32),
        .lpm_widthu(6),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) delay_FIFO_1_real_x_fifo (
        .aclr(1'b0),
        .sclr(delay_FIFO_1_real_x_reset),
        .clock(clk),
        .rdreq(Complex_NCO_ncoOut_v[0]),
        .wrreq(in_2_v_tpl[0]),
        .data(in_1_1_real_d0_tpl),
        .almost_full(delay_FIFO_1_real_x_f[0]),
        .almost_empty(delay_FIFO_1_real_x_t[0]),
        .empty(delay_FIFO_1_real_x_empty[0]),
        .q(delay_FIFO_1_real_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign delay_FIFO_1_real_x_e = ~ (delay_FIFO_1_real_x_t);
    assign delay_FIFO_1_real_x_v = ~ (delay_FIFO_1_real_x_empty);

    // delay_FIFO_0_real_x(FIFO,16)
    assign delay_FIFO_0_real_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(63),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(64),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(32),
        .lpm_widthu(6),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) delay_FIFO_0_real_x_fifo (
        .aclr(1'b0),
        .sclr(delay_FIFO_0_real_x_reset),
        .clock(clk),
        .rdreq(Complex_NCO_ncoOut_v[0]),
        .wrreq(in_2_v_tpl[0]),
        .data(in_1_0_real_d0_tpl),
        .almost_full(delay_FIFO_0_real_x_f[0]),
        .almost_empty(delay_FIFO_0_real_x_t[0]),
        .empty(delay_FIFO_0_real_x_empty[0]),
        .q(delay_FIFO_0_real_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign delay_FIFO_0_real_x_e = ~ (delay_FIFO_0_real_x_t);
    assign delay_FIFO_0_real_x_v = ~ (delay_FIFO_0_real_x_empty);

    // ComplexMixer(BLACKBOX,2)
    ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer theComplexMixer (
        .iIn_0(delay_FIFO_0_real_x_q),
        .iIn_1(delay_FIFO_1_real_x_q),
        .iIn_2(delay_FIFO_2_real_x_q),
        .iIn_3(delay_FIFO_3_real_x_q),
        .qIn_0(delay_FIFO_0_imag_x_q),
        .qIn_1(delay_FIFO_1_imag_x_q),
        .qIn_2(delay_FIFO_2_imag_x_q),
        .qIn_3(delay_FIFO_3_imag_x_q),
        .In_v(Complex_NCO_ncoOut_v),
        .In_c(Complex_NCO_ncoOut_c),
        .sIn_0(Complex_NCO_sinOut_0),
        .sIn_1(Complex_NCO_sinOut_1),
        .sIn_2(Complex_NCO_sinOut_2),
        .sIn_3(Complex_NCO_sinOut_3),
        .cIn_0(Complex_NCO_cosOut_0),
        .cIn_1(Complex_NCO_cosOut_1),
        .cIn_2(Complex_NCO_cosOut_2),
        .cIn_3(Complex_NCO_cosOut_3),
        .iOut_0(ComplexMixer_iOut_0),
        .iOut_1(ComplexMixer_iOut_1),
        .iOut_2(ComplexMixer_iOut_2),
        .iOut_3(ComplexMixer_iOut_3),
        .qOut_0(ComplexMixer_qOut_0),
        .qOut_1(ComplexMixer_qOut_1),
        .qOut_2(ComplexMixer_qOut_2),
        .qOut_3(ComplexMixer_qOut_3),
        .Out_v(ComplexMixer_Out_v),
        .Out_c(ComplexMixer_Out_c),
        .clk(clk),
        .areset(areset)
    );

    // ComplexMixer_Scale(BLACKBOX,3)
    ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_Scale theComplexMixer_Scale (
        .xIn_0(ComplexMixer_iOut_0),
        .xIn_1(ComplexMixer_iOut_1),
        .xIn_2(ComplexMixer_iOut_2),
        .xIn_3(ComplexMixer_iOut_3),
        .xIn_4(ComplexMixer_qOut_0),
        .xIn_5(ComplexMixer_qOut_1),
        .xIn_6(ComplexMixer_qOut_2),
        .xIn_7(ComplexMixer_qOut_3),
        .xIn_v(ComplexMixer_Out_v),
        .xIn_c(ComplexMixer_Out_c),
        .gain_i(GND_q),
        .qOut_0(ComplexMixer_Scale_qOut_0),
        .qOut_1(ComplexMixer_Scale_qOut_1),
        .qOut_2(ComplexMixer_Scale_qOut_2),
        .qOut_3(ComplexMixer_Scale_qOut_3),
        .qOut_4(ComplexMixer_Scale_qOut_4),
        .qOut_5(ComplexMixer_Scale_qOut_5),
        .qOut_6(ComplexMixer_Scale_qOut_6),
        .qOut_7(ComplexMixer_Scale_qOut_7),
        .qOut_v(ComplexMixer_Scale_qOut_v),
        .qOut_c(ComplexMixer_Scale_qOut_c),
        .eOut_0(),
        .eOut_1(),
        .eOut_2(),
        .eOut_3(),
        .eOut_4(),
        .eOut_5(),
        .eOut_6(),
        .eOut_7(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_0_imag_q0_tpl(GPOUT,37)
    assign out_1_0_imag_q0_tpl = ComplexMixer_Scale_qOut_4;

    // out_1_0_real_q0_tpl(GPOUT,38)
    assign out_1_0_real_q0_tpl = ComplexMixer_Scale_qOut_0;

    // out_1_1_imag_q0_tpl(GPOUT,39)
    assign out_1_1_imag_q0_tpl = ComplexMixer_Scale_qOut_5;

    // out_1_1_real_q0_tpl(GPOUT,40)
    assign out_1_1_real_q0_tpl = ComplexMixer_Scale_qOut_1;

    // out_1_2_imag_q0_tpl(GPOUT,41)
    assign out_1_2_imag_q0_tpl = ComplexMixer_Scale_qOut_6;

    // out_1_2_real_q0_tpl(GPOUT,42)
    assign out_1_2_real_q0_tpl = ComplexMixer_Scale_qOut_2;

    // out_1_3_imag_q0_tpl(GPOUT,43)
    assign out_1_3_imag_q0_tpl = ComplexMixer_Scale_qOut_7;

    // out_1_3_real_q0_tpl(GPOUT,44)
    assign out_1_3_real_q0_tpl = ComplexMixer_Scale_qOut_3;

    // out_2_qv_tpl(GPOUT,45)
    assign out_2_qv_tpl = ComplexMixer_Scale_qOut_v;

    // out_3_qc_tpl(GPOUT,46)
    assign out_3_qc_tpl = ComplexMixer_Scale_qOut_c;

endmodule
