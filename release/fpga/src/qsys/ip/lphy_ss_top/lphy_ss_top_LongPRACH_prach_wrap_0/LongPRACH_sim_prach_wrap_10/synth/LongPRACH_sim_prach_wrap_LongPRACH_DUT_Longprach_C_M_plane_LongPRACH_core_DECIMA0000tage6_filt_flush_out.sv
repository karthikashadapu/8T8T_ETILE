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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage6_filt_flush_out
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000tage6_filt_flush_out (
    input wire [0:0] in_2_valid_in_tpl,
    input wire [7:0] in_3_ch_in_tpl,
    input wire [15:0] in_1_real_data_in_tpl,
    input wire [15:0] in_1_imag_data_in_tpl,
    input wire [0:0] in_4_flush_en_tpl,
    output wire [0:0] out_2_valid_out_tpl,
    output wire [7:0] out_3_ch_out_tpl,
    output wire [15:0] out_1_real_data_out_tpl,
    output wire [15:0] out_1_imag_data_out_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [8:0] Const2_q;
    reg [0:0] Loop_rsrvd_fix_running;
    reg [0:0] Loop_rsrvd_fix_pending;
    reg [0:0] Loop_rsrvd_fix_v;
    reg [8:0] Loop_rsrvd_fix_q0;
    reg [8:0] Loop_rsrvd_fix_e0;
    wire [0:0] Loop_rsrvd_fix_f0;
    wire [0:0] Loop_rsrvd_fix_l0;
    wire [0:0] Mux_s;
    reg [0:0] Mux_q;
    wire [0:0] Or_rsrvd_fix_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage6_filt_flush_out_Fallingedge_And_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage6_filt_flush_out_Fallingedge_Not_x_q;
    reg [0:0] redist0_ChannelIn_cunroll_x_in_2_valid_in_tpl_1_q;
    reg [7:0] redist1_ChannelIn_cunroll_x_in_3_ch_in_tpl_1_q;
    reg [15:0] redist2_ChannelIn_cunroll_x_in_1_real_data_in_tpl_1_q;
    reg [15:0] redist3_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_1_q;
    reg [0:0] redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1_q;
    reg [0:0] redist5_ChannelIn_cunroll_x_in_4_flush_en_tpl_4_q;
    reg [0:0] redist5_ChannelIn_cunroll_x_in_4_flush_en_tpl_4_delay_0;
    reg [0:0] redist5_ChannelIn_cunroll_x_in_4_flush_en_tpl_4_delay_1;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist3_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_1(DELAY,17)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_1_q <= $unsigned(in_1_imag_data_in_tpl);
        end
    end

    // redist2_ChannelIn_cunroll_x_in_1_real_data_in_tpl_1(DELAY,16)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_ChannelIn_cunroll_x_in_1_real_data_in_tpl_1_q <= $unsigned(in_1_real_data_in_tpl);
        end
    end

    // redist1_ChannelIn_cunroll_x_in_3_ch_in_tpl_1(DELAY,15)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_ChannelIn_cunroll_x_in_3_ch_in_tpl_1_q <= $unsigned(in_3_ch_in_tpl);
        end
    end

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // redist0_ChannelIn_cunroll_x_in_2_valid_in_tpl_1(DELAY,14)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_ChannelIn_cunroll_x_in_2_valid_in_tpl_1_q <= '0;
        end
        else
        begin
            redist0_ChannelIn_cunroll_x_in_2_valid_in_tpl_1_q <= $unsigned(in_2_valid_in_tpl);
        end
    end

    // Const2(CONSTANT,4)
    assign Const2_q = $unsigned(9'b100101100);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage6_filt_flush_out_Fallingedge_Not_x(LOGICAL,12)@0
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage6_filt_flush_out_Fallingedge_Not_x_q = ~ (in_4_flush_en_tpl);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage6_filt_flush_out_Fallingedge_And_x(LOGICAL,11)@0
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage6_filt_flush_out_Fallingedge_And_x_q = redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1_q & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage6_filt_flush_out_Fallingedge_Not_x_q;

    // Loop_rsrvd_fix(LOOP,5)@0 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            Loop_rsrvd_fix_running <= $unsigned(1'b0);
            Loop_rsrvd_fix_pending <= $unsigned(1'b0);
            Loop_rsrvd_fix_q0 <= 9'b0;
            Loop_rsrvd_fix_e0 <= '1;
            Loop_rsrvd_fix_v <= $unsigned(1'b0);
        end
        else
        begin
            Loop_rsrvd_fix_v <= $unsigned(1'b0);
            if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage6_filt_flush_out_Fallingedge_And_x_q == 1'b1)
            begin
                Loop_rsrvd_fix_e0 <= $unsigned(Const2_q) - $unsigned(9'd1);
                Loop_rsrvd_fix_q0 <= 9'b0;
                Loop_rsrvd_fix_running <= $unsigned(1'b1);
                if (VCC_q == 1'b1)
                begin
                    Loop_rsrvd_fix_pending <= $unsigned(1'b0);
                    Loop_rsrvd_fix_v <= $unsigned(1'b1);
                end
                else
                begin
                    Loop_rsrvd_fix_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (VCC_q == 1'b1)
                begin
                    if (Loop_rsrvd_fix_pending == 1'b1)
                    begin
                        Loop_rsrvd_fix_v <= $unsigned(1'b1);
                    end
                    else if (Loop_rsrvd_fix_running == 1'b1)
                    begin
                        Loop_rsrvd_fix_v <= $unsigned(1'b1);
                        if (Loop_rsrvd_fix_q0 == Loop_rsrvd_fix_e0)
                        begin
                            Loop_rsrvd_fix_q0 <= 9'b0;
                            Loop_rsrvd_fix_running <= $unsigned(1'b0);
                            Loop_rsrvd_fix_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            Loop_rsrvd_fix_q0 <= $unsigned(Loop_rsrvd_fix_q0) + $unsigned(9'd1);
                        end
                    end
                    Loop_rsrvd_fix_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign Loop_rsrvd_fix_f0 = $unsigned(Loop_rsrvd_fix_q0 == 9'b000000000 ? 1'b1 : 1'b0);
    assign Loop_rsrvd_fix_l0 = $unsigned(Loop_rsrvd_fix_q0 == Loop_rsrvd_fix_e0 ? 1'b1 : 1'b0);

    // redist5_ChannelIn_cunroll_x_in_4_flush_en_tpl_4(DELAY,19)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist5_ChannelIn_cunroll_x_in_4_flush_en_tpl_4_delay_0 <= '0;
        end
        else
        begin
            redist5_ChannelIn_cunroll_x_in_4_flush_en_tpl_4_delay_0 <= $unsigned(redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_ChannelIn_cunroll_x_in_4_flush_en_tpl_4_delay_1 <= redist5_ChannelIn_cunroll_x_in_4_flush_en_tpl_4_delay_0;
            redist5_ChannelIn_cunroll_x_in_4_flush_en_tpl_4_q <= redist5_ChannelIn_cunroll_x_in_4_flush_en_tpl_4_delay_1;
        end
    end

    // redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1(DELAY,18)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1_q <= '0;
        end
        else
        begin
            redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1_q <= $unsigned(in_4_flush_en_tpl);
        end
    end

    // Or_rsrvd_fix(LOGICAL,7)@1
    assign Or_rsrvd_fix_q = redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1_q | redist5_ChannelIn_cunroll_x_in_4_flush_en_tpl_4_q | Loop_rsrvd_fix_v;

    // Mux(MUX,6)@1
    assign Mux_s = Or_rsrvd_fix_q;
    always @(Mux_s or redist0_ChannelIn_cunroll_x_in_2_valid_in_tpl_1_q or GND_q)
    begin
        unique case (Mux_s)
            1'b0 : Mux_q = redist0_ChannelIn_cunroll_x_in_2_valid_in_tpl_1_q;
            1'b1 : Mux_q = GND_q;
            default : Mux_q = 1'b0;
        endcase
    end

    // ChannelOut_cunroll_x(PORTOUT,10)@1 + 1
    assign out_2_valid_out_tpl = Mux_q;
    assign out_3_ch_out_tpl = redist1_ChannelIn_cunroll_x_in_3_ch_in_tpl_1_q;
    assign out_1_real_data_out_tpl = redist2_ChannelIn_cunroll_x_in_1_real_data_in_tpl_1_q;
    assign out_1_imag_data_out_tpl = redist3_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_1_q;

endmodule
