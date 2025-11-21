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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B (
    input wire [0:0] in_2_data_valid_tpl,
    input wire [7:0] in_3_chin_tpl,
    input wire [15:0] in_1_real_data_in_tpl,
    input wire [15:0] in_1_imag_data_in_tpl,
    input wire [0:0] in_4_resetin_tpl,
    output wire [0:0] out_2_valid_out_tpl,
    output wire [7:0] out_3_ch_no_tpl,
    output wire [15:0] out_1_real_data_out_tpl,
    output wire [15:0] out_1_imag_data_out_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [9:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_BitReverse_x_q;
    wire [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_rd_x_q;
    wire [12:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_rd_addr_final_x_q;
    wire [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Add_x_a;
    wire [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Add_x_b;
    logic [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Add_x_o;
    wire [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Add_x_q;
    wire [9:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Const_x_q;
    wire [1:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Mux_x_s;
    reg [9:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Mux_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_And_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_And1_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_And2_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_CmpEQ_x_q;
    wire [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Const1_x_q;
    wire [2:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Const2_x_q;
    wire [2:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Const4_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Finite_State_Machine12_x_out_1_S2B_ToggleRba_tpl;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Finite_State_Machine12_x_out_2_S2B_Go_tpl;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_s;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Not_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Not1_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Not2_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Or_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Xor_x_q;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_running;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_pending;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_v;
    reg [2:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0;
    reg [2:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_e0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_f0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_l0;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_running;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_pending;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v;
    reg [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_q0;
    reg [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_e0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_f0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_l0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_And3_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_And3_x_q;
    wire [15:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_Const6_x_q;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_running;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_pending;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v;
    reg [15:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0;
    reg [15:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_e0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_f0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_l0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_s;
    reg [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_q;
    wire [2:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_BitCombine_x_q;
    wire [12:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_Wr_addr_final_x_q;
    wire [12:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_a;
    wire [9:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_q;
    wire [12:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_wba_x_a;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_wba_x_q;
    wire [13:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x_a;
    wire [13:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x_b;
    logic [13:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x_o;
    wire [13:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x_q;
    wire [13:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_x_a;
    wire [13:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_x_b;
    logic [13:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_x_o;
    wire [13:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_x_q;
    wire [12:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_BitCombine_x_q;
    wire [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Const_x_q;
    wire [1:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Const1_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Mux_x_s;
    reg [13:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Mux_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_datablkwrite2_x_b;
    wire [9:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion_sel_x_b;
    wire [1:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion1_sel_x_b;
    wire [9:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion2_sel_x_b;
    wire [1:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_Convert_sel_x_b;
    wire [12:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_PostCast_primWireOut_sel_x_b;
    wire [12:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b;
    wire [1:0] DualMem_imag_x_addrA_hi_b;
    reg [0:0] DualMem_imag_x_csA0_h;
    reg [0:0] DualMem_imag_x_csA0_e;
    wire [0:0] DualMem_imag_x_csA0_c;
    reg [0:0] DualMem_imag_x_csA1_h;
    reg [0:0] DualMem_imag_x_csA1_e;
    wire [0:0] DualMem_imag_x_csA1_c;
    reg [0:0] DualMem_imag_x_csA2_h;
    reg [0:0] DualMem_imag_x_csA2_e;
    wire [0:0] DualMem_imag_x_csA2_c;
    reg [0:0] DualMem_imag_x_csA3_h;
    reg [0:0] DualMem_imag_x_csA3_e;
    wire [0:0] DualMem_imag_x_csA3_c;
    wire [10:0] DualMem_imag_x_addrA_lo_in;
    wire [10:0] DualMem_imag_x_addrA_lo_b;
    wire [1:0] DualMem_imag_x_addrB_hi_b;
    reg [0:0] DualMem_imag_x_csB0_h;
    reg [0:0] DualMem_imag_x_csB1_h;
    reg [0:0] DualMem_imag_x_csB2_h;
    reg [0:0] DualMem_imag_x_csB3_h;
    wire [10:0] DualMem_imag_x_addrB_lo_in;
    wire [10:0] DualMem_imag_x_addrB_lo_b;
    wire DualMem_imag_x_part0_reset0;
    wire DualMem_imag_x_part0_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part0_ia;
    wire [10:0] DualMem_imag_x_part0_aa;
    wire [10:0] DualMem_imag_x_part0_ab;
    wire [15:0] DualMem_imag_x_part0_iq;
    wire [15:0] DualMem_imag_x_part0_q;
    wire DualMem_imag_x_part1_reset0;
    wire DualMem_imag_x_part1_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part1_ia;
    wire [10:0] DualMem_imag_x_part1_aa;
    wire [10:0] DualMem_imag_x_part1_ab;
    wire [15:0] DualMem_imag_x_part1_iq;
    wire [15:0] DualMem_imag_x_part1_q;
    wire DualMem_imag_x_part2_reset0;
    wire DualMem_imag_x_part2_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part2_ia;
    wire [10:0] DualMem_imag_x_part2_aa;
    wire [10:0] DualMem_imag_x_part2_ab;
    wire [15:0] DualMem_imag_x_part2_iq;
    wire [15:0] DualMem_imag_x_part2_q;
    wire DualMem_imag_x_part3_reset0;
    wire DualMem_imag_x_part3_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part3_ia;
    wire [10:0] DualMem_imag_x_part3_aa;
    wire [10:0] DualMem_imag_x_part3_ab;
    wire [15:0] DualMem_imag_x_part3_iq;
    wire [15:0] DualMem_imag_x_part3_q;
    wire [15:0] DualMem_imag_x_qB_l0_or0_qi;
    reg [15:0] DualMem_imag_x_qB_l0_or0_q;
    reg [0:0] DualMem_real_x_csA0_h;
    reg [0:0] DualMem_real_x_csA0_e;
    wire [0:0] DualMem_real_x_csA0_c;
    reg [0:0] DualMem_real_x_csA1_h;
    reg [0:0] DualMem_real_x_csA1_e;
    wire [0:0] DualMem_real_x_csA1_c;
    reg [0:0] DualMem_real_x_csA2_h;
    reg [0:0] DualMem_real_x_csA2_e;
    wire [0:0] DualMem_real_x_csA2_c;
    reg [0:0] DualMem_real_x_csA3_h;
    reg [0:0] DualMem_real_x_csA3_e;
    wire [0:0] DualMem_real_x_csA3_c;
    reg [0:0] DualMem_real_x_csB0_h;
    reg [0:0] DualMem_real_x_csB1_h;
    reg [0:0] DualMem_real_x_csB2_h;
    reg [0:0] DualMem_real_x_csB3_h;
    wire DualMem_real_x_part0_reset0;
    wire DualMem_real_x_part0_ena_NotRstA;
    wire [15:0] DualMem_real_x_part0_ia;
    wire [10:0] DualMem_real_x_part0_aa;
    wire [10:0] DualMem_real_x_part0_ab;
    wire [15:0] DualMem_real_x_part0_iq;
    wire [15:0] DualMem_real_x_part0_q;
    wire DualMem_real_x_part1_reset0;
    wire DualMem_real_x_part1_ena_NotRstA;
    wire [15:0] DualMem_real_x_part1_ia;
    wire [10:0] DualMem_real_x_part1_aa;
    wire [10:0] DualMem_real_x_part1_ab;
    wire [15:0] DualMem_real_x_part1_iq;
    wire [15:0] DualMem_real_x_part1_q;
    wire DualMem_real_x_part2_reset0;
    wire DualMem_real_x_part2_ena_NotRstA;
    wire [15:0] DualMem_real_x_part2_ia;
    wire [10:0] DualMem_real_x_part2_aa;
    wire [10:0] DualMem_real_x_part2_ab;
    wire [15:0] DualMem_real_x_part2_iq;
    wire [15:0] DualMem_real_x_part2_q;
    wire DualMem_real_x_part3_reset0;
    wire DualMem_real_x_part3_ena_NotRstA;
    wire [15:0] DualMem_real_x_part3_ia;
    wire [10:0] DualMem_real_x_part3_aa;
    wire [10:0] DualMem_real_x_part3_ab;
    wire [15:0] DualMem_real_x_part3_iq;
    wire [15:0] DualMem_real_x_part3_q;
    wire [15:0] DualMem_real_x_qB_l0_or0_qi;
    reg [15:0] DualMem_real_x_qB_l0_or0_q;
    (* preserve_syn_only *) reg [1:0] DualMem_imag_x_addrA_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] DualMem_imag_x_addrA_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] DualMem_imag_x_addrA_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] DualMem_imag_x_addrA_hifan_reg3_q;
    (* preserve_syn_only *) reg [0:0] DualMem_imag_x_weA_fan_reg0_q;
    (* preserve_syn_only *) reg [0:0] DualMem_imag_x_weA_fan_reg1_q;
    (* preserve_syn_only *) reg [0:0] DualMem_imag_x_weA_fan_reg2_q;
    (* preserve_syn_only *) reg [0:0] DualMem_imag_x_weA_fan_reg3_q;
    (* preserve_syn_only *) reg [10:0] DualMem_imag_x_addrA_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] DualMem_imag_x_addrA_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] DualMem_imag_x_addrA_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] DualMem_imag_x_addrA_lofan_reg3_q;
    (* preserve_syn_only *) reg [15:0] DualMem_imag_x_dataA_lofan_reg0_q;
    (* preserve_syn_only *) reg [15:0] DualMem_imag_x_dataA_lofan_reg1_q;
    (* preserve_syn_only *) reg [15:0] DualMem_imag_x_dataA_lofan_reg2_q;
    (* preserve_syn_only *) reg [15:0] DualMem_imag_x_dataA_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] DualMem_imag_x_addrB_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] DualMem_imag_x_addrB_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] DualMem_imag_x_addrB_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] DualMem_imag_x_addrB_hifan_reg3_q;
    (* preserve_syn_only *) reg [10:0] DualMem_imag_x_addrB_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] DualMem_imag_x_addrB_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] DualMem_imag_x_addrB_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] DualMem_imag_x_addrB_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] DualMem_real_x_addrA_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] DualMem_real_x_addrA_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] DualMem_real_x_addrA_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] DualMem_real_x_addrA_hifan_reg3_q;
    (* preserve_syn_only *) reg [0:0] DualMem_real_x_weA_fan_reg0_q;
    (* preserve_syn_only *) reg [0:0] DualMem_real_x_weA_fan_reg1_q;
    (* preserve_syn_only *) reg [0:0] DualMem_real_x_weA_fan_reg2_q;
    (* preserve_syn_only *) reg [0:0] DualMem_real_x_weA_fan_reg3_q;
    (* preserve_syn_only *) reg [10:0] DualMem_real_x_addrA_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] DualMem_real_x_addrA_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] DualMem_real_x_addrA_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] DualMem_real_x_addrA_lofan_reg3_q;
    (* preserve_syn_only *) reg [15:0] DualMem_real_x_dataA_lofan_reg0_q;
    (* preserve_syn_only *) reg [15:0] DualMem_real_x_dataA_lofan_reg1_q;
    (* preserve_syn_only *) reg [15:0] DualMem_real_x_dataA_lofan_reg2_q;
    (* preserve_syn_only *) reg [15:0] DualMem_real_x_dataA_lofan_reg3_q;
    (* preserve_syn_only *) reg [1:0] DualMem_real_x_addrB_hifan_reg0_q;
    (* preserve_syn_only *) reg [1:0] DualMem_real_x_addrB_hifan_reg1_q;
    (* preserve_syn_only *) reg [1:0] DualMem_real_x_addrB_hifan_reg2_q;
    (* preserve_syn_only *) reg [1:0] DualMem_real_x_addrB_hifan_reg3_q;
    (* preserve_syn_only *) reg [10:0] DualMem_real_x_addrB_lofan_reg0_q;
    (* preserve_syn_only *) reg [10:0] DualMem_real_x_addrB_lofan_reg1_q;
    (* preserve_syn_only *) reg [10:0] DualMem_real_x_addrB_lofan_reg2_q;
    (* preserve_syn_only *) reg [10:0] DualMem_real_x_addrB_lofan_reg3_q;
    reg [10:0] redist0_DualMem_imag_x_addrB_lo_b_1_q;
    reg [1:0] redist1_DualMem_imag_x_addrB_hi_b_1_q;
    reg [10:0] redist2_DualMem_imag_x_addrA_lo_b_3_q;
    reg [10:0] redist2_DualMem_imag_x_addrA_lo_b_3_delay_0;
    reg [10:0] redist2_DualMem_imag_x_addrA_lo_b_3_delay_1;
    reg [1:0] redist3_DualMem_imag_x_addrA_hi_b_3_q;
    reg [1:0] redist3_DualMem_imag_x_addrA_hi_b_3_delay_0;
    reg [1:0] redist3_DualMem_imag_x_addrA_hi_b_3_delay_1;
    reg [12:0] redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1_q;
    reg [0:0] redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_1_q;
    reg [10:0] redist6_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_q_1_q;
    reg [0:0] redist7_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_And3_x_q_8_q;
    reg [0:0] redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_q;
    reg [0:0] redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_0;
    reg [0:0] redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_1;
    reg [0:0] redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_2;
    reg [0:0] redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_3;
    reg [0:0] redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_q;
    reg [0:0] redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_delay_0;
    reg [0:0] redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_delay_1;
    reg [0:0] redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_delay_2;
    reg [2:0] redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_q;
    reg [2:0] redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_delay_0;
    reg [2:0] redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_delay_1;
    reg [2:0] redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_delay_2;
    reg [2:0] redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_delay_3;
    reg [0:0] redist11_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_q_1_q;
    reg [0:0] redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_q;
    reg [0:0] redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_delay_0;
    reg [0:0] redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_delay_1;
    reg [15:0] redist13_ChannelIn_cunroll_x_in_1_real_data_in_tpl_3_q;
    reg [15:0] redist13_ChannelIn_cunroll_x_in_1_real_data_in_tpl_3_delay_0;
    reg [15:0] redist13_ChannelIn_cunroll_x_in_1_real_data_in_tpl_3_delay_1;
    reg [15:0] redist14_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_3_q;
    reg [15:0] redist14_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_3_delay_0;
    reg [15:0] redist14_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_3_delay_1;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Not_x(LOGICAL,34)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Not_x_q = ~ (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_q);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Const4_x(CONSTANT,31)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Const4_x_q = $unsigned(3'b011);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_Const6_x(CONSTANT,49)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_Const6_x_q = $unsigned(16'b0000000000111100);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Not2_x(LOGICAL,36)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Not2_x_q = ~ (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_CmpEQ_x_q);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_And2_x(LOGICAL,25)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_And2_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_l0 & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Not2_x_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x(LOOP,51)@3 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_running <= $unsigned(1'b0);
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_pending <= $unsigned(1'b0);
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0 <= 16'b0;
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_e0 <= '1;
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v <= $unsigned(1'b0);
        end
        else
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v <= $unsigned(1'b0);
            if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_And2_x_q == 1'b1)
            begin
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_e0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_Const6_x_q) - $unsigned(16'd1);
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0 <= 16'b0;
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_running <= $unsigned(1'b1);
                if (VCC_q == 1'b1)
                begin
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_pending <= $unsigned(1'b0);
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (VCC_q == 1'b1)
                begin
                    if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_pending == 1'b1)
                    begin
                        LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v <= $unsigned(1'b1);
                    end
                    else if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_running == 1'b1)
                    begin
                        LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v <= $unsigned(1'b1);
                        if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0 == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_e0)
                        begin
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0 <= 16'b0;
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_running <= $unsigned(1'b0);
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0) + $unsigned(16'd1);
                        end
                    end
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_f0 = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0 == 16'b0000000000000000 ? 1'b1 : 1'b0);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_l0 = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0 == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_e0 ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_And3_x(LOGICAL,47)@4 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_And3_x_qi = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_l0;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_And3_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_And3_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_And3_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist7_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_And3_x_q_8(DELAY,190)
    dspba_delay_ver #( .width(1), .depth(7), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    redist7_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_And3_x_q_8 ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_And3_x_q), .xout(redist7_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_And3_x_q_8_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Or_x(LOGICAL,37)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Or_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Finite_State_Machine12_x_out_1_S2B_ToggleRba_tpl | redist7_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Sig_dealy_And3_x_q_8_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Const2_x(CONSTANT,29)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Const2_x_q = $unsigned(3'b100);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x(LOOP,45)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_running <= $unsigned(1'b0);
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_pending <= $unsigned(1'b0);
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0 <= 3'b0;
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_e0 <= '1;
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_v <= $unsigned(1'b0);
        end
        else
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_v <= $unsigned(1'b0);
            if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Finite_State_Machine12_x_out_1_S2B_ToggleRba_tpl == 1'b1)
            begin
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_e0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Const2_x_q) - $unsigned(3'd1);
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0 <= 3'b0;
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_running <= $unsigned(1'b1);
                if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Or_x_q == 1'b1)
                begin
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_pending <= $unsigned(1'b0);
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Or_x_q == 1'b1)
                begin
                    if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_pending == 1'b1)
                    begin
                        LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_v <= $unsigned(1'b1);
                    end
                    else if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_running == 1'b1)
                    begin
                        LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_v <= $unsigned(1'b1);
                        if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0 == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_e0)
                        begin
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0 <= 3'b0;
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_running <= $unsigned(1'b0);
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0) + $unsigned(3'd1);
                        end
                    end
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_f0 = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0 == 3'b000 ? 1'b1 : 1'b0);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_l0 = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0 == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_e0 ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_CmpEQ_x(LOGICAL,26)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_CmpEQ_x_q = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0 == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Const4_x_q ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Const1_x(CONSTANT,28)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Const1_x_q = $unsigned(11'b10000000000);

    // redist6_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_q_1(DELAY,189)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist6_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist6_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_q_1_q <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_q);
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x(MUX,52)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_s = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Finite_State_Machine12_x_out_1_S2B_ToggleRba_tpl;
    always @(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_s or redist6_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_q_1_q or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Const1_x_q)
    begin
        unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_s)
            1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_q = redist6_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_q_1_q;
            1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Const1_x_q;
            default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_q = 11'b0;
        endcase
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x(LOOP,46)@2 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_running <= $unsigned(1'b0);
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_pending <= $unsigned(1'b0);
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_q0 <= 11'b0;
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_e0 <= '1;
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v <= $unsigned(1'b0);
        end
        else
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v <= $unsigned(1'b0);
            if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_v == 1'b1)
            begin
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_e0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_latch_0L_Mux_x_q) - $unsigned(11'd1);
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_q0 <= 11'b0;
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_running <= $unsigned(1'b1);
                if (VCC_q == 1'b1)
                begin
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_pending <= $unsigned(1'b0);
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (VCC_q == 1'b1)
                begin
                    if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_pending == 1'b1)
                    begin
                        LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v <= $unsigned(1'b1);
                    end
                    else if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_running == 1'b1)
                    begin
                        LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v <= $unsigned(1'b1);
                        if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_q0 == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_e0)
                        begin
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_q0 <= 11'b0;
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_running <= $unsigned(1'b0);
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_q0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_q0) + $unsigned(11'd1);
                        end
                    end
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_f0 = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_q0 == 11'b00000000000 ? 1'b1 : 1'b0);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_l0 = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_q0 == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_e0 ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_And_x(LOGICAL,23)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_And_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_l0 & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_CmpEQ_x_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Const1_x(CONSTANT,63)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Const1_x_q = $unsigned(2'b01);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_datablkwrite2_x(BITSELECT,68)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_datablkwrite2_x_b = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x_q[12:12];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Const_x(CONSTANT,62)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Const_x_q = $unsigned(12'b000000000000);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_BitCombine_x(BITJOIN,61)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_BitCombine_x_q = {LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_datablkwrite2_x_b, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Const_x_q};

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x(ADD,58)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x_a = {1'b0, redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1_q};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x_b = {13'b0000000000000, in_2_data_valid_tpl};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x_o = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x_a) + $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x_b);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x_o[13:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Mux_x(MUX,64)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Mux_x_s = in_4_resetin_tpl;
    always @(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Mux_x_s or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x_q or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_BitCombine_x_q)
    begin
        unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Mux_x_s)
            1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Mux_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add_x_q;
            1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Mux_x_q = {1'b0, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_BitCombine_x_q};
            default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Mux_x_q = 14'b0;
        endcase
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x(BITSELECT,78)@0
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Mux_x_q[12:0];

    // redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1(DELAY,187)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b);
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_x(ADD,59)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_x_a = {1'b0, redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1_q};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_x_b = {12'b000000000000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Const1_x_q};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_x_o = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_x_a) + $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_x_b);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_x_o[13:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_PostCast_primWireOut_sel_x(BITSELECT,77)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_PostCast_primWireOut_sel_x_b = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_x_q[12:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_datablkwrite1_x(BITSELECT,67)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_Add1_PostCast_primWireOut_sel_x_b[12:12];

    // redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_1(DELAY,188)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_1_q <= '0;
        end
        else
        begin
            redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_1_q <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b);
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Xor_x(LOGICAL,43)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Xor_x_q = redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_1_q ^ LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_q;

    // redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9(DELAY,192)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_delay_0 <= '0;
            redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_delay_1 <= '0;
            redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_delay_2 <= '0;
            redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_q <= '0;
        end
        else
        begin
            redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_delay_0 <= $unsigned(redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_q);
            redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_delay_1 <= redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_delay_0;
            redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_delay_2 <= redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_delay_1;
            redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_q <= redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_delay_2;
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Not1_x(LOGICAL,35)@12
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Not1_x_q = ~ (redist9_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_9_q);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_And1_x(LOGICAL,24)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_And1_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Not1_x_q & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Xor_x_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Finite_State_Machine12_x(BLACKBOX,32)@2
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FF0000nite_State_Machine12 theLongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Finite_State_Machine12_x (
        .in_1_go_tpl(VCC_q),
        .in_2_WbaNERba_tpl(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_And1_x_q),
        .in_3_LastRd_tpl(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_And_x_q),
        .in_4_ena_tpl(VCC_q),
        .out_1_S2B_ToggleRba_tpl(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Finite_State_Machine12_x_out_1_S2B_ToggleRba_tpl),
        .out_2_S2B_Go_tpl(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Finite_State_Machine12_x_out_2_S2B_Go_tpl),
        .clk(clk),
        .areset(areset)
    );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x(MUX,33)@2 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_s = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Finite_State_Machine12_x_out_2_S2B_Go_tpl;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_q <= 1'b0;
        end
        else
        begin
            unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_s)
                1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_q <= LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_q;
                1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_q <= LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Not_x_q;
                default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_q <= 1'b0;
            endcase
        end
    end

    // redist11_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_q_1(DELAY,194)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist11_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist11_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_q_1_q <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_q);
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion1_sel_x(BITSELECT,70)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion1_sel_x_b = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0[1:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Const_x(CONSTANT,18)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Const_x_q = $unsigned(10'b0000001101);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Mux_x(MUX,22)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Mux_x_s = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion1_sel_x_b;
    always @(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Mux_x_s or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Const_x_q)
    begin
        unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Mux_x_s)
            2'b00 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Mux_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Const_x_q;
            2'b01 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Mux_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Const_x_q;
            2'b10 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Mux_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Const_x_q;
            2'b11 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Mux_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Const_x_q;
            default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Mux_x_q = 10'b0;
        endcase
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion_sel_x(BITSELECT,69)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion_sel_x_b = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_q0[9:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_BitReverse_x(LOGICAL,14)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_BitReverse_x_q = {LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion_sel_x_b[0:0], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion_sel_x_b[1:1], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion_sel_x_b[2:2], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion_sel_x_b[3:3], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion_sel_x_b[4:4], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion_sel_x_b[5:5], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion_sel_x_b[6:6], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion_sel_x_b[7:7], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion_sel_x_b[8:8], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion_sel_x_b[9:9]};

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Add_x(ADD,17)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Add_x_a = {1'b0, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_BitReverse_x_q};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Add_x_b = {1'b0, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Mux_x_q};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Add_x_o = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Add_x_a) + $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Add_x_b);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Add_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Add_x_o[10:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion2_sel_x(BITSELECT,71)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion2_sel_x_b = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_AddrOffset_Add_x_q[9:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_rd_x(BITJOIN,15)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_rd_x_q = {LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion1_sel_x_b, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_Data_Type_Conversion2_sel_x_b};

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_rd_addr_final_x(BITJOIN,16)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_rd_addr_final_x_q = {redist11_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_Mux_x_q_1_q, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_rd_x_q};

    // DualMem_imag_x_addrB_hi(BITSELECT,97)@3
    assign DualMem_imag_x_addrB_hi_b = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_rd_addr_final_x_q[12:11];

    // redist1_DualMem_imag_x_addrB_hi_b_1(DELAY,184)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_DualMem_imag_x_addrB_hi_b_1_q <= '0;
        end
        else
        begin
            redist1_DualMem_imag_x_addrB_hi_b_1_q <= $unsigned(DualMem_imag_x_addrB_hi_b);
        end
    end

    // DualMem_imag_x_addrB_hifan_reg3(REG,154)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrB_hifan_reg3_q <= $unsigned(redist1_DualMem_imag_x_addrB_hi_b_1_q);
        end
    end

    // DualMem_imag_x_csB3(LOOKUP,102)@5
    always @(DualMem_imag_x_addrB_hifan_reg3_q)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hifan_reg3_q)
            2'b11 : DualMem_imag_x_csB3_h = 1'b1;
            default : DualMem_imag_x_csB3_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_addrB_lo(BITSELECT,103)@3
    assign DualMem_imag_x_addrB_lo_in = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_AntennaMap_rd_addr_final_x_q[10:0]);
    assign DualMem_imag_x_addrB_lo_b = $unsigned(DualMem_imag_x_addrB_lo_in[10:0]);

    // redist0_DualMem_imag_x_addrB_lo_b_1(DELAY,183)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_DualMem_imag_x_addrB_lo_b_1_q <= $unsigned(DualMem_imag_x_addrB_lo_b);
        end
    end

    // DualMem_imag_x_addrB_lofan_reg3(REG,158)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrB_lofan_reg3_q <= $unsigned(redist0_DualMem_imag_x_addrB_lo_b_1_q);
        end
    end

    // redist14_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_3(DELAY,197)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist14_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_3_delay_0 <= $unsigned(in_1_imag_data_in_tpl);
            redist14_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_3_delay_1 <= redist14_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_3_delay_0;
            redist14_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_3_q <= redist14_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_3_delay_1;
        end
    end

    // DualMem_imag_x_dataA_lofan_reg3(REG,150)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_dataA_lofan_reg3_q <= $unsigned(redist14_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_3_q);
        end
    end

    // redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3(DELAY,195)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_delay_0 <= '0;
        end
        else
        begin
            redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_delay_0 <= $unsigned(in_2_data_valid_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_delay_1 <= redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_delay_0;
            redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_q <= redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_delay_1;
        end
    end

    // DualMem_imag_x_weA_fan_reg3(REG,142)@4 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            DualMem_imag_x_weA_fan_reg3_q <= $unsigned(1'b0);
        end
        else
        begin
            DualMem_imag_x_weA_fan_reg3_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_q);
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_wba_x(CHOOSEBITS,57)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_wba_x_a = redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1_q;
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_wba_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_wba_x_a[12:12];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_Convert_sel_x(BITSELECT,76)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_Convert_sel_x_b = in_3_chin_tpl[1:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_BitCombine_x(BITJOIN,54)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_BitCombine_x_q = {LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_wba_x_q, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_Convert_sel_x_b};

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x(CHOOSEBITS,56)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_a = redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1_q;
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_q = {LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_a[11:11], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_a[10:10], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_a[9:9], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_a[8:8], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_a[7:7], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_a[6:6], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_a[5:5], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_a[4:4], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_a[3:3], LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_a[2:2]};

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_Wr_addr_final_x(BITJOIN,55)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_Wr_addr_final_x_q = {LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_BitCombine_x_q, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_addr_x_q};

    // DualMem_imag_x_addrA_hi(BITSELECT,87)@1
    assign DualMem_imag_x_addrA_hi_b = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_Wr_addr_final_x_q[12:11];

    // redist3_DualMem_imag_x_addrA_hi_b_3(DELAY,186)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_DualMem_imag_x_addrA_hi_b_3_delay_0 <= $unsigned(DualMem_imag_x_addrA_hi_b);
            redist3_DualMem_imag_x_addrA_hi_b_3_delay_1 <= redist3_DualMem_imag_x_addrA_hi_b_3_delay_0;
            redist3_DualMem_imag_x_addrA_hi_b_3_q <= redist3_DualMem_imag_x_addrA_hi_b_3_delay_1;
        end
    end

    // DualMem_imag_x_addrA_hifan_reg3(REG,138)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrA_hifan_reg3_q <= $unsigned(redist3_DualMem_imag_x_addrA_hi_b_3_q);
        end
    end

    // DualMem_imag_x_csA3(LOOKUP,93)@5
    assign DualMem_imag_x_csA3_c = $unsigned(DualMem_imag_x_weA_fan_reg3_q);
    always @(DualMem_imag_x_addrA_hifan_reg3_q or DualMem_imag_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hifan_reg3_q)
            2'b11 : begin
                        DualMem_imag_x_csA3_h = 1'b1;
                        DualMem_imag_x_csA3_e = DualMem_imag_x_csA3_c;
                    end
            default : begin
                          DualMem_imag_x_csA3_h = 1'b0;
                          DualMem_imag_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_addrA_lo(BITSELECT,94)@1
    assign DualMem_imag_x_addrA_lo_in = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_wr_control_Antenna_Map_Wr_addr_final_x_q[10:0]);
    assign DualMem_imag_x_addrA_lo_b = $unsigned(DualMem_imag_x_addrA_lo_in[10:0]);

    // redist2_DualMem_imag_x_addrA_lo_b_3(DELAY,185)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_DualMem_imag_x_addrA_lo_b_3_delay_0 <= $unsigned(DualMem_imag_x_addrA_lo_b);
            redist2_DualMem_imag_x_addrA_lo_b_3_delay_1 <= redist2_DualMem_imag_x_addrA_lo_b_3_delay_0;
            redist2_DualMem_imag_x_addrA_lo_b_3_q <= redist2_DualMem_imag_x_addrA_lo_b_3_delay_1;
        end
    end

    // DualMem_imag_x_addrA_lofan_reg3(REG,146)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrA_lofan_reg3_q <= $unsigned(redist2_DualMem_imag_x_addrA_lo_b_3_q);
        end
    end

    // DualMem_imag_x_part3(DUALMEM,108)@5 + 2
    assign DualMem_imag_x_part3_ia = $unsigned(DualMem_imag_x_dataA_lofan_reg3_q);
    assign DualMem_imag_x_part3_aa = DualMem_imag_x_addrA_lofan_reg3_q;
    assign DualMem_imag_x_part3_ab = DualMem_imag_x_addrB_lofan_reg3_q;
    assign DualMem_imag_x_part3_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part3_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) DualMem_imag_x_part3_dmem (
        .clocken0(DualMem_imag_x_part3_ena_NotRstA),
        .sclr(DualMem_imag_x_part3_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part3_aa),
        .data_a(DualMem_imag_x_part3_ia),
        .wren_a(DualMem_imag_x_csA3_e[0]),
        .address_b(DualMem_imag_x_part3_ab),
        .q_b(DualMem_imag_x_part3_iq),
        .rden_b(DualMem_imag_x_csB3_h[0]),
        .wren_b(),
        .rden_a(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .addressstall_a(),
        .addressstall_b(),
        .byteena_a(),
        .byteena_b(),
        .eccencbypass(),
        .eccencparity(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign DualMem_imag_x_part3_q = DualMem_imag_x_part3_iq[15:0];

    // DualMem_imag_x_addrB_hifan_reg2(REG,153)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrB_hifan_reg2_q <= $unsigned(redist1_DualMem_imag_x_addrB_hi_b_1_q);
        end
    end

    // DualMem_imag_x_csB2(LOOKUP,101)@5
    always @(DualMem_imag_x_addrB_hifan_reg2_q)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hifan_reg2_q)
            2'b10 : DualMem_imag_x_csB2_h = 1'b1;
            default : DualMem_imag_x_csB2_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_addrB_lofan_reg2(REG,157)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrB_lofan_reg2_q <= $unsigned(redist0_DualMem_imag_x_addrB_lo_b_1_q);
        end
    end

    // DualMem_imag_x_dataA_lofan_reg2(REG,149)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_dataA_lofan_reg2_q <= $unsigned(redist14_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_3_q);
        end
    end

    // DualMem_imag_x_weA_fan_reg2(REG,141)@4 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            DualMem_imag_x_weA_fan_reg2_q <= $unsigned(1'b0);
        end
        else
        begin
            DualMem_imag_x_weA_fan_reg2_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_q);
        end
    end

    // DualMem_imag_x_addrA_hifan_reg2(REG,137)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrA_hifan_reg2_q <= $unsigned(redist3_DualMem_imag_x_addrA_hi_b_3_q);
        end
    end

    // DualMem_imag_x_csA2(LOOKUP,92)@5
    assign DualMem_imag_x_csA2_c = $unsigned(DualMem_imag_x_weA_fan_reg2_q);
    always @(DualMem_imag_x_addrA_hifan_reg2_q or DualMem_imag_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hifan_reg2_q)
            2'b10 : begin
                        DualMem_imag_x_csA2_h = 1'b1;
                        DualMem_imag_x_csA2_e = DualMem_imag_x_csA2_c;
                    end
            default : begin
                          DualMem_imag_x_csA2_h = 1'b0;
                          DualMem_imag_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_addrA_lofan_reg2(REG,145)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrA_lofan_reg2_q <= $unsigned(redist2_DualMem_imag_x_addrA_lo_b_3_q);
        end
    end

    // DualMem_imag_x_part2(DUALMEM,107)@5 + 2
    assign DualMem_imag_x_part2_ia = $unsigned(DualMem_imag_x_dataA_lofan_reg2_q);
    assign DualMem_imag_x_part2_aa = DualMem_imag_x_addrA_lofan_reg2_q;
    assign DualMem_imag_x_part2_ab = DualMem_imag_x_addrB_lofan_reg2_q;
    assign DualMem_imag_x_part2_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part2_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) DualMem_imag_x_part2_dmem (
        .clocken0(DualMem_imag_x_part2_ena_NotRstA),
        .sclr(DualMem_imag_x_part2_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part2_aa),
        .data_a(DualMem_imag_x_part2_ia),
        .wren_a(DualMem_imag_x_csA2_e[0]),
        .address_b(DualMem_imag_x_part2_ab),
        .q_b(DualMem_imag_x_part2_iq),
        .rden_b(DualMem_imag_x_csB2_h[0]),
        .wren_b(),
        .rden_a(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .addressstall_a(),
        .addressstall_b(),
        .byteena_a(),
        .byteena_b(),
        .eccencbypass(),
        .eccencparity(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign DualMem_imag_x_part2_q = DualMem_imag_x_part2_iq[15:0];

    // DualMem_imag_x_addrB_hifan_reg1(REG,152)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrB_hifan_reg1_q <= $unsigned(redist1_DualMem_imag_x_addrB_hi_b_1_q);
        end
    end

    // DualMem_imag_x_csB1(LOOKUP,100)@5
    always @(DualMem_imag_x_addrB_hifan_reg1_q)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hifan_reg1_q)
            2'b01 : DualMem_imag_x_csB1_h = 1'b1;
            default : DualMem_imag_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_addrB_lofan_reg1(REG,156)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrB_lofan_reg1_q <= $unsigned(redist0_DualMem_imag_x_addrB_lo_b_1_q);
        end
    end

    // DualMem_imag_x_dataA_lofan_reg1(REG,148)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_dataA_lofan_reg1_q <= $unsigned(redist14_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_3_q);
        end
    end

    // DualMem_imag_x_weA_fan_reg1(REG,140)@4 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            DualMem_imag_x_weA_fan_reg1_q <= $unsigned(1'b0);
        end
        else
        begin
            DualMem_imag_x_weA_fan_reg1_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_q);
        end
    end

    // DualMem_imag_x_addrA_hifan_reg1(REG,136)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrA_hifan_reg1_q <= $unsigned(redist3_DualMem_imag_x_addrA_hi_b_3_q);
        end
    end

    // DualMem_imag_x_csA1(LOOKUP,91)@5
    assign DualMem_imag_x_csA1_c = $unsigned(DualMem_imag_x_weA_fan_reg1_q);
    always @(DualMem_imag_x_addrA_hifan_reg1_q or DualMem_imag_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hifan_reg1_q)
            2'b01 : begin
                        DualMem_imag_x_csA1_h = 1'b1;
                        DualMem_imag_x_csA1_e = DualMem_imag_x_csA1_c;
                    end
            default : begin
                          DualMem_imag_x_csA1_h = 1'b0;
                          DualMem_imag_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_addrA_lofan_reg1(REG,144)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrA_lofan_reg1_q <= $unsigned(redist2_DualMem_imag_x_addrA_lo_b_3_q);
        end
    end

    // DualMem_imag_x_part1(DUALMEM,106)@5 + 2
    assign DualMem_imag_x_part1_ia = $unsigned(DualMem_imag_x_dataA_lofan_reg1_q);
    assign DualMem_imag_x_part1_aa = DualMem_imag_x_addrA_lofan_reg1_q;
    assign DualMem_imag_x_part1_ab = DualMem_imag_x_addrB_lofan_reg1_q;
    assign DualMem_imag_x_part1_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part1_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) DualMem_imag_x_part1_dmem (
        .clocken0(DualMem_imag_x_part1_ena_NotRstA),
        .sclr(DualMem_imag_x_part1_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part1_aa),
        .data_a(DualMem_imag_x_part1_ia),
        .wren_a(DualMem_imag_x_csA1_e[0]),
        .address_b(DualMem_imag_x_part1_ab),
        .q_b(DualMem_imag_x_part1_iq),
        .rden_b(DualMem_imag_x_csB1_h[0]),
        .wren_b(),
        .rden_a(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .addressstall_a(),
        .addressstall_b(),
        .byteena_a(),
        .byteena_b(),
        .eccencbypass(),
        .eccencparity(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign DualMem_imag_x_part1_q = DualMem_imag_x_part1_iq[15:0];

    // DualMem_imag_x_addrB_hifan_reg0(REG,151)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrB_hifan_reg0_q <= $unsigned(redist1_DualMem_imag_x_addrB_hi_b_1_q);
        end
    end

    // DualMem_imag_x_csB0(LOOKUP,99)@5
    always @(DualMem_imag_x_addrB_hifan_reg0_q)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hifan_reg0_q)
            2'b00 : DualMem_imag_x_csB0_h = 1'b1;
            default : DualMem_imag_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_addrB_lofan_reg0(REG,155)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrB_lofan_reg0_q <= $unsigned(redist0_DualMem_imag_x_addrB_lo_b_1_q);
        end
    end

    // DualMem_imag_x_dataA_lofan_reg0(REG,147)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_dataA_lofan_reg0_q <= $unsigned(redist14_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_3_q);
        end
    end

    // DualMem_imag_x_weA_fan_reg0(REG,139)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_weA_fan_reg0_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_q);
        end
    end

    // DualMem_imag_x_addrA_hifan_reg0(REG,135)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrA_hifan_reg0_q <= $unsigned(redist3_DualMem_imag_x_addrA_hi_b_3_q);
        end
    end

    // DualMem_imag_x_csA0(LOOKUP,90)@5
    assign DualMem_imag_x_csA0_c = $unsigned(DualMem_imag_x_weA_fan_reg0_q);
    always @(DualMem_imag_x_addrA_hifan_reg0_q or DualMem_imag_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hifan_reg0_q)
            2'b00 : begin
                        DualMem_imag_x_csA0_h = 1'b1;
                        DualMem_imag_x_csA0_e = DualMem_imag_x_csA0_c;
                    end
            default : begin
                          DualMem_imag_x_csA0_h = 1'b0;
                          DualMem_imag_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_addrA_lofan_reg0(REG,143)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_imag_x_addrA_lofan_reg0_q <= $unsigned(redist2_DualMem_imag_x_addrA_lo_b_3_q);
        end
    end

    // DualMem_imag_x_part0(DUALMEM,105)@5 + 2
    assign DualMem_imag_x_part0_ia = $unsigned(DualMem_imag_x_dataA_lofan_reg0_q);
    assign DualMem_imag_x_part0_aa = DualMem_imag_x_addrA_lofan_reg0_q;
    assign DualMem_imag_x_part0_ab = DualMem_imag_x_addrB_lofan_reg0_q;
    assign DualMem_imag_x_part0_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part0_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) DualMem_imag_x_part0_dmem (
        .clocken0(DualMem_imag_x_part0_ena_NotRstA),
        .sclr(DualMem_imag_x_part0_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part0_aa),
        .data_a(DualMem_imag_x_part0_ia),
        .wren_a(DualMem_imag_x_csA0_e[0]),
        .address_b(DualMem_imag_x_part0_ab),
        .q_b(DualMem_imag_x_part0_iq),
        .rden_b(DualMem_imag_x_csB0_h[0]),
        .wren_b(),
        .rden_a(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .addressstall_a(),
        .addressstall_b(),
        .byteena_a(),
        .byteena_b(),
        .eccencbypass(),
        .eccencparity(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign DualMem_imag_x_part0_q = DualMem_imag_x_part0_iq[15:0];

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // DualMem_imag_x_qB_l0_or0(LOGICAL,110)@7 + 1
    assign DualMem_imag_x_qB_l0_or0_qi = DualMem_imag_x_part0_q | DualMem_imag_x_part1_q | DualMem_imag_x_part2_q | DualMem_imag_x_part3_q;
    dspba_delay_ver #( .width(16), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    DualMem_imag_x_qB_l0_or0_delay ( .xin(DualMem_imag_x_qB_l0_or0_qi), .xout(DualMem_imag_x_qB_l0_or0_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // DualMem_real_x_addrB_hifan_reg3(REG,178)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrB_hifan_reg3_q <= $unsigned(redist1_DualMem_imag_x_addrB_hi_b_1_q);
        end
    end

    // DualMem_real_x_csB3(LOOKUP,126)@5
    always @(DualMem_real_x_addrB_hifan_reg3_q)
    begin
        // Begin reserved scope level
        unique case (DualMem_real_x_addrB_hifan_reg3_q)
            2'b11 : DualMem_real_x_csB3_h = 1'b1;
            default : DualMem_real_x_csB3_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_real_x_addrB_lofan_reg3(REG,182)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrB_lofan_reg3_q <= $unsigned(redist0_DualMem_imag_x_addrB_lo_b_1_q);
        end
    end

    // redist13_ChannelIn_cunroll_x_in_1_real_data_in_tpl_3(DELAY,196)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_ChannelIn_cunroll_x_in_1_real_data_in_tpl_3_delay_0 <= $unsigned(in_1_real_data_in_tpl);
            redist13_ChannelIn_cunroll_x_in_1_real_data_in_tpl_3_delay_1 <= redist13_ChannelIn_cunroll_x_in_1_real_data_in_tpl_3_delay_0;
            redist13_ChannelIn_cunroll_x_in_1_real_data_in_tpl_3_q <= redist13_ChannelIn_cunroll_x_in_1_real_data_in_tpl_3_delay_1;
        end
    end

    // DualMem_real_x_dataA_lofan_reg3(REG,174)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_dataA_lofan_reg3_q <= $unsigned(redist13_ChannelIn_cunroll_x_in_1_real_data_in_tpl_3_q);
        end
    end

    // DualMem_real_x_weA_fan_reg3(REG,166)@4 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            DualMem_real_x_weA_fan_reg3_q <= $unsigned(1'b0);
        end
        else
        begin
            DualMem_real_x_weA_fan_reg3_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_q);
        end
    end

    // DualMem_real_x_addrA_hifan_reg3(REG,162)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrA_hifan_reg3_q <= $unsigned(redist3_DualMem_imag_x_addrA_hi_b_3_q);
        end
    end

    // DualMem_real_x_csA3(LOOKUP,117)@5
    assign DualMem_real_x_csA3_c = $unsigned(DualMem_real_x_weA_fan_reg3_q);
    always @(DualMem_real_x_addrA_hifan_reg3_q or DualMem_real_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_real_x_addrA_hifan_reg3_q)
            2'b11 : begin
                        DualMem_real_x_csA3_h = 1'b1;
                        DualMem_real_x_csA3_e = DualMem_real_x_csA3_c;
                    end
            default : begin
                          DualMem_real_x_csA3_h = 1'b0;
                          DualMem_real_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_real_x_addrA_lofan_reg3(REG,170)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrA_lofan_reg3_q <= $unsigned(redist2_DualMem_imag_x_addrA_lo_b_3_q);
        end
    end

    // DualMem_real_x_part3(DUALMEM,132)@5 + 2
    assign DualMem_real_x_part3_ia = $unsigned(DualMem_real_x_dataA_lofan_reg3_q);
    assign DualMem_real_x_part3_aa = DualMem_real_x_addrA_lofan_reg3_q;
    assign DualMem_real_x_part3_ab = DualMem_real_x_addrB_lofan_reg3_q;
    assign DualMem_real_x_part3_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part3_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) DualMem_real_x_part3_dmem (
        .clocken0(DualMem_real_x_part3_ena_NotRstA),
        .sclr(DualMem_real_x_part3_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part3_aa),
        .data_a(DualMem_real_x_part3_ia),
        .wren_a(DualMem_real_x_csA3_e[0]),
        .address_b(DualMem_real_x_part3_ab),
        .q_b(DualMem_real_x_part3_iq),
        .rden_b(DualMem_real_x_csB3_h[0]),
        .wren_b(),
        .rden_a(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .addressstall_a(),
        .addressstall_b(),
        .byteena_a(),
        .byteena_b(),
        .eccencbypass(),
        .eccencparity(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign DualMem_real_x_part3_q = DualMem_real_x_part3_iq[15:0];

    // DualMem_real_x_addrB_hifan_reg2(REG,177)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrB_hifan_reg2_q <= $unsigned(redist1_DualMem_imag_x_addrB_hi_b_1_q);
        end
    end

    // DualMem_real_x_csB2(LOOKUP,125)@5
    always @(DualMem_real_x_addrB_hifan_reg2_q)
    begin
        // Begin reserved scope level
        unique case (DualMem_real_x_addrB_hifan_reg2_q)
            2'b10 : DualMem_real_x_csB2_h = 1'b1;
            default : DualMem_real_x_csB2_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_real_x_addrB_lofan_reg2(REG,181)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrB_lofan_reg2_q <= $unsigned(redist0_DualMem_imag_x_addrB_lo_b_1_q);
        end
    end

    // DualMem_real_x_dataA_lofan_reg2(REG,173)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_dataA_lofan_reg2_q <= $unsigned(redist13_ChannelIn_cunroll_x_in_1_real_data_in_tpl_3_q);
        end
    end

    // DualMem_real_x_weA_fan_reg2(REG,165)@4 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            DualMem_real_x_weA_fan_reg2_q <= $unsigned(1'b0);
        end
        else
        begin
            DualMem_real_x_weA_fan_reg2_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_q);
        end
    end

    // DualMem_real_x_addrA_hifan_reg2(REG,161)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrA_hifan_reg2_q <= $unsigned(redist3_DualMem_imag_x_addrA_hi_b_3_q);
        end
    end

    // DualMem_real_x_csA2(LOOKUP,116)@5
    assign DualMem_real_x_csA2_c = $unsigned(DualMem_real_x_weA_fan_reg2_q);
    always @(DualMem_real_x_addrA_hifan_reg2_q or DualMem_real_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_real_x_addrA_hifan_reg2_q)
            2'b10 : begin
                        DualMem_real_x_csA2_h = 1'b1;
                        DualMem_real_x_csA2_e = DualMem_real_x_csA2_c;
                    end
            default : begin
                          DualMem_real_x_csA2_h = 1'b0;
                          DualMem_real_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_real_x_addrA_lofan_reg2(REG,169)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrA_lofan_reg2_q <= $unsigned(redist2_DualMem_imag_x_addrA_lo_b_3_q);
        end
    end

    // DualMem_real_x_part2(DUALMEM,131)@5 + 2
    assign DualMem_real_x_part2_ia = $unsigned(DualMem_real_x_dataA_lofan_reg2_q);
    assign DualMem_real_x_part2_aa = DualMem_real_x_addrA_lofan_reg2_q;
    assign DualMem_real_x_part2_ab = DualMem_real_x_addrB_lofan_reg2_q;
    assign DualMem_real_x_part2_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part2_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) DualMem_real_x_part2_dmem (
        .clocken0(DualMem_real_x_part2_ena_NotRstA),
        .sclr(DualMem_real_x_part2_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part2_aa),
        .data_a(DualMem_real_x_part2_ia),
        .wren_a(DualMem_real_x_csA2_e[0]),
        .address_b(DualMem_real_x_part2_ab),
        .q_b(DualMem_real_x_part2_iq),
        .rden_b(DualMem_real_x_csB2_h[0]),
        .wren_b(),
        .rden_a(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .addressstall_a(),
        .addressstall_b(),
        .byteena_a(),
        .byteena_b(),
        .eccencbypass(),
        .eccencparity(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign DualMem_real_x_part2_q = DualMem_real_x_part2_iq[15:0];

    // DualMem_real_x_addrB_hifan_reg1(REG,176)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrB_hifan_reg1_q <= $unsigned(redist1_DualMem_imag_x_addrB_hi_b_1_q);
        end
    end

    // DualMem_real_x_csB1(LOOKUP,124)@5
    always @(DualMem_real_x_addrB_hifan_reg1_q)
    begin
        // Begin reserved scope level
        unique case (DualMem_real_x_addrB_hifan_reg1_q)
            2'b01 : DualMem_real_x_csB1_h = 1'b1;
            default : DualMem_real_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_real_x_addrB_lofan_reg1(REG,180)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrB_lofan_reg1_q <= $unsigned(redist0_DualMem_imag_x_addrB_lo_b_1_q);
        end
    end

    // DualMem_real_x_dataA_lofan_reg1(REG,172)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_dataA_lofan_reg1_q <= $unsigned(redist13_ChannelIn_cunroll_x_in_1_real_data_in_tpl_3_q);
        end
    end

    // DualMem_real_x_weA_fan_reg1(REG,164)@4 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            DualMem_real_x_weA_fan_reg1_q <= $unsigned(1'b0);
        end
        else
        begin
            DualMem_real_x_weA_fan_reg1_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_q);
        end
    end

    // DualMem_real_x_addrA_hifan_reg1(REG,160)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrA_hifan_reg1_q <= $unsigned(redist3_DualMem_imag_x_addrA_hi_b_3_q);
        end
    end

    // DualMem_real_x_csA1(LOOKUP,115)@5
    assign DualMem_real_x_csA1_c = $unsigned(DualMem_real_x_weA_fan_reg1_q);
    always @(DualMem_real_x_addrA_hifan_reg1_q or DualMem_real_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_real_x_addrA_hifan_reg1_q)
            2'b01 : begin
                        DualMem_real_x_csA1_h = 1'b1;
                        DualMem_real_x_csA1_e = DualMem_real_x_csA1_c;
                    end
            default : begin
                          DualMem_real_x_csA1_h = 1'b0;
                          DualMem_real_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_real_x_addrA_lofan_reg1(REG,168)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrA_lofan_reg1_q <= $unsigned(redist2_DualMem_imag_x_addrA_lo_b_3_q);
        end
    end

    // DualMem_real_x_part1(DUALMEM,130)@5 + 2
    assign DualMem_real_x_part1_ia = $unsigned(DualMem_real_x_dataA_lofan_reg1_q);
    assign DualMem_real_x_part1_aa = DualMem_real_x_addrA_lofan_reg1_q;
    assign DualMem_real_x_part1_ab = DualMem_real_x_addrB_lofan_reg1_q;
    assign DualMem_real_x_part1_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part1_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) DualMem_real_x_part1_dmem (
        .clocken0(DualMem_real_x_part1_ena_NotRstA),
        .sclr(DualMem_real_x_part1_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part1_aa),
        .data_a(DualMem_real_x_part1_ia),
        .wren_a(DualMem_real_x_csA1_e[0]),
        .address_b(DualMem_real_x_part1_ab),
        .q_b(DualMem_real_x_part1_iq),
        .rden_b(DualMem_real_x_csB1_h[0]),
        .wren_b(),
        .rden_a(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .addressstall_a(),
        .addressstall_b(),
        .byteena_a(),
        .byteena_b(),
        .eccencbypass(),
        .eccencparity(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign DualMem_real_x_part1_q = DualMem_real_x_part1_iq[15:0];

    // DualMem_real_x_addrB_hifan_reg0(REG,175)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrB_hifan_reg0_q <= $unsigned(redist1_DualMem_imag_x_addrB_hi_b_1_q);
        end
    end

    // DualMem_real_x_csB0(LOOKUP,123)@5
    always @(DualMem_real_x_addrB_hifan_reg0_q)
    begin
        // Begin reserved scope level
        unique case (DualMem_real_x_addrB_hifan_reg0_q)
            2'b00 : DualMem_real_x_csB0_h = 1'b1;
            default : DualMem_real_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_real_x_addrB_lofan_reg0(REG,179)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrB_lofan_reg0_q <= $unsigned(redist0_DualMem_imag_x_addrB_lo_b_1_q);
        end
    end

    // DualMem_real_x_dataA_lofan_reg0(REG,171)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_dataA_lofan_reg0_q <= $unsigned(redist13_ChannelIn_cunroll_x_in_1_real_data_in_tpl_3_q);
        end
    end

    // DualMem_real_x_weA_fan_reg0(REG,163)@4 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            DualMem_real_x_weA_fan_reg0_q <= $unsigned(1'b0);
        end
        else
        begin
            DualMem_real_x_weA_fan_reg0_q <= $unsigned(redist12_ChannelIn_cunroll_x_in_2_data_valid_tpl_3_q);
        end
    end

    // DualMem_real_x_addrA_hifan_reg0(REG,159)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrA_hifan_reg0_q <= $unsigned(redist3_DualMem_imag_x_addrA_hi_b_3_q);
        end
    end

    // DualMem_real_x_csA0(LOOKUP,114)@5
    assign DualMem_real_x_csA0_c = $unsigned(DualMem_real_x_weA_fan_reg0_q);
    always @(DualMem_real_x_addrA_hifan_reg0_q or DualMem_real_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_real_x_addrA_hifan_reg0_q)
            2'b00 : begin
                        DualMem_real_x_csA0_h = 1'b1;
                        DualMem_real_x_csA0_e = DualMem_real_x_csA0_c;
                    end
            default : begin
                          DualMem_real_x_csA0_h = 1'b0;
                          DualMem_real_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_real_x_addrA_lofan_reg0(REG,167)@4 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            DualMem_real_x_addrA_lofan_reg0_q <= $unsigned(redist2_DualMem_imag_x_addrA_lo_b_3_q);
        end
    end

    // DualMem_real_x_part0(DUALMEM,129)@5 + 2
    assign DualMem_real_x_part0_ia = $unsigned(DualMem_real_x_dataA_lofan_reg0_q);
    assign DualMem_real_x_part0_aa = DualMem_real_x_addrA_lofan_reg0_q;
    assign DualMem_real_x_part0_ab = DualMem_real_x_addrB_lofan_reg0_q;
    assign DualMem_real_x_part0_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part0_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(11),
        .numwords_a(2048),
        .width_b(16),
        .widthad_b(11),
        .numwords_b(2048),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) DualMem_real_x_part0_dmem (
        .clocken0(DualMem_real_x_part0_ena_NotRstA),
        .sclr(DualMem_real_x_part0_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part0_aa),
        .data_a(DualMem_real_x_part0_ia),
        .wren_a(DualMem_real_x_csA0_e[0]),
        .address_b(DualMem_real_x_part0_ab),
        .q_b(DualMem_real_x_part0_iq),
        .rden_b(DualMem_real_x_csB0_h[0]),
        .wren_b(),
        .rden_a(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .addressstall_a(),
        .addressstall_b(),
        .byteena_a(),
        .byteena_b(),
        .eccencbypass(),
        .eccencparity(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign DualMem_real_x_part0_q = DualMem_real_x_part0_iq[15:0];

    // DualMem_real_x_qB_l0_or0(LOGICAL,134)@7 + 1
    assign DualMem_real_x_qB_l0_or0_qi = DualMem_real_x_part0_q | DualMem_real_x_part1_q | DualMem_real_x_part2_q | DualMem_real_x_part3_q;
    dspba_delay_ver #( .width(16), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    DualMem_real_x_qB_l0_or0_delay ( .xin(DualMem_real_x_qB_l0_or0_qi), .xout(DualMem_real_x_qB_l0_or0_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5(DELAY,193)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_delay_0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0);
            redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_delay_1 <= redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_delay_0;
            redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_delay_2 <= redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_delay_1;
            redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_delay_3 <= redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_delay_2;
            redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_q <= redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_delay_3;
        end
    end

    // redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5(DELAY,191)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_0 <= '0;
            redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_1 <= '0;
            redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_2 <= '0;
            redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_3 <= '0;
            redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_q <= '0;
        end
        else
        begin
            redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v);
            redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_1 <= redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_0;
            redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_2 <= redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_1;
            redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_3 <= redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_2;
            redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_q <= redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_delay_3;
        end
    end

    // ChannelOut_cunroll_x(PORTOUT,11)@8 + 1
    assign out_2_valid_out_tpl = redist8_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt2_databank_x_v_5_q;
    assign out_3_ch_no_tpl = {5'b00000, redist10_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_S2B_S2B_control_Mem_rd_control_Mem_rd_sub1_cnt1_membank_x_q0_5_q};
    assign out_1_real_data_out_tpl = DualMem_real_x_qB_l0_or0_q;
    assign out_1_imag_data_out_tpl = DualMem_imag_x_qB_l0_or0_q;

endmodule
