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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_Filt_DEC_by_3_stage1_DecimatingFIR1
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000tage1_DecimatingFIR1 (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [16:0] xIn_0,
    output wire [0:0] xOut_v,
    output wire [7:0] xOut_c,
    output wire [36:0] xOut_0,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_11_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_15_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_15_delay_0;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_15_delay_1;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_15_delay_2;
    reg [0:0] u0_m0_wo0_inputframe_seq_q;
    reg u0_m0_wo0_inputframe_seq_eq;
    reg [3:0] u0_m0_wo0_run_count;
    wire [0:0] u0_m0_wo0_run_preEnaQ;
    reg [0:0] u0_m0_wo0_run_q;
    wire [0:0] u0_m0_wo0_run_out;
    reg [0:0] u0_m0_wo0_run_enableQ;
    wire [2:0] u0_m0_wo0_run_ctrl;
    reg [0:0] u0_m0_wo0_memread_q;
    reg [0:0] u0_m0_wo0_compute_q;
    reg [0:0] u0_m0_wo0_compute_delay_0;
    reg [0:0] u0_m0_wo0_compute_delay_1;
    reg [0:0] d_u0_m0_wo0_compute_q_14_q;
    reg [0:0] d_u0_m0_wo0_compute_q_15_q;
    reg [0:0] d_u0_m0_wo0_compute_q_20_q;
    reg [0:0] d_u0_m0_wo0_compute_q_20_delay_0;
    reg [0:0] d_u0_m0_wo0_compute_q_20_delay_1;
    reg [0:0] d_u0_m0_wo0_compute_q_20_delay_2;
    reg [0:0] d_u0_m0_wo0_compute_q_20_delay_3;
    reg [0:0] d_u0_m0_wo0_compute_q_21_q;
    reg [0:0] d_u0_m0_wo0_compute_q_22_q;
    wire [2:0] u0_m0_wo0_wi0_r0_ra0_count0_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_ra0_count0_i;
    reg [4:0] u0_m0_wo0_wi0_r0_ra0_count1_lutreg_q;
    wire [2:0] u0_m0_wo0_wi0_r0_ra0_count1_inner_q;
    (* preserve_syn_only *) reg signed [2:0] u0_m0_wo0_wi0_r0_ra0_count1_inner_i;
    wire [1:0] u0_m0_wo0_wi0_r0_ra0_count1_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_ra0_count1_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_ra0_count1_eq;
    wire [5:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_a;
    wire [5:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_b;
    logic [5:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_o;
    wire [5:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_q;
    wire [4:0] u0_m0_wo0_wi0_r0_ra2_count0_inner_q;
    (* preserve_syn_only *) reg signed [4:0] u0_m0_wo0_wi0_r0_ra2_count0_inner_i;
    wire [5:0] u0_m0_wo0_wi0_r0_ra2_count0_q;
    (* preserve_syn_only *) reg [4:0] u0_m0_wo0_wi0_r0_ra2_count0_i;
    wire [2:0] u0_m0_wo0_wi0_r0_ra2_count1_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_ra2_count1_i;
    reg [5:0] u0_m0_wo0_wi0_r0_ra2_count2_lutreg_q;
    wire [2:0] u0_m0_wo0_wi0_r0_ra2_count2_inner_q;
    (* preserve_syn_only *) reg signed [2:0] u0_m0_wo0_wi0_r0_ra2_count2_inner_i;
    wire [1:0] u0_m0_wo0_wi0_r0_ra2_count2_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_ra2_count2_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_ra2_count2_eq;
    wire [7:0] u0_m0_wo0_wi0_r0_ra2_add_1_0_a;
    wire [7:0] u0_m0_wo0_wi0_r0_ra2_add_1_0_b;
    logic [7:0] u0_m0_wo0_wi0_r0_ra2_add_1_0_o;
    wire [7:0] u0_m0_wo0_wi0_r0_ra2_add_1_0_q;
    wire [3:0] u0_m0_wo0_wi0_r0_wa0_q;
    (* preserve_syn_only *) reg [3:0] u0_m0_wo0_wi0_r0_wa0_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_wa0_eq;
    reg [4:0] u0_m0_wo0_wi0_r0_wa2_1_q;
    wire u0_m0_wo0_wi0_r0_memr0_reset0;
    wire [16:0] u0_m0_wo0_wi0_r0_memr0_ia;
    wire [3:0] u0_m0_wo0_wi0_r0_memr0_aa;
    wire [3:0] u0_m0_wo0_wi0_r0_memr0_ab;
    wire [16:0] u0_m0_wo0_wi0_r0_memr0_iq;
    wire [16:0] u0_m0_wo0_wi0_r0_memr0_q;
    reg [16:0] d_u0_m0_wo0_wi0_r0_outReg0_q_16_q;
    reg [5:0] u0_m0_wo0_wi0_r0_readReg0_q;
    wire u0_m0_wo0_wi0_r0_memr2_reset0;
    wire [16:0] u0_m0_wo0_wi0_r0_memr2_ia;
    wire [4:0] u0_m0_wo0_wi0_r0_memr2_aa;
    wire [4:0] u0_m0_wo0_wi0_r0_memr2_ab;
    wire [16:0] u0_m0_wo0_wi0_r0_memr2_iq;
    wire [16:0] u0_m0_wo0_wi0_r0_memr2_q;
    reg [16:0] d_u0_m0_wo0_wi0_r0_outReg2_q_16_q;
    reg [4:0] u0_m0_wo0_wi0_r0_readReg2_q;
    wire [2:0] u0_m0_wo0_ca1_inner_q;
    (* preserve_syn_only *) reg signed [2:0] u0_m0_wo0_ca1_inner_i;
    wire [1:0] u0_m0_wo0_ca1_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_ca1_i;
    (* preserve_syn_only *) reg u0_m0_wo0_ca1_eq;
    reg [0:0] u0_m0_wo0_symSuppress_1_seq_q;
    reg u0_m0_wo0_symSuppress_1_seq_eq;
    reg [36:0] u0_m0_wo0_adelay_q;
    reg [36:0] u0_m0_wo0_adelay_delay_0;
    reg [36:0] u0_m0_wo0_adelay_delay_1;
    reg [0:0] u0_m0_wo0_aseq_q;
    reg u0_m0_wo0_aseq_eq;
    wire [36:0] u0_m0_wo0_accum_a;
    wire [36:0] u0_m0_wo0_accum_b;
    wire [36:0] u0_m0_wo0_accum_i;
    wire [36:0] u0_m0_wo0_accum_a1;
    wire [36:0] u0_m0_wo0_accum_b1;
    logic [36:0] u0_m0_wo0_accum_o;
    wire [36:0] u0_m0_wo0_accum_q;
    reg [0:0] u0_m0_wo0_oseq_q;
    reg u0_m0_wo0_oseq_eq;
    reg [0:0] u0_m0_wo0_oseq_gated_reg_q;
    reg [0:0] d_out0_m0_wo0_assign_id3_q_23_q;
    wire [2:0] outchan_q;
    (* preserve_syn_only *) reg [1:0] outchan_i;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_memread_fanout_reg0_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_memread_fanout_reg2_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_compute_fanout_reg1_q;
    reg [0:0] d_u0_m0_wo0_compute_fanout_reg1_q_16_q;
    reg [0:0] d_u0_m0_wo0_compute_fanout_reg1_q_16_delay_0;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_compute_fanout_reg2_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_compute_fanout_reg3_q;
    wire u0_m0_wo0_mtree_madd2_0_cma_reset;
    (* preserve_syn_only *) reg signed [16:0] u0_m0_wo0_mtree_madd2_0_cma_ah [0:1];
    (* preserve_syn_only *) reg signed [16:0] u0_m0_wo0_mtree_madd2_0_cma_bh [0:1];
    (* preserve_syn_only *) reg [2:0] u0_m0_wo0_mtree_madd2_0_cma_ch [0:1];
    wire [16:0] u0_m0_wo0_mtree_madd2_0_cma_a0;
    wire [16:0] u0_m0_wo0_mtree_madd2_0_cma_b0;
    wire [2:0] u0_m0_wo0_mtree_madd2_0_cma_c0;
    wire [16:0] u0_m0_wo0_mtree_madd2_0_cma_a1;
    wire [16:0] u0_m0_wo0_mtree_madd2_0_cma_b1;
    wire [2:0] u0_m0_wo0_mtree_madd2_0_cma_c1;
    wire [34:0] u0_m0_wo0_mtree_madd2_0_cma_s0;
    wire [34:0] u0_m0_wo0_mtree_madd2_0_cma_qq0;
    reg [34:0] u0_m0_wo0_mtree_madd2_0_cma_q;
    wire u0_m0_wo0_mtree_madd2_0_cma_ena0;
    wire u0_m0_wo0_mtree_madd2_0_cma_ena1;
    wire u0_m0_wo0_mtree_madd2_0_cma_ena2;
    wire [0:0] u0_m0_wo0_mtree_madd2_0_cma_mux_0_s;
    reg [16:0] u0_m0_wo0_mtree_madd2_0_cma_mux_0_q;
    wire u0_m0_wo0_wi0_r0_delayr1_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr1_mem_ena_OrRstB;
    wire [16:0] u0_m0_wo0_wi0_r0_delayr1_mem_ia;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr1_mem_aa;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr1_mem_ab;
    wire [16:0] u0_m0_wo0_wi0_r0_delayr1_mem_iq;
    wire [16:0] u0_m0_wo0_wi0_r0_delayr1_mem_q;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr1_rdcnt_q;
    (* preserve_syn_only *) reg [3:0] u0_m0_wo0_wi0_r0_delayr1_rdcnt_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq;
    reg [3:0] u0_m0_wo0_wi0_r0_delayr1_wraddr_q;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr1_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr1_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr3_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr3_mem_ena_OrRstB;
    wire [16:0] u0_m0_wo0_wi0_r0_delayr3_mem_ia;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr3_mem_aa;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr3_mem_ab;
    wire [16:0] u0_m0_wo0_wi0_r0_delayr3_mem_iq;
    wire [16:0] u0_m0_wo0_wi0_r0_delayr3_mem_q;
    wire [3:0] u0_m0_wo0_wi0_r0_delayr3_rdcnt_q;
    (* preserve_syn_only *) reg [3:0] u0_m0_wo0_wi0_r0_delayr3_rdcnt_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_delayr3_rdcnt_eq;
    reg [3:0] u0_m0_wo0_wi0_r0_delayr3_wraddr_q;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr3_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr3_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr3_sticky_ena_q;
    wire d_xIn_0_15_mem_reset0;
    wire [16:0] d_xIn_0_15_mem_ia;
    wire [1:0] d_xIn_0_15_mem_aa;
    wire [1:0] d_xIn_0_15_mem_ab;
    wire [16:0] d_xIn_0_15_mem_iq;
    wire [16:0] d_xIn_0_15_mem_q;
    wire [1:0] d_xIn_0_15_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] d_xIn_0_15_wraddr_i = 2'b11;
    wire [1:0] d_xIn_0_15_offset_q;
    wire [2:0] d_xIn_0_15_rdcnt_a;
    wire [2:0] d_xIn_0_15_rdcnt_b;
    logic [2:0] d_xIn_0_15_rdcnt_o;
    wire [2:0] d_xIn_0_15_rdcnt_q;
    wire [0:0] u0_m0_wo0_inputframe_q;
    wire [0:0] u0_m0_wo0_wi0_r0_ra0_count1_run_q;
    wire [0:0] u0_m0_wo0_wi0_r0_ra2_count0_run_q;
    wire [0:0] u0_m0_wo0_wi0_r0_ra2_count2_run_q;
    wire [0:0] u0_m0_wo0_ca1_run_q;
    wire [0:0] u0_m0_wo0_oseq_gated_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr1_rdmux_s;
    reg [3:0] u0_m0_wo0_wi0_r0_delayr1_rdmux_q;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr1_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr1_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr1_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr1_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr1_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr3_rdmux_s;
    reg [3:0] u0_m0_wo0_wi0_r0_delayr3_rdmux_q;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr3_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr3_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr3_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr3_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr3_enaAnd_q;
    reg [4:0] u0_m0_wo0_wi0_r0_ra0_count1_lut_q;
    wire [6:0] u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_BitSelect_for_a_in;
    wire [2:0] u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_BitSelect_for_a_b;
    wire [6:0] u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_BitSelect_for_b_in;
    wire [1:0] u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_BitSelect_for_b_b;
    reg [5:0] u0_m0_wo0_wi0_r0_ra2_count2_lut_q;
    wire [4:0] u0_m0_wo0_wi0_r0_ra2_resize_in;
    wire [4:0] u0_m0_wo0_wi0_r0_ra2_resize_b;
    reg [4:0] u0_m0_wo0_wi0_r0_wa2_1_lut_q;
    wire [6:0] u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_join_q;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // d_in0_m0_wi0_wo0_assign_id1_q_11(DELAY,91)@10 + 1
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

    // u0_m0_wo0_inputframe_seq(SEQUENCE,13)@10 + 1
    always @ (posedge clk)
    begin
        reg [4:0] u0_m0_wo0_inputframe_seq_c;
        if (areset)
        begin
            u0_m0_wo0_inputframe_seq_c = 5'b00000;
            u0_m0_wo0_inputframe_seq_q <= $unsigned(1'b0);
            u0_m0_wo0_inputframe_seq_eq <= 1'b0;
        end
        else
        begin
            if (xIn_v == 1'b1)
            begin
                if (u0_m0_wo0_inputframe_seq_c == 5'b00000)
                begin
                    u0_m0_wo0_inputframe_seq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_inputframe_seq_eq <= 1'b0;
                end
                if (u0_m0_wo0_inputframe_seq_eq == 1'b1)
                begin
                    u0_m0_wo0_inputframe_seq_c = $signed(u0_m0_wo0_inputframe_seq_c) + $signed(5'd3);
                end
                else
                begin
                    u0_m0_wo0_inputframe_seq_c = $signed(u0_m0_wo0_inputframe_seq_c) - $signed(5'd1);
                end
                u0_m0_wo0_inputframe_seq_q <= $unsigned(u0_m0_wo0_inputframe_seq_c[4:4]);
            end
        end
    end

    // u0_m0_wo0_inputframe(LOGICAL,14)@11
    assign u0_m0_wo0_inputframe_q = u0_m0_wo0_inputframe_seq_q & d_in0_m0_wi0_wo0_assign_id1_q_11_q;

    // u0_m0_wo0_run(ENABLEGENERATOR,15)@11 + 2
    assign u0_m0_wo0_run_ctrl = { u0_m0_wo0_run_out, u0_m0_wo0_inputframe_q, u0_m0_wo0_run_enableQ };
    always @ (posedge clk)
    begin
        reg [4:0] u0_m0_wo0_run_enable_c;
        reg [3:0] u0_m0_wo0_run_inc;
        if (areset)
        begin
            u0_m0_wo0_run_q <= $unsigned(1'b0);
            u0_m0_wo0_run_enable_c = 5'd10;
            u0_m0_wo0_run_enableQ <= $unsigned(1'b0);
            u0_m0_wo0_run_count <= $unsigned(4'b0000);
            u0_m0_wo0_run_inc = 4'b0;
        end
        else
        begin
            if (u0_m0_wo0_run_out == 1'b1)
            begin
                if (u0_m0_wo0_run_enable_c[4] == 1'b1)
                begin
                    u0_m0_wo0_run_enable_c = $signed(u0_m0_wo0_run_enable_c) - $signed(-5'd11);
                end
                else
                begin
                    u0_m0_wo0_run_enable_c = $signed(u0_m0_wo0_run_enable_c) + $signed(-5'd1);
                end
                u0_m0_wo0_run_enableQ <= $unsigned(u0_m0_wo0_run_enable_c[4:4]);
            end
            else
            begin
                u0_m0_wo0_run_enableQ <= $unsigned(1'b0);
            end
            unique case (u0_m0_wo0_run_ctrl)
                3'b000, 3'b001 : u0_m0_wo0_run_inc = 4'b0000;
                3'b010, 3'b011 : u0_m0_wo0_run_inc = 4'b1111;
                3'b100 : u0_m0_wo0_run_inc = 4'b0000;
                3'b101 : u0_m0_wo0_run_inc = 4'b0011;
                3'b110 : u0_m0_wo0_run_inc = 4'b1111;
                3'b111 : u0_m0_wo0_run_inc = 4'b0010;
                default : ;
            endcase
            u0_m0_wo0_run_count <= $unsigned($signed(u0_m0_wo0_run_count) + $signed(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        end
    end
    assign u0_m0_wo0_run_preEnaQ = u0_m0_wo0_run_count[3:3];
    assign u0_m0_wo0_run_out = u0_m0_wo0_run_preEnaQ & VCC_q;

    // u0_m0_wo0_memread(DELAY,16)@13
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

    // u0_m0_wo0_compute(DELAY,18)@13
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

    // d_u0_m0_wo0_compute_q_14(DELAY,93)@13 + 1
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

    // d_u0_m0_wo0_compute_q_15(DELAY,94)@14 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_compute_q_15_q <= $unsigned(d_u0_m0_wo0_compute_q_14_q);
        end
    end

    // d_u0_m0_wo0_compute_q_20(DELAY,95)@15 + 5
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_compute_q_20_delay_0 <= $unsigned(d_u0_m0_wo0_compute_q_15_q);
            d_u0_m0_wo0_compute_q_20_delay_1 <= d_u0_m0_wo0_compute_q_20_delay_0;
            d_u0_m0_wo0_compute_q_20_delay_2 <= d_u0_m0_wo0_compute_q_20_delay_1;
            d_u0_m0_wo0_compute_q_20_delay_3 <= d_u0_m0_wo0_compute_q_20_delay_2;
            d_u0_m0_wo0_compute_q_20_q <= d_u0_m0_wo0_compute_q_20_delay_3;
        end
    end

    // d_u0_m0_wo0_compute_q_21(DELAY,96)@20 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m0_wo0_compute_q_21_q <= '0;
        end
        else
        begin
            d_u0_m0_wo0_compute_q_21_q <= $unsigned(d_u0_m0_wo0_compute_q_20_q);
        end
    end

    // u0_m0_wo0_aseq(SEQUENCE,65)@21 + 1
    always @ (posedge clk)
    begin
        reg [5:0] u0_m0_wo0_aseq_c;
        if (areset)
        begin
            u0_m0_wo0_aseq_c = 6'b000000;
            u0_m0_wo0_aseq_q <= $unsigned(1'b0);
            u0_m0_wo0_aseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m0_wo0_compute_q_21_q == 1'b1)
            begin
                if (u0_m0_wo0_aseq_c == 6'b111101)
                begin
                    u0_m0_wo0_aseq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_aseq_eq <= 1'b0;
                end
                if (u0_m0_wo0_aseq_eq == 1'b1)
                begin
                    u0_m0_wo0_aseq_c = $signed(u0_m0_wo0_aseq_c) + $signed(6'd11);
                end
                else
                begin
                    u0_m0_wo0_aseq_c = $signed(u0_m0_wo0_aseq_c) - $signed(6'd1);
                end
                u0_m0_wo0_aseq_q <= $unsigned(u0_m0_wo0_aseq_c[5:5]);
            end
        end
    end

    // d_u0_m0_wo0_compute_q_22(DELAY,97)@21 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m0_wo0_compute_q_22_q <= '0;
        end
        else
        begin
            d_u0_m0_wo0_compute_q_22_q <= $unsigned(d_u0_m0_wo0_compute_q_21_q);
        end
    end

    // u0_m0_wo0_adelay(DELAY,64)@22
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else if (d_u0_m0_wo0_compute_q_22_q == 1'b1)
        begin
            u0_m0_wo0_adelay_delay_0 <= $unsigned(u0_m0_wo0_accum_q);
            u0_m0_wo0_adelay_delay_1 <= u0_m0_wo0_adelay_delay_0;
            u0_m0_wo0_adelay_q <= u0_m0_wo0_adelay_delay_1;
        end
    end

    // u0_m0_wo0_memread_fanout_reg0(REG,76)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_memread_fanout_reg0_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m0_wo0_memread_fanout_reg0_q <= $unsigned(u0_m0_wo0_memread_q);
        end
    end

    // u0_m0_wo0_wi0_r0_ra0_count1_inner(COUNTER,24)@14
    // low=-1, high=2, step=-1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count1_inner_i <= 3'd1;
        end
        else if (u0_m0_wo0_memread_fanout_reg0_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra0_count1_inner_i[2:2] == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra0_count1_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra0_count1_inner_i) - $signed(-3'd3);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra0_count1_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra0_count1_inner_i) - $signed(3'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_count1_inner_q = $unsigned(u0_m0_wo0_wi0_r0_ra0_count1_inner_i[2:0]);

    // u0_m0_wo0_wi0_r0_ra0_count1_run(LOGICAL,25)@14
    assign u0_m0_wo0_wi0_r0_ra0_count1_run_q = $unsigned(u0_m0_wo0_wi0_r0_ra0_count1_inner_q[2:2]);

    // u0_m0_wo0_wi0_r0_ra0_count1(COUNTER,26)@14
    // low=0, high=2, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count1_i <= 2'd0;
            u0_m0_wo0_wi0_r0_ra0_count1_eq <= 1'b0;
        end
        else if (u0_m0_wo0_memread_fanout_reg0_q == 1'b1 & u0_m0_wo0_wi0_r0_ra0_count1_run_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra0_count1_i == 2'd1)
            begin
                u0_m0_wo0_wi0_r0_ra0_count1_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra0_count1_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_ra0_count1_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra0_count1_i <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count1_i) + $unsigned(2'd2);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra0_count1_i <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count1_i) + $unsigned(2'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_count1_q = u0_m0_wo0_wi0_r0_ra0_count1_i[1:0];

    // u0_m0_wo0_wi0_r0_ra0_count1_lut(LOOKUP,22)@14
    always @(u0_m0_wo0_wi0_r0_ra0_count1_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra0_count1_q)
            2'b00 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b00100;
            2'b01 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b01000;
            2'b10 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b00000;
            default : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b00100;
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_ra0_count1_lutreg(REG,23)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count1_lutreg_q <= $unsigned(5'b00100);
        end
        else if (u0_m0_wo0_memread_fanout_reg0_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra0_count1_lutreg_q <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count1_lut_q);
        end
    end

    // u0_m0_wo0_wi0_r0_ra0_count0(COUNTER,21)@14
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count0_i <= 2'd0;
        end
        else if (u0_m0_wo0_memread_fanout_reg0_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra0_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count0_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_count0_q = {1'b0, u0_m0_wo0_wi0_r0_ra0_count0_i[1:0]};

    // u0_m0_wo0_wi0_r0_ra0_add_0_0(ADD,27)@14 + 1
    assign u0_m0_wo0_wi0_r0_ra0_add_0_0_a = $unsigned({{3{u0_m0_wo0_wi0_r0_ra0_count0_q[2]}}, u0_m0_wo0_wi0_r0_ra0_count0_q});
    assign u0_m0_wo0_wi0_r0_ra0_add_0_0_b = $unsigned({{1{u0_m0_wo0_wi0_r0_ra0_count1_lutreg_q[4]}}, u0_m0_wo0_wi0_r0_ra0_count1_lutreg_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_ra0_add_0_0_o <= $unsigned($signed(u0_m0_wo0_wi0_r0_ra0_add_0_0_a) + $signed(u0_m0_wo0_wi0_r0_ra0_add_0_0_b));
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_add_0_0_q = u0_m0_wo0_wi0_r0_ra0_add_0_0_o[5:0];

    // u0_m0_wo0_wi0_r0_readReg0(DELAY,46)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_readReg0_q <= u0_m0_wo0_wi0_r0_ra0_add_0_0_q;
        end
    end

    // d_xIn_0_15_offset(CONSTANT,126)
    assign d_xIn_0_15_offset_q = $unsigned(2'b10);

    // d_xIn_0_15_rdcnt(ADD,127)@10 + 1
    assign d_xIn_0_15_rdcnt_a = {1'b0, d_xIn_0_15_wraddr_q};
    assign d_xIn_0_15_rdcnt_b = {1'b0, d_xIn_0_15_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_xIn_0_15_rdcnt_o <= $unsigned(d_xIn_0_15_rdcnt_a) + $unsigned(d_xIn_0_15_rdcnt_b);
        end
    end
    assign d_xIn_0_15_rdcnt_q = d_xIn_0_15_rdcnt_o[2:0];

    // d_xIn_0_15_wraddr(COUNTER,125)@10 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_xIn_0_15_wraddr_i <= $unsigned(d_xIn_0_15_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign d_xIn_0_15_wraddr_q = d_xIn_0_15_wraddr_i[1:0];

    // d_xIn_0_15_mem(DUALMEM,124)@10 + 2
    assign d_xIn_0_15_mem_ia = $unsigned(xIn_0);
    assign d_xIn_0_15_mem_aa = d_xIn_0_15_wraddr_q;
    assign d_xIn_0_15_mem_ab = d_xIn_0_15_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(17),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(17),
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
    ) d_xIn_0_15_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(d_xIn_0_15_mem_aa),
        .data_a(d_xIn_0_15_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_xIn_0_15_mem_ab),
        .q_b(d_xIn_0_15_mem_iq),
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
    assign d_xIn_0_15_mem_q = d_xIn_0_15_mem_iq[16:0];

    // d_in0_m0_wi0_wo0_assign_id1_q_15(DELAY,92)@11 + 4
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_15_delay_0 <= '0;
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_15_delay_0 <= $unsigned(d_in0_m0_wi0_wo0_assign_id1_q_11_q);
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
            d_in0_m0_wi0_wo0_assign_id1_q_15_q <= d_in0_m0_wi0_wo0_assign_id1_q_15_delay_2;
        end
    end

    // u0_m0_wo0_wi0_r0_wa0(COUNTER,41)@15
    // low=0, high=11, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa0_i <= 4'd0;
            u0_m0_wo0_wi0_r0_wa0_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_15_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_wa0_i == 4'd10)
            begin
                u0_m0_wo0_wi0_r0_wa0_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_wa0_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_wa0_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_wa0_i <= $unsigned(u0_m0_wo0_wi0_r0_wa0_i) + $unsigned(4'd5);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_wa0_i <= $unsigned(u0_m0_wo0_wi0_r0_wa0_i) + $unsigned(4'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_wa0_q = u0_m0_wo0_wi0_r0_wa0_i[3:0];

    // u0_m0_wo0_wi0_r0_memr0(DUALMEM,44)@15
    assign u0_m0_wo0_wi0_r0_memr0_ia = $unsigned(d_xIn_0_15_mem_q);
    assign u0_m0_wo0_wi0_r0_memr0_aa = u0_m0_wo0_wi0_r0_wa0_q;
    assign u0_m0_wo0_wi0_r0_memr0_ab = u0_m0_wo0_wi0_r0_readReg0_q[3:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(17),
        .widthad_a(4),
        .numwords_a(12),
        .width_b(17),
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
    ) u0_m0_wo0_wi0_r0_memr0_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_wi0_r0_memr0_aa),
        .data_a(u0_m0_wo0_wi0_r0_memr0_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_15_q[0]),
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
    assign u0_m0_wo0_wi0_r0_memr0_q = u0_m0_wo0_wi0_r0_memr0_iq[16:0];

    // d_u0_m0_wo0_wi0_r0_outReg0_q_16(DELAY,98)@15 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_wi0_r0_outReg0_q_16_q <= $unsigned(u0_m0_wo0_wi0_r0_memr0_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr3_notEnable(LOGICAL,120)@16
    assign u0_m0_wo0_wi0_r0_delayr3_notEnable_q = $unsigned(~ (u0_m0_wo0_compute_fanout_reg3_q));

    // u0_m0_wo0_wi0_r0_delayr3_nor(LOGICAL,121)@16
    assign u0_m0_wo0_wi0_r0_delayr3_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr3_notEnable_q | u0_m0_wo0_wi0_r0_delayr3_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr3_mem_last(CONSTANT,117)
    assign u0_m0_wo0_wi0_r0_delayr3_mem_last_q = $unsigned(5'b01001);

    // u0_m0_wo0_wi0_r0_delayr3_cmp(LOGICAL,118)@16
    assign u0_m0_wo0_wi0_r0_delayr3_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr3_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr3_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr3_mem_last_q == u0_m0_wo0_wi0_r0_delayr3_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr3_cmpReg(REG,119)@16 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr3_cmpReg_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_compute_fanout_reg3_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr3_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr3_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr3_sticky_ena(REG,122)@16 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr3_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr3_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr3_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr3_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr3_enaAnd(LOGICAL,123)@16
    assign u0_m0_wo0_wi0_r0_delayr3_enaAnd_q = u0_m0_wo0_wi0_r0_delayr3_sticky_ena_q & u0_m0_wo0_compute_fanout_reg3_q;

    // u0_m0_wo0_wi0_r0_delayr3_rdcnt(COUNTER,114)@16 + 1
    // low=0, high=10, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr3_rdcnt_i <= 4'd0;
            u0_m0_wo0_wi0_r0_delayr3_rdcnt_eq <= 1'b0;
        end
        else if (u0_m0_wo0_compute_fanout_reg3_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_delayr3_rdcnt_i == 4'd9)
            begin
                u0_m0_wo0_wi0_r0_delayr3_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr3_rdcnt_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_delayr3_rdcnt_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_delayr3_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr3_rdcnt_i) + $unsigned(4'd6);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr3_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr3_rdcnt_i) + $unsigned(4'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr3_rdcnt_q = u0_m0_wo0_wi0_r0_delayr3_rdcnt_i[3:0];

    // u0_m0_wo0_wi0_r0_delayr3_rdmux(MUX,115)@16
    assign u0_m0_wo0_wi0_r0_delayr3_rdmux_s = u0_m0_wo0_compute_fanout_reg3_q;
    always @(u0_m0_wo0_wi0_r0_delayr3_rdmux_s or u0_m0_wo0_wi0_r0_delayr3_wraddr_q or u0_m0_wo0_wi0_r0_delayr3_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr3_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr3_rdmux_q = u0_m0_wo0_wi0_r0_delayr3_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr3_rdmux_q = u0_m0_wo0_wi0_r0_delayr3_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr3_rdmux_q = 4'b0;
        endcase
    end

    // u0_m0_wo0_memread_fanout_reg2(REG,78)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_memread_fanout_reg2_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m0_wo0_memread_fanout_reg2_q <= $unsigned(u0_m0_wo0_memread_q);
        end
    end

    // u0_m0_wo0_wi0_r0_ra2_count2_inner(COUNTER,35)@14
    // low=-1, high=2, step=-1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra2_count2_inner_i <= 3'd1;
        end
        else if (u0_m0_wo0_memread_fanout_reg2_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra2_count2_inner_i[2:2] == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra2_count2_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra2_count2_inner_i) - $signed(-3'd3);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra2_count2_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra2_count2_inner_i) - $signed(3'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra2_count2_inner_q = $unsigned(u0_m0_wo0_wi0_r0_ra2_count2_inner_i[2:0]);

    // u0_m0_wo0_wi0_r0_ra2_count2_run(LOGICAL,36)@14
    assign u0_m0_wo0_wi0_r0_ra2_count2_run_q = $unsigned(u0_m0_wo0_wi0_r0_ra2_count2_inner_q[2:2]);

    // u0_m0_wo0_wi0_r0_ra2_count2(COUNTER,37)@14
    // low=0, high=2, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra2_count2_i <= 2'd0;
            u0_m0_wo0_wi0_r0_ra2_count2_eq <= 1'b0;
        end
        else if (u0_m0_wo0_memread_fanout_reg2_q == 1'b1 & u0_m0_wo0_wi0_r0_ra2_count2_run_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra2_count2_i == 2'd1)
            begin
                u0_m0_wo0_wi0_r0_ra2_count2_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra2_count2_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_ra2_count2_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra2_count2_i <= $unsigned(u0_m0_wo0_wi0_r0_ra2_count2_i) + $unsigned(2'd2);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra2_count2_i <= $unsigned(u0_m0_wo0_wi0_r0_ra2_count2_i) + $unsigned(2'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra2_count2_q = u0_m0_wo0_wi0_r0_ra2_count2_i[1:0];

    // u0_m0_wo0_wi0_r0_ra2_count2_lut(LOOKUP,33)@14
    always @(u0_m0_wo0_wi0_r0_ra2_count2_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra2_count2_q)
            2'b00 : u0_m0_wo0_wi0_r0_ra2_count2_lut_q = 6'b010000;
            2'b01 : u0_m0_wo0_wi0_r0_ra2_count2_lut_q = 6'b001100;
            2'b10 : u0_m0_wo0_wi0_r0_ra2_count2_lut_q = 6'b001000;
            default : u0_m0_wo0_wi0_r0_ra2_count2_lut_q = 6'b010000;
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_ra2_count2_lutreg(REG,34)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra2_count2_lutreg_q <= $unsigned(6'b010000);
        end
        else if (u0_m0_wo0_memread_fanout_reg2_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra2_count2_lutreg_q <= $unsigned(u0_m0_wo0_wi0_r0_ra2_count2_lut_q);
        end
    end

    // u0_m0_wo0_wi0_r0_ra2_count0_inner(COUNTER,29)@14
    // low=-1, high=10, step=-1, init=10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra2_count0_inner_i <= 5'd10;
        end
        else if (u0_m0_wo0_memread_fanout_reg2_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra2_count0_inner_i[4:4] == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra2_count0_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra2_count0_inner_i) - $signed(-5'd11);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra2_count0_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra2_count0_inner_i) - $signed(5'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra2_count0_inner_q = $unsigned(u0_m0_wo0_wi0_r0_ra2_count0_inner_i[4:0]);

    // u0_m0_wo0_wi0_r0_ra2_count0_run(LOGICAL,30)@14
    assign u0_m0_wo0_wi0_r0_ra2_count0_run_q = $unsigned(u0_m0_wo0_wi0_r0_ra2_count0_inner_q[4:4]);

    // u0_m0_wo0_wi0_r0_ra2_count0(COUNTER,31)@14
    // low=0, high=31, step=12, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra2_count0_i <= 5'd0;
        end
        else if (u0_m0_wo0_memread_fanout_reg2_q == 1'b1 & u0_m0_wo0_wi0_r0_ra2_count0_run_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra2_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra2_count0_i) + $unsigned(5'd12);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra2_count0_q = {1'b0, u0_m0_wo0_wi0_r0_ra2_count0_i[4:0]};

    // u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_BitSelect_for_a(BITSELECT,85)@14
    assign u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_BitSelect_for_a_in = {1'b0, u0_m0_wo0_wi0_r0_ra2_count0_q};
    assign u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_BitSelect_for_a_b = u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_BitSelect_for_a_in[4:2];

    // u0_m0_wo0_wi0_r0_ra2_count1(COUNTER,32)@14
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra2_count1_i <= 2'd0;
        end
        else if (u0_m0_wo0_memread_fanout_reg2_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra2_count1_i <= $unsigned(u0_m0_wo0_wi0_r0_ra2_count1_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra2_count1_q = {1'b0, u0_m0_wo0_wi0_r0_ra2_count1_i[1:0]};

    // u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_BitSelect_for_b(BITSELECT,86)@14
    assign u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_BitSelect_for_b_in = {4'b0000, u0_m0_wo0_wi0_r0_ra2_count1_q};
    assign u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_BitSelect_for_b_b = u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_BitSelect_for_b_in[1:0];

    // u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_join(BITJOIN,87)@14
    assign u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_join_q = {GND_q, GND_q, u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_BitSelect_for_a_b, u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_BitSelect_for_b_b};

    // u0_m0_wo0_wi0_r0_ra2_add_1_0(ADD,39)@14 + 1
    assign u0_m0_wo0_wi0_r0_ra2_add_1_0_a = {1'b0, u0_m0_wo0_wi0_r0_ra2_add_0_0_replace_or_join_q};
    assign u0_m0_wo0_wi0_r0_ra2_add_1_0_b = {2'b00, u0_m0_wo0_wi0_r0_ra2_count2_lutreg_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_ra2_add_1_0_o <= $unsigned(u0_m0_wo0_wi0_r0_ra2_add_1_0_a) + $unsigned(u0_m0_wo0_wi0_r0_ra2_add_1_0_b);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra2_add_1_0_q = u0_m0_wo0_wi0_r0_ra2_add_1_0_o[7:0];

    // u0_m0_wo0_wi0_r0_ra2_resize(BITSELECT,40)@15
    assign u0_m0_wo0_wi0_r0_ra2_resize_in = $unsigned(u0_m0_wo0_wi0_r0_ra2_add_1_0_q[4:0]);
    assign u0_m0_wo0_wi0_r0_ra2_resize_b = $unsigned(u0_m0_wo0_wi0_r0_ra2_resize_in[4:0]);

    // u0_m0_wo0_wi0_r0_readReg2(DELAY,49)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_readReg2_q <= u0_m0_wo0_wi0_r0_ra2_resize_b;
        end
    end

    // u0_m0_wo0_compute_fanout_reg2(REG,82)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_compute_fanout_reg2_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m0_wo0_compute_fanout_reg2_q <= $unsigned(d_u0_m0_wo0_compute_q_14_q);
        end
    end

    // u0_m0_wo0_wi0_r0_wa2_1_lut(LOOKUP,42)@15
    always @(u0_m0_wo0_wi0_r0_wa2_1_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_wa2_1_q)
            5'b00000 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b00001;
            5'b00001 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b00010;
            5'b00010 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b00011;
            5'b00011 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b00100;
            5'b00100 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b00101;
            5'b00101 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b00110;
            5'b00110 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b00111;
            5'b00111 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b01000;
            5'b01000 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b01001;
            5'b01001 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b01010;
            5'b01010 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b01011;
            5'b01011 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b01100;
            5'b01100 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b01101;
            5'b01101 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b01110;
            5'b01110 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b01111;
            5'b01111 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b10000;
            5'b10000 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b10001;
            5'b10001 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b10010;
            5'b10010 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b10011;
            5'b10011 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b10100;
            5'b10100 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b10101;
            5'b10101 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b10110;
            5'b10110 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b10111;
            5'b10111 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b11000;
            5'b11000 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b11001;
            5'b11001 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b11010;
            5'b11010 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b11011;
            5'b11011 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b11100;
            5'b11100 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b11101;
            5'b11101 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b11110;
            5'b11110 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b11111;
            5'b11111 : u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'b00000;
            default : begin
                          // unreachable
                          u0_m0_wo0_wi0_r0_wa2_1_lut_q = 5'bxxxxx;
                      end
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_wa2_1(REG,43)@15
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa2_1_q <= $unsigned(5'b10100);
        end
        else if (u0_m0_wo0_compute_fanout_reg2_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_wa2_1_q <= u0_m0_wo0_wi0_r0_wa2_1_lut_q;
        end
    end

    // u0_m0_wo0_wi0_r0_memr2(DUALMEM,47)@15
    assign u0_m0_wo0_wi0_r0_memr2_ia = $unsigned(u0_m0_wo0_wi0_r0_memr0_q);
    assign u0_m0_wo0_wi0_r0_memr2_aa = u0_m0_wo0_wi0_r0_wa2_1_q;
    assign u0_m0_wo0_wi0_r0_memr2_ab = u0_m0_wo0_wi0_r0_readReg2_q;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(17),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(17),
        .widthad_b(5),
        .numwords_b(32),
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
        .wren_a(u0_m0_wo0_compute_fanout_reg2_q[0]),
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
    assign u0_m0_wo0_wi0_r0_memr2_q = u0_m0_wo0_wi0_r0_memr2_iq[16:0];

    // d_u0_m0_wo0_wi0_r0_outReg2_q_16(DELAY,99)@15 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_wi0_r0_outReg2_q_16_q <= $unsigned(u0_m0_wo0_wi0_r0_memr2_q);
        end
    end

    // u0_m0_wo0_compute_fanout_reg3(REG,83)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_compute_fanout_reg3_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m0_wo0_compute_fanout_reg3_q <= $unsigned(d_u0_m0_wo0_compute_q_15_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr3_wraddr(REG,116)@16 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr3_wraddr_q <= $unsigned(4'b1010);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr3_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr3_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr3_mem(DUALMEM,113)@16 + 2
    assign u0_m0_wo0_wi0_r0_delayr3_mem_ia = $unsigned(d_u0_m0_wo0_wi0_r0_outReg2_q_16_q);
    assign u0_m0_wo0_wi0_r0_delayr3_mem_aa = u0_m0_wo0_wi0_r0_delayr3_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr3_mem_ab = u0_m0_wo0_wi0_r0_delayr3_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr3_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr3_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr3_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(17),
        .widthad_a(4),
        .numwords_a(11),
        .width_b(17),
        .widthad_b(4),
        .numwords_b(11),
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
    ) u0_m0_wo0_wi0_r0_delayr3_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr3_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr3_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr3_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr3_mem_ia),
        .wren_a(u0_m0_wo0_compute_fanout_reg3_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr3_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr3_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr3_mem_q = u0_m0_wo0_wi0_r0_delayr3_mem_iq[16:0];

    // u0_m0_wo0_ca1_inner(COUNTER,52)@16
    // low=-1, high=2, step=-1, init=2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_ca1_inner_i <= 3'd2;
        end
        else if (d_u0_m0_wo0_compute_fanout_reg1_q_16_q == 1'b1)
        begin
            if (u0_m0_wo0_ca1_inner_i[2:2] == 1'b1)
            begin
                u0_m0_wo0_ca1_inner_i <= $signed(u0_m0_wo0_ca1_inner_i) - $signed(-3'd3);
            end
            else
            begin
                u0_m0_wo0_ca1_inner_i <= $signed(u0_m0_wo0_ca1_inner_i) - $signed(3'd1);
            end
        end
    end
    assign u0_m0_wo0_ca1_inner_q = $unsigned(u0_m0_wo0_ca1_inner_i[2:0]);

    // u0_m0_wo0_ca1_run(LOGICAL,53)@16
    assign u0_m0_wo0_ca1_run_q = $unsigned(u0_m0_wo0_ca1_inner_q[2:2]);

    // u0_m0_wo0_compute_fanout_reg1(REG,81)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_compute_fanout_reg1_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m0_wo0_compute_fanout_reg1_q <= $unsigned(u0_m0_wo0_compute_q);
        end
    end

    // d_u0_m0_wo0_compute_fanout_reg1_q_16(DELAY,101)@14 + 2
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_compute_fanout_reg1_q_16_delay_0 <= $unsigned(u0_m0_wo0_compute_fanout_reg1_q);
            d_u0_m0_wo0_compute_fanout_reg1_q_16_q <= d_u0_m0_wo0_compute_fanout_reg1_q_16_delay_0;
        end
    end

    // u0_m0_wo0_ca1(COUNTER,54)@16
    // low=0, high=2, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_ca1_i <= 2'd0;
            u0_m0_wo0_ca1_eq <= 1'b0;
        end
        else if (d_u0_m0_wo0_compute_fanout_reg1_q_16_q == 1'b1 & u0_m0_wo0_ca1_run_q == 1'b1)
        begin
            if (u0_m0_wo0_ca1_i == 2'd1)
            begin
                u0_m0_wo0_ca1_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_ca1_eq <= 1'b0;
            end
            if (u0_m0_wo0_ca1_eq == 1'b1)
            begin
                u0_m0_wo0_ca1_i <= $unsigned(u0_m0_wo0_ca1_i) + $unsigned(2'd2);
            end
            else
            begin
                u0_m0_wo0_ca1_i <= $unsigned(u0_m0_wo0_ca1_i) + $unsigned(2'd1);
            end
        end
    end
    assign u0_m0_wo0_ca1_q = u0_m0_wo0_ca1_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr1_notEnable(LOGICAL,109)@16
    assign u0_m0_wo0_wi0_r0_delayr1_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_fanout_reg1_q_16_q));

    // u0_m0_wo0_wi0_r0_delayr1_nor(LOGICAL,110)@16
    assign u0_m0_wo0_wi0_r0_delayr1_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr1_notEnable_q | u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr1_mem_last(CONSTANT,106)
    assign u0_m0_wo0_wi0_r0_delayr1_mem_last_q = $unsigned(5'b01001);

    // u0_m0_wo0_wi0_r0_delayr1_cmp(LOGICAL,107)@16
    assign u0_m0_wo0_wi0_r0_delayr1_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr1_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr1_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr1_mem_last_q == u0_m0_wo0_wi0_r0_delayr1_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr1_cmpReg(REG,108)@16 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr1_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_fanout_reg1_q_16_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr1_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr1_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr1_sticky_ena(REG,111)@16 + 1
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

    // u0_m0_wo0_wi0_r0_delayr1_enaAnd(LOGICAL,112)@16
    assign u0_m0_wo0_wi0_r0_delayr1_enaAnd_q = u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q & d_u0_m0_wo0_compute_fanout_reg1_q_16_q;

    // u0_m0_wo0_wi0_r0_delayr1_rdcnt(COUNTER,103)@16 + 1
    // low=0, high=10, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr1_rdcnt_i <= 4'd0;
            u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq <= 1'b0;
        end
        else if (d_u0_m0_wo0_compute_fanout_reg1_q_16_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_delayr1_rdcnt_i == 4'd9)
            begin
                u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_delayr1_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr1_rdcnt_i) + $unsigned(4'd6);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr1_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr1_rdcnt_i) + $unsigned(4'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr1_rdcnt_q = u0_m0_wo0_wi0_r0_delayr1_rdcnt_i[3:0];

    // u0_m0_wo0_wi0_r0_delayr1_rdmux(MUX,104)@16
    assign u0_m0_wo0_wi0_r0_delayr1_rdmux_s = d_u0_m0_wo0_compute_fanout_reg1_q_16_q;
    always @(u0_m0_wo0_wi0_r0_delayr1_rdmux_s or u0_m0_wo0_wi0_r0_delayr1_wraddr_q or u0_m0_wo0_wi0_r0_delayr1_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr1_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr1_rdmux_q = u0_m0_wo0_wi0_r0_delayr1_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr1_rdmux_q = u0_m0_wo0_wi0_r0_delayr1_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr1_rdmux_q = 4'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_delayr1_wraddr(REG,105)@16 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr1_wraddr_q <= $unsigned(4'b1010);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr1_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr1_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr1_mem(DUALMEM,102)@16 + 2
    assign u0_m0_wo0_wi0_r0_delayr1_mem_ia = $unsigned(d_u0_m0_wo0_wi0_r0_outReg0_q_16_q);
    assign u0_m0_wo0_wi0_r0_delayr1_mem_aa = u0_m0_wo0_wi0_r0_delayr1_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr1_mem_ab = u0_m0_wo0_wi0_r0_delayr1_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr1_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr1_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr1_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(17),
        .widthad_a(4),
        .numwords_a(11),
        .width_b(17),
        .widthad_b(4),
        .numwords_b(11),
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
        .wren_a(d_u0_m0_wo0_compute_fanout_reg1_q_16_q[0]),
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
    assign u0_m0_wo0_wi0_r0_delayr1_mem_q = u0_m0_wo0_wi0_r0_delayr1_mem_iq[16:0];

    // u0_m0_wo0_symSuppress_1_seq(SEQUENCE,61)@14 + 1
    always @ (posedge clk)
    begin
        reg [5:0] u0_m0_wo0_symSuppress_1_seq_c;
        if (areset)
        begin
            u0_m0_wo0_symSuppress_1_seq_c = 6'b000100;
            u0_m0_wo0_symSuppress_1_seq_q <= $unsigned(1'b0);
            u0_m0_wo0_symSuppress_1_seq_eq <= 1'b0;
        end
        else
        begin
            if (u0_m0_wo0_compute_fanout_reg1_q == 1'b1)
            begin
                if (u0_m0_wo0_symSuppress_1_seq_c == 6'b111101)
                begin
                    u0_m0_wo0_symSuppress_1_seq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_symSuppress_1_seq_eq <= 1'b0;
                end
                if (u0_m0_wo0_symSuppress_1_seq_eq == 1'b1)
                begin
                    u0_m0_wo0_symSuppress_1_seq_c = $signed(u0_m0_wo0_symSuppress_1_seq_c) + $signed(6'd11);
                end
                else
                begin
                    u0_m0_wo0_symSuppress_1_seq_c = $signed(u0_m0_wo0_symSuppress_1_seq_c) - $signed(6'd1);
                end
                u0_m0_wo0_symSuppress_1_seq_q <= $unsigned(u0_m0_wo0_symSuppress_1_seq_c[5:5]);
            end
        end
    end

    // u0_m0_wo0_mtree_madd2_0_cma_mux_0(MUX,89)@15 + 1
    assign u0_m0_wo0_mtree_madd2_0_cma_mux_0_s = u0_m0_wo0_symSuppress_1_seq_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (u0_m0_wo0_mtree_madd2_0_cma_mux_0_s)
                1'b0 : u0_m0_wo0_mtree_madd2_0_cma_mux_0_q <= u0_m0_wo0_wi0_r0_memr2_q;
                1'b1 : u0_m0_wo0_mtree_madd2_0_cma_mux_0_q <= {{16{GND_q[0]}}, GND_q};
                default : u0_m0_wo0_mtree_madd2_0_cma_mux_0_q <= 17'b0;
            endcase
        end
    end

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // u0_m0_wo0_mtree_madd2_0_cma(CHAINMULTADD,88)@17 + 5
    assign u0_m0_wo0_mtree_madd2_0_cma_reset = areset;
    assign u0_m0_wo0_mtree_madd2_0_cma_ena0 = 1'b1;
    assign u0_m0_wo0_mtree_madd2_0_cma_ena1 = u0_m0_wo0_mtree_madd2_0_cma_ena0;
    assign u0_m0_wo0_mtree_madd2_0_cma_ena2 = u0_m0_wo0_mtree_madd2_0_cma_ena0;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_mtree_madd2_0_cma_ah[0] <= u0_m0_wo0_mtree_madd2_0_cma_mux_0_q;
            u0_m0_wo0_mtree_madd2_0_cma_ah[1] <= u0_m0_wo0_wi0_r0_delayr3_mem_q;
            u0_m0_wo0_mtree_madd2_0_cma_bh[0] <= u0_m0_wo0_wi0_r0_delayr1_mem_q;
            u0_m0_wo0_mtree_madd2_0_cma_bh[1] <= d_u0_m0_wo0_wi0_r0_outReg0_q_16_q;
            u0_m0_wo0_mtree_madd2_0_cma_ch[0] <= {1'b0, u0_m0_wo0_ca1_q[1:0]};
            u0_m0_wo0_mtree_madd2_0_cma_ch[1] <= {1'b0, u0_m0_wo0_ca1_q[1:0]};
        end
    end

    assign u0_m0_wo0_mtree_madd2_0_cma_a0 = $unsigned(u0_m0_wo0_mtree_madd2_0_cma_ah[0]);
    assign u0_m0_wo0_mtree_madd2_0_cma_b0 = $unsigned(u0_m0_wo0_mtree_madd2_0_cma_bh[0]);
    assign u0_m0_wo0_mtree_madd2_0_cma_c0 = u0_m0_wo0_mtree_madd2_0_cma_ch[0];
    assign u0_m0_wo0_mtree_madd2_0_cma_a1 = $unsigned(u0_m0_wo0_mtree_madd2_0_cma_ah[1]);
    assign u0_m0_wo0_mtree_madd2_0_cma_b1 = $unsigned(u0_m0_wo0_mtree_madd2_0_cma_bh[1]);
    assign u0_m0_wo0_mtree_madd2_0_cma_c1 = u0_m0_wo0_mtree_madd2_0_cma_ch[1];
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("none"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(17),
        .by_clken("0"),
        .by_width(17),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(17),
        .bz_width(17),
        .operand_source_max("coef"),
        .operand_source_mbx("coef"),
        .coef_sel_a_clken("0"),
        .coef_sel_b_clken("0"),
        .coef_a_0(1592),
        .coef_a_1(923),
        .coef_a_2(365),
        .coef_b_0(0),
        .coef_b_1(2357),
        .coef_b_2(2143),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(35)
    ) u0_m0_wo0_mtree_madd2_0_cma_DSP0 (
        .clk(clk),
        .ena({ u0_m0_wo0_mtree_madd2_0_cma_ena2, u0_m0_wo0_mtree_madd2_0_cma_ena1, u0_m0_wo0_mtree_madd2_0_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(u0_m0_wo0_mtree_madd2_0_cma_a1),
        .by(u0_m0_wo0_mtree_madd2_0_cma_a0),
        .az(u0_m0_wo0_mtree_madd2_0_cma_b1),
        .bz(u0_m0_wo0_mtree_madd2_0_cma_b0),
        .coefsela(u0_m0_wo0_mtree_madd2_0_cma_c1),
        .coefselb(u0_m0_wo0_mtree_madd2_0_cma_c0),
        .resulta(u0_m0_wo0_mtree_madd2_0_cma_s0),
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
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(35), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    u0_m0_wo0_mtree_madd2_0_cma_delay0 ( .xin(u0_m0_wo0_mtree_madd2_0_cma_s0), .xout(u0_m0_wo0_mtree_madd2_0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_m0_wo0_mtree_madd2_0_cma_q = $unsigned(u0_m0_wo0_mtree_madd2_0_cma_qq0[34:0]);

    // u0_m0_wo0_accum(ADD,66)@22 + 1
    assign u0_m0_wo0_accum_a = $unsigned({{2{u0_m0_wo0_mtree_madd2_0_cma_q[34]}}, u0_m0_wo0_mtree_madd2_0_cma_q});
    assign u0_m0_wo0_accum_b = $unsigned(u0_m0_wo0_adelay_q);
    assign u0_m0_wo0_accum_i = u0_m0_wo0_accum_a;
    assign u0_m0_wo0_accum_a1 = u0_m0_wo0_accum_i;
    assign u0_m0_wo0_accum_b1 = u0_m0_wo0_aseq_q == 1'b1 ? 37'b0 : u0_m0_wo0_accum_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_accum_o <= 37'b0;
        end
        else if (d_u0_m0_wo0_compute_q_22_q == 1'b1)
        begin
            u0_m0_wo0_accum_o <= $unsigned($signed(u0_m0_wo0_accum_a1) + $signed(u0_m0_wo0_accum_b1));
        end
    end
    assign u0_m0_wo0_accum_q = u0_m0_wo0_accum_o[36:0];

    // u0_m0_wo0_oseq(SEQUENCE,67)@20 + 1
    always @ (posedge clk)
    begin
        reg [5:0] u0_m0_wo0_oseq_c;
        if (areset)
        begin
            u0_m0_wo0_oseq_c = 6'b001000;
            u0_m0_wo0_oseq_q <= $unsigned(1'b0);
            u0_m0_wo0_oseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m0_wo0_compute_q_20_q == 1'b1)
            begin
                if (u0_m0_wo0_oseq_c == 6'b111101)
                begin
                    u0_m0_wo0_oseq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_oseq_eq <= 1'b0;
                end
                if (u0_m0_wo0_oseq_eq == 1'b1)
                begin
                    u0_m0_wo0_oseq_c = $signed(u0_m0_wo0_oseq_c) + $signed(6'd11);
                end
                else
                begin
                    u0_m0_wo0_oseq_c = $signed(u0_m0_wo0_oseq_c) - $signed(6'd1);
                end
                u0_m0_wo0_oseq_q <= $unsigned(u0_m0_wo0_oseq_c[5:5]);
            end
        end
    end

    // u0_m0_wo0_oseq_gated(LOGICAL,68)@21
    assign u0_m0_wo0_oseq_gated_q = u0_m0_wo0_oseq_q & d_u0_m0_wo0_compute_q_21_q;

    // u0_m0_wo0_oseq_gated_reg(REG,69)@21 + 1
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

    // outchan(COUNTER,74)@22 + 1
    // low=0, high=3, step=1, init=3
    always @ (posedge clk)
    begin
        if (areset)
        begin
            outchan_i <= 2'd3;
        end
        else if (u0_m0_wo0_oseq_gated_reg_q == 1'b1)
        begin
            outchan_i <= $unsigned(outchan_i) + $unsigned(2'd1);
        end
    end
    assign outchan_q = {1'b0, outchan_i[1:0]};

    // d_out0_m0_wo0_assign_id3_q_23(DELAY,100)@22 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_out0_m0_wo0_assign_id3_q_23_q <= $unsigned(u0_m0_wo0_oseq_gated_reg_q);
        end
    end

    // xOut(PORTOUT,75)@23 + 1
    assign xOut_v = d_out0_m0_wo0_assign_id3_q_23_q;
    assign xOut_c = {5'b00000, outchan_q};
    assign xOut_0 = u0_m0_wo0_accum_q;

endmodule
