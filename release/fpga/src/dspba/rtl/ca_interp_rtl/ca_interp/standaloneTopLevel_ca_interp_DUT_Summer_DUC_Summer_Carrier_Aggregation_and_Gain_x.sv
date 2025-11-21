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

// SystemVerilog created from standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x
// SystemVerilog created on Tue Jan  7 17:04:25 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [15:0] din_a1_0im,
    input wire [15:0] din_a1_0re,
    input wire [15:0] din_a1_1im,
    input wire [15:0] din_a1_1re,
    input wire [15:0] din_a1_2im,
    input wire [15:0] din_a1_2re,
    input wire [15:0] din_a1_3im,
    input wire [15:0] din_a1_3re,
    input wire [0:0] vin_a1_s,
    input wire [7:0] cin_a1_s,
    input wire [15:0] din_a2_0im,
    input wire [15:0] din_a2_0re,
    input wire [15:0] din_a2_1im,
    input wire [15:0] din_a2_1re,
    input wire [15:0] din_a2_2im,
    input wire [15:0] din_a2_2re,
    input wire [15:0] din_a2_3im,
    input wire [15:0] din_a2_3re,
    output wire [32:0] altq_0im,
    output wire [32:0] altq_0re,
    output wire [32:0] altq_1im,
    output wire [32:0] altq_1re,
    output wire [32:0] altq_2im,
    output wire [32:0] altq_2re,
    output wire [32:0] altq_3im,
    output wire [32:0] altq_3re,
    output wire [0:0] altv_s,
    output wire [7:0] altc_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [32:0] ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_0_imag_altq_tpl;
    wire [32:0] ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_0_real_altq_tpl;
    wire [32:0] ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_1_imag_altq_tpl;
    wire [32:0] ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_1_real_altq_tpl;
    wire [32:0] ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_2_imag_altq_tpl;
    wire [32:0] ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_2_real_altq_tpl;
    wire [32:0] ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_3_imag_altq_tpl;
    wire [32:0] ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_3_real_altq_tpl;
    wire [0:0] ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_2_altv_tpl;
    wire [7:0] ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_3_altc_tpl;
    wire [31:0] busFabric_ca_interp_DUT_x_busOut_readdata;
    wire [0:0] busFabric_ca_interp_DUT_x_busOut_readdatavalid;
    wire [15:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl;
    wire [15:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl;
    wire [15:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl;
    wire [15:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl;
    reg [0:0] standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_readDelayed_q;
    wire [0:0] standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_readDataValid_q;

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
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl),
        .out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_readDelayed(DELAY,50)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_readDelayed_q <= '0;
        end
        else
        begin
            standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_readDelayed_q <= $unsigned(busIn_read);
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_readDataValid(LOGICAL,51)
    assign standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_readDataValid_q = busFabric_ca_interp_DUT_x_busOut_readdatavalid | standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_readDelayed_q;

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_readDataValid_q;
    assign busOut_readdata = busFabric_ca_interp_DUT_x_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x(BLACKBOX,4)
    ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain theca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x (
        .in_1_0_imag_din_a1_tpl(din_a1_0im),
        .in_1_0_real_din_a1_tpl(din_a1_0re),
        .in_1_1_imag_din_a1_tpl(din_a1_1im),
        .in_1_1_real_din_a1_tpl(din_a1_1re),
        .in_1_2_imag_din_a1_tpl(din_a1_2im),
        .in_1_2_real_din_a1_tpl(din_a1_2re),
        .in_1_3_imag_din_a1_tpl(din_a1_3im),
        .in_1_3_real_din_a1_tpl(din_a1_3re),
        .in_2_vin_a1_tpl(vin_a1_s),
        .in_3_cin_a1_tpl(cin_a1_s),
        .in_4_0_imag_din_a2_tpl(din_a2_0im),
        .in_4_0_real_din_a2_tpl(din_a2_0re),
        .in_4_1_imag_din_a2_tpl(din_a2_1im),
        .in_4_1_real_din_a2_tpl(din_a2_1re),
        .in_4_2_imag_din_a2_tpl(din_a2_2im),
        .in_4_2_real_din_a2_tpl(din_a2_2re),
        .in_4_3_imag_din_a2_tpl(din_a2_3im),
        .in_4_3_real_din_a2_tpl(din_a2_3re),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl),
        .out_1_0_imag_altq_tpl(ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_0_imag_altq_tpl),
        .out_1_0_real_altq_tpl(ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_0_real_altq_tpl),
        .out_1_1_imag_altq_tpl(ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_1_imag_altq_tpl),
        .out_1_1_real_altq_tpl(ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_1_real_altq_tpl),
        .out_1_2_imag_altq_tpl(ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_2_imag_altq_tpl),
        .out_1_2_real_altq_tpl(ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_2_real_altq_tpl),
        .out_1_3_imag_altq_tpl(ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_3_imag_altq_tpl),
        .out_1_3_real_altq_tpl(ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_3_real_altq_tpl),
        .out_2_altv_tpl(ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_2_altv_tpl),
        .out_3_altc_tpl(ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_3_altc_tpl),
        .clk(clk),
        .areset(areset)
    );

    // altq_0im(GPOUT,24)
    assign altq_0im = ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_0_imag_altq_tpl;

    // altq_0re(GPOUT,25)
    assign altq_0re = ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_0_real_altq_tpl;

    // altq_1im(GPOUT,26)
    assign altq_1im = ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_1_imag_altq_tpl;

    // altq_1re(GPOUT,27)
    assign altq_1re = ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_1_real_altq_tpl;

    // altq_2im(GPOUT,28)
    assign altq_2im = ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_2_imag_altq_tpl;

    // altq_2re(GPOUT,29)
    assign altq_2re = ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_2_real_altq_tpl;

    // altq_3im(GPOUT,30)
    assign altq_3im = ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_3_imag_altq_tpl;

    // altq_3re(GPOUT,31)
    assign altq_3re = ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_1_3_real_altq_tpl;

    // altv_s(GPOUT,32)
    assign altv_s = ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_2_altv_tpl;

    // altc_s(GPOUT,33)
    assign altc_s = ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_out_3_altc_tpl;

endmodule
