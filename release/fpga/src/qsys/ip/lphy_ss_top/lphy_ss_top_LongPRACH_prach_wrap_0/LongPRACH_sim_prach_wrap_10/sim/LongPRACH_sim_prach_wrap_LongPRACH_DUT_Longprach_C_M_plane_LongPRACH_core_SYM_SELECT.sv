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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT (
    input wire [0:0] in_2_vin_tpl,
    input wire [7:0] in_3_chin_tpl,
    input wire [15:0] in_1_real_din_tpl,
    input wire [15:0] in_1_imag_din_tpl,
    input wire [0:0] in_4_TimeRef_tpl,
    input wire [6:0] in_5_prach_outstart_tpl,
    input wire [9:0] in_6_prach_outend_tpl,
    input wire [15:0] in_7_ch0_info_tpl,
    input wire [15:0] in_8_ch1_info_tpl,
    input wire [15:0] in_9_ch2_info_tpl,
    input wire [15:0] in_10_ch3_info_tpl,
    output wire [0:0] out_2_vout_tpl,
    output wire [7:0] out_3_cout_tpl,
    output wire [15:0] out_1_real_dout_tpl,
    output wire [15:0] out_1_imag_dout_tpl,
    output wire [0:0] out_4_TimeReference_tpl,
    output wire [15:0] out_5_ch_info_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [0:0] And_rsrvd_fix_q;
    wire [0:0] And1_q;
    wire [0:0] And2_qi;
    reg [0:0] And2_q;
    wire [7:0] CmpEQ_b;
    wire [0:0] CmpEQ_q;
    wire [11:0] CmpGE_a;
    wire [11:0] CmpGE_b;
    logic [11:0] CmpGE_o;
    wire [0:0] CmpGE_n;
    wire [11:0] CmpLT_a;
    wire [11:0] CmpLT_b;
    logic [11:0] CmpLT_o;
    wire [0:0] CmpLT_c;
    wire [9:0] Counter_q;
    (* preserve_syn_only *) reg [9:0] Counter_i;
    wire [7:0] Mux_s;
    reg [15:0] Mux_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_And_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Not_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Or_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_And_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Not_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Or_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_s;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_x_s;
    reg [15:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_x_s;
    reg [15:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_x_s;
    reg [15:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_x_s;
    reg [15:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_x_q;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_PreShift_1_q;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_PreShift_1_qint;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_PreShift_1_q;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_PreShift_1_qint;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_PreShift_1_q;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_PreShift_1_qint;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_PreShift_1_q;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_PreShift_1_qint;
    reg [0:0] redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_q_1_q;
    reg [0:0] redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Or_x_q_24_q;
    reg [0:0] redist2_ChannelIn_cunroll_x_in_2_vin_tpl_2_q;
    reg [0:0] redist2_ChannelIn_cunroll_x_in_2_vin_tpl_2_delay_0;
    reg [7:0] redist3_ChannelIn_cunroll_x_in_3_chin_tpl_2_q;
    reg [7:0] redist3_ChannelIn_cunroll_x_in_3_chin_tpl_2_delay_0;
    reg [15:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_3_q;
    reg [15:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_3_delay_0;
    reg [15:0] redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_3_delay_1;
    reg [15:0] redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_3_q;
    reg [15:0] redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_3_delay_0;
    reg [15:0] redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_3_delay_1;
    reg [0:0] redist6_ChannelIn_cunroll_x_in_4_TimeRef_tpl_2_q;
    reg [0:0] redist6_ChannelIn_cunroll_x_in_4_TimeRef_tpl_2_delay_0;
    reg [6:0] redist7_ChannelIn_cunroll_x_in_5_prach_outstart_tpl_1_q;
    reg [9:0] redist8_ChannelIn_cunroll_x_in_6_prach_outend_tpl_1_q;
    reg [15:0] redist9_Mux_q_2_q;
    reg [0:0] redist10_And_rsrvd_fix_q_1_q;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // Mux(MUX,12)@0 + 1
    assign Mux_s = in_3_chin_tpl;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (Mux_s)
                8'b00000000 : Mux_q <= in_7_ch0_info_tpl;
                8'b00000001 : Mux_q <= in_8_ch1_info_tpl;
                8'b00000010 : Mux_q <= in_9_ch2_info_tpl;
                8'b00000011 : Mux_q <= in_10_ch3_info_tpl;
                default : Mux_q <= 16'b0;
            endcase
        end
    end

    // redist9_Mux_q_2(DELAY,52)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_Mux_q_2_q <= $unsigned(Mux_q);
        end
    end

    // redist6_ChannelIn_cunroll_x_in_4_TimeRef_tpl_2(DELAY,49)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_ChannelIn_cunroll_x_in_4_TimeRef_tpl_2_delay_0 <= $unsigned(in_4_TimeRef_tpl);
            redist6_ChannelIn_cunroll_x_in_4_TimeRef_tpl_2_q <= redist6_ChannelIn_cunroll_x_in_4_TimeRef_tpl_2_delay_0;
        end
    end

    // redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_q_1(DELAY,43)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_q_1_q <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_q);
        end
    end

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // CmpEQ(LOGICAL,5)@2
    assign CmpEQ_b = {7'b0000000, GND_q};
    assign CmpEQ_q = $unsigned(redist3_ChannelIn_cunroll_x_in_3_chin_tpl_2_q == CmpEQ_b ? 1'b1 : 1'b0);

    // redist8_ChannelIn_cunroll_x_in_6_prach_outend_tpl_1(DELAY,51)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist8_ChannelIn_cunroll_x_in_6_prach_outend_tpl_1_q <= '0;
        end
        else
        begin
            redist8_ChannelIn_cunroll_x_in_6_prach_outend_tpl_1_q <= $unsigned(in_6_prach_outend_tpl);
        end
    end

    // Counter(COUNTER,11)@0 + 1
    // low=0, high=1023, step=1, init=1023
    always @ (posedge clk)
    begin
        if (areset)
        begin
            Counter_i <= 10'd1023;
        end
        else if (in_2_vin_tpl == 1'b1)
        begin
            Counter_i <= $unsigned(Counter_i) + $unsigned(10'd1);
        end
    end
    assign Counter_q = Counter_i[9:0];

    // CmpLT(COMPARE,8)@1
    assign CmpLT_a = {2'b00, Counter_q};
    assign CmpLT_b = {2'b00, redist8_ChannelIn_cunroll_x_in_6_prach_outend_tpl_1_q};
    assign CmpLT_o = $unsigned(CmpLT_a) - $unsigned(CmpLT_b);
    assign CmpLT_c[0] = CmpLT_o[11];

    // redist7_ChannelIn_cunroll_x_in_5_prach_outstart_tpl_1(DELAY,50)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist7_ChannelIn_cunroll_x_in_5_prach_outstart_tpl_1_q <= '0;
        end
        else
        begin
            redist7_ChannelIn_cunroll_x_in_5_prach_outstart_tpl_1_q <= $unsigned(in_5_prach_outstart_tpl);
        end
    end

    // CmpGE(COMPARE,6)@1
    assign CmpGE_a = {2'b00, Counter_q};
    assign CmpGE_b = {5'b00000, redist7_ChannelIn_cunroll_x_in_5_prach_outstart_tpl_1_q};
    assign CmpGE_o = $unsigned(CmpGE_a) - $unsigned(CmpGE_b);
    assign CmpGE_n[0] = ~ (CmpGE_o[11]);

    // And2(LOGICAL,4)@1 + 1
    assign And2_qi = CmpGE_n & CmpLT_c;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    And2_delay ( .xin(And2_qi), .xout(And2_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist2_ChannelIn_cunroll_x_in_2_vin_tpl_2(DELAY,45)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_ChannelIn_cunroll_x_in_2_vin_tpl_2_delay_0 <= '0;
        end
        else
        begin
            redist2_ChannelIn_cunroll_x_in_2_vin_tpl_2_delay_0 <= $unsigned(in_2_vin_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_ChannelIn_cunroll_x_in_2_vin_tpl_2_q <= redist2_ChannelIn_cunroll_x_in_2_vin_tpl_2_delay_0;
        end
    end

    // And_rsrvd_fix(LOGICAL,2)@2
    assign And_rsrvd_fix_q = redist2_ChannelIn_cunroll_x_in_2_vin_tpl_2_q & And2_q;

    // And1(LOGICAL,3)@2
    assign And1_q = And_rsrvd_fix_q & CmpEQ_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x(MUX,27)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_s = And1_q;
    always @(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_s or redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_q_1_q or redist6_ChannelIn_cunroll_x_in_4_TimeRef_tpl_2_q)
    begin
        unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_s)
            1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_q = redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_q_1_q;
            1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_q = redist6_ChannelIn_cunroll_x_in_4_TimeRef_tpl_2_q;
            default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_q = 1'b0;
        endcase
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_PreShift_1(BITSHIFT,40)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_PreShift_1_qint = { GND_q, 8'b00000000 };
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_PreShift_1_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_PreShift_1_qint[8:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_PreShift_1(BITSHIFT,39)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_PreShift_1_qint = { GND_q, 8'b00000000 };
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_PreShift_1_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_PreShift_1_qint[8:0];

    // redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_3(DELAY,48)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_3_delay_0 <= $unsigned(in_1_imag_din_tpl);
            redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_3_delay_1 <= redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_3_delay_0;
            redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_3_q <= redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_3_delay_1;
        end
    end

    // redist10_And_rsrvd_fix_q_1(DELAY,53)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist10_And_rsrvd_fix_q_1_q <= '0;
        end
        else
        begin
            redist10_And_rsrvd_fix_q_1_q <= $unsigned(And_rsrvd_fix_q);
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Not_x(LOGICAL,19)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Not_x_q = ~ (redist10_And_rsrvd_fix_q_1_q);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_And_x(LOGICAL,17)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_And_x_q = And_rsrvd_fix_q & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Not_x_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_x(MUX,30)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_x_s = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_And_x_q;
    always @(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_x_s or redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_3_q or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_PreShift_1_q)
    begin
        unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_x_s)
            1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_x_q = redist5_ChannelIn_cunroll_x_in_1_imag_din_tpl_3_q;
            1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_x_q = {7'b0000000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_PreShift_1_q};
            default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_x_q = 16'b0;
        endcase
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Or_x(LOGICAL,20)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Or_x_q = And_rsrvd_fix_q | redist10_And_rsrvd_fix_q_1_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Not_x(LOGICAL,24)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Not_x_q = ~ (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Or_x_q);

    // redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Or_x_q_24(DELAY,44)
    dspba_delay_ver #( .width(1), .depth(24), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Or_x_q_24 ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Or_x_q), .xout(redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Or_x_q_24_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_And_x(LOGICAL,22)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_And_x_q = redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Or_x_q_24_q & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Not_x_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_x(MUX,35)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_x_s = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_And_x_q;
    always @(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_x_s or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_x_q or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_PreShift_1_q)
    begin
        unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_x_s)
            1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_imag_x_q;
            1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_x_q = {7'b0000000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_PreShift_1_q};
            default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_x_q = 16'b0;
        endcase
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_PreShift_1(BITSHIFT,38)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_PreShift_1_qint = { GND_q, 8'b00000000 };
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_PreShift_1_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_PreShift_1_qint[8:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_PreShift_1(BITSHIFT,37)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_PreShift_1_qint = { GND_q, 8'b00000000 };
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_PreShift_1_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_PreShift_1_qint[8:0];

    // redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_3(DELAY,47)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_3_delay_0 <= $unsigned(in_1_real_din_tpl);
            redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_3_delay_1 <= redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_3_delay_0;
            redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_3_q <= redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_3_delay_1;
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_x(MUX,31)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_x_s = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_And_x_q;
    always @(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_x_s or redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_3_q or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_PreShift_1_q)
    begin
        unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_x_s)
            1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_x_q = redist4_ChannelIn_cunroll_x_in_1_real_din_tpl_3_q;
            1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_x_q = {7'b0000000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_PreShift_1_q};
            default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_x_q = 16'b0;
        endcase
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_x(MUX,36)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_x_s = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_And_x_q;
    always @(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_x_s or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_x_q or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_PreShift_1_q)
    begin
        unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_x_s)
            1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Mux1_real_x_q;
            1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_x_q = {7'b0000000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_PreShift_1_q};
            default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_x_q = 16'b0;
        endcase
    end

    // redist3_ChannelIn_cunroll_x_in_3_chin_tpl_2(DELAY,46)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_ChannelIn_cunroll_x_in_3_chin_tpl_2_delay_0 <= $unsigned(in_3_chin_tpl);
            redist3_ChannelIn_cunroll_x_in_3_chin_tpl_2_q <= redist3_ChannelIn_cunroll_x_in_3_chin_tpl_2_delay_0;
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Or_x(LOGICAL,25)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Or_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Or_x_q | redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_front_Or_x_q_24_q;

    // ChannelOut_cunroll_x(PORTOUT,14)@2 + 1
    assign out_2_vout_tpl = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Or_x_q;
    assign out_3_cout_tpl = redist3_ChannelIn_cunroll_x_in_3_chin_tpl_2_q;
    assign out_1_real_dout_tpl = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_real_x_q;
    assign out_1_imag_dout_tpl = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_Zero_insertion_Zeropad_rear_Mux1_imag_x_q;
    assign out_4_TimeReference_tpl = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_latch_0L_Mux_x_q;
    assign out_5_ch_info_tpl = redist9_Mux_q_2_q;

endmodule
