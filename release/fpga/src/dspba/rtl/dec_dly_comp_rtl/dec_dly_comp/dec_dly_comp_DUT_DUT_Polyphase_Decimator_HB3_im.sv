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

// SystemVerilog created from dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_im
// SystemVerilog created on Tue Jan  7 17:06:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_im (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [15:0] xIn_0,
    input wire [15:0] xIn_1,
    input wire [15:0] xIn_2,
    input wire [15:0] xIn_3,
    input wire [15:0] xIn_4,
    input wire [15:0] xIn_5,
    input wire [15:0] xIn_6,
    input wire [15:0] xIn_7,
    output wire [0:0] xOut_v,
    output wire [7:0] xOut_c,
    output wire [38:0] xOut_0,
    output wire [38:0] xOut_1,
    output wire [38:0] xOut_2,
    output wire [38:0] xOut_3,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [0:0] d_u0_m0_wo0_compute_q_13_q;
    reg [0:0] d_u0_m0_wo0_compute_q_13_delay_0;
    reg [0:0] d_u0_m0_wo0_compute_q_13_delay_1;
    reg [0:0] d_u0_m0_wo0_compute_q_14_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr21_q;
    wire u0_m0_wo0_cma0_reset;
    wire [15:0] u0_m0_wo0_cma0_a0;
    wire [15:0] u0_m0_wo0_cma0_b0;
    wire [2:0] u0_m0_wo0_cma0_c0;
    wire [15:0] u0_m0_wo0_cma0_a1;
    wire [15:0] u0_m0_wo0_cma0_b1;
    wire [2:0] u0_m0_wo0_cma0_c1;
    wire [15:0] u0_m0_wo0_cma0_a2;
    wire [15:0] u0_m0_wo0_cma0_b2;
    wire [2:0] u0_m0_wo0_cma0_c2;
    wire [15:0] u0_m0_wo0_cma0_a3;
    wire [15:0] u0_m0_wo0_cma0_b3;
    wire [2:0] u0_m0_wo0_cma0_c3;
    wire [15:0] u0_m0_wo0_cma0_a4;
    wire [15:0] u0_m0_wo0_cma0_b4;
    wire [2:0] u0_m0_wo0_cma0_c4;
    wire [15:0] u0_m0_wo0_cma0_a5;
    wire [15:0] u0_m0_wo0_cma0_b5;
    wire [2:0] u0_m0_wo0_cma0_c5;
    wire [15:0] u0_m0_wo0_cma0_a6;
    wire [15:0] u0_m0_wo0_cma0_b6;
    wire [2:0] u0_m0_wo0_cma0_c6;
    wire [15:0] u0_m0_wo0_cma0_a7;
    wire [15:0] u0_m0_wo0_cma0_b7;
    wire [2:0] u0_m0_wo0_cma0_c7;
    wire [15:0] u0_m0_wo0_cma0_a8;
    wire [15:0] u0_m0_wo0_cma0_b8;
    wire [2:0] u0_m0_wo0_cma0_c8;
    wire [15:0] u0_m0_wo0_cma0_a9;
    wire [15:0] u0_m0_wo0_cma0_b9;
    wire [2:0] u0_m0_wo0_cma0_c9;
    wire [15:0] u0_m0_wo0_cma0_a10;
    wire [15:0] u0_m0_wo0_cma0_b10;
    wire [2:0] u0_m0_wo0_cma0_c10;
    wire [15:0] u0_m0_wo0_cma0_a11;
    wire [15:0] u0_m0_wo0_cma0_b11;
    wire [2:0] u0_m0_wo0_cma0_c11;
    wire [15:0] u0_m0_wo0_cma0_a12;
    wire [15:0] u0_m0_wo0_cma0_b12;
    wire [2:0] u0_m0_wo0_cma0_c12;
    wire [15:0] u0_m0_wo0_cma0_a13;
    wire [15:0] u0_m0_wo0_cma0_b13;
    wire [2:0] u0_m0_wo0_cma0_c13;
    wire [15:0] u0_m0_wo0_cma0_a14;
    wire [15:0] u0_m0_wo0_cma0_b14;
    wire [2:0] u0_m0_wo0_cma0_c14;
    wire [15:0] u0_m0_wo0_cma0_a15;
    wire [15:0] u0_m0_wo0_cma0_b15;
    wire [2:0] u0_m0_wo0_cma0_c15;
    wire [15:0] u0_m0_wo0_cma0_a16;
    wire [15:0] u0_m0_wo0_cma0_b16;
    wire [2:0] u0_m0_wo0_cma0_c16;
    wire [15:0] u0_m0_wo0_cma0_a17;
    wire [15:0] u0_m0_wo0_cma0_b17;
    wire [2:0] u0_m0_wo0_cma0_c17;
    wire [15:0] u0_m0_wo0_cma0_a18;
    wire [15:0] u0_m0_wo0_cma0_b18;
    wire [2:0] u0_m0_wo0_cma0_c18;
    wire [15:0] u0_m0_wo0_cma0_a19;
    wire [15:0] u0_m0_wo0_cma0_b19;
    wire [2:0] u0_m0_wo0_cma0_c19;
    wire [15:0] u0_m0_wo0_cma0_a20;
    wire [15:0] u0_m0_wo0_cma0_b20;
    wire [2:0] u0_m0_wo0_cma0_c20;
    wire [15:0] u0_m0_wo0_cma0_a21;
    wire [15:0] u0_m0_wo0_cma0_b21;
    wire [2:0] u0_m0_wo0_cma0_c21;
    wire [15:0] u0_m0_wo0_cma0_d2;
    wire [15:0] u0_m0_wo0_cma0_d4;
    wire [15:0] u0_m0_wo0_cma0_d6;
    wire [15:0] u0_m0_wo0_cma0_d8;
    wire [15:0] u0_m0_wo0_cma0_d10;
    wire [15:0] u0_m0_wo0_cma0_d12;
    wire [15:0] u0_m0_wo0_cma0_d14;
    wire [15:0] u0_m0_wo0_cma0_d16;
    wire [15:0] u0_m0_wo0_cma0_d18;
    wire [15:0] u0_m0_wo0_cma0_d20;
    wire [37:0] u0_m0_wo0_cma0_s0;
    wire [43:0] u0_m0_wo0_cma0_s2;
    wire [43:0] u0_m0_wo0_cma0_s4;
    wire [43:0] u0_m0_wo0_cma0_s6;
    wire [43:0] u0_m0_wo0_cma0_s8;
    wire [43:0] u0_m0_wo0_cma0_s10;
    wire [43:0] u0_m0_wo0_cma0_s12;
    wire [43:0] u0_m0_wo0_cma0_s14;
    wire [43:0] u0_m0_wo0_cma0_s16;
    wire [43:0] u0_m0_wo0_cma0_s18;
    wire [43:0] u0_m0_wo0_cma0_s20;
    wire [37:0] u0_m0_wo0_cma0_qq0;
    reg [37:0] u0_m0_wo0_cma0_q;
    wire u0_m0_wo0_cma0_ena0;
    wire u0_m0_wo0_cma0_ena1;
    wire u0_m0_wo0_cma0_ena2;
    (* preserve_syn_only *) reg [15:0] u0_m0_wo0_cma0_zero;
    reg [0:0] u0_m0_wo0_sys_delay_q;
    reg [0:0] u0_m0_wo0_oseq_gated_reg_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr21_q;
    wire u1_m0_wo0_cma0_reset;
    wire [15:0] u1_m0_wo0_cma0_a0;
    wire [15:0] u1_m0_wo0_cma0_b0;
    wire [2:0] u1_m0_wo0_cma0_c0;
    wire [15:0] u1_m0_wo0_cma0_a1;
    wire [15:0] u1_m0_wo0_cma0_b1;
    wire [2:0] u1_m0_wo0_cma0_c1;
    wire [15:0] u1_m0_wo0_cma0_a2;
    wire [15:0] u1_m0_wo0_cma0_b2;
    wire [2:0] u1_m0_wo0_cma0_c2;
    wire [15:0] u1_m0_wo0_cma0_a3;
    wire [15:0] u1_m0_wo0_cma0_b3;
    wire [2:0] u1_m0_wo0_cma0_c3;
    wire [15:0] u1_m0_wo0_cma0_a4;
    wire [15:0] u1_m0_wo0_cma0_b4;
    wire [2:0] u1_m0_wo0_cma0_c4;
    wire [15:0] u1_m0_wo0_cma0_a5;
    wire [15:0] u1_m0_wo0_cma0_b5;
    wire [2:0] u1_m0_wo0_cma0_c5;
    wire [15:0] u1_m0_wo0_cma0_a6;
    wire [15:0] u1_m0_wo0_cma0_b6;
    wire [2:0] u1_m0_wo0_cma0_c6;
    wire [15:0] u1_m0_wo0_cma0_a7;
    wire [15:0] u1_m0_wo0_cma0_b7;
    wire [2:0] u1_m0_wo0_cma0_c7;
    wire [15:0] u1_m0_wo0_cma0_a8;
    wire [15:0] u1_m0_wo0_cma0_b8;
    wire [2:0] u1_m0_wo0_cma0_c8;
    wire [15:0] u1_m0_wo0_cma0_a9;
    wire [15:0] u1_m0_wo0_cma0_b9;
    wire [2:0] u1_m0_wo0_cma0_c9;
    wire [15:0] u1_m0_wo0_cma0_a10;
    wire [15:0] u1_m0_wo0_cma0_b10;
    wire [2:0] u1_m0_wo0_cma0_c10;
    wire [15:0] u1_m0_wo0_cma0_a11;
    wire [15:0] u1_m0_wo0_cma0_b11;
    wire [2:0] u1_m0_wo0_cma0_c11;
    wire [15:0] u1_m0_wo0_cma0_a12;
    wire [15:0] u1_m0_wo0_cma0_b12;
    wire [2:0] u1_m0_wo0_cma0_c12;
    wire [15:0] u1_m0_wo0_cma0_a13;
    wire [15:0] u1_m0_wo0_cma0_b13;
    wire [2:0] u1_m0_wo0_cma0_c13;
    wire [15:0] u1_m0_wo0_cma0_a14;
    wire [15:0] u1_m0_wo0_cma0_b14;
    wire [2:0] u1_m0_wo0_cma0_c14;
    wire [15:0] u1_m0_wo0_cma0_a15;
    wire [15:0] u1_m0_wo0_cma0_b15;
    wire [2:0] u1_m0_wo0_cma0_c15;
    wire [15:0] u1_m0_wo0_cma0_a16;
    wire [15:0] u1_m0_wo0_cma0_b16;
    wire [2:0] u1_m0_wo0_cma0_c16;
    wire [15:0] u1_m0_wo0_cma0_a17;
    wire [15:0] u1_m0_wo0_cma0_b17;
    wire [2:0] u1_m0_wo0_cma0_c17;
    wire [15:0] u1_m0_wo0_cma0_a18;
    wire [15:0] u1_m0_wo0_cma0_b18;
    wire [2:0] u1_m0_wo0_cma0_c18;
    wire [15:0] u1_m0_wo0_cma0_a19;
    wire [15:0] u1_m0_wo0_cma0_b19;
    wire [2:0] u1_m0_wo0_cma0_c19;
    wire [15:0] u1_m0_wo0_cma0_a20;
    wire [15:0] u1_m0_wo0_cma0_b20;
    wire [2:0] u1_m0_wo0_cma0_c20;
    wire [15:0] u1_m0_wo0_cma0_a21;
    wire [15:0] u1_m0_wo0_cma0_b21;
    wire [2:0] u1_m0_wo0_cma0_c21;
    wire [15:0] u1_m0_wo0_cma0_d2;
    wire [15:0] u1_m0_wo0_cma0_d4;
    wire [15:0] u1_m0_wo0_cma0_d6;
    wire [15:0] u1_m0_wo0_cma0_d8;
    wire [15:0] u1_m0_wo0_cma0_d10;
    wire [15:0] u1_m0_wo0_cma0_d12;
    wire [15:0] u1_m0_wo0_cma0_d14;
    wire [15:0] u1_m0_wo0_cma0_d16;
    wire [15:0] u1_m0_wo0_cma0_d18;
    wire [15:0] u1_m0_wo0_cma0_d20;
    wire [37:0] u1_m0_wo0_cma0_s0;
    wire [43:0] u1_m0_wo0_cma0_s2;
    wire [43:0] u1_m0_wo0_cma0_s4;
    wire [43:0] u1_m0_wo0_cma0_s6;
    wire [43:0] u1_m0_wo0_cma0_s8;
    wire [43:0] u1_m0_wo0_cma0_s10;
    wire [43:0] u1_m0_wo0_cma0_s12;
    wire [43:0] u1_m0_wo0_cma0_s14;
    wire [43:0] u1_m0_wo0_cma0_s16;
    wire [43:0] u1_m0_wo0_cma0_s18;
    wire [43:0] u1_m0_wo0_cma0_s20;
    wire [37:0] u1_m0_wo0_cma0_qq0;
    reg [37:0] u1_m0_wo0_cma0_q;
    wire u1_m0_wo0_cma0_ena0;
    wire u1_m0_wo0_cma0_ena1;
    wire u1_m0_wo0_cma0_ena2;
    (* preserve_syn_only *) reg [15:0] u1_m0_wo0_cma0_zero;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr21_q;
    wire u2_m0_wo0_cma0_reset;
    wire [15:0] u2_m0_wo0_cma0_a0;
    wire [15:0] u2_m0_wo0_cma0_b0;
    wire [2:0] u2_m0_wo0_cma0_c0;
    wire [15:0] u2_m0_wo0_cma0_a1;
    wire [15:0] u2_m0_wo0_cma0_b1;
    wire [2:0] u2_m0_wo0_cma0_c1;
    wire [15:0] u2_m0_wo0_cma0_a2;
    wire [15:0] u2_m0_wo0_cma0_b2;
    wire [2:0] u2_m0_wo0_cma0_c2;
    wire [15:0] u2_m0_wo0_cma0_a3;
    wire [15:0] u2_m0_wo0_cma0_b3;
    wire [2:0] u2_m0_wo0_cma0_c3;
    wire [15:0] u2_m0_wo0_cma0_a4;
    wire [15:0] u2_m0_wo0_cma0_b4;
    wire [2:0] u2_m0_wo0_cma0_c4;
    wire [15:0] u2_m0_wo0_cma0_a5;
    wire [15:0] u2_m0_wo0_cma0_b5;
    wire [2:0] u2_m0_wo0_cma0_c5;
    wire [15:0] u2_m0_wo0_cma0_a6;
    wire [15:0] u2_m0_wo0_cma0_b6;
    wire [2:0] u2_m0_wo0_cma0_c6;
    wire [15:0] u2_m0_wo0_cma0_a7;
    wire [15:0] u2_m0_wo0_cma0_b7;
    wire [2:0] u2_m0_wo0_cma0_c7;
    wire [15:0] u2_m0_wo0_cma0_a8;
    wire [15:0] u2_m0_wo0_cma0_b8;
    wire [2:0] u2_m0_wo0_cma0_c8;
    wire [15:0] u2_m0_wo0_cma0_a9;
    wire [15:0] u2_m0_wo0_cma0_b9;
    wire [2:0] u2_m0_wo0_cma0_c9;
    wire [15:0] u2_m0_wo0_cma0_a10;
    wire [15:0] u2_m0_wo0_cma0_b10;
    wire [2:0] u2_m0_wo0_cma0_c10;
    wire [15:0] u2_m0_wo0_cma0_a11;
    wire [15:0] u2_m0_wo0_cma0_b11;
    wire [2:0] u2_m0_wo0_cma0_c11;
    wire [15:0] u2_m0_wo0_cma0_a12;
    wire [15:0] u2_m0_wo0_cma0_b12;
    wire [2:0] u2_m0_wo0_cma0_c12;
    wire [15:0] u2_m0_wo0_cma0_a13;
    wire [15:0] u2_m0_wo0_cma0_b13;
    wire [2:0] u2_m0_wo0_cma0_c13;
    wire [15:0] u2_m0_wo0_cma0_a14;
    wire [15:0] u2_m0_wo0_cma0_b14;
    wire [2:0] u2_m0_wo0_cma0_c14;
    wire [15:0] u2_m0_wo0_cma0_a15;
    wire [15:0] u2_m0_wo0_cma0_b15;
    wire [2:0] u2_m0_wo0_cma0_c15;
    wire [15:0] u2_m0_wo0_cma0_a16;
    wire [15:0] u2_m0_wo0_cma0_b16;
    wire [2:0] u2_m0_wo0_cma0_c16;
    wire [15:0] u2_m0_wo0_cma0_a17;
    wire [15:0] u2_m0_wo0_cma0_b17;
    wire [2:0] u2_m0_wo0_cma0_c17;
    wire [15:0] u2_m0_wo0_cma0_a18;
    wire [15:0] u2_m0_wo0_cma0_b18;
    wire [2:0] u2_m0_wo0_cma0_c18;
    wire [15:0] u2_m0_wo0_cma0_a19;
    wire [15:0] u2_m0_wo0_cma0_b19;
    wire [2:0] u2_m0_wo0_cma0_c19;
    wire [15:0] u2_m0_wo0_cma0_a20;
    wire [15:0] u2_m0_wo0_cma0_b20;
    wire [2:0] u2_m0_wo0_cma0_c20;
    wire [15:0] u2_m0_wo0_cma0_a21;
    wire [15:0] u2_m0_wo0_cma0_b21;
    wire [2:0] u2_m0_wo0_cma0_c21;
    wire [15:0] u2_m0_wo0_cma0_d2;
    wire [15:0] u2_m0_wo0_cma0_d4;
    wire [15:0] u2_m0_wo0_cma0_d6;
    wire [15:0] u2_m0_wo0_cma0_d8;
    wire [15:0] u2_m0_wo0_cma0_d10;
    wire [15:0] u2_m0_wo0_cma0_d12;
    wire [15:0] u2_m0_wo0_cma0_d14;
    wire [15:0] u2_m0_wo0_cma0_d16;
    wire [15:0] u2_m0_wo0_cma0_d18;
    wire [15:0] u2_m0_wo0_cma0_d20;
    wire [37:0] u2_m0_wo0_cma0_s0;
    wire [43:0] u2_m0_wo0_cma0_s2;
    wire [43:0] u2_m0_wo0_cma0_s4;
    wire [43:0] u2_m0_wo0_cma0_s6;
    wire [43:0] u2_m0_wo0_cma0_s8;
    wire [43:0] u2_m0_wo0_cma0_s10;
    wire [43:0] u2_m0_wo0_cma0_s12;
    wire [43:0] u2_m0_wo0_cma0_s14;
    wire [43:0] u2_m0_wo0_cma0_s16;
    wire [43:0] u2_m0_wo0_cma0_s18;
    wire [43:0] u2_m0_wo0_cma0_s20;
    wire [37:0] u2_m0_wo0_cma0_qq0;
    reg [37:0] u2_m0_wo0_cma0_q;
    wire u2_m0_wo0_cma0_ena0;
    wire u2_m0_wo0_cma0_ena1;
    wire u2_m0_wo0_cma0_ena2;
    (* preserve_syn_only *) reg [15:0] u2_m0_wo0_cma0_zero;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr21_q;
    wire u3_m0_wo0_cma0_reset;
    wire [15:0] u3_m0_wo0_cma0_a0;
    wire [15:0] u3_m0_wo0_cma0_b0;
    wire [2:0] u3_m0_wo0_cma0_c0;
    wire [15:0] u3_m0_wo0_cma0_a1;
    wire [15:0] u3_m0_wo0_cma0_b1;
    wire [2:0] u3_m0_wo0_cma0_c1;
    wire [15:0] u3_m0_wo0_cma0_a2;
    wire [15:0] u3_m0_wo0_cma0_b2;
    wire [2:0] u3_m0_wo0_cma0_c2;
    wire [15:0] u3_m0_wo0_cma0_a3;
    wire [15:0] u3_m0_wo0_cma0_b3;
    wire [2:0] u3_m0_wo0_cma0_c3;
    wire [15:0] u3_m0_wo0_cma0_a4;
    wire [15:0] u3_m0_wo0_cma0_b4;
    wire [2:0] u3_m0_wo0_cma0_c4;
    wire [15:0] u3_m0_wo0_cma0_a5;
    wire [15:0] u3_m0_wo0_cma0_b5;
    wire [2:0] u3_m0_wo0_cma0_c5;
    wire [15:0] u3_m0_wo0_cma0_a6;
    wire [15:0] u3_m0_wo0_cma0_b6;
    wire [2:0] u3_m0_wo0_cma0_c6;
    wire [15:0] u3_m0_wo0_cma0_a7;
    wire [15:0] u3_m0_wo0_cma0_b7;
    wire [2:0] u3_m0_wo0_cma0_c7;
    wire [15:0] u3_m0_wo0_cma0_a8;
    wire [15:0] u3_m0_wo0_cma0_b8;
    wire [2:0] u3_m0_wo0_cma0_c8;
    wire [15:0] u3_m0_wo0_cma0_a9;
    wire [15:0] u3_m0_wo0_cma0_b9;
    wire [2:0] u3_m0_wo0_cma0_c9;
    wire [15:0] u3_m0_wo0_cma0_a10;
    wire [15:0] u3_m0_wo0_cma0_b10;
    wire [2:0] u3_m0_wo0_cma0_c10;
    wire [15:0] u3_m0_wo0_cma0_a11;
    wire [15:0] u3_m0_wo0_cma0_b11;
    wire [2:0] u3_m0_wo0_cma0_c11;
    wire [15:0] u3_m0_wo0_cma0_a12;
    wire [15:0] u3_m0_wo0_cma0_b12;
    wire [2:0] u3_m0_wo0_cma0_c12;
    wire [15:0] u3_m0_wo0_cma0_a13;
    wire [15:0] u3_m0_wo0_cma0_b13;
    wire [2:0] u3_m0_wo0_cma0_c13;
    wire [15:0] u3_m0_wo0_cma0_a14;
    wire [15:0] u3_m0_wo0_cma0_b14;
    wire [2:0] u3_m0_wo0_cma0_c14;
    wire [15:0] u3_m0_wo0_cma0_a15;
    wire [15:0] u3_m0_wo0_cma0_b15;
    wire [2:0] u3_m0_wo0_cma0_c15;
    wire [15:0] u3_m0_wo0_cma0_a16;
    wire [15:0] u3_m0_wo0_cma0_b16;
    wire [2:0] u3_m0_wo0_cma0_c16;
    wire [15:0] u3_m0_wo0_cma0_a17;
    wire [15:0] u3_m0_wo0_cma0_b17;
    wire [2:0] u3_m0_wo0_cma0_c17;
    wire [15:0] u3_m0_wo0_cma0_a18;
    wire [15:0] u3_m0_wo0_cma0_b18;
    wire [2:0] u3_m0_wo0_cma0_c18;
    wire [15:0] u3_m0_wo0_cma0_a19;
    wire [15:0] u3_m0_wo0_cma0_b19;
    wire [2:0] u3_m0_wo0_cma0_c19;
    wire [15:0] u3_m0_wo0_cma0_a20;
    wire [15:0] u3_m0_wo0_cma0_b20;
    wire [2:0] u3_m0_wo0_cma0_c20;
    wire [15:0] u3_m0_wo0_cma0_a21;
    wire [15:0] u3_m0_wo0_cma0_b21;
    wire [2:0] u3_m0_wo0_cma0_c21;
    wire [15:0] u3_m0_wo0_cma0_d2;
    wire [15:0] u3_m0_wo0_cma0_d4;
    wire [15:0] u3_m0_wo0_cma0_d6;
    wire [15:0] u3_m0_wo0_cma0_d8;
    wire [15:0] u3_m0_wo0_cma0_d10;
    wire [15:0] u3_m0_wo0_cma0_d12;
    wire [15:0] u3_m0_wo0_cma0_d14;
    wire [15:0] u3_m0_wo0_cma0_d16;
    wire [15:0] u3_m0_wo0_cma0_d18;
    wire [15:0] u3_m0_wo0_cma0_d20;
    wire [37:0] u3_m0_wo0_cma0_s0;
    wire [43:0] u3_m0_wo0_cma0_s2;
    wire [43:0] u3_m0_wo0_cma0_s4;
    wire [43:0] u3_m0_wo0_cma0_s6;
    wire [43:0] u3_m0_wo0_cma0_s8;
    wire [43:0] u3_m0_wo0_cma0_s10;
    wire [43:0] u3_m0_wo0_cma0_s12;
    wire [43:0] u3_m0_wo0_cma0_s14;
    wire [43:0] u3_m0_wo0_cma0_s16;
    wire [43:0] u3_m0_wo0_cma0_s18;
    wire [43:0] u3_m0_wo0_cma0_s20;
    wire [37:0] u3_m0_wo0_cma0_qq0;
    reg [37:0] u3_m0_wo0_cma0_q;
    wire u3_m0_wo0_cma0_ena0;
    wire u3_m0_wo0_cma0_ena1;
    wire u3_m0_wo0_cma0_ena2;
    (* preserve_syn_only *) reg [15:0] u3_m0_wo0_cma0_zero;
    wire u0_m0_wo0_wi0_r0_delayr0_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_mem_ia;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr0_mem_aa;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr0_mem_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_mem_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_mem_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr0_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] u0_m0_wo0_wi0_r0_delayr0_rdcnt_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq;
    reg [2:0] u0_m0_wo0_wi0_r0_delayr0_wraddr_q;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q;
    wire u0_m0_wo0_wi1_r0_delayr1_mem_reset0;
    wire u0_m0_wo0_wi1_r0_delayr1_mem_ena_OrRstB;
    wire [15:0] u0_m0_wo0_wi1_r0_delayr1_mem_ia;
    wire [4:0] u0_m0_wo0_wi1_r0_delayr1_mem_aa;
    wire [4:0] u0_m0_wo0_wi1_r0_delayr1_mem_ab;
    wire [15:0] u0_m0_wo0_wi1_r0_delayr1_mem_iq;
    wire [15:0] u0_m0_wo0_wi1_r0_delayr1_mem_q;
    wire [4:0] u0_m0_wo0_wi1_r0_delayr1_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u0_m0_wo0_wi1_r0_delayr1_rdcnt_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi1_r0_delayr1_rdcnt_eq;
    reg [4:0] u0_m0_wo0_wi1_r0_delayr1_wraddr_q;
    wire [5:0] u0_m0_wo0_wi1_r0_delayr1_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi1_r0_delayr1_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi1_r0_delayr1_sticky_ena_q;
    wire u1_m0_wo0_wi0_r0_delayr0_mem_reset0;
    wire u1_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr0_mem_ia;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr0_mem_aa;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr0_mem_ab;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr0_mem_iq;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr0_mem_q;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr0_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] u1_m0_wo0_wi0_r0_delayr0_rdcnt_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq;
    reg [2:0] u1_m0_wo0_wi0_r0_delayr0_wraddr_q;
    wire [3:0] u1_m0_wo0_wi0_r0_delayr0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr0_sticky_ena_q;
    wire u1_m0_wo0_wi1_r0_delayr1_mem_reset0;
    wire u1_m0_wo0_wi1_r0_delayr1_mem_ena_OrRstB;
    wire [15:0] u1_m0_wo0_wi1_r0_delayr1_mem_ia;
    wire [4:0] u1_m0_wo0_wi1_r0_delayr1_mem_aa;
    wire [4:0] u1_m0_wo0_wi1_r0_delayr1_mem_ab;
    wire [15:0] u1_m0_wo0_wi1_r0_delayr1_mem_iq;
    wire [15:0] u1_m0_wo0_wi1_r0_delayr1_mem_q;
    wire [4:0] u1_m0_wo0_wi1_r0_delayr1_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u1_m0_wo0_wi1_r0_delayr1_rdcnt_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi1_r0_delayr1_rdcnt_eq;
    reg [4:0] u1_m0_wo0_wi1_r0_delayr1_wraddr_q;
    wire [5:0] u1_m0_wo0_wi1_r0_delayr1_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi1_r0_delayr1_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi1_r0_delayr1_sticky_ena_q;
    wire u2_m0_wo0_wi0_r0_delayr0_mem_reset0;
    wire u2_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB;
    wire [15:0] u2_m0_wo0_wi0_r0_delayr0_mem_ia;
    wire [2:0] u2_m0_wo0_wi0_r0_delayr0_mem_aa;
    wire [2:0] u2_m0_wo0_wi0_r0_delayr0_mem_ab;
    wire [15:0] u2_m0_wo0_wi0_r0_delayr0_mem_iq;
    wire [15:0] u2_m0_wo0_wi0_r0_delayr0_mem_q;
    wire [2:0] u2_m0_wo0_wi0_r0_delayr0_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] u2_m0_wo0_wi0_r0_delayr0_rdcnt_i;
    (* preserve_syn_only *) reg u2_m0_wo0_wi0_r0_delayr0_rdcnt_eq;
    reg [2:0] u2_m0_wo0_wi0_r0_delayr0_wraddr_q;
    wire [3:0] u2_m0_wo0_wi0_r0_delayr0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u2_m0_wo0_wi0_r0_delayr0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u2_m0_wo0_wi0_r0_delayr0_sticky_ena_q;
    wire u2_m0_wo0_wi1_r0_delayr1_mem_reset0;
    wire u2_m0_wo0_wi1_r0_delayr1_mem_ena_OrRstB;
    wire [15:0] u2_m0_wo0_wi1_r0_delayr1_mem_ia;
    wire [4:0] u2_m0_wo0_wi1_r0_delayr1_mem_aa;
    wire [4:0] u2_m0_wo0_wi1_r0_delayr1_mem_ab;
    wire [15:0] u2_m0_wo0_wi1_r0_delayr1_mem_iq;
    wire [15:0] u2_m0_wo0_wi1_r0_delayr1_mem_q;
    wire [4:0] u2_m0_wo0_wi1_r0_delayr1_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u2_m0_wo0_wi1_r0_delayr1_rdcnt_i;
    (* preserve_syn_only *) reg u2_m0_wo0_wi1_r0_delayr1_rdcnt_eq;
    reg [4:0] u2_m0_wo0_wi1_r0_delayr1_wraddr_q;
    wire [5:0] u2_m0_wo0_wi1_r0_delayr1_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u2_m0_wo0_wi1_r0_delayr1_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u2_m0_wo0_wi1_r0_delayr1_sticky_ena_q;
    wire u3_m0_wo0_wi0_r0_delayr0_mem_reset0;
    wire u3_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB;
    wire [15:0] u3_m0_wo0_wi0_r0_delayr0_mem_ia;
    wire [2:0] u3_m0_wo0_wi0_r0_delayr0_mem_aa;
    wire [2:0] u3_m0_wo0_wi0_r0_delayr0_mem_ab;
    wire [15:0] u3_m0_wo0_wi0_r0_delayr0_mem_iq;
    wire [15:0] u3_m0_wo0_wi0_r0_delayr0_mem_q;
    wire [2:0] u3_m0_wo0_wi0_r0_delayr0_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] u3_m0_wo0_wi0_r0_delayr0_rdcnt_i;
    (* preserve_syn_only *) reg u3_m0_wo0_wi0_r0_delayr0_rdcnt_eq;
    reg [2:0] u3_m0_wo0_wi0_r0_delayr0_wraddr_q;
    wire [3:0] u3_m0_wo0_wi0_r0_delayr0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u3_m0_wo0_wi0_r0_delayr0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u3_m0_wo0_wi0_r0_delayr0_sticky_ena_q;
    wire u3_m0_wo0_wi1_r0_delayr1_mem_reset0;
    wire u3_m0_wo0_wi1_r0_delayr1_mem_ena_OrRstB;
    wire [15:0] u3_m0_wo0_wi1_r0_delayr1_mem_ia;
    wire [4:0] u3_m0_wo0_wi1_r0_delayr1_mem_aa;
    wire [4:0] u3_m0_wo0_wi1_r0_delayr1_mem_ab;
    wire [15:0] u3_m0_wo0_wi1_r0_delayr1_mem_iq;
    wire [15:0] u3_m0_wo0_wi1_r0_delayr1_mem_q;
    wire [4:0] u3_m0_wo0_wi1_r0_delayr1_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u3_m0_wo0_wi1_r0_delayr1_rdcnt_i;
    (* preserve_syn_only *) reg u3_m0_wo0_wi1_r0_delayr1_rdcnt_eq;
    reg [4:0] u3_m0_wo0_wi1_r0_delayr1_wraddr_q;
    wire [5:0] u3_m0_wo0_wi1_r0_delayr1_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u3_m0_wo0_wi1_r0_delayr1_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u3_m0_wo0_wi1_r0_delayr1_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ia;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr0_split_0_mem_aa;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_split_0_mem_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_split_0_mem_q;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i;
    reg [4:0] u0_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
    wire [5:0] u0_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q;
    wire u1_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0;
    wire u1_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr0_split_0_mem_ia;
    wire [4:0] u1_m0_wo0_wi0_r0_delayr0_split_0_mem_aa;
    wire [4:0] u1_m0_wo0_wi0_r0_delayr0_split_0_mem_ab;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr0_split_0_mem_iq;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr0_split_0_mem_q;
    wire [4:0] u1_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u1_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i;
    reg [4:0] u1_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
    wire [5:0] u1_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q;
    wire u2_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0;
    wire u2_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB;
    wire [15:0] u2_m0_wo0_wi0_r0_delayr0_split_0_mem_ia;
    wire [4:0] u2_m0_wo0_wi0_r0_delayr0_split_0_mem_aa;
    wire [4:0] u2_m0_wo0_wi0_r0_delayr0_split_0_mem_ab;
    wire [15:0] u2_m0_wo0_wi0_r0_delayr0_split_0_mem_iq;
    wire [15:0] u2_m0_wo0_wi0_r0_delayr0_split_0_mem_q;
    wire [4:0] u2_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u2_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i;
    reg [4:0] u2_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
    wire [5:0] u2_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u2_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u2_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q;
    wire u3_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0;
    wire u3_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB;
    wire [15:0] u3_m0_wo0_wi0_r0_delayr0_split_0_mem_ia;
    wire [4:0] u3_m0_wo0_wi0_r0_delayr0_split_0_mem_aa;
    wire [4:0] u3_m0_wo0_wi0_r0_delayr0_split_0_mem_ab;
    wire [15:0] u3_m0_wo0_wi0_r0_delayr0_split_0_mem_iq;
    wire [15:0] u3_m0_wo0_wi0_r0_delayr0_split_0_mem_q;
    wire [4:0] u3_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u3_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i;
    reg [4:0] u3_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
    wire [5:0] u3_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u3_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u3_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q;
    wire [0:0] u0_m0_wo0_sys_and_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_rdmux_s;
    reg [2:0] u0_m0_wo0_wi0_r0_delayr0_rdmux_q;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr0_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi1_r0_delayr1_rdmux_s;
    reg [4:0] u0_m0_wo0_wi1_r0_delayr1_rdmux_q;
    wire [5:0] u0_m0_wo0_wi1_r0_delayr1_cmp_b;
    wire [0:0] u0_m0_wo0_wi1_r0_delayr1_cmp_q;
    wire [0:0] u0_m0_wo0_wi1_r0_delayr1_notEnable_q;
    wire [0:0] u0_m0_wo0_wi1_r0_delayr1_nor_q;
    wire [0:0] u0_m0_wo0_wi1_r0_delayr1_enaAnd_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_rdmux_s;
    reg [2:0] u1_m0_wo0_wi0_r0_delayr0_rdmux_q;
    wire [3:0] u1_m0_wo0_wi0_r0_delayr0_cmp_b;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_cmp_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_notEnable_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_nor_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_enaAnd_q;
    wire [0:0] u1_m0_wo0_wi1_r0_delayr1_rdmux_s;
    reg [4:0] u1_m0_wo0_wi1_r0_delayr1_rdmux_q;
    wire [5:0] u1_m0_wo0_wi1_r0_delayr1_cmp_b;
    wire [0:0] u1_m0_wo0_wi1_r0_delayr1_cmp_q;
    wire [0:0] u1_m0_wo0_wi1_r0_delayr1_notEnable_q;
    wire [0:0] u1_m0_wo0_wi1_r0_delayr1_nor_q;
    wire [0:0] u1_m0_wo0_wi1_r0_delayr1_enaAnd_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr0_rdmux_s;
    reg [2:0] u2_m0_wo0_wi0_r0_delayr0_rdmux_q;
    wire [3:0] u2_m0_wo0_wi0_r0_delayr0_cmp_b;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr0_cmp_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr0_notEnable_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr0_nor_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr0_enaAnd_q;
    wire [0:0] u2_m0_wo0_wi1_r0_delayr1_rdmux_s;
    reg [4:0] u2_m0_wo0_wi1_r0_delayr1_rdmux_q;
    wire [5:0] u2_m0_wo0_wi1_r0_delayr1_cmp_b;
    wire [0:0] u2_m0_wo0_wi1_r0_delayr1_cmp_q;
    wire [0:0] u2_m0_wo0_wi1_r0_delayr1_notEnable_q;
    wire [0:0] u2_m0_wo0_wi1_r0_delayr1_nor_q;
    wire [0:0] u2_m0_wo0_wi1_r0_delayr1_enaAnd_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr0_rdmux_s;
    reg [2:0] u3_m0_wo0_wi0_r0_delayr0_rdmux_q;
    wire [3:0] u3_m0_wo0_wi0_r0_delayr0_cmp_b;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr0_cmp_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr0_notEnable_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr0_nor_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr0_enaAnd_q;
    wire [0:0] u3_m0_wo0_wi1_r0_delayr1_rdmux_s;
    reg [4:0] u3_m0_wo0_wi1_r0_delayr1_rdmux_q;
    wire [5:0] u3_m0_wo0_wi1_r0_delayr1_cmp_b;
    wire [0:0] u3_m0_wo0_wi1_r0_delayr1_cmp_q;
    wire [0:0] u3_m0_wo0_wi1_r0_delayr1_notEnable_q;
    wire [0:0] u3_m0_wo0_wi1_r0_delayr1_nor_q;
    wire [0:0] u3_m0_wo0_wi1_r0_delayr1_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s;
    reg [4:0] u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q;
    wire [5:0] u0_m0_wo0_wi0_r0_delayr0_split_0_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_split_0_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_split_0_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s;
    reg [4:0] u1_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q;
    wire [5:0] u1_m0_wo0_wi0_r0_delayr0_split_0_cmp_b;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_split_0_cmp_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_split_0_nor_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s;
    reg [4:0] u2_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q;
    wire [5:0] u2_m0_wo0_wi0_r0_delayr0_split_0_cmp_b;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr0_split_0_cmp_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr0_split_0_nor_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s;
    reg [4:0] u3_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q;
    wire [5:0] u3_m0_wo0_wi0_r0_delayr0_split_0_cmp_b;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr0_split_0_cmp_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr0_split_0_nor_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q;
    reg [15:0] u0_m0_wo0_wi0_r0_phasedelay0_q;
    reg [15:0] u0_m0_wo0_wi1_r0_phasedelay1_q;
    reg [15:0] u1_m0_wo0_wi0_r0_phasedelay0_q;
    reg [15:0] u1_m0_wo0_wi1_r0_phasedelay1_q;
    reg [15:0] u2_m0_wo0_wi0_r0_phasedelay0_q;
    reg [15:0] u2_m0_wo0_wi1_r0_phasedelay1_q;
    reg [15:0] u3_m0_wo0_wi0_r0_phasedelay0_q;
    reg [15:0] u3_m0_wo0_wi1_r0_phasedelay1_q;
    reg [15:0] u0_m0_wo0_wi0_sym_add0_assign_id24_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr2_q;
    reg [15:0] u1_m0_wo0_wi0_sym_add0_assign_id25_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr2_q;
    reg [15:0] u2_m0_wo0_wi0_sym_add0_assign_id26_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr2_q;
    reg [15:0] u3_m0_wo0_wi0_sym_add0_assign_id27_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr2_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr3_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr3_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr3_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr3_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr4_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr4_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr4_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr4_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr5_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr5_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr5_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr5_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr6_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr6_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr6_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr6_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr7_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr7_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr7_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr7_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr8_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr8_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr8_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr8_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr9_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr9_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr9_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr9_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr10_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr10_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr10_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr10_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr11_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr11_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr11_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr11_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr12_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr12_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr12_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr12_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr13_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr13_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr13_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr13_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr14_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr14_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr14_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr14_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr15_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr15_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr15_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr15_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr16_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr16_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr16_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr16_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr17_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr17_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr17_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr17_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr18_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr18_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr18_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr18_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr19_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr19_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr19_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr19_q;
    reg [15:0] u0_m0_wo0_wi1_r0_delayr20_q;
    reg [15:0] u1_m0_wo0_wi1_r0_delayr20_q;
    reg [15:0] u2_m0_wo0_wi1_r0_delayr20_q;
    reg [15:0] u3_m0_wo0_wi1_r0_delayr20_q;

    import dec_dly_comp_DUT_safe_path_ver::safe_path_ver;

    // u3_m0_wo0_wi1_r0_delayr20(DELAY,496)@10
    assign u3_m0_wo0_wi1_r0_delayr20_q = $unsigned(u3_m0_wo0_wi1_r0_delayr19_q);

    // u3_m0_wo0_wi1_r0_delayr21(DELAY,497)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi1_r0_delayr21_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u3_m0_wo0_wi1_r0_delayr21_q <= $unsigned(u3_m0_wo0_wi1_r0_delayr20_q);
        end
    end

    // u3_m0_wo0_wi1_r0_delayr19(DELAY,495)@10
    assign u3_m0_wo0_wi1_r0_delayr19_q = $unsigned(u3_m0_wo0_wi1_r0_delayr18_q);

    // u3_m0_wo0_wi1_r0_delayr18(DELAY,494)@10
    assign u3_m0_wo0_wi1_r0_delayr18_q = $unsigned(u3_m0_wo0_wi1_r0_delayr17_q);

    // u3_m0_wo0_wi1_r0_delayr17(DELAY,493)@10
    assign u3_m0_wo0_wi1_r0_delayr17_q = $unsigned(u3_m0_wo0_wi1_r0_delayr16_q);

    // u3_m0_wo0_wi1_r0_delayr16(DELAY,492)@10
    assign u3_m0_wo0_wi1_r0_delayr16_q = $unsigned(u3_m0_wo0_wi1_r0_delayr15_q);

    // u3_m0_wo0_wi1_r0_delayr15(DELAY,491)@10
    assign u3_m0_wo0_wi1_r0_delayr15_q = $unsigned(u3_m0_wo0_wi1_r0_delayr14_q);

    // u3_m0_wo0_wi1_r0_delayr14(DELAY,490)@10
    assign u3_m0_wo0_wi1_r0_delayr14_q = $unsigned(u3_m0_wo0_wi1_r0_delayr13_q);

    // u3_m0_wo0_wi1_r0_delayr13(DELAY,489)@10
    assign u3_m0_wo0_wi1_r0_delayr13_q = $unsigned(u3_m0_wo0_wi1_r0_delayr12_q);

    // u3_m0_wo0_wi1_r0_delayr12(DELAY,488)@10
    assign u3_m0_wo0_wi1_r0_delayr12_q = $unsigned(u3_m0_wo0_wi1_r0_delayr11_q);

    // u3_m0_wo0_wi1_r0_delayr11(DELAY,487)@10
    assign u3_m0_wo0_wi1_r0_delayr11_q = $unsigned(u3_m0_wo0_wi1_r0_delayr10_q);

    // u3_m0_wo0_wi1_r0_delayr10(DELAY,486)@10
    assign u3_m0_wo0_wi1_r0_delayr10_q = $unsigned(u3_m0_wo0_wi1_r0_delayr9_q);

    // u3_m0_wo0_wi1_r0_delayr9(DELAY,485)@10
    assign u3_m0_wo0_wi1_r0_delayr9_q = $unsigned(u3_m0_wo0_wi1_r0_delayr8_q);

    // u3_m0_wo0_wi1_r0_delayr8(DELAY,484)@10
    assign u3_m0_wo0_wi1_r0_delayr8_q = $unsigned(u3_m0_wo0_wi1_r0_delayr7_q);

    // u3_m0_wo0_wi1_r0_delayr7(DELAY,483)@10
    assign u3_m0_wo0_wi1_r0_delayr7_q = $unsigned(u3_m0_wo0_wi1_r0_delayr6_q);

    // u3_m0_wo0_wi1_r0_delayr6(DELAY,482)@10
    assign u3_m0_wo0_wi1_r0_delayr6_q = $unsigned(u3_m0_wo0_wi1_r0_delayr5_q);

    // u3_m0_wo0_wi1_r0_delayr5(DELAY,481)@10
    assign u3_m0_wo0_wi1_r0_delayr5_q = $unsigned(u3_m0_wo0_wi1_r0_delayr4_q);

    // u3_m0_wo0_wi1_r0_delayr4(DELAY,480)@10
    assign u3_m0_wo0_wi1_r0_delayr4_q = $unsigned(u3_m0_wo0_wi1_r0_delayr3_q);

    // u3_m0_wo0_wi1_r0_delayr3(DELAY,479)@10
    assign u3_m0_wo0_wi1_r0_delayr3_q = $unsigned(u3_m0_wo0_wi1_r0_delayr2_q);

    // u3_m0_wo0_wi1_r0_delayr2(DELAY,478)@10
    assign u3_m0_wo0_wi1_r0_delayr2_q = $unsigned(u3_m0_wo0_wi1_r0_phasedelay1_q);

    // u3_m0_wo0_wi1_r0_delayr1_notEnable(LOGICAL,654)@10
    assign u3_m0_wo0_wi1_r0_delayr1_notEnable_q = $unsigned(~ (xIn_v));

    // u3_m0_wo0_wi1_r0_delayr1_nor(LOGICAL,655)@10
    assign u3_m0_wo0_wi1_r0_delayr1_nor_q = ~ (u3_m0_wo0_wi1_r0_delayr1_notEnable_q | u3_m0_wo0_wi1_r0_delayr1_sticky_ena_q);

    // u3_m0_wo0_wi1_r0_delayr1_mem_last(CONSTANT,651)
    assign u3_m0_wo0_wi1_r0_delayr1_mem_last_q = $unsigned(6'b010001);

    // u3_m0_wo0_wi1_r0_delayr1_cmp(LOGICAL,652)@10
    assign u3_m0_wo0_wi1_r0_delayr1_cmp_b = {1'b0, u3_m0_wo0_wi1_r0_delayr1_rdmux_q};
    assign u3_m0_wo0_wi1_r0_delayr1_cmp_q = $unsigned(u3_m0_wo0_wi1_r0_delayr1_mem_last_q == u3_m0_wo0_wi1_r0_delayr1_cmp_b ? 1'b1 : 1'b0);

    // u3_m0_wo0_wi1_r0_delayr1_cmpReg(REG,653)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi1_r0_delayr1_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u3_m0_wo0_wi1_r0_delayr1_cmpReg_q <= $unsigned(u3_m0_wo0_wi1_r0_delayr1_cmp_q);
        end
    end

    // u3_m0_wo0_wi1_r0_delayr1_sticky_ena(REG,656)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi1_r0_delayr1_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u3_m0_wo0_wi1_r0_delayr1_nor_q == 1'b1)
        begin
            u3_m0_wo0_wi1_r0_delayr1_sticky_ena_q <= $unsigned(u3_m0_wo0_wi1_r0_delayr1_cmpReg_q);
        end
    end

    // u3_m0_wo0_wi1_r0_delayr1_enaAnd(LOGICAL,657)@10
    assign u3_m0_wo0_wi1_r0_delayr1_enaAnd_q = u3_m0_wo0_wi1_r0_delayr1_sticky_ena_q & xIn_v;

    // u3_m0_wo0_wi1_r0_delayr1_rdcnt(COUNTER,648)@10 + 1
    // low=0, high=18, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi1_r0_delayr1_rdcnt_i <= 5'd0;
            u3_m0_wo0_wi1_r0_delayr1_rdcnt_eq <= 1'b0;
        end
        else if (xIn_v == 1'b1)
        begin
            if (u3_m0_wo0_wi1_r0_delayr1_rdcnt_i == 5'd17)
            begin
                u3_m0_wo0_wi1_r0_delayr1_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u3_m0_wo0_wi1_r0_delayr1_rdcnt_eq <= 1'b0;
            end
            if (u3_m0_wo0_wi1_r0_delayr1_rdcnt_eq == 1'b1)
            begin
                u3_m0_wo0_wi1_r0_delayr1_rdcnt_i <= $unsigned(u3_m0_wo0_wi1_r0_delayr1_rdcnt_i) + $unsigned(5'd14);
            end
            else
            begin
                u3_m0_wo0_wi1_r0_delayr1_rdcnt_i <= $unsigned(u3_m0_wo0_wi1_r0_delayr1_rdcnt_i) + $unsigned(5'd1);
            end
        end
    end
    assign u3_m0_wo0_wi1_r0_delayr1_rdcnt_q = u3_m0_wo0_wi1_r0_delayr1_rdcnt_i[4:0];

    // u3_m0_wo0_wi1_r0_delayr1_rdmux(MUX,649)@10
    assign u3_m0_wo0_wi1_r0_delayr1_rdmux_s = xIn_v;
    always @(u3_m0_wo0_wi1_r0_delayr1_rdmux_s or u3_m0_wo0_wi1_r0_delayr1_wraddr_q or u3_m0_wo0_wi1_r0_delayr1_rdcnt_q)
    begin
        unique case (u3_m0_wo0_wi1_r0_delayr1_rdmux_s)
            1'b0 : u3_m0_wo0_wi1_r0_delayr1_rdmux_q = u3_m0_wo0_wi1_r0_delayr1_wraddr_q;
            1'b1 : u3_m0_wo0_wi1_r0_delayr1_rdmux_q = u3_m0_wo0_wi1_r0_delayr1_rdcnt_q;
            default : u3_m0_wo0_wi1_r0_delayr1_rdmux_q = 5'b0;
        endcase
    end

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // u3_m0_wo0_wi1_r0_delayr1_wraddr(REG,650)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi1_r0_delayr1_wraddr_q <= $unsigned(5'b10010);
        end
        else
        begin
            u3_m0_wo0_wi1_r0_delayr1_wraddr_q <= $unsigned(u3_m0_wo0_wi1_r0_delayr1_rdmux_q);
        end
    end

    // u3_m0_wo0_wi1_r0_delayr1_mem(DUALMEM,647)@10 + 2
    assign u3_m0_wo0_wi1_r0_delayr1_mem_ia = $unsigned(xIn_7);
    assign u3_m0_wo0_wi1_r0_delayr1_mem_aa = u3_m0_wo0_wi1_r0_delayr1_wraddr_q;
    assign u3_m0_wo0_wi1_r0_delayr1_mem_ab = u3_m0_wo0_wi1_r0_delayr1_rdmux_q;
    assign u3_m0_wo0_wi1_r0_delayr1_mem_ena_OrRstB = areset | u3_m0_wo0_wi1_r0_delayr1_enaAnd_q[0];
    assign u3_m0_wo0_wi1_r0_delayr1_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(5),
        .numwords_a(19),
        .width_b(16),
        .widthad_b(5),
        .numwords_b(19),
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
    ) u3_m0_wo0_wi1_r0_delayr1_mem_dmem (
        .clocken1(u3_m0_wo0_wi1_r0_delayr1_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u3_m0_wo0_wi1_r0_delayr1_mem_reset0),
        .clock1(clk),
        .address_a(u3_m0_wo0_wi1_r0_delayr1_mem_aa),
        .data_a(u3_m0_wo0_wi1_r0_delayr1_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u3_m0_wo0_wi1_r0_delayr1_mem_ab),
        .q_b(u3_m0_wo0_wi1_r0_delayr1_mem_iq),
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
    assign u3_m0_wo0_wi1_r0_delayr1_mem_q = u3_m0_wo0_wi1_r0_delayr1_mem_iq[15:0];

    // u3_m0_wo0_wi1_r0_phasedelay1(DELAY,477)@10
    assign u3_m0_wo0_wi1_r0_phasedelay1_q = $unsigned(u3_m0_wo0_wi1_r0_delayr1_mem_q);

    // u3_m0_wo0_wi0_r0_delayr0_notEnable(LOGICAL,643)@10
    assign u3_m0_wo0_wi0_r0_delayr0_notEnable_q = $unsigned(~ (xIn_v));

    // u3_m0_wo0_wi0_r0_delayr0_nor(LOGICAL,644)@10
    assign u3_m0_wo0_wi0_r0_delayr0_nor_q = ~ (u3_m0_wo0_wi0_r0_delayr0_notEnable_q | u3_m0_wo0_wi0_r0_delayr0_sticky_ena_q);

    // u3_m0_wo0_wi0_r0_delayr0_mem_last(CONSTANT,640)
    assign u3_m0_wo0_wi0_r0_delayr0_mem_last_q = $unsigned(4'b0100);

    // u3_m0_wo0_wi0_r0_delayr0_cmp(LOGICAL,641)@10
    assign u3_m0_wo0_wi0_r0_delayr0_cmp_b = {1'b0, u3_m0_wo0_wi0_r0_delayr0_rdmux_q};
    assign u3_m0_wo0_wi0_r0_delayr0_cmp_q = $unsigned(u3_m0_wo0_wi0_r0_delayr0_mem_last_q == u3_m0_wo0_wi0_r0_delayr0_cmp_b ? 1'b1 : 1'b0);

    // u3_m0_wo0_wi0_r0_delayr0_cmpReg(REG,642)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(u3_m0_wo0_wi0_r0_delayr0_cmp_q);
        end
    end

    // u3_m0_wo0_wi0_r0_delayr0_sticky_ena(REG,645)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr0_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u3_m0_wo0_wi0_r0_delayr0_nor_q == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_delayr0_sticky_ena_q <= $unsigned(u3_m0_wo0_wi0_r0_delayr0_cmpReg_q);
        end
    end

    // u3_m0_wo0_wi0_r0_delayr0_enaAnd(LOGICAL,646)@10
    assign u3_m0_wo0_wi0_r0_delayr0_enaAnd_q = u3_m0_wo0_wi0_r0_delayr0_sticky_ena_q & xIn_v;

    // u3_m0_wo0_wi0_r0_delayr0_rdcnt(COUNTER,637)@10 + 1
    // low=0, high=5, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr0_rdcnt_i <= 3'd0;
            u3_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
        end
        else if (xIn_v == 1'b1)
        begin
            if (u3_m0_wo0_wi0_r0_delayr0_rdcnt_i == 3'd4)
            begin
                u3_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u3_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
            end
            if (u3_m0_wo0_wi0_r0_delayr0_rdcnt_eq == 1'b1)
            begin
                u3_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u3_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(3'd3);
            end
            else
            begin
                u3_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u3_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(3'd1);
            end
        end
    end
    assign u3_m0_wo0_wi0_r0_delayr0_rdcnt_q = u3_m0_wo0_wi0_r0_delayr0_rdcnt_i[2:0];

    // u3_m0_wo0_wi0_r0_delayr0_rdmux(MUX,638)@10
    assign u3_m0_wo0_wi0_r0_delayr0_rdmux_s = xIn_v;
    always @(u3_m0_wo0_wi0_r0_delayr0_rdmux_s or u3_m0_wo0_wi0_r0_delayr0_wraddr_q or u3_m0_wo0_wi0_r0_delayr0_rdcnt_q)
    begin
        unique case (u3_m0_wo0_wi0_r0_delayr0_rdmux_s)
            1'b0 : u3_m0_wo0_wi0_r0_delayr0_rdmux_q = u3_m0_wo0_wi0_r0_delayr0_wraddr_q;
            1'b1 : u3_m0_wo0_wi0_r0_delayr0_rdmux_q = u3_m0_wo0_wi0_r0_delayr0_rdcnt_q;
            default : u3_m0_wo0_wi0_r0_delayr0_rdmux_q = 3'b0;
        endcase
    end

    // u3_m0_wo0_wi0_r0_delayr0_split_0_nor(LOGICAL,699)@10
    assign u3_m0_wo0_wi0_r0_delayr0_split_0_nor_q = ~ (u3_m0_wo0_wi0_r0_delayr0_notEnable_q | u3_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q);

    // u3_m0_wo0_wi0_r0_delayr0_split_0_mem_last(CONSTANT,695)
    assign u3_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q = $unsigned(6'b011110);

    // u3_m0_wo0_wi0_r0_delayr0_split_0_cmp(LOGICAL,696)@10
    assign u3_m0_wo0_wi0_r0_delayr0_split_0_cmp_b = {1'b0, u3_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q};
    assign u3_m0_wo0_wi0_r0_delayr0_split_0_cmp_q = $unsigned(u3_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q == u3_m0_wo0_wi0_r0_delayr0_split_0_cmp_b ? 1'b1 : 1'b0);

    // u3_m0_wo0_wi0_r0_delayr0_split_0_cmpReg(REG,697)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q <= $unsigned(u3_m0_wo0_wi0_r0_delayr0_split_0_cmp_q);
        end
    end

    // u3_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena(REG,700)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u3_m0_wo0_wi0_r0_delayr0_split_0_nor_q == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q <= $unsigned(u3_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q);
        end
    end

    // u3_m0_wo0_wi0_r0_delayr0_split_0_enaAnd(LOGICAL,701)@10
    assign u3_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q = u3_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q & xIn_v;

    // u3_m0_wo0_wi0_r0_delayr0_split_0_rdcnt(COUNTER,692)@10 + 1
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i <= 5'd0;
        end
        else if (xIn_v == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i <= $unsigned(u3_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i) + $unsigned(5'd1);
        end
    end
    assign u3_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q = u3_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i[4:0];

    // u3_m0_wo0_wi0_r0_delayr0_split_0_rdmux(MUX,693)@10
    assign u3_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s = xIn_v;
    always @(u3_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s or u3_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q or u3_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q)
    begin
        unique case (u3_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s)
            1'b0 : u3_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = u3_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
            1'b1 : u3_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = u3_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q;
            default : u3_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = 5'b0;
        endcase
    end

    // u3_m0_wo0_wi0_r0_delayr0_split_0_wraddr(REG,694)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q <= $unsigned(5'b11111);
        end
        else
        begin
            u3_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q <= $unsigned(u3_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q);
        end
    end

    // u3_m0_wo0_wi0_r0_delayr0_split_0_mem(DUALMEM,691)@10 + 2
    assign u3_m0_wo0_wi0_r0_delayr0_split_0_mem_ia = $unsigned(xIn_6);
    assign u3_m0_wo0_wi0_r0_delayr0_split_0_mem_aa = u3_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
    assign u3_m0_wo0_wi0_r0_delayr0_split_0_mem_ab = u3_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q;
    assign u3_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB = areset | u3_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q[0];
    assign u3_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(16),
        .widthad_b(5),
        .numwords_b(32),
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
    ) u3_m0_wo0_wi0_r0_delayr0_split_0_mem_dmem (
        .clocken1(u3_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u3_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0),
        .clock1(clk),
        .address_a(u3_m0_wo0_wi0_r0_delayr0_split_0_mem_aa),
        .data_a(u3_m0_wo0_wi0_r0_delayr0_split_0_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u3_m0_wo0_wi0_r0_delayr0_split_0_mem_ab),
        .q_b(u3_m0_wo0_wi0_r0_delayr0_split_0_mem_iq),
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
    assign u3_m0_wo0_wi0_r0_delayr0_split_0_mem_q = u3_m0_wo0_wi0_r0_delayr0_split_0_mem_iq[15:0];

    // u3_m0_wo0_wi0_r0_delayr0_wraddr(REG,639)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(3'b101);
        end
        else
        begin
            u3_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(u3_m0_wo0_wi0_r0_delayr0_rdmux_q);
        end
    end

    // u3_m0_wo0_wi0_r0_delayr0_mem(DUALMEM,636)@10 + 2
    assign u3_m0_wo0_wi0_r0_delayr0_mem_ia = $unsigned(u3_m0_wo0_wi0_r0_delayr0_split_0_mem_q);
    assign u3_m0_wo0_wi0_r0_delayr0_mem_aa = u3_m0_wo0_wi0_r0_delayr0_wraddr_q;
    assign u3_m0_wo0_wi0_r0_delayr0_mem_ab = u3_m0_wo0_wi0_r0_delayr0_rdmux_q;
    assign u3_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB = areset | u3_m0_wo0_wi0_r0_delayr0_enaAnd_q[0];
    assign u3_m0_wo0_wi0_r0_delayr0_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(3),
        .numwords_a(6),
        .width_b(16),
        .widthad_b(3),
        .numwords_b(6),
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
    ) u3_m0_wo0_wi0_r0_delayr0_mem_dmem (
        .clocken1(u3_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u3_m0_wo0_wi0_r0_delayr0_mem_reset0),
        .clock1(clk),
        .address_a(u3_m0_wo0_wi0_r0_delayr0_mem_aa),
        .data_a(u3_m0_wo0_wi0_r0_delayr0_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u3_m0_wo0_wi0_r0_delayr0_mem_ab),
        .q_b(u3_m0_wo0_wi0_r0_delayr0_mem_iq),
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
    assign u3_m0_wo0_wi0_r0_delayr0_mem_q = u3_m0_wo0_wi0_r0_delayr0_mem_iq[15:0];

    // u3_m0_wo0_wi0_r0_phasedelay0(DELAY,432)@10
    assign u3_m0_wo0_wi0_r0_phasedelay0_q = $unsigned(u3_m0_wo0_wi0_r0_delayr0_mem_q);

    // u3_m0_wo0_wi0_sym_add0_assign_id27(DELAY,563)@10
    assign u3_m0_wo0_wi0_sym_add0_assign_id27_q = $unsigned(u3_m0_wo0_wi0_r0_phasedelay0_q);

    // d_u0_m0_wo0_compute_q_13(DELAY,564)@10 + 3
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m0_wo0_compute_q_13_delay_0 <= '0;
        end
        else
        begin
            d_u0_m0_wo0_compute_q_13_delay_0 <= $unsigned(xIn_v);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_compute_q_13_delay_1 <= d_u0_m0_wo0_compute_q_13_delay_0;
            d_u0_m0_wo0_compute_q_13_q <= d_u0_m0_wo0_compute_q_13_delay_1;
        end
    end

    // u3_m0_wo0_cma0(CHAINMULTADD,539)@10 + 5
    assign u3_m0_wo0_cma0_reset = areset;
    assign u3_m0_wo0_cma0_ena0 = xIn_v[0] | u3_m0_wo0_cma0_reset;
    assign u3_m0_wo0_cma0_ena1 = d_u0_m0_wo0_compute_q_13_q[0] | u3_m0_wo0_cma0_reset;
    assign u3_m0_wo0_cma0_ena2 = 1'b1;

    assign u3_m0_wo0_cma0_a0 = $unsigned($signed({15'b000000000000000, GND_q[0:0]}));
    assign u3_m0_wo0_cma0_b0 = $unsigned(u3_m0_wo0_wi0_sym_add0_assign_id27_q);
    assign u3_m0_wo0_cma0_c0 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b1 = $unsigned(u3_m0_wo0_wi1_r0_phasedelay1_q);
    assign u3_m0_wo0_cma0_c1 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b2 = $unsigned(u3_m0_wo0_wi1_r0_delayr2_q);
    assign u3_m0_wo0_cma0_c2 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b3 = $unsigned(u3_m0_wo0_wi1_r0_delayr3_q);
    assign u3_m0_wo0_cma0_c3 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b4 = $unsigned(u3_m0_wo0_wi1_r0_delayr4_q);
    assign u3_m0_wo0_cma0_c4 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b5 = $unsigned(u3_m0_wo0_wi1_r0_delayr5_q);
    assign u3_m0_wo0_cma0_c5 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b6 = $unsigned(u3_m0_wo0_wi1_r0_delayr6_q);
    assign u3_m0_wo0_cma0_c6 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b7 = $unsigned(u3_m0_wo0_wi1_r0_delayr7_q);
    assign u3_m0_wo0_cma0_c7 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b8 = $unsigned(u3_m0_wo0_wi1_r0_delayr8_q);
    assign u3_m0_wo0_cma0_c8 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b9 = $unsigned(u3_m0_wo0_wi1_r0_delayr9_q);
    assign u3_m0_wo0_cma0_c9 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b10 = $unsigned(u3_m0_wo0_wi1_r0_delayr10_q);
    assign u3_m0_wo0_cma0_c10 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b11 = $unsigned(u3_m0_wo0_wi1_r0_delayr11_q);
    assign u3_m0_wo0_cma0_c11 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b12 = $unsigned(u3_m0_wo0_wi1_r0_delayr12_q);
    assign u3_m0_wo0_cma0_c12 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b13 = $unsigned(u3_m0_wo0_wi1_r0_delayr13_q);
    assign u3_m0_wo0_cma0_c13 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b14 = $unsigned(u3_m0_wo0_wi1_r0_delayr14_q);
    assign u3_m0_wo0_cma0_c14 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b15 = $unsigned(u3_m0_wo0_wi1_r0_delayr15_q);
    assign u3_m0_wo0_cma0_c15 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b16 = $unsigned(u3_m0_wo0_wi1_r0_delayr16_q);
    assign u3_m0_wo0_cma0_c16 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b17 = $unsigned(u3_m0_wo0_wi1_r0_delayr17_q);
    assign u3_m0_wo0_cma0_c17 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b18 = $unsigned(u3_m0_wo0_wi1_r0_delayr18_q);
    assign u3_m0_wo0_cma0_c18 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_b19 = $unsigned(u3_m0_wo0_wi1_r0_delayr19_q);
    assign u3_m0_wo0_cma0_c19 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_a20 = $unsigned(u3_m0_wo0_wi1_r0_delayr21_q);
    assign u3_m0_wo0_cma0_b20 = $unsigned(u3_m0_wo0_wi1_r0_delayr20_q);
    assign u3_m0_wo0_cma0_c20 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo0_cma0_a21 = 16'b0;
    assign u3_m0_wo0_cma0_b21 = 16'b0;
    assign u3_m0_wo0_cma0_c21 = 3'b0;
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_b_0(10407),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo0_cma0_DSP10 (
        .clk(clk),
        .ena({ u3_m0_wo0_cma0_ena2, u3_m0_wo0_cma0_ena1, u3_m0_wo0_cma0_ena0 }),
        .clr({ u3_m0_wo0_cma0_reset, u3_m0_wo0_cma0_reset }),
        .ay(u3_m0_wo0_cma0_a21),
        .by(u3_m0_wo0_cma0_a20),
        .scanout(u3_m0_wo0_cma0_d20),
        .az(u3_m0_wo0_cma0_b21),
        .bz(u3_m0_wo0_cma0_b20),
        .coefsela(u3_m0_wo0_cma0_c21),
        .coefselb(u3_m0_wo0_cma0_c20),
        .chainout(u3_m0_wo0_cma0_s20),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .bx(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .chainin(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-3409),
        .coef_b_0(1973),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo0_cma0_DSP9 (
        .clk(clk),
        .ena({ u3_m0_wo0_cma0_ena2, u3_m0_wo0_cma0_ena1, u3_m0_wo0_cma0_ena0 }),
        .clr({ u3_m0_wo0_cma0_reset, u3_m0_wo0_cma0_reset }),
        .scanin(u3_m0_wo0_cma0_d20),
        .scanout(u3_m0_wo0_cma0_d18),
        .az(u3_m0_wo0_cma0_b19),
        .bz(u3_m0_wo0_cma0_b18),
        .coefsela(u3_m0_wo0_cma0_c19),
        .coefselb(u3_m0_wo0_cma0_c18),
        .chainin(u3_m0_wo0_cma0_s20),
        .chainout(u3_m0_wo0_cma0_s18),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-1336),
        .coef_b_0(966),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo0_cma0_DSP8 (
        .clk(clk),
        .ena({ u3_m0_wo0_cma0_ena2, u3_m0_wo0_cma0_ena1, u3_m0_wo0_cma0_ena0 }),
        .clr({ u3_m0_wo0_cma0_reset, u3_m0_wo0_cma0_reset }),
        .scanin(u3_m0_wo0_cma0_d18),
        .scanout(u3_m0_wo0_cma0_d16),
        .az(u3_m0_wo0_cma0_b17),
        .bz(u3_m0_wo0_cma0_b16),
        .coefsela(u3_m0_wo0_cma0_c17),
        .coefselb(u3_m0_wo0_cma0_c16),
        .chainin(u3_m0_wo0_cma0_s18),
        .chainout(u3_m0_wo0_cma0_s16),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-722),
        .coef_b_0(546),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo0_cma0_DSP7 (
        .clk(clk),
        .ena({ u3_m0_wo0_cma0_ena2, u3_m0_wo0_cma0_ena1, u3_m0_wo0_cma0_ena0 }),
        .clr({ u3_m0_wo0_cma0_reset, u3_m0_wo0_cma0_reset }),
        .scanin(u3_m0_wo0_cma0_d16),
        .scanout(u3_m0_wo0_cma0_d14),
        .az(u3_m0_wo0_cma0_b15),
        .bz(u3_m0_wo0_cma0_b14),
        .coefsela(u3_m0_wo0_cma0_c15),
        .coefselb(u3_m0_wo0_cma0_c14),
        .chainin(u3_m0_wo0_cma0_s16),
        .chainout(u3_m0_wo0_cma0_s14),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-416),
        .coef_b_0(314),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo0_cma0_DSP6 (
        .clk(clk),
        .ena({ u3_m0_wo0_cma0_ena2, u3_m0_wo0_cma0_ena1, u3_m0_wo0_cma0_ena0 }),
        .clr({ u3_m0_wo0_cma0_reset, u3_m0_wo0_cma0_reset }),
        .scanin(u3_m0_wo0_cma0_d14),
        .scanout(u3_m0_wo0_cma0_d12),
        .az(u3_m0_wo0_cma0_b13),
        .bz(u3_m0_wo0_cma0_b12),
        .coefsela(u3_m0_wo0_cma0_c13),
        .coefselb(u3_m0_wo0_cma0_c12),
        .chainin(u3_m0_wo0_cma0_s14),
        .chainout(u3_m0_wo0_cma0_s12),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-237),
        .coef_b_0(174),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo0_cma0_DSP5 (
        .clk(clk),
        .ena({ u3_m0_wo0_cma0_ena2, u3_m0_wo0_cma0_ena1, u3_m0_wo0_cma0_ena0 }),
        .clr({ u3_m0_wo0_cma0_reset, u3_m0_wo0_cma0_reset }),
        .scanin(u3_m0_wo0_cma0_d12),
        .scanout(u3_m0_wo0_cma0_d10),
        .az(u3_m0_wo0_cma0_b11),
        .bz(u3_m0_wo0_cma0_b10),
        .coefsela(u3_m0_wo0_cma0_c11),
        .coefselb(u3_m0_wo0_cma0_c10),
        .chainin(u3_m0_wo0_cma0_s12),
        .chainout(u3_m0_wo0_cma0_s10),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-128),
        .coef_b_0(90),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo0_cma0_DSP4 (
        .clk(clk),
        .ena({ u3_m0_wo0_cma0_ena2, u3_m0_wo0_cma0_ena1, u3_m0_wo0_cma0_ena0 }),
        .clr({ u3_m0_wo0_cma0_reset, u3_m0_wo0_cma0_reset }),
        .scanin(u3_m0_wo0_cma0_d10),
        .scanout(u3_m0_wo0_cma0_d8),
        .az(u3_m0_wo0_cma0_b9),
        .bz(u3_m0_wo0_cma0_b8),
        .coefsela(u3_m0_wo0_cma0_c9),
        .coefselb(u3_m0_wo0_cma0_c8),
        .chainin(u3_m0_wo0_cma0_s10),
        .chainout(u3_m0_wo0_cma0_s8),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-63),
        .coef_b_0(42),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo0_cma0_DSP3 (
        .clk(clk),
        .ena({ u3_m0_wo0_cma0_ena2, u3_m0_wo0_cma0_ena1, u3_m0_wo0_cma0_ena0 }),
        .clr({ u3_m0_wo0_cma0_reset, u3_m0_wo0_cma0_reset }),
        .scanin(u3_m0_wo0_cma0_d8),
        .scanout(u3_m0_wo0_cma0_d6),
        .az(u3_m0_wo0_cma0_b7),
        .bz(u3_m0_wo0_cma0_b6),
        .coefsela(u3_m0_wo0_cma0_c7),
        .coefselb(u3_m0_wo0_cma0_c6),
        .chainin(u3_m0_wo0_cma0_s8),
        .chainout(u3_m0_wo0_cma0_s6),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-28),
        .coef_b_0(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo0_cma0_DSP2 (
        .clk(clk),
        .ena({ u3_m0_wo0_cma0_ena2, u3_m0_wo0_cma0_ena1, u3_m0_wo0_cma0_ena0 }),
        .clr({ u3_m0_wo0_cma0_reset, u3_m0_wo0_cma0_reset }),
        .scanin(u3_m0_wo0_cma0_d6),
        .scanout(u3_m0_wo0_cma0_d4),
        .az(u3_m0_wo0_cma0_b5),
        .bz(u3_m0_wo0_cma0_b4),
        .coefsela(u3_m0_wo0_cma0_c5),
        .coefselb(u3_m0_wo0_cma0_c4),
        .chainin(u3_m0_wo0_cma0_s6),
        .chainout(u3_m0_wo0_cma0_s4),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-10),
        .coef_b_0(4),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo0_cma0_DSP1 (
        .clk(clk),
        .ena({ u3_m0_wo0_cma0_ena2, u3_m0_wo0_cma0_ena1, u3_m0_wo0_cma0_ena0 }),
        .clr({ u3_m0_wo0_cma0_reset, u3_m0_wo0_cma0_reset }),
        .scanin(u3_m0_wo0_cma0_d4),
        .scanout(u3_m0_wo0_cma0_d2),
        .az(u3_m0_wo0_cma0_b3),
        .bz(u3_m0_wo0_cma0_b2),
        .coefsela(u3_m0_wo0_cma0_c3),
        .coefselb(u3_m0_wo0_cma0_c2),
        .chainin(u3_m0_wo0_cma0_s4),
        .chainout(u3_m0_wo0_cma0_s2),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-3),
        .coef_b_0(16384),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1"),
        .result_a_width(38)
    ) u3_m0_wo0_cma0_DSP0 (
        .clk(clk),
        .ena({ u3_m0_wo0_cma0_ena2, u3_m0_wo0_cma0_ena1, u3_m0_wo0_cma0_ena0 }),
        .clr({ u3_m0_wo0_cma0_reset, u3_m0_wo0_cma0_reset }),
        .scanin(u3_m0_wo0_cma0_d2),
        .by(u3_m0_wo0_cma0_a0),
        .az(u3_m0_wo0_cma0_b1),
        .bz(u3_m0_wo0_cma0_b0),
        .coefsela(u3_m0_wo0_cma0_c1),
        .coefselb(u3_m0_wo0_cma0_c0),
        .chainin(u3_m0_wo0_cma0_s2),
        .resulta(u3_m0_wo0_cma0_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanout(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(38), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u3_m0_wo0_cma0_delay0 ( .xin(u3_m0_wo0_cma0_s0), .xout(u3_m0_wo0_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u3_m0_wo0_cma0_q = $unsigned(u3_m0_wo0_cma0_qq0[37:0]);

    // u2_m0_wo0_wi1_r0_delayr20(DELAY,370)@10
    assign u2_m0_wo0_wi1_r0_delayr20_q = $unsigned(u2_m0_wo0_wi1_r0_delayr19_q);

    // u2_m0_wo0_wi1_r0_delayr21(DELAY,371)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi1_r0_delayr21_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u2_m0_wo0_wi1_r0_delayr21_q <= $unsigned(u2_m0_wo0_wi1_r0_delayr20_q);
        end
    end

    // u2_m0_wo0_wi1_r0_delayr19(DELAY,369)@10
    assign u2_m0_wo0_wi1_r0_delayr19_q = $unsigned(u2_m0_wo0_wi1_r0_delayr18_q);

    // u2_m0_wo0_wi1_r0_delayr18(DELAY,368)@10
    assign u2_m0_wo0_wi1_r0_delayr18_q = $unsigned(u2_m0_wo0_wi1_r0_delayr17_q);

    // u2_m0_wo0_wi1_r0_delayr17(DELAY,367)@10
    assign u2_m0_wo0_wi1_r0_delayr17_q = $unsigned(u2_m0_wo0_wi1_r0_delayr16_q);

    // u2_m0_wo0_wi1_r0_delayr16(DELAY,366)@10
    assign u2_m0_wo0_wi1_r0_delayr16_q = $unsigned(u2_m0_wo0_wi1_r0_delayr15_q);

    // u2_m0_wo0_wi1_r0_delayr15(DELAY,365)@10
    assign u2_m0_wo0_wi1_r0_delayr15_q = $unsigned(u2_m0_wo0_wi1_r0_delayr14_q);

    // u2_m0_wo0_wi1_r0_delayr14(DELAY,364)@10
    assign u2_m0_wo0_wi1_r0_delayr14_q = $unsigned(u2_m0_wo0_wi1_r0_delayr13_q);

    // u2_m0_wo0_wi1_r0_delayr13(DELAY,363)@10
    assign u2_m0_wo0_wi1_r0_delayr13_q = $unsigned(u2_m0_wo0_wi1_r0_delayr12_q);

    // u2_m0_wo0_wi1_r0_delayr12(DELAY,362)@10
    assign u2_m0_wo0_wi1_r0_delayr12_q = $unsigned(u2_m0_wo0_wi1_r0_delayr11_q);

    // u2_m0_wo0_wi1_r0_delayr11(DELAY,361)@10
    assign u2_m0_wo0_wi1_r0_delayr11_q = $unsigned(u2_m0_wo0_wi1_r0_delayr10_q);

    // u2_m0_wo0_wi1_r0_delayr10(DELAY,360)@10
    assign u2_m0_wo0_wi1_r0_delayr10_q = $unsigned(u2_m0_wo0_wi1_r0_delayr9_q);

    // u2_m0_wo0_wi1_r0_delayr9(DELAY,359)@10
    assign u2_m0_wo0_wi1_r0_delayr9_q = $unsigned(u2_m0_wo0_wi1_r0_delayr8_q);

    // u2_m0_wo0_wi1_r0_delayr8(DELAY,358)@10
    assign u2_m0_wo0_wi1_r0_delayr8_q = $unsigned(u2_m0_wo0_wi1_r0_delayr7_q);

    // u2_m0_wo0_wi1_r0_delayr7(DELAY,357)@10
    assign u2_m0_wo0_wi1_r0_delayr7_q = $unsigned(u2_m0_wo0_wi1_r0_delayr6_q);

    // u2_m0_wo0_wi1_r0_delayr6(DELAY,356)@10
    assign u2_m0_wo0_wi1_r0_delayr6_q = $unsigned(u2_m0_wo0_wi1_r0_delayr5_q);

    // u2_m0_wo0_wi1_r0_delayr5(DELAY,355)@10
    assign u2_m0_wo0_wi1_r0_delayr5_q = $unsigned(u2_m0_wo0_wi1_r0_delayr4_q);

    // u2_m0_wo0_wi1_r0_delayr4(DELAY,354)@10
    assign u2_m0_wo0_wi1_r0_delayr4_q = $unsigned(u2_m0_wo0_wi1_r0_delayr3_q);

    // u2_m0_wo0_wi1_r0_delayr3(DELAY,353)@10
    assign u2_m0_wo0_wi1_r0_delayr3_q = $unsigned(u2_m0_wo0_wi1_r0_delayr2_q);

    // u2_m0_wo0_wi1_r0_delayr2(DELAY,352)@10
    assign u2_m0_wo0_wi1_r0_delayr2_q = $unsigned(u2_m0_wo0_wi1_r0_phasedelay1_q);

    // u2_m0_wo0_wi1_r0_delayr1_notEnable(LOGICAL,632)@10
    assign u2_m0_wo0_wi1_r0_delayr1_notEnable_q = $unsigned(~ (xIn_v));

    // u2_m0_wo0_wi1_r0_delayr1_nor(LOGICAL,633)@10
    assign u2_m0_wo0_wi1_r0_delayr1_nor_q = ~ (u2_m0_wo0_wi1_r0_delayr1_notEnable_q | u2_m0_wo0_wi1_r0_delayr1_sticky_ena_q);

    // u2_m0_wo0_wi1_r0_delayr1_mem_last(CONSTANT,629)
    assign u2_m0_wo0_wi1_r0_delayr1_mem_last_q = $unsigned(6'b010001);

    // u2_m0_wo0_wi1_r0_delayr1_cmp(LOGICAL,630)@10
    assign u2_m0_wo0_wi1_r0_delayr1_cmp_b = {1'b0, u2_m0_wo0_wi1_r0_delayr1_rdmux_q};
    assign u2_m0_wo0_wi1_r0_delayr1_cmp_q = $unsigned(u2_m0_wo0_wi1_r0_delayr1_mem_last_q == u2_m0_wo0_wi1_r0_delayr1_cmp_b ? 1'b1 : 1'b0);

    // u2_m0_wo0_wi1_r0_delayr1_cmpReg(REG,631)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi1_r0_delayr1_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u2_m0_wo0_wi1_r0_delayr1_cmpReg_q <= $unsigned(u2_m0_wo0_wi1_r0_delayr1_cmp_q);
        end
    end

    // u2_m0_wo0_wi1_r0_delayr1_sticky_ena(REG,634)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi1_r0_delayr1_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u2_m0_wo0_wi1_r0_delayr1_nor_q == 1'b1)
        begin
            u2_m0_wo0_wi1_r0_delayr1_sticky_ena_q <= $unsigned(u2_m0_wo0_wi1_r0_delayr1_cmpReg_q);
        end
    end

    // u2_m0_wo0_wi1_r0_delayr1_enaAnd(LOGICAL,635)@10
    assign u2_m0_wo0_wi1_r0_delayr1_enaAnd_q = u2_m0_wo0_wi1_r0_delayr1_sticky_ena_q & xIn_v;

    // u2_m0_wo0_wi1_r0_delayr1_rdcnt(COUNTER,626)@10 + 1
    // low=0, high=18, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi1_r0_delayr1_rdcnt_i <= 5'd0;
            u2_m0_wo0_wi1_r0_delayr1_rdcnt_eq <= 1'b0;
        end
        else if (xIn_v == 1'b1)
        begin
            if (u2_m0_wo0_wi1_r0_delayr1_rdcnt_i == 5'd17)
            begin
                u2_m0_wo0_wi1_r0_delayr1_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u2_m0_wo0_wi1_r0_delayr1_rdcnt_eq <= 1'b0;
            end
            if (u2_m0_wo0_wi1_r0_delayr1_rdcnt_eq == 1'b1)
            begin
                u2_m0_wo0_wi1_r0_delayr1_rdcnt_i <= $unsigned(u2_m0_wo0_wi1_r0_delayr1_rdcnt_i) + $unsigned(5'd14);
            end
            else
            begin
                u2_m0_wo0_wi1_r0_delayr1_rdcnt_i <= $unsigned(u2_m0_wo0_wi1_r0_delayr1_rdcnt_i) + $unsigned(5'd1);
            end
        end
    end
    assign u2_m0_wo0_wi1_r0_delayr1_rdcnt_q = u2_m0_wo0_wi1_r0_delayr1_rdcnt_i[4:0];

    // u2_m0_wo0_wi1_r0_delayr1_rdmux(MUX,627)@10
    assign u2_m0_wo0_wi1_r0_delayr1_rdmux_s = xIn_v;
    always @(u2_m0_wo0_wi1_r0_delayr1_rdmux_s or u2_m0_wo0_wi1_r0_delayr1_wraddr_q or u2_m0_wo0_wi1_r0_delayr1_rdcnt_q)
    begin
        unique case (u2_m0_wo0_wi1_r0_delayr1_rdmux_s)
            1'b0 : u2_m0_wo0_wi1_r0_delayr1_rdmux_q = u2_m0_wo0_wi1_r0_delayr1_wraddr_q;
            1'b1 : u2_m0_wo0_wi1_r0_delayr1_rdmux_q = u2_m0_wo0_wi1_r0_delayr1_rdcnt_q;
            default : u2_m0_wo0_wi1_r0_delayr1_rdmux_q = 5'b0;
        endcase
    end

    // u2_m0_wo0_wi1_r0_delayr1_wraddr(REG,628)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi1_r0_delayr1_wraddr_q <= $unsigned(5'b10010);
        end
        else
        begin
            u2_m0_wo0_wi1_r0_delayr1_wraddr_q <= $unsigned(u2_m0_wo0_wi1_r0_delayr1_rdmux_q);
        end
    end

    // u2_m0_wo0_wi1_r0_delayr1_mem(DUALMEM,625)@10 + 2
    assign u2_m0_wo0_wi1_r0_delayr1_mem_ia = $unsigned(xIn_5);
    assign u2_m0_wo0_wi1_r0_delayr1_mem_aa = u2_m0_wo0_wi1_r0_delayr1_wraddr_q;
    assign u2_m0_wo0_wi1_r0_delayr1_mem_ab = u2_m0_wo0_wi1_r0_delayr1_rdmux_q;
    assign u2_m0_wo0_wi1_r0_delayr1_mem_ena_OrRstB = areset | u2_m0_wo0_wi1_r0_delayr1_enaAnd_q[0];
    assign u2_m0_wo0_wi1_r0_delayr1_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(5),
        .numwords_a(19),
        .width_b(16),
        .widthad_b(5),
        .numwords_b(19),
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
    ) u2_m0_wo0_wi1_r0_delayr1_mem_dmem (
        .clocken1(u2_m0_wo0_wi1_r0_delayr1_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u2_m0_wo0_wi1_r0_delayr1_mem_reset0),
        .clock1(clk),
        .address_a(u2_m0_wo0_wi1_r0_delayr1_mem_aa),
        .data_a(u2_m0_wo0_wi1_r0_delayr1_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u2_m0_wo0_wi1_r0_delayr1_mem_ab),
        .q_b(u2_m0_wo0_wi1_r0_delayr1_mem_iq),
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
    assign u2_m0_wo0_wi1_r0_delayr1_mem_q = u2_m0_wo0_wi1_r0_delayr1_mem_iq[15:0];

    // u2_m0_wo0_wi1_r0_phasedelay1(DELAY,351)@10
    assign u2_m0_wo0_wi1_r0_phasedelay1_q = $unsigned(u2_m0_wo0_wi1_r0_delayr1_mem_q);

    // u2_m0_wo0_wi0_r0_delayr0_notEnable(LOGICAL,621)@10
    assign u2_m0_wo0_wi0_r0_delayr0_notEnable_q = $unsigned(~ (xIn_v));

    // u2_m0_wo0_wi0_r0_delayr0_nor(LOGICAL,622)@10
    assign u2_m0_wo0_wi0_r0_delayr0_nor_q = ~ (u2_m0_wo0_wi0_r0_delayr0_notEnable_q | u2_m0_wo0_wi0_r0_delayr0_sticky_ena_q);

    // u2_m0_wo0_wi0_r0_delayr0_mem_last(CONSTANT,618)
    assign u2_m0_wo0_wi0_r0_delayr0_mem_last_q = $unsigned(4'b0100);

    // u2_m0_wo0_wi0_r0_delayr0_cmp(LOGICAL,619)@10
    assign u2_m0_wo0_wi0_r0_delayr0_cmp_b = {1'b0, u2_m0_wo0_wi0_r0_delayr0_rdmux_q};
    assign u2_m0_wo0_wi0_r0_delayr0_cmp_q = $unsigned(u2_m0_wo0_wi0_r0_delayr0_mem_last_q == u2_m0_wo0_wi0_r0_delayr0_cmp_b ? 1'b1 : 1'b0);

    // u2_m0_wo0_wi0_r0_delayr0_cmpReg(REG,620)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(u2_m0_wo0_wi0_r0_delayr0_cmp_q);
        end
    end

    // u2_m0_wo0_wi0_r0_delayr0_sticky_ena(REG,623)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr0_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u2_m0_wo0_wi0_r0_delayr0_nor_q == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_delayr0_sticky_ena_q <= $unsigned(u2_m0_wo0_wi0_r0_delayr0_cmpReg_q);
        end
    end

    // u2_m0_wo0_wi0_r0_delayr0_enaAnd(LOGICAL,624)@10
    assign u2_m0_wo0_wi0_r0_delayr0_enaAnd_q = u2_m0_wo0_wi0_r0_delayr0_sticky_ena_q & xIn_v;

    // u2_m0_wo0_wi0_r0_delayr0_rdcnt(COUNTER,615)@10 + 1
    // low=0, high=5, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr0_rdcnt_i <= 3'd0;
            u2_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
        end
        else if (xIn_v == 1'b1)
        begin
            if (u2_m0_wo0_wi0_r0_delayr0_rdcnt_i == 3'd4)
            begin
                u2_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u2_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
            end
            if (u2_m0_wo0_wi0_r0_delayr0_rdcnt_eq == 1'b1)
            begin
                u2_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u2_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(3'd3);
            end
            else
            begin
                u2_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u2_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(3'd1);
            end
        end
    end
    assign u2_m0_wo0_wi0_r0_delayr0_rdcnt_q = u2_m0_wo0_wi0_r0_delayr0_rdcnt_i[2:0];

    // u2_m0_wo0_wi0_r0_delayr0_rdmux(MUX,616)@10
    assign u2_m0_wo0_wi0_r0_delayr0_rdmux_s = xIn_v;
    always @(u2_m0_wo0_wi0_r0_delayr0_rdmux_s or u2_m0_wo0_wi0_r0_delayr0_wraddr_q or u2_m0_wo0_wi0_r0_delayr0_rdcnt_q)
    begin
        unique case (u2_m0_wo0_wi0_r0_delayr0_rdmux_s)
            1'b0 : u2_m0_wo0_wi0_r0_delayr0_rdmux_q = u2_m0_wo0_wi0_r0_delayr0_wraddr_q;
            1'b1 : u2_m0_wo0_wi0_r0_delayr0_rdmux_q = u2_m0_wo0_wi0_r0_delayr0_rdcnt_q;
            default : u2_m0_wo0_wi0_r0_delayr0_rdmux_q = 3'b0;
        endcase
    end

    // u2_m0_wo0_wi0_r0_delayr0_split_0_nor(LOGICAL,688)@10
    assign u2_m0_wo0_wi0_r0_delayr0_split_0_nor_q = ~ (u2_m0_wo0_wi0_r0_delayr0_notEnable_q | u2_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q);

    // u2_m0_wo0_wi0_r0_delayr0_split_0_mem_last(CONSTANT,684)
    assign u2_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q = $unsigned(6'b011110);

    // u2_m0_wo0_wi0_r0_delayr0_split_0_cmp(LOGICAL,685)@10
    assign u2_m0_wo0_wi0_r0_delayr0_split_0_cmp_b = {1'b0, u2_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q};
    assign u2_m0_wo0_wi0_r0_delayr0_split_0_cmp_q = $unsigned(u2_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q == u2_m0_wo0_wi0_r0_delayr0_split_0_cmp_b ? 1'b1 : 1'b0);

    // u2_m0_wo0_wi0_r0_delayr0_split_0_cmpReg(REG,686)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q <= $unsigned(u2_m0_wo0_wi0_r0_delayr0_split_0_cmp_q);
        end
    end

    // u2_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena(REG,689)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u2_m0_wo0_wi0_r0_delayr0_split_0_nor_q == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q <= $unsigned(u2_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q);
        end
    end

    // u2_m0_wo0_wi0_r0_delayr0_split_0_enaAnd(LOGICAL,690)@10
    assign u2_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q = u2_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q & xIn_v;

    // u2_m0_wo0_wi0_r0_delayr0_split_0_rdcnt(COUNTER,681)@10 + 1
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i <= 5'd0;
        end
        else if (xIn_v == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i <= $unsigned(u2_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i) + $unsigned(5'd1);
        end
    end
    assign u2_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q = u2_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i[4:0];

    // u2_m0_wo0_wi0_r0_delayr0_split_0_rdmux(MUX,682)@10
    assign u2_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s = xIn_v;
    always @(u2_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s or u2_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q or u2_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q)
    begin
        unique case (u2_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s)
            1'b0 : u2_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = u2_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
            1'b1 : u2_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = u2_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q;
            default : u2_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = 5'b0;
        endcase
    end

    // u2_m0_wo0_wi0_r0_delayr0_split_0_wraddr(REG,683)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q <= $unsigned(5'b11111);
        end
        else
        begin
            u2_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q <= $unsigned(u2_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q);
        end
    end

    // u2_m0_wo0_wi0_r0_delayr0_split_0_mem(DUALMEM,680)@10 + 2
    assign u2_m0_wo0_wi0_r0_delayr0_split_0_mem_ia = $unsigned(xIn_4);
    assign u2_m0_wo0_wi0_r0_delayr0_split_0_mem_aa = u2_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
    assign u2_m0_wo0_wi0_r0_delayr0_split_0_mem_ab = u2_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q;
    assign u2_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB = areset | u2_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q[0];
    assign u2_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(16),
        .widthad_b(5),
        .numwords_b(32),
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
    ) u2_m0_wo0_wi0_r0_delayr0_split_0_mem_dmem (
        .clocken1(u2_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u2_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0),
        .clock1(clk),
        .address_a(u2_m0_wo0_wi0_r0_delayr0_split_0_mem_aa),
        .data_a(u2_m0_wo0_wi0_r0_delayr0_split_0_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u2_m0_wo0_wi0_r0_delayr0_split_0_mem_ab),
        .q_b(u2_m0_wo0_wi0_r0_delayr0_split_0_mem_iq),
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
    assign u2_m0_wo0_wi0_r0_delayr0_split_0_mem_q = u2_m0_wo0_wi0_r0_delayr0_split_0_mem_iq[15:0];

    // u2_m0_wo0_wi0_r0_delayr0_wraddr(REG,617)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(3'b101);
        end
        else
        begin
            u2_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(u2_m0_wo0_wi0_r0_delayr0_rdmux_q);
        end
    end

    // u2_m0_wo0_wi0_r0_delayr0_mem(DUALMEM,614)@10 + 2
    assign u2_m0_wo0_wi0_r0_delayr0_mem_ia = $unsigned(u2_m0_wo0_wi0_r0_delayr0_split_0_mem_q);
    assign u2_m0_wo0_wi0_r0_delayr0_mem_aa = u2_m0_wo0_wi0_r0_delayr0_wraddr_q;
    assign u2_m0_wo0_wi0_r0_delayr0_mem_ab = u2_m0_wo0_wi0_r0_delayr0_rdmux_q;
    assign u2_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB = areset | u2_m0_wo0_wi0_r0_delayr0_enaAnd_q[0];
    assign u2_m0_wo0_wi0_r0_delayr0_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(3),
        .numwords_a(6),
        .width_b(16),
        .widthad_b(3),
        .numwords_b(6),
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
    ) u2_m0_wo0_wi0_r0_delayr0_mem_dmem (
        .clocken1(u2_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u2_m0_wo0_wi0_r0_delayr0_mem_reset0),
        .clock1(clk),
        .address_a(u2_m0_wo0_wi0_r0_delayr0_mem_aa),
        .data_a(u2_m0_wo0_wi0_r0_delayr0_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u2_m0_wo0_wi0_r0_delayr0_mem_ab),
        .q_b(u2_m0_wo0_wi0_r0_delayr0_mem_iq),
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
    assign u2_m0_wo0_wi0_r0_delayr0_mem_q = u2_m0_wo0_wi0_r0_delayr0_mem_iq[15:0];

    // u2_m0_wo0_wi0_r0_phasedelay0(DELAY,306)@10
    assign u2_m0_wo0_wi0_r0_phasedelay0_q = $unsigned(u2_m0_wo0_wi0_r0_delayr0_mem_q);

    // u2_m0_wo0_wi0_sym_add0_assign_id26(DELAY,562)@10
    assign u2_m0_wo0_wi0_sym_add0_assign_id26_q = $unsigned(u2_m0_wo0_wi0_r0_phasedelay0_q);

    // u2_m0_wo0_cma0(CHAINMULTADD,413)@10 + 5
    assign u2_m0_wo0_cma0_reset = areset;
    assign u2_m0_wo0_cma0_ena0 = xIn_v[0] | u2_m0_wo0_cma0_reset;
    assign u2_m0_wo0_cma0_ena1 = d_u0_m0_wo0_compute_q_13_q[0] | u2_m0_wo0_cma0_reset;
    assign u2_m0_wo0_cma0_ena2 = 1'b1;

    assign u2_m0_wo0_cma0_a0 = $unsigned($signed({15'b000000000000000, GND_q[0:0]}));
    assign u2_m0_wo0_cma0_b0 = $unsigned(u2_m0_wo0_wi0_sym_add0_assign_id26_q);
    assign u2_m0_wo0_cma0_c0 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b1 = $unsigned(u2_m0_wo0_wi1_r0_phasedelay1_q);
    assign u2_m0_wo0_cma0_c1 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b2 = $unsigned(u2_m0_wo0_wi1_r0_delayr2_q);
    assign u2_m0_wo0_cma0_c2 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b3 = $unsigned(u2_m0_wo0_wi1_r0_delayr3_q);
    assign u2_m0_wo0_cma0_c3 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b4 = $unsigned(u2_m0_wo0_wi1_r0_delayr4_q);
    assign u2_m0_wo0_cma0_c4 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b5 = $unsigned(u2_m0_wo0_wi1_r0_delayr5_q);
    assign u2_m0_wo0_cma0_c5 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b6 = $unsigned(u2_m0_wo0_wi1_r0_delayr6_q);
    assign u2_m0_wo0_cma0_c6 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b7 = $unsigned(u2_m0_wo0_wi1_r0_delayr7_q);
    assign u2_m0_wo0_cma0_c7 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b8 = $unsigned(u2_m0_wo0_wi1_r0_delayr8_q);
    assign u2_m0_wo0_cma0_c8 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b9 = $unsigned(u2_m0_wo0_wi1_r0_delayr9_q);
    assign u2_m0_wo0_cma0_c9 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b10 = $unsigned(u2_m0_wo0_wi1_r0_delayr10_q);
    assign u2_m0_wo0_cma0_c10 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b11 = $unsigned(u2_m0_wo0_wi1_r0_delayr11_q);
    assign u2_m0_wo0_cma0_c11 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b12 = $unsigned(u2_m0_wo0_wi1_r0_delayr12_q);
    assign u2_m0_wo0_cma0_c12 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b13 = $unsigned(u2_m0_wo0_wi1_r0_delayr13_q);
    assign u2_m0_wo0_cma0_c13 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b14 = $unsigned(u2_m0_wo0_wi1_r0_delayr14_q);
    assign u2_m0_wo0_cma0_c14 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b15 = $unsigned(u2_m0_wo0_wi1_r0_delayr15_q);
    assign u2_m0_wo0_cma0_c15 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b16 = $unsigned(u2_m0_wo0_wi1_r0_delayr16_q);
    assign u2_m0_wo0_cma0_c16 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b17 = $unsigned(u2_m0_wo0_wi1_r0_delayr17_q);
    assign u2_m0_wo0_cma0_c17 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b18 = $unsigned(u2_m0_wo0_wi1_r0_delayr18_q);
    assign u2_m0_wo0_cma0_c18 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_b19 = $unsigned(u2_m0_wo0_wi1_r0_delayr19_q);
    assign u2_m0_wo0_cma0_c19 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_a20 = $unsigned(u2_m0_wo0_wi1_r0_delayr21_q);
    assign u2_m0_wo0_cma0_b20 = $unsigned(u2_m0_wo0_wi1_r0_delayr20_q);
    assign u2_m0_wo0_cma0_c20 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo0_cma0_a21 = 16'b0;
    assign u2_m0_wo0_cma0_b21 = 16'b0;
    assign u2_m0_wo0_cma0_c21 = 3'b0;
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_b_0(10407),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo0_cma0_DSP10 (
        .clk(clk),
        .ena({ u2_m0_wo0_cma0_ena2, u2_m0_wo0_cma0_ena1, u2_m0_wo0_cma0_ena0 }),
        .clr({ u2_m0_wo0_cma0_reset, u2_m0_wo0_cma0_reset }),
        .ay(u2_m0_wo0_cma0_a21),
        .by(u2_m0_wo0_cma0_a20),
        .scanout(u2_m0_wo0_cma0_d20),
        .az(u2_m0_wo0_cma0_b21),
        .bz(u2_m0_wo0_cma0_b20),
        .coefsela(u2_m0_wo0_cma0_c21),
        .coefselb(u2_m0_wo0_cma0_c20),
        .chainout(u2_m0_wo0_cma0_s20),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .bx(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .chainin(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-3409),
        .coef_b_0(1973),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo0_cma0_DSP9 (
        .clk(clk),
        .ena({ u2_m0_wo0_cma0_ena2, u2_m0_wo0_cma0_ena1, u2_m0_wo0_cma0_ena0 }),
        .clr({ u2_m0_wo0_cma0_reset, u2_m0_wo0_cma0_reset }),
        .scanin(u2_m0_wo0_cma0_d20),
        .scanout(u2_m0_wo0_cma0_d18),
        .az(u2_m0_wo0_cma0_b19),
        .bz(u2_m0_wo0_cma0_b18),
        .coefsela(u2_m0_wo0_cma0_c19),
        .coefselb(u2_m0_wo0_cma0_c18),
        .chainin(u2_m0_wo0_cma0_s20),
        .chainout(u2_m0_wo0_cma0_s18),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-1336),
        .coef_b_0(966),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo0_cma0_DSP8 (
        .clk(clk),
        .ena({ u2_m0_wo0_cma0_ena2, u2_m0_wo0_cma0_ena1, u2_m0_wo0_cma0_ena0 }),
        .clr({ u2_m0_wo0_cma0_reset, u2_m0_wo0_cma0_reset }),
        .scanin(u2_m0_wo0_cma0_d18),
        .scanout(u2_m0_wo0_cma0_d16),
        .az(u2_m0_wo0_cma0_b17),
        .bz(u2_m0_wo0_cma0_b16),
        .coefsela(u2_m0_wo0_cma0_c17),
        .coefselb(u2_m0_wo0_cma0_c16),
        .chainin(u2_m0_wo0_cma0_s18),
        .chainout(u2_m0_wo0_cma0_s16),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-722),
        .coef_b_0(546),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo0_cma0_DSP7 (
        .clk(clk),
        .ena({ u2_m0_wo0_cma0_ena2, u2_m0_wo0_cma0_ena1, u2_m0_wo0_cma0_ena0 }),
        .clr({ u2_m0_wo0_cma0_reset, u2_m0_wo0_cma0_reset }),
        .scanin(u2_m0_wo0_cma0_d16),
        .scanout(u2_m0_wo0_cma0_d14),
        .az(u2_m0_wo0_cma0_b15),
        .bz(u2_m0_wo0_cma0_b14),
        .coefsela(u2_m0_wo0_cma0_c15),
        .coefselb(u2_m0_wo0_cma0_c14),
        .chainin(u2_m0_wo0_cma0_s16),
        .chainout(u2_m0_wo0_cma0_s14),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-416),
        .coef_b_0(314),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo0_cma0_DSP6 (
        .clk(clk),
        .ena({ u2_m0_wo0_cma0_ena2, u2_m0_wo0_cma0_ena1, u2_m0_wo0_cma0_ena0 }),
        .clr({ u2_m0_wo0_cma0_reset, u2_m0_wo0_cma0_reset }),
        .scanin(u2_m0_wo0_cma0_d14),
        .scanout(u2_m0_wo0_cma0_d12),
        .az(u2_m0_wo0_cma0_b13),
        .bz(u2_m0_wo0_cma0_b12),
        .coefsela(u2_m0_wo0_cma0_c13),
        .coefselb(u2_m0_wo0_cma0_c12),
        .chainin(u2_m0_wo0_cma0_s14),
        .chainout(u2_m0_wo0_cma0_s12),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-237),
        .coef_b_0(174),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo0_cma0_DSP5 (
        .clk(clk),
        .ena({ u2_m0_wo0_cma0_ena2, u2_m0_wo0_cma0_ena1, u2_m0_wo0_cma0_ena0 }),
        .clr({ u2_m0_wo0_cma0_reset, u2_m0_wo0_cma0_reset }),
        .scanin(u2_m0_wo0_cma0_d12),
        .scanout(u2_m0_wo0_cma0_d10),
        .az(u2_m0_wo0_cma0_b11),
        .bz(u2_m0_wo0_cma0_b10),
        .coefsela(u2_m0_wo0_cma0_c11),
        .coefselb(u2_m0_wo0_cma0_c10),
        .chainin(u2_m0_wo0_cma0_s12),
        .chainout(u2_m0_wo0_cma0_s10),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-128),
        .coef_b_0(90),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo0_cma0_DSP4 (
        .clk(clk),
        .ena({ u2_m0_wo0_cma0_ena2, u2_m0_wo0_cma0_ena1, u2_m0_wo0_cma0_ena0 }),
        .clr({ u2_m0_wo0_cma0_reset, u2_m0_wo0_cma0_reset }),
        .scanin(u2_m0_wo0_cma0_d10),
        .scanout(u2_m0_wo0_cma0_d8),
        .az(u2_m0_wo0_cma0_b9),
        .bz(u2_m0_wo0_cma0_b8),
        .coefsela(u2_m0_wo0_cma0_c9),
        .coefselb(u2_m0_wo0_cma0_c8),
        .chainin(u2_m0_wo0_cma0_s10),
        .chainout(u2_m0_wo0_cma0_s8),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-63),
        .coef_b_0(42),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo0_cma0_DSP3 (
        .clk(clk),
        .ena({ u2_m0_wo0_cma0_ena2, u2_m0_wo0_cma0_ena1, u2_m0_wo0_cma0_ena0 }),
        .clr({ u2_m0_wo0_cma0_reset, u2_m0_wo0_cma0_reset }),
        .scanin(u2_m0_wo0_cma0_d8),
        .scanout(u2_m0_wo0_cma0_d6),
        .az(u2_m0_wo0_cma0_b7),
        .bz(u2_m0_wo0_cma0_b6),
        .coefsela(u2_m0_wo0_cma0_c7),
        .coefselb(u2_m0_wo0_cma0_c6),
        .chainin(u2_m0_wo0_cma0_s8),
        .chainout(u2_m0_wo0_cma0_s6),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-28),
        .coef_b_0(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo0_cma0_DSP2 (
        .clk(clk),
        .ena({ u2_m0_wo0_cma0_ena2, u2_m0_wo0_cma0_ena1, u2_m0_wo0_cma0_ena0 }),
        .clr({ u2_m0_wo0_cma0_reset, u2_m0_wo0_cma0_reset }),
        .scanin(u2_m0_wo0_cma0_d6),
        .scanout(u2_m0_wo0_cma0_d4),
        .az(u2_m0_wo0_cma0_b5),
        .bz(u2_m0_wo0_cma0_b4),
        .coefsela(u2_m0_wo0_cma0_c5),
        .coefselb(u2_m0_wo0_cma0_c4),
        .chainin(u2_m0_wo0_cma0_s6),
        .chainout(u2_m0_wo0_cma0_s4),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-10),
        .coef_b_0(4),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo0_cma0_DSP1 (
        .clk(clk),
        .ena({ u2_m0_wo0_cma0_ena2, u2_m0_wo0_cma0_ena1, u2_m0_wo0_cma0_ena0 }),
        .clr({ u2_m0_wo0_cma0_reset, u2_m0_wo0_cma0_reset }),
        .scanin(u2_m0_wo0_cma0_d4),
        .scanout(u2_m0_wo0_cma0_d2),
        .az(u2_m0_wo0_cma0_b3),
        .bz(u2_m0_wo0_cma0_b2),
        .coefsela(u2_m0_wo0_cma0_c3),
        .coefselb(u2_m0_wo0_cma0_c2),
        .chainin(u2_m0_wo0_cma0_s4),
        .chainout(u2_m0_wo0_cma0_s2),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-3),
        .coef_b_0(16384),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1"),
        .result_a_width(38)
    ) u2_m0_wo0_cma0_DSP0 (
        .clk(clk),
        .ena({ u2_m0_wo0_cma0_ena2, u2_m0_wo0_cma0_ena1, u2_m0_wo0_cma0_ena0 }),
        .clr({ u2_m0_wo0_cma0_reset, u2_m0_wo0_cma0_reset }),
        .scanin(u2_m0_wo0_cma0_d2),
        .by(u2_m0_wo0_cma0_a0),
        .az(u2_m0_wo0_cma0_b1),
        .bz(u2_m0_wo0_cma0_b0),
        .coefsela(u2_m0_wo0_cma0_c1),
        .coefselb(u2_m0_wo0_cma0_c0),
        .chainin(u2_m0_wo0_cma0_s2),
        .resulta(u2_m0_wo0_cma0_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanout(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(38), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u2_m0_wo0_cma0_delay0 ( .xin(u2_m0_wo0_cma0_s0), .xout(u2_m0_wo0_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u2_m0_wo0_cma0_q = $unsigned(u2_m0_wo0_cma0_qq0[37:0]);

    // u1_m0_wo0_wi1_r0_delayr20(DELAY,244)@10
    assign u1_m0_wo0_wi1_r0_delayr20_q = $unsigned(u1_m0_wo0_wi1_r0_delayr19_q);

    // u1_m0_wo0_wi1_r0_delayr21(DELAY,245)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi1_r0_delayr21_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u1_m0_wo0_wi1_r0_delayr21_q <= $unsigned(u1_m0_wo0_wi1_r0_delayr20_q);
        end
    end

    // u1_m0_wo0_wi1_r0_delayr19(DELAY,243)@10
    assign u1_m0_wo0_wi1_r0_delayr19_q = $unsigned(u1_m0_wo0_wi1_r0_delayr18_q);

    // u1_m0_wo0_wi1_r0_delayr18(DELAY,242)@10
    assign u1_m0_wo0_wi1_r0_delayr18_q = $unsigned(u1_m0_wo0_wi1_r0_delayr17_q);

    // u1_m0_wo0_wi1_r0_delayr17(DELAY,241)@10
    assign u1_m0_wo0_wi1_r0_delayr17_q = $unsigned(u1_m0_wo0_wi1_r0_delayr16_q);

    // u1_m0_wo0_wi1_r0_delayr16(DELAY,240)@10
    assign u1_m0_wo0_wi1_r0_delayr16_q = $unsigned(u1_m0_wo0_wi1_r0_delayr15_q);

    // u1_m0_wo0_wi1_r0_delayr15(DELAY,239)@10
    assign u1_m0_wo0_wi1_r0_delayr15_q = $unsigned(u1_m0_wo0_wi1_r0_delayr14_q);

    // u1_m0_wo0_wi1_r0_delayr14(DELAY,238)@10
    assign u1_m0_wo0_wi1_r0_delayr14_q = $unsigned(u1_m0_wo0_wi1_r0_delayr13_q);

    // u1_m0_wo0_wi1_r0_delayr13(DELAY,237)@10
    assign u1_m0_wo0_wi1_r0_delayr13_q = $unsigned(u1_m0_wo0_wi1_r0_delayr12_q);

    // u1_m0_wo0_wi1_r0_delayr12(DELAY,236)@10
    assign u1_m0_wo0_wi1_r0_delayr12_q = $unsigned(u1_m0_wo0_wi1_r0_delayr11_q);

    // u1_m0_wo0_wi1_r0_delayr11(DELAY,235)@10
    assign u1_m0_wo0_wi1_r0_delayr11_q = $unsigned(u1_m0_wo0_wi1_r0_delayr10_q);

    // u1_m0_wo0_wi1_r0_delayr10(DELAY,234)@10
    assign u1_m0_wo0_wi1_r0_delayr10_q = $unsigned(u1_m0_wo0_wi1_r0_delayr9_q);

    // u1_m0_wo0_wi1_r0_delayr9(DELAY,233)@10
    assign u1_m0_wo0_wi1_r0_delayr9_q = $unsigned(u1_m0_wo0_wi1_r0_delayr8_q);

    // u1_m0_wo0_wi1_r0_delayr8(DELAY,232)@10
    assign u1_m0_wo0_wi1_r0_delayr8_q = $unsigned(u1_m0_wo0_wi1_r0_delayr7_q);

    // u1_m0_wo0_wi1_r0_delayr7(DELAY,231)@10
    assign u1_m0_wo0_wi1_r0_delayr7_q = $unsigned(u1_m0_wo0_wi1_r0_delayr6_q);

    // u1_m0_wo0_wi1_r0_delayr6(DELAY,230)@10
    assign u1_m0_wo0_wi1_r0_delayr6_q = $unsigned(u1_m0_wo0_wi1_r0_delayr5_q);

    // u1_m0_wo0_wi1_r0_delayr5(DELAY,229)@10
    assign u1_m0_wo0_wi1_r0_delayr5_q = $unsigned(u1_m0_wo0_wi1_r0_delayr4_q);

    // u1_m0_wo0_wi1_r0_delayr4(DELAY,228)@10
    assign u1_m0_wo0_wi1_r0_delayr4_q = $unsigned(u1_m0_wo0_wi1_r0_delayr3_q);

    // u1_m0_wo0_wi1_r0_delayr3(DELAY,227)@10
    assign u1_m0_wo0_wi1_r0_delayr3_q = $unsigned(u1_m0_wo0_wi1_r0_delayr2_q);

    // u1_m0_wo0_wi1_r0_delayr2(DELAY,226)@10
    assign u1_m0_wo0_wi1_r0_delayr2_q = $unsigned(u1_m0_wo0_wi1_r0_phasedelay1_q);

    // u1_m0_wo0_wi1_r0_delayr1_notEnable(LOGICAL,610)@10
    assign u1_m0_wo0_wi1_r0_delayr1_notEnable_q = $unsigned(~ (xIn_v));

    // u1_m0_wo0_wi1_r0_delayr1_nor(LOGICAL,611)@10
    assign u1_m0_wo0_wi1_r0_delayr1_nor_q = ~ (u1_m0_wo0_wi1_r0_delayr1_notEnable_q | u1_m0_wo0_wi1_r0_delayr1_sticky_ena_q);

    // u1_m0_wo0_wi1_r0_delayr1_mem_last(CONSTANT,607)
    assign u1_m0_wo0_wi1_r0_delayr1_mem_last_q = $unsigned(6'b010001);

    // u1_m0_wo0_wi1_r0_delayr1_cmp(LOGICAL,608)@10
    assign u1_m0_wo0_wi1_r0_delayr1_cmp_b = {1'b0, u1_m0_wo0_wi1_r0_delayr1_rdmux_q};
    assign u1_m0_wo0_wi1_r0_delayr1_cmp_q = $unsigned(u1_m0_wo0_wi1_r0_delayr1_mem_last_q == u1_m0_wo0_wi1_r0_delayr1_cmp_b ? 1'b1 : 1'b0);

    // u1_m0_wo0_wi1_r0_delayr1_cmpReg(REG,609)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi1_r0_delayr1_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u1_m0_wo0_wi1_r0_delayr1_cmpReg_q <= $unsigned(u1_m0_wo0_wi1_r0_delayr1_cmp_q);
        end
    end

    // u1_m0_wo0_wi1_r0_delayr1_sticky_ena(REG,612)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi1_r0_delayr1_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u1_m0_wo0_wi1_r0_delayr1_nor_q == 1'b1)
        begin
            u1_m0_wo0_wi1_r0_delayr1_sticky_ena_q <= $unsigned(u1_m0_wo0_wi1_r0_delayr1_cmpReg_q);
        end
    end

    // u1_m0_wo0_wi1_r0_delayr1_enaAnd(LOGICAL,613)@10
    assign u1_m0_wo0_wi1_r0_delayr1_enaAnd_q = u1_m0_wo0_wi1_r0_delayr1_sticky_ena_q & xIn_v;

    // u1_m0_wo0_wi1_r0_delayr1_rdcnt(COUNTER,604)@10 + 1
    // low=0, high=18, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi1_r0_delayr1_rdcnt_i <= 5'd0;
            u1_m0_wo0_wi1_r0_delayr1_rdcnt_eq <= 1'b0;
        end
        else if (xIn_v == 1'b1)
        begin
            if (u1_m0_wo0_wi1_r0_delayr1_rdcnt_i == 5'd17)
            begin
                u1_m0_wo0_wi1_r0_delayr1_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi1_r0_delayr1_rdcnt_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi1_r0_delayr1_rdcnt_eq == 1'b1)
            begin
                u1_m0_wo0_wi1_r0_delayr1_rdcnt_i <= $unsigned(u1_m0_wo0_wi1_r0_delayr1_rdcnt_i) + $unsigned(5'd14);
            end
            else
            begin
                u1_m0_wo0_wi1_r0_delayr1_rdcnt_i <= $unsigned(u1_m0_wo0_wi1_r0_delayr1_rdcnt_i) + $unsigned(5'd1);
            end
        end
    end
    assign u1_m0_wo0_wi1_r0_delayr1_rdcnt_q = u1_m0_wo0_wi1_r0_delayr1_rdcnt_i[4:0];

    // u1_m0_wo0_wi1_r0_delayr1_rdmux(MUX,605)@10
    assign u1_m0_wo0_wi1_r0_delayr1_rdmux_s = xIn_v;
    always @(u1_m0_wo0_wi1_r0_delayr1_rdmux_s or u1_m0_wo0_wi1_r0_delayr1_wraddr_q or u1_m0_wo0_wi1_r0_delayr1_rdcnt_q)
    begin
        unique case (u1_m0_wo0_wi1_r0_delayr1_rdmux_s)
            1'b0 : u1_m0_wo0_wi1_r0_delayr1_rdmux_q = u1_m0_wo0_wi1_r0_delayr1_wraddr_q;
            1'b1 : u1_m0_wo0_wi1_r0_delayr1_rdmux_q = u1_m0_wo0_wi1_r0_delayr1_rdcnt_q;
            default : u1_m0_wo0_wi1_r0_delayr1_rdmux_q = 5'b0;
        endcase
    end

    // u1_m0_wo0_wi1_r0_delayr1_wraddr(REG,606)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi1_r0_delayr1_wraddr_q <= $unsigned(5'b10010);
        end
        else
        begin
            u1_m0_wo0_wi1_r0_delayr1_wraddr_q <= $unsigned(u1_m0_wo0_wi1_r0_delayr1_rdmux_q);
        end
    end

    // u1_m0_wo0_wi1_r0_delayr1_mem(DUALMEM,603)@10 + 2
    assign u1_m0_wo0_wi1_r0_delayr1_mem_ia = $unsigned(xIn_3);
    assign u1_m0_wo0_wi1_r0_delayr1_mem_aa = u1_m0_wo0_wi1_r0_delayr1_wraddr_q;
    assign u1_m0_wo0_wi1_r0_delayr1_mem_ab = u1_m0_wo0_wi1_r0_delayr1_rdmux_q;
    assign u1_m0_wo0_wi1_r0_delayr1_mem_ena_OrRstB = areset | u1_m0_wo0_wi1_r0_delayr1_enaAnd_q[0];
    assign u1_m0_wo0_wi1_r0_delayr1_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(5),
        .numwords_a(19),
        .width_b(16),
        .widthad_b(5),
        .numwords_b(19),
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
    ) u1_m0_wo0_wi1_r0_delayr1_mem_dmem (
        .clocken1(u1_m0_wo0_wi1_r0_delayr1_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u1_m0_wo0_wi1_r0_delayr1_mem_reset0),
        .clock1(clk),
        .address_a(u1_m0_wo0_wi1_r0_delayr1_mem_aa),
        .data_a(u1_m0_wo0_wi1_r0_delayr1_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u1_m0_wo0_wi1_r0_delayr1_mem_ab),
        .q_b(u1_m0_wo0_wi1_r0_delayr1_mem_iq),
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
    assign u1_m0_wo0_wi1_r0_delayr1_mem_q = u1_m0_wo0_wi1_r0_delayr1_mem_iq[15:0];

    // u1_m0_wo0_wi1_r0_phasedelay1(DELAY,225)@10
    assign u1_m0_wo0_wi1_r0_phasedelay1_q = $unsigned(u1_m0_wo0_wi1_r0_delayr1_mem_q);

    // u1_m0_wo0_wi0_r0_delayr0_notEnable(LOGICAL,599)@10
    assign u1_m0_wo0_wi0_r0_delayr0_notEnable_q = $unsigned(~ (xIn_v));

    // u1_m0_wo0_wi0_r0_delayr0_nor(LOGICAL,600)@10
    assign u1_m0_wo0_wi0_r0_delayr0_nor_q = ~ (u1_m0_wo0_wi0_r0_delayr0_notEnable_q | u1_m0_wo0_wi0_r0_delayr0_sticky_ena_q);

    // u1_m0_wo0_wi0_r0_delayr0_mem_last(CONSTANT,596)
    assign u1_m0_wo0_wi0_r0_delayr0_mem_last_q = $unsigned(4'b0100);

    // u1_m0_wo0_wi0_r0_delayr0_cmp(LOGICAL,597)@10
    assign u1_m0_wo0_wi0_r0_delayr0_cmp_b = {1'b0, u1_m0_wo0_wi0_r0_delayr0_rdmux_q};
    assign u1_m0_wo0_wi0_r0_delayr0_cmp_q = $unsigned(u1_m0_wo0_wi0_r0_delayr0_mem_last_q == u1_m0_wo0_wi0_r0_delayr0_cmp_b ? 1'b1 : 1'b0);

    // u1_m0_wo0_wi0_r0_delayr0_cmpReg(REG,598)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_cmp_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr0_sticky_ena(REG,601)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr0_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u1_m0_wo0_wi0_r0_delayr0_nor_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr0_sticky_ena_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_cmpReg_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr0_enaAnd(LOGICAL,602)@10
    assign u1_m0_wo0_wi0_r0_delayr0_enaAnd_q = u1_m0_wo0_wi0_r0_delayr0_sticky_ena_q & xIn_v;

    // u1_m0_wo0_wi0_r0_delayr0_rdcnt(COUNTER,593)@10 + 1
    // low=0, high=5, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr0_rdcnt_i <= 3'd0;
            u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
        end
        else if (xIn_v == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_delayr0_rdcnt_i == 3'd4)
            begin
                u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(3'd3);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(3'd1);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_delayr0_rdcnt_q = u1_m0_wo0_wi0_r0_delayr0_rdcnt_i[2:0];

    // u1_m0_wo0_wi0_r0_delayr0_rdmux(MUX,594)@10
    assign u1_m0_wo0_wi0_r0_delayr0_rdmux_s = xIn_v;
    always @(u1_m0_wo0_wi0_r0_delayr0_rdmux_s or u1_m0_wo0_wi0_r0_delayr0_wraddr_q or u1_m0_wo0_wi0_r0_delayr0_rdcnt_q)
    begin
        unique case (u1_m0_wo0_wi0_r0_delayr0_rdmux_s)
            1'b0 : u1_m0_wo0_wi0_r0_delayr0_rdmux_q = u1_m0_wo0_wi0_r0_delayr0_wraddr_q;
            1'b1 : u1_m0_wo0_wi0_r0_delayr0_rdmux_q = u1_m0_wo0_wi0_r0_delayr0_rdcnt_q;
            default : u1_m0_wo0_wi0_r0_delayr0_rdmux_q = 3'b0;
        endcase
    end

    // u1_m0_wo0_wi0_r0_delayr0_split_0_nor(LOGICAL,677)@10
    assign u1_m0_wo0_wi0_r0_delayr0_split_0_nor_q = ~ (u1_m0_wo0_wi0_r0_delayr0_notEnable_q | u1_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q);

    // u1_m0_wo0_wi0_r0_delayr0_split_0_mem_last(CONSTANT,673)
    assign u1_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q = $unsigned(6'b011110);

    // u1_m0_wo0_wi0_r0_delayr0_split_0_cmp(LOGICAL,674)@10
    assign u1_m0_wo0_wi0_r0_delayr0_split_0_cmp_b = {1'b0, u1_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q};
    assign u1_m0_wo0_wi0_r0_delayr0_split_0_cmp_q = $unsigned(u1_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q == u1_m0_wo0_wi0_r0_delayr0_split_0_cmp_b ? 1'b1 : 1'b0);

    // u1_m0_wo0_wi0_r0_delayr0_split_0_cmpReg(REG,675)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_split_0_cmp_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena(REG,678)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u1_m0_wo0_wi0_r0_delayr0_split_0_nor_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr0_split_0_enaAnd(LOGICAL,679)@10
    assign u1_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q = u1_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q & xIn_v;

    // u1_m0_wo0_wi0_r0_delayr0_split_0_rdcnt(COUNTER,670)@10 + 1
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i <= 5'd0;
        end
        else if (xIn_v == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i) + $unsigned(5'd1);
        end
    end
    assign u1_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q = u1_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i[4:0];

    // u1_m0_wo0_wi0_r0_delayr0_split_0_rdmux(MUX,671)@10
    assign u1_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s = xIn_v;
    always @(u1_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s or u1_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q or u1_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q)
    begin
        unique case (u1_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s)
            1'b0 : u1_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = u1_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
            1'b1 : u1_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = u1_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q;
            default : u1_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = 5'b0;
        endcase
    end

    // u1_m0_wo0_wi0_r0_delayr0_split_0_wraddr(REG,672)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q <= $unsigned(5'b11111);
        end
        else
        begin
            u1_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr0_split_0_mem(DUALMEM,669)@10 + 2
    assign u1_m0_wo0_wi0_r0_delayr0_split_0_mem_ia = $unsigned(xIn_2);
    assign u1_m0_wo0_wi0_r0_delayr0_split_0_mem_aa = u1_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
    assign u1_m0_wo0_wi0_r0_delayr0_split_0_mem_ab = u1_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q;
    assign u1_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB = areset | u1_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q[0];
    assign u1_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(16),
        .widthad_b(5),
        .numwords_b(32),
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
    ) u1_m0_wo0_wi0_r0_delayr0_split_0_mem_dmem (
        .clocken1(u1_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u1_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0),
        .clock1(clk),
        .address_a(u1_m0_wo0_wi0_r0_delayr0_split_0_mem_aa),
        .data_a(u1_m0_wo0_wi0_r0_delayr0_split_0_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u1_m0_wo0_wi0_r0_delayr0_split_0_mem_ab),
        .q_b(u1_m0_wo0_wi0_r0_delayr0_split_0_mem_iq),
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
    assign u1_m0_wo0_wi0_r0_delayr0_split_0_mem_q = u1_m0_wo0_wi0_r0_delayr0_split_0_mem_iq[15:0];

    // u1_m0_wo0_wi0_r0_delayr0_wraddr(REG,595)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(3'b101);
        end
        else
        begin
            u1_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_rdmux_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr0_mem(DUALMEM,592)@10 + 2
    assign u1_m0_wo0_wi0_r0_delayr0_mem_ia = $unsigned(u1_m0_wo0_wi0_r0_delayr0_split_0_mem_q);
    assign u1_m0_wo0_wi0_r0_delayr0_mem_aa = u1_m0_wo0_wi0_r0_delayr0_wraddr_q;
    assign u1_m0_wo0_wi0_r0_delayr0_mem_ab = u1_m0_wo0_wi0_r0_delayr0_rdmux_q;
    assign u1_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB = areset | u1_m0_wo0_wi0_r0_delayr0_enaAnd_q[0];
    assign u1_m0_wo0_wi0_r0_delayr0_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(3),
        .numwords_a(6),
        .width_b(16),
        .widthad_b(3),
        .numwords_b(6),
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
    ) u1_m0_wo0_wi0_r0_delayr0_mem_dmem (
        .clocken1(u1_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u1_m0_wo0_wi0_r0_delayr0_mem_reset0),
        .clock1(clk),
        .address_a(u1_m0_wo0_wi0_r0_delayr0_mem_aa),
        .data_a(u1_m0_wo0_wi0_r0_delayr0_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u1_m0_wo0_wi0_r0_delayr0_mem_ab),
        .q_b(u1_m0_wo0_wi0_r0_delayr0_mem_iq),
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
    assign u1_m0_wo0_wi0_r0_delayr0_mem_q = u1_m0_wo0_wi0_r0_delayr0_mem_iq[15:0];

    // u1_m0_wo0_wi0_r0_phasedelay0(DELAY,180)@10
    assign u1_m0_wo0_wi0_r0_phasedelay0_q = $unsigned(u1_m0_wo0_wi0_r0_delayr0_mem_q);

    // u1_m0_wo0_wi0_sym_add0_assign_id25(DELAY,561)@10
    assign u1_m0_wo0_wi0_sym_add0_assign_id25_q = $unsigned(u1_m0_wo0_wi0_r0_phasedelay0_q);

    // u1_m0_wo0_cma0(CHAINMULTADD,287)@10 + 5
    assign u1_m0_wo0_cma0_reset = areset;
    assign u1_m0_wo0_cma0_ena0 = xIn_v[0] | u1_m0_wo0_cma0_reset;
    assign u1_m0_wo0_cma0_ena1 = d_u0_m0_wo0_compute_q_13_q[0] | u1_m0_wo0_cma0_reset;
    assign u1_m0_wo0_cma0_ena2 = 1'b1;

    assign u1_m0_wo0_cma0_a0 = $unsigned($signed({15'b000000000000000, GND_q[0:0]}));
    assign u1_m0_wo0_cma0_b0 = $unsigned(u1_m0_wo0_wi0_sym_add0_assign_id25_q);
    assign u1_m0_wo0_cma0_c0 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b1 = $unsigned(u1_m0_wo0_wi1_r0_phasedelay1_q);
    assign u1_m0_wo0_cma0_c1 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b2 = $unsigned(u1_m0_wo0_wi1_r0_delayr2_q);
    assign u1_m0_wo0_cma0_c2 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b3 = $unsigned(u1_m0_wo0_wi1_r0_delayr3_q);
    assign u1_m0_wo0_cma0_c3 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b4 = $unsigned(u1_m0_wo0_wi1_r0_delayr4_q);
    assign u1_m0_wo0_cma0_c4 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b5 = $unsigned(u1_m0_wo0_wi1_r0_delayr5_q);
    assign u1_m0_wo0_cma0_c5 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b6 = $unsigned(u1_m0_wo0_wi1_r0_delayr6_q);
    assign u1_m0_wo0_cma0_c6 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b7 = $unsigned(u1_m0_wo0_wi1_r0_delayr7_q);
    assign u1_m0_wo0_cma0_c7 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b8 = $unsigned(u1_m0_wo0_wi1_r0_delayr8_q);
    assign u1_m0_wo0_cma0_c8 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b9 = $unsigned(u1_m0_wo0_wi1_r0_delayr9_q);
    assign u1_m0_wo0_cma0_c9 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b10 = $unsigned(u1_m0_wo0_wi1_r0_delayr10_q);
    assign u1_m0_wo0_cma0_c10 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b11 = $unsigned(u1_m0_wo0_wi1_r0_delayr11_q);
    assign u1_m0_wo0_cma0_c11 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b12 = $unsigned(u1_m0_wo0_wi1_r0_delayr12_q);
    assign u1_m0_wo0_cma0_c12 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b13 = $unsigned(u1_m0_wo0_wi1_r0_delayr13_q);
    assign u1_m0_wo0_cma0_c13 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b14 = $unsigned(u1_m0_wo0_wi1_r0_delayr14_q);
    assign u1_m0_wo0_cma0_c14 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b15 = $unsigned(u1_m0_wo0_wi1_r0_delayr15_q);
    assign u1_m0_wo0_cma0_c15 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b16 = $unsigned(u1_m0_wo0_wi1_r0_delayr16_q);
    assign u1_m0_wo0_cma0_c16 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b17 = $unsigned(u1_m0_wo0_wi1_r0_delayr17_q);
    assign u1_m0_wo0_cma0_c17 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b18 = $unsigned(u1_m0_wo0_wi1_r0_delayr18_q);
    assign u1_m0_wo0_cma0_c18 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_b19 = $unsigned(u1_m0_wo0_wi1_r0_delayr19_q);
    assign u1_m0_wo0_cma0_c19 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_a20 = $unsigned(u1_m0_wo0_wi1_r0_delayr21_q);
    assign u1_m0_wo0_cma0_b20 = $unsigned(u1_m0_wo0_wi1_r0_delayr20_q);
    assign u1_m0_wo0_cma0_c20 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo0_cma0_a21 = 16'b0;
    assign u1_m0_wo0_cma0_b21 = 16'b0;
    assign u1_m0_wo0_cma0_c21 = 3'b0;
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_b_0(10407),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo0_cma0_DSP10 (
        .clk(clk),
        .ena({ u1_m0_wo0_cma0_ena2, u1_m0_wo0_cma0_ena1, u1_m0_wo0_cma0_ena0 }),
        .clr({ u1_m0_wo0_cma0_reset, u1_m0_wo0_cma0_reset }),
        .ay(u1_m0_wo0_cma0_a21),
        .by(u1_m0_wo0_cma0_a20),
        .scanout(u1_m0_wo0_cma0_d20),
        .az(u1_m0_wo0_cma0_b21),
        .bz(u1_m0_wo0_cma0_b20),
        .coefsela(u1_m0_wo0_cma0_c21),
        .coefselb(u1_m0_wo0_cma0_c20),
        .chainout(u1_m0_wo0_cma0_s20),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .bx(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .chainin(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-3409),
        .coef_b_0(1973),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo0_cma0_DSP9 (
        .clk(clk),
        .ena({ u1_m0_wo0_cma0_ena2, u1_m0_wo0_cma0_ena1, u1_m0_wo0_cma0_ena0 }),
        .clr({ u1_m0_wo0_cma0_reset, u1_m0_wo0_cma0_reset }),
        .scanin(u1_m0_wo0_cma0_d20),
        .scanout(u1_m0_wo0_cma0_d18),
        .az(u1_m0_wo0_cma0_b19),
        .bz(u1_m0_wo0_cma0_b18),
        .coefsela(u1_m0_wo0_cma0_c19),
        .coefselb(u1_m0_wo0_cma0_c18),
        .chainin(u1_m0_wo0_cma0_s20),
        .chainout(u1_m0_wo0_cma0_s18),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-1336),
        .coef_b_0(966),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo0_cma0_DSP8 (
        .clk(clk),
        .ena({ u1_m0_wo0_cma0_ena2, u1_m0_wo0_cma0_ena1, u1_m0_wo0_cma0_ena0 }),
        .clr({ u1_m0_wo0_cma0_reset, u1_m0_wo0_cma0_reset }),
        .scanin(u1_m0_wo0_cma0_d18),
        .scanout(u1_m0_wo0_cma0_d16),
        .az(u1_m0_wo0_cma0_b17),
        .bz(u1_m0_wo0_cma0_b16),
        .coefsela(u1_m0_wo0_cma0_c17),
        .coefselb(u1_m0_wo0_cma0_c16),
        .chainin(u1_m0_wo0_cma0_s18),
        .chainout(u1_m0_wo0_cma0_s16),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-722),
        .coef_b_0(546),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo0_cma0_DSP7 (
        .clk(clk),
        .ena({ u1_m0_wo0_cma0_ena2, u1_m0_wo0_cma0_ena1, u1_m0_wo0_cma0_ena0 }),
        .clr({ u1_m0_wo0_cma0_reset, u1_m0_wo0_cma0_reset }),
        .scanin(u1_m0_wo0_cma0_d16),
        .scanout(u1_m0_wo0_cma0_d14),
        .az(u1_m0_wo0_cma0_b15),
        .bz(u1_m0_wo0_cma0_b14),
        .coefsela(u1_m0_wo0_cma0_c15),
        .coefselb(u1_m0_wo0_cma0_c14),
        .chainin(u1_m0_wo0_cma0_s16),
        .chainout(u1_m0_wo0_cma0_s14),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-416),
        .coef_b_0(314),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo0_cma0_DSP6 (
        .clk(clk),
        .ena({ u1_m0_wo0_cma0_ena2, u1_m0_wo0_cma0_ena1, u1_m0_wo0_cma0_ena0 }),
        .clr({ u1_m0_wo0_cma0_reset, u1_m0_wo0_cma0_reset }),
        .scanin(u1_m0_wo0_cma0_d14),
        .scanout(u1_m0_wo0_cma0_d12),
        .az(u1_m0_wo0_cma0_b13),
        .bz(u1_m0_wo0_cma0_b12),
        .coefsela(u1_m0_wo0_cma0_c13),
        .coefselb(u1_m0_wo0_cma0_c12),
        .chainin(u1_m0_wo0_cma0_s14),
        .chainout(u1_m0_wo0_cma0_s12),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-237),
        .coef_b_0(174),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo0_cma0_DSP5 (
        .clk(clk),
        .ena({ u1_m0_wo0_cma0_ena2, u1_m0_wo0_cma0_ena1, u1_m0_wo0_cma0_ena0 }),
        .clr({ u1_m0_wo0_cma0_reset, u1_m0_wo0_cma0_reset }),
        .scanin(u1_m0_wo0_cma0_d12),
        .scanout(u1_m0_wo0_cma0_d10),
        .az(u1_m0_wo0_cma0_b11),
        .bz(u1_m0_wo0_cma0_b10),
        .coefsela(u1_m0_wo0_cma0_c11),
        .coefselb(u1_m0_wo0_cma0_c10),
        .chainin(u1_m0_wo0_cma0_s12),
        .chainout(u1_m0_wo0_cma0_s10),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-128),
        .coef_b_0(90),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo0_cma0_DSP4 (
        .clk(clk),
        .ena({ u1_m0_wo0_cma0_ena2, u1_m0_wo0_cma0_ena1, u1_m0_wo0_cma0_ena0 }),
        .clr({ u1_m0_wo0_cma0_reset, u1_m0_wo0_cma0_reset }),
        .scanin(u1_m0_wo0_cma0_d10),
        .scanout(u1_m0_wo0_cma0_d8),
        .az(u1_m0_wo0_cma0_b9),
        .bz(u1_m0_wo0_cma0_b8),
        .coefsela(u1_m0_wo0_cma0_c9),
        .coefselb(u1_m0_wo0_cma0_c8),
        .chainin(u1_m0_wo0_cma0_s10),
        .chainout(u1_m0_wo0_cma0_s8),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-63),
        .coef_b_0(42),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo0_cma0_DSP3 (
        .clk(clk),
        .ena({ u1_m0_wo0_cma0_ena2, u1_m0_wo0_cma0_ena1, u1_m0_wo0_cma0_ena0 }),
        .clr({ u1_m0_wo0_cma0_reset, u1_m0_wo0_cma0_reset }),
        .scanin(u1_m0_wo0_cma0_d8),
        .scanout(u1_m0_wo0_cma0_d6),
        .az(u1_m0_wo0_cma0_b7),
        .bz(u1_m0_wo0_cma0_b6),
        .coefsela(u1_m0_wo0_cma0_c7),
        .coefselb(u1_m0_wo0_cma0_c6),
        .chainin(u1_m0_wo0_cma0_s8),
        .chainout(u1_m0_wo0_cma0_s6),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-28),
        .coef_b_0(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo0_cma0_DSP2 (
        .clk(clk),
        .ena({ u1_m0_wo0_cma0_ena2, u1_m0_wo0_cma0_ena1, u1_m0_wo0_cma0_ena0 }),
        .clr({ u1_m0_wo0_cma0_reset, u1_m0_wo0_cma0_reset }),
        .scanin(u1_m0_wo0_cma0_d6),
        .scanout(u1_m0_wo0_cma0_d4),
        .az(u1_m0_wo0_cma0_b5),
        .bz(u1_m0_wo0_cma0_b4),
        .coefsela(u1_m0_wo0_cma0_c5),
        .coefselb(u1_m0_wo0_cma0_c4),
        .chainin(u1_m0_wo0_cma0_s6),
        .chainout(u1_m0_wo0_cma0_s4),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-10),
        .coef_b_0(4),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo0_cma0_DSP1 (
        .clk(clk),
        .ena({ u1_m0_wo0_cma0_ena2, u1_m0_wo0_cma0_ena1, u1_m0_wo0_cma0_ena0 }),
        .clr({ u1_m0_wo0_cma0_reset, u1_m0_wo0_cma0_reset }),
        .scanin(u1_m0_wo0_cma0_d4),
        .scanout(u1_m0_wo0_cma0_d2),
        .az(u1_m0_wo0_cma0_b3),
        .bz(u1_m0_wo0_cma0_b2),
        .coefsela(u1_m0_wo0_cma0_c3),
        .coefselb(u1_m0_wo0_cma0_c2),
        .chainin(u1_m0_wo0_cma0_s4),
        .chainout(u1_m0_wo0_cma0_s2),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-3),
        .coef_b_0(16384),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1"),
        .result_a_width(38)
    ) u1_m0_wo0_cma0_DSP0 (
        .clk(clk),
        .ena({ u1_m0_wo0_cma0_ena2, u1_m0_wo0_cma0_ena1, u1_m0_wo0_cma0_ena0 }),
        .clr({ u1_m0_wo0_cma0_reset, u1_m0_wo0_cma0_reset }),
        .scanin(u1_m0_wo0_cma0_d2),
        .by(u1_m0_wo0_cma0_a0),
        .az(u1_m0_wo0_cma0_b1),
        .bz(u1_m0_wo0_cma0_b0),
        .coefsela(u1_m0_wo0_cma0_c1),
        .coefselb(u1_m0_wo0_cma0_c0),
        .chainin(u1_m0_wo0_cma0_s2),
        .resulta(u1_m0_wo0_cma0_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanout(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(38), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u1_m0_wo0_cma0_delay0 ( .xin(u1_m0_wo0_cma0_s0), .xout(u1_m0_wo0_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u1_m0_wo0_cma0_q = $unsigned(u1_m0_wo0_cma0_qq0[37:0]);

    // u0_m0_wo0_wi1_r0_delayr20(DELAY,94)@10
    assign u0_m0_wo0_wi1_r0_delayr20_q = $unsigned(u0_m0_wo0_wi1_r0_delayr19_q);

    // u0_m0_wo0_wi1_r0_delayr21(DELAY,95)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi1_r0_delayr21_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi1_r0_delayr21_q <= $unsigned(u0_m0_wo0_wi1_r0_delayr20_q);
        end
    end

    // u0_m0_wo0_wi1_r0_delayr19(DELAY,93)@10
    assign u0_m0_wo0_wi1_r0_delayr19_q = $unsigned(u0_m0_wo0_wi1_r0_delayr18_q);

    // u0_m0_wo0_wi1_r0_delayr18(DELAY,92)@10
    assign u0_m0_wo0_wi1_r0_delayr18_q = $unsigned(u0_m0_wo0_wi1_r0_delayr17_q);

    // u0_m0_wo0_wi1_r0_delayr17(DELAY,91)@10
    assign u0_m0_wo0_wi1_r0_delayr17_q = $unsigned(u0_m0_wo0_wi1_r0_delayr16_q);

    // u0_m0_wo0_wi1_r0_delayr16(DELAY,90)@10
    assign u0_m0_wo0_wi1_r0_delayr16_q = $unsigned(u0_m0_wo0_wi1_r0_delayr15_q);

    // u0_m0_wo0_wi1_r0_delayr15(DELAY,89)@10
    assign u0_m0_wo0_wi1_r0_delayr15_q = $unsigned(u0_m0_wo0_wi1_r0_delayr14_q);

    // u0_m0_wo0_wi1_r0_delayr14(DELAY,88)@10
    assign u0_m0_wo0_wi1_r0_delayr14_q = $unsigned(u0_m0_wo0_wi1_r0_delayr13_q);

    // u0_m0_wo0_wi1_r0_delayr13(DELAY,87)@10
    assign u0_m0_wo0_wi1_r0_delayr13_q = $unsigned(u0_m0_wo0_wi1_r0_delayr12_q);

    // u0_m0_wo0_wi1_r0_delayr12(DELAY,86)@10
    assign u0_m0_wo0_wi1_r0_delayr12_q = $unsigned(u0_m0_wo0_wi1_r0_delayr11_q);

    // u0_m0_wo0_wi1_r0_delayr11(DELAY,85)@10
    assign u0_m0_wo0_wi1_r0_delayr11_q = $unsigned(u0_m0_wo0_wi1_r0_delayr10_q);

    // u0_m0_wo0_wi1_r0_delayr10(DELAY,84)@10
    assign u0_m0_wo0_wi1_r0_delayr10_q = $unsigned(u0_m0_wo0_wi1_r0_delayr9_q);

    // u0_m0_wo0_wi1_r0_delayr9(DELAY,83)@10
    assign u0_m0_wo0_wi1_r0_delayr9_q = $unsigned(u0_m0_wo0_wi1_r0_delayr8_q);

    // u0_m0_wo0_wi1_r0_delayr8(DELAY,82)@10
    assign u0_m0_wo0_wi1_r0_delayr8_q = $unsigned(u0_m0_wo0_wi1_r0_delayr7_q);

    // u0_m0_wo0_wi1_r0_delayr7(DELAY,81)@10
    assign u0_m0_wo0_wi1_r0_delayr7_q = $unsigned(u0_m0_wo0_wi1_r0_delayr6_q);

    // u0_m0_wo0_wi1_r0_delayr6(DELAY,80)@10
    assign u0_m0_wo0_wi1_r0_delayr6_q = $unsigned(u0_m0_wo0_wi1_r0_delayr5_q);

    // u0_m0_wo0_wi1_r0_delayr5(DELAY,79)@10
    assign u0_m0_wo0_wi1_r0_delayr5_q = $unsigned(u0_m0_wo0_wi1_r0_delayr4_q);

    // u0_m0_wo0_wi1_r0_delayr4(DELAY,78)@10
    assign u0_m0_wo0_wi1_r0_delayr4_q = $unsigned(u0_m0_wo0_wi1_r0_delayr3_q);

    // u0_m0_wo0_wi1_r0_delayr3(DELAY,77)@10
    assign u0_m0_wo0_wi1_r0_delayr3_q = $unsigned(u0_m0_wo0_wi1_r0_delayr2_q);

    // u0_m0_wo0_wi1_r0_delayr2(DELAY,76)@10
    assign u0_m0_wo0_wi1_r0_delayr2_q = $unsigned(u0_m0_wo0_wi1_r0_phasedelay1_q);

    // u0_m0_wo0_wi1_r0_delayr1_notEnable(LOGICAL,588)@10
    assign u0_m0_wo0_wi1_r0_delayr1_notEnable_q = $unsigned(~ (xIn_v));

    // u0_m0_wo0_wi1_r0_delayr1_nor(LOGICAL,589)@10
    assign u0_m0_wo0_wi1_r0_delayr1_nor_q = ~ (u0_m0_wo0_wi1_r0_delayr1_notEnable_q | u0_m0_wo0_wi1_r0_delayr1_sticky_ena_q);

    // u0_m0_wo0_wi1_r0_delayr1_mem_last(CONSTANT,585)
    assign u0_m0_wo0_wi1_r0_delayr1_mem_last_q = $unsigned(6'b010001);

    // u0_m0_wo0_wi1_r0_delayr1_cmp(LOGICAL,586)@10
    assign u0_m0_wo0_wi1_r0_delayr1_cmp_b = {1'b0, u0_m0_wo0_wi1_r0_delayr1_rdmux_q};
    assign u0_m0_wo0_wi1_r0_delayr1_cmp_q = $unsigned(u0_m0_wo0_wi1_r0_delayr1_mem_last_q == u0_m0_wo0_wi1_r0_delayr1_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi1_r0_delayr1_cmpReg(REG,587)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi1_r0_delayr1_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi1_r0_delayr1_cmpReg_q <= $unsigned(u0_m0_wo0_wi1_r0_delayr1_cmp_q);
        end
    end

    // u0_m0_wo0_wi1_r0_delayr1_sticky_ena(REG,590)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi1_r0_delayr1_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi1_r0_delayr1_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi1_r0_delayr1_sticky_ena_q <= $unsigned(u0_m0_wo0_wi1_r0_delayr1_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi1_r0_delayr1_enaAnd(LOGICAL,591)@10
    assign u0_m0_wo0_wi1_r0_delayr1_enaAnd_q = u0_m0_wo0_wi1_r0_delayr1_sticky_ena_q & xIn_v;

    // u0_m0_wo0_wi1_r0_delayr1_rdcnt(COUNTER,582)@10 + 1
    // low=0, high=18, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi1_r0_delayr1_rdcnt_i <= 5'd0;
            u0_m0_wo0_wi1_r0_delayr1_rdcnt_eq <= 1'b0;
        end
        else if (xIn_v == 1'b1)
        begin
            if (u0_m0_wo0_wi1_r0_delayr1_rdcnt_i == 5'd17)
            begin
                u0_m0_wo0_wi1_r0_delayr1_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi1_r0_delayr1_rdcnt_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi1_r0_delayr1_rdcnt_eq == 1'b1)
            begin
                u0_m0_wo0_wi1_r0_delayr1_rdcnt_i <= $unsigned(u0_m0_wo0_wi1_r0_delayr1_rdcnt_i) + $unsigned(5'd14);
            end
            else
            begin
                u0_m0_wo0_wi1_r0_delayr1_rdcnt_i <= $unsigned(u0_m0_wo0_wi1_r0_delayr1_rdcnt_i) + $unsigned(5'd1);
            end
        end
    end
    assign u0_m0_wo0_wi1_r0_delayr1_rdcnt_q = u0_m0_wo0_wi1_r0_delayr1_rdcnt_i[4:0];

    // u0_m0_wo0_wi1_r0_delayr1_rdmux(MUX,583)@10
    assign u0_m0_wo0_wi1_r0_delayr1_rdmux_s = xIn_v;
    always @(u0_m0_wo0_wi1_r0_delayr1_rdmux_s or u0_m0_wo0_wi1_r0_delayr1_wraddr_q or u0_m0_wo0_wi1_r0_delayr1_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi1_r0_delayr1_rdmux_s)
            1'b0 : u0_m0_wo0_wi1_r0_delayr1_rdmux_q = u0_m0_wo0_wi1_r0_delayr1_wraddr_q;
            1'b1 : u0_m0_wo0_wi1_r0_delayr1_rdmux_q = u0_m0_wo0_wi1_r0_delayr1_rdcnt_q;
            default : u0_m0_wo0_wi1_r0_delayr1_rdmux_q = 5'b0;
        endcase
    end

    // u0_m0_wo0_wi1_r0_delayr1_wraddr(REG,584)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi1_r0_delayr1_wraddr_q <= $unsigned(5'b10010);
        end
        else
        begin
            u0_m0_wo0_wi1_r0_delayr1_wraddr_q <= $unsigned(u0_m0_wo0_wi1_r0_delayr1_rdmux_q);
        end
    end

    // u0_m0_wo0_wi1_r0_delayr1_mem(DUALMEM,581)@10 + 2
    assign u0_m0_wo0_wi1_r0_delayr1_mem_ia = $unsigned(xIn_1);
    assign u0_m0_wo0_wi1_r0_delayr1_mem_aa = u0_m0_wo0_wi1_r0_delayr1_wraddr_q;
    assign u0_m0_wo0_wi1_r0_delayr1_mem_ab = u0_m0_wo0_wi1_r0_delayr1_rdmux_q;
    assign u0_m0_wo0_wi1_r0_delayr1_mem_ena_OrRstB = areset | u0_m0_wo0_wi1_r0_delayr1_enaAnd_q[0];
    assign u0_m0_wo0_wi1_r0_delayr1_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(5),
        .numwords_a(19),
        .width_b(16),
        .widthad_b(5),
        .numwords_b(19),
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
    ) u0_m0_wo0_wi1_r0_delayr1_mem_dmem (
        .clocken1(u0_m0_wo0_wi1_r0_delayr1_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi1_r0_delayr1_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi1_r0_delayr1_mem_aa),
        .data_a(u0_m0_wo0_wi1_r0_delayr1_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u0_m0_wo0_wi1_r0_delayr1_mem_ab),
        .q_b(u0_m0_wo0_wi1_r0_delayr1_mem_iq),
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
    assign u0_m0_wo0_wi1_r0_delayr1_mem_q = u0_m0_wo0_wi1_r0_delayr1_mem_iq[15:0];

    // u0_m0_wo0_wi1_r0_phasedelay1(DELAY,75)@10
    assign u0_m0_wo0_wi1_r0_phasedelay1_q = $unsigned(u0_m0_wo0_wi1_r0_delayr1_mem_q);

    // u0_m0_wo0_wi0_r0_delayr0_notEnable(LOGICAL,577)@10
    assign u0_m0_wo0_wi0_r0_delayr0_notEnable_q = $unsigned(~ (xIn_v));

    // u0_m0_wo0_wi0_r0_delayr0_nor(LOGICAL,578)@10
    assign u0_m0_wo0_wi0_r0_delayr0_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr0_notEnable_q | u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr0_mem_last(CONSTANT,574)
    assign u0_m0_wo0_wi0_r0_delayr0_mem_last_q = $unsigned(4'b0100);

    // u0_m0_wo0_wi0_r0_delayr0_cmp(LOGICAL,575)@10
    assign u0_m0_wo0_wi0_r0_delayr0_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr0_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr0_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr0_mem_last_q == u0_m0_wo0_wi0_r0_delayr0_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr0_cmpReg(REG,576)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_sticky_ena(REG,579)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr0_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_enaAnd(LOGICAL,580)@10
    assign u0_m0_wo0_wi0_r0_delayr0_enaAnd_q = u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q & xIn_v;

    // u0_m0_wo0_wi0_r0_delayr0_rdcnt(COUNTER,571)@10 + 1
    // low=0, high=5, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_rdcnt_i <= 3'd0;
            u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
        end
        else if (xIn_v == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_delayr0_rdcnt_i == 3'd4)
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(3'd3);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(3'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr0_rdcnt_q = u0_m0_wo0_wi0_r0_delayr0_rdcnt_i[2:0];

    // u0_m0_wo0_wi0_r0_delayr0_rdmux(MUX,572)@10
    assign u0_m0_wo0_wi0_r0_delayr0_rdmux_s = xIn_v;
    always @(u0_m0_wo0_wi0_r0_delayr0_rdmux_s or u0_m0_wo0_wi0_r0_delayr0_wraddr_q or u0_m0_wo0_wi0_r0_delayr0_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr0_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr0_rdmux_q = u0_m0_wo0_wi0_r0_delayr0_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr0_rdmux_q = u0_m0_wo0_wi0_r0_delayr0_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr0_rdmux_q = 3'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_delayr0_split_0_nor(LOGICAL,666)@10
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr0_notEnable_q | u0_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr0_split_0_mem_last(CONSTANT,662)
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q = $unsigned(6'b011110);

    // u0_m0_wo0_wi0_r0_delayr0_split_0_cmp(LOGICAL,663)@10
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q == u0_m0_wo0_wi0_r0_delayr0_split_0_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr0_split_0_cmpReg(REG,664)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_split_0_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena(REG,667)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr0_split_0_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_split_0_enaAnd(LOGICAL,668)@10
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q = u0_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q & xIn_v;

    // u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt(COUNTER,659)@10 + 1
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i <= 5'd0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i) + $unsigned(5'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q = u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i[4:0];

    // u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux(MUX,660)@10
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s = xIn_v;
    always @(u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s or u0_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q or u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = u0_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = 5'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_delayr0_split_0_wraddr(REG,661)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q <= $unsigned(5'b11111);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_split_0_mem(DUALMEM,658)@10 + 2
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ia = $unsigned(xIn_0);
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_mem_aa = u0_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ab = u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(16),
        .widthad_b(5),
        .numwords_b(32),
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
    ) u0_m0_wo0_wi0_r0_delayr0_split_0_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_mem_q = u0_m0_wo0_wi0_r0_delayr0_split_0_mem_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr0_wraddr(REG,573)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(3'b101);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_mem(DUALMEM,570)@10 + 2
    assign u0_m0_wo0_wi0_r0_delayr0_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_q);
    assign u0_m0_wo0_wi0_r0_delayr0_mem_aa = u0_m0_wo0_wi0_r0_delayr0_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr0_mem_ab = u0_m0_wo0_wi0_r0_delayr0_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr0_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr0_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(3),
        .numwords_a(6),
        .width_b(16),
        .widthad_b(3),
        .numwords_b(6),
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
    ) u0_m0_wo0_wi0_r0_delayr0_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr0_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr0_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr0_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr0_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr0_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr0_mem_q = u0_m0_wo0_wi0_r0_delayr0_mem_iq[15:0];

    // u0_m0_wo0_wi0_r0_phasedelay0(DELAY,30)@10
    assign u0_m0_wo0_wi0_r0_phasedelay0_q = $unsigned(u0_m0_wo0_wi0_r0_delayr0_mem_q);

    // u0_m0_wo0_wi0_sym_add0_assign_id24(DELAY,560)@10
    assign u0_m0_wo0_wi0_sym_add0_assign_id24_q = $unsigned(u0_m0_wo0_wi0_r0_phasedelay0_q);

    // u0_m0_wo0_cma0(CHAINMULTADD,161)@10 + 5
    assign u0_m0_wo0_cma0_reset = areset;
    assign u0_m0_wo0_cma0_ena0 = xIn_v[0] | u0_m0_wo0_cma0_reset;
    assign u0_m0_wo0_cma0_ena1 = d_u0_m0_wo0_compute_q_13_q[0] | u0_m0_wo0_cma0_reset;
    assign u0_m0_wo0_cma0_ena2 = 1'b1;

    assign u0_m0_wo0_cma0_a0 = $unsigned($signed({15'b000000000000000, GND_q[0:0]}));
    assign u0_m0_wo0_cma0_b0 = $unsigned(u0_m0_wo0_wi0_sym_add0_assign_id24_q);
    assign u0_m0_wo0_cma0_c0 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b1 = $unsigned(u0_m0_wo0_wi1_r0_phasedelay1_q);
    assign u0_m0_wo0_cma0_c1 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b2 = $unsigned(u0_m0_wo0_wi1_r0_delayr2_q);
    assign u0_m0_wo0_cma0_c2 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b3 = $unsigned(u0_m0_wo0_wi1_r0_delayr3_q);
    assign u0_m0_wo0_cma0_c3 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b4 = $unsigned(u0_m0_wo0_wi1_r0_delayr4_q);
    assign u0_m0_wo0_cma0_c4 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b5 = $unsigned(u0_m0_wo0_wi1_r0_delayr5_q);
    assign u0_m0_wo0_cma0_c5 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b6 = $unsigned(u0_m0_wo0_wi1_r0_delayr6_q);
    assign u0_m0_wo0_cma0_c6 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b7 = $unsigned(u0_m0_wo0_wi1_r0_delayr7_q);
    assign u0_m0_wo0_cma0_c7 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b8 = $unsigned(u0_m0_wo0_wi1_r0_delayr8_q);
    assign u0_m0_wo0_cma0_c8 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b9 = $unsigned(u0_m0_wo0_wi1_r0_delayr9_q);
    assign u0_m0_wo0_cma0_c9 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b10 = $unsigned(u0_m0_wo0_wi1_r0_delayr10_q);
    assign u0_m0_wo0_cma0_c10 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b11 = $unsigned(u0_m0_wo0_wi1_r0_delayr11_q);
    assign u0_m0_wo0_cma0_c11 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b12 = $unsigned(u0_m0_wo0_wi1_r0_delayr12_q);
    assign u0_m0_wo0_cma0_c12 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b13 = $unsigned(u0_m0_wo0_wi1_r0_delayr13_q);
    assign u0_m0_wo0_cma0_c13 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b14 = $unsigned(u0_m0_wo0_wi1_r0_delayr14_q);
    assign u0_m0_wo0_cma0_c14 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b15 = $unsigned(u0_m0_wo0_wi1_r0_delayr15_q);
    assign u0_m0_wo0_cma0_c15 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b16 = $unsigned(u0_m0_wo0_wi1_r0_delayr16_q);
    assign u0_m0_wo0_cma0_c16 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b17 = $unsigned(u0_m0_wo0_wi1_r0_delayr17_q);
    assign u0_m0_wo0_cma0_c17 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b18 = $unsigned(u0_m0_wo0_wi1_r0_delayr18_q);
    assign u0_m0_wo0_cma0_c18 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_b19 = $unsigned(u0_m0_wo0_wi1_r0_delayr19_q);
    assign u0_m0_wo0_cma0_c19 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a20 = $unsigned(u0_m0_wo0_wi1_r0_delayr21_q);
    assign u0_m0_wo0_cma0_b20 = $unsigned(u0_m0_wo0_wi1_r0_delayr20_q);
    assign u0_m0_wo0_cma0_c20 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a21 = 16'b0;
    assign u0_m0_wo0_cma0_b21 = 16'b0;
    assign u0_m0_wo0_cma0_c21 = 3'b0;
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_b_0(10407),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP10 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a21),
        .by(u0_m0_wo0_cma0_a20),
        .scanout(u0_m0_wo0_cma0_d20),
        .az(u0_m0_wo0_cma0_b21),
        .bz(u0_m0_wo0_cma0_b20),
        .coefsela(u0_m0_wo0_cma0_c21),
        .coefselb(u0_m0_wo0_cma0_c20),
        .chainout(u0_m0_wo0_cma0_s20),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .bx(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .chainin(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-3409),
        .coef_b_0(1973),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP9 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .scanin(u0_m0_wo0_cma0_d20),
        .scanout(u0_m0_wo0_cma0_d18),
        .az(u0_m0_wo0_cma0_b19),
        .bz(u0_m0_wo0_cma0_b18),
        .coefsela(u0_m0_wo0_cma0_c19),
        .coefselb(u0_m0_wo0_cma0_c18),
        .chainin(u0_m0_wo0_cma0_s20),
        .chainout(u0_m0_wo0_cma0_s18),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-1336),
        .coef_b_0(966),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP8 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .scanin(u0_m0_wo0_cma0_d18),
        .scanout(u0_m0_wo0_cma0_d16),
        .az(u0_m0_wo0_cma0_b17),
        .bz(u0_m0_wo0_cma0_b16),
        .coefsela(u0_m0_wo0_cma0_c17),
        .coefselb(u0_m0_wo0_cma0_c16),
        .chainin(u0_m0_wo0_cma0_s18),
        .chainout(u0_m0_wo0_cma0_s16),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-722),
        .coef_b_0(546),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP7 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .scanin(u0_m0_wo0_cma0_d16),
        .scanout(u0_m0_wo0_cma0_d14),
        .az(u0_m0_wo0_cma0_b15),
        .bz(u0_m0_wo0_cma0_b14),
        .coefsela(u0_m0_wo0_cma0_c15),
        .coefselb(u0_m0_wo0_cma0_c14),
        .chainin(u0_m0_wo0_cma0_s16),
        .chainout(u0_m0_wo0_cma0_s14),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-416),
        .coef_b_0(314),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP6 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .scanin(u0_m0_wo0_cma0_d14),
        .scanout(u0_m0_wo0_cma0_d12),
        .az(u0_m0_wo0_cma0_b13),
        .bz(u0_m0_wo0_cma0_b12),
        .coefsela(u0_m0_wo0_cma0_c13),
        .coefselb(u0_m0_wo0_cma0_c12),
        .chainin(u0_m0_wo0_cma0_s14),
        .chainout(u0_m0_wo0_cma0_s12),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-237),
        .coef_b_0(174),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP5 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .scanin(u0_m0_wo0_cma0_d12),
        .scanout(u0_m0_wo0_cma0_d10),
        .az(u0_m0_wo0_cma0_b11),
        .bz(u0_m0_wo0_cma0_b10),
        .coefsela(u0_m0_wo0_cma0_c11),
        .coefselb(u0_m0_wo0_cma0_c10),
        .chainin(u0_m0_wo0_cma0_s12),
        .chainout(u0_m0_wo0_cma0_s10),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-128),
        .coef_b_0(90),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP4 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .scanin(u0_m0_wo0_cma0_d10),
        .scanout(u0_m0_wo0_cma0_d8),
        .az(u0_m0_wo0_cma0_b9),
        .bz(u0_m0_wo0_cma0_b8),
        .coefsela(u0_m0_wo0_cma0_c9),
        .coefselb(u0_m0_wo0_cma0_c8),
        .chainin(u0_m0_wo0_cma0_s10),
        .chainout(u0_m0_wo0_cma0_s8),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-63),
        .coef_b_0(42),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP3 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .scanin(u0_m0_wo0_cma0_d8),
        .scanout(u0_m0_wo0_cma0_d6),
        .az(u0_m0_wo0_cma0_b7),
        .bz(u0_m0_wo0_cma0_b6),
        .coefsela(u0_m0_wo0_cma0_c7),
        .coefselb(u0_m0_wo0_cma0_c6),
        .chainin(u0_m0_wo0_cma0_s8),
        .chainout(u0_m0_wo0_cma0_s6),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-28),
        .coef_b_0(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP2 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .scanin(u0_m0_wo0_cma0_d6),
        .scanout(u0_m0_wo0_cma0_d4),
        .az(u0_m0_wo0_cma0_b5),
        .bz(u0_m0_wo0_cma0_b4),
        .coefsela(u0_m0_wo0_cma0_c5),
        .coefselb(u0_m0_wo0_cma0_c4),
        .chainin(u0_m0_wo0_cma0_s6),
        .chainout(u0_m0_wo0_cma0_s4),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(0),
        .by_use_scan_in("true"),
        .delay_scan_out_ay("true"),
        .scan_out_width(16),
        .delay_scan_out_by("true"),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-10),
        .coef_b_0(4),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP1 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .scanin(u0_m0_wo0_cma0_d4),
        .scanout(u0_m0_wo0_cma0_d2),
        .az(u0_m0_wo0_cma0_b3),
        .bz(u0_m0_wo0_cma0_b2),
        .coefsela(u0_m0_wo0_cma0_c3),
        .coefselb(u0_m0_wo0_cma0_c2),
        .chainin(u0_m0_wo0_cma0_s4),
        .chainout(u0_m0_wo0_cma0_s2),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .by(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ay_use_scan_in("true"),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(-3),
        .coef_b_0(16384),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1"),
        .result_a_width(38)
    ) u0_m0_wo0_cma0_DSP0 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .scanin(u0_m0_wo0_cma0_d2),
        .by(u0_m0_wo0_cma0_a0),
        .az(u0_m0_wo0_cma0_b1),
        .bz(u0_m0_wo0_cma0_b0),
        .coefsela(u0_m0_wo0_cma0_c1),
        .coefselb(u0_m0_wo0_cma0_c0),
        .chainin(u0_m0_wo0_cma0_s2),
        .resulta(u0_m0_wo0_cma0_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .ay(),
        .bx(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanout(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(38), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_m0_wo0_cma0_delay0 ( .xin(u0_m0_wo0_cma0_s0), .xout(u0_m0_wo0_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_m0_wo0_cma0_q = $unsigned(u0_m0_wo0_cma0_qq0[37:0]);

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // d_u0_m0_wo0_compute_q_14(DELAY,565)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_compute_q_14_q <= $unsigned(d_u0_m0_wo0_compute_q_13_q);
        end
    end

    // u0_m0_wo0_sys_delay(DELAY,162)@14
    dspba_delay_ver #( .width(1), .depth(20), .reset_kind("SYNC"), .phase(4), .modulus(1) )
    u0_m0_wo0_sys_delay ( .xin(d_u0_m0_wo0_compute_q_14_q), .xout(u0_m0_wo0_sys_delay_q), .ena(d_u0_m0_wo0_compute_q_14_q[0]), .clk(clk), .aclr(areset) );

    // u0_m0_wo0_sys_and(LOGICAL,163)@14
    assign u0_m0_wo0_sys_and_q = u0_m0_wo0_sys_delay_q & d_u0_m0_wo0_compute_q_14_q;

    // u0_m0_wo0_oseq_gated_reg(REG,164)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_oseq_gated_reg_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m0_wo0_oseq_gated_reg_q <= $unsigned(u0_m0_wo0_sys_and_q);
        end
    end

    // xOut(PORTOUT,559)@15 + 1
    assign xOut_v = u0_m0_wo0_oseq_gated_reg_q;
    assign xOut_c = {7'b0000000, GND_q};
    assign xOut_0 = {{1{u0_m0_wo0_cma0_q[37]}}, u0_m0_wo0_cma0_q};
    assign xOut_1 = {{1{u1_m0_wo0_cma0_q[37]}}, u1_m0_wo0_cma0_q};
    assign xOut_2 = {{1{u2_m0_wo0_cma0_q[37]}}, u2_m0_wo0_cma0_q};
    assign xOut_3 = {{1{u3_m0_wo0_cma0_q[37]}}, u3_m0_wo0_cma0_q};

endmodule
