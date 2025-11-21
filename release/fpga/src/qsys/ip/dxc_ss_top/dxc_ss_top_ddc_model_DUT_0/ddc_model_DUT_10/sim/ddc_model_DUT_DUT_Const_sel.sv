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

// SystemVerilog created from ddc_model_DUT_DUT_Const_sel
// SystemVerilog created on Thu Jan  9 15:36:33 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ddc_model_DUT_DUT_Const_sel (
    input wire [0:0] in_3_vin_d1_tpl,
    input wire [7:0] in_4_cin_d1_tpl,
    input wire [31:0] in_1_0_real_din_d1_tpl,
    input wire [31:0] in_1_0_imag_din_d1_tpl,
    input wire [31:0] in_1_1_real_din_d1_tpl,
    input wire [31:0] in_1_1_imag_din_d1_tpl,
    input wire [31:0] in_1_2_real_din_d1_tpl,
    input wire [31:0] in_1_2_imag_din_d1_tpl,
    input wire [31:0] in_1_3_real_din_d1_tpl,
    input wire [31:0] in_1_3_imag_din_d1_tpl,
    input wire [0:0] in_5_mux_sel_tpl,
    input wire [31:0] in_2_0_real_din_d2_tpl,
    input wire [31:0] in_2_0_imag_din_d2_tpl,
    input wire [31:0] in_2_1_real_din_d2_tpl,
    input wire [31:0] in_2_1_imag_din_d2_tpl,
    input wire [31:0] in_2_2_real_din_d2_tpl,
    input wire [31:0] in_2_2_imag_din_d2_tpl,
    input wire [31:0] in_2_3_real_din_d2_tpl,
    input wire [31:0] in_2_3_imag_din_d2_tpl,
    output wire [0:0] out_2_vin_a1_tpl,
    output wire [7:0] out_3_cin_a1_tpl,
    output wire [31:0] out_1_0_real_din_a1_tpl,
    output wire [31:0] out_1_0_imag_din_a1_tpl,
    output wire [31:0] out_1_1_real_din_a1_tpl,
    output wire [31:0] out_1_1_imag_din_a1_tpl,
    output wire [31:0] out_1_2_real_din_a1_tpl,
    output wire [31:0] out_1_2_imag_din_a1_tpl,
    output wire [31:0] out_1_3_real_din_a1_tpl,
    output wire [31:0] out_1_3_imag_din_a1_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [0:0] Mux_0_imag_x_s;
    reg [31:0] Mux_0_imag_x_q;
    wire [0:0] Mux_0_real_x_s;
    reg [31:0] Mux_0_real_x_q;
    wire [0:0] Mux_1_imag_x_s;
    reg [31:0] Mux_1_imag_x_q;
    wire [0:0] Mux_1_real_x_s;
    reg [31:0] Mux_1_real_x_q;
    wire [0:0] Mux_2_imag_x_s;
    reg [31:0] Mux_2_imag_x_q;
    wire [0:0] Mux_2_real_x_s;
    reg [31:0] Mux_2_real_x_q;
    wire [0:0] Mux_3_imag_x_s;
    reg [31:0] Mux_3_imag_x_q;
    wire [0:0] Mux_3_real_x_s;
    reg [31:0] Mux_3_real_x_q;

    import ddc_model_DUT_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // Mux_3_imag_x(MUX,10)@0
    assign Mux_3_imag_x_s = in_5_mux_sel_tpl;
    always @(Mux_3_imag_x_s or in_1_3_imag_din_d1_tpl or in_2_3_imag_din_d2_tpl)
    begin
        unique case (Mux_3_imag_x_s)
            1'b0 : Mux_3_imag_x_q = in_1_3_imag_din_d1_tpl;
            1'b1 : Mux_3_imag_x_q = in_2_3_imag_din_d2_tpl;
            default : Mux_3_imag_x_q = 32'b0;
        endcase
    end

    // Mux_3_real_x(MUX,11)@0
    assign Mux_3_real_x_s = in_5_mux_sel_tpl;
    always @(Mux_3_real_x_s or in_1_3_real_din_d1_tpl or in_2_3_real_din_d2_tpl)
    begin
        unique case (Mux_3_real_x_s)
            1'b0 : Mux_3_real_x_q = in_1_3_real_din_d1_tpl;
            1'b1 : Mux_3_real_x_q = in_2_3_real_din_d2_tpl;
            default : Mux_3_real_x_q = 32'b0;
        endcase
    end

    // Mux_2_imag_x(MUX,8)@0
    assign Mux_2_imag_x_s = in_5_mux_sel_tpl;
    always @(Mux_2_imag_x_s or in_1_2_imag_din_d1_tpl or in_2_2_imag_din_d2_tpl)
    begin
        unique case (Mux_2_imag_x_s)
            1'b0 : Mux_2_imag_x_q = in_1_2_imag_din_d1_tpl;
            1'b1 : Mux_2_imag_x_q = in_2_2_imag_din_d2_tpl;
            default : Mux_2_imag_x_q = 32'b0;
        endcase
    end

    // Mux_2_real_x(MUX,9)@0
    assign Mux_2_real_x_s = in_5_mux_sel_tpl;
    always @(Mux_2_real_x_s or in_1_2_real_din_d1_tpl or in_2_2_real_din_d2_tpl)
    begin
        unique case (Mux_2_real_x_s)
            1'b0 : Mux_2_real_x_q = in_1_2_real_din_d1_tpl;
            1'b1 : Mux_2_real_x_q = in_2_2_real_din_d2_tpl;
            default : Mux_2_real_x_q = 32'b0;
        endcase
    end

    // Mux_1_imag_x(MUX,6)@0
    assign Mux_1_imag_x_s = in_5_mux_sel_tpl;
    always @(Mux_1_imag_x_s or in_1_1_imag_din_d1_tpl or in_2_1_imag_din_d2_tpl)
    begin
        unique case (Mux_1_imag_x_s)
            1'b0 : Mux_1_imag_x_q = in_1_1_imag_din_d1_tpl;
            1'b1 : Mux_1_imag_x_q = in_2_1_imag_din_d2_tpl;
            default : Mux_1_imag_x_q = 32'b0;
        endcase
    end

    // Mux_1_real_x(MUX,7)@0
    assign Mux_1_real_x_s = in_5_mux_sel_tpl;
    always @(Mux_1_real_x_s or in_1_1_real_din_d1_tpl or in_2_1_real_din_d2_tpl)
    begin
        unique case (Mux_1_real_x_s)
            1'b0 : Mux_1_real_x_q = in_1_1_real_din_d1_tpl;
            1'b1 : Mux_1_real_x_q = in_2_1_real_din_d2_tpl;
            default : Mux_1_real_x_q = 32'b0;
        endcase
    end

    // Mux_0_imag_x(MUX,4)@0
    assign Mux_0_imag_x_s = in_5_mux_sel_tpl;
    always @(Mux_0_imag_x_s or in_1_0_imag_din_d1_tpl or in_2_0_imag_din_d2_tpl)
    begin
        unique case (Mux_0_imag_x_s)
            1'b0 : Mux_0_imag_x_q = in_1_0_imag_din_d1_tpl;
            1'b1 : Mux_0_imag_x_q = in_2_0_imag_din_d2_tpl;
            default : Mux_0_imag_x_q = 32'b0;
        endcase
    end

    // Mux_0_real_x(MUX,5)@0
    assign Mux_0_real_x_s = in_5_mux_sel_tpl;
    always @(Mux_0_real_x_s or in_1_0_real_din_d1_tpl or in_2_0_real_din_d2_tpl)
    begin
        unique case (Mux_0_real_x_s)
            1'b0 : Mux_0_real_x_q = in_1_0_real_din_d1_tpl;
            1'b1 : Mux_0_real_x_q = in_2_0_real_din_d2_tpl;
            default : Mux_0_real_x_q = 32'b0;
        endcase
    end

    // Channel_out_HC_Bypass_vunroll_cunroll_x(PORTOUT,3)@0 + 1
    assign out_2_vin_a1_tpl = in_3_vin_d1_tpl;
    assign out_3_cin_a1_tpl = in_4_cin_d1_tpl;
    assign out_1_0_real_din_a1_tpl = Mux_0_real_x_q;
    assign out_1_0_imag_din_a1_tpl = Mux_0_imag_x_q;
    assign out_1_1_real_din_a1_tpl = Mux_1_real_x_q;
    assign out_1_1_imag_din_a1_tpl = Mux_1_imag_x_q;
    assign out_1_2_real_din_a1_tpl = Mux_2_real_x_q;
    assign out_1_2_imag_din_a1_tpl = Mux_2_imag_x_q;
    assign out_1_3_real_din_a1_tpl = Mux_3_real_x_q;
    assign out_1_3_imag_din_a1_tpl = Mux_3_imag_x_q;

endmodule
