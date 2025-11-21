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

// SystemVerilog created from standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem
// SystemVerilog created on Tue Jan  7 17:04:25 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [15:0] din_intp_out_0im,
    input wire [15:0] din_intp_out_0re,
    input wire [15:0] din_intp_out_1im,
    input wire [15:0] din_intp_out_1re,
    input wire [15:0] din_intp_out_2im,
    input wire [15:0] din_intp_out_2re,
    input wire [15:0] din_intp_out_3im,
    input wire [15:0] din_intp_out_3re,
    input wire [15:0] din_intp_out_4im,
    input wire [15:0] din_intp_out_4re,
    input wire [15:0] din_intp_out_5im,
    input wire [15:0] din_intp_out_5re,
    input wire [15:0] din_intp_out_6im,
    input wire [15:0] din_intp_out_6re,
    input wire [15:0] din_intp_out_7im,
    input wire [15:0] din_intp_out_7re,
    input wire [15:0] din_intp_in_0im,
    input wire [15:0] din_intp_in_0re,
    input wire [15:0] din_intp_in_1im,
    input wire [15:0] din_intp_in_1re,
    input wire [15:0] din_intp_in_2im,
    input wire [15:0] din_intp_in_2re,
    input wire [15:0] din_intp_in_3im,
    input wire [15:0] din_intp_in_3re,
    input wire [0:0] vin_intp_out_s,
    input wire [7:0] cin_intp_in_s,
    input wire [7:0] cin_intp_out_s,
    input wire [0:0] vin_intp_in_s,
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
    output wire [0:0] vout_s,
    output wire [7:0] cout_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_0_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_0_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_1_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_1_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_2_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_2_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_3_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_3_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_4_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_4_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_5_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_5_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_6_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_6_real_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_7_imag_dout_tpl;
    wire [15:0] ca_interp_DUT_Summer_DUC_Subsystem_out_1_7_real_dout_tpl;
    wire [0:0] ca_interp_DUT_Summer_DUC_Subsystem_out_2_vout_tpl;
    wire [7:0] ca_interp_DUT_Summer_DUC_Subsystem_out_3_cout_tpl;
    wire [31:0] busFabric_ca_interp_DUT_x_busOut_readdata;
    wire [0:0] busFabric_ca_interp_DUT_x_busOut_readdatavalid;
    wire [15:0] busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl;
    reg [0:0] standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_readDelayed_q;
    wire [0:0] standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_readDataValid_q;

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
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_readDelayed(DELAY,68)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_readDelayed_q <= '0;
        end
        else
        begin
            standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_readDelayed_q <= $unsigned(busIn_read);
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_readDataValid(LOGICAL,69)
    assign standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_readDataValid_q = busFabric_ca_interp_DUT_x_busOut_readdatavalid | standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_readDelayed_q;

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_readDataValid_q;
    assign busOut_readdata = busFabric_ca_interp_DUT_x_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // ca_interp_DUT_Summer_DUC_Subsystem(BLACKBOX,4)
    ca_interp_DUT_Summer_DUC_Subsystem theca_interp_DUT_Summer_DUC_Subsystem (
        .in_1_0_imag_din_intp_out_tpl(din_intp_out_0im),
        .in_1_0_real_din_intp_out_tpl(din_intp_out_0re),
        .in_1_1_imag_din_intp_out_tpl(din_intp_out_1im),
        .in_1_1_real_din_intp_out_tpl(din_intp_out_1re),
        .in_1_2_imag_din_intp_out_tpl(din_intp_out_2im),
        .in_1_2_real_din_intp_out_tpl(din_intp_out_2re),
        .in_1_3_imag_din_intp_out_tpl(din_intp_out_3im),
        .in_1_3_real_din_intp_out_tpl(din_intp_out_3re),
        .in_1_4_imag_din_intp_out_tpl(din_intp_out_4im),
        .in_1_4_real_din_intp_out_tpl(din_intp_out_4re),
        .in_1_5_imag_din_intp_out_tpl(din_intp_out_5im),
        .in_1_5_real_din_intp_out_tpl(din_intp_out_5re),
        .in_1_6_imag_din_intp_out_tpl(din_intp_out_6im),
        .in_1_6_real_din_intp_out_tpl(din_intp_out_6re),
        .in_1_7_imag_din_intp_out_tpl(din_intp_out_7im),
        .in_1_7_real_din_intp_out_tpl(din_intp_out_7re),
        .in_2_0_imag_din_intp_in_tpl(din_intp_in_0im),
        .in_2_0_real_din_intp_in_tpl(din_intp_in_0re),
        .in_2_1_imag_din_intp_in_tpl(din_intp_in_1im),
        .in_2_1_real_din_intp_in_tpl(din_intp_in_1re),
        .in_2_2_imag_din_intp_in_tpl(din_intp_in_2im),
        .in_2_2_real_din_intp_in_tpl(din_intp_in_2re),
        .in_2_3_imag_din_intp_in_tpl(din_intp_in_3im),
        .in_2_3_real_din_intp_in_tpl(din_intp_in_3re),
        .in_3_vin_intp_out_tpl(vin_intp_out_s),
        .in_4_cin_intp_in_tpl(cin_intp_in_s),
        .in_5_cin_intp_out_tpl(cin_intp_out_s),
        .in_6_vin_intp_in_tpl(vin_intp_in_s),
        .in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl(busFabric_ca_interp_DUT_x_out_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Subsystem_RegField_x_tpl),
        .out_1_0_imag_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_0_imag_dout_tpl),
        .out_1_0_real_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_0_real_dout_tpl),
        .out_1_1_imag_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_1_imag_dout_tpl),
        .out_1_1_real_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_1_real_dout_tpl),
        .out_1_2_imag_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_2_imag_dout_tpl),
        .out_1_2_real_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_2_real_dout_tpl),
        .out_1_3_imag_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_3_imag_dout_tpl),
        .out_1_3_real_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_3_real_dout_tpl),
        .out_1_4_imag_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_4_imag_dout_tpl),
        .out_1_4_real_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_4_real_dout_tpl),
        .out_1_5_imag_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_5_imag_dout_tpl),
        .out_1_5_real_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_5_real_dout_tpl),
        .out_1_6_imag_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_6_imag_dout_tpl),
        .out_1_6_real_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_6_real_dout_tpl),
        .out_1_7_imag_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_7_imag_dout_tpl),
        .out_1_7_real_dout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_1_7_real_dout_tpl),
        .out_2_vout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_2_vout_tpl),
        .out_3_cout_tpl(ca_interp_DUT_Summer_DUC_Subsystem_out_3_cout_tpl),
        .clk(clk),
        .areset(areset)
    );

    // dout_0im(GPOUT,34)
    assign dout_0im = ca_interp_DUT_Summer_DUC_Subsystem_out_1_0_imag_dout_tpl;

    // dout_0re(GPOUT,35)
    assign dout_0re = ca_interp_DUT_Summer_DUC_Subsystem_out_1_0_real_dout_tpl;

    // dout_1im(GPOUT,36)
    assign dout_1im = ca_interp_DUT_Summer_DUC_Subsystem_out_1_1_imag_dout_tpl;

    // dout_1re(GPOUT,37)
    assign dout_1re = ca_interp_DUT_Summer_DUC_Subsystem_out_1_1_real_dout_tpl;

    // dout_2im(GPOUT,38)
    assign dout_2im = ca_interp_DUT_Summer_DUC_Subsystem_out_1_2_imag_dout_tpl;

    // dout_2re(GPOUT,39)
    assign dout_2re = ca_interp_DUT_Summer_DUC_Subsystem_out_1_2_real_dout_tpl;

    // dout_3im(GPOUT,40)
    assign dout_3im = ca_interp_DUT_Summer_DUC_Subsystem_out_1_3_imag_dout_tpl;

    // dout_3re(GPOUT,41)
    assign dout_3re = ca_interp_DUT_Summer_DUC_Subsystem_out_1_3_real_dout_tpl;

    // dout_4im(GPOUT,42)
    assign dout_4im = ca_interp_DUT_Summer_DUC_Subsystem_out_1_4_imag_dout_tpl;

    // dout_4re(GPOUT,43)
    assign dout_4re = ca_interp_DUT_Summer_DUC_Subsystem_out_1_4_real_dout_tpl;

    // dout_5im(GPOUT,44)
    assign dout_5im = ca_interp_DUT_Summer_DUC_Subsystem_out_1_5_imag_dout_tpl;

    // dout_5re(GPOUT,45)
    assign dout_5re = ca_interp_DUT_Summer_DUC_Subsystem_out_1_5_real_dout_tpl;

    // dout_6im(GPOUT,46)
    assign dout_6im = ca_interp_DUT_Summer_DUC_Subsystem_out_1_6_imag_dout_tpl;

    // dout_6re(GPOUT,47)
    assign dout_6re = ca_interp_DUT_Summer_DUC_Subsystem_out_1_6_real_dout_tpl;

    // dout_7im(GPOUT,48)
    assign dout_7im = ca_interp_DUT_Summer_DUC_Subsystem_out_1_7_imag_dout_tpl;

    // dout_7re(GPOUT,49)
    assign dout_7re = ca_interp_DUT_Summer_DUC_Subsystem_out_1_7_real_dout_tpl;

    // vout_s(GPOUT,50)
    assign vout_s = ca_interp_DUT_Summer_DUC_Subsystem_out_2_vout_tpl;

    // cout_s(GPOUT,51)
    assign cout_s = ca_interp_DUT_Summer_DUC_Subsystem_out_3_cout_tpl;

endmodule
