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

// SystemVerilog created from ca_interp_DUT_Summer_DUC_Poly_phase_Interp_scale_HB3_im
// SystemVerilog created on Tue Jan  7 17:04:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ca_interp_DUT_Summer_DUC_Poly_phase_Interp_scale_HB3_im (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [37:0] xIn_0,
    input wire [37:0] xIn_1,
    input wire [37:0] xIn_2,
    input wire [37:0] xIn_3,
    input wire [37:0] xIn_4,
    input wire [37:0] xIn_5,
    input wire [37:0] xIn_6,
    input wire [37:0] xIn_7,
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
    wire [20:0] u4_rnd_add_p1_of_2_a;
    wire [20:0] u4_rnd_add_p1_of_2_b;
    logic [20:0] u4_rnd_add_p1_of_2_o;
    wire [0:0] u4_rnd_add_p1_of_2_c;
    wire [19:0] u4_rnd_add_p1_of_2_q;
    wire [7:0] u4_rnd_add_p2_of_2_a;
    wire [7:0] u4_rnd_add_p2_of_2_b;
    logic [7:0] u4_rnd_add_p2_of_2_o;
    wire [0:0] u4_rnd_add_p2_of_2_cin;
    wire [5:0] u4_rnd_add_p2_of_2_q;
    wire [20:0] u5_rnd_add_p1_of_2_a;
    wire [20:0] u5_rnd_add_p1_of_2_b;
    logic [20:0] u5_rnd_add_p1_of_2_o;
    wire [0:0] u5_rnd_add_p1_of_2_c;
    wire [19:0] u5_rnd_add_p1_of_2_q;
    wire [7:0] u5_rnd_add_p2_of_2_a;
    wire [7:0] u5_rnd_add_p2_of_2_b;
    logic [7:0] u5_rnd_add_p2_of_2_o;
    wire [0:0] u5_rnd_add_p2_of_2_cin;
    wire [5:0] u5_rnd_add_p2_of_2_q;
    wire [20:0] u6_rnd_add_p1_of_2_a;
    wire [20:0] u6_rnd_add_p1_of_2_b;
    logic [20:0] u6_rnd_add_p1_of_2_o;
    wire [0:0] u6_rnd_add_p1_of_2_c;
    wire [19:0] u6_rnd_add_p1_of_2_q;
    wire [7:0] u6_rnd_add_p2_of_2_a;
    wire [7:0] u6_rnd_add_p2_of_2_b;
    logic [7:0] u6_rnd_add_p2_of_2_o;
    wire [0:0] u6_rnd_add_p2_of_2_cin;
    wire [5:0] u6_rnd_add_p2_of_2_q;
    wire [20:0] u7_rnd_add_p1_of_2_a;
    wire [20:0] u7_rnd_add_p1_of_2_b;
    logic [20:0] u7_rnd_add_p1_of_2_o;
    wire [0:0] u7_rnd_add_p1_of_2_c;
    wire [19:0] u7_rnd_add_p1_of_2_q;
    wire [7:0] u7_rnd_add_p2_of_2_a;
    wire [7:0] u7_rnd_add_p2_of_2_b;
    logic [7:0] u7_rnd_add_p2_of_2_o;
    wire [0:0] u7_rnd_add_p2_of_2_cin;
    wire [5:0] u7_rnd_add_p2_of_2_q;
    wire [19:0] u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const_q;
    wire [5:0] u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q;
    reg [0:0] redist0_u7_rnd_add_BitSelect_for_a_tessel1_1_b_1_q;
    reg [4:0] redist1_u7_rnd_add_BitSelect_for_a_tessel1_0_b_1_q;
    reg [0:0] redist2_u6_rnd_add_BitSelect_for_a_tessel1_1_b_1_q;
    reg [4:0] redist3_u6_rnd_add_BitSelect_for_a_tessel1_0_b_1_q;
    reg [0:0] redist4_u5_rnd_add_BitSelect_for_a_tessel1_1_b_1_q;
    reg [4:0] redist5_u5_rnd_add_BitSelect_for_a_tessel1_0_b_1_q;
    reg [0:0] redist6_u4_rnd_add_BitSelect_for_a_tessel1_1_b_1_q;
    reg [4:0] redist7_u4_rnd_add_BitSelect_for_a_tessel1_0_b_1_q;
    reg [0:0] redist8_u3_rnd_add_BitSelect_for_a_tessel1_1_b_1_q;
    reg [4:0] redist9_u3_rnd_add_BitSelect_for_a_tessel1_0_b_1_q;
    reg [0:0] redist10_u2_rnd_add_BitSelect_for_a_tessel1_1_b_1_q;
    reg [4:0] redist11_u2_rnd_add_BitSelect_for_a_tessel1_0_b_1_q;
    reg [0:0] redist12_u1_rnd_add_BitSelect_for_a_tessel1_1_b_1_q;
    reg [4:0] redist13_u1_rnd_add_BitSelect_for_a_tessel1_0_b_1_q;
    reg [0:0] redist14_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1_q;
    reg [4:0] redist15_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1_q;
    reg [19:0] redist16_u7_rnd_add_p1_of_2_q_1_q;
    reg [19:0] redist17_u6_rnd_add_p1_of_2_q_1_q;
    reg [19:0] redist18_u5_rnd_add_p1_of_2_q_1_q;
    reg [19:0] redist19_u4_rnd_add_p1_of_2_q_1_q;
    reg [19:0] redist20_u3_rnd_add_p1_of_2_q_1_q;
    reg [19:0] redist21_u2_rnd_add_p1_of_2_q_1_q;
    reg [19:0] redist22_u1_rnd_add_p1_of_2_q_1_q;
    reg [19:0] redist23_u0_rnd_add_p1_of_2_q_1_q;
    reg [0:0] redist24_xIn_v_2_q;
    reg [0:0] redist24_xIn_v_2_delay_0;
    reg [7:0] redist25_xIn_c_2_q;
    reg [7:0] redist25_xIn_c_2_delay_0;
    wire [38:0] u0_shiftsel_q;
    wire [38:0] u0_shiftsel_qint;
    wire [38:0] u1_shiftsel_q;
    wire [38:0] u1_shiftsel_qint;
    wire [38:0] u2_shiftsel_q;
    wire [38:0] u2_shiftsel_qint;
    wire [38:0] u3_shiftsel_q;
    wire [38:0] u3_shiftsel_qint;
    wire [38:0] u4_shiftsel_q;
    wire [38:0] u4_shiftsel_qint;
    wire [38:0] u5_shiftsel_q;
    wire [38:0] u5_shiftsel_qint;
    wire [38:0] u6_shiftsel_q;
    wire [38:0] u6_shiftsel_qint;
    wire [38:0] u7_shiftsel_q;
    wire [38:0] u7_shiftsel_qint;
    wire [25:0] u0_rnd_add_BitJoin_for_q_q;
    wire [25:0] u1_rnd_add_BitJoin_for_q_q;
    wire [25:0] u2_rnd_add_BitJoin_for_q_q;
    wire [25:0] u3_rnd_add_BitJoin_for_q_q;
    wire [25:0] u4_rnd_add_BitJoin_for_q_q;
    wire [25:0] u5_rnd_add_BitJoin_for_q_q;
    wire [25:0] u6_rnd_add_BitJoin_for_q_q;
    wire [25:0] u7_rnd_add_BitJoin_for_q_q;
    wire [5:0] u7_rnd_add_BitSelect_for_a_BitJoin_for_c_q;
    wire [5:0] u6_rnd_add_BitSelect_for_a_BitJoin_for_c_q;
    wire [5:0] u5_rnd_add_BitSelect_for_a_BitJoin_for_c_q;
    wire [5:0] u4_rnd_add_BitSelect_for_a_BitJoin_for_c_q;
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
    wire [24:0] u4_rnd_trunc_q;
    wire [38:0] u4_rnd_trunc_qint;
    wire [24:0] u5_rnd_trunc_q;
    wire [38:0] u5_rnd_trunc_qint;
    wire [24:0] u6_rnd_trunc_q;
    wire [38:0] u6_rnd_trunc_qint;
    wire [24:0] u7_rnd_trunc_q;
    wire [38:0] u7_rnd_trunc_qint;
    wire [24:0] u0_rnd_shift_q;
    wire [25:0] u0_rnd_shift_qint;
    wire [24:0] u1_rnd_shift_q;
    wire [25:0] u1_rnd_shift_qint;
    wire [24:0] u2_rnd_shift_q;
    wire [25:0] u2_rnd_shift_qint;
    wire [24:0] u3_rnd_shift_q;
    wire [25:0] u3_rnd_shift_qint;
    wire [24:0] u4_rnd_shift_q;
    wire [25:0] u4_rnd_shift_qint;
    wire [24:0] u5_rnd_shift_q;
    wire [25:0] u5_rnd_shift_qint;
    wire [24:0] u6_rnd_shift_q;
    wire [25:0] u6_rnd_shift_qint;
    wire [24:0] u7_rnd_shift_q;
    wire [25:0] u7_rnd_shift_qint;
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
    wire [19:0] u4_rnd_add_BitSelect_for_a_tessel0_0_b;
    wire [4:0] u4_rnd_add_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u4_rnd_add_BitSelect_for_a_tessel1_1_b;
    wire [19:0] u5_rnd_add_BitSelect_for_a_tessel0_0_b;
    wire [4:0] u5_rnd_add_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u5_rnd_add_BitSelect_for_a_tessel1_1_b;
    wire [19:0] u6_rnd_add_BitSelect_for_a_tessel0_0_b;
    wire [4:0] u6_rnd_add_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u6_rnd_add_BitSelect_for_a_tessel1_1_b;
    wire [19:0] u7_rnd_add_BitSelect_for_a_tessel0_0_b;
    wire [4:0] u7_rnd_add_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u7_rnd_add_BitSelect_for_a_tessel1_1_b;
    wire [19:0] u0_rnd_add_BitSelect_for_a_BitJoin_for_b_q;
    wire [19:0] u1_rnd_add_BitSelect_for_a_BitJoin_for_b_q;
    wire [19:0] u2_rnd_add_BitSelect_for_a_BitJoin_for_b_q;
    wire [19:0] u3_rnd_add_BitSelect_for_a_BitJoin_for_b_q;
    wire [19:0] u4_rnd_add_BitSelect_for_a_BitJoin_for_b_q;
    wire [19:0] u5_rnd_add_BitSelect_for_a_BitJoin_for_b_q;
    wire [19:0] u6_rnd_add_BitSelect_for_a_BitJoin_for_b_q;
    wire [19:0] u7_rnd_add_BitSelect_for_a_BitJoin_for_b_q;

    import ca_interp_DUT_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const(CONSTANT,447)
    assign u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const_q = $unsigned(20'b00000000000000000001);

    // u7_shiftsel(BITSHIFT,18)@0
    assign u7_shiftsel_qint = { xIn_7, 1'b0 };
    assign u7_shiftsel_q = u7_shiftsel_qint[38:0];

    // u7_rnd_trunc(BITSHIFT,57)@0
    assign u7_rnd_trunc_qint = u7_shiftsel_q;
    assign u7_rnd_trunc_q = u7_rnd_trunc_qint[38:14];

    // u7_rnd_add_BitSelect_for_a_tessel0_0(BITSELECT,373)@0
    assign u7_rnd_add_BitSelect_for_a_tessel0_0_b = $unsigned(u7_rnd_trunc_q[19:0]);

    // u7_rnd_add_BitSelect_for_a_BitJoin_for_b(BITJOIN,374)@0
    assign u7_rnd_add_BitSelect_for_a_BitJoin_for_b_q = u7_rnd_add_BitSelect_for_a_tessel0_0_b;

    // u7_rnd_add_p1_of_2(ADD,146)@0 + 1
    assign u7_rnd_add_p1_of_2_a = {1'b0, u7_rnd_add_BitSelect_for_a_BitJoin_for_b_q};
    assign u7_rnd_add_p1_of_2_b = {1'b0, u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u7_rnd_add_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u7_rnd_add_p1_of_2_o <= $unsigned(u7_rnd_add_p1_of_2_a) + $unsigned(u7_rnd_add_p1_of_2_b);
        end
    end
    assign u7_rnd_add_p1_of_2_c[0] = u7_rnd_add_p1_of_2_o[20];
    assign u7_rnd_add_p1_of_2_q = u7_rnd_add_p1_of_2_o[19:0];

    // u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const(CONSTANT,454)
    assign u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q = $unsigned(6'b000000);

    // u7_rnd_add_BitSelect_for_a_tessel1_1(BITSELECT,376)@0
    assign u7_rnd_add_BitSelect_for_a_tessel1_1_b = $unsigned(u7_rnd_trunc_q[24:24]);

    // redist0_u7_rnd_add_BitSelect_for_a_tessel1_1_b_1(DELAY,637)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_u7_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= '0;
        end
        else
        begin
            redist0_u7_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= $unsigned(u7_rnd_add_BitSelect_for_a_tessel1_1_b);
        end
    end

    // u7_rnd_add_BitSelect_for_a_tessel1_0(BITSELECT,375)@0
    assign u7_rnd_add_BitSelect_for_a_tessel1_0_b = $unsigned(u7_rnd_trunc_q[24:20]);

    // redist1_u7_rnd_add_BitSelect_for_a_tessel1_0_b_1(DELAY,638)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_u7_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= '0;
        end
        else
        begin
            redist1_u7_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= $unsigned(u7_rnd_add_BitSelect_for_a_tessel1_0_b);
        end
    end

    // u7_rnd_add_BitSelect_for_a_BitJoin_for_c(BITJOIN,377)@1
    assign u7_rnd_add_BitSelect_for_a_BitJoin_for_c_q = {redist0_u7_rnd_add_BitSelect_for_a_tessel1_1_b_1_q, redist1_u7_rnd_add_BitSelect_for_a_tessel1_0_b_1_q};

    // u7_rnd_add_p2_of_2(ADD,147)@1 + 1
    assign u7_rnd_add_p2_of_2_cin = u7_rnd_add_p1_of_2_c;
    assign u7_rnd_add_p2_of_2_a = $unsigned({ {{1{u7_rnd_add_BitSelect_for_a_BitJoin_for_c_q[5]}}, u7_rnd_add_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 });
    assign u7_rnd_add_p2_of_2_b = $unsigned({ {{1{u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q[5]}}, u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q}, u7_rnd_add_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u7_rnd_add_p2_of_2_o <= 8'b0;
        end
        else
        begin
            u7_rnd_add_p2_of_2_o <= $unsigned($signed(u7_rnd_add_p2_of_2_a) + $signed(u7_rnd_add_p2_of_2_b));
        end
    end
    assign u7_rnd_add_p2_of_2_q = u7_rnd_add_p2_of_2_o[6:1];

    // redist16_u7_rnd_add_p1_of_2_q_1(DELAY,653)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist16_u7_rnd_add_p1_of_2_q_1_q <= '0;
        end
        else
        begin
            redist16_u7_rnd_add_p1_of_2_q_1_q <= $unsigned(u7_rnd_add_p1_of_2_q);
        end
    end

    // u7_rnd_add_BitJoin_for_q(BITJOIN,148)@2
    assign u7_rnd_add_BitJoin_for_q_q = {u7_rnd_add_p2_of_2_q, redist16_u7_rnd_add_p1_of_2_q_1_q};

    // u7_rnd_shift(BITSHIFT,59)@2
    assign u7_rnd_shift_qint = u7_rnd_add_BitJoin_for_q_q;
    assign u7_rnd_shift_q = u7_rnd_shift_qint[25:1];

    // u6_shiftsel(BITSHIFT,16)@0
    assign u6_shiftsel_qint = { xIn_6, 1'b0 };
    assign u6_shiftsel_q = u6_shiftsel_qint[38:0];

    // u6_rnd_trunc(BITSHIFT,52)@0
    assign u6_rnd_trunc_qint = u6_shiftsel_q;
    assign u6_rnd_trunc_q = u6_rnd_trunc_qint[38:14];

    // u6_rnd_add_BitSelect_for_a_tessel0_0(BITSELECT,341)@0
    assign u6_rnd_add_BitSelect_for_a_tessel0_0_b = $unsigned(u6_rnd_trunc_q[19:0]);

    // u6_rnd_add_BitSelect_for_a_BitJoin_for_b(BITJOIN,342)@0
    assign u6_rnd_add_BitSelect_for_a_BitJoin_for_b_q = u6_rnd_add_BitSelect_for_a_tessel0_0_b;

    // u6_rnd_add_p1_of_2(ADD,135)@0 + 1
    assign u6_rnd_add_p1_of_2_a = {1'b0, u6_rnd_add_BitSelect_for_a_BitJoin_for_b_q};
    assign u6_rnd_add_p1_of_2_b = {1'b0, u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u6_rnd_add_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u6_rnd_add_p1_of_2_o <= $unsigned(u6_rnd_add_p1_of_2_a) + $unsigned(u6_rnd_add_p1_of_2_b);
        end
    end
    assign u6_rnd_add_p1_of_2_c[0] = u6_rnd_add_p1_of_2_o[20];
    assign u6_rnd_add_p1_of_2_q = u6_rnd_add_p1_of_2_o[19:0];

    // u6_rnd_add_BitSelect_for_a_tessel1_1(BITSELECT,344)@0
    assign u6_rnd_add_BitSelect_for_a_tessel1_1_b = $unsigned(u6_rnd_trunc_q[24:24]);

    // redist2_u6_rnd_add_BitSelect_for_a_tessel1_1_b_1(DELAY,639)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_u6_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= '0;
        end
        else
        begin
            redist2_u6_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= $unsigned(u6_rnd_add_BitSelect_for_a_tessel1_1_b);
        end
    end

    // u6_rnd_add_BitSelect_for_a_tessel1_0(BITSELECT,343)@0
    assign u6_rnd_add_BitSelect_for_a_tessel1_0_b = $unsigned(u6_rnd_trunc_q[24:20]);

    // redist3_u6_rnd_add_BitSelect_for_a_tessel1_0_b_1(DELAY,640)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist3_u6_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= '0;
        end
        else
        begin
            redist3_u6_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= $unsigned(u6_rnd_add_BitSelect_for_a_tessel1_0_b);
        end
    end

    // u6_rnd_add_BitSelect_for_a_BitJoin_for_c(BITJOIN,345)@1
    assign u6_rnd_add_BitSelect_for_a_BitJoin_for_c_q = {redist2_u6_rnd_add_BitSelect_for_a_tessel1_1_b_1_q, redist3_u6_rnd_add_BitSelect_for_a_tessel1_0_b_1_q};

    // u6_rnd_add_p2_of_2(ADD,136)@1 + 1
    assign u6_rnd_add_p2_of_2_cin = u6_rnd_add_p1_of_2_c;
    assign u6_rnd_add_p2_of_2_a = $unsigned({ {{1{u6_rnd_add_BitSelect_for_a_BitJoin_for_c_q[5]}}, u6_rnd_add_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 });
    assign u6_rnd_add_p2_of_2_b = $unsigned({ {{1{u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q[5]}}, u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q}, u6_rnd_add_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u6_rnd_add_p2_of_2_o <= 8'b0;
        end
        else
        begin
            u6_rnd_add_p2_of_2_o <= $unsigned($signed(u6_rnd_add_p2_of_2_a) + $signed(u6_rnd_add_p2_of_2_b));
        end
    end
    assign u6_rnd_add_p2_of_2_q = u6_rnd_add_p2_of_2_o[6:1];

    // redist17_u6_rnd_add_p1_of_2_q_1(DELAY,654)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist17_u6_rnd_add_p1_of_2_q_1_q <= '0;
        end
        else
        begin
            redist17_u6_rnd_add_p1_of_2_q_1_q <= $unsigned(u6_rnd_add_p1_of_2_q);
        end
    end

    // u6_rnd_add_BitJoin_for_q(BITJOIN,137)@2
    assign u6_rnd_add_BitJoin_for_q_q = {u6_rnd_add_p2_of_2_q, redist17_u6_rnd_add_p1_of_2_q_1_q};

    // u6_rnd_shift(BITSHIFT,54)@2
    assign u6_rnd_shift_qint = u6_rnd_add_BitJoin_for_q_q;
    assign u6_rnd_shift_q = u6_rnd_shift_qint[25:1];

    // u5_shiftsel(BITSHIFT,14)@0
    assign u5_shiftsel_qint = { xIn_5, 1'b0 };
    assign u5_shiftsel_q = u5_shiftsel_qint[38:0];

    // u5_rnd_trunc(BITSHIFT,47)@0
    assign u5_rnd_trunc_qint = u5_shiftsel_q;
    assign u5_rnd_trunc_q = u5_rnd_trunc_qint[38:14];

    // u5_rnd_add_BitSelect_for_a_tessel0_0(BITSELECT,309)@0
    assign u5_rnd_add_BitSelect_for_a_tessel0_0_b = $unsigned(u5_rnd_trunc_q[19:0]);

    // u5_rnd_add_BitSelect_for_a_BitJoin_for_b(BITJOIN,310)@0
    assign u5_rnd_add_BitSelect_for_a_BitJoin_for_b_q = u5_rnd_add_BitSelect_for_a_tessel0_0_b;

    // u5_rnd_add_p1_of_2(ADD,124)@0 + 1
    assign u5_rnd_add_p1_of_2_a = {1'b0, u5_rnd_add_BitSelect_for_a_BitJoin_for_b_q};
    assign u5_rnd_add_p1_of_2_b = {1'b0, u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u5_rnd_add_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u5_rnd_add_p1_of_2_o <= $unsigned(u5_rnd_add_p1_of_2_a) + $unsigned(u5_rnd_add_p1_of_2_b);
        end
    end
    assign u5_rnd_add_p1_of_2_c[0] = u5_rnd_add_p1_of_2_o[20];
    assign u5_rnd_add_p1_of_2_q = u5_rnd_add_p1_of_2_o[19:0];

    // u5_rnd_add_BitSelect_for_a_tessel1_1(BITSELECT,312)@0
    assign u5_rnd_add_BitSelect_for_a_tessel1_1_b = $unsigned(u5_rnd_trunc_q[24:24]);

    // redist4_u5_rnd_add_BitSelect_for_a_tessel1_1_b_1(DELAY,641)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist4_u5_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= '0;
        end
        else
        begin
            redist4_u5_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= $unsigned(u5_rnd_add_BitSelect_for_a_tessel1_1_b);
        end
    end

    // u5_rnd_add_BitSelect_for_a_tessel1_0(BITSELECT,311)@0
    assign u5_rnd_add_BitSelect_for_a_tessel1_0_b = $unsigned(u5_rnd_trunc_q[24:20]);

    // redist5_u5_rnd_add_BitSelect_for_a_tessel1_0_b_1(DELAY,642)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist5_u5_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= '0;
        end
        else
        begin
            redist5_u5_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= $unsigned(u5_rnd_add_BitSelect_for_a_tessel1_0_b);
        end
    end

    // u5_rnd_add_BitSelect_for_a_BitJoin_for_c(BITJOIN,313)@1
    assign u5_rnd_add_BitSelect_for_a_BitJoin_for_c_q = {redist4_u5_rnd_add_BitSelect_for_a_tessel1_1_b_1_q, redist5_u5_rnd_add_BitSelect_for_a_tessel1_0_b_1_q};

    // u5_rnd_add_p2_of_2(ADD,125)@1 + 1
    assign u5_rnd_add_p2_of_2_cin = u5_rnd_add_p1_of_2_c;
    assign u5_rnd_add_p2_of_2_a = $unsigned({ {{1{u5_rnd_add_BitSelect_for_a_BitJoin_for_c_q[5]}}, u5_rnd_add_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 });
    assign u5_rnd_add_p2_of_2_b = $unsigned({ {{1{u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q[5]}}, u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q}, u5_rnd_add_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u5_rnd_add_p2_of_2_o <= 8'b0;
        end
        else
        begin
            u5_rnd_add_p2_of_2_o <= $unsigned($signed(u5_rnd_add_p2_of_2_a) + $signed(u5_rnd_add_p2_of_2_b));
        end
    end
    assign u5_rnd_add_p2_of_2_q = u5_rnd_add_p2_of_2_o[6:1];

    // redist18_u5_rnd_add_p1_of_2_q_1(DELAY,655)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist18_u5_rnd_add_p1_of_2_q_1_q <= '0;
        end
        else
        begin
            redist18_u5_rnd_add_p1_of_2_q_1_q <= $unsigned(u5_rnd_add_p1_of_2_q);
        end
    end

    // u5_rnd_add_BitJoin_for_q(BITJOIN,126)@2
    assign u5_rnd_add_BitJoin_for_q_q = {u5_rnd_add_p2_of_2_q, redist18_u5_rnd_add_p1_of_2_q_1_q};

    // u5_rnd_shift(BITSHIFT,49)@2
    assign u5_rnd_shift_qint = u5_rnd_add_BitJoin_for_q_q;
    assign u5_rnd_shift_q = u5_rnd_shift_qint[25:1];

    // u4_shiftsel(BITSHIFT,12)@0
    assign u4_shiftsel_qint = { xIn_4, 1'b0 };
    assign u4_shiftsel_q = u4_shiftsel_qint[38:0];

    // u4_rnd_trunc(BITSHIFT,42)@0
    assign u4_rnd_trunc_qint = u4_shiftsel_q;
    assign u4_rnd_trunc_q = u4_rnd_trunc_qint[38:14];

    // u4_rnd_add_BitSelect_for_a_tessel0_0(BITSELECT,277)@0
    assign u4_rnd_add_BitSelect_for_a_tessel0_0_b = $unsigned(u4_rnd_trunc_q[19:0]);

    // u4_rnd_add_BitSelect_for_a_BitJoin_for_b(BITJOIN,278)@0
    assign u4_rnd_add_BitSelect_for_a_BitJoin_for_b_q = u4_rnd_add_BitSelect_for_a_tessel0_0_b;

    // u4_rnd_add_p1_of_2(ADD,113)@0 + 1
    assign u4_rnd_add_p1_of_2_a = {1'b0, u4_rnd_add_BitSelect_for_a_BitJoin_for_b_q};
    assign u4_rnd_add_p1_of_2_b = {1'b0, u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u4_rnd_add_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u4_rnd_add_p1_of_2_o <= $unsigned(u4_rnd_add_p1_of_2_a) + $unsigned(u4_rnd_add_p1_of_2_b);
        end
    end
    assign u4_rnd_add_p1_of_2_c[0] = u4_rnd_add_p1_of_2_o[20];
    assign u4_rnd_add_p1_of_2_q = u4_rnd_add_p1_of_2_o[19:0];

    // u4_rnd_add_BitSelect_for_a_tessel1_1(BITSELECT,280)@0
    assign u4_rnd_add_BitSelect_for_a_tessel1_1_b = $unsigned(u4_rnd_trunc_q[24:24]);

    // redist6_u4_rnd_add_BitSelect_for_a_tessel1_1_b_1(DELAY,643)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist6_u4_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= '0;
        end
        else
        begin
            redist6_u4_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= $unsigned(u4_rnd_add_BitSelect_for_a_tessel1_1_b);
        end
    end

    // u4_rnd_add_BitSelect_for_a_tessel1_0(BITSELECT,279)@0
    assign u4_rnd_add_BitSelect_for_a_tessel1_0_b = $unsigned(u4_rnd_trunc_q[24:20]);

    // redist7_u4_rnd_add_BitSelect_for_a_tessel1_0_b_1(DELAY,644)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist7_u4_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= '0;
        end
        else
        begin
            redist7_u4_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= $unsigned(u4_rnd_add_BitSelect_for_a_tessel1_0_b);
        end
    end

    // u4_rnd_add_BitSelect_for_a_BitJoin_for_c(BITJOIN,281)@1
    assign u4_rnd_add_BitSelect_for_a_BitJoin_for_c_q = {redist6_u4_rnd_add_BitSelect_for_a_tessel1_1_b_1_q, redist7_u4_rnd_add_BitSelect_for_a_tessel1_0_b_1_q};

    // u4_rnd_add_p2_of_2(ADD,114)@1 + 1
    assign u4_rnd_add_p2_of_2_cin = u4_rnd_add_p1_of_2_c;
    assign u4_rnd_add_p2_of_2_a = $unsigned({ {{1{u4_rnd_add_BitSelect_for_a_BitJoin_for_c_q[5]}}, u4_rnd_add_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 });
    assign u4_rnd_add_p2_of_2_b = $unsigned({ {{1{u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q[5]}}, u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q}, u4_rnd_add_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u4_rnd_add_p2_of_2_o <= 8'b0;
        end
        else
        begin
            u4_rnd_add_p2_of_2_o <= $unsigned($signed(u4_rnd_add_p2_of_2_a) + $signed(u4_rnd_add_p2_of_2_b));
        end
    end
    assign u4_rnd_add_p2_of_2_q = u4_rnd_add_p2_of_2_o[6:1];

    // redist19_u4_rnd_add_p1_of_2_q_1(DELAY,656)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist19_u4_rnd_add_p1_of_2_q_1_q <= '0;
        end
        else
        begin
            redist19_u4_rnd_add_p1_of_2_q_1_q <= $unsigned(u4_rnd_add_p1_of_2_q);
        end
    end

    // u4_rnd_add_BitJoin_for_q(BITJOIN,115)@2
    assign u4_rnd_add_BitJoin_for_q_q = {u4_rnd_add_p2_of_2_q, redist19_u4_rnd_add_p1_of_2_q_1_q};

    // u4_rnd_shift(BITSHIFT,44)@2
    assign u4_rnd_shift_qint = u4_rnd_add_BitJoin_for_q_q;
    assign u4_rnd_shift_q = u4_rnd_shift_qint[25:1];

    // u3_shiftsel(BITSHIFT,10)@0
    assign u3_shiftsel_qint = { xIn_3, 1'b0 };
    assign u3_shiftsel_q = u3_shiftsel_qint[38:0];

    // u3_rnd_trunc(BITSHIFT,37)@0
    assign u3_rnd_trunc_qint = u3_shiftsel_q;
    assign u3_rnd_trunc_q = u3_rnd_trunc_qint[38:14];

    // u3_rnd_add_BitSelect_for_a_tessel0_0(BITSELECT,245)@0
    assign u3_rnd_add_BitSelect_for_a_tessel0_0_b = $unsigned(u3_rnd_trunc_q[19:0]);

    // u3_rnd_add_BitSelect_for_a_BitJoin_for_b(BITJOIN,246)@0
    assign u3_rnd_add_BitSelect_for_a_BitJoin_for_b_q = u3_rnd_add_BitSelect_for_a_tessel0_0_b;

    // u3_rnd_add_p1_of_2(ADD,102)@0 + 1
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

    // u3_rnd_add_BitSelect_for_a_tessel1_1(BITSELECT,248)@0
    assign u3_rnd_add_BitSelect_for_a_tessel1_1_b = $unsigned(u3_rnd_trunc_q[24:24]);

    // redist8_u3_rnd_add_BitSelect_for_a_tessel1_1_b_1(DELAY,645)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist8_u3_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= '0;
        end
        else
        begin
            redist8_u3_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= $unsigned(u3_rnd_add_BitSelect_for_a_tessel1_1_b);
        end
    end

    // u3_rnd_add_BitSelect_for_a_tessel1_0(BITSELECT,247)@0
    assign u3_rnd_add_BitSelect_for_a_tessel1_0_b = $unsigned(u3_rnd_trunc_q[24:20]);

    // redist9_u3_rnd_add_BitSelect_for_a_tessel1_0_b_1(DELAY,646)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist9_u3_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= '0;
        end
        else
        begin
            redist9_u3_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= $unsigned(u3_rnd_add_BitSelect_for_a_tessel1_0_b);
        end
    end

    // u3_rnd_add_BitSelect_for_a_BitJoin_for_c(BITJOIN,249)@1
    assign u3_rnd_add_BitSelect_for_a_BitJoin_for_c_q = {redist8_u3_rnd_add_BitSelect_for_a_tessel1_1_b_1_q, redist9_u3_rnd_add_BitSelect_for_a_tessel1_0_b_1_q};

    // u3_rnd_add_p2_of_2(ADD,103)@1 + 1
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

    // redist20_u3_rnd_add_p1_of_2_q_1(DELAY,657)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist20_u3_rnd_add_p1_of_2_q_1_q <= '0;
        end
        else
        begin
            redist20_u3_rnd_add_p1_of_2_q_1_q <= $unsigned(u3_rnd_add_p1_of_2_q);
        end
    end

    // u3_rnd_add_BitJoin_for_q(BITJOIN,104)@2
    assign u3_rnd_add_BitJoin_for_q_q = {u3_rnd_add_p2_of_2_q, redist20_u3_rnd_add_p1_of_2_q_1_q};

    // u3_rnd_shift(BITSHIFT,39)@2
    assign u3_rnd_shift_qint = u3_rnd_add_BitJoin_for_q_q;
    assign u3_rnd_shift_q = u3_rnd_shift_qint[25:1];

    // u2_shiftsel(BITSHIFT,8)@0
    assign u2_shiftsel_qint = { xIn_2, 1'b0 };
    assign u2_shiftsel_q = u2_shiftsel_qint[38:0];

    // u2_rnd_trunc(BITSHIFT,32)@0
    assign u2_rnd_trunc_qint = u2_shiftsel_q;
    assign u2_rnd_trunc_q = u2_rnd_trunc_qint[38:14];

    // u2_rnd_add_BitSelect_for_a_tessel0_0(BITSELECT,213)@0
    assign u2_rnd_add_BitSelect_for_a_tessel0_0_b = $unsigned(u2_rnd_trunc_q[19:0]);

    // u2_rnd_add_BitSelect_for_a_BitJoin_for_b(BITJOIN,214)@0
    assign u2_rnd_add_BitSelect_for_a_BitJoin_for_b_q = u2_rnd_add_BitSelect_for_a_tessel0_0_b;

    // u2_rnd_add_p1_of_2(ADD,91)@0 + 1
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

    // u2_rnd_add_BitSelect_for_a_tessel1_1(BITSELECT,216)@0
    assign u2_rnd_add_BitSelect_for_a_tessel1_1_b = $unsigned(u2_rnd_trunc_q[24:24]);

    // redist10_u2_rnd_add_BitSelect_for_a_tessel1_1_b_1(DELAY,647)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist10_u2_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= '0;
        end
        else
        begin
            redist10_u2_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= $unsigned(u2_rnd_add_BitSelect_for_a_tessel1_1_b);
        end
    end

    // u2_rnd_add_BitSelect_for_a_tessel1_0(BITSELECT,215)@0
    assign u2_rnd_add_BitSelect_for_a_tessel1_0_b = $unsigned(u2_rnd_trunc_q[24:20]);

    // redist11_u2_rnd_add_BitSelect_for_a_tessel1_0_b_1(DELAY,648)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist11_u2_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= '0;
        end
        else
        begin
            redist11_u2_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= $unsigned(u2_rnd_add_BitSelect_for_a_tessel1_0_b);
        end
    end

    // u2_rnd_add_BitSelect_for_a_BitJoin_for_c(BITJOIN,217)@1
    assign u2_rnd_add_BitSelect_for_a_BitJoin_for_c_q = {redist10_u2_rnd_add_BitSelect_for_a_tessel1_1_b_1_q, redist11_u2_rnd_add_BitSelect_for_a_tessel1_0_b_1_q};

    // u2_rnd_add_p2_of_2(ADD,92)@1 + 1
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

    // redist21_u2_rnd_add_p1_of_2_q_1(DELAY,658)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist21_u2_rnd_add_p1_of_2_q_1_q <= '0;
        end
        else
        begin
            redist21_u2_rnd_add_p1_of_2_q_1_q <= $unsigned(u2_rnd_add_p1_of_2_q);
        end
    end

    // u2_rnd_add_BitJoin_for_q(BITJOIN,93)@2
    assign u2_rnd_add_BitJoin_for_q_q = {u2_rnd_add_p2_of_2_q, redist21_u2_rnd_add_p1_of_2_q_1_q};

    // u2_rnd_shift(BITSHIFT,34)@2
    assign u2_rnd_shift_qint = u2_rnd_add_BitJoin_for_q_q;
    assign u2_rnd_shift_q = u2_rnd_shift_qint[25:1];

    // u1_shiftsel(BITSHIFT,6)@0
    assign u1_shiftsel_qint = { xIn_1, 1'b0 };
    assign u1_shiftsel_q = u1_shiftsel_qint[38:0];

    // u1_rnd_trunc(BITSHIFT,27)@0
    assign u1_rnd_trunc_qint = u1_shiftsel_q;
    assign u1_rnd_trunc_q = u1_rnd_trunc_qint[38:14];

    // u1_rnd_add_BitSelect_for_a_tessel0_0(BITSELECT,181)@0
    assign u1_rnd_add_BitSelect_for_a_tessel0_0_b = $unsigned(u1_rnd_trunc_q[19:0]);

    // u1_rnd_add_BitSelect_for_a_BitJoin_for_b(BITJOIN,182)@0
    assign u1_rnd_add_BitSelect_for_a_BitJoin_for_b_q = u1_rnd_add_BitSelect_for_a_tessel0_0_b;

    // u1_rnd_add_p1_of_2(ADD,80)@0 + 1
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

    // u1_rnd_add_BitSelect_for_a_tessel1_1(BITSELECT,184)@0
    assign u1_rnd_add_BitSelect_for_a_tessel1_1_b = $unsigned(u1_rnd_trunc_q[24:24]);

    // redist12_u1_rnd_add_BitSelect_for_a_tessel1_1_b_1(DELAY,649)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist12_u1_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= '0;
        end
        else
        begin
            redist12_u1_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= $unsigned(u1_rnd_add_BitSelect_for_a_tessel1_1_b);
        end
    end

    // u1_rnd_add_BitSelect_for_a_tessel1_0(BITSELECT,183)@0
    assign u1_rnd_add_BitSelect_for_a_tessel1_0_b = $unsigned(u1_rnd_trunc_q[24:20]);

    // redist13_u1_rnd_add_BitSelect_for_a_tessel1_0_b_1(DELAY,650)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist13_u1_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= '0;
        end
        else
        begin
            redist13_u1_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= $unsigned(u1_rnd_add_BitSelect_for_a_tessel1_0_b);
        end
    end

    // u1_rnd_add_BitSelect_for_a_BitJoin_for_c(BITJOIN,185)@1
    assign u1_rnd_add_BitSelect_for_a_BitJoin_for_c_q = {redist12_u1_rnd_add_BitSelect_for_a_tessel1_1_b_1_q, redist13_u1_rnd_add_BitSelect_for_a_tessel1_0_b_1_q};

    // u1_rnd_add_p2_of_2(ADD,81)@1 + 1
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

    // redist22_u1_rnd_add_p1_of_2_q_1(DELAY,659)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist22_u1_rnd_add_p1_of_2_q_1_q <= '0;
        end
        else
        begin
            redist22_u1_rnd_add_p1_of_2_q_1_q <= $unsigned(u1_rnd_add_p1_of_2_q);
        end
    end

    // u1_rnd_add_BitJoin_for_q(BITJOIN,82)@2
    assign u1_rnd_add_BitJoin_for_q_q = {u1_rnd_add_p2_of_2_q, redist22_u1_rnd_add_p1_of_2_q_1_q};

    // u1_rnd_shift(BITSHIFT,29)@2
    assign u1_rnd_shift_qint = u1_rnd_add_BitJoin_for_q_q;
    assign u1_rnd_shift_q = u1_rnd_shift_qint[25:1];

    // u0_shiftsel(BITSHIFT,4)@0
    assign u0_shiftsel_qint = { xIn_0, 1'b0 };
    assign u0_shiftsel_q = u0_shiftsel_qint[38:0];

    // u0_rnd_trunc(BITSHIFT,22)@0
    assign u0_rnd_trunc_qint = u0_shiftsel_q;
    assign u0_rnd_trunc_q = u0_rnd_trunc_qint[38:14];

    // u0_rnd_add_BitSelect_for_a_tessel0_0(BITSELECT,149)@0
    assign u0_rnd_add_BitSelect_for_a_tessel0_0_b = $unsigned(u0_rnd_trunc_q[19:0]);

    // u0_rnd_add_BitSelect_for_a_BitJoin_for_b(BITJOIN,150)@0
    assign u0_rnd_add_BitSelect_for_a_BitJoin_for_b_q = u0_rnd_add_BitSelect_for_a_tessel0_0_b;

    // u0_rnd_add_p1_of_2(ADD,69)@0 + 1
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

    // u0_rnd_add_BitSelect_for_a_tessel1_1(BITSELECT,152)@0
    assign u0_rnd_add_BitSelect_for_a_tessel1_1_b = $unsigned(u0_rnd_trunc_q[24:24]);

    // redist14_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1(DELAY,651)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist14_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= '0;
        end
        else
        begin
            redist14_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= $unsigned(u0_rnd_add_BitSelect_for_a_tessel1_1_b);
        end
    end

    // u0_rnd_add_BitSelect_for_a_tessel1_0(BITSELECT,151)@0
    assign u0_rnd_add_BitSelect_for_a_tessel1_0_b = $unsigned(u0_rnd_trunc_q[24:20]);

    // redist15_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1(DELAY,652)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist15_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= '0;
        end
        else
        begin
            redist15_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= $unsigned(u0_rnd_add_BitSelect_for_a_tessel1_0_b);
        end
    end

    // u0_rnd_add_BitSelect_for_a_BitJoin_for_c(BITJOIN,153)@1
    assign u0_rnd_add_BitSelect_for_a_BitJoin_for_c_q = {redist14_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1_q, redist15_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1_q};

    // u0_rnd_add_p2_of_2(ADD,70)@1 + 1
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

    // redist23_u0_rnd_add_p1_of_2_q_1(DELAY,660)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist23_u0_rnd_add_p1_of_2_q_1_q <= '0;
        end
        else
        begin
            redist23_u0_rnd_add_p1_of_2_q_1_q <= $unsigned(u0_rnd_add_p1_of_2_q);
        end
    end

    // u0_rnd_add_BitJoin_for_q(BITJOIN,71)@2
    assign u0_rnd_add_BitJoin_for_q_q = {u0_rnd_add_p2_of_2_q, redist23_u0_rnd_add_p1_of_2_q_1_q};

    // u0_rnd_shift(BITSHIFT,24)@2
    assign u0_rnd_shift_qint = u0_rnd_add_BitJoin_for_q_q;
    assign u0_rnd_shift_q = u0_rnd_shift_qint[25:1];

    // redist25_xIn_c_2(DELAY,662)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist25_xIn_c_2_delay_0 <= '0;
        end
        else
        begin
            redist25_xIn_c_2_delay_0 <= $unsigned(xIn_c);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist25_xIn_c_2_q <= redist25_xIn_c_2_delay_0;
        end
    end

    // redist24_xIn_v_2(DELAY,661)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist24_xIn_v_2_delay_0 <= '0;
        end
        else
        begin
            redist24_xIn_v_2_delay_0 <= $unsigned(xIn_v);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist24_xIn_v_2_q <= redist24_xIn_v_2_delay_0;
        end
    end

    // qOut(PORTOUT,20)@2 + 1
    assign qOut_v = redist24_xIn_v_2_q;
    assign qOut_c = redist25_xIn_c_2_q;
    assign qOut_0 = u0_rnd_shift_q[15:0];
    assign qOut_1 = u1_rnd_shift_q[15:0];
    assign qOut_2 = u2_rnd_shift_q[15:0];
    assign qOut_3 = u3_rnd_shift_q[15:0];
    assign qOut_4 = u4_rnd_shift_q[15:0];
    assign qOut_5 = u5_rnd_shift_q[15:0];
    assign qOut_6 = u6_rnd_shift_q[15:0];
    assign qOut_7 = u7_rnd_shift_q[15:0];
    assign eOut_0 = VCC_q;
    assign eOut_1 = VCC_q;
    assign eOut_2 = VCC_q;
    assign eOut_3 = VCC_q;
    assign eOut_4 = VCC_q;
    assign eOut_5 = VCC_q;
    assign eOut_6 = VCC_q;
    assign eOut_7 = VCC_q;

endmodule
