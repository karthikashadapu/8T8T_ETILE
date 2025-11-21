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

// SystemVerilog created from dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain
// SystemVerilog created on Tue Jan  7 17:06:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain (
    input wire [0:0] in_1_In1_tpl,
    input wire [7:0] in_2_In2_tpl,
    input wire [15:0] in_3_0_real_In3_tpl,
    input wire [15:0] in_3_0_imag_In3_tpl,
    input wire [15:0] in_3_1_real_In3_tpl,
    input wire [15:0] in_3_1_imag_In3_tpl,
    input wire [15:0] in_3_2_real_In3_tpl,
    input wire [15:0] in_3_2_imag_In3_tpl,
    input wire [15:0] in_3_3_real_In3_tpl,
    input wire [15:0] in_3_3_imag_In3_tpl,
    output wire [0:0] out_2_vout1_tpl,
    output wire [7:0] out_3_cout1_tpl,
    output wire [31:0] out_1_0_real_dout1_tpl,
    output wire [31:0] out_1_0_imag_dout1_tpl,
    output wire [31:0] out_1_1_real_dout1_tpl,
    output wire [31:0] out_1_1_imag_dout1_tpl,
    output wire [31:0] out_1_2_real_dout1_tpl,
    output wire [31:0] out_1_2_imag_dout1_tpl,
    output wire [31:0] out_1_3_real_dout1_tpl,
    output wire [31:0] out_1_3_imag_dout1_tpl,
    output wire [0:0] out_5_vout2_tpl,
    output wire [7:0] out_6_cout2_tpl,
    output wire [31:0] out_4_0_real_dout2_tpl,
    output wire [31:0] out_4_0_imag_dout2_tpl,
    output wire [31:0] out_4_1_real_dout2_tpl,
    output wire [31:0] out_4_1_imag_dout2_tpl,
    output wire [31:0] out_4_2_real_dout2_tpl,
    output wire [31:0] out_4_2_imag_dout2_tpl,
    output wire [31:0] out_4_3_real_dout2_tpl,
    output wire [31:0] out_4_3_imag_dout2_tpl,
    input wire [15:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl,
    input wire [15:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl,
    input wire [15:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl,
    input wire [15:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire Mult_imagMult1_x_cma_reset;
    wire [15:0] Mult_imagMult1_x_cma_a0;
    wire [15:0] Mult_imagMult1_x_cma_c0;
    wire [31:0] Mult_imagMult1_x_cma_s0;
    wire [31:0] Mult_imagMult1_x_cma_qq0;
    reg [31:0] Mult_imagMult1_x_cma_q;
    wire Mult_imagMult1_x_cma_ena0;
    wire Mult_imagMult1_x_cma_ena1;
    wire Mult_imagMult1_x_cma_ena2;
    wire Mult_realMult1_x_cma_reset;
    wire [15:0] Mult_realMult1_x_cma_a0;
    wire [15:0] Mult_realMult1_x_cma_c0;
    wire [31:0] Mult_realMult1_x_cma_s0;
    wire [31:0] Mult_realMult1_x_cma_qq0;
    reg [31:0] Mult_realMult1_x_cma_q;
    wire Mult_realMult1_x_cma_ena0;
    wire Mult_realMult1_x_cma_ena1;
    wire Mult_realMult1_x_cma_ena2;
    wire Mult1_imagMult1_x_cma_reset;
    wire [15:0] Mult1_imagMult1_x_cma_a0;
    wire [15:0] Mult1_imagMult1_x_cma_c0;
    wire [31:0] Mult1_imagMult1_x_cma_s0;
    wire [31:0] Mult1_imagMult1_x_cma_qq0;
    reg [31:0] Mult1_imagMult1_x_cma_q;
    wire Mult1_imagMult1_x_cma_ena0;
    wire Mult1_imagMult1_x_cma_ena1;
    wire Mult1_imagMult1_x_cma_ena2;
    wire Mult1_realMult1_x_cma_reset;
    wire [15:0] Mult1_realMult1_x_cma_a0;
    wire [15:0] Mult1_realMult1_x_cma_c0;
    wire [31:0] Mult1_realMult1_x_cma_s0;
    wire [31:0] Mult1_realMult1_x_cma_qq0;
    reg [31:0] Mult1_realMult1_x_cma_q;
    wire Mult1_realMult1_x_cma_ena0;
    wire Mult1_realMult1_x_cma_ena1;
    wire Mult1_realMult1_x_cma_ena2;
    wire Mult2_imagMult1_x_cma_reset;
    wire [15:0] Mult2_imagMult1_x_cma_a0;
    wire [15:0] Mult2_imagMult1_x_cma_c0;
    wire [31:0] Mult2_imagMult1_x_cma_s0;
    wire [31:0] Mult2_imagMult1_x_cma_qq0;
    reg [31:0] Mult2_imagMult1_x_cma_q;
    wire Mult2_imagMult1_x_cma_ena0;
    wire Mult2_imagMult1_x_cma_ena1;
    wire Mult2_imagMult1_x_cma_ena2;
    wire Mult2_realMult1_x_cma_reset;
    wire [15:0] Mult2_realMult1_x_cma_a0;
    wire [15:0] Mult2_realMult1_x_cma_c0;
    wire [31:0] Mult2_realMult1_x_cma_s0;
    wire [31:0] Mult2_realMult1_x_cma_qq0;
    reg [31:0] Mult2_realMult1_x_cma_q;
    wire Mult2_realMult1_x_cma_ena0;
    wire Mult2_realMult1_x_cma_ena1;
    wire Mult2_realMult1_x_cma_ena2;
    wire Mult3_imagMult1_x_cma_reset;
    wire [15:0] Mult3_imagMult1_x_cma_a0;
    wire [15:0] Mult3_imagMult1_x_cma_c0;
    wire [31:0] Mult3_imagMult1_x_cma_s0;
    wire [31:0] Mult3_imagMult1_x_cma_qq0;
    reg [31:0] Mult3_imagMult1_x_cma_q;
    wire Mult3_imagMult1_x_cma_ena0;
    wire Mult3_imagMult1_x_cma_ena1;
    wire Mult3_imagMult1_x_cma_ena2;
    wire Mult3_realMult1_x_cma_reset;
    wire [15:0] Mult3_realMult1_x_cma_a0;
    wire [15:0] Mult3_realMult1_x_cma_c0;
    wire [31:0] Mult3_realMult1_x_cma_s0;
    wire [31:0] Mult3_realMult1_x_cma_qq0;
    reg [31:0] Mult3_realMult1_x_cma_q;
    wire Mult3_realMult1_x_cma_ena0;
    wire Mult3_realMult1_x_cma_ena1;
    wire Mult3_realMult1_x_cma_ena2;
    reg [31:0] redist0_Mult3_realMult1_x_cma_q_1_q;
    reg [31:0] redist1_Mult3_imagMult1_x_cma_q_1_q;
    reg [31:0] redist2_Mult2_realMult1_x_cma_q_1_q;
    reg [31:0] redist3_Mult2_imagMult1_x_cma_q_1_q;
    reg [31:0] redist4_Mult1_realMult1_x_cma_q_1_q;
    reg [31:0] redist5_Mult1_imagMult1_x_cma_q_1_q;
    reg [31:0] redist6_Mult_realMult1_x_cma_q_1_q;
    reg [31:0] redist7_Mult_imagMult1_x_cma_q_1_q;
    reg [0:0] redist8_ChannelIn_vunroll_cunroll_x_in_1_In1_tpl_6_q;
    wire redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_reset0;
    wire [7:0] redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_ia;
    wire [2:0] redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_aa;
    wire [2:0] redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_ab;
    wire [7:0] redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_iq;
    wire [7:0] redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_q;
    wire [2:0] redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_wraddr_i = 3'b111;
    wire [2:0] redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_offset_q;
    wire [3:0] redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_rdcnt_a;
    wire [3:0] redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_rdcnt_b;
    logic [3:0] redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_rdcnt_o;
    wire [3:0] redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_rdcnt_q;

    import dec_dly_comp_DUT_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // Mult3_imagMult1_x_cma(CHAINMULTADD,35)@0 + 5
    assign Mult3_imagMult1_x_cma_reset = areset;
    assign Mult3_imagMult1_x_cma_ena0 = 1'b1;
    assign Mult3_imagMult1_x_cma_ena1 = Mult3_imagMult1_x_cma_ena0;
    assign Mult3_imagMult1_x_cma_ena2 = Mult3_imagMult1_x_cma_ena0;

    assign Mult3_imagMult1_x_cma_a0 = $unsigned(in_3_3_imag_In3_tpl);
    assign Mult3_imagMult1_x_cma_c0 = in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("true"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) Mult3_imagMult1_x_cma_DSP0 (
        .clk(clk),
        .ena({ Mult3_imagMult1_x_cma_ena2, Mult3_imagMult1_x_cma_ena1, Mult3_imagMult1_x_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult3_imagMult1_x_cma_a0),
        .ax(Mult3_imagMult1_x_cma_c0),
        .resulta(Mult3_imagMult1_x_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult3_imagMult1_x_cma_delay0 ( .xin(Mult3_imagMult1_x_cma_s0), .xout(Mult3_imagMult1_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult3_imagMult1_x_cma_q = $unsigned(Mult3_imagMult1_x_cma_qq0[31:0]);

    // redist1_Mult3_imagMult1_x_cma_q_1(DELAY,38)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_Mult3_imagMult1_x_cma_q_1_q <= $unsigned(Mult3_imagMult1_x_cma_q);
        end
    end

    // Mult3_realMult1_x_cma(CHAINMULTADD,36)@0 + 5
    assign Mult3_realMult1_x_cma_reset = areset;
    assign Mult3_realMult1_x_cma_ena0 = 1'b1;
    assign Mult3_realMult1_x_cma_ena1 = Mult3_realMult1_x_cma_ena0;
    assign Mult3_realMult1_x_cma_ena2 = Mult3_realMult1_x_cma_ena0;

    assign Mult3_realMult1_x_cma_a0 = $unsigned(in_3_3_real_In3_tpl);
    assign Mult3_realMult1_x_cma_c0 = in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("true"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) Mult3_realMult1_x_cma_DSP0 (
        .clk(clk),
        .ena({ Mult3_realMult1_x_cma_ena2, Mult3_realMult1_x_cma_ena1, Mult3_realMult1_x_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult3_realMult1_x_cma_a0),
        .ax(Mult3_realMult1_x_cma_c0),
        .resulta(Mult3_realMult1_x_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult3_realMult1_x_cma_delay0 ( .xin(Mult3_realMult1_x_cma_s0), .xout(Mult3_realMult1_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult3_realMult1_x_cma_q = $unsigned(Mult3_realMult1_x_cma_qq0[31:0]);

    // redist0_Mult3_realMult1_x_cma_q_1(DELAY,37)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_Mult3_realMult1_x_cma_q_1_q <= $unsigned(Mult3_realMult1_x_cma_q);
        end
    end

    // Mult2_imagMult1_x_cma(CHAINMULTADD,33)@0 + 5
    assign Mult2_imagMult1_x_cma_reset = areset;
    assign Mult2_imagMult1_x_cma_ena0 = 1'b1;
    assign Mult2_imagMult1_x_cma_ena1 = Mult2_imagMult1_x_cma_ena0;
    assign Mult2_imagMult1_x_cma_ena2 = Mult2_imagMult1_x_cma_ena0;

    assign Mult2_imagMult1_x_cma_a0 = $unsigned(in_3_2_imag_In3_tpl);
    assign Mult2_imagMult1_x_cma_c0 = in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("true"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) Mult2_imagMult1_x_cma_DSP0 (
        .clk(clk),
        .ena({ Mult2_imagMult1_x_cma_ena2, Mult2_imagMult1_x_cma_ena1, Mult2_imagMult1_x_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult2_imagMult1_x_cma_a0),
        .ax(Mult2_imagMult1_x_cma_c0),
        .resulta(Mult2_imagMult1_x_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult2_imagMult1_x_cma_delay0 ( .xin(Mult2_imagMult1_x_cma_s0), .xout(Mult2_imagMult1_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult2_imagMult1_x_cma_q = $unsigned(Mult2_imagMult1_x_cma_qq0[31:0]);

    // redist3_Mult2_imagMult1_x_cma_q_1(DELAY,40)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_Mult2_imagMult1_x_cma_q_1_q <= $unsigned(Mult2_imagMult1_x_cma_q);
        end
    end

    // Mult2_realMult1_x_cma(CHAINMULTADD,34)@0 + 5
    assign Mult2_realMult1_x_cma_reset = areset;
    assign Mult2_realMult1_x_cma_ena0 = 1'b1;
    assign Mult2_realMult1_x_cma_ena1 = Mult2_realMult1_x_cma_ena0;
    assign Mult2_realMult1_x_cma_ena2 = Mult2_realMult1_x_cma_ena0;

    assign Mult2_realMult1_x_cma_a0 = $unsigned(in_3_2_real_In3_tpl);
    assign Mult2_realMult1_x_cma_c0 = in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("true"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) Mult2_realMult1_x_cma_DSP0 (
        .clk(clk),
        .ena({ Mult2_realMult1_x_cma_ena2, Mult2_realMult1_x_cma_ena1, Mult2_realMult1_x_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult2_realMult1_x_cma_a0),
        .ax(Mult2_realMult1_x_cma_c0),
        .resulta(Mult2_realMult1_x_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult2_realMult1_x_cma_delay0 ( .xin(Mult2_realMult1_x_cma_s0), .xout(Mult2_realMult1_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult2_realMult1_x_cma_q = $unsigned(Mult2_realMult1_x_cma_qq0[31:0]);

    // redist2_Mult2_realMult1_x_cma_q_1(DELAY,39)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_Mult2_realMult1_x_cma_q_1_q <= $unsigned(Mult2_realMult1_x_cma_q);
        end
    end

    // Mult1_imagMult1_x_cma(CHAINMULTADD,31)@0 + 5
    assign Mult1_imagMult1_x_cma_reset = areset;
    assign Mult1_imagMult1_x_cma_ena0 = 1'b1;
    assign Mult1_imagMult1_x_cma_ena1 = Mult1_imagMult1_x_cma_ena0;
    assign Mult1_imagMult1_x_cma_ena2 = Mult1_imagMult1_x_cma_ena0;

    assign Mult1_imagMult1_x_cma_a0 = $unsigned(in_3_1_imag_In3_tpl);
    assign Mult1_imagMult1_x_cma_c0 = in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("true"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) Mult1_imagMult1_x_cma_DSP0 (
        .clk(clk),
        .ena({ Mult1_imagMult1_x_cma_ena2, Mult1_imagMult1_x_cma_ena1, Mult1_imagMult1_x_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult1_imagMult1_x_cma_a0),
        .ax(Mult1_imagMult1_x_cma_c0),
        .resulta(Mult1_imagMult1_x_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult1_imagMult1_x_cma_delay0 ( .xin(Mult1_imagMult1_x_cma_s0), .xout(Mult1_imagMult1_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult1_imagMult1_x_cma_q = $unsigned(Mult1_imagMult1_x_cma_qq0[31:0]);

    // redist5_Mult1_imagMult1_x_cma_q_1(DELAY,42)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_Mult1_imagMult1_x_cma_q_1_q <= $unsigned(Mult1_imagMult1_x_cma_q);
        end
    end

    // Mult1_realMult1_x_cma(CHAINMULTADD,32)@0 + 5
    assign Mult1_realMult1_x_cma_reset = areset;
    assign Mult1_realMult1_x_cma_ena0 = 1'b1;
    assign Mult1_realMult1_x_cma_ena1 = Mult1_realMult1_x_cma_ena0;
    assign Mult1_realMult1_x_cma_ena2 = Mult1_realMult1_x_cma_ena0;

    assign Mult1_realMult1_x_cma_a0 = $unsigned(in_3_1_real_In3_tpl);
    assign Mult1_realMult1_x_cma_c0 = in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("true"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) Mult1_realMult1_x_cma_DSP0 (
        .clk(clk),
        .ena({ Mult1_realMult1_x_cma_ena2, Mult1_realMult1_x_cma_ena1, Mult1_realMult1_x_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult1_realMult1_x_cma_a0),
        .ax(Mult1_realMult1_x_cma_c0),
        .resulta(Mult1_realMult1_x_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult1_realMult1_x_cma_delay0 ( .xin(Mult1_realMult1_x_cma_s0), .xout(Mult1_realMult1_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult1_realMult1_x_cma_q = $unsigned(Mult1_realMult1_x_cma_qq0[31:0]);

    // redist4_Mult1_realMult1_x_cma_q_1(DELAY,41)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_Mult1_realMult1_x_cma_q_1_q <= $unsigned(Mult1_realMult1_x_cma_q);
        end
    end

    // Mult_imagMult1_x_cma(CHAINMULTADD,29)@0 + 5
    assign Mult_imagMult1_x_cma_reset = areset;
    assign Mult_imagMult1_x_cma_ena0 = 1'b1;
    assign Mult_imagMult1_x_cma_ena1 = Mult_imagMult1_x_cma_ena0;
    assign Mult_imagMult1_x_cma_ena2 = Mult_imagMult1_x_cma_ena0;

    assign Mult_imagMult1_x_cma_a0 = $unsigned(in_3_0_imag_In3_tpl);
    assign Mult_imagMult1_x_cma_c0 = in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("true"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) Mult_imagMult1_x_cma_DSP0 (
        .clk(clk),
        .ena({ Mult_imagMult1_x_cma_ena2, Mult_imagMult1_x_cma_ena1, Mult_imagMult1_x_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult_imagMult1_x_cma_a0),
        .ax(Mult_imagMult1_x_cma_c0),
        .resulta(Mult_imagMult1_x_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult_imagMult1_x_cma_delay0 ( .xin(Mult_imagMult1_x_cma_s0), .xout(Mult_imagMult1_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult_imagMult1_x_cma_q = $unsigned(Mult_imagMult1_x_cma_qq0[31:0]);

    // redist7_Mult_imagMult1_x_cma_q_1(DELAY,44)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist7_Mult_imagMult1_x_cma_q_1_q <= $unsigned(Mult_imagMult1_x_cma_q);
        end
    end

    // Mult_realMult1_x_cma(CHAINMULTADD,30)@0 + 5
    assign Mult_realMult1_x_cma_reset = areset;
    assign Mult_realMult1_x_cma_ena0 = 1'b1;
    assign Mult_realMult1_x_cma_ena1 = Mult_realMult1_x_cma_ena0;
    assign Mult_realMult1_x_cma_ena2 = Mult_realMult1_x_cma_ena0;

    assign Mult_realMult1_x_cma_a0 = $unsigned(in_3_0_real_In3_tpl);
    assign Mult_realMult1_x_cma_c0 = in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("true"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) Mult_realMult1_x_cma_DSP0 (
        .clk(clk),
        .ena({ Mult_realMult1_x_cma_ena2, Mult_realMult1_x_cma_ena1, Mult_realMult1_x_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(Mult_realMult1_x_cma_a0),
        .ax(Mult_realMult1_x_cma_c0),
        .resulta(Mult_realMult1_x_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    Mult_realMult1_x_cma_delay0 ( .xin(Mult_realMult1_x_cma_s0), .xout(Mult_realMult1_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign Mult_realMult1_x_cma_q = $unsigned(Mult_realMult1_x_cma_qq0[31:0]);

    // redist6_Mult_realMult1_x_cma_q_1(DELAY,43)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_Mult_realMult1_x_cma_q_1_q <= $unsigned(Mult_realMult1_x_cma_q);
        end
    end

    // redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_offset(CONSTANT,49)
    assign redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_offset_q = $unsigned(3'b101);

    // redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_rdcnt(ADD,50)
    assign redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_rdcnt_a = {1'b0, redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_wraddr_q};
    assign redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_rdcnt_b = {1'b0, redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_rdcnt_o <= $unsigned(redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_rdcnt_a) + $unsigned(redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_rdcnt_b);
        end
    end
    assign redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_rdcnt_q = redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_rdcnt_o[3:0];

    // redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_wraddr(COUNTER,48)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_wraddr_i <= $unsigned(redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_wraddr_q = redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_wraddr_i[2:0];

    // redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem(DUALMEM,47)
    assign redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_ia = $unsigned(in_2_In2_tpl);
    assign redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_aa = redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_wraddr_q;
    assign redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_ab = redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_rdcnt_q[2:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(8),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(8),
        .widthad_b(3),
        .numwords_b(8),
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
    ) redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_aa),
        .data_a(redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_ab),
        .q_b(redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_iq),
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
    assign redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_q = redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_iq[7:0];

    // redist8_ChannelIn_vunroll_cunroll_x_in_1_In1_tpl_6(DELAY,45)
    dspba_delay_ver #( .width(1), .depth(6), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist8_ChannelIn_vunroll_cunroll_x_in_1_In1_tpl_6 ( .xin(in_1_In1_tpl), .xout(redist8_ChannelIn_vunroll_cunroll_x_in_1_In1_tpl_6_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ChannelOut_vunroll_cunroll_x(PORTOUT,15)@6 + 1
    assign out_2_vout1_tpl = redist8_ChannelIn_vunroll_cunroll_x_in_1_In1_tpl_6_q;
    assign out_3_cout1_tpl = redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_q;
    assign out_1_0_real_dout1_tpl = redist6_Mult_realMult1_x_cma_q_1_q;
    assign out_1_0_imag_dout1_tpl = redist7_Mult_imagMult1_x_cma_q_1_q;
    assign out_1_1_real_dout1_tpl = redist4_Mult1_realMult1_x_cma_q_1_q;
    assign out_1_1_imag_dout1_tpl = redist5_Mult1_imagMult1_x_cma_q_1_q;
    assign out_1_2_real_dout1_tpl = redist2_Mult2_realMult1_x_cma_q_1_q;
    assign out_1_2_imag_dout1_tpl = redist3_Mult2_imagMult1_x_cma_q_1_q;
    assign out_1_3_real_dout1_tpl = redist0_Mult3_realMult1_x_cma_q_1_q;
    assign out_1_3_imag_dout1_tpl = redist1_Mult3_imagMult1_x_cma_q_1_q;

    // ChannelOut1_vunroll_cunroll_x(PORTOUT,16)@6 + 1
    assign out_5_vout2_tpl = redist8_ChannelIn_vunroll_cunroll_x_in_1_In1_tpl_6_q;
    assign out_6_cout2_tpl = redist9_ChannelIn_vunroll_cunroll_x_in_2_In2_tpl_6_mem_q;
    assign out_4_0_real_dout2_tpl = redist6_Mult_realMult1_x_cma_q_1_q;
    assign out_4_0_imag_dout2_tpl = redist7_Mult_imagMult1_x_cma_q_1_q;
    assign out_4_1_real_dout2_tpl = redist4_Mult1_realMult1_x_cma_q_1_q;
    assign out_4_1_imag_dout2_tpl = redist5_Mult1_imagMult1_x_cma_q_1_q;
    assign out_4_2_real_dout2_tpl = redist2_Mult2_realMult1_x_cma_q_1_q;
    assign out_4_2_imag_dout2_tpl = redist3_Mult2_imagMult1_x_cma_q_1_q;
    assign out_4_3_real_dout2_tpl = redist0_Mult3_realMult1_x_cma_q_1_q;
    assign out_4_3_imag_dout2_tpl = redist1_Mult3_imagMult1_x_cma_q_1_q;

endmodule
