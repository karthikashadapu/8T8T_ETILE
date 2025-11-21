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

// SystemVerilog created from ca_interp_DUT_Summer_DUC
// SystemVerilog created on Tue Jan  7 17:04:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ca_interp_DUT_Summer_DUC (
    input wire [0:0] in_1_v_1_tpl,
    input wire [7:0] in_2_c_1_tpl,
    input wire [15:0] in_3_0_imag_d_1_tpl,
    input wire [15:0] in_3_0_real_d_1_tpl,
    input wire [15:0] in_3_1_imag_d_1_tpl,
    input wire [15:0] in_3_1_real_d_1_tpl,
    input wire [15:0] in_3_2_imag_d_1_tpl,
    input wire [15:0] in_3_2_real_d_1_tpl,
    input wire [15:0] in_3_3_imag_d_1_tpl,
    input wire [15:0] in_3_3_real_d_1_tpl,
    input wire [0:0] in_4_v_2_tpl,
    input wire [7:0] in_5_c_2_tpl,
    input wire [15:0] in_6_0_imag_d_2_tpl,
    input wire [15:0] in_6_0_real_d_2_tpl,
    input wire [15:0] in_6_1_imag_d_2_tpl,
    input wire [15:0] in_6_1_real_d_2_tpl,
    input wire [15:0] in_6_2_imag_d_2_tpl,
    input wire [15:0] in_6_2_real_d_2_tpl,
    input wire [15:0] in_6_3_imag_d_2_tpl,
    input wire [15:0] in_6_3_real_d_2_tpl,
    input wire [15:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl,
    input wire [15:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl,
    input wire [15:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl,
    input wire [15:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl,
    input wire [15:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl,
    input wire [7:0] in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl,
    output wire [7:0] out_1_cout_tpl,
    output wire [0:0] out_2_vout_tpl,
    output wire [15:0] out_3_0_imag_dout_tpl,
    output wire [15:0] out_3_0_real_dout_tpl,
    output wire [15:0] out_3_1_imag_dout_tpl,
    output wire [15:0] out_3_1_real_dout_tpl,
    output wire [15:0] out_3_2_imag_dout_tpl,
    output wire [15:0] out_3_2_real_dout_tpl,
    output wire [15:0] out_3_3_imag_dout_tpl,
    output wire [15:0] out_3_3_real_dout_tpl,
    output wire [15:0] out_3_4_imag_dout_tpl,
    output wire [15:0] out_3_4_real_dout_tpl,
    output wire [15:0] out_3_5_imag_dout_tpl,
    output wire [15:0] out_3_5_real_dout_tpl,
    output wire [15:0] out_3_6_imag_dout_tpl,
    output wire [15:0] out_3_6_real_dout_tpl,
    output wire [15:0] out_3_7_imag_dout_tpl,
    output wire [15:0] out_3_7_real_dout_tpl,
    output wire [15:0] out_4_0_imag_summer_dout_tpl,
    output wire [15:0] out_4_0_real_summer_dout_tpl,
    output wire [15:0] out_4_1_imag_summer_dout_tpl,
    output wire [15:0] out_4_1_real_summer_dout_tpl,
    output wire [15:0] out_4_2_imag_summer_dout_tpl,
    output wire [15:0] out_4_2_real_summer_dout_tpl,
    output wire [15:0] out_4_3_imag_summer_dout_tpl,
    output wire [15:0] out_4_3_real_summer_dout_tpl,
    output wire [0:0] out_5_summer_vout_tpl,
    output wire [7:0] out_6_summer_cout_tpl,
    input wire clk,
    input wire areset
    );

    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_0_imag_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_0_real_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_1_imag_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_1_real_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_2_imag_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_2_real_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_3_imag_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_3_real_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_4_imag_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_4_real_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_5_imag_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_5_real_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_6_imag_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_6_real_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_7_imag_q_tpl;
    wire [15:0] Poly_phase_Interp_vunroll_cunroll_x_out_1_7_real_q_tpl;
    wire [0:0] Poly_phase_Interp_vunroll_cunroll_x_out_2_qv_tpl;
    wire [7:0] Poly_phase_Interp_vunroll_cunroll_x_out_3_qc_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_0_imag_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_0_real_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_1_imag_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_1_real_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_2_imag_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_2_real_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_3_imag_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_3_real_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_4_imag_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_4_real_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_5_imag_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_5_real_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_6_imag_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_6_real_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_7_imag_dout_tpl;
    wire [15:0] Subsystem_vunroll_cunroll_x_out_1_7_real_dout_tpl;
    wire [0:0] Subsystem_vunroll_cunroll_x_out_2_vout_tpl;
    wire [7:0] Subsystem_vunroll_cunroll_x_out_3_cout_tpl;
    wire [15:0] Summer_vunroll_cunroll_x_out_1_0_imag_alt_data1_tpl;
    wire [15:0] Summer_vunroll_cunroll_x_out_1_0_real_alt_data1_tpl;
    wire [15:0] Summer_vunroll_cunroll_x_out_1_1_imag_alt_data1_tpl;
    wire [15:0] Summer_vunroll_cunroll_x_out_1_1_real_alt_data1_tpl;
    wire [15:0] Summer_vunroll_cunroll_x_out_1_2_imag_alt_data1_tpl;
    wire [15:0] Summer_vunroll_cunroll_x_out_1_2_real_alt_data1_tpl;
    wire [15:0] Summer_vunroll_cunroll_x_out_1_3_imag_alt_data1_tpl;
    wire [15:0] Summer_vunroll_cunroll_x_out_1_3_real_alt_data1_tpl;
    wire [0:0] Summer_vunroll_cunroll_x_out_2_alt_v1_tpl;
    wire [7:0] Summer_vunroll_cunroll_x_out_3_alt_c1_tpl;

    import ca_interp_DUT_safe_path_ver::safe_path_ver;

    // Summer_vunroll_cunroll_x(BLACKBOX,4)
    ca_interp_DUT_Summer_DUC_Summer theSummer_vunroll_cunroll_x (
        .in_1_0_imag_d1_tpl(in_3_0_imag_d_1_tpl),
        .in_1_0_real_d1_tpl(in_3_0_real_d_1_tpl),
        .in_1_1_imag_d1_tpl(in_3_1_imag_d_1_tpl),
        .in_1_1_real_d1_tpl(in_3_1_real_d_1_tpl),
        .in_1_2_imag_d1_tpl(in_3_2_imag_d_1_tpl),
        .in_1_2_real_d1_tpl(in_3_2_real_d_1_tpl),
        .in_1_3_imag_d1_tpl(in_3_3_imag_d_1_tpl),
        .in_1_3_real_d1_tpl(in_3_3_real_d_1_tpl),
        .in_2_v1_tpl(in_1_v_1_tpl),
        .in_3_c1_tpl(in_2_c_1_tpl),
        .in_4_0_imag_d2_tpl(in_6_0_imag_d_2_tpl),
        .in_4_0_real_d2_tpl(in_6_0_real_d_2_tpl),
        .in_4_1_imag_d2_tpl(in_6_1_imag_d_2_tpl),
        .in_4_1_real_d2_tpl(in_6_1_real_d_2_tpl),
        .in_4_2_imag_d2_tpl(in_6_2_imag_d_2_tpl),
        .in_4_2_real_d2_tpl(in_6_2_real_d_2_tpl),
        .in_4_3_imag_d2_tpl(in_6_3_imag_d_2_tpl),
        .in_4_3_real_d2_tpl(in_6_3_real_d_2_tpl),
        .in_5_v2_tpl(in_4_v_2_tpl),
        .in_6_c2_tpl(in_5_c_2_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl),
        .out_1_0_imag_alt_data1_tpl(Summer_vunroll_cunroll_x_out_1_0_imag_alt_data1_tpl),
        .out_1_0_real_alt_data1_tpl(Summer_vunroll_cunroll_x_out_1_0_real_alt_data1_tpl),
        .out_1_1_imag_alt_data1_tpl(Summer_vunroll_cunroll_x_out_1_1_imag_alt_data1_tpl),
        .out_1_1_real_alt_data1_tpl(Summer_vunroll_cunroll_x_out_1_1_real_alt_data1_tpl),
        .out_1_2_imag_alt_data1_tpl(Summer_vunroll_cunroll_x_out_1_2_imag_alt_data1_tpl),
        .out_1_2_real_alt_data1_tpl(Summer_vunroll_cunroll_x_out_1_2_real_alt_data1_tpl),
        .out_1_3_imag_alt_data1_tpl(Summer_vunroll_cunroll_x_out_1_3_imag_alt_data1_tpl),
        .out_1_3_real_alt_data1_tpl(Summer_vunroll_cunroll_x_out_1_3_real_alt_data1_tpl),
        .out_2_alt_v1_tpl(Summer_vunroll_cunroll_x_out_2_alt_v1_tpl),
        .out_3_alt_c1_tpl(Summer_vunroll_cunroll_x_out_3_alt_c1_tpl),
        .clk(clk),
        .areset(areset)
    );

    // Poly_phase_Interp_vunroll_cunroll_x(BLACKBOX,2)
    ca_interp_DUT_Summer_DUC_Poly_phase_Interp thePoly_phase_Interp_vunroll_cunroll_x (
        .in_1_0_imag_In1_tpl(Summer_vunroll_cunroll_x_out_1_0_imag_alt_data1_tpl),
        .in_1_0_real_In1_tpl(Summer_vunroll_cunroll_x_out_1_0_real_alt_data1_tpl),
        .in_1_1_imag_In1_tpl(Summer_vunroll_cunroll_x_out_1_1_imag_alt_data1_tpl),
        .in_1_1_real_In1_tpl(Summer_vunroll_cunroll_x_out_1_1_real_alt_data1_tpl),
        .in_1_2_imag_In1_tpl(Summer_vunroll_cunroll_x_out_1_2_imag_alt_data1_tpl),
        .in_1_2_real_In1_tpl(Summer_vunroll_cunroll_x_out_1_2_real_alt_data1_tpl),
        .in_1_3_imag_In1_tpl(Summer_vunroll_cunroll_x_out_1_3_imag_alt_data1_tpl),
        .in_1_3_real_In1_tpl(Summer_vunroll_cunroll_x_out_1_3_real_alt_data1_tpl),
        .in_2_In2_tpl(Summer_vunroll_cunroll_x_out_2_alt_v1_tpl),
        .in_3_In3_tpl(Summer_vunroll_cunroll_x_out_3_alt_c1_tpl),
        .out_1_0_imag_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_0_imag_q_tpl),
        .out_1_0_real_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_0_real_q_tpl),
        .out_1_1_imag_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_1_imag_q_tpl),
        .out_1_1_real_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_1_real_q_tpl),
        .out_1_2_imag_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_2_imag_q_tpl),
        .out_1_2_real_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_2_real_q_tpl),
        .out_1_3_imag_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_3_imag_q_tpl),
        .out_1_3_real_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_3_real_q_tpl),
        .out_1_4_imag_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_4_imag_q_tpl),
        .out_1_4_real_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_4_real_q_tpl),
        .out_1_5_imag_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_5_imag_q_tpl),
        .out_1_5_real_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_5_real_q_tpl),
        .out_1_6_imag_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_6_imag_q_tpl),
        .out_1_6_real_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_6_real_q_tpl),
        .out_1_7_imag_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_7_imag_q_tpl),
        .out_1_7_real_q_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_7_real_q_tpl),
        .out_2_qv_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_2_qv_tpl),
        .out_3_qc_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_3_qc_tpl),
        .clk(clk),
        .areset(areset)
    );

    // Subsystem_vunroll_cunroll_x(BLACKBOX,3)
    ca_interp_DUT_Summer_DUC_Subsystem theSubsystem_vunroll_cunroll_x (
        .in_1_0_imag_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_0_imag_q_tpl),
        .in_1_0_real_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_0_real_q_tpl),
        .in_1_1_imag_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_1_imag_q_tpl),
        .in_1_1_real_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_1_real_q_tpl),
        .in_1_2_imag_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_2_imag_q_tpl),
        .in_1_2_real_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_2_real_q_tpl),
        .in_1_3_imag_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_3_imag_q_tpl),
        .in_1_3_real_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_3_real_q_tpl),
        .in_1_4_imag_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_4_imag_q_tpl),
        .in_1_4_real_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_4_real_q_tpl),
        .in_1_5_imag_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_5_imag_q_tpl),
        .in_1_5_real_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_5_real_q_tpl),
        .in_1_6_imag_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_6_imag_q_tpl),
        .in_1_6_real_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_6_real_q_tpl),
        .in_1_7_imag_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_7_imag_q_tpl),
        .in_1_7_real_din_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_1_7_real_q_tpl),
        .in_2_0_imag_din_intp_in_tpl(Summer_vunroll_cunroll_x_out_1_0_imag_alt_data1_tpl),
        .in_2_0_real_din_intp_in_tpl(Summer_vunroll_cunroll_x_out_1_0_real_alt_data1_tpl),
        .in_2_1_imag_din_intp_in_tpl(Summer_vunroll_cunroll_x_out_1_1_imag_alt_data1_tpl),
        .in_2_1_real_din_intp_in_tpl(Summer_vunroll_cunroll_x_out_1_1_real_alt_data1_tpl),
        .in_2_2_imag_din_intp_in_tpl(Summer_vunroll_cunroll_x_out_1_2_imag_alt_data1_tpl),
        .in_2_2_real_din_intp_in_tpl(Summer_vunroll_cunroll_x_out_1_2_real_alt_data1_tpl),
        .in_2_3_imag_din_intp_in_tpl(Summer_vunroll_cunroll_x_out_1_3_imag_alt_data1_tpl),
        .in_2_3_real_din_intp_in_tpl(Summer_vunroll_cunroll_x_out_1_3_real_alt_data1_tpl),
        .in_3_vin_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_2_qv_tpl),
        .in_4_cin_intp_in_tpl(Summer_vunroll_cunroll_x_out_3_alt_c1_tpl),
        .in_5_cin_intp_out_tpl(Poly_phase_Interp_vunroll_cunroll_x_out_3_qc_tpl),
        .in_6_vin_intp_in_tpl(Summer_vunroll_cunroll_x_out_2_alt_v1_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl),
        .out_1_0_imag_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_0_imag_dout_tpl),
        .out_1_0_real_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_0_real_dout_tpl),
        .out_1_1_imag_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_1_imag_dout_tpl),
        .out_1_1_real_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_1_real_dout_tpl),
        .out_1_2_imag_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_2_imag_dout_tpl),
        .out_1_2_real_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_2_real_dout_tpl),
        .out_1_3_imag_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_3_imag_dout_tpl),
        .out_1_3_real_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_3_real_dout_tpl),
        .out_1_4_imag_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_4_imag_dout_tpl),
        .out_1_4_real_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_4_real_dout_tpl),
        .out_1_5_imag_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_5_imag_dout_tpl),
        .out_1_5_real_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_5_real_dout_tpl),
        .out_1_6_imag_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_6_imag_dout_tpl),
        .out_1_6_real_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_6_real_dout_tpl),
        .out_1_7_imag_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_7_imag_dout_tpl),
        .out_1_7_real_dout_tpl(Subsystem_vunroll_cunroll_x_out_1_7_real_dout_tpl),
        .out_2_vout_tpl(Subsystem_vunroll_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(Subsystem_vunroll_cunroll_x_out_3_cout_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_1_cout_tpl(GPOUT,38)
    assign out_1_cout_tpl = Subsystem_vunroll_cunroll_x_out_3_cout_tpl;

    // out_2_vout_tpl(GPOUT,39)
    assign out_2_vout_tpl = Subsystem_vunroll_cunroll_x_out_2_vout_tpl;

    // out_3_0_imag_dout_tpl(GPOUT,40)
    assign out_3_0_imag_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_0_imag_dout_tpl;

    // out_3_0_real_dout_tpl(GPOUT,41)
    assign out_3_0_real_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_0_real_dout_tpl;

    // out_3_1_imag_dout_tpl(GPOUT,42)
    assign out_3_1_imag_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_1_imag_dout_tpl;

    // out_3_1_real_dout_tpl(GPOUT,43)
    assign out_3_1_real_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_1_real_dout_tpl;

    // out_3_2_imag_dout_tpl(GPOUT,44)
    assign out_3_2_imag_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_2_imag_dout_tpl;

    // out_3_2_real_dout_tpl(GPOUT,45)
    assign out_3_2_real_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_2_real_dout_tpl;

    // out_3_3_imag_dout_tpl(GPOUT,46)
    assign out_3_3_imag_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_3_imag_dout_tpl;

    // out_3_3_real_dout_tpl(GPOUT,47)
    assign out_3_3_real_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_3_real_dout_tpl;

    // out_3_4_imag_dout_tpl(GPOUT,48)
    assign out_3_4_imag_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_4_imag_dout_tpl;

    // out_3_4_real_dout_tpl(GPOUT,49)
    assign out_3_4_real_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_4_real_dout_tpl;

    // out_3_5_imag_dout_tpl(GPOUT,50)
    assign out_3_5_imag_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_5_imag_dout_tpl;

    // out_3_5_real_dout_tpl(GPOUT,51)
    assign out_3_5_real_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_5_real_dout_tpl;

    // out_3_6_imag_dout_tpl(GPOUT,52)
    assign out_3_6_imag_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_6_imag_dout_tpl;

    // out_3_6_real_dout_tpl(GPOUT,53)
    assign out_3_6_real_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_6_real_dout_tpl;

    // out_3_7_imag_dout_tpl(GPOUT,54)
    assign out_3_7_imag_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_7_imag_dout_tpl;

    // out_3_7_real_dout_tpl(GPOUT,55)
    assign out_3_7_real_dout_tpl = Subsystem_vunroll_cunroll_x_out_1_7_real_dout_tpl;

    // out_4_0_imag_summer_dout_tpl(GPOUT,56)
    assign out_4_0_imag_summer_dout_tpl = Summer_vunroll_cunroll_x_out_1_0_imag_alt_data1_tpl;

    // out_4_0_real_summer_dout_tpl(GPOUT,57)
    assign out_4_0_real_summer_dout_tpl = Summer_vunroll_cunroll_x_out_1_0_real_alt_data1_tpl;

    // out_4_1_imag_summer_dout_tpl(GPOUT,58)
    assign out_4_1_imag_summer_dout_tpl = Summer_vunroll_cunroll_x_out_1_1_imag_alt_data1_tpl;

    // out_4_1_real_summer_dout_tpl(GPOUT,59)
    assign out_4_1_real_summer_dout_tpl = Summer_vunroll_cunroll_x_out_1_1_real_alt_data1_tpl;

    // out_4_2_imag_summer_dout_tpl(GPOUT,60)
    assign out_4_2_imag_summer_dout_tpl = Summer_vunroll_cunroll_x_out_1_2_imag_alt_data1_tpl;

    // out_4_2_real_summer_dout_tpl(GPOUT,61)
    assign out_4_2_real_summer_dout_tpl = Summer_vunroll_cunroll_x_out_1_2_real_alt_data1_tpl;

    // out_4_3_imag_summer_dout_tpl(GPOUT,62)
    assign out_4_3_imag_summer_dout_tpl = Summer_vunroll_cunroll_x_out_1_3_imag_alt_data1_tpl;

    // out_4_3_real_summer_dout_tpl(GPOUT,63)
    assign out_4_3_real_summer_dout_tpl = Summer_vunroll_cunroll_x_out_1_3_real_alt_data1_tpl;

    // out_5_summer_vout_tpl(GPOUT,64)
    assign out_5_summer_vout_tpl = Summer_vunroll_cunroll_x_out_2_alt_v1_tpl;

    // out_6_summer_cout_tpl(GPOUT,65)
    assign out_6_summer_cout_tpl = Summer_vunroll_cunroll_x_out_3_alt_c1_tpl;

endmodule
