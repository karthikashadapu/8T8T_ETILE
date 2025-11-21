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

// SystemVerilog created from ca_interp_DUT
// SystemVerilog created on Tue Jan  7 17:04:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ca_interp_DUT (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [0:0] DUC_Valid_l1_s,
    input wire [7:0] DUC_Chan_l1_s,
    input wire [15:0] DUC_Data_l1_0im,
    input wire [15:0] DUC_Data_l1_0re,
    input wire [15:0] DUC_Data_l1_1im,
    input wire [15:0] DUC_Data_l1_1re,
    input wire [15:0] DUC_Data_l1_2im,
    input wire [15:0] DUC_Data_l1_2re,
    input wire [15:0] DUC_Data_l1_3im,
    input wire [15:0] DUC_Data_l1_3re,
    input wire [0:0] DUC_Valid_l2_s,
    input wire [7:0] DUC_Chan_l2_s,
    input wire [15:0] DUC_Data_l2_0im,
    input wire [15:0] DUC_Data_l2_0re,
    input wire [15:0] DUC_Data_l2_1im,
    input wire [15:0] DUC_Data_l2_1re,
    input wire [15:0] DUC_Data_l2_2im,
    input wire [15:0] DUC_Data_l2_2re,
    input wire [15:0] DUC_Data_l2_3im,
    input wire [15:0] DUC_Data_l2_3re,
    output wire [0:0] DUC_Valid_Out_s,
    output wire [7:0] DUC_Chan_Out_s,
    output wire [15:0] DUC_Ant_Data_Out_0im,
    output wire [15:0] DUC_Ant_Data_Out_0re,
    output wire [15:0] DUC_Ant_Data_Out_1im,
    output wire [15:0] DUC_Ant_Data_Out_1re,
    output wire [15:0] DUC_Ant_Data_Out_2im,
    output wire [15:0] DUC_Ant_Data_Out_2re,
    output wire [15:0] DUC_Ant_Data_Out_3im,
    output wire [15:0] DUC_Ant_Data_Out_3re,
    output wire [15:0] DUC_Ant_Data_Out_4im,
    output wire [15:0] DUC_Ant_Data_Out_4re,
    output wire [15:0] DUC_Ant_Data_Out_5im,
    output wire [15:0] DUC_Ant_Data_Out_5re,
    output wire [15:0] DUC_Ant_Data_Out_6im,
    output wire [15:0] DUC_Ant_Data_Out_6re,
    output wire [15:0] DUC_Ant_Data_Out_7im,
    output wire [15:0] DUC_Ant_Data_Out_7re,
    output wire [0:0] summer_vout_s,
    output wire [7:0] summer_cout_s,
    output wire [15:0] summer_dout_0im,
    output wire [15:0] summer_dout_0re,
    output wire [15:0] summer_dout_1im,
    output wire [15:0] summer_dout_1re,
    output wire [15:0] summer_dout_2im,
    output wire [15:0] summer_dout_2re,
    output wire [15:0] summer_dout_3im,
    output wire [15:0] summer_dout_3re,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [31:0] busFabric_busOut_readdata;
    wire [0:0] busFabric_busOut_readdatavalid;
    wire [15:0] busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl;
    wire [15:0] busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl;
    wire [15:0] busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl;
    wire [15:0] busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl;
    wire [15:0] busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl;
    wire [7:0] Summer_DUC_vunroll_cunroll_x_out_1_cout_tpl;
    wire [0:0] Summer_DUC_vunroll_cunroll_x_out_2_vout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_0_imag_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_0_real_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_1_imag_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_1_real_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_2_imag_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_2_real_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_3_imag_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_3_real_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_4_imag_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_4_real_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_5_imag_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_5_real_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_6_imag_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_6_real_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_7_imag_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_3_7_real_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_4_0_imag_summer_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_4_0_real_summer_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_4_1_imag_summer_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_4_1_real_summer_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_4_2_imag_summer_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_4_2_real_summer_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_4_3_imag_summer_dout_tpl;
    wire [15:0] Summer_DUC_vunroll_cunroll_x_out_4_3_real_summer_dout_tpl;
    wire [0:0] Summer_DUC_vunroll_cunroll_x_out_5_summer_vout_tpl;
    wire [7:0] Summer_DUC_vunroll_cunroll_x_out_6_summer_cout_tpl;
    reg [0:0] ca_interp_DUT_readDelayed_q;
    wire [0:0] ca_interp_DUT_readDataValid_q;
    reg [1:0] reset_fanout_mitigation_signal_out;

    import ca_interp_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // busFabric(BLACKBOX,2)
    busFabric_ca_interp_DUT_2ouiflr06j62696x6u0qu5xajz thebusFabric (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .busOut_readdata(busFabric_busOut_readdata),
        .busOut_readdatavalid(busFabric_busOut_readdatavalid),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl),
        .clk(clk),
        .areset(reset_fanout_mitigation_signal_out[0]),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // ca_interp_DUT_readDelayed(DELAY,61)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            ca_interp_DUT_readDelayed_q <= '0;
        end
        else
        begin
            ca_interp_DUT_readDelayed_q <= $unsigned(busIn_read);
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // ca_interp_DUT_readDataValid(LOGICAL,62)
    assign ca_interp_DUT_readDataValid_q = busFabric_busOut_readdatavalid | ca_interp_DUT_readDelayed_q;

    // busOut(BUSOUT,4)
    assign busOut_readdatavalid = ca_interp_DUT_readDataValid_q;
    assign busOut_readdata = busFabric_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // Summer_DUC_vunroll_cunroll_x(BLACKBOX,8)
    ca_interp_DUT_Summer_DUC theSummer_DUC_vunroll_cunroll_x (
        .in_1_v_1_tpl(DUC_Valid_l1_s),
        .in_2_c_1_tpl(DUC_Chan_l1_s),
        .in_3_0_imag_d_1_tpl(DUC_Data_l1_0im),
        .in_3_0_real_d_1_tpl(DUC_Data_l1_0re),
        .in_3_1_imag_d_1_tpl(DUC_Data_l1_1im),
        .in_3_1_real_d_1_tpl(DUC_Data_l1_1re),
        .in_3_2_imag_d_1_tpl(DUC_Data_l1_2im),
        .in_3_2_real_d_1_tpl(DUC_Data_l1_2re),
        .in_3_3_imag_d_1_tpl(DUC_Data_l1_3im),
        .in_3_3_real_d_1_tpl(DUC_Data_l1_3re),
        .in_4_v_2_tpl(DUC_Valid_l2_s),
        .in_5_c_2_tpl(DUC_Chan_l2_s),
        .in_6_0_imag_d_2_tpl(DUC_Data_l2_0im),
        .in_6_0_real_d_2_tpl(DUC_Data_l2_0re),
        .in_6_1_imag_d_2_tpl(DUC_Data_l2_1im),
        .in_6_1_real_d_2_tpl(DUC_Data_l2_1re),
        .in_6_2_imag_d_2_tpl(DUC_Data_l2_2im),
        .in_6_2_real_d_2_tpl(DUC_Data_l2_2re),
        .in_6_3_imag_d_2_tpl(DUC_Data_l2_3im),
        .in_6_3_real_d_2_tpl(DUC_Data_l2_3re),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl(busFabric_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl),
        .out_1_cout_tpl(Summer_DUC_vunroll_cunroll_x_out_1_cout_tpl),
        .out_2_vout_tpl(Summer_DUC_vunroll_cunroll_x_out_2_vout_tpl),
        .out_3_0_imag_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_0_imag_dout_tpl),
        .out_3_0_real_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_0_real_dout_tpl),
        .out_3_1_imag_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_1_imag_dout_tpl),
        .out_3_1_real_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_1_real_dout_tpl),
        .out_3_2_imag_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_2_imag_dout_tpl),
        .out_3_2_real_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_2_real_dout_tpl),
        .out_3_3_imag_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_3_imag_dout_tpl),
        .out_3_3_real_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_3_real_dout_tpl),
        .out_3_4_imag_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_4_imag_dout_tpl),
        .out_3_4_real_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_4_real_dout_tpl),
        .out_3_5_imag_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_5_imag_dout_tpl),
        .out_3_5_real_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_5_real_dout_tpl),
        .out_3_6_imag_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_6_imag_dout_tpl),
        .out_3_6_real_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_6_real_dout_tpl),
        .out_3_7_imag_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_7_imag_dout_tpl),
        .out_3_7_real_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_3_7_real_dout_tpl),
        .out_4_0_imag_summer_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_4_0_imag_summer_dout_tpl),
        .out_4_0_real_summer_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_4_0_real_summer_dout_tpl),
        .out_4_1_imag_summer_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_4_1_imag_summer_dout_tpl),
        .out_4_1_real_summer_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_4_1_real_summer_dout_tpl),
        .out_4_2_imag_summer_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_4_2_imag_summer_dout_tpl),
        .out_4_2_real_summer_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_4_2_real_summer_dout_tpl),
        .out_4_3_imag_summer_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_4_3_imag_summer_dout_tpl),
        .out_4_3_real_summer_dout_tpl(Summer_DUC_vunroll_cunroll_x_out_4_3_real_summer_dout_tpl),
        .out_5_summer_vout_tpl(Summer_DUC_vunroll_cunroll_x_out_5_summer_vout_tpl),
        .out_6_summer_cout_tpl(Summer_DUC_vunroll_cunroll_x_out_6_summer_cout_tpl),
        .clk(clk),
        .areset(reset_fanout_mitigation_signal_out[0])
    );

    // DUC_Valid_Out_s(GPOUT,29)
    assign DUC_Valid_Out_s = Summer_DUC_vunroll_cunroll_x_out_2_vout_tpl;

    // DUC_Chan_Out_s(GPOUT,30)
    assign DUC_Chan_Out_s = Summer_DUC_vunroll_cunroll_x_out_1_cout_tpl;

    // DUC_Ant_Data_Out_0im(GPOUT,31)
    assign DUC_Ant_Data_Out_0im = Summer_DUC_vunroll_cunroll_x_out_3_0_imag_dout_tpl;

    // DUC_Ant_Data_Out_0re(GPOUT,32)
    assign DUC_Ant_Data_Out_0re = Summer_DUC_vunroll_cunroll_x_out_3_0_real_dout_tpl;

    // DUC_Ant_Data_Out_1im(GPOUT,33)
    assign DUC_Ant_Data_Out_1im = Summer_DUC_vunroll_cunroll_x_out_3_1_imag_dout_tpl;

    // DUC_Ant_Data_Out_1re(GPOUT,34)
    assign DUC_Ant_Data_Out_1re = Summer_DUC_vunroll_cunroll_x_out_3_1_real_dout_tpl;

    // DUC_Ant_Data_Out_2im(GPOUT,35)
    assign DUC_Ant_Data_Out_2im = Summer_DUC_vunroll_cunroll_x_out_3_2_imag_dout_tpl;

    // DUC_Ant_Data_Out_2re(GPOUT,36)
    assign DUC_Ant_Data_Out_2re = Summer_DUC_vunroll_cunroll_x_out_3_2_real_dout_tpl;

    // DUC_Ant_Data_Out_3im(GPOUT,37)
    assign DUC_Ant_Data_Out_3im = Summer_DUC_vunroll_cunroll_x_out_3_3_imag_dout_tpl;

    // DUC_Ant_Data_Out_3re(GPOUT,38)
    assign DUC_Ant_Data_Out_3re = Summer_DUC_vunroll_cunroll_x_out_3_3_real_dout_tpl;

    // DUC_Ant_Data_Out_4im(GPOUT,39)
    assign DUC_Ant_Data_Out_4im = Summer_DUC_vunroll_cunroll_x_out_3_4_imag_dout_tpl;

    // DUC_Ant_Data_Out_4re(GPOUT,40)
    assign DUC_Ant_Data_Out_4re = Summer_DUC_vunroll_cunroll_x_out_3_4_real_dout_tpl;

    // DUC_Ant_Data_Out_5im(GPOUT,41)
    assign DUC_Ant_Data_Out_5im = Summer_DUC_vunroll_cunroll_x_out_3_5_imag_dout_tpl;

    // DUC_Ant_Data_Out_5re(GPOUT,42)
    assign DUC_Ant_Data_Out_5re = Summer_DUC_vunroll_cunroll_x_out_3_5_real_dout_tpl;

    // DUC_Ant_Data_Out_6im(GPOUT,43)
    assign DUC_Ant_Data_Out_6im = Summer_DUC_vunroll_cunroll_x_out_3_6_imag_dout_tpl;

    // DUC_Ant_Data_Out_6re(GPOUT,44)
    assign DUC_Ant_Data_Out_6re = Summer_DUC_vunroll_cunroll_x_out_3_6_real_dout_tpl;

    // DUC_Ant_Data_Out_7im(GPOUT,45)
    assign DUC_Ant_Data_Out_7im = Summer_DUC_vunroll_cunroll_x_out_3_7_imag_dout_tpl;

    // DUC_Ant_Data_Out_7re(GPOUT,46)
    assign DUC_Ant_Data_Out_7re = Summer_DUC_vunroll_cunroll_x_out_3_7_real_dout_tpl;

    // summer_vout_s(GPOUT,47)
    assign summer_vout_s = Summer_DUC_vunroll_cunroll_x_out_5_summer_vout_tpl;

    // summer_cout_s(GPOUT,48)
    assign summer_cout_s = Summer_DUC_vunroll_cunroll_x_out_6_summer_cout_tpl;

    // summer_dout_0im(GPOUT,49)
    assign summer_dout_0im = Summer_DUC_vunroll_cunroll_x_out_4_0_imag_summer_dout_tpl;

    // summer_dout_0re(GPOUT,50)
    assign summer_dout_0re = Summer_DUC_vunroll_cunroll_x_out_4_0_real_summer_dout_tpl;

    // summer_dout_1im(GPOUT,51)
    assign summer_dout_1im = Summer_DUC_vunroll_cunroll_x_out_4_1_imag_summer_dout_tpl;

    // summer_dout_1re(GPOUT,52)
    assign summer_dout_1re = Summer_DUC_vunroll_cunroll_x_out_4_1_real_summer_dout_tpl;

    // summer_dout_2im(GPOUT,53)
    assign summer_dout_2im = Summer_DUC_vunroll_cunroll_x_out_4_2_imag_summer_dout_tpl;

    // summer_dout_2re(GPOUT,54)
    assign summer_dout_2re = Summer_DUC_vunroll_cunroll_x_out_4_2_real_summer_dout_tpl;

    // summer_dout_3im(GPOUT,55)
    assign summer_dout_3im = Summer_DUC_vunroll_cunroll_x_out_4_3_imag_summer_dout_tpl;

    // summer_dout_3re(GPOUT,56)
    assign summer_dout_3re = Summer_DUC_vunroll_cunroll_x_out_4_3_real_summer_dout_tpl;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            reset_fanout_mitigation_signal_out[1] <= areset;
            reset_fanout_mitigation_signal_out[0:0] <= reset_fanout_mitigation_signal_out[1:1];
        end
    end

endmodule
