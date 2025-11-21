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

// SystemVerilog created from duc_model_DUT_ChanFilt_DUC_DUC_l1_HB2_HB2_re
// SystemVerilog created on Thu Jan  9 15:34:39 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module duc_model_DUT_ChanFilt_DUC_DUC_l1_HB2_HB2_re (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [15:0] xIn_0,
    input wire [15:0] xIn_1,
    output wire [0:0] xOut_v,
    output wire [7:0] xOut_c,
    output wire [35:0] xOut_0,
    output wire [35:0] xOut_1,
    output wire [35:0] xOut_2,
    output wire [35:0] xOut_3,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [15:0] d_in0_m0_wi0_wo0_assign_id0_q_13_q;
    reg [15:0] d_in0_m0_wi0_wo0_assign_id0_q_13_delay_0;
    reg [15:0] d_in0_m0_wi0_wo0_assign_id0_q_13_delay_1;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_13_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_13_delay_0;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_13_delay_1;
    reg [15:0] d_u0_m0_wo0_wi0_r0_phasedelay0_q_14_q;
    reg [0:0] u0_m0_wo0_oseq_gated_reg_q;
    reg [0:0] d_u0_m0_wo0_oseq_gated_reg_q_15_q;
    reg [15:0] d_in1_m0_wi0_wo0_assign_id2_q_13_q;
    reg [15:0] d_in1_m0_wi0_wo0_assign_id2_q_13_delay_0;
    reg [15:0] d_in1_m0_wi0_wo0_assign_id2_q_13_delay_1;
    reg [15:0] d_u1_m0_wo0_wi0_r0_phasedelay0_q_14_q;
    reg [0:0] u0_m1_wo0_memread_q;
    reg [0:0] d_u0_m1_wo0_compute_q_13_q;
    reg [0:0] d_u0_m1_wo0_compute_q_13_delay_0;
    reg [0:0] d_u0_m1_wo0_compute_q_13_delay_1;
    reg [15:0] u0_m1_wo0_wi0_r0_phasedelay0_q;
    reg [15:0] u0_m1_wo0_wi0_r0_delayr1_q;
    reg [15:0] u0_m1_wo0_wi0_r0_delayr2_q;
    reg [15:0] u0_m1_wo0_wi0_r0_delayr3_q;
    reg [15:0] u0_m1_wo0_wi0_r0_delayr4_q;
    reg [15:0] u0_m1_wo0_wi0_r0_delayr5_q;
    reg [15:0] u0_m1_wo0_wi0_r0_delayr5_delay_0;
    reg [63:0] u0_m1_wo0_wi0_r0_delayr6_q;
    reg [63:0] u0_m1_wo0_wi0_r0_delayr6_delay_0;
    reg [63:0] u0_m1_wo0_wi0_r0_delayr6_delay_1;
    wire u0_m1_wo0_cma0_reset;
    wire [15:0] u0_m1_wo0_cma0_a0;
    wire [15:0] u0_m1_wo0_cma0_b0;
    wire [2:0] u0_m1_wo0_cma0_c0;
    wire [15:0] u0_m1_wo0_cma0_a1;
    wire [15:0] u0_m1_wo0_cma0_b1;
    wire [2:0] u0_m1_wo0_cma0_c1;
    wire [15:0] u0_m1_wo0_cma0_a2;
    wire [15:0] u0_m1_wo0_cma0_b2;
    wire [2:0] u0_m1_wo0_cma0_c2;
    wire [15:0] u0_m1_wo0_cma0_a3;
    wire [15:0] u0_m1_wo0_cma0_b3;
    wire [2:0] u0_m1_wo0_cma0_c3;
    wire [15:0] u0_m1_wo0_cma0_a4;
    wire [15:0] u0_m1_wo0_cma0_b4;
    wire [2:0] u0_m1_wo0_cma0_c4;
    wire [15:0] u0_m1_wo0_cma0_a5;
    wire [15:0] u0_m1_wo0_cma0_b5;
    wire [2:0] u0_m1_wo0_cma0_c5;
    wire [34:0] u0_m1_wo0_cma0_s0;
    wire [43:0] u0_m1_wo0_cma0_s2;
    wire [43:0] u0_m1_wo0_cma0_s4;
    wire [34:0] u0_m1_wo0_cma0_qq0;
    reg [34:0] u0_m1_wo0_cma0_q;
    wire u0_m1_wo0_cma0_ena0;
    wire u0_m1_wo0_cma0_ena1;
    wire u0_m1_wo0_cma0_ena2;
    (* preserve_syn_only *) reg [15:0] u0_m1_wo0_cma0_zero;
    reg [0:0] u0_m1_wo0_oseq_gated_reg_q;
    reg [0:0] d_u0_m1_wo0_oseq_gated_reg_q_15_q;
    reg [15:0] u1_m1_wo0_wi0_r0_phasedelay0_q;
    reg [15:0] u1_m1_wo0_wi0_r0_delayr1_q;
    reg [15:0] u1_m1_wo0_wi0_r0_delayr2_q;
    reg [15:0] u1_m1_wo0_wi0_r0_delayr3_q;
    reg [15:0] u1_m1_wo0_wi0_r0_delayr4_q;
    reg [15:0] u1_m1_wo0_wi0_r0_delayr5_q;
    reg [15:0] u1_m1_wo0_wi0_r0_delayr5_delay_0;
    reg [63:0] u1_m1_wo0_wi0_r0_delayr6_q;
    reg [63:0] u1_m1_wo0_wi0_r0_delayr6_delay_0;
    reg [63:0] u1_m1_wo0_wi0_r0_delayr6_delay_1;
    wire u1_m1_wo0_cma0_reset;
    wire [15:0] u1_m1_wo0_cma0_a0;
    wire [15:0] u1_m1_wo0_cma0_b0;
    wire [2:0] u1_m1_wo0_cma0_c0;
    wire [15:0] u1_m1_wo0_cma0_a1;
    wire [15:0] u1_m1_wo0_cma0_b1;
    wire [2:0] u1_m1_wo0_cma0_c1;
    wire [15:0] u1_m1_wo0_cma0_a2;
    wire [15:0] u1_m1_wo0_cma0_b2;
    wire [2:0] u1_m1_wo0_cma0_c2;
    wire [15:0] u1_m1_wo0_cma0_a3;
    wire [15:0] u1_m1_wo0_cma0_b3;
    wire [2:0] u1_m1_wo0_cma0_c3;
    wire [15:0] u1_m1_wo0_cma0_a4;
    wire [15:0] u1_m1_wo0_cma0_b4;
    wire [2:0] u1_m1_wo0_cma0_c4;
    wire [15:0] u1_m1_wo0_cma0_a5;
    wire [15:0] u1_m1_wo0_cma0_b5;
    wire [2:0] u1_m1_wo0_cma0_c5;
    wire [34:0] u1_m1_wo0_cma0_s0;
    wire [43:0] u1_m1_wo0_cma0_s2;
    wire [43:0] u1_m1_wo0_cma0_s4;
    wire [34:0] u1_m1_wo0_cma0_qq0;
    reg [34:0] u1_m1_wo0_cma0_q;
    wire u1_m1_wo0_cma0_ena0;
    wire u1_m1_wo0_cma0_ena1;
    wire u1_m1_wo0_cma0_ena2;
    (* preserve_syn_only *) reg [15:0] u1_m1_wo0_cma0_zero;
    reg [30:0] out0_m0_wo0_lineup_0_q;
    reg [0:0] out0_m0_wo0_lineup_select_seq_0_q;
    reg out0_m0_wo0_lineup_select_seq_0_eq;
    reg [0:0] out0_m0_wo0_lineup_select_delay_0_q;
    reg [34:0] out0_m1_wo0_lineup_0_q;
    reg [0:0] out0_m1_wo0_lineup_select_seq_0_q;
    reg out0_m1_wo0_lineup_select_seq_0_eq;
    reg [0:0] out0_m1_wo0_lineup_select_delay_0_q;
    reg [34:0] out0_wo0_data_selector_q;
    reg [0:0] out0_wo0_data_selector_v;
    reg [0:0] out1_m0_wo0_lineup_select_seq_0_q;
    reg out1_m0_wo0_lineup_select_seq_0_eq;
    reg [0:0] out1_m1_wo0_lineup_select_seq_0_q;
    reg out1_m1_wo0_lineup_select_seq_0_eq;
    reg [34:0] out1_wo0_data_selector_q;
    reg [30:0] out2_m0_wo0_lineup_1_q;
    reg [34:0] out2_m1_wo0_lineup_1_q;
    reg [34:0] out2_wo0_data_selector_q;
    reg [34:0] out3_wo0_data_selector_q;
    wire [13:0] padACst_uid189_u0_m0_wo0_mtree_mult1_0_q;
    wire [20:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_a;
    wire [20:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_b;
    logic [20:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_o;
    wire [0:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_c;
    wire [19:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_q;
    reg [19:0] d_sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_q_15_q;
    wire [12:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_a;
    wire [12:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_b;
    logic [12:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_o;
    wire [0:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_cin;
    wire [10:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_q;
    wire [20:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_a;
    wire [20:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_b;
    logic [20:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_o;
    wire [0:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_c;
    wire [19:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_q;
    reg [19:0] d_sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_q_15_q;
    wire [12:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_a;
    wire [12:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_b;
    logic [12:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_o;
    wire [0:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_cin;
    wire [10:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_q;
    wire u0_m0_wo0_wi0_r0_delayr0_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_mem_ia;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr0_mem_aa;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr0_mem_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_mem_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_mem_q;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr0_rdcnt_q;
    (* preserve_syn_only *) reg [3:0] u0_m0_wo0_wi0_r0_delayr0_rdcnt_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq;
    reg [3:0] u0_m0_wo0_wi0_r0_delayr0_wraddr_q;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q;
    wire u1_m0_wo0_wi0_r0_delayr0_mem_reset0;
    wire u1_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr0_mem_ia;
    wire [3:0] u1_m0_wo0_wi0_r0_delayr0_mem_aa;
    wire [3:0] u1_m0_wo0_wi0_r0_delayr0_mem_ab;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr0_mem_iq;
    wire [15:0] u1_m0_wo0_wi0_r0_delayr0_mem_q;
    wire [3:0] u1_m0_wo0_wi0_r0_delayr0_rdcnt_q;
    (* preserve_syn_only *) reg [3:0] u1_m0_wo0_wi0_r0_delayr0_rdcnt_i;
    (* preserve_syn_only *) reg u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq;
    reg [3:0] u1_m0_wo0_wi0_r0_delayr0_wraddr_q;
    wire [3:0] u1_m0_wo0_wi0_r0_delayr0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u1_m0_wo0_wi0_r0_delayr0_sticky_ena_q;
    wire [0:0] out0_m0_wo0_lineup_select_0_q;
    wire [0:0] out0_m1_wo0_lineup_select_0_q;
    wire [0:0] out1_m0_wo0_lineup_select_0_q;
    wire [0:0] out1_m1_wo0_lineup_select_0_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_rdmux_s;
    reg [3:0] u0_m0_wo0_wi0_r0_delayr0_rdmux_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_enaAnd_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_rdmux_s;
    reg [3:0] u1_m0_wo0_wi0_r0_delayr0_rdmux_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_cmp_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_notEnable_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_nor_q;
    wire [0:0] u1_m0_wo0_wi0_r0_delayr0_enaAnd_q;
    wire [9:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_0_b;
    wire [0:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b;
    wire [9:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_0_b;
    wire [0:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b;
    reg [0:0] u0_m1_wo0_compute_q;
    wire [15:0] u0_m1_wo0_wi0_r0_split6_b;
    wire [15:0] u0_m1_wo0_wi0_r0_split6_c;
    wire [15:0] u0_m1_wo0_wi0_r0_split6_d;
    wire [15:0] u0_m1_wo0_wi0_r0_split6_e;
    wire [15:0] u1_m1_wo0_wi0_r0_split6_b;
    wire [15:0] u1_m1_wo0_wi0_r0_split6_c;
    wire [15:0] u1_m1_wo0_wi0_r0_split6_d;
    wire [15:0] u1_m1_wo0_wi0_r0_split6_e;
    reg [30:0] out0_m0_wo0_assign_id8_q;
    reg [0:0] out0_m0_wo0_assign_id9_q;
    reg [34:0] out0_m1_wo0_assign_id10_q;
    reg [0:0] out0_m1_wo0_assign_id11_q;
    reg [30:0] out2_m0_wo0_assign_id16_q;
    reg [34:0] out2_m1_wo0_assign_id18_q;
    wire [30:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_BitJoin_for_q_q;
    wire [30:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_BitJoin_for_q_q;
    reg [15:0] u0_m0_wo0_wi0_r0_phasedelay0_q;
    reg [15:0] u1_m0_wo0_wi0_r0_phasedelay0_q;
    wire [10:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_c_q;
    wire [10:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_c_q;
    wire [10:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_c_q;
    wire [10:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_c_q;
    wire [63:0] u0_m1_wo0_wi0_r0_join6_q;
    wire [63:0] u1_m1_wo0_wi0_r0_join6_q;
    wire [5:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel0_1_b;
    wire [0:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_tessel0_1_b;
    wire [19:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_b_q;
    wire [5:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel0_1_b;
    wire [0:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_tessel0_1_b;
    wire [19:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_b_q;
    wire [19:0] sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_b_q;
    wire [19:0] sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_b_q;

    import duc_model_DUT_safe_path_ver::safe_path_ver;

    // u1_m1_wo0_wi0_r0_delayr4(DELAY,91)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m1_wo0_wi0_r0_delayr4_q <= '0;
        end
        else if (u0_m1_wo0_compute_q == 1'b1)
        begin
            u1_m1_wo0_wi0_r0_delayr4_q <= $unsigned(u1_m1_wo0_wi0_r0_delayr3_q);
        end
    end

    // u1_m1_wo0_wi0_r0_delayr5(DELAY,92)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m1_wo0_wi0_r0_delayr5_delay_0 <= '0;
            u1_m1_wo0_wi0_r0_delayr5_q <= '0;
        end
        else if (u0_m1_wo0_compute_q == 1'b1)
        begin
            u1_m1_wo0_wi0_r0_delayr5_delay_0 <= $unsigned(u1_m1_wo0_wi0_r0_delayr4_q);
            u1_m1_wo0_wi0_r0_delayr5_q <= u1_m1_wo0_wi0_r0_delayr5_delay_0;
        end
    end

    // u1_m1_wo0_wi0_r0_delayr3(DELAY,90)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m1_wo0_wi0_r0_delayr3_q <= '0;
        end
        else if (u0_m1_wo0_compute_q == 1'b1)
        begin
            u1_m1_wo0_wi0_r0_delayr3_q <= $unsigned(u1_m1_wo0_wi0_r0_delayr2_q);
        end
    end

    // u1_m1_wo0_wi0_r0_delayr2(DELAY,89)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m1_wo0_wi0_r0_delayr2_q <= '0;
        end
        else if (u0_m1_wo0_compute_q == 1'b1)
        begin
            u1_m1_wo0_wi0_r0_delayr2_q <= $unsigned(u1_m1_wo0_wi0_r0_delayr1_q);
        end
    end

    // u1_m1_wo0_wi0_r0_delayr1(DELAY,88)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m1_wo0_wi0_r0_delayr1_q <= '0;
        end
        else if (u0_m1_wo0_compute_q == 1'b1)
        begin
            u1_m1_wo0_wi0_r0_delayr1_q <= $unsigned(u1_m1_wo0_wi0_r0_phasedelay0_q);
        end
    end

    // u1_m1_wo0_wi0_r0_phasedelay0(DELAY,87)@10
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u1_m1_wo0_wi0_r0_phasedelay0_q <= $unsigned(xIn_1);
        end
    end

    // u1_m1_wo0_wi0_r0_join6(BITJOIN,93)@10
    assign u1_m1_wo0_wi0_r0_join6_q = {u1_m1_wo0_wi0_r0_split6_d, u1_m1_wo0_wi0_r0_split6_c, u1_m1_wo0_wi0_r0_split6_b, u1_m1_wo0_wi0_r0_delayr5_q};

    // u1_m1_wo0_wi0_r0_delayr6(DELAY,95)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m1_wo0_wi0_r0_delayr6_delay_0 <= '0;
            u1_m1_wo0_wi0_r0_delayr6_delay_1 <= '0;
            u1_m1_wo0_wi0_r0_delayr6_q <= '0;
        end
        else if (u0_m1_wo0_compute_q == 1'b1)
        begin
            u1_m1_wo0_wi0_r0_delayr6_delay_0 <= $unsigned(u1_m1_wo0_wi0_r0_join6_q);
            u1_m1_wo0_wi0_r0_delayr6_delay_1 <= u1_m1_wo0_wi0_r0_delayr6_delay_0;
            u1_m1_wo0_wi0_r0_delayr6_q <= u1_m1_wo0_wi0_r0_delayr6_delay_1;
        end
    end

    // u1_m1_wo0_wi0_r0_split6(BITSELECT,94)@10
    assign u1_m1_wo0_wi0_r0_split6_b = $unsigned(u1_m1_wo0_wi0_r0_delayr6_q[15:0]);
    assign u1_m1_wo0_wi0_r0_split6_c = $unsigned(u1_m1_wo0_wi0_r0_delayr6_q[31:16]);
    assign u1_m1_wo0_wi0_r0_split6_d = $unsigned(u1_m1_wo0_wi0_r0_delayr6_q[47:32]);
    assign u1_m1_wo0_wi0_r0_split6_e = $unsigned(u1_m1_wo0_wi0_r0_delayr6_q[63:48]);

    // d_u0_m1_wo0_compute_q_13(DELAY,340)@10 + 3
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m1_wo0_compute_q_13_delay_0 <= $unsigned(u0_m1_wo0_compute_q);
            d_u0_m1_wo0_compute_q_13_delay_1 <= d_u0_m1_wo0_compute_q_13_delay_0;
            d_u0_m1_wo0_compute_q_13_q <= d_u0_m1_wo0_compute_q_13_delay_1;
        end
    end

    // u0_m1_wo0_memread(DELAY,46)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_memread_q <= '0;
        end
        else
        begin
            u0_m1_wo0_memread_q <= $unsigned(xIn_v);
        end
    end

    // u0_m1_wo0_compute(DELAY,48)@10
    assign u0_m1_wo0_compute_q = $unsigned(u0_m1_wo0_memread_q);

    // u1_m1_wo0_cma0(CHAINMULTADD,101)@10 + 5
    assign u1_m1_wo0_cma0_reset = areset;
    assign u1_m1_wo0_cma0_ena0 = u0_m1_wo0_compute_q[0] | u1_m1_wo0_cma0_reset;
    assign u1_m1_wo0_cma0_ena1 = d_u0_m1_wo0_compute_q_13_q[0] | u1_m1_wo0_cma0_reset;
    assign u1_m1_wo0_cma0_ena2 = 1'b1;

    assign u1_m1_wo0_cma0_a0 = $unsigned(u1_m1_wo0_wi0_r0_split6_e);
    assign u1_m1_wo0_cma0_b0 = $unsigned(u1_m1_wo0_wi0_r0_phasedelay0_q);
    assign u1_m1_wo0_cma0_c0 = {2'b00, GND_q[0:0]};
    assign u1_m1_wo0_cma0_a1 = $unsigned(u1_m1_wo0_wi0_r0_split6_d);
    assign u1_m1_wo0_cma0_b1 = $unsigned(u1_m1_wo0_wi0_r0_delayr1_q);
    assign u1_m1_wo0_cma0_c1 = {2'b00, GND_q[0:0]};
    assign u1_m1_wo0_cma0_a2 = $unsigned(u1_m1_wo0_wi0_r0_split6_c);
    assign u1_m1_wo0_cma0_b2 = $unsigned(u1_m1_wo0_wi0_r0_delayr2_q);
    assign u1_m1_wo0_cma0_c2 = {2'b00, GND_q[0:0]};
    assign u1_m1_wo0_cma0_a3 = $unsigned(u1_m1_wo0_wi0_r0_split6_b);
    assign u1_m1_wo0_cma0_b3 = $unsigned(u1_m1_wo0_wi0_r0_delayr3_q);
    assign u1_m1_wo0_cma0_c3 = {2'b00, GND_q[0:0]};
    assign u1_m1_wo0_cma0_a4 = $unsigned(u1_m1_wo0_wi0_r0_delayr5_q);
    assign u1_m1_wo0_cma0_b4 = $unsigned(u1_m1_wo0_wi0_r0_delayr4_q);
    assign u1_m1_wo0_cma0_c4 = {2'b00, GND_q[0:0]};
    assign u1_m1_wo0_cma0_a5 = 16'b0;
    assign u1_m1_wo0_cma0_b5 = 16'b0;
    assign u1_m1_wo0_cma0_c5 = 3'b0;
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
        .coef_b_0(10043),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m1_wo0_cma0_DSP2 (
        .clk(clk),
        .ena({ u1_m1_wo0_cma0_ena2, u1_m1_wo0_cma0_ena1, u1_m1_wo0_cma0_ena0 }),
        .clr({ u1_m1_wo0_cma0_reset, u1_m1_wo0_cma0_reset }),
        .ay(u1_m1_wo0_cma0_a5),
        .by(u1_m1_wo0_cma0_a4),
        .az(u1_m1_wo0_cma0_b5),
        .bz(u1_m1_wo0_cma0_b4),
        .coefsela(u1_m1_wo0_cma0_c5),
        .coefselb(u1_m1_wo0_cma0_c4),
        .chainout(u1_m1_wo0_cma0_s4),
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
        .coef_a_0(-2462),
        .coef_b_0(772),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u1_m1_wo0_cma0_DSP1 (
        .clk(clk),
        .ena({ u1_m1_wo0_cma0_ena2, u1_m1_wo0_cma0_ena1, u1_m1_wo0_cma0_ena0 }),
        .clr({ u1_m1_wo0_cma0_reset, u1_m1_wo0_cma0_reset }),
        .ay(u1_m1_wo0_cma0_a3),
        .by(u1_m1_wo0_cma0_a2),
        .az(u1_m1_wo0_cma0_b3),
        .bz(u1_m1_wo0_cma0_b2),
        .coefsela(u1_m1_wo0_cma0_c3),
        .coefselb(u1_m1_wo0_cma0_c2),
        .chainin(u1_m1_wo0_cma0_s4),
        .chainout(u1_m1_wo0_cma0_s2),
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
        .coef_a_0(-188),
        .coef_b_0(25),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1"),
        .result_a_width(35)
    ) u1_m1_wo0_cma0_DSP0 (
        .clk(clk),
        .ena({ u1_m1_wo0_cma0_ena2, u1_m1_wo0_cma0_ena1, u1_m1_wo0_cma0_ena0 }),
        .clr({ u1_m1_wo0_cma0_reset, u1_m1_wo0_cma0_reset }),
        .ay(u1_m1_wo0_cma0_a1),
        .by(u1_m1_wo0_cma0_a0),
        .az(u1_m1_wo0_cma0_b1),
        .bz(u1_m1_wo0_cma0_b0),
        .coefsela(u1_m1_wo0_cma0_c1),
        .coefselb(u1_m1_wo0_cma0_c0),
        .chainin(u1_m1_wo0_cma0_s2),
        .resulta(u1_m1_wo0_cma0_s0),
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
    dspba_delay_ver #( .width(35), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u1_m1_wo0_cma0_delay0 ( .xin(u1_m1_wo0_cma0_s0), .xout(u1_m1_wo0_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u1_m1_wo0_cma0_q = $unsigned(u1_m1_wo0_cma0_qq0[34:0]);

    // u0_m1_wo0_oseq_gated_reg(REG,75)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_oseq_gated_reg_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m1_wo0_oseq_gated_reg_q <= $unsigned(d_u0_m1_wo0_compute_q_13_q);
        end
    end

    // d_u0_m1_wo0_oseq_gated_reg_q_15(DELAY,341)@14 + 1
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

    // out1_m1_wo0_lineup_select_seq_0(SEQUENCE,123)@14 + 1
    always @ (posedge clk)
    begin
        reg [3:0] out1_m1_wo0_lineup_select_seq_0_c;
        if (areset)
        begin
            out1_m1_wo0_lineup_select_seq_0_c = 4'b0001;
            out1_m1_wo0_lineup_select_seq_0_q <= $unsigned(1'b0);
            out1_m1_wo0_lineup_select_seq_0_eq <= 1'b0;
        end
        else
        begin
            if (u0_m1_wo0_oseq_gated_reg_q == 1'b1)
            begin
                if (out1_m1_wo0_lineup_select_seq_0_c == 4'b0000)
                begin
                    out1_m1_wo0_lineup_select_seq_0_eq <= 1'b1;
                end
                else
                begin
                    out1_m1_wo0_lineup_select_seq_0_eq <= 1'b0;
                end
                if (out1_m1_wo0_lineup_select_seq_0_eq == 1'b1)
                begin
                    out1_m1_wo0_lineup_select_seq_0_c = $signed(out1_m1_wo0_lineup_select_seq_0_c) + $signed(4'd1);
                end
                else
                begin
                    out1_m1_wo0_lineup_select_seq_0_c = $signed(out1_m1_wo0_lineup_select_seq_0_c) - $signed(4'd1);
                end
                out1_m1_wo0_lineup_select_seq_0_q <= $unsigned(out1_m1_wo0_lineup_select_seq_0_c[3:3]);
            end
        end
    end

    // out1_m1_wo0_lineup_select_0(LOGICAL,124)@15
    assign out1_m1_wo0_lineup_select_0_q = out1_m1_wo0_lineup_select_seq_0_q & d_u0_m1_wo0_oseq_gated_reg_q_15_q;

    // sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_tessel0_1(BITSELECT,317)@13
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_tessel0_1_b = $unsigned(u1_m0_wo0_wi0_r0_phasedelay0_q[15:15]);

    // u1_m0_wo0_wi0_r0_delayr0_notEnable(LOGICAL,362)@13
    assign u1_m0_wo0_wi0_r0_delayr0_notEnable_q = $unsigned(~ (d_in0_m0_wi0_wo0_assign_id1_q_13_q));

    // u1_m0_wo0_wi0_r0_delayr0_nor(LOGICAL,363)@13
    assign u1_m0_wo0_wi0_r0_delayr0_nor_q = ~ (u1_m0_wo0_wi0_r0_delayr0_notEnable_q | u1_m0_wo0_wi0_r0_delayr0_sticky_ena_q);

    // u1_m0_wo0_wi0_r0_delayr0_mem_last(CONSTANT,359)
    assign u1_m0_wo0_wi0_r0_delayr0_mem_last_q = $unsigned(4'b0111);

    // u1_m0_wo0_wi0_r0_delayr0_cmp(LOGICAL,360)@13
    assign u1_m0_wo0_wi0_r0_delayr0_cmp_q = $unsigned(u1_m0_wo0_wi0_r0_delayr0_mem_last_q == u1_m0_wo0_wi0_r0_delayr0_rdmux_q ? 1'b1 : 1'b0);

    // u1_m0_wo0_wi0_r0_delayr0_cmpReg(REG,361)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_13_q == 1'b1)
        begin
            u1_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_cmp_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr0_sticky_ena(REG,364)@13 + 1
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

    // u1_m0_wo0_wi0_r0_delayr0_enaAnd(LOGICAL,365)@13
    assign u1_m0_wo0_wi0_r0_delayr0_enaAnd_q = u1_m0_wo0_wi0_r0_delayr0_sticky_ena_q & d_in0_m0_wi0_wo0_assign_id1_q_13_q;

    // u1_m0_wo0_wi0_r0_delayr0_rdcnt(COUNTER,356)@13 + 1
    // low=0, high=8, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr0_rdcnt_i <= 4'd0;
            u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_13_q == 1'b1)
        begin
            if (u1_m0_wo0_wi0_r0_delayr0_rdcnt_i == 4'd7)
            begin
                u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
            end
            if (u1_m0_wo0_wi0_r0_delayr0_rdcnt_eq == 1'b1)
            begin
                u1_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(4'd8);
            end
            else
            begin
                u1_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(4'd1);
            end
        end
    end
    assign u1_m0_wo0_wi0_r0_delayr0_rdcnt_q = u1_m0_wo0_wi0_r0_delayr0_rdcnt_i[3:0];

    // u1_m0_wo0_wi0_r0_delayr0_rdmux(MUX,357)@13
    assign u1_m0_wo0_wi0_r0_delayr0_rdmux_s = d_in0_m0_wi0_wo0_assign_id1_q_13_q;
    always @(u1_m0_wo0_wi0_r0_delayr0_rdmux_s or u1_m0_wo0_wi0_r0_delayr0_wraddr_q or u1_m0_wo0_wi0_r0_delayr0_rdcnt_q)
    begin
        unique case (u1_m0_wo0_wi0_r0_delayr0_rdmux_s)
            1'b0 : u1_m0_wo0_wi0_r0_delayr0_rdmux_q = u1_m0_wo0_wi0_r0_delayr0_wraddr_q;
            1'b1 : u1_m0_wo0_wi0_r0_delayr0_rdmux_q = u1_m0_wo0_wi0_r0_delayr0_rdcnt_q;
            default : u1_m0_wo0_wi0_r0_delayr0_rdmux_q = 4'b0;
        endcase
    end

    // d_in1_m0_wi0_wo0_assign_id2_q_13(DELAY,338)@10 + 3
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in1_m0_wi0_wo0_assign_id2_q_13_delay_0 <= $unsigned(xIn_1);
            d_in1_m0_wi0_wo0_assign_id2_q_13_delay_1 <= d_in1_m0_wi0_wo0_assign_id2_q_13_delay_0;
            d_in1_m0_wi0_wo0_assign_id2_q_13_q <= d_in1_m0_wi0_wo0_assign_id2_q_13_delay_1;
        end
    end

    // d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,335)@10 + 3
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

    // u1_m0_wo0_wi0_r0_delayr0_wraddr(REG,358)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(4'b1000);
        end
        else
        begin
            u1_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(u1_m0_wo0_wi0_r0_delayr0_rdmux_q);
        end
    end

    // u1_m0_wo0_wi0_r0_delayr0_mem(DUALMEM,355)@13 + 2
    assign u1_m0_wo0_wi0_r0_delayr0_mem_ia = $unsigned(d_in1_m0_wi0_wo0_assign_id2_q_13_q);
    assign u1_m0_wo0_wi0_r0_delayr0_mem_aa = u1_m0_wo0_wi0_r0_delayr0_wraddr_q;
    assign u1_m0_wo0_wi0_r0_delayr0_mem_ab = u1_m0_wo0_wi0_r0_delayr0_rdmux_q;
    assign u1_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB = areset | u1_m0_wo0_wi0_r0_delayr0_enaAnd_q[0];
    assign u1_m0_wo0_wi0_r0_delayr0_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(4),
        .numwords_a(9),
        .width_b(16),
        .widthad_b(4),
        .numwords_b(9),
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
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_13_q[0]),
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

    // u1_m0_wo0_wi0_r0_phasedelay0(DELAY,38)@13
    assign u1_m0_wo0_wi0_r0_phasedelay0_q = $unsigned(u1_m0_wo0_wi0_r0_delayr0_mem_q);

    // sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_b(BITJOIN,321)@13
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_b_q = {sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_tessel0_1_b, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_tessel0_1_b, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_tessel0_1_b, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_tessel0_1_b, u1_m0_wo0_wi0_r0_phasedelay0_q};

    // sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel0_1(BITSELECT,311)@13
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel0_1_b = $unsigned(u1_m0_wo0_wi0_r0_phasedelay0_q[5:0]);

    // padACst_uid189_u0_m0_wo0_mtree_mult1_0(CONSTANT,188)@13
    assign padACst_uid189_u0_m0_wo0_mtree_mult1_0_q = $unsigned(14'b00000000000000);

    // sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_b(BITJOIN,312)@13
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_b_q = {sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel0_1_b, padACst_uid189_u0_m0_wo0_mtree_mult1_0_q};

    // sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2(SUB,283)@13 + 1
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_a = $unsigned({1'b0, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_b_q});
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_b = $unsigned({1'b0, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_b_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_o <= $unsigned($signed(sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_a) - $signed(sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_b));
        end
    end
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_c[0] = sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_o[20];
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_q = sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_o[19:0];

    // d_u1_m0_wo0_wi0_r0_phasedelay0_q_14(DELAY,339)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u1_m0_wo0_wi0_r0_phasedelay0_q_14_q <= $unsigned(u1_m0_wo0_wi0_r0_phasedelay0_q);
        end
    end

    // sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1(BITSELECT,314)@14
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b = $unsigned(d_u1_m0_wo0_wi0_r0_phasedelay0_q_14_q[15:15]);

    // sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,333)@14
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_c_q = {sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b};

    // sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_0(BITSELECT,313)@14
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_0_b = $unsigned(d_u1_m0_wo0_wi0_r0_phasedelay0_q_14_q[15:6]);

    // sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,315)@14
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_c_q = {sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_0_b};

    // sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2(SUB,284)@14 + 1
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_cin = sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_c;
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_a = $unsigned({ {{1{sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_c_q[10]}}, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_c_q}, 1'b0 });
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_b = $unsigned({ {{1{sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_c_q[10]}}, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_c_q}, sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_o <= $unsigned($signed(sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_a) - $signed(sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_b));
        end
    end
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_q = sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_o[11:1];

    // d_sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_q_15(DELAY,343)@14 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_q_15_q <= $unsigned(sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_q);
        end
    end

    // sub_uid245_u1_m0_wo0_mtree_mult1_0_BitJoin_for_q(BITJOIN,285)@15
    assign sub_uid245_u1_m0_wo0_mtree_mult1_0_BitJoin_for_q_q = {sub_uid245_u1_m0_wo0_mtree_mult1_0_p2_of_2_q, d_sub_uid245_u1_m0_wo0_mtree_mult1_0_p1_of_2_q_15_q};

    // u0_m0_wo0_oseq_gated_reg(REG,26)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_oseq_gated_reg_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m0_wo0_oseq_gated_reg_q <= $unsigned(d_in0_m0_wi0_wo0_assign_id1_q_13_q);
        end
    end

    // d_u0_m0_wo0_oseq_gated_reg_q_15(DELAY,337)@14 + 1
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

    // out1_m0_wo0_lineup_select_seq_0(SEQUENCE,117)@14 + 1
    always @ (posedge clk)
    begin
        reg [3:0] out1_m0_wo0_lineup_select_seq_0_c;
        if (areset)
        begin
            out1_m0_wo0_lineup_select_seq_0_c = 4'b0001;
            out1_m0_wo0_lineup_select_seq_0_q <= $unsigned(1'b0);
            out1_m0_wo0_lineup_select_seq_0_eq <= 1'b0;
        end
        else
        begin
            if (u0_m0_wo0_oseq_gated_reg_q == 1'b1)
            begin
                if (out1_m0_wo0_lineup_select_seq_0_c == 4'b0000)
                begin
                    out1_m0_wo0_lineup_select_seq_0_eq <= 1'b1;
                end
                else
                begin
                    out1_m0_wo0_lineup_select_seq_0_eq <= 1'b0;
                end
                if (out1_m0_wo0_lineup_select_seq_0_eq == 1'b1)
                begin
                    out1_m0_wo0_lineup_select_seq_0_c = $signed(out1_m0_wo0_lineup_select_seq_0_c) + $signed(4'd1);
                end
                else
                begin
                    out1_m0_wo0_lineup_select_seq_0_c = $signed(out1_m0_wo0_lineup_select_seq_0_c) - $signed(4'd1);
                end
                out1_m0_wo0_lineup_select_seq_0_q <= $unsigned(out1_m0_wo0_lineup_select_seq_0_c[3:3]);
            end
        end
    end

    // out1_m0_wo0_lineup_select_0(LOGICAL,118)@15
    assign out1_m0_wo0_lineup_select_0_q = out1_m0_wo0_lineup_select_seq_0_q & d_u0_m0_wo0_oseq_gated_reg_q_15_q;

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // out3_wo0_data_selector(SELECTOR,154)@15 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            out3_wo0_data_selector_q <= $unsigned(u1_m1_wo0_cma0_q);
            if (out1_m1_wo0_lineup_select_0_q == 1'b1)
            begin
                out3_wo0_data_selector_q <= $unsigned(u1_m1_wo0_cma0_q);
            end
            if (out1_m0_wo0_lineup_select_0_q == 1'b1)
            begin
                out3_wo0_data_selector_q <= $unsigned({{4{sub_uid245_u1_m0_wo0_mtree_mult1_0_BitJoin_for_q_q[30]}}, sub_uid245_u1_m0_wo0_mtree_mult1_0_BitJoin_for_q_q});
            end
        end
    end

    // out2_m1_wo0_lineup_1(DELAY,135)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            out2_m1_wo0_lineup_1_q <= $unsigned(u1_m1_wo0_cma0_q);
        end
    end

    // out2_m1_wo0_assign_id18(DELAY,139)@15
    assign out2_m1_wo0_assign_id18_q = $unsigned(out2_m1_wo0_lineup_1_q);

    // out0_m1_wo0_lineup_select_seq_0(SEQUENCE,110)@14 + 1
    always @ (posedge clk)
    begin
        reg [3:0] out0_m1_wo0_lineup_select_seq_0_c;
        if (areset)
        begin
            out0_m1_wo0_lineup_select_seq_0_c = 4'b0000;
            out0_m1_wo0_lineup_select_seq_0_q <= $unsigned(1'b0);
            out0_m1_wo0_lineup_select_seq_0_eq <= 1'b0;
        end
        else
        begin
            if (u0_m1_wo0_oseq_gated_reg_q == 1'b1)
            begin
                if (out0_m1_wo0_lineup_select_seq_0_c == 4'b0000)
                begin
                    out0_m1_wo0_lineup_select_seq_0_eq <= 1'b1;
                end
                else
                begin
                    out0_m1_wo0_lineup_select_seq_0_eq <= 1'b0;
                end
                if (out0_m1_wo0_lineup_select_seq_0_eq == 1'b1)
                begin
                    out0_m1_wo0_lineup_select_seq_0_c = $signed(out0_m1_wo0_lineup_select_seq_0_c) + $signed(4'd1);
                end
                else
                begin
                    out0_m1_wo0_lineup_select_seq_0_c = $signed(out0_m1_wo0_lineup_select_seq_0_c) - $signed(4'd1);
                end
                out0_m1_wo0_lineup_select_seq_0_q <= $unsigned(out0_m1_wo0_lineup_select_seq_0_c[3:3]);
            end
        end
    end

    // out0_m1_wo0_lineup_select_0(LOGICAL,111)@15
    assign out0_m1_wo0_lineup_select_0_q = out0_m1_wo0_lineup_select_seq_0_q & d_u0_m1_wo0_oseq_gated_reg_q_15_q;

    // out0_m1_wo0_lineup_select_delay_0(DELAY,112)@15
    always @ (posedge clk)
    begin
        if (areset)
        begin
            out0_m1_wo0_lineup_select_delay_0_q <= '0;
        end
        else
        begin
            out0_m1_wo0_lineup_select_delay_0_q <= $unsigned(out0_m1_wo0_lineup_select_0_q);
        end
    end

    // out0_m1_wo0_assign_id11(DELAY,114)@15
    assign out0_m1_wo0_assign_id11_q = $unsigned(out0_m1_wo0_lineup_select_delay_0_q);

    // out2_m0_wo0_lineup_1(DELAY,129)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            out2_m0_wo0_lineup_1_q <= $unsigned(sub_uid245_u1_m0_wo0_mtree_mult1_0_BitJoin_for_q_q);
        end
    end

    // out2_m0_wo0_assign_id16(DELAY,133)@15
    assign out2_m0_wo0_assign_id16_q = $unsigned(out2_m0_wo0_lineup_1_q);

    // out0_m0_wo0_lineup_select_seq_0(SEQUENCE,104)@14 + 1
    always @ (posedge clk)
    begin
        reg [3:0] out0_m0_wo0_lineup_select_seq_0_c;
        if (areset)
        begin
            out0_m0_wo0_lineup_select_seq_0_c = 4'b0000;
            out0_m0_wo0_lineup_select_seq_0_q <= $unsigned(1'b0);
            out0_m0_wo0_lineup_select_seq_0_eq <= 1'b0;
        end
        else
        begin
            if (u0_m0_wo0_oseq_gated_reg_q == 1'b1)
            begin
                if (out0_m0_wo0_lineup_select_seq_0_c == 4'b0000)
                begin
                    out0_m0_wo0_lineup_select_seq_0_eq <= 1'b1;
                end
                else
                begin
                    out0_m0_wo0_lineup_select_seq_0_eq <= 1'b0;
                end
                if (out0_m0_wo0_lineup_select_seq_0_eq == 1'b1)
                begin
                    out0_m0_wo0_lineup_select_seq_0_c = $signed(out0_m0_wo0_lineup_select_seq_0_c) + $signed(4'd1);
                end
                else
                begin
                    out0_m0_wo0_lineup_select_seq_0_c = $signed(out0_m0_wo0_lineup_select_seq_0_c) - $signed(4'd1);
                end
                out0_m0_wo0_lineup_select_seq_0_q <= $unsigned(out0_m0_wo0_lineup_select_seq_0_c[3:3]);
            end
        end
    end

    // out0_m0_wo0_lineup_select_0(LOGICAL,105)@15
    assign out0_m0_wo0_lineup_select_0_q = out0_m0_wo0_lineup_select_seq_0_q & d_u0_m0_wo0_oseq_gated_reg_q_15_q;

    // out0_m0_wo0_lineup_select_delay_0(DELAY,106)@15
    always @ (posedge clk)
    begin
        if (areset)
        begin
            out0_m0_wo0_lineup_select_delay_0_q <= '0;
        end
        else
        begin
            out0_m0_wo0_lineup_select_delay_0_q <= $unsigned(out0_m0_wo0_lineup_select_0_q);
        end
    end

    // out0_m0_wo0_assign_id9(DELAY,108)@15
    assign out0_m0_wo0_assign_id9_q = $unsigned(out0_m0_wo0_lineup_select_delay_0_q);

    // out2_wo0_data_selector(SELECTOR,141)@15 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            out2_wo0_data_selector_q <= $unsigned(out2_m1_wo0_assign_id18_q);
            if (out0_m1_wo0_assign_id11_q == 1'b1)
            begin
                out2_wo0_data_selector_q <= $unsigned(out2_m1_wo0_assign_id18_q);
            end
            if (out0_m0_wo0_assign_id9_q == 1'b1)
            begin
                out2_wo0_data_selector_q <= $unsigned({{4{out2_m0_wo0_assign_id16_q[30]}}, out2_m0_wo0_assign_id16_q});
            end
        end
    end

    // u0_m1_wo0_wi0_r0_delayr4(DELAY,56)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_wi0_r0_delayr4_q <= '0;
        end
        else if (u0_m1_wo0_compute_q == 1'b1)
        begin
            u0_m1_wo0_wi0_r0_delayr4_q <= $unsigned(u0_m1_wo0_wi0_r0_delayr3_q);
        end
    end

    // u0_m1_wo0_wi0_r0_delayr5(DELAY,57)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_wi0_r0_delayr5_delay_0 <= '0;
            u0_m1_wo0_wi0_r0_delayr5_q <= '0;
        end
        else if (u0_m1_wo0_compute_q == 1'b1)
        begin
            u0_m1_wo0_wi0_r0_delayr5_delay_0 <= $unsigned(u0_m1_wo0_wi0_r0_delayr4_q);
            u0_m1_wo0_wi0_r0_delayr5_q <= u0_m1_wo0_wi0_r0_delayr5_delay_0;
        end
    end

    // u0_m1_wo0_wi0_r0_delayr3(DELAY,55)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_wi0_r0_delayr3_q <= '0;
        end
        else if (u0_m1_wo0_compute_q == 1'b1)
        begin
            u0_m1_wo0_wi0_r0_delayr3_q <= $unsigned(u0_m1_wo0_wi0_r0_delayr2_q);
        end
    end

    // u0_m1_wo0_wi0_r0_delayr2(DELAY,54)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_wi0_r0_delayr2_q <= '0;
        end
        else if (u0_m1_wo0_compute_q == 1'b1)
        begin
            u0_m1_wo0_wi0_r0_delayr2_q <= $unsigned(u0_m1_wo0_wi0_r0_delayr1_q);
        end
    end

    // u0_m1_wo0_wi0_r0_delayr1(DELAY,53)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_wi0_r0_delayr1_q <= '0;
        end
        else if (u0_m1_wo0_compute_q == 1'b1)
        begin
            u0_m1_wo0_wi0_r0_delayr1_q <= $unsigned(u0_m1_wo0_wi0_r0_phasedelay0_q);
        end
    end

    // u0_m1_wo0_wi0_r0_phasedelay0(DELAY,52)@10
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m1_wo0_wi0_r0_phasedelay0_q <= $unsigned(xIn_0);
        end
    end

    // u0_m1_wo0_wi0_r0_join6(BITJOIN,58)@10
    assign u0_m1_wo0_wi0_r0_join6_q = {u0_m1_wo0_wi0_r0_split6_d, u0_m1_wo0_wi0_r0_split6_c, u0_m1_wo0_wi0_r0_split6_b, u0_m1_wo0_wi0_r0_delayr5_q};

    // u0_m1_wo0_wi0_r0_delayr6(DELAY,60)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m1_wo0_wi0_r0_delayr6_delay_0 <= '0;
            u0_m1_wo0_wi0_r0_delayr6_delay_1 <= '0;
            u0_m1_wo0_wi0_r0_delayr6_q <= '0;
        end
        else if (u0_m1_wo0_compute_q == 1'b1)
        begin
            u0_m1_wo0_wi0_r0_delayr6_delay_0 <= $unsigned(u0_m1_wo0_wi0_r0_join6_q);
            u0_m1_wo0_wi0_r0_delayr6_delay_1 <= u0_m1_wo0_wi0_r0_delayr6_delay_0;
            u0_m1_wo0_wi0_r0_delayr6_q <= u0_m1_wo0_wi0_r0_delayr6_delay_1;
        end
    end

    // u0_m1_wo0_wi0_r0_split6(BITSELECT,59)@10
    assign u0_m1_wo0_wi0_r0_split6_b = $unsigned(u0_m1_wo0_wi0_r0_delayr6_q[15:0]);
    assign u0_m1_wo0_wi0_r0_split6_c = $unsigned(u0_m1_wo0_wi0_r0_delayr6_q[31:16]);
    assign u0_m1_wo0_wi0_r0_split6_d = $unsigned(u0_m1_wo0_wi0_r0_delayr6_q[47:32]);
    assign u0_m1_wo0_wi0_r0_split6_e = $unsigned(u0_m1_wo0_wi0_r0_delayr6_q[63:48]);

    // u0_m1_wo0_cma0(CHAINMULTADD,74)@10 + 5
    assign u0_m1_wo0_cma0_reset = areset;
    assign u0_m1_wo0_cma0_ena0 = u0_m1_wo0_compute_q[0] | u0_m1_wo0_cma0_reset;
    assign u0_m1_wo0_cma0_ena1 = d_u0_m1_wo0_compute_q_13_q[0] | u0_m1_wo0_cma0_reset;
    assign u0_m1_wo0_cma0_ena2 = 1'b1;

    assign u0_m1_wo0_cma0_a0 = $unsigned(u0_m1_wo0_wi0_r0_split6_e);
    assign u0_m1_wo0_cma0_b0 = $unsigned(u0_m1_wo0_wi0_r0_phasedelay0_q);
    assign u0_m1_wo0_cma0_c0 = {2'b00, GND_q[0:0]};
    assign u0_m1_wo0_cma0_a1 = $unsigned(u0_m1_wo0_wi0_r0_split6_d);
    assign u0_m1_wo0_cma0_b1 = $unsigned(u0_m1_wo0_wi0_r0_delayr1_q);
    assign u0_m1_wo0_cma0_c1 = {2'b00, GND_q[0:0]};
    assign u0_m1_wo0_cma0_a2 = $unsigned(u0_m1_wo0_wi0_r0_split6_c);
    assign u0_m1_wo0_cma0_b2 = $unsigned(u0_m1_wo0_wi0_r0_delayr2_q);
    assign u0_m1_wo0_cma0_c2 = {2'b00, GND_q[0:0]};
    assign u0_m1_wo0_cma0_a3 = $unsigned(u0_m1_wo0_wi0_r0_split6_b);
    assign u0_m1_wo0_cma0_b3 = $unsigned(u0_m1_wo0_wi0_r0_delayr3_q);
    assign u0_m1_wo0_cma0_c3 = {2'b00, GND_q[0:0]};
    assign u0_m1_wo0_cma0_a4 = $unsigned(u0_m1_wo0_wi0_r0_delayr5_q);
    assign u0_m1_wo0_cma0_b4 = $unsigned(u0_m1_wo0_wi0_r0_delayr4_q);
    assign u0_m1_wo0_cma0_c4 = {2'b00, GND_q[0:0]};
    assign u0_m1_wo0_cma0_a5 = 16'b0;
    assign u0_m1_wo0_cma0_b5 = 16'b0;
    assign u0_m1_wo0_cma0_c5 = 3'b0;
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
        .coef_b_0(10043),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m1_wo0_cma0_DSP2 (
        .clk(clk),
        .ena({ u0_m1_wo0_cma0_ena2, u0_m1_wo0_cma0_ena1, u0_m1_wo0_cma0_ena0 }),
        .clr({ u0_m1_wo0_cma0_reset, u0_m1_wo0_cma0_reset }),
        .ay(u0_m1_wo0_cma0_a5),
        .by(u0_m1_wo0_cma0_a4),
        .az(u0_m1_wo0_cma0_b5),
        .bz(u0_m1_wo0_cma0_b4),
        .coefsela(u0_m1_wo0_cma0_c5),
        .coefselb(u0_m1_wo0_cma0_c4),
        .chainout(u0_m1_wo0_cma0_s4),
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
        .coef_a_0(-2462),
        .coef_b_0(772),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m1_wo0_cma0_DSP1 (
        .clk(clk),
        .ena({ u0_m1_wo0_cma0_ena2, u0_m1_wo0_cma0_ena1, u0_m1_wo0_cma0_ena0 }),
        .clr({ u0_m1_wo0_cma0_reset, u0_m1_wo0_cma0_reset }),
        .ay(u0_m1_wo0_cma0_a3),
        .by(u0_m1_wo0_cma0_a2),
        .az(u0_m1_wo0_cma0_b3),
        .bz(u0_m1_wo0_cma0_b2),
        .coefsela(u0_m1_wo0_cma0_c3),
        .coefselb(u0_m1_wo0_cma0_c2),
        .chainin(u0_m1_wo0_cma0_s4),
        .chainout(u0_m1_wo0_cma0_s2),
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
        .coef_a_0(-188),
        .coef_b_0(25),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1"),
        .result_a_width(35)
    ) u0_m1_wo0_cma0_DSP0 (
        .clk(clk),
        .ena({ u0_m1_wo0_cma0_ena2, u0_m1_wo0_cma0_ena1, u0_m1_wo0_cma0_ena0 }),
        .clr({ u0_m1_wo0_cma0_reset, u0_m1_wo0_cma0_reset }),
        .ay(u0_m1_wo0_cma0_a1),
        .by(u0_m1_wo0_cma0_a0),
        .az(u0_m1_wo0_cma0_b1),
        .bz(u0_m1_wo0_cma0_b0),
        .coefsela(u0_m1_wo0_cma0_c1),
        .coefselb(u0_m1_wo0_cma0_c0),
        .chainin(u0_m1_wo0_cma0_s2),
        .resulta(u0_m1_wo0_cma0_s0),
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
    dspba_delay_ver #( .width(35), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_m1_wo0_cma0_delay0 ( .xin(u0_m1_wo0_cma0_s0), .xout(u0_m1_wo0_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_m1_wo0_cma0_q = $unsigned(u0_m1_wo0_cma0_qq0[34:0]);

    // sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_tessel0_1(BITSELECT,293)@13
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_tessel0_1_b = $unsigned(u0_m0_wo0_wi0_r0_phasedelay0_q[15:15]);

    // u0_m0_wo0_wi0_r0_delayr0_notEnable(LOGICAL,351)@13
    assign u0_m0_wo0_wi0_r0_delayr0_notEnable_q = $unsigned(~ (d_in0_m0_wi0_wo0_assign_id1_q_13_q));

    // u0_m0_wo0_wi0_r0_delayr0_nor(LOGICAL,352)@13
    assign u0_m0_wo0_wi0_r0_delayr0_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr0_notEnable_q | u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr0_mem_last(CONSTANT,348)
    assign u0_m0_wo0_wi0_r0_delayr0_mem_last_q = $unsigned(4'b0111);

    // u0_m0_wo0_wi0_r0_delayr0_cmp(LOGICAL,349)@13
    assign u0_m0_wo0_wi0_r0_delayr0_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr0_mem_last_q == u0_m0_wo0_wi0_r0_delayr0_rdmux_q ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr0_cmpReg(REG,350)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_13_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_sticky_ena(REG,353)@13 + 1
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

    // u0_m0_wo0_wi0_r0_delayr0_enaAnd(LOGICAL,354)@13
    assign u0_m0_wo0_wi0_r0_delayr0_enaAnd_q = u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q & d_in0_m0_wi0_wo0_assign_id1_q_13_q;

    // u0_m0_wo0_wi0_r0_delayr0_rdcnt(COUNTER,345)@13 + 1
    // low=0, high=8, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_rdcnt_i <= 4'd0;
            u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_13_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_delayr0_rdcnt_i == 4'd7)
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(4'd8);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(4'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr0_rdcnt_q = u0_m0_wo0_wi0_r0_delayr0_rdcnt_i[3:0];

    // u0_m0_wo0_wi0_r0_delayr0_rdmux(MUX,346)@13
    assign u0_m0_wo0_wi0_r0_delayr0_rdmux_s = d_in0_m0_wi0_wo0_assign_id1_q_13_q;
    always @(u0_m0_wo0_wi0_r0_delayr0_rdmux_s or u0_m0_wo0_wi0_r0_delayr0_wraddr_q or u0_m0_wo0_wi0_r0_delayr0_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr0_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr0_rdmux_q = u0_m0_wo0_wi0_r0_delayr0_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr0_rdmux_q = u0_m0_wo0_wi0_r0_delayr0_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr0_rdmux_q = 4'b0;
        endcase
    end

    // d_in0_m0_wi0_wo0_assign_id0_q_13(DELAY,334)@10 + 3
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_in0_m0_wi0_wo0_assign_id0_q_13_delay_0 <= '0;
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id0_q_13_delay_0 <= $unsigned(xIn_0);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id0_q_13_delay_1 <= d_in0_m0_wi0_wo0_assign_id0_q_13_delay_0;
            d_in0_m0_wi0_wo0_assign_id0_q_13_q <= d_in0_m0_wi0_wo0_assign_id0_q_13_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_wraddr(REG,347)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(4'b1000);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_mem(DUALMEM,344)@13 + 2
    assign u0_m0_wo0_wi0_r0_delayr0_mem_ia = $unsigned(d_in0_m0_wi0_wo0_assign_id0_q_13_q);
    assign u0_m0_wo0_wi0_r0_delayr0_mem_aa = u0_m0_wo0_wi0_r0_delayr0_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr0_mem_ab = u0_m0_wo0_wi0_r0_delayr0_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr0_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr0_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(4),
        .numwords_a(9),
        .width_b(16),
        .widthad_b(4),
        .numwords_b(9),
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
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_13_q[0]),
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

    // u0_m0_wo0_wi0_r0_phasedelay0(DELAY,20)@13
    assign u0_m0_wo0_wi0_r0_phasedelay0_q = $unsigned(u0_m0_wo0_wi0_r0_delayr0_mem_q);

    // sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_b(BITJOIN,297)@13
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_b_q = {sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_tessel0_1_b, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_tessel0_1_b, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_tessel0_1_b, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_tessel0_1_b, u0_m0_wo0_wi0_r0_phasedelay0_q};

    // sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel0_1(BITSELECT,287)@13
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel0_1_b = $unsigned(u0_m0_wo0_wi0_r0_phasedelay0_q[5:0]);

    // sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_b(BITJOIN,288)@13
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_b_q = {sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel0_1_b, padACst_uid189_u0_m0_wo0_mtree_mult1_0_q};

    // sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2(SUB,272)@13 + 1
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_a = $unsigned({1'b0, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_b_q});
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_b = $unsigned({1'b0, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_b_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_o <= 21'b0;
        end
        else
        begin
            sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_o <= $unsigned($signed(sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_a) - $signed(sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_b));
        end
    end
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_c[0] = sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_o[20];
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_q = sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_o[19:0];

    // d_u0_m0_wo0_wi0_r0_phasedelay0_q_14(DELAY,336)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m0_wo0_wi0_r0_phasedelay0_q_14_q <= '0;
        end
        else
        begin
            d_u0_m0_wo0_wi0_r0_phasedelay0_q_14_q <= $unsigned(u0_m0_wo0_wi0_r0_phasedelay0_q);
        end
    end

    // sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1(BITSELECT,290)@14
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b = $unsigned(d_u0_m0_wo0_wi0_r0_phasedelay0_q_14_q[15:15]);

    // sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,309)@14
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_c_q = {sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b};

    // sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_0(BITSELECT,289)@14
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_0_b = $unsigned(d_u0_m0_wo0_wi0_r0_phasedelay0_q_14_q[15:6]);

    // sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,291)@14
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_c_q = {sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_1_b, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_tessel1_0_b};

    // sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2(SUB,273)@14 + 1
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_cin = sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_c;
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_a = $unsigned({ {{1{sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_c_q[10]}}, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_a_BitJoin_for_c_q}, 1'b0 });
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_b = $unsigned({ {{1{sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_c_q[10]}}, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitSelect_for_b_BitJoin_for_c_q}, sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_o <= 13'b0;
        end
        else
        begin
            sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_o <= $unsigned($signed(sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_a) - $signed(sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_b));
        end
    end
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_q = sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_o[11:1];

    // d_sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_q_15(DELAY,342)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_q_15_q <= '0;
        end
        else
        begin
            d_sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_q_15_q <= $unsigned(sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_q);
        end
    end

    // sub_uid191_u0_m0_wo0_mtree_mult1_0_BitJoin_for_q(BITJOIN,274)@15
    assign sub_uid191_u0_m0_wo0_mtree_mult1_0_BitJoin_for_q_q = {sub_uid191_u0_m0_wo0_mtree_mult1_0_p2_of_2_q, d_sub_uid191_u0_m0_wo0_mtree_mult1_0_p1_of_2_q_15_q};

    // out1_wo0_data_selector(SELECTOR,128)@15 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            out1_wo0_data_selector_q <= $unsigned(u0_m1_wo0_cma0_q);
            if (out1_m1_wo0_lineup_select_0_q == 1'b1)
            begin
                out1_wo0_data_selector_q <= $unsigned(u0_m1_wo0_cma0_q);
            end
            if (out1_m0_wo0_lineup_select_0_q == 1'b1)
            begin
                out1_wo0_data_selector_q <= $unsigned({{4{sub_uid191_u0_m0_wo0_mtree_mult1_0_BitJoin_for_q_q[30]}}, sub_uid191_u0_m0_wo0_mtree_mult1_0_BitJoin_for_q_q});
            end
        end
    end

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // out0_m1_wo0_lineup_0(DELAY,109)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            out0_m1_wo0_lineup_0_q <= $unsigned(u0_m1_wo0_cma0_q);
        end
    end

    // out0_m1_wo0_assign_id10(DELAY,113)@15
    assign out0_m1_wo0_assign_id10_q = $unsigned(out0_m1_wo0_lineup_0_q);

    // out0_m0_wo0_lineup_0(DELAY,103)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            out0_m0_wo0_lineup_0_q <= $unsigned(sub_uid191_u0_m0_wo0_mtree_mult1_0_BitJoin_for_q_q);
        end
    end

    // out0_m0_wo0_assign_id8(DELAY,107)@15
    assign out0_m0_wo0_assign_id8_q = $unsigned(out0_m0_wo0_lineup_0_q);

    // out0_wo0_data_selector(SELECTOR,115)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            out0_wo0_data_selector_q <= 35'b0;
            out0_wo0_data_selector_v <= 1'b0;
        end
        else
        begin
            out0_wo0_data_selector_q <= $unsigned(out0_m1_wo0_assign_id10_q);
            out0_wo0_data_selector_v <= $unsigned(1'b0);
            if (out0_m1_wo0_assign_id11_q == 1'b1)
            begin
                out0_wo0_data_selector_q <= $unsigned(out0_m1_wo0_assign_id10_q);
                out0_wo0_data_selector_v <= $unsigned(1'b1);
            end
            if (out0_m0_wo0_assign_id9_q == 1'b1)
            begin
                out0_wo0_data_selector_q <= $unsigned({{4{out0_m0_wo0_assign_id8_q[30]}}, out0_m0_wo0_assign_id8_q});
                out0_wo0_data_selector_v <= $unsigned(1'b1);
            end
        end
    end

    // xOut(PORTOUT,155)@16 + 1
    assign xOut_v = out0_wo0_data_selector_v;
    assign xOut_c = {7'b0000000, GND_q};
    assign xOut_0 = {{1{out0_wo0_data_selector_q[34]}}, out0_wo0_data_selector_q};
    assign xOut_1 = {{1{out1_wo0_data_selector_q[34]}}, out1_wo0_data_selector_q};
    assign xOut_2 = {{1{out2_wo0_data_selector_q[34]}}, out2_wo0_data_selector_q};
    assign xOut_3 = {{1{out3_wo0_data_selector_q[34]}}, out3_wo0_data_selector_q};

endmodule
