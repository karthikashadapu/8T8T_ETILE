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

// SystemVerilog created from ddc_model_DUT_DUT_DDC_l1_x_HB1_HB1_im
// SystemVerilog created on Thu Jan  9 15:36:33 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ddc_model_DUT_DUT_DDC_l1_x_HB1_HB1_im (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [15:0] xIn_0,
    input wire [15:0] xIn_1,
    output wire [0:0] xOut_v,
    output wire [7:0] xOut_c,
    output wire [38:0] xOut_0,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_11_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_14_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_14_delay_0;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_14_delay_1;
    reg [0:0] u0_m0_wo0_inputframe_seq_q;
    reg u0_m0_wo0_inputframe_seq_eq;
    reg [2:0] u0_m0_wo0_run_count;
    wire [0:0] u0_m0_wo0_run_preEnaQ;
    reg [0:0] u0_m0_wo0_run_q;
    wire [0:0] u0_m0_wo0_run_out;
    reg [0:0] u0_m0_wo0_run_enableQ;
    wire [2:0] u0_m0_wo0_run_ctrl;
    reg [0:0] u0_m0_wo0_memread_q;
    reg [0:0] d_u0_m0_wo0_memread_q_14_q;
    reg [0:0] u0_m0_wo0_compute_q;
    reg [0:0] u0_m0_wo0_compute_delay_0;
    reg [0:0] u0_m0_wo0_compute_delay_1;
    reg [0:0] d_u0_m0_wo0_compute_q_14_q;
    reg [0:0] d_u0_m0_wo0_compute_q_17_q;
    reg [0:0] d_u0_m0_wo0_compute_q_17_delay_0;
    reg [0:0] d_u0_m0_wo0_compute_q_17_delay_1;
    reg [0:0] d_u0_m0_wo0_compute_q_18_q;
    wire [1:0] u0_m0_wo0_wi0_r0_ra0_count0_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_ra0_count0_i;
    reg [1:0] d_u0_m0_wo0_wi0_r0_ra0_count0_q_14_q;
    reg [3:0] u0_m0_wo0_wi0_r0_ra0_count1_lutreg_q;
    wire [0:0] u0_m0_wo0_wi0_r0_ra0_count1_inner_q;
    (* preserve_syn_only *) reg signed [0:0] u0_m0_wo0_wi0_r0_ra0_count1_inner_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_ra0_count1_inner_eq;
    wire [1:0] u0_m0_wo0_wi0_r0_ra0_count1_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_ra0_count1_i;
    wire [4:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_a;
    wire [4:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_b;
    logic [4:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_o;
    wire [4:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_q;
    wire [1:0] u0_m0_wo0_wi0_r0_ra9_count0_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_ra9_count0_i;
    reg [7:0] u0_m0_wo0_wi0_r0_ra9_count1_lutreg_q;
    wire [0:0] u0_m0_wo0_wi0_r0_ra9_count1_inner_q;
    (* preserve_syn_only *) reg signed [0:0] u0_m0_wo0_wi0_r0_ra9_count1_inner_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_ra9_count1_inner_eq;
    reg [0:0] d_u0_m0_wo0_wi0_r0_ra9_count1_run_q_14_q;
    wire [5:0] u0_m0_wo0_wi0_r0_ra9_count1_q;
    (* preserve_syn_only *) reg [5:0] u0_m0_wo0_wi0_r0_ra9_count1_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_ra9_count1_eq;
    wire [8:0] u0_m0_wo0_wi0_r0_ra9_add_0_0_a;
    wire [8:0] u0_m0_wo0_wi0_r0_ra9_add_0_0_b;
    logic [8:0] u0_m0_wo0_wi0_r0_ra9_add_0_0_o;
    wire [8:0] u0_m0_wo0_wi0_r0_ra9_add_0_0_q;
    wire [3:0] u0_m0_wo0_wi0_r0_ra11_count1_q;
    (* preserve_syn_only *) reg [2:0] u0_m0_wo0_wi0_r0_ra11_count1_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_ra11_count1_eq;
    reg [0:0] u0_m0_wo0_wi0_r0_we11_seq_q;
    reg u0_m0_wo0_wi0_r0_we11_seq_eq;
    wire [2:0] u0_m0_wo0_wi0_r0_wa0_q;
    (* preserve_syn_only *) reg [2:0] u0_m0_wo0_wi0_r0_wa0_i;
    wire [6:0] u0_m0_wo0_wi0_r0_wa9_q;
    (* preserve_syn_only *) reg [6:0] u0_m0_wo0_wi0_r0_wa9_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_wa9_eq;
    wire [2:0] u0_m0_wo0_wi0_r0_wa11_q;
    (* preserve_syn_only *) reg [2:0] u0_m0_wo0_wi0_r0_wa11_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_wa11_eq;
    wire u0_m0_wo0_wi0_r0_memr0_reset0;
    wire [15:0] u0_m0_wo0_wi0_r0_memr0_ia;
    wire [2:0] u0_m0_wo0_wi0_r0_memr0_aa;
    wire [2:0] u0_m0_wo0_wi0_r0_memr0_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_memr0_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_memr0_q;
    reg [2:0] u0_m0_wo0_wi0_r0_readReg0_q;
    wire u0_m0_wo0_wi0_r0_memr9_reset0;
    wire [15:0] u0_m0_wo0_wi0_r0_memr9_ia;
    wire [6:0] u0_m0_wo0_wi0_r0_memr9_aa;
    wire [6:0] u0_m0_wo0_wi0_r0_memr9_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_memr9_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_memr9_q;
    reg [8:0] u0_m0_wo0_wi0_r0_readReg9_q;
    wire u0_m0_wo0_wi0_r0_memr11_reset0;
    wire [15:0] u0_m0_wo0_wi0_r0_memr11_ia;
    wire [2:0] u0_m0_wo0_wi0_r0_memr11_aa;
    wire [2:0] u0_m0_wo0_wi0_r0_memr11_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_memr11_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_memr11_q;
    reg [4:0] u0_m0_wo0_wi0_r0_readReg11_q;
    reg [0:0] u0_m0_wo0_ca8_1_q;
    reg [0:0] u0_m0_wo0_ca9_1_q;
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
    wire [38:0] u0_m0_wo0_cma0_s0;
    wire [43:0] u0_m0_wo0_cma0_s2;
    wire [43:0] u0_m0_wo0_cma0_s4;
    wire [43:0] u0_m0_wo0_cma0_s6;
    wire [43:0] u0_m0_wo0_cma0_s8;
    wire [0:0] u0_m0_wo0_cma0_anl;
    wire [38:0] u0_m0_wo0_cma0_qq0;
    reg [38:0] u0_m0_wo0_cma0_q;
    wire u0_m0_wo0_cma0_ena0;
    wire u0_m0_wo0_cma0_ena1;
    wire u0_m0_wo0_cma0_ena2;
    reg [0:0] u0_m0_wo0_aseq_q;
    reg u0_m0_wo0_aseq_eq;
    reg [0:0] u0_m0_wo0_oseq_q;
    reg u0_m0_wo0_oseq_eq;
    reg [0:0] u0_m0_wo0_oseq_gated_reg_q;
    reg [2:0] u1_m0_wo0_run_count;
    wire [0:0] u1_m0_wo0_run_preEnaQ;
    reg [0:0] u1_m0_wo0_run_q;
    wire [0:0] u1_m0_wo0_run_out;
    reg [0:0] u1_m0_wo0_run_enableQ;
    wire [2:0] u1_m0_wo0_run_ctrl;
    reg [0:0] u1_m0_wo0_memread_q;
    reg [0:0] u1_m0_wo0_memread_delay_0;
    reg [0:0] u1_m0_wo0_memread_delay_1;
    reg [0:0] d_u1_m0_wo0_memread_q_14_q;
    reg [0:0] u1_m0_wo0_compute_q;
    reg [0:0] u1_m0_wo0_compute_delay_0;
    reg [0:0] u1_m0_wo0_compute_delay_1;
    reg [0:0] d_u1_m0_wo0_compute_q_14_q;
    reg [0:0] d_u1_m0_wo0_compute_q_17_q;
    reg [0:0] d_u1_m0_wo0_compute_q_17_delay_0;
    reg [0:0] d_u1_m0_wo0_compute_q_17_delay_1;
    reg [0:0] d_u1_m0_wo0_compute_q_18_q;
    wire [1:0] u1_m0_wo0_wi0_r0_ra0_count0_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_ra0_count0_i;
    reg [1:0] d_u1_m0_wo0_wi0_r0_ra0_count0_q_14_q;
    reg [4:0] u1_m0_wo0_wi0_r0_ra0_count1_lutreg_q;
    wire [0:0] u1_m0_wo0_wi0_r0_ra0_count1_inner_q;
    (* preserve_syn_only *) reg signed [0:0] u1_m0_wo0_wi0_r0_ra0_count1_inner_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_ra0_count1_inner_eq;
    wire [2:0] u1_m0_wo0_wi0_r0_ra0_count1_q;
    (* preserve_syn_only *) reg [2:0] u1_m0_wo0_wi0_r0_ra0_count1_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_ra0_count1_eq;
    wire [5:0] u1_m0_wo0_wi0_r0_ra0_add_0_0_a;
    wire [5:0] u1_m0_wo0_wi0_r0_ra0_add_0_0_b;
    logic [5:0] u1_m0_wo0_wi0_r0_ra0_add_0_0_o;
    wire [5:0] u1_m0_wo0_wi0_r0_ra0_add_0_0_q;
    wire [1:0] u1_m0_wo0_wi0_r0_ra9_count0_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_ra9_count0_i;
    reg [7:0] u1_m0_wo0_wi0_r0_ra9_count1_lutreg_q;
    wire [0:0] u1_m0_wo0_wi0_r0_ra9_count1_inner_q;
    (* preserve_syn_only *) reg signed [0:0] u1_m0_wo0_wi0_r0_ra9_count1_inner_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_ra9_count1_inner_eq;
    reg [0:0] d_u1_m0_wo0_wi0_r0_ra9_count1_run_q_14_q;
    wire [5:0] u1_m0_wo0_wi0_r0_ra9_count1_q;
    (* preserve_syn_only *) reg [5:0] u1_m0_wo0_wi0_r0_ra9_count1_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_ra9_count1_eq;
    wire [8:0] u1_m0_wo0_wi0_r0_ra9_add_0_0_a;
    wire [8:0] u1_m0_wo0_wi0_r0_ra9_add_0_0_b;
    logic [8:0] u1_m0_wo0_wi0_r0_ra9_add_0_0_o;
    wire [8:0] u1_m0_wo0_wi0_r0_ra9_add_0_0_q;
    wire [3:0] u1_m0_wo0_wi0_r0_ra11_count1_q;
    (* preserve_syn_only *) reg [2:0] u1_m0_wo0_wi0_r0_ra11_count1_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_ra11_count1_eq;
    reg [0:0] u1_m0_wo0_wi0_r0_we11_seq_q;
    reg u1_m0_wo0_wi0_r0_we11_seq_eq;
    wire [3:0] u1_m0_wo0_wi0_r0_wa0_q;
    (* preserve_syn_only *) reg [3:0] u1_m0_wo0_wi0_r0_wa0_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_wa0_eq;
    wire [6:0] u1_m0_wo0_wi0_r0_wa9_q;
    (* preserve_syn_only *) reg [6:0] u1_m0_wo0_wi0_r0_wa9_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_wa9_eq;
    wire [2:0] u1_m0_wo0_wi0_r0_wa11_q;
    (* preserve_syn_only *) reg [2:0] u1_m0_wo0_wi0_r0_wa11_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_wa11_eq;
    wire u1_m0_wo0_wi0_r0_memr0_reset0;
    wire [15:0] u1_m0_wo0_wi0_r0_memr0_ia;
    wire [3:0] u1_m0_wo0_wi0_r0_memr0_aa;
    wire [3:0] u1_m0_wo0_wi0_r0_memr0_ab;
    wire [15:0] u1_m0_wo0_wi0_r0_memr0_iq;
    wire [15:0] u1_m0_wo0_wi0_r0_memr0_q;
    reg [5:0] u1_m0_wo0_wi0_r0_readReg0_q;
    wire u1_m0_wo0_wi0_r0_memr9_reset0;
    wire [15:0] u1_m0_wo0_wi0_r0_memr9_ia;
    wire [6:0] u1_m0_wo0_wi0_r0_memr9_aa;
    wire [6:0] u1_m0_wo0_wi0_r0_memr9_ab;
    wire [15:0] u1_m0_wo0_wi0_r0_memr9_iq;
    wire [15:0] u1_m0_wo0_wi0_r0_memr9_q;
    reg [8:0] u1_m0_wo0_wi0_r0_readReg9_q;
    wire u1_m0_wo0_wi0_r0_memr11_reset0;
    wire [15:0] u1_m0_wo0_wi0_r0_memr11_ia;
    wire [2:0] u1_m0_wo0_wi0_r0_memr11_aa;
    wire [2:0] u1_m0_wo0_wi0_r0_memr11_ab;
    wire [15:0] u1_m0_wo0_wi0_r0_memr11_iq;
    wire [15:0] u1_m0_wo0_wi0_r0_memr11_q;
    reg [4:0] u1_m0_wo0_wi0_r0_readReg11_q;
    reg [0:0] u1_m0_wo0_ca8_1_q;
    reg [0:0] u1_m0_wo0_ca9_1_q;
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
    wire [38:0] u1_m0_wo0_cma0_s0;
    wire [43:0] u1_m0_wo0_cma0_s2;
    wire [43:0] u1_m0_wo0_cma0_s4;
    wire [43:0] u1_m0_wo0_cma0_s6;
    wire [43:0] u1_m0_wo0_cma0_s8;
    wire [0:0] u1_m0_wo0_cma0_anl;
    wire [38:0] u1_m0_wo0_cma0_qq0;
    reg [38:0] u1_m0_wo0_cma0_q;
    wire u1_m0_wo0_cma0_ena0;
    wire u1_m0_wo0_cma0_ena1;
    wire u1_m0_wo0_cma0_ena2;
    reg [0:0] u1_m0_wo0_aseq_q;
    reg u1_m0_wo0_aseq_eq;
    reg [0:0] u1_m0_wo0_oseq_q;
    reg u1_m0_wo0_oseq_eq;
    reg [0:0] u1_m0_wo0_oseq_gated_reg_q;
    reg [38:0] out0_m0_wo0_data_selector_q;
    reg [0:0] out0_m0_wo0_data_selector_v;
    reg [0:0] d_out0_m0_wo0_data_selector_v_21_q;
    reg [38:0] d_out0_m0_wo0_data_selector_q_21_q;
    wire [2:0] outchan_q;
    (* preserve_syn_only *) reg [1:0] outchan_i;
    wire u0_m0_wo0_wi0_r0_delayr1_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr1_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr1_mem_ia;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr1_mem_aa;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr1_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr1_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr1_mem_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr1_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] u0_m0_wo0_wi0_r0_delayr1_rdcnt_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq;
    reg [2:0] u0_m0_wo0_wi0_r0_delayr1_wraddr_q;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr1_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr1_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr5_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr5_mem_ia;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr5_mem_aa;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr5_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr5_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr5_mem_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr5_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] u0_m0_wo0_wi0_r0_delayr5_rdcnt_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_delayr5_rdcnt_eq;
    reg [2:0] u0_m0_wo0_wi0_r0_delayr5_wraddr_q;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr5_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr5_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr5_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr12_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr12_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr12_mem_ia;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr12_mem_aa;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr12_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr12_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr12_mem_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr12_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] u0_m0_wo0_wi0_r0_delayr12_rdcnt_i;
    reg [2:0] u0_m0_wo0_wi0_r0_delayr12_wraddr_q;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr12_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr12_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr12_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr16_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr16_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr16_mem_ia;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr16_mem_aa;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr16_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr16_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr16_mem_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr16_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] u0_m0_wo0_wi0_r0_delayr16_rdcnt_i;
    reg [2:0] u0_m0_wo0_wi0_r0_delayr16_wraddr_q;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr16_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr16_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q;
    wire u1_m0_wo0_wi0_r0_delayr1_mem_reset0;
    wire u1_m0_wo0_wi0_r0_delayr1_mem_ena_OrRstB;
    wire [63:0] u1_m0_wo0_wi0_r0_delayr1_mem_ia;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr1_mem_aa;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr1_mem_ab;
    wire [63:0] u1_m0_wo0_wi0_r0_delayr1_mem_iq;
    wire [63:0] u1_m0_wo0_wi0_r0_delayr1_mem_q;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr1_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] u1_m0_wo0_wi0_r0_delayr1_rdcnt_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_delayr1_rdcnt_eq;
    reg [2:0] u1_m0_wo0_wi0_r0_delayr1_wraddr_q;
    wire [3:0] u1_m0_wo0_wi0_r0_delayr1_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr1_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr1_sticky_ena_q;
    wire u1_m0_wo0_wi0_r0_delayr5_mem_reset0;
    wire u1_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB;
    wire [63:0] u1_m0_wo0_wi0_r0_delayr5_mem_ia;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr5_mem_aa;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr5_mem_ab;
    wire [63:0] u1_m0_wo0_wi0_r0_delayr5_mem_iq;
    wire [63:0] u1_m0_wo0_wi0_r0_delayr5_mem_q;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr5_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] u1_m0_wo0_wi0_r0_delayr5_rdcnt_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_delayr5_rdcnt_eq;
    reg [2:0] u1_m0_wo0_wi0_r0_delayr5_wraddr_q;
    wire [3:0] u1_m0_wo0_wi0_r0_delayr5_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr5_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr5_sticky_ena_q;
    wire u1_m0_wo0_wi0_r0_delayr12_mem_reset0;
    wire u1_m0_wo0_wi0_r0_delayr12_mem_ena_OrRstB;
    wire [63:0] u1_m0_wo0_wi0_r0_delayr12_mem_ia;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr12_mem_aa;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr12_mem_ab;
    wire [63:0] u1_m0_wo0_wi0_r0_delayr12_mem_iq;
    wire [63:0] u1_m0_wo0_wi0_r0_delayr12_mem_q;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr12_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] u1_m0_wo0_wi0_r0_delayr12_rdcnt_i;
    reg [2:0] u1_m0_wo0_wi0_r0_delayr12_wraddr_q;
    wire [3:0] u1_m0_wo0_wi0_r0_delayr12_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr12_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr12_sticky_ena_q;
    wire u1_m0_wo0_wi0_r0_delayr16_mem_reset0;
    wire u1_m0_wo0_wi0_r0_delayr16_mem_ena_OrRstB;
    wire [63:0] u1_m0_wo0_wi0_r0_delayr16_mem_ia;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr16_mem_aa;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr16_mem_ab;
    wire [63:0] u1_m0_wo0_wi0_r0_delayr16_mem_iq;
    wire [63:0] u1_m0_wo0_wi0_r0_delayr16_mem_q;
    wire [2:0] u1_m0_wo0_wi0_r0_delayr16_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] u1_m0_wo0_wi0_r0_delayr16_rdcnt_i;
    reg [2:0] u1_m0_wo0_wi0_r0_delayr16_wraddr_q;
    wire [3:0] u1_m0_wo0_wi0_r0_delayr16_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr16_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr16_sticky_ena_q;
    wire d_xIn_0_14_mem_reset0;
    wire d_xIn_0_14_mem_ena_OrRstB;
    wire [15:0] d_xIn_0_14_mem_ia;
    wire [1:0] d_xIn_0_14_mem_aa;
    wire [1:0] d_xIn_0_14_mem_ab;
    wire [15:0] d_xIn_0_14_mem_iq;
    wire [15:0] d_xIn_0_14_mem_q;
    wire [1:0] d_xIn_0_14_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] d_xIn_0_14_rdcnt_i;
    (* preserve_syn_only *) reg d_xIn_0_14_rdcnt_eq;
    reg [1:0] d_xIn_0_14_wraddr_q;
    wire [1:0] d_xIn_0_14_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_xIn_0_14_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_xIn_0_14_sticky_ena_q;
    wire d_xIn_1_14_mem_reset0;
    wire d_xIn_1_14_mem_ena_OrRstB;
    wire [15:0] d_xIn_1_14_mem_ia;
    wire [1:0] d_xIn_1_14_mem_aa;
    wire [1:0] d_xIn_1_14_mem_ab;
    wire [15:0] d_xIn_1_14_mem_iq;
    wire [15:0] d_xIn_1_14_mem_q;
    wire [1:0] d_xIn_1_14_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] d_xIn_1_14_rdcnt_i;
    (* preserve_syn_only *) reg d_xIn_1_14_rdcnt_eq;
    reg [1:0] d_xIn_1_14_wraddr_q;
    wire [1:0] d_xIn_1_14_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_xIn_1_14_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_xIn_1_14_sticky_ena_q;
    wire [0:0] u0_m0_wo0_inputframe_q;
    wire [0:0] u0_m0_wo0_wi0_r0_ra0_count1_run_q;
    wire [0:0] u0_m0_wo0_wi0_r0_ra9_count1_run_q;
    wire [0:0] u0_m0_wo0_oseq_gated_q;
    wire [0:0] u1_m0_wo0_wi0_r0_ra0_count1_run_q;
    wire [0:0] u1_m0_wo0_wi0_r0_ra9_count1_run_q;
    wire [0:0] u1_m0_wo0_oseq_gated_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr1_rdmux_s;
    reg [2:0] u0_m0_wo0_wi0_r0_delayr1_rdmux_q;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr1_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr1_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr1_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr1_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr1_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr5_rdmux_s;
    reg [2:0] u0_m0_wo0_wi0_r0_delayr5_rdmux_q;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr5_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr5_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr5_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr5_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr5_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr12_rdmux_s;
    reg [2:0] u0_m0_wo0_wi0_r0_delayr12_rdmux_q;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr12_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr12_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr12_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr12_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr12_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr16_rdmux_s;
    reg [2:0] u0_m0_wo0_wi0_r0_delayr16_rdmux_q;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr16_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr16_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr16_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr16_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr16_enaAnd_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr1_rdmux_s;
    reg [2:0] u1_m0_wo0_wi0_r0_delayr1_rdmux_q;
    wire [3:0] u1_m0_wo0_wi0_r0_delayr1_cmp_b;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr1_cmp_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr1_notEnable_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr1_nor_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr1_enaAnd_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr5_rdmux_s;
    reg [2:0] u1_m0_wo0_wi0_r0_delayr5_rdmux_q;
    wire [3:0] u1_m0_wo0_wi0_r0_delayr5_cmp_b;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr5_cmp_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr5_notEnable_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr5_nor_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr5_enaAnd_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr12_rdmux_s;
    reg [2:0] u1_m0_wo0_wi0_r0_delayr12_rdmux_q;
    wire [3:0] u1_m0_wo0_wi0_r0_delayr12_cmp_b;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr12_cmp_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr12_notEnable_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr12_nor_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr12_enaAnd_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr16_rdmux_s;
    reg [2:0] u1_m0_wo0_wi0_r0_delayr16_rdmux_q;
    wire [3:0] u1_m0_wo0_wi0_r0_delayr16_cmp_b;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr16_cmp_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr16_notEnable_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr16_nor_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr16_enaAnd_q;
    wire [0:0] d_xIn_0_14_cmp_q;
    wire [0:0] d_xIn_0_14_notEnable_q;
    wire [0:0] d_xIn_0_14_nor_q;
    wire [0:0] d_xIn_0_14_enaAnd_q;
    wire [0:0] d_xIn_1_14_cmp_q;
    wire [0:0] d_xIn_1_14_notEnable_q;
    wire [0:0] d_xIn_1_14_nor_q;
    wire [0:0] d_xIn_1_14_enaAnd_q;
    wire [4:0] u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_a_in;
    wire [0:0] u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_a_b;
    reg [3:0] u0_m0_wo0_wi0_r0_ra0_count1_lut_q;
    wire [2:0] u0_m0_wo0_wi0_r0_ra0_resize_in;
    wire [2:0] u0_m0_wo0_wi0_r0_ra0_resize_b;
    reg [7:0] u0_m0_wo0_wi0_r0_ra9_count1_lut_q;
    wire [4:0] u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_b_in;
    wire [1:0] u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_b_b;
    reg [0:0] u0_m0_wo0_ca8_1_lut_q;
    wire [4:0] u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_a_in;
    wire [0:0] u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_a_b;
    reg [4:0] u1_m0_wo0_wi0_r0_ra0_count1_lut_q;
    reg [7:0] u1_m0_wo0_wi0_r0_ra9_count1_lut_q;
    wire [4:0] u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_b_in;
    wire [1:0] u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_b_b;
    reg [0:0] u1_m0_wo0_ca8_1_lut_q;
    wire [15:0] u0_m0_wo0_wi0_r0_split1_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split1_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split1_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split1_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split5_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split5_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split5_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split5_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split12_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split12_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split12_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split12_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split16_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split16_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split16_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split16_e;
    wire [15:0] u1_m0_wo0_wi0_r0_split1_b;
    wire [15:0] u1_m0_wo0_wi0_r0_split1_c;
    wire [15:0] u1_m0_wo0_wi0_r0_split1_d;
    wire [15:0] u1_m0_wo0_wi0_r0_split1_e;
    wire [15:0] u1_m0_wo0_wi0_r0_split5_b;
    wire [15:0] u1_m0_wo0_wi0_r0_split5_c;
    wire [15:0] u1_m0_wo0_wi0_r0_split5_d;
    wire [15:0] u1_m0_wo0_wi0_r0_split5_e;
    wire [15:0] u1_m0_wo0_wi0_r0_split12_b;
    wire [15:0] u1_m0_wo0_wi0_r0_split12_c;
    wire [15:0] u1_m0_wo0_wi0_r0_split12_d;
    wire [15:0] u1_m0_wo0_wi0_r0_split12_e;
    wire [15:0] u1_m0_wo0_wi0_r0_split16_b;
    wire [15:0] u1_m0_wo0_wi0_r0_split16_c;
    wire [15:0] u1_m0_wo0_wi0_r0_split16_d;
    wire [15:0] u1_m0_wo0_wi0_r0_split16_e;
    wire [4:0] u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_join_q;
    wire [4:0] u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_join_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join1_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join5_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join12_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join16_q;
    wire [63:0] u1_m0_wo0_wi0_r0_join1_q;
    wire [63:0] u1_m0_wo0_wi0_r0_join5_q;
    wire [63:0] u1_m0_wo0_wi0_r0_join12_q;
    wire [63:0] u1_m0_wo0_wi0_r0_join16_q;

    import ddc_model_DUT_safe_path_ver::safe_path_ver;

    // d_in0_m0_wi0_wo0_assign_id1_q_11(DELAY,216)@10 + 1
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

    // u0_m0_wo0_inputframe_seq(SEQUENCE,14)@10 + 1
    always @ (posedge clk)
    begin
        reg [3:0] u0_m0_wo0_inputframe_seq_c;
        if (areset)
        begin
            u0_m0_wo0_inputframe_seq_c = 4'b0000;
            u0_m0_wo0_inputframe_seq_q <= $unsigned(1'b0);
            u0_m0_wo0_inputframe_seq_eq <= 1'b0;
        end
        else
        begin
            if (xIn_v == 1'b1)
            begin
                if (u0_m0_wo0_inputframe_seq_c == 4'b0000)
                begin
                    u0_m0_wo0_inputframe_seq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_inputframe_seq_eq <= 1'b0;
                end
                if (u0_m0_wo0_inputframe_seq_eq == 1'b1)
                begin
                    u0_m0_wo0_inputframe_seq_c = $signed(u0_m0_wo0_inputframe_seq_c) + $signed(4'd1);
                end
                else
                begin
                    u0_m0_wo0_inputframe_seq_c = $signed(u0_m0_wo0_inputframe_seq_c) - $signed(4'd1);
                end
                u0_m0_wo0_inputframe_seq_q <= $unsigned(u0_m0_wo0_inputframe_seq_c[3:3]);
            end
        end
    end

    // u0_m0_wo0_inputframe(LOGICAL,15)@11
    assign u0_m0_wo0_inputframe_q = u0_m0_wo0_inputframe_seq_q & d_in0_m0_wi0_wo0_assign_id1_q_11_q;

    // u1_m0_wo0_run(ENABLEGENERATOR,110)@11 + 2
    assign u1_m0_wo0_run_ctrl = { u1_m0_wo0_run_out, u0_m0_wo0_inputframe_q, u1_m0_wo0_run_enableQ };
    always @ (posedge clk)
    begin
        reg [2:0] u1_m0_wo0_run_enable_c;
        reg [2:0] u1_m0_wo0_run_inc;
        if (areset)
        begin
            u1_m0_wo0_run_q <= $unsigned(1'b0);
            u1_m0_wo0_run_enable_c = 3'd2;
            u1_m0_wo0_run_enableQ <= $unsigned(1'b0);
            u1_m0_wo0_run_count <= $unsigned(3'b000);
            u1_m0_wo0_run_inc = 3'b0;
        end
        else
        begin
            if (u1_m0_wo0_run_out == 1'b1)
            begin
                if (u1_m0_wo0_run_enable_c[2] == 1'b1)
                begin
                    u1_m0_wo0_run_enable_c = $signed(u1_m0_wo0_run_enable_c) - $signed(-3'd3);
                end
                else
                begin
                    u1_m0_wo0_run_enable_c = $signed(u1_m0_wo0_run_enable_c) + $signed(-3'd1);
                end
                u1_m0_wo0_run_enableQ <= $unsigned(u1_m0_wo0_run_enable_c[2:2]);
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

    // u1_m0_wo0_memread(DELAY,111)@13
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
            u1_m0_wo0_memread_delay_1 <= u1_m0_wo0_memread_delay_0;
            u1_m0_wo0_memread_q <= u1_m0_wo0_memread_delay_1;
        end
    end

    // u1_m0_wo0_wi0_r0_ra9_count1_inner(COUNTER,127)@13
    // low=-1, high=0, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra9_count1_inner_i <= 1'd0;
            u1_m0_wo0_wi0_r0_ra9_count1_inner_eq <= 1'b1;
        end
        else if (u1_m0_wo0_memread_q == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_ra9_count1_inner_eq == 1'b0)
            begin
                u1_m0_wo0_wi0_r0_ra9_count1_inner_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_ra9_count1_inner_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_ra9_count1_inner_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_ra9_count1_inner_i <= $signed(u1_m0_wo0_wi0_r0_ra9_count1_inner_i) + $signed(-1'd1);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_ra9_count1_inner_i <= $signed(u1_m0_wo0_wi0_r0_ra9_count1_inner_i) + $signed(1'd1);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_ra9_count1_inner_q = $unsigned(u1_m0_wo0_wi0_r0_ra9_count1_inner_i[0:0]);

    // u1_m0_wo0_wi0_r0_ra9_count1_run(LOGICAL,128)@13
    assign u1_m0_wo0_wi0_r0_ra9_count1_run_q = $unsigned(u1_m0_wo0_wi0_r0_ra9_count1_inner_q[0:0]);

    // u1_m0_wo0_wi0_r0_ra9_count1(COUNTER,129)@13
    // low=0, high=35, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra9_count1_i <= 6'd1;
            u1_m0_wo0_wi0_r0_ra9_count1_eq <= 1'b0;
        end
        else if (u1_m0_wo0_memread_q == 1'b1 & u1_m0_wo0_wi0_r0_ra9_count1_run_q == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_ra9_count1_i == 6'd34)
            begin
                u1_m0_wo0_wi0_r0_ra9_count1_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_ra9_count1_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_ra9_count1_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_ra9_count1_i <= $unsigned(u1_m0_wo0_wi0_r0_ra9_count1_i) + $unsigned(6'd29);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_ra9_count1_i <= $unsigned(u1_m0_wo0_wi0_r0_ra9_count1_i) + $unsigned(6'd1);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_ra9_count1_q = u1_m0_wo0_wi0_r0_ra9_count1_i[5:0];

    // u1_m0_wo0_wi0_r0_ra9_count1_lut(LOOKUP,125)@13
    always @(u1_m0_wo0_wi0_r0_ra9_count1_q)
    begin
        // Begin reserved scope level
        unique case (u1_m0_wo0_wi0_r0_ra9_count1_q)
            6'b000000 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00000000;
            6'b000001 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00000010;
            6'b000010 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00000100;
            6'b000011 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00000110;
            6'b000100 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00001000;
            6'b000101 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00001010;
            6'b000110 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00001100;
            6'b000111 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00001110;
            6'b001000 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00010000;
            6'b001001 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00010010;
            6'b001010 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00010100;
            6'b001011 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00010110;
            6'b001100 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00011000;
            6'b001101 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00011010;
            6'b001110 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00011100;
            6'b001111 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00011110;
            6'b010000 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00100000;
            6'b010001 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00100010;
            6'b010010 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00100100;
            6'b010011 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00100110;
            6'b010100 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00101000;
            6'b010101 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00101010;
            6'b010110 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00101100;
            6'b010111 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00101110;
            6'b011000 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00110000;
            6'b011001 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00110010;
            6'b011010 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00110100;
            6'b011011 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00110110;
            6'b011100 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00111000;
            6'b011101 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00111010;
            6'b011110 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00111100;
            6'b011111 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00111110;
            6'b100000 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b01000000;
            6'b100001 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b01000010;
            6'b100010 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b01000100;
            6'b100011 : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b01000110;
            default : u1_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00000000;
        endcase
        // End reserved scope level
    end

    // u1_m0_wo0_wi0_r0_ra9_count1_lutreg(REG,126)@13
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra9_count1_lutreg_q <= $unsigned(8'b00000000);
        end
        else if (u1_m0_wo0_memread_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_ra9_count1_lutreg_q <= $unsigned(u1_m0_wo0_wi0_r0_ra9_count1_lut_q);
        end
    end

    // u1_m0_wo0_wi0_r0_ra9_count0(COUNTER,124)@13
    // low=0, high=1, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra9_count0_i <= 1'd1;
        end
        else if (u1_m0_wo0_memread_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_ra9_count0_i <= $unsigned(u1_m0_wo0_wi0_r0_ra9_count0_i) + $unsigned(1'd1);
        end
    end
    assign u1_m0_wo0_wi0_r0_ra9_count0_q = {1'b0, u1_m0_wo0_wi0_r0_ra9_count0_i[0:0]};

    // u1_m0_wo0_wi0_r0_ra9_add_0_0(ADD,130)@13 + 1
    assign u1_m0_wo0_wi0_r0_ra9_add_0_0_a = $unsigned({{7{u1_m0_wo0_wi0_r0_ra9_count0_q[1]}}, u1_m0_wo0_wi0_r0_ra9_count0_q});
    assign u1_m0_wo0_wi0_r0_ra9_add_0_0_b = $unsigned({{1{u1_m0_wo0_wi0_r0_ra9_count1_lutreg_q[7]}}, u1_m0_wo0_wi0_r0_ra9_count1_lutreg_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra9_add_0_0_o <= 9'b0;
        end
        else
        begin
            u1_m0_wo0_wi0_r0_ra9_add_0_0_o <= $unsigned($signed(u1_m0_wo0_wi0_r0_ra9_add_0_0_a) + $signed(u1_m0_wo0_wi0_r0_ra9_add_0_0_b));
        end
    end
    assign u1_m0_wo0_wi0_r0_ra9_add_0_0_q = u1_m0_wo0_wi0_r0_ra9_add_0_0_o[8:0];

    // u1_m0_wo0_wi0_r0_readReg9(DELAY,147)@14
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u1_m0_wo0_wi0_r0_readReg9_q <= u1_m0_wo0_wi0_r0_ra9_add_0_0_q;
        end
    end

    // d_xIn_1_14_notEnable(LOGICAL,336)@10
    assign d_xIn_1_14_notEnable_q = $unsigned(~ (VCC_q));

    // d_xIn_1_14_nor(LOGICAL,337)@10
    assign d_xIn_1_14_nor_q = ~ (d_xIn_1_14_notEnable_q | d_xIn_1_14_sticky_ena_q);

    // d_xIn_1_14_mem_last(CONSTANT,333)
    assign d_xIn_1_14_mem_last_q = $unsigned(2'b01);

    // d_xIn_1_14_cmp(LOGICAL,334)@10
    assign d_xIn_1_14_cmp_q = $unsigned(d_xIn_1_14_mem_last_q == d_xIn_1_14_rdcnt_q ? 1'b1 : 1'b0);

    // d_xIn_1_14_cmpReg(REG,335)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_1_14_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_xIn_1_14_cmpReg_q <= $unsigned(d_xIn_1_14_cmp_q);
        end
    end

    // d_xIn_1_14_sticky_ena(REG,338)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_1_14_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_xIn_1_14_nor_q == 1'b1)
        begin
            d_xIn_1_14_sticky_ena_q <= $unsigned(d_xIn_1_14_cmpReg_q);
        end
    end

    // d_xIn_1_14_enaAnd(LOGICAL,339)@10
    assign d_xIn_1_14_enaAnd_q = d_xIn_1_14_sticky_ena_q & VCC_q;

    // d_xIn_1_14_rdcnt(COUNTER,331)@10 + 1
    // low=0, high=2, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_1_14_rdcnt_i <= 2'd0;
            d_xIn_1_14_rdcnt_eq <= 1'b0;
        end
        else
        begin
            if (d_xIn_1_14_rdcnt_i == 2'd1)
            begin
                d_xIn_1_14_rdcnt_eq <= 1'b1;
            end
            else
            begin
                d_xIn_1_14_rdcnt_eq <= 1'b0;
            end
            if (d_xIn_1_14_rdcnt_eq == 1'b1)
            begin
                d_xIn_1_14_rdcnt_i <= $unsigned(d_xIn_1_14_rdcnt_i) + $unsigned(2'd2);
            end
            else
            begin
                d_xIn_1_14_rdcnt_i <= $unsigned(d_xIn_1_14_rdcnt_i) + $unsigned(2'd1);
            end
        end
    end
    assign d_xIn_1_14_rdcnt_q = d_xIn_1_14_rdcnt_i[1:0];

    // d_xIn_1_14_wraddr(REG,332)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_1_14_wraddr_q <= $unsigned(2'b10);
        end
        else
        begin
            d_xIn_1_14_wraddr_q <= $unsigned(d_xIn_1_14_rdcnt_q);
        end
    end

    // d_xIn_1_14_mem(DUALMEM,330)@10 + 2
    assign d_xIn_1_14_mem_ia = $unsigned(xIn_1);
    assign d_xIn_1_14_mem_aa = d_xIn_1_14_wraddr_q;
    assign d_xIn_1_14_mem_ab = d_xIn_1_14_rdcnt_q;
    assign d_xIn_1_14_mem_ena_OrRstB = areset | d_xIn_1_14_enaAnd_q[0];
    assign d_xIn_1_14_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(3),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(3),
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
    ) d_xIn_1_14_mem_dmem (
        .clocken1(d_xIn_1_14_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_xIn_1_14_mem_reset0),
        .clock1(clk),
        .address_a(d_xIn_1_14_mem_aa),
        .data_a(d_xIn_1_14_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_xIn_1_14_mem_ab),
        .q_b(d_xIn_1_14_mem_iq),
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
    assign d_xIn_1_14_mem_q = d_xIn_1_14_mem_iq[15:0];

    // d_in0_m0_wi0_wo0_assign_id1_q_14(DELAY,217)@11 + 3
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_14_delay_0 <= '0;
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_14_delay_0 <= $unsigned(d_in0_m0_wi0_wo0_assign_id1_q_11_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_14_delay_1 <= d_in0_m0_wi0_wo0_assign_id1_q_14_delay_0;
            d_in0_m0_wi0_wo0_assign_id1_q_14_q <= d_in0_m0_wi0_wo0_assign_id1_q_14_delay_1;
        end
    end

    // u1_m0_wo0_wi0_r0_wa9(COUNTER,140)@14
    // low=0, high=71, step=1, init=64
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_wa9_i <= 7'd64;
            u1_m0_wo0_wi0_r0_wa9_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_14_q == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_wa9_i == 7'd70)
            begin
                u1_m0_wo0_wi0_r0_wa9_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_wa9_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_wa9_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_wa9_i <= $unsigned(u1_m0_wo0_wi0_r0_wa9_i) + $unsigned(7'd57);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_wa9_i <= $unsigned(u1_m0_wo0_wi0_r0_wa9_i) + $unsigned(7'd1);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_wa9_q = u1_m0_wo0_wi0_r0_wa9_i[6:0];

    // u1_m0_wo0_wi0_r0_memr9(DUALMEM,145)@14
    assign u1_m0_wo0_wi0_r0_memr9_ia = $unsigned(d_xIn_1_14_mem_q);
    assign u1_m0_wo0_wi0_r0_memr9_aa = u1_m0_wo0_wi0_r0_wa9_q;
    assign u1_m0_wo0_wi0_r0_memr9_ab = u1_m0_wo0_wi0_r0_readReg9_q[6:0];
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(7),
        .numwords_a(72),
        .width_b(16),
        .widthad_b(7),
        .numwords_b(72),
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
    ) u1_m0_wo0_wi0_r0_memr9_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u1_m0_wo0_wi0_r0_memr9_aa),
        .data_a(u1_m0_wo0_wi0_r0_memr9_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_14_q[0]),
        .address_b(u1_m0_wo0_wi0_r0_memr9_ab),
        .q_b(u1_m0_wo0_wi0_r0_memr9_iq),
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
    assign u1_m0_wo0_wi0_r0_memr9_q = u1_m0_wo0_wi0_r0_memr9_iq[15:0];

    // d_u1_m0_wo0_wi0_r0_ra9_count1_run_q_14(DELAY,229)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_m0_wo0_wi0_r0_ra9_count1_run_q_14_q <= '0;
        end
        else
        begin
            d_u1_m0_wo0_wi0_r0_ra9_count1_run_q_14_q <= $unsigned(u1_m0_wo0_wi0_r0_ra9_count1_run_q);
        end
    end

    // d_u1_m0_wo0_memread_q_14(DELAY,224)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_m0_wo0_memread_q_14_q <= '0;
        end
        else
        begin
            d_u1_m0_wo0_memread_q_14_q <= $unsigned(u1_m0_wo0_memread_q);
        end
    end

    // u1_m0_wo0_wi0_r0_ra11_count1(COUNTER,135)@14
    // low=0, high=5, step=-2, init=2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra11_count1_i <= 3'd2;
            u1_m0_wo0_wi0_r0_ra11_count1_eq <= 1'b0;
        end
        else if (d_u1_m0_wo0_memread_q_14_q == 1'b1 & d_u1_m0_wo0_wi0_r0_ra9_count1_run_q_14_q == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_ra11_count1_i == 3'd2)
            begin
                u1_m0_wo0_wi0_r0_ra11_count1_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_ra11_count1_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_ra11_count1_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_ra11_count1_i <= $unsigned(u1_m0_wo0_wi0_r0_ra11_count1_i) - $unsigned(3'd4);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_ra11_count1_i <= $unsigned(u1_m0_wo0_wi0_r0_ra11_count1_i) - $unsigned(3'd2);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_ra11_count1_q = {1'b0, u1_m0_wo0_wi0_r0_ra11_count1_i[2:0]};

    // u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_b(BITSELECT,212)@14
    assign u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_b_in = $unsigned({{1{u1_m0_wo0_wi0_r0_ra11_count1_q[3]}}, u1_m0_wo0_wi0_r0_ra11_count1_q});
    assign u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_b_b = $unsigned(u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_b_in[2:1]);

    // u1_m0_wo0_wi0_r0_ra0_count0(COUNTER,116)@13
    // low=0, high=1, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra0_count0_i <= 1'd0;
        end
        else if (u1_m0_wo0_memread_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_ra0_count0_i <= $unsigned(u1_m0_wo0_wi0_r0_ra0_count0_i) + $unsigned(1'd1);
        end
    end
    assign u1_m0_wo0_wi0_r0_ra0_count0_q = {1'b0, u1_m0_wo0_wi0_r0_ra0_count0_i[0:0]};

    // d_u1_m0_wo0_wi0_r0_ra0_count0_q_14(DELAY,228)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_m0_wo0_wi0_r0_ra0_count0_q_14_q <= '0;
        end
        else
        begin
            d_u1_m0_wo0_wi0_r0_ra0_count0_q_14_q <= $unsigned(u1_m0_wo0_wi0_r0_ra0_count0_q);
        end
    end

    // u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_a(BITSELECT,211)@14
    assign u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_a_in = $unsigned({{3{d_u1_m0_wo0_wi0_r0_ra0_count0_q_14_q[1]}}, d_u1_m0_wo0_wi0_r0_ra0_count0_q_14_q});
    assign u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_a_b = $unsigned(u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_a_in[0:0]);

    // u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_join(BITJOIN,213)@14
    assign u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_join_q = {GND_q, GND_q, u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_b_b, u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_a_b};

    // u1_m0_wo0_wi0_r0_readReg11(DELAY,150)@14
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u1_m0_wo0_wi0_r0_readReg11_q <= u1_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_join_q;
        end
    end

    // u1_m0_wo0_compute(DELAY,113)@13
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

    // u1_m0_wo0_wi0_r0_we11_seq(SEQUENCE,138)@13 + 1
    always @ (posedge clk)
    begin
        reg [4:0] u1_m0_wo0_wi0_r0_we11_seq_c;
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_we11_seq_c = 5'b00000;
            u1_m0_wo0_wi0_r0_we11_seq_q <= $unsigned(1'b0);
            u1_m0_wo0_wi0_r0_we11_seq_eq <= 1'b0;
        end
        else
        begin
            if (u1_m0_wo0_compute_q == 1'b1)
            begin
                if (u1_m0_wo0_wi0_r0_we11_seq_c == 5'b11111)
                begin
                    u1_m0_wo0_wi0_r0_we11_seq_eq <= 1'b1;
                end
                else
                begin
                    u1_m0_wo0_wi0_r0_we11_seq_eq <= 1'b0;
                end
                if (u1_m0_wo0_wi0_r0_we11_seq_eq == 1'b1)
                begin
                    u1_m0_wo0_wi0_r0_we11_seq_c = $signed(u1_m0_wo0_wi0_r0_we11_seq_c) + $signed(5'd3);
                end
                else
                begin
                    u1_m0_wo0_wi0_r0_we11_seq_c = $signed(u1_m0_wo0_wi0_r0_we11_seq_c) - $signed(5'd1);
                end
                u1_m0_wo0_wi0_r0_we11_seq_q <= $unsigned(u1_m0_wo0_wi0_r0_we11_seq_c[4:4]);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_we11_seq_q <= $unsigned(1'b0);
            end
        end
    end

    // u1_m0_wo0_wi0_r0_wa11(COUNTER,141)@14
    // low=0, high=5, step=1, init=4
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_wa11_i <= 3'd4;
            u1_m0_wo0_wi0_r0_wa11_eq <= 1'b0;
        end
        else if (u1_m0_wo0_wi0_r0_we11_seq_q == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_wa11_i == 3'd4)
            begin
                u1_m0_wo0_wi0_r0_wa11_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_wa11_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_wa11_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_wa11_i <= $unsigned(u1_m0_wo0_wi0_r0_wa11_i) + $unsigned(3'd3);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_wa11_i <= $unsigned(u1_m0_wo0_wi0_r0_wa11_i) + $unsigned(3'd1);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_wa11_q = u1_m0_wo0_wi0_r0_wa11_i[2:0];

    // u1_m0_wo0_wi0_r0_memr11(DUALMEM,148)@14
    assign u1_m0_wo0_wi0_r0_memr11_ia = $unsigned(u1_m0_wo0_wi0_r0_split5_e);
    assign u1_m0_wo0_wi0_r0_memr11_aa = u1_m0_wo0_wi0_r0_wa11_q;
    assign u1_m0_wo0_wi0_r0_memr11_ab = u1_m0_wo0_wi0_r0_readReg11_q[2:0];
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
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u1_m0_wo0_wi0_r0_memr11_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u1_m0_wo0_wi0_r0_memr11_aa),
        .data_a(u1_m0_wo0_wi0_r0_memr11_ia),
        .wren_a(u1_m0_wo0_wi0_r0_we11_seq_q[0]),
        .address_b(u1_m0_wo0_wi0_r0_memr11_ab),
        .q_b(u1_m0_wo0_wi0_r0_memr11_iq),
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
    assign u1_m0_wo0_wi0_r0_memr11_q = u1_m0_wo0_wi0_r0_memr11_iq[15:0];

    // u1_m0_wo0_wi0_r0_delayr5_notEnable(LOGICAL,294)@14
    assign u1_m0_wo0_wi0_r0_delayr5_notEnable_q = $unsigned(~ (d_u1_m0_wo0_compute_q_14_q));

    // u1_m0_wo0_wi0_r0_delayr5_nor(LOGICAL,295)@14
    assign u1_m0_wo0_wi0_r0_delayr5_nor_q = ~ (u1_m0_wo0_wi0_r0_delayr5_notEnable_q | u1_m0_wo0_wi0_r0_delayr5_sticky_ena_q);

    // u1_m0_wo0_wi0_r0_delayr5_mem_last(CONSTANT,291)
    assign u1_m0_wo0_wi0_r0_delayr5_mem_last_q = $unsigned(4'b0100);

    // u1_m0_wo0_wi0_r0_delayr5_cmp(LOGICAL,292)@14
    assign u1_m0_wo0_wi0_r0_delayr5_cmp_b = {1'b0, u1_m0_wo0_wi0_r0_delayr5_rdmux_q};
    assign u1_m0_wo0_wi0_r0_delayr5_cmp_q = $unsigned(u1_m0_wo0_wi0_r0_delayr5_mem_last_q == u1_m0_wo0_wi0_r0_delayr5_cmp_b ? 1'b1 : 1'b0);

    // u1_m0_wo0_wi0_r0_delayr5_cmpReg(REG,293)@14 + 1
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

    // u1_m0_wo0_wi0_r0_delayr5_sticky_ena(REG,296)@14 + 1
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

    // u1_m0_wo0_wi0_r0_delayr5_enaAnd(LOGICAL,297)@14
    assign u1_m0_wo0_wi0_r0_delayr5_enaAnd_q = u1_m0_wo0_wi0_r0_delayr5_sticky_ena_q & d_u1_m0_wo0_compute_q_14_q;

    // u1_m0_wo0_wi0_r0_delayr5_rdcnt(COUNTER,288)@14 + 1
    // low=0, high=5, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr5_rdcnt_i <= 3'd0;
            u1_m0_wo0_wi0_r0_delayr5_rdcnt_eq <= 1'b0;
        end
        else if (d_u1_m0_wo0_compute_q_14_q == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_delayr5_rdcnt_i == 3'd4)
            begin
                u1_m0_wo0_wi0_r0_delayr5_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_delayr5_rdcnt_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_delayr5_rdcnt_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_delayr5_rdcnt_i <= $unsigned(u1_m0_wo0_wi0_r0_delayr5_rdcnt_i) + $unsigned(3'd3);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_delayr5_rdcnt_i <= $unsigned(u1_m0_wo0_wi0_r0_delayr5_rdcnt_i) + $unsigned(3'd1);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_delayr5_rdcnt_q = u1_m0_wo0_wi0_r0_delayr5_rdcnt_i[2:0];

    // u1_m0_wo0_wi0_r0_delayr5_rdmux(MUX,289)@14
    assign u1_m0_wo0_wi0_r0_delayr5_rdmux_s = d_u1_m0_wo0_compute_q_14_q;
    always @(u1_m0_wo0_wi0_r0_delayr5_rdmux_s or u1_m0_wo0_wi0_r0_delayr5_wraddr_q or u1_m0_wo0_wi0_r0_delayr5_rdcnt_q)
    begin
        unique case (u1_m0_wo0_wi0_r0_delayr5_rdmux_s)
            1'b0 : u1_m0_wo0_wi0_r0_delayr5_rdmux_q = u1_m0_wo0_wi0_r0_delayr5_wraddr_q;
            1'b1 : u1_m0_wo0_wi0_r0_delayr5_rdmux_q = u1_m0_wo0_wi0_r0_delayr5_rdcnt_q;
            default : u1_m0_wo0_wi0_r0_delayr5_rdmux_q = 3'b0;
        endcase
    end

    // u1_m0_wo0_wi0_r0_join5(BITJOIN,154)@14
    assign u1_m0_wo0_wi0_r0_join5_q = {u1_m0_wo0_wi0_r0_split5_d, u1_m0_wo0_wi0_r0_split5_c, u1_m0_wo0_wi0_r0_split5_b, u1_m0_wo0_wi0_r0_split1_e};

    // u1_m0_wo0_wi0_r0_delayr5_wraddr(REG,290)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr5_wraddr_q <= $unsigned(3'b101);
        end
        else
        begin
            u1_m0_wo0_wi0_r0_delayr5_wraddr_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr5_rdmux_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr5_mem(DUALMEM,287)@14 + 2
    assign u1_m0_wo0_wi0_r0_delayr5_mem_ia = $unsigned(u1_m0_wo0_wi0_r0_join5_q);
    assign u1_m0_wo0_wi0_r0_delayr5_mem_aa = u1_m0_wo0_wi0_r0_delayr5_wraddr_q;
    assign u1_m0_wo0_wi0_r0_delayr5_mem_ab = u1_m0_wo0_wi0_r0_delayr5_rdmux_q;
    assign u1_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB = areset | u1_m0_wo0_wi0_r0_delayr5_enaAnd_q[0];
    assign u1_m0_wo0_wi0_r0_delayr5_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(3),
        .numwords_a(6),
        .width_b(64),
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
    assign u1_m0_wo0_wi0_r0_delayr5_mem_q = u1_m0_wo0_wi0_r0_delayr5_mem_iq[63:0];

    // u1_m0_wo0_wi0_r0_split5(BITSELECT,155)@14
    assign u1_m0_wo0_wi0_r0_split5_b = $unsigned(u1_m0_wo0_wi0_r0_delayr5_mem_q[15:0]);
    assign u1_m0_wo0_wi0_r0_split5_c = $unsigned(u1_m0_wo0_wi0_r0_delayr5_mem_q[31:16]);
    assign u1_m0_wo0_wi0_r0_split5_d = $unsigned(u1_m0_wo0_wi0_r0_delayr5_mem_q[47:32]);
    assign u1_m0_wo0_wi0_r0_split5_e = $unsigned(u1_m0_wo0_wi0_r0_delayr5_mem_q[63:48]);

    // u1_m0_wo0_wi0_r0_delayr12_notEnable(LOGICAL,305)@14
    assign u1_m0_wo0_wi0_r0_delayr12_notEnable_q = $unsigned(~ (d_u1_m0_wo0_compute_q_14_q));

    // u1_m0_wo0_wi0_r0_delayr12_nor(LOGICAL,306)@14
    assign u1_m0_wo0_wi0_r0_delayr12_nor_q = ~ (u1_m0_wo0_wi0_r0_delayr12_notEnable_q | u1_m0_wo0_wi0_r0_delayr12_sticky_ena_q);

    // u1_m0_wo0_wi0_r0_delayr12_mem_last(CONSTANT,302)
    assign u1_m0_wo0_wi0_r0_delayr12_mem_last_q = $unsigned(4'b0110);

    // u1_m0_wo0_wi0_r0_delayr12_cmp(LOGICAL,303)@14
    assign u1_m0_wo0_wi0_r0_delayr12_cmp_b = {1'b0, u1_m0_wo0_wi0_r0_delayr12_rdmux_q};
    assign u1_m0_wo0_wi0_r0_delayr12_cmp_q = $unsigned(u1_m0_wo0_wi0_r0_delayr12_mem_last_q == u1_m0_wo0_wi0_r0_delayr12_cmp_b ? 1'b1 : 1'b0);

    // u1_m0_wo0_wi0_r0_delayr12_cmpReg(REG,304)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr12_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u1_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr12_cmpReg_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr12_cmp_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr12_sticky_ena(REG,307)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr12_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u1_m0_wo0_wi0_r0_delayr12_nor_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr12_sticky_ena_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr12_cmpReg_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr12_enaAnd(LOGICAL,308)@14
    assign u1_m0_wo0_wi0_r0_delayr12_enaAnd_q = u1_m0_wo0_wi0_r0_delayr12_sticky_ena_q & d_u1_m0_wo0_compute_q_14_q;

    // u1_m0_wo0_wi0_r0_delayr12_rdcnt(COUNTER,299)@14 + 1
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr12_rdcnt_i <= 3'd0;
        end
        else if (d_u1_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr12_rdcnt_i <= $unsigned(u1_m0_wo0_wi0_r0_delayr12_rdcnt_i) + $unsigned(3'd1);
        end
    end
    assign u1_m0_wo0_wi0_r0_delayr12_rdcnt_q = u1_m0_wo0_wi0_r0_delayr12_rdcnt_i[2:0];

    // u1_m0_wo0_wi0_r0_delayr12_rdmux(MUX,300)@14
    assign u1_m0_wo0_wi0_r0_delayr12_rdmux_s = d_u1_m0_wo0_compute_q_14_q;
    always @(u1_m0_wo0_wi0_r0_delayr12_rdmux_s or u1_m0_wo0_wi0_r0_delayr12_wraddr_q or u1_m0_wo0_wi0_r0_delayr12_rdcnt_q)
    begin
        unique case (u1_m0_wo0_wi0_r0_delayr12_rdmux_s)
            1'b0 : u1_m0_wo0_wi0_r0_delayr12_rdmux_q = u1_m0_wo0_wi0_r0_delayr12_wraddr_q;
            1'b1 : u1_m0_wo0_wi0_r0_delayr12_rdmux_q = u1_m0_wo0_wi0_r0_delayr12_rdcnt_q;
            default : u1_m0_wo0_wi0_r0_delayr12_rdmux_q = 3'b0;
        endcase
    end

    // u1_m0_wo0_wi0_r0_join12(BITJOIN,158)@14
    assign u1_m0_wo0_wi0_r0_join12_q = {u1_m0_wo0_wi0_r0_split12_d, u1_m0_wo0_wi0_r0_split12_c, u1_m0_wo0_wi0_r0_split12_b, u1_m0_wo0_wi0_r0_memr11_q};

    // u1_m0_wo0_wi0_r0_delayr12_wraddr(REG,301)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr12_wraddr_q <= $unsigned(3'b111);
        end
        else
        begin
            u1_m0_wo0_wi0_r0_delayr12_wraddr_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr12_rdmux_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr12_mem(DUALMEM,298)@14 + 2
    assign u1_m0_wo0_wi0_r0_delayr12_mem_ia = $unsigned(u1_m0_wo0_wi0_r0_join12_q);
    assign u1_m0_wo0_wi0_r0_delayr12_mem_aa = u1_m0_wo0_wi0_r0_delayr12_wraddr_q;
    assign u1_m0_wo0_wi0_r0_delayr12_mem_ab = u1_m0_wo0_wi0_r0_delayr12_rdmux_q;
    assign u1_m0_wo0_wi0_r0_delayr12_mem_ena_OrRstB = areset | u1_m0_wo0_wi0_r0_delayr12_enaAnd_q[0];
    assign u1_m0_wo0_wi0_r0_delayr12_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(64),
        .widthad_b(3),
        .numwords_b(8),
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
    ) u1_m0_wo0_wi0_r0_delayr12_mem_dmem (
        .clocken1(u1_m0_wo0_wi0_r0_delayr12_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u1_m0_wo0_wi0_r0_delayr12_mem_reset0),
        .clock1(clk),
        .address_a(u1_m0_wo0_wi0_r0_delayr12_mem_aa),
        .data_a(u1_m0_wo0_wi0_r0_delayr12_mem_ia),
        .wren_a(d_u1_m0_wo0_compute_q_14_q[0]),
        .address_b(u1_m0_wo0_wi0_r0_delayr12_mem_ab),
        .q_b(u1_m0_wo0_wi0_r0_delayr12_mem_iq),
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
    assign u1_m0_wo0_wi0_r0_delayr12_mem_q = u1_m0_wo0_wi0_r0_delayr12_mem_iq[63:0];

    // u1_m0_wo0_wi0_r0_split12(BITSELECT,159)@14
    assign u1_m0_wo0_wi0_r0_split12_b = $unsigned(u1_m0_wo0_wi0_r0_delayr12_mem_q[15:0]);
    assign u1_m0_wo0_wi0_r0_split12_c = $unsigned(u1_m0_wo0_wi0_r0_delayr12_mem_q[31:16]);
    assign u1_m0_wo0_wi0_r0_split12_d = $unsigned(u1_m0_wo0_wi0_r0_delayr12_mem_q[47:32]);
    assign u1_m0_wo0_wi0_r0_split12_e = $unsigned(u1_m0_wo0_wi0_r0_delayr12_mem_q[63:48]);

    // u1_m0_wo0_ca9_1(REG,166)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_ca9_1_q <= $unsigned(1'b1);
        end
        else if (d_u1_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u1_m0_wo0_ca9_1_q <= u1_m0_wo0_ca8_1_q;
        end
    end

    // u1_m0_wo0_wi0_r0_delayr1_notEnable(LOGICAL,283)@14
    assign u1_m0_wo0_wi0_r0_delayr1_notEnable_q = $unsigned(~ (d_u1_m0_wo0_compute_q_14_q));

    // u1_m0_wo0_wi0_r0_delayr1_nor(LOGICAL,284)@14
    assign u1_m0_wo0_wi0_r0_delayr1_nor_q = ~ (u1_m0_wo0_wi0_r0_delayr1_notEnable_q | u1_m0_wo0_wi0_r0_delayr1_sticky_ena_q);

    // u1_m0_wo0_wi0_r0_delayr1_mem_last(CONSTANT,280)
    assign u1_m0_wo0_wi0_r0_delayr1_mem_last_q = $unsigned(4'b0100);

    // u1_m0_wo0_wi0_r0_delayr1_cmp(LOGICAL,281)@14
    assign u1_m0_wo0_wi0_r0_delayr1_cmp_b = {1'b0, u1_m0_wo0_wi0_r0_delayr1_rdmux_q};
    assign u1_m0_wo0_wi0_r0_delayr1_cmp_q = $unsigned(u1_m0_wo0_wi0_r0_delayr1_mem_last_q == u1_m0_wo0_wi0_r0_delayr1_cmp_b ? 1'b1 : 1'b0);

    // u1_m0_wo0_wi0_r0_delayr1_cmpReg(REG,282)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr1_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u1_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr1_cmpReg_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr1_cmp_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr1_sticky_ena(REG,285)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr1_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u1_m0_wo0_wi0_r0_delayr1_nor_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr1_sticky_ena_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr1_cmpReg_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr1_enaAnd(LOGICAL,286)@14
    assign u1_m0_wo0_wi0_r0_delayr1_enaAnd_q = u1_m0_wo0_wi0_r0_delayr1_sticky_ena_q & d_u1_m0_wo0_compute_q_14_q;

    // u1_m0_wo0_wi0_r0_delayr1_rdcnt(COUNTER,277)@14 + 1
    // low=0, high=5, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr1_rdcnt_i <= 3'd0;
            u1_m0_wo0_wi0_r0_delayr1_rdcnt_eq <= 1'b0;
        end
        else if (d_u1_m0_wo0_compute_q_14_q == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_delayr1_rdcnt_i == 3'd4)
            begin
                u1_m0_wo0_wi0_r0_delayr1_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_delayr1_rdcnt_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_delayr1_rdcnt_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_delayr1_rdcnt_i <= $unsigned(u1_m0_wo0_wi0_r0_delayr1_rdcnt_i) + $unsigned(3'd3);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_delayr1_rdcnt_i <= $unsigned(u1_m0_wo0_wi0_r0_delayr1_rdcnt_i) + $unsigned(3'd1);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_delayr1_rdcnt_q = u1_m0_wo0_wi0_r0_delayr1_rdcnt_i[2:0];

    // u1_m0_wo0_wi0_r0_delayr1_rdmux(MUX,278)@14
    assign u1_m0_wo0_wi0_r0_delayr1_rdmux_s = d_u1_m0_wo0_compute_q_14_q;
    always @(u1_m0_wo0_wi0_r0_delayr1_rdmux_s or u1_m0_wo0_wi0_r0_delayr1_wraddr_q or u1_m0_wo0_wi0_r0_delayr1_rdcnt_q)
    begin
        unique case (u1_m0_wo0_wi0_r0_delayr1_rdmux_s)
            1'b0 : u1_m0_wo0_wi0_r0_delayr1_rdmux_q = u1_m0_wo0_wi0_r0_delayr1_wraddr_q;
            1'b1 : u1_m0_wo0_wi0_r0_delayr1_rdmux_q = u1_m0_wo0_wi0_r0_delayr1_rdcnt_q;
            default : u1_m0_wo0_wi0_r0_delayr1_rdmux_q = 3'b0;
        endcase
    end

    // u1_m0_wo0_wi0_r0_join1(BITJOIN,151)@14
    assign u1_m0_wo0_wi0_r0_join1_q = {u1_m0_wo0_wi0_r0_split1_d, u1_m0_wo0_wi0_r0_split1_c, u1_m0_wo0_wi0_r0_split1_b, u1_m0_wo0_wi0_r0_memr0_q};

    // u1_m0_wo0_wi0_r0_delayr1_wraddr(REG,279)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr1_wraddr_q <= $unsigned(3'b101);
        end
        else
        begin
            u1_m0_wo0_wi0_r0_delayr1_wraddr_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr1_rdmux_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr1_mem(DUALMEM,276)@14 + 2
    assign u1_m0_wo0_wi0_r0_delayr1_mem_ia = $unsigned(u1_m0_wo0_wi0_r0_join1_q);
    assign u1_m0_wo0_wi0_r0_delayr1_mem_aa = u1_m0_wo0_wi0_r0_delayr1_wraddr_q;
    assign u1_m0_wo0_wi0_r0_delayr1_mem_ab = u1_m0_wo0_wi0_r0_delayr1_rdmux_q;
    assign u1_m0_wo0_wi0_r0_delayr1_mem_ena_OrRstB = areset | u1_m0_wo0_wi0_r0_delayr1_enaAnd_q[0];
    assign u1_m0_wo0_wi0_r0_delayr1_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(3),
        .numwords_a(6),
        .width_b(64),
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
    ) u1_m0_wo0_wi0_r0_delayr1_mem_dmem (
        .clocken1(u1_m0_wo0_wi0_r0_delayr1_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u1_m0_wo0_wi0_r0_delayr1_mem_reset0),
        .clock1(clk),
        .address_a(u1_m0_wo0_wi0_r0_delayr1_mem_aa),
        .data_a(u1_m0_wo0_wi0_r0_delayr1_mem_ia),
        .wren_a(d_u1_m0_wo0_compute_q_14_q[0]),
        .address_b(u1_m0_wo0_wi0_r0_delayr1_mem_ab),
        .q_b(u1_m0_wo0_wi0_r0_delayr1_mem_iq),
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
    assign u1_m0_wo0_wi0_r0_delayr1_mem_q = u1_m0_wo0_wi0_r0_delayr1_mem_iq[63:0];

    // u1_m0_wo0_wi0_r0_split1(BITSELECT,152)@14
    assign u1_m0_wo0_wi0_r0_split1_b = $unsigned(u1_m0_wo0_wi0_r0_delayr1_mem_q[15:0]);
    assign u1_m0_wo0_wi0_r0_split1_c = $unsigned(u1_m0_wo0_wi0_r0_delayr1_mem_q[31:16]);
    assign u1_m0_wo0_wi0_r0_split1_d = $unsigned(u1_m0_wo0_wi0_r0_delayr1_mem_q[47:32]);
    assign u1_m0_wo0_wi0_r0_split1_e = $unsigned(u1_m0_wo0_wi0_r0_delayr1_mem_q[63:48]);

    // u1_m0_wo0_ca8_1_lut(LOOKUP,164)@14
    always @(u1_m0_wo0_ca9_1_q)
    begin
        // Begin reserved scope level
        unique case (u1_m0_wo0_ca9_1_q)
            1'b0 : u1_m0_wo0_ca8_1_lut_q = 1'b1;
            1'b1 : u1_m0_wo0_ca8_1_lut_q = 1'b0;
            default : begin
                          // unreachable
                          u1_m0_wo0_ca8_1_lut_q = 1'bx;
                      end
        endcase
        // End reserved scope level
    end

    // u1_m0_wo0_ca8_1(REG,165)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_ca8_1_q <= $unsigned(1'b0);
        end
        else if (d_u1_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u1_m0_wo0_ca8_1_q <= u1_m0_wo0_ca8_1_lut_q;
        end
    end

    // u1_m0_wo0_wi0_r0_ra0_count1_inner(COUNTER,119)@13
    // low=-1, high=0, step=1, init=-1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra0_count1_inner_i <= -1'd1;
            u1_m0_wo0_wi0_r0_ra0_count1_inner_eq <= 1'b0;
        end
        else if (u1_m0_wo0_memread_q == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_ra0_count1_inner_eq == 1'b0)
            begin
                u1_m0_wo0_wi0_r0_ra0_count1_inner_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_ra0_count1_inner_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_ra0_count1_inner_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_ra0_count1_inner_i <= $signed(u1_m0_wo0_wi0_r0_ra0_count1_inner_i) + $signed(-1'd1);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_ra0_count1_inner_i <= $signed(u1_m0_wo0_wi0_r0_ra0_count1_inner_i) + $signed(1'd1);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_ra0_count1_inner_q = $unsigned(u1_m0_wo0_wi0_r0_ra0_count1_inner_i[0:0]);

    // u1_m0_wo0_wi0_r0_ra0_count1_run(LOGICAL,120)@13
    assign u1_m0_wo0_wi0_r0_ra0_count1_run_q = $unsigned(u1_m0_wo0_wi0_r0_ra0_count1_inner_q[0:0]);

    // u1_m0_wo0_wi0_r0_ra0_count1(COUNTER,121)@13
    // low=0, high=5, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra0_count1_i <= 3'd0;
            u1_m0_wo0_wi0_r0_ra0_count1_eq <= 1'b0;
        end
        else if (u1_m0_wo0_memread_q == 1'b1 & u1_m0_wo0_wi0_r0_ra0_count1_run_q == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_ra0_count1_i == 3'd4)
            begin
                u1_m0_wo0_wi0_r0_ra0_count1_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_ra0_count1_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_ra0_count1_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_ra0_count1_i <= $unsigned(u1_m0_wo0_wi0_r0_ra0_count1_i) + $unsigned(3'd3);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_ra0_count1_i <= $unsigned(u1_m0_wo0_wi0_r0_ra0_count1_i) + $unsigned(3'd1);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_ra0_count1_q = u1_m0_wo0_wi0_r0_ra0_count1_i[2:0];

    // u1_m0_wo0_wi0_r0_ra0_count1_lut(LOOKUP,117)@13
    always @(u1_m0_wo0_wi0_r0_ra0_count1_q)
    begin
        // Begin reserved scope level
        unique case (u1_m0_wo0_wi0_r0_ra0_count1_q)
            3'b000 : u1_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b00000;
            3'b001 : u1_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b00100;
            3'b010 : u1_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b00100;
            3'b011 : u1_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b01000;
            3'b100 : u1_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b01000;
            3'b101 : u1_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b00000;
            default : u1_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b00000;
        endcase
        // End reserved scope level
    end

    // u1_m0_wo0_wi0_r0_ra0_count1_lutreg(REG,118)@13
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra0_count1_lutreg_q <= $unsigned(5'b00000);
        end
        else if (u1_m0_wo0_memread_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_ra0_count1_lutreg_q <= $unsigned(u1_m0_wo0_wi0_r0_ra0_count1_lut_q);
        end
    end

    // u1_m0_wo0_wi0_r0_ra0_add_0_0(ADD,122)@13 + 1
    assign u1_m0_wo0_wi0_r0_ra0_add_0_0_a = $unsigned({{4{u1_m0_wo0_wi0_r0_ra0_count0_q[1]}}, u1_m0_wo0_wi0_r0_ra0_count0_q});
    assign u1_m0_wo0_wi0_r0_ra0_add_0_0_b = $unsigned({{1{u1_m0_wo0_wi0_r0_ra0_count1_lutreg_q[4]}}, u1_m0_wo0_wi0_r0_ra0_count1_lutreg_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_ra0_add_0_0_o <= 6'b0;
        end
        else
        begin
            u1_m0_wo0_wi0_r0_ra0_add_0_0_o <= $unsigned($signed(u1_m0_wo0_wi0_r0_ra0_add_0_0_a) + $signed(u1_m0_wo0_wi0_r0_ra0_add_0_0_b));
        end
    end
    assign u1_m0_wo0_wi0_r0_ra0_add_0_0_q = u1_m0_wo0_wi0_r0_ra0_add_0_0_o[5:0];

    // u1_m0_wo0_wi0_r0_readReg0(DELAY,144)@14
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u1_m0_wo0_wi0_r0_readReg0_q <= u1_m0_wo0_wi0_r0_ra0_add_0_0_q;
        end
    end

    // u1_m0_wo0_wi0_r0_wa0(COUNTER,139)@14
    // low=0, high=11, step=1, init=4
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_wa0_i <= 4'd4;
            u1_m0_wo0_wi0_r0_wa0_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_14_q == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_wa0_i == 4'd10)
            begin
                u1_m0_wo0_wi0_r0_wa0_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_wa0_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_wa0_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_wa0_i <= $unsigned(u1_m0_wo0_wi0_r0_wa0_i) + $unsigned(4'd5);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_wa0_i <= $unsigned(u1_m0_wo0_wi0_r0_wa0_i) + $unsigned(4'd1);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_wa0_q = u1_m0_wo0_wi0_r0_wa0_i[3:0];

    // u1_m0_wo0_wi0_r0_memr0(DUALMEM,142)@14
    assign u1_m0_wo0_wi0_r0_memr0_ia = $unsigned(d_xIn_1_14_mem_q);
    assign u1_m0_wo0_wi0_r0_memr0_aa = u1_m0_wo0_wi0_r0_wa0_q;
    assign u1_m0_wo0_wi0_r0_memr0_ab = u1_m0_wo0_wi0_r0_readReg0_q[3:0];
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

    // u1_m0_wo0_wi0_r0_delayr16_notEnable(LOGICAL,316)@14
    assign u1_m0_wo0_wi0_r0_delayr16_notEnable_q = $unsigned(~ (d_u1_m0_wo0_compute_q_14_q));

    // u1_m0_wo0_wi0_r0_delayr16_nor(LOGICAL,317)@14
    assign u1_m0_wo0_wi0_r0_delayr16_nor_q = ~ (u1_m0_wo0_wi0_r0_delayr16_notEnable_q | u1_m0_wo0_wi0_r0_delayr16_sticky_ena_q);

    // u1_m0_wo0_wi0_r0_delayr16_mem_last(CONSTANT,313)
    assign u1_m0_wo0_wi0_r0_delayr16_mem_last_q = $unsigned(4'b0110);

    // u1_m0_wo0_wi0_r0_delayr16_cmp(LOGICAL,314)@14
    assign u1_m0_wo0_wi0_r0_delayr16_cmp_b = {1'b0, u1_m0_wo0_wi0_r0_delayr16_rdmux_q};
    assign u1_m0_wo0_wi0_r0_delayr16_cmp_q = $unsigned(u1_m0_wo0_wi0_r0_delayr16_mem_last_q == u1_m0_wo0_wi0_r0_delayr16_cmp_b ? 1'b1 : 1'b0);

    // u1_m0_wo0_wi0_r0_delayr16_cmpReg(REG,315)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr16_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u1_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr16_cmpReg_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr16_cmp_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr16_sticky_ena(REG,318)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr16_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u1_m0_wo0_wi0_r0_delayr16_nor_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr16_sticky_ena_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr16_cmpReg_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr16_enaAnd(LOGICAL,319)@14
    assign u1_m0_wo0_wi0_r0_delayr16_enaAnd_q = u1_m0_wo0_wi0_r0_delayr16_sticky_ena_q & d_u1_m0_wo0_compute_q_14_q;

    // u1_m0_wo0_wi0_r0_delayr16_rdcnt(COUNTER,310)@14 + 1
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr16_rdcnt_i <= 3'd0;
        end
        else if (d_u1_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr16_rdcnt_i <= $unsigned(u1_m0_wo0_wi0_r0_delayr16_rdcnt_i) + $unsigned(3'd1);
        end
    end
    assign u1_m0_wo0_wi0_r0_delayr16_rdcnt_q = u1_m0_wo0_wi0_r0_delayr16_rdcnt_i[2:0];

    // u1_m0_wo0_wi0_r0_delayr16_rdmux(MUX,311)@14
    assign u1_m0_wo0_wi0_r0_delayr16_rdmux_s = d_u1_m0_wo0_compute_q_14_q;
    always @(u1_m0_wo0_wi0_r0_delayr16_rdmux_s or u1_m0_wo0_wi0_r0_delayr16_wraddr_q or u1_m0_wo0_wi0_r0_delayr16_rdcnt_q)
    begin
        unique case (u1_m0_wo0_wi0_r0_delayr16_rdmux_s)
            1'b0 : u1_m0_wo0_wi0_r0_delayr16_rdmux_q = u1_m0_wo0_wi0_r0_delayr16_wraddr_q;
            1'b1 : u1_m0_wo0_wi0_r0_delayr16_rdmux_q = u1_m0_wo0_wi0_r0_delayr16_rdcnt_q;
            default : u1_m0_wo0_wi0_r0_delayr16_rdmux_q = 3'b0;
        endcase
    end

    // u1_m0_wo0_wi0_r0_join16(BITJOIN,161)@14
    assign u1_m0_wo0_wi0_r0_join16_q = {u1_m0_wo0_wi0_r0_split16_d, u1_m0_wo0_wi0_r0_split16_c, u1_m0_wo0_wi0_r0_split16_b, u1_m0_wo0_wi0_r0_split12_e};

    // u1_m0_wo0_wi0_r0_delayr16_wraddr(REG,312)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr16_wraddr_q <= $unsigned(3'b111);
        end
        else
        begin
            u1_m0_wo0_wi0_r0_delayr16_wraddr_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr16_rdmux_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr16_mem(DUALMEM,309)@14 + 2
    assign u1_m0_wo0_wi0_r0_delayr16_mem_ia = $unsigned(u1_m0_wo0_wi0_r0_join16_q);
    assign u1_m0_wo0_wi0_r0_delayr16_mem_aa = u1_m0_wo0_wi0_r0_delayr16_wraddr_q;
    assign u1_m0_wo0_wi0_r0_delayr16_mem_ab = u1_m0_wo0_wi0_r0_delayr16_rdmux_q;
    assign u1_m0_wo0_wi0_r0_delayr16_mem_ena_OrRstB = areset | u1_m0_wo0_wi0_r0_delayr16_enaAnd_q[0];
    assign u1_m0_wo0_wi0_r0_delayr16_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(64),
        .widthad_b(3),
        .numwords_b(8),
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
    ) u1_m0_wo0_wi0_r0_delayr16_mem_dmem (
        .clocken1(u1_m0_wo0_wi0_r0_delayr16_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u1_m0_wo0_wi0_r0_delayr16_mem_reset0),
        .clock1(clk),
        .address_a(u1_m0_wo0_wi0_r0_delayr16_mem_aa),
        .data_a(u1_m0_wo0_wi0_r0_delayr16_mem_ia),
        .wren_a(d_u1_m0_wo0_compute_q_14_q[0]),
        .address_b(u1_m0_wo0_wi0_r0_delayr16_mem_ab),
        .q_b(u1_m0_wo0_wi0_r0_delayr16_mem_iq),
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
    assign u1_m0_wo0_wi0_r0_delayr16_mem_q = u1_m0_wo0_wi0_r0_delayr16_mem_iq[63:0];

    // u1_m0_wo0_wi0_r0_split16(BITSELECT,162)@14
    assign u1_m0_wo0_wi0_r0_split16_b = $unsigned(u1_m0_wo0_wi0_r0_delayr16_mem_q[15:0]);
    assign u1_m0_wo0_wi0_r0_split16_c = $unsigned(u1_m0_wo0_wi0_r0_delayr16_mem_q[31:16]);
    assign u1_m0_wo0_wi0_r0_split16_d = $unsigned(u1_m0_wo0_wi0_r0_delayr16_mem_q[47:32]);
    assign u1_m0_wo0_wi0_r0_split16_e = $unsigned(u1_m0_wo0_wi0_r0_delayr16_mem_q[63:48]);

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // u1_m0_wo0_aseq(SEQUENCE,192)@13 + 1
    always @ (posedge clk)
    begin
        reg [4:0] u1_m0_wo0_aseq_c;
        if (areset)
        begin
            u1_m0_wo0_aseq_c = 5'b00000;
            u1_m0_wo0_aseq_q <= $unsigned(1'b0);
            u1_m0_wo0_aseq_eq <= 1'b0;
        end
        else
        begin
            if (u1_m0_wo0_compute_q == 1'b1)
            begin
                if (u1_m0_wo0_aseq_c == 5'b11111)
                begin
                    u1_m0_wo0_aseq_eq <= 1'b1;
                end
                else
                begin
                    u1_m0_wo0_aseq_eq <= 1'b0;
                end
                if (u1_m0_wo0_aseq_eq == 1'b1)
                begin
                    u1_m0_wo0_aseq_c = $signed(u1_m0_wo0_aseq_c) + $signed(5'd3);
                end
                else
                begin
                    u1_m0_wo0_aseq_c = $signed(u1_m0_wo0_aseq_c) - $signed(5'd1);
                end
                u1_m0_wo0_aseq_q <= $unsigned(u1_m0_wo0_aseq_c[4:4]);
            end
        end
    end

    // d_u1_m0_wo0_compute_q_17(DELAY,226)@14 + 3
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

    // d_u1_m0_wo0_compute_q_14(DELAY,225)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u1_m0_wo0_compute_q_14_q <= $unsigned(u1_m0_wo0_compute_q);
        end
    end

    // u1_m0_wo0_cma0(CHAINMULTADD,190)@14 + 5
    assign u1_m0_wo0_cma0_reset = areset;
    assign u1_m0_wo0_cma0_ena0 = d_u1_m0_wo0_compute_q_14_q[0] | u1_m0_wo0_cma0_reset;
    assign u1_m0_wo0_cma0_ena1 = d_u1_m0_wo0_compute_q_17_q[0] | u1_m0_wo0_cma0_reset;
    assign u1_m0_wo0_cma0_ena2 = 1'b1;

    assign u1_m0_wo0_cma0_a0 = $unsigned(u1_m0_wo0_wi0_r0_split16_e);
    assign u1_m0_wo0_cma0_b0 = $unsigned(u1_m0_wo0_wi0_r0_memr0_q);
    assign u1_m0_wo0_cma0_c0 = {2'b00, u1_m0_wo0_ca8_1_q[0:0]};
    assign u1_m0_wo0_cma0_a1 = $unsigned(u1_m0_wo0_wi0_r0_split16_d);
    assign u1_m0_wo0_cma0_b1 = $unsigned(u1_m0_wo0_wi0_r0_split1_b);
    assign u1_m0_wo0_cma0_c1 = {2'b00, u1_m0_wo0_ca9_1_q[0:0]};
    assign u1_m0_wo0_cma0_a2 = $unsigned(u1_m0_wo0_wi0_r0_split16_c);
    assign u1_m0_wo0_cma0_b2 = $unsigned(u1_m0_wo0_wi0_r0_split1_c);
    assign u1_m0_wo0_cma0_c2 = {2'b00, u1_m0_wo0_ca8_1_q[0:0]};
    assign u1_m0_wo0_cma0_a3 = $unsigned(u1_m0_wo0_wi0_r0_split16_b);
    assign u1_m0_wo0_cma0_b3 = $unsigned(u1_m0_wo0_wi0_r0_split1_d);
    assign u1_m0_wo0_cma0_c3 = {2'b00, u1_m0_wo0_ca9_1_q[0:0]};
    assign u1_m0_wo0_cma0_a4 = $unsigned(u1_m0_wo0_wi0_r0_split12_e);
    assign u1_m0_wo0_cma0_b4 = $unsigned(u1_m0_wo0_wi0_r0_split1_e);
    assign u1_m0_wo0_cma0_c4 = {2'b00, u1_m0_wo0_ca8_1_q[0:0]};
    assign u1_m0_wo0_cma0_a5 = $unsigned(u1_m0_wo0_wi0_r0_split12_d);
    assign u1_m0_wo0_cma0_b5 = $unsigned(u1_m0_wo0_wi0_r0_split5_b);
    assign u1_m0_wo0_cma0_c5 = {2'b00, u1_m0_wo0_ca9_1_q[0:0]};
    assign u1_m0_wo0_cma0_a6 = $unsigned(u1_m0_wo0_wi0_r0_split12_c);
    assign u1_m0_wo0_cma0_b6 = $unsigned(u1_m0_wo0_wi0_r0_split5_c);
    assign u1_m0_wo0_cma0_c6 = {2'b00, u1_m0_wo0_ca8_1_q[0:0]};
    assign u1_m0_wo0_cma0_a7 = $unsigned(u1_m0_wo0_wi0_r0_split12_b);
    assign u1_m0_wo0_cma0_b7 = $unsigned(u1_m0_wo0_wi0_r0_split5_d);
    assign u1_m0_wo0_cma0_c7 = {2'b00, u1_m0_wo0_ca9_1_q[0:0]};
    assign u1_m0_wo0_cma0_a8 = $unsigned(u1_m0_wo0_wi0_r0_memr11_q);
    assign u1_m0_wo0_cma0_b8 = $unsigned(u1_m0_wo0_wi0_r0_split5_e);
    assign u1_m0_wo0_cma0_c8 = {2'b00, u1_m0_wo0_ca8_1_q[0:0]};
    assign u1_m0_wo0_cma0_a9 = $unsigned($signed({15'b000000000000000, GND_q[0:0]}));
    assign u1_m0_wo0_cma0_b9 = $unsigned(u1_m0_wo0_wi0_r0_memr9_q);
    assign u1_m0_wo0_cma0_c9 = {2'b00, u1_m0_wo0_ca9_1_q[0:0]};
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
        .coef_a_0(16384),
        .coef_a_1(0),
        .coef_b_0(10402),
        .coef_b_1(-3393),
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
        .ay(u1_m0_wo0_cma0_a9),
        .by(u1_m0_wo0_cma0_a8),
        .az(u1_m0_wo0_cma0_b9),
        .bz(u1_m0_wo0_cma0_b8),
        .coefsela(u1_m0_wo0_cma0_c9),
        .coefselb(u1_m0_wo0_cma0_c8),
        .chainout(u1_m0_wo0_cma0_s8),
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
        .coef_a_0(1947),
        .coef_a_1(-1302),
        .coef_b_0(-677),
        .coef_b_1(925),
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
        .ay(u1_m0_wo0_cma0_a7),
        .by(u1_m0_wo0_cma0_a6),
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
        .bx(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
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
        .coef_a_0(-367),
        .coef_a_1(498),
        .coef_b_0(266),
        .coef_b_1(-191),
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
        .ay(u1_m0_wo0_cma0_a5),
        .by(u1_m0_wo0_cma0_a4),
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
        .bx(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
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
        .coef_a_0(133),
        .coef_a_1(-91),
        .coef_b_0(-38),
        .coef_b_1(59),
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
        .chainin(u1_m0_wo0_cma0_s4),
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
        .coef_a_0(-13),
        .coef_a_1(22),
        .coef_b_0(6),
        .coef_b_1(-3),
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
        .enable_double_accum("true"),
        .output_clken("1"),
        .result_a_width(39)
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
    dspba_delay_ver #( .width(39), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u1_m0_wo0_cma0_delay0 ( .xin(u1_m0_wo0_cma0_s0), .xout(u1_m0_wo0_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u1_m0_wo0_cma0_q = $unsigned(u1_m0_wo0_cma0_qq0[38:0]);

    // d_u1_m0_wo0_compute_q_18(DELAY,227)@17 + 1
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

    // u1_m0_wo0_oseq(SEQUENCE,194)@17 + 1
    always @ (posedge clk)
    begin
        reg [4:0] u1_m0_wo0_oseq_c;
        if (areset)
        begin
            u1_m0_wo0_oseq_c = 5'b00010;
            u1_m0_wo0_oseq_q <= $unsigned(1'b0);
            u1_m0_wo0_oseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u1_m0_wo0_compute_q_17_q == 1'b1)
            begin
                if (u1_m0_wo0_oseq_c == 5'b11111)
                begin
                    u1_m0_wo0_oseq_eq <= 1'b1;
                end
                else
                begin
                    u1_m0_wo0_oseq_eq <= 1'b0;
                end
                if (u1_m0_wo0_oseq_eq == 1'b1)
                begin
                    u1_m0_wo0_oseq_c = $signed(u1_m0_wo0_oseq_c) + $signed(5'd3);
                end
                else
                begin
                    u1_m0_wo0_oseq_c = $signed(u1_m0_wo0_oseq_c) - $signed(5'd1);
                end
                u1_m0_wo0_oseq_q <= $unsigned(u1_m0_wo0_oseq_c[4:4]);
            end
        end
    end

    // u1_m0_wo0_oseq_gated(LOGICAL,195)@18
    assign u1_m0_wo0_oseq_gated_q = u1_m0_wo0_oseq_q & d_u1_m0_wo0_compute_q_18_q;

    // u1_m0_wo0_oseq_gated_reg(REG,196)@18 + 1
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

    // u0_m0_wo0_run(ENABLEGENERATOR,16)@11 + 2
    assign u0_m0_wo0_run_ctrl = { u0_m0_wo0_run_out, u0_m0_wo0_inputframe_q, u0_m0_wo0_run_enableQ };
    always @ (posedge clk)
    begin
        reg [2:0] u0_m0_wo0_run_enable_c;
        reg [2:0] u0_m0_wo0_run_inc;
        if (areset)
        begin
            u0_m0_wo0_run_q <= $unsigned(1'b0);
            u0_m0_wo0_run_enable_c = 3'd2;
            u0_m0_wo0_run_enableQ <= $unsigned(1'b0);
            u0_m0_wo0_run_count <= $unsigned(3'b000);
            u0_m0_wo0_run_inc = 3'b0;
        end
        else
        begin
            if (u0_m0_wo0_run_out == 1'b1)
            begin
                if (u0_m0_wo0_run_enable_c[2] == 1'b1)
                begin
                    u0_m0_wo0_run_enable_c = $signed(u0_m0_wo0_run_enable_c) - $signed(-3'd3);
                end
                else
                begin
                    u0_m0_wo0_run_enable_c = $signed(u0_m0_wo0_run_enable_c) + $signed(-3'd1);
                end
                u0_m0_wo0_run_enableQ <= $unsigned(u0_m0_wo0_run_enable_c[2:2]);
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

    // u0_m0_wo0_memread(DELAY,17)@13
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

    // u0_m0_wo0_wi0_r0_ra9_count1_inner(COUNTER,33)@13
    // low=-1, high=0, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra9_count1_inner_i <= 1'd0;
            u0_m0_wo0_wi0_r0_ra9_count1_inner_eq <= 1'b1;
        end
        else if (u0_m0_wo0_memread_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra9_count1_inner_eq == 1'b0)
            begin
                u0_m0_wo0_wi0_r0_ra9_count1_inner_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra9_count1_inner_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_ra9_count1_inner_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra9_count1_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra9_count1_inner_i) + $signed(-1'd1);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra9_count1_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra9_count1_inner_i) + $signed(1'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra9_count1_inner_q = $unsigned(u0_m0_wo0_wi0_r0_ra9_count1_inner_i[0:0]);

    // u0_m0_wo0_wi0_r0_ra9_count1_run(LOGICAL,34)@13
    assign u0_m0_wo0_wi0_r0_ra9_count1_run_q = $unsigned(u0_m0_wo0_wi0_r0_ra9_count1_inner_q[0:0]);

    // u0_m0_wo0_wi0_r0_ra9_count1(COUNTER,35)@13
    // low=0, high=33, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra9_count1_i <= 6'd1;
            u0_m0_wo0_wi0_r0_ra9_count1_eq <= 1'b0;
        end
        else if (u0_m0_wo0_memread_q == 1'b1 & u0_m0_wo0_wi0_r0_ra9_count1_run_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra9_count1_i == 6'd32)
            begin
                u0_m0_wo0_wi0_r0_ra9_count1_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra9_count1_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_ra9_count1_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra9_count1_i <= $unsigned(u0_m0_wo0_wi0_r0_ra9_count1_i) + $unsigned(6'd31);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra9_count1_i <= $unsigned(u0_m0_wo0_wi0_r0_ra9_count1_i) + $unsigned(6'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra9_count1_q = u0_m0_wo0_wi0_r0_ra9_count1_i[5:0];

    // u0_m0_wo0_wi0_r0_ra9_count1_lut(LOOKUP,31)@13
    always @(u0_m0_wo0_wi0_r0_ra9_count1_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra9_count1_q)
            6'b000000 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00000000;
            6'b000001 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00000010;
            6'b000010 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00000100;
            6'b000011 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00000110;
            6'b000100 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00001000;
            6'b000101 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00001010;
            6'b000110 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00001100;
            6'b000111 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00001110;
            6'b001000 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00010000;
            6'b001001 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00010010;
            6'b001010 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00010100;
            6'b001011 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00010110;
            6'b001100 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00011000;
            6'b001101 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00011010;
            6'b001110 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00011100;
            6'b001111 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00011110;
            6'b010000 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00100000;
            6'b010001 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00100010;
            6'b010010 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00100100;
            6'b010011 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00100110;
            6'b010100 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00101000;
            6'b010101 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00101010;
            6'b010110 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00101100;
            6'b010111 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00101110;
            6'b011000 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00110000;
            6'b011001 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00110010;
            6'b011010 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00110100;
            6'b011011 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00110110;
            6'b011100 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00111000;
            6'b011101 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00111010;
            6'b011110 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00111100;
            6'b011111 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00111110;
            6'b100000 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b01000000;
            6'b100001 : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b01000010;
            default : u0_m0_wo0_wi0_r0_ra9_count1_lut_q = 8'b00000000;
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_ra9_count1_lutreg(REG,32)@13
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra9_count1_lutreg_q <= $unsigned(8'b00000000);
        end
        else if (u0_m0_wo0_memread_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra9_count1_lutreg_q <= $unsigned(u0_m0_wo0_wi0_r0_ra9_count1_lut_q);
        end
    end

    // u0_m0_wo0_wi0_r0_ra9_count0(COUNTER,30)@13
    // low=0, high=1, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra9_count0_i <= 1'd1;
        end
        else if (u0_m0_wo0_memread_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra9_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra9_count0_i) + $unsigned(1'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra9_count0_q = {1'b0, u0_m0_wo0_wi0_r0_ra9_count0_i[0:0]};

    // u0_m0_wo0_wi0_r0_ra9_add_0_0(ADD,36)@13 + 1
    assign u0_m0_wo0_wi0_r0_ra9_add_0_0_a = $unsigned({{7{u0_m0_wo0_wi0_r0_ra9_count0_q[1]}}, u0_m0_wo0_wi0_r0_ra9_count0_q});
    assign u0_m0_wo0_wi0_r0_ra9_add_0_0_b = $unsigned({{1{u0_m0_wo0_wi0_r0_ra9_count1_lutreg_q[7]}}, u0_m0_wo0_wi0_r0_ra9_count1_lutreg_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra9_add_0_0_o <= 9'b0;
        end
        else
        begin
            u0_m0_wo0_wi0_r0_ra9_add_0_0_o <= $unsigned($signed(u0_m0_wo0_wi0_r0_ra9_add_0_0_a) + $signed(u0_m0_wo0_wi0_r0_ra9_add_0_0_b));
        end
    end
    assign u0_m0_wo0_wi0_r0_ra9_add_0_0_q = u0_m0_wo0_wi0_r0_ra9_add_0_0_o[8:0];

    // u0_m0_wo0_wi0_r0_readReg9(DELAY,53)@14
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_readReg9_q <= u0_m0_wo0_wi0_r0_ra9_add_0_0_q;
        end
    end

    // d_xIn_0_14_notEnable(LOGICAL,326)@10
    assign d_xIn_0_14_notEnable_q = $unsigned(~ (VCC_q));

    // d_xIn_0_14_nor(LOGICAL,327)@10
    assign d_xIn_0_14_nor_q = ~ (d_xIn_0_14_notEnable_q | d_xIn_0_14_sticky_ena_q);

    // d_xIn_0_14_mem_last(CONSTANT,323)
    assign d_xIn_0_14_mem_last_q = $unsigned(2'b01);

    // d_xIn_0_14_cmp(LOGICAL,324)@10
    assign d_xIn_0_14_cmp_q = $unsigned(d_xIn_0_14_mem_last_q == d_xIn_0_14_rdcnt_q ? 1'b1 : 1'b0);

    // d_xIn_0_14_cmpReg(REG,325)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_0_14_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_xIn_0_14_cmpReg_q <= $unsigned(d_xIn_0_14_cmp_q);
        end
    end

    // d_xIn_0_14_sticky_ena(REG,328)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_0_14_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_xIn_0_14_nor_q == 1'b1)
        begin
            d_xIn_0_14_sticky_ena_q <= $unsigned(d_xIn_0_14_cmpReg_q);
        end
    end

    // d_xIn_0_14_enaAnd(LOGICAL,329)@10
    assign d_xIn_0_14_enaAnd_q = d_xIn_0_14_sticky_ena_q & VCC_q;

    // d_xIn_0_14_rdcnt(COUNTER,321)@10 + 1
    // low=0, high=2, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_0_14_rdcnt_i <= 2'd0;
            d_xIn_0_14_rdcnt_eq <= 1'b0;
        end
        else
        begin
            if (d_xIn_0_14_rdcnt_i == 2'd1)
            begin
                d_xIn_0_14_rdcnt_eq <= 1'b1;
            end
            else
            begin
                d_xIn_0_14_rdcnt_eq <= 1'b0;
            end
            if (d_xIn_0_14_rdcnt_eq == 1'b1)
            begin
                d_xIn_0_14_rdcnt_i <= $unsigned(d_xIn_0_14_rdcnt_i) + $unsigned(2'd2);
            end
            else
            begin
                d_xIn_0_14_rdcnt_i <= $unsigned(d_xIn_0_14_rdcnt_i) + $unsigned(2'd1);
            end
        end
    end
    assign d_xIn_0_14_rdcnt_q = d_xIn_0_14_rdcnt_i[1:0];

    // d_xIn_0_14_wraddr(REG,322)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_0_14_wraddr_q <= $unsigned(2'b10);
        end
        else
        begin
            d_xIn_0_14_wraddr_q <= $unsigned(d_xIn_0_14_rdcnt_q);
        end
    end

    // d_xIn_0_14_mem(DUALMEM,320)@10 + 2
    assign d_xIn_0_14_mem_ia = $unsigned(xIn_0);
    assign d_xIn_0_14_mem_aa = d_xIn_0_14_wraddr_q;
    assign d_xIn_0_14_mem_ab = d_xIn_0_14_rdcnt_q;
    assign d_xIn_0_14_mem_ena_OrRstB = areset | d_xIn_0_14_enaAnd_q[0];
    assign d_xIn_0_14_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(3),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(3),
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
    ) d_xIn_0_14_mem_dmem (
        .clocken1(d_xIn_0_14_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_xIn_0_14_mem_reset0),
        .clock1(clk),
        .address_a(d_xIn_0_14_mem_aa),
        .data_a(d_xIn_0_14_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_xIn_0_14_mem_ab),
        .q_b(d_xIn_0_14_mem_iq),
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
    assign d_xIn_0_14_mem_q = d_xIn_0_14_mem_iq[15:0];

    // u0_m0_wo0_wi0_r0_wa9(COUNTER,46)@14
    // low=0, high=67, step=1, init=64
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa9_i <= 7'd64;
            u0_m0_wo0_wi0_r0_wa9_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_14_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_wa9_i == 7'd66)
            begin
                u0_m0_wo0_wi0_r0_wa9_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_wa9_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_wa9_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_wa9_i <= $unsigned(u0_m0_wo0_wi0_r0_wa9_i) + $unsigned(7'd61);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_wa9_i <= $unsigned(u0_m0_wo0_wi0_r0_wa9_i) + $unsigned(7'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_wa9_q = u0_m0_wo0_wi0_r0_wa9_i[6:0];

    // u0_m0_wo0_wi0_r0_memr9(DUALMEM,51)@14
    assign u0_m0_wo0_wi0_r0_memr9_ia = $unsigned(d_xIn_0_14_mem_q);
    assign u0_m0_wo0_wi0_r0_memr9_aa = u0_m0_wo0_wi0_r0_wa9_q;
    assign u0_m0_wo0_wi0_r0_memr9_ab = u0_m0_wo0_wi0_r0_readReg9_q[6:0];
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(7),
        .numwords_a(68),
        .width_b(16),
        .widthad_b(7),
        .numwords_b(68),
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
    ) u0_m0_wo0_wi0_r0_memr9_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_wi0_r0_memr9_aa),
        .data_a(u0_m0_wo0_wi0_r0_memr9_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_14_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_memr9_ab),
        .q_b(u0_m0_wo0_wi0_r0_memr9_iq),
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
    assign u0_m0_wo0_wi0_r0_memr9_q = u0_m0_wo0_wi0_r0_memr9_iq[15:0];

    // d_u0_m0_wo0_wi0_r0_ra9_count1_run_q_14(DELAY,223)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m0_wo0_wi0_r0_ra9_count1_run_q_14_q <= '0;
        end
        else
        begin
            d_u0_m0_wo0_wi0_r0_ra9_count1_run_q_14_q <= $unsigned(u0_m0_wo0_wi0_r0_ra9_count1_run_q);
        end
    end

    // d_u0_m0_wo0_memread_q_14(DELAY,218)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m0_wo0_memread_q_14_q <= '0;
        end
        else
        begin
            d_u0_m0_wo0_memread_q_14_q <= $unsigned(u0_m0_wo0_memread_q);
        end
    end

    // u0_m0_wo0_wi0_r0_ra11_count1(COUNTER,41)@14
    // low=0, high=5, step=-2, init=2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra11_count1_i <= 3'd2;
            u0_m0_wo0_wi0_r0_ra11_count1_eq <= 1'b0;
        end
        else if (d_u0_m0_wo0_memread_q_14_q == 1'b1 & d_u0_m0_wo0_wi0_r0_ra9_count1_run_q_14_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra11_count1_i == 3'd2)
            begin
                u0_m0_wo0_wi0_r0_ra11_count1_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra11_count1_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_ra11_count1_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra11_count1_i <= $unsigned(u0_m0_wo0_wi0_r0_ra11_count1_i) - $unsigned(3'd4);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra11_count1_i <= $unsigned(u0_m0_wo0_wi0_r0_ra11_count1_i) - $unsigned(3'd2);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra11_count1_q = {1'b0, u0_m0_wo0_wi0_r0_ra11_count1_i[2:0]};

    // u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_b(BITSELECT,209)@14
    assign u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_b_in = $unsigned({{1{u0_m0_wo0_wi0_r0_ra11_count1_q[3]}}, u0_m0_wo0_wi0_r0_ra11_count1_q});
    assign u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_b_b = $unsigned(u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_b_in[2:1]);

    // u0_m0_wo0_wi0_r0_ra0_count0(COUNTER,22)@13
    // low=0, high=1, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count0_i <= 1'd0;
        end
        else if (u0_m0_wo0_memread_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra0_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count0_i) + $unsigned(1'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_count0_q = {1'b0, u0_m0_wo0_wi0_r0_ra0_count0_i[0:0]};

    // d_u0_m0_wo0_wi0_r0_ra0_count0_q_14(DELAY,222)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m0_wo0_wi0_r0_ra0_count0_q_14_q <= '0;
        end
        else
        begin
            d_u0_m0_wo0_wi0_r0_ra0_count0_q_14_q <= u0_m0_wo0_wi0_r0_ra0_count0_q;
        end
    end

    // u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_a(BITSELECT,208)@14
    assign u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_a_in = $unsigned({{3{d_u0_m0_wo0_wi0_r0_ra0_count0_q_14_q[1]}}, d_u0_m0_wo0_wi0_r0_ra0_count0_q_14_q});
    assign u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_a_b = $unsigned(u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_a_in[0:0]);

    // u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_join(BITJOIN,210)@14
    assign u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_join_q = {GND_q, GND_q, u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_b_b, u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_BitSelect_for_a_b};

    // u0_m0_wo0_wi0_r0_readReg11(DELAY,56)@14
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_readReg11_q <= u0_m0_wo0_wi0_r0_ra11_add_0_0_replace_or_join_q;
        end
    end

    // u0_m0_wo0_compute(DELAY,19)@13
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

    // u0_m0_wo0_wi0_r0_we11_seq(SEQUENCE,44)@13 + 1
    always @ (posedge clk)
    begin
        reg [4:0] u0_m0_wo0_wi0_r0_we11_seq_c;
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_we11_seq_c = 5'b00000;
            u0_m0_wo0_wi0_r0_we11_seq_q <= $unsigned(1'b0);
            u0_m0_wo0_wi0_r0_we11_seq_eq <= 1'b0;
        end
        else
        begin
            if (u0_m0_wo0_compute_q == 1'b1)
            begin
                if (u0_m0_wo0_wi0_r0_we11_seq_c == 5'b11111)
                begin
                    u0_m0_wo0_wi0_r0_we11_seq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_wi0_r0_we11_seq_eq <= 1'b0;
                end
                if (u0_m0_wo0_wi0_r0_we11_seq_eq == 1'b1)
                begin
                    u0_m0_wo0_wi0_r0_we11_seq_c = $signed(u0_m0_wo0_wi0_r0_we11_seq_c) + $signed(5'd3);
                end
                else
                begin
                    u0_m0_wo0_wi0_r0_we11_seq_c = $signed(u0_m0_wo0_wi0_r0_we11_seq_c) - $signed(5'd1);
                end
                u0_m0_wo0_wi0_r0_we11_seq_q <= $unsigned(u0_m0_wo0_wi0_r0_we11_seq_c[4:4]);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_we11_seq_q <= $unsigned(1'b0);
            end
        end
    end

    // u0_m0_wo0_wi0_r0_wa11(COUNTER,47)@14
    // low=0, high=5, step=1, init=4
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa11_i <= 3'd4;
            u0_m0_wo0_wi0_r0_wa11_eq <= 1'b0;
        end
        else if (u0_m0_wo0_wi0_r0_we11_seq_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_wa11_i == 3'd4)
            begin
                u0_m0_wo0_wi0_r0_wa11_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_wa11_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_wa11_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_wa11_i <= $unsigned(u0_m0_wo0_wi0_r0_wa11_i) + $unsigned(3'd3);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_wa11_i <= $unsigned(u0_m0_wo0_wi0_r0_wa11_i) + $unsigned(3'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_wa11_q = u0_m0_wo0_wi0_r0_wa11_i[2:0];

    // u0_m0_wo0_wi0_r0_memr11(DUALMEM,54)@14
    assign u0_m0_wo0_wi0_r0_memr11_ia = $unsigned(u0_m0_wo0_wi0_r0_split5_e);
    assign u0_m0_wo0_wi0_r0_memr11_aa = u0_m0_wo0_wi0_r0_wa11_q;
    assign u0_m0_wo0_wi0_r0_memr11_ab = u0_m0_wo0_wi0_r0_readReg11_q[2:0];
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
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_memr11_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_wi0_r0_memr11_aa),
        .data_a(u0_m0_wo0_wi0_r0_memr11_ia),
        .wren_a(u0_m0_wo0_wi0_r0_we11_seq_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_memr11_ab),
        .q_b(u0_m0_wo0_wi0_r0_memr11_iq),
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
    assign u0_m0_wo0_wi0_r0_memr11_q = u0_m0_wo0_wi0_r0_memr11_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr5_notEnable(LOGICAL,250)@14
    assign u0_m0_wo0_wi0_r0_delayr5_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_14_q));

    // u0_m0_wo0_wi0_r0_delayr5_nor(LOGICAL,251)@14
    assign u0_m0_wo0_wi0_r0_delayr5_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr5_notEnable_q | u0_m0_wo0_wi0_r0_delayr5_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr5_mem_last(CONSTANT,247)
    assign u0_m0_wo0_wi0_r0_delayr5_mem_last_q = $unsigned(4'b0100);

    // u0_m0_wo0_wi0_r0_delayr5_cmp(LOGICAL,248)@14
    assign u0_m0_wo0_wi0_r0_delayr5_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr5_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr5_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr5_mem_last_q == u0_m0_wo0_wi0_r0_delayr5_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr5_cmpReg(REG,249)@14 + 1
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

    // u0_m0_wo0_wi0_r0_delayr5_sticky_ena(REG,252)@14 + 1
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

    // u0_m0_wo0_wi0_r0_delayr5_enaAnd(LOGICAL,253)@14
    assign u0_m0_wo0_wi0_r0_delayr5_enaAnd_q = u0_m0_wo0_wi0_r0_delayr5_sticky_ena_q & d_u0_m0_wo0_compute_q_14_q;

    // u0_m0_wo0_wi0_r0_delayr5_rdcnt(COUNTER,244)@14 + 1
    // low=0, high=5, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr5_rdcnt_i <= 3'd0;
            u0_m0_wo0_wi0_r0_delayr5_rdcnt_eq <= 1'b0;
        end
        else if (d_u0_m0_wo0_compute_q_14_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_delayr5_rdcnt_i == 3'd4)
            begin
                u0_m0_wo0_wi0_r0_delayr5_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr5_rdcnt_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_delayr5_rdcnt_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_delayr5_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr5_rdcnt_i) + $unsigned(3'd3);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr5_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr5_rdcnt_i) + $unsigned(3'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr5_rdcnt_q = u0_m0_wo0_wi0_r0_delayr5_rdcnt_i[2:0];

    // u0_m0_wo0_wi0_r0_delayr5_rdmux(MUX,245)@14
    assign u0_m0_wo0_wi0_r0_delayr5_rdmux_s = d_u0_m0_wo0_compute_q_14_q;
    always @(u0_m0_wo0_wi0_r0_delayr5_rdmux_s or u0_m0_wo0_wi0_r0_delayr5_wraddr_q or u0_m0_wo0_wi0_r0_delayr5_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr5_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr5_rdmux_q = u0_m0_wo0_wi0_r0_delayr5_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr5_rdmux_q = u0_m0_wo0_wi0_r0_delayr5_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr5_rdmux_q = 3'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join5(BITJOIN,60)@14
    assign u0_m0_wo0_wi0_r0_join5_q = {u0_m0_wo0_wi0_r0_split5_d, u0_m0_wo0_wi0_r0_split5_c, u0_m0_wo0_wi0_r0_split5_b, u0_m0_wo0_wi0_r0_split1_e};

    // u0_m0_wo0_wi0_r0_delayr5_wraddr(REG,246)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr5_wraddr_q <= $unsigned(3'b101);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr5_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr5_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr5_mem(DUALMEM,243)@14 + 2
    assign u0_m0_wo0_wi0_r0_delayr5_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join5_q);
    assign u0_m0_wo0_wi0_r0_delayr5_mem_aa = u0_m0_wo0_wi0_r0_delayr5_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr5_mem_ab = u0_m0_wo0_wi0_r0_delayr5_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr5_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr5_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr5_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(3),
        .numwords_a(6),
        .width_b(64),
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
    assign u0_m0_wo0_wi0_r0_delayr5_mem_q = u0_m0_wo0_wi0_r0_delayr5_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split5(BITSELECT,61)@14
    assign u0_m0_wo0_wi0_r0_split5_b = $unsigned(u0_m0_wo0_wi0_r0_delayr5_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split5_c = $unsigned(u0_m0_wo0_wi0_r0_delayr5_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split5_d = $unsigned(u0_m0_wo0_wi0_r0_delayr5_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split5_e = $unsigned(u0_m0_wo0_wi0_r0_delayr5_mem_q[63:48]);

    // u0_m0_wo0_wi0_r0_delayr12_notEnable(LOGICAL,261)@14
    assign u0_m0_wo0_wi0_r0_delayr12_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_14_q));

    // u0_m0_wo0_wi0_r0_delayr12_nor(LOGICAL,262)@14
    assign u0_m0_wo0_wi0_r0_delayr12_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr12_notEnable_q | u0_m0_wo0_wi0_r0_delayr12_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr12_mem_last(CONSTANT,258)
    assign u0_m0_wo0_wi0_r0_delayr12_mem_last_q = $unsigned(4'b0110);

    // u0_m0_wo0_wi0_r0_delayr12_cmp(LOGICAL,259)@14
    assign u0_m0_wo0_wi0_r0_delayr12_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr12_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr12_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr12_mem_last_q == u0_m0_wo0_wi0_r0_delayr12_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr12_cmpReg(REG,260)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr12_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr12_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr12_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr12_sticky_ena(REG,263)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr12_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr12_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr12_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr12_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr12_enaAnd(LOGICAL,264)@14
    assign u0_m0_wo0_wi0_r0_delayr12_enaAnd_q = u0_m0_wo0_wi0_r0_delayr12_sticky_ena_q & d_u0_m0_wo0_compute_q_14_q;

    // u0_m0_wo0_wi0_r0_delayr12_rdcnt(COUNTER,255)@14 + 1
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr12_rdcnt_i <= 3'd0;
        end
        else if (d_u0_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr12_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr12_rdcnt_i) + $unsigned(3'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr12_rdcnt_q = u0_m0_wo0_wi0_r0_delayr12_rdcnt_i[2:0];

    // u0_m0_wo0_wi0_r0_delayr12_rdmux(MUX,256)@14
    assign u0_m0_wo0_wi0_r0_delayr12_rdmux_s = d_u0_m0_wo0_compute_q_14_q;
    always @(u0_m0_wo0_wi0_r0_delayr12_rdmux_s or u0_m0_wo0_wi0_r0_delayr12_wraddr_q or u0_m0_wo0_wi0_r0_delayr12_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr12_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr12_rdmux_q = u0_m0_wo0_wi0_r0_delayr12_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr12_rdmux_q = u0_m0_wo0_wi0_r0_delayr12_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr12_rdmux_q = 3'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join12(BITJOIN,64)@14
    assign u0_m0_wo0_wi0_r0_join12_q = {u0_m0_wo0_wi0_r0_split12_d, u0_m0_wo0_wi0_r0_split12_c, u0_m0_wo0_wi0_r0_split12_b, u0_m0_wo0_wi0_r0_memr11_q};

    // u0_m0_wo0_wi0_r0_delayr12_wraddr(REG,257)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr12_wraddr_q <= $unsigned(3'b111);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr12_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr12_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr12_mem(DUALMEM,254)@14 + 2
    assign u0_m0_wo0_wi0_r0_delayr12_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join12_q);
    assign u0_m0_wo0_wi0_r0_delayr12_mem_aa = u0_m0_wo0_wi0_r0_delayr12_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr12_mem_ab = u0_m0_wo0_wi0_r0_delayr12_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr12_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr12_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr12_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(64),
        .widthad_b(3),
        .numwords_b(8),
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
    ) u0_m0_wo0_wi0_r0_delayr12_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr12_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr12_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr12_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr12_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_14_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr12_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr12_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr12_mem_q = u0_m0_wo0_wi0_r0_delayr12_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split12(BITSELECT,65)@14
    assign u0_m0_wo0_wi0_r0_split12_b = $unsigned(u0_m0_wo0_wi0_r0_delayr12_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split12_c = $unsigned(u0_m0_wo0_wi0_r0_delayr12_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split12_d = $unsigned(u0_m0_wo0_wi0_r0_delayr12_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split12_e = $unsigned(u0_m0_wo0_wi0_r0_delayr12_mem_q[63:48]);

    // u0_m0_wo0_ca9_1(REG,72)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_ca9_1_q <= $unsigned(1'b1);
        end
        else if (d_u0_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u0_m0_wo0_ca9_1_q <= u0_m0_wo0_ca8_1_q;
        end
    end

    // u0_m0_wo0_wi0_r0_delayr1_notEnable(LOGICAL,239)@14
    assign u0_m0_wo0_wi0_r0_delayr1_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_14_q));

    // u0_m0_wo0_wi0_r0_delayr1_nor(LOGICAL,240)@14
    assign u0_m0_wo0_wi0_r0_delayr1_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr1_notEnable_q | u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr1_mem_last(CONSTANT,236)
    assign u0_m0_wo0_wi0_r0_delayr1_mem_last_q = $unsigned(4'b0100);

    // u0_m0_wo0_wi0_r0_delayr1_cmp(LOGICAL,237)@14
    assign u0_m0_wo0_wi0_r0_delayr1_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr1_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr1_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr1_mem_last_q == u0_m0_wo0_wi0_r0_delayr1_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr1_cmpReg(REG,238)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr1_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr1_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr1_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr1_sticky_ena(REG,241)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr1_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr1_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr1_enaAnd(LOGICAL,242)@14
    assign u0_m0_wo0_wi0_r0_delayr1_enaAnd_q = u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q & d_u0_m0_wo0_compute_q_14_q;

    // u0_m0_wo0_wi0_r0_delayr1_rdcnt(COUNTER,233)@14 + 1
    // low=0, high=5, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr1_rdcnt_i <= 3'd0;
            u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq <= 1'b0;
        end
        else if (d_u0_m0_wo0_compute_q_14_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_delayr1_rdcnt_i == 3'd4)
            begin
                u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_delayr1_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr1_rdcnt_i) + $unsigned(3'd3);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr1_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr1_rdcnt_i) + $unsigned(3'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr1_rdcnt_q = u0_m0_wo0_wi0_r0_delayr1_rdcnt_i[2:0];

    // u0_m0_wo0_wi0_r0_delayr1_rdmux(MUX,234)@14
    assign u0_m0_wo0_wi0_r0_delayr1_rdmux_s = d_u0_m0_wo0_compute_q_14_q;
    always @(u0_m0_wo0_wi0_r0_delayr1_rdmux_s or u0_m0_wo0_wi0_r0_delayr1_wraddr_q or u0_m0_wo0_wi0_r0_delayr1_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr1_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr1_rdmux_q = u0_m0_wo0_wi0_r0_delayr1_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr1_rdmux_q = u0_m0_wo0_wi0_r0_delayr1_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr1_rdmux_q = 3'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join1(BITJOIN,57)@14
    assign u0_m0_wo0_wi0_r0_join1_q = {u0_m0_wo0_wi0_r0_split1_d, u0_m0_wo0_wi0_r0_split1_c, u0_m0_wo0_wi0_r0_split1_b, u0_m0_wo0_wi0_r0_memr0_q};

    // u0_m0_wo0_wi0_r0_delayr1_wraddr(REG,235)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr1_wraddr_q <= $unsigned(3'b101);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr1_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr1_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr1_mem(DUALMEM,232)@14 + 2
    assign u0_m0_wo0_wi0_r0_delayr1_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join1_q);
    assign u0_m0_wo0_wi0_r0_delayr1_mem_aa = u0_m0_wo0_wi0_r0_delayr1_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr1_mem_ab = u0_m0_wo0_wi0_r0_delayr1_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr1_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr1_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr1_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(3),
        .numwords_a(6),
        .width_b(64),
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
    ) u0_m0_wo0_wi0_r0_delayr1_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr1_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr1_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr1_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr1_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_14_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr1_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr1_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr1_mem_q = u0_m0_wo0_wi0_r0_delayr1_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split1(BITSELECT,58)@14
    assign u0_m0_wo0_wi0_r0_split1_b = $unsigned(u0_m0_wo0_wi0_r0_delayr1_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split1_c = $unsigned(u0_m0_wo0_wi0_r0_delayr1_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split1_d = $unsigned(u0_m0_wo0_wi0_r0_delayr1_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split1_e = $unsigned(u0_m0_wo0_wi0_r0_delayr1_mem_q[63:48]);

    // u0_m0_wo0_ca8_1_lut(LOOKUP,70)@14
    always @(u0_m0_wo0_ca9_1_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_ca9_1_q)
            1'b0 : u0_m0_wo0_ca8_1_lut_q = 1'b1;
            1'b1 : u0_m0_wo0_ca8_1_lut_q = 1'b0;
            default : begin
                          // unreachable
                          u0_m0_wo0_ca8_1_lut_q = 1'bx;
                      end
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_ca8_1(REG,71)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_ca8_1_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u0_m0_wo0_ca8_1_q <= u0_m0_wo0_ca8_1_lut_q;
        end
    end

    // u0_m0_wo0_wi0_r0_ra0_count1_inner(COUNTER,25)@13
    // low=-1, high=0, step=1, init=-1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count1_inner_i <= -1'd1;
            u0_m0_wo0_wi0_r0_ra0_count1_inner_eq <= 1'b0;
        end
        else if (u0_m0_wo0_memread_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra0_count1_inner_eq == 1'b0)
            begin
                u0_m0_wo0_wi0_r0_ra0_count1_inner_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra0_count1_inner_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_ra0_count1_inner_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra0_count1_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra0_count1_inner_i) + $signed(-1'd1);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra0_count1_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra0_count1_inner_i) + $signed(1'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_count1_inner_q = $unsigned(u0_m0_wo0_wi0_r0_ra0_count1_inner_i[0:0]);

    // u0_m0_wo0_wi0_r0_ra0_count1_run(LOGICAL,26)@13
    assign u0_m0_wo0_wi0_r0_ra0_count1_run_q = $unsigned(u0_m0_wo0_wi0_r0_ra0_count1_inner_q[0:0]);

    // u0_m0_wo0_wi0_r0_ra0_count1(COUNTER,27)@13
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count1_i <= 2'd0;
        end
        else if (u0_m0_wo0_memread_q == 1'b1 & u0_m0_wo0_wi0_r0_ra0_count1_run_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra0_count1_i <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count1_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_count1_q = u0_m0_wo0_wi0_r0_ra0_count1_i[1:0];

    // u0_m0_wo0_wi0_r0_ra0_count1_lut(LOOKUP,23)@13
    always @(u0_m0_wo0_wi0_r0_ra0_count1_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra0_count1_q)
            2'b00 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 4'b0000;
            2'b01 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 4'b0100;
            2'b10 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 4'b0100;
            2'b11 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 4'b0000;
            default : begin
                          // unreachable
                          u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 4'bxxxx;
                      end
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_ra0_count1_lutreg(REG,24)@13
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count1_lutreg_q <= $unsigned(4'b0000);
        end
        else if (u0_m0_wo0_memread_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra0_count1_lutreg_q <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count1_lut_q);
        end
    end

    // u0_m0_wo0_wi0_r0_ra0_add_0_0(ADD,28)@13 + 1
    assign u0_m0_wo0_wi0_r0_ra0_add_0_0_a = {3'b000, u0_m0_wo0_wi0_r0_ra0_count0_q};
    assign u0_m0_wo0_wi0_r0_ra0_add_0_0_b = {1'b0, u0_m0_wo0_wi0_r0_ra0_count1_lutreg_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_add_0_0_o <= 5'b0;
        end
        else
        begin
            u0_m0_wo0_wi0_r0_ra0_add_0_0_o <= $unsigned(u0_m0_wo0_wi0_r0_ra0_add_0_0_a) + $unsigned(u0_m0_wo0_wi0_r0_ra0_add_0_0_b);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_add_0_0_q = u0_m0_wo0_wi0_r0_ra0_add_0_0_o[4:0];

    // u0_m0_wo0_wi0_r0_ra0_resize(BITSELECT,29)@14
    assign u0_m0_wo0_wi0_r0_ra0_resize_in = $unsigned(u0_m0_wo0_wi0_r0_ra0_add_0_0_q[2:0]);
    assign u0_m0_wo0_wi0_r0_ra0_resize_b = $unsigned(u0_m0_wo0_wi0_r0_ra0_resize_in[2:0]);

    // u0_m0_wo0_wi0_r0_readReg0(DELAY,50)@14
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_readReg0_q <= u0_m0_wo0_wi0_r0_ra0_resize_b;
        end
    end

    // u0_m0_wo0_wi0_r0_wa0(COUNTER,45)@14
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

    // u0_m0_wo0_wi0_r0_memr0(DUALMEM,48)@14
    assign u0_m0_wo0_wi0_r0_memr0_ia = $unsigned(d_xIn_0_14_mem_q);
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

    // u0_m0_wo0_wi0_r0_delayr16_notEnable(LOGICAL,272)@14
    assign u0_m0_wo0_wi0_r0_delayr16_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_14_q));

    // u0_m0_wo0_wi0_r0_delayr16_nor(LOGICAL,273)@14
    assign u0_m0_wo0_wi0_r0_delayr16_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr16_notEnable_q | u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr16_mem_last(CONSTANT,269)
    assign u0_m0_wo0_wi0_r0_delayr16_mem_last_q = $unsigned(4'b0110);

    // u0_m0_wo0_wi0_r0_delayr16_cmp(LOGICAL,270)@14
    assign u0_m0_wo0_wi0_r0_delayr16_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr16_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr16_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr16_mem_last_q == u0_m0_wo0_wi0_r0_delayr16_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr16_cmpReg(REG,271)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr16_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr16_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr16_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr16_sticky_ena(REG,274)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr16_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr16_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr16_enaAnd(LOGICAL,275)@14
    assign u0_m0_wo0_wi0_r0_delayr16_enaAnd_q = u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q & d_u0_m0_wo0_compute_q_14_q;

    // u0_m0_wo0_wi0_r0_delayr16_rdcnt(COUNTER,266)@14 + 1
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr16_rdcnt_i <= 3'd0;
        end
        else if (d_u0_m0_wo0_compute_q_14_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr16_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr16_rdcnt_i) + $unsigned(3'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr16_rdcnt_q = u0_m0_wo0_wi0_r0_delayr16_rdcnt_i[2:0];

    // u0_m0_wo0_wi0_r0_delayr16_rdmux(MUX,267)@14
    assign u0_m0_wo0_wi0_r0_delayr16_rdmux_s = d_u0_m0_wo0_compute_q_14_q;
    always @(u0_m0_wo0_wi0_r0_delayr16_rdmux_s or u0_m0_wo0_wi0_r0_delayr16_wraddr_q or u0_m0_wo0_wi0_r0_delayr16_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr16_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr16_rdmux_q = u0_m0_wo0_wi0_r0_delayr16_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr16_rdmux_q = u0_m0_wo0_wi0_r0_delayr16_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr16_rdmux_q = 3'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join16(BITJOIN,67)@14
    assign u0_m0_wo0_wi0_r0_join16_q = {u0_m0_wo0_wi0_r0_split16_d, u0_m0_wo0_wi0_r0_split16_c, u0_m0_wo0_wi0_r0_split16_b, u0_m0_wo0_wi0_r0_split12_e};

    // u0_m0_wo0_wi0_r0_delayr16_wraddr(REG,268)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr16_wraddr_q <= $unsigned(3'b111);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr16_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr16_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr16_mem(DUALMEM,265)@14 + 2
    assign u0_m0_wo0_wi0_r0_delayr16_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join16_q);
    assign u0_m0_wo0_wi0_r0_delayr16_mem_aa = u0_m0_wo0_wi0_r0_delayr16_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr16_mem_ab = u0_m0_wo0_wi0_r0_delayr16_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr16_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr16_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr16_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(64),
        .widthad_b(3),
        .numwords_b(8),
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
    ) u0_m0_wo0_wi0_r0_delayr16_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr16_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr16_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr16_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr16_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_14_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr16_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr16_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr16_mem_q = u0_m0_wo0_wi0_r0_delayr16_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split16(BITSELECT,68)@14
    assign u0_m0_wo0_wi0_r0_split16_b = $unsigned(u0_m0_wo0_wi0_r0_delayr16_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split16_c = $unsigned(u0_m0_wo0_wi0_r0_delayr16_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split16_d = $unsigned(u0_m0_wo0_wi0_r0_delayr16_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split16_e = $unsigned(u0_m0_wo0_wi0_r0_delayr16_mem_q[63:48]);

    // u0_m0_wo0_aseq(SEQUENCE,98)@13 + 1
    always @ (posedge clk)
    begin
        reg [4:0] u0_m0_wo0_aseq_c;
        if (areset)
        begin
            u0_m0_wo0_aseq_c = 5'b00000;
            u0_m0_wo0_aseq_q <= $unsigned(1'b0);
            u0_m0_wo0_aseq_eq <= 1'b0;
        end
        else
        begin
            if (u0_m0_wo0_compute_q == 1'b1)
            begin
                if (u0_m0_wo0_aseq_c == 5'b11111)
                begin
                    u0_m0_wo0_aseq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_aseq_eq <= 1'b0;
                end
                if (u0_m0_wo0_aseq_eq == 1'b1)
                begin
                    u0_m0_wo0_aseq_c = $signed(u0_m0_wo0_aseq_c) + $signed(5'd3);
                end
                else
                begin
                    u0_m0_wo0_aseq_c = $signed(u0_m0_wo0_aseq_c) - $signed(5'd1);
                end
                u0_m0_wo0_aseq_q <= $unsigned(u0_m0_wo0_aseq_c[4:4]);
            end
        end
    end

    // d_u0_m0_wo0_compute_q_17(DELAY,220)@14 + 3
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

    // d_u0_m0_wo0_compute_q_14(DELAY,219)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_compute_q_14_q <= $unsigned(u0_m0_wo0_compute_q);
        end
    end

    // u0_m0_wo0_cma0(CHAINMULTADD,96)@14 + 5
    assign u0_m0_wo0_cma0_reset = areset;
    assign u0_m0_wo0_cma0_ena0 = d_u0_m0_wo0_compute_q_14_q[0] | u0_m0_wo0_cma0_reset;
    assign u0_m0_wo0_cma0_ena1 = d_u0_m0_wo0_compute_q_17_q[0] | u0_m0_wo0_cma0_reset;
    assign u0_m0_wo0_cma0_ena2 = 1'b1;

    assign u0_m0_wo0_cma0_a0 = $unsigned(u0_m0_wo0_wi0_r0_split16_e);
    assign u0_m0_wo0_cma0_b0 = $unsigned(u0_m0_wo0_wi0_r0_memr0_q);
    assign u0_m0_wo0_cma0_c0 = {2'b00, u0_m0_wo0_ca8_1_q[0:0]};
    assign u0_m0_wo0_cma0_a1 = $unsigned(u0_m0_wo0_wi0_r0_split16_d);
    assign u0_m0_wo0_cma0_b1 = $unsigned(u0_m0_wo0_wi0_r0_split1_b);
    assign u0_m0_wo0_cma0_c1 = {2'b00, u0_m0_wo0_ca9_1_q[0:0]};
    assign u0_m0_wo0_cma0_a2 = $unsigned(u0_m0_wo0_wi0_r0_split16_c);
    assign u0_m0_wo0_cma0_b2 = $unsigned(u0_m0_wo0_wi0_r0_split1_c);
    assign u0_m0_wo0_cma0_c2 = {2'b00, u0_m0_wo0_ca8_1_q[0:0]};
    assign u0_m0_wo0_cma0_a3 = $unsigned(u0_m0_wo0_wi0_r0_split16_b);
    assign u0_m0_wo0_cma0_b3 = $unsigned(u0_m0_wo0_wi0_r0_split1_d);
    assign u0_m0_wo0_cma0_c3 = {2'b00, u0_m0_wo0_ca9_1_q[0:0]};
    assign u0_m0_wo0_cma0_a4 = $unsigned(u0_m0_wo0_wi0_r0_split12_e);
    assign u0_m0_wo0_cma0_b4 = $unsigned(u0_m0_wo0_wi0_r0_split1_e);
    assign u0_m0_wo0_cma0_c4 = {2'b00, u0_m0_wo0_ca8_1_q[0:0]};
    assign u0_m0_wo0_cma0_a5 = $unsigned(u0_m0_wo0_wi0_r0_split12_d);
    assign u0_m0_wo0_cma0_b5 = $unsigned(u0_m0_wo0_wi0_r0_split5_b);
    assign u0_m0_wo0_cma0_c5 = {2'b00, u0_m0_wo0_ca9_1_q[0:0]};
    assign u0_m0_wo0_cma0_a6 = $unsigned(u0_m0_wo0_wi0_r0_split12_c);
    assign u0_m0_wo0_cma0_b6 = $unsigned(u0_m0_wo0_wi0_r0_split5_c);
    assign u0_m0_wo0_cma0_c6 = {2'b00, u0_m0_wo0_ca8_1_q[0:0]};
    assign u0_m0_wo0_cma0_a7 = $unsigned(u0_m0_wo0_wi0_r0_split12_b);
    assign u0_m0_wo0_cma0_b7 = $unsigned(u0_m0_wo0_wi0_r0_split5_d);
    assign u0_m0_wo0_cma0_c7 = {2'b00, u0_m0_wo0_ca9_1_q[0:0]};
    assign u0_m0_wo0_cma0_a8 = $unsigned(u0_m0_wo0_wi0_r0_memr11_q);
    assign u0_m0_wo0_cma0_b8 = $unsigned(u0_m0_wo0_wi0_r0_split5_e);
    assign u0_m0_wo0_cma0_c8 = {2'b00, u0_m0_wo0_ca8_1_q[0:0]};
    assign u0_m0_wo0_cma0_a9 = $unsigned($signed({15'b000000000000000, GND_q[0:0]}));
    assign u0_m0_wo0_cma0_b9 = $unsigned(u0_m0_wo0_wi0_r0_memr9_q);
    assign u0_m0_wo0_cma0_c9 = {2'b00, u0_m0_wo0_ca9_1_q[0:0]};
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
        .coef_a_0(16384),
        .coef_a_1(0),
        .coef_b_0(10402),
        .coef_b_1(-3393),
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
        .ay(u0_m0_wo0_cma0_a9),
        .by(u0_m0_wo0_cma0_a8),
        .az(u0_m0_wo0_cma0_b9),
        .bz(u0_m0_wo0_cma0_b8),
        .coefsela(u0_m0_wo0_cma0_c9),
        .coefselb(u0_m0_wo0_cma0_c8),
        .chainout(u0_m0_wo0_cma0_s8),
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
        .coef_a_0(1947),
        .coef_a_1(-1302),
        .coef_b_0(-677),
        .coef_b_1(925),
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
        .ay(u0_m0_wo0_cma0_a7),
        .by(u0_m0_wo0_cma0_a6),
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
        .bx(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
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
        .coef_a_0(-367),
        .coef_a_1(498),
        .coef_b_0(266),
        .coef_b_1(-191),
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
        .ay(u0_m0_wo0_cma0_a5),
        .by(u0_m0_wo0_cma0_a4),
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
        .bx(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
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
        .coef_a_0(133),
        .coef_a_1(-91),
        .coef_b_0(-38),
        .coef_b_1(59),
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
        .chainin(u0_m0_wo0_cma0_s4),
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
        .coef_a_0(-13),
        .coef_a_1(22),
        .coef_b_0(6),
        .coef_b_1(-3),
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
        .enable_double_accum("true"),
        .output_clken("1"),
        .result_a_width(39)
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
    dspba_delay_ver #( .width(39), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_m0_wo0_cma0_delay0 ( .xin(u0_m0_wo0_cma0_s0), .xout(u0_m0_wo0_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_m0_wo0_cma0_q = $unsigned(u0_m0_wo0_cma0_qq0[38:0]);

    // d_u0_m0_wo0_compute_q_18(DELAY,221)@17 + 1
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

    // u0_m0_wo0_oseq(SEQUENCE,100)@17 + 1
    always @ (posedge clk)
    begin
        reg [4:0] u0_m0_wo0_oseq_c;
        if (areset)
        begin
            u0_m0_wo0_oseq_c = 5'b00010;
            u0_m0_wo0_oseq_q <= $unsigned(1'b0);
            u0_m0_wo0_oseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m0_wo0_compute_q_17_q == 1'b1)
            begin
                if (u0_m0_wo0_oseq_c == 5'b11111)
                begin
                    u0_m0_wo0_oseq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_oseq_eq <= 1'b0;
                end
                if (u0_m0_wo0_oseq_eq == 1'b1)
                begin
                    u0_m0_wo0_oseq_c = $signed(u0_m0_wo0_oseq_c) + $signed(5'd3);
                end
                else
                begin
                    u0_m0_wo0_oseq_c = $signed(u0_m0_wo0_oseq_c) - $signed(5'd1);
                end
                u0_m0_wo0_oseq_q <= $unsigned(u0_m0_wo0_oseq_c[4:4]);
            end
        end
    end

    // u0_m0_wo0_oseq_gated(LOGICAL,101)@18
    assign u0_m0_wo0_oseq_gated_q = u0_m0_wo0_oseq_q & d_u0_m0_wo0_compute_q_18_q;

    // u0_m0_wo0_oseq_gated_reg(REG,102)@18 + 1
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

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // out0_m0_wo0_data_selector(SELECTOR,201)@19 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            out0_m0_wo0_data_selector_q <= 39'b0;
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

    // d_out0_m0_wo0_data_selector_q_21(DELAY,230)@20 + 1
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

    // outchan(COUNTER,202)@20 + 1
    // low=0, high=3, step=1, init=3
    always @ (posedge clk)
    begin
        if (areset)
        begin
            outchan_i <= 2'd3;
        end
        else if (out0_m0_wo0_data_selector_v == 1'b1)
        begin
            outchan_i <= $unsigned(outchan_i) + $unsigned(2'd1);
        end
    end
    assign outchan_q = {1'b0, outchan_i[1:0]};

    // d_out0_m0_wo0_data_selector_v_21(DELAY,231)@20 + 1
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

    // xOut(PORTOUT,203)@21 + 1
    assign xOut_v = d_out0_m0_wo0_data_selector_v_21_q;
    assign xOut_c = {5'b00000, outchan_q};
    assign xOut_0 = d_out0_m0_wo0_data_selector_q_21_q;

endmodule
