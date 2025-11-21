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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_Scalei
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_Scalei (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [34:0] xIn_0,
    input wire [0:0] gain_i,
    output wire [0:0] qOut_v,
    output wire [7:0] qOut_c,
    output wire [15:0] qOut_0,
    output wire [0:0] eOut_0,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [1:0] u0_rnd_bias_q;
    reg [20:0] redist0_u0_rnd_shift_q_1_q;
    reg [0:0] redist1_xIn_v_1_q;
    reg [7:0] redist2_xIn_c_1_q;
    wire [34:0] u0_shiftsel_q;
    wire [34:0] u0_shiftsel_qint;
    wire [20:0] u0_rnd_trunc_q;
    wire [34:0] u0_rnd_trunc_qint;
    wire [21:0] u0_rnd_add_a;
    wire [21:0] u0_rnd_add_b;
    logic [21:0] u0_rnd_add_o;
    wire [21:0] u0_rnd_add_q;
    wire [20:0] u0_rnd_shift_q;
    wire [21:0] u0_rnd_shift_qint;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // u0_rnd_bias(CONSTANT,7)
    assign u0_rnd_bias_q = $unsigned(2'b01);

    // u0_shiftsel(BITSHIFT,4)@0
    assign u0_shiftsel_qint = xIn_0;
    assign u0_shiftsel_q = u0_shiftsel_qint[34:0];

    // u0_rnd_trunc(BITSHIFT,8)@0
    assign u0_rnd_trunc_qint = u0_shiftsel_q;
    assign u0_rnd_trunc_q = u0_rnd_trunc_qint[34:14];

    // u0_rnd_add(ADD,9)@0
    assign u0_rnd_add_a = $unsigned({{1{u0_rnd_trunc_q[20]}}, u0_rnd_trunc_q});
    assign u0_rnd_add_b = $unsigned({{20{u0_rnd_bias_q[1]}}, u0_rnd_bias_q});
    assign u0_rnd_add_o = $unsigned($signed(u0_rnd_add_a) + $signed(u0_rnd_add_b));
    assign u0_rnd_add_q = u0_rnd_add_o[21:0];

    // u0_rnd_shift(BITSHIFT,10)@0
    assign u0_rnd_shift_qint = u0_rnd_add_q;
    assign u0_rnd_shift_q = u0_rnd_shift_qint[21:1];

    // redist0_u0_rnd_shift_q_1(DELAY,12)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_u0_rnd_shift_q_1_q <= '0;
        end
        else
        begin
            redist0_u0_rnd_shift_q_1_q <= $unsigned(u0_rnd_shift_q);
        end
    end

    // redist2_xIn_c_1(DELAY,14)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_xIn_c_1_q <= '0;
        end
        else
        begin
            redist2_xIn_c_1_q <= $unsigned(xIn_c);
        end
    end

    // redist1_xIn_v_1(DELAY,13)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_xIn_v_1_q <= '0;
        end
        else
        begin
            redist1_xIn_v_1_q <= $unsigned(xIn_v);
        end
    end

    // qOut(PORTOUT,6)@1 + 1
    assign qOut_v = redist1_xIn_v_1_q;
    assign qOut_c = redist2_xIn_c_1_q;
    assign qOut_0 = redist0_u0_rnd_shift_q_1_q[15:0];
    assign eOut_0 = VCC_q;

endmodule
