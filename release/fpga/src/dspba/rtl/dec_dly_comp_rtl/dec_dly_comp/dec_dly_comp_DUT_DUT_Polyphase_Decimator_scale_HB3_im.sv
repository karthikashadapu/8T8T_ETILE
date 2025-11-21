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

// SystemVerilog created from dec_dly_comp_DUT_DUT_Polyphase_Decimator_scale_HB3_im
// SystemVerilog created on Tue Jan  7 17:06:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module dec_dly_comp_DUT_DUT_Polyphase_Decimator_scale_HB3_im (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [38:0] xIn_0,
    input wire [38:0] xIn_1,
    input wire [38:0] xIn_2,
    input wire [38:0] xIn_3,
    input wire [0:0] gain_i,
    output wire [0:0] qOut_v,
    output wire [7:0] qOut_c,
    output wire [15:0] qOut_0,
    output wire [15:0] qOut_1,
    output wire [15:0] qOut_2,
    output wire [15:0] qOut_3,
    output wire [0:0] eOut_0,
    output wire [0:0] eOut_1,
    output wire [0:0] eOut_2,
    output wire [0:0] eOut_3,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [20:0] u0_rnd_add_p1_of_2_a;
    wire [20:0] u0_rnd_add_p1_of_2_b;
    logic [20:0] u0_rnd_add_p1_of_2_o;
    wire [0:0] u0_rnd_add_p1_of_2_c;
    wire [19:0] u0_rnd_add_p1_of_2_q;
    wire [7:0] u0_rnd_add_p2_of_2_a;
    wire [7:0] u0_rnd_add_p2_of_2_b;
    logic [7:0] u0_rnd_add_p2_of_2_o;
    wire [0:0] u0_rnd_add_p2_of_2_cin;
    wire [5:0] u0_rnd_add_p2_of_2_q;
    wire [20:0] u1_rnd_add_p1_of_2_a;
    wire [20:0] u1_rnd_add_p1_of_2_b;
    logic [20:0] u1_rnd_add_p1_of_2_o;
    wire [0:0] u1_rnd_add_p1_of_2_c;
    wire [19:0] u1_rnd_add_p1_of_2_q;
    wire [7:0] u1_rnd_add_p2_of_2_a;
    wire [7:0] u1_rnd_add_p2_of_2_b;
    logic [7:0] u1_rnd_add_p2_of_2_o;
    wire [0:0] u1_rnd_add_p2_of_2_cin;
    wire [5:0] u1_rnd_add_p2_of_2_q;
    wire [20:0] u2_rnd_add_p1_of_2_a;
    wire [20:0] u2_rnd_add_p1_of_2_b;
    logic [20:0] u2_rnd_add_p1_of_2_o;
    wire [0:0] u2_rnd_add_p1_of_2_c;
    wire [19:0] u2_rnd_add_p1_of_2_q;
    wire [7:0] u2_rnd_add_p2_of_2_a;
    wire [7:0] u2_rnd_add_p2_of_2_b;
    logic [7:0] u2_rnd_add_p2_of_2_o;
    wire [0:0] u2_rnd_add_p2_of_2_cin;
    wire [5:0] u2_rnd_add_p2_of_2_q;
    wire [20:0] u3_rnd_add_p1_of_2_a;
    wire [20:0] u3_rnd_add_p1_of_2_b;
    logic [20:0] u3_rnd_add_p1_of_2_o;
    wire [0:0] u3_rnd_add_p1_of_2_c;
    wire [19:0] u3_rnd_add_p1_of_2_q;
    wire [7:0] u3_rnd_add_p2_of_2_a;
    wire [7:0] u3_rnd_add_p2_of_2_b;
    logic [7:0] u3_rnd_add_p2_of_2_o;
    wire [0:0] u3_rnd_add_p2_of_2_cin;
    wire [5:0] u3_rnd_add_p2_of_2_q;
    wire [19:0] u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const_q;
    wire [5:0] u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q;
    reg [0:0] redist0_u3_rnd_add_BitSelect_for_a_tessel1_1_b_1_q;
    reg [4:0] redist1_u3_rnd_add_BitSelect_for_a_tessel1_0_b_1_q;
    reg [0:0] redist2_u2_rnd_add_BitSelect_for_a_tessel1_1_b_1_q;
    reg [4:0] redist3_u2_rnd_add_BitSelect_for_a_tessel1_0_b_1_q;
    reg [0:0] redist4_u1_rnd_add_BitSelect_for_a_tessel1_1_b_1_q;
    reg [4:0] redist5_u1_rnd_add_BitSelect_for_a_tessel1_0_b_1_q;
    reg [0:0] redist6_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1_q;
    reg [4:0] redist7_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1_q;
    reg [19:0] redist8_u3_rnd_add_p1_of_2_q_1_q;
    reg [19:0] redist9_u2_rnd_add_p1_of_2_q_1_q;
    reg [19:0] redist10_u1_rnd_add_p1_of_2_q_1_q;
    reg [19:0] redist11_u0_rnd_add_p1_of_2_q_1_q;
    reg [0:0] redist12_xIn_v_2_q;
    reg [0:0] redist12_xIn_v_2_delay_0;
    reg [7:0] redist13_xIn_c_2_q;
    reg [7:0] redist13_xIn_c_2_delay_0;
    wire [38:0] u0_shiftsel_q;
    wire [38:0] u0_shiftsel_qint;
    wire [38:0] u1_shiftsel_q;
    wire [38:0] u1_shiftsel_qint;
    wire [38:0] u2_shiftsel_q;
    wire [38:0] u2_shiftsel_qint;
    wire [38:0] u3_shiftsel_q;
    wire [38:0] u3_shiftsel_qint;
    wire [25:0] u0_rnd_add_BitJoin_for_q_q;
    wire [25:0] u1_rnd_add_BitJoin_for_q_q;
    wire [25:0] u2_rnd_add_BitJoin_for_q_q;
    wire [25:0] u3_rnd_add_BitJoin_for_q_q;
    wire [5:0] u3_rnd_add_BitSelect_for_a_BitJoin_for_c_q;
    wire [5:0] u2_rnd_add_BitSelect_for_a_BitJoin_for_c_q;
    wire [5:0] u1_rnd_add_BitSelect_for_a_BitJoin_for_c_q;
    wire [5:0] u0_rnd_add_BitSelect_for_a_BitJoin_for_c_q;
    wire [24:0] u0_rnd_trunc_q;
    wire [38:0] u0_rnd_trunc_qint;
    wire [24:0] u1_rnd_trunc_q;
    wire [38:0] u1_rnd_trunc_qint;
    wire [24:0] u2_rnd_trunc_q;
    wire [38:0] u2_rnd_trunc_qint;
    wire [24:0] u3_rnd_trunc_q;
    wire [38:0] u3_rnd_trunc_qint;
    wire [24:0] u0_rnd_shift_q;
    wire [25:0] u0_rnd_shift_qint;
    wire [24:0] u1_rnd_shift_q;
    wire [25:0] u1_rnd_shift_qint;
    wire [24:0] u2_rnd_shift_q;
    wire [25:0] u2_rnd_shift_qint;
    wire [24:0] u3_rnd_shift_q;
    wire [25:0] u3_rnd_shift_qint;
    wire [19:0] u0_rnd_add_BitSelect_for_a_tessel0_0_b;
    wire [4:0] u0_rnd_add_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u0_rnd_add_BitSelect_for_a_tessel1_1_b;
    wire [19:0] u1_rnd_add_BitSelect_for_a_tessel0_0_b;
    wire [4:0] u1_rnd_add_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u1_rnd_add_BitSelect_for_a_tessel1_1_b;
    wire [19:0] u2_rnd_add_BitSelect_for_a_tessel0_0_b;
    wire [4:0] u2_rnd_add_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u2_rnd_add_BitSelect_for_a_tessel1_1_b;
    wire [19:0] u3_rnd_add_BitSelect_for_a_tessel0_0_b;
    wire [4:0] u3_rnd_add_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u3_rnd_add_BitSelect_for_a_tessel1_1_b;
    wire [19:0] u0_rnd_add_BitSelect_for_a_BitJoin_for_b_q;
    wire [19:0] u1_rnd_add_BitSelect_for_a_BitJoin_for_b_q;
    wire [19:0] u2_rnd_add_BitSelect_for_a_BitJoin_for_b_q;
    wire [19:0] u3_rnd_add_BitSelect_for_a_BitJoin_for_b_q;

    import dec_dly_comp_DUT_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const(CONSTANT,235)
    assign u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const_q = $unsigned(20'b00000000000000000001);

    // u3_shiftsel(BITSHIFT,10)@0
    assign u3_shiftsel_qint = xIn_3;
    assign u3_shiftsel_q = u3_shiftsel_qint[38:0];

    // u3_rnd_trunc(BITSHIFT,29)@0
    assign u3_rnd_trunc_qint = u3_shiftsel_q;
    assign u3_rnd_trunc_q = u3_rnd_trunc_qint[38:14];

    // u3_rnd_add_BitSelect_for_a_tessel0_0(BITSELECT,173)@0
    assign u3_rnd_add_BitSelect_for_a_tessel0_0_b = $unsigned(u3_rnd_trunc_q[19:0]);

    // u3_rnd_add_BitSelect_for_a_BitJoin_for_b(BITJOIN,174)@0
    assign u3_rnd_add_BitSelect_for_a_BitJoin_for_b_q = u3_rnd_add_BitSelect_for_a_tessel0_0_b;

    // u3_rnd_add_p1_of_2(ADD,74)@0 + 1
    assign u3_rnd_add_p1_of_2_a = {1'b0, u3_rnd_add_BitSelect_for_a_BitJoin_for_b_q};
    assign u3_rnd_add_p1_of_2_b = {1'b0, u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_rnd_add_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u3_rnd_add_p1_of_2_o <= $unsigned(u3_rnd_add_p1_of_2_a) + $unsigned(u3_rnd_add_p1_of_2_b);
        end
    end
    assign u3_rnd_add_p1_of_2_c[0] = u3_rnd_add_p1_of_2_o[20];
    assign u3_rnd_add_p1_of_2_q = u3_rnd_add_p1_of_2_o[19:0];

    // u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const(CONSTANT,242)
    assign u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q = $unsigned(6'b000000);

    // u3_rnd_add_BitSelect_for_a_tessel1_1(BITSELECT,176)@0
    assign u3_rnd_add_BitSelect_for_a_tessel1_1_b = $unsigned(u3_rnd_trunc_q[24:24]);

    // redist0_u3_rnd_add_BitSelect_for_a_tessel1_1_b_1(DELAY,321)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_u3_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= '0;
        end
        else
        begin
            redist0_u3_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= $unsigned(u3_rnd_add_BitSelect_for_a_tessel1_1_b);
        end
    end

    // u3_rnd_add_BitSelect_for_a_tessel1_0(BITSELECT,175)@0
    assign u3_rnd_add_BitSelect_for_a_tessel1_0_b = $unsigned(u3_rnd_trunc_q[24:20]);

    // redist1_u3_rnd_add_BitSelect_for_a_tessel1_0_b_1(DELAY,322)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_u3_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= '0;
        end
        else
        begin
            redist1_u3_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= $unsigned(u3_rnd_add_BitSelect_for_a_tessel1_0_b);
        end
    end

    // u3_rnd_add_BitSelect_for_a_BitJoin_for_c(BITJOIN,177)@1
    assign u3_rnd_add_BitSelect_for_a_BitJoin_for_c_q = {redist0_u3_rnd_add_BitSelect_for_a_tessel1_1_b_1_q, redist1_u3_rnd_add_BitSelect_for_a_tessel1_0_b_1_q};

    // u3_rnd_add_p2_of_2(ADD,75)@1 + 1
    assign u3_rnd_add_p2_of_2_cin = u3_rnd_add_p1_of_2_c;
    assign u3_rnd_add_p2_of_2_a = $unsigned({ {{1{u3_rnd_add_BitSelect_for_a_BitJoin_for_c_q[5]}}, u3_rnd_add_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 });
    assign u3_rnd_add_p2_of_2_b = $unsigned({ {{1{u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q[5]}}, u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q}, u3_rnd_add_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_rnd_add_p2_of_2_o <= 8'b0;
        end
        else
        begin
            u3_rnd_add_p2_of_2_o <= $unsigned($signed(u3_rnd_add_p2_of_2_a) + $signed(u3_rnd_add_p2_of_2_b));
        end
    end
    assign u3_rnd_add_p2_of_2_q = u3_rnd_add_p2_of_2_o[6:1];

    // redist8_u3_rnd_add_p1_of_2_q_1(DELAY,329)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist8_u3_rnd_add_p1_of_2_q_1_q <= '0;
        end
        else
        begin
            redist8_u3_rnd_add_p1_of_2_q_1_q <= $unsigned(u3_rnd_add_p1_of_2_q);
        end
    end

    // u3_rnd_add_BitJoin_for_q(BITJOIN,76)@2
    assign u3_rnd_add_BitJoin_for_q_q = {u3_rnd_add_p2_of_2_q, redist8_u3_rnd_add_p1_of_2_q_1_q};

    // u3_rnd_shift(BITSHIFT,31)@2
    assign u3_rnd_shift_qint = u3_rnd_add_BitJoin_for_q_q;
    assign u3_rnd_shift_q = u3_rnd_shift_qint[25:1];

    // u2_shiftsel(BITSHIFT,8)@0
    assign u2_shiftsel_qint = xIn_2;
    assign u2_shiftsel_q = u2_shiftsel_qint[38:0];

    // u2_rnd_trunc(BITSHIFT,24)@0
    assign u2_rnd_trunc_qint = u2_shiftsel_q;
    assign u2_rnd_trunc_q = u2_rnd_trunc_qint[38:14];

    // u2_rnd_add_BitSelect_for_a_tessel0_0(BITSELECT,141)@0
    assign u2_rnd_add_BitSelect_for_a_tessel0_0_b = $unsigned(u2_rnd_trunc_q[19:0]);

    // u2_rnd_add_BitSelect_for_a_BitJoin_for_b(BITJOIN,142)@0
    assign u2_rnd_add_BitSelect_for_a_BitJoin_for_b_q = u2_rnd_add_BitSelect_for_a_tessel0_0_b;

    // u2_rnd_add_p1_of_2(ADD,63)@0 + 1
    assign u2_rnd_add_p1_of_2_a = {1'b0, u2_rnd_add_BitSelect_for_a_BitJoin_for_b_q};
    assign u2_rnd_add_p1_of_2_b = {1'b0, u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_rnd_add_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u2_rnd_add_p1_of_2_o <= $unsigned(u2_rnd_add_p1_of_2_a) + $unsigned(u2_rnd_add_p1_of_2_b);
        end
    end
    assign u2_rnd_add_p1_of_2_c[0] = u2_rnd_add_p1_of_2_o[20];
    assign u2_rnd_add_p1_of_2_q = u2_rnd_add_p1_of_2_o[19:0];

    // u2_rnd_add_BitSelect_for_a_tessel1_1(BITSELECT,144)@0
    assign u2_rnd_add_BitSelect_for_a_tessel1_1_b = $unsigned(u2_rnd_trunc_q[24:24]);

    // redist2_u2_rnd_add_BitSelect_for_a_tessel1_1_b_1(DELAY,323)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_u2_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= '0;
        end
        else
        begin
            redist2_u2_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= $unsigned(u2_rnd_add_BitSelect_for_a_tessel1_1_b);
        end
    end

    // u2_rnd_add_BitSelect_for_a_tessel1_0(BITSELECT,143)@0
    assign u2_rnd_add_BitSelect_for_a_tessel1_0_b = $unsigned(u2_rnd_trunc_q[24:20]);

    // redist3_u2_rnd_add_BitSelect_for_a_tessel1_0_b_1(DELAY,324)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist3_u2_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= '0;
        end
        else
        begin
            redist3_u2_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= $unsigned(u2_rnd_add_BitSelect_for_a_tessel1_0_b);
        end
    end

    // u2_rnd_add_BitSelect_for_a_BitJoin_for_c(BITJOIN,145)@1
    assign u2_rnd_add_BitSelect_for_a_BitJoin_for_c_q = {redist2_u2_rnd_add_BitSelect_for_a_tessel1_1_b_1_q, redist3_u2_rnd_add_BitSelect_for_a_tessel1_0_b_1_q};

    // u2_rnd_add_p2_of_2(ADD,64)@1 + 1
    assign u2_rnd_add_p2_of_2_cin = u2_rnd_add_p1_of_2_c;
    assign u2_rnd_add_p2_of_2_a = $unsigned({ {{1{u2_rnd_add_BitSelect_for_a_BitJoin_for_c_q[5]}}, u2_rnd_add_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 });
    assign u2_rnd_add_p2_of_2_b = $unsigned({ {{1{u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q[5]}}, u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q}, u2_rnd_add_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_rnd_add_p2_of_2_o <= 8'b0;
        end
        else
        begin
            u2_rnd_add_p2_of_2_o <= $unsigned($signed(u2_rnd_add_p2_of_2_a) + $signed(u2_rnd_add_p2_of_2_b));
        end
    end
    assign u2_rnd_add_p2_of_2_q = u2_rnd_add_p2_of_2_o[6:1];

    // redist9_u2_rnd_add_p1_of_2_q_1(DELAY,330)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist9_u2_rnd_add_p1_of_2_q_1_q <= '0;
        end
        else
        begin
            redist9_u2_rnd_add_p1_of_2_q_1_q <= $unsigned(u2_rnd_add_p1_of_2_q);
        end
    end

    // u2_rnd_add_BitJoin_for_q(BITJOIN,65)@2
    assign u2_rnd_add_BitJoin_for_q_q = {u2_rnd_add_p2_of_2_q, redist9_u2_rnd_add_p1_of_2_q_1_q};

    // u2_rnd_shift(BITSHIFT,26)@2
    assign u2_rnd_shift_qint = u2_rnd_add_BitJoin_for_q_q;
    assign u2_rnd_shift_q = u2_rnd_shift_qint[25:1];

    // u1_shiftsel(BITSHIFT,6)@0
    assign u1_shiftsel_qint = xIn_1;
    assign u1_shiftsel_q = u1_shiftsel_qint[38:0];

    // u1_rnd_trunc(BITSHIFT,19)@0
    assign u1_rnd_trunc_qint = u1_shiftsel_q;
    assign u1_rnd_trunc_q = u1_rnd_trunc_qint[38:14];

    // u1_rnd_add_BitSelect_for_a_tessel0_0(BITSELECT,109)@0
    assign u1_rnd_add_BitSelect_for_a_tessel0_0_b = $unsigned(u1_rnd_trunc_q[19:0]);

    // u1_rnd_add_BitSelect_for_a_BitJoin_for_b(BITJOIN,110)@0
    assign u1_rnd_add_BitSelect_for_a_BitJoin_for_b_q = u1_rnd_add_BitSelect_for_a_tessel0_0_b;

    // u1_rnd_add_p1_of_2(ADD,52)@0 + 1
    assign u1_rnd_add_p1_of_2_a = {1'b0, u1_rnd_add_BitSelect_for_a_BitJoin_for_b_q};
    assign u1_rnd_add_p1_of_2_b = {1'b0, u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_rnd_add_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u1_rnd_add_p1_of_2_o <= $unsigned(u1_rnd_add_p1_of_2_a) + $unsigned(u1_rnd_add_p1_of_2_b);
        end
    end
    assign u1_rnd_add_p1_of_2_c[0] = u1_rnd_add_p1_of_2_o[20];
    assign u1_rnd_add_p1_of_2_q = u1_rnd_add_p1_of_2_o[19:0];

    // u1_rnd_add_BitSelect_for_a_tessel1_1(BITSELECT,112)@0
    assign u1_rnd_add_BitSelect_for_a_tessel1_1_b = $unsigned(u1_rnd_trunc_q[24:24]);

    // redist4_u1_rnd_add_BitSelect_for_a_tessel1_1_b_1(DELAY,325)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist4_u1_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= '0;
        end
        else
        begin
            redist4_u1_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= $unsigned(u1_rnd_add_BitSelect_for_a_tessel1_1_b);
        end
    end

    // u1_rnd_add_BitSelect_for_a_tessel1_0(BITSELECT,111)@0
    assign u1_rnd_add_BitSelect_for_a_tessel1_0_b = $unsigned(u1_rnd_trunc_q[24:20]);

    // redist5_u1_rnd_add_BitSelect_for_a_tessel1_0_b_1(DELAY,326)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist5_u1_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= '0;
        end
        else
        begin
            redist5_u1_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= $unsigned(u1_rnd_add_BitSelect_for_a_tessel1_0_b);
        end
    end

    // u1_rnd_add_BitSelect_for_a_BitJoin_for_c(BITJOIN,113)@1
    assign u1_rnd_add_BitSelect_for_a_BitJoin_for_c_q = {redist4_u1_rnd_add_BitSelect_for_a_tessel1_1_b_1_q, redist5_u1_rnd_add_BitSelect_for_a_tessel1_0_b_1_q};

    // u1_rnd_add_p2_of_2(ADD,53)@1 + 1
    assign u1_rnd_add_p2_of_2_cin = u1_rnd_add_p1_of_2_c;
    assign u1_rnd_add_p2_of_2_a = $unsigned({ {{1{u1_rnd_add_BitSelect_for_a_BitJoin_for_c_q[5]}}, u1_rnd_add_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 });
    assign u1_rnd_add_p2_of_2_b = $unsigned({ {{1{u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q[5]}}, u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q}, u1_rnd_add_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_rnd_add_p2_of_2_o <= 8'b0;
        end
        else
        begin
            u1_rnd_add_p2_of_2_o <= $unsigned($signed(u1_rnd_add_p2_of_2_a) + $signed(u1_rnd_add_p2_of_2_b));
        end
    end
    assign u1_rnd_add_p2_of_2_q = u1_rnd_add_p2_of_2_o[6:1];

    // redist10_u1_rnd_add_p1_of_2_q_1(DELAY,331)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist10_u1_rnd_add_p1_of_2_q_1_q <= '0;
        end
        else
        begin
            redist10_u1_rnd_add_p1_of_2_q_1_q <= $unsigned(u1_rnd_add_p1_of_2_q);
        end
    end

    // u1_rnd_add_BitJoin_for_q(BITJOIN,54)@2
    assign u1_rnd_add_BitJoin_for_q_q = {u1_rnd_add_p2_of_2_q, redist10_u1_rnd_add_p1_of_2_q_1_q};

    // u1_rnd_shift(BITSHIFT,21)@2
    assign u1_rnd_shift_qint = u1_rnd_add_BitJoin_for_q_q;
    assign u1_rnd_shift_q = u1_rnd_shift_qint[25:1];

    // u0_shiftsel(BITSHIFT,4)@0
    assign u0_shiftsel_qint = xIn_0;
    assign u0_shiftsel_q = u0_shiftsel_qint[38:0];

    // u0_rnd_trunc(BITSHIFT,14)@0
    assign u0_rnd_trunc_qint = u0_shiftsel_q;
    assign u0_rnd_trunc_q = u0_rnd_trunc_qint[38:14];

    // u0_rnd_add_BitSelect_for_a_tessel0_0(BITSELECT,77)@0
    assign u0_rnd_add_BitSelect_for_a_tessel0_0_b = $unsigned(u0_rnd_trunc_q[19:0]);

    // u0_rnd_add_BitSelect_for_a_BitJoin_for_b(BITJOIN,78)@0
    assign u0_rnd_add_BitSelect_for_a_BitJoin_for_b_q = u0_rnd_add_BitSelect_for_a_tessel0_0_b;

    // u0_rnd_add_p1_of_2(ADD,41)@0 + 1
    assign u0_rnd_add_p1_of_2_a = {1'b0, u0_rnd_add_BitSelect_for_a_BitJoin_for_b_q};
    assign u0_rnd_add_p1_of_2_b = {1'b0, u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_rnd_add_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u0_rnd_add_p1_of_2_o <= $unsigned(u0_rnd_add_p1_of_2_a) + $unsigned(u0_rnd_add_p1_of_2_b);
        end
    end
    assign u0_rnd_add_p1_of_2_c[0] = u0_rnd_add_p1_of_2_o[20];
    assign u0_rnd_add_p1_of_2_q = u0_rnd_add_p1_of_2_o[19:0];

    // u0_rnd_add_BitSelect_for_a_tessel1_1(BITSELECT,80)@0
    assign u0_rnd_add_BitSelect_for_a_tessel1_1_b = $unsigned(u0_rnd_trunc_q[24:24]);

    // redist6_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1(DELAY,327)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist6_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= '0;
        end
        else
        begin
            redist6_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= $unsigned(u0_rnd_add_BitSelect_for_a_tessel1_1_b);
        end
    end

    // u0_rnd_add_BitSelect_for_a_tessel1_0(BITSELECT,79)@0
    assign u0_rnd_add_BitSelect_for_a_tessel1_0_b = $unsigned(u0_rnd_trunc_q[24:20]);

    // redist7_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1(DELAY,328)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist7_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= '0;
        end
        else
        begin
            redist7_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= $unsigned(u0_rnd_add_BitSelect_for_a_tessel1_0_b);
        end
    end

    // u0_rnd_add_BitSelect_for_a_BitJoin_for_c(BITJOIN,81)@1
    assign u0_rnd_add_BitSelect_for_a_BitJoin_for_c_q = {redist6_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1_q, redist7_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1_q};

    // u0_rnd_add_p2_of_2(ADD,42)@1 + 1
    assign u0_rnd_add_p2_of_2_cin = u0_rnd_add_p1_of_2_c;
    assign u0_rnd_add_p2_of_2_a = $unsigned({ {{1{u0_rnd_add_BitSelect_for_a_BitJoin_for_c_q[5]}}, u0_rnd_add_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 });
    assign u0_rnd_add_p2_of_2_b = $unsigned({ {{1{u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q[5]}}, u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q}, u0_rnd_add_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_rnd_add_p2_of_2_o <= 8'b0;
        end
        else
        begin
            u0_rnd_add_p2_of_2_o <= $unsigned($signed(u0_rnd_add_p2_of_2_a) + $signed(u0_rnd_add_p2_of_2_b));
        end
    end
    assign u0_rnd_add_p2_of_2_q = u0_rnd_add_p2_of_2_o[6:1];

    // redist11_u0_rnd_add_p1_of_2_q_1(DELAY,332)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist11_u0_rnd_add_p1_of_2_q_1_q <= '0;
        end
        else
        begin
            redist11_u0_rnd_add_p1_of_2_q_1_q <= $unsigned(u0_rnd_add_p1_of_2_q);
        end
    end

    // u0_rnd_add_BitJoin_for_q(BITJOIN,43)@2
    assign u0_rnd_add_BitJoin_for_q_q = {u0_rnd_add_p2_of_2_q, redist11_u0_rnd_add_p1_of_2_q_1_q};

    // u0_rnd_shift(BITSHIFT,16)@2
    assign u0_rnd_shift_qint = u0_rnd_add_BitJoin_for_q_q;
    assign u0_rnd_shift_q = u0_rnd_shift_qint[25:1];

    // redist13_xIn_c_2(DELAY,334)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist13_xIn_c_2_delay_0 <= '0;
        end
        else
        begin
            redist13_xIn_c_2_delay_0 <= $unsigned(xIn_c);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_xIn_c_2_q <= redist13_xIn_c_2_delay_0;
        end
    end

    // redist12_xIn_v_2(DELAY,333)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist12_xIn_v_2_delay_0 <= '0;
        end
        else
        begin
            redist12_xIn_v_2_delay_0 <= $unsigned(xIn_v);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist12_xIn_v_2_q <= redist12_xIn_v_2_delay_0;
        end
    end

    // qOut(PORTOUT,12)@2 + 1
    assign qOut_v = redist12_xIn_v_2_q;
    assign qOut_c = redist13_xIn_c_2_q;
    assign qOut_0 = u0_rnd_shift_q[15:0];
    assign qOut_1 = u1_rnd_shift_q[15:0];
    assign qOut_2 = u2_rnd_shift_q[15:0];
    assign qOut_3 = u3_rnd_shift_q[15:0];
    assign eOut_0 = VCC_q;
    assign eOut_1 = VCC_q;
    assign eOut_2 = VCC_q;
    assign eOut_3 = VCC_q;

endmodule
