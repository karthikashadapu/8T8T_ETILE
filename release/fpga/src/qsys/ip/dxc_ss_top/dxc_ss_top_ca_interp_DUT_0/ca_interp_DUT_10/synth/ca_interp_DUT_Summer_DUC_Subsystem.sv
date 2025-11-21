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

// SystemVerilog created from ca_interp_DUT_Summer_DUC_Subsystem
// SystemVerilog created on Tue Jan  7 17:04:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ca_interp_DUT_Summer_DUC_Subsystem (
    input wire [0:0] in_6_vin_intp_in_tpl,
    input wire [7:0] in_4_cin_intp_in_tpl,
    input wire [15:0] in_2_0_real_din_intp_in_tpl,
    input wire [15:0] in_2_0_imag_din_intp_in_tpl,
    input wire [15:0] in_2_1_real_din_intp_in_tpl,
    input wire [15:0] in_2_1_imag_din_intp_in_tpl,
    input wire [15:0] in_2_2_real_din_intp_in_tpl,
    input wire [15:0] in_2_2_imag_din_intp_in_tpl,
    input wire [15:0] in_2_3_real_din_intp_in_tpl,
    input wire [15:0] in_2_3_imag_din_intp_in_tpl,
    input wire [0:0] in_3_vin_intp_out_tpl,
    input wire [7:0] in_5_cin_intp_out_tpl,
    input wire [15:0] in_1_0_real_din_intp_out_tpl,
    input wire [15:0] in_1_0_imag_din_intp_out_tpl,
    input wire [15:0] in_1_1_real_din_intp_out_tpl,
    input wire [15:0] in_1_1_imag_din_intp_out_tpl,
    input wire [15:0] in_1_2_real_din_intp_out_tpl,
    input wire [15:0] in_1_2_imag_din_intp_out_tpl,
    input wire [15:0] in_1_3_real_din_intp_out_tpl,
    input wire [15:0] in_1_3_imag_din_intp_out_tpl,
    input wire [15:0] in_1_4_real_din_intp_out_tpl,
    input wire [15:0] in_1_4_imag_din_intp_out_tpl,
    input wire [15:0] in_1_5_real_din_intp_out_tpl,
    input wire [15:0] in_1_5_imag_din_intp_out_tpl,
    input wire [15:0] in_1_6_real_din_intp_out_tpl,
    input wire [15:0] in_1_6_imag_din_intp_out_tpl,
    input wire [15:0] in_1_7_real_din_intp_out_tpl,
    input wire [15:0] in_1_7_imag_din_intp_out_tpl,
    output wire [0:0] out_2_vout_tpl,
    output wire [7:0] out_3_cout_tpl,
    output wire [15:0] out_1_0_real_dout_tpl,
    output wire [15:0] out_1_0_imag_dout_tpl,
    output wire [15:0] out_1_1_real_dout_tpl,
    output wire [15:0] out_1_1_imag_dout_tpl,
    output wire [15:0] out_1_2_real_dout_tpl,
    output wire [15:0] out_1_2_imag_dout_tpl,
    output wire [15:0] out_1_3_real_dout_tpl,
    output wire [15:0] out_1_3_imag_dout_tpl,
    output wire [15:0] out_1_4_real_dout_tpl,
    output wire [15:0] out_1_4_imag_dout_tpl,
    output wire [15:0] out_1_5_real_dout_tpl,
    output wire [15:0] out_1_5_imag_dout_tpl,
    output wire [15:0] out_1_6_real_dout_tpl,
    output wire [15:0] out_1_6_imag_dout_tpl,
    output wire [15:0] out_1_7_real_dout_tpl,
    output wire [15:0] out_1_7_imag_dout_tpl,
    input wire [15:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [0:0] BitExtract1_b;
    wire [15:0] Constant1_q;
    wire [0:0] Mux1_s;
    reg [0:0] Mux1_q;
    wire [0:0] Mux2_s;
    reg [7:0] Mux2_q;
    wire [0:0] Mux_0_imag_x_s;
    reg [15:0] Mux_0_imag_x_q;
    wire [0:0] Mux_0_real_x_s;
    reg [15:0] Mux_0_real_x_q;
    wire [0:0] Mux_1_imag_x_s;
    reg [15:0] Mux_1_imag_x_q;
    wire [0:0] Mux_1_real_x_s;
    reg [15:0] Mux_1_real_x_q;
    wire [0:0] Mux_2_imag_x_s;
    reg [15:0] Mux_2_imag_x_q;
    wire [0:0] Mux_2_real_x_s;
    reg [15:0] Mux_2_real_x_q;
    wire [0:0] Mux_3_imag_x_s;
    reg [15:0] Mux_3_imag_x_q;
    wire [0:0] Mux_3_real_x_s;
    reg [15:0] Mux_3_real_x_q;
    wire [0:0] Mux_4_imag_x_s;
    reg [15:0] Mux_4_imag_x_q;
    wire [0:0] Mux_4_real_x_s;
    reg [15:0] Mux_4_real_x_q;
    wire [0:0] Mux_5_imag_x_s;
    reg [15:0] Mux_5_imag_x_q;
    wire [0:0] Mux_5_real_x_s;
    reg [15:0] Mux_5_real_x_q;
    wire [0:0] Mux_6_imag_x_s;
    reg [15:0] Mux_6_imag_x_q;
    wire [0:0] Mux_6_real_x_s;
    reg [15:0] Mux_6_real_x_q;
    wire [0:0] Mux_7_imag_x_s;
    reg [15:0] Mux_7_imag_x_q;
    wire [0:0] Mux_7_real_x_s;
    reg [15:0] Mux_7_real_x_q;

    import ca_interp_DUT_safe_path_ver::safe_path_ver;

    // Constant1(CONSTANT,3)
    assign Constant1_q = $unsigned(16'b0000000000000000);

    // BitExtract1(BITSELECT,2)@0
    assign BitExtract1_b = in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl[0:0];

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // Mux_7_imag_x(MUX,32)@0
    assign Mux_7_imag_x_s = BitExtract1_b;
    always @(Mux_7_imag_x_s or in_1_7_imag_din_intp_out_tpl or Constant1_q)
    begin
        unique case (Mux_7_imag_x_s)
            1'b0 : Mux_7_imag_x_q = in_1_7_imag_din_intp_out_tpl;
            1'b1 : Mux_7_imag_x_q = Constant1_q;
            default : Mux_7_imag_x_q = 16'b0;
        endcase
    end

    // Mux_7_real_x(MUX,33)@0
    assign Mux_7_real_x_s = BitExtract1_b;
    always @(Mux_7_real_x_s or in_1_7_real_din_intp_out_tpl or Constant1_q)
    begin
        unique case (Mux_7_real_x_s)
            1'b0 : Mux_7_real_x_q = in_1_7_real_din_intp_out_tpl;
            1'b1 : Mux_7_real_x_q = Constant1_q;
            default : Mux_7_real_x_q = 16'b0;
        endcase
    end

    // Mux_6_imag_x(MUX,30)@0
    assign Mux_6_imag_x_s = BitExtract1_b;
    always @(Mux_6_imag_x_s or in_1_6_imag_din_intp_out_tpl or Constant1_q)
    begin
        unique case (Mux_6_imag_x_s)
            1'b0 : Mux_6_imag_x_q = in_1_6_imag_din_intp_out_tpl;
            1'b1 : Mux_6_imag_x_q = Constant1_q;
            default : Mux_6_imag_x_q = 16'b0;
        endcase
    end

    // Mux_6_real_x(MUX,31)@0
    assign Mux_6_real_x_s = BitExtract1_b;
    always @(Mux_6_real_x_s or in_1_6_real_din_intp_out_tpl or Constant1_q)
    begin
        unique case (Mux_6_real_x_s)
            1'b0 : Mux_6_real_x_q = in_1_6_real_din_intp_out_tpl;
            1'b1 : Mux_6_real_x_q = Constant1_q;
            default : Mux_6_real_x_q = 16'b0;
        endcase
    end

    // Mux_5_imag_x(MUX,28)@0
    assign Mux_5_imag_x_s = BitExtract1_b;
    always @(Mux_5_imag_x_s or in_1_5_imag_din_intp_out_tpl or Constant1_q)
    begin
        unique case (Mux_5_imag_x_s)
            1'b0 : Mux_5_imag_x_q = in_1_5_imag_din_intp_out_tpl;
            1'b1 : Mux_5_imag_x_q = Constant1_q;
            default : Mux_5_imag_x_q = 16'b0;
        endcase
    end

    // Mux_5_real_x(MUX,29)@0
    assign Mux_5_real_x_s = BitExtract1_b;
    always @(Mux_5_real_x_s or in_1_5_real_din_intp_out_tpl or Constant1_q)
    begin
        unique case (Mux_5_real_x_s)
            1'b0 : Mux_5_real_x_q = in_1_5_real_din_intp_out_tpl;
            1'b1 : Mux_5_real_x_q = Constant1_q;
            default : Mux_5_real_x_q = 16'b0;
        endcase
    end

    // Mux_4_imag_x(MUX,26)@0
    assign Mux_4_imag_x_s = BitExtract1_b;
    always @(Mux_4_imag_x_s or in_1_4_imag_din_intp_out_tpl or Constant1_q)
    begin
        unique case (Mux_4_imag_x_s)
            1'b0 : Mux_4_imag_x_q = in_1_4_imag_din_intp_out_tpl;
            1'b1 : Mux_4_imag_x_q = Constant1_q;
            default : Mux_4_imag_x_q = 16'b0;
        endcase
    end

    // Mux_4_real_x(MUX,27)@0
    assign Mux_4_real_x_s = BitExtract1_b;
    always @(Mux_4_real_x_s or in_1_4_real_din_intp_out_tpl or Constant1_q)
    begin
        unique case (Mux_4_real_x_s)
            1'b0 : Mux_4_real_x_q = in_1_4_real_din_intp_out_tpl;
            1'b1 : Mux_4_real_x_q = Constant1_q;
            default : Mux_4_real_x_q = 16'b0;
        endcase
    end

    // Mux_3_imag_x(MUX,24)@0
    assign Mux_3_imag_x_s = BitExtract1_b;
    always @(Mux_3_imag_x_s or in_1_3_imag_din_intp_out_tpl or in_2_3_imag_din_intp_in_tpl)
    begin
        unique case (Mux_3_imag_x_s)
            1'b0 : Mux_3_imag_x_q = in_1_3_imag_din_intp_out_tpl;
            1'b1 : Mux_3_imag_x_q = in_2_3_imag_din_intp_in_tpl;
            default : Mux_3_imag_x_q = 16'b0;
        endcase
    end

    // Mux_3_real_x(MUX,25)@0
    assign Mux_3_real_x_s = BitExtract1_b;
    always @(Mux_3_real_x_s or in_1_3_real_din_intp_out_tpl or in_2_3_real_din_intp_in_tpl)
    begin
        unique case (Mux_3_real_x_s)
            1'b0 : Mux_3_real_x_q = in_1_3_real_din_intp_out_tpl;
            1'b1 : Mux_3_real_x_q = in_2_3_real_din_intp_in_tpl;
            default : Mux_3_real_x_q = 16'b0;
        endcase
    end

    // Mux_2_imag_x(MUX,22)@0
    assign Mux_2_imag_x_s = BitExtract1_b;
    always @(Mux_2_imag_x_s or in_1_2_imag_din_intp_out_tpl or in_2_2_imag_din_intp_in_tpl)
    begin
        unique case (Mux_2_imag_x_s)
            1'b0 : Mux_2_imag_x_q = in_1_2_imag_din_intp_out_tpl;
            1'b1 : Mux_2_imag_x_q = in_2_2_imag_din_intp_in_tpl;
            default : Mux_2_imag_x_q = 16'b0;
        endcase
    end

    // Mux_2_real_x(MUX,23)@0
    assign Mux_2_real_x_s = BitExtract1_b;
    always @(Mux_2_real_x_s or in_1_2_real_din_intp_out_tpl or in_2_2_real_din_intp_in_tpl)
    begin
        unique case (Mux_2_real_x_s)
            1'b0 : Mux_2_real_x_q = in_1_2_real_din_intp_out_tpl;
            1'b1 : Mux_2_real_x_q = in_2_2_real_din_intp_in_tpl;
            default : Mux_2_real_x_q = 16'b0;
        endcase
    end

    // Mux_1_imag_x(MUX,20)@0
    assign Mux_1_imag_x_s = BitExtract1_b;
    always @(Mux_1_imag_x_s or in_1_1_imag_din_intp_out_tpl or in_2_1_imag_din_intp_in_tpl)
    begin
        unique case (Mux_1_imag_x_s)
            1'b0 : Mux_1_imag_x_q = in_1_1_imag_din_intp_out_tpl;
            1'b1 : Mux_1_imag_x_q = in_2_1_imag_din_intp_in_tpl;
            default : Mux_1_imag_x_q = 16'b0;
        endcase
    end

    // Mux_1_real_x(MUX,21)@0
    assign Mux_1_real_x_s = BitExtract1_b;
    always @(Mux_1_real_x_s or in_1_1_real_din_intp_out_tpl or in_2_1_real_din_intp_in_tpl)
    begin
        unique case (Mux_1_real_x_s)
            1'b0 : Mux_1_real_x_q = in_1_1_real_din_intp_out_tpl;
            1'b1 : Mux_1_real_x_q = in_2_1_real_din_intp_in_tpl;
            default : Mux_1_real_x_q = 16'b0;
        endcase
    end

    // Mux_0_imag_x(MUX,18)@0
    assign Mux_0_imag_x_s = BitExtract1_b;
    always @(Mux_0_imag_x_s or in_1_0_imag_din_intp_out_tpl or in_2_0_imag_din_intp_in_tpl)
    begin
        unique case (Mux_0_imag_x_s)
            1'b0 : Mux_0_imag_x_q = in_1_0_imag_din_intp_out_tpl;
            1'b1 : Mux_0_imag_x_q = in_2_0_imag_din_intp_in_tpl;
            default : Mux_0_imag_x_q = 16'b0;
        endcase
    end

    // Mux_0_real_x(MUX,19)@0
    assign Mux_0_real_x_s = BitExtract1_b;
    always @(Mux_0_real_x_s or in_1_0_real_din_intp_out_tpl or in_2_0_real_din_intp_in_tpl)
    begin
        unique case (Mux_0_real_x_s)
            1'b0 : Mux_0_real_x_q = in_1_0_real_din_intp_out_tpl;
            1'b1 : Mux_0_real_x_q = in_2_0_real_din_intp_in_tpl;
            default : Mux_0_real_x_q = 16'b0;
        endcase
    end

    // Mux2(MUX,12)@0
    assign Mux2_s = BitExtract1_b;
    always @(Mux2_s or in_5_cin_intp_out_tpl or in_4_cin_intp_in_tpl)
    begin
        unique case (Mux2_s)
            1'b0 : Mux2_q = in_5_cin_intp_out_tpl;
            1'b1 : Mux2_q = in_4_cin_intp_in_tpl;
            default : Mux2_q = 8'b0;
        endcase
    end

    // Mux1(MUX,11)@0
    assign Mux1_s = BitExtract1_b;
    always @(Mux1_s or in_3_vin_intp_out_tpl or in_6_vin_intp_in_tpl)
    begin
        unique case (Mux1_s)
            1'b0 : Mux1_q = in_3_vin_intp_out_tpl;
            1'b1 : Mux1_q = in_6_vin_intp_in_tpl;
            default : Mux1_q = 1'b0;
        endcase
    end

    // Channel_out_HC_Bypass_vunroll_cunroll_x(PORTOUT,17)@0 + 1
    assign out_2_vout_tpl = Mux1_q;
    assign out_3_cout_tpl = Mux2_q;
    assign out_1_0_real_dout_tpl = Mux_0_real_x_q;
    assign out_1_0_imag_dout_tpl = Mux_0_imag_x_q;
    assign out_1_1_real_dout_tpl = Mux_1_real_x_q;
    assign out_1_1_imag_dout_tpl = Mux_1_imag_x_q;
    assign out_1_2_real_dout_tpl = Mux_2_real_x_q;
    assign out_1_2_imag_dout_tpl = Mux_2_imag_x_q;
    assign out_1_3_real_dout_tpl = Mux_3_real_x_q;
    assign out_1_3_imag_dout_tpl = Mux_3_imag_x_q;
    assign out_1_4_real_dout_tpl = Mux_4_real_x_q;
    assign out_1_4_imag_dout_tpl = Mux_4_imag_x_q;
    assign out_1_5_real_dout_tpl = Mux_5_real_x_q;
    assign out_1_5_imag_dout_tpl = Mux_5_imag_x_q;
    assign out_1_6_real_dout_tpl = Mux_6_real_x_q;
    assign out_1_6_imag_dout_tpl = Mux_6_imag_x_q;
    assign out_1_7_real_dout_tpl = Mux_7_real_x_q;
    assign out_1_7_imag_dout_tpl = Mux_7_imag_x_q;

endmodule
