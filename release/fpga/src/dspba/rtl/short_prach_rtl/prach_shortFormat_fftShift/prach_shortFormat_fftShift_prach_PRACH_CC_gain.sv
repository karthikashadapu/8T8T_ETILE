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

// SystemVerilog created from prach_shortFormat_fftShift_prach_PRACH_CC_gain
// SystemVerilog created on Wed Nov  6 19:28:33 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module prach_shortFormat_fftShift_prach_PRACH_CC_gain (
    input wire [0:0] in_2_data_valid_tpl,
    input wire [7:0] in_3_chin_tpl,
    input wire [15:0] in_1_real_data_in_tpl,
    input wire [15:0] in_1_imag_data_in_tpl,
    input wire [15:0] in_4_real_gain_tpl,
    input wire [15:0] in_4_imag_gain_tpl,
    output wire [0:0] out_2_valid_out_tpl,
    output wire [7:0] out_3_ch_no_tpl,
    output wire [15:0] out_1_real_data_out_tpl,
    output wire [15:0] out_1_imag_data_out_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [15:0] Convert_imag_sel_x_b;
    wire [15:0] Convert_real_sel_x_b;
    wire [14:0] Convert_imag_rnd_x_replace_constant_q;
    wire [14:0] Convert_imag_rnd_x_replace_round_select_in;
    wire [14:0] Convert_imag_rnd_x_replace_round_select_b;
    wire [16:0] Convert_imag_rnd_x_replace_keep_select_b;
    wire [0:0] Convert_imag_rnd_x_replace_comp_q;
    wire [15:0] Convert_imag_rnd_x_replace_hi_select_in;
    wire [0:0] Convert_imag_rnd_x_replace_hi_select_b;
    wire [14:0] Convert_imag_rnd_x_replace_lo_select_in;
    wire [0:0] Convert_imag_rnd_x_replace_lo_select_b;
    wire [0:0] Convert_imag_rnd_x_replace_mux_s;
    reg [0:0] Convert_imag_rnd_x_replace_mux_q;
    wire [18:0] Convert_imag_rnd_x_replace_add_a;
    wire [18:0] Convert_imag_rnd_x_replace_add_b;
    logic [18:0] Convert_imag_rnd_x_replace_add_o;
    wire [17:0] Convert_imag_rnd_x_replace_add_q;
    wire [14:0] Convert_real_rnd_x_replace_round_select_in;
    wire [14:0] Convert_real_rnd_x_replace_round_select_b;
    wire [16:0] Convert_real_rnd_x_replace_keep_select_b;
    wire [0:0] Convert_real_rnd_x_replace_comp_q;
    wire [15:0] Convert_real_rnd_x_replace_hi_select_in;
    wire [0:0] Convert_real_rnd_x_replace_hi_select_b;
    wire [14:0] Convert_real_rnd_x_replace_lo_select_in;
    wire [0:0] Convert_real_rnd_x_replace_lo_select_b;
    wire [0:0] Convert_real_rnd_x_replace_mux_s;
    reg [0:0] Convert_real_rnd_x_replace_mux_q;
    wire [18:0] Convert_real_rnd_x_replace_add_a;
    wire [18:0] Convert_real_rnd_x_replace_add_b;
    logic [18:0] Convert_real_rnd_x_replace_add_o;
    wire [17:0] Convert_real_rnd_x_replace_add_q;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_reset;
    (* preserve_syn_only *) reg signed [15:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ah [0:1];
    (* preserve_syn_only *) reg [15:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ch [0:1];
    wire [15:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_a0;
    wire [15:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_c0;
    wire [15:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_a1;
    wire [15:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_c1;
    wire [32:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_s0;
    wire [32:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_qq0;
    reg [31:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_q;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena0;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena1;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena2;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_reset;
    (* preserve_syn_only *) reg signed [15:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ah [0:1];
    (* preserve_syn_only *) reg signed [16:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ch [0:1];
    wire [15:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_a0;
    wire [16:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_c0;
    wire [15:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_a1;
    wire [16:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_c1;
    wire [33:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_s0;
    wire [0:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_sna;
    wire [33:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_qq0;
    reg [31:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_q;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena0;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena1;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena2;
    reg [16:0] redist0_Convert_real_rnd_x_replace_keep_select_b_1_q;
    reg [16:0] redist1_Convert_imag_rnd_x_replace_keep_select_b_1_q;
    reg [15:0] redist2_Convert_real_sel_x_b_1_q;
    reg [15:0] redist3_Convert_imag_sel_x_b_1_q;
    reg [0:0] redist4_ChannelIn_cunroll_x_in_2_data_valid_tpl_8_q;
    wire redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_reset0;
    wire [7:0] redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_ia;
    wire [2:0] redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_aa;
    wire [2:0] redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_ab;
    wire [7:0] redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_iq;
    wire [7:0] redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_q;
    wire [2:0] redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_wraddr_i = 3'b111;
    wire [2:0] redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_offset_q;
    wire [3:0] redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_rdcnt_a;
    wire [3:0] redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_rdcnt_b;
    logic [3:0] redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_rdcnt_o;
    wire [3:0] redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_rdcnt_q;

    import prach_shortFormat_fftShift_prach_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma(CHAINMULTADD,32)@0 + 5
    // out q@6
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_reset = areset;
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena0 = 1'b1;
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena1 = Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena0;
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena2 = Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena0;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ah[0] <= in_1_imag_data_in_tpl;
            Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ah[1] <= in_1_real_data_in_tpl;
            Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ch[0] <= in_4_real_gain_tpl;
            Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ch[1] <= in_4_imag_gain_tpl;
        end
    end

    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_a0 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ah[0]);
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_c0 = Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ch[0];
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_a1 = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ah[1]);
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_c1 = Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ch[1];
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("none"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(33)
    ) Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_DSP0 (
        .clk(clk),
        .ena({ Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena2, Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena1, Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_a1),
        .by(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_a0),
        .ax(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_c1),
        .bx(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_c0),
        .resulta(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_s0),
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
    dspba_delay_ver #( .width(33), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_delay0 ( .xin(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_s0), .xout(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_q = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_qq0[31:0]);

    // Convert_imag_rnd_x_replace_hi_select(BITSELECT,18)@6
    assign Convert_imag_rnd_x_replace_hi_select_in = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_q[15:0]);
    assign Convert_imag_rnd_x_replace_hi_select_b = $unsigned(Convert_imag_rnd_x_replace_hi_select_in[15:15]);

    // Convert_imag_rnd_x_replace_lo_select(BITSELECT,19)@6
    assign Convert_imag_rnd_x_replace_lo_select_in = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_q[14:0]);
    assign Convert_imag_rnd_x_replace_lo_select_b = $unsigned(Convert_imag_rnd_x_replace_lo_select_in[14:14]);

    // Convert_imag_rnd_x_replace_constant(CONSTANT,14)
    assign Convert_imag_rnd_x_replace_constant_q = $unsigned(15'b100000000000000);

    // Convert_imag_rnd_x_replace_round_select(BITSELECT,15)@6
    assign Convert_imag_rnd_x_replace_round_select_in = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_q[14:0]);
    assign Convert_imag_rnd_x_replace_round_select_b = $unsigned(Convert_imag_rnd_x_replace_round_select_in[14:0]);

    // Convert_imag_rnd_x_replace_comp(LOGICAL,17)@6
    assign Convert_imag_rnd_x_replace_comp_q = $unsigned(Convert_imag_rnd_x_replace_round_select_b == Convert_imag_rnd_x_replace_constant_q ? 1'b1 : 1'b0);

    // Convert_imag_rnd_x_replace_mux(MUX,20)@6 + 1
    assign Convert_imag_rnd_x_replace_mux_s = Convert_imag_rnd_x_replace_comp_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (Convert_imag_rnd_x_replace_mux_s)
                1'b0 : Convert_imag_rnd_x_replace_mux_q <= Convert_imag_rnd_x_replace_lo_select_b;
                1'b1 : Convert_imag_rnd_x_replace_mux_q <= Convert_imag_rnd_x_replace_hi_select_b;
                default : Convert_imag_rnd_x_replace_mux_q <= 1'b0;
            endcase
        end
    end

    // Convert_imag_rnd_x_replace_keep_select(BITSELECT,16)@6
    assign Convert_imag_rnd_x_replace_keep_select_b = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_q[31:15]);

    // redist1_Convert_imag_rnd_x_replace_keep_select_b_1(DELAY,35)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_Convert_imag_rnd_x_replace_keep_select_b_1_q <= $unsigned(Convert_imag_rnd_x_replace_keep_select_b);
        end
    end

    // Convert_imag_rnd_x_replace_add(ADD,21)@7
    assign Convert_imag_rnd_x_replace_add_a = $unsigned({{2{redist1_Convert_imag_rnd_x_replace_keep_select_b_1_q[16]}}, redist1_Convert_imag_rnd_x_replace_keep_select_b_1_q});
    assign Convert_imag_rnd_x_replace_add_b = $unsigned({18'b000000000000000000, Convert_imag_rnd_x_replace_mux_q});
    assign Convert_imag_rnd_x_replace_add_o = $unsigned($signed(Convert_imag_rnd_x_replace_add_a) + $signed(Convert_imag_rnd_x_replace_add_b));
    assign Convert_imag_rnd_x_replace_add_q = Convert_imag_rnd_x_replace_add_o[17:0];

    // Convert_imag_sel_x(BITSELECT,12)@7
    assign Convert_imag_sel_x_b = $unsigned(Convert_imag_rnd_x_replace_add_q[15:0]);

    // redist3_Convert_imag_sel_x_b_1(DELAY,37)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_Convert_imag_sel_x_b_1_q <= $unsigned(Convert_imag_sel_x_b);
        end
    end

    // Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma(CHAINMULTADD,33)@0 + 5
    // out q@6
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_reset = areset;
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena0 = 1'b1;
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena1 = Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena0;
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena2 = Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena0;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ah[0] <= in_1_imag_data_in_tpl;
            Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ah[1] <= in_1_real_data_in_tpl;
            Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ch[0] <= $signed({1'b0, in_4_imag_gain_tpl[15:0]});
            Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ch[1] <= $signed({1'b0, in_4_real_gain_tpl[15:0]});
        end
    end

    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_a0 = $unsigned(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ah[0]);
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_c0 = $unsigned(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ch[0]);
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_a1 = $unsigned(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ah[1]);
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_c1 = $unsigned(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ch[1]);
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("none"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(17),
        .bx_width(17),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(34)
    ) Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_DSP0 (
        .clk(clk),
        .ena({ Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena2, Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena1, Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .sub(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_sna[0]),
        .negate(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_sna[0]),
        .ay(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_a1),
        .by(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_a0),
        .ax(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_c1),
        .bx(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_c0),
        .resulta(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_s0),
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
    dspba_delay_ver #( .width(34), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_delay0 ( .xin(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_s0), .xout(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_q = $unsigned(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_qq0[31:0]);

    // Convert_real_rnd_x_replace_hi_select(BITSELECT,26)@6
    assign Convert_real_rnd_x_replace_hi_select_in = $unsigned(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_q[15:0]);
    assign Convert_real_rnd_x_replace_hi_select_b = $unsigned(Convert_real_rnd_x_replace_hi_select_in[15:15]);

    // Convert_real_rnd_x_replace_lo_select(BITSELECT,27)@6
    assign Convert_real_rnd_x_replace_lo_select_in = $unsigned(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_q[14:0]);
    assign Convert_real_rnd_x_replace_lo_select_b = $unsigned(Convert_real_rnd_x_replace_lo_select_in[14:14]);

    // Convert_real_rnd_x_replace_round_select(BITSELECT,23)@6
    assign Convert_real_rnd_x_replace_round_select_in = $unsigned(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_q[14:0]);
    assign Convert_real_rnd_x_replace_round_select_b = $unsigned(Convert_real_rnd_x_replace_round_select_in[14:0]);

    // Convert_real_rnd_x_replace_comp(LOGICAL,25)@6
    assign Convert_real_rnd_x_replace_comp_q = $unsigned(Convert_real_rnd_x_replace_round_select_b == Convert_imag_rnd_x_replace_constant_q ? 1'b1 : 1'b0);

    // Convert_real_rnd_x_replace_mux(MUX,28)@6 + 1
    assign Convert_real_rnd_x_replace_mux_s = Convert_real_rnd_x_replace_comp_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (Convert_real_rnd_x_replace_mux_s)
                1'b0 : Convert_real_rnd_x_replace_mux_q <= Convert_real_rnd_x_replace_lo_select_b;
                1'b1 : Convert_real_rnd_x_replace_mux_q <= Convert_real_rnd_x_replace_hi_select_b;
                default : Convert_real_rnd_x_replace_mux_q <= 1'b0;
            endcase
        end
    end

    // Convert_real_rnd_x_replace_keep_select(BITSELECT,24)@6
    assign Convert_real_rnd_x_replace_keep_select_b = $unsigned(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_q[31:15]);

    // redist0_Convert_real_rnd_x_replace_keep_select_b_1(DELAY,34)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_Convert_real_rnd_x_replace_keep_select_b_1_q <= $unsigned(Convert_real_rnd_x_replace_keep_select_b);
        end
    end

    // Convert_real_rnd_x_replace_add(ADD,29)@7
    assign Convert_real_rnd_x_replace_add_a = $unsigned({{2{redist0_Convert_real_rnd_x_replace_keep_select_b_1_q[16]}}, redist0_Convert_real_rnd_x_replace_keep_select_b_1_q});
    assign Convert_real_rnd_x_replace_add_b = $unsigned({18'b000000000000000000, Convert_real_rnd_x_replace_mux_q});
    assign Convert_real_rnd_x_replace_add_o = $unsigned($signed(Convert_real_rnd_x_replace_add_a) + $signed(Convert_real_rnd_x_replace_add_b));
    assign Convert_real_rnd_x_replace_add_q = Convert_real_rnd_x_replace_add_o[17:0];

    // Convert_real_sel_x(BITSELECT,13)@7
    assign Convert_real_sel_x_b = $unsigned(Convert_real_rnd_x_replace_add_q[15:0]);

    // redist2_Convert_real_sel_x_b_1(DELAY,36)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_Convert_real_sel_x_b_1_q <= $unsigned(Convert_real_sel_x_b);
        end
    end

    // redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_offset(CONSTANT,42)
    assign redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_offset_q = $unsigned(3'b011);

    // redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_rdcnt(ADD,43)
    assign redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_rdcnt_a = {1'b0, redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_wraddr_q};
    assign redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_rdcnt_b = {1'b0, redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_rdcnt_o <= $unsigned(redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_rdcnt_a) + $unsigned(redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_rdcnt_b);
        end
    end
    assign redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_rdcnt_q = redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_rdcnt_o[3:0];

    // redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_wraddr(COUNTER,41)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_wraddr_i <= $unsigned(redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_wraddr_q = redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_wraddr_i[2:0];

    // redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem(DUALMEM,40)
    assign redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_ia = $unsigned(in_3_chin_tpl);
    assign redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_aa = redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_wraddr_q;
    assign redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_ab = redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_rdcnt_q[2:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(8),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(8),
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
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_aa),
        .data_a(redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_ab),
        .q_b(redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_iq),
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
    assign redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_q = redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_iq[7:0];

    // redist4_ChannelIn_cunroll_x_in_2_data_valid_tpl_8(DELAY,38)
    dspba_delay_ver #( .width(1), .depth(8), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist4_ChannelIn_cunroll_x_in_2_data_valid_tpl_8 ( .xin(in_2_data_valid_tpl), .xout(redist4_ChannelIn_cunroll_x_in_2_data_valid_tpl_8_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ChannelOut_cunroll_x(PORTOUT,5)@8 + 1
    assign out_2_valid_out_tpl = redist4_ChannelIn_cunroll_x_in_2_data_valid_tpl_8_q;
    assign out_3_ch_no_tpl = redist5_ChannelIn_cunroll_x_in_3_chin_tpl_8_mem_q;
    assign out_1_real_data_out_tpl = redist2_Convert_real_sel_x_b_1_q;
    assign out_1_imag_data_out_tpl = redist3_Convert_imag_sel_x_b_1_q;

endmodule
