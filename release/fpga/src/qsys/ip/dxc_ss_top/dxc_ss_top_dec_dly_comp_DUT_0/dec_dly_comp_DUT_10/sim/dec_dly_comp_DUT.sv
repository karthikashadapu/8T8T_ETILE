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

// SystemVerilog created from dec_dly_comp_DUT
// SystemVerilog created on Tue Jan  7 17:06:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module dec_dly_comp_DUT (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [0:0] DDC_Valid_In_s,
    input wire [7:0] DDC_Chan_In_s,
    input wire [15:0] DDC_Ant_Data_In_0im,
    input wire [15:0] DDC_Ant_Data_In_0re,
    input wire [15:0] DDC_Ant_Data_In_1im,
    input wire [15:0] DDC_Ant_Data_In_1re,
    input wire [15:0] DDC_Ant_Data_In_2im,
    input wire [15:0] DDC_Ant_Data_In_2re,
    input wire [15:0] DDC_Ant_Data_In_3im,
    input wire [15:0] DDC_Ant_Data_In_3re,
    input wire [15:0] DDC_Ant_Data_In_4im,
    input wire [15:0] DDC_Ant_Data_In_4re,
    input wire [15:0] DDC_Ant_Data_In_5im,
    input wire [15:0] DDC_Ant_Data_In_5re,
    input wire [15:0] DDC_Ant_Data_In_6im,
    input wire [15:0] DDC_Ant_Data_In_6re,
    input wire [15:0] DDC_Ant_Data_In_7im,
    input wire [15:0] DDC_Ant_Data_In_7re,
    output wire [31:0] alq_l1_dout_0im,
    output wire [31:0] alq_l1_dout_0re,
    output wire [31:0] alq_l1_dout_1im,
    output wire [31:0] alq_l1_dout_1re,
    output wire [31:0] alq_l1_dout_2im,
    output wire [31:0] alq_l1_dout_2re,
    output wire [31:0] alq_l1_dout_3im,
    output wire [31:0] alq_l1_dout_3re,
    output wire [0:0] alq_l1_vout_s,
    output wire [7:0] alq_l1_cout_s,
    output wire [31:0] alq_l2_dout_0im,
    output wire [31:0] alq_l2_dout_0re,
    output wire [31:0] alq_l2_dout_1im,
    output wire [31:0] alq_l2_dout_1re,
    output wire [31:0] alq_l2_dout_2im,
    output wire [31:0] alq_l2_dout_2re,
    output wire [31:0] alq_l2_dout_3im,
    output wire [31:0] alq_l2_dout_3re,
    output wire [0:0] alq_l2_vout_s,
    output wire [7:0] alq_l2_cout_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [31:0] busFabric_busOut_readdata;
    wire [0:0] busFabric_busOut_readdatavalid;
    wire [15:0] busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl;
    wire [15:0] busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl;
    wire [15:0] busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl;
    wire [15:0] busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl;
    wire [15:0] busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_1_0_imag_q1_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_1_0_real_q1_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_1_1_imag_q1_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_1_1_real_q1_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_1_2_imag_q1_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_1_2_real_q1_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_1_3_imag_q1_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_1_3_real_q1_tpl;
    wire [0:0] DUT_vunroll_cunroll_x_out_2_q_v1_tpl;
    wire [7:0] DUT_vunroll_cunroll_x_out_3_q_c1_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_4_0_imag_q2_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_4_0_real_q2_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_4_1_imag_q2_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_4_1_real_q2_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_4_2_imag_q2_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_4_2_real_q2_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_4_3_imag_q2_tpl;
    wire [31:0] DUT_vunroll_cunroll_x_out_4_3_real_q2_tpl;
    wire [0:0] DUT_vunroll_cunroll_x_out_5_q_v2_tpl;
    wire [7:0] DUT_vunroll_cunroll_x_out_6_q_c2_tpl;
    reg [0:0] dec_dly_comp_DUT_readDelayed_q;
    wire [0:0] dec_dly_comp_DUT_readDataValid_q;
    reg [1:0] reset_fanout_mitigation_signal_out;

    import dec_dly_comp_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // busFabric(BLACKBOX,2)
    busFabric_dec_dly_comp_DUT_2o1ix4a06j686w6r6g6u0qu5xgbuoz thebusFabric (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .busOut_readdata(busFabric_busOut_readdata),
        .busOut_readdatavalid(busFabric_busOut_readdatavalid),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl),
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl),
        .clk(clk),
        .areset(reset_fanout_mitigation_signal_out[0]),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // dec_dly_comp_DUT_readDelayed(DELAY,51)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            dec_dly_comp_DUT_readDelayed_q <= '0;
        end
        else
        begin
            dec_dly_comp_DUT_readDelayed_q <= $unsigned(busIn_read);
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // dec_dly_comp_DUT_readDataValid(LOGICAL,52)
    assign dec_dly_comp_DUT_readDataValid_q = busFabric_busOut_readdatavalid | dec_dly_comp_DUT_readDelayed_q;

    // busOut(BUSOUT,4)
    assign busOut_readdatavalid = dec_dly_comp_DUT_readDataValid_q;
    assign busOut_readdata = busFabric_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // DUT_vunroll_cunroll_x(BLACKBOX,8)
    dec_dly_comp_DUT_DUT theDUT_vunroll_cunroll_x (
        .in_1_In_v_tpl(DDC_Valid_In_s),
        .in_2_In_c_tpl(DDC_Chan_In_s),
        .in_3_0_imag_In_d_tpl(DDC_Ant_Data_In_0im),
        .in_3_0_real_In_d_tpl(DDC_Ant_Data_In_0re),
        .in_3_1_imag_In_d_tpl(DDC_Ant_Data_In_1im),
        .in_3_1_real_In_d_tpl(DDC_Ant_Data_In_1re),
        .in_3_2_imag_In_d_tpl(DDC_Ant_Data_In_2im),
        .in_3_2_real_In_d_tpl(DDC_Ant_Data_In_2re),
        .in_3_3_imag_In_d_tpl(DDC_Ant_Data_In_3im),
        .in_3_3_real_In_d_tpl(DDC_Ant_Data_In_3re),
        .in_3_4_imag_In_d_tpl(DDC_Ant_Data_In_4im),
        .in_3_4_real_In_d_tpl(DDC_Ant_Data_In_4re),
        .in_3_5_imag_In_d_tpl(DDC_Ant_Data_In_5im),
        .in_3_5_real_In_d_tpl(DDC_Ant_Data_In_5re),
        .in_3_6_imag_In_d_tpl(DDC_Ant_Data_In_6im),
        .in_3_6_real_In_d_tpl(DDC_Ant_Data_In_6re),
        .in_3_7_imag_In_d_tpl(DDC_Ant_Data_In_7im),
        .in_3_7_real_In_d_tpl(DDC_Ant_Data_In_7re),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl(busFabric_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl),
        .out_1_0_imag_q1_tpl(DUT_vunroll_cunroll_x_out_1_0_imag_q1_tpl),
        .out_1_0_real_q1_tpl(DUT_vunroll_cunroll_x_out_1_0_real_q1_tpl),
        .out_1_1_imag_q1_tpl(DUT_vunroll_cunroll_x_out_1_1_imag_q1_tpl),
        .out_1_1_real_q1_tpl(DUT_vunroll_cunroll_x_out_1_1_real_q1_tpl),
        .out_1_2_imag_q1_tpl(DUT_vunroll_cunroll_x_out_1_2_imag_q1_tpl),
        .out_1_2_real_q1_tpl(DUT_vunroll_cunroll_x_out_1_2_real_q1_tpl),
        .out_1_3_imag_q1_tpl(DUT_vunroll_cunroll_x_out_1_3_imag_q1_tpl),
        .out_1_3_real_q1_tpl(DUT_vunroll_cunroll_x_out_1_3_real_q1_tpl),
        .out_2_q_v1_tpl(DUT_vunroll_cunroll_x_out_2_q_v1_tpl),
        .out_3_q_c1_tpl(DUT_vunroll_cunroll_x_out_3_q_c1_tpl),
        .out_4_0_imag_q2_tpl(DUT_vunroll_cunroll_x_out_4_0_imag_q2_tpl),
        .out_4_0_real_q2_tpl(DUT_vunroll_cunroll_x_out_4_0_real_q2_tpl),
        .out_4_1_imag_q2_tpl(DUT_vunroll_cunroll_x_out_4_1_imag_q2_tpl),
        .out_4_1_real_q2_tpl(DUT_vunroll_cunroll_x_out_4_1_real_q2_tpl),
        .out_4_2_imag_q2_tpl(DUT_vunroll_cunroll_x_out_4_2_imag_q2_tpl),
        .out_4_2_real_q2_tpl(DUT_vunroll_cunroll_x_out_4_2_real_q2_tpl),
        .out_4_3_imag_q2_tpl(DUT_vunroll_cunroll_x_out_4_3_imag_q2_tpl),
        .out_4_3_real_q2_tpl(DUT_vunroll_cunroll_x_out_4_3_real_q2_tpl),
        .out_5_q_v2_tpl(DUT_vunroll_cunroll_x_out_5_q_v2_tpl),
        .out_6_q_c2_tpl(DUT_vunroll_cunroll_x_out_6_q_c2_tpl),
        .clk(clk),
        .areset(reset_fanout_mitigation_signal_out[0])
    );

    // alq_l1_dout_0im(GPOUT,27)
    assign alq_l1_dout_0im = DUT_vunroll_cunroll_x_out_1_0_imag_q1_tpl;

    // alq_l1_dout_0re(GPOUT,28)
    assign alq_l1_dout_0re = DUT_vunroll_cunroll_x_out_1_0_real_q1_tpl;

    // alq_l1_dout_1im(GPOUT,29)
    assign alq_l1_dout_1im = DUT_vunroll_cunroll_x_out_1_1_imag_q1_tpl;

    // alq_l1_dout_1re(GPOUT,30)
    assign alq_l1_dout_1re = DUT_vunroll_cunroll_x_out_1_1_real_q1_tpl;

    // alq_l1_dout_2im(GPOUT,31)
    assign alq_l1_dout_2im = DUT_vunroll_cunroll_x_out_1_2_imag_q1_tpl;

    // alq_l1_dout_2re(GPOUT,32)
    assign alq_l1_dout_2re = DUT_vunroll_cunroll_x_out_1_2_real_q1_tpl;

    // alq_l1_dout_3im(GPOUT,33)
    assign alq_l1_dout_3im = DUT_vunroll_cunroll_x_out_1_3_imag_q1_tpl;

    // alq_l1_dout_3re(GPOUT,34)
    assign alq_l1_dout_3re = DUT_vunroll_cunroll_x_out_1_3_real_q1_tpl;

    // alq_l1_vout_s(GPOUT,35)
    assign alq_l1_vout_s = DUT_vunroll_cunroll_x_out_2_q_v1_tpl;

    // alq_l1_cout_s(GPOUT,36)
    assign alq_l1_cout_s = DUT_vunroll_cunroll_x_out_3_q_c1_tpl;

    // alq_l2_dout_0im(GPOUT,37)
    assign alq_l2_dout_0im = DUT_vunroll_cunroll_x_out_4_0_imag_q2_tpl;

    // alq_l2_dout_0re(GPOUT,38)
    assign alq_l2_dout_0re = DUT_vunroll_cunroll_x_out_4_0_real_q2_tpl;

    // alq_l2_dout_1im(GPOUT,39)
    assign alq_l2_dout_1im = DUT_vunroll_cunroll_x_out_4_1_imag_q2_tpl;

    // alq_l2_dout_1re(GPOUT,40)
    assign alq_l2_dout_1re = DUT_vunroll_cunroll_x_out_4_1_real_q2_tpl;

    // alq_l2_dout_2im(GPOUT,41)
    assign alq_l2_dout_2im = DUT_vunroll_cunroll_x_out_4_2_imag_q2_tpl;

    // alq_l2_dout_2re(GPOUT,42)
    assign alq_l2_dout_2re = DUT_vunroll_cunroll_x_out_4_2_real_q2_tpl;

    // alq_l2_dout_3im(GPOUT,43)
    assign alq_l2_dout_3im = DUT_vunroll_cunroll_x_out_4_3_imag_q2_tpl;

    // alq_l2_dout_3re(GPOUT,44)
    assign alq_l2_dout_3re = DUT_vunroll_cunroll_x_out_4_3_real_q2_tpl;

    // alq_l2_vout_s(GPOUT,45)
    assign alq_l2_vout_s = DUT_vunroll_cunroll_x_out_5_q_v2_tpl;

    // alq_l2_cout_s(GPOUT,46)
    assign alq_l2_cout_s = DUT_vunroll_cunroll_x_out_6_q_c2_tpl;
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
