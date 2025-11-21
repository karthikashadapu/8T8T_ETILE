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

// SystemVerilog created from ddc_model_DUT_DUT_Chan_Filter_l1
// SystemVerilog created on Thu Jan  9 15:36:33 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ddc_model_DUT_DUT_Chan_Filter_l1 (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    input wire [15:0] in_1_imag_d_tpl,
    input wire [15:0] in_1_real_d_tpl,
    input wire [0:0] in_2_v_tpl,
    input wire [7:0] in_3_c_tpl,
    input wire [7:0] in_4_BW_c1_tpl,
    output wire [15:0] out_1_imag_q_tpl,
    output wire [15:0] out_1_real_q_tpl,
    output wire [0:0] out_2_qv_tpl,
    output wire [7:0] out_3_qc_tpl,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [31:0] Chan_Filter_cunroll_x_busOut_readdata;
    wire [0:0] Chan_Filter_cunroll_x_busOut_readdatavalid;
    wire [15:0] Chan_Filter_cunroll_x_out_1_imag_q_tpl;
    wire [15:0] Chan_Filter_cunroll_x_out_1_real_q_tpl;
    wire [0:0] Chan_Filter_cunroll_x_out_2_qv_tpl;
    wire [7:0] Chan_Filter_cunroll_x_out_3_qc_tpl;
    wire [15:0] Filter_Reconfig_cunroll_x_out_1_imag_d1_tpl;
    wire [15:0] Filter_Reconfig_cunroll_x_out_1_real_d1_tpl;
    wire [0:0] Filter_Reconfig_cunroll_x_out_2_Out4_tpl;
    wire [7:0] Filter_Reconfig_cunroll_x_out_3_Out6_tpl;
    wire [0:0] Filter_Reconfig_cunroll_x_out_4_CoefBankSel_tpl;

    import ddc_model_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // Filter_Reconfig_cunroll_x(BLACKBOX,8)
    ddc_model_DUT_DUT_Chan_Filter_l1_Filter_Reconfig theFilter_Reconfig_cunroll_x (
        .in_1_imag_In1_tpl(in_1_imag_d_tpl),
        .in_1_real_In1_tpl(in_1_real_d_tpl),
        .in_2_v_tpl(in_2_v_tpl),
        .in_3_c_tpl(in_3_c_tpl),
        .in_4_BWconfig_C1_tpl(in_4_BW_c1_tpl),
        .out_1_imag_d1_tpl(Filter_Reconfig_cunroll_x_out_1_imag_d1_tpl),
        .out_1_real_d1_tpl(Filter_Reconfig_cunroll_x_out_1_real_d1_tpl),
        .out_2_Out4_tpl(Filter_Reconfig_cunroll_x_out_2_Out4_tpl),
        .out_3_Out6_tpl(Filter_Reconfig_cunroll_x_out_3_Out6_tpl),
        .out_4_CoefBankSel_tpl(Filter_Reconfig_cunroll_x_out_4_CoefBankSel_tpl),
        .clk(clk),
        .areset(areset)
    );

    // Chan_Filter_cunroll_x(BLACKBOX,7)
    ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter theChan_Filter_cunroll_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_1_imag_d1_tpl(Filter_Reconfig_cunroll_x_out_1_imag_d1_tpl),
        .in_1_real_d1_tpl(Filter_Reconfig_cunroll_x_out_1_real_d1_tpl),
        .in_2_v_tpl(Filter_Reconfig_cunroll_x_out_2_Out4_tpl),
        .in_3_c_tpl(Filter_Reconfig_cunroll_x_out_3_Out6_tpl),
        .in_4_bank_tpl(Filter_Reconfig_cunroll_x_out_4_CoefBankSel_tpl),
        .busOut_readdata(Chan_Filter_cunroll_x_busOut_readdata),
        .busOut_readdatavalid(Chan_Filter_cunroll_x_busOut_readdatavalid),
        .out_1_imag_q_tpl(Chan_Filter_cunroll_x_out_1_imag_q_tpl),
        .out_1_real_q_tpl(Chan_Filter_cunroll_x_out_1_real_q_tpl),
        .out_2_qv_tpl(Chan_Filter_cunroll_x_out_2_qv_tpl),
        .out_3_qc_tpl(Chan_Filter_cunroll_x_out_3_qc_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = Chan_Filter_cunroll_x_busOut_readdatavalid;
    assign busOut_readdata = Chan_Filter_cunroll_x_busOut_readdata;

    // out_1_imag_q_tpl(GPOUT,14)
    assign out_1_imag_q_tpl = Chan_Filter_cunroll_x_out_1_imag_q_tpl;

    // out_1_real_q_tpl(GPOUT,15)
    assign out_1_real_q_tpl = Chan_Filter_cunroll_x_out_1_real_q_tpl;

    // out_2_qv_tpl(GPOUT,16)
    assign out_2_qv_tpl = Chan_Filter_cunroll_x_out_2_qv_tpl;

    // out_3_qc_tpl(GPOUT,17)
    assign out_3_qc_tpl = Chan_Filter_cunroll_x_out_3_qc_tpl;

endmodule
