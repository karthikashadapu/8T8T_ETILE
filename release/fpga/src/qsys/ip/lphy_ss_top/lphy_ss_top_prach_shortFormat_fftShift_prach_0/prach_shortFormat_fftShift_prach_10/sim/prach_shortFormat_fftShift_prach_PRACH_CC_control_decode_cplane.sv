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

// SystemVerilog created from prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane
// SystemVerilog created on Wed Nov  6 19:28:33 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane (
    input wire [0:0] in_2_vin_tpl,
    input wire [7:0] in_3_chin_tpl,
    input wire [15:0] in_1_real_din_tpl,
    input wire [15:0] in_1_imag_din_tpl,
    input wire [22:0] in_4_CPLen_cplane_tpl,
    input wire [22:0] in_5_timeoffset_cplane_tpl,
    input wire [3:0] in_6_numsym_cplane_tpl,
    input wire [1:0] in_7_slotID_cplane_tpl,
    input wire [3:0] in_8_startsym_cplane_tpl,
    input wire [28:0] in_9_TimeReference_tpl,
    input wire [7:0] in_10_cur_SubFN_tpl,
    input wire [1:0] in_11_cur_slot_tpl,
    input wire [7:0] in_12_SubFN_cplane_tpl,
    input wire [22:0] in_13_time_offset_bias_tpl,
    input wire [22:0] in_14_startsym_bias_tpl,
    input wire [11:0] in_15_SFN_tpl,
    output wire [0:0] out_1_vout_tpl,
    output wire [7:0] out_2_cout_tpl,
    output wire [15:0] out_3_real_dout_tpl,
    output wire [15:0] out_3_imag_dout_tpl,
    output wire [3:0] out_4_qFFTSize_tpl,
    output wire [0:0] out_5_qSOP_tpl,
    output wire [3:0] out_6_qBWby10_tpl,
    output wire [28:0] out_7_T_ref_tpl,
    output wire [3:0] out_8_qNFFT_tpl,
    output wire [25:0] out_9_CPLen_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [23:0] Add_a;
    wire [23:0] Add_b;
    logic [23:0] Add_o;
    wire [23:0] Add_q;
    wire [25:0] Add1_a;
    wire [25:0] Add1_b;
    logic [25:0] Add1_o;
    wire [25:0] Add1_q;
    wire [24:0] Add2_a;
    wire [24:0] Add2_b;
    logic [24:0] Add2_o;
    wire [24:0] Add2_q;
    wire [0:0] And_rsrvd_fix_q;
    wire [0:0] And1_qi;
    reg [0:0] And1_q;
    wire [28:0] BitCombine_q;
    wire [0:0] CmpEQ1_q;
    wire [3:0] Const_rsrvd_fix_q;
    wire [3:0] Const5_q;
    wire [6:0] Const7_q;
    wire [24:0] Sub_a;
    wire [24:0] Sub_b;
    logic [24:0] Sub_o;
    wire [24:0] Sub_q;
    wire [3:0] maxsym_q;
    wire [3:0] startofsym_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_changedet_CmpNE_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L1_Mux_x_s;
    reg [22:0] prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L1_Mux_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L2_Mux_x_s;
    reg [22:0] prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L2_Mux_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_s;
    reg [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L4_Mux_x_s;
    reg [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L4_Mux_x_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L6_Mux_x_s;
    reg [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L6_Mux_x_q;
    wire [25:0] LShift_fs_q;
    wire [25:0] LShift_fs_qint;
    reg [3:0] redist0_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q_4_q;
    reg [3:0] redist0_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q_4_delay_0;
    reg [3:0] redist0_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q_4_delay_1;
    reg [0:0] redist1_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_changedet_CmpNE_x_q_1_q;
    reg [0:0] redist2_ChannelIn_cunroll_x_in_2_vin_tpl_1_q;
    reg [7:0] redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_q;
    reg [7:0] redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_delay_0;
    reg [7:0] redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_delay_1;
    reg [7:0] redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_delay_2;
    reg [7:0] redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_delay_3;
    reg [3:0] redist6_ChannelIn_cunroll_x_in_6_numsym_cplane_tpl_1_q;
    reg [7:0] redist7_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_1_q;
    reg [7:0] redist8_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_5_q;
    reg [7:0] redist8_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_5_delay_0;
    reg [7:0] redist8_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_5_delay_1;
    reg [7:0] redist8_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_5_delay_2;
    reg [22:0] redist9_ChannelIn_cunroll_x_in_13_time_offset_bias_tpl_2_q;
    reg [22:0] redist9_ChannelIn_cunroll_x_in_13_time_offset_bias_tpl_2_delay_0;
    reg [22:0] redist10_ChannelIn_cunroll_x_in_14_startsym_bias_tpl_4_q;
    reg [22:0] redist10_ChannelIn_cunroll_x_in_14_startsym_bias_tpl_4_delay_0;
    reg [22:0] redist10_ChannelIn_cunroll_x_in_14_startsym_bias_tpl_4_delay_1;
    reg [22:0] redist10_ChannelIn_cunroll_x_in_14_startsym_bias_tpl_4_delay_2;
    reg [0:0] redist12_And1_q_4_q;
    reg [0:0] redist12_And1_q_4_delay_0;
    reg [0:0] redist12_And1_q_4_delay_1;
    reg [0:0] redist13_And_rsrvd_fix_q_4_q;
    reg [0:0] redist13_And_rsrvd_fix_q_4_delay_0;
    reg [0:0] redist13_And_rsrvd_fix_q_4_delay_1;
    reg [0:0] redist13_And_rsrvd_fix_q_4_delay_2;
    wire redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_reset0;
    wire [15:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_ia;
    wire [1:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_aa;
    wire [1:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_ab;
    wire [15:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_iq;
    wire [15:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_q;
    wire [1:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_wraddr_i = 2'b11;
    wire [1:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_offset_q;
    wire [2:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_rdcnt_a;
    wire [2:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_rdcnt_b;
    logic [2:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_rdcnt_o;
    wire [2:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_rdcnt_q;
    wire redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_reset0;
    wire [15:0] redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_ia;
    wire [1:0] redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_aa;
    wire [1:0] redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_ab;
    wire [15:0] redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_iq;
    wire [15:0] redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_q;
    wire [1:0] redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_wraddr_i = 2'b11;
    wire [2:0] redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_rdcnt_a;
    wire [2:0] redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_rdcnt_b;
    logic [2:0] redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_rdcnt_o;
    wire [2:0] redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_rdcnt_q;
    wire redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_reset0;
    wire [11:0] redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_ia;
    wire [1:0] redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_aa;
    wire [1:0] redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_ab;
    wire [11:0] redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_iq;
    wire [11:0] redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_q;
    wire [1:0] redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_wraddr_i = 2'b11;
    wire [2:0] redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_rdcnt_a;
    wire [2:0] redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_rdcnt_b;
    logic [2:0] redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_rdcnt_o;
    wire [2:0] redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_rdcnt_q;

    import prach_shortFormat_fftShift_prach_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist10_ChannelIn_cunroll_x_in_14_startsym_bias_tpl_4(DELAY,49)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist10_ChannelIn_cunroll_x_in_14_startsym_bias_tpl_4_delay_0 <= $unsigned(in_14_startsym_bias_tpl);
            redist10_ChannelIn_cunroll_x_in_14_startsym_bias_tpl_4_delay_1 <= redist10_ChannelIn_cunroll_x_in_14_startsym_bias_tpl_4_delay_0;
            redist10_ChannelIn_cunroll_x_in_14_startsym_bias_tpl_4_delay_2 <= redist10_ChannelIn_cunroll_x_in_14_startsym_bias_tpl_4_delay_1;
            redist10_ChannelIn_cunroll_x_in_14_startsym_bias_tpl_4_q <= redist10_ChannelIn_cunroll_x_in_14_startsym_bias_tpl_4_delay_2;
        end
    end

    // Const7(CONSTANT,13)
    assign Const7_q = $unsigned(7'b1000000);

    // redist9_ChannelIn_cunroll_x_in_13_time_offset_bias_tpl_2(DELAY,48)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_ChannelIn_cunroll_x_in_13_time_offset_bias_tpl_2_delay_0 <= $unsigned(in_13_time_offset_bias_tpl);
            redist9_ChannelIn_cunroll_x_in_13_time_offset_bias_tpl_2_q <= redist9_ChannelIn_cunroll_x_in_13_time_offset_bias_tpl_2_delay_0;
        end
    end

    // redist7_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_1(DELAY,46)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist7_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_1_q <= '0;
        end
        else
        begin
            redist7_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_1_q <= $unsigned(in_10_cur_SubFN_tpl);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_changedet_CmpNE_x(LOGICAL,23)@0
    assign prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_changedet_CmpNE_x_q = $unsigned(redist7_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_1_q != in_10_cur_SubFN_tpl ? 1'b1 : 1'b0);

    // prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L2_Mux_x(MUX,27)@0 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L2_Mux_x_s = prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_changedet_CmpNE_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L2_Mux_x_q <= 23'b0;
        end
        else
        begin
            unique case (prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L2_Mux_x_s)
                1'b0 : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L2_Mux_x_q <= prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L2_Mux_x_q;
                1'b1 : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L2_Mux_x_q <= in_5_timeoffset_cplane_tpl;
                default : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L2_Mux_x_q <= 23'b0;
            endcase
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L1_Mux_x(MUX,25)@0 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L1_Mux_x_s = prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_changedet_CmpNE_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L1_Mux_x_q <= 23'b0;
        end
        else
        begin
            unique case (prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L1_Mux_x_s)
                1'b0 : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L1_Mux_x_q <= prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L1_Mux_x_q;
                1'b1 : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L1_Mux_x_q <= in_4_CPLen_cplane_tpl;
                default : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L1_Mux_x_q <= 23'b0;
            endcase
        end
    end

    // Add(ADD,3)@1 + 1
    assign Add_a = {1'b0, prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L1_Mux_x_q};
    assign Add_b = {1'b0, prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L2_Mux_x_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Add_o <= $unsigned(Add_a) + $unsigned(Add_b);
        end
    end
    assign Add_q = Add_o[23:0];

    // Sub(SUB,16)@2 + 1
    assign Sub_a = $unsigned({1'b0, Add_q});
    assign Sub_b = $unsigned({2'b00, redist9_ChannelIn_cunroll_x_in_13_time_offset_bias_tpl_2_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Sub_o <= $unsigned($signed(Sub_a) - $signed(Sub_b));
        end
    end
    assign Sub_q = Sub_o[24:0];

    // LShift_fs(BITSHIFT,38)@3
    assign LShift_fs_qint = { Sub_q, 1'b0 };
    assign LShift_fs_q = LShift_fs_qint[25:0];

    // Add2(ADD,5)@3 + 1
    assign Add2_a = LShift_fs_q[24:0];
    assign Add2_b = {18'b000000000000000000, Const7_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Add2_o <= $unsigned(Add2_a) + $unsigned(Add2_b);
        end
    end
    assign Add2_q = Add2_o[24:0];

    // Add1(ADD,4)@4 + 1
    assign Add1_a = {1'b0, Add2_q};
    assign Add1_b = {3'b000, redist10_ChannelIn_cunroll_x_in_14_startsym_bias_tpl_4_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Add1_o <= $unsigned(Add1_a) + $unsigned(Add1_b);
        end
    end
    assign Add1_q = Add1_o[25:0];

    // redist6_ChannelIn_cunroll_x_in_6_numsym_cplane_tpl_1(DELAY,45)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_ChannelIn_cunroll_x_in_6_numsym_cplane_tpl_1_q <= $unsigned(in_6_numsym_cplane_tpl);
        end
    end

    // redist1_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_changedet_CmpNE_x_q_1(DELAY,40)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_changedet_CmpNE_x_q_1_q <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_changedet_CmpNE_x_q);
        end
    end

    // prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x(MUX,29)@1 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_s = redist1_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_changedet_CmpNE_x_q_1_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q <= 4'b0;
        end
        else
        begin
            unique case (prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_s)
                1'b0 : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q <= prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q;
                1'b1 : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q <= redist6_ChannelIn_cunroll_x_in_6_numsym_cplane_tpl_1_q;
                default : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q <= 4'b0;
            endcase
        end
    end

    // redist0_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q_4(DELAY,39)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q_4_delay_0 <= $unsigned(prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q);
            redist0_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q_4_delay_1 <= redist0_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q_4_delay_0;
            redist0_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q_4_q <= redist0_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q_4_delay_1;
        end
    end

    // redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_offset(CONSTANT,55)
    assign redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_offset_q = $unsigned(2'b10);

    // redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_rdcnt(ADD,64)
    assign redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_rdcnt_a = {1'b0, redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_wraddr_q};
    assign redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_rdcnt_b = {1'b0, redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_rdcnt_o <= $unsigned(redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_rdcnt_a) + $unsigned(redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_rdcnt_b);
        end
    end
    assign redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_rdcnt_q = redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_rdcnt_o[2:0];

    // redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_wraddr(COUNTER,62)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_wraddr_i <= $unsigned(redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_wraddr_q = redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_wraddr_i[1:0];

    // redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem(DUALMEM,61)
    assign redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_ia = $unsigned(in_15_SFN_tpl);
    assign redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_aa = redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_wraddr_q;
    assign redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_ab = redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(12),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(12),
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
    ) redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_aa),
        .data_a(redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_ab),
        .q_b(redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_iq),
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
    assign redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_q = redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_iq[11:0];

    // redist8_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_5(DELAY,47)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist8_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_5_delay_0 <= '0;
        end
        else
        begin
            redist8_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_5_delay_0 <= $unsigned(redist7_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_1_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_5_delay_1 <= redist8_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_5_delay_0;
            redist8_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_5_delay_2 <= redist8_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_5_delay_1;
            redist8_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_5_q <= redist8_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_5_delay_2;
        end
    end

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // maxsym(CONSTANT,18)
    assign maxsym_q = $unsigned(4'b0001);

    // startofsym(CONSTANT,19)
    assign startofsym_q = $unsigned(4'b0000);

    // BitCombine(BITJOIN,8)@5
    assign BitCombine_q = {redist11_ChannelIn_cunroll_x_in_15_SFN_tpl_5_mem_q, redist8_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_5_q, GND_q, maxsym_q, startofsym_q};

    // Const5(CONSTANT,12)
    assign Const5_q = $unsigned(4'b1010);

    // prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L6_Mux_x(MUX,33)@0 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L6_Mux_x_s = prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_changedet_CmpNE_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L6_Mux_x_q <= 8'b0;
        end
        else
        begin
            unique case (prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L6_Mux_x_s)
                1'b0 : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L6_Mux_x_q <= prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L6_Mux_x_q;
                1'b1 : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L6_Mux_x_q <= in_12_SubFN_cplane_tpl;
                default : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L6_Mux_x_q <= 8'b0;
            endcase
        end
    end

    // CmpEQ1(LOGICAL,9)@1
    assign CmpEQ1_q = $unsigned(redist7_ChannelIn_cunroll_x_in_10_cur_SubFN_tpl_1_q == prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L6_Mux_x_q ? 1'b1 : 1'b0);

    // redist2_ChannelIn_cunroll_x_in_2_vin_tpl_1(DELAY,41)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_ChannelIn_cunroll_x_in_2_vin_tpl_1_q <= '0;
        end
        else
        begin
            redist2_ChannelIn_cunroll_x_in_2_vin_tpl_1_q <= $unsigned(in_2_vin_tpl);
        end
    end

    // And_rsrvd_fix(LOGICAL,6)@1
    assign And_rsrvd_fix_q = redist2_ChannelIn_cunroll_x_in_2_vin_tpl_1_q & CmpEQ1_q;

    // And1(LOGICAL,7)@1 + 1
    assign And1_qi = redist1_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_changedet_CmpNE_x_q_1_q & And_rsrvd_fix_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    And1_delay ( .xin(And1_qi), .xout(And1_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist12_And1_q_4(DELAY,51)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist12_And1_q_4_delay_0 <= $unsigned(And1_q);
            redist12_And1_q_4_delay_1 <= redist12_And1_q_4_delay_0;
            redist12_And1_q_4_q <= redist12_And1_q_4_delay_1;
        end
    end

    // Const_rsrvd_fix(CONSTANT,10)
    assign Const_rsrvd_fix_q = $unsigned(4'b1100);

    // redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_rdcnt(ADD,60)
    assign redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_rdcnt_a = {1'b0, redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_wraddr_q};
    assign redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_rdcnt_b = {1'b0, redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_rdcnt_o <= $unsigned(redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_rdcnt_a) + $unsigned(redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_rdcnt_b);
        end
    end
    assign redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_rdcnt_q = redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_rdcnt_o[2:0];

    // redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_wraddr(COUNTER,58)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_wraddr_i <= $unsigned(redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_wraddr_q = redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_wraddr_i[1:0];

    // redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem(DUALMEM,57)
    assign redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_ia = $unsigned(in_1_imag_din_tpl);
    assign redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_aa = redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_wraddr_q;
    assign redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_ab = redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_rdcnt_q[1:0];
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
    ) redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_aa),
        .data_a(redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_ab),
        .q_b(redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_iq),
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
    assign redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_q = redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_iq[15:0];

    // redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_rdcnt(ADD,56)
    assign redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_rdcnt_a = {1'b0, redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_wraddr_q};
    assign redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_rdcnt_b = {1'b0, redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_rdcnt_o <= $unsigned(redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_rdcnt_a) + $unsigned(redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_rdcnt_b);
        end
    end
    assign redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_rdcnt_q = redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_rdcnt_o[2:0];

    // redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_wraddr(COUNTER,54)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_wraddr_i <= $unsigned(redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_wraddr_q = redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_wraddr_i[1:0];

    // redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem(DUALMEM,53)
    assign redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_ia = $unsigned(in_1_real_din_tpl);
    assign redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_aa = redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_wraddr_q;
    assign redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_ab = redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_rdcnt_q[1:0];
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
    ) redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_aa),
        .data_a(redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_ab),
        .q_b(redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_iq),
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
    assign redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_q = redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_iq[15:0];

    // redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5(DELAY,42)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_delay_0 <= $unsigned(in_3_chin_tpl);
            redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_delay_1 <= redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_delay_0;
            redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_delay_2 <= redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_delay_1;
            redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_delay_3 <= redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_delay_2;
            redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_q <= redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_delay_3;
        end
    end

    // redist13_And_rsrvd_fix_q_4(DELAY,52)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist13_And_rsrvd_fix_q_4_delay_0 <= '0;
        end
        else
        begin
            redist13_And_rsrvd_fix_q_4_delay_0 <= $unsigned(And_rsrvd_fix_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_And_rsrvd_fix_q_4_delay_1 <= redist13_And_rsrvd_fix_q_4_delay_0;
            redist13_And_rsrvd_fix_q_4_delay_2 <= redist13_And_rsrvd_fix_q_4_delay_1;
            redist13_And_rsrvd_fix_q_4_q <= redist13_And_rsrvd_fix_q_4_delay_2;
        end
    end

    // ChannelOut_cunroll_x(PORTOUT,21)@5 + 1
    assign out_1_vout_tpl = redist13_And_rsrvd_fix_q_4_q;
    assign out_2_cout_tpl = redist3_ChannelIn_cunroll_x_in_3_chin_tpl_5_q;
    assign out_3_real_dout_tpl = redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_5_mem_q;
    assign out_3_imag_dout_tpl = redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_5_mem_q;
    assign out_4_qFFTSize_tpl = Const_rsrvd_fix_q;
    assign out_5_qSOP_tpl = redist12_And1_q_4_q;
    assign out_6_qBWby10_tpl = Const5_q;
    assign out_7_T_ref_tpl = BitCombine_q;
    assign out_8_qNFFT_tpl = redist0_prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L3_Mux_x_q_4_q;
    assign out_9_CPLen_tpl = Add1_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L4_Mux_x(MUX,31)@0 + 1
    assign prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L4_Mux_x_s = prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_changedet_CmpNE_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L4_Mux_x_q <= 4'b0;
        end
        else
        begin
            unique case (prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L4_Mux_x_s)
                1'b0 : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L4_Mux_x_q <= prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L4_Mux_x_q;
                1'b1 : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L4_Mux_x_q <= in_8_startsym_cplane_tpl;
                default : prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_latch_0L4_Mux_x_q <= 4'b0;
            endcase
        end
    end

endmodule
