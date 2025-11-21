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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Finite_State_Machine12
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FF0000nite_State_Machine12 (
    input wire [0:0] in_1_go_tpl,
    input wire [0:0] in_2_WbaNERba_tpl,
    input wire [0:0] in_3_LastRd_tpl,
    input wire [0:0] in_4_ena_tpl,
    output wire [0:0] out_1_S2B_ToggleRba_tpl,
    output wire [0:0] out_2_S2B_Go_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [2:0] bitJoin_12_q;
    wire [3:0] bitJoin_2_q;
    wire [1:0] bitJoin_7_q;
    wire [0:0] bitSelect_14_b;
    wire [0:0] bitSelect_15_b;
    wire [0:0] bitSelect_16_b;
    wire [0:0] bitSelect_4_b;
    reg [2:0] lut_13_q;
    reg [1:0] lut_3_q;
    wire [1:0] mux_9_s;
    reg [0:0] mux_9_q;
    wire [0:0] nor_1_q;
    reg [0:0] reg_11_q;
    reg [0:0] reg_6_q;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // bitSelect_14(BITSELECT,5)
    assign bitSelect_14_b = lut_13_q[0:0];

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // nor_1(LOGICAL,13)
    assign nor_1_q = $unsigned(bitSelect_14_b == 1'b0 ? 1'b1 : 1'b0);

    // reg_6(REG,15)
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
    assign bitJoin_2_q = {in_4_ena_tpl, nor_1_q, in_1_go_tpl, reg_6_q};

    // lut_3(LOOKUP,11)
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

    // bitSelect_4(BITSELECT,8)
    assign bitSelect_4_b = lut_3_q[0:0];

    // bitJoin_7(BITJOIN,4)
    assign bitJoin_7_q = {bitSelect_4_b, in_4_ena_tpl};

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // mux_9(MUX,12)
    assign mux_9_s = bitJoin_7_q;
    always @(mux_9_s or reg_11_q or GND_q or bitSelect_14_b)
    begin
        unique case (mux_9_s)
            2'b00 : mux_9_q = reg_11_q;
            2'b01 : mux_9_q = GND_q;
            2'b10 : mux_9_q = reg_11_q;
            2'b11 : mux_9_q = bitSelect_14_b;
            default : mux_9_q = 1'b0;
        endcase
    end

    // reg_11(REG,14)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            reg_11_q <= $unsigned(1'b0);
        end
        else
        begin
            reg_11_q <= mux_9_q;
        end
    end

    // bitJoin_12(BITJOIN,2)
    assign bitJoin_12_q = {reg_11_q, in_3_LastRd_tpl, in_2_WbaNERba_tpl};

    // lut_13(LOOKUP,10)
    always @(bitJoin_12_q)
    begin
        // Begin reserved scope level
        unique case (bitJoin_12_q)
            3'b000 : lut_13_q = 3'b000;
            3'b001 : lut_13_q = 3'b011;
            3'b010 : lut_13_q = 3'b000;
            3'b011 : lut_13_q = 3'b011;
            3'b100 : lut_13_q = 3'b001;
            3'b101 : lut_13_q = 3'b001;
            3'b110 : lut_13_q = 3'b100;
            3'b111 : lut_13_q = 3'b100;
            default : lut_13_q = 3'b000;
        endcase
        // End reserved scope level
    end

    // bitSelect_16(BITSELECT,7)
    assign bitSelect_16_b = lut_13_q[2:2];

    // bitSelect_15(BITSELECT,6)
    assign bitSelect_15_b = lut_13_q[1:1];

    // signalOut_17(GPOUT,17)
    assign out_1_S2B_ToggleRba_tpl = bitSelect_15_b;
    assign out_2_S2B_Go_tpl = bitSelect_16_b;

endmodule
