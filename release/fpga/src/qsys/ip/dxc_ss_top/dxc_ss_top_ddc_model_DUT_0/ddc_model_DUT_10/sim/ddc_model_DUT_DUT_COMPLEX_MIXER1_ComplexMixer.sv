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

// SystemVerilog created from ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer
// SystemVerilog created on Thu Jan  9 15:36:33 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer (
    input wire [0:0] In_v,
    input wire [7:0] In_c,
    input wire [31:0] iIn_0,
    input wire [31:0] iIn_1,
    input wire [31:0] iIn_2,
    input wire [31:0] iIn_3,
    input wire [31:0] qIn_0,
    input wire [31:0] qIn_1,
    input wire [31:0] qIn_2,
    input wire [31:0] qIn_3,
    input wire [15:0] sIn_0,
    input wire [15:0] sIn_1,
    input wire [15:0] sIn_2,
    input wire [15:0] sIn_3,
    input wire [15:0] cIn_0,
    input wire [15:0] cIn_1,
    input wire [15:0] cIn_2,
    input wire [15:0] cIn_3,
    output wire [48:0] qOut_0,
    output wire [48:0] qOut_1,
    output wire [48:0] qOut_2,
    output wire [48:0] qOut_3,
    output wire [0:0] Out_v,
    output wire [7:0] Out_c,
    output wire [48:0] iOut_0,
    output wire [48:0] iOut_1,
    output wire [48:0] iOut_2,
    output wire [48:0] iOut_3,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [0:0] d_iIn_In_v_8_q;
    reg [48:0] d_u0_as_mult_i_sums_align_1_q_6_q;
    reg [48:0] d_u0_as_mult_i_sums_align_1_q_7_q;
    reg [48:0] d_u0_as_mult_q_sums_align_1_q_6_q;
    reg [48:0] d_u0_as_mult_q_sums_align_1_q_7_q;
    reg [48:0] d_u1_as_mult_i_sums_align_1_q_6_q;
    reg [48:0] d_u1_as_mult_i_sums_align_1_q_7_q;
    reg [48:0] d_u1_as_mult_q_sums_align_1_q_6_q;
    reg [48:0] d_u1_as_mult_q_sums_align_1_q_7_q;
    reg [48:0] d_u2_as_mult_i_sums_align_1_q_6_q;
    reg [48:0] d_u2_as_mult_i_sums_align_1_q_7_q;
    reg [48:0] d_u2_as_mult_q_sums_align_1_q_6_q;
    reg [48:0] d_u2_as_mult_q_sums_align_1_q_7_q;
    reg [48:0] d_u3_as_mult_i_sums_align_1_q_6_q;
    reg [48:0] d_u3_as_mult_i_sums_align_1_q_7_q;
    reg [48:0] d_u3_as_mult_q_sums_align_1_q_6_q;
    reg [48:0] d_u3_as_mult_q_sums_align_1_q_7_q;
    wire u0_as_mult_i_ma0_cma_reset;
    wire [15:0] u0_as_mult_i_ma0_cma_a0;
    wire [18:0] u0_as_mult_i_ma0_cma_c0;
    wire [15:0] u0_as_mult_i_ma0_cma_a1;
    wire [18:0] u0_as_mult_i_ma0_cma_c1;
    wire [35:0] u0_as_mult_i_ma0_cma_s0;
    wire [0:0] u0_as_mult_i_ma0_cma_sna;
    wire [35:0] u0_as_mult_i_ma0_cma_qq0;
    reg [35:0] u0_as_mult_i_ma0_cma_q;
    wire u0_as_mult_i_ma0_cma_ena0;
    wire u0_as_mult_i_ma0_cma_ena1;
    wire u0_as_mult_i_ma0_cma_ena2;
    reg [35:0] d_u0_as_mult_i_ma0_cma_q_6_q;
    reg [35:0] d_u0_as_mult_i_ma0_cma_q_7_q;
    wire u0_as_mult_i_ma7_cma_reset;
    wire [13:0] u0_as_mult_i_ma7_cma_a0;
    wire [15:0] u0_as_mult_i_ma7_cma_c0;
    wire [13:0] u0_as_mult_i_ma7_cma_a1;
    wire [15:0] u0_as_mult_i_ma7_cma_c1;
    wire [30:0] u0_as_mult_i_ma7_cma_s0;
    wire [0:0] u0_as_mult_i_ma7_cma_sna;
    wire [30:0] u0_as_mult_i_ma7_cma_qq0;
    reg [30:0] u0_as_mult_i_ma7_cma_q;
    wire u0_as_mult_i_ma7_cma_ena0;
    wire u0_as_mult_i_ma7_cma_ena1;
    wire u0_as_mult_i_ma7_cma_ena2;
    wire u0_as_mult_q_ma0_cma_reset;
    wire [15:0] u0_as_mult_q_ma0_cma_a0;
    wire [18:0] u0_as_mult_q_ma0_cma_c0;
    wire [15:0] u0_as_mult_q_ma0_cma_a1;
    wire [18:0] u0_as_mult_q_ma0_cma_c1;
    wire [35:0] u0_as_mult_q_ma0_cma_s0;
    wire [35:0] u0_as_mult_q_ma0_cma_qq0;
    reg [35:0] u0_as_mult_q_ma0_cma_q;
    wire u0_as_mult_q_ma0_cma_ena0;
    wire u0_as_mult_q_ma0_cma_ena1;
    wire u0_as_mult_q_ma0_cma_ena2;
    reg [35:0] d_u0_as_mult_q_ma0_cma_q_6_q;
    reg [35:0] d_u0_as_mult_q_ma0_cma_q_7_q;
    wire u0_as_mult_q_ma7_cma_reset;
    wire [13:0] u0_as_mult_q_ma7_cma_a0;
    wire [15:0] u0_as_mult_q_ma7_cma_c0;
    wire [13:0] u0_as_mult_q_ma7_cma_a1;
    wire [15:0] u0_as_mult_q_ma7_cma_c1;
    wire [30:0] u0_as_mult_q_ma7_cma_s0;
    wire [30:0] u0_as_mult_q_ma7_cma_qq0;
    reg [30:0] u0_as_mult_q_ma7_cma_q;
    wire u0_as_mult_q_ma7_cma_ena0;
    wire u0_as_mult_q_ma7_cma_ena1;
    wire u0_as_mult_q_ma7_cma_ena2;
    wire u1_as_mult_i_ma0_cma_reset;
    wire [15:0] u1_as_mult_i_ma0_cma_a0;
    wire [18:0] u1_as_mult_i_ma0_cma_c0;
    wire [15:0] u1_as_mult_i_ma0_cma_a1;
    wire [18:0] u1_as_mult_i_ma0_cma_c1;
    wire [35:0] u1_as_mult_i_ma0_cma_s0;
    wire [0:0] u1_as_mult_i_ma0_cma_sna;
    wire [35:0] u1_as_mult_i_ma0_cma_qq0;
    reg [35:0] u1_as_mult_i_ma0_cma_q;
    wire u1_as_mult_i_ma0_cma_ena0;
    wire u1_as_mult_i_ma0_cma_ena1;
    wire u1_as_mult_i_ma0_cma_ena2;
    reg [35:0] d_u1_as_mult_i_ma0_cma_q_6_q;
    reg [35:0] d_u1_as_mult_i_ma0_cma_q_7_q;
    wire u1_as_mult_i_ma7_cma_reset;
    wire [13:0] u1_as_mult_i_ma7_cma_a0;
    wire [15:0] u1_as_mult_i_ma7_cma_c0;
    wire [13:0] u1_as_mult_i_ma7_cma_a1;
    wire [15:0] u1_as_mult_i_ma7_cma_c1;
    wire [30:0] u1_as_mult_i_ma7_cma_s0;
    wire [0:0] u1_as_mult_i_ma7_cma_sna;
    wire [30:0] u1_as_mult_i_ma7_cma_qq0;
    reg [30:0] u1_as_mult_i_ma7_cma_q;
    wire u1_as_mult_i_ma7_cma_ena0;
    wire u1_as_mult_i_ma7_cma_ena1;
    wire u1_as_mult_i_ma7_cma_ena2;
    wire u1_as_mult_q_ma0_cma_reset;
    wire [15:0] u1_as_mult_q_ma0_cma_a0;
    wire [18:0] u1_as_mult_q_ma0_cma_c0;
    wire [15:0] u1_as_mult_q_ma0_cma_a1;
    wire [18:0] u1_as_mult_q_ma0_cma_c1;
    wire [35:0] u1_as_mult_q_ma0_cma_s0;
    wire [35:0] u1_as_mult_q_ma0_cma_qq0;
    reg [35:0] u1_as_mult_q_ma0_cma_q;
    wire u1_as_mult_q_ma0_cma_ena0;
    wire u1_as_mult_q_ma0_cma_ena1;
    wire u1_as_mult_q_ma0_cma_ena2;
    reg [35:0] d_u1_as_mult_q_ma0_cma_q_6_q;
    reg [35:0] d_u1_as_mult_q_ma0_cma_q_7_q;
    wire u1_as_mult_q_ma7_cma_reset;
    wire [13:0] u1_as_mult_q_ma7_cma_a0;
    wire [15:0] u1_as_mult_q_ma7_cma_c0;
    wire [13:0] u1_as_mult_q_ma7_cma_a1;
    wire [15:0] u1_as_mult_q_ma7_cma_c1;
    wire [30:0] u1_as_mult_q_ma7_cma_s0;
    wire [30:0] u1_as_mult_q_ma7_cma_qq0;
    reg [30:0] u1_as_mult_q_ma7_cma_q;
    wire u1_as_mult_q_ma7_cma_ena0;
    wire u1_as_mult_q_ma7_cma_ena1;
    wire u1_as_mult_q_ma7_cma_ena2;
    wire u2_as_mult_i_ma0_cma_reset;
    wire [15:0] u2_as_mult_i_ma0_cma_a0;
    wire [18:0] u2_as_mult_i_ma0_cma_c0;
    wire [15:0] u2_as_mult_i_ma0_cma_a1;
    wire [18:0] u2_as_mult_i_ma0_cma_c1;
    wire [35:0] u2_as_mult_i_ma0_cma_s0;
    wire [0:0] u2_as_mult_i_ma0_cma_sna;
    wire [35:0] u2_as_mult_i_ma0_cma_qq0;
    reg [35:0] u2_as_mult_i_ma0_cma_q;
    wire u2_as_mult_i_ma0_cma_ena0;
    wire u2_as_mult_i_ma0_cma_ena1;
    wire u2_as_mult_i_ma0_cma_ena2;
    reg [35:0] d_u2_as_mult_i_ma0_cma_q_6_q;
    reg [35:0] d_u2_as_mult_i_ma0_cma_q_7_q;
    wire u2_as_mult_i_ma7_cma_reset;
    wire [13:0] u2_as_mult_i_ma7_cma_a0;
    wire [15:0] u2_as_mult_i_ma7_cma_c0;
    wire [13:0] u2_as_mult_i_ma7_cma_a1;
    wire [15:0] u2_as_mult_i_ma7_cma_c1;
    wire [30:0] u2_as_mult_i_ma7_cma_s0;
    wire [0:0] u2_as_mult_i_ma7_cma_sna;
    wire [30:0] u2_as_mult_i_ma7_cma_qq0;
    reg [30:0] u2_as_mult_i_ma7_cma_q;
    wire u2_as_mult_i_ma7_cma_ena0;
    wire u2_as_mult_i_ma7_cma_ena1;
    wire u2_as_mult_i_ma7_cma_ena2;
    wire u2_as_mult_q_ma0_cma_reset;
    wire [15:0] u2_as_mult_q_ma0_cma_a0;
    wire [18:0] u2_as_mult_q_ma0_cma_c0;
    wire [15:0] u2_as_mult_q_ma0_cma_a1;
    wire [18:0] u2_as_mult_q_ma0_cma_c1;
    wire [35:0] u2_as_mult_q_ma0_cma_s0;
    wire [35:0] u2_as_mult_q_ma0_cma_qq0;
    reg [35:0] u2_as_mult_q_ma0_cma_q;
    wire u2_as_mult_q_ma0_cma_ena0;
    wire u2_as_mult_q_ma0_cma_ena1;
    wire u2_as_mult_q_ma0_cma_ena2;
    reg [35:0] d_u2_as_mult_q_ma0_cma_q_6_q;
    reg [35:0] d_u2_as_mult_q_ma0_cma_q_7_q;
    wire u2_as_mult_q_ma7_cma_reset;
    wire [13:0] u2_as_mult_q_ma7_cma_a0;
    wire [15:0] u2_as_mult_q_ma7_cma_c0;
    wire [13:0] u2_as_mult_q_ma7_cma_a1;
    wire [15:0] u2_as_mult_q_ma7_cma_c1;
    wire [30:0] u2_as_mult_q_ma7_cma_s0;
    wire [30:0] u2_as_mult_q_ma7_cma_qq0;
    reg [30:0] u2_as_mult_q_ma7_cma_q;
    wire u2_as_mult_q_ma7_cma_ena0;
    wire u2_as_mult_q_ma7_cma_ena1;
    wire u2_as_mult_q_ma7_cma_ena2;
    wire u3_as_mult_i_ma0_cma_reset;
    wire [15:0] u3_as_mult_i_ma0_cma_a0;
    wire [18:0] u3_as_mult_i_ma0_cma_c0;
    wire [15:0] u3_as_mult_i_ma0_cma_a1;
    wire [18:0] u3_as_mult_i_ma0_cma_c1;
    wire [35:0] u3_as_mult_i_ma0_cma_s0;
    wire [0:0] u3_as_mult_i_ma0_cma_sna;
    wire [35:0] u3_as_mult_i_ma0_cma_qq0;
    reg [35:0] u3_as_mult_i_ma0_cma_q;
    wire u3_as_mult_i_ma0_cma_ena0;
    wire u3_as_mult_i_ma0_cma_ena1;
    wire u3_as_mult_i_ma0_cma_ena2;
    reg [35:0] d_u3_as_mult_i_ma0_cma_q_6_q;
    reg [35:0] d_u3_as_mult_i_ma0_cma_q_7_q;
    wire u3_as_mult_i_ma7_cma_reset;
    wire [13:0] u3_as_mult_i_ma7_cma_a0;
    wire [15:0] u3_as_mult_i_ma7_cma_c0;
    wire [13:0] u3_as_mult_i_ma7_cma_a1;
    wire [15:0] u3_as_mult_i_ma7_cma_c1;
    wire [30:0] u3_as_mult_i_ma7_cma_s0;
    wire [0:0] u3_as_mult_i_ma7_cma_sna;
    wire [30:0] u3_as_mult_i_ma7_cma_qq0;
    reg [30:0] u3_as_mult_i_ma7_cma_q;
    wire u3_as_mult_i_ma7_cma_ena0;
    wire u3_as_mult_i_ma7_cma_ena1;
    wire u3_as_mult_i_ma7_cma_ena2;
    wire u3_as_mult_q_ma0_cma_reset;
    wire [15:0] u3_as_mult_q_ma0_cma_a0;
    wire [18:0] u3_as_mult_q_ma0_cma_c0;
    wire [15:0] u3_as_mult_q_ma0_cma_a1;
    wire [18:0] u3_as_mult_q_ma0_cma_c1;
    wire [35:0] u3_as_mult_q_ma0_cma_s0;
    wire [35:0] u3_as_mult_q_ma0_cma_qq0;
    reg [35:0] u3_as_mult_q_ma0_cma_q;
    wire u3_as_mult_q_ma0_cma_ena0;
    wire u3_as_mult_q_ma0_cma_ena1;
    wire u3_as_mult_q_ma0_cma_ena2;
    reg [35:0] d_u3_as_mult_q_ma0_cma_q_6_q;
    reg [35:0] d_u3_as_mult_q_ma0_cma_q_7_q;
    wire u3_as_mult_q_ma7_cma_reset;
    wire [13:0] u3_as_mult_q_ma7_cma_a0;
    wire [15:0] u3_as_mult_q_ma7_cma_c0;
    wire [13:0] u3_as_mult_q_ma7_cma_a1;
    wire [15:0] u3_as_mult_q_ma7_cma_c1;
    wire [30:0] u3_as_mult_q_ma7_cma_s0;
    wire [30:0] u3_as_mult_q_ma7_cma_qq0;
    reg [30:0] u3_as_mult_q_ma7_cma_q;
    wire u3_as_mult_q_ma7_cma_ena0;
    wire u3_as_mult_q_ma7_cma_ena1;
    wire u3_as_mult_q_ma7_cma_ena2;
    wire [20:0] u0_as_mult_i_sums_result_add_0_0_p1_of_3_a;
    wire [20:0] u0_as_mult_i_sums_result_add_0_0_p1_of_3_b;
    logic [20:0] u0_as_mult_i_sums_result_add_0_0_p1_of_3_o;
    wire [0:0] u0_as_mult_i_sums_result_add_0_0_p1_of_3_c;
    wire [19:0] u0_as_mult_i_sums_result_add_0_0_p1_of_3_q;
    reg [19:0] d_u0_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_q;
    reg [19:0] d_u0_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0;
    wire [21:0] u0_as_mult_i_sums_result_add_0_0_p2_of_3_a;
    wire [21:0] u0_as_mult_i_sums_result_add_0_0_p2_of_3_b;
    logic [21:0] u0_as_mult_i_sums_result_add_0_0_p2_of_3_o;
    wire [0:0] u0_as_mult_i_sums_result_add_0_0_p2_of_3_cin;
    wire [0:0] u0_as_mult_i_sums_result_add_0_0_p2_of_3_c;
    wire [19:0] u0_as_mult_i_sums_result_add_0_0_p2_of_3_q;
    reg [19:0] d_u0_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q;
    wire [11:0] u0_as_mult_i_sums_result_add_0_0_p3_of_3_a;
    wire [11:0] u0_as_mult_i_sums_result_add_0_0_p3_of_3_b;
    logic [11:0] u0_as_mult_i_sums_result_add_0_0_p3_of_3_o;
    wire [0:0] u0_as_mult_i_sums_result_add_0_0_p3_of_3_cin;
    wire [9:0] u0_as_mult_i_sums_result_add_0_0_p3_of_3_q;
    wire [20:0] u0_as_mult_q_sums_result_add_0_0_p1_of_3_a;
    wire [20:0] u0_as_mult_q_sums_result_add_0_0_p1_of_3_b;
    logic [20:0] u0_as_mult_q_sums_result_add_0_0_p1_of_3_o;
    wire [0:0] u0_as_mult_q_sums_result_add_0_0_p1_of_3_c;
    wire [19:0] u0_as_mult_q_sums_result_add_0_0_p1_of_3_q;
    reg [19:0] d_u0_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_q;
    reg [19:0] d_u0_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0;
    wire [21:0] u0_as_mult_q_sums_result_add_0_0_p2_of_3_a;
    wire [21:0] u0_as_mult_q_sums_result_add_0_0_p2_of_3_b;
    logic [21:0] u0_as_mult_q_sums_result_add_0_0_p2_of_3_o;
    wire [0:0] u0_as_mult_q_sums_result_add_0_0_p2_of_3_cin;
    wire [0:0] u0_as_mult_q_sums_result_add_0_0_p2_of_3_c;
    wire [19:0] u0_as_mult_q_sums_result_add_0_0_p2_of_3_q;
    reg [19:0] d_u0_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q;
    wire [11:0] u0_as_mult_q_sums_result_add_0_0_p3_of_3_a;
    wire [11:0] u0_as_mult_q_sums_result_add_0_0_p3_of_3_b;
    logic [11:0] u0_as_mult_q_sums_result_add_0_0_p3_of_3_o;
    wire [0:0] u0_as_mult_q_sums_result_add_0_0_p3_of_3_cin;
    wire [9:0] u0_as_mult_q_sums_result_add_0_0_p3_of_3_q;
    wire [20:0] u1_as_mult_i_sums_result_add_0_0_p1_of_3_a;
    wire [20:0] u1_as_mult_i_sums_result_add_0_0_p1_of_3_b;
    logic [20:0] u1_as_mult_i_sums_result_add_0_0_p1_of_3_o;
    wire [0:0] u1_as_mult_i_sums_result_add_0_0_p1_of_3_c;
    wire [19:0] u1_as_mult_i_sums_result_add_0_0_p1_of_3_q;
    reg [19:0] d_u1_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_q;
    reg [19:0] d_u1_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0;
    wire [21:0] u1_as_mult_i_sums_result_add_0_0_p2_of_3_a;
    wire [21:0] u1_as_mult_i_sums_result_add_0_0_p2_of_3_b;
    logic [21:0] u1_as_mult_i_sums_result_add_0_0_p2_of_3_o;
    wire [0:0] u1_as_mult_i_sums_result_add_0_0_p2_of_3_cin;
    wire [0:0] u1_as_mult_i_sums_result_add_0_0_p2_of_3_c;
    wire [19:0] u1_as_mult_i_sums_result_add_0_0_p2_of_3_q;
    reg [19:0] d_u1_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q;
    wire [11:0] u1_as_mult_i_sums_result_add_0_0_p3_of_3_a;
    wire [11:0] u1_as_mult_i_sums_result_add_0_0_p3_of_3_b;
    logic [11:0] u1_as_mult_i_sums_result_add_0_0_p3_of_3_o;
    wire [0:0] u1_as_mult_i_sums_result_add_0_0_p3_of_3_cin;
    wire [9:0] u1_as_mult_i_sums_result_add_0_0_p3_of_3_q;
    wire [20:0] u1_as_mult_q_sums_result_add_0_0_p1_of_3_a;
    wire [20:0] u1_as_mult_q_sums_result_add_0_0_p1_of_3_b;
    logic [20:0] u1_as_mult_q_sums_result_add_0_0_p1_of_3_o;
    wire [0:0] u1_as_mult_q_sums_result_add_0_0_p1_of_3_c;
    wire [19:0] u1_as_mult_q_sums_result_add_0_0_p1_of_3_q;
    reg [19:0] d_u1_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_q;
    reg [19:0] d_u1_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0;
    wire [21:0] u1_as_mult_q_sums_result_add_0_0_p2_of_3_a;
    wire [21:0] u1_as_mult_q_sums_result_add_0_0_p2_of_3_b;
    logic [21:0] u1_as_mult_q_sums_result_add_0_0_p2_of_3_o;
    wire [0:0] u1_as_mult_q_sums_result_add_0_0_p2_of_3_cin;
    wire [0:0] u1_as_mult_q_sums_result_add_0_0_p2_of_3_c;
    wire [19:0] u1_as_mult_q_sums_result_add_0_0_p2_of_3_q;
    reg [19:0] d_u1_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q;
    wire [11:0] u1_as_mult_q_sums_result_add_0_0_p3_of_3_a;
    wire [11:0] u1_as_mult_q_sums_result_add_0_0_p3_of_3_b;
    logic [11:0] u1_as_mult_q_sums_result_add_0_0_p3_of_3_o;
    wire [0:0] u1_as_mult_q_sums_result_add_0_0_p3_of_3_cin;
    wire [9:0] u1_as_mult_q_sums_result_add_0_0_p3_of_3_q;
    wire [20:0] u2_as_mult_i_sums_result_add_0_0_p1_of_3_a;
    wire [20:0] u2_as_mult_i_sums_result_add_0_0_p1_of_3_b;
    logic [20:0] u2_as_mult_i_sums_result_add_0_0_p1_of_3_o;
    wire [0:0] u2_as_mult_i_sums_result_add_0_0_p1_of_3_c;
    wire [19:0] u2_as_mult_i_sums_result_add_0_0_p1_of_3_q;
    reg [19:0] d_u2_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_q;
    reg [19:0] d_u2_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0;
    wire [21:0] u2_as_mult_i_sums_result_add_0_0_p2_of_3_a;
    wire [21:0] u2_as_mult_i_sums_result_add_0_0_p2_of_3_b;
    logic [21:0] u2_as_mult_i_sums_result_add_0_0_p2_of_3_o;
    wire [0:0] u2_as_mult_i_sums_result_add_0_0_p2_of_3_cin;
    wire [0:0] u2_as_mult_i_sums_result_add_0_0_p2_of_3_c;
    wire [19:0] u2_as_mult_i_sums_result_add_0_0_p2_of_3_q;
    reg [19:0] d_u2_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q;
    wire [11:0] u2_as_mult_i_sums_result_add_0_0_p3_of_3_a;
    wire [11:0] u2_as_mult_i_sums_result_add_0_0_p3_of_3_b;
    logic [11:0] u2_as_mult_i_sums_result_add_0_0_p3_of_3_o;
    wire [0:0] u2_as_mult_i_sums_result_add_0_0_p3_of_3_cin;
    wire [9:0] u2_as_mult_i_sums_result_add_0_0_p3_of_3_q;
    wire [20:0] u2_as_mult_q_sums_result_add_0_0_p1_of_3_a;
    wire [20:0] u2_as_mult_q_sums_result_add_0_0_p1_of_3_b;
    logic [20:0] u2_as_mult_q_sums_result_add_0_0_p1_of_3_o;
    wire [0:0] u2_as_mult_q_sums_result_add_0_0_p1_of_3_c;
    wire [19:0] u2_as_mult_q_sums_result_add_0_0_p1_of_3_q;
    reg [19:0] d_u2_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_q;
    reg [19:0] d_u2_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0;
    wire [21:0] u2_as_mult_q_sums_result_add_0_0_p2_of_3_a;
    wire [21:0] u2_as_mult_q_sums_result_add_0_0_p2_of_3_b;
    logic [21:0] u2_as_mult_q_sums_result_add_0_0_p2_of_3_o;
    wire [0:0] u2_as_mult_q_sums_result_add_0_0_p2_of_3_cin;
    wire [0:0] u2_as_mult_q_sums_result_add_0_0_p2_of_3_c;
    wire [19:0] u2_as_mult_q_sums_result_add_0_0_p2_of_3_q;
    reg [19:0] d_u2_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q;
    wire [11:0] u2_as_mult_q_sums_result_add_0_0_p3_of_3_a;
    wire [11:0] u2_as_mult_q_sums_result_add_0_0_p3_of_3_b;
    logic [11:0] u2_as_mult_q_sums_result_add_0_0_p3_of_3_o;
    wire [0:0] u2_as_mult_q_sums_result_add_0_0_p3_of_3_cin;
    wire [9:0] u2_as_mult_q_sums_result_add_0_0_p3_of_3_q;
    wire [20:0] u3_as_mult_i_sums_result_add_0_0_p1_of_3_a;
    wire [20:0] u3_as_mult_i_sums_result_add_0_0_p1_of_3_b;
    logic [20:0] u3_as_mult_i_sums_result_add_0_0_p1_of_3_o;
    wire [0:0] u3_as_mult_i_sums_result_add_0_0_p1_of_3_c;
    wire [19:0] u3_as_mult_i_sums_result_add_0_0_p1_of_3_q;
    reg [19:0] d_u3_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_q;
    reg [19:0] d_u3_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0;
    wire [21:0] u3_as_mult_i_sums_result_add_0_0_p2_of_3_a;
    wire [21:0] u3_as_mult_i_sums_result_add_0_0_p2_of_3_b;
    logic [21:0] u3_as_mult_i_sums_result_add_0_0_p2_of_3_o;
    wire [0:0] u3_as_mult_i_sums_result_add_0_0_p2_of_3_cin;
    wire [0:0] u3_as_mult_i_sums_result_add_0_0_p2_of_3_c;
    wire [19:0] u3_as_mult_i_sums_result_add_0_0_p2_of_3_q;
    reg [19:0] d_u3_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q;
    wire [11:0] u3_as_mult_i_sums_result_add_0_0_p3_of_3_a;
    wire [11:0] u3_as_mult_i_sums_result_add_0_0_p3_of_3_b;
    logic [11:0] u3_as_mult_i_sums_result_add_0_0_p3_of_3_o;
    wire [0:0] u3_as_mult_i_sums_result_add_0_0_p3_of_3_cin;
    wire [9:0] u3_as_mult_i_sums_result_add_0_0_p3_of_3_q;
    wire [20:0] u3_as_mult_q_sums_result_add_0_0_p1_of_3_a;
    wire [20:0] u3_as_mult_q_sums_result_add_0_0_p1_of_3_b;
    logic [20:0] u3_as_mult_q_sums_result_add_0_0_p1_of_3_o;
    wire [0:0] u3_as_mult_q_sums_result_add_0_0_p1_of_3_c;
    wire [19:0] u3_as_mult_q_sums_result_add_0_0_p1_of_3_q;
    reg [19:0] d_u3_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_q;
    reg [19:0] d_u3_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0;
    wire [21:0] u3_as_mult_q_sums_result_add_0_0_p2_of_3_a;
    wire [21:0] u3_as_mult_q_sums_result_add_0_0_p2_of_3_b;
    logic [21:0] u3_as_mult_q_sums_result_add_0_0_p2_of_3_o;
    wire [0:0] u3_as_mult_q_sums_result_add_0_0_p2_of_3_cin;
    wire [0:0] u3_as_mult_q_sums_result_add_0_0_p2_of_3_c;
    wire [19:0] u3_as_mult_q_sums_result_add_0_0_p2_of_3_q;
    reg [19:0] d_u3_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q;
    wire [11:0] u3_as_mult_q_sums_result_add_0_0_p3_of_3_a;
    wire [11:0] u3_as_mult_q_sums_result_add_0_0_p3_of_3_b;
    logic [11:0] u3_as_mult_q_sums_result_add_0_0_p3_of_3_o;
    wire [0:0] u3_as_mult_q_sums_result_add_0_0_p3_of_3_cin;
    wire [9:0] u3_as_mult_q_sums_result_add_0_0_p3_of_3_q;
    wire d_iIn_In_c_8_mem_reset0;
    wire d_iIn_In_c_8_mem_ena_OrRstB;
    wire [7:0] d_iIn_In_c_8_mem_ia;
    wire [2:0] d_iIn_In_c_8_mem_aa;
    wire [2:0] d_iIn_In_c_8_mem_ab;
    wire [7:0] d_iIn_In_c_8_mem_iq;
    wire [7:0] d_iIn_In_c_8_mem_q;
    wire [2:0] d_iIn_In_c_8_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] d_iIn_In_c_8_rdcnt_i;
    (* preserve_syn_only *) reg d_iIn_In_c_8_rdcnt_eq;
    reg [2:0] d_iIn_In_c_8_wraddr_q;
    wire [3:0] d_iIn_In_c_8_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_iIn_In_c_8_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_iIn_In_c_8_sticky_ena_q;
    wire [3:0] d_iIn_In_c_8_cmp_b;
    wire [0:0] d_iIn_In_c_8_cmp_q;
    wire [0:0] d_iIn_In_c_8_notEnable_q;
    wire [0:0] d_iIn_In_c_8_nor_q;
    wire [0:0] d_iIn_In_c_8_enaAnd_q;
    wire [17:0] u0_as_mult_i_bs1_bit_select_merged_b;
    wire [13:0] u0_as_mult_i_bs1_bit_select_merged_c;
    wire [17:0] u1_as_mult_i_bs1_bit_select_merged_b;
    wire [13:0] u1_as_mult_i_bs1_bit_select_merged_c;
    wire [17:0] u2_as_mult_i_bs1_bit_select_merged_b;
    wire [13:0] u2_as_mult_i_bs1_bit_select_merged_c;
    wire [17:0] u3_as_mult_i_bs1_bit_select_merged_b;
    wire [13:0] u3_as_mult_i_bs1_bit_select_merged_c;
    wire [17:0] u0_as_mult_i_bs4_bit_select_merged_b;
    wire [13:0] u0_as_mult_i_bs4_bit_select_merged_c;
    wire [17:0] u1_as_mult_i_bs4_bit_select_merged_b;
    wire [13:0] u1_as_mult_i_bs4_bit_select_merged_c;
    wire [17:0] u2_as_mult_i_bs4_bit_select_merged_b;
    wire [13:0] u2_as_mult_i_bs4_bit_select_merged_c;
    wire [17:0] u3_as_mult_i_bs4_bit_select_merged_b;
    wire [13:0] u3_as_mult_i_bs4_bit_select_merged_c;
    wire [19:0] u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b;
    wire [8:0] u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b;
    wire [0:0] u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b;
    wire [19:0] u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b;
    wire [8:0] u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b;
    wire [0:0] u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b;
    wire [19:0] u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b;
    wire [8:0] u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b;
    wire [0:0] u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b;
    wire [19:0] u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b;
    wire [8:0] u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b;
    wire [0:0] u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b;
    wire [19:0] u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b;
    wire [8:0] u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b;
    wire [0:0] u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b;
    wire [19:0] u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b;
    wire [8:0] u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b;
    wire [0:0] u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b;
    wire [19:0] u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b;
    wire [8:0] u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b;
    wire [0:0] u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b;
    wire [19:0] u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b;
    wire [8:0] u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b;
    wire [0:0] u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b;
    wire [19:0] u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b;
    wire [15:0] u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b;
    wire [0:0] u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b;
    wire [48:0] u0_as_mult_i_sums_align_1_q;
    wire [48:0] u0_as_mult_i_sums_align_1_qint;
    wire [19:0] u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b;
    wire [15:0] u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b;
    wire [0:0] u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b;
    wire [48:0] u0_as_mult_q_sums_align_1_q;
    wire [48:0] u0_as_mult_q_sums_align_1_qint;
    wire [19:0] u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b;
    wire [15:0] u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b;
    wire [0:0] u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b;
    wire [48:0] u1_as_mult_i_sums_align_1_q;
    wire [48:0] u1_as_mult_i_sums_align_1_qint;
    wire [19:0] u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b;
    wire [15:0] u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b;
    wire [0:0] u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b;
    wire [48:0] u1_as_mult_q_sums_align_1_q;
    wire [48:0] u1_as_mult_q_sums_align_1_qint;
    wire [19:0] u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b;
    wire [15:0] u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b;
    wire [0:0] u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b;
    wire [48:0] u2_as_mult_i_sums_align_1_q;
    wire [48:0] u2_as_mult_i_sums_align_1_qint;
    wire [19:0] u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b;
    wire [15:0] u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b;
    wire [0:0] u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b;
    wire [48:0] u2_as_mult_q_sums_align_1_q;
    wire [48:0] u2_as_mult_q_sums_align_1_qint;
    wire [19:0] u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b;
    wire [15:0] u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b;
    wire [0:0] u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b;
    wire [48:0] u3_as_mult_i_sums_align_1_q;
    wire [48:0] u3_as_mult_i_sums_align_1_qint;
    wire [19:0] u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b;
    wire [15:0] u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b;
    wire [0:0] u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b;
    wire [0:0] u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b;
    wire [48:0] u3_as_mult_q_sums_align_1_q;
    wire [48:0] u3_as_mult_q_sums_align_1_qint;
    wire [49:0] u0_as_mult_i_sums_result_add_0_0_BitJoin_for_q_q;
    wire [49:0] u0_as_mult_q_sums_result_add_0_0_BitJoin_for_q_q;
    wire [49:0] u1_as_mult_i_sums_result_add_0_0_BitJoin_for_q_q;
    wire [49:0] u1_as_mult_q_sums_result_add_0_0_BitJoin_for_q_q;
    wire [49:0] u2_as_mult_i_sums_result_add_0_0_BitJoin_for_q_q;
    wire [49:0] u2_as_mult_q_sums_result_add_0_0_BitJoin_for_q_q;
    wire [49:0] u3_as_mult_i_sums_result_add_0_0_BitJoin_for_q_q;
    wire [49:0] u3_as_mult_q_sums_result_add_0_0_BitJoin_for_q_q;
    wire [18:0] u0_as_mult_i_bjA2_q;
    wire [18:0] u1_as_mult_i_bjA2_q;
    wire [18:0] u2_as_mult_i_bjA2_q;
    wire [18:0] u3_as_mult_i_bjA2_q;
    wire [18:0] u0_as_mult_i_bjA5_q;
    wire [18:0] u1_as_mult_i_bjA5_q;
    wire [18:0] u2_as_mult_i_bjA5_q;
    wire [18:0] u3_as_mult_i_bjA5_q;
    wire [9:0] u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q;
    wire [9:0] u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q;
    wire [9:0] u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q;
    wire [9:0] u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q;
    wire [9:0] u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q;
    wire [9:0] u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q;
    wire [9:0] u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q;
    wire [9:0] u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q;
    wire [19:0] u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q;
    wire [9:0] u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q;
    wire [19:0] u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b;
    wire [19:0] u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q;
    wire [9:0] u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q;
    wire [19:0] u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b;
    wire [19:0] u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q;
    wire [9:0] u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q;
    wire [19:0] u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b;
    wire [19:0] u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q;
    wire [9:0] u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q;
    wire [19:0] u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b;
    wire [19:0] u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q;
    wire [9:0] u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q;
    wire [19:0] u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b;
    wire [19:0] u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q;
    wire [9:0] u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q;
    wire [19:0] u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b;
    wire [19:0] u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q;
    wire [9:0] u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q;
    wire [19:0] u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b;
    wire [19:0] u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q;
    wire [9:0] u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q;
    wire [19:0] u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b;

    import ddc_model_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // u3_as_mult_i_bs4_bit_select_merged(BITSELECT,471)@0
    assign u3_as_mult_i_bs4_bit_select_merged_b = $unsigned(qIn_3[17:0]);
    assign u3_as_mult_i_bs4_bit_select_merged_c = $unsigned(qIn_3[31:18]);

    // u3_as_mult_i_bs1_bit_select_merged(BITSELECT,467)@0
    assign u3_as_mult_i_bs1_bit_select_merged_b = $unsigned(iIn_3[17:0]);
    assign u3_as_mult_i_bs1_bit_select_merged_c = $unsigned(iIn_3[31:18]);

    // u3_as_mult_q_ma7_cma(CHAINMULTADD,159)@0 + 5
    assign u3_as_mult_q_ma7_cma_reset = areset;
    assign u3_as_mult_q_ma7_cma_ena0 = 1'b1;
    assign u3_as_mult_q_ma7_cma_ena1 = u3_as_mult_q_ma7_cma_ena0;
    assign u3_as_mult_q_ma7_cma_ena2 = u3_as_mult_q_ma7_cma_ena0;

    assign u3_as_mult_q_ma7_cma_a0 = $unsigned(u3_as_mult_i_bs1_bit_select_merged_c);
    assign u3_as_mult_q_ma7_cma_c0 = $unsigned(sIn_3);
    assign u3_as_mult_q_ma7_cma_a1 = $unsigned(u3_as_mult_i_bs4_bit_select_merged_c);
    assign u3_as_mult_q_ma7_cma_c1 = $unsigned(cIn_3);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(14),
        .by_clken("0"),
        .by_width(14),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(31)
    ) u3_as_mult_q_ma7_cma_DSP0 (
        .clk(clk),
        .ena({ u3_as_mult_q_ma7_cma_ena2, u3_as_mult_q_ma7_cma_ena1, u3_as_mult_q_ma7_cma_ena0 }),
        .clr({ u3_as_mult_q_ma7_cma_reset, u3_as_mult_q_ma7_cma_reset }),
        .ay(u3_as_mult_q_ma7_cma_a1),
        .by(u3_as_mult_q_ma7_cma_a0),
        .ax(u3_as_mult_q_ma7_cma_c1),
        .bx(u3_as_mult_q_ma7_cma_c0),
        .resulta(u3_as_mult_q_ma7_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(31), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u3_as_mult_q_ma7_cma_delay0 ( .xin(u3_as_mult_q_ma7_cma_s0), .xout(u3_as_mult_q_ma7_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u3_as_mult_q_ma7_cma_q = $unsigned(u3_as_mult_q_ma7_cma_qq0[30:0]);

    // u3_as_mult_q_sums_align_1(BITSHIFT,141)@5
    assign u3_as_mult_q_sums_align_1_qint = { u3_as_mult_q_ma7_cma_q, 18'b000000000000000000 };
    assign u3_as_mult_q_sums_align_1_q = u3_as_mult_q_sums_align_1_qint[48:0];

    // u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0(BITSELECT,457)@5
    assign u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b = $unsigned(u3_as_mult_q_sums_align_1_q[19:0]);

    // u3_as_mult_i_bjA5(BITJOIN,117)@0
    assign u3_as_mult_i_bjA5_q = {GND_q, u3_as_mult_i_bs4_bit_select_merged_b};

    // u3_as_mult_i_bjA2(BITJOIN,114)@0
    assign u3_as_mult_i_bjA2_q = {GND_q, u3_as_mult_i_bs1_bit_select_merged_b};

    // u3_as_mult_q_ma0_cma(CHAINMULTADD,158)@0 + 5
    assign u3_as_mult_q_ma0_cma_reset = areset;
    assign u3_as_mult_q_ma0_cma_ena0 = 1'b1;
    assign u3_as_mult_q_ma0_cma_ena1 = u3_as_mult_q_ma0_cma_ena0;
    assign u3_as_mult_q_ma0_cma_ena2 = u3_as_mult_q_ma0_cma_ena0;

    assign u3_as_mult_q_ma0_cma_a0 = $unsigned(sIn_3);
    assign u3_as_mult_q_ma0_cma_c0 = $unsigned(u3_as_mult_i_bjA2_q);
    assign u3_as_mult_q_ma0_cma_a1 = $unsigned(cIn_3);
    assign u3_as_mult_q_ma0_cma_c1 = $unsigned(u3_as_mult_i_bjA5_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(19),
        .by_clken("0"),
        .by_width(19),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(36)
    ) u3_as_mult_q_ma0_cma_DSP0 (
        .clk(clk),
        .ena({ u3_as_mult_q_ma0_cma_ena2, u3_as_mult_q_ma0_cma_ena1, u3_as_mult_q_ma0_cma_ena0 }),
        .clr({ u3_as_mult_q_ma0_cma_reset, u3_as_mult_q_ma0_cma_reset }),
        .ay(u3_as_mult_q_ma0_cma_c1),
        .by(u3_as_mult_q_ma0_cma_c0),
        .ax(u3_as_mult_q_ma0_cma_a1),
        .bx(u3_as_mult_q_ma0_cma_a0),
        .resulta(u3_as_mult_q_ma0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(36), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u3_as_mult_q_ma0_cma_delay0 ( .xin(u3_as_mult_q_ma0_cma_s0), .xout(u3_as_mult_q_ma0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u3_as_mult_q_ma0_cma_q = $unsigned(u3_as_mult_q_ma0_cma_qq0[35:0]);

    // u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0(BITSELECT,438)@5
    assign u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b = $unsigned(u3_as_mult_q_ma0_cma_q[19:0]);

    // u3_as_mult_q_sums_result_add_0_0_p1_of_3(ADD,252)@5 + 1
    assign u3_as_mult_q_sums_result_add_0_0_p1_of_3_a = {1'b0, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b};
    assign u3_as_mult_q_sums_result_add_0_0_p1_of_3_b = {1'b0, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_as_mult_q_sums_result_add_0_0_p1_of_3_o <= 21'b0;
        end
        else
        begin
            u3_as_mult_q_sums_result_add_0_0_p1_of_3_o <= $unsigned(u3_as_mult_q_sums_result_add_0_0_p1_of_3_a) + $unsigned(u3_as_mult_q_sums_result_add_0_0_p1_of_3_b);
        end
    end
    assign u3_as_mult_q_sums_result_add_0_0_p1_of_3_c[0] = u3_as_mult_q_sums_result_add_0_0_p1_of_3_o[20];
    assign u3_as_mult_q_sums_result_add_0_0_p1_of_3_q = u3_as_mult_q_sums_result_add_0_0_p1_of_3_o[19:0];

    // d_u3_as_mult_q_sums_align_1_q_6(DELAY,488)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_as_mult_q_sums_align_1_q_6_q <= '0;
        end
        else
        begin
            d_u3_as_mult_q_sums_align_1_q_6_q <= $unsigned(u3_as_mult_q_sums_align_1_q);
        end
    end

    // u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0(BITSELECT,459)@6
    assign u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b = $unsigned(d_u3_as_mult_q_sums_align_1_q_6_q[39:20]);

    // d_u3_as_mult_q_ma0_cma_q_6(DELAY,504)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_as_mult_q_ma0_cma_q_6_q <= '0;
        end
        else
        begin
            d_u3_as_mult_q_ma0_cma_q_6_q <= $unsigned(u3_as_mult_q_ma0_cma_q);
        end
    end

    // u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1(BITSELECT,441)@6
    assign u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b = $unsigned(d_u3_as_mult_q_ma0_cma_q_6_q[35:35]);

    // u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0(BITSELECT,440)@6
    assign u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b = $unsigned(d_u3_as_mult_q_ma0_cma_q_6_q[35:20]);

    // u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,445)@6
    assign u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q = {u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b};

    // u3_as_mult_q_sums_result_add_0_0_p2_of_3(ADD,253)@6 + 1
    assign u3_as_mult_q_sums_result_add_0_0_p2_of_3_cin = u3_as_mult_q_sums_result_add_0_0_p1_of_3_c;
    assign u3_as_mult_q_sums_result_add_0_0_p2_of_3_a = { {1'b0, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign u3_as_mult_q_sums_result_add_0_0_p2_of_3_b = { {1'b0, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b}, u3_as_mult_q_sums_result_add_0_0_p2_of_3_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_as_mult_q_sums_result_add_0_0_p2_of_3_o <= 22'b0;
        end
        else
        begin
            u3_as_mult_q_sums_result_add_0_0_p2_of_3_o <= $unsigned(u3_as_mult_q_sums_result_add_0_0_p2_of_3_a) + $unsigned(u3_as_mult_q_sums_result_add_0_0_p2_of_3_b);
        end
    end
    assign u3_as_mult_q_sums_result_add_0_0_p2_of_3_c[0] = u3_as_mult_q_sums_result_add_0_0_p2_of_3_o[21];
    assign u3_as_mult_q_sums_result_add_0_0_p2_of_3_q = u3_as_mult_q_sums_result_add_0_0_p2_of_3_o[20:1];

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // d_u3_as_mult_q_sums_align_1_q_7(DELAY,489)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_as_mult_q_sums_align_1_q_7_q <= '0;
        end
        else
        begin
            d_u3_as_mult_q_sums_align_1_q_7_q <= $unsigned(d_u3_as_mult_q_sums_align_1_q_6_q);
        end
    end

    // u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1(BITSELECT,462)@7
    assign u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b = $unsigned(d_u3_as_mult_q_sums_align_1_q_7_q[48:48]);

    // u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0(BITSELECT,461)@7
    assign u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b = $unsigned(d_u3_as_mult_q_sums_align_1_q_7_q[48:40]);

    // u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d(BITJOIN,463)@7
    assign u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q = {u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b};

    // d_u3_as_mult_q_ma0_cma_q_7(DELAY,505)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_as_mult_q_ma0_cma_q_7_q <= '0;
        end
        else
        begin
            d_u3_as_mult_q_ma0_cma_q_7_q <= $unsigned(d_u3_as_mult_q_ma0_cma_q_6_q);
        end
    end

    // u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0(BITSELECT,446)@7
    assign u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b = $unsigned(d_u3_as_mult_q_ma0_cma_q_7_q[35:35]);

    // u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d(BITJOIN,456)@7
    assign u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q = {u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b};

    // u3_as_mult_q_sums_result_add_0_0_p3_of_3(ADD,254)@7 + 1
    assign u3_as_mult_q_sums_result_add_0_0_p3_of_3_cin = u3_as_mult_q_sums_result_add_0_0_p2_of_3_c;
    assign u3_as_mult_q_sums_result_add_0_0_p3_of_3_a = $unsigned({ {{1{u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q[9]}}, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q}, 1'b1 });
    assign u3_as_mult_q_sums_result_add_0_0_p3_of_3_b = $unsigned({ {{1{u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q[9]}}, u3_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q}, u3_as_mult_q_sums_result_add_0_0_p3_of_3_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_as_mult_q_sums_result_add_0_0_p3_of_3_o <= 12'b0;
        end
        else
        begin
            u3_as_mult_q_sums_result_add_0_0_p3_of_3_o <= $unsigned($signed(u3_as_mult_q_sums_result_add_0_0_p3_of_3_a) + $signed(u3_as_mult_q_sums_result_add_0_0_p3_of_3_b));
        end
    end
    assign u3_as_mult_q_sums_result_add_0_0_p3_of_3_q = u3_as_mult_q_sums_result_add_0_0_p3_of_3_o[10:1];

    // d_u3_as_mult_q_sums_result_add_0_0_p2_of_3_q_8(DELAY,521)@7 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q <= '0;
        end
        else
        begin
            d_u3_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q <= $unsigned(u3_as_mult_q_sums_result_add_0_0_p2_of_3_q);
        end
    end

    // d_u3_as_mult_q_sums_result_add_0_0_p1_of_3_q_8(DELAY,520)@6 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= '0;
        end
        else
        begin
            d_u3_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= $unsigned(u3_as_mult_q_sums_result_add_0_0_p1_of_3_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u3_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_q <= d_u3_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0;
        end
    end

    // u3_as_mult_q_sums_result_add_0_0_BitJoin_for_q(BITJOIN,255)@8
    assign u3_as_mult_q_sums_result_add_0_0_BitJoin_for_q_q = {u3_as_mult_q_sums_result_add_0_0_p3_of_3_q, d_u3_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q, d_u3_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_q};

    // u2_as_mult_i_bs4_bit_select_merged(BITSELECT,470)@0
    assign u2_as_mult_i_bs4_bit_select_merged_b = $unsigned(qIn_2[17:0]);
    assign u2_as_mult_i_bs4_bit_select_merged_c = $unsigned(qIn_2[31:18]);

    // u2_as_mult_i_bs1_bit_select_merged(BITSELECT,466)@0
    assign u2_as_mult_i_bs1_bit_select_merged_b = $unsigned(iIn_2[17:0]);
    assign u2_as_mult_i_bs1_bit_select_merged_c = $unsigned(iIn_2[31:18]);

    // u2_as_mult_q_ma7_cma(CHAINMULTADD,155)@0 + 5
    assign u2_as_mult_q_ma7_cma_reset = areset;
    assign u2_as_mult_q_ma7_cma_ena0 = 1'b1;
    assign u2_as_mult_q_ma7_cma_ena1 = u2_as_mult_q_ma7_cma_ena0;
    assign u2_as_mult_q_ma7_cma_ena2 = u2_as_mult_q_ma7_cma_ena0;

    assign u2_as_mult_q_ma7_cma_a0 = $unsigned(u2_as_mult_i_bs1_bit_select_merged_c);
    assign u2_as_mult_q_ma7_cma_c0 = $unsigned(sIn_2);
    assign u2_as_mult_q_ma7_cma_a1 = $unsigned(u2_as_mult_i_bs4_bit_select_merged_c);
    assign u2_as_mult_q_ma7_cma_c1 = $unsigned(cIn_2);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(14),
        .by_clken("0"),
        .by_width(14),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(31)
    ) u2_as_mult_q_ma7_cma_DSP0 (
        .clk(clk),
        .ena({ u2_as_mult_q_ma7_cma_ena2, u2_as_mult_q_ma7_cma_ena1, u2_as_mult_q_ma7_cma_ena0 }),
        .clr({ u2_as_mult_q_ma7_cma_reset, u2_as_mult_q_ma7_cma_reset }),
        .ay(u2_as_mult_q_ma7_cma_a1),
        .by(u2_as_mult_q_ma7_cma_a0),
        .ax(u2_as_mult_q_ma7_cma_c1),
        .bx(u2_as_mult_q_ma7_cma_c0),
        .resulta(u2_as_mult_q_ma7_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(31), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u2_as_mult_q_ma7_cma_delay0 ( .xin(u2_as_mult_q_ma7_cma_s0), .xout(u2_as_mult_q_ma7_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u2_as_mult_q_ma7_cma_q = $unsigned(u2_as_mult_q_ma7_cma_qq0[30:0]);

    // u2_as_mult_q_sums_align_1(BITSHIFT,109)@5
    assign u2_as_mult_q_sums_align_1_qint = { u2_as_mult_q_ma7_cma_q, 18'b000000000000000000 };
    assign u2_as_mult_q_sums_align_1_q = u2_as_mult_q_sums_align_1_qint[48:0];

    // u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0(BITSELECT,405)@5
    assign u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b = $unsigned(u2_as_mult_q_sums_align_1_q[19:0]);

    // u2_as_mult_i_bjA5(BITJOIN,85)@0
    assign u2_as_mult_i_bjA5_q = {GND_q, u2_as_mult_i_bs4_bit_select_merged_b};

    // u2_as_mult_i_bjA2(BITJOIN,82)@0
    assign u2_as_mult_i_bjA2_q = {GND_q, u2_as_mult_i_bs1_bit_select_merged_b};

    // u2_as_mult_q_ma0_cma(CHAINMULTADD,154)@0 + 5
    assign u2_as_mult_q_ma0_cma_reset = areset;
    assign u2_as_mult_q_ma0_cma_ena0 = 1'b1;
    assign u2_as_mult_q_ma0_cma_ena1 = u2_as_mult_q_ma0_cma_ena0;
    assign u2_as_mult_q_ma0_cma_ena2 = u2_as_mult_q_ma0_cma_ena0;

    assign u2_as_mult_q_ma0_cma_a0 = $unsigned(sIn_2);
    assign u2_as_mult_q_ma0_cma_c0 = $unsigned(u2_as_mult_i_bjA2_q);
    assign u2_as_mult_q_ma0_cma_a1 = $unsigned(cIn_2);
    assign u2_as_mult_q_ma0_cma_c1 = $unsigned(u2_as_mult_i_bjA5_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(19),
        .by_clken("0"),
        .by_width(19),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(36)
    ) u2_as_mult_q_ma0_cma_DSP0 (
        .clk(clk),
        .ena({ u2_as_mult_q_ma0_cma_ena2, u2_as_mult_q_ma0_cma_ena1, u2_as_mult_q_ma0_cma_ena0 }),
        .clr({ u2_as_mult_q_ma0_cma_reset, u2_as_mult_q_ma0_cma_reset }),
        .ay(u2_as_mult_q_ma0_cma_c1),
        .by(u2_as_mult_q_ma0_cma_c0),
        .ax(u2_as_mult_q_ma0_cma_a1),
        .bx(u2_as_mult_q_ma0_cma_a0),
        .resulta(u2_as_mult_q_ma0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(36), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u2_as_mult_q_ma0_cma_delay0 ( .xin(u2_as_mult_q_ma0_cma_s0), .xout(u2_as_mult_q_ma0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u2_as_mult_q_ma0_cma_q = $unsigned(u2_as_mult_q_ma0_cma_qq0[35:0]);

    // u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0(BITSELECT,386)@5
    assign u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b = $unsigned(u2_as_mult_q_ma0_cma_q[19:0]);

    // u2_as_mult_q_sums_result_add_0_0_p1_of_3(ADD,228)@5 + 1
    assign u2_as_mult_q_sums_result_add_0_0_p1_of_3_a = {1'b0, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b};
    assign u2_as_mult_q_sums_result_add_0_0_p1_of_3_b = {1'b0, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_as_mult_q_sums_result_add_0_0_p1_of_3_o <= 21'b0;
        end
        else
        begin
            u2_as_mult_q_sums_result_add_0_0_p1_of_3_o <= $unsigned(u2_as_mult_q_sums_result_add_0_0_p1_of_3_a) + $unsigned(u2_as_mult_q_sums_result_add_0_0_p1_of_3_b);
        end
    end
    assign u2_as_mult_q_sums_result_add_0_0_p1_of_3_c[0] = u2_as_mult_q_sums_result_add_0_0_p1_of_3_o[20];
    assign u2_as_mult_q_sums_result_add_0_0_p1_of_3_q = u2_as_mult_q_sums_result_add_0_0_p1_of_3_o[19:0];

    // d_u2_as_mult_q_sums_align_1_q_6(DELAY,484)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_as_mult_q_sums_align_1_q_6_q <= '0;
        end
        else
        begin
            d_u2_as_mult_q_sums_align_1_q_6_q <= $unsigned(u2_as_mult_q_sums_align_1_q);
        end
    end

    // u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0(BITSELECT,407)@6
    assign u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b = $unsigned(d_u2_as_mult_q_sums_align_1_q_6_q[39:20]);

    // d_u2_as_mult_q_ma0_cma_q_6(DELAY,500)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_as_mult_q_ma0_cma_q_6_q <= '0;
        end
        else
        begin
            d_u2_as_mult_q_ma0_cma_q_6_q <= $unsigned(u2_as_mult_q_ma0_cma_q);
        end
    end

    // u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1(BITSELECT,389)@6
    assign u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b = $unsigned(d_u2_as_mult_q_ma0_cma_q_6_q[35:35]);

    // u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0(BITSELECT,388)@6
    assign u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b = $unsigned(d_u2_as_mult_q_ma0_cma_q_6_q[35:20]);

    // u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,393)@6
    assign u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q = {u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b};

    // u2_as_mult_q_sums_result_add_0_0_p2_of_3(ADD,229)@6 + 1
    assign u2_as_mult_q_sums_result_add_0_0_p2_of_3_cin = u2_as_mult_q_sums_result_add_0_0_p1_of_3_c;
    assign u2_as_mult_q_sums_result_add_0_0_p2_of_3_a = { {1'b0, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign u2_as_mult_q_sums_result_add_0_0_p2_of_3_b = { {1'b0, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b}, u2_as_mult_q_sums_result_add_0_0_p2_of_3_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_as_mult_q_sums_result_add_0_0_p2_of_3_o <= 22'b0;
        end
        else
        begin
            u2_as_mult_q_sums_result_add_0_0_p2_of_3_o <= $unsigned(u2_as_mult_q_sums_result_add_0_0_p2_of_3_a) + $unsigned(u2_as_mult_q_sums_result_add_0_0_p2_of_3_b);
        end
    end
    assign u2_as_mult_q_sums_result_add_0_0_p2_of_3_c[0] = u2_as_mult_q_sums_result_add_0_0_p2_of_3_o[21];
    assign u2_as_mult_q_sums_result_add_0_0_p2_of_3_q = u2_as_mult_q_sums_result_add_0_0_p2_of_3_o[20:1];

    // d_u2_as_mult_q_sums_align_1_q_7(DELAY,485)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_as_mult_q_sums_align_1_q_7_q <= '0;
        end
        else
        begin
            d_u2_as_mult_q_sums_align_1_q_7_q <= $unsigned(d_u2_as_mult_q_sums_align_1_q_6_q);
        end
    end

    // u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1(BITSELECT,410)@7
    assign u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b = $unsigned(d_u2_as_mult_q_sums_align_1_q_7_q[48:48]);

    // u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0(BITSELECT,409)@7
    assign u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b = $unsigned(d_u2_as_mult_q_sums_align_1_q_7_q[48:40]);

    // u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d(BITJOIN,411)@7
    assign u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q = {u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b};

    // d_u2_as_mult_q_ma0_cma_q_7(DELAY,501)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_as_mult_q_ma0_cma_q_7_q <= '0;
        end
        else
        begin
            d_u2_as_mult_q_ma0_cma_q_7_q <= $unsigned(d_u2_as_mult_q_ma0_cma_q_6_q);
        end
    end

    // u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0(BITSELECT,394)@7
    assign u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b = $unsigned(d_u2_as_mult_q_ma0_cma_q_7_q[35:35]);

    // u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d(BITJOIN,404)@7
    assign u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q = {u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b};

    // u2_as_mult_q_sums_result_add_0_0_p3_of_3(ADD,230)@7 + 1
    assign u2_as_mult_q_sums_result_add_0_0_p3_of_3_cin = u2_as_mult_q_sums_result_add_0_0_p2_of_3_c;
    assign u2_as_mult_q_sums_result_add_0_0_p3_of_3_a = $unsigned({ {{1{u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q[9]}}, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q}, 1'b1 });
    assign u2_as_mult_q_sums_result_add_0_0_p3_of_3_b = $unsigned({ {{1{u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q[9]}}, u2_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q}, u2_as_mult_q_sums_result_add_0_0_p3_of_3_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_as_mult_q_sums_result_add_0_0_p3_of_3_o <= 12'b0;
        end
        else
        begin
            u2_as_mult_q_sums_result_add_0_0_p3_of_3_o <= $unsigned($signed(u2_as_mult_q_sums_result_add_0_0_p3_of_3_a) + $signed(u2_as_mult_q_sums_result_add_0_0_p3_of_3_b));
        end
    end
    assign u2_as_mult_q_sums_result_add_0_0_p3_of_3_q = u2_as_mult_q_sums_result_add_0_0_p3_of_3_o[10:1];

    // d_u2_as_mult_q_sums_result_add_0_0_p2_of_3_q_8(DELAY,517)@7 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q <= '0;
        end
        else
        begin
            d_u2_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q <= $unsigned(u2_as_mult_q_sums_result_add_0_0_p2_of_3_q);
        end
    end

    // d_u2_as_mult_q_sums_result_add_0_0_p1_of_3_q_8(DELAY,516)@6 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= '0;
        end
        else
        begin
            d_u2_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= $unsigned(u2_as_mult_q_sums_result_add_0_0_p1_of_3_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u2_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_q <= d_u2_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0;
        end
    end

    // u2_as_mult_q_sums_result_add_0_0_BitJoin_for_q(BITJOIN,231)@8
    assign u2_as_mult_q_sums_result_add_0_0_BitJoin_for_q_q = {u2_as_mult_q_sums_result_add_0_0_p3_of_3_q, d_u2_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q, d_u2_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_q};

    // u1_as_mult_i_bs4_bit_select_merged(BITSELECT,469)@0
    assign u1_as_mult_i_bs4_bit_select_merged_b = $unsigned(qIn_1[17:0]);
    assign u1_as_mult_i_bs4_bit_select_merged_c = $unsigned(qIn_1[31:18]);

    // u1_as_mult_i_bs1_bit_select_merged(BITSELECT,465)@0
    assign u1_as_mult_i_bs1_bit_select_merged_b = $unsigned(iIn_1[17:0]);
    assign u1_as_mult_i_bs1_bit_select_merged_c = $unsigned(iIn_1[31:18]);

    // u1_as_mult_q_ma7_cma(CHAINMULTADD,151)@0 + 5
    assign u1_as_mult_q_ma7_cma_reset = areset;
    assign u1_as_mult_q_ma7_cma_ena0 = 1'b1;
    assign u1_as_mult_q_ma7_cma_ena1 = u1_as_mult_q_ma7_cma_ena0;
    assign u1_as_mult_q_ma7_cma_ena2 = u1_as_mult_q_ma7_cma_ena0;

    assign u1_as_mult_q_ma7_cma_a0 = $unsigned(u1_as_mult_i_bs1_bit_select_merged_c);
    assign u1_as_mult_q_ma7_cma_c0 = $unsigned(sIn_1);
    assign u1_as_mult_q_ma7_cma_a1 = $unsigned(u1_as_mult_i_bs4_bit_select_merged_c);
    assign u1_as_mult_q_ma7_cma_c1 = $unsigned(cIn_1);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(14),
        .by_clken("0"),
        .by_width(14),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(31)
    ) u1_as_mult_q_ma7_cma_DSP0 (
        .clk(clk),
        .ena({ u1_as_mult_q_ma7_cma_ena2, u1_as_mult_q_ma7_cma_ena1, u1_as_mult_q_ma7_cma_ena0 }),
        .clr({ u1_as_mult_q_ma7_cma_reset, u1_as_mult_q_ma7_cma_reset }),
        .ay(u1_as_mult_q_ma7_cma_a1),
        .by(u1_as_mult_q_ma7_cma_a0),
        .ax(u1_as_mult_q_ma7_cma_c1),
        .bx(u1_as_mult_q_ma7_cma_c0),
        .resulta(u1_as_mult_q_ma7_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(31), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u1_as_mult_q_ma7_cma_delay0 ( .xin(u1_as_mult_q_ma7_cma_s0), .xout(u1_as_mult_q_ma7_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u1_as_mult_q_ma7_cma_q = $unsigned(u1_as_mult_q_ma7_cma_qq0[30:0]);

    // u1_as_mult_q_sums_align_1(BITSHIFT,77)@5
    assign u1_as_mult_q_sums_align_1_qint = { u1_as_mult_q_ma7_cma_q, 18'b000000000000000000 };
    assign u1_as_mult_q_sums_align_1_q = u1_as_mult_q_sums_align_1_qint[48:0];

    // u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0(BITSELECT,353)@5
    assign u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b = $unsigned(u1_as_mult_q_sums_align_1_q[19:0]);

    // u1_as_mult_i_bjA5(BITJOIN,53)@0
    assign u1_as_mult_i_bjA5_q = {GND_q, u1_as_mult_i_bs4_bit_select_merged_b};

    // u1_as_mult_i_bjA2(BITJOIN,50)@0
    assign u1_as_mult_i_bjA2_q = {GND_q, u1_as_mult_i_bs1_bit_select_merged_b};

    // u1_as_mult_q_ma0_cma(CHAINMULTADD,150)@0 + 5
    assign u1_as_mult_q_ma0_cma_reset = areset;
    assign u1_as_mult_q_ma0_cma_ena0 = 1'b1;
    assign u1_as_mult_q_ma0_cma_ena1 = u1_as_mult_q_ma0_cma_ena0;
    assign u1_as_mult_q_ma0_cma_ena2 = u1_as_mult_q_ma0_cma_ena0;

    assign u1_as_mult_q_ma0_cma_a0 = $unsigned(sIn_1);
    assign u1_as_mult_q_ma0_cma_c0 = $unsigned(u1_as_mult_i_bjA2_q);
    assign u1_as_mult_q_ma0_cma_a1 = $unsigned(cIn_1);
    assign u1_as_mult_q_ma0_cma_c1 = $unsigned(u1_as_mult_i_bjA5_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(19),
        .by_clken("0"),
        .by_width(19),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(36)
    ) u1_as_mult_q_ma0_cma_DSP0 (
        .clk(clk),
        .ena({ u1_as_mult_q_ma0_cma_ena2, u1_as_mult_q_ma0_cma_ena1, u1_as_mult_q_ma0_cma_ena0 }),
        .clr({ u1_as_mult_q_ma0_cma_reset, u1_as_mult_q_ma0_cma_reset }),
        .ay(u1_as_mult_q_ma0_cma_c1),
        .by(u1_as_mult_q_ma0_cma_c0),
        .ax(u1_as_mult_q_ma0_cma_a1),
        .bx(u1_as_mult_q_ma0_cma_a0),
        .resulta(u1_as_mult_q_ma0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(36), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u1_as_mult_q_ma0_cma_delay0 ( .xin(u1_as_mult_q_ma0_cma_s0), .xout(u1_as_mult_q_ma0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u1_as_mult_q_ma0_cma_q = $unsigned(u1_as_mult_q_ma0_cma_qq0[35:0]);

    // u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0(BITSELECT,334)@5
    assign u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b = $unsigned(u1_as_mult_q_ma0_cma_q[19:0]);

    // u1_as_mult_q_sums_result_add_0_0_p1_of_3(ADD,204)@5 + 1
    assign u1_as_mult_q_sums_result_add_0_0_p1_of_3_a = {1'b0, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b};
    assign u1_as_mult_q_sums_result_add_0_0_p1_of_3_b = {1'b0, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_as_mult_q_sums_result_add_0_0_p1_of_3_o <= 21'b0;
        end
        else
        begin
            u1_as_mult_q_sums_result_add_0_0_p1_of_3_o <= $unsigned(u1_as_mult_q_sums_result_add_0_0_p1_of_3_a) + $unsigned(u1_as_mult_q_sums_result_add_0_0_p1_of_3_b);
        end
    end
    assign u1_as_mult_q_sums_result_add_0_0_p1_of_3_c[0] = u1_as_mult_q_sums_result_add_0_0_p1_of_3_o[20];
    assign u1_as_mult_q_sums_result_add_0_0_p1_of_3_q = u1_as_mult_q_sums_result_add_0_0_p1_of_3_o[19:0];

    // d_u1_as_mult_q_sums_align_1_q_6(DELAY,480)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_as_mult_q_sums_align_1_q_6_q <= '0;
        end
        else
        begin
            d_u1_as_mult_q_sums_align_1_q_6_q <= $unsigned(u1_as_mult_q_sums_align_1_q);
        end
    end

    // u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0(BITSELECT,355)@6
    assign u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b = $unsigned(d_u1_as_mult_q_sums_align_1_q_6_q[39:20]);

    // d_u1_as_mult_q_ma0_cma_q_6(DELAY,496)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_as_mult_q_ma0_cma_q_6_q <= '0;
        end
        else
        begin
            d_u1_as_mult_q_ma0_cma_q_6_q <= $unsigned(u1_as_mult_q_ma0_cma_q);
        end
    end

    // u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1(BITSELECT,337)@6
    assign u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b = $unsigned(d_u1_as_mult_q_ma0_cma_q_6_q[35:35]);

    // u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0(BITSELECT,336)@6
    assign u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b = $unsigned(d_u1_as_mult_q_ma0_cma_q_6_q[35:20]);

    // u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,341)@6
    assign u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q = {u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b};

    // u1_as_mult_q_sums_result_add_0_0_p2_of_3(ADD,205)@6 + 1
    assign u1_as_mult_q_sums_result_add_0_0_p2_of_3_cin = u1_as_mult_q_sums_result_add_0_0_p1_of_3_c;
    assign u1_as_mult_q_sums_result_add_0_0_p2_of_3_a = { {1'b0, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign u1_as_mult_q_sums_result_add_0_0_p2_of_3_b = { {1'b0, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b}, u1_as_mult_q_sums_result_add_0_0_p2_of_3_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_as_mult_q_sums_result_add_0_0_p2_of_3_o <= 22'b0;
        end
        else
        begin
            u1_as_mult_q_sums_result_add_0_0_p2_of_3_o <= $unsigned(u1_as_mult_q_sums_result_add_0_0_p2_of_3_a) + $unsigned(u1_as_mult_q_sums_result_add_0_0_p2_of_3_b);
        end
    end
    assign u1_as_mult_q_sums_result_add_0_0_p2_of_3_c[0] = u1_as_mult_q_sums_result_add_0_0_p2_of_3_o[21];
    assign u1_as_mult_q_sums_result_add_0_0_p2_of_3_q = u1_as_mult_q_sums_result_add_0_0_p2_of_3_o[20:1];

    // d_u1_as_mult_q_sums_align_1_q_7(DELAY,481)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_as_mult_q_sums_align_1_q_7_q <= '0;
        end
        else
        begin
            d_u1_as_mult_q_sums_align_1_q_7_q <= $unsigned(d_u1_as_mult_q_sums_align_1_q_6_q);
        end
    end

    // u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1(BITSELECT,358)@7
    assign u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b = $unsigned(d_u1_as_mult_q_sums_align_1_q_7_q[48:48]);

    // u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0(BITSELECT,357)@7
    assign u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b = $unsigned(d_u1_as_mult_q_sums_align_1_q_7_q[48:40]);

    // u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d(BITJOIN,359)@7
    assign u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q = {u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b};

    // d_u1_as_mult_q_ma0_cma_q_7(DELAY,497)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_as_mult_q_ma0_cma_q_7_q <= '0;
        end
        else
        begin
            d_u1_as_mult_q_ma0_cma_q_7_q <= $unsigned(d_u1_as_mult_q_ma0_cma_q_6_q);
        end
    end

    // u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0(BITSELECT,342)@7
    assign u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b = $unsigned(d_u1_as_mult_q_ma0_cma_q_7_q[35:35]);

    // u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d(BITJOIN,352)@7
    assign u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q = {u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b};

    // u1_as_mult_q_sums_result_add_0_0_p3_of_3(ADD,206)@7 + 1
    assign u1_as_mult_q_sums_result_add_0_0_p3_of_3_cin = u1_as_mult_q_sums_result_add_0_0_p2_of_3_c;
    assign u1_as_mult_q_sums_result_add_0_0_p3_of_3_a = $unsigned({ {{1{u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q[9]}}, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q}, 1'b1 });
    assign u1_as_mult_q_sums_result_add_0_0_p3_of_3_b = $unsigned({ {{1{u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q[9]}}, u1_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q}, u1_as_mult_q_sums_result_add_0_0_p3_of_3_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_as_mult_q_sums_result_add_0_0_p3_of_3_o <= 12'b0;
        end
        else
        begin
            u1_as_mult_q_sums_result_add_0_0_p3_of_3_o <= $unsigned($signed(u1_as_mult_q_sums_result_add_0_0_p3_of_3_a) + $signed(u1_as_mult_q_sums_result_add_0_0_p3_of_3_b));
        end
    end
    assign u1_as_mult_q_sums_result_add_0_0_p3_of_3_q = u1_as_mult_q_sums_result_add_0_0_p3_of_3_o[10:1];

    // d_u1_as_mult_q_sums_result_add_0_0_p2_of_3_q_8(DELAY,513)@7 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q <= '0;
        end
        else
        begin
            d_u1_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q <= $unsigned(u1_as_mult_q_sums_result_add_0_0_p2_of_3_q);
        end
    end

    // d_u1_as_mult_q_sums_result_add_0_0_p1_of_3_q_8(DELAY,512)@6 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= '0;
        end
        else
        begin
            d_u1_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= $unsigned(u1_as_mult_q_sums_result_add_0_0_p1_of_3_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u1_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_q <= d_u1_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0;
        end
    end

    // u1_as_mult_q_sums_result_add_0_0_BitJoin_for_q(BITJOIN,207)@8
    assign u1_as_mult_q_sums_result_add_0_0_BitJoin_for_q_q = {u1_as_mult_q_sums_result_add_0_0_p3_of_3_q, d_u1_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q, d_u1_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_q};

    // u0_as_mult_i_bs4_bit_select_merged(BITSELECT,468)@0
    assign u0_as_mult_i_bs4_bit_select_merged_b = $unsigned(qIn_0[17:0]);
    assign u0_as_mult_i_bs4_bit_select_merged_c = $unsigned(qIn_0[31:18]);

    // u0_as_mult_i_bs1_bit_select_merged(BITSELECT,464)@0
    assign u0_as_mult_i_bs1_bit_select_merged_b = $unsigned(iIn_0[17:0]);
    assign u0_as_mult_i_bs1_bit_select_merged_c = $unsigned(iIn_0[31:18]);

    // u0_as_mult_q_ma7_cma(CHAINMULTADD,147)@0 + 5
    assign u0_as_mult_q_ma7_cma_reset = areset;
    assign u0_as_mult_q_ma7_cma_ena0 = 1'b1;
    assign u0_as_mult_q_ma7_cma_ena1 = u0_as_mult_q_ma7_cma_ena0;
    assign u0_as_mult_q_ma7_cma_ena2 = u0_as_mult_q_ma7_cma_ena0;

    assign u0_as_mult_q_ma7_cma_a0 = $unsigned(u0_as_mult_i_bs1_bit_select_merged_c);
    assign u0_as_mult_q_ma7_cma_c0 = $unsigned(sIn_0);
    assign u0_as_mult_q_ma7_cma_a1 = $unsigned(u0_as_mult_i_bs4_bit_select_merged_c);
    assign u0_as_mult_q_ma7_cma_c1 = $unsigned(cIn_0);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(14),
        .by_clken("0"),
        .by_width(14),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(31)
    ) u0_as_mult_q_ma7_cma_DSP0 (
        .clk(clk),
        .ena({ u0_as_mult_q_ma7_cma_ena2, u0_as_mult_q_ma7_cma_ena1, u0_as_mult_q_ma7_cma_ena0 }),
        .clr({ u0_as_mult_q_ma7_cma_reset, u0_as_mult_q_ma7_cma_reset }),
        .ay(u0_as_mult_q_ma7_cma_a1),
        .by(u0_as_mult_q_ma7_cma_a0),
        .ax(u0_as_mult_q_ma7_cma_c1),
        .bx(u0_as_mult_q_ma7_cma_c0),
        .resulta(u0_as_mult_q_ma7_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(31), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_as_mult_q_ma7_cma_delay0 ( .xin(u0_as_mult_q_ma7_cma_s0), .xout(u0_as_mult_q_ma7_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_as_mult_q_ma7_cma_q = $unsigned(u0_as_mult_q_ma7_cma_qq0[30:0]);

    // u0_as_mult_q_sums_align_1(BITSHIFT,45)@5
    assign u0_as_mult_q_sums_align_1_qint = { u0_as_mult_q_ma7_cma_q, 18'b000000000000000000 };
    assign u0_as_mult_q_sums_align_1_q = u0_as_mult_q_sums_align_1_qint[48:0];

    // u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0(BITSELECT,301)@5
    assign u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b = $unsigned(u0_as_mult_q_sums_align_1_q[19:0]);

    // u0_as_mult_i_bjA5(BITJOIN,21)@0
    assign u0_as_mult_i_bjA5_q = {GND_q, u0_as_mult_i_bs4_bit_select_merged_b};

    // u0_as_mult_i_bjA2(BITJOIN,18)@0
    assign u0_as_mult_i_bjA2_q = {GND_q, u0_as_mult_i_bs1_bit_select_merged_b};

    // u0_as_mult_q_ma0_cma(CHAINMULTADD,146)@0 + 5
    assign u0_as_mult_q_ma0_cma_reset = areset;
    assign u0_as_mult_q_ma0_cma_ena0 = 1'b1;
    assign u0_as_mult_q_ma0_cma_ena1 = u0_as_mult_q_ma0_cma_ena0;
    assign u0_as_mult_q_ma0_cma_ena2 = u0_as_mult_q_ma0_cma_ena0;

    assign u0_as_mult_q_ma0_cma_a0 = $unsigned(sIn_0);
    assign u0_as_mult_q_ma0_cma_c0 = $unsigned(u0_as_mult_i_bjA2_q);
    assign u0_as_mult_q_ma0_cma_a1 = $unsigned(cIn_0);
    assign u0_as_mult_q_ma0_cma_c1 = $unsigned(u0_as_mult_i_bjA5_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(19),
        .by_clken("0"),
        .by_width(19),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(36)
    ) u0_as_mult_q_ma0_cma_DSP0 (
        .clk(clk),
        .ena({ u0_as_mult_q_ma0_cma_ena2, u0_as_mult_q_ma0_cma_ena1, u0_as_mult_q_ma0_cma_ena0 }),
        .clr({ u0_as_mult_q_ma0_cma_reset, u0_as_mult_q_ma0_cma_reset }),
        .ay(u0_as_mult_q_ma0_cma_c1),
        .by(u0_as_mult_q_ma0_cma_c0),
        .ax(u0_as_mult_q_ma0_cma_a1),
        .bx(u0_as_mult_q_ma0_cma_a0),
        .resulta(u0_as_mult_q_ma0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(36), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_as_mult_q_ma0_cma_delay0 ( .xin(u0_as_mult_q_ma0_cma_s0), .xout(u0_as_mult_q_ma0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_as_mult_q_ma0_cma_q = $unsigned(u0_as_mult_q_ma0_cma_qq0[35:0]);

    // u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0(BITSELECT,282)@5
    assign u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b = $unsigned(u0_as_mult_q_ma0_cma_q[19:0]);

    // u0_as_mult_q_sums_result_add_0_0_p1_of_3(ADD,180)@5 + 1
    assign u0_as_mult_q_sums_result_add_0_0_p1_of_3_a = {1'b0, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b};
    assign u0_as_mult_q_sums_result_add_0_0_p1_of_3_b = {1'b0, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_as_mult_q_sums_result_add_0_0_p1_of_3_o <= 21'b0;
        end
        else
        begin
            u0_as_mult_q_sums_result_add_0_0_p1_of_3_o <= $unsigned(u0_as_mult_q_sums_result_add_0_0_p1_of_3_a) + $unsigned(u0_as_mult_q_sums_result_add_0_0_p1_of_3_b);
        end
    end
    assign u0_as_mult_q_sums_result_add_0_0_p1_of_3_c[0] = u0_as_mult_q_sums_result_add_0_0_p1_of_3_o[20];
    assign u0_as_mult_q_sums_result_add_0_0_p1_of_3_q = u0_as_mult_q_sums_result_add_0_0_p1_of_3_o[19:0];

    // d_u0_as_mult_q_sums_align_1_q_6(DELAY,476)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_as_mult_q_sums_align_1_q_6_q <= '0;
        end
        else
        begin
            d_u0_as_mult_q_sums_align_1_q_6_q <= $unsigned(u0_as_mult_q_sums_align_1_q);
        end
    end

    // u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0(BITSELECT,303)@6
    assign u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b = $unsigned(d_u0_as_mult_q_sums_align_1_q_6_q[39:20]);

    // d_u0_as_mult_q_ma0_cma_q_6(DELAY,492)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_as_mult_q_ma0_cma_q_6_q <= '0;
        end
        else
        begin
            d_u0_as_mult_q_ma0_cma_q_6_q <= $unsigned(u0_as_mult_q_ma0_cma_q);
        end
    end

    // u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1(BITSELECT,285)@6
    assign u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b = $unsigned(d_u0_as_mult_q_ma0_cma_q_6_q[35:35]);

    // u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0(BITSELECT,284)@6
    assign u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b = $unsigned(d_u0_as_mult_q_ma0_cma_q_6_q[35:20]);

    // u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,289)@6
    assign u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q = {u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b};

    // u0_as_mult_q_sums_result_add_0_0_p2_of_3(ADD,181)@6 + 1
    assign u0_as_mult_q_sums_result_add_0_0_p2_of_3_cin = u0_as_mult_q_sums_result_add_0_0_p1_of_3_c;
    assign u0_as_mult_q_sums_result_add_0_0_p2_of_3_a = { {1'b0, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign u0_as_mult_q_sums_result_add_0_0_p2_of_3_b = { {1'b0, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b}, u0_as_mult_q_sums_result_add_0_0_p2_of_3_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_as_mult_q_sums_result_add_0_0_p2_of_3_o <= 22'b0;
        end
        else
        begin
            u0_as_mult_q_sums_result_add_0_0_p2_of_3_o <= $unsigned(u0_as_mult_q_sums_result_add_0_0_p2_of_3_a) + $unsigned(u0_as_mult_q_sums_result_add_0_0_p2_of_3_b);
        end
    end
    assign u0_as_mult_q_sums_result_add_0_0_p2_of_3_c[0] = u0_as_mult_q_sums_result_add_0_0_p2_of_3_o[21];
    assign u0_as_mult_q_sums_result_add_0_0_p2_of_3_q = u0_as_mult_q_sums_result_add_0_0_p2_of_3_o[20:1];

    // d_u0_as_mult_q_sums_align_1_q_7(DELAY,477)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_as_mult_q_sums_align_1_q_7_q <= '0;
        end
        else
        begin
            d_u0_as_mult_q_sums_align_1_q_7_q <= $unsigned(d_u0_as_mult_q_sums_align_1_q_6_q);
        end
    end

    // u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1(BITSELECT,306)@7
    assign u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b = $unsigned(d_u0_as_mult_q_sums_align_1_q_7_q[48:48]);

    // u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0(BITSELECT,305)@7
    assign u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b = $unsigned(d_u0_as_mult_q_sums_align_1_q_7_q[48:40]);

    // u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d(BITJOIN,307)@7
    assign u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q = {u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b};

    // d_u0_as_mult_q_ma0_cma_q_7(DELAY,493)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_as_mult_q_ma0_cma_q_7_q <= '0;
        end
        else
        begin
            d_u0_as_mult_q_ma0_cma_q_7_q <= $unsigned(d_u0_as_mult_q_ma0_cma_q_6_q);
        end
    end

    // u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0(BITSELECT,290)@7
    assign u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b = $unsigned(d_u0_as_mult_q_ma0_cma_q_7_q[35:35]);

    // u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d(BITJOIN,300)@7
    assign u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q = {u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b};

    // u0_as_mult_q_sums_result_add_0_0_p3_of_3(ADD,182)@7 + 1
    assign u0_as_mult_q_sums_result_add_0_0_p3_of_3_cin = u0_as_mult_q_sums_result_add_0_0_p2_of_3_c;
    assign u0_as_mult_q_sums_result_add_0_0_p3_of_3_a = $unsigned({ {{1{u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q[9]}}, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q}, 1'b1 });
    assign u0_as_mult_q_sums_result_add_0_0_p3_of_3_b = $unsigned({ {{1{u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q[9]}}, u0_as_mult_q_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q}, u0_as_mult_q_sums_result_add_0_0_p3_of_3_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_as_mult_q_sums_result_add_0_0_p3_of_3_o <= 12'b0;
        end
        else
        begin
            u0_as_mult_q_sums_result_add_0_0_p3_of_3_o <= $unsigned($signed(u0_as_mult_q_sums_result_add_0_0_p3_of_3_a) + $signed(u0_as_mult_q_sums_result_add_0_0_p3_of_3_b));
        end
    end
    assign u0_as_mult_q_sums_result_add_0_0_p3_of_3_q = u0_as_mult_q_sums_result_add_0_0_p3_of_3_o[10:1];

    // d_u0_as_mult_q_sums_result_add_0_0_p2_of_3_q_8(DELAY,509)@7 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q <= '0;
        end
        else
        begin
            d_u0_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q <= $unsigned(u0_as_mult_q_sums_result_add_0_0_p2_of_3_q);
        end
    end

    // d_u0_as_mult_q_sums_result_add_0_0_p1_of_3_q_8(DELAY,508)@6 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= '0;
        end
        else
        begin
            d_u0_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= $unsigned(u0_as_mult_q_sums_result_add_0_0_p1_of_3_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_q <= d_u0_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_delay_0;
        end
    end

    // u0_as_mult_q_sums_result_add_0_0_BitJoin_for_q(BITJOIN,183)@8
    assign u0_as_mult_q_sums_result_add_0_0_BitJoin_for_q_q = {u0_as_mult_q_sums_result_add_0_0_p3_of_3_q, d_u0_as_mult_q_sums_result_add_0_0_p2_of_3_q_8_q, d_u0_as_mult_q_sums_result_add_0_0_p1_of_3_q_8_q};

    // qOut(GPOUT,15)@8
    assign qOut_0 = u0_as_mult_q_sums_result_add_0_0_BitJoin_for_q_q[48:0];
    assign qOut_1 = u1_as_mult_q_sums_result_add_0_0_BitJoin_for_q_q[48:0];
    assign qOut_2 = u2_as_mult_q_sums_result_add_0_0_BitJoin_for_q_q[48:0];
    assign qOut_3 = u3_as_mult_q_sums_result_add_0_0_BitJoin_for_q_q[48:0];

    // u3_as_mult_i_ma7_cma(CHAINMULTADD,157)@0 + 5
    assign u3_as_mult_i_ma7_cma_reset = areset;
    assign u3_as_mult_i_ma7_cma_ena0 = 1'b1;
    assign u3_as_mult_i_ma7_cma_ena1 = u3_as_mult_i_ma7_cma_ena0;
    assign u3_as_mult_i_ma7_cma_ena2 = u3_as_mult_i_ma7_cma_ena0;

    assign u3_as_mult_i_ma7_cma_a0 = $unsigned(u3_as_mult_i_bs4_bit_select_merged_c);
    assign u3_as_mult_i_ma7_cma_c0 = $unsigned(sIn_3);
    assign u3_as_mult_i_ma7_cma_a1 = $unsigned(u3_as_mult_i_bs1_bit_select_merged_c);
    assign u3_as_mult_i_ma7_cma_c1 = $unsigned(cIn_3);
    assign u3_as_mult_i_ma7_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(14),
        .by_clken("0"),
        .by_width(14),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(31)
    ) u3_as_mult_i_ma7_cma_DSP0 (
        .clk(clk),
        .ena({ u3_as_mult_i_ma7_cma_ena2, u3_as_mult_i_ma7_cma_ena1, u3_as_mult_i_ma7_cma_ena0 }),
        .clr({ u3_as_mult_i_ma7_cma_reset, u3_as_mult_i_ma7_cma_reset }),
        .sub(u3_as_mult_i_ma7_cma_sna[0]),
        .negate(u3_as_mult_i_ma7_cma_sna[0]),
        .ay(u3_as_mult_i_ma7_cma_a1),
        .by(u3_as_mult_i_ma7_cma_a0),
        .ax(u3_as_mult_i_ma7_cma_c1),
        .bx(u3_as_mult_i_ma7_cma_c0),
        .resulta(u3_as_mult_i_ma7_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(31), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u3_as_mult_i_ma7_cma_delay0 ( .xin(u3_as_mult_i_ma7_cma_s0), .xout(u3_as_mult_i_ma7_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u3_as_mult_i_ma7_cma_q = $unsigned(u3_as_mult_i_ma7_cma_qq0[30:0]);

    // u3_as_mult_i_sums_align_1(BITSHIFT,125)@5
    assign u3_as_mult_i_sums_align_1_qint = { u3_as_mult_i_ma7_cma_q, 18'b000000000000000000 };
    assign u3_as_mult_i_sums_align_1_q = u3_as_mult_i_sums_align_1_qint[48:0];

    // u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0(BITSELECT,431)@5
    assign u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b = $unsigned(u3_as_mult_i_sums_align_1_q[19:0]);

    // u3_as_mult_i_ma0_cma(CHAINMULTADD,156)@0 + 5
    assign u3_as_mult_i_ma0_cma_reset = areset;
    assign u3_as_mult_i_ma0_cma_ena0 = 1'b1;
    assign u3_as_mult_i_ma0_cma_ena1 = u3_as_mult_i_ma0_cma_ena0;
    assign u3_as_mult_i_ma0_cma_ena2 = u3_as_mult_i_ma0_cma_ena0;

    assign u3_as_mult_i_ma0_cma_a0 = $unsigned(sIn_3);
    assign u3_as_mult_i_ma0_cma_c0 = $unsigned(u3_as_mult_i_bjA5_q);
    assign u3_as_mult_i_ma0_cma_a1 = $unsigned(cIn_3);
    assign u3_as_mult_i_ma0_cma_c1 = $unsigned(u3_as_mult_i_bjA2_q);
    assign u3_as_mult_i_ma0_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(19),
        .by_clken("0"),
        .by_width(19),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(36)
    ) u3_as_mult_i_ma0_cma_DSP0 (
        .clk(clk),
        .ena({ u3_as_mult_i_ma0_cma_ena2, u3_as_mult_i_ma0_cma_ena1, u3_as_mult_i_ma0_cma_ena0 }),
        .clr({ u3_as_mult_i_ma0_cma_reset, u3_as_mult_i_ma0_cma_reset }),
        .sub(u3_as_mult_i_ma0_cma_sna[0]),
        .negate(u3_as_mult_i_ma0_cma_sna[0]),
        .ay(u3_as_mult_i_ma0_cma_c1),
        .by(u3_as_mult_i_ma0_cma_c0),
        .ax(u3_as_mult_i_ma0_cma_a1),
        .bx(u3_as_mult_i_ma0_cma_a0),
        .resulta(u3_as_mult_i_ma0_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(36), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u3_as_mult_i_ma0_cma_delay0 ( .xin(u3_as_mult_i_ma0_cma_s0), .xout(u3_as_mult_i_ma0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u3_as_mult_i_ma0_cma_q = $unsigned(u3_as_mult_i_ma0_cma_qq0[35:0]);

    // u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0(BITSELECT,412)@5
    assign u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b = $unsigned(u3_as_mult_i_ma0_cma_q[19:0]);

    // u3_as_mult_i_sums_result_add_0_0_p1_of_3(ADD,240)@5 + 1
    assign u3_as_mult_i_sums_result_add_0_0_p1_of_3_a = {1'b0, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b};
    assign u3_as_mult_i_sums_result_add_0_0_p1_of_3_b = {1'b0, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_as_mult_i_sums_result_add_0_0_p1_of_3_o <= 21'b0;
        end
        else
        begin
            u3_as_mult_i_sums_result_add_0_0_p1_of_3_o <= $unsigned(u3_as_mult_i_sums_result_add_0_0_p1_of_3_a) + $unsigned(u3_as_mult_i_sums_result_add_0_0_p1_of_3_b);
        end
    end
    assign u3_as_mult_i_sums_result_add_0_0_p1_of_3_c[0] = u3_as_mult_i_sums_result_add_0_0_p1_of_3_o[20];
    assign u3_as_mult_i_sums_result_add_0_0_p1_of_3_q = u3_as_mult_i_sums_result_add_0_0_p1_of_3_o[19:0];

    // d_u3_as_mult_i_sums_align_1_q_6(DELAY,486)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_as_mult_i_sums_align_1_q_6_q <= '0;
        end
        else
        begin
            d_u3_as_mult_i_sums_align_1_q_6_q <= $unsigned(u3_as_mult_i_sums_align_1_q);
        end
    end

    // u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0(BITSELECT,433)@6
    assign u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b = $unsigned(d_u3_as_mult_i_sums_align_1_q_6_q[39:20]);

    // d_u3_as_mult_i_ma0_cma_q_6(DELAY,502)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_as_mult_i_ma0_cma_q_6_q <= '0;
        end
        else
        begin
            d_u3_as_mult_i_ma0_cma_q_6_q <= $unsigned(u3_as_mult_i_ma0_cma_q);
        end
    end

    // u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1(BITSELECT,415)@6
    assign u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b = $unsigned(d_u3_as_mult_i_ma0_cma_q_6_q[35:35]);

    // u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0(BITSELECT,414)@6
    assign u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b = $unsigned(d_u3_as_mult_i_ma0_cma_q_6_q[35:20]);

    // u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,419)@6
    assign u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q = {u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b};

    // u3_as_mult_i_sums_result_add_0_0_p2_of_3(ADD,241)@6 + 1
    assign u3_as_mult_i_sums_result_add_0_0_p2_of_3_cin = u3_as_mult_i_sums_result_add_0_0_p1_of_3_c;
    assign u3_as_mult_i_sums_result_add_0_0_p2_of_3_a = { {1'b0, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign u3_as_mult_i_sums_result_add_0_0_p2_of_3_b = { {1'b0, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b}, u3_as_mult_i_sums_result_add_0_0_p2_of_3_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_as_mult_i_sums_result_add_0_0_p2_of_3_o <= 22'b0;
        end
        else
        begin
            u3_as_mult_i_sums_result_add_0_0_p2_of_3_o <= $unsigned(u3_as_mult_i_sums_result_add_0_0_p2_of_3_a) + $unsigned(u3_as_mult_i_sums_result_add_0_0_p2_of_3_b);
        end
    end
    assign u3_as_mult_i_sums_result_add_0_0_p2_of_3_c[0] = u3_as_mult_i_sums_result_add_0_0_p2_of_3_o[21];
    assign u3_as_mult_i_sums_result_add_0_0_p2_of_3_q = u3_as_mult_i_sums_result_add_0_0_p2_of_3_o[20:1];

    // d_u3_as_mult_i_sums_align_1_q_7(DELAY,487)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_as_mult_i_sums_align_1_q_7_q <= '0;
        end
        else
        begin
            d_u3_as_mult_i_sums_align_1_q_7_q <= $unsigned(d_u3_as_mult_i_sums_align_1_q_6_q);
        end
    end

    // u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1(BITSELECT,436)@7
    assign u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b = $unsigned(d_u3_as_mult_i_sums_align_1_q_7_q[48:48]);

    // u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0(BITSELECT,435)@7
    assign u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b = $unsigned(d_u3_as_mult_i_sums_align_1_q_7_q[48:40]);

    // u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d(BITJOIN,437)@7
    assign u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q = {u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b};

    // d_u3_as_mult_i_ma0_cma_q_7(DELAY,503)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_as_mult_i_ma0_cma_q_7_q <= '0;
        end
        else
        begin
            d_u3_as_mult_i_ma0_cma_q_7_q <= $unsigned(d_u3_as_mult_i_ma0_cma_q_6_q);
        end
    end

    // u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0(BITSELECT,420)@7
    assign u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b = $unsigned(d_u3_as_mult_i_ma0_cma_q_7_q[35:35]);

    // u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d(BITJOIN,430)@7
    assign u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q = {u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b};

    // u3_as_mult_i_sums_result_add_0_0_p3_of_3(ADD,242)@7 + 1
    assign u3_as_mult_i_sums_result_add_0_0_p3_of_3_cin = u3_as_mult_i_sums_result_add_0_0_p2_of_3_c;
    assign u3_as_mult_i_sums_result_add_0_0_p3_of_3_a = $unsigned({ {{1{u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q[9]}}, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q}, 1'b1 });
    assign u3_as_mult_i_sums_result_add_0_0_p3_of_3_b = $unsigned({ {{1{u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q[9]}}, u3_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q}, u3_as_mult_i_sums_result_add_0_0_p3_of_3_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_as_mult_i_sums_result_add_0_0_p3_of_3_o <= 12'b0;
        end
        else
        begin
            u3_as_mult_i_sums_result_add_0_0_p3_of_3_o <= $unsigned($signed(u3_as_mult_i_sums_result_add_0_0_p3_of_3_a) + $signed(u3_as_mult_i_sums_result_add_0_0_p3_of_3_b));
        end
    end
    assign u3_as_mult_i_sums_result_add_0_0_p3_of_3_q = u3_as_mult_i_sums_result_add_0_0_p3_of_3_o[10:1];

    // d_u3_as_mult_i_sums_result_add_0_0_p2_of_3_q_8(DELAY,519)@7 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q <= '0;
        end
        else
        begin
            d_u3_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q <= $unsigned(u3_as_mult_i_sums_result_add_0_0_p2_of_3_q);
        end
    end

    // d_u3_as_mult_i_sums_result_add_0_0_p1_of_3_q_8(DELAY,518)@6 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= '0;
        end
        else
        begin
            d_u3_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= $unsigned(u3_as_mult_i_sums_result_add_0_0_p1_of_3_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u3_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_q <= d_u3_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0;
        end
    end

    // u3_as_mult_i_sums_result_add_0_0_BitJoin_for_q(BITJOIN,243)@8
    assign u3_as_mult_i_sums_result_add_0_0_BitJoin_for_q_q = {u3_as_mult_i_sums_result_add_0_0_p3_of_3_q, d_u3_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q, d_u3_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_q};

    // u2_as_mult_i_ma7_cma(CHAINMULTADD,153)@0 + 5
    assign u2_as_mult_i_ma7_cma_reset = areset;
    assign u2_as_mult_i_ma7_cma_ena0 = 1'b1;
    assign u2_as_mult_i_ma7_cma_ena1 = u2_as_mult_i_ma7_cma_ena0;
    assign u2_as_mult_i_ma7_cma_ena2 = u2_as_mult_i_ma7_cma_ena0;

    assign u2_as_mult_i_ma7_cma_a0 = $unsigned(u2_as_mult_i_bs4_bit_select_merged_c);
    assign u2_as_mult_i_ma7_cma_c0 = $unsigned(sIn_2);
    assign u2_as_mult_i_ma7_cma_a1 = $unsigned(u2_as_mult_i_bs1_bit_select_merged_c);
    assign u2_as_mult_i_ma7_cma_c1 = $unsigned(cIn_2);
    assign u2_as_mult_i_ma7_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(14),
        .by_clken("0"),
        .by_width(14),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(31)
    ) u2_as_mult_i_ma7_cma_DSP0 (
        .clk(clk),
        .ena({ u2_as_mult_i_ma7_cma_ena2, u2_as_mult_i_ma7_cma_ena1, u2_as_mult_i_ma7_cma_ena0 }),
        .clr({ u2_as_mult_i_ma7_cma_reset, u2_as_mult_i_ma7_cma_reset }),
        .sub(u2_as_mult_i_ma7_cma_sna[0]),
        .negate(u2_as_mult_i_ma7_cma_sna[0]),
        .ay(u2_as_mult_i_ma7_cma_a1),
        .by(u2_as_mult_i_ma7_cma_a0),
        .ax(u2_as_mult_i_ma7_cma_c1),
        .bx(u2_as_mult_i_ma7_cma_c0),
        .resulta(u2_as_mult_i_ma7_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(31), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u2_as_mult_i_ma7_cma_delay0 ( .xin(u2_as_mult_i_ma7_cma_s0), .xout(u2_as_mult_i_ma7_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u2_as_mult_i_ma7_cma_q = $unsigned(u2_as_mult_i_ma7_cma_qq0[30:0]);

    // u2_as_mult_i_sums_align_1(BITSHIFT,93)@5
    assign u2_as_mult_i_sums_align_1_qint = { u2_as_mult_i_ma7_cma_q, 18'b000000000000000000 };
    assign u2_as_mult_i_sums_align_1_q = u2_as_mult_i_sums_align_1_qint[48:0];

    // u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0(BITSELECT,379)@5
    assign u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b = $unsigned(u2_as_mult_i_sums_align_1_q[19:0]);

    // u2_as_mult_i_ma0_cma(CHAINMULTADD,152)@0 + 5
    assign u2_as_mult_i_ma0_cma_reset = areset;
    assign u2_as_mult_i_ma0_cma_ena0 = 1'b1;
    assign u2_as_mult_i_ma0_cma_ena1 = u2_as_mult_i_ma0_cma_ena0;
    assign u2_as_mult_i_ma0_cma_ena2 = u2_as_mult_i_ma0_cma_ena0;

    assign u2_as_mult_i_ma0_cma_a0 = $unsigned(sIn_2);
    assign u2_as_mult_i_ma0_cma_c0 = $unsigned(u2_as_mult_i_bjA5_q);
    assign u2_as_mult_i_ma0_cma_a1 = $unsigned(cIn_2);
    assign u2_as_mult_i_ma0_cma_c1 = $unsigned(u2_as_mult_i_bjA2_q);
    assign u2_as_mult_i_ma0_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(19),
        .by_clken("0"),
        .by_width(19),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(36)
    ) u2_as_mult_i_ma0_cma_DSP0 (
        .clk(clk),
        .ena({ u2_as_mult_i_ma0_cma_ena2, u2_as_mult_i_ma0_cma_ena1, u2_as_mult_i_ma0_cma_ena0 }),
        .clr({ u2_as_mult_i_ma0_cma_reset, u2_as_mult_i_ma0_cma_reset }),
        .sub(u2_as_mult_i_ma0_cma_sna[0]),
        .negate(u2_as_mult_i_ma0_cma_sna[0]),
        .ay(u2_as_mult_i_ma0_cma_c1),
        .by(u2_as_mult_i_ma0_cma_c0),
        .ax(u2_as_mult_i_ma0_cma_a1),
        .bx(u2_as_mult_i_ma0_cma_a0),
        .resulta(u2_as_mult_i_ma0_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(36), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u2_as_mult_i_ma0_cma_delay0 ( .xin(u2_as_mult_i_ma0_cma_s0), .xout(u2_as_mult_i_ma0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u2_as_mult_i_ma0_cma_q = $unsigned(u2_as_mult_i_ma0_cma_qq0[35:0]);

    // u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0(BITSELECT,360)@5
    assign u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b = $unsigned(u2_as_mult_i_ma0_cma_q[19:0]);

    // u2_as_mult_i_sums_result_add_0_0_p1_of_3(ADD,216)@5 + 1
    assign u2_as_mult_i_sums_result_add_0_0_p1_of_3_a = {1'b0, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b};
    assign u2_as_mult_i_sums_result_add_0_0_p1_of_3_b = {1'b0, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_as_mult_i_sums_result_add_0_0_p1_of_3_o <= 21'b0;
        end
        else
        begin
            u2_as_mult_i_sums_result_add_0_0_p1_of_3_o <= $unsigned(u2_as_mult_i_sums_result_add_0_0_p1_of_3_a) + $unsigned(u2_as_mult_i_sums_result_add_0_0_p1_of_3_b);
        end
    end
    assign u2_as_mult_i_sums_result_add_0_0_p1_of_3_c[0] = u2_as_mult_i_sums_result_add_0_0_p1_of_3_o[20];
    assign u2_as_mult_i_sums_result_add_0_0_p1_of_3_q = u2_as_mult_i_sums_result_add_0_0_p1_of_3_o[19:0];

    // d_u2_as_mult_i_sums_align_1_q_6(DELAY,482)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_as_mult_i_sums_align_1_q_6_q <= '0;
        end
        else
        begin
            d_u2_as_mult_i_sums_align_1_q_6_q <= $unsigned(u2_as_mult_i_sums_align_1_q);
        end
    end

    // u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0(BITSELECT,381)@6
    assign u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b = $unsigned(d_u2_as_mult_i_sums_align_1_q_6_q[39:20]);

    // d_u2_as_mult_i_ma0_cma_q_6(DELAY,498)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_as_mult_i_ma0_cma_q_6_q <= '0;
        end
        else
        begin
            d_u2_as_mult_i_ma0_cma_q_6_q <= $unsigned(u2_as_mult_i_ma0_cma_q);
        end
    end

    // u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1(BITSELECT,363)@6
    assign u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b = $unsigned(d_u2_as_mult_i_ma0_cma_q_6_q[35:35]);

    // u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0(BITSELECT,362)@6
    assign u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b = $unsigned(d_u2_as_mult_i_ma0_cma_q_6_q[35:20]);

    // u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,367)@6
    assign u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q = {u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b};

    // u2_as_mult_i_sums_result_add_0_0_p2_of_3(ADD,217)@6 + 1
    assign u2_as_mult_i_sums_result_add_0_0_p2_of_3_cin = u2_as_mult_i_sums_result_add_0_0_p1_of_3_c;
    assign u2_as_mult_i_sums_result_add_0_0_p2_of_3_a = { {1'b0, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign u2_as_mult_i_sums_result_add_0_0_p2_of_3_b = { {1'b0, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b}, u2_as_mult_i_sums_result_add_0_0_p2_of_3_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_as_mult_i_sums_result_add_0_0_p2_of_3_o <= 22'b0;
        end
        else
        begin
            u2_as_mult_i_sums_result_add_0_0_p2_of_3_o <= $unsigned(u2_as_mult_i_sums_result_add_0_0_p2_of_3_a) + $unsigned(u2_as_mult_i_sums_result_add_0_0_p2_of_3_b);
        end
    end
    assign u2_as_mult_i_sums_result_add_0_0_p2_of_3_c[0] = u2_as_mult_i_sums_result_add_0_0_p2_of_3_o[21];
    assign u2_as_mult_i_sums_result_add_0_0_p2_of_3_q = u2_as_mult_i_sums_result_add_0_0_p2_of_3_o[20:1];

    // d_u2_as_mult_i_sums_align_1_q_7(DELAY,483)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_as_mult_i_sums_align_1_q_7_q <= '0;
        end
        else
        begin
            d_u2_as_mult_i_sums_align_1_q_7_q <= $unsigned(d_u2_as_mult_i_sums_align_1_q_6_q);
        end
    end

    // u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1(BITSELECT,384)@7
    assign u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b = $unsigned(d_u2_as_mult_i_sums_align_1_q_7_q[48:48]);

    // u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0(BITSELECT,383)@7
    assign u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b = $unsigned(d_u2_as_mult_i_sums_align_1_q_7_q[48:40]);

    // u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d(BITJOIN,385)@7
    assign u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q = {u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b};

    // d_u2_as_mult_i_ma0_cma_q_7(DELAY,499)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_as_mult_i_ma0_cma_q_7_q <= '0;
        end
        else
        begin
            d_u2_as_mult_i_ma0_cma_q_7_q <= $unsigned(d_u2_as_mult_i_ma0_cma_q_6_q);
        end
    end

    // u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0(BITSELECT,368)@7
    assign u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b = $unsigned(d_u2_as_mult_i_ma0_cma_q_7_q[35:35]);

    // u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d(BITJOIN,378)@7
    assign u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q = {u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b};

    // u2_as_mult_i_sums_result_add_0_0_p3_of_3(ADD,218)@7 + 1
    assign u2_as_mult_i_sums_result_add_0_0_p3_of_3_cin = u2_as_mult_i_sums_result_add_0_0_p2_of_3_c;
    assign u2_as_mult_i_sums_result_add_0_0_p3_of_3_a = $unsigned({ {{1{u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q[9]}}, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q}, 1'b1 });
    assign u2_as_mult_i_sums_result_add_0_0_p3_of_3_b = $unsigned({ {{1{u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q[9]}}, u2_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q}, u2_as_mult_i_sums_result_add_0_0_p3_of_3_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_as_mult_i_sums_result_add_0_0_p3_of_3_o <= 12'b0;
        end
        else
        begin
            u2_as_mult_i_sums_result_add_0_0_p3_of_3_o <= $unsigned($signed(u2_as_mult_i_sums_result_add_0_0_p3_of_3_a) + $signed(u2_as_mult_i_sums_result_add_0_0_p3_of_3_b));
        end
    end
    assign u2_as_mult_i_sums_result_add_0_0_p3_of_3_q = u2_as_mult_i_sums_result_add_0_0_p3_of_3_o[10:1];

    // d_u2_as_mult_i_sums_result_add_0_0_p2_of_3_q_8(DELAY,515)@7 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q <= '0;
        end
        else
        begin
            d_u2_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q <= $unsigned(u2_as_mult_i_sums_result_add_0_0_p2_of_3_q);
        end
    end

    // d_u2_as_mult_i_sums_result_add_0_0_p1_of_3_q_8(DELAY,514)@6 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= '0;
        end
        else
        begin
            d_u2_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= $unsigned(u2_as_mult_i_sums_result_add_0_0_p1_of_3_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u2_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_q <= d_u2_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0;
        end
    end

    // u2_as_mult_i_sums_result_add_0_0_BitJoin_for_q(BITJOIN,219)@8
    assign u2_as_mult_i_sums_result_add_0_0_BitJoin_for_q_q = {u2_as_mult_i_sums_result_add_0_0_p3_of_3_q, d_u2_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q, d_u2_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_q};

    // u1_as_mult_i_ma7_cma(CHAINMULTADD,149)@0 + 5
    assign u1_as_mult_i_ma7_cma_reset = areset;
    assign u1_as_mult_i_ma7_cma_ena0 = 1'b1;
    assign u1_as_mult_i_ma7_cma_ena1 = u1_as_mult_i_ma7_cma_ena0;
    assign u1_as_mult_i_ma7_cma_ena2 = u1_as_mult_i_ma7_cma_ena0;

    assign u1_as_mult_i_ma7_cma_a0 = $unsigned(u1_as_mult_i_bs4_bit_select_merged_c);
    assign u1_as_mult_i_ma7_cma_c0 = $unsigned(sIn_1);
    assign u1_as_mult_i_ma7_cma_a1 = $unsigned(u1_as_mult_i_bs1_bit_select_merged_c);
    assign u1_as_mult_i_ma7_cma_c1 = $unsigned(cIn_1);
    assign u1_as_mult_i_ma7_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(14),
        .by_clken("0"),
        .by_width(14),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(31)
    ) u1_as_mult_i_ma7_cma_DSP0 (
        .clk(clk),
        .ena({ u1_as_mult_i_ma7_cma_ena2, u1_as_mult_i_ma7_cma_ena1, u1_as_mult_i_ma7_cma_ena0 }),
        .clr({ u1_as_mult_i_ma7_cma_reset, u1_as_mult_i_ma7_cma_reset }),
        .sub(u1_as_mult_i_ma7_cma_sna[0]),
        .negate(u1_as_mult_i_ma7_cma_sna[0]),
        .ay(u1_as_mult_i_ma7_cma_a1),
        .by(u1_as_mult_i_ma7_cma_a0),
        .ax(u1_as_mult_i_ma7_cma_c1),
        .bx(u1_as_mult_i_ma7_cma_c0),
        .resulta(u1_as_mult_i_ma7_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(31), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u1_as_mult_i_ma7_cma_delay0 ( .xin(u1_as_mult_i_ma7_cma_s0), .xout(u1_as_mult_i_ma7_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u1_as_mult_i_ma7_cma_q = $unsigned(u1_as_mult_i_ma7_cma_qq0[30:0]);

    // u1_as_mult_i_sums_align_1(BITSHIFT,61)@5
    assign u1_as_mult_i_sums_align_1_qint = { u1_as_mult_i_ma7_cma_q, 18'b000000000000000000 };
    assign u1_as_mult_i_sums_align_1_q = u1_as_mult_i_sums_align_1_qint[48:0];

    // u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0(BITSELECT,327)@5
    assign u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b = $unsigned(u1_as_mult_i_sums_align_1_q[19:0]);

    // u1_as_mult_i_ma0_cma(CHAINMULTADD,148)@0 + 5
    assign u1_as_mult_i_ma0_cma_reset = areset;
    assign u1_as_mult_i_ma0_cma_ena0 = 1'b1;
    assign u1_as_mult_i_ma0_cma_ena1 = u1_as_mult_i_ma0_cma_ena0;
    assign u1_as_mult_i_ma0_cma_ena2 = u1_as_mult_i_ma0_cma_ena0;

    assign u1_as_mult_i_ma0_cma_a0 = $unsigned(sIn_1);
    assign u1_as_mult_i_ma0_cma_c0 = $unsigned(u1_as_mult_i_bjA5_q);
    assign u1_as_mult_i_ma0_cma_a1 = $unsigned(cIn_1);
    assign u1_as_mult_i_ma0_cma_c1 = $unsigned(u1_as_mult_i_bjA2_q);
    assign u1_as_mult_i_ma0_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(19),
        .by_clken("0"),
        .by_width(19),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(36)
    ) u1_as_mult_i_ma0_cma_DSP0 (
        .clk(clk),
        .ena({ u1_as_mult_i_ma0_cma_ena2, u1_as_mult_i_ma0_cma_ena1, u1_as_mult_i_ma0_cma_ena0 }),
        .clr({ u1_as_mult_i_ma0_cma_reset, u1_as_mult_i_ma0_cma_reset }),
        .sub(u1_as_mult_i_ma0_cma_sna[0]),
        .negate(u1_as_mult_i_ma0_cma_sna[0]),
        .ay(u1_as_mult_i_ma0_cma_c1),
        .by(u1_as_mult_i_ma0_cma_c0),
        .ax(u1_as_mult_i_ma0_cma_a1),
        .bx(u1_as_mult_i_ma0_cma_a0),
        .resulta(u1_as_mult_i_ma0_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(36), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u1_as_mult_i_ma0_cma_delay0 ( .xin(u1_as_mult_i_ma0_cma_s0), .xout(u1_as_mult_i_ma0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u1_as_mult_i_ma0_cma_q = $unsigned(u1_as_mult_i_ma0_cma_qq0[35:0]);

    // u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0(BITSELECT,308)@5
    assign u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b = $unsigned(u1_as_mult_i_ma0_cma_q[19:0]);

    // u1_as_mult_i_sums_result_add_0_0_p1_of_3(ADD,192)@5 + 1
    assign u1_as_mult_i_sums_result_add_0_0_p1_of_3_a = {1'b0, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b};
    assign u1_as_mult_i_sums_result_add_0_0_p1_of_3_b = {1'b0, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_as_mult_i_sums_result_add_0_0_p1_of_3_o <= 21'b0;
        end
        else
        begin
            u1_as_mult_i_sums_result_add_0_0_p1_of_3_o <= $unsigned(u1_as_mult_i_sums_result_add_0_0_p1_of_3_a) + $unsigned(u1_as_mult_i_sums_result_add_0_0_p1_of_3_b);
        end
    end
    assign u1_as_mult_i_sums_result_add_0_0_p1_of_3_c[0] = u1_as_mult_i_sums_result_add_0_0_p1_of_3_o[20];
    assign u1_as_mult_i_sums_result_add_0_0_p1_of_3_q = u1_as_mult_i_sums_result_add_0_0_p1_of_3_o[19:0];

    // d_u1_as_mult_i_sums_align_1_q_6(DELAY,478)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_as_mult_i_sums_align_1_q_6_q <= '0;
        end
        else
        begin
            d_u1_as_mult_i_sums_align_1_q_6_q <= $unsigned(u1_as_mult_i_sums_align_1_q);
        end
    end

    // u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0(BITSELECT,329)@6
    assign u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b = $unsigned(d_u1_as_mult_i_sums_align_1_q_6_q[39:20]);

    // d_u1_as_mult_i_ma0_cma_q_6(DELAY,494)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_as_mult_i_ma0_cma_q_6_q <= '0;
        end
        else
        begin
            d_u1_as_mult_i_ma0_cma_q_6_q <= $unsigned(u1_as_mult_i_ma0_cma_q);
        end
    end

    // u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1(BITSELECT,311)@6
    assign u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b = $unsigned(d_u1_as_mult_i_ma0_cma_q_6_q[35:35]);

    // u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0(BITSELECT,310)@6
    assign u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b = $unsigned(d_u1_as_mult_i_ma0_cma_q_6_q[35:20]);

    // u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,315)@6
    assign u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q = {u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b};

    // u1_as_mult_i_sums_result_add_0_0_p2_of_3(ADD,193)@6 + 1
    assign u1_as_mult_i_sums_result_add_0_0_p2_of_3_cin = u1_as_mult_i_sums_result_add_0_0_p1_of_3_c;
    assign u1_as_mult_i_sums_result_add_0_0_p2_of_3_a = { {1'b0, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign u1_as_mult_i_sums_result_add_0_0_p2_of_3_b = { {1'b0, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b}, u1_as_mult_i_sums_result_add_0_0_p2_of_3_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_as_mult_i_sums_result_add_0_0_p2_of_3_o <= 22'b0;
        end
        else
        begin
            u1_as_mult_i_sums_result_add_0_0_p2_of_3_o <= $unsigned(u1_as_mult_i_sums_result_add_0_0_p2_of_3_a) + $unsigned(u1_as_mult_i_sums_result_add_0_0_p2_of_3_b);
        end
    end
    assign u1_as_mult_i_sums_result_add_0_0_p2_of_3_c[0] = u1_as_mult_i_sums_result_add_0_0_p2_of_3_o[21];
    assign u1_as_mult_i_sums_result_add_0_0_p2_of_3_q = u1_as_mult_i_sums_result_add_0_0_p2_of_3_o[20:1];

    // d_u1_as_mult_i_sums_align_1_q_7(DELAY,479)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_as_mult_i_sums_align_1_q_7_q <= '0;
        end
        else
        begin
            d_u1_as_mult_i_sums_align_1_q_7_q <= $unsigned(d_u1_as_mult_i_sums_align_1_q_6_q);
        end
    end

    // u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1(BITSELECT,332)@7
    assign u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b = $unsigned(d_u1_as_mult_i_sums_align_1_q_7_q[48:48]);

    // u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0(BITSELECT,331)@7
    assign u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b = $unsigned(d_u1_as_mult_i_sums_align_1_q_7_q[48:40]);

    // u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d(BITJOIN,333)@7
    assign u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q = {u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b};

    // d_u1_as_mult_i_ma0_cma_q_7(DELAY,495)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_as_mult_i_ma0_cma_q_7_q <= '0;
        end
        else
        begin
            d_u1_as_mult_i_ma0_cma_q_7_q <= $unsigned(d_u1_as_mult_i_ma0_cma_q_6_q);
        end
    end

    // u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0(BITSELECT,316)@7
    assign u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b = $unsigned(d_u1_as_mult_i_ma0_cma_q_7_q[35:35]);

    // u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d(BITJOIN,326)@7
    assign u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q = {u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b};

    // u1_as_mult_i_sums_result_add_0_0_p3_of_3(ADD,194)@7 + 1
    assign u1_as_mult_i_sums_result_add_0_0_p3_of_3_cin = u1_as_mult_i_sums_result_add_0_0_p2_of_3_c;
    assign u1_as_mult_i_sums_result_add_0_0_p3_of_3_a = $unsigned({ {{1{u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q[9]}}, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q}, 1'b1 });
    assign u1_as_mult_i_sums_result_add_0_0_p3_of_3_b = $unsigned({ {{1{u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q[9]}}, u1_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q}, u1_as_mult_i_sums_result_add_0_0_p3_of_3_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_as_mult_i_sums_result_add_0_0_p3_of_3_o <= 12'b0;
        end
        else
        begin
            u1_as_mult_i_sums_result_add_0_0_p3_of_3_o <= $unsigned($signed(u1_as_mult_i_sums_result_add_0_0_p3_of_3_a) + $signed(u1_as_mult_i_sums_result_add_0_0_p3_of_3_b));
        end
    end
    assign u1_as_mult_i_sums_result_add_0_0_p3_of_3_q = u1_as_mult_i_sums_result_add_0_0_p3_of_3_o[10:1];

    // d_u1_as_mult_i_sums_result_add_0_0_p2_of_3_q_8(DELAY,511)@7 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q <= '0;
        end
        else
        begin
            d_u1_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q <= $unsigned(u1_as_mult_i_sums_result_add_0_0_p2_of_3_q);
        end
    end

    // d_u1_as_mult_i_sums_result_add_0_0_p1_of_3_q_8(DELAY,510)@6 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= '0;
        end
        else
        begin
            d_u1_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= $unsigned(u1_as_mult_i_sums_result_add_0_0_p1_of_3_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u1_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_q <= d_u1_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0;
        end
    end

    // u1_as_mult_i_sums_result_add_0_0_BitJoin_for_q(BITJOIN,195)@8
    assign u1_as_mult_i_sums_result_add_0_0_BitJoin_for_q_q = {u1_as_mult_i_sums_result_add_0_0_p3_of_3_q, d_u1_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q, d_u1_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_q};

    // u0_as_mult_i_ma7_cma(CHAINMULTADD,145)@0 + 5
    assign u0_as_mult_i_ma7_cma_reset = areset;
    assign u0_as_mult_i_ma7_cma_ena0 = 1'b1;
    assign u0_as_mult_i_ma7_cma_ena1 = u0_as_mult_i_ma7_cma_ena0;
    assign u0_as_mult_i_ma7_cma_ena2 = u0_as_mult_i_ma7_cma_ena0;

    assign u0_as_mult_i_ma7_cma_a0 = $unsigned(u0_as_mult_i_bs4_bit_select_merged_c);
    assign u0_as_mult_i_ma7_cma_c0 = $unsigned(sIn_0);
    assign u0_as_mult_i_ma7_cma_a1 = $unsigned(u0_as_mult_i_bs1_bit_select_merged_c);
    assign u0_as_mult_i_ma7_cma_c1 = $unsigned(cIn_0);
    assign u0_as_mult_i_ma7_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(14),
        .by_clken("0"),
        .by_width(14),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(31)
    ) u0_as_mult_i_ma7_cma_DSP0 (
        .clk(clk),
        .ena({ u0_as_mult_i_ma7_cma_ena2, u0_as_mult_i_ma7_cma_ena1, u0_as_mult_i_ma7_cma_ena0 }),
        .clr({ u0_as_mult_i_ma7_cma_reset, u0_as_mult_i_ma7_cma_reset }),
        .sub(u0_as_mult_i_ma7_cma_sna[0]),
        .negate(u0_as_mult_i_ma7_cma_sna[0]),
        .ay(u0_as_mult_i_ma7_cma_a1),
        .by(u0_as_mult_i_ma7_cma_a0),
        .ax(u0_as_mult_i_ma7_cma_c1),
        .bx(u0_as_mult_i_ma7_cma_c0),
        .resulta(u0_as_mult_i_ma7_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(31), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_as_mult_i_ma7_cma_delay0 ( .xin(u0_as_mult_i_ma7_cma_s0), .xout(u0_as_mult_i_ma7_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_as_mult_i_ma7_cma_q = $unsigned(u0_as_mult_i_ma7_cma_qq0[30:0]);

    // u0_as_mult_i_sums_align_1(BITSHIFT,29)@5
    assign u0_as_mult_i_sums_align_1_qint = { u0_as_mult_i_ma7_cma_q, 18'b000000000000000000 };
    assign u0_as_mult_i_sums_align_1_q = u0_as_mult_i_sums_align_1_qint[48:0];

    // u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0(BITSELECT,275)@5
    assign u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b = $unsigned(u0_as_mult_i_sums_align_1_q[19:0]);

    // u0_as_mult_i_ma0_cma(CHAINMULTADD,144)@0 + 5
    assign u0_as_mult_i_ma0_cma_reset = areset;
    assign u0_as_mult_i_ma0_cma_ena0 = 1'b1;
    assign u0_as_mult_i_ma0_cma_ena1 = u0_as_mult_i_ma0_cma_ena0;
    assign u0_as_mult_i_ma0_cma_ena2 = u0_as_mult_i_ma0_cma_ena0;

    assign u0_as_mult_i_ma0_cma_a0 = $unsigned(sIn_0);
    assign u0_as_mult_i_ma0_cma_c0 = $unsigned(u0_as_mult_i_bjA5_q);
    assign u0_as_mult_i_ma0_cma_a1 = $unsigned(cIn_0);
    assign u0_as_mult_i_ma0_cma_c1 = $unsigned(u0_as_mult_i_bjA2_q);
    assign u0_as_mult_i_ma0_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(19),
        .by_clken("0"),
        .by_width(19),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(36)
    ) u0_as_mult_i_ma0_cma_DSP0 (
        .clk(clk),
        .ena({ u0_as_mult_i_ma0_cma_ena2, u0_as_mult_i_ma0_cma_ena1, u0_as_mult_i_ma0_cma_ena0 }),
        .clr({ u0_as_mult_i_ma0_cma_reset, u0_as_mult_i_ma0_cma_reset }),
        .sub(u0_as_mult_i_ma0_cma_sna[0]),
        .negate(u0_as_mult_i_ma0_cma_sna[0]),
        .ay(u0_as_mult_i_ma0_cma_c1),
        .by(u0_as_mult_i_ma0_cma_c0),
        .ax(u0_as_mult_i_ma0_cma_a1),
        .bx(u0_as_mult_i_ma0_cma_a0),
        .resulta(u0_as_mult_i_ma0_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(36), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_as_mult_i_ma0_cma_delay0 ( .xin(u0_as_mult_i_ma0_cma_s0), .xout(u0_as_mult_i_ma0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_as_mult_i_ma0_cma_q = $unsigned(u0_as_mult_i_ma0_cma_qq0[35:0]);

    // u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0(BITSELECT,256)@5
    assign u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b = $unsigned(u0_as_mult_i_ma0_cma_q[19:0]);

    // u0_as_mult_i_sums_result_add_0_0_p1_of_3(ADD,168)@5 + 1
    assign u0_as_mult_i_sums_result_add_0_0_p1_of_3_a = {1'b0, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel0_0_b};
    assign u0_as_mult_i_sums_result_add_0_0_p1_of_3_b = {1'b0, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel0_0_b};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_as_mult_i_sums_result_add_0_0_p1_of_3_o <= 21'b0;
        end
        else
        begin
            u0_as_mult_i_sums_result_add_0_0_p1_of_3_o <= $unsigned(u0_as_mult_i_sums_result_add_0_0_p1_of_3_a) + $unsigned(u0_as_mult_i_sums_result_add_0_0_p1_of_3_b);
        end
    end
    assign u0_as_mult_i_sums_result_add_0_0_p1_of_3_c[0] = u0_as_mult_i_sums_result_add_0_0_p1_of_3_o[20];
    assign u0_as_mult_i_sums_result_add_0_0_p1_of_3_q = u0_as_mult_i_sums_result_add_0_0_p1_of_3_o[19:0];

    // d_u0_as_mult_i_sums_align_1_q_6(DELAY,474)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_as_mult_i_sums_align_1_q_6_q <= '0;
        end
        else
        begin
            d_u0_as_mult_i_sums_align_1_q_6_q <= $unsigned(u0_as_mult_i_sums_align_1_q);
        end
    end

    // u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0(BITSELECT,277)@6
    assign u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b = $unsigned(d_u0_as_mult_i_sums_align_1_q_6_q[39:20]);

    // d_u0_as_mult_i_ma0_cma_q_6(DELAY,490)@5 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_as_mult_i_ma0_cma_q_6_q <= '0;
        end
        else
        begin
            d_u0_as_mult_i_ma0_cma_q_6_q <= $unsigned(u0_as_mult_i_ma0_cma_q);
        end
    end

    // u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1(BITSELECT,259)@6
    assign u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b = $unsigned(d_u0_as_mult_i_ma0_cma_q_6_q[35:35]);

    // u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0(BITSELECT,258)@6
    assign u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b = $unsigned(d_u0_as_mult_i_ma0_cma_q_6_q[35:20]);

    // u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,263)@6
    assign u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q = {u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_1_b, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel1_0_b};

    // u0_as_mult_i_sums_result_add_0_0_p2_of_3(ADD,169)@6 + 1
    assign u0_as_mult_i_sums_result_add_0_0_p2_of_3_cin = u0_as_mult_i_sums_result_add_0_0_p1_of_3_c;
    assign u0_as_mult_i_sums_result_add_0_0_p2_of_3_a = { {1'b0, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign u0_as_mult_i_sums_result_add_0_0_p2_of_3_b = { {1'b0, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel1_0_b}, u0_as_mult_i_sums_result_add_0_0_p2_of_3_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_as_mult_i_sums_result_add_0_0_p2_of_3_o <= 22'b0;
        end
        else
        begin
            u0_as_mult_i_sums_result_add_0_0_p2_of_3_o <= $unsigned(u0_as_mult_i_sums_result_add_0_0_p2_of_3_a) + $unsigned(u0_as_mult_i_sums_result_add_0_0_p2_of_3_b);
        end
    end
    assign u0_as_mult_i_sums_result_add_0_0_p2_of_3_c[0] = u0_as_mult_i_sums_result_add_0_0_p2_of_3_o[21];
    assign u0_as_mult_i_sums_result_add_0_0_p2_of_3_q = u0_as_mult_i_sums_result_add_0_0_p2_of_3_o[20:1];

    // d_u0_as_mult_i_sums_align_1_q_7(DELAY,475)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_as_mult_i_sums_align_1_q_7_q <= '0;
        end
        else
        begin
            d_u0_as_mult_i_sums_align_1_q_7_q <= $unsigned(d_u0_as_mult_i_sums_align_1_q_6_q);
        end
    end

    // u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1(BITSELECT,280)@7
    assign u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b = $unsigned(d_u0_as_mult_i_sums_align_1_q_7_q[48:48]);

    // u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0(BITSELECT,279)@7
    assign u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b = $unsigned(d_u0_as_mult_i_sums_align_1_q_7_q[48:40]);

    // u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d(BITJOIN,281)@7
    assign u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q = {u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_1_b, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_tessel2_0_b};

    // d_u0_as_mult_i_ma0_cma_q_7(DELAY,491)@6 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_as_mult_i_ma0_cma_q_7_q <= '0;
        end
        else
        begin
            d_u0_as_mult_i_ma0_cma_q_7_q <= $unsigned(d_u0_as_mult_i_ma0_cma_q_6_q);
        end
    end

    // u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0(BITSELECT,264)@7
    assign u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b = $unsigned(d_u0_as_mult_i_ma0_cma_q_7_q[35:35]);

    // u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d(BITJOIN,274)@7
    assign u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q = {u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_tessel2_0_b};

    // u0_as_mult_i_sums_result_add_0_0_p3_of_3(ADD,170)@7 + 1
    assign u0_as_mult_i_sums_result_add_0_0_p3_of_3_cin = u0_as_mult_i_sums_result_add_0_0_p2_of_3_c;
    assign u0_as_mult_i_sums_result_add_0_0_p3_of_3_a = $unsigned({ {{1{u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q[9]}}, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_d_q}, 1'b1 });
    assign u0_as_mult_i_sums_result_add_0_0_p3_of_3_b = $unsigned({ {{1{u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q[9]}}, u0_as_mult_i_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_d_q}, u0_as_mult_i_sums_result_add_0_0_p3_of_3_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_as_mult_i_sums_result_add_0_0_p3_of_3_o <= 12'b0;
        end
        else
        begin
            u0_as_mult_i_sums_result_add_0_0_p3_of_3_o <= $unsigned($signed(u0_as_mult_i_sums_result_add_0_0_p3_of_3_a) + $signed(u0_as_mult_i_sums_result_add_0_0_p3_of_3_b));
        end
    end
    assign u0_as_mult_i_sums_result_add_0_0_p3_of_3_q = u0_as_mult_i_sums_result_add_0_0_p3_of_3_o[10:1];

    // d_u0_as_mult_i_sums_result_add_0_0_p2_of_3_q_8(DELAY,507)@7 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q <= '0;
        end
        else
        begin
            d_u0_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q <= $unsigned(u0_as_mult_i_sums_result_add_0_0_p2_of_3_q);
        end
    end

    // d_u0_as_mult_i_sums_result_add_0_0_p1_of_3_q_8(DELAY,506)@6 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= '0;
        end
        else
        begin
            d_u0_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0 <= $unsigned(u0_as_mult_i_sums_result_add_0_0_p1_of_3_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_q <= d_u0_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_delay_0;
        end
    end

    // u0_as_mult_i_sums_result_add_0_0_BitJoin_for_q(BITJOIN,171)@8
    assign u0_as_mult_i_sums_result_add_0_0_BitJoin_for_q_q = {u0_as_mult_i_sums_result_add_0_0_p3_of_3_q, d_u0_as_mult_i_sums_result_add_0_0_p2_of_3_q_8_q, d_u0_as_mult_i_sums_result_add_0_0_p1_of_3_q_8_q};

    // d_iIn_In_c_8_notEnable(LOGICAL,528)@0
    assign d_iIn_In_c_8_notEnable_q = $unsigned(~ (VCC_q));

    // d_iIn_In_c_8_nor(LOGICAL,529)@0
    assign d_iIn_In_c_8_nor_q = ~ (d_iIn_In_c_8_notEnable_q | d_iIn_In_c_8_sticky_ena_q);

    // d_iIn_In_c_8_mem_last(CONSTANT,525)
    assign d_iIn_In_c_8_mem_last_q = $unsigned(4'b0101);

    // d_iIn_In_c_8_cmp(LOGICAL,526)@0
    assign d_iIn_In_c_8_cmp_b = {1'b0, d_iIn_In_c_8_rdcnt_q};
    assign d_iIn_In_c_8_cmp_q = $unsigned(d_iIn_In_c_8_mem_last_q == d_iIn_In_c_8_cmp_b ? 1'b1 : 1'b0);

    // d_iIn_In_c_8_cmpReg(REG,527)@0 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_iIn_In_c_8_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_iIn_In_c_8_cmpReg_q <= $unsigned(d_iIn_In_c_8_cmp_q);
        end
    end

    // d_iIn_In_c_8_sticky_ena(REG,530)@0 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_iIn_In_c_8_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_iIn_In_c_8_nor_q == 1'b1)
        begin
            d_iIn_In_c_8_sticky_ena_q <= $unsigned(d_iIn_In_c_8_cmpReg_q);
        end
    end

    // d_iIn_In_c_8_enaAnd(LOGICAL,531)@0
    assign d_iIn_In_c_8_enaAnd_q = d_iIn_In_c_8_sticky_ena_q & VCC_q;

    // d_iIn_In_c_8_rdcnt(COUNTER,523)@0 + 1
    // low=0, high=6, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_iIn_In_c_8_rdcnt_i <= 3'd0;
            d_iIn_In_c_8_rdcnt_eq <= 1'b0;
        end
        else
        begin
            if (d_iIn_In_c_8_rdcnt_i == 3'd5)
            begin
                d_iIn_In_c_8_rdcnt_eq <= 1'b1;
            end
            else
            begin
                d_iIn_In_c_8_rdcnt_eq <= 1'b0;
            end
            if (d_iIn_In_c_8_rdcnt_eq == 1'b1)
            begin
                d_iIn_In_c_8_rdcnt_i <= $unsigned(d_iIn_In_c_8_rdcnt_i) + $unsigned(3'd2);
            end
            else
            begin
                d_iIn_In_c_8_rdcnt_i <= $unsigned(d_iIn_In_c_8_rdcnt_i) + $unsigned(3'd1);
            end
        end
    end
    assign d_iIn_In_c_8_rdcnt_q = d_iIn_In_c_8_rdcnt_i[2:0];

    // d_iIn_In_c_8_wraddr(REG,524)@0 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_iIn_In_c_8_wraddr_q <= $unsigned(3'b110);
        end
        else
        begin
            d_iIn_In_c_8_wraddr_q <= $unsigned(d_iIn_In_c_8_rdcnt_q);
        end
    end

    // d_iIn_In_c_8_mem(DUALMEM,522)@0 + 2
    assign d_iIn_In_c_8_mem_ia = In_c;
    assign d_iIn_In_c_8_mem_aa = d_iIn_In_c_8_wraddr_q;
    assign d_iIn_In_c_8_mem_ab = d_iIn_In_c_8_rdcnt_q;
    assign d_iIn_In_c_8_mem_ena_OrRstB = areset | d_iIn_In_c_8_enaAnd_q[0];
    assign d_iIn_In_c_8_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(8),
        .widthad_a(3),
        .numwords_a(7),
        .width_b(8),
        .widthad_b(3),
        .numwords_b(7),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) d_iIn_In_c_8_mem_dmem (
        .clocken1(d_iIn_In_c_8_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_iIn_In_c_8_mem_reset0),
        .clock1(clk),
        .address_a(d_iIn_In_c_8_mem_aa),
        .data_a(d_iIn_In_c_8_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_iIn_In_c_8_mem_ab),
        .q_b(d_iIn_In_c_8_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .addressstall_a(),
        .addressstall_b(),
        .byteena_a(),
        .byteena_b(),
        .eccencbypass(),
        .eccencparity(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign d_iIn_In_c_8_mem_q = d_iIn_In_c_8_mem_iq[7:0];

    // d_iIn_In_v_8(DELAY,472)@0 + 8
    dspba_delay_ver #( .width(1), .depth(8), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_iIn_In_v_8 ( .xin(In_v), .xout(d_iIn_In_v_8_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // iOut(PORTOUT,14)@8 + 1
    assign Out_v = d_iIn_In_v_8_q;
    assign Out_c = d_iIn_In_c_8_mem_q;
    assign iOut_0 = u0_as_mult_i_sums_result_add_0_0_BitJoin_for_q_q[48:0];
    assign iOut_1 = u1_as_mult_i_sums_result_add_0_0_BitJoin_for_q_q[48:0];
    assign iOut_2 = u2_as_mult_i_sums_result_add_0_0_BitJoin_for_q_q[48:0];
    assign iOut_3 = u3_as_mult_i_sums_result_add_0_0_BitJoin_for_q_q[48:0];

endmodule
