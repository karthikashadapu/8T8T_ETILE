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

// SystemVerilog created from prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection
// SystemVerilog created on Wed Nov  6 19:28:32 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection (
    input wire [0:0] in_1_valid_m_tpl,
    input wire [7:0] in_2_c_m_tpl,
    input wire [15:0] in_3_real_din_m_tpl,
    input wire [15:0] in_3_imag_din_m_tpl,
    input wire [3:0] in_4_fftsize_m_tpl,
    input wire [0:0] in_5_sop_m_tpl,
    input wire [7:0] in_6_bwby10_m_tpl,
    input wire [28:0] in_7_tref_m_tpl,
    input wire [3:0] in_8_NFFT_m_tpl,
    input wire [22:0] in_9_cplen_m_tpl,
    input wire [0:0] in_10_cbar_mplane_sel_tpl,
    input wire [0:0] in_11_valid_c_tpl,
    input wire [7:0] in_12_c_c_tpl,
    input wire [15:0] in_13_real_din_c_tpl,
    input wire [15:0] in_13_imag_din_c_tpl,
    input wire [3:0] in_14_fftsize_c_tpl,
    input wire [0:0] in_15_sop_c_tpl,
    input wire [3:0] in_16_bwby10_c_tpl,
    input wire [28:0] in_17_tref_c_tpl,
    input wire [3:0] in_18_NFFT_c_tpl,
    input wire [25:0] in_19_cplen_c_tpl,
    output wire [0:0] out_1_vout_tpl,
    output wire [7:0] out_2_cout_tpl,
    output wire [15:0] out_3_real_dout_tpl,
    output wire [15:0] out_3_imag_dout_tpl,
    output wire [3:0] out_4_qFFTSize_tpl,
    output wire [0:0] out_5_qSOP_tpl,
    output wire [7:0] out_6_qBWby10_tpl,
    output wire [28:0] out_7_T_ref_tpl,
    output wire [3:0] out_8_qNFFT_tpl,
    output wire [25:0] out_9_CPLen_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [0:0] Mux_s;
    reg [0:0] Mux_q;
    wire [0:0] Mux1_s;
    reg [7:0] Mux1_q;
    wire [0:0] Mux3_s;
    reg [3:0] Mux3_q;
    wire [0:0] Mux4_s;
    reg [0:0] Mux4_q;
    wire [0:0] Mux5_s;
    reg [7:0] Mux5_q;
    wire [0:0] Mux6_s;
    reg [28:0] Mux6_q;
    wire [0:0] Mux7_s;
    reg [3:0] Mux7_q;
    wire [0:0] Mux8_s;
    reg [25:0] Mux8_q;
    wire [0:0] Mux2_imag_x_s;
    reg [15:0] Mux2_imag_x_q;
    wire [0:0] Mux2_real_x_s;
    reg [15:0] Mux2_real_x_q;

    import prach_shortFormat_fftShift_prach_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // Mux8(MUX,9)@0 + 1
    assign Mux8_s = in_10_cbar_mplane_sel_tpl;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (Mux8_s)
                1'b0 : Mux8_q <= in_19_cplen_c_tpl;
                1'b1 : Mux8_q <= {3'b000, in_9_cplen_m_tpl};
                default : Mux8_q <= 26'b0;
            endcase
        end
    end

    // Mux7(MUX,8)@0 + 1
    assign Mux7_s = in_10_cbar_mplane_sel_tpl;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (Mux7_s)
                1'b0 : Mux7_q <= in_18_NFFT_c_tpl;
                1'b1 : Mux7_q <= in_8_NFFT_m_tpl;
                default : Mux7_q <= 4'b0;
            endcase
        end
    end

    // Mux6(MUX,7)@0 + 1
    assign Mux6_s = in_10_cbar_mplane_sel_tpl;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (Mux6_s)
                1'b0 : Mux6_q <= in_17_tref_c_tpl;
                1'b1 : Mux6_q <= in_7_tref_m_tpl;
                default : Mux6_q <= 29'b0;
            endcase
        end
    end

    // Mux5(MUX,6)@0 + 1
    assign Mux5_s = in_10_cbar_mplane_sel_tpl;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (Mux5_s)
                1'b0 : Mux5_q <= {4'b0000, in_16_bwby10_c_tpl};
                1'b1 : Mux5_q <= in_6_bwby10_m_tpl;
                default : Mux5_q <= 8'b0;
            endcase
        end
    end

    // Mux4(MUX,5)@0 + 1
    assign Mux4_s = in_10_cbar_mplane_sel_tpl;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (Mux4_s)
                1'b0 : Mux4_q <= in_15_sop_c_tpl;
                1'b1 : Mux4_q <= in_5_sop_m_tpl;
                default : Mux4_q <= 1'b0;
            endcase
        end
    end

    // Mux3(MUX,4)@0 + 1
    assign Mux3_s = in_10_cbar_mplane_sel_tpl;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (Mux3_s)
                1'b0 : Mux3_q <= in_14_fftsize_c_tpl;
                1'b1 : Mux3_q <= in_4_fftsize_m_tpl;
                default : Mux3_q <= 4'b0;
            endcase
        end
    end

    // Mux2_imag_x(MUX,12)@0 + 1
    assign Mux2_imag_x_s = in_10_cbar_mplane_sel_tpl;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (Mux2_imag_x_s)
                1'b0 : Mux2_imag_x_q <= in_13_imag_din_c_tpl;
                1'b1 : Mux2_imag_x_q <= in_3_imag_din_m_tpl;
                default : Mux2_imag_x_q <= 16'b0;
            endcase
        end
    end

    // Mux2_real_x(MUX,13)@0 + 1
    assign Mux2_real_x_s = in_10_cbar_mplane_sel_tpl;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (Mux2_real_x_s)
                1'b0 : Mux2_real_x_q <= in_13_real_din_c_tpl;
                1'b1 : Mux2_real_x_q <= in_3_real_din_m_tpl;
                default : Mux2_real_x_q <= 16'b0;
            endcase
        end
    end

    // Mux1(MUX,3)@0 + 1
    assign Mux1_s = in_10_cbar_mplane_sel_tpl;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (Mux1_s)
                1'b0 : Mux1_q <= in_12_c_c_tpl;
                1'b1 : Mux1_q <= in_2_c_m_tpl;
                default : Mux1_q <= 8'b0;
            endcase
        end
    end

    // Mux(MUX,2)@0 + 1
    assign Mux_s = in_10_cbar_mplane_sel_tpl;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            Mux_q <= 1'b0;
        end
        else
        begin
            unique case (Mux_s)
                1'b0 : Mux_q <= in_11_valid_c_tpl;
                1'b1 : Mux_q <= in_1_valid_m_tpl;
                default : Mux_q <= 1'b0;
            endcase
        end
    end

    // ChannelOut_cunroll_x(PORTOUT,11)@1 + 1
    assign out_1_vout_tpl = Mux_q;
    assign out_2_cout_tpl = Mux1_q;
    assign out_3_real_dout_tpl = Mux2_real_x_q;
    assign out_3_imag_dout_tpl = Mux2_imag_x_q;
    assign out_4_qFFTSize_tpl = Mux3_q;
    assign out_5_qSOP_tpl = Mux4_q;
    assign out_6_qBWby10_tpl = Mux5_q;
    assign out_7_T_ref_tpl = Mux6_q;
    assign out_8_qNFFT_tpl = Mux7_q;
    assign out_9_CPLen_tpl = Mux8_q;

endmodule
