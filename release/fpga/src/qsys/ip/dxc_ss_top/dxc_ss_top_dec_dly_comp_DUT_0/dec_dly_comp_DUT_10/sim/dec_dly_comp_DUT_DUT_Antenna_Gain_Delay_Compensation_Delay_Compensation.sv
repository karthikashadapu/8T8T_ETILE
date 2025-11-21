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

// SystemVerilog created from dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation
// SystemVerilog created on Tue Jan  7 17:06:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation (
    input wire [0:0] in_2_vin_a1_tpl,
    input wire [7:0] in_3_cin_a1_tpl,
    input wire [31:0] in_1_0_real_din_a1_tpl,
    input wire [31:0] in_1_0_imag_din_a1_tpl,
    input wire [31:0] in_1_1_real_din_a1_tpl,
    input wire [31:0] in_1_1_imag_din_a1_tpl,
    input wire [31:0] in_1_2_real_din_a1_tpl,
    input wire [31:0] in_1_2_imag_din_a1_tpl,
    input wire [31:0] in_1_3_real_din_a1_tpl,
    input wire [31:0] in_1_3_imag_din_a1_tpl,
    input wire [0:0] in_5_vin_a2_tpl,
    input wire [7:0] in_6_cin_a2_tpl,
    input wire [31:0] in_4_0_real_din_a2_tpl,
    input wire [31:0] in_4_0_imag_din_a2_tpl,
    input wire [31:0] in_4_1_real_din_a2_tpl,
    input wire [31:0] in_4_1_imag_din_a2_tpl,
    input wire [31:0] in_4_2_real_din_a2_tpl,
    input wire [31:0] in_4_2_imag_din_a2_tpl,
    input wire [31:0] in_4_3_real_din_a2_tpl,
    input wire [31:0] in_4_3_imag_din_a2_tpl,
    output wire [0:0] out_2_altv_tpl,
    output wire [7:0] out_3_altc_tpl,
    output wire [31:0] out_1_0_real_altq_tpl,
    output wire [31:0] out_1_0_imag_altq_tpl,
    output wire [31:0] out_1_1_real_altq_tpl,
    output wire [31:0] out_1_1_imag_altq_tpl,
    output wire [31:0] out_1_2_real_altq_tpl,
    output wire [31:0] out_1_2_imag_altq_tpl,
    output wire [31:0] out_1_3_real_altq_tpl,
    output wire [31:0] out_1_3_imag_altq_tpl,
    output wire [0:0] out_5_altqv1_tpl,
    output wire [7:0] out_6_altc1_tpl,
    output wire [31:0] out_4_0_real_altq1_tpl,
    output wire [31:0] out_4_0_imag_altq1_tpl,
    output wire [31:0] out_4_1_real_altq1_tpl,
    output wire [31:0] out_4_1_imag_altq1_tpl,
    output wire [31:0] out_4_2_real_altq1_tpl,
    output wire [31:0] out_4_2_imag_altq1_tpl,
    output wire [31:0] out_4_3_real_altq1_tpl,
    output wire [31:0] out_4_3_imag_altq1_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl,
    input wire [7:0] in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [7:0] Counter_q;
    (* preserve_syn_only *) reg [7:0] Counter_i;
    wire [7:0] Counter1_q;
    (* preserve_syn_only *) reg [7:0] Counter1_i;
    wire [8:0] Sub_a;
    wire [8:0] Sub_b;
    logic [8:0] Sub_o;
    wire [8:0] Sub_q;
    wire [8:0] Sub1_a;
    wire [8:0] Sub1_b;
    logic [8:0] Sub1_o;
    wire [8:0] Sub1_q;
    wire [8:0] Sub2_a;
    wire [8:0] Sub2_b;
    logic [8:0] Sub2_o;
    wire [8:0] Sub2_q;
    wire [8:0] Sub3_a;
    wire [8:0] Sub3_b;
    logic [8:0] Sub3_o;
    wire [8:0] Sub3_q;
    wire [8:0] Sub4_a;
    wire [8:0] Sub4_b;
    logic [8:0] Sub4_o;
    wire [8:0] Sub4_q;
    wire [8:0] Sub5_a;
    wire [8:0] Sub5_b;
    logic [8:0] Sub5_o;
    wire [8:0] Sub5_q;
    wire [8:0] Sub6_a;
    wire [8:0] Sub6_b;
    logic [8:0] Sub6_o;
    wire [8:0] Sub6_q;
    wire [8:0] Sub7_a;
    wire [8:0] Sub7_b;
    logic [8:0] Sub7_o;
    wire [8:0] Sub7_q;
    wire [7:0] Sub1_PostCast_primWireOut_sel_x_b;
    wire [7:0] Sub2_PostCast_primWireOut_sel_x_b;
    wire [7:0] Sub3_PostCast_primWireOut_sel_x_b;
    wire [7:0] Sub4_PostCast_primWireOut_sel_x_b;
    wire [7:0] Sub5_PostCast_primWireOut_sel_x_b;
    wire [7:0] Sub6_PostCast_primWireOut_sel_x_b;
    wire [7:0] Sub7_PostCast_primWireOut_sel_x_b;
    wire [7:0] Sub_PostCast_primWireOut_sel_x_b;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_q;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_reset0;
    wire dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_ena_NotRstA;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_ia;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_aa;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_ab;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_iq;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_q;
    reg [0:0] redist0_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q;
    reg [0:0] redist1_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_5_q;
    reg [0:0] redist1_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_5_delay_0;
    reg [0:0] redist1_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_5_delay_1;
    reg [0:0] redist1_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_5_delay_2;
    reg [7:0] redist2_ChannelIn1_vunroll_cunroll_x_in_6_cin_a2_tpl_3_q;
    reg [7:0] redist2_ChannelIn1_vunroll_cunroll_x_in_6_cin_a2_tpl_3_delay_0;
    reg [7:0] redist2_ChannelIn1_vunroll_cunroll_x_in_6_cin_a2_tpl_3_delay_1;
    reg [31:0] redist3_ChannelIn1_vunroll_cunroll_x_in_4_0_real_din_a2_tpl_1_q;
    reg [31:0] redist4_ChannelIn1_vunroll_cunroll_x_in_4_0_imag_din_a2_tpl_1_q;
    reg [31:0] redist5_ChannelIn1_vunroll_cunroll_x_in_4_1_real_din_a2_tpl_1_q;
    reg [31:0] redist6_ChannelIn1_vunroll_cunroll_x_in_4_1_imag_din_a2_tpl_1_q;
    reg [31:0] redist7_ChannelIn1_vunroll_cunroll_x_in_4_2_real_din_a2_tpl_1_q;
    reg [31:0] redist8_ChannelIn1_vunroll_cunroll_x_in_4_2_imag_din_a2_tpl_1_q;
    reg [31:0] redist9_ChannelIn1_vunroll_cunroll_x_in_4_3_real_din_a2_tpl_1_q;
    reg [31:0] redist10_ChannelIn1_vunroll_cunroll_x_in_4_3_imag_din_a2_tpl_1_q;
    reg [0:0] redist11_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q;
    reg [0:0] redist12_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_5_q;
    reg [0:0] redist12_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_5_delay_0;
    reg [0:0] redist12_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_5_delay_1;
    reg [0:0] redist12_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_5_delay_2;
    reg [7:0] redist13_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_3_q;
    reg [7:0] redist13_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_3_delay_0;
    reg [7:0] redist13_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_3_delay_1;
    reg [31:0] redist14_ChannelIn_vunroll_cunroll_x_in_1_0_real_din_a1_tpl_1_q;
    reg [31:0] redist15_ChannelIn_vunroll_cunroll_x_in_1_0_imag_din_a1_tpl_1_q;
    reg [31:0] redist16_ChannelIn_vunroll_cunroll_x_in_1_1_real_din_a1_tpl_1_q;
    reg [31:0] redist17_ChannelIn_vunroll_cunroll_x_in_1_1_imag_din_a1_tpl_1_q;
    reg [31:0] redist18_ChannelIn_vunroll_cunroll_x_in_1_2_real_din_a1_tpl_1_q;
    reg [31:0] redist19_ChannelIn_vunroll_cunroll_x_in_1_2_imag_din_a1_tpl_1_q;
    reg [31:0] redist20_ChannelIn_vunroll_cunroll_x_in_1_3_real_din_a1_tpl_1_q;
    reg [31:0] redist21_ChannelIn_vunroll_cunroll_x_in_1_3_imag_din_a1_tpl_1_q;
    reg [7:0] redist22_Counter1_q_2_q;
    reg [7:0] redist22_Counter1_q_2_delay_0;
    reg [7:0] redist23_Counter_q_2_q;
    reg [7:0] redist23_Counter_q_2_delay_0;

    import dec_dly_comp_DUT_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist23_Counter_q_2(DELAY,121)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist23_Counter_q_2_delay_0 <= $unsigned(Counter_q);
            redist23_Counter_q_2_q <= redist23_Counter_q_2_delay_0;
        end
    end

    // Sub3(SUB,19)@3
    assign Sub3_a = $unsigned({1'b0, redist23_Counter_q_2_q});
    assign Sub3_b = $unsigned({1'b0, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl});
    assign Sub3_o = $unsigned($signed(Sub3_a) - $signed(Sub3_b));
    assign Sub3_q = Sub3_o[8:0];

    // Sub3_PostCast_primWireOut_sel_x(BITSELECT,40)@3
    assign Sub3_PostCast_primWireOut_sel_x_b = $unsigned(Sub3_q[7:0]);

    // redist21_ChannelIn_vunroll_cunroll_x_in_1_3_imag_din_a1_tpl_1(DELAY,119)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist21_ChannelIn_vunroll_cunroll_x_in_1_3_imag_din_a1_tpl_1_q <= $unsigned(in_1_3_imag_din_a1_tpl);
        end
    end

    // redist11_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1(DELAY,109)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist11_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q <= '0;
        end
        else
        begin
            redist11_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q <= $unsigned(in_2_vin_a1_tpl);
        end
    end

    // Counter(COUNTER,2)@0 + 1
    // low=0, high=255, step=1, init=255
    always @ (posedge clk)
    begin
        if (areset)
        begin
            Counter_i <= 8'd255;
        end
        else if (in_2_vin_a1_tpl == 1'b1)
        begin
            Counter_i <= $unsigned(Counter_i) + $unsigned(8'd1);
        end
    end
    assign Counter_q = Counter_i[7:0];

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x(DUALMEM,56)@1 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_ia = $unsigned(redist21_ChannelIn_vunroll_cunroll_x_in_1_3_imag_din_a1_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_aa = Counter_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_ab = Sub3_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_ia),
        .wren_a(redist11_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_iq[31:0];

    // redist20_ChannelIn_vunroll_cunroll_x_in_1_3_real_din_a1_tpl_1(DELAY,118)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist20_ChannelIn_vunroll_cunroll_x_in_1_3_real_din_a1_tpl_1_q <= $unsigned(in_1_3_real_din_a1_tpl);
        end
    end

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x(DUALMEM,57)@1 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_ia = $unsigned(redist20_ChannelIn_vunroll_cunroll_x_in_1_3_real_din_a1_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_aa = Counter_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_ab = Sub3_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_ia),
        .wren_a(redist11_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_iq[31:0];

    // Sub2(SUB,17)@3
    assign Sub2_a = $unsigned({1'b0, redist23_Counter_q_2_q});
    assign Sub2_b = $unsigned({1'b0, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl});
    assign Sub2_o = $unsigned($signed(Sub2_a) - $signed(Sub2_b));
    assign Sub2_q = Sub2_o[8:0];

    // Sub2_PostCast_primWireOut_sel_x(BITSELECT,39)@3
    assign Sub2_PostCast_primWireOut_sel_x_b = $unsigned(Sub2_q[7:0]);

    // redist19_ChannelIn_vunroll_cunroll_x_in_1_2_imag_din_a1_tpl_1(DELAY,117)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist19_ChannelIn_vunroll_cunroll_x_in_1_2_imag_din_a1_tpl_1_q <= $unsigned(in_1_2_imag_din_a1_tpl);
        end
    end

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x(DUALMEM,54)@1 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_ia = $unsigned(redist19_ChannelIn_vunroll_cunroll_x_in_1_2_imag_din_a1_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_aa = Counter_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_ab = Sub2_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_ia),
        .wren_a(redist11_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_iq[31:0];

    // redist18_ChannelIn_vunroll_cunroll_x_in_1_2_real_din_a1_tpl_1(DELAY,116)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist18_ChannelIn_vunroll_cunroll_x_in_1_2_real_din_a1_tpl_1_q <= $unsigned(in_1_2_real_din_a1_tpl);
        end
    end

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x(DUALMEM,55)@1 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_ia = $unsigned(redist18_ChannelIn_vunroll_cunroll_x_in_1_2_real_din_a1_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_aa = Counter_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_ab = Sub2_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_ia),
        .wren_a(redist11_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_iq[31:0];

    // Sub1(SUB,15)@3
    assign Sub1_a = $unsigned({1'b0, redist23_Counter_q_2_q});
    assign Sub1_b = $unsigned({1'b0, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl});
    assign Sub1_o = $unsigned($signed(Sub1_a) - $signed(Sub1_b));
    assign Sub1_q = Sub1_o[8:0];

    // Sub1_PostCast_primWireOut_sel_x(BITSELECT,38)@3
    assign Sub1_PostCast_primWireOut_sel_x_b = $unsigned(Sub1_q[7:0]);

    // redist17_ChannelIn_vunroll_cunroll_x_in_1_1_imag_din_a1_tpl_1(DELAY,115)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist17_ChannelIn_vunroll_cunroll_x_in_1_1_imag_din_a1_tpl_1_q <= $unsigned(in_1_1_imag_din_a1_tpl);
        end
    end

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x(DUALMEM,52)@1 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_ia = $unsigned(redist17_ChannelIn_vunroll_cunroll_x_in_1_1_imag_din_a1_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_aa = Counter_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_ab = Sub1_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_ia),
        .wren_a(redist11_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_iq[31:0];

    // redist16_ChannelIn_vunroll_cunroll_x_in_1_1_real_din_a1_tpl_1(DELAY,114)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist16_ChannelIn_vunroll_cunroll_x_in_1_1_real_din_a1_tpl_1_q <= $unsigned(in_1_1_real_din_a1_tpl);
        end
    end

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x(DUALMEM,53)@1 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_ia = $unsigned(redist16_ChannelIn_vunroll_cunroll_x_in_1_1_real_din_a1_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_aa = Counter_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_ab = Sub1_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_ia),
        .wren_a(redist11_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_iq[31:0];

    // Sub(SUB,14)@3
    assign Sub_a = $unsigned({1'b0, redist23_Counter_q_2_q});
    assign Sub_b = $unsigned({1'b0, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl});
    assign Sub_o = $unsigned($signed(Sub_a) - $signed(Sub_b));
    assign Sub_q = Sub_o[8:0];

    // Sub_PostCast_primWireOut_sel_x(BITSELECT,45)@3
    assign Sub_PostCast_primWireOut_sel_x_b = $unsigned(Sub_q[7:0]);

    // redist15_ChannelIn_vunroll_cunroll_x_in_1_0_imag_din_a1_tpl_1(DELAY,113)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist15_ChannelIn_vunroll_cunroll_x_in_1_0_imag_din_a1_tpl_1_q <= $unsigned(in_1_0_imag_din_a1_tpl);
        end
    end

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x(DUALMEM,50)@1 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_ia = $unsigned(redist15_ChannelIn_vunroll_cunroll_x_in_1_0_imag_din_a1_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_aa = Counter_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_ab = Sub_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_ia),
        .wren_a(redist11_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_iq[31:0];

    // redist14_ChannelIn_vunroll_cunroll_x_in_1_0_real_din_a1_tpl_1(DELAY,112)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist14_ChannelIn_vunroll_cunroll_x_in_1_0_real_din_a1_tpl_1_q <= $unsigned(in_1_0_real_din_a1_tpl);
        end
    end

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x(DUALMEM,51)@1 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_ia = $unsigned(redist14_ChannelIn_vunroll_cunroll_x_in_1_0_real_din_a1_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_aa = Counter_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_ab = Sub_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_ia),
        .wren_a(redist11_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_iq[31:0];

    // redist13_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_3(DELAY,111)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_3_delay_0 <= $unsigned(in_3_cin_a1_tpl);
            redist13_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_3_delay_1 <= redist13_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_3_delay_0;
            redist13_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_3_q <= redist13_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_3_delay_1;
        end
    end

    // redist12_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_5(DELAY,110)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist12_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_5_delay_0 <= $unsigned(redist11_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q);
            redist12_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_5_delay_1 <= redist12_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_5_delay_0;
            redist12_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_5_delay_2 <= redist12_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_5_delay_1;
            redist12_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_5_q <= redist12_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_5_delay_2;
        end
    end

    // ChannelOut_vunroll_cunroll_x(PORTOUT,48)@3 + 1
    assign out_2_altv_tpl = redist12_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_5_q;
    assign out_3_altc_tpl = redist13_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_3_q;
    assign out_1_0_real_altq_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_real_x_q;
    assign out_1_0_imag_altq_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem_imag_x_q;
    assign out_1_1_real_altq_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_real_x_q;
    assign out_1_1_imag_altq_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem1_imag_x_q;
    assign out_1_2_real_altq_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_real_x_q;
    assign out_1_2_imag_altq_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem2_imag_x_q;
    assign out_1_3_real_altq_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_real_x_q;
    assign out_1_3_imag_altq_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem_DualMem3_imag_x_q;

    // redist22_Counter1_q_2(DELAY,120)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist22_Counter1_q_2_delay_0 <= $unsigned(Counter1_q);
            redist22_Counter1_q_2_q <= redist22_Counter1_q_2_delay_0;
        end
    end

    // Sub7(SUB,27)@6
    assign Sub7_a = $unsigned({1'b0, redist22_Counter1_q_2_q});
    assign Sub7_b = $unsigned({1'b0, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl});
    assign Sub7_o = $unsigned($signed(Sub7_a) - $signed(Sub7_b));
    assign Sub7_q = Sub7_o[8:0];

    // Sub7_PostCast_primWireOut_sel_x(BITSELECT,44)@6
    assign Sub7_PostCast_primWireOut_sel_x_b = $unsigned(Sub7_q[7:0]);

    // redist10_ChannelIn1_vunroll_cunroll_x_in_4_3_imag_din_a2_tpl_1(DELAY,108)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist10_ChannelIn1_vunroll_cunroll_x_in_4_3_imag_din_a2_tpl_1_q <= $unsigned(in_4_3_imag_din_a2_tpl);
        end
    end

    // redist0_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1(DELAY,98)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q <= '0;
        end
        else
        begin
            redist0_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q <= $unsigned(in_5_vin_a2_tpl);
        end
    end

    // Counter1(COUNTER,3)@3 + 1
    // low=0, high=255, step=1, init=255
    always @ (posedge clk)
    begin
        if (areset)
        begin
            Counter1_i <= 8'd255;
        end
        else if (in_5_vin_a2_tpl == 1'b1)
        begin
            Counter1_i <= $unsigned(Counter1_i) + $unsigned(8'd1);
        end
    end
    assign Counter1_q = Counter1_i[7:0];

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x(DUALMEM,64)@4 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_ia = $unsigned(redist10_ChannelIn1_vunroll_cunroll_x_in_4_3_imag_din_a2_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_aa = Counter1_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_ab = Sub7_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_ia),
        .wren_a(redist0_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_iq[31:0];

    // redist9_ChannelIn1_vunroll_cunroll_x_in_4_3_real_din_a2_tpl_1(DELAY,107)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_ChannelIn1_vunroll_cunroll_x_in_4_3_real_din_a2_tpl_1_q <= $unsigned(in_4_3_real_din_a2_tpl);
        end
    end

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x(DUALMEM,65)@4 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_ia = $unsigned(redist9_ChannelIn1_vunroll_cunroll_x_in_4_3_real_din_a2_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_aa = Counter1_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_ab = Sub7_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_ia),
        .wren_a(redist0_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_iq[31:0];

    // Sub6(SUB,25)@6
    assign Sub6_a = $unsigned({1'b0, redist22_Counter1_q_2_q});
    assign Sub6_b = $unsigned({1'b0, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl});
    assign Sub6_o = $unsigned($signed(Sub6_a) - $signed(Sub6_b));
    assign Sub6_q = Sub6_o[8:0];

    // Sub6_PostCast_primWireOut_sel_x(BITSELECT,43)@6
    assign Sub6_PostCast_primWireOut_sel_x_b = $unsigned(Sub6_q[7:0]);

    // redist8_ChannelIn1_vunroll_cunroll_x_in_4_2_imag_din_a2_tpl_1(DELAY,106)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_ChannelIn1_vunroll_cunroll_x_in_4_2_imag_din_a2_tpl_1_q <= $unsigned(in_4_2_imag_din_a2_tpl);
        end
    end

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x(DUALMEM,62)@4 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_ia = $unsigned(redist8_ChannelIn1_vunroll_cunroll_x_in_4_2_imag_din_a2_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_aa = Counter1_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_ab = Sub6_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_ia),
        .wren_a(redist0_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_iq[31:0];

    // redist7_ChannelIn1_vunroll_cunroll_x_in_4_2_real_din_a2_tpl_1(DELAY,105)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist7_ChannelIn1_vunroll_cunroll_x_in_4_2_real_din_a2_tpl_1_q <= $unsigned(in_4_2_real_din_a2_tpl);
        end
    end

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x(DUALMEM,63)@4 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_ia = $unsigned(redist7_ChannelIn1_vunroll_cunroll_x_in_4_2_real_din_a2_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_aa = Counter1_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_ab = Sub6_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_ia),
        .wren_a(redist0_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_iq[31:0];

    // Sub5(SUB,23)@6
    assign Sub5_a = $unsigned({1'b0, redist22_Counter1_q_2_q});
    assign Sub5_b = $unsigned({1'b0, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl});
    assign Sub5_o = $unsigned($signed(Sub5_a) - $signed(Sub5_b));
    assign Sub5_q = Sub5_o[8:0];

    // Sub5_PostCast_primWireOut_sel_x(BITSELECT,42)@6
    assign Sub5_PostCast_primWireOut_sel_x_b = $unsigned(Sub5_q[7:0]);

    // redist6_ChannelIn1_vunroll_cunroll_x_in_4_1_imag_din_a2_tpl_1(DELAY,104)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_ChannelIn1_vunroll_cunroll_x_in_4_1_imag_din_a2_tpl_1_q <= $unsigned(in_4_1_imag_din_a2_tpl);
        end
    end

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x(DUALMEM,60)@4 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_ia = $unsigned(redist6_ChannelIn1_vunroll_cunroll_x_in_4_1_imag_din_a2_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_aa = Counter1_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_ab = Sub5_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_ia),
        .wren_a(redist0_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_iq[31:0];

    // redist5_ChannelIn1_vunroll_cunroll_x_in_4_1_real_din_a2_tpl_1(DELAY,103)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_ChannelIn1_vunroll_cunroll_x_in_4_1_real_din_a2_tpl_1_q <= $unsigned(in_4_1_real_din_a2_tpl);
        end
    end

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x(DUALMEM,61)@4 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_ia = $unsigned(redist5_ChannelIn1_vunroll_cunroll_x_in_4_1_real_din_a2_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_aa = Counter1_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_ab = Sub5_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_ia),
        .wren_a(redist0_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_iq[31:0];

    // Sub4(SUB,21)@6
    assign Sub4_a = $unsigned({1'b0, redist22_Counter1_q_2_q});
    assign Sub4_b = $unsigned({1'b0, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl});
    assign Sub4_o = $unsigned($signed(Sub4_a) - $signed(Sub4_b));
    assign Sub4_q = Sub4_o[8:0];

    // Sub4_PostCast_primWireOut_sel_x(BITSELECT,41)@6
    assign Sub4_PostCast_primWireOut_sel_x_b = $unsigned(Sub4_q[7:0]);

    // redist4_ChannelIn1_vunroll_cunroll_x_in_4_0_imag_din_a2_tpl_1(DELAY,102)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_ChannelIn1_vunroll_cunroll_x_in_4_0_imag_din_a2_tpl_1_q <= $unsigned(in_4_0_imag_din_a2_tpl);
        end
    end

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x(DUALMEM,58)@4 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_ia = $unsigned(redist4_ChannelIn1_vunroll_cunroll_x_in_4_0_imag_din_a2_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_aa = Counter1_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_ab = Sub4_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_ia),
        .wren_a(redist0_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_iq[31:0];

    // redist3_ChannelIn1_vunroll_cunroll_x_in_4_0_real_din_a2_tpl_1(DELAY,101)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_ChannelIn1_vunroll_cunroll_x_in_4_0_real_din_a2_tpl_1_q <= $unsigned(in_4_0_real_din_a2_tpl);
        end
    end

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x(DUALMEM,59)@4 + 2
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_ia = $unsigned(redist3_ChannelIn1_vunroll_cunroll_x_in_4_0_real_din_a2_tpl_1_q);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_aa = Counter1_q;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_ab = Sub4_PostCast_primWireOut_sel_x_b;
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_ena_NotRstA = ~ (areset);
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(32),
        .widthad_b(8),
        .numwords_b(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7")
    ) dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_dmem (
        .clocken0(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_ena_NotRstA),
        .sclr(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_reset0),
        .clock0(clk),
        .address_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_aa),
        .data_a(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_ia),
        .wren_a(redist0_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_ab),
        .q_b(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_q = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_iq[31:0];

    // redist2_ChannelIn1_vunroll_cunroll_x_in_6_cin_a2_tpl_3(DELAY,100)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_ChannelIn1_vunroll_cunroll_x_in_6_cin_a2_tpl_3_delay_0 <= $unsigned(in_6_cin_a2_tpl);
            redist2_ChannelIn1_vunroll_cunroll_x_in_6_cin_a2_tpl_3_delay_1 <= redist2_ChannelIn1_vunroll_cunroll_x_in_6_cin_a2_tpl_3_delay_0;
            redist2_ChannelIn1_vunroll_cunroll_x_in_6_cin_a2_tpl_3_q <= redist2_ChannelIn1_vunroll_cunroll_x_in_6_cin_a2_tpl_3_delay_1;
        end
    end

    // redist1_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_5(DELAY,99)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_5_delay_0 <= $unsigned(redist0_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q);
            redist1_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_5_delay_1 <= redist1_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_5_delay_0;
            redist1_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_5_delay_2 <= redist1_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_5_delay_1;
            redist1_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_5_q <= redist1_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_5_delay_2;
        end
    end

    // ChannelOut1_vunroll_cunroll_x(PORTOUT,49)@6 + 1
    assign out_5_altqv1_tpl = redist1_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_5_q;
    assign out_6_altc1_tpl = redist2_ChannelIn1_vunroll_cunroll_x_in_6_cin_a2_tpl_3_q;
    assign out_4_0_real_altq1_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_real_x_q;
    assign out_4_0_imag_altq1_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem_imag_x_q;
    assign out_4_1_real_altq1_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_real_x_q;
    assign out_4_1_imag_altq1_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem1_imag_x_q;
    assign out_4_2_real_altq1_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_real_x_q;
    assign out_4_2_imag_altq1_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem2_imag_x_q;
    assign out_4_3_real_altq1_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_real_x_q;
    assign out_4_3_imag_altq1_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_Subsystem1_DualMem3_imag_x_q;

endmodule
