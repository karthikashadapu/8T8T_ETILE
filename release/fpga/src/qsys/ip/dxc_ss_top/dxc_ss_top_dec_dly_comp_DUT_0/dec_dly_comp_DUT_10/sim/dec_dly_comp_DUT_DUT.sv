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

// SystemVerilog created from dec_dly_comp_DUT_DUT
// SystemVerilog created on Tue Jan  7 17:06:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module dec_dly_comp_DUT_DUT (
    input wire [0:0] in_1_In_v_tpl,
    input wire [7:0] in_2_In_c_tpl,
    input wire [15:0] in_3_0_imag_In_d_tpl,
    input wire [15:0] in_3_0_real_In_d_tpl,
    input wire [15:0] in_3_1_imag_In_d_tpl,
    input wire [15:0] in_3_1_real_In_d_tpl,
    input wire [15:0] in_3_2_imag_In_d_tpl,
    input wire [15:0] in_3_2_real_In_d_tpl,
    input wire [15:0] in_3_3_imag_In_d_tpl,
    input wire [15:0] in_3_3_real_In_d_tpl,
    input wire [15:0] in_3_4_imag_In_d_tpl,
    input wire [15:0] in_3_4_real_In_d_tpl,
    input wire [15:0] in_3_5_imag_In_d_tpl,
    input wire [15:0] in_3_5_real_In_d_tpl,
    input wire [15:0] in_3_6_imag_In_d_tpl,
    input wire [15:0] in_3_6_real_In_d_tpl,
    input wire [15:0] in_3_7_imag_In_d_tpl,
    input wire [15:0] in_3_7_real_In_d_tpl,
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
    input wire [15:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl,
    output wire [31:0] out_1_0_imag_q1_tpl,
    output wire [31:0] out_1_0_real_q1_tpl,
    output wire [31:0] out_1_1_imag_q1_tpl,
    output wire [31:0] out_1_1_real_q1_tpl,
    output wire [31:0] out_1_2_imag_q1_tpl,
    output wire [31:0] out_1_2_real_q1_tpl,
    output wire [31:0] out_1_3_imag_q1_tpl,
    output wire [31:0] out_1_3_real_q1_tpl,
    output wire [0:0] out_2_q_v1_tpl,
    output wire [7:0] out_3_q_c1_tpl,
    output wire [31:0] out_4_0_imag_q2_tpl,
    output wire [31:0] out_4_0_real_q2_tpl,
    output wire [31:0] out_4_1_imag_q2_tpl,
    output wire [31:0] out_4_1_real_q2_tpl,
    output wire [31:0] out_4_2_imag_q2_tpl,
    output wire [31:0] out_4_2_real_q2_tpl,
    output wire [31:0] out_4_3_imag_q2_tpl,
    output wire [31:0] out_4_3_real_q2_tpl,
    output wire [0:0] out_5_q_v2_tpl,
    output wire [7:0] out_6_q_c2_tpl,
    input wire clk,
    input wire areset
    );

    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_0_imag_altq_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_0_real_altq_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_1_imag_altq_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_1_real_altq_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_2_imag_altq_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_2_real_altq_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_3_imag_altq_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_3_real_altq_tpl;
    wire [0:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_2_altv_tpl;
    wire [7:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_3_altc_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_0_imag_altq1_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_0_real_altq1_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_1_imag_altq1_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_1_real_altq1_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_2_imag_altq1_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_2_real_altq1_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_3_imag_altq1_tpl;
    wire [31:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_3_real_altq1_tpl;
    wire [0:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_5_altv1_tpl;
    wire [7:0] Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_6_altc1_tpl;
    wire [15:0] By_Pass_vunroll_cunroll_x_out_1_0_imag_din_a1_tpl;
    wire [15:0] By_Pass_vunroll_cunroll_x_out_1_0_real_din_a1_tpl;
    wire [15:0] By_Pass_vunroll_cunroll_x_out_1_1_imag_din_a1_tpl;
    wire [15:0] By_Pass_vunroll_cunroll_x_out_1_1_real_din_a1_tpl;
    wire [15:0] By_Pass_vunroll_cunroll_x_out_1_2_imag_din_a1_tpl;
    wire [15:0] By_Pass_vunroll_cunroll_x_out_1_2_real_din_a1_tpl;
    wire [15:0] By_Pass_vunroll_cunroll_x_out_1_3_imag_din_a1_tpl;
    wire [15:0] By_Pass_vunroll_cunroll_x_out_1_3_real_din_a1_tpl;
    wire [0:0] By_Pass_vunroll_cunroll_x_out_2_vin_a1_tpl;
    wire [7:0] By_Pass_vunroll_cunroll_x_out_3_cin_a1_tpl;
    wire [15:0] Polyphase_Decimator_vunroll_cunroll_x_out_1_0_imag_q_tpl;
    wire [15:0] Polyphase_Decimator_vunroll_cunroll_x_out_1_0_real_q_tpl;
    wire [15:0] Polyphase_Decimator_vunroll_cunroll_x_out_1_1_imag_q_tpl;
    wire [15:0] Polyphase_Decimator_vunroll_cunroll_x_out_1_1_real_q_tpl;
    wire [15:0] Polyphase_Decimator_vunroll_cunroll_x_out_1_2_imag_q_tpl;
    wire [15:0] Polyphase_Decimator_vunroll_cunroll_x_out_1_2_real_q_tpl;
    wire [15:0] Polyphase_Decimator_vunroll_cunroll_x_out_1_3_imag_q_tpl;
    wire [15:0] Polyphase_Decimator_vunroll_cunroll_x_out_1_3_real_q_tpl;
    wire [0:0] Polyphase_Decimator_vunroll_cunroll_x_out_2_qv_tpl;
    wire [7:0] Polyphase_Decimator_vunroll_cunroll_x_out_3_qc_tpl;

    import dec_dly_comp_DUT_safe_path_ver::safe_path_ver;

    // Polyphase_Decimator_vunroll_cunroll_x(BLACKBOX,4)
    dec_dly_comp_DUT_DUT_Polyphase_Decimator thePolyphase_Decimator_vunroll_cunroll_x (
        .in_1_0_imag_d_tpl(in_3_0_imag_In_d_tpl),
        .in_1_0_real_d_tpl(in_3_0_real_In_d_tpl),
        .in_1_1_imag_d_tpl(in_3_1_imag_In_d_tpl),
        .in_1_1_real_d_tpl(in_3_1_real_In_d_tpl),
        .in_1_2_imag_d_tpl(in_3_2_imag_In_d_tpl),
        .in_1_2_real_d_tpl(in_3_2_real_In_d_tpl),
        .in_1_3_imag_d_tpl(in_3_3_imag_In_d_tpl),
        .in_1_3_real_d_tpl(in_3_3_real_In_d_tpl),
        .in_1_4_imag_d_tpl(in_3_4_imag_In_d_tpl),
        .in_1_4_real_d_tpl(in_3_4_real_In_d_tpl),
        .in_1_5_imag_d_tpl(in_3_5_imag_In_d_tpl),
        .in_1_5_real_d_tpl(in_3_5_real_In_d_tpl),
        .in_1_6_imag_d_tpl(in_3_6_imag_In_d_tpl),
        .in_1_6_real_d_tpl(in_3_6_real_In_d_tpl),
        .in_1_7_imag_d_tpl(in_3_7_imag_In_d_tpl),
        .in_1_7_real_d_tpl(in_3_7_real_In_d_tpl),
        .in_2_v_tpl(in_1_In_v_tpl),
        .in_3_c_tpl(in_2_In_c_tpl),
        .out_1_0_imag_q_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_0_imag_q_tpl),
        .out_1_0_real_q_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_0_real_q_tpl),
        .out_1_1_imag_q_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_1_imag_q_tpl),
        .out_1_1_real_q_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_1_real_q_tpl),
        .out_1_2_imag_q_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_2_imag_q_tpl),
        .out_1_2_real_q_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_2_real_q_tpl),
        .out_1_3_imag_q_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_3_imag_q_tpl),
        .out_1_3_real_q_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_3_real_q_tpl),
        .out_2_qv_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_2_qv_tpl),
        .out_3_qc_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_3_qc_tpl),
        .clk(clk),
        .areset(areset)
    );

    // By_Pass_vunroll_cunroll_x(BLACKBOX,3)
    dec_dly_comp_DUT_DUT_By_Pass theBy_Pass_vunroll_cunroll_x (
        .in_1_0_imag_din_dec_out_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_0_imag_q_tpl),
        .in_1_0_real_din_dec_out_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_0_real_q_tpl),
        .in_1_1_imag_din_dec_out_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_1_imag_q_tpl),
        .in_1_1_real_din_dec_out_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_1_real_q_tpl),
        .in_1_2_imag_din_dec_out_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_2_imag_q_tpl),
        .in_1_2_real_din_dec_out_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_2_real_q_tpl),
        .in_1_3_imag_din_dec_out_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_3_imag_q_tpl),
        .in_1_3_real_din_dec_out_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_1_3_real_q_tpl),
        .in_2_0_imag_din_dec_in_tpl(in_3_0_imag_In_d_tpl),
        .in_2_0_real_din_dec_in_tpl(in_3_0_real_In_d_tpl),
        .in_2_1_imag_din_dec_in_tpl(in_3_1_imag_In_d_tpl),
        .in_2_1_real_din_dec_in_tpl(in_3_1_real_In_d_tpl),
        .in_2_2_imag_din_dec_in_tpl(in_3_2_imag_In_d_tpl),
        .in_2_2_real_din_dec_in_tpl(in_3_2_real_In_d_tpl),
        .in_2_3_imag_din_dec_in_tpl(in_3_3_imag_In_d_tpl),
        .in_2_3_real_din_dec_in_tpl(in_3_3_real_In_d_tpl),
        .in_2_4_imag_din_dec_in_tpl(in_3_4_imag_In_d_tpl),
        .in_2_4_real_din_dec_in_tpl(in_3_4_real_In_d_tpl),
        .in_2_5_imag_din_dec_in_tpl(in_3_5_imag_In_d_tpl),
        .in_2_5_real_din_dec_in_tpl(in_3_5_real_In_d_tpl),
        .in_2_6_imag_din_dec_in_tpl(in_3_6_imag_In_d_tpl),
        .in_2_6_real_din_dec_in_tpl(in_3_6_real_In_d_tpl),
        .in_2_7_imag_din_dec_in_tpl(in_3_7_imag_In_d_tpl),
        .in_2_7_real_din_dec_in_tpl(in_3_7_real_In_d_tpl),
        .in_3_vin_dec_out_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_2_qv_tpl),
        .in_4_cin_dec_in_tpl(in_2_In_c_tpl),
        .in_5_cin_dec_out_tpl(Polyphase_Decimator_vunroll_cunroll_x_out_3_qc_tpl),
        .in_6_vin_dec_in_tpl(in_1_In_v_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl),
        .out_1_0_imag_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_0_imag_din_a1_tpl),
        .out_1_0_real_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_0_real_din_a1_tpl),
        .out_1_1_imag_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_1_imag_din_a1_tpl),
        .out_1_1_real_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_1_real_din_a1_tpl),
        .out_1_2_imag_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_2_imag_din_a1_tpl),
        .out_1_2_real_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_2_real_din_a1_tpl),
        .out_1_3_imag_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_3_imag_din_a1_tpl),
        .out_1_3_real_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_3_real_din_a1_tpl),
        .out_2_vin_a1_tpl(By_Pass_vunroll_cunroll_x_out_2_vin_a1_tpl),
        .out_3_cin_a1_tpl(By_Pass_vunroll_cunroll_x_out_3_cin_a1_tpl),
        .clk(clk),
        .areset(areset)
    );

    // Antenna_Gain_Delay_Compensation_vunroll_cunroll_x(BLACKBOX,2)
    dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation theAntenna_Gain_Delay_Compensation_vunroll_cunroll_x (
        .in_1_0_imag_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_0_imag_din_a1_tpl),
        .in_1_0_real_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_0_real_din_a1_tpl),
        .in_1_1_imag_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_1_imag_din_a1_tpl),
        .in_1_1_real_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_1_real_din_a1_tpl),
        .in_1_2_imag_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_2_imag_din_a1_tpl),
        .in_1_2_real_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_2_real_din_a1_tpl),
        .in_1_3_imag_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_3_imag_din_a1_tpl),
        .in_1_3_real_din_a1_tpl(By_Pass_vunroll_cunroll_x_out_1_3_real_din_a1_tpl),
        .in_2_vin_a1_tpl(By_Pass_vunroll_cunroll_x_out_2_vin_a1_tpl),
        .in_3_cin_a1_tpl(By_Pass_vunroll_cunroll_x_out_3_cin_a1_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl(in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl),
        .out_1_0_imag_altq_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_0_imag_altq_tpl),
        .out_1_0_real_altq_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_0_real_altq_tpl),
        .out_1_1_imag_altq_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_1_imag_altq_tpl),
        .out_1_1_real_altq_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_1_real_altq_tpl),
        .out_1_2_imag_altq_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_2_imag_altq_tpl),
        .out_1_2_real_altq_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_2_real_altq_tpl),
        .out_1_3_imag_altq_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_3_imag_altq_tpl),
        .out_1_3_real_altq_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_3_real_altq_tpl),
        .out_2_altv_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_2_altv_tpl),
        .out_3_altc_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_3_altc_tpl),
        .out_4_0_imag_altq1_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_0_imag_altq1_tpl),
        .out_4_0_real_altq1_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_0_real_altq1_tpl),
        .out_4_1_imag_altq1_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_1_imag_altq1_tpl),
        .out_4_1_real_altq1_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_1_real_altq1_tpl),
        .out_4_2_imag_altq1_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_2_imag_altq1_tpl),
        .out_4_2_real_altq1_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_2_real_altq1_tpl),
        .out_4_3_imag_altq1_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_3_imag_altq1_tpl),
        .out_4_3_real_altq1_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_3_real_altq1_tpl),
        .out_5_altv1_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_5_altv1_tpl),
        .out_6_altc1_tpl(Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_6_altc1_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_1_0_imag_q1_tpl(GPOUT,36)
    assign out_1_0_imag_q1_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_0_imag_altq_tpl;

    // out_1_0_real_q1_tpl(GPOUT,37)
    assign out_1_0_real_q1_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_0_real_altq_tpl;

    // out_1_1_imag_q1_tpl(GPOUT,38)
    assign out_1_1_imag_q1_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_1_imag_altq_tpl;

    // out_1_1_real_q1_tpl(GPOUT,39)
    assign out_1_1_real_q1_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_1_real_altq_tpl;

    // out_1_2_imag_q1_tpl(GPOUT,40)
    assign out_1_2_imag_q1_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_2_imag_altq_tpl;

    // out_1_2_real_q1_tpl(GPOUT,41)
    assign out_1_2_real_q1_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_2_real_altq_tpl;

    // out_1_3_imag_q1_tpl(GPOUT,42)
    assign out_1_3_imag_q1_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_3_imag_altq_tpl;

    // out_1_3_real_q1_tpl(GPOUT,43)
    assign out_1_3_real_q1_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_1_3_real_altq_tpl;

    // out_2_q_v1_tpl(GPOUT,44)
    assign out_2_q_v1_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_2_altv_tpl;

    // out_3_q_c1_tpl(GPOUT,45)
    assign out_3_q_c1_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_3_altc_tpl;

    // out_4_0_imag_q2_tpl(GPOUT,46)
    assign out_4_0_imag_q2_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_0_imag_altq1_tpl;

    // out_4_0_real_q2_tpl(GPOUT,47)
    assign out_4_0_real_q2_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_0_real_altq1_tpl;

    // out_4_1_imag_q2_tpl(GPOUT,48)
    assign out_4_1_imag_q2_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_1_imag_altq1_tpl;

    // out_4_1_real_q2_tpl(GPOUT,49)
    assign out_4_1_real_q2_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_1_real_altq1_tpl;

    // out_4_2_imag_q2_tpl(GPOUT,50)
    assign out_4_2_imag_q2_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_2_imag_altq1_tpl;

    // out_4_2_real_q2_tpl(GPOUT,51)
    assign out_4_2_real_q2_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_2_real_altq1_tpl;

    // out_4_3_imag_q2_tpl(GPOUT,52)
    assign out_4_3_imag_q2_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_3_imag_altq1_tpl;

    // out_4_3_real_q2_tpl(GPOUT,53)
    assign out_4_3_real_q2_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_4_3_real_altq1_tpl;

    // out_5_q_v2_tpl(GPOUT,54)
    assign out_5_q_v2_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_5_altv1_tpl;

    // out_6_q_c2_tpl(GPOUT,55)
    assign out_6_q_c2_tpl = Antenna_Gain_Delay_Compensation_vunroll_cunroll_x_out_6_altc1_tpl;

endmodule
