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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Scale
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Scale (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [34:0] xIn_0,
    input wire [34:0] xIn_1,
    input wire [0:0] gain_i,
    output wire [0:0] qOut_v,
    output wire [7:0] qOut_c,
    output wire [15:0] qOut_0,
    output wire [15:0] qOut_1,
    output wire [0:0] eOut_0,
    output wire [0:0] eOut_1,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [15:0] u0_lowconst_q;
    wire [15:0] u0_highconst_q;
    wire [21:0] u0_low_a;
    wire [21:0] u0_low_b;
    logic [21:0] u0_low_o;
    wire [0:0] u0_low_c;
    wire [21:0] u0_high_a;
    wire [21:0] u0_high_b;
    logic [21:0] u0_high_o;
    wire [0:0] u0_high_c;
    wire [21:0] u1_low_a;
    wire [21:0] u1_low_b;
    logic [21:0] u1_low_o;
    wire [0:0] u1_low_c;
    wire [21:0] u1_high_a;
    wire [21:0] u1_high_b;
    logic [21:0] u1_high_o;
    wire [0:0] u1_high_c;
    wire [1:0] u0_rnd_bias_q;
    reg [19:0] redist0_u1_rnd_shift_q_1_q;
    reg [19:0] redist1_u1_rnd_shift_q_2_q;
    reg [19:0] redist2_u0_rnd_shift_q_1_q;
    reg [19:0] redist3_u0_rnd_shift_q_2_q;
    reg [15:0] redist4_u1_mux_q_1_q;
    reg [0:0] redist5_u1_mux_v_1_q;
    reg [15:0] redist6_u0_mux_q_1_q;
    reg [0:0] redist7_u0_mux_v_1_q;
    reg [0:0] redist8_xIn_v_3_q;
    reg [0:0] redist8_xIn_v_3_delay_0;
    reg [0:0] redist8_xIn_v_3_delay_1;
    reg [7:0] redist9_xIn_c_3_q;
    reg [7:0] redist9_xIn_c_3_delay_0;
    reg [7:0] redist9_xIn_c_3_delay_1;
    reg [15:0] u0_mux_q;
    reg [0:0] u0_mux_v;
    reg [15:0] u1_mux_q;
    reg [0:0] u1_mux_v;
    wire [34:0] u0_shiftsel_q;
    wire [34:0] u0_shiftsel_qint;
    wire [34:0] u1_shiftsel_q;
    wire [34:0] u1_shiftsel_qint;
    wire [19:0] u0_rnd_trunc_q;
    wire [34:0] u0_rnd_trunc_qint;
    wire [19:0] u1_rnd_trunc_q;
    wire [34:0] u1_rnd_trunc_qint;
    wire [20:0] u0_rnd_add_a;
    wire [20:0] u0_rnd_add_b;
    logic [20:0] u0_rnd_add_o;
    wire [20:0] u0_rnd_add_q;
    wire [20:0] u1_rnd_add_a;
    wire [20:0] u1_rnd_add_b;
    logic [20:0] u1_rnd_add_o;
    wire [20:0] u1_rnd_add_q;
    wire [19:0] u0_rnd_shift_q;
    wire [20:0] u0_rnd_shift_qint;
    wire [19:0] u1_rnd_shift_q;
    wire [20:0] u1_rnd_shift_qint;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // u0_rnd_bias(CONSTANT,19)
    assign u0_rnd_bias_q = $unsigned(2'b01);

    // u1_shiftsel(BITSHIFT,11)@0
    assign u1_shiftsel_qint = xIn_1;
    assign u1_shiftsel_q = u1_shiftsel_qint[34:0];

    // u1_rnd_trunc(BITSHIFT,25)@0
    assign u1_rnd_trunc_qint = u1_shiftsel_q;
    assign u1_rnd_trunc_q = u1_rnd_trunc_qint[34:15];

    // u1_rnd_add(ADD,26)@0
    assign u1_rnd_add_a = $unsigned({{1{u1_rnd_trunc_q[19]}}, u1_rnd_trunc_q});
    assign u1_rnd_add_b = $unsigned({{19{u0_rnd_bias_q[1]}}, u0_rnd_bias_q});
    assign u1_rnd_add_o = $unsigned($signed(u1_rnd_add_a) + $signed(u1_rnd_add_b));
    assign u1_rnd_add_q = u1_rnd_add_o[20:0];

    // u1_rnd_shift(BITSHIFT,27)@0
    assign u1_rnd_shift_qint = u1_rnd_add_q;
    assign u1_rnd_shift_q = u1_rnd_shift_qint[20:1];

    // redist0_u1_rnd_shift_q_1(DELAY,29)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_u1_rnd_shift_q_1_q <= '0;
        end
        else
        begin
            redist0_u1_rnd_shift_q_1_q <= $unsigned(u1_rnd_shift_q);
        end
    end

    // redist1_u1_rnd_shift_q_2(DELAY,30)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_u1_rnd_shift_q_2_q <= '0;
        end
        else
        begin
            redist1_u1_rnd_shift_q_2_q <= $unsigned(redist0_u1_rnd_shift_q_1_q);
        end
    end

    // u0_highconst(CONSTANT,7)
    assign u0_highconst_q = $unsigned(16'b0111111111111111);

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // u1_high(COMPARE,16)@1 + 1
    assign u1_high_a = $unsigned({{6{u0_highconst_q[15]}}, u0_highconst_q});
    assign u1_high_b = $unsigned({{2{redist0_u1_rnd_shift_q_1_q[19]}}, redist0_u1_rnd_shift_q_1_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_high_o <= 22'b0;
        end
        else
        begin
            u1_high_o <= $unsigned($signed(u1_high_a) - $signed(u1_high_b));
        end
    end
    assign u1_high_c[0] = u1_high_o[21];

    // u0_lowconst(CONSTANT,6)
    assign u0_lowconst_q = $unsigned(16'b1000000000000001);

    // u1_low(COMPARE,15)@1 + 1
    assign u1_low_a = $unsigned({{2{redist0_u1_rnd_shift_q_1_q[19]}}, redist0_u1_rnd_shift_q_1_q});
    assign u1_low_b = $unsigned({{6{u0_lowconst_q[15]}}, u0_lowconst_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_low_o <= 22'b0;
        end
        else
        begin
            u1_low_o <= $unsigned($signed(u1_low_a) - $signed(u1_low_b));
        end
    end
    assign u1_low_c[0] = u1_low_o[21];

    // u1_mux(SELECTOR,17)@2
    always @(u1_low_c or u0_lowconst_q or u1_high_c or u0_highconst_q or redist1_u1_rnd_shift_q_2_q)
    begin
        u1_mux_q = $unsigned(redist1_u1_rnd_shift_q_2_q[15:0]);
        u1_mux_v = $unsigned(1'b0);
        if (u1_high_c == 1'b1)
        begin
            u1_mux_q = $unsigned(u0_highconst_q);
            u1_mux_v = $unsigned(1'b1);
        end
        if (u1_low_c == 1'b1)
        begin
            u1_mux_q = $unsigned(u0_lowconst_q);
            u1_mux_v = $unsigned(1'b1);
        end
    end

    // redist5_u1_mux_v_1(DELAY,34)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist5_u1_mux_v_1_q <= '0;
        end
        else
        begin
            redist5_u1_mux_v_1_q <= $unsigned(u1_mux_v);
        end
    end

    // u0_shiftsel(BITSHIFT,4)@0
    assign u0_shiftsel_qint = xIn_0;
    assign u0_shiftsel_q = u0_shiftsel_qint[34:0];

    // u0_rnd_trunc(BITSHIFT,20)@0
    assign u0_rnd_trunc_qint = u0_shiftsel_q;
    assign u0_rnd_trunc_q = u0_rnd_trunc_qint[34:15];

    // u0_rnd_add(ADD,21)@0
    assign u0_rnd_add_a = $unsigned({{1{u0_rnd_trunc_q[19]}}, u0_rnd_trunc_q});
    assign u0_rnd_add_b = $unsigned({{19{u0_rnd_bias_q[1]}}, u0_rnd_bias_q});
    assign u0_rnd_add_o = $unsigned($signed(u0_rnd_add_a) + $signed(u0_rnd_add_b));
    assign u0_rnd_add_q = u0_rnd_add_o[20:0];

    // u0_rnd_shift(BITSHIFT,22)@0
    assign u0_rnd_shift_qint = u0_rnd_add_q;
    assign u0_rnd_shift_q = u0_rnd_shift_qint[20:1];

    // redist2_u0_rnd_shift_q_1(DELAY,31)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_u0_rnd_shift_q_1_q <= '0;
        end
        else
        begin
            redist2_u0_rnd_shift_q_1_q <= $unsigned(u0_rnd_shift_q);
        end
    end

    // redist3_u0_rnd_shift_q_2(DELAY,32)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist3_u0_rnd_shift_q_2_q <= '0;
        end
        else
        begin
            redist3_u0_rnd_shift_q_2_q <= $unsigned(redist2_u0_rnd_shift_q_1_q);
        end
    end

    // u0_high(COMPARE,9)@1 + 1
    assign u0_high_a = $unsigned({{6{u0_highconst_q[15]}}, u0_highconst_q});
    assign u0_high_b = $unsigned({{2{redist2_u0_rnd_shift_q_1_q[19]}}, redist2_u0_rnd_shift_q_1_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_high_o <= 22'b0;
        end
        else
        begin
            u0_high_o <= $unsigned($signed(u0_high_a) - $signed(u0_high_b));
        end
    end
    assign u0_high_c[0] = u0_high_o[21];

    // u0_low(COMPARE,8)@1 + 1
    assign u0_low_a = $unsigned({{2{redist2_u0_rnd_shift_q_1_q[19]}}, redist2_u0_rnd_shift_q_1_q});
    assign u0_low_b = $unsigned({{6{u0_lowconst_q[15]}}, u0_lowconst_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_low_o <= 22'b0;
        end
        else
        begin
            u0_low_o <= $unsigned($signed(u0_low_a) - $signed(u0_low_b));
        end
    end
    assign u0_low_c[0] = u0_low_o[21];

    // u0_mux(SELECTOR,10)@2
    always @(u0_low_c or u0_lowconst_q or u0_high_c or u0_highconst_q or redist3_u0_rnd_shift_q_2_q)
    begin
        u0_mux_q = $unsigned(redist3_u0_rnd_shift_q_2_q[15:0]);
        u0_mux_v = $unsigned(1'b0);
        if (u0_high_c == 1'b1)
        begin
            u0_mux_q = $unsigned(u0_highconst_q);
            u0_mux_v = $unsigned(1'b1);
        end
        if (u0_low_c == 1'b1)
        begin
            u0_mux_q = $unsigned(u0_lowconst_q);
            u0_mux_v = $unsigned(1'b1);
        end
    end

    // redist7_u0_mux_v_1(DELAY,36)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist7_u0_mux_v_1_q <= '0;
        end
        else
        begin
            redist7_u0_mux_v_1_q <= $unsigned(u0_mux_v);
        end
    end

    // redist4_u1_mux_q_1(DELAY,33)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist4_u1_mux_q_1_q <= '0;
        end
        else
        begin
            redist4_u1_mux_q_1_q <= $unsigned(u1_mux_q);
        end
    end

    // redist6_u0_mux_q_1(DELAY,35)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist6_u0_mux_q_1_q <= '0;
        end
        else
        begin
            redist6_u0_mux_q_1_q <= $unsigned(u0_mux_q);
        end
    end

    // redist9_xIn_c_3(DELAY,38)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist9_xIn_c_3_delay_0 <= '0;
        end
        else
        begin
            redist9_xIn_c_3_delay_0 <= $unsigned(xIn_c);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_xIn_c_3_delay_1 <= redist9_xIn_c_3_delay_0;
            redist9_xIn_c_3_q <= redist9_xIn_c_3_delay_1;
        end
    end

    // redist8_xIn_v_3(DELAY,37)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist8_xIn_v_3_delay_0 <= '0;
        end
        else
        begin
            redist8_xIn_v_3_delay_0 <= $unsigned(xIn_v);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_xIn_v_3_delay_1 <= redist8_xIn_v_3_delay_0;
            redist8_xIn_v_3_q <= redist8_xIn_v_3_delay_1;
        end
    end

    // qOut(PORTOUT,18)@3 + 1
    assign qOut_v = redist8_xIn_v_3_q;
    assign qOut_c = redist9_xIn_c_3_q;
    assign qOut_0 = redist6_u0_mux_q_1_q;
    assign qOut_1 = redist4_u1_mux_q_1_q;
    assign eOut_0 = redist7_u0_mux_v_1_q;
    assign eOut_1 = redist5_u1_mux_v_1_q;

endmodule
