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

// SystemVerilog created from ca_interp_DUT_Summer_DUC_Poly_phase_Interp_hb3_im
// SystemVerilog created on Tue Jan  7 17:04:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ca_interp_DUT_Summer_DUC_Poly_phase_Interp_hb3_im (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [15:0] xIn_0,
    input wire [15:0] xIn_1,
    input wire [15:0] xIn_2,
    input wire [15:0] xIn_3,
    output wire [0:0] xOut_v,
    output wire [7:0] xOut_c,
    output wire [37:0] xOut_0,
    output wire [37:0] xOut_1,
    output wire [37:0] xOut_2,
    output wire [37:0] xOut_3,
    output wire [37:0] xOut_4,
    output wire [37:0] xOut_5,
    output wire [37:0] xOut_6,
    output wire [37:0] xOut_7,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_15_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_15_delay_0;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_15_delay_1;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_15_delay_2;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_15_delay_3;
    reg [0:0] d_u0_m0_wo0_compute_q_13_q;
    reg [0:0] d_u0_m0_wo0_compute_q_13_delay_0;
    reg [0:0] d_u0_m0_wo0_compute_q_13_delay_1;
    reg [0:0] d_u0_m0_wo0_compute_q_14_q;
    reg [0:0] u0_m0_wo0_oseq_gated_reg_q;
    reg [15:0] u0_m0_wo1_wi0_r0_delayr20_q;
    wire u0_m0_wo1_cma0_reset;
    wire [15:0] u0_m0_wo1_cma0_a0;
    wire [15:0] u0_m0_wo1_cma0_b0;
    wire [2:0] u0_m0_wo1_cma0_c0;
    wire [15:0] u0_m0_wo1_cma0_a1;
    wire [15:0] u0_m0_wo1_cma0_b1;
    wire [2:0] u0_m0_wo1_cma0_c1;
    wire [15:0] u0_m0_wo1_cma0_a2;
    wire [15:0] u0_m0_wo1_cma0_b2;
    wire [2:0] u0_m0_wo1_cma0_c2;
    wire [15:0] u0_m0_wo1_cma0_a3;
    wire [15:0] u0_m0_wo1_cma0_b3;
    wire [2:0] u0_m0_wo1_cma0_c3;
    wire [15:0] u0_m0_wo1_cma0_a4;
    wire [15:0] u0_m0_wo1_cma0_b4;
    wire [2:0] u0_m0_wo1_cma0_c4;
    wire [15:0] u0_m0_wo1_cma0_a5;
    wire [15:0] u0_m0_wo1_cma0_b5;
    wire [2:0] u0_m0_wo1_cma0_c5;
    wire [15:0] u0_m0_wo1_cma0_a6;
    wire [15:0] u0_m0_wo1_cma0_b6;
    wire [2:0] u0_m0_wo1_cma0_c6;
    wire [15:0] u0_m0_wo1_cma0_a7;
    wire [15:0] u0_m0_wo1_cma0_b7;
    wire [2:0] u0_m0_wo1_cma0_c7;
    wire [15:0] u0_m0_wo1_cma0_a8;
    wire [15:0] u0_m0_wo1_cma0_b8;
    wire [2:0] u0_m0_wo1_cma0_c8;
    wire [15:0] u0_m0_wo1_cma0_a9;
    wire [15:0] u0_m0_wo1_cma0_b9;
    wire [2:0] u0_m0_wo1_cma0_c9;
    wire [15:0] u0_m0_wo1_cma0_a10;
    wire [15:0] u0_m0_wo1_cma0_b10;
    wire [2:0] u0_m0_wo1_cma0_c10;
    wire [15:0] u0_m0_wo1_cma0_a11;
    wire [15:0] u0_m0_wo1_cma0_b11;
    wire [2:0] u0_m0_wo1_cma0_c11;
    wire [15:0] u0_m0_wo1_cma0_a12;
    wire [15:0] u0_m0_wo1_cma0_b12;
    wire [2:0] u0_m0_wo1_cma0_c12;
    wire [15:0] u0_m0_wo1_cma0_a13;
    wire [15:0] u0_m0_wo1_cma0_b13;
    wire [2:0] u0_m0_wo1_cma0_c13;
    wire [15:0] u0_m0_wo1_cma0_a14;
    wire [15:0] u0_m0_wo1_cma0_b14;
    wire [2:0] u0_m0_wo1_cma0_c14;
    wire [15:0] u0_m0_wo1_cma0_a15;
    wire [15:0] u0_m0_wo1_cma0_b15;
    wire [2:0] u0_m0_wo1_cma0_c15;
    wire [15:0] u0_m0_wo1_cma0_a16;
    wire [15:0] u0_m0_wo1_cma0_b16;
    wire [2:0] u0_m0_wo1_cma0_c16;
    wire [15:0] u0_m0_wo1_cma0_a17;
    wire [15:0] u0_m0_wo1_cma0_b17;
    wire [2:0] u0_m0_wo1_cma0_c17;
    wire [15:0] u0_m0_wo1_cma0_a18;
    wire [15:0] u0_m0_wo1_cma0_b18;
    wire [2:0] u0_m0_wo1_cma0_c18;
    wire [15:0] u0_m0_wo1_cma0_a19;
    wire [15:0] u0_m0_wo1_cma0_b19;
    wire [2:0] u0_m0_wo1_cma0_c19;
    wire [15:0] u0_m0_wo1_cma0_d2;
    wire [15:0] u0_m0_wo1_cma0_d4;
    wire [15:0] u0_m0_wo1_cma0_d6;
    wire [15:0] u0_m0_wo1_cma0_d8;
    wire [15:0] u0_m0_wo1_cma0_d10;
    wire [15:0] u0_m0_wo1_cma0_d12;
    wire [15:0] u0_m0_wo1_cma0_d14;
    wire [15:0] u0_m0_wo1_cma0_d16;
    wire [15:0] u0_m0_wo1_cma0_d18;
    wire [36:0] u0_m0_wo1_cma0_s0;
    wire [43:0] u0_m0_wo1_cma0_s2;
    wire [43:0] u0_m0_wo1_cma0_s4;
    wire [43:0] u0_m0_wo1_cma0_s6;
    wire [43:0] u0_m0_wo1_cma0_s8;
    wire [43:0] u0_m0_wo1_cma0_s10;
    wire [43:0] u0_m0_wo1_cma0_s12;
    wire [43:0] u0_m0_wo1_cma0_s14;
    wire [43:0] u0_m0_wo1_cma0_s16;
    wire [43:0] u0_m0_wo1_cma0_s18;
    wire [36:0] u0_m0_wo1_cma0_qq0;
    reg [36:0] u0_m0_wo1_cma0_q;
    wire u0_m0_wo1_cma0_ena0;
    wire u0_m0_wo1_cma0_ena1;
    wire u0_m0_wo1_cma0_ena2;
    reg [15:0] u1_m0_wo1_wi0_r0_delayr20_q;
    wire u1_m0_wo1_cma0_reset;
    wire [15:0] u1_m0_wo1_cma0_a0;
    wire [15:0] u1_m0_wo1_cma0_b0;
    wire [2:0] u1_m0_wo1_cma0_c0;
    wire [15:0] u1_m0_wo1_cma0_a1;
    wire [15:0] u1_m0_wo1_cma0_b1;
    wire [2:0] u1_m0_wo1_cma0_c1;
    wire [15:0] u1_m0_wo1_cma0_a2;
    wire [15:0] u1_m0_wo1_cma0_b2;
    wire [2:0] u1_m0_wo1_cma0_c2;
    wire [15:0] u1_m0_wo1_cma0_a3;
    wire [15:0] u1_m0_wo1_cma0_b3;
    wire [2:0] u1_m0_wo1_cma0_c3;
    wire [15:0] u1_m0_wo1_cma0_a4;
    wire [15:0] u1_m0_wo1_cma0_b4;
    wire [2:0] u1_m0_wo1_cma0_c4;
    wire [15:0] u1_m0_wo1_cma0_a5;
    wire [15:0] u1_m0_wo1_cma0_b5;
    wire [2:0] u1_m0_wo1_cma0_c5;
    wire [15:0] u1_m0_wo1_cma0_a6;
    wire [15:0] u1_m0_wo1_cma0_b6;
    wire [2:0] u1_m0_wo1_cma0_c6;
    wire [15:0] u1_m0_wo1_cma0_a7;
    wire [15:0] u1_m0_wo1_cma0_b7;
    wire [2:0] u1_m0_wo1_cma0_c7;
    wire [15:0] u1_m0_wo1_cma0_a8;
    wire [15:0] u1_m0_wo1_cma0_b8;
    wire [2:0] u1_m0_wo1_cma0_c8;
    wire [15:0] u1_m0_wo1_cma0_a9;
    wire [15:0] u1_m0_wo1_cma0_b9;
    wire [2:0] u1_m0_wo1_cma0_c9;
    wire [15:0] u1_m0_wo1_cma0_a10;
    wire [15:0] u1_m0_wo1_cma0_b10;
    wire [2:0] u1_m0_wo1_cma0_c10;
    wire [15:0] u1_m0_wo1_cma0_a11;
    wire [15:0] u1_m0_wo1_cma0_b11;
    wire [2:0] u1_m0_wo1_cma0_c11;
    wire [15:0] u1_m0_wo1_cma0_a12;
    wire [15:0] u1_m0_wo1_cma0_b12;
    wire [2:0] u1_m0_wo1_cma0_c12;
    wire [15:0] u1_m0_wo1_cma0_a13;
    wire [15:0] u1_m0_wo1_cma0_b13;
    wire [2:0] u1_m0_wo1_cma0_c13;
    wire [15:0] u1_m0_wo1_cma0_a14;
    wire [15:0] u1_m0_wo1_cma0_b14;
    wire [2:0] u1_m0_wo1_cma0_c14;
    wire [15:0] u1_m0_wo1_cma0_a15;
    wire [15:0] u1_m0_wo1_cma0_b15;
    wire [2:0] u1_m0_wo1_cma0_c15;
    wire [15:0] u1_m0_wo1_cma0_a16;
    wire [15:0] u1_m0_wo1_cma0_b16;
    wire [2:0] u1_m0_wo1_cma0_c16;
    wire [15:0] u1_m0_wo1_cma0_a17;
    wire [15:0] u1_m0_wo1_cma0_b17;
    wire [2:0] u1_m0_wo1_cma0_c17;
    wire [15:0] u1_m0_wo1_cma0_a18;
    wire [15:0] u1_m0_wo1_cma0_b18;
    wire [2:0] u1_m0_wo1_cma0_c18;
    wire [15:0] u1_m0_wo1_cma0_a19;
    wire [15:0] u1_m0_wo1_cma0_b19;
    wire [2:0] u1_m0_wo1_cma0_c19;
    wire [15:0] u1_m0_wo1_cma0_d2;
    wire [15:0] u1_m0_wo1_cma0_d4;
    wire [15:0] u1_m0_wo1_cma0_d6;
    wire [15:0] u1_m0_wo1_cma0_d8;
    wire [15:0] u1_m0_wo1_cma0_d10;
    wire [15:0] u1_m0_wo1_cma0_d12;
    wire [15:0] u1_m0_wo1_cma0_d14;
    wire [15:0] u1_m0_wo1_cma0_d16;
    wire [15:0] u1_m0_wo1_cma0_d18;
    wire [36:0] u1_m0_wo1_cma0_s0;
    wire [43:0] u1_m0_wo1_cma0_s2;
    wire [43:0] u1_m0_wo1_cma0_s4;
    wire [43:0] u1_m0_wo1_cma0_s6;
    wire [43:0] u1_m0_wo1_cma0_s8;
    wire [43:0] u1_m0_wo1_cma0_s10;
    wire [43:0] u1_m0_wo1_cma0_s12;
    wire [43:0] u1_m0_wo1_cma0_s14;
    wire [43:0] u1_m0_wo1_cma0_s16;
    wire [43:0] u1_m0_wo1_cma0_s18;
    wire [36:0] u1_m0_wo1_cma0_qq0;
    reg [36:0] u1_m0_wo1_cma0_q;
    wire u1_m0_wo1_cma0_ena0;
    wire u1_m0_wo1_cma0_ena1;
    wire u1_m0_wo1_cma0_ena2;
    reg [15:0] u2_m0_wo1_wi0_r0_delayr20_q;
    wire u2_m0_wo1_cma0_reset;
    wire [15:0] u2_m0_wo1_cma0_a0;
    wire [15:0] u2_m0_wo1_cma0_b0;
    wire [2:0] u2_m0_wo1_cma0_c0;
    wire [15:0] u2_m0_wo1_cma0_a1;
    wire [15:0] u2_m0_wo1_cma0_b1;
    wire [2:0] u2_m0_wo1_cma0_c1;
    wire [15:0] u2_m0_wo1_cma0_a2;
    wire [15:0] u2_m0_wo1_cma0_b2;
    wire [2:0] u2_m0_wo1_cma0_c2;
    wire [15:0] u2_m0_wo1_cma0_a3;
    wire [15:0] u2_m0_wo1_cma0_b3;
    wire [2:0] u2_m0_wo1_cma0_c3;
    wire [15:0] u2_m0_wo1_cma0_a4;
    wire [15:0] u2_m0_wo1_cma0_b4;
    wire [2:0] u2_m0_wo1_cma0_c4;
    wire [15:0] u2_m0_wo1_cma0_a5;
    wire [15:0] u2_m0_wo1_cma0_b5;
    wire [2:0] u2_m0_wo1_cma0_c5;
    wire [15:0] u2_m0_wo1_cma0_a6;
    wire [15:0] u2_m0_wo1_cma0_b6;
    wire [2:0] u2_m0_wo1_cma0_c6;
    wire [15:0] u2_m0_wo1_cma0_a7;
    wire [15:0] u2_m0_wo1_cma0_b7;
    wire [2:0] u2_m0_wo1_cma0_c7;
    wire [15:0] u2_m0_wo1_cma0_a8;
    wire [15:0] u2_m0_wo1_cma0_b8;
    wire [2:0] u2_m0_wo1_cma0_c8;
    wire [15:0] u2_m0_wo1_cma0_a9;
    wire [15:0] u2_m0_wo1_cma0_b9;
    wire [2:0] u2_m0_wo1_cma0_c9;
    wire [15:0] u2_m0_wo1_cma0_a10;
    wire [15:0] u2_m0_wo1_cma0_b10;
    wire [2:0] u2_m0_wo1_cma0_c10;
    wire [15:0] u2_m0_wo1_cma0_a11;
    wire [15:0] u2_m0_wo1_cma0_b11;
    wire [2:0] u2_m0_wo1_cma0_c11;
    wire [15:0] u2_m0_wo1_cma0_a12;
    wire [15:0] u2_m0_wo1_cma0_b12;
    wire [2:0] u2_m0_wo1_cma0_c12;
    wire [15:0] u2_m0_wo1_cma0_a13;
    wire [15:0] u2_m0_wo1_cma0_b13;
    wire [2:0] u2_m0_wo1_cma0_c13;
    wire [15:0] u2_m0_wo1_cma0_a14;
    wire [15:0] u2_m0_wo1_cma0_b14;
    wire [2:0] u2_m0_wo1_cma0_c14;
    wire [15:0] u2_m0_wo1_cma0_a15;
    wire [15:0] u2_m0_wo1_cma0_b15;
    wire [2:0] u2_m0_wo1_cma0_c15;
    wire [15:0] u2_m0_wo1_cma0_a16;
    wire [15:0] u2_m0_wo1_cma0_b16;
    wire [2:0] u2_m0_wo1_cma0_c16;
    wire [15:0] u2_m0_wo1_cma0_a17;
    wire [15:0] u2_m0_wo1_cma0_b17;
    wire [2:0] u2_m0_wo1_cma0_c17;
    wire [15:0] u2_m0_wo1_cma0_a18;
    wire [15:0] u2_m0_wo1_cma0_b18;
    wire [2:0] u2_m0_wo1_cma0_c18;
    wire [15:0] u2_m0_wo1_cma0_a19;
    wire [15:0] u2_m0_wo1_cma0_b19;
    wire [2:0] u2_m0_wo1_cma0_c19;
    wire [15:0] u2_m0_wo1_cma0_d2;
    wire [15:0] u2_m0_wo1_cma0_d4;
    wire [15:0] u2_m0_wo1_cma0_d6;
    wire [15:0] u2_m0_wo1_cma0_d8;
    wire [15:0] u2_m0_wo1_cma0_d10;
    wire [15:0] u2_m0_wo1_cma0_d12;
    wire [15:0] u2_m0_wo1_cma0_d14;
    wire [15:0] u2_m0_wo1_cma0_d16;
    wire [15:0] u2_m0_wo1_cma0_d18;
    wire [36:0] u2_m0_wo1_cma0_s0;
    wire [43:0] u2_m0_wo1_cma0_s2;
    wire [43:0] u2_m0_wo1_cma0_s4;
    wire [43:0] u2_m0_wo1_cma0_s6;
    wire [43:0] u2_m0_wo1_cma0_s8;
    wire [43:0] u2_m0_wo1_cma0_s10;
    wire [43:0] u2_m0_wo1_cma0_s12;
    wire [43:0] u2_m0_wo1_cma0_s14;
    wire [43:0] u2_m0_wo1_cma0_s16;
    wire [43:0] u2_m0_wo1_cma0_s18;
    wire [36:0] u2_m0_wo1_cma0_qq0;
    reg [36:0] u2_m0_wo1_cma0_q;
    wire u2_m0_wo1_cma0_ena0;
    wire u2_m0_wo1_cma0_ena1;
    wire u2_m0_wo1_cma0_ena2;
    reg [15:0] u3_m0_wo1_wi0_r0_delayr20_q;
    wire u3_m0_wo1_cma0_reset;
    wire [15:0] u3_m0_wo1_cma0_a0;
    wire [15:0] u3_m0_wo1_cma0_b0;
    wire [2:0] u3_m0_wo1_cma0_c0;
    wire [15:0] u3_m0_wo1_cma0_a1;
    wire [15:0] u3_m0_wo1_cma0_b1;
    wire [2:0] u3_m0_wo1_cma0_c1;
    wire [15:0] u3_m0_wo1_cma0_a2;
    wire [15:0] u3_m0_wo1_cma0_b2;
    wire [2:0] u3_m0_wo1_cma0_c2;
    wire [15:0] u3_m0_wo1_cma0_a3;
    wire [15:0] u3_m0_wo1_cma0_b3;
    wire [2:0] u3_m0_wo1_cma0_c3;
    wire [15:0] u3_m0_wo1_cma0_a4;
    wire [15:0] u3_m0_wo1_cma0_b4;
    wire [2:0] u3_m0_wo1_cma0_c4;
    wire [15:0] u3_m0_wo1_cma0_a5;
    wire [15:0] u3_m0_wo1_cma0_b5;
    wire [2:0] u3_m0_wo1_cma0_c5;
    wire [15:0] u3_m0_wo1_cma0_a6;
    wire [15:0] u3_m0_wo1_cma0_b6;
    wire [2:0] u3_m0_wo1_cma0_c6;
    wire [15:0] u3_m0_wo1_cma0_a7;
    wire [15:0] u3_m0_wo1_cma0_b7;
    wire [2:0] u3_m0_wo1_cma0_c7;
    wire [15:0] u3_m0_wo1_cma0_a8;
    wire [15:0] u3_m0_wo1_cma0_b8;
    wire [2:0] u3_m0_wo1_cma0_c8;
    wire [15:0] u3_m0_wo1_cma0_a9;
    wire [15:0] u3_m0_wo1_cma0_b9;
    wire [2:0] u3_m0_wo1_cma0_c9;
    wire [15:0] u3_m0_wo1_cma0_a10;
    wire [15:0] u3_m0_wo1_cma0_b10;
    wire [2:0] u3_m0_wo1_cma0_c10;
    wire [15:0] u3_m0_wo1_cma0_a11;
    wire [15:0] u3_m0_wo1_cma0_b11;
    wire [2:0] u3_m0_wo1_cma0_c11;
    wire [15:0] u3_m0_wo1_cma0_a12;
    wire [15:0] u3_m0_wo1_cma0_b12;
    wire [2:0] u3_m0_wo1_cma0_c12;
    wire [15:0] u3_m0_wo1_cma0_a13;
    wire [15:0] u3_m0_wo1_cma0_b13;
    wire [2:0] u3_m0_wo1_cma0_c13;
    wire [15:0] u3_m0_wo1_cma0_a14;
    wire [15:0] u3_m0_wo1_cma0_b14;
    wire [2:0] u3_m0_wo1_cma0_c14;
    wire [15:0] u3_m0_wo1_cma0_a15;
    wire [15:0] u3_m0_wo1_cma0_b15;
    wire [2:0] u3_m0_wo1_cma0_c15;
    wire [15:0] u3_m0_wo1_cma0_a16;
    wire [15:0] u3_m0_wo1_cma0_b16;
    wire [2:0] u3_m0_wo1_cma0_c16;
    wire [15:0] u3_m0_wo1_cma0_a17;
    wire [15:0] u3_m0_wo1_cma0_b17;
    wire [2:0] u3_m0_wo1_cma0_c17;
    wire [15:0] u3_m0_wo1_cma0_a18;
    wire [15:0] u3_m0_wo1_cma0_b18;
    wire [2:0] u3_m0_wo1_cma0_c18;
    wire [15:0] u3_m0_wo1_cma0_a19;
    wire [15:0] u3_m0_wo1_cma0_b19;
    wire [2:0] u3_m0_wo1_cma0_c19;
    wire [15:0] u3_m0_wo1_cma0_d2;
    wire [15:0] u3_m0_wo1_cma0_d4;
    wire [15:0] u3_m0_wo1_cma0_d6;
    wire [15:0] u3_m0_wo1_cma0_d8;
    wire [15:0] u3_m0_wo1_cma0_d10;
    wire [15:0] u3_m0_wo1_cma0_d12;
    wire [15:0] u3_m0_wo1_cma0_d14;
    wire [15:0] u3_m0_wo1_cma0_d16;
    wire [15:0] u3_m0_wo1_cma0_d18;
    wire [36:0] u3_m0_wo1_cma0_s0;
    wire [43:0] u3_m0_wo1_cma0_s2;
    wire [43:0] u3_m0_wo1_cma0_s4;
    wire [43:0] u3_m0_wo1_cma0_s6;
    wire [43:0] u3_m0_wo1_cma0_s8;
    wire [43:0] u3_m0_wo1_cma0_s10;
    wire [43:0] u3_m0_wo1_cma0_s12;
    wire [43:0] u3_m0_wo1_cma0_s14;
    wire [43:0] u3_m0_wo1_cma0_s16;
    wire [43:0] u3_m0_wo1_cma0_s18;
    wire [36:0] u3_m0_wo1_cma0_qq0;
    reg [36:0] u3_m0_wo1_cma0_q;
    wire u3_m0_wo1_cma0_ena0;
    wire u3_m0_wo1_cma0_ena1;
    wire u3_m0_wo1_cma0_ena2;
    wire [13:0] sR_bottomExtension_uid424_u0_m0_wo0_mtree_mult1_0_q;
    wire u0_m0_wo0_wi0_r0_delayr0_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_mem_ia;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr0_mem_aa;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr0_mem_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_mem_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_mem_q;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr0_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u0_m0_wo0_wi0_r0_delayr0_rdcnt_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq;
    reg [4:0] u0_m0_wo0_wi0_r0_delayr0_wraddr_q;
    wire [5:0] u0_m0_wo0_wi0_r0_delayr0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q;
    wire u1_m0_wo0_wi0_r0_delayr0_mem_reset0;
    wire u1_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr0_mem_ia;
    wire [4:0] u1_m0_wo0_wi0_r0_delayr0_mem_aa;
    wire [4:0] u1_m0_wo0_wi0_r0_delayr0_mem_ab;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr0_mem_iq;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr0_mem_q;
    wire [4:0] u1_m0_wo0_wi0_r0_delayr0_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u1_m0_wo0_wi0_r0_delayr0_rdcnt_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq;
    reg [4:0] u1_m0_wo0_wi0_r0_delayr0_wraddr_q;
    wire [5:0] u1_m0_wo0_wi0_r0_delayr0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr0_sticky_ena_q;
    wire u2_m0_wo0_wi0_r0_delayr0_mem_reset0;
    wire u2_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB;
    wire [15:0] u2_m0_wo0_wi0_r0_delayr0_mem_ia;
    wire [4:0] u2_m0_wo0_wi0_r0_delayr0_mem_aa;
    wire [4:0] u2_m0_wo0_wi0_r0_delayr0_mem_ab;
    wire [15:0] u2_m0_wo0_wi0_r0_delayr0_mem_iq;
    wire [15:0] u2_m0_wo0_wi0_r0_delayr0_mem_q;
    wire [4:0] u2_m0_wo0_wi0_r0_delayr0_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u2_m0_wo0_wi0_r0_delayr0_rdcnt_i;
    (* preserve_syn_only *) reg u2_m0_wo0_wi0_r0_delayr0_rdcnt_eq;
    reg [4:0] u2_m0_wo0_wi0_r0_delayr0_wraddr_q;
    wire [5:0] u2_m0_wo0_wi0_r0_delayr0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u2_m0_wo0_wi0_r0_delayr0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u2_m0_wo0_wi0_r0_delayr0_sticky_ena_q;
    wire u3_m0_wo0_wi0_r0_delayr0_mem_reset0;
    wire u3_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB;
    wire [15:0] u3_m0_wo0_wi0_r0_delayr0_mem_ia;
    wire [4:0] u3_m0_wo0_wi0_r0_delayr0_mem_aa;
    wire [4:0] u3_m0_wo0_wi0_r0_delayr0_mem_ab;
    wire [15:0] u3_m0_wo0_wi0_r0_delayr0_mem_iq;
    wire [15:0] u3_m0_wo0_wi0_r0_delayr0_mem_q;
    wire [4:0] u3_m0_wo0_wi0_r0_delayr0_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u3_m0_wo0_wi0_r0_delayr0_rdcnt_i;
    (* preserve_syn_only *) reg u3_m0_wo0_wi0_r0_delayr0_rdcnt_eq;
    reg [4:0] u3_m0_wo0_wi0_r0_delayr0_wraddr_q;
    wire [5:0] u3_m0_wo0_wi0_r0_delayr0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u3_m0_wo0_wi0_r0_delayr0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u3_m0_wo0_wi0_r0_delayr0_sticky_ena_q;
    wire d_in0_m0_wi0_wo0_assign_id0_q_15_mem_reset0;
    wire [15:0] d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ia;
    wire [1:0] d_in0_m0_wi0_wo0_assign_id0_q_15_mem_aa;
    wire [1:0] d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ab;
    wire [15:0] d_in0_m0_wi0_wo0_assign_id0_q_15_mem_iq;
    wire [15:0] d_in0_m0_wi0_wo0_assign_id0_q_15_mem_q;
    wire [1:0] d_in0_m0_wi0_wo0_assign_id0_q_15_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] d_in0_m0_wi0_wo0_assign_id0_q_15_wraddr_i = 2'b11;
    wire [1:0] d_in0_m0_wi0_wo0_assign_id0_q_15_offset_q;
    wire [2:0] d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_a;
    wire [2:0] d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_b;
    logic [2:0] d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_o;
    wire [2:0] d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_q;
    wire d_in1_m0_wi0_wo0_assign_id2_q_15_mem_reset0;
    wire [15:0] d_in1_m0_wi0_wo0_assign_id2_q_15_mem_ia;
    wire [1:0] d_in1_m0_wi0_wo0_assign_id2_q_15_mem_aa;
    wire [1:0] d_in1_m0_wi0_wo0_assign_id2_q_15_mem_ab;
    wire [15:0] d_in1_m0_wi0_wo0_assign_id2_q_15_mem_iq;
    wire [15:0] d_in1_m0_wi0_wo0_assign_id2_q_15_mem_q;
    wire [1:0] d_in1_m0_wi0_wo0_assign_id2_q_15_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] d_in1_m0_wi0_wo0_assign_id2_q_15_wraddr_i = 2'b11;
    wire [2:0] d_in1_m0_wi0_wo0_assign_id2_q_15_rdcnt_a;
    wire [2:0] d_in1_m0_wi0_wo0_assign_id2_q_15_rdcnt_b;
    logic [2:0] d_in1_m0_wi0_wo0_assign_id2_q_15_rdcnt_o;
    wire [2:0] d_in1_m0_wi0_wo0_assign_id2_q_15_rdcnt_q;
    wire d_in2_m0_wi0_wo0_assign_id4_q_15_mem_reset0;
    wire [15:0] d_in2_m0_wi0_wo0_assign_id4_q_15_mem_ia;
    wire [1:0] d_in2_m0_wi0_wo0_assign_id4_q_15_mem_aa;
    wire [1:0] d_in2_m0_wi0_wo0_assign_id4_q_15_mem_ab;
    wire [15:0] d_in2_m0_wi0_wo0_assign_id4_q_15_mem_iq;
    wire [15:0] d_in2_m0_wi0_wo0_assign_id4_q_15_mem_q;
    wire [1:0] d_in2_m0_wi0_wo0_assign_id4_q_15_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] d_in2_m0_wi0_wo0_assign_id4_q_15_wraddr_i = 2'b11;
    wire [2:0] d_in2_m0_wi0_wo0_assign_id4_q_15_rdcnt_a;
    wire [2:0] d_in2_m0_wi0_wo0_assign_id4_q_15_rdcnt_b;
    logic [2:0] d_in2_m0_wi0_wo0_assign_id4_q_15_rdcnt_o;
    wire [2:0] d_in2_m0_wi0_wo0_assign_id4_q_15_rdcnt_q;
    wire d_in3_m0_wi0_wo0_assign_id6_q_15_mem_reset0;
    wire [15:0] d_in3_m0_wi0_wo0_assign_id6_q_15_mem_ia;
    wire [1:0] d_in3_m0_wi0_wo0_assign_id6_q_15_mem_aa;
    wire [1:0] d_in3_m0_wi0_wo0_assign_id6_q_15_mem_ab;
    wire [15:0] d_in3_m0_wi0_wo0_assign_id6_q_15_mem_iq;
    wire [15:0] d_in3_m0_wi0_wo0_assign_id6_q_15_mem_q;
    wire [1:0] d_in3_m0_wi0_wo0_assign_id6_q_15_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] d_in3_m0_wi0_wo0_assign_id6_q_15_wraddr_i = 2'b11;
    wire [2:0] d_in3_m0_wi0_wo0_assign_id6_q_15_rdcnt_a;
    wire [2:0] d_in3_m0_wi0_wo0_assign_id6_q_15_rdcnt_b;
    logic [2:0] d_in3_m0_wi0_wo0_assign_id6_q_15_rdcnt_o;
    wire [2:0] d_in3_m0_wi0_wo0_assign_id6_q_15_rdcnt_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_rdmux_s;
    reg [4:0] u0_m0_wo0_wi0_r0_delayr0_rdmux_q;
    wire [5:0] u0_m0_wo0_wi0_r0_delayr0_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_enaAnd_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_rdmux_s;
    reg [4:0] u1_m0_wo0_wi0_r0_delayr0_rdmux_q;
    wire [5:0] u1_m0_wo0_wi0_r0_delayr0_cmp_b;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_cmp_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_notEnable_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_nor_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_enaAnd_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr0_rdmux_s;
    reg [4:0] u2_m0_wo0_wi0_r0_delayr0_rdmux_q;
    wire [5:0] u2_m0_wo0_wi0_r0_delayr0_cmp_b;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr0_cmp_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr0_notEnable_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr0_nor_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr0_enaAnd_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr0_rdmux_s;
    reg [4:0] u3_m0_wo0_wi0_r0_delayr0_rdmux_q;
    wire [5:0] u3_m0_wo0_wi0_r0_delayr0_cmp_b;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr0_cmp_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr0_notEnable_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr0_nor_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr0_enaAnd_q;
    reg [15:0] u0_m0_wo0_wi0_r0_phasedelay0_q;
    reg [15:0] u1_m0_wo0_wi0_r0_phasedelay0_q;
    reg [15:0] u2_m0_wo0_wi0_r0_phasedelay0_q;
    reg [15:0] u3_m0_wo0_wi0_r0_phasedelay0_q;
    wire [0:0] xMSB_uid425_u0_m0_wo0_mtree_mult1_0_b;
    wire [0:0] xMSB_uid463_u1_m0_wo0_mtree_mult1_0_b;
    wire [0:0] xMSB_uid501_u2_m0_wo0_mtree_mult1_0_b;
    wire [0:0] xMSB_uid539_u3_m0_wo0_mtree_mult1_0_b;
    wire [1:0] sR_topExtension_uid427_u0_m0_wo0_mtree_mult1_0_q;
    wire [1:0] sR_topExtension_uid465_u1_m0_wo0_mtree_mult1_0_q;
    wire [1:0] sR_topExtension_uid503_u2_m0_wo0_mtree_mult1_0_q;
    wire [1:0] sR_topExtension_uid541_u3_m0_wo0_mtree_mult1_0_q;
    wire [31:0] sR_mergedSignalTMB_uid428_u0_m0_wo0_mtree_mult1_0_q;
    wire [31:0] sR_mergedSignalTMB_uid466_u1_m0_wo0_mtree_mult1_0_q;
    wire [31:0] sR_mergedSignalTMB_uid504_u2_m0_wo0_mtree_mult1_0_q;
    wire [31:0] sR_mergedSignalTMB_uid542_u3_m0_wo0_mtree_mult1_0_q;

    import ca_interp_DUT_safe_path_ver::safe_path_ver;

    // u3_m0_wo1_wi0_r0_delayr20(DELAY,344)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo1_wi0_r0_delayr20_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u3_m0_wo1_wi0_r0_delayr20_q <= $unsigned(xIn_3);
        end
    end

    // d_u0_m0_wo0_compute_q_13(DELAY,573)@10 + 3
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

    // u3_m0_wo1_cma0(CHAINMULTADD,384)@10 + 5
    assign u3_m0_wo1_cma0_reset = areset;
    assign u3_m0_wo1_cma0_ena0 = xIn_v[0] | u3_m0_wo1_cma0_reset;
    assign u3_m0_wo1_cma0_ena1 = d_u0_m0_wo0_compute_q_13_q[0] | u3_m0_wo1_cma0_reset;
    assign u3_m0_wo1_cma0_ena2 = 1'b1;

    assign u3_m0_wo1_cma0_b0 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c0 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b1 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c1 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b2 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c2 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b3 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c3 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b4 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c4 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b5 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c5 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b6 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c6 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b7 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c7 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b8 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c8 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b9 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c9 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b10 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c10 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b11 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c11 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b12 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c12 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b13 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c13 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b14 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c14 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b15 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c15 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b16 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c16 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b17 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c17 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_b18 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c18 = {2'b00, GND_q[0:0]};
    assign u3_m0_wo1_cma0_a19 = $unsigned(u3_m0_wo1_wi0_r0_delayr20_q);
    assign u3_m0_wo1_cma0_b19 = $unsigned(xIn_3);
    assign u3_m0_wo1_cma0_c19 = {2'b00, GND_q[0:0]};
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
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
        .coef_a_0(10407),
        .coef_b_0(-3409),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo1_cma0_DSP9 (
        .clk(clk),
        .ena({ u3_m0_wo1_cma0_ena2, u3_m0_wo1_cma0_ena1, u3_m0_wo1_cma0_ena0 }),
        .clr({ u3_m0_wo1_cma0_reset, u3_m0_wo1_cma0_reset }),
        .ay(u3_m0_wo1_cma0_a19),
        .scanout(u3_m0_wo1_cma0_d18),
        .az(u3_m0_wo1_cma0_b19),
        .bz(u3_m0_wo1_cma0_b18),
        .coefsela(u3_m0_wo1_cma0_c19),
        .coefselb(u3_m0_wo1_cma0_c18),
        .chainout(u3_m0_wo1_cma0_s18),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .bx(),
        .by(),
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
        .coef_a_0(1973),
        .coef_b_0(-1336),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo1_cma0_DSP8 (
        .clk(clk),
        .ena({ u3_m0_wo1_cma0_ena2, u3_m0_wo1_cma0_ena1, u3_m0_wo1_cma0_ena0 }),
        .clr({ u3_m0_wo1_cma0_reset, u3_m0_wo1_cma0_reset }),
        .scanin(u3_m0_wo1_cma0_d18),
        .scanout(u3_m0_wo1_cma0_d16),
        .az(u3_m0_wo1_cma0_b17),
        .bz(u3_m0_wo1_cma0_b16),
        .coefsela(u3_m0_wo1_cma0_c17),
        .coefselb(u3_m0_wo1_cma0_c16),
        .chainin(u3_m0_wo1_cma0_s18),
        .chainout(u3_m0_wo1_cma0_s16),
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
        .coef_a_0(966),
        .coef_b_0(-722),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo1_cma0_DSP7 (
        .clk(clk),
        .ena({ u3_m0_wo1_cma0_ena2, u3_m0_wo1_cma0_ena1, u3_m0_wo1_cma0_ena0 }),
        .clr({ u3_m0_wo1_cma0_reset, u3_m0_wo1_cma0_reset }),
        .scanin(u3_m0_wo1_cma0_d16),
        .scanout(u3_m0_wo1_cma0_d14),
        .az(u3_m0_wo1_cma0_b15),
        .bz(u3_m0_wo1_cma0_b14),
        .coefsela(u3_m0_wo1_cma0_c15),
        .coefselb(u3_m0_wo1_cma0_c14),
        .chainin(u3_m0_wo1_cma0_s16),
        .chainout(u3_m0_wo1_cma0_s14),
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
        .coef_a_0(546),
        .coef_b_0(-416),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo1_cma0_DSP6 (
        .clk(clk),
        .ena({ u3_m0_wo1_cma0_ena2, u3_m0_wo1_cma0_ena1, u3_m0_wo1_cma0_ena0 }),
        .clr({ u3_m0_wo1_cma0_reset, u3_m0_wo1_cma0_reset }),
        .scanin(u3_m0_wo1_cma0_d14),
        .scanout(u3_m0_wo1_cma0_d12),
        .az(u3_m0_wo1_cma0_b13),
        .bz(u3_m0_wo1_cma0_b12),
        .coefsela(u3_m0_wo1_cma0_c13),
        .coefselb(u3_m0_wo1_cma0_c12),
        .chainin(u3_m0_wo1_cma0_s14),
        .chainout(u3_m0_wo1_cma0_s12),
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
        .coef_a_0(314),
        .coef_b_0(-237),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo1_cma0_DSP5 (
        .clk(clk),
        .ena({ u3_m0_wo1_cma0_ena2, u3_m0_wo1_cma0_ena1, u3_m0_wo1_cma0_ena0 }),
        .clr({ u3_m0_wo1_cma0_reset, u3_m0_wo1_cma0_reset }),
        .scanin(u3_m0_wo1_cma0_d12),
        .scanout(u3_m0_wo1_cma0_d10),
        .az(u3_m0_wo1_cma0_b11),
        .bz(u3_m0_wo1_cma0_b10),
        .coefsela(u3_m0_wo1_cma0_c11),
        .coefselb(u3_m0_wo1_cma0_c10),
        .chainin(u3_m0_wo1_cma0_s12),
        .chainout(u3_m0_wo1_cma0_s10),
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
        .coef_a_0(174),
        .coef_b_0(-128),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo1_cma0_DSP4 (
        .clk(clk),
        .ena({ u3_m0_wo1_cma0_ena2, u3_m0_wo1_cma0_ena1, u3_m0_wo1_cma0_ena0 }),
        .clr({ u3_m0_wo1_cma0_reset, u3_m0_wo1_cma0_reset }),
        .scanin(u3_m0_wo1_cma0_d10),
        .scanout(u3_m0_wo1_cma0_d8),
        .az(u3_m0_wo1_cma0_b9),
        .bz(u3_m0_wo1_cma0_b8),
        .coefsela(u3_m0_wo1_cma0_c9),
        .coefselb(u3_m0_wo1_cma0_c8),
        .chainin(u3_m0_wo1_cma0_s10),
        .chainout(u3_m0_wo1_cma0_s8),
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
        .coef_a_0(90),
        .coef_b_0(-63),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo1_cma0_DSP3 (
        .clk(clk),
        .ena({ u3_m0_wo1_cma0_ena2, u3_m0_wo1_cma0_ena1, u3_m0_wo1_cma0_ena0 }),
        .clr({ u3_m0_wo1_cma0_reset, u3_m0_wo1_cma0_reset }),
        .scanin(u3_m0_wo1_cma0_d8),
        .scanout(u3_m0_wo1_cma0_d6),
        .az(u3_m0_wo1_cma0_b7),
        .bz(u3_m0_wo1_cma0_b6),
        .coefsela(u3_m0_wo1_cma0_c7),
        .coefselb(u3_m0_wo1_cma0_c6),
        .chainin(u3_m0_wo1_cma0_s8),
        .chainout(u3_m0_wo1_cma0_s6),
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
        .coef_a_0(42),
        .coef_b_0(-28),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo1_cma0_DSP2 (
        .clk(clk),
        .ena({ u3_m0_wo1_cma0_ena2, u3_m0_wo1_cma0_ena1, u3_m0_wo1_cma0_ena0 }),
        .clr({ u3_m0_wo1_cma0_reset, u3_m0_wo1_cma0_reset }),
        .scanin(u3_m0_wo1_cma0_d6),
        .scanout(u3_m0_wo1_cma0_d4),
        .az(u3_m0_wo1_cma0_b5),
        .bz(u3_m0_wo1_cma0_b4),
        .coefsela(u3_m0_wo1_cma0_c5),
        .coefselb(u3_m0_wo1_cma0_c4),
        .chainin(u3_m0_wo1_cma0_s6),
        .chainout(u3_m0_wo1_cma0_s4),
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
        .coef_a_0(16),
        .coef_b_0(-10),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u3_m0_wo1_cma0_DSP1 (
        .clk(clk),
        .ena({ u3_m0_wo1_cma0_ena2, u3_m0_wo1_cma0_ena1, u3_m0_wo1_cma0_ena0 }),
        .clr({ u3_m0_wo1_cma0_reset, u3_m0_wo1_cma0_reset }),
        .scanin(u3_m0_wo1_cma0_d4),
        .scanout(u3_m0_wo1_cma0_d2),
        .az(u3_m0_wo1_cma0_b3),
        .bz(u3_m0_wo1_cma0_b2),
        .coefsela(u3_m0_wo1_cma0_c3),
        .coefselb(u3_m0_wo1_cma0_c2),
        .chainin(u3_m0_wo1_cma0_s4),
        .chainout(u3_m0_wo1_cma0_s2),
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
        .coef_a_0(4),
        .coef_b_0(-3),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1"),
        .result_a_width(37)
    ) u3_m0_wo1_cma0_DSP0 (
        .clk(clk),
        .ena({ u3_m0_wo1_cma0_ena2, u3_m0_wo1_cma0_ena1, u3_m0_wo1_cma0_ena0 }),
        .clr({ u3_m0_wo1_cma0_reset, u3_m0_wo1_cma0_reset }),
        .scanin(u3_m0_wo1_cma0_d2),
        .az(u3_m0_wo1_cma0_b1),
        .bz(u3_m0_wo1_cma0_b0),
        .coefsela(u3_m0_wo1_cma0_c1),
        .coefselb(u3_m0_wo1_cma0_c0),
        .chainin(u3_m0_wo1_cma0_s2),
        .resulta(u3_m0_wo1_cma0_s0),
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
        .scanout(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(37), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u3_m0_wo1_cma0_delay0 ( .xin(u3_m0_wo1_cma0_s0), .xout(u3_m0_wo1_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u3_m0_wo1_cma0_q = $unsigned(u3_m0_wo1_cma0_qq0[36:0]);

    // xMSB_uid539_u3_m0_wo0_mtree_mult1_0(BITSELECT,538)@15
    assign xMSB_uid539_u3_m0_wo0_mtree_mult1_0_b = $unsigned(u3_m0_wo0_wi0_r0_phasedelay0_q[15:15]);

    // sR_topExtension_uid541_u3_m0_wo0_mtree_mult1_0(BITJOIN,540)@15
    assign sR_topExtension_uid541_u3_m0_wo0_mtree_mult1_0_q = {xMSB_uid539_u3_m0_wo0_mtree_mult1_0_b, xMSB_uid539_u3_m0_wo0_mtree_mult1_0_b};

    // u3_m0_wo0_wi0_r0_delayr0_notEnable(LOGICAL,618)@15
    assign u3_m0_wo0_wi0_r0_delayr0_notEnable_q = $unsigned(~ (d_in0_m0_wi0_wo0_assign_id1_q_15_q));

    // u3_m0_wo0_wi0_r0_delayr0_nor(LOGICAL,619)@15
    assign u3_m0_wo0_wi0_r0_delayr0_nor_q = ~ (u3_m0_wo0_wi0_r0_delayr0_notEnable_q | u3_m0_wo0_wi0_r0_delayr0_sticky_ena_q);

    // u3_m0_wo0_wi0_r0_delayr0_mem_last(CONSTANT,615)
    assign u3_m0_wo0_wi0_r0_delayr0_mem_last_q = $unsigned(6'b010001);

    // u3_m0_wo0_wi0_r0_delayr0_cmp(LOGICAL,616)@15
    assign u3_m0_wo0_wi0_r0_delayr0_cmp_b = {1'b0, u3_m0_wo0_wi0_r0_delayr0_rdmux_q};
    assign u3_m0_wo0_wi0_r0_delayr0_cmp_q = $unsigned(u3_m0_wo0_wi0_r0_delayr0_mem_last_q == u3_m0_wo0_wi0_r0_delayr0_cmp_b ? 1'b1 : 1'b0);

    // u3_m0_wo0_wi0_r0_delayr0_cmpReg(REG,617)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_15_q == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(u3_m0_wo0_wi0_r0_delayr0_cmp_q);
        end
    end

    // u3_m0_wo0_wi0_r0_delayr0_sticky_ena(REG,620)@15 + 1
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

    // u3_m0_wo0_wi0_r0_delayr0_enaAnd(LOGICAL,621)@15
    assign u3_m0_wo0_wi0_r0_delayr0_enaAnd_q = u3_m0_wo0_wi0_r0_delayr0_sticky_ena_q & d_in0_m0_wi0_wo0_assign_id1_q_15_q;

    // u3_m0_wo0_wi0_r0_delayr0_rdcnt(COUNTER,612)@15 + 1
    // low=0, high=18, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr0_rdcnt_i <= 5'd0;
            u3_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_15_q == 1'b1)
        begin
            if (u3_m0_wo0_wi0_r0_delayr0_rdcnt_i == 5'd17)
            begin
                u3_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u3_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
            end
            if (u3_m0_wo0_wi0_r0_delayr0_rdcnt_eq == 1'b1)
            begin
                u3_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u3_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(5'd14);
            end
            else
            begin
                u3_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u3_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(5'd1);
            end
        end
    end
    assign u3_m0_wo0_wi0_r0_delayr0_rdcnt_q = u3_m0_wo0_wi0_r0_delayr0_rdcnt_i[4:0];

    // u3_m0_wo0_wi0_r0_delayr0_rdmux(MUX,613)@15
    assign u3_m0_wo0_wi0_r0_delayr0_rdmux_s = d_in0_m0_wi0_wo0_assign_id1_q_15_q;
    always @(u3_m0_wo0_wi0_r0_delayr0_rdmux_s or u3_m0_wo0_wi0_r0_delayr0_wraddr_q or u3_m0_wo0_wi0_r0_delayr0_rdcnt_q)
    begin
        unique case (u3_m0_wo0_wi0_r0_delayr0_rdmux_s)
            1'b0 : u3_m0_wo0_wi0_r0_delayr0_rdmux_q = u3_m0_wo0_wi0_r0_delayr0_wraddr_q;
            1'b1 : u3_m0_wo0_wi0_r0_delayr0_rdmux_q = u3_m0_wo0_wi0_r0_delayr0_rdcnt_q;
            default : u3_m0_wo0_wi0_r0_delayr0_rdmux_q = 5'b0;
        endcase
    end

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // d_in0_m0_wi0_wo0_assign_id0_q_15_offset(CONSTANT,624)
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_offset_q = $unsigned(2'b10);

    // d_in3_m0_wi0_wo0_assign_id6_q_15_rdcnt(ADD,637)@10 + 1
    assign d_in3_m0_wi0_wo0_assign_id6_q_15_rdcnt_a = {1'b0, d_in3_m0_wi0_wo0_assign_id6_q_15_wraddr_q};
    assign d_in3_m0_wi0_wo0_assign_id6_q_15_rdcnt_b = {1'b0, d_in0_m0_wi0_wo0_assign_id0_q_15_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in3_m0_wi0_wo0_assign_id6_q_15_rdcnt_o <= $unsigned(d_in3_m0_wi0_wo0_assign_id6_q_15_rdcnt_a) + $unsigned(d_in3_m0_wi0_wo0_assign_id6_q_15_rdcnt_b);
        end
    end
    assign d_in3_m0_wi0_wo0_assign_id6_q_15_rdcnt_q = d_in3_m0_wi0_wo0_assign_id6_q_15_rdcnt_o[2:0];

    // d_in3_m0_wi0_wo0_assign_id6_q_15_wraddr(COUNTER,635)@10 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in3_m0_wi0_wo0_assign_id6_q_15_wraddr_i <= $unsigned(d_in3_m0_wi0_wo0_assign_id6_q_15_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign d_in3_m0_wi0_wo0_assign_id6_q_15_wraddr_q = d_in3_m0_wi0_wo0_assign_id6_q_15_wraddr_i[1:0];

    // d_in3_m0_wi0_wo0_assign_id6_q_15_mem(DUALMEM,634)@10 + 2
    assign d_in3_m0_wi0_wo0_assign_id6_q_15_mem_ia = $unsigned(xIn_3);
    assign d_in3_m0_wi0_wo0_assign_id6_q_15_mem_aa = d_in3_m0_wi0_wo0_assign_id6_q_15_wraddr_q;
    assign d_in3_m0_wi0_wo0_assign_id6_q_15_mem_ab = d_in3_m0_wi0_wo0_assign_id6_q_15_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(4),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) d_in3_m0_wi0_wo0_assign_id6_q_15_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(d_in3_m0_wi0_wo0_assign_id6_q_15_mem_aa),
        .data_a(d_in3_m0_wi0_wo0_assign_id6_q_15_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_in3_m0_wi0_wo0_assign_id6_q_15_mem_ab),
        .q_b(d_in3_m0_wi0_wo0_assign_id6_q_15_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
        .clock1(),
        .clocken1(),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign d_in3_m0_wi0_wo0_assign_id6_q_15_mem_q = d_in3_m0_wi0_wo0_assign_id6_q_15_mem_iq[15:0];

    // d_in0_m0_wi0_wo0_assign_id1_q_15(DELAY,572)@10 + 5
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_15_delay_0 <= '0;
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_15_delay_0 <= $unsigned(xIn_v);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_15_delay_1 <= d_in0_m0_wi0_wo0_assign_id1_q_15_delay_0;
            d_in0_m0_wi0_wo0_assign_id1_q_15_delay_2 <= d_in0_m0_wi0_wo0_assign_id1_q_15_delay_1;
            d_in0_m0_wi0_wo0_assign_id1_q_15_delay_3 <= d_in0_m0_wi0_wo0_assign_id1_q_15_delay_2;
            d_in0_m0_wi0_wo0_assign_id1_q_15_q <= d_in0_m0_wi0_wo0_assign_id1_q_15_delay_3;
        end
    end

    // u3_m0_wo0_wi0_r0_delayr0_wraddr(REG,614)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(5'b10010);
        end
        else
        begin
            u3_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(u3_m0_wo0_wi0_r0_delayr0_rdmux_q);
        end
    end

    // u3_m0_wo0_wi0_r0_delayr0_mem(DUALMEM,611)@15 + 2
    assign u3_m0_wo0_wi0_r0_delayr0_mem_ia = $unsigned(d_in3_m0_wi0_wo0_assign_id6_q_15_mem_q);
    assign u3_m0_wo0_wi0_r0_delayr0_mem_aa = u3_m0_wo0_wi0_r0_delayr0_wraddr_q;
    assign u3_m0_wo0_wi0_r0_delayr0_mem_ab = u3_m0_wo0_wi0_r0_delayr0_rdmux_q;
    assign u3_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB = areset | u3_m0_wo0_wi0_r0_delayr0_enaAnd_q[0];
    assign u3_m0_wo0_wi0_r0_delayr0_mem_reset0 = areset;
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
    ) u3_m0_wo0_wi0_r0_delayr0_mem_dmem (
        .clocken1(u3_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u3_m0_wo0_wi0_r0_delayr0_mem_reset0),
        .clock1(clk),
        .address_a(u3_m0_wo0_wi0_r0_delayr0_mem_aa),
        .data_a(u3_m0_wo0_wi0_r0_delayr0_mem_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_15_q[0]),
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

    // u3_m0_wo0_wi0_r0_phasedelay0(DELAY,68)@15
    assign u3_m0_wo0_wi0_r0_phasedelay0_q = $unsigned(u3_m0_wo0_wi0_r0_delayr0_mem_q);

    // sR_bottomExtension_uid424_u0_m0_wo0_mtree_mult1_0(CONSTANT,423)@0
    assign sR_bottomExtension_uid424_u0_m0_wo0_mtree_mult1_0_q = $unsigned(14'b00000000000000);

    // sR_mergedSignalTMB_uid542_u3_m0_wo0_mtree_mult1_0(BITJOIN,541)@15
    assign sR_mergedSignalTMB_uid542_u3_m0_wo0_mtree_mult1_0_q = {sR_topExtension_uid541_u3_m0_wo0_mtree_mult1_0_q, u3_m0_wo0_wi0_r0_phasedelay0_q, sR_bottomExtension_uid424_u0_m0_wo0_mtree_mult1_0_q};

    // u2_m0_wo1_wi0_r0_delayr20(DELAY,271)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo1_wi0_r0_delayr20_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u2_m0_wo1_wi0_r0_delayr20_q <= $unsigned(xIn_2);
        end
    end

    // u2_m0_wo1_cma0(CHAINMULTADD,311)@10 + 5
    assign u2_m0_wo1_cma0_reset = areset;
    assign u2_m0_wo1_cma0_ena0 = xIn_v[0] | u2_m0_wo1_cma0_reset;
    assign u2_m0_wo1_cma0_ena1 = d_u0_m0_wo0_compute_q_13_q[0] | u2_m0_wo1_cma0_reset;
    assign u2_m0_wo1_cma0_ena2 = 1'b1;

    assign u2_m0_wo1_cma0_b0 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c0 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b1 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c1 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b2 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c2 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b3 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c3 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b4 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c4 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b5 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c5 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b6 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c6 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b7 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c7 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b8 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c8 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b9 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c9 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b10 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c10 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b11 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c11 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b12 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c12 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b13 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c13 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b14 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c14 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b15 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c15 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b16 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c16 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b17 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c17 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_b18 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c18 = {2'b00, GND_q[0:0]};
    assign u2_m0_wo1_cma0_a19 = $unsigned(u2_m0_wo1_wi0_r0_delayr20_q);
    assign u2_m0_wo1_cma0_b19 = $unsigned(xIn_2);
    assign u2_m0_wo1_cma0_c19 = {2'b00, GND_q[0:0]};
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
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
        .coef_a_0(10407),
        .coef_b_0(-3409),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo1_cma0_DSP9 (
        .clk(clk),
        .ena({ u2_m0_wo1_cma0_ena2, u2_m0_wo1_cma0_ena1, u2_m0_wo1_cma0_ena0 }),
        .clr({ u2_m0_wo1_cma0_reset, u2_m0_wo1_cma0_reset }),
        .ay(u2_m0_wo1_cma0_a19),
        .scanout(u2_m0_wo1_cma0_d18),
        .az(u2_m0_wo1_cma0_b19),
        .bz(u2_m0_wo1_cma0_b18),
        .coefsela(u2_m0_wo1_cma0_c19),
        .coefselb(u2_m0_wo1_cma0_c18),
        .chainout(u2_m0_wo1_cma0_s18),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .bx(),
        .by(),
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
        .coef_a_0(1973),
        .coef_b_0(-1336),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo1_cma0_DSP8 (
        .clk(clk),
        .ena({ u2_m0_wo1_cma0_ena2, u2_m0_wo1_cma0_ena1, u2_m0_wo1_cma0_ena0 }),
        .clr({ u2_m0_wo1_cma0_reset, u2_m0_wo1_cma0_reset }),
        .scanin(u2_m0_wo1_cma0_d18),
        .scanout(u2_m0_wo1_cma0_d16),
        .az(u2_m0_wo1_cma0_b17),
        .bz(u2_m0_wo1_cma0_b16),
        .coefsela(u2_m0_wo1_cma0_c17),
        .coefselb(u2_m0_wo1_cma0_c16),
        .chainin(u2_m0_wo1_cma0_s18),
        .chainout(u2_m0_wo1_cma0_s16),
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
        .coef_a_0(966),
        .coef_b_0(-722),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo1_cma0_DSP7 (
        .clk(clk),
        .ena({ u2_m0_wo1_cma0_ena2, u2_m0_wo1_cma0_ena1, u2_m0_wo1_cma0_ena0 }),
        .clr({ u2_m0_wo1_cma0_reset, u2_m0_wo1_cma0_reset }),
        .scanin(u2_m0_wo1_cma0_d16),
        .scanout(u2_m0_wo1_cma0_d14),
        .az(u2_m0_wo1_cma0_b15),
        .bz(u2_m0_wo1_cma0_b14),
        .coefsela(u2_m0_wo1_cma0_c15),
        .coefselb(u2_m0_wo1_cma0_c14),
        .chainin(u2_m0_wo1_cma0_s16),
        .chainout(u2_m0_wo1_cma0_s14),
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
        .coef_a_0(546),
        .coef_b_0(-416),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo1_cma0_DSP6 (
        .clk(clk),
        .ena({ u2_m0_wo1_cma0_ena2, u2_m0_wo1_cma0_ena1, u2_m0_wo1_cma0_ena0 }),
        .clr({ u2_m0_wo1_cma0_reset, u2_m0_wo1_cma0_reset }),
        .scanin(u2_m0_wo1_cma0_d14),
        .scanout(u2_m0_wo1_cma0_d12),
        .az(u2_m0_wo1_cma0_b13),
        .bz(u2_m0_wo1_cma0_b12),
        .coefsela(u2_m0_wo1_cma0_c13),
        .coefselb(u2_m0_wo1_cma0_c12),
        .chainin(u2_m0_wo1_cma0_s14),
        .chainout(u2_m0_wo1_cma0_s12),
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
        .coef_a_0(314),
        .coef_b_0(-237),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo1_cma0_DSP5 (
        .clk(clk),
        .ena({ u2_m0_wo1_cma0_ena2, u2_m0_wo1_cma0_ena1, u2_m0_wo1_cma0_ena0 }),
        .clr({ u2_m0_wo1_cma0_reset, u2_m0_wo1_cma0_reset }),
        .scanin(u2_m0_wo1_cma0_d12),
        .scanout(u2_m0_wo1_cma0_d10),
        .az(u2_m0_wo1_cma0_b11),
        .bz(u2_m0_wo1_cma0_b10),
        .coefsela(u2_m0_wo1_cma0_c11),
        .coefselb(u2_m0_wo1_cma0_c10),
        .chainin(u2_m0_wo1_cma0_s12),
        .chainout(u2_m0_wo1_cma0_s10),
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
        .coef_a_0(174),
        .coef_b_0(-128),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo1_cma0_DSP4 (
        .clk(clk),
        .ena({ u2_m0_wo1_cma0_ena2, u2_m0_wo1_cma0_ena1, u2_m0_wo1_cma0_ena0 }),
        .clr({ u2_m0_wo1_cma0_reset, u2_m0_wo1_cma0_reset }),
        .scanin(u2_m0_wo1_cma0_d10),
        .scanout(u2_m0_wo1_cma0_d8),
        .az(u2_m0_wo1_cma0_b9),
        .bz(u2_m0_wo1_cma0_b8),
        .coefsela(u2_m0_wo1_cma0_c9),
        .coefselb(u2_m0_wo1_cma0_c8),
        .chainin(u2_m0_wo1_cma0_s10),
        .chainout(u2_m0_wo1_cma0_s8),
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
        .coef_a_0(90),
        .coef_b_0(-63),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo1_cma0_DSP3 (
        .clk(clk),
        .ena({ u2_m0_wo1_cma0_ena2, u2_m0_wo1_cma0_ena1, u2_m0_wo1_cma0_ena0 }),
        .clr({ u2_m0_wo1_cma0_reset, u2_m0_wo1_cma0_reset }),
        .scanin(u2_m0_wo1_cma0_d8),
        .scanout(u2_m0_wo1_cma0_d6),
        .az(u2_m0_wo1_cma0_b7),
        .bz(u2_m0_wo1_cma0_b6),
        .coefsela(u2_m0_wo1_cma0_c7),
        .coefselb(u2_m0_wo1_cma0_c6),
        .chainin(u2_m0_wo1_cma0_s8),
        .chainout(u2_m0_wo1_cma0_s6),
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
        .coef_a_0(42),
        .coef_b_0(-28),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo1_cma0_DSP2 (
        .clk(clk),
        .ena({ u2_m0_wo1_cma0_ena2, u2_m0_wo1_cma0_ena1, u2_m0_wo1_cma0_ena0 }),
        .clr({ u2_m0_wo1_cma0_reset, u2_m0_wo1_cma0_reset }),
        .scanin(u2_m0_wo1_cma0_d6),
        .scanout(u2_m0_wo1_cma0_d4),
        .az(u2_m0_wo1_cma0_b5),
        .bz(u2_m0_wo1_cma0_b4),
        .coefsela(u2_m0_wo1_cma0_c5),
        .coefselb(u2_m0_wo1_cma0_c4),
        .chainin(u2_m0_wo1_cma0_s6),
        .chainout(u2_m0_wo1_cma0_s4),
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
        .coef_a_0(16),
        .coef_b_0(-10),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u2_m0_wo1_cma0_DSP1 (
        .clk(clk),
        .ena({ u2_m0_wo1_cma0_ena2, u2_m0_wo1_cma0_ena1, u2_m0_wo1_cma0_ena0 }),
        .clr({ u2_m0_wo1_cma0_reset, u2_m0_wo1_cma0_reset }),
        .scanin(u2_m0_wo1_cma0_d4),
        .scanout(u2_m0_wo1_cma0_d2),
        .az(u2_m0_wo1_cma0_b3),
        .bz(u2_m0_wo1_cma0_b2),
        .coefsela(u2_m0_wo1_cma0_c3),
        .coefselb(u2_m0_wo1_cma0_c2),
        .chainin(u2_m0_wo1_cma0_s4),
        .chainout(u2_m0_wo1_cma0_s2),
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
        .coef_a_0(4),
        .coef_b_0(-3),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1"),
        .result_a_width(37)
    ) u2_m0_wo1_cma0_DSP0 (
        .clk(clk),
        .ena({ u2_m0_wo1_cma0_ena2, u2_m0_wo1_cma0_ena1, u2_m0_wo1_cma0_ena0 }),
        .clr({ u2_m0_wo1_cma0_reset, u2_m0_wo1_cma0_reset }),
        .scanin(u2_m0_wo1_cma0_d2),
        .az(u2_m0_wo1_cma0_b1),
        .bz(u2_m0_wo1_cma0_b0),
        .coefsela(u2_m0_wo1_cma0_c1),
        .coefselb(u2_m0_wo1_cma0_c0),
        .chainin(u2_m0_wo1_cma0_s2),
        .resulta(u2_m0_wo1_cma0_s0),
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
        .scanout(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(37), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u2_m0_wo1_cma0_delay0 ( .xin(u2_m0_wo1_cma0_s0), .xout(u2_m0_wo1_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u2_m0_wo1_cma0_q = $unsigned(u2_m0_wo1_cma0_qq0[36:0]);

    // xMSB_uid501_u2_m0_wo0_mtree_mult1_0(BITSELECT,500)@15
    assign xMSB_uid501_u2_m0_wo0_mtree_mult1_0_b = $unsigned(u2_m0_wo0_wi0_r0_phasedelay0_q[15:15]);

    // sR_topExtension_uid503_u2_m0_wo0_mtree_mult1_0(BITJOIN,502)@15
    assign sR_topExtension_uid503_u2_m0_wo0_mtree_mult1_0_q = {xMSB_uid501_u2_m0_wo0_mtree_mult1_0_b, xMSB_uid501_u2_m0_wo0_mtree_mult1_0_b};

    // u2_m0_wo0_wi0_r0_delayr0_notEnable(LOGICAL,607)@15
    assign u2_m0_wo0_wi0_r0_delayr0_notEnable_q = $unsigned(~ (d_in0_m0_wi0_wo0_assign_id1_q_15_q));

    // u2_m0_wo0_wi0_r0_delayr0_nor(LOGICAL,608)@15
    assign u2_m0_wo0_wi0_r0_delayr0_nor_q = ~ (u2_m0_wo0_wi0_r0_delayr0_notEnable_q | u2_m0_wo0_wi0_r0_delayr0_sticky_ena_q);

    // u2_m0_wo0_wi0_r0_delayr0_mem_last(CONSTANT,604)
    assign u2_m0_wo0_wi0_r0_delayr0_mem_last_q = $unsigned(6'b010001);

    // u2_m0_wo0_wi0_r0_delayr0_cmp(LOGICAL,605)@15
    assign u2_m0_wo0_wi0_r0_delayr0_cmp_b = {1'b0, u2_m0_wo0_wi0_r0_delayr0_rdmux_q};
    assign u2_m0_wo0_wi0_r0_delayr0_cmp_q = $unsigned(u2_m0_wo0_wi0_r0_delayr0_mem_last_q == u2_m0_wo0_wi0_r0_delayr0_cmp_b ? 1'b1 : 1'b0);

    // u2_m0_wo0_wi0_r0_delayr0_cmpReg(REG,606)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_15_q == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(u2_m0_wo0_wi0_r0_delayr0_cmp_q);
        end
    end

    // u2_m0_wo0_wi0_r0_delayr0_sticky_ena(REG,609)@15 + 1
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

    // u2_m0_wo0_wi0_r0_delayr0_enaAnd(LOGICAL,610)@15
    assign u2_m0_wo0_wi0_r0_delayr0_enaAnd_q = u2_m0_wo0_wi0_r0_delayr0_sticky_ena_q & d_in0_m0_wi0_wo0_assign_id1_q_15_q;

    // u2_m0_wo0_wi0_r0_delayr0_rdcnt(COUNTER,601)@15 + 1
    // low=0, high=18, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr0_rdcnt_i <= 5'd0;
            u2_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_15_q == 1'b1)
        begin
            if (u2_m0_wo0_wi0_r0_delayr0_rdcnt_i == 5'd17)
            begin
                u2_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u2_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
            end
            if (u2_m0_wo0_wi0_r0_delayr0_rdcnt_eq == 1'b1)
            begin
                u2_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u2_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(5'd14);
            end
            else
            begin
                u2_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u2_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(5'd1);
            end
        end
    end
    assign u2_m0_wo0_wi0_r0_delayr0_rdcnt_q = u2_m0_wo0_wi0_r0_delayr0_rdcnt_i[4:0];

    // u2_m0_wo0_wi0_r0_delayr0_rdmux(MUX,602)@15
    assign u2_m0_wo0_wi0_r0_delayr0_rdmux_s = d_in0_m0_wi0_wo0_assign_id1_q_15_q;
    always @(u2_m0_wo0_wi0_r0_delayr0_rdmux_s or u2_m0_wo0_wi0_r0_delayr0_wraddr_q or u2_m0_wo0_wi0_r0_delayr0_rdcnt_q)
    begin
        unique case (u2_m0_wo0_wi0_r0_delayr0_rdmux_s)
            1'b0 : u2_m0_wo0_wi0_r0_delayr0_rdmux_q = u2_m0_wo0_wi0_r0_delayr0_wraddr_q;
            1'b1 : u2_m0_wo0_wi0_r0_delayr0_rdmux_q = u2_m0_wo0_wi0_r0_delayr0_rdcnt_q;
            default : u2_m0_wo0_wi0_r0_delayr0_rdmux_q = 5'b0;
        endcase
    end

    // d_in2_m0_wi0_wo0_assign_id4_q_15_rdcnt(ADD,633)@10 + 1
    assign d_in2_m0_wi0_wo0_assign_id4_q_15_rdcnt_a = {1'b0, d_in2_m0_wi0_wo0_assign_id4_q_15_wraddr_q};
    assign d_in2_m0_wi0_wo0_assign_id4_q_15_rdcnt_b = {1'b0, d_in0_m0_wi0_wo0_assign_id0_q_15_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in2_m0_wi0_wo0_assign_id4_q_15_rdcnt_o <= $unsigned(d_in2_m0_wi0_wo0_assign_id4_q_15_rdcnt_a) + $unsigned(d_in2_m0_wi0_wo0_assign_id4_q_15_rdcnt_b);
        end
    end
    assign d_in2_m0_wi0_wo0_assign_id4_q_15_rdcnt_q = d_in2_m0_wi0_wo0_assign_id4_q_15_rdcnt_o[2:0];

    // d_in2_m0_wi0_wo0_assign_id4_q_15_wraddr(COUNTER,631)@10 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in2_m0_wi0_wo0_assign_id4_q_15_wraddr_i <= $unsigned(d_in2_m0_wi0_wo0_assign_id4_q_15_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign d_in2_m0_wi0_wo0_assign_id4_q_15_wraddr_q = d_in2_m0_wi0_wo0_assign_id4_q_15_wraddr_i[1:0];

    // d_in2_m0_wi0_wo0_assign_id4_q_15_mem(DUALMEM,630)@10 + 2
    assign d_in2_m0_wi0_wo0_assign_id4_q_15_mem_ia = $unsigned(xIn_2);
    assign d_in2_m0_wi0_wo0_assign_id4_q_15_mem_aa = d_in2_m0_wi0_wo0_assign_id4_q_15_wraddr_q;
    assign d_in2_m0_wi0_wo0_assign_id4_q_15_mem_ab = d_in2_m0_wi0_wo0_assign_id4_q_15_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(4),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) d_in2_m0_wi0_wo0_assign_id4_q_15_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(d_in2_m0_wi0_wo0_assign_id4_q_15_mem_aa),
        .data_a(d_in2_m0_wi0_wo0_assign_id4_q_15_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_in2_m0_wi0_wo0_assign_id4_q_15_mem_ab),
        .q_b(d_in2_m0_wi0_wo0_assign_id4_q_15_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
        .clock1(),
        .clocken1(),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign d_in2_m0_wi0_wo0_assign_id4_q_15_mem_q = d_in2_m0_wi0_wo0_assign_id4_q_15_mem_iq[15:0];

    // u2_m0_wo0_wi0_r0_delayr0_wraddr(REG,603)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(5'b10010);
        end
        else
        begin
            u2_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(u2_m0_wo0_wi0_r0_delayr0_rdmux_q);
        end
    end

    // u2_m0_wo0_wi0_r0_delayr0_mem(DUALMEM,600)@15 + 2
    assign u2_m0_wo0_wi0_r0_delayr0_mem_ia = $unsigned(d_in2_m0_wi0_wo0_assign_id4_q_15_mem_q);
    assign u2_m0_wo0_wi0_r0_delayr0_mem_aa = u2_m0_wo0_wi0_r0_delayr0_wraddr_q;
    assign u2_m0_wo0_wi0_r0_delayr0_mem_ab = u2_m0_wo0_wi0_r0_delayr0_rdmux_q;
    assign u2_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB = areset | u2_m0_wo0_wi0_r0_delayr0_enaAnd_q[0];
    assign u2_m0_wo0_wi0_r0_delayr0_mem_reset0 = areset;
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
    ) u2_m0_wo0_wi0_r0_delayr0_mem_dmem (
        .clocken1(u2_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u2_m0_wo0_wi0_r0_delayr0_mem_reset0),
        .clock1(clk),
        .address_a(u2_m0_wo0_wi0_r0_delayr0_mem_aa),
        .data_a(u2_m0_wo0_wi0_r0_delayr0_mem_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_15_q[0]),
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

    // u2_m0_wo0_wi0_r0_phasedelay0(DELAY,54)@15
    assign u2_m0_wo0_wi0_r0_phasedelay0_q = $unsigned(u2_m0_wo0_wi0_r0_delayr0_mem_q);

    // sR_mergedSignalTMB_uid504_u2_m0_wo0_mtree_mult1_0(BITJOIN,503)@15
    assign sR_mergedSignalTMB_uid504_u2_m0_wo0_mtree_mult1_0_q = {sR_topExtension_uid503_u2_m0_wo0_mtree_mult1_0_q, u2_m0_wo0_wi0_r0_phasedelay0_q, sR_bottomExtension_uid424_u0_m0_wo0_mtree_mult1_0_q};

    // u1_m0_wo1_wi0_r0_delayr20(DELAY,198)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo1_wi0_r0_delayr20_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u1_m0_wo1_wi0_r0_delayr20_q <= $unsigned(xIn_1);
        end
    end

    // u1_m0_wo1_cma0(CHAINMULTADD,238)@10 + 5
    assign u1_m0_wo1_cma0_reset = areset;
    assign u1_m0_wo1_cma0_ena0 = xIn_v[0] | u1_m0_wo1_cma0_reset;
    assign u1_m0_wo1_cma0_ena1 = d_u0_m0_wo0_compute_q_13_q[0] | u1_m0_wo1_cma0_reset;
    assign u1_m0_wo1_cma0_ena2 = 1'b1;

    assign u1_m0_wo1_cma0_b0 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c0 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b1 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c1 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b2 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c2 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b3 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c3 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b4 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c4 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b5 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c5 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b6 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c6 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b7 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c7 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b8 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c8 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b9 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c9 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b10 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c10 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b11 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c11 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b12 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c12 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b13 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c13 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b14 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c14 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b15 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c15 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b16 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c16 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b17 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c17 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_b18 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c18 = {2'b00, GND_q[0:0]};
    assign u1_m0_wo1_cma0_a19 = $unsigned(u1_m0_wo1_wi0_r0_delayr20_q);
    assign u1_m0_wo1_cma0_b19 = $unsigned(xIn_1);
    assign u1_m0_wo1_cma0_c19 = {2'b00, GND_q[0:0]};
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
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
        .coef_a_0(10407),
        .coef_b_0(-3409),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo1_cma0_DSP9 (
        .clk(clk),
        .ena({ u1_m0_wo1_cma0_ena2, u1_m0_wo1_cma0_ena1, u1_m0_wo1_cma0_ena0 }),
        .clr({ u1_m0_wo1_cma0_reset, u1_m0_wo1_cma0_reset }),
        .ay(u1_m0_wo1_cma0_a19),
        .scanout(u1_m0_wo1_cma0_d18),
        .az(u1_m0_wo1_cma0_b19),
        .bz(u1_m0_wo1_cma0_b18),
        .coefsela(u1_m0_wo1_cma0_c19),
        .coefselb(u1_m0_wo1_cma0_c18),
        .chainout(u1_m0_wo1_cma0_s18),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .bx(),
        .by(),
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
        .coef_a_0(1973),
        .coef_b_0(-1336),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo1_cma0_DSP8 (
        .clk(clk),
        .ena({ u1_m0_wo1_cma0_ena2, u1_m0_wo1_cma0_ena1, u1_m0_wo1_cma0_ena0 }),
        .clr({ u1_m0_wo1_cma0_reset, u1_m0_wo1_cma0_reset }),
        .scanin(u1_m0_wo1_cma0_d18),
        .scanout(u1_m0_wo1_cma0_d16),
        .az(u1_m0_wo1_cma0_b17),
        .bz(u1_m0_wo1_cma0_b16),
        .coefsela(u1_m0_wo1_cma0_c17),
        .coefselb(u1_m0_wo1_cma0_c16),
        .chainin(u1_m0_wo1_cma0_s18),
        .chainout(u1_m0_wo1_cma0_s16),
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
        .coef_a_0(966),
        .coef_b_0(-722),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo1_cma0_DSP7 (
        .clk(clk),
        .ena({ u1_m0_wo1_cma0_ena2, u1_m0_wo1_cma0_ena1, u1_m0_wo1_cma0_ena0 }),
        .clr({ u1_m0_wo1_cma0_reset, u1_m0_wo1_cma0_reset }),
        .scanin(u1_m0_wo1_cma0_d16),
        .scanout(u1_m0_wo1_cma0_d14),
        .az(u1_m0_wo1_cma0_b15),
        .bz(u1_m0_wo1_cma0_b14),
        .coefsela(u1_m0_wo1_cma0_c15),
        .coefselb(u1_m0_wo1_cma0_c14),
        .chainin(u1_m0_wo1_cma0_s16),
        .chainout(u1_m0_wo1_cma0_s14),
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
        .coef_a_0(546),
        .coef_b_0(-416),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo1_cma0_DSP6 (
        .clk(clk),
        .ena({ u1_m0_wo1_cma0_ena2, u1_m0_wo1_cma0_ena1, u1_m0_wo1_cma0_ena0 }),
        .clr({ u1_m0_wo1_cma0_reset, u1_m0_wo1_cma0_reset }),
        .scanin(u1_m0_wo1_cma0_d14),
        .scanout(u1_m0_wo1_cma0_d12),
        .az(u1_m0_wo1_cma0_b13),
        .bz(u1_m0_wo1_cma0_b12),
        .coefsela(u1_m0_wo1_cma0_c13),
        .coefselb(u1_m0_wo1_cma0_c12),
        .chainin(u1_m0_wo1_cma0_s14),
        .chainout(u1_m0_wo1_cma0_s12),
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
        .coef_a_0(314),
        .coef_b_0(-237),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo1_cma0_DSP5 (
        .clk(clk),
        .ena({ u1_m0_wo1_cma0_ena2, u1_m0_wo1_cma0_ena1, u1_m0_wo1_cma0_ena0 }),
        .clr({ u1_m0_wo1_cma0_reset, u1_m0_wo1_cma0_reset }),
        .scanin(u1_m0_wo1_cma0_d12),
        .scanout(u1_m0_wo1_cma0_d10),
        .az(u1_m0_wo1_cma0_b11),
        .bz(u1_m0_wo1_cma0_b10),
        .coefsela(u1_m0_wo1_cma0_c11),
        .coefselb(u1_m0_wo1_cma0_c10),
        .chainin(u1_m0_wo1_cma0_s12),
        .chainout(u1_m0_wo1_cma0_s10),
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
        .coef_a_0(174),
        .coef_b_0(-128),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo1_cma0_DSP4 (
        .clk(clk),
        .ena({ u1_m0_wo1_cma0_ena2, u1_m0_wo1_cma0_ena1, u1_m0_wo1_cma0_ena0 }),
        .clr({ u1_m0_wo1_cma0_reset, u1_m0_wo1_cma0_reset }),
        .scanin(u1_m0_wo1_cma0_d10),
        .scanout(u1_m0_wo1_cma0_d8),
        .az(u1_m0_wo1_cma0_b9),
        .bz(u1_m0_wo1_cma0_b8),
        .coefsela(u1_m0_wo1_cma0_c9),
        .coefselb(u1_m0_wo1_cma0_c8),
        .chainin(u1_m0_wo1_cma0_s10),
        .chainout(u1_m0_wo1_cma0_s8),
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
        .coef_a_0(90),
        .coef_b_0(-63),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo1_cma0_DSP3 (
        .clk(clk),
        .ena({ u1_m0_wo1_cma0_ena2, u1_m0_wo1_cma0_ena1, u1_m0_wo1_cma0_ena0 }),
        .clr({ u1_m0_wo1_cma0_reset, u1_m0_wo1_cma0_reset }),
        .scanin(u1_m0_wo1_cma0_d8),
        .scanout(u1_m0_wo1_cma0_d6),
        .az(u1_m0_wo1_cma0_b7),
        .bz(u1_m0_wo1_cma0_b6),
        .coefsela(u1_m0_wo1_cma0_c7),
        .coefselb(u1_m0_wo1_cma0_c6),
        .chainin(u1_m0_wo1_cma0_s8),
        .chainout(u1_m0_wo1_cma0_s6),
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
        .coef_a_0(42),
        .coef_b_0(-28),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo1_cma0_DSP2 (
        .clk(clk),
        .ena({ u1_m0_wo1_cma0_ena2, u1_m0_wo1_cma0_ena1, u1_m0_wo1_cma0_ena0 }),
        .clr({ u1_m0_wo1_cma0_reset, u1_m0_wo1_cma0_reset }),
        .scanin(u1_m0_wo1_cma0_d6),
        .scanout(u1_m0_wo1_cma0_d4),
        .az(u1_m0_wo1_cma0_b5),
        .bz(u1_m0_wo1_cma0_b4),
        .coefsela(u1_m0_wo1_cma0_c5),
        .coefselb(u1_m0_wo1_cma0_c4),
        .chainin(u1_m0_wo1_cma0_s6),
        .chainout(u1_m0_wo1_cma0_s4),
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
        .coef_a_0(16),
        .coef_b_0(-10),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m0_wo1_cma0_DSP1 (
        .clk(clk),
        .ena({ u1_m0_wo1_cma0_ena2, u1_m0_wo1_cma0_ena1, u1_m0_wo1_cma0_ena0 }),
        .clr({ u1_m0_wo1_cma0_reset, u1_m0_wo1_cma0_reset }),
        .scanin(u1_m0_wo1_cma0_d4),
        .scanout(u1_m0_wo1_cma0_d2),
        .az(u1_m0_wo1_cma0_b3),
        .bz(u1_m0_wo1_cma0_b2),
        .coefsela(u1_m0_wo1_cma0_c3),
        .coefselb(u1_m0_wo1_cma0_c2),
        .chainin(u1_m0_wo1_cma0_s4),
        .chainout(u1_m0_wo1_cma0_s2),
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
        .coef_a_0(4),
        .coef_b_0(-3),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1"),
        .result_a_width(37)
    ) u1_m0_wo1_cma0_DSP0 (
        .clk(clk),
        .ena({ u1_m0_wo1_cma0_ena2, u1_m0_wo1_cma0_ena1, u1_m0_wo1_cma0_ena0 }),
        .clr({ u1_m0_wo1_cma0_reset, u1_m0_wo1_cma0_reset }),
        .scanin(u1_m0_wo1_cma0_d2),
        .az(u1_m0_wo1_cma0_b1),
        .bz(u1_m0_wo1_cma0_b0),
        .coefsela(u1_m0_wo1_cma0_c1),
        .coefselb(u1_m0_wo1_cma0_c0),
        .chainin(u1_m0_wo1_cma0_s2),
        .resulta(u1_m0_wo1_cma0_s0),
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
        .scanout(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(37), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u1_m0_wo1_cma0_delay0 ( .xin(u1_m0_wo1_cma0_s0), .xout(u1_m0_wo1_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u1_m0_wo1_cma0_q = $unsigned(u1_m0_wo1_cma0_qq0[36:0]);

    // xMSB_uid463_u1_m0_wo0_mtree_mult1_0(BITSELECT,462)@15
    assign xMSB_uid463_u1_m0_wo0_mtree_mult1_0_b = $unsigned(u1_m0_wo0_wi0_r0_phasedelay0_q[15:15]);

    // sR_topExtension_uid465_u1_m0_wo0_mtree_mult1_0(BITJOIN,464)@15
    assign sR_topExtension_uid465_u1_m0_wo0_mtree_mult1_0_q = {xMSB_uid463_u1_m0_wo0_mtree_mult1_0_b, xMSB_uid463_u1_m0_wo0_mtree_mult1_0_b};

    // u1_m0_wo0_wi0_r0_delayr0_notEnable(LOGICAL,596)@15
    assign u1_m0_wo0_wi0_r0_delayr0_notEnable_q = $unsigned(~ (d_in0_m0_wi0_wo0_assign_id1_q_15_q));

    // u1_m0_wo0_wi0_r0_delayr0_nor(LOGICAL,597)@15
    assign u1_m0_wo0_wi0_r0_delayr0_nor_q = ~ (u1_m0_wo0_wi0_r0_delayr0_notEnable_q | u1_m0_wo0_wi0_r0_delayr0_sticky_ena_q);

    // u1_m0_wo0_wi0_r0_delayr0_mem_last(CONSTANT,593)
    assign u1_m0_wo0_wi0_r0_delayr0_mem_last_q = $unsigned(6'b010001);

    // u1_m0_wo0_wi0_r0_delayr0_cmp(LOGICAL,594)@15
    assign u1_m0_wo0_wi0_r0_delayr0_cmp_b = {1'b0, u1_m0_wo0_wi0_r0_delayr0_rdmux_q};
    assign u1_m0_wo0_wi0_r0_delayr0_cmp_q = $unsigned(u1_m0_wo0_wi0_r0_delayr0_mem_last_q == u1_m0_wo0_wi0_r0_delayr0_cmp_b ? 1'b1 : 1'b0);

    // u1_m0_wo0_wi0_r0_delayr0_cmpReg(REG,595)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_15_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_cmp_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr0_sticky_ena(REG,598)@15 + 1
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

    // u1_m0_wo0_wi0_r0_delayr0_enaAnd(LOGICAL,599)@15
    assign u1_m0_wo0_wi0_r0_delayr0_enaAnd_q = u1_m0_wo0_wi0_r0_delayr0_sticky_ena_q & d_in0_m0_wi0_wo0_assign_id1_q_15_q;

    // u1_m0_wo0_wi0_r0_delayr0_rdcnt(COUNTER,590)@15 + 1
    // low=0, high=18, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr0_rdcnt_i <= 5'd0;
            u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_15_q == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_delayr0_rdcnt_i == 5'd17)
            begin
                u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(5'd14);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(5'd1);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_delayr0_rdcnt_q = u1_m0_wo0_wi0_r0_delayr0_rdcnt_i[4:0];

    // u1_m0_wo0_wi0_r0_delayr0_rdmux(MUX,591)@15
    assign u1_m0_wo0_wi0_r0_delayr0_rdmux_s = d_in0_m0_wi0_wo0_assign_id1_q_15_q;
    always @(u1_m0_wo0_wi0_r0_delayr0_rdmux_s or u1_m0_wo0_wi0_r0_delayr0_wraddr_q or u1_m0_wo0_wi0_r0_delayr0_rdcnt_q)
    begin
        unique case (u1_m0_wo0_wi0_r0_delayr0_rdmux_s)
            1'b0 : u1_m0_wo0_wi0_r0_delayr0_rdmux_q = u1_m0_wo0_wi0_r0_delayr0_wraddr_q;
            1'b1 : u1_m0_wo0_wi0_r0_delayr0_rdmux_q = u1_m0_wo0_wi0_r0_delayr0_rdcnt_q;
            default : u1_m0_wo0_wi0_r0_delayr0_rdmux_q = 5'b0;
        endcase
    end

    // d_in1_m0_wi0_wo0_assign_id2_q_15_rdcnt(ADD,629)@10 + 1
    assign d_in1_m0_wi0_wo0_assign_id2_q_15_rdcnt_a = {1'b0, d_in1_m0_wi0_wo0_assign_id2_q_15_wraddr_q};
    assign d_in1_m0_wi0_wo0_assign_id2_q_15_rdcnt_b = {1'b0, d_in0_m0_wi0_wo0_assign_id0_q_15_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in1_m0_wi0_wo0_assign_id2_q_15_rdcnt_o <= $unsigned(d_in1_m0_wi0_wo0_assign_id2_q_15_rdcnt_a) + $unsigned(d_in1_m0_wi0_wo0_assign_id2_q_15_rdcnt_b);
        end
    end
    assign d_in1_m0_wi0_wo0_assign_id2_q_15_rdcnt_q = d_in1_m0_wi0_wo0_assign_id2_q_15_rdcnt_o[2:0];

    // d_in1_m0_wi0_wo0_assign_id2_q_15_wraddr(COUNTER,627)@10 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in1_m0_wi0_wo0_assign_id2_q_15_wraddr_i <= $unsigned(d_in1_m0_wi0_wo0_assign_id2_q_15_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign d_in1_m0_wi0_wo0_assign_id2_q_15_wraddr_q = d_in1_m0_wi0_wo0_assign_id2_q_15_wraddr_i[1:0];

    // d_in1_m0_wi0_wo0_assign_id2_q_15_mem(DUALMEM,626)@10 + 2
    assign d_in1_m0_wi0_wo0_assign_id2_q_15_mem_ia = $unsigned(xIn_1);
    assign d_in1_m0_wi0_wo0_assign_id2_q_15_mem_aa = d_in1_m0_wi0_wo0_assign_id2_q_15_wraddr_q;
    assign d_in1_m0_wi0_wo0_assign_id2_q_15_mem_ab = d_in1_m0_wi0_wo0_assign_id2_q_15_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(4),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) d_in1_m0_wi0_wo0_assign_id2_q_15_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(d_in1_m0_wi0_wo0_assign_id2_q_15_mem_aa),
        .data_a(d_in1_m0_wi0_wo0_assign_id2_q_15_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_in1_m0_wi0_wo0_assign_id2_q_15_mem_ab),
        .q_b(d_in1_m0_wi0_wo0_assign_id2_q_15_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
        .clock1(),
        .clocken1(),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign d_in1_m0_wi0_wo0_assign_id2_q_15_mem_q = d_in1_m0_wi0_wo0_assign_id2_q_15_mem_iq[15:0];

    // u1_m0_wo0_wi0_r0_delayr0_wraddr(REG,592)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(5'b10010);
        end
        else
        begin
            u1_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_rdmux_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr0_mem(DUALMEM,589)@15 + 2
    assign u1_m0_wo0_wi0_r0_delayr0_mem_ia = $unsigned(d_in1_m0_wi0_wo0_assign_id2_q_15_mem_q);
    assign u1_m0_wo0_wi0_r0_delayr0_mem_aa = u1_m0_wo0_wi0_r0_delayr0_wraddr_q;
    assign u1_m0_wo0_wi0_r0_delayr0_mem_ab = u1_m0_wo0_wi0_r0_delayr0_rdmux_q;
    assign u1_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB = areset | u1_m0_wo0_wi0_r0_delayr0_enaAnd_q[0];
    assign u1_m0_wo0_wi0_r0_delayr0_mem_reset0 = areset;
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
    ) u1_m0_wo0_wi0_r0_delayr0_mem_dmem (
        .clocken1(u1_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u1_m0_wo0_wi0_r0_delayr0_mem_reset0),
        .clock1(clk),
        .address_a(u1_m0_wo0_wi0_r0_delayr0_mem_aa),
        .data_a(u1_m0_wo0_wi0_r0_delayr0_mem_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_15_q[0]),
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

    // u1_m0_wo0_wi0_r0_phasedelay0(DELAY,40)@15
    assign u1_m0_wo0_wi0_r0_phasedelay0_q = $unsigned(u1_m0_wo0_wi0_r0_delayr0_mem_q);

    // sR_mergedSignalTMB_uid466_u1_m0_wo0_mtree_mult1_0(BITJOIN,465)@15
    assign sR_mergedSignalTMB_uid466_u1_m0_wo0_mtree_mult1_0_q = {sR_topExtension_uid465_u1_m0_wo0_mtree_mult1_0_q, u1_m0_wo0_wi0_r0_phasedelay0_q, sR_bottomExtension_uid424_u0_m0_wo0_mtree_mult1_0_q};

    // u0_m0_wo1_wi0_r0_delayr20(DELAY,102)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo1_wi0_r0_delayr20_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo1_wi0_r0_delayr20_q <= $unsigned(xIn_0);
        end
    end

    // u0_m0_wo1_cma0(CHAINMULTADD,165)@10 + 5
    assign u0_m0_wo1_cma0_reset = areset;
    assign u0_m0_wo1_cma0_ena0 = xIn_v[0] | u0_m0_wo1_cma0_reset;
    assign u0_m0_wo1_cma0_ena1 = d_u0_m0_wo0_compute_q_13_q[0] | u0_m0_wo1_cma0_reset;
    assign u0_m0_wo1_cma0_ena2 = 1'b1;

    assign u0_m0_wo1_cma0_b0 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c0 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b1 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c1 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b2 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c2 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b3 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c3 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b4 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c4 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b5 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c5 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b6 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c6 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b7 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c7 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b8 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c8 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b9 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c9 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b10 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c10 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b11 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c11 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b12 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c12 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b13 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c13 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b14 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c14 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b15 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c15 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b16 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c16 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b17 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c17 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_b18 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c18 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo1_cma0_a19 = $unsigned(u0_m0_wo1_wi0_r0_delayr20_q);
    assign u0_m0_wo1_cma0_b19 = $unsigned(xIn_0);
    assign u0_m0_wo1_cma0_c19 = {2'b00, GND_q[0:0]};
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
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
        .coef_a_0(10407),
        .coef_b_0(-3409),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo1_cma0_DSP9 (
        .clk(clk),
        .ena({ u0_m0_wo1_cma0_ena2, u0_m0_wo1_cma0_ena1, u0_m0_wo1_cma0_ena0 }),
        .clr({ u0_m0_wo1_cma0_reset, u0_m0_wo1_cma0_reset }),
        .ay(u0_m0_wo1_cma0_a19),
        .scanout(u0_m0_wo1_cma0_d18),
        .az(u0_m0_wo1_cma0_b19),
        .bz(u0_m0_wo1_cma0_b18),
        .coefsela(u0_m0_wo1_cma0_c19),
        .coefselb(u0_m0_wo1_cma0_c18),
        .chainout(u0_m0_wo1_cma0_s18),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .bx(),
        .by(),
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
        .coef_a_0(1973),
        .coef_b_0(-1336),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo1_cma0_DSP8 (
        .clk(clk),
        .ena({ u0_m0_wo1_cma0_ena2, u0_m0_wo1_cma0_ena1, u0_m0_wo1_cma0_ena0 }),
        .clr({ u0_m0_wo1_cma0_reset, u0_m0_wo1_cma0_reset }),
        .scanin(u0_m0_wo1_cma0_d18),
        .scanout(u0_m0_wo1_cma0_d16),
        .az(u0_m0_wo1_cma0_b17),
        .bz(u0_m0_wo1_cma0_b16),
        .coefsela(u0_m0_wo1_cma0_c17),
        .coefselb(u0_m0_wo1_cma0_c16),
        .chainin(u0_m0_wo1_cma0_s18),
        .chainout(u0_m0_wo1_cma0_s16),
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
        .coef_a_0(966),
        .coef_b_0(-722),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo1_cma0_DSP7 (
        .clk(clk),
        .ena({ u0_m0_wo1_cma0_ena2, u0_m0_wo1_cma0_ena1, u0_m0_wo1_cma0_ena0 }),
        .clr({ u0_m0_wo1_cma0_reset, u0_m0_wo1_cma0_reset }),
        .scanin(u0_m0_wo1_cma0_d16),
        .scanout(u0_m0_wo1_cma0_d14),
        .az(u0_m0_wo1_cma0_b15),
        .bz(u0_m0_wo1_cma0_b14),
        .coefsela(u0_m0_wo1_cma0_c15),
        .coefselb(u0_m0_wo1_cma0_c14),
        .chainin(u0_m0_wo1_cma0_s16),
        .chainout(u0_m0_wo1_cma0_s14),
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
        .coef_a_0(546),
        .coef_b_0(-416),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo1_cma0_DSP6 (
        .clk(clk),
        .ena({ u0_m0_wo1_cma0_ena2, u0_m0_wo1_cma0_ena1, u0_m0_wo1_cma0_ena0 }),
        .clr({ u0_m0_wo1_cma0_reset, u0_m0_wo1_cma0_reset }),
        .scanin(u0_m0_wo1_cma0_d14),
        .scanout(u0_m0_wo1_cma0_d12),
        .az(u0_m0_wo1_cma0_b13),
        .bz(u0_m0_wo1_cma0_b12),
        .coefsela(u0_m0_wo1_cma0_c13),
        .coefselb(u0_m0_wo1_cma0_c12),
        .chainin(u0_m0_wo1_cma0_s14),
        .chainout(u0_m0_wo1_cma0_s12),
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
        .coef_a_0(314),
        .coef_b_0(-237),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo1_cma0_DSP5 (
        .clk(clk),
        .ena({ u0_m0_wo1_cma0_ena2, u0_m0_wo1_cma0_ena1, u0_m0_wo1_cma0_ena0 }),
        .clr({ u0_m0_wo1_cma0_reset, u0_m0_wo1_cma0_reset }),
        .scanin(u0_m0_wo1_cma0_d12),
        .scanout(u0_m0_wo1_cma0_d10),
        .az(u0_m0_wo1_cma0_b11),
        .bz(u0_m0_wo1_cma0_b10),
        .coefsela(u0_m0_wo1_cma0_c11),
        .coefselb(u0_m0_wo1_cma0_c10),
        .chainin(u0_m0_wo1_cma0_s12),
        .chainout(u0_m0_wo1_cma0_s10),
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
        .coef_a_0(174),
        .coef_b_0(-128),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo1_cma0_DSP4 (
        .clk(clk),
        .ena({ u0_m0_wo1_cma0_ena2, u0_m0_wo1_cma0_ena1, u0_m0_wo1_cma0_ena0 }),
        .clr({ u0_m0_wo1_cma0_reset, u0_m0_wo1_cma0_reset }),
        .scanin(u0_m0_wo1_cma0_d10),
        .scanout(u0_m0_wo1_cma0_d8),
        .az(u0_m0_wo1_cma0_b9),
        .bz(u0_m0_wo1_cma0_b8),
        .coefsela(u0_m0_wo1_cma0_c9),
        .coefselb(u0_m0_wo1_cma0_c8),
        .chainin(u0_m0_wo1_cma0_s10),
        .chainout(u0_m0_wo1_cma0_s8),
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
        .coef_a_0(90),
        .coef_b_0(-63),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo1_cma0_DSP3 (
        .clk(clk),
        .ena({ u0_m0_wo1_cma0_ena2, u0_m0_wo1_cma0_ena1, u0_m0_wo1_cma0_ena0 }),
        .clr({ u0_m0_wo1_cma0_reset, u0_m0_wo1_cma0_reset }),
        .scanin(u0_m0_wo1_cma0_d8),
        .scanout(u0_m0_wo1_cma0_d6),
        .az(u0_m0_wo1_cma0_b7),
        .bz(u0_m0_wo1_cma0_b6),
        .coefsela(u0_m0_wo1_cma0_c7),
        .coefselb(u0_m0_wo1_cma0_c6),
        .chainin(u0_m0_wo1_cma0_s8),
        .chainout(u0_m0_wo1_cma0_s6),
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
        .coef_a_0(42),
        .coef_b_0(-28),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo1_cma0_DSP2 (
        .clk(clk),
        .ena({ u0_m0_wo1_cma0_ena2, u0_m0_wo1_cma0_ena1, u0_m0_wo1_cma0_ena0 }),
        .clr({ u0_m0_wo1_cma0_reset, u0_m0_wo1_cma0_reset }),
        .scanin(u0_m0_wo1_cma0_d6),
        .scanout(u0_m0_wo1_cma0_d4),
        .az(u0_m0_wo1_cma0_b5),
        .bz(u0_m0_wo1_cma0_b4),
        .coefsela(u0_m0_wo1_cma0_c5),
        .coefselb(u0_m0_wo1_cma0_c4),
        .chainin(u0_m0_wo1_cma0_s6),
        .chainout(u0_m0_wo1_cma0_s4),
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
        .coef_a_0(16),
        .coef_b_0(-10),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo1_cma0_DSP1 (
        .clk(clk),
        .ena({ u0_m0_wo1_cma0_ena2, u0_m0_wo1_cma0_ena1, u0_m0_wo1_cma0_ena0 }),
        .clr({ u0_m0_wo1_cma0_reset, u0_m0_wo1_cma0_reset }),
        .scanin(u0_m0_wo1_cma0_d4),
        .scanout(u0_m0_wo1_cma0_d2),
        .az(u0_m0_wo1_cma0_b3),
        .bz(u0_m0_wo1_cma0_b2),
        .coefsela(u0_m0_wo1_cma0_c3),
        .coefselb(u0_m0_wo1_cma0_c2),
        .chainin(u0_m0_wo1_cma0_s4),
        .chainout(u0_m0_wo1_cma0_s2),
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
        .coef_a_0(4),
        .coef_b_0(-3),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1"),
        .result_a_width(37)
    ) u0_m0_wo1_cma0_DSP0 (
        .clk(clk),
        .ena({ u0_m0_wo1_cma0_ena2, u0_m0_wo1_cma0_ena1, u0_m0_wo1_cma0_ena0 }),
        .clr({ u0_m0_wo1_cma0_reset, u0_m0_wo1_cma0_reset }),
        .scanin(u0_m0_wo1_cma0_d2),
        .az(u0_m0_wo1_cma0_b1),
        .bz(u0_m0_wo1_cma0_b0),
        .coefsela(u0_m0_wo1_cma0_c1),
        .coefselb(u0_m0_wo1_cma0_c0),
        .chainin(u0_m0_wo1_cma0_s2),
        .resulta(u0_m0_wo1_cma0_s0),
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
        .scanout(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(37), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_m0_wo1_cma0_delay0 ( .xin(u0_m0_wo1_cma0_s0), .xout(u0_m0_wo1_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_m0_wo1_cma0_q = $unsigned(u0_m0_wo1_cma0_qq0[36:0]);

    // xMSB_uid425_u0_m0_wo0_mtree_mult1_0(BITSELECT,424)@15
    assign xMSB_uid425_u0_m0_wo0_mtree_mult1_0_b = $unsigned(u0_m0_wo0_wi0_r0_phasedelay0_q[15:15]);

    // sR_topExtension_uid427_u0_m0_wo0_mtree_mult1_0(BITJOIN,426)@15
    assign sR_topExtension_uid427_u0_m0_wo0_mtree_mult1_0_q = {xMSB_uid425_u0_m0_wo0_mtree_mult1_0_b, xMSB_uid425_u0_m0_wo0_mtree_mult1_0_b};

    // u0_m0_wo0_wi0_r0_delayr0_notEnable(LOGICAL,585)@15
    assign u0_m0_wo0_wi0_r0_delayr0_notEnable_q = $unsigned(~ (d_in0_m0_wi0_wo0_assign_id1_q_15_q));

    // u0_m0_wo0_wi0_r0_delayr0_nor(LOGICAL,586)@15
    assign u0_m0_wo0_wi0_r0_delayr0_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr0_notEnable_q | u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr0_mem_last(CONSTANT,582)
    assign u0_m0_wo0_wi0_r0_delayr0_mem_last_q = $unsigned(6'b010001);

    // u0_m0_wo0_wi0_r0_delayr0_cmp(LOGICAL,583)@15
    assign u0_m0_wo0_wi0_r0_delayr0_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr0_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr0_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr0_mem_last_q == u0_m0_wo0_wi0_r0_delayr0_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr0_cmpReg(REG,584)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_15_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_sticky_ena(REG,587)@15 + 1
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

    // u0_m0_wo0_wi0_r0_delayr0_enaAnd(LOGICAL,588)@15
    assign u0_m0_wo0_wi0_r0_delayr0_enaAnd_q = u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q & d_in0_m0_wi0_wo0_assign_id1_q_15_q;

    // u0_m0_wo0_wi0_r0_delayr0_rdcnt(COUNTER,579)@15 + 1
    // low=0, high=18, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_rdcnt_i <= 5'd0;
            u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_15_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_delayr0_rdcnt_i == 5'd17)
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(5'd14);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(5'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr0_rdcnt_q = u0_m0_wo0_wi0_r0_delayr0_rdcnt_i[4:0];

    // u0_m0_wo0_wi0_r0_delayr0_rdmux(MUX,580)@15
    assign u0_m0_wo0_wi0_r0_delayr0_rdmux_s = d_in0_m0_wi0_wo0_assign_id1_q_15_q;
    always @(u0_m0_wo0_wi0_r0_delayr0_rdmux_s or u0_m0_wo0_wi0_r0_delayr0_wraddr_q or u0_m0_wo0_wi0_r0_delayr0_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr0_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr0_rdmux_q = u0_m0_wo0_wi0_r0_delayr0_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr0_rdmux_q = u0_m0_wo0_wi0_r0_delayr0_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr0_rdmux_q = 5'b0;
        endcase
    end

    // d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt(ADD,625)@10 + 1
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_a = {1'b0, d_in0_m0_wi0_wo0_assign_id0_q_15_wraddr_q};
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_b = {1'b0, d_in0_m0_wi0_wo0_assign_id0_q_15_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_o <= $unsigned(d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_a) + $unsigned(d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_b);
        end
    end
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_q = d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_o[2:0];

    // d_in0_m0_wi0_wo0_assign_id0_q_15_wraddr(COUNTER,623)@10 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id0_q_15_wraddr_i <= $unsigned(d_in0_m0_wi0_wo0_assign_id0_q_15_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_wraddr_q = d_in0_m0_wi0_wo0_assign_id0_q_15_wraddr_i[1:0];

    // d_in0_m0_wi0_wo0_assign_id0_q_15_mem(DUALMEM,622)@10 + 2
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ia = $unsigned(xIn_0);
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_mem_aa = d_in0_m0_wi0_wo0_assign_id0_q_15_wraddr_q;
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ab = d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(4),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) d_in0_m0_wi0_wo0_assign_id0_q_15_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(d_in0_m0_wi0_wo0_assign_id0_q_15_mem_aa),
        .data_a(d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ab),
        .q_b(d_in0_m0_wi0_wo0_assign_id0_q_15_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
        .clock1(),
        .clocken1(),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_mem_q = d_in0_m0_wi0_wo0_assign_id0_q_15_mem_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr0_wraddr(REG,581)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(5'b10010);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_mem(DUALMEM,578)@15 + 2
    assign u0_m0_wo0_wi0_r0_delayr0_mem_ia = $unsigned(d_in0_m0_wi0_wo0_assign_id0_q_15_mem_q);
    assign u0_m0_wo0_wi0_r0_delayr0_mem_aa = u0_m0_wo0_wi0_r0_delayr0_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr0_mem_ab = u0_m0_wo0_wi0_r0_delayr0_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr0_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr0_mem_reset0 = areset;
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
    ) u0_m0_wo0_wi0_r0_delayr0_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr0_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr0_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr0_mem_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_15_q[0]),
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

    // u0_m0_wo0_wi0_r0_phasedelay0(DELAY,22)@15
    assign u0_m0_wo0_wi0_r0_phasedelay0_q = $unsigned(u0_m0_wo0_wi0_r0_delayr0_mem_q);

    // sR_mergedSignalTMB_uid428_u0_m0_wo0_mtree_mult1_0(BITJOIN,427)@15
    assign sR_mergedSignalTMB_uid428_u0_m0_wo0_mtree_mult1_0_q = {sR_topExtension_uid427_u0_m0_wo0_mtree_mult1_0_q, u0_m0_wo0_wi0_r0_phasedelay0_q, sR_bottomExtension_uid424_u0_m0_wo0_mtree_mult1_0_q};

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // d_u0_m0_wo0_compute_q_14(DELAY,574)@13 + 1
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

    // u0_m0_wo0_oseq_gated_reg(REG,28)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_oseq_gated_reg_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m0_wo0_oseq_gated_reg_q <= $unsigned(d_u0_m0_wo0_compute_q_14_q);
        end
    end

    // xOut(PORTOUT,418)@15 + 1
    assign xOut_v = u0_m0_wo0_oseq_gated_reg_q;
    assign xOut_c = {7'b0000000, GND_q};
    assign xOut_0 = {{6{sR_mergedSignalTMB_uid428_u0_m0_wo0_mtree_mult1_0_q[31]}}, sR_mergedSignalTMB_uid428_u0_m0_wo0_mtree_mult1_0_q};
    assign xOut_1 = {{1{u0_m0_wo1_cma0_q[36]}}, u0_m0_wo1_cma0_q};
    assign xOut_2 = {{6{sR_mergedSignalTMB_uid466_u1_m0_wo0_mtree_mult1_0_q[31]}}, sR_mergedSignalTMB_uid466_u1_m0_wo0_mtree_mult1_0_q};
    assign xOut_3 = {{1{u1_m0_wo1_cma0_q[36]}}, u1_m0_wo1_cma0_q};
    assign xOut_4 = {{6{sR_mergedSignalTMB_uid504_u2_m0_wo0_mtree_mult1_0_q[31]}}, sR_mergedSignalTMB_uid504_u2_m0_wo0_mtree_mult1_0_q};
    assign xOut_5 = {{1{u2_m0_wo1_cma0_q[36]}}, u2_m0_wo1_cma0_q};
    assign xOut_6 = {{6{sR_mergedSignalTMB_uid542_u3_m0_wo0_mtree_mult1_0_q[31]}}, sR_mergedSignalTMB_uid542_u3_m0_wo0_mtree_mult1_0_q};
    assign xOut_7 = {{1{u3_m0_wo1_cma0_q[36]}}, u3_m0_wo1_cma0_q};

endmodule
