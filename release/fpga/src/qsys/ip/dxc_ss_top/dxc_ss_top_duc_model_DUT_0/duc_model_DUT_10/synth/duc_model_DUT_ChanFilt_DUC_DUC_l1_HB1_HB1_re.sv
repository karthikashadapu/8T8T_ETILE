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

// SystemVerilog created from duc_model_DUT_ChanFilt_DUC_DUC_l1_HB1_HB1_re
// SystemVerilog created on Thu Jan  9 15:34:39 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module duc_model_DUT_ChanFilt_DUC_DUC_l1_HB1_HB1_re (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [15:0] xIn_0,
    output wire [0:0] xOut_v,
    output wire [7:0] xOut_c,
    output wire [37:0] xOut_0,
    output wire [37:0] xOut_1,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_13_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_13_delay_0;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_13_delay_1;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_15_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_15_delay_0;
    reg [0:0] d_u0_m0_wo0_compute_q_13_q;
    reg [0:0] d_u0_m0_wo0_compute_q_13_delay_0;
    reg [0:0] d_u0_m0_wo0_compute_q_13_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr1_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr1_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr1_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr5_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr5_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr5_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr9_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr9_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr9_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr13_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr13_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr13_delay_1;
    reg [15:0] u0_m0_wo0_wi0_r0_delayr17_q;
    reg [15:0] u0_m0_wo0_wi0_r0_delayr17_delay_0;
    reg [15:0] u0_m0_wo0_wi0_r0_delayr17_delay_1;
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
    wire [36:0] u0_m0_wo0_cma0_s0;
    wire [43:0] u0_m0_wo0_cma0_s2;
    wire [43:0] u0_m0_wo0_cma0_s4;
    wire [43:0] u0_m0_wo0_cma0_s6;
    wire [43:0] u0_m0_wo0_cma0_s8;
    wire [43:0] u0_m0_wo0_cma0_s10;
    wire [43:0] u0_m0_wo0_cma0_s12;
    wire [43:0] u0_m0_wo0_cma0_s14;
    wire [43:0] u0_m0_wo0_cma0_s16;
    wire [36:0] u0_m0_wo0_cma0_qq0;
    reg [36:0] u0_m0_wo0_cma0_q;
    wire u0_m0_wo0_cma0_ena0;
    wire u0_m0_wo0_cma0_ena1;
    wire u0_m0_wo0_cma0_ena2;
    reg [36:0] d_u0_m0_wo0_cma0_q_16_q;
    reg [0:0] u0_m0_wo0_oseq_gated_reg_q;
    reg [0:0] d_u0_m0_wo0_oseq_gated_reg_q_15_q;
    reg [0:0] d_u0_m0_wo0_oseq_gated_reg_q_16_q;
    reg [0:0] u0_m1_wo0_memread_q;
    reg [0:0] u0_m1_wo0_memread_delay_0;
    reg [15:0] u0_m1_wo0_wi0_r0_delayr0_q;
    reg [15:0] u0_m1_wo0_wi0_r0_delayr0_delay_0;
    reg [15:0] u0_m1_wo0_wi0_r0_phasedelay0_q;
    reg [15:0] u0_m1_wo0_wi0_r0_phasedelay0_delay_0;
    reg [0:0] u0_m1_wo0_oseq_gated_reg_q;
    reg [0:0] d_u0_m1_wo0_oseq_gated_reg_q_15_q;
    reg [0:0] d_u0_m1_wo0_oseq_gated_reg_q_16_q;
    reg [36:0] out0_m0_wo0_lineup_0_q;
    reg [36:0] out0_m0_wo0_lineup_0_delay_0;
    reg [0:0] out0_m0_wo0_lineup_select_seq_0_q;
    reg out0_m0_wo0_lineup_select_seq_0_eq;
    reg [0:0] out0_m0_wo0_lineup_select_delay_0_q;
    reg [0:0] out0_m0_wo0_lineup_select_delay_0_delay_0;
    reg [31:0] out0_m1_wo0_lineup_0_q;
    reg [31:0] out0_m1_wo0_lineup_0_delay_0;
    reg [0:0] out0_m1_wo0_lineup_select_seq_0_q;
    reg out0_m1_wo0_lineup_select_seq_0_eq;
    reg [0:0] out0_m1_wo0_lineup_select_delay_0_q;
    reg [0:0] out0_m1_wo0_lineup_select_delay_0_delay_0;
    reg [36:0] out0_wo0_data_selector_q;
    reg [0:0] out0_wo0_data_selector_v;
    reg [0:0] d_out0_wo0_data_selector_v_17_q;
    reg [36:0] d_out0_wo0_data_selector_q_17_q;
    reg [0:0] out1_m0_wo0_lineup_select_seq_0_q;
    reg out1_m0_wo0_lineup_select_seq_0_eq;
    reg [0:0] out1_m1_wo0_lineup_select_seq_0_q;
    reg out1_m1_wo0_lineup_select_seq_0_eq;
    reg [36:0] out1_wo0_data_selector_q;
    wire [1:0] outchan_q;
    (* preserve_syn_only *) reg [0:0] outchan_i;
    wire [13:0] sR_bottomExtension_uid139_u0_m1_wo0_mtree_mult1_0_q;
    reg [31:0] d_sR_mergedSignalTMB_uid143_u0_m1_wo0_mtree_mult1_0_q_16_q;
    wire u0_m0_wo0_wi0_r0_delayr18_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr18_mem_ena_OrRstB;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr18_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr18_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr18_mem_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr18_mem_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr18_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr18_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr18_rdcnt_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_delayr18_rdcnt_eq;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr18_wraddr_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr18_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr18_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr18_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr19_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr19_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr19_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr19_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr19_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr19_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr19_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr19_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr19_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr19_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr19_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr19_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr19_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr23_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr23_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr23_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr23_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr23_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr23_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr23_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr23_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr23_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr23_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr23_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr23_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr23_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr27_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr27_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr27_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr27_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr27_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr27_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr27_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr27_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr27_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr27_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr27_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr27_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr27_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr31_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr31_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr31_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr31_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr31_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr31_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr31_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr31_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr31_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr31_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr31_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr31_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr31_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr35_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr35_mem_ena_OrRstB;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr35_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr35_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr35_mem_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr35_mem_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr35_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr35_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr35_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr35_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr35_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr35_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr35_sticky_ena_q;
    wire d_in0_m0_wi0_wo0_assign_id0_q_15_mem_reset0;
    wire d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ena_OrRstB;
    wire [15:0] d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ia;
    wire [1:0] d_in0_m0_wi0_wo0_assign_id0_q_15_mem_aa;
    wire [1:0] d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ab;
    wire [15:0] d_in0_m0_wi0_wo0_assign_id0_q_15_mem_iq;
    wire [15:0] d_in0_m0_wi0_wo0_assign_id0_q_15_mem_q;
    wire [1:0] d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_i;
    reg [1:0] d_in0_m0_wi0_wo0_assign_id0_q_15_wraddr_q;
    wire [2:0] d_in0_m0_wi0_wo0_assign_id0_q_15_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_in0_m0_wi0_wo0_assign_id0_q_15_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_in0_m0_wi0_wo0_assign_id0_q_15_sticky_ena_q;
    wire u0_m1_wo0_wi0_r0_delayr0_split_0_mem_reset0;
    wire u0_m1_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB;
    wire [15:0] u0_m1_wo0_wi0_r0_delayr0_split_0_mem_ia;
    wire [4:0] u0_m1_wo0_wi0_r0_delayr0_split_0_mem_aa;
    wire [4:0] u0_m1_wo0_wi0_r0_delayr0_split_0_mem_ab;
    wire [15:0] u0_m1_wo0_wi0_r0_delayr0_split_0_mem_iq;
    wire [15:0] u0_m1_wo0_wi0_r0_delayr0_split_0_mem_q;
    wire [4:0] u0_m1_wo0_wi0_r0_delayr0_split_0_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u0_m1_wo0_wi0_r0_delayr0_split_0_rdcnt_i;
    reg [4:0] u0_m1_wo0_wi0_r0_delayr0_split_0_wraddr_q;
    wire [5:0] u0_m1_wo0_wi0_r0_delayr0_split_0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m1_wo0_wi0_r0_delayr0_split_0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m1_wo0_wi0_r0_delayr0_split_0_sticky_ena_q;
    wire u0_m1_wo0_wi0_r0_delayr0_split_1_mem_reset0;
    wire u0_m1_wo0_wi0_r0_delayr0_split_1_mem_ena_OrRstB;
    wire [15:0] u0_m1_wo0_wi0_r0_delayr0_split_1_mem_ia;
    wire [4:0] u0_m1_wo0_wi0_r0_delayr0_split_1_mem_aa;
    wire [4:0] u0_m1_wo0_wi0_r0_delayr0_split_1_mem_ab;
    wire [15:0] u0_m1_wo0_wi0_r0_delayr0_split_1_mem_iq;
    wire [15:0] u0_m1_wo0_wi0_r0_delayr0_split_1_mem_q;
    (* preserve_syn_only *) reg [0:0] u0_m1_wo0_wi0_r0_delayr0_split_1_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m1_wo0_wi0_r0_delayr0_split_1_sticky_ena_q;
    wire [0:0] out0_m0_wo0_lineup_select_0_q;
    wire [0:0] out0_m1_wo0_lineup_select_0_q;
    wire [0:0] out1_m0_wo0_lineup_select_0_q;
    wire [0:0] out1_m1_wo0_lineup_select_0_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr18_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr18_rdmux_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr18_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr18_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr18_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr18_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr19_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr19_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr19_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr19_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr19_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr19_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr19_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr23_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr23_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr23_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr23_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr23_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr23_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr23_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr27_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr27_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr27_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr27_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr27_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr27_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr27_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr31_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr31_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr31_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr31_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr31_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr31_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr31_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr35_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr35_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr35_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr35_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr35_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr35_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr35_enaAnd_q;
    wire [2:0] d_in0_m0_wi0_wo0_assign_id0_q_15_cmp_b;
    wire [0:0] d_in0_m0_wi0_wo0_assign_id0_q_15_cmp_q;
    wire [0:0] d_in0_m0_wi0_wo0_assign_id0_q_15_notEnable_q;
    wire [0:0] d_in0_m0_wi0_wo0_assign_id0_q_15_nor_q;
    wire [0:0] d_in0_m0_wi0_wo0_assign_id0_q_15_enaAnd_q;
    wire [0:0] u0_m1_wo0_wi0_r0_delayr0_split_0_rdmux_s;
    reg [4:0] u0_m1_wo0_wi0_r0_delayr0_split_0_rdmux_q;
    wire [5:0] u0_m1_wo0_wi0_r0_delayr0_split_0_cmp_b;
    wire [0:0] u0_m1_wo0_wi0_r0_delayr0_split_0_cmp_q;
    wire [0:0] u0_m1_wo0_wi0_r0_delayr0_split_0_notEnable_q;
    wire [0:0] u0_m1_wo0_wi0_r0_delayr0_split_0_nor_q;
    wire [0:0] u0_m1_wo0_wi0_r0_delayr0_split_0_enaAnd_q;
    wire [0:0] u0_m1_wo0_wi0_r0_delayr0_split_1_nor_q;
    wire [0:0] u0_m1_wo0_wi0_r0_delayr0_split_1_enaAnd_q;
    wire [15:0] u0_m0_wo0_wi0_r0_split1_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split1_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split1_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split1_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split5_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split5_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split5_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split5_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split9_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split9_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split9_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split9_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split13_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split13_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split13_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split13_e;
    reg [0:0] u0_m1_wo0_compute_q;
    wire [0:0] xMSB_uid140_u0_m1_wo0_mtree_mult1_0_b;
    reg [36:0] out0_m0_wo0_assign_id4_q;
    reg [0:0] out0_m0_wo0_assign_id5_q;
    reg [31:0] out0_m1_wo0_assign_id6_q;
    reg [0:0] out0_m1_wo0_assign_id7_q;
    wire [15:0] u0_m0_wo0_wi0_r0_split19_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split19_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split19_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split19_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split23_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split23_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split23_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split23_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split27_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split27_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split27_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split27_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split31_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split31_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split31_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split31_e;
    wire [63:0] u0_m0_wo0_wi0_r0_join1_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join5_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join9_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join13_q;
    wire [1:0] sR_topExtension_uid142_u0_m1_wo0_mtree_mult1_0_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join19_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join23_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join27_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join31_q;
    wire [31:0] sR_mergedSignalTMB_uid143_u0_m1_wo0_mtree_mult1_0_q;

    import duc_model_DUT_safe_path_ver::safe_path_ver;

    // xMSB_uid140_u0_m1_wo0_mtree_mult1_0(BITSELECT,139)@15
    assign xMSB_uid140_u0_m1_wo0_mtree_mult1_0_b = $unsigned(u0_m1_wo0_wi0_r0_phasedelay0_q[15:15]);

    // sR_topExtension_uid142_u0_m1_wo0_mtree_mult1_0(BITJOIN,141)@15
    assign sR_topExtension_uid142_u0_m1_wo0_mtree_mult1_0_q = {xMSB_uid140_u0_m1_wo0_mtree_mult1_0_b, xMSB_uid140_u0_m1_wo0_mtree_mult1_0_b};

    // d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,173)@10 + 3
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_13_delay_0 <= '0;
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_13_delay_0 <= $unsigned(xIn_v);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_13_delay_1 <= d_in0_m0_wi0_wo0_assign_id1_q_13_delay_0;
            d_in0_m0_wi0_wo0_assign_id1_q_13_q <= d_in0_m0_wi0_wo0_assign_id1_q_13_delay_1;
        end
    end

    // d_in0_m0_wi0_wo0_assign_id1_q_15(DELAY,174)@13 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_15_delay_0 <= '0;
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_15_delay_0 <= $unsigned(d_in0_m0_wi0_wo0_assign_id1_q_13_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_15_q <= d_in0_m0_wi0_wo0_assign_id1_q_15_delay_0;
        end
    end

    // u0_m1_wo0_wi0_r0_delayr0_split_0_notEnable(LOGICAL,269)@15
    assign u0_m1_wo0_wi0_r0_delayr0_split_0_notEnable_q = $unsigned(~ (d_in0_m0_wi0_wo0_assign_id1_q_15_q));

    // u0_m1_wo0_wi0_r0_delayr0_split_1_nor(LOGICAL,281)@15
    assign u0_m1_wo0_wi0_r0_delayr0_split_1_nor_q = ~ (u0_m1_wo0_wi0_r0_delayr0_split_0_notEnable_q | u0_m1_wo0_wi0_r0_delayr0_split_1_sticky_ena_q);

    // u0_m1_wo0_wi0_r0_delayr0_split_0_mem_last(CONSTANT,266)
    assign u0_m1_wo0_wi0_r0_delayr0_split_0_mem_last_q = $unsigned(6'b011110);

    // u0_m1_wo0_wi0_r0_delayr0_split_0_cmp(LOGICAL,267)@15
    assign u0_m1_wo0_wi0_r0_delayr0_split_0_cmp_b = {1'b0, u0_m1_wo0_wi0_r0_delayr0_split_0_rdmux_q};
    assign u0_m1_wo0_wi0_r0_delayr0_split_0_cmp_q = $unsigned(u0_m1_wo0_wi0_r0_delayr0_split_0_mem_last_q == u0_m1_wo0_wi0_r0_delayr0_split_0_cmp_b ? 1'b1 : 1'b0);

    // u0_m1_wo0_wi0_r0_delayr0_split_1_cmpReg(REG,279)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_wi0_r0_delayr0_split_1_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_15_q == 1'b1)
        begin
            u0_m1_wo0_wi0_r0_delayr0_split_1_cmpReg_q <= $unsigned(u0_m1_wo0_wi0_r0_delayr0_split_0_cmp_q);
        end
    end

    // u0_m1_wo0_wi0_r0_delayr0_split_1_sticky_ena(REG,282)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_wi0_r0_delayr0_split_1_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m1_wo0_wi0_r0_delayr0_split_1_nor_q == 1'b1)
        begin
            u0_m1_wo0_wi0_r0_delayr0_split_1_sticky_ena_q <= $unsigned(u0_m1_wo0_wi0_r0_delayr0_split_1_cmpReg_q);
        end
    end

    // u0_m1_wo0_wi0_r0_delayr0_split_1_enaAnd(LOGICAL,283)@15
    assign u0_m1_wo0_wi0_r0_delayr0_split_1_enaAnd_q = u0_m1_wo0_wi0_r0_delayr0_split_1_sticky_ena_q & d_in0_m0_wi0_wo0_assign_id1_q_15_q;

    // u0_m1_wo0_wi0_r0_delayr0_split_0_rdcnt(COUNTER,263)@15 + 1
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_wi0_r0_delayr0_split_0_rdcnt_i <= 5'd0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_15_q == 1'b1)
        begin
            u0_m1_wo0_wi0_r0_delayr0_split_0_rdcnt_i <= $unsigned(u0_m1_wo0_wi0_r0_delayr0_split_0_rdcnt_i) + $unsigned(5'd1);
        end
    end
    assign u0_m1_wo0_wi0_r0_delayr0_split_0_rdcnt_q = u0_m1_wo0_wi0_r0_delayr0_split_0_rdcnt_i[4:0];

    // u0_m1_wo0_wi0_r0_delayr0_split_0_rdmux(MUX,264)@15
    assign u0_m1_wo0_wi0_r0_delayr0_split_0_rdmux_s = d_in0_m0_wi0_wo0_assign_id1_q_15_q;
    always @(u0_m1_wo0_wi0_r0_delayr0_split_0_rdmux_s or u0_m1_wo0_wi0_r0_delayr0_split_0_wraddr_q or u0_m1_wo0_wi0_r0_delayr0_split_0_rdcnt_q)
    begin
        unique case (u0_m1_wo0_wi0_r0_delayr0_split_0_rdmux_s)
            1'b0 : u0_m1_wo0_wi0_r0_delayr0_split_0_rdmux_q = u0_m1_wo0_wi0_r0_delayr0_split_0_wraddr_q;
            1'b1 : u0_m1_wo0_wi0_r0_delayr0_split_0_rdmux_q = u0_m1_wo0_wi0_r0_delayr0_split_0_rdcnt_q;
            default : u0_m1_wo0_wi0_r0_delayr0_split_0_rdmux_q = 5'b0;
        endcase
    end

    // u0_m1_wo0_wi0_r0_delayr0_split_0_nor(LOGICAL,270)@15
    assign u0_m1_wo0_wi0_r0_delayr0_split_0_nor_q = ~ (u0_m1_wo0_wi0_r0_delayr0_split_0_notEnable_q | u0_m1_wo0_wi0_r0_delayr0_split_0_sticky_ena_q);

    // u0_m1_wo0_wi0_r0_delayr0_split_0_cmpReg(REG,268)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_wi0_r0_delayr0_split_0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_15_q == 1'b1)
        begin
            u0_m1_wo0_wi0_r0_delayr0_split_0_cmpReg_q <= $unsigned(u0_m1_wo0_wi0_r0_delayr0_split_0_cmp_q);
        end
    end

    // u0_m1_wo0_wi0_r0_delayr0_split_0_sticky_ena(REG,271)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_wi0_r0_delayr0_split_0_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m1_wo0_wi0_r0_delayr0_split_0_nor_q == 1'b1)
        begin
            u0_m1_wo0_wi0_r0_delayr0_split_0_sticky_ena_q <= $unsigned(u0_m1_wo0_wi0_r0_delayr0_split_0_cmpReg_q);
        end
    end

    // u0_m1_wo0_wi0_r0_delayr0_split_0_enaAnd(LOGICAL,272)@15
    assign u0_m1_wo0_wi0_r0_delayr0_split_0_enaAnd_q = u0_m1_wo0_wi0_r0_delayr0_split_0_sticky_ena_q & d_in0_m0_wi0_wo0_assign_id1_q_15_q;

    // d_in0_m0_wi0_wo0_assign_id0_q_15_notEnable(LOGICAL,258)@10
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_notEnable_q = $unsigned(~ (VCC_q));

    // d_in0_m0_wi0_wo0_assign_id0_q_15_nor(LOGICAL,259)@10
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_nor_q = ~ (d_in0_m0_wi0_wo0_assign_id0_q_15_notEnable_q | d_in0_m0_wi0_wo0_assign_id0_q_15_sticky_ena_q);

    // d_in0_m0_wi0_wo0_assign_id0_q_15_mem_last(CONSTANT,255)
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_mem_last_q = $unsigned(3'b010);

    // d_in0_m0_wi0_wo0_assign_id0_q_15_cmp(LOGICAL,256)@10
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_cmp_b = {1'b0, d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_q};
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_cmp_q = $unsigned(d_in0_m0_wi0_wo0_assign_id0_q_15_mem_last_q == d_in0_m0_wi0_wo0_assign_id0_q_15_cmp_b ? 1'b1 : 1'b0);

    // d_in0_m0_wi0_wo0_assign_id0_q_15_cmpReg(REG,257)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_in0_m0_wi0_wo0_assign_id0_q_15_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id0_q_15_cmpReg_q <= $unsigned(d_in0_m0_wi0_wo0_assign_id0_q_15_cmp_q);
        end
    end

    // d_in0_m0_wi0_wo0_assign_id0_q_15_sticky_ena(REG,260)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_in0_m0_wi0_wo0_assign_id0_q_15_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_in0_m0_wi0_wo0_assign_id0_q_15_nor_q == 1'b1)
        begin
            d_in0_m0_wi0_wo0_assign_id0_q_15_sticky_ena_q <= $unsigned(d_in0_m0_wi0_wo0_assign_id0_q_15_cmpReg_q);
        end
    end

    // d_in0_m0_wi0_wo0_assign_id0_q_15_enaAnd(LOGICAL,261)@10
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_enaAnd_q = d_in0_m0_wi0_wo0_assign_id0_q_15_sticky_ena_q & VCC_q;

    // d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt(COUNTER,253)@10 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_i <= 2'd0;
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_i <= $unsigned(d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_q = d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_i[1:0];

    // d_in0_m0_wi0_wo0_assign_id0_q_15_wraddr(REG,254)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_in0_m0_wi0_wo0_assign_id0_q_15_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id0_q_15_wraddr_q <= $unsigned(d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_q);
        end
    end

    // d_in0_m0_wi0_wo0_assign_id0_q_15_mem(DUALMEM,252)@10 + 2
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ia = $unsigned(xIn_0);
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_mem_aa = d_in0_m0_wi0_wo0_assign_id0_q_15_wraddr_q;
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ab = d_in0_m0_wi0_wo0_assign_id0_q_15_rdcnt_q;
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ena_OrRstB = areset | d_in0_m0_wi0_wo0_assign_id0_q_15_enaAnd_q[0];
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_mem_reset0 = areset;
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
    ) d_in0_m0_wi0_wo0_assign_id0_q_15_mem_dmem (
        .clocken1(d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_in0_m0_wi0_wo0_assign_id0_q_15_mem_reset0),
        .clock1(clk),
        .address_a(d_in0_m0_wi0_wo0_assign_id0_q_15_mem_aa),
        .data_a(d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_in0_m0_wi0_wo0_assign_id0_q_15_mem_ab),
        .q_b(d_in0_m0_wi0_wo0_assign_id0_q_15_mem_iq),
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
    assign d_in0_m0_wi0_wo0_assign_id0_q_15_mem_q = d_in0_m0_wi0_wo0_assign_id0_q_15_mem_iq[15:0];

    // u0_m1_wo0_wi0_r0_delayr0_split_0_mem(DUALMEM,262)@15 + 2
    assign u0_m1_wo0_wi0_r0_delayr0_split_0_mem_ia = $unsigned(d_in0_m0_wi0_wo0_assign_id0_q_15_mem_q);
    assign u0_m1_wo0_wi0_r0_delayr0_split_0_mem_aa = u0_m1_wo0_wi0_r0_delayr0_split_0_wraddr_q;
    assign u0_m1_wo0_wi0_r0_delayr0_split_0_mem_ab = u0_m1_wo0_wi0_r0_delayr0_split_0_rdmux_q;
    assign u0_m1_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB = areset | u0_m1_wo0_wi0_r0_delayr0_split_0_enaAnd_q[0];
    assign u0_m1_wo0_wi0_r0_delayr0_split_0_mem_reset0 = areset;
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
    ) u0_m1_wo0_wi0_r0_delayr0_split_0_mem_dmem (
        .clocken1(u0_m1_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m1_wo0_wi0_r0_delayr0_split_0_mem_reset0),
        .clock1(clk),
        .address_a(u0_m1_wo0_wi0_r0_delayr0_split_0_mem_aa),
        .data_a(u0_m1_wo0_wi0_r0_delayr0_split_0_mem_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_15_q[0]),
        .address_b(u0_m1_wo0_wi0_r0_delayr0_split_0_mem_ab),
        .q_b(u0_m1_wo0_wi0_r0_delayr0_split_0_mem_iq),
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
    assign u0_m1_wo0_wi0_r0_delayr0_split_0_mem_q = u0_m1_wo0_wi0_r0_delayr0_split_0_mem_iq[15:0];

    // u0_m1_wo0_wi0_r0_delayr0_split_0_wraddr(REG,265)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_wi0_r0_delayr0_split_0_wraddr_q <= $unsigned(5'b11111);
        end
        else
        begin
            u0_m1_wo0_wi0_r0_delayr0_split_0_wraddr_q <= $unsigned(u0_m1_wo0_wi0_r0_delayr0_split_0_rdmux_q);
        end
    end

    // u0_m1_wo0_wi0_r0_delayr0_split_1_mem(DUALMEM,273)@15 + 2
    assign u0_m1_wo0_wi0_r0_delayr0_split_1_mem_ia = $unsigned(u0_m1_wo0_wi0_r0_delayr0_split_0_mem_q);
    assign u0_m1_wo0_wi0_r0_delayr0_split_1_mem_aa = u0_m1_wo0_wi0_r0_delayr0_split_0_wraddr_q;
    assign u0_m1_wo0_wi0_r0_delayr0_split_1_mem_ab = u0_m1_wo0_wi0_r0_delayr0_split_0_rdmux_q;
    assign u0_m1_wo0_wi0_r0_delayr0_split_1_mem_ena_OrRstB = areset | u0_m1_wo0_wi0_r0_delayr0_split_1_enaAnd_q[0];
    assign u0_m1_wo0_wi0_r0_delayr0_split_1_mem_reset0 = areset;
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
    ) u0_m1_wo0_wi0_r0_delayr0_split_1_mem_dmem (
        .clocken1(u0_m1_wo0_wi0_r0_delayr0_split_1_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m1_wo0_wi0_r0_delayr0_split_1_mem_reset0),
        .clock1(clk),
        .address_a(u0_m1_wo0_wi0_r0_delayr0_split_1_mem_aa),
        .data_a(u0_m1_wo0_wi0_r0_delayr0_split_1_mem_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_15_q[0]),
        .address_b(u0_m1_wo0_wi0_r0_delayr0_split_1_mem_ab),
        .q_b(u0_m1_wo0_wi0_r0_delayr0_split_1_mem_iq),
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
    assign u0_m1_wo0_wi0_r0_delayr0_split_1_mem_q = u0_m1_wo0_wi0_r0_delayr0_split_1_mem_iq[15:0];

    // u0_m1_wo0_wi0_r0_delayr0(DELAY,98)@15
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_wi0_r0_delayr0_delay_0 <= '0;
            u0_m1_wo0_wi0_r0_delayr0_q <= '0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_15_q == 1'b1)
        begin
            u0_m1_wo0_wi0_r0_delayr0_delay_0 <= $unsigned(u0_m1_wo0_wi0_r0_delayr0_split_1_mem_q);
            u0_m1_wo0_wi0_r0_delayr0_q <= u0_m1_wo0_wi0_r0_delayr0_delay_0;
        end
    end

    // u0_m1_wo0_wi0_r0_phasedelay0(DELAY,99)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m1_wo0_wi0_r0_phasedelay0_delay_0 <= $unsigned(u0_m1_wo0_wi0_r0_delayr0_q);
            u0_m1_wo0_wi0_r0_phasedelay0_q <= u0_m1_wo0_wi0_r0_phasedelay0_delay_0;
        end
    end

    // sR_bottomExtension_uid139_u0_m1_wo0_mtree_mult1_0(CONSTANT,138)@0
    assign sR_bottomExtension_uid139_u0_m1_wo0_mtree_mult1_0_q = $unsigned(14'b00000000000000);

    // sR_mergedSignalTMB_uid143_u0_m1_wo0_mtree_mult1_0(BITJOIN,142)@15
    assign sR_mergedSignalTMB_uid143_u0_m1_wo0_mtree_mult1_0_q = {sR_topExtension_uid142_u0_m1_wo0_mtree_mult1_0_q, u0_m1_wo0_wi0_r0_phasedelay0_q, sR_bottomExtension_uid139_u0_m1_wo0_mtree_mult1_0_q};

    // d_sR_mergedSignalTMB_uid143_u0_m1_wo0_mtree_mult1_0_q_16(DELAY,183)@15 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_sR_mergedSignalTMB_uid143_u0_m1_wo0_mtree_mult1_0_q_16_q <= $unsigned(sR_mergedSignalTMB_uid143_u0_m1_wo0_mtree_mult1_0_q);
        end
    end

    // u0_m1_wo0_memread(DELAY,93)@13
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m1_wo0_memread_delay_0 <= $unsigned(d_in0_m0_wi0_wo0_assign_id1_q_13_q);
            u0_m1_wo0_memread_q <= u0_m1_wo0_memread_delay_0;
        end
    end

    // u0_m1_wo0_compute(DELAY,95)@13
    assign u0_m1_wo0_compute_q = $unsigned(u0_m1_wo0_memread_q);

    // u0_m1_wo0_oseq_gated_reg(REG,105)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_oseq_gated_reg_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m1_wo0_oseq_gated_reg_q <= $unsigned(u0_m1_wo0_compute_q);
        end
    end

    // d_u0_m1_wo0_oseq_gated_reg_q_15(DELAY,179)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m1_wo0_oseq_gated_reg_q_15_q <= '0;
        end
        else
        begin
            d_u0_m1_wo0_oseq_gated_reg_q_15_q <= $unsigned(u0_m1_wo0_oseq_gated_reg_q);
        end
    end

    // d_u0_m1_wo0_oseq_gated_reg_q_16(DELAY,180)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m1_wo0_oseq_gated_reg_q_16_q <= '0;
        end
        else
        begin
            d_u0_m1_wo0_oseq_gated_reg_q_16_q <= $unsigned(d_u0_m1_wo0_oseq_gated_reg_q_15_q);
        end
    end

    // out1_m1_wo0_lineup_select_seq_0(SEQUENCE,126)@15 + 1
    always @ (posedge clk)
    begin
        reg [4:0] out1_m1_wo0_lineup_select_seq_0_c;
        if (areset)
        begin
            out1_m1_wo0_lineup_select_seq_0_c = 5'b00010;
            out1_m1_wo0_lineup_select_seq_0_q <= $unsigned(1'b0);
            out1_m1_wo0_lineup_select_seq_0_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m1_wo0_oseq_gated_reg_q_15_q == 1'b1)
            begin
                if (out1_m1_wo0_lineup_select_seq_0_c == 5'b11111)
                begin
                    out1_m1_wo0_lineup_select_seq_0_eq <= 1'b1;
                end
                else
                begin
                    out1_m1_wo0_lineup_select_seq_0_eq <= 1'b0;
                end
                if (out1_m1_wo0_lineup_select_seq_0_eq == 1'b1)
                begin
                    out1_m1_wo0_lineup_select_seq_0_c = $signed(out1_m1_wo0_lineup_select_seq_0_c) + $signed(5'd3);
                end
                else
                begin
                    out1_m1_wo0_lineup_select_seq_0_c = $signed(out1_m1_wo0_lineup_select_seq_0_c) - $signed(5'd1);
                end
                out1_m1_wo0_lineup_select_seq_0_q <= $unsigned(out1_m1_wo0_lineup_select_seq_0_c[4:4]);
            end
        end
    end

    // out1_m1_wo0_lineup_select_0(LOGICAL,127)@16
    assign out1_m1_wo0_lineup_select_0_q = out1_m1_wo0_lineup_select_seq_0_q & d_u0_m1_wo0_oseq_gated_reg_q_16_q;

    // u0_m0_wo0_wi0_r0_delayr17(DELAY,32)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr17_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr17_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr17_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr17_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_split13_e);
            u0_m0_wo0_wi0_r0_delayr17_delay_1 <= u0_m0_wo0_wi0_r0_delayr17_delay_0;
            u0_m0_wo0_wi0_r0_delayr17_q <= u0_m0_wo0_wi0_r0_delayr17_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_delayr18_notEnable(LOGICAL,193)@10
    assign u0_m0_wo0_wi0_r0_delayr18_notEnable_q = $unsigned(~ (xIn_v));

    // u0_m0_wo0_wi0_r0_delayr18_nor(LOGICAL,194)@10
    assign u0_m0_wo0_wi0_r0_delayr18_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr18_notEnable_q | u0_m0_wo0_wi0_r0_delayr18_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr18_mem_last(CONSTANT,190)
    assign u0_m0_wo0_wi0_r0_delayr18_mem_last_q = $unsigned(2'b01);

    // u0_m0_wo0_wi0_r0_delayr18_cmp(LOGICAL,191)@10
    assign u0_m0_wo0_wi0_r0_delayr18_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr18_mem_last_q == u0_m0_wo0_wi0_r0_delayr18_rdmux_q ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr18_cmpReg(REG,192)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr18_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr18_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr18_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr18_sticky_ena(REG,195)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr18_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr18_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr18_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr18_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr18_enaAnd(LOGICAL,196)@10
    assign u0_m0_wo0_wi0_r0_delayr18_enaAnd_q = u0_m0_wo0_wi0_r0_delayr18_sticky_ena_q & xIn_v;

    // u0_m0_wo0_wi0_r0_delayr18_rdcnt(COUNTER,187)@10 + 1
    // low=0, high=2, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr18_rdcnt_i <= 2'd0;
            u0_m0_wo0_wi0_r0_delayr18_rdcnt_eq <= 1'b0;
        end
        else if (xIn_v == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_delayr18_rdcnt_i == 2'd1)
            begin
                u0_m0_wo0_wi0_r0_delayr18_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr18_rdcnt_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_delayr18_rdcnt_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_delayr18_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr18_rdcnt_i) + $unsigned(2'd2);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr18_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr18_rdcnt_i) + $unsigned(2'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr18_rdcnt_q = u0_m0_wo0_wi0_r0_delayr18_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr18_rdmux(MUX,188)@10
    assign u0_m0_wo0_wi0_r0_delayr18_rdmux_s = xIn_v;
    always @(u0_m0_wo0_wi0_r0_delayr18_rdmux_s or u0_m0_wo0_wi0_r0_delayr18_wraddr_q or u0_m0_wo0_wi0_r0_delayr18_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr18_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr18_rdmux_q = u0_m0_wo0_wi0_r0_delayr18_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr18_rdmux_q = u0_m0_wo0_wi0_r0_delayr18_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr18_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_delayr18_wraddr(REG,189)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr18_wraddr_q <= $unsigned(2'b10);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr18_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr18_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr18_mem(DUALMEM,186)@10 + 2
    assign u0_m0_wo0_wi0_r0_delayr18_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_delayr17_q);
    assign u0_m0_wo0_wi0_r0_delayr18_mem_aa = u0_m0_wo0_wi0_r0_delayr18_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr18_mem_ab = u0_m0_wo0_wi0_r0_delayr18_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr18_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr18_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr18_mem_reset0 = areset;
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
    ) u0_m0_wo0_wi0_r0_delayr18_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr18_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr18_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr18_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr18_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr18_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr18_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr18_mem_q = u0_m0_wo0_wi0_r0_delayr18_mem_iq[15:0];

    // u0_m0_wo0_wi0_r0_join13(BITJOIN,29)@10
    assign u0_m0_wo0_wi0_r0_join13_q = {u0_m0_wo0_wi0_r0_split13_d, u0_m0_wo0_wi0_r0_split13_c, u0_m0_wo0_wi0_r0_split13_b, u0_m0_wo0_wi0_r0_split9_e};

    // u0_m0_wo0_wi0_r0_delayr13(DELAY,31)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr13_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr13_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr13_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr13_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join13_q);
            u0_m0_wo0_wi0_r0_delayr13_delay_1 <= u0_m0_wo0_wi0_r0_delayr13_delay_0;
            u0_m0_wo0_wi0_r0_delayr13_q <= u0_m0_wo0_wi0_r0_delayr13_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split13(BITSELECT,30)@10
    assign u0_m0_wo0_wi0_r0_split13_b = $unsigned(u0_m0_wo0_wi0_r0_delayr13_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split13_c = $unsigned(u0_m0_wo0_wi0_r0_delayr13_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split13_d = $unsigned(u0_m0_wo0_wi0_r0_delayr13_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split13_e = $unsigned(u0_m0_wo0_wi0_r0_delayr13_q[63:48]);

    // u0_m0_wo0_wi0_r0_delayr19_notEnable(LOGICAL,204)@10
    assign u0_m0_wo0_wi0_r0_delayr19_notEnable_q = $unsigned(~ (xIn_v));

    // u0_m0_wo0_wi0_r0_delayr19_nor(LOGICAL,205)@10
    assign u0_m0_wo0_wi0_r0_delayr19_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr19_notEnable_q | u0_m0_wo0_wi0_r0_delayr19_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr19_mem_last(CONSTANT,201)
    assign u0_m0_wo0_wi0_r0_delayr19_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr19_cmp(LOGICAL,202)@10
    assign u0_m0_wo0_wi0_r0_delayr19_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr19_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr19_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr19_mem_last_q == u0_m0_wo0_wi0_r0_delayr19_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr19_cmpReg(REG,203)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr19_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr19_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr19_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr19_sticky_ena(REG,206)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr19_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr19_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr19_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr19_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr19_enaAnd(LOGICAL,207)@10
    assign u0_m0_wo0_wi0_r0_delayr19_enaAnd_q = u0_m0_wo0_wi0_r0_delayr19_sticky_ena_q & xIn_v;

    // u0_m0_wo0_wi0_r0_delayr19_rdcnt(COUNTER,198)@10 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr19_rdcnt_i <= 2'd0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr19_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr19_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr19_rdcnt_q = u0_m0_wo0_wi0_r0_delayr19_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr19_rdmux(MUX,199)@10
    assign u0_m0_wo0_wi0_r0_delayr19_rdmux_s = xIn_v;
    always @(u0_m0_wo0_wi0_r0_delayr19_rdmux_s or u0_m0_wo0_wi0_r0_delayr19_wraddr_q or u0_m0_wo0_wi0_r0_delayr19_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr19_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr19_rdmux_q = u0_m0_wo0_wi0_r0_delayr19_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr19_rdmux_q = u0_m0_wo0_wi0_r0_delayr19_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr19_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join19(BITJOIN,34)@10
    assign u0_m0_wo0_wi0_r0_join19_q = {u0_m0_wo0_wi0_r0_split19_d, u0_m0_wo0_wi0_r0_split19_c, u0_m0_wo0_wi0_r0_split19_b, u0_m0_wo0_wi0_r0_delayr18_mem_q};

    // u0_m0_wo0_wi0_r0_delayr19_wraddr(REG,200)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr19_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr19_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr19_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr19_mem(DUALMEM,197)@10 + 2
    assign u0_m0_wo0_wi0_r0_delayr19_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join19_q);
    assign u0_m0_wo0_wi0_r0_delayr19_mem_aa = u0_m0_wo0_wi0_r0_delayr19_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr19_mem_ab = u0_m0_wo0_wi0_r0_delayr19_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr19_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr19_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr19_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(64),
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
    ) u0_m0_wo0_wi0_r0_delayr19_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr19_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr19_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr19_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr19_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr19_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr19_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr19_mem_q = u0_m0_wo0_wi0_r0_delayr19_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split19(BITSELECT,35)@10
    assign u0_m0_wo0_wi0_r0_split19_b = $unsigned(u0_m0_wo0_wi0_r0_delayr19_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split19_c = $unsigned(u0_m0_wo0_wi0_r0_delayr19_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split19_d = $unsigned(u0_m0_wo0_wi0_r0_delayr19_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split19_e = $unsigned(u0_m0_wo0_wi0_r0_delayr19_mem_q[63:48]);

    // u0_m0_wo0_wi0_r0_join9(BITJOIN,26)@10
    assign u0_m0_wo0_wi0_r0_join9_q = {u0_m0_wo0_wi0_r0_split9_d, u0_m0_wo0_wi0_r0_split9_c, u0_m0_wo0_wi0_r0_split9_b, u0_m0_wo0_wi0_r0_split5_e};

    // u0_m0_wo0_wi0_r0_delayr9(DELAY,28)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr9_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr9_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr9_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr9_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join9_q);
            u0_m0_wo0_wi0_r0_delayr9_delay_1 <= u0_m0_wo0_wi0_r0_delayr9_delay_0;
            u0_m0_wo0_wi0_r0_delayr9_q <= u0_m0_wo0_wi0_r0_delayr9_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split9(BITSELECT,27)@10
    assign u0_m0_wo0_wi0_r0_split9_b = $unsigned(u0_m0_wo0_wi0_r0_delayr9_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split9_c = $unsigned(u0_m0_wo0_wi0_r0_delayr9_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split9_d = $unsigned(u0_m0_wo0_wi0_r0_delayr9_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split9_e = $unsigned(u0_m0_wo0_wi0_r0_delayr9_q[63:48]);

    // u0_m0_wo0_wi0_r0_delayr23_notEnable(LOGICAL,215)@10
    assign u0_m0_wo0_wi0_r0_delayr23_notEnable_q = $unsigned(~ (xIn_v));

    // u0_m0_wo0_wi0_r0_delayr23_nor(LOGICAL,216)@10
    assign u0_m0_wo0_wi0_r0_delayr23_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr23_notEnable_q | u0_m0_wo0_wi0_r0_delayr23_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr23_mem_last(CONSTANT,212)
    assign u0_m0_wo0_wi0_r0_delayr23_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr23_cmp(LOGICAL,213)@10
    assign u0_m0_wo0_wi0_r0_delayr23_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr23_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr23_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr23_mem_last_q == u0_m0_wo0_wi0_r0_delayr23_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr23_cmpReg(REG,214)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr23_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr23_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr23_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr23_sticky_ena(REG,217)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr23_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr23_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr23_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr23_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr23_enaAnd(LOGICAL,218)@10
    assign u0_m0_wo0_wi0_r0_delayr23_enaAnd_q = u0_m0_wo0_wi0_r0_delayr23_sticky_ena_q & xIn_v;

    // u0_m0_wo0_wi0_r0_delayr23_rdcnt(COUNTER,209)@10 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr23_rdcnt_i <= 2'd0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr23_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr23_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr23_rdcnt_q = u0_m0_wo0_wi0_r0_delayr23_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr23_rdmux(MUX,210)@10
    assign u0_m0_wo0_wi0_r0_delayr23_rdmux_s = xIn_v;
    always @(u0_m0_wo0_wi0_r0_delayr23_rdmux_s or u0_m0_wo0_wi0_r0_delayr23_wraddr_q or u0_m0_wo0_wi0_r0_delayr23_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr23_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr23_rdmux_q = u0_m0_wo0_wi0_r0_delayr23_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr23_rdmux_q = u0_m0_wo0_wi0_r0_delayr23_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr23_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join23(BITJOIN,37)@10
    assign u0_m0_wo0_wi0_r0_join23_q = {u0_m0_wo0_wi0_r0_split23_d, u0_m0_wo0_wi0_r0_split23_c, u0_m0_wo0_wi0_r0_split23_b, u0_m0_wo0_wi0_r0_split19_e};

    // u0_m0_wo0_wi0_r0_delayr23_wraddr(REG,211)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr23_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr23_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr23_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr23_mem(DUALMEM,208)@10 + 2
    assign u0_m0_wo0_wi0_r0_delayr23_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join23_q);
    assign u0_m0_wo0_wi0_r0_delayr23_mem_aa = u0_m0_wo0_wi0_r0_delayr23_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr23_mem_ab = u0_m0_wo0_wi0_r0_delayr23_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr23_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr23_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr23_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(64),
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
    ) u0_m0_wo0_wi0_r0_delayr23_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr23_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr23_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr23_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr23_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr23_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr23_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr23_mem_q = u0_m0_wo0_wi0_r0_delayr23_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split23(BITSELECT,38)@10
    assign u0_m0_wo0_wi0_r0_split23_b = $unsigned(u0_m0_wo0_wi0_r0_delayr23_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split23_c = $unsigned(u0_m0_wo0_wi0_r0_delayr23_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split23_d = $unsigned(u0_m0_wo0_wi0_r0_delayr23_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split23_e = $unsigned(u0_m0_wo0_wi0_r0_delayr23_mem_q[63:48]);

    // u0_m0_wo0_wi0_r0_join5(BITJOIN,23)@10
    assign u0_m0_wo0_wi0_r0_join5_q = {u0_m0_wo0_wi0_r0_split5_d, u0_m0_wo0_wi0_r0_split5_c, u0_m0_wo0_wi0_r0_split5_b, u0_m0_wo0_wi0_r0_split1_e};

    // u0_m0_wo0_wi0_r0_delayr5(DELAY,25)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr5_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr5_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr5_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr5_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join5_q);
            u0_m0_wo0_wi0_r0_delayr5_delay_1 <= u0_m0_wo0_wi0_r0_delayr5_delay_0;
            u0_m0_wo0_wi0_r0_delayr5_q <= u0_m0_wo0_wi0_r0_delayr5_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split5(BITSELECT,24)@10
    assign u0_m0_wo0_wi0_r0_split5_b = $unsigned(u0_m0_wo0_wi0_r0_delayr5_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split5_c = $unsigned(u0_m0_wo0_wi0_r0_delayr5_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split5_d = $unsigned(u0_m0_wo0_wi0_r0_delayr5_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split5_e = $unsigned(u0_m0_wo0_wi0_r0_delayr5_q[63:48]);

    // u0_m0_wo0_wi0_r0_delayr27_notEnable(LOGICAL,226)@10
    assign u0_m0_wo0_wi0_r0_delayr27_notEnable_q = $unsigned(~ (xIn_v));

    // u0_m0_wo0_wi0_r0_delayr27_nor(LOGICAL,227)@10
    assign u0_m0_wo0_wi0_r0_delayr27_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr27_notEnable_q | u0_m0_wo0_wi0_r0_delayr27_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr27_mem_last(CONSTANT,223)
    assign u0_m0_wo0_wi0_r0_delayr27_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr27_cmp(LOGICAL,224)@10
    assign u0_m0_wo0_wi0_r0_delayr27_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr27_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr27_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr27_mem_last_q == u0_m0_wo0_wi0_r0_delayr27_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr27_cmpReg(REG,225)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr27_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr27_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr27_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr27_sticky_ena(REG,228)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr27_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr27_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr27_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr27_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr27_enaAnd(LOGICAL,229)@10
    assign u0_m0_wo0_wi0_r0_delayr27_enaAnd_q = u0_m0_wo0_wi0_r0_delayr27_sticky_ena_q & xIn_v;

    // u0_m0_wo0_wi0_r0_delayr27_rdcnt(COUNTER,220)@10 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr27_rdcnt_i <= 2'd0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr27_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr27_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr27_rdcnt_q = u0_m0_wo0_wi0_r0_delayr27_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr27_rdmux(MUX,221)@10
    assign u0_m0_wo0_wi0_r0_delayr27_rdmux_s = xIn_v;
    always @(u0_m0_wo0_wi0_r0_delayr27_rdmux_s or u0_m0_wo0_wi0_r0_delayr27_wraddr_q or u0_m0_wo0_wi0_r0_delayr27_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr27_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr27_rdmux_q = u0_m0_wo0_wi0_r0_delayr27_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr27_rdmux_q = u0_m0_wo0_wi0_r0_delayr27_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr27_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join27(BITJOIN,40)@10
    assign u0_m0_wo0_wi0_r0_join27_q = {u0_m0_wo0_wi0_r0_split27_d, u0_m0_wo0_wi0_r0_split27_c, u0_m0_wo0_wi0_r0_split27_b, u0_m0_wo0_wi0_r0_split23_e};

    // u0_m0_wo0_wi0_r0_delayr27_wraddr(REG,222)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr27_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr27_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr27_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr27_mem(DUALMEM,219)@10 + 2
    assign u0_m0_wo0_wi0_r0_delayr27_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join27_q);
    assign u0_m0_wo0_wi0_r0_delayr27_mem_aa = u0_m0_wo0_wi0_r0_delayr27_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr27_mem_ab = u0_m0_wo0_wi0_r0_delayr27_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr27_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr27_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr27_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(64),
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
    ) u0_m0_wo0_wi0_r0_delayr27_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr27_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr27_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr27_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr27_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr27_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr27_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr27_mem_q = u0_m0_wo0_wi0_r0_delayr27_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split27(BITSELECT,41)@10
    assign u0_m0_wo0_wi0_r0_split27_b = $unsigned(u0_m0_wo0_wi0_r0_delayr27_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split27_c = $unsigned(u0_m0_wo0_wi0_r0_delayr27_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split27_d = $unsigned(u0_m0_wo0_wi0_r0_delayr27_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split27_e = $unsigned(u0_m0_wo0_wi0_r0_delayr27_mem_q[63:48]);

    // u0_m0_wo0_wi0_r0_join1(BITJOIN,20)@10
    assign u0_m0_wo0_wi0_r0_join1_q = {u0_m0_wo0_wi0_r0_split1_d, u0_m0_wo0_wi0_r0_split1_c, u0_m0_wo0_wi0_r0_split1_b, xIn_0};

    // u0_m0_wo0_wi0_r0_delayr1(DELAY,22)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr1_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr1_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr1_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr1_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join1_q);
            u0_m0_wo0_wi0_r0_delayr1_delay_1 <= u0_m0_wo0_wi0_r0_delayr1_delay_0;
            u0_m0_wo0_wi0_r0_delayr1_q <= u0_m0_wo0_wi0_r0_delayr1_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split1(BITSELECT,21)@10
    assign u0_m0_wo0_wi0_r0_split1_b = $unsigned(u0_m0_wo0_wi0_r0_delayr1_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split1_c = $unsigned(u0_m0_wo0_wi0_r0_delayr1_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split1_d = $unsigned(u0_m0_wo0_wi0_r0_delayr1_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split1_e = $unsigned(u0_m0_wo0_wi0_r0_delayr1_q[63:48]);

    // u0_m0_wo0_wi0_r0_delayr31_notEnable(LOGICAL,237)@10
    assign u0_m0_wo0_wi0_r0_delayr31_notEnable_q = $unsigned(~ (xIn_v));

    // u0_m0_wo0_wi0_r0_delayr31_nor(LOGICAL,238)@10
    assign u0_m0_wo0_wi0_r0_delayr31_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr31_notEnable_q | u0_m0_wo0_wi0_r0_delayr31_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr31_mem_last(CONSTANT,234)
    assign u0_m0_wo0_wi0_r0_delayr31_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr31_cmp(LOGICAL,235)@10
    assign u0_m0_wo0_wi0_r0_delayr31_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr31_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr31_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr31_mem_last_q == u0_m0_wo0_wi0_r0_delayr31_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr31_cmpReg(REG,236)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr31_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr31_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr31_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr31_sticky_ena(REG,239)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr31_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr31_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr31_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr31_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr31_enaAnd(LOGICAL,240)@10
    assign u0_m0_wo0_wi0_r0_delayr31_enaAnd_q = u0_m0_wo0_wi0_r0_delayr31_sticky_ena_q & xIn_v;

    // u0_m0_wo0_wi0_r0_delayr31_rdcnt(COUNTER,231)@10 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr31_rdcnt_i <= 2'd0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr31_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr31_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr31_rdcnt_q = u0_m0_wo0_wi0_r0_delayr31_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr31_rdmux(MUX,232)@10
    assign u0_m0_wo0_wi0_r0_delayr31_rdmux_s = xIn_v;
    always @(u0_m0_wo0_wi0_r0_delayr31_rdmux_s or u0_m0_wo0_wi0_r0_delayr31_wraddr_q or u0_m0_wo0_wi0_r0_delayr31_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr31_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr31_rdmux_q = u0_m0_wo0_wi0_r0_delayr31_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr31_rdmux_q = u0_m0_wo0_wi0_r0_delayr31_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr31_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join31(BITJOIN,43)@10
    assign u0_m0_wo0_wi0_r0_join31_q = {u0_m0_wo0_wi0_r0_split31_d, u0_m0_wo0_wi0_r0_split31_c, u0_m0_wo0_wi0_r0_split31_b, u0_m0_wo0_wi0_r0_split27_e};

    // u0_m0_wo0_wi0_r0_delayr31_wraddr(REG,233)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr31_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr31_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr31_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr31_mem(DUALMEM,230)@10 + 2
    assign u0_m0_wo0_wi0_r0_delayr31_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join31_q);
    assign u0_m0_wo0_wi0_r0_delayr31_mem_aa = u0_m0_wo0_wi0_r0_delayr31_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr31_mem_ab = u0_m0_wo0_wi0_r0_delayr31_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr31_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr31_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr31_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(64),
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
    ) u0_m0_wo0_wi0_r0_delayr31_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr31_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr31_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr31_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr31_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr31_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr31_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr31_mem_q = u0_m0_wo0_wi0_r0_delayr31_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split31(BITSELECT,44)@10
    assign u0_m0_wo0_wi0_r0_split31_b = $unsigned(u0_m0_wo0_wi0_r0_delayr31_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split31_c = $unsigned(u0_m0_wo0_wi0_r0_delayr31_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split31_d = $unsigned(u0_m0_wo0_wi0_r0_delayr31_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split31_e = $unsigned(u0_m0_wo0_wi0_r0_delayr31_mem_q[63:48]);

    // u0_m0_wo0_wi0_r0_delayr35_notEnable(LOGICAL,248)@10
    assign u0_m0_wo0_wi0_r0_delayr35_notEnable_q = $unsigned(~ (xIn_v));

    // u0_m0_wo0_wi0_r0_delayr35_nor(LOGICAL,249)@10
    assign u0_m0_wo0_wi0_r0_delayr35_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr35_notEnable_q | u0_m0_wo0_wi0_r0_delayr35_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr35_mem_last(CONSTANT,245)
    assign u0_m0_wo0_wi0_r0_delayr35_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr35_cmp(LOGICAL,246)@10
    assign u0_m0_wo0_wi0_r0_delayr35_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr35_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr35_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr35_mem_last_q == u0_m0_wo0_wi0_r0_delayr35_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr35_cmpReg(REG,247)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr35_cmpReg_q <= $unsigned(1'b0);
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr35_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr35_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr35_sticky_ena(REG,250)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr35_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr35_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr35_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr35_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr35_enaAnd(LOGICAL,251)@10
    assign u0_m0_wo0_wi0_r0_delayr35_enaAnd_q = u0_m0_wo0_wi0_r0_delayr35_sticky_ena_q & xIn_v;

    // u0_m0_wo0_wi0_r0_delayr35_rdcnt(COUNTER,242)@10 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr35_rdcnt_i <= 2'd0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr35_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr35_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr35_rdcnt_q = u0_m0_wo0_wi0_r0_delayr35_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr35_rdmux(MUX,243)@10
    assign u0_m0_wo0_wi0_r0_delayr35_rdmux_s = xIn_v;
    always @(u0_m0_wo0_wi0_r0_delayr35_rdmux_s or u0_m0_wo0_wi0_r0_delayr35_wraddr_q or u0_m0_wo0_wi0_r0_delayr35_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr35_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr35_rdmux_q = u0_m0_wo0_wi0_r0_delayr35_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr35_rdmux_q = u0_m0_wo0_wi0_r0_delayr35_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr35_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_delayr35_wraddr(REG,244)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr35_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr35_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr35_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr35_mem(DUALMEM,241)@10 + 2
    assign u0_m0_wo0_wi0_r0_delayr35_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_split31_e);
    assign u0_m0_wo0_wi0_r0_delayr35_mem_aa = u0_m0_wo0_wi0_r0_delayr35_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr35_mem_ab = u0_m0_wo0_wi0_r0_delayr35_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr35_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr35_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr35_mem_reset0 = areset;
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
    ) u0_m0_wo0_wi0_r0_delayr35_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr35_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr35_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr35_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr35_mem_ia),
        .wren_a(xIn_v[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr35_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr35_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr35_mem_q = u0_m0_wo0_wi0_r0_delayr35_mem_iq[15:0];

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // d_u0_m0_wo0_compute_q_13(DELAY,175)@10 + 3
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

    // u0_m0_wo0_cma0(CHAINMULTADD,86)@10 + 5
    assign u0_m0_wo0_cma0_reset = areset;
    assign u0_m0_wo0_cma0_ena0 = xIn_v[0] | u0_m0_wo0_cma0_reset;
    assign u0_m0_wo0_cma0_ena1 = d_u0_m0_wo0_compute_q_13_q[0] | u0_m0_wo0_cma0_reset;
    assign u0_m0_wo0_cma0_ena2 = 1'b1;

    assign u0_m0_wo0_cma0_a0 = $unsigned(u0_m0_wo0_wi0_r0_delayr35_mem_q);
    assign u0_m0_wo0_cma0_b0 = $unsigned(xIn_0);
    assign u0_m0_wo0_cma0_c0 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a1 = $unsigned(u0_m0_wo0_wi0_r0_split31_e);
    assign u0_m0_wo0_cma0_b1 = $unsigned(u0_m0_wo0_wi0_r0_split1_b);
    assign u0_m0_wo0_cma0_c1 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a2 = $unsigned(u0_m0_wo0_wi0_r0_split31_d);
    assign u0_m0_wo0_cma0_b2 = $unsigned(u0_m0_wo0_wi0_r0_split1_c);
    assign u0_m0_wo0_cma0_c2 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a3 = $unsigned(u0_m0_wo0_wi0_r0_split31_c);
    assign u0_m0_wo0_cma0_b3 = $unsigned(u0_m0_wo0_wi0_r0_split1_d);
    assign u0_m0_wo0_cma0_c3 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a4 = $unsigned(u0_m0_wo0_wi0_r0_split31_b);
    assign u0_m0_wo0_cma0_b4 = $unsigned(u0_m0_wo0_wi0_r0_split1_e);
    assign u0_m0_wo0_cma0_c4 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a5 = $unsigned(u0_m0_wo0_wi0_r0_split27_e);
    assign u0_m0_wo0_cma0_b5 = $unsigned(u0_m0_wo0_wi0_r0_split5_b);
    assign u0_m0_wo0_cma0_c5 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a6 = $unsigned(u0_m0_wo0_wi0_r0_split27_d);
    assign u0_m0_wo0_cma0_b6 = $unsigned(u0_m0_wo0_wi0_r0_split5_c);
    assign u0_m0_wo0_cma0_c6 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a7 = $unsigned(u0_m0_wo0_wi0_r0_split27_c);
    assign u0_m0_wo0_cma0_b7 = $unsigned(u0_m0_wo0_wi0_r0_split5_d);
    assign u0_m0_wo0_cma0_c7 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a8 = $unsigned(u0_m0_wo0_wi0_r0_split27_b);
    assign u0_m0_wo0_cma0_b8 = $unsigned(u0_m0_wo0_wi0_r0_split5_e);
    assign u0_m0_wo0_cma0_c8 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a9 = $unsigned(u0_m0_wo0_wi0_r0_split23_e);
    assign u0_m0_wo0_cma0_b9 = $unsigned(u0_m0_wo0_wi0_r0_split9_b);
    assign u0_m0_wo0_cma0_c9 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a10 = $unsigned(u0_m0_wo0_wi0_r0_split23_d);
    assign u0_m0_wo0_cma0_b10 = $unsigned(u0_m0_wo0_wi0_r0_split9_c);
    assign u0_m0_wo0_cma0_c10 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a11 = $unsigned(u0_m0_wo0_wi0_r0_split23_c);
    assign u0_m0_wo0_cma0_b11 = $unsigned(u0_m0_wo0_wi0_r0_split9_d);
    assign u0_m0_wo0_cma0_c11 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a12 = $unsigned(u0_m0_wo0_wi0_r0_split23_b);
    assign u0_m0_wo0_cma0_b12 = $unsigned(u0_m0_wo0_wi0_r0_split9_e);
    assign u0_m0_wo0_cma0_c12 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a13 = $unsigned(u0_m0_wo0_wi0_r0_split19_e);
    assign u0_m0_wo0_cma0_b13 = $unsigned(u0_m0_wo0_wi0_r0_split13_b);
    assign u0_m0_wo0_cma0_c13 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a14 = $unsigned(u0_m0_wo0_wi0_r0_split19_d);
    assign u0_m0_wo0_cma0_b14 = $unsigned(u0_m0_wo0_wi0_r0_split13_c);
    assign u0_m0_wo0_cma0_c14 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a15 = $unsigned(u0_m0_wo0_wi0_r0_split19_c);
    assign u0_m0_wo0_cma0_b15 = $unsigned(u0_m0_wo0_wi0_r0_split13_d);
    assign u0_m0_wo0_cma0_c15 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a16 = $unsigned(u0_m0_wo0_wi0_r0_split19_b);
    assign u0_m0_wo0_cma0_b16 = $unsigned(u0_m0_wo0_wi0_r0_split13_e);
    assign u0_m0_wo0_cma0_c16 = {2'b00, GND_q[0:0]};
    assign u0_m0_wo0_cma0_a17 = $unsigned(u0_m0_wo0_wi0_r0_delayr18_mem_q);
    assign u0_m0_wo0_cma0_b17 = $unsigned(u0_m0_wo0_wi0_r0_delayr17_q);
    assign u0_m0_wo0_cma0_c17 = {2'b00, GND_q[0:0]};
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
        .coef_a_0(10402),
        .coef_b_0(-3393),
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
        .ay(u0_m0_wo0_cma0_a17),
        .by(u0_m0_wo0_cma0_a16),
        .az(u0_m0_wo0_cma0_b17),
        .bz(u0_m0_wo0_cma0_b16),
        .coefsela(u0_m0_wo0_cma0_c17),
        .coefselb(u0_m0_wo0_cma0_c16),
        .chainout(u0_m0_wo0_cma0_s16),
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
        .coef_b_0(-1302),
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
        .ay(u0_m0_wo0_cma0_a15),
        .by(u0_m0_wo0_cma0_a14),
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
        .coef_a_0(925),
        .coef_b_0(-677),
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
        .ay(u0_m0_wo0_cma0_a13),
        .by(u0_m0_wo0_cma0_a12),
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
        .coef_a_0(498),
        .coef_b_0(-367),
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
        .ay(u0_m0_wo0_cma0_a11),
        .by(u0_m0_wo0_cma0_a10),
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
        .coef_a_0(266),
        .coef_b_0(-191),
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
        .chainin(u0_m0_wo0_cma0_s10),
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
        .coef_b_0(-91),
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
        .coef_a_0(59),
        .coef_b_0(-38),
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
        .coef_a_0(22),
        .coef_b_0(-13),
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
        .coef_a_0(6),
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
        .chainin(u0_m0_wo0_cma0_s2),
        .resulta(u0_m0_wo0_cma0_s0),
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

    // d_u0_m0_wo0_cma0_q_16(DELAY,176)@15 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_cma0_q_16_q <= $unsigned(u0_m0_wo0_cma0_q);
        end
    end

    // u0_m0_wo0_oseq_gated_reg(REG,87)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_oseq_gated_reg_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m0_wo0_oseq_gated_reg_q <= $unsigned(d_u0_m0_wo0_compute_q_13_q);
        end
    end

    // d_u0_m0_wo0_oseq_gated_reg_q_15(DELAY,177)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m0_wo0_oseq_gated_reg_q_15_q <= '0;
        end
        else
        begin
            d_u0_m0_wo0_oseq_gated_reg_q_15_q <= $unsigned(u0_m0_wo0_oseq_gated_reg_q);
        end
    end

    // d_u0_m0_wo0_oseq_gated_reg_q_16(DELAY,178)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m0_wo0_oseq_gated_reg_q_16_q <= '0;
        end
        else
        begin
            d_u0_m0_wo0_oseq_gated_reg_q_16_q <= $unsigned(d_u0_m0_wo0_oseq_gated_reg_q_15_q);
        end
    end

    // out1_m0_wo0_lineup_select_seq_0(SEQUENCE,120)@15 + 1
    always @ (posedge clk)
    begin
        reg [4:0] out1_m0_wo0_lineup_select_seq_0_c;
        if (areset)
        begin
            out1_m0_wo0_lineup_select_seq_0_c = 5'b00010;
            out1_m0_wo0_lineup_select_seq_0_q <= $unsigned(1'b0);
            out1_m0_wo0_lineup_select_seq_0_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m0_wo0_oseq_gated_reg_q_15_q == 1'b1)
            begin
                if (out1_m0_wo0_lineup_select_seq_0_c == 5'b11111)
                begin
                    out1_m0_wo0_lineup_select_seq_0_eq <= 1'b1;
                end
                else
                begin
                    out1_m0_wo0_lineup_select_seq_0_eq <= 1'b0;
                end
                if (out1_m0_wo0_lineup_select_seq_0_eq == 1'b1)
                begin
                    out1_m0_wo0_lineup_select_seq_0_c = $signed(out1_m0_wo0_lineup_select_seq_0_c) + $signed(5'd3);
                end
                else
                begin
                    out1_m0_wo0_lineup_select_seq_0_c = $signed(out1_m0_wo0_lineup_select_seq_0_c) - $signed(5'd1);
                end
                out1_m0_wo0_lineup_select_seq_0_q <= $unsigned(out1_m0_wo0_lineup_select_seq_0_c[4:4]);
            end
        end
    end

    // out1_m0_wo0_lineup_select_0(LOGICAL,121)@16
    assign out1_m0_wo0_lineup_select_0_q = out1_m0_wo0_lineup_select_seq_0_q & d_u0_m0_wo0_oseq_gated_reg_q_16_q;

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // out1_wo0_data_selector(SELECTOR,131)@16 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            out1_wo0_data_selector_q <= $unsigned({{5{d_sR_mergedSignalTMB_uid143_u0_m1_wo0_mtree_mult1_0_q_16_q[31]}}, d_sR_mergedSignalTMB_uid143_u0_m1_wo0_mtree_mult1_0_q_16_q});
            if (out1_m1_wo0_lineup_select_0_q == 1'b1)
            begin
                out1_wo0_data_selector_q <= $unsigned({{5{d_sR_mergedSignalTMB_uid143_u0_m1_wo0_mtree_mult1_0_q_16_q[31]}}, d_sR_mergedSignalTMB_uid143_u0_m1_wo0_mtree_mult1_0_q_16_q});
            end
            if (out1_m0_wo0_lineup_select_0_q == 1'b1)
            begin
                out1_wo0_data_selector_q <= $unsigned(d_u0_m0_wo0_cma0_q_16_q);
            end
        end
    end

    // out0_m1_wo0_lineup_0(DELAY,112)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            out0_m1_wo0_lineup_0_delay_0 <= $unsigned(sR_mergedSignalTMB_uid143_u0_m1_wo0_mtree_mult1_0_q);
            out0_m1_wo0_lineup_0_q <= out0_m1_wo0_lineup_0_delay_0;
        end
    end

    // out0_m1_wo0_assign_id6(DELAY,116)@15
    assign out0_m1_wo0_assign_id6_q = $unsigned(out0_m1_wo0_lineup_0_q);

    // out0_m1_wo0_lineup_select_seq_0(SEQUENCE,113)@14 + 1
    always @ (posedge clk)
    begin
        reg [4:0] out0_m1_wo0_lineup_select_seq_0_c;
        if (areset)
        begin
            out0_m1_wo0_lineup_select_seq_0_c = 5'b00000;
            out0_m1_wo0_lineup_select_seq_0_q <= $unsigned(1'b0);
            out0_m1_wo0_lineup_select_seq_0_eq <= 1'b0;
        end
        else
        begin
            if (u0_m1_wo0_oseq_gated_reg_q == 1'b1)
            begin
                if (out0_m1_wo0_lineup_select_seq_0_c == 5'b11111)
                begin
                    out0_m1_wo0_lineup_select_seq_0_eq <= 1'b1;
                end
                else
                begin
                    out0_m1_wo0_lineup_select_seq_0_eq <= 1'b0;
                end
                if (out0_m1_wo0_lineup_select_seq_0_eq == 1'b1)
                begin
                    out0_m1_wo0_lineup_select_seq_0_c = $signed(out0_m1_wo0_lineup_select_seq_0_c) + $signed(5'd3);
                end
                else
                begin
                    out0_m1_wo0_lineup_select_seq_0_c = $signed(out0_m1_wo0_lineup_select_seq_0_c) - $signed(5'd1);
                end
                out0_m1_wo0_lineup_select_seq_0_q <= $unsigned(out0_m1_wo0_lineup_select_seq_0_c[4:4]);
            end
        end
    end

    // out0_m1_wo0_lineup_select_0(LOGICAL,114)@15
    assign out0_m1_wo0_lineup_select_0_q = out0_m1_wo0_lineup_select_seq_0_q & d_u0_m1_wo0_oseq_gated_reg_q_15_q;

    // out0_m1_wo0_lineup_select_delay_0(DELAY,115)@15
    always @ (posedge clk)
    begin
        if (areset)
        begin
            out0_m1_wo0_lineup_select_delay_0_delay_0 <= '0;
        end
        else
        begin
            out0_m1_wo0_lineup_select_delay_0_delay_0 <= $unsigned(out0_m1_wo0_lineup_select_0_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            out0_m1_wo0_lineup_select_delay_0_q <= out0_m1_wo0_lineup_select_delay_0_delay_0;
        end
    end

    // out0_m1_wo0_assign_id7(DELAY,117)@15
    assign out0_m1_wo0_assign_id7_q = $unsigned(out0_m1_wo0_lineup_select_delay_0_q);

    // out0_m0_wo0_lineup_0(DELAY,106)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            out0_m0_wo0_lineup_0_delay_0 <= $unsigned(u0_m0_wo0_cma0_q);
            out0_m0_wo0_lineup_0_q <= out0_m0_wo0_lineup_0_delay_0;
        end
    end

    // out0_m0_wo0_assign_id4(DELAY,110)@15
    assign out0_m0_wo0_assign_id4_q = $unsigned(out0_m0_wo0_lineup_0_q);

    // out0_m0_wo0_lineup_select_seq_0(SEQUENCE,107)@14 + 1
    always @ (posedge clk)
    begin
        reg [4:0] out0_m0_wo0_lineup_select_seq_0_c;
        if (areset)
        begin
            out0_m0_wo0_lineup_select_seq_0_c = 5'b00000;
            out0_m0_wo0_lineup_select_seq_0_q <= $unsigned(1'b0);
            out0_m0_wo0_lineup_select_seq_0_eq <= 1'b0;
        end
        else
        begin
            if (u0_m0_wo0_oseq_gated_reg_q == 1'b1)
            begin
                if (out0_m0_wo0_lineup_select_seq_0_c == 5'b11111)
                begin
                    out0_m0_wo0_lineup_select_seq_0_eq <= 1'b1;
                end
                else
                begin
                    out0_m0_wo0_lineup_select_seq_0_eq <= 1'b0;
                end
                if (out0_m0_wo0_lineup_select_seq_0_eq == 1'b1)
                begin
                    out0_m0_wo0_lineup_select_seq_0_c = $signed(out0_m0_wo0_lineup_select_seq_0_c) + $signed(5'd3);
                end
                else
                begin
                    out0_m0_wo0_lineup_select_seq_0_c = $signed(out0_m0_wo0_lineup_select_seq_0_c) - $signed(5'd1);
                end
                out0_m0_wo0_lineup_select_seq_0_q <= $unsigned(out0_m0_wo0_lineup_select_seq_0_c[4:4]);
            end
        end
    end

    // out0_m0_wo0_lineup_select_0(LOGICAL,108)@15
    assign out0_m0_wo0_lineup_select_0_q = out0_m0_wo0_lineup_select_seq_0_q & d_u0_m0_wo0_oseq_gated_reg_q_15_q;

    // out0_m0_wo0_lineup_select_delay_0(DELAY,109)@15
    always @ (posedge clk)
    begin
        if (areset)
        begin
            out0_m0_wo0_lineup_select_delay_0_delay_0 <= '0;
        end
        else
        begin
            out0_m0_wo0_lineup_select_delay_0_delay_0 <= $unsigned(out0_m0_wo0_lineup_select_0_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            out0_m0_wo0_lineup_select_delay_0_q <= out0_m0_wo0_lineup_select_delay_0_delay_0;
        end
    end

    // out0_m0_wo0_assign_id5(DELAY,111)@15
    assign out0_m0_wo0_assign_id5_q = $unsigned(out0_m0_wo0_lineup_select_delay_0_q);

    // out0_wo0_data_selector(SELECTOR,118)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            out0_wo0_data_selector_q <= 37'b0;
            out0_wo0_data_selector_v <= 1'b0;
        end
        else
        begin
            out0_wo0_data_selector_q <= $unsigned({{5{out0_m1_wo0_assign_id6_q[31]}}, out0_m1_wo0_assign_id6_q});
            out0_wo0_data_selector_v <= $unsigned(1'b0);
            if (out0_m1_wo0_assign_id7_q == 1'b1)
            begin
                out0_wo0_data_selector_q <= $unsigned({{5{out0_m1_wo0_assign_id6_q[31]}}, out0_m1_wo0_assign_id6_q});
                out0_wo0_data_selector_v <= $unsigned(1'b1);
            end
            if (out0_m0_wo0_assign_id5_q == 1'b1)
            begin
                out0_wo0_data_selector_q <= $unsigned(out0_m0_wo0_assign_id4_q);
                out0_wo0_data_selector_v <= $unsigned(1'b1);
            end
        end
    end

    // d_out0_wo0_data_selector_q_17(DELAY,181)@16 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_out0_wo0_data_selector_q_17_q <= $unsigned(out0_wo0_data_selector_q);
        end
    end

    // outchan(COUNTER,132)@16 + 1
    // low=0, high=1, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            outchan_i <= 1'd1;
        end
        else if (out0_wo0_data_selector_v == 1'b1)
        begin
            outchan_i <= $unsigned(outchan_i) + $unsigned(1'd1);
        end
    end
    assign outchan_q = {1'b0, outchan_i[0:0]};

    // d_out0_wo0_data_selector_v_17(DELAY,182)@16 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_out0_wo0_data_selector_v_17_q <= '0;
        end
        else
        begin
            d_out0_wo0_data_selector_v_17_q <= $unsigned(out0_wo0_data_selector_v);
        end
    end

    // xOut(PORTOUT,133)@17 + 1
    assign xOut_v = d_out0_wo0_data_selector_v_17_q;
    assign xOut_c = {6'b000000, outchan_q};
    assign xOut_0 = {{1{d_out0_wo0_data_selector_q_17_q[36]}}, d_out0_wo0_data_selector_q_17_q};
    assign xOut_1 = {{1{out1_wo0_data_selector_q[36]}}, out1_wo0_data_selector_q};

endmodule
