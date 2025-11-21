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

// SystemVerilog created from dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation
// SystemVerilog created on Tue Jan  7 17:06:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation (
    input wire [15:0] in_1_0_imag_din_a1_tpl,
    input wire [15:0] in_1_0_real_din_a1_tpl,
    input wire [15:0] in_1_1_imag_din_a1_tpl,
    input wire [15:0] in_1_1_real_din_a1_tpl,
    input wire [15:0] in_1_2_imag_din_a1_tpl,
    input wire [15:0] in_1_2_real_din_a1_tpl,
    input wire [15:0] in_1_3_imag_din_a1_tpl,
    input wire [15:0] in_1_3_real_din_a1_tpl,
    input wire [0:0] in_2_vin_a1_tpl,
    input wire [7:0] in_3_cin_a1_tpl,
    input wire [15:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl,
    input wire [15:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl,
    input wire [15:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl,
    input wire [15:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl,
    output wire [31:0] out_1_0_imag_altq_tpl,
    output wire [31:0] out_1_0_real_altq_tpl,
    output wire [31:0] out_1_1_imag_altq_tpl,
    output wire [31:0] out_1_1_real_altq_tpl,
    output wire [31:0] out_1_2_imag_altq_tpl,
    output wire [31:0] out_1_2_real_altq_tpl,
    output wire [31:0] out_1_3_imag_altq_tpl,
    output wire [31:0] out_1_3_real_altq_tpl,
    output wire [0:0] out_2_altv_tpl,
    output wire [7:0] out_3_altc_tpl,
    output wire [31:0] out_4_0_imag_altq1_tpl,
    output wire [31:0] out_4_0_real_altq1_tpl,
    output wire [31:0] out_4_1_imag_altq1_tpl,
    output wire [31:0] out_4_1_real_altq1_tpl,
    output wire [31:0] out_4_2_imag_altq1_tpl,
    output wire [31:0] out_4_2_real_altq1_tpl,
    output wire [31:0] out_4_3_imag_altq1_tpl,
    output wire [31:0] out_4_3_real_altq1_tpl,
    output wire [0:0] out_5_altv1_tpl,
    output wire [7:0] out_6_altc1_tpl,
    input wire clk,
    input wire areset
    );

    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_1_0_imag_dout1_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_1_0_real_dout1_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_1_1_imag_dout1_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_1_1_real_dout1_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_1_2_imag_dout1_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_1_2_real_dout1_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_1_3_imag_dout1_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_1_3_real_dout1_tpl;
    wire [0:0] Ant_Gain_vunroll_cunroll_x_out_2_vout1_tpl;
    wire [7:0] Ant_Gain_vunroll_cunroll_x_out_3_cout1_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_4_0_imag_dout2_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_4_0_real_dout2_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_4_1_imag_dout2_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_4_1_real_dout2_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_4_2_imag_dout2_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_4_2_real_dout2_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_4_3_imag_dout2_tpl;
    wire [31:0] Ant_Gain_vunroll_cunroll_x_out_4_3_real_dout2_tpl;
    wire [0:0] Ant_Gain_vunroll_cunroll_x_out_5_vout2_tpl;
    wire [7:0] Ant_Gain_vunroll_cunroll_x_out_6_cout2_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_1_0_imag_altq_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_1_0_real_altq_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_1_1_imag_altq_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_1_1_real_altq_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_1_2_imag_altq_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_1_2_real_altq_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_1_3_imag_altq_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_1_3_real_altq_tpl;
    wire [0:0] Delay_Compensation_vunroll_cunroll_x_out_2_altv_tpl;
    wire [7:0] Delay_Compensation_vunroll_cunroll_x_out_3_altc_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_4_0_imag_altq1_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_4_0_real_altq1_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_4_1_imag_altq1_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_4_1_real_altq1_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_4_2_imag_altq1_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_4_2_real_altq1_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_4_3_imag_altq1_tpl;
    wire [31:0] Delay_Compensation_vunroll_cunroll_x_out_4_3_real_altq1_tpl;
    wire [0:0] Delay_Compensation_vunroll_cunroll_x_out_5_altqv1_tpl;
    wire [7:0] Delay_Compensation_vunroll_cunroll_x_out_6_altc1_tpl;

    import dec_dly_comp_DUT_safe_path_ver::safe_path_ver;

    // Ant_Gain_vunroll_cunroll_x(BLACKBOX,2)
    dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain theAnt_Gain_vunroll_cunroll_x (
        .in_1_In1_tpl(in_2_vin_a1_tpl),
        .in_2_In2_tpl(in_3_cin_a1_tpl),
        .in_3_0_imag_In3_tpl(in_1_0_imag_din_a1_tpl),
        .in_3_0_real_In3_tpl(in_1_0_real_din_a1_tpl),
        .in_3_1_imag_In3_tpl(in_1_1_imag_din_a1_tpl),
        .in_3_1_real_In3_tpl(in_1_1_real_din_a1_tpl),
        .in_3_2_imag_In3_tpl(in_1_2_imag_din_a1_tpl),
        .in_3_2_real_In3_tpl(in_1_2_real_din_a1_tpl),
        .in_3_3_imag_In3_tpl(in_1_3_imag_din_a1_tpl),
        .in_3_3_real_In3_tpl(in_1_3_real_din_a1_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl),
        .out_1_0_imag_dout1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_0_imag_dout1_tpl),
        .out_1_0_real_dout1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_0_real_dout1_tpl),
        .out_1_1_imag_dout1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_1_imag_dout1_tpl),
        .out_1_1_real_dout1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_1_real_dout1_tpl),
        .out_1_2_imag_dout1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_2_imag_dout1_tpl),
        .out_1_2_real_dout1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_2_real_dout1_tpl),
        .out_1_3_imag_dout1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_3_imag_dout1_tpl),
        .out_1_3_real_dout1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_3_real_dout1_tpl),
        .out_2_vout1_tpl(Ant_Gain_vunroll_cunroll_x_out_2_vout1_tpl),
        .out_3_cout1_tpl(Ant_Gain_vunroll_cunroll_x_out_3_cout1_tpl),
        .out_4_0_imag_dout2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_0_imag_dout2_tpl),
        .out_4_0_real_dout2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_0_real_dout2_tpl),
        .out_4_1_imag_dout2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_1_imag_dout2_tpl),
        .out_4_1_real_dout2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_1_real_dout2_tpl),
        .out_4_2_imag_dout2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_2_imag_dout2_tpl),
        .out_4_2_real_dout2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_2_real_dout2_tpl),
        .out_4_3_imag_dout2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_3_imag_dout2_tpl),
        .out_4_3_real_dout2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_3_real_dout2_tpl),
        .out_5_vout2_tpl(Ant_Gain_vunroll_cunroll_x_out_5_vout2_tpl),
        .out_6_cout2_tpl(Ant_Gain_vunroll_cunroll_x_out_6_cout2_tpl),
        .clk(clk),
        .areset(areset)
    );

    // Delay_Compensation_vunroll_cunroll_x(BLACKBOX,3)
    dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation theDelay_Compensation_vunroll_cunroll_x (
        .in_1_0_imag_din_a1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_0_imag_dout1_tpl),
        .in_1_0_real_din_a1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_0_real_dout1_tpl),
        .in_1_1_imag_din_a1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_1_imag_dout1_tpl),
        .in_1_1_real_din_a1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_1_real_dout1_tpl),
        .in_1_2_imag_din_a1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_2_imag_dout1_tpl),
        .in_1_2_real_din_a1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_2_real_dout1_tpl),
        .in_1_3_imag_din_a1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_3_imag_dout1_tpl),
        .in_1_3_real_din_a1_tpl(Ant_Gain_vunroll_cunroll_x_out_1_3_real_dout1_tpl),
        .in_2_vin_a1_tpl(Ant_Gain_vunroll_cunroll_x_out_2_vout1_tpl),
        .in_3_cin_a1_tpl(Ant_Gain_vunroll_cunroll_x_out_3_cout1_tpl),
        .in_4_0_imag_din_a2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_0_imag_dout2_tpl),
        .in_4_0_real_din_a2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_0_real_dout2_tpl),
        .in_4_1_imag_din_a2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_1_imag_dout2_tpl),
        .in_4_1_real_din_a2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_1_real_dout2_tpl),
        .in_4_2_imag_din_a2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_2_imag_dout2_tpl),
        .in_4_2_real_din_a2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_2_real_dout2_tpl),
        .in_4_3_imag_din_a2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_3_imag_dout2_tpl),
        .in_4_3_real_din_a2_tpl(Ant_Gain_vunroll_cunroll_x_out_4_3_real_dout2_tpl),
        .in_5_vin_a2_tpl(Ant_Gain_vunroll_cunroll_x_out_5_vout2_tpl),
        .in_6_cin_a2_tpl(Ant_Gain_vunroll_cunroll_x_out_6_cout2_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl),
        .out_1_0_imag_altq_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_0_imag_altq_tpl),
        .out_1_0_real_altq_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_0_real_altq_tpl),
        .out_1_1_imag_altq_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_1_imag_altq_tpl),
        .out_1_1_real_altq_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_1_real_altq_tpl),
        .out_1_2_imag_altq_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_2_imag_altq_tpl),
        .out_1_2_real_altq_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_2_real_altq_tpl),
        .out_1_3_imag_altq_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_3_imag_altq_tpl),
        .out_1_3_real_altq_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_3_real_altq_tpl),
        .out_2_altv_tpl(Delay_Compensation_vunroll_cunroll_x_out_2_altv_tpl),
        .out_3_altc_tpl(Delay_Compensation_vunroll_cunroll_x_out_3_altc_tpl),
        .out_4_0_imag_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_0_imag_altq1_tpl),
        .out_4_0_real_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_0_real_altq1_tpl),
        .out_4_1_imag_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_1_imag_altq1_tpl),
        .out_4_1_real_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_1_real_altq1_tpl),
        .out_4_2_imag_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_2_imag_altq1_tpl),
        .out_4_2_real_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_2_real_altq1_tpl),
        .out_4_3_imag_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_3_imag_altq1_tpl),
        .out_4_3_real_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_3_real_altq1_tpl),
        .out_5_altqv1_tpl(Delay_Compensation_vunroll_cunroll_x_out_5_altqv1_tpl),
        .out_6_altc1_tpl(Delay_Compensation_vunroll_cunroll_x_out_6_altc1_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_1_0_imag_altq_tpl(GPOUT,26)
    assign out_1_0_imag_altq_tpl = Delay_Compensation_vunroll_cunroll_x_out_1_0_imag_altq_tpl;

    // out_1_0_real_altq_tpl(GPOUT,27)
    assign out_1_0_real_altq_tpl = Delay_Compensation_vunroll_cunroll_x_out_1_0_real_altq_tpl;

    // out_1_1_imag_altq_tpl(GPOUT,28)
    assign out_1_1_imag_altq_tpl = Delay_Compensation_vunroll_cunroll_x_out_1_1_imag_altq_tpl;

    // out_1_1_real_altq_tpl(GPOUT,29)
    assign out_1_1_real_altq_tpl = Delay_Compensation_vunroll_cunroll_x_out_1_1_real_altq_tpl;

    // out_1_2_imag_altq_tpl(GPOUT,30)
    assign out_1_2_imag_altq_tpl = Delay_Compensation_vunroll_cunroll_x_out_1_2_imag_altq_tpl;

    // out_1_2_real_altq_tpl(GPOUT,31)
    assign out_1_2_real_altq_tpl = Delay_Compensation_vunroll_cunroll_x_out_1_2_real_altq_tpl;

    // out_1_3_imag_altq_tpl(GPOUT,32)
    assign out_1_3_imag_altq_tpl = Delay_Compensation_vunroll_cunroll_x_out_1_3_imag_altq_tpl;

    // out_1_3_real_altq_tpl(GPOUT,33)
    assign out_1_3_real_altq_tpl = Delay_Compensation_vunroll_cunroll_x_out_1_3_real_altq_tpl;

    // out_2_altv_tpl(GPOUT,34)
    assign out_2_altv_tpl = Delay_Compensation_vunroll_cunroll_x_out_2_altv_tpl;

    // out_3_altc_tpl(GPOUT,35)
    assign out_3_altc_tpl = Delay_Compensation_vunroll_cunroll_x_out_3_altc_tpl;

    // out_4_0_imag_altq1_tpl(GPOUT,36)
    assign out_4_0_imag_altq1_tpl = Delay_Compensation_vunroll_cunroll_x_out_4_0_imag_altq1_tpl;

    // out_4_0_real_altq1_tpl(GPOUT,37)
    assign out_4_0_real_altq1_tpl = Delay_Compensation_vunroll_cunroll_x_out_4_0_real_altq1_tpl;

    // out_4_1_imag_altq1_tpl(GPOUT,38)
    assign out_4_1_imag_altq1_tpl = Delay_Compensation_vunroll_cunroll_x_out_4_1_imag_altq1_tpl;

    // out_4_1_real_altq1_tpl(GPOUT,39)
    assign out_4_1_real_altq1_tpl = Delay_Compensation_vunroll_cunroll_x_out_4_1_real_altq1_tpl;

    // out_4_2_imag_altq1_tpl(GPOUT,40)
    assign out_4_2_imag_altq1_tpl = Delay_Compensation_vunroll_cunroll_x_out_4_2_imag_altq1_tpl;

    // out_4_2_real_altq1_tpl(GPOUT,41)
    assign out_4_2_real_altq1_tpl = Delay_Compensation_vunroll_cunroll_x_out_4_2_real_altq1_tpl;

    // out_4_3_imag_altq1_tpl(GPOUT,42)
    assign out_4_3_imag_altq1_tpl = Delay_Compensation_vunroll_cunroll_x_out_4_3_imag_altq1_tpl;

    // out_4_3_real_altq1_tpl(GPOUT,43)
    assign out_4_3_real_altq1_tpl = Delay_Compensation_vunroll_cunroll_x_out_4_3_real_altq1_tpl;

    // out_5_altv1_tpl(GPOUT,44)
    assign out_5_altv1_tpl = Delay_Compensation_vunroll_cunroll_x_out_5_altqv1_tpl;

    // out_6_altc1_tpl(GPOUT,45)
    assign out_6_altc1_tpl = Delay_Compensation_vunroll_cunroll_x_out_6_altc1_tpl;

endmodule
