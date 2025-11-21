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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine (
    input wire [0:0] in_1_go_tpl,
    input wire [0:0] in_2_Valid_in_tpl,
    input wire [0:0] in_3_Cmp1_tpl,
    input wire [0:0] in_4_Cmp2_tpl,
    input wire [0:0] in_5_ena_tpl,
    output wire [0:0] out_1_S2B_cnt2E_tpl,
    output wire [0:0] out_2_S2B_cnt1E_tpl,
    output wire [0:0] out_3_S2B_We_tpl,
    output wire [0:0] out_4_S2B_latch_tpl,
    output wire [0:0] out_5_S2B_waitdone_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [4:0] bitJoin_12_q;
    wire [3:0] bitJoin_2_q;
    wire [1:0] bitJoin_7_q;
    wire [1:0] bitSelect_14_b;
    wire [0:0] bitSelect_15_b;
    wire [0:0] bitSelect_17_b;
    wire [0:0] bitSelect_18_b;
    wire [0:0] bitSelect_4_b;
    wire [0:0] bitSelect_5_b;
    wire [1:0] const_8_q;
    reg [5:0] lut_13_q;
    reg [1:0] lut_3_q;
    wire [1:0] mux_9_s;
    reg [1:0] mux_9_q;
    wire [0:0] nor_1_q;
    reg [1:0] reg_11_q;
    reg [0:0] reg_6_q;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // const_8(CONSTANT,12)
    assign const_8_q = $unsigned(2'b00);

    // bitSelect_4(BITSELECT,10)
    assign bitSelect_4_b = lut_3_q[0:0];

    // bitJoin_7(BITJOIN,4)
    assign bitJoin_7_q = {bitSelect_4_b, in_5_ena_tpl};

    // mux_9(MUX,15)
    assign mux_9_s = bitJoin_7_q;
    always @(mux_9_s or reg_11_q or const_8_q or bitSelect_14_b)
    begin
        unique case (mux_9_s)
            2'b00 : mux_9_q = reg_11_q;
            2'b01 : mux_9_q = const_8_q;
            2'b10 : mux_9_q = reg_11_q;
            2'b11 : mux_9_q = bitSelect_14_b;
            default : mux_9_q = 2'b0;
        endcase
    end

    // reg_11(REG,17)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            reg_11_q <= $unsigned(2'b00);
        end
        else
        begin
            reg_11_q <= mux_9_q;
        end
    end

    // bitJoin_12(BITJOIN,2)
    assign bitJoin_12_q = {reg_11_q, in_4_Cmp2_tpl, in_3_Cmp1_tpl, in_2_Valid_in_tpl};

    // lut_13(LOOKUP,13)
    always @(bitJoin_12_q)
    begin
        // Begin reserved scope level
        unique case (bitJoin_12_q)
            5'b00000 : lut_13_q = 6'b000000;
            5'b00001 : lut_13_q = 6'b010101;
            5'b00010 : lut_13_q = 6'b000000;
            5'b00011 : lut_13_q = 6'b010101;
            5'b00100 : lut_13_q = 6'b000000;
            5'b00101 : lut_13_q = 6'b010101;
            5'b00110 : lut_13_q = 6'b000000;
            5'b00111 : lut_13_q = 6'b010101;
            5'b01000 : lut_13_q = 6'b000001;
            5'b01001 : lut_13_q = 6'b000001;
            5'b01010 : lut_13_q = 6'b100010;
            5'b01011 : lut_13_q = 6'b100010;
            5'b01100 : lut_13_q = 6'b000001;
            5'b01101 : lut_13_q = 6'b000001;
            5'b01110 : lut_13_q = 6'b100010;
            5'b01111 : lut_13_q = 6'b100010;
            5'b10000 : lut_13_q = 6'b000010;
            5'b10001 : lut_13_q = 6'b000010;
            5'b10010 : lut_13_q = 6'b000010;
            5'b10011 : lut_13_q = 6'b000010;
            5'b10100 : lut_13_q = 6'b000000;
            5'b10101 : lut_13_q = 6'b010101;
            5'b10110 : lut_13_q = 6'b000000;
            5'b10111 : lut_13_q = 6'b010101;
            default : lut_13_q = 6'b000000;
        endcase
        // End reserved scope level
    end

    // bitSelect_14(BITSELECT,5)
    assign bitSelect_14_b = lut_13_q[1:0];

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // nor_1(LOGICAL,16)
    assign nor_1_q = $unsigned(bitSelect_14_b == 2'b00 ? 1'b1 : 1'b0);

    // reg_6(REG,18)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            reg_6_q <= $unsigned(1'b0);
        end
        else
        begin
            reg_6_q <= bitSelect_4_b;
        end
    end

    // bitJoin_2(BITJOIN,3)
    assign bitJoin_2_q = {in_5_ena_tpl, nor_1_q, in_1_go_tpl, reg_6_q};

    // lut_3(LOOKUP,14)
    always @(bitJoin_2_q)
    begin
        // Begin reserved scope level
        unique case (bitJoin_2_q)
            4'b0000 : lut_3_q = 2'b00;
            4'b0001 : lut_3_q = 2'b01;
            4'b0010 : lut_3_q = 2'b00;
            4'b0011 : lut_3_q = 2'b01;
            4'b0100 : lut_3_q = 2'b00;
            4'b0101 : lut_3_q = 2'b01;
            4'b0110 : lut_3_q = 2'b00;
            4'b0111 : lut_3_q = 2'b01;
            4'b1000 : lut_3_q = 2'b00;
            4'b1001 : lut_3_q = 2'b01;
            4'b1010 : lut_3_q = 2'b01;
            4'b1011 : lut_3_q = 2'b01;
            4'b1100 : lut_3_q = 2'b00;
            4'b1101 : lut_3_q = 2'b10;
            4'b1110 : lut_3_q = 2'b10;
            4'b1111 : lut_3_q = 2'b10;
            default : lut_3_q = 2'b00;
        endcase
        // End reserved scope level
    end

    // bitSelect_5(BITSELECT,11)
    assign bitSelect_5_b = lut_3_q[1:1];

    // bitSelect_18(BITSELECT,9)
    assign bitSelect_18_b = lut_13_q[5:5];

    // bitSelect_17(BITSELECT,8)
    assign bitSelect_17_b = lut_13_q[4:4];

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // bitSelect_15(BITSELECT,6)
    assign bitSelect_15_b = lut_13_q[2:2];

    // signalOut_19(GPOUT,20)
    assign out_1_S2B_cnt2E_tpl = bitSelect_15_b;
    assign out_2_S2B_cnt1E_tpl = GND_q;
    assign out_3_S2B_We_tpl = bitSelect_17_b;
    assign out_4_S2B_latch_tpl = bitSelect_18_b;
    assign out_5_S2B_waitdone_tpl = bitSelect_5_b;

endmodule
