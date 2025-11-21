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

// SystemVerilog created from ddc_model_DUT_DUT_DDC_l1_x_HB1_scale_HB1_re
// SystemVerilog created on Thu Jan  9 15:36:33 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ddc_model_DUT_DUT_DDC_l1_x_HB1_scale_HB1_re (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [38:0] xIn_0,
    input wire [0:0] gain_i,
    output wire [0:0] qOut_v,
    output wire [7:0] qOut_c,
    output wire [15:0] qOut_0,
    output wire [0:0] eOut_0,
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
    wire [19:0] u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const_q;
    wire [5:0] u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q;
    reg [0:0] redist0_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1_q;
    reg [4:0] redist1_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1_q;
    reg [19:0] redist2_u0_rnd_add_p1_of_2_q_1_q;
    reg [0:0] redist3_xIn_v_2_q;
    reg [0:0] redist3_xIn_v_2_delay_0;
    reg [7:0] redist4_xIn_c_2_q;
    reg [7:0] redist4_xIn_c_2_delay_0;
    wire [38:0] u0_shiftsel_q;
    wire [38:0] u0_shiftsel_qint;
    wire [25:0] u0_rnd_add_BitJoin_for_q_q;
    wire [5:0] u0_rnd_add_BitSelect_for_a_BitJoin_for_c_q;
    wire [24:0] u0_rnd_trunc_q;
    wire [38:0] u0_rnd_trunc_qint;
    wire [24:0] u0_rnd_shift_q;
    wire [25:0] u0_rnd_shift_qint;
    wire [19:0] u0_rnd_add_BitSelect_for_a_tessel0_0_b;
    wire [4:0] u0_rnd_add_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u0_rnd_add_BitSelect_for_a_tessel1_1_b;
    wire [19:0] u0_rnd_add_BitSelect_for_a_BitJoin_for_b_q;

    import ddc_model_DUT_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const(CONSTANT,76)
    assign u0_rnd_add_BitSelect_for_b_BitJoin_for_b_q_const_q = $unsigned(20'b00000000000000000001);

    // u0_shiftsel(BITSHIFT,4)@0
    assign u0_shiftsel_qint = xIn_0;
    assign u0_shiftsel_q = u0_shiftsel_qint[38:0];

    // u0_rnd_trunc(BITSHIFT,8)@0
    assign u0_rnd_trunc_qint = u0_shiftsel_q;
    assign u0_rnd_trunc_q = u0_rnd_trunc_qint[38:14];

    // u0_rnd_add_BitSelect_for_a_tessel0_0(BITSELECT,23)@0
    assign u0_rnd_add_BitSelect_for_a_tessel0_0_b = $unsigned(u0_rnd_trunc_q[19:0]);

    // u0_rnd_add_BitSelect_for_a_BitJoin_for_b(BITJOIN,24)@0
    assign u0_rnd_add_BitSelect_for_a_BitJoin_for_b_q = u0_rnd_add_BitSelect_for_a_tessel0_0_b;

    // u0_rnd_add_p1_of_2(ADD,20)@0 + 1
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

    // u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const(CONSTANT,83)
    assign u0_rnd_add_BitSelect_for_b_BitJoin_for_c_q_const_q = $unsigned(6'b000000);

    // u0_rnd_add_BitSelect_for_a_tessel1_1(BITSELECT,26)@0
    assign u0_rnd_add_BitSelect_for_a_tessel1_1_b = $unsigned(u0_rnd_trunc_q[24:24]);

    // redist0_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1(DELAY,84)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= '0;
        end
        else
        begin
            redist0_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1_q <= $unsigned(u0_rnd_add_BitSelect_for_a_tessel1_1_b);
        end
    end

    // u0_rnd_add_BitSelect_for_a_tessel1_0(BITSELECT,25)@0
    assign u0_rnd_add_BitSelect_for_a_tessel1_0_b = $unsigned(u0_rnd_trunc_q[24:20]);

    // redist1_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1(DELAY,85)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= '0;
        end
        else
        begin
            redist1_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1_q <= $unsigned(u0_rnd_add_BitSelect_for_a_tessel1_0_b);
        end
    end

    // u0_rnd_add_BitSelect_for_a_BitJoin_for_c(BITJOIN,27)@1
    assign u0_rnd_add_BitSelect_for_a_BitJoin_for_c_q = {redist0_u0_rnd_add_BitSelect_for_a_tessel1_1_b_1_q, redist1_u0_rnd_add_BitSelect_for_a_tessel1_0_b_1_q};

    // u0_rnd_add_p2_of_2(ADD,21)@1 + 1
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

    // redist2_u0_rnd_add_p1_of_2_q_1(DELAY,86)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_u0_rnd_add_p1_of_2_q_1_q <= '0;
        end
        else
        begin
            redist2_u0_rnd_add_p1_of_2_q_1_q <= $unsigned(u0_rnd_add_p1_of_2_q);
        end
    end

    // u0_rnd_add_BitJoin_for_q(BITJOIN,22)@2
    assign u0_rnd_add_BitJoin_for_q_q = {u0_rnd_add_p2_of_2_q, redist2_u0_rnd_add_p1_of_2_q_1_q};

    // u0_rnd_shift(BITSHIFT,10)@2
    assign u0_rnd_shift_qint = u0_rnd_add_BitJoin_for_q_q;
    assign u0_rnd_shift_q = u0_rnd_shift_qint[25:1];

    // redist4_xIn_c_2(DELAY,88)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist4_xIn_c_2_delay_0 <= '0;
        end
        else
        begin
            redist4_xIn_c_2_delay_0 <= $unsigned(xIn_c);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_xIn_c_2_q <= redist4_xIn_c_2_delay_0;
        end
    end

    // redist3_xIn_v_2(DELAY,87)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist3_xIn_v_2_delay_0 <= '0;
        end
        else
        begin
            redist3_xIn_v_2_delay_0 <= $unsigned(xIn_v);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_xIn_v_2_q <= redist3_xIn_v_2_delay_0;
        end
    end

    // qOut(PORTOUT,6)@2 + 1
    assign qOut_v = redist3_xIn_v_2_q;
    assign qOut_c = redist4_xIn_c_2_q;
    assign qOut_0 = u0_rnd_shift_q[15:0];
    assign eOut_0 = VCC_q;

endmodule
