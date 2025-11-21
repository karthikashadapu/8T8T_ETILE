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

// SystemVerilog created from duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_Scale1
// SystemVerilog created on Thu Jan  9 15:34:39 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_Scale1 (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [32:0] xIn_0,
    input wire [32:0] xIn_1,
    input wire [32:0] xIn_2,
    input wire [32:0] xIn_3,
    input wire [32:0] xIn_4,
    input wire [32:0] xIn_5,
    input wire [32:0] xIn_6,
    input wire [32:0] xIn_7,
    input wire [0:0] gain_i,
    output wire [0:0] qOut_v,
    output wire [7:0] qOut_c,
    output wire [15:0] qOut_0,
    output wire [15:0] qOut_1,
    output wire [15:0] qOut_2,
    output wire [15:0] qOut_3,
    output wire [15:0] qOut_4,
    output wire [15:0] qOut_5,
    output wire [15:0] qOut_6,
    output wire [15:0] qOut_7,
    output wire [0:0] eOut_0,
    output wire [0:0] eOut_1,
    output wire [0:0] eOut_2,
    output wire [0:0] eOut_3,
    output wire [0:0] eOut_4,
    output wire [0:0] eOut_5,
    output wire [0:0] eOut_6,
    output wire [0:0] eOut_7,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [1:0] u0_rnd_bias_q;
    reg [18:0] redist0_u7_rnd_shift_q_1_q;
    reg [18:0] redist1_u6_rnd_shift_q_1_q;
    reg [18:0] redist2_u5_rnd_shift_q_1_q;
    reg [18:0] redist3_u4_rnd_shift_q_1_q;
    reg [18:0] redist4_u3_rnd_shift_q_1_q;
    reg [18:0] redist5_u2_rnd_shift_q_1_q;
    reg [18:0] redist6_u1_rnd_shift_q_1_q;
    reg [18:0] redist7_u0_rnd_shift_q_1_q;
    reg [0:0] redist8_xIn_v_1_q;
    reg [7:0] redist9_xIn_c_1_q;
    wire [32:0] u0_shiftsel_q;
    wire [32:0] u0_shiftsel_qint;
    wire [32:0] u1_shiftsel_q;
    wire [32:0] u1_shiftsel_qint;
    wire [32:0] u2_shiftsel_q;
    wire [32:0] u2_shiftsel_qint;
    wire [32:0] u3_shiftsel_q;
    wire [32:0] u3_shiftsel_qint;
    wire [32:0] u4_shiftsel_q;
    wire [32:0] u4_shiftsel_qint;
    wire [32:0] u5_shiftsel_q;
    wire [32:0] u5_shiftsel_qint;
    wire [32:0] u6_shiftsel_q;
    wire [32:0] u6_shiftsel_qint;
    wire [32:0] u7_shiftsel_q;
    wire [32:0] u7_shiftsel_qint;
    wire [18:0] u0_rnd_trunc_q;
    wire [32:0] u0_rnd_trunc_qint;
    wire [18:0] u1_rnd_trunc_q;
    wire [32:0] u1_rnd_trunc_qint;
    wire [18:0] u2_rnd_trunc_q;
    wire [32:0] u2_rnd_trunc_qint;
    wire [18:0] u3_rnd_trunc_q;
    wire [32:0] u3_rnd_trunc_qint;
    wire [18:0] u4_rnd_trunc_q;
    wire [32:0] u4_rnd_trunc_qint;
    wire [18:0] u5_rnd_trunc_q;
    wire [32:0] u5_rnd_trunc_qint;
    wire [18:0] u6_rnd_trunc_q;
    wire [32:0] u6_rnd_trunc_qint;
    wire [18:0] u7_rnd_trunc_q;
    wire [32:0] u7_rnd_trunc_qint;
    wire [19:0] u0_rnd_add_a;
    wire [19:0] u0_rnd_add_b;
    logic [19:0] u0_rnd_add_o;
    wire [19:0] u0_rnd_add_q;
    wire [19:0] u1_rnd_add_a;
    wire [19:0] u1_rnd_add_b;
    logic [19:0] u1_rnd_add_o;
    wire [19:0] u1_rnd_add_q;
    wire [19:0] u2_rnd_add_a;
    wire [19:0] u2_rnd_add_b;
    logic [19:0] u2_rnd_add_o;
    wire [19:0] u2_rnd_add_q;
    wire [19:0] u3_rnd_add_a;
    wire [19:0] u3_rnd_add_b;
    logic [19:0] u3_rnd_add_o;
    wire [19:0] u3_rnd_add_q;
    wire [19:0] u4_rnd_add_a;
    wire [19:0] u4_rnd_add_b;
    logic [19:0] u4_rnd_add_o;
    wire [19:0] u4_rnd_add_q;
    wire [19:0] u5_rnd_add_a;
    wire [19:0] u5_rnd_add_b;
    logic [19:0] u5_rnd_add_o;
    wire [19:0] u5_rnd_add_q;
    wire [19:0] u6_rnd_add_a;
    wire [19:0] u6_rnd_add_b;
    logic [19:0] u6_rnd_add_o;
    wire [19:0] u6_rnd_add_q;
    wire [19:0] u7_rnd_add_a;
    wire [19:0] u7_rnd_add_b;
    logic [19:0] u7_rnd_add_o;
    wire [19:0] u7_rnd_add_q;
    wire [18:0] u0_rnd_shift_q;
    wire [19:0] u0_rnd_shift_qint;
    wire [18:0] u1_rnd_shift_q;
    wire [19:0] u1_rnd_shift_qint;
    wire [18:0] u2_rnd_shift_q;
    wire [19:0] u2_rnd_shift_qint;
    wire [18:0] u3_rnd_shift_q;
    wire [19:0] u3_rnd_shift_qint;
    wire [18:0] u4_rnd_shift_q;
    wire [19:0] u4_rnd_shift_qint;
    wire [18:0] u5_rnd_shift_q;
    wire [19:0] u5_rnd_shift_qint;
    wire [18:0] u6_rnd_shift_q;
    wire [19:0] u6_rnd_shift_qint;
    wire [18:0] u7_rnd_shift_q;
    wire [19:0] u7_rnd_shift_qint;

    import duc_model_DUT_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // u0_rnd_bias(CONSTANT,21)
    assign u0_rnd_bias_q = $unsigned(2'b01);

    // u7_shiftsel(BITSHIFT,18)@0
    assign u7_shiftsel_qint = xIn_7;
    assign u7_shiftsel_q = u7_shiftsel_qint[32:0];

    // u7_rnd_trunc(BITSHIFT,57)@0
    assign u7_rnd_trunc_qint = u7_shiftsel_q;
    assign u7_rnd_trunc_q = u7_rnd_trunc_qint[32:14];

    // u7_rnd_add(ADD,58)@0
    assign u7_rnd_add_a = $unsigned({{1{u7_rnd_trunc_q[18]}}, u7_rnd_trunc_q});
    assign u7_rnd_add_b = $unsigned({{18{u0_rnd_bias_q[1]}}, u0_rnd_bias_q});
    assign u7_rnd_add_o = $unsigned($signed(u7_rnd_add_a) + $signed(u7_rnd_add_b));
    assign u7_rnd_add_q = u7_rnd_add_o[19:0];

    // u7_rnd_shift(BITSHIFT,59)@0
    assign u7_rnd_shift_qint = u7_rnd_add_q;
    assign u7_rnd_shift_q = u7_rnd_shift_qint[19:1];

    // redist0_u7_rnd_shift_q_1(DELAY,61)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_u7_rnd_shift_q_1_q <= '0;
        end
        else
        begin
            redist0_u7_rnd_shift_q_1_q <= $unsigned(u7_rnd_shift_q);
        end
    end

    // u6_shiftsel(BITSHIFT,16)@0
    assign u6_shiftsel_qint = xIn_6;
    assign u6_shiftsel_q = u6_shiftsel_qint[32:0];

    // u6_rnd_trunc(BITSHIFT,52)@0
    assign u6_rnd_trunc_qint = u6_shiftsel_q;
    assign u6_rnd_trunc_q = u6_rnd_trunc_qint[32:14];

    // u6_rnd_add(ADD,53)@0
    assign u6_rnd_add_a = $unsigned({{1{u6_rnd_trunc_q[18]}}, u6_rnd_trunc_q});
    assign u6_rnd_add_b = $unsigned({{18{u0_rnd_bias_q[1]}}, u0_rnd_bias_q});
    assign u6_rnd_add_o = $unsigned($signed(u6_rnd_add_a) + $signed(u6_rnd_add_b));
    assign u6_rnd_add_q = u6_rnd_add_o[19:0];

    // u6_rnd_shift(BITSHIFT,54)@0
    assign u6_rnd_shift_qint = u6_rnd_add_q;
    assign u6_rnd_shift_q = u6_rnd_shift_qint[19:1];

    // redist1_u6_rnd_shift_q_1(DELAY,62)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_u6_rnd_shift_q_1_q <= '0;
        end
        else
        begin
            redist1_u6_rnd_shift_q_1_q <= $unsigned(u6_rnd_shift_q);
        end
    end

    // u5_shiftsel(BITSHIFT,14)@0
    assign u5_shiftsel_qint = xIn_5;
    assign u5_shiftsel_q = u5_shiftsel_qint[32:0];

    // u5_rnd_trunc(BITSHIFT,47)@0
    assign u5_rnd_trunc_qint = u5_shiftsel_q;
    assign u5_rnd_trunc_q = u5_rnd_trunc_qint[32:14];

    // u5_rnd_add(ADD,48)@0
    assign u5_rnd_add_a = $unsigned({{1{u5_rnd_trunc_q[18]}}, u5_rnd_trunc_q});
    assign u5_rnd_add_b = $unsigned({{18{u0_rnd_bias_q[1]}}, u0_rnd_bias_q});
    assign u5_rnd_add_o = $unsigned($signed(u5_rnd_add_a) + $signed(u5_rnd_add_b));
    assign u5_rnd_add_q = u5_rnd_add_o[19:0];

    // u5_rnd_shift(BITSHIFT,49)@0
    assign u5_rnd_shift_qint = u5_rnd_add_q;
    assign u5_rnd_shift_q = u5_rnd_shift_qint[19:1];

    // redist2_u5_rnd_shift_q_1(DELAY,63)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_u5_rnd_shift_q_1_q <= '0;
        end
        else
        begin
            redist2_u5_rnd_shift_q_1_q <= $unsigned(u5_rnd_shift_q);
        end
    end

    // u4_shiftsel(BITSHIFT,12)@0
    assign u4_shiftsel_qint = xIn_4;
    assign u4_shiftsel_q = u4_shiftsel_qint[32:0];

    // u4_rnd_trunc(BITSHIFT,42)@0
    assign u4_rnd_trunc_qint = u4_shiftsel_q;
    assign u4_rnd_trunc_q = u4_rnd_trunc_qint[32:14];

    // u4_rnd_add(ADD,43)@0
    assign u4_rnd_add_a = $unsigned({{1{u4_rnd_trunc_q[18]}}, u4_rnd_trunc_q});
    assign u4_rnd_add_b = $unsigned({{18{u0_rnd_bias_q[1]}}, u0_rnd_bias_q});
    assign u4_rnd_add_o = $unsigned($signed(u4_rnd_add_a) + $signed(u4_rnd_add_b));
    assign u4_rnd_add_q = u4_rnd_add_o[19:0];

    // u4_rnd_shift(BITSHIFT,44)@0
    assign u4_rnd_shift_qint = u4_rnd_add_q;
    assign u4_rnd_shift_q = u4_rnd_shift_qint[19:1];

    // redist3_u4_rnd_shift_q_1(DELAY,64)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist3_u4_rnd_shift_q_1_q <= '0;
        end
        else
        begin
            redist3_u4_rnd_shift_q_1_q <= $unsigned(u4_rnd_shift_q);
        end
    end

    // u3_shiftsel(BITSHIFT,10)@0
    assign u3_shiftsel_qint = xIn_3;
    assign u3_shiftsel_q = u3_shiftsel_qint[32:0];

    // u3_rnd_trunc(BITSHIFT,37)@0
    assign u3_rnd_trunc_qint = u3_shiftsel_q;
    assign u3_rnd_trunc_q = u3_rnd_trunc_qint[32:14];

    // u3_rnd_add(ADD,38)@0
    assign u3_rnd_add_a = $unsigned({{1{u3_rnd_trunc_q[18]}}, u3_rnd_trunc_q});
    assign u3_rnd_add_b = $unsigned({{18{u0_rnd_bias_q[1]}}, u0_rnd_bias_q});
    assign u3_rnd_add_o = $unsigned($signed(u3_rnd_add_a) + $signed(u3_rnd_add_b));
    assign u3_rnd_add_q = u3_rnd_add_o[19:0];

    // u3_rnd_shift(BITSHIFT,39)@0
    assign u3_rnd_shift_qint = u3_rnd_add_q;
    assign u3_rnd_shift_q = u3_rnd_shift_qint[19:1];

    // redist4_u3_rnd_shift_q_1(DELAY,65)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist4_u3_rnd_shift_q_1_q <= '0;
        end
        else
        begin
            redist4_u3_rnd_shift_q_1_q <= $unsigned(u3_rnd_shift_q);
        end
    end

    // u2_shiftsel(BITSHIFT,8)@0
    assign u2_shiftsel_qint = xIn_2;
    assign u2_shiftsel_q = u2_shiftsel_qint[32:0];

    // u2_rnd_trunc(BITSHIFT,32)@0
    assign u2_rnd_trunc_qint = u2_shiftsel_q;
    assign u2_rnd_trunc_q = u2_rnd_trunc_qint[32:14];

    // u2_rnd_add(ADD,33)@0
    assign u2_rnd_add_a = $unsigned({{1{u2_rnd_trunc_q[18]}}, u2_rnd_trunc_q});
    assign u2_rnd_add_b = $unsigned({{18{u0_rnd_bias_q[1]}}, u0_rnd_bias_q});
    assign u2_rnd_add_o = $unsigned($signed(u2_rnd_add_a) + $signed(u2_rnd_add_b));
    assign u2_rnd_add_q = u2_rnd_add_o[19:0];

    // u2_rnd_shift(BITSHIFT,34)@0
    assign u2_rnd_shift_qint = u2_rnd_add_q;
    assign u2_rnd_shift_q = u2_rnd_shift_qint[19:1];

    // redist5_u2_rnd_shift_q_1(DELAY,66)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist5_u2_rnd_shift_q_1_q <= '0;
        end
        else
        begin
            redist5_u2_rnd_shift_q_1_q <= $unsigned(u2_rnd_shift_q);
        end
    end

    // u1_shiftsel(BITSHIFT,6)@0
    assign u1_shiftsel_qint = xIn_1;
    assign u1_shiftsel_q = u1_shiftsel_qint[32:0];

    // u1_rnd_trunc(BITSHIFT,27)@0
    assign u1_rnd_trunc_qint = u1_shiftsel_q;
    assign u1_rnd_trunc_q = u1_rnd_trunc_qint[32:14];

    // u1_rnd_add(ADD,28)@0
    assign u1_rnd_add_a = $unsigned({{1{u1_rnd_trunc_q[18]}}, u1_rnd_trunc_q});
    assign u1_rnd_add_b = $unsigned({{18{u0_rnd_bias_q[1]}}, u0_rnd_bias_q});
    assign u1_rnd_add_o = $unsigned($signed(u1_rnd_add_a) + $signed(u1_rnd_add_b));
    assign u1_rnd_add_q = u1_rnd_add_o[19:0];

    // u1_rnd_shift(BITSHIFT,29)@0
    assign u1_rnd_shift_qint = u1_rnd_add_q;
    assign u1_rnd_shift_q = u1_rnd_shift_qint[19:1];

    // redist6_u1_rnd_shift_q_1(DELAY,67)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist6_u1_rnd_shift_q_1_q <= '0;
        end
        else
        begin
            redist6_u1_rnd_shift_q_1_q <= $unsigned(u1_rnd_shift_q);
        end
    end

    // u0_shiftsel(BITSHIFT,4)@0
    assign u0_shiftsel_qint = xIn_0;
    assign u0_shiftsel_q = u0_shiftsel_qint[32:0];

    // u0_rnd_trunc(BITSHIFT,22)@0
    assign u0_rnd_trunc_qint = u0_shiftsel_q;
    assign u0_rnd_trunc_q = u0_rnd_trunc_qint[32:14];

    // u0_rnd_add(ADD,23)@0
    assign u0_rnd_add_a = $unsigned({{1{u0_rnd_trunc_q[18]}}, u0_rnd_trunc_q});
    assign u0_rnd_add_b = $unsigned({{18{u0_rnd_bias_q[1]}}, u0_rnd_bias_q});
    assign u0_rnd_add_o = $unsigned($signed(u0_rnd_add_a) + $signed(u0_rnd_add_b));
    assign u0_rnd_add_q = u0_rnd_add_o[19:0];

    // u0_rnd_shift(BITSHIFT,24)@0
    assign u0_rnd_shift_qint = u0_rnd_add_q;
    assign u0_rnd_shift_q = u0_rnd_shift_qint[19:1];

    // redist7_u0_rnd_shift_q_1(DELAY,68)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist7_u0_rnd_shift_q_1_q <= '0;
        end
        else
        begin
            redist7_u0_rnd_shift_q_1_q <= $unsigned(u0_rnd_shift_q);
        end
    end

    // redist9_xIn_c_1(DELAY,70)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist9_xIn_c_1_q <= '0;
        end
        else
        begin
            redist9_xIn_c_1_q <= $unsigned(xIn_c);
        end
    end

    // redist8_xIn_v_1(DELAY,69)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist8_xIn_v_1_q <= '0;
        end
        else
        begin
            redist8_xIn_v_1_q <= $unsigned(xIn_v);
        end
    end

    // qOut(PORTOUT,20)@1 + 1
    assign qOut_v = redist8_xIn_v_1_q;
    assign qOut_c = redist9_xIn_c_1_q;
    assign qOut_0 = redist7_u0_rnd_shift_q_1_q[15:0];
    assign qOut_1 = redist6_u1_rnd_shift_q_1_q[15:0];
    assign qOut_2 = redist5_u2_rnd_shift_q_1_q[15:0];
    assign qOut_3 = redist4_u3_rnd_shift_q_1_q[15:0];
    assign qOut_4 = redist3_u4_rnd_shift_q_1_q[15:0];
    assign qOut_5 = redist2_u5_rnd_shift_q_1_q[15:0];
    assign qOut_6 = redist1_u6_rnd_shift_q_1_q[15:0];
    assign qOut_7 = redist0_u7_rnd_shift_q_1_q[15:0];
    assign eOut_0 = VCC_q;
    assign eOut_1 = VCC_q;
    assign eOut_2 = VCC_q;
    assign eOut_3 = VCC_q;
    assign eOut_4 = VCC_q;
    assign eOut_5 = VCC_q;
    assign eOut_6 = VCC_q;
    assign eOut_7 = VCC_q;

endmodule
