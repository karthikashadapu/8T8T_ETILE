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

// SystemVerilog created from ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation
// SystemVerilog created on Tue Jan  7 17:04:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation (
    input wire [0:0] in_2_vin_a1_tpl,
    input wire [7:0] in_3_cin_a1_tpl,
    input wire [15:0] in_1_0_real_din_a1_tpl,
    input wire [15:0] in_1_0_imag_din_a1_tpl,
    input wire [15:0] in_1_1_real_din_a1_tpl,
    input wire [15:0] in_1_1_imag_din_a1_tpl,
    input wire [15:0] in_1_2_real_din_a1_tpl,
    input wire [15:0] in_1_2_imag_din_a1_tpl,
    input wire [15:0] in_1_3_real_din_a1_tpl,
    input wire [15:0] in_1_3_imag_din_a1_tpl,
    input wire [0:0] in_5_vin_a2_tpl,
    input wire [7:0] in_6_cin_a2_tpl,
    input wire [15:0] in_4_0_real_din_a2_tpl,
    input wire [15:0] in_4_0_imag_din_a2_tpl,
    input wire [15:0] in_4_1_real_din_a2_tpl,
    input wire [15:0] in_4_1_imag_din_a2_tpl,
    input wire [15:0] in_4_2_real_din_a2_tpl,
    input wire [15:0] in_4_2_imag_din_a2_tpl,
    input wire [15:0] in_4_3_real_din_a2_tpl,
    input wire [15:0] in_4_3_imag_din_a2_tpl,
    output wire [0:0] out_2_altv_tpl,
    output wire [7:0] out_3_altc_tpl,
    output wire [15:0] out_1_0_real_altq1_tpl,
    output wire [15:0] out_1_0_imag_altq1_tpl,
    output wire [15:0] out_1_1_real_altq1_tpl,
    output wire [15:0] out_1_1_imag_altq1_tpl,
    output wire [15:0] out_1_2_real_altq1_tpl,
    output wire [15:0] out_1_2_imag_altq1_tpl,
    output wire [15:0] out_1_3_real_altq1_tpl,
    output wire [15:0] out_1_3_imag_altq1_tpl,
    output wire [15:0] out_4_0_real_altq2_tpl,
    output wire [15:0] out_4_0_imag_altq2_tpl,
    output wire [15:0] out_4_1_real_altq2_tpl,
    output wire [15:0] out_4_1_imag_altq2_tpl,
    output wire [15:0] out_4_2_real_altq2_tpl,
    output wire [15:0] out_4_2_imag_altq2_tpl,
    output wire [15:0] out_4_3_real_altq2_tpl,
    output wire [15:0] out_4_3_imag_altq2_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [7:0] Counter_q;
    (* preserve_syn_only *) reg [7:0] Counter_i;
    wire [7:0] Counter1_q;
    (* preserve_syn_only *) reg [7:0] Counter1_i;
    wire [0:0] Or_rsrvd_fix_qi;
    reg [0:0] Or_rsrvd_fix_q;
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
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_q;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_reset0;
    wire ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_ena_NotRstA;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_ia;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_aa;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_ab;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_iq;
    wire [15:0] ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_q;
    reg [15:0] redist0_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_q_1_q;
    reg [15:0] redist1_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_q_1_q;
    reg [15:0] redist2_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_q_1_q;
    reg [15:0] redist3_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_q_1_q;
    reg [15:0] redist4_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_q_1_q;
    reg [15:0] redist5_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_q_1_q;
    reg [15:0] redist6_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_q_1_q;
    reg [15:0] redist7_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_q_1_q;
    reg [15:0] redist8_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_q_1_q;
    reg [15:0] redist9_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_q_1_q;
    reg [15:0] redist10_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_q_1_q;
    reg [15:0] redist11_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_q_1_q;
    reg [15:0] redist12_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_q_1_q;
    reg [15:0] redist13_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_q_1_q;
    reg [15:0] redist14_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_q_1_q;
    reg [15:0] redist15_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_q_1_q;
    reg [0:0] redist16_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q;
    reg [15:0] redist17_ChannelIn1_vunroll_cunroll_x_in_4_0_real_din_a2_tpl_1_q;
    reg [15:0] redist18_ChannelIn1_vunroll_cunroll_x_in_4_0_imag_din_a2_tpl_1_q;
    reg [15:0] redist19_ChannelIn1_vunroll_cunroll_x_in_4_1_real_din_a2_tpl_1_q;
    reg [15:0] redist20_ChannelIn1_vunroll_cunroll_x_in_4_1_imag_din_a2_tpl_1_q;
    reg [15:0] redist21_ChannelIn1_vunroll_cunroll_x_in_4_2_real_din_a2_tpl_1_q;
    reg [15:0] redist22_ChannelIn1_vunroll_cunroll_x_in_4_2_imag_din_a2_tpl_1_q;
    reg [15:0] redist23_ChannelIn1_vunroll_cunroll_x_in_4_3_real_din_a2_tpl_1_q;
    reg [15:0] redist24_ChannelIn1_vunroll_cunroll_x_in_4_3_imag_din_a2_tpl_1_q;
    reg [0:0] redist25_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q;
    reg [7:0] redist26_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_4_q;
    reg [7:0] redist26_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_4_delay_0;
    reg [7:0] redist26_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_4_delay_1;
    reg [7:0] redist26_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_4_delay_2;
    reg [15:0] redist27_ChannelIn_vunroll_cunroll_x_in_1_0_real_din_a1_tpl_1_q;
    reg [15:0] redist28_ChannelIn_vunroll_cunroll_x_in_1_0_imag_din_a1_tpl_1_q;
    reg [15:0] redist29_ChannelIn_vunroll_cunroll_x_in_1_1_real_din_a1_tpl_1_q;
    reg [15:0] redist30_ChannelIn_vunroll_cunroll_x_in_1_1_imag_din_a1_tpl_1_q;
    reg [15:0] redist31_ChannelIn_vunroll_cunroll_x_in_1_2_real_din_a1_tpl_1_q;
    reg [15:0] redist32_ChannelIn_vunroll_cunroll_x_in_1_2_imag_din_a1_tpl_1_q;
    reg [15:0] redist33_ChannelIn_vunroll_cunroll_x_in_1_3_real_din_a1_tpl_1_q;
    reg [15:0] redist34_ChannelIn_vunroll_cunroll_x_in_1_3_imag_din_a1_tpl_1_q;
    reg [0:0] redist35_Or_rsrvd_fix_q_5_q;
    reg [0:0] redist35_Or_rsrvd_fix_q_5_delay_0;
    reg [0:0] redist35_Or_rsrvd_fix_q_5_delay_1;
    reg [0:0] redist35_Or_rsrvd_fix_q_5_delay_2;
    reg [7:0] redist36_Counter1_q_2_q;
    reg [7:0] redist36_Counter1_q_2_delay_0;
    reg [7:0] redist37_Counter_q_2_q;
    reg [7:0] redist37_Counter_q_2_delay_0;

    import ca_interp_DUT_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist36_Counter1_q_2(DELAY,133)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist36_Counter1_q_2_delay_0 <= $unsigned(Counter1_q);
            redist36_Counter1_q_2_q <= redist36_Counter1_q_2_delay_0;
        end
    end

    // Sub7(SUB,27)@3
    assign Sub7_a = $unsigned({1'b0, redist36_Counter1_q_2_q});
    assign Sub7_b = $unsigned({1'b0, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl});
    assign Sub7_o = $unsigned($signed(Sub7_a) - $signed(Sub7_b));
    assign Sub7_q = Sub7_o[8:0];

    // Sub7_PostCast_primWireOut_sel_x(BITSELECT,44)@3
    assign Sub7_PostCast_primWireOut_sel_x_b = $unsigned(Sub7_q[7:0]);

    // redist24_ChannelIn1_vunroll_cunroll_x_in_4_3_imag_din_a2_tpl_1(DELAY,121)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist24_ChannelIn1_vunroll_cunroll_x_in_4_3_imag_din_a2_tpl_1_q <= $unsigned(in_4_3_imag_din_a2_tpl);
        end
    end

    // redist16_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1(DELAY,113)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist16_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q <= '0;
        end
        else
        begin
            redist16_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q <= $unsigned(in_5_vin_a2_tpl);
        end
    end

    // Counter1(COUNTER,3)@0 + 1
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

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x(DUALMEM,63)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_ia = $unsigned(redist24_ChannelIn1_vunroll_cunroll_x_in_4_3_imag_din_a2_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_aa = Counter1_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_ab = Sub7_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_ia),
        .wren_a(redist16_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_iq[15:0];

    // redist1_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_q_1(DELAY,98)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_q);
        end
    end

    // redist23_ChannelIn1_vunroll_cunroll_x_in_4_3_real_din_a2_tpl_1(DELAY,120)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist23_ChannelIn1_vunroll_cunroll_x_in_4_3_real_din_a2_tpl_1_q <= $unsigned(in_4_3_real_din_a2_tpl);
        end
    end

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x(DUALMEM,64)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_ia = $unsigned(redist23_ChannelIn1_vunroll_cunroll_x_in_4_3_real_din_a2_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_aa = Counter1_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_ab = Sub7_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_ia),
        .wren_a(redist16_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_iq[15:0];

    // redist0_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_q_1(DELAY,97)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_q);
        end
    end

    // Sub6(SUB,25)@3
    assign Sub6_a = $unsigned({1'b0, redist36_Counter1_q_2_q});
    assign Sub6_b = $unsigned({1'b0, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl});
    assign Sub6_o = $unsigned($signed(Sub6_a) - $signed(Sub6_b));
    assign Sub6_q = Sub6_o[8:0];

    // Sub6_PostCast_primWireOut_sel_x(BITSELECT,43)@3
    assign Sub6_PostCast_primWireOut_sel_x_b = $unsigned(Sub6_q[7:0]);

    // redist22_ChannelIn1_vunroll_cunroll_x_in_4_2_imag_din_a2_tpl_1(DELAY,119)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist22_ChannelIn1_vunroll_cunroll_x_in_4_2_imag_din_a2_tpl_1_q <= $unsigned(in_4_2_imag_din_a2_tpl);
        end
    end

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x(DUALMEM,61)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_ia = $unsigned(redist22_ChannelIn1_vunroll_cunroll_x_in_4_2_imag_din_a2_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_aa = Counter1_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_ab = Sub6_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_ia),
        .wren_a(redist16_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_iq[15:0];

    // redist3_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_q_1(DELAY,100)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_q);
        end
    end

    // redist21_ChannelIn1_vunroll_cunroll_x_in_4_2_real_din_a2_tpl_1(DELAY,118)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist21_ChannelIn1_vunroll_cunroll_x_in_4_2_real_din_a2_tpl_1_q <= $unsigned(in_4_2_real_din_a2_tpl);
        end
    end

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x(DUALMEM,62)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_ia = $unsigned(redist21_ChannelIn1_vunroll_cunroll_x_in_4_2_real_din_a2_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_aa = Counter1_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_ab = Sub6_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_ia),
        .wren_a(redist16_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_iq[15:0];

    // redist2_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_q_1(DELAY,99)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_q);
        end
    end

    // Sub5(SUB,23)@3
    assign Sub5_a = $unsigned({1'b0, redist36_Counter1_q_2_q});
    assign Sub5_b = $unsigned({1'b0, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl});
    assign Sub5_o = $unsigned($signed(Sub5_a) - $signed(Sub5_b));
    assign Sub5_q = Sub5_o[8:0];

    // Sub5_PostCast_primWireOut_sel_x(BITSELECT,42)@3
    assign Sub5_PostCast_primWireOut_sel_x_b = $unsigned(Sub5_q[7:0]);

    // redist20_ChannelIn1_vunroll_cunroll_x_in_4_1_imag_din_a2_tpl_1(DELAY,117)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist20_ChannelIn1_vunroll_cunroll_x_in_4_1_imag_din_a2_tpl_1_q <= $unsigned(in_4_1_imag_din_a2_tpl);
        end
    end

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x(DUALMEM,59)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_ia = $unsigned(redist20_ChannelIn1_vunroll_cunroll_x_in_4_1_imag_din_a2_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_aa = Counter1_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_ab = Sub5_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_ia),
        .wren_a(redist16_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_iq[15:0];

    // redist5_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_q_1(DELAY,102)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_q);
        end
    end

    // redist19_ChannelIn1_vunroll_cunroll_x_in_4_1_real_din_a2_tpl_1(DELAY,116)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist19_ChannelIn1_vunroll_cunroll_x_in_4_1_real_din_a2_tpl_1_q <= $unsigned(in_4_1_real_din_a2_tpl);
        end
    end

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x(DUALMEM,60)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_ia = $unsigned(redist19_ChannelIn1_vunroll_cunroll_x_in_4_1_real_din_a2_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_aa = Counter1_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_ab = Sub5_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_ia),
        .wren_a(redist16_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_iq[15:0];

    // redist4_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_q_1(DELAY,101)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_q);
        end
    end

    // Sub4(SUB,21)@3
    assign Sub4_a = $unsigned({1'b0, redist36_Counter1_q_2_q});
    assign Sub4_b = $unsigned({1'b0, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl});
    assign Sub4_o = $unsigned($signed(Sub4_a) - $signed(Sub4_b));
    assign Sub4_q = Sub4_o[8:0];

    // Sub4_PostCast_primWireOut_sel_x(BITSELECT,41)@3
    assign Sub4_PostCast_primWireOut_sel_x_b = $unsigned(Sub4_q[7:0]);

    // redist18_ChannelIn1_vunroll_cunroll_x_in_4_0_imag_din_a2_tpl_1(DELAY,115)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist18_ChannelIn1_vunroll_cunroll_x_in_4_0_imag_din_a2_tpl_1_q <= $unsigned(in_4_0_imag_din_a2_tpl);
        end
    end

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x(DUALMEM,57)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_ia = $unsigned(redist18_ChannelIn1_vunroll_cunroll_x_in_4_0_imag_din_a2_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_aa = Counter1_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_ab = Sub4_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_ia),
        .wren_a(redist16_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_iq[15:0];

    // redist7_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_q_1(DELAY,104)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist7_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_q);
        end
    end

    // redist17_ChannelIn1_vunroll_cunroll_x_in_4_0_real_din_a2_tpl_1(DELAY,114)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist17_ChannelIn1_vunroll_cunroll_x_in_4_0_real_din_a2_tpl_1_q <= $unsigned(in_4_0_real_din_a2_tpl);
        end
    end

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x(DUALMEM,58)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_ia = $unsigned(redist17_ChannelIn1_vunroll_cunroll_x_in_4_0_real_din_a2_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_aa = Counter1_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_ab = Sub4_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_ia),
        .wren_a(redist16_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_iq[15:0];

    // redist6_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_q_1(DELAY,103)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_q);
        end
    end

    // redist37_Counter_q_2(DELAY,134)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist37_Counter_q_2_delay_0 <= $unsigned(Counter_q);
            redist37_Counter_q_2_q <= redist37_Counter_q_2_delay_0;
        end
    end

    // Sub3(SUB,19)@3
    assign Sub3_a = $unsigned({1'b0, redist37_Counter_q_2_q});
    assign Sub3_b = $unsigned({1'b0, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl});
    assign Sub3_o = $unsigned($signed(Sub3_a) - $signed(Sub3_b));
    assign Sub3_q = Sub3_o[8:0];

    // Sub3_PostCast_primWireOut_sel_x(BITSELECT,40)@3
    assign Sub3_PostCast_primWireOut_sel_x_b = $unsigned(Sub3_q[7:0]);

    // redist34_ChannelIn_vunroll_cunroll_x_in_1_3_imag_din_a1_tpl_1(DELAY,131)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist34_ChannelIn_vunroll_cunroll_x_in_1_3_imag_din_a1_tpl_1_q <= $unsigned(in_1_3_imag_din_a1_tpl);
        end
    end

    // redist25_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1(DELAY,122)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist25_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q <= '0;
        end
        else
        begin
            redist25_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q <= $unsigned(in_2_vin_a1_tpl);
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

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x(DUALMEM,55)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_ia = $unsigned(redist34_ChannelIn_vunroll_cunroll_x_in_1_3_imag_din_a1_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_aa = Counter_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_ab = Sub3_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_ia),
        .wren_a(redist25_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_iq[15:0];

    // redist9_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_q_1(DELAY,106)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_q);
        end
    end

    // redist33_ChannelIn_vunroll_cunroll_x_in_1_3_real_din_a1_tpl_1(DELAY,130)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist33_ChannelIn_vunroll_cunroll_x_in_1_3_real_din_a1_tpl_1_q <= $unsigned(in_1_3_real_din_a1_tpl);
        end
    end

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x(DUALMEM,56)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_ia = $unsigned(redist33_ChannelIn_vunroll_cunroll_x_in_1_3_real_din_a1_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_aa = Counter_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_ab = Sub3_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_ia),
        .wren_a(redist25_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_iq[15:0];

    // redist8_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_q_1(DELAY,105)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_q);
        end
    end

    // Sub2(SUB,17)@3
    assign Sub2_a = $unsigned({1'b0, redist37_Counter_q_2_q});
    assign Sub2_b = $unsigned({1'b0, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl});
    assign Sub2_o = $unsigned($signed(Sub2_a) - $signed(Sub2_b));
    assign Sub2_q = Sub2_o[8:0];

    // Sub2_PostCast_primWireOut_sel_x(BITSELECT,39)@3
    assign Sub2_PostCast_primWireOut_sel_x_b = $unsigned(Sub2_q[7:0]);

    // redist32_ChannelIn_vunroll_cunroll_x_in_1_2_imag_din_a1_tpl_1(DELAY,129)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist32_ChannelIn_vunroll_cunroll_x_in_1_2_imag_din_a1_tpl_1_q <= $unsigned(in_1_2_imag_din_a1_tpl);
        end
    end

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x(DUALMEM,53)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_ia = $unsigned(redist32_ChannelIn_vunroll_cunroll_x_in_1_2_imag_din_a1_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_aa = Counter_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_ab = Sub2_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_ia),
        .wren_a(redist25_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_iq[15:0];

    // redist11_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_q_1(DELAY,108)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist11_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_q);
        end
    end

    // redist31_ChannelIn_vunroll_cunroll_x_in_1_2_real_din_a1_tpl_1(DELAY,128)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist31_ChannelIn_vunroll_cunroll_x_in_1_2_real_din_a1_tpl_1_q <= $unsigned(in_1_2_real_din_a1_tpl);
        end
    end

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x(DUALMEM,54)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_ia = $unsigned(redist31_ChannelIn_vunroll_cunroll_x_in_1_2_real_din_a1_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_aa = Counter_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_ab = Sub2_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_ia),
        .wren_a(redist25_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_iq[15:0];

    // redist10_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_q_1(DELAY,107)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist10_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_q);
        end
    end

    // Sub1(SUB,15)@3
    assign Sub1_a = $unsigned({1'b0, redist37_Counter_q_2_q});
    assign Sub1_b = $unsigned({1'b0, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl});
    assign Sub1_o = $unsigned($signed(Sub1_a) - $signed(Sub1_b));
    assign Sub1_q = Sub1_o[8:0];

    // Sub1_PostCast_primWireOut_sel_x(BITSELECT,38)@3
    assign Sub1_PostCast_primWireOut_sel_x_b = $unsigned(Sub1_q[7:0]);

    // redist30_ChannelIn_vunroll_cunroll_x_in_1_1_imag_din_a1_tpl_1(DELAY,127)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist30_ChannelIn_vunroll_cunroll_x_in_1_1_imag_din_a1_tpl_1_q <= $unsigned(in_1_1_imag_din_a1_tpl);
        end
    end

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x(DUALMEM,51)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_ia = $unsigned(redist30_ChannelIn_vunroll_cunroll_x_in_1_1_imag_din_a1_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_aa = Counter_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_ab = Sub1_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_ia),
        .wren_a(redist25_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_iq[15:0];

    // redist13_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_q_1(DELAY,110)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_q);
        end
    end

    // redist29_ChannelIn_vunroll_cunroll_x_in_1_1_real_din_a1_tpl_1(DELAY,126)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist29_ChannelIn_vunroll_cunroll_x_in_1_1_real_din_a1_tpl_1_q <= $unsigned(in_1_1_real_din_a1_tpl);
        end
    end

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x(DUALMEM,52)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_ia = $unsigned(redist29_ChannelIn_vunroll_cunroll_x_in_1_1_real_din_a1_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_aa = Counter_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_ab = Sub1_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_ia),
        .wren_a(redist25_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_iq[15:0];

    // redist12_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_q_1(DELAY,109)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist12_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_q);
        end
    end

    // Sub(SUB,14)@3
    assign Sub_a = $unsigned({1'b0, redist37_Counter_q_2_q});
    assign Sub_b = $unsigned({1'b0, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl});
    assign Sub_o = $unsigned($signed(Sub_a) - $signed(Sub_b));
    assign Sub_q = Sub_o[8:0];

    // Sub_PostCast_primWireOut_sel_x(BITSELECT,45)@3
    assign Sub_PostCast_primWireOut_sel_x_b = $unsigned(Sub_q[7:0]);

    // redist28_ChannelIn_vunroll_cunroll_x_in_1_0_imag_din_a1_tpl_1(DELAY,125)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist28_ChannelIn_vunroll_cunroll_x_in_1_0_imag_din_a1_tpl_1_q <= $unsigned(in_1_0_imag_din_a1_tpl);
        end
    end

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x(DUALMEM,49)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_ia = $unsigned(redist28_ChannelIn_vunroll_cunroll_x_in_1_0_imag_din_a1_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_aa = Counter_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_ab = Sub_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_ia),
        .wren_a(redist25_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_iq[15:0];

    // redist15_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_q_1(DELAY,112)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist15_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_q);
        end
    end

    // redist27_ChannelIn_vunroll_cunroll_x_in_1_0_real_din_a1_tpl_1(DELAY,124)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist27_ChannelIn_vunroll_cunroll_x_in_1_0_real_din_a1_tpl_1_q <= $unsigned(in_1_0_real_din_a1_tpl);
        end
    end

    // ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x(DUALMEM,50)@1 + 2
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_ia = $unsigned(redist27_ChannelIn_vunroll_cunroll_x_in_1_0_real_din_a1_tpl_1_q);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_aa = Counter_q;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_ab = Sub_PostCast_primWireOut_sel_x_b;
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_ena_NotRstA = ~ (areset);
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .width_b(16),
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
    ) ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_dmem (
        .clocken0(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_ena_NotRstA),
        .sclr(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_reset0),
        .clock0(clk),
        .address_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_aa),
        .data_a(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_ia),
        .wren_a(redist25_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q[0]),
        .address_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_ab),
        .q_b(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_iq),
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
    assign ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_q = ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_iq[15:0];

    // redist14_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_q_1(DELAY,111)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist14_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_q_1_q <= $unsigned(ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_q);
        end
    end

    // redist26_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_4(DELAY,123)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist26_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_4_delay_0 <= $unsigned(in_3_cin_a1_tpl);
            redist26_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_4_delay_1 <= redist26_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_4_delay_0;
            redist26_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_4_delay_2 <= redist26_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_4_delay_1;
            redist26_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_4_q <= redist26_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_4_delay_2;
        end
    end

    // Or_rsrvd_fix(LOGICAL,4)@1 + 1
    assign Or_rsrvd_fix_qi = redist25_ChannelIn_vunroll_cunroll_x_in_2_vin_a1_tpl_1_q | redist16_ChannelIn1_vunroll_cunroll_x_in_5_vin_a2_tpl_1_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    Or_rsrvd_fix_delay ( .xin(Or_rsrvd_fix_qi), .xout(Or_rsrvd_fix_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist35_Or_rsrvd_fix_q_5(DELAY,132)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist35_Or_rsrvd_fix_q_5_delay_0 <= '0;
        end
        else
        begin
            redist35_Or_rsrvd_fix_q_5_delay_0 <= $unsigned(Or_rsrvd_fix_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist35_Or_rsrvd_fix_q_5_delay_1 <= redist35_Or_rsrvd_fix_q_5_delay_0;
            redist35_Or_rsrvd_fix_q_5_delay_2 <= redist35_Or_rsrvd_fix_q_5_delay_1;
            redist35_Or_rsrvd_fix_q_5_q <= redist35_Or_rsrvd_fix_q_5_delay_2;
        end
    end

    // ChannelOut_vunroll_cunroll_x(PORTOUT,48)@4 + 1
    assign out_2_altv_tpl = redist35_Or_rsrvd_fix_q_5_q;
    assign out_3_altc_tpl = redist26_ChannelIn_vunroll_cunroll_x_in_3_cin_a1_tpl_4_q;
    assign out_1_0_real_altq1_tpl = redist14_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_real_x_q_1_q;
    assign out_1_0_imag_altq1_tpl = redist15_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem_imag_x_q_1_q;
    assign out_1_1_real_altq1_tpl = redist12_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_real_x_q_1_q;
    assign out_1_1_imag_altq1_tpl = redist13_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem1_imag_x_q_1_q;
    assign out_1_2_real_altq1_tpl = redist10_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_real_x_q_1_q;
    assign out_1_2_imag_altq1_tpl = redist11_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem2_imag_x_q_1_q;
    assign out_1_3_real_altq1_tpl = redist8_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_real_x_q_1_q;
    assign out_1_3_imag_altq1_tpl = redist9_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem1_DualMem3_imag_x_q_1_q;
    assign out_4_0_real_altq2_tpl = redist6_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_real_x_q_1_q;
    assign out_4_0_imag_altq2_tpl = redist7_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem_imag_x_q_1_q;
    assign out_4_1_real_altq2_tpl = redist4_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_real_x_q_1_q;
    assign out_4_1_imag_altq2_tpl = redist5_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem1_imag_x_q_1_q;
    assign out_4_2_real_altq2_tpl = redist2_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_real_x_q_1_q;
    assign out_4_2_imag_altq2_tpl = redist3_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem2_imag_x_q_1_q;
    assign out_4_3_real_altq2_tpl = redist0_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_real_x_q_1_q;
    assign out_4_3_imag_altq2_tpl = redist1_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_Mem2_DualMem3_imag_x_q_1_q;

endmodule
