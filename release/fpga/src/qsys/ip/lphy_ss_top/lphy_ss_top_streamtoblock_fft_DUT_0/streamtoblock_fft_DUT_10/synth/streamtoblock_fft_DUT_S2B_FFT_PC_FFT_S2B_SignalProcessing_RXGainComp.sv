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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXGainComp
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXGainComp (
    input wire [0:0] in_1_vin_tpl,
    input wire [7:0] in_2_chin_tpl,
    input wire [16:0] in_3_real_din_tpl,
    input wire [16:0] in_3_imag_din_tpl,
    input wire [3:0] in_5_size_tpl,
    input wire [15:0] in_4_nsc_tpl,
    input wire [15:0] in_6_fft_gain_re_tpl,
    input wire [15:0] in_7_fft_gain_im_tpl,
    input wire [63:0] in_8_time_in_tpl,
    input wire [1:0] in_9_eAxC_tpl,
    input wire [63:0] in_10_sym_metadata_tpl,
    output wire [0:0] out_1_vout_tpl,
    output wire [7:0] out_2_chout_tpl,
    output wire [15:0] out_3_real_dout_tpl,
    output wire [15:0] out_3_imag_dout_tpl,
    output wire [3:0] out_5_size_out_tpl,
    output wire [15:0] out_4_nsc_out_tpl,
    output wire [63:0] out_6_time_out_tpl,
    output wire [1:0] out_7_eAxC_out_tpl,
    output wire [63:0] out_8_sym_metadata_out_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [20:0] Scale1_imag_hcmp_x_a;
    wire [20:0] Scale1_imag_hcmp_x_b;
    logic [20:0] Scale1_imag_hcmp_x_o;
    wire [0:0] Scale1_imag_hcmp_x_n;
    wire [15:0] Scale1_imag_hconst_x_q;
    wire [20:0] Scale1_imag_lcmp_x_a;
    wire [20:0] Scale1_imag_lcmp_x_b;
    logic [20:0] Scale1_imag_lcmp_x_o;
    wire [0:0] Scale1_imag_lcmp_x_n;
    wire [15:0] Scale1_imag_lconst_x_q;
    reg [15:0] Scale1_imag_mux_x_q;
    wire [20:0] Scale1_real_hcmp_x_a;
    wire [20:0] Scale1_real_hcmp_x_b;
    logic [20:0] Scale1_real_hcmp_x_o;
    wire [0:0] Scale1_real_hcmp_x_n;
    wire [20:0] Scale1_real_lcmp_x_a;
    wire [20:0] Scale1_real_lcmp_x_b;
    logic [20:0] Scale1_real_lcmp_x_o;
    wire [0:0] Scale1_real_lcmp_x_n;
    reg [15:0] Scale1_real_mux_x_q;
    wire [0:0] dupName_0_Scale1_imag_x_q;
    wire [0:0] dupName_0_Scale1_real_x_q;
    wire [0:0] dupName_1_Scale1_imag_x_q;
    wire [0:0] dupName_1_Scale1_real_x_q;
    wire [15:0] Scale1_imag_sel_x_b;
    wire [15:0] Scale1_real_sel_x_b;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_reset;
    wire [16:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_a0;
    wire [15:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_c0;
    wire [16:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_a1;
    wire [15:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_c1;
    wire [33:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_s0;
    wire [33:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_qq0;
    reg [32:0] Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_q;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena0;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena1;
    wire Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena2;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_reset;
    wire [16:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_a0;
    wire [16:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_c0;
    wire [16:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_a1;
    wire [16:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_c1;
    wire [34:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_s0;
    wire [0:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_sna;
    wire [34:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_qq0;
    reg [32:0] Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_q;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena0;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena1;
    wire Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena2;
    wire [17:0] Scale1_imag_rnd_x_shift_q;
    wire [32:0] Scale1_imag_rnd_x_shift_qint;
    wire [18:0] Scale1_imag_rnd_x_bs_in;
    wire [18:0] Scale1_imag_rnd_x_bs_b;
    wire [17:0] Scale1_real_rnd_x_shift_q;
    wire [32:0] Scale1_real_rnd_x_shift_qint;
    wire [18:0] Scale1_real_rnd_x_bs_in;
    wire [18:0] Scale1_real_rnd_x_bs_b;
    reg [15:0] redist0_Scale1_real_sel_x_b_1_q;
    reg [15:0] redist1_Scale1_imag_sel_x_b_1_q;
    reg [0:0] redist2_channel_RXG1_in_cunroll_x_in_1_vin_tpl_7_q;
    reg [3:0] redist4_channel_RXG1_in_cunroll_x_in_5_size_tpl_7_q;
    reg [1:0] redist7_channel_RXG1_in_cunroll_x_in_9_eAxC_tpl_7_q;
    reg [15:0] redist9_Scale1_real_mux_x_q_1_q;
    reg [15:0] redist10_Scale1_imag_mux_x_q_1_q;
    wire redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_reset0;
    wire [7:0] redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_ia;
    wire [2:0] redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_aa;
    wire [2:0] redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_ab;
    wire [7:0] redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_iq;
    wire [7:0] redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_q;
    wire [2:0] redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_wraddr_i = 3'b111;
    wire [2:0] redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_offset_q;
    wire [3:0] redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_rdcnt_a;
    wire [3:0] redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_rdcnt_b;
    logic [3:0] redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_rdcnt_o;
    wire [3:0] redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_rdcnt_q;
    wire redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_reset0;
    wire [15:0] redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_ia;
    wire [2:0] redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_aa;
    wire [2:0] redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_ab;
    wire [15:0] redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_iq;
    wire [15:0] redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_q;
    wire [2:0] redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_wraddr_i = 3'b111;
    wire [3:0] redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_rdcnt_a;
    wire [3:0] redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_rdcnt_b;
    logic [3:0] redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_rdcnt_o;
    wire [3:0] redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_rdcnt_q;
    wire redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_reset0;
    wire [63:0] redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_ia;
    wire [2:0] redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_aa;
    wire [2:0] redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_ab;
    wire [63:0] redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_iq;
    wire [63:0] redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_q;
    wire [2:0] redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_wraddr_i = 3'b111;
    wire [3:0] redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_rdcnt_a;
    wire [3:0] redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_rdcnt_b;
    logic [3:0] redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_rdcnt_o;
    wire [3:0] redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_rdcnt_q;
    wire redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_reset0;
    wire [63:0] redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_ia;
    wire [2:0] redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_aa;
    wire [2:0] redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_ab;
    wire [63:0] redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_iq;
    wire [63:0] redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_q;
    wire [2:0] redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_wraddr_i = 3'b111;
    wire [3:0] redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_rdcnt_a;
    wire [3:0] redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_rdcnt_b;
    logic [3:0] redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_rdcnt_o;
    wire [3:0] redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_rdcnt_q;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_offset(CONSTANT,49)
    assign redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_offset_q = $unsigned(3'b100);

    // redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_rdcnt(ADD,62)
    assign redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_rdcnt_a = {1'b0, redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_wraddr_q};
    assign redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_rdcnt_b = {1'b0, redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_rdcnt_o <= $unsigned(redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_rdcnt_a) + $unsigned(redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_rdcnt_b);
        end
    end
    assign redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_rdcnt_q = redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_rdcnt_o[3:0];

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_wraddr(COUNTER,60)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_wraddr_i <= $unsigned(redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_wraddr_q = redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_wraddr_i[2:0];

    // redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem(DUALMEM,59)
    assign redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_ia = $unsigned(in_10_sym_metadata_tpl);
    assign redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_aa = redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_wraddr_q;
    assign redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_ab = redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_rdcnt_q[2:0];
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
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_aa),
        .data_a(redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_ab),
        .q_b(redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_iq),
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
    assign redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_q = redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_iq[63:0];

    // redist7_channel_RXG1_in_cunroll_x_in_9_eAxC_tpl_7(DELAY,43)
    dspba_delay_ver #( .width(2), .depth(7), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist7_channel_RXG1_in_cunroll_x_in_9_eAxC_tpl_7 ( .xin(in_9_eAxC_tpl), .xout(redist7_channel_RXG1_in_cunroll_x_in_9_eAxC_tpl_7_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_rdcnt(ADD,58)
    assign redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_rdcnt_a = {1'b0, redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_wraddr_q};
    assign redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_rdcnt_b = {1'b0, redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_rdcnt_o <= $unsigned(redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_rdcnt_a) + $unsigned(redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_rdcnt_b);
        end
    end
    assign redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_rdcnt_q = redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_rdcnt_o[3:0];

    // redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_wraddr(COUNTER,56)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_wraddr_i <= $unsigned(redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_wraddr_q = redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_wraddr_i[2:0];

    // redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem(DUALMEM,55)
    assign redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_ia = $unsigned(in_8_time_in_tpl);
    assign redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_aa = redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_wraddr_q;
    assign redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_ab = redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_rdcnt_q[2:0];
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
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_aa),
        .data_a(redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_ab),
        .q_b(redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_iq),
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
    assign redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_q = redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_iq[63:0];

    // redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_rdcnt(ADD,54)
    assign redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_rdcnt_a = {1'b0, redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_wraddr_q};
    assign redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_rdcnt_b = {1'b0, redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_rdcnt_o <= $unsigned(redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_rdcnt_a) + $unsigned(redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_rdcnt_b);
        end
    end
    assign redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_rdcnt_q = redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_rdcnt_o[3:0];

    // redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_wraddr(COUNTER,52)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_wraddr_i <= $unsigned(redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_wraddr_q = redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_wraddr_i[2:0];

    // redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem(DUALMEM,51)
    assign redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_ia = $unsigned(in_4_nsc_tpl);
    assign redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_aa = redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_wraddr_q;
    assign redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_ab = redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_rdcnt_q[2:0];
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
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_aa),
        .data_a(redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_ab),
        .q_b(redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_iq),
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
    assign redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_q = redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_iq[15:0];

    // redist4_channel_RXG1_in_cunroll_x_in_5_size_tpl_7(DELAY,40)
    dspba_delay_ver #( .width(4), .depth(7), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist4_channel_RXG1_in_cunroll_x_in_5_size_tpl_7 ( .xin(in_5_size_tpl), .xout(redist4_channel_RXG1_in_cunroll_x_in_5_size_tpl_7_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma(CHAINMULTADD,30)@0 + 5
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_reset = areset;
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena0 = 1'b1;
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena1 = Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena0;
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena2 = Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena0;

    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_a0 = $unsigned(in_3_imag_din_tpl);
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_c0 = in_6_fft_gain_re_tpl;
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_a1 = $unsigned(in_3_real_din_tpl);
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_c1 = in_7_fft_gain_im_tpl;
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("none"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(17),
        .by_clken("0"),
        .by_width(17),
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
        .load_const_value(14),
        .output_clken("1"),
        .result_a_width(34)
    ) Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_DSP0 (
        .clk(clk),
        .ena({ Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena2, Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena1, Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_a1),
        .by(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_a0),
        .ax(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_c1),
        .bx(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_c0),
        .loadconst(1'b1),
        .resulta(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_s0),
        .accumulate(),
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
    dspba_delay_ver #( .width(34), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_delay0 ( .xin(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_s0), .xout(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_q = $unsigned(Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_qq0[32:0]);

    // Scale1_imag_rnd_x_shift(BITSHIFT,32)@5
    assign Scale1_imag_rnd_x_shift_qint = Mult_imagMult1_x_Mult_imagAdd_x_Mult_imagMult2_x_merged_cma_q;
    assign Scale1_imag_rnd_x_shift_q = Scale1_imag_rnd_x_shift_qint[32:15];

    // Scale1_imag_rnd_x_bs(BITSELECT,33)@5
    assign Scale1_imag_rnd_x_bs_in = $unsigned({{1{Scale1_imag_rnd_x_shift_q[17]}}, Scale1_imag_rnd_x_shift_q});
    assign Scale1_imag_rnd_x_bs_b = $unsigned(Scale1_imag_rnd_x_bs_in[18:0]);

    // Scale1_imag_sel_x(BITSELECT,26)@5
    assign Scale1_imag_sel_x_b = $unsigned(Scale1_imag_rnd_x_bs_b[15:0]);

    // redist1_Scale1_imag_sel_x_b_1(DELAY,37)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_Scale1_imag_sel_x_b_1_q <= $unsigned(Scale1_imag_sel_x_b);
        end
    end

    // Scale1_imag_hconst_x(CONSTANT,3)
    assign Scale1_imag_hconst_x_q = $unsigned(16'b0111111111111111);

    // Scale1_imag_hcmp_x(COMPARE,2)@5 + 1
    assign Scale1_imag_hcmp_x_a = $unsigned({{5{Scale1_imag_hconst_x_q[15]}}, Scale1_imag_hconst_x_q});
    assign Scale1_imag_hcmp_x_b = $unsigned({{2{Scale1_imag_rnd_x_bs_b[18]}}, Scale1_imag_rnd_x_bs_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Scale1_imag_hcmp_x_o <= $unsigned($signed(Scale1_imag_hcmp_x_a) - $signed(Scale1_imag_hcmp_x_b));
        end
    end
    assign Scale1_imag_hcmp_x_n[0] = ~ (Scale1_imag_hcmp_x_o[20]);

    // dupName_1_Scale1_imag_x(LOGICAL,24)@6
    assign dupName_1_Scale1_imag_x_q = ~ (Scale1_imag_hcmp_x_n);

    // Scale1_imag_lconst_x(CONSTANT,5)
    assign Scale1_imag_lconst_x_q = $unsigned(16'b1000000000000001);

    // Scale1_imag_lcmp_x(COMPARE,4)@5 + 1
    assign Scale1_imag_lcmp_x_a = $unsigned({{2{Scale1_imag_rnd_x_bs_b[18]}}, Scale1_imag_rnd_x_bs_b});
    assign Scale1_imag_lcmp_x_b = $unsigned({{5{Scale1_imag_lconst_x_q[15]}}, Scale1_imag_lconst_x_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Scale1_imag_lcmp_x_o <= $unsigned($signed(Scale1_imag_lcmp_x_a) - $signed(Scale1_imag_lcmp_x_b));
        end
    end
    assign Scale1_imag_lcmp_x_n[0] = ~ (Scale1_imag_lcmp_x_o[20]);

    // dupName_0_Scale1_imag_x(LOGICAL,22)@6
    assign dupName_0_Scale1_imag_x_q = ~ (Scale1_imag_lcmp_x_n);

    // Scale1_imag_mux_x(SELECTOR,6)@6
    always @(dupName_0_Scale1_imag_x_q or Scale1_imag_lconst_x_q or dupName_1_Scale1_imag_x_q or Scale1_imag_hconst_x_q or redist1_Scale1_imag_sel_x_b_1_q)
    begin
        Scale1_imag_mux_x_q = $unsigned(redist1_Scale1_imag_sel_x_b_1_q);
        if (dupName_1_Scale1_imag_x_q == 1'b1)
        begin
            Scale1_imag_mux_x_q = $unsigned(Scale1_imag_hconst_x_q);
        end
        if (dupName_0_Scale1_imag_x_q == 1'b1)
        begin
            Scale1_imag_mux_x_q = $unsigned(Scale1_imag_lconst_x_q);
        end
    end

    // redist10_Scale1_imag_mux_x_q_1(DELAY,46)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist10_Scale1_imag_mux_x_q_1_q <= $unsigned(Scale1_imag_mux_x_q);
        end
    end

    // Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma(CHAINMULTADD,31)@0 + 5
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_reset = areset;
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena0 = 1'b1;
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena1 = Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena0;
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena2 = Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_ena0;

    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_a0 = $unsigned(in_3_imag_din_tpl);
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_c0 = $unsigned($signed({1'b0, in_7_fft_gain_im_tpl[15:0]}));
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_a1 = $unsigned(in_3_real_din_tpl);
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_c1 = $unsigned($signed({1'b0, in_6_fft_gain_re_tpl[15:0]}));
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("none"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(17),
        .by_clken("0"),
        .by_width(17),
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
        .load_const_value(14),
        .output_clken("1"),
        .result_a_width(35)
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
        .loadconst(1'b1),
        .resulta(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_s0),
        .accumulate(),
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
    dspba_delay_ver #( .width(35), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_delay0 ( .xin(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_s0), .xout(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_q = $unsigned(Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_qq0[32:0]);

    // Scale1_real_rnd_x_shift(BITSHIFT,34)@5
    assign Scale1_real_rnd_x_shift_qint = Mult_realMult1_x_Mult_realSub_x_Mult_realMult2_x_merged_cma_q;
    assign Scale1_real_rnd_x_shift_q = Scale1_real_rnd_x_shift_qint[32:15];

    // Scale1_real_rnd_x_bs(BITSELECT,35)@5
    assign Scale1_real_rnd_x_bs_in = $unsigned({{1{Scale1_real_rnd_x_shift_q[17]}}, Scale1_real_rnd_x_shift_q});
    assign Scale1_real_rnd_x_bs_b = $unsigned(Scale1_real_rnd_x_bs_in[18:0]);

    // Scale1_real_sel_x(BITSELECT,27)@5
    assign Scale1_real_sel_x_b = $unsigned(Scale1_real_rnd_x_bs_b[15:0]);

    // redist0_Scale1_real_sel_x_b_1(DELAY,36)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_Scale1_real_sel_x_b_1_q <= $unsigned(Scale1_real_sel_x_b);
        end
    end

    // Scale1_real_hcmp_x(COMPARE,8)@5 + 1
    assign Scale1_real_hcmp_x_a = $unsigned({{5{Scale1_imag_hconst_x_q[15]}}, Scale1_imag_hconst_x_q});
    assign Scale1_real_hcmp_x_b = $unsigned({{2{Scale1_real_rnd_x_bs_b[18]}}, Scale1_real_rnd_x_bs_b});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Scale1_real_hcmp_x_o <= $unsigned($signed(Scale1_real_hcmp_x_a) - $signed(Scale1_real_hcmp_x_b));
        end
    end
    assign Scale1_real_hcmp_x_n[0] = ~ (Scale1_real_hcmp_x_o[20]);

    // dupName_1_Scale1_real_x(LOGICAL,25)@6
    assign dupName_1_Scale1_real_x_q = ~ (Scale1_real_hcmp_x_n);

    // Scale1_real_lcmp_x(COMPARE,10)@5 + 1
    assign Scale1_real_lcmp_x_a = $unsigned({{2{Scale1_real_rnd_x_bs_b[18]}}, Scale1_real_rnd_x_bs_b});
    assign Scale1_real_lcmp_x_b = $unsigned({{5{Scale1_imag_lconst_x_q[15]}}, Scale1_imag_lconst_x_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Scale1_real_lcmp_x_o <= $unsigned($signed(Scale1_real_lcmp_x_a) - $signed(Scale1_real_lcmp_x_b));
        end
    end
    assign Scale1_real_lcmp_x_n[0] = ~ (Scale1_real_lcmp_x_o[20]);

    // dupName_0_Scale1_real_x(LOGICAL,23)@6
    assign dupName_0_Scale1_real_x_q = ~ (Scale1_real_lcmp_x_n);

    // Scale1_real_mux_x(SELECTOR,12)@6
    always @(dupName_0_Scale1_real_x_q or Scale1_imag_lconst_x_q or dupName_1_Scale1_real_x_q or Scale1_imag_hconst_x_q or redist0_Scale1_real_sel_x_b_1_q)
    begin
        Scale1_real_mux_x_q = $unsigned(redist0_Scale1_real_sel_x_b_1_q);
        if (dupName_1_Scale1_real_x_q == 1'b1)
        begin
            Scale1_real_mux_x_q = $unsigned(Scale1_imag_hconst_x_q);
        end
        if (dupName_0_Scale1_real_x_q == 1'b1)
        begin
            Scale1_real_mux_x_q = $unsigned(Scale1_imag_lconst_x_q);
        end
    end

    // redist9_Scale1_real_mux_x_q_1(DELAY,45)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_Scale1_real_mux_x_q_1_q <= $unsigned(Scale1_real_mux_x_q);
        end
    end

    // redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_rdcnt(ADD,50)
    assign redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_rdcnt_a = {1'b0, redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_wraddr_q};
    assign redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_rdcnt_b = {1'b0, redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_rdcnt_o <= $unsigned(redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_rdcnt_a) + $unsigned(redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_rdcnt_b);
        end
    end
    assign redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_rdcnt_q = redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_rdcnt_o[3:0];

    // redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_wraddr(COUNTER,48)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_wraddr_i <= $unsigned(redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_wraddr_q = redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_wraddr_i[2:0];

    // redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem(DUALMEM,47)
    assign redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_ia = $unsigned(in_2_chin_tpl);
    assign redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_aa = redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_wraddr_q;
    assign redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_ab = redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_rdcnt_q[2:0];
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
    ) redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_aa),
        .data_a(redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_ab),
        .q_b(redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_iq),
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
    assign redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_q = redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_iq[7:0];

    // redist2_channel_RXG1_in_cunroll_x_in_1_vin_tpl_7(DELAY,38)
    dspba_delay_ver #( .width(1), .depth(7), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist2_channel_RXG1_in_cunroll_x_in_1_vin_tpl_7 ( .xin(in_1_vin_tpl), .xout(redist2_channel_RXG1_in_cunroll_x_in_1_vin_tpl_7_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // channel_RXG1_out_cunroll_x(PORTOUT,21)@7 + 1
    assign out_1_vout_tpl = redist2_channel_RXG1_in_cunroll_x_in_1_vin_tpl_7_q;
    assign out_2_chout_tpl = redist3_channel_RXG1_in_cunroll_x_in_2_chin_tpl_7_mem_q;
    assign out_3_real_dout_tpl = redist9_Scale1_real_mux_x_q_1_q;
    assign out_3_imag_dout_tpl = redist10_Scale1_imag_mux_x_q_1_q;
    assign out_5_size_out_tpl = redist4_channel_RXG1_in_cunroll_x_in_5_size_tpl_7_q;
    assign out_4_nsc_out_tpl = redist5_channel_RXG1_in_cunroll_x_in_4_nsc_tpl_7_mem_q;
    assign out_6_time_out_tpl = redist6_channel_RXG1_in_cunroll_x_in_8_time_in_tpl_7_mem_q;
    assign out_7_eAxC_out_tpl = redist7_channel_RXG1_in_cunroll_x_in_9_eAxC_tpl_7_q;
    assign out_8_sym_metadata_out_tpl = redist8_channel_RXG1_in_cunroll_x_in_10_sym_metadata_tpl_7_mem_q;

endmodule
