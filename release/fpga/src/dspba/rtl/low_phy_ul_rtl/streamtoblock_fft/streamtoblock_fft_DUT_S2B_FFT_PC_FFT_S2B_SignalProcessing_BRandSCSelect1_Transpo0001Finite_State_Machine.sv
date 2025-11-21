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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpo0001Finite_State_Machine (
    input wire [0:0] in_1_go_tpl,
    input wire [0:0] in_2_x_tpl,
    output wire [0:0] out_1_fsm_q_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [2:0] bitJoin_13_q;
    wire [3:0] bitJoin_3_q;
    wire [1:0] bitJoin_8_q;
    wire [1:0] bitSelect_15_b;
    wire [0:0] bitSelect_16_b;
    wire [0:0] bitSelect_5_b;
    wire [1:0] const_9_q;
    reg [2:0] lut_14_q;
    reg [1:0] lut_4_q;
    wire [1:0] mux_10_s;
    reg [1:0] mux_10_q;
    wire [0:0] nor_2_q;
    reg [1:0] reg_12_q;
    reg [0:0] reg_7_q;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // bitSelect_15(BITSELECT,5)
    assign bitSelect_15_b = lut_14_q[1:0];

    // const_9(CONSTANT,9)
    assign const_9_q = $unsigned(2'b00);

    // nor_2(LOGICAL,13)
    assign nor_2_q = $unsigned(bitSelect_15_b == 2'b00 ? 1'b1 : 1'b0);

    // reg_7(REG,15)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            reg_7_q <= $unsigned(1'b0);
        end
        else
        begin
            reg_7_q <= bitSelect_5_b;
        end
    end

    // bitJoin_3(BITJOIN,3)
    assign bitJoin_3_q = {VCC_q, nor_2_q, in_1_go_tpl, reg_7_q};

    // lut_4(LOOKUP,11)
    always @(bitJoin_3_q)
    begin
        // Begin reserved scope level
        unique case (bitJoin_3_q)
            4'b0000 : lut_4_q = 2'b00;
            4'b0001 : lut_4_q = 2'b01;
            4'b0010 : lut_4_q = 2'b00;
            4'b0011 : lut_4_q = 2'b01;
            4'b0100 : lut_4_q = 2'b00;
            4'b0101 : lut_4_q = 2'b01;
            4'b0110 : lut_4_q = 2'b00;
            4'b0111 : lut_4_q = 2'b01;
            4'b1000 : lut_4_q = 2'b00;
            4'b1001 : lut_4_q = 2'b01;
            4'b1010 : lut_4_q = 2'b01;
            4'b1011 : lut_4_q = 2'b01;
            4'b1100 : lut_4_q = 2'b00;
            4'b1101 : lut_4_q = 2'b10;
            4'b1110 : lut_4_q = 2'b10;
            4'b1111 : lut_4_q = 2'b10;
            default : lut_4_q = 2'b00;
        endcase
        // End reserved scope level
    end

    // bitSelect_5(BITSELECT,7)
    assign bitSelect_5_b = lut_4_q[0:0];

    // bitJoin_8(BITJOIN,4)
    assign bitJoin_8_q = {bitSelect_5_b, VCC_q};

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // mux_10(MUX,12)
    assign mux_10_s = bitJoin_8_q;
    always @(mux_10_s or reg_12_q or const_9_q or bitSelect_15_b)
    begin
        unique case (mux_10_s)
            2'b00 : mux_10_q = reg_12_q;
            2'b01 : mux_10_q = const_9_q;
            2'b10 : mux_10_q = reg_12_q;
            2'b11 : mux_10_q = bitSelect_15_b;
            default : mux_10_q = 2'b0;
        endcase
    end

    // reg_12(REG,14)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            reg_12_q <= $unsigned(2'b00);
        end
        else
        begin
            reg_12_q <= mux_10_q;
        end
    end

    // bitJoin_13(BITJOIN,2)
    assign bitJoin_13_q = {reg_12_q, in_2_x_tpl};

    // lut_14(LOOKUP,10)
    always @(bitJoin_13_q)
    begin
        // Begin reserved scope level
        unique case (bitJoin_13_q)
            3'b000 : lut_14_q = 3'b001;
            3'b001 : lut_14_q = 3'b010;
            3'b010 : lut_14_q = 3'b001;
            3'b011 : lut_14_q = 3'b110;
            3'b100 : lut_14_q = 3'b001;
            3'b101 : lut_14_q = 3'b010;
            default : lut_14_q = 3'b001;
        endcase
        // End reserved scope level
    end

    // bitSelect_16(BITSELECT,6)
    assign bitSelect_16_b = lut_14_q[2:2];

    // signalOut_17(GPOUT,17)
    assign out_1_fsm_q_tpl = bitSelect_16_b;

endmodule
