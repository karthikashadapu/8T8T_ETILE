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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER (
    input wire [31:0] busIn_writedata,
    input wire [1:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    input wire [15:0] in_1_imag_din_tpl,
    input wire [15:0] in_1_real_din_tpl,
    input wire [0:0] in_2_vin_tpl,
    input wire [7:0] in_3_chin_tpl,
    input wire [0:0] in_4_sync_tpl,
    output wire [15:0] out_1_imag_dout_tpl,
    output wire [15:0] out_1_real_dout_tpl,
    output wire [0:0] out_2_vout_tpl,
    output wire [7:0] out_3_cout_tpl,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [34:0] ComplexMixer1_iOut_0;
    wire [34:0] ComplexMixer1_qOut_0;
    wire [0:0] ComplexMixer1_Out_v;
    wire [7:0] ComplexMixer1_Out_c;
    wire [29:0] Const6_q;
    wire [31:0] NCO1_busOut_readdata;
    wire [0:0] NCO1_busOut_readdatavalid;
    wire [17:0] NCO1_sinOut_0;
    wire [17:0] NCO1_cosOut_0;
    wire [0:0] NCO1_ncoOut_v;
    wire [7:0] NCO1_ncoOut_c;
    reg [0:0] SampleDelay_q;
    reg [7:0] SampleDelay1_q;
    wire [15:0] Scale_qOut_0;
    wire [0:0] Scale_qOut_v;
    wire [7:0] Scale_qOut_c;
    wire [15:0] Scale1_qOut_0;
    wire delay_FIFO_imag_x_reset;
    wire [0:0] delay_FIFO_imag_x_f;
    wire [0:0] delay_FIFO_imag_x_e;
    wire [0:0] delay_FIFO_imag_x_t;
    wire [15:0] delay_FIFO_imag_x_q;
    wire [0:0] delay_FIFO_imag_x_empty;
    wire [0:0] delay_FIFO_imag_x_v;
    wire delay_FIFO_real_x_reset;
    wire [0:0] delay_FIFO_real_x_f;
    wire [0:0] delay_FIFO_real_x_e;
    wire [0:0] delay_FIFO_real_x_t;
    wire [15:0] delay_FIFO_real_x_q;
    wire [0:0] delay_FIFO_real_x_empty;
    wire [0:0] delay_FIFO_real_x_v;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // Const6(CONSTANT,5)
    assign Const6_q = $unsigned(30'b000000000000000000000000000000);

    // SampleDelay(DELAY,7)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            SampleDelay_q <= '0;
        end
        else
        begin
            SampleDelay_q <= in_2_vin_tpl;
        end
    end

    // SampleDelay1(DELAY,8)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            SampleDelay1_q <= '0;
        end
        else
        begin
            SampleDelay1_q <= in_3_chin_tpl;
        end
    end

    // NCO1(BLACKBOX,6)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_NCO1 theNCO1 (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .xIn_c(SampleDelay1_q),
        .xIn_v(SampleDelay_q),
        .xIn_p_0(Const6_q),
        .xIn_s_0(GND_q),
        .busOut_readdata(NCO1_busOut_readdata),
        .busOut_readdatavalid(NCO1_busOut_readdatavalid),
        .sinOut_0(NCO1_sinOut_0),
        .cosOut_0(NCO1_cosOut_0),
        .ncoOut_v(NCO1_ncoOut_v),
        .ncoOut_c(NCO1_ncoOut_c),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // busOut(BUSOUT,12)
    assign busOut_readdatavalid = NCO1_busOut_readdatavalid;
    assign busOut_readdata = NCO1_busOut_readdata;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // delay_FIFO_imag_x(FIFO,16)
    assign delay_FIFO_imag_x_reset = areset;
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
    ) delay_FIFO_imag_x_fifo (
        .aclr(1'b0),
        .sclr(delay_FIFO_imag_x_reset),
        .clock(clk),
        .rdreq(NCO1_ncoOut_v[0]),
        .wrreq(in_2_vin_tpl[0]),
        .data(in_1_imag_din_tpl),
        .almost_full(delay_FIFO_imag_x_f[0]),
        .almost_empty(delay_FIFO_imag_x_t[0]),
        .empty(delay_FIFO_imag_x_empty[0]),
        .q(delay_FIFO_imag_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign delay_FIFO_imag_x_e = ~ (delay_FIFO_imag_x_t);
    assign delay_FIFO_imag_x_v = ~ (delay_FIFO_imag_x_empty);

    // delay_FIFO_real_x(FIFO,17)
    assign delay_FIFO_real_x_reset = areset;
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
    ) delay_FIFO_real_x_fifo (
        .aclr(1'b0),
        .sclr(delay_FIFO_real_x_reset),
        .clock(clk),
        .rdreq(NCO1_ncoOut_v[0]),
        .wrreq(in_2_vin_tpl[0]),
        .data(in_1_real_din_tpl),
        .almost_full(delay_FIFO_real_x_f[0]),
        .almost_empty(delay_FIFO_real_x_t[0]),
        .empty(delay_FIFO_real_x_empty[0]),
        .q(delay_FIFO_real_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign delay_FIFO_real_x_e = ~ (delay_FIFO_real_x_t);
    assign delay_FIFO_real_x_v = ~ (delay_FIFO_real_x_empty);

    // ComplexMixer1(BLACKBOX,2)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_ComplexMixer1 theComplexMixer1 (
        .iIn_0(delay_FIFO_real_x_q),
        .qIn_0(delay_FIFO_imag_x_q),
        .In_v(NCO1_ncoOut_v),
        .In_c(NCO1_ncoOut_c),
        .sIn_0(NCO1_sinOut_0),
        .cIn_0(NCO1_cosOut_0),
        .iOut_0(ComplexMixer1_iOut_0),
        .qOut_0(ComplexMixer1_qOut_0),
        .Out_v(ComplexMixer1_Out_v),
        .Out_c(ComplexMixer1_Out_c),
        .clk(clk),
        .areset(areset)
    );

    // Scale1(BLACKBOX,10)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_Scale1 theScale1 (
        .xIn_0(ComplexMixer1_qOut_0),
        .xIn_v(ComplexMixer1_Out_v),
        .xIn_c(ComplexMixer1_Out_c),
        .gain_i(VCC_q),
        .qOut_0(Scale1_qOut_0),
        .qOut_v(),
        .qOut_c(),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_imag_dout_tpl(GPOUT,23)
    assign out_1_imag_dout_tpl = Scale1_qOut_0;

    // Scale(BLACKBOX,9)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_Scale theScale (
        .xIn_0(ComplexMixer1_iOut_0),
        .xIn_v(ComplexMixer1_Out_v),
        .xIn_c(ComplexMixer1_Out_c),
        .gain_i(VCC_q),
        .qOut_0(Scale_qOut_0),
        .qOut_v(Scale_qOut_v),
        .qOut_c(Scale_qOut_c),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_real_dout_tpl(GPOUT,24)
    assign out_1_real_dout_tpl = Scale_qOut_0;

    // out_2_vout_tpl(GPOUT,25)
    assign out_2_vout_tpl = Scale_qOut_v;

    // out_3_cout_tpl(GPOUT,26)
    assign out_3_cout_tpl = Scale_qOut_c;

endmodule
