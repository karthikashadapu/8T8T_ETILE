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

// SystemVerilog created from prach_shortFormat_fftShift_prach_PRACH_CC_RemoveCP
// SystemVerilog created on Wed Nov  6 19:28:32 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module prach_shortFormat_fftShift_prach_PRACH_CC_RemoveCP (
    input wire [0:0] in_2_vin_tpl,
    input wire [7:0] in_3_chin_tpl,
    input wire [15:0] in_1_real_din_tpl,
    input wire [15:0] in_1_imag_din_tpl,
    input wire [25:0] in_4_CPLen_tpl,
    input wire [3:0] in_5_FFTSize_tpl,
    input wire [3:0] in_6_NumberOfFFTs_tpl,
    input wire [0:0] in_7_SOP_tpl,
    input wire [7:0] in_8_BW_x_10_x_tpl,
    input wire [28:0] in_9_TimeReference_tpl,
    output wire [0:0] out_1_vout_tpl,
    output wire [7:0] out_2_cout_tpl,
    output wire [15:0] out_3_real_dout_tpl,
    output wire [15:0] out_3_imag_dout_tpl,
    output wire [3:0] out_4_qFFTSize_tpl,
    output wire [0:0] out_5_qSOP_tpl,
    output wire [7:0] out_6_qBWby10_tpl,
    output wire [28:0] out_7_T_ref_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [0:0] And_rsrvd_fix_q;
    wire [0:0] And1_qi;
    reg [0:0] And1_q;
    wire [12:0] Const1_q;
    wire [25:0] Const2_q;
    reg [0:0] CPLoop_vunroll_x_running;
    reg [0:0] CPLoop_vunroll_x_pending;
    reg [0:0] CPLoop_vunroll_x_v;
    reg [25:0] CPLoop_vunroll_x_q0;
    reg [25:0] CPLoop_vunroll_x_e0;
    wire [0:0] CPLoop_vunroll_x_f0;
    wire [0:0] CPLoop_vunroll_x_l0;
    reg [25:0] CPLoop_vunroll_x_q1;
    reg [25:0] CPLoop_vunroll_x_e1;
    wire [0:0] CPLoop_vunroll_x_f1;
    wire [0:0] CPLoop_vunroll_x_l1;
    wire [12:0] Convert_sel_x_b;
    wire [7:0] Convert1_sel_x_b;
    reg [0:0] FFTLoop_vunroll_x_running;
    reg [0:0] FFTLoop_vunroll_x_pending;
    reg [0:0] FFTLoop_vunroll_x_v;
    reg [12:0] FFTLoop_vunroll_x_q0;
    reg [12:0] FFTLoop_vunroll_x_e0;
    wire [0:0] FFTLoop_vunroll_x_f0;
    wire [0:0] FFTLoop_vunroll_x_l0;
    reg [12:0] FFTLoop_vunroll_x_q1;
    reg [12:0] FFTLoop_vunroll_x_e1;
    wire [0:0] FFTLoop_vunroll_x_f1;
    wire [0:0] FFTLoop_vunroll_x_l1;
    reg [12:0] FFTLoop_vunroll_x_q2;
    reg [12:0] FFTLoop_vunroll_x_e2;
    wire [0:0] FFTLoop_vunroll_x_f2;
    wire [0:0] FFTLoop_vunroll_x_l2;
    wire [11:0] cz_uid25_LShift1_q;
    wire [1:0] leftShiftStage0_uid37_LShift1_s;
    reg [12:0] leftShiftStage0_uid37_LShift1_q;
    wire [3:0] leftShiftStage1Idx1Pad4_uid38_LShift1_q;
    wire [8:0] leftShiftStage1Idx1Rng4_uid39_LShift1_in;
    wire [8:0] leftShiftStage1Idx1Rng4_uid39_LShift1_b;
    wire [12:0] leftShiftStage1Idx1_uid40_LShift1_q;
    wire [7:0] leftShiftStage1Idx2Pad8_uid41_LShift1_q;
    wire [4:0] leftShiftStage1Idx2Rng8_uid42_LShift1_in;
    wire [4:0] leftShiftStage1Idx2Rng8_uid42_LShift1_b;
    wire [12:0] leftShiftStage1Idx2_uid43_LShift1_q;
    wire [0:0] leftShiftStage1Idx3Rng12_uid45_LShift1_in;
    wire [0:0] leftShiftStage1Idx3Rng12_uid45_LShift1_b;
    wire [12:0] leftShiftStage1Idx3_uid46_LShift1_q;
    wire [1:0] leftShiftStage1_uid48_LShift1_s;
    reg [12:0] leftShiftStage1_uid48_LShift1_q;
    wire [1:0] leftShiftStageSel0Dto0_uid36_LShift1_bit_select_merged_b;
    wire [1:0] leftShiftStageSel0Dto0_uid36_LShift1_bit_select_merged_c;
    wire [12:0] xPadded_uid26_LShift1_q_const_q;
    wire [12:0] leftShiftStage0Idx1_uid29_LShift1_q_const_q;
    wire [12:0] leftShiftStage0Idx3_uid35_LShift1_q_const_q;
    reg [7:0] redist0_Convert1_sel_x_b_1_q;
    reg [0:0] redist1_ChannelIn_cunroll_x_in_2_vin_tpl_1_q;
    reg [15:0] redist2_ChannelIn_cunroll_x_in_1_real_din_tpl_2_q;
    reg [15:0] redist2_ChannelIn_cunroll_x_in_1_real_din_tpl_2_delay_0;
    reg [15:0] redist3_ChannelIn_cunroll_x_in_1_imag_din_tpl_2_q;
    reg [15:0] redist3_ChannelIn_cunroll_x_in_1_imag_din_tpl_2_delay_0;
    reg [3:0] redist4_ChannelIn_cunroll_x_in_5_FFTSize_tpl_2_q;
    reg [3:0] redist4_ChannelIn_cunroll_x_in_5_FFTSize_tpl_2_delay_0;
    reg [7:0] redist5_ChannelIn_cunroll_x_in_8_BW_x_10_x_tpl_2_q;
    reg [7:0] redist5_ChannelIn_cunroll_x_in_8_BW_x_10_x_tpl_2_delay_0;
    reg [28:0] redist6_ChannelIn_cunroll_x_in_9_TimeReference_tpl_2_q;
    reg [28:0] redist6_ChannelIn_cunroll_x_in_9_TimeReference_tpl_2_delay_0;
    reg [0:0] redist7_And_rsrvd_fix_q_2_q;
    reg [0:0] redist7_And_rsrvd_fix_q_2_delay_0;

    import prach_shortFormat_fftShift_prach_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist6_ChannelIn_cunroll_x_in_9_TimeReference_tpl_2(DELAY,63)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_ChannelIn_cunroll_x_in_9_TimeReference_tpl_2_delay_0 <= $unsigned(in_9_TimeReference_tpl);
            redist6_ChannelIn_cunroll_x_in_9_TimeReference_tpl_2_q <= redist6_ChannelIn_cunroll_x_in_9_TimeReference_tpl_2_delay_0;
        end
    end

    // redist5_ChannelIn_cunroll_x_in_8_BW_x_10_x_tpl_2(DELAY,62)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_ChannelIn_cunroll_x_in_8_BW_x_10_x_tpl_2_delay_0 <= $unsigned(in_8_BW_x_10_x_tpl);
            redist5_ChannelIn_cunroll_x_in_8_BW_x_10_x_tpl_2_q <= redist5_ChannelIn_cunroll_x_in_8_BW_x_10_x_tpl_2_delay_0;
        end
    end

    // Const2(CONSTANT,6)
    assign Const2_q = $unsigned(26'b00000000000000000000000100);

    // CPLoop_vunroll_x(LOOP,12)@0 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            CPLoop_vunroll_x_running <= $unsigned(1'b0);
            CPLoop_vunroll_x_pending <= $unsigned(1'b0);
            CPLoop_vunroll_x_q0 <= 26'b0;
            CPLoop_vunroll_x_e0 <= '1;
            CPLoop_vunroll_x_q1 <= 26'b0;
            CPLoop_vunroll_x_e1 <= '1;
            CPLoop_vunroll_x_v <= $unsigned(1'b0);
        end
        else
        begin
            CPLoop_vunroll_x_v <= $unsigned(1'b0);
            if (in_7_SOP_tpl == 1'b1)
            begin
                CPLoop_vunroll_x_e0 <= $unsigned(in_4_CPLen_tpl) - $unsigned(26'd1);
                CPLoop_vunroll_x_q0 <= 26'b0;
                CPLoop_vunroll_x_e1 <= $unsigned(Const2_q) - $unsigned(26'd1);
                CPLoop_vunroll_x_q1 <= 26'b0;
                CPLoop_vunroll_x_running <= $unsigned(1'b1);
                if (in_2_vin_tpl == 1'b1)
                begin
                    CPLoop_vunroll_x_pending <= $unsigned(1'b0);
                    CPLoop_vunroll_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    CPLoop_vunroll_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (in_2_vin_tpl == 1'b1)
                begin
                    if (CPLoop_vunroll_x_pending == 1'b1)
                    begin
                        CPLoop_vunroll_x_v <= $unsigned(1'b1);
                    end
                    else if (CPLoop_vunroll_x_running == 1'b1)
                    begin
                        CPLoop_vunroll_x_v <= $unsigned(1'b1);
                        if (CPLoop_vunroll_x_q1 == CPLoop_vunroll_x_e1)
                        begin
                            CPLoop_vunroll_x_q1 <= 26'b0;
                            if (CPLoop_vunroll_x_q0 == CPLoop_vunroll_x_e0)
                            begin
                                CPLoop_vunroll_x_q0 <= 26'b0;
                                CPLoop_vunroll_x_running <= $unsigned(1'b0);
                                CPLoop_vunroll_x_v <= $unsigned(1'b0);
                            end
                            else
                            begin
                                CPLoop_vunroll_x_q0 <= $unsigned(CPLoop_vunroll_x_q0) + $unsigned(26'd1);
                            end
                        end
                        else
                        begin
                            CPLoop_vunroll_x_q1 <= $unsigned(CPLoop_vunroll_x_q1) + $unsigned(26'd1);
                        end
                    end
                    CPLoop_vunroll_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign CPLoop_vunroll_x_f1 = $unsigned(CPLoop_vunroll_x_q1 == 26'b00000000000000000000000000 ? 1'b1 : 1'b0);
    assign CPLoop_vunroll_x_l1 = $unsigned(CPLoop_vunroll_x_q1 == CPLoop_vunroll_x_e1 ? 1'b1 : 1'b0);
    assign CPLoop_vunroll_x_f0 = $unsigned(CPLoop_vunroll_x_q0 == 26'b00000000000000000000000000 ? 1'b1 : 1'b0);
    assign CPLoop_vunroll_x_l0 = $unsigned(CPLoop_vunroll_x_q0 == CPLoop_vunroll_x_e0 ? 1'b1 : 1'b0);

    // And_rsrvd_fix(LOGICAL,3)@1
    assign And_rsrvd_fix_q = CPLoop_vunroll_x_l0 & CPLoop_vunroll_x_l1;

    // redist7_And_rsrvd_fix_q_2(DELAY,64)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist7_And_rsrvd_fix_q_2_delay_0 <= $unsigned(And_rsrvd_fix_q);
            redist7_And_rsrvd_fix_q_2_q <= redist7_And_rsrvd_fix_q_2_delay_0;
        end
    end

    // redist4_ChannelIn_cunroll_x_in_5_FFTSize_tpl_2(DELAY,61)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_ChannelIn_cunroll_x_in_5_FFTSize_tpl_2_delay_0 <= $unsigned(in_5_FFTSize_tpl);
            redist4_ChannelIn_cunroll_x_in_5_FFTSize_tpl_2_q <= redist4_ChannelIn_cunroll_x_in_5_FFTSize_tpl_2_delay_0;
        end
    end

    // redist3_ChannelIn_cunroll_x_in_1_imag_din_tpl_2(DELAY,60)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_ChannelIn_cunroll_x_in_1_imag_din_tpl_2_delay_0 <= $unsigned(in_1_imag_din_tpl);
            redist3_ChannelIn_cunroll_x_in_1_imag_din_tpl_2_q <= redist3_ChannelIn_cunroll_x_in_1_imag_din_tpl_2_delay_0;
        end
    end

    // redist2_ChannelIn_cunroll_x_in_1_real_din_tpl_2(DELAY,59)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_ChannelIn_cunroll_x_in_1_real_din_tpl_2_delay_0 <= $unsigned(in_1_real_din_tpl);
            redist2_ChannelIn_cunroll_x_in_1_real_din_tpl_2_q <= redist2_ChannelIn_cunroll_x_in_1_real_din_tpl_2_delay_0;
        end
    end

    // Const1(CONSTANT,5)
    assign Const1_q = $unsigned(13'b0000000000100);

    // leftShiftStage1Idx3Rng12_uid45_LShift1(BITSELECT,44)@0
    assign leftShiftStage1Idx3Rng12_uid45_LShift1_in = leftShiftStage0_uid37_LShift1_q[0:0];
    assign leftShiftStage1Idx3Rng12_uid45_LShift1_b = leftShiftStage1Idx3Rng12_uid45_LShift1_in[0:0];

    // cz_uid25_LShift1(CONSTANT,24)
    assign cz_uid25_LShift1_q = $unsigned(12'b000000000000);

    // leftShiftStage1Idx3_uid46_LShift1(BITJOIN,45)@0
    assign leftShiftStage1Idx3_uid46_LShift1_q = {leftShiftStage1Idx3Rng12_uid45_LShift1_b, cz_uid25_LShift1_q};

    // leftShiftStage1Idx2Rng8_uid42_LShift1(BITSELECT,41)@0
    assign leftShiftStage1Idx2Rng8_uid42_LShift1_in = leftShiftStage0_uid37_LShift1_q[4:0];
    assign leftShiftStage1Idx2Rng8_uid42_LShift1_b = leftShiftStage1Idx2Rng8_uid42_LShift1_in[4:0];

    // leftShiftStage1Idx2Pad8_uid41_LShift1(CONSTANT,40)
    assign leftShiftStage1Idx2Pad8_uid41_LShift1_q = $unsigned(8'b00000000);

    // leftShiftStage1Idx2_uid43_LShift1(BITJOIN,42)@0
    assign leftShiftStage1Idx2_uid43_LShift1_q = {leftShiftStage1Idx2Rng8_uid42_LShift1_b, leftShiftStage1Idx2Pad8_uid41_LShift1_q};

    // leftShiftStage1Idx1Rng4_uid39_LShift1(BITSELECT,38)@0
    assign leftShiftStage1Idx1Rng4_uid39_LShift1_in = leftShiftStage0_uid37_LShift1_q[8:0];
    assign leftShiftStage1Idx1Rng4_uid39_LShift1_b = leftShiftStage1Idx1Rng4_uid39_LShift1_in[8:0];

    // leftShiftStage1Idx1Pad4_uid38_LShift1(CONSTANT,37)
    assign leftShiftStage1Idx1Pad4_uid38_LShift1_q = $unsigned(4'b0000);

    // leftShiftStage1Idx1_uid40_LShift1(BITJOIN,39)@0
    assign leftShiftStage1Idx1_uid40_LShift1_q = {leftShiftStage1Idx1Rng4_uid39_LShift1_b, leftShiftStage1Idx1Pad4_uid38_LShift1_q};

    // leftShiftStage0Idx3_uid35_LShift1_q_const(CONSTANT,56)
    assign leftShiftStage0Idx3_uid35_LShift1_q_const_q = $unsigned(13'b0000000001000);

    // leftShiftStage0Idx1_uid29_LShift1_q_const(CONSTANT,52)
    assign leftShiftStage0Idx1_uid29_LShift1_q_const_q = $unsigned(13'b0000000000010);

    // xPadded_uid26_LShift1_q_const(CONSTANT,50)
    assign xPadded_uid26_LShift1_q_const_q = $unsigned(13'b0000000000001);

    // leftShiftStage0_uid37_LShift1(MUX,36)@0
    assign leftShiftStage0_uid37_LShift1_s = leftShiftStageSel0Dto0_uid36_LShift1_bit_select_merged_b;
    always @(leftShiftStage0_uid37_LShift1_s or xPadded_uid26_LShift1_q_const_q or leftShiftStage0Idx1_uid29_LShift1_q_const_q or Const1_q or leftShiftStage0Idx3_uid35_LShift1_q_const_q)
    begin
        unique case (leftShiftStage0_uid37_LShift1_s)
            2'b00 : leftShiftStage0_uid37_LShift1_q = xPadded_uid26_LShift1_q_const_q;
            2'b01 : leftShiftStage0_uid37_LShift1_q = leftShiftStage0Idx1_uid29_LShift1_q_const_q;
            2'b10 : leftShiftStage0_uid37_LShift1_q = Const1_q;
            2'b11 : leftShiftStage0_uid37_LShift1_q = leftShiftStage0Idx3_uid35_LShift1_q_const_q;
            default : leftShiftStage0_uid37_LShift1_q = 13'b0;
        endcase
    end

    // leftShiftStageSel0Dto0_uid36_LShift1_bit_select_merged(BITSELECT,49)@0
    assign leftShiftStageSel0Dto0_uid36_LShift1_bit_select_merged_b = in_5_FFTSize_tpl[1:0];
    assign leftShiftStageSel0Dto0_uid36_LShift1_bit_select_merged_c = in_5_FFTSize_tpl[3:2];

    // leftShiftStage1_uid48_LShift1(MUX,47)@0
    assign leftShiftStage1_uid48_LShift1_s = leftShiftStageSel0Dto0_uid36_LShift1_bit_select_merged_c;
    always @(leftShiftStage1_uid48_LShift1_s or leftShiftStage0_uid37_LShift1_q or leftShiftStage1Idx1_uid40_LShift1_q or leftShiftStage1Idx2_uid43_LShift1_q or leftShiftStage1Idx3_uid46_LShift1_q)
    begin
        unique case (leftShiftStage1_uid48_LShift1_s)
            2'b00 : leftShiftStage1_uid48_LShift1_q = leftShiftStage0_uid37_LShift1_q;
            2'b01 : leftShiftStage1_uid48_LShift1_q = leftShiftStage1Idx1_uid40_LShift1_q;
            2'b10 : leftShiftStage1_uid48_LShift1_q = leftShiftStage1Idx2_uid43_LShift1_q;
            2'b11 : leftShiftStage1_uid48_LShift1_q = leftShiftStage1Idx3_uid46_LShift1_q;
            default : leftShiftStage1_uid48_LShift1_q = 13'b0;
        endcase
    end

    // Convert_sel_x(BITSELECT,15)@0
    assign Convert_sel_x_b = {9'b000000000, in_6_NumberOfFFTs_tpl[3:0]};

    // FFTLoop_vunroll_x(LOOP,17)@0 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            FFTLoop_vunroll_x_running <= $unsigned(1'b0);
            FFTLoop_vunroll_x_pending <= $unsigned(1'b0);
            FFTLoop_vunroll_x_q0 <= 13'b0;
            FFTLoop_vunroll_x_e0 <= '1;
            FFTLoop_vunroll_x_q1 <= 13'b0;
            FFTLoop_vunroll_x_e1 <= '1;
            FFTLoop_vunroll_x_q2 <= 13'b0;
            FFTLoop_vunroll_x_e2 <= '1;
            FFTLoop_vunroll_x_v <= $unsigned(1'b0);
        end
        else
        begin
            FFTLoop_vunroll_x_v <= $unsigned(1'b0);
            if (And_rsrvd_fix_q == 1'b1)
            begin
                FFTLoop_vunroll_x_e0 <= $unsigned(Convert_sel_x_b) - $unsigned(13'd1);
                FFTLoop_vunroll_x_q0 <= 13'b0;
                FFTLoop_vunroll_x_e1 <= $unsigned(leftShiftStage1_uid48_LShift1_q) - $unsigned(13'd1);
                FFTLoop_vunroll_x_q1 <= 13'b0;
                FFTLoop_vunroll_x_e2 <= $unsigned(Const1_q) - $unsigned(13'd1);
                FFTLoop_vunroll_x_q2 <= 13'b0;
                FFTLoop_vunroll_x_running <= $unsigned(1'b1);
                if (in_2_vin_tpl == 1'b1)
                begin
                    FFTLoop_vunroll_x_pending <= $unsigned(1'b0);
                    FFTLoop_vunroll_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    FFTLoop_vunroll_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (in_2_vin_tpl == 1'b1)
                begin
                    if (FFTLoop_vunroll_x_pending == 1'b1)
                    begin
                        FFTLoop_vunroll_x_v <= $unsigned(1'b1);
                    end
                    else if (FFTLoop_vunroll_x_running == 1'b1)
                    begin
                        FFTLoop_vunroll_x_v <= $unsigned(1'b1);
                        if (FFTLoop_vunroll_x_q2 == FFTLoop_vunroll_x_e2)
                        begin
                            FFTLoop_vunroll_x_q2 <= 13'b0;
                            if (FFTLoop_vunroll_x_q1 == FFTLoop_vunroll_x_e1)
                            begin
                                FFTLoop_vunroll_x_q1 <= 13'b0;
                                if (FFTLoop_vunroll_x_q0 == FFTLoop_vunroll_x_e0)
                                begin
                                    FFTLoop_vunroll_x_q0 <= 13'b0;
                                    FFTLoop_vunroll_x_running <= $unsigned(1'b0);
                                    FFTLoop_vunroll_x_v <= $unsigned(1'b0);
                                end
                                else
                                begin
                                    FFTLoop_vunroll_x_q0 <= $unsigned(FFTLoop_vunroll_x_q0) + $unsigned(13'd1);
                                end
                            end
                            else
                            begin
                                FFTLoop_vunroll_x_q1 <= $unsigned(FFTLoop_vunroll_x_q1) + $unsigned(13'd1);
                            end
                        end
                        else
                        begin
                            FFTLoop_vunroll_x_q2 <= $unsigned(FFTLoop_vunroll_x_q2) + $unsigned(13'd1);
                        end
                    end
                    FFTLoop_vunroll_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign FFTLoop_vunroll_x_f2 = $unsigned(FFTLoop_vunroll_x_q2 == 13'b0000000000000 ? 1'b1 : 1'b0);
    assign FFTLoop_vunroll_x_l2 = $unsigned(FFTLoop_vunroll_x_q2 == FFTLoop_vunroll_x_e2 ? 1'b1 : 1'b0);
    assign FFTLoop_vunroll_x_f1 = $unsigned(FFTLoop_vunroll_x_q1 == 13'b0000000000000 ? 1'b1 : 1'b0);
    assign FFTLoop_vunroll_x_l1 = $unsigned(FFTLoop_vunroll_x_q1 == FFTLoop_vunroll_x_e1 ? 1'b1 : 1'b0);
    assign FFTLoop_vunroll_x_f0 = $unsigned(FFTLoop_vunroll_x_q0 == 13'b0000000000000 ? 1'b1 : 1'b0);
    assign FFTLoop_vunroll_x_l0 = $unsigned(FFTLoop_vunroll_x_q0 == FFTLoop_vunroll_x_e0 ? 1'b1 : 1'b0);

    // Convert1_sel_x(BITSELECT,16)@1
    assign Convert1_sel_x_b = FFTLoop_vunroll_x_q2[7:0];

    // redist0_Convert1_sel_x_b_1(DELAY,57)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_Convert1_sel_x_b_1_q <= $unsigned(Convert1_sel_x_b);
        end
    end

    // redist1_ChannelIn_cunroll_x_in_2_vin_tpl_1(DELAY,58)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_ChannelIn_cunroll_x_in_2_vin_tpl_1_q <= '0;
        end
        else
        begin
            redist1_ChannelIn_cunroll_x_in_2_vin_tpl_1_q <= $unsigned(in_2_vin_tpl);
        end
    end

    // And1(LOGICAL,4)@1 + 1
    assign And1_qi = FFTLoop_vunroll_x_v & redist1_ChannelIn_cunroll_x_in_2_vin_tpl_1_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    And1_delay ( .xin(And1_qi), .xout(And1_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ChannelOut_cunroll_x(PORTOUT,14)@2 + 1
    assign out_1_vout_tpl = And1_q;
    assign out_2_cout_tpl = redist0_Convert1_sel_x_b_1_q;
    assign out_3_real_dout_tpl = redist2_ChannelIn_cunroll_x_in_1_real_din_tpl_2_q;
    assign out_3_imag_dout_tpl = redist3_ChannelIn_cunroll_x_in_1_imag_din_tpl_2_q;
    assign out_4_qFFTSize_tpl = redist4_ChannelIn_cunroll_x_in_5_FFTSize_tpl_2_q;
    assign out_5_qSOP_tpl = redist7_And_rsrvd_fix_q_2_q;
    assign out_6_qBWby10_tpl = redist5_ChannelIn_cunroll_x_in_8_BW_x_10_x_tpl_2_q;
    assign out_7_T_ref_tpl = redist6_ChannelIn_cunroll_x_in_9_TimeReference_tpl_2_q;

endmodule
