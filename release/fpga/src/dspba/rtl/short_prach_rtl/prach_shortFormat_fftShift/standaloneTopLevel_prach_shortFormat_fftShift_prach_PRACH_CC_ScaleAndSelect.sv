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

// SystemVerilog created from standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect
// SystemVerilog created on Wed Nov  6 19:28:32 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect (
    input wire [31:0] busIn_writedata,
    input wire [9:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [0:0] vin_s,
    input wire [7:0] chin_s,
    input wire [3:0] FFTSize_s,
    input wire [28:0] d_im,
    input wire [28:0] d_re,
    input wire [7:0] BWby10_s,
    input wire [28:0] TimeReference_s,
    output wire [0:0] qv_s,
    output wire [7:0] qch_s,
    output wire [15:0] q_im,
    output wire [15:0] q_re,
    output wire [0:0] qv139_s,
    output wire [13:0] FreqBinIdx_s,
    output wire [0:0] vout_FFTshift_s,
    output wire [7:0] cout_FFTshift_s,
    output wire [15:0] dout_FFTshift_im,
    output wire [15:0] dout_FFTshift_re,
    output wire [28:0] Tref_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_1_qv_tpl;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_2_qch_tpl;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_3_imag_q_tpl;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_3_real_q_tpl;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_4_qv139_tpl;
    wire [13:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_5_FreqBinIdx_tpl;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_6_vout_FFTshift_tpl;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_7_cout_FFTshift_tpl;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_8_imag_dout_FFTshift_tpl;
    wire [15:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_8_real_dout_FFTshift_tpl;
    wire [28:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_9_Tref_tpl;
    wire [31:0] busFabric_prach_shortFormat_fftShift_prach_x_busOut_readdata;
    wire [0:0] busFabric_prach_shortFormat_fftShift_prach_x_busOut_readdatavalid;
    wire [7:0] busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl;
    wire [11:0] busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl;
    reg [0:0] standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_readDelayed_q;
    wire [0:0] standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_readDataValid_q;

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
        .out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl(busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl),
        .out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl(busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_readDelayed(DELAY,40)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_readDelayed_q <= '0;
        end
        else
        begin
            standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_readDelayed_q <= $unsigned(busIn_read);
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_readDataValid(LOGICAL,41)
    assign standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_readDataValid_q = busFabric_prach_shortFormat_fftShift_prach_x_busOut_readdatavalid | standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_readDelayed_q;

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_readDataValid_q;
    assign busOut_readdata = busFabric_prach_shortFormat_fftShift_prach_x_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect(BLACKBOX,4)
    prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect theprach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect (
        .in_1_vin_tpl(vin_s),
        .in_2_chin_tpl(chin_s),
        .in_3_FFTSize_tpl(FFTSize_s),
        .in_4_imag_d_tpl(d_im),
        .in_4_real_d_tpl(d_re),
        .in_5_BWby10_tpl(BWby10_s),
        .in_6_TimeReference_tpl(TimeReference_s),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl(busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl(busFabric_prach_shortFormat_fftShift_prach_x_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl),
        .out_1_qv_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_1_qv_tpl),
        .out_2_qch_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_2_qch_tpl),
        .out_3_imag_q_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_3_imag_q_tpl),
        .out_3_real_q_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_3_real_q_tpl),
        .out_4_qv139_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_4_qv139_tpl),
        .out_5_FreqBinIdx_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_5_FreqBinIdx_tpl),
        .out_6_vout_FFTshift_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_6_vout_FFTshift_tpl),
        .out_7_cout_FFTshift_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_7_cout_FFTshift_tpl),
        .out_8_imag_dout_FFTshift_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_8_imag_dout_FFTshift_tpl),
        .out_8_real_dout_FFTshift_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_8_real_dout_FFTshift_tpl),
        .out_9_Tref_tpl(prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_9_Tref_tpl),
        .clk(clk),
        .areset(areset)
    );

    // qv_s(GPOUT,13)
    assign qv_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_1_qv_tpl;

    // qch_s(GPOUT,14)
    assign qch_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_2_qch_tpl;

    // q_im(GPOUT,15)
    assign q_im = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_3_imag_q_tpl;

    // q_re(GPOUT,16)
    assign q_re = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_3_real_q_tpl;

    // qv139_s(GPOUT,17)
    assign qv139_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_4_qv139_tpl;

    // FreqBinIdx_s(GPOUT,18)
    assign FreqBinIdx_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_5_FreqBinIdx_tpl;

    // vout_FFTshift_s(GPOUT,19)
    assign vout_FFTshift_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_6_vout_FFTshift_tpl;

    // cout_FFTshift_s(GPOUT,20)
    assign cout_FFTshift_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_7_cout_FFTshift_tpl;

    // dout_FFTshift_im(GPOUT,21)
    assign dout_FFTshift_im = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_8_imag_dout_FFTshift_tpl;

    // dout_FFTshift_re(GPOUT,22)
    assign dout_FFTshift_re = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_8_real_dout_FFTshift_tpl;

    // Tref_s(GPOUT,23)
    assign Tref_s = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_out_9_Tref_tpl;

endmodule
