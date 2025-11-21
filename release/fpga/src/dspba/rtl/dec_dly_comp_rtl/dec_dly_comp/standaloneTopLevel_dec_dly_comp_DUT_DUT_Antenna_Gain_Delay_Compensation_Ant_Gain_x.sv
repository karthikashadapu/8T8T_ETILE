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

// SystemVerilog created from standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x
// SystemVerilog created on Tue Jan  7 17:06:25 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [0:0] In1_s,
    input wire [7:0] In2_s,
    input wire [15:0] In3_0im,
    input wire [15:0] In3_0re,
    input wire [15:0] In3_1im,
    input wire [15:0] In3_1re,
    input wire [15:0] In3_2im,
    input wire [15:0] In3_2re,
    input wire [15:0] In3_3im,
    input wire [15:0] In3_3re,
    output wire [31:0] dout1_0im,
    output wire [31:0] dout1_0re,
    output wire [31:0] dout1_1im,
    output wire [31:0] dout1_1re,
    output wire [31:0] dout1_2im,
    output wire [31:0] dout1_2re,
    output wire [31:0] dout1_3im,
    output wire [31:0] dout1_3re,
    output wire [0:0] vout1_s,
    output wire [7:0] cout1_s,
    output wire [31:0] dout2_0im,
    output wire [31:0] dout2_0re,
    output wire [31:0] dout2_1im,
    output wire [31:0] dout2_1re,
    output wire [31:0] dout2_2im,
    output wire [31:0] dout2_2re,
    output wire [31:0] dout2_3im,
    output wire [31:0] dout2_3re,
    output wire [0:0] vout2_s,
    output wire [7:0] cout2_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_0_imag_dout1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_0_real_dout1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_1_imag_dout1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_1_real_dout1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_2_imag_dout1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_2_real_dout1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_3_imag_dout1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_3_real_dout1_tpl;
    wire [0:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_2_vout1_tpl;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_3_cout1_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_0_imag_dout2_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_0_real_dout2_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_1_imag_dout2_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_1_real_dout2_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_2_imag_dout2_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_2_real_dout2_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_3_imag_dout2_tpl;
    wire [31:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_3_real_dout2_tpl;
    wire [0:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_5_vout2_tpl;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_6_cout2_tpl;
    wire [31:0] busFabric_dec_dly_comp_DUT_x_busOut_readdata;
    wire [0:0] busFabric_dec_dly_comp_DUT_x_busOut_readdatavalid;
    wire [15:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl;
    wire [15:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl;
    wire [15:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl;
    wire [15:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl;
    reg [0:0] standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_readDelayed_q;
    wire [0:0] standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_readDataValid_q;

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
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_readDelayed(DELAY,52)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_readDelayed_q <= '0;
        end
        else
        begin
            standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_readDelayed_q <= $unsigned(busIn_read);
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_readDataValid(LOGICAL,53)
    assign standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_readDataValid_q = busFabric_dec_dly_comp_DUT_x_busOut_readdatavalid | standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_readDelayed_q;

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_readDataValid_q;
    assign busOut_readdata = busFabric_dec_dly_comp_DUT_x_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x(BLACKBOX,4)
    dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain thedec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x (
        .in_1_In1_tpl(In1_s),
        .in_2_In2_tpl(In2_s),
        .in_3_0_imag_In3_tpl(In3_0im),
        .in_3_0_real_In3_tpl(In3_0re),
        .in_3_1_imag_In3_tpl(In3_1im),
        .in_3_1_real_In3_tpl(In3_1re),
        .in_3_2_imag_In3_tpl(In3_2im),
        .in_3_2_real_In3_tpl(In3_2re),
        .in_3_3_imag_In3_tpl(In3_3im),
        .in_3_3_real_In3_tpl(In3_3re),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl),
        .out_1_0_imag_dout1_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_0_imag_dout1_tpl),
        .out_1_0_real_dout1_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_0_real_dout1_tpl),
        .out_1_1_imag_dout1_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_1_imag_dout1_tpl),
        .out_1_1_real_dout1_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_1_real_dout1_tpl),
        .out_1_2_imag_dout1_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_2_imag_dout1_tpl),
        .out_1_2_real_dout1_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_2_real_dout1_tpl),
        .out_1_3_imag_dout1_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_3_imag_dout1_tpl),
        .out_1_3_real_dout1_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_3_real_dout1_tpl),
        .out_2_vout1_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_2_vout1_tpl),
        .out_3_cout1_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_3_cout1_tpl),
        .out_4_0_imag_dout2_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_0_imag_dout2_tpl),
        .out_4_0_real_dout2_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_0_real_dout2_tpl),
        .out_4_1_imag_dout2_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_1_imag_dout2_tpl),
        .out_4_1_real_dout2_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_1_real_dout2_tpl),
        .out_4_2_imag_dout2_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_2_imag_dout2_tpl),
        .out_4_2_real_dout2_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_2_real_dout2_tpl),
        .out_4_3_imag_dout2_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_3_imag_dout2_tpl),
        .out_4_3_real_dout2_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_3_real_dout2_tpl),
        .out_5_vout2_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_5_vout2_tpl),
        .out_6_cout2_tpl(dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_6_cout2_tpl),
        .clk(clk),
        .areset(areset)
    );

    // dout1_0im(GPOUT,16)
    assign dout1_0im = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_0_imag_dout1_tpl;

    // dout1_0re(GPOUT,17)
    assign dout1_0re = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_0_real_dout1_tpl;

    // dout1_1im(GPOUT,18)
    assign dout1_1im = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_1_imag_dout1_tpl;

    // dout1_1re(GPOUT,19)
    assign dout1_1re = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_1_real_dout1_tpl;

    // dout1_2im(GPOUT,20)
    assign dout1_2im = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_2_imag_dout1_tpl;

    // dout1_2re(GPOUT,21)
    assign dout1_2re = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_2_real_dout1_tpl;

    // dout1_3im(GPOUT,22)
    assign dout1_3im = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_3_imag_dout1_tpl;

    // dout1_3re(GPOUT,23)
    assign dout1_3re = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_1_3_real_dout1_tpl;

    // vout1_s(GPOUT,24)
    assign vout1_s = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_2_vout1_tpl;

    // cout1_s(GPOUT,25)
    assign cout1_s = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_3_cout1_tpl;

    // dout2_0im(GPOUT,26)
    assign dout2_0im = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_0_imag_dout2_tpl;

    // dout2_0re(GPOUT,27)
    assign dout2_0re = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_0_real_dout2_tpl;

    // dout2_1im(GPOUT,28)
    assign dout2_1im = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_1_imag_dout2_tpl;

    // dout2_1re(GPOUT,29)
    assign dout2_1re = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_1_real_dout2_tpl;

    // dout2_2im(GPOUT,30)
    assign dout2_2im = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_2_imag_dout2_tpl;

    // dout2_2re(GPOUT,31)
    assign dout2_2re = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_2_real_dout2_tpl;

    // dout2_3im(GPOUT,32)
    assign dout2_3im = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_3_imag_dout2_tpl;

    // dout2_3re(GPOUT,33)
    assign dout2_3re = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_4_3_real_dout2_tpl;

    // vout2_s(GPOUT,34)
    assign vout2_s = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_5_vout2_tpl;

    // cout2_s(GPOUT,35)
    assign cout2_s = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_out_6_cout2_tpl;

endmodule
