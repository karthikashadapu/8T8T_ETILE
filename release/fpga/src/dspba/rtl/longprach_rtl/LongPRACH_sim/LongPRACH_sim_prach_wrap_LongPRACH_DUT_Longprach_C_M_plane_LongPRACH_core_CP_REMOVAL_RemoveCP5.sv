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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5 (
    input wire [0:0] in_1_vin_tpl,
    input wire [7:0] in_2_chin_tpl,
    input wire [15:0] in_3_real_din_tpl,
    input wire [15:0] in_3_imag_din_tpl,
    input wire [21:0] in_4_cp_start_tpl,
    input wire [22:0] in_5_gt_end_tpl,
    input wire [0:0] in_6_filt_flush_en_tpl,
    output wire [0:0] out_1_vout_tpl,
    output wire [7:0] out_2_cout_tpl,
    output wire [15:0] out_3_real_dout_tpl,
    output wire [15:0] out_3_imag_dout_tpl,
    output wire [0:0] out_4_filt_flush_tpl,
    output wire [0:0] out_5_sync_out_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [0:0] And1_qi;
    reg [0:0] And1_q;
    wire [0:0] And2_qi;
    reg [0:0] And2_q;
    wire [23:0] CmpGE_cpstart_a;
    wire [23:0] CmpGE_cpstart_b;
    logic [23:0] CmpGE_cpstart_o;
    wire [0:0] CmpGE_cpstart_n;
    wire [20:0] CmpGE_cpstart1_a;
    wire [20:0] CmpGE_cpstart1_b;
    logic [20:0] CmpGE_cpstart1_o;
    wire [0:0] CmpGE_cpstart1_n;
    wire [24:0] CmpLT_gaurdtime_a;
    wire [24:0] CmpLT_gaurdtime_b;
    logic [24:0] CmpLT_gaurdtime_o;
    wire [0:0] CmpLT_gaurdtime_c;
    wire [20:0] CmpLT_gaurdtime1_a;
    wire [20:0] CmpLT_gaurdtime1_b;
    logic [20:0] CmpLT_gaurdtime1_o;
    wire [0:0] CmpLT_gaurdtime1_c;
    wire [6:0] Const_rsrvd_fix_q;
    wire [14:0] Const1_q;
    wire [18:0] Counter_q;
    (* preserve_syn_only *) reg [18:0] Counter_i;
    (* preserve_syn_only *) reg Counter_eq;
    wire [18:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_CmpEQ_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_CmpEQ_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_CmpEQ_x_q;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_Const2_x_q;
    wire [2:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_Const3_x_q;
    wire [5:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_a;
    wire [5:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_b;
    wire [5:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_i;
    wire [5:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_a1;
    wire [5:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_b1;
    logic [5:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_o;
    wire [4:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_And_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_BitExtract_x_b;
    wire [5:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_CmpGE_x_a;
    wire [5:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_CmpGE_x_b;
    logic [5:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_CmpGE_x_o;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_CmpGE_x_n;
    wire [1:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Const5_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Mux_x_s;
    reg [1:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Mux_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_latch_0L_Mux_x_s;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_latch_0L_Mux_x_q;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b;
    reg [3:0] redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q;
    reg [0:0] redist1_ChannelIn_cunroll_x_in_1_vin_tpl_1_q;
    reg [7:0] redist2_ChannelIn_cunroll_x_in_2_chin_tpl_3_q;
    reg [7:0] redist2_ChannelIn_cunroll_x_in_2_chin_tpl_3_delay_0;
    reg [7:0] redist2_ChannelIn_cunroll_x_in_2_chin_tpl_3_delay_1;
    reg [15:0] redist3_ChannelIn_cunroll_x_in_3_real_din_tpl_3_q;
    reg [15:0] redist3_ChannelIn_cunroll_x_in_3_real_din_tpl_3_delay_0;
    reg [15:0] redist3_ChannelIn_cunroll_x_in_3_real_din_tpl_3_delay_1;
    reg [15:0] redist4_ChannelIn_cunroll_x_in_3_imag_din_tpl_3_q;
    reg [15:0] redist4_ChannelIn_cunroll_x_in_3_imag_din_tpl_3_delay_0;
    reg [15:0] redist4_ChannelIn_cunroll_x_in_3_imag_din_tpl_3_delay_1;
    reg [21:0] redist5_ChannelIn_cunroll_x_in_4_cp_start_tpl_1_q;
    reg [22:0] redist6_ChannelIn_cunroll_x_in_5_gt_end_tpl_1_q;
    reg [0:0] redist7_ChannelIn_cunroll_x_in_6_filt_flush_en_tpl_1_q;
    reg [0:0] redist8_And2_q_2_q;
    reg [0:0] redist9_And1_q_2_q;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_Const2_x(CONSTANT,25)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_Const2_x_q = $unsigned(4'b1010);

    // Counter(COUNTER,16)@0 + 1
    // low=0, high=491519, step=1, init=491519
    always @ (posedge clk)
    begin
        if (areset)
        begin
            Counter_i <= 19'd491519;
            Counter_eq <= 1'b1;
        end
        else if (in_1_vin_tpl == 1'b1)
        begin
            if (Counter_i == 19'd491518)
            begin
                Counter_eq <= 1'b1;
            end
            else
            begin
                Counter_eq <= 1'b0;
            end
            if (Counter_eq == 1'b1)
            begin
                Counter_i <= $unsigned(Counter_i) + $unsigned(19'd32769);
            end
            else
            begin
                Counter_i <= $unsigned(Counter_i) + $unsigned(19'd1);
            end
        end
    end
    assign Counter_q = Counter_i[18:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_CmpEQ_x(LOGICAL,24)@1 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_CmpEQ_x_b = {15'b000000000000000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_Const2_x_q};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_CmpEQ_x_qi = $unsigned(Counter_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_CmpEQ_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_CmpEQ_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_CmpEQ_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_CmpEQ_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_latch_0L_Mux_x(MUX,37)@2 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_latch_0L_Mux_x_s = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_CmpEQ_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_latch_0L_Mux_x_q <= 1'b0;
        end
        else
        begin
            unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_latch_0L_Mux_x_s)
                1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_latch_0L_Mux_x_q <= LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_latch_0L_Mux_x_q;
                1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_latch_0L_Mux_x_q <= LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_CmpEQ_x_q;
                default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_latch_0L_Mux_x_q <= 1'b0;
            endcase
        end
    end

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_Const3_x(CONSTANT,26)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_Const3_x_q = $unsigned(3'b100);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Const5_x(CONSTANT,33)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Const5_x_q = $unsigned(2'b11);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_BitExtract_x(BITSELECT,30)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_BitExtract_x_b = $unsigned(redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q[3:3]);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Mux_x(MUX,35)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Mux_x_s = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_BitExtract_x_b;
    always @(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Mux_x_s or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Const5_x_q or GND_q)
    begin
        unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Mux_x_s)
            1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Mux_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Const5_x_q;
            1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Mux_x_q = {1'b0, GND_q};
            default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Mux_x_q = 2'b0;
        endcase
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x(ADD,27)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_a = $unsigned({{2{redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q[3]}}, redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q});
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_b = $unsigned({{4{LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Mux_x_q[1]}}, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_Mux_x_q});
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_i = $unsigned({3'b000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_Const3_x_q});
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_a1 = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_CmpEQ_x_q == 1'b1 ? LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_i : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_a;
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_b1 = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_CmpEQ_x_q == 1'b1 ? 6'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_b;
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_o = $unsigned($signed(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_a1) + $signed(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_b1));
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_o[4:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x(BITSELECT,39)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_x_q[3:0]);

    // redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1(DELAY,47)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b);
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_CmpGE_x(COMPARE,31)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_CmpGE_x_a = $unsigned({{2{redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q[3]}}, redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q});
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_CmpGE_x_b = $unsigned({5'b00000, VCC_q});
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_CmpGE_x_o = $unsigned($signed(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_CmpGE_x_a) - $signed(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_CmpGE_x_b));
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_CmpGE_x_n[0] = ~ (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_CmpGE_x_o[5]);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_And_x(LOGICAL,29)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_And_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_CmpGE_x_n & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_latch_0L_Mux_x_q;

    // redist7_ChannelIn_cunroll_x_in_6_filt_flush_en_tpl_1(DELAY,54)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist7_ChannelIn_cunroll_x_in_6_filt_flush_en_tpl_1_q <= $unsigned(in_6_filt_flush_en_tpl);
        end
    end

    // Const1(CONSTANT,14)
    assign Const1_q = $unsigned(15'b100101101100100);

    // CmpLT_gaurdtime1(COMPARE,10)@1
    assign CmpLT_gaurdtime1_a = {2'b00, Counter_q};
    assign CmpLT_gaurdtime1_b = {6'b000000, Const1_q};
    assign CmpLT_gaurdtime1_o = $unsigned(CmpLT_gaurdtime1_a) - $unsigned(CmpLT_gaurdtime1_b);
    assign CmpLT_gaurdtime1_c[0] = CmpLT_gaurdtime1_o[20];

    // Const_rsrvd_fix(CONSTANT,13)
    assign Const_rsrvd_fix_q = $unsigned(7'b1100100);

    // CmpGE_cpstart1(COMPARE,6)@1
    assign CmpGE_cpstart1_a = {2'b00, Counter_q};
    assign CmpGE_cpstart1_b = {14'b00000000000000, Const_rsrvd_fix_q};
    assign CmpGE_cpstart1_o = $unsigned(CmpGE_cpstart1_a) - $unsigned(CmpGE_cpstart1_b);
    assign CmpGE_cpstart1_n[0] = ~ (CmpGE_cpstart1_o[20]);

    // And2(LOGICAL,4)@1 + 1
    assign And2_qi = CmpGE_cpstart1_n & CmpLT_gaurdtime1_c & redist7_ChannelIn_cunroll_x_in_6_filt_flush_en_tpl_1_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    And2_delay ( .xin(And2_qi), .xout(And2_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist8_And2_q_2(DELAY,55)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_And2_q_2_q <= $unsigned(And2_q);
        end
    end

    // redist4_ChannelIn_cunroll_x_in_3_imag_din_tpl_3(DELAY,51)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_ChannelIn_cunroll_x_in_3_imag_din_tpl_3_delay_0 <= $unsigned(in_3_imag_din_tpl);
            redist4_ChannelIn_cunroll_x_in_3_imag_din_tpl_3_delay_1 <= redist4_ChannelIn_cunroll_x_in_3_imag_din_tpl_3_delay_0;
            redist4_ChannelIn_cunroll_x_in_3_imag_din_tpl_3_q <= redist4_ChannelIn_cunroll_x_in_3_imag_din_tpl_3_delay_1;
        end
    end

    // redist3_ChannelIn_cunroll_x_in_3_real_din_tpl_3(DELAY,50)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_ChannelIn_cunroll_x_in_3_real_din_tpl_3_delay_0 <= $unsigned(in_3_real_din_tpl);
            redist3_ChannelIn_cunroll_x_in_3_real_din_tpl_3_delay_1 <= redist3_ChannelIn_cunroll_x_in_3_real_din_tpl_3_delay_0;
            redist3_ChannelIn_cunroll_x_in_3_real_din_tpl_3_q <= redist3_ChannelIn_cunroll_x_in_3_real_din_tpl_3_delay_1;
        end
    end

    // redist2_ChannelIn_cunroll_x_in_2_chin_tpl_3(DELAY,49)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_ChannelIn_cunroll_x_in_2_chin_tpl_3_delay_0 <= $unsigned(in_2_chin_tpl);
            redist2_ChannelIn_cunroll_x_in_2_chin_tpl_3_delay_1 <= redist2_ChannelIn_cunroll_x_in_2_chin_tpl_3_delay_0;
            redist2_ChannelIn_cunroll_x_in_2_chin_tpl_3_q <= redist2_ChannelIn_cunroll_x_in_2_chin_tpl_3_delay_1;
        end
    end

    // redist6_ChannelIn_cunroll_x_in_5_gt_end_tpl_1(DELAY,53)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist6_ChannelIn_cunroll_x_in_5_gt_end_tpl_1_q <= '0;
        end
        else
        begin
            redist6_ChannelIn_cunroll_x_in_5_gt_end_tpl_1_q <= $unsigned(in_5_gt_end_tpl);
        end
    end

    // CmpLT_gaurdtime(COMPARE,9)@1
    assign CmpLT_gaurdtime_a = {6'b000000, Counter_q};
    assign CmpLT_gaurdtime_b = {2'b00, redist6_ChannelIn_cunroll_x_in_5_gt_end_tpl_1_q};
    assign CmpLT_gaurdtime_o = $unsigned(CmpLT_gaurdtime_a) - $unsigned(CmpLT_gaurdtime_b);
    assign CmpLT_gaurdtime_c[0] = CmpLT_gaurdtime_o[24];

    // redist5_ChannelIn_cunroll_x_in_4_cp_start_tpl_1(DELAY,52)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist5_ChannelIn_cunroll_x_in_4_cp_start_tpl_1_q <= '0;
        end
        else
        begin
            redist5_ChannelIn_cunroll_x_in_4_cp_start_tpl_1_q <= $unsigned(in_4_cp_start_tpl);
        end
    end

    // CmpGE_cpstart(COMPARE,5)@1
    assign CmpGE_cpstart_a = {5'b00000, Counter_q};
    assign CmpGE_cpstart_b = {2'b00, redist5_ChannelIn_cunroll_x_in_4_cp_start_tpl_1_q};
    assign CmpGE_cpstart_o = $unsigned(CmpGE_cpstart_a) - $unsigned(CmpGE_cpstart_b);
    assign CmpGE_cpstart_n[0] = ~ (CmpGE_cpstart_o[23]);

    // redist1_ChannelIn_cunroll_x_in_1_vin_tpl_1(DELAY,48)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_ChannelIn_cunroll_x_in_1_vin_tpl_1_q <= '0;
        end
        else
        begin
            redist1_ChannelIn_cunroll_x_in_1_vin_tpl_1_q <= $unsigned(in_1_vin_tpl);
        end
    end

    // And1(LOGICAL,3)@1 + 1
    assign And1_qi = redist1_ChannelIn_cunroll_x_in_1_vin_tpl_1_q & CmpGE_cpstart_n & CmpLT_gaurdtime_c;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    And1_delay ( .xin(And1_qi), .xout(And1_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist9_And1_q_2(DELAY,56)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist9_And1_q_2_q <= '0;
        end
        else
        begin
            redist9_And1_q_2_q <= $unsigned(And1_q);
        end
    end

    // ChannelOut_cunroll_x(PORTOUT,18)@3 + 1
    assign out_1_vout_tpl = redist9_And1_q_2_q;
    assign out_2_cout_tpl = redist2_ChannelIn_cunroll_x_in_2_chin_tpl_3_q;
    assign out_3_real_dout_tpl = redist3_ChannelIn_cunroll_x_in_3_real_din_tpl_3_q;
    assign out_3_imag_dout_tpl = redist4_ChannelIn_cunroll_x_in_3_imag_din_tpl_3_q;
    assign out_4_filt_flush_tpl = redist8_And2_q_2_q;
    assign out_5_sync_out_tpl = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_syncgen_StretchPulse_And_x_q;

endmodule
