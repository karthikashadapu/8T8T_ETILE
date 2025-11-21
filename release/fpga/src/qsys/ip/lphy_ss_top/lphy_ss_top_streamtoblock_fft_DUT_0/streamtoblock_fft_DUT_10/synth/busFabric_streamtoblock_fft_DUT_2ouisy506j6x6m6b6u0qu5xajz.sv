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

// SystemVerilog created from busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz
// SystemVerilog created on Thu Jun 12 21:29:54 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    input wire [11:0] in_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    input wire [11:0] in_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    input wire [15:0] in_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    input wire [15:0] in_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    output wire [31:0] out_AMMregisterWireData_streamtoblock_fft_DUT_RegField4_x_tpl,
    output wire [31:0] out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl,
    output wire [0:0] out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl,
    output wire [31:0] out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl,
    output wire [0:0] out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl,
    output wire [15:0] out_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl,
    output wire [15:0] out_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [31:0] mm_reg_0_x_a;
    wire [0:0] mm_reg_0_x_b;
    reg [31:0] mm_reg_0_x_v;
    reg [31:0] mm_reg_0_x_q;
    wire [31:0] mm_reg_4_x_a;
    wire [0:0] mm_reg_4_x_b;
    reg [31:0] mm_reg_4_x_v;
    reg [31:0] mm_reg_4_x_q;
    wire [31:0] mm_reg_5_x_a;
    wire [0:0] mm_reg_5_x_b;
    reg [31:0] mm_reg_5_x_v;
    reg [31:0] mm_reg_5_x_q;
    wire [31:0] mm_reg_6_x_a;
    wire [0:0] mm_reg_6_x_b;
    reg [31:0] mm_reg_6_x_v;
    reg [31:0] mm_reg_6_x_q;
    wire [31:0] mm_reg_7_x_a;
    wire [0:0] mm_reg_7_x_b;
    reg [31:0] mm_reg_7_x_v;
    reg [31:0] mm_reg_7_x_q;
    wire [0:0] addr_0_cmp_x_qi;
    reg [0:0] addr_0_cmp_x_q;
    wire [13:0] addr_0_const_0_x_q;
    wire [0:0] addr_4_cmp_x_qi;
    reg [0:0] addr_4_cmp_x_q;
    wire [13:0] addr_4_const_4_x_q;
    wire [0:0] addr_5_cmp_x_qi;
    reg [0:0] addr_5_cmp_x_q;
    wire [13:0] addr_5_const_5_x_q;
    wire [0:0] addr_6_cmp_x_qi;
    reg [0:0] addr_6_cmp_x_q;
    wire [13:0] addr_6_const_6_x_q;
    wire [0:0] addr_7_cmp_x_qi;
    reg [0:0] addr_7_cmp_x_q;
    wire [13:0] addr_7_const_7_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrGE0AndLtLen_x_q;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_a;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_b;
    logic [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_o;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_q;
    wire [7:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_baseAddr_x_q;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpLtLen_x_a;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpLtLen_x_b;
    logic [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpLtLen_x_o;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpLtLen_x_c;
    wire [13:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mapLen_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reAnd_x_qi;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reAnd_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_weAnd_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrGE0AndLtLen_x_q;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_a;
    wire [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_b;
    logic [16:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_o;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_q;
    wire [13:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_baseAddr_x_q;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpLtLen_x_a;
    wire [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpLtLen_x_b;
    logic [17:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpLtLen_x_o;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpLtLen_x_c;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_reAnd_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_weAnd_x_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_bitsel_x_b;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_bitsel_x_b;
    wire [0:0] addr_0_readHit_and_x_q;
    wire [0:0] addr_0_writeHit_and_x_q;
    wire [0:0] addr_4_readHit_and_x_q;
    wire [0:0] addr_4_writeHit_and_x_q;
    wire [0:0] addr_5_readHit_and_x_q;
    wire [0:0] addr_5_writeHit_and_x_q;
    wire [0:0] addr_6_readHit_and_x_q;
    wire [0:0] addr_6_writeHit_and_x_q;
    wire [0:0] addr_7_readHit_and_x_q;
    wire [0:0] addr_7_writeHit_and_x_q;
    wire [31:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reinterp_sel_x_in;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reinterp_sel_x_b;
    wire [31:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_reinterp_sel_x_in;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_reinterp_sel_x_b;
    reg [31:0] bus_selector_opt_lev0_id0_q;
    reg [0:0] bus_selector_opt_lev0_id0_v;
    reg [31:0] bus_selector_opt_lev0_id1_q;
    reg [0:0] bus_selector_opt_lev0_id1_v;
    reg [31:0] bus_selector_opt_lev1_id0_q;
    reg [0:0] bus_selector_opt_lev1_id0_v;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpGE0_x_cmp_nsign_q;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpGE0_x_cmp_nsign_q;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_hi_in;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_hi_b;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA0_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA0_e;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA0_c;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA1_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA1_e;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA1_c;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_lo_in;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_lo_b;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_hi_b;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csB0_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csB1_h;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_lo_in;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_lo_b;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_ena_NotRstA;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_reset1;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_ena_NotRstA;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_reset1;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_qB_l0_or0_q;
    wire [11:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_hi_in;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_hi_b;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA0_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA0_e;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA0_c;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA1_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA1_e;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA1_c;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_lo_in;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_lo_b;
    wire [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_hi_b;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csB0_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csB1_h;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_lo_in;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_lo_b;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_ena_NotRstA;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_reset1;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_ena_NotRstA;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_reset1;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_qB_l0_or0_q;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_csB0_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_csB1_h;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_ena_NotRstA;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_ena_NotRstA;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_qB_l0_or0_q;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_csB0_h;
    reg [0:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_csB1_h;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_ena_NotRstA;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_q;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_reset0;
    wire streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_ena_NotRstA;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_ia;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_aa;
    wire [10:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_ab;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_iq;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_q;
    wire [15:0] streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_qB_l0_or0_q;
    reg [0:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrGE0AndLtLen_x_q_2_q;
    reg [0:0] redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrGE0AndLtLen_x_q_2_delay_0;
    reg [0:0] redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reAnd_x_q_2_q;
    reg [0:0] redist2_addr_7_cmp_x_q_2_q;
    reg [0:0] redist3_addr_6_cmp_x_q_2_q;
    reg [0:0] redist4_addr_5_cmp_x_q_2_q;
    reg [0:0] redist5_addr_4_cmp_x_q_2_q;
    reg [0:0] redist6_addr_0_cmp_x_q_2_q;
    reg [31:0] redist7_busIn_writedata_2_q;
    reg [31:0] redist7_busIn_writedata_2_delay_0;
    reg [0:0] redist8_busIn_write_2_q;
    reg [0:0] redist8_busIn_write_2_delay_0;
    reg [0:0] redist9_busIn_read_2_q;
    reg [0:0] redist9_busIn_read_2_delay_0;

    import streamtoblock_fft_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist8_busIn_write_2(DELAY,161)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            redist8_busIn_write_2_delay_0 <= '0;
        end
        else
        begin
            redist8_busIn_write_2_delay_0 <= $unsigned(busIn_write);
        end
    end
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_busIn_write_2_q <= redist8_busIn_write_2_delay_0;
        end
    end

    // addr_7_const_7_x(CONSTANT,31)
    assign addr_7_const_7_x_q = $unsigned(14'b00000000000111);

    // addr_7_cmp_x(LOGICAL,30)@0 + 1
    assign addr_7_cmp_x_qi = $unsigned(addr_7_const_7_x_q == busIn_address ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    addr_7_cmp_x_delay ( .xin(addr_7_cmp_x_qi), .xout(addr_7_cmp_x_q), .clk(bus_clk), .aclr(bus_areset), .ena(1'b1) );

    // redist2_addr_7_cmp_x_q_2(DELAY,155)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            redist2_addr_7_cmp_x_q_2_q <= '0;
        end
        else
        begin
            redist2_addr_7_cmp_x_q_2_q <= $unsigned(addr_7_cmp_x_q);
        end
    end

    // addr_7_writeHit_and_x(LOGICAL,73)@2
    assign addr_7_writeHit_and_x_q = redist2_addr_7_cmp_x_q_2_q & redist8_busIn_write_2_q;

    // redist7_busIn_writedata_2(DELAY,160)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            redist7_busIn_writedata_2_delay_0 <= '0;
        end
        else
        begin
            redist7_busIn_writedata_2_delay_0 <= $unsigned(busIn_writedata);
        end
    end
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist7_busIn_writedata_2_q <= redist7_busIn_writedata_2_delay_0;
        end
    end

    // mm_reg_7_x(SYNCREG,14)@2
    assign mm_reg_7_x_a = redist7_busIn_writedata_2_q;
    assign mm_reg_7_x_b = addr_7_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000100000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_7_x ( .xin(mm_reg_7_x_a), .ena(mm_reg_7_x_b), .xout(mm_reg_7_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_7_x_v), .clk2(clk), .aclr2(areset) );

    // redist9_busIn_read_2(DELAY,162)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            redist9_busIn_read_2_delay_0 <= '0;
        end
        else
        begin
            redist9_busIn_read_2_delay_0 <= $unsigned(busIn_read);
        end
    end
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_busIn_read_2_q <= redist9_busIn_read_2_delay_0;
        end
    end

    // addr_7_readHit_and_x(LOGICAL,72)@2
    assign addr_7_readHit_and_x_q = redist2_addr_7_cmp_x_q_2_q & redist9_busIn_read_2_q;

    // addr_6_const_6_x(CONSTANT,29)
    assign addr_6_const_6_x_q = $unsigned(14'b00000000000110);

    // addr_6_cmp_x(LOGICAL,28)@0 + 1
    assign addr_6_cmp_x_qi = $unsigned(addr_6_const_6_x_q == busIn_address ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    addr_6_cmp_x_delay ( .xin(addr_6_cmp_x_qi), .xout(addr_6_cmp_x_q), .clk(bus_clk), .aclr(bus_areset), .ena(1'b1) );

    // redist3_addr_6_cmp_x_q_2(DELAY,156)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            redist3_addr_6_cmp_x_q_2_q <= '0;
        end
        else
        begin
            redist3_addr_6_cmp_x_q_2_q <= $unsigned(addr_6_cmp_x_q);
        end
    end

    // addr_6_writeHit_and_x(LOGICAL,71)@2
    assign addr_6_writeHit_and_x_q = redist3_addr_6_cmp_x_q_2_q & redist8_busIn_write_2_q;

    // mm_reg_6_x(SYNCREG,13)@2
    assign mm_reg_6_x_a = redist7_busIn_writedata_2_q;
    assign mm_reg_6_x_b = addr_6_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_6_x ( .xin(mm_reg_6_x_a), .ena(mm_reg_6_x_b), .xout(mm_reg_6_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_6_x_v), .clk2(clk), .aclr2(areset) );

    // addr_6_readHit_and_x(LOGICAL,70)@2
    assign addr_6_readHit_and_x_q = redist3_addr_6_cmp_x_q_2_q & redist9_busIn_read_2_q;

    // addr_5_const_5_x(CONSTANT,27)
    assign addr_5_const_5_x_q = $unsigned(14'b00000000000101);

    // addr_5_cmp_x(LOGICAL,26)@0 + 1
    assign addr_5_cmp_x_qi = $unsigned(addr_5_const_5_x_q == busIn_address ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    addr_5_cmp_x_delay ( .xin(addr_5_cmp_x_qi), .xout(addr_5_cmp_x_q), .clk(bus_clk), .aclr(bus_areset), .ena(1'b1) );

    // redist4_addr_5_cmp_x_q_2(DELAY,157)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            redist4_addr_5_cmp_x_q_2_q <= '0;
        end
        else
        begin
            redist4_addr_5_cmp_x_q_2_q <= $unsigned(addr_5_cmp_x_q);
        end
    end

    // addr_5_writeHit_and_x(LOGICAL,69)@2
    assign addr_5_writeHit_and_x_q = redist4_addr_5_cmp_x_q_2_q & redist8_busIn_write_2_q;

    // mm_reg_5_x(SYNCREG,12)@2
    assign mm_reg_5_x_a = redist7_busIn_writedata_2_q;
    assign mm_reg_5_x_b = addr_5_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000001), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_5_x ( .xin(mm_reg_5_x_a), .ena(mm_reg_5_x_b), .xout(mm_reg_5_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_5_x_v), .clk2(clk), .aclr2(areset) );

    // addr_5_readHit_and_x(LOGICAL,68)@2
    assign addr_5_readHit_and_x_q = redist4_addr_5_cmp_x_q_2_q & redist9_busIn_read_2_q;

    // addr_4_const_4_x(CONSTANT,25)
    assign addr_4_const_4_x_q = $unsigned(14'b00000000000100);

    // addr_4_cmp_x(LOGICAL,24)@0 + 1
    assign addr_4_cmp_x_qi = $unsigned(addr_4_const_4_x_q == busIn_address ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    addr_4_cmp_x_delay ( .xin(addr_4_cmp_x_qi), .xout(addr_4_cmp_x_q), .clk(bus_clk), .aclr(bus_areset), .ena(1'b1) );

    // redist5_addr_4_cmp_x_q_2(DELAY,158)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            redist5_addr_4_cmp_x_q_2_q <= '0;
        end
        else
        begin
            redist5_addr_4_cmp_x_q_2_q <= $unsigned(addr_4_cmp_x_q);
        end
    end

    // addr_4_writeHit_and_x(LOGICAL,67)@2
    assign addr_4_writeHit_and_x_q = redist5_addr_4_cmp_x_q_2_q & redist8_busIn_write_2_q;

    // mm_reg_4_x(SYNCREG,11)@2
    assign mm_reg_4_x_a = redist7_busIn_writedata_2_q;
    assign mm_reg_4_x_b = addr_4_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000100011), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_4_x ( .xin(mm_reg_4_x_a), .ena(mm_reg_4_x_b), .xout(mm_reg_4_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_4_x_v), .clk2(clk), .aclr2(areset) );

    // addr_4_readHit_and_x(LOGICAL,66)@2
    assign addr_4_readHit_and_x_q = redist5_addr_4_cmp_x_q_2_q & redist9_busIn_read_2_q;

    // bus_selector_opt_lev0_id1(SELECTOR,77)@2
    always @(addr_4_readHit_and_x_q or mm_reg_4_x_q or addr_5_readHit_and_x_q or mm_reg_5_x_q or addr_6_readHit_and_x_q or mm_reg_6_x_q)
    begin
        bus_selector_opt_lev0_id1_q = 32'b0;
        bus_selector_opt_lev0_id1_v = $unsigned(1'b0);
        if (addr_6_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id1_q = mm_reg_6_x_q;
            bus_selector_opt_lev0_id1_v = $unsigned(1'b1);
        end
        if (addr_5_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id1_q = mm_reg_5_x_q;
            bus_selector_opt_lev0_id1_v = $unsigned(1'b1);
        end
        if (addr_4_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id1_q = mm_reg_4_x_q;
            bus_selector_opt_lev0_id1_v = $unsigned(1'b1);
        end
    end

    // addr_0_const_0_x(CONSTANT,23)
    assign addr_0_const_0_x_q = $unsigned(14'b00000000000000);

    // addr_0_cmp_x(LOGICAL,22)@0 + 1
    assign addr_0_cmp_x_qi = $unsigned(addr_0_const_0_x_q == busIn_address ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    addr_0_cmp_x_delay ( .xin(addr_0_cmp_x_qi), .xout(addr_0_cmp_x_q), .clk(bus_clk), .aclr(bus_areset), .ena(1'b1) );

    // redist6_addr_0_cmp_x_q_2(DELAY,159)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            redist6_addr_0_cmp_x_q_2_q <= '0;
        end
        else
        begin
            redist6_addr_0_cmp_x_q_2_q <= $unsigned(addr_0_cmp_x_q);
        end
    end

    // addr_0_writeHit_and_x(LOGICAL,65)@2
    assign addr_0_writeHit_and_x_q = redist6_addr_0_cmp_x_q_2_q & redist8_busIn_write_2_q;

    // mm_reg_0_x(SYNCREG,10)@2
    assign mm_reg_0_x_a = redist7_busIn_writedata_2_q;
    assign mm_reg_0_x_b = addr_0_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b01001100110011001100110100000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_0_x ( .xin(mm_reg_0_x_a), .ena(mm_reg_0_x_b), .xout(mm_reg_0_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_0_x_v), .clk2(clk), .aclr2(areset) );

    // addr_0_readHit_and_x(LOGICAL,64)@2
    assign addr_0_readHit_and_x_q = redist6_addr_0_cmp_x_q_2_q & redist9_busIn_read_2_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_baseAddr_x(CONSTANT,47)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_baseAddr_x_q = $unsigned(14'b01000001100100);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x(SUB,46)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_a = $unsigned({3'b000, busIn_address});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_b = $unsigned({{3{streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_baseAddr_x_q[13]}}, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_baseAddr_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_o = $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_a) - $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_b));
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_o[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_hi(BITSELECT,102)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_hi_in = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_q[11:0];
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_hi_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_hi_in[11:11];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_csB1(LOOKUP,147)@0
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_hi_b)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_hi_b)
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_csB1_h = 1'b1;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mapLen_x(CONSTANT,40)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mapLen_x_q = $unsigned(14'b01000000000000);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpLtLen_x(COMPARE,49)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpLtLen_x_a = $unsigned({{2{streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_q[15]}}, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpLtLen_x_b = $unsigned({4'b0000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mapLen_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpLtLen_x_o = $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpLtLen_x_a) - $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpLtLen_x_b));
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpLtLen_x_c[0] = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpLtLen_x_o[17];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpGE0_x_cmp_nsign(LOGICAL,83)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpGE0_x_cmp_nsign_q = $unsigned(~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_q[15:15]));

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrGE0AndLtLen_x(LOGICAL,45)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrGE0AndLtLen_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpGE0_x_cmp_nsign_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_cmpLtLen_x_c;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_weAnd_x(LOGICAL,55)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_weAnd_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrGE0AndLtLen_x_q & busIn_write;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA1(LOOKUP,106)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA1_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_weAnd_x_q);
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_hi_b or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_hi_b)
            1'b1 : begin
                       streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA1_h = 1'b1;
                       streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA1_e = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA1_c;
                   end
            default : begin
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA1_h = 1'b0;
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_lo(BITSELECT,107)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_lo_in = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrOffset_x_q[10:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_lo_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_lo_in[10:0]);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1(DUALMEM,151)@0 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_ia = $unsigned(busIn_writedata[15:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_ena_NotRstA = ~ (bus_areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_reset0 = bus_areset;
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
        .read_during_write_mode_mixed_ports("OLD_DATA"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("streamtoblock_fft/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000_60MHz_mem_x_a_part1.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_dmem (
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_ena_NotRstA),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_reset0),
        .clock0(bus_clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA1_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_csB1_h[0]),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_csB0(LOOKUP,146)@0
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_hi_b)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_hi_b)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_csB0_h = 1'b1;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA0(LOOKUP,105)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA0_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_weAnd_x_q);
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_hi_b or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_hi_b)
            1'b0 : begin
                       streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA0_h = 1'b1;
                       streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA0_e = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA0_c;
                   end
            default : begin
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA0_h = 1'b0;
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0(DUALMEM,150)@0 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_ia = $unsigned(busIn_writedata[15:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_ena_NotRstA = ~ (bus_areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_reset0 = bus_areset;
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
        .read_during_write_mode_mixed_ports("OLD_DATA"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("streamtoblock_fft/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000_60MHz_mem_x_a_part0.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_dmem (
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_ena_NotRstA),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_reset0),
        .clock0(bus_clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA0_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_csB0_h[0]),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_qB_l0_or0(LOGICAL,152)@2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_qB_l0_or0_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part0_q | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_part1_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_reinterp_sel_x(BITSELECT,75)@2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_reinterp_sel_x_in = {16'b0000000000000000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_a_qB_l0_or0_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_reinterp_sel_x_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_reinterp_sel_x_in[15:0];

    // redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrGE0AndLtLen_x_q_2(DELAY,153)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrGE0AndLtLen_x_q_2_delay_0 <= '0;
        end
        else
        begin
            redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrGE0AndLtLen_x_q_2_delay_0 <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrGE0AndLtLen_x_q);
        end
    end
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrGE0AndLtLen_x_q_2_q <= redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrGE0AndLtLen_x_q_2_delay_0;
        end
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_reAnd_x(LOGICAL,53)@2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_reAnd_x_q = redist0_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_addrGE0AndLtLen_x_q_2_q & redist9_busIn_read_2_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_baseAddr_x(CONSTANT,36)
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_baseAddr_x_q = $unsigned(8'b01100100);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x(SUB,35)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_a = $unsigned({3'b000, busIn_address});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_b = $unsigned({{9{streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_baseAddr_x_q[7]}}, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_baseAddr_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_o = $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_a) - $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_b));
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_o[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_hi(BITSELECT,85)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_hi_in = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_q[11:0];
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_hi_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_hi_in[11:11];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_csB1(LOOKUP,130)@0
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_hi_b)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_hi_b)
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_csB1_h = 1'b1;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpLtLen_x(COMPARE,38)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpLtLen_x_a = $unsigned({{2{streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_q[15]}}, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpLtLen_x_b = $unsigned({4'b0000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mapLen_x_q});
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpLtLen_x_o = $unsigned($signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpLtLen_x_a) - $signed(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpLtLen_x_b));
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpLtLen_x_c[0] = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpLtLen_x_o[17];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpGE0_x_cmp_nsign(LOGICAL,80)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpGE0_x_cmp_nsign_q = $unsigned(~ (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_q[15:15]));

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrGE0AndLtLen_x(LOGICAL,34)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrGE0AndLtLen_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpGE0_x_cmp_nsign_q & streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_cmpLtLen_x_c;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_weAnd_x(LOGICAL,44)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_weAnd_x_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrGE0AndLtLen_x_q & busIn_write;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA1(LOOKUP,89)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA1_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_weAnd_x_q);
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_hi_b or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_hi_b)
            1'b1 : begin
                       streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA1_h = 1'b1;
                       streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA1_e = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA1_c;
                   end
            default : begin
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA1_h = 1'b0;
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_lo(BITSELECT,90)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_lo_in = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrOffset_x_q[10:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_lo_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_lo_in[10:0]);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1(DUALMEM,134)@0 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_ia = $unsigned(busIn_writedata[15:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_ena_NotRstA = ~ (bus_areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_reset0 = bus_areset;
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
        .read_during_write_mode_mixed_ports("OLD_DATA"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("streamtoblock_fft/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000100MHz_mem_x_a_part1.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_dmem (
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_ena_NotRstA),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_reset0),
        .clock0(bus_clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA1_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_csB1_h[0]),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_csB0(LOOKUP,129)@0
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_hi_b)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_hi_b)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_csB0_h = 1'b1;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA0(LOOKUP,88)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA0_c = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_weAnd_x_q);
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_hi_b or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_hi_b)
            1'b0 : begin
                       streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA0_h = 1'b1;
                       streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA0_e = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA0_c;
                   end
            default : begin
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA0_h = 1'b0;
                          streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0(DUALMEM,133)@0 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_ia = $unsigned(busIn_writedata[15:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_ena_NotRstA = ~ (bus_areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_reset0 = bus_areset;
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
        .read_during_write_mode_mixed_ports("OLD_DATA"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("streamtoblock_fft/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000100MHz_mem_x_a_part0.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_dmem (
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_ena_NotRstA),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_reset0),
        .clock0(bus_clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA0_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_csB0_h[0]),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_qB_l0_or0(LOGICAL,135)@2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_qB_l0_or0_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part0_q | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_part1_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reinterp_sel_x(BITSELECT,74)@2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reinterp_sel_x_in = {16'b0000000000000000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_a_qB_l0_or0_q};
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reinterp_sel_x_b = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reinterp_sel_x_in[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reAnd_x(LOGICAL,42)@0 + 1
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reAnd_x_qi = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_addrGE0AndLtLen_x_q & busIn_read;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reAnd_x_delay ( .xin(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reAnd_x_qi), .xout(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reAnd_x_q), .clk(bus_clk), .aclr(bus_areset), .ena(1'b1) );

    // redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reAnd_x_q_2(DELAY,154)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reAnd_x_q_2_q <= '0;
        end
        else
        begin
            redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reAnd_x_q_2_q <= $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reAnd_x_q);
        end
    end

    // bus_selector_opt_lev0_id0(SELECTOR,76)@2
    always @(redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reAnd_x_q_2_q or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reinterp_sel_x_b or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_reAnd_x_q or streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_reinterp_sel_x_b or addr_0_readHit_and_x_q or mm_reg_0_x_q)
    begin
        bus_selector_opt_lev0_id0_q = 32'b0;
        bus_selector_opt_lev0_id0_v = $unsigned(1'b0);
        if (addr_0_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id0_q = mm_reg_0_x_q;
            bus_selector_opt_lev0_id0_v = $unsigned(1'b1);
        end
        if (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_reAnd_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id0_q = {16'b0000000000000000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_reinterp_sel_x_b};
            bus_selector_opt_lev0_id0_v = $unsigned(1'b1);
        end
        if (redist1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reAnd_x_q_2_q == 1'b1)
        begin
            bus_selector_opt_lev0_id0_q = {16'b0000000000000000, streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_reinterp_sel_x_b};
            bus_selector_opt_lev0_id0_v = $unsigned(1'b1);
        end
    end

    // bus_selector_opt_lev1_id0(SELECTOR,78)@2 + 1
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            bus_selector_opt_lev1_id0_q <= 32'b0;
            bus_selector_opt_lev1_id0_v <= 1'b0;
        end
        else
        begin
            bus_selector_opt_lev1_id0_q <= {31'b0000000000000000000000000000000, GND_q};
            bus_selector_opt_lev1_id0_v <= $unsigned(1'b0);
            if (addr_7_readHit_and_x_q == 1'b1)
            begin
                bus_selector_opt_lev1_id0_q <= mm_reg_7_x_q;
                bus_selector_opt_lev1_id0_v <= $unsigned(1'b1);
            end
            if (bus_selector_opt_lev0_id1_v == 1'b1)
            begin
                bus_selector_opt_lev1_id0_q <= bus_selector_opt_lev0_id1_q;
                bus_selector_opt_lev1_id0_v <= $unsigned(1'b1);
            end
            if (bus_selector_opt_lev0_id0_v == 1'b1)
            begin
                bus_selector_opt_lev1_id0_q <= bus_selector_opt_lev0_id0_q;
                bus_selector_opt_lev1_id0_v <= $unsigned(1'b1);
            end
        end
    end

    // busOut(BUSOUT,3)@3
    assign busOut_readdatavalid = bus_selector_opt_lev1_id0_v;
    assign busOut_readdata = bus_selector_opt_lev1_id0_q;

    // out_AMMregisterWireData_streamtoblock_fft_DUT_RegField4_x_tpl(GPOUT,15)@2
    assign out_AMMregisterWireData_streamtoblock_fft_DUT_RegField4_x_tpl = mm_reg_7_x_v;

    // out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl(GPOUT,16)@2
    assign out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl = mm_reg_4_x_v;

    // streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_bitsel_x(BITSELECT,58)@2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_bitsel_x_b = mm_reg_5_x_v[0:0];

    // out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl(GPOUT,17)@2
    assign out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_bitsel_x_b;

    // out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl(GPOUT,18)@2
    assign out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl = mm_reg_0_x_v;

    // streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_bitsel_x(BITSELECT,62)@2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_bitsel_x_b = mm_reg_6_x_v[0:0];

    // out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl(GPOUT,19)@2
    assign out_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_bitsel_x_b;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_hi(BITSELECT,93)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_hi_b = in_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl[11:11];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csB1(LOOKUP,96)@0
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_hi_b)
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csB1_h = 1'b1;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_lo(BITSELECT,97)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_lo_in = $unsigned(in_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl[10:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_lo_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_lo_in[10:0]);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1(DUALMEM,100)@0 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_ia = $unsigned(busIn_writedata[15:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_ena_NotRstA = ~ (bus_areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_reset1 = areset;
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
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("streamtoblock_fft/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000e_100MHz_mem_x_part1.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_dmem (
        .clocken1(1'b1),
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_ena_NotRstA),
        .clock0(bus_clk),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_reset1),
        .clock1(clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA1_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csB1_h[0]),
        .wren_b(),
        .rden_a(),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csB0(LOOKUP,95)@0
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_hi_b)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csB0_h = 1'b1;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0(DUALMEM,99)@0 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_ia = $unsigned(busIn_writedata[15:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_addrB_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_ena_NotRstA = ~ (bus_areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_reset1 = areset;
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
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("streamtoblock_fft/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000e_100MHz_mem_x_part0.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_dmem (
        .clocken1(1'b1),
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_ena_NotRstA),
        .clock0(bus_clk),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_reset1),
        .clock1(clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csA0_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_csB0_h[0]),
        .wren_b(),
        .rden_a(),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_qB_l0_or0(LOGICAL,101)@2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_qB_l0_or0_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part0_q | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_part1_q;

    // out_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl(GPOUT,20)@2
    assign out_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_mem_x_qB_l0_or0_q;

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_hi(BITSELECT,110)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_hi_b = in_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl[11:11];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csB1(LOOKUP,113)@0
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_hi_b)
            1'b1 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csB1_h = 1'b1;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_lo(BITSELECT,114)@0
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_lo_in = $unsigned(in_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl[10:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_lo_b = $unsigned(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_lo_in[10:0]);

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1(DUALMEM,117)@0 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_ia = $unsigned(busIn_writedata[15:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_ena_NotRstA = ~ (bus_areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_reset1 = areset;
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
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("streamtoblock_fft/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000le_60MHz_mem_x_part1.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_dmem (
        .clocken1(1'b1),
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_ena_NotRstA),
        .clock0(bus_clk),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_reset1),
        .clock1(clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA1_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csB1_h[0]),
        .wren_b(),
        .rden_a(),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csB0(LOOKUP,112)@0
    always @(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_hi_b)
            1'b0 : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csB0_h = 1'b1;
            default : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0(DUALMEM,116)@0 + 2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_ia = $unsigned(busIn_writedata[15:0]);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_aa = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrA_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_ab = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_addrB_lo_b;
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_ena_NotRstA = ~ (bus_areset);
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_reset1 = areset;
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
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("streamtoblock_fft/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz_streamtoblock_fft_DUT0000le_60MHz_mem_x_part0.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_dmem (
        .clocken1(1'b1),
        .clocken0(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_ena_NotRstA),
        .clock0(bus_clk),
        .sclr(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_reset1),
        .clock1(clk),
        .address_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_aa),
        .data_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_ia),
        .wren_a(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csA0_e[0]),
        .address_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_ab),
        .q_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_iq),
        .rden_b(streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_csB0_h[0]),
        .wren_b(),
        .rden_a(),
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
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_iq[15:0];

    // streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_qB_l0_or0(LOGICAL,118)@2
    assign streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_qB_l0_or0_q = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part0_q | streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_part1_q;

    // out_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl(GPOUT,21)@2
    assign out_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl = streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_mem_x_qB_l0_or0_q;

endmodule
