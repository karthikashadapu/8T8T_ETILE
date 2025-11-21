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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling (
    input wire [0:0] in_1_vin_tpl,
    input wire [7:0] in_2_chin_tpl,
    input wire [28:0] in_4_real_din_tpl,
    input wire [28:0] in_4_imag_din_tpl,
    input wire [3:0] in_3_size_tpl,
    input wire [15:0] in_5_nsc_tpl,
    input wire [3:0] in_6_fft_shift_tpl,
    input wire [63:0] in_7_time_in_tpl,
    input wire [1:0] in_8_eAxC_tpl,
    input wire [63:0] in_9_sym_metadata_tpl,
    output wire [0:0] out_1_vout_tpl,
    output wire [7:0] out_2_chout_tpl,
    output wire [15:0] out_3_real_dout_tpl,
    output wire [15:0] out_3_imag_dout_tpl,
    output wire [3:0] out_4_size_out_tpl,
    output wire [15:0] out_5_nsc_out_tpl,
    output wire [63:0] out_6_time_out_tpl,
    output wire [1:0] out_7_eAxCout_tpl,
    output wire [63:0] out_8_sym_metadataout_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [28:0] Scale1_hcmp_a;
    wire [28:0] Scale1_hcmp_b;
    logic [28:0] Scale1_hcmp_o;
    wire [0:0] Scale1_hcmp_n;
    wire [15:0] Scale1_hconst_q;
    wire [28:0] Scale1_lcmp_a;
    wire [28:0] Scale1_lcmp_b;
    logic [28:0] Scale1_lcmp_o;
    wire [0:0] Scale1_lcmp_n;
    wire [15:0] Scale1_lconst_q;
    reg [15:0] Scale1_mux_q;
    wire [28:0] Scale2_hcmp_a;
    wire [28:0] Scale2_hcmp_b;
    logic [28:0] Scale2_hcmp_o;
    wire [0:0] Scale2_hcmp_n;
    wire [28:0] Scale2_lcmp_a;
    wire [28:0] Scale2_lcmp_b;
    logic [28:0] Scale2_lcmp_o;
    wire [0:0] Scale2_lcmp_n;
    reg [15:0] Scale2_mux_q;
    wire [15:0] Scale1_sel_x_b;
    wire [15:0] Scale2_sel_x_b;
    wire [0:0] dupName_0_Scale1_x_q;
    wire [0:0] dupName_0_Scale2_x_q;
    wire [0:0] dupName_1_Scale1_x_q;
    wire [0:0] dupName_1_Scale2_x_q;
    wire [0:0] xMSB_uid25_Shift_b;
    wire [27:0] rightShiftStage0Idx1Rng1_uid27_Shift_b;
    wire [28:0] rightShiftStage0Idx1_uid28_Shift_q;
    wire [1:0] seMsb_to2_uid29_in;
    wire [1:0] seMsb_to2_uid29_b;
    wire [26:0] rightShiftStage0Idx2Rng2_uid30_Shift_b;
    wire [28:0] rightShiftStage0Idx2_uid31_Shift_q;
    wire [2:0] seMsb_to3_uid32_in;
    wire [2:0] seMsb_to3_uid32_b;
    wire [25:0] rightShiftStage0Idx3Rng3_uid33_Shift_b;
    wire [28:0] rightShiftStage0Idx3_uid34_Shift_q;
    wire [1:0] rightShiftStage0_uid36_Shift_s;
    reg [28:0] rightShiftStage0_uid36_Shift_q;
    wire [3:0] seMsb_to4_uid37_in;
    wire [3:0] seMsb_to4_uid37_b;
    wire [24:0] rightShiftStage1Idx1Rng4_uid38_Shift_b;
    wire [28:0] rightShiftStage1Idx1_uid39_Shift_q;
    wire [7:0] seMsb_to8_uid40_in;
    wire [7:0] seMsb_to8_uid40_b;
    wire [20:0] rightShiftStage1Idx2Rng8_uid41_Shift_b;
    wire [28:0] rightShiftStage1Idx2_uid42_Shift_q;
    wire [11:0] seMsb_to12_uid43_in;
    wire [11:0] seMsb_to12_uid43_b;
    wire [16:0] rightShiftStage1Idx3Rng12_uid44_Shift_b;
    wire [28:0] rightShiftStage1Idx3_uid45_Shift_q;
    wire [1:0] rightShiftStage1_uid47_Shift_s;
    reg [28:0] rightShiftStage1_uid47_Shift_q;
    wire [0:0] xMSB_uid49_Shift1_b;
    wire [27:0] rightShiftStage0Idx1Rng1_uid51_Shift1_b;
    wire [28:0] rightShiftStage0Idx1_uid52_Shift1_q;
    wire [1:0] seMsb_to2_uid53_in;
    wire [1:0] seMsb_to2_uid53_b;
    wire [26:0] rightShiftStage0Idx2Rng2_uid54_Shift1_b;
    wire [28:0] rightShiftStage0Idx2_uid55_Shift1_q;
    wire [2:0] seMsb_to3_uid56_in;
    wire [2:0] seMsb_to3_uid56_b;
    wire [25:0] rightShiftStage0Idx3Rng3_uid57_Shift1_b;
    wire [28:0] rightShiftStage0Idx3_uid58_Shift1_q;
    wire [1:0] rightShiftStage0_uid60_Shift1_s;
    reg [28:0] rightShiftStage0_uid60_Shift1_q;
    wire [3:0] seMsb_to4_uid61_in;
    wire [3:0] seMsb_to4_uid61_b;
    wire [24:0] rightShiftStage1Idx1Rng4_uid62_Shift1_b;
    wire [28:0] rightShiftStage1Idx1_uid63_Shift1_q;
    wire [7:0] seMsb_to8_uid64_in;
    wire [7:0] seMsb_to8_uid64_b;
    wire [20:0] rightShiftStage1Idx2Rng8_uid65_Shift1_b;
    wire [28:0] rightShiftStage1Idx2_uid66_Shift1_q;
    wire [11:0] seMsb_to12_uid67_in;
    wire [11:0] seMsb_to12_uid67_b;
    wire [16:0] rightShiftStage1Idx3Rng12_uid68_Shift1_b;
    wire [28:0] rightShiftStage1Idx3_uid69_Shift1_q;
    wire [1:0] rightShiftStage1_uid71_Shift1_s;
    reg [28:0] rightShiftStage1_uid71_Shift1_q;
    wire [1:0] Scale1_rnd_bias_q;
    wire [26:0] Scale1_rnd_trunc_q;
    wire [28:0] Scale1_rnd_trunc_qint;
    wire [27:0] Scale1_rnd_add_a;
    wire [27:0] Scale1_rnd_add_b;
    logic [27:0] Scale1_rnd_add_o;
    wire [27:0] Scale1_rnd_add_q;
    wire [26:0] Scale1_rnd_shift_q;
    wire [27:0] Scale1_rnd_shift_qint;
    wire [26:0] Scale2_rnd_trunc_q;
    wire [28:0] Scale2_rnd_trunc_qint;
    wire [27:0] Scale2_rnd_add_a;
    wire [27:0] Scale2_rnd_add_b;
    logic [27:0] Scale2_rnd_add_o;
    wire [27:0] Scale2_rnd_add_q;
    wire [26:0] Scale2_rnd_shift_q;
    wire [27:0] Scale2_rnd_shift_qint;
    wire [1:0] rightShiftStageSel0Dto0_uid35_Shift_bit_select_merged_b;
    wire [1:0] rightShiftStageSel0Dto0_uid35_Shift_bit_select_merged_c;
    reg [26:0] redist0_Scale2_rnd_shift_q_1_q;
    reg [26:0] redist1_Scale2_rnd_trunc_q_1_q;
    reg [26:0] redist2_Scale1_rnd_shift_q_1_q;
    reg [26:0] redist3_Scale1_rnd_trunc_q_1_q;
    reg [15:0] redist4_Scale2_sel_x_b_1_q;
    reg [15:0] redist5_Scale1_sel_x_b_1_q;
    reg [0:0] redist6_channel_RXS1_in_in_1_vin_tpl_4_q;
    reg [0:0] redist6_channel_RXS1_in_in_1_vin_tpl_4_delay_0;
    reg [0:0] redist6_channel_RXS1_in_in_1_vin_tpl_4_delay_1;
    reg [0:0] redist6_channel_RXS1_in_in_1_vin_tpl_4_delay_2;
    reg [7:0] redist7_channel_RXS1_in_in_2_chin_tpl_4_q;
    reg [7:0] redist7_channel_RXS1_in_in_2_chin_tpl_4_delay_0;
    reg [7:0] redist7_channel_RXS1_in_in_2_chin_tpl_4_delay_1;
    reg [7:0] redist7_channel_RXS1_in_in_2_chin_tpl_4_delay_2;
    reg [3:0] redist8_channel_RXS1_in_in_3_size_tpl_4_q;
    reg [3:0] redist8_channel_RXS1_in_in_3_size_tpl_4_delay_0;
    reg [3:0] redist8_channel_RXS1_in_in_3_size_tpl_4_delay_1;
    reg [3:0] redist8_channel_RXS1_in_in_3_size_tpl_4_delay_2;
    reg [1:0] redist11_channel_RXS1_in_in_8_eAxC_tpl_4_q;
    reg [1:0] redist11_channel_RXS1_in_in_8_eAxC_tpl_4_delay_0;
    reg [1:0] redist11_channel_RXS1_in_in_8_eAxC_tpl_4_delay_1;
    reg [1:0] redist11_channel_RXS1_in_in_8_eAxC_tpl_4_delay_2;
    reg [15:0] redist13_Scale2_mux_q_1_q;
    reg [15:0] redist14_Scale1_mux_q_1_q;
    wire redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_reset0;
    wire [15:0] redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_ia;
    wire [1:0] redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_aa;
    wire [1:0] redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_ab;
    wire [15:0] redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_iq;
    wire [15:0] redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_q;
    wire [1:0] redist9_channel_RXS1_in_in_5_nsc_tpl_4_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist9_channel_RXS1_in_in_5_nsc_tpl_4_wraddr_i = 2'b11;
    wire [1:0] redist9_channel_RXS1_in_in_5_nsc_tpl_4_offset_q;
    wire [2:0] redist9_channel_RXS1_in_in_5_nsc_tpl_4_rdcnt_a;
    wire [2:0] redist9_channel_RXS1_in_in_5_nsc_tpl_4_rdcnt_b;
    logic [2:0] redist9_channel_RXS1_in_in_5_nsc_tpl_4_rdcnt_o;
    wire [2:0] redist9_channel_RXS1_in_in_5_nsc_tpl_4_rdcnt_q;
    wire redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_reset0;
    wire [63:0] redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_ia;
    wire [1:0] redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_aa;
    wire [1:0] redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_ab;
    wire [63:0] redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_iq;
    wire [63:0] redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_q;
    wire [1:0] redist10_channel_RXS1_in_in_7_time_in_tpl_4_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist10_channel_RXS1_in_in_7_time_in_tpl_4_wraddr_i = 2'b11;
    wire [2:0] redist10_channel_RXS1_in_in_7_time_in_tpl_4_rdcnt_a;
    wire [2:0] redist10_channel_RXS1_in_in_7_time_in_tpl_4_rdcnt_b;
    logic [2:0] redist10_channel_RXS1_in_in_7_time_in_tpl_4_rdcnt_o;
    wire [2:0] redist10_channel_RXS1_in_in_7_time_in_tpl_4_rdcnt_q;
    wire redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_reset0;
    wire [63:0] redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_ia;
    wire [1:0] redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_aa;
    wire [1:0] redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_ab;
    wire [63:0] redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_iq;
    wire [63:0] redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_q;
    wire [1:0] redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_wraddr_i = 2'b11;
    wire [2:0] redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_rdcnt_a;
    wire [2:0] redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_rdcnt_b;
    logic [2:0] redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_rdcnt_o;
    wire [2:0] redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_rdcnt_q;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // redist9_channel_RXS1_in_in_5_nsc_tpl_4_offset(CONSTANT,100)
    assign redist9_channel_RXS1_in_in_5_nsc_tpl_4_offset_q = $unsigned(2'b11);

    // redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_rdcnt(ADD,109)
    assign redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_rdcnt_a = {1'b0, redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_wraddr_q};
    assign redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_rdcnt_b = {1'b0, redist9_channel_RXS1_in_in_5_nsc_tpl_4_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_rdcnt_o <= $unsigned(redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_rdcnt_a) + $unsigned(redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_rdcnt_b);
        end
    end
    assign redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_rdcnt_q = redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_rdcnt_o[2:0];

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_wraddr(COUNTER,107)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_wraddr_i <= $unsigned(redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_wraddr_q = redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_wraddr_i[1:0];

    // redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem(DUALMEM,106)
    assign redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_ia = $unsigned(in_9_sym_metadata_tpl);
    assign redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_aa = redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_wraddr_q;
    assign redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_ab = redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_rdcnt_q[1:0];
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
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_aa),
        .data_a(redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_ab),
        .q_b(redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_iq),
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
    assign redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_q = redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_iq[63:0];

    // redist11_channel_RXS1_in_in_8_eAxC_tpl_4(DELAY,94)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist11_channel_RXS1_in_in_8_eAxC_tpl_4_delay_0 <= $unsigned(in_8_eAxC_tpl);
            redist11_channel_RXS1_in_in_8_eAxC_tpl_4_delay_1 <= redist11_channel_RXS1_in_in_8_eAxC_tpl_4_delay_0;
            redist11_channel_RXS1_in_in_8_eAxC_tpl_4_delay_2 <= redist11_channel_RXS1_in_in_8_eAxC_tpl_4_delay_1;
            redist11_channel_RXS1_in_in_8_eAxC_tpl_4_q <= redist11_channel_RXS1_in_in_8_eAxC_tpl_4_delay_2;
        end
    end

    // redist10_channel_RXS1_in_in_7_time_in_tpl_4_rdcnt(ADD,105)
    assign redist10_channel_RXS1_in_in_7_time_in_tpl_4_rdcnt_a = {1'b0, redist10_channel_RXS1_in_in_7_time_in_tpl_4_wraddr_q};
    assign redist10_channel_RXS1_in_in_7_time_in_tpl_4_rdcnt_b = {1'b0, redist9_channel_RXS1_in_in_5_nsc_tpl_4_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist10_channel_RXS1_in_in_7_time_in_tpl_4_rdcnt_o <= $unsigned(redist10_channel_RXS1_in_in_7_time_in_tpl_4_rdcnt_a) + $unsigned(redist10_channel_RXS1_in_in_7_time_in_tpl_4_rdcnt_b);
        end
    end
    assign redist10_channel_RXS1_in_in_7_time_in_tpl_4_rdcnt_q = redist10_channel_RXS1_in_in_7_time_in_tpl_4_rdcnt_o[2:0];

    // redist10_channel_RXS1_in_in_7_time_in_tpl_4_wraddr(COUNTER,103)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist10_channel_RXS1_in_in_7_time_in_tpl_4_wraddr_i <= $unsigned(redist10_channel_RXS1_in_in_7_time_in_tpl_4_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist10_channel_RXS1_in_in_7_time_in_tpl_4_wraddr_q = redist10_channel_RXS1_in_in_7_time_in_tpl_4_wraddr_i[1:0];

    // redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem(DUALMEM,102)
    assign redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_ia = $unsigned(in_7_time_in_tpl);
    assign redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_aa = redist10_channel_RXS1_in_in_7_time_in_tpl_4_wraddr_q;
    assign redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_ab = redist10_channel_RXS1_in_in_7_time_in_tpl_4_rdcnt_q[1:0];
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
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_aa),
        .data_a(redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_ab),
        .q_b(redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_iq),
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
    assign redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_q = redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_iq[63:0];

    // redist9_channel_RXS1_in_in_5_nsc_tpl_4_rdcnt(ADD,101)
    assign redist9_channel_RXS1_in_in_5_nsc_tpl_4_rdcnt_a = {1'b0, redist9_channel_RXS1_in_in_5_nsc_tpl_4_wraddr_q};
    assign redist9_channel_RXS1_in_in_5_nsc_tpl_4_rdcnt_b = {1'b0, redist9_channel_RXS1_in_in_5_nsc_tpl_4_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_channel_RXS1_in_in_5_nsc_tpl_4_rdcnt_o <= $unsigned(redist9_channel_RXS1_in_in_5_nsc_tpl_4_rdcnt_a) + $unsigned(redist9_channel_RXS1_in_in_5_nsc_tpl_4_rdcnt_b);
        end
    end
    assign redist9_channel_RXS1_in_in_5_nsc_tpl_4_rdcnt_q = redist9_channel_RXS1_in_in_5_nsc_tpl_4_rdcnt_o[2:0];

    // redist9_channel_RXS1_in_in_5_nsc_tpl_4_wraddr(COUNTER,99)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_channel_RXS1_in_in_5_nsc_tpl_4_wraddr_i <= $unsigned(redist9_channel_RXS1_in_in_5_nsc_tpl_4_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist9_channel_RXS1_in_in_5_nsc_tpl_4_wraddr_q = redist9_channel_RXS1_in_in_5_nsc_tpl_4_wraddr_i[1:0];

    // redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem(DUALMEM,98)
    assign redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_ia = $unsigned(in_5_nsc_tpl);
    assign redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_aa = redist9_channel_RXS1_in_in_5_nsc_tpl_4_wraddr_q;
    assign redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_ab = redist9_channel_RXS1_in_in_5_nsc_tpl_4_rdcnt_q[1:0];
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
    ) redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_aa),
        .data_a(redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_ab),
        .q_b(redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_iq),
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
    assign redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_q = redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_iq[15:0];

    // redist8_channel_RXS1_in_in_3_size_tpl_4(DELAY,91)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_channel_RXS1_in_in_3_size_tpl_4_delay_0 <= $unsigned(in_3_size_tpl);
            redist8_channel_RXS1_in_in_3_size_tpl_4_delay_1 <= redist8_channel_RXS1_in_in_3_size_tpl_4_delay_0;
            redist8_channel_RXS1_in_in_3_size_tpl_4_delay_2 <= redist8_channel_RXS1_in_in_3_size_tpl_4_delay_1;
            redist8_channel_RXS1_in_in_3_size_tpl_4_q <= redist8_channel_RXS1_in_in_3_size_tpl_4_delay_2;
        end
    end

    // Scale1_rnd_bias(CONSTANT,72)
    assign Scale1_rnd_bias_q = $unsigned(2'b01);

    // xMSB_uid49_Shift1(BITSELECT,48)@0
    assign xMSB_uid49_Shift1_b = $unsigned(in_4_imag_din_tpl[28:28]);

    // seMsb_to12_uid67(BITSELECT,66)@0
    assign seMsb_to12_uid67_in = $unsigned({{11{xMSB_uid49_Shift1_b[0]}}, xMSB_uid49_Shift1_b});
    assign seMsb_to12_uid67_b = $unsigned(seMsb_to12_uid67_in[11:0]);

    // rightShiftStage1Idx3Rng12_uid68_Shift1(BITSELECT,67)@0
    assign rightShiftStage1Idx3Rng12_uid68_Shift1_b = $unsigned(rightShiftStage0_uid60_Shift1_q[28:12]);

    // rightShiftStage1Idx3_uid69_Shift1(BITJOIN,68)@0
    assign rightShiftStage1Idx3_uid69_Shift1_q = {seMsb_to12_uid67_b, rightShiftStage1Idx3Rng12_uid68_Shift1_b};

    // seMsb_to8_uid64(BITSELECT,63)@0
    assign seMsb_to8_uid64_in = $unsigned({{7{xMSB_uid49_Shift1_b[0]}}, xMSB_uid49_Shift1_b});
    assign seMsb_to8_uid64_b = $unsigned(seMsb_to8_uid64_in[7:0]);

    // rightShiftStage1Idx2Rng8_uid65_Shift1(BITSELECT,64)@0
    assign rightShiftStage1Idx2Rng8_uid65_Shift1_b = $unsigned(rightShiftStage0_uid60_Shift1_q[28:8]);

    // rightShiftStage1Idx2_uid66_Shift1(BITJOIN,65)@0
    assign rightShiftStage1Idx2_uid66_Shift1_q = {seMsb_to8_uid64_b, rightShiftStage1Idx2Rng8_uid65_Shift1_b};

    // seMsb_to4_uid61(BITSELECT,60)@0
    assign seMsb_to4_uid61_in = $unsigned({{3{xMSB_uid49_Shift1_b[0]}}, xMSB_uid49_Shift1_b});
    assign seMsb_to4_uid61_b = $unsigned(seMsb_to4_uid61_in[3:0]);

    // rightShiftStage1Idx1Rng4_uid62_Shift1(BITSELECT,61)@0
    assign rightShiftStage1Idx1Rng4_uid62_Shift1_b = $unsigned(rightShiftStage0_uid60_Shift1_q[28:4]);

    // rightShiftStage1Idx1_uid63_Shift1(BITJOIN,62)@0
    assign rightShiftStage1Idx1_uid63_Shift1_q = {seMsb_to4_uid61_b, rightShiftStage1Idx1Rng4_uid62_Shift1_b};

    // seMsb_to3_uid56(BITSELECT,55)@0
    assign seMsb_to3_uid56_in = $unsigned({{2{xMSB_uid49_Shift1_b[0]}}, xMSB_uid49_Shift1_b});
    assign seMsb_to3_uid56_b = $unsigned(seMsb_to3_uid56_in[2:0]);

    // rightShiftStage0Idx3Rng3_uid57_Shift1(BITSELECT,56)@0
    assign rightShiftStage0Idx3Rng3_uid57_Shift1_b = $unsigned(in_4_imag_din_tpl[28:3]);

    // rightShiftStage0Idx3_uid58_Shift1(BITJOIN,57)@0
    assign rightShiftStage0Idx3_uid58_Shift1_q = {seMsb_to3_uid56_b, rightShiftStage0Idx3Rng3_uid57_Shift1_b};

    // seMsb_to2_uid53(BITSELECT,52)@0
    assign seMsb_to2_uid53_in = $unsigned({{1{xMSB_uid49_Shift1_b[0]}}, xMSB_uid49_Shift1_b});
    assign seMsb_to2_uid53_b = $unsigned(seMsb_to2_uid53_in[1:0]);

    // rightShiftStage0Idx2Rng2_uid54_Shift1(BITSELECT,53)@0
    assign rightShiftStage0Idx2Rng2_uid54_Shift1_b = $unsigned(in_4_imag_din_tpl[28:2]);

    // rightShiftStage0Idx2_uid55_Shift1(BITJOIN,54)@0
    assign rightShiftStage0Idx2_uid55_Shift1_q = {seMsb_to2_uid53_b, rightShiftStage0Idx2Rng2_uid54_Shift1_b};

    // rightShiftStage0Idx1Rng1_uid51_Shift1(BITSELECT,50)@0
    assign rightShiftStage0Idx1Rng1_uid51_Shift1_b = $unsigned(in_4_imag_din_tpl[28:1]);

    // rightShiftStage0Idx1_uid52_Shift1(BITJOIN,51)@0
    assign rightShiftStage0Idx1_uid52_Shift1_q = {xMSB_uid49_Shift1_b, rightShiftStage0Idx1Rng1_uid51_Shift1_b};

    // rightShiftStage0_uid60_Shift1(MUX,59)@0
    assign rightShiftStage0_uid60_Shift1_s = rightShiftStageSel0Dto0_uid35_Shift_bit_select_merged_b;
    always @(rightShiftStage0_uid60_Shift1_s or in_4_imag_din_tpl or rightShiftStage0Idx1_uid52_Shift1_q or rightShiftStage0Idx2_uid55_Shift1_q or rightShiftStage0Idx3_uid58_Shift1_q)
    begin
        unique case (rightShiftStage0_uid60_Shift1_s)
            2'b00 : rightShiftStage0_uid60_Shift1_q = in_4_imag_din_tpl;
            2'b01 : rightShiftStage0_uid60_Shift1_q = rightShiftStage0Idx1_uid52_Shift1_q;
            2'b10 : rightShiftStage0_uid60_Shift1_q = rightShiftStage0Idx2_uid55_Shift1_q;
            2'b11 : rightShiftStage0_uid60_Shift1_q = rightShiftStage0Idx3_uid58_Shift1_q;
            default : rightShiftStage0_uid60_Shift1_q = 29'b0;
        endcase
    end

    // rightShiftStageSel0Dto0_uid35_Shift_bit_select_merged(BITSELECT,82)@0
    assign rightShiftStageSel0Dto0_uid35_Shift_bit_select_merged_b = in_6_fft_shift_tpl[1:0];
    assign rightShiftStageSel0Dto0_uid35_Shift_bit_select_merged_c = in_6_fft_shift_tpl[3:2];

    // rightShiftStage1_uid71_Shift1(MUX,70)@0
    assign rightShiftStage1_uid71_Shift1_s = rightShiftStageSel0Dto0_uid35_Shift_bit_select_merged_c;
    always @(rightShiftStage1_uid71_Shift1_s or rightShiftStage0_uid60_Shift1_q or rightShiftStage1Idx1_uid63_Shift1_q or rightShiftStage1Idx2_uid66_Shift1_q or rightShiftStage1Idx3_uid69_Shift1_q)
    begin
        unique case (rightShiftStage1_uid71_Shift1_s)
            2'b00 : rightShiftStage1_uid71_Shift1_q = rightShiftStage0_uid60_Shift1_q;
            2'b01 : rightShiftStage1_uid71_Shift1_q = rightShiftStage1Idx1_uid63_Shift1_q;
            2'b10 : rightShiftStage1_uid71_Shift1_q = rightShiftStage1Idx2_uid66_Shift1_q;
            2'b11 : rightShiftStage1_uid71_Shift1_q = rightShiftStage1Idx3_uid69_Shift1_q;
            default : rightShiftStage1_uid71_Shift1_q = 29'b0;
        endcase
    end

    // Scale2_rnd_trunc(BITSHIFT,78)@0
    assign Scale2_rnd_trunc_qint = rightShiftStage1_uid71_Shift1_q;
    assign Scale2_rnd_trunc_q = Scale2_rnd_trunc_qint[28:2];

    // redist1_Scale2_rnd_trunc_q_1(DELAY,84)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_Scale2_rnd_trunc_q_1_q <= $unsigned(Scale2_rnd_trunc_q);
        end
    end

    // Scale2_rnd_add(ADD,79)@1
    assign Scale2_rnd_add_a = $unsigned({{1{redist1_Scale2_rnd_trunc_q_1_q[26]}}, redist1_Scale2_rnd_trunc_q_1_q});
    assign Scale2_rnd_add_b = $unsigned({{26{Scale1_rnd_bias_q[1]}}, Scale1_rnd_bias_q});
    assign Scale2_rnd_add_o = $unsigned($signed(Scale2_rnd_add_a) + $signed(Scale2_rnd_add_b));
    assign Scale2_rnd_add_q = Scale2_rnd_add_o[27:0];

    // Scale2_rnd_shift(BITSHIFT,80)@1
    assign Scale2_rnd_shift_qint = Scale2_rnd_add_q;
    assign Scale2_rnd_shift_q = Scale2_rnd_shift_qint[27:1];

    // redist0_Scale2_rnd_shift_q_1(DELAY,83)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_Scale2_rnd_shift_q_1_q <= $unsigned(Scale2_rnd_shift_q);
        end
    end

    // Scale2_sel_x(BITSELECT,19)@2
    assign Scale2_sel_x_b = $unsigned(redist0_Scale2_rnd_shift_q_1_q[15:0]);

    // redist4_Scale2_sel_x_b_1(DELAY,87)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_Scale2_sel_x_b_1_q <= $unsigned(Scale2_sel_x_b);
        end
    end

    // Scale1_hconst(CONSTANT,3)
    assign Scale1_hconst_q = $unsigned(16'b0111111111111111);

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // Scale2_hcmp(COMPARE,8)@2 + 1
    assign Scale2_hcmp_a = $unsigned({{13{Scale1_hconst_q[15]}}, Scale1_hconst_q});
    assign Scale2_hcmp_b = $unsigned({{2{redist0_Scale2_rnd_shift_q_1_q[26]}}, redist0_Scale2_rnd_shift_q_1_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Scale2_hcmp_o <= $unsigned($signed(Scale2_hcmp_a) - $signed(Scale2_hcmp_b));
        end
    end
    assign Scale2_hcmp_n[0] = ~ (Scale2_hcmp_o[28]);

    // dupName_1_Scale2_x(LOGICAL,23)@3
    assign dupName_1_Scale2_x_q = ~ (Scale2_hcmp_n);

    // Scale1_lconst(CONSTANT,5)
    assign Scale1_lconst_q = $unsigned(16'b1000000000000001);

    // Scale2_lcmp(COMPARE,10)@2 + 1
    assign Scale2_lcmp_a = $unsigned({{2{redist0_Scale2_rnd_shift_q_1_q[26]}}, redist0_Scale2_rnd_shift_q_1_q});
    assign Scale2_lcmp_b = $unsigned({{13{Scale1_lconst_q[15]}}, Scale1_lconst_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Scale2_lcmp_o <= $unsigned($signed(Scale2_lcmp_a) - $signed(Scale2_lcmp_b));
        end
    end
    assign Scale2_lcmp_n[0] = ~ (Scale2_lcmp_o[28]);

    // dupName_0_Scale2_x(LOGICAL,21)@3
    assign dupName_0_Scale2_x_q = ~ (Scale2_lcmp_n);

    // Scale2_mux(SELECTOR,12)@3
    always @(dupName_0_Scale2_x_q or Scale1_lconst_q or dupName_1_Scale2_x_q or Scale1_hconst_q or redist4_Scale2_sel_x_b_1_q)
    begin
        Scale2_mux_q = $unsigned(redist4_Scale2_sel_x_b_1_q);
        if (dupName_1_Scale2_x_q == 1'b1)
        begin
            Scale2_mux_q = $unsigned(Scale1_hconst_q);
        end
        if (dupName_0_Scale2_x_q == 1'b1)
        begin
            Scale2_mux_q = $unsigned(Scale1_lconst_q);
        end
    end

    // redist13_Scale2_mux_q_1(DELAY,96)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_Scale2_mux_q_1_q <= $unsigned(Scale2_mux_q);
        end
    end

    // xMSB_uid25_Shift(BITSELECT,24)@0
    assign xMSB_uid25_Shift_b = $unsigned(in_4_real_din_tpl[28:28]);

    // seMsb_to12_uid43(BITSELECT,42)@0
    assign seMsb_to12_uid43_in = $unsigned({{11{xMSB_uid25_Shift_b[0]}}, xMSB_uid25_Shift_b});
    assign seMsb_to12_uid43_b = $unsigned(seMsb_to12_uid43_in[11:0]);

    // rightShiftStage1Idx3Rng12_uid44_Shift(BITSELECT,43)@0
    assign rightShiftStage1Idx3Rng12_uid44_Shift_b = $unsigned(rightShiftStage0_uid36_Shift_q[28:12]);

    // rightShiftStage1Idx3_uid45_Shift(BITJOIN,44)@0
    assign rightShiftStage1Idx3_uid45_Shift_q = {seMsb_to12_uid43_b, rightShiftStage1Idx3Rng12_uid44_Shift_b};

    // seMsb_to8_uid40(BITSELECT,39)@0
    assign seMsb_to8_uid40_in = $unsigned({{7{xMSB_uid25_Shift_b[0]}}, xMSB_uid25_Shift_b});
    assign seMsb_to8_uid40_b = $unsigned(seMsb_to8_uid40_in[7:0]);

    // rightShiftStage1Idx2Rng8_uid41_Shift(BITSELECT,40)@0
    assign rightShiftStage1Idx2Rng8_uid41_Shift_b = $unsigned(rightShiftStage0_uid36_Shift_q[28:8]);

    // rightShiftStage1Idx2_uid42_Shift(BITJOIN,41)@0
    assign rightShiftStage1Idx2_uid42_Shift_q = {seMsb_to8_uid40_b, rightShiftStage1Idx2Rng8_uid41_Shift_b};

    // seMsb_to4_uid37(BITSELECT,36)@0
    assign seMsb_to4_uid37_in = $unsigned({{3{xMSB_uid25_Shift_b[0]}}, xMSB_uid25_Shift_b});
    assign seMsb_to4_uid37_b = $unsigned(seMsb_to4_uid37_in[3:0]);

    // rightShiftStage1Idx1Rng4_uid38_Shift(BITSELECT,37)@0
    assign rightShiftStage1Idx1Rng4_uid38_Shift_b = $unsigned(rightShiftStage0_uid36_Shift_q[28:4]);

    // rightShiftStage1Idx1_uid39_Shift(BITJOIN,38)@0
    assign rightShiftStage1Idx1_uid39_Shift_q = {seMsb_to4_uid37_b, rightShiftStage1Idx1Rng4_uid38_Shift_b};

    // seMsb_to3_uid32(BITSELECT,31)@0
    assign seMsb_to3_uid32_in = $unsigned({{2{xMSB_uid25_Shift_b[0]}}, xMSB_uid25_Shift_b});
    assign seMsb_to3_uid32_b = $unsigned(seMsb_to3_uid32_in[2:0]);

    // rightShiftStage0Idx3Rng3_uid33_Shift(BITSELECT,32)@0
    assign rightShiftStage0Idx3Rng3_uid33_Shift_b = $unsigned(in_4_real_din_tpl[28:3]);

    // rightShiftStage0Idx3_uid34_Shift(BITJOIN,33)@0
    assign rightShiftStage0Idx3_uid34_Shift_q = {seMsb_to3_uid32_b, rightShiftStage0Idx3Rng3_uid33_Shift_b};

    // seMsb_to2_uid29(BITSELECT,28)@0
    assign seMsb_to2_uid29_in = $unsigned({{1{xMSB_uid25_Shift_b[0]}}, xMSB_uid25_Shift_b});
    assign seMsb_to2_uid29_b = $unsigned(seMsb_to2_uid29_in[1:0]);

    // rightShiftStage0Idx2Rng2_uid30_Shift(BITSELECT,29)@0
    assign rightShiftStage0Idx2Rng2_uid30_Shift_b = $unsigned(in_4_real_din_tpl[28:2]);

    // rightShiftStage0Idx2_uid31_Shift(BITJOIN,30)@0
    assign rightShiftStage0Idx2_uid31_Shift_q = {seMsb_to2_uid29_b, rightShiftStage0Idx2Rng2_uid30_Shift_b};

    // rightShiftStage0Idx1Rng1_uid27_Shift(BITSELECT,26)@0
    assign rightShiftStage0Idx1Rng1_uid27_Shift_b = $unsigned(in_4_real_din_tpl[28:1]);

    // rightShiftStage0Idx1_uid28_Shift(BITJOIN,27)@0
    assign rightShiftStage0Idx1_uid28_Shift_q = {xMSB_uid25_Shift_b, rightShiftStage0Idx1Rng1_uid27_Shift_b};

    // rightShiftStage0_uid36_Shift(MUX,35)@0
    assign rightShiftStage0_uid36_Shift_s = rightShiftStageSel0Dto0_uid35_Shift_bit_select_merged_b;
    always @(rightShiftStage0_uid36_Shift_s or in_4_real_din_tpl or rightShiftStage0Idx1_uid28_Shift_q or rightShiftStage0Idx2_uid31_Shift_q or rightShiftStage0Idx3_uid34_Shift_q)
    begin
        unique case (rightShiftStage0_uid36_Shift_s)
            2'b00 : rightShiftStage0_uid36_Shift_q = in_4_real_din_tpl;
            2'b01 : rightShiftStage0_uid36_Shift_q = rightShiftStage0Idx1_uid28_Shift_q;
            2'b10 : rightShiftStage0_uid36_Shift_q = rightShiftStage0Idx2_uid31_Shift_q;
            2'b11 : rightShiftStage0_uid36_Shift_q = rightShiftStage0Idx3_uid34_Shift_q;
            default : rightShiftStage0_uid36_Shift_q = 29'b0;
        endcase
    end

    // rightShiftStage1_uid47_Shift(MUX,46)@0
    assign rightShiftStage1_uid47_Shift_s = rightShiftStageSel0Dto0_uid35_Shift_bit_select_merged_c;
    always @(rightShiftStage1_uid47_Shift_s or rightShiftStage0_uid36_Shift_q or rightShiftStage1Idx1_uid39_Shift_q or rightShiftStage1Idx2_uid42_Shift_q or rightShiftStage1Idx3_uid45_Shift_q)
    begin
        unique case (rightShiftStage1_uid47_Shift_s)
            2'b00 : rightShiftStage1_uid47_Shift_q = rightShiftStage0_uid36_Shift_q;
            2'b01 : rightShiftStage1_uid47_Shift_q = rightShiftStage1Idx1_uid39_Shift_q;
            2'b10 : rightShiftStage1_uid47_Shift_q = rightShiftStage1Idx2_uid42_Shift_q;
            2'b11 : rightShiftStage1_uid47_Shift_q = rightShiftStage1Idx3_uid45_Shift_q;
            default : rightShiftStage1_uid47_Shift_q = 29'b0;
        endcase
    end

    // Scale1_rnd_trunc(BITSHIFT,73)@0
    assign Scale1_rnd_trunc_qint = rightShiftStage1_uid47_Shift_q;
    assign Scale1_rnd_trunc_q = Scale1_rnd_trunc_qint[28:2];

    // redist3_Scale1_rnd_trunc_q_1(DELAY,86)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_Scale1_rnd_trunc_q_1_q <= $unsigned(Scale1_rnd_trunc_q);
        end
    end

    // Scale1_rnd_add(ADD,74)@1
    assign Scale1_rnd_add_a = $unsigned({{1{redist3_Scale1_rnd_trunc_q_1_q[26]}}, redist3_Scale1_rnd_trunc_q_1_q});
    assign Scale1_rnd_add_b = $unsigned({{26{Scale1_rnd_bias_q[1]}}, Scale1_rnd_bias_q});
    assign Scale1_rnd_add_o = $unsigned($signed(Scale1_rnd_add_a) + $signed(Scale1_rnd_add_b));
    assign Scale1_rnd_add_q = Scale1_rnd_add_o[27:0];

    // Scale1_rnd_shift(BITSHIFT,75)@1
    assign Scale1_rnd_shift_qint = Scale1_rnd_add_q;
    assign Scale1_rnd_shift_q = Scale1_rnd_shift_qint[27:1];

    // redist2_Scale1_rnd_shift_q_1(DELAY,85)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_Scale1_rnd_shift_q_1_q <= $unsigned(Scale1_rnd_shift_q);
        end
    end

    // Scale1_sel_x(BITSELECT,18)@2
    assign Scale1_sel_x_b = $unsigned(redist2_Scale1_rnd_shift_q_1_q[15:0]);

    // redist5_Scale1_sel_x_b_1(DELAY,88)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_Scale1_sel_x_b_1_q <= $unsigned(Scale1_sel_x_b);
        end
    end

    // Scale1_hcmp(COMPARE,2)@2 + 1
    assign Scale1_hcmp_a = $unsigned({{13{Scale1_hconst_q[15]}}, Scale1_hconst_q});
    assign Scale1_hcmp_b = $unsigned({{2{redist2_Scale1_rnd_shift_q_1_q[26]}}, redist2_Scale1_rnd_shift_q_1_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Scale1_hcmp_o <= $unsigned($signed(Scale1_hcmp_a) - $signed(Scale1_hcmp_b));
        end
    end
    assign Scale1_hcmp_n[0] = ~ (Scale1_hcmp_o[28]);

    // dupName_1_Scale1_x(LOGICAL,22)@3
    assign dupName_1_Scale1_x_q = ~ (Scale1_hcmp_n);

    // Scale1_lcmp(COMPARE,4)@2 + 1
    assign Scale1_lcmp_a = $unsigned({{2{redist2_Scale1_rnd_shift_q_1_q[26]}}, redist2_Scale1_rnd_shift_q_1_q});
    assign Scale1_lcmp_b = $unsigned({{13{Scale1_lconst_q[15]}}, Scale1_lconst_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Scale1_lcmp_o <= $unsigned($signed(Scale1_lcmp_a) - $signed(Scale1_lcmp_b));
        end
    end
    assign Scale1_lcmp_n[0] = ~ (Scale1_lcmp_o[28]);

    // dupName_0_Scale1_x(LOGICAL,20)@3
    assign dupName_0_Scale1_x_q = ~ (Scale1_lcmp_n);

    // Scale1_mux(SELECTOR,6)@3
    always @(dupName_0_Scale1_x_q or Scale1_lconst_q or dupName_1_Scale1_x_q or Scale1_hconst_q or redist5_Scale1_sel_x_b_1_q)
    begin
        Scale1_mux_q = $unsigned(redist5_Scale1_sel_x_b_1_q);
        if (dupName_1_Scale1_x_q == 1'b1)
        begin
            Scale1_mux_q = $unsigned(Scale1_hconst_q);
        end
        if (dupName_0_Scale1_x_q == 1'b1)
        begin
            Scale1_mux_q = $unsigned(Scale1_lconst_q);
        end
    end

    // redist14_Scale1_mux_q_1(DELAY,97)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist14_Scale1_mux_q_1_q <= $unsigned(Scale1_mux_q);
        end
    end

    // redist7_channel_RXS1_in_in_2_chin_tpl_4(DELAY,90)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist7_channel_RXS1_in_in_2_chin_tpl_4_delay_0 <= $unsigned(in_2_chin_tpl);
            redist7_channel_RXS1_in_in_2_chin_tpl_4_delay_1 <= redist7_channel_RXS1_in_in_2_chin_tpl_4_delay_0;
            redist7_channel_RXS1_in_in_2_chin_tpl_4_delay_2 <= redist7_channel_RXS1_in_in_2_chin_tpl_4_delay_1;
            redist7_channel_RXS1_in_in_2_chin_tpl_4_q <= redist7_channel_RXS1_in_in_2_chin_tpl_4_delay_2;
        end
    end

    // redist6_channel_RXS1_in_in_1_vin_tpl_4(DELAY,89)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist6_channel_RXS1_in_in_1_vin_tpl_4_delay_0 <= '0;
        end
        else
        begin
            redist6_channel_RXS1_in_in_1_vin_tpl_4_delay_0 <= $unsigned(in_1_vin_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_channel_RXS1_in_in_1_vin_tpl_4_delay_1 <= redist6_channel_RXS1_in_in_1_vin_tpl_4_delay_0;
            redist6_channel_RXS1_in_in_1_vin_tpl_4_delay_2 <= redist6_channel_RXS1_in_in_1_vin_tpl_4_delay_1;
            redist6_channel_RXS1_in_in_1_vin_tpl_4_q <= redist6_channel_RXS1_in_in_1_vin_tpl_4_delay_2;
        end
    end

    // channel_RXS1_out(PORTOUT,17)@4 + 1
    assign out_1_vout_tpl = redist6_channel_RXS1_in_in_1_vin_tpl_4_q;
    assign out_2_chout_tpl = redist7_channel_RXS1_in_in_2_chin_tpl_4_q;
    assign out_3_real_dout_tpl = redist14_Scale1_mux_q_1_q;
    assign out_3_imag_dout_tpl = redist13_Scale2_mux_q_1_q;
    assign out_4_size_out_tpl = redist8_channel_RXS1_in_in_3_size_tpl_4_q;
    assign out_5_nsc_out_tpl = redist9_channel_RXS1_in_in_5_nsc_tpl_4_mem_q;
    assign out_6_time_out_tpl = redist10_channel_RXS1_in_in_7_time_in_tpl_4_mem_q;
    assign out_7_eAxCout_tpl = redist11_channel_RXS1_in_in_8_eAxC_tpl_4_q;
    assign out_8_sym_metadataout_tpl = redist12_channel_RXS1_in_in_9_sym_metadata_tpl_4_mem_q;

endmodule
