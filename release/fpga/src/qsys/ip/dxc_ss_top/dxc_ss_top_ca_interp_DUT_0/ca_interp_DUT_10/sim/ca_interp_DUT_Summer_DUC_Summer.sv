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

// SystemVerilog created from ca_interp_DUT_Summer_DUC_Summer
// SystemVerilog created on Tue Jan  7 17:04:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ca_interp_DUT_Summer_DUC_Summer (
    input wire [15:0] in_1_0_imag_d1_tpl,
    input wire [15:0] in_1_0_real_d1_tpl,
    input wire [15:0] in_1_1_imag_d1_tpl,
    input wire [15:0] in_1_1_real_d1_tpl,
    input wire [15:0] in_1_2_imag_d1_tpl,
    input wire [15:0] in_1_2_real_d1_tpl,
    input wire [15:0] in_1_3_imag_d1_tpl,
    input wire [15:0] in_1_3_real_d1_tpl,
    input wire [0:0] in_2_v1_tpl,
    input wire [7:0] in_3_c1_tpl,
    input wire [15:0] in_4_0_imag_d2_tpl,
    input wire [15:0] in_4_0_real_d2_tpl,
    input wire [15:0] in_4_1_imag_d2_tpl,
    input wire [15:0] in_4_1_real_d2_tpl,
    input wire [15:0] in_4_2_imag_d2_tpl,
    input wire [15:0] in_4_2_real_d2_tpl,
    input wire [15:0] in_4_3_imag_d2_tpl,
    input wire [15:0] in_4_3_real_d2_tpl,
    input wire [0:0] in_5_v2_tpl,
    input wire [7:0] in_6_c2_tpl,
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
    output wire [15:0] out_1_0_imag_alt_data1_tpl,
    output wire [15:0] out_1_0_real_alt_data1_tpl,
    output wire [15:0] out_1_1_imag_alt_data1_tpl,
    output wire [15:0] out_1_1_real_alt_data1_tpl,
    output wire [15:0] out_1_2_imag_alt_data1_tpl,
    output wire [15:0] out_1_2_real_alt_data1_tpl,
    output wire [15:0] out_1_3_imag_alt_data1_tpl,
    output wire [15:0] out_1_3_real_alt_data1_tpl,
    output wire [0:0] out_2_alt_v1_tpl,
    output wire [7:0] out_3_alt_c1_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [15:0] scale_Antenna_Summer2_qOut_0;
    wire [15:0] scale_Antenna_Summer2_qOut_1;
    wire [15:0] scale_Antenna_Summer2_qOut_2;
    wire [15:0] scale_Antenna_Summer2_qOut_3;
    wire [0:0] scale_Antenna_Summer2_qOut_v;
    wire [7:0] scale_Antenna_Summer2_qOut_c;
    wire [15:0] scale_Antenna_Summer3_qOut_0;
    wire [15:0] scale_Antenna_Summer3_qOut_1;
    wire [15:0] scale_Antenna_Summer3_qOut_2;
    wire [15:0] scale_Antenna_Summer3_qOut_3;
    wire [32:0] Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_0_imag_altq_tpl;
    wire [32:0] Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_0_real_altq_tpl;
    wire [32:0] Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_1_imag_altq_tpl;
    wire [32:0] Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_1_real_altq_tpl;
    wire [32:0] Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_2_imag_altq_tpl;
    wire [32:0] Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_2_real_altq_tpl;
    wire [32:0] Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_3_imag_altq_tpl;
    wire [32:0] Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_3_real_altq_tpl;
    wire [0:0] Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_2_altv_tpl;
    wire [7:0] Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_3_altc_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_1_0_imag_altq1_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_1_0_real_altq1_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_1_1_imag_altq1_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_1_1_real_altq1_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_1_2_imag_altq1_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_1_2_real_altq1_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_1_3_imag_altq1_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_1_3_real_altq1_tpl;
    wire [0:0] Delay_Compensation_vunroll_cunroll_x_out_2_altv_tpl;
    wire [7:0] Delay_Compensation_vunroll_cunroll_x_out_3_altc_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_4_0_imag_altq2_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_4_0_real_altq2_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_4_1_imag_altq2_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_4_1_real_altq2_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_4_2_imag_altq2_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_4_2_real_altq2_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_4_3_imag_altq2_tpl;
    wire [15:0] Delay_Compensation_vunroll_cunroll_x_out_4_3_real_altq2_tpl;

    import ca_interp_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // Delay_Compensation_vunroll_cunroll_x(BLACKBOX,7)
    ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation theDelay_Compensation_vunroll_cunroll_x (
        .in_1_0_imag_din_a1_tpl(in_1_0_imag_d1_tpl),
        .in_1_0_real_din_a1_tpl(in_1_0_real_d1_tpl),
        .in_1_1_imag_din_a1_tpl(in_1_1_imag_d1_tpl),
        .in_1_1_real_din_a1_tpl(in_1_1_real_d1_tpl),
        .in_1_2_imag_din_a1_tpl(in_1_2_imag_d1_tpl),
        .in_1_2_real_din_a1_tpl(in_1_2_real_d1_tpl),
        .in_1_3_imag_din_a1_tpl(in_1_3_imag_d1_tpl),
        .in_1_3_real_din_a1_tpl(in_1_3_real_d1_tpl),
        .in_2_vin_a1_tpl(in_2_v1_tpl),
        .in_3_cin_a1_tpl(in_3_c1_tpl),
        .in_4_0_imag_din_a2_tpl(in_4_0_imag_d2_tpl),
        .in_4_0_real_din_a2_tpl(in_4_0_real_d2_tpl),
        .in_4_1_imag_din_a2_tpl(in_4_1_imag_d2_tpl),
        .in_4_1_real_din_a2_tpl(in_4_1_real_d2_tpl),
        .in_4_2_imag_din_a2_tpl(in_4_2_imag_d2_tpl),
        .in_4_2_real_din_a2_tpl(in_4_2_real_d2_tpl),
        .in_4_3_imag_din_a2_tpl(in_4_3_imag_d2_tpl),
        .in_4_3_real_din_a2_tpl(in_4_3_real_d2_tpl),
        .in_5_vin_a2_tpl(in_5_v2_tpl),
        .in_6_cin_a2_tpl(in_6_c2_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl),
        .out_1_0_imag_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_0_imag_altq1_tpl),
        .out_1_0_real_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_0_real_altq1_tpl),
        .out_1_1_imag_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_1_imag_altq1_tpl),
        .out_1_1_real_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_1_real_altq1_tpl),
        .out_1_2_imag_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_2_imag_altq1_tpl),
        .out_1_2_real_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_2_real_altq1_tpl),
        .out_1_3_imag_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_3_imag_altq1_tpl),
        .out_1_3_real_altq1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_3_real_altq1_tpl),
        .out_2_altv_tpl(Delay_Compensation_vunroll_cunroll_x_out_2_altv_tpl),
        .out_3_altc_tpl(Delay_Compensation_vunroll_cunroll_x_out_3_altc_tpl),
        .out_4_0_imag_altq2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_0_imag_altq2_tpl),
        .out_4_0_real_altq2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_0_real_altq2_tpl),
        .out_4_1_imag_altq2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_1_imag_altq2_tpl),
        .out_4_1_real_altq2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_1_real_altq2_tpl),
        .out_4_2_imag_altq2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_2_imag_altq2_tpl),
        .out_4_2_real_altq2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_2_real_altq2_tpl),
        .out_4_3_imag_altq2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_3_imag_altq2_tpl),
        .out_4_3_real_altq2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_3_real_altq2_tpl),
        .clk(clk),
        .areset(areset)
    );

    // Carrier_Aggregation_and_Gain_vunroll_cunroll_x(BLACKBOX,6)
    ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain theCarrier_Aggregation_and_Gain_vunroll_cunroll_x (
        .in_1_0_imag_din_a1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_0_imag_altq1_tpl),
        .in_1_0_real_din_a1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_0_real_altq1_tpl),
        .in_1_1_imag_din_a1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_1_imag_altq1_tpl),
        .in_1_1_real_din_a1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_1_real_altq1_tpl),
        .in_1_2_imag_din_a1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_2_imag_altq1_tpl),
        .in_1_2_real_din_a1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_2_real_altq1_tpl),
        .in_1_3_imag_din_a1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_3_imag_altq1_tpl),
        .in_1_3_real_din_a1_tpl(Delay_Compensation_vunroll_cunroll_x_out_1_3_real_altq1_tpl),
        .in_2_vin_a1_tpl(Delay_Compensation_vunroll_cunroll_x_out_2_altv_tpl),
        .in_3_cin_a1_tpl(Delay_Compensation_vunroll_cunroll_x_out_3_altc_tpl),
        .in_4_0_imag_din_a2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_0_imag_altq2_tpl),
        .in_4_0_real_din_a2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_0_real_altq2_tpl),
        .in_4_1_imag_din_a2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_1_imag_altq2_tpl),
        .in_4_1_real_din_a2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_1_real_altq2_tpl),
        .in_4_2_imag_din_a2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_2_imag_altq2_tpl),
        .in_4_2_real_din_a2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_2_real_altq2_tpl),
        .in_4_3_imag_din_a2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_3_imag_altq2_tpl),
        .in_4_3_real_din_a2_tpl(Delay_Compensation_vunroll_cunroll_x_out_4_3_real_altq2_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl(in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl),
        .out_1_0_imag_altq_tpl(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_0_imag_altq_tpl),
        .out_1_0_real_altq_tpl(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_0_real_altq_tpl),
        .out_1_1_imag_altq_tpl(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_1_imag_altq_tpl),
        .out_1_1_real_altq_tpl(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_1_real_altq_tpl),
        .out_1_2_imag_altq_tpl(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_2_imag_altq_tpl),
        .out_1_2_real_altq_tpl(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_2_real_altq_tpl),
        .out_1_3_imag_altq_tpl(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_3_imag_altq_tpl),
        .out_1_3_real_altq_tpl(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_3_real_altq_tpl),
        .out_2_altv_tpl(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_2_altv_tpl),
        .out_3_altc_tpl(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_3_altc_tpl),
        .clk(clk),
        .areset(areset)
    );

    // scale_Antenna_Summer3(BLACKBOX,5)
    ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer3 thescale_Antenna_Summer3 (
        .xIn_0(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_0_imag_altq_tpl),
        .xIn_1(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_1_imag_altq_tpl),
        .xIn_2(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_2_imag_altq_tpl),
        .xIn_3(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_3_imag_altq_tpl),
        .xIn_v(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_2_altv_tpl),
        .xIn_c(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_3_altc_tpl),
        .gain_i(GND_q),
        .qOut_0(scale_Antenna_Summer3_qOut_0),
        .qOut_1(scale_Antenna_Summer3_qOut_1),
        .qOut_2(scale_Antenna_Summer3_qOut_2),
        .qOut_3(scale_Antenna_Summer3_qOut_3),
        .qOut_v(),
        .qOut_c(),
        .eOut_0(),
        .eOut_1(),
        .eOut_2(),
        .eOut_3(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_0_imag_alt_data1_tpl(GPOUT,40)
    assign out_1_0_imag_alt_data1_tpl = scale_Antenna_Summer3_qOut_0;

    // scale_Antenna_Summer2(BLACKBOX,4)
    ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer2 thescale_Antenna_Summer2 (
        .xIn_0(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_0_real_altq_tpl),
        .xIn_1(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_1_real_altq_tpl),
        .xIn_2(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_2_real_altq_tpl),
        .xIn_3(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_1_3_real_altq_tpl),
        .xIn_v(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_2_altv_tpl),
        .xIn_c(Carrier_Aggregation_and_Gain_vunroll_cunroll_x_out_3_altc_tpl),
        .gain_i(GND_q),
        .qOut_0(scale_Antenna_Summer2_qOut_0),
        .qOut_1(scale_Antenna_Summer2_qOut_1),
        .qOut_2(scale_Antenna_Summer2_qOut_2),
        .qOut_3(scale_Antenna_Summer2_qOut_3),
        .qOut_v(scale_Antenna_Summer2_qOut_v),
        .qOut_c(scale_Antenna_Summer2_qOut_c),
        .eOut_0(),
        .eOut_1(),
        .eOut_2(),
        .eOut_3(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_0_real_alt_data1_tpl(GPOUT,41)
    assign out_1_0_real_alt_data1_tpl = scale_Antenna_Summer2_qOut_0;

    // out_1_1_imag_alt_data1_tpl(GPOUT,42)
    assign out_1_1_imag_alt_data1_tpl = scale_Antenna_Summer3_qOut_1;

    // out_1_1_real_alt_data1_tpl(GPOUT,43)
    assign out_1_1_real_alt_data1_tpl = scale_Antenna_Summer2_qOut_1;

    // out_1_2_imag_alt_data1_tpl(GPOUT,44)
    assign out_1_2_imag_alt_data1_tpl = scale_Antenna_Summer3_qOut_2;

    // out_1_2_real_alt_data1_tpl(GPOUT,45)
    assign out_1_2_real_alt_data1_tpl = scale_Antenna_Summer2_qOut_2;

    // out_1_3_imag_alt_data1_tpl(GPOUT,46)
    assign out_1_3_imag_alt_data1_tpl = scale_Antenna_Summer3_qOut_3;

    // out_1_3_real_alt_data1_tpl(GPOUT,47)
    assign out_1_3_real_alt_data1_tpl = scale_Antenna_Summer2_qOut_3;

    // out_2_alt_v1_tpl(GPOUT,48)
    assign out_2_alt_v1_tpl = scale_Antenna_Summer2_qOut_v;

    // out_3_alt_c1_tpl(GPOUT,49)
    assign out_3_alt_c1_tpl = scale_Antenna_Summer2_qOut_c;

endmodule
