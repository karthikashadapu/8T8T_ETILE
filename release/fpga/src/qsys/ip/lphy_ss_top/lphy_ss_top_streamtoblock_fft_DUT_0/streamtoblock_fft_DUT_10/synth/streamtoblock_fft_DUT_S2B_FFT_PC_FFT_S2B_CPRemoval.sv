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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval (
    input wire [0:0] in_2_vin_tpl,
    input wire [7:0] in_3_cin_tpl,
    input wire [15:0] in_1_real_datain_tpl,
    input wire [15:0] in_1_imag_datain_tpl,
    input wire [15:0] in_4_CPlen_tpl,
    input wire [3:0] in_5_fftlen_tpl,
    input wire [2:0] in_6_NumAxc_tpl,
    input wire [63:0] in_7_time_in_tpl,
    input wire [15:0] in_8_nprb_in_tpl,
    input wire [63:0] in_9_sym_metadata_in_tpl,
    input wire [0:0] in_10_sym_metadata_in_valid_tpl,
    output wire [0:0] out_1_vout_x_tpl,
    output wire [7:0] out_2_cout_tpl,
    output wire [15:0] out_3_real_dout_tpl,
    output wire [15:0] out_3_imag_dout_tpl,
    output wire [63:0] out_4_time_out_tpl,
    output wire [15:0] out_5_nprb_out_tpl,
    output wire [3:0] out_6_fft_size_out_tpl,
    output wire [1:0] out_7_eAxC_no_tpl,
    output wire [63:0] out_8_sym_metadata_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [2:0] BitCombine_q;
    wire [14:0] Wr_addr_final_q;
    wire [1:0] datablkwrite_b;
    wire [13:0] rd_q;
    wire [14:0] rd_addr_final_q;
    wire [11:0] Data_Type_Conversion_sel_x_b;
    wire [1:0] Data_Type_Conversion1_sel_x_b;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Const5_x_q;
    reg [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt;
    reg [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dec;
    wire [4:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dn;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_en;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_i;
    reg [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_inc;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_ld;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_q;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_up;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_And_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_Not1_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_And_x_q;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ1_x_b;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ1_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x_q;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_Const13_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And1_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_CmpEQ_x_q;
    wire [2:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Const2_x_q;
    wire [2:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Const4_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Finite_State_Machine_x_out_1_S2B_ToggleRba_tpl;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Finite_State_Machine_x_out_2_S2B_Go_tpl;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_s;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Not_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Not1_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Not2_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Or_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Xor_x_q;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_running;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_pending;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_v;
    reg [2:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_q0;
    reg [2:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_e0;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_f0;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_l0;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_running;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_pending;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v;
    reg [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_q0;
    reg [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_e0;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_f0;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_l0;
    reg [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt;
    reg [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dec;
    wire [4:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dn;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_en;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_i;
    reg [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_inc;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_ld;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_q;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_up;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_And_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_And_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_Not1_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_Not1_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_And_x_q;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ1_x_b;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ1_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_And3_x_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_Const6_x_q;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_running;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_pending;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v;
    reg [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0;
    reg [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_e0;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_f0;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_l0;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_s;
    reg [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_1L_Mux_x_s;
    reg [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_1L_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_1_S2B_cnt2E_tpl;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_4_S2B_latch_tpl;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_s;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Not_x_q;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_running;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_pending;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v;
    reg [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0;
    reg [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_e0;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_f0;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_l0;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_running;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_pending;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v;
    reg [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0;
    reg [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_e0;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_f0;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_l0;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_And_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_And_x_q;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_CmpEQ_x_a;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_CmpEQ_x_q;
    wire [4:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Const3_x_q;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Sub_x_a;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Sub_x_b;
    logic [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Sub_x_o;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Sub_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_And_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_And_x_q;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_CmpEQ_x_a;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_CmpEQ_x_q;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_Sub_x_a;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_Sub_x_b;
    logic [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_Sub_x_o;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_Sub_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_latch_0L2_Mux_x_s;
    reg [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_latch_0L2_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_latch_0L2_Mux_x_s;
    reg [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_latch_0L2_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_s;
    reg [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_s;
    reg [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_reset;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_f;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_e;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_t;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_empty;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_v;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_RISING_EDGE3_And_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_RISING_EDGE3_Not1_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x_s;
    reg [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x_q;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_b;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ1_x_q;
    wire [52:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Const1_x_q;
    wire [51:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Const12_x_q;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Const3_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_x_s;
    reg [52:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux2_x_s;
    reg [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux2_x_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_reset;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_f;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_e;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_t;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_empty;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_v;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x_s;
    reg [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_reset;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_f;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_e;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_t;
    wire [63:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_empty;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_v;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_And_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_And_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_Not1_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_Not1_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_And_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_Not1_x_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_reset;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_f;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_e;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_t;
    wire [63:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_empty;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_v;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_RISING_EDGE1_And_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_RISING_EDGE1_Not1_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_RISING_EDGE1_Not1_x_q;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_sel_x_b;
    wire [52:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_PreShift_1_q;
    wire [52:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_PreShift_1_qint;
    wire [2:0] cz_uid209_LShift_q;
    wire [1:0] leftShiftStage0Idx2Pad2_uid214_LShift_q;
    wire [1:0] leftShiftStage0_uid221_LShift_s;
    reg [15:0] leftShiftStage0_uid221_LShift_q;
    wire [3:0] leftShiftStage1Idx1Pad4_uid222_LShift_q;
    wire [11:0] leftShiftStage1Idx1Rng4_uid223_LShift_in;
    wire [11:0] leftShiftStage1Idx1Rng4_uid223_LShift_b;
    wire [15:0] leftShiftStage1Idx1_uid224_LShift_q;
    wire [7:0] leftShiftStage1Idx2Pad8_uid225_LShift_q;
    wire [7:0] leftShiftStage1Idx2Rng8_uid226_LShift_in;
    wire [7:0] leftShiftStage1Idx2Rng8_uid226_LShift_b;
    wire [15:0] leftShiftStage1Idx2_uid227_LShift_q;
    wire [11:0] leftShiftStage1Idx3Pad12_uid228_LShift_q;
    wire [3:0] leftShiftStage1Idx3Rng12_uid229_LShift_in;
    wire [3:0] leftShiftStage1Idx3Rng12_uid229_LShift_b;
    wire [15:0] leftShiftStage1Idx3_uid230_LShift_q;
    wire [1:0] leftShiftStage1_uid232_LShift_s;
    reg [15:0] leftShiftStage1_uid232_LShift_q;
    wire [15:0] rightShiftStage0Idx1Rng1_uid236_wraddr_b;
    wire [16:0] rightShiftStage0Idx1_uid238_wraddr_q;
    wire [14:0] rightShiftStage0Idx2Rng2_uid239_wraddr_b;
    wire [16:0] rightShiftStage0Idx2_uid241_wraddr_q;
    wire [13:0] rightShiftStage0Idx3Rng3_uid242_wraddr_b;
    wire [16:0] rightShiftStage0Idx3_uid244_wraddr_q;
    wire [1:0] rightShiftStage0_uid246_wraddr_s;
    reg [16:0] rightShiftStage0_uid246_wraddr_q;
    wire [12:0] rightShiftStage1Idx1Rng4_uid247_wraddr_b;
    wire [16:0] rightShiftStage1Idx1_uid249_wraddr_q;
    wire [0:0] rightShiftStage1_uid251_wraddr_s;
    reg [16:0] rightShiftStage1_uid251_wraddr_q;
    wire [11:0] shifter_uid252_wraddr_in;
    wire [11:0] shifter_uid252_wraddr_b;
    wire [0:0] xMSB_uid257_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x_b;
    wire [2:0] sR_topExtension_uid259_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x_q;
    wire [18:0] sR_mergedSignalTM_uid261_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x_q;
    wire [14:0] leftShiftStage0Idx1Rng1_uid291_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in;
    wire [14:0] leftShiftStage0Idx1Rng1_uid291_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b;
    wire [15:0] leftShiftStage0Idx1_uid292_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q;
    wire [13:0] leftShiftStage0Idx2Rng2_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in;
    wire [13:0] leftShiftStage0Idx2Rng2_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b;
    wire [15:0] leftShiftStage0Idx2_uid295_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q;
    wire [12:0] leftShiftStage0Idx3Rng3_uid297_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in;
    wire [12:0] leftShiftStage0Idx3Rng3_uid297_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b;
    wire [15:0] leftShiftStage0Idx3_uid298_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q;
    wire [1:0] leftShiftStage0_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_s;
    reg [15:0] leftShiftStage0_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q;
    wire [11:0] leftShiftStage1Idx1Rng4_uid302_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in;
    wire [11:0] leftShiftStage1Idx1Rng4_uid302_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b;
    wire [15:0] leftShiftStage1Idx1_uid303_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q;
    wire [0:0] leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_s;
    reg [15:0] leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q;
    wire [11:0] shifter_uid306_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in;
    wire [11:0] shifter_uid306_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b;
    wire [0:0] xMSB_uid307_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b;
    wire [16:0] xPaddedSigned_uid309_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q;
    wire [15:0] leftShiftStage0Idx1Rng1_uid311_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_in;
    wire [15:0] leftShiftStage0Idx1Rng1_uid311_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b;
    wire [16:0] leftShiftStage0Idx1_uid312_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q;
    wire [14:0] leftShiftStage0Idx2Rng2_uid314_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_in;
    wire [14:0] leftShiftStage0Idx2Rng2_uid314_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b;
    wire [16:0] leftShiftStage0Idx2_uid315_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q;
    wire [13:0] leftShiftStage0Idx3Rng3_uid317_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_in;
    wire [13:0] leftShiftStage0Idx3Rng3_uid317_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b;
    wire [16:0] leftShiftStage0Idx3_uid318_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q;
    wire [1:0] leftShiftStage0_uid320_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_s;
    reg [16:0] leftShiftStage0_uid320_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q;
    wire [12:0] leftShiftStage1Idx1Rng4_uid322_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_in;
    wire [12:0] leftShiftStage1Idx1Rng4_uid322_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b;
    wire [16:0] leftShiftStage1Idx1_uid323_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q;
    wire [0:0] leftShiftStage1_uid325_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_s;
    reg [16:0] leftShiftStage1_uid325_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjA2_q;
    wire [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjB4_q;
    wire [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjB9_q;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjB14_q;
    wire [53:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_align_1_q;
    wire [53:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_align_1_qint;
    wire [3:0] DualMem_imag_x_addrA_hi_b;
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
    reg [0:0] DualMem_imag_x_csA4_h;
    reg [0:0] DualMem_imag_x_csA4_e;
    wire [0:0] DualMem_imag_x_csA4_c;
    reg [0:0] DualMem_imag_x_csA5_h;
    reg [0:0] DualMem_imag_x_csA5_e;
    wire [0:0] DualMem_imag_x_csA5_c;
    reg [0:0] DualMem_imag_x_csA6_h;
    reg [0:0] DualMem_imag_x_csA6_e;
    wire [0:0] DualMem_imag_x_csA6_c;
    reg [0:0] DualMem_imag_x_csA7_h;
    reg [0:0] DualMem_imag_x_csA7_e;
    wire [0:0] DualMem_imag_x_csA7_c;
    reg [0:0] DualMem_imag_x_csA8_h;
    reg [0:0] DualMem_imag_x_csA8_e;
    wire [0:0] DualMem_imag_x_csA8_c;
    reg [0:0] DualMem_imag_x_csA9_h;
    reg [0:0] DualMem_imag_x_csA9_e;
    wire [0:0] DualMem_imag_x_csA9_c;
    reg [0:0] DualMem_imag_x_csA10_h;
    reg [0:0] DualMem_imag_x_csA10_e;
    wire [0:0] DualMem_imag_x_csA10_c;
    reg [0:0] DualMem_imag_x_csA11_h;
    reg [0:0] DualMem_imag_x_csA11_e;
    wire [0:0] DualMem_imag_x_csA11_c;
    reg [0:0] DualMem_imag_x_csA12_h;
    reg [0:0] DualMem_imag_x_csA12_e;
    wire [0:0] DualMem_imag_x_csA12_c;
    reg [0:0] DualMem_imag_x_csA13_h;
    reg [0:0] DualMem_imag_x_csA13_e;
    wire [0:0] DualMem_imag_x_csA13_c;
    reg [0:0] DualMem_imag_x_csA14_h;
    reg [0:0] DualMem_imag_x_csA14_e;
    wire [0:0] DualMem_imag_x_csA14_c;
    reg [0:0] DualMem_imag_x_csA15_h;
    reg [0:0] DualMem_imag_x_csA15_e;
    wire [0:0] DualMem_imag_x_csA15_c;
    wire [10:0] DualMem_imag_x_addrA_lo_in;
    wire [10:0] DualMem_imag_x_addrA_lo_b;
    wire [3:0] DualMem_imag_x_addrB_hi_b;
    reg [0:0] DualMem_imag_x_csB0_h;
    reg [0:0] DualMem_imag_x_csB1_h;
    reg [0:0] DualMem_imag_x_csB2_h;
    reg [0:0] DualMem_imag_x_csB3_h;
    reg [0:0] DualMem_imag_x_csB4_h;
    reg [0:0] DualMem_imag_x_csB5_h;
    reg [0:0] DualMem_imag_x_csB6_h;
    reg [0:0] DualMem_imag_x_csB7_h;
    reg [0:0] DualMem_imag_x_csB8_h;
    reg [0:0] DualMem_imag_x_csB9_h;
    reg [0:0] DualMem_imag_x_csB10_h;
    reg [0:0] DualMem_imag_x_csB11_h;
    reg [0:0] DualMem_imag_x_csB12_h;
    reg [0:0] DualMem_imag_x_csB13_h;
    reg [0:0] DualMem_imag_x_csB14_h;
    reg [0:0] DualMem_imag_x_csB15_h;
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
    wire DualMem_imag_x_part4_reset0;
    wire DualMem_imag_x_part4_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part4_ia;
    wire [10:0] DualMem_imag_x_part4_aa;
    wire [10:0] DualMem_imag_x_part4_ab;
    wire [15:0] DualMem_imag_x_part4_iq;
    wire [15:0] DualMem_imag_x_part4_q;
    wire DualMem_imag_x_part5_reset0;
    wire DualMem_imag_x_part5_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part5_ia;
    wire [10:0] DualMem_imag_x_part5_aa;
    wire [10:0] DualMem_imag_x_part5_ab;
    wire [15:0] DualMem_imag_x_part5_iq;
    wire [15:0] DualMem_imag_x_part5_q;
    wire DualMem_imag_x_part6_reset0;
    wire DualMem_imag_x_part6_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part6_ia;
    wire [10:0] DualMem_imag_x_part6_aa;
    wire [10:0] DualMem_imag_x_part6_ab;
    wire [15:0] DualMem_imag_x_part6_iq;
    wire [15:0] DualMem_imag_x_part6_q;
    wire DualMem_imag_x_part7_reset0;
    wire DualMem_imag_x_part7_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part7_ia;
    wire [10:0] DualMem_imag_x_part7_aa;
    wire [10:0] DualMem_imag_x_part7_ab;
    wire [15:0] DualMem_imag_x_part7_iq;
    wire [15:0] DualMem_imag_x_part7_q;
    wire DualMem_imag_x_part8_reset0;
    wire DualMem_imag_x_part8_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part8_ia;
    wire [10:0] DualMem_imag_x_part8_aa;
    wire [10:0] DualMem_imag_x_part8_ab;
    wire [15:0] DualMem_imag_x_part8_iq;
    wire [15:0] DualMem_imag_x_part8_q;
    wire DualMem_imag_x_part9_reset0;
    wire DualMem_imag_x_part9_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part9_ia;
    wire [10:0] DualMem_imag_x_part9_aa;
    wire [10:0] DualMem_imag_x_part9_ab;
    wire [15:0] DualMem_imag_x_part9_iq;
    wire [15:0] DualMem_imag_x_part9_q;
    wire DualMem_imag_x_part10_reset0;
    wire DualMem_imag_x_part10_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part10_ia;
    wire [10:0] DualMem_imag_x_part10_aa;
    wire [10:0] DualMem_imag_x_part10_ab;
    wire [15:0] DualMem_imag_x_part10_iq;
    wire [15:0] DualMem_imag_x_part10_q;
    wire DualMem_imag_x_part11_reset0;
    wire DualMem_imag_x_part11_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part11_ia;
    wire [10:0] DualMem_imag_x_part11_aa;
    wire [10:0] DualMem_imag_x_part11_ab;
    wire [15:0] DualMem_imag_x_part11_iq;
    wire [15:0] DualMem_imag_x_part11_q;
    wire DualMem_imag_x_part12_reset0;
    wire DualMem_imag_x_part12_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part12_ia;
    wire [10:0] DualMem_imag_x_part12_aa;
    wire [10:0] DualMem_imag_x_part12_ab;
    wire [15:0] DualMem_imag_x_part12_iq;
    wire [15:0] DualMem_imag_x_part12_q;
    wire DualMem_imag_x_part13_reset0;
    wire DualMem_imag_x_part13_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part13_ia;
    wire [10:0] DualMem_imag_x_part13_aa;
    wire [10:0] DualMem_imag_x_part13_ab;
    wire [15:0] DualMem_imag_x_part13_iq;
    wire [15:0] DualMem_imag_x_part13_q;
    wire DualMem_imag_x_part14_reset0;
    wire DualMem_imag_x_part14_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part14_ia;
    wire [10:0] DualMem_imag_x_part14_aa;
    wire [10:0] DualMem_imag_x_part14_ab;
    wire [15:0] DualMem_imag_x_part14_iq;
    wire [15:0] DualMem_imag_x_part14_q;
    wire DualMem_imag_x_part15_reset0;
    wire DualMem_imag_x_part15_ena_NotRstA;
    wire [15:0] DualMem_imag_x_part15_ia;
    wire [10:0] DualMem_imag_x_part15_aa;
    wire [10:0] DualMem_imag_x_part15_ab;
    wire [15:0] DualMem_imag_x_part15_iq;
    wire [15:0] DualMem_imag_x_part15_q;
    wire [15:0] DualMem_imag_x_qB_l0_or0_q;
    wire [15:0] DualMem_imag_x_qB_l0_or1_q;
    wire [15:0] DualMem_imag_x_qB_l0_or2_q;
    wire [15:0] DualMem_imag_x_qB_l0_or3_q;
    wire [15:0] DualMem_imag_x_qB_l1_or0_q;
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
    wire DualMem_real_x_part4_reset0;
    wire DualMem_real_x_part4_ena_NotRstA;
    wire [15:0] DualMem_real_x_part4_ia;
    wire [10:0] DualMem_real_x_part4_aa;
    wire [10:0] DualMem_real_x_part4_ab;
    wire [15:0] DualMem_real_x_part4_iq;
    wire [15:0] DualMem_real_x_part4_q;
    wire DualMem_real_x_part5_reset0;
    wire DualMem_real_x_part5_ena_NotRstA;
    wire [15:0] DualMem_real_x_part5_ia;
    wire [10:0] DualMem_real_x_part5_aa;
    wire [10:0] DualMem_real_x_part5_ab;
    wire [15:0] DualMem_real_x_part5_iq;
    wire [15:0] DualMem_real_x_part5_q;
    wire DualMem_real_x_part6_reset0;
    wire DualMem_real_x_part6_ena_NotRstA;
    wire [15:0] DualMem_real_x_part6_ia;
    wire [10:0] DualMem_real_x_part6_aa;
    wire [10:0] DualMem_real_x_part6_ab;
    wire [15:0] DualMem_real_x_part6_iq;
    wire [15:0] DualMem_real_x_part6_q;
    wire DualMem_real_x_part7_reset0;
    wire DualMem_real_x_part7_ena_NotRstA;
    wire [15:0] DualMem_real_x_part7_ia;
    wire [10:0] DualMem_real_x_part7_aa;
    wire [10:0] DualMem_real_x_part7_ab;
    wire [15:0] DualMem_real_x_part7_iq;
    wire [15:0] DualMem_real_x_part7_q;
    wire DualMem_real_x_part8_reset0;
    wire DualMem_real_x_part8_ena_NotRstA;
    wire [15:0] DualMem_real_x_part8_ia;
    wire [10:0] DualMem_real_x_part8_aa;
    wire [10:0] DualMem_real_x_part8_ab;
    wire [15:0] DualMem_real_x_part8_iq;
    wire [15:0] DualMem_real_x_part8_q;
    wire DualMem_real_x_part9_reset0;
    wire DualMem_real_x_part9_ena_NotRstA;
    wire [15:0] DualMem_real_x_part9_ia;
    wire [10:0] DualMem_real_x_part9_aa;
    wire [10:0] DualMem_real_x_part9_ab;
    wire [15:0] DualMem_real_x_part9_iq;
    wire [15:0] DualMem_real_x_part9_q;
    wire DualMem_real_x_part10_reset0;
    wire DualMem_real_x_part10_ena_NotRstA;
    wire [15:0] DualMem_real_x_part10_ia;
    wire [10:0] DualMem_real_x_part10_aa;
    wire [10:0] DualMem_real_x_part10_ab;
    wire [15:0] DualMem_real_x_part10_iq;
    wire [15:0] DualMem_real_x_part10_q;
    wire DualMem_real_x_part11_reset0;
    wire DualMem_real_x_part11_ena_NotRstA;
    wire [15:0] DualMem_real_x_part11_ia;
    wire [10:0] DualMem_real_x_part11_aa;
    wire [10:0] DualMem_real_x_part11_ab;
    wire [15:0] DualMem_real_x_part11_iq;
    wire [15:0] DualMem_real_x_part11_q;
    wire DualMem_real_x_part12_reset0;
    wire DualMem_real_x_part12_ena_NotRstA;
    wire [15:0] DualMem_real_x_part12_ia;
    wire [10:0] DualMem_real_x_part12_aa;
    wire [10:0] DualMem_real_x_part12_ab;
    wire [15:0] DualMem_real_x_part12_iq;
    wire [15:0] DualMem_real_x_part12_q;
    wire DualMem_real_x_part13_reset0;
    wire DualMem_real_x_part13_ena_NotRstA;
    wire [15:0] DualMem_real_x_part13_ia;
    wire [10:0] DualMem_real_x_part13_aa;
    wire [10:0] DualMem_real_x_part13_ab;
    wire [15:0] DualMem_real_x_part13_iq;
    wire [15:0] DualMem_real_x_part13_q;
    wire DualMem_real_x_part14_reset0;
    wire DualMem_real_x_part14_ena_NotRstA;
    wire [15:0] DualMem_real_x_part14_ia;
    wire [10:0] DualMem_real_x_part14_aa;
    wire [10:0] DualMem_real_x_part14_ab;
    wire [15:0] DualMem_real_x_part14_iq;
    wire [15:0] DualMem_real_x_part14_q;
    wire DualMem_real_x_part15_reset0;
    wire DualMem_real_x_part15_ena_NotRstA;
    wire [15:0] DualMem_real_x_part15_ia;
    wire [10:0] DualMem_real_x_part15_aa;
    wire [10:0] DualMem_real_x_part15_ab;
    wire [15:0] DualMem_real_x_part15_iq;
    wire [15:0] DualMem_real_x_part15_q;
    wire [15:0] DualMem_real_x_qB_l0_or0_q;
    wire [15:0] DualMem_real_x_qB_l0_or1_q;
    wire [15:0] DualMem_real_x_qB_l0_or2_q;
    wire [15:0] DualMem_real_x_qB_l0_or3_q;
    wire [15:0] DualMem_real_x_qB_l1_or0_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_reset;
    wire [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_a0;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_c0;
    wire [35:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_s0;
    wire [35:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_qq0;
    reg [35:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_ena0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_ena1;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_ena2;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_reset;
    wire [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_a0;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_c0;
    wire [35:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_s0;
    wire [35:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_qq0;
    reg [35:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_ena0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_ena1;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_ena2;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_reset;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_a0;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_c0;
    wire [34:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_s0;
    wire [34:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_qq0;
    reg [34:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_ena0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_ena1;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_ena2;
    wire [59:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_a;
    wire [59:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_b;
    logic [59:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_o;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_c;
    wire [58:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_q;
    wire [14:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_a;
    wire [14:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_b;
    logic [14:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_o;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_cin;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_q;
    wire [71:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitJoin_for_q_q;
    wire [58:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q;
    wire [58:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_b_q;
    wire [1:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_bias_q;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_trunc_q;
    wire [68:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_trunc_qint;
    wire [19:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_add_a;
    wire [19:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_add_b;
    logic [19:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_add_o;
    wire [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_add_q;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_shift_q;
    wire [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_shift_qint;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_bs_in;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_bs_b;
    wire [1:0] leftShiftStageSel0Dto0_uid220_LShift_bit_select_merged_b;
    wire [1:0] leftShiftStageSel0Dto0_uid220_LShift_bit_select_merged_c;
    wire [1:0] rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_b;
    wire [0:0] rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_c;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bs3_bit_select_merged_b;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bs3_bit_select_merged_c;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bs3_bit_select_merged_d;
    wire [22:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_b;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c;
    wire [15:0] xPadded_uid210_LShift_q_const_q;
    wire [15:0] leftShiftStage0Idx1_uid213_LShift_q_const_q;
    wire [15:0] leftShiftStage0Idx2_uid216_LShift_q_const_q;
    wire [15:0] leftShiftStage0Idx3_uid219_LShift_q_const_q;
    wire [4:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_b_tessel0_1_bit_select_merged_b_const_q;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_b_tessel0_1_bit_select_merged_c_const_q;
    reg [11:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c_1_q;
    reg [1:0] redist1_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_b_1_q;
    reg [1:0] redist2_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_b_2_q;
    reg [0:0] redist3_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_c_1_q;
    reg [0:0] redist4_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_c_2_q;
    reg [58:0] redist5_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_q_1_q;
    reg [34:0] redist6_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_q_1_q;
    reg [35:0] redist7_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_q_1_q;
    reg [35:0] redist8_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_q_1_q;
    reg [11:0] redist9_shifter_uid306_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b_1_q;
    reg [10:0] redist10_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_sel_x_b_1_q;
    reg [0:0] redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_And_x_q_2_q;
    reg [0:0] redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_And_x_q_2_delay_0;
    reg [0:0] redist12_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_And_x_q_7_q;
    reg [63:0] redist13_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_q_2_q;
    reg [63:0] redist13_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_q_2_delay_0;
    reg [3:0] redist14_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x_q_2_q;
    reg [0:0] redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q_4_q;
    reg [0:0] redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q_4_delay_0;
    reg [0:0] redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q_4_delay_1;
    reg [15:0] redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x_q_2_q;
    reg [15:0] redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_q_1_q;
    reg [15:0] redist18_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q_1_q;
    reg [0:0] redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_And_x_q_10_q;
    reg [0:0] redist20_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_And_x_q_7_q;
    reg [0:0] redist21_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v_1_q;
    reg [16:0] redist22_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0_1_q;
    reg [0:0] redist23_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v_2_q;
    reg [0:0] redist23_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v_2_delay_0;
    reg [11:0] redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0_2_q;
    reg [11:0] redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0_2_delay_0;
    reg [0:0] redist25_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_q_1_q;
    reg [0:0] redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_1_S2B_cnt2E_tpl_2_q;
    reg [0:0] redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_1_S2B_cnt2E_tpl_2_delay_0;
    reg [0:0] redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_2_q;
    reg [0:0] redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_2_delay_0;
    reg [0:0] redist28_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_3_q;
    reg [18:0] redist29_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_q_1_q;
    reg [0:0] redist30_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_1_q;
    reg [0:0] redist31_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_2_q;
    reg [0:0] redist32_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_9_q;
    reg [0:0] redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_l0_2_q;
    reg [0:0] redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_l0_2_delay_0;
    reg [0:0] redist34_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_q_1_q;
    reg [0:0] redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_CmpEQ_x_q_2_q;
    reg [0:0] redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_CmpEQ_x_q_2_delay_0;
    reg [0:0] redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_q;
    reg [0:0] redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_0;
    reg [0:0] redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_1;
    reg [0:0] redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_2;
    reg [0:0] redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_3;
    reg [0:0] redist37_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And_x_q_1_q;
    reg [1:0] redist38_Data_Type_Conversion1_sel_x_b_2_q;
    reg [1:0] redist38_Data_Type_Conversion1_sel_x_b_2_delay_0;
    reg [0:0] redist39_ChannelIn_cunroll_x_in_2_vin_tpl_7_q;
    reg [3:0] redist43_ChannelIn_cunroll_x_in_5_fftlen_tpl_6_q;
    reg [3:0] redist44_ChannelIn_cunroll_x_in_5_fftlen_tpl_8_q;
    reg [3:0] redist44_ChannelIn_cunroll_x_in_5_fftlen_tpl_8_delay_0;
    reg [2:0] redist45_ChannelIn_cunroll_x_in_6_NumAxc_tpl_7_q;
    reg [0:0] redist49_ChannelIn_cunroll_x_in_10_sym_metadata_in_valid_tpl_1_q;
    wire redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_reset0;
    wire [15:0] redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_ia;
    wire [2:0] redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_aa;
    wire [2:0] redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_ab;
    wire [15:0] redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_iq;
    wire [15:0] redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q;
    wire [2:0] redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_wraddr_i = 3'b111;
    wire [3:0] redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_rdcnt_a;
    wire [3:0] redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_rdcnt_b;
    logic [3:0] redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_rdcnt_o;
    wire [3:0] redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_rdcnt_q;
    wire redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_reset0;
    wire [15:0] redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_ia;
    wire [2:0] redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_aa;
    wire [2:0] redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_ab;
    wire [15:0] redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_iq;
    wire [15:0] redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q;
    wire [2:0] redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_wraddr_i = 3'b111;
    wire [3:0] redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_rdcnt_a;
    wire [3:0] redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_rdcnt_b;
    logic [3:0] redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_rdcnt_o;
    wire [3:0] redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_rdcnt_q;
    reg [15:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_outputreg0_q;
    wire redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_reset0;
    wire redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_ena_OrRstB;
    wire [15:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_ia;
    wire [2:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_aa;
    wire [2:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_ab;
    wire [15:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_iq;
    wire [15:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_q;
    wire [2:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_i;
    (* preserve_syn_only *) reg redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_eq;
    reg [2:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_wraddr_q;
    wire [3:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_last_q;
    wire [3:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_cmp_b;
    wire [0:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_cmp_q;
    (* preserve_syn_only *) reg [0:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_cmpReg_q;
    wire [0:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_notEnable_q;
    wire [0:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_nor_q;
    (* preserve_syn_only *) reg [0:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_sticky_ena_q;
    wire [0:0] redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_enaAnd_q;
    wire redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_reset0;
    wire [63:0] redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_ia;
    wire [3:0] redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_aa;
    wire [3:0] redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_ab;
    wire [63:0] redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_iq;
    wire [63:0] redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_q;
    wire [3:0] redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [3:0] redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_wraddr_i = 4'b1111;
    wire [3:0] redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_offset_q;
    wire [4:0] redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_rdcnt_a;
    wire [4:0] redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_rdcnt_b;
    logic [4:0] redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_rdcnt_o;
    wire [4:0] redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_rdcnt_q;
    wire redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_reset0;
    wire [15:0] redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_ia;
    wire [2:0] redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_aa;
    wire [2:0] redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_ab;
    wire [15:0] redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_iq;
    wire [15:0] redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_q;
    wire [2:0] redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_wraddr_i = 3'b111;
    wire [3:0] redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_rdcnt_a;
    wire [3:0] redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_rdcnt_b;
    logic [3:0] redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_rdcnt_o;
    wire [3:0] redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_rdcnt_q;
    wire redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_reset0;
    wire [63:0] redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_ia;
    wire [2:0] redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_aa;
    wire [2:0] redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_ab;
    wire [63:0] redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_iq;
    wire [63:0] redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_q;
    wire [2:0] redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_wraddr_i = 3'b111;
    wire [3:0] redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_rdcnt_a;
    wire [3:0] redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_rdcnt_b;
    logic [3:0] redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_rdcnt_o;
    wire [3:0] redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_rdcnt_q;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Const4_x(CONSTANT,58)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Const4_x_q = $unsigned(3'b011);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_Const6_x(CONSTANT,92)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_Const6_x_q = $unsigned(16'b0000000100100000);

    // redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_CmpEQ_x_q_2(DELAY,558)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_CmpEQ_x_q_2_delay_0 <= '0;
            redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_CmpEQ_x_q_2_q <= '0;
        end
        else
        begin
            redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_CmpEQ_x_q_2_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_CmpEQ_x_q);
            redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_CmpEQ_x_q_2_q <= redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_CmpEQ_x_q_2_delay_0;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Not2_x(LOGICAL,64)@10
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Not2_x_q = ~ (redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_CmpEQ_x_q_2_q);

    // redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_l0_2(DELAY,556)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_l0_2_delay_0 <= '0;
            redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_l0_2_q <= '0;
        end
        else
        begin
            redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_l0_2_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_l0);
            redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_l0_2_q <= redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_l0_2_delay_0;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x(LOGICAL,52)@10 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_qi = redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_l0_2_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Not2_x_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6(DELAY,559)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_0 <= '0;
            redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_1 <= '0;
            redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_2 <= '0;
            redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_3 <= '0;
            redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_q <= '0;
        end
        else
        begin
            redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q);
            redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_1 <= redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_0;
            redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_2 <= redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_1;
            redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_3 <= redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_2;
            redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_q <= redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_delay_3;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x(LOOP,94)@16 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_running <= $unsigned(1'b0);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_pending <= $unsigned(1'b0);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0 <= 16'b0;
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_e0 <= '1;
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v <= $unsigned(1'b0);
        end
        else
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v <= $unsigned(1'b0);
            if (redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And2_x_q_6_q == 1'b1)
            begin
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_e0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_Const6_x_q) - $unsigned(16'd1);
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0 <= 16'b0;
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_running <= $unsigned(1'b1);
                if (VCC_q == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_pending <= $unsigned(1'b0);
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (VCC_q == 1'b1)
                begin
                    if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_pending == 1'b1)
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v <= $unsigned(1'b1);
                    end
                    else if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_running == 1'b1)
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v <= $unsigned(1'b1);
                        if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0 == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_e0)
                        begin
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0 <= 16'b0;
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_running <= $unsigned(1'b0);
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0) + $unsigned(16'd1);
                        end
                    end
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_f0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0 == 16'b0000000000000000 ? 1'b1 : 1'b0);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_l0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_q0 == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_e0 ? 1'b1 : 1'b0);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_And3_x(LOGICAL,90)@17
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_And3_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_v & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_cnt2_databank1_x_l0;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Or_x(LOGICAL,65)@7
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Or_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Finite_State_Machine_x_out_1_S2B_ToggleRba_tpl | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Sig_dealy_And3_x_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Const2_x(CONSTANT,56)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Const2_x_q = $unsigned(3'b100);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Not_x(LOGICAL,62)@7
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Not_x_q = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_q);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x(MUX,61)@7 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Finite_State_Machine_x_out_2_S2B_Go_tpl;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_q <= 1'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Not_x_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_q <= 1'b0;
            endcase
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Not_x(LOGICAL,106)@7
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Not_x_q = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_q);

    // leftShiftStage1Idx1Rng4_uid322_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x(BITSELECT,321)@7
    assign leftShiftStage1Idx1Rng4_uid322_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_in = leftShiftStage0_uid320_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q[12:0];
    assign leftShiftStage1Idx1Rng4_uid322_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b = leftShiftStage1Idx1Rng4_uid322_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_in[12:0];

    // leftShiftStage1Idx1Pad4_uid222_LShift(CONSTANT,221)
    assign leftShiftStage1Idx1Pad4_uid222_LShift_q = $unsigned(4'b0000);

    // leftShiftStage1Idx1_uid323_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x(BITJOIN,322)@7
    assign leftShiftStage1Idx1_uid323_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q = {leftShiftStage1Idx1Rng4_uid322_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b, leftShiftStage1Idx1Pad4_uid222_LShift_q};

    // leftShiftStage0Idx3Rng3_uid317_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x(BITSELECT,316)@7
    assign leftShiftStage0Idx3Rng3_uid317_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_in = xPaddedSigned_uid309_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q[13:0];
    assign leftShiftStage0Idx3Rng3_uid317_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b = leftShiftStage0Idx3Rng3_uid317_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_in[13:0];

    // cz_uid209_LShift(CONSTANT,208)
    assign cz_uid209_LShift_q = $unsigned(3'b000);

    // leftShiftStage0Idx3_uid318_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x(BITJOIN,317)@7
    assign leftShiftStage0Idx3_uid318_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q = {leftShiftStage0Idx3Rng3_uid317_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b, cz_uid209_LShift_q};

    // leftShiftStage0Idx2Rng2_uid314_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x(BITSELECT,313)@7
    assign leftShiftStage0Idx2Rng2_uid314_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_in = xPaddedSigned_uid309_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q[14:0];
    assign leftShiftStage0Idx2Rng2_uid314_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b = leftShiftStage0Idx2Rng2_uid314_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_in[14:0];

    // leftShiftStage0Idx2Pad2_uid214_LShift(CONSTANT,213)
    assign leftShiftStage0Idx2Pad2_uid214_LShift_q = $unsigned(2'b00);

    // leftShiftStage0Idx2_uid315_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x(BITJOIN,314)@7
    assign leftShiftStage0Idx2_uid315_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q = {leftShiftStage0Idx2Rng2_uid314_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b, leftShiftStage0Idx2Pad2_uid214_LShift_q};

    // leftShiftStage0Idx1Rng1_uid311_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x(BITSELECT,310)@7
    assign leftShiftStage0Idx1Rng1_uid311_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_in = xPaddedSigned_uid309_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q[15:0];
    assign leftShiftStage0Idx1Rng1_uid311_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b = leftShiftStage0Idx1Rng1_uid311_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_in[15:0];

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // leftShiftStage0Idx1_uid312_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x(BITJOIN,311)@7
    assign leftShiftStage0Idx1_uid312_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q = {leftShiftStage0Idx1Rng1_uid311_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b, GND_q};

    // xMSB_uid307_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x(BITSELECT,306)@7
    assign xMSB_uid307_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_q[15:15]);

    // leftShiftStage1Idx3Rng12_uid229_LShift(BITSELECT,228)@6
    assign leftShiftStage1Idx3Rng12_uid229_LShift_in = leftShiftStage0_uid221_LShift_q[3:0];
    assign leftShiftStage1Idx3Rng12_uid229_LShift_b = leftShiftStage1Idx3Rng12_uid229_LShift_in[3:0];

    // leftShiftStage1Idx3Pad12_uid228_LShift(CONSTANT,227)
    assign leftShiftStage1Idx3Pad12_uid228_LShift_q = $unsigned(12'b000000000000);

    // leftShiftStage1Idx3_uid230_LShift(BITJOIN,229)@6
    assign leftShiftStage1Idx3_uid230_LShift_q = {leftShiftStage1Idx3Rng12_uid229_LShift_b, leftShiftStage1Idx3Pad12_uid228_LShift_q};

    // leftShiftStage1Idx2Rng8_uid226_LShift(BITSELECT,225)@6
    assign leftShiftStage1Idx2Rng8_uid226_LShift_in = leftShiftStage0_uid221_LShift_q[7:0];
    assign leftShiftStage1Idx2Rng8_uid226_LShift_b = leftShiftStage1Idx2Rng8_uid226_LShift_in[7:0];

    // leftShiftStage1Idx2Pad8_uid225_LShift(CONSTANT,224)
    assign leftShiftStage1Idx2Pad8_uid225_LShift_q = $unsigned(8'b00000000);

    // leftShiftStage1Idx2_uid227_LShift(BITJOIN,226)@6
    assign leftShiftStage1Idx2_uid227_LShift_q = {leftShiftStage1Idx2Rng8_uid226_LShift_b, leftShiftStage1Idx2Pad8_uid225_LShift_q};

    // leftShiftStage1Idx1Rng4_uid223_LShift(BITSELECT,222)@6
    assign leftShiftStage1Idx1Rng4_uid223_LShift_in = leftShiftStage0_uid221_LShift_q[11:0];
    assign leftShiftStage1Idx1Rng4_uid223_LShift_b = leftShiftStage1Idx1Rng4_uid223_LShift_in[11:0];

    // leftShiftStage1Idx1_uid224_LShift(BITJOIN,223)@6
    assign leftShiftStage1Idx1_uid224_LShift_q = {leftShiftStage1Idx1Rng4_uid223_LShift_b, leftShiftStage1Idx1Pad4_uid222_LShift_q};

    // leftShiftStage0Idx3_uid219_LShift_q_const(CONSTANT,520)
    assign leftShiftStage0Idx3_uid219_LShift_q_const_q = $unsigned(16'b0000000000001000);

    // leftShiftStage0Idx2_uid216_LShift_q_const(CONSTANT,518)
    assign leftShiftStage0Idx2_uid216_LShift_q_const_q = $unsigned(16'b0000000000000100);

    // leftShiftStage0Idx1_uid213_LShift_q_const(CONSTANT,516)
    assign leftShiftStage0Idx1_uid213_LShift_q_const_q = $unsigned(16'b0000000000000010);

    // xPadded_uid210_LShift_q_const(CONSTANT,514)
    assign xPadded_uid210_LShift_q_const_q = $unsigned(16'b0000000000000001);

    // leftShiftStage0_uid221_LShift(MUX,220)@6
    assign leftShiftStage0_uid221_LShift_s = leftShiftStageSel0Dto0_uid220_LShift_bit_select_merged_b;
    always @(leftShiftStage0_uid221_LShift_s or xPadded_uid210_LShift_q_const_q or leftShiftStage0Idx1_uid213_LShift_q_const_q or leftShiftStage0Idx2_uid216_LShift_q_const_q or leftShiftStage0Idx3_uid219_LShift_q_const_q)
    begin
        unique case (leftShiftStage0_uid221_LShift_s)
            2'b00 : leftShiftStage0_uid221_LShift_q = xPadded_uid210_LShift_q_const_q;
            2'b01 : leftShiftStage0_uid221_LShift_q = leftShiftStage0Idx1_uid213_LShift_q_const_q;
            2'b10 : leftShiftStage0_uid221_LShift_q = leftShiftStage0Idx2_uid216_LShift_q_const_q;
            2'b11 : leftShiftStage0_uid221_LShift_q = leftShiftStage0Idx3_uid219_LShift_q_const_q;
            default : leftShiftStage0_uid221_LShift_q = 16'b0;
        endcase
    end

    // redist43_ChannelIn_cunroll_x_in_5_fftlen_tpl_6(DELAY,566)
    dspba_delay_ver #( .width(4), .depth(6), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist43_ChannelIn_cunroll_x_in_5_fftlen_tpl_6 ( .xin(in_5_fftlen_tpl), .xout(redist43_ChannelIn_cunroll_x_in_5_fftlen_tpl_6_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // leftShiftStageSel0Dto0_uid220_LShift_bit_select_merged(BITSELECT,509)@6
    assign leftShiftStageSel0Dto0_uid220_LShift_bit_select_merged_b = redist43_ChannelIn_cunroll_x_in_5_fftlen_tpl_6_q[1:0];
    assign leftShiftStageSel0Dto0_uid220_LShift_bit_select_merged_c = redist43_ChannelIn_cunroll_x_in_5_fftlen_tpl_6_q[3:2];

    // leftShiftStage1_uid232_LShift(MUX,231)@6 + 1
    assign leftShiftStage1_uid232_LShift_s = leftShiftStageSel0Dto0_uid220_LShift_bit_select_merged_c;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            leftShiftStage1_uid232_LShift_q <= 16'b0;
        end
        else
        begin
            unique case (leftShiftStage1_uid232_LShift_s)
                2'b00 : leftShiftStage1_uid232_LShift_q <= leftShiftStage0_uid221_LShift_q;
                2'b01 : leftShiftStage1_uid232_LShift_q <= leftShiftStage1Idx1_uid224_LShift_q;
                2'b10 : leftShiftStage1_uid232_LShift_q <= leftShiftStage1Idx2_uid227_LShift_q;
                2'b11 : leftShiftStage1_uid232_LShift_q <= leftShiftStage1Idx3_uid230_LShift_q;
                default : leftShiftStage1_uid232_LShift_q <= 16'b0;
            endcase
        end
    end

    // redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_q_1(DELAY,540)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x(MUX,127)@7
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_1_S2B_cnt2E_tpl;
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_s or redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_q_1_q or leftShiftStage1_uid232_LShift_q)
    begin
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_s)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_q = redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_q_1_q;
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_q = leftShiftStage1_uid232_LShift_q;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_q = 16'b0;
        endcase
    end

    // xPaddedSigned_uid309_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x(BITJOIN,308)@7
    assign xPaddedSigned_uid309_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q = {xMSB_uid307_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_b, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L1_Mux_x_q};

    // leftShiftStage0_uid320_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x(MUX,319)@7
    assign leftShiftStage0_uid320_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_s = rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_b;
    always @(leftShiftStage0_uid320_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_s or xPaddedSigned_uid309_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q or leftShiftStage0Idx1_uid312_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q or leftShiftStage0Idx2_uid315_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q or leftShiftStage0Idx3_uid318_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q)
    begin
        unique case (leftShiftStage0_uid320_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_s)
            2'b00 : leftShiftStage0_uid320_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q = xPaddedSigned_uid309_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q;
            2'b01 : leftShiftStage0_uid320_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q = leftShiftStage0Idx1_uid312_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q;
            2'b10 : leftShiftStage0_uid320_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q = leftShiftStage0Idx2_uid315_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q;
            2'b11 : leftShiftStage0_uid320_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q = leftShiftStage0Idx3_uid318_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q;
            default : leftShiftStage0_uid320_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q = 17'b0;
        endcase
    end

    // redist45_ChannelIn_cunroll_x_in_6_NumAxc_tpl_7(DELAY,568)
    dspba_delay_ver #( .width(3), .depth(7), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist45_ChannelIn_cunroll_x_in_6_NumAxc_tpl_7 ( .xin(in_6_NumAxc_tpl), .xout(redist45_ChannelIn_cunroll_x_in_6_NumAxc_tpl_7_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged(BITSELECT,510)@7
    assign rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_b = redist45_ChannelIn_cunroll_x_in_6_NumAxc_tpl_7_q[1:0];
    assign rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_c = redist45_ChannelIn_cunroll_x_in_6_NumAxc_tpl_7_q[2:2];

    // leftShiftStage1_uid325_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x(MUX,324)@7
    assign leftShiftStage1_uid325_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_s = rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_c;
    always @(leftShiftStage1_uid325_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_s or leftShiftStage0_uid320_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q or leftShiftStage1Idx1_uid323_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q)
    begin
        unique case (leftShiftStage1_uid325_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_s)
            1'b0 : leftShiftStage1_uid325_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q = leftShiftStage0_uid320_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q;
            1'b1 : leftShiftStage1_uid325_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q = leftShiftStage1Idx1_uid323_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q;
            default : leftShiftStage1_uid325_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q = 17'b0;
        endcase
    end

    // leftShiftStage1Idx1Rng4_uid302_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x(BITSELECT,301)@9
    assign leftShiftStage1Idx1Rng4_uid302_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in = leftShiftStage0_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q[11:0];
    assign leftShiftStage1Idx1Rng4_uid302_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b = leftShiftStage1Idx1Rng4_uid302_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in[11:0];

    // leftShiftStage1Idx1_uid303_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x(BITJOIN,302)@9
    assign leftShiftStage1Idx1_uid303_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q = {leftShiftStage1Idx1Rng4_uid302_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b, leftShiftStage1Idx1Pad4_uid222_LShift_q};

    // leftShiftStage0Idx3Rng3_uid297_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x(BITSELECT,296)@9
    assign leftShiftStage0Idx3Rng3_uid297_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q[12:0];
    assign leftShiftStage0Idx3Rng3_uid297_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b = leftShiftStage0Idx3Rng3_uid297_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in[12:0];

    // leftShiftStage0Idx3_uid298_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x(BITJOIN,297)@9
    assign leftShiftStage0Idx3_uid298_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q = {leftShiftStage0Idx3Rng3_uid297_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b, cz_uid209_LShift_q};

    // leftShiftStage0Idx2Rng2_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x(BITSELECT,293)@9
    assign leftShiftStage0Idx2Rng2_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q[13:0];
    assign leftShiftStage0Idx2Rng2_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b = leftShiftStage0Idx2Rng2_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in[13:0];

    // leftShiftStage0Idx2_uid295_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x(BITJOIN,294)@9
    assign leftShiftStage0Idx2_uid295_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q = {leftShiftStage0Idx2Rng2_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b, leftShiftStage0Idx2Pad2_uid214_LShift_q};

    // leftShiftStage0Idx1Rng1_uid291_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x(BITSELECT,290)@9
    assign leftShiftStage0Idx1Rng1_uid291_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q[14:0];
    assign leftShiftStage0Idx1Rng1_uid291_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b = leftShiftStage0Idx1Rng1_uid291_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in[14:0];

    // leftShiftStage0Idx1_uid292_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x(BITJOIN,291)@9
    assign leftShiftStage0Idx1_uid292_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q = {leftShiftStage0Idx1Rng1_uid291_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b, GND_q};

    // redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_notEnable(LOGICAL,588)
    assign redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_notEnable_q = $unsigned(~ (VCC_q));

    // redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_nor(LOGICAL,589)
    assign redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_nor_q = ~ (redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_notEnable_q | redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_sticky_ena_q);

    // redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_last(CONSTANT,585)
    assign redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_last_q = $unsigned(4'b0101);

    // redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_cmp(LOGICAL,586)
    assign redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_cmp_b = {1'b0, redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_q};
    assign redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_cmp_q = $unsigned(redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_last_q == redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_cmp_b ? 1'b1 : 1'b0);

    // redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_cmpReg(REG,587)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_cmpReg_q <= $unsigned(redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_cmp_q);
        end
    end

    // redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_sticky_ena(REG,590)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_nor_q == 1'b1)
        begin
            redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_sticky_ena_q <= $unsigned(redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_cmpReg_q);
        end
    end

    // redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_enaAnd(LOGICAL,591)
    assign redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_enaAnd_q = redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_sticky_ena_q & VCC_q;

    // redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt(COUNTER,583)
    // low=0, high=6, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_i <= 3'd0;
            redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_eq <= 1'b0;
        end
        else
        begin
            if (redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_i == 3'd5)
            begin
                redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_eq <= 1'b1;
            end
            else
            begin
                redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_eq <= 1'b0;
            end
            if (redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_eq == 1'b1)
            begin
                redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_i <= $unsigned(redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_i) + $unsigned(3'd2);
            end
            else
            begin
                redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_i <= $unsigned(redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_i) + $unsigned(3'd1);
            end
        end
    end
    assign redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_q = redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_i[2:0];

    // redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_wraddr(REG,584)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_wraddr_q <= $unsigned(3'b110);
        end
        else
        begin
            redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_wraddr_q <= $unsigned(redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_q);
        end
    end

    // redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem(DUALMEM,582)
    assign redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_ia = $unsigned(in_4_CPlen_tpl);
    assign redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_aa = redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_wraddr_q;
    assign redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_ab = redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_rdcnt_q;
    assign redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_ena_OrRstB = areset | redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_enaAnd_q[0];
    assign redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(3),
        .numwords_a(7),
        .width_b(16),
        .widthad_b(3),
        .numwords_b(7),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_dmem (
        .clocken1(redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_reset0),
        .clock1(clk),
        .address_a(redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_aa),
        .data_a(redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_ab),
        .q_b(redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
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
    assign redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_q = redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_iq[15:0];

    // redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_outputreg0(DELAY,581)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_outputreg0_q <= '0;
        end
        else
        begin
            redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_outputreg0_q <= $unsigned(redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_mem_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_bias(CONSTANT,504)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_bias_q = $unsigned(2'b01);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_b_tessel0_1_bit_select_merged_b_const(CONSTANT,521)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_b_tessel0_1_bit_select_merged_b_const_q = $unsigned(5'b00000);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjA2(BITJOIN,328)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjA2_q = {GND_q, in_4_CPlen_tpl};

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Const12_x(CONSTANT,141)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Const12_x_q = $unsigned(52'b1101000101101111000000000110100011011011100010111011);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_PreShift_1(BITSHIFT,187)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_PreShift_1_qint = { streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Const12_x_q, 1'b0 };
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_PreShift_1_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_PreShift_1_qint[52:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Const1_x(CONSTANT,140)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Const1_x_q = $unsigned(53'b11100110011001100110011001100110011001100110011001101);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Const3_x(CONSTANT,143)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Const3_x_q = $unsigned(4'b1100);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ1_x(LOGICAL,139)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ1_x_q = $unsigned(in_5_fftlen_tpl == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Const3_x_q ? 1'b1 : 1'b0);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_x(MUX,145)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ1_x_q;
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_x_s or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Const1_x_q or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_PreShift_1_q)
    begin
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_x_s)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Const1_x_q;
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_PreShift_1_q;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_x_q = 53'b0;
        endcase
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bs3_bit_select_merged(BITSELECT,511)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bs3_bit_select_merged_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_x_q[17:0];
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bs3_bit_select_merged_c = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_x_q[35:18];
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bs3_bit_select_merged_d = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux1_x_q[52:36];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjB9(BITJOIN,335)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjB9_q = {GND_q, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bs3_bit_select_merged_c};

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma(CHAINMULTADD,482)@0 + 5
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_reset = areset;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_ena0 = 1'b1;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_ena1 = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_ena0;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_ena2 = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_ena0;

    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_a0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjB9_q);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_c0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjA2_q);
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(19),
        .ax_clken("0"),
        .ax_width(17),
        .signed_may("true"),
        .signed_max("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(36)
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_DSP0 (
        .clk(clk),
        .ena({ streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_ena2, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_ena1, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_ena0 }),
        .clr({ streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_reset, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_reset }),
        .ay(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_a0),
        .ax(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_c0),
        .resulta(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(36), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_delay0 ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_s0), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_q = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_qq0[35:0]);

    // redist7_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_q_1(DELAY,530)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist7_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_q_1_q <= '0;
        end
        else
        begin
            redist7_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_align_1(BITSHIFT,342)@6
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_align_1_qint = { redist7_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im5_cma_q_1_q, 18'b000000000000000000 };
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_align_1_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_align_1_qint[53:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_b(BITJOIN,501)@6
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_b_q = {streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_b_tessel0_1_bit_select_merged_b_const_q, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_align_1_q};

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjB14(BITJOIN,340)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjB14_q = {GND_q, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bs3_bit_select_merged_d};

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma(CHAINMULTADD,483)@0 + 5
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_reset = areset;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_ena0 = 1'b1;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_ena1 = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_ena0;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_ena2 = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_ena0;

    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_a0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjB14_q);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_c0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjA2_q);
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(18),
        .ax_clken("0"),
        .ax_width(17),
        .signed_may("true"),
        .signed_max("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(35)
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_DSP0 (
        .clk(clk),
        .ena({ streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_ena2, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_ena1, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_ena0 }),
        .clr({ streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_reset, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_reset }),
        .ay(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_a0),
        .ax(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_c0),
        .resulta(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(35), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_delay0 ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_s0), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_q = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_qq0[34:0]);

    // redist6_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_q_1(DELAY,529)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist6_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_q_1_q <= '0;
        end
        else
        begin
            redist6_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged(BITSELECT,512)@6
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_b = $unsigned(redist6_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_q_1_q[22:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c = $unsigned(redist6_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im10_cma_q_1_q[34:23]);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjB4(BITJOIN,330)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjB4_q = {GND_q, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bs3_bit_select_merged_b};

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma(CHAINMULTADD,481)@0 + 5
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_reset = areset;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_ena0 = 1'b1;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_ena1 = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_ena0;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_ena2 = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_ena0;

    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_a0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjB4_q);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_c0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_bjA2_q);
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(19),
        .ax_clken("0"),
        .ax_width(17),
        .signed_may("true"),
        .signed_max("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(36)
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_DSP0 (
        .clk(clk),
        .ena({ streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_ena2, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_ena1, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_ena0 }),
        .clr({ streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_reset, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_reset }),
        .ay(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_a0),
        .ax(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_c0),
        .resulta(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(36), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_delay0 ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_s0), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_q = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_qq0[35:0]);

    // redist8_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_q_1(DELAY,531)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist8_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_q_1_q <= '0;
        end
        else
        begin
            redist8_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b(BITJOIN,495)@6
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q = {streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_b, redist8_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_im0_cma_q_1_q};

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2(ADD,490)@6 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_a = {1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_b = {1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_b_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_o <= 60'b0;
        end
        else
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_o <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_a) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_b);
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_c[0] = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_o[59];
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_o[58:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_b_tessel0_1_bit_select_merged_c_const(CONSTANT,522)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_b_tessel0_1_bit_select_merged_c_const_q = $unsigned(13'b0000000000000);

    // redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c_1(DELAY,523)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c_1_q <= '0;
        end
        else
        begin
            redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,498)@7
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q = {GND_q, redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_tessel0_1_bit_select_merged_c_1_q};

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2(ADD,491)@7 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_cin = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_c;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_a = { {1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_b = { {1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitSelect_for_b_tessel0_1_bit_select_merged_c_const_q}, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_o <= 15'b0;
        end
        else
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_o <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_a) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_b);
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_o[13:1];

    // redist5_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_q_1(DELAY,528)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist5_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_q_1_q <= '0;
        end
        else
        begin
            redist5_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitJoin_for_q(BITJOIN,492)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitJoin_for_q_q = {streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p2_of_2_q, redist5_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_p1_of_2_q_1_q};

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_trunc(BITSHIFT,505)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_trunc_qint = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mult_x_sums_result_add_0_0_BitJoin_for_q_q[68:0];
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_trunc_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_trunc_qint[68:52];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_add(ADD,506)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_add_a = $unsigned({3'b000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_trunc_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_add_b = $unsigned({{18{streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_bias_q[1]}}, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_bias_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_add_o = $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_add_a) + $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_add_b));
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_add_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_add_o[18:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_shift(BITSHIFT,507)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_shift_qint = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_add_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_shift_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_shift_qint[18:1];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_bs(BITSELECT,508)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_bs_in = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_shift_q[16:0];
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_bs_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_bs_in[16:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_sel_x(BITSELECT,186)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_sel_x_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_rnd_x_bs_b[10:0];

    // redist10_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_sel_x_b_1(DELAY,533)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist10_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist10_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_sel_x_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_sel_x_b);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Const5_x(CONSTANT,38)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Const5_x_q = $unsigned(4'b1110);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_Const13_x(CONSTANT,47)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_Const13_x_q = $unsigned(4'b1101);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x(LOGICAL,46)@9 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x_qi = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_q == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_Const13_x_q ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ1_x(LOGICAL,45)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ1_x_b = {3'b000, GND_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ1_x_q = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_q == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ1_x_b ? 1'b1 : 1'b0);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_And_x(LOGICAL,44)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_And_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ1_x_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_Not1_x(LOGICAL,42)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_Not1_x_q = ~ (redist21_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v_1_q);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_And_x(LOGICAL,41)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_And_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_Not1_x_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x(LOADABLECOUNTER,39)@8 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_en = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_And_x_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_ld = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_And_x_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_i = {3'b000, GND_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s = {3'b000, VCC_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Const5_x_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_up = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_inc);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dn = $unsigned({1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt[3:0]}) - $unsigned({1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dec[3:0]});
    always @ (posedge clk)
    begin
        reg [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_assert_helper_var;
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt <= $unsigned(4'b0000);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_inc <= $unsigned(4'b0001);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dec <= $unsigned(4'b1101);
        end
        else
        begin
            if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_ld == 1'b1)
            begin
                // synthesis translate_off
                assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l != 4'b0000) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x (LOADABLECOUNTER) : Modulo value cannot be zero");
                assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_i <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x (LOADABLECOUNTER) : Initial value cannot be greater than modulo value.");
                if (1'b0 & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s[3] == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_assert_helper_var = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s);
                    assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_assert_helper_var[3] != 1'b1) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x (LOADABLECOUNTER) : Absolute value of step cannot be greater than modulo value.");
                end
                else
                begin
                    assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x (LOADABLECOUNTER) : Absolute value of step cannot be greater than modulo value.");
                end
                assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_i != streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s != streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x (LOADABLECOUNTER) : Initial, step and modulo values cannot all be equal.");
                // synthesis translate_on

                if (1'b0 & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s[3] == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_inc <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s);
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dec <= $unsigned(4'd0) - $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s);
                end
                else
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_inc <= $unsigned(4'd0) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s);
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dec <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l) - $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s);
                end
            end
            if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_ld == 1'b1 | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_en == 1'b1)
            begin
                if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_ld == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_i;
                end
                else
                begin
                    if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dn[4] == 1'b1)
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_up;
                    end
                    else
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dn[3:0];
                    end
                end
            end
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x(LOGICAL,138)@5 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_b = {3'b000, GND_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_qi = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_q == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q_4(DELAY,538)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q_4_delay_0 <= '0;
            redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q_4_delay_1 <= '0;
            redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q_4_q <= '0;
        end
        else
        begin
            redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q_4_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q);
            redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q_4_delay_1 <= redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q_4_delay_0;
            redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q_4_q <= redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q_4_delay_1;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux2_x(MUX,146)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux2_x_s = redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_CmpEQ_x_q_4_q;
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux2_x_s or redist10_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_sel_x_b_1_q or redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_outputreg0_q)
    begin
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux2_x_s)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux2_x_q = {5'b00000, redist10_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Convert_sel_x_b_1_q};
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux2_x_q = redist42_ChannelIn_cunroll_x_in_4_CPlen_tpl_9_outputreg0_q;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux2_x_q = 16'b0;
        endcase
    end

    // redist18_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q_1(DELAY,541)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist18_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist18_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q);
        end
    end

    // redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_1_S2B_cnt2E_tpl_2(DELAY,549)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_1_S2B_cnt2E_tpl_2_delay_0 <= '0;
            redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_1_S2B_cnt2E_tpl_2_q <= '0;
        end
        else
        begin
            redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_1_S2B_cnt2E_tpl_2_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_1_S2B_cnt2E_tpl);
            redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_1_S2B_cnt2E_tpl_2_q <= redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_1_S2B_cnt2E_tpl_2_delay_0;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x(MUX,125)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_s = redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_1_S2B_cnt2E_tpl_2_q;
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_s or redist18_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q_1_q or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux2_x_q)
    begin
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_s)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q = redist18_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q_1_q;
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_cp_len_Mux2_x_q;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q = 16'b0;
        endcase
    end

    // redist1_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_b_1(DELAY,524)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_b_1_q <= '0;
        end
        else
        begin
            redist1_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_b_1_q <= $unsigned(rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_b);
        end
    end

    // redist2_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_b_2(DELAY,525)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_b_2_q <= $unsigned(redist1_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_b_1_q);
        end
    end

    // leftShiftStage0_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x(MUX,299)@9
    assign leftShiftStage0_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_s = redist2_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_b_2_q;
    always @(leftShiftStage0_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_s or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q or leftShiftStage0Idx1_uid292_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q or leftShiftStage0Idx2_uid295_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q or leftShiftStage0Idx3_uid298_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q)
    begin
        unique case (leftShiftStage0_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_s)
            2'b00 : leftShiftStage0_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_latch_0L_Mux_x_q;
            2'b01 : leftShiftStage0_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q = leftShiftStage0Idx1_uid292_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q;
            2'b10 : leftShiftStage0_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q = leftShiftStage0Idx2_uid295_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q;
            2'b11 : leftShiftStage0_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q = leftShiftStage0Idx3_uid298_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q;
            default : leftShiftStage0_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q = 16'b0;
        endcase
    end

    // redist3_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_c_1(DELAY,526)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist3_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_c_1_q <= '0;
        end
        else
        begin
            redist3_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_c_1_q <= $unsigned(rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_c);
        end
    end

    // redist4_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_c_2(DELAY,527)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_c_2_q <= $unsigned(redist3_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_c_1_q);
        end
    end

    // leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x(MUX,304)@9
    assign leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_s = redist4_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_c_2_q;
    always @(leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_s or leftShiftStage0_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q or leftShiftStage1Idx1_uid303_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q)
    begin
        unique case (leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_s)
            1'b0 : leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q = leftShiftStage0_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q;
            1'b1 : leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q = leftShiftStage1Idx1_uid303_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q;
            default : leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q = 16'b0;
        endcase
    end

    // shifter_uid306_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x(BITSELECT,305)@9
    assign shifter_uid306_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in = $unsigned(leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_q[11:0]);
    assign shifter_uid306_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b = $unsigned(shifter_uid306_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_in[11:0]);

    // redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_2(DELAY,550)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_2_delay_0 <= '0;
            redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_2_q <= '0;
        end
        else
        begin
            redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_2_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl);
            redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_2_q <= redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_2_delay_0;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x(LOOP,109)@9 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_running <= $unsigned(1'b0);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_pending <= $unsigned(1'b0);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0 <= 12'b0;
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_e0 <= '1;
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v <= $unsigned(1'b0);
        end
        else
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v <= $unsigned(1'b0);
            if (redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_2_q == 1'b1)
            begin
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_e0 <= $unsigned(shifter_uid306_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b) - $unsigned(12'd1);
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0 <= 12'b0;
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_running <= $unsigned(1'b1);
                if (VCC_q == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_pending <= $unsigned(1'b0);
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (VCC_q == 1'b1)
                begin
                    if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_pending == 1'b1)
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v <= $unsigned(1'b1);
                    end
                    else if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_running == 1'b1)
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v <= $unsigned(1'b1);
                        if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0 == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_e0)
                        begin
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0 <= 12'b0;
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_running <= $unsigned(1'b0);
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0) + $unsigned(12'd1);
                        end
                    end
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_f0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0 == 12'b000000000000 ? 1'b1 : 1'b0);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_l0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0 == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_e0 ? 1'b1 : 1'b0);

    // redist23_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v_2(DELAY,546)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist23_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v_2_delay_0 <= '0;
            redist23_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v_2_q <= '0;
        end
        else
        begin
            redist23_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v_2_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v);
            redist23_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v_2_q <= redist23_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v_2_delay_0;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Const3_x(CONSTANT,113)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Const3_x_q = $unsigned(5'b01100);

    // redist9_shifter_uid306_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b_1(DELAY,532)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist9_shifter_uid306_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b_1_q <= '0;
        end
        else
        begin
            redist9_shifter_uid306_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b_1_q <= $unsigned(shifter_uid306_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b);
        end
    end

    // redist28_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_3(DELAY,551)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist28_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_3_q <= '0;
        end
        else
        begin
            redist28_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_3_q <= $unsigned(redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_2_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_latch_0L2_Mux_x(MUX,123)@10 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_latch_0L2_Mux_x_s = redist28_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl_3_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_latch_0L2_Mux_x_q <= 12'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_latch_0L2_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_latch_0L2_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_latch_0L2_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_latch_0L2_Mux_x_q <= redist9_shifter_uid306_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift_x_b_1_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_latch_0L2_Mux_x_q <= 12'b0;
            endcase
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Sub_x(SUB,115)@11 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Sub_x_a = $unsigned({1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_latch_0L2_Mux_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Sub_x_b = $unsigned({8'b00000000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Const3_x_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Sub_x_o <= 13'b0;
        end
        else
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Sub_x_o <= $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Sub_x_a) - $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Sub_x_b));
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Sub_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Sub_x_o[12:0];

    // redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0_2(DELAY,547)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0_2_delay_0 <= '0;
            redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0_2_q <= '0;
        end
        else
        begin
            redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0_2_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0);
            redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0_2_q <= redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0_2_delay_0;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_CmpEQ_x(LOGICAL,112)@12
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_CmpEQ_x_a = {1'b0, redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_q0_2_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_CmpEQ_x_q = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_CmpEQ_x_a == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Sub_x_q ? 1'b1 : 1'b0);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_And_x(LOGICAL,111)@12 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_And_x_qi = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_CmpEQ_x_q & redist23_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_v_2_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_And_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_And_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_And_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist20_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_And_x_q_7(DELAY,543)
    dspba_delay_ver #( .width(1), .depth(6), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    redist20_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_And_x_q_7 ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_And_x_q), .xout(redist20_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_And_x_q_7_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist39_ChannelIn_cunroll_x_in_2_vin_tpl_7(DELAY,562)
    dspba_delay_ver #( .width(1), .depth(7), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist39_ChannelIn_cunroll_x_in_2_vin_tpl_7 ( .xin(in_2_vin_tpl), .xout(redist39_ChannelIn_cunroll_x_in_2_vin_tpl_7_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x(BLACKBOX,102)@7
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine thestreamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_Valid_in_tpl(redist39_ChannelIn_cunroll_x_in_2_vin_tpl_7_q),
        .in_3_Cmp1_tpl(redist20_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_And_x_q_7_q),
        .in_4_Cmp2_tpl(redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_And_x_q_10_q),
        .in_5_ena_tpl(VCC_q),
        .out_1_S2B_cnt2E_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_1_S2B_cnt2E_tpl),
        .out_2_S2B_cnt1E_tpl(),
        .out_3_S2B_We_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_3_S2B_We_tpl),
        .out_4_S2B_latch_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_4_S2B_latch_tpl),
        .out_5_S2B_waitdone_tpl(),
        .clk(clk),
        .areset(areset)
    );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x(LOOP,110)@7 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_running <= $unsigned(1'b0);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_pending <= $unsigned(1'b0);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0 <= 17'b0;
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_e0 <= '1;
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v <= $unsigned(1'b0);
        end
        else
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v <= $unsigned(1'b0);
            if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_4_S2B_latch_tpl == 1'b1)
            begin
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_e0 <= $unsigned(leftShiftStage1_uid325_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q) - $unsigned(17'd1);
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0 <= 17'b0;
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_running <= $unsigned(1'b1);
                if (VCC_q == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_pending <= $unsigned(1'b0);
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (VCC_q == 1'b1)
                begin
                    if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_pending == 1'b1)
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v <= $unsigned(1'b1);
                    end
                    else if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_running == 1'b1)
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v <= $unsigned(1'b1);
                        if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0 == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_e0)
                        begin
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0 <= 17'b0;
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_running <= $unsigned(1'b0);
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0) + $unsigned(17'd1);
                        end
                    end
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_f0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0 == 17'b00000000000000000 ? 1'b1 : 1'b0);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_l0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0 == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_e0 ? 1'b1 : 1'b0);

    // redist21_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v_1(DELAY,544)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist21_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v_1_q <= '0;
        end
        else
        begin
            redist21_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_latch_0L2_Mux_x(MUX,121)@7 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_latch_0L2_Mux_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_x_out_4_S2B_latch_tpl;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_latch_0L2_Mux_x_q <= 17'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_latch_0L2_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_latch_0L2_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_latch_0L2_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_latch_0L2_Mux_x_q <= leftShiftStage1_uid325_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_LShift1_x_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_latch_0L2_Mux_x_q <= 17'b0;
            endcase
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_Sub_x(SUB,120)@8 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_Sub_x_a = $unsigned({1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_latch_0L2_Mux_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_Sub_x_b = $unsigned({13'b0000000000000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen_Const3_x_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_Sub_x_o <= 18'b0;
        end
        else
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_Sub_x_o <= $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_Sub_x_a) - $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_Sub_x_b));
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_Sub_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_Sub_x_o[17:0];

    // redist22_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0_1(DELAY,545)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist22_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0_1_q <= '0;
        end
        else
        begin
            redist22_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_CmpEQ_x(LOGICAL,117)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_CmpEQ_x_a = {1'b0, redist22_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0_1_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_CmpEQ_x_q = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_CmpEQ_x_a == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_Sub_x_q ? 1'b1 : 1'b0);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_And_x(LOGICAL,116)@9 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_And_x_qi = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_CmpEQ_x_q & redist21_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v_1_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_And_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_And_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_And_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_And_x_q_10(DELAY,542)
    dspba_delay_ver #( .width(1), .depth(9), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_And_x_q_10 ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_And_x_q), .xout(redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_And_x_q_10_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x(MUX,105)@7 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_s = redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Lastsig_gen1_And_x_q_10_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_q <= 1'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Not_x_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_q <= 1'b0;
            endcase
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Xor_x(LOGICAL,72)@7
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Xor_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_q ^ streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_q;

    // redist32_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_9(DELAY,555)
    dspba_delay_ver #( .width(1), .depth(7), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    redist32_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_9 ( .xin(redist31_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_2_q), .xout(redist32_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_9_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Not1_x(LOGICAL,63)@17
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Not1_x_q = ~ (redist32_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_9_q);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And1_x(LOGICAL,51)@7
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And1_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Not1_x_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Xor_x_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Finite_State_Machine_x(BLACKBOX,59)@7
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Finite_State_Machine thestreamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_WbaNERba_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And1_x_q),
        .in_3_LastRd_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And_x_q),
        .in_4_ena_tpl(VCC_q),
        .out_1_S2B_ToggleRba_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Finite_State_Machine_x_out_1_S2B_ToggleRba_tpl),
        .out_2_S2B_Go_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Finite_State_Machine_x_out_2_S2B_Go_tpl),
        .clk(clk),
        .areset(areset)
    );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x(LOOP,74)@7 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_running <= $unsigned(1'b0);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_pending <= $unsigned(1'b0);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_q0 <= 3'b0;
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_e0 <= '1;
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_v <= $unsigned(1'b0);
        end
        else
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_v <= $unsigned(1'b0);
            if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Finite_State_Machine_x_out_1_S2B_ToggleRba_tpl == 1'b1)
            begin
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_e0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Const2_x_q) - $unsigned(3'd1);
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_q0 <= 3'b0;
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_running <= $unsigned(1'b1);
                if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Or_x_q == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_pending <= $unsigned(1'b0);
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Or_x_q == 1'b1)
                begin
                    if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_pending == 1'b1)
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_v <= $unsigned(1'b1);
                    end
                    else if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_running == 1'b1)
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_v <= $unsigned(1'b1);
                        if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_q0 == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_e0)
                        begin
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_q0 <= 3'b0;
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_running <= $unsigned(1'b0);
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_q0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_q0) + $unsigned(3'd1);
                        end
                    end
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_f0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_q0 == 3'b000 ? 1'b1 : 1'b0);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_l0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_q0 == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_e0 ? 1'b1 : 1'b0);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_CmpEQ_x(LOGICAL,53)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_CmpEQ_x_q = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_q0 == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Const4_x_q ? 1'b1 : 1'b0);

    // xMSB_uid257_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x(BITSELECT,256)@7
    assign xMSB_uid257_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x_b = $unsigned(leftShiftStage1_uid232_LShift_q[15:15]);

    // sR_topExtension_uid259_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x(BITJOIN,258)@7
    assign sR_topExtension_uid259_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x_q = {xMSB_uid257_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x_b, xMSB_uid257_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x_b, xMSB_uid257_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x_b};

    // sR_mergedSignalTM_uid261_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x(BITJOIN,260)@7
    assign sR_mergedSignalTM_uid261_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x_q = {sR_topExtension_uid259_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x_q, leftShiftStage1_uid232_LShift_q};

    // redist29_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_q_1(DELAY,552)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist29_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist29_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x(MUX,95)@7
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Finite_State_Machine_x_out_1_S2B_ToggleRba_tpl;
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_s or redist29_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_q_1_q or sR_mergedSignalTM_uid261_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x_q)
    begin
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_s)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_q = redist29_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_q_1_q;
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_q = sR_mergedSignalTM_uid261_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mult_x_q;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_q = 19'b0;
        endcase
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x(LOOP,75)@7 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_running <= $unsigned(1'b0);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_pending <= $unsigned(1'b0);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_q0 <= 19'b0;
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_e0 <= '1;
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v <= $unsigned(1'b0);
        end
        else
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v <= $unsigned(1'b0);
            if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_v == 1'b1)
            begin
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_e0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_0L_Mux_x_q) - $unsigned(19'd1);
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_q0 <= 19'b0;
                streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_running <= $unsigned(1'b1);
                if (VCC_q == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_pending <= $unsigned(1'b0);
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (VCC_q == 1'b1)
                begin
                    if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_pending == 1'b1)
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v <= $unsigned(1'b1);
                    end
                    else if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_running == 1'b1)
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v <= $unsigned(1'b1);
                        if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_q0 == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_e0)
                        begin
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_q0 <= 19'b0;
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_running <= $unsigned(1'b0);
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_q0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_q0) + $unsigned(19'd1);
                        end
                    end
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_f0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_q0 == 19'b0000000000000000000 ? 1'b1 : 1'b0);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_l0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_q0 == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_e0 ? 1'b1 : 1'b0);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And_x(LOGICAL,50)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_l0 & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_CmpEQ_x_q;

    // redist37_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And_x_q_1(DELAY,560)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist37_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And_x_q_1_q <= '0;
        end
        else
        begin
            redist37_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And_x_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And_x_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_Not1_x(LOGICAL,161)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_Not1_x_q = ~ (redist37_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And_x_q_1_q);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_And_x(LOGICAL,160)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_And_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_Not1_x_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_And_x_q;

    // redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_rdcnt(ADD,603)
    assign redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_rdcnt_a = {1'b0, redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_wraddr_q};
    assign redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_rdcnt_b = {1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Const4_x_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_rdcnt_o <= $unsigned(redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_rdcnt_a) + $unsigned(redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_rdcnt_b);
        end
    end
    assign redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_rdcnt_q = redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_rdcnt_o[3:0];

    // redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_wraddr(COUNTER,601)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_wraddr_i <= $unsigned(redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_wraddr_q = redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_wraddr_i[2:0];

    // redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem(DUALMEM,600)
    assign redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_ia = $unsigned(in_9_sym_metadata_in_tpl);
    assign redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_aa = redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_wraddr_q;
    assign redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_ab = redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_rdcnt_q[2:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(64),
        .widthad_b(3),
        .numwords_b(8),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_aa),
        .data_a(redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_ab),
        .q_b(redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_q = redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_iq[63:0];

    // redist49_ChannelIn_cunroll_x_in_10_sym_metadata_in_valid_tpl_1(DELAY,572)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist49_ChannelIn_cunroll_x_in_10_sym_metadata_in_valid_tpl_1_q <= '0;
        end
        else
        begin
            redist49_ChannelIn_cunroll_x_in_10_sym_metadata_in_valid_tpl_1_q <= $unsigned(in_10_sym_metadata_in_valid_tpl);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_Not1_x(LOGICAL,158)@0 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_Not1_x_qi = ~ (redist49_ChannelIn_cunroll_x_in_10_sym_metadata_in_valid_tpl_1_q);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_Not1_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_Not1_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_Not1_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_And_x(LOGICAL,157)@1 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_And_x_qi = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_Not1_x_q & redist49_ChannelIn_cunroll_x_in_10_sym_metadata_in_valid_tpl_1_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_And_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_And_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_And_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist12_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_And_x_q_7(DELAY,535)
    dspba_delay_ver #( .width(1), .depth(6), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist12_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_And_x_q_7 ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_And_x_q), .xout(redist12_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_And_x_q_7_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x(FIFO,156)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(16),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(16),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(64),
        .lpm_widthu(4),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_fifo (
        .aclr(1'b0),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_reset),
        .clock(clk),
        .rdreq(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_And_x_q[0]),
        .wrreq(redist12_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE1_And_x_q_7_q[0]),
        .data(redist48_ChannelIn_cunroll_x_in_9_sym_metadata_in_tpl_8_mem_q),
        .almost_full(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_f[0]),
        .almost_empty(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_t[0]),
        .empty(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_empty[0]),
        .q(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_e = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_t);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_v = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_empty);

    // redist13_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_q_2(DELAY,536)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_q_2_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_q);
            redist13_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_q_2_q <= redist13_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_q_2_delay_0;
        end
    end

    // Data_Type_Conversion1_sel_x(BITSELECT,33)@8
    assign Data_Type_Conversion1_sel_x_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_q0[1:0];

    // redist38_Data_Type_Conversion1_sel_x_b_2(DELAY,561)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist38_Data_Type_Conversion1_sel_x_b_2_delay_0 <= $unsigned(Data_Type_Conversion1_sel_x_b);
            redist38_Data_Type_Conversion1_sel_x_b_2_q <= redist38_Data_Type_Conversion1_sel_x_b_2_delay_0;
        end
    end

    // redist44_ChannelIn_cunroll_x_in_5_fftlen_tpl_8(DELAY,567)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist44_ChannelIn_cunroll_x_in_5_fftlen_tpl_8_delay_0 <= '0;
        end
        else
        begin
            redist44_ChannelIn_cunroll_x_in_5_fftlen_tpl_8_delay_0 <= $unsigned(redist43_ChannelIn_cunroll_x_in_5_fftlen_tpl_6_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist44_ChannelIn_cunroll_x_in_5_fftlen_tpl_8_q <= redist44_ChannelIn_cunroll_x_in_5_fftlen_tpl_8_delay_0;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x(FIFO,147)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(16),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(16),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(4),
        .lpm_widthu(4),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_fifo (
        .aclr(1'b0),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_reset),
        .clock(clk),
        .rdreq(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_RISING_EDGE3_And_x_q[0]),
        .wrreq(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_And_x_q[0]),
        .data(redist44_ChannelIn_cunroll_x_in_5_fftlen_tpl_8_q),
        .almost_full(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_f[0]),
        .almost_empty(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_t[0]),
        .empty(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_empty[0]),
        .q(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_e = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_t);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_v = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_empty);

    // redist30_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_1(DELAY,553)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist30_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_1_q <= '0;
        end
        else
        begin
            redist30_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_RISING_EDGE3_Not1_x(LOGICAL,134)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_RISING_EDGE3_Not1_x_q = ~ (redist30_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_1_q);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_RISING_EDGE3_And_x(LOGICAL,133)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_RISING_EDGE3_And_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_RISING_EDGE3_Not1_x_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x(MUX,154)@8 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_RISING_EDGE3_And_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x_q <= 4'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_FIFO_x_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x_q <= 4'b0;
            endcase
        end
    end

    // redist14_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x_q_2(DELAY,537)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist14_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x_q_2_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x_q);
        end
    end

    // redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_rdcnt(ADD,599)
    assign redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_rdcnt_a = {1'b0, redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_wraddr_q};
    assign redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_rdcnt_b = {1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Const4_x_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_rdcnt_o <= $unsigned(redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_rdcnt_a) + $unsigned(redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_rdcnt_b);
        end
    end
    assign redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_rdcnt_q = redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_rdcnt_o[3:0];

    // redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_wraddr(COUNTER,597)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_wraddr_i <= $unsigned(redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_wraddr_q = redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_wraddr_i[2:0];

    // redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem(DUALMEM,596)
    assign redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_ia = $unsigned(in_8_nprb_in_tpl);
    assign redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_aa = redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_wraddr_q;
    assign redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_ab = redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_rdcnt_q[2:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(16),
        .widthad_b(3),
        .numwords_b(8),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_aa),
        .data_a(redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_ab),
        .q_b(redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_q = redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x(FIFO,129)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(16),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(16),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(16),
        .lpm_widthu(4),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_fifo (
        .aclr(1'b0),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_reset),
        .clock(clk),
        .rdreq(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_RISING_EDGE3_And_x_q[0]),
        .wrreq(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_And_x_q[0]),
        .data(redist47_ChannelIn_cunroll_x_in_8_nprb_in_tpl_8_mem_q),
        .almost_full(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_f[0]),
        .almost_empty(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_t[0]),
        .empty(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_empty[0]),
        .q(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_e = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_t);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_v = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_empty);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x(MUX,136)@8 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_RISING_EDGE3_And_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x_q <= 16'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_FIFO_x_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x_q <= 16'b0;
            endcase
        end
    end

    // redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x_q_2(DELAY,539)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x_q_2_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x_q);
        end
    end

    // redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_And_x_q_2(DELAY,534)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_And_x_q_2_delay_0 <= '0;
        end
        else
        begin
            redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_And_x_q_2_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_And_x_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_And_x_q_2_q <= redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_And_x_q_2_delay_0;
        end
    end

    // redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_offset(CONSTANT,594)
    assign redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_offset_q = $unsigned(4'b1001);

    // redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_rdcnt(ADD,595)
    assign redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_rdcnt_a = {1'b0, redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_wraddr_q};
    assign redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_rdcnt_b = {1'b0, redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_rdcnt_o <= $unsigned(redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_rdcnt_a) + $unsigned(redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_rdcnt_b);
        end
    end
    assign redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_rdcnt_q = redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_rdcnt_o[4:0];

    // redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_wraddr(COUNTER,593)
    // low=0, high=15, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_wraddr_i <= $unsigned(redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_wraddr_i) + $unsigned(4'd1);
        end
    end
    assign redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_wraddr_q = redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_wraddr_i[3:0];

    // redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem(DUALMEM,592)
    assign redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_ia = $unsigned(in_7_time_in_tpl);
    assign redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_aa = redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_wraddr_q;
    assign redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_ab = redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_rdcnt_q[3:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(4),
        .numwords_a(16),
        .width_b(64),
        .widthad_b(4),
        .numwords_b(16),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_aa),
        .data_a(redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_ab),
        .q_b(redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_q = redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_iq[63:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_RISING_EDGE1_Not1_x(LOGICAL,165)@9 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_RISING_EDGE1_Not1_x_qi = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_l0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_RISING_EDGE1_Not1_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_RISING_EDGE1_Not1_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_RISING_EDGE1_Not1_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_RISING_EDGE1_And_x(LOGICAL,164)@10
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_RISING_EDGE1_And_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_RISING_EDGE1_Not1_x_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt1_cpcnt_x_l0;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x(FIFO,163)@10
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(16),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(16),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(64),
        .lpm_widthu(4),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_fifo (
        .aclr(1'b0),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_reset),
        .clock(clk),
        .rdreq(redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_RISING_EDGE3_And_x_q_2_q[0]),
        .wrreq(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_RISING_EDGE1_And_x_q[0]),
        .data(redist46_ChannelIn_cunroll_x_in_7_time_in_tpl_10_mem_q),
        .almost_full(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_f[0]),
        .almost_empty(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_t[0]),
        .empty(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_empty[0]),
        .q(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_e = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_t);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_v = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_empty);

    // redist34_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_q_1(DELAY,557)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist34_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist34_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_q);
        end
    end

    // Data_Type_Conversion_sel_x(BITSELECT,32)@8
    assign Data_Type_Conversion_sel_x_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_q0[11:0]);

    // rd(BITJOIN,27)@8
    assign rd_q = {Data_Type_Conversion1_sel_x_b, Data_Type_Conversion_sel_x_b};

    // rd_addr_final(BITJOIN,28)@8
    assign rd_addr_final_q = {redist34_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Mux_x_q_1_q, rd_q};

    // DualMem_imag_x_addrB_hi(BITSELECT,367)@8
    assign DualMem_imag_x_addrB_hi_b = rd_addr_final_q[14:11];

    // DualMem_imag_x_csB15(LOOKUP,384)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b1111 : DualMem_imag_x_csB15_h = 1'b1;
            default : DualMem_imag_x_csB15_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_addrB_lo(BITSELECT,385)@8
    assign DualMem_imag_x_addrB_lo_in = $unsigned(rd_addr_final_q[10:0]);
    assign DualMem_imag_x_addrB_lo_b = $unsigned(DualMem_imag_x_addrB_lo_in[10:0]);

    // redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_rdcnt(ADD,580)
    assign redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_rdcnt_a = {1'b0, redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_wraddr_q};
    assign redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_rdcnt_b = {1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Const4_x_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_rdcnt_o <= $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_rdcnt_a) + $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_rdcnt_b);
        end
    end
    assign redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_rdcnt_q = redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_rdcnt_o[3:0];

    // redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_wraddr(COUNTER,578)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_wraddr_i <= $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_wraddr_q = redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_wraddr_i[2:0];

    // redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem(DUALMEM,577)
    assign redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_ia = $unsigned(in_1_imag_datain_tpl);
    assign redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_aa = redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_wraddr_q;
    assign redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_ab = redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_rdcnt_q[2:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(16),
        .widthad_b(3),
        .numwords_b(8),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_aa),
        .data_a(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_ab),
        .q_b(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q = redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_iq[15:0];

    // redist25_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_q_1(DELAY,548)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist25_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_q);
        end
    end

    // datablkwrite(BITSELECT,26)@8
    assign datablkwrite_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0[1:0];

    // BitCombine(BITJOIN,21)@8
    assign BitCombine_q = {redist25_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Mux_x_q_1_q, datablkwrite_b};

    // rightShiftStage1Idx1Rng4_uid247_wraddr(BITSELECT,246)@8
    assign rightShiftStage1Idx1Rng4_uid247_wraddr_b = rightShiftStage0_uid246_wraddr_q[16:4];

    // rightShiftStage1Idx1_uid249_wraddr(BITJOIN,248)@8
    assign rightShiftStage1Idx1_uid249_wraddr_q = {leftShiftStage1Idx1Pad4_uid222_LShift_q, rightShiftStage1Idx1Rng4_uid247_wraddr_b};

    // rightShiftStage0Idx3Rng3_uid242_wraddr(BITSELECT,241)@8
    assign rightShiftStage0Idx3Rng3_uid242_wraddr_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0[16:3];

    // rightShiftStage0Idx3_uid244_wraddr(BITJOIN,243)@8
    assign rightShiftStage0Idx3_uid244_wraddr_q = {cz_uid209_LShift_q, rightShiftStage0Idx3Rng3_uid242_wraddr_b};

    // rightShiftStage0Idx2Rng2_uid239_wraddr(BITSELECT,238)@8
    assign rightShiftStage0Idx2Rng2_uid239_wraddr_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0[16:2];

    // rightShiftStage0Idx2_uid241_wraddr(BITJOIN,240)@8
    assign rightShiftStage0Idx2_uid241_wraddr_q = {leftShiftStage0Idx2Pad2_uid214_LShift_q, rightShiftStage0Idx2Rng2_uid239_wraddr_b};

    // rightShiftStage0Idx1Rng1_uid236_wraddr(BITSELECT,235)@8
    assign rightShiftStage0Idx1Rng1_uid236_wraddr_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0[16:1];

    // rightShiftStage0Idx1_uid238_wraddr(BITJOIN,237)@8
    assign rightShiftStage0Idx1_uid238_wraddr_q = {GND_q, rightShiftStage0Idx1Rng1_uid236_wraddr_b};

    // rightShiftStage0_uid246_wraddr(MUX,245)@8
    assign rightShiftStage0_uid246_wraddr_s = redist1_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_b_1_q;
    always @(rightShiftStage0_uid246_wraddr_s or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0 or rightShiftStage0Idx1_uid238_wraddr_q or rightShiftStage0Idx2_uid241_wraddr_q or rightShiftStage0Idx3_uid244_wraddr_q)
    begin
        unique case (rightShiftStage0_uid246_wraddr_s)
            2'b00 : rightShiftStage0_uid246_wraddr_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_q0;
            2'b01 : rightShiftStage0_uid246_wraddr_q = rightShiftStage0Idx1_uid238_wraddr_q;
            2'b10 : rightShiftStage0_uid246_wraddr_q = rightShiftStage0Idx2_uid241_wraddr_q;
            2'b11 : rightShiftStage0_uid246_wraddr_q = rightShiftStage0Idx3_uid244_wraddr_q;
            default : rightShiftStage0_uid246_wraddr_q = 17'b0;
        endcase
    end

    // rightShiftStage1_uid251_wraddr(MUX,250)@8
    assign rightShiftStage1_uid251_wraddr_s = redist3_rightShiftStageSel0Dto0_uid245_wraddr_bit_select_merged_c_1_q;
    always @(rightShiftStage1_uid251_wraddr_s or rightShiftStage0_uid246_wraddr_q or rightShiftStage1Idx1_uid249_wraddr_q)
    begin
        unique case (rightShiftStage1_uid251_wraddr_s)
            1'b0 : rightShiftStage1_uid251_wraddr_q = rightShiftStage0_uid246_wraddr_q;
            1'b1 : rightShiftStage1_uid251_wraddr_q = rightShiftStage1Idx1_uid249_wraddr_q;
            default : rightShiftStage1_uid251_wraddr_q = 17'b0;
        endcase
    end

    // shifter_uid252_wraddr(BITSELECT,251)@8
    assign shifter_uid252_wraddr_in = $unsigned(rightShiftStage1_uid251_wraddr_q[11:0]);
    assign shifter_uid252_wraddr_b = $unsigned(shifter_uid252_wraddr_in[11:0]);

    // Wr_addr_final(BITJOIN,25)@8
    assign Wr_addr_final_q = {BitCombine_q, shifter_uid252_wraddr_b};

    // DualMem_imag_x_addrA_hi(BITSELECT,345)@8
    assign DualMem_imag_x_addrA_hi_b = Wr_addr_final_q[14:11];

    // DualMem_imag_x_csA15(LOOKUP,363)@8
    assign DualMem_imag_x_csA15_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA15_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b1111 : begin
                          DualMem_imag_x_csA15_h = 1'b1;
                          DualMem_imag_x_csA15_e = DualMem_imag_x_csA15_c;
                      end
            default : begin
                          DualMem_imag_x_csA15_h = 1'b0;
                          DualMem_imag_x_csA15_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_addrA_lo(BITSELECT,364)@8
    assign DualMem_imag_x_addrA_lo_in = $unsigned(Wr_addr_final_q[10:0]);
    assign DualMem_imag_x_addrA_lo_b = $unsigned(DualMem_imag_x_addrA_lo_in[10:0]);

    // DualMem_imag_x_part15(DUALMEM,402)@8 + 2
    assign DualMem_imag_x_part15_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part15_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part15_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_imag_x_part15_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part15_reset0 = areset;
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
    ) DualMem_imag_x_part15_dmem (
        .clocken0(DualMem_imag_x_part15_ena_NotRstA),
        .sclr(DualMem_imag_x_part15_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part15_aa),
        .data_a(DualMem_imag_x_part15_ia),
        .wren_a(DualMem_imag_x_csA15_e[0]),
        .address_b(DualMem_imag_x_part15_ab),
        .q_b(DualMem_imag_x_part15_iq),
        .rden_b(DualMem_imag_x_csB15_h[0]),
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
    assign DualMem_imag_x_part15_q = DualMem_imag_x_part15_iq[15:0];

    // DualMem_imag_x_csB14(LOOKUP,383)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b1110 : DualMem_imag_x_csB14_h = 1'b1;
            default : DualMem_imag_x_csB14_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA14(LOOKUP,362)@8
    assign DualMem_imag_x_csA14_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA14_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b1110 : begin
                          DualMem_imag_x_csA14_h = 1'b1;
                          DualMem_imag_x_csA14_e = DualMem_imag_x_csA14_c;
                      end
            default : begin
                          DualMem_imag_x_csA14_h = 1'b0;
                          DualMem_imag_x_csA14_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_part14(DUALMEM,401)@8 + 2
    assign DualMem_imag_x_part14_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part14_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part14_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_imag_x_part14_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part14_reset0 = areset;
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
    ) DualMem_imag_x_part14_dmem (
        .clocken0(DualMem_imag_x_part14_ena_NotRstA),
        .sclr(DualMem_imag_x_part14_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part14_aa),
        .data_a(DualMem_imag_x_part14_ia),
        .wren_a(DualMem_imag_x_csA14_e[0]),
        .address_b(DualMem_imag_x_part14_ab),
        .q_b(DualMem_imag_x_part14_iq),
        .rden_b(DualMem_imag_x_csB14_h[0]),
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
    assign DualMem_imag_x_part14_q = DualMem_imag_x_part14_iq[15:0];

    // DualMem_imag_x_csB13(LOOKUP,382)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b1101 : DualMem_imag_x_csB13_h = 1'b1;
            default : DualMem_imag_x_csB13_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA13(LOOKUP,361)@8
    assign DualMem_imag_x_csA13_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA13_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b1101 : begin
                          DualMem_imag_x_csA13_h = 1'b1;
                          DualMem_imag_x_csA13_e = DualMem_imag_x_csA13_c;
                      end
            default : begin
                          DualMem_imag_x_csA13_h = 1'b0;
                          DualMem_imag_x_csA13_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_part13(DUALMEM,400)@8 + 2
    assign DualMem_imag_x_part13_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part13_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part13_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_imag_x_part13_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part13_reset0 = areset;
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
    ) DualMem_imag_x_part13_dmem (
        .clocken0(DualMem_imag_x_part13_ena_NotRstA),
        .sclr(DualMem_imag_x_part13_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part13_aa),
        .data_a(DualMem_imag_x_part13_ia),
        .wren_a(DualMem_imag_x_csA13_e[0]),
        .address_b(DualMem_imag_x_part13_ab),
        .q_b(DualMem_imag_x_part13_iq),
        .rden_b(DualMem_imag_x_csB13_h[0]),
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
    assign DualMem_imag_x_part13_q = DualMem_imag_x_part13_iq[15:0];

    // DualMem_imag_x_csB12(LOOKUP,381)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b1100 : DualMem_imag_x_csB12_h = 1'b1;
            default : DualMem_imag_x_csB12_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA12(LOOKUP,360)@8
    assign DualMem_imag_x_csA12_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA12_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b1100 : begin
                          DualMem_imag_x_csA12_h = 1'b1;
                          DualMem_imag_x_csA12_e = DualMem_imag_x_csA12_c;
                      end
            default : begin
                          DualMem_imag_x_csA12_h = 1'b0;
                          DualMem_imag_x_csA12_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_part12(DUALMEM,399)@8 + 2
    assign DualMem_imag_x_part12_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part12_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part12_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_imag_x_part12_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part12_reset0 = areset;
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
    ) DualMem_imag_x_part12_dmem (
        .clocken0(DualMem_imag_x_part12_ena_NotRstA),
        .sclr(DualMem_imag_x_part12_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part12_aa),
        .data_a(DualMem_imag_x_part12_ia),
        .wren_a(DualMem_imag_x_csA12_e[0]),
        .address_b(DualMem_imag_x_part12_ab),
        .q_b(DualMem_imag_x_part12_iq),
        .rden_b(DualMem_imag_x_csB12_h[0]),
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
    assign DualMem_imag_x_part12_q = DualMem_imag_x_part12_iq[15:0];

    // DualMem_imag_x_qB_l0_or3(LOGICAL,411)@10
    assign DualMem_imag_x_qB_l0_or3_q = DualMem_imag_x_part12_q | DualMem_imag_x_part13_q | DualMem_imag_x_part14_q | DualMem_imag_x_part15_q;

    // DualMem_imag_x_csB11(LOOKUP,380)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b1011 : DualMem_imag_x_csB11_h = 1'b1;
            default : DualMem_imag_x_csB11_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA11(LOOKUP,359)@8
    assign DualMem_imag_x_csA11_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA11_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b1011 : begin
                          DualMem_imag_x_csA11_h = 1'b1;
                          DualMem_imag_x_csA11_e = DualMem_imag_x_csA11_c;
                      end
            default : begin
                          DualMem_imag_x_csA11_h = 1'b0;
                          DualMem_imag_x_csA11_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_part11(DUALMEM,398)@8 + 2
    assign DualMem_imag_x_part11_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part11_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part11_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_imag_x_part11_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part11_reset0 = areset;
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
    ) DualMem_imag_x_part11_dmem (
        .clocken0(DualMem_imag_x_part11_ena_NotRstA),
        .sclr(DualMem_imag_x_part11_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part11_aa),
        .data_a(DualMem_imag_x_part11_ia),
        .wren_a(DualMem_imag_x_csA11_e[0]),
        .address_b(DualMem_imag_x_part11_ab),
        .q_b(DualMem_imag_x_part11_iq),
        .rden_b(DualMem_imag_x_csB11_h[0]),
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
    assign DualMem_imag_x_part11_q = DualMem_imag_x_part11_iq[15:0];

    // DualMem_imag_x_csB10(LOOKUP,379)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b1010 : DualMem_imag_x_csB10_h = 1'b1;
            default : DualMem_imag_x_csB10_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA10(LOOKUP,358)@8
    assign DualMem_imag_x_csA10_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA10_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b1010 : begin
                          DualMem_imag_x_csA10_h = 1'b1;
                          DualMem_imag_x_csA10_e = DualMem_imag_x_csA10_c;
                      end
            default : begin
                          DualMem_imag_x_csA10_h = 1'b0;
                          DualMem_imag_x_csA10_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_part10(DUALMEM,397)@8 + 2
    assign DualMem_imag_x_part10_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part10_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part10_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_imag_x_part10_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part10_reset0 = areset;
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
    ) DualMem_imag_x_part10_dmem (
        .clocken0(DualMem_imag_x_part10_ena_NotRstA),
        .sclr(DualMem_imag_x_part10_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part10_aa),
        .data_a(DualMem_imag_x_part10_ia),
        .wren_a(DualMem_imag_x_csA10_e[0]),
        .address_b(DualMem_imag_x_part10_ab),
        .q_b(DualMem_imag_x_part10_iq),
        .rden_b(DualMem_imag_x_csB10_h[0]),
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
    assign DualMem_imag_x_part10_q = DualMem_imag_x_part10_iq[15:0];

    // DualMem_imag_x_csB9(LOOKUP,378)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b1001 : DualMem_imag_x_csB9_h = 1'b1;
            default : DualMem_imag_x_csB9_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA9(LOOKUP,357)@8
    assign DualMem_imag_x_csA9_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA9_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b1001 : begin
                          DualMem_imag_x_csA9_h = 1'b1;
                          DualMem_imag_x_csA9_e = DualMem_imag_x_csA9_c;
                      end
            default : begin
                          DualMem_imag_x_csA9_h = 1'b0;
                          DualMem_imag_x_csA9_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_part9(DUALMEM,396)@8 + 2
    assign DualMem_imag_x_part9_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part9_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part9_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_imag_x_part9_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part9_reset0 = areset;
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
    ) DualMem_imag_x_part9_dmem (
        .clocken0(DualMem_imag_x_part9_ena_NotRstA),
        .sclr(DualMem_imag_x_part9_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part9_aa),
        .data_a(DualMem_imag_x_part9_ia),
        .wren_a(DualMem_imag_x_csA9_e[0]),
        .address_b(DualMem_imag_x_part9_ab),
        .q_b(DualMem_imag_x_part9_iq),
        .rden_b(DualMem_imag_x_csB9_h[0]),
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
    assign DualMem_imag_x_part9_q = DualMem_imag_x_part9_iq[15:0];

    // DualMem_imag_x_csB8(LOOKUP,377)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b1000 : DualMem_imag_x_csB8_h = 1'b1;
            default : DualMem_imag_x_csB8_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA8(LOOKUP,356)@8
    assign DualMem_imag_x_csA8_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA8_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b1000 : begin
                          DualMem_imag_x_csA8_h = 1'b1;
                          DualMem_imag_x_csA8_e = DualMem_imag_x_csA8_c;
                      end
            default : begin
                          DualMem_imag_x_csA8_h = 1'b0;
                          DualMem_imag_x_csA8_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_part8(DUALMEM,395)@8 + 2
    assign DualMem_imag_x_part8_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part8_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part8_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_imag_x_part8_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part8_reset0 = areset;
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
    ) DualMem_imag_x_part8_dmem (
        .clocken0(DualMem_imag_x_part8_ena_NotRstA),
        .sclr(DualMem_imag_x_part8_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part8_aa),
        .data_a(DualMem_imag_x_part8_ia),
        .wren_a(DualMem_imag_x_csA8_e[0]),
        .address_b(DualMem_imag_x_part8_ab),
        .q_b(DualMem_imag_x_part8_iq),
        .rden_b(DualMem_imag_x_csB8_h[0]),
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
    assign DualMem_imag_x_part8_q = DualMem_imag_x_part8_iq[15:0];

    // DualMem_imag_x_qB_l0_or2(LOGICAL,410)@10
    assign DualMem_imag_x_qB_l0_or2_q = DualMem_imag_x_part8_q | DualMem_imag_x_part9_q | DualMem_imag_x_part10_q | DualMem_imag_x_part11_q;

    // DualMem_imag_x_csB7(LOOKUP,376)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b0111 : DualMem_imag_x_csB7_h = 1'b1;
            default : DualMem_imag_x_csB7_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA7(LOOKUP,355)@8
    assign DualMem_imag_x_csA7_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA7_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b0111 : begin
                          DualMem_imag_x_csA7_h = 1'b1;
                          DualMem_imag_x_csA7_e = DualMem_imag_x_csA7_c;
                      end
            default : begin
                          DualMem_imag_x_csA7_h = 1'b0;
                          DualMem_imag_x_csA7_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_part7(DUALMEM,394)@8 + 2
    assign DualMem_imag_x_part7_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part7_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part7_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_imag_x_part7_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part7_reset0 = areset;
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
    ) DualMem_imag_x_part7_dmem (
        .clocken0(DualMem_imag_x_part7_ena_NotRstA),
        .sclr(DualMem_imag_x_part7_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part7_aa),
        .data_a(DualMem_imag_x_part7_ia),
        .wren_a(DualMem_imag_x_csA7_e[0]),
        .address_b(DualMem_imag_x_part7_ab),
        .q_b(DualMem_imag_x_part7_iq),
        .rden_b(DualMem_imag_x_csB7_h[0]),
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
    assign DualMem_imag_x_part7_q = DualMem_imag_x_part7_iq[15:0];

    // DualMem_imag_x_csB6(LOOKUP,375)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b0110 : DualMem_imag_x_csB6_h = 1'b1;
            default : DualMem_imag_x_csB6_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA6(LOOKUP,354)@8
    assign DualMem_imag_x_csA6_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA6_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b0110 : begin
                          DualMem_imag_x_csA6_h = 1'b1;
                          DualMem_imag_x_csA6_e = DualMem_imag_x_csA6_c;
                      end
            default : begin
                          DualMem_imag_x_csA6_h = 1'b0;
                          DualMem_imag_x_csA6_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_part6(DUALMEM,393)@8 + 2
    assign DualMem_imag_x_part6_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part6_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part6_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_imag_x_part6_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part6_reset0 = areset;
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
    ) DualMem_imag_x_part6_dmem (
        .clocken0(DualMem_imag_x_part6_ena_NotRstA),
        .sclr(DualMem_imag_x_part6_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part6_aa),
        .data_a(DualMem_imag_x_part6_ia),
        .wren_a(DualMem_imag_x_csA6_e[0]),
        .address_b(DualMem_imag_x_part6_ab),
        .q_b(DualMem_imag_x_part6_iq),
        .rden_b(DualMem_imag_x_csB6_h[0]),
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
    assign DualMem_imag_x_part6_q = DualMem_imag_x_part6_iq[15:0];

    // DualMem_imag_x_csB5(LOOKUP,374)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b0101 : DualMem_imag_x_csB5_h = 1'b1;
            default : DualMem_imag_x_csB5_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA5(LOOKUP,353)@8
    assign DualMem_imag_x_csA5_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA5_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b0101 : begin
                          DualMem_imag_x_csA5_h = 1'b1;
                          DualMem_imag_x_csA5_e = DualMem_imag_x_csA5_c;
                      end
            default : begin
                          DualMem_imag_x_csA5_h = 1'b0;
                          DualMem_imag_x_csA5_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_part5(DUALMEM,392)@8 + 2
    assign DualMem_imag_x_part5_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part5_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part5_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_imag_x_part5_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part5_reset0 = areset;
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
    ) DualMem_imag_x_part5_dmem (
        .clocken0(DualMem_imag_x_part5_ena_NotRstA),
        .sclr(DualMem_imag_x_part5_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part5_aa),
        .data_a(DualMem_imag_x_part5_ia),
        .wren_a(DualMem_imag_x_csA5_e[0]),
        .address_b(DualMem_imag_x_part5_ab),
        .q_b(DualMem_imag_x_part5_iq),
        .rden_b(DualMem_imag_x_csB5_h[0]),
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
    assign DualMem_imag_x_part5_q = DualMem_imag_x_part5_iq[15:0];

    // DualMem_imag_x_csB4(LOOKUP,373)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b0100 : DualMem_imag_x_csB4_h = 1'b1;
            default : DualMem_imag_x_csB4_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA4(LOOKUP,352)@8
    assign DualMem_imag_x_csA4_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA4_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b0100 : begin
                          DualMem_imag_x_csA4_h = 1'b1;
                          DualMem_imag_x_csA4_e = DualMem_imag_x_csA4_c;
                      end
            default : begin
                          DualMem_imag_x_csA4_h = 1'b0;
                          DualMem_imag_x_csA4_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_part4(DUALMEM,391)@8 + 2
    assign DualMem_imag_x_part4_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part4_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part4_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_imag_x_part4_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_part4_reset0 = areset;
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
    ) DualMem_imag_x_part4_dmem (
        .clocken0(DualMem_imag_x_part4_ena_NotRstA),
        .sclr(DualMem_imag_x_part4_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_part4_aa),
        .data_a(DualMem_imag_x_part4_ia),
        .wren_a(DualMem_imag_x_csA4_e[0]),
        .address_b(DualMem_imag_x_part4_ab),
        .q_b(DualMem_imag_x_part4_iq),
        .rden_b(DualMem_imag_x_csB4_h[0]),
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
    assign DualMem_imag_x_part4_q = DualMem_imag_x_part4_iq[15:0];

    // DualMem_imag_x_qB_l0_or1(LOGICAL,409)@10
    assign DualMem_imag_x_qB_l0_or1_q = DualMem_imag_x_part4_q | DualMem_imag_x_part5_q | DualMem_imag_x_part6_q | DualMem_imag_x_part7_q;

    // DualMem_imag_x_csB3(LOOKUP,372)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b0011 : DualMem_imag_x_csB3_h = 1'b1;
            default : DualMem_imag_x_csB3_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA3(LOOKUP,351)@8
    assign DualMem_imag_x_csA3_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b0011 : begin
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

    // DualMem_imag_x_part3(DUALMEM,390)@8 + 2
    assign DualMem_imag_x_part3_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part3_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part3_ab = DualMem_imag_x_addrB_lo_b;
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

    // DualMem_imag_x_csB2(LOOKUP,371)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b0010 : DualMem_imag_x_csB2_h = 1'b1;
            default : DualMem_imag_x_csB2_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA2(LOOKUP,350)@8
    assign DualMem_imag_x_csA2_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b0010 : begin
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

    // DualMem_imag_x_part2(DUALMEM,389)@8 + 2
    assign DualMem_imag_x_part2_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part2_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part2_ab = DualMem_imag_x_addrB_lo_b;
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

    // DualMem_imag_x_csB1(LOOKUP,370)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b0001 : DualMem_imag_x_csB1_h = 1'b1;
            default : DualMem_imag_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA1(LOOKUP,349)@8
    assign DualMem_imag_x_csA1_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b0001 : begin
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

    // DualMem_imag_x_part1(DUALMEM,388)@8 + 2
    assign DualMem_imag_x_part1_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part1_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part1_ab = DualMem_imag_x_addrB_lo_b;
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

    // DualMem_imag_x_csB0(LOOKUP,369)@8
    always @(DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrB_hi_b)
            4'b0000 : DualMem_imag_x_csB0_h = 1'b1;
            default : DualMem_imag_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // DualMem_imag_x_csA0(LOOKUP,348)@8
    assign DualMem_imag_x_csA0_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_cnt2_datalen_x_v);
    always @(DualMem_imag_x_addrA_hi_b or DualMem_imag_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (DualMem_imag_x_addrA_hi_b)
            4'b0000 : begin
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

    // DualMem_imag_x_part0(DUALMEM,387)@8 + 2
    assign DualMem_imag_x_part0_ia = $unsigned(redist41_ChannelIn_cunroll_x_in_1_imag_datain_tpl_8_mem_q);
    assign DualMem_imag_x_part0_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_imag_x_part0_ab = DualMem_imag_x_addrB_lo_b;
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

    // DualMem_imag_x_qB_l0_or0(LOGICAL,408)@10
    assign DualMem_imag_x_qB_l0_or0_q = DualMem_imag_x_part0_q | DualMem_imag_x_part1_q | DualMem_imag_x_part2_q | DualMem_imag_x_part3_q;

    // DualMem_imag_x_qB_l1_or0(LOGICAL,412)@10
    assign DualMem_imag_x_qB_l1_or0_q = DualMem_imag_x_qB_l0_or0_q | DualMem_imag_x_qB_l0_or1_q | DualMem_imag_x_qB_l0_or2_q | DualMem_imag_x_qB_l0_or3_q;

    // redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_rdcnt(ADD,576)
    assign redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_rdcnt_a = {1'b0, redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_wraddr_q};
    assign redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_rdcnt_b = {1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Const4_x_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_rdcnt_o <= $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_rdcnt_a) + $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_rdcnt_b);
        end
    end
    assign redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_rdcnt_q = redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_rdcnt_o[3:0];

    // redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_wraddr(COUNTER,574)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_wraddr_i <= $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_wraddr_q = redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_wraddr_i[2:0];

    // redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem(DUALMEM,573)
    assign redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_ia = $unsigned(in_1_real_datain_tpl);
    assign redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_aa = redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_wraddr_q;
    assign redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_ab = redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_rdcnt_q[2:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(16),
        .widthad_b(3),
        .numwords_b(8),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_aa),
        .data_a(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_ab),
        .q_b(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q = redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_iq[15:0];

    // DualMem_real_x_part15(DUALMEM,470)@8 + 2
    assign DualMem_real_x_part15_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part15_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part15_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_real_x_part15_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part15_reset0 = areset;
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
    ) DualMem_real_x_part15_dmem (
        .clocken0(DualMem_real_x_part15_ena_NotRstA),
        .sclr(DualMem_real_x_part15_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part15_aa),
        .data_a(DualMem_real_x_part15_ia),
        .wren_a(DualMem_imag_x_csA15_e[0]),
        .address_b(DualMem_real_x_part15_ab),
        .q_b(DualMem_real_x_part15_iq),
        .rden_b(DualMem_imag_x_csB15_h[0]),
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
    assign DualMem_real_x_part15_q = DualMem_real_x_part15_iq[15:0];

    // DualMem_real_x_part14(DUALMEM,469)@8 + 2
    assign DualMem_real_x_part14_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part14_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part14_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_real_x_part14_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part14_reset0 = areset;
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
    ) DualMem_real_x_part14_dmem (
        .clocken0(DualMem_real_x_part14_ena_NotRstA),
        .sclr(DualMem_real_x_part14_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part14_aa),
        .data_a(DualMem_real_x_part14_ia),
        .wren_a(DualMem_imag_x_csA14_e[0]),
        .address_b(DualMem_real_x_part14_ab),
        .q_b(DualMem_real_x_part14_iq),
        .rden_b(DualMem_imag_x_csB14_h[0]),
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
    assign DualMem_real_x_part14_q = DualMem_real_x_part14_iq[15:0];

    // DualMem_real_x_part13(DUALMEM,468)@8 + 2
    assign DualMem_real_x_part13_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part13_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part13_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_real_x_part13_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part13_reset0 = areset;
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
    ) DualMem_real_x_part13_dmem (
        .clocken0(DualMem_real_x_part13_ena_NotRstA),
        .sclr(DualMem_real_x_part13_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part13_aa),
        .data_a(DualMem_real_x_part13_ia),
        .wren_a(DualMem_imag_x_csA13_e[0]),
        .address_b(DualMem_real_x_part13_ab),
        .q_b(DualMem_real_x_part13_iq),
        .rden_b(DualMem_imag_x_csB13_h[0]),
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
    assign DualMem_real_x_part13_q = DualMem_real_x_part13_iq[15:0];

    // DualMem_real_x_part12(DUALMEM,467)@8 + 2
    assign DualMem_real_x_part12_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part12_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part12_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_real_x_part12_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part12_reset0 = areset;
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
    ) DualMem_real_x_part12_dmem (
        .clocken0(DualMem_real_x_part12_ena_NotRstA),
        .sclr(DualMem_real_x_part12_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part12_aa),
        .data_a(DualMem_real_x_part12_ia),
        .wren_a(DualMem_imag_x_csA12_e[0]),
        .address_b(DualMem_real_x_part12_ab),
        .q_b(DualMem_real_x_part12_iq),
        .rden_b(DualMem_imag_x_csB12_h[0]),
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
    assign DualMem_real_x_part12_q = DualMem_real_x_part12_iq[15:0];

    // DualMem_real_x_qB_l0_or3(LOGICAL,479)@10
    assign DualMem_real_x_qB_l0_or3_q = DualMem_real_x_part12_q | DualMem_real_x_part13_q | DualMem_real_x_part14_q | DualMem_real_x_part15_q;

    // DualMem_real_x_part11(DUALMEM,466)@8 + 2
    assign DualMem_real_x_part11_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part11_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part11_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_real_x_part11_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part11_reset0 = areset;
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
    ) DualMem_real_x_part11_dmem (
        .clocken0(DualMem_real_x_part11_ena_NotRstA),
        .sclr(DualMem_real_x_part11_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part11_aa),
        .data_a(DualMem_real_x_part11_ia),
        .wren_a(DualMem_imag_x_csA11_e[0]),
        .address_b(DualMem_real_x_part11_ab),
        .q_b(DualMem_real_x_part11_iq),
        .rden_b(DualMem_imag_x_csB11_h[0]),
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
    assign DualMem_real_x_part11_q = DualMem_real_x_part11_iq[15:0];

    // DualMem_real_x_part10(DUALMEM,465)@8 + 2
    assign DualMem_real_x_part10_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part10_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part10_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_real_x_part10_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part10_reset0 = areset;
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
    ) DualMem_real_x_part10_dmem (
        .clocken0(DualMem_real_x_part10_ena_NotRstA),
        .sclr(DualMem_real_x_part10_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part10_aa),
        .data_a(DualMem_real_x_part10_ia),
        .wren_a(DualMem_imag_x_csA10_e[0]),
        .address_b(DualMem_real_x_part10_ab),
        .q_b(DualMem_real_x_part10_iq),
        .rden_b(DualMem_imag_x_csB10_h[0]),
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
    assign DualMem_real_x_part10_q = DualMem_real_x_part10_iq[15:0];

    // DualMem_real_x_part9(DUALMEM,464)@8 + 2
    assign DualMem_real_x_part9_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part9_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part9_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_real_x_part9_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part9_reset0 = areset;
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
    ) DualMem_real_x_part9_dmem (
        .clocken0(DualMem_real_x_part9_ena_NotRstA),
        .sclr(DualMem_real_x_part9_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part9_aa),
        .data_a(DualMem_real_x_part9_ia),
        .wren_a(DualMem_imag_x_csA9_e[0]),
        .address_b(DualMem_real_x_part9_ab),
        .q_b(DualMem_real_x_part9_iq),
        .rden_b(DualMem_imag_x_csB9_h[0]),
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
    assign DualMem_real_x_part9_q = DualMem_real_x_part9_iq[15:0];

    // DualMem_real_x_part8(DUALMEM,463)@8 + 2
    assign DualMem_real_x_part8_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part8_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part8_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_real_x_part8_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part8_reset0 = areset;
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
    ) DualMem_real_x_part8_dmem (
        .clocken0(DualMem_real_x_part8_ena_NotRstA),
        .sclr(DualMem_real_x_part8_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part8_aa),
        .data_a(DualMem_real_x_part8_ia),
        .wren_a(DualMem_imag_x_csA8_e[0]),
        .address_b(DualMem_real_x_part8_ab),
        .q_b(DualMem_real_x_part8_iq),
        .rden_b(DualMem_imag_x_csB8_h[0]),
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
    assign DualMem_real_x_part8_q = DualMem_real_x_part8_iq[15:0];

    // DualMem_real_x_qB_l0_or2(LOGICAL,478)@10
    assign DualMem_real_x_qB_l0_or2_q = DualMem_real_x_part8_q | DualMem_real_x_part9_q | DualMem_real_x_part10_q | DualMem_real_x_part11_q;

    // DualMem_real_x_part7(DUALMEM,462)@8 + 2
    assign DualMem_real_x_part7_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part7_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part7_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_real_x_part7_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part7_reset0 = areset;
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
    ) DualMem_real_x_part7_dmem (
        .clocken0(DualMem_real_x_part7_ena_NotRstA),
        .sclr(DualMem_real_x_part7_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part7_aa),
        .data_a(DualMem_real_x_part7_ia),
        .wren_a(DualMem_imag_x_csA7_e[0]),
        .address_b(DualMem_real_x_part7_ab),
        .q_b(DualMem_real_x_part7_iq),
        .rden_b(DualMem_imag_x_csB7_h[0]),
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
    assign DualMem_real_x_part7_q = DualMem_real_x_part7_iq[15:0];

    // DualMem_real_x_part6(DUALMEM,461)@8 + 2
    assign DualMem_real_x_part6_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part6_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part6_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_real_x_part6_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part6_reset0 = areset;
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
    ) DualMem_real_x_part6_dmem (
        .clocken0(DualMem_real_x_part6_ena_NotRstA),
        .sclr(DualMem_real_x_part6_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part6_aa),
        .data_a(DualMem_real_x_part6_ia),
        .wren_a(DualMem_imag_x_csA6_e[0]),
        .address_b(DualMem_real_x_part6_ab),
        .q_b(DualMem_real_x_part6_iq),
        .rden_b(DualMem_imag_x_csB6_h[0]),
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
    assign DualMem_real_x_part6_q = DualMem_real_x_part6_iq[15:0];

    // DualMem_real_x_part5(DUALMEM,460)@8 + 2
    assign DualMem_real_x_part5_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part5_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part5_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_real_x_part5_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part5_reset0 = areset;
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
    ) DualMem_real_x_part5_dmem (
        .clocken0(DualMem_real_x_part5_ena_NotRstA),
        .sclr(DualMem_real_x_part5_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part5_aa),
        .data_a(DualMem_real_x_part5_ia),
        .wren_a(DualMem_imag_x_csA5_e[0]),
        .address_b(DualMem_real_x_part5_ab),
        .q_b(DualMem_real_x_part5_iq),
        .rden_b(DualMem_imag_x_csB5_h[0]),
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
    assign DualMem_real_x_part5_q = DualMem_real_x_part5_iq[15:0];

    // DualMem_real_x_part4(DUALMEM,459)@8 + 2
    assign DualMem_real_x_part4_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part4_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part4_ab = DualMem_imag_x_addrB_lo_b;
    assign DualMem_real_x_part4_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_part4_reset0 = areset;
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
    ) DualMem_real_x_part4_dmem (
        .clocken0(DualMem_real_x_part4_ena_NotRstA),
        .sclr(DualMem_real_x_part4_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_part4_aa),
        .data_a(DualMem_real_x_part4_ia),
        .wren_a(DualMem_imag_x_csA4_e[0]),
        .address_b(DualMem_real_x_part4_ab),
        .q_b(DualMem_real_x_part4_iq),
        .rden_b(DualMem_imag_x_csB4_h[0]),
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
    assign DualMem_real_x_part4_q = DualMem_real_x_part4_iq[15:0];

    // DualMem_real_x_qB_l0_or1(LOGICAL,477)@10
    assign DualMem_real_x_qB_l0_or1_q = DualMem_real_x_part4_q | DualMem_real_x_part5_q | DualMem_real_x_part6_q | DualMem_real_x_part7_q;

    // DualMem_real_x_part3(DUALMEM,458)@8 + 2
    assign DualMem_real_x_part3_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part3_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part3_ab = DualMem_imag_x_addrB_lo_b;
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
        .wren_a(DualMem_imag_x_csA3_e[0]),
        .address_b(DualMem_real_x_part3_ab),
        .q_b(DualMem_real_x_part3_iq),
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
    assign DualMem_real_x_part3_q = DualMem_real_x_part3_iq[15:0];

    // DualMem_real_x_part2(DUALMEM,457)@8 + 2
    assign DualMem_real_x_part2_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part2_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part2_ab = DualMem_imag_x_addrB_lo_b;
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
        .wren_a(DualMem_imag_x_csA2_e[0]),
        .address_b(DualMem_real_x_part2_ab),
        .q_b(DualMem_real_x_part2_iq),
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
    assign DualMem_real_x_part2_q = DualMem_real_x_part2_iq[15:0];

    // DualMem_real_x_part1(DUALMEM,456)@8 + 2
    assign DualMem_real_x_part1_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part1_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part1_ab = DualMem_imag_x_addrB_lo_b;
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
        .wren_a(DualMem_imag_x_csA1_e[0]),
        .address_b(DualMem_real_x_part1_ab),
        .q_b(DualMem_real_x_part1_iq),
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
    assign DualMem_real_x_part1_q = DualMem_real_x_part1_iq[15:0];

    // DualMem_real_x_part0(DUALMEM,455)@8 + 2
    assign DualMem_real_x_part0_ia = $unsigned(redist40_ChannelIn_cunroll_x_in_1_real_datain_tpl_8_mem_q);
    assign DualMem_real_x_part0_aa = DualMem_imag_x_addrA_lo_b;
    assign DualMem_real_x_part0_ab = DualMem_imag_x_addrB_lo_b;
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
        .wren_a(DualMem_imag_x_csA0_e[0]),
        .address_b(DualMem_real_x_part0_ab),
        .q_b(DualMem_real_x_part0_iq),
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
    assign DualMem_real_x_part0_q = DualMem_real_x_part0_iq[15:0];

    // DualMem_real_x_qB_l0_or0(LOGICAL,476)@10
    assign DualMem_real_x_qB_l0_or0_q = DualMem_real_x_part0_q | DualMem_real_x_part1_q | DualMem_real_x_part2_q | DualMem_real_x_part3_q;

    // DualMem_real_x_qB_l1_or0(LOGICAL,480)@10
    assign DualMem_real_x_qB_l1_or0_q = DualMem_real_x_qB_l0_or0_q | DualMem_real_x_qB_l0_or1_q | DualMem_real_x_qB_l0_or2_q | DualMem_real_x_qB_l0_or3_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x(LOGICAL,86)@10 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x_qi = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_q == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_Const13_x_q ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ1_x(LOGICAL,85)@10
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ1_x_b = {3'b000, GND_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ1_x_q = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_q == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ1_x_b ? 1'b1 : 1'b0);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_And_x(LOGICAL,84)@10
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_And_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ1_x_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_CmpEQ3_x_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_Not1_x(LOGICAL,82)@7 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_Not1_x_qi = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_l0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_Not1_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_Not1_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_Not1_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_And_x(LOGICAL,81)@8 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_And_x_qi = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_Not1_x_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt1_membank_x_l0;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_And_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_And_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_And_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x(LOADABLECOUNTER,79)@9 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_en = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Rising_edge1_And_x_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_ld = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_Subsystem_And_x_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_i = {3'b000, GND_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s = {3'b000, VCC_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Incr_Symbol_out_val_Sym_counter_meta_data_Const5_x_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_up = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_inc);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dn = $unsigned({1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt[3:0]}) - $unsigned({1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dec[3:0]});
    always @ (posedge clk)
    begin
        reg [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_assert_helper_var;
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt <= $unsigned(4'b0000);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_inc <= $unsigned(4'b0001);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dec <= $unsigned(4'b1101);
        end
        else
        begin
            if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_ld == 1'b1)
            begin
                // synthesis translate_off
                assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l != 4'b0000) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x (LOADABLECOUNTER) : Modulo value cannot be zero");
                assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_i <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x (LOADABLECOUNTER) : Initial value cannot be greater than modulo value.");
                if (1'b0 & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s[3] == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_assert_helper_var = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s);
                    assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_assert_helper_var[3] != 1'b1) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x (LOADABLECOUNTER) : Absolute value of step cannot be greater than modulo value.");
                end
                else
                begin
                    assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x (LOADABLECOUNTER) : Absolute value of step cannot be greater than modulo value.");
                end
                assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_i != streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s != streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x (LOADABLECOUNTER) : Initial, step and modulo values cannot all be equal.");
                // synthesis translate_on

                if (1'b0 & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s[3] == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_inc <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s);
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dec <= $unsigned(4'd0) - $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s);
                end
                else
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_inc <= $unsigned(4'd0) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s);
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dec <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_l) - $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_s);
                end
            end
            if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_ld == 1'b1 | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_en == 1'b1)
            begin
                if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_ld == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_i;
                end
                else
                begin
                    if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dn[4] == 1'b1)
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_up;
                    end
                    else
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_dn[3:0];
                    end
                end
            end
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_cnt;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_1L_Mux_x(MUX,97)@10 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_1L_Mux_x_s = redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_l0_2_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_1L_Mux_x_q <= 4'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_1L_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_1L_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_1L_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_1L_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_Incr_Symbol_out_val_Sym_counter_meta_data_LoadableCounter1_x_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_1L_Mux_x_q <= 4'b0;
            endcase
        end
    end

    // redist31_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_2(DELAY,554)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist31_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_2_q <= '0;
        end
        else
        begin
            redist31_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_2_q <= $unsigned(redist30_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_1_q);
        end
    end

    // ChannelOut_cunroll_x(PORTOUT,31)@10 + 1
    assign out_1_vout_x_tpl = redist31_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_cnt2_databank_x_v_2_q;
    assign out_2_cout_tpl = {4'b0000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_rd_sub1_latch_1L_Mux_x_q};
    assign out_3_real_dout_tpl = DualMem_real_x_qB_l1_or0_q;
    assign out_3_imag_dout_tpl = DualMem_imag_x_qB_l1_or0_q;
    assign out_4_time_out_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_timeref_reg_FIFO_x_q;
    assign out_5_nprb_out_tpl = redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Nprb_fifo_latch_0L3_Mux_x_q_2_q;
    assign out_6_fft_size_out_tpl = redist14_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_fft_size_fifo_latch_0L3_Mux_x_q_2_q;
    assign out_7_eAxC_no_tpl = redist38_Data_Type_Conversion1_sel_x_b_2_q;
    assign out_8_sym_metadata_tpl = redist13_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_sym_metadata_fffo_FIFO_x_q_2_q;

endmodule
