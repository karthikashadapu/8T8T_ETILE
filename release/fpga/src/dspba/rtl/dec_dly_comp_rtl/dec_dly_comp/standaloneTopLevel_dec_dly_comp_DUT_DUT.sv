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

// SystemVerilog created from standaloneTopLevel_dec_dly_comp_DUT_DUT
// SystemVerilog created on Tue Jan  7 17:06:25 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module standaloneTopLevel_dec_dly_comp_DUT_DUT (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [0:0] In_v_s,
    input wire [7:0] In_c_s,
    input wire [15:0] In_d_0im,
    input wire [15:0] In_d_0re,
    input wire [15:0] In_d_1im,
    input wire [15:0] In_d_1re,
    input wire [15:0] In_d_2im,
    input wire [15:0] In_d_2re,
    input wire [15:0] In_d_3im,
    input wire [15:0] In_d_3re,
    input wire [15:0] In_d_4im,
    input wire [15:0] In_d_4re,
    input wire [15:0] In_d_5im,
    input wire [15:0] In_d_5re,
    input wire [15:0] In_d_6im,
    input wire [15:0] In_d_6re,
    input wire [15:0] In_d_7im,
    input wire [15:0] In_d_7re,
    output wire [31:0] q1_0im,
    output wire [31:0] q1_0re,
    output wire [31:0] q1_1im,
    output wire [31:0] q1_1re,
    output wire [31:0] q1_2im,
    output wire [31:0] q1_2re,
    output wire [31:0] q1_3im,
    output wire [31:0] q1_3re,
    output wire [0:0] q_v1_s,
    output wire [7:0] q_c1_s,
    output wire [31:0] q2_0im,
    output wire [31:0] q2_0re,
    output wire [31:0] q2_1im,
    output wire [31:0] q2_1re,
    output wire [31:0] q2_2im,
    output wire [31:0] q2_2re,
    output wire [31:0] q2_3im,
    output wire [31:0] q2_3re,
    output wire [0:0] q_v2_s,
    output wire [7:0] q_c2_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [31:0] dec_dly_comp_DUT_DUT_out_1_0_imag_q1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_1_0_real_q1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_1_1_imag_q1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_1_1_real_q1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_1_2_imag_q1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_1_2_real_q1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_1_3_imag_q1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_1_3_real_q1_tpl;
    wire [0:0] dec_dly_comp_DUT_DUT_out_2_q_v1_tpl;
    wire [7:0] dec_dly_comp_DUT_DUT_out_3_q_c1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_4_0_imag_q2_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_4_0_real_q2_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_4_1_imag_q2_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_4_1_real_q2_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_4_2_imag_q2_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_4_2_real_q2_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_4_3_imag_q2_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_out_4_3_real_q2_tpl;
    wire [0:0] dec_dly_comp_DUT_DUT_out_5_q_v2_tpl;
    wire [7:0] dec_dly_comp_DUT_DUT_out_6_q_c2_tpl;
    wire [31:0] busFabric_dec_dly_comp_DUT_x_busOut_readdata;
    wire [0:0] busFabric_dec_dly_comp_DUT_x_busOut_readdatavalid;
    wire [15:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl;
    wire [15:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl;
    wire [15:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl;
    wire [15:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl;
    wire [7:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl;
    wire [7:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl;
    wire [7:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl;
    wire [7:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl;
    wire [7:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl;
    wire [7:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl;
    wire [7:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl;
    wire [7:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl;
    wire [15:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl;
    reg [0:0] standaloneTopLevel_dec_dly_comp_DUT_DUT_readDelayed_q;
    wire [0:0] standaloneTopLevel_dec_dly_comp_DUT_DUT_readDataValid_q;
    reg [1:0] reset_fanout_mitigation_signal_out;

    import dec_dly_comp_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // busFabric_dec_dly_comp_DUT_x(BLACKBOX,5)
    busFabric_dec_dly_comp_DUT_2o1ix4a06j686w6r6g6u0qu5xgbuoz thebusFabric_dec_dly_comp_DUT_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .busOut_readdata(busFabric_dec_dly_comp_DUT_x_busOut_readdata),
        .busOut_readdatavalid(busFabric_dec_dly_comp_DUT_x_busOut_readdatavalid),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl),
        .clk(clk),
        .areset(reset_fanout_mitigation_signal_out[0]),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // standaloneTopLevel_dec_dly_comp_DUT_DUT_readDelayed(DELAY,60)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            standaloneTopLevel_dec_dly_comp_DUT_DUT_readDelayed_q <= '0;
        end
        else
        begin
            standaloneTopLevel_dec_dly_comp_DUT_DUT_readDelayed_q <= $unsigned(busIn_read);
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // standaloneTopLevel_dec_dly_comp_DUT_DUT_readDataValid(LOGICAL,61)
    assign standaloneTopLevel_dec_dly_comp_DUT_DUT_readDataValid_q = busFabric_dec_dly_comp_DUT_x_busOut_readdatavalid | standaloneTopLevel_dec_dly_comp_DUT_DUT_readDelayed_q;

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = standaloneTopLevel_dec_dly_comp_DUT_DUT_readDataValid_q;
    assign busOut_readdata = busFabric_dec_dly_comp_DUT_x_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // dec_dly_comp_DUT_DUT(BLACKBOX,4)
    dec_dly_comp_DUT_DUT thedec_dly_comp_DUT_DUT (
        .in_1_In_v_tpl(In_v_s),
        .in_2_In_c_tpl(In_c_s),
        .in_3_0_imag_In_d_tpl(In_d_0im),
        .in_3_0_real_In_d_tpl(In_d_0re),
        .in_3_1_imag_In_d_tpl(In_d_1im),
        .in_3_1_real_In_d_tpl(In_d_1re),
        .in_3_2_imag_In_d_tpl(In_d_2im),
        .in_3_2_real_In_d_tpl(In_d_2re),
        .in_3_3_imag_In_d_tpl(In_d_3im),
        .in_3_3_real_In_d_tpl(In_d_3re),
        .in_3_4_imag_In_d_tpl(In_d_4im),
        .in_3_4_real_In_d_tpl(In_d_4re),
        .in_3_5_imag_In_d_tpl(In_d_5im),
        .in_3_5_real_In_d_tpl(In_d_5re),
        .in_3_6_imag_In_d_tpl(In_d_6im),
        .in_3_6_real_In_d_tpl(In_d_6re),
        .in_3_7_imag_In_d_tpl(In_d_7im),
        .in_3_7_real_In_d_tpl(In_d_7re),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl),
        .out_1_0_imag_q1_tpl(dec_dly_comp_DUT_DUT_out_1_0_imag_q1_tpl),
        .out_1_0_real_q1_tpl(dec_dly_comp_DUT_DUT_out_1_0_real_q1_tpl),
        .out_1_1_imag_q1_tpl(dec_dly_comp_DUT_DUT_out_1_1_imag_q1_tpl),
        .out_1_1_real_q1_tpl(dec_dly_comp_DUT_DUT_out_1_1_real_q1_tpl),
        .out_1_2_imag_q1_tpl(dec_dly_comp_DUT_DUT_out_1_2_imag_q1_tpl),
        .out_1_2_real_q1_tpl(dec_dly_comp_DUT_DUT_out_1_2_real_q1_tpl),
        .out_1_3_imag_q1_tpl(dec_dly_comp_DUT_DUT_out_1_3_imag_q1_tpl),
        .out_1_3_real_q1_tpl(dec_dly_comp_DUT_DUT_out_1_3_real_q1_tpl),
        .out_2_q_v1_tpl(dec_dly_comp_DUT_DUT_out_2_q_v1_tpl),
        .out_3_q_c1_tpl(dec_dly_comp_DUT_DUT_out_3_q_c1_tpl),
        .out_4_0_imag_q2_tpl(dec_dly_comp_DUT_DUT_out_4_0_imag_q2_tpl),
        .out_4_0_real_q2_tpl(dec_dly_comp_DUT_DUT_out_4_0_real_q2_tpl),
        .out_4_1_imag_q2_tpl(dec_dly_comp_DUT_DUT_out_4_1_imag_q2_tpl),
        .out_4_1_real_q2_tpl(dec_dly_comp_DUT_DUT_out_4_1_real_q2_tpl),
        .out_4_2_imag_q2_tpl(dec_dly_comp_DUT_DUT_out_4_2_imag_q2_tpl),
        .out_4_2_real_q2_tpl(dec_dly_comp_DUT_DUT_out_4_2_real_q2_tpl),
        .out_4_3_imag_q2_tpl(dec_dly_comp_DUT_DUT_out_4_3_imag_q2_tpl),
        .out_4_3_real_q2_tpl(dec_dly_comp_DUT_DUT_out_4_3_real_q2_tpl),
        .out_5_q_v2_tpl(dec_dly_comp_DUT_DUT_out_5_q_v2_tpl),
        .out_6_q_c2_tpl(dec_dly_comp_DUT_DUT_out_6_q_c2_tpl),
        .clk(clk),
        .areset(reset_fanout_mitigation_signal_out[0])
    );

    // q1_0im(GPOUT,24)
    assign q1_0im = dec_dly_comp_DUT_DUT_out_1_0_imag_q1_tpl;

    // q1_0re(GPOUT,25)
    assign q1_0re = dec_dly_comp_DUT_DUT_out_1_0_real_q1_tpl;

    // q1_1im(GPOUT,26)
    assign q1_1im = dec_dly_comp_DUT_DUT_out_1_1_imag_q1_tpl;

    // q1_1re(GPOUT,27)
    assign q1_1re = dec_dly_comp_DUT_DUT_out_1_1_real_q1_tpl;

    // q1_2im(GPOUT,28)
    assign q1_2im = dec_dly_comp_DUT_DUT_out_1_2_imag_q1_tpl;

    // q1_2re(GPOUT,29)
    assign q1_2re = dec_dly_comp_DUT_DUT_out_1_2_real_q1_tpl;

    // q1_3im(GPOUT,30)
    assign q1_3im = dec_dly_comp_DUT_DUT_out_1_3_imag_q1_tpl;

    // q1_3re(GPOUT,31)
    assign q1_3re = dec_dly_comp_DUT_DUT_out_1_3_real_q1_tpl;

    // q_v1_s(GPOUT,32)
    assign q_v1_s = dec_dly_comp_DUT_DUT_out_2_q_v1_tpl;

    // q_c1_s(GPOUT,33)
    assign q_c1_s = dec_dly_comp_DUT_DUT_out_3_q_c1_tpl;

    // q2_0im(GPOUT,34)
    assign q2_0im = dec_dly_comp_DUT_DUT_out_4_0_imag_q2_tpl;

    // q2_0re(GPOUT,35)
    assign q2_0re = dec_dly_comp_DUT_DUT_out_4_0_real_q2_tpl;

    // q2_1im(GPOUT,36)
    assign q2_1im = dec_dly_comp_DUT_DUT_out_4_1_imag_q2_tpl;

    // q2_1re(GPOUT,37)
    assign q2_1re = dec_dly_comp_DUT_DUT_out_4_1_real_q2_tpl;

    // q2_2im(GPOUT,38)
    assign q2_2im = dec_dly_comp_DUT_DUT_out_4_2_imag_q2_tpl;

    // q2_2re(GPOUT,39)
    assign q2_2re = dec_dly_comp_DUT_DUT_out_4_2_real_q2_tpl;

    // q2_3im(GPOUT,40)
    assign q2_3im = dec_dly_comp_DUT_DUT_out_4_3_imag_q2_tpl;

    // q2_3re(GPOUT,41)
    assign q2_3re = dec_dly_comp_DUT_DUT_out_4_3_real_q2_tpl;

    // q_v2_s(GPOUT,42)
    assign q_v2_s = dec_dly_comp_DUT_DUT_out_5_q_v2_tpl;

    // q_c2_s(GPOUT,43)
    assign q_c2_s = dec_dly_comp_DUT_DUT_out_6_q_c2_tpl;
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
