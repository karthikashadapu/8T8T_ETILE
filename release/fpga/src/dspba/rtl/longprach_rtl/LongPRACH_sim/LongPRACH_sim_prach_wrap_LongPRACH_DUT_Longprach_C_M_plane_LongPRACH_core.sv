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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core (
    input wire [31:0] busIn_writedata,
    input wire [1:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    input wire [15:0] in_1_imag_din_tpl,
    input wire [15:0] in_1_real_din_tpl,
    input wire [0:0] in_2_vin_tpl,
    input wire [7:0] in_3_cin_tpl,
    input wire [31:0] in_4_TimeRef_tpl,
    input wire [21:0] in_5_cp_start_tpl,
    input wire [22:0] in_6_gt_end_tpl,
    input wire [6:0] in_7_prach_outstart_tpl,
    input wire [9:0] in_8_prach_outend_tpl,
    input wire [0:0] in_9_filt_flush_en_tpl,
    input wire [15:0] in_10_imag_gainin_tpl,
    input wire [15:0] in_10_real_gainin_tpl,
    input wire [15:0] in_11_ch0_info_tpl,
    input wire [15:0] in_12_ch1_info_tpl,
    input wire [15:0] in_13_ch2_info_tpl,
    input wire [15:0] in_14_ch3_info_tpl,
    output wire [15:0] out_1_imag_dout_tpl,
    output wire [15:0] out_1_real_dout_tpl,
    output wire [0:0] out_2_vout_tpl,
    output wire [7:0] out_3_cout_tpl,
    output wire [31:0] out_4_TimeReference_tpl,
    output wire [15:0] out_5_ch_info_tpl,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [31:0] Timeref_capture_fifo_out_1_time_ref_out_tpl;
    wire [15:0] CP_REMOVAL_cunroll_x_out_1_imag_dout_tpl;
    wire [15:0] CP_REMOVAL_cunroll_x_out_1_real_dout_tpl;
    wire [0:0] CP_REMOVAL_cunroll_x_out_2_vout_tpl;
    wire [7:0] CP_REMOVAL_cunroll_x_out_3_cout_tpl;
    wire [0:0] CP_REMOVAL_cunroll_x_out_4_filt_flush_tpl;
    wire [0:0] CP_REMOVAL_cunroll_x_out_5_sync_out_tpl;
    wire [15:0] DECIMATION1_cunroll_x_out_1_imag_dout_tpl;
    wire [15:0] DECIMATION1_cunroll_x_out_1_real_dout_tpl;
    wire [0:0] DECIMATION1_cunroll_x_out_2_vout_tpl;
    wire [7:0] DECIMATION1_cunroll_x_out_3_cout_tpl;
    wire [15:0] FFTShift_cunroll_x_out_1_imag_data_out_tpl;
    wire [15:0] FFTShift_cunroll_x_out_1_real_data_out_tpl;
    wire [0:0] FFTShift_cunroll_x_out_2_valid_out_tpl;
    wire [7:0] FFTShift_cunroll_x_out_3_ch_no_tpl;
    wire [31:0] MIXER_cunroll_x_busOut_readdata;
    wire [0:0] MIXER_cunroll_x_busOut_readdatavalid;
    wire [15:0] MIXER_cunroll_x_out_1_imag_dout_tpl;
    wire [15:0] MIXER_cunroll_x_out_1_real_dout_tpl;
    wire [0:0] MIXER_cunroll_x_out_2_vout_tpl;
    wire [7:0] MIXER_cunroll_x_out_3_cout_tpl;
    wire [15:0] S2B_FFT_cunroll_x_out_1_imag_dout_tpl;
    wire [15:0] S2B_FFT_cunroll_x_out_1_real_dout_tpl;
    wire [0:0] S2B_FFT_cunroll_x_out_2_vout_tpl;
    wire [7:0] S2B_FFT_cunroll_x_out_3_cout_tpl;
    wire [15:0] SYM_SELECT_cunroll_x_out_1_imag_dout_tpl;
    wire [15:0] SYM_SELECT_cunroll_x_out_1_real_dout_tpl;
    wire [0:0] SYM_SELECT_cunroll_x_out_2_vout_tpl;
    wire [7:0] SYM_SELECT_cunroll_x_out_3_cout_tpl;
    wire [15:0] SYM_SELECT_cunroll_x_out_5_ch_info_tpl;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // CP_REMOVAL_cunroll_x(BLACKBOX,7)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL theCP_REMOVAL_cunroll_x (
        .in_1_imag_din_tpl(in_1_imag_din_tpl),
        .in_1_real_din_tpl(in_1_real_din_tpl),
        .in_2_vin_tpl(in_2_vin_tpl),
        .in_3_cin_tpl(in_3_cin_tpl),
        .in_4_cp_start_tpl(in_5_cp_start_tpl),
        .in_5_gt_end_tpl(in_6_gt_end_tpl),
        .in_6_filt_flush_en_tpl(in_9_filt_flush_en_tpl),
        .out_1_imag_dout_tpl(CP_REMOVAL_cunroll_x_out_1_imag_dout_tpl),
        .out_1_real_dout_tpl(CP_REMOVAL_cunroll_x_out_1_real_dout_tpl),
        .out_2_vout_tpl(CP_REMOVAL_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(CP_REMOVAL_cunroll_x_out_3_cout_tpl),
        .out_4_filt_flush_tpl(CP_REMOVAL_cunroll_x_out_4_filt_flush_tpl),
        .out_5_sync_out_tpl(CP_REMOVAL_cunroll_x_out_5_sync_out_tpl),
        .clk(clk),
        .areset(areset)
    );

    // MIXER_cunroll_x(BLACKBOX,12)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER theMIXER_cunroll_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_1_imag_din_tpl(CP_REMOVAL_cunroll_x_out_1_imag_dout_tpl),
        .in_1_real_din_tpl(CP_REMOVAL_cunroll_x_out_1_real_dout_tpl),
        .in_2_vin_tpl(CP_REMOVAL_cunroll_x_out_2_vout_tpl),
        .in_3_chin_tpl(CP_REMOVAL_cunroll_x_out_3_cout_tpl),
        .in_4_sync_tpl(CP_REMOVAL_cunroll_x_out_5_sync_out_tpl),
        .busOut_readdata(MIXER_cunroll_x_busOut_readdata),
        .busOut_readdatavalid(MIXER_cunroll_x_busOut_readdatavalid),
        .out_1_imag_dout_tpl(MIXER_cunroll_x_out_1_imag_dout_tpl),
        .out_1_real_dout_tpl(MIXER_cunroll_x_out_1_real_dout_tpl),
        .out_2_vout_tpl(MIXER_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(MIXER_cunroll_x_out_3_cout_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // busOut(BUSOUT,5)
    assign busOut_readdatavalid = MIXER_cunroll_x_busOut_readdatavalid;
    assign busOut_readdata = MIXER_cunroll_x_busOut_readdata;

    // DECIMATION1_cunroll_x(BLACKBOX,8)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1 theDECIMATION1_cunroll_x (
        .in_1_imag_din_tpl(MIXER_cunroll_x_out_1_imag_dout_tpl),
        .in_1_real_din_tpl(MIXER_cunroll_x_out_1_real_dout_tpl),
        .in_2_vin_tpl(MIXER_cunroll_x_out_2_vout_tpl),
        .in_3_cin_tpl(MIXER_cunroll_x_out_3_cout_tpl),
        .in_4_filt_flush_tpl(CP_REMOVAL_cunroll_x_out_4_filt_flush_tpl),
        .out_1_imag_dout_tpl(DECIMATION1_cunroll_x_out_1_imag_dout_tpl),
        .out_1_real_dout_tpl(DECIMATION1_cunroll_x_out_1_real_dout_tpl),
        .out_2_vout_tpl(DECIMATION1_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(DECIMATION1_cunroll_x_out_3_cout_tpl),
        .clk(clk),
        .areset(areset)
    );

    // S2B_FFT_cunroll_x(BLACKBOX,13)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT theS2B_FFT_cunroll_x (
        .in_1_imag_din_tpl(DECIMATION1_cunroll_x_out_1_imag_dout_tpl),
        .in_1_real_din_tpl(DECIMATION1_cunroll_x_out_1_real_dout_tpl),
        .in_2_vin_tpl(DECIMATION1_cunroll_x_out_2_vout_tpl),
        .in_3_cin_tpl(DECIMATION1_cunroll_x_out_3_cout_tpl),
        .in_4_resetin_tpl(CP_REMOVAL_cunroll_x_out_5_sync_out_tpl),
        .in_5_imag_gainin_tpl(in_10_imag_gainin_tpl),
        .in_5_real_gainin_tpl(in_10_real_gainin_tpl),
        .out_1_imag_dout_tpl(S2B_FFT_cunroll_x_out_1_imag_dout_tpl),
        .out_1_real_dout_tpl(S2B_FFT_cunroll_x_out_1_real_dout_tpl),
        .out_2_vout_tpl(S2B_FFT_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(S2B_FFT_cunroll_x_out_3_cout_tpl),
        .clk(clk),
        .areset(areset)
    );

    // FFTShift_cunroll_x(BLACKBOX,9)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift theFFTShift_cunroll_x (
        .in_1_imag_data_in_tpl(S2B_FFT_cunroll_x_out_1_imag_dout_tpl),
        .in_1_real_data_in_tpl(S2B_FFT_cunroll_x_out_1_real_dout_tpl),
        .in_2_data_valid_tpl(S2B_FFT_cunroll_x_out_2_vout_tpl),
        .in_3_chin_tpl(S2B_FFT_cunroll_x_out_3_cout_tpl),
        .out_1_imag_data_out_tpl(FFTShift_cunroll_x_out_1_imag_data_out_tpl),
        .out_1_real_data_out_tpl(FFTShift_cunroll_x_out_1_real_data_out_tpl),
        .out_2_valid_out_tpl(FFTShift_cunroll_x_out_2_valid_out_tpl),
        .out_3_ch_no_tpl(FFTShift_cunroll_x_out_3_ch_no_tpl),
        .clk(clk),
        .areset(areset)
    );

    // SYM_SELECT_cunroll_x(BLACKBOX,14)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT theSYM_SELECT_cunroll_x (
        .in_1_imag_din_tpl(FFTShift_cunroll_x_out_1_imag_data_out_tpl),
        .in_1_real_din_tpl(FFTShift_cunroll_x_out_1_real_data_out_tpl),
        .in_2_vin_tpl(FFTShift_cunroll_x_out_2_valid_out_tpl),
        .in_3_chin_tpl(FFTShift_cunroll_x_out_3_ch_no_tpl),
        .in_4_TimeRef_tpl(GND_q),
        .in_5_prach_outstart_tpl(in_7_prach_outstart_tpl),
        .in_6_prach_outend_tpl(in_8_prach_outend_tpl),
        .in_7_ch0_info_tpl(in_11_ch0_info_tpl),
        .in_8_ch1_info_tpl(in_12_ch1_info_tpl),
        .in_9_ch2_info_tpl(in_13_ch2_info_tpl),
        .in_10_ch3_info_tpl(in_14_ch3_info_tpl),
        .out_1_imag_dout_tpl(SYM_SELECT_cunroll_x_out_1_imag_dout_tpl),
        .out_1_real_dout_tpl(SYM_SELECT_cunroll_x_out_1_real_dout_tpl),
        .out_2_vout_tpl(SYM_SELECT_cunroll_x_out_2_vout_tpl),
        .out_3_cout_tpl(SYM_SELECT_cunroll_x_out_3_cout_tpl),
        .out_4_TimeReference_tpl(),
        .out_5_ch_info_tpl(SYM_SELECT_cunroll_x_out_5_ch_info_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_1_imag_dout_tpl(GPOUT,31)
    assign out_1_imag_dout_tpl = SYM_SELECT_cunroll_x_out_1_imag_dout_tpl;

    // out_1_real_dout_tpl(GPOUT,32)
    assign out_1_real_dout_tpl = SYM_SELECT_cunroll_x_out_1_real_dout_tpl;

    // out_2_vout_tpl(GPOUT,33)
    assign out_2_vout_tpl = SYM_SELECT_cunroll_x_out_2_vout_tpl;

    // out_3_cout_tpl(GPOUT,34)
    assign out_3_cout_tpl = SYM_SELECT_cunroll_x_out_3_cout_tpl;

    // Timeref_capture_fifo(BLACKBOX,3)
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo theTimeref_capture_fifo (
        .in_1_valid_rd_in_tpl(S2B_FFT_cunroll_x_out_2_vout_tpl),
        .in_2_valid_wr_in_tpl(CP_REMOVAL_cunroll_x_out_2_vout_tpl),
        .in_3_time_ref_in_tpl(in_4_TimeRef_tpl),
        .in_4_channel_wr_in_tpl(CP_REMOVAL_cunroll_x_out_3_cout_tpl),
        .in_5_ch_rd_in_tpl(S2B_FFT_cunroll_x_out_3_cout_tpl),
        .out_1_time_ref_out_tpl(Timeref_capture_fifo_out_1_time_ref_out_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_4_TimeReference_tpl(GPOUT,35)
    assign out_4_TimeReference_tpl = Timeref_capture_fifo_out_1_time_ref_out_tpl;

    // out_5_ch_info_tpl(GPOUT,36)
    assign out_5_ch_info_tpl = SYM_SELECT_cunroll_x_out_5_ch_info_tpl;

endmodule
