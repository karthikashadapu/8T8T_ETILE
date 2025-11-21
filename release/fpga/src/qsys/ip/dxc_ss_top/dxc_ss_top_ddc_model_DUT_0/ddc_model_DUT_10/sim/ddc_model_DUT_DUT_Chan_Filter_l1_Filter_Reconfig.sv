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

// SystemVerilog created from ddc_model_DUT_DUT_Chan_Filter_l1_Filter_Reconfig
// SystemVerilog created on Thu Jan  9 15:36:33 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ddc_model_DUT_DUT_Chan_Filter_l1_Filter_Reconfig (
    input wire [0:0] in_2_v_tpl,
    input wire [7:0] in_3_c_tpl,
    input wire [15:0] in_1_real_In1_tpl,
    input wire [15:0] in_1_imag_In1_tpl,
    input wire [7:0] in_4_BWconfig_C1_tpl,
    output wire [0:0] out_2_Out4_tpl,
    output wire [7:0] out_3_Out6_tpl,
    output wire [15:0] out_1_real_d1_tpl,
    output wire [15:0] out_1_imag_d1_tpl,
    output wire [0:0] out_4_CoefBankSel_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire Lut_lutmem_reset0;
    wire [0:0] Lut_lutmem_ia;
    wire [7:0] Lut_lutmem_aa;
    wire [7:0] Lut_lutmem_ab;
    wire [0:0] Lut_lutmem_ir;
    wire [0:0] Lut_lutmem_r;
    reg [0:0] redist0_ChannelIn_cunroll_x_in_2_v_tpl_2_q;
    reg [0:0] redist0_ChannelIn_cunroll_x_in_2_v_tpl_2_delay_0;
    reg [7:0] redist1_ChannelIn_cunroll_x_in_3_c_tpl_2_q;
    reg [7:0] redist1_ChannelIn_cunroll_x_in_3_c_tpl_2_delay_0;
    reg [15:0] redist2_ChannelIn_cunroll_x_in_1_real_In1_tpl_2_q;
    reg [15:0] redist2_ChannelIn_cunroll_x_in_1_real_In1_tpl_2_delay_0;
    reg [15:0] redist3_ChannelIn_cunroll_x_in_1_imag_In1_tpl_2_q;
    reg [15:0] redist3_ChannelIn_cunroll_x_in_1_imag_In1_tpl_2_delay_0;

    import ddc_model_DUT_safe_path_ver::safe_path_ver;

    // Lut_lutmem(DUALMEM,8)@0 + 2
    assign Lut_lutmem_aa = in_4_BWconfig_C1_tpl;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(1),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("NONE"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1_Filter_Reconfig_Lut_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) Lut_lutmem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(Lut_lutmem_aa),
        .q_a(Lut_lutmem_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign Lut_lutmem_r = Lut_lutmem_ir[0:0];

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist3_ChannelIn_cunroll_x_in_1_imag_In1_tpl_2(DELAY,12)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_ChannelIn_cunroll_x_in_1_imag_In1_tpl_2_delay_0 <= $unsigned(in_1_imag_In1_tpl);
            redist3_ChannelIn_cunroll_x_in_1_imag_In1_tpl_2_q <= redist3_ChannelIn_cunroll_x_in_1_imag_In1_tpl_2_delay_0;
        end
    end

    // redist2_ChannelIn_cunroll_x_in_1_real_In1_tpl_2(DELAY,11)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_ChannelIn_cunroll_x_in_1_real_In1_tpl_2_delay_0 <= $unsigned(in_1_real_In1_tpl);
            redist2_ChannelIn_cunroll_x_in_1_real_In1_tpl_2_q <= redist2_ChannelIn_cunroll_x_in_1_real_In1_tpl_2_delay_0;
        end
    end

    // redist1_ChannelIn_cunroll_x_in_3_c_tpl_2(DELAY,10)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_ChannelIn_cunroll_x_in_3_c_tpl_2_delay_0 <= $unsigned(in_3_c_tpl);
            redist1_ChannelIn_cunroll_x_in_3_c_tpl_2_q <= redist1_ChannelIn_cunroll_x_in_3_c_tpl_2_delay_0;
        end
    end

    // redist0_ChannelIn_cunroll_x_in_2_v_tpl_2(DELAY,9)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_ChannelIn_cunroll_x_in_2_v_tpl_2_delay_0 <= '0;
        end
        else
        begin
            redist0_ChannelIn_cunroll_x_in_2_v_tpl_2_delay_0 <= $unsigned(in_2_v_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_ChannelIn_cunroll_x_in_2_v_tpl_2_q <= redist0_ChannelIn_cunroll_x_in_2_v_tpl_2_delay_0;
        end
    end

    // ChannelOut_cunroll_x(PORTOUT,5)@2 + 1
    assign out_2_Out4_tpl = redist0_ChannelIn_cunroll_x_in_2_v_tpl_2_q;
    assign out_3_Out6_tpl = redist1_ChannelIn_cunroll_x_in_3_c_tpl_2_q;
    assign out_1_real_d1_tpl = redist2_ChannelIn_cunroll_x_in_1_real_In1_tpl_2_q;
    assign out_1_imag_d1_tpl = redist3_ChannelIn_cunroll_x_in_1_imag_In1_tpl_2_q;
    assign out_4_CoefBankSel_tpl = Lut_lutmem_r;

endmodule
