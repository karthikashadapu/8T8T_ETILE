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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem (
    input wire [0:0] in_2_vin_tpl,
    input wire [7:0] in_3_cin_tpl,
    input wire [15:0] in_1_real_din_tpl,
    input wire [15:0] in_1_imag_din_tpl,
    input wire [3:0] in_7_size_tpl,
    input wire [15:0] in_8_nsc_tpl,
    input wire [0:0] in_9_hcs_bypass_tpl,
    input wire [63:0] in_10_TimeRef_SFN_tpl,
    input wire [1:0] in_11_eAxC_tpl,
    input wire [63:0] in_12_sym_metadata_tpl,
    input wire [0:0] in_5_vout_tpl,
    input wire [7:0] in_6_cout_tpl,
    input wire [15:0] in_4_real_dout_tpl,
    input wire [15:0] in_4_imag_dout_tpl,
    output wire [0:0] out_1_Out1_tpl,
    output wire [7:0] out_2_Out2_tpl,
    output wire [16:0] out_3_real_Out3_tpl,
    output wire [16:0] out_3_imag_Out3_tpl,
    output wire [3:0] out_5_size_out_tpl,
    output wire [15:0] out_4_nsc_out_tpl,
    output wire [63:0] out_6_SFN_tpl,
    output wire [1:0] out_7_eAxC_out_tpl,
    output wire [63:0] out_8_sym_metadataout_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [0:0] Mux1_s;
    reg [0:0] Mux1_q;
    wire [0:0] Mux2_s;
    reg [7:0] Mux2_q;
    wire [0:0] Mux3_imag_x_s;
    reg [16:0] Mux3_imag_x_q;
    wire [0:0] Mux3_real_x_s;
    reg [16:0] Mux3_real_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_RISING_EDGE_And_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_RISING_EDGE_Not1_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_s;
    reg [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_s;
    reg [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_q;
    wire [16:0] Mux3_real_PreShift_1_q;
    wire [16:0] Mux3_real_PreShift_1_qint;
    wire [16:0] Mux3_imag_PreShift_1_q;
    wire [16:0] Mux3_imag_PreShift_1_qint;
    reg [15:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_q_1_q;
    reg [3:0] redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_q_1_q;
    reg [0:0] redist2_Mux1_q_1_q;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_q_1(DELAY,18)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_q);
        end
    end

    // redist2_Mux1_q_1(DELAY,20)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_Mux1_q_1_q <= '0;
        end
        else
        begin
            redist2_Mux1_q_1_q <= $unsigned(Mux1_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_RISING_EDGE_Not1_x(LOGICAL,10)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_RISING_EDGE_Not1_x_q = ~ (redist2_Mux1_q_1_q);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_RISING_EDGE_And_x(LOGICAL,9)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_RISING_EDGE_And_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_RISING_EDGE_Not1_x_q & Mux1_q;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x(MUX,14)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_RISING_EDGE_And_x_q;
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_s or redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_q_1_q or in_8_nsc_tpl)
    begin
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_s)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_q = redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_q_1_q;
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_q = in_8_nsc_tpl;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_q = 16'b0;
        endcase
    end

    // redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_q_1(DELAY,19)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x(MUX,12)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_RISING_EDGE_And_x_q;
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_s or redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_q_1_q or in_7_size_tpl)
    begin
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_s)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_q = redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_q_1_q;
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_q = in_7_size_tpl;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_q = 4'b0;
        endcase
    end

    // Mux3_imag_PreShift_1(BITSHIFT,17)@0
    assign Mux3_imag_PreShift_1_qint = { in_1_imag_din_tpl, 1'b0 };
    assign Mux3_imag_PreShift_1_q = Mux3_imag_PreShift_1_qint[16:0];

    // Mux3_imag_x(MUX,4)@0
    assign Mux3_imag_x_s = in_9_hcs_bypass_tpl;
    always @(Mux3_imag_x_s or in_4_imag_dout_tpl or Mux3_imag_PreShift_1_q)
    begin
        unique case (Mux3_imag_x_s)
            1'b0 : Mux3_imag_x_q = {{1{in_4_imag_dout_tpl[15]}}, in_4_imag_dout_tpl};
            1'b1 : Mux3_imag_x_q = Mux3_imag_PreShift_1_q;
            default : Mux3_imag_x_q = 17'b0;
        endcase
    end

    // Mux3_real_PreShift_1(BITSHIFT,16)@0
    assign Mux3_real_PreShift_1_qint = { in_1_real_din_tpl, 1'b0 };
    assign Mux3_real_PreShift_1_q = Mux3_real_PreShift_1_qint[16:0];

    // Mux3_real_x(MUX,5)@0
    assign Mux3_real_x_s = in_9_hcs_bypass_tpl;
    always @(Mux3_real_x_s or in_4_real_dout_tpl or Mux3_real_PreShift_1_q)
    begin
        unique case (Mux3_real_x_s)
            1'b0 : Mux3_real_x_q = {{1{in_4_real_dout_tpl[15]}}, in_4_real_dout_tpl};
            1'b1 : Mux3_real_x_q = Mux3_real_PreShift_1_q;
            default : Mux3_real_x_q = 17'b0;
        endcase
    end

    // Mux2(MUX,3)@0
    assign Mux2_s = in_9_hcs_bypass_tpl;
    always @(Mux2_s or in_6_cout_tpl or in_3_cin_tpl)
    begin
        unique case (Mux2_s)
            1'b0 : Mux2_q = in_6_cout_tpl;
            1'b1 : Mux2_q = in_3_cin_tpl;
            default : Mux2_q = 8'b0;
        endcase
    end

    // Mux1(MUX,2)@0
    assign Mux1_s = in_9_hcs_bypass_tpl;
    always @(Mux1_s or in_5_vout_tpl or in_2_vin_tpl)
    begin
        unique case (Mux1_s)
            1'b0 : Mux1_q = in_5_vout_tpl;
            1'b1 : Mux1_q = in_2_vin_tpl;
            default : Mux1_q = 1'b0;
        endcase
    end

    // channel_HSC1_out_cunroll_x(PORTOUT,8)@0 + 1
    assign out_1_Out1_tpl = Mux1_q;
    assign out_2_Out2_tpl = Mux2_q;
    assign out_3_real_Out3_tpl = Mux3_real_x_q;
    assign out_3_imag_Out3_tpl = Mux3_imag_x_q;
    assign out_5_size_out_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L_Mux_x_q;
    assign out_4_nsc_out_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_latch_0L1_Mux_x_q;
    assign out_6_SFN_tpl = in_10_TimeRef_SFN_tpl;
    assign out_7_eAxC_out_tpl = in_11_eAxC_tpl;
    assign out_8_sym_metadataout_tpl = in_12_sym_metadata_tpl;

endmodule
