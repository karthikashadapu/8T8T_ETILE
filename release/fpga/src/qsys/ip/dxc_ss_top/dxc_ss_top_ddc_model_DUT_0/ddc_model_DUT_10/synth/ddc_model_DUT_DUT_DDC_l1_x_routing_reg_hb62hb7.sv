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

// SystemVerilog created from ddc_model_DUT_DUT_DDC_l1_x_routing_reg_hb62hb7
// SystemVerilog created on Thu Jan  9 15:36:33 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ddc_model_DUT_DUT_DDC_l1_x_routing_reg_hb62hb7 (
    input wire [0:0] in_2_dv_tpl,
    input wire [7:0] in_3_dc_tpl,
    input wire [15:0] in_1_0_real_d_tpl,
    input wire [15:0] in_1_0_imag_d_tpl,
    input wire [15:0] in_1_1_real_d_tpl,
    input wire [15:0] in_1_1_imag_d_tpl,
    output wire [0:0] out_2_qv_tpl,
    output wire [7:0] out_3_qc_tpl,
    output wire [15:0] out_1_0_real_q0_tpl,
    output wire [15:0] out_1_0_imag_q0_tpl,
    output wire [15:0] out_1_1_real_q0_tpl,
    output wire [15:0] out_1_1_imag_q0_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    reg [0:0] redist0_ChannelIn_vunroll_cunroll_x_in_2_dv_tpl_3_q;
    reg [0:0] redist0_ChannelIn_vunroll_cunroll_x_in_2_dv_tpl_3_delay_0;
    reg [0:0] redist0_ChannelIn_vunroll_cunroll_x_in_2_dv_tpl_3_delay_1;
    reg [7:0] redist1_ChannelIn_vunroll_cunroll_x_in_3_dc_tpl_3_q;
    reg [7:0] redist1_ChannelIn_vunroll_cunroll_x_in_3_dc_tpl_3_delay_0;
    reg [7:0] redist1_ChannelIn_vunroll_cunroll_x_in_3_dc_tpl_3_delay_1;
    reg [15:0] redist2_ChannelIn_vunroll_cunroll_x_in_1_0_real_d_tpl_3_q;
    reg [15:0] redist2_ChannelIn_vunroll_cunroll_x_in_1_0_real_d_tpl_3_delay_0;
    reg [15:0] redist2_ChannelIn_vunroll_cunroll_x_in_1_0_real_d_tpl_3_delay_1;
    reg [15:0] redist3_ChannelIn_vunroll_cunroll_x_in_1_0_imag_d_tpl_3_q;
    reg [15:0] redist3_ChannelIn_vunroll_cunroll_x_in_1_0_imag_d_tpl_3_delay_0;
    reg [15:0] redist3_ChannelIn_vunroll_cunroll_x_in_1_0_imag_d_tpl_3_delay_1;
    reg [15:0] redist4_ChannelIn_vunroll_cunroll_x_in_1_1_real_d_tpl_3_q;
    reg [15:0] redist4_ChannelIn_vunroll_cunroll_x_in_1_1_real_d_tpl_3_delay_0;
    reg [15:0] redist4_ChannelIn_vunroll_cunroll_x_in_1_1_real_d_tpl_3_delay_1;
    reg [15:0] redist5_ChannelIn_vunroll_cunroll_x_in_1_1_imag_d_tpl_3_q;
    reg [15:0] redist5_ChannelIn_vunroll_cunroll_x_in_1_1_imag_d_tpl_3_delay_0;
    reg [15:0] redist5_ChannelIn_vunroll_cunroll_x_in_1_1_imag_d_tpl_3_delay_1;

    import ddc_model_DUT_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist5_ChannelIn_vunroll_cunroll_x_in_1_1_imag_d_tpl_3(DELAY,9)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_ChannelIn_vunroll_cunroll_x_in_1_1_imag_d_tpl_3_delay_0 <= $unsigned(in_1_1_imag_d_tpl);
            redist5_ChannelIn_vunroll_cunroll_x_in_1_1_imag_d_tpl_3_delay_1 <= redist5_ChannelIn_vunroll_cunroll_x_in_1_1_imag_d_tpl_3_delay_0;
            redist5_ChannelIn_vunroll_cunroll_x_in_1_1_imag_d_tpl_3_q <= redist5_ChannelIn_vunroll_cunroll_x_in_1_1_imag_d_tpl_3_delay_1;
        end
    end

    // redist4_ChannelIn_vunroll_cunroll_x_in_1_1_real_d_tpl_3(DELAY,8)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_ChannelIn_vunroll_cunroll_x_in_1_1_real_d_tpl_3_delay_0 <= $unsigned(in_1_1_real_d_tpl);
            redist4_ChannelIn_vunroll_cunroll_x_in_1_1_real_d_tpl_3_delay_1 <= redist4_ChannelIn_vunroll_cunroll_x_in_1_1_real_d_tpl_3_delay_0;
            redist4_ChannelIn_vunroll_cunroll_x_in_1_1_real_d_tpl_3_q <= redist4_ChannelIn_vunroll_cunroll_x_in_1_1_real_d_tpl_3_delay_1;
        end
    end

    // redist3_ChannelIn_vunroll_cunroll_x_in_1_0_imag_d_tpl_3(DELAY,7)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_ChannelIn_vunroll_cunroll_x_in_1_0_imag_d_tpl_3_delay_0 <= $unsigned(in_1_0_imag_d_tpl);
            redist3_ChannelIn_vunroll_cunroll_x_in_1_0_imag_d_tpl_3_delay_1 <= redist3_ChannelIn_vunroll_cunroll_x_in_1_0_imag_d_tpl_3_delay_0;
            redist3_ChannelIn_vunroll_cunroll_x_in_1_0_imag_d_tpl_3_q <= redist3_ChannelIn_vunroll_cunroll_x_in_1_0_imag_d_tpl_3_delay_1;
        end
    end

    // redist2_ChannelIn_vunroll_cunroll_x_in_1_0_real_d_tpl_3(DELAY,6)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_ChannelIn_vunroll_cunroll_x_in_1_0_real_d_tpl_3_delay_0 <= $unsigned(in_1_0_real_d_tpl);
            redist2_ChannelIn_vunroll_cunroll_x_in_1_0_real_d_tpl_3_delay_1 <= redist2_ChannelIn_vunroll_cunroll_x_in_1_0_real_d_tpl_3_delay_0;
            redist2_ChannelIn_vunroll_cunroll_x_in_1_0_real_d_tpl_3_q <= redist2_ChannelIn_vunroll_cunroll_x_in_1_0_real_d_tpl_3_delay_1;
        end
    end

    // redist1_ChannelIn_vunroll_cunroll_x_in_3_dc_tpl_3(DELAY,5)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_ChannelIn_vunroll_cunroll_x_in_3_dc_tpl_3_delay_0 <= $unsigned(in_3_dc_tpl);
            redist1_ChannelIn_vunroll_cunroll_x_in_3_dc_tpl_3_delay_1 <= redist1_ChannelIn_vunroll_cunroll_x_in_3_dc_tpl_3_delay_0;
            redist1_ChannelIn_vunroll_cunroll_x_in_3_dc_tpl_3_q <= redist1_ChannelIn_vunroll_cunroll_x_in_3_dc_tpl_3_delay_1;
        end
    end

    // redist0_ChannelIn_vunroll_cunroll_x_in_2_dv_tpl_3(DELAY,4)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_ChannelIn_vunroll_cunroll_x_in_2_dv_tpl_3_delay_0 <= '0;
        end
        else
        begin
            redist0_ChannelIn_vunroll_cunroll_x_in_2_dv_tpl_3_delay_0 <= $unsigned(in_2_dv_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_ChannelIn_vunroll_cunroll_x_in_2_dv_tpl_3_delay_1 <= redist0_ChannelIn_vunroll_cunroll_x_in_2_dv_tpl_3_delay_0;
            redist0_ChannelIn_vunroll_cunroll_x_in_2_dv_tpl_3_q <= redist0_ChannelIn_vunroll_cunroll_x_in_2_dv_tpl_3_delay_1;
        end
    end

    // ChannelOut_vunroll_cunroll_x(PORTOUT,3)@3 + 1
    assign out_2_qv_tpl = redist0_ChannelIn_vunroll_cunroll_x_in_2_dv_tpl_3_q;
    assign out_3_qc_tpl = redist1_ChannelIn_vunroll_cunroll_x_in_3_dc_tpl_3_q;
    assign out_1_0_real_q0_tpl = redist2_ChannelIn_vunroll_cunroll_x_in_1_0_real_d_tpl_3_q;
    assign out_1_0_imag_q0_tpl = redist3_ChannelIn_vunroll_cunroll_x_in_1_0_imag_d_tpl_3_q;
    assign out_1_1_real_q0_tpl = redist4_ChannelIn_vunroll_cunroll_x_in_1_1_real_d_tpl_3_q;
    assign out_1_1_imag_q0_tpl = redist5_ChannelIn_vunroll_cunroll_x_in_1_1_imag_d_tpl_3_q;

endmodule
