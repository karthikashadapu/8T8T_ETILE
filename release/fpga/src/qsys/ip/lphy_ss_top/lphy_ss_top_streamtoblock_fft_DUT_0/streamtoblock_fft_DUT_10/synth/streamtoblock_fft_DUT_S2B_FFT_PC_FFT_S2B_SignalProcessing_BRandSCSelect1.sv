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

// SystemVerilog created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1 (
    input wire [0:0] in_1_v_tpl,
    input wire [7:0] in_2_c_tpl,
    input wire [15:0] in_3_real_x_tpl,
    input wire [15:0] in_3_imag_x_tpl,
    input wire [3:0] in_4_FFTSize_tpl,
    input wire [15:0] in_5_NSubCarr_tpl,
    input wire [63:0] in_6_time_in_tpl,
    input wire [0:0] in_7_DC_SC_EN_tpl,
    input wire [0:0] in_8_ripple_comp_en_tpl,
    input wire [0:0] in_9_rc_bw_sel_tpl,
    input wire [1:0] in_10_eAxC_tpl,
    input wire [63:0] in_11_metadata_in_tpl,
    output wire [0:0] out_1_qv_tpl,
    output wire [7:0] out_2_qc_tpl,
    output wire [15:0] out_3_real_q_tpl,
    output wire [15:0] out_3_imag_q_tpl,
    output wire [3:0] out_4_qsizeout_tpl,
    output wire [63:0] out_5_time_out_tpl,
    output wire [1:0] out_6_eAxC_out_tpl,
    output wire [63:0] out_7_meatadata_sym_out_tpl,
    input wire [15:0] in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    input wire [15:0] in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    output wire [11:0] out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    output wire [11:0] out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    output wire [15:0] out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    output wire [15:0] out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [0:0] And_rsrvd_fix_q;
    wire [0:0] CmpEQ_q;
    wire [7:0] Const_rsrvd_fix_q;
    wire FIFO_reset;
    wire [0:0] FIFO_f;
    wire [0:0] FIFO_e;
    wire [0:0] FIFO_t;
    wire [1:0] FIFO_q;
    wire [0:0] FIFO_empty;
    wire [0:0] FIFO_v;
    wire FIFO1_reset;
    wire [0:0] FIFO1_f;
    wire [0:0] FIFO1_e;
    wire [0:0] FIFO1_t;
    wire [63:0] FIFO1_q;
    wire [0:0] FIFO1_empty;
    wire [0:0] FIFO1_v;
    wire FIFO2_reset;
    wire [0:0] FIFO2_f;
    wire [0:0] FIFO2_e;
    wire [0:0] FIFO2_t;
    wire [63:0] FIFO2_q;
    wire [0:0] FIFO2_empty;
    wire [0:0] FIFO2_v;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_And_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_And_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BankCounter_x_q;
    (* preserve_syn_only *) reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BankCounter_x_i;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BitCombine_x_q;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BitCombine1_x_q;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Const2_x_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_reset;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_f;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_e;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_t;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_empty;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_v;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_reset;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_f;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_e;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_t;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_empty;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_v;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux_x_s;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux1_x_s;
    reg [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux1_x_q;
    wire [4:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_x_a;
    wire [4:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_x_b;
    logic [4:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_x_o;
    wire [4:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_WriteCounter3_x_q;
    (* preserve_syn_only *) reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_WriteCounter3_x_i;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const1_x_q;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const2_x_q;
    reg [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_cnt;
    reg [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_dec;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_dn;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_en;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_i;
    reg [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_inc;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_l;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_ld;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_s;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_up;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_x_a;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_x_b;
    logic [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_x_o;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_x_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_CmpEQ1_x_b;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_CmpEQ1_x_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_CmpEQ2_x_b;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_CmpEQ2_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_RISING_EDGE_And_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_RISING_EDGE_Not1_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge2_Finite_State_Machine_x_out_1_fsm_q_tpl;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge4_Finite_State_Machine_x_out_1_fsm_q_tpl;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_And_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_Not_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_Or_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch1_And_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch1_Or_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_And_x_q;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_CmpEQ_x_b;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_CmpEQ_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_CmpEQ_x_q;
    reg [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_cnt;
    reg [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_dec;
    wire [13:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_dn;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_en;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_i;
    reg [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_inc;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_l;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_ld;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_q;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_s;
    wire [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_up;
    wire [13:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_x_a;
    wire [13:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_x_b;
    logic [13:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_x_o;
    wire [13:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_RISING_EDGE_And_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_RISING_EDGE_Not1_x_q;
    wire [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_a;
    wire [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_b;
    wire [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_i;
    wire [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_a1;
    wire [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_b1;
    logic [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_o;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_BitExtract_x_b;
    wire [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_CmpGE_x_a;
    wire [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_CmpGE_x_b;
    logic [18:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_CmpGE_x_o;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_CmpGE_x_n;
    wire [1:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Const5_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Mux_x_s;
    reg [1:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_latch_0L_Mux_x_s;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_latch_0L_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_falling_edge_Finite_State_Machine_x_out_1_fsm_q_tpl;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L1_Mux_x_s;
    reg [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L1_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_s;
    reg [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Add_x_a;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Add_x_b;
    logic [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Add_x_o;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Add_x_q;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_BitExtract1_x_b;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_a;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_b;
    logic [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_o;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_c;
    wire [14:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_DivBy2_x_b;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_a;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_q;
    reg [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Select_x_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_x_a;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_x_b;
    logic [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_x_o;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_x_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_x_a;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_x_b;
    logic [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_x_o;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_x_q;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Add_x_a;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Add_x_b;
    logic [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Add_x_o;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Add_x_q;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_BitExtract1_x_b;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_a;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_q;
    reg [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Select_x_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_x_a;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_x_b;
    logic [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_x_o;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_x_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Const1_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux_x_s;
    reg [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_s;
    reg [7:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L1_Mux_x_s;
    reg [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L1_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L2_Mux_x_s;
    reg [63:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L2_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_s;
    reg [1:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_s;
    reg [63:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_s;
    reg [63:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q;
    wire [3:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_PostCast_primWireOut_sel_x_b;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_PostCast_primWireOut_sel_x_b;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_PostCast_primWireOut_sel_x_b;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_PostCast_primWireOut_sel_x_b;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_PostCast_primWireOut_sel_x_b;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_x_s;
    reg [31:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_x_s;
    reg [31:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_x_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_sel_x_b;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_sel_x_b;
    wire [30:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_PreShift_0_q;
    wire [30:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_PreShift_0_qint;
    wire [30:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_PreShift_0_q;
    wire [30:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_PreShift_0_qint;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_constant_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_round_select_in;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_round_select_b;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp_q;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_in;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_in;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_s;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_q;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_a;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_b;
    logic [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_o;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_round_select_in;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_round_select_b;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp_q;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_in;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_in;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_s;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_q;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_a;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_b;
    logic [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_o;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_q;
    wire [11:0] leftShiftStage0Idx1Rng1_uid258_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in;
    wire [11:0] leftShiftStage0Idx1Rng1_uid258_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b;
    wire [12:0] leftShiftStage0Idx1_uid259_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
    wire [1:0] leftShiftStage0Idx2Pad2_uid260_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
    wire [10:0] leftShiftStage0Idx2Rng2_uid261_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in;
    wire [10:0] leftShiftStage0Idx2Rng2_uid261_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b;
    wire [12:0] leftShiftStage0Idx2_uid262_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
    wire [2:0] leftShiftStage0Idx3Pad3_uid263_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
    wire [9:0] leftShiftStage0Idx3Rng3_uid264_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in;
    wire [9:0] leftShiftStage0Idx3Rng3_uid264_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b;
    wire [12:0] leftShiftStage0Idx3_uid265_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
    wire [1:0] leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_s;
    reg [12:0] leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
    wire [3:0] leftShiftStage1Idx1Pad4_uid268_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
    wire [8:0] leftShiftStage1Idx1Rng4_uid269_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in;
    wire [8:0] leftShiftStage1Idx1Rng4_uid269_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b;
    wire [12:0] leftShiftStage1Idx1_uid270_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
    wire [4:0] leftShiftStage1Idx2Rng8_uid272_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in;
    wire [4:0] leftShiftStage1Idx2Rng8_uid272_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b;
    wire [12:0] leftShiftStage1Idx2_uid273_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
    wire [0:0] leftShiftStage1Idx3Rng12_uid275_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in;
    wire [0:0] leftShiftStage1Idx3Rng12_uid275_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b;
    wire [12:0] leftShiftStage1Idx3_uid276_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
    wire [1:0] leftShiftStage1_uid278_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_s;
    reg [12:0] leftShiftStage1_uid278_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
    wire [11:0] shifter_uid279_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in;
    wire [11:0] shifter_uid279_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b;
    wire [1:0] leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_s;
    reg [12:0] leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q;
    wire [8:0] leftShiftStage1Idx1Rng4_uid296_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_in;
    wire [8:0] leftShiftStage1Idx1Rng4_uid296_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_b;
    wire [12:0] leftShiftStage1Idx1_uid297_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q;
    wire [4:0] leftShiftStage1Idx2Rng8_uid299_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_in;
    wire [4:0] leftShiftStage1Idx2Rng8_uid299_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_b;
    wire [12:0] leftShiftStage1Idx2_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q;
    wire [0:0] leftShiftStage1Idx3Rng12_uid302_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_in;
    wire [0:0] leftShiftStage1Idx3Rng12_uid302_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_b;
    wire [12:0] leftShiftStage1Idx3_uid303_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q;
    wire [1:0] leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_s;
    reg [12:0] leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q;
    wire [1:0] leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_s;
    reg [12:0] leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q;
    wire [8:0] leftShiftStage1Idx1Rng4_uid350_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_in;
    wire [8:0] leftShiftStage1Idx1Rng4_uid350_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_b;
    wire [12:0] leftShiftStage1Idx1_uid351_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q;
    wire [4:0] leftShiftStage1Idx2Rng8_uid353_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_in;
    wire [4:0] leftShiftStage1Idx2Rng8_uid353_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_b;
    wire [12:0] leftShiftStage1Idx2_uid354_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q;
    wire [0:0] leftShiftStage1Idx3Rng12_uid356_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_in;
    wire [0:0] leftShiftStage1Idx3Rng12_uid356_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_b;
    wire [12:0] leftShiftStage1Idx3_uid357_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q;
    wire [1:0] leftShiftStage1_uid359_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_s;
    reg [12:0] leftShiftStage1_uid359_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q;
    wire [1:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_hi_b;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA0_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA0_e;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA0_c;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA1_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA1_e;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA1_c;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA2_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA2_e;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA2_c;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA3_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA3_e;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA3_c;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_lo_in;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_lo_b;
    wire [1:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_hi_b;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB0_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB1_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB2_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB3_h;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_lo_in;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_lo_b;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_ena_NotRstA;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_ena_NotRstA;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_ena_NotRstA;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_ena_NotRstA;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_ena_NotRstA;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_ena_NotRstA;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_ena_NotRstA;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_ena_NotRstA;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_reset;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_a0;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_c0;
    wire [31:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_s0;
    wire [31:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_qq0;
    reg [31:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena1;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena2;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_reset;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_a0;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_c0;
    wire [31:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_s0;
    wire [31:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_qq0;
    reg [31:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_ena0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_ena1;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_ena2;
    wire [1:0] leftShiftStageSel0Dto0_uid293_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_bit_select_merged_b;
    wire [1:0] leftShiftStageSel0Dto0_uid293_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_bit_select_merged_c;
    wire [1:0] leftShiftStageSel0Dto0_uid266_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_bit_select_merged_b;
    wire [1:0] leftShiftStageSel0Dto0_uid266_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_bit_select_merged_c;
    wire [1:0] leftShiftStageSel0Dto0_uid347_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_bit_select_merged_b;
    wire [1:0] leftShiftStageSel0Dto0_uid347_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_bit_select_merged_c;
    wire [12:0] xPadded_uid283_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q;
    wire [12:0] leftShiftStage0Idx1_uid286_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q;
    wire [12:0] leftShiftStage0Idx2_uid289_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q;
    wire [12:0] leftShiftStage0Idx3_uid292_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q;
    reg [11:0] redist2_shifter_uid279_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b_1_q;
    reg [0:0] redist3_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b_1_q;
    reg [0:0] redist4_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b_1_q;
    reg [15:0] redist5_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b_2_q;
    reg [15:0] redist5_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b_2_delay_0;
    reg [0:0] redist6_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b_1_q;
    reg [0:0] redist7_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b_1_q;
    reg [15:0] redist8_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b_2_q;
    reg [15:0] redist8_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b_2_delay_0;
    reg [11:0] redist9_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_PostCast_primWireOut_sel_x_b_1_q;
    reg [11:0] redist10_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_PostCast_primWireOut_sel_x_b_1_q;
    reg [11:0] redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_PostCast_primWireOut_sel_x_b_1_q;
    reg [16:0] redist12_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q;
    reg [11:0] redist13_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_PostCast_primWireOut_sel_x_b_1_q;
    reg [11:0] redist14_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b_1_q;
    reg [3:0] redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_PostCast_primWireOut_sel_x_b_1_q;
    reg [1:0] redist18_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_q_12_q;
    reg [7:0] redist20_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_9_q;
    reg [11:0] redist21_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Select_x_q_1_q;
    reg [11:0] redist22_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_BitExtract1_x_b_1_q;
    reg [11:0] redist23_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Select_x_q_1_q;
    reg [14:0] redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_DivBy2_x_b_1_q;
    reg [11:0] redist25_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_BitExtract1_x_b_1_q;
    reg [15:0] redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q_3_q;
    reg [15:0] redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q_3_delay_0;
    reg [0:0] redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_1_q;
    reg [0:0] redist28_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_3_q;
    reg [0:0] redist28_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_3_delay_0;
    reg [0:0] redist29_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_12_q;
    reg [0:0] redist30_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_13_q;
    reg [0:0] redist31_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch1_And_x_q_1_q;
    reg [0:0] redist32_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_And_x_q_1_q;
    reg [0:0] redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_1_q;
    reg [0:0] redist34_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q;
    reg [0:0] redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_3_q;
    reg [0:0] redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q;
    reg [0:0] redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl_2_delay_0;
    reg [0:0] redist37_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q;
    reg [0:0] redist37_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl_2_delay_0;
    reg [0:0] redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_q;
    reg [0:0] redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_delay_0;
    reg [0:0] redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_delay_1;
    reg [0:0] redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_delay_2;
    reg [15:0] redist39_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q_2_q;
    reg [15:0] redist39_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q_2_delay_0;
    reg [0:0] redist40_channel_BRSC1_in_cunroll_x_in_1_v_tpl_1_q;
    reg [0:0] redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5_q;
    reg [0:0] redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5_delay_0;
    reg [0:0] redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5_delay_1;
    reg [0:0] redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5_delay_2;
    reg [0:0] redist42_channel_BRSC1_in_cunroll_x_in_1_v_tpl_6_q;
    reg [0:0] redist43_channel_BRSC1_in_cunroll_x_in_1_v_tpl_7_q;
    reg [0:0] redist44_channel_BRSC1_in_cunroll_x_in_1_v_tpl_8_q;
    reg [3:0] redist48_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_3_q;
    reg [3:0] redist48_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_3_delay_0;
    reg [3:0] redist48_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_3_delay_1;
    reg [3:0] redist49_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_5_q;
    reg [3:0] redist49_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_5_delay_0;
    reg [3:0] redist50_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_8_q;
    reg [3:0] redist50_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_8_delay_0;
    reg [3:0] redist50_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_8_delay_1;
    reg [3:0] redist51_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_16_q;
    reg [15:0] redist52_channel_BRSC1_in_cunroll_x_in_5_NSubCarr_tpl_1_q;
    reg [0:0] redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_q;
    reg [0:0] redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_delay_0;
    reg [0:0] redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_delay_1;
    reg [0:0] redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_delay_2;
    reg [0:0] redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_delay_3;
    reg [0:0] redist55_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_8_q;
    reg [0:0] redist55_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_8_delay_0;
    reg [0:0] redist55_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_8_delay_1;
    reg [0:0] redist56_channel_BRSC1_in_cunroll_x_in_8_ripple_comp_en_tpl_15_q;
    reg [0:0] redist57_channel_BRSC1_in_cunroll_x_in_9_rc_bw_sel_tpl_10_q;
    reg [1:0] redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_q;
    reg [1:0] redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_delay_0;
    reg [1:0] redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_delay_1;
    reg [1:0] redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_delay_2;
    reg [1:0] redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_delay_3;
    reg [15:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_inputreg0_q;
    wire redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_reset0;
    wire [15:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_ia;
    wire [1:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_aa;
    wire [1:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_ab;
    wire [15:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_iq;
    wire [15:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_q;
    wire [1:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_wraddr_i = 2'b11;
    wire [1:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_offset_q;
    wire [2:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_rdcnt_a;
    wire [2:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_rdcnt_b;
    logic [2:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_rdcnt_o;
    wire [2:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_rdcnt_q;
    reg [15:0] redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_inputreg0_q;
    wire redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_reset0;
    wire [15:0] redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_ia;
    wire [1:0] redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_aa;
    wire [1:0] redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_ab;
    wire [15:0] redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_iq;
    wire [15:0] redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_q;
    wire [1:0] redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_wraddr_i = 2'b11;
    wire [2:0] redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_rdcnt_a;
    wire [2:0] redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_rdcnt_b;
    logic [2:0] redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_rdcnt_o;
    wire [2:0] redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_rdcnt_q;
    wire redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_reset0;
    wire [63:0] redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_ia;
    wire [3:0] redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_aa;
    wire [3:0] redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_ab;
    wire [63:0] redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_iq;
    wire [63:0] redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_q;
    wire [3:0] redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [3:0] redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_wraddr_i = 4'b1111;
    wire [3:0] redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_offset_q;
    wire [4:0] redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_rdcnt_a;
    wire [4:0] redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_rdcnt_b;
    logic [4:0] redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_rdcnt_o;
    wire [4:0] redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_rdcnt_q;
    wire redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_reset0;
    wire [63:0] redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_ia;
    wire [3:0] redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_aa;
    wire [3:0] redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_ab;
    wire [63:0] redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_iq;
    wire [63:0] redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_q;
    wire [3:0] redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [3:0] redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_wraddr_i = 4'b1111;
    wire [3:0] redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_offset_q;
    wire [4:0] redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_rdcnt_a;
    wire [4:0] redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_rdcnt_b;
    logic [4:0] redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_rdcnt_o;
    wire [4:0] redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_rdcnt_q;
    wire redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_reset0;
    wire [7:0] redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_ia;
    wire [2:0] redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_aa;
    wire [2:0] redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_ab;
    wire [7:0] redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_iq;
    wire [7:0] redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_q;
    wire [2:0] redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_wraddr_i = 3'b111;
    wire [2:0] redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_offset_q;
    wire [3:0] redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_rdcnt_a;
    wire [3:0] redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_rdcnt_b;
    logic [3:0] redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_rdcnt_o;
    wire [3:0] redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_rdcnt_q;
    wire redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_reset0;
    wire [7:0] redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_ia;
    wire [2:0] redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_aa;
    wire [2:0] redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_ab;
    wire [7:0] redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_iq;
    wire [7:0] redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_q;
    wire [2:0] redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_wraddr_i = 3'b111;
    wire [2:0] redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_offset_q;
    wire [3:0] redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_rdcnt_a;
    wire [3:0] redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_rdcnt_b;
    logic [3:0] redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_rdcnt_o;
    wire [3:0] redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_rdcnt_q;
    wire redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_reset0;
    wire [15:0] redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_ia;
    wire [2:0] redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_aa;
    wire [2:0] redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_ab;
    wire [15:0] redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_iq;
    wire [15:0] redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_q;
    wire [2:0] redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_wraddr_i = 3'b111;
    wire [3:0] redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_rdcnt_a;
    wire [3:0] redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_rdcnt_b;
    logic [3:0] redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_rdcnt_o;
    wire [3:0] redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_rdcnt_q;
    wire redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_reset0;
    wire [15:0] redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_ia;
    wire [2:0] redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_aa;
    wire [2:0] redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_ab;
    wire [15:0] redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_iq;
    wire [15:0] redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_q;
    wire [2:0] redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [2:0] redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_wraddr_i = 3'b111;
    wire [3:0] redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_rdcnt_a;
    wire [3:0] redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_rdcnt_b;
    logic [3:0] redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_rdcnt_o;
    wire [3:0] redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_rdcnt_q;
    wire redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_reset0;
    wire [63:0] redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_ia;
    wire [1:0] redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_aa;
    wire [1:0] redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_ab;
    wire [63:0] redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_iq;
    wire [63:0] redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_q;
    wire [1:0] redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_wraddr_i = 2'b11;
    wire [1:0] redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_offset_q;
    wire [2:0] redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_rdcnt_a;
    wire [2:0] redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_rdcnt_b;
    logic [2:0] redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_rdcnt_o;
    wire [2:0] redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_rdcnt_q;
    wire redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_reset0;
    wire [63:0] redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_ia;
    wire [1:0] redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_aa;
    wire [1:0] redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_ab;
    wire [63:0] redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_iq;
    wire [63:0] redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_q;
    wire [1:0] redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_wraddr_i = 2'b11;
    wire [2:0] redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_rdcnt_a;
    wire [2:0] redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_rdcnt_b;
    logic [2:0] redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_rdcnt_o;
    wire [2:0] redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_rdcnt_q;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_offset(CONSTANT,523)
    assign redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_offset_q = $unsigned(4'b1000);

    // redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_rdcnt(ADD,524)
    assign redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_rdcnt_a = {1'b0, redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_wraddr_q};
    assign redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_rdcnt_b = {1'b0, redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_rdcnt_o <= $unsigned(redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_rdcnt_a) + $unsigned(redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_rdcnt_b);
        end
    end
    assign redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_rdcnt_q = redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_rdcnt_o[4:0];

    // redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_offset(CONSTANT,543)
    assign redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_offset_q = $unsigned(2'b10);

    // redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_rdcnt(ADD,548)
    assign redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_rdcnt_a = {1'b0, redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_wraddr_q};
    assign redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_rdcnt_b = {1'b0, redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_rdcnt_o <= $unsigned(redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_rdcnt_a) + $unsigned(redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_rdcnt_b);
        end
    end
    assign redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_rdcnt_q = redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_rdcnt_o[2:0];

    // redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_wraddr(COUNTER,546)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_wraddr_i <= $unsigned(redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_wraddr_q = redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_wraddr_i[1:0];

    // redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem(DUALMEM,545)
    assign redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_ia = $unsigned(in_11_metadata_in_tpl);
    assign redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_aa = redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_wraddr_q;
    assign redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_ab = redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(64),
        .widthad_b(2),
        .numwords_b(4),
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
    ) redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_aa),
        .data_a(redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_ab),
        .q_b(redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_iq),
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
    assign redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_q = redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_iq[63:0];

    // redist40_channel_BRSC1_in_cunroll_x_in_1_v_tpl_1(DELAY,487)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist40_channel_BRSC1_in_cunroll_x_in_1_v_tpl_1_q <= '0;
        end
        else
        begin
            redist40_channel_BRSC1_in_cunroll_x_in_1_v_tpl_1_q <= $unsigned(in_1_v_tpl);
        end
    end

    // redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5(DELAY,488)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5_delay_0 <= '0;
        end
        else
        begin
            redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5_delay_0 <= $unsigned(redist40_channel_BRSC1_in_cunroll_x_in_1_v_tpl_1_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5_delay_1 <= redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5_delay_0;
            redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5_delay_2 <= redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5_delay_1;
            redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5_q <= redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5_delay_2;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge_Finite_State_Machine_x(BLACKBOX,38)@6
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_0000Finite_State_Machine thestreamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5_q),
        .out_1_fsm_q_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // FIFO1(FIFO,31)@6
    assign FIFO1_reset = areset;
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
    ) FIFO1_fifo (
        .aclr(1'b0),
        .sclr(FIFO1_reset),
        .clock(clk),
        .rdreq(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl[0]),
        .wrreq(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl[0]),
        .data(redist59_channel_BRSC1_in_cunroll_x_in_11_metadata_in_tpl_5_mem_q),
        .almost_full(FIFO1_f[0]),
        .almost_empty(FIFO1_t[0]),
        .empty(FIFO1_empty[0]),
        .q(FIFO1_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign FIFO1_e = ~ (FIFO1_t);
    assign FIFO1_v = ~ (FIFO1_empty);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_Not_x(LOGICAL,81)@1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_Not_x_q = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const1_x(CONSTANT,57)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const1_x_q = $unsigned(12'b000000000000);

    // redist52_channel_BRSC1_in_cunroll_x_in_5_NSubCarr_tpl_1(DELAY,499)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist52_channel_BRSC1_in_cunroll_x_in_5_NSubCarr_tpl_1_q <= '0;
        end
        else
        begin
            redist52_channel_BRSC1_in_cunroll_x_in_5_NSubCarr_tpl_1_q <= $unsigned(in_5_NSubCarr_tpl);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge_Finite_State_Machine_x(BLACKBOX,71)@2
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpo0000Finite_State_Machine thestreamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(redist40_channel_BRSC1_in_cunroll_x_in_1_v_tpl_1_q),
        .out_1_fsm_q_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x(FIFO,48)@2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_reset = areset;
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
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_fifo (
        .aclr(1'b0),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_reset),
        .clock(clk),
        .rdreq(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl[0]),
        .wrreq(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl[0]),
        .data(redist52_channel_BRSC1_in_cunroll_x_in_5_NSubCarr_tpl_1_q),
        .almost_full(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_f[0]),
        .almost_empty(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_t[0]),
        .empty(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_empty[0]),
        .q(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_e = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_t);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_v = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_empty);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x(BLACKBOX,73)@2
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpo0001Finite_State_Machine thestreamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_1_q),
        .out_1_fsm_q_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x(MUX,120)@2 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q <= 16'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO_x_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q <= 16'b0;
            endcase
        end
    end

    // redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q_3(DELAY,473)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q_3_delay_0 <= '0;
            redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q_3_q <= '0;
        end
        else
        begin
            redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q_3_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q);
            redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q_3_q <= redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q_3_delay_0;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const2_x(CONSTANT,58)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const2_x_q = $unsigned(12'b000000000001);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_RISING_EDGE_Not1_x(LOGICAL,68)@5
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_RISING_EDGE_Not1_x_q = ~ (redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_1_q);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_RISING_EDGE_And_x(LOGICAL,67)@5
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_RISING_EDGE_And_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_RISING_EDGE_Not1_x_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x(LOADABLECOUNTER,60)@5 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_en = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_ld = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_RISING_EDGE_And_x_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_i = {4'b0000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const1_x_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_s = {4'b0000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const2_x_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_l = redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q_3_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_up = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_cnt) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_inc);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_dn = $unsigned({1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_cnt[15:0]}) - $unsigned({1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_dec[15:0]});
    always @ (posedge clk)
    begin
        reg [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_assert_helper_var;
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_cnt <= $unsigned(16'b0000000000000000);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_inc <= $unsigned(16'b0000000000000001);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_dec <= $unsigned(16'b0000011111111111);
        end
        else
        begin
            if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_ld == 1'b1)
            begin
                // synthesis translate_off
                assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_l != 16'b0000000000000000) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x (LOADABLECOUNTER) : Modulo value cannot be zero");
                assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_i <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_l) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x (LOADABLECOUNTER) : Initial value cannot be greater than modulo value.");
                if (1'b0 & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_s[15] == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_assert_helper_var = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_l) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_s);
                    assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_assert_helper_var[15] != 1'b1) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x (LOADABLECOUNTER) : Absolute value of step cannot be greater than modulo value.");
                end
                else
                begin
                    assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_s <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_l) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x (LOADABLECOUNTER) : Absolute value of step cannot be greater than modulo value.");
                end
                assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_i != streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_l | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_s != streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_l) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x (LOADABLECOUNTER) : Initial, step and modulo values cannot all be equal.");
                // synthesis translate_on

                if (1'b0 & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_s[15] == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_inc <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_l) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_s);
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_dec <= $unsigned(16'd0) - $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_s);
                end
                else
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_inc <= $unsigned(16'd0) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_s);
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_dec <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_l) - $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_s);
                end
            end
            if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_ld == 1'b1 | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_en == 1'b1)
            begin
                if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_ld == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_cnt <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_i;
                end
                else
                begin
                    if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_dn[16] == 1'b1)
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_cnt <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_up;
                    end
                    else
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_cnt <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_dn[15:0];
                    end
                end
            end
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_cnt;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_CmpEQ1_x(LOGICAL,63)@6
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_CmpEQ1_x_b = {4'b0000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const1_x_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_CmpEQ1_x_q = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_CmpEQ1_x_b ? 1'b1 : 1'b0);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_x(SUB,62)@5
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_x_a = $unsigned({1'b0, redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q_3_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_x_b = $unsigned({5'b00000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const2_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_x_o = $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_x_a) - $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_x_b));
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_x_o[16:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x(BITSELECT,179)@5
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_x_q[11:0]);

    // redist14_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b_1(DELAY,461)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist14_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist14_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_CmpEQ2_x(LOGICAL,64)@6
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_CmpEQ2_x_b = {4'b0000, redist14_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b_1_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_CmpEQ2_x_q = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_CmpEQ2_x_b ? 1'b1 : 1'b0);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x(LOGICAL,66)@6 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_qi = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_CmpEQ2_x_q | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_CmpEQ1_x_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5(DELAY,485)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_delay_0 <= '0;
            redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_delay_1 <= '0;
            redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_delay_2 <= '0;
            redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_q <= '0;
        end
        else
        begin
            redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q);
            redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_delay_1 <= redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_delay_0;
            redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_delay_2 <= redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_delay_1;
            redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_q <= redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_delay_2;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge2_Finite_State_Machine_x(BLACKBOX,75)@1
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpo0002Finite_State_Machine thestreamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge2_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(redist38_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Address_Comparison_Or1_x_q_5_q),
        .out_1_fsm_q_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge2_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // redist31_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch1_And_x_q_1(DELAY,478)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist31_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch1_And_x_q_1_q <= '0;
        end
        else
        begin
            redist31_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch1_And_x_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch1_And_x_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch1_Or_x(LOGICAL,87)@1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch1_Or_x_q = redist31_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch1_And_x_q_1_q | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge2_Finite_State_Machine_x_out_1_fsm_q_tpl;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch1_And_x(LOGICAL,85)@1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch1_And_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch1_Or_x_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_Not_x_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_falling_edge_Finite_State_Machine_x(BLACKBOX,117)@1
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpo0005Finite_State_Machine thestreamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_falling_edge_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(in_1_v_tpl),
        .out_1_fsm_q_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_falling_edge_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // redist32_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_And_x_q_1(DELAY,479)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist32_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_And_x_q_1_q <= '0;
        end
        else
        begin
            redist32_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_And_x_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_And_x_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_Or_x(LOGICAL,82)@1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_Or_x_q = redist32_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_And_x_q_1_q | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_falling_edge_Finite_State_Machine_x_out_1_fsm_q_tpl;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_And_x(LOGICAL,80)@1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_And_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_Or_x_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_Not_x_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_And_x(LOGICAL,41)@0 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_And_x_qi = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch_And_x_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SRlatch1_And_x_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_And_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_And_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_And_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x(BLACKBOX,77)@1
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpo0003Finite_State_Machine thestreamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_And_x_q),
        .out_1_fsm_q_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_1(DELAY,480)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_1_q <= '0;
        end
        else
        begin
            redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl);
        end
    end

    // redist34_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_2(DELAY,481)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist34_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q <= '0;
        end
        else
        begin
            redist34_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q <= $unsigned(redist33_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_1_q);
        end
    end

    // redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_3(DELAY,482)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_3_q <= '0;
        end
        else
        begin
            redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_3_q <= $unsigned(redist34_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_latch_0L_Mux_x(MUX,114)@4 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_latch_0L_Mux_x_s = redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_3_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_latch_0L_Mux_x_q <= 1'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_latch_0L_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_latch_0L_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_latch_0L_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_latch_0L_Mux_x_q <= redist35_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_3_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_latch_0L_Mux_x_q <= 1'b0;
            endcase
        end
    end

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Const5_x(CONSTANT,110)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Const5_x_q = $unsigned(2'b11);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_BitExtract_x(BITSELECT,107)@3
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_BitExtract_x_b = $unsigned(redist12_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q[16:16]);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Mux_x(MUX,112)@3
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Mux_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_BitExtract_x_b;
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Mux_x_s or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Const5_x_q or GND_q)
    begin
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Mux_x_s)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Mux_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Const5_x_q;
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Mux_x_q = {1'b0, GND_q};
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Mux_x_q = 2'b0;
        endcase
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x(ADD,104)@3
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_a = $unsigned({{2{redist12_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q[16]}}, redist12_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_b = $unsigned({{17{streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Mux_x_q[1]}}, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_Mux_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_i = $unsigned({3'b000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_a1 = redist34_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q == 1'b1 ? streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_i : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_a;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_b1 = redist34_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge3_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q == 1'b1 ? 19'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_o = $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_a1) + $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_b1));
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_o[17:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x(BITSELECT,186)@3
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_x_q[16:0]);

    // redist12_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1(DELAY,459)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist12_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist12_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_CmpGE_x(COMPARE,108)@4 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_CmpGE_x_a = $unsigned({{2{redist12_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q[16]}}, redist12_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_CmpGE_x_b = $unsigned({18'b000000000000000000, VCC_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_CmpGE_x_o <= 19'b0;
        end
        else
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_CmpGE_x_o <= $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_CmpGE_x_a) - $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_CmpGE_x_b));
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_CmpGE_x_n[0] = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_CmpGE_x_o[18]);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x(LOGICAL,106)@5
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_CmpGE_x_n & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_latch_0L_Mux_x_q;

    // redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_1(DELAY,474)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_1_q <= '0;
        end
        else
        begin
            redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge1_Finite_State_Machine_x(BLACKBOX,40)@6
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_0001Finite_State_Machine thestreamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge1_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_1_q),
        .out_1_fsm_q_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x(MUX,153)@6 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q <= 64'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q <= FIFO1_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q <= 64'b0;
            endcase
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_wraddr(COUNTER,522)
    // low=0, high=15, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_wraddr_i <= $unsigned(redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_wraddr_i) + $unsigned(4'd1);
        end
    end
    assign redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_wraddr_q = redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_wraddr_i[3:0];

    // redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem(DUALMEM,521)
    assign redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_ia = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q);
    assign redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_aa = redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_wraddr_q;
    assign redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_ab = redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_rdcnt_q[3:0];
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
    ) redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_aa),
        .data_a(redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_ab),
        .q_b(redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_iq),
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
    assign redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_q = redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_iq[63:0];

    // redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5(DELAY,505)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_delay_0 <= $unsigned(in_10_eAxC_tpl);
            redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_delay_1 <= redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_delay_0;
            redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_delay_2 <= redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_delay_1;
            redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_delay_3 <= redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_delay_2;
            redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_q <= redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_delay_3;
        end
    end

    // FIFO(FIFO,30)@6
    assign FIFO_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(16),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(16),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(2),
        .lpm_widthu(4),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) FIFO_fifo (
        .aclr(1'b0),
        .sclr(FIFO_reset),
        .clock(clk),
        .rdreq(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl[0]),
        .wrreq(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl[0]),
        .data(redist58_channel_BRSC1_in_cunroll_x_in_10_eAxC_tpl_5_q),
        .almost_full(FIFO_f[0]),
        .almost_empty(FIFO_t[0]),
        .empty(FIFO_empty[0]),
        .q(FIFO_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign FIFO_e = ~ (FIFO_t);
    assign FIFO_v = ~ (FIFO_empty);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x(MUX,151)@6 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_q <= 2'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_q <= FIFO_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_q <= 2'b0;
            endcase
        end
    end

    // redist18_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_q_12(DELAY,465)
    dspba_delay_ver #( .width(2), .depth(11), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist18_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_q_12 ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_q), .xout(redist18_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_q_12_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_offset(CONSTANT,519)
    assign redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_offset_q = $unsigned(4'b1001);

    // redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_rdcnt(ADD,520)
    assign redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_rdcnt_a = {1'b0, redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_wraddr_q};
    assign redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_rdcnt_b = {1'b0, redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_rdcnt_o <= $unsigned(redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_rdcnt_a) + $unsigned(redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_rdcnt_b);
        end
    end
    assign redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_rdcnt_q = redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_rdcnt_o[4:0];

    // redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_rdcnt(ADD,544)
    assign redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_rdcnt_a = {1'b0, redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_wraddr_q};
    assign redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_rdcnt_b = {1'b0, redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_rdcnt_o <= $unsigned(redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_rdcnt_a) + $unsigned(redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_rdcnt_b);
        end
    end
    assign redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_rdcnt_q = redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_rdcnt_o[2:0];

    // redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_wraddr(COUNTER,542)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_wraddr_i <= $unsigned(redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_wraddr_q = redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_wraddr_i[1:0];

    // redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem(DUALMEM,541)
    assign redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_ia = $unsigned(in_6_time_in_tpl);
    assign redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_aa = redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_wraddr_q;
    assign redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_ab = redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(64),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(64),
        .widthad_b(2),
        .numwords_b(4),
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
    ) redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_aa),
        .data_a(redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_ab),
        .q_b(redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_iq),
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
    assign redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_q = redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_iq[63:0];

    // FIFO2(FIFO,32)@6
    assign FIFO2_reset = areset;
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
    ) FIFO2_fifo (
        .aclr(1'b0),
        .sclr(FIFO2_reset),
        .clock(clk),
        .rdreq(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl[0]),
        .wrreq(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl[0]),
        .data(redist53_channel_BRSC1_in_cunroll_x_in_6_time_in_tpl_5_mem_q),
        .almost_full(FIFO2_f[0]),
        .almost_empty(FIFO2_t[0]),
        .empty(FIFO2_empty[0]),
        .q(FIFO2_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign FIFO2_e = ~ (FIFO2_t);
    assign FIFO2_v = ~ (FIFO2_empty);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x(MUX,155)@6 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q <= 64'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q <= FIFO2_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q <= 64'b0;
            endcase
        end
    end

    // redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_wraddr(COUNTER,518)
    // low=0, high=15, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_wraddr_i <= $unsigned(redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_wraddr_i) + $unsigned(4'd1);
        end
    end
    assign redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_wraddr_q = redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_wraddr_i[3:0];

    // redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem(DUALMEM,517)
    assign redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_ia = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q);
    assign redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_aa = redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_wraddr_q;
    assign redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_ab = redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_rdcnt_q[3:0];
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
    ) redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_aa),
        .data_a(redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_ab),
        .q_b(redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_iq),
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
    assign redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_q = redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_iq[63:0];

    // redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_offset(CONSTANT,527)
    assign redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_offset_q = $unsigned(3'b100);

    // redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_rdcnt(ADD,528)
    assign redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_rdcnt_a = {1'b0, redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_wraddr_q};
    assign redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_rdcnt_b = {1'b0, redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_rdcnt_o <= $unsigned(redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_rdcnt_a) + $unsigned(redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_rdcnt_b);
        end
    end
    assign redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_rdcnt_q = redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_rdcnt_o[3:0];

    // redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_offset(CONSTANT,531)
    assign redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_offset_q = $unsigned(3'b011);

    // redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_rdcnt(ADD,532)
    assign redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_rdcnt_a = {1'b0, redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_wraddr_q};
    assign redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_rdcnt_b = {1'b0, redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_rdcnt_o <= $unsigned(redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_rdcnt_a) + $unsigned(redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_rdcnt_b);
        end
    end
    assign redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_rdcnt_q = redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_rdcnt_o[3:0];

    // redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_wraddr(COUNTER,530)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_wraddr_i <= $unsigned(redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_wraddr_q = redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_wraddr_i[2:0];

    // redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem(DUALMEM,529)
    assign redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_ia = $unsigned(in_2_c_tpl);
    assign redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_aa = redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_wraddr_q;
    assign redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_ab = redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_rdcnt_q[2:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(8),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(8),
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
    ) redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_aa),
        .data_a(redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_ab),
        .q_b(redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_iq),
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
    assign redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_q = redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_iq[7:0];

    // leftShiftStage1Idx3Rng12_uid302_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x(BITSELECT,301)@6
    assign leftShiftStage1Idx3Rng12_uid302_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_in = leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q[0:0];
    assign leftShiftStage1Idx3Rng12_uid302_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_b = leftShiftStage1Idx3Rng12_uid302_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_in[0:0];

    // leftShiftStage1Idx3_uid303_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x(BITJOIN,302)@6
    assign leftShiftStage1Idx3_uid303_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q = {leftShiftStage1Idx3Rng12_uid302_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_b, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const1_x_q};

    // leftShiftStage1Idx2Rng8_uid299_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x(BITSELECT,298)@6
    assign leftShiftStage1Idx2Rng8_uid299_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_in = leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q[4:0];
    assign leftShiftStage1Idx2Rng8_uid299_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_b = leftShiftStage1Idx2Rng8_uid299_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_in[4:0];

    // leftShiftStage1Idx2_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x(BITJOIN,299)@6
    assign leftShiftStage1Idx2_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q = {leftShiftStage1Idx2Rng8_uid299_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_b, Const_rsrvd_fix_q};

    // leftShiftStage1Idx1Rng4_uid296_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x(BITSELECT,295)@6
    assign leftShiftStage1Idx1Rng4_uid296_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_in = leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q[8:0];
    assign leftShiftStage1Idx1Rng4_uid296_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_b = leftShiftStage1Idx1Rng4_uid296_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_in[8:0];

    // leftShiftStage1Idx1Pad4_uid268_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(CONSTANT,267)
    assign leftShiftStage1Idx1Pad4_uid268_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = $unsigned(4'b0000);

    // leftShiftStage1Idx1_uid297_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x(BITJOIN,296)@6
    assign leftShiftStage1Idx1_uid297_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q = {leftShiftStage1Idx1Rng4_uid296_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_b, leftShiftStage1Idx1Pad4_uid268_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q};

    // leftShiftStage0Idx3_uid292_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const(CONSTANT,446)
    assign leftShiftStage0Idx3_uid292_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q = $unsigned(13'b0000000001000);

    // leftShiftStage0Idx2_uid289_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const(CONSTANT,444)
    assign leftShiftStage0Idx2_uid289_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q = $unsigned(13'b0000000000100);

    // leftShiftStage0Idx1_uid286_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const(CONSTANT,442)
    assign leftShiftStage0Idx1_uid286_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q = $unsigned(13'b0000000000010);

    // xPadded_uid283_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const(CONSTANT,440)
    assign xPadded_uid283_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q = $unsigned(13'b0000000000001);

    // leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x(MUX,293)@6
    assign leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_s = leftShiftStageSel0Dto0_uid293_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_bit_select_merged_b;
    always @(leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_s or xPadded_uid283_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q or leftShiftStage0Idx1_uid286_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q or leftShiftStage0Idx2_uid289_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q or leftShiftStage0Idx3_uid292_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q)
    begin
        unique case (leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_s)
            2'b00 : leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q = xPadded_uid283_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q;
            2'b01 : leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q = leftShiftStage0Idx1_uid286_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q;
            2'b10 : leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q = leftShiftStage0Idx2_uid289_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q;
            2'b11 : leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q = leftShiftStage0Idx3_uid292_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q;
            default : leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q = 13'b0;
        endcase
    end

    // redist48_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_3(DELAY,495)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist48_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_3_delay_0 <= '0;
        end
        else
        begin
            redist48_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_3_delay_0 <= $unsigned(in_4_FFTSize_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist48_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_3_delay_1 <= redist48_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_3_delay_0;
            redist48_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_3_q <= redist48_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_3_delay_1;
        end
    end

    // redist49_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_5(DELAY,496)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist49_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_5_delay_0 <= $unsigned(redist48_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_3_q);
            redist49_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_5_q <= redist49_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_5_delay_0;
        end
    end

    // leftShiftStageSel0Dto0_uid293_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_bit_select_merged(BITSELECT,437)@6
    assign leftShiftStageSel0Dto0_uid293_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_bit_select_merged_b = redist49_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_5_q[1:0];
    assign leftShiftStageSel0Dto0_uid293_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_bit_select_merged_c = redist49_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_5_q[3:2];

    // leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x(MUX,304)@6 + 1
    assign leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_s = leftShiftStageSel0Dto0_uid293_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_bit_select_merged_c;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q <= 13'b0;
        end
        else
        begin
            unique case (leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_s)
                2'b00 : leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q <= leftShiftStage0_uid294_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q;
                2'b01 : leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q <= leftShiftStage1Idx1_uid297_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q;
                2'b10 : leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q <= leftShiftStage1Idx2_uid300_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q;
                2'b11 : leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q <= leftShiftStage1Idx3_uid303_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q;
                default : leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q <= 13'b0;
            endcase
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_x(SUB,100)@7
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_x_a = $unsigned({1'b0, leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_x_b = $unsigned({2'b00, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const2_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_x_o = $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_x_a) - $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_x_b));
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_x_o[13:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_PostCast_primWireOut_sel_x(BITSELECT,185)@7
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_PostCast_primWireOut_sel_x_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_x_q[11:0]);

    // redist13_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_PostCast_primWireOut_sel_x_b_1(DELAY,460)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist13_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist13_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_PostCast_primWireOut_sel_x_b);
        end
    end

    // redist43_channel_BRSC1_in_cunroll_x_in_1_v_tpl_7(DELAY,490)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist43_channel_BRSC1_in_cunroll_x_in_1_v_tpl_7_q <= $unsigned(redist42_channel_BRSC1_in_cunroll_x_in_1_v_tpl_6_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_RISING_EDGE_Not1_x(LOGICAL,102)@7
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_RISING_EDGE_Not1_x_q = ~ (redist43_channel_BRSC1_in_cunroll_x_in_1_v_tpl_7_q);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_RISING_EDGE_And_x(LOGICAL,101)@7
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_RISING_EDGE_And_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_RISING_EDGE_Not1_x_q & redist42_channel_BRSC1_in_cunroll_x_in_1_v_tpl_6_q;

    // redist42_channel_BRSC1_in_cunroll_x_in_1_v_tpl_6(DELAY,489)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist42_channel_BRSC1_in_cunroll_x_in_1_v_tpl_6_q <= $unsigned(redist41_channel_BRSC1_in_cunroll_x_in_1_v_tpl_5_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x(LOADABLECOUNTER,99)@7 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_en = redist42_channel_BRSC1_in_cunroll_x_in_1_v_tpl_6_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_ld = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_RISING_EDGE_And_x_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_i = {1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const1_x_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_s = {1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const2_x_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_l = leftShiftStage1_uid305_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_up = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_cnt) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_inc);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_dn = $unsigned({1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_cnt[12:0]}) - $unsigned({1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_dec[12:0]});
    always @ (posedge clk)
    begin
        reg [12:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_assert_helper_var;
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_cnt <= $unsigned(13'b0000000000000);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_inc <= $unsigned(13'b0000000000001);
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_dec <= $unsigned(13'b0011111111111);
        end
        else
        begin
            if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_ld == 1'b1)
            begin
                // synthesis translate_off
                assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_l != 13'b0000000000000) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x (LOADABLECOUNTER) : Modulo value cannot be zero");
                assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_i <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_l) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x (LOADABLECOUNTER) : Initial value cannot be greater than modulo value.");
                if (1'b0 & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_s[12] == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_assert_helper_var = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_l) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_s);
                    assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_assert_helper_var[12] != 1'b1) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x (LOADABLECOUNTER) : Absolute value of step cannot be greater than modulo value.");
                end
                else
                begin
                    assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_s <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_l) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x (LOADABLECOUNTER) : Absolute value of step cannot be greater than modulo value.");
                end
                assert (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_i != streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_l | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_s != streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_l) else $error("streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x (LOADABLECOUNTER) : Initial, step and modulo values cannot all be equal.");
                // synthesis translate_on

                if (1'b0 & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_s[12] == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_inc <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_l) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_s);
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_dec <= $unsigned(13'd0) - $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_s);
                end
                else
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_inc <= $unsigned(13'd0) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_s);
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_dec <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_l) - $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_s);
                end
            end
            if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_ld == 1'b1 | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_en == 1'b1)
            begin
                if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_ld == 1'b1)
                begin
                    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_cnt <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_i;
                end
                else
                begin
                    if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_dn[13] == 1'b1)
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_cnt <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_up;
                    end
                    else
                    begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_cnt <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_dn[12:0];
                    end
                end
            end
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_cnt;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_CmpEQ_x(LOGICAL,91)@8 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_CmpEQ_x_b = {1'b0, redist13_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_Sub_PostCast_primWireOut_sel_x_b_1_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_CmpEQ_x_qi = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_q == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_CmpEQ_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_CmpEQ_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_CmpEQ_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_CmpEQ_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist44_channel_BRSC1_in_cunroll_x_in_1_v_tpl_8(DELAY,491)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist44_channel_BRSC1_in_cunroll_x_in_1_v_tpl_8_q <= $unsigned(redist43_channel_BRSC1_in_cunroll_x_in_1_v_tpl_7_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_And_x(LOGICAL,90)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_And_x_q = redist44_channel_BRSC1_in_cunroll_x_in_1_v_tpl_8_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_CmpEQ_x_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x(MUX,145)@9 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_And_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q <= 8'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q <= redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_mem_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q <= 8'b0;
            endcase
        end
    end

    // redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_wraddr(COUNTER,526)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_wraddr_i <= $unsigned(redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_wraddr_q = redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_wraddr_i[2:0];

    // redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem(DUALMEM,525)
    assign redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_ia = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q);
    assign redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_aa = redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_wraddr_q;
    assign redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_ab = redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_rdcnt_q[2:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(8),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(8),
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
    ) redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_aa),
        .data_a(redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_ab),
        .q_b(redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_iq),
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
    assign redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_q = redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_iq[7:0];

    // Const_rsrvd_fix(CONSTANT,29)
    assign Const_rsrvd_fix_q = $unsigned(8'b00000000);

    // CmpEQ(LOGICAL,28)@17
    assign CmpEQ_q = $unsigned(Const_rsrvd_fix_q == redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_q ? 1'b1 : 1'b0);

    // redist28_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_3(DELAY,475)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist28_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_3_delay_0 <= $unsigned(redist27_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_1_q);
            redist28_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_3_q <= redist28_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_3_delay_0;
        end
    end

    // redist29_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_12(DELAY,476)
    dspba_delay_ver #( .width(1), .depth(9), .reset_kind("SYNC"), .phase(3), .modulus(1024) )
    redist29_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_12 ( .xin(redist28_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_3_q), .xout(redist29_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_12_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // And_rsrvd_fix(LOGICAL,27)@17
    assign And_rsrvd_fix_q = redist29_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_12_q & CmpEQ_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L2_Mux_x(MUX,149)@17 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L2_Mux_x_s = And_rsrvd_fix_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L2_Mux_x_q <= 64'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L2_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L2_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L2_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L2_Mux_x_q <= redist16_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L5_Mux_x_q_11_mem_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L2_Mux_x_q <= 64'b0;
            endcase
        end
    end

    // redist50_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_8(DELAY,497)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist50_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_8_delay_0 <= $unsigned(redist49_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_5_q);
            redist50_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_8_delay_1 <= redist50_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_8_delay_0;
            redist50_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_8_q <= redist50_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_8_delay_1;
        end
    end

    // redist51_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_16(DELAY,498)
    dspba_delay_ver #( .width(4), .depth(8), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist51_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_16 ( .xin(redist50_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_8_q), .xout(redist51_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_16_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L1_Mux_x(MUX,147)@17 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L1_Mux_x_s = redist29_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_12_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L1_Mux_x_q <= 4'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L1_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L1_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L1_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L1_Mux_x_q <= redist51_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_16_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L1_Mux_x_q <= 4'b0;
            endcase
        end
    end

    // redist57_channel_BRSC1_in_cunroll_x_in_9_rc_bw_sel_tpl_10(DELAY,504)
    dspba_delay_ver #( .width(1), .depth(10), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist57_channel_BRSC1_in_cunroll_x_in_9_rc_bw_sel_tpl_10 ( .xin(in_9_rc_bw_sel_tpl), .xout(redist57_channel_BRSC1_in_cunroll_x_in_9_rc_bw_sel_tpl_10_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux_x(MUX,144)@11
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux_x_s = redist57_channel_BRSC1_in_cunroll_x_in_9_rc_bw_sel_tpl_10_q;
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux_x_s or in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl or in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl)
    begin
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux_x_s)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux_x_q = in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux_x_q = in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux_x_q = 16'b0;
        endcase
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge4_Finite_State_Machine_x(BLACKBOX,79)@8
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpo0004Finite_State_Machine thestreamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge4_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(redist28_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_3_q),
        .out_1_fsm_q_tpl(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge4_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_WriteCounter3_x(COUNTER,56)@8 + 1
    // low=0, high=1, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_WriteCounter3_x_i <= 1'd1;
        end
        else if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge4_Finite_State_Machine_x_out_1_fsm_q_tpl == 1'b1)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_WriteCounter3_x_i <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_WriteCounter3_x_i) + $unsigned(1'd1);
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_WriteCounter3_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_WriteCounter3_x_i[0:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_DivBy2_x(BITSELECT,126)@5
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_DivBy2_x_b = redist26_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L2_Mux_x_q_3_q[15:1];

    // redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_DivBy2_x_b_1(DELAY,471)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_DivBy2_x_b_1_q <= '0;
        end
        else
        begin
            redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_DivBy2_x_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_DivBy2_x_b);
        end
    end

    // redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5(DELAY,501)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_delay_0 <= '0;
        end
        else
        begin
            redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_delay_0 <= $unsigned(in_7_DC_SC_EN_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_delay_1 <= redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_delay_0;
            redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_delay_2 <= redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_delay_1;
            redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_delay_3 <= redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_delay_2;
            redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_q <= redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_delay_3;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux_x(MUX,51)@6
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux_x_s = redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_q;
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux_x_s or VCC_q or GND_q)
    begin
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux_x_s)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux_x_q = VCC_q;
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux_x_q = GND_q;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux_x_q = 1'b0;
        endcase
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_x(SUB,130)@6
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_x_a = $unsigned({15'b000000000000000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_x_b = $unsigned({1'b0, redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_DivBy2_x_b_1_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_x_o = $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_x_a) - $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_x_b));
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_x_o[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_PostCast_primWireOut_sel_x(BITSELECT,191)@6
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_PostCast_primWireOut_sel_x_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_x_q[11:0]);

    // redist10_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_PostCast_primWireOut_sel_x_b_1(DELAY,457)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist10_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist10_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_PostCast_primWireOut_sel_x_b);
        end
    end

    // leftShiftStage1Idx3Rng12_uid356_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x(BITSELECT,355)@5
    assign leftShiftStage1Idx3Rng12_uid356_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_in = leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q[0:0];
    assign leftShiftStage1Idx3Rng12_uid356_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_b = leftShiftStage1Idx3Rng12_uid356_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_in[0:0];

    // leftShiftStage1Idx3_uid357_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x(BITJOIN,356)@5
    assign leftShiftStage1Idx3_uid357_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q = {leftShiftStage1Idx3Rng12_uid356_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_b, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const1_x_q};

    // leftShiftStage1Idx2Rng8_uid353_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x(BITSELECT,352)@5
    assign leftShiftStage1Idx2Rng8_uid353_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_in = leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q[4:0];
    assign leftShiftStage1Idx2Rng8_uid353_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_b = leftShiftStage1Idx2Rng8_uid353_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_in[4:0];

    // leftShiftStage1Idx2_uid354_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x(BITJOIN,353)@5
    assign leftShiftStage1Idx2_uid354_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q = {leftShiftStage1Idx2Rng8_uid353_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_b, Const_rsrvd_fix_q};

    // leftShiftStage1Idx1Rng4_uid350_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x(BITSELECT,349)@5
    assign leftShiftStage1Idx1Rng4_uid350_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_in = leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q[8:0];
    assign leftShiftStage1Idx1Rng4_uid350_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_b = leftShiftStage1Idx1Rng4_uid350_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_in[8:0];

    // leftShiftStage1Idx1_uid351_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x(BITJOIN,350)@5
    assign leftShiftStage1Idx1_uid351_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q = {leftShiftStage1Idx1Rng4_uid350_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_b, leftShiftStage1Idx1Pad4_uid268_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q};

    // leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x(MUX,347)@5
    assign leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_s = leftShiftStageSel0Dto0_uid347_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_bit_select_merged_b;
    always @(leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_s or xPadded_uid283_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q or leftShiftStage0Idx1_uid286_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q or leftShiftStage0Idx2_uid289_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q or leftShiftStage0Idx3_uid292_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q)
    begin
        unique case (leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_s)
            2'b00 : leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q = xPadded_uid283_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q;
            2'b01 : leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q = leftShiftStage0Idx1_uid286_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q;
            2'b10 : leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q = leftShiftStage0Idx2_uid289_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q;
            2'b11 : leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q = leftShiftStage0Idx3_uid292_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LShift_x_q_const_q;
            default : leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q = 13'b0;
        endcase
    end

    // redist37_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl_2(DELAY,484)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist37_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl_2_delay_0 <= '0;
        end
        else
        begin
            redist37_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl_2_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist37_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q <= redist37_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl_2_delay_0;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x(FIFO,49)@4
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_reset = areset;
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
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_fifo (
        .aclr(1'b0),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_reset),
        .clock(clk),
        .rdreq(redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q[0]),
        .wrreq(redist37_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q[0]),
        .data(redist48_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_3_q),
        .almost_full(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_f[0]),
        .almost_empty(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_t[0]),
        .empty(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_empty[0]),
        .q(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_e = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_t);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_v = ~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_empty);

    // redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl_2(DELAY,483)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl_2_delay_0 <= '0;
        end
        else
        begin
            redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl_2_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q <= redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl_2_delay_0;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L1_Mux_x(MUX,118)@4 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L1_Mux_x_s = redist36_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L1_Mux_x_q <= 4'b0;
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L1_Mux_x_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L1_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L1_Mux_x_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L1_Mux_x_q <= streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_FIFO1_x_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L1_Mux_x_q <= 4'b0;
            endcase
        end
    end

    // leftShiftStageSel0Dto0_uid347_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_bit_select_merged(BITSELECT,439)@5
    assign leftShiftStageSel0Dto0_uid347_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_bit_select_merged_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L1_Mux_x_q[1:0];
    assign leftShiftStageSel0Dto0_uid347_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_bit_select_merged_c = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_latch_0L1_Mux_x_q[3:2];

    // leftShiftStage1_uid359_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x(MUX,358)@5 + 1
    assign leftShiftStage1_uid359_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_s = leftShiftStageSel0Dto0_uid347_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_bit_select_merged_c;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            leftShiftStage1_uid359_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q <= 13'b0;
        end
        else
        begin
            unique case (leftShiftStage1_uid359_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_s)
                2'b00 : leftShiftStage1_uid359_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q <= leftShiftStage0_uid348_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q;
                2'b01 : leftShiftStage1_uid359_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q <= leftShiftStage1Idx1_uid351_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q;
                2'b10 : leftShiftStage1_uid359_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q <= leftShiftStage1Idx2_uid354_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q;
                2'b11 : leftShiftStage1_uid359_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q <= leftShiftStage1Idx3_uid357_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q;
                default : leftShiftStage1_uid359_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q <= 13'b0;
            endcase
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_x(SUB,131)@6
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_x_a = $unsigned({3'b000, leftShiftStage1_uid359_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_LShift1_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_x_b = $unsigned({1'b0, redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_DivBy2_x_b_1_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_x_o = $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_x_a) - $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_x_b));
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_x_o[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_PostCast_primWireOut_sel_x(BITSELECT,190)@6
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_PostCast_primWireOut_sel_x_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_x_q[11:0]);

    // redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_PostCast_primWireOut_sel_x_b_1(DELAY,458)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_PostCast_primWireOut_sel_x_b);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x(COMPARE,124)@6 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_a = {2'b00, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_b = {3'b000, redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_DivBy2_x_b_1_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_o <= 18'b0;
        end
        else
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_o <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_a) - $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_b);
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_c[0] = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_o[17];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Select_x(SELECTOR,129)@7
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_c or redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_PostCast_primWireOut_sel_x_b_1_q or redist10_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_PostCast_primWireOut_sel_x_b_1_q)
    begin
        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Select_x_q = redist10_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub_PostCast_primWireOut_sel_x_b_1_q;
        if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_c == 1'b1)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Select_x_q = redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_PostCast_primWireOut_sel_x_b_1_q;
        end
    end

    // redist23_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Select_x_q_1(DELAY,470)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist23_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Select_x_q_1_q <= '0;
        end
        else
        begin
            redist23_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Select_x_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Select_x_q);
        end
    end

    // redist39_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q_2(DELAY,486)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist39_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q_2_delay_0 <= '0;
        end
        else
        begin
            redist39_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q_2_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist39_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q_2_q <= redist39_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q_2_delay_0;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Add_x(ADD,122)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Add_x_a = {1'b0, redist39_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q_2_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Add_x_b = {5'b00000, redist23_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Select_x_q_1_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Add_x_o = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Add_x_a) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Add_x_b);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Add_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Add_x_o[16:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_BitExtract1_x(BITSELECT,123)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_BitExtract1_x_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Add_x_q[11:0];

    // redist25_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_BitExtract1_x_b_1(DELAY,472)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist25_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_BitExtract1_x_b_1_q <= '0;
        end
        else
        begin
            redist25_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_BitExtract1_x_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_BitExtract1_x_b);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x(CHOOSEBITS,128)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_a = redist25_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_BitExtract1_x_b_1_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_q = {streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_a[0:0], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_a[1:1], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_a[2:2], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_a[3:3], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_a[4:4], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_a[5:5], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_a[6:6], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_a[7:7], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_a[8:8], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_a[9:9], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_a[10:10], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_a[11:11]};

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BitCombine1_x(BITJOIN,44)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BitCombine1_x_q = {streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_WriteCounter3_x_q, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_q};

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_hi(BITSELECT,397)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_hi_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BitCombine1_x_q[12:11];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB3(LOOKUP,402)@9
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_hi_b)
            2'b11 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB3_h = 1'b1;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB3_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_lo(BITSELECT,403)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_lo_in = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BitCombine1_x_q[10:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_lo_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_lo_in[10:0]);

    // redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_rdcnt(ADD,540)
    assign redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_rdcnt_a = {1'b0, redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_wraddr_q};
    assign redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_rdcnt_b = {1'b0, redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_rdcnt_o <= $unsigned(redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_rdcnt_a) + $unsigned(redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_rdcnt_b);
        end
    end
    assign redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_rdcnt_q = redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_rdcnt_o[3:0];

    // redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_wraddr(COUNTER,538)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_wraddr_i <= $unsigned(redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_wraddr_q = redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_wraddr_i[2:0];

    // redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem(DUALMEM,537)
    assign redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_ia = $unsigned(in_3_imag_x_tpl);
    assign redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_aa = redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_wraddr_q;
    assign redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_ab = redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_rdcnt_q[2:0];
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
    ) redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_aa),
        .data_a(redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_ab),
        .q_b(redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_iq),
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
    assign redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_q = redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BankCounter_x(COUNTER,42)@8 + 1
    // low=0, high=1, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BankCounter_x_i <= 1'd0;
        end
        else if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_And_x_q == 1'b1)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BankCounter_x_i <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BankCounter_x_i) + $unsigned(1'd1);
        end
    end
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BankCounter_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BankCounter_x_i[0:0];

    // leftShiftStage1Idx3Rng12_uid275_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(BITSELECT,274)@8
    assign leftShiftStage1Idx3Rng12_uid275_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in = leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q[0:0];
    assign leftShiftStage1Idx3Rng12_uid275_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b = leftShiftStage1Idx3Rng12_uid275_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in[0:0];

    // leftShiftStage1Idx3_uid276_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(BITJOIN,275)@8
    assign leftShiftStage1Idx3_uid276_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = {leftShiftStage1Idx3Rng12_uid275_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_Const1_x_q};

    // leftShiftStage1Idx2Rng8_uid272_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(BITSELECT,271)@8
    assign leftShiftStage1Idx2Rng8_uid272_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in = leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q[4:0];
    assign leftShiftStage1Idx2Rng8_uid272_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b = leftShiftStage1Idx2Rng8_uid272_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in[4:0];

    // leftShiftStage1Idx2_uid273_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(BITJOIN,272)@8
    assign leftShiftStage1Idx2_uid273_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = {leftShiftStage1Idx2Rng8_uid272_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b, Const_rsrvd_fix_q};

    // leftShiftStage1Idx1Rng4_uid269_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(BITSELECT,268)@8
    assign leftShiftStage1Idx1Rng4_uid269_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in = leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q[8:0];
    assign leftShiftStage1Idx1Rng4_uid269_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b = leftShiftStage1Idx1Rng4_uid269_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in[8:0];

    // leftShiftStage1Idx1_uid270_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(BITJOIN,269)@8
    assign leftShiftStage1Idx1_uid270_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = {leftShiftStage1Idx1Rng4_uid269_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b, leftShiftStage1Idx1Pad4_uid268_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q};

    // leftShiftStage0Idx3Rng3_uid264_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(BITSELECT,263)@8
    assign leftShiftStage0Idx3Rng3_uid264_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_q[9:0];
    assign leftShiftStage0Idx3Rng3_uid264_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b = leftShiftStage0Idx3Rng3_uid264_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in[9:0];

    // leftShiftStage0Idx3Pad3_uid263_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(CONSTANT,262)
    assign leftShiftStage0Idx3Pad3_uid263_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = $unsigned(3'b000);

    // leftShiftStage0Idx3_uid265_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(BITJOIN,264)@8
    assign leftShiftStage0Idx3_uid265_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = {leftShiftStage0Idx3Rng3_uid264_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b, leftShiftStage0Idx3Pad3_uid263_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q};

    // leftShiftStage0Idx2Rng2_uid261_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(BITSELECT,260)@8
    assign leftShiftStage0Idx2Rng2_uid261_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_q[10:0];
    assign leftShiftStage0Idx2Rng2_uid261_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b = leftShiftStage0Idx2Rng2_uid261_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in[10:0];

    // leftShiftStage0Idx2Pad2_uid260_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(CONSTANT,259)
    assign leftShiftStage0Idx2Pad2_uid260_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = $unsigned(2'b00);

    // leftShiftStage0Idx2_uid262_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(BITJOIN,261)@8
    assign leftShiftStage0Idx2_uid262_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = {leftShiftStage0Idx2Rng2_uid261_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b, leftShiftStage0Idx2Pad2_uid260_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q};

    // leftShiftStage0Idx1Rng1_uid258_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(BITSELECT,257)@8
    assign leftShiftStage0Idx1Rng1_uid258_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_q[11:0];
    assign leftShiftStage0Idx1Rng1_uid258_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b = leftShiftStage0Idx1Rng1_uid258_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in[11:0];

    // leftShiftStage0Idx1_uid259_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(BITJOIN,258)@8
    assign leftShiftStage0Idx1_uid259_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = {leftShiftStage0Idx1Rng1_uid258_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b, GND_q};

    // leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(MUX,266)@8
    assign leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_s = leftShiftStageSel0Dto0_uid266_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_bit_select_merged_b;
    always @(leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_s or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_q or leftShiftStage0Idx1_uid259_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q or leftShiftStage0Idx2_uid262_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q or leftShiftStage0Idx3_uid265_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q)
    begin
        unique case (leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_s)
            2'b00 : leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_SampleCounter_LoadableCounter_x_q;
            2'b01 : leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = leftShiftStage0Idx1_uid259_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
            2'b10 : leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = leftShiftStage0Idx2_uid262_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
            2'b11 : leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = leftShiftStage0Idx3_uid265_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
            default : leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = 13'b0;
        endcase
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Const2_x(CONSTANT,46)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Const2_x_q = $unsigned(4'b1100);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_x(SUB,55)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_x_a = $unsigned({1'b0, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Const2_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_x_b = $unsigned({1'b0, redist50_channel_BRSC1_in_cunroll_x_in_4_FFTSize_tpl_8_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_x_o = $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_x_a) - $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_x_b));
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_x_o[4:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_PostCast_primWireOut_sel_x(BITSELECT,178)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_PostCast_primWireOut_sel_x_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_x_q[3:0]);

    // redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_PostCast_primWireOut_sel_x_b_1(DELAY,462)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_PostCast_primWireOut_sel_x_b);
        end
    end

    // leftShiftStageSel0Dto0_uid266_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_bit_select_merged(BITSELECT,438)@8
    assign leftShiftStageSel0Dto0_uid266_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_bit_select_merged_b = redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_PostCast_primWireOut_sel_x_b_1_q[1:0];
    assign leftShiftStageSel0Dto0_uid266_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_bit_select_merged_c = redist15_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Sub3_PostCast_primWireOut_sel_x_b_1_q[3:2];

    // leftShiftStage1_uid278_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(MUX,277)@8
    assign leftShiftStage1_uid278_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_s = leftShiftStageSel0Dto0_uid266_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_bit_select_merged_c;
    always @(leftShiftStage1_uid278_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_s or leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q or leftShiftStage1Idx1_uid270_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q or leftShiftStage1Idx2_uid273_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q or leftShiftStage1Idx3_uid276_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q)
    begin
        unique case (leftShiftStage1_uid278_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_s)
            2'b00 : leftShiftStage1_uid278_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = leftShiftStage0_uid267_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
            2'b01 : leftShiftStage1_uid278_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = leftShiftStage1Idx1_uid270_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
            2'b10 : leftShiftStage1_uid278_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = leftShiftStage1Idx2_uid273_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
            2'b11 : leftShiftStage1_uid278_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = leftShiftStage1Idx3_uid276_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q;
            default : leftShiftStage1_uid278_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q = 13'b0;
        endcase
    end

    // shifter_uid279_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x(BITSELECT,278)@8
    assign shifter_uid279_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in = $unsigned(leftShiftStage1_uid278_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_q[11:0]);
    assign shifter_uid279_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b = $unsigned(shifter_uid279_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_in[11:0]);

    // redist2_shifter_uid279_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b_1(DELAY,449)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_shifter_uid279_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b_1_q <= $unsigned(shifter_uid279_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BitCombine_x(BITJOIN,43)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BitCombine_x_q = {streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BankCounter_x_q, redist2_shifter_uid279_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_LShift3_x_b_1_q};

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_hi(BITSELECT,387)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_hi_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BitCombine_x_q[12:11];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA3(LOOKUP,393)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA3_c = $unsigned(redist44_channel_BRSC1_in_cunroll_x_in_1_v_tpl_8_q);
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_hi_b or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_hi_b)
            2'b11 : begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA3_h = 1'b1;
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA3_e = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA3_c;
                    end
            default : begin
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA3_h = 1'b0;
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_lo(BITSELECT,394)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_lo_in = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_BitCombine_x_q[10:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_lo_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_lo_in[10:0]);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3(DUALMEM,408)@9 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_ia = $unsigned(redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_q);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_ena_NotRstA = ~ (areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_reset0 = areset;
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
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_dmem (
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_ena_NotRstA),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_reset0),
        .clock0(clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA3_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB3_h[0]),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB2(LOOKUP,401)@9
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_hi_b)
            2'b10 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB2_h = 1'b1;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB2_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA2(LOOKUP,392)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA2_c = $unsigned(redist44_channel_BRSC1_in_cunroll_x_in_1_v_tpl_8_q);
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_hi_b or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_hi_b)
            2'b10 : begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA2_h = 1'b1;
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA2_e = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA2_c;
                    end
            default : begin
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA2_h = 1'b0;
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2(DUALMEM,407)@9 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_ia = $unsigned(redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_q);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_ena_NotRstA = ~ (areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_reset0 = areset;
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
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_dmem (
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_ena_NotRstA),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_reset0),
        .clock0(clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA2_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB2_h[0]),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB1(LOOKUP,400)@9
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_hi_b)
            2'b01 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB1_h = 1'b1;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA1(LOOKUP,391)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA1_c = $unsigned(redist44_channel_BRSC1_in_cunroll_x_in_1_v_tpl_8_q);
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_hi_b or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_hi_b)
            2'b01 : begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA1_h = 1'b1;
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA1_e = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA1_c;
                    end
            default : begin
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA1_h = 1'b0;
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1(DUALMEM,406)@9 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_ia = $unsigned(redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_q);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_ena_NotRstA = ~ (areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_reset0 = areset;
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
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_dmem (
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_ena_NotRstA),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_reset0),
        .clock0(clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA1_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB1_h[0]),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB0(LOOKUP,399)@9
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_hi_b)
            2'b00 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB0_h = 1'b1;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA0(LOOKUP,390)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA0_c = $unsigned(redist44_channel_BRSC1_in_cunroll_x_in_1_v_tpl_8_q);
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_hi_b or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_hi_b)
            2'b00 : begin
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA0_h = 1'b1;
                        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA0_e = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA0_c;
                    end
            default : begin
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA0_h = 1'b0;
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0(DUALMEM,405)@9 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_ia = $unsigned(redist47_channel_BRSC1_in_cunroll_x_in_3_imag_x_tpl_8_mem_q);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_ena_NotRstA = ~ (areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_reset0 = areset;
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
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_dmem (
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_ena_NotRstA),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_reset0),
        .clock0(clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA0_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB0_h[0]),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0(LOGICAL,410)@11
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part0_q | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part1_q | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part2_q | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_part3_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma(CHAINMULTADD,435)@11 + 5
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_reset = areset;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena0 = 1'b1;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena1 = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena0;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena2 = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena0;

    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_a0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_c0 = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux_x_q;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("true"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_DSP0 (
        .clk(clk),
        .ena({ streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena2, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena1, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_a0),
        .ax(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_c0),
        .resulta(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_s0),
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
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_delay0 ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_s0), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_q = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_qq0[31:0]);

    // redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_offset(CONSTANT,510)
    assign redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_offset_q = $unsigned(2'b11);

    // redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_rdcnt(ADD,516)
    assign redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_rdcnt_a = {1'b0, redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_wraddr_q};
    assign redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_rdcnt_b = {1'b0, redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_rdcnt_o <= $unsigned(redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_rdcnt_a) + $unsigned(redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_rdcnt_b);
        end
    end
    assign redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_rdcnt_q = redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_rdcnt_o[2:0];

    // redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_inputreg0(DELAY,512)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_inputreg0_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q);
        end
    end

    // redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_wraddr(COUNTER,514)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_wraddr_i <= $unsigned(redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_wraddr_q = redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_wraddr_i[1:0];

    // redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem(DUALMEM,513)
    assign redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_ia = $unsigned(redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_inputreg0_q);
    assign redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_aa = redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_wraddr_q;
    assign redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_ab = redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(4),
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
    ) redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_aa),
        .data_a(redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_ab),
        .q_b(redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_iq),
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
    assign redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_q = redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_PreShift_0(BITSHIFT,201)@16
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_PreShift_0_qint = { redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_qB_l0_or0_q_5_mem_q, 15'b000000000000000 };
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_PreShift_0_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_PreShift_0_qint[30:0];

    // redist56_channel_BRSC1_in_cunroll_x_in_8_ripple_comp_en_tpl_15(DELAY,503)
    dspba_delay_ver #( .width(1), .depth(15), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist56_channel_BRSC1_in_cunroll_x_in_8_ripple_comp_en_tpl_15 ( .xin(in_8_ripple_comp_en_tpl), .xout(redist56_channel_BRSC1_in_cunroll_x_in_8_ripple_comp_en_tpl_15_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_x(MUX,197)@16
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_x_s = redist56_channel_BRSC1_in_cunroll_x_in_8_ripple_comp_en_tpl_15_q;
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_x_s or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_PreShift_0_q or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_q)
    begin
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_x_s)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_x_q = {{1{streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_PreShift_0_q[30]}}, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_PreShift_0_q};
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_imagMult1_x_cma_q;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_x_q = 32'b0;
        endcase
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select(BITSELECT,219)@16
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_in = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_x_q[16:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_in[16:16]);

    // redist7_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b_1(DELAY,454)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist7_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select(BITSELECT,220)@16
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_in = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_x_q[15:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_in[15:15]);

    // redist6_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b_1(DELAY,453)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_constant(CONSTANT,215)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_constant_q = $unsigned(16'b1000000000000000);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_round_select(BITSELECT,216)@16
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_round_select_in = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_x_q[15:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_round_select_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_round_select_in[15:0]);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp(LOGICAL,218)@16 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp_qi = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_round_select_b == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_constant_q ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux(MUX,221)@17 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_q <= redist6_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b_1_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_q <= redist7_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b_1_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_q <= 1'b0;
            endcase
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select(BITSELECT,217)@16
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_imag_x_q[31:16]);

    // redist8_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b_2(DELAY,455)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b_2_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b);
            redist8_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b_2_q <= redist8_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b_2_delay_0;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add(ADD,222)@18
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_a = $unsigned({{2{redist8_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b_2_q[15]}}, redist8_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b_2_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_b = $unsigned({17'b00000000000000000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_o = $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_a) + $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_b));
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_o[16:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_sel_x(BITSELECT,199)@18
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_sel_x_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_q[15:0]);

    // redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_rdcnt(ADD,536)
    assign redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_rdcnt_a = {1'b0, redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_wraddr_q};
    assign redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_rdcnt_b = {1'b0, redist45_channel_BRSC1_in_cunroll_x_in_2_c_tpl_8_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_rdcnt_o <= $unsigned(redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_rdcnt_a) + $unsigned(redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_rdcnt_b);
        end
    end
    assign redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_rdcnt_q = redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_rdcnt_o[3:0];

    // redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_wraddr(COUNTER,534)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_wraddr_i <= $unsigned(redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_wraddr_i) + $unsigned(3'd1);
        end
    end
    assign redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_wraddr_q = redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_wraddr_i[2:0];

    // redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem(DUALMEM,533)
    assign redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_ia = $unsigned(in_3_real_x_tpl);
    assign redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_aa = redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_wraddr_q;
    assign redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_ab = redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_rdcnt_q[2:0];
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
    ) redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_aa),
        .data_a(redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_ab),
        .q_b(redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_iq),
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
    assign redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_q = redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3(DUALMEM,432)@9 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_ia = $unsigned(redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_q);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_ena_NotRstA = ~ (areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_reset0 = areset;
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
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_dmem (
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_ena_NotRstA),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_reset0),
        .clock0(clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA3_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB3_h[0]),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2(DUALMEM,431)@9 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_ia = $unsigned(redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_q);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_ena_NotRstA = ~ (areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_reset0 = areset;
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
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_dmem (
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_ena_NotRstA),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_reset0),
        .clock0(clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA2_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB2_h[0]),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1(DUALMEM,430)@9 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_ia = $unsigned(redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_q);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_ena_NotRstA = ~ (areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_reset0 = areset;
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
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_dmem (
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_ena_NotRstA),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_reset0),
        .clock0(clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA1_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB1_h[0]),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0(DUALMEM,429)@9 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_ia = $unsigned(redist46_channel_BRSC1_in_cunroll_x_in_3_real_x_tpl_8_mem_q);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_addrB_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_ena_NotRstA = ~ (areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_reset0 = areset;
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
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_dmem (
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_ena_NotRstA),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_reset0),
        .clock0(clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csA0_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_imag_x_csB0_h[0]),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0(LOGICAL,434)@11
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part0_q | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part1_q | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part2_q | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_part3_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma(CHAINMULTADD,436)@11 + 5
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_reset = areset;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_ena0 = 1'b1;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_ena1 = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_ena0;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_ena2 = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_ena0;

    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_a0 = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_c0 = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux_x_q;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("true"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_DSP0 (
        .clk(clk),
        .ena({ streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_ena2, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_ena1, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_a0),
        .ax(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_c0),
        .resulta(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_s0),
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
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_delay0 ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_s0), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_q = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_qq0[31:0]);

    // redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_rdcnt(ADD,511)
    assign redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_rdcnt_a = {1'b0, redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_wraddr_q};
    assign redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_rdcnt_b = {1'b0, redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_rdcnt_o <= $unsigned(redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_rdcnt_a) + $unsigned(redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_rdcnt_b);
        end
    end
    assign redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_rdcnt_q = redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_rdcnt_o[2:0];

    // redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_inputreg0(DELAY,507)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_inputreg0_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q);
        end
    end

    // redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_wraddr(COUNTER,509)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_wraddr_i <= $unsigned(redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_wraddr_q = redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_wraddr_i[1:0];

    // redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem(DUALMEM,508)
    assign redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_ia = $unsigned(redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_inputreg0_q);
    assign redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_aa = redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_wraddr_q;
    assign redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_ab = redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(4),
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
    ) redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_aa),
        .data_a(redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_ab),
        .q_b(redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_iq),
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
    assign redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_q = redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_PreShift_0(BITSHIFT,202)@16
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_PreShift_0_qint = { redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_DualMem_real_x_qB_l0_or0_q_5_mem_q, 15'b000000000000000 };
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_PreShift_0_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_PreShift_0_qint[30:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_x(MUX,198)@16
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_x_s = redist56_channel_BRSC1_in_cunroll_x_in_8_ripple_comp_en_tpl_15_q;
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_x_s or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_PreShift_0_q or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_q)
    begin
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_x_s)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_x_q = {{1{streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_PreShift_0_q[30]}}, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_PreShift_0_q};
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mult_realMult1_x_cma_q;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_x_q = 32'b0;
        endcase
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select(BITSELECT,227)@16
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_in = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_x_q[16:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_in[16:16]);

    // redist4_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b_1(DELAY,451)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select(BITSELECT,228)@16
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_in = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_x_q[15:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_in[15:15]);

    // redist3_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b_1(DELAY,450)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_round_select(BITSELECT,224)@16
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_round_select_in = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_x_q[15:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_round_select_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_round_select_in[15:0]);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp(LOGICAL,226)@16 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp_qi = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_round_select_b == streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_rnd_x_replace_constant_q ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux(MUX,229)@17 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_s = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_s)
                1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_q <= redist3_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b_1_q;
                1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_q <= redist4_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b_1_q;
                default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_q <= 1'b0;
            endcase
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select(BITSELECT,225)@16
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Mux1_real_x_q[31:16]);

    // redist5_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b_2(DELAY,452)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b_2_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b);
            redist5_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b_2_q <= redist5_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b_2_delay_0;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_add(ADD,230)@18
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_a = $unsigned({{2{redist5_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b_2_q[15]}}, redist5_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b_2_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_b = $unsigned({17'b00000000000000000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_o = $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_a) + $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_b));
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_o[16:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_sel_x(BITSELECT,200)@18
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_sel_x_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_q[15:0]);

    // redist20_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_9(DELAY,467)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist20_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_9_q <= $unsigned(redist19_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_8_mem_q);
        end
    end

    // redist30_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_13(DELAY,477)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist30_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_13_q <= $unsigned(redist29_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_12_q);
        end
    end

    // channel_BRSC1_out_cunroll_x(PORTOUT,34)@18 + 1
    assign out_1_qv_tpl = redist30_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_StretchPulse_And_x_q_13_q;
    assign out_2_qc_tpl = redist20_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L_Mux_x_q_9_q;
    assign out_3_real_q_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_real_sel_x_b;
    assign out_3_imag_q_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Convert_imag_sel_x_b;
    assign out_4_qsizeout_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L1_Mux_x_q;
    assign out_5_time_out_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L2_Mux_x_q;
    assign out_6_eAxC_out_tpl = redist18_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L3_Mux_x_q_12_q;
    assign out_7_meatadata_sym_out_tpl = redist17_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_latch_0L4_Mux_x_q_12_mem_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_x(SUB,140)@6
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_x_a = $unsigned({15'b000000000000000, GND_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_x_b = $unsigned({1'b0, redist24_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_DivBy2_x_b_1_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_x_o = $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_x_a) - $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_x_b));
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_x_o[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_PostCast_primWireOut_sel_x(BITSELECT,194)@6
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_PostCast_primWireOut_sel_x_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_x_q[11:0]);

    // redist9_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_PostCast_primWireOut_sel_x_b_1(DELAY,456)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_PostCast_primWireOut_sel_x_b);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Select_x(SELECTOR,139)@7
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_c or redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_PostCast_primWireOut_sel_x_b_1_q or redist9_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_PostCast_primWireOut_sel_x_b_1_q)
    begin
        streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Select_x_q = redist9_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Sub_PostCast_primWireOut_sel_x_b_1_q;
        if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_CmpLT_x_c == 1'b1)
        begin
            streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Select_x_q = redist11_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Sub1_PostCast_primWireOut_sel_x_b_1_q;
        end
    end

    // redist21_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Select_x_q_1(DELAY,468)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist21_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Select_x_q_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Select_x_q);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Add_x(ADD,132)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Add_x_a = {1'b0, redist39_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ReadCounter_LoadableCounter_x_q_2_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Add_x_b = {5'b00000, redist21_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Select_x_q_1_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Add_x_o = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Add_x_a) + $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Add_x_b);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Add_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Add_x_o[16:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_BitExtract1_x(BITSELECT,133)@8
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_BitExtract1_x_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Add_x_q[11:0];

    // redist22_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_BitExtract1_x_b_1(DELAY,469)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist22_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_BitExtract1_x_b_1_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_BitExtract1_x_b);
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x(CHOOSEBITS,138)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_a = redist22_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_BitExtract1_x_b_1_q;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_q = {streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_a[0:0], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_a[1:1], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_a[2:2], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_a[3:3], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_a[4:4], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_a[5:5], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_a[6:6], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_a[7:7], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_a[8:8], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_a[9:9], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_a[10:10], streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_a[11:11]};

    // redist55_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_8(DELAY,502)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist55_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_8_delay_0 <= $unsigned(redist54_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_5_q);
            redist55_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_8_delay_1 <= redist55_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_8_delay_0;
            redist55_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_8_q <= redist55_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_8_delay_1;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux1_x(MUX,52)@9
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux1_x_s = redist55_channel_BRSC1_in_cunroll_x_in_7_DC_SC_EN_tpl_8_q;
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux1_x_s or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_q or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_q)
    begin
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux1_x_s)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux1_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_with_no_offset_Perm2_x_q;
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux1_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_rd_addr_manipulation_Perm2_x_q;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux1_x_q = 12'b0;
        endcase
    end

    // out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(GPOUT,164)@1
    assign out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux1_x_q;

    // out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(GPOUT,165)@1
    assign out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_Mux1_x_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Const1_x(CONSTANT,142)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Const1_x_q = $unsigned(16'b0000000000000000);

    // out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(GPOUT,166)@1
    assign out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Const1_x_q;

    // out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(GPOUT,167)@1
    assign out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_Const1_x_q;

endmodule
