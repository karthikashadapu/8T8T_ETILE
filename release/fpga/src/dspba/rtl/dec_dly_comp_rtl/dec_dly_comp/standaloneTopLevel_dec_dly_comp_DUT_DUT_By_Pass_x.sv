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

// SystemVerilog created from standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x
// SystemVerilog created on Tue Jan  7 17:06:25 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [15:0] din_dec_out_0im,
    input wire [15:0] din_dec_out_0re,
    input wire [15:0] din_dec_out_1im,
    input wire [15:0] din_dec_out_1re,
    input wire [15:0] din_dec_out_2im,
    input wire [15:0] din_dec_out_2re,
    input wire [15:0] din_dec_out_3im,
    input wire [15:0] din_dec_out_3re,
    input wire [15:0] din_dec_in_0im,
    input wire [15:0] din_dec_in_0re,
    input wire [15:0] din_dec_in_1im,
    input wire [15:0] din_dec_in_1re,
    input wire [15:0] din_dec_in_2im,
    input wire [15:0] din_dec_in_2re,
    input wire [15:0] din_dec_in_3im,
    input wire [15:0] din_dec_in_3re,
    input wire [15:0] din_dec_in_4im,
    input wire [15:0] din_dec_in_4re,
    input wire [15:0] din_dec_in_5im,
    input wire [15:0] din_dec_in_5re,
    input wire [15:0] din_dec_in_6im,
    input wire [15:0] din_dec_in_6re,
    input wire [15:0] din_dec_in_7im,
    input wire [15:0] din_dec_in_7re,
    input wire [0:0] vin_dec_out_s,
    input wire [7:0] cin_dec_in_s,
    input wire [7:0] cin_dec_out_s,
    input wire [0:0] vin_dec_in_s,
    output wire [15:0] din_a1_0im,
    output wire [15:0] din_a1_0re,
    output wire [15:0] din_a1_1im,
    output wire [15:0] din_a1_1re,
    output wire [15:0] din_a1_2im,
    output wire [15:0] din_a1_2re,
    output wire [15:0] din_a1_3im,
    output wire [15:0] din_a1_3re,
    output wire [0:0] vin_a1_s,
    output wire [7:0] cin_a1_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [15:0] dec_dly_comp_DUT_DUT_By_Pass_x_out_1_0_imag_din_a1_tpl;
    wire [15:0] dec_dly_comp_DUT_DUT_By_Pass_x_out_1_0_real_din_a1_tpl;
    wire [15:0] dec_dly_comp_DUT_DUT_By_Pass_x_out_1_1_imag_din_a1_tpl;
    wire [15:0] dec_dly_comp_DUT_DUT_By_Pass_x_out_1_1_real_din_a1_tpl;
    wire [15:0] dec_dly_comp_DUT_DUT_By_Pass_x_out_1_2_imag_din_a1_tpl;
    wire [15:0] dec_dly_comp_DUT_DUT_By_Pass_x_out_1_2_real_din_a1_tpl;
    wire [15:0] dec_dly_comp_DUT_DUT_By_Pass_x_out_1_3_imag_din_a1_tpl;
    wire [15:0] dec_dly_comp_DUT_DUT_By_Pass_x_out_1_3_real_din_a1_tpl;
    wire [0:0] dec_dly_comp_DUT_DUT_By_Pass_x_out_2_vin_a1_tpl;
    wire [7:0] dec_dly_comp_DUT_DUT_By_Pass_x_out_3_cin_a1_tpl;
    wire [31:0] busFabric_dec_dly_comp_DUT_x_busOut_readdata;
    wire [0:0] busFabric_dec_dly_comp_DUT_x_busOut_readdatavalid;
    wire [15:0] busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl;
    reg [0:0] standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_readDelayed_q;
    wire [0:0] standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_readDataValid_q;

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
        .out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_readDelayed(DELAY,60)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_readDelayed_q <= '0;
        end
        else
        begin
            standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_readDelayed_q <= $unsigned(busIn_read);
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_readDataValid(LOGICAL,61)
    assign standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_readDataValid_q = busFabric_dec_dly_comp_DUT_x_busOut_readdatavalid | standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_readDelayed_q;

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_readDataValid_q;
    assign busOut_readdata = busFabric_dec_dly_comp_DUT_x_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // dec_dly_comp_DUT_DUT_By_Pass_x(BLACKBOX,4)
    dec_dly_comp_DUT_DUT_By_Pass thedec_dly_comp_DUT_DUT_By_Pass_x (
        .in_1_0_imag_din_dec_out_tpl(din_dec_out_0im),
        .in_1_0_real_din_dec_out_tpl(din_dec_out_0re),
        .in_1_1_imag_din_dec_out_tpl(din_dec_out_1im),
        .in_1_1_real_din_dec_out_tpl(din_dec_out_1re),
        .in_1_2_imag_din_dec_out_tpl(din_dec_out_2im),
        .in_1_2_real_din_dec_out_tpl(din_dec_out_2re),
        .in_1_3_imag_din_dec_out_tpl(din_dec_out_3im),
        .in_1_3_real_din_dec_out_tpl(din_dec_out_3re),
        .in_2_0_imag_din_dec_in_tpl(din_dec_in_0im),
        .in_2_0_real_din_dec_in_tpl(din_dec_in_0re),
        .in_2_1_imag_din_dec_in_tpl(din_dec_in_1im),
        .in_2_1_real_din_dec_in_tpl(din_dec_in_1re),
        .in_2_2_imag_din_dec_in_tpl(din_dec_in_2im),
        .in_2_2_real_din_dec_in_tpl(din_dec_in_2re),
        .in_2_3_imag_din_dec_in_tpl(din_dec_in_3im),
        .in_2_3_real_din_dec_in_tpl(din_dec_in_3re),
        .in_2_4_imag_din_dec_in_tpl(din_dec_in_4im),
        .in_2_4_real_din_dec_in_tpl(din_dec_in_4re),
        .in_2_5_imag_din_dec_in_tpl(din_dec_in_5im),
        .in_2_5_real_din_dec_in_tpl(din_dec_in_5re),
        .in_2_6_imag_din_dec_in_tpl(din_dec_in_6im),
        .in_2_6_real_din_dec_in_tpl(din_dec_in_6re),
        .in_2_7_imag_din_dec_in_tpl(din_dec_in_7im),
        .in_2_7_real_din_dec_in_tpl(din_dec_in_7re),
        .in_3_vin_dec_out_tpl(vin_dec_out_s),
        .in_4_cin_dec_in_tpl(cin_dec_in_s),
        .in_5_cin_dec_out_tpl(cin_dec_out_s),
        .in_6_vin_dec_in_tpl(vin_dec_in_s),
        .in_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl(busFabric_dec_dly_comp_DUT_x_out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl),
        .out_1_0_imag_din_a1_tpl(dec_dly_comp_DUT_DUT_By_Pass_x_out_1_0_imag_din_a1_tpl),
        .out_1_0_real_din_a1_tpl(dec_dly_comp_DUT_DUT_By_Pass_x_out_1_0_real_din_a1_tpl),
        .out_1_1_imag_din_a1_tpl(dec_dly_comp_DUT_DUT_By_Pass_x_out_1_1_imag_din_a1_tpl),
        .out_1_1_real_din_a1_tpl(dec_dly_comp_DUT_DUT_By_Pass_x_out_1_1_real_din_a1_tpl),
        .out_1_2_imag_din_a1_tpl(dec_dly_comp_DUT_DUT_By_Pass_x_out_1_2_imag_din_a1_tpl),
        .out_1_2_real_din_a1_tpl(dec_dly_comp_DUT_DUT_By_Pass_x_out_1_2_real_din_a1_tpl),
        .out_1_3_imag_din_a1_tpl(dec_dly_comp_DUT_DUT_By_Pass_x_out_1_3_imag_din_a1_tpl),
        .out_1_3_real_din_a1_tpl(dec_dly_comp_DUT_DUT_By_Pass_x_out_1_3_real_din_a1_tpl),
        .out_2_vin_a1_tpl(dec_dly_comp_DUT_DUT_By_Pass_x_out_2_vin_a1_tpl),
        .out_3_cin_a1_tpl(dec_dly_comp_DUT_DUT_By_Pass_x_out_3_cin_a1_tpl),
        .clk(clk),
        .areset(areset)
    );

    // din_a1_0im(GPOUT,34)
    assign din_a1_0im = dec_dly_comp_DUT_DUT_By_Pass_x_out_1_0_imag_din_a1_tpl;

    // din_a1_0re(GPOUT,35)
    assign din_a1_0re = dec_dly_comp_DUT_DUT_By_Pass_x_out_1_0_real_din_a1_tpl;

    // din_a1_1im(GPOUT,36)
    assign din_a1_1im = dec_dly_comp_DUT_DUT_By_Pass_x_out_1_1_imag_din_a1_tpl;

    // din_a1_1re(GPOUT,37)
    assign din_a1_1re = dec_dly_comp_DUT_DUT_By_Pass_x_out_1_1_real_din_a1_tpl;

    // din_a1_2im(GPOUT,38)
    assign din_a1_2im = dec_dly_comp_DUT_DUT_By_Pass_x_out_1_2_imag_din_a1_tpl;

    // din_a1_2re(GPOUT,39)
    assign din_a1_2re = dec_dly_comp_DUT_DUT_By_Pass_x_out_1_2_real_din_a1_tpl;

    // din_a1_3im(GPOUT,40)
    assign din_a1_3im = dec_dly_comp_DUT_DUT_By_Pass_x_out_1_3_imag_din_a1_tpl;

    // din_a1_3re(GPOUT,41)
    assign din_a1_3re = dec_dly_comp_DUT_DUT_By_Pass_x_out_1_3_real_din_a1_tpl;

    // vin_a1_s(GPOUT,42)
    assign vin_a1_s = dec_dly_comp_DUT_DUT_By_Pass_x_out_2_vin_a1_tpl;

    // cin_a1_s(GPOUT,43)
    assign cin_a1_s = dec_dly_comp_DUT_DUT_By_Pass_x_out_3_cin_a1_tpl;

endmodule
