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

// SystemVerilog created from duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter
// SystemVerilog created on Thu Jan  9 15:34:39 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    input wire [15:0] in_1_imag_din_tpl,
    input wire [15:0] in_1_real_din_tpl,
    input wire [0:0] in_2_vin_tpl,
    input wire [7:0] in_3_chin_tpl,
    input wire [0:0] in_4_CoefBank_tpl,
    output wire [15:0] out_1_imag_q_tpl,
    output wire [15:0] out_1_real_q_tpl,
    output wire [0:0] out_2_qv_tpl,
    output wire [7:0] out_3_qc_tpl,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [15:0] Scale_qOut_0;
    wire [0:0] Scale_qOut_v;
    wire [7:0] Scale_qOut_c;
    wire [15:0] Scale1_qOut_0;
    wire [31:0] SingleRateFIR_Im_busOut_readdata;
    wire [0:0] SingleRateFIR_Im_busOut_readdatavalid;
    wire [39:0] SingleRateFIR_Im_xOut_0;
    wire [0:0] SingleRateFIR_Im_xOut_v;
    wire [7:0] SingleRateFIR_Im_xOut_c;
    wire [31:0] SingleRateFIR_Re_busOut_readdata;
    wire [0:0] SingleRateFIR_Re_busOut_readdatavalid;
    wire [39:0] SingleRateFIR_Re_xOut_0;
    wire [0:0] SingleRateFIR_Re_xOut_v;
    wire [7:0] SingleRateFIR_Re_xOut_c;
    reg [31:0] bus_selector_q;
    reg [0:0] bus_selector_v;

    import duc_model_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // SingleRateFIR_Re(BLACKBOX,7)
    duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re theSingleRateFIR_Re (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .xIn_0(in_1_real_din_tpl),
        .xIn_v(in_2_vin_tpl),
        .xIn_c(in_3_chin_tpl),
        .bankIn_0(in_4_CoefBank_tpl),
        .busOut_readdata(SingleRateFIR_Re_busOut_readdata),
        .busOut_readdatavalid(SingleRateFIR_Re_busOut_readdatavalid),
        .xOut_0(SingleRateFIR_Re_xOut_0),
        .xOut_v(SingleRateFIR_Re_xOut_v),
        .xOut_c(SingleRateFIR_Re_xOut_c),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // SingleRateFIR_Im(BLACKBOX,6)
    duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im theSingleRateFIR_Im (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .xIn_0(in_1_imag_din_tpl),
        .xIn_v(in_2_vin_tpl),
        .xIn_c(in_3_chin_tpl),
        .bankIn_0(in_4_CoefBank_tpl),
        .busOut_readdata(SingleRateFIR_Im_busOut_readdata),
        .busOut_readdatavalid(SingleRateFIR_Im_busOut_readdatavalid),
        .xOut_0(SingleRateFIR_Im_xOut_0),
        .xOut_v(SingleRateFIR_Im_xOut_v),
        .xOut_c(SingleRateFIR_Im_xOut_c),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // bus_selector(SELECTOR,10)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            bus_selector_q <= 32'b0;
            bus_selector_v <= 1'b0;
        end
        else
        begin
            bus_selector_q <= {31'b0000000000000000000000000000000, GND_q};
            bus_selector_v <= $unsigned(1'b0);
            if (SingleRateFIR_Re_busOut_readdatavalid == 1'b1)
            begin
                bus_selector_q <= SingleRateFIR_Re_busOut_readdata;
                bus_selector_v <= $unsigned(1'b1);
            end
            if (SingleRateFIR_Im_busOut_readdatavalid == 1'b1)
            begin
                bus_selector_q <= SingleRateFIR_Im_busOut_readdata;
                bus_selector_v <= $unsigned(1'b1);
            end
        end
    end

    // busOut(BUSOUT,9)
    assign busOut_readdatavalid = bus_selector_v;
    assign busOut_readdata = bus_selector_q;

    // Scale1(BLACKBOX,5)
    duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_Scale1 theScale1 (
        .xIn_0(SingleRateFIR_Im_xOut_0),
        .xIn_v(SingleRateFIR_Im_xOut_v),
        .xIn_c(SingleRateFIR_Im_xOut_c),
        .gain_i(GND_q),
        .qOut_0(Scale1_qOut_0),
        .qOut_v(),
        .qOut_c(),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_imag_q_tpl(GPOUT,22)
    assign out_1_imag_q_tpl = Scale1_qOut_0;

    // Scale(BLACKBOX,4)
    duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_Scale theScale (
        .xIn_0(SingleRateFIR_Re_xOut_0),
        .xIn_v(SingleRateFIR_Re_xOut_v),
        .xIn_c(SingleRateFIR_Re_xOut_c),
        .gain_i(GND_q),
        .qOut_0(Scale_qOut_0),
        .qOut_v(Scale_qOut_v),
        .qOut_c(Scale_qOut_c),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_real_q_tpl(GPOUT,23)
    assign out_1_real_q_tpl = Scale_qOut_0;

    // out_2_qv_tpl(GPOUT,24)
    assign out_2_qv_tpl = Scale_qOut_v;

    // out_3_qc_tpl(GPOUT,25)
    assign out_3_qc_tpl = Scale_qOut_c;

endmodule
