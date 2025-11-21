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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000Stage1_filt_flush_in (
    input wire [0:0] in_2_valid_in_tpl,
    input wire [7:0] in_3_ch_in_tpl,
    input wire [15:0] in_1_real_data_in_tpl,
    input wire [15:0] in_1_imag_data_in_tpl,
    input wire [0:0] in_4_flush_en_tpl,
    output wire [0:0] out_2_valid_out_tpl,
    output wire [7:0] out_3_ch_out_tpl,
    output wire [16:0] out_1_real_data_out_tpl,
    output wire [16:0] out_1_imag_data_out_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [0:0] Mux_s;
    reg [0:0] Mux_q;
    wire [0:0] Mux1_s;
    reg [7:0] Mux1_q;
    wire [1:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Counter1_x_q;
    (* preserve_syn_only *) reg [1:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Counter1_x_i;
    reg [1:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Lut1_x_q;
    wire [0:0] Mux2_imag_x_s;
    reg [16:0] Mux2_imag_x_q;
    wire [0:0] Mux2_real_x_s;
    reg [16:0] Mux2_real_x_q;
    wire [15:0] Mux2_real_PreShift_1_q;
    wire [15:0] Mux2_real_PreShift_1_qint;
    wire [15:0] Mux2_imag_PreShift_1_q;
    wire [15:0] Mux2_imag_PreShift_1_qint;
    reg [0:0] redist0_ChannelIn_cunroll_x_in_2_valid_in_tpl_1_q;
    reg [7:0] redist1_ChannelIn_cunroll_x_in_3_ch_in_tpl_1_q;
    reg [15:0] redist2_ChannelIn_cunroll_x_in_1_real_data_in_tpl_1_q;
    reg [15:0] redist3_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_1_q;
    reg [0:0] redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1_q;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // Mux2_imag_PreShift_1(BITSHIFT,15)@1
    assign Mux2_imag_PreShift_1_qint = { GND_q, 15'b000000000000000 };
    assign Mux2_imag_PreShift_1_q = Mux2_imag_PreShift_1_qint[15:0];

    // redist3_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_1(DELAY,20)
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

    // redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1(DELAY,21)
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

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // Mux2_imag_x(MUX,11)@1
    assign Mux2_imag_x_s = redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1_q;
    always @(Mux2_imag_x_s or redist3_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_1_q or Mux2_imag_PreShift_1_q)
    begin
        unique case (Mux2_imag_x_s)
            1'b0 : Mux2_imag_x_q = {{1{redist3_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_1_q[15]}}, redist3_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_1_q};
            1'b1 : Mux2_imag_x_q = {1'b0, Mux2_imag_PreShift_1_q};
            default : Mux2_imag_x_q = 17'b0;
        endcase
    end

    // Mux2_real_PreShift_1(BITSHIFT,14)@1
    assign Mux2_real_PreShift_1_qint = { GND_q, 15'b000000000000000 };
    assign Mux2_real_PreShift_1_q = Mux2_real_PreShift_1_qint[15:0];

    // redist2_ChannelIn_cunroll_x_in_1_real_data_in_tpl_1(DELAY,19)
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

    // Mux2_real_x(MUX,12)@1
    assign Mux2_real_x_s = redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1_q;
    always @(Mux2_real_x_s or redist2_ChannelIn_cunroll_x_in_1_real_data_in_tpl_1_q or Mux2_real_PreShift_1_q)
    begin
        unique case (Mux2_real_x_s)
            1'b0 : Mux2_real_x_q = {{1{redist2_ChannelIn_cunroll_x_in_1_real_data_in_tpl_1_q[15]}}, redist2_ChannelIn_cunroll_x_in_1_real_data_in_tpl_1_q};
            1'b1 : Mux2_real_x_q = {1'b0, Mux2_real_PreShift_1_q};
            default : Mux2_real_x_q = 17'b0;
        endcase
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Counter1_x(COUNTER,8)@0 + 1
    // low=0, high=3, step=1, init=3
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Counter1_x_i <= 2'd3;
        end
        else if (in_4_flush_en_tpl == 1'b1)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Counter1_x_i <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Counter1_x_i) + $unsigned(2'd1);
        end
    end
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Counter1_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Counter1_x_i[1:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Lut1_x(LOOKUP,9)@1
    always @(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Counter1_x_q)
    begin
        // Begin reserved scope level
        unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Counter1_x_q)
            2'b00 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Lut1_x_q = 2'b00;
            2'b01 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Lut1_x_q = 2'b01;
            2'b10 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Lut1_x_q = 2'b10;
            2'b11 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Lut1_x_q = 2'b11;
            default : begin
                          // unreachable
                          LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Lut1_x_q = 2'bxx;
                      end
        endcase
        // End reserved scope level
    end

    // redist1_ChannelIn_cunroll_x_in_3_ch_in_tpl_1(DELAY,18)
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

    // Mux1(MUX,5)@1
    assign Mux1_s = redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1_q;
    always @(Mux1_s or redist1_ChannelIn_cunroll_x_in_3_ch_in_tpl_1_q or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Lut1_x_q)
    begin
        unique case (Mux1_s)
            1'b0 : Mux1_q = redist1_ChannelIn_cunroll_x_in_3_ch_in_tpl_1_q;
            1'b1 : Mux1_q = {6'b000000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1_Stage1_filt_flush_in_ch_pulse_Lut1_x_q};
            default : Mux1_q = 8'b0;
        endcase
    end

    // redist0_ChannelIn_cunroll_x_in_2_valid_in_tpl_1(DELAY,17)
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

    // Mux(MUX,4)@1
    assign Mux_s = redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1_q;
    always @(Mux_s or redist0_ChannelIn_cunroll_x_in_2_valid_in_tpl_1_q or redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1_q)
    begin
        unique case (Mux_s)
            1'b0 : Mux_q = redist0_ChannelIn_cunroll_x_in_2_valid_in_tpl_1_q;
            1'b1 : Mux_q = redist4_ChannelIn_cunroll_x_in_4_flush_en_tpl_1_q;
            default : Mux_q = 1'b0;
        endcase
    end

    // ChannelOut_cunroll_x(PORTOUT,7)@1 + 1
    assign out_2_valid_out_tpl = Mux_q;
    assign out_3_ch_out_tpl = Mux1_q;
    assign out_1_real_data_out_tpl = Mux2_real_x_q;
    assign out_1_imag_data_out_tpl = Mux2_imag_x_q;

endmodule
