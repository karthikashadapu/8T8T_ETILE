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

// SystemVerilog created from standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode
// SystemVerilog created on Wed Nov  6 19:28:32 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode (
    input wire [31:0] busIn_writedata,
    input wire [9:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [15:0] din_im,
    input wire [15:0] din_re,
    input wire [0:0] vin_s,
    input wire [7:0] chin_s,
    input wire [11:0] SFN_s,
    input wire [7:0] SubFN_s,
    input wire [1:0] SCSby15_s,
    input wire [7:0] BWby10_s,
    output wire [15:0] dout_im,
    output wire [15:0] dout_re,
    output wire [0:0] vout_s,
    output wire [7:0] cout_s,
    output wire [22:0] CPLen_s,
    output wire [3:0] FFTSize_s,
    output wire [3:0] NFFTs_s,
    output wire [0:0] SOP_s,
    output wire [7:0] qBWby10_s,
    output wire [28:0] TimeReference_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_1_imag_dout_tpl;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_1_real_dout_tpl;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_2_vout_tpl;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_3_cout_tpl;
    wire [22:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_4_CPLen_tpl;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_5_FFTSize_tpl;
    wire [3:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_6_NFFTs_tpl;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_7_SOP_tpl;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_8_qBWby10_tpl;
    wire [28:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_9_TimeReference_tpl;
    wire [31:0] busFabric_prach_shortFormat_fftShift_prach_x_busOut_readdata;
    wire [0:0] busFabric_prach_shortFormat_fftShift_prach_x_busOut_readdatavalid;
    wire [7:0] busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl;
    wire [2:0] busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl;
    wire [0:0] busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl;
    wire [0:0] busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl;
    reg [0:0] standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_readDelayed_q;
    wire [0:0] standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_readDataValid_q;

    import prach_shortFormat_fftShift_prach_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // busFabric_prach_shortFormat_fftShift_prach_x(BLACKBOX,5)
    busFabric_prach_shortFormat_fftShift_prach_3i06i3ib0063663c63o60160760uq5ux5gubo0u thebusFabric_prach_shortFormat_fftShift_prach_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .busOut_readdata(busFabric_prach_shortFormat_fftShift_prach_x_busOut_readdata),
        .busOut_readdatavalid(busFabric_prach_shortFormat_fftShift_prach_x_busOut_readdatavalid),
        .out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl(busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl),
        .out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl(busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl),
        .out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl(busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl),
        .out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl(busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_readDelayed(DELAY,40)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_readDelayed_q <= '0;
        end
        else
        begin
            standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_readDelayed_q <= $unsigned(busIn_read);
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_readDataValid(LOGICAL,41)
    assign standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_readDataValid_q = busFabric_prach_shortFormat_fftShift_prach_x_busOut_readdatavalid | standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_readDelayed_q;

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_readDataValid_q;
    assign busOut_readdata = busFabric_prach_shortFormat_fftShift_prach_x_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode(BLACKBOX,4)
    prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode theprach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode (
        .in_1_imag_din_tpl(din_im),
        .in_1_real_din_tpl(din_re),
        .in_2_vin_tpl(vin_s),
        .in_3_chin_tpl(chin_s),
        .in_4_SFN_tpl(SFN_s),
        .in_5_SubFN_tpl(SubFN_s),
        .in_6_SCSby15_tpl(SCSby15_s),
        .in_7_BWby10_tpl(BWby10_s),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl(busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl(busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl(busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl(busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl),
        .out_1_imag_dout_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_1_imag_dout_tpl),
        .out_1_real_dout_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_1_real_dout_tpl),
        .out_2_vout_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_2_vout_tpl),
        .out_3_cout_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_3_cout_tpl),
        .out_4_CPLen_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_4_CPLen_tpl),
        .out_5_FFTSize_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_5_FFTSize_tpl),
        .out_6_NFFTs_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_6_NFFTs_tpl),
        .out_7_SOP_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_7_SOP_tpl),
        .out_8_qBWby10_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_8_qBWby10_tpl),
        .out_9_TimeReference_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_9_TimeReference_tpl),
        .clk(clk),
        .areset(areset)
    );

    // dout_im(GPOUT,14)
    assign dout_im = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_1_imag_dout_tpl;

    // dout_re(GPOUT,15)
    assign dout_re = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_1_real_dout_tpl;

    // vout_s(GPOUT,16)
    assign vout_s = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_2_vout_tpl;

    // cout_s(GPOUT,17)
    assign cout_s = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_3_cout_tpl;

    // CPLen_s(GPOUT,18)
    assign CPLen_s = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_4_CPLen_tpl;

    // FFTSize_s(GPOUT,19)
    assign FFTSize_s = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_5_FFTSize_tpl;

    // NFFTs_s(GPOUT,20)
    assign NFFTs_s = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_6_NFFTs_tpl;

    // SOP_s(GPOUT,21)
    assign SOP_s = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_7_SOP_tpl;

    // qBWby10_s(GPOUT,22)
    assign qBWby10_s = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_8_qBWby10_tpl;

    // TimeReference_s(GPOUT,23)
    assign TimeReference_s = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_out_9_TimeReference_tpl;

endmodule
