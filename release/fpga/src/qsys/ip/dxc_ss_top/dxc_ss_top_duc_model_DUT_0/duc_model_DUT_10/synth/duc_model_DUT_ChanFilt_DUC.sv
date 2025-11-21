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

// SystemVerilog created from duc_model_DUT_ChanFilt_DUC
// SystemVerilog created on Thu Jan  9 15:34:39 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module duc_model_DUT_ChanFilt_DUC (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    input wire [0:0] in_1_v_1_tpl,
    input wire [7:0] in_2_c_1_tpl,
    input wire [15:0] in_3_imag_d_1_tpl,
    input wire [15:0] in_3_real_d_1_tpl,
    input wire [0:0] in_4_0_sync_tpl,
    input wire [0:0] in_4_1_sync_tpl,
    input wire [0:0] in_4_2_sync_tpl,
    input wire [0:0] in_4_3_sync_tpl,
    input wire [7:0] in_5_BWconfig_1_tpl,
    output wire [7:0] out_1_cout_tpl,
    output wire [0:0] out_2_vout_tpl,
    output wire [15:0] out_3_0_imag_dout_tpl,
    output wire [15:0] out_3_0_real_dout_tpl,
    output wire [15:0] out_3_1_imag_dout_tpl,
    output wire [15:0] out_3_1_real_dout_tpl,
    output wire [15:0] out_3_2_imag_dout_tpl,
    output wire [15:0] out_3_2_real_dout_tpl,
    output wire [15:0] out_3_3_imag_dout_tpl,
    output wire [15:0] out_3_3_real_dout_tpl,
    output wire [15:0] out_4_0_imag_duc_l1_dout_tpl,
    output wire [15:0] out_4_0_real_duc_l1_dout_tpl,
    output wire [15:0] out_4_1_imag_duc_l1_dout_tpl,
    output wire [15:0] out_4_1_real_duc_l1_dout_tpl,
    output wire [15:0] out_4_2_imag_duc_l1_dout_tpl,
    output wire [15:0] out_4_2_real_duc_l1_dout_tpl,
    output wire [15:0] out_4_3_imag_duc_l1_dout_tpl,
    output wire [15:0] out_4_3_real_duc_l1_dout_tpl,
    output wire [0:0] out_5_duc_l1_vout_tpl,
    output wire [7:0] out_6_duc_l1_cout_tpl,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    reg [31:0] bus_selector_q;
    reg [0:0] bus_selector_v;
    wire [31:0] Chan_Filter_lineup1_cunroll_x_busOut_readdata;
    wire [0:0] Chan_Filter_lineup1_cunroll_x_busOut_readdatavalid;
    wire [15:0] Chan_Filter_lineup1_cunroll_x_out_1_imag_q_tpl;
    wire [15:0] Chan_Filter_lineup1_cunroll_x_out_1_real_q_tpl;
    wire [0:0] Chan_Filter_lineup1_cunroll_x_out_2_qv_tpl;
    wire [7:0] Chan_Filter_lineup1_cunroll_x_out_3_qc_tpl;
    wire [31:0] COMPLEX_MIXER1_vunroll_cunroll_x_busOut_readdata;
    wire [0:0] COMPLEX_MIXER1_vunroll_cunroll_x_busOut_readdatavalid;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_0_imag_q1_tpl;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_0_real_q1_tpl;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_1_imag_q1_tpl;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_1_real_q1_tpl;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_2_imag_q1_tpl;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_2_real_q1_tpl;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_3_imag_q1_tpl;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_3_real_q1_tpl;
    wire [0:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_2_qv1_tpl;
    wire [7:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_3_qc1_tpl;
    wire [15:0] DUC_l1_vunroll_cunroll_x_out_1_0_imag_q_tpl;
    wire [15:0] DUC_l1_vunroll_cunroll_x_out_1_0_real_q_tpl;
    wire [15:0] DUC_l1_vunroll_cunroll_x_out_1_1_imag_q_tpl;
    wire [15:0] DUC_l1_vunroll_cunroll_x_out_1_1_real_q_tpl;
    wire [15:0] DUC_l1_vunroll_cunroll_x_out_1_2_imag_q_tpl;
    wire [15:0] DUC_l1_vunroll_cunroll_x_out_1_2_real_q_tpl;
    wire [15:0] DUC_l1_vunroll_cunroll_x_out_1_3_imag_q_tpl;
    wire [15:0] DUC_l1_vunroll_cunroll_x_out_1_3_real_q_tpl;
    wire [0:0] DUC_l1_vunroll_cunroll_x_out_2_qv_tpl;
    wire [7:0] DUC_l1_vunroll_cunroll_x_out_3_qc_tpl;
    reg [0:0] duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_rdv_q;
    reg [31:0] duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_d_q;

    import duc_model_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // Chan_Filter_lineup1_cunroll_x(BLACKBOX,11)
    duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1 theChan_Filter_lineup1_cunroll_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_1_imag_d_tpl(in_3_imag_d_1_tpl),
        .in_1_real_d_tpl(in_3_real_d_1_tpl),
        .in_2_v_tpl(in_1_v_1_tpl),
        .in_3_c_tpl(in_2_c_1_tpl),
        .in_4_Config_CC1_tpl(in_5_BWconfig_1_tpl),
        .busOut_readdata(Chan_Filter_lineup1_cunroll_x_busOut_readdata),
        .busOut_readdatavalid(Chan_Filter_lineup1_cunroll_x_busOut_readdatavalid),
        .out_1_imag_q_tpl(Chan_Filter_lineup1_cunroll_x_out_1_imag_q_tpl),
        .out_1_real_q_tpl(Chan_Filter_lineup1_cunroll_x_out_1_real_q_tpl),
        .out_2_qv_tpl(Chan_Filter_lineup1_cunroll_x_out_2_qv_tpl),
        .out_3_qc_tpl(Chan_Filter_lineup1_cunroll_x_out_3_qc_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // DUC_l1_vunroll_cunroll_x(BLACKBOX,13)
    duc_model_DUT_ChanFilt_DUC_DUC_l1 theDUC_l1_vunroll_cunroll_x (
        .in_1_imag_a_tpl(Chan_Filter_lineup1_cunroll_x_out_1_imag_q_tpl),
        .in_1_real_a_tpl(Chan_Filter_lineup1_cunroll_x_out_1_real_q_tpl),
        .in_2_v_tpl(Chan_Filter_lineup1_cunroll_x_out_2_qv_tpl),
        .in_3_c_tpl(Chan_Filter_lineup1_cunroll_x_out_3_qc_tpl),
        .out_1_0_imag_q_tpl(DUC_l1_vunroll_cunroll_x_out_1_0_imag_q_tpl),
        .out_1_0_real_q_tpl(DUC_l1_vunroll_cunroll_x_out_1_0_real_q_tpl),
        .out_1_1_imag_q_tpl(DUC_l1_vunroll_cunroll_x_out_1_1_imag_q_tpl),
        .out_1_1_real_q_tpl(DUC_l1_vunroll_cunroll_x_out_1_1_real_q_tpl),
        .out_1_2_imag_q_tpl(DUC_l1_vunroll_cunroll_x_out_1_2_imag_q_tpl),
        .out_1_2_real_q_tpl(DUC_l1_vunroll_cunroll_x_out_1_2_real_q_tpl),
        .out_1_3_imag_q_tpl(DUC_l1_vunroll_cunroll_x_out_1_3_imag_q_tpl),
        .out_1_3_real_q_tpl(DUC_l1_vunroll_cunroll_x_out_1_3_real_q_tpl),
        .out_2_qv_tpl(DUC_l1_vunroll_cunroll_x_out_2_qv_tpl),
        .out_3_qc_tpl(DUC_l1_vunroll_cunroll_x_out_3_qc_tpl),
        .clk(clk),
        .areset(areset)
    );

    // COMPLEX_MIXER1_vunroll_cunroll_x(BLACKBOX,12)
    duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1 theCOMPLEX_MIXER1_vunroll_cunroll_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_1_0_imag_d0_tpl(DUC_l1_vunroll_cunroll_x_out_1_0_imag_q_tpl),
        .in_1_0_real_d0_tpl(DUC_l1_vunroll_cunroll_x_out_1_0_real_q_tpl),
        .in_1_1_imag_d0_tpl(DUC_l1_vunroll_cunroll_x_out_1_1_imag_q_tpl),
        .in_1_1_real_d0_tpl(DUC_l1_vunroll_cunroll_x_out_1_1_real_q_tpl),
        .in_1_2_imag_d0_tpl(DUC_l1_vunroll_cunroll_x_out_1_2_imag_q_tpl),
        .in_1_2_real_d0_tpl(DUC_l1_vunroll_cunroll_x_out_1_2_real_q_tpl),
        .in_1_3_imag_d0_tpl(DUC_l1_vunroll_cunroll_x_out_1_3_imag_q_tpl),
        .in_1_3_real_d0_tpl(DUC_l1_vunroll_cunroll_x_out_1_3_real_q_tpl),
        .in_2_v_tpl(DUC_l1_vunroll_cunroll_x_out_2_qv_tpl),
        .in_3_c_tpl(DUC_l1_vunroll_cunroll_x_out_3_qc_tpl),
        .in_4_0_sync_tpl(in_4_0_sync_tpl),
        .in_4_1_sync_tpl(in_4_1_sync_tpl),
        .in_4_2_sync_tpl(in_4_2_sync_tpl),
        .in_4_3_sync_tpl(in_4_3_sync_tpl),
        .busOut_readdata(COMPLEX_MIXER1_vunroll_cunroll_x_busOut_readdata),
        .busOut_readdatavalid(COMPLEX_MIXER1_vunroll_cunroll_x_busOut_readdatavalid),
        .out_1_0_imag_q1_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_0_imag_q1_tpl),
        .out_1_0_real_q1_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_0_real_q1_tpl),
        .out_1_1_imag_q1_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_1_imag_q1_tpl),
        .out_1_1_real_q1_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_1_real_q1_tpl),
        .out_1_2_imag_q1_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_2_imag_q1_tpl),
        .out_1_2_real_q1_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_2_real_q1_tpl),
        .out_1_3_imag_q1_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_3_imag_q1_tpl),
        .out_1_3_real_q1_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_3_real_q1_tpl),
        .out_2_qv1_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_2_qv1_tpl),
        .out_3_qc1_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_3_qc1_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_d(DELAY,52)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_d_q <= '0;
        end
        else
        begin
            duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_d_q <= $unsigned(COMPLEX_MIXER1_vunroll_cunroll_x_busOut_readdata);
        end
    end

    // duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_rdv(DELAY,51)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_rdv_q <= '0;
        end
        else
        begin
            duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_rdv_q <= $unsigned(COMPLEX_MIXER1_vunroll_cunroll_x_busOut_readdatavalid);
        end
    end

    // bus_selector(SELECTOR,4)
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
            if (Chan_Filter_lineup1_cunroll_x_busOut_readdatavalid == 1'b1)
            begin
                bus_selector_q <= Chan_Filter_lineup1_cunroll_x_busOut_readdata;
                bus_selector_v <= $unsigned(1'b1);
            end
            if (duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_rdv_q == 1'b1)
            begin
                bus_selector_q <= duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_d_q;
                bus_selector_v <= $unsigned(1'b1);
            end
        end
    end

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = bus_selector_v;
    assign busOut_readdata = bus_selector_q;

    // out_1_cout_tpl(GPOUT,23)
    assign out_1_cout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_3_qc1_tpl;

    // out_2_vout_tpl(GPOUT,24)
    assign out_2_vout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_2_qv1_tpl;

    // out_3_0_imag_dout_tpl(GPOUT,25)
    assign out_3_0_imag_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_0_imag_q1_tpl;

    // out_3_0_real_dout_tpl(GPOUT,26)
    assign out_3_0_real_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_0_real_q1_tpl;

    // out_3_1_imag_dout_tpl(GPOUT,27)
    assign out_3_1_imag_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_1_imag_q1_tpl;

    // out_3_1_real_dout_tpl(GPOUT,28)
    assign out_3_1_real_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_1_real_q1_tpl;

    // out_3_2_imag_dout_tpl(GPOUT,29)
    assign out_3_2_imag_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_2_imag_q1_tpl;

    // out_3_2_real_dout_tpl(GPOUT,30)
    assign out_3_2_real_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_2_real_q1_tpl;

    // out_3_3_imag_dout_tpl(GPOUT,31)
    assign out_3_3_imag_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_3_imag_q1_tpl;

    // out_3_3_real_dout_tpl(GPOUT,32)
    assign out_3_3_real_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_3_real_q1_tpl;

    // out_4_0_imag_duc_l1_dout_tpl(GPOUT,33)
    assign out_4_0_imag_duc_l1_dout_tpl = DUC_l1_vunroll_cunroll_x_out_1_0_imag_q_tpl;

    // out_4_0_real_duc_l1_dout_tpl(GPOUT,34)
    assign out_4_0_real_duc_l1_dout_tpl = DUC_l1_vunroll_cunroll_x_out_1_0_real_q_tpl;

    // out_4_1_imag_duc_l1_dout_tpl(GPOUT,35)
    assign out_4_1_imag_duc_l1_dout_tpl = DUC_l1_vunroll_cunroll_x_out_1_1_imag_q_tpl;

    // out_4_1_real_duc_l1_dout_tpl(GPOUT,36)
    assign out_4_1_real_duc_l1_dout_tpl = DUC_l1_vunroll_cunroll_x_out_1_1_real_q_tpl;

    // out_4_2_imag_duc_l1_dout_tpl(GPOUT,37)
    assign out_4_2_imag_duc_l1_dout_tpl = DUC_l1_vunroll_cunroll_x_out_1_2_imag_q_tpl;

    // out_4_2_real_duc_l1_dout_tpl(GPOUT,38)
    assign out_4_2_real_duc_l1_dout_tpl = DUC_l1_vunroll_cunroll_x_out_1_2_real_q_tpl;

    // out_4_3_imag_duc_l1_dout_tpl(GPOUT,39)
    assign out_4_3_imag_duc_l1_dout_tpl = DUC_l1_vunroll_cunroll_x_out_1_3_imag_q_tpl;

    // out_4_3_real_duc_l1_dout_tpl(GPOUT,40)
    assign out_4_3_real_duc_l1_dout_tpl = DUC_l1_vunroll_cunroll_x_out_1_3_real_q_tpl;

    // out_5_duc_l1_vout_tpl(GPOUT,41)
    assign out_5_duc_l1_vout_tpl = DUC_l1_vunroll_cunroll_x_out_2_qv_tpl;

    // out_6_duc_l1_cout_tpl(GPOUT,42)
    assign out_6_duc_l1_cout_tpl = DUC_l1_vunroll_cunroll_x_out_3_qc_tpl;

endmodule
