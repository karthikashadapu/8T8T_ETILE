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

// SystemVerilog created from ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap
// SystemVerilog created on Thu Jun 12 21:17:49 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap (
    input wire [0:0] in_1_v_tpl,
    input wire [7:0] in_2_c_tpl,
    input wire [15:0] in_3_real_x_tpl,
    input wire [15:0] in_3_imag_x_tpl,
    input wire [3:0] in_4_FFTSize_tpl,
    input wire [11:0] in_5_NSubCarr_tpl,
    input wire [10:0] in_6_cplen_tpl,
    input wire [0:0] in_7_DC_SC_EN_tpl,
    input wire [0:0] in_8_ripple_comp_en_tpl,
    input wire [0:0] in_9_rc_bw_sel_tpl,
    input wire [63:0] in_10_time_in_tpl,
    output wire [0:0] out_1_qv_tpl,
    output wire [7:0] out_2_qc_tpl,
    output wire [15:0] out_3_real_q_tpl,
    output wire [15:0] out_3_imag_q_tpl,
    output wire [0:0] out_4_ready_tpl,
    output wire [3:0] out_5_size_out_tpl,
    output wire [10:0] out_6_cp_len_tpl,
    output wire [15:0] out_7_real_q_rc_off_tpl,
    output wire [15:0] out_7_imag_q_rc_off_tpl,
    output wire [63:0] out_8_fd_time_out_tpl,
    input wire [15:0] in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    input wire [15:0] in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    output wire [11:0] out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    output wire [11:0] out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    output wire [15:0] out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    output wire [15:0] out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_reset;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_f;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_t;
    wire [3:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_empty;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_v;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_reset;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_f;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_t;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_empty;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_v;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_Not1_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_And_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_Not1_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_s;
    reg [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_reset;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_f;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_t;
    wire [7:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_empty;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_v;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_s;
    reg [7:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_reset;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_f;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_t;
    wire [63:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_empty;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_v;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_s;
    reg [63:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_s;
    reg [3:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_And_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_BitExtract5_x_b;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CmpNE_x_qi;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CmpNE_x_q;
    wire [3:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Const_x_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_reset;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_f;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_t;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_empty;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_v;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_reset;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_f;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_t;
    wire [7:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_empty;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_v;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Not_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_a;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_a;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadBankCounter_x_q;
    (* preserve_syn_only *) reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadBankCounter_x_i;
    wire [4:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_x_a;
    wire [4:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_x_b;
    logic [4:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_x_o;
    wire [4:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_x_q;
    wire [4:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_x_a;
    wire [4:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_x_b;
    logic [4:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_x_o;
    wire [4:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_rdaddr_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_wraddr_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Add_x_a;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Add_x_b;
    logic [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Add_x_o;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Add_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_And_x_qi;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_And_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpGE_x_a;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpGE_x_b;
    logic [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpGE_x_o;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpGE_x_n;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpLT_x_a;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpLT_x_b;
    logic [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpLT_x_o;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpLT_x_c;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpNE_x_b;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpNE_x_q;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_DivBy2_x_b;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Mux_x_s;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_qi;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Sub2_x_a;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Sub2_x_b;
    logic [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Sub2_x_o;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Sub2_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_Not1_x_qi;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_Not1_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const1_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const2_x_q;
    reg [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_cnt;
    reg [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_dec;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_dn;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_en;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_i;
    reg [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_inc;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_l;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_ld;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_s;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_up;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_x_a;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_x_b;
    logic [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_x_o;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_CmpEQ1_x_b;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_CmpEQ1_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_CmpEQ2_x_b;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_CmpEQ2_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_qi;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_q;
    wire [7:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_CmpEQ_x_a;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_CmpEQ_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_Mux1_x_s;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_Mux1_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge2_Finite_State_Machine_x_out_1_fsm_q_tpl;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_And_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_Not_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_Or_x_qi;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_Or_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch1_And_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch1_Or_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_a;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_b;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_i;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_a1;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_b1;
    logic [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_o;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_qi;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_BitExtract_x_b;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_CmpGE_x_a;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_CmpGE_x_b;
    logic [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_CmpGE_x_o;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_CmpGE_x_n;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Const5_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Mux_x_s;
    reg [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_latch_0L_Mux_x_s;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_latch_0L_Mux_x_q;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_a;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_b;
    logic [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_o;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_And_x_q;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_BitExtract_x_b;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpEQ1_x_a;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpEQ1_x_qi;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpEQ1_x_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpLT_x_a;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpLT_x_b;
    logic [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpLT_x_o;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpLT_x_c;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Mux_x_s;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Mux_x_q;
    reg [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Select_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x_a;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x_b;
    logic [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x_o;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_x_a;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_x_b;
    logic [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_x_o;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_WriteCounter3_x_q;
    (* preserve_syn_only *) reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_WriteCounter3_x_i;
    reg [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_cnt;
    reg [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_dec;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_dn;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_en;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_i;
    reg [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_inc;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_l;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_ld;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_s;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_up;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_Or_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falling_edge_Finite_State_Machine_x_out_1_fsm_q_tpl;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falling_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L1_Mux_x_s;
    reg [3:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L1_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_s;
    reg [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L3_Mux_x_s;
    reg [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L3_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L5_Mux_x_s;
    reg [7:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L5_Mux_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Const1_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux_x_s;
    reg [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux_x_q;
    reg [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_x_q;
    reg [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_x_q;
    wire [3:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_PostCast_primWireOut_sel_x_b;
    wire [3:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_PostCast_primWireOut_sel_x_b;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_PostCast_primWireOut_sel_x_b;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_x_s;
    reg [31:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_x_s;
    reg [31:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_sel_x_b;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_sel_x_b;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_PreShift_selectPortDefaultData_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_PreShift_selectPortDefaultData_qint;
    wire [30:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_PreShift_0_q;
    wire [30:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_PreShift_0_qint;
    wire [30:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_PreShift_0_q;
    wire [30:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_PreShift_0_qint;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_PreShift_selectPortDefaultData_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_PreShift_selectPortDefaultData_qint;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_constant_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_round_select_in;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_round_select_b;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp_qi;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp_q;
    wire [16:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_in;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_in;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_s;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_q;
    wire [17:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_a;
    wire [17:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_b;
    logic [17:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_o;
    wire [16:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_round_select_in;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_round_select_b;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp_qi;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp_q;
    wire [16:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_in;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_in;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_s;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_q;
    wire [17:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_a;
    wire [17:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_b;
    logic [17:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_o;
    wire [16:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_q;
    wire [12:0] leftShiftStage0Idx1Rng1_uid286_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in;
    wire [12:0] leftShiftStage0Idx1Rng1_uid286_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b;
    wire [13:0] leftShiftStage0Idx1_uid287_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
    wire [1:0] leftShiftStage0Idx2Pad2_uid288_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
    wire [11:0] leftShiftStage0Idx2Rng2_uid289_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in;
    wire [11:0] leftShiftStage0Idx2Rng2_uid289_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b;
    wire [13:0] leftShiftStage0Idx2_uid290_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
    wire [2:0] leftShiftStage0Idx3Pad3_uid291_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
    wire [10:0] leftShiftStage0Idx3Rng3_uid292_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in;
    wire [10:0] leftShiftStage0Idx3Rng3_uid292_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b;
    wire [13:0] leftShiftStage0Idx3_uid293_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
    wire [1:0] leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_s;
    reg [13:0] leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
    wire [3:0] leftShiftStage1Idx1Pad4_uid296_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
    wire [9:0] leftShiftStage1Idx1Rng4_uid297_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in;
    wire [9:0] leftShiftStage1Idx1Rng4_uid297_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b;
    wire [13:0] leftShiftStage1Idx1_uid298_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
    wire [7:0] leftShiftStage1Idx2Pad8_uid299_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
    wire [5:0] leftShiftStage1Idx2Rng8_uid300_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in;
    wire [5:0] leftShiftStage1Idx2Rng8_uid300_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b;
    wire [13:0] leftShiftStage1Idx2_uid301_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
    wire [1:0] leftShiftStage1Idx3Rng12_uid303_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in;
    wire [1:0] leftShiftStage1Idx3Rng12_uid303_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b;
    wire [13:0] leftShiftStage1Idx3_uid304_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
    wire [1:0] leftShiftStage1_uid306_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_s;
    reg [13:0] leftShiftStage1_uid306_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
    wire [11:0] shifter_uid307_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in;
    wire [11:0] shifter_uid307_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b;
    wire [11:0] leftShiftStage0Idx1Rng1_uid311_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in;
    wire [11:0] leftShiftStage0Idx1Rng1_uid311_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b;
    wire [12:0] leftShiftStage0Idx1_uid312_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
    wire [10:0] leftShiftStage0Idx2Rng2_uid314_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in;
    wire [10:0] leftShiftStage0Idx2Rng2_uid314_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b;
    wire [12:0] leftShiftStage0Idx2_uid315_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
    wire [9:0] leftShiftStage0Idx3Rng3_uid317_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in;
    wire [9:0] leftShiftStage0Idx3Rng3_uid317_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b;
    wire [12:0] leftShiftStage0Idx3_uid318_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
    wire [1:0] leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_s;
    reg [12:0] leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
    wire [8:0] leftShiftStage1Idx1Rng4_uid322_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in;
    wire [8:0] leftShiftStage1Idx1Rng4_uid322_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b;
    wire [12:0] leftShiftStage1Idx1_uid323_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
    wire [4:0] leftShiftStage1Idx2Rng8_uid325_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in;
    wire [4:0] leftShiftStage1Idx2Rng8_uid325_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b;
    wire [12:0] leftShiftStage1Idx2_uid326_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
    wire [0:0] leftShiftStage1Idx3Rng12_uid328_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in;
    wire [0:0] leftShiftStage1Idx3Rng12_uid328_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b;
    wire [12:0] leftShiftStage1Idx3_uid329_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
    wire [1:0] leftShiftStage1_uid331_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_s;
    reg [12:0] leftShiftStage1_uid331_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
    wire [11:0] shifter_uid332_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in;
    wire [11:0] shifter_uid332_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b;
    wire [1:0] leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_s;
    reg [12:0] leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q;
    wire [8:0] leftShiftStage1Idx1Rng4_uid349_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_in;
    wire [8:0] leftShiftStage1Idx1Rng4_uid349_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_b;
    wire [12:0] leftShiftStage1Idx1_uid350_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q;
    wire [4:0] leftShiftStage1Idx2Rng8_uid352_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_in;
    wire [4:0] leftShiftStage1Idx2Rng8_uid352_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_b;
    wire [12:0] leftShiftStage1Idx2_uid353_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q;
    wire [0:0] leftShiftStage1Idx3Rng12_uid355_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_in;
    wire [0:0] leftShiftStage1Idx3Rng12_uid355_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_b;
    wire [12:0] leftShiftStage1Idx3_uid356_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q;
    wire [1:0] leftShiftStage1_uid358_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_s;
    reg [12:0] leftShiftStage1_uid358_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q;
    wire [1:0] leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_s;
    reg [12:0] leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q;
    wire [8:0] leftShiftStage1Idx1Rng4_uid376_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_in;
    wire [8:0] leftShiftStage1Idx1Rng4_uid376_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_b;
    wire [12:0] leftShiftStage1Idx1_uid377_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q;
    wire [4:0] leftShiftStage1Idx2Rng8_uid379_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_in;
    wire [4:0] leftShiftStage1Idx2Rng8_uid379_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_b;
    wire [12:0] leftShiftStage1Idx2_uid380_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q;
    wire [0:0] leftShiftStage1Idx3Rng12_uid382_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_in;
    wire [0:0] leftShiftStage1Idx3Rng12_uid382_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_b;
    wire [12:0] leftShiftStage1Idx3_uid383_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q;
    wire [1:0] leftShiftStage1_uid385_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_s;
    reg [12:0] leftShiftStage1_uid385_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q;
    wire [1:0] leftShiftStage0_uid401_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_s;
    reg [11:0] leftShiftStage0_uid401_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q;
    wire [7:0] leftShiftStage1Idx1Rng4_uid403_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_in;
    wire [7:0] leftShiftStage1Idx1Rng4_uid403_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_b;
    wire [11:0] leftShiftStage1Idx1_uid404_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q;
    wire [3:0] leftShiftStage1Idx2Rng8_uid406_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_in;
    wire [3:0] leftShiftStage1Idx2Rng8_uid406_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_b;
    wire [11:0] leftShiftStage1Idx2_uid407_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q;
    wire [1:0] leftShiftStage1_uid410_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_s;
    reg [11:0] leftShiftStage1_uid410_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_hi_b;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA0_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA0_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA0_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA1_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA1_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA1_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA2_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA2_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA2_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA3_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA3_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA3_c;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_lo_in;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_lo_b;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_hi_b;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB0_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB1_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB2_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB3_h;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_lo_in;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_lo_b;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_qi;
    reg [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_qi;
    reg [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_reset;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_a0;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_c0;
    wire [31:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_s0;
    wire [31:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_qq0;
    reg [31:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena1;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena2;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_reset;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_a0;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_c0;
    wire [31:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_s0;
    wire [31:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_qq0;
    reg [31:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_ena0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_ena1;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_ena2;
    wire [1:0] leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_b;
    wire [1:0] leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_c;
    wire [1:0] leftShiftStageSel0Dto0_uid373_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_bit_select_merged_b;
    wire [1:0] leftShiftStageSel0Dto0_uid373_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_bit_select_merged_c;
    wire [1:0] leftShiftStageSel0Dto0_uid294_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_bit_select_merged_b;
    wire [1:0] leftShiftStageSel0Dto0_uid294_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_bit_select_merged_c;
    wire [1:0] leftShiftStageSel0Dto0_uid319_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_bit_select_merged_b;
    wire [1:0] leftShiftStageSel0Dto0_uid319_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_bit_select_merged_c;
    wire [12:0] xPadded_uid336_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q;
    wire [12:0] leftShiftStage0Idx1_uid339_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q;
    wire [12:0] leftShiftStage0Idx2_uid342_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q;
    wire [12:0] leftShiftStage0Idx3_uid345_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q;
    wire [11:0] leftShiftStage0Idx1_uid393_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const_q;
    wire [11:0] leftShiftStage0Idx2_uid396_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const_q;
    wire [11:0] leftShiftStage0Idx3_uid399_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const_q;
    reg [1:0] redist0_leftShiftStageSel0Dto0_uid294_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_bit_select_merged_c_1_q;
    reg [1:0] redist1_leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_b_1_q;
    reg [1:0] redist2_leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_c_1_q;
    reg [15:0] redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_9_q;
    reg [15:0] redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_9_delay_0;
    reg [15:0] redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_9_delay_1;
    reg [15:0] redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_9_q;
    reg [15:0] redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_9_delay_0;
    reg [15:0] redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_9_delay_1;
    reg [11:0] redist7_shifter_uid332_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b_1_q;
    reg [0:0] redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b_1_q;
    reg [0:0] redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b_1_q;
    reg [15:0] redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b_1_q;
    reg [0:0] redist11_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b_1_q;
    reg [0:0] redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b_1_q;
    reg [15:0] redist13_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b_1_q;
    reg [15:0] redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_sel_x_b_1_q;
    reg [15:0] redist15_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_sel_x_b_1_q;
    reg [13:0] redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q;
    reg [11:0] redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b_1_q;
    reg [3:0] redist18_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_PostCast_primWireOut_sel_x_b_1_q;
    reg [15:0] redist19_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_x_q_1_q;
    reg [15:0] redist20_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_x_q_1_q;
    reg [12:0] redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q_1_q;
    reg [12:0] redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q_2_q;
    reg [11:0] redist23_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_q_1_q;
    reg [12:0] redist24_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Select_x_q_1_q;
    reg [0:0] redist25_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q_2_q;
    reg [0:0] redist26_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q_13_q;
    reg [0:0] redist27_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch1_And_x_q_1_q;
    reg [0:0] redist28_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge2_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q;
    reg [0:0] redist28_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge2_Finite_State_Machine_x_out_1_fsm_q_tpl_2_delay_0;
    reg [0:0] redist29_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl_1_q;
    reg [0:0] redist30_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_q_284_q;
    reg [0:0] redist31_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_q_348_q;
    reg [0:0] redist32_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_1_q;
    reg [0:0] redist33_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_2_q;
    reg [0:0] redist34_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_q_8_q;
    reg [10:0] redist35_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_DivBy2_x_b_1_q;
    reg [12:0] redist36_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_q_1_q;
    reg [0:0] redist37_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CmpNE_x_q_11_q;
    reg [0:0] redist42_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q_2_q;
    reg [0:0] redist42_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q_2_delay_0;
    reg [0:0] redist43_ChannelIn_cunroll_x_in_1_v_tpl_1_q;
    reg [0:0] redist44_ChannelIn_cunroll_x_in_1_v_tpl_2_q;
    reg [0:0] redist45_ChannelIn_cunroll_x_in_1_v_tpl_3_q;
    reg [0:0] redist46_ChannelIn_cunroll_x_in_1_v_tpl_4_q;
    reg [0:0] redist47_ChannelIn_cunroll_x_in_1_v_tpl_5_q;
    reg [7:0] redist48_ChannelIn_cunroll_x_in_2_c_tpl_4_q;
    reg [7:0] redist48_ChannelIn_cunroll_x_in_2_c_tpl_4_delay_0;
    reg [7:0] redist48_ChannelIn_cunroll_x_in_2_c_tpl_4_delay_1;
    reg [7:0] redist48_ChannelIn_cunroll_x_in_2_c_tpl_4_delay_2;
    reg [3:0] redist51_ChannelIn_cunroll_x_in_4_FFTSize_tpl_1_q;
    reg [3:0] redist52_ChannelIn_cunroll_x_in_4_FFTSize_tpl_3_q;
    reg [3:0] redist52_ChannelIn_cunroll_x_in_4_FFTSize_tpl_3_delay_0;
    reg [3:0] redist53_ChannelIn_cunroll_x_in_4_FFTSize_tpl_4_q;
    reg [11:0] redist54_ChannelIn_cunroll_x_in_5_NSubCarr_tpl_2_q;
    reg [11:0] redist54_ChannelIn_cunroll_x_in_5_NSubCarr_tpl_2_delay_0;
    reg [11:0] redist55_ChannelIn_cunroll_x_in_5_NSubCarr_tpl_3_q;
    reg [10:0] redist56_ChannelIn_cunroll_x_in_6_cplen_tpl_4_q;
    reg [10:0] redist56_ChannelIn_cunroll_x_in_6_cplen_tpl_4_delay_0;
    reg [10:0] redist56_ChannelIn_cunroll_x_in_6_cplen_tpl_4_delay_1;
    reg [10:0] redist56_ChannelIn_cunroll_x_in_6_cplen_tpl_4_delay_2;
    reg [0:0] redist57_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_3_q;
    reg [0:0] redist57_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_3_delay_0;
    reg [0:0] redist57_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_3_delay_1;
    reg [0:0] redist58_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_6_q;
    reg [0:0] redist58_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_6_delay_0;
    reg [0:0] redist58_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_6_delay_1;
    reg [0:0] redist59_ChannelIn_cunroll_x_in_8_ripple_comp_en_tpl_13_q;
    reg [0:0] redist60_ChannelIn_cunroll_x_in_9_rc_bw_sel_tpl_7_q;
    wire redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_reset0;
    wire [15:0] redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_ia;
    wire [1:0] redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_aa;
    wire [1:0] redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_ab;
    wire [15:0] redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_iq;
    wire [15:0] redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_q;
    wire [1:0] redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_wraddr_i = 2'b11;
    wire [1:0] redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_offset_q;
    wire [2:0] redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_rdcnt_a;
    wire [2:0] redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_rdcnt_b;
    logic [2:0] redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_rdcnt_o;
    wire [2:0] redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_rdcnt_q;
    wire redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_reset0;
    wire [15:0] redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_ia;
    wire [1:0] redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_aa;
    wire [1:0] redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_ab;
    wire [15:0] redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_iq;
    wire [15:0] redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_q;
    wire [1:0] redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_wraddr_i = 2'b11;
    wire [2:0] redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_rdcnt_a;
    wire [2:0] redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_rdcnt_b;
    logic [2:0] redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_rdcnt_o;
    wire [2:0] redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_rdcnt_q;
    wire redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_reset0;
    wire [3:0] redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_ia;
    wire [3:0] redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_aa;
    wire [3:0] redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_ab;
    wire [3:0] redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_iq;
    wire [3:0] redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_q;
    wire [3:0] redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [3:0] redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_wraddr_i = 4'b1111;
    wire [3:0] redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_offset_q;
    wire [4:0] redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_rdcnt_a;
    wire [4:0] redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_rdcnt_b;
    logic [4:0] redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_rdcnt_o;
    wire [4:0] redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_rdcnt_q;
    wire redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_reset0;
    wire [63:0] redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_ia;
    wire [3:0] redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_aa;
    wire [3:0] redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_ab;
    wire [63:0] redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_iq;
    wire [63:0] redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_q;
    wire [3:0] redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [3:0] redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_wraddr_i = 4'b1111;
    wire [4:0] redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_rdcnt_a;
    wire [4:0] redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_rdcnt_b;
    logic [4:0] redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_rdcnt_o;
    wire [4:0] redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_rdcnt_q;
    wire redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_reset0;
    wire [7:0] redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_ia;
    wire [3:0] redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_aa;
    wire [3:0] redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_ab;
    wire [7:0] redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_iq;
    wire [7:0] redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_q;
    wire [3:0] redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [3:0] redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_wraddr_i = 4'b1111;
    wire [4:0] redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_rdcnt_a;
    wire [4:0] redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_rdcnt_b;
    logic [4:0] redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_rdcnt_o;
    wire [4:0] redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_rdcnt_q;
    wire redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_reset0;
    wire [10:0] redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_ia;
    wire [3:0] redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_aa;
    wire [3:0] redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_ab;
    wire [10:0] redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_iq;
    wire [10:0] redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_q;
    wire [3:0] redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [3:0] redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_wraddr_i = 4'b1111;
    wire [4:0] redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_rdcnt_a;
    wire [4:0] redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_rdcnt_b;
    logic [4:0] redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_rdcnt_o;
    wire [4:0] redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_rdcnt_q;
    wire redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_reset0;
    wire [15:0] redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_ia;
    wire [1:0] redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_aa;
    wire [1:0] redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_ab;
    wire [15:0] redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_iq;
    wire [15:0] redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_q;
    wire [1:0] redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_wraddr_i = 2'b11;
    wire [2:0] redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_rdcnt_a;
    wire [2:0] redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_rdcnt_b;
    logic [2:0] redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_rdcnt_o;
    wire [2:0] redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_rdcnt_q;
    wire redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_reset0;
    wire [15:0] redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_ia;
    wire [1:0] redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_aa;
    wire [1:0] redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_ab;
    wire [15:0] redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_iq;
    wire [15:0] redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_q;
    wire [1:0] redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_wraddr_i = 2'b11;
    wire [2:0] redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_rdcnt_a;
    wire [2:0] redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_rdcnt_b;
    logic [2:0] redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_rdcnt_o;
    wire [2:0] redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_rdcnt_q;
    wire redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_reset0;
    wire [63:0] redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_ia;
    wire [1:0] redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_aa;
    wire [1:0] redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_ab;
    wire [63:0] redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_iq;
    wire [63:0] redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_q;
    wire [1:0] redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_wraddr_i = 2'b11;
    wire [1:0] redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_offset_q;
    wire [2:0] redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_rdcnt_a;
    wire [2:0] redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_rdcnt_b;
    logic [2:0] redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_rdcnt_o;
    wire [2:0] redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_rdcnt_q;

    import ifft_blocktostream_DUT_safe_path_ver::safe_path_ver;

    // redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_offset(CONSTANT,551)
    assign redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_offset_q = $unsigned(4'b1000);

    // redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_rdcnt(ADD,556)
    assign redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_rdcnt_a = {1'b0, redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_wraddr_q};
    assign redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_rdcnt_b = {1'b0, redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_rdcnt_o <= $unsigned(redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_rdcnt_a) + $unsigned(redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_rdcnt_b);
        end
    end
    assign redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_rdcnt_q = redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_rdcnt_o[4:0];

    // redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_offset(CONSTANT,575)
    assign redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_offset_q = $unsigned(2'b11);

    // redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_rdcnt(ADD,576)
    assign redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_rdcnt_a = {1'b0, redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_wraddr_q};
    assign redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_rdcnt_b = {1'b0, redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_rdcnt_o <= $unsigned(redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_rdcnt_a) + $unsigned(redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_rdcnt_b);
        end
    end
    assign redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_rdcnt_q = redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_rdcnt_o[2:0];

    // redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_wraddr(COUNTER,574)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_wraddr_i <= $unsigned(redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_wraddr_q = redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_wraddr_i[1:0];

    // redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem(DUALMEM,573)
    assign redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_ia = $unsigned(in_10_time_in_tpl);
    assign redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_aa = redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_wraddr_q;
    assign redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_ab = redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_rdcnt_q[1:0];
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
    ) redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_aa),
        .data_a(redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_ab),
        .q_b(redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_iq),
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
    assign redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_q = redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_iq[63:0];

    // redist43_ChannelIn_cunroll_x_in_1_v_tpl_1(DELAY,522)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist43_ChannelIn_cunroll_x_in_1_v_tpl_1_q <= '0;
        end
        else
        begin
            redist43_ChannelIn_cunroll_x_in_1_v_tpl_1_q <= $unsigned(in_1_v_tpl);
        end
    end

    // redist44_ChannelIn_cunroll_x_in_1_v_tpl_2(DELAY,523)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist44_ChannelIn_cunroll_x_in_1_v_tpl_2_q <= '0;
        end
        else
        begin
            redist44_ChannelIn_cunroll_x_in_1_v_tpl_2_q <= $unsigned(redist43_ChannelIn_cunroll_x_in_1_v_tpl_1_q);
        end
    end

    // redist45_ChannelIn_cunroll_x_in_1_v_tpl_3(DELAY,524)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist45_ChannelIn_cunroll_x_in_1_v_tpl_3_q <= $unsigned(redist44_ChannelIn_cunroll_x_in_1_v_tpl_2_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_Not1_x(LOGICAL,29)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_Not1_x_q = ~ (redist45_ChannelIn_cunroll_x_in_1_v_tpl_3_q);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x(LOGICAL,28)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_Not1_x_q & redist44_ChannelIn_cunroll_x_in_1_v_tpl_2_q;

    // redist42_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q_2(DELAY,521)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist42_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q_2_delay_0 <= '0;
        end
        else
        begin
            redist42_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q_2_delay_0 <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist42_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q_2_q <= redist42_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q_2_delay_0;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x(FIFO,45)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_reset = areset;
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
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_fifo (
        .aclr(1'b0),
        .sclr(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_reset),
        .clock(clk),
        .rdreq(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_And_x_q[0]),
        .wrreq(redist42_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q_2_q[0]),
        .data(redist61_ChannelIn_cunroll_x_in_10_time_in_tpl_4_mem_q),
        .almost_full(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_f[0]),
        .almost_empty(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_t[0]),
        .empty(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_empty[0]),
        .q(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_e = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_t);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_v = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_empty);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_Not_x(LOGICAL,126)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_Not_x_q = ~ (redist32_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_1_q);

    // redist31_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_q_348(DELAY,510)
    dspba_delay_ver #( .width(1), .depth(64), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    redist31_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_q_348 ( .xin(redist30_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_q_284_q), .xout(redist31_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_q_348_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const1_x(CONSTANT,102)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const1_x_q = $unsigned(12'b000000000000);

    // leftShiftStage1Idx3Rng12_uid355_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x(BITSELECT,354)@1
    assign leftShiftStage1Idx3Rng12_uid355_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_in = leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q[0:0];
    assign leftShiftStage1Idx3Rng12_uid355_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_b = leftShiftStage1Idx3Rng12_uid355_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_in[0:0];

    // leftShiftStage1Idx3_uid356_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x(BITJOIN,355)@1
    assign leftShiftStage1Idx3_uid356_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q = {leftShiftStage1Idx3Rng12_uid355_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_b, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const1_x_q};

    // leftShiftStage1Idx2Rng8_uid352_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x(BITSELECT,351)@1
    assign leftShiftStage1Idx2Rng8_uid352_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_in = leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q[4:0];
    assign leftShiftStage1Idx2Rng8_uid352_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_b = leftShiftStage1Idx2Rng8_uid352_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_in[4:0];

    // leftShiftStage1Idx2Pad8_uid299_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(CONSTANT,298)
    assign leftShiftStage1Idx2Pad8_uid299_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = $unsigned(8'b00000000);

    // leftShiftStage1Idx2_uid353_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x(BITJOIN,352)@1
    assign leftShiftStage1Idx2_uid353_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q = {leftShiftStage1Idx2Rng8_uid352_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_b, leftShiftStage1Idx2Pad8_uid299_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q};

    // leftShiftStage1Idx1Rng4_uid349_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x(BITSELECT,348)@1
    assign leftShiftStage1Idx1Rng4_uid349_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_in = leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q[8:0];
    assign leftShiftStage1Idx1Rng4_uid349_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_b = leftShiftStage1Idx1Rng4_uid349_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_in[8:0];

    // leftShiftStage1Idx1Pad4_uid296_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(CONSTANT,295)
    assign leftShiftStage1Idx1Pad4_uid296_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = $unsigned(4'b0000);

    // leftShiftStage1Idx1_uid350_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x(BITJOIN,349)@1
    assign leftShiftStage1Idx1_uid350_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q = {leftShiftStage1Idx1Rng4_uid349_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_b, leftShiftStage1Idx1Pad4_uid296_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q};

    // leftShiftStage0Idx3_uid345_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const(CONSTANT,471)
    assign leftShiftStage0Idx3_uid345_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q = $unsigned(13'b0000000001000);

    // leftShiftStage0Idx2_uid342_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const(CONSTANT,469)
    assign leftShiftStage0Idx2_uid342_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q = $unsigned(13'b0000000000100);

    // leftShiftStage0Idx1_uid339_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const(CONSTANT,467)
    assign leftShiftStage0Idx1_uid339_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q = $unsigned(13'b0000000000010);

    // xPadded_uid336_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const(CONSTANT,465)
    assign xPadded_uid336_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q = $unsigned(13'b0000000000001);

    // leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x(MUX,346)@1
    assign leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_s = leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_b;
    always @(leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_s or xPadded_uid336_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q or leftShiftStage0Idx1_uid339_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q or leftShiftStage0Idx2_uid342_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q or leftShiftStage0Idx3_uid345_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q)
    begin
        unique case (leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_s)
            2'b00 : leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q = xPadded_uid336_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q;
            2'b01 : leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q = leftShiftStage0Idx1_uid339_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q;
            2'b10 : leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q = leftShiftStage0Idx2_uid342_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q;
            2'b11 : leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q = leftShiftStage0Idx3_uid345_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q;
            default : leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q = 13'b0;
        endcase
    end

    // redist51_ChannelIn_cunroll_x_in_4_FFTSize_tpl_1(DELAY,530)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist51_ChannelIn_cunroll_x_in_4_FFTSize_tpl_1_q <= '0;
        end
        else
        begin
            redist51_ChannelIn_cunroll_x_in_4_FFTSize_tpl_1_q <= $unsigned(in_4_FFTSize_tpl);
        end
    end

    // leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged(BITSELECT,461)@1
    assign leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_b = redist51_ChannelIn_cunroll_x_in_4_FFTSize_tpl_1_q[1:0];
    assign leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_c = redist51_ChannelIn_cunroll_x_in_4_FFTSize_tpl_1_q[3:2];

    // leftShiftStage1_uid358_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x(MUX,357)@1
    assign leftShiftStage1_uid358_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_s = leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_c;
    always @(leftShiftStage1_uid358_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_s or leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q or leftShiftStage1Idx1_uid350_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q or leftShiftStage1Idx2_uid353_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q or leftShiftStage1Idx3_uid356_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q)
    begin
        unique case (leftShiftStage1_uid358_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_s)
            2'b00 : leftShiftStage1_uid358_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q = leftShiftStage0_uid347_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q;
            2'b01 : leftShiftStage1_uid358_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q = leftShiftStage1Idx1_uid350_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q;
            2'b10 : leftShiftStage1_uid358_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q = leftShiftStage1Idx2_uid353_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q;
            2'b11 : leftShiftStage1_uid358_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q = leftShiftStage1Idx3_uid356_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q;
            default : leftShiftStage1_uid358_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q = 13'b0;
        endcase
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge_Finite_State_Machine_x(BLACKBOX,120)@0
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Risin0000Finite_State_Machine theifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(in_1_v_tpl),
        .out_1_fsm_q_tpl(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // redist29_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl_1(DELAY,508)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist29_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl_1_q <= '0;
        end
        else
        begin
            redist29_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x(FIFO,71)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(16),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(16),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(13),
        .lpm_widthu(4),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_fifo (
        .aclr(1'b0),
        .sclr(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_reset),
        .clock(clk),
        .rdreq(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q[0]),
        .wrreq(redist29_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl_1_q[0]),
        .data(leftShiftStage1_uid358_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q),
        .almost_full(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_f[0]),
        .almost_empty(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_t[0]),
        .empty(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_empty[0]),
        .q(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_e = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_t);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_v = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_empty);

    // redist36_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_q_1(DELAY,515)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist36_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_q_1_q <= '0;
        end
        else
        begin
            redist36_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x(MUX,175)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_s = redist32_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_1_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_s or redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q_1_q or redist36_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_q_1_q)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q = redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q = redist36_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO_x_q_1_q;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q = 13'b0;
        endcase
    end

    // redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q_1(DELAY,500)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q);
        end
    end

    // redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q_2(DELAY,501)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q_2_q <= '0;
        end
        else
        begin
            redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q_2_q <= $unsigned(redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q_1_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const2_x(CONSTANT,103)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const2_x_q = $unsigned(12'b000000000001);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x(LOADABLECOUNTER,105)@4 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_en = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_ld = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_And_x_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_i = {1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const1_x_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_s = {1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const2_x_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_l = redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q_2_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_up = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_cnt) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_inc);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_dn = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_cnt[12:0]}) - $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_dec[12:0]});
    always @ (posedge clk)
    begin
        reg [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_assert_helper_var;
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_cnt <= $unsigned(13'b0000000000000);
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_inc <= $unsigned(13'b0000000000001);
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_dec <= $unsigned(13'b0011111111111);
        end
        else
        begin
            if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_ld == 1'b1)
            begin
                // synthesis translate_off
                assert (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_l != 13'b0000000000000) else $error("ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x (LOADABLECOUNTER) : Modulo value cannot be zero");
                assert (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_i <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_l) else $error("ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x (LOADABLECOUNTER) : Initial value cannot be greater than modulo value.");
                if (1'b0 & ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_s[12] == 1'b1)
                begin
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_assert_helper_var = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_l) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_s);
                    assert (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_assert_helper_var[12] != 1'b1) else $error("ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x (LOADABLECOUNTER) : Absolute value of step cannot be greater than modulo value.");
                end
                else
                begin
                    assert (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_s <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_l) else $error("ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x (LOADABLECOUNTER) : Absolute value of step cannot be greater than modulo value.");
                end
                assert (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_i != ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_l | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_s != ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_l) else $error("ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x (LOADABLECOUNTER) : Initial, step and modulo values cannot all be equal.");
                // synthesis translate_on

                if (1'b0 & ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_s[12] == 1'b1)
                begin
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_inc <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_l) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_s);
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_dec <= $unsigned(13'd0) - $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_s);
                end
                else
                begin
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_inc <= $unsigned(13'd0) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_s);
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_dec <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_l) - $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_s);
                end
            end
            if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_ld == 1'b1 | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_en == 1'b1)
            begin
                if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_ld == 1'b1)
                begin
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_cnt <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_i;
                end
                else
                begin
                    if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_dn[13] == 1'b1)
                    begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_cnt <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_up;
                    end
                    else
                    begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_cnt <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_dn[12:0];
                    end
                end
            end
        end
    end
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_cnt;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_CmpEQ1_x(LOGICAL,107)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_CmpEQ1_x_b = {1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const1_x_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_CmpEQ1_x_q = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_q == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_CmpEQ1_x_b ? 1'b1 : 1'b0);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_x(SUB,106)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_x_a = $unsigned({1'b0, redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q_2_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_x_b = $unsigned({2'b00, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const2_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_x_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_x_a) - $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_x_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_x_o[13:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x(BITSELECT,201)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_x_q[11:0]);

    // redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b_1(DELAY,496)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_CmpEQ2_x(LOGICAL,108)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_CmpEQ2_x_b = {1'b0, redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Sub_PostCast_primWireOut_sel_x_b_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_CmpEQ2_x_q = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_q == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_CmpEQ2_x_b ? 1'b1 : 1'b0);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x(LOGICAL,110)@5 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_qi = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_CmpEQ2_x_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_CmpEQ1_x_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist30_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_q_284(DELAY,509)
    dspba_delay_ver #( .width(1), .depth(283), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    redist30_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_q_284 ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_q), .xout(redist30_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_q_284_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x(FIFO,72)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(16),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(16),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(8),
        .lpm_widthu(4),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_fifo (
        .aclr(1'b0),
        .sclr(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_reset),
        .clock(clk),
        .rdreq(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falling_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl[0]),
        .wrreq(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl[0]),
        .data(in_2_c_tpl),
        .almost_full(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_f[0]),
        .almost_empty(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_t[0]),
        .empty(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_empty[0]),
        .q(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_e = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_t);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_v = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_empty);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falling_edge1_Finite_State_Machine_x(BLACKBOX,172)@4
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falli0001Finite_State_Machine theifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falling_edge1_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q),
        .out_1_fsm_q_tpl(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falling_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L5_Mux_x(MUX,179)@0 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L5_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falling_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L5_Mux_x_q <= 8'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L5_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L5_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L5_Mux_x_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L5_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_FIFO1_x_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L5_Mux_x_q <= 8'b0;
            endcase
        end
    end

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_CmpEQ_x(LOGICAL,111)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_CmpEQ_x_a = {7'b0000000, GND_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_CmpEQ_x_q = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_CmpEQ_x_a == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L5_Mux_x_q ? 1'b1 : 1'b0);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_Mux1_x(MUX,113)@1 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_Mux1_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_CmpEQ_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_Mux1_x_q <= 1'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_Mux1_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_Mux1_x_q <= redist30_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_q_284_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_Mux1_x_q <= redist31_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Address_Comparison_Or1_x_q_348_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_Mux1_x_q <= 1'b0;
            endcase
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge1_Finite_State_Machine_x(BLACKBOX,122)@2
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Risin0001Finite_State_Machine theifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge1_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_Mux1_x_q),
        .out_1_fsm_q_tpl(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // redist27_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch1_And_x_q_1(DELAY,506)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist27_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch1_And_x_q_1_q <= '0;
        end
        else
        begin
            redist27_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch1_And_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch1_And_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch1_Or_x(LOGICAL,132)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch1_Or_x_q = redist27_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch1_And_x_q_1_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge1_Finite_State_Machine_x_out_1_fsm_q_tpl;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch1_And_x(LOGICAL,130)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch1_And_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch1_Or_x_q & ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_Not_x_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falling_edge_Finite_State_Machine_x(BLACKBOX,170)@1
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falli0000Finite_State_Machine theifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falling_edge_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(redist43_ChannelIn_cunroll_x_in_1_v_tpl_1_q),
        .out_1_fsm_q_tpl(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falling_edge_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_Or_x(LOGICAL,127)@1 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_Or_x_qi = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_And_x_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falling_edge_Finite_State_Machine_x_out_1_fsm_q_tpl;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_Or_x_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_Or_x_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_Or_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_And_x(LOGICAL,125)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_And_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_Or_x_q & ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_Not_x_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_And_x(LOGICAL,62)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_And_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch_And_x_q & ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_SRlatch1_And_x_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_Not1_x(LOGICAL,100)@0 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_Not1_x_qi = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_And_x_q);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_Not1_x_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_Not1_x_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_Not1_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x(LOGICAL,99)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_Not1_x_q & ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_And_x_q;

    // redist32_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_1(DELAY,511)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist32_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_1_q <= '0;
        end
        else
        begin
            redist32_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_latch_0L_Mux_x(MUX,145)@2 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_latch_0L_Mux_x_s = redist32_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_1_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_latch_0L_Mux_x_q <= 1'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_latch_0L_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_latch_0L_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_latch_0L_Mux_x_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_latch_0L_Mux_x_q <= redist32_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_1_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_latch_0L_Mux_x_q <= 1'b0;
            endcase
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Const5_x(CONSTANT,141)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Const5_x_q = $unsigned(2'b11);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_BitExtract_x(BITSELECT,138)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_BitExtract_x_b = $unsigned(redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q[13:13]);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Mux_x(MUX,143)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_BitExtract_x_b;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Mux_x_s or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Const5_x_q or GND_q)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Mux_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Const5_x_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Mux_x_q = {1'b0, GND_q};
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Mux_x_q = 2'b0;
        endcase
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x(ADD,135)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_a = $unsigned({{2{redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q[13]}}, redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_b = $unsigned({{14{ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Mux_x_q[1]}}, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_Mux_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_i = $unsigned({3'b000, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L2_Mux_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_a1 = redist32_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_1_q == 1'b1 ? ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_i : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_a;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_b1 = redist32_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_1_q == 1'b1 ? 16'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_a1) + $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_b1));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_o[14:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x(BITSELECT,205)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_x_q[13:0]);

    // redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1(DELAY,495)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_CmpGE_x(COMPARE,139)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_CmpGE_x_a = $unsigned({{2{redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q[13]}}, redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_AddSLoad_PostCast_primWireOut_sel_x_b_1_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_CmpGE_x_b = $unsigned({15'b000000000000000, VCC_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_CmpGE_x_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_CmpGE_x_a) - $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_CmpGE_x_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_CmpGE_x_n[0] = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_CmpGE_x_o[15]);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x(LOGICAL,137)@3 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_qi = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_CmpGE_x_n & ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_latch_0L_Mux_x_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist25_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q_2(DELAY,504)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist25_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q_2_q <= '0;
        end
        else
        begin
            redist25_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q_2_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_Not1_x(LOGICAL,32)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_Not1_x_q = ~ (redist25_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q_2_q);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_And_x(LOGICAL,31)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_And_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_Not1_x_q & ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x(MUX,52)@4 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_And_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q <= 64'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_FIFO_x_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q <= 64'b0;
            endcase
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_wraddr(COUNTER,554)
    // low=0, high=15, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_wraddr_i <= $unsigned(redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_wraddr_i) + $unsigned(4'd1);
        end
    end
    assign redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_wraddr_q = redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_wraddr_i[3:0];

    // redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem(DUALMEM,553)
    assign redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_ia = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q);
    assign redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_aa = redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_wraddr_q;
    assign redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_ab = redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_rdcnt_q[3:0];
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
    ) redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_aa),
        .data_a(redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_ab),
        .q_b(redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_iq),
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
    assign redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_q = redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_iq[63:0];

    // redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_offset(CONSTANT,543)
    assign redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_offset_q = $unsigned(2'b10);

    // redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_rdcnt(ADD,548)
    assign redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_rdcnt_a = {1'b0, redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_wraddr_q};
    assign redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_rdcnt_b = {1'b0, redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_rdcnt_o <= $unsigned(redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_rdcnt_a) + $unsigned(redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_rdcnt_b);
        end
    end
    assign redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_rdcnt_q = redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_rdcnt_o[2:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge2_Finite_State_Machine_x(BLACKBOX,124)@2
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Risin0002Finite_State_Machine theifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge2_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Delay_Congifuration1_Mux1_x_q),
        .out_1_fsm_q_tpl(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge2_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // redist28_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge2_Finite_State_Machine_x_out_1_fsm_q_tpl_2(DELAY,507)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist28_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge2_Finite_State_Machine_x_out_1_fsm_q_tpl_2_delay_0 <= '0;
        end
        else
        begin
            redist28_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge2_Finite_State_Machine_x_out_1_fsm_q_tpl_2_delay_0 <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge2_Finite_State_Machine_x_out_1_fsm_q_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist28_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge2_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q <= redist28_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge2_Finite_State_Machine_x_out_1_fsm_q_tpl_2_delay_0;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadBankCounter_x(COUNTER,79)@4 + 1
    // low=0, high=1, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadBankCounter_x_i <= 1'd0;
        end
        else if (redist28_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Rising_edge2_Finite_State_Machine_x_out_1_fsm_q_tpl_2_q == 1'b1)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadBankCounter_x_i <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadBankCounter_x_i) + $unsigned(1'd1);
        end
    end
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadBankCounter_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadBankCounter_x_i[0:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Not_x(LOGICAL,76)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Not_x_q = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadBankCounter_x_q);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_BitExtract5_x(BITSELECT,65)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_BitExtract5_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_q[11:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x(CHOOSEBITS,78)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_a = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_BitExtract5_x_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_a[0:0], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_a[1:1], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_a[2:2], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_a[3:3], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_a[4:4], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_a[5:5], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_a[6:6], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_a[7:7], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_a[8:8], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_a[9:9], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_a[10:10], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_a[11:11]};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_rdaddr_x(BITJOIN,83)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_rdaddr_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Not_x_q, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_q};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_hi(BITSELECT,421)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_hi_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_rdaddr_x_q[12:11];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB3(LOOKUP,426)@5
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_hi_b)
            2'b11 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB3_h = 1'b1;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB3_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_lo(BITSELECT,427)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_lo_in = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_rdaddr_x_q[10:0]);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_lo_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_lo_in[10:0]);

    // redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_rdcnt(ADD,572)
    assign redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_rdcnt_a = {1'b0, redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_wraddr_q};
    assign redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_rdcnt_b = {1'b0, redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_rdcnt_o <= $unsigned(redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_rdcnt_a) + $unsigned(redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_rdcnt_b);
        end
    end
    assign redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_rdcnt_q = redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_rdcnt_o[2:0];

    // redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_wraddr(COUNTER,570)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_wraddr_i <= $unsigned(redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_wraddr_q = redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_wraddr_i[1:0];

    // redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem(DUALMEM,569)
    assign redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_ia = $unsigned(in_3_imag_x_tpl);
    assign redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_aa = redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_wraddr_q;
    assign redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_ab = redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_rdcnt_q[1:0];
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
    ) redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_aa),
        .data_a(redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_ab),
        .q_b(redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_iq),
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
    assign redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_q = redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_iq[15:0];

    // redist46_ChannelIn_cunroll_x_in_1_v_tpl_4(DELAY,525)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist46_ChannelIn_cunroll_x_in_1_v_tpl_4_q <= $unsigned(redist45_ChannelIn_cunroll_x_in_1_v_tpl_3_q);
        end
    end

    // redist47_ChannelIn_cunroll_x_in_1_v_tpl_5(DELAY,526)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist47_ChannelIn_cunroll_x_in_1_v_tpl_5_q <= $unsigned(redist46_ChannelIn_cunroll_x_in_1_v_tpl_4_q);
        end
    end

    // redist54_ChannelIn_cunroll_x_in_5_NSubCarr_tpl_2(DELAY,533)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist54_ChannelIn_cunroll_x_in_5_NSubCarr_tpl_2_delay_0 <= '0;
        end
        else
        begin
            redist54_ChannelIn_cunroll_x_in_5_NSubCarr_tpl_2_delay_0 <= $unsigned(in_5_NSubCarr_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist54_ChannelIn_cunroll_x_in_5_NSubCarr_tpl_2_q <= redist54_ChannelIn_cunroll_x_in_5_NSubCarr_tpl_2_delay_0;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_Or_x(LOGICAL,165)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_Or_x_q = redist44_ChannelIn_cunroll_x_in_1_v_tpl_2_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x(LOADABLECOUNTER,164)@2 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_en = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_Or_x_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_ld = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_i = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const1_x_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const2_x_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_l = redist54_ChannelIn_cunroll_x_in_5_NSubCarr_tpl_2_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_up = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_cnt) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_inc);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_dn = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_cnt[11:0]}) - $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_dec[11:0]});
    always @ (posedge clk)
    begin
        reg [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_assert_helper_var;
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_cnt <= $unsigned(12'b000000000000);
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_inc <= $unsigned(12'b000000000000);
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_dec <= $unsigned(12'b000000000000);
        end
        else
        begin
            if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_ld == 1'b1)
            begin
                // synthesis translate_off
                assert (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_l != 12'b000000000000) else $error("ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x (LOADABLECOUNTER) : Modulo value cannot be zero");
                assert (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_i <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_l) else $error("ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x (LOADABLECOUNTER) : Initial value cannot be greater than modulo value.");
                if (1'b0 & ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_s[11] == 1'b1)
                begin
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_assert_helper_var = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_l) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_s);
                    assert (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_assert_helper_var[11] != 1'b1) else $error("ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x (LOADABLECOUNTER) : Absolute value of step cannot be greater than modulo value.");
                end
                else
                begin
                    assert (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_s <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_l) else $error("ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x (LOADABLECOUNTER) : Absolute value of step cannot be greater than modulo value.");
                end
                assert (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_i != ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_l | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_s != ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_l) else $error("ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x (LOADABLECOUNTER) : Initial, step and modulo values cannot all be equal.");
                // synthesis translate_on

                if (1'b0 & ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_s[11] == 1'b1)
                begin
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_inc <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_l) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_s);
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_dec <= $unsigned(12'd0) - $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_s);
                end
                else
                begin
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_inc <= $unsigned(12'd0) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_s);
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_dec <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_l) - $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_s);
                end
            end
            if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_ld == 1'b1 | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_en == 1'b1)
            begin
                if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_ld == 1'b1)
                begin
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_cnt <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_i;
                end
                else
                begin
                    if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_dn[12] == 1'b1)
                    begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_cnt <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_up;
                    end
                    else
                    begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_cnt <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_dn[11:0];
                    end
                end
            end
        end
    end
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_cnt;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpEQ1_x(LOGICAL,150)@3 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpEQ1_x_a = {11'b00000000000, GND_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpEQ1_x_qi = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpEQ1_x_a == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_q ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpEQ1_x_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpEQ1_x_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpEQ1_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_And_x(LOGICAL,148)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_And_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpEQ1_x_q & redist46_ChannelIn_cunroll_x_in_1_v_tpl_4_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_WriteCounter3_x(COUNTER,161)@4 + 1
    // low=0, high=1, step=1, init=1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_WriteCounter3_x_i <= 1'd1;
        end
        else if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_And_x_q == 1'b1)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_WriteCounter3_x_i <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_WriteCounter3_x_i) + $unsigned(1'd1);
        end
    end
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_WriteCounter3_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_WriteCounter3_x_i[0:0];

    // leftShiftStage1Idx3Rng12_uid303_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(BITSELECT,302)@5
    assign leftShiftStage1Idx3Rng12_uid303_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in = leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q[1:0];
    assign leftShiftStage1Idx3Rng12_uid303_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b = leftShiftStage1Idx3Rng12_uid303_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in[1:0];

    // leftShiftStage1Idx3_uid304_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(BITJOIN,303)@5
    assign leftShiftStage1Idx3_uid304_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = {leftShiftStage1Idx3Rng12_uid303_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const1_x_q};

    // leftShiftStage1Idx2Rng8_uid300_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(BITSELECT,299)@5
    assign leftShiftStage1Idx2Rng8_uid300_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in = leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q[5:0];
    assign leftShiftStage1Idx2Rng8_uid300_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b = leftShiftStage1Idx2Rng8_uid300_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in[5:0];

    // leftShiftStage1Idx2_uid301_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(BITJOIN,300)@5
    assign leftShiftStage1Idx2_uid301_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = {leftShiftStage1Idx2Rng8_uid300_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b, leftShiftStage1Idx2Pad8_uid299_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q};

    // leftShiftStage1Idx1Rng4_uid297_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(BITSELECT,296)@5
    assign leftShiftStage1Idx1Rng4_uid297_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in = leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q[9:0];
    assign leftShiftStage1Idx1Rng4_uid297_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b = leftShiftStage1Idx1Rng4_uid297_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in[9:0];

    // leftShiftStage1Idx1_uid298_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(BITJOIN,297)@5
    assign leftShiftStage1Idx1_uid298_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = {leftShiftStage1Idx1Rng4_uid297_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b, leftShiftStage1Idx1Pad4_uid296_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q};

    // leftShiftStage0Idx3Rng3_uid292_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(BITSELECT,291)@4
    assign leftShiftStage0Idx3Rng3_uid292_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_q[10:0];
    assign leftShiftStage0Idx3Rng3_uid292_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b = leftShiftStage0Idx3Rng3_uid292_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in[10:0];

    // leftShiftStage0Idx3Pad3_uid291_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(CONSTANT,290)
    assign leftShiftStage0Idx3Pad3_uid291_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = $unsigned(3'b000);

    // leftShiftStage0Idx3_uid293_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(BITJOIN,292)@4
    assign leftShiftStage0Idx3_uid293_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = {leftShiftStage0Idx3Rng3_uid292_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b, leftShiftStage0Idx3Pad3_uid291_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q};

    // leftShiftStage0Idx2Rng2_uid289_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(BITSELECT,288)@4
    assign leftShiftStage0Idx2Rng2_uid289_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_q[11:0];
    assign leftShiftStage0Idx2Rng2_uid289_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b = leftShiftStage0Idx2Rng2_uid289_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in[11:0];

    // leftShiftStage0Idx2Pad2_uid288_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(CONSTANT,287)
    assign leftShiftStage0Idx2Pad2_uid288_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = $unsigned(2'b00);

    // leftShiftStage0Idx2_uid290_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(BITJOIN,289)@4
    assign leftShiftStage0Idx2_uid290_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = {leftShiftStage0Idx2Rng2_uid289_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b, leftShiftStage0Idx2Pad2_uid288_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q};

    // leftShiftStage0Idx1Rng1_uid286_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(BITSELECT,285)@4
    assign leftShiftStage0Idx1Rng1_uid286_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_q[12:0];
    assign leftShiftStage0Idx1Rng1_uid286_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b = leftShiftStage0Idx1Rng1_uid286_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in[12:0];

    // leftShiftStage0Idx1_uid287_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(BITJOIN,286)@4
    assign leftShiftStage0Idx1_uid287_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = {leftShiftStage0Idx1Rng1_uid286_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b, GND_q};

    // redist55_ChannelIn_cunroll_x_in_5_NSubCarr_tpl_3(DELAY,534)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist55_ChannelIn_cunroll_x_in_5_NSubCarr_tpl_3_q <= $unsigned(redist54_ChannelIn_cunroll_x_in_5_NSubCarr_tpl_2_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_BitExtract_x(BITSELECT,149)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_BitExtract_x_b = redist55_ChannelIn_cunroll_x_in_5_NSubCarr_tpl_3_q[11:1];

    // redist57_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_3(DELAY,536)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist57_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_3_delay_0 <= $unsigned(in_7_DC_SC_EN_tpl);
            redist57_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_3_delay_1 <= redist57_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_3_delay_0;
            redist57_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_3_q <= redist57_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_3_delay_1;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Mux_x(MUX,157)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Mux_x_s = redist57_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_3_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Mux_x_s or VCC_q or GND_q)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Mux_x_q = VCC_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Mux_x_q = GND_q;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Mux_x_q = 1'b0;
        endcase
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x(SUB,159)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x_a = $unsigned({11'b00000000000, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Mux_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x_b = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_BitExtract_x_b});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x_a) - $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x_o[11:0];

    // leftShiftStage1Idx2Rng8_uid406_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x(BITSELECT,405)@2
    assign leftShiftStage1Idx2Rng8_uid406_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_in = leftShiftStage0_uid401_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q[3:0];
    assign leftShiftStage1Idx2Rng8_uid406_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_b = leftShiftStage1Idx2Rng8_uid406_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_in[3:0];

    // leftShiftStage1Idx2_uid407_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x(BITJOIN,406)@2
    assign leftShiftStage1Idx2_uid407_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q = {leftShiftStage1Idx2Rng8_uid406_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_b, leftShiftStage1Idx2Pad8_uid299_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q};

    // leftShiftStage1Idx1Rng4_uid403_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x(BITSELECT,402)@2
    assign leftShiftStage1Idx1Rng4_uid403_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_in = leftShiftStage0_uid401_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q[7:0];
    assign leftShiftStage1Idx1Rng4_uid403_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_b = leftShiftStage1Idx1Rng4_uid403_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_in[7:0];

    // leftShiftStage1Idx1_uid404_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x(BITJOIN,403)@2
    assign leftShiftStage1Idx1_uid404_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q = {leftShiftStage1Idx1Rng4_uid403_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_b, leftShiftStage1Idx1Pad4_uid296_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q};

    // leftShiftStage0Idx3_uid399_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const(CONSTANT,478)
    assign leftShiftStage0Idx3_uid399_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const_q = $unsigned(12'b000000001000);

    // leftShiftStage0Idx2_uid396_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const(CONSTANT,476)
    assign leftShiftStage0Idx2_uid396_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const_q = $unsigned(12'b000000000100);

    // leftShiftStage0Idx1_uid393_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const(CONSTANT,474)
    assign leftShiftStage0Idx1_uid393_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const_q = $unsigned(12'b000000000010);

    // redist1_leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_b_1(DELAY,480)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_b_1_q <= $unsigned(leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_b);
        end
    end

    // leftShiftStage0_uid401_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x(MUX,400)@2
    assign leftShiftStage0_uid401_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_s = redist1_leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_b_1_q;
    always @(leftShiftStage0_uid401_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_s or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const2_x_q or leftShiftStage0Idx1_uid393_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const_q or leftShiftStage0Idx2_uid396_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const_q or leftShiftStage0Idx3_uid399_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const_q)
    begin
        unique case (leftShiftStage0_uid401_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_s)
            2'b00 : leftShiftStage0_uid401_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const2_x_q;
            2'b01 : leftShiftStage0_uid401_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q = leftShiftStage0Idx1_uid393_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const_q;
            2'b10 : leftShiftStage0_uid401_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q = leftShiftStage0Idx2_uid396_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const_q;
            2'b11 : leftShiftStage0_uid401_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q = leftShiftStage0Idx3_uid399_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q_const_q;
            default : leftShiftStage0_uid401_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q = 12'b0;
        endcase
    end

    // redist2_leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_c_1(DELAY,481)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_c_1_q <= $unsigned(leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_c);
        end
    end

    // leftShiftStage1_uid410_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x(MUX,409)@2 + 1
    assign leftShiftStage1_uid410_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_s = redist2_leftShiftStageSel0Dto0_uid346_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_bit_select_merged_c_1_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (leftShiftStage1_uid410_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_s)
                2'b00 : leftShiftStage1_uid410_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q <= leftShiftStage0_uid401_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q;
                2'b01 : leftShiftStage1_uid410_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q <= leftShiftStage1Idx1_uid404_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q;
                2'b10 : leftShiftStage1_uid410_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q <= leftShiftStage1Idx2_uid407_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q;
                2'b11 : leftShiftStage1_uid410_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const1_x_q;
                default : leftShiftStage1_uid410_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q <= 12'b0;
            endcase
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_x(SUB,160)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_x_a = $unsigned({1'b0, leftShiftStage1_uid410_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_LShift_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_x_b = $unsigned({2'b00, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_BitExtract_x_b});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_x_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_x_a) - $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_x_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_x_o[12:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_PostCast_primWireOut_sel_x(BITSELECT,208)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_PostCast_primWireOut_sel_x_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_x_q[11:0]);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpLT_x(COMPARE,151)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpLT_x_a = {2'b00, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpLT_x_b = {3'b000, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_BitExtract_x_b};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpLT_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpLT_x_a) - $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpLT_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpLT_x_c[0] = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpLT_x_o[13];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Select_x(SELECTOR,158)@3
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpLT_x_c or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_PostCast_primWireOut_sel_x_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x_q)
    begin
        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Select_x_q = $unsigned({{1{ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x_q[11]}}, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub_x_q});
        if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_CmpLT_x_c == 1'b1)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Select_x_q = {1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Sub1_PostCast_primWireOut_sel_x_b};
        end
    end

    // redist24_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Select_x_q_1(DELAY,503)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist24_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Select_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Select_x_q);
        end
    end

    // redist23_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_q_1(DELAY,502)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist23_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x(ADD,147)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_a = $unsigned({3'b000, redist23_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_SubCarrierCounter_LoadableCounter_x_q_1_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_b = $unsigned({{2{redist24_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Select_x_q_1_q[12]}}, redist24_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Select_x_q_1_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_a) + $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_o[13:0];

    // redist52_ChannelIn_cunroll_x_in_4_FFTSize_tpl_3(DELAY,531)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist52_ChannelIn_cunroll_x_in_4_FFTSize_tpl_3_delay_0 <= '0;
        end
        else
        begin
            redist52_ChannelIn_cunroll_x_in_4_FFTSize_tpl_3_delay_0 <= $unsigned(redist51_ChannelIn_cunroll_x_in_4_FFTSize_tpl_1_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist52_ChannelIn_cunroll_x_in_4_FFTSize_tpl_3_q <= redist52_ChannelIn_cunroll_x_in_4_FFTSize_tpl_3_delay_0;
        end
    end

    // redist53_ChannelIn_cunroll_x_in_4_FFTSize_tpl_4(DELAY,532)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist53_ChannelIn_cunroll_x_in_4_FFTSize_tpl_4_q <= $unsigned(redist52_ChannelIn_cunroll_x_in_4_FFTSize_tpl_3_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Const_x(CONSTANT,67)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Const_x_q = $unsigned(4'b1100);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_x(SUB,81)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_x_a = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Const_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_x_b = $unsigned({1'b0, redist53_ChannelIn_cunroll_x_in_4_FFTSize_tpl_4_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_x_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_x_a) - $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_x_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_x_o[4:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_PostCast_primWireOut_sel_x(BITSELECT,197)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_PostCast_primWireOut_sel_x_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_x_q[3:0]);

    // leftShiftStageSel0Dto0_uid294_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_bit_select_merged(BITSELECT,463)@4
    assign leftShiftStageSel0Dto0_uid294_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_bit_select_merged_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_PostCast_primWireOut_sel_x_b[1:0];
    assign leftShiftStageSel0Dto0_uid294_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_bit_select_merged_c = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub1_PostCast_primWireOut_sel_x_b[3:2];

    // leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(MUX,294)@4 + 1
    assign leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_s = leftShiftStageSel0Dto0_uid294_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_bit_select_merged_b;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_s)
                2'b00 : leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_Add_x_q;
                2'b01 : leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q <= leftShiftStage0Idx1_uid287_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
                2'b10 : leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q <= leftShiftStage0Idx2_uid290_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
                2'b11 : leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q <= leftShiftStage0Idx3_uid293_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
                default : leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q <= 14'b0;
            endcase
        end
    end

    // redist0_leftShiftStageSel0Dto0_uid294_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_bit_select_merged_c_1(DELAY,479)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_leftShiftStageSel0Dto0_uid294_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_bit_select_merged_c_1_q <= $unsigned(leftShiftStageSel0Dto0_uid294_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_bit_select_merged_c);
        end
    end

    // leftShiftStage1_uid306_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(MUX,305)@5
    assign leftShiftStage1_uid306_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_s = redist0_leftShiftStageSel0Dto0_uid294_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_bit_select_merged_c_1_q;
    always @(leftShiftStage1_uid306_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_s or leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q or leftShiftStage1Idx1_uid298_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q or leftShiftStage1Idx2_uid301_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q or leftShiftStage1Idx3_uid304_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q)
    begin
        unique case (leftShiftStage1_uid306_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_s)
            2'b00 : leftShiftStage1_uid306_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = leftShiftStage0_uid295_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
            2'b01 : leftShiftStage1_uid306_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = leftShiftStage1Idx1_uid298_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
            2'b10 : leftShiftStage1_uid306_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = leftShiftStage1Idx2_uid301_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
            2'b11 : leftShiftStage1_uid306_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = leftShiftStage1Idx3_uid304_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q;
            default : leftShiftStage1_uid306_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q = 14'b0;
        endcase
    end

    // shifter_uid307_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x(BITSELECT,306)@5
    assign shifter_uid307_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in = $unsigned(leftShiftStage1_uid306_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q[11:0]);
    assign shifter_uid307_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b = $unsigned(shifter_uid307_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_in[11:0]);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_wraddr_x(BITJOIN,84)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_wraddr_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_WriteCounter3_x_q, shifter_uid307_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_b};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_hi(BITSELECT,411)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_hi_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_wraddr_x_q[12:11];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA3(LOOKUP,417)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA3_c = $unsigned(redist47_ChannelIn_cunroll_x_in_1_v_tpl_5_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_hi_b)
            2'b11 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA3_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA3_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA3_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA3_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_lo(BITSELECT,418)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_lo_in = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_wraddr_x_q[10:0]);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_lo_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_lo_in[10:0]);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3(DUALMEM,432)@5 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_ia = $unsigned(redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_ena_NotRstA = ~ (areset);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_reset0 = areset;
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
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_ena_NotRstA),
        .sclr(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_reset0),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA3_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB3_h[0]),
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
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB2(LOOKUP,425)@5
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_hi_b)
            2'b10 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB2_h = 1'b1;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB2_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA2(LOOKUP,416)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA2_c = $unsigned(redist47_ChannelIn_cunroll_x_in_1_v_tpl_5_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_hi_b)
            2'b10 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA2_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA2_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA2_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA2_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2(DUALMEM,431)@5 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_ia = $unsigned(redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_ena_NotRstA = ~ (areset);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_reset0 = areset;
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
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_ena_NotRstA),
        .sclr(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_reset0),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA2_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB2_h[0]),
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
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB1(LOOKUP,424)@5
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_hi_b)
            2'b01 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB1_h = 1'b1;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA1(LOOKUP,415)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA1_c = $unsigned(redist47_ChannelIn_cunroll_x_in_1_v_tpl_5_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_hi_b)
            2'b01 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA1_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA1_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA1_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA1_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1(DUALMEM,430)@5 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_ia = $unsigned(redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_ena_NotRstA = ~ (areset);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_reset0 = areset;
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
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_ena_NotRstA),
        .sclr(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_reset0),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA1_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB1_h[0]),
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
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB0(LOOKUP,423)@5
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_hi_b)
            2'b00 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB0_h = 1'b1;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA0(LOOKUP,414)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA0_c = $unsigned(redist47_ChannelIn_cunroll_x_in_1_v_tpl_5_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_hi_b)
            2'b00 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA0_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA0_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA0_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA0_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0(DUALMEM,429)@5 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_ia = $unsigned(redist50_ChannelIn_cunroll_x_in_3_imag_x_tpl_5_mem_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_ena_NotRstA = ~ (areset);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_reset0 = areset;
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
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_ena_NotRstA),
        .sclr(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_reset0),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA0_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB0_h[0]),
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
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0(LOGICAL,434)@7 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_qi = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part0_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part1_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part2_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_part3_q;
    dspba_delay_ver #( .width(16), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_wraddr(COUNTER,546)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_wraddr_i <= $unsigned(redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_wraddr_q = redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_wraddr_i[1:0];

    // redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem(DUALMEM,545)
    assign redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_ia = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q);
    assign redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_aa = redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_wraddr_q;
    assign redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_ab = redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_rdcnt_q[1:0];
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
    ) redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_aa),
        .data_a(redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_ab),
        .q_b(redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_iq),
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
    assign redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_q = redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_iq[15:0];

    // redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_9(DELAY,485)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_9_delay_0 <= $unsigned(redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_q);
            redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_9_delay_1 <= redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_9_delay_0;
            redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_9_q <= redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_9_delay_1;
        end
    end

    // redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_rdcnt(ADD,544)
    assign redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_rdcnt_a = {1'b0, redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_wraddr_q};
    assign redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_rdcnt_b = {1'b0, redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_rdcnt_o <= $unsigned(redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_rdcnt_a) + $unsigned(redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_rdcnt_b);
        end
    end
    assign redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_rdcnt_q = redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_rdcnt_o[2:0];

    // redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_rdcnt(ADD,568)
    assign redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_rdcnt_a = {1'b0, redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_wraddr_q};
    assign redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_rdcnt_b = {1'b0, redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_rdcnt_o <= $unsigned(redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_rdcnt_a) + $unsigned(redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_rdcnt_b);
        end
    end
    assign redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_rdcnt_q = redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_rdcnt_o[2:0];

    // redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_wraddr(COUNTER,566)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_wraddr_i <= $unsigned(redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_wraddr_q = redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_wraddr_i[1:0];

    // redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem(DUALMEM,565)
    assign redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_ia = $unsigned(in_3_real_x_tpl);
    assign redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_aa = redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_wraddr_q;
    assign redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_ab = redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_rdcnt_q[1:0];
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
    ) redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_aa),
        .data_a(redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_ab),
        .q_b(redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_iq),
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
    assign redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_q = redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3(DUALMEM,456)@5 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_ia = $unsigned(redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_ena_NotRstA = ~ (areset);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_reset0 = areset;
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
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_ena_NotRstA),
        .sclr(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_reset0),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA3_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB3_h[0]),
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
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2(DUALMEM,455)@5 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_ia = $unsigned(redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_ena_NotRstA = ~ (areset);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_reset0 = areset;
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
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_ena_NotRstA),
        .sclr(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_reset0),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA2_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB2_h[0]),
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
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1(DUALMEM,454)@5 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_ia = $unsigned(redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_ena_NotRstA = ~ (areset);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_reset0 = areset;
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
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_ena_NotRstA),
        .sclr(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_reset0),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA1_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB1_h[0]),
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
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0(DUALMEM,453)@5 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_ia = $unsigned(redist49_ChannelIn_cunroll_x_in_3_real_x_tpl_5_mem_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_ena_NotRstA = ~ (areset);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_reset0 = areset;
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
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_ena_NotRstA),
        .sclr(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_reset0),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csA0_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_csB0_h[0]),
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
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0(LOGICAL,458)@7 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_qi = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part0_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part1_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part2_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_part3_q;
    dspba_delay_ver #( .width(16), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_wraddr(COUNTER,542)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_wraddr_i <= $unsigned(redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_wraddr_q = redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_wraddr_i[1:0];

    // redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem(DUALMEM,541)
    assign redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_ia = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q);
    assign redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_aa = redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_wraddr_q;
    assign redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_ab = redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_rdcnt_q[1:0];
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
    ) redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_aa),
        .data_a(redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_ab),
        .q_b(redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_iq),
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
    assign redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_q = redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_iq[15:0];

    // redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_9(DELAY,483)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_9_delay_0 <= $unsigned(redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_q);
            redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_9_delay_1 <= redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_9_delay_0;
            redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_9_q <= redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_9_delay_1;
        end
    end

    // redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_rdcnt(ADD,564)
    assign redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_rdcnt_a = {1'b0, redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_wraddr_q};
    assign redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_rdcnt_b = {1'b0, redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_rdcnt_o <= $unsigned(redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_rdcnt_a) + $unsigned(redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_rdcnt_b);
        end
    end
    assign redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_rdcnt_q = redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_rdcnt_o[4:0];

    // redist56_ChannelIn_cunroll_x_in_6_cplen_tpl_4(DELAY,535)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist56_ChannelIn_cunroll_x_in_6_cplen_tpl_4_delay_0 <= $unsigned(in_6_cplen_tpl);
            redist56_ChannelIn_cunroll_x_in_6_cplen_tpl_4_delay_1 <= redist56_ChannelIn_cunroll_x_in_6_cplen_tpl_4_delay_0;
            redist56_ChannelIn_cunroll_x_in_6_cplen_tpl_4_delay_2 <= redist56_ChannelIn_cunroll_x_in_6_cplen_tpl_4_delay_1;
            redist56_ChannelIn_cunroll_x_in_6_cplen_tpl_4_q <= redist56_ChannelIn_cunroll_x_in_6_cplen_tpl_4_delay_2;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x(FIFO,27)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(16),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(16),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(11),
        .lpm_widthu(4),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_fifo (
        .aclr(1'b0),
        .sclr(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_reset),
        .clock(clk),
        .rdreq(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_And_x_q[0]),
        .wrreq(redist42_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q_2_q[0]),
        .data(redist56_ChannelIn_cunroll_x_in_6_cplen_tpl_4_q),
        .almost_full(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_f[0]),
        .almost_empty(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_t[0]),
        .empty(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_empty[0]),
        .q(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_e = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_t);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_v = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_empty);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x(MUX,34)@4 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_And_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q <= 11'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_FIFO_x_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q <= 11'b0;
            endcase
        end
    end

    // redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_wraddr(COUNTER,562)
    // low=0, high=15, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_wraddr_i <= $unsigned(redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_wraddr_i) + $unsigned(4'd1);
        end
    end
    assign redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_wraddr_q = redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_wraddr_i[3:0];

    // redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem(DUALMEM,561)
    assign redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_ia = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q);
    assign redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_aa = redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_wraddr_q;
    assign redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_ab = redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_rdcnt_q[3:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(11),
        .widthad_a(4),
        .numwords_a(16),
        .width_b(11),
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
    ) redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_aa),
        .data_a(redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_ab),
        .q_b(redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_iq),
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
    assign redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_q = redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_iq[10:0];

    // redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_rdcnt(ADD,552)
    assign redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_rdcnt_a = {1'b0, redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_wraddr_q};
    assign redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_rdcnt_b = {1'b0, redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_rdcnt_o <= $unsigned(redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_rdcnt_a) + $unsigned(redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_rdcnt_b);
        end
    end
    assign redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_rdcnt_q = redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_rdcnt_o[4:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x(FIFO,26)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_reset = areset;
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
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_fifo (
        .aclr(1'b0),
        .sclr(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_reset),
        .clock(clk),
        .rdreq(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_And_x_q[0]),
        .wrreq(redist42_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q_2_q[0]),
        .data(redist53_ChannelIn_cunroll_x_in_4_FFTSize_tpl_4_q),
        .almost_full(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_f[0]),
        .almost_empty(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_t[0]),
        .empty(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_empty[0]),
        .q(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_e = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_t);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_v = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_empty);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x(MUX,60)@4 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_And_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q <= 4'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_FIFO_x_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q <= 4'b0;
            endcase
        end
    end

    // redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_wraddr(COUNTER,550)
    // low=0, high=15, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_wraddr_i <= $unsigned(redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_wraddr_i) + $unsigned(4'd1);
        end
    end
    assign redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_wraddr_q = redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_wraddr_i[3:0];

    // redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem(DUALMEM,549)
    assign redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_ia = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q);
    assign redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_aa = redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_wraddr_q;
    assign redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_ab = redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_rdcnt_q[3:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(4),
        .widthad_a(4),
        .numwords_a(16),
        .width_b(4),
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
    ) redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_aa),
        .data_a(redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_ab),
        .q_b(redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_iq),
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
    assign redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_q = redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_iq[3:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CmpNE_x(LOGICAL,66)@5 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CmpNE_x_qi = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_WrCnt_WriteCounter3_x_q != ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Not_x_q ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CmpNE_x_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CmpNE_x_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CmpNE_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist37_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CmpNE_x_q_11(DELAY,516)
    dspba_delay_ver #( .width(1), .depth(10), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist37_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CmpNE_x_q_11 ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CmpNE_x_q), .xout(redist37_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CmpNE_x_q_11_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_PreShift_selectPortDefaultData(BITSHIFT,233)@15
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_PreShift_selectPortDefaultData_qint = { GND_q, 13'b0000000000000 };
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_PreShift_selectPortDefaultData_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_PreShift_selectPortDefaultData_qint[13:0];

    // redist60_ChannelIn_cunroll_x_in_9_rc_bw_sel_tpl_7(DELAY,539)
    dspba_delay_ver #( .width(1), .depth(7), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist60_ChannelIn_cunroll_x_in_9_rc_bw_sel_tpl_7 ( .xin(in_9_rc_bw_sel_tpl), .xout(redist60_ChannelIn_cunroll_x_in_9_rc_bw_sel_tpl_7_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux_x(MUX,183)@7 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux_x_s = redist60_ChannelIn_cunroll_x_in_9_rc_bw_sel_tpl_7_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux_x_q <= in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux_x_q <= in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux_x_q <= 16'b0;
            endcase
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma(CHAINMULTADD,459)@8 + 5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_reset = areset;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena0 = 1'b1;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena1 = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena0;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena2 = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena0;

    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_a0 = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_c0 = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux_x_q;
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
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_DSP0 (
        .clk(clk),
        .ena({ ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena2, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena1, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_a0),
        .ax(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_c0),
        .resulta(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_s0),
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
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_delay0 ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_s0), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_q = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_qq0[31:0]);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_PreShift_0(BITSHIFT,231)@13
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_PreShift_0_qint = { redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_6_mem_q, 15'b000000000000000 };
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_PreShift_0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_PreShift_0_qint[30:0];

    // redist59_ChannelIn_cunroll_x_in_8_ripple_comp_en_tpl_13(DELAY,538)
    dspba_delay_ver #( .width(1), .depth(13), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist59_ChannelIn_cunroll_x_in_8_ripple_comp_en_tpl_13 ( .xin(in_8_ripple_comp_en_tpl), .xout(redist59_ChannelIn_cunroll_x_in_8_ripple_comp_en_tpl_13_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_x(MUX,214)@13
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_x_s = redist59_ChannelIn_cunroll_x_in_8_ripple_comp_en_tpl_13_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_x_s or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_PreShift_0_q or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_q)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_x_q = {{1{ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_PreShift_0_q[30]}}, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_PreShift_0_q};
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_imagMult1_x_cma_q;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_x_q = 32'b0;
        endcase
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select(BITSELECT,250)@13
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_in = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_x_q[16:0]);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_in[16:16]);

    // redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b_1(DELAY,491)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select(BITSELECT,251)@13
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_in = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_x_q[15:0]);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_in[15:15]);

    // redist11_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b_1(DELAY,490)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist11_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_constant(CONSTANT,246)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_constant_q = $unsigned(16'b1000000000000000);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_round_select(BITSELECT,247)@13
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_round_select_in = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_x_q[15:0]);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_round_select_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_round_select_in[15:0]);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp(LOGICAL,249)@13 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp_qi = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_round_select_b == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_constant_q ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux(MUX,252)@14
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_comp_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_s or redist11_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b_1_q or redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b_1_q)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_q = redist11_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_lo_select_b_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_q = redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_hi_select_b_1_q;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_q = 1'b0;
        endcase
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select(BITSELECT,248)@13
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_imag_x_q[31:16]);

    // redist13_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b_1(DELAY,492)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add(ADD,253)@14
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_a = $unsigned({{2{redist13_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b_1_q[15]}}, redist13_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_keep_select_b_1_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_b = $unsigned({17'b00000000000000000, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_mux_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_a) + $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_o[16:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_sel_x(BITSELECT,228)@14
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_sel_x_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_add_q[15:0]);

    // redist15_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_sel_x_b_1(DELAY,494)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist15_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_sel_x_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_sel_x_b);
        end
    end

    // leftShiftStage1Idx3Rng12_uid328_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(BITSELECT,327)@5
    assign leftShiftStage1Idx3Rng12_uid328_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in = leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q[0:0];
    assign leftShiftStage1Idx3Rng12_uid328_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b = leftShiftStage1Idx3Rng12_uid328_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in[0:0];

    // leftShiftStage1Idx3_uid329_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(BITJOIN,328)@5
    assign leftShiftStage1Idx3_uid329_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = {leftShiftStage1Idx3Rng12_uid328_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const1_x_q};

    // leftShiftStage1Idx2Rng8_uid325_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(BITSELECT,324)@5
    assign leftShiftStage1Idx2Rng8_uid325_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in = leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q[4:0];
    assign leftShiftStage1Idx2Rng8_uid325_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b = leftShiftStage1Idx2Rng8_uid325_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in[4:0];

    // leftShiftStage1Idx2_uid326_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(BITJOIN,325)@5
    assign leftShiftStage1Idx2_uid326_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = {leftShiftStage1Idx2Rng8_uid325_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b, leftShiftStage1Idx2Pad8_uid299_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q};

    // leftShiftStage1Idx1Rng4_uid322_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(BITSELECT,321)@5
    assign leftShiftStage1Idx1Rng4_uid322_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in = leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q[8:0];
    assign leftShiftStage1Idx1Rng4_uid322_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b = leftShiftStage1Idx1Rng4_uid322_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in[8:0];

    // leftShiftStage1Idx1_uid323_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(BITJOIN,322)@5
    assign leftShiftStage1Idx1_uid323_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = {leftShiftStage1Idx1Rng4_uid322_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b, leftShiftStage1Idx1Pad4_uid296_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q};

    // leftShiftStage0Idx3Rng3_uid317_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(BITSELECT,316)@5
    assign leftShiftStage0Idx3Rng3_uid317_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_q[9:0];
    assign leftShiftStage0Idx3Rng3_uid317_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b = leftShiftStage0Idx3Rng3_uid317_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in[9:0];

    // leftShiftStage0Idx3_uid318_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(BITJOIN,317)@5
    assign leftShiftStage0Idx3_uid318_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = {leftShiftStage0Idx3Rng3_uid317_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b, leftShiftStage0Idx3Pad3_uid291_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q};

    // leftShiftStage0Idx2Rng2_uid314_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(BITSELECT,313)@5
    assign leftShiftStage0Idx2Rng2_uid314_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_q[10:0];
    assign leftShiftStage0Idx2Rng2_uid314_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b = leftShiftStage0Idx2Rng2_uid314_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in[10:0];

    // leftShiftStage0Idx2_uid315_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(BITJOIN,314)@5
    assign leftShiftStage0Idx2_uid315_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = {leftShiftStage0Idx2Rng2_uid314_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b, leftShiftStage0Idx2Pad2_uid288_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q};

    // leftShiftStage0Idx1Rng1_uid311_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(BITSELECT,310)@5
    assign leftShiftStage0Idx1Rng1_uid311_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_q[11:0];
    assign leftShiftStage0Idx1Rng1_uid311_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b = leftShiftStage0Idx1Rng1_uid311_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in[11:0];

    // leftShiftStage0Idx1_uid312_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(BITJOIN,311)@5
    assign leftShiftStage0Idx1_uid312_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = {leftShiftStage0Idx1Rng1_uid311_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b, GND_q};

    // leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(MUX,319)@5
    assign leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_s = leftShiftStageSel0Dto0_uid319_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_bit_select_merged_b;
    always @(leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_s or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_q or leftShiftStage0Idx1_uid312_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q or leftShiftStage0Idx2_uid315_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q or leftShiftStage0Idx3_uid318_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q)
    begin
        unique case (leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_s)
            2'b00 : leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_LoadableCounter_x_q;
            2'b01 : leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = leftShiftStage0Idx1_uid312_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
            2'b10 : leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = leftShiftStage0Idx2_uid315_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
            2'b11 : leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = leftShiftStage0Idx3_uid318_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
            default : leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = 13'b0;
        endcase
    end

    // redist33_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_2(DELAY,512)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist33_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_2_q <= '0;
        end
        else
        begin
            redist33_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_2_q <= $unsigned(redist32_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_1_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L1_Mux_x(MUX,173)@3 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L1_Mux_x_s = redist33_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_2_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L1_Mux_x_q <= 4'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L1_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L1_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L1_Mux_x_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L1_Mux_x_q <= redist52_ChannelIn_cunroll_x_in_4_FFTSize_tpl_3_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L1_Mux_x_q <= 4'b0;
            endcase
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_x(SUB,82)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_x_a = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Const_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_x_b = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L1_Mux_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_x_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_x_a) - $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_x_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_x_o[4:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_PostCast_primWireOut_sel_x(BITSELECT,198)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_PostCast_primWireOut_sel_x_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_x_q[3:0]);

    // redist18_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_PostCast_primWireOut_sel_x_b_1(DELAY,497)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist18_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_PostCast_primWireOut_sel_x_b);
        end
    end

    // leftShiftStageSel0Dto0_uid319_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_bit_select_merged(BITSELECT,464)@5
    assign leftShiftStageSel0Dto0_uid319_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_bit_select_merged_b = redist18_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_PostCast_primWireOut_sel_x_b_1_q[1:0];
    assign leftShiftStageSel0Dto0_uid319_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_bit_select_merged_c = redist18_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Sub2_PostCast_primWireOut_sel_x_b_1_q[3:2];

    // leftShiftStage1_uid331_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(MUX,330)@5
    assign leftShiftStage1_uid331_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_s = leftShiftStageSel0Dto0_uid319_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_bit_select_merged_c;
    always @(leftShiftStage1_uid331_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_s or leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q or leftShiftStage1Idx1_uid323_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q or leftShiftStage1Idx2_uid326_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q or leftShiftStage1Idx3_uid329_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q)
    begin
        unique case (leftShiftStage1_uid331_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_s)
            2'b00 : leftShiftStage1_uid331_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = leftShiftStage0_uid320_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
            2'b01 : leftShiftStage1_uid331_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = leftShiftStage1Idx1_uid323_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
            2'b10 : leftShiftStage1_uid331_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = leftShiftStage1Idx2_uid326_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
            2'b11 : leftShiftStage1_uid331_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = leftShiftStage1Idx3_uid329_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q;
            default : leftShiftStage1_uid331_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q = 13'b0;
        endcase
    end

    // shifter_uid332_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x(BITSELECT,331)@5
    assign shifter_uid332_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in = $unsigned(leftShiftStage1_uid331_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_q[11:0]);
    assign shifter_uid332_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b = $unsigned(shifter_uid332_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_in[11:0]);

    // redist7_shifter_uid332_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b_1(DELAY,486)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist7_shifter_uid332_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b_1_q <= $unsigned(shifter_uid332_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x(CHOOSEBITS,77)@6
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_a = redist7_shifter_uid332_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift1_x_b_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_a[0:0], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_a[1:1], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_a[2:2], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_a[3:3], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_a[4:4], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_a[5:5], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_a[6:6], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_a[7:7], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_a[8:8], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_a[9:9], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_a[10:10], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_a[11:11]};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpNE_x(LOGICAL,89)@6
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpNE_x_b = {11'b00000000000, GND_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpNE_x_q = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_q != ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpNE_x_b ? 1'b1 : 1'b0);

    // redist58_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_6(DELAY,537)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist58_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_6_delay_0 <= $unsigned(redist57_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_3_q);
            redist58_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_6_delay_1 <= redist58_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_6_delay_0;
            redist58_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_6_q <= redist58_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_6_delay_1;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Mux_x(MUX,96)@6
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Mux_x_s = redist58_ChannelIn_cunroll_x_in_7_DC_SC_EN_tpl_6_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Mux_x_s or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpNE_x_q or VCC_q)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Mux_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpNE_x_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Mux_x_q = VCC_q;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Mux_x_q = 1'b0;
        endcase
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L3_Mux_x(MUX,177)@3 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L3_Mux_x_s = redist33_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_RISING_EDGE_And_x_q_2_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L3_Mux_x_q <= 12'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L3_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L3_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L3_Mux_x_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L3_Mux_x_q <= redist55_ChannelIn_cunroll_x_in_5_NSubCarr_tpl_3_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L3_Mux_x_q <= 12'b0;
            endcase
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_DivBy2_x(BITSELECT,94)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_DivBy2_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L3_Mux_x_q[11:1];

    // redist35_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_DivBy2_x_b_1(DELAY,514)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist35_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_DivBy2_x_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_DivBy2_x_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Add_x(ADD,85)@5 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Add_x_a = {1'b0, redist35_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_DivBy2_x_b_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Add_x_b = {11'b00000000000, VCC_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Add_x_o <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Add_x_a) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Add_x_b);
        end
    end
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Add_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Add_x_o[11:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpLT_x(COMPARE,88)@6
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpLT_x_a = {2'b00, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpLT_x_b = {2'b00, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Add_x_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpLT_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpLT_x_a) - $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpLT_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpLT_x_c[0] = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpLT_x_o[13];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_And_x(LOGICAL,86)@6 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_And_x_qi = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpLT_x_c & ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Mux_x_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_And_x_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_And_x_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_And_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // leftShiftStage1Idx3Rng12_uid382_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x(BITSELECT,381)@4
    assign leftShiftStage1Idx3Rng12_uid382_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_in = leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q[0:0];
    assign leftShiftStage1Idx3Rng12_uid382_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_b = leftShiftStage1Idx3Rng12_uid382_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_in[0:0];

    // leftShiftStage1Idx3_uid383_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x(BITJOIN,382)@4
    assign leftShiftStage1Idx3_uid383_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q = {leftShiftStage1Idx3Rng12_uid382_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_b, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ReadCounter_Const1_x_q};

    // leftShiftStage1Idx2Rng8_uid379_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x(BITSELECT,378)@4
    assign leftShiftStage1Idx2Rng8_uid379_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_in = leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q[4:0];
    assign leftShiftStage1Idx2Rng8_uid379_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_b = leftShiftStage1Idx2Rng8_uid379_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_in[4:0];

    // leftShiftStage1Idx2_uid380_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x(BITJOIN,379)@4
    assign leftShiftStage1Idx2_uid380_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q = {leftShiftStage1Idx2Rng8_uid379_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_b, leftShiftStage1Idx2Pad8_uid299_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q};

    // leftShiftStage1Idx1Rng4_uid376_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x(BITSELECT,375)@4
    assign leftShiftStage1Idx1Rng4_uid376_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_in = leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q[8:0];
    assign leftShiftStage1Idx1Rng4_uid376_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_b = leftShiftStage1Idx1Rng4_uid376_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_in[8:0];

    // leftShiftStage1Idx1_uid377_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x(BITJOIN,376)@4
    assign leftShiftStage1Idx1_uid377_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q = {leftShiftStage1Idx1Rng4_uid376_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_b, leftShiftStage1Idx1Pad4_uid296_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift_x_q};

    // leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x(MUX,373)@4
    assign leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_s = leftShiftStageSel0Dto0_uid373_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_bit_select_merged_b;
    always @(leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_s or xPadded_uid336_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q or leftShiftStage0Idx1_uid339_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q or leftShiftStage0Idx2_uid342_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q or leftShiftStage0Idx3_uid345_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q)
    begin
        unique case (leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_s)
            2'b00 : leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q = xPadded_uid336_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q;
            2'b01 : leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q = leftShiftStage0Idx1_uid339_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q;
            2'b10 : leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q = leftShiftStage0Idx2_uid342_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q;
            2'b11 : leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q = leftShiftStage0Idx3_uid345_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_LShift2_x_q_const_q;
            default : leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q = 13'b0;
        endcase
    end

    // leftShiftStageSel0Dto0_uid373_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_bit_select_merged(BITSELECT,462)@4
    assign leftShiftStageSel0Dto0_uid373_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_bit_select_merged_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L1_Mux_x_q[1:0];
    assign leftShiftStageSel0Dto0_uid373_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_bit_select_merged_c = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_latch_0L1_Mux_x_q[3:2];

    // leftShiftStage1_uid385_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x(MUX,384)@4 + 1
    assign leftShiftStage1_uid385_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_s = leftShiftStageSel0Dto0_uid373_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_bit_select_merged_c;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (leftShiftStage1_uid385_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_s)
                2'b00 : leftShiftStage1_uid385_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q <= leftShiftStage0_uid374_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q;
                2'b01 : leftShiftStage1_uid385_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q <= leftShiftStage1Idx1_uid377_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q;
                2'b10 : leftShiftStage1_uid385_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q <= leftShiftStage1Idx2_uid380_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q;
                2'b11 : leftShiftStage1_uid385_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q <= leftShiftStage1Idx3_uid383_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q;
                default : leftShiftStage1_uid385_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q <= 13'b0;
            endcase
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Sub2_x(SUB,98)@5 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Sub2_x_a = $unsigned({1'b0, leftShiftStage1_uid385_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_LShift_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Sub2_x_b = $unsigned({3'b000, redist35_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_DivBy2_x_b_1_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Sub2_x_o <= $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Sub2_x_a) - $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Sub2_x_b));
        end
    end
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Sub2_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Sub2_x_o[13:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpGE_x(COMPARE,87)@6 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpGE_x_a = $unsigned({4'b0000, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm1_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpGE_x_b = $unsigned({{2{ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Sub2_x_q[13]}}, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Sub2_x_q});
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpGE_x_o <= $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpGE_x_a) - $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpGE_x_b));
        end
    end
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpGE_x_n[0] = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpGE_x_o[15]);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x(LOGICAL,97)@7 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_qi = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_CmpGE_x_n | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_And_x_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist34_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_q_8(DELAY,513)
    dspba_delay_ver #( .width(1), .depth(7), .reset_kind("NONE"), .phase(0), .modulus(1024) )
    redist34_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_q_8 ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_q), .xout(redist34_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_q_8_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_x(SELECTOR,194)@15
    always @(redist34_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_q_8_q or redist15_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_sel_x_b_1_q or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_PreShift_selectPortDefaultData_q)
    begin
        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_x_q = {2'b00, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_PreShift_selectPortDefaultData_q};
        if (redist34_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_q_8_q == 1'b1)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_x_q = $unsigned(redist15_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_sel_x_b_1_q);
        end
    end

    // redist20_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_x_q_1(DELAY,499)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist20_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_PreShift_selectPortDefaultData(BITSHIFT,230)@15
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_PreShift_selectPortDefaultData_qint = { GND_q, 13'b0000000000000 };
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_PreShift_selectPortDefaultData_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_PreShift_selectPortDefaultData_qint[13:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma(CHAINMULTADD,460)@8 + 5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_reset = areset;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_ena0 = 1'b1;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_ena1 = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_ena0;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_ena2 = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_ena0;

    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_a0 = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_c0 = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux_x_q;
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
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_DSP0 (
        .clk(clk),
        .ena({ ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_ena2, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_ena1, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_a0),
        .ax(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_c0),
        .resulta(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_s0),
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
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_delay0 ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_s0), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_q = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_qq0[31:0]);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_PreShift_0(BITSHIFT,232)@13
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_PreShift_0_qint = { redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_6_mem_q, 15'b000000000000000 };
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_PreShift_0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_PreShift_0_qint[30:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_x(MUX,215)@13
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_x_s = redist59_ChannelIn_cunroll_x_in_8_ripple_comp_en_tpl_13_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_x_s or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_PreShift_0_q or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_q)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_x_q = {{1{ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_PreShift_0_q[30]}}, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_PreShift_0_q};
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mult_realMult1_x_cma_q;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_x_q = 32'b0;
        endcase
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select(BITSELECT,258)@13
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_in = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_x_q[16:0]);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_in[16:16]);

    // redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b_1(DELAY,488)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select(BITSELECT,259)@13
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_in = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_x_q[15:0]);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_in[15:15]);

    // redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b_1(DELAY,487)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_round_select(BITSELECT,255)@13
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_round_select_in = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_x_q[15:0]);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_round_select_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_round_select_in[15:0]);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp(LOGICAL,257)@13 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp_qi = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_round_select_b == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_imag_rnd_x_replace_constant_q ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux(MUX,260)@14
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_comp_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_s or redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b_1_q or redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b_1_q)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_q = redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_lo_select_b_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_q = redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_hi_select_b_1_q;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_q = 1'b0;
        endcase
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select(BITSELECT,256)@13
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Mux1_real_x_q[31:16]);

    // redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b_1(DELAY,489)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_add(ADD,261)@14
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_a = $unsigned({{2{redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b_1_q[15]}}, redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_keep_select_b_1_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_b = $unsigned({17'b00000000000000000, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_mux_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_a) + $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_o[16:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_sel_x(BITSELECT,229)@14
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_sel_x_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_rnd_x_replace_add_q[15:0]);

    // redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_sel_x_b_1(DELAY,493)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_sel_x_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_sel_x_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_x(SELECTOR,195)@15
    always @(redist34_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_q_8_q or redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_sel_x_b_1_q or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_PreShift_selectPortDefaultData_q)
    begin
        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_x_q = {2'b00, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_PreShift_selectPortDefaultData_q};
        if (redist34_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CheckLegalRange_Or_x_q_8_q == 1'b1)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_x_q = $unsigned(redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Convert_real_sel_x_b_1_q);
        end
    end

    // redist19_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_x_q_1(DELAY,498)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist19_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_x_q);
        end
    end

    // redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_rdcnt(ADD,560)
    assign redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_rdcnt_a = {1'b0, redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_wraddr_q};
    assign redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_rdcnt_b = {1'b0, redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_rdcnt_o <= $unsigned(redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_rdcnt_a) + $unsigned(redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_rdcnt_b);
        end
    end
    assign redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_rdcnt_q = redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_rdcnt_o[4:0];

    // redist48_ChannelIn_cunroll_x_in_2_c_tpl_4(DELAY,527)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist48_ChannelIn_cunroll_x_in_2_c_tpl_4_delay_0 <= $unsigned(in_2_c_tpl);
            redist48_ChannelIn_cunroll_x_in_2_c_tpl_4_delay_1 <= redist48_ChannelIn_cunroll_x_in_2_c_tpl_4_delay_0;
            redist48_ChannelIn_cunroll_x_in_2_c_tpl_4_delay_2 <= redist48_ChannelIn_cunroll_x_in_2_c_tpl_4_delay_1;
            redist48_ChannelIn_cunroll_x_in_2_c_tpl_4_q <= redist48_ChannelIn_cunroll_x_in_2_c_tpl_4_delay_2;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x(FIFO,36)@4
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(16),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(16),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(8),
        .lpm_widthu(4),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_fifo (
        .aclr(1'b0),
        .sclr(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_reset),
        .clock(clk),
        .rdreq(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_And_x_q[0]),
        .wrreq(redist42_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE1_And_x_q_2_q[0]),
        .data(redist48_ChannelIn_cunroll_x_in_2_c_tpl_4_q),
        .almost_full(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_f[0]),
        .almost_empty(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_t[0]),
        .empty(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_empty[0]),
        .q(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_e = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_t);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_v = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_empty);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x(MUX,43)@4 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_RISING_EDGE3_And_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q <= 8'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_FIFO_x_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q <= 8'b0;
            endcase
        end
    end

    // redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_wraddr(COUNTER,558)
    // low=0, high=15, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_wraddr_i <= $unsigned(redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_wraddr_i) + $unsigned(4'd1);
        end
    end
    assign redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_wraddr_q = redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_wraddr_i[3:0];

    // redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem(DUALMEM,557)
    assign redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_ia = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q);
    assign redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_aa = redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_wraddr_q;
    assign redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_ab = redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_rdcnt_q[3:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(8),
        .widthad_a(4),
        .numwords_a(16),
        .width_b(8),
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
    ) redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_aa),
        .data_a(redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_ab),
        .q_b(redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_iq),
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
    assign redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_q = redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_iq[7:0];

    // redist26_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q_13(DELAY,505)
    dspba_delay_ver #( .width(1), .depth(11), .reset_kind("SYNC"), .phase(1), .modulus(1024) )
    redist26_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q_13 ( .xin(redist25_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q_2_q), .xout(redist26_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q_13_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ChannelOut_cunroll_x(PORTOUT,25)@16 + 1
    assign out_1_qv_tpl = redist26_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_StretchPulse_And_x_q_13_q;
    assign out_2_qc_tpl = redist40_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem2_latch_0L3_Mux_x_q_12_mem_q;
    assign out_3_real_q_tpl = redist19_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_real_x_q_1_q;
    assign out_3_imag_q_tpl = redist20_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Select1_imag_x_q_1_q;
    assign out_4_ready_tpl = redist37_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_CmpNE_x_q_11_q;
    assign out_5_size_out_tpl = redist38_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem_latch_0L3_Mux_x_q_12_mem_q;
    assign out_6_cp_len_tpl = redist41_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem1_latch_0L3_Mux_x_q_12_mem_q;
    assign out_7_real_q_rc_off_tpl = redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_real_x_qB_l0_or0_q_9_q;
    assign out_7_imag_q_rc_off_tpl = redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_DualMem1_imag_x_qB_l0_or0_q_9_q;
    assign out_8_fd_time_out_tpl = redist39_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Subsystem3_latch_0L3_Mux_x_q_12_mem_q;

    // out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(GPOUT,218)@0
    assign out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_q;

    // out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(GPOUT,219)@0
    assign out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Perm2_x_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Const1_x(CONSTANT,181)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Const1_x_q = $unsigned(16'b0000000000000000);

    // out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(GPOUT,220)@0
    assign out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Const1_x_q;

    // out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(GPOUT,221)@0
    assign out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_Const1_x_q;

endmodule
