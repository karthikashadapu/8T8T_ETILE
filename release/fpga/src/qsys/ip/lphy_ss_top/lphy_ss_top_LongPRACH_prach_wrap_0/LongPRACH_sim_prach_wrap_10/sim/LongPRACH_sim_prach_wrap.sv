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

// SystemVerilog created from LongPRACH_sim_prach_wrap
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap (
    input wire [31:0] busIn_writedata,
    input wire [1:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [0:0] vin0_s,
    input wire [7:0] chin0_s,
    input wire [15:0] din0_im,
    input wire [15:0] din0_re,
    input wire [11:0] RFN_s,
    input wire [7:0] subframe_s,
    input wire [15:0] prach_cfg_idx_s,
    input wire [20:0] cp_len_s,
    input wire [20:0] offset_s,
    input wire [0:0] c_m_plane_sel_s,
    input wire [0:0] prach_tech_s,
    input wire [0:0] filt_flush_en_s,
    input wire [3:0] start_sym_s,
    input wire [7:0] SubFrame_cplane_s,
    input wire [15:0] gain_re_s,
    input wire [15:0] gain_im_s,
    input wire [15:0] ch0_info_s,
    input wire [15:0] ch1_info_s,
    input wire [15:0] ch2_info_s,
    input wire [15:0] ch3_info_s,
    input wire [11:0] RFN_cplane_s,
    output wire [15:0] dout_im,
    output wire [15:0] dout_re,
    output wire [0:0] vout_s,
    output wire [7:0] cout_s,
    output wire [31:0] TimeReference_s,
    output wire [31:0] version_info_s,
    output wire [15:0] ch_info_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [31:0] LongPRACH_DUT_cunroll_x_busOut_readdata;
    wire [0:0] LongPRACH_DUT_cunroll_x_busOut_readdatavalid;
    wire [15:0] LongPRACH_DUT_cunroll_x_out_1_imag_dout_tpl;
    wire [15:0] LongPRACH_DUT_cunroll_x_out_1_real_dout_tpl;
    wire [0:0] LongPRACH_DUT_cunroll_x_out_2_vout_tpl;
    wire [7:0] LongPRACH_DUT_cunroll_x_out_3_cout_tpl;
    wire [31:0] LongPRACH_DUT_cunroll_x_out_4_TimeReference_tpl;
    wire [31:0] LongPRACH_DUT_cunroll_x_out_5_version_info_tpl;
    wire [15:0] LongPRACH_DUT_cunroll_x_out_6_ch_info_tpl;
    reg [0:0] LongPRACH_sim_prach_wrap_readDelayed_q;
    reg [0:0] LongPRACH_sim_prach_wrap_readDelayed_delay_0;
    reg [0:0] LongPRACH_sim_prach_wrap_readDelayed_delay_1;
    wire [0:0] LongPRACH_sim_prach_wrap_readDataValid_q;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // LongPRACH_DUT_cunroll_x(BLACKBOX,7)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT theLongPRACH_DUT_cunroll_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_1_vin0_tpl(vin0_s),
        .in_2_chin0_tpl(chin0_s),
        .in_3_imag_din0_tpl(din0_im),
        .in_3_real_din0_tpl(din0_re),
        .in_4_RFN_tpl(RFN_s),
        .in_5_subframe_tpl(subframe_s),
        .in_6_prach_cfg_idx_tpl(prach_cfg_idx_s),
        .in_7_cp_len_tpl(cp_len_s),
        .in_8_offset_tpl(offset_s),
        .in_9_c_m_plane_sel_tpl(c_m_plane_sel_s),
        .in_10_prach_tech_tpl(prach_tech_s),
        .in_11_filt_flush_en_tpl(filt_flush_en_s),
        .in_12_start_sym_tpl(start_sym_s),
        .in_13_SubFrame_cplane_tpl(SubFrame_cplane_s),
        .in_14_gain_re_tpl(gain_re_s),
        .in_15_gain_im_tpl(gain_im_s),
        .in_16_ch0_info_tpl(ch0_info_s),
        .in_17_ch1_info_tpl(ch1_info_s),
        .in_18_ch2_info_tpl(ch2_info_s),
        .in_19_ch3_info_tpl(ch3_info_s),
        .in_20_RFN_cplane_tpl(RFN_cplane_s),
        .busOut_readdata(LongPRACH_DUT_cunroll_x_busOut_readdata),
        .busOut_readdatavalid(LongPRACH_DUT_cunroll_x_busOut_readdatavalid),
        .out_1_imag_dout_tpl(LongPRACH_DUT_cunroll_x_out_1_imag_dout_tpl),
        .out_1_real_dout_tpl(LongPRACH_DUT_cunroll_x_out_1_real_dout_tpl),
        .out_2_vout_tpl(LongPRACH_DUT_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(LongPRACH_DUT_cunroll_x_out_3_cout_tpl),
        .out_4_TimeReference_tpl(LongPRACH_DUT_cunroll_x_out_4_TimeReference_tpl),
        .out_5_version_info_tpl(LongPRACH_DUT_cunroll_x_out_5_version_info_tpl),
        .out_6_ch_info_tpl(LongPRACH_DUT_cunroll_x_out_6_ch_info_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // LongPRACH_sim_prach_wrap_readDelayed(DELAY,40)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            LongPRACH_sim_prach_wrap_readDelayed_delay_0 <= '0;
        end
        else
        begin
            LongPRACH_sim_prach_wrap_readDelayed_delay_0 <= $unsigned(busIn_read);
        end
    end
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            LongPRACH_sim_prach_wrap_readDelayed_delay_1 <= LongPRACH_sim_prach_wrap_readDelayed_delay_0;
            LongPRACH_sim_prach_wrap_readDelayed_q <= LongPRACH_sim_prach_wrap_readDelayed_delay_1;
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // LongPRACH_sim_prach_wrap_readDataValid(LOGICAL,41)
    assign LongPRACH_sim_prach_wrap_readDataValid_q = LongPRACH_DUT_cunroll_x_busOut_readdatavalid | LongPRACH_sim_prach_wrap_readDelayed_q;

    // busOut(BUSOUT,3)
    assign busOut_readdatavalid = LongPRACH_sim_prach_wrap_readDataValid_q;
    assign busOut_readdata = LongPRACH_DUT_cunroll_x_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // dout_im(GPOUT,29)
    assign dout_im = LongPRACH_DUT_cunroll_x_out_1_imag_dout_tpl;

    // dout_re(GPOUT,30)
    assign dout_re = LongPRACH_DUT_cunroll_x_out_1_real_dout_tpl;

    // vout_s(GPOUT,31)
    assign vout_s = LongPRACH_DUT_cunroll_x_out_2_vout_tpl;

    // cout_s(GPOUT,32)
    assign cout_s = LongPRACH_DUT_cunroll_x_out_3_cout_tpl;

    // TimeReference_s(GPOUT,33)
    assign TimeReference_s = LongPRACH_DUT_cunroll_x_out_4_TimeReference_tpl;

    // version_info_s(GPOUT,34)
    assign version_info_s = LongPRACH_DUT_cunroll_x_out_5_version_info_tpl;

    // ch_info_s(GPOUT,35)
    assign ch_info_s = LongPRACH_DUT_cunroll_x_out_6_ch_info_tpl;

endmodule
