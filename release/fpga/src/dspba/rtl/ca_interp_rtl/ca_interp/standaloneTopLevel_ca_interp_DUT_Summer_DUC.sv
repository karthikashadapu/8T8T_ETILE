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

// SystemVerilog created from standaloneTopLevel_ca_interp_DUT_Summer_DUC
// SystemVerilog created on Tue Jan  7 17:04:25 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module standaloneTopLevel_ca_interp_DUT_Summer_DUC (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [0:0] v_1_s,
    input wire [7:0] c_1_s,
    input wire [15:0] d_1_0im,
    input wire [15:0] d_1_0re,
    input wire [15:0] d_1_1im,
    input wire [15:0] d_1_1re,
    input wire [15:0] d_1_2im,
    input wire [15:0] d_1_2re,
    input wire [15:0] d_1_3im,
    input wire [15:0] d_1_3re,
    input wire [0:0] v_2_s,
    input wire [7:0] c_2_s,
    input wire [15:0] d_2_0im,
    input wire [15:0] d_2_0re,
    input wire [15:0] d_2_1im,
    input wire [15:0] d_2_1re,
    input wire [15:0] d_2_2im,
    input wire [15:0] d_2_2re,
    input wire [15:0] d_2_3im,
    input wire [15:0] d_2_3re,
    output wire [7:0] cout_s,
    output wire [0:0] vout_s,
    output wire [15:0] dout_0im,
    output wire [15:0] dout_0re,
    output wire [15:0] dout_1im,
    output wire [15:0] dout_1re,
    output wire [15:0] dout_2im,
    output wire [15:0] dout_2re,
    output wire [15:0] dout_3im,
    output wire [15:0] dout_3re,
    output wire [15:0] dout_4im,
    output wire [15:0] dout_4re,
    output wire [15:0] dout_5im,
    output wire [15:0] dout_5re,
    output wire [15:0] dout_6im,
    output wire [15:0] dout_6re,
    output wire [15:0] dout_7im,
    output wire [15:0] dout_7re,
    output wire [15:0] summer_dout_0im,
    output wire [15:0] summer_dout_0re,
    output wire [15:0] summer_dout_1im,
    output wire [15:0] summer_dout_1re,
    output wire [15:0] summer_dout_2im,
    output wire [15:0] summer_dout_2re,
    output wire [15:0] summer_dout_3im,
    output wire [15:0] summer_dout_3re,
    output wire [0:0] summer_vout_s,
    output wire [7:0] summer_cout_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [7:0] ca_interp_DUT_Summer_DUC_out_1_cout_tpl;
    wire [0:0] ca_interp_DUT_Summer_DUC_out_2_vout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_0_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_0_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_1_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_1_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_2_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_2_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_3_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_3_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_4_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_4_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_5_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_5_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_6_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_6_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_7_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_3_7_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_4_0_imag_summer_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_4_0_real_summer_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_4_1_imag_summer_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_4_1_real_summer_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_4_2_imag_summer_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_4_2_real_summer_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_4_3_imag_summer_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_out_4_3_real_summer_dout_tpl;
    wire [0:0] ca_interp_DUT_Summer_DUC_out_5_summer_vout_tpl;
    wire [7:0] ca_interp_DUT_Summer_DUC_out_6_summer_cout_tpl;
    wire [31:0] busFabric_ca_interp_DUT_x_busOut_readdata;
    wire [0:0] busFabric_ca_interp_DUT_x_busOut_readdatavalid;
    wire [15:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl;
    wire [15:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl;
    wire [15:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl;
    wire [15:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl;
    wire [15:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl;
    wire [7:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl;
    wire [7:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl;
    wire [7:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl;
    wire [7:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl;
    wire [7:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl;
    wire [7:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl;
    wire [7:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl;
    wire [7:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl;
    reg [0:0] standaloneTopLevel_ca_interp_DUT_Summer_DUC_readDelayed_q;
    wire [0:0] standaloneTopLevel_ca_interp_DUT_Summer_DUC_readDataValid_q;
    reg [1:0] reset_fanout_mitigation_signal_out;

    import ca_interp_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // busFabric_ca_interp_DUT_x(BLACKBOX,5)
    busFabric_ca_interp_DUT_2ouiflr06j62696x6u0qu5xajz thebusFabric_ca_interp_DUT_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .busOut_readdata(busFabric_ca_interp_DUT_x_busOut_readdata),
        .busOut_readdatavalid(busFabric_ca_interp_DUT_x_busOut_readdatavalid),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl),
        .clk(clk),
        .areset(reset_fanout_mitigation_signal_out[0]),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // standaloneTopLevel_ca_interp_DUT_Summer_DUC_readDelayed(DELAY,70)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            standaloneTopLevel_ca_interp_DUT_Summer_DUC_readDelayed_q <= '0;
        end
        else
        begin
            standaloneTopLevel_ca_interp_DUT_Summer_DUC_readDelayed_q <= $unsigned(busIn_read);
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // standaloneTopLevel_ca_interp_DUT_Summer_DUC_readDataValid(LOGICAL,71)
    assign standaloneTopLevel_ca_interp_DUT_Summer_DUC_readDataValid_q = busFabric_ca_interp_DUT_x_busOut_readdatavalid | standaloneTopLevel_ca_interp_DUT_Summer_DUC_readDelayed_q;

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = standaloneTopLevel_ca_interp_DUT_Summer_DUC_readDataValid_q;
    assign busOut_readdata = busFabric_ca_interp_DUT_x_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // ca_interp_DUT_Summer_DUC(BLACKBOX,4)
    ca_interp_DUT_Summer_DUC theca_interp_DUT_Summer_DUC (
        .in_1_v_1_tpl(v_1_s),
        .in_2_c_1_tpl(c_1_s),
        .in_3_0_imag_d_1_tpl(d_1_0im),
        .in_3_0_real_d_1_tpl(d_1_0re),
        .in_3_1_imag_d_1_tpl(d_1_1im),
        .in_3_1_real_d_1_tpl(d_1_1re),
        .in_3_2_imag_d_1_tpl(d_1_2im),
        .in_3_2_real_d_1_tpl(d_1_2re),
        .in_3_3_imag_d_1_tpl(d_1_3im),
        .in_3_3_real_d_1_tpl(d_1_3re),
        .in_4_v_2_tpl(v_2_s),
        .in_5_c_2_tpl(c_2_s),
        .in_6_0_imag_d_2_tpl(d_2_0im),
        .in_6_0_real_d_2_tpl(d_2_0re),
        .in_6_1_imag_d_2_tpl(d_2_1im),
        .in_6_1_real_d_2_tpl(d_2_1re),
        .in_6_2_imag_d_2_tpl(d_2_2im),
        .in_6_2_real_d_2_tpl(d_2_2re),
        .in_6_3_imag_d_2_tpl(d_2_3im),
        .in_6_3_real_d_2_tpl(d_2_3re),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl),
        .out_1_cout_tpl(ca_interp_DUT_Summer_DUC_out_1_cout_tpl),
        .out_2_vout_tpl(ca_interp_DUT_Summer_DUC_out_2_vout_tpl),
        .out_3_0_imag_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_0_imag_dout_tpl),
        .out_3_0_real_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_0_real_dout_tpl),
        .out_3_1_imag_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_1_imag_dout_tpl),
        .out_3_1_real_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_1_real_dout_tpl),
        .out_3_2_imag_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_2_imag_dout_tpl),
        .out_3_2_real_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_2_real_dout_tpl),
        .out_3_3_imag_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_3_imag_dout_tpl),
        .out_3_3_real_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_3_real_dout_tpl),
        .out_3_4_imag_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_4_imag_dout_tpl),
        .out_3_4_real_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_4_real_dout_tpl),
        .out_3_5_imag_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_5_imag_dout_tpl),
        .out_3_5_real_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_5_real_dout_tpl),
        .out_3_6_imag_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_6_imag_dout_tpl),
        .out_3_6_real_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_6_real_dout_tpl),
        .out_3_7_imag_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_7_imag_dout_tpl),
        .out_3_7_real_dout_tpl(ca_interp_DUT_Summer_DUC_out_3_7_real_dout_tpl),
        .out_4_0_imag_summer_dout_tpl(ca_interp_DUT_Summer_DUC_out_4_0_imag_summer_dout_tpl),
        .out_4_0_real_summer_dout_tpl(ca_interp_DUT_Summer_DUC_out_4_0_real_summer_dout_tpl),
        .out_4_1_imag_summer_dout_tpl(ca_interp_DUT_Summer_DUC_out_4_1_imag_summer_dout_tpl),
        .out_4_1_real_summer_dout_tpl(ca_interp_DUT_Summer_DUC_out_4_1_real_summer_dout_tpl),
        .out_4_2_imag_summer_dout_tpl(ca_interp_DUT_Summer_DUC_out_4_2_imag_summer_dout_tpl),
        .out_4_2_real_summer_dout_tpl(ca_interp_DUT_Summer_DUC_out_4_2_real_summer_dout_tpl),
        .out_4_3_imag_summer_dout_tpl(ca_interp_DUT_Summer_DUC_out_4_3_imag_summer_dout_tpl),
        .out_4_3_real_summer_dout_tpl(ca_interp_DUT_Summer_DUC_out_4_3_real_summer_dout_tpl),
        .out_5_summer_vout_tpl(ca_interp_DUT_Summer_DUC_out_5_summer_vout_tpl),
        .out_6_summer_cout_tpl(ca_interp_DUT_Summer_DUC_out_6_summer_cout_tpl),
        .clk(clk),
        .areset(reset_fanout_mitigation_signal_out[0])
    );

    // cout_s(GPOUT,26)
    assign cout_s = ca_interp_DUT_Summer_DUC_out_1_cout_tpl;

    // vout_s(GPOUT,27)
    assign vout_s = ca_interp_DUT_Summer_DUC_out_2_vout_tpl;

    // dout_0im(GPOUT,28)
    assign dout_0im = ca_interp_DUT_Summer_DUC_out_3_0_imag_dout_tpl;

    // dout_0re(GPOUT,29)
    assign dout_0re = ca_interp_DUT_Summer_DUC_out_3_0_real_dout_tpl;

    // dout_1im(GPOUT,30)
    assign dout_1im = ca_interp_DUT_Summer_DUC_out_3_1_imag_dout_tpl;

    // dout_1re(GPOUT,31)
    assign dout_1re = ca_interp_DUT_Summer_DUC_out_3_1_real_dout_tpl;

    // dout_2im(GPOUT,32)
    assign dout_2im = ca_interp_DUT_Summer_DUC_out_3_2_imag_dout_tpl;

    // dout_2re(GPOUT,33)
    assign dout_2re = ca_interp_DUT_Summer_DUC_out_3_2_real_dout_tpl;

    // dout_3im(GPOUT,34)
    assign dout_3im = ca_interp_DUT_Summer_DUC_out_3_3_imag_dout_tpl;

    // dout_3re(GPOUT,35)
    assign dout_3re = ca_interp_DUT_Summer_DUC_out_3_3_real_dout_tpl;

    // dout_4im(GPOUT,36)
    assign dout_4im = ca_interp_DUT_Summer_DUC_out_3_4_imag_dout_tpl;

    // dout_4re(GPOUT,37)
    assign dout_4re = ca_interp_DUT_Summer_DUC_out_3_4_real_dout_tpl;

    // dout_5im(GPOUT,38)
    assign dout_5im = ca_interp_DUT_Summer_DUC_out_3_5_imag_dout_tpl;

    // dout_5re(GPOUT,39)
    assign dout_5re = ca_interp_DUT_Summer_DUC_out_3_5_real_dout_tpl;

    // dout_6im(GPOUT,40)
    assign dout_6im = ca_interp_DUT_Summer_DUC_out_3_6_imag_dout_tpl;

    // dout_6re(GPOUT,41)
    assign dout_6re = ca_interp_DUT_Summer_DUC_out_3_6_real_dout_tpl;

    // dout_7im(GPOUT,42)
    assign dout_7im = ca_interp_DUT_Summer_DUC_out_3_7_imag_dout_tpl;

    // dout_7re(GPOUT,43)
    assign dout_7re = ca_interp_DUT_Summer_DUC_out_3_7_real_dout_tpl;

    // summer_dout_0im(GPOUT,44)
    assign summer_dout_0im = ca_interp_DUT_Summer_DUC_out_4_0_imag_summer_dout_tpl;

    // summer_dout_0re(GPOUT,45)
    assign summer_dout_0re = ca_interp_DUT_Summer_DUC_out_4_0_real_summer_dout_tpl;

    // summer_dout_1im(GPOUT,46)
    assign summer_dout_1im = ca_interp_DUT_Summer_DUC_out_4_1_imag_summer_dout_tpl;

    // summer_dout_1re(GPOUT,47)
    assign summer_dout_1re = ca_interp_DUT_Summer_DUC_out_4_1_real_summer_dout_tpl;

    // summer_dout_2im(GPOUT,48)
    assign summer_dout_2im = ca_interp_DUT_Summer_DUC_out_4_2_imag_summer_dout_tpl;

    // summer_dout_2re(GPOUT,49)
    assign summer_dout_2re = ca_interp_DUT_Summer_DUC_out_4_2_real_summer_dout_tpl;

    // summer_dout_3im(GPOUT,50)
    assign summer_dout_3im = ca_interp_DUT_Summer_DUC_out_4_3_imag_summer_dout_tpl;

    // summer_dout_3re(GPOUT,51)
    assign summer_dout_3re = ca_interp_DUT_Summer_DUC_out_4_3_real_summer_dout_tpl;

    // summer_vout_s(GPOUT,52)
    assign summer_vout_s = ca_interp_DUT_Summer_DUC_out_5_summer_vout_tpl;

    // summer_cout_s(GPOUT,53)
    assign summer_cout_s = ca_interp_DUT_Summer_DUC_out_6_summer_cout_tpl;
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
