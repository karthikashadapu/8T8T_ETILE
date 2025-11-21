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

// SystemVerilog created from ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter
// SystemVerilog created on Thu Jan  9 15:36:33 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    input wire [15:0] in_1_imag_d1_tpl,
    input wire [15:0] in_1_real_d1_tpl,
    input wire [0:0] in_2_v_tpl,
    input wire [7:0] in_3_c_tpl,
    input wire [0:0] in_4_bank_tpl,
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
    reg [31:0] bus_selector_q;
    reg [0:0] bus_selector_v;
    wire [15:0] chan_filter_Scale_re_qOut_0;
    wire [0:0] chan_filter_Scale_re_qOut_v;
    wire [7:0] chan_filter_Scale_re_qOut_c;
    wire [15:0] chan_filter_Scaleim_qOut_0;
    wire [31:0] chan_filter_im_busOut_readdata;
    wire [0:0] chan_filter_im_busOut_readdatavalid;
    wire [40:0] chan_filter_im_xOut_0;
    wire [0:0] chan_filter_im_xOut_v;
    wire [7:0] chan_filter_im_xOut_c;
    wire [31:0] chan_filter_re_busOut_readdata;
    wire [0:0] chan_filter_re_busOut_readdatavalid;
    wire [40:0] chan_filter_re_xOut_0;
    wire [0:0] chan_filter_re_xOut_v;
    wire [7:0] chan_filter_re_xOut_c;
    wire [15:0] routing_reg_chan_re_out_1_q0_tpl;
    wire [0:0] routing_reg_chan_re_out_2_qv_tpl;
    wire [7:0] routing_reg_chan_re_out_3_qc_tpl;
    wire [0:0] routing_reg_chan_re_out_4_q1_tpl;
    wire [15:0] routing_reg_chan_re1_out_1_q0_tpl;
    wire [0:0] routing_reg_chan_re1_out_2_qv_tpl;
    wire [7:0] routing_reg_chan_re1_out_3_qc_tpl;
    wire [0:0] routing_reg_chan_re1_out_4_q1_tpl;

    import ddc_model_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // routing_reg_chan_re(BLACKBOX,12)
    ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_routing_reg_chan_re therouting_reg_chan_re (
        .in_1_d_tpl(in_1_real_d1_tpl),
        .in_2_dv_tpl(in_2_v_tpl),
        .in_3_dc_tpl(in_3_c_tpl),
        .in_4_CoefBank_tpl(in_4_bank_tpl),
        .out_1_q0_tpl(routing_reg_chan_re_out_1_q0_tpl),
        .out_2_qv_tpl(routing_reg_chan_re_out_2_qv_tpl),
        .out_3_qc_tpl(routing_reg_chan_re_out_3_qc_tpl),
        .out_4_q1_tpl(routing_reg_chan_re_out_4_q1_tpl),
        .clk(clk),
        .areset(areset)
    );

    // chan_filter_re(BLACKBOX,11)
    ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_chan_filter_re thechan_filter_re (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .xIn_0(routing_reg_chan_re_out_1_q0_tpl),
        .xIn_v(routing_reg_chan_re_out_2_qv_tpl),
        .xIn_c(routing_reg_chan_re_out_3_qc_tpl),
        .bankIn_0(routing_reg_chan_re_out_4_q1_tpl),
        .busOut_readdata(chan_filter_re_busOut_readdata),
        .busOut_readdatavalid(chan_filter_re_busOut_readdatavalid),
        .xOut_0(chan_filter_re_xOut_0),
        .xOut_v(chan_filter_re_xOut_v),
        .xOut_c(chan_filter_re_xOut_c),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // routing_reg_chan_re1(BLACKBOX,13)
    ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_routing_reg_chan_re1 therouting_reg_chan_re1 (
        .in_1_d_tpl(in_1_imag_d1_tpl),
        .in_2_dv_tpl(in_2_v_tpl),
        .in_3_dc_tpl(in_3_c_tpl),
        .in_4_CoefBank_tpl(in_4_bank_tpl),
        .out_1_q0_tpl(routing_reg_chan_re1_out_1_q0_tpl),
        .out_2_qv_tpl(routing_reg_chan_re1_out_2_qv_tpl),
        .out_3_qc_tpl(routing_reg_chan_re1_out_3_qc_tpl),
        .out_4_q1_tpl(routing_reg_chan_re1_out_4_q1_tpl),
        .clk(clk),
        .areset(areset)
    );

    // chan_filter_im(BLACKBOX,10)
    ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_chan_filter_im thechan_filter_im (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .xIn_0(routing_reg_chan_re1_out_1_q0_tpl),
        .xIn_v(routing_reg_chan_re1_out_2_qv_tpl),
        .xIn_c(routing_reg_chan_re1_out_3_qc_tpl),
        .bankIn_0(routing_reg_chan_re1_out_4_q1_tpl),
        .busOut_readdata(chan_filter_im_busOut_readdata),
        .busOut_readdatavalid(chan_filter_im_busOut_readdatavalid),
        .xOut_0(chan_filter_im_xOut_0),
        .xOut_v(chan_filter_im_xOut_v),
        .xOut_c(chan_filter_im_xOut_c),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // bus_selector(SELECTOR,6)
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
            if (chan_filter_re_busOut_readdatavalid == 1'b1)
            begin
                bus_selector_q <= chan_filter_re_busOut_readdata;
                bus_selector_v <= $unsigned(1'b1);
            end
            if (chan_filter_im_busOut_readdatavalid == 1'b1)
            begin
                bus_selector_q <= chan_filter_im_busOut_readdata;
                bus_selector_v <= $unsigned(1'b1);
            end
        end
    end

    // busOut(BUSOUT,5)
    assign busOut_readdatavalid = bus_selector_v;
    assign busOut_readdata = bus_selector_q;

    // chan_filter_Scaleim(BLACKBOX,9)
    ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_chan_filter_Scaleim thechan_filter_Scaleim (
        .xIn_0(chan_filter_im_xOut_0),
        .xIn_v(chan_filter_im_xOut_v),
        .xIn_c(chan_filter_im_xOut_c),
        .gain_i(GND_q),
        .qOut_0(chan_filter_Scaleim_qOut_0),
        .qOut_v(),
        .qOut_c(),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_imag_q_tpl(GPOUT,32)
    assign out_1_imag_q_tpl = chan_filter_Scaleim_qOut_0;

    // chan_filter_Scale_re(BLACKBOX,8)
    ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_chan_filter_Scale_re thechan_filter_Scale_re (
        .xIn_0(chan_filter_re_xOut_0),
        .xIn_v(chan_filter_re_xOut_v),
        .xIn_c(chan_filter_re_xOut_c),
        .gain_i(GND_q),
        .qOut_0(chan_filter_Scale_re_qOut_0),
        .qOut_v(chan_filter_Scale_re_qOut_v),
        .qOut_c(chan_filter_Scale_re_qOut_c),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // out_1_real_q_tpl(GPOUT,33)
    assign out_1_real_q_tpl = chan_filter_Scale_re_qOut_0;

    // out_2_qv_tpl(GPOUT,34)
    assign out_2_qv_tpl = chan_filter_Scale_re_qOut_v;

    // out_3_qc_tpl(GPOUT,35)
    assign out_3_qc_tpl = chan_filter_Scale_re_qOut_c;

endmodule
