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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage2_Filt_DEC_by_2_stage2_DecimatingFIR1
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000tage2_DecimatingFIR1 (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [15:0] xIn_0,
    output wire [0:0] xOut_v,
    output wire [7:0] xOut_c,
    output wire [34:0] xOut_0,
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
    reg [2:0] u0_m0_wo0_run_count;
    wire [0:0] u0_m0_wo0_run_preEnaQ;
    reg [0:0] u0_m0_wo0_run_q;
    wire [0:0] u0_m0_wo0_run_out;
    reg [0:0] u0_m0_wo0_run_enableQ;
    wire [2:0] u0_m0_wo0_run_ctrl;
    reg [0:0] u0_m0_wo0_memread_q;
    reg [0:0] u0_m0_wo0_compute_q;
    reg [0:0] u0_m0_wo0_compute_delay_0;
    reg [0:0] u0_m0_wo0_compute_delay_1;
    reg [0:0] d_u0_m0_wo0_compute_q_20_q;
    reg [0:0] d_u0_m0_wo0_compute_q_21_q;
    reg [0:0] d_u0_m0_wo0_compute_q_22_q;
    wire [2:0] u0_m0_wo0_wi0_r0_ra0_count0_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_ra0_count0_i;
    reg [4:0] u0_m0_wo0_wi0_r0_ra0_count1_lutreg_q;
    wire [2:0] u0_m0_wo0_wi0_r0_ra0_count1_inner_q;
    (* preserve_syn_only *) reg signed [2:0] u0_m0_wo0_wi0_r0_ra0_count1_inner_i;
    wire [2:0] u0_m0_wo0_wi0_r0_ra0_count1_q;
    (* preserve_syn_only *) reg [2:0] u0_m0_wo0_wi0_r0_ra0_count1_i;
    wire [5:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_a;
    wire [5:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_b;
    logic [5:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_o;
    wire [5:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_q;
    wire [2:0] u0_m0_wo0_wi0_r0_ra1_count0_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_ra1_count0_i;
    reg [5:0] u0_m0_wo0_wi0_r0_ra1_count1_lutreg_q;
    wire [2:0] u0_m0_wo0_wi0_r0_ra1_count1_inner_q;
    (* preserve_syn_only *) reg signed [2:0] u0_m0_wo0_wi0_r0_ra1_count1_inner_i;
    wire [3:0] u0_m0_wo0_wi0_r0_ra1_count1_q;
    (* preserve_syn_only *) reg [3:0] u0_m0_wo0_wi0_r0_ra1_count1_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_ra1_count1_eq;
    wire [6:0] u0_m0_wo0_wi0_r0_ra1_add_0_0_a;
    wire [6:0] u0_m0_wo0_wi0_r0_ra1_add_0_0_b;
    logic [6:0] u0_m0_wo0_wi0_r0_ra1_add_0_0_o;
    wire [6:0] u0_m0_wo0_wi0_r0_ra1_add_0_0_q;
    reg [0:0] u0_m0_wo0_wi0_r0_we1_seq_q;
    reg u0_m0_wo0_wi0_r0_we1_seq_eq;
    wire [3:0] u0_m0_wo0_wi0_r0_wa0_q;
    (* preserve_syn_only *) reg [3:0] u0_m0_wo0_wi0_r0_wa0_i;
    wire [4:0] u0_m0_wo0_wi0_r0_wa1_q;
    (* preserve_syn_only *) reg [4:0] u0_m0_wo0_wi0_r0_wa1_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_wa1_eq;
    wire u0_m0_wo0_wi0_r0_memr0_reset0;
    wire [15:0] u0_m0_wo0_wi0_r0_memr0_ia;
    wire [3:0] u0_m0_wo0_wi0_r0_memr0_aa;
    wire [3:0] u0_m0_wo0_wi0_r0_memr0_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_memr0_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_memr0_q;
    reg [15:0] d_u0_m0_wo0_wi0_r0_outReg0_q_16_q;
    reg [3:0] u0_m0_wo0_wi0_r0_readReg0_q;
    wire u0_m0_wo0_wi0_r0_memr1_reset0;
    wire [15:0] u0_m0_wo0_wi0_r0_memr1_ia;
    wire [4:0] u0_m0_wo0_wi0_r0_memr1_aa;
    wire [4:0] u0_m0_wo0_wi0_r0_memr1_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_memr1_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_memr1_q;
    reg [6:0] u0_m0_wo0_wi0_r0_readReg1_q;
    wire [2:0] u0_m0_wo0_ca0_inner_q;
    (* preserve_syn_only *) reg signed [2:0] u0_m0_wo0_ca0_inner_i;
    wire [1:0] u0_m0_wo0_ca0_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_ca0_i;
    reg [0:0] u0_m0_wo0_symSuppress_0_seq_q;
    reg u0_m0_wo0_symSuppress_0_seq_eq;
    reg [34:0] u0_m0_wo0_adelay_q;
    reg [34:0] u0_m0_wo0_adelay_delay_0;
    reg [34:0] u0_m0_wo0_adelay_delay_1;
    reg [0:0] u0_m0_wo0_aseq_q;
    reg u0_m0_wo0_aseq_eq;
    wire [34:0] u0_m0_wo0_accum_a;
    wire [34:0] u0_m0_wo0_accum_b;
    wire [34:0] u0_m0_wo0_accum_i;
    wire [34:0] u0_m0_wo0_accum_a1;
    wire [34:0] u0_m0_wo0_accum_b1;
    logic [34:0] u0_m0_wo0_accum_o;
    wire [34:0] u0_m0_wo0_accum_q;
    reg [0:0] u0_m0_wo0_oseq_q;
    reg u0_m0_wo0_oseq_eq;
    reg [0:0] u0_m0_wo0_oseq_gated_reg_q;
    reg [0:0] d_out0_m0_wo0_assign_id3_q_23_q;
    wire [2:0] outchan_q;
    (* preserve_syn_only *) reg [1:0] outchan_i;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_memread_fanout_reg0_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_memread_fanout_reg1_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_compute_fanout_reg0_q;
    reg [0:0] d_u0_m0_wo0_compute_fanout_reg0_q_16_q;
    reg [0:0] d_u0_m0_wo0_compute_fanout_reg0_q_16_delay_0;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_compute_fanout_reg1_q;
    wire u0_m0_wo0_mtree_mult1_0_cma_reset;
    (* preserve_syn_only *) reg signed [15:0] u0_m0_wo0_mtree_mult1_0_cma_ah [0:0];
    (* preserve_syn_only *) reg signed [15:0] u0_m0_wo0_mtree_mult1_0_cma_bh [0:0];
    (* preserve_syn_only *) reg [2:0] u0_m0_wo0_mtree_mult1_0_cma_ch [0:0];
    wire [15:0] u0_m0_wo0_mtree_mult1_0_cma_a0;
    wire [15:0] u0_m0_wo0_mtree_mult1_0_cma_b0;
    wire [2:0] u0_m0_wo0_mtree_mult1_0_cma_c0;
    wire [32:0] u0_m0_wo0_mtree_mult1_0_cma_s0;
    wire [32:0] u0_m0_wo0_mtree_mult1_0_cma_qq0;
    reg [32:0] u0_m0_wo0_mtree_mult1_0_cma_q;
    wire u0_m0_wo0_mtree_mult1_0_cma_ena0;
    wire u0_m0_wo0_mtree_mult1_0_cma_ena1;
    wire u0_m0_wo0_mtree_mult1_0_cma_ena2;
    wire [0:0] u0_m0_wo0_mtree_mult1_0_cma_mux_0_s;
    reg [15:0] u0_m0_wo0_mtree_mult1_0_cma_mux_0_q;
    wire d_xIn_0_15_mem_reset0;
    wire [15:0] d_xIn_0_15_mem_ia;
    wire [1:0] d_xIn_0_15_mem_aa;
    wire [1:0] d_xIn_0_15_mem_ab;
    wire [15:0] d_xIn_0_15_mem_iq;
    wire [15:0] d_xIn_0_15_mem_q;
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
    wire [0:0] u0_m0_wo0_wi0_r0_ra1_count1_run_q;
    wire [0:0] u0_m0_wo0_ca0_run_q;
    wire [0:0] u0_m0_wo0_oseq_gated_q;
    reg [4:0] u0_m0_wo0_wi0_r0_ra0_count1_lut_q;
    wire [3:0] u0_m0_wo0_wi0_r0_ra0_resize_in;
    wire [3:0] u0_m0_wo0_wi0_r0_ra0_resize_b;
    reg [5:0] u0_m0_wo0_wi0_r0_ra1_count1_lut_q;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // d_in0_m0_wi0_wo0_assign_id1_q_11(DELAY,75)@10 + 1
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
        reg [2:0] u0_m0_wo0_run_inc;
        if (areset)
        begin
            u0_m0_wo0_run_q <= $unsigned(1'b0);
            u0_m0_wo0_run_enable_c = 5'd14;
            u0_m0_wo0_run_enableQ <= $unsigned(1'b0);
            u0_m0_wo0_run_count <= $unsigned(3'b000);
            u0_m0_wo0_run_inc = 3'b0;
        end
        else
        begin
            if (u0_m0_wo0_run_out == 1'b1)
            begin
                if (u0_m0_wo0_run_enable_c[4] == 1'b1)
                begin
                    u0_m0_wo0_run_enable_c = $signed(u0_m0_wo0_run_enable_c) - $signed(-5'd15);
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

    // d_u0_m0_wo0_compute_q_20(DELAY,77)@13 + 7
    dspba_delay_ver #( .width(1), .depth(7), .reset_kind("SYNC"), .phase(4), .modulus(1024) )
    d_u0_m0_wo0_compute_q_20 ( .xin(u0_m0_wo0_compute_q), .xout(d_u0_m0_wo0_compute_q_20_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // d_u0_m0_wo0_compute_q_21(DELAY,78)@20 + 1
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

    // u0_m0_wo0_aseq(SEQUENCE,57)@21 + 1
    always @ (posedge clk)
    begin
        reg [6:0] u0_m0_wo0_aseq_c;
        if (areset)
        begin
            u0_m0_wo0_aseq_c = 7'b0000000;
            u0_m0_wo0_aseq_q <= $unsigned(1'b0);
            u0_m0_wo0_aseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m0_wo0_compute_q_21_q == 1'b1)
            begin
                if (u0_m0_wo0_aseq_c == 7'b1111101)
                begin
                    u0_m0_wo0_aseq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_aseq_eq <= 1'b0;
                end
                if (u0_m0_wo0_aseq_eq == 1'b1)
                begin
                    u0_m0_wo0_aseq_c = $signed(u0_m0_wo0_aseq_c) + $signed(7'd15);
                end
                else
                begin
                    u0_m0_wo0_aseq_c = $signed(u0_m0_wo0_aseq_c) - $signed(7'd1);
                end
                u0_m0_wo0_aseq_q <= $unsigned(u0_m0_wo0_aseq_c[6:6]);
            end
        end
    end

    // d_u0_m0_wo0_compute_q_22(DELAY,79)@21 + 1
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

    // u0_m0_wo0_adelay(DELAY,56)@22
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

    // u0_m0_wo0_ca0_inner(COUNTER,46)@16
    // low=-1, high=2, step=-1, init=2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_ca0_inner_i <= 3'd2;
        end
        else if (d_u0_m0_wo0_compute_fanout_reg0_q_16_q == 1'b1)
        begin
            if (u0_m0_wo0_ca0_inner_i[2:2] == 1'b1)
            begin
                u0_m0_wo0_ca0_inner_i <= $signed(u0_m0_wo0_ca0_inner_i) - $signed(-3'd3);
            end
            else
            begin
                u0_m0_wo0_ca0_inner_i <= $signed(u0_m0_wo0_ca0_inner_i) - $signed(3'd1);
            end
        end
    end
    assign u0_m0_wo0_ca0_inner_q = $unsigned(u0_m0_wo0_ca0_inner_i[2:0]);

    // u0_m0_wo0_ca0_run(LOGICAL,47)@16
    assign u0_m0_wo0_ca0_run_q = $unsigned(u0_m0_wo0_ca0_inner_q[2:2]);

    // u0_m0_wo0_compute_fanout_reg0(REG,70)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_compute_fanout_reg0_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m0_wo0_compute_fanout_reg0_q <= $unsigned(u0_m0_wo0_compute_q);
        end
    end

    // d_u0_m0_wo0_compute_fanout_reg0_q_16(DELAY,82)@14 + 2
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_compute_fanout_reg0_q_16_delay_0 <= $unsigned(u0_m0_wo0_compute_fanout_reg0_q);
            d_u0_m0_wo0_compute_fanout_reg0_q_16_q <= d_u0_m0_wo0_compute_fanout_reg0_q_16_delay_0;
        end
    end

    // u0_m0_wo0_ca0(COUNTER,48)@16
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_ca0_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_fanout_reg0_q_16_q == 1'b1 & u0_m0_wo0_ca0_run_q == 1'b1)
        begin
            u0_m0_wo0_ca0_i <= $unsigned(u0_m0_wo0_ca0_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_ca0_q = u0_m0_wo0_ca0_i[1:0];

    // u0_m0_wo0_memread_fanout_reg0(REG,68)@13 + 1
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
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count1_i <= 3'd0;
        end
        else if (u0_m0_wo0_memread_fanout_reg0_q == 1'b1 & u0_m0_wo0_wi0_r0_ra0_count1_run_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra0_count1_i <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count1_i) + $unsigned(3'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_count1_q = u0_m0_wo0_wi0_r0_ra0_count1_i[2:0];

    // u0_m0_wo0_wi0_r0_ra0_count1_lut(LOOKUP,22)@14
    always @(u0_m0_wo0_wi0_r0_ra0_count1_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra0_count1_q)
            3'b000 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b00100;
            3'b001 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b01000;
            3'b010 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b01100;
            3'b011 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b00000;
            3'b100 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b01100;
            3'b101 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b00000;
            3'b110 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b00100;
            3'b111 : u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'b01000;
            default : begin
                          // unreachable
                          u0_m0_wo0_wi0_r0_ra0_count1_lut_q = 5'bxxxxx;
                      end
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
    assign u0_m0_wo0_wi0_r0_ra0_add_0_0_a = {3'b000, u0_m0_wo0_wi0_r0_ra0_count0_q};
    assign u0_m0_wo0_wi0_r0_ra0_add_0_0_b = {1'b0, u0_m0_wo0_wi0_r0_ra0_count1_lutreg_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_ra0_add_0_0_o <= $unsigned(u0_m0_wo0_wi0_r0_ra0_add_0_0_a) + $unsigned(u0_m0_wo0_wi0_r0_ra0_add_0_0_b);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_add_0_0_q = u0_m0_wo0_wi0_r0_ra0_add_0_0_o[5:0];

    // u0_m0_wo0_wi0_r0_ra0_resize(BITSELECT,28)@15
    assign u0_m0_wo0_wi0_r0_ra0_resize_in = $unsigned(u0_m0_wo0_wi0_r0_ra0_add_0_0_q[3:0]);
    assign u0_m0_wo0_wi0_r0_ra0_resize_b = $unsigned(u0_m0_wo0_wi0_r0_ra0_resize_in[3:0]);

    // u0_m0_wo0_wi0_r0_readReg0(DELAY,42)@15
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

    // d_xIn_0_15_offset(CONSTANT,85)
    assign d_xIn_0_15_offset_q = $unsigned(2'b10);

    // d_xIn_0_15_rdcnt(ADD,86)@10 + 1
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

    // d_xIn_0_15_wraddr(COUNTER,84)@10 + 1
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

    // d_xIn_0_15_mem(DUALMEM,83)@10 + 2
    assign d_xIn_0_15_mem_ia = $unsigned(xIn_0);
    assign d_xIn_0_15_mem_aa = d_xIn_0_15_wraddr_q;
    assign d_xIn_0_15_mem_ab = d_xIn_0_15_rdcnt_q[1:0];
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
    assign d_xIn_0_15_mem_q = d_xIn_0_15_mem_iq[15:0];

    // d_in0_m0_wi0_wo0_assign_id1_q_15(DELAY,76)@11 + 4
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

    // u0_m0_wo0_wi0_r0_wa0(COUNTER,38)@15
    // low=0, high=15, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa0_i <= 4'd0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_15_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_wa0_i <= $unsigned(u0_m0_wo0_wi0_r0_wa0_i) + $unsigned(4'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_wa0_q = u0_m0_wo0_wi0_r0_wa0_i[3:0];

    // u0_m0_wo0_wi0_r0_memr0(DUALMEM,40)@15
    assign u0_m0_wo0_wi0_r0_memr0_ia = $unsigned(d_xIn_0_15_mem_q);
    assign u0_m0_wo0_wi0_r0_memr0_aa = u0_m0_wo0_wi0_r0_wa0_q;
    assign u0_m0_wo0_wi0_r0_memr0_ab = u0_m0_wo0_wi0_r0_readReg0_q;
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
    assign u0_m0_wo0_wi0_r0_memr0_q = u0_m0_wo0_wi0_r0_memr0_iq[15:0];

    // d_u0_m0_wo0_wi0_r0_outReg0_q_16(DELAY,80)@15 + 1
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

    // u0_m0_wo0_memread_fanout_reg1(REG,69)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_memread_fanout_reg1_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m0_wo0_memread_fanout_reg1_q <= $unsigned(u0_m0_wo0_memread_q);
        end
    end

    // u0_m0_wo0_wi0_r0_ra1_count1_inner(COUNTER,32)@14
    // low=-1, high=2, step=-1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra1_count1_inner_i <= 3'd1;
        end
        else if (u0_m0_wo0_memread_fanout_reg1_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra1_count1_inner_i[2:2] == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra1_count1_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra1_count1_inner_i) - $signed(-3'd3);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra1_count1_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra1_count1_inner_i) - $signed(3'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra1_count1_inner_q = $unsigned(u0_m0_wo0_wi0_r0_ra1_count1_inner_i[2:0]);

    // u0_m0_wo0_wi0_r0_ra1_count1_run(LOGICAL,33)@14
    assign u0_m0_wo0_wi0_r0_ra1_count1_run_q = $unsigned(u0_m0_wo0_wi0_r0_ra1_count1_inner_q[2:2]);

    // u0_m0_wo0_wi0_r0_ra1_count1(COUNTER,34)@14
    // low=0, high=11, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra1_count1_i <= 4'd0;
            u0_m0_wo0_wi0_r0_ra1_count1_eq <= 1'b0;
        end
        else if (u0_m0_wo0_memread_fanout_reg1_q == 1'b1 & u0_m0_wo0_wi0_r0_ra1_count1_run_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra1_count1_i == 4'd10)
            begin
                u0_m0_wo0_wi0_r0_ra1_count1_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra1_count1_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_ra1_count1_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra1_count1_i <= $unsigned(u0_m0_wo0_wi0_r0_ra1_count1_i) + $unsigned(4'd5);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra1_count1_i <= $unsigned(u0_m0_wo0_wi0_r0_ra1_count1_i) + $unsigned(4'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra1_count1_q = u0_m0_wo0_wi0_r0_ra1_count1_i[3:0];

    // u0_m0_wo0_wi0_r0_ra1_count1_lut(LOOKUP,30)@14
    always @(u0_m0_wo0_wi0_r0_ra1_count1_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra1_count1_q)
            4'b0000 : u0_m0_wo0_wi0_r0_ra1_count1_lut_q = 6'b000000;
            4'b0001 : u0_m0_wo0_wi0_r0_ra1_count1_lut_q = 6'b010000;
            4'b0010 : u0_m0_wo0_wi0_r0_ra1_count1_lut_q = 6'b001100;
            4'b0011 : u0_m0_wo0_wi0_r0_ra1_count1_lut_q = 6'b001000;
            4'b0100 : u0_m0_wo0_wi0_r0_ra1_count1_lut_q = 6'b001000;
            4'b0101 : u0_m0_wo0_wi0_r0_ra1_count1_lut_q = 6'b000000;
            4'b0110 : u0_m0_wo0_wi0_r0_ra1_count1_lut_q = 6'b010100;
            4'b0111 : u0_m0_wo0_wi0_r0_ra1_count1_lut_q = 6'b010000;
            4'b1000 : u0_m0_wo0_wi0_r0_ra1_count1_lut_q = 6'b010000;
            4'b1001 : u0_m0_wo0_wi0_r0_ra1_count1_lut_q = 6'b001000;
            4'b1010 : u0_m0_wo0_wi0_r0_ra1_count1_lut_q = 6'b000100;
            4'b1011 : u0_m0_wo0_wi0_r0_ra1_count1_lut_q = 6'b000000;
            default : u0_m0_wo0_wi0_r0_ra1_count1_lut_q = 6'b000000;
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_ra1_count1_lutreg(REG,31)@14
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra1_count1_lutreg_q <= $unsigned(6'b000000);
        end
        else if (u0_m0_wo0_memread_fanout_reg1_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra1_count1_lutreg_q <= $unsigned(u0_m0_wo0_wi0_r0_ra1_count1_lut_q);
        end
    end

    // u0_m0_wo0_wi0_r0_ra1_count0(COUNTER,29)@14
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra1_count0_i <= 2'd0;
        end
        else if (u0_m0_wo0_memread_fanout_reg1_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra1_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra1_count0_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra1_count0_q = {1'b0, u0_m0_wo0_wi0_r0_ra1_count0_i[1:0]};

    // u0_m0_wo0_wi0_r0_ra1_add_0_0(ADD,35)@14 + 1
    assign u0_m0_wo0_wi0_r0_ra1_add_0_0_a = $unsigned({{4{u0_m0_wo0_wi0_r0_ra1_count0_q[2]}}, u0_m0_wo0_wi0_r0_ra1_count0_q});
    assign u0_m0_wo0_wi0_r0_ra1_add_0_0_b = $unsigned({{1{u0_m0_wo0_wi0_r0_ra1_count1_lutreg_q[5]}}, u0_m0_wo0_wi0_r0_ra1_count1_lutreg_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_ra1_add_0_0_o <= $unsigned($signed(u0_m0_wo0_wi0_r0_ra1_add_0_0_a) + $signed(u0_m0_wo0_wi0_r0_ra1_add_0_0_b));
        end
    end
    assign u0_m0_wo0_wi0_r0_ra1_add_0_0_q = u0_m0_wo0_wi0_r0_ra1_add_0_0_o[6:0];

    // u0_m0_wo0_wi0_r0_readReg1(DELAY,45)@15
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_readReg1_q <= u0_m0_wo0_wi0_r0_ra1_add_0_0_q;
        end
    end

    // u0_m0_wo0_compute_fanout_reg1(REG,71)@13 + 1
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

    // u0_m0_wo0_wi0_r0_we1_seq(SEQUENCE,37)@14 + 1
    always @ (posedge clk)
    begin
        reg [6:0] u0_m0_wo0_wi0_r0_we1_seq_c;
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_we1_seq_c = 7'b0000000;
            u0_m0_wo0_wi0_r0_we1_seq_q <= $unsigned(1'b0);
            u0_m0_wo0_wi0_r0_we1_seq_eq <= 1'b0;
        end
        else
        begin
            if (u0_m0_wo0_compute_fanout_reg1_q == 1'b1)
            begin
                if (u0_m0_wo0_wi0_r0_we1_seq_c == 7'b1111001)
                begin
                    u0_m0_wo0_wi0_r0_we1_seq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_wi0_r0_we1_seq_eq <= 1'b0;
                end
                if (u0_m0_wo0_wi0_r0_we1_seq_eq == 1'b1)
                begin
                    u0_m0_wo0_wi0_r0_we1_seq_c = $signed(u0_m0_wo0_wi0_r0_we1_seq_c) + $signed(7'd15);
                end
                else
                begin
                    u0_m0_wo0_wi0_r0_we1_seq_c = $signed(u0_m0_wo0_wi0_r0_we1_seq_c) - $signed(7'd1);
                end
                u0_m0_wo0_wi0_r0_we1_seq_q <= $unsigned(u0_m0_wo0_wi0_r0_we1_seq_c[6:6]);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_we1_seq_q <= $unsigned(1'b0);
            end
        end
    end

    // u0_m0_wo0_wi0_r0_wa1(COUNTER,39)@15
    // low=0, high=23, step=1, init=20
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa1_i <= 5'd20;
            u0_m0_wo0_wi0_r0_wa1_eq <= 1'b0;
        end
        else if (u0_m0_wo0_wi0_r0_we1_seq_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_wa1_i == 5'd22)
            begin
                u0_m0_wo0_wi0_r0_wa1_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_wa1_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_wa1_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_wa1_i <= $unsigned(u0_m0_wo0_wi0_r0_wa1_i) + $unsigned(5'd9);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_wa1_i <= $unsigned(u0_m0_wo0_wi0_r0_wa1_i) + $unsigned(5'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_wa1_q = u0_m0_wo0_wi0_r0_wa1_i[4:0];

    // u0_m0_wo0_wi0_r0_memr1(DUALMEM,43)@15
    assign u0_m0_wo0_wi0_r0_memr1_ia = $unsigned(u0_m0_wo0_wi0_r0_memr0_q);
    assign u0_m0_wo0_wi0_r0_memr1_aa = u0_m0_wo0_wi0_r0_wa1_q;
    assign u0_m0_wo0_wi0_r0_memr1_ab = u0_m0_wo0_wi0_r0_readReg1_q[4:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(5),
        .numwords_a(24),
        .width_b(16),
        .widthad_b(5),
        .numwords_b(24),
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
    ) u0_m0_wo0_wi0_r0_memr1_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_wi0_r0_memr1_aa),
        .data_a(u0_m0_wo0_wi0_r0_memr1_ia),
        .wren_a(u0_m0_wo0_wi0_r0_we1_seq_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_memr1_ab),
        .q_b(u0_m0_wo0_wi0_r0_memr1_iq),
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
    assign u0_m0_wo0_wi0_r0_memr1_q = u0_m0_wo0_wi0_r0_memr1_iq[15:0];

    // u0_m0_wo0_symSuppress_0_seq(SEQUENCE,53)@14 + 1
    always @ (posedge clk)
    begin
        reg [6:0] u0_m0_wo0_symSuppress_0_seq_c;
        if (areset)
        begin
            u0_m0_wo0_symSuppress_0_seq_c = 7'b0000000;
            u0_m0_wo0_symSuppress_0_seq_q <= $unsigned(1'b0);
            u0_m0_wo0_symSuppress_0_seq_eq <= 1'b0;
        end
        else
        begin
            if (u0_m0_wo0_compute_fanout_reg0_q == 1'b1)
            begin
                if (u0_m0_wo0_symSuppress_0_seq_c == 7'b1111101)
                begin
                    u0_m0_wo0_symSuppress_0_seq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_symSuppress_0_seq_eq <= 1'b0;
                end
                if (u0_m0_wo0_symSuppress_0_seq_eq == 1'b1)
                begin
                    u0_m0_wo0_symSuppress_0_seq_c = $signed(u0_m0_wo0_symSuppress_0_seq_c) + $signed(7'd15);
                end
                else
                begin
                    u0_m0_wo0_symSuppress_0_seq_c = $signed(u0_m0_wo0_symSuppress_0_seq_c) - $signed(7'd1);
                end
                u0_m0_wo0_symSuppress_0_seq_q <= $unsigned(u0_m0_wo0_symSuppress_0_seq_c[6:6]);
            end
        end
    end

    // u0_m0_wo0_mtree_mult1_0_cma_mux_0(MUX,73)@15 + 1
    assign u0_m0_wo0_mtree_mult1_0_cma_mux_0_s = u0_m0_wo0_symSuppress_0_seq_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (u0_m0_wo0_mtree_mult1_0_cma_mux_0_s)
                1'b0 : u0_m0_wo0_mtree_mult1_0_cma_mux_0_q <= u0_m0_wo0_wi0_r0_memr1_q;
                1'b1 : u0_m0_wo0_mtree_mult1_0_cma_mux_0_q <= {{15{GND_q[0]}}, GND_q};
                default : u0_m0_wo0_mtree_mult1_0_cma_mux_0_q <= 16'b0;
            endcase
        end
    end

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // u0_m0_wo0_mtree_mult1_0_cma(CHAINMULTADD,72)@17 + 5
    assign u0_m0_wo0_mtree_mult1_0_cma_reset = areset;
    assign u0_m0_wo0_mtree_mult1_0_cma_ena0 = 1'b1;
    assign u0_m0_wo0_mtree_mult1_0_cma_ena1 = u0_m0_wo0_mtree_mult1_0_cma_ena0;
    assign u0_m0_wo0_mtree_mult1_0_cma_ena2 = u0_m0_wo0_mtree_mult1_0_cma_ena0;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_mtree_mult1_0_cma_ah[0] <= u0_m0_wo0_mtree_mult1_0_cma_mux_0_q;
            u0_m0_wo0_mtree_mult1_0_cma_bh[0] <= d_u0_m0_wo0_wi0_r0_outReg0_q_16_q;
            u0_m0_wo0_mtree_mult1_0_cma_ch[0] <= {1'b0, u0_m0_wo0_ca0_q[1:0]};
        end
    end

    assign u0_m0_wo0_mtree_mult1_0_cma_a0 = $unsigned(u0_m0_wo0_mtree_mult1_0_cma_ah[0]);
    assign u0_m0_wo0_mtree_mult1_0_cma_b0 = $unsigned(u0_m0_wo0_mtree_mult1_0_cma_bh[0]);
    assign u0_m0_wo0_mtree_mult1_0_cma_c0 = u0_m0_wo0_mtree_mult1_0_cma_ch[0];
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .operand_source_may("preadder"),
        .az_clken("0"),
        .az_width(16),
        .operand_source_max("coef"),
        .coef_sel_a_clken("0"),
        .coef_a_0(4204),
        .coef_a_1(3495),
        .coef_a_2(1928),
        .coef_a_3(581),
        .signed_may("true"),
        .signed_max("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(33)
    ) u0_m0_wo0_mtree_mult1_0_cma_DSP0 (
        .clk(clk),
        .ena({ u0_m0_wo0_mtree_mult1_0_cma_ena2, u0_m0_wo0_mtree_mult1_0_cma_ena1, u0_m0_wo0_mtree_mult1_0_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(u0_m0_wo0_mtree_mult1_0_cma_a0),
        .az(u0_m0_wo0_mtree_mult1_0_cma_b0),
        .coefsela(u0_m0_wo0_mtree_mult1_0_cma_c0),
        .resulta(u0_m0_wo0_mtree_mult1_0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .ax(),
        .bx(),
        .by(),
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
    dspba_delay_ver #( .width(33), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    u0_m0_wo0_mtree_mult1_0_cma_delay0 ( .xin(u0_m0_wo0_mtree_mult1_0_cma_s0), .xout(u0_m0_wo0_mtree_mult1_0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_m0_wo0_mtree_mult1_0_cma_q = $unsigned(u0_m0_wo0_mtree_mult1_0_cma_qq0[32:0]);

    // u0_m0_wo0_accum(ADD,58)@22 + 1
    assign u0_m0_wo0_accum_a = $unsigned({{2{u0_m0_wo0_mtree_mult1_0_cma_q[32]}}, u0_m0_wo0_mtree_mult1_0_cma_q});
    assign u0_m0_wo0_accum_b = $unsigned(u0_m0_wo0_adelay_q);
    assign u0_m0_wo0_accum_i = u0_m0_wo0_accum_a;
    assign u0_m0_wo0_accum_a1 = u0_m0_wo0_accum_i;
    assign u0_m0_wo0_accum_b1 = u0_m0_wo0_aseq_q == 1'b1 ? 35'b0 : u0_m0_wo0_accum_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_accum_o <= 35'b0;
        end
        else if (d_u0_m0_wo0_compute_q_22_q == 1'b1)
        begin
            u0_m0_wo0_accum_o <= $unsigned($signed(u0_m0_wo0_accum_a1) + $signed(u0_m0_wo0_accum_b1));
        end
    end
    assign u0_m0_wo0_accum_q = u0_m0_wo0_accum_o[34:0];

    // u0_m0_wo0_oseq(SEQUENCE,59)@20 + 1
    always @ (posedge clk)
    begin
        reg [6:0] u0_m0_wo0_oseq_c;
        if (areset)
        begin
            u0_m0_wo0_oseq_c = 7'b0001100;
            u0_m0_wo0_oseq_q <= $unsigned(1'b0);
            u0_m0_wo0_oseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m0_wo0_compute_q_20_q == 1'b1)
            begin
                if (u0_m0_wo0_oseq_c == 7'b1111101)
                begin
                    u0_m0_wo0_oseq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_oseq_eq <= 1'b0;
                end
                if (u0_m0_wo0_oseq_eq == 1'b1)
                begin
                    u0_m0_wo0_oseq_c = $signed(u0_m0_wo0_oseq_c) + $signed(7'd15);
                end
                else
                begin
                    u0_m0_wo0_oseq_c = $signed(u0_m0_wo0_oseq_c) - $signed(7'd1);
                end
                u0_m0_wo0_oseq_q <= $unsigned(u0_m0_wo0_oseq_c[6:6]);
            end
        end
    end

    // u0_m0_wo0_oseq_gated(LOGICAL,60)@21
    assign u0_m0_wo0_oseq_gated_q = u0_m0_wo0_oseq_q & d_u0_m0_wo0_compute_q_21_q;

    // u0_m0_wo0_oseq_gated_reg(REG,61)@21 + 1
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

    // outchan(COUNTER,66)@22 + 1
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

    // d_out0_m0_wo0_assign_id3_q_23(DELAY,81)@22 + 1
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

    // xOut(PORTOUT,67)@23 + 1
    assign xOut_v = d_out0_m0_wo0_assign_id3_q_23_q;
    assign xOut_c = {5'b00000, outchan_q};
    assign xOut_0 = u0_m0_wo0_accum_q;

endmodule
