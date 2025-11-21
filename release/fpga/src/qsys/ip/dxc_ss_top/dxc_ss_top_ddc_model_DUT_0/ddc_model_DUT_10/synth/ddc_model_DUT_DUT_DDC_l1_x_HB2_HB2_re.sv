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

// SystemVerilog created from ddc_model_DUT_DUT_DDC_l1_x_HB2_HB2_re
// SystemVerilog created on Thu Jan  9 15:36:33 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ddc_model_DUT_DUT_DDC_l1_x_HB2_HB2_re (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [15:0] xIn_0,
    input wire [15:0] xIn_1,
    input wire [15:0] xIn_2,
    input wire [15:0] xIn_3,
    output wire [0:0] xOut_v,
    output wire [7:0] xOut_c,
    output wire [36:0] xOut_0,
    output wire [36:0] xOut_1,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [15:0] d_xIn_1_13_q;
    reg [15:0] d_xIn_1_13_delay_0;
    reg [15:0] d_xIn_1_13_delay_1;
    reg [15:0] d_xIn_0_13_q;
    reg [15:0] d_xIn_0_13_delay_0;
    reg [15:0] d_xIn_0_13_delay_1;
    reg [15:0] d_in0_m0_wi0_wo0_assign_id0_q_14_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_11_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_13_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_13_delay_0;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_14_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_15_q;
    reg [2:0] u0_m0_wo0_run_count;
    wire [0:0] u0_m0_wo0_run_preEnaQ;
    reg [0:0] u0_m0_wo0_run_q;
    wire [0:0] u0_m0_wo0_run_out;
    reg [0:0] u0_m0_wo0_run_enableQ;
    wire [2:0] u0_m0_wo0_run_ctrl;
    reg [0:0] u0_m0_wo0_memread_q;
    reg [0:0] d_u0_m0_wo0_memread_q_13_q;
    reg [0:0] d_u0_m0_wo0_memread_q_14_q;
    reg [0:0] u0_m0_wo0_compute_q;
    reg [0:0] u0_m0_wo0_compute_delay_0;
    reg [0:0] u0_m0_wo0_compute_delay_1;
    reg [0:0] d_u0_m0_wo0_compute_q_13_q;
    reg [0:0] d_u0_m0_wo0_compute_q_14_q;
    reg [0:0] d_u0_m0_wo0_compute_q_17_q;
    reg [0:0] d_u0_m0_wo0_compute_q_17_delay_0;
    reg [0:0] d_u0_m0_wo0_compute_q_17_delay_1;
    reg [0:0] d_u0_m0_wo0_compute_q_18_q;
    reg [2:0] u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q;
    wire [2:0] u0_m0_wo0_wi0_r0_ra0_count0_q;
    (* preserve_syn_only *) reg [2:0] u0_m0_wo0_wi0_r0_ra0_count0_i;
    reg [3:0] u0_m0_wo0_wi0_r0_ra2_count0_lutreg_q;
    wire [3:0] u0_m0_wo0_wi0_r0_ra2_count0_q;
    (* preserve_syn_only *) reg [3:0] u0_m0_wo0_wi0_r0_ra2_count0_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_ra2_count0_eq;
    reg [3:0] u0_m0_wo0_wi0_r0_ra3_count0_lutreg_q;
    wire [3:0] u0_m0_wo0_wi0_r0_ra3_count0_q;
    (* preserve_syn_only *) reg [3:0] u0_m0_wo0_wi0_r0_ra3_count0_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_ra3_count0_eq;
    reg [1:0] u0_m0_wo0_wi0_r0_ra4_count0_lutreg_q;
    reg [0:0] u0_m0_wo0_wi0_r0_we4_seq_q;
    reg u0_m0_wo0_wi0_r0_we4_seq_eq;
    wire [2:0] u0_m0_wo0_wi0_r0_wa0_q;
    (* preserve_syn_only *) reg [2:0] u0_m0_wo0_wi0_r0_wa0_i;
    reg [2:0] d_u0_m0_wo0_wi0_r0_wa0_q_15_q;
    wire [3:0] u0_m0_wo0_wi0_r0_wa2_q;
    (* preserve_syn_only *) reg [3:0] u0_m0_wo0_wi0_r0_wa2_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_wa2_eq;
    reg [3:0] d_u0_m0_wo0_wi0_r0_wa2_q_15_q;
    wire [3:0] u0_m0_wo0_wi0_r0_wa3_q;
    (* preserve_syn_only *) reg [3:0] u0_m0_wo0_wi0_r0_wa3_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_wa3_eq;
    reg [3:0] d_u0_m0_wo0_wi0_r0_wa3_q_14_q;
    wire [1:0] u0_m0_wo0_wi0_r0_wa4_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_wa4_i;
    wire u0_m0_wo0_wi0_r0_memr0_reset0;
    wire [15:0] u0_m0_wo0_wi0_r0_memr0_ia;
    wire [2:0] u0_m0_wo0_wi0_r0_memr0_aa;
    wire [2:0] u0_m0_wo0_wi0_r0_memr0_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_memr0_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_memr0_q;
    reg [2:0] u0_m0_wo0_wi0_r0_readReg0_q;
    wire u0_m0_wo0_wi0_r0_memr2_reset0;
    wire [15:0] u0_m0_wo0_wi0_r0_memr2_ia;
    wire [3:0] u0_m0_wo0_wi0_r0_memr2_aa;
    wire [3:0] u0_m0_wo0_wi0_r0_memr2_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_memr2_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_memr2_q;
    reg [3:0] u0_m0_wo0_wi0_r0_readReg2_q;
    wire u0_m0_wo0_wi0_r0_memr3_reset0;
    wire [15:0] u0_m0_wo0_wi0_r0_memr3_ia;
    wire [3:0] u0_m0_wo0_wi0_r0_memr3_aa;
    wire [3:0] u0_m0_wo0_wi0_r0_memr3_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_memr3_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_memr3_q;
    reg [3:0] u0_m0_wo0_wi0_r0_readReg3_q;
    wire u0_m0_wo0_wi0_r0_memr4_reset0;
    wire [15:0] u0_m0_wo0_wi0_r0_memr4_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_memr4_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_memr4_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_memr4_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_memr4_q;
    reg [1:0] u0_m0_wo0_wi0_r0_readReg4_q;
    reg [15:0] u0_m0_wo0_wi0_r0_delayr1_q;
    reg [15:0] u0_m0_wo0_wi0_r0_delayr1_delay_0;
    reg [15:0] u0_m0_wo0_wi0_r0_delayr1_delay_1;
    wire [0:0] u0_m0_wo0_ca2_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_ca2_i;
    reg [0:0] u0_m0_wo0_symSuppress_2_seq_q;
    reg u0_m0_wo0_symSuppress_2_seq_eq;
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
    wire [36:0] u0_m0_wo0_cma0_s0;
    wire [43:0] u0_m0_wo0_cma0_s2;
    wire [0:0] u0_m0_wo0_cma0_anl;
    wire [36:0] u0_m0_wo0_cma0_qq0;
    reg [36:0] u0_m0_wo0_cma0_q;
    wire u0_m0_wo0_cma0_ena0;
    wire u0_m0_wo0_cma0_ena1;
    wire u0_m0_wo0_cma0_ena2;
    (* preserve_syn_only *) reg [15:0] u0_m0_wo0_cma0_zero;
    reg [0:0] u0_m0_wo0_aseq_q;
    reg u0_m0_wo0_aseq_eq;
    reg [0:0] u0_m0_wo0_oseq_q;
    reg u0_m0_wo0_oseq_eq;
    reg [0:0] u0_m0_wo0_oseq_gated_reg_q;
    reg [15:0] d_in1_m0_wi0_wo0_assign_id2_q_14_q;
    reg [2:0] u1_m0_wo0_run_count;
    wire [0:0] u1_m0_wo0_run_preEnaQ;
    reg [0:0] u1_m0_wo0_run_q;
    wire [0:0] u1_m0_wo0_run_out;
    reg [0:0] u1_m0_wo0_run_enableQ;
    wire [2:0] u1_m0_wo0_run_ctrl;
    reg [0:0] u1_m0_wo0_memread_q;
    reg [0:0] u1_m0_wo0_memread_delay_0;
    reg [0:0] d_u1_m0_wo0_memread_q_13_q;
    reg [0:0] d_u1_m0_wo0_memread_q_14_q;
    reg [0:0] u1_m0_wo0_compute_q;
    reg [0:0] u1_m0_wo0_compute_delay_0;
    reg [0:0] u1_m0_wo0_compute_delay_1;
    reg [0:0] d_u1_m0_wo0_compute_q_13_q;
    reg [0:0] d_u1_m0_wo0_compute_q_14_q;
    reg [0:0] d_u1_m0_wo0_compute_q_17_q;
    reg [0:0] d_u1_m0_wo0_compute_q_17_delay_0;
    reg [0:0] d_u1_m0_wo0_compute_q_17_delay_1;
    reg [0:0] d_u1_m0_wo0_compute_q_18_q;
    reg [2:0] u1_m0_wo0_wi0_r0_ra0_count0_lutreg_q;
    wire [2:0] u1_m0_wo0_wi0_r0_ra0_count0_q;
    (* preserve_syn_only *) reg [2:0] u1_m0_wo0_wi0_r0_ra0_count0_i;
    reg [3:0] u1_m0_wo0_wi0_r0_ra2_count0_lutreg_q;
    wire [3:0] u1_m0_wo0_wi0_r0_ra2_count0_q;
    (* preserve_syn_only *) reg [3:0] u1_m0_wo0_wi0_r0_ra2_count0_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_ra2_count0_eq;
    reg [3:0] u1_m0_wo0_wi0_r0_ra3_count0_lutreg_q;
    wire [3:0] u1_m0_wo0_wi0_r0_ra3_count0_q;
    (* preserve_syn_only *) reg [3:0] u1_m0_wo0_wi0_r0_ra3_count0_i;
    reg [1:0] u1_m0_wo0_wi0_r0_ra4_count0_lutreg_q;
    reg [0:0] u1_m0_wo0_wi0_r0_we4_seq_q;
    reg u1_m0_wo0_wi0_r0_we4_seq_eq;
    wire [3:0] u1_m0_wo0_wi0_r0_wa2_q;
    (* preserve_syn_only *) reg [3:0] u1_m0_wo0_wi0_r0_wa2_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_wa2_eq;
    reg [3:0] d_u1_m0_wo0_wi0_r0_wa2_q_15_q;
    wire [3:0] u1_m0_wo0_wi0_r0_wa3_q;
    (* preserve_syn_only *) reg [3:0] u1_m0_wo0_wi0_r0_wa3_i;
    reg [3:0] d_u1_m0_wo0_wi0_r0_wa3_q_14_q;
    wire [1:0] u1_m0_wo0_wi0_r0_wa4_q;
    (* preserve_syn_only *) reg [1:0] u1_m0_wo0_wi0_r0_wa4_i;
    wire u1_m0_wo0_wi0_r0_memr0_reset0;
    wire [15:0] u1_m0_wo0_wi0_r0_memr0_ia;
    wire [2:0] u1_m0_wo0_wi0_r0_memr0_aa;
    wire [2:0] u1_m0_wo0_wi0_r0_memr0_ab;
    wire [15:0] u1_m0_wo0_wi0_r0_memr0_iq;
    wire [15:0] u1_m0_wo0_wi0_r0_memr0_q;
    reg [2:0] u1_m0_wo0_wi0_r0_readReg0_q;
    wire u1_m0_wo0_wi0_r0_memr2_reset0;
    wire [15:0] u1_m0_wo0_wi0_r0_memr2_ia;
    wire [3:0] u1_m0_wo0_wi0_r0_memr2_aa;
    wire [3:0] u1_m0_wo0_wi0_r0_memr2_ab;
    wire [15:0] u1_m0_wo0_wi0_r0_memr2_iq;
    wire [15:0] u1_m0_wo0_wi0_r0_memr2_q;
    reg [3:0] u1_m0_wo0_wi0_r0_readReg2_q;
    wire u1_m0_wo0_wi0_r0_memr3_reset0;
    wire [15:0] u1_m0_wo0_wi0_r0_memr3_ia;
    wire [3:0] u1_m0_wo0_wi0_r0_memr3_aa;
    wire [3:0] u1_m0_wo0_wi0_r0_memr3_ab;
    wire [15:0] u1_m0_wo0_wi0_r0_memr3_iq;
    wire [15:0] u1_m0_wo0_wi0_r0_memr3_q;
    reg [3:0] u1_m0_wo0_wi0_r0_readReg3_q;
    wire u1_m0_wo0_wi0_r0_memr4_reset0;
    wire [15:0] u1_m0_wo0_wi0_r0_memr4_ia;
    wire [1:0] u1_m0_wo0_wi0_r0_memr4_aa;
    wire [1:0] u1_m0_wo0_wi0_r0_memr4_ab;
    wire [15:0] u1_m0_wo0_wi0_r0_memr4_iq;
    wire [15:0] u1_m0_wo0_wi0_r0_memr4_q;
    reg [1:0] u1_m0_wo0_wi0_r0_readReg4_q;
    reg [15:0] u1_m0_wo0_wi0_r0_delayr1_q;
    reg [15:0] u1_m0_wo0_wi0_r0_delayr1_delay_0;
    reg [15:0] u1_m0_wo0_wi0_r0_delayr1_delay_1;
    wire [0:0] u1_m0_wo0_ca2_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_ca2_i;
    reg [0:0] u1_m0_wo0_symSuppress_2_seq_q;
    reg u1_m0_wo0_symSuppress_2_seq_eq;
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
    wire [36:0] u1_m0_wo0_cma0_s0;
    wire [43:0] u1_m0_wo0_cma0_s2;
    wire [0:0] u1_m0_wo0_cma0_anl;
    wire [36:0] u1_m0_wo0_cma0_qq0;
    reg [36:0] u1_m0_wo0_cma0_q;
    wire u1_m0_wo0_cma0_ena0;
    wire u1_m0_wo0_cma0_ena1;
    wire u1_m0_wo0_cma0_ena2;
    (* preserve_syn_only *) reg [15:0] u1_m0_wo0_cma0_zero;
    reg [0:0] u1_m0_wo0_aseq_q;
    reg u1_m0_wo0_aseq_eq;
    reg [0:0] u1_m0_wo0_oseq_q;
    reg u1_m0_wo0_oseq_eq;
    reg [0:0] u1_m0_wo0_oseq_gated_reg_q;
    reg [15:0] d_in2_m0_wi0_wo0_assign_id4_q_15_q;
    reg [2:0] u2_m0_wo0_run_count;
    wire [0:0] u2_m0_wo0_run_preEnaQ;
    reg [0:0] u2_m0_wo0_run_q;
    wire [0:0] u2_m0_wo0_run_out;
    reg [0:0] u2_m0_wo0_run_enableQ;
    wire [2:0] u2_m0_wo0_run_ctrl;
    reg [0:0] u2_m0_wo0_memread_q;
    reg [0:0] d_u2_m0_wo0_memread_q_14_q;
    reg [0:0] d_u2_m0_wo0_memread_q_15_q;
    reg [0:0] u2_m0_wo0_compute_q;
    reg [0:0] u2_m0_wo0_compute_delay_0;
    reg [0:0] u2_m0_wo0_compute_delay_1;
    reg [0:0] d_u2_m0_wo0_compute_q_14_q;
    reg [0:0] d_u2_m0_wo0_compute_q_15_q;
    reg [0:0] d_u2_m0_wo0_compute_q_18_q;
    reg [0:0] d_u2_m0_wo0_compute_q_18_delay_0;
    reg [0:0] d_u2_m0_wo0_compute_q_18_delay_1;
    reg [0:0] d_u2_m0_wo0_compute_q_19_q;
    reg [2:0] u2_m0_wo0_wi0_r0_ra0_count0_lutreg_q;
    wire [2:0] u2_m0_wo0_wi0_r0_ra0_count0_q;
    (* preserve_syn_only *) reg [2:0] u2_m0_wo0_wi0_r0_ra0_count0_i;
    reg [3:0] u2_m0_wo0_wi0_r0_ra2_count0_lutreg_q;
    wire [3:0] u2_m0_wo0_wi0_r0_ra2_count0_q;
    (* preserve_syn_only *) reg [3:0] u2_m0_wo0_wi0_r0_ra2_count0_i;
    (* preserve_syn_only *) reg u2_m0_wo0_wi0_r0_ra2_count0_eq;
    reg [3:0] u2_m0_wo0_wi0_r0_ra3_count0_lutreg_q;
    wire [3:0] u2_m0_wo0_wi0_r0_ra3_count0_q;
    (* preserve_syn_only *) reg [3:0] u2_m0_wo0_wi0_r0_ra3_count0_i;
    (* preserve_syn_only *) reg u2_m0_wo0_wi0_r0_ra3_count0_eq;
    reg [1:0] u2_m0_wo0_wi0_r0_ra4_count0_lutreg_q;
    reg [0:0] u2_m0_wo0_wi0_r0_we4_seq_q;
    reg u2_m0_wo0_wi0_r0_we4_seq_eq;
    wire [1:0] u2_m0_wo0_wi0_r0_wa4_q;
    (* preserve_syn_only *) reg [1:0] u2_m0_wo0_wi0_r0_wa4_i;
    wire u2_m0_wo0_wi0_r0_memr0_reset0;
    wire [15:0] u2_m0_wo0_wi0_r0_memr0_ia;
    wire [2:0] u2_m0_wo0_wi0_r0_memr0_aa;
    wire [2:0] u2_m0_wo0_wi0_r0_memr0_ab;
    wire [15:0] u2_m0_wo0_wi0_r0_memr0_iq;
    wire [15:0] u2_m0_wo0_wi0_r0_memr0_q;
    reg [2:0] u2_m0_wo0_wi0_r0_readReg0_q;
    wire u2_m0_wo0_wi0_r0_memr2_reset0;
    wire [15:0] u2_m0_wo0_wi0_r0_memr2_ia;
    wire [3:0] u2_m0_wo0_wi0_r0_memr2_aa;
    wire [3:0] u2_m0_wo0_wi0_r0_memr2_ab;
    wire [15:0] u2_m0_wo0_wi0_r0_memr2_iq;
    wire [15:0] u2_m0_wo0_wi0_r0_memr2_q;
    reg [3:0] u2_m0_wo0_wi0_r0_readReg2_q;
    wire u2_m0_wo0_wi0_r0_memr3_reset0;
    wire [15:0] u2_m0_wo0_wi0_r0_memr3_ia;
    wire [3:0] u2_m0_wo0_wi0_r0_memr3_aa;
    wire [3:0] u2_m0_wo0_wi0_r0_memr3_ab;
    wire [15:0] u2_m0_wo0_wi0_r0_memr3_iq;
    wire [15:0] u2_m0_wo0_wi0_r0_memr3_q;
    reg [3:0] u2_m0_wo0_wi0_r0_readReg3_q;
    wire u2_m0_wo0_wi0_r0_memr4_reset0;
    wire [15:0] u2_m0_wo0_wi0_r0_memr4_ia;
    wire [1:0] u2_m0_wo0_wi0_r0_memr4_aa;
    wire [1:0] u2_m0_wo0_wi0_r0_memr4_ab;
    wire [15:0] u2_m0_wo0_wi0_r0_memr4_iq;
    wire [15:0] u2_m0_wo0_wi0_r0_memr4_q;
    reg [1:0] u2_m0_wo0_wi0_r0_readReg4_q;
    reg [15:0] u2_m0_wo0_wi0_r0_delayr1_q;
    reg [15:0] u2_m0_wo0_wi0_r0_delayr1_delay_0;
    reg [15:0] u2_m0_wo0_wi0_r0_delayr1_delay_1;
    wire [0:0] u2_m0_wo0_ca2_q;
    (* preserve_syn_only *) reg [0:0] u2_m0_wo0_ca2_i;
    reg [0:0] u2_m0_wo0_symSuppress_2_seq_q;
    reg u2_m0_wo0_symSuppress_2_seq_eq;
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
    wire [36:0] u2_m0_wo0_cma0_s0;
    wire [43:0] u2_m0_wo0_cma0_s2;
    wire [0:0] u2_m0_wo0_cma0_anl;
    wire [36:0] u2_m0_wo0_cma0_qq0;
    reg [36:0] u2_m0_wo0_cma0_q;
    wire u2_m0_wo0_cma0_ena0;
    wire u2_m0_wo0_cma0_ena1;
    wire u2_m0_wo0_cma0_ena2;
    (* preserve_syn_only *) reg [15:0] u2_m0_wo0_cma0_zero;
    reg [0:0] u2_m0_wo0_aseq_q;
    reg u2_m0_wo0_aseq_eq;
    reg [0:0] u2_m0_wo0_oseq_q;
    reg u2_m0_wo0_oseq_eq;
    reg [0:0] u2_m0_wo0_oseq_gated_reg_q;
    reg [15:0] d_in3_m0_wi0_wo0_assign_id6_q_15_q;
    reg [2:0] u3_m0_wo0_run_count;
    wire [0:0] u3_m0_wo0_run_preEnaQ;
    reg [0:0] u3_m0_wo0_run_q;
    wire [0:0] u3_m0_wo0_run_out;
    reg [0:0] u3_m0_wo0_run_enableQ;
    wire [2:0] u3_m0_wo0_run_ctrl;
    reg [0:0] u3_m0_wo0_memread_q;
    reg [0:0] u3_m0_wo0_memread_delay_0;
    reg [0:0] d_u3_m0_wo0_memread_q_14_q;
    reg [0:0] d_u3_m0_wo0_memread_q_15_q;
    reg [0:0] u3_m0_wo0_compute_q;
    reg [0:0] u3_m0_wo0_compute_delay_0;
    reg [0:0] u3_m0_wo0_compute_delay_1;
    reg [0:0] d_u3_m0_wo0_compute_q_14_q;
    reg [0:0] d_u3_m0_wo0_compute_q_15_q;
    reg [0:0] d_u3_m0_wo0_compute_q_18_q;
    reg [0:0] d_u3_m0_wo0_compute_q_18_delay_0;
    reg [0:0] d_u3_m0_wo0_compute_q_18_delay_1;
    reg [0:0] d_u3_m0_wo0_compute_q_19_q;
    reg [2:0] u3_m0_wo0_wi0_r0_ra0_count0_lutreg_q;
    wire [2:0] u3_m0_wo0_wi0_r0_ra0_count0_q;
    (* preserve_syn_only *) reg [2:0] u3_m0_wo0_wi0_r0_ra0_count0_i;
    reg [3:0] u3_m0_wo0_wi0_r0_ra2_count0_lutreg_q;
    wire [3:0] u3_m0_wo0_wi0_r0_ra2_count0_q;
    (* preserve_syn_only *) reg [3:0] u3_m0_wo0_wi0_r0_ra2_count0_i;
    (* preserve_syn_only *) reg u3_m0_wo0_wi0_r0_ra2_count0_eq;
    reg [3:0] u3_m0_wo0_wi0_r0_ra3_count0_lutreg_q;
    wire [3:0] u3_m0_wo0_wi0_r0_ra3_count0_q;
    (* preserve_syn_only *) reg [3:0] u3_m0_wo0_wi0_r0_ra3_count0_i;
    reg [1:0] u3_m0_wo0_wi0_r0_ra4_count0_lutreg_q;
    reg [0:0] u3_m0_wo0_wi0_r0_we4_seq_q;
    reg u3_m0_wo0_wi0_r0_we4_seq_eq;
    wire [1:0] u3_m0_wo0_wi0_r0_wa4_q;
    (* preserve_syn_only *) reg [1:0] u3_m0_wo0_wi0_r0_wa4_i;
    wire u3_m0_wo0_wi0_r0_memr0_reset0;
    wire [15:0] u3_m0_wo0_wi0_r0_memr0_ia;
    wire [2:0] u3_m0_wo0_wi0_r0_memr0_aa;
    wire [2:0] u3_m0_wo0_wi0_r0_memr0_ab;
    wire [15:0] u3_m0_wo0_wi0_r0_memr0_iq;
    wire [15:0] u3_m0_wo0_wi0_r0_memr0_q;
    reg [2:0] u3_m0_wo0_wi0_r0_readReg0_q;
    wire u3_m0_wo0_wi0_r0_memr2_reset0;
    wire [15:0] u3_m0_wo0_wi0_r0_memr2_ia;
    wire [3:0] u3_m0_wo0_wi0_r0_memr2_aa;
    wire [3:0] u3_m0_wo0_wi0_r0_memr2_ab;
    wire [15:0] u3_m0_wo0_wi0_r0_memr2_iq;
    wire [15:0] u3_m0_wo0_wi0_r0_memr2_q;
    reg [3:0] u3_m0_wo0_wi0_r0_readReg2_q;
    wire u3_m0_wo0_wi0_r0_memr3_reset0;
    wire [15:0] u3_m0_wo0_wi0_r0_memr3_ia;
    wire [3:0] u3_m0_wo0_wi0_r0_memr3_aa;
    wire [3:0] u3_m0_wo0_wi0_r0_memr3_ab;
    wire [15:0] u3_m0_wo0_wi0_r0_memr3_iq;
    wire [15:0] u3_m0_wo0_wi0_r0_memr3_q;
    reg [3:0] u3_m0_wo0_wi0_r0_readReg3_q;
    wire u3_m0_wo0_wi0_r0_memr4_reset0;
    wire [15:0] u3_m0_wo0_wi0_r0_memr4_ia;
    wire [1:0] u3_m0_wo0_wi0_r0_memr4_aa;
    wire [1:0] u3_m0_wo0_wi0_r0_memr4_ab;
    wire [15:0] u3_m0_wo0_wi0_r0_memr4_iq;
    wire [15:0] u3_m0_wo0_wi0_r0_memr4_q;
    reg [1:0] u3_m0_wo0_wi0_r0_readReg4_q;
    reg [15:0] u3_m0_wo0_wi0_r0_delayr1_q;
    reg [15:0] u3_m0_wo0_wi0_r0_delayr1_delay_0;
    reg [15:0] u3_m0_wo0_wi0_r0_delayr1_delay_1;
    wire [0:0] u3_m0_wo0_ca2_q;
    (* preserve_syn_only *) reg [0:0] u3_m0_wo0_ca2_i;
    reg [0:0] u3_m0_wo0_symSuppress_2_seq_q;
    reg u3_m0_wo0_symSuppress_2_seq_eq;
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
    wire [36:0] u3_m0_wo0_cma0_s0;
    wire [43:0] u3_m0_wo0_cma0_s2;
    wire [0:0] u3_m0_wo0_cma0_anl;
    wire [36:0] u3_m0_wo0_cma0_qq0;
    reg [36:0] u3_m0_wo0_cma0_q;
    wire u3_m0_wo0_cma0_ena0;
    wire u3_m0_wo0_cma0_ena1;
    wire u3_m0_wo0_cma0_ena2;
    (* preserve_syn_only *) reg [15:0] u3_m0_wo0_cma0_zero;
    reg [0:0] u3_m0_wo0_aseq_q;
    reg u3_m0_wo0_aseq_eq;
    reg [0:0] u3_m0_wo0_oseq_q;
    reg u3_m0_wo0_oseq_eq;
    reg [0:0] u3_m0_wo0_oseq_gated_reg_q;
    reg [36:0] out0_m0_wo0_data_selector_q;
    reg [0:0] out0_m0_wo0_data_selector_v;
    reg [0:0] d_out0_m0_wo0_data_selector_v_21_q;
    reg [36:0] d_out0_m0_wo0_data_selector_q_21_q;
    reg [36:0] out1_m0_wo0_data_selector_q;
    wire [1:0] outchan_q;
    (* preserve_syn_only *) reg [0:0] outchan_i;
    wire [0:0] u0_m0_wo0_cma0_mux_2_s;
    reg [15:0] u0_m0_wo0_cma0_mux_2_q;
    wire [0:0] u1_m0_wo0_cma0_mux_2_s;
    reg [15:0] u1_m0_wo0_cma0_mux_2_q;
    wire [0:0] u2_m0_wo0_cma0_mux_2_s;
    reg [15:0] u2_m0_wo0_cma0_mux_2_q;
    wire [0:0] u3_m0_wo0_cma0_mux_2_s;
    reg [15:0] u3_m0_wo0_cma0_mux_2_q;
    wire u0_m0_wo0_wi0_r0_delayr5_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr5_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr5_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr5_mem_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr5_mem_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr5_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr5_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr5_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr5_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr5_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr5_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr5_sticky_ena_q;
    wire u1_m0_wo0_wi0_r0_delayr5_mem_reset0;
    wire u1_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr5_mem_ia;
    wire [1:0] u1_m0_wo0_wi0_r0_delayr5_mem_aa;
    wire [1:0] u1_m0_wo0_wi0_r0_delayr5_mem_ab;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr5_mem_iq;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr5_mem_q;
    wire [1:0] u1_m0_wo0_wi0_r0_delayr5_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u1_m0_wo0_wi0_r0_delayr5_rdcnt_i;
    reg [1:0] u1_m0_wo0_wi0_r0_delayr5_wraddr_q;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr5_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr5_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr5_sticky_ena_q;
    wire u2_m0_wo0_wi0_r0_delayr5_mem_reset0;
    wire u2_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB;
    wire [15:0] u2_m0_wo0_wi0_r0_delayr5_mem_ia;
    wire [1:0] u2_m0_wo0_wi0_r0_delayr5_mem_aa;
    wire [1:0] u2_m0_wo0_wi0_r0_delayr5_mem_ab;
    wire [15:0] u2_m0_wo0_wi0_r0_delayr5_mem_iq;
    wire [15:0] u2_m0_wo0_wi0_r0_delayr5_mem_q;
    wire [1:0] u2_m0_wo0_wi0_r0_delayr5_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u2_m0_wo0_wi0_r0_delayr5_rdcnt_i;
    reg [1:0] u2_m0_wo0_wi0_r0_delayr5_wraddr_q;
    wire [2:0] u2_m0_wo0_wi0_r0_delayr5_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u2_m0_wo0_wi0_r0_delayr5_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u2_m0_wo0_wi0_r0_delayr5_sticky_ena_q;
    wire u3_m0_wo0_wi0_r0_delayr5_mem_reset0;
    wire u3_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB;
    wire [15:0] u3_m0_wo0_wi0_r0_delayr5_mem_ia;
    wire [1:0] u3_m0_wo0_wi0_r0_delayr5_mem_aa;
    wire [1:0] u3_m0_wo0_wi0_r0_delayr5_mem_ab;
    wire [15:0] u3_m0_wo0_wi0_r0_delayr5_mem_iq;
    wire [15:0] u3_m0_wo0_wi0_r0_delayr5_mem_q;
    wire [1:0] u3_m0_wo0_wi0_r0_delayr5_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u3_m0_wo0_wi0_r0_delayr5_rdcnt_i;
    reg [1:0] u3_m0_wo0_wi0_r0_delayr5_wraddr_q;
    wire [2:0] u3_m0_wo0_wi0_r0_delayr5_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u3_m0_wo0_wi0_r0_delayr5_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u3_m0_wo0_wi0_r0_delayr5_sticky_ena_q;
    wire d_xIn_2_14_mem_reset0;
    wire [15:0] d_xIn_2_14_mem_ia;
    wire [1:0] d_xIn_2_14_mem_aa;
    wire [1:0] d_xIn_2_14_mem_ab;
    wire [15:0] d_xIn_2_14_mem_iq;
    wire [15:0] d_xIn_2_14_mem_q;
    wire [1:0] d_xIn_2_14_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] d_xIn_2_14_wraddr_i = 2'b11;
    wire [1:0] d_xIn_2_14_offset_q;
    wire [2:0] d_xIn_2_14_rdcnt_a;
    wire [2:0] d_xIn_2_14_rdcnt_b;
    logic [2:0] d_xIn_2_14_rdcnt_o;
    wire [2:0] d_xIn_2_14_rdcnt_q;
    wire d_xIn_3_14_mem_reset0;
    wire [15:0] d_xIn_3_14_mem_ia;
    wire [1:0] d_xIn_3_14_mem_aa;
    wire [1:0] d_xIn_3_14_mem_ab;
    wire [15:0] d_xIn_3_14_mem_iq;
    wire [15:0] d_xIn_3_14_mem_q;
    wire [1:0] d_xIn_3_14_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] d_xIn_3_14_wraddr_i = 2'b11;
    wire [2:0] d_xIn_3_14_rdcnt_a;
    wire [2:0] d_xIn_3_14_rdcnt_b;
    logic [2:0] d_xIn_3_14_rdcnt_o;
    wire [2:0] d_xIn_3_14_rdcnt_q;
    wire [0:0] u0_m0_wo0_oseq_gated_q;
    wire [0:0] u1_m0_wo0_oseq_gated_q;
    wire [0:0] u2_m0_wo0_oseq_gated_q;
    wire [0:0] u3_m0_wo0_oseq_gated_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr5_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr5_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr5_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr5_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr5_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr5_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr5_enaAnd_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr5_rdmux_s;
    reg [1:0] u1_m0_wo0_wi0_r0_delayr5_rdmux_q;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr5_cmp_b;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr5_cmp_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr5_notEnable_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr5_nor_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr5_enaAnd_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr5_rdmux_s;
    reg [1:0] u2_m0_wo0_wi0_r0_delayr5_rdmux_q;
    wire [2:0] u2_m0_wo0_wi0_r0_delayr5_cmp_b;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr5_cmp_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr5_notEnable_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr5_nor_q;
    wire [0:0] u2_m0_wo0_wi0_r0_delayr5_enaAnd_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr5_rdmux_s;
    reg [1:0] u3_m0_wo0_wi0_r0_delayr5_rdmux_q;
    wire [2:0] u3_m0_wo0_wi0_r0_delayr5_cmp_b;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr5_cmp_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr5_notEnable_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr5_nor_q;
    wire [0:0] u3_m0_wo0_wi0_r0_delayr5_enaAnd_q;
    reg [2:0] u0_m0_wo0_wi0_r0_ra0_count0_lut_q;
    reg [1:0] u0_m0_wo0_wi0_r0_ra4_count0_lut_q;
    reg [3:0] u0_m0_wo0_wi0_r0_ra2_count0_lut_q;
    reg [3:0] u0_m0_wo0_wi0_r0_ra3_count0_lut_q;
    reg [2:0] u1_m0_wo0_wi0_r0_ra0_count0_lut_q;
    reg [1:0] u1_m0_wo0_wi0_r0_ra4_count0_lut_q;
    reg [3:0] u1_m0_wo0_wi0_r0_ra2_count0_lut_q;
    reg [3:0] u1_m0_wo0_wi0_r0_ra3_count0_lut_q;
    reg [2:0] u2_m0_wo0_wi0_r0_ra0_count0_lut_q;
    reg [1:0] u2_m0_wo0_wi0_r0_ra4_count0_lut_q;
    reg [3:0] u2_m0_wo0_wi0_r0_ra2_count0_lut_q;
    reg [3:0] u2_m0_wo0_wi0_r0_ra3_count0_lut_q;
    reg [2:0] u3_m0_wo0_wi0_r0_ra0_count0_lut_q;
    reg [1:0] u3_m0_wo0_wi0_r0_ra4_count0_lut_q;
    reg [3:0] u3_m0_wo0_wi0_r0_ra2_count0_lut_q;
    reg [3:0] u3_m0_wo0_wi0_r0_ra3_count0_lut_q;

    import ddc_model_DUT_safe_path_ver::safe_path_ver;

    // d_in0_m0_wi0_wo0_assign_id1_q_11(DELAY,268)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_11_q <= '0;
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_11_q <= $unsigned(xIn_v);
        end
    end

    // u3_m0_wo0_run(ENABLEGENERATOR,193)@11 + 2
    assign u3_m0_wo0_run_ctrl = { u3_m0_wo0_run_out, d_in0_m0_wi0_wo0_assign_id1_q_11_q, u3_m0_wo0_run_enableQ };
    always @ (posedge clk)
    begin
        reg [0:0] u3_m0_wo0_run_enable_c;
        reg [2:0] u3_m0_wo0_run_inc;
        if (areset)
        begin
            u3_m0_wo0_run_q <= $unsigned(1'b0);
            u3_m0_wo0_run_enable_c = 1'd0;
            u3_m0_wo0_run_enableQ <= $unsigned(1'b0);
            u3_m0_wo0_run_count <= $unsigned(3'b000);
            u3_m0_wo0_run_inc = 3'b0;
        end
        else
        begin
            if (u3_m0_wo0_run_out == 1'b1)
            begin
                if (u3_m0_wo0_run_enable_c[0] == 1'b1)
                begin
                    u3_m0_wo0_run_enable_c = $signed(u3_m0_wo0_run_enable_c) - $signed(-1'd1);
                end
                else
                begin
                    u3_m0_wo0_run_enable_c = $signed(u3_m0_wo0_run_enable_c) + $signed(-1'd1);
                end
                u3_m0_wo0_run_enableQ <= $unsigned(u3_m0_wo0_run_enable_c[0:0]);
            end
            else
            begin
                u3_m0_wo0_run_enableQ <= $unsigned(1'b0);
            end
            unique case (u3_m0_wo0_run_ctrl)
                3'b000, 3'b001 : u3_m0_wo0_run_inc = 3'b000;
                3'b010, 3'b011 : u3_m0_wo0_run_inc = 3'b111;
                3'b100 : u3_m0_wo0_run_inc = 3'b000;
                3'b101 : u3_m0_wo0_run_inc = 3'b010;
                3'b110 : u3_m0_wo0_run_inc = 3'b111;
                3'b111 : u3_m0_wo0_run_inc = 3'b001;
                default : ;
            endcase
            u3_m0_wo0_run_count <= $unsigned($signed(u3_m0_wo0_run_count) + $signed(u3_m0_wo0_run_inc));
            u3_m0_wo0_run_q <= u3_m0_wo0_run_out;
        end
    end
    assign u3_m0_wo0_run_preEnaQ = u3_m0_wo0_run_count[2:2];
    assign u3_m0_wo0_run_out = u3_m0_wo0_run_preEnaQ & VCC_q;

    // u3_m0_wo0_memread(DELAY,194)@13
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_memread_delay_0 <= '0;
        end
        else
        begin
            u3_m0_wo0_memread_delay_0 <= $unsigned(u3_m0_wo0_run_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u3_m0_wo0_memread_q <= u3_m0_wo0_memread_delay_0;
        end
    end

    // d_u3_m0_wo0_memread_q_14(DELAY,298)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u3_m0_wo0_memread_q_14_q <= $unsigned(u3_m0_wo0_memread_q);
        end
    end

    // d_u3_m0_wo0_memread_q_15(DELAY,299)@14 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u3_m0_wo0_memread_q_15_q <= $unsigned(d_u3_m0_wo0_memread_q_14_q);
        end
    end

    // u3_m0_wo0_wi0_r0_ra2_count0(COUNTER,204)@15
    // low=0, high=13, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_ra2_count0_i <= 4'd1;
            u3_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b0;
        end
        else if (d_u3_m0_wo0_memread_q_15_q == 1'b1)
        begin
            if (u3_m0_wo0_wi0_r0_ra2_count0_i == 4'd12)
            begin
                u3_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b1;
            end
            else
            begin
                u3_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b0;
            end
            if (u3_m0_wo0_wi0_r0_ra2_count0_eq == 1'b1)
            begin
                u3_m0_wo0_wi0_r0_ra2_count0_i <= $unsigned(u3_m0_wo0_wi0_r0_ra2_count0_i) + $unsigned(4'd3);
            end
            else
            begin
                u3_m0_wo0_wi0_r0_ra2_count0_i <= $unsigned(u3_m0_wo0_wi0_r0_ra2_count0_i) + $unsigned(4'd1);
            end
        end
    end
    assign u3_m0_wo0_wi0_r0_ra2_count0_q = u3_m0_wo0_wi0_r0_ra2_count0_i[3:0];

    // u3_m0_wo0_wi0_r0_ra2_count0_lut(LOOKUP,202)@15
    always @(u3_m0_wo0_wi0_r0_ra2_count0_q)
    begin
        // Begin reserved scope level
        unique case (u3_m0_wo0_wi0_r0_ra2_count0_q)
            4'b0000 : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0000;
            4'b0001 : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0001;
            4'b0010 : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0010;
            4'b0011 : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0011;
            4'b0100 : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0100;
            4'b0101 : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0101;
            4'b0110 : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0110;
            4'b0111 : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0111;
            4'b1000 : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1000;
            4'b1001 : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1001;
            4'b1010 : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1010;
            4'b1011 : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1011;
            4'b1100 : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1100;
            4'b1101 : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1101;
            default : u3_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0000;
        endcase
        // End reserved scope level
    end

    // u3_m0_wo0_wi0_r0_ra2_count0_lutreg(REG,203)@15
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_ra2_count0_lutreg_q <= $unsigned(4'b0000);
        end
        else if (d_u3_m0_wo0_memread_q_15_q == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_ra2_count0_lutreg_q <= $unsigned(u3_m0_wo0_wi0_r0_ra2_count0_lut_q);
        end
    end

    // u3_m0_wo0_wi0_r0_readReg2(DELAY,221)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u3_m0_wo0_wi0_r0_readReg2_q <= u3_m0_wo0_wi0_r0_ra2_count0_lutreg_q;
        end
    end

    // d_xIn_2_14_offset(CONSTANT,352)
    assign d_xIn_2_14_offset_q = $unsigned(2'b11);

    // d_xIn_3_14_rdcnt(ADD,357)@10 + 1
    assign d_xIn_3_14_rdcnt_a = {1'b0, d_xIn_3_14_wraddr_q};
    assign d_xIn_3_14_rdcnt_b = {1'b0, d_xIn_2_14_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_xIn_3_14_rdcnt_o <= $unsigned(d_xIn_3_14_rdcnt_a) + $unsigned(d_xIn_3_14_rdcnt_b);
        end
    end
    assign d_xIn_3_14_rdcnt_q = d_xIn_3_14_rdcnt_o[2:0];

    // d_xIn_3_14_wraddr(COUNTER,355)@10 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_xIn_3_14_wraddr_i <= $unsigned(d_xIn_3_14_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign d_xIn_3_14_wraddr_q = d_xIn_3_14_wraddr_i[1:0];

    // d_xIn_3_14_mem(DUALMEM,354)@10 + 2
    assign d_xIn_3_14_mem_ia = $unsigned(xIn_3);
    assign d_xIn_3_14_mem_aa = d_xIn_3_14_wraddr_q;
    assign d_xIn_3_14_mem_ab = d_xIn_3_14_rdcnt_q[1:0];
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
    ) d_xIn_3_14_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(d_xIn_3_14_mem_aa),
        .data_a(d_xIn_3_14_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_xIn_3_14_mem_ab),
        .q_b(d_xIn_3_14_mem_iq),
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
    assign d_xIn_3_14_mem_q = d_xIn_3_14_mem_iq[15:0];

    // d_in3_m0_wi0_wo0_assign_id6_q_15(DELAY,297)@14 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in3_m0_wi0_wo0_assign_id6_q_15_q <= $unsigned(d_xIn_3_14_mem_q);
        end
    end

    // d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,269)@11 + 2
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_13_delay_0 <= $unsigned(d_in0_m0_wi0_wo0_assign_id1_q_11_q);
            d_in0_m0_wi0_wo0_assign_id1_q_13_q <= d_in0_m0_wi0_wo0_assign_id1_q_13_delay_0;
        end
    end

    // d_in0_m0_wi0_wo0_assign_id1_q_14(DELAY,270)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_14_q <= $unsigned(d_in0_m0_wi0_wo0_assign_id1_q_13_q);
        end
    end

    // d_in0_m0_wi0_wo0_assign_id1_q_15(DELAY,271)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_15_q <= '0;
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_15_q <= $unsigned(d_in0_m0_wi0_wo0_assign_id1_q_14_q);
        end
    end

    // u1_m0_wo0_wi0_r0_wa2(COUNTER,95)@14
    // low=0, high=13, step=1, init=8
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_wa2_i <= 4'd8;
            u1_m0_wo0_wi0_r0_wa2_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_14_q == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_wa2_i == 4'd12)
            begin
                u1_m0_wo0_wi0_r0_wa2_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_wa2_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_wa2_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_wa2_i <= $unsigned(u1_m0_wo0_wi0_r0_wa2_i) + $unsigned(4'd3);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_wa2_i <= $unsigned(u1_m0_wo0_wi0_r0_wa2_i) + $unsigned(4'd1);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_wa2_q = u1_m0_wo0_wi0_r0_wa2_i[3:0];

    // d_u1_m0_wo0_wi0_r0_wa2_q_15(DELAY,288)@14 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u1_m0_wo0_wi0_r0_wa2_q_15_q <= u1_m0_wo0_wi0_r0_wa2_q;
        end
    end

    // u3_m0_wo0_wi0_r0_memr2(DUALMEM,219)@15
    assign u3_m0_wo0_wi0_r0_memr2_ia = $unsigned(d_in3_m0_wi0_wo0_assign_id6_q_15_q);
    assign u3_m0_wo0_wi0_r0_memr2_aa = d_u1_m0_wo0_wi0_r0_wa2_q_15_q;
    assign u3_m0_wo0_wi0_r0_memr2_ab = u3_m0_wo0_wi0_r0_readReg2_q;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(4),
        .numwords_a(14),
        .width_b(16),
        .widthad_b(4),
        .numwords_b(14),
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u3_m0_wo0_wi0_r0_memr2_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u3_m0_wo0_wi0_r0_memr2_aa),
        .data_a(u3_m0_wo0_wi0_r0_memr2_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_15_q[0]),
        .address_b(u3_m0_wo0_wi0_r0_memr2_ab),
        .q_b(u3_m0_wo0_wi0_r0_memr2_iq),
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
    assign u3_m0_wo0_wi0_r0_memr2_q = u3_m0_wo0_wi0_r0_memr2_iq[15:0];

    // u3_m0_wo0_wi0_r0_ra3_count0(COUNTER,207)@14
    // low=0, high=15, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_ra3_count0_i <= 4'd1;
        end
        else if (d_u3_m0_wo0_memread_q_14_q == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_ra3_count0_i <= $unsigned(u3_m0_wo0_wi0_r0_ra3_count0_i) + $unsigned(4'd1);
        end
    end
    assign u3_m0_wo0_wi0_r0_ra3_count0_q = u3_m0_wo0_wi0_r0_ra3_count0_i[3:0];

    // u3_m0_wo0_wi0_r0_ra3_count0_lut(LOOKUP,205)@14
    always @(u3_m0_wo0_wi0_r0_ra3_count0_q)
    begin
        // Begin reserved scope level
        unique case (u3_m0_wo0_wi0_r0_ra3_count0_q)
            4'b0000 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0010;
            4'b0001 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0001;
            4'b0010 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0100;
            4'b0011 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0011;
            4'b0100 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0110;
            4'b0101 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0101;
            4'b0110 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1000;
            4'b0111 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0111;
            4'b1000 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1010;
            4'b1001 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1001;
            4'b1010 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1100;
            4'b1011 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1011;
            4'b1100 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1110;
            4'b1101 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1101;
            4'b1110 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0000;
            4'b1111 : u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1111;
            default : begin
                          // unreachable
                          u3_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'bxxxx;
                      end
        endcase
        // End reserved scope level
    end

    // u3_m0_wo0_wi0_r0_ra3_count0_lutreg(REG,206)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_ra3_count0_lutreg_q <= $unsigned(4'b0010);
        end
        else if (d_u3_m0_wo0_memread_q_14_q == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_ra3_count0_lutreg_q <= $unsigned(u3_m0_wo0_wi0_r0_ra3_count0_lut_q);
        end
    end

    // u3_m0_wo0_wi0_r0_readReg3(DELAY,224)@14
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u3_m0_wo0_wi0_r0_readReg3_q <= u3_m0_wo0_wi0_r0_ra3_count0_lutreg_q;
        end
    end

    // u1_m0_wo0_wi0_r0_wa3(COUNTER,96)@13
    // low=0, high=15, step=1, init=10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_wa3_i <= 4'd10;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_13_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_wa3_i <= $unsigned(u1_m0_wo0_wi0_r0_wa3_i) + $unsigned(4'd1);
        end
    end
    assign u1_m0_wo0_wi0_r0_wa3_q = u1_m0_wo0_wi0_r0_wa3_i[3:0];

    // d_u1_m0_wo0_wi0_r0_wa3_q_14(DELAY,289)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u1_m0_wo0_wi0_r0_wa3_q_14_q <= u1_m0_wo0_wi0_r0_wa3_q;
        end
    end

    // u3_m0_wo0_wi0_r0_memr3(DUALMEM,222)@14
    assign u3_m0_wo0_wi0_r0_memr3_ia = $unsigned(d_xIn_3_14_mem_q);
    assign u3_m0_wo0_wi0_r0_memr3_aa = d_u1_m0_wo0_wi0_r0_wa3_q_14_q;
    assign u3_m0_wo0_wi0_r0_memr3_ab = u3_m0_wo0_wi0_r0_readReg3_q;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(4),
        .numwords_a(16),
        .width_b(16),
        .widthad_b(4),
        .numwords_b(16),
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u3_m0_wo0_wi0_r0_memr3_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u3_m0_wo0_wi0_r0_memr3_aa),
        .data_a(u3_m0_wo0_wi0_r0_memr3_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_14_q[0]),
        .address_b(u3_m0_wo0_wi0_r0_memr3_ab),
        .q_b(u3_m0_wo0_wi0_r0_memr3_iq),
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
    assign u3_m0_wo0_wi0_r0_memr3_q = u3_m0_wo0_wi0_r0_memr3_iq[15:0];

    // u3_m0_wo0_compute(DELAY,196)@13
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_compute_delay_0 <= '0;
        end
        else
        begin
            u3_m0_wo0_compute_delay_0 <= $unsigned(u3_m0_wo0_memread_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u3_m0_wo0_compute_delay_1 <= u3_m0_wo0_compute_delay_0;
            u3_m0_wo0_compute_q <= u3_m0_wo0_compute_delay_1;
        end
    end

    // u3_m0_wo0_symSuppress_2_seq(SEQUENCE,239)@13 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u3_m0_wo0_symSuppress_2_seq_c;
        if (areset)
        begin
            u3_m0_wo0_symSuppress_2_seq_c = 4'b0000;
            u3_m0_wo0_symSuppress_2_seq_q <= $unsigned(1'b0);
            u3_m0_wo0_symSuppress_2_seq_eq <= 1'b0;
        end
        else
        begin
            if (u3_m0_wo0_compute_q == 1'b1)
            begin
                if (u3_m0_wo0_symSuppress_2_seq_c == 4'b0000)
                begin
                    u3_m0_wo0_symSuppress_2_seq_eq <= 1'b1;
                end
                else
                begin
                    u3_m0_wo0_symSuppress_2_seq_eq <= 1'b0;
                end
                if (u3_m0_wo0_symSuppress_2_seq_eq == 1'b1)
                begin
                    u3_m0_wo0_symSuppress_2_seq_c = $signed(u3_m0_wo0_symSuppress_2_seq_c) + $signed(4'd1);
                end
                else
                begin
                    u3_m0_wo0_symSuppress_2_seq_c = $signed(u3_m0_wo0_symSuppress_2_seq_c) - $signed(4'd1);
                end
                u3_m0_wo0_symSuppress_2_seq_q <= $unsigned(u3_m0_wo0_symSuppress_2_seq_c[3:3]);
            end
        end
    end

    // u3_m0_wo0_cma0_mux_2(MUX,262)@14 + 1
    assign u3_m0_wo0_cma0_mux_2_s = u3_m0_wo0_symSuppress_2_seq_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (u3_m0_wo0_cma0_mux_2_s)
                1'b0 : u3_m0_wo0_cma0_mux_2_q <= u3_m0_wo0_wi0_r0_memr3_q;
                1'b1 : u3_m0_wo0_cma0_mux_2_q <= {{15{GND_q[0]}}, GND_q};
                default : u3_m0_wo0_cma0_mux_2_q <= 16'b0;
            endcase
        end
    end

    // u3_m0_wo0_wi0_r0_delayr1(DELAY,228)@15
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr1_delay_0 <= '0;
            u3_m0_wo0_wi0_r0_delayr1_delay_1 <= '0;
            u3_m0_wo0_wi0_r0_delayr1_q <= '0;
        end
        else if (d_u3_m0_wo0_compute_q_15_q == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_delayr1_delay_0 <= $unsigned(u3_m0_wo0_wi0_r0_memr0_q);
            u3_m0_wo0_wi0_r0_delayr1_delay_1 <= u3_m0_wo0_wi0_r0_delayr1_delay_0;
            u3_m0_wo0_wi0_r0_delayr1_q <= u3_m0_wo0_wi0_r0_delayr1_delay_1;
        end
    end

    // u3_m0_wo0_wi0_r0_ra0_count0(COUNTER,201)@15
    // low=0, high=7, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_ra0_count0_i <= 3'd1;
        end
        else if (d_u3_m0_wo0_memread_q_15_q == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_ra0_count0_i <= $unsigned(u3_m0_wo0_wi0_r0_ra0_count0_i) + $unsigned(3'd1);
        end
    end
    assign u3_m0_wo0_wi0_r0_ra0_count0_q = u3_m0_wo0_wi0_r0_ra0_count0_i[2:0];

    // u3_m0_wo0_wi0_r0_ra4_count0_lut(LOOKUP,208)@15
    always @(u3_m0_wo0_wi0_r0_ra0_count0_q)
    begin
        // Begin reserved scope level
        unique case (u3_m0_wo0_wi0_r0_ra0_count0_q)
            3'b000 : u3_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b00;
            3'b001 : u3_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b10;
            3'b010 : u3_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b01;
            3'b011 : u3_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b11;
            3'b100 : u3_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b10;
            3'b101 : u3_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b00;
            3'b110 : u3_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b11;
            3'b111 : u3_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b01;
            default : begin
                          // unreachable
                          u3_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'bxx;
                      end
        endcase
        // End reserved scope level
    end

    // u3_m0_wo0_wi0_r0_ra4_count0_lutreg(REG,209)@15
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_ra4_count0_lutreg_q <= $unsigned(2'b00);
        end
        else if (d_u3_m0_wo0_memread_q_15_q == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_ra4_count0_lutreg_q <= $unsigned(u3_m0_wo0_wi0_r0_ra4_count0_lut_q);
        end
    end

    // u3_m0_wo0_wi0_r0_readReg4(DELAY,227)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u3_m0_wo0_wi0_r0_readReg4_q <= u3_m0_wo0_wi0_r0_ra4_count0_lutreg_q;
        end
    end

    // d_u3_m0_wo0_compute_q_14(DELAY,300)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u3_m0_wo0_compute_q_14_q <= $unsigned(u3_m0_wo0_compute_q);
        end
    end

    // u3_m0_wo0_wi0_r0_we4_seq(SEQUENCE,211)@14 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u3_m0_wo0_wi0_r0_we4_seq_c;
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_we4_seq_c = 4'b1111;
            u3_m0_wo0_wi0_r0_we4_seq_q <= $unsigned(1'b0);
            u3_m0_wo0_wi0_r0_we4_seq_eq <= 1'b1;
        end
        else
        begin
            if (d_u3_m0_wo0_compute_q_14_q == 1'b1)
            begin
                if (u3_m0_wo0_wi0_r0_we4_seq_c == 4'b0000)
                begin
                    u3_m0_wo0_wi0_r0_we4_seq_eq <= 1'b1;
                end
                else
                begin
                    u3_m0_wo0_wi0_r0_we4_seq_eq <= 1'b0;
                end
                if (u3_m0_wo0_wi0_r0_we4_seq_eq == 1'b1)
                begin
                    u3_m0_wo0_wi0_r0_we4_seq_c = $signed(u3_m0_wo0_wi0_r0_we4_seq_c) + $signed(4'd1);
                end
                else
                begin
                    u3_m0_wo0_wi0_r0_we4_seq_c = $signed(u3_m0_wo0_wi0_r0_we4_seq_c) - $signed(4'd1);
                end
                u3_m0_wo0_wi0_r0_we4_seq_q <= $unsigned(u3_m0_wo0_wi0_r0_we4_seq_c[3:3]);
            end
            else
            begin
                u3_m0_wo0_wi0_r0_we4_seq_q <= $unsigned(1'b0);
            end
        end
    end

    // u3_m0_wo0_wi0_r0_wa4(COUNTER,215)@15
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_wa4_i <= 2'd0;
        end
        else if (u3_m0_wo0_wi0_r0_we4_seq_q == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_wa4_i <= $unsigned(u3_m0_wo0_wi0_r0_wa4_i) + $unsigned(2'd1);
        end
    end
    assign u3_m0_wo0_wi0_r0_wa4_q = u3_m0_wo0_wi0_r0_wa4_i[1:0];

    // u3_m0_wo0_wi0_r0_memr4(DUALMEM,225)@15
    assign u3_m0_wo0_wi0_r0_memr4_ia = $unsigned(u3_m0_wo0_wi0_r0_memr2_q);
    assign u3_m0_wo0_wi0_r0_memr4_aa = u3_m0_wo0_wi0_r0_wa4_q;
    assign u3_m0_wo0_wi0_r0_memr4_ab = u3_m0_wo0_wi0_r0_readReg4_q;
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u3_m0_wo0_wi0_r0_memr4_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u3_m0_wo0_wi0_r0_memr4_aa),
        .data_a(u3_m0_wo0_wi0_r0_memr4_ia),
        .wren_a(u3_m0_wo0_wi0_r0_we4_seq_q[0]),
        .address_b(u3_m0_wo0_wi0_r0_memr4_ab),
        .q_b(u3_m0_wo0_wi0_r0_memr4_iq),
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
    assign u3_m0_wo0_wi0_r0_memr4_q = u3_m0_wo0_wi0_r0_memr4_iq[15:0];

    // u3_m0_wo0_ca2(COUNTER,230)@15
    // low=0, high=1, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_ca2_i <= 1'd0;
        end
        else if (d_u3_m0_wo0_compute_q_15_q == 1'b1)
        begin
            u3_m0_wo0_ca2_i <= $unsigned(u3_m0_wo0_ca2_i) + $unsigned(1'd1);
        end
    end
    assign u3_m0_wo0_ca2_q = u3_m0_wo0_ca2_i[0:0];

    // u3_m0_wo0_wi0_r0_ra0_count0_lut(LOOKUP,199)@15
    always @(u3_m0_wo0_wi0_r0_ra0_count0_q)
    begin
        // Begin reserved scope level
        unique case (u3_m0_wo0_wi0_r0_ra0_count0_q)
            3'b000 : u3_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b001;
            3'b001 : u3_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b011;
            3'b010 : u3_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b011;
            3'b011 : u3_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b101;
            3'b100 : u3_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b101;
            3'b101 : u3_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b111;
            3'b110 : u3_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b111;
            3'b111 : u3_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b001;
            default : begin
                          // unreachable
                          u3_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'bxxx;
                      end
        endcase
        // End reserved scope level
    end

    // u3_m0_wo0_wi0_r0_ra0_count0_lutreg(REG,200)@15
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= $unsigned(3'b001);
        end
        else if (d_u3_m0_wo0_memread_q_15_q == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= $unsigned(u3_m0_wo0_wi0_r0_ra0_count0_lut_q);
        end
    end

    // u3_m0_wo0_wi0_r0_readReg0(DELAY,218)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u3_m0_wo0_wi0_r0_readReg0_q <= u3_m0_wo0_wi0_r0_ra0_count0_lutreg_q;
        end
    end

    // u0_m0_wo0_wi0_r0_wa0(COUNTER,35)@14
    // low=0, high=7, step=1, init=4
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa0_i <= 3'd4;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_14_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_wa0_i <= $unsigned(u0_m0_wo0_wi0_r0_wa0_i) + $unsigned(3'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_wa0_q = u0_m0_wo0_wi0_r0_wa0_i[2:0];

    // d_u0_m0_wo0_wi0_r0_wa0_q_15(DELAY,278)@14 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_wi0_r0_wa0_q_15_q <= u0_m0_wo0_wi0_r0_wa0_q;
        end
    end

    // u3_m0_wo0_wi0_r0_memr0(DUALMEM,216)@15
    assign u3_m0_wo0_wi0_r0_memr0_ia = $unsigned(d_in3_m0_wi0_wo0_assign_id6_q_15_q);
    assign u3_m0_wo0_wi0_r0_memr0_aa = d_u0_m0_wo0_wi0_r0_wa0_q_15_q;
    assign u3_m0_wo0_wi0_r0_memr0_ab = u3_m0_wo0_wi0_r0_readReg0_q;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(16),
        .widthad_b(3),
        .numwords_b(8),
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u3_m0_wo0_wi0_r0_memr0_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u3_m0_wo0_wi0_r0_memr0_aa),
        .data_a(u3_m0_wo0_wi0_r0_memr0_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_15_q[0]),
        .address_b(u3_m0_wo0_wi0_r0_memr0_ab),
        .q_b(u3_m0_wo0_wi0_r0_memr0_iq),
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
    assign u3_m0_wo0_wi0_r0_memr0_q = u3_m0_wo0_wi0_r0_memr0_iq[15:0];

    // u3_m0_wo0_wi0_r0_delayr5_notEnable(LOGICAL,346)@15
    assign u3_m0_wo0_wi0_r0_delayr5_notEnable_q = $unsigned(~ (d_u3_m0_wo0_compute_q_15_q));

    // u3_m0_wo0_wi0_r0_delayr5_nor(LOGICAL,347)@15
    assign u3_m0_wo0_wi0_r0_delayr5_nor_q = ~ (u3_m0_wo0_wi0_r0_delayr5_notEnable_q | u3_m0_wo0_wi0_r0_delayr5_sticky_ena_q);

    // u3_m0_wo0_wi0_r0_delayr5_mem_last(CONSTANT,343)
    assign u3_m0_wo0_wi0_r0_delayr5_mem_last_q = $unsigned(3'b010);

    // u3_m0_wo0_wi0_r0_delayr5_cmp(LOGICAL,344)@15
    assign u3_m0_wo0_wi0_r0_delayr5_cmp_b = {1'b0, u3_m0_wo0_wi0_r0_delayr5_rdmux_q};
    assign u3_m0_wo0_wi0_r0_delayr5_cmp_q = $unsigned(u3_m0_wo0_wi0_r0_delayr5_mem_last_q == u3_m0_wo0_wi0_r0_delayr5_cmp_b ? 1'b1 : 1'b0);

    // u3_m0_wo0_wi0_r0_delayr5_cmpReg(REG,345)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr5_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u3_m0_wo0_compute_q_15_q == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_delayr5_cmpReg_q <= $unsigned(u3_m0_wo0_wi0_r0_delayr5_cmp_q);
        end
    end

    // u3_m0_wo0_wi0_r0_delayr5_sticky_ena(REG,348)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr5_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u3_m0_wo0_wi0_r0_delayr5_nor_q == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_delayr5_sticky_ena_q <= $unsigned(u3_m0_wo0_wi0_r0_delayr5_cmpReg_q);
        end
    end

    // u3_m0_wo0_wi0_r0_delayr5_enaAnd(LOGICAL,349)@15
    assign u3_m0_wo0_wi0_r0_delayr5_enaAnd_q = u3_m0_wo0_wi0_r0_delayr5_sticky_ena_q & d_u3_m0_wo0_compute_q_15_q;

    // u3_m0_wo0_wi0_r0_delayr5_rdcnt(COUNTER,340)@15 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr5_rdcnt_i <= 2'd0;
        end
        else if (d_u3_m0_wo0_compute_q_15_q == 1'b1)
        begin
            u3_m0_wo0_wi0_r0_delayr5_rdcnt_i <= $unsigned(u3_m0_wo0_wi0_r0_delayr5_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u3_m0_wo0_wi0_r0_delayr5_rdcnt_q = u3_m0_wo0_wi0_r0_delayr5_rdcnt_i[1:0];

    // u3_m0_wo0_wi0_r0_delayr5_rdmux(MUX,341)@15
    assign u3_m0_wo0_wi0_r0_delayr5_rdmux_s = d_u3_m0_wo0_compute_q_15_q;
    always @(u3_m0_wo0_wi0_r0_delayr5_rdmux_s or u3_m0_wo0_wi0_r0_delayr5_wraddr_q or u3_m0_wo0_wi0_r0_delayr5_rdcnt_q)
    begin
        unique case (u3_m0_wo0_wi0_r0_delayr5_rdmux_s)
            1'b0 : u3_m0_wo0_wi0_r0_delayr5_rdmux_q = u3_m0_wo0_wi0_r0_delayr5_wraddr_q;
            1'b1 : u3_m0_wo0_wi0_r0_delayr5_rdmux_q = u3_m0_wo0_wi0_r0_delayr5_rdcnt_q;
            default : u3_m0_wo0_wi0_r0_delayr5_rdmux_q = 2'b0;
        endcase
    end

    // u3_m0_wo0_wi0_r0_delayr5_wraddr(REG,342)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_wi0_r0_delayr5_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u3_m0_wo0_wi0_r0_delayr5_wraddr_q <= $unsigned(u3_m0_wo0_wi0_r0_delayr5_rdmux_q);
        end
    end

    // u3_m0_wo0_wi0_r0_delayr5_mem(DUALMEM,339)@15 + 2
    assign u3_m0_wo0_wi0_r0_delayr5_mem_ia = $unsigned(u3_m0_wo0_wi0_r0_memr4_q);
    assign u3_m0_wo0_wi0_r0_delayr5_mem_aa = u3_m0_wo0_wi0_r0_delayr5_wraddr_q;
    assign u3_m0_wo0_wi0_r0_delayr5_mem_ab = u3_m0_wo0_wi0_r0_delayr5_rdmux_q;
    assign u3_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB = areset | u3_m0_wo0_wi0_r0_delayr5_enaAnd_q[0];
    assign u3_m0_wo0_wi0_r0_delayr5_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u3_m0_wo0_wi0_r0_delayr5_mem_dmem (
        .clocken1(u3_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u3_m0_wo0_wi0_r0_delayr5_mem_reset0),
        .clock1(clk),
        .address_a(u3_m0_wo0_wi0_r0_delayr5_mem_aa),
        .data_a(u3_m0_wo0_wi0_r0_delayr5_mem_ia),
        .wren_a(d_u3_m0_wo0_compute_q_15_q[0]),
        .address_b(u3_m0_wo0_wi0_r0_delayr5_mem_ab),
        .q_b(u3_m0_wo0_wi0_r0_delayr5_mem_iq),
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
    assign u3_m0_wo0_wi0_r0_delayr5_mem_q = u3_m0_wo0_wi0_r0_delayr5_mem_iq[15:0];

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // u3_m0_wo0_aseq(SEQUENCE,242)@14 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u3_m0_wo0_aseq_c;
        if (areset)
        begin
            u3_m0_wo0_aseq_c = 4'b0000;
            u3_m0_wo0_aseq_q <= $unsigned(1'b0);
            u3_m0_wo0_aseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u3_m0_wo0_compute_q_14_q == 1'b1)
            begin
                if (u3_m0_wo0_aseq_c == 4'b0000)
                begin
                    u3_m0_wo0_aseq_eq <= 1'b1;
                end
                else
                begin
                    u3_m0_wo0_aseq_eq <= 1'b0;
                end
                if (u3_m0_wo0_aseq_eq == 1'b1)
                begin
                    u3_m0_wo0_aseq_c = $signed(u3_m0_wo0_aseq_c) + $signed(4'd1);
                end
                else
                begin
                    u3_m0_wo0_aseq_c = $signed(u3_m0_wo0_aseq_c) - $signed(4'd1);
                end
                u3_m0_wo0_aseq_q <= $unsigned(u3_m0_wo0_aseq_c[3:3]);
            end
        end
    end

    // d_u3_m0_wo0_compute_q_18(DELAY,302)@15 + 3
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_m0_wo0_compute_q_18_delay_0 <= '0;
        end
        else
        begin
            d_u3_m0_wo0_compute_q_18_delay_0 <= $unsigned(d_u3_m0_wo0_compute_q_15_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u3_m0_wo0_compute_q_18_delay_1 <= d_u3_m0_wo0_compute_q_18_delay_0;
            d_u3_m0_wo0_compute_q_18_q <= d_u3_m0_wo0_compute_q_18_delay_1;
        end
    end

    // d_u3_m0_wo0_compute_q_15(DELAY,301)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_m0_wo0_compute_q_15_q <= '0;
        end
        else
        begin
            d_u3_m0_wo0_compute_q_15_q <= $unsigned(d_u3_m0_wo0_compute_q_14_q);
        end
    end

    // u3_m0_wo0_cma0(CHAINMULTADD,241)@15 + 5
    assign u3_m0_wo0_cma0_reset = areset;
    assign u3_m0_wo0_cma0_ena0 = d_u3_m0_wo0_compute_q_15_q[0] | u3_m0_wo0_cma0_reset;
    assign u3_m0_wo0_cma0_ena1 = d_u3_m0_wo0_compute_q_18_q[0] | u3_m0_wo0_cma0_reset;
    assign u3_m0_wo0_cma0_ena2 = 1'b1;

    assign u3_m0_wo0_cma0_a0 = $unsigned(u3_m0_wo0_wi0_r0_delayr5_mem_q);
    assign u3_m0_wo0_cma0_b0 = $unsigned(u3_m0_wo0_wi0_r0_memr0_q);
    assign u3_m0_wo0_cma0_c0 = {2'b00, u3_m0_wo0_ca2_q[0:0]};
    assign u3_m0_wo0_cma0_a1 = $unsigned(u3_m0_wo0_wi0_r0_memr4_q);
    assign u3_m0_wo0_cma0_b1 = $unsigned(u3_m0_wo0_wi0_r0_delayr1_q);
    assign u3_m0_wo0_cma0_c1 = {2'b00, u3_m0_wo0_ca2_q[0:0]};
    assign u3_m0_wo0_cma0_a2 = $unsigned(u3_m0_wo0_cma0_mux_2_q);
    assign u3_m0_wo0_cma0_b2 = $unsigned(u3_m0_wo0_wi0_r0_memr2_q);
    assign u3_m0_wo0_cma0_c2 = {2'b00, u3_m0_wo0_ca2_q[0:0]};
    assign u3_m0_wo0_cma0_a3 = 16'b0;
    assign u3_m0_wo0_cma0_b3 = 16'b0;
    assign u3_m0_wo0_cma0_c3 = 3'b0;
    assign u3_m0_wo0_cma0_anl[0] = ~ u3_m0_wo0_aseq_q[0];
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
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
        .coef_b_0(16383),
        .coef_b_1(10043),
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
        .ay(u3_m0_wo0_cma0_a3),
        .by(u3_m0_wo0_cma0_a2),
        .az(u3_m0_wo0_cma0_b3),
        .bz(u3_m0_wo0_cma0_b2),
        .coefsela(u3_m0_wo0_cma0_c3),
        .coefselb(u3_m0_wo0_cma0_c2),
        .chainout(u3_m0_wo0_cma0_s2),
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
        .scanout(),
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
        .coef_a_0(772),
        .coef_a_1(-2462),
        .coef_b_0(-188),
        .coef_b_1(25),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .accumulate_clken("0"),
        .accum_pipeline_clken("2"),
        .accum_2nd_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(37)
    ) u3_m0_wo0_cma0_DSP0 (
        .clk(clk),
        .ena({ u3_m0_wo0_cma0_ena2, u3_m0_wo0_cma0_ena1, u3_m0_wo0_cma0_ena0 }),
        .clr({ u3_m0_wo0_cma0_reset, u3_m0_wo0_cma0_reset }),
        .ay(u3_m0_wo0_cma0_a1),
        .by(u3_m0_wo0_cma0_a0),
        .az(u3_m0_wo0_cma0_b1),
        .bz(u3_m0_wo0_cma0_b0),
        .coefsela(u3_m0_wo0_cma0_c1),
        .coefselb(u3_m0_wo0_cma0_c0),
        .accumulate(u3_m0_wo0_cma0_anl[0]),
        .chainin(u3_m0_wo0_cma0_s2),
        .resulta(u3_m0_wo0_cma0_s0),
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
        .scanout(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(37), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u3_m0_wo0_cma0_delay0 ( .xin(u3_m0_wo0_cma0_s0), .xout(u3_m0_wo0_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u3_m0_wo0_cma0_q = $unsigned(u3_m0_wo0_cma0_qq0[36:0]);

    // d_u3_m0_wo0_compute_q_19(DELAY,303)@18 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u3_m0_wo0_compute_q_19_q <= $unsigned(d_u3_m0_wo0_compute_q_18_q);
        end
    end

    // u3_m0_wo0_oseq(SEQUENCE,244)@18 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u3_m0_wo0_oseq_c;
        if (areset)
        begin
            u3_m0_wo0_oseq_c = 4'b0001;
            u3_m0_wo0_oseq_q <= $unsigned(1'b0);
            u3_m0_wo0_oseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u3_m0_wo0_compute_q_18_q == 1'b1)
            begin
                if (u3_m0_wo0_oseq_c == 4'b0000)
                begin
                    u3_m0_wo0_oseq_eq <= 1'b1;
                end
                else
                begin
                    u3_m0_wo0_oseq_eq <= 1'b0;
                end
                if (u3_m0_wo0_oseq_eq == 1'b1)
                begin
                    u3_m0_wo0_oseq_c = $signed(u3_m0_wo0_oseq_c) + $signed(4'd1);
                end
                else
                begin
                    u3_m0_wo0_oseq_c = $signed(u3_m0_wo0_oseq_c) - $signed(4'd1);
                end
                u3_m0_wo0_oseq_q <= $unsigned(u3_m0_wo0_oseq_c[3:3]);
            end
        end
    end

    // u3_m0_wo0_oseq_gated(LOGICAL,245)@19
    assign u3_m0_wo0_oseq_gated_q = u3_m0_wo0_oseq_q & d_u3_m0_wo0_compute_q_19_q;

    // u3_m0_wo0_oseq_gated_reg(REG,246)@19 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_m0_wo0_oseq_gated_reg_q <= $unsigned(1'b0);
        end
        else
        begin
            u3_m0_wo0_oseq_gated_reg_q <= $unsigned(u3_m0_wo0_oseq_gated_q);
        end
    end

    // u2_m0_wo0_run(ENABLEGENERATOR,134)@11 + 2
    assign u2_m0_wo0_run_ctrl = { u2_m0_wo0_run_out, d_in0_m0_wi0_wo0_assign_id1_q_11_q, u2_m0_wo0_run_enableQ };
    always @ (posedge clk)
    begin
        reg [0:0] u2_m0_wo0_run_enable_c;
        reg [2:0] u2_m0_wo0_run_inc;
        if (areset)
        begin
            u2_m0_wo0_run_q <= $unsigned(1'b0);
            u2_m0_wo0_run_enable_c = 1'd0;
            u2_m0_wo0_run_enableQ <= $unsigned(1'b0);
            u2_m0_wo0_run_count <= $unsigned(3'b000);
            u2_m0_wo0_run_inc = 3'b0;
        end
        else
        begin
            if (u2_m0_wo0_run_out == 1'b1)
            begin
                if (u2_m0_wo0_run_enable_c[0] == 1'b1)
                begin
                    u2_m0_wo0_run_enable_c = $signed(u2_m0_wo0_run_enable_c) - $signed(-1'd1);
                end
                else
                begin
                    u2_m0_wo0_run_enable_c = $signed(u2_m0_wo0_run_enable_c) + $signed(-1'd1);
                end
                u2_m0_wo0_run_enableQ <= $unsigned(u2_m0_wo0_run_enable_c[0:0]);
            end
            else
            begin
                u2_m0_wo0_run_enableQ <= $unsigned(1'b0);
            end
            unique case (u2_m0_wo0_run_ctrl)
                3'b000, 3'b001 : u2_m0_wo0_run_inc = 3'b000;
                3'b010, 3'b011 : u2_m0_wo0_run_inc = 3'b111;
                3'b100 : u2_m0_wo0_run_inc = 3'b000;
                3'b101 : u2_m0_wo0_run_inc = 3'b010;
                3'b110 : u2_m0_wo0_run_inc = 3'b111;
                3'b111 : u2_m0_wo0_run_inc = 3'b001;
                default : ;
            endcase
            u2_m0_wo0_run_count <= $unsigned($signed(u2_m0_wo0_run_count) + $signed(u2_m0_wo0_run_inc));
            u2_m0_wo0_run_q <= u2_m0_wo0_run_out;
        end
    end
    assign u2_m0_wo0_run_preEnaQ = u2_m0_wo0_run_count[2:2];
    assign u2_m0_wo0_run_out = u2_m0_wo0_run_preEnaQ & VCC_q;

    // u2_m0_wo0_memread(DELAY,135)@13
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_memread_q <= '0;
        end
        else
        begin
            u2_m0_wo0_memread_q <= $unsigned(u2_m0_wo0_run_q);
        end
    end

    // d_u2_m0_wo0_memread_q_14(DELAY,291)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u2_m0_wo0_memread_q_14_q <= $unsigned(u2_m0_wo0_memread_q);
        end
    end

    // d_u2_m0_wo0_memread_q_15(DELAY,292)@14 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u2_m0_wo0_memread_q_15_q <= $unsigned(d_u2_m0_wo0_memread_q_14_q);
        end
    end

    // u2_m0_wo0_wi0_r0_ra2_count0(COUNTER,145)@15
    // low=0, high=11, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_ra2_count0_i <= 4'd1;
            u2_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b0;
        end
        else if (d_u2_m0_wo0_memread_q_15_q == 1'b1)
        begin
            if (u2_m0_wo0_wi0_r0_ra2_count0_i == 4'd10)
            begin
                u2_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b1;
            end
            else
            begin
                u2_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b0;
            end
            if (u2_m0_wo0_wi0_r0_ra2_count0_eq == 1'b1)
            begin
                u2_m0_wo0_wi0_r0_ra2_count0_i <= $unsigned(u2_m0_wo0_wi0_r0_ra2_count0_i) + $unsigned(4'd5);
            end
            else
            begin
                u2_m0_wo0_wi0_r0_ra2_count0_i <= $unsigned(u2_m0_wo0_wi0_r0_ra2_count0_i) + $unsigned(4'd1);
            end
        end
    end
    assign u2_m0_wo0_wi0_r0_ra2_count0_q = u2_m0_wo0_wi0_r0_ra2_count0_i[3:0];

    // u2_m0_wo0_wi0_r0_ra2_count0_lut(LOOKUP,143)@15
    always @(u2_m0_wo0_wi0_r0_ra2_count0_q)
    begin
        // Begin reserved scope level
        unique case (u2_m0_wo0_wi0_r0_ra2_count0_q)
            4'b0000 : u2_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0000;
            4'b0001 : u2_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0001;
            4'b0010 : u2_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0010;
            4'b0011 : u2_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0011;
            4'b0100 : u2_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0100;
            4'b0101 : u2_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0101;
            4'b0110 : u2_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0110;
            4'b0111 : u2_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0111;
            4'b1000 : u2_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1000;
            4'b1001 : u2_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1001;
            4'b1010 : u2_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1010;
            4'b1011 : u2_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1011;
            default : u2_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0000;
        endcase
        // End reserved scope level
    end

    // u2_m0_wo0_wi0_r0_ra2_count0_lutreg(REG,144)@15
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_ra2_count0_lutreg_q <= $unsigned(4'b0000);
        end
        else if (d_u2_m0_wo0_memread_q_15_q == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_ra2_count0_lutreg_q <= $unsigned(u2_m0_wo0_wi0_r0_ra2_count0_lut_q);
        end
    end

    // u2_m0_wo0_wi0_r0_readReg2(DELAY,162)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u2_m0_wo0_wi0_r0_readReg2_q <= u2_m0_wo0_wi0_r0_ra2_count0_lutreg_q;
        end
    end

    // d_xIn_2_14_rdcnt(ADD,353)@10 + 1
    assign d_xIn_2_14_rdcnt_a = {1'b0, d_xIn_2_14_wraddr_q};
    assign d_xIn_2_14_rdcnt_b = {1'b0, d_xIn_2_14_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_xIn_2_14_rdcnt_o <= $unsigned(d_xIn_2_14_rdcnt_a) + $unsigned(d_xIn_2_14_rdcnt_b);
        end
    end
    assign d_xIn_2_14_rdcnt_q = d_xIn_2_14_rdcnt_o[2:0];

    // d_xIn_2_14_wraddr(COUNTER,351)@10 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_xIn_2_14_wraddr_i <= $unsigned(d_xIn_2_14_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign d_xIn_2_14_wraddr_q = d_xIn_2_14_wraddr_i[1:0];

    // d_xIn_2_14_mem(DUALMEM,350)@10 + 2
    assign d_xIn_2_14_mem_ia = $unsigned(xIn_2);
    assign d_xIn_2_14_mem_aa = d_xIn_2_14_wraddr_q;
    assign d_xIn_2_14_mem_ab = d_xIn_2_14_rdcnt_q[1:0];
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
    ) d_xIn_2_14_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(d_xIn_2_14_mem_aa),
        .data_a(d_xIn_2_14_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_xIn_2_14_mem_ab),
        .q_b(d_xIn_2_14_mem_iq),
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
    assign d_xIn_2_14_mem_q = d_xIn_2_14_mem_iq[15:0];

    // d_in2_m0_wi0_wo0_assign_id4_q_15(DELAY,290)@14 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in2_m0_wi0_wo0_assign_id4_q_15_q <= $unsigned(d_xIn_2_14_mem_q);
        end
    end

    // u0_m0_wo0_wi0_r0_wa2(COUNTER,36)@14
    // low=0, high=11, step=1, init=8
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa2_i <= 4'd8;
            u0_m0_wo0_wi0_r0_wa2_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_14_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_wa2_i == 4'd10)
            begin
                u0_m0_wo0_wi0_r0_wa2_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_wa2_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_wa2_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_wa2_i <= $unsigned(u0_m0_wo0_wi0_r0_wa2_i) + $unsigned(4'd5);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_wa2_i <= $unsigned(u0_m0_wo0_wi0_r0_wa2_i) + $unsigned(4'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_wa2_q = u0_m0_wo0_wi0_r0_wa2_i[3:0];

    // d_u0_m0_wo0_wi0_r0_wa2_q_15(DELAY,279)@14 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_wi0_r0_wa2_q_15_q <= u0_m0_wo0_wi0_r0_wa2_q;
        end
    end

    // u2_m0_wo0_wi0_r0_memr2(DUALMEM,160)@15
    assign u2_m0_wo0_wi0_r0_memr2_ia = $unsigned(d_in2_m0_wi0_wo0_assign_id4_q_15_q);
    assign u2_m0_wo0_wi0_r0_memr2_aa = d_u0_m0_wo0_wi0_r0_wa2_q_15_q;
    assign u2_m0_wo0_wi0_r0_memr2_ab = u2_m0_wo0_wi0_r0_readReg2_q;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(4),
        .numwords_a(12),
        .width_b(16),
        .widthad_b(4),
        .numwords_b(12),
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u2_m0_wo0_wi0_r0_memr2_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u2_m0_wo0_wi0_r0_memr2_aa),
        .data_a(u2_m0_wo0_wi0_r0_memr2_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_15_q[0]),
        .address_b(u2_m0_wo0_wi0_r0_memr2_ab),
        .q_b(u2_m0_wo0_wi0_r0_memr2_iq),
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
    assign u2_m0_wo0_wi0_r0_memr2_q = u2_m0_wo0_wi0_r0_memr2_iq[15:0];

    // u2_m0_wo0_wi0_r0_ra3_count0(COUNTER,148)@14
    // low=0, high=13, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_ra3_count0_i <= 4'd1;
            u2_m0_wo0_wi0_r0_ra3_count0_eq <= 1'b0;
        end
        else if (d_u2_m0_wo0_memread_q_14_q == 1'b1)
        begin
            if (u2_m0_wo0_wi0_r0_ra3_count0_i == 4'd12)
            begin
                u2_m0_wo0_wi0_r0_ra3_count0_eq <= 1'b1;
            end
            else
            begin
                u2_m0_wo0_wi0_r0_ra3_count0_eq <= 1'b0;
            end
            if (u2_m0_wo0_wi0_r0_ra3_count0_eq == 1'b1)
            begin
                u2_m0_wo0_wi0_r0_ra3_count0_i <= $unsigned(u2_m0_wo0_wi0_r0_ra3_count0_i) + $unsigned(4'd3);
            end
            else
            begin
                u2_m0_wo0_wi0_r0_ra3_count0_i <= $unsigned(u2_m0_wo0_wi0_r0_ra3_count0_i) + $unsigned(4'd1);
            end
        end
    end
    assign u2_m0_wo0_wi0_r0_ra3_count0_q = u2_m0_wo0_wi0_r0_ra3_count0_i[3:0];

    // u2_m0_wo0_wi0_r0_ra3_count0_lut(LOOKUP,146)@14
    always @(u2_m0_wo0_wi0_r0_ra3_count0_q)
    begin
        // Begin reserved scope level
        unique case (u2_m0_wo0_wi0_r0_ra3_count0_q)
            4'b0000 : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0010;
            4'b0001 : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0001;
            4'b0010 : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0100;
            4'b0011 : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0011;
            4'b0100 : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0110;
            4'b0101 : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0101;
            4'b0110 : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1000;
            4'b0111 : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0111;
            4'b1000 : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1010;
            4'b1001 : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1001;
            4'b1010 : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1100;
            4'b1011 : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1011;
            4'b1100 : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0000;
            4'b1101 : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1101;
            default : u2_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0010;
        endcase
        // End reserved scope level
    end

    // u2_m0_wo0_wi0_r0_ra3_count0_lutreg(REG,147)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_ra3_count0_lutreg_q <= $unsigned(4'b0010);
        end
        else if (d_u2_m0_wo0_memread_q_14_q == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_ra3_count0_lutreg_q <= $unsigned(u2_m0_wo0_wi0_r0_ra3_count0_lut_q);
        end
    end

    // u2_m0_wo0_wi0_r0_readReg3(DELAY,165)@14
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u2_m0_wo0_wi0_r0_readReg3_q <= u2_m0_wo0_wi0_r0_ra3_count0_lutreg_q;
        end
    end

    // u0_m0_wo0_wi0_r0_wa3(COUNTER,37)@13
    // low=0, high=13, step=1, init=10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa3_i <= 4'd10;
            u0_m0_wo0_wi0_r0_wa3_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_13_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_wa3_i == 4'd12)
            begin
                u0_m0_wo0_wi0_r0_wa3_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_wa3_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_wa3_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_wa3_i <= $unsigned(u0_m0_wo0_wi0_r0_wa3_i) + $unsigned(4'd3);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_wa3_i <= $unsigned(u0_m0_wo0_wi0_r0_wa3_i) + $unsigned(4'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_wa3_q = u0_m0_wo0_wi0_r0_wa3_i[3:0];

    // d_u0_m0_wo0_wi0_r0_wa3_q_14(DELAY,280)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_wi0_r0_wa3_q_14_q <= u0_m0_wo0_wi0_r0_wa3_q;
        end
    end

    // u2_m0_wo0_wi0_r0_memr3(DUALMEM,163)@14
    assign u2_m0_wo0_wi0_r0_memr3_ia = $unsigned(d_xIn_2_14_mem_q);
    assign u2_m0_wo0_wi0_r0_memr3_aa = d_u0_m0_wo0_wi0_r0_wa3_q_14_q;
    assign u2_m0_wo0_wi0_r0_memr3_ab = u2_m0_wo0_wi0_r0_readReg3_q;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(4),
        .numwords_a(14),
        .width_b(16),
        .widthad_b(4),
        .numwords_b(14),
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u2_m0_wo0_wi0_r0_memr3_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u2_m0_wo0_wi0_r0_memr3_aa),
        .data_a(u2_m0_wo0_wi0_r0_memr3_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_14_q[0]),
        .address_b(u2_m0_wo0_wi0_r0_memr3_ab),
        .q_b(u2_m0_wo0_wi0_r0_memr3_iq),
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
    assign u2_m0_wo0_wi0_r0_memr3_q = u2_m0_wo0_wi0_r0_memr3_iq[15:0];

    // u2_m0_wo0_compute(DELAY,137)@13
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_compute_delay_0 <= '0;
        end
        else
        begin
            u2_m0_wo0_compute_delay_0 <= $unsigned(u2_m0_wo0_memread_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u2_m0_wo0_compute_delay_1 <= u2_m0_wo0_compute_delay_0;
            u2_m0_wo0_compute_q <= u2_m0_wo0_compute_delay_1;
        end
    end

    // u2_m0_wo0_symSuppress_2_seq(SEQUENCE,180)@13 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u2_m0_wo0_symSuppress_2_seq_c;
        if (areset)
        begin
            u2_m0_wo0_symSuppress_2_seq_c = 4'b0000;
            u2_m0_wo0_symSuppress_2_seq_q <= $unsigned(1'b0);
            u2_m0_wo0_symSuppress_2_seq_eq <= 1'b0;
        end
        else
        begin
            if (u2_m0_wo0_compute_q == 1'b1)
            begin
                if (u2_m0_wo0_symSuppress_2_seq_c == 4'b0000)
                begin
                    u2_m0_wo0_symSuppress_2_seq_eq <= 1'b1;
                end
                else
                begin
                    u2_m0_wo0_symSuppress_2_seq_eq <= 1'b0;
                end
                if (u2_m0_wo0_symSuppress_2_seq_eq == 1'b1)
                begin
                    u2_m0_wo0_symSuppress_2_seq_c = $signed(u2_m0_wo0_symSuppress_2_seq_c) + $signed(4'd1);
                end
                else
                begin
                    u2_m0_wo0_symSuppress_2_seq_c = $signed(u2_m0_wo0_symSuppress_2_seq_c) - $signed(4'd1);
                end
                u2_m0_wo0_symSuppress_2_seq_q <= $unsigned(u2_m0_wo0_symSuppress_2_seq_c[3:3]);
            end
        end
    end

    // u2_m0_wo0_cma0_mux_2(MUX,261)@14 + 1
    assign u2_m0_wo0_cma0_mux_2_s = u2_m0_wo0_symSuppress_2_seq_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (u2_m0_wo0_cma0_mux_2_s)
                1'b0 : u2_m0_wo0_cma0_mux_2_q <= u2_m0_wo0_wi0_r0_memr3_q;
                1'b1 : u2_m0_wo0_cma0_mux_2_q <= {{15{GND_q[0]}}, GND_q};
                default : u2_m0_wo0_cma0_mux_2_q <= 16'b0;
            endcase
        end
    end

    // u2_m0_wo0_wi0_r0_delayr1(DELAY,169)@15
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr1_delay_0 <= '0;
            u2_m0_wo0_wi0_r0_delayr1_delay_1 <= '0;
            u2_m0_wo0_wi0_r0_delayr1_q <= '0;
        end
        else if (d_u2_m0_wo0_compute_q_15_q == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_delayr1_delay_0 <= $unsigned(u2_m0_wo0_wi0_r0_memr0_q);
            u2_m0_wo0_wi0_r0_delayr1_delay_1 <= u2_m0_wo0_wi0_r0_delayr1_delay_0;
            u2_m0_wo0_wi0_r0_delayr1_q <= u2_m0_wo0_wi0_r0_delayr1_delay_1;
        end
    end

    // u2_m0_wo0_wi0_r0_ra0_count0(COUNTER,142)@15
    // low=0, high=7, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_ra0_count0_i <= 3'd1;
        end
        else if (d_u2_m0_wo0_memread_q_15_q == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_ra0_count0_i <= $unsigned(u2_m0_wo0_wi0_r0_ra0_count0_i) + $unsigned(3'd1);
        end
    end
    assign u2_m0_wo0_wi0_r0_ra0_count0_q = u2_m0_wo0_wi0_r0_ra0_count0_i[2:0];

    // u2_m0_wo0_wi0_r0_ra4_count0_lut(LOOKUP,149)@15
    always @(u2_m0_wo0_wi0_r0_ra0_count0_q)
    begin
        // Begin reserved scope level
        unique case (u2_m0_wo0_wi0_r0_ra0_count0_q)
            3'b000 : u2_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b00;
            3'b001 : u2_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b10;
            3'b010 : u2_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b01;
            3'b011 : u2_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b11;
            3'b100 : u2_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b10;
            3'b101 : u2_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b00;
            3'b110 : u2_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b11;
            3'b111 : u2_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b01;
            default : begin
                          // unreachable
                          u2_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'bxx;
                      end
        endcase
        // End reserved scope level
    end

    // u2_m0_wo0_wi0_r0_ra4_count0_lutreg(REG,150)@15
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_ra4_count0_lutreg_q <= $unsigned(2'b00);
        end
        else if (d_u2_m0_wo0_memread_q_15_q == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_ra4_count0_lutreg_q <= $unsigned(u2_m0_wo0_wi0_r0_ra4_count0_lut_q);
        end
    end

    // u2_m0_wo0_wi0_r0_readReg4(DELAY,168)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u2_m0_wo0_wi0_r0_readReg4_q <= u2_m0_wo0_wi0_r0_ra4_count0_lutreg_q;
        end
    end

    // d_u2_m0_wo0_compute_q_14(DELAY,293)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u2_m0_wo0_compute_q_14_q <= $unsigned(u2_m0_wo0_compute_q);
        end
    end

    // u2_m0_wo0_wi0_r0_we4_seq(SEQUENCE,152)@14 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u2_m0_wo0_wi0_r0_we4_seq_c;
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_we4_seq_c = 4'b1111;
            u2_m0_wo0_wi0_r0_we4_seq_q <= $unsigned(1'b0);
            u2_m0_wo0_wi0_r0_we4_seq_eq <= 1'b1;
        end
        else
        begin
            if (d_u2_m0_wo0_compute_q_14_q == 1'b1)
            begin
                if (u2_m0_wo0_wi0_r0_we4_seq_c == 4'b0000)
                begin
                    u2_m0_wo0_wi0_r0_we4_seq_eq <= 1'b1;
                end
                else
                begin
                    u2_m0_wo0_wi0_r0_we4_seq_eq <= 1'b0;
                end
                if (u2_m0_wo0_wi0_r0_we4_seq_eq == 1'b1)
                begin
                    u2_m0_wo0_wi0_r0_we4_seq_c = $signed(u2_m0_wo0_wi0_r0_we4_seq_c) + $signed(4'd1);
                end
                else
                begin
                    u2_m0_wo0_wi0_r0_we4_seq_c = $signed(u2_m0_wo0_wi0_r0_we4_seq_c) - $signed(4'd1);
                end
                u2_m0_wo0_wi0_r0_we4_seq_q <= $unsigned(u2_m0_wo0_wi0_r0_we4_seq_c[3:3]);
            end
            else
            begin
                u2_m0_wo0_wi0_r0_we4_seq_q <= $unsigned(1'b0);
            end
        end
    end

    // u2_m0_wo0_wi0_r0_wa4(COUNTER,156)@15
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_wa4_i <= 2'd0;
        end
        else if (u2_m0_wo0_wi0_r0_we4_seq_q == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_wa4_i <= $unsigned(u2_m0_wo0_wi0_r0_wa4_i) + $unsigned(2'd1);
        end
    end
    assign u2_m0_wo0_wi0_r0_wa4_q = u2_m0_wo0_wi0_r0_wa4_i[1:0];

    // u2_m0_wo0_wi0_r0_memr4(DUALMEM,166)@15
    assign u2_m0_wo0_wi0_r0_memr4_ia = $unsigned(u2_m0_wo0_wi0_r0_memr2_q);
    assign u2_m0_wo0_wi0_r0_memr4_aa = u2_m0_wo0_wi0_r0_wa4_q;
    assign u2_m0_wo0_wi0_r0_memr4_ab = u2_m0_wo0_wi0_r0_readReg4_q;
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u2_m0_wo0_wi0_r0_memr4_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u2_m0_wo0_wi0_r0_memr4_aa),
        .data_a(u2_m0_wo0_wi0_r0_memr4_ia),
        .wren_a(u2_m0_wo0_wi0_r0_we4_seq_q[0]),
        .address_b(u2_m0_wo0_wi0_r0_memr4_ab),
        .q_b(u2_m0_wo0_wi0_r0_memr4_iq),
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
    assign u2_m0_wo0_wi0_r0_memr4_q = u2_m0_wo0_wi0_r0_memr4_iq[15:0];

    // u2_m0_wo0_ca2(COUNTER,171)@15
    // low=0, high=1, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_ca2_i <= 1'd0;
        end
        else if (d_u2_m0_wo0_compute_q_15_q == 1'b1)
        begin
            u2_m0_wo0_ca2_i <= $unsigned(u2_m0_wo0_ca2_i) + $unsigned(1'd1);
        end
    end
    assign u2_m0_wo0_ca2_q = u2_m0_wo0_ca2_i[0:0];

    // u2_m0_wo0_wi0_r0_ra0_count0_lut(LOOKUP,140)@15
    always @(u2_m0_wo0_wi0_r0_ra0_count0_q)
    begin
        // Begin reserved scope level
        unique case (u2_m0_wo0_wi0_r0_ra0_count0_q)
            3'b000 : u2_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b001;
            3'b001 : u2_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b011;
            3'b010 : u2_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b011;
            3'b011 : u2_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b101;
            3'b100 : u2_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b101;
            3'b101 : u2_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b111;
            3'b110 : u2_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b111;
            3'b111 : u2_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b001;
            default : begin
                          // unreachable
                          u2_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'bxxx;
                      end
        endcase
        // End reserved scope level
    end

    // u2_m0_wo0_wi0_r0_ra0_count0_lutreg(REG,141)@15
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= $unsigned(3'b001);
        end
        else if (d_u2_m0_wo0_memread_q_15_q == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= $unsigned(u2_m0_wo0_wi0_r0_ra0_count0_lut_q);
        end
    end

    // u2_m0_wo0_wi0_r0_readReg0(DELAY,159)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u2_m0_wo0_wi0_r0_readReg0_q <= u2_m0_wo0_wi0_r0_ra0_count0_lutreg_q;
        end
    end

    // u2_m0_wo0_wi0_r0_memr0(DUALMEM,157)@15
    assign u2_m0_wo0_wi0_r0_memr0_ia = $unsigned(d_in2_m0_wi0_wo0_assign_id4_q_15_q);
    assign u2_m0_wo0_wi0_r0_memr0_aa = d_u0_m0_wo0_wi0_r0_wa0_q_15_q;
    assign u2_m0_wo0_wi0_r0_memr0_ab = u2_m0_wo0_wi0_r0_readReg0_q;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(16),
        .widthad_b(3),
        .numwords_b(8),
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u2_m0_wo0_wi0_r0_memr0_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u2_m0_wo0_wi0_r0_memr0_aa),
        .data_a(u2_m0_wo0_wi0_r0_memr0_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_15_q[0]),
        .address_b(u2_m0_wo0_wi0_r0_memr0_ab),
        .q_b(u2_m0_wo0_wi0_r0_memr0_iq),
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
    assign u2_m0_wo0_wi0_r0_memr0_q = u2_m0_wo0_wi0_r0_memr0_iq[15:0];

    // u2_m0_wo0_wi0_r0_delayr5_notEnable(LOGICAL,335)@15
    assign u2_m0_wo0_wi0_r0_delayr5_notEnable_q = $unsigned(~ (d_u2_m0_wo0_compute_q_15_q));

    // u2_m0_wo0_wi0_r0_delayr5_nor(LOGICAL,336)@15
    assign u2_m0_wo0_wi0_r0_delayr5_nor_q = ~ (u2_m0_wo0_wi0_r0_delayr5_notEnable_q | u2_m0_wo0_wi0_r0_delayr5_sticky_ena_q);

    // u2_m0_wo0_wi0_r0_delayr5_mem_last(CONSTANT,332)
    assign u2_m0_wo0_wi0_r0_delayr5_mem_last_q = $unsigned(3'b010);

    // u2_m0_wo0_wi0_r0_delayr5_cmp(LOGICAL,333)@15
    assign u2_m0_wo0_wi0_r0_delayr5_cmp_b = {1'b0, u2_m0_wo0_wi0_r0_delayr5_rdmux_q};
    assign u2_m0_wo0_wi0_r0_delayr5_cmp_q = $unsigned(u2_m0_wo0_wi0_r0_delayr5_mem_last_q == u2_m0_wo0_wi0_r0_delayr5_cmp_b ? 1'b1 : 1'b0);

    // u2_m0_wo0_wi0_r0_delayr5_cmpReg(REG,334)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr5_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u2_m0_wo0_compute_q_15_q == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_delayr5_cmpReg_q <= $unsigned(u2_m0_wo0_wi0_r0_delayr5_cmp_q);
        end
    end

    // u2_m0_wo0_wi0_r0_delayr5_sticky_ena(REG,337)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr5_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u2_m0_wo0_wi0_r0_delayr5_nor_q == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_delayr5_sticky_ena_q <= $unsigned(u2_m0_wo0_wi0_r0_delayr5_cmpReg_q);
        end
    end

    // u2_m0_wo0_wi0_r0_delayr5_enaAnd(LOGICAL,338)@15
    assign u2_m0_wo0_wi0_r0_delayr5_enaAnd_q = u2_m0_wo0_wi0_r0_delayr5_sticky_ena_q & d_u2_m0_wo0_compute_q_15_q;

    // u2_m0_wo0_wi0_r0_delayr5_rdcnt(COUNTER,329)@15 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr5_rdcnt_i <= 2'd0;
        end
        else if (d_u2_m0_wo0_compute_q_15_q == 1'b1)
        begin
            u2_m0_wo0_wi0_r0_delayr5_rdcnt_i <= $unsigned(u2_m0_wo0_wi0_r0_delayr5_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u2_m0_wo0_wi0_r0_delayr5_rdcnt_q = u2_m0_wo0_wi0_r0_delayr5_rdcnt_i[1:0];

    // u2_m0_wo0_wi0_r0_delayr5_rdmux(MUX,330)@15
    assign u2_m0_wo0_wi0_r0_delayr5_rdmux_s = d_u2_m0_wo0_compute_q_15_q;
    always @(u2_m0_wo0_wi0_r0_delayr5_rdmux_s or u2_m0_wo0_wi0_r0_delayr5_wraddr_q or u2_m0_wo0_wi0_r0_delayr5_rdcnt_q)
    begin
        unique case (u2_m0_wo0_wi0_r0_delayr5_rdmux_s)
            1'b0 : u2_m0_wo0_wi0_r0_delayr5_rdmux_q = u2_m0_wo0_wi0_r0_delayr5_wraddr_q;
            1'b1 : u2_m0_wo0_wi0_r0_delayr5_rdmux_q = u2_m0_wo0_wi0_r0_delayr5_rdcnt_q;
            default : u2_m0_wo0_wi0_r0_delayr5_rdmux_q = 2'b0;
        endcase
    end

    // u2_m0_wo0_wi0_r0_delayr5_wraddr(REG,331)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_wi0_r0_delayr5_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u2_m0_wo0_wi0_r0_delayr5_wraddr_q <= $unsigned(u2_m0_wo0_wi0_r0_delayr5_rdmux_q);
        end
    end

    // u2_m0_wo0_wi0_r0_delayr5_mem(DUALMEM,328)@15 + 2
    assign u2_m0_wo0_wi0_r0_delayr5_mem_ia = $unsigned(u2_m0_wo0_wi0_r0_memr4_q);
    assign u2_m0_wo0_wi0_r0_delayr5_mem_aa = u2_m0_wo0_wi0_r0_delayr5_wraddr_q;
    assign u2_m0_wo0_wi0_r0_delayr5_mem_ab = u2_m0_wo0_wi0_r0_delayr5_rdmux_q;
    assign u2_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB = areset | u2_m0_wo0_wi0_r0_delayr5_enaAnd_q[0];
    assign u2_m0_wo0_wi0_r0_delayr5_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u2_m0_wo0_wi0_r0_delayr5_mem_dmem (
        .clocken1(u2_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u2_m0_wo0_wi0_r0_delayr5_mem_reset0),
        .clock1(clk),
        .address_a(u2_m0_wo0_wi0_r0_delayr5_mem_aa),
        .data_a(u2_m0_wo0_wi0_r0_delayr5_mem_ia),
        .wren_a(d_u2_m0_wo0_compute_q_15_q[0]),
        .address_b(u2_m0_wo0_wi0_r0_delayr5_mem_ab),
        .q_b(u2_m0_wo0_wi0_r0_delayr5_mem_iq),
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
    assign u2_m0_wo0_wi0_r0_delayr5_mem_q = u2_m0_wo0_wi0_r0_delayr5_mem_iq[15:0];

    // u2_m0_wo0_aseq(SEQUENCE,183)@14 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u2_m0_wo0_aseq_c;
        if (areset)
        begin
            u2_m0_wo0_aseq_c = 4'b0000;
            u2_m0_wo0_aseq_q <= $unsigned(1'b0);
            u2_m0_wo0_aseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u2_m0_wo0_compute_q_14_q == 1'b1)
            begin
                if (u2_m0_wo0_aseq_c == 4'b0000)
                begin
                    u2_m0_wo0_aseq_eq <= 1'b1;
                end
                else
                begin
                    u2_m0_wo0_aseq_eq <= 1'b0;
                end
                if (u2_m0_wo0_aseq_eq == 1'b1)
                begin
                    u2_m0_wo0_aseq_c = $signed(u2_m0_wo0_aseq_c) + $signed(4'd1);
                end
                else
                begin
                    u2_m0_wo0_aseq_c = $signed(u2_m0_wo0_aseq_c) - $signed(4'd1);
                end
                u2_m0_wo0_aseq_q <= $unsigned(u2_m0_wo0_aseq_c[3:3]);
            end
        end
    end

    // d_u2_m0_wo0_compute_q_18(DELAY,295)@15 + 3
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_m0_wo0_compute_q_18_delay_0 <= '0;
        end
        else
        begin
            d_u2_m0_wo0_compute_q_18_delay_0 <= $unsigned(d_u2_m0_wo0_compute_q_15_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u2_m0_wo0_compute_q_18_delay_1 <= d_u2_m0_wo0_compute_q_18_delay_0;
            d_u2_m0_wo0_compute_q_18_q <= d_u2_m0_wo0_compute_q_18_delay_1;
        end
    end

    // d_u2_m0_wo0_compute_q_15(DELAY,294)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_m0_wo0_compute_q_15_q <= '0;
        end
        else
        begin
            d_u2_m0_wo0_compute_q_15_q <= $unsigned(d_u2_m0_wo0_compute_q_14_q);
        end
    end

    // u2_m0_wo0_cma0(CHAINMULTADD,182)@15 + 5
    assign u2_m0_wo0_cma0_reset = areset;
    assign u2_m0_wo0_cma0_ena0 = d_u2_m0_wo0_compute_q_15_q[0] | u2_m0_wo0_cma0_reset;
    assign u2_m0_wo0_cma0_ena1 = d_u2_m0_wo0_compute_q_18_q[0] | u2_m0_wo0_cma0_reset;
    assign u2_m0_wo0_cma0_ena2 = 1'b1;

    assign u2_m0_wo0_cma0_a0 = $unsigned(u2_m0_wo0_wi0_r0_delayr5_mem_q);
    assign u2_m0_wo0_cma0_b0 = $unsigned(u2_m0_wo0_wi0_r0_memr0_q);
    assign u2_m0_wo0_cma0_c0 = {2'b00, u2_m0_wo0_ca2_q[0:0]};
    assign u2_m0_wo0_cma0_a1 = $unsigned(u2_m0_wo0_wi0_r0_memr4_q);
    assign u2_m0_wo0_cma0_b1 = $unsigned(u2_m0_wo0_wi0_r0_delayr1_q);
    assign u2_m0_wo0_cma0_c1 = {2'b00, u2_m0_wo0_ca2_q[0:0]};
    assign u2_m0_wo0_cma0_a2 = $unsigned(u2_m0_wo0_cma0_mux_2_q);
    assign u2_m0_wo0_cma0_b2 = $unsigned(u2_m0_wo0_wi0_r0_memr2_q);
    assign u2_m0_wo0_cma0_c2 = {2'b00, u2_m0_wo0_ca2_q[0:0]};
    assign u2_m0_wo0_cma0_a3 = 16'b0;
    assign u2_m0_wo0_cma0_b3 = 16'b0;
    assign u2_m0_wo0_cma0_c3 = 3'b0;
    assign u2_m0_wo0_cma0_anl[0] = ~ u2_m0_wo0_aseq_q[0];
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
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
        .coef_b_0(16383),
        .coef_b_1(10043),
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
        .ay(u2_m0_wo0_cma0_a3),
        .by(u2_m0_wo0_cma0_a2),
        .az(u2_m0_wo0_cma0_b3),
        .bz(u2_m0_wo0_cma0_b2),
        .coefsela(u2_m0_wo0_cma0_c3),
        .coefselb(u2_m0_wo0_cma0_c2),
        .chainout(u2_m0_wo0_cma0_s2),
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
        .scanout(),
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
        .coef_a_0(772),
        .coef_a_1(-2462),
        .coef_b_0(-188),
        .coef_b_1(25),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .accumulate_clken("0"),
        .accum_pipeline_clken("2"),
        .accum_2nd_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(37)
    ) u2_m0_wo0_cma0_DSP0 (
        .clk(clk),
        .ena({ u2_m0_wo0_cma0_ena2, u2_m0_wo0_cma0_ena1, u2_m0_wo0_cma0_ena0 }),
        .clr({ u2_m0_wo0_cma0_reset, u2_m0_wo0_cma0_reset }),
        .ay(u2_m0_wo0_cma0_a1),
        .by(u2_m0_wo0_cma0_a0),
        .az(u2_m0_wo0_cma0_b1),
        .bz(u2_m0_wo0_cma0_b0),
        .coefsela(u2_m0_wo0_cma0_c1),
        .coefselb(u2_m0_wo0_cma0_c0),
        .accumulate(u2_m0_wo0_cma0_anl[0]),
        .chainin(u2_m0_wo0_cma0_s2),
        .resulta(u2_m0_wo0_cma0_s0),
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
        .scanout(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(37), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u2_m0_wo0_cma0_delay0 ( .xin(u2_m0_wo0_cma0_s0), .xout(u2_m0_wo0_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u2_m0_wo0_cma0_q = $unsigned(u2_m0_wo0_cma0_qq0[36:0]);

    // d_u2_m0_wo0_compute_q_19(DELAY,296)@18 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u2_m0_wo0_compute_q_19_q <= $unsigned(d_u2_m0_wo0_compute_q_18_q);
        end
    end

    // u2_m0_wo0_oseq(SEQUENCE,185)@18 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u2_m0_wo0_oseq_c;
        if (areset)
        begin
            u2_m0_wo0_oseq_c = 4'b0001;
            u2_m0_wo0_oseq_q <= $unsigned(1'b0);
            u2_m0_wo0_oseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u2_m0_wo0_compute_q_18_q == 1'b1)
            begin
                if (u2_m0_wo0_oseq_c == 4'b0000)
                begin
                    u2_m0_wo0_oseq_eq <= 1'b1;
                end
                else
                begin
                    u2_m0_wo0_oseq_eq <= 1'b0;
                end
                if (u2_m0_wo0_oseq_eq == 1'b1)
                begin
                    u2_m0_wo0_oseq_c = $signed(u2_m0_wo0_oseq_c) + $signed(4'd1);
                end
                else
                begin
                    u2_m0_wo0_oseq_c = $signed(u2_m0_wo0_oseq_c) - $signed(4'd1);
                end
                u2_m0_wo0_oseq_q <= $unsigned(u2_m0_wo0_oseq_c[3:3]);
            end
        end
    end

    // u2_m0_wo0_oseq_gated(LOGICAL,186)@19
    assign u2_m0_wo0_oseq_gated_q = u2_m0_wo0_oseq_q & d_u2_m0_wo0_compute_q_19_q;

    // u2_m0_wo0_oseq_gated_reg(REG,187)@19 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_m0_wo0_oseq_gated_reg_q <= $unsigned(1'b0);
        end
        else
        begin
            u2_m0_wo0_oseq_gated_reg_q <= $unsigned(u2_m0_wo0_oseq_gated_q);
        end
    end

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // out1_m0_wo0_data_selector(SELECTOR,256)@20 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            out1_m0_wo0_data_selector_q <= $unsigned(u3_m0_wo0_cma0_q);
            if (u3_m0_wo0_oseq_gated_reg_q == 1'b1)
            begin
                out1_m0_wo0_data_selector_q <= $unsigned(u3_m0_wo0_cma0_q);
            end
            if (u2_m0_wo0_oseq_gated_reg_q == 1'b1)
            begin
                out1_m0_wo0_data_selector_q <= $unsigned(u2_m0_wo0_cma0_q);
            end
        end
    end

    // u1_m0_wo0_run(ENABLEGENERATOR,75)@10 + 2
    assign u1_m0_wo0_run_ctrl = { u1_m0_wo0_run_out, xIn_v, u1_m0_wo0_run_enableQ };
    always @ (posedge clk)
    begin
        reg [0:0] u1_m0_wo0_run_enable_c;
        reg [2:0] u1_m0_wo0_run_inc;
        if (areset)
        begin
            u1_m0_wo0_run_q <= $unsigned(1'b0);
            u1_m0_wo0_run_enable_c = 1'd0;
            u1_m0_wo0_run_enableQ <= $unsigned(1'b0);
            u1_m0_wo0_run_count <= $unsigned(3'b000);
            u1_m0_wo0_run_inc = 3'b0;
        end
        else
        begin
            if (u1_m0_wo0_run_out == 1'b1)
            begin
                if (u1_m0_wo0_run_enable_c[0] == 1'b1)
                begin
                    u1_m0_wo0_run_enable_c = $signed(u1_m0_wo0_run_enable_c) - $signed(-1'd1);
                end
                else
                begin
                    u1_m0_wo0_run_enable_c = $signed(u1_m0_wo0_run_enable_c) + $signed(-1'd1);
                end
                u1_m0_wo0_run_enableQ <= $unsigned(u1_m0_wo0_run_enable_c[0:0]);
            end
            else
            begin
                u1_m0_wo0_run_enableQ <= $unsigned(1'b0);
            end
            unique case (u1_m0_wo0_run_ctrl)
                3'b000, 3'b001 : u1_m0_wo0_run_inc = 3'b000;
                3'b010, 3'b011 : u1_m0_wo0_run_inc = 3'b111;
                3'b100 : u1_m0_wo0_run_inc = 3'b000;
                3'b101 : u1_m0_wo0_run_inc = 3'b010;
                3'b110 : u1_m0_wo0_run_inc = 3'b111;
                3'b111 : u1_m0_wo0_run_inc = 3'b001;
                default : ;
            endcase
            u1_m0_wo0_run_count <= $unsigned($signed(u1_m0_wo0_run_count) + $signed(u1_m0_wo0_run_inc));
            u1_m0_wo0_run_q <= u1_m0_wo0_run_out;
        end
    end
    assign u1_m0_wo0_run_preEnaQ = u1_m0_wo0_run_count[2:2];
    assign u1_m0_wo0_run_out = u1_m0_wo0_run_preEnaQ & VCC_q;

    // u1_m0_wo0_memread(DELAY,76)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_memread_delay_0 <= '0;
        end
        else
        begin
            u1_m0_wo0_memread_delay_0 <= $unsigned(u1_m0_wo0_run_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u1_m0_wo0_memread_q <= u1_m0_wo0_memread_delay_0;
        end
    end

    // d_u1_m0_wo0_memread_q_13(DELAY,282)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_m0_wo0_memread_q_13_q <= '0;
        end
        else
        begin
            d_u1_m0_wo0_memread_q_13_q <= $unsigned(u1_m0_wo0_memread_q);
        end
    end

    // d_u1_m0_wo0_memread_q_14(DELAY,283)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u1_m0_wo0_memread_q_14_q <= $unsigned(d_u1_m0_wo0_memread_q_13_q);
        end
    end

    // u1_m0_wo0_wi0_r0_ra2_count0(COUNTER,86)@14
    // low=0, high=13, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra2_count0_i <= 4'd1;
            u1_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b0;
        end
        else if (d_u1_m0_wo0_memread_q_14_q == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_ra2_count0_i == 4'd12)
            begin
                u1_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_ra2_count0_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_ra2_count0_i <= $unsigned(u1_m0_wo0_wi0_r0_ra2_count0_i) + $unsigned(4'd3);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_ra2_count0_i <= $unsigned(u1_m0_wo0_wi0_r0_ra2_count0_i) + $unsigned(4'd1);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_ra2_count0_q = u1_m0_wo0_wi0_r0_ra2_count0_i[3:0];

    // u1_m0_wo0_wi0_r0_ra2_count0_lut(LOOKUP,84)@14
    always @(u1_m0_wo0_wi0_r0_ra2_count0_q)
    begin
        // Begin reserved scope level
        unique case (u1_m0_wo0_wi0_r0_ra2_count0_q)
            4'b0000 : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0000;
            4'b0001 : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0001;
            4'b0010 : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0010;
            4'b0011 : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0011;
            4'b0100 : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0100;
            4'b0101 : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0101;
            4'b0110 : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0110;
            4'b0111 : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0111;
            4'b1000 : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1000;
            4'b1001 : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1001;
            4'b1010 : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1010;
            4'b1011 : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1011;
            4'b1100 : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1100;
            4'b1101 : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1101;
            default : u1_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0000;
        endcase
        // End reserved scope level
    end

    // u1_m0_wo0_wi0_r0_ra2_count0_lutreg(REG,85)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra2_count0_lutreg_q <= $unsigned(4'b0000);
        end
        else if (d_u1_m0_wo0_memread_q_14_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_ra2_count0_lutreg_q <= $unsigned(u1_m0_wo0_wi0_r0_ra2_count0_lut_q);
        end
    end

    // u1_m0_wo0_wi0_r0_readReg2(DELAY,103)@14
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u1_m0_wo0_wi0_r0_readReg2_q <= u1_m0_wo0_wi0_r0_ra2_count0_lutreg_q;
        end
    end

    // d_xIn_1_13(DELAY,264)@10 + 3
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_1_13_delay_0 <= '0;
        end
        else
        begin
            d_xIn_1_13_delay_0 <= $unsigned(xIn_1);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_xIn_1_13_delay_1 <= d_xIn_1_13_delay_0;
            d_xIn_1_13_q <= d_xIn_1_13_delay_1;
        end
    end

    // d_in1_m0_wi0_wo0_assign_id2_q_14(DELAY,281)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in1_m0_wi0_wo0_assign_id2_q_14_q <= $unsigned(d_xIn_1_13_q);
        end
    end

    // u1_m0_wo0_wi0_r0_memr2(DUALMEM,101)@14
    assign u1_m0_wo0_wi0_r0_memr2_ia = $unsigned(d_in1_m0_wi0_wo0_assign_id2_q_14_q);
    assign u1_m0_wo0_wi0_r0_memr2_aa = u1_m0_wo0_wi0_r0_wa2_q;
    assign u1_m0_wo0_wi0_r0_memr2_ab = u1_m0_wo0_wi0_r0_readReg2_q;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(4),
        .numwords_a(14),
        .width_b(16),
        .widthad_b(4),
        .numwords_b(14),
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u1_m0_wo0_wi0_r0_memr2_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u1_m0_wo0_wi0_r0_memr2_aa),
        .data_a(u1_m0_wo0_wi0_r0_memr2_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_14_q[0]),
        .address_b(u1_m0_wo0_wi0_r0_memr2_ab),
        .q_b(u1_m0_wo0_wi0_r0_memr2_iq),
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
    assign u1_m0_wo0_wi0_r0_memr2_q = u1_m0_wo0_wi0_r0_memr2_iq[15:0];

    // u1_m0_wo0_wi0_r0_ra3_count0(COUNTER,89)@13
    // low=0, high=15, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra3_count0_i <= 4'd1;
        end
        else if (d_u1_m0_wo0_memread_q_13_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_ra3_count0_i <= $unsigned(u1_m0_wo0_wi0_r0_ra3_count0_i) + $unsigned(4'd1);
        end
    end
    assign u1_m0_wo0_wi0_r0_ra3_count0_q = u1_m0_wo0_wi0_r0_ra3_count0_i[3:0];

    // u1_m0_wo0_wi0_r0_ra3_count0_lut(LOOKUP,87)@13
    always @(u1_m0_wo0_wi0_r0_ra3_count0_q)
    begin
        // Begin reserved scope level
        unique case (u1_m0_wo0_wi0_r0_ra3_count0_q)
            4'b0000 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0010;
            4'b0001 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0001;
            4'b0010 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0100;
            4'b0011 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0011;
            4'b0100 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0110;
            4'b0101 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0101;
            4'b0110 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1000;
            4'b0111 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0111;
            4'b1000 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1010;
            4'b1001 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1001;
            4'b1010 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1100;
            4'b1011 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1011;
            4'b1100 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1110;
            4'b1101 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1101;
            4'b1110 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0000;
            4'b1111 : u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1111;
            default : begin
                          // unreachable
                          u1_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'bxxxx;
                      end
        endcase
        // End reserved scope level
    end

    // u1_m0_wo0_wi0_r0_ra3_count0_lutreg(REG,88)@13
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra3_count0_lutreg_q <= $unsigned(4'b0010);
        end
        else if (d_u1_m0_wo0_memread_q_13_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_ra3_count0_lutreg_q <= $unsigned(u1_m0_wo0_wi0_r0_ra3_count0_lut_q);
        end
    end

    // u1_m0_wo0_wi0_r0_readReg3(DELAY,106)@13
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u1_m0_wo0_wi0_r0_readReg3_q <= u1_m0_wo0_wi0_r0_ra3_count0_lutreg_q;
        end
    end

    // u1_m0_wo0_wi0_r0_memr3(DUALMEM,104)@13
    assign u1_m0_wo0_wi0_r0_memr3_ia = $unsigned(d_xIn_1_13_q);
    assign u1_m0_wo0_wi0_r0_memr3_aa = u1_m0_wo0_wi0_r0_wa3_q;
    assign u1_m0_wo0_wi0_r0_memr3_ab = u1_m0_wo0_wi0_r0_readReg3_q;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(4),
        .numwords_a(16),
        .width_b(16),
        .widthad_b(4),
        .numwords_b(16),
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u1_m0_wo0_wi0_r0_memr3_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u1_m0_wo0_wi0_r0_memr3_aa),
        .data_a(u1_m0_wo0_wi0_r0_memr3_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_13_q[0]),
        .address_b(u1_m0_wo0_wi0_r0_memr3_ab),
        .q_b(u1_m0_wo0_wi0_r0_memr3_iq),
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
    assign u1_m0_wo0_wi0_r0_memr3_q = u1_m0_wo0_wi0_r0_memr3_iq[15:0];

    // u1_m0_wo0_compute(DELAY,78)@12
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u1_m0_wo0_compute_delay_0 <= $unsigned(u1_m0_wo0_memread_q);
            u1_m0_wo0_compute_delay_1 <= u1_m0_wo0_compute_delay_0;
            u1_m0_wo0_compute_q <= u1_m0_wo0_compute_delay_1;
        end
    end

    // u1_m0_wo0_symSuppress_2_seq(SEQUENCE,121)@12 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u1_m0_wo0_symSuppress_2_seq_c;
        if (areset)
        begin
            u1_m0_wo0_symSuppress_2_seq_c = 4'b0000;
            u1_m0_wo0_symSuppress_2_seq_q <= $unsigned(1'b0);
            u1_m0_wo0_symSuppress_2_seq_eq <= 1'b0;
        end
        else
        begin
            if (u1_m0_wo0_compute_q == 1'b1)
            begin
                if (u1_m0_wo0_symSuppress_2_seq_c == 4'b0000)
                begin
                    u1_m0_wo0_symSuppress_2_seq_eq <= 1'b1;
                end
                else
                begin
                    u1_m0_wo0_symSuppress_2_seq_eq <= 1'b0;
                end
                if (u1_m0_wo0_symSuppress_2_seq_eq == 1'b1)
                begin
                    u1_m0_wo0_symSuppress_2_seq_c = $signed(u1_m0_wo0_symSuppress_2_seq_c) + $signed(4'd1);
                end
                else
                begin
                    u1_m0_wo0_symSuppress_2_seq_c = $signed(u1_m0_wo0_symSuppress_2_seq_c) - $signed(4'd1);
                end
                u1_m0_wo0_symSuppress_2_seq_q <= $unsigned(u1_m0_wo0_symSuppress_2_seq_c[3:3]);
            end
        end
    end

    // u1_m0_wo0_cma0_mux_2(MUX,260)@13 + 1
    assign u1_m0_wo0_cma0_mux_2_s = u1_m0_wo0_symSuppress_2_seq_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_cma0_mux_2_q <= 16'b0;
        end
        else
        begin
            unique case (u1_m0_wo0_cma0_mux_2_s)
                1'b0 : u1_m0_wo0_cma0_mux_2_q <= u1_m0_wo0_wi0_r0_memr3_q;
                1'b1 : u1_m0_wo0_cma0_mux_2_q <= {{15{GND_q[0]}}, GND_q};
                default : u1_m0_wo0_cma0_mux_2_q <= 16'b0;
            endcase
        end
    end

    // u1_m0_wo0_wi0_r0_delayr1(DELAY,110)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr1_delay_0 <= '0;
            u1_m0_wo0_wi0_r0_delayr1_delay_1 <= '0;
            u1_m0_wo0_wi0_r0_delayr1_q <= '0;
        end
        else if (d_u1_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr1_delay_0 <= $unsigned(u1_m0_wo0_wi0_r0_memr0_q);
            u1_m0_wo0_wi0_r0_delayr1_delay_1 <= u1_m0_wo0_wi0_r0_delayr1_delay_0;
            u1_m0_wo0_wi0_r0_delayr1_q <= u1_m0_wo0_wi0_r0_delayr1_delay_1;
        end
    end

    // u1_m0_wo0_wi0_r0_ra0_count0(COUNTER,83)@14
    // low=0, high=7, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra0_count0_i <= 3'd1;
        end
        else if (d_u1_m0_wo0_memread_q_14_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_ra0_count0_i <= $unsigned(u1_m0_wo0_wi0_r0_ra0_count0_i) + $unsigned(3'd1);
        end
    end
    assign u1_m0_wo0_wi0_r0_ra0_count0_q = u1_m0_wo0_wi0_r0_ra0_count0_i[2:0];

    // u1_m0_wo0_wi0_r0_ra4_count0_lut(LOOKUP,90)@14
    always @(u1_m0_wo0_wi0_r0_ra0_count0_q)
    begin
        // Begin reserved scope level
        unique case (u1_m0_wo0_wi0_r0_ra0_count0_q)
            3'b000 : u1_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b00;
            3'b001 : u1_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b10;
            3'b010 : u1_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b01;
            3'b011 : u1_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b11;
            3'b100 : u1_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b10;
            3'b101 : u1_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b00;
            3'b110 : u1_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b11;
            3'b111 : u1_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b01;
            default : begin
                          // unreachable
                          u1_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'bxx;
                      end
        endcase
        // End reserved scope level
    end

    // u1_m0_wo0_wi0_r0_ra4_count0_lutreg(REG,91)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra4_count0_lutreg_q <= $unsigned(2'b00);
        end
        else if (d_u1_m0_wo0_memread_q_14_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_ra4_count0_lutreg_q <= $unsigned(u1_m0_wo0_wi0_r0_ra4_count0_lut_q);
        end
    end

    // u1_m0_wo0_wi0_r0_readReg4(DELAY,109)@14
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u1_m0_wo0_wi0_r0_readReg4_q <= u1_m0_wo0_wi0_r0_ra4_count0_lutreg_q;
        end
    end

    // d_u1_m0_wo0_compute_q_13(DELAY,284)@12 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u1_m0_wo0_compute_q_13_q <= $unsigned(u1_m0_wo0_compute_q);
        end
    end

    // u1_m0_wo0_wi0_r0_we4_seq(SEQUENCE,93)@13 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u1_m0_wo0_wi0_r0_we4_seq_c;
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_we4_seq_c = 4'b1111;
            u1_m0_wo0_wi0_r0_we4_seq_q <= $unsigned(1'b0);
            u1_m0_wo0_wi0_r0_we4_seq_eq <= 1'b1;
        end
        else
        begin
            if (d_u1_m0_wo0_compute_q_13_q == 1'b1)
            begin
                if (u1_m0_wo0_wi0_r0_we4_seq_c == 4'b0000)
                begin
                    u1_m0_wo0_wi0_r0_we4_seq_eq <= 1'b1;
                end
                else
                begin
                    u1_m0_wo0_wi0_r0_we4_seq_eq <= 1'b0;
                end
                if (u1_m0_wo0_wi0_r0_we4_seq_eq == 1'b1)
                begin
                    u1_m0_wo0_wi0_r0_we4_seq_c = $signed(u1_m0_wo0_wi0_r0_we4_seq_c) + $signed(4'd1);
                end
                else
                begin
                    u1_m0_wo0_wi0_r0_we4_seq_c = $signed(u1_m0_wo0_wi0_r0_we4_seq_c) - $signed(4'd1);
                end
                u1_m0_wo0_wi0_r0_we4_seq_q <= $unsigned(u1_m0_wo0_wi0_r0_we4_seq_c[3:3]);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_we4_seq_q <= $unsigned(1'b0);
            end
        end
    end

    // u1_m0_wo0_wi0_r0_wa4(COUNTER,97)@14
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_wa4_i <= 2'd0;
        end
        else if (u1_m0_wo0_wi0_r0_we4_seq_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_wa4_i <= $unsigned(u1_m0_wo0_wi0_r0_wa4_i) + $unsigned(2'd1);
        end
    end
    assign u1_m0_wo0_wi0_r0_wa4_q = u1_m0_wo0_wi0_r0_wa4_i[1:0];

    // u1_m0_wo0_wi0_r0_memr4(DUALMEM,107)@14
    assign u1_m0_wo0_wi0_r0_memr4_ia = $unsigned(u1_m0_wo0_wi0_r0_memr2_q);
    assign u1_m0_wo0_wi0_r0_memr4_aa = u1_m0_wo0_wi0_r0_wa4_q;
    assign u1_m0_wo0_wi0_r0_memr4_ab = u1_m0_wo0_wi0_r0_readReg4_q;
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u1_m0_wo0_wi0_r0_memr4_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u1_m0_wo0_wi0_r0_memr4_aa),
        .data_a(u1_m0_wo0_wi0_r0_memr4_ia),
        .wren_a(u1_m0_wo0_wi0_r0_we4_seq_q[0]),
        .address_b(u1_m0_wo0_wi0_r0_memr4_ab),
        .q_b(u1_m0_wo0_wi0_r0_memr4_iq),
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
    assign u1_m0_wo0_wi0_r0_memr4_q = u1_m0_wo0_wi0_r0_memr4_iq[15:0];

    // u1_m0_wo0_ca2(COUNTER,112)@14
    // low=0, high=1, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_ca2_i <= 1'd0;
        end
        else if (d_u1_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u1_m0_wo0_ca2_i <= $unsigned(u1_m0_wo0_ca2_i) + $unsigned(1'd1);
        end
    end
    assign u1_m0_wo0_ca2_q = u1_m0_wo0_ca2_i[0:0];

    // u1_m0_wo0_wi0_r0_ra0_count0_lut(LOOKUP,81)@14
    always @(u1_m0_wo0_wi0_r0_ra0_count0_q)
    begin
        // Begin reserved scope level
        unique case (u1_m0_wo0_wi0_r0_ra0_count0_q)
            3'b000 : u1_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b001;
            3'b001 : u1_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b011;
            3'b010 : u1_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b011;
            3'b011 : u1_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b101;
            3'b100 : u1_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b101;
            3'b101 : u1_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b111;
            3'b110 : u1_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b111;
            3'b111 : u1_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b001;
            default : begin
                          // unreachable
                          u1_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'bxxx;
                      end
        endcase
        // End reserved scope level
    end

    // u1_m0_wo0_wi0_r0_ra0_count0_lutreg(REG,82)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= $unsigned(3'b001);
        end
        else if (d_u1_m0_wo0_memread_q_14_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= $unsigned(u1_m0_wo0_wi0_r0_ra0_count0_lut_q);
        end
    end

    // u1_m0_wo0_wi0_r0_readReg0(DELAY,100)@14
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u1_m0_wo0_wi0_r0_readReg0_q <= u1_m0_wo0_wi0_r0_ra0_count0_lutreg_q;
        end
    end

    // u1_m0_wo0_wi0_r0_memr0(DUALMEM,98)@14
    assign u1_m0_wo0_wi0_r0_memr0_ia = $unsigned(d_in1_m0_wi0_wo0_assign_id2_q_14_q);
    assign u1_m0_wo0_wi0_r0_memr0_aa = u0_m0_wo0_wi0_r0_wa0_q;
    assign u1_m0_wo0_wi0_r0_memr0_ab = u1_m0_wo0_wi0_r0_readReg0_q;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(16),
        .widthad_b(3),
        .numwords_b(8),
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u1_m0_wo0_wi0_r0_memr0_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u1_m0_wo0_wi0_r0_memr0_aa),
        .data_a(u1_m0_wo0_wi0_r0_memr0_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_14_q[0]),
        .address_b(u1_m0_wo0_wi0_r0_memr0_ab),
        .q_b(u1_m0_wo0_wi0_r0_memr0_iq),
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
    assign u1_m0_wo0_wi0_r0_memr0_q = u1_m0_wo0_wi0_r0_memr0_iq[15:0];

    // u1_m0_wo0_wi0_r0_delayr5_notEnable(LOGICAL,324)@14
    assign u1_m0_wo0_wi0_r0_delayr5_notEnable_q = $unsigned(~ (d_u1_m0_wo0_compute_q_14_q));

    // u1_m0_wo0_wi0_r0_delayr5_nor(LOGICAL,325)@14
    assign u1_m0_wo0_wi0_r0_delayr5_nor_q = ~ (u1_m0_wo0_wi0_r0_delayr5_notEnable_q | u1_m0_wo0_wi0_r0_delayr5_sticky_ena_q);

    // u1_m0_wo0_wi0_r0_delayr5_mem_last(CONSTANT,321)
    assign u1_m0_wo0_wi0_r0_delayr5_mem_last_q = $unsigned(3'b010);

    // u1_m0_wo0_wi0_r0_delayr5_cmp(LOGICAL,322)@14
    assign u1_m0_wo0_wi0_r0_delayr5_cmp_b = {1'b0, u1_m0_wo0_wi0_r0_delayr5_rdmux_q};
    assign u1_m0_wo0_wi0_r0_delayr5_cmp_q = $unsigned(u1_m0_wo0_wi0_r0_delayr5_mem_last_q == u1_m0_wo0_wi0_r0_delayr5_cmp_b ? 1'b1 : 1'b0);

    // u1_m0_wo0_wi0_r0_delayr5_cmpReg(REG,323)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr5_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u1_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr5_cmpReg_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr5_cmp_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr5_sticky_ena(REG,326)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr5_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u1_m0_wo0_wi0_r0_delayr5_nor_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr5_sticky_ena_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr5_cmpReg_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr5_enaAnd(LOGICAL,327)@14
    assign u1_m0_wo0_wi0_r0_delayr5_enaAnd_q = u1_m0_wo0_wi0_r0_delayr5_sticky_ena_q & d_u1_m0_wo0_compute_q_14_q;

    // u1_m0_wo0_wi0_r0_delayr5_rdcnt(COUNTER,318)@14 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr5_rdcnt_i <= 2'd0;
        end
        else if (d_u1_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr5_rdcnt_i <= $unsigned(u1_m0_wo0_wi0_r0_delayr5_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u1_m0_wo0_wi0_r0_delayr5_rdcnt_q = u1_m0_wo0_wi0_r0_delayr5_rdcnt_i[1:0];

    // u1_m0_wo0_wi0_r0_delayr5_rdmux(MUX,319)@14
    assign u1_m0_wo0_wi0_r0_delayr5_rdmux_s = d_u1_m0_wo0_compute_q_14_q;
    always @(u1_m0_wo0_wi0_r0_delayr5_rdmux_s or u1_m0_wo0_wi0_r0_delayr5_wraddr_q or u1_m0_wo0_wi0_r0_delayr5_rdcnt_q)
    begin
        unique case (u1_m0_wo0_wi0_r0_delayr5_rdmux_s)
            1'b0 : u1_m0_wo0_wi0_r0_delayr5_rdmux_q = u1_m0_wo0_wi0_r0_delayr5_wraddr_q;
            1'b1 : u1_m0_wo0_wi0_r0_delayr5_rdmux_q = u1_m0_wo0_wi0_r0_delayr5_rdcnt_q;
            default : u1_m0_wo0_wi0_r0_delayr5_rdmux_q = 2'b0;
        endcase
    end

    // u1_m0_wo0_wi0_r0_delayr5_wraddr(REG,320)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr5_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u1_m0_wo0_wi0_r0_delayr5_wraddr_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr5_rdmux_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr5_mem(DUALMEM,317)@14 + 2
    assign u1_m0_wo0_wi0_r0_delayr5_mem_ia = $unsigned(u1_m0_wo0_wi0_r0_memr4_q);
    assign u1_m0_wo0_wi0_r0_delayr5_mem_aa = u1_m0_wo0_wi0_r0_delayr5_wraddr_q;
    assign u1_m0_wo0_wi0_r0_delayr5_mem_ab = u1_m0_wo0_wi0_r0_delayr5_rdmux_q;
    assign u1_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB = areset | u1_m0_wo0_wi0_r0_delayr5_enaAnd_q[0];
    assign u1_m0_wo0_wi0_r0_delayr5_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u1_m0_wo0_wi0_r0_delayr5_mem_dmem (
        .clocken1(u1_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u1_m0_wo0_wi0_r0_delayr5_mem_reset0),
        .clock1(clk),
        .address_a(u1_m0_wo0_wi0_r0_delayr5_mem_aa),
        .data_a(u1_m0_wo0_wi0_r0_delayr5_mem_ia),
        .wren_a(d_u1_m0_wo0_compute_q_14_q[0]),
        .address_b(u1_m0_wo0_wi0_r0_delayr5_mem_ab),
        .q_b(u1_m0_wo0_wi0_r0_delayr5_mem_iq),
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
    assign u1_m0_wo0_wi0_r0_delayr5_mem_q = u1_m0_wo0_wi0_r0_delayr5_mem_iq[15:0];

    // u1_m0_wo0_aseq(SEQUENCE,124)@13 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u1_m0_wo0_aseq_c;
        if (areset)
        begin
            u1_m0_wo0_aseq_c = 4'b0000;
            u1_m0_wo0_aseq_q <= $unsigned(1'b0);
            u1_m0_wo0_aseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u1_m0_wo0_compute_q_13_q == 1'b1)
            begin
                if (u1_m0_wo0_aseq_c == 4'b0000)
                begin
                    u1_m0_wo0_aseq_eq <= 1'b1;
                end
                else
                begin
                    u1_m0_wo0_aseq_eq <= 1'b0;
                end
                if (u1_m0_wo0_aseq_eq == 1'b1)
                begin
                    u1_m0_wo0_aseq_c = $signed(u1_m0_wo0_aseq_c) + $signed(4'd1);
                end
                else
                begin
                    u1_m0_wo0_aseq_c = $signed(u1_m0_wo0_aseq_c) - $signed(4'd1);
                end
                u1_m0_wo0_aseq_q <= $unsigned(u1_m0_wo0_aseq_c[3:3]);
            end
        end
    end

    // d_u1_m0_wo0_compute_q_17(DELAY,286)@14 + 3
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u1_m0_wo0_compute_q_17_delay_0 <= $unsigned(d_u1_m0_wo0_compute_q_14_q);
            d_u1_m0_wo0_compute_q_17_delay_1 <= d_u1_m0_wo0_compute_q_17_delay_0;
            d_u1_m0_wo0_compute_q_17_q <= d_u1_m0_wo0_compute_q_17_delay_1;
        end
    end

    // d_u1_m0_wo0_compute_q_14(DELAY,285)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u1_m0_wo0_compute_q_14_q <= $unsigned(d_u1_m0_wo0_compute_q_13_q);
        end
    end

    // u1_m0_wo0_cma0(CHAINMULTADD,123)@14 + 5
    assign u1_m0_wo0_cma0_reset = areset;
    assign u1_m0_wo0_cma0_ena0 = d_u1_m0_wo0_compute_q_14_q[0] | u1_m0_wo0_cma0_reset;
    assign u1_m0_wo0_cma0_ena1 = d_u1_m0_wo0_compute_q_17_q[0] | u1_m0_wo0_cma0_reset;
    assign u1_m0_wo0_cma0_ena2 = 1'b1;

    assign u1_m0_wo0_cma0_a0 = $unsigned(u1_m0_wo0_wi0_r0_delayr5_mem_q);
    assign u1_m0_wo0_cma0_b0 = $unsigned(u1_m0_wo0_wi0_r0_memr0_q);
    assign u1_m0_wo0_cma0_c0 = {2'b00, u1_m0_wo0_ca2_q[0:0]};
    assign u1_m0_wo0_cma0_a1 = $unsigned(u1_m0_wo0_wi0_r0_memr4_q);
    assign u1_m0_wo0_cma0_b1 = $unsigned(u1_m0_wo0_wi0_r0_delayr1_q);
    assign u1_m0_wo0_cma0_c1 = {2'b00, u1_m0_wo0_ca2_q[0:0]};
    assign u1_m0_wo0_cma0_a2 = $unsigned(u1_m0_wo0_cma0_mux_2_q);
    assign u1_m0_wo0_cma0_b2 = $unsigned(u1_m0_wo0_wi0_r0_memr2_q);
    assign u1_m0_wo0_cma0_c2 = {2'b00, u1_m0_wo0_ca2_q[0:0]};
    assign u1_m0_wo0_cma0_a3 = 16'b0;
    assign u1_m0_wo0_cma0_b3 = 16'b0;
    assign u1_m0_wo0_cma0_c3 = 3'b0;
    assign u1_m0_wo0_cma0_anl[0] = ~ u1_m0_wo0_aseq_q[0];
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
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
        .coef_b_0(16383),
        .coef_b_1(10043),
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
        .ay(u1_m0_wo0_cma0_a3),
        .by(u1_m0_wo0_cma0_a2),
        .az(u1_m0_wo0_cma0_b3),
        .bz(u1_m0_wo0_cma0_b2),
        .coefsela(u1_m0_wo0_cma0_c3),
        .coefselb(u1_m0_wo0_cma0_c2),
        .chainout(u1_m0_wo0_cma0_s2),
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
        .scanout(),
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
        .coef_a_0(772),
        .coef_a_1(-2462),
        .coef_b_0(-188),
        .coef_b_1(25),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .accumulate_clken("0"),
        .accum_pipeline_clken("2"),
        .accum_2nd_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(37)
    ) u1_m0_wo0_cma0_DSP0 (
        .clk(clk),
        .ena({ u1_m0_wo0_cma0_ena2, u1_m0_wo0_cma0_ena1, u1_m0_wo0_cma0_ena0 }),
        .clr({ u1_m0_wo0_cma0_reset, u1_m0_wo0_cma0_reset }),
        .ay(u1_m0_wo0_cma0_a1),
        .by(u1_m0_wo0_cma0_a0),
        .az(u1_m0_wo0_cma0_b1),
        .bz(u1_m0_wo0_cma0_b0),
        .coefsela(u1_m0_wo0_cma0_c1),
        .coefselb(u1_m0_wo0_cma0_c0),
        .accumulate(u1_m0_wo0_cma0_anl[0]),
        .chainin(u1_m0_wo0_cma0_s2),
        .resulta(u1_m0_wo0_cma0_s0),
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
        .scanout(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(37), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u1_m0_wo0_cma0_delay0 ( .xin(u1_m0_wo0_cma0_s0), .xout(u1_m0_wo0_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u1_m0_wo0_cma0_q = $unsigned(u1_m0_wo0_cma0_qq0[36:0]);

    // d_u1_m0_wo0_compute_q_18(DELAY,287)@17 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_m0_wo0_compute_q_18_q <= '0;
        end
        else
        begin
            d_u1_m0_wo0_compute_q_18_q <= $unsigned(d_u1_m0_wo0_compute_q_17_q);
        end
    end

    // u1_m0_wo0_oseq(SEQUENCE,126)@17 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u1_m0_wo0_oseq_c;
        if (areset)
        begin
            u1_m0_wo0_oseq_c = 4'b0001;
            u1_m0_wo0_oseq_q <= $unsigned(1'b0);
            u1_m0_wo0_oseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u1_m0_wo0_compute_q_17_q == 1'b1)
            begin
                if (u1_m0_wo0_oseq_c == 4'b0000)
                begin
                    u1_m0_wo0_oseq_eq <= 1'b1;
                end
                else
                begin
                    u1_m0_wo0_oseq_eq <= 1'b0;
                end
                if (u1_m0_wo0_oseq_eq == 1'b1)
                begin
                    u1_m0_wo0_oseq_c = $signed(u1_m0_wo0_oseq_c) + $signed(4'd1);
                end
                else
                begin
                    u1_m0_wo0_oseq_c = $signed(u1_m0_wo0_oseq_c) - $signed(4'd1);
                end
                u1_m0_wo0_oseq_q <= $unsigned(u1_m0_wo0_oseq_c[3:3]);
            end
        end
    end

    // u1_m0_wo0_oseq_gated(LOGICAL,127)@18
    assign u1_m0_wo0_oseq_gated_q = u1_m0_wo0_oseq_q & d_u1_m0_wo0_compute_q_18_q;

    // u1_m0_wo0_oseq_gated_reg(REG,128)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_oseq_gated_reg_q <= $unsigned(1'b0);
        end
        else
        begin
            u1_m0_wo0_oseq_gated_reg_q <= $unsigned(u1_m0_wo0_oseq_gated_q);
        end
    end

    // u0_m0_wo0_run(ENABLEGENERATOR,16)@10 + 2
    assign u0_m0_wo0_run_ctrl = { u0_m0_wo0_run_out, xIn_v, u0_m0_wo0_run_enableQ };
    always @ (posedge clk)
    begin
        reg [0:0] u0_m0_wo0_run_enable_c;
        reg [2:0] u0_m0_wo0_run_inc;
        if (areset)
        begin
            u0_m0_wo0_run_q <= $unsigned(1'b0);
            u0_m0_wo0_run_enable_c = 1'd0;
            u0_m0_wo0_run_enableQ <= $unsigned(1'b0);
            u0_m0_wo0_run_count <= $unsigned(3'b000);
            u0_m0_wo0_run_inc = 3'b0;
        end
        else
        begin
            if (u0_m0_wo0_run_out == 1'b1)
            begin
                if (u0_m0_wo0_run_enable_c[0] == 1'b1)
                begin
                    u0_m0_wo0_run_enable_c = $signed(u0_m0_wo0_run_enable_c) - $signed(-1'd1);
                end
                else
                begin
                    u0_m0_wo0_run_enable_c = $signed(u0_m0_wo0_run_enable_c) + $signed(-1'd1);
                end
                u0_m0_wo0_run_enableQ <= $unsigned(u0_m0_wo0_run_enable_c[0:0]);
            end
            else
            begin
                u0_m0_wo0_run_enableQ <= $unsigned(1'b0);
            end
            unique case (u0_m0_wo0_run_ctrl)
                3'b000, 3'b001 : u0_m0_wo0_run_inc = 3'b000;
                3'b010, 3'b011 : u0_m0_wo0_run_inc = 3'b111;
                3'b100 : u0_m0_wo0_run_inc = 3'b000;
                3'b101 : u0_m0_wo0_run_inc = 3'b010;
                3'b110 : u0_m0_wo0_run_inc = 3'b111;
                3'b111 : u0_m0_wo0_run_inc = 3'b001;
                default : ;
            endcase
            u0_m0_wo0_run_count <= $unsigned($signed(u0_m0_wo0_run_count) + $signed(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        end
    end
    assign u0_m0_wo0_run_preEnaQ = u0_m0_wo0_run_count[2:2];
    assign u0_m0_wo0_run_out = u0_m0_wo0_run_preEnaQ & VCC_q;

    // u0_m0_wo0_memread(DELAY,17)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_memread_q <= '0;
        end
        else
        begin
            u0_m0_wo0_memread_q <= $unsigned(u0_m0_wo0_run_q);
        end
    end

    // d_u0_m0_wo0_memread_q_13(DELAY,272)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m0_wo0_memread_q_13_q <= '0;
        end
        else
        begin
            d_u0_m0_wo0_memread_q_13_q <= $unsigned(u0_m0_wo0_memread_q);
        end
    end

    // d_u0_m0_wo0_memread_q_14(DELAY,273)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_memread_q_14_q <= $unsigned(d_u0_m0_wo0_memread_q_13_q);
        end
    end

    // u0_m0_wo0_wi0_r0_ra2_count0(COUNTER,27)@14
    // low=0, high=11, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra2_count0_i <= 4'd1;
            u0_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b0;
        end
        else if (d_u0_m0_wo0_memread_q_14_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra2_count0_i == 4'd10)
            begin
                u0_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_ra2_count0_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra2_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra2_count0_i) + $unsigned(4'd5);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra2_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra2_count0_i) + $unsigned(4'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra2_count0_q = u0_m0_wo0_wi0_r0_ra2_count0_i[3:0];

    // u0_m0_wo0_wi0_r0_ra2_count0_lut(LOOKUP,25)@14
    always @(u0_m0_wo0_wi0_r0_ra2_count0_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra2_count0_q)
            4'b0000 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0000;
            4'b0001 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0001;
            4'b0010 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0010;
            4'b0011 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0011;
            4'b0100 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0100;
            4'b0101 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0101;
            4'b0110 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0110;
            4'b0111 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0111;
            4'b1000 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1000;
            4'b1001 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1001;
            4'b1010 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1010;
            4'b1011 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1011;
            default : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0000;
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_ra2_count0_lutreg(REG,26)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra2_count0_lutreg_q <= $unsigned(4'b0000);
        end
        else if (d_u0_m0_wo0_memread_q_14_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra2_count0_lutreg_q <= $unsigned(u0_m0_wo0_wi0_r0_ra2_count0_lut_q);
        end
    end

    // u0_m0_wo0_wi0_r0_readReg2(DELAY,44)@14
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_readReg2_q <= u0_m0_wo0_wi0_r0_ra2_count0_lutreg_q;
        end
    end

    // d_xIn_0_13(DELAY,263)@10 + 3
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_0_13_delay_0 <= '0;
        end
        else
        begin
            d_xIn_0_13_delay_0 <= $unsigned(xIn_0);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_xIn_0_13_delay_1 <= d_xIn_0_13_delay_0;
            d_xIn_0_13_q <= d_xIn_0_13_delay_1;
        end
    end

    // d_in0_m0_wi0_wo0_assign_id0_q_14(DELAY,267)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id0_q_14_q <= $unsigned(d_xIn_0_13_q);
        end
    end

    // u0_m0_wo0_wi0_r0_memr2(DUALMEM,42)@14
    assign u0_m0_wo0_wi0_r0_memr2_ia = $unsigned(d_in0_m0_wi0_wo0_assign_id0_q_14_q);
    assign u0_m0_wo0_wi0_r0_memr2_aa = u0_m0_wo0_wi0_r0_wa2_q;
    assign u0_m0_wo0_wi0_r0_memr2_ab = u0_m0_wo0_wi0_r0_readReg2_q;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(4),
        .numwords_a(12),
        .width_b(16),
        .widthad_b(4),
        .numwords_b(12),
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_memr2_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_wi0_r0_memr2_aa),
        .data_a(u0_m0_wo0_wi0_r0_memr2_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_14_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_memr2_ab),
        .q_b(u0_m0_wo0_wi0_r0_memr2_iq),
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
    assign u0_m0_wo0_wi0_r0_memr2_q = u0_m0_wo0_wi0_r0_memr2_iq[15:0];

    // u0_m0_wo0_wi0_r0_ra3_count0(COUNTER,30)@13
    // low=0, high=13, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra3_count0_i <= 4'd1;
            u0_m0_wo0_wi0_r0_ra3_count0_eq <= 1'b0;
        end
        else if (d_u0_m0_wo0_memread_q_13_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra3_count0_i == 4'd12)
            begin
                u0_m0_wo0_wi0_r0_ra3_count0_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra3_count0_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_ra3_count0_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra3_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra3_count0_i) + $unsigned(4'd3);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra3_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra3_count0_i) + $unsigned(4'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra3_count0_q = u0_m0_wo0_wi0_r0_ra3_count0_i[3:0];

    // u0_m0_wo0_wi0_r0_ra3_count0_lut(LOOKUP,28)@13
    always @(u0_m0_wo0_wi0_r0_ra3_count0_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra3_count0_q)
            4'b0000 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0010;
            4'b0001 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0001;
            4'b0010 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0100;
            4'b0011 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0011;
            4'b0100 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0110;
            4'b0101 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0101;
            4'b0110 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1000;
            4'b0111 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0111;
            4'b1000 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1010;
            4'b1001 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1001;
            4'b1010 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1100;
            4'b1011 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1011;
            4'b1100 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0000;
            4'b1101 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1101;
            default : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0010;
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_ra3_count0_lutreg(REG,29)@13
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra3_count0_lutreg_q <= $unsigned(4'b0010);
        end
        else if (d_u0_m0_wo0_memread_q_13_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra3_count0_lutreg_q <= $unsigned(u0_m0_wo0_wi0_r0_ra3_count0_lut_q);
        end
    end

    // u0_m0_wo0_wi0_r0_readReg3(DELAY,47)@13
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_readReg3_q <= u0_m0_wo0_wi0_r0_ra3_count0_lutreg_q;
        end
    end

    // u0_m0_wo0_wi0_r0_memr3(DUALMEM,45)@13
    assign u0_m0_wo0_wi0_r0_memr3_ia = $unsigned(d_xIn_0_13_q);
    assign u0_m0_wo0_wi0_r0_memr3_aa = u0_m0_wo0_wi0_r0_wa3_q;
    assign u0_m0_wo0_wi0_r0_memr3_ab = u0_m0_wo0_wi0_r0_readReg3_q;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(4),
        .numwords_a(14),
        .width_b(16),
        .widthad_b(4),
        .numwords_b(14),
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_memr3_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_wi0_r0_memr3_aa),
        .data_a(u0_m0_wo0_wi0_r0_memr3_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_13_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_memr3_ab),
        .q_b(u0_m0_wo0_wi0_r0_memr3_iq),
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
    assign u0_m0_wo0_wi0_r0_memr3_q = u0_m0_wo0_wi0_r0_memr3_iq[15:0];

    // u0_m0_wo0_compute(DELAY,19)@12
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_compute_delay_0 <= $unsigned(u0_m0_wo0_memread_q);
            u0_m0_wo0_compute_delay_1 <= u0_m0_wo0_compute_delay_0;
            u0_m0_wo0_compute_q <= u0_m0_wo0_compute_delay_1;
        end
    end

    // u0_m0_wo0_symSuppress_2_seq(SEQUENCE,62)@12 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u0_m0_wo0_symSuppress_2_seq_c;
        if (areset)
        begin
            u0_m0_wo0_symSuppress_2_seq_c = 4'b0000;
            u0_m0_wo0_symSuppress_2_seq_q <= $unsigned(1'b0);
            u0_m0_wo0_symSuppress_2_seq_eq <= 1'b0;
        end
        else
        begin
            if (u0_m0_wo0_compute_q == 1'b1)
            begin
                if (u0_m0_wo0_symSuppress_2_seq_c == 4'b0000)
                begin
                    u0_m0_wo0_symSuppress_2_seq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_symSuppress_2_seq_eq <= 1'b0;
                end
                if (u0_m0_wo0_symSuppress_2_seq_eq == 1'b1)
                begin
                    u0_m0_wo0_symSuppress_2_seq_c = $signed(u0_m0_wo0_symSuppress_2_seq_c) + $signed(4'd1);
                end
                else
                begin
                    u0_m0_wo0_symSuppress_2_seq_c = $signed(u0_m0_wo0_symSuppress_2_seq_c) - $signed(4'd1);
                end
                u0_m0_wo0_symSuppress_2_seq_q <= $unsigned(u0_m0_wo0_symSuppress_2_seq_c[3:3]);
            end
        end
    end

    // u0_m0_wo0_cma0_mux_2(MUX,259)@13 + 1
    assign u0_m0_wo0_cma0_mux_2_s = u0_m0_wo0_symSuppress_2_seq_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_cma0_mux_2_q <= 16'b0;
        end
        else
        begin
            unique case (u0_m0_wo0_cma0_mux_2_s)
                1'b0 : u0_m0_wo0_cma0_mux_2_q <= u0_m0_wo0_wi0_r0_memr3_q;
                1'b1 : u0_m0_wo0_cma0_mux_2_q <= {{15{GND_q[0]}}, GND_q};
                default : u0_m0_wo0_cma0_mux_2_q <= 16'b0;
            endcase
        end
    end

    // u0_m0_wo0_wi0_r0_delayr1(DELAY,51)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr1_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr1_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr1_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr1_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_memr0_q);
            u0_m0_wo0_wi0_r0_delayr1_delay_1 <= u0_m0_wo0_wi0_r0_delayr1_delay_0;
            u0_m0_wo0_wi0_r0_delayr1_q <= u0_m0_wo0_wi0_r0_delayr1_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_ra0_count0(COUNTER,24)@14
    // low=0, high=7, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count0_i <= 3'd1;
        end
        else if (d_u0_m0_wo0_memread_q_14_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra0_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count0_i) + $unsigned(3'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_count0_q = u0_m0_wo0_wi0_r0_ra0_count0_i[2:0];

    // u0_m0_wo0_wi0_r0_ra4_count0_lut(LOOKUP,31)@14
    always @(u0_m0_wo0_wi0_r0_ra0_count0_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra0_count0_q)
            3'b000 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b00;
            3'b001 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b10;
            3'b010 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b01;
            3'b011 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b11;
            3'b100 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b10;
            3'b101 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b00;
            3'b110 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b11;
            3'b111 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'b01;
            default : begin
                          // unreachable
                          u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 2'bxx;
                      end
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_ra4_count0_lutreg(REG,32)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra4_count0_lutreg_q <= $unsigned(2'b00);
        end
        else if (d_u0_m0_wo0_memread_q_14_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra4_count0_lutreg_q <= $unsigned(u0_m0_wo0_wi0_r0_ra4_count0_lut_q);
        end
    end

    // u0_m0_wo0_wi0_r0_readReg4(DELAY,50)@14
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_readReg4_q <= u0_m0_wo0_wi0_r0_ra4_count0_lutreg_q;
        end
    end

    // d_u0_m0_wo0_compute_q_13(DELAY,274)@12 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_compute_q_13_q <= $unsigned(u0_m0_wo0_compute_q);
        end
    end

    // u0_m0_wo0_wi0_r0_we4_seq(SEQUENCE,34)@13 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u0_m0_wo0_wi0_r0_we4_seq_c;
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_we4_seq_c = 4'b1111;
            u0_m0_wo0_wi0_r0_we4_seq_q <= $unsigned(1'b0);
            u0_m0_wo0_wi0_r0_we4_seq_eq <= 1'b1;
        end
        else
        begin
            if (d_u0_m0_wo0_compute_q_13_q == 1'b1)
            begin
                if (u0_m0_wo0_wi0_r0_we4_seq_c == 4'b0000)
                begin
                    u0_m0_wo0_wi0_r0_we4_seq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_wi0_r0_we4_seq_eq <= 1'b0;
                end
                if (u0_m0_wo0_wi0_r0_we4_seq_eq == 1'b1)
                begin
                    u0_m0_wo0_wi0_r0_we4_seq_c = $signed(u0_m0_wo0_wi0_r0_we4_seq_c) + $signed(4'd1);
                end
                else
                begin
                    u0_m0_wo0_wi0_r0_we4_seq_c = $signed(u0_m0_wo0_wi0_r0_we4_seq_c) - $signed(4'd1);
                end
                u0_m0_wo0_wi0_r0_we4_seq_q <= $unsigned(u0_m0_wo0_wi0_r0_we4_seq_c[3:3]);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_we4_seq_q <= $unsigned(1'b0);
            end
        end
    end

    // u0_m0_wo0_wi0_r0_wa4(COUNTER,38)@14
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa4_i <= 2'd0;
        end
        else if (u0_m0_wo0_wi0_r0_we4_seq_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_wa4_i <= $unsigned(u0_m0_wo0_wi0_r0_wa4_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_wa4_q = u0_m0_wo0_wi0_r0_wa4_i[1:0];

    // u0_m0_wo0_wi0_r0_memr4(DUALMEM,48)@14
    assign u0_m0_wo0_wi0_r0_memr4_ia = $unsigned(u0_m0_wo0_wi0_r0_memr2_q);
    assign u0_m0_wo0_wi0_r0_memr4_aa = u0_m0_wo0_wi0_r0_wa4_q;
    assign u0_m0_wo0_wi0_r0_memr4_ab = u0_m0_wo0_wi0_r0_readReg4_q;
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_memr4_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_wi0_r0_memr4_aa),
        .data_a(u0_m0_wo0_wi0_r0_memr4_ia),
        .wren_a(u0_m0_wo0_wi0_r0_we4_seq_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_memr4_ab),
        .q_b(u0_m0_wo0_wi0_r0_memr4_iq),
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
    assign u0_m0_wo0_wi0_r0_memr4_q = u0_m0_wo0_wi0_r0_memr4_iq[15:0];

    // u0_m0_wo0_ca2(COUNTER,53)@14
    // low=0, high=1, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_ca2_i <= 1'd0;
        end
        else if (d_u0_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u0_m0_wo0_ca2_i <= $unsigned(u0_m0_wo0_ca2_i) + $unsigned(1'd1);
        end
    end
    assign u0_m0_wo0_ca2_q = u0_m0_wo0_ca2_i[0:0];

    // u0_m0_wo0_wi0_r0_ra0_count0_lut(LOOKUP,22)@14
    always @(u0_m0_wo0_wi0_r0_ra0_count0_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra0_count0_q)
            3'b000 : u0_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b001;
            3'b001 : u0_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b011;
            3'b010 : u0_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b011;
            3'b011 : u0_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b101;
            3'b100 : u0_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b101;
            3'b101 : u0_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b111;
            3'b110 : u0_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b111;
            3'b111 : u0_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'b001;
            default : begin
                          // unreachable
                          u0_m0_wo0_wi0_r0_ra0_count0_lut_q = 3'bxxx;
                      end
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_ra0_count0_lutreg(REG,23)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= $unsigned(3'b001);
        end
        else if (d_u0_m0_wo0_memread_q_14_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count0_lut_q);
        end
    end

    // u0_m0_wo0_wi0_r0_readReg0(DELAY,41)@14
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_readReg0_q <= u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q;
        end
    end

    // u0_m0_wo0_wi0_r0_memr0(DUALMEM,39)@14
    assign u0_m0_wo0_wi0_r0_memr0_ia = $unsigned(d_in0_m0_wi0_wo0_assign_id0_q_14_q);
    assign u0_m0_wo0_wi0_r0_memr0_aa = u0_m0_wo0_wi0_r0_wa0_q;
    assign u0_m0_wo0_wi0_r0_memr0_ab = u0_m0_wo0_wi0_r0_readReg0_q;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(16),
        .widthad_b(3),
        .numwords_b(8),
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
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_memr0_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_wi0_r0_memr0_aa),
        .data_a(u0_m0_wo0_wi0_r0_memr0_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_14_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_memr0_ab),
        .q_b(u0_m0_wo0_wi0_r0_memr0_iq),
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
    assign u0_m0_wo0_wi0_r0_memr0_q = u0_m0_wo0_wi0_r0_memr0_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr5_notEnable(LOGICAL,313)@14
    assign u0_m0_wo0_wi0_r0_delayr5_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_14_q));

    // u0_m0_wo0_wi0_r0_delayr5_nor(LOGICAL,314)@14
    assign u0_m0_wo0_wi0_r0_delayr5_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr5_notEnable_q | u0_m0_wo0_wi0_r0_delayr5_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr5_mem_last(CONSTANT,310)
    assign u0_m0_wo0_wi0_r0_delayr5_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr5_cmp(LOGICAL,311)@14
    assign u0_m0_wo0_wi0_r0_delayr5_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr5_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr5_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr5_mem_last_q == u0_m0_wo0_wi0_r0_delayr5_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr5_cmpReg(REG,312)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr5_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr5_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr5_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr5_sticky_ena(REG,315)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr5_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr5_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr5_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr5_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr5_enaAnd(LOGICAL,316)@14
    assign u0_m0_wo0_wi0_r0_delayr5_enaAnd_q = u0_m0_wo0_wi0_r0_delayr5_sticky_ena_q & d_u0_m0_wo0_compute_q_14_q;

    // u0_m0_wo0_wi0_r0_delayr5_rdcnt(COUNTER,307)@14 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr5_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr5_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr5_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr5_rdcnt_q = u0_m0_wo0_wi0_r0_delayr5_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr5_rdmux(MUX,308)@14
    assign u0_m0_wo0_wi0_r0_delayr5_rdmux_s = d_u0_m0_wo0_compute_q_14_q;
    always @(u0_m0_wo0_wi0_r0_delayr5_rdmux_s or u0_m0_wo0_wi0_r0_delayr5_wraddr_q or u0_m0_wo0_wi0_r0_delayr5_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr5_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr5_rdmux_q = u0_m0_wo0_wi0_r0_delayr5_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr5_rdmux_q = u0_m0_wo0_wi0_r0_delayr5_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr5_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_delayr5_wraddr(REG,309)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr5_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr5_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr5_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr5_mem(DUALMEM,306)@14 + 2
    assign u0_m0_wo0_wi0_r0_delayr5_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_memr4_q);
    assign u0_m0_wo0_wi0_r0_delayr5_mem_aa = u0_m0_wo0_wi0_r0_delayr5_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr5_mem_ab = u0_m0_wo0_wi0_r0_delayr5_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr5_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr5_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr5_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr5_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr5_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr5_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_14_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr5_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr5_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr5_mem_q = u0_m0_wo0_wi0_r0_delayr5_mem_iq[15:0];

    // u0_m0_wo0_aseq(SEQUENCE,65)@13 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u0_m0_wo0_aseq_c;
        if (areset)
        begin
            u0_m0_wo0_aseq_c = 4'b0000;
            u0_m0_wo0_aseq_q <= $unsigned(1'b0);
            u0_m0_wo0_aseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m0_wo0_compute_q_13_q == 1'b1)
            begin
                if (u0_m0_wo0_aseq_c == 4'b0000)
                begin
                    u0_m0_wo0_aseq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_aseq_eq <= 1'b0;
                end
                if (u0_m0_wo0_aseq_eq == 1'b1)
                begin
                    u0_m0_wo0_aseq_c = $signed(u0_m0_wo0_aseq_c) + $signed(4'd1);
                end
                else
                begin
                    u0_m0_wo0_aseq_c = $signed(u0_m0_wo0_aseq_c) - $signed(4'd1);
                end
                u0_m0_wo0_aseq_q <= $unsigned(u0_m0_wo0_aseq_c[3:3]);
            end
        end
    end

    // d_u0_m0_wo0_compute_q_17(DELAY,276)@14 + 3
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_compute_q_17_delay_0 <= $unsigned(d_u0_m0_wo0_compute_q_14_q);
            d_u0_m0_wo0_compute_q_17_delay_1 <= d_u0_m0_wo0_compute_q_17_delay_0;
            d_u0_m0_wo0_compute_q_17_q <= d_u0_m0_wo0_compute_q_17_delay_1;
        end
    end

    // d_u0_m0_wo0_compute_q_14(DELAY,275)@13 + 1
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

    // u0_m0_wo0_cma0(CHAINMULTADD,64)@14 + 5
    assign u0_m0_wo0_cma0_reset = areset;
    assign u0_m0_wo0_cma0_ena0 = d_u0_m0_wo0_compute_q_14_q[0] | u0_m0_wo0_cma0_reset;
    assign u0_m0_wo0_cma0_ena1 = d_u0_m0_wo0_compute_q_17_q[0] | u0_m0_wo0_cma0_reset;
    assign u0_m0_wo0_cma0_ena2 = 1'b1;

    assign u0_m0_wo0_cma0_a0 = $unsigned(u0_m0_wo0_wi0_r0_delayr5_mem_q);
    assign u0_m0_wo0_cma0_b0 = $unsigned(u0_m0_wo0_wi0_r0_memr0_q);
    assign u0_m0_wo0_cma0_c0 = {2'b00, u0_m0_wo0_ca2_q[0:0]};
    assign u0_m0_wo0_cma0_a1 = $unsigned(u0_m0_wo0_wi0_r0_memr4_q);
    assign u0_m0_wo0_cma0_b1 = $unsigned(u0_m0_wo0_wi0_r0_delayr1_q);
    assign u0_m0_wo0_cma0_c1 = {2'b00, u0_m0_wo0_ca2_q[0:0]};
    assign u0_m0_wo0_cma0_a2 = $unsigned(u0_m0_wo0_cma0_mux_2_q);
    assign u0_m0_wo0_cma0_b2 = $unsigned(u0_m0_wo0_wi0_r0_memr2_q);
    assign u0_m0_wo0_cma0_c2 = {2'b00, u0_m0_wo0_ca2_q[0:0]};
    assign u0_m0_wo0_cma0_a3 = 16'b0;
    assign u0_m0_wo0_cma0_b3 = 16'b0;
    assign u0_m0_wo0_cma0_c3 = 3'b0;
    assign u0_m0_wo0_cma0_anl[0] = ~ u0_m0_wo0_aseq_q[0];
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
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
        .coef_b_0(16383),
        .coef_b_1(10043),
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
        .ay(u0_m0_wo0_cma0_a3),
        .by(u0_m0_wo0_cma0_a2),
        .az(u0_m0_wo0_cma0_b3),
        .bz(u0_m0_wo0_cma0_b2),
        .coefsela(u0_m0_wo0_cma0_c3),
        .coefselb(u0_m0_wo0_cma0_c2),
        .chainout(u0_m0_wo0_cma0_s2),
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
        .scanout(),
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
        .coef_a_0(772),
        .coef_a_1(-2462),
        .coef_b_0(-188),
        .coef_b_1(25),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .accumulate_clken("0"),
        .accum_pipeline_clken("2"),
        .accum_2nd_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(37)
    ) u0_m0_wo0_cma0_DSP0 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a1),
        .by(u0_m0_wo0_cma0_a0),
        .az(u0_m0_wo0_cma0_b1),
        .bz(u0_m0_wo0_cma0_b0),
        .coefsela(u0_m0_wo0_cma0_c1),
        .coefselb(u0_m0_wo0_cma0_c0),
        .accumulate(u0_m0_wo0_cma0_anl[0]),
        .chainin(u0_m0_wo0_cma0_s2),
        .resulta(u0_m0_wo0_cma0_s0),
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
        .scanout(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(37), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_m0_wo0_cma0_delay0 ( .xin(u0_m0_wo0_cma0_s0), .xout(u0_m0_wo0_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_m0_wo0_cma0_q = $unsigned(u0_m0_wo0_cma0_qq0[36:0]);

    // d_u0_m0_wo0_compute_q_18(DELAY,277)@17 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m0_wo0_compute_q_18_q <= '0;
        end
        else
        begin
            d_u0_m0_wo0_compute_q_18_q <= $unsigned(d_u0_m0_wo0_compute_q_17_q);
        end
    end

    // u0_m0_wo0_oseq(SEQUENCE,67)@17 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u0_m0_wo0_oseq_c;
        if (areset)
        begin
            u0_m0_wo0_oseq_c = 4'b0001;
            u0_m0_wo0_oseq_q <= $unsigned(1'b0);
            u0_m0_wo0_oseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m0_wo0_compute_q_17_q == 1'b1)
            begin
                if (u0_m0_wo0_oseq_c == 4'b0000)
                begin
                    u0_m0_wo0_oseq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_oseq_eq <= 1'b0;
                end
                if (u0_m0_wo0_oseq_eq == 1'b1)
                begin
                    u0_m0_wo0_oseq_c = $signed(u0_m0_wo0_oseq_c) + $signed(4'd1);
                end
                else
                begin
                    u0_m0_wo0_oseq_c = $signed(u0_m0_wo0_oseq_c) - $signed(4'd1);
                end
                u0_m0_wo0_oseq_q <= $unsigned(u0_m0_wo0_oseq_c[3:3]);
            end
        end
    end

    // u0_m0_wo0_oseq_gated(LOGICAL,68)@18
    assign u0_m0_wo0_oseq_gated_q = u0_m0_wo0_oseq_q & d_u0_m0_wo0_compute_q_18_q;

    // u0_m0_wo0_oseq_gated_reg(REG,69)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_oseq_gated_reg_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m0_wo0_oseq_gated_reg_q <= $unsigned(u0_m0_wo0_oseq_gated_q);
        end
    end

    // out0_m0_wo0_data_selector(SELECTOR,251)@19 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            out0_m0_wo0_data_selector_q <= 37'b0;
            out0_m0_wo0_data_selector_v <= 1'b0;
        end
        else
        begin
            out0_m0_wo0_data_selector_q <= $unsigned(u1_m0_wo0_cma0_q);
            out0_m0_wo0_data_selector_v <= $unsigned(1'b0);
            if (u1_m0_wo0_oseq_gated_reg_q == 1'b1)
            begin
                out0_m0_wo0_data_selector_q <= $unsigned(u1_m0_wo0_cma0_q);
                out0_m0_wo0_data_selector_v <= $unsigned(1'b1);
            end
            if (u0_m0_wo0_oseq_gated_reg_q == 1'b1)
            begin
                out0_m0_wo0_data_selector_q <= $unsigned(u0_m0_wo0_cma0_q);
                out0_m0_wo0_data_selector_v <= $unsigned(1'b1);
            end
        end
    end

    // d_out0_m0_wo0_data_selector_q_21(DELAY,304)@20 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_out0_m0_wo0_data_selector_q_21_q <= $unsigned(out0_m0_wo0_data_selector_q);
        end
    end

    // outchan(COUNTER,257)@20 + 1
    // low=0, high=1, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            outchan_i <= 1'd1;
        end
        else if (out0_m0_wo0_data_selector_v == 1'b1)
        begin
            outchan_i <= $unsigned(outchan_i) + $unsigned(1'd1);
        end
    end
    assign outchan_q = {1'b0, outchan_i[0:0]};

    // d_out0_m0_wo0_data_selector_v_21(DELAY,305)@20 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_out0_m0_wo0_data_selector_v_21_q <= '0;
        end
        else
        begin
            d_out0_m0_wo0_data_selector_v_21_q <= $unsigned(out0_m0_wo0_data_selector_v);
        end
    end

    // xOut(PORTOUT,258)@21 + 1
    assign xOut_v = d_out0_m0_wo0_data_selector_v_21_q;
    assign xOut_c = {6'b000000, outchan_q};
    assign xOut_0 = d_out0_m0_wo0_data_selector_q_21_q;
    assign xOut_1 = out1_m0_wo0_data_selector_q;

endmodule
