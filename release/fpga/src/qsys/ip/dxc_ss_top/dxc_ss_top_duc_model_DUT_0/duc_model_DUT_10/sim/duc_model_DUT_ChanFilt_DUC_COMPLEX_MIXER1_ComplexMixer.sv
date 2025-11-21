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

// SystemVerilog created from duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer
// SystemVerilog created on Thu Jan  9 15:34:39 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer (
    input wire [0:0] In_v,
    input wire [7:0] In_c,
    input wire [15:0] iIn_0,
    input wire [15:0] iIn_1,
    input wire [15:0] iIn_2,
    input wire [15:0] iIn_3,
    input wire [15:0] qIn_0,
    input wire [15:0] qIn_1,
    input wire [15:0] qIn_2,
    input wire [15:0] qIn_3,
    input wire [15:0] sIn_0,
    input wire [15:0] sIn_1,
    input wire [15:0] sIn_2,
    input wire [15:0] sIn_3,
    input wire [15:0] cIn_0,
    input wire [15:0] cIn_1,
    input wire [15:0] cIn_2,
    input wire [15:0] cIn_3,
    output wire [32:0] qOut_0,
    output wire [32:0] qOut_1,
    output wire [32:0] qOut_2,
    output wire [32:0] qOut_3,
    output wire [0:0] Out_v,
    output wire [7:0] Out_c,
    output wire [32:0] iOut_0,
    output wire [32:0] iOut_1,
    output wire [32:0] iOut_2,
    output wire [32:0] iOut_3,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [7:0] d_iIn_In_c_5_q;
    reg [7:0] d_iIn_In_c_5_delay_0;
    reg [7:0] d_iIn_In_c_5_delay_1;
    reg [7:0] d_iIn_In_c_5_delay_2;
    reg [7:0] d_iIn_In_c_5_delay_3;
    reg [0:0] d_iIn_In_v_5_q;
    reg [0:0] d_iIn_In_v_5_delay_0;
    reg [0:0] d_iIn_In_v_5_delay_1;
    reg [0:0] d_iIn_In_v_5_delay_2;
    reg [0:0] d_iIn_In_v_5_delay_3;
    wire u0_as_mult_i_cma_reset;
    wire [15:0] u0_as_mult_i_cma_a0;
    wire [15:0] u0_as_mult_i_cma_c0;
    wire [15:0] u0_as_mult_i_cma_a1;
    wire [15:0] u0_as_mult_i_cma_c1;
    wire [32:0] u0_as_mult_i_cma_s0;
    wire [0:0] u0_as_mult_i_cma_sna;
    wire [32:0] u0_as_mult_i_cma_qq0;
    reg [32:0] u0_as_mult_i_cma_q;
    wire u0_as_mult_i_cma_ena0;
    wire u0_as_mult_i_cma_ena1;
    wire u0_as_mult_i_cma_ena2;
    wire u0_as_mult_q_cma_reset;
    wire [15:0] u0_as_mult_q_cma_a0;
    wire [15:0] u0_as_mult_q_cma_c0;
    wire [15:0] u0_as_mult_q_cma_a1;
    wire [15:0] u0_as_mult_q_cma_c1;
    wire [32:0] u0_as_mult_q_cma_s0;
    wire [32:0] u0_as_mult_q_cma_qq0;
    reg [32:0] u0_as_mult_q_cma_q;
    wire u0_as_mult_q_cma_ena0;
    wire u0_as_mult_q_cma_ena1;
    wire u0_as_mult_q_cma_ena2;
    wire u1_as_mult_i_cma_reset;
    wire [15:0] u1_as_mult_i_cma_a0;
    wire [15:0] u1_as_mult_i_cma_c0;
    wire [15:0] u1_as_mult_i_cma_a1;
    wire [15:0] u1_as_mult_i_cma_c1;
    wire [32:0] u1_as_mult_i_cma_s0;
    wire [0:0] u1_as_mult_i_cma_sna;
    wire [32:0] u1_as_mult_i_cma_qq0;
    reg [32:0] u1_as_mult_i_cma_q;
    wire u1_as_mult_i_cma_ena0;
    wire u1_as_mult_i_cma_ena1;
    wire u1_as_mult_i_cma_ena2;
    wire u1_as_mult_q_cma_reset;
    wire [15:0] u1_as_mult_q_cma_a0;
    wire [15:0] u1_as_mult_q_cma_c0;
    wire [15:0] u1_as_mult_q_cma_a1;
    wire [15:0] u1_as_mult_q_cma_c1;
    wire [32:0] u1_as_mult_q_cma_s0;
    wire [32:0] u1_as_mult_q_cma_qq0;
    reg [32:0] u1_as_mult_q_cma_q;
    wire u1_as_mult_q_cma_ena0;
    wire u1_as_mult_q_cma_ena1;
    wire u1_as_mult_q_cma_ena2;
    wire u2_as_mult_i_cma_reset;
    wire [15:0] u2_as_mult_i_cma_a0;
    wire [15:0] u2_as_mult_i_cma_c0;
    wire [15:0] u2_as_mult_i_cma_a1;
    wire [15:0] u2_as_mult_i_cma_c1;
    wire [32:0] u2_as_mult_i_cma_s0;
    wire [0:0] u2_as_mult_i_cma_sna;
    wire [32:0] u2_as_mult_i_cma_qq0;
    reg [32:0] u2_as_mult_i_cma_q;
    wire u2_as_mult_i_cma_ena0;
    wire u2_as_mult_i_cma_ena1;
    wire u2_as_mult_i_cma_ena2;
    wire u2_as_mult_q_cma_reset;
    wire [15:0] u2_as_mult_q_cma_a0;
    wire [15:0] u2_as_mult_q_cma_c0;
    wire [15:0] u2_as_mult_q_cma_a1;
    wire [15:0] u2_as_mult_q_cma_c1;
    wire [32:0] u2_as_mult_q_cma_s0;
    wire [32:0] u2_as_mult_q_cma_qq0;
    reg [32:0] u2_as_mult_q_cma_q;
    wire u2_as_mult_q_cma_ena0;
    wire u2_as_mult_q_cma_ena1;
    wire u2_as_mult_q_cma_ena2;
    wire u3_as_mult_i_cma_reset;
    wire [15:0] u3_as_mult_i_cma_a0;
    wire [15:0] u3_as_mult_i_cma_c0;
    wire [15:0] u3_as_mult_i_cma_a1;
    wire [15:0] u3_as_mult_i_cma_c1;
    wire [32:0] u3_as_mult_i_cma_s0;
    wire [0:0] u3_as_mult_i_cma_sna;
    wire [32:0] u3_as_mult_i_cma_qq0;
    reg [32:0] u3_as_mult_i_cma_q;
    wire u3_as_mult_i_cma_ena0;
    wire u3_as_mult_i_cma_ena1;
    wire u3_as_mult_i_cma_ena2;
    wire u3_as_mult_q_cma_reset;
    wire [15:0] u3_as_mult_q_cma_a0;
    wire [15:0] u3_as_mult_q_cma_c0;
    wire [15:0] u3_as_mult_q_cma_a1;
    wire [15:0] u3_as_mult_q_cma_c1;
    wire [32:0] u3_as_mult_q_cma_s0;
    wire [32:0] u3_as_mult_q_cma_qq0;
    reg [32:0] u3_as_mult_q_cma_q;
    wire u3_as_mult_q_cma_ena0;
    wire u3_as_mult_q_cma_ena1;
    wire u3_as_mult_q_cma_ena2;

    import duc_model_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // u3_as_mult_q_cma(CHAINMULTADD,23)@0 + 5
    assign u3_as_mult_q_cma_reset = areset;
    assign u3_as_mult_q_cma_ena0 = 1'b1;
    assign u3_as_mult_q_cma_ena1 = u3_as_mult_q_cma_ena0;
    assign u3_as_mult_q_cma_ena2 = u3_as_mult_q_cma_ena0;

    assign u3_as_mult_q_cma_a0 = $unsigned(sIn_3);
    assign u3_as_mult_q_cma_c0 = $unsigned(iIn_3);
    assign u3_as_mult_q_cma_a1 = $unsigned(cIn_3);
    assign u3_as_mult_q_cma_c1 = $unsigned(qIn_3);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(33)
    ) u3_as_mult_q_cma_DSP0 (
        .clk(clk),
        .ena({ u3_as_mult_q_cma_ena2, u3_as_mult_q_cma_ena1, u3_as_mult_q_cma_ena0 }),
        .clr({ u3_as_mult_q_cma_reset, u3_as_mult_q_cma_reset }),
        .ay(u3_as_mult_q_cma_a1),
        .by(u3_as_mult_q_cma_a0),
        .ax(u3_as_mult_q_cma_c1),
        .bx(u3_as_mult_q_cma_c0),
        .resulta(u3_as_mult_q_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
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
    dspba_delay_ver #( .width(33), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u3_as_mult_q_cma_delay0 ( .xin(u3_as_mult_q_cma_s0), .xout(u3_as_mult_q_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u3_as_mult_q_cma_q = $unsigned(u3_as_mult_q_cma_qq0[32:0]);

    // u2_as_mult_q_cma(CHAINMULTADD,21)@0 + 5
    assign u2_as_mult_q_cma_reset = areset;
    assign u2_as_mult_q_cma_ena0 = 1'b1;
    assign u2_as_mult_q_cma_ena1 = u2_as_mult_q_cma_ena0;
    assign u2_as_mult_q_cma_ena2 = u2_as_mult_q_cma_ena0;

    assign u2_as_mult_q_cma_a0 = $unsigned(sIn_2);
    assign u2_as_mult_q_cma_c0 = $unsigned(iIn_2);
    assign u2_as_mult_q_cma_a1 = $unsigned(cIn_2);
    assign u2_as_mult_q_cma_c1 = $unsigned(qIn_2);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(33)
    ) u2_as_mult_q_cma_DSP0 (
        .clk(clk),
        .ena({ u2_as_mult_q_cma_ena2, u2_as_mult_q_cma_ena1, u2_as_mult_q_cma_ena0 }),
        .clr({ u2_as_mult_q_cma_reset, u2_as_mult_q_cma_reset }),
        .ay(u2_as_mult_q_cma_a1),
        .by(u2_as_mult_q_cma_a0),
        .ax(u2_as_mult_q_cma_c1),
        .bx(u2_as_mult_q_cma_c0),
        .resulta(u2_as_mult_q_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
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
    dspba_delay_ver #( .width(33), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u2_as_mult_q_cma_delay0 ( .xin(u2_as_mult_q_cma_s0), .xout(u2_as_mult_q_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u2_as_mult_q_cma_q = $unsigned(u2_as_mult_q_cma_qq0[32:0]);

    // u1_as_mult_q_cma(CHAINMULTADD,19)@0 + 5
    assign u1_as_mult_q_cma_reset = areset;
    assign u1_as_mult_q_cma_ena0 = 1'b1;
    assign u1_as_mult_q_cma_ena1 = u1_as_mult_q_cma_ena0;
    assign u1_as_mult_q_cma_ena2 = u1_as_mult_q_cma_ena0;

    assign u1_as_mult_q_cma_a0 = $unsigned(sIn_1);
    assign u1_as_mult_q_cma_c0 = $unsigned(iIn_1);
    assign u1_as_mult_q_cma_a1 = $unsigned(cIn_1);
    assign u1_as_mult_q_cma_c1 = $unsigned(qIn_1);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(33)
    ) u1_as_mult_q_cma_DSP0 (
        .clk(clk),
        .ena({ u1_as_mult_q_cma_ena2, u1_as_mult_q_cma_ena1, u1_as_mult_q_cma_ena0 }),
        .clr({ u1_as_mult_q_cma_reset, u1_as_mult_q_cma_reset }),
        .ay(u1_as_mult_q_cma_a1),
        .by(u1_as_mult_q_cma_a0),
        .ax(u1_as_mult_q_cma_c1),
        .bx(u1_as_mult_q_cma_c0),
        .resulta(u1_as_mult_q_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
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
    dspba_delay_ver #( .width(33), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u1_as_mult_q_cma_delay0 ( .xin(u1_as_mult_q_cma_s0), .xout(u1_as_mult_q_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u1_as_mult_q_cma_q = $unsigned(u1_as_mult_q_cma_qq0[32:0]);

    // u0_as_mult_q_cma(CHAINMULTADD,17)@0 + 5
    assign u0_as_mult_q_cma_reset = areset;
    assign u0_as_mult_q_cma_ena0 = 1'b1;
    assign u0_as_mult_q_cma_ena1 = u0_as_mult_q_cma_ena0;
    assign u0_as_mult_q_cma_ena2 = u0_as_mult_q_cma_ena0;

    assign u0_as_mult_q_cma_a0 = $unsigned(sIn_0);
    assign u0_as_mult_q_cma_c0 = $unsigned(iIn_0);
    assign u0_as_mult_q_cma_a1 = $unsigned(cIn_0);
    assign u0_as_mult_q_cma_c1 = $unsigned(qIn_0);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(33)
    ) u0_as_mult_q_cma_DSP0 (
        .clk(clk),
        .ena({ u0_as_mult_q_cma_ena2, u0_as_mult_q_cma_ena1, u0_as_mult_q_cma_ena0 }),
        .clr({ u0_as_mult_q_cma_reset, u0_as_mult_q_cma_reset }),
        .ay(u0_as_mult_q_cma_a1),
        .by(u0_as_mult_q_cma_a0),
        .ax(u0_as_mult_q_cma_c1),
        .bx(u0_as_mult_q_cma_c0),
        .resulta(u0_as_mult_q_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
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
    dspba_delay_ver #( .width(33), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_as_mult_q_cma_delay0 ( .xin(u0_as_mult_q_cma_s0), .xout(u0_as_mult_q_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_as_mult_q_cma_q = $unsigned(u0_as_mult_q_cma_qq0[32:0]);

    // qOut(GPOUT,15)@5
    assign qOut_0 = u0_as_mult_q_cma_q;
    assign qOut_1 = u1_as_mult_q_cma_q;
    assign qOut_2 = u2_as_mult_q_cma_q;
    assign qOut_3 = u3_as_mult_q_cma_q;

    // u3_as_mult_i_cma(CHAINMULTADD,22)@0 + 5
    assign u3_as_mult_i_cma_reset = areset;
    assign u3_as_mult_i_cma_ena0 = 1'b1;
    assign u3_as_mult_i_cma_ena1 = u3_as_mult_i_cma_ena0;
    assign u3_as_mult_i_cma_ena2 = u3_as_mult_i_cma_ena0;

    assign u3_as_mult_i_cma_a0 = $unsigned(sIn_3);
    assign u3_as_mult_i_cma_c0 = $unsigned(qIn_3);
    assign u3_as_mult_i_cma_a1 = $unsigned(cIn_3);
    assign u3_as_mult_i_cma_c1 = $unsigned(iIn_3);
    assign u3_as_mult_i_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(33)
    ) u3_as_mult_i_cma_DSP0 (
        .clk(clk),
        .ena({ u3_as_mult_i_cma_ena2, u3_as_mult_i_cma_ena1, u3_as_mult_i_cma_ena0 }),
        .clr({ u3_as_mult_i_cma_reset, u3_as_mult_i_cma_reset }),
        .sub(u3_as_mult_i_cma_sna[0]),
        .negate(u3_as_mult_i_cma_sna[0]),
        .ay(u3_as_mult_i_cma_a1),
        .by(u3_as_mult_i_cma_a0),
        .ax(u3_as_mult_i_cma_c1),
        .bx(u3_as_mult_i_cma_c0),
        .resulta(u3_as_mult_i_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
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
    dspba_delay_ver #( .width(33), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u3_as_mult_i_cma_delay0 ( .xin(u3_as_mult_i_cma_s0), .xout(u3_as_mult_i_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u3_as_mult_i_cma_q = $unsigned(u3_as_mult_i_cma_qq0[32:0]);

    // u2_as_mult_i_cma(CHAINMULTADD,20)@0 + 5
    assign u2_as_mult_i_cma_reset = areset;
    assign u2_as_mult_i_cma_ena0 = 1'b1;
    assign u2_as_mult_i_cma_ena1 = u2_as_mult_i_cma_ena0;
    assign u2_as_mult_i_cma_ena2 = u2_as_mult_i_cma_ena0;

    assign u2_as_mult_i_cma_a0 = $unsigned(sIn_2);
    assign u2_as_mult_i_cma_c0 = $unsigned(qIn_2);
    assign u2_as_mult_i_cma_a1 = $unsigned(cIn_2);
    assign u2_as_mult_i_cma_c1 = $unsigned(iIn_2);
    assign u2_as_mult_i_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(33)
    ) u2_as_mult_i_cma_DSP0 (
        .clk(clk),
        .ena({ u2_as_mult_i_cma_ena2, u2_as_mult_i_cma_ena1, u2_as_mult_i_cma_ena0 }),
        .clr({ u2_as_mult_i_cma_reset, u2_as_mult_i_cma_reset }),
        .sub(u2_as_mult_i_cma_sna[0]),
        .negate(u2_as_mult_i_cma_sna[0]),
        .ay(u2_as_mult_i_cma_a1),
        .by(u2_as_mult_i_cma_a0),
        .ax(u2_as_mult_i_cma_c1),
        .bx(u2_as_mult_i_cma_c0),
        .resulta(u2_as_mult_i_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
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
    dspba_delay_ver #( .width(33), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u2_as_mult_i_cma_delay0 ( .xin(u2_as_mult_i_cma_s0), .xout(u2_as_mult_i_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u2_as_mult_i_cma_q = $unsigned(u2_as_mult_i_cma_qq0[32:0]);

    // u1_as_mult_i_cma(CHAINMULTADD,18)@0 + 5
    assign u1_as_mult_i_cma_reset = areset;
    assign u1_as_mult_i_cma_ena0 = 1'b1;
    assign u1_as_mult_i_cma_ena1 = u1_as_mult_i_cma_ena0;
    assign u1_as_mult_i_cma_ena2 = u1_as_mult_i_cma_ena0;

    assign u1_as_mult_i_cma_a0 = $unsigned(sIn_1);
    assign u1_as_mult_i_cma_c0 = $unsigned(qIn_1);
    assign u1_as_mult_i_cma_a1 = $unsigned(cIn_1);
    assign u1_as_mult_i_cma_c1 = $unsigned(iIn_1);
    assign u1_as_mult_i_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(33)
    ) u1_as_mult_i_cma_DSP0 (
        .clk(clk),
        .ena({ u1_as_mult_i_cma_ena2, u1_as_mult_i_cma_ena1, u1_as_mult_i_cma_ena0 }),
        .clr({ u1_as_mult_i_cma_reset, u1_as_mult_i_cma_reset }),
        .sub(u1_as_mult_i_cma_sna[0]),
        .negate(u1_as_mult_i_cma_sna[0]),
        .ay(u1_as_mult_i_cma_a1),
        .by(u1_as_mult_i_cma_a0),
        .ax(u1_as_mult_i_cma_c1),
        .bx(u1_as_mult_i_cma_c0),
        .resulta(u1_as_mult_i_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
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
    dspba_delay_ver #( .width(33), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u1_as_mult_i_cma_delay0 ( .xin(u1_as_mult_i_cma_s0), .xout(u1_as_mult_i_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u1_as_mult_i_cma_q = $unsigned(u1_as_mult_i_cma_qq0[32:0]);

    // u0_as_mult_i_cma(CHAINMULTADD,16)@0 + 5
    assign u0_as_mult_i_cma_reset = areset;
    assign u0_as_mult_i_cma_ena0 = 1'b1;
    assign u0_as_mult_i_cma_ena1 = u0_as_mult_i_cma_ena0;
    assign u0_as_mult_i_cma_ena2 = u0_as_mult_i_cma_ena0;

    assign u0_as_mult_i_cma_a0 = $unsigned(sIn_0);
    assign u0_as_mult_i_cma_c0 = $unsigned(qIn_0);
    assign u0_as_mult_i_cma_a1 = $unsigned(cIn_0);
    assign u0_as_mult_i_cma_c1 = $unsigned(iIn_0);
    assign u0_as_mult_i_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(33)
    ) u0_as_mult_i_cma_DSP0 (
        .clk(clk),
        .ena({ u0_as_mult_i_cma_ena2, u0_as_mult_i_cma_ena1, u0_as_mult_i_cma_ena0 }),
        .clr({ u0_as_mult_i_cma_reset, u0_as_mult_i_cma_reset }),
        .sub(u0_as_mult_i_cma_sna[0]),
        .negate(u0_as_mult_i_cma_sna[0]),
        .ay(u0_as_mult_i_cma_a1),
        .by(u0_as_mult_i_cma_a0),
        .ax(u0_as_mult_i_cma_c1),
        .bx(u0_as_mult_i_cma_c0),
        .resulta(u0_as_mult_i_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
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
    dspba_delay_ver #( .width(33), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_as_mult_i_cma_delay0 ( .xin(u0_as_mult_i_cma_s0), .xout(u0_as_mult_i_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_as_mult_i_cma_q = $unsigned(u0_as_mult_i_cma_qq0[32:0]);

    // d_iIn_In_c_5(DELAY,25)@0 + 5
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_iIn_In_c_5_delay_0 <= '0;
        end
        else
        begin
            d_iIn_In_c_5_delay_0 <= In_c;
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_iIn_In_c_5_delay_1 <= d_iIn_In_c_5_delay_0;
            d_iIn_In_c_5_delay_2 <= d_iIn_In_c_5_delay_1;
            d_iIn_In_c_5_delay_3 <= d_iIn_In_c_5_delay_2;
            d_iIn_In_c_5_q <= d_iIn_In_c_5_delay_3;
        end
    end

    // d_iIn_In_v_5(DELAY,24)@0 + 5
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_iIn_In_v_5_delay_0 <= '0;
        end
        else
        begin
            d_iIn_In_v_5_delay_0 <= $unsigned(In_v);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_iIn_In_v_5_delay_1 <= d_iIn_In_v_5_delay_0;
            d_iIn_In_v_5_delay_2 <= d_iIn_In_v_5_delay_1;
            d_iIn_In_v_5_delay_3 <= d_iIn_In_v_5_delay_2;
            d_iIn_In_v_5_q <= d_iIn_In_v_5_delay_3;
        end
    end

    // iOut(PORTOUT,14)@5 + 1
    assign Out_v = d_iIn_In_v_5_q;
    assign Out_c = d_iIn_In_c_5_q;
    assign iOut_0 = u0_as_mult_i_cma_q;
    assign iOut_1 = u1_as_mult_i_cma_q;
    assign iOut_2 = u2_as_mult_i_cma_q;
    assign iOut_3 = u3_as_mult_i_cma_q;

endmodule
