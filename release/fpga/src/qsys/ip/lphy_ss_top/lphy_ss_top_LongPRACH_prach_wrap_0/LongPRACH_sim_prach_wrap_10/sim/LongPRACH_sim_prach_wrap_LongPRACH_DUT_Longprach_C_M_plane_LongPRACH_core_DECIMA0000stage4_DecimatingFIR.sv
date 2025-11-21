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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_stage4_Filt_DEC_by_2_stage4_DecimatingFIR
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000stage4_DecimatingFIR (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [15:0] xIn_0,
    output wire [0:0] xOut_v,
    output wire [7:0] xOut_c,
    output wire [35:0] xOut_0,
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
    reg [0:0] u0_m0_wo0_compute_q;
    reg [0:0] u0_m0_wo0_compute_delay_0;
    reg [0:0] u0_m0_wo0_compute_delay_1;
    reg [0:0] d_u0_m0_wo0_compute_q_18_q;
    reg [0:0] d_u0_m0_wo0_compute_q_18_delay_0;
    reg [0:0] d_u0_m0_wo0_compute_q_18_delay_1;
    reg [0:0] d_u0_m0_wo0_compute_q_18_delay_2;
    reg [0:0] d_u0_m0_wo0_compute_q_18_delay_3;
    reg [0:0] d_u0_m0_wo0_compute_q_19_q;
    reg [0:0] d_u0_m0_wo0_compute_q_20_q;
    wire [6:0] u0_m0_wo0_wi0_r0_ra0_count0_inner_q;
    (* preserve_syn_only *) reg signed [6:0] u0_m0_wo0_wi0_r0_ra0_count0_inner_i;
    wire [6:0] u0_m0_wo0_wi0_r0_ra0_count0_q;
    (* preserve_syn_only *) reg [5:0] u0_m0_wo0_wi0_r0_ra0_count0_i;
    wire [2:0] u0_m0_wo0_wi0_r0_ra0_count1_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_ra0_count1_i;
    reg [6:0] u0_m0_wo0_wi0_r0_ra0_count2_lutreg_q;
    wire [2:0] u0_m0_wo0_wi0_r0_ra0_count2_inner_q;
    (* preserve_syn_only *) reg signed [2:0] u0_m0_wo0_wi0_r0_ra0_count2_inner_i;
    wire [3:0] u0_m0_wo0_wi0_r0_ra0_count2_q;
    (* preserve_syn_only *) reg [3:0] u0_m0_wo0_wi0_r0_ra0_count2_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_ra0_count2_eq;
    wire [8:0] u0_m0_wo0_wi0_r0_ra0_add_1_0_a;
    wire [8:0] u0_m0_wo0_wi0_r0_ra0_add_1_0_b;
    logic [8:0] u0_m0_wo0_wi0_r0_ra0_add_1_0_o;
    wire [8:0] u0_m0_wo0_wi0_r0_ra0_add_1_0_q;
    wire [5:0] u0_m0_wo0_wi0_r0_wa0_q;
    (* preserve_syn_only *) reg [5:0] u0_m0_wo0_wi0_r0_wa0_i;
    wire u0_m0_wo0_wi0_r0_memr0_reset0;
    wire [15:0] u0_m0_wo0_wi0_r0_memr0_ia;
    wire [5:0] u0_m0_wo0_wi0_r0_memr0_aa;
    wire [5:0] u0_m0_wo0_wi0_r0_memr0_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_memr0_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_memr0_q;
    reg [5:0] u0_m0_wo0_wi0_r0_readReg0_q;
    wire [2:0] u0_m0_wo0_ca0_inner_q;
    (* preserve_syn_only *) reg signed [2:0] u0_m0_wo0_ca0_inner_i;
    wire [3:0] u0_m0_wo0_ca0_q;
    (* preserve_syn_only *) reg [3:0] u0_m0_wo0_ca0_i;
    (* preserve_syn_only *) reg u0_m0_wo0_ca0_eq;
    reg [15:0] u0_m0_wo0_cm0_q;
    reg [35:0] u0_m0_wo0_adelay_q;
    reg [35:0] u0_m0_wo0_adelay_delay_0;
    reg [35:0] u0_m0_wo0_adelay_delay_1;
    reg [0:0] u0_m0_wo0_aseq_q;
    reg u0_m0_wo0_aseq_eq;
    wire [35:0] u0_m0_wo0_accum_a;
    wire [35:0] u0_m0_wo0_accum_b;
    wire [35:0] u0_m0_wo0_accum_i;
    wire [35:0] u0_m0_wo0_accum_a1;
    wire [35:0] u0_m0_wo0_accum_b1;
    logic [35:0] u0_m0_wo0_accum_o;
    wire [35:0] u0_m0_wo0_accum_q;
    reg [0:0] u0_m0_wo0_oseq_q;
    reg u0_m0_wo0_oseq_eq;
    reg [0:0] u0_m0_wo0_oseq_gated_reg_q;
    reg [0:0] d_out0_m0_wo0_assign_id3_q_21_q;
    wire [2:0] outchan_q;
    (* preserve_syn_only *) reg [1:0] outchan_i;
    wire u0_m0_wo0_mtree_mult1_0_cma_reset;
    (* preserve_syn_only *) reg signed [15:0] u0_m0_wo0_mtree_mult1_0_cma_ah [0:0];
    (* preserve_syn_only *) reg signed [15:0] u0_m0_wo0_mtree_mult1_0_cma_ch [0:0];
    wire [15:0] u0_m0_wo0_mtree_mult1_0_cma_a0;
    wire [15:0] u0_m0_wo0_mtree_mult1_0_cma_c0;
    wire [31:0] u0_m0_wo0_mtree_mult1_0_cma_s0;
    wire [31:0] u0_m0_wo0_mtree_mult1_0_cma_qq0;
    reg [31:0] u0_m0_wo0_mtree_mult1_0_cma_q;
    wire u0_m0_wo0_mtree_mult1_0_cma_ena0;
    wire u0_m0_wo0_mtree_mult1_0_cma_ena1;
    wire u0_m0_wo0_mtree_mult1_0_cma_ena2;
    wire d_xIn_0_14_mem_reset0;
    wire [15:0] d_xIn_0_14_mem_ia;
    wire [1:0] d_xIn_0_14_mem_aa;
    wire [1:0] d_xIn_0_14_mem_ab;
    wire [15:0] d_xIn_0_14_mem_iq;
    wire [15:0] d_xIn_0_14_mem_q;
    wire [1:0] d_xIn_0_14_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] d_xIn_0_14_wraddr_i = 2'b11;
    wire [1:0] d_xIn_0_14_offset_q;
    wire [2:0] d_xIn_0_14_rdcnt_a;
    wire [2:0] d_xIn_0_14_rdcnt_b;
    logic [2:0] d_xIn_0_14_rdcnt_o;
    wire [2:0] d_xIn_0_14_rdcnt_q;
    wire [0:0] u0_m0_wo0_inputframe_q;
    wire [0:0] u0_m0_wo0_wi0_r0_ra0_count0_run_q;
    wire [0:0] u0_m0_wo0_wi0_r0_ra0_count2_run_q;
    wire [0:0] u0_m0_wo0_ca0_run_q;
    wire [0:0] u0_m0_wo0_oseq_gated_q;
    wire [7:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_a_in;
    wire [2:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_a_b;
    wire [7:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_b_in;
    wire [1:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_b_b;
    reg [6:0] u0_m0_wo0_wi0_r0_ra0_count2_lut_q;
    wire [5:0] u0_m0_wo0_wi0_r0_ra0_resize_in;
    wire [5:0] u0_m0_wo0_wi0_r0_ra0_resize_b;
    wire [7:0] u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_join_q;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // d_in0_m0_wi0_wo0_assign_id1_q_11(DELAY,63)@10 + 1
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
        reg [6:0] u0_m0_wo0_run_enable_c;
        reg [2:0] u0_m0_wo0_run_inc;
        if (areset)
        begin
            u0_m0_wo0_run_q <= $unsigned(1'b0);
            u0_m0_wo0_run_enable_c = 7'd42;
            u0_m0_wo0_run_enableQ <= $unsigned(1'b0);
            u0_m0_wo0_run_count <= $unsigned(3'b000);
            u0_m0_wo0_run_inc = 3'b0;
        end
        else
        begin
            if (u0_m0_wo0_run_out == 1'b1)
            begin
                if (u0_m0_wo0_run_enable_c[6] == 1'b1)
                begin
                    u0_m0_wo0_run_enable_c = $signed(u0_m0_wo0_run_enable_c) - $signed(-7'd43);
                end
                else
                begin
                    u0_m0_wo0_run_enable_c = $signed(u0_m0_wo0_run_enable_c) + $signed(-7'd1);
                end
                u0_m0_wo0_run_enableQ <= $unsigned(u0_m0_wo0_run_enable_c[6:6]);
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

    // d_u0_m0_wo0_compute_q_18(DELAY,65)@13 + 5
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_compute_q_18_delay_0 <= $unsigned(u0_m0_wo0_compute_q);
            d_u0_m0_wo0_compute_q_18_delay_1 <= d_u0_m0_wo0_compute_q_18_delay_0;
            d_u0_m0_wo0_compute_q_18_delay_2 <= d_u0_m0_wo0_compute_q_18_delay_1;
            d_u0_m0_wo0_compute_q_18_delay_3 <= d_u0_m0_wo0_compute_q_18_delay_2;
            d_u0_m0_wo0_compute_q_18_q <= d_u0_m0_wo0_compute_q_18_delay_3;
        end
    end

    // d_u0_m0_wo0_compute_q_19(DELAY,66)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m0_wo0_compute_q_19_q <= '0;
        end
        else
        begin
            d_u0_m0_wo0_compute_q_19_q <= $unsigned(d_u0_m0_wo0_compute_q_18_q);
        end
    end

    // u0_m0_wo0_aseq(SEQUENCE,46)@19 + 1
    always @ (posedge clk)
    begin
        reg [7:0] u0_m0_wo0_aseq_c;
        if (areset)
        begin
            u0_m0_wo0_aseq_c = 8'b00000000;
            u0_m0_wo0_aseq_q <= $unsigned(1'b0);
            u0_m0_wo0_aseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m0_wo0_compute_q_19_q == 1'b1)
            begin
                if (u0_m0_wo0_aseq_c == 8'b11111101)
                begin
                    u0_m0_wo0_aseq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_aseq_eq <= 1'b0;
                end
                if (u0_m0_wo0_aseq_eq == 1'b1)
                begin
                    u0_m0_wo0_aseq_c = $signed(u0_m0_wo0_aseq_c) + $signed(8'd43);
                end
                else
                begin
                    u0_m0_wo0_aseq_c = $signed(u0_m0_wo0_aseq_c) - $signed(8'd1);
                end
                u0_m0_wo0_aseq_q <= $unsigned(u0_m0_wo0_aseq_c[7:7]);
            end
        end
    end

    // d_u0_m0_wo0_compute_q_20(DELAY,67)@19 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m0_wo0_compute_q_20_q <= '0;
        end
        else
        begin
            d_u0_m0_wo0_compute_q_20_q <= $unsigned(d_u0_m0_wo0_compute_q_19_q);
        end
    end

    // u0_m0_wo0_adelay(DELAY,45)@20
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else if (d_u0_m0_wo0_compute_q_20_q == 1'b1)
        begin
            u0_m0_wo0_adelay_delay_0 <= $unsigned(u0_m0_wo0_accum_q);
            u0_m0_wo0_adelay_delay_1 <= u0_m0_wo0_adelay_delay_0;
            u0_m0_wo0_adelay_q <= u0_m0_wo0_adelay_delay_1;
        end
    end

    // u0_m0_wo0_ca0_inner(COUNTER,37)@13
    // low=-1, high=2, step=-1, init=2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_ca0_inner_i <= 3'd2;
        end
        else if (u0_m0_wo0_compute_q == 1'b1)
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

    // u0_m0_wo0_ca0_run(LOGICAL,38)@13
    assign u0_m0_wo0_ca0_run_q = $unsigned(u0_m0_wo0_ca0_inner_q[2:2]);

    // u0_m0_wo0_ca0(COUNTER,39)@13
    // low=0, high=10, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_ca0_i <= 4'd0;
            u0_m0_wo0_ca0_eq <= 1'b0;
        end
        else if (u0_m0_wo0_compute_q == 1'b1 & u0_m0_wo0_ca0_run_q == 1'b1)
        begin
            if (u0_m0_wo0_ca0_i == 4'd9)
            begin
                u0_m0_wo0_ca0_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_ca0_eq <= 1'b0;
            end
            if (u0_m0_wo0_ca0_eq == 1'b1)
            begin
                u0_m0_wo0_ca0_i <= $unsigned(u0_m0_wo0_ca0_i) + $unsigned(4'd6);
            end
            else
            begin
                u0_m0_wo0_ca0_i <= $unsigned(u0_m0_wo0_ca0_i) + $unsigned(4'd1);
            end
        end
    end
    assign u0_m0_wo0_ca0_q = u0_m0_wo0_ca0_i[3:0];

    // u0_m0_wo0_cm0(LOOKUP,43)@13 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (u0_m0_wo0_ca0_q)
                4'b0000 : u0_m0_wo0_cm0_q <= 16'b1111111100001100;
                4'b0001 : u0_m0_wo0_cm0_q <= 16'b1111111001101000;
                4'b0010 : u0_m0_wo0_cm0_q <= 16'b0000000011011100;
                4'b0011 : u0_m0_wo0_cm0_q <= 16'b0000011111011110;
                4'b0100 : u0_m0_wo0_cm0_q <= 16'b0001000001010000;
                4'b0101 : u0_m0_wo0_cm0_q <= 16'b0001010000101010;
                4'b0110 : u0_m0_wo0_cm0_q <= 16'b0001000001010000;
                4'b0111 : u0_m0_wo0_cm0_q <= 16'b0000011111011110;
                4'b1000 : u0_m0_wo0_cm0_q <= 16'b0000000011011100;
                4'b1001 : u0_m0_wo0_cm0_q <= 16'b1111111001101000;
                4'b1010 : u0_m0_wo0_cm0_q <= 16'b1111111100001100;
                default : u0_m0_wo0_cm0_q <= 16'b1111111100001100;
            endcase
        end
    end

    // u0_m0_wo0_wi0_r0_ra0_count2_inner(COUNTER,27)@13
    // low=-1, high=2, step=-1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count2_inner_i <= 3'd1;
        end
        else if (u0_m0_wo0_memread_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra0_count2_inner_i[2:2] == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra0_count2_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra0_count2_inner_i) - $signed(-3'd3);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra0_count2_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra0_count2_inner_i) - $signed(3'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_count2_inner_q = $unsigned(u0_m0_wo0_wi0_r0_ra0_count2_inner_i[2:0]);

    // u0_m0_wo0_wi0_r0_ra0_count2_run(LOGICAL,28)@13
    assign u0_m0_wo0_wi0_r0_ra0_count2_run_q = $unsigned(u0_m0_wo0_wi0_r0_ra0_count2_inner_q[2:2]);

    // u0_m0_wo0_wi0_r0_ra0_count2(COUNTER,29)@13
    // low=0, high=10, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count2_i <= 4'd0;
            u0_m0_wo0_wi0_r0_ra0_count2_eq <= 1'b0;
        end
        else if (u0_m0_wo0_memread_q == 1'b1 & u0_m0_wo0_wi0_r0_ra0_count2_run_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra0_count2_i == 4'd9)
            begin
                u0_m0_wo0_wi0_r0_ra0_count2_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra0_count2_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_ra0_count2_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra0_count2_i <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count2_i) + $unsigned(4'd6);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra0_count2_i <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count2_i) + $unsigned(4'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_count2_q = u0_m0_wo0_wi0_r0_ra0_count2_i[3:0];

    // u0_m0_wo0_wi0_r0_ra0_count2_lut(LOOKUP,25)@13
    always @(u0_m0_wo0_wi0_r0_ra0_count2_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra0_count2_q)
            4'b0000 : u0_m0_wo0_wi0_r0_ra0_count2_lut_q = 7'b0110000;
            4'b0001 : u0_m0_wo0_wi0_r0_ra0_count2_lut_q = 7'b0110100;
            4'b0010 : u0_m0_wo0_wi0_r0_ra0_count2_lut_q = 7'b0111000;
            4'b0011 : u0_m0_wo0_wi0_r0_ra0_count2_lut_q = 7'b0111100;
            4'b0100 : u0_m0_wo0_wi0_r0_ra0_count2_lut_q = 7'b0000000;
            4'b0101 : u0_m0_wo0_wi0_r0_ra0_count2_lut_q = 7'b0000100;
            4'b0110 : u0_m0_wo0_wi0_r0_ra0_count2_lut_q = 7'b0001000;
            4'b0111 : u0_m0_wo0_wi0_r0_ra0_count2_lut_q = 7'b0001100;
            4'b1000 : u0_m0_wo0_wi0_r0_ra0_count2_lut_q = 7'b0010000;
            4'b1001 : u0_m0_wo0_wi0_r0_ra0_count2_lut_q = 7'b0010100;
            4'b1010 : u0_m0_wo0_wi0_r0_ra0_count2_lut_q = 7'b0011000;
            default : u0_m0_wo0_wi0_r0_ra0_count2_lut_q = 7'b0110000;
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_ra0_count2_lutreg(REG,26)@13
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count2_lutreg_q <= $unsigned(7'b0110000);
        end
        else if (u0_m0_wo0_memread_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra0_count2_lutreg_q <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count2_lut_q);
        end
    end

    // u0_m0_wo0_wi0_r0_ra0_count0_inner(COUNTER,21)@13
    // low=-1, high=42, step=-1, init=42
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count0_inner_i <= 7'd42;
        end
        else if (u0_m0_wo0_memread_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra0_count0_inner_i[6:6] == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra0_count0_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra0_count0_inner_i) - $signed(-7'd43);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra0_count0_inner_i <= $signed(u0_m0_wo0_wi0_r0_ra0_count0_inner_i) - $signed(7'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_count0_inner_q = $unsigned(u0_m0_wo0_wi0_r0_ra0_count0_inner_i[6:0]);

    // u0_m0_wo0_wi0_r0_ra0_count0_run(LOGICAL,22)@13
    assign u0_m0_wo0_wi0_r0_ra0_count0_run_q = $unsigned(u0_m0_wo0_wi0_r0_ra0_count0_inner_q[6:6]);

    // u0_m0_wo0_wi0_r0_ra0_count0(COUNTER,23)@13
    // low=0, high=63, step=8, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count0_i <= 6'd0;
        end
        else if (u0_m0_wo0_memread_q == 1'b1 & u0_m0_wo0_wi0_r0_ra0_count0_run_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra0_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count0_i) + $unsigned(6'd8);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_count0_q = {1'b0, u0_m0_wo0_wi0_r0_ra0_count0_i[5:0]};

    // u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_a(BITSELECT,58)@13
    assign u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_a_in = {1'b0, u0_m0_wo0_wi0_r0_ra0_count0_q};
    assign u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_a_b = u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_a_in[5:3];

    // u0_m0_wo0_wi0_r0_ra0_count1(COUNTER,24)@13
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count1_i <= 2'd0;
        end
        else if (u0_m0_wo0_memread_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra0_count1_i <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count1_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_count1_q = {1'b0, u0_m0_wo0_wi0_r0_ra0_count1_i[1:0]};

    // u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_b(BITSELECT,59)@13
    assign u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_b_in = {5'b00000, u0_m0_wo0_wi0_r0_ra0_count1_q};
    assign u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_b_b = u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_b_in[1:0];

    // u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_join(BITJOIN,60)@13
    assign u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_join_q = {GND_q, GND_q, u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_a_b, GND_q, u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_b_b};

    // u0_m0_wo0_wi0_r0_ra0_add_1_0(ADD,31)@13 + 1
    assign u0_m0_wo0_wi0_r0_ra0_add_1_0_a = {1'b0, u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_join_q};
    assign u0_m0_wo0_wi0_r0_ra0_add_1_0_b = {2'b00, u0_m0_wo0_wi0_r0_ra0_count2_lutreg_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            u0_m0_wo0_wi0_r0_ra0_add_1_0_o <= $unsigned(u0_m0_wo0_wi0_r0_ra0_add_1_0_a) + $unsigned(u0_m0_wo0_wi0_r0_ra0_add_1_0_b);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_add_1_0_q = u0_m0_wo0_wi0_r0_ra0_add_1_0_o[8:0];

    // u0_m0_wo0_wi0_r0_ra0_resize(BITSELECT,32)@14
    assign u0_m0_wo0_wi0_r0_ra0_resize_in = $unsigned(u0_m0_wo0_wi0_r0_ra0_add_1_0_q[5:0]);
    assign u0_m0_wo0_wi0_r0_ra0_resize_b = $unsigned(u0_m0_wo0_wi0_r0_ra0_resize_in[5:0]);

    // u0_m0_wo0_wi0_r0_readReg0(DELAY,36)@14
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

    // d_xIn_0_14_offset(CONSTANT,71)
    assign d_xIn_0_14_offset_q = $unsigned(2'b11);

    // d_xIn_0_14_rdcnt(ADD,72)@10 + 1
    assign d_xIn_0_14_rdcnt_a = {1'b0, d_xIn_0_14_wraddr_q};
    assign d_xIn_0_14_rdcnt_b = {1'b0, d_xIn_0_14_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_xIn_0_14_rdcnt_o <= $unsigned(d_xIn_0_14_rdcnt_a) + $unsigned(d_xIn_0_14_rdcnt_b);
        end
    end
    assign d_xIn_0_14_rdcnt_q = d_xIn_0_14_rdcnt_o[2:0];

    // d_xIn_0_14_wraddr(COUNTER,70)@10 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_xIn_0_14_wraddr_i <= $unsigned(d_xIn_0_14_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign d_xIn_0_14_wraddr_q = d_xIn_0_14_wraddr_i[1:0];

    // d_xIn_0_14_mem(DUALMEM,69)@10 + 2
    assign d_xIn_0_14_mem_ia = $unsigned(xIn_0);
    assign d_xIn_0_14_mem_aa = d_xIn_0_14_wraddr_q;
    assign d_xIn_0_14_mem_ab = d_xIn_0_14_rdcnt_q[1:0];
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
    ) d_xIn_0_14_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(d_xIn_0_14_mem_aa),
        .data_a(d_xIn_0_14_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_xIn_0_14_mem_ab),
        .q_b(d_xIn_0_14_mem_iq),
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
    assign d_xIn_0_14_mem_q = d_xIn_0_14_mem_iq[15:0];

    // d_in0_m0_wi0_wo0_assign_id1_q_14(DELAY,64)@11 + 3
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

    // u0_m0_wo0_wi0_r0_wa0(COUNTER,33)@14
    // low=0, high=63, step=1, init=24
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa0_i <= 6'd24;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_14_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_wa0_i <= $unsigned(u0_m0_wo0_wi0_r0_wa0_i) + $unsigned(6'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_wa0_q = u0_m0_wo0_wi0_r0_wa0_i[5:0];

    // u0_m0_wo0_wi0_r0_memr0(DUALMEM,34)@14
    assign u0_m0_wo0_wi0_r0_memr0_ia = $unsigned(d_xIn_0_14_mem_q);
    assign u0_m0_wo0_wi0_r0_memr0_aa = u0_m0_wo0_wi0_r0_wa0_q;
    assign u0_m0_wo0_wi0_r0_memr0_ab = u0_m0_wo0_wi0_r0_readReg0_q;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(6),
        .numwords_a(64),
        .width_b(16),
        .widthad_b(6),
        .numwords_b(64),
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

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // u0_m0_wo0_mtree_mult1_0_cma(CHAINMULTADD,61)@15 + 5
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
            u0_m0_wo0_mtree_mult1_0_cma_ah[0] <= u0_m0_wo0_wi0_r0_memr0_q;
            u0_m0_wo0_mtree_mult1_0_cma_ch[0] <= u0_m0_wo0_cm0_q;
        end
    end

    assign u0_m0_wo0_mtree_mult1_0_cma_a0 = $unsigned(u0_m0_wo0_mtree_mult1_0_cma_ah[0]);
    assign u0_m0_wo0_mtree_mult1_0_cma_c0 = $unsigned(u0_m0_wo0_mtree_mult1_0_cma_ch[0]);
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("true"),
        .signed_max("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) u0_m0_wo0_mtree_mult1_0_cma_DSP0 (
        .clk(clk),
        .ena({ u0_m0_wo0_mtree_mult1_0_cma_ena2, u0_m0_wo0_mtree_mult1_0_cma_ena1, u0_m0_wo0_mtree_mult1_0_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(u0_m0_wo0_mtree_mult1_0_cma_a0),
        .ax(u0_m0_wo0_mtree_mult1_0_cma_c0),
        .resulta(u0_m0_wo0_mtree_mult1_0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
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
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    u0_m0_wo0_mtree_mult1_0_cma_delay0 ( .xin(u0_m0_wo0_mtree_mult1_0_cma_s0), .xout(u0_m0_wo0_mtree_mult1_0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_m0_wo0_mtree_mult1_0_cma_q = $unsigned(u0_m0_wo0_mtree_mult1_0_cma_qq0[31:0]);

    // u0_m0_wo0_accum(ADD,47)@20 + 1
    assign u0_m0_wo0_accum_a = $unsigned({{4{u0_m0_wo0_mtree_mult1_0_cma_q[31]}}, u0_m0_wo0_mtree_mult1_0_cma_q});
    assign u0_m0_wo0_accum_b = $unsigned(u0_m0_wo0_adelay_q);
    assign u0_m0_wo0_accum_i = u0_m0_wo0_accum_a;
    assign u0_m0_wo0_accum_a1 = u0_m0_wo0_accum_i;
    assign u0_m0_wo0_accum_b1 = u0_m0_wo0_aseq_q == 1'b1 ? 36'b0 : u0_m0_wo0_accum_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_accum_o <= 36'b0;
        end
        else if (d_u0_m0_wo0_compute_q_20_q == 1'b1)
        begin
            u0_m0_wo0_accum_o <= $unsigned($signed(u0_m0_wo0_accum_a1) + $signed(u0_m0_wo0_accum_b1));
        end
    end
    assign u0_m0_wo0_accum_q = u0_m0_wo0_accum_o[35:0];

    // u0_m0_wo0_oseq(SEQUENCE,48)@18 + 1
    always @ (posedge clk)
    begin
        reg [7:0] u0_m0_wo0_oseq_c;
        if (areset)
        begin
            u0_m0_wo0_oseq_c = 8'b00101000;
            u0_m0_wo0_oseq_q <= $unsigned(1'b0);
            u0_m0_wo0_oseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m0_wo0_compute_q_18_q == 1'b1)
            begin
                if (u0_m0_wo0_oseq_c == 8'b11111101)
                begin
                    u0_m0_wo0_oseq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_oseq_eq <= 1'b0;
                end
                if (u0_m0_wo0_oseq_eq == 1'b1)
                begin
                    u0_m0_wo0_oseq_c = $signed(u0_m0_wo0_oseq_c) + $signed(8'd43);
                end
                else
                begin
                    u0_m0_wo0_oseq_c = $signed(u0_m0_wo0_oseq_c) - $signed(8'd1);
                end
                u0_m0_wo0_oseq_q <= $unsigned(u0_m0_wo0_oseq_c[7:7]);
            end
        end
    end

    // u0_m0_wo0_oseq_gated(LOGICAL,49)@19
    assign u0_m0_wo0_oseq_gated_q = u0_m0_wo0_oseq_q & d_u0_m0_wo0_compute_q_19_q;

    // u0_m0_wo0_oseq_gated_reg(REG,50)@19 + 1
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

    // outchan(COUNTER,55)@20 + 1
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

    // d_out0_m0_wo0_assign_id3_q_21(DELAY,68)@20 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_out0_m0_wo0_assign_id3_q_21_q <= $unsigned(u0_m0_wo0_oseq_gated_reg_q);
        end
    end

    // xOut(PORTOUT,56)@21 + 1
    assign xOut_v = d_out0_m0_wo0_assign_id3_q_21_q;
    assign xOut_c = {5'b00000, outchan_q};
    assign xOut_0 = u0_m0_wo0_accum_q;

endmodule
