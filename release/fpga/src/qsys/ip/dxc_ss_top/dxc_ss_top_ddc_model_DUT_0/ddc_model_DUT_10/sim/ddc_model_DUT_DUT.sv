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

// SystemVerilog created from ddc_model_DUT_DUT
// SystemVerilog created on Thu Jan  9 15:36:33 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ddc_model_DUT_DUT (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    input wire [0:0] in_1_In_v_tpl,
    input wire [7:0] in_2_In_c_tpl,
    input wire [31:0] in_3_0_imag_In_d_tpl,
    input wire [31:0] in_3_0_real_In_d_tpl,
    input wire [31:0] in_3_1_imag_In_d_tpl,
    input wire [31:0] in_3_1_real_In_d_tpl,
    input wire [31:0] in_3_2_imag_In_d_tpl,
    input wire [31:0] in_3_2_real_In_d_tpl,
    input wire [31:0] in_3_3_imag_In_d_tpl,
    input wire [31:0] in_3_3_real_In_d_tpl,
    input wire [0:0] in_4_0_sync_tpl,
    input wire [0:0] in_4_1_sync_tpl,
    input wire [0:0] in_4_2_sync_tpl,
    input wire [0:0] in_4_3_sync_tpl,
    input wire [7:0] in_5_BW_config_CC1_tpl,
    input wire [31:0] in_6_0_imag_In_Const_tpl,
    input wire [31:0] in_6_0_real_In_Const_tpl,
    input wire [31:0] in_6_1_imag_In_Const_tpl,
    input wire [31:0] in_6_1_real_In_Const_tpl,
    input wire [31:0] in_6_2_imag_In_Const_tpl,
    input wire [31:0] in_6_2_real_In_Const_tpl,
    input wire [31:0] in_6_3_imag_In_Const_tpl,
    input wire [31:0] in_6_3_real_In_Const_tpl,
    input wire [0:0] in_7_In_Sel_tpl,
    output wire [15:0] out_1_imag_q1_tpl,
    output wire [15:0] out_1_real_q1_tpl,
    output wire [0:0] out_2_q_v1_tpl,
    output wire [7:0] out_3_q_c1_tpl,
    output wire [15:0] out_4_0_imag_mixer_l1_dout_tpl,
    output wire [15:0] out_4_0_real_mixer_l1_dout_tpl,
    output wire [15:0] out_4_1_imag_mixer_l1_dout_tpl,
    output wire [15:0] out_4_1_real_mixer_l1_dout_tpl,
    output wire [15:0] out_4_2_imag_mixer_l1_dout_tpl,
    output wire [15:0] out_4_2_real_mixer_l1_dout_tpl,
    output wire [15:0] out_4_3_imag_mixer_l1_dout_tpl,
    output wire [15:0] out_4_3_real_mixer_l1_dout_tpl,
    output wire [0:0] out_5_mixer_l1_vout_tpl,
    output wire [7:0] out_6_mixer_l1_cout_tpl,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    reg [31:0] bus_selector_q;
    reg [0:0] bus_selector_v;
    wire [31:0] Chan_Filter_l1_cunroll_x_busOut_readdata;
    wire [0:0] Chan_Filter_l1_cunroll_x_busOut_readdatavalid;
    wire [15:0] Chan_Filter_l1_cunroll_x_out_1_imag_q_tpl;
    wire [15:0] Chan_Filter_l1_cunroll_x_out_1_real_q_tpl;
    wire [0:0] Chan_Filter_l1_cunroll_x_out_2_qv_tpl;
    wire [7:0] Chan_Filter_l1_cunroll_x_out_3_qc_tpl;
    wire [15:0] routing_reg_hb72chan_l1_cunroll_x_out_1_imag_q0_tpl;
    wire [15:0] routing_reg_hb72chan_l1_cunroll_x_out_1_real_q0_tpl;
    wire [0:0] routing_reg_hb72chan_l1_cunroll_x_out_2_qv_tpl;
    wire [7:0] routing_reg_hb72chan_l1_cunroll_x_out_3_qc_tpl;
    wire [31:0] COMPLEX_MIXER1_vunroll_cunroll_x_busOut_readdata;
    wire [0:0] COMPLEX_MIXER1_vunroll_cunroll_x_busOut_readdatavalid;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_0_imag_q0_tpl;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_0_real_q0_tpl;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_1_imag_q0_tpl;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_1_real_q0_tpl;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_2_imag_q0_tpl;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_2_real_q0_tpl;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_3_imag_q0_tpl;
    wire [15:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_1_3_real_q0_tpl;
    wire [0:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_2_qv_tpl;
    wire [7:0] COMPLEX_MIXER1_vunroll_cunroll_x_out_3_qc_tpl;
    wire [31:0] Const_sel_vunroll_cunroll_x_out_1_0_imag_din_a1_tpl;
    wire [31:0] Const_sel_vunroll_cunroll_x_out_1_0_real_din_a1_tpl;
    wire [31:0] Const_sel_vunroll_cunroll_x_out_1_1_imag_din_a1_tpl;
    wire [31:0] Const_sel_vunroll_cunroll_x_out_1_1_real_din_a1_tpl;
    wire [31:0] Const_sel_vunroll_cunroll_x_out_1_2_imag_din_a1_tpl;
    wire [31:0] Const_sel_vunroll_cunroll_x_out_1_2_real_din_a1_tpl;
    wire [31:0] Const_sel_vunroll_cunroll_x_out_1_3_imag_din_a1_tpl;
    wire [31:0] Const_sel_vunroll_cunroll_x_out_1_3_real_din_a1_tpl;
    wire [0:0] Const_sel_vunroll_cunroll_x_out_2_vin_a1_tpl;
    wire [7:0] Const_sel_vunroll_cunroll_x_out_3_cin_a1_tpl;
    wire [15:0] DDC_l1_vunroll_cunroll_x_out_1_imag_q_tpl;
    wire [15:0] DDC_l1_vunroll_cunroll_x_out_1_real_q_tpl;
    wire [0:0] DDC_l1_vunroll_cunroll_x_out_2_qv_tpl;
    wire [7:0] DDC_l1_vunroll_cunroll_x_out_3_qc_tpl;
    reg [0:0] ddc_model_DUT_DUT_COMPLEX_MIXER1_rdv_q;
    reg [31:0] ddc_model_DUT_DUT_COMPLEX_MIXER1_d_q;

    import ddc_model_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // Const_sel_vunroll_cunroll_x(BLACKBOX,18)
    ddc_model_DUT_DUT_Const_sel theConst_sel_vunroll_cunroll_x (
        .in_1_0_imag_din_d1_tpl(in_3_0_imag_In_d_tpl),
        .in_1_0_real_din_d1_tpl(in_3_0_real_In_d_tpl),
        .in_1_1_imag_din_d1_tpl(in_3_1_imag_In_d_tpl),
        .in_1_1_real_din_d1_tpl(in_3_1_real_In_d_tpl),
        .in_1_2_imag_din_d1_tpl(in_3_2_imag_In_d_tpl),
        .in_1_2_real_din_d1_tpl(in_3_2_real_In_d_tpl),
        .in_1_3_imag_din_d1_tpl(in_3_3_imag_In_d_tpl),
        .in_1_3_real_din_d1_tpl(in_3_3_real_In_d_tpl),
        .in_2_0_imag_din_d2_tpl(in_6_0_imag_In_Const_tpl),
        .in_2_0_real_din_d2_tpl(in_6_0_real_In_Const_tpl),
        .in_2_1_imag_din_d2_tpl(in_6_1_imag_In_Const_tpl),
        .in_2_1_real_din_d2_tpl(in_6_1_real_In_Const_tpl),
        .in_2_2_imag_din_d2_tpl(in_6_2_imag_In_Const_tpl),
        .in_2_2_real_din_d2_tpl(in_6_2_real_In_Const_tpl),
        .in_2_3_imag_din_d2_tpl(in_6_3_imag_In_Const_tpl),
        .in_2_3_real_din_d2_tpl(in_6_3_real_In_Const_tpl),
        .in_3_vin_d1_tpl(in_1_In_v_tpl),
        .in_4_cin_d1_tpl(in_2_In_c_tpl),
        .in_5_mux_sel_tpl(in_7_In_Sel_tpl),
        .out_1_0_imag_din_a1_tpl(Const_sel_vunroll_cunroll_x_out_1_0_imag_din_a1_tpl),
        .out_1_0_real_din_a1_tpl(Const_sel_vunroll_cunroll_x_out_1_0_real_din_a1_tpl),
        .out_1_1_imag_din_a1_tpl(Const_sel_vunroll_cunroll_x_out_1_1_imag_din_a1_tpl),
        .out_1_1_real_din_a1_tpl(Const_sel_vunroll_cunroll_x_out_1_1_real_din_a1_tpl),
        .out_1_2_imag_din_a1_tpl(Const_sel_vunroll_cunroll_x_out_1_2_imag_din_a1_tpl),
        .out_1_2_real_din_a1_tpl(Const_sel_vunroll_cunroll_x_out_1_2_real_din_a1_tpl),
        .out_1_3_imag_din_a1_tpl(Const_sel_vunroll_cunroll_x_out_1_3_imag_din_a1_tpl),
        .out_1_3_real_din_a1_tpl(Const_sel_vunroll_cunroll_x_out_1_3_real_din_a1_tpl),
        .out_2_vin_a1_tpl(Const_sel_vunroll_cunroll_x_out_2_vin_a1_tpl),
        .out_3_cin_a1_tpl(Const_sel_vunroll_cunroll_x_out_3_cin_a1_tpl),
        .clk(clk),
        .areset(areset)
    );

    // COMPLEX_MIXER1_vunroll_cunroll_x(BLACKBOX,17)
    ddc_model_DUT_DUT_COMPLEX_MIXER1 theCOMPLEX_MIXER1_vunroll_cunroll_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_1_0_imag_d0_tpl(Const_sel_vunroll_cunroll_x_out_1_0_imag_din_a1_tpl),
        .in_1_0_real_d0_tpl(Const_sel_vunroll_cunroll_x_out_1_0_real_din_a1_tpl),
        .in_1_1_imag_d0_tpl(Const_sel_vunroll_cunroll_x_out_1_1_imag_din_a1_tpl),
        .in_1_1_real_d0_tpl(Const_sel_vunroll_cunroll_x_out_1_1_real_din_a1_tpl),
        .in_1_2_imag_d0_tpl(Const_sel_vunroll_cunroll_x_out_1_2_imag_din_a1_tpl),
        .in_1_2_real_d0_tpl(Const_sel_vunroll_cunroll_x_out_1_2_real_din_a1_tpl),
        .in_1_3_imag_d0_tpl(Const_sel_vunroll_cunroll_x_out_1_3_imag_din_a1_tpl),
        .in_1_3_real_d0_tpl(Const_sel_vunroll_cunroll_x_out_1_3_real_din_a1_tpl),
        .in_2_v_tpl(Const_sel_vunroll_cunroll_x_out_2_vin_a1_tpl),
        .in_3_c_tpl(Const_sel_vunroll_cunroll_x_out_3_cin_a1_tpl),
        .in_4_0_sync_tpl(in_4_0_sync_tpl),
        .in_4_1_sync_tpl(in_4_1_sync_tpl),
        .in_4_2_sync_tpl(in_4_2_sync_tpl),
        .in_4_3_sync_tpl(in_4_3_sync_tpl),
        .busOut_readdata(COMPLEX_MIXER1_vunroll_cunroll_x_busOut_readdata),
        .busOut_readdatavalid(COMPLEX_MIXER1_vunroll_cunroll_x_busOut_readdatavalid),
        .out_1_0_imag_q0_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_0_imag_q0_tpl),
        .out_1_0_real_q0_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_0_real_q0_tpl),
        .out_1_1_imag_q0_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_1_imag_q0_tpl),
        .out_1_1_real_q0_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_1_real_q0_tpl),
        .out_1_2_imag_q0_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_2_imag_q0_tpl),
        .out_1_2_real_q0_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_2_real_q0_tpl),
        .out_1_3_imag_q0_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_3_imag_q0_tpl),
        .out_1_3_real_q0_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_3_real_q0_tpl),
        .out_2_qv_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_2_qv_tpl),
        .out_3_qc_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_3_qc_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // DDC_l1_vunroll_cunroll_x(BLACKBOX,19)
    ddc_model_DUT_DUT_DDC_l1_x theDDC_l1_vunroll_cunroll_x (
        .in_1_0_imag_d_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_0_imag_q0_tpl),
        .in_1_0_real_d_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_0_real_q0_tpl),
        .in_1_1_imag_d_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_1_imag_q0_tpl),
        .in_1_1_real_d_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_1_real_q0_tpl),
        .in_1_2_imag_d_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_2_imag_q0_tpl),
        .in_1_2_real_d_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_2_real_q0_tpl),
        .in_1_3_imag_d_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_3_imag_q0_tpl),
        .in_1_3_real_d_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_1_3_real_q0_tpl),
        .in_2_v_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_2_qv_tpl),
        .in_3_c_tpl(COMPLEX_MIXER1_vunroll_cunroll_x_out_3_qc_tpl),
        .out_1_imag_q_tpl(DDC_l1_vunroll_cunroll_x_out_1_imag_q_tpl),
        .out_1_real_q_tpl(DDC_l1_vunroll_cunroll_x_out_1_real_q_tpl),
        .out_2_qv_tpl(DDC_l1_vunroll_cunroll_x_out_2_qv_tpl),
        .out_3_qc_tpl(DDC_l1_vunroll_cunroll_x_out_3_qc_tpl),
        .clk(clk),
        .areset(areset)
    );

    // routing_reg_hb72chan_l1_cunroll_x(BLACKBOX,16)
    ddc_model_DUT_DUT_routing_reg_hb72chan_l1 therouting_reg_hb72chan_l1_cunroll_x (
        .in_1_imag_d_tpl(DDC_l1_vunroll_cunroll_x_out_1_imag_q_tpl),
        .in_1_real_d_tpl(DDC_l1_vunroll_cunroll_x_out_1_real_q_tpl),
        .in_2_dv_tpl(DDC_l1_vunroll_cunroll_x_out_2_qv_tpl),
        .in_3_dc_tpl(DDC_l1_vunroll_cunroll_x_out_3_qc_tpl),
        .out_1_imag_q0_tpl(routing_reg_hb72chan_l1_cunroll_x_out_1_imag_q0_tpl),
        .out_1_real_q0_tpl(routing_reg_hb72chan_l1_cunroll_x_out_1_real_q0_tpl),
        .out_2_qv_tpl(routing_reg_hb72chan_l1_cunroll_x_out_2_qv_tpl),
        .out_3_qc_tpl(routing_reg_hb72chan_l1_cunroll_x_out_3_qc_tpl),
        .clk(clk),
        .areset(areset)
    );

    // Chan_Filter_l1_cunroll_x(BLACKBOX,13)
    ddc_model_DUT_DUT_Chan_Filter_l1 theChan_Filter_l1_cunroll_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_1_imag_d_tpl(routing_reg_hb72chan_l1_cunroll_x_out_1_imag_q0_tpl),
        .in_1_real_d_tpl(routing_reg_hb72chan_l1_cunroll_x_out_1_real_q0_tpl),
        .in_2_v_tpl(routing_reg_hb72chan_l1_cunroll_x_out_2_qv_tpl),
        .in_3_c_tpl(routing_reg_hb72chan_l1_cunroll_x_out_3_qc_tpl),
        .in_4_BW_c1_tpl(in_5_BW_config_CC1_tpl),
        .busOut_readdata(Chan_Filter_l1_cunroll_x_busOut_readdata),
        .busOut_readdatavalid(Chan_Filter_l1_cunroll_x_busOut_readdatavalid),
        .out_1_imag_q_tpl(Chan_Filter_l1_cunroll_x_out_1_imag_q_tpl),
        .out_1_real_q_tpl(Chan_Filter_l1_cunroll_x_out_1_real_q_tpl),
        .out_2_qv_tpl(Chan_Filter_l1_cunroll_x_out_2_qv_tpl),
        .out_3_qc_tpl(Chan_Filter_l1_cunroll_x_out_3_qc_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // ddc_model_DUT_DUT_COMPLEX_MIXER1_d(DELAY,67)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            ddc_model_DUT_DUT_COMPLEX_MIXER1_d_q <= '0;
        end
        else
        begin
            ddc_model_DUT_DUT_COMPLEX_MIXER1_d_q <= $unsigned(COMPLEX_MIXER1_vunroll_cunroll_x_busOut_readdata);
        end
    end

    // ddc_model_DUT_DUT_COMPLEX_MIXER1_rdv(DELAY,66)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            ddc_model_DUT_DUT_COMPLEX_MIXER1_rdv_q <= '0;
        end
        else
        begin
            ddc_model_DUT_DUT_COMPLEX_MIXER1_rdv_q <= $unsigned(COMPLEX_MIXER1_vunroll_cunroll_x_busOut_readdatavalid);
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
            if (Chan_Filter_l1_cunroll_x_busOut_readdatavalid == 1'b1)
            begin
                bus_selector_q <= Chan_Filter_l1_cunroll_x_busOut_readdata;
                bus_selector_v <= $unsigned(1'b1);
            end
            if (ddc_model_DUT_DUT_COMPLEX_MIXER1_rdv_q == 1'b1)
            begin
                bus_selector_q <= ddc_model_DUT_DUT_COMPLEX_MIXER1_d_q;
                bus_selector_v <= $unsigned(1'b1);
            end
        end
    end

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = bus_selector_v;
    assign busOut_readdata = bus_selector_q;

    // out_1_imag_q1_tpl(GPOUT,44)
    assign out_1_imag_q1_tpl = Chan_Filter_l1_cunroll_x_out_1_imag_q_tpl;

    // out_1_real_q1_tpl(GPOUT,45)
    assign out_1_real_q1_tpl = Chan_Filter_l1_cunroll_x_out_1_real_q_tpl;

    // out_2_q_v1_tpl(GPOUT,46)
    assign out_2_q_v1_tpl = Chan_Filter_l1_cunroll_x_out_2_qv_tpl;

    // out_3_q_c1_tpl(GPOUT,47)
    assign out_3_q_c1_tpl = Chan_Filter_l1_cunroll_x_out_3_qc_tpl;

    // out_4_0_imag_mixer_l1_dout_tpl(GPOUT,48)
    assign out_4_0_imag_mixer_l1_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_0_imag_q0_tpl;

    // out_4_0_real_mixer_l1_dout_tpl(GPOUT,49)
    assign out_4_0_real_mixer_l1_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_0_real_q0_tpl;

    // out_4_1_imag_mixer_l1_dout_tpl(GPOUT,50)
    assign out_4_1_imag_mixer_l1_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_1_imag_q0_tpl;

    // out_4_1_real_mixer_l1_dout_tpl(GPOUT,51)
    assign out_4_1_real_mixer_l1_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_1_real_q0_tpl;

    // out_4_2_imag_mixer_l1_dout_tpl(GPOUT,52)
    assign out_4_2_imag_mixer_l1_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_2_imag_q0_tpl;

    // out_4_2_real_mixer_l1_dout_tpl(GPOUT,53)
    assign out_4_2_real_mixer_l1_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_2_real_q0_tpl;

    // out_4_3_imag_mixer_l1_dout_tpl(GPOUT,54)
    assign out_4_3_imag_mixer_l1_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_3_imag_q0_tpl;

    // out_4_3_real_mixer_l1_dout_tpl(GPOUT,55)
    assign out_4_3_real_mixer_l1_dout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_1_3_real_q0_tpl;

    // out_5_mixer_l1_vout_tpl(GPOUT,56)
    assign out_5_mixer_l1_vout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_2_qv_tpl;

    // out_6_mixer_l1_cout_tpl(GPOUT,57)
    assign out_6_mixer_l1_cout_tpl = COMPLEX_MIXER1_vunroll_cunroll_x_out_3_qc_tpl;

endmodule
