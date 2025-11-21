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

// SystemVerilog created from ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO
// SystemVerilog created on Thu Jan  9 15:36:33 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [31:0] xIn_p_0,
    input wire [31:0] xIn_p_1,
    input wire [31:0] xIn_p_2,
    input wire [31:0] xIn_p_3,
    input wire [0:0] xIn_s_0,
    input wire [0:0] xIn_s_1,
    input wire [0:0] xIn_s_2,
    input wire [0:0] xIn_s_3,
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] ncoOut_v,
    output wire [7:0] ncoOut_c,
    output wire [15:0] sinOut_0,
    output wire [15:0] sinOut_1,
    output wire [15:0] sinOut_2,
    output wire [15:0] sinOut_3,
    output wire [15:0] cosOut_0,
    output wire [15:0] cosOut_1,
    output wire [15:0] cosOut_2,
    output wire [15:0] cosOut_3,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [0:0] d_xIn_s_3_11_q;
    reg [0:0] d_xIn_s_2_11_q;
    reg [0:0] d_xIn_s_1_11_q;
    reg [0:0] d_xIn_s_0_11_q;
    reg [0:0] d_xIn_v_11_q;
    reg [0:0] d_xIn_v_27_q;
    reg [0:0] d_busIn_read_13_q;
    reg [0:0] d_busIn_read_13_delay_0;
    reg [0:0] d_busIn_read_13_delay_1;
    reg [31:0] d_busIn_writedata_11_q;
    reg [0:0] u0_phaseIncrRegLookup_0_e;
    wire [0:0] u0_phaseIncrRegLookup_0_c;
    wire [31:0] u0_phaseIncrReg_p0_a;
    wire [0:0] u0_phaseIncrReg_p0_b;
    reg [31:0] u0_phaseIncrReg_p0_v;
    reg [0:0] u0_phaseIncrRegLookup_1_e;
    wire [0:0] u0_phaseIncrRegLookup_1_c;
    wire [31:0] u0_phaseIncrReg_p1_a;
    wire [0:0] u0_phaseIncrReg_p1_b;
    reg [1:0] u0_phaseIncrReg_p1_v;
    reg [0:0] u1_phaseIncrRegLookup_0_e;
    wire [0:0] u1_phaseIncrRegLookup_0_c;
    wire [31:0] u1_phaseIncrReg_p0_a;
    wire [0:0] u1_phaseIncrReg_p0_b;
    reg [31:0] u1_phaseIncrReg_p0_v;
    reg [0:0] u1_phaseIncrRegLookup_1_e;
    wire [0:0] u1_phaseIncrRegLookup_1_c;
    wire [31:0] u1_phaseIncrReg_p1_a;
    wire [0:0] u1_phaseIncrReg_p1_b;
    reg [1:0] u1_phaseIncrReg_p1_v;
    reg [0:0] u2_phaseIncrRegLookup_0_e;
    wire [0:0] u2_phaseIncrRegLookup_0_c;
    wire [31:0] u2_phaseIncrReg_p0_a;
    wire [0:0] u2_phaseIncrReg_p0_b;
    reg [31:0] u2_phaseIncrReg_p0_v;
    reg [0:0] u2_phaseIncrRegLookup_1_e;
    wire [0:0] u2_phaseIncrRegLookup_1_c;
    wire [31:0] u2_phaseIncrReg_p1_a;
    wire [0:0] u2_phaseIncrReg_p1_b;
    reg [1:0] u2_phaseIncrReg_p1_v;
    reg [0:0] u3_phaseIncrRegLookup_0_e;
    wire [0:0] u3_phaseIncrRegLookup_0_c;
    wire [31:0] u3_phaseIncrReg_p0_a;
    wire [0:0] u3_phaseIncrReg_p0_b;
    reg [31:0] u3_phaseIncrReg_p0_v;
    reg [0:0] u3_phaseIncrRegLookup_1_e;
    wire [0:0] u3_phaseIncrRegLookup_1_c;
    wire [31:0] u3_phaseIncrReg_p1_a;
    wire [0:0] u3_phaseIncrReg_p1_b;
    reg [1:0] u3_phaseIncrReg_p1_v;
    reg [2:0] readbackMemLookup_q;
    reg [0:0] readbackMemLookup_h;
    reg [0:0] readbackMemLookup_e;
    wire [0:0] readbackMemLookup_c;
    reg [0:0] d_readbackMemLookup_h_13_q;
    reg [0:0] d_readbackMemLookup_h_13_delay_0;
    wire readbackMem_reset0;
    wire readbackMem_ena_NotRstA;
    wire [31:0] readbackMem_ia;
    wire [2:0] readbackMem_aa;
    wire [2:0] readbackMem_ab;
    wire [31:0] readbackMem_iq;
    wire [31:0] readbackMem_q;
    reg [2:0] d_u0_octantBitSelect_b_24_q;
    reg [2:0] d_u0_octantBitSelect_b_25_q;
    reg [0:0] u0_addnsubConst_q;
    reg [0:0] d_u0_addnsubConst_q_14_q;
    wire u0_sinTable_reset0;
    wire u0_sinTable_ena_NotRstA;
    wire [15:0] u0_sinTable_ia;
    wire [7:0] u0_sinTable_aa;
    wire [7:0] u0_sinTable_ab;
    wire [15:0] u0_sinTable_ir;
    wire [15:0] u0_sinTable_r;
    wire u0_cosTable_reset0;
    wire u0_cosTable_ena_NotRstA;
    wire [15:0] u0_cosTable_ia;
    wire [7:0] u0_cosTable_aa;
    wire [7:0] u0_cosTable_ab;
    wire [15:0] u0_cosTable_ir;
    wire [15:0] u0_cosTable_r;
    wire [17:0] u0_sin_pi_over_4_q;
    wire [17:0] u0_sinAdd_a;
    wire [17:0] u0_sinAdd_b;
    wire [17:0] u0_sinAdd_i;
    wire [17:0] u0_sinAdd_a1;
    wire [17:0] u0_sinAdd_b1;
    logic [17:0] u0_sinAdd_o;
    wire [17:0] u0_sinAdd_q;
    wire [17:0] u0_cosSub_a;
    wire [17:0] u0_cosSub_b;
    wire [17:0] u0_cosSub_i;
    wire [17:0] u0_cosSub_a1;
    wire [17:0] u0_cosSub_b1;
    logic [17:0] u0_cosSub_o;
    wire [17:0] u0_cosSub_q;
    reg [0:0] u0_doSwap_q;
    reg [0:0] u0_doSinInvert_q;
    reg [0:0] u0_doCosInvert_q;
    wire [0:0] u0_sinSwapMux_s;
    reg [16:0] u0_sinSwapMux_q;
    wire [0:0] u0_cosSwapMux_s;
    reg [16:0] u0_cosSwapMux_q;
    wire [15:0] u0_sinInvert_a;
    wire [15:0] u0_sinInvert_b;
    wire [15:0] u0_sinInvert_i;
    wire [15:0] u0_sinInvert_a1;
    wire [15:0] u0_sinInvert_b1;
    logic [15:0] u0_sinInvert_o;
    wire [15:0] u0_sinInvert_q;
    wire [15:0] u0_cosInvert_a;
    wire [15:0] u0_cosInvert_b;
    wire [15:0] u0_cosInvert_i;
    wire [15:0] u0_cosInvert_a1;
    wire [15:0] u0_cosInvert_b1;
    logic [15:0] u0_cosInvert_o;
    wire [15:0] u0_cosInvert_q;
    reg [2:0] d_u1_octantBitSelect_b_24_q;
    reg [2:0] d_u1_octantBitSelect_b_25_q;
    reg [0:0] u1_addnsubConst_q;
    reg [0:0] d_u1_addnsubConst_q_14_q;
    wire u1_sinTable_reset0;
    wire u1_sinTable_ena_NotRstA;
    wire [15:0] u1_sinTable_ia;
    wire [7:0] u1_sinTable_aa;
    wire [7:0] u1_sinTable_ab;
    wire [15:0] u1_sinTable_ir;
    wire [15:0] u1_sinTable_r;
    wire u1_cosTable_reset0;
    wire u1_cosTable_ena_NotRstA;
    wire [15:0] u1_cosTable_ia;
    wire [7:0] u1_cosTable_aa;
    wire [7:0] u1_cosTable_ab;
    wire [15:0] u1_cosTable_ir;
    wire [15:0] u1_cosTable_r;
    wire [17:0] u1_sinAdd_a;
    wire [17:0] u1_sinAdd_b;
    wire [17:0] u1_sinAdd_i;
    wire [17:0] u1_sinAdd_a1;
    wire [17:0] u1_sinAdd_b1;
    logic [17:0] u1_sinAdd_o;
    wire [17:0] u1_sinAdd_q;
    wire [17:0] u1_cosSub_a;
    wire [17:0] u1_cosSub_b;
    wire [17:0] u1_cosSub_i;
    wire [17:0] u1_cosSub_a1;
    wire [17:0] u1_cosSub_b1;
    logic [17:0] u1_cosSub_o;
    wire [17:0] u1_cosSub_q;
    reg [0:0] u1_doSwap_q;
    reg [0:0] u1_doSinInvert_q;
    reg [0:0] u1_doCosInvert_q;
    wire [0:0] u1_sinSwapMux_s;
    reg [16:0] u1_sinSwapMux_q;
    wire [0:0] u1_cosSwapMux_s;
    reg [16:0] u1_cosSwapMux_q;
    wire [15:0] u1_sinInvert_a;
    wire [15:0] u1_sinInvert_b;
    wire [15:0] u1_sinInvert_i;
    wire [15:0] u1_sinInvert_a1;
    wire [15:0] u1_sinInvert_b1;
    logic [15:0] u1_sinInvert_o;
    wire [15:0] u1_sinInvert_q;
    wire [15:0] u1_cosInvert_a;
    wire [15:0] u1_cosInvert_b;
    wire [15:0] u1_cosInvert_i;
    wire [15:0] u1_cosInvert_a1;
    wire [15:0] u1_cosInvert_b1;
    logic [15:0] u1_cosInvert_o;
    wire [15:0] u1_cosInvert_q;
    reg [2:0] d_u2_octantBitSelect_b_24_q;
    reg [2:0] d_u2_octantBitSelect_b_25_q;
    reg [0:0] u2_addnsubConst_q;
    reg [0:0] d_u2_addnsubConst_q_14_q;
    wire u2_sinTable_reset0;
    wire u2_sinTable_ena_NotRstA;
    wire [15:0] u2_sinTable_ia;
    wire [7:0] u2_sinTable_aa;
    wire [7:0] u2_sinTable_ab;
    wire [15:0] u2_sinTable_ir;
    wire [15:0] u2_sinTable_r;
    wire u2_cosTable_reset0;
    wire u2_cosTable_ena_NotRstA;
    wire [15:0] u2_cosTable_ia;
    wire [7:0] u2_cosTable_aa;
    wire [7:0] u2_cosTable_ab;
    wire [15:0] u2_cosTable_ir;
    wire [15:0] u2_cosTable_r;
    wire [17:0] u2_sinAdd_a;
    wire [17:0] u2_sinAdd_b;
    wire [17:0] u2_sinAdd_i;
    wire [17:0] u2_sinAdd_a1;
    wire [17:0] u2_sinAdd_b1;
    logic [17:0] u2_sinAdd_o;
    wire [17:0] u2_sinAdd_q;
    wire [17:0] u2_cosSub_a;
    wire [17:0] u2_cosSub_b;
    wire [17:0] u2_cosSub_i;
    wire [17:0] u2_cosSub_a1;
    wire [17:0] u2_cosSub_b1;
    logic [17:0] u2_cosSub_o;
    wire [17:0] u2_cosSub_q;
    reg [0:0] u2_doSwap_q;
    reg [0:0] u2_doSinInvert_q;
    reg [0:0] u2_doCosInvert_q;
    wire [0:0] u2_sinSwapMux_s;
    reg [16:0] u2_sinSwapMux_q;
    wire [0:0] u2_cosSwapMux_s;
    reg [16:0] u2_cosSwapMux_q;
    wire [15:0] u2_sinInvert_a;
    wire [15:0] u2_sinInvert_b;
    wire [15:0] u2_sinInvert_i;
    wire [15:0] u2_sinInvert_a1;
    wire [15:0] u2_sinInvert_b1;
    logic [15:0] u2_sinInvert_o;
    wire [15:0] u2_sinInvert_q;
    wire [15:0] u2_cosInvert_a;
    wire [15:0] u2_cosInvert_b;
    wire [15:0] u2_cosInvert_i;
    wire [15:0] u2_cosInvert_a1;
    wire [15:0] u2_cosInvert_b1;
    logic [15:0] u2_cosInvert_o;
    wire [15:0] u2_cosInvert_q;
    reg [2:0] d_u3_octantBitSelect_b_24_q;
    reg [2:0] d_u3_octantBitSelect_b_25_q;
    reg [0:0] u3_addnsubConst_q;
    reg [0:0] d_u3_addnsubConst_q_14_q;
    wire u3_sinTable_reset0;
    wire u3_sinTable_ena_NotRstA;
    wire [15:0] u3_sinTable_ia;
    wire [7:0] u3_sinTable_aa;
    wire [7:0] u3_sinTable_ab;
    wire [15:0] u3_sinTable_ir;
    wire [15:0] u3_sinTable_r;
    wire u3_cosTable_reset0;
    wire u3_cosTable_ena_NotRstA;
    wire [15:0] u3_cosTable_ia;
    wire [7:0] u3_cosTable_aa;
    wire [7:0] u3_cosTable_ab;
    wire [15:0] u3_cosTable_ir;
    wire [15:0] u3_cosTable_r;
    wire [17:0] u3_sinAdd_a;
    wire [17:0] u3_sinAdd_b;
    wire [17:0] u3_sinAdd_i;
    wire [17:0] u3_sinAdd_a1;
    wire [17:0] u3_sinAdd_b1;
    logic [17:0] u3_sinAdd_o;
    wire [17:0] u3_sinAdd_q;
    wire [17:0] u3_cosSub_a;
    wire [17:0] u3_cosSub_b;
    wire [17:0] u3_cosSub_i;
    wire [17:0] u3_cosSub_a1;
    wire [17:0] u3_cosSub_b1;
    logic [17:0] u3_cosSub_o;
    wire [17:0] u3_cosSub_q;
    reg [0:0] u3_doSwap_q;
    reg [0:0] u3_doSinInvert_q;
    reg [0:0] u3_doCosInvert_q;
    wire [0:0] u3_sinSwapMux_s;
    reg [16:0] u3_sinSwapMux_q;
    wire [0:0] u3_cosSwapMux_s;
    reg [16:0] u3_cosSwapMux_q;
    wire [15:0] u3_sinInvert_a;
    wire [15:0] u3_sinInvert_b;
    wire [15:0] u3_sinInvert_i;
    wire [15:0] u3_sinInvert_a1;
    wire [15:0] u3_sinInvert_b1;
    logic [15:0] u3_sinInvert_o;
    wire [15:0] u3_sinInvert_q;
    wire [15:0] u3_cosInvert_a;
    wire [15:0] u3_cosInvert_b;
    wire [15:0] u3_cosInvert_i;
    wire [15:0] u3_cosInvert_a1;
    wire [15:0] u3_cosInvert_b1;
    logic [15:0] u3_cosInvert_o;
    wire [15:0] u3_cosInvert_q;
    wire u0_sinMult_cma_reset;
    wire [15:0] u0_sinMult_cma_a0;
    wire [15:0] u0_sinMult_cma_c0;
    wire [31:0] u0_sinMult_cma_s0;
    wire [31:0] u0_sinMult_cma_qq0;
    reg [31:0] u0_sinMult_cma_q;
    wire u0_sinMult_cma_ena0;
    wire u0_sinMult_cma_ena1;
    wire u0_sinMult_cma_ena2;
    wire u0_cosMult_cma_reset;
    wire [15:0] u0_cosMult_cma_a0;
    wire [15:0] u0_cosMult_cma_c0;
    wire [31:0] u0_cosMult_cma_s0;
    wire [31:0] u0_cosMult_cma_qq0;
    reg [31:0] u0_cosMult_cma_q;
    wire u0_cosMult_cma_ena0;
    wire u0_cosMult_cma_ena1;
    wire u0_cosMult_cma_ena2;
    wire u1_sinMult_cma_reset;
    wire [15:0] u1_sinMult_cma_a0;
    wire [15:0] u1_sinMult_cma_c0;
    wire [31:0] u1_sinMult_cma_s0;
    wire [31:0] u1_sinMult_cma_qq0;
    reg [31:0] u1_sinMult_cma_q;
    wire u1_sinMult_cma_ena0;
    wire u1_sinMult_cma_ena1;
    wire u1_sinMult_cma_ena2;
    wire u1_cosMult_cma_reset;
    wire [15:0] u1_cosMult_cma_a0;
    wire [15:0] u1_cosMult_cma_c0;
    wire [31:0] u1_cosMult_cma_s0;
    wire [31:0] u1_cosMult_cma_qq0;
    reg [31:0] u1_cosMult_cma_q;
    wire u1_cosMult_cma_ena0;
    wire u1_cosMult_cma_ena1;
    wire u1_cosMult_cma_ena2;
    wire u2_sinMult_cma_reset;
    wire [15:0] u2_sinMult_cma_a0;
    wire [15:0] u2_sinMult_cma_c0;
    wire [31:0] u2_sinMult_cma_s0;
    wire [31:0] u2_sinMult_cma_qq0;
    reg [31:0] u2_sinMult_cma_q;
    wire u2_sinMult_cma_ena0;
    wire u2_sinMult_cma_ena1;
    wire u2_sinMult_cma_ena2;
    wire u2_cosMult_cma_reset;
    wire [15:0] u2_cosMult_cma_a0;
    wire [15:0] u2_cosMult_cma_c0;
    wire [31:0] u2_cosMult_cma_s0;
    wire [31:0] u2_cosMult_cma_qq0;
    reg [31:0] u2_cosMult_cma_q;
    wire u2_cosMult_cma_ena0;
    wire u2_cosMult_cma_ena1;
    wire u2_cosMult_cma_ena2;
    wire u3_sinMult_cma_reset;
    wire [15:0] u3_sinMult_cma_a0;
    wire [15:0] u3_sinMult_cma_c0;
    wire [31:0] u3_sinMult_cma_s0;
    wire [31:0] u3_sinMult_cma_qq0;
    reg [31:0] u3_sinMult_cma_q;
    wire u3_sinMult_cma_ena0;
    wire u3_sinMult_cma_ena1;
    wire u3_sinMult_cma_ena2;
    wire u3_cosMult_cma_reset;
    wire [15:0] u3_cosMult_cma_a0;
    wire [15:0] u3_cosMult_cma_c0;
    wire [31:0] u3_cosMult_cma_s0;
    wire [31:0] u3_cosMult_cma_qq0;
    reg [31:0] u3_cosMult_cma_q;
    wire u3_cosMult_cma_ena0;
    wire u3_cosMult_cma_ena1;
    wire u3_cosMult_cma_ena2;
    reg [11:0] d_u0_accumAdd_b1_BitSelect_for_v_c_11_q;
    wire [20:0] u0_accumAdd_b1_p1_of_2_a;
    wire [20:0] u0_accumAdd_b1_p1_of_2_b;
    wire [20:0] u0_accumAdd_b1_p1_of_2_i;
    wire [20:0] u0_accumAdd_b1_p1_of_2_a1;
    wire [20:0] u0_accumAdd_b1_p1_of_2_b1;
    logic [20:0] u0_accumAdd_b1_p1_of_2_o;
    wire [0:0] u0_accumAdd_b1_p1_of_2_c;
    wire [19:0] u0_accumAdd_b1_p1_of_2_q;
    reg [19:0] d_u0_accumAdd_b1_p1_of_2_q_12_q;
    reg [19:0] d_u0_accumAdd_b1_p1_of_2_q_13_q;
    wire [13:0] u0_accumAdd_b1_p2_of_2_a;
    wire [13:0] u0_accumAdd_b1_p2_of_2_b;
    wire [13:0] u0_accumAdd_b1_p2_of_2_i;
    wire [13:0] u0_accumAdd_b1_p2_of_2_a1;
    wire [13:0] u0_accumAdd_b1_p2_of_2_b1;
    logic [13:0] u0_accumAdd_b1_p2_of_2_o;
    wire [0:0] u0_accumAdd_b1_p2_of_2_cin;
    wire [11:0] u0_accumAdd_b1_p2_of_2_q;
    reg [11:0] d_u0_accumAdd_b1_p2_of_2_q_14_q;
    reg [11:0] d_u0_accumAdd_b1_p2_of_2_q_14_delay_0;
    wire [1:0] u0_rangeAddSub_UpperBits_for_b_q;
    wire [20:0] u0_rangeAddSub_p1_of_2_a;
    wire [20:0] u0_rangeAddSub_p1_of_2_b;
    logic [20:0] u0_rangeAddSub_p1_of_2_o;
    wire [0:0] u0_rangeAddSub_p1_of_2_s;
    wire [0:0] u0_rangeAddSub_p1_of_2_c;
    wire [19:0] u0_rangeAddSub_p1_of_2_q;
    reg [19:0] d_u0_rangeAddSub_p1_of_2_q_15_q;
    wire [15:0] u0_rangeAddSub_p2_of_2_a;
    wire [15:0] u0_rangeAddSub_p2_of_2_b;
    logic [15:0] u0_rangeAddSub_p2_of_2_o;
    wire [0:0] u0_rangeAddSub_p2_of_2_cin;
    wire [0:0] u0_rangeAddSub_p2_of_2_s;
    wire [13:0] u0_rangeAddSub_p2_of_2_q;
    wire [2:0] u0_cm1_UpperBits_for_b_q;
    reg [13:0] d_u0_cm1_BitSelect_for_a_c_16_q;
    reg [13:0] d_u0_cm1_BitSelect_for_b_c_16_q;
    wire [20:0] u0_cm1_p1_of_2_a;
    wire [20:0] u0_cm1_p1_of_2_b;
    logic [20:0] u0_cm1_p1_of_2_o;
    wire [0:0] u0_cm1_p1_of_2_c;
    wire [19:0] u0_cm1_p1_of_2_q;
    wire [15:0] u0_cm1_p2_of_2_a;
    wire [15:0] u0_cm1_p2_of_2_b;
    logic [15:0] u0_cm1_p2_of_2_o;
    wire [0:0] u0_cm1_p2_of_2_cin;
    wire [13:0] u0_cm1_p2_of_2_q;
    wire [3:0] u0_cm2_UpperBits_for_b_q;
    reg [8:0] d_u0_cm2_BitSelect_for_a_c_16_q;
    reg [8:0] d_u0_cm2_BitSelect_for_b_c_16_q;
    wire [20:0] u0_cm2_p1_of_2_a;
    wire [20:0] u0_cm2_p1_of_2_b;
    logic [20:0] u0_cm2_p1_of_2_o;
    wire [0:0] u0_cm2_p1_of_2_c;
    wire [19:0] u0_cm2_p1_of_2_q;
    wire [10:0] u0_cm2_p2_of_2_a;
    wire [10:0] u0_cm2_p2_of_2_b;
    logic [10:0] u0_cm2_p2_of_2_o;
    wire [0:0] u0_cm2_p2_of_2_cin;
    wire [8:0] u0_cm2_p2_of_2_q;
    wire [5:0] u0_cm3_UpperBits_for_b_q;
    wire [20:0] u0_cm3_p1_of_2_a;
    wire [20:0] u0_cm3_p1_of_2_b;
    logic [20:0] u0_cm3_p1_of_2_o;
    wire [0:0] u0_cm3_p1_of_2_c;
    wire [19:0] u0_cm3_p1_of_2_q;
    reg [19:0] d_u0_cm3_p1_of_2_q_18_q;
    wire [16:0] u0_cm3_p2_of_2_a;
    wire [16:0] u0_cm3_p2_of_2_b;
    logic [16:0] u0_cm3_p2_of_2_o;
    wire [0:0] u0_cm3_p2_of_2_cin;
    wire [14:0] u0_cm3_p2_of_2_q;
    reg [11:0] d_u1_accumAdd_b1_BitSelect_for_v_c_11_q;
    wire [20:0] u1_accumAdd_b1_p1_of_2_a;
    wire [20:0] u1_accumAdd_b1_p1_of_2_b;
    wire [20:0] u1_accumAdd_b1_p1_of_2_i;
    wire [20:0] u1_accumAdd_b1_p1_of_2_a1;
    wire [20:0] u1_accumAdd_b1_p1_of_2_b1;
    logic [20:0] u1_accumAdd_b1_p1_of_2_o;
    wire [0:0] u1_accumAdd_b1_p1_of_2_c;
    wire [19:0] u1_accumAdd_b1_p1_of_2_q;
    reg [19:0] d_u1_accumAdd_b1_p1_of_2_q_12_q;
    reg [19:0] d_u1_accumAdd_b1_p1_of_2_q_13_q;
    wire [13:0] u1_accumAdd_b1_p2_of_2_a;
    wire [13:0] u1_accumAdd_b1_p2_of_2_b;
    wire [13:0] u1_accumAdd_b1_p2_of_2_i;
    wire [13:0] u1_accumAdd_b1_p2_of_2_a1;
    wire [13:0] u1_accumAdd_b1_p2_of_2_b1;
    logic [13:0] u1_accumAdd_b1_p2_of_2_o;
    wire [0:0] u1_accumAdd_b1_p2_of_2_cin;
    wire [11:0] u1_accumAdd_b1_p2_of_2_q;
    reg [11:0] d_u1_accumAdd_b1_p2_of_2_q_14_q;
    reg [11:0] d_u1_accumAdd_b1_p2_of_2_q_14_delay_0;
    wire [20:0] u1_rangeAddSub_p1_of_2_a;
    wire [20:0] u1_rangeAddSub_p1_of_2_b;
    logic [20:0] u1_rangeAddSub_p1_of_2_o;
    wire [0:0] u1_rangeAddSub_p1_of_2_s;
    wire [0:0] u1_rangeAddSub_p1_of_2_c;
    wire [19:0] u1_rangeAddSub_p1_of_2_q;
    reg [19:0] d_u1_rangeAddSub_p1_of_2_q_15_q;
    wire [15:0] u1_rangeAddSub_p2_of_2_a;
    wire [15:0] u1_rangeAddSub_p2_of_2_b;
    logic [15:0] u1_rangeAddSub_p2_of_2_o;
    wire [0:0] u1_rangeAddSub_p2_of_2_cin;
    wire [0:0] u1_rangeAddSub_p2_of_2_s;
    wire [13:0] u1_rangeAddSub_p2_of_2_q;
    reg [13:0] d_u1_cm1_BitSelect_for_a_c_16_q;
    reg [13:0] d_u1_cm1_BitSelect_for_b_c_16_q;
    wire [20:0] u1_cm1_p1_of_2_a;
    wire [20:0] u1_cm1_p1_of_2_b;
    logic [20:0] u1_cm1_p1_of_2_o;
    wire [0:0] u1_cm1_p1_of_2_c;
    wire [19:0] u1_cm1_p1_of_2_q;
    wire [15:0] u1_cm1_p2_of_2_a;
    wire [15:0] u1_cm1_p2_of_2_b;
    logic [15:0] u1_cm1_p2_of_2_o;
    wire [0:0] u1_cm1_p2_of_2_cin;
    wire [13:0] u1_cm1_p2_of_2_q;
    reg [8:0] d_u1_cm2_BitSelect_for_a_c_16_q;
    reg [8:0] d_u1_cm2_BitSelect_for_b_c_16_q;
    wire [20:0] u1_cm2_p1_of_2_a;
    wire [20:0] u1_cm2_p1_of_2_b;
    logic [20:0] u1_cm2_p1_of_2_o;
    wire [0:0] u1_cm2_p1_of_2_c;
    wire [19:0] u1_cm2_p1_of_2_q;
    wire [10:0] u1_cm2_p2_of_2_a;
    wire [10:0] u1_cm2_p2_of_2_b;
    logic [10:0] u1_cm2_p2_of_2_o;
    wire [0:0] u1_cm2_p2_of_2_cin;
    wire [8:0] u1_cm2_p2_of_2_q;
    wire [20:0] u1_cm3_p1_of_2_a;
    wire [20:0] u1_cm3_p1_of_2_b;
    logic [20:0] u1_cm3_p1_of_2_o;
    wire [0:0] u1_cm3_p1_of_2_c;
    wire [19:0] u1_cm3_p1_of_2_q;
    reg [19:0] d_u1_cm3_p1_of_2_q_18_q;
    wire [16:0] u1_cm3_p2_of_2_a;
    wire [16:0] u1_cm3_p2_of_2_b;
    logic [16:0] u1_cm3_p2_of_2_o;
    wire [0:0] u1_cm3_p2_of_2_cin;
    wire [14:0] u1_cm3_p2_of_2_q;
    reg [11:0] d_u2_accumAdd_b1_BitSelect_for_v_c_11_q;
    wire [20:0] u2_accumAdd_b1_p1_of_2_a;
    wire [20:0] u2_accumAdd_b1_p1_of_2_b;
    wire [20:0] u2_accumAdd_b1_p1_of_2_i;
    wire [20:0] u2_accumAdd_b1_p1_of_2_a1;
    wire [20:0] u2_accumAdd_b1_p1_of_2_b1;
    logic [20:0] u2_accumAdd_b1_p1_of_2_o;
    wire [0:0] u2_accumAdd_b1_p1_of_2_c;
    wire [19:0] u2_accumAdd_b1_p1_of_2_q;
    reg [19:0] d_u2_accumAdd_b1_p1_of_2_q_12_q;
    reg [19:0] d_u2_accumAdd_b1_p1_of_2_q_13_q;
    wire [13:0] u2_accumAdd_b1_p2_of_2_a;
    wire [13:0] u2_accumAdd_b1_p2_of_2_b;
    wire [13:0] u2_accumAdd_b1_p2_of_2_i;
    wire [13:0] u2_accumAdd_b1_p2_of_2_a1;
    wire [13:0] u2_accumAdd_b1_p2_of_2_b1;
    logic [13:0] u2_accumAdd_b1_p2_of_2_o;
    wire [0:0] u2_accumAdd_b1_p2_of_2_cin;
    wire [11:0] u2_accumAdd_b1_p2_of_2_q;
    reg [11:0] d_u2_accumAdd_b1_p2_of_2_q_14_q;
    reg [11:0] d_u2_accumAdd_b1_p2_of_2_q_14_delay_0;
    wire [20:0] u2_rangeAddSub_p1_of_2_a;
    wire [20:0] u2_rangeAddSub_p1_of_2_b;
    logic [20:0] u2_rangeAddSub_p1_of_2_o;
    wire [0:0] u2_rangeAddSub_p1_of_2_s;
    wire [0:0] u2_rangeAddSub_p1_of_2_c;
    wire [19:0] u2_rangeAddSub_p1_of_2_q;
    reg [19:0] d_u2_rangeAddSub_p1_of_2_q_15_q;
    wire [15:0] u2_rangeAddSub_p2_of_2_a;
    wire [15:0] u2_rangeAddSub_p2_of_2_b;
    logic [15:0] u2_rangeAddSub_p2_of_2_o;
    wire [0:0] u2_rangeAddSub_p2_of_2_cin;
    wire [0:0] u2_rangeAddSub_p2_of_2_s;
    wire [13:0] u2_rangeAddSub_p2_of_2_q;
    reg [13:0] d_u2_cm1_BitSelect_for_a_c_16_q;
    reg [13:0] d_u2_cm1_BitSelect_for_b_c_16_q;
    wire [20:0] u2_cm1_p1_of_2_a;
    wire [20:0] u2_cm1_p1_of_2_b;
    logic [20:0] u2_cm1_p1_of_2_o;
    wire [0:0] u2_cm1_p1_of_2_c;
    wire [19:0] u2_cm1_p1_of_2_q;
    wire [15:0] u2_cm1_p2_of_2_a;
    wire [15:0] u2_cm1_p2_of_2_b;
    logic [15:0] u2_cm1_p2_of_2_o;
    wire [0:0] u2_cm1_p2_of_2_cin;
    wire [13:0] u2_cm1_p2_of_2_q;
    reg [8:0] d_u2_cm2_BitSelect_for_a_c_16_q;
    reg [8:0] d_u2_cm2_BitSelect_for_b_c_16_q;
    wire [20:0] u2_cm2_p1_of_2_a;
    wire [20:0] u2_cm2_p1_of_2_b;
    logic [20:0] u2_cm2_p1_of_2_o;
    wire [0:0] u2_cm2_p1_of_2_c;
    wire [19:0] u2_cm2_p1_of_2_q;
    wire [10:0] u2_cm2_p2_of_2_a;
    wire [10:0] u2_cm2_p2_of_2_b;
    logic [10:0] u2_cm2_p2_of_2_o;
    wire [0:0] u2_cm2_p2_of_2_cin;
    wire [8:0] u2_cm2_p2_of_2_q;
    wire [20:0] u2_cm3_p1_of_2_a;
    wire [20:0] u2_cm3_p1_of_2_b;
    logic [20:0] u2_cm3_p1_of_2_o;
    wire [0:0] u2_cm3_p1_of_2_c;
    wire [19:0] u2_cm3_p1_of_2_q;
    reg [19:0] d_u2_cm3_p1_of_2_q_18_q;
    wire [16:0] u2_cm3_p2_of_2_a;
    wire [16:0] u2_cm3_p2_of_2_b;
    logic [16:0] u2_cm3_p2_of_2_o;
    wire [0:0] u2_cm3_p2_of_2_cin;
    wire [14:0] u2_cm3_p2_of_2_q;
    reg [11:0] d_u3_accumAdd_b1_BitSelect_for_v_c_11_q;
    wire [20:0] u3_accumAdd_b1_p1_of_2_a;
    wire [20:0] u3_accumAdd_b1_p1_of_2_b;
    wire [20:0] u3_accumAdd_b1_p1_of_2_i;
    wire [20:0] u3_accumAdd_b1_p1_of_2_a1;
    wire [20:0] u3_accumAdd_b1_p1_of_2_b1;
    logic [20:0] u3_accumAdd_b1_p1_of_2_o;
    wire [0:0] u3_accumAdd_b1_p1_of_2_c;
    wire [19:0] u3_accumAdd_b1_p1_of_2_q;
    reg [19:0] d_u3_accumAdd_b1_p1_of_2_q_12_q;
    reg [19:0] d_u3_accumAdd_b1_p1_of_2_q_13_q;
    wire [13:0] u3_accumAdd_b1_p2_of_2_a;
    wire [13:0] u3_accumAdd_b1_p2_of_2_b;
    wire [13:0] u3_accumAdd_b1_p2_of_2_i;
    wire [13:0] u3_accumAdd_b1_p2_of_2_a1;
    wire [13:0] u3_accumAdd_b1_p2_of_2_b1;
    logic [13:0] u3_accumAdd_b1_p2_of_2_o;
    wire [0:0] u3_accumAdd_b1_p2_of_2_cin;
    wire [11:0] u3_accumAdd_b1_p2_of_2_q;
    reg [11:0] d_u3_accumAdd_b1_p2_of_2_q_14_q;
    reg [11:0] d_u3_accumAdd_b1_p2_of_2_q_14_delay_0;
    wire [20:0] u3_rangeAddSub_p1_of_2_a;
    wire [20:0] u3_rangeAddSub_p1_of_2_b;
    logic [20:0] u3_rangeAddSub_p1_of_2_o;
    wire [0:0] u3_rangeAddSub_p1_of_2_s;
    wire [0:0] u3_rangeAddSub_p1_of_2_c;
    wire [19:0] u3_rangeAddSub_p1_of_2_q;
    reg [19:0] d_u3_rangeAddSub_p1_of_2_q_15_q;
    wire [15:0] u3_rangeAddSub_p2_of_2_a;
    wire [15:0] u3_rangeAddSub_p2_of_2_b;
    logic [15:0] u3_rangeAddSub_p2_of_2_o;
    wire [0:0] u3_rangeAddSub_p2_of_2_cin;
    wire [0:0] u3_rangeAddSub_p2_of_2_s;
    wire [13:0] u3_rangeAddSub_p2_of_2_q;
    reg [13:0] d_u3_cm1_BitSelect_for_a_c_16_q;
    reg [13:0] d_u3_cm1_BitSelect_for_b_c_16_q;
    wire [20:0] u3_cm1_p1_of_2_a;
    wire [20:0] u3_cm1_p1_of_2_b;
    logic [20:0] u3_cm1_p1_of_2_o;
    wire [0:0] u3_cm1_p1_of_2_c;
    wire [19:0] u3_cm1_p1_of_2_q;
    wire [15:0] u3_cm1_p2_of_2_a;
    wire [15:0] u3_cm1_p2_of_2_b;
    logic [15:0] u3_cm1_p2_of_2_o;
    wire [0:0] u3_cm1_p2_of_2_cin;
    wire [13:0] u3_cm1_p2_of_2_q;
    reg [8:0] d_u3_cm2_BitSelect_for_a_c_16_q;
    reg [8:0] d_u3_cm2_BitSelect_for_b_c_16_q;
    wire [20:0] u3_cm2_p1_of_2_a;
    wire [20:0] u3_cm2_p1_of_2_b;
    logic [20:0] u3_cm2_p1_of_2_o;
    wire [0:0] u3_cm2_p1_of_2_c;
    wire [19:0] u3_cm2_p1_of_2_q;
    wire [10:0] u3_cm2_p2_of_2_a;
    wire [10:0] u3_cm2_p2_of_2_b;
    logic [10:0] u3_cm2_p2_of_2_o;
    wire [0:0] u3_cm2_p2_of_2_cin;
    wire [8:0] u3_cm2_p2_of_2_q;
    wire [20:0] u3_cm3_p1_of_2_a;
    wire [20:0] u3_cm3_p1_of_2_b;
    logic [20:0] u3_cm3_p1_of_2_o;
    wire [0:0] u3_cm3_p1_of_2_c;
    wire [19:0] u3_cm3_p1_of_2_q;
    reg [19:0] d_u3_cm3_p1_of_2_q_18_q;
    wire [16:0] u3_cm3_p2_of_2_a;
    wire [16:0] u3_cm3_p2_of_2_b;
    logic [16:0] u3_cm3_p2_of_2_o;
    wire [0:0] u3_cm3_p2_of_2_cin;
    wire [14:0] u3_cm3_p2_of_2_q;
    wire [1:0] u0_roundedSin_bias_q;
    wire [19:0] u0_roundedSin_add_a;
    wire [19:0] u0_roundedSin_add_b;
    logic [19:0] u0_roundedSin_add_o;
    wire [18:0] u0_roundedSin_add_q;
    wire [19:0] u0_roundedCos_add_a;
    wire [19:0] u0_roundedCos_add_b;
    logic [19:0] u0_roundedCos_add_o;
    wire [18:0] u0_roundedCos_add_q;
    wire [19:0] u1_roundedSin_add_a;
    wire [19:0] u1_roundedSin_add_b;
    logic [19:0] u1_roundedSin_add_o;
    wire [18:0] u1_roundedSin_add_q;
    wire [19:0] u1_roundedCos_add_a;
    wire [19:0] u1_roundedCos_add_b;
    logic [19:0] u1_roundedCos_add_o;
    wire [18:0] u1_roundedCos_add_q;
    wire [19:0] u2_roundedSin_add_a;
    wire [19:0] u2_roundedSin_add_b;
    logic [19:0] u2_roundedSin_add_o;
    wire [18:0] u2_roundedSin_add_q;
    wire [19:0] u2_roundedCos_add_a;
    wire [19:0] u2_roundedCos_add_b;
    logic [19:0] u2_roundedCos_add_o;
    wire [18:0] u2_roundedCos_add_q;
    wire [19:0] u3_roundedSin_add_a;
    wire [19:0] u3_roundedSin_add_b;
    logic [19:0] u3_roundedSin_add_o;
    wire [18:0] u3_roundedSin_add_q;
    wire [19:0] u3_roundedCos_add_a;
    wire [19:0] u3_roundedCos_add_b;
    logic [19:0] u3_roundedCos_add_o;
    wire [18:0] u3_roundedCos_add_q;
    reg [11:0] d_u0_invertSin_bit_select_merged_e_11_q;
    reg [0:0] d_u0_invertSin_bit_select_merged_c_25_q;
    reg [0:0] d_u0_invertSin_bit_select_merged_b_25_q;
    reg [11:0] d_u1_invertSin_bit_select_merged_e_11_q;
    reg [0:0] d_u1_invertSin_bit_select_merged_c_25_q;
    reg [0:0] d_u1_invertSin_bit_select_merged_b_25_q;
    reg [11:0] d_u2_invertSin_bit_select_merged_e_11_q;
    reg [0:0] d_u2_invertSin_bit_select_merged_c_25_q;
    reg [0:0] d_u2_invertSin_bit_select_merged_b_25_q;
    reg [11:0] d_u3_invertSin_bit_select_merged_e_11_q;
    reg [0:0] d_u3_invertSin_bit_select_merged_c_25_q;
    reg [0:0] d_u3_invertSin_bit_select_merged_b_25_q;
    reg [0:0] d_u0_alphaBitSelect_bit_select_merged_c_23_q;
    reg [7:0] d_u0_alphaBitSelect_bit_select_merged_b_16_q;
    reg [0:0] d_u1_alphaBitSelect_bit_select_merged_c_23_q;
    reg [7:0] d_u1_alphaBitSelect_bit_select_merged_b_16_q;
    reg [0:0] d_u2_alphaBitSelect_bit_select_merged_c_23_q;
    reg [7:0] d_u2_alphaBitSelect_bit_select_merged_b_16_q;
    reg [0:0] d_u3_alphaBitSelect_bit_select_merged_c_23_q;
    reg [7:0] d_u3_alphaBitSelect_bit_select_merged_b_16_q;
    wire [19:0] u0_rangeAddSub_BitSelect_for_a_b_const_q;
    wire [13:0] u0_rangeAddSub_BitSelect_for_a_c_const_q;
    wire d_xIn_c_27_mem_reset0;
    wire d_xIn_c_27_mem_ena_OrRstB;
    wire [7:0] d_xIn_c_27_mem_ia;
    wire [3:0] d_xIn_c_27_mem_aa;
    wire [3:0] d_xIn_c_27_mem_ab;
    wire [7:0] d_xIn_c_27_mem_iq;
    wire [7:0] d_xIn_c_27_mem_q;
    wire [3:0] d_xIn_c_27_rdcnt_q;
    (* preserve_syn_only *) reg [3:0] d_xIn_c_27_rdcnt_i;
    reg [3:0] d_xIn_c_27_wraddr_q;
    wire [4:0] d_xIn_c_27_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_xIn_c_27_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_xIn_c_27_sticky_ena_q;
    wire d_u0_sinTable_r_23_mem_reset0;
    wire d_u0_sinTable_r_23_mem_ena_OrRstB;
    wire [15:0] d_u0_sinTable_r_23_mem_ia;
    wire [1:0] d_u0_sinTable_r_23_mem_aa;
    wire [1:0] d_u0_sinTable_r_23_mem_ab;
    wire [15:0] d_u0_sinTable_r_23_mem_iq;
    wire [15:0] d_u0_sinTable_r_23_mem_q;
    wire [1:0] d_u0_sinTable_r_23_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] d_u0_sinTable_r_23_rdcnt_i;
    reg [1:0] d_u0_sinTable_r_23_wraddr_q;
    wire [2:0] d_u0_sinTable_r_23_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_u0_sinTable_r_23_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_u0_sinTable_r_23_sticky_ena_q;
    wire d_u0_cosTable_r_23_mem_reset0;
    wire d_u0_cosTable_r_23_mem_ena_OrRstB;
    wire [15:0] d_u0_cosTable_r_23_mem_ia;
    wire [1:0] d_u0_cosTable_r_23_mem_aa;
    wire [1:0] d_u0_cosTable_r_23_mem_ab;
    wire [15:0] d_u0_cosTable_r_23_mem_iq;
    wire [15:0] d_u0_cosTable_r_23_mem_q;
    wire [1:0] d_u0_cosTable_r_23_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] d_u0_cosTable_r_23_rdcnt_i;
    reg [1:0] d_u0_cosTable_r_23_wraddr_q;
    wire [2:0] d_u0_cosTable_r_23_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_u0_cosTable_r_23_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_u0_cosTable_r_23_sticky_ena_q;
    wire d_u1_sinTable_r_23_mem_reset0;
    wire d_u1_sinTable_r_23_mem_ena_OrRstB;
    wire [15:0] d_u1_sinTable_r_23_mem_ia;
    wire [1:0] d_u1_sinTable_r_23_mem_aa;
    wire [1:0] d_u1_sinTable_r_23_mem_ab;
    wire [15:0] d_u1_sinTable_r_23_mem_iq;
    wire [15:0] d_u1_sinTable_r_23_mem_q;
    wire [1:0] d_u1_sinTable_r_23_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] d_u1_sinTable_r_23_rdcnt_i;
    reg [1:0] d_u1_sinTable_r_23_wraddr_q;
    wire [2:0] d_u1_sinTable_r_23_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_u1_sinTable_r_23_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_u1_sinTable_r_23_sticky_ena_q;
    wire d_u1_cosTable_r_23_mem_reset0;
    wire d_u1_cosTable_r_23_mem_ena_OrRstB;
    wire [15:0] d_u1_cosTable_r_23_mem_ia;
    wire [1:0] d_u1_cosTable_r_23_mem_aa;
    wire [1:0] d_u1_cosTable_r_23_mem_ab;
    wire [15:0] d_u1_cosTable_r_23_mem_iq;
    wire [15:0] d_u1_cosTable_r_23_mem_q;
    wire [1:0] d_u1_cosTable_r_23_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] d_u1_cosTable_r_23_rdcnt_i;
    reg [1:0] d_u1_cosTable_r_23_wraddr_q;
    wire [2:0] d_u1_cosTable_r_23_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_u1_cosTable_r_23_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_u1_cosTable_r_23_sticky_ena_q;
    wire d_u2_sinTable_r_23_mem_reset0;
    wire d_u2_sinTable_r_23_mem_ena_OrRstB;
    wire [15:0] d_u2_sinTable_r_23_mem_ia;
    wire [1:0] d_u2_sinTable_r_23_mem_aa;
    wire [1:0] d_u2_sinTable_r_23_mem_ab;
    wire [15:0] d_u2_sinTable_r_23_mem_iq;
    wire [15:0] d_u2_sinTable_r_23_mem_q;
    wire [1:0] d_u2_sinTable_r_23_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] d_u2_sinTable_r_23_rdcnt_i;
    reg [1:0] d_u2_sinTable_r_23_wraddr_q;
    wire [2:0] d_u2_sinTable_r_23_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_u2_sinTable_r_23_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_u2_sinTable_r_23_sticky_ena_q;
    wire d_u2_cosTable_r_23_mem_reset0;
    wire d_u2_cosTable_r_23_mem_ena_OrRstB;
    wire [15:0] d_u2_cosTable_r_23_mem_ia;
    wire [1:0] d_u2_cosTable_r_23_mem_aa;
    wire [1:0] d_u2_cosTable_r_23_mem_ab;
    wire [15:0] d_u2_cosTable_r_23_mem_iq;
    wire [15:0] d_u2_cosTable_r_23_mem_q;
    wire [1:0] d_u2_cosTable_r_23_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] d_u2_cosTable_r_23_rdcnt_i;
    reg [1:0] d_u2_cosTable_r_23_wraddr_q;
    wire [2:0] d_u2_cosTable_r_23_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_u2_cosTable_r_23_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_u2_cosTable_r_23_sticky_ena_q;
    wire d_u3_sinTable_r_23_mem_reset0;
    wire d_u3_sinTable_r_23_mem_ena_OrRstB;
    wire [15:0] d_u3_sinTable_r_23_mem_ia;
    wire [1:0] d_u3_sinTable_r_23_mem_aa;
    wire [1:0] d_u3_sinTable_r_23_mem_ab;
    wire [15:0] d_u3_sinTable_r_23_mem_iq;
    wire [15:0] d_u3_sinTable_r_23_mem_q;
    wire [1:0] d_u3_sinTable_r_23_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] d_u3_sinTable_r_23_rdcnt_i;
    reg [1:0] d_u3_sinTable_r_23_wraddr_q;
    wire [2:0] d_u3_sinTable_r_23_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_u3_sinTable_r_23_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_u3_sinTable_r_23_sticky_ena_q;
    wire d_u3_cosTable_r_23_mem_reset0;
    wire d_u3_cosTable_r_23_mem_ena_OrRstB;
    wire [15:0] d_u3_cosTable_r_23_mem_ia;
    wire [1:0] d_u3_cosTable_r_23_mem_aa;
    wire [1:0] d_u3_cosTable_r_23_mem_ab;
    wire [15:0] d_u3_cosTable_r_23_mem_iq;
    wire [15:0] d_u3_cosTable_r_23_mem_q;
    wire [1:0] d_u3_cosTable_r_23_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] d_u3_cosTable_r_23_rdcnt_i;
    reg [1:0] d_u3_cosTable_r_23_wraddr_q;
    wire [2:0] d_u3_cosTable_r_23_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_u3_cosTable_r_23_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_u3_cosTable_r_23_sticky_ena_q;
    wire [14:0] u0_cm3_BitSelect_for_a_BitJoin_for_c_q;
    wire [14:0] u1_cm3_BitSelect_for_a_BitJoin_for_c_q;
    wire [14:0] u2_cm3_BitSelect_for_a_BitJoin_for_c_q;
    wire [14:0] u3_cm3_BitSelect_for_a_BitJoin_for_c_q;
    wire [0:0] readbackReadValid_q;
    wire [4:0] d_xIn_c_27_cmp_b;
    wire [0:0] d_xIn_c_27_cmp_q;
    wire [0:0] d_xIn_c_27_notEnable_q;
    wire [0:0] d_xIn_c_27_nor_q;
    wire [0:0] d_xIn_c_27_enaAnd_q;
    wire [2:0] d_u0_sinTable_r_23_cmp_b;
    wire [0:0] d_u0_sinTable_r_23_cmp_q;
    wire [0:0] d_u0_sinTable_r_23_notEnable_q;
    wire [0:0] d_u0_sinTable_r_23_nor_q;
    wire [0:0] d_u0_sinTable_r_23_enaAnd_q;
    wire [2:0] d_u0_cosTable_r_23_cmp_b;
    wire [0:0] d_u0_cosTable_r_23_cmp_q;
    wire [0:0] d_u0_cosTable_r_23_notEnable_q;
    wire [0:0] d_u0_cosTable_r_23_nor_q;
    wire [0:0] d_u0_cosTable_r_23_enaAnd_q;
    wire [2:0] d_u1_sinTable_r_23_cmp_b;
    wire [0:0] d_u1_sinTable_r_23_cmp_q;
    wire [0:0] d_u1_sinTable_r_23_notEnable_q;
    wire [0:0] d_u1_sinTable_r_23_nor_q;
    wire [0:0] d_u1_sinTable_r_23_enaAnd_q;
    wire [2:0] d_u1_cosTable_r_23_cmp_b;
    wire [0:0] d_u1_cosTable_r_23_cmp_q;
    wire [0:0] d_u1_cosTable_r_23_notEnable_q;
    wire [0:0] d_u1_cosTable_r_23_nor_q;
    wire [0:0] d_u1_cosTable_r_23_enaAnd_q;
    wire [2:0] d_u2_sinTable_r_23_cmp_b;
    wire [0:0] d_u2_sinTable_r_23_cmp_q;
    wire [0:0] d_u2_sinTable_r_23_notEnable_q;
    wire [0:0] d_u2_sinTable_r_23_nor_q;
    wire [0:0] d_u2_sinTable_r_23_enaAnd_q;
    wire [2:0] d_u2_cosTable_r_23_cmp_b;
    wire [0:0] d_u2_cosTable_r_23_cmp_q;
    wire [0:0] d_u2_cosTable_r_23_notEnable_q;
    wire [0:0] d_u2_cosTable_r_23_nor_q;
    wire [0:0] d_u2_cosTable_r_23_enaAnd_q;
    wire [2:0] d_u3_sinTable_r_23_cmp_b;
    wire [0:0] d_u3_sinTable_r_23_cmp_q;
    wire [0:0] d_u3_sinTable_r_23_notEnable_q;
    wire [0:0] d_u3_sinTable_r_23_nor_q;
    wire [0:0] d_u3_sinTable_r_23_enaAnd_q;
    wire [2:0] d_u3_cosTable_r_23_cmp_b;
    wire [0:0] d_u3_cosTable_r_23_cmp_q;
    wire [0:0] d_u3_cosTable_r_23_notEnable_q;
    wire [0:0] d_u3_cosTable_r_23_nor_q;
    wire [0:0] d_u3_cosTable_r_23_enaAnd_q;
    wire [19:0] u0_accumAdd_b1_BitSelect_for_v_b;
    wire [11:0] u0_accumAdd_b1_BitSelect_for_v_c;
    wire [19:0] u1_accumAdd_b1_BitSelect_for_v_b;
    wire [11:0] u1_accumAdd_b1_BitSelect_for_v_c;
    wire [19:0] u2_accumAdd_b1_BitSelect_for_v_b;
    wire [11:0] u2_accumAdd_b1_BitSelect_for_v_c;
    wire [19:0] u3_accumAdd_b1_BitSelect_for_v_b;
    wire [11:0] u3_accumAdd_b1_BitSelect_for_v_c;
    wire [33:0] u0_phaseIncrMem_q;
    wire [33:0] u1_phaseIncrMem_q;
    wire [33:0] u2_phaseIncrMem_q;
    wire [33:0] u3_phaseIncrMem_q;
    wire [3:0] u0_sinJoin_q;
    wire [3:0] u0_cosJoin_q;
    wire [16:0] u0_roundedSin_trunc_q;
    wire [17:0] u0_roundedSin_trunc_qint;
    wire [16:0] u0_roundedCos_trunc_q;
    wire [17:0] u0_roundedCos_trunc_qint;
    wire [3:0] u1_sinJoin_q;
    wire [3:0] u1_cosJoin_q;
    wire [16:0] u1_roundedSin_trunc_q;
    wire [17:0] u1_roundedSin_trunc_qint;
    wire [16:0] u1_roundedCos_trunc_q;
    wire [17:0] u1_roundedCos_trunc_qint;
    wire [3:0] u2_sinJoin_q;
    wire [3:0] u2_cosJoin_q;
    wire [16:0] u2_roundedSin_trunc_q;
    wire [17:0] u2_roundedSin_trunc_qint;
    wire [16:0] u2_roundedCos_trunc_q;
    wire [17:0] u2_roundedCos_trunc_qint;
    wire [3:0] u3_sinJoin_q;
    wire [3:0] u3_cosJoin_q;
    wire [16:0] u3_roundedSin_trunc_q;
    wire [17:0] u3_roundedSin_trunc_qint;
    wire [16:0] u3_roundedCos_trunc_q;
    wire [17:0] u3_roundedCos_trunc_qint;
    wire [17:0] u0_shiftCosB_q;
    wire [31:0] u0_shiftCosB_qint;
    wire [17:0] u0_shiftSinB_q;
    wire [31:0] u0_shiftSinB_qint;
    wire [17:0] u1_shiftCosB_q;
    wire [31:0] u1_shiftCosB_qint;
    wire [17:0] u1_shiftSinB_q;
    wire [31:0] u1_shiftSinB_qint;
    wire [17:0] u2_shiftCosB_q;
    wire [31:0] u2_shiftCosB_qint;
    wire [17:0] u2_shiftSinB_q;
    wire [31:0] u2_shiftSinB_qint;
    wire [17:0] u3_shiftCosB_q;
    wire [31:0] u3_shiftCosB_qint;
    wire [17:0] u3_shiftSinB_q;
    wire [31:0] u3_shiftSinB_qint;
    wire [31:0] u0_accumAdd_b1_BitJoin_for_q_q;
    wire [13:0] u0_rangeAddSub_BitSelect_for_b_BitJoin_for_c_q;
    wire [13:0] u1_rangeAddSub_BitSelect_for_b_BitJoin_for_c_q;
    wire [13:0] u2_rangeAddSub_BitSelect_for_b_BitJoin_for_c_q;
    wire [13:0] u3_rangeAddSub_BitSelect_for_b_BitJoin_for_c_q;
    wire [33:0] u0_rangeAddSub_BitJoin_for_q_q;
    wire [14:0] u0_cm3_BitSelect_for_b_BitJoin_for_c_q;
    wire [14:0] u1_cm3_BitSelect_for_b_BitJoin_for_c_q;
    wire [14:0] u2_cm3_BitSelect_for_b_BitJoin_for_c_q;
    wire [14:0] u3_cm3_BitSelect_for_b_BitJoin_for_c_q;
    wire [34:0] u0_cm3_BitJoin_for_q_q;
    wire [31:0] u1_accumAdd_b1_BitJoin_for_q_q;
    wire [33:0] u1_rangeAddSub_BitJoin_for_q_q;
    wire [34:0] u1_cm3_BitJoin_for_q_q;
    wire [31:0] u2_accumAdd_b1_BitJoin_for_q_q;
    wire [33:0] u2_rangeAddSub_BitJoin_for_q_q;
    wire [34:0] u2_cm3_BitJoin_for_q_q;
    wire [31:0] u3_accumAdd_b1_BitJoin_for_q_q;
    wire [33:0] u3_rangeAddSub_BitJoin_for_q_q;
    wire [34:0] u3_cm3_BitJoin_for_q_q;
    wire [17:0] u0_roundedSin_shift_q;
    wire [18:0] u0_roundedSin_shift_qint;
    wire [17:0] u0_roundedCos_shift_q;
    wire [18:0] u0_roundedCos_shift_qint;
    wire [17:0] u1_roundedSin_shift_q;
    wire [18:0] u1_roundedSin_shift_qint;
    wire [17:0] u1_roundedCos_shift_q;
    wire [18:0] u1_roundedCos_shift_qint;
    wire [17:0] u2_roundedSin_shift_q;
    wire [18:0] u2_roundedSin_shift_qint;
    wire [17:0] u2_roundedCos_shift_q;
    wire [18:0] u2_roundedCos_shift_qint;
    wire [17:0] u3_roundedSin_shift_q;
    wire [18:0] u3_roundedSin_shift_qint;
    wire [17:0] u3_roundedCos_shift_q;
    wire [18:0] u3_roundedCos_shift_qint;
    wire [17:0] u0_lsSinTable_q;
    wire [17:0] u0_lsSinTable_qint;
    wire [17:0] u0_lsCosTable_q;
    wire [17:0] u0_lsCosTable_qint;
    wire [17:0] u1_lsSinTable_q;
    wire [17:0] u1_lsSinTable_qint;
    wire [17:0] u1_lsCosTable_q;
    wire [17:0] u1_lsCosTable_qint;
    wire [17:0] u2_lsSinTable_q;
    wire [17:0] u2_lsSinTable_qint;
    wire [17:0] u2_lsCosTable_q;
    wire [17:0] u2_lsCosTable_qint;
    wire [17:0] u3_lsSinTable_q;
    wire [17:0] u3_lsSinTable_qint;
    wire [17:0] u3_lsCosTable_q;
    wire [17:0] u3_lsCosTable_qint;
    wire [0:0] u0_invertSin_bit_select_merged_b;
    wire [0:0] u0_invertSin_bit_select_merged_c;
    wire [19:0] u0_invertSin_bit_select_merged_d;
    wire [11:0] u0_invertSin_bit_select_merged_e;
    wire [0:0] u1_invertSin_bit_select_merged_b;
    wire [0:0] u1_invertSin_bit_select_merged_c;
    wire [19:0] u1_invertSin_bit_select_merged_d;
    wire [11:0] u1_invertSin_bit_select_merged_e;
    wire [0:0] u2_invertSin_bit_select_merged_b;
    wire [0:0] u2_invertSin_bit_select_merged_c;
    wire [19:0] u2_invertSin_bit_select_merged_d;
    wire [11:0] u2_invertSin_bit_select_merged_e;
    wire [0:0] u3_invertSin_bit_select_merged_b;
    wire [0:0] u3_invertSin_bit_select_merged_c;
    wire [19:0] u3_invertSin_bit_select_merged_d;
    wire [11:0] u3_invertSin_bit_select_merged_e;
    wire [2:0] u0_octantBitSelect_b;
    wire [29:0] u0_alphaBitSelect_bit_select_merged_in;
    wire [7:0] u0_alphaBitSelect_bit_select_merged_b;
    wire [0:0] u0_alphaBitSelect_bit_select_merged_c;
    wire [20:0] u0_alphaBitSelect_bit_select_merged_d;
    wire [37:0] u0_beta_times_4_shift_q;
    wire [37:0] u0_beta_times_4_shift_qint;
    wire [2:0] u1_octantBitSelect_b;
    wire [29:0] u1_alphaBitSelect_bit_select_merged_in;
    wire [7:0] u1_alphaBitSelect_bit_select_merged_b;
    wire [0:0] u1_alphaBitSelect_bit_select_merged_c;
    wire [20:0] u1_alphaBitSelect_bit_select_merged_d;
    wire [37:0] u1_beta_times_4_shift_q;
    wire [37:0] u1_beta_times_4_shift_qint;
    wire [2:0] u2_octantBitSelect_b;
    wire [29:0] u2_alphaBitSelect_bit_select_merged_in;
    wire [7:0] u2_alphaBitSelect_bit_select_merged_b;
    wire [0:0] u2_alphaBitSelect_bit_select_merged_c;
    wire [20:0] u2_alphaBitSelect_bit_select_merged_d;
    wire [37:0] u2_beta_times_4_shift_q;
    wire [37:0] u2_beta_times_4_shift_qint;
    wire [2:0] u3_octantBitSelect_b;
    wire [29:0] u3_alphaBitSelect_bit_select_merged_in;
    wire [7:0] u3_alphaBitSelect_bit_select_merged_b;
    wire [0:0] u3_alphaBitSelect_bit_select_merged_c;
    wire [20:0] u3_alphaBitSelect_bit_select_merged_d;
    wire [37:0] u3_beta_times_4_shift_q;
    wire [37:0] u3_beta_times_4_shift_qint;
    wire [16:0] u0_roundedSin_bs_in;
    wire [16:0] u0_roundedSin_bs_b;
    wire [16:0] u0_roundedCos_bs_in;
    wire [16:0] u0_roundedCos_bs_b;
    wire [16:0] u1_roundedSin_bs_in;
    wire [16:0] u1_roundedSin_bs_b;
    wire [16:0] u1_roundedCos_bs_in;
    wire [16:0] u1_roundedCos_bs_b;
    wire [16:0] u2_roundedSin_bs_in;
    wire [16:0] u2_roundedSin_bs_b;
    wire [16:0] u2_roundedCos_bs_in;
    wire [16:0] u2_roundedCos_bs_b;
    wire [16:0] u3_roundedSin_bs_in;
    wire [16:0] u3_roundedSin_bs_b;
    wire [16:0] u3_roundedCos_bs_in;
    wire [16:0] u3_roundedCos_bs_b;
    wire [32:0] u0_ls12_q;
    wire [32:0] u0_ls12_qint;
    wire [30:0] u0_ls10_q;
    wire [30:0] u0_ls10_qint;
    wire [27:0] u0_ls7_q;
    wire [27:0] u0_ls7_qint;
    wire [24:0] u0_ls4_q;
    wire [24:0] u0_ls4_qint;
    wire [35:0] u0_beta_times_pi_over_4_shifted_in;
    wire [15:0] u0_beta_times_pi_over_4_shifted_b;
    wire [32:0] u1_ls12_q;
    wire [32:0] u1_ls12_qint;
    wire [30:0] u1_ls10_q;
    wire [30:0] u1_ls10_qint;
    wire [27:0] u1_ls7_q;
    wire [27:0] u1_ls7_qint;
    wire [24:0] u1_ls4_q;
    wire [24:0] u1_ls4_qint;
    wire [35:0] u1_beta_times_pi_over_4_shifted_in;
    wire [15:0] u1_beta_times_pi_over_4_shifted_b;
    wire [32:0] u2_ls12_q;
    wire [32:0] u2_ls12_qint;
    wire [30:0] u2_ls10_q;
    wire [30:0] u2_ls10_qint;
    wire [27:0] u2_ls7_q;
    wire [27:0] u2_ls7_qint;
    wire [24:0] u2_ls4_q;
    wire [24:0] u2_ls4_qint;
    wire [35:0] u2_beta_times_pi_over_4_shifted_in;
    wire [15:0] u2_beta_times_pi_over_4_shifted_b;
    wire [32:0] u3_ls12_q;
    wire [32:0] u3_ls12_qint;
    wire [30:0] u3_ls10_q;
    wire [30:0] u3_ls10_qint;
    wire [27:0] u3_ls7_q;
    wire [27:0] u3_ls7_qint;
    wire [24:0] u3_ls4_q;
    wire [24:0] u3_ls4_qint;
    wire [35:0] u3_beta_times_pi_over_4_shifted_in;
    wire [15:0] u3_beta_times_pi_over_4_shifted_b;
    wire [33:0] u0_cm1_BitExpansion_for_a_q;
    wire [33:0] u0_cm1_BitExpansion_for_b_q;
    wire [28:0] u0_cm2_BitExpansion_for_a_q;
    wire [28:0] u0_cm2_BitExpansion_for_b_q;
    wire [33:0] u1_cm1_BitExpansion_for_a_q;
    wire [33:0] u1_cm1_BitExpansion_for_b_q;
    wire [28:0] u1_cm2_BitExpansion_for_a_q;
    wire [28:0] u1_cm2_BitExpansion_for_b_q;
    wire [33:0] u2_cm1_BitExpansion_for_a_q;
    wire [33:0] u2_cm1_BitExpansion_for_b_q;
    wire [28:0] u2_cm2_BitExpansion_for_a_q;
    wire [28:0] u2_cm2_BitExpansion_for_b_q;
    wire [33:0] u3_cm1_BitExpansion_for_a_q;
    wire [33:0] u3_cm1_BitExpansion_for_b_q;
    wire [28:0] u3_cm2_BitExpansion_for_a_q;
    wire [28:0] u3_cm2_BitExpansion_for_b_q;
    wire [19:0] u0_cm1_BitSelect_for_a_b;
    wire [13:0] u0_cm1_BitSelect_for_a_c;
    wire [19:0] u0_cm1_BitSelect_for_b_b;
    wire [13:0] u0_cm1_BitSelect_for_b_c;
    wire [19:0] u0_cm2_BitSelect_for_a_b;
    wire [8:0] u0_cm2_BitSelect_for_a_c;
    wire [19:0] u0_cm2_BitSelect_for_b_b;
    wire [8:0] u0_cm2_BitSelect_for_b_c;
    wire [19:0] u1_cm1_BitSelect_for_a_b;
    wire [13:0] u1_cm1_BitSelect_for_a_c;
    wire [19:0] u1_cm1_BitSelect_for_b_b;
    wire [13:0] u1_cm1_BitSelect_for_b_c;
    wire [19:0] u1_cm2_BitSelect_for_a_b;
    wire [8:0] u1_cm2_BitSelect_for_a_c;
    wire [19:0] u1_cm2_BitSelect_for_b_b;
    wire [8:0] u1_cm2_BitSelect_for_b_c;
    wire [19:0] u2_cm1_BitSelect_for_a_b;
    wire [13:0] u2_cm1_BitSelect_for_a_c;
    wire [19:0] u2_cm1_BitSelect_for_b_b;
    wire [13:0] u2_cm1_BitSelect_for_b_c;
    wire [19:0] u2_cm2_BitSelect_for_a_b;
    wire [8:0] u2_cm2_BitSelect_for_a_c;
    wire [19:0] u2_cm2_BitSelect_for_b_b;
    wire [8:0] u2_cm2_BitSelect_for_b_c;
    wire [19:0] u3_cm1_BitSelect_for_a_b;
    wire [13:0] u3_cm1_BitSelect_for_a_c;
    wire [19:0] u3_cm1_BitSelect_for_b_b;
    wire [13:0] u3_cm1_BitSelect_for_b_c;
    wire [19:0] u3_cm2_BitSelect_for_a_b;
    wire [8:0] u3_cm2_BitSelect_for_a_c;
    wire [19:0] u3_cm2_BitSelect_for_b_b;
    wire [8:0] u3_cm2_BitSelect_for_b_c;

    import ddc_model_DUT_safe_path_ver::safe_path_ver;

    // d_busIn_writedata_11(DELAY,553)@10 + 1
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            d_busIn_writedata_11_q <= '0;
        end
        else
        begin
            d_busIn_writedata_11_q <= busIn_writedata;
        end
    end

    // readbackMemLookup(LOOKUP,25)@10 + 1
    assign readbackMemLookup_c = busIn_write;
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            readbackMemLookup_q <= $unsigned(3'b000);
            readbackMemLookup_h <= $unsigned(1'b0);
            readbackMemLookup_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00001100100000 : begin
                                         readbackMemLookup_q <= 3'b000;
                                         readbackMemLookup_h <= 1'b1;
                                         readbackMemLookup_e <= readbackMemLookup_c;
                                     end
                14'b00001100100001 : begin
                                         readbackMemLookup_q <= 3'b001;
                                         readbackMemLookup_h <= 1'b1;
                                         readbackMemLookup_e <= readbackMemLookup_c;
                                     end
                14'b00001100100010 : begin
                                         readbackMemLookup_q <= 3'b010;
                                         readbackMemLookup_h <= 1'b1;
                                         readbackMemLookup_e <= readbackMemLookup_c;
                                     end
                14'b00001100100011 : begin
                                         readbackMemLookup_q <= 3'b011;
                                         readbackMemLookup_h <= 1'b1;
                                         readbackMemLookup_e <= readbackMemLookup_c;
                                     end
                14'b00001100100100 : begin
                                         readbackMemLookup_q <= 3'b100;
                                         readbackMemLookup_h <= 1'b1;
                                         readbackMemLookup_e <= readbackMemLookup_c;
                                     end
                14'b00001100100101 : begin
                                         readbackMemLookup_q <= 3'b101;
                                         readbackMemLookup_h <= 1'b1;
                                         readbackMemLookup_e <= readbackMemLookup_c;
                                     end
                14'b00001100100110 : begin
                                         readbackMemLookup_q <= 3'b110;
                                         readbackMemLookup_h <= 1'b1;
                                         readbackMemLookup_e <= readbackMemLookup_c;
                                     end
                14'b00001100100111 : begin
                                         readbackMemLookup_q <= 3'b111;
                                         readbackMemLookup_h <= 1'b1;
                                         readbackMemLookup_e <= readbackMemLookup_c;
                                     end
                default : begin
                              readbackMemLookup_q <= 3'b000;
                              readbackMemLookup_h <= 1'b0;
                              readbackMemLookup_e <= 1'b0;
                          end
            endcase
        end
    end

    // readbackMem(DUALMEM,27)@11 + 2
    assign readbackMem_ia = d_busIn_writedata_11_q;
    assign readbackMem_aa = readbackMemLookup_q;
    assign readbackMem_ab = readbackMemLookup_q;
    assign readbackMem_ena_NotRstA = ~ (bus_areset);
    assign readbackMem_reset0 = bus_areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(32),
        .widthad_b(3),
        .numwords_b(8),
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
        .init_file(safe_path_ver("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO_readbackMem.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) readbackMem_dmem (
        .clocken0(readbackMem_ena_NotRstA),
        .sclr(readbackMem_reset0),
        .clock0(bus_clk),
        .address_a(readbackMem_aa),
        .data_a(readbackMem_ia),
        .wren_a(readbackMemLookup_e[0]),
        .address_b(readbackMem_ab),
        .q_b(readbackMem_iq),
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
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign readbackMem_q = readbackMem_iq[31:0];

    // d_busIn_read_13(DELAY,554)@10 + 3
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            d_busIn_read_13_delay_0 <= '0;
        end
        else
        begin
            d_busIn_read_13_delay_0 <= $unsigned(busIn_read);
        end
    end
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_busIn_read_13_delay_1 <= d_busIn_read_13_delay_0;
            d_busIn_read_13_q <= d_busIn_read_13_delay_1;
        end
    end

    // d_readbackMemLookup_h_13(DELAY,555)@11 + 2
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            d_readbackMemLookup_h_13_delay_0 <= '0;
        end
        else
        begin
            d_readbackMemLookup_h_13_delay_0 <= $unsigned(readbackMemLookup_h);
        end
    end
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_readbackMemLookup_h_13_q <= d_readbackMemLookup_h_13_delay_0;
        end
    end

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // readbackReadValid(LOGICAL,26)@13
    assign readbackReadValid_q = d_readbackMemLookup_h_13_q & d_busIn_read_13_q;

    // busOut(BUSOUT,28)@13
    assign busOut_readdatavalid = readbackReadValid_q;
    assign busOut_readdata = readbackMem_q;

    // u3_phaseIncrRegLookup_1(LOOKUP,22)@10 + 1
    assign u3_phaseIncrRegLookup_1_c = busIn_write;
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u3_phaseIncrRegLookup_1_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00001100100111 : u3_phaseIncrRegLookup_1_e <= u3_phaseIncrRegLookup_1_c;
                default : u3_phaseIncrRegLookup_1_e <= 1'b0;
            endcase
        end
    end

    // u3_phaseIncrReg_p1(SYNCREG,23)@11 + 1
    assign u3_phaseIncrReg_p1_a = d_busIn_writedata_11_q;
    assign u3_phaseIncrReg_p1_b = u3_phaseIncrRegLookup_1_e;
    dspba_sync_reg_ver #( .width1(32), .width2(2), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    u3_phaseIncrReg_p1 ( .xin(u3_phaseIncrReg_p1_a), .ena(u3_phaseIncrReg_p1_b), .clk1(bus_clk), .aclr1(bus_areset), .sxout(u3_phaseIncrReg_p1_v), .clk2(clk), .aclr2(areset), .xout() );

    // u3_phaseIncrRegLookup_0(LOOKUP,20)@10 + 1
    assign u3_phaseIncrRegLookup_0_c = busIn_write;
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u3_phaseIncrRegLookup_0_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00001100100110 : u3_phaseIncrRegLookup_0_e <= u3_phaseIncrRegLookup_0_c;
                default : u3_phaseIncrRegLookup_0_e <= 1'b0;
            endcase
        end
    end

    // u3_phaseIncrReg_p0(SYNCREG,21)@11 + 1
    assign u3_phaseIncrReg_p0_a = d_busIn_writedata_11_q;
    assign u3_phaseIncrReg_p0_b = u3_phaseIncrRegLookup_0_e;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00011010000010101010101010101010), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    u3_phaseIncrReg_p0 ( .xin(u3_phaseIncrReg_p0_a), .ena(u3_phaseIncrReg_p0_b), .clk1(bus_clk), .aclr1(bus_areset), .sxout(u3_phaseIncrReg_p0_v), .clk2(clk), .aclr2(areset), .xout() );

    // u3_phaseIncrMem(BITJOIN,24)@12
    assign u3_phaseIncrMem_q = {u3_phaseIncrReg_p1_v, u3_phaseIncrReg_p0_v};

    // u3_invertSin_bit_select_merged(BITSELECT,529)@10
    assign u3_invertSin_bit_select_merged_b = u3_phaseIncrMem_q[33:33];
    assign u3_invertSin_bit_select_merged_c = u3_phaseIncrMem_q[32:32];
    assign u3_invertSin_bit_select_merged_d = u3_phaseIncrMem_q[19:0];
    assign u3_invertSin_bit_select_merged_e = u3_phaseIncrMem_q[31:20];

    // d_u3_invertSin_bit_select_merged_c_25(DELAY,626)@10 + 15
    dspba_delay_ver #( .width(1), .depth(15), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u3_invertSin_bit_select_merged_c_25 ( .xin(u3_invertSin_bit_select_merged_c), .xout(d_u3_invertSin_bit_select_merged_c_25_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u3_accumAdd_b1_BitSelect_for_v(BITSELECT,338)@10
    assign u3_accumAdd_b1_BitSelect_for_v_b = xIn_p_3[19:0];
    assign u3_accumAdd_b1_BitSelect_for_v_c = xIn_p_3[31:20];

    // u3_accumAdd_b1_p1_of_2(ADD,339)@10 + 1
    assign u3_accumAdd_b1_p1_of_2_a = {1'b0, u3_accumAdd_b1_p1_of_2_q};
    assign u3_accumAdd_b1_p1_of_2_b = {1'b0, u3_invertSin_bit_select_merged_d};
    assign u3_accumAdd_b1_p1_of_2_i = $unsigned({ 1'b0, u3_accumAdd_b1_BitSelect_for_v_b });
    assign u3_accumAdd_b1_p1_of_2_a1 = xIn_s_3 == 1'b1 ? u3_accumAdd_b1_p1_of_2_i : u3_accumAdd_b1_p1_of_2_a;
    assign u3_accumAdd_b1_p1_of_2_b1 = xIn_s_3 == 1'b1 ? 21'b0 : u3_accumAdd_b1_p1_of_2_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_accumAdd_b1_p1_of_2_o <= 21'b0;
        end
        else if (xIn_v == 1'b1)
        begin
            u3_accumAdd_b1_p1_of_2_o <= $unsigned(u3_accumAdd_b1_p1_of_2_a1) + $unsigned(u3_accumAdd_b1_p1_of_2_b1);
        end
    end
    assign u3_accumAdd_b1_p1_of_2_c[0] = u3_accumAdd_b1_p1_of_2_o[20];
    assign u3_accumAdd_b1_p1_of_2_q = u3_accumAdd_b1_p1_of_2_o[19:0];

    // d_u3_accumAdd_b1_BitSelect_for_v_c_11(DELAY,606)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_accumAdd_b1_BitSelect_for_v_c_11_q <= '0;
        end
        else
        begin
            d_u3_accumAdd_b1_BitSelect_for_v_c_11_q <= u3_accumAdd_b1_BitSelect_for_v_c;
        end
    end

    // d_xIn_s_3_11(DELAY,552)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_s_3_11_q <= '0;
        end
        else
        begin
            d_xIn_s_3_11_q <= $unsigned(xIn_s_3);
        end
    end

    // d_xIn_v_11(DELAY,546)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_v_11_q <= '0;
        end
        else
        begin
            d_xIn_v_11_q <= $unsigned(xIn_v);
        end
    end

    // d_u3_invertSin_bit_select_merged_e_11(DELAY,627)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_invertSin_bit_select_merged_e_11_q <= '0;
        end
        else
        begin
            d_u3_invertSin_bit_select_merged_e_11_q <= u3_invertSin_bit_select_merged_e;
        end
    end

    // u3_accumAdd_b1_p2_of_2(ADD,340)@11 + 1
    assign u3_accumAdd_b1_p2_of_2_cin = u3_accumAdd_b1_p1_of_2_c;
    assign u3_accumAdd_b1_p2_of_2_a = { {1'b0, u3_accumAdd_b1_p2_of_2_q}, 1'b1 };
    assign u3_accumAdd_b1_p2_of_2_b = { {1'b0, d_u3_invertSin_bit_select_merged_e_11_q}, u3_accumAdd_b1_p2_of_2_cin[0] };
    assign u3_accumAdd_b1_p2_of_2_i = $unsigned({ 1'b0, d_u3_accumAdd_b1_BitSelect_for_v_c_11_q, 1'b0 });
    assign u3_accumAdd_b1_p2_of_2_a1 = d_xIn_s_3_11_q == 1'b1 ? u3_accumAdd_b1_p2_of_2_i : u3_accumAdd_b1_p2_of_2_a;
    assign u3_accumAdd_b1_p2_of_2_b1 = d_xIn_s_3_11_q == 1'b1 ? 14'b0 : u3_accumAdd_b1_p2_of_2_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_accumAdd_b1_p2_of_2_o <= 14'b0;
        end
        else if (d_xIn_v_11_q == 1'b1)
        begin
            u3_accumAdd_b1_p2_of_2_o <= $unsigned(u3_accumAdd_b1_p2_of_2_a1) + $unsigned(u3_accumAdd_b1_p2_of_2_b1);
        end
    end
    assign u3_accumAdd_b1_p2_of_2_q = u3_accumAdd_b1_p2_of_2_o[12:1];

    // d_u3_accumAdd_b1_p1_of_2_q_12(DELAY,607)@11 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_accumAdd_b1_p1_of_2_q_12_q <= '0;
        end
        else
        begin
            d_u3_accumAdd_b1_p1_of_2_q_12_q <= $unsigned(u3_accumAdd_b1_p1_of_2_q);
        end
    end

    // u3_accumAdd_b1_BitJoin_for_q(BITJOIN,341)@12
    assign u3_accumAdd_b1_BitJoin_for_q_q = {u3_accumAdd_b1_p2_of_2_q, d_u3_accumAdd_b1_p1_of_2_q_12_q};

    // u3_octantBitSelect(BITSELECT,160)@12
    assign u3_octantBitSelect_b = u3_accumAdd_b1_BitJoin_for_q_q[31:29];

    // d_u3_octantBitSelect_b_24(DELAY,571)@12 + 12
    dspba_delay_ver #( .width(3), .depth(12), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u3_octantBitSelect_b_24 ( .xin(u3_octantBitSelect_b), .xout(d_u3_octantBitSelect_b_24_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // d_u3_octantBitSelect_b_25(DELAY,572)@24 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_octantBitSelect_b_25_q <= '0;
        end
        else
        begin
            d_u3_octantBitSelect_b_25_q <= d_u3_octantBitSelect_b_24_q;
        end
    end

    // u3_cosJoin(BITJOIN,195)@25
    assign u3_cosJoin_q = {d_u3_invertSin_bit_select_merged_c_25_q, d_u3_octantBitSelect_b_25_q};

    // u3_doCosInvert(LOOKUP,196)@25 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_doCosInvert_q <= $unsigned(1'b1);
        end
        else
        begin
            unique case (u3_cosJoin_q)
                4'b0000 : u3_doCosInvert_q <= 1'b1;
                4'b0001 : u3_doCosInvert_q <= 1'b1;
                4'b0010 : u3_doCosInvert_q <= 1'b0;
                4'b0011 : u3_doCosInvert_q <= 1'b0;
                4'b0100 : u3_doCosInvert_q <= 1'b0;
                4'b0101 : u3_doCosInvert_q <= 1'b0;
                4'b0110 : u3_doCosInvert_q <= 1'b1;
                4'b0111 : u3_doCosInvert_q <= 1'b1;
                4'b1000 : u3_doCosInvert_q <= 1'b0;
                4'b1001 : u3_doCosInvert_q <= 1'b0;
                4'b1010 : u3_doCosInvert_q <= 1'b1;
                4'b1011 : u3_doCosInvert_q <= 1'b1;
                4'b1100 : u3_doCosInvert_q <= 1'b1;
                4'b1101 : u3_doCosInvert_q <= 1'b1;
                4'b1110 : u3_doCosInvert_q <= 1'b0;
                4'b1111 : u3_doCosInvert_q <= 1'b0;
                default : begin
                              // unreachable
                              u3_doCosInvert_q <= 1'bx;
                          end
            endcase
        end
    end

    // u0_roundedSin_bias(CONSTANT,486)@0
    assign u0_roundedSin_bias_q = $unsigned(2'b01);

    // u0_sin_pi_over_4(CONSTANT,55)@0
    assign u0_sin_pi_over_4_q = $unsigned(18'b010110101000001000);

    // u3_addnsubConst(LOOKUP,162)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_addnsubConst_q <= $unsigned(1'b1);
        end
        else
        begin
            unique case (u3_octantBitSelect_b)
                3'b000 : u3_addnsubConst_q <= 1'b1;
                3'b001 : u3_addnsubConst_q <= 1'b0;
                3'b010 : u3_addnsubConst_q <= 1'b1;
                3'b011 : u3_addnsubConst_q <= 1'b0;
                3'b100 : u3_addnsubConst_q <= 1'b1;
                3'b101 : u3_addnsubConst_q <= 1'b0;
                3'b110 : u3_addnsubConst_q <= 1'b1;
                3'b111 : u3_addnsubConst_q <= 1'b0;
                default : begin
                              // unreachable
                              u3_addnsubConst_q <= 1'bx;
                          end
            endcase
        end
    end

    // d_u3_addnsubConst_q_14(DELAY,573)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_addnsubConst_q_14_q <= '0;
        end
        else
        begin
            d_u3_addnsubConst_q_14_q <= $unsigned(u3_addnsubConst_q);
        end
    end

    // d_u3_accumAdd_b1_p1_of_2_q_13(DELAY,608)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_accumAdd_b1_p1_of_2_q_13_q <= '0;
        end
        else
        begin
            d_u3_accumAdd_b1_p1_of_2_q_13_q <= $unsigned(d_u3_accumAdd_b1_p1_of_2_q_12_q);
        end
    end

    // u0_rangeAddSub_BitSelect_for_a_b_const(CONSTANT,535)@0
    assign u0_rangeAddSub_BitSelect_for_a_b_const_q = $unsigned(20'b00000000000000000000);

    // u3_rangeAddSub_p1_of_2(ADDSUB,348)@13 + 1
    assign u3_rangeAddSub_p1_of_2_s = u3_addnsubConst_q;
    assign u3_rangeAddSub_p1_of_2_a = $unsigned({1'b0, u0_rangeAddSub_BitSelect_for_a_b_const_q});
    assign u3_rangeAddSub_p1_of_2_b = $unsigned({1'b0, d_u3_accumAdd_b1_p1_of_2_q_13_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_rangeAddSub_p1_of_2_o <= 21'b0;
        end
        else
        begin
            if (u3_rangeAddSub_p1_of_2_s == 1'b1)
            begin
                u3_rangeAddSub_p1_of_2_o <= $unsigned($signed(u3_rangeAddSub_p1_of_2_a) + $signed(u3_rangeAddSub_p1_of_2_b));
            end
            else
            begin
                u3_rangeAddSub_p1_of_2_o <= $unsigned($signed(u3_rangeAddSub_p1_of_2_a) - $signed(u3_rangeAddSub_p1_of_2_b));
            end
        end
    end
    assign u3_rangeAddSub_p1_of_2_c[0] = u3_rangeAddSub_p1_of_2_o[20];
    assign u3_rangeAddSub_p1_of_2_q = u3_rangeAddSub_p1_of_2_o[19:0];

    // u0_rangeAddSub_UpperBits_for_b(CONSTANT,219)@14
    assign u0_rangeAddSub_UpperBits_for_b_q = $unsigned(2'b00);

    // d_u3_accumAdd_b1_p2_of_2_q_14(DELAY,609)@12 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_accumAdd_b1_p2_of_2_q_14_delay_0 <= '0;
        end
        else
        begin
            d_u3_accumAdd_b1_p2_of_2_q_14_delay_0 <= $unsigned(u3_accumAdd_b1_p2_of_2_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u3_accumAdd_b1_p2_of_2_q_14_q <= d_u3_accumAdd_b1_p2_of_2_q_14_delay_0;
        end
    end

    // u3_rangeAddSub_BitSelect_for_b_BitJoin_for_c(BITJOIN,459)@14
    assign u3_rangeAddSub_BitSelect_for_b_BitJoin_for_c_q = {u0_rangeAddSub_UpperBits_for_b_q, d_u3_accumAdd_b1_p2_of_2_q_14_q};

    // u0_rangeAddSub_BitSelect_for_a_c_const(CONSTANT,536)@0
    assign u0_rangeAddSub_BitSelect_for_a_c_const_q = $unsigned(14'b00000000000000);

    // u3_rangeAddSub_p2_of_2(ADDSUB,349)@14 + 1
    assign u3_rangeAddSub_p2_of_2_s = d_u3_addnsubConst_q_14_q;
    assign u3_rangeAddSub_p2_of_2_cin = u3_rangeAddSub_p1_of_2_c;
    assign u3_rangeAddSub_p2_of_2_a = $unsigned({ {1'b0, u0_rangeAddSub_BitSelect_for_a_c_const_q}, d_u3_addnsubConst_q_14_q[0] });
    assign u3_rangeAddSub_p2_of_2_b = $unsigned({ {1'b0, u3_rangeAddSub_BitSelect_for_b_BitJoin_for_c_q}, u3_rangeAddSub_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_rangeAddSub_p2_of_2_o <= 16'b0;
        end
        else
        begin
            if (u3_rangeAddSub_p2_of_2_s == 1'b1)
            begin
                u3_rangeAddSub_p2_of_2_o <= $unsigned($signed(u3_rangeAddSub_p2_of_2_a) + $signed(u3_rangeAddSub_p2_of_2_b));
            end
            else
            begin
                u3_rangeAddSub_p2_of_2_o <= $unsigned($signed(u3_rangeAddSub_p2_of_2_a) - $signed(u3_rangeAddSub_p2_of_2_b));
            end
        end
    end
    assign u3_rangeAddSub_p2_of_2_q = u3_rangeAddSub_p2_of_2_o[14:1];

    // d_u3_rangeAddSub_p1_of_2_q_15(DELAY,610)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_rangeAddSub_p1_of_2_q_15_q <= '0;
        end
        else
        begin
            d_u3_rangeAddSub_p1_of_2_q_15_q <= $unsigned(u3_rangeAddSub_p1_of_2_q);
        end
    end

    // u3_rangeAddSub_BitJoin_for_q(BITJOIN,350)@15
    assign u3_rangeAddSub_BitJoin_for_q_q = {u3_rangeAddSub_p2_of_2_q, d_u3_rangeAddSub_p1_of_2_q_15_q};

    // u3_alphaBitSelect_bit_select_merged(BITSELECT,533)@15
    assign u3_alphaBitSelect_bit_select_merged_in = u3_rangeAddSub_BitJoin_for_q_q[29:0];
    assign u3_alphaBitSelect_bit_select_merged_b = u3_alphaBitSelect_bit_select_merged_in[28:21];
    assign u3_alphaBitSelect_bit_select_merged_c = u3_alphaBitSelect_bit_select_merged_in[29:29];
    assign u3_alphaBitSelect_bit_select_merged_d = u3_alphaBitSelect_bit_select_merged_in[20:0];

    // d_u3_alphaBitSelect_bit_select_merged_c_23(DELAY,635)@15 + 8
    dspba_delay_ver #( .width(1), .depth(8), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u3_alphaBitSelect_bit_select_merged_c_23 ( .xin(u3_alphaBitSelect_bit_select_merged_c), .xout(d_u3_alphaBitSelect_bit_select_merged_c_23_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u0_cm2_UpperBits_for_b(CONSTANT,237)@0
    assign u0_cm2_UpperBits_for_b_q = $unsigned(4'b0000);

    // u3_ls4(BITSHIFT,173)@15
    assign u3_ls4_qint = { u3_alphaBitSelect_bit_select_merged_d, 4'b0000 };
    assign u3_ls4_q = u3_ls4_qint[24:0];

    // u3_cm2_BitExpansion_for_b(BITJOIN,362)@15
    assign u3_cm2_BitExpansion_for_b_q = {u0_cm2_UpperBits_for_b_q, u3_ls4_q};

    // u3_cm2_BitSelect_for_b(BITSELECT,365)@15
    assign u3_cm2_BitSelect_for_b_b = u3_cm2_BitExpansion_for_b_q[19:0];
    assign u3_cm2_BitSelect_for_b_c = u3_cm2_BitExpansion_for_b_q[28:20];

    // u3_ls7(BITSHIFT,172)@15
    assign u3_ls7_qint = { u3_alphaBitSelect_bit_select_merged_d, 7'b0000000 };
    assign u3_ls7_q = u3_ls7_qint[27:0];

    // u3_cm2_BitExpansion_for_a(BITJOIN,360)@15
    assign u3_cm2_BitExpansion_for_a_q = {GND_q, u3_ls7_q};

    // u3_cm2_BitSelect_for_a(BITSELECT,364)@15
    assign u3_cm2_BitSelect_for_a_b = u3_cm2_BitExpansion_for_a_q[19:0];
    assign u3_cm2_BitSelect_for_a_c = u3_cm2_BitExpansion_for_a_q[28:20];

    // u3_cm2_p1_of_2(ADD,366)@15 + 1
    assign u3_cm2_p1_of_2_a = {1'b0, u3_cm2_BitSelect_for_a_b};
    assign u3_cm2_p1_of_2_b = {1'b0, u3_cm2_BitSelect_for_b_b};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_cm2_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u3_cm2_p1_of_2_o <= $unsigned(u3_cm2_p1_of_2_a) + $unsigned(u3_cm2_p1_of_2_b);
        end
    end
    assign u3_cm2_p1_of_2_c[0] = u3_cm2_p1_of_2_o[20];
    assign u3_cm2_p1_of_2_q = u3_cm2_p1_of_2_o[19:0];

    // u0_cm1_UpperBits_for_b(CONSTANT,228)@0
    assign u0_cm1_UpperBits_for_b_q = $unsigned(3'b000);

    // u3_ls10(BITSHIFT,170)@15
    assign u3_ls10_qint = { u3_alphaBitSelect_bit_select_merged_d, 10'b0000000000 };
    assign u3_ls10_q = u3_ls10_qint[30:0];

    // u3_cm1_BitExpansion_for_b(BITJOIN,353)@15
    assign u3_cm1_BitExpansion_for_b_q = {u0_cm1_UpperBits_for_b_q, u3_ls10_q};

    // u3_cm1_BitSelect_for_b(BITSELECT,356)@15
    assign u3_cm1_BitSelect_for_b_b = u3_cm1_BitExpansion_for_b_q[19:0];
    assign u3_cm1_BitSelect_for_b_c = u3_cm1_BitExpansion_for_b_q[33:20];

    // u3_ls12(BITSHIFT,169)@15
    assign u3_ls12_qint = { u3_alphaBitSelect_bit_select_merged_d, 12'b000000000000 };
    assign u3_ls12_q = u3_ls12_qint[32:0];

    // u3_cm1_BitExpansion_for_a(BITJOIN,351)@15
    assign u3_cm1_BitExpansion_for_a_q = {GND_q, u3_ls12_q};

    // u3_cm1_BitSelect_for_a(BITSELECT,355)@15
    assign u3_cm1_BitSelect_for_a_b = u3_cm1_BitExpansion_for_a_q[19:0];
    assign u3_cm1_BitSelect_for_a_c = u3_cm1_BitExpansion_for_a_q[33:20];

    // u3_cm1_p1_of_2(SUB,357)@15 + 1
    assign u3_cm1_p1_of_2_a = $unsigned({1'b0, u3_cm1_BitSelect_for_a_b});
    assign u3_cm1_p1_of_2_b = $unsigned({1'b0, u3_cm1_BitSelect_for_b_b});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_cm1_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u3_cm1_p1_of_2_o <= $unsigned($signed(u3_cm1_p1_of_2_a) - $signed(u3_cm1_p1_of_2_b));
        end
    end
    assign u3_cm1_p1_of_2_c[0] = u3_cm1_p1_of_2_o[20];
    assign u3_cm1_p1_of_2_q = u3_cm1_p1_of_2_o[19:0];

    // u3_cm3_p1_of_2(ADD,375)@16 + 1
    assign u3_cm3_p1_of_2_a = {1'b0, u3_cm1_p1_of_2_q};
    assign u3_cm3_p1_of_2_b = {1'b0, u3_cm2_p1_of_2_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_cm3_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u3_cm3_p1_of_2_o <= $unsigned(u3_cm3_p1_of_2_a) + $unsigned(u3_cm3_p1_of_2_b);
        end
    end
    assign u3_cm3_p1_of_2_c[0] = u3_cm3_p1_of_2_o[20];
    assign u3_cm3_p1_of_2_q = u3_cm3_p1_of_2_o[19:0];

    // u0_cm3_UpperBits_for_b(CONSTANT,246)@17
    assign u0_cm3_UpperBits_for_b_q = $unsigned(6'b000000);

    // d_u3_cm2_BitSelect_for_b_c_16(DELAY,614)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_cm2_BitSelect_for_b_c_16_q <= '0;
        end
        else
        begin
            d_u3_cm2_BitSelect_for_b_c_16_q <= u3_cm2_BitSelect_for_b_c;
        end
    end

    // d_u3_cm2_BitSelect_for_a_c_16(DELAY,613)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_cm2_BitSelect_for_a_c_16_q <= '0;
        end
        else
        begin
            d_u3_cm2_BitSelect_for_a_c_16_q <= u3_cm2_BitSelect_for_a_c;
        end
    end

    // u3_cm2_p2_of_2(ADD,367)@16 + 1
    assign u3_cm2_p2_of_2_cin = u3_cm2_p1_of_2_c;
    assign u3_cm2_p2_of_2_a = { {1'b0, d_u3_cm2_BitSelect_for_a_c_16_q}, 1'b1 };
    assign u3_cm2_p2_of_2_b = { {1'b0, d_u3_cm2_BitSelect_for_b_c_16_q}, u3_cm2_p2_of_2_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_cm2_p2_of_2_o <= 11'b0;
        end
        else
        begin
            u3_cm2_p2_of_2_o <= $unsigned(u3_cm2_p2_of_2_a) + $unsigned(u3_cm2_p2_of_2_b);
        end
    end
    assign u3_cm2_p2_of_2_q = u3_cm2_p2_of_2_o[9:1];

    // u3_cm3_BitSelect_for_b_BitJoin_for_c(BITJOIN,469)@17
    assign u3_cm3_BitSelect_for_b_BitJoin_for_c_q = {u0_cm3_UpperBits_for_b_q, u3_cm2_p2_of_2_q};

    // d_u3_cm1_BitSelect_for_b_c_16(DELAY,612)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_cm1_BitSelect_for_b_c_16_q <= '0;
        end
        else
        begin
            d_u3_cm1_BitSelect_for_b_c_16_q <= u3_cm1_BitSelect_for_b_c;
        end
    end

    // d_u3_cm1_BitSelect_for_a_c_16(DELAY,611)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_cm1_BitSelect_for_a_c_16_q <= '0;
        end
        else
        begin
            d_u3_cm1_BitSelect_for_a_c_16_q <= u3_cm1_BitSelect_for_a_c;
        end
    end

    // u3_cm1_p2_of_2(SUB,358)@16 + 1
    assign u3_cm1_p2_of_2_cin = u3_cm1_p1_of_2_c;
    assign u3_cm1_p2_of_2_a = $unsigned({ {1'b0, d_u3_cm1_BitSelect_for_a_c_16_q}, 1'b0 });
    assign u3_cm1_p2_of_2_b = $unsigned({ {1'b0, d_u3_cm1_BitSelect_for_b_c_16_q}, u3_cm1_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_cm1_p2_of_2_o <= 16'b0;
        end
        else
        begin
            u3_cm1_p2_of_2_o <= $unsigned($signed(u3_cm1_p2_of_2_a) - $signed(u3_cm1_p2_of_2_b));
        end
    end
    assign u3_cm1_p2_of_2_q = u3_cm1_p2_of_2_o[14:1];

    // u3_cm3_BitSelect_for_a_BitJoin_for_c(BITJOIN,464)@17
    assign u3_cm3_BitSelect_for_a_BitJoin_for_c_q = {GND_q, u3_cm1_p2_of_2_q};

    // u3_cm3_p2_of_2(ADD,376)@17 + 1
    assign u3_cm3_p2_of_2_cin = u3_cm3_p1_of_2_c;
    assign u3_cm3_p2_of_2_a = { {1'b0, u3_cm3_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign u3_cm3_p2_of_2_b = { {1'b0, u3_cm3_BitSelect_for_b_BitJoin_for_c_q}, u3_cm3_p2_of_2_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_cm3_p2_of_2_o <= 17'b0;
        end
        else
        begin
            u3_cm3_p2_of_2_o <= $unsigned(u3_cm3_p2_of_2_a) + $unsigned(u3_cm3_p2_of_2_b);
        end
    end
    assign u3_cm3_p2_of_2_q = u3_cm3_p2_of_2_o[15:1];

    // d_u3_cm3_p1_of_2_q_18(DELAY,615)@17 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_cm3_p1_of_2_q_18_q <= '0;
        end
        else
        begin
            d_u3_cm3_p1_of_2_q_18_q <= $unsigned(u3_cm3_p1_of_2_q);
        end
    end

    // u3_cm3_BitJoin_for_q(BITJOIN,377)@18
    assign u3_cm3_BitJoin_for_q_q = {u3_cm3_p2_of_2_q, d_u3_cm3_p1_of_2_q_18_q};

    // u3_beta_times_4_shift(BITSHIFT,176)@18
    assign u3_beta_times_4_shift_qint = { u3_cm3_BitJoin_for_q_q, 3'b000 };
    assign u3_beta_times_4_shift_q = u3_beta_times_4_shift_qint[37:0];

    // u3_beta_times_pi_over_4_shifted(BITSELECT,177)@18
    assign u3_beta_times_pi_over_4_shifted_in = u3_beta_times_4_shift_q[35:0];
    assign u3_beta_times_pi_over_4_shifted_b = u3_beta_times_pi_over_4_shifted_in[35:20];

    // d_u3_alphaBitSelect_bit_select_merged_b_16(DELAY,634)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_alphaBitSelect_bit_select_merged_b_16_q <= '0;
        end
        else
        begin
            d_u3_alphaBitSelect_bit_select_merged_b_16_q <= u3_alphaBitSelect_bit_select_merged_b;
        end
    end

    // u3_cosTable(DUALMEM,168)@16 + 2
    assign u3_cosTable_aa = d_u3_alphaBitSelect_bit_select_merged_b_16_q;
    assign u3_cosTable_ena_NotRstA = ~ (areset);
    assign u3_cosTable_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO_u3_cosTable.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) u3_cosTable_dmem (
        .clocken0(u3_cosTable_ena_NotRstA),
        .sclr(u3_cosTable_reset0),
        .clock0(clk),
        .address_a(u3_cosTable_aa),
        .q_a(u3_cosTable_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign u3_cosTable_r = u3_cosTable_ir[15:0];

    // u3_cosMult_cma(CHAINMULTADD,209)@18 + 5
    assign u3_cosMult_cma_reset = areset;
    assign u3_cosMult_cma_ena0 = 1'b1;
    assign u3_cosMult_cma_ena1 = u3_cosMult_cma_ena0;
    assign u3_cosMult_cma_ena2 = u3_cosMult_cma_ena0;

    assign u3_cosMult_cma_a0 = u3_cosTable_r;
    assign u3_cosMult_cma_c0 = u3_beta_times_pi_over_4_shifted_b;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) u3_cosMult_cma_DSP0 (
        .clk(clk),
        .ena({ u3_cosMult_cma_ena2, u3_cosMult_cma_ena1, u3_cosMult_cma_ena0 }),
        .clr({ u3_cosMult_cma_reset, u3_cosMult_cma_reset }),
        .ay(u3_cosMult_cma_a0),
        .ax(u3_cosMult_cma_c0),
        .resulta(u3_cosMult_cma_s0),
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
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u3_cosMult_cma_delay0 ( .xin(u3_cosMult_cma_s0), .xout(u3_cosMult_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u3_cosMult_cma_q = $unsigned(u3_cosMult_cma_qq0[31:0]);

    // u3_shiftSinB(BITSHIFT,182)@23
    assign u3_shiftSinB_qint = u3_cosMult_cma_q;
    assign u3_shiftSinB_q = {8'b00000000, u3_shiftSinB_qint[31:22]};

    // d_u3_sinTable_r_23_notEnable(LOGICAL,712)@18
    assign d_u3_sinTable_r_23_notEnable_q = $unsigned(~ (VCC_q));

    // d_u3_sinTable_r_23_nor(LOGICAL,713)@18
    assign d_u3_sinTable_r_23_nor_q = ~ (d_u3_sinTable_r_23_notEnable_q | d_u3_sinTable_r_23_sticky_ena_q);

    // d_u3_sinTable_r_23_mem_last(CONSTANT,709)
    assign d_u3_sinTable_r_23_mem_last_q = $unsigned(3'b010);

    // d_u3_sinTable_r_23_cmp(LOGICAL,710)@18
    assign d_u3_sinTable_r_23_cmp_b = {1'b0, d_u3_sinTable_r_23_rdcnt_q};
    assign d_u3_sinTable_r_23_cmp_q = $unsigned(d_u3_sinTable_r_23_mem_last_q == d_u3_sinTable_r_23_cmp_b ? 1'b1 : 1'b0);

    // d_u3_sinTable_r_23_cmpReg(REG,711)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_sinTable_r_23_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_u3_sinTable_r_23_cmpReg_q <= $unsigned(d_u3_sinTable_r_23_cmp_q);
        end
    end

    // d_u3_sinTable_r_23_sticky_ena(REG,714)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_sinTable_r_23_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_u3_sinTable_r_23_nor_q == 1'b1)
        begin
            d_u3_sinTable_r_23_sticky_ena_q <= $unsigned(d_u3_sinTable_r_23_cmpReg_q);
        end
    end

    // d_u3_sinTable_r_23_enaAnd(LOGICAL,715)@18
    assign d_u3_sinTable_r_23_enaAnd_q = d_u3_sinTable_r_23_sticky_ena_q & VCC_q;

    // d_u3_sinTable_r_23_rdcnt(COUNTER,707)@18 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_sinTable_r_23_rdcnt_i <= 2'd0;
        end
        else
        begin
            d_u3_sinTable_r_23_rdcnt_i <= $unsigned(d_u3_sinTable_r_23_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign d_u3_sinTable_r_23_rdcnt_q = d_u3_sinTable_r_23_rdcnt_i[1:0];

    // u3_sinTable(DUALMEM,167)@16 + 2
    assign u3_sinTable_aa = d_u3_alphaBitSelect_bit_select_merged_b_16_q;
    assign u3_sinTable_ena_NotRstA = ~ (areset);
    assign u3_sinTable_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO_u3_sinTable.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) u3_sinTable_dmem (
        .clocken0(u3_sinTable_ena_NotRstA),
        .sclr(u3_sinTable_reset0),
        .clock0(clk),
        .address_a(u3_sinTable_aa),
        .q_a(u3_sinTable_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign u3_sinTable_r = u3_sinTable_ir[15:0];

    // d_u3_sinTable_r_23_wraddr(REG,708)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_sinTable_r_23_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            d_u3_sinTable_r_23_wraddr_q <= $unsigned(d_u3_sinTable_r_23_rdcnt_q);
        end
    end

    // d_u3_sinTable_r_23_mem(DUALMEM,706)@18 + 2
    assign d_u3_sinTable_r_23_mem_ia = u3_sinTable_r;
    assign d_u3_sinTable_r_23_mem_aa = d_u3_sinTable_r_23_wraddr_q;
    assign d_u3_sinTable_r_23_mem_ab = d_u3_sinTable_r_23_rdcnt_q;
    assign d_u3_sinTable_r_23_mem_ena_OrRstB = areset | d_u3_sinTable_r_23_enaAnd_q[0];
    assign d_u3_sinTable_r_23_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) d_u3_sinTable_r_23_mem_dmem (
        .clocken1(d_u3_sinTable_r_23_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_u3_sinTable_r_23_mem_reset0),
        .clock1(clk),
        .address_a(d_u3_sinTable_r_23_mem_aa),
        .data_a(d_u3_sinTable_r_23_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_u3_sinTable_r_23_mem_ab),
        .q_b(d_u3_sinTable_r_23_mem_iq),
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
    assign d_u3_sinTable_r_23_mem_q = d_u3_sinTable_r_23_mem_iq[15:0];

    // u3_lsSinTable(BITSHIFT,180)@23
    assign u3_lsSinTable_qint = { d_u3_sinTable_r_23_mem_q, 2'b00 };
    assign u3_lsSinTable_q = u3_lsSinTable_qint[17:0];

    // u3_sinAdd(ADD,186)@23 + 1
    assign u3_sinAdd_a = u3_lsSinTable_q;
    assign u3_sinAdd_b = u3_shiftSinB_q;
    assign u3_sinAdd_i = u0_sin_pi_over_4_q;
    assign u3_sinAdd_a1 = d_u3_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? u3_sinAdd_i : u3_sinAdd_a;
    assign u3_sinAdd_b1 = d_u3_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? 18'b0 : u3_sinAdd_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_sinAdd_o <= 18'b0;
        end
        else
        begin
            u3_sinAdd_o <= $unsigned(u3_sinAdd_a1) + $unsigned(u3_sinAdd_b1);
        end
    end
    assign u3_sinAdd_q = u3_sinAdd_o[17:0];

    // u3_roundedSin_trunc(BITSHIFT,517)@24
    assign u3_roundedSin_trunc_qint = u3_sinAdd_q;
    assign u3_roundedSin_trunc_q = u3_roundedSin_trunc_qint[17:1];

    // u3_roundedSin_add(ADD,518)@24 + 1
    assign u3_roundedSin_add_a = $unsigned({3'b000, u3_roundedSin_trunc_q});
    assign u3_roundedSin_add_b = $unsigned({{18{u0_roundedSin_bias_q[1]}}, u0_roundedSin_bias_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_roundedSin_add_o <= 20'b0;
        end
        else
        begin
            u3_roundedSin_add_o <= $unsigned($signed(u3_roundedSin_add_a) + $signed(u3_roundedSin_add_b));
        end
    end
    assign u3_roundedSin_add_q = u3_roundedSin_add_o[18:0];

    // u3_roundedSin_shift(BITSHIFT,519)@25
    assign u3_roundedSin_shift_qint = u3_roundedSin_add_q;
    assign u3_roundedSin_shift_q = u3_roundedSin_shift_qint[18:1];

    // u3_roundedSin_bs(BITSELECT,520)@25
    assign u3_roundedSin_bs_in = u3_roundedSin_shift_q[16:0];
    assign u3_roundedSin_bs_b = u3_roundedSin_bs_in[16:0];

    // u3_sinMult_cma(CHAINMULTADD,208)@18 + 5
    assign u3_sinMult_cma_reset = areset;
    assign u3_sinMult_cma_ena0 = 1'b1;
    assign u3_sinMult_cma_ena1 = u3_sinMult_cma_ena0;
    assign u3_sinMult_cma_ena2 = u3_sinMult_cma_ena0;

    assign u3_sinMult_cma_a0 = u3_sinTable_r;
    assign u3_sinMult_cma_c0 = u3_beta_times_pi_over_4_shifted_b;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) u3_sinMult_cma_DSP0 (
        .clk(clk),
        .ena({ u3_sinMult_cma_ena2, u3_sinMult_cma_ena1, u3_sinMult_cma_ena0 }),
        .clr({ u3_sinMult_cma_reset, u3_sinMult_cma_reset }),
        .ay(u3_sinMult_cma_a0),
        .ax(u3_sinMult_cma_c0),
        .resulta(u3_sinMult_cma_s0),
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
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u3_sinMult_cma_delay0 ( .xin(u3_sinMult_cma_s0), .xout(u3_sinMult_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u3_sinMult_cma_q = $unsigned(u3_sinMult_cma_qq0[31:0]);

    // u3_shiftCosB(BITSHIFT,183)@23
    assign u3_shiftCosB_qint = u3_sinMult_cma_q;
    assign u3_shiftCosB_q = {8'b00000000, u3_shiftCosB_qint[31:22]};

    // d_u3_cosTable_r_23_notEnable(LOGICAL,722)@18
    assign d_u3_cosTable_r_23_notEnable_q = $unsigned(~ (VCC_q));

    // d_u3_cosTable_r_23_nor(LOGICAL,723)@18
    assign d_u3_cosTable_r_23_nor_q = ~ (d_u3_cosTable_r_23_notEnable_q | d_u3_cosTable_r_23_sticky_ena_q);

    // d_u3_cosTable_r_23_mem_last(CONSTANT,719)
    assign d_u3_cosTable_r_23_mem_last_q = $unsigned(3'b010);

    // d_u3_cosTable_r_23_cmp(LOGICAL,720)@18
    assign d_u3_cosTable_r_23_cmp_b = {1'b0, d_u3_cosTable_r_23_rdcnt_q};
    assign d_u3_cosTable_r_23_cmp_q = $unsigned(d_u3_cosTable_r_23_mem_last_q == d_u3_cosTable_r_23_cmp_b ? 1'b1 : 1'b0);

    // d_u3_cosTable_r_23_cmpReg(REG,721)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_cosTable_r_23_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_u3_cosTable_r_23_cmpReg_q <= $unsigned(d_u3_cosTable_r_23_cmp_q);
        end
    end

    // d_u3_cosTable_r_23_sticky_ena(REG,724)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_cosTable_r_23_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_u3_cosTable_r_23_nor_q == 1'b1)
        begin
            d_u3_cosTable_r_23_sticky_ena_q <= $unsigned(d_u3_cosTable_r_23_cmpReg_q);
        end
    end

    // d_u3_cosTable_r_23_enaAnd(LOGICAL,725)@18
    assign d_u3_cosTable_r_23_enaAnd_q = d_u3_cosTable_r_23_sticky_ena_q & VCC_q;

    // d_u3_cosTable_r_23_rdcnt(COUNTER,717)@18 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_cosTable_r_23_rdcnt_i <= 2'd0;
        end
        else
        begin
            d_u3_cosTable_r_23_rdcnt_i <= $unsigned(d_u3_cosTable_r_23_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign d_u3_cosTable_r_23_rdcnt_q = d_u3_cosTable_r_23_rdcnt_i[1:0];

    // d_u3_cosTable_r_23_wraddr(REG,718)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u3_cosTable_r_23_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            d_u3_cosTable_r_23_wraddr_q <= $unsigned(d_u3_cosTable_r_23_rdcnt_q);
        end
    end

    // d_u3_cosTable_r_23_mem(DUALMEM,716)@18 + 2
    assign d_u3_cosTable_r_23_mem_ia = u3_cosTable_r;
    assign d_u3_cosTable_r_23_mem_aa = d_u3_cosTable_r_23_wraddr_q;
    assign d_u3_cosTable_r_23_mem_ab = d_u3_cosTable_r_23_rdcnt_q;
    assign d_u3_cosTable_r_23_mem_ena_OrRstB = areset | d_u3_cosTable_r_23_enaAnd_q[0];
    assign d_u3_cosTable_r_23_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) d_u3_cosTable_r_23_mem_dmem (
        .clocken1(d_u3_cosTable_r_23_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_u3_cosTable_r_23_mem_reset0),
        .clock1(clk),
        .address_a(d_u3_cosTable_r_23_mem_aa),
        .data_a(d_u3_cosTable_r_23_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_u3_cosTable_r_23_mem_ab),
        .q_b(d_u3_cosTable_r_23_mem_iq),
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
    assign d_u3_cosTable_r_23_mem_q = d_u3_cosTable_r_23_mem_iq[15:0];

    // u3_lsCosTable(BITSHIFT,181)@23
    assign u3_lsCosTable_qint = { d_u3_cosTable_r_23_mem_q, 2'b00 };
    assign u3_lsCosTable_q = u3_lsCosTable_qint[17:0];

    // u3_cosSub(SUB,187)@23 + 1
    assign u3_cosSub_a = $unsigned(u3_lsCosTable_q);
    assign u3_cosSub_b = $unsigned(u3_shiftCosB_q);
    assign u3_cosSub_i = $unsigned(u0_sin_pi_over_4_q);
    assign u3_cosSub_a1 = d_u3_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? u3_cosSub_i : u3_cosSub_a;
    assign u3_cosSub_b1 = d_u3_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? 18'b0 : u3_cosSub_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_cosSub_o <= 18'b0;
        end
        else
        begin
            u3_cosSub_o <= $unsigned($signed(u3_cosSub_a1) - $signed(u3_cosSub_b1));
        end
    end
    assign u3_cosSub_q = u3_cosSub_o[17:0];

    // u3_roundedCos_trunc(BITSHIFT,522)@24
    assign u3_roundedCos_trunc_qint = u3_cosSub_q;
    assign u3_roundedCos_trunc_q = u3_roundedCos_trunc_qint[17:1];

    // u3_roundedCos_add(ADD,523)@24 + 1
    assign u3_roundedCos_add_a = $unsigned({3'b000, u3_roundedCos_trunc_q});
    assign u3_roundedCos_add_b = $unsigned({{18{u0_roundedSin_bias_q[1]}}, u0_roundedSin_bias_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_roundedCos_add_o <= 20'b0;
        end
        else
        begin
            u3_roundedCos_add_o <= $unsigned($signed(u3_roundedCos_add_a) + $signed(u3_roundedCos_add_b));
        end
    end
    assign u3_roundedCos_add_q = u3_roundedCos_add_o[18:0];

    // u3_roundedCos_shift(BITSHIFT,524)@25
    assign u3_roundedCos_shift_qint = u3_roundedCos_add_q;
    assign u3_roundedCos_shift_q = u3_roundedCos_shift_qint[18:1];

    // u3_roundedCos_bs(BITSELECT,525)@25
    assign u3_roundedCos_bs_in = u3_roundedCos_shift_q[16:0];
    assign u3_roundedCos_bs_b = u3_roundedCos_bs_in[16:0];

    // u3_doSwap(LOOKUP,190)@24 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_doSwap_q <= $unsigned(1'b0);
        end
        else
        begin
            unique case (d_u3_octantBitSelect_b_24_q)
                3'b000 : u3_doSwap_q <= 1'b0;
                3'b001 : u3_doSwap_q <= 1'b1;
                3'b010 : u3_doSwap_q <= 1'b1;
                3'b011 : u3_doSwap_q <= 1'b0;
                3'b100 : u3_doSwap_q <= 1'b0;
                3'b101 : u3_doSwap_q <= 1'b1;
                3'b110 : u3_doSwap_q <= 1'b1;
                3'b111 : u3_doSwap_q <= 1'b0;
                default : begin
                              // unreachable
                              u3_doSwap_q <= 1'bx;
                          end
            endcase
        end
    end

    // u3_cosSwapMux(MUX,198)@25 + 1
    assign u3_cosSwapMux_s = u3_doSwap_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_cosSwapMux_q <= 17'b0;
        end
        else
        begin
            unique case (u3_cosSwapMux_s)
                1'b0 : u3_cosSwapMux_q <= u3_roundedCos_bs_b;
                1'b1 : u3_cosSwapMux_q <= u3_roundedSin_bs_b;
                default : u3_cosSwapMux_q <= 17'b0;
            endcase
        end
    end

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // u3_cosInvert(SUB,200)@26 + 1
    assign u3_cosInvert_a = $unsigned({{15{GND_q[0]}}, GND_q});
    assign u3_cosInvert_b = $unsigned(u3_cosSwapMux_q[15:0]);
    assign u3_cosInvert_i = u3_cosInvert_b;
    assign u3_cosInvert_a1 = u3_doCosInvert_q == 1'b1 ? u3_cosInvert_i : u3_cosInvert_a;
    assign u3_cosInvert_b1 = u3_doCosInvert_q == 1'b1 ? 16'b0 : u3_cosInvert_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_cosInvert_o <= 16'b0;
        end
        else
        begin
            u3_cosInvert_o <= $unsigned($signed(u3_cosInvert_a1) - $signed(u3_cosInvert_b1));
        end
    end
    assign u3_cosInvert_q = u3_cosInvert_o[15:0];

    // u2_phaseIncrRegLookup_1(LOOKUP,17)@10 + 1
    assign u2_phaseIncrRegLookup_1_c = busIn_write;
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u2_phaseIncrRegLookup_1_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00001100100101 : u2_phaseIncrRegLookup_1_e <= u2_phaseIncrRegLookup_1_c;
                default : u2_phaseIncrRegLookup_1_e <= 1'b0;
            endcase
        end
    end

    // u2_phaseIncrReg_p1(SYNCREG,18)@11 + 1
    assign u2_phaseIncrReg_p1_a = d_busIn_writedata_11_q;
    assign u2_phaseIncrReg_p1_b = u2_phaseIncrRegLookup_1_e;
    dspba_sync_reg_ver #( .width1(32), .width2(2), .init_value(32'b00000000000000000000000000000010), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    u2_phaseIncrReg_p1 ( .xin(u2_phaseIncrReg_p1_a), .ena(u2_phaseIncrReg_p1_b), .clk1(bus_clk), .aclr1(bus_areset), .sxout(u2_phaseIncrReg_p1_v), .clk2(clk), .aclr2(areset), .xout() );

    // u2_phaseIncrRegLookup_0(LOOKUP,15)@10 + 1
    assign u2_phaseIncrRegLookup_0_c = busIn_write;
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u2_phaseIncrRegLookup_0_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00001100100100 : u2_phaseIncrRegLookup_0_e <= u2_phaseIncrRegLookup_0_c;
                default : u2_phaseIncrRegLookup_0_e <= 1'b0;
            endcase
        end
    end

    // u2_phaseIncrReg_p0(SYNCREG,16)@11 + 1
    assign u2_phaseIncrReg_p0_a = d_busIn_writedata_11_q;
    assign u2_phaseIncrReg_p0_b = u2_phaseIncrRegLookup_0_e;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00011010000010101010101010101010), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    u2_phaseIncrReg_p0 ( .xin(u2_phaseIncrReg_p0_a), .ena(u2_phaseIncrReg_p0_b), .clk1(bus_clk), .aclr1(bus_areset), .sxout(u2_phaseIncrReg_p0_v), .clk2(clk), .aclr2(areset), .xout() );

    // u2_phaseIncrMem(BITJOIN,19)@12
    assign u2_phaseIncrMem_q = {u2_phaseIncrReg_p1_v, u2_phaseIncrReg_p0_v};

    // u2_invertSin_bit_select_merged(BITSELECT,528)@10
    assign u2_invertSin_bit_select_merged_b = u2_phaseIncrMem_q[33:33];
    assign u2_invertSin_bit_select_merged_c = u2_phaseIncrMem_q[32:32];
    assign u2_invertSin_bit_select_merged_d = u2_phaseIncrMem_q[19:0];
    assign u2_invertSin_bit_select_merged_e = u2_phaseIncrMem_q[31:20];

    // d_u2_invertSin_bit_select_merged_c_25(DELAY,623)@10 + 15
    dspba_delay_ver #( .width(1), .depth(15), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u2_invertSin_bit_select_merged_c_25 ( .xin(u2_invertSin_bit_select_merged_c), .xout(d_u2_invertSin_bit_select_merged_c_25_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u2_accumAdd_b1_BitSelect_for_v(BITSELECT,296)@10
    assign u2_accumAdd_b1_BitSelect_for_v_b = xIn_p_2[19:0];
    assign u2_accumAdd_b1_BitSelect_for_v_c = xIn_p_2[31:20];

    // u2_accumAdd_b1_p1_of_2(ADD,297)@10 + 1
    assign u2_accumAdd_b1_p1_of_2_a = {1'b0, u2_accumAdd_b1_p1_of_2_q};
    assign u2_accumAdd_b1_p1_of_2_b = {1'b0, u2_invertSin_bit_select_merged_d};
    assign u2_accumAdd_b1_p1_of_2_i = $unsigned({ 1'b0, u2_accumAdd_b1_BitSelect_for_v_b });
    assign u2_accumAdd_b1_p1_of_2_a1 = xIn_s_2 == 1'b1 ? u2_accumAdd_b1_p1_of_2_i : u2_accumAdd_b1_p1_of_2_a;
    assign u2_accumAdd_b1_p1_of_2_b1 = xIn_s_2 == 1'b1 ? 21'b0 : u2_accumAdd_b1_p1_of_2_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_accumAdd_b1_p1_of_2_o <= 21'b0;
        end
        else if (xIn_v == 1'b1)
        begin
            u2_accumAdd_b1_p1_of_2_o <= $unsigned(u2_accumAdd_b1_p1_of_2_a1) + $unsigned(u2_accumAdd_b1_p1_of_2_b1);
        end
    end
    assign u2_accumAdd_b1_p1_of_2_c[0] = u2_accumAdd_b1_p1_of_2_o[20];
    assign u2_accumAdd_b1_p1_of_2_q = u2_accumAdd_b1_p1_of_2_o[19:0];

    // d_u2_accumAdd_b1_BitSelect_for_v_c_11(DELAY,596)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_accumAdd_b1_BitSelect_for_v_c_11_q <= '0;
        end
        else
        begin
            d_u2_accumAdd_b1_BitSelect_for_v_c_11_q <= u2_accumAdd_b1_BitSelect_for_v_c;
        end
    end

    // d_xIn_s_2_11(DELAY,551)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_s_2_11_q <= '0;
        end
        else
        begin
            d_xIn_s_2_11_q <= $unsigned(xIn_s_2);
        end
    end

    // d_u2_invertSin_bit_select_merged_e_11(DELAY,624)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_invertSin_bit_select_merged_e_11_q <= '0;
        end
        else
        begin
            d_u2_invertSin_bit_select_merged_e_11_q <= u2_invertSin_bit_select_merged_e;
        end
    end

    // u2_accumAdd_b1_p2_of_2(ADD,298)@11 + 1
    assign u2_accumAdd_b1_p2_of_2_cin = u2_accumAdd_b1_p1_of_2_c;
    assign u2_accumAdd_b1_p2_of_2_a = { {1'b0, u2_accumAdd_b1_p2_of_2_q}, 1'b1 };
    assign u2_accumAdd_b1_p2_of_2_b = { {1'b0, d_u2_invertSin_bit_select_merged_e_11_q}, u2_accumAdd_b1_p2_of_2_cin[0] };
    assign u2_accumAdd_b1_p2_of_2_i = $unsigned({ 1'b0, d_u2_accumAdd_b1_BitSelect_for_v_c_11_q, 1'b0 });
    assign u2_accumAdd_b1_p2_of_2_a1 = d_xIn_s_2_11_q == 1'b1 ? u2_accumAdd_b1_p2_of_2_i : u2_accumAdd_b1_p2_of_2_a;
    assign u2_accumAdd_b1_p2_of_2_b1 = d_xIn_s_2_11_q == 1'b1 ? 14'b0 : u2_accumAdd_b1_p2_of_2_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_accumAdd_b1_p2_of_2_o <= 14'b0;
        end
        else if (d_xIn_v_11_q == 1'b1)
        begin
            u2_accumAdd_b1_p2_of_2_o <= $unsigned(u2_accumAdd_b1_p2_of_2_a1) + $unsigned(u2_accumAdd_b1_p2_of_2_b1);
        end
    end
    assign u2_accumAdd_b1_p2_of_2_q = u2_accumAdd_b1_p2_of_2_o[12:1];

    // d_u2_accumAdd_b1_p1_of_2_q_12(DELAY,597)@11 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_accumAdd_b1_p1_of_2_q_12_q <= '0;
        end
        else
        begin
            d_u2_accumAdd_b1_p1_of_2_q_12_q <= $unsigned(u2_accumAdd_b1_p1_of_2_q);
        end
    end

    // u2_accumAdd_b1_BitJoin_for_q(BITJOIN,299)@12
    assign u2_accumAdd_b1_BitJoin_for_q_q = {u2_accumAdd_b1_p2_of_2_q, d_u2_accumAdd_b1_p1_of_2_q_12_q};

    // u2_octantBitSelect(BITSELECT,117)@12
    assign u2_octantBitSelect_b = u2_accumAdd_b1_BitJoin_for_q_q[31:29];

    // d_u2_octantBitSelect_b_24(DELAY,566)@12 + 12
    dspba_delay_ver #( .width(3), .depth(12), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u2_octantBitSelect_b_24 ( .xin(u2_octantBitSelect_b), .xout(d_u2_octantBitSelect_b_24_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // d_u2_octantBitSelect_b_25(DELAY,567)@24 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_octantBitSelect_b_25_q <= '0;
        end
        else
        begin
            d_u2_octantBitSelect_b_25_q <= d_u2_octantBitSelect_b_24_q;
        end
    end

    // u2_cosJoin(BITJOIN,152)@25
    assign u2_cosJoin_q = {d_u2_invertSin_bit_select_merged_c_25_q, d_u2_octantBitSelect_b_25_q};

    // u2_doCosInvert(LOOKUP,153)@25 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_doCosInvert_q <= $unsigned(1'b1);
        end
        else
        begin
            unique case (u2_cosJoin_q)
                4'b0000 : u2_doCosInvert_q <= 1'b1;
                4'b0001 : u2_doCosInvert_q <= 1'b1;
                4'b0010 : u2_doCosInvert_q <= 1'b0;
                4'b0011 : u2_doCosInvert_q <= 1'b0;
                4'b0100 : u2_doCosInvert_q <= 1'b0;
                4'b0101 : u2_doCosInvert_q <= 1'b0;
                4'b0110 : u2_doCosInvert_q <= 1'b1;
                4'b0111 : u2_doCosInvert_q <= 1'b1;
                4'b1000 : u2_doCosInvert_q <= 1'b0;
                4'b1001 : u2_doCosInvert_q <= 1'b0;
                4'b1010 : u2_doCosInvert_q <= 1'b1;
                4'b1011 : u2_doCosInvert_q <= 1'b1;
                4'b1100 : u2_doCosInvert_q <= 1'b1;
                4'b1101 : u2_doCosInvert_q <= 1'b1;
                4'b1110 : u2_doCosInvert_q <= 1'b0;
                4'b1111 : u2_doCosInvert_q <= 1'b0;
                default : begin
                              // unreachable
                              u2_doCosInvert_q <= 1'bx;
                          end
            endcase
        end
    end

    // u2_addnsubConst(LOOKUP,119)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_addnsubConst_q <= $unsigned(1'b1);
        end
        else
        begin
            unique case (u2_octantBitSelect_b)
                3'b000 : u2_addnsubConst_q <= 1'b1;
                3'b001 : u2_addnsubConst_q <= 1'b0;
                3'b010 : u2_addnsubConst_q <= 1'b1;
                3'b011 : u2_addnsubConst_q <= 1'b0;
                3'b100 : u2_addnsubConst_q <= 1'b1;
                3'b101 : u2_addnsubConst_q <= 1'b0;
                3'b110 : u2_addnsubConst_q <= 1'b1;
                3'b111 : u2_addnsubConst_q <= 1'b0;
                default : begin
                              // unreachable
                              u2_addnsubConst_q <= 1'bx;
                          end
            endcase
        end
    end

    // d_u2_addnsubConst_q_14(DELAY,568)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_addnsubConst_q_14_q <= '0;
        end
        else
        begin
            d_u2_addnsubConst_q_14_q <= $unsigned(u2_addnsubConst_q);
        end
    end

    // d_u2_accumAdd_b1_p1_of_2_q_13(DELAY,598)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_accumAdd_b1_p1_of_2_q_13_q <= '0;
        end
        else
        begin
            d_u2_accumAdd_b1_p1_of_2_q_13_q <= $unsigned(d_u2_accumAdd_b1_p1_of_2_q_12_q);
        end
    end

    // u2_rangeAddSub_p1_of_2(ADDSUB,306)@13 + 1
    assign u2_rangeAddSub_p1_of_2_s = u2_addnsubConst_q;
    assign u2_rangeAddSub_p1_of_2_a = $unsigned({1'b0, u0_rangeAddSub_BitSelect_for_a_b_const_q});
    assign u2_rangeAddSub_p1_of_2_b = $unsigned({1'b0, d_u2_accumAdd_b1_p1_of_2_q_13_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_rangeAddSub_p1_of_2_o <= 21'b0;
        end
        else
        begin
            if (u2_rangeAddSub_p1_of_2_s == 1'b1)
            begin
                u2_rangeAddSub_p1_of_2_o <= $unsigned($signed(u2_rangeAddSub_p1_of_2_a) + $signed(u2_rangeAddSub_p1_of_2_b));
            end
            else
            begin
                u2_rangeAddSub_p1_of_2_o <= $unsigned($signed(u2_rangeAddSub_p1_of_2_a) - $signed(u2_rangeAddSub_p1_of_2_b));
            end
        end
    end
    assign u2_rangeAddSub_p1_of_2_c[0] = u2_rangeAddSub_p1_of_2_o[20];
    assign u2_rangeAddSub_p1_of_2_q = u2_rangeAddSub_p1_of_2_o[19:0];

    // d_u2_accumAdd_b1_p2_of_2_q_14(DELAY,599)@12 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_accumAdd_b1_p2_of_2_q_14_delay_0 <= '0;
        end
        else
        begin
            d_u2_accumAdd_b1_p2_of_2_q_14_delay_0 <= $unsigned(u2_accumAdd_b1_p2_of_2_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u2_accumAdd_b1_p2_of_2_q_14_q <= d_u2_accumAdd_b1_p2_of_2_q_14_delay_0;
        end
    end

    // u2_rangeAddSub_BitSelect_for_b_BitJoin_for_c(BITJOIN,440)@14
    assign u2_rangeAddSub_BitSelect_for_b_BitJoin_for_c_q = {u0_rangeAddSub_UpperBits_for_b_q, d_u2_accumAdd_b1_p2_of_2_q_14_q};

    // u2_rangeAddSub_p2_of_2(ADDSUB,307)@14 + 1
    assign u2_rangeAddSub_p2_of_2_s = d_u2_addnsubConst_q_14_q;
    assign u2_rangeAddSub_p2_of_2_cin = u2_rangeAddSub_p1_of_2_c;
    assign u2_rangeAddSub_p2_of_2_a = $unsigned({ {1'b0, u0_rangeAddSub_BitSelect_for_a_c_const_q}, d_u2_addnsubConst_q_14_q[0] });
    assign u2_rangeAddSub_p2_of_2_b = $unsigned({ {1'b0, u2_rangeAddSub_BitSelect_for_b_BitJoin_for_c_q}, u2_rangeAddSub_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_rangeAddSub_p2_of_2_o <= 16'b0;
        end
        else
        begin
            if (u2_rangeAddSub_p2_of_2_s == 1'b1)
            begin
                u2_rangeAddSub_p2_of_2_o <= $unsigned($signed(u2_rangeAddSub_p2_of_2_a) + $signed(u2_rangeAddSub_p2_of_2_b));
            end
            else
            begin
                u2_rangeAddSub_p2_of_2_o <= $unsigned($signed(u2_rangeAddSub_p2_of_2_a) - $signed(u2_rangeAddSub_p2_of_2_b));
            end
        end
    end
    assign u2_rangeAddSub_p2_of_2_q = u2_rangeAddSub_p2_of_2_o[14:1];

    // d_u2_rangeAddSub_p1_of_2_q_15(DELAY,600)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_rangeAddSub_p1_of_2_q_15_q <= '0;
        end
        else
        begin
            d_u2_rangeAddSub_p1_of_2_q_15_q <= $unsigned(u2_rangeAddSub_p1_of_2_q);
        end
    end

    // u2_rangeAddSub_BitJoin_for_q(BITJOIN,308)@15
    assign u2_rangeAddSub_BitJoin_for_q_q = {u2_rangeAddSub_p2_of_2_q, d_u2_rangeAddSub_p1_of_2_q_15_q};

    // u2_alphaBitSelect_bit_select_merged(BITSELECT,532)@15
    assign u2_alphaBitSelect_bit_select_merged_in = u2_rangeAddSub_BitJoin_for_q_q[29:0];
    assign u2_alphaBitSelect_bit_select_merged_b = u2_alphaBitSelect_bit_select_merged_in[28:21];
    assign u2_alphaBitSelect_bit_select_merged_c = u2_alphaBitSelect_bit_select_merged_in[29:29];
    assign u2_alphaBitSelect_bit_select_merged_d = u2_alphaBitSelect_bit_select_merged_in[20:0];

    // d_u2_alphaBitSelect_bit_select_merged_c_23(DELAY,633)@15 + 8
    dspba_delay_ver #( .width(1), .depth(8), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u2_alphaBitSelect_bit_select_merged_c_23 ( .xin(u2_alphaBitSelect_bit_select_merged_c), .xout(d_u2_alphaBitSelect_bit_select_merged_c_23_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u2_ls4(BITSHIFT,130)@15
    assign u2_ls4_qint = { u2_alphaBitSelect_bit_select_merged_d, 4'b0000 };
    assign u2_ls4_q = u2_ls4_qint[24:0];

    // u2_cm2_BitExpansion_for_b(BITJOIN,320)@15
    assign u2_cm2_BitExpansion_for_b_q = {u0_cm2_UpperBits_for_b_q, u2_ls4_q};

    // u2_cm2_BitSelect_for_b(BITSELECT,323)@15
    assign u2_cm2_BitSelect_for_b_b = u2_cm2_BitExpansion_for_b_q[19:0];
    assign u2_cm2_BitSelect_for_b_c = u2_cm2_BitExpansion_for_b_q[28:20];

    // u2_ls7(BITSHIFT,129)@15
    assign u2_ls7_qint = { u2_alphaBitSelect_bit_select_merged_d, 7'b0000000 };
    assign u2_ls7_q = u2_ls7_qint[27:0];

    // u2_cm2_BitExpansion_for_a(BITJOIN,318)@15
    assign u2_cm2_BitExpansion_for_a_q = {GND_q, u2_ls7_q};

    // u2_cm2_BitSelect_for_a(BITSELECT,322)@15
    assign u2_cm2_BitSelect_for_a_b = u2_cm2_BitExpansion_for_a_q[19:0];
    assign u2_cm2_BitSelect_for_a_c = u2_cm2_BitExpansion_for_a_q[28:20];

    // u2_cm2_p1_of_2(ADD,324)@15 + 1
    assign u2_cm2_p1_of_2_a = {1'b0, u2_cm2_BitSelect_for_a_b};
    assign u2_cm2_p1_of_2_b = {1'b0, u2_cm2_BitSelect_for_b_b};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_cm2_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u2_cm2_p1_of_2_o <= $unsigned(u2_cm2_p1_of_2_a) + $unsigned(u2_cm2_p1_of_2_b);
        end
    end
    assign u2_cm2_p1_of_2_c[0] = u2_cm2_p1_of_2_o[20];
    assign u2_cm2_p1_of_2_q = u2_cm2_p1_of_2_o[19:0];

    // u2_ls10(BITSHIFT,127)@15
    assign u2_ls10_qint = { u2_alphaBitSelect_bit_select_merged_d, 10'b0000000000 };
    assign u2_ls10_q = u2_ls10_qint[30:0];

    // u2_cm1_BitExpansion_for_b(BITJOIN,311)@15
    assign u2_cm1_BitExpansion_for_b_q = {u0_cm1_UpperBits_for_b_q, u2_ls10_q};

    // u2_cm1_BitSelect_for_b(BITSELECT,314)@15
    assign u2_cm1_BitSelect_for_b_b = u2_cm1_BitExpansion_for_b_q[19:0];
    assign u2_cm1_BitSelect_for_b_c = u2_cm1_BitExpansion_for_b_q[33:20];

    // u2_ls12(BITSHIFT,126)@15
    assign u2_ls12_qint = { u2_alphaBitSelect_bit_select_merged_d, 12'b000000000000 };
    assign u2_ls12_q = u2_ls12_qint[32:0];

    // u2_cm1_BitExpansion_for_a(BITJOIN,309)@15
    assign u2_cm1_BitExpansion_for_a_q = {GND_q, u2_ls12_q};

    // u2_cm1_BitSelect_for_a(BITSELECT,313)@15
    assign u2_cm1_BitSelect_for_a_b = u2_cm1_BitExpansion_for_a_q[19:0];
    assign u2_cm1_BitSelect_for_a_c = u2_cm1_BitExpansion_for_a_q[33:20];

    // u2_cm1_p1_of_2(SUB,315)@15 + 1
    assign u2_cm1_p1_of_2_a = $unsigned({1'b0, u2_cm1_BitSelect_for_a_b});
    assign u2_cm1_p1_of_2_b = $unsigned({1'b0, u2_cm1_BitSelect_for_b_b});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_cm1_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u2_cm1_p1_of_2_o <= $unsigned($signed(u2_cm1_p1_of_2_a) - $signed(u2_cm1_p1_of_2_b));
        end
    end
    assign u2_cm1_p1_of_2_c[0] = u2_cm1_p1_of_2_o[20];
    assign u2_cm1_p1_of_2_q = u2_cm1_p1_of_2_o[19:0];

    // u2_cm3_p1_of_2(ADD,333)@16 + 1
    assign u2_cm3_p1_of_2_a = {1'b0, u2_cm1_p1_of_2_q};
    assign u2_cm3_p1_of_2_b = {1'b0, u2_cm2_p1_of_2_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_cm3_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u2_cm3_p1_of_2_o <= $unsigned(u2_cm3_p1_of_2_a) + $unsigned(u2_cm3_p1_of_2_b);
        end
    end
    assign u2_cm3_p1_of_2_c[0] = u2_cm3_p1_of_2_o[20];
    assign u2_cm3_p1_of_2_q = u2_cm3_p1_of_2_o[19:0];

    // d_u2_cm2_BitSelect_for_b_c_16(DELAY,604)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_cm2_BitSelect_for_b_c_16_q <= '0;
        end
        else
        begin
            d_u2_cm2_BitSelect_for_b_c_16_q <= u2_cm2_BitSelect_for_b_c;
        end
    end

    // d_u2_cm2_BitSelect_for_a_c_16(DELAY,603)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_cm2_BitSelect_for_a_c_16_q <= '0;
        end
        else
        begin
            d_u2_cm2_BitSelect_for_a_c_16_q <= u2_cm2_BitSelect_for_a_c;
        end
    end

    // u2_cm2_p2_of_2(ADD,325)@16 + 1
    assign u2_cm2_p2_of_2_cin = u2_cm2_p1_of_2_c;
    assign u2_cm2_p2_of_2_a = { {1'b0, d_u2_cm2_BitSelect_for_a_c_16_q}, 1'b1 };
    assign u2_cm2_p2_of_2_b = { {1'b0, d_u2_cm2_BitSelect_for_b_c_16_q}, u2_cm2_p2_of_2_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_cm2_p2_of_2_o <= 11'b0;
        end
        else
        begin
            u2_cm2_p2_of_2_o <= $unsigned(u2_cm2_p2_of_2_a) + $unsigned(u2_cm2_p2_of_2_b);
        end
    end
    assign u2_cm2_p2_of_2_q = u2_cm2_p2_of_2_o[9:1];

    // u2_cm3_BitSelect_for_b_BitJoin_for_c(BITJOIN,450)@17
    assign u2_cm3_BitSelect_for_b_BitJoin_for_c_q = {u0_cm3_UpperBits_for_b_q, u2_cm2_p2_of_2_q};

    // d_u2_cm1_BitSelect_for_b_c_16(DELAY,602)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_cm1_BitSelect_for_b_c_16_q <= '0;
        end
        else
        begin
            d_u2_cm1_BitSelect_for_b_c_16_q <= u2_cm1_BitSelect_for_b_c;
        end
    end

    // d_u2_cm1_BitSelect_for_a_c_16(DELAY,601)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_cm1_BitSelect_for_a_c_16_q <= '0;
        end
        else
        begin
            d_u2_cm1_BitSelect_for_a_c_16_q <= u2_cm1_BitSelect_for_a_c;
        end
    end

    // u2_cm1_p2_of_2(SUB,316)@16 + 1
    assign u2_cm1_p2_of_2_cin = u2_cm1_p1_of_2_c;
    assign u2_cm1_p2_of_2_a = $unsigned({ {1'b0, d_u2_cm1_BitSelect_for_a_c_16_q}, 1'b0 });
    assign u2_cm1_p2_of_2_b = $unsigned({ {1'b0, d_u2_cm1_BitSelect_for_b_c_16_q}, u2_cm1_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_cm1_p2_of_2_o <= 16'b0;
        end
        else
        begin
            u2_cm1_p2_of_2_o <= $unsigned($signed(u2_cm1_p2_of_2_a) - $signed(u2_cm1_p2_of_2_b));
        end
    end
    assign u2_cm1_p2_of_2_q = u2_cm1_p2_of_2_o[14:1];

    // u2_cm3_BitSelect_for_a_BitJoin_for_c(BITJOIN,445)@17
    assign u2_cm3_BitSelect_for_a_BitJoin_for_c_q = {GND_q, u2_cm1_p2_of_2_q};

    // u2_cm3_p2_of_2(ADD,334)@17 + 1
    assign u2_cm3_p2_of_2_cin = u2_cm3_p1_of_2_c;
    assign u2_cm3_p2_of_2_a = { {1'b0, u2_cm3_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign u2_cm3_p2_of_2_b = { {1'b0, u2_cm3_BitSelect_for_b_BitJoin_for_c_q}, u2_cm3_p2_of_2_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_cm3_p2_of_2_o <= 17'b0;
        end
        else
        begin
            u2_cm3_p2_of_2_o <= $unsigned(u2_cm3_p2_of_2_a) + $unsigned(u2_cm3_p2_of_2_b);
        end
    end
    assign u2_cm3_p2_of_2_q = u2_cm3_p2_of_2_o[15:1];

    // d_u2_cm3_p1_of_2_q_18(DELAY,605)@17 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_cm3_p1_of_2_q_18_q <= '0;
        end
        else
        begin
            d_u2_cm3_p1_of_2_q_18_q <= $unsigned(u2_cm3_p1_of_2_q);
        end
    end

    // u2_cm3_BitJoin_for_q(BITJOIN,335)@18
    assign u2_cm3_BitJoin_for_q_q = {u2_cm3_p2_of_2_q, d_u2_cm3_p1_of_2_q_18_q};

    // u2_beta_times_4_shift(BITSHIFT,133)@18
    assign u2_beta_times_4_shift_qint = { u2_cm3_BitJoin_for_q_q, 3'b000 };
    assign u2_beta_times_4_shift_q = u2_beta_times_4_shift_qint[37:0];

    // u2_beta_times_pi_over_4_shifted(BITSELECT,134)@18
    assign u2_beta_times_pi_over_4_shifted_in = u2_beta_times_4_shift_q[35:0];
    assign u2_beta_times_pi_over_4_shifted_b = u2_beta_times_pi_over_4_shifted_in[35:20];

    // d_u2_alphaBitSelect_bit_select_merged_b_16(DELAY,632)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_alphaBitSelect_bit_select_merged_b_16_q <= '0;
        end
        else
        begin
            d_u2_alphaBitSelect_bit_select_merged_b_16_q <= u2_alphaBitSelect_bit_select_merged_b;
        end
    end

    // u2_cosTable(DUALMEM,125)@16 + 2
    assign u2_cosTable_aa = d_u2_alphaBitSelect_bit_select_merged_b_16_q;
    assign u2_cosTable_ena_NotRstA = ~ (areset);
    assign u2_cosTable_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO_u2_cosTable.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) u2_cosTable_dmem (
        .clocken0(u2_cosTable_ena_NotRstA),
        .sclr(u2_cosTable_reset0),
        .clock0(clk),
        .address_a(u2_cosTable_aa),
        .q_a(u2_cosTable_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign u2_cosTable_r = u2_cosTable_ir[15:0];

    // u2_cosMult_cma(CHAINMULTADD,207)@18 + 5
    assign u2_cosMult_cma_reset = areset;
    assign u2_cosMult_cma_ena0 = 1'b1;
    assign u2_cosMult_cma_ena1 = u2_cosMult_cma_ena0;
    assign u2_cosMult_cma_ena2 = u2_cosMult_cma_ena0;

    assign u2_cosMult_cma_a0 = u2_cosTable_r;
    assign u2_cosMult_cma_c0 = u2_beta_times_pi_over_4_shifted_b;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) u2_cosMult_cma_DSP0 (
        .clk(clk),
        .ena({ u2_cosMult_cma_ena2, u2_cosMult_cma_ena1, u2_cosMult_cma_ena0 }),
        .clr({ u2_cosMult_cma_reset, u2_cosMult_cma_reset }),
        .ay(u2_cosMult_cma_a0),
        .ax(u2_cosMult_cma_c0),
        .resulta(u2_cosMult_cma_s0),
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
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u2_cosMult_cma_delay0 ( .xin(u2_cosMult_cma_s0), .xout(u2_cosMult_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u2_cosMult_cma_q = $unsigned(u2_cosMult_cma_qq0[31:0]);

    // u2_shiftSinB(BITSHIFT,139)@23
    assign u2_shiftSinB_qint = u2_cosMult_cma_q;
    assign u2_shiftSinB_q = {8'b00000000, u2_shiftSinB_qint[31:22]};

    // d_u2_sinTable_r_23_notEnable(LOGICAL,692)@18
    assign d_u2_sinTable_r_23_notEnable_q = $unsigned(~ (VCC_q));

    // d_u2_sinTable_r_23_nor(LOGICAL,693)@18
    assign d_u2_sinTable_r_23_nor_q = ~ (d_u2_sinTable_r_23_notEnable_q | d_u2_sinTable_r_23_sticky_ena_q);

    // d_u2_sinTable_r_23_mem_last(CONSTANT,689)
    assign d_u2_sinTable_r_23_mem_last_q = $unsigned(3'b010);

    // d_u2_sinTable_r_23_cmp(LOGICAL,690)@18
    assign d_u2_sinTable_r_23_cmp_b = {1'b0, d_u2_sinTable_r_23_rdcnt_q};
    assign d_u2_sinTable_r_23_cmp_q = $unsigned(d_u2_sinTable_r_23_mem_last_q == d_u2_sinTable_r_23_cmp_b ? 1'b1 : 1'b0);

    // d_u2_sinTable_r_23_cmpReg(REG,691)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_sinTable_r_23_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_u2_sinTable_r_23_cmpReg_q <= $unsigned(d_u2_sinTable_r_23_cmp_q);
        end
    end

    // d_u2_sinTable_r_23_sticky_ena(REG,694)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_sinTable_r_23_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_u2_sinTable_r_23_nor_q == 1'b1)
        begin
            d_u2_sinTable_r_23_sticky_ena_q <= $unsigned(d_u2_sinTable_r_23_cmpReg_q);
        end
    end

    // d_u2_sinTable_r_23_enaAnd(LOGICAL,695)@18
    assign d_u2_sinTable_r_23_enaAnd_q = d_u2_sinTable_r_23_sticky_ena_q & VCC_q;

    // d_u2_sinTable_r_23_rdcnt(COUNTER,687)@18 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_sinTable_r_23_rdcnt_i <= 2'd0;
        end
        else
        begin
            d_u2_sinTable_r_23_rdcnt_i <= $unsigned(d_u2_sinTable_r_23_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign d_u2_sinTable_r_23_rdcnt_q = d_u2_sinTable_r_23_rdcnt_i[1:0];

    // u2_sinTable(DUALMEM,124)@16 + 2
    assign u2_sinTable_aa = d_u2_alphaBitSelect_bit_select_merged_b_16_q;
    assign u2_sinTable_ena_NotRstA = ~ (areset);
    assign u2_sinTable_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO_u2_sinTable.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) u2_sinTable_dmem (
        .clocken0(u2_sinTable_ena_NotRstA),
        .sclr(u2_sinTable_reset0),
        .clock0(clk),
        .address_a(u2_sinTable_aa),
        .q_a(u2_sinTable_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign u2_sinTable_r = u2_sinTable_ir[15:0];

    // d_u2_sinTable_r_23_wraddr(REG,688)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_sinTable_r_23_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            d_u2_sinTable_r_23_wraddr_q <= $unsigned(d_u2_sinTable_r_23_rdcnt_q);
        end
    end

    // d_u2_sinTable_r_23_mem(DUALMEM,686)@18 + 2
    assign d_u2_sinTable_r_23_mem_ia = u2_sinTable_r;
    assign d_u2_sinTable_r_23_mem_aa = d_u2_sinTable_r_23_wraddr_q;
    assign d_u2_sinTable_r_23_mem_ab = d_u2_sinTable_r_23_rdcnt_q;
    assign d_u2_sinTable_r_23_mem_ena_OrRstB = areset | d_u2_sinTable_r_23_enaAnd_q[0];
    assign d_u2_sinTable_r_23_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) d_u2_sinTable_r_23_mem_dmem (
        .clocken1(d_u2_sinTable_r_23_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_u2_sinTable_r_23_mem_reset0),
        .clock1(clk),
        .address_a(d_u2_sinTable_r_23_mem_aa),
        .data_a(d_u2_sinTable_r_23_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_u2_sinTable_r_23_mem_ab),
        .q_b(d_u2_sinTable_r_23_mem_iq),
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
    assign d_u2_sinTable_r_23_mem_q = d_u2_sinTable_r_23_mem_iq[15:0];

    // u2_lsSinTable(BITSHIFT,137)@23
    assign u2_lsSinTable_qint = { d_u2_sinTable_r_23_mem_q, 2'b00 };
    assign u2_lsSinTable_q = u2_lsSinTable_qint[17:0];

    // u2_sinAdd(ADD,143)@23 + 1
    assign u2_sinAdd_a = u2_lsSinTable_q;
    assign u2_sinAdd_b = u2_shiftSinB_q;
    assign u2_sinAdd_i = u0_sin_pi_over_4_q;
    assign u2_sinAdd_a1 = d_u2_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? u2_sinAdd_i : u2_sinAdd_a;
    assign u2_sinAdd_b1 = d_u2_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? 18'b0 : u2_sinAdd_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_sinAdd_o <= 18'b0;
        end
        else
        begin
            u2_sinAdd_o <= $unsigned(u2_sinAdd_a1) + $unsigned(u2_sinAdd_b1);
        end
    end
    assign u2_sinAdd_q = u2_sinAdd_o[17:0];

    // u2_roundedSin_trunc(BITSHIFT,507)@24
    assign u2_roundedSin_trunc_qint = u2_sinAdd_q;
    assign u2_roundedSin_trunc_q = u2_roundedSin_trunc_qint[17:1];

    // u2_roundedSin_add(ADD,508)@24 + 1
    assign u2_roundedSin_add_a = $unsigned({3'b000, u2_roundedSin_trunc_q});
    assign u2_roundedSin_add_b = $unsigned({{18{u0_roundedSin_bias_q[1]}}, u0_roundedSin_bias_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_roundedSin_add_o <= 20'b0;
        end
        else
        begin
            u2_roundedSin_add_o <= $unsigned($signed(u2_roundedSin_add_a) + $signed(u2_roundedSin_add_b));
        end
    end
    assign u2_roundedSin_add_q = u2_roundedSin_add_o[18:0];

    // u2_roundedSin_shift(BITSHIFT,509)@25
    assign u2_roundedSin_shift_qint = u2_roundedSin_add_q;
    assign u2_roundedSin_shift_q = u2_roundedSin_shift_qint[18:1];

    // u2_roundedSin_bs(BITSELECT,510)@25
    assign u2_roundedSin_bs_in = u2_roundedSin_shift_q[16:0];
    assign u2_roundedSin_bs_b = u2_roundedSin_bs_in[16:0];

    // u2_sinMult_cma(CHAINMULTADD,206)@18 + 5
    assign u2_sinMult_cma_reset = areset;
    assign u2_sinMult_cma_ena0 = 1'b1;
    assign u2_sinMult_cma_ena1 = u2_sinMult_cma_ena0;
    assign u2_sinMult_cma_ena2 = u2_sinMult_cma_ena0;

    assign u2_sinMult_cma_a0 = u2_sinTable_r;
    assign u2_sinMult_cma_c0 = u2_beta_times_pi_over_4_shifted_b;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) u2_sinMult_cma_DSP0 (
        .clk(clk),
        .ena({ u2_sinMult_cma_ena2, u2_sinMult_cma_ena1, u2_sinMult_cma_ena0 }),
        .clr({ u2_sinMult_cma_reset, u2_sinMult_cma_reset }),
        .ay(u2_sinMult_cma_a0),
        .ax(u2_sinMult_cma_c0),
        .resulta(u2_sinMult_cma_s0),
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
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u2_sinMult_cma_delay0 ( .xin(u2_sinMult_cma_s0), .xout(u2_sinMult_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u2_sinMult_cma_q = $unsigned(u2_sinMult_cma_qq0[31:0]);

    // u2_shiftCosB(BITSHIFT,140)@23
    assign u2_shiftCosB_qint = u2_sinMult_cma_q;
    assign u2_shiftCosB_q = {8'b00000000, u2_shiftCosB_qint[31:22]};

    // d_u2_cosTable_r_23_notEnable(LOGICAL,702)@18
    assign d_u2_cosTable_r_23_notEnable_q = $unsigned(~ (VCC_q));

    // d_u2_cosTable_r_23_nor(LOGICAL,703)@18
    assign d_u2_cosTable_r_23_nor_q = ~ (d_u2_cosTable_r_23_notEnable_q | d_u2_cosTable_r_23_sticky_ena_q);

    // d_u2_cosTable_r_23_mem_last(CONSTANT,699)
    assign d_u2_cosTable_r_23_mem_last_q = $unsigned(3'b010);

    // d_u2_cosTable_r_23_cmp(LOGICAL,700)@18
    assign d_u2_cosTable_r_23_cmp_b = {1'b0, d_u2_cosTable_r_23_rdcnt_q};
    assign d_u2_cosTable_r_23_cmp_q = $unsigned(d_u2_cosTable_r_23_mem_last_q == d_u2_cosTable_r_23_cmp_b ? 1'b1 : 1'b0);

    // d_u2_cosTable_r_23_cmpReg(REG,701)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_cosTable_r_23_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_u2_cosTable_r_23_cmpReg_q <= $unsigned(d_u2_cosTable_r_23_cmp_q);
        end
    end

    // d_u2_cosTable_r_23_sticky_ena(REG,704)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_cosTable_r_23_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_u2_cosTable_r_23_nor_q == 1'b1)
        begin
            d_u2_cosTable_r_23_sticky_ena_q <= $unsigned(d_u2_cosTable_r_23_cmpReg_q);
        end
    end

    // d_u2_cosTable_r_23_enaAnd(LOGICAL,705)@18
    assign d_u2_cosTable_r_23_enaAnd_q = d_u2_cosTable_r_23_sticky_ena_q & VCC_q;

    // d_u2_cosTable_r_23_rdcnt(COUNTER,697)@18 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_cosTable_r_23_rdcnt_i <= 2'd0;
        end
        else
        begin
            d_u2_cosTable_r_23_rdcnt_i <= $unsigned(d_u2_cosTable_r_23_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign d_u2_cosTable_r_23_rdcnt_q = d_u2_cosTable_r_23_rdcnt_i[1:0];

    // d_u2_cosTable_r_23_wraddr(REG,698)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u2_cosTable_r_23_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            d_u2_cosTable_r_23_wraddr_q <= $unsigned(d_u2_cosTable_r_23_rdcnt_q);
        end
    end

    // d_u2_cosTable_r_23_mem(DUALMEM,696)@18 + 2
    assign d_u2_cosTable_r_23_mem_ia = u2_cosTable_r;
    assign d_u2_cosTable_r_23_mem_aa = d_u2_cosTable_r_23_wraddr_q;
    assign d_u2_cosTable_r_23_mem_ab = d_u2_cosTable_r_23_rdcnt_q;
    assign d_u2_cosTable_r_23_mem_ena_OrRstB = areset | d_u2_cosTable_r_23_enaAnd_q[0];
    assign d_u2_cosTable_r_23_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) d_u2_cosTable_r_23_mem_dmem (
        .clocken1(d_u2_cosTable_r_23_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_u2_cosTable_r_23_mem_reset0),
        .clock1(clk),
        .address_a(d_u2_cosTable_r_23_mem_aa),
        .data_a(d_u2_cosTable_r_23_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_u2_cosTable_r_23_mem_ab),
        .q_b(d_u2_cosTable_r_23_mem_iq),
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
    assign d_u2_cosTable_r_23_mem_q = d_u2_cosTable_r_23_mem_iq[15:0];

    // u2_lsCosTable(BITSHIFT,138)@23
    assign u2_lsCosTable_qint = { d_u2_cosTable_r_23_mem_q, 2'b00 };
    assign u2_lsCosTable_q = u2_lsCosTable_qint[17:0];

    // u2_cosSub(SUB,144)@23 + 1
    assign u2_cosSub_a = $unsigned(u2_lsCosTable_q);
    assign u2_cosSub_b = $unsigned(u2_shiftCosB_q);
    assign u2_cosSub_i = $unsigned(u0_sin_pi_over_4_q);
    assign u2_cosSub_a1 = d_u2_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? u2_cosSub_i : u2_cosSub_a;
    assign u2_cosSub_b1 = d_u2_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? 18'b0 : u2_cosSub_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_cosSub_o <= 18'b0;
        end
        else
        begin
            u2_cosSub_o <= $unsigned($signed(u2_cosSub_a1) - $signed(u2_cosSub_b1));
        end
    end
    assign u2_cosSub_q = u2_cosSub_o[17:0];

    // u2_roundedCos_trunc(BITSHIFT,512)@24
    assign u2_roundedCos_trunc_qint = u2_cosSub_q;
    assign u2_roundedCos_trunc_q = u2_roundedCos_trunc_qint[17:1];

    // u2_roundedCos_add(ADD,513)@24 + 1
    assign u2_roundedCos_add_a = $unsigned({3'b000, u2_roundedCos_trunc_q});
    assign u2_roundedCos_add_b = $unsigned({{18{u0_roundedSin_bias_q[1]}}, u0_roundedSin_bias_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_roundedCos_add_o <= 20'b0;
        end
        else
        begin
            u2_roundedCos_add_o <= $unsigned($signed(u2_roundedCos_add_a) + $signed(u2_roundedCos_add_b));
        end
    end
    assign u2_roundedCos_add_q = u2_roundedCos_add_o[18:0];

    // u2_roundedCos_shift(BITSHIFT,514)@25
    assign u2_roundedCos_shift_qint = u2_roundedCos_add_q;
    assign u2_roundedCos_shift_q = u2_roundedCos_shift_qint[18:1];

    // u2_roundedCos_bs(BITSELECT,515)@25
    assign u2_roundedCos_bs_in = u2_roundedCos_shift_q[16:0];
    assign u2_roundedCos_bs_b = u2_roundedCos_bs_in[16:0];

    // u2_doSwap(LOOKUP,147)@24 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_doSwap_q <= $unsigned(1'b0);
        end
        else
        begin
            unique case (d_u2_octantBitSelect_b_24_q)
                3'b000 : u2_doSwap_q <= 1'b0;
                3'b001 : u2_doSwap_q <= 1'b1;
                3'b010 : u2_doSwap_q <= 1'b1;
                3'b011 : u2_doSwap_q <= 1'b0;
                3'b100 : u2_doSwap_q <= 1'b0;
                3'b101 : u2_doSwap_q <= 1'b1;
                3'b110 : u2_doSwap_q <= 1'b1;
                3'b111 : u2_doSwap_q <= 1'b0;
                default : begin
                              // unreachable
                              u2_doSwap_q <= 1'bx;
                          end
            endcase
        end
    end

    // u2_cosSwapMux(MUX,155)@25 + 1
    assign u2_cosSwapMux_s = u2_doSwap_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_cosSwapMux_q <= 17'b0;
        end
        else
        begin
            unique case (u2_cosSwapMux_s)
                1'b0 : u2_cosSwapMux_q <= u2_roundedCos_bs_b;
                1'b1 : u2_cosSwapMux_q <= u2_roundedSin_bs_b;
                default : u2_cosSwapMux_q <= 17'b0;
            endcase
        end
    end

    // u2_cosInvert(SUB,157)@26 + 1
    assign u2_cosInvert_a = $unsigned({{15{GND_q[0]}}, GND_q});
    assign u2_cosInvert_b = $unsigned(u2_cosSwapMux_q[15:0]);
    assign u2_cosInvert_i = u2_cosInvert_b;
    assign u2_cosInvert_a1 = u2_doCosInvert_q == 1'b1 ? u2_cosInvert_i : u2_cosInvert_a;
    assign u2_cosInvert_b1 = u2_doCosInvert_q == 1'b1 ? 16'b0 : u2_cosInvert_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_cosInvert_o <= 16'b0;
        end
        else
        begin
            u2_cosInvert_o <= $unsigned($signed(u2_cosInvert_a1) - $signed(u2_cosInvert_b1));
        end
    end
    assign u2_cosInvert_q = u2_cosInvert_o[15:0];

    // u1_phaseIncrRegLookup_1(LOOKUP,12)@10 + 1
    assign u1_phaseIncrRegLookup_1_c = busIn_write;
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u1_phaseIncrRegLookup_1_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00001100100011 : u1_phaseIncrRegLookup_1_e <= u1_phaseIncrRegLookup_1_c;
                default : u1_phaseIncrRegLookup_1_e <= 1'b0;
            endcase
        end
    end

    // u1_phaseIncrReg_p1(SYNCREG,13)@11 + 1
    assign u1_phaseIncrReg_p1_a = d_busIn_writedata_11_q;
    assign u1_phaseIncrReg_p1_b = u1_phaseIncrRegLookup_1_e;
    dspba_sync_reg_ver #( .width1(32), .width2(2), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    u1_phaseIncrReg_p1 ( .xin(u1_phaseIncrReg_p1_a), .ena(u1_phaseIncrReg_p1_b), .clk1(bus_clk), .aclr1(bus_areset), .sxout(u1_phaseIncrReg_p1_v), .clk2(clk), .aclr2(areset), .xout() );

    // u1_phaseIncrRegLookup_0(LOOKUP,10)@10 + 1
    assign u1_phaseIncrRegLookup_0_c = busIn_write;
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u1_phaseIncrRegLookup_0_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00001100100010 : u1_phaseIncrRegLookup_0_e <= u1_phaseIncrRegLookup_0_c;
                default : u1_phaseIncrRegLookup_0_e <= 1'b0;
            endcase
        end
    end

    // u1_phaseIncrReg_p0(SYNCREG,11)@11 + 1
    assign u1_phaseIncrReg_p0_a = d_busIn_writedata_11_q;
    assign u1_phaseIncrReg_p0_b = u1_phaseIncrRegLookup_0_e;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00011010000010101010101010101010), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    u1_phaseIncrReg_p0 ( .xin(u1_phaseIncrReg_p0_a), .ena(u1_phaseIncrReg_p0_b), .clk1(bus_clk), .aclr1(bus_areset), .sxout(u1_phaseIncrReg_p0_v), .clk2(clk), .aclr2(areset), .xout() );

    // u1_phaseIncrMem(BITJOIN,14)@12
    assign u1_phaseIncrMem_q = {u1_phaseIncrReg_p1_v, u1_phaseIncrReg_p0_v};

    // u1_invertSin_bit_select_merged(BITSELECT,527)@10
    assign u1_invertSin_bit_select_merged_b = u1_phaseIncrMem_q[33:33];
    assign u1_invertSin_bit_select_merged_c = u1_phaseIncrMem_q[32:32];
    assign u1_invertSin_bit_select_merged_d = u1_phaseIncrMem_q[19:0];
    assign u1_invertSin_bit_select_merged_e = u1_phaseIncrMem_q[31:20];

    // d_u1_invertSin_bit_select_merged_c_25(DELAY,620)@10 + 15
    dspba_delay_ver #( .width(1), .depth(15), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u1_invertSin_bit_select_merged_c_25 ( .xin(u1_invertSin_bit_select_merged_c), .xout(d_u1_invertSin_bit_select_merged_c_25_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u1_accumAdd_b1_BitSelect_for_v(BITSELECT,254)@10
    assign u1_accumAdd_b1_BitSelect_for_v_b = xIn_p_1[19:0];
    assign u1_accumAdd_b1_BitSelect_for_v_c = xIn_p_1[31:20];

    // u1_accumAdd_b1_p1_of_2(ADD,255)@10 + 1
    assign u1_accumAdd_b1_p1_of_2_a = {1'b0, u1_accumAdd_b1_p1_of_2_q};
    assign u1_accumAdd_b1_p1_of_2_b = {1'b0, u1_invertSin_bit_select_merged_d};
    assign u1_accumAdd_b1_p1_of_2_i = $unsigned({ 1'b0, u1_accumAdd_b1_BitSelect_for_v_b });
    assign u1_accumAdd_b1_p1_of_2_a1 = xIn_s_1 == 1'b1 ? u1_accumAdd_b1_p1_of_2_i : u1_accumAdd_b1_p1_of_2_a;
    assign u1_accumAdd_b1_p1_of_2_b1 = xIn_s_1 == 1'b1 ? 21'b0 : u1_accumAdd_b1_p1_of_2_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_accumAdd_b1_p1_of_2_o <= 21'b0;
        end
        else if (xIn_v == 1'b1)
        begin
            u1_accumAdd_b1_p1_of_2_o <= $unsigned(u1_accumAdd_b1_p1_of_2_a1) + $unsigned(u1_accumAdd_b1_p1_of_2_b1);
        end
    end
    assign u1_accumAdd_b1_p1_of_2_c[0] = u1_accumAdd_b1_p1_of_2_o[20];
    assign u1_accumAdd_b1_p1_of_2_q = u1_accumAdd_b1_p1_of_2_o[19:0];

    // d_u1_accumAdd_b1_BitSelect_for_v_c_11(DELAY,586)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_accumAdd_b1_BitSelect_for_v_c_11_q <= '0;
        end
        else
        begin
            d_u1_accumAdd_b1_BitSelect_for_v_c_11_q <= u1_accumAdd_b1_BitSelect_for_v_c;
        end
    end

    // d_xIn_s_1_11(DELAY,550)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_s_1_11_q <= '0;
        end
        else
        begin
            d_xIn_s_1_11_q <= $unsigned(xIn_s_1);
        end
    end

    // d_u1_invertSin_bit_select_merged_e_11(DELAY,621)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_invertSin_bit_select_merged_e_11_q <= '0;
        end
        else
        begin
            d_u1_invertSin_bit_select_merged_e_11_q <= u1_invertSin_bit_select_merged_e;
        end
    end

    // u1_accumAdd_b1_p2_of_2(ADD,256)@11 + 1
    assign u1_accumAdd_b1_p2_of_2_cin = u1_accumAdd_b1_p1_of_2_c;
    assign u1_accumAdd_b1_p2_of_2_a = { {1'b0, u1_accumAdd_b1_p2_of_2_q}, 1'b1 };
    assign u1_accumAdd_b1_p2_of_2_b = { {1'b0, d_u1_invertSin_bit_select_merged_e_11_q}, u1_accumAdd_b1_p2_of_2_cin[0] };
    assign u1_accumAdd_b1_p2_of_2_i = $unsigned({ 1'b0, d_u1_accumAdd_b1_BitSelect_for_v_c_11_q, 1'b0 });
    assign u1_accumAdd_b1_p2_of_2_a1 = d_xIn_s_1_11_q == 1'b1 ? u1_accumAdd_b1_p2_of_2_i : u1_accumAdd_b1_p2_of_2_a;
    assign u1_accumAdd_b1_p2_of_2_b1 = d_xIn_s_1_11_q == 1'b1 ? 14'b0 : u1_accumAdd_b1_p2_of_2_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_accumAdd_b1_p2_of_2_o <= 14'b0;
        end
        else if (d_xIn_v_11_q == 1'b1)
        begin
            u1_accumAdd_b1_p2_of_2_o <= $unsigned(u1_accumAdd_b1_p2_of_2_a1) + $unsigned(u1_accumAdd_b1_p2_of_2_b1);
        end
    end
    assign u1_accumAdd_b1_p2_of_2_q = u1_accumAdd_b1_p2_of_2_o[12:1];

    // d_u1_accumAdd_b1_p1_of_2_q_12(DELAY,587)@11 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_accumAdd_b1_p1_of_2_q_12_q <= '0;
        end
        else
        begin
            d_u1_accumAdd_b1_p1_of_2_q_12_q <= $unsigned(u1_accumAdd_b1_p1_of_2_q);
        end
    end

    // u1_accumAdd_b1_BitJoin_for_q(BITJOIN,257)@12
    assign u1_accumAdd_b1_BitJoin_for_q_q = {u1_accumAdd_b1_p2_of_2_q, d_u1_accumAdd_b1_p1_of_2_q_12_q};

    // u1_octantBitSelect(BITSELECT,74)@12
    assign u1_octantBitSelect_b = u1_accumAdd_b1_BitJoin_for_q_q[31:29];

    // d_u1_octantBitSelect_b_24(DELAY,561)@12 + 12
    dspba_delay_ver #( .width(3), .depth(12), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u1_octantBitSelect_b_24 ( .xin(u1_octantBitSelect_b), .xout(d_u1_octantBitSelect_b_24_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // d_u1_octantBitSelect_b_25(DELAY,562)@24 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_octantBitSelect_b_25_q <= '0;
        end
        else
        begin
            d_u1_octantBitSelect_b_25_q <= d_u1_octantBitSelect_b_24_q;
        end
    end

    // u1_cosJoin(BITJOIN,109)@25
    assign u1_cosJoin_q = {d_u1_invertSin_bit_select_merged_c_25_q, d_u1_octantBitSelect_b_25_q};

    // u1_doCosInvert(LOOKUP,110)@25 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_doCosInvert_q <= $unsigned(1'b1);
        end
        else
        begin
            unique case (u1_cosJoin_q)
                4'b0000 : u1_doCosInvert_q <= 1'b1;
                4'b0001 : u1_doCosInvert_q <= 1'b1;
                4'b0010 : u1_doCosInvert_q <= 1'b0;
                4'b0011 : u1_doCosInvert_q <= 1'b0;
                4'b0100 : u1_doCosInvert_q <= 1'b0;
                4'b0101 : u1_doCosInvert_q <= 1'b0;
                4'b0110 : u1_doCosInvert_q <= 1'b1;
                4'b0111 : u1_doCosInvert_q <= 1'b1;
                4'b1000 : u1_doCosInvert_q <= 1'b0;
                4'b1001 : u1_doCosInvert_q <= 1'b0;
                4'b1010 : u1_doCosInvert_q <= 1'b1;
                4'b1011 : u1_doCosInvert_q <= 1'b1;
                4'b1100 : u1_doCosInvert_q <= 1'b1;
                4'b1101 : u1_doCosInvert_q <= 1'b1;
                4'b1110 : u1_doCosInvert_q <= 1'b0;
                4'b1111 : u1_doCosInvert_q <= 1'b0;
                default : begin
                              // unreachable
                              u1_doCosInvert_q <= 1'bx;
                          end
            endcase
        end
    end

    // u1_addnsubConst(LOOKUP,76)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_addnsubConst_q <= $unsigned(1'b1);
        end
        else
        begin
            unique case (u1_octantBitSelect_b)
                3'b000 : u1_addnsubConst_q <= 1'b1;
                3'b001 : u1_addnsubConst_q <= 1'b0;
                3'b010 : u1_addnsubConst_q <= 1'b1;
                3'b011 : u1_addnsubConst_q <= 1'b0;
                3'b100 : u1_addnsubConst_q <= 1'b1;
                3'b101 : u1_addnsubConst_q <= 1'b0;
                3'b110 : u1_addnsubConst_q <= 1'b1;
                3'b111 : u1_addnsubConst_q <= 1'b0;
                default : begin
                              // unreachable
                              u1_addnsubConst_q <= 1'bx;
                          end
            endcase
        end
    end

    // d_u1_addnsubConst_q_14(DELAY,563)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_addnsubConst_q_14_q <= '0;
        end
        else
        begin
            d_u1_addnsubConst_q_14_q <= $unsigned(u1_addnsubConst_q);
        end
    end

    // d_u1_accumAdd_b1_p1_of_2_q_13(DELAY,588)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_accumAdd_b1_p1_of_2_q_13_q <= '0;
        end
        else
        begin
            d_u1_accumAdd_b1_p1_of_2_q_13_q <= $unsigned(d_u1_accumAdd_b1_p1_of_2_q_12_q);
        end
    end

    // u1_rangeAddSub_p1_of_2(ADDSUB,264)@13 + 1
    assign u1_rangeAddSub_p1_of_2_s = u1_addnsubConst_q;
    assign u1_rangeAddSub_p1_of_2_a = $unsigned({1'b0, u0_rangeAddSub_BitSelect_for_a_b_const_q});
    assign u1_rangeAddSub_p1_of_2_b = $unsigned({1'b0, d_u1_accumAdd_b1_p1_of_2_q_13_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_rangeAddSub_p1_of_2_o <= 21'b0;
        end
        else
        begin
            if (u1_rangeAddSub_p1_of_2_s == 1'b1)
            begin
                u1_rangeAddSub_p1_of_2_o <= $unsigned($signed(u1_rangeAddSub_p1_of_2_a) + $signed(u1_rangeAddSub_p1_of_2_b));
            end
            else
            begin
                u1_rangeAddSub_p1_of_2_o <= $unsigned($signed(u1_rangeAddSub_p1_of_2_a) - $signed(u1_rangeAddSub_p1_of_2_b));
            end
        end
    end
    assign u1_rangeAddSub_p1_of_2_c[0] = u1_rangeAddSub_p1_of_2_o[20];
    assign u1_rangeAddSub_p1_of_2_q = u1_rangeAddSub_p1_of_2_o[19:0];

    // d_u1_accumAdd_b1_p2_of_2_q_14(DELAY,589)@12 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_accumAdd_b1_p2_of_2_q_14_delay_0 <= '0;
        end
        else
        begin
            d_u1_accumAdd_b1_p2_of_2_q_14_delay_0 <= $unsigned(u1_accumAdd_b1_p2_of_2_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u1_accumAdd_b1_p2_of_2_q_14_q <= d_u1_accumAdd_b1_p2_of_2_q_14_delay_0;
        end
    end

    // u1_rangeAddSub_BitSelect_for_b_BitJoin_for_c(BITJOIN,421)@14
    assign u1_rangeAddSub_BitSelect_for_b_BitJoin_for_c_q = {u0_rangeAddSub_UpperBits_for_b_q, d_u1_accumAdd_b1_p2_of_2_q_14_q};

    // u1_rangeAddSub_p2_of_2(ADDSUB,265)@14 + 1
    assign u1_rangeAddSub_p2_of_2_s = d_u1_addnsubConst_q_14_q;
    assign u1_rangeAddSub_p2_of_2_cin = u1_rangeAddSub_p1_of_2_c;
    assign u1_rangeAddSub_p2_of_2_a = $unsigned({ {1'b0, u0_rangeAddSub_BitSelect_for_a_c_const_q}, d_u1_addnsubConst_q_14_q[0] });
    assign u1_rangeAddSub_p2_of_2_b = $unsigned({ {1'b0, u1_rangeAddSub_BitSelect_for_b_BitJoin_for_c_q}, u1_rangeAddSub_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_rangeAddSub_p2_of_2_o <= 16'b0;
        end
        else
        begin
            if (u1_rangeAddSub_p2_of_2_s == 1'b1)
            begin
                u1_rangeAddSub_p2_of_2_o <= $unsigned($signed(u1_rangeAddSub_p2_of_2_a) + $signed(u1_rangeAddSub_p2_of_2_b));
            end
            else
            begin
                u1_rangeAddSub_p2_of_2_o <= $unsigned($signed(u1_rangeAddSub_p2_of_2_a) - $signed(u1_rangeAddSub_p2_of_2_b));
            end
        end
    end
    assign u1_rangeAddSub_p2_of_2_q = u1_rangeAddSub_p2_of_2_o[14:1];

    // d_u1_rangeAddSub_p1_of_2_q_15(DELAY,590)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_rangeAddSub_p1_of_2_q_15_q <= '0;
        end
        else
        begin
            d_u1_rangeAddSub_p1_of_2_q_15_q <= $unsigned(u1_rangeAddSub_p1_of_2_q);
        end
    end

    // u1_rangeAddSub_BitJoin_for_q(BITJOIN,266)@15
    assign u1_rangeAddSub_BitJoin_for_q_q = {u1_rangeAddSub_p2_of_2_q, d_u1_rangeAddSub_p1_of_2_q_15_q};

    // u1_alphaBitSelect_bit_select_merged(BITSELECT,531)@15
    assign u1_alphaBitSelect_bit_select_merged_in = u1_rangeAddSub_BitJoin_for_q_q[29:0];
    assign u1_alphaBitSelect_bit_select_merged_b = u1_alphaBitSelect_bit_select_merged_in[28:21];
    assign u1_alphaBitSelect_bit_select_merged_c = u1_alphaBitSelect_bit_select_merged_in[29:29];
    assign u1_alphaBitSelect_bit_select_merged_d = u1_alphaBitSelect_bit_select_merged_in[20:0];

    // d_u1_alphaBitSelect_bit_select_merged_c_23(DELAY,631)@15 + 8
    dspba_delay_ver #( .width(1), .depth(8), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u1_alphaBitSelect_bit_select_merged_c_23 ( .xin(u1_alphaBitSelect_bit_select_merged_c), .xout(d_u1_alphaBitSelect_bit_select_merged_c_23_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u1_ls4(BITSHIFT,87)@15
    assign u1_ls4_qint = { u1_alphaBitSelect_bit_select_merged_d, 4'b0000 };
    assign u1_ls4_q = u1_ls4_qint[24:0];

    // u1_cm2_BitExpansion_for_b(BITJOIN,278)@15
    assign u1_cm2_BitExpansion_for_b_q = {u0_cm2_UpperBits_for_b_q, u1_ls4_q};

    // u1_cm2_BitSelect_for_b(BITSELECT,281)@15
    assign u1_cm2_BitSelect_for_b_b = u1_cm2_BitExpansion_for_b_q[19:0];
    assign u1_cm2_BitSelect_for_b_c = u1_cm2_BitExpansion_for_b_q[28:20];

    // u1_ls7(BITSHIFT,86)@15
    assign u1_ls7_qint = { u1_alphaBitSelect_bit_select_merged_d, 7'b0000000 };
    assign u1_ls7_q = u1_ls7_qint[27:0];

    // u1_cm2_BitExpansion_for_a(BITJOIN,276)@15
    assign u1_cm2_BitExpansion_for_a_q = {GND_q, u1_ls7_q};

    // u1_cm2_BitSelect_for_a(BITSELECT,280)@15
    assign u1_cm2_BitSelect_for_a_b = u1_cm2_BitExpansion_for_a_q[19:0];
    assign u1_cm2_BitSelect_for_a_c = u1_cm2_BitExpansion_for_a_q[28:20];

    // u1_cm2_p1_of_2(ADD,282)@15 + 1
    assign u1_cm2_p1_of_2_a = {1'b0, u1_cm2_BitSelect_for_a_b};
    assign u1_cm2_p1_of_2_b = {1'b0, u1_cm2_BitSelect_for_b_b};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_cm2_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u1_cm2_p1_of_2_o <= $unsigned(u1_cm2_p1_of_2_a) + $unsigned(u1_cm2_p1_of_2_b);
        end
    end
    assign u1_cm2_p1_of_2_c[0] = u1_cm2_p1_of_2_o[20];
    assign u1_cm2_p1_of_2_q = u1_cm2_p1_of_2_o[19:0];

    // u1_ls10(BITSHIFT,84)@15
    assign u1_ls10_qint = { u1_alphaBitSelect_bit_select_merged_d, 10'b0000000000 };
    assign u1_ls10_q = u1_ls10_qint[30:0];

    // u1_cm1_BitExpansion_for_b(BITJOIN,269)@15
    assign u1_cm1_BitExpansion_for_b_q = {u0_cm1_UpperBits_for_b_q, u1_ls10_q};

    // u1_cm1_BitSelect_for_b(BITSELECT,272)@15
    assign u1_cm1_BitSelect_for_b_b = u1_cm1_BitExpansion_for_b_q[19:0];
    assign u1_cm1_BitSelect_for_b_c = u1_cm1_BitExpansion_for_b_q[33:20];

    // u1_ls12(BITSHIFT,83)@15
    assign u1_ls12_qint = { u1_alphaBitSelect_bit_select_merged_d, 12'b000000000000 };
    assign u1_ls12_q = u1_ls12_qint[32:0];

    // u1_cm1_BitExpansion_for_a(BITJOIN,267)@15
    assign u1_cm1_BitExpansion_for_a_q = {GND_q, u1_ls12_q};

    // u1_cm1_BitSelect_for_a(BITSELECT,271)@15
    assign u1_cm1_BitSelect_for_a_b = u1_cm1_BitExpansion_for_a_q[19:0];
    assign u1_cm1_BitSelect_for_a_c = u1_cm1_BitExpansion_for_a_q[33:20];

    // u1_cm1_p1_of_2(SUB,273)@15 + 1
    assign u1_cm1_p1_of_2_a = $unsigned({1'b0, u1_cm1_BitSelect_for_a_b});
    assign u1_cm1_p1_of_2_b = $unsigned({1'b0, u1_cm1_BitSelect_for_b_b});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_cm1_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u1_cm1_p1_of_2_o <= $unsigned($signed(u1_cm1_p1_of_2_a) - $signed(u1_cm1_p1_of_2_b));
        end
    end
    assign u1_cm1_p1_of_2_c[0] = u1_cm1_p1_of_2_o[20];
    assign u1_cm1_p1_of_2_q = u1_cm1_p1_of_2_o[19:0];

    // u1_cm3_p1_of_2(ADD,291)@16 + 1
    assign u1_cm3_p1_of_2_a = {1'b0, u1_cm1_p1_of_2_q};
    assign u1_cm3_p1_of_2_b = {1'b0, u1_cm2_p1_of_2_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_cm3_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u1_cm3_p1_of_2_o <= $unsigned(u1_cm3_p1_of_2_a) + $unsigned(u1_cm3_p1_of_2_b);
        end
    end
    assign u1_cm3_p1_of_2_c[0] = u1_cm3_p1_of_2_o[20];
    assign u1_cm3_p1_of_2_q = u1_cm3_p1_of_2_o[19:0];

    // d_u1_cm2_BitSelect_for_b_c_16(DELAY,594)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_cm2_BitSelect_for_b_c_16_q <= '0;
        end
        else
        begin
            d_u1_cm2_BitSelect_for_b_c_16_q <= u1_cm2_BitSelect_for_b_c;
        end
    end

    // d_u1_cm2_BitSelect_for_a_c_16(DELAY,593)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_cm2_BitSelect_for_a_c_16_q <= '0;
        end
        else
        begin
            d_u1_cm2_BitSelect_for_a_c_16_q <= u1_cm2_BitSelect_for_a_c;
        end
    end

    // u1_cm2_p2_of_2(ADD,283)@16 + 1
    assign u1_cm2_p2_of_2_cin = u1_cm2_p1_of_2_c;
    assign u1_cm2_p2_of_2_a = { {1'b0, d_u1_cm2_BitSelect_for_a_c_16_q}, 1'b1 };
    assign u1_cm2_p2_of_2_b = { {1'b0, d_u1_cm2_BitSelect_for_b_c_16_q}, u1_cm2_p2_of_2_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_cm2_p2_of_2_o <= 11'b0;
        end
        else
        begin
            u1_cm2_p2_of_2_o <= $unsigned(u1_cm2_p2_of_2_a) + $unsigned(u1_cm2_p2_of_2_b);
        end
    end
    assign u1_cm2_p2_of_2_q = u1_cm2_p2_of_2_o[9:1];

    // u1_cm3_BitSelect_for_b_BitJoin_for_c(BITJOIN,431)@17
    assign u1_cm3_BitSelect_for_b_BitJoin_for_c_q = {u0_cm3_UpperBits_for_b_q, u1_cm2_p2_of_2_q};

    // d_u1_cm1_BitSelect_for_b_c_16(DELAY,592)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_cm1_BitSelect_for_b_c_16_q <= '0;
        end
        else
        begin
            d_u1_cm1_BitSelect_for_b_c_16_q <= u1_cm1_BitSelect_for_b_c;
        end
    end

    // d_u1_cm1_BitSelect_for_a_c_16(DELAY,591)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_cm1_BitSelect_for_a_c_16_q <= '0;
        end
        else
        begin
            d_u1_cm1_BitSelect_for_a_c_16_q <= u1_cm1_BitSelect_for_a_c;
        end
    end

    // u1_cm1_p2_of_2(SUB,274)@16 + 1
    assign u1_cm1_p2_of_2_cin = u1_cm1_p1_of_2_c;
    assign u1_cm1_p2_of_2_a = $unsigned({ {1'b0, d_u1_cm1_BitSelect_for_a_c_16_q}, 1'b0 });
    assign u1_cm1_p2_of_2_b = $unsigned({ {1'b0, d_u1_cm1_BitSelect_for_b_c_16_q}, u1_cm1_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_cm1_p2_of_2_o <= 16'b0;
        end
        else
        begin
            u1_cm1_p2_of_2_o <= $unsigned($signed(u1_cm1_p2_of_2_a) - $signed(u1_cm1_p2_of_2_b));
        end
    end
    assign u1_cm1_p2_of_2_q = u1_cm1_p2_of_2_o[14:1];

    // u1_cm3_BitSelect_for_a_BitJoin_for_c(BITJOIN,426)@17
    assign u1_cm3_BitSelect_for_a_BitJoin_for_c_q = {GND_q, u1_cm1_p2_of_2_q};

    // u1_cm3_p2_of_2(ADD,292)@17 + 1
    assign u1_cm3_p2_of_2_cin = u1_cm3_p1_of_2_c;
    assign u1_cm3_p2_of_2_a = { {1'b0, u1_cm3_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign u1_cm3_p2_of_2_b = { {1'b0, u1_cm3_BitSelect_for_b_BitJoin_for_c_q}, u1_cm3_p2_of_2_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_cm3_p2_of_2_o <= 17'b0;
        end
        else
        begin
            u1_cm3_p2_of_2_o <= $unsigned(u1_cm3_p2_of_2_a) + $unsigned(u1_cm3_p2_of_2_b);
        end
    end
    assign u1_cm3_p2_of_2_q = u1_cm3_p2_of_2_o[15:1];

    // d_u1_cm3_p1_of_2_q_18(DELAY,595)@17 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_cm3_p1_of_2_q_18_q <= '0;
        end
        else
        begin
            d_u1_cm3_p1_of_2_q_18_q <= $unsigned(u1_cm3_p1_of_2_q);
        end
    end

    // u1_cm3_BitJoin_for_q(BITJOIN,293)@18
    assign u1_cm3_BitJoin_for_q_q = {u1_cm3_p2_of_2_q, d_u1_cm3_p1_of_2_q_18_q};

    // u1_beta_times_4_shift(BITSHIFT,90)@18
    assign u1_beta_times_4_shift_qint = { u1_cm3_BitJoin_for_q_q, 3'b000 };
    assign u1_beta_times_4_shift_q = u1_beta_times_4_shift_qint[37:0];

    // u1_beta_times_pi_over_4_shifted(BITSELECT,91)@18
    assign u1_beta_times_pi_over_4_shifted_in = u1_beta_times_4_shift_q[35:0];
    assign u1_beta_times_pi_over_4_shifted_b = u1_beta_times_pi_over_4_shifted_in[35:20];

    // d_u1_alphaBitSelect_bit_select_merged_b_16(DELAY,630)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_alphaBitSelect_bit_select_merged_b_16_q <= '0;
        end
        else
        begin
            d_u1_alphaBitSelect_bit_select_merged_b_16_q <= u1_alphaBitSelect_bit_select_merged_b;
        end
    end

    // u1_cosTable(DUALMEM,82)@16 + 2
    assign u1_cosTable_aa = d_u1_alphaBitSelect_bit_select_merged_b_16_q;
    assign u1_cosTable_ena_NotRstA = ~ (areset);
    assign u1_cosTable_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO_u1_cosTable.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) u1_cosTable_dmem (
        .clocken0(u1_cosTable_ena_NotRstA),
        .sclr(u1_cosTable_reset0),
        .clock0(clk),
        .address_a(u1_cosTable_aa),
        .q_a(u1_cosTable_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign u1_cosTable_r = u1_cosTable_ir[15:0];

    // u1_cosMult_cma(CHAINMULTADD,205)@18 + 5
    assign u1_cosMult_cma_reset = areset;
    assign u1_cosMult_cma_ena0 = 1'b1;
    assign u1_cosMult_cma_ena1 = u1_cosMult_cma_ena0;
    assign u1_cosMult_cma_ena2 = u1_cosMult_cma_ena0;

    assign u1_cosMult_cma_a0 = u1_cosTable_r;
    assign u1_cosMult_cma_c0 = u1_beta_times_pi_over_4_shifted_b;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) u1_cosMult_cma_DSP0 (
        .clk(clk),
        .ena({ u1_cosMult_cma_ena2, u1_cosMult_cma_ena1, u1_cosMult_cma_ena0 }),
        .clr({ u1_cosMult_cma_reset, u1_cosMult_cma_reset }),
        .ay(u1_cosMult_cma_a0),
        .ax(u1_cosMult_cma_c0),
        .resulta(u1_cosMult_cma_s0),
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
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u1_cosMult_cma_delay0 ( .xin(u1_cosMult_cma_s0), .xout(u1_cosMult_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u1_cosMult_cma_q = $unsigned(u1_cosMult_cma_qq0[31:0]);

    // u1_shiftSinB(BITSHIFT,96)@23
    assign u1_shiftSinB_qint = u1_cosMult_cma_q;
    assign u1_shiftSinB_q = {8'b00000000, u1_shiftSinB_qint[31:22]};

    // d_u1_sinTable_r_23_notEnable(LOGICAL,672)@18
    assign d_u1_sinTable_r_23_notEnable_q = $unsigned(~ (VCC_q));

    // d_u1_sinTable_r_23_nor(LOGICAL,673)@18
    assign d_u1_sinTable_r_23_nor_q = ~ (d_u1_sinTable_r_23_notEnable_q | d_u1_sinTable_r_23_sticky_ena_q);

    // d_u1_sinTable_r_23_mem_last(CONSTANT,669)
    assign d_u1_sinTable_r_23_mem_last_q = $unsigned(3'b010);

    // d_u1_sinTable_r_23_cmp(LOGICAL,670)@18
    assign d_u1_sinTable_r_23_cmp_b = {1'b0, d_u1_sinTable_r_23_rdcnt_q};
    assign d_u1_sinTable_r_23_cmp_q = $unsigned(d_u1_sinTable_r_23_mem_last_q == d_u1_sinTable_r_23_cmp_b ? 1'b1 : 1'b0);

    // d_u1_sinTable_r_23_cmpReg(REG,671)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_sinTable_r_23_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_u1_sinTable_r_23_cmpReg_q <= $unsigned(d_u1_sinTable_r_23_cmp_q);
        end
    end

    // d_u1_sinTable_r_23_sticky_ena(REG,674)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_sinTable_r_23_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_u1_sinTable_r_23_nor_q == 1'b1)
        begin
            d_u1_sinTable_r_23_sticky_ena_q <= $unsigned(d_u1_sinTable_r_23_cmpReg_q);
        end
    end

    // d_u1_sinTable_r_23_enaAnd(LOGICAL,675)@18
    assign d_u1_sinTable_r_23_enaAnd_q = d_u1_sinTable_r_23_sticky_ena_q & VCC_q;

    // d_u1_sinTable_r_23_rdcnt(COUNTER,667)@18 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_sinTable_r_23_rdcnt_i <= 2'd0;
        end
        else
        begin
            d_u1_sinTable_r_23_rdcnt_i <= $unsigned(d_u1_sinTable_r_23_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign d_u1_sinTable_r_23_rdcnt_q = d_u1_sinTable_r_23_rdcnt_i[1:0];

    // u1_sinTable(DUALMEM,81)@16 + 2
    assign u1_sinTable_aa = d_u1_alphaBitSelect_bit_select_merged_b_16_q;
    assign u1_sinTable_ena_NotRstA = ~ (areset);
    assign u1_sinTable_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO_u1_sinTable.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) u1_sinTable_dmem (
        .clocken0(u1_sinTable_ena_NotRstA),
        .sclr(u1_sinTable_reset0),
        .clock0(clk),
        .address_a(u1_sinTable_aa),
        .q_a(u1_sinTable_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign u1_sinTable_r = u1_sinTable_ir[15:0];

    // d_u1_sinTable_r_23_wraddr(REG,668)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_sinTable_r_23_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            d_u1_sinTable_r_23_wraddr_q <= $unsigned(d_u1_sinTable_r_23_rdcnt_q);
        end
    end

    // d_u1_sinTable_r_23_mem(DUALMEM,666)@18 + 2
    assign d_u1_sinTable_r_23_mem_ia = u1_sinTable_r;
    assign d_u1_sinTable_r_23_mem_aa = d_u1_sinTable_r_23_wraddr_q;
    assign d_u1_sinTable_r_23_mem_ab = d_u1_sinTable_r_23_rdcnt_q;
    assign d_u1_sinTable_r_23_mem_ena_OrRstB = areset | d_u1_sinTable_r_23_enaAnd_q[0];
    assign d_u1_sinTable_r_23_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) d_u1_sinTable_r_23_mem_dmem (
        .clocken1(d_u1_sinTable_r_23_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_u1_sinTable_r_23_mem_reset0),
        .clock1(clk),
        .address_a(d_u1_sinTable_r_23_mem_aa),
        .data_a(d_u1_sinTable_r_23_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_u1_sinTable_r_23_mem_ab),
        .q_b(d_u1_sinTable_r_23_mem_iq),
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
    assign d_u1_sinTable_r_23_mem_q = d_u1_sinTable_r_23_mem_iq[15:0];

    // u1_lsSinTable(BITSHIFT,94)@23
    assign u1_lsSinTable_qint = { d_u1_sinTable_r_23_mem_q, 2'b00 };
    assign u1_lsSinTable_q = u1_lsSinTable_qint[17:0];

    // u1_sinAdd(ADD,100)@23 + 1
    assign u1_sinAdd_a = u1_lsSinTable_q;
    assign u1_sinAdd_b = u1_shiftSinB_q;
    assign u1_sinAdd_i = u0_sin_pi_over_4_q;
    assign u1_sinAdd_a1 = d_u1_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? u1_sinAdd_i : u1_sinAdd_a;
    assign u1_sinAdd_b1 = d_u1_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? 18'b0 : u1_sinAdd_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_sinAdd_o <= 18'b0;
        end
        else
        begin
            u1_sinAdd_o <= $unsigned(u1_sinAdd_a1) + $unsigned(u1_sinAdd_b1);
        end
    end
    assign u1_sinAdd_q = u1_sinAdd_o[17:0];

    // u1_roundedSin_trunc(BITSHIFT,497)@24
    assign u1_roundedSin_trunc_qint = u1_sinAdd_q;
    assign u1_roundedSin_trunc_q = u1_roundedSin_trunc_qint[17:1];

    // u1_roundedSin_add(ADD,498)@24 + 1
    assign u1_roundedSin_add_a = $unsigned({3'b000, u1_roundedSin_trunc_q});
    assign u1_roundedSin_add_b = $unsigned({{18{u0_roundedSin_bias_q[1]}}, u0_roundedSin_bias_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_roundedSin_add_o <= 20'b0;
        end
        else
        begin
            u1_roundedSin_add_o <= $unsigned($signed(u1_roundedSin_add_a) + $signed(u1_roundedSin_add_b));
        end
    end
    assign u1_roundedSin_add_q = u1_roundedSin_add_o[18:0];

    // u1_roundedSin_shift(BITSHIFT,499)@25
    assign u1_roundedSin_shift_qint = u1_roundedSin_add_q;
    assign u1_roundedSin_shift_q = u1_roundedSin_shift_qint[18:1];

    // u1_roundedSin_bs(BITSELECT,500)@25
    assign u1_roundedSin_bs_in = u1_roundedSin_shift_q[16:0];
    assign u1_roundedSin_bs_b = u1_roundedSin_bs_in[16:0];

    // u1_sinMult_cma(CHAINMULTADD,204)@18 + 5
    assign u1_sinMult_cma_reset = areset;
    assign u1_sinMult_cma_ena0 = 1'b1;
    assign u1_sinMult_cma_ena1 = u1_sinMult_cma_ena0;
    assign u1_sinMult_cma_ena2 = u1_sinMult_cma_ena0;

    assign u1_sinMult_cma_a0 = u1_sinTable_r;
    assign u1_sinMult_cma_c0 = u1_beta_times_pi_over_4_shifted_b;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) u1_sinMult_cma_DSP0 (
        .clk(clk),
        .ena({ u1_sinMult_cma_ena2, u1_sinMult_cma_ena1, u1_sinMult_cma_ena0 }),
        .clr({ u1_sinMult_cma_reset, u1_sinMult_cma_reset }),
        .ay(u1_sinMult_cma_a0),
        .ax(u1_sinMult_cma_c0),
        .resulta(u1_sinMult_cma_s0),
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
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u1_sinMult_cma_delay0 ( .xin(u1_sinMult_cma_s0), .xout(u1_sinMult_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u1_sinMult_cma_q = $unsigned(u1_sinMult_cma_qq0[31:0]);

    // u1_shiftCosB(BITSHIFT,97)@23
    assign u1_shiftCosB_qint = u1_sinMult_cma_q;
    assign u1_shiftCosB_q = {8'b00000000, u1_shiftCosB_qint[31:22]};

    // d_u1_cosTable_r_23_notEnable(LOGICAL,682)@18
    assign d_u1_cosTable_r_23_notEnable_q = $unsigned(~ (VCC_q));

    // d_u1_cosTable_r_23_nor(LOGICAL,683)@18
    assign d_u1_cosTable_r_23_nor_q = ~ (d_u1_cosTable_r_23_notEnable_q | d_u1_cosTable_r_23_sticky_ena_q);

    // d_u1_cosTable_r_23_mem_last(CONSTANT,679)
    assign d_u1_cosTable_r_23_mem_last_q = $unsigned(3'b010);

    // d_u1_cosTable_r_23_cmp(LOGICAL,680)@18
    assign d_u1_cosTable_r_23_cmp_b = {1'b0, d_u1_cosTable_r_23_rdcnt_q};
    assign d_u1_cosTable_r_23_cmp_q = $unsigned(d_u1_cosTable_r_23_mem_last_q == d_u1_cosTable_r_23_cmp_b ? 1'b1 : 1'b0);

    // d_u1_cosTable_r_23_cmpReg(REG,681)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_cosTable_r_23_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_u1_cosTable_r_23_cmpReg_q <= $unsigned(d_u1_cosTable_r_23_cmp_q);
        end
    end

    // d_u1_cosTable_r_23_sticky_ena(REG,684)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_cosTable_r_23_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_u1_cosTable_r_23_nor_q == 1'b1)
        begin
            d_u1_cosTable_r_23_sticky_ena_q <= $unsigned(d_u1_cosTable_r_23_cmpReg_q);
        end
    end

    // d_u1_cosTable_r_23_enaAnd(LOGICAL,685)@18
    assign d_u1_cosTable_r_23_enaAnd_q = d_u1_cosTable_r_23_sticky_ena_q & VCC_q;

    // d_u1_cosTable_r_23_rdcnt(COUNTER,677)@18 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_cosTable_r_23_rdcnt_i <= 2'd0;
        end
        else
        begin
            d_u1_cosTable_r_23_rdcnt_i <= $unsigned(d_u1_cosTable_r_23_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign d_u1_cosTable_r_23_rdcnt_q = d_u1_cosTable_r_23_rdcnt_i[1:0];

    // d_u1_cosTable_r_23_wraddr(REG,678)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u1_cosTable_r_23_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            d_u1_cosTable_r_23_wraddr_q <= $unsigned(d_u1_cosTable_r_23_rdcnt_q);
        end
    end

    // d_u1_cosTable_r_23_mem(DUALMEM,676)@18 + 2
    assign d_u1_cosTable_r_23_mem_ia = u1_cosTable_r;
    assign d_u1_cosTable_r_23_mem_aa = d_u1_cosTable_r_23_wraddr_q;
    assign d_u1_cosTable_r_23_mem_ab = d_u1_cosTable_r_23_rdcnt_q;
    assign d_u1_cosTable_r_23_mem_ena_OrRstB = areset | d_u1_cosTable_r_23_enaAnd_q[0];
    assign d_u1_cosTable_r_23_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) d_u1_cosTable_r_23_mem_dmem (
        .clocken1(d_u1_cosTable_r_23_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_u1_cosTable_r_23_mem_reset0),
        .clock1(clk),
        .address_a(d_u1_cosTable_r_23_mem_aa),
        .data_a(d_u1_cosTable_r_23_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_u1_cosTable_r_23_mem_ab),
        .q_b(d_u1_cosTable_r_23_mem_iq),
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
    assign d_u1_cosTable_r_23_mem_q = d_u1_cosTable_r_23_mem_iq[15:0];

    // u1_lsCosTable(BITSHIFT,95)@23
    assign u1_lsCosTable_qint = { d_u1_cosTable_r_23_mem_q, 2'b00 };
    assign u1_lsCosTable_q = u1_lsCosTable_qint[17:0];

    // u1_cosSub(SUB,101)@23 + 1
    assign u1_cosSub_a = $unsigned(u1_lsCosTable_q);
    assign u1_cosSub_b = $unsigned(u1_shiftCosB_q);
    assign u1_cosSub_i = $unsigned(u0_sin_pi_over_4_q);
    assign u1_cosSub_a1 = d_u1_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? u1_cosSub_i : u1_cosSub_a;
    assign u1_cosSub_b1 = d_u1_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? 18'b0 : u1_cosSub_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_cosSub_o <= 18'b0;
        end
        else
        begin
            u1_cosSub_o <= $unsigned($signed(u1_cosSub_a1) - $signed(u1_cosSub_b1));
        end
    end
    assign u1_cosSub_q = u1_cosSub_o[17:0];

    // u1_roundedCos_trunc(BITSHIFT,502)@24
    assign u1_roundedCos_trunc_qint = u1_cosSub_q;
    assign u1_roundedCos_trunc_q = u1_roundedCos_trunc_qint[17:1];

    // u1_roundedCos_add(ADD,503)@24 + 1
    assign u1_roundedCos_add_a = $unsigned({3'b000, u1_roundedCos_trunc_q});
    assign u1_roundedCos_add_b = $unsigned({{18{u0_roundedSin_bias_q[1]}}, u0_roundedSin_bias_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_roundedCos_add_o <= 20'b0;
        end
        else
        begin
            u1_roundedCos_add_o <= $unsigned($signed(u1_roundedCos_add_a) + $signed(u1_roundedCos_add_b));
        end
    end
    assign u1_roundedCos_add_q = u1_roundedCos_add_o[18:0];

    // u1_roundedCos_shift(BITSHIFT,504)@25
    assign u1_roundedCos_shift_qint = u1_roundedCos_add_q;
    assign u1_roundedCos_shift_q = u1_roundedCos_shift_qint[18:1];

    // u1_roundedCos_bs(BITSELECT,505)@25
    assign u1_roundedCos_bs_in = u1_roundedCos_shift_q[16:0];
    assign u1_roundedCos_bs_b = u1_roundedCos_bs_in[16:0];

    // u1_doSwap(LOOKUP,104)@24 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_doSwap_q <= $unsigned(1'b0);
        end
        else
        begin
            unique case (d_u1_octantBitSelect_b_24_q)
                3'b000 : u1_doSwap_q <= 1'b0;
                3'b001 : u1_doSwap_q <= 1'b1;
                3'b010 : u1_doSwap_q <= 1'b1;
                3'b011 : u1_doSwap_q <= 1'b0;
                3'b100 : u1_doSwap_q <= 1'b0;
                3'b101 : u1_doSwap_q <= 1'b1;
                3'b110 : u1_doSwap_q <= 1'b1;
                3'b111 : u1_doSwap_q <= 1'b0;
                default : begin
                              // unreachable
                              u1_doSwap_q <= 1'bx;
                          end
            endcase
        end
    end

    // u1_cosSwapMux(MUX,112)@25 + 1
    assign u1_cosSwapMux_s = u1_doSwap_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_cosSwapMux_q <= 17'b0;
        end
        else
        begin
            unique case (u1_cosSwapMux_s)
                1'b0 : u1_cosSwapMux_q <= u1_roundedCos_bs_b;
                1'b1 : u1_cosSwapMux_q <= u1_roundedSin_bs_b;
                default : u1_cosSwapMux_q <= 17'b0;
            endcase
        end
    end

    // u1_cosInvert(SUB,114)@26 + 1
    assign u1_cosInvert_a = $unsigned({{15{GND_q[0]}}, GND_q});
    assign u1_cosInvert_b = $unsigned(u1_cosSwapMux_q[15:0]);
    assign u1_cosInvert_i = u1_cosInvert_b;
    assign u1_cosInvert_a1 = u1_doCosInvert_q == 1'b1 ? u1_cosInvert_i : u1_cosInvert_a;
    assign u1_cosInvert_b1 = u1_doCosInvert_q == 1'b1 ? 16'b0 : u1_cosInvert_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_cosInvert_o <= 16'b0;
        end
        else
        begin
            u1_cosInvert_o <= $unsigned($signed(u1_cosInvert_a1) - $signed(u1_cosInvert_b1));
        end
    end
    assign u1_cosInvert_q = u1_cosInvert_o[15:0];

    // u0_phaseIncrRegLookup_1(LOOKUP,7)@10 + 1
    assign u0_phaseIncrRegLookup_1_c = busIn_write;
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_phaseIncrRegLookup_1_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00001100100001 : u0_phaseIncrRegLookup_1_e <= u0_phaseIncrRegLookup_1_c;
                default : u0_phaseIncrRegLookup_1_e <= 1'b0;
            endcase
        end
    end

    // u0_phaseIncrReg_p1(SYNCREG,8)@11 + 1
    assign u0_phaseIncrReg_p1_a = d_busIn_writedata_11_q;
    assign u0_phaseIncrReg_p1_b = u0_phaseIncrRegLookup_1_e;
    dspba_sync_reg_ver #( .width1(32), .width2(2), .init_value(32'b00000000000000000000000000000010), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    u0_phaseIncrReg_p1 ( .xin(u0_phaseIncrReg_p1_a), .ena(u0_phaseIncrReg_p1_b), .clk1(bus_clk), .aclr1(bus_areset), .sxout(u0_phaseIncrReg_p1_v), .clk2(clk), .aclr2(areset), .xout() );

    // u0_phaseIncrRegLookup_0(LOOKUP,5)@10 + 1
    assign u0_phaseIncrRegLookup_0_c = busIn_write;
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_phaseIncrRegLookup_0_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00001100100000 : u0_phaseIncrRegLookup_0_e <= u0_phaseIncrRegLookup_0_c;
                default : u0_phaseIncrRegLookup_0_e <= 1'b0;
            endcase
        end
    end

    // u0_phaseIncrReg_p0(SYNCREG,6)@11 + 1
    assign u0_phaseIncrReg_p0_a = d_busIn_writedata_11_q;
    assign u0_phaseIncrReg_p0_b = u0_phaseIncrRegLookup_0_e;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00011010000010101010101010101010), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    u0_phaseIncrReg_p0 ( .xin(u0_phaseIncrReg_p0_a), .ena(u0_phaseIncrReg_p0_b), .clk1(bus_clk), .aclr1(bus_areset), .sxout(u0_phaseIncrReg_p0_v), .clk2(clk), .aclr2(areset), .xout() );

    // u0_phaseIncrMem(BITJOIN,9)@12
    assign u0_phaseIncrMem_q = {u0_phaseIncrReg_p1_v, u0_phaseIncrReg_p0_v};

    // u0_invertSin_bit_select_merged(BITSELECT,526)@10
    assign u0_invertSin_bit_select_merged_b = u0_phaseIncrMem_q[33:33];
    assign u0_invertSin_bit_select_merged_c = u0_phaseIncrMem_q[32:32];
    assign u0_invertSin_bit_select_merged_d = u0_phaseIncrMem_q[19:0];
    assign u0_invertSin_bit_select_merged_e = u0_phaseIncrMem_q[31:20];

    // d_u0_invertSin_bit_select_merged_c_25(DELAY,617)@10 + 15
    dspba_delay_ver #( .width(1), .depth(15), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u0_invertSin_bit_select_merged_c_25 ( .xin(u0_invertSin_bit_select_merged_c), .xout(d_u0_invertSin_bit_select_merged_c_25_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u0_accumAdd_b1_BitSelect_for_v(BITSELECT,212)@10
    assign u0_accumAdd_b1_BitSelect_for_v_b = xIn_p_0[19:0];
    assign u0_accumAdd_b1_BitSelect_for_v_c = xIn_p_0[31:20];

    // u0_accumAdd_b1_p1_of_2(ADD,213)@10 + 1
    assign u0_accumAdd_b1_p1_of_2_a = {1'b0, u0_accumAdd_b1_p1_of_2_q};
    assign u0_accumAdd_b1_p1_of_2_b = {1'b0, u0_invertSin_bit_select_merged_d};
    assign u0_accumAdd_b1_p1_of_2_i = $unsigned({ 1'b0, u0_accumAdd_b1_BitSelect_for_v_b });
    assign u0_accumAdd_b1_p1_of_2_a1 = xIn_s_0 == 1'b1 ? u0_accumAdd_b1_p1_of_2_i : u0_accumAdd_b1_p1_of_2_a;
    assign u0_accumAdd_b1_p1_of_2_b1 = xIn_s_0 == 1'b1 ? 21'b0 : u0_accumAdd_b1_p1_of_2_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_accumAdd_b1_p1_of_2_o <= 21'b0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_accumAdd_b1_p1_of_2_o <= $unsigned(u0_accumAdd_b1_p1_of_2_a1) + $unsigned(u0_accumAdd_b1_p1_of_2_b1);
        end
    end
    assign u0_accumAdd_b1_p1_of_2_c[0] = u0_accumAdd_b1_p1_of_2_o[20];
    assign u0_accumAdd_b1_p1_of_2_q = u0_accumAdd_b1_p1_of_2_o[19:0];

    // d_u0_accumAdd_b1_BitSelect_for_v_c_11(DELAY,576)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_accumAdd_b1_BitSelect_for_v_c_11_q <= '0;
        end
        else
        begin
            d_u0_accumAdd_b1_BitSelect_for_v_c_11_q <= u0_accumAdd_b1_BitSelect_for_v_c;
        end
    end

    // d_xIn_s_0_11(DELAY,549)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_s_0_11_q <= '0;
        end
        else
        begin
            d_xIn_s_0_11_q <= $unsigned(xIn_s_0);
        end
    end

    // d_u0_invertSin_bit_select_merged_e_11(DELAY,618)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_invertSin_bit_select_merged_e_11_q <= '0;
        end
        else
        begin
            d_u0_invertSin_bit_select_merged_e_11_q <= u0_invertSin_bit_select_merged_e;
        end
    end

    // u0_accumAdd_b1_p2_of_2(ADD,214)@11 + 1
    assign u0_accumAdd_b1_p2_of_2_cin = u0_accumAdd_b1_p1_of_2_c;
    assign u0_accumAdd_b1_p2_of_2_a = { {1'b0, u0_accumAdd_b1_p2_of_2_q}, 1'b1 };
    assign u0_accumAdd_b1_p2_of_2_b = { {1'b0, d_u0_invertSin_bit_select_merged_e_11_q}, u0_accumAdd_b1_p2_of_2_cin[0] };
    assign u0_accumAdd_b1_p2_of_2_i = $unsigned({ 1'b0, d_u0_accumAdd_b1_BitSelect_for_v_c_11_q, 1'b0 });
    assign u0_accumAdd_b1_p2_of_2_a1 = d_xIn_s_0_11_q == 1'b1 ? u0_accumAdd_b1_p2_of_2_i : u0_accumAdd_b1_p2_of_2_a;
    assign u0_accumAdd_b1_p2_of_2_b1 = d_xIn_s_0_11_q == 1'b1 ? 14'b0 : u0_accumAdd_b1_p2_of_2_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_accumAdd_b1_p2_of_2_o <= 14'b0;
        end
        else if (d_xIn_v_11_q == 1'b1)
        begin
            u0_accumAdd_b1_p2_of_2_o <= $unsigned(u0_accumAdd_b1_p2_of_2_a1) + $unsigned(u0_accumAdd_b1_p2_of_2_b1);
        end
    end
    assign u0_accumAdd_b1_p2_of_2_q = u0_accumAdd_b1_p2_of_2_o[12:1];

    // d_u0_accumAdd_b1_p1_of_2_q_12(DELAY,577)@11 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_accumAdd_b1_p1_of_2_q_12_q <= '0;
        end
        else
        begin
            d_u0_accumAdd_b1_p1_of_2_q_12_q <= $unsigned(u0_accumAdd_b1_p1_of_2_q);
        end
    end

    // u0_accumAdd_b1_BitJoin_for_q(BITJOIN,215)@12
    assign u0_accumAdd_b1_BitJoin_for_q_q = {u0_accumAdd_b1_p2_of_2_q, d_u0_accumAdd_b1_p1_of_2_q_12_q};

    // u0_octantBitSelect(BITSELECT,31)@12
    assign u0_octantBitSelect_b = u0_accumAdd_b1_BitJoin_for_q_q[31:29];

    // d_u0_octantBitSelect_b_24(DELAY,556)@12 + 12
    dspba_delay_ver #( .width(3), .depth(12), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u0_octantBitSelect_b_24 ( .xin(u0_octantBitSelect_b), .xout(d_u0_octantBitSelect_b_24_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // d_u0_octantBitSelect_b_25(DELAY,557)@24 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_octantBitSelect_b_25_q <= '0;
        end
        else
        begin
            d_u0_octantBitSelect_b_25_q <= d_u0_octantBitSelect_b_24_q;
        end
    end

    // u0_cosJoin(BITJOIN,66)@25
    assign u0_cosJoin_q = {d_u0_invertSin_bit_select_merged_c_25_q, d_u0_octantBitSelect_b_25_q};

    // u0_doCosInvert(LOOKUP,67)@25 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_doCosInvert_q <= $unsigned(1'b1);
        end
        else
        begin
            unique case (u0_cosJoin_q)
                4'b0000 : u0_doCosInvert_q <= 1'b1;
                4'b0001 : u0_doCosInvert_q <= 1'b1;
                4'b0010 : u0_doCosInvert_q <= 1'b0;
                4'b0011 : u0_doCosInvert_q <= 1'b0;
                4'b0100 : u0_doCosInvert_q <= 1'b0;
                4'b0101 : u0_doCosInvert_q <= 1'b0;
                4'b0110 : u0_doCosInvert_q <= 1'b1;
                4'b0111 : u0_doCosInvert_q <= 1'b1;
                4'b1000 : u0_doCosInvert_q <= 1'b0;
                4'b1001 : u0_doCosInvert_q <= 1'b0;
                4'b1010 : u0_doCosInvert_q <= 1'b1;
                4'b1011 : u0_doCosInvert_q <= 1'b1;
                4'b1100 : u0_doCosInvert_q <= 1'b1;
                4'b1101 : u0_doCosInvert_q <= 1'b1;
                4'b1110 : u0_doCosInvert_q <= 1'b0;
                4'b1111 : u0_doCosInvert_q <= 1'b0;
                default : begin
                              // unreachable
                              u0_doCosInvert_q <= 1'bx;
                          end
            endcase
        end
    end

    // u0_addnsubConst(LOOKUP,33)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_addnsubConst_q <= $unsigned(1'b1);
        end
        else
        begin
            unique case (u0_octantBitSelect_b)
                3'b000 : u0_addnsubConst_q <= 1'b1;
                3'b001 : u0_addnsubConst_q <= 1'b0;
                3'b010 : u0_addnsubConst_q <= 1'b1;
                3'b011 : u0_addnsubConst_q <= 1'b0;
                3'b100 : u0_addnsubConst_q <= 1'b1;
                3'b101 : u0_addnsubConst_q <= 1'b0;
                3'b110 : u0_addnsubConst_q <= 1'b1;
                3'b111 : u0_addnsubConst_q <= 1'b0;
                default : begin
                              // unreachable
                              u0_addnsubConst_q <= 1'bx;
                          end
            endcase
        end
    end

    // d_u0_addnsubConst_q_14(DELAY,558)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_addnsubConst_q_14_q <= '0;
        end
        else
        begin
            d_u0_addnsubConst_q_14_q <= $unsigned(u0_addnsubConst_q);
        end
    end

    // d_u0_accumAdd_b1_p1_of_2_q_13(DELAY,578)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_accumAdd_b1_p1_of_2_q_13_q <= '0;
        end
        else
        begin
            d_u0_accumAdd_b1_p1_of_2_q_13_q <= $unsigned(d_u0_accumAdd_b1_p1_of_2_q_12_q);
        end
    end

    // u0_rangeAddSub_p1_of_2(ADDSUB,222)@13 + 1
    assign u0_rangeAddSub_p1_of_2_s = u0_addnsubConst_q;
    assign u0_rangeAddSub_p1_of_2_a = $unsigned({1'b0, u0_rangeAddSub_BitSelect_for_a_b_const_q});
    assign u0_rangeAddSub_p1_of_2_b = $unsigned({1'b0, d_u0_accumAdd_b1_p1_of_2_q_13_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_rangeAddSub_p1_of_2_o <= 21'b0;
        end
        else
        begin
            if (u0_rangeAddSub_p1_of_2_s == 1'b1)
            begin
                u0_rangeAddSub_p1_of_2_o <= $unsigned($signed(u0_rangeAddSub_p1_of_2_a) + $signed(u0_rangeAddSub_p1_of_2_b));
            end
            else
            begin
                u0_rangeAddSub_p1_of_2_o <= $unsigned($signed(u0_rangeAddSub_p1_of_2_a) - $signed(u0_rangeAddSub_p1_of_2_b));
            end
        end
    end
    assign u0_rangeAddSub_p1_of_2_c[0] = u0_rangeAddSub_p1_of_2_o[20];
    assign u0_rangeAddSub_p1_of_2_q = u0_rangeAddSub_p1_of_2_o[19:0];

    // d_u0_accumAdd_b1_p2_of_2_q_14(DELAY,579)@12 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_accumAdd_b1_p2_of_2_q_14_delay_0 <= '0;
        end
        else
        begin
            d_u0_accumAdd_b1_p2_of_2_q_14_delay_0 <= $unsigned(u0_accumAdd_b1_p2_of_2_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_accumAdd_b1_p2_of_2_q_14_q <= d_u0_accumAdd_b1_p2_of_2_q_14_delay_0;
        end
    end

    // u0_rangeAddSub_BitSelect_for_b_BitJoin_for_c(BITJOIN,402)@14
    assign u0_rangeAddSub_BitSelect_for_b_BitJoin_for_c_q = {u0_rangeAddSub_UpperBits_for_b_q, d_u0_accumAdd_b1_p2_of_2_q_14_q};

    // u0_rangeAddSub_p2_of_2(ADDSUB,223)@14 + 1
    assign u0_rangeAddSub_p2_of_2_s = d_u0_addnsubConst_q_14_q;
    assign u0_rangeAddSub_p2_of_2_cin = u0_rangeAddSub_p1_of_2_c;
    assign u0_rangeAddSub_p2_of_2_a = $unsigned({ {1'b0, u0_rangeAddSub_BitSelect_for_a_c_const_q}, d_u0_addnsubConst_q_14_q[0] });
    assign u0_rangeAddSub_p2_of_2_b = $unsigned({ {1'b0, u0_rangeAddSub_BitSelect_for_b_BitJoin_for_c_q}, u0_rangeAddSub_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_rangeAddSub_p2_of_2_o <= 16'b0;
        end
        else
        begin
            if (u0_rangeAddSub_p2_of_2_s == 1'b1)
            begin
                u0_rangeAddSub_p2_of_2_o <= $unsigned($signed(u0_rangeAddSub_p2_of_2_a) + $signed(u0_rangeAddSub_p2_of_2_b));
            end
            else
            begin
                u0_rangeAddSub_p2_of_2_o <= $unsigned($signed(u0_rangeAddSub_p2_of_2_a) - $signed(u0_rangeAddSub_p2_of_2_b));
            end
        end
    end
    assign u0_rangeAddSub_p2_of_2_q = u0_rangeAddSub_p2_of_2_o[14:1];

    // d_u0_rangeAddSub_p1_of_2_q_15(DELAY,580)@14 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_rangeAddSub_p1_of_2_q_15_q <= '0;
        end
        else
        begin
            d_u0_rangeAddSub_p1_of_2_q_15_q <= $unsigned(u0_rangeAddSub_p1_of_2_q);
        end
    end

    // u0_rangeAddSub_BitJoin_for_q(BITJOIN,224)@15
    assign u0_rangeAddSub_BitJoin_for_q_q = {u0_rangeAddSub_p2_of_2_q, d_u0_rangeAddSub_p1_of_2_q_15_q};

    // u0_alphaBitSelect_bit_select_merged(BITSELECT,530)@15
    assign u0_alphaBitSelect_bit_select_merged_in = u0_rangeAddSub_BitJoin_for_q_q[29:0];
    assign u0_alphaBitSelect_bit_select_merged_b = u0_alphaBitSelect_bit_select_merged_in[28:21];
    assign u0_alphaBitSelect_bit_select_merged_c = u0_alphaBitSelect_bit_select_merged_in[29:29];
    assign u0_alphaBitSelect_bit_select_merged_d = u0_alphaBitSelect_bit_select_merged_in[20:0];

    // d_u0_alphaBitSelect_bit_select_merged_c_23(DELAY,629)@15 + 8
    dspba_delay_ver #( .width(1), .depth(8), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u0_alphaBitSelect_bit_select_merged_c_23 ( .xin(u0_alphaBitSelect_bit_select_merged_c), .xout(d_u0_alphaBitSelect_bit_select_merged_c_23_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u0_ls4(BITSHIFT,44)@15
    assign u0_ls4_qint = { u0_alphaBitSelect_bit_select_merged_d, 4'b0000 };
    assign u0_ls4_q = u0_ls4_qint[24:0];

    // u0_cm2_BitExpansion_for_b(BITJOIN,236)@15
    assign u0_cm2_BitExpansion_for_b_q = {u0_cm2_UpperBits_for_b_q, u0_ls4_q};

    // u0_cm2_BitSelect_for_b(BITSELECT,239)@15
    assign u0_cm2_BitSelect_for_b_b = u0_cm2_BitExpansion_for_b_q[19:0];
    assign u0_cm2_BitSelect_for_b_c = u0_cm2_BitExpansion_for_b_q[28:20];

    // u0_ls7(BITSHIFT,43)@15
    assign u0_ls7_qint = { u0_alphaBitSelect_bit_select_merged_d, 7'b0000000 };
    assign u0_ls7_q = u0_ls7_qint[27:0];

    // u0_cm2_BitExpansion_for_a(BITJOIN,234)@15
    assign u0_cm2_BitExpansion_for_a_q = {GND_q, u0_ls7_q};

    // u0_cm2_BitSelect_for_a(BITSELECT,238)@15
    assign u0_cm2_BitSelect_for_a_b = u0_cm2_BitExpansion_for_a_q[19:0];
    assign u0_cm2_BitSelect_for_a_c = u0_cm2_BitExpansion_for_a_q[28:20];

    // u0_cm2_p1_of_2(ADD,240)@15 + 1
    assign u0_cm2_p1_of_2_a = {1'b0, u0_cm2_BitSelect_for_a_b};
    assign u0_cm2_p1_of_2_b = {1'b0, u0_cm2_BitSelect_for_b_b};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cm2_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u0_cm2_p1_of_2_o <= $unsigned(u0_cm2_p1_of_2_a) + $unsigned(u0_cm2_p1_of_2_b);
        end
    end
    assign u0_cm2_p1_of_2_c[0] = u0_cm2_p1_of_2_o[20];
    assign u0_cm2_p1_of_2_q = u0_cm2_p1_of_2_o[19:0];

    // u0_ls10(BITSHIFT,41)@15
    assign u0_ls10_qint = { u0_alphaBitSelect_bit_select_merged_d, 10'b0000000000 };
    assign u0_ls10_q = u0_ls10_qint[30:0];

    // u0_cm1_BitExpansion_for_b(BITJOIN,227)@15
    assign u0_cm1_BitExpansion_for_b_q = {u0_cm1_UpperBits_for_b_q, u0_ls10_q};

    // u0_cm1_BitSelect_for_b(BITSELECT,230)@15
    assign u0_cm1_BitSelect_for_b_b = u0_cm1_BitExpansion_for_b_q[19:0];
    assign u0_cm1_BitSelect_for_b_c = u0_cm1_BitExpansion_for_b_q[33:20];

    // u0_ls12(BITSHIFT,40)@15
    assign u0_ls12_qint = { u0_alphaBitSelect_bit_select_merged_d, 12'b000000000000 };
    assign u0_ls12_q = u0_ls12_qint[32:0];

    // u0_cm1_BitExpansion_for_a(BITJOIN,225)@15
    assign u0_cm1_BitExpansion_for_a_q = {GND_q, u0_ls12_q};

    // u0_cm1_BitSelect_for_a(BITSELECT,229)@15
    assign u0_cm1_BitSelect_for_a_b = u0_cm1_BitExpansion_for_a_q[19:0];
    assign u0_cm1_BitSelect_for_a_c = u0_cm1_BitExpansion_for_a_q[33:20];

    // u0_cm1_p1_of_2(SUB,231)@15 + 1
    assign u0_cm1_p1_of_2_a = $unsigned({1'b0, u0_cm1_BitSelect_for_a_b});
    assign u0_cm1_p1_of_2_b = $unsigned({1'b0, u0_cm1_BitSelect_for_b_b});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cm1_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u0_cm1_p1_of_2_o <= $unsigned($signed(u0_cm1_p1_of_2_a) - $signed(u0_cm1_p1_of_2_b));
        end
    end
    assign u0_cm1_p1_of_2_c[0] = u0_cm1_p1_of_2_o[20];
    assign u0_cm1_p1_of_2_q = u0_cm1_p1_of_2_o[19:0];

    // u0_cm3_p1_of_2(ADD,249)@16 + 1
    assign u0_cm3_p1_of_2_a = {1'b0, u0_cm1_p1_of_2_q};
    assign u0_cm3_p1_of_2_b = {1'b0, u0_cm2_p1_of_2_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cm3_p1_of_2_o <= 21'b0;
        end
        else
        begin
            u0_cm3_p1_of_2_o <= $unsigned(u0_cm3_p1_of_2_a) + $unsigned(u0_cm3_p1_of_2_b);
        end
    end
    assign u0_cm3_p1_of_2_c[0] = u0_cm3_p1_of_2_o[20];
    assign u0_cm3_p1_of_2_q = u0_cm3_p1_of_2_o[19:0];

    // d_u0_cm2_BitSelect_for_b_c_16(DELAY,584)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_cm2_BitSelect_for_b_c_16_q <= '0;
        end
        else
        begin
            d_u0_cm2_BitSelect_for_b_c_16_q <= u0_cm2_BitSelect_for_b_c;
        end
    end

    // d_u0_cm2_BitSelect_for_a_c_16(DELAY,583)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_cm2_BitSelect_for_a_c_16_q <= '0;
        end
        else
        begin
            d_u0_cm2_BitSelect_for_a_c_16_q <= u0_cm2_BitSelect_for_a_c;
        end
    end

    // u0_cm2_p2_of_2(ADD,241)@16 + 1
    assign u0_cm2_p2_of_2_cin = u0_cm2_p1_of_2_c;
    assign u0_cm2_p2_of_2_a = { {1'b0, d_u0_cm2_BitSelect_for_a_c_16_q}, 1'b1 };
    assign u0_cm2_p2_of_2_b = { {1'b0, d_u0_cm2_BitSelect_for_b_c_16_q}, u0_cm2_p2_of_2_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cm2_p2_of_2_o <= 11'b0;
        end
        else
        begin
            u0_cm2_p2_of_2_o <= $unsigned(u0_cm2_p2_of_2_a) + $unsigned(u0_cm2_p2_of_2_b);
        end
    end
    assign u0_cm2_p2_of_2_q = u0_cm2_p2_of_2_o[9:1];

    // u0_cm3_BitSelect_for_b_BitJoin_for_c(BITJOIN,412)@17
    assign u0_cm3_BitSelect_for_b_BitJoin_for_c_q = {u0_cm3_UpperBits_for_b_q, u0_cm2_p2_of_2_q};

    // d_u0_cm1_BitSelect_for_b_c_16(DELAY,582)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_cm1_BitSelect_for_b_c_16_q <= '0;
        end
        else
        begin
            d_u0_cm1_BitSelect_for_b_c_16_q <= u0_cm1_BitSelect_for_b_c;
        end
    end

    // d_u0_cm1_BitSelect_for_a_c_16(DELAY,581)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_cm1_BitSelect_for_a_c_16_q <= '0;
        end
        else
        begin
            d_u0_cm1_BitSelect_for_a_c_16_q <= u0_cm1_BitSelect_for_a_c;
        end
    end

    // u0_cm1_p2_of_2(SUB,232)@16 + 1
    assign u0_cm1_p2_of_2_cin = u0_cm1_p1_of_2_c;
    assign u0_cm1_p2_of_2_a = $unsigned({ {1'b0, d_u0_cm1_BitSelect_for_a_c_16_q}, 1'b0 });
    assign u0_cm1_p2_of_2_b = $unsigned({ {1'b0, d_u0_cm1_BitSelect_for_b_c_16_q}, u0_cm1_p2_of_2_cin[0] });
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cm1_p2_of_2_o <= 16'b0;
        end
        else
        begin
            u0_cm1_p2_of_2_o <= $unsigned($signed(u0_cm1_p2_of_2_a) - $signed(u0_cm1_p2_of_2_b));
        end
    end
    assign u0_cm1_p2_of_2_q = u0_cm1_p2_of_2_o[14:1];

    // u0_cm3_BitSelect_for_a_BitJoin_for_c(BITJOIN,407)@17
    assign u0_cm3_BitSelect_for_a_BitJoin_for_c_q = {GND_q, u0_cm1_p2_of_2_q};

    // u0_cm3_p2_of_2(ADD,250)@17 + 1
    assign u0_cm3_p2_of_2_cin = u0_cm3_p1_of_2_c;
    assign u0_cm3_p2_of_2_a = { {1'b0, u0_cm3_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign u0_cm3_p2_of_2_b = { {1'b0, u0_cm3_BitSelect_for_b_BitJoin_for_c_q}, u0_cm3_p2_of_2_cin[0] };
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cm3_p2_of_2_o <= 17'b0;
        end
        else
        begin
            u0_cm3_p2_of_2_o <= $unsigned(u0_cm3_p2_of_2_a) + $unsigned(u0_cm3_p2_of_2_b);
        end
    end
    assign u0_cm3_p2_of_2_q = u0_cm3_p2_of_2_o[15:1];

    // d_u0_cm3_p1_of_2_q_18(DELAY,585)@17 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_cm3_p1_of_2_q_18_q <= '0;
        end
        else
        begin
            d_u0_cm3_p1_of_2_q_18_q <= $unsigned(u0_cm3_p1_of_2_q);
        end
    end

    // u0_cm3_BitJoin_for_q(BITJOIN,251)@18
    assign u0_cm3_BitJoin_for_q_q = {u0_cm3_p2_of_2_q, d_u0_cm3_p1_of_2_q_18_q};

    // u0_beta_times_4_shift(BITSHIFT,47)@18
    assign u0_beta_times_4_shift_qint = { u0_cm3_BitJoin_for_q_q, 3'b000 };
    assign u0_beta_times_4_shift_q = u0_beta_times_4_shift_qint[37:0];

    // u0_beta_times_pi_over_4_shifted(BITSELECT,48)@18
    assign u0_beta_times_pi_over_4_shifted_in = u0_beta_times_4_shift_q[35:0];
    assign u0_beta_times_pi_over_4_shifted_b = u0_beta_times_pi_over_4_shifted_in[35:20];

    // d_u0_alphaBitSelect_bit_select_merged_b_16(DELAY,628)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_alphaBitSelect_bit_select_merged_b_16_q <= '0;
        end
        else
        begin
            d_u0_alphaBitSelect_bit_select_merged_b_16_q <= u0_alphaBitSelect_bit_select_merged_b;
        end
    end

    // u0_cosTable(DUALMEM,39)@16 + 2
    assign u0_cosTable_aa = d_u0_alphaBitSelect_bit_select_merged_b_16_q;
    assign u0_cosTable_ena_NotRstA = ~ (areset);
    assign u0_cosTable_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO_u0_cosTable.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) u0_cosTable_dmem (
        .clocken0(u0_cosTable_ena_NotRstA),
        .sclr(u0_cosTable_reset0),
        .clock0(clk),
        .address_a(u0_cosTable_aa),
        .q_a(u0_cosTable_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign u0_cosTable_r = u0_cosTable_ir[15:0];

    // u0_cosMult_cma(CHAINMULTADD,203)@18 + 5
    assign u0_cosMult_cma_reset = areset;
    assign u0_cosMult_cma_ena0 = 1'b1;
    assign u0_cosMult_cma_ena1 = u0_cosMult_cma_ena0;
    assign u0_cosMult_cma_ena2 = u0_cosMult_cma_ena0;

    assign u0_cosMult_cma_a0 = u0_cosTable_r;
    assign u0_cosMult_cma_c0 = u0_beta_times_pi_over_4_shifted_b;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) u0_cosMult_cma_DSP0 (
        .clk(clk),
        .ena({ u0_cosMult_cma_ena2, u0_cosMult_cma_ena1, u0_cosMult_cma_ena0 }),
        .clr({ u0_cosMult_cma_reset, u0_cosMult_cma_reset }),
        .ay(u0_cosMult_cma_a0),
        .ax(u0_cosMult_cma_c0),
        .resulta(u0_cosMult_cma_s0),
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
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_cosMult_cma_delay0 ( .xin(u0_cosMult_cma_s0), .xout(u0_cosMult_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_cosMult_cma_q = $unsigned(u0_cosMult_cma_qq0[31:0]);

    // u0_shiftSinB(BITSHIFT,53)@23
    assign u0_shiftSinB_qint = u0_cosMult_cma_q;
    assign u0_shiftSinB_q = {8'b00000000, u0_shiftSinB_qint[31:22]};

    // d_u0_sinTable_r_23_notEnable(LOGICAL,652)@18
    assign d_u0_sinTable_r_23_notEnable_q = $unsigned(~ (VCC_q));

    // d_u0_sinTable_r_23_nor(LOGICAL,653)@18
    assign d_u0_sinTable_r_23_nor_q = ~ (d_u0_sinTable_r_23_notEnable_q | d_u0_sinTable_r_23_sticky_ena_q);

    // d_u0_sinTable_r_23_mem_last(CONSTANT,649)
    assign d_u0_sinTable_r_23_mem_last_q = $unsigned(3'b010);

    // d_u0_sinTable_r_23_cmp(LOGICAL,650)@18
    assign d_u0_sinTable_r_23_cmp_b = {1'b0, d_u0_sinTable_r_23_rdcnt_q};
    assign d_u0_sinTable_r_23_cmp_q = $unsigned(d_u0_sinTable_r_23_mem_last_q == d_u0_sinTable_r_23_cmp_b ? 1'b1 : 1'b0);

    // d_u0_sinTable_r_23_cmpReg(REG,651)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_sinTable_r_23_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_u0_sinTable_r_23_cmpReg_q <= $unsigned(d_u0_sinTable_r_23_cmp_q);
        end
    end

    // d_u0_sinTable_r_23_sticky_ena(REG,654)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_sinTable_r_23_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_u0_sinTable_r_23_nor_q == 1'b1)
        begin
            d_u0_sinTable_r_23_sticky_ena_q <= $unsigned(d_u0_sinTable_r_23_cmpReg_q);
        end
    end

    // d_u0_sinTable_r_23_enaAnd(LOGICAL,655)@18
    assign d_u0_sinTable_r_23_enaAnd_q = d_u0_sinTable_r_23_sticky_ena_q & VCC_q;

    // d_u0_sinTable_r_23_rdcnt(COUNTER,647)@18 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_sinTable_r_23_rdcnt_i <= 2'd0;
        end
        else
        begin
            d_u0_sinTable_r_23_rdcnt_i <= $unsigned(d_u0_sinTable_r_23_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign d_u0_sinTable_r_23_rdcnt_q = d_u0_sinTable_r_23_rdcnt_i[1:0];

    // u0_sinTable(DUALMEM,38)@16 + 2
    assign u0_sinTable_aa = d_u0_alphaBitSelect_bit_select_merged_b_16_q;
    assign u0_sinTable_ena_NotRstA = ~ (areset);
    assign u0_sinTable_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO_u0_sinTable.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) u0_sinTable_dmem (
        .clocken0(u0_sinTable_ena_NotRstA),
        .sclr(u0_sinTable_reset0),
        .clock0(clk),
        .address_a(u0_sinTable_aa),
        .q_a(u0_sinTable_ir),
        .wren_a(),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_a(),
        .data_b(),
        .address_b(),
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
        .q_b(),
        .eccstatus()
    );
    assign u0_sinTable_r = u0_sinTable_ir[15:0];

    // d_u0_sinTable_r_23_wraddr(REG,648)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_sinTable_r_23_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            d_u0_sinTable_r_23_wraddr_q <= $unsigned(d_u0_sinTable_r_23_rdcnt_q);
        end
    end

    // d_u0_sinTable_r_23_mem(DUALMEM,646)@18 + 2
    assign d_u0_sinTable_r_23_mem_ia = u0_sinTable_r;
    assign d_u0_sinTable_r_23_mem_aa = d_u0_sinTable_r_23_wraddr_q;
    assign d_u0_sinTable_r_23_mem_ab = d_u0_sinTable_r_23_rdcnt_q;
    assign d_u0_sinTable_r_23_mem_ena_OrRstB = areset | d_u0_sinTable_r_23_enaAnd_q[0];
    assign d_u0_sinTable_r_23_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) d_u0_sinTable_r_23_mem_dmem (
        .clocken1(d_u0_sinTable_r_23_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_u0_sinTable_r_23_mem_reset0),
        .clock1(clk),
        .address_a(d_u0_sinTable_r_23_mem_aa),
        .data_a(d_u0_sinTable_r_23_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_u0_sinTable_r_23_mem_ab),
        .q_b(d_u0_sinTable_r_23_mem_iq),
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
    assign d_u0_sinTable_r_23_mem_q = d_u0_sinTable_r_23_mem_iq[15:0];

    // u0_lsSinTable(BITSHIFT,51)@23
    assign u0_lsSinTable_qint = { d_u0_sinTable_r_23_mem_q, 2'b00 };
    assign u0_lsSinTable_q = u0_lsSinTable_qint[17:0];

    // u0_sinAdd(ADD,57)@23 + 1
    assign u0_sinAdd_a = u0_lsSinTable_q;
    assign u0_sinAdd_b = u0_shiftSinB_q;
    assign u0_sinAdd_i = u0_sin_pi_over_4_q;
    assign u0_sinAdd_a1 = d_u0_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? u0_sinAdd_i : u0_sinAdd_a;
    assign u0_sinAdd_b1 = d_u0_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? 18'b0 : u0_sinAdd_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_sinAdd_o <= 18'b0;
        end
        else
        begin
            u0_sinAdd_o <= $unsigned(u0_sinAdd_a1) + $unsigned(u0_sinAdd_b1);
        end
    end
    assign u0_sinAdd_q = u0_sinAdd_o[17:0];

    // u0_roundedSin_trunc(BITSHIFT,487)@24
    assign u0_roundedSin_trunc_qint = u0_sinAdd_q;
    assign u0_roundedSin_trunc_q = u0_roundedSin_trunc_qint[17:1];

    // u0_roundedSin_add(ADD,488)@24 + 1
    assign u0_roundedSin_add_a = $unsigned({3'b000, u0_roundedSin_trunc_q});
    assign u0_roundedSin_add_b = $unsigned({{18{u0_roundedSin_bias_q[1]}}, u0_roundedSin_bias_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_roundedSin_add_o <= 20'b0;
        end
        else
        begin
            u0_roundedSin_add_o <= $unsigned($signed(u0_roundedSin_add_a) + $signed(u0_roundedSin_add_b));
        end
    end
    assign u0_roundedSin_add_q = u0_roundedSin_add_o[18:0];

    // u0_roundedSin_shift(BITSHIFT,489)@25
    assign u0_roundedSin_shift_qint = u0_roundedSin_add_q;
    assign u0_roundedSin_shift_q = u0_roundedSin_shift_qint[18:1];

    // u0_roundedSin_bs(BITSELECT,490)@25
    assign u0_roundedSin_bs_in = u0_roundedSin_shift_q[16:0];
    assign u0_roundedSin_bs_b = u0_roundedSin_bs_in[16:0];

    // u0_sinMult_cma(CHAINMULTADD,202)@18 + 5
    assign u0_sinMult_cma_reset = areset;
    assign u0_sinMult_cma_ena0 = 1'b1;
    assign u0_sinMult_cma_ena1 = u0_sinMult_cma_ena0;
    assign u0_sinMult_cma_ena2 = u0_sinMult_cma_ena0;

    assign u0_sinMult_cma_a0 = u0_sinTable_r;
    assign u0_sinMult_cma_c0 = u0_beta_times_pi_over_4_shifted_b;
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(32)
    ) u0_sinMult_cma_DSP0 (
        .clk(clk),
        .ena({ u0_sinMult_cma_ena2, u0_sinMult_cma_ena1, u0_sinMult_cma_ena0 }),
        .clr({ u0_sinMult_cma_reset, u0_sinMult_cma_reset }),
        .ay(u0_sinMult_cma_a0),
        .ax(u0_sinMult_cma_c0),
        .resulta(u0_sinMult_cma_s0),
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
    dspba_delay_ver #( .width(32), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_sinMult_cma_delay0 ( .xin(u0_sinMult_cma_s0), .xout(u0_sinMult_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_sinMult_cma_q = $unsigned(u0_sinMult_cma_qq0[31:0]);

    // u0_shiftCosB(BITSHIFT,54)@23
    assign u0_shiftCosB_qint = u0_sinMult_cma_q;
    assign u0_shiftCosB_q = {8'b00000000, u0_shiftCosB_qint[31:22]};

    // d_u0_cosTable_r_23_notEnable(LOGICAL,662)@18
    assign d_u0_cosTable_r_23_notEnable_q = $unsigned(~ (VCC_q));

    // d_u0_cosTable_r_23_nor(LOGICAL,663)@18
    assign d_u0_cosTable_r_23_nor_q = ~ (d_u0_cosTable_r_23_notEnable_q | d_u0_cosTable_r_23_sticky_ena_q);

    // d_u0_cosTable_r_23_mem_last(CONSTANT,659)
    assign d_u0_cosTable_r_23_mem_last_q = $unsigned(3'b010);

    // d_u0_cosTable_r_23_cmp(LOGICAL,660)@18
    assign d_u0_cosTable_r_23_cmp_b = {1'b0, d_u0_cosTable_r_23_rdcnt_q};
    assign d_u0_cosTable_r_23_cmp_q = $unsigned(d_u0_cosTable_r_23_mem_last_q == d_u0_cosTable_r_23_cmp_b ? 1'b1 : 1'b0);

    // d_u0_cosTable_r_23_cmpReg(REG,661)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_cosTable_r_23_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_u0_cosTable_r_23_cmpReg_q <= $unsigned(d_u0_cosTable_r_23_cmp_q);
        end
    end

    // d_u0_cosTable_r_23_sticky_ena(REG,664)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_cosTable_r_23_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_u0_cosTable_r_23_nor_q == 1'b1)
        begin
            d_u0_cosTable_r_23_sticky_ena_q <= $unsigned(d_u0_cosTable_r_23_cmpReg_q);
        end
    end

    // d_u0_cosTable_r_23_enaAnd(LOGICAL,665)@18
    assign d_u0_cosTable_r_23_enaAnd_q = d_u0_cosTable_r_23_sticky_ena_q & VCC_q;

    // d_u0_cosTable_r_23_rdcnt(COUNTER,657)@18 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_cosTable_r_23_rdcnt_i <= 2'd0;
        end
        else
        begin
            d_u0_cosTable_r_23_rdcnt_i <= $unsigned(d_u0_cosTable_r_23_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign d_u0_cosTable_r_23_rdcnt_q = d_u0_cosTable_r_23_rdcnt_i[1:0];

    // d_u0_cosTable_r_23_wraddr(REG,658)@18 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_cosTable_r_23_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            d_u0_cosTable_r_23_wraddr_q <= $unsigned(d_u0_cosTable_r_23_rdcnt_q);
        end
    end

    // d_u0_cosTable_r_23_mem(DUALMEM,656)@18 + 2
    assign d_u0_cosTable_r_23_mem_ia = u0_cosTable_r;
    assign d_u0_cosTable_r_23_mem_aa = d_u0_cosTable_r_23_wraddr_q;
    assign d_u0_cosTable_r_23_mem_ab = d_u0_cosTable_r_23_rdcnt_q;
    assign d_u0_cosTable_r_23_mem_ena_OrRstB = areset | d_u0_cosTable_r_23_enaAnd_q[0];
    assign d_u0_cosTable_r_23_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) d_u0_cosTable_r_23_mem_dmem (
        .clocken1(d_u0_cosTable_r_23_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_u0_cosTable_r_23_mem_reset0),
        .clock1(clk),
        .address_a(d_u0_cosTable_r_23_mem_aa),
        .data_a(d_u0_cosTable_r_23_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_u0_cosTable_r_23_mem_ab),
        .q_b(d_u0_cosTable_r_23_mem_iq),
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
    assign d_u0_cosTable_r_23_mem_q = d_u0_cosTable_r_23_mem_iq[15:0];

    // u0_lsCosTable(BITSHIFT,52)@23
    assign u0_lsCosTable_qint = { d_u0_cosTable_r_23_mem_q, 2'b00 };
    assign u0_lsCosTable_q = u0_lsCosTable_qint[17:0];

    // u0_cosSub(SUB,58)@23 + 1
    assign u0_cosSub_a = $unsigned(u0_lsCosTable_q);
    assign u0_cosSub_b = $unsigned(u0_shiftCosB_q);
    assign u0_cosSub_i = $unsigned(u0_sin_pi_over_4_q);
    assign u0_cosSub_a1 = d_u0_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? u0_cosSub_i : u0_cosSub_a;
    assign u0_cosSub_b1 = d_u0_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? 18'b0 : u0_cosSub_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cosSub_o <= 18'b0;
        end
        else
        begin
            u0_cosSub_o <= $unsigned($signed(u0_cosSub_a1) - $signed(u0_cosSub_b1));
        end
    end
    assign u0_cosSub_q = u0_cosSub_o[17:0];

    // u0_roundedCos_trunc(BITSHIFT,492)@24
    assign u0_roundedCos_trunc_qint = u0_cosSub_q;
    assign u0_roundedCos_trunc_q = u0_roundedCos_trunc_qint[17:1];

    // u0_roundedCos_add(ADD,493)@24 + 1
    assign u0_roundedCos_add_a = $unsigned({3'b000, u0_roundedCos_trunc_q});
    assign u0_roundedCos_add_b = $unsigned({{18{u0_roundedSin_bias_q[1]}}, u0_roundedSin_bias_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_roundedCos_add_o <= 20'b0;
        end
        else
        begin
            u0_roundedCos_add_o <= $unsigned($signed(u0_roundedCos_add_a) + $signed(u0_roundedCos_add_b));
        end
    end
    assign u0_roundedCos_add_q = u0_roundedCos_add_o[18:0];

    // u0_roundedCos_shift(BITSHIFT,494)@25
    assign u0_roundedCos_shift_qint = u0_roundedCos_add_q;
    assign u0_roundedCos_shift_q = u0_roundedCos_shift_qint[18:1];

    // u0_roundedCos_bs(BITSELECT,495)@25
    assign u0_roundedCos_bs_in = u0_roundedCos_shift_q[16:0];
    assign u0_roundedCos_bs_b = u0_roundedCos_bs_in[16:0];

    // u0_doSwap(LOOKUP,61)@24 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_doSwap_q <= $unsigned(1'b0);
        end
        else
        begin
            unique case (d_u0_octantBitSelect_b_24_q)
                3'b000 : u0_doSwap_q <= 1'b0;
                3'b001 : u0_doSwap_q <= 1'b1;
                3'b010 : u0_doSwap_q <= 1'b1;
                3'b011 : u0_doSwap_q <= 1'b0;
                3'b100 : u0_doSwap_q <= 1'b0;
                3'b101 : u0_doSwap_q <= 1'b1;
                3'b110 : u0_doSwap_q <= 1'b1;
                3'b111 : u0_doSwap_q <= 1'b0;
                default : begin
                              // unreachable
                              u0_doSwap_q <= 1'bx;
                          end
            endcase
        end
    end

    // u0_cosSwapMux(MUX,69)@25 + 1
    assign u0_cosSwapMux_s = u0_doSwap_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cosSwapMux_q <= 17'b0;
        end
        else
        begin
            unique case (u0_cosSwapMux_s)
                1'b0 : u0_cosSwapMux_q <= u0_roundedCos_bs_b;
                1'b1 : u0_cosSwapMux_q <= u0_roundedSin_bs_b;
                default : u0_cosSwapMux_q <= 17'b0;
            endcase
        end
    end

    // u0_cosInvert(SUB,71)@26 + 1
    assign u0_cosInvert_a = $unsigned({{15{GND_q[0]}}, GND_q});
    assign u0_cosInvert_b = $unsigned(u0_cosSwapMux_q[15:0]);
    assign u0_cosInvert_i = u0_cosInvert_b;
    assign u0_cosInvert_a1 = u0_doCosInvert_q == 1'b1 ? u0_cosInvert_i : u0_cosInvert_a;
    assign u0_cosInvert_b1 = u0_doCosInvert_q == 1'b1 ? 16'b0 : u0_cosInvert_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cosInvert_o <= 16'b0;
        end
        else
        begin
            u0_cosInvert_o <= $unsigned($signed(u0_cosInvert_a1) - $signed(u0_cosInvert_b1));
        end
    end
    assign u0_cosInvert_q = u0_cosInvert_o[15:0];

    // d_u3_invertSin_bit_select_merged_b_25(DELAY,625)@10 + 15
    dspba_delay_ver #( .width(1), .depth(15), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u3_invertSin_bit_select_merged_b_25 ( .xin(u3_invertSin_bit_select_merged_b), .xout(d_u3_invertSin_bit_select_merged_b_25_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u3_sinJoin(BITJOIN,192)@25
    assign u3_sinJoin_q = {d_u3_invertSin_bit_select_merged_b_25_q, d_u3_octantBitSelect_b_25_q};

    // u3_doSinInvert(LOOKUP,193)@25 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_doSinInvert_q <= $unsigned(1'b1);
        end
        else
        begin
            unique case (u3_sinJoin_q)
                4'b0000 : u3_doSinInvert_q <= 1'b1;
                4'b0001 : u3_doSinInvert_q <= 1'b1;
                4'b0010 : u3_doSinInvert_q <= 1'b1;
                4'b0011 : u3_doSinInvert_q <= 1'b1;
                4'b0100 : u3_doSinInvert_q <= 1'b0;
                4'b0101 : u3_doSinInvert_q <= 1'b0;
                4'b0110 : u3_doSinInvert_q <= 1'b0;
                4'b0111 : u3_doSinInvert_q <= 1'b0;
                4'b1000 : u3_doSinInvert_q <= 1'b0;
                4'b1001 : u3_doSinInvert_q <= 1'b0;
                4'b1010 : u3_doSinInvert_q <= 1'b0;
                4'b1011 : u3_doSinInvert_q <= 1'b0;
                4'b1100 : u3_doSinInvert_q <= 1'b1;
                4'b1101 : u3_doSinInvert_q <= 1'b1;
                4'b1110 : u3_doSinInvert_q <= 1'b1;
                4'b1111 : u3_doSinInvert_q <= 1'b1;
                default : begin
                              // unreachable
                              u3_doSinInvert_q <= 1'bx;
                          end
            endcase
        end
    end

    // u3_sinSwapMux(MUX,197)@25 + 1
    assign u3_sinSwapMux_s = u3_doSwap_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_sinSwapMux_q <= 17'b0;
        end
        else
        begin
            unique case (u3_sinSwapMux_s)
                1'b0 : u3_sinSwapMux_q <= u3_roundedSin_bs_b;
                1'b1 : u3_sinSwapMux_q <= u3_roundedCos_bs_b;
                default : u3_sinSwapMux_q <= 17'b0;
            endcase
        end
    end

    // u3_sinInvert(SUB,199)@26 + 1
    assign u3_sinInvert_a = $unsigned({{15{GND_q[0]}}, GND_q});
    assign u3_sinInvert_b = $unsigned(u3_sinSwapMux_q[15:0]);
    assign u3_sinInvert_i = u3_sinInvert_b;
    assign u3_sinInvert_a1 = u3_doSinInvert_q == 1'b1 ? u3_sinInvert_i : u3_sinInvert_a;
    assign u3_sinInvert_b1 = u3_doSinInvert_q == 1'b1 ? 16'b0 : u3_sinInvert_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u3_sinInvert_o <= 16'b0;
        end
        else
        begin
            u3_sinInvert_o <= $unsigned($signed(u3_sinInvert_a1) - $signed(u3_sinInvert_b1));
        end
    end
    assign u3_sinInvert_q = u3_sinInvert_o[15:0];

    // d_u2_invertSin_bit_select_merged_b_25(DELAY,622)@10 + 15
    dspba_delay_ver #( .width(1), .depth(15), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u2_invertSin_bit_select_merged_b_25 ( .xin(u2_invertSin_bit_select_merged_b), .xout(d_u2_invertSin_bit_select_merged_b_25_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u2_sinJoin(BITJOIN,149)@25
    assign u2_sinJoin_q = {d_u2_invertSin_bit_select_merged_b_25_q, d_u2_octantBitSelect_b_25_q};

    // u2_doSinInvert(LOOKUP,150)@25 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_doSinInvert_q <= $unsigned(1'b1);
        end
        else
        begin
            unique case (u2_sinJoin_q)
                4'b0000 : u2_doSinInvert_q <= 1'b1;
                4'b0001 : u2_doSinInvert_q <= 1'b1;
                4'b0010 : u2_doSinInvert_q <= 1'b1;
                4'b0011 : u2_doSinInvert_q <= 1'b1;
                4'b0100 : u2_doSinInvert_q <= 1'b0;
                4'b0101 : u2_doSinInvert_q <= 1'b0;
                4'b0110 : u2_doSinInvert_q <= 1'b0;
                4'b0111 : u2_doSinInvert_q <= 1'b0;
                4'b1000 : u2_doSinInvert_q <= 1'b0;
                4'b1001 : u2_doSinInvert_q <= 1'b0;
                4'b1010 : u2_doSinInvert_q <= 1'b0;
                4'b1011 : u2_doSinInvert_q <= 1'b0;
                4'b1100 : u2_doSinInvert_q <= 1'b1;
                4'b1101 : u2_doSinInvert_q <= 1'b1;
                4'b1110 : u2_doSinInvert_q <= 1'b1;
                4'b1111 : u2_doSinInvert_q <= 1'b1;
                default : begin
                              // unreachable
                              u2_doSinInvert_q <= 1'bx;
                          end
            endcase
        end
    end

    // u2_sinSwapMux(MUX,154)@25 + 1
    assign u2_sinSwapMux_s = u2_doSwap_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_sinSwapMux_q <= 17'b0;
        end
        else
        begin
            unique case (u2_sinSwapMux_s)
                1'b0 : u2_sinSwapMux_q <= u2_roundedSin_bs_b;
                1'b1 : u2_sinSwapMux_q <= u2_roundedCos_bs_b;
                default : u2_sinSwapMux_q <= 17'b0;
            endcase
        end
    end

    // u2_sinInvert(SUB,156)@26 + 1
    assign u2_sinInvert_a = $unsigned({{15{GND_q[0]}}, GND_q});
    assign u2_sinInvert_b = $unsigned(u2_sinSwapMux_q[15:0]);
    assign u2_sinInvert_i = u2_sinInvert_b;
    assign u2_sinInvert_a1 = u2_doSinInvert_q == 1'b1 ? u2_sinInvert_i : u2_sinInvert_a;
    assign u2_sinInvert_b1 = u2_doSinInvert_q == 1'b1 ? 16'b0 : u2_sinInvert_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u2_sinInvert_o <= 16'b0;
        end
        else
        begin
            u2_sinInvert_o <= $unsigned($signed(u2_sinInvert_a1) - $signed(u2_sinInvert_b1));
        end
    end
    assign u2_sinInvert_q = u2_sinInvert_o[15:0];

    // d_u1_invertSin_bit_select_merged_b_25(DELAY,619)@10 + 15
    dspba_delay_ver #( .width(1), .depth(15), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u1_invertSin_bit_select_merged_b_25 ( .xin(u1_invertSin_bit_select_merged_b), .xout(d_u1_invertSin_bit_select_merged_b_25_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u1_sinJoin(BITJOIN,106)@25
    assign u1_sinJoin_q = {d_u1_invertSin_bit_select_merged_b_25_q, d_u1_octantBitSelect_b_25_q};

    // u1_doSinInvert(LOOKUP,107)@25 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_doSinInvert_q <= $unsigned(1'b1);
        end
        else
        begin
            unique case (u1_sinJoin_q)
                4'b0000 : u1_doSinInvert_q <= 1'b1;
                4'b0001 : u1_doSinInvert_q <= 1'b1;
                4'b0010 : u1_doSinInvert_q <= 1'b1;
                4'b0011 : u1_doSinInvert_q <= 1'b1;
                4'b0100 : u1_doSinInvert_q <= 1'b0;
                4'b0101 : u1_doSinInvert_q <= 1'b0;
                4'b0110 : u1_doSinInvert_q <= 1'b0;
                4'b0111 : u1_doSinInvert_q <= 1'b0;
                4'b1000 : u1_doSinInvert_q <= 1'b0;
                4'b1001 : u1_doSinInvert_q <= 1'b0;
                4'b1010 : u1_doSinInvert_q <= 1'b0;
                4'b1011 : u1_doSinInvert_q <= 1'b0;
                4'b1100 : u1_doSinInvert_q <= 1'b1;
                4'b1101 : u1_doSinInvert_q <= 1'b1;
                4'b1110 : u1_doSinInvert_q <= 1'b1;
                4'b1111 : u1_doSinInvert_q <= 1'b1;
                default : begin
                              // unreachable
                              u1_doSinInvert_q <= 1'bx;
                          end
            endcase
        end
    end

    // u1_sinSwapMux(MUX,111)@25 + 1
    assign u1_sinSwapMux_s = u1_doSwap_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_sinSwapMux_q <= 17'b0;
        end
        else
        begin
            unique case (u1_sinSwapMux_s)
                1'b0 : u1_sinSwapMux_q <= u1_roundedSin_bs_b;
                1'b1 : u1_sinSwapMux_q <= u1_roundedCos_bs_b;
                default : u1_sinSwapMux_q <= 17'b0;
            endcase
        end
    end

    // u1_sinInvert(SUB,113)@26 + 1
    assign u1_sinInvert_a = $unsigned({{15{GND_q[0]}}, GND_q});
    assign u1_sinInvert_b = $unsigned(u1_sinSwapMux_q[15:0]);
    assign u1_sinInvert_i = u1_sinInvert_b;
    assign u1_sinInvert_a1 = u1_doSinInvert_q == 1'b1 ? u1_sinInvert_i : u1_sinInvert_a;
    assign u1_sinInvert_b1 = u1_doSinInvert_q == 1'b1 ? 16'b0 : u1_sinInvert_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u1_sinInvert_o <= 16'b0;
        end
        else
        begin
            u1_sinInvert_o <= $unsigned($signed(u1_sinInvert_a1) - $signed(u1_sinInvert_b1));
        end
    end
    assign u1_sinInvert_q = u1_sinInvert_o[15:0];

    // d_u0_invertSin_bit_select_merged_b_25(DELAY,616)@10 + 15
    dspba_delay_ver #( .width(1), .depth(15), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u0_invertSin_bit_select_merged_b_25 ( .xin(u0_invertSin_bit_select_merged_b), .xout(d_u0_invertSin_bit_select_merged_b_25_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u0_sinJoin(BITJOIN,63)@25
    assign u0_sinJoin_q = {d_u0_invertSin_bit_select_merged_b_25_q, d_u0_octantBitSelect_b_25_q};

    // u0_doSinInvert(LOOKUP,64)@25 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_doSinInvert_q <= $unsigned(1'b1);
        end
        else
        begin
            unique case (u0_sinJoin_q)
                4'b0000 : u0_doSinInvert_q <= 1'b1;
                4'b0001 : u0_doSinInvert_q <= 1'b1;
                4'b0010 : u0_doSinInvert_q <= 1'b1;
                4'b0011 : u0_doSinInvert_q <= 1'b1;
                4'b0100 : u0_doSinInvert_q <= 1'b0;
                4'b0101 : u0_doSinInvert_q <= 1'b0;
                4'b0110 : u0_doSinInvert_q <= 1'b0;
                4'b0111 : u0_doSinInvert_q <= 1'b0;
                4'b1000 : u0_doSinInvert_q <= 1'b0;
                4'b1001 : u0_doSinInvert_q <= 1'b0;
                4'b1010 : u0_doSinInvert_q <= 1'b0;
                4'b1011 : u0_doSinInvert_q <= 1'b0;
                4'b1100 : u0_doSinInvert_q <= 1'b1;
                4'b1101 : u0_doSinInvert_q <= 1'b1;
                4'b1110 : u0_doSinInvert_q <= 1'b1;
                4'b1111 : u0_doSinInvert_q <= 1'b1;
                default : begin
                              // unreachable
                              u0_doSinInvert_q <= 1'bx;
                          end
            endcase
        end
    end

    // u0_sinSwapMux(MUX,68)@25 + 1
    assign u0_sinSwapMux_s = u0_doSwap_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_sinSwapMux_q <= 17'b0;
        end
        else
        begin
            unique case (u0_sinSwapMux_s)
                1'b0 : u0_sinSwapMux_q <= u0_roundedSin_bs_b;
                1'b1 : u0_sinSwapMux_q <= u0_roundedCos_bs_b;
                default : u0_sinSwapMux_q <= 17'b0;
            endcase
        end
    end

    // u0_sinInvert(SUB,70)@26 + 1
    assign u0_sinInvert_a = $unsigned({{15{GND_q[0]}}, GND_q});
    assign u0_sinInvert_b = $unsigned(u0_sinSwapMux_q[15:0]);
    assign u0_sinInvert_i = u0_sinInvert_b;
    assign u0_sinInvert_a1 = u0_doSinInvert_q == 1'b1 ? u0_sinInvert_i : u0_sinInvert_a;
    assign u0_sinInvert_b1 = u0_doSinInvert_q == 1'b1 ? 16'b0 : u0_sinInvert_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_sinInvert_o <= 16'b0;
        end
        else
        begin
            u0_sinInvert_o <= $unsigned($signed(u0_sinInvert_a1) - $signed(u0_sinInvert_b1));
        end
    end
    assign u0_sinInvert_q = u0_sinInvert_o[15:0];

    // d_xIn_c_27_notEnable(LOGICAL,642)@10
    assign d_xIn_c_27_notEnable_q = $unsigned(~ (VCC_q));

    // d_xIn_c_27_nor(LOGICAL,643)@10
    assign d_xIn_c_27_nor_q = ~ (d_xIn_c_27_notEnable_q | d_xIn_c_27_sticky_ena_q);

    // d_xIn_c_27_mem_last(CONSTANT,639)
    assign d_xIn_c_27_mem_last_q = $unsigned(5'b01110);

    // d_xIn_c_27_cmp(LOGICAL,640)@10
    assign d_xIn_c_27_cmp_b = {1'b0, d_xIn_c_27_rdcnt_q};
    assign d_xIn_c_27_cmp_q = $unsigned(d_xIn_c_27_mem_last_q == d_xIn_c_27_cmp_b ? 1'b1 : 1'b0);

    // d_xIn_c_27_cmpReg(REG,641)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_c_27_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_xIn_c_27_cmpReg_q <= $unsigned(d_xIn_c_27_cmp_q);
        end
    end

    // d_xIn_c_27_sticky_ena(REG,644)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_c_27_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_xIn_c_27_nor_q == 1'b1)
        begin
            d_xIn_c_27_sticky_ena_q <= $unsigned(d_xIn_c_27_cmpReg_q);
        end
    end

    // d_xIn_c_27_enaAnd(LOGICAL,645)@10
    assign d_xIn_c_27_enaAnd_q = d_xIn_c_27_sticky_ena_q & VCC_q;

    // d_xIn_c_27_rdcnt(COUNTER,637)@10 + 1
    // low=0, high=15, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_c_27_rdcnt_i <= 4'd0;
        end
        else
        begin
            d_xIn_c_27_rdcnt_i <= $unsigned(d_xIn_c_27_rdcnt_i) + $unsigned(4'd1);
        end
    end
    assign d_xIn_c_27_rdcnt_q = d_xIn_c_27_rdcnt_i[3:0];

    // d_xIn_c_27_wraddr(REG,638)@10 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_c_27_wraddr_q <= $unsigned(4'b1111);
        end
        else
        begin
            d_xIn_c_27_wraddr_q <= $unsigned(d_xIn_c_27_rdcnt_q);
        end
    end

    // d_xIn_c_27_mem(DUALMEM,636)@10 + 2
    assign d_xIn_c_27_mem_ia = xIn_c;
    assign d_xIn_c_27_mem_aa = d_xIn_c_27_wraddr_q;
    assign d_xIn_c_27_mem_ab = d_xIn_c_27_rdcnt_q;
    assign d_xIn_c_27_mem_ena_OrRstB = areset | d_xIn_c_27_enaAnd_q[0];
    assign d_xIn_c_27_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) d_xIn_c_27_mem_dmem (
        .clocken1(d_xIn_c_27_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_xIn_c_27_mem_reset0),
        .clock1(clk),
        .address_a(d_xIn_c_27_mem_aa),
        .data_a(d_xIn_c_27_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_xIn_c_27_mem_ab),
        .q_b(d_xIn_c_27_mem_iq),
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
    assign d_xIn_c_27_mem_q = d_xIn_c_27_mem_iq[7:0];

    // d_xIn_v_27(DELAY,547)@11 + 16
    dspba_delay_ver #( .width(1), .depth(16), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_xIn_v_27 ( .xin(d_xIn_v_11_q), .xout(d_xIn_v_27_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ncoOut(PORTOUT,201)@27 + 1
    assign ncoOut_v = d_xIn_v_27_q;
    assign ncoOut_c = d_xIn_c_27_mem_q;
    assign sinOut_0 = u0_sinInvert_q;
    assign sinOut_1 = u1_sinInvert_q;
    assign sinOut_2 = u2_sinInvert_q;
    assign sinOut_3 = u3_sinInvert_q;
    assign cosOut_0 = u0_cosInvert_q;
    assign cosOut_1 = u1_cosInvert_q;
    assign cosOut_2 = u2_cosInvert_q;
    assign cosOut_3 = u3_cosInvert_q;

endmodule
