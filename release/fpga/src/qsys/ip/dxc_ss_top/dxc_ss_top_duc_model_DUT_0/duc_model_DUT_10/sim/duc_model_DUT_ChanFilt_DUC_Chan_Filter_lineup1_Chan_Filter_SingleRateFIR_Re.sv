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

// SystemVerilog created from duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re
// SystemVerilog created on Thu Jan  9 15:34:39 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [15:0] xIn_0,
    input wire [0:0] bankIn_0,
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] xOut_v,
    output wire [7:0] xOut_c,
    output wire [39:0] xOut_0,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [0:0] d_busIn_read_12_q;
    reg [0:0] d_busIn_read_12_delay_0;
    reg [31:0] d_busIn_writedata_11_q;
    reg [7:0] rblookup_q;
    reg [0:0] rblookup_h;
    reg [0:0] rblookup_e;
    wire [0:0] rblookup_c;
    reg [0:0] d_rblookup_h_12_q;
    reg [0:0] rblookup_valid_q;
    wire rm_reset0;
    wire rm_ena_NotRstA;
    wire [15:0] rm_ia;
    wire [7:0] rm_aa;
    wire [7:0] rm_ab;
    wire [15:0] rm_iq;
    wire [15:0] rm_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_12_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_12_delay_0;
    reg [0:0] d_u0_m0_wo0_compute_q_12_q;
    reg [0:0] d_u0_m0_wo0_compute_q_12_delay_0;
    reg [0:0] d_u0_m0_wo0_compute_q_15_q;
    reg [0:0] d_u0_m0_wo0_compute_q_15_delay_0;
    reg [0:0] d_u0_m0_wo0_compute_q_15_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr1_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr1_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr1_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr5_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr5_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr5_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr9_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr9_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr9_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr13_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr13_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr13_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr17_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr17_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr17_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr21_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr21_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr21_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr25_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr25_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr25_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr29_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr29_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr29_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr33_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr33_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr33_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr37_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr37_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr37_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr41_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr41_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr41_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr45_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr45_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr45_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr49_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr49_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr49_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr53_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr53_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr53_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr57_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr57_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr57_delay_1;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr61_q;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr61_delay_0;
    reg [63:0] u0_m0_wo0_wi0_r0_delayr61_delay_1;
    reg [0:0] u0_m0_wo0_bank_delayr1_q;
    reg [0:0] u0_m0_wo0_bank_delayr2_q;
    reg [0:0] u0_m0_wo0_bank_delayr3_q;
    reg [0:0] u0_m0_wo0_bank_delayr4_q;
    reg [0:0] u0_m0_wo0_bank_delayr5_q;
    reg [0:0] u0_m0_wo0_bank_delayr6_q;
    reg [0:0] u0_m0_wo0_bank_delayr7_q;
    reg [0:0] u0_m0_wo0_bank_delayr8_q;
    reg [0:0] u0_m0_wo0_bank_delayr9_q;
    reg [0:0] u0_m0_wo0_bank_delayr10_q;
    reg [0:0] u0_m0_wo0_bank_delayr11_q;
    reg [0:0] u0_m0_wo0_bank_delayr12_q;
    reg [0:0] u0_m0_wo0_bank_delayr13_q;
    reg [0:0] u0_m0_wo0_bank_delayr14_q;
    reg [0:0] u0_m0_wo0_bank_delayr15_q;
    reg [0:0] u0_m0_wo0_bank_delayr16_q;
    reg [0:0] u0_m0_wo0_bank_delayr17_q;
    reg [0:0] u0_m0_wo0_bank_delayr18_q;
    reg [0:0] u0_m0_wo0_bank_delayr19_q;
    reg [0:0] u0_m0_wo0_bank_delayr20_q;
    reg [0:0] u0_m0_wo0_bank_delayr21_q;
    reg [0:0] u0_m0_wo0_bank_delayr22_q;
    reg [0:0] u0_m0_wo0_bank_delayr23_q;
    reg [0:0] u0_m0_wo0_bank_delayr24_q;
    reg [0:0] u0_m0_wo0_bank_delayr25_q;
    reg [0:0] u0_m0_wo0_bank_delayr26_q;
    reg [0:0] u0_m0_wo0_bank_delayr27_q;
    reg [0:0] u0_m0_wo0_bank_delayr28_q;
    reg [0:0] u0_m0_wo0_bank_delayr29_q;
    reg [0:0] u0_m0_wo0_bank_delayr30_q;
    reg [0:0] u0_m0_wo0_bank_delayr31_q;
    reg [0:0] u0_m0_wo0_bank_delayr32_q;
    reg [0:0] u0_m0_wo0_bank_delayr33_q;
    reg [0:0] u0_m0_wo0_bank_delayr34_q;
    reg [0:0] u0_m0_wo0_bank_delayr35_q;
    reg [0:0] u0_m0_wo0_bank_delayr36_q;
    reg [0:0] u0_m0_wo0_bank_delayr37_q;
    reg [0:0] u0_m0_wo0_bank_delayr38_q;
    reg [0:0] u0_m0_wo0_bank_delayr39_q;
    reg [0:0] u0_m0_wo0_bank_delayr40_q;
    reg [0:0] u0_m0_wo0_bank_delayr41_q;
    reg [0:0] u0_m0_wo0_bank_delayr42_q;
    reg [0:0] u0_m0_wo0_bank_delayr43_q;
    reg [0:0] u0_m0_wo0_bank_delayr44_q;
    reg [0:0] u0_m0_wo0_bank_delayr45_q;
    reg [0:0] u0_m0_wo0_bank_delayr46_q;
    reg [0:0] u0_m0_wo0_bank_delayr47_q;
    reg [0:0] u0_m0_wo0_bank_delayr48_q;
    reg [0:0] u0_m0_wo0_bank_delayr49_q;
    reg [0:0] u0_m0_wo0_bank_delayr50_q;
    reg [0:0] u0_m0_wo0_bank_delayr51_q;
    reg [0:0] u0_m0_wo0_bank_delayr52_q;
    reg [0:0] u0_m0_wo0_bank_delayr53_q;
    reg [0:0] u0_m0_wo0_bank_delayr54_q;
    reg [0:0] u0_m0_wo0_bank_delayr55_q;
    reg [0:0] u0_m0_wo0_bank_delayr56_q;
    reg [0:0] u0_m0_wo0_bank_delayr57_q;
    reg [0:0] u0_m0_wo0_bank_delayr58_q;
    reg [0:0] u0_m0_wo0_bank_delayr59_q;
    reg [0:0] u0_m0_wo0_bank_delayr60_q;
    reg [0:0] u0_m0_wo0_bank_delayr61_q;
    reg [0:0] u0_m0_wo0_bank_delayr62_q;
    reg [0:0] u0_m0_wo0_bank_delayr63_q;
    reg [0:0] u0_m0_wo0_bank_delayr64_q;
    reg [0:0] u0_m0_wo0_dec0_q;
    reg [0:0] u0_m0_wo0_dec0_e;
    wire [0:0] u0_m0_wo0_dec0_c;
    wire u0_m0_wo0_cm0_reset0;
    wire u0_m0_wo0_cm0_ena_NotRstA;
    wire u0_m0_wo0_cm0_reset1;
    wire [15:0] u0_m0_wo0_cm0_ia;
    wire [0:0] u0_m0_wo0_cm0_aa;
    wire [0:0] u0_m0_wo0_cm0_ab;
    wire [15:0] u0_m0_wo0_cm0_iq;
    wire [15:0] u0_m0_wo0_cm0_q;
    reg [0:0] u0_m0_wo0_dec1_q;
    reg [0:0] u0_m0_wo0_dec1_e;
    wire [0:0] u0_m0_wo0_dec1_c;
    wire u0_m0_wo0_cm1_reset0;
    wire u0_m0_wo0_cm1_ena_NotRstA;
    wire u0_m0_wo0_cm1_reset1;
    wire [15:0] u0_m0_wo0_cm1_ia;
    wire [0:0] u0_m0_wo0_cm1_aa;
    wire [0:0] u0_m0_wo0_cm1_ab;
    wire [15:0] u0_m0_wo0_cm1_iq;
    wire [15:0] u0_m0_wo0_cm1_q;
    reg [0:0] u0_m0_wo0_dec2_q;
    reg [0:0] u0_m0_wo0_dec2_e;
    wire [0:0] u0_m0_wo0_dec2_c;
    wire u0_m0_wo0_cm2_reset0;
    wire u0_m0_wo0_cm2_ena_NotRstA;
    wire u0_m0_wo0_cm2_reset1;
    wire [15:0] u0_m0_wo0_cm2_ia;
    wire [0:0] u0_m0_wo0_cm2_aa;
    wire [0:0] u0_m0_wo0_cm2_ab;
    wire [15:0] u0_m0_wo0_cm2_iq;
    wire [15:0] u0_m0_wo0_cm2_q;
    reg [0:0] u0_m0_wo0_dec3_q;
    reg [0:0] u0_m0_wo0_dec3_e;
    wire [0:0] u0_m0_wo0_dec3_c;
    wire u0_m0_wo0_cm3_reset0;
    wire u0_m0_wo0_cm3_ena_NotRstA;
    wire u0_m0_wo0_cm3_reset1;
    wire [15:0] u0_m0_wo0_cm3_ia;
    wire [0:0] u0_m0_wo0_cm3_aa;
    wire [0:0] u0_m0_wo0_cm3_ab;
    wire [15:0] u0_m0_wo0_cm3_iq;
    wire [15:0] u0_m0_wo0_cm3_q;
    reg [0:0] u0_m0_wo0_dec4_q;
    reg [0:0] u0_m0_wo0_dec4_e;
    wire [0:0] u0_m0_wo0_dec4_c;
    wire u0_m0_wo0_cm4_reset0;
    wire u0_m0_wo0_cm4_ena_NotRstA;
    wire u0_m0_wo0_cm4_reset1;
    wire [15:0] u0_m0_wo0_cm4_ia;
    wire [0:0] u0_m0_wo0_cm4_aa;
    wire [0:0] u0_m0_wo0_cm4_ab;
    wire [15:0] u0_m0_wo0_cm4_iq;
    wire [15:0] u0_m0_wo0_cm4_q;
    reg [0:0] u0_m0_wo0_dec5_q;
    reg [0:0] u0_m0_wo0_dec5_e;
    wire [0:0] u0_m0_wo0_dec5_c;
    wire u0_m0_wo0_cm5_reset0;
    wire u0_m0_wo0_cm5_ena_NotRstA;
    wire u0_m0_wo0_cm5_reset1;
    wire [15:0] u0_m0_wo0_cm5_ia;
    wire [0:0] u0_m0_wo0_cm5_aa;
    wire [0:0] u0_m0_wo0_cm5_ab;
    wire [15:0] u0_m0_wo0_cm5_iq;
    wire [15:0] u0_m0_wo0_cm5_q;
    reg [0:0] u0_m0_wo0_dec6_q;
    reg [0:0] u0_m0_wo0_dec6_e;
    wire [0:0] u0_m0_wo0_dec6_c;
    wire u0_m0_wo0_cm6_reset0;
    wire u0_m0_wo0_cm6_ena_NotRstA;
    wire u0_m0_wo0_cm6_reset1;
    wire [15:0] u0_m0_wo0_cm6_ia;
    wire [0:0] u0_m0_wo0_cm6_aa;
    wire [0:0] u0_m0_wo0_cm6_ab;
    wire [15:0] u0_m0_wo0_cm6_iq;
    wire [15:0] u0_m0_wo0_cm6_q;
    reg [0:0] u0_m0_wo0_dec7_q;
    reg [0:0] u0_m0_wo0_dec7_e;
    wire [0:0] u0_m0_wo0_dec7_c;
    wire u0_m0_wo0_cm7_reset0;
    wire u0_m0_wo0_cm7_ena_NotRstA;
    wire u0_m0_wo0_cm7_reset1;
    wire [15:0] u0_m0_wo0_cm7_ia;
    wire [0:0] u0_m0_wo0_cm7_aa;
    wire [0:0] u0_m0_wo0_cm7_ab;
    wire [15:0] u0_m0_wo0_cm7_iq;
    wire [15:0] u0_m0_wo0_cm7_q;
    reg [0:0] u0_m0_wo0_dec8_q;
    reg [0:0] u0_m0_wo0_dec8_e;
    wire [0:0] u0_m0_wo0_dec8_c;
    wire u0_m0_wo0_cm8_reset0;
    wire u0_m0_wo0_cm8_ena_NotRstA;
    wire u0_m0_wo0_cm8_reset1;
    wire [15:0] u0_m0_wo0_cm8_ia;
    wire [0:0] u0_m0_wo0_cm8_aa;
    wire [0:0] u0_m0_wo0_cm8_ab;
    wire [15:0] u0_m0_wo0_cm8_iq;
    wire [15:0] u0_m0_wo0_cm8_q;
    reg [0:0] u0_m0_wo0_dec9_q;
    reg [0:0] u0_m0_wo0_dec9_e;
    wire [0:0] u0_m0_wo0_dec9_c;
    wire u0_m0_wo0_cm9_reset0;
    wire u0_m0_wo0_cm9_ena_NotRstA;
    wire u0_m0_wo0_cm9_reset1;
    wire [15:0] u0_m0_wo0_cm9_ia;
    wire [0:0] u0_m0_wo0_cm9_aa;
    wire [0:0] u0_m0_wo0_cm9_ab;
    wire [15:0] u0_m0_wo0_cm9_iq;
    wire [15:0] u0_m0_wo0_cm9_q;
    reg [0:0] u0_m0_wo0_dec10_q;
    reg [0:0] u0_m0_wo0_dec10_e;
    wire [0:0] u0_m0_wo0_dec10_c;
    wire u0_m0_wo0_cm10_reset0;
    wire u0_m0_wo0_cm10_ena_NotRstA;
    wire u0_m0_wo0_cm10_reset1;
    wire [15:0] u0_m0_wo0_cm10_ia;
    wire [0:0] u0_m0_wo0_cm10_aa;
    wire [0:0] u0_m0_wo0_cm10_ab;
    wire [15:0] u0_m0_wo0_cm10_iq;
    wire [15:0] u0_m0_wo0_cm10_q;
    reg [0:0] u0_m0_wo0_dec11_q;
    reg [0:0] u0_m0_wo0_dec11_e;
    wire [0:0] u0_m0_wo0_dec11_c;
    wire u0_m0_wo0_cm11_reset0;
    wire u0_m0_wo0_cm11_ena_NotRstA;
    wire u0_m0_wo0_cm11_reset1;
    wire [15:0] u0_m0_wo0_cm11_ia;
    wire [0:0] u0_m0_wo0_cm11_aa;
    wire [0:0] u0_m0_wo0_cm11_ab;
    wire [15:0] u0_m0_wo0_cm11_iq;
    wire [15:0] u0_m0_wo0_cm11_q;
    reg [0:0] u0_m0_wo0_dec12_q;
    reg [0:0] u0_m0_wo0_dec12_e;
    wire [0:0] u0_m0_wo0_dec12_c;
    wire u0_m0_wo0_cm12_reset0;
    wire u0_m0_wo0_cm12_ena_NotRstA;
    wire u0_m0_wo0_cm12_reset1;
    wire [15:0] u0_m0_wo0_cm12_ia;
    wire [0:0] u0_m0_wo0_cm12_aa;
    wire [0:0] u0_m0_wo0_cm12_ab;
    wire [15:0] u0_m0_wo0_cm12_iq;
    wire [15:0] u0_m0_wo0_cm12_q;
    reg [0:0] u0_m0_wo0_dec13_q;
    reg [0:0] u0_m0_wo0_dec13_e;
    wire [0:0] u0_m0_wo0_dec13_c;
    wire u0_m0_wo0_cm13_reset0;
    wire u0_m0_wo0_cm13_ena_NotRstA;
    wire u0_m0_wo0_cm13_reset1;
    wire [15:0] u0_m0_wo0_cm13_ia;
    wire [0:0] u0_m0_wo0_cm13_aa;
    wire [0:0] u0_m0_wo0_cm13_ab;
    wire [15:0] u0_m0_wo0_cm13_iq;
    wire [15:0] u0_m0_wo0_cm13_q;
    reg [0:0] u0_m0_wo0_dec14_q;
    reg [0:0] u0_m0_wo0_dec14_e;
    wire [0:0] u0_m0_wo0_dec14_c;
    wire u0_m0_wo0_cm14_reset0;
    wire u0_m0_wo0_cm14_ena_NotRstA;
    wire u0_m0_wo0_cm14_reset1;
    wire [15:0] u0_m0_wo0_cm14_ia;
    wire [0:0] u0_m0_wo0_cm14_aa;
    wire [0:0] u0_m0_wo0_cm14_ab;
    wire [15:0] u0_m0_wo0_cm14_iq;
    wire [15:0] u0_m0_wo0_cm14_q;
    reg [0:0] u0_m0_wo0_dec15_q;
    reg [0:0] u0_m0_wo0_dec15_e;
    wire [0:0] u0_m0_wo0_dec15_c;
    wire u0_m0_wo0_cm15_reset0;
    wire u0_m0_wo0_cm15_ena_NotRstA;
    wire u0_m0_wo0_cm15_reset1;
    wire [15:0] u0_m0_wo0_cm15_ia;
    wire [0:0] u0_m0_wo0_cm15_aa;
    wire [0:0] u0_m0_wo0_cm15_ab;
    wire [15:0] u0_m0_wo0_cm15_iq;
    wire [15:0] u0_m0_wo0_cm15_q;
    reg [0:0] u0_m0_wo0_dec16_q;
    reg [0:0] u0_m0_wo0_dec16_e;
    wire [0:0] u0_m0_wo0_dec16_c;
    wire u0_m0_wo0_cm16_reset0;
    wire u0_m0_wo0_cm16_ena_NotRstA;
    wire u0_m0_wo0_cm16_reset1;
    wire [15:0] u0_m0_wo0_cm16_ia;
    wire [0:0] u0_m0_wo0_cm16_aa;
    wire [0:0] u0_m0_wo0_cm16_ab;
    wire [15:0] u0_m0_wo0_cm16_iq;
    wire [15:0] u0_m0_wo0_cm16_q;
    reg [0:0] u0_m0_wo0_dec17_q;
    reg [0:0] u0_m0_wo0_dec17_e;
    wire [0:0] u0_m0_wo0_dec17_c;
    wire u0_m0_wo0_cm17_reset0;
    wire u0_m0_wo0_cm17_ena_NotRstA;
    wire u0_m0_wo0_cm17_reset1;
    wire [15:0] u0_m0_wo0_cm17_ia;
    wire [0:0] u0_m0_wo0_cm17_aa;
    wire [0:0] u0_m0_wo0_cm17_ab;
    wire [15:0] u0_m0_wo0_cm17_iq;
    wire [15:0] u0_m0_wo0_cm17_q;
    reg [0:0] u0_m0_wo0_dec18_q;
    reg [0:0] u0_m0_wo0_dec18_e;
    wire [0:0] u0_m0_wo0_dec18_c;
    wire u0_m0_wo0_cm18_reset0;
    wire u0_m0_wo0_cm18_ena_NotRstA;
    wire u0_m0_wo0_cm18_reset1;
    wire [15:0] u0_m0_wo0_cm18_ia;
    wire [0:0] u0_m0_wo0_cm18_aa;
    wire [0:0] u0_m0_wo0_cm18_ab;
    wire [15:0] u0_m0_wo0_cm18_iq;
    wire [15:0] u0_m0_wo0_cm18_q;
    reg [0:0] u0_m0_wo0_dec19_q;
    reg [0:0] u0_m0_wo0_dec19_e;
    wire [0:0] u0_m0_wo0_dec19_c;
    wire u0_m0_wo0_cm19_reset0;
    wire u0_m0_wo0_cm19_ena_NotRstA;
    wire u0_m0_wo0_cm19_reset1;
    wire [15:0] u0_m0_wo0_cm19_ia;
    wire [0:0] u0_m0_wo0_cm19_aa;
    wire [0:0] u0_m0_wo0_cm19_ab;
    wire [15:0] u0_m0_wo0_cm19_iq;
    wire [15:0] u0_m0_wo0_cm19_q;
    reg [0:0] u0_m0_wo0_dec20_q;
    reg [0:0] u0_m0_wo0_dec20_e;
    wire [0:0] u0_m0_wo0_dec20_c;
    wire u0_m0_wo0_cm20_reset0;
    wire u0_m0_wo0_cm20_ena_NotRstA;
    wire u0_m0_wo0_cm20_reset1;
    wire [15:0] u0_m0_wo0_cm20_ia;
    wire [0:0] u0_m0_wo0_cm20_aa;
    wire [0:0] u0_m0_wo0_cm20_ab;
    wire [15:0] u0_m0_wo0_cm20_iq;
    wire [15:0] u0_m0_wo0_cm20_q;
    reg [0:0] u0_m0_wo0_dec21_q;
    reg [0:0] u0_m0_wo0_dec21_e;
    wire [0:0] u0_m0_wo0_dec21_c;
    wire u0_m0_wo0_cm21_reset0;
    wire u0_m0_wo0_cm21_ena_NotRstA;
    wire u0_m0_wo0_cm21_reset1;
    wire [15:0] u0_m0_wo0_cm21_ia;
    wire [0:0] u0_m0_wo0_cm21_aa;
    wire [0:0] u0_m0_wo0_cm21_ab;
    wire [15:0] u0_m0_wo0_cm21_iq;
    wire [15:0] u0_m0_wo0_cm21_q;
    reg [0:0] u0_m0_wo0_dec22_q;
    reg [0:0] u0_m0_wo0_dec22_e;
    wire [0:0] u0_m0_wo0_dec22_c;
    wire u0_m0_wo0_cm22_reset0;
    wire u0_m0_wo0_cm22_ena_NotRstA;
    wire u0_m0_wo0_cm22_reset1;
    wire [15:0] u0_m0_wo0_cm22_ia;
    wire [0:0] u0_m0_wo0_cm22_aa;
    wire [0:0] u0_m0_wo0_cm22_ab;
    wire [15:0] u0_m0_wo0_cm22_iq;
    wire [15:0] u0_m0_wo0_cm22_q;
    reg [0:0] u0_m0_wo0_dec23_q;
    reg [0:0] u0_m0_wo0_dec23_e;
    wire [0:0] u0_m0_wo0_dec23_c;
    wire u0_m0_wo0_cm23_reset0;
    wire u0_m0_wo0_cm23_ena_NotRstA;
    wire u0_m0_wo0_cm23_reset1;
    wire [15:0] u0_m0_wo0_cm23_ia;
    wire [0:0] u0_m0_wo0_cm23_aa;
    wire [0:0] u0_m0_wo0_cm23_ab;
    wire [15:0] u0_m0_wo0_cm23_iq;
    wire [15:0] u0_m0_wo0_cm23_q;
    reg [0:0] u0_m0_wo0_dec24_q;
    reg [0:0] u0_m0_wo0_dec24_e;
    wire [0:0] u0_m0_wo0_dec24_c;
    wire u0_m0_wo0_cm24_reset0;
    wire u0_m0_wo0_cm24_ena_NotRstA;
    wire u0_m0_wo0_cm24_reset1;
    wire [15:0] u0_m0_wo0_cm24_ia;
    wire [0:0] u0_m0_wo0_cm24_aa;
    wire [0:0] u0_m0_wo0_cm24_ab;
    wire [15:0] u0_m0_wo0_cm24_iq;
    wire [15:0] u0_m0_wo0_cm24_q;
    reg [0:0] u0_m0_wo0_dec25_q;
    reg [0:0] u0_m0_wo0_dec25_e;
    wire [0:0] u0_m0_wo0_dec25_c;
    wire u0_m0_wo0_cm25_reset0;
    wire u0_m0_wo0_cm25_ena_NotRstA;
    wire u0_m0_wo0_cm25_reset1;
    wire [15:0] u0_m0_wo0_cm25_ia;
    wire [0:0] u0_m0_wo0_cm25_aa;
    wire [0:0] u0_m0_wo0_cm25_ab;
    wire [15:0] u0_m0_wo0_cm25_iq;
    wire [15:0] u0_m0_wo0_cm25_q;
    reg [0:0] u0_m0_wo0_dec26_q;
    reg [0:0] u0_m0_wo0_dec26_e;
    wire [0:0] u0_m0_wo0_dec26_c;
    wire u0_m0_wo0_cm26_reset0;
    wire u0_m0_wo0_cm26_ena_NotRstA;
    wire u0_m0_wo0_cm26_reset1;
    wire [15:0] u0_m0_wo0_cm26_ia;
    wire [0:0] u0_m0_wo0_cm26_aa;
    wire [0:0] u0_m0_wo0_cm26_ab;
    wire [15:0] u0_m0_wo0_cm26_iq;
    wire [15:0] u0_m0_wo0_cm26_q;
    reg [0:0] u0_m0_wo0_dec27_q;
    reg [0:0] u0_m0_wo0_dec27_e;
    wire [0:0] u0_m0_wo0_dec27_c;
    wire u0_m0_wo0_cm27_reset0;
    wire u0_m0_wo0_cm27_ena_NotRstA;
    wire u0_m0_wo0_cm27_reset1;
    wire [15:0] u0_m0_wo0_cm27_ia;
    wire [0:0] u0_m0_wo0_cm27_aa;
    wire [0:0] u0_m0_wo0_cm27_ab;
    wire [15:0] u0_m0_wo0_cm27_iq;
    wire [15:0] u0_m0_wo0_cm27_q;
    reg [0:0] u0_m0_wo0_dec28_q;
    reg [0:0] u0_m0_wo0_dec28_e;
    wire [0:0] u0_m0_wo0_dec28_c;
    wire u0_m0_wo0_cm28_reset0;
    wire u0_m0_wo0_cm28_ena_NotRstA;
    wire u0_m0_wo0_cm28_reset1;
    wire [15:0] u0_m0_wo0_cm28_ia;
    wire [0:0] u0_m0_wo0_cm28_aa;
    wire [0:0] u0_m0_wo0_cm28_ab;
    wire [15:0] u0_m0_wo0_cm28_iq;
    wire [15:0] u0_m0_wo0_cm28_q;
    reg [0:0] u0_m0_wo0_dec29_q;
    reg [0:0] u0_m0_wo0_dec29_e;
    wire [0:0] u0_m0_wo0_dec29_c;
    wire u0_m0_wo0_cm29_reset0;
    wire u0_m0_wo0_cm29_ena_NotRstA;
    wire u0_m0_wo0_cm29_reset1;
    wire [15:0] u0_m0_wo0_cm29_ia;
    wire [0:0] u0_m0_wo0_cm29_aa;
    wire [0:0] u0_m0_wo0_cm29_ab;
    wire [15:0] u0_m0_wo0_cm29_iq;
    wire [15:0] u0_m0_wo0_cm29_q;
    reg [0:0] u0_m0_wo0_dec30_q;
    reg [0:0] u0_m0_wo0_dec30_e;
    wire [0:0] u0_m0_wo0_dec30_c;
    wire u0_m0_wo0_cm30_reset0;
    wire u0_m0_wo0_cm30_ena_NotRstA;
    wire u0_m0_wo0_cm30_reset1;
    wire [15:0] u0_m0_wo0_cm30_ia;
    wire [0:0] u0_m0_wo0_cm30_aa;
    wire [0:0] u0_m0_wo0_cm30_ab;
    wire [15:0] u0_m0_wo0_cm30_iq;
    wire [15:0] u0_m0_wo0_cm30_q;
    reg [0:0] u0_m0_wo0_dec31_q;
    reg [0:0] u0_m0_wo0_dec31_e;
    wire [0:0] u0_m0_wo0_dec31_c;
    wire u0_m0_wo0_cm31_reset0;
    wire u0_m0_wo0_cm31_ena_NotRstA;
    wire u0_m0_wo0_cm31_reset1;
    wire [15:0] u0_m0_wo0_cm31_ia;
    wire [0:0] u0_m0_wo0_cm31_aa;
    wire [0:0] u0_m0_wo0_cm31_ab;
    wire [15:0] u0_m0_wo0_cm31_iq;
    wire [15:0] u0_m0_wo0_cm31_q;
    reg [0:0] u0_m0_wo0_dec32_q;
    reg [0:0] u0_m0_wo0_dec32_e;
    wire [0:0] u0_m0_wo0_dec32_c;
    wire u0_m0_wo0_cm32_reset0;
    wire u0_m0_wo0_cm32_ena_NotRstA;
    wire u0_m0_wo0_cm32_reset1;
    wire [15:0] u0_m0_wo0_cm32_ia;
    wire [0:0] u0_m0_wo0_cm32_aa;
    wire [0:0] u0_m0_wo0_cm32_ab;
    wire [15:0] u0_m0_wo0_cm32_iq;
    wire [15:0] u0_m0_wo0_cm32_q;
    reg [0:0] u0_m0_wo0_dec33_q;
    reg [0:0] u0_m0_wo0_dec33_e;
    wire [0:0] u0_m0_wo0_dec33_c;
    wire u0_m0_wo0_cm33_reset0;
    wire u0_m0_wo0_cm33_ena_NotRstA;
    wire u0_m0_wo0_cm33_reset1;
    wire [15:0] u0_m0_wo0_cm33_ia;
    wire [0:0] u0_m0_wo0_cm33_aa;
    wire [0:0] u0_m0_wo0_cm33_ab;
    wire [15:0] u0_m0_wo0_cm33_iq;
    wire [15:0] u0_m0_wo0_cm33_q;
    reg [0:0] u0_m0_wo0_dec34_q;
    reg [0:0] u0_m0_wo0_dec34_e;
    wire [0:0] u0_m0_wo0_dec34_c;
    wire u0_m0_wo0_cm34_reset0;
    wire u0_m0_wo0_cm34_ena_NotRstA;
    wire u0_m0_wo0_cm34_reset1;
    wire [15:0] u0_m0_wo0_cm34_ia;
    wire [0:0] u0_m0_wo0_cm34_aa;
    wire [0:0] u0_m0_wo0_cm34_ab;
    wire [15:0] u0_m0_wo0_cm34_iq;
    wire [15:0] u0_m0_wo0_cm34_q;
    reg [0:0] u0_m0_wo0_dec35_q;
    reg [0:0] u0_m0_wo0_dec35_e;
    wire [0:0] u0_m0_wo0_dec35_c;
    wire u0_m0_wo0_cm35_reset0;
    wire u0_m0_wo0_cm35_ena_NotRstA;
    wire u0_m0_wo0_cm35_reset1;
    wire [15:0] u0_m0_wo0_cm35_ia;
    wire [0:0] u0_m0_wo0_cm35_aa;
    wire [0:0] u0_m0_wo0_cm35_ab;
    wire [15:0] u0_m0_wo0_cm35_iq;
    wire [15:0] u0_m0_wo0_cm35_q;
    reg [0:0] u0_m0_wo0_dec36_q;
    reg [0:0] u0_m0_wo0_dec36_e;
    wire [0:0] u0_m0_wo0_dec36_c;
    wire u0_m0_wo0_cm36_reset0;
    wire u0_m0_wo0_cm36_ena_NotRstA;
    wire u0_m0_wo0_cm36_reset1;
    wire [15:0] u0_m0_wo0_cm36_ia;
    wire [0:0] u0_m0_wo0_cm36_aa;
    wire [0:0] u0_m0_wo0_cm36_ab;
    wire [15:0] u0_m0_wo0_cm36_iq;
    wire [15:0] u0_m0_wo0_cm36_q;
    reg [0:0] u0_m0_wo0_dec37_q;
    reg [0:0] u0_m0_wo0_dec37_e;
    wire [0:0] u0_m0_wo0_dec37_c;
    wire u0_m0_wo0_cm37_reset0;
    wire u0_m0_wo0_cm37_ena_NotRstA;
    wire u0_m0_wo0_cm37_reset1;
    wire [15:0] u0_m0_wo0_cm37_ia;
    wire [0:0] u0_m0_wo0_cm37_aa;
    wire [0:0] u0_m0_wo0_cm37_ab;
    wire [15:0] u0_m0_wo0_cm37_iq;
    wire [15:0] u0_m0_wo0_cm37_q;
    reg [0:0] u0_m0_wo0_dec38_q;
    reg [0:0] u0_m0_wo0_dec38_e;
    wire [0:0] u0_m0_wo0_dec38_c;
    wire u0_m0_wo0_cm38_reset0;
    wire u0_m0_wo0_cm38_ena_NotRstA;
    wire u0_m0_wo0_cm38_reset1;
    wire [15:0] u0_m0_wo0_cm38_ia;
    wire [0:0] u0_m0_wo0_cm38_aa;
    wire [0:0] u0_m0_wo0_cm38_ab;
    wire [15:0] u0_m0_wo0_cm38_iq;
    wire [15:0] u0_m0_wo0_cm38_q;
    reg [0:0] u0_m0_wo0_dec39_q;
    reg [0:0] u0_m0_wo0_dec39_e;
    wire [0:0] u0_m0_wo0_dec39_c;
    wire u0_m0_wo0_cm39_reset0;
    wire u0_m0_wo0_cm39_ena_NotRstA;
    wire u0_m0_wo0_cm39_reset1;
    wire [15:0] u0_m0_wo0_cm39_ia;
    wire [0:0] u0_m0_wo0_cm39_aa;
    wire [0:0] u0_m0_wo0_cm39_ab;
    wire [15:0] u0_m0_wo0_cm39_iq;
    wire [15:0] u0_m0_wo0_cm39_q;
    reg [0:0] u0_m0_wo0_dec40_q;
    reg [0:0] u0_m0_wo0_dec40_e;
    wire [0:0] u0_m0_wo0_dec40_c;
    wire u0_m0_wo0_cm40_reset0;
    wire u0_m0_wo0_cm40_ena_NotRstA;
    wire u0_m0_wo0_cm40_reset1;
    wire [15:0] u0_m0_wo0_cm40_ia;
    wire [0:0] u0_m0_wo0_cm40_aa;
    wire [0:0] u0_m0_wo0_cm40_ab;
    wire [15:0] u0_m0_wo0_cm40_iq;
    wire [15:0] u0_m0_wo0_cm40_q;
    reg [0:0] u0_m0_wo0_dec41_q;
    reg [0:0] u0_m0_wo0_dec41_e;
    wire [0:0] u0_m0_wo0_dec41_c;
    wire u0_m0_wo0_cm41_reset0;
    wire u0_m0_wo0_cm41_ena_NotRstA;
    wire u0_m0_wo0_cm41_reset1;
    wire [15:0] u0_m0_wo0_cm41_ia;
    wire [0:0] u0_m0_wo0_cm41_aa;
    wire [0:0] u0_m0_wo0_cm41_ab;
    wire [15:0] u0_m0_wo0_cm41_iq;
    wire [15:0] u0_m0_wo0_cm41_q;
    reg [0:0] u0_m0_wo0_dec42_q;
    reg [0:0] u0_m0_wo0_dec42_e;
    wire [0:0] u0_m0_wo0_dec42_c;
    wire u0_m0_wo0_cm42_reset0;
    wire u0_m0_wo0_cm42_ena_NotRstA;
    wire u0_m0_wo0_cm42_reset1;
    wire [15:0] u0_m0_wo0_cm42_ia;
    wire [0:0] u0_m0_wo0_cm42_aa;
    wire [0:0] u0_m0_wo0_cm42_ab;
    wire [15:0] u0_m0_wo0_cm42_iq;
    wire [15:0] u0_m0_wo0_cm42_q;
    reg [0:0] u0_m0_wo0_dec43_q;
    reg [0:0] u0_m0_wo0_dec43_e;
    wire [0:0] u0_m0_wo0_dec43_c;
    wire u0_m0_wo0_cm43_reset0;
    wire u0_m0_wo0_cm43_ena_NotRstA;
    wire u0_m0_wo0_cm43_reset1;
    wire [15:0] u0_m0_wo0_cm43_ia;
    wire [0:0] u0_m0_wo0_cm43_aa;
    wire [0:0] u0_m0_wo0_cm43_ab;
    wire [15:0] u0_m0_wo0_cm43_iq;
    wire [15:0] u0_m0_wo0_cm43_q;
    reg [0:0] u0_m0_wo0_dec44_q;
    reg [0:0] u0_m0_wo0_dec44_e;
    wire [0:0] u0_m0_wo0_dec44_c;
    wire u0_m0_wo0_cm44_reset0;
    wire u0_m0_wo0_cm44_ena_NotRstA;
    wire u0_m0_wo0_cm44_reset1;
    wire [15:0] u0_m0_wo0_cm44_ia;
    wire [0:0] u0_m0_wo0_cm44_aa;
    wire [0:0] u0_m0_wo0_cm44_ab;
    wire [15:0] u0_m0_wo0_cm44_iq;
    wire [15:0] u0_m0_wo0_cm44_q;
    reg [0:0] u0_m0_wo0_dec45_q;
    reg [0:0] u0_m0_wo0_dec45_e;
    wire [0:0] u0_m0_wo0_dec45_c;
    wire u0_m0_wo0_cm45_reset0;
    wire u0_m0_wo0_cm45_ena_NotRstA;
    wire u0_m0_wo0_cm45_reset1;
    wire [15:0] u0_m0_wo0_cm45_ia;
    wire [0:0] u0_m0_wo0_cm45_aa;
    wire [0:0] u0_m0_wo0_cm45_ab;
    wire [15:0] u0_m0_wo0_cm45_iq;
    wire [15:0] u0_m0_wo0_cm45_q;
    reg [0:0] u0_m0_wo0_dec46_q;
    reg [0:0] u0_m0_wo0_dec46_e;
    wire [0:0] u0_m0_wo0_dec46_c;
    wire u0_m0_wo0_cm46_reset0;
    wire u0_m0_wo0_cm46_ena_NotRstA;
    wire u0_m0_wo0_cm46_reset1;
    wire [15:0] u0_m0_wo0_cm46_ia;
    wire [0:0] u0_m0_wo0_cm46_aa;
    wire [0:0] u0_m0_wo0_cm46_ab;
    wire [15:0] u0_m0_wo0_cm46_iq;
    wire [15:0] u0_m0_wo0_cm46_q;
    reg [0:0] u0_m0_wo0_dec47_q;
    reg [0:0] u0_m0_wo0_dec47_e;
    wire [0:0] u0_m0_wo0_dec47_c;
    wire u0_m0_wo0_cm47_reset0;
    wire u0_m0_wo0_cm47_ena_NotRstA;
    wire u0_m0_wo0_cm47_reset1;
    wire [15:0] u0_m0_wo0_cm47_ia;
    wire [0:0] u0_m0_wo0_cm47_aa;
    wire [0:0] u0_m0_wo0_cm47_ab;
    wire [15:0] u0_m0_wo0_cm47_iq;
    wire [15:0] u0_m0_wo0_cm47_q;
    reg [0:0] u0_m0_wo0_dec48_q;
    reg [0:0] u0_m0_wo0_dec48_e;
    wire [0:0] u0_m0_wo0_dec48_c;
    wire u0_m0_wo0_cm48_reset0;
    wire u0_m0_wo0_cm48_ena_NotRstA;
    wire u0_m0_wo0_cm48_reset1;
    wire [15:0] u0_m0_wo0_cm48_ia;
    wire [0:0] u0_m0_wo0_cm48_aa;
    wire [0:0] u0_m0_wo0_cm48_ab;
    wire [15:0] u0_m0_wo0_cm48_iq;
    wire [15:0] u0_m0_wo0_cm48_q;
    reg [0:0] u0_m0_wo0_dec49_q;
    reg [0:0] u0_m0_wo0_dec49_e;
    wire [0:0] u0_m0_wo0_dec49_c;
    wire u0_m0_wo0_cm49_reset0;
    wire u0_m0_wo0_cm49_ena_NotRstA;
    wire u0_m0_wo0_cm49_reset1;
    wire [15:0] u0_m0_wo0_cm49_ia;
    wire [0:0] u0_m0_wo0_cm49_aa;
    wire [0:0] u0_m0_wo0_cm49_ab;
    wire [15:0] u0_m0_wo0_cm49_iq;
    wire [15:0] u0_m0_wo0_cm49_q;
    reg [0:0] u0_m0_wo0_dec50_q;
    reg [0:0] u0_m0_wo0_dec50_e;
    wire [0:0] u0_m0_wo0_dec50_c;
    wire u0_m0_wo0_cm50_reset0;
    wire u0_m0_wo0_cm50_ena_NotRstA;
    wire u0_m0_wo0_cm50_reset1;
    wire [15:0] u0_m0_wo0_cm50_ia;
    wire [0:0] u0_m0_wo0_cm50_aa;
    wire [0:0] u0_m0_wo0_cm50_ab;
    wire [15:0] u0_m0_wo0_cm50_iq;
    wire [15:0] u0_m0_wo0_cm50_q;
    reg [0:0] u0_m0_wo0_dec51_q;
    reg [0:0] u0_m0_wo0_dec51_e;
    wire [0:0] u0_m0_wo0_dec51_c;
    wire u0_m0_wo0_cm51_reset0;
    wire u0_m0_wo0_cm51_ena_NotRstA;
    wire u0_m0_wo0_cm51_reset1;
    wire [15:0] u0_m0_wo0_cm51_ia;
    wire [0:0] u0_m0_wo0_cm51_aa;
    wire [0:0] u0_m0_wo0_cm51_ab;
    wire [15:0] u0_m0_wo0_cm51_iq;
    wire [15:0] u0_m0_wo0_cm51_q;
    reg [0:0] u0_m0_wo0_dec52_q;
    reg [0:0] u0_m0_wo0_dec52_e;
    wire [0:0] u0_m0_wo0_dec52_c;
    wire u0_m0_wo0_cm52_reset0;
    wire u0_m0_wo0_cm52_ena_NotRstA;
    wire u0_m0_wo0_cm52_reset1;
    wire [15:0] u0_m0_wo0_cm52_ia;
    wire [0:0] u0_m0_wo0_cm52_aa;
    wire [0:0] u0_m0_wo0_cm52_ab;
    wire [15:0] u0_m0_wo0_cm52_iq;
    wire [15:0] u0_m0_wo0_cm52_q;
    reg [0:0] u0_m0_wo0_dec53_q;
    reg [0:0] u0_m0_wo0_dec53_e;
    wire [0:0] u0_m0_wo0_dec53_c;
    wire u0_m0_wo0_cm53_reset0;
    wire u0_m0_wo0_cm53_ena_NotRstA;
    wire u0_m0_wo0_cm53_reset1;
    wire [15:0] u0_m0_wo0_cm53_ia;
    wire [0:0] u0_m0_wo0_cm53_aa;
    wire [0:0] u0_m0_wo0_cm53_ab;
    wire [15:0] u0_m0_wo0_cm53_iq;
    wire [15:0] u0_m0_wo0_cm53_q;
    reg [0:0] u0_m0_wo0_dec54_q;
    reg [0:0] u0_m0_wo0_dec54_e;
    wire [0:0] u0_m0_wo0_dec54_c;
    wire u0_m0_wo0_cm54_reset0;
    wire u0_m0_wo0_cm54_ena_NotRstA;
    wire u0_m0_wo0_cm54_reset1;
    wire [15:0] u0_m0_wo0_cm54_ia;
    wire [0:0] u0_m0_wo0_cm54_aa;
    wire [0:0] u0_m0_wo0_cm54_ab;
    wire [15:0] u0_m0_wo0_cm54_iq;
    wire [15:0] u0_m0_wo0_cm54_q;
    reg [0:0] u0_m0_wo0_dec55_q;
    reg [0:0] u0_m0_wo0_dec55_e;
    wire [0:0] u0_m0_wo0_dec55_c;
    wire u0_m0_wo0_cm55_reset0;
    wire u0_m0_wo0_cm55_ena_NotRstA;
    wire u0_m0_wo0_cm55_reset1;
    wire [15:0] u0_m0_wo0_cm55_ia;
    wire [0:0] u0_m0_wo0_cm55_aa;
    wire [0:0] u0_m0_wo0_cm55_ab;
    wire [15:0] u0_m0_wo0_cm55_iq;
    wire [15:0] u0_m0_wo0_cm55_q;
    reg [0:0] u0_m0_wo0_dec56_q;
    reg [0:0] u0_m0_wo0_dec56_e;
    wire [0:0] u0_m0_wo0_dec56_c;
    wire u0_m0_wo0_cm56_reset0;
    wire u0_m0_wo0_cm56_ena_NotRstA;
    wire u0_m0_wo0_cm56_reset1;
    wire [15:0] u0_m0_wo0_cm56_ia;
    wire [0:0] u0_m0_wo0_cm56_aa;
    wire [0:0] u0_m0_wo0_cm56_ab;
    wire [15:0] u0_m0_wo0_cm56_iq;
    wire [15:0] u0_m0_wo0_cm56_q;
    reg [0:0] u0_m0_wo0_dec57_q;
    reg [0:0] u0_m0_wo0_dec57_e;
    wire [0:0] u0_m0_wo0_dec57_c;
    wire u0_m0_wo0_cm57_reset0;
    wire u0_m0_wo0_cm57_ena_NotRstA;
    wire u0_m0_wo0_cm57_reset1;
    wire [15:0] u0_m0_wo0_cm57_ia;
    wire [0:0] u0_m0_wo0_cm57_aa;
    wire [0:0] u0_m0_wo0_cm57_ab;
    wire [15:0] u0_m0_wo0_cm57_iq;
    wire [15:0] u0_m0_wo0_cm57_q;
    reg [0:0] u0_m0_wo0_dec58_q;
    reg [0:0] u0_m0_wo0_dec58_e;
    wire [0:0] u0_m0_wo0_dec58_c;
    wire u0_m0_wo0_cm58_reset0;
    wire u0_m0_wo0_cm58_ena_NotRstA;
    wire u0_m0_wo0_cm58_reset1;
    wire [15:0] u0_m0_wo0_cm58_ia;
    wire [0:0] u0_m0_wo0_cm58_aa;
    wire [0:0] u0_m0_wo0_cm58_ab;
    wire [15:0] u0_m0_wo0_cm58_iq;
    wire [15:0] u0_m0_wo0_cm58_q;
    reg [0:0] u0_m0_wo0_dec59_q;
    reg [0:0] u0_m0_wo0_dec59_e;
    wire [0:0] u0_m0_wo0_dec59_c;
    wire u0_m0_wo0_cm59_reset0;
    wire u0_m0_wo0_cm59_ena_NotRstA;
    wire u0_m0_wo0_cm59_reset1;
    wire [15:0] u0_m0_wo0_cm59_ia;
    wire [0:0] u0_m0_wo0_cm59_aa;
    wire [0:0] u0_m0_wo0_cm59_ab;
    wire [15:0] u0_m0_wo0_cm59_iq;
    wire [15:0] u0_m0_wo0_cm59_q;
    reg [0:0] u0_m0_wo0_dec60_q;
    reg [0:0] u0_m0_wo0_dec60_e;
    wire [0:0] u0_m0_wo0_dec60_c;
    wire u0_m0_wo0_cm60_reset0;
    wire u0_m0_wo0_cm60_ena_NotRstA;
    wire u0_m0_wo0_cm60_reset1;
    wire [15:0] u0_m0_wo0_cm60_ia;
    wire [0:0] u0_m0_wo0_cm60_aa;
    wire [0:0] u0_m0_wo0_cm60_ab;
    wire [15:0] u0_m0_wo0_cm60_iq;
    wire [15:0] u0_m0_wo0_cm60_q;
    reg [0:0] u0_m0_wo0_dec61_q;
    reg [0:0] u0_m0_wo0_dec61_e;
    wire [0:0] u0_m0_wo0_dec61_c;
    wire u0_m0_wo0_cm61_reset0;
    wire u0_m0_wo0_cm61_ena_NotRstA;
    wire u0_m0_wo0_cm61_reset1;
    wire [15:0] u0_m0_wo0_cm61_ia;
    wire [0:0] u0_m0_wo0_cm61_aa;
    wire [0:0] u0_m0_wo0_cm61_ab;
    wire [15:0] u0_m0_wo0_cm61_iq;
    wire [15:0] u0_m0_wo0_cm61_q;
    reg [0:0] u0_m0_wo0_dec62_q;
    reg [0:0] u0_m0_wo0_dec62_e;
    wire [0:0] u0_m0_wo0_dec62_c;
    wire u0_m0_wo0_cm62_reset0;
    wire u0_m0_wo0_cm62_ena_NotRstA;
    wire u0_m0_wo0_cm62_reset1;
    wire [15:0] u0_m0_wo0_cm62_ia;
    wire [0:0] u0_m0_wo0_cm62_aa;
    wire [0:0] u0_m0_wo0_cm62_ab;
    wire [15:0] u0_m0_wo0_cm62_iq;
    wire [15:0] u0_m0_wo0_cm62_q;
    reg [0:0] u0_m0_wo0_dec63_q;
    reg [0:0] u0_m0_wo0_dec63_e;
    wire [0:0] u0_m0_wo0_dec63_c;
    wire u0_m0_wo0_cm63_reset0;
    wire u0_m0_wo0_cm63_ena_NotRstA;
    wire u0_m0_wo0_cm63_reset1;
    wire [15:0] u0_m0_wo0_cm63_ia;
    wire [0:0] u0_m0_wo0_cm63_aa;
    wire [0:0] u0_m0_wo0_cm63_ab;
    wire [15:0] u0_m0_wo0_cm63_iq;
    wire [15:0] u0_m0_wo0_cm63_q;
    reg [0:0] u0_m0_wo0_dec64_q;
    reg [0:0] u0_m0_wo0_dec64_e;
    wire [0:0] u0_m0_wo0_dec64_c;
    wire u0_m0_wo0_cm64_reset0;
    wire u0_m0_wo0_cm64_ena_NotRstA;
    wire u0_m0_wo0_cm64_reset1;
    wire [15:0] u0_m0_wo0_cm64_ia;
    wire [0:0] u0_m0_wo0_cm64_aa;
    wire [0:0] u0_m0_wo0_cm64_ab;
    wire [15:0] u0_m0_wo0_cm64_iq;
    wire [15:0] u0_m0_wo0_cm64_q;
    wire u0_m0_wo0_cma0_reset;
    wire [15:0] u0_m0_wo0_cma0_a0;
    wire [15:0] u0_m0_wo0_cma0_b0;
    wire [15:0] u0_m0_wo0_cma0_c0;
    wire [15:0] u0_m0_wo0_cma0_a1;
    wire [15:0] u0_m0_wo0_cma0_b1;
    wire [15:0] u0_m0_wo0_cma0_c1;
    wire [15:0] u0_m0_wo0_cma0_a2;
    wire [15:0] u0_m0_wo0_cma0_b2;
    wire [15:0] u0_m0_wo0_cma0_c2;
    wire [15:0] u0_m0_wo0_cma0_a3;
    wire [15:0] u0_m0_wo0_cma0_b3;
    wire [15:0] u0_m0_wo0_cma0_c3;
    wire [15:0] u0_m0_wo0_cma0_a4;
    wire [15:0] u0_m0_wo0_cma0_b4;
    wire [15:0] u0_m0_wo0_cma0_c4;
    wire [15:0] u0_m0_wo0_cma0_a5;
    wire [15:0] u0_m0_wo0_cma0_b5;
    wire [15:0] u0_m0_wo0_cma0_c5;
    wire [15:0] u0_m0_wo0_cma0_a6;
    wire [15:0] u0_m0_wo0_cma0_b6;
    wire [15:0] u0_m0_wo0_cma0_c6;
    wire [15:0] u0_m0_wo0_cma0_a7;
    wire [15:0] u0_m0_wo0_cma0_b7;
    wire [15:0] u0_m0_wo0_cma0_c7;
    wire [15:0] u0_m0_wo0_cma0_a8;
    wire [15:0] u0_m0_wo0_cma0_b8;
    wire [15:0] u0_m0_wo0_cma0_c8;
    wire [15:0] u0_m0_wo0_cma0_a9;
    wire [15:0] u0_m0_wo0_cma0_b9;
    wire [15:0] u0_m0_wo0_cma0_c9;
    wire [15:0] u0_m0_wo0_cma0_a10;
    wire [15:0] u0_m0_wo0_cma0_b10;
    wire [15:0] u0_m0_wo0_cma0_c10;
    wire [15:0] u0_m0_wo0_cma0_a11;
    wire [15:0] u0_m0_wo0_cma0_b11;
    wire [15:0] u0_m0_wo0_cma0_c11;
    wire [15:0] u0_m0_wo0_cma0_a12;
    wire [15:0] u0_m0_wo0_cma0_b12;
    wire [15:0] u0_m0_wo0_cma0_c12;
    wire [15:0] u0_m0_wo0_cma0_a13;
    wire [15:0] u0_m0_wo0_cma0_b13;
    wire [15:0] u0_m0_wo0_cma0_c13;
    wire [15:0] u0_m0_wo0_cma0_a14;
    wire [15:0] u0_m0_wo0_cma0_b14;
    wire [15:0] u0_m0_wo0_cma0_c14;
    wire [15:0] u0_m0_wo0_cma0_a15;
    wire [15:0] u0_m0_wo0_cma0_b15;
    wire [15:0] u0_m0_wo0_cma0_c15;
    wire [15:0] u0_m0_wo0_cma0_a16;
    wire [15:0] u0_m0_wo0_cma0_b16;
    wire [15:0] u0_m0_wo0_cma0_c16;
    wire [15:0] u0_m0_wo0_cma0_a17;
    wire [15:0] u0_m0_wo0_cma0_b17;
    wire [15:0] u0_m0_wo0_cma0_c17;
    wire [15:0] u0_m0_wo0_cma0_a18;
    wire [15:0] u0_m0_wo0_cma0_b18;
    wire [15:0] u0_m0_wo0_cma0_c18;
    wire [15:0] u0_m0_wo0_cma0_a19;
    wire [15:0] u0_m0_wo0_cma0_b19;
    wire [15:0] u0_m0_wo0_cma0_c19;
    wire [15:0] u0_m0_wo0_cma0_a20;
    wire [15:0] u0_m0_wo0_cma0_b20;
    wire [15:0] u0_m0_wo0_cma0_c20;
    wire [15:0] u0_m0_wo0_cma0_a21;
    wire [15:0] u0_m0_wo0_cma0_b21;
    wire [15:0] u0_m0_wo0_cma0_c21;
    wire [15:0] u0_m0_wo0_cma0_a22;
    wire [15:0] u0_m0_wo0_cma0_b22;
    wire [15:0] u0_m0_wo0_cma0_c22;
    wire [15:0] u0_m0_wo0_cma0_a23;
    wire [15:0] u0_m0_wo0_cma0_b23;
    wire [15:0] u0_m0_wo0_cma0_c23;
    wire [15:0] u0_m0_wo0_cma0_a24;
    wire [15:0] u0_m0_wo0_cma0_b24;
    wire [15:0] u0_m0_wo0_cma0_c24;
    wire [15:0] u0_m0_wo0_cma0_a25;
    wire [15:0] u0_m0_wo0_cma0_b25;
    wire [15:0] u0_m0_wo0_cma0_c25;
    wire [15:0] u0_m0_wo0_cma0_a26;
    wire [15:0] u0_m0_wo0_cma0_b26;
    wire [15:0] u0_m0_wo0_cma0_c26;
    wire [15:0] u0_m0_wo0_cma0_a27;
    wire [15:0] u0_m0_wo0_cma0_b27;
    wire [15:0] u0_m0_wo0_cma0_c27;
    wire [15:0] u0_m0_wo0_cma0_a28;
    wire [15:0] u0_m0_wo0_cma0_b28;
    wire [15:0] u0_m0_wo0_cma0_c28;
    wire [15:0] u0_m0_wo0_cma0_a29;
    wire [15:0] u0_m0_wo0_cma0_b29;
    wire [15:0] u0_m0_wo0_cma0_c29;
    wire [15:0] u0_m0_wo0_cma0_a30;
    wire [15:0] u0_m0_wo0_cma0_b30;
    wire [15:0] u0_m0_wo0_cma0_c30;
    wire [15:0] u0_m0_wo0_cma0_a31;
    wire [15:0] u0_m0_wo0_cma0_b31;
    wire [15:0] u0_m0_wo0_cma0_c31;
    wire [15:0] u0_m0_wo0_cma0_a32;
    wire [15:0] u0_m0_wo0_cma0_b32;
    wire [15:0] u0_m0_wo0_cma0_c32;
    wire [15:0] u0_m0_wo0_cma0_a33;
    wire [15:0] u0_m0_wo0_cma0_b33;
    wire [15:0] u0_m0_wo0_cma0_c33;
    wire [15:0] u0_m0_wo0_cma0_a34;
    wire [15:0] u0_m0_wo0_cma0_b34;
    wire [15:0] u0_m0_wo0_cma0_c34;
    wire [15:0] u0_m0_wo0_cma0_a35;
    wire [15:0] u0_m0_wo0_cma0_b35;
    wire [15:0] u0_m0_wo0_cma0_c35;
    wire [15:0] u0_m0_wo0_cma0_a36;
    wire [15:0] u0_m0_wo0_cma0_b36;
    wire [15:0] u0_m0_wo0_cma0_c36;
    wire [15:0] u0_m0_wo0_cma0_a37;
    wire [15:0] u0_m0_wo0_cma0_b37;
    wire [15:0] u0_m0_wo0_cma0_c37;
    wire [15:0] u0_m0_wo0_cma0_a38;
    wire [15:0] u0_m0_wo0_cma0_b38;
    wire [15:0] u0_m0_wo0_cma0_c38;
    wire [15:0] u0_m0_wo0_cma0_a39;
    wire [15:0] u0_m0_wo0_cma0_b39;
    wire [15:0] u0_m0_wo0_cma0_c39;
    wire [15:0] u0_m0_wo0_cma0_a40;
    wire [15:0] u0_m0_wo0_cma0_b40;
    wire [15:0] u0_m0_wo0_cma0_c40;
    wire [15:0] u0_m0_wo0_cma0_a41;
    wire [15:0] u0_m0_wo0_cma0_b41;
    wire [15:0] u0_m0_wo0_cma0_c41;
    wire [15:0] u0_m0_wo0_cma0_a42;
    wire [15:0] u0_m0_wo0_cma0_b42;
    wire [15:0] u0_m0_wo0_cma0_c42;
    wire [15:0] u0_m0_wo0_cma0_a43;
    wire [15:0] u0_m0_wo0_cma0_b43;
    wire [15:0] u0_m0_wo0_cma0_c43;
    wire [15:0] u0_m0_wo0_cma0_a44;
    wire [15:0] u0_m0_wo0_cma0_b44;
    wire [15:0] u0_m0_wo0_cma0_c44;
    wire [15:0] u0_m0_wo0_cma0_a45;
    wire [15:0] u0_m0_wo0_cma0_b45;
    wire [15:0] u0_m0_wo0_cma0_c45;
    wire [15:0] u0_m0_wo0_cma0_a46;
    wire [15:0] u0_m0_wo0_cma0_b46;
    wire [15:0] u0_m0_wo0_cma0_c46;
    wire [15:0] u0_m0_wo0_cma0_a47;
    wire [15:0] u0_m0_wo0_cma0_b47;
    wire [15:0] u0_m0_wo0_cma0_c47;
    wire [15:0] u0_m0_wo0_cma0_a48;
    wire [15:0] u0_m0_wo0_cma0_b48;
    wire [15:0] u0_m0_wo0_cma0_c48;
    wire [15:0] u0_m0_wo0_cma0_a49;
    wire [15:0] u0_m0_wo0_cma0_b49;
    wire [15:0] u0_m0_wo0_cma0_c49;
    wire [15:0] u0_m0_wo0_cma0_a50;
    wire [15:0] u0_m0_wo0_cma0_b50;
    wire [15:0] u0_m0_wo0_cma0_c50;
    wire [15:0] u0_m0_wo0_cma0_a51;
    wire [15:0] u0_m0_wo0_cma0_b51;
    wire [15:0] u0_m0_wo0_cma0_c51;
    wire [15:0] u0_m0_wo0_cma0_a52;
    wire [15:0] u0_m0_wo0_cma0_b52;
    wire [15:0] u0_m0_wo0_cma0_c52;
    wire [15:0] u0_m0_wo0_cma0_a53;
    wire [15:0] u0_m0_wo0_cma0_b53;
    wire [15:0] u0_m0_wo0_cma0_c53;
    wire [15:0] u0_m0_wo0_cma0_a54;
    wire [15:0] u0_m0_wo0_cma0_b54;
    wire [15:0] u0_m0_wo0_cma0_c54;
    wire [15:0] u0_m0_wo0_cma0_a55;
    wire [15:0] u0_m0_wo0_cma0_b55;
    wire [15:0] u0_m0_wo0_cma0_c55;
    wire [15:0] u0_m0_wo0_cma0_a56;
    wire [15:0] u0_m0_wo0_cma0_b56;
    wire [15:0] u0_m0_wo0_cma0_c56;
    wire [15:0] u0_m0_wo0_cma0_a57;
    wire [15:0] u0_m0_wo0_cma0_b57;
    wire [15:0] u0_m0_wo0_cma0_c57;
    wire [15:0] u0_m0_wo0_cma0_a58;
    wire [15:0] u0_m0_wo0_cma0_b58;
    wire [15:0] u0_m0_wo0_cma0_c58;
    wire [15:0] u0_m0_wo0_cma0_a59;
    wire [15:0] u0_m0_wo0_cma0_b59;
    wire [15:0] u0_m0_wo0_cma0_c59;
    wire [15:0] u0_m0_wo0_cma0_a60;
    wire [15:0] u0_m0_wo0_cma0_b60;
    wire [15:0] u0_m0_wo0_cma0_c60;
    wire [15:0] u0_m0_wo0_cma0_a61;
    wire [15:0] u0_m0_wo0_cma0_b61;
    wire [15:0] u0_m0_wo0_cma0_c61;
    wire [15:0] u0_m0_wo0_cma0_a62;
    wire [15:0] u0_m0_wo0_cma0_b62;
    wire [15:0] u0_m0_wo0_cma0_c62;
    wire [15:0] u0_m0_wo0_cma0_a63;
    wire [15:0] u0_m0_wo0_cma0_b63;
    wire [15:0] u0_m0_wo0_cma0_c63;
    wire [15:0] u0_m0_wo0_cma0_a64;
    wire [15:0] u0_m0_wo0_cma0_b64;
    wire [15:0] u0_m0_wo0_cma0_c64;
    wire [15:0] u0_m0_wo0_cma0_a65;
    wire [15:0] u0_m0_wo0_cma0_b65;
    wire [15:0] u0_m0_wo0_cma0_c65;
    wire [39:0] u0_m0_wo0_cma0_s0;
    wire [43:0] u0_m0_wo0_cma0_s2;
    wire [43:0] u0_m0_wo0_cma0_s4;
    wire [43:0] u0_m0_wo0_cma0_s6;
    wire [43:0] u0_m0_wo0_cma0_s8;
    wire [43:0] u0_m0_wo0_cma0_s10;
    wire [43:0] u0_m0_wo0_cma0_s12;
    wire [43:0] u0_m0_wo0_cma0_s14;
    wire [43:0] u0_m0_wo0_cma0_s16;
    wire [43:0] u0_m0_wo0_cma0_s18;
    wire [43:0] u0_m0_wo0_cma0_s20;
    wire [43:0] u0_m0_wo0_cma0_s22;
    wire [43:0] u0_m0_wo0_cma0_s24;
    wire [43:0] u0_m0_wo0_cma0_s26;
    wire [43:0] u0_m0_wo0_cma0_s28;
    wire [43:0] u0_m0_wo0_cma0_s30;
    wire [43:0] u0_m0_wo0_cma0_s32;
    wire [43:0] u0_m0_wo0_cma0_s34;
    wire [43:0] u0_m0_wo0_cma0_s36;
    wire [43:0] u0_m0_wo0_cma0_s38;
    wire [43:0] u0_m0_wo0_cma0_s40;
    wire [43:0] u0_m0_wo0_cma0_s42;
    wire [43:0] u0_m0_wo0_cma0_s44;
    wire [43:0] u0_m0_wo0_cma0_s46;
    wire [43:0] u0_m0_wo0_cma0_s48;
    wire [43:0] u0_m0_wo0_cma0_s50;
    wire [43:0] u0_m0_wo0_cma0_s52;
    wire [43:0] u0_m0_wo0_cma0_s54;
    wire [43:0] u0_m0_wo0_cma0_s56;
    wire [43:0] u0_m0_wo0_cma0_s58;
    wire [43:0] u0_m0_wo0_cma0_s60;
    wire [43:0] u0_m0_wo0_cma0_s62;
    wire [43:0] u0_m0_wo0_cma0_s64;
    wire [39:0] u0_m0_wo0_cma0_qq0;
    reg [39:0] u0_m0_wo0_cma0_q;
    wire u0_m0_wo0_cma0_ena0;
    wire u0_m0_wo0_cma0_ena1;
    wire u0_m0_wo0_cma0_ena2;
    (* preserve_syn_only *) reg [15:0] u0_m0_wo0_cma0_zero;
    reg [0:0] u0_m0_wo0_sys_delay_q;
    reg [0:0] u0_m0_wo0_oseq_gated_reg_q;
    reg [0:0] d_out0_m0_wo0_assign_id3_q_17_q;
    wire [2:0] outchan_q;
    (* preserve_syn_only *) reg [1:0] outchan_i;
    reg [15:0] d_bank_u0_m0_wi0_wo0_bit_select_merged_c_12_q;
    reg [15:0] d_bank_u0_m0_wi0_wo0_bit_select_merged_c_12_delay_0;
    wire u0_m0_wo0_wi0_r0_delayr0_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_mem_ia;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr0_mem_aa;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr0_mem_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_mem_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_mem_q;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr0_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u0_m0_wo0_wi0_r0_delayr0_rdcnt_i;
    (* preserve_syn_only *) reg u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq;
    reg [4:0] u0_m0_wo0_wi0_r0_delayr0_wraddr_q;
    wire [5:0] u0_m0_wo0_wi0_r0_delayr0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr66_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr66_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr66_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr66_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr66_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr66_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr66_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr66_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr66_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr66_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr66_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr66_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr66_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr70_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr70_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr70_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr70_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr70_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr70_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr70_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr70_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr70_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr70_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr70_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr70_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr70_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr74_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr74_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr74_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr74_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr74_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr74_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr74_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr74_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr74_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr74_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr74_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr74_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr74_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr78_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr78_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr78_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr78_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr78_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr78_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr78_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr78_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr78_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr78_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr78_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr78_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr78_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr82_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr82_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr82_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr82_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr82_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr82_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr82_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr82_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr82_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr82_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr82_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr82_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr82_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr86_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr86_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr86_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr86_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr86_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr86_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr86_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr86_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr86_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr86_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr86_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr86_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr86_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr90_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr90_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr90_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr90_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr90_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr90_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr90_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr90_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr90_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr90_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr90_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr90_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr90_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr94_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr94_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr94_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr94_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr94_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr94_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr94_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr94_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr94_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr94_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr94_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr94_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr94_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr98_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr98_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr98_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr98_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr98_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr98_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr98_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr98_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr98_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr98_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr98_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr98_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr98_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr102_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr102_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr102_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr102_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr102_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr102_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr102_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr102_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr102_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr102_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr102_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr102_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr102_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr106_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr106_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr106_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr106_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr106_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr106_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr106_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr106_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr106_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr106_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr106_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr106_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr106_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr110_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr110_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr110_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr110_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr110_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr110_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr110_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr110_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr110_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr110_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr110_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr110_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr110_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr114_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr114_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr114_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr114_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr114_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr114_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr114_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr114_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr114_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr114_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr114_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr114_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr114_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr118_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr118_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr118_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr118_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr118_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr118_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr118_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr118_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr118_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr118_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr118_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr118_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr118_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr122_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr122_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr122_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr122_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr122_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr122_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr122_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr122_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr122_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr122_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr122_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr122_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr122_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr126_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr126_mem_ena_OrRstB;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr126_mem_ia;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr126_mem_aa;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr126_mem_ab;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr126_mem_iq;
    wire [63:0] u0_m0_wo0_wi0_r0_delayr126_mem_q;
    wire [1:0] u0_m0_wo0_wi0_r0_delayr126_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] u0_m0_wo0_wi0_r0_delayr126_rdcnt_i;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr126_wraddr_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr126_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr126_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr126_sticky_ena_q;
    wire u0_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0;
    wire u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ia;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr0_split_0_mem_aa;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ab;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_split_0_mem_iq;
    wire [15:0] u0_m0_wo0_wi0_r0_delayr0_split_0_mem_q;
    wire [4:0] u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i;
    reg [4:0] u0_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
    wire [5:0] u0_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] u0_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q;
    wire [0:0] rblookup_read_hit_q;
    wire [0:0] u0_m0_wo0_sys_and_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_rdmux_s;
    reg [4:0] u0_m0_wo0_wi0_r0_delayr0_rdmux_q;
    wire [5:0] u0_m0_wo0_wi0_r0_delayr0_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr66_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr66_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr66_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr66_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr66_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr66_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr66_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr70_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr70_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr70_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr70_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr70_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr70_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr70_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr74_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr74_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr74_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr74_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr74_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr74_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr74_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr78_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr78_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr78_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr78_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr78_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr78_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr78_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr82_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr82_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr82_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr82_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr82_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr82_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr82_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr86_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr86_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr86_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr86_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr86_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr86_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr86_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr90_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr90_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr90_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr90_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr90_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr90_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr90_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr94_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr94_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr94_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr94_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr94_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr94_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr94_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr98_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr98_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr98_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr98_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr98_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr98_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr98_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr102_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr102_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr102_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr102_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr102_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr102_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr102_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr106_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr106_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr106_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr106_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr106_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr106_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr106_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr110_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr110_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr110_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr110_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr110_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr110_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr110_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr114_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr114_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr114_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr114_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr114_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr114_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr114_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr118_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr118_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr118_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr118_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr118_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr118_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr118_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr122_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr122_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr122_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr122_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr122_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr122_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr122_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr126_rdmux_s;
    reg [1:0] u0_m0_wo0_wi0_r0_delayr126_rdmux_q;
    wire [2:0] u0_m0_wo0_wi0_r0_delayr126_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr126_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr126_notEnable_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr126_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr126_enaAnd_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s;
    reg [4:0] u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q;
    wire [5:0] u0_m0_wo0_wi0_r0_delayr0_split_0_cmp_b;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_split_0_cmp_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_split_0_nor_q;
    wire [0:0] u0_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q;
    wire [16:0] xIn_bankIn_0_q;
    wire [31:0] rmPad_sel_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split1_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split1_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split1_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split1_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split5_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split5_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split5_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split5_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split9_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split9_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split9_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split9_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split13_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split13_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split13_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split13_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split17_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split17_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split17_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split17_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split21_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split21_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split21_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split21_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split25_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split25_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split25_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split25_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split29_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split29_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split29_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split29_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split33_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split33_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split33_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split33_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split37_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split37_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split37_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split37_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split41_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split41_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split41_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split41_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split45_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split45_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split45_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split45_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split49_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split49_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split49_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split49_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split53_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split53_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split53_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split53_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split57_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split57_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split57_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split57_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split61_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split61_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split61_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split61_e;
    reg [15:0] u0_m0_wo0_wi0_r0_phasedelay0_q;
    wire [15:0] u0_m0_wo0_wi0_r0_split66_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split66_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split66_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split66_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split70_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split70_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split70_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split70_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split74_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split74_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split74_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split74_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split78_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split78_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split78_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split78_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split82_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split82_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split82_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split82_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split86_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split86_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split86_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split86_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split90_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split90_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split90_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split90_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split94_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split94_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split94_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split94_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split98_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split98_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split98_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split98_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split102_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split102_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split102_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split102_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split106_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split106_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split106_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split106_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split110_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split110_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split110_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split110_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split114_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split114_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split114_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split114_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split118_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split118_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split118_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split118_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split122_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split122_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split122_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split122_e;
    wire [15:0] u0_m0_wo0_wi0_r0_split126_b;
    wire [15:0] u0_m0_wo0_wi0_r0_split126_c;
    wire [15:0] u0_m0_wo0_wi0_r0_split126_d;
    wire [15:0] u0_m0_wo0_wi0_r0_split126_e;
    wire [0:0] bank_u0_m0_wi0_wo0_bit_select_merged_b;
    wire [15:0] bank_u0_m0_wi0_wo0_bit_select_merged_c;
    wire [63:0] u0_m0_wo0_wi0_r0_join1_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join5_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join9_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join13_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join17_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join21_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join25_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join29_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join33_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join37_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join41_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join45_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join49_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join53_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join57_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join61_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join66_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join70_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join74_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join78_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join82_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join86_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join90_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join94_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join98_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join102_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join106_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join110_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join114_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join118_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join122_q;
    wire [63:0] u0_m0_wo0_wi0_r0_join126_q;

    import duc_model_DUT_safe_path_ver::safe_path_ver;

    // d_busIn_writedata_11(DELAY,469)@10 + 1
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            d_busIn_writedata_11_q <= '0;
        end
        else
        begin
            d_busIn_writedata_11_q <= $unsigned(busIn_writedata);
        end
    end

    // rblookup(LOOKUP,5)@10 + 1
    assign rblookup_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            rblookup_q <= $unsigned(8'b00000000);
            rblookup_h <= $unsigned(1'b0);
            rblookup_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000000000 : begin
                                         rblookup_q <= 8'b00000000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000000001 : begin
                                         rblookup_q <= 8'b00000001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000000010 : begin
                                         rblookup_q <= 8'b00000010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000000011 : begin
                                         rblookup_q <= 8'b00000011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000000100 : begin
                                         rblookup_q <= 8'b00000100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000000101 : begin
                                         rblookup_q <= 8'b00000101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000000110 : begin
                                         rblookup_q <= 8'b00000110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000000111 : begin
                                         rblookup_q <= 8'b00000111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000001000 : begin
                                         rblookup_q <= 8'b00001000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000001001 : begin
                                         rblookup_q <= 8'b00001001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000001010 : begin
                                         rblookup_q <= 8'b00001010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000001011 : begin
                                         rblookup_q <= 8'b00001011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000001100 : begin
                                         rblookup_q <= 8'b00001100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000001101 : begin
                                         rblookup_q <= 8'b00001101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000001110 : begin
                                         rblookup_q <= 8'b00001110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000001111 : begin
                                         rblookup_q <= 8'b00001111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000010000 : begin
                                         rblookup_q <= 8'b00010000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000010001 : begin
                                         rblookup_q <= 8'b00010001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000010010 : begin
                                         rblookup_q <= 8'b00010010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000010011 : begin
                                         rblookup_q <= 8'b00010011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000010100 : begin
                                         rblookup_q <= 8'b00010100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000010101 : begin
                                         rblookup_q <= 8'b00010101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000010110 : begin
                                         rblookup_q <= 8'b00010110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000010111 : begin
                                         rblookup_q <= 8'b00010111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000011000 : begin
                                         rblookup_q <= 8'b00011000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000011001 : begin
                                         rblookup_q <= 8'b00011001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000011010 : begin
                                         rblookup_q <= 8'b00011010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000011011 : begin
                                         rblookup_q <= 8'b00011011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000011100 : begin
                                         rblookup_q <= 8'b00011100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000011101 : begin
                                         rblookup_q <= 8'b00011101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000011110 : begin
                                         rblookup_q <= 8'b00011110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000011111 : begin
                                         rblookup_q <= 8'b00011111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000100000 : begin
                                         rblookup_q <= 8'b00100000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000100001 : begin
                                         rblookup_q <= 8'b00100001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000100010 : begin
                                         rblookup_q <= 8'b00100010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000100011 : begin
                                         rblookup_q <= 8'b00100011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000100100 : begin
                                         rblookup_q <= 8'b00100100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000100101 : begin
                                         rblookup_q <= 8'b00100101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000100110 : begin
                                         rblookup_q <= 8'b00100110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000100111 : begin
                                         rblookup_q <= 8'b00100111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000101000 : begin
                                         rblookup_q <= 8'b00101000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000101001 : begin
                                         rblookup_q <= 8'b00101001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000101010 : begin
                                         rblookup_q <= 8'b00101010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000101011 : begin
                                         rblookup_q <= 8'b00101011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000101100 : begin
                                         rblookup_q <= 8'b00101100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000101101 : begin
                                         rblookup_q <= 8'b00101101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000101110 : begin
                                         rblookup_q <= 8'b00101110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000101111 : begin
                                         rblookup_q <= 8'b00101111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000110000 : begin
                                         rblookup_q <= 8'b00110000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000110001 : begin
                                         rblookup_q <= 8'b00110001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000110010 : begin
                                         rblookup_q <= 8'b00110010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000110011 : begin
                                         rblookup_q <= 8'b00110011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000110100 : begin
                                         rblookup_q <= 8'b00110100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000110101 : begin
                                         rblookup_q <= 8'b00110101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000110110 : begin
                                         rblookup_q <= 8'b00110110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000110111 : begin
                                         rblookup_q <= 8'b00110111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000111000 : begin
                                         rblookup_q <= 8'b00111000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000111001 : begin
                                         rblookup_q <= 8'b00111001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000111010 : begin
                                         rblookup_q <= 8'b00111010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000111011 : begin
                                         rblookup_q <= 8'b00111011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000111100 : begin
                                         rblookup_q <= 8'b00111100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000111101 : begin
                                         rblookup_q <= 8'b00111101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000111110 : begin
                                         rblookup_q <= 8'b00111110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000000111111 : begin
                                         rblookup_q <= 8'b00111111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001000000 : begin
                                         rblookup_q <= 8'b01000000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001000001 : begin
                                         rblookup_q <= 8'b01000001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001000010 : begin
                                         rblookup_q <= 8'b01000010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001000011 : begin
                                         rblookup_q <= 8'b01000011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001000100 : begin
                                         rblookup_q <= 8'b01000100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001000101 : begin
                                         rblookup_q <= 8'b01000101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001000110 : begin
                                         rblookup_q <= 8'b01000110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001000111 : begin
                                         rblookup_q <= 8'b01000111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001001000 : begin
                                         rblookup_q <= 8'b01001000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001001001 : begin
                                         rblookup_q <= 8'b01001001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001001010 : begin
                                         rblookup_q <= 8'b01001010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001001011 : begin
                                         rblookup_q <= 8'b01001011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001001100 : begin
                                         rblookup_q <= 8'b01001100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001001101 : begin
                                         rblookup_q <= 8'b01001101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001001110 : begin
                                         rblookup_q <= 8'b01001110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001001111 : begin
                                         rblookup_q <= 8'b01001111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001010000 : begin
                                         rblookup_q <= 8'b01010000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001010001 : begin
                                         rblookup_q <= 8'b01010001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001010010 : begin
                                         rblookup_q <= 8'b01010010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001010011 : begin
                                         rblookup_q <= 8'b01010011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001010100 : begin
                                         rblookup_q <= 8'b01010100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001010101 : begin
                                         rblookup_q <= 8'b01010101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001010110 : begin
                                         rblookup_q <= 8'b01010110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001010111 : begin
                                         rblookup_q <= 8'b01010111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001011000 : begin
                                         rblookup_q <= 8'b01011000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001011001 : begin
                                         rblookup_q <= 8'b01011001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001011010 : begin
                                         rblookup_q <= 8'b01011010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001011011 : begin
                                         rblookup_q <= 8'b01011011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001011100 : begin
                                         rblookup_q <= 8'b01011100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001011101 : begin
                                         rblookup_q <= 8'b01011101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001011110 : begin
                                         rblookup_q <= 8'b01011110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001011111 : begin
                                         rblookup_q <= 8'b01011111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001100000 : begin
                                         rblookup_q <= 8'b01100000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001100001 : begin
                                         rblookup_q <= 8'b01100001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001100010 : begin
                                         rblookup_q <= 8'b01100010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001100011 : begin
                                         rblookup_q <= 8'b01100011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001100100 : begin
                                         rblookup_q <= 8'b01100100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001100101 : begin
                                         rblookup_q <= 8'b01100101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001100110 : begin
                                         rblookup_q <= 8'b01100110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001100111 : begin
                                         rblookup_q <= 8'b01100111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001101000 : begin
                                         rblookup_q <= 8'b01101000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001101001 : begin
                                         rblookup_q <= 8'b01101001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001101010 : begin
                                         rblookup_q <= 8'b01101010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001101011 : begin
                                         rblookup_q <= 8'b01101011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001101100 : begin
                                         rblookup_q <= 8'b01101100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001101101 : begin
                                         rblookup_q <= 8'b01101101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001101110 : begin
                                         rblookup_q <= 8'b01101110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001101111 : begin
                                         rblookup_q <= 8'b01101111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001110000 : begin
                                         rblookup_q <= 8'b01110000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001110001 : begin
                                         rblookup_q <= 8'b01110001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001110010 : begin
                                         rblookup_q <= 8'b01110010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001110011 : begin
                                         rblookup_q <= 8'b01110011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001110100 : begin
                                         rblookup_q <= 8'b01110100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001110101 : begin
                                         rblookup_q <= 8'b01110101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001110110 : begin
                                         rblookup_q <= 8'b01110110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001110111 : begin
                                         rblookup_q <= 8'b01110111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001111000 : begin
                                         rblookup_q <= 8'b01111000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001111001 : begin
                                         rblookup_q <= 8'b01111001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001111010 : begin
                                         rblookup_q <= 8'b01111010;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001111011 : begin
                                         rblookup_q <= 8'b01111011;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001111100 : begin
                                         rblookup_q <= 8'b01111100;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001111101 : begin
                                         rblookup_q <= 8'b01111101;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001111110 : begin
                                         rblookup_q <= 8'b01111110;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000001111111 : begin
                                         rblookup_q <= 8'b01111111;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000010000000 : begin
                                         rblookup_q <= 8'b10000000;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                14'b00000010000001 : begin
                                         rblookup_q <= 8'b10000001;
                                         rblookup_h <= 1'b1;
                                         rblookup_e <= rblookup_c;
                                     end
                default : begin
                              rblookup_q <= 8'b00000000;
                              rblookup_h <= 1'b0;
                              rblookup_e <= 1'b0;
                          end
            endcase
        end
    end

    // rm(DUALMEM,8)@11 + 2
    assign rm_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign rm_aa = rblookup_q;
    assign rm_ab = rblookup_q;
    assign rm_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(8),
        .numwords_a(130),
        .width_b(16),
        .widthad_b(8),
        .numwords_b(130),
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
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_rm.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) rm_dmem (
        .clocken0(rm_ena_NotRstA),
        .clock0(bus_clk),
        .address_a(rm_aa),
        .data_a(rm_ia),
        .wren_a(rblookup_e[0]),
        .address_b(rm_ab),
        .q_b(rm_iq),
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
    assign rm_q = rm_iq[15:0];

    // rmPad_sel(BITSELECT,466)@13
    assign rmPad_sel_b = $unsigned({{16{rm_q[15]}}, rm_q[15:0]});

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // d_busIn_read_12(DELAY,470)@10 + 2
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_busIn_read_12_delay_0 <= $unsigned(busIn_read);
            d_busIn_read_12_q <= d_busIn_read_12_delay_0;
        end
    end

    // d_rblookup_h_12(DELAY,471)@11 + 1
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_rblookup_h_12_q <= $unsigned(rblookup_h);
        end
    end

    // rblookup_read_hit(LOGICAL,6)@12
    assign rblookup_read_hit_q = d_rblookup_h_12_q & d_busIn_read_12_q;

    // rblookup_valid(REG,7)@12 + 1
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            rblookup_valid_q <= $unsigned(rblookup_read_hit_q);
        end
    end

    // busOut(BUSOUT,10)@13
    assign busOut_readdatavalid = rblookup_valid_q;
    assign busOut_readdata = rmPad_sel_b;

    // xIn_bankIn_0(BITJOIN,3)@10
    assign xIn_bankIn_0_q = {bankIn_0, xIn_0};

    // bank_u0_m0_wi0_wo0_bit_select_merged(BITSELECT,468)@10
    assign bank_u0_m0_wi0_wo0_bit_select_merged_b = $unsigned(xIn_bankIn_0_q[16:16]);
    assign bank_u0_m0_wi0_wo0_bit_select_merged_c = $unsigned(xIn_bankIn_0_q[15:0]);

    // u0_m0_wo0_dec64(LOOKUP,388)@10 + 1
    assign u0_m0_wo0_dec64_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec64_q <= $unsigned(1'b0);
            u0_m0_wo0_dec64_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000001000000 : begin
                                         u0_m0_wo0_dec64_q <= 1'b0;
                                         u0_m0_wo0_dec64_e <= u0_m0_wo0_dec64_c;
                                     end
                14'b00000010000001 : begin
                                         u0_m0_wo0_dec64_q <= 1'b1;
                                         u0_m0_wo0_dec64_e <= u0_m0_wo0_dec64_c;
                                     end
                default : begin
                              u0_m0_wo0_dec64_q <= 1'b0;
                              u0_m0_wo0_dec64_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm64(DUALMEM,390)@10 + 2
    assign u0_m0_wo0_cm64_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm64_aa = u0_m0_wo0_dec64_q;
    assign u0_m0_wo0_cm64_ab = bank_u0_m0_wi0_wo0_bit_select_merged_b;
    assign u0_m0_wo0_cm64_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm64.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm64_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm64_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm64_aa),
        .data_a(u0_m0_wo0_cm64_ia),
        .wren_a(u0_m0_wo0_dec64_e[0]),
        .address_b(u0_m0_wo0_cm64_ab),
        .q_b(u0_m0_wo0_cm64_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm64_q = u0_m0_wo0_cm64_iq[15:0];

    // u0_m0_wo0_bank_delayr1(DELAY,129)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr1_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr1_q <= bank_u0_m0_wi0_wo0_bit_select_merged_b;
        end
    end

    // u0_m0_wo0_dec63(LOOKUP,385)@10 + 1
    assign u0_m0_wo0_dec63_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec63_q <= $unsigned(1'b0);
            u0_m0_wo0_dec63_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000111111 : begin
                                         u0_m0_wo0_dec63_q <= 1'b0;
                                         u0_m0_wo0_dec63_e <= u0_m0_wo0_dec63_c;
                                     end
                14'b00000010000000 : begin
                                         u0_m0_wo0_dec63_q <= 1'b1;
                                         u0_m0_wo0_dec63_e <= u0_m0_wo0_dec63_c;
                                     end
                default : begin
                              u0_m0_wo0_dec63_q <= 1'b0;
                              u0_m0_wo0_dec63_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm63(DUALMEM,387)@10 + 2
    assign u0_m0_wo0_cm63_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm63_aa = u0_m0_wo0_dec63_q;
    assign u0_m0_wo0_cm63_ab = u0_m0_wo0_bank_delayr1_q;
    assign u0_m0_wo0_cm63_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm63.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm63_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm63_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm63_aa),
        .data_a(u0_m0_wo0_cm63_ia),
        .wren_a(u0_m0_wo0_dec63_e[0]),
        .address_b(u0_m0_wo0_cm63_ab),
        .q_b(u0_m0_wo0_cm63_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm63_q = u0_m0_wo0_cm63_iq[15:0];

    // u0_m0_wo0_bank_delayr2(DELAY,130)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr2_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr2_q <= u0_m0_wo0_bank_delayr1_q;
        end
    end

    // u0_m0_wo0_dec62(LOOKUP,382)@10 + 1
    assign u0_m0_wo0_dec62_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec62_q <= $unsigned(1'b0);
            u0_m0_wo0_dec62_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000111110 : begin
                                         u0_m0_wo0_dec62_q <= 1'b0;
                                         u0_m0_wo0_dec62_e <= u0_m0_wo0_dec62_c;
                                     end
                14'b00000001111111 : begin
                                         u0_m0_wo0_dec62_q <= 1'b1;
                                         u0_m0_wo0_dec62_e <= u0_m0_wo0_dec62_c;
                                     end
                default : begin
                              u0_m0_wo0_dec62_q <= 1'b0;
                              u0_m0_wo0_dec62_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm62(DUALMEM,384)@10 + 2
    assign u0_m0_wo0_cm62_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm62_aa = u0_m0_wo0_dec62_q;
    assign u0_m0_wo0_cm62_ab = u0_m0_wo0_bank_delayr2_q;
    assign u0_m0_wo0_cm62_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm62.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm62_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm62_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm62_aa),
        .data_a(u0_m0_wo0_cm62_ia),
        .wren_a(u0_m0_wo0_dec62_e[0]),
        .address_b(u0_m0_wo0_cm62_ab),
        .q_b(u0_m0_wo0_cm62_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm62_q = u0_m0_wo0_cm62_iq[15:0];

    // u0_m0_wo0_bank_delayr3(DELAY,131)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr3_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr3_q <= u0_m0_wo0_bank_delayr2_q;
        end
    end

    // u0_m0_wo0_dec61(LOOKUP,379)@10 + 1
    assign u0_m0_wo0_dec61_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec61_q <= $unsigned(1'b0);
            u0_m0_wo0_dec61_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000111101 : begin
                                         u0_m0_wo0_dec61_q <= 1'b0;
                                         u0_m0_wo0_dec61_e <= u0_m0_wo0_dec61_c;
                                     end
                14'b00000001111110 : begin
                                         u0_m0_wo0_dec61_q <= 1'b1;
                                         u0_m0_wo0_dec61_e <= u0_m0_wo0_dec61_c;
                                     end
                default : begin
                              u0_m0_wo0_dec61_q <= 1'b0;
                              u0_m0_wo0_dec61_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm61(DUALMEM,381)@10 + 2
    assign u0_m0_wo0_cm61_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm61_aa = u0_m0_wo0_dec61_q;
    assign u0_m0_wo0_cm61_ab = u0_m0_wo0_bank_delayr3_q;
    assign u0_m0_wo0_cm61_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm61.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm61_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm61_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm61_aa),
        .data_a(u0_m0_wo0_cm61_ia),
        .wren_a(u0_m0_wo0_dec61_e[0]),
        .address_b(u0_m0_wo0_cm61_ab),
        .q_b(u0_m0_wo0_cm61_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm61_q = u0_m0_wo0_cm61_iq[15:0];

    // u0_m0_wo0_wi0_r0_join61(BITJOIN,75)@12
    assign u0_m0_wo0_wi0_r0_join61_q = {u0_m0_wo0_wi0_r0_split61_d, u0_m0_wo0_wi0_r0_split61_c, u0_m0_wo0_wi0_r0_split61_b, u0_m0_wo0_wi0_r0_split57_e};

    // u0_m0_wo0_wi0_r0_delayr61(DELAY,77)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr61_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr61_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr61_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr61_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join61_q);
            u0_m0_wo0_wi0_r0_delayr61_delay_1 <= u0_m0_wo0_wi0_r0_delayr61_delay_0;
            u0_m0_wo0_wi0_r0_delayr61_q <= u0_m0_wo0_wi0_r0_delayr61_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split61(BITSELECT,76)@12
    assign u0_m0_wo0_wi0_r0_split61_b = $unsigned(u0_m0_wo0_wi0_r0_delayr61_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split61_c = $unsigned(u0_m0_wo0_wi0_r0_delayr61_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split61_d = $unsigned(u0_m0_wo0_wi0_r0_delayr61_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split61_e = $unsigned(u0_m0_wo0_wi0_r0_delayr61_q[63:48]);

    // u0_m0_wo0_bank_delayr4(DELAY,132)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr4_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr4_q <= u0_m0_wo0_bank_delayr3_q;
        end
    end

    // u0_m0_wo0_dec60(LOOKUP,376)@10 + 1
    assign u0_m0_wo0_dec60_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec60_q <= $unsigned(1'b0);
            u0_m0_wo0_dec60_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000111100 : begin
                                         u0_m0_wo0_dec60_q <= 1'b0;
                                         u0_m0_wo0_dec60_e <= u0_m0_wo0_dec60_c;
                                     end
                14'b00000001111101 : begin
                                         u0_m0_wo0_dec60_q <= 1'b1;
                                         u0_m0_wo0_dec60_e <= u0_m0_wo0_dec60_c;
                                     end
                default : begin
                              u0_m0_wo0_dec60_q <= 1'b0;
                              u0_m0_wo0_dec60_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm60(DUALMEM,378)@10 + 2
    assign u0_m0_wo0_cm60_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm60_aa = u0_m0_wo0_dec60_q;
    assign u0_m0_wo0_cm60_ab = u0_m0_wo0_bank_delayr4_q;
    assign u0_m0_wo0_cm60_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm60.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm60_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm60_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm60_aa),
        .data_a(u0_m0_wo0_cm60_ia),
        .wren_a(u0_m0_wo0_dec60_e[0]),
        .address_b(u0_m0_wo0_cm60_ab),
        .q_b(u0_m0_wo0_cm60_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm60_q = u0_m0_wo0_cm60_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr66_notEnable(LOGICAL,496)@12
    assign u0_m0_wo0_wi0_r0_delayr66_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr66_nor(LOGICAL,497)@12
    assign u0_m0_wo0_wi0_r0_delayr66_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr66_notEnable_q | u0_m0_wo0_wi0_r0_delayr66_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr66_mem_last(CONSTANT,493)
    assign u0_m0_wo0_wi0_r0_delayr66_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr66_cmp(LOGICAL,494)@12
    assign u0_m0_wo0_wi0_r0_delayr66_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr66_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr66_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr66_mem_last_q == u0_m0_wo0_wi0_r0_delayr66_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr66_cmpReg(REG,495)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr66_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr66_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr66_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr66_sticky_ena(REG,498)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr66_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr66_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr66_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr66_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr66_enaAnd(LOGICAL,499)@12
    assign u0_m0_wo0_wi0_r0_delayr66_enaAnd_q = u0_m0_wo0_wi0_r0_delayr66_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr66_rdcnt(COUNTER,490)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr66_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr66_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr66_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr66_rdcnt_q = u0_m0_wo0_wi0_r0_delayr66_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr66_rdmux(MUX,491)@12
    assign u0_m0_wo0_wi0_r0_delayr66_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr66_rdmux_s or u0_m0_wo0_wi0_r0_delayr66_wraddr_q or u0_m0_wo0_wi0_r0_delayr66_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr66_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr66_rdmux_q = u0_m0_wo0_wi0_r0_delayr66_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr66_rdmux_q = u0_m0_wo0_wi0_r0_delayr66_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr66_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join66(BITJOIN,79)@12
    assign u0_m0_wo0_wi0_r0_join66_q = {u0_m0_wo0_wi0_r0_split66_d, u0_m0_wo0_wi0_r0_split66_c, u0_m0_wo0_wi0_r0_split66_b, u0_m0_wo0_wi0_r0_split61_e};

    // u0_m0_wo0_wi0_r0_delayr66_wraddr(REG,492)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr66_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr66_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr66_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr66_mem(DUALMEM,489)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr66_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join66_q);
    assign u0_m0_wo0_wi0_r0_delayr66_mem_aa = u0_m0_wo0_wi0_r0_delayr66_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr66_mem_ab = u0_m0_wo0_wi0_r0_delayr66_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr66_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr66_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr66_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr66_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr66_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr66_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr66_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr66_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr66_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr66_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr66_mem_q = u0_m0_wo0_wi0_r0_delayr66_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split66(BITSELECT,80)@12
    assign u0_m0_wo0_wi0_r0_split66_b = $unsigned(u0_m0_wo0_wi0_r0_delayr66_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split66_c = $unsigned(u0_m0_wo0_wi0_r0_delayr66_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split66_d = $unsigned(u0_m0_wo0_wi0_r0_delayr66_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split66_e = $unsigned(u0_m0_wo0_wi0_r0_delayr66_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr5(DELAY,133)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr5_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr5_q <= u0_m0_wo0_bank_delayr4_q;
        end
    end

    // u0_m0_wo0_dec59(LOOKUP,373)@10 + 1
    assign u0_m0_wo0_dec59_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec59_q <= $unsigned(1'b0);
            u0_m0_wo0_dec59_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000111011 : begin
                                         u0_m0_wo0_dec59_q <= 1'b0;
                                         u0_m0_wo0_dec59_e <= u0_m0_wo0_dec59_c;
                                     end
                14'b00000001111100 : begin
                                         u0_m0_wo0_dec59_q <= 1'b1;
                                         u0_m0_wo0_dec59_e <= u0_m0_wo0_dec59_c;
                                     end
                default : begin
                              u0_m0_wo0_dec59_q <= 1'b0;
                              u0_m0_wo0_dec59_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm59(DUALMEM,375)@10 + 2
    assign u0_m0_wo0_cm59_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm59_aa = u0_m0_wo0_dec59_q;
    assign u0_m0_wo0_cm59_ab = u0_m0_wo0_bank_delayr5_q;
    assign u0_m0_wo0_cm59_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm59.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm59_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm59_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm59_aa),
        .data_a(u0_m0_wo0_cm59_ia),
        .wren_a(u0_m0_wo0_dec59_e[0]),
        .address_b(u0_m0_wo0_cm59_ab),
        .q_b(u0_m0_wo0_cm59_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm59_q = u0_m0_wo0_cm59_iq[15:0];

    // u0_m0_wo0_bank_delayr6(DELAY,134)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr6_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr6_q <= u0_m0_wo0_bank_delayr5_q;
        end
    end

    // u0_m0_wo0_dec58(LOOKUP,370)@10 + 1
    assign u0_m0_wo0_dec58_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec58_q <= $unsigned(1'b0);
            u0_m0_wo0_dec58_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000111010 : begin
                                         u0_m0_wo0_dec58_q <= 1'b0;
                                         u0_m0_wo0_dec58_e <= u0_m0_wo0_dec58_c;
                                     end
                14'b00000001111011 : begin
                                         u0_m0_wo0_dec58_q <= 1'b1;
                                         u0_m0_wo0_dec58_e <= u0_m0_wo0_dec58_c;
                                     end
                default : begin
                              u0_m0_wo0_dec58_q <= 1'b0;
                              u0_m0_wo0_dec58_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm58(DUALMEM,372)@10 + 2
    assign u0_m0_wo0_cm58_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm58_aa = u0_m0_wo0_dec58_q;
    assign u0_m0_wo0_cm58_ab = u0_m0_wo0_bank_delayr6_q;
    assign u0_m0_wo0_cm58_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm58.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm58_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm58_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm58_aa),
        .data_a(u0_m0_wo0_cm58_ia),
        .wren_a(u0_m0_wo0_dec58_e[0]),
        .address_b(u0_m0_wo0_cm58_ab),
        .q_b(u0_m0_wo0_cm58_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm58_q = u0_m0_wo0_cm58_iq[15:0];

    // u0_m0_wo0_bank_delayr7(DELAY,135)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr7_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr7_q <= u0_m0_wo0_bank_delayr6_q;
        end
    end

    // u0_m0_wo0_dec57(LOOKUP,367)@10 + 1
    assign u0_m0_wo0_dec57_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec57_q <= $unsigned(1'b0);
            u0_m0_wo0_dec57_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000111001 : begin
                                         u0_m0_wo0_dec57_q <= 1'b0;
                                         u0_m0_wo0_dec57_e <= u0_m0_wo0_dec57_c;
                                     end
                14'b00000001111010 : begin
                                         u0_m0_wo0_dec57_q <= 1'b1;
                                         u0_m0_wo0_dec57_e <= u0_m0_wo0_dec57_c;
                                     end
                default : begin
                              u0_m0_wo0_dec57_q <= 1'b0;
                              u0_m0_wo0_dec57_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm57(DUALMEM,369)@10 + 2
    assign u0_m0_wo0_cm57_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm57_aa = u0_m0_wo0_dec57_q;
    assign u0_m0_wo0_cm57_ab = u0_m0_wo0_bank_delayr7_q;
    assign u0_m0_wo0_cm57_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm57.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm57_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm57_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm57_aa),
        .data_a(u0_m0_wo0_cm57_ia),
        .wren_a(u0_m0_wo0_dec57_e[0]),
        .address_b(u0_m0_wo0_cm57_ab),
        .q_b(u0_m0_wo0_cm57_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm57_q = u0_m0_wo0_cm57_iq[15:0];

    // u0_m0_wo0_wi0_r0_join57(BITJOIN,72)@12
    assign u0_m0_wo0_wi0_r0_join57_q = {u0_m0_wo0_wi0_r0_split57_d, u0_m0_wo0_wi0_r0_split57_c, u0_m0_wo0_wi0_r0_split57_b, u0_m0_wo0_wi0_r0_split53_e};

    // u0_m0_wo0_wi0_r0_delayr57(DELAY,74)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr57_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr57_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr57_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr57_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join57_q);
            u0_m0_wo0_wi0_r0_delayr57_delay_1 <= u0_m0_wo0_wi0_r0_delayr57_delay_0;
            u0_m0_wo0_wi0_r0_delayr57_q <= u0_m0_wo0_wi0_r0_delayr57_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split57(BITSELECT,73)@12
    assign u0_m0_wo0_wi0_r0_split57_b = $unsigned(u0_m0_wo0_wi0_r0_delayr57_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split57_c = $unsigned(u0_m0_wo0_wi0_r0_delayr57_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split57_d = $unsigned(u0_m0_wo0_wi0_r0_delayr57_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split57_e = $unsigned(u0_m0_wo0_wi0_r0_delayr57_q[63:48]);

    // u0_m0_wo0_bank_delayr8(DELAY,136)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr8_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr8_q <= u0_m0_wo0_bank_delayr7_q;
        end
    end

    // u0_m0_wo0_dec56(LOOKUP,364)@10 + 1
    assign u0_m0_wo0_dec56_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec56_q <= $unsigned(1'b0);
            u0_m0_wo0_dec56_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000111000 : begin
                                         u0_m0_wo0_dec56_q <= 1'b0;
                                         u0_m0_wo0_dec56_e <= u0_m0_wo0_dec56_c;
                                     end
                14'b00000001111001 : begin
                                         u0_m0_wo0_dec56_q <= 1'b1;
                                         u0_m0_wo0_dec56_e <= u0_m0_wo0_dec56_c;
                                     end
                default : begin
                              u0_m0_wo0_dec56_q <= 1'b0;
                              u0_m0_wo0_dec56_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm56(DUALMEM,366)@10 + 2
    assign u0_m0_wo0_cm56_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm56_aa = u0_m0_wo0_dec56_q;
    assign u0_m0_wo0_cm56_ab = u0_m0_wo0_bank_delayr8_q;
    assign u0_m0_wo0_cm56_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm56.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm56_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm56_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm56_aa),
        .data_a(u0_m0_wo0_cm56_ia),
        .wren_a(u0_m0_wo0_dec56_e[0]),
        .address_b(u0_m0_wo0_cm56_ab),
        .q_b(u0_m0_wo0_cm56_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm56_q = u0_m0_wo0_cm56_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr70_notEnable(LOGICAL,507)@12
    assign u0_m0_wo0_wi0_r0_delayr70_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr70_nor(LOGICAL,508)@12
    assign u0_m0_wo0_wi0_r0_delayr70_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr70_notEnable_q | u0_m0_wo0_wi0_r0_delayr70_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr70_mem_last(CONSTANT,504)
    assign u0_m0_wo0_wi0_r0_delayr70_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr70_cmp(LOGICAL,505)@12
    assign u0_m0_wo0_wi0_r0_delayr70_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr70_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr70_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr70_mem_last_q == u0_m0_wo0_wi0_r0_delayr70_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr70_cmpReg(REG,506)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr70_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr70_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr70_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr70_sticky_ena(REG,509)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr70_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr70_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr70_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr70_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr70_enaAnd(LOGICAL,510)@12
    assign u0_m0_wo0_wi0_r0_delayr70_enaAnd_q = u0_m0_wo0_wi0_r0_delayr70_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr70_rdcnt(COUNTER,501)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr70_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr70_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr70_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr70_rdcnt_q = u0_m0_wo0_wi0_r0_delayr70_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr70_rdmux(MUX,502)@12
    assign u0_m0_wo0_wi0_r0_delayr70_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr70_rdmux_s or u0_m0_wo0_wi0_r0_delayr70_wraddr_q or u0_m0_wo0_wi0_r0_delayr70_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr70_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr70_rdmux_q = u0_m0_wo0_wi0_r0_delayr70_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr70_rdmux_q = u0_m0_wo0_wi0_r0_delayr70_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr70_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join70(BITJOIN,82)@12
    assign u0_m0_wo0_wi0_r0_join70_q = {u0_m0_wo0_wi0_r0_split70_d, u0_m0_wo0_wi0_r0_split70_c, u0_m0_wo0_wi0_r0_split70_b, u0_m0_wo0_wi0_r0_split66_e};

    // u0_m0_wo0_wi0_r0_delayr70_wraddr(REG,503)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr70_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr70_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr70_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr70_mem(DUALMEM,500)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr70_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join70_q);
    assign u0_m0_wo0_wi0_r0_delayr70_mem_aa = u0_m0_wo0_wi0_r0_delayr70_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr70_mem_ab = u0_m0_wo0_wi0_r0_delayr70_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr70_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr70_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr70_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr70_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr70_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr70_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr70_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr70_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr70_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr70_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr70_mem_q = u0_m0_wo0_wi0_r0_delayr70_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split70(BITSELECT,83)@12
    assign u0_m0_wo0_wi0_r0_split70_b = $unsigned(u0_m0_wo0_wi0_r0_delayr70_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split70_c = $unsigned(u0_m0_wo0_wi0_r0_delayr70_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split70_d = $unsigned(u0_m0_wo0_wi0_r0_delayr70_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split70_e = $unsigned(u0_m0_wo0_wi0_r0_delayr70_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr9(DELAY,137)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr9_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr9_q <= u0_m0_wo0_bank_delayr8_q;
        end
    end

    // u0_m0_wo0_dec55(LOOKUP,361)@10 + 1
    assign u0_m0_wo0_dec55_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec55_q <= $unsigned(1'b0);
            u0_m0_wo0_dec55_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000110111 : begin
                                         u0_m0_wo0_dec55_q <= 1'b0;
                                         u0_m0_wo0_dec55_e <= u0_m0_wo0_dec55_c;
                                     end
                14'b00000001111000 : begin
                                         u0_m0_wo0_dec55_q <= 1'b1;
                                         u0_m0_wo0_dec55_e <= u0_m0_wo0_dec55_c;
                                     end
                default : begin
                              u0_m0_wo0_dec55_q <= 1'b0;
                              u0_m0_wo0_dec55_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm55(DUALMEM,363)@10 + 2
    assign u0_m0_wo0_cm55_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm55_aa = u0_m0_wo0_dec55_q;
    assign u0_m0_wo0_cm55_ab = u0_m0_wo0_bank_delayr9_q;
    assign u0_m0_wo0_cm55_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm55.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm55_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm55_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm55_aa),
        .data_a(u0_m0_wo0_cm55_ia),
        .wren_a(u0_m0_wo0_dec55_e[0]),
        .address_b(u0_m0_wo0_cm55_ab),
        .q_b(u0_m0_wo0_cm55_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm55_q = u0_m0_wo0_cm55_iq[15:0];

    // u0_m0_wo0_bank_delayr10(DELAY,138)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr10_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr10_q <= u0_m0_wo0_bank_delayr9_q;
        end
    end

    // u0_m0_wo0_dec54(LOOKUP,358)@10 + 1
    assign u0_m0_wo0_dec54_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec54_q <= $unsigned(1'b0);
            u0_m0_wo0_dec54_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000110110 : begin
                                         u0_m0_wo0_dec54_q <= 1'b0;
                                         u0_m0_wo0_dec54_e <= u0_m0_wo0_dec54_c;
                                     end
                14'b00000001110111 : begin
                                         u0_m0_wo0_dec54_q <= 1'b1;
                                         u0_m0_wo0_dec54_e <= u0_m0_wo0_dec54_c;
                                     end
                default : begin
                              u0_m0_wo0_dec54_q <= 1'b0;
                              u0_m0_wo0_dec54_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm54(DUALMEM,360)@10 + 2
    assign u0_m0_wo0_cm54_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm54_aa = u0_m0_wo0_dec54_q;
    assign u0_m0_wo0_cm54_ab = u0_m0_wo0_bank_delayr10_q;
    assign u0_m0_wo0_cm54_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm54.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm54_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm54_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm54_aa),
        .data_a(u0_m0_wo0_cm54_ia),
        .wren_a(u0_m0_wo0_dec54_e[0]),
        .address_b(u0_m0_wo0_cm54_ab),
        .q_b(u0_m0_wo0_cm54_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm54_q = u0_m0_wo0_cm54_iq[15:0];

    // u0_m0_wo0_bank_delayr11(DELAY,139)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr11_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr11_q <= u0_m0_wo0_bank_delayr10_q;
        end
    end

    // u0_m0_wo0_dec53(LOOKUP,355)@10 + 1
    assign u0_m0_wo0_dec53_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec53_q <= $unsigned(1'b0);
            u0_m0_wo0_dec53_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000110101 : begin
                                         u0_m0_wo0_dec53_q <= 1'b0;
                                         u0_m0_wo0_dec53_e <= u0_m0_wo0_dec53_c;
                                     end
                14'b00000001110110 : begin
                                         u0_m0_wo0_dec53_q <= 1'b1;
                                         u0_m0_wo0_dec53_e <= u0_m0_wo0_dec53_c;
                                     end
                default : begin
                              u0_m0_wo0_dec53_q <= 1'b0;
                              u0_m0_wo0_dec53_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm53(DUALMEM,357)@10 + 2
    assign u0_m0_wo0_cm53_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm53_aa = u0_m0_wo0_dec53_q;
    assign u0_m0_wo0_cm53_ab = u0_m0_wo0_bank_delayr11_q;
    assign u0_m0_wo0_cm53_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm53.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm53_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm53_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm53_aa),
        .data_a(u0_m0_wo0_cm53_ia),
        .wren_a(u0_m0_wo0_dec53_e[0]),
        .address_b(u0_m0_wo0_cm53_ab),
        .q_b(u0_m0_wo0_cm53_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm53_q = u0_m0_wo0_cm53_iq[15:0];

    // u0_m0_wo0_wi0_r0_join53(BITJOIN,69)@12
    assign u0_m0_wo0_wi0_r0_join53_q = {u0_m0_wo0_wi0_r0_split53_d, u0_m0_wo0_wi0_r0_split53_c, u0_m0_wo0_wi0_r0_split53_b, u0_m0_wo0_wi0_r0_split49_e};

    // u0_m0_wo0_wi0_r0_delayr53(DELAY,71)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr53_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr53_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr53_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr53_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join53_q);
            u0_m0_wo0_wi0_r0_delayr53_delay_1 <= u0_m0_wo0_wi0_r0_delayr53_delay_0;
            u0_m0_wo0_wi0_r0_delayr53_q <= u0_m0_wo0_wi0_r0_delayr53_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split53(BITSELECT,70)@12
    assign u0_m0_wo0_wi0_r0_split53_b = $unsigned(u0_m0_wo0_wi0_r0_delayr53_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split53_c = $unsigned(u0_m0_wo0_wi0_r0_delayr53_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split53_d = $unsigned(u0_m0_wo0_wi0_r0_delayr53_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split53_e = $unsigned(u0_m0_wo0_wi0_r0_delayr53_q[63:48]);

    // u0_m0_wo0_bank_delayr12(DELAY,140)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr12_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr12_q <= u0_m0_wo0_bank_delayr11_q;
        end
    end

    // u0_m0_wo0_dec52(LOOKUP,352)@10 + 1
    assign u0_m0_wo0_dec52_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec52_q <= $unsigned(1'b0);
            u0_m0_wo0_dec52_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000110100 : begin
                                         u0_m0_wo0_dec52_q <= 1'b0;
                                         u0_m0_wo0_dec52_e <= u0_m0_wo0_dec52_c;
                                     end
                14'b00000001110101 : begin
                                         u0_m0_wo0_dec52_q <= 1'b1;
                                         u0_m0_wo0_dec52_e <= u0_m0_wo0_dec52_c;
                                     end
                default : begin
                              u0_m0_wo0_dec52_q <= 1'b0;
                              u0_m0_wo0_dec52_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm52(DUALMEM,354)@10 + 2
    assign u0_m0_wo0_cm52_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm52_aa = u0_m0_wo0_dec52_q;
    assign u0_m0_wo0_cm52_ab = u0_m0_wo0_bank_delayr12_q;
    assign u0_m0_wo0_cm52_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm52.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm52_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm52_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm52_aa),
        .data_a(u0_m0_wo0_cm52_ia),
        .wren_a(u0_m0_wo0_dec52_e[0]),
        .address_b(u0_m0_wo0_cm52_ab),
        .q_b(u0_m0_wo0_cm52_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm52_q = u0_m0_wo0_cm52_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr74_notEnable(LOGICAL,518)@12
    assign u0_m0_wo0_wi0_r0_delayr74_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr74_nor(LOGICAL,519)@12
    assign u0_m0_wo0_wi0_r0_delayr74_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr74_notEnable_q | u0_m0_wo0_wi0_r0_delayr74_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr74_mem_last(CONSTANT,515)
    assign u0_m0_wo0_wi0_r0_delayr74_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr74_cmp(LOGICAL,516)@12
    assign u0_m0_wo0_wi0_r0_delayr74_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr74_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr74_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr74_mem_last_q == u0_m0_wo0_wi0_r0_delayr74_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr74_cmpReg(REG,517)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr74_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr74_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr74_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr74_sticky_ena(REG,520)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr74_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr74_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr74_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr74_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr74_enaAnd(LOGICAL,521)@12
    assign u0_m0_wo0_wi0_r0_delayr74_enaAnd_q = u0_m0_wo0_wi0_r0_delayr74_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr74_rdcnt(COUNTER,512)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr74_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr74_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr74_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr74_rdcnt_q = u0_m0_wo0_wi0_r0_delayr74_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr74_rdmux(MUX,513)@12
    assign u0_m0_wo0_wi0_r0_delayr74_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr74_rdmux_s or u0_m0_wo0_wi0_r0_delayr74_wraddr_q or u0_m0_wo0_wi0_r0_delayr74_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr74_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr74_rdmux_q = u0_m0_wo0_wi0_r0_delayr74_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr74_rdmux_q = u0_m0_wo0_wi0_r0_delayr74_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr74_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join74(BITJOIN,85)@12
    assign u0_m0_wo0_wi0_r0_join74_q = {u0_m0_wo0_wi0_r0_split74_d, u0_m0_wo0_wi0_r0_split74_c, u0_m0_wo0_wi0_r0_split74_b, u0_m0_wo0_wi0_r0_split70_e};

    // u0_m0_wo0_wi0_r0_delayr74_wraddr(REG,514)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr74_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr74_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr74_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr74_mem(DUALMEM,511)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr74_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join74_q);
    assign u0_m0_wo0_wi0_r0_delayr74_mem_aa = u0_m0_wo0_wi0_r0_delayr74_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr74_mem_ab = u0_m0_wo0_wi0_r0_delayr74_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr74_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr74_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr74_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr74_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr74_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr74_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr74_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr74_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr74_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr74_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr74_mem_q = u0_m0_wo0_wi0_r0_delayr74_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split74(BITSELECT,86)@12
    assign u0_m0_wo0_wi0_r0_split74_b = $unsigned(u0_m0_wo0_wi0_r0_delayr74_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split74_c = $unsigned(u0_m0_wo0_wi0_r0_delayr74_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split74_d = $unsigned(u0_m0_wo0_wi0_r0_delayr74_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split74_e = $unsigned(u0_m0_wo0_wi0_r0_delayr74_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr13(DELAY,141)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr13_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr13_q <= u0_m0_wo0_bank_delayr12_q;
        end
    end

    // u0_m0_wo0_dec51(LOOKUP,349)@10 + 1
    assign u0_m0_wo0_dec51_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec51_q <= $unsigned(1'b0);
            u0_m0_wo0_dec51_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000110011 : begin
                                         u0_m0_wo0_dec51_q <= 1'b0;
                                         u0_m0_wo0_dec51_e <= u0_m0_wo0_dec51_c;
                                     end
                14'b00000001110100 : begin
                                         u0_m0_wo0_dec51_q <= 1'b1;
                                         u0_m0_wo0_dec51_e <= u0_m0_wo0_dec51_c;
                                     end
                default : begin
                              u0_m0_wo0_dec51_q <= 1'b0;
                              u0_m0_wo0_dec51_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm51(DUALMEM,351)@10 + 2
    assign u0_m0_wo0_cm51_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm51_aa = u0_m0_wo0_dec51_q;
    assign u0_m0_wo0_cm51_ab = u0_m0_wo0_bank_delayr13_q;
    assign u0_m0_wo0_cm51_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm51.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm51_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm51_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm51_aa),
        .data_a(u0_m0_wo0_cm51_ia),
        .wren_a(u0_m0_wo0_dec51_e[0]),
        .address_b(u0_m0_wo0_cm51_ab),
        .q_b(u0_m0_wo0_cm51_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm51_q = u0_m0_wo0_cm51_iq[15:0];

    // u0_m0_wo0_bank_delayr14(DELAY,142)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr14_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr14_q <= u0_m0_wo0_bank_delayr13_q;
        end
    end

    // u0_m0_wo0_dec50(LOOKUP,346)@10 + 1
    assign u0_m0_wo0_dec50_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec50_q <= $unsigned(1'b0);
            u0_m0_wo0_dec50_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000110010 : begin
                                         u0_m0_wo0_dec50_q <= 1'b0;
                                         u0_m0_wo0_dec50_e <= u0_m0_wo0_dec50_c;
                                     end
                14'b00000001110011 : begin
                                         u0_m0_wo0_dec50_q <= 1'b1;
                                         u0_m0_wo0_dec50_e <= u0_m0_wo0_dec50_c;
                                     end
                default : begin
                              u0_m0_wo0_dec50_q <= 1'b0;
                              u0_m0_wo0_dec50_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm50(DUALMEM,348)@10 + 2
    assign u0_m0_wo0_cm50_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm50_aa = u0_m0_wo0_dec50_q;
    assign u0_m0_wo0_cm50_ab = u0_m0_wo0_bank_delayr14_q;
    assign u0_m0_wo0_cm50_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm50.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm50_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm50_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm50_aa),
        .data_a(u0_m0_wo0_cm50_ia),
        .wren_a(u0_m0_wo0_dec50_e[0]),
        .address_b(u0_m0_wo0_cm50_ab),
        .q_b(u0_m0_wo0_cm50_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm50_q = u0_m0_wo0_cm50_iq[15:0];

    // u0_m0_wo0_bank_delayr15(DELAY,143)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr15_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr15_q <= u0_m0_wo0_bank_delayr14_q;
        end
    end

    // u0_m0_wo0_dec49(LOOKUP,343)@10 + 1
    assign u0_m0_wo0_dec49_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec49_q <= $unsigned(1'b0);
            u0_m0_wo0_dec49_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000110001 : begin
                                         u0_m0_wo0_dec49_q <= 1'b0;
                                         u0_m0_wo0_dec49_e <= u0_m0_wo0_dec49_c;
                                     end
                14'b00000001110010 : begin
                                         u0_m0_wo0_dec49_q <= 1'b1;
                                         u0_m0_wo0_dec49_e <= u0_m0_wo0_dec49_c;
                                     end
                default : begin
                              u0_m0_wo0_dec49_q <= 1'b0;
                              u0_m0_wo0_dec49_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm49(DUALMEM,345)@10 + 2
    assign u0_m0_wo0_cm49_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm49_aa = u0_m0_wo0_dec49_q;
    assign u0_m0_wo0_cm49_ab = u0_m0_wo0_bank_delayr15_q;
    assign u0_m0_wo0_cm49_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm49.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm49_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm49_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm49_aa),
        .data_a(u0_m0_wo0_cm49_ia),
        .wren_a(u0_m0_wo0_dec49_e[0]),
        .address_b(u0_m0_wo0_cm49_ab),
        .q_b(u0_m0_wo0_cm49_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm49_q = u0_m0_wo0_cm49_iq[15:0];

    // u0_m0_wo0_wi0_r0_join49(BITJOIN,66)@12
    assign u0_m0_wo0_wi0_r0_join49_q = {u0_m0_wo0_wi0_r0_split49_d, u0_m0_wo0_wi0_r0_split49_c, u0_m0_wo0_wi0_r0_split49_b, u0_m0_wo0_wi0_r0_split45_e};

    // u0_m0_wo0_wi0_r0_delayr49(DELAY,68)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr49_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr49_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr49_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr49_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join49_q);
            u0_m0_wo0_wi0_r0_delayr49_delay_1 <= u0_m0_wo0_wi0_r0_delayr49_delay_0;
            u0_m0_wo0_wi0_r0_delayr49_q <= u0_m0_wo0_wi0_r0_delayr49_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split49(BITSELECT,67)@12
    assign u0_m0_wo0_wi0_r0_split49_b = $unsigned(u0_m0_wo0_wi0_r0_delayr49_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split49_c = $unsigned(u0_m0_wo0_wi0_r0_delayr49_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split49_d = $unsigned(u0_m0_wo0_wi0_r0_delayr49_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split49_e = $unsigned(u0_m0_wo0_wi0_r0_delayr49_q[63:48]);

    // u0_m0_wo0_bank_delayr16(DELAY,144)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr16_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr16_q <= u0_m0_wo0_bank_delayr15_q;
        end
    end

    // u0_m0_wo0_dec48(LOOKUP,340)@10 + 1
    assign u0_m0_wo0_dec48_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec48_q <= $unsigned(1'b0);
            u0_m0_wo0_dec48_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000110000 : begin
                                         u0_m0_wo0_dec48_q <= 1'b0;
                                         u0_m0_wo0_dec48_e <= u0_m0_wo0_dec48_c;
                                     end
                14'b00000001110001 : begin
                                         u0_m0_wo0_dec48_q <= 1'b1;
                                         u0_m0_wo0_dec48_e <= u0_m0_wo0_dec48_c;
                                     end
                default : begin
                              u0_m0_wo0_dec48_q <= 1'b0;
                              u0_m0_wo0_dec48_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm48(DUALMEM,342)@10 + 2
    assign u0_m0_wo0_cm48_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm48_aa = u0_m0_wo0_dec48_q;
    assign u0_m0_wo0_cm48_ab = u0_m0_wo0_bank_delayr16_q;
    assign u0_m0_wo0_cm48_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm48.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm48_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm48_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm48_aa),
        .data_a(u0_m0_wo0_cm48_ia),
        .wren_a(u0_m0_wo0_dec48_e[0]),
        .address_b(u0_m0_wo0_cm48_ab),
        .q_b(u0_m0_wo0_cm48_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm48_q = u0_m0_wo0_cm48_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr78_notEnable(LOGICAL,529)@12
    assign u0_m0_wo0_wi0_r0_delayr78_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr78_nor(LOGICAL,530)@12
    assign u0_m0_wo0_wi0_r0_delayr78_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr78_notEnable_q | u0_m0_wo0_wi0_r0_delayr78_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr78_mem_last(CONSTANT,526)
    assign u0_m0_wo0_wi0_r0_delayr78_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr78_cmp(LOGICAL,527)@12
    assign u0_m0_wo0_wi0_r0_delayr78_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr78_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr78_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr78_mem_last_q == u0_m0_wo0_wi0_r0_delayr78_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr78_cmpReg(REG,528)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr78_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr78_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr78_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr78_sticky_ena(REG,531)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr78_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr78_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr78_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr78_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr78_enaAnd(LOGICAL,532)@12
    assign u0_m0_wo0_wi0_r0_delayr78_enaAnd_q = u0_m0_wo0_wi0_r0_delayr78_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr78_rdcnt(COUNTER,523)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr78_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr78_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr78_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr78_rdcnt_q = u0_m0_wo0_wi0_r0_delayr78_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr78_rdmux(MUX,524)@12
    assign u0_m0_wo0_wi0_r0_delayr78_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr78_rdmux_s or u0_m0_wo0_wi0_r0_delayr78_wraddr_q or u0_m0_wo0_wi0_r0_delayr78_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr78_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr78_rdmux_q = u0_m0_wo0_wi0_r0_delayr78_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr78_rdmux_q = u0_m0_wo0_wi0_r0_delayr78_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr78_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join78(BITJOIN,88)@12
    assign u0_m0_wo0_wi0_r0_join78_q = {u0_m0_wo0_wi0_r0_split78_d, u0_m0_wo0_wi0_r0_split78_c, u0_m0_wo0_wi0_r0_split78_b, u0_m0_wo0_wi0_r0_split74_e};

    // u0_m0_wo0_wi0_r0_delayr78_wraddr(REG,525)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr78_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr78_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr78_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr78_mem(DUALMEM,522)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr78_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join78_q);
    assign u0_m0_wo0_wi0_r0_delayr78_mem_aa = u0_m0_wo0_wi0_r0_delayr78_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr78_mem_ab = u0_m0_wo0_wi0_r0_delayr78_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr78_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr78_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr78_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr78_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr78_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr78_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr78_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr78_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr78_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr78_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr78_mem_q = u0_m0_wo0_wi0_r0_delayr78_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split78(BITSELECT,89)@12
    assign u0_m0_wo0_wi0_r0_split78_b = $unsigned(u0_m0_wo0_wi0_r0_delayr78_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split78_c = $unsigned(u0_m0_wo0_wi0_r0_delayr78_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split78_d = $unsigned(u0_m0_wo0_wi0_r0_delayr78_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split78_e = $unsigned(u0_m0_wo0_wi0_r0_delayr78_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr17(DELAY,145)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr17_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr17_q <= u0_m0_wo0_bank_delayr16_q;
        end
    end

    // u0_m0_wo0_dec47(LOOKUP,337)@10 + 1
    assign u0_m0_wo0_dec47_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec47_q <= $unsigned(1'b0);
            u0_m0_wo0_dec47_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000101111 : begin
                                         u0_m0_wo0_dec47_q <= 1'b0;
                                         u0_m0_wo0_dec47_e <= u0_m0_wo0_dec47_c;
                                     end
                14'b00000001110000 : begin
                                         u0_m0_wo0_dec47_q <= 1'b1;
                                         u0_m0_wo0_dec47_e <= u0_m0_wo0_dec47_c;
                                     end
                default : begin
                              u0_m0_wo0_dec47_q <= 1'b0;
                              u0_m0_wo0_dec47_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm47(DUALMEM,339)@10 + 2
    assign u0_m0_wo0_cm47_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm47_aa = u0_m0_wo0_dec47_q;
    assign u0_m0_wo0_cm47_ab = u0_m0_wo0_bank_delayr17_q;
    assign u0_m0_wo0_cm47_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm47.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm47_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm47_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm47_aa),
        .data_a(u0_m0_wo0_cm47_ia),
        .wren_a(u0_m0_wo0_dec47_e[0]),
        .address_b(u0_m0_wo0_cm47_ab),
        .q_b(u0_m0_wo0_cm47_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm47_q = u0_m0_wo0_cm47_iq[15:0];

    // u0_m0_wo0_bank_delayr18(DELAY,146)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr18_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr18_q <= u0_m0_wo0_bank_delayr17_q;
        end
    end

    // u0_m0_wo0_dec46(LOOKUP,334)@10 + 1
    assign u0_m0_wo0_dec46_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec46_q <= $unsigned(1'b0);
            u0_m0_wo0_dec46_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000101110 : begin
                                         u0_m0_wo0_dec46_q <= 1'b0;
                                         u0_m0_wo0_dec46_e <= u0_m0_wo0_dec46_c;
                                     end
                14'b00000001101111 : begin
                                         u0_m0_wo0_dec46_q <= 1'b1;
                                         u0_m0_wo0_dec46_e <= u0_m0_wo0_dec46_c;
                                     end
                default : begin
                              u0_m0_wo0_dec46_q <= 1'b0;
                              u0_m0_wo0_dec46_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm46(DUALMEM,336)@10 + 2
    assign u0_m0_wo0_cm46_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm46_aa = u0_m0_wo0_dec46_q;
    assign u0_m0_wo0_cm46_ab = u0_m0_wo0_bank_delayr18_q;
    assign u0_m0_wo0_cm46_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm46.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm46_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm46_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm46_aa),
        .data_a(u0_m0_wo0_cm46_ia),
        .wren_a(u0_m0_wo0_dec46_e[0]),
        .address_b(u0_m0_wo0_cm46_ab),
        .q_b(u0_m0_wo0_cm46_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm46_q = u0_m0_wo0_cm46_iq[15:0];

    // u0_m0_wo0_bank_delayr19(DELAY,147)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr19_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr19_q <= u0_m0_wo0_bank_delayr18_q;
        end
    end

    // u0_m0_wo0_dec45(LOOKUP,331)@10 + 1
    assign u0_m0_wo0_dec45_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec45_q <= $unsigned(1'b0);
            u0_m0_wo0_dec45_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000101101 : begin
                                         u0_m0_wo0_dec45_q <= 1'b0;
                                         u0_m0_wo0_dec45_e <= u0_m0_wo0_dec45_c;
                                     end
                14'b00000001101110 : begin
                                         u0_m0_wo0_dec45_q <= 1'b1;
                                         u0_m0_wo0_dec45_e <= u0_m0_wo0_dec45_c;
                                     end
                default : begin
                              u0_m0_wo0_dec45_q <= 1'b0;
                              u0_m0_wo0_dec45_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm45(DUALMEM,333)@10 + 2
    assign u0_m0_wo0_cm45_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm45_aa = u0_m0_wo0_dec45_q;
    assign u0_m0_wo0_cm45_ab = u0_m0_wo0_bank_delayr19_q;
    assign u0_m0_wo0_cm45_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm45.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm45_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm45_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm45_aa),
        .data_a(u0_m0_wo0_cm45_ia),
        .wren_a(u0_m0_wo0_dec45_e[0]),
        .address_b(u0_m0_wo0_cm45_ab),
        .q_b(u0_m0_wo0_cm45_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm45_q = u0_m0_wo0_cm45_iq[15:0];

    // u0_m0_wo0_wi0_r0_join45(BITJOIN,63)@12
    assign u0_m0_wo0_wi0_r0_join45_q = {u0_m0_wo0_wi0_r0_split45_d, u0_m0_wo0_wi0_r0_split45_c, u0_m0_wo0_wi0_r0_split45_b, u0_m0_wo0_wi0_r0_split41_e};

    // u0_m0_wo0_wi0_r0_delayr45(DELAY,65)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr45_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr45_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr45_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr45_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join45_q);
            u0_m0_wo0_wi0_r0_delayr45_delay_1 <= u0_m0_wo0_wi0_r0_delayr45_delay_0;
            u0_m0_wo0_wi0_r0_delayr45_q <= u0_m0_wo0_wi0_r0_delayr45_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split45(BITSELECT,64)@12
    assign u0_m0_wo0_wi0_r0_split45_b = $unsigned(u0_m0_wo0_wi0_r0_delayr45_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split45_c = $unsigned(u0_m0_wo0_wi0_r0_delayr45_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split45_d = $unsigned(u0_m0_wo0_wi0_r0_delayr45_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split45_e = $unsigned(u0_m0_wo0_wi0_r0_delayr45_q[63:48]);

    // u0_m0_wo0_bank_delayr20(DELAY,148)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr20_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr20_q <= u0_m0_wo0_bank_delayr19_q;
        end
    end

    // u0_m0_wo0_dec44(LOOKUP,328)@10 + 1
    assign u0_m0_wo0_dec44_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec44_q <= $unsigned(1'b0);
            u0_m0_wo0_dec44_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000101100 : begin
                                         u0_m0_wo0_dec44_q <= 1'b0;
                                         u0_m0_wo0_dec44_e <= u0_m0_wo0_dec44_c;
                                     end
                14'b00000001101101 : begin
                                         u0_m0_wo0_dec44_q <= 1'b1;
                                         u0_m0_wo0_dec44_e <= u0_m0_wo0_dec44_c;
                                     end
                default : begin
                              u0_m0_wo0_dec44_q <= 1'b0;
                              u0_m0_wo0_dec44_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm44(DUALMEM,330)@10 + 2
    assign u0_m0_wo0_cm44_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm44_aa = u0_m0_wo0_dec44_q;
    assign u0_m0_wo0_cm44_ab = u0_m0_wo0_bank_delayr20_q;
    assign u0_m0_wo0_cm44_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm44.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm44_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm44_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm44_aa),
        .data_a(u0_m0_wo0_cm44_ia),
        .wren_a(u0_m0_wo0_dec44_e[0]),
        .address_b(u0_m0_wo0_cm44_ab),
        .q_b(u0_m0_wo0_cm44_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm44_q = u0_m0_wo0_cm44_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr82_notEnable(LOGICAL,540)@12
    assign u0_m0_wo0_wi0_r0_delayr82_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr82_nor(LOGICAL,541)@12
    assign u0_m0_wo0_wi0_r0_delayr82_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr82_notEnable_q | u0_m0_wo0_wi0_r0_delayr82_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr82_mem_last(CONSTANT,537)
    assign u0_m0_wo0_wi0_r0_delayr82_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr82_cmp(LOGICAL,538)@12
    assign u0_m0_wo0_wi0_r0_delayr82_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr82_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr82_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr82_mem_last_q == u0_m0_wo0_wi0_r0_delayr82_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr82_cmpReg(REG,539)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr82_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr82_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr82_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr82_sticky_ena(REG,542)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr82_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr82_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr82_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr82_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr82_enaAnd(LOGICAL,543)@12
    assign u0_m0_wo0_wi0_r0_delayr82_enaAnd_q = u0_m0_wo0_wi0_r0_delayr82_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr82_rdcnt(COUNTER,534)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr82_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr82_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr82_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr82_rdcnt_q = u0_m0_wo0_wi0_r0_delayr82_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr82_rdmux(MUX,535)@12
    assign u0_m0_wo0_wi0_r0_delayr82_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr82_rdmux_s or u0_m0_wo0_wi0_r0_delayr82_wraddr_q or u0_m0_wo0_wi0_r0_delayr82_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr82_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr82_rdmux_q = u0_m0_wo0_wi0_r0_delayr82_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr82_rdmux_q = u0_m0_wo0_wi0_r0_delayr82_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr82_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join82(BITJOIN,91)@12
    assign u0_m0_wo0_wi0_r0_join82_q = {u0_m0_wo0_wi0_r0_split82_d, u0_m0_wo0_wi0_r0_split82_c, u0_m0_wo0_wi0_r0_split82_b, u0_m0_wo0_wi0_r0_split78_e};

    // u0_m0_wo0_wi0_r0_delayr82_wraddr(REG,536)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr82_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr82_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr82_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr82_mem(DUALMEM,533)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr82_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join82_q);
    assign u0_m0_wo0_wi0_r0_delayr82_mem_aa = u0_m0_wo0_wi0_r0_delayr82_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr82_mem_ab = u0_m0_wo0_wi0_r0_delayr82_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr82_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr82_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr82_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr82_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr82_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr82_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr82_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr82_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr82_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr82_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr82_mem_q = u0_m0_wo0_wi0_r0_delayr82_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split82(BITSELECT,92)@12
    assign u0_m0_wo0_wi0_r0_split82_b = $unsigned(u0_m0_wo0_wi0_r0_delayr82_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split82_c = $unsigned(u0_m0_wo0_wi0_r0_delayr82_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split82_d = $unsigned(u0_m0_wo0_wi0_r0_delayr82_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split82_e = $unsigned(u0_m0_wo0_wi0_r0_delayr82_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr21(DELAY,149)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr21_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr21_q <= u0_m0_wo0_bank_delayr20_q;
        end
    end

    // u0_m0_wo0_dec43(LOOKUP,325)@10 + 1
    assign u0_m0_wo0_dec43_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec43_q <= $unsigned(1'b0);
            u0_m0_wo0_dec43_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000101011 : begin
                                         u0_m0_wo0_dec43_q <= 1'b0;
                                         u0_m0_wo0_dec43_e <= u0_m0_wo0_dec43_c;
                                     end
                14'b00000001101100 : begin
                                         u0_m0_wo0_dec43_q <= 1'b1;
                                         u0_m0_wo0_dec43_e <= u0_m0_wo0_dec43_c;
                                     end
                default : begin
                              u0_m0_wo0_dec43_q <= 1'b0;
                              u0_m0_wo0_dec43_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm43(DUALMEM,327)@10 + 2
    assign u0_m0_wo0_cm43_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm43_aa = u0_m0_wo0_dec43_q;
    assign u0_m0_wo0_cm43_ab = u0_m0_wo0_bank_delayr21_q;
    assign u0_m0_wo0_cm43_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm43.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm43_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm43_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm43_aa),
        .data_a(u0_m0_wo0_cm43_ia),
        .wren_a(u0_m0_wo0_dec43_e[0]),
        .address_b(u0_m0_wo0_cm43_ab),
        .q_b(u0_m0_wo0_cm43_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm43_q = u0_m0_wo0_cm43_iq[15:0];

    // u0_m0_wo0_bank_delayr22(DELAY,150)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr22_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr22_q <= u0_m0_wo0_bank_delayr21_q;
        end
    end

    // u0_m0_wo0_dec42(LOOKUP,322)@10 + 1
    assign u0_m0_wo0_dec42_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec42_q <= $unsigned(1'b0);
            u0_m0_wo0_dec42_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000101010 : begin
                                         u0_m0_wo0_dec42_q <= 1'b0;
                                         u0_m0_wo0_dec42_e <= u0_m0_wo0_dec42_c;
                                     end
                14'b00000001101011 : begin
                                         u0_m0_wo0_dec42_q <= 1'b1;
                                         u0_m0_wo0_dec42_e <= u0_m0_wo0_dec42_c;
                                     end
                default : begin
                              u0_m0_wo0_dec42_q <= 1'b0;
                              u0_m0_wo0_dec42_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm42(DUALMEM,324)@10 + 2
    assign u0_m0_wo0_cm42_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm42_aa = u0_m0_wo0_dec42_q;
    assign u0_m0_wo0_cm42_ab = u0_m0_wo0_bank_delayr22_q;
    assign u0_m0_wo0_cm42_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm42.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm42_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm42_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm42_aa),
        .data_a(u0_m0_wo0_cm42_ia),
        .wren_a(u0_m0_wo0_dec42_e[0]),
        .address_b(u0_m0_wo0_cm42_ab),
        .q_b(u0_m0_wo0_cm42_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm42_q = u0_m0_wo0_cm42_iq[15:0];

    // u0_m0_wo0_bank_delayr23(DELAY,151)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr23_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr23_q <= u0_m0_wo0_bank_delayr22_q;
        end
    end

    // u0_m0_wo0_dec41(LOOKUP,319)@10 + 1
    assign u0_m0_wo0_dec41_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec41_q <= $unsigned(1'b0);
            u0_m0_wo0_dec41_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000101001 : begin
                                         u0_m0_wo0_dec41_q <= 1'b0;
                                         u0_m0_wo0_dec41_e <= u0_m0_wo0_dec41_c;
                                     end
                14'b00000001101010 : begin
                                         u0_m0_wo0_dec41_q <= 1'b1;
                                         u0_m0_wo0_dec41_e <= u0_m0_wo0_dec41_c;
                                     end
                default : begin
                              u0_m0_wo0_dec41_q <= 1'b0;
                              u0_m0_wo0_dec41_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm41(DUALMEM,321)@10 + 2
    assign u0_m0_wo0_cm41_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm41_aa = u0_m0_wo0_dec41_q;
    assign u0_m0_wo0_cm41_ab = u0_m0_wo0_bank_delayr23_q;
    assign u0_m0_wo0_cm41_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm41.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm41_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm41_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm41_aa),
        .data_a(u0_m0_wo0_cm41_ia),
        .wren_a(u0_m0_wo0_dec41_e[0]),
        .address_b(u0_m0_wo0_cm41_ab),
        .q_b(u0_m0_wo0_cm41_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm41_q = u0_m0_wo0_cm41_iq[15:0];

    // u0_m0_wo0_wi0_r0_join41(BITJOIN,60)@12
    assign u0_m0_wo0_wi0_r0_join41_q = {u0_m0_wo0_wi0_r0_split41_d, u0_m0_wo0_wi0_r0_split41_c, u0_m0_wo0_wi0_r0_split41_b, u0_m0_wo0_wi0_r0_split37_e};

    // u0_m0_wo0_wi0_r0_delayr41(DELAY,62)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr41_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr41_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr41_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr41_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join41_q);
            u0_m0_wo0_wi0_r0_delayr41_delay_1 <= u0_m0_wo0_wi0_r0_delayr41_delay_0;
            u0_m0_wo0_wi0_r0_delayr41_q <= u0_m0_wo0_wi0_r0_delayr41_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split41(BITSELECT,61)@12
    assign u0_m0_wo0_wi0_r0_split41_b = $unsigned(u0_m0_wo0_wi0_r0_delayr41_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split41_c = $unsigned(u0_m0_wo0_wi0_r0_delayr41_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split41_d = $unsigned(u0_m0_wo0_wi0_r0_delayr41_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split41_e = $unsigned(u0_m0_wo0_wi0_r0_delayr41_q[63:48]);

    // u0_m0_wo0_bank_delayr24(DELAY,152)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr24_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr24_q <= u0_m0_wo0_bank_delayr23_q;
        end
    end

    // u0_m0_wo0_dec40(LOOKUP,316)@10 + 1
    assign u0_m0_wo0_dec40_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec40_q <= $unsigned(1'b0);
            u0_m0_wo0_dec40_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000101000 : begin
                                         u0_m0_wo0_dec40_q <= 1'b0;
                                         u0_m0_wo0_dec40_e <= u0_m0_wo0_dec40_c;
                                     end
                14'b00000001101001 : begin
                                         u0_m0_wo0_dec40_q <= 1'b1;
                                         u0_m0_wo0_dec40_e <= u0_m0_wo0_dec40_c;
                                     end
                default : begin
                              u0_m0_wo0_dec40_q <= 1'b0;
                              u0_m0_wo0_dec40_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm40(DUALMEM,318)@10 + 2
    assign u0_m0_wo0_cm40_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm40_aa = u0_m0_wo0_dec40_q;
    assign u0_m0_wo0_cm40_ab = u0_m0_wo0_bank_delayr24_q;
    assign u0_m0_wo0_cm40_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm40.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm40_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm40_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm40_aa),
        .data_a(u0_m0_wo0_cm40_ia),
        .wren_a(u0_m0_wo0_dec40_e[0]),
        .address_b(u0_m0_wo0_cm40_ab),
        .q_b(u0_m0_wo0_cm40_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm40_q = u0_m0_wo0_cm40_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr86_notEnable(LOGICAL,551)@12
    assign u0_m0_wo0_wi0_r0_delayr86_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr86_nor(LOGICAL,552)@12
    assign u0_m0_wo0_wi0_r0_delayr86_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr86_notEnable_q | u0_m0_wo0_wi0_r0_delayr86_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr86_mem_last(CONSTANT,548)
    assign u0_m0_wo0_wi0_r0_delayr86_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr86_cmp(LOGICAL,549)@12
    assign u0_m0_wo0_wi0_r0_delayr86_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr86_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr86_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr86_mem_last_q == u0_m0_wo0_wi0_r0_delayr86_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr86_cmpReg(REG,550)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr86_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr86_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr86_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr86_sticky_ena(REG,553)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr86_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr86_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr86_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr86_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr86_enaAnd(LOGICAL,554)@12
    assign u0_m0_wo0_wi0_r0_delayr86_enaAnd_q = u0_m0_wo0_wi0_r0_delayr86_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr86_rdcnt(COUNTER,545)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr86_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr86_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr86_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr86_rdcnt_q = u0_m0_wo0_wi0_r0_delayr86_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr86_rdmux(MUX,546)@12
    assign u0_m0_wo0_wi0_r0_delayr86_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr86_rdmux_s or u0_m0_wo0_wi0_r0_delayr86_wraddr_q or u0_m0_wo0_wi0_r0_delayr86_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr86_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr86_rdmux_q = u0_m0_wo0_wi0_r0_delayr86_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr86_rdmux_q = u0_m0_wo0_wi0_r0_delayr86_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr86_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join86(BITJOIN,94)@12
    assign u0_m0_wo0_wi0_r0_join86_q = {u0_m0_wo0_wi0_r0_split86_d, u0_m0_wo0_wi0_r0_split86_c, u0_m0_wo0_wi0_r0_split86_b, u0_m0_wo0_wi0_r0_split82_e};

    // u0_m0_wo0_wi0_r0_delayr86_wraddr(REG,547)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr86_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr86_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr86_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr86_mem(DUALMEM,544)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr86_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join86_q);
    assign u0_m0_wo0_wi0_r0_delayr86_mem_aa = u0_m0_wo0_wi0_r0_delayr86_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr86_mem_ab = u0_m0_wo0_wi0_r0_delayr86_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr86_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr86_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr86_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr86_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr86_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr86_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr86_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr86_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr86_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr86_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr86_mem_q = u0_m0_wo0_wi0_r0_delayr86_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split86(BITSELECT,95)@12
    assign u0_m0_wo0_wi0_r0_split86_b = $unsigned(u0_m0_wo0_wi0_r0_delayr86_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split86_c = $unsigned(u0_m0_wo0_wi0_r0_delayr86_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split86_d = $unsigned(u0_m0_wo0_wi0_r0_delayr86_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split86_e = $unsigned(u0_m0_wo0_wi0_r0_delayr86_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr25(DELAY,153)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr25_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr25_q <= u0_m0_wo0_bank_delayr24_q;
        end
    end

    // u0_m0_wo0_dec39(LOOKUP,313)@10 + 1
    assign u0_m0_wo0_dec39_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec39_q <= $unsigned(1'b0);
            u0_m0_wo0_dec39_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000100111 : begin
                                         u0_m0_wo0_dec39_q <= 1'b0;
                                         u0_m0_wo0_dec39_e <= u0_m0_wo0_dec39_c;
                                     end
                14'b00000001101000 : begin
                                         u0_m0_wo0_dec39_q <= 1'b1;
                                         u0_m0_wo0_dec39_e <= u0_m0_wo0_dec39_c;
                                     end
                default : begin
                              u0_m0_wo0_dec39_q <= 1'b0;
                              u0_m0_wo0_dec39_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm39(DUALMEM,315)@10 + 2
    assign u0_m0_wo0_cm39_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm39_aa = u0_m0_wo0_dec39_q;
    assign u0_m0_wo0_cm39_ab = u0_m0_wo0_bank_delayr25_q;
    assign u0_m0_wo0_cm39_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm39.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm39_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm39_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm39_aa),
        .data_a(u0_m0_wo0_cm39_ia),
        .wren_a(u0_m0_wo0_dec39_e[0]),
        .address_b(u0_m0_wo0_cm39_ab),
        .q_b(u0_m0_wo0_cm39_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm39_q = u0_m0_wo0_cm39_iq[15:0];

    // u0_m0_wo0_bank_delayr26(DELAY,154)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr26_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr26_q <= u0_m0_wo0_bank_delayr25_q;
        end
    end

    // u0_m0_wo0_dec38(LOOKUP,310)@10 + 1
    assign u0_m0_wo0_dec38_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec38_q <= $unsigned(1'b0);
            u0_m0_wo0_dec38_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000100110 : begin
                                         u0_m0_wo0_dec38_q <= 1'b0;
                                         u0_m0_wo0_dec38_e <= u0_m0_wo0_dec38_c;
                                     end
                14'b00000001100111 : begin
                                         u0_m0_wo0_dec38_q <= 1'b1;
                                         u0_m0_wo0_dec38_e <= u0_m0_wo0_dec38_c;
                                     end
                default : begin
                              u0_m0_wo0_dec38_q <= 1'b0;
                              u0_m0_wo0_dec38_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm38(DUALMEM,312)@10 + 2
    assign u0_m0_wo0_cm38_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm38_aa = u0_m0_wo0_dec38_q;
    assign u0_m0_wo0_cm38_ab = u0_m0_wo0_bank_delayr26_q;
    assign u0_m0_wo0_cm38_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm38.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm38_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm38_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm38_aa),
        .data_a(u0_m0_wo0_cm38_ia),
        .wren_a(u0_m0_wo0_dec38_e[0]),
        .address_b(u0_m0_wo0_cm38_ab),
        .q_b(u0_m0_wo0_cm38_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm38_q = u0_m0_wo0_cm38_iq[15:0];

    // u0_m0_wo0_bank_delayr27(DELAY,155)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr27_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr27_q <= u0_m0_wo0_bank_delayr26_q;
        end
    end

    // u0_m0_wo0_dec37(LOOKUP,307)@10 + 1
    assign u0_m0_wo0_dec37_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec37_q <= $unsigned(1'b0);
            u0_m0_wo0_dec37_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000100101 : begin
                                         u0_m0_wo0_dec37_q <= 1'b0;
                                         u0_m0_wo0_dec37_e <= u0_m0_wo0_dec37_c;
                                     end
                14'b00000001100110 : begin
                                         u0_m0_wo0_dec37_q <= 1'b1;
                                         u0_m0_wo0_dec37_e <= u0_m0_wo0_dec37_c;
                                     end
                default : begin
                              u0_m0_wo0_dec37_q <= 1'b0;
                              u0_m0_wo0_dec37_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm37(DUALMEM,309)@10 + 2
    assign u0_m0_wo0_cm37_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm37_aa = u0_m0_wo0_dec37_q;
    assign u0_m0_wo0_cm37_ab = u0_m0_wo0_bank_delayr27_q;
    assign u0_m0_wo0_cm37_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm37.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm37_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm37_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm37_aa),
        .data_a(u0_m0_wo0_cm37_ia),
        .wren_a(u0_m0_wo0_dec37_e[0]),
        .address_b(u0_m0_wo0_cm37_ab),
        .q_b(u0_m0_wo0_cm37_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm37_q = u0_m0_wo0_cm37_iq[15:0];

    // u0_m0_wo0_wi0_r0_join37(BITJOIN,57)@12
    assign u0_m0_wo0_wi0_r0_join37_q = {u0_m0_wo0_wi0_r0_split37_d, u0_m0_wo0_wi0_r0_split37_c, u0_m0_wo0_wi0_r0_split37_b, u0_m0_wo0_wi0_r0_split33_e};

    // u0_m0_wo0_wi0_r0_delayr37(DELAY,59)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr37_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr37_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr37_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr37_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join37_q);
            u0_m0_wo0_wi0_r0_delayr37_delay_1 <= u0_m0_wo0_wi0_r0_delayr37_delay_0;
            u0_m0_wo0_wi0_r0_delayr37_q <= u0_m0_wo0_wi0_r0_delayr37_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split37(BITSELECT,58)@12
    assign u0_m0_wo0_wi0_r0_split37_b = $unsigned(u0_m0_wo0_wi0_r0_delayr37_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split37_c = $unsigned(u0_m0_wo0_wi0_r0_delayr37_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split37_d = $unsigned(u0_m0_wo0_wi0_r0_delayr37_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split37_e = $unsigned(u0_m0_wo0_wi0_r0_delayr37_q[63:48]);

    // u0_m0_wo0_bank_delayr28(DELAY,156)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr28_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr28_q <= u0_m0_wo0_bank_delayr27_q;
        end
    end

    // u0_m0_wo0_dec36(LOOKUP,304)@10 + 1
    assign u0_m0_wo0_dec36_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec36_q <= $unsigned(1'b0);
            u0_m0_wo0_dec36_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000100100 : begin
                                         u0_m0_wo0_dec36_q <= 1'b0;
                                         u0_m0_wo0_dec36_e <= u0_m0_wo0_dec36_c;
                                     end
                14'b00000001100101 : begin
                                         u0_m0_wo0_dec36_q <= 1'b1;
                                         u0_m0_wo0_dec36_e <= u0_m0_wo0_dec36_c;
                                     end
                default : begin
                              u0_m0_wo0_dec36_q <= 1'b0;
                              u0_m0_wo0_dec36_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm36(DUALMEM,306)@10 + 2
    assign u0_m0_wo0_cm36_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm36_aa = u0_m0_wo0_dec36_q;
    assign u0_m0_wo0_cm36_ab = u0_m0_wo0_bank_delayr28_q;
    assign u0_m0_wo0_cm36_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm36.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm36_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm36_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm36_aa),
        .data_a(u0_m0_wo0_cm36_ia),
        .wren_a(u0_m0_wo0_dec36_e[0]),
        .address_b(u0_m0_wo0_cm36_ab),
        .q_b(u0_m0_wo0_cm36_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm36_q = u0_m0_wo0_cm36_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr90_notEnable(LOGICAL,562)@12
    assign u0_m0_wo0_wi0_r0_delayr90_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr90_nor(LOGICAL,563)@12
    assign u0_m0_wo0_wi0_r0_delayr90_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr90_notEnable_q | u0_m0_wo0_wi0_r0_delayr90_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr90_mem_last(CONSTANT,559)
    assign u0_m0_wo0_wi0_r0_delayr90_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr90_cmp(LOGICAL,560)@12
    assign u0_m0_wo0_wi0_r0_delayr90_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr90_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr90_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr90_mem_last_q == u0_m0_wo0_wi0_r0_delayr90_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr90_cmpReg(REG,561)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr90_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr90_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr90_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr90_sticky_ena(REG,564)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr90_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr90_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr90_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr90_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr90_enaAnd(LOGICAL,565)@12
    assign u0_m0_wo0_wi0_r0_delayr90_enaAnd_q = u0_m0_wo0_wi0_r0_delayr90_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr90_rdcnt(COUNTER,556)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr90_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr90_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr90_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr90_rdcnt_q = u0_m0_wo0_wi0_r0_delayr90_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr90_rdmux(MUX,557)@12
    assign u0_m0_wo0_wi0_r0_delayr90_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr90_rdmux_s or u0_m0_wo0_wi0_r0_delayr90_wraddr_q or u0_m0_wo0_wi0_r0_delayr90_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr90_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr90_rdmux_q = u0_m0_wo0_wi0_r0_delayr90_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr90_rdmux_q = u0_m0_wo0_wi0_r0_delayr90_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr90_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join90(BITJOIN,97)@12
    assign u0_m0_wo0_wi0_r0_join90_q = {u0_m0_wo0_wi0_r0_split90_d, u0_m0_wo0_wi0_r0_split90_c, u0_m0_wo0_wi0_r0_split90_b, u0_m0_wo0_wi0_r0_split86_e};

    // u0_m0_wo0_wi0_r0_delayr90_wraddr(REG,558)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr90_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr90_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr90_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr90_mem(DUALMEM,555)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr90_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join90_q);
    assign u0_m0_wo0_wi0_r0_delayr90_mem_aa = u0_m0_wo0_wi0_r0_delayr90_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr90_mem_ab = u0_m0_wo0_wi0_r0_delayr90_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr90_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr90_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr90_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr90_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr90_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr90_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr90_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr90_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr90_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr90_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr90_mem_q = u0_m0_wo0_wi0_r0_delayr90_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split90(BITSELECT,98)@12
    assign u0_m0_wo0_wi0_r0_split90_b = $unsigned(u0_m0_wo0_wi0_r0_delayr90_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split90_c = $unsigned(u0_m0_wo0_wi0_r0_delayr90_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split90_d = $unsigned(u0_m0_wo0_wi0_r0_delayr90_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split90_e = $unsigned(u0_m0_wo0_wi0_r0_delayr90_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr29(DELAY,157)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr29_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr29_q <= u0_m0_wo0_bank_delayr28_q;
        end
    end

    // u0_m0_wo0_dec35(LOOKUP,301)@10 + 1
    assign u0_m0_wo0_dec35_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec35_q <= $unsigned(1'b0);
            u0_m0_wo0_dec35_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000100011 : begin
                                         u0_m0_wo0_dec35_q <= 1'b0;
                                         u0_m0_wo0_dec35_e <= u0_m0_wo0_dec35_c;
                                     end
                14'b00000001100100 : begin
                                         u0_m0_wo0_dec35_q <= 1'b1;
                                         u0_m0_wo0_dec35_e <= u0_m0_wo0_dec35_c;
                                     end
                default : begin
                              u0_m0_wo0_dec35_q <= 1'b0;
                              u0_m0_wo0_dec35_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm35(DUALMEM,303)@10 + 2
    assign u0_m0_wo0_cm35_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm35_aa = u0_m0_wo0_dec35_q;
    assign u0_m0_wo0_cm35_ab = u0_m0_wo0_bank_delayr29_q;
    assign u0_m0_wo0_cm35_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm35.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm35_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm35_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm35_aa),
        .data_a(u0_m0_wo0_cm35_ia),
        .wren_a(u0_m0_wo0_dec35_e[0]),
        .address_b(u0_m0_wo0_cm35_ab),
        .q_b(u0_m0_wo0_cm35_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm35_q = u0_m0_wo0_cm35_iq[15:0];

    // u0_m0_wo0_bank_delayr30(DELAY,158)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr30_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr30_q <= u0_m0_wo0_bank_delayr29_q;
        end
    end

    // u0_m0_wo0_dec34(LOOKUP,298)@10 + 1
    assign u0_m0_wo0_dec34_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec34_q <= $unsigned(1'b0);
            u0_m0_wo0_dec34_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000100010 : begin
                                         u0_m0_wo0_dec34_q <= 1'b0;
                                         u0_m0_wo0_dec34_e <= u0_m0_wo0_dec34_c;
                                     end
                14'b00000001100011 : begin
                                         u0_m0_wo0_dec34_q <= 1'b1;
                                         u0_m0_wo0_dec34_e <= u0_m0_wo0_dec34_c;
                                     end
                default : begin
                              u0_m0_wo0_dec34_q <= 1'b0;
                              u0_m0_wo0_dec34_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm34(DUALMEM,300)@10 + 2
    assign u0_m0_wo0_cm34_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm34_aa = u0_m0_wo0_dec34_q;
    assign u0_m0_wo0_cm34_ab = u0_m0_wo0_bank_delayr30_q;
    assign u0_m0_wo0_cm34_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm34.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm34_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm34_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm34_aa),
        .data_a(u0_m0_wo0_cm34_ia),
        .wren_a(u0_m0_wo0_dec34_e[0]),
        .address_b(u0_m0_wo0_cm34_ab),
        .q_b(u0_m0_wo0_cm34_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm34_q = u0_m0_wo0_cm34_iq[15:0];

    // u0_m0_wo0_bank_delayr31(DELAY,159)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr31_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr31_q <= u0_m0_wo0_bank_delayr30_q;
        end
    end

    // u0_m0_wo0_dec33(LOOKUP,295)@10 + 1
    assign u0_m0_wo0_dec33_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec33_q <= $unsigned(1'b0);
            u0_m0_wo0_dec33_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000100001 : begin
                                         u0_m0_wo0_dec33_q <= 1'b0;
                                         u0_m0_wo0_dec33_e <= u0_m0_wo0_dec33_c;
                                     end
                14'b00000001100010 : begin
                                         u0_m0_wo0_dec33_q <= 1'b1;
                                         u0_m0_wo0_dec33_e <= u0_m0_wo0_dec33_c;
                                     end
                default : begin
                              u0_m0_wo0_dec33_q <= 1'b0;
                              u0_m0_wo0_dec33_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm33(DUALMEM,297)@10 + 2
    assign u0_m0_wo0_cm33_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm33_aa = u0_m0_wo0_dec33_q;
    assign u0_m0_wo0_cm33_ab = u0_m0_wo0_bank_delayr31_q;
    assign u0_m0_wo0_cm33_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm33.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm33_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm33_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm33_aa),
        .data_a(u0_m0_wo0_cm33_ia),
        .wren_a(u0_m0_wo0_dec33_e[0]),
        .address_b(u0_m0_wo0_cm33_ab),
        .q_b(u0_m0_wo0_cm33_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm33_q = u0_m0_wo0_cm33_iq[15:0];

    // u0_m0_wo0_wi0_r0_join33(BITJOIN,54)@12
    assign u0_m0_wo0_wi0_r0_join33_q = {u0_m0_wo0_wi0_r0_split33_d, u0_m0_wo0_wi0_r0_split33_c, u0_m0_wo0_wi0_r0_split33_b, u0_m0_wo0_wi0_r0_split29_e};

    // u0_m0_wo0_wi0_r0_delayr33(DELAY,56)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr33_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr33_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr33_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr33_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join33_q);
            u0_m0_wo0_wi0_r0_delayr33_delay_1 <= u0_m0_wo0_wi0_r0_delayr33_delay_0;
            u0_m0_wo0_wi0_r0_delayr33_q <= u0_m0_wo0_wi0_r0_delayr33_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split33(BITSELECT,55)@12
    assign u0_m0_wo0_wi0_r0_split33_b = $unsigned(u0_m0_wo0_wi0_r0_delayr33_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split33_c = $unsigned(u0_m0_wo0_wi0_r0_delayr33_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split33_d = $unsigned(u0_m0_wo0_wi0_r0_delayr33_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split33_e = $unsigned(u0_m0_wo0_wi0_r0_delayr33_q[63:48]);

    // u0_m0_wo0_bank_delayr32(DELAY,160)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr32_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr32_q <= u0_m0_wo0_bank_delayr31_q;
        end
    end

    // u0_m0_wo0_dec32(LOOKUP,292)@10 + 1
    assign u0_m0_wo0_dec32_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec32_q <= $unsigned(1'b0);
            u0_m0_wo0_dec32_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000100000 : begin
                                         u0_m0_wo0_dec32_q <= 1'b0;
                                         u0_m0_wo0_dec32_e <= u0_m0_wo0_dec32_c;
                                     end
                14'b00000001100001 : begin
                                         u0_m0_wo0_dec32_q <= 1'b1;
                                         u0_m0_wo0_dec32_e <= u0_m0_wo0_dec32_c;
                                     end
                default : begin
                              u0_m0_wo0_dec32_q <= 1'b0;
                              u0_m0_wo0_dec32_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm32(DUALMEM,294)@10 + 2
    assign u0_m0_wo0_cm32_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm32_aa = u0_m0_wo0_dec32_q;
    assign u0_m0_wo0_cm32_ab = u0_m0_wo0_bank_delayr32_q;
    assign u0_m0_wo0_cm32_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm32.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm32_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm32_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm32_aa),
        .data_a(u0_m0_wo0_cm32_ia),
        .wren_a(u0_m0_wo0_dec32_e[0]),
        .address_b(u0_m0_wo0_cm32_ab),
        .q_b(u0_m0_wo0_cm32_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm32_q = u0_m0_wo0_cm32_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr94_notEnable(LOGICAL,573)@12
    assign u0_m0_wo0_wi0_r0_delayr94_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr94_nor(LOGICAL,574)@12
    assign u0_m0_wo0_wi0_r0_delayr94_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr94_notEnable_q | u0_m0_wo0_wi0_r0_delayr94_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr94_mem_last(CONSTANT,570)
    assign u0_m0_wo0_wi0_r0_delayr94_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr94_cmp(LOGICAL,571)@12
    assign u0_m0_wo0_wi0_r0_delayr94_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr94_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr94_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr94_mem_last_q == u0_m0_wo0_wi0_r0_delayr94_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr94_cmpReg(REG,572)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr94_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr94_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr94_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr94_sticky_ena(REG,575)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr94_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr94_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr94_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr94_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr94_enaAnd(LOGICAL,576)@12
    assign u0_m0_wo0_wi0_r0_delayr94_enaAnd_q = u0_m0_wo0_wi0_r0_delayr94_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr94_rdcnt(COUNTER,567)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr94_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr94_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr94_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr94_rdcnt_q = u0_m0_wo0_wi0_r0_delayr94_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr94_rdmux(MUX,568)@12
    assign u0_m0_wo0_wi0_r0_delayr94_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr94_rdmux_s or u0_m0_wo0_wi0_r0_delayr94_wraddr_q or u0_m0_wo0_wi0_r0_delayr94_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr94_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr94_rdmux_q = u0_m0_wo0_wi0_r0_delayr94_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr94_rdmux_q = u0_m0_wo0_wi0_r0_delayr94_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr94_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join94(BITJOIN,100)@12
    assign u0_m0_wo0_wi0_r0_join94_q = {u0_m0_wo0_wi0_r0_split94_d, u0_m0_wo0_wi0_r0_split94_c, u0_m0_wo0_wi0_r0_split94_b, u0_m0_wo0_wi0_r0_split90_e};

    // u0_m0_wo0_wi0_r0_delayr94_wraddr(REG,569)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr94_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr94_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr94_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr94_mem(DUALMEM,566)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr94_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join94_q);
    assign u0_m0_wo0_wi0_r0_delayr94_mem_aa = u0_m0_wo0_wi0_r0_delayr94_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr94_mem_ab = u0_m0_wo0_wi0_r0_delayr94_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr94_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr94_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr94_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr94_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr94_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr94_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr94_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr94_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr94_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr94_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr94_mem_q = u0_m0_wo0_wi0_r0_delayr94_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split94(BITSELECT,101)@12
    assign u0_m0_wo0_wi0_r0_split94_b = $unsigned(u0_m0_wo0_wi0_r0_delayr94_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split94_c = $unsigned(u0_m0_wo0_wi0_r0_delayr94_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split94_d = $unsigned(u0_m0_wo0_wi0_r0_delayr94_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split94_e = $unsigned(u0_m0_wo0_wi0_r0_delayr94_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr33(DELAY,161)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr33_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr33_q <= u0_m0_wo0_bank_delayr32_q;
        end
    end

    // u0_m0_wo0_dec31(LOOKUP,289)@10 + 1
    assign u0_m0_wo0_dec31_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec31_q <= $unsigned(1'b0);
            u0_m0_wo0_dec31_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000011111 : begin
                                         u0_m0_wo0_dec31_q <= 1'b0;
                                         u0_m0_wo0_dec31_e <= u0_m0_wo0_dec31_c;
                                     end
                14'b00000001100000 : begin
                                         u0_m0_wo0_dec31_q <= 1'b1;
                                         u0_m0_wo0_dec31_e <= u0_m0_wo0_dec31_c;
                                     end
                default : begin
                              u0_m0_wo0_dec31_q <= 1'b0;
                              u0_m0_wo0_dec31_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm31(DUALMEM,291)@10 + 2
    assign u0_m0_wo0_cm31_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm31_aa = u0_m0_wo0_dec31_q;
    assign u0_m0_wo0_cm31_ab = u0_m0_wo0_bank_delayr33_q;
    assign u0_m0_wo0_cm31_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm31.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm31_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm31_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm31_aa),
        .data_a(u0_m0_wo0_cm31_ia),
        .wren_a(u0_m0_wo0_dec31_e[0]),
        .address_b(u0_m0_wo0_cm31_ab),
        .q_b(u0_m0_wo0_cm31_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm31_q = u0_m0_wo0_cm31_iq[15:0];

    // u0_m0_wo0_bank_delayr34(DELAY,162)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr34_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr34_q <= u0_m0_wo0_bank_delayr33_q;
        end
    end

    // u0_m0_wo0_dec30(LOOKUP,286)@10 + 1
    assign u0_m0_wo0_dec30_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec30_q <= $unsigned(1'b0);
            u0_m0_wo0_dec30_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000011110 : begin
                                         u0_m0_wo0_dec30_q <= 1'b0;
                                         u0_m0_wo0_dec30_e <= u0_m0_wo0_dec30_c;
                                     end
                14'b00000001011111 : begin
                                         u0_m0_wo0_dec30_q <= 1'b1;
                                         u0_m0_wo0_dec30_e <= u0_m0_wo0_dec30_c;
                                     end
                default : begin
                              u0_m0_wo0_dec30_q <= 1'b0;
                              u0_m0_wo0_dec30_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm30(DUALMEM,288)@10 + 2
    assign u0_m0_wo0_cm30_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm30_aa = u0_m0_wo0_dec30_q;
    assign u0_m0_wo0_cm30_ab = u0_m0_wo0_bank_delayr34_q;
    assign u0_m0_wo0_cm30_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm30.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm30_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm30_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm30_aa),
        .data_a(u0_m0_wo0_cm30_ia),
        .wren_a(u0_m0_wo0_dec30_e[0]),
        .address_b(u0_m0_wo0_cm30_ab),
        .q_b(u0_m0_wo0_cm30_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm30_q = u0_m0_wo0_cm30_iq[15:0];

    // u0_m0_wo0_bank_delayr35(DELAY,163)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr35_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr35_q <= u0_m0_wo0_bank_delayr34_q;
        end
    end

    // u0_m0_wo0_dec29(LOOKUP,283)@10 + 1
    assign u0_m0_wo0_dec29_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec29_q <= $unsigned(1'b0);
            u0_m0_wo0_dec29_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000011101 : begin
                                         u0_m0_wo0_dec29_q <= 1'b0;
                                         u0_m0_wo0_dec29_e <= u0_m0_wo0_dec29_c;
                                     end
                14'b00000001011110 : begin
                                         u0_m0_wo0_dec29_q <= 1'b1;
                                         u0_m0_wo0_dec29_e <= u0_m0_wo0_dec29_c;
                                     end
                default : begin
                              u0_m0_wo0_dec29_q <= 1'b0;
                              u0_m0_wo0_dec29_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm29(DUALMEM,285)@10 + 2
    assign u0_m0_wo0_cm29_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm29_aa = u0_m0_wo0_dec29_q;
    assign u0_m0_wo0_cm29_ab = u0_m0_wo0_bank_delayr35_q;
    assign u0_m0_wo0_cm29_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm29.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm29_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm29_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm29_aa),
        .data_a(u0_m0_wo0_cm29_ia),
        .wren_a(u0_m0_wo0_dec29_e[0]),
        .address_b(u0_m0_wo0_cm29_ab),
        .q_b(u0_m0_wo0_cm29_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm29_q = u0_m0_wo0_cm29_iq[15:0];

    // u0_m0_wo0_wi0_r0_join29(BITJOIN,51)@12
    assign u0_m0_wo0_wi0_r0_join29_q = {u0_m0_wo0_wi0_r0_split29_d, u0_m0_wo0_wi0_r0_split29_c, u0_m0_wo0_wi0_r0_split29_b, u0_m0_wo0_wi0_r0_split25_e};

    // u0_m0_wo0_wi0_r0_delayr29(DELAY,53)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr29_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr29_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr29_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr29_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join29_q);
            u0_m0_wo0_wi0_r0_delayr29_delay_1 <= u0_m0_wo0_wi0_r0_delayr29_delay_0;
            u0_m0_wo0_wi0_r0_delayr29_q <= u0_m0_wo0_wi0_r0_delayr29_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split29(BITSELECT,52)@12
    assign u0_m0_wo0_wi0_r0_split29_b = $unsigned(u0_m0_wo0_wi0_r0_delayr29_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split29_c = $unsigned(u0_m0_wo0_wi0_r0_delayr29_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split29_d = $unsigned(u0_m0_wo0_wi0_r0_delayr29_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split29_e = $unsigned(u0_m0_wo0_wi0_r0_delayr29_q[63:48]);

    // u0_m0_wo0_bank_delayr36(DELAY,164)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr36_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr36_q <= u0_m0_wo0_bank_delayr35_q;
        end
    end

    // u0_m0_wo0_dec28(LOOKUP,280)@10 + 1
    assign u0_m0_wo0_dec28_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec28_q <= $unsigned(1'b0);
            u0_m0_wo0_dec28_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000011100 : begin
                                         u0_m0_wo0_dec28_q <= 1'b0;
                                         u0_m0_wo0_dec28_e <= u0_m0_wo0_dec28_c;
                                     end
                14'b00000001011101 : begin
                                         u0_m0_wo0_dec28_q <= 1'b1;
                                         u0_m0_wo0_dec28_e <= u0_m0_wo0_dec28_c;
                                     end
                default : begin
                              u0_m0_wo0_dec28_q <= 1'b0;
                              u0_m0_wo0_dec28_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm28(DUALMEM,282)@10 + 2
    assign u0_m0_wo0_cm28_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm28_aa = u0_m0_wo0_dec28_q;
    assign u0_m0_wo0_cm28_ab = u0_m0_wo0_bank_delayr36_q;
    assign u0_m0_wo0_cm28_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm28.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm28_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm28_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm28_aa),
        .data_a(u0_m0_wo0_cm28_ia),
        .wren_a(u0_m0_wo0_dec28_e[0]),
        .address_b(u0_m0_wo0_cm28_ab),
        .q_b(u0_m0_wo0_cm28_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm28_q = u0_m0_wo0_cm28_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr98_notEnable(LOGICAL,584)@12
    assign u0_m0_wo0_wi0_r0_delayr98_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr98_nor(LOGICAL,585)@12
    assign u0_m0_wo0_wi0_r0_delayr98_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr98_notEnable_q | u0_m0_wo0_wi0_r0_delayr98_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr98_mem_last(CONSTANT,581)
    assign u0_m0_wo0_wi0_r0_delayr98_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr98_cmp(LOGICAL,582)@12
    assign u0_m0_wo0_wi0_r0_delayr98_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr98_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr98_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr98_mem_last_q == u0_m0_wo0_wi0_r0_delayr98_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr98_cmpReg(REG,583)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr98_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr98_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr98_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr98_sticky_ena(REG,586)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr98_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr98_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr98_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr98_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr98_enaAnd(LOGICAL,587)@12
    assign u0_m0_wo0_wi0_r0_delayr98_enaAnd_q = u0_m0_wo0_wi0_r0_delayr98_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr98_rdcnt(COUNTER,578)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr98_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr98_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr98_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr98_rdcnt_q = u0_m0_wo0_wi0_r0_delayr98_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr98_rdmux(MUX,579)@12
    assign u0_m0_wo0_wi0_r0_delayr98_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr98_rdmux_s or u0_m0_wo0_wi0_r0_delayr98_wraddr_q or u0_m0_wo0_wi0_r0_delayr98_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr98_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr98_rdmux_q = u0_m0_wo0_wi0_r0_delayr98_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr98_rdmux_q = u0_m0_wo0_wi0_r0_delayr98_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr98_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join98(BITJOIN,103)@12
    assign u0_m0_wo0_wi0_r0_join98_q = {u0_m0_wo0_wi0_r0_split98_d, u0_m0_wo0_wi0_r0_split98_c, u0_m0_wo0_wi0_r0_split98_b, u0_m0_wo0_wi0_r0_split94_e};

    // u0_m0_wo0_wi0_r0_delayr98_wraddr(REG,580)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr98_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr98_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr98_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr98_mem(DUALMEM,577)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr98_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join98_q);
    assign u0_m0_wo0_wi0_r0_delayr98_mem_aa = u0_m0_wo0_wi0_r0_delayr98_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr98_mem_ab = u0_m0_wo0_wi0_r0_delayr98_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr98_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr98_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr98_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr98_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr98_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr98_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr98_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr98_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr98_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr98_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr98_mem_q = u0_m0_wo0_wi0_r0_delayr98_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split98(BITSELECT,104)@12
    assign u0_m0_wo0_wi0_r0_split98_b = $unsigned(u0_m0_wo0_wi0_r0_delayr98_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split98_c = $unsigned(u0_m0_wo0_wi0_r0_delayr98_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split98_d = $unsigned(u0_m0_wo0_wi0_r0_delayr98_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split98_e = $unsigned(u0_m0_wo0_wi0_r0_delayr98_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr37(DELAY,165)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr37_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr37_q <= u0_m0_wo0_bank_delayr36_q;
        end
    end

    // u0_m0_wo0_dec27(LOOKUP,277)@10 + 1
    assign u0_m0_wo0_dec27_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec27_q <= $unsigned(1'b0);
            u0_m0_wo0_dec27_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000011011 : begin
                                         u0_m0_wo0_dec27_q <= 1'b0;
                                         u0_m0_wo0_dec27_e <= u0_m0_wo0_dec27_c;
                                     end
                14'b00000001011100 : begin
                                         u0_m0_wo0_dec27_q <= 1'b1;
                                         u0_m0_wo0_dec27_e <= u0_m0_wo0_dec27_c;
                                     end
                default : begin
                              u0_m0_wo0_dec27_q <= 1'b0;
                              u0_m0_wo0_dec27_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm27(DUALMEM,279)@10 + 2
    assign u0_m0_wo0_cm27_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm27_aa = u0_m0_wo0_dec27_q;
    assign u0_m0_wo0_cm27_ab = u0_m0_wo0_bank_delayr37_q;
    assign u0_m0_wo0_cm27_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm27.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm27_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm27_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm27_aa),
        .data_a(u0_m0_wo0_cm27_ia),
        .wren_a(u0_m0_wo0_dec27_e[0]),
        .address_b(u0_m0_wo0_cm27_ab),
        .q_b(u0_m0_wo0_cm27_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm27_q = u0_m0_wo0_cm27_iq[15:0];

    // u0_m0_wo0_bank_delayr38(DELAY,166)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr38_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr38_q <= u0_m0_wo0_bank_delayr37_q;
        end
    end

    // u0_m0_wo0_dec26(LOOKUP,274)@10 + 1
    assign u0_m0_wo0_dec26_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec26_q <= $unsigned(1'b0);
            u0_m0_wo0_dec26_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000011010 : begin
                                         u0_m0_wo0_dec26_q <= 1'b0;
                                         u0_m0_wo0_dec26_e <= u0_m0_wo0_dec26_c;
                                     end
                14'b00000001011011 : begin
                                         u0_m0_wo0_dec26_q <= 1'b1;
                                         u0_m0_wo0_dec26_e <= u0_m0_wo0_dec26_c;
                                     end
                default : begin
                              u0_m0_wo0_dec26_q <= 1'b0;
                              u0_m0_wo0_dec26_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm26(DUALMEM,276)@10 + 2
    assign u0_m0_wo0_cm26_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm26_aa = u0_m0_wo0_dec26_q;
    assign u0_m0_wo0_cm26_ab = u0_m0_wo0_bank_delayr38_q;
    assign u0_m0_wo0_cm26_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm26.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm26_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm26_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm26_aa),
        .data_a(u0_m0_wo0_cm26_ia),
        .wren_a(u0_m0_wo0_dec26_e[0]),
        .address_b(u0_m0_wo0_cm26_ab),
        .q_b(u0_m0_wo0_cm26_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm26_q = u0_m0_wo0_cm26_iq[15:0];

    // u0_m0_wo0_bank_delayr39(DELAY,167)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr39_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr39_q <= u0_m0_wo0_bank_delayr38_q;
        end
    end

    // u0_m0_wo0_dec25(LOOKUP,271)@10 + 1
    assign u0_m0_wo0_dec25_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec25_q <= $unsigned(1'b0);
            u0_m0_wo0_dec25_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000011001 : begin
                                         u0_m0_wo0_dec25_q <= 1'b0;
                                         u0_m0_wo0_dec25_e <= u0_m0_wo0_dec25_c;
                                     end
                14'b00000001011010 : begin
                                         u0_m0_wo0_dec25_q <= 1'b1;
                                         u0_m0_wo0_dec25_e <= u0_m0_wo0_dec25_c;
                                     end
                default : begin
                              u0_m0_wo0_dec25_q <= 1'b0;
                              u0_m0_wo0_dec25_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm25(DUALMEM,273)@10 + 2
    assign u0_m0_wo0_cm25_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm25_aa = u0_m0_wo0_dec25_q;
    assign u0_m0_wo0_cm25_ab = u0_m0_wo0_bank_delayr39_q;
    assign u0_m0_wo0_cm25_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm25.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm25_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm25_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm25_aa),
        .data_a(u0_m0_wo0_cm25_ia),
        .wren_a(u0_m0_wo0_dec25_e[0]),
        .address_b(u0_m0_wo0_cm25_ab),
        .q_b(u0_m0_wo0_cm25_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm25_q = u0_m0_wo0_cm25_iq[15:0];

    // u0_m0_wo0_wi0_r0_join25(BITJOIN,48)@12
    assign u0_m0_wo0_wi0_r0_join25_q = {u0_m0_wo0_wi0_r0_split25_d, u0_m0_wo0_wi0_r0_split25_c, u0_m0_wo0_wi0_r0_split25_b, u0_m0_wo0_wi0_r0_split21_e};

    // u0_m0_wo0_wi0_r0_delayr25(DELAY,50)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr25_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr25_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr25_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr25_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join25_q);
            u0_m0_wo0_wi0_r0_delayr25_delay_1 <= u0_m0_wo0_wi0_r0_delayr25_delay_0;
            u0_m0_wo0_wi0_r0_delayr25_q <= u0_m0_wo0_wi0_r0_delayr25_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split25(BITSELECT,49)@12
    assign u0_m0_wo0_wi0_r0_split25_b = $unsigned(u0_m0_wo0_wi0_r0_delayr25_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split25_c = $unsigned(u0_m0_wo0_wi0_r0_delayr25_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split25_d = $unsigned(u0_m0_wo0_wi0_r0_delayr25_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split25_e = $unsigned(u0_m0_wo0_wi0_r0_delayr25_q[63:48]);

    // u0_m0_wo0_bank_delayr40(DELAY,168)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr40_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr40_q <= u0_m0_wo0_bank_delayr39_q;
        end
    end

    // u0_m0_wo0_dec24(LOOKUP,268)@10 + 1
    assign u0_m0_wo0_dec24_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec24_q <= $unsigned(1'b0);
            u0_m0_wo0_dec24_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000011000 : begin
                                         u0_m0_wo0_dec24_q <= 1'b0;
                                         u0_m0_wo0_dec24_e <= u0_m0_wo0_dec24_c;
                                     end
                14'b00000001011001 : begin
                                         u0_m0_wo0_dec24_q <= 1'b1;
                                         u0_m0_wo0_dec24_e <= u0_m0_wo0_dec24_c;
                                     end
                default : begin
                              u0_m0_wo0_dec24_q <= 1'b0;
                              u0_m0_wo0_dec24_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm24(DUALMEM,270)@10 + 2
    assign u0_m0_wo0_cm24_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm24_aa = u0_m0_wo0_dec24_q;
    assign u0_m0_wo0_cm24_ab = u0_m0_wo0_bank_delayr40_q;
    assign u0_m0_wo0_cm24_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm24.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm24_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm24_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm24_aa),
        .data_a(u0_m0_wo0_cm24_ia),
        .wren_a(u0_m0_wo0_dec24_e[0]),
        .address_b(u0_m0_wo0_cm24_ab),
        .q_b(u0_m0_wo0_cm24_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm24_q = u0_m0_wo0_cm24_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr102_notEnable(LOGICAL,595)@12
    assign u0_m0_wo0_wi0_r0_delayr102_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr102_nor(LOGICAL,596)@12
    assign u0_m0_wo0_wi0_r0_delayr102_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr102_notEnable_q | u0_m0_wo0_wi0_r0_delayr102_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr102_mem_last(CONSTANT,592)
    assign u0_m0_wo0_wi0_r0_delayr102_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr102_cmp(LOGICAL,593)@12
    assign u0_m0_wo0_wi0_r0_delayr102_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr102_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr102_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr102_mem_last_q == u0_m0_wo0_wi0_r0_delayr102_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr102_cmpReg(REG,594)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr102_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr102_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr102_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr102_sticky_ena(REG,597)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr102_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr102_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr102_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr102_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr102_enaAnd(LOGICAL,598)@12
    assign u0_m0_wo0_wi0_r0_delayr102_enaAnd_q = u0_m0_wo0_wi0_r0_delayr102_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr102_rdcnt(COUNTER,589)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr102_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr102_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr102_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr102_rdcnt_q = u0_m0_wo0_wi0_r0_delayr102_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr102_rdmux(MUX,590)@12
    assign u0_m0_wo0_wi0_r0_delayr102_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr102_rdmux_s or u0_m0_wo0_wi0_r0_delayr102_wraddr_q or u0_m0_wo0_wi0_r0_delayr102_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr102_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr102_rdmux_q = u0_m0_wo0_wi0_r0_delayr102_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr102_rdmux_q = u0_m0_wo0_wi0_r0_delayr102_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr102_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join102(BITJOIN,106)@12
    assign u0_m0_wo0_wi0_r0_join102_q = {u0_m0_wo0_wi0_r0_split102_d, u0_m0_wo0_wi0_r0_split102_c, u0_m0_wo0_wi0_r0_split102_b, u0_m0_wo0_wi0_r0_split98_e};

    // u0_m0_wo0_wi0_r0_delayr102_wraddr(REG,591)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr102_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr102_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr102_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr102_mem(DUALMEM,588)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr102_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join102_q);
    assign u0_m0_wo0_wi0_r0_delayr102_mem_aa = u0_m0_wo0_wi0_r0_delayr102_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr102_mem_ab = u0_m0_wo0_wi0_r0_delayr102_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr102_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr102_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr102_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr102_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr102_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr102_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr102_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr102_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr102_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr102_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr102_mem_q = u0_m0_wo0_wi0_r0_delayr102_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split102(BITSELECT,107)@12
    assign u0_m0_wo0_wi0_r0_split102_b = $unsigned(u0_m0_wo0_wi0_r0_delayr102_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split102_c = $unsigned(u0_m0_wo0_wi0_r0_delayr102_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split102_d = $unsigned(u0_m0_wo0_wi0_r0_delayr102_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split102_e = $unsigned(u0_m0_wo0_wi0_r0_delayr102_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr41(DELAY,169)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr41_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr41_q <= u0_m0_wo0_bank_delayr40_q;
        end
    end

    // u0_m0_wo0_dec23(LOOKUP,265)@10 + 1
    assign u0_m0_wo0_dec23_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec23_q <= $unsigned(1'b0);
            u0_m0_wo0_dec23_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000010111 : begin
                                         u0_m0_wo0_dec23_q <= 1'b0;
                                         u0_m0_wo0_dec23_e <= u0_m0_wo0_dec23_c;
                                     end
                14'b00000001011000 : begin
                                         u0_m0_wo0_dec23_q <= 1'b1;
                                         u0_m0_wo0_dec23_e <= u0_m0_wo0_dec23_c;
                                     end
                default : begin
                              u0_m0_wo0_dec23_q <= 1'b0;
                              u0_m0_wo0_dec23_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm23(DUALMEM,267)@10 + 2
    assign u0_m0_wo0_cm23_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm23_aa = u0_m0_wo0_dec23_q;
    assign u0_m0_wo0_cm23_ab = u0_m0_wo0_bank_delayr41_q;
    assign u0_m0_wo0_cm23_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm23.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm23_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm23_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm23_aa),
        .data_a(u0_m0_wo0_cm23_ia),
        .wren_a(u0_m0_wo0_dec23_e[0]),
        .address_b(u0_m0_wo0_cm23_ab),
        .q_b(u0_m0_wo0_cm23_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm23_q = u0_m0_wo0_cm23_iq[15:0];

    // u0_m0_wo0_bank_delayr42(DELAY,170)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr42_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr42_q <= u0_m0_wo0_bank_delayr41_q;
        end
    end

    // u0_m0_wo0_dec22(LOOKUP,262)@10 + 1
    assign u0_m0_wo0_dec22_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec22_q <= $unsigned(1'b0);
            u0_m0_wo0_dec22_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000010110 : begin
                                         u0_m0_wo0_dec22_q <= 1'b0;
                                         u0_m0_wo0_dec22_e <= u0_m0_wo0_dec22_c;
                                     end
                14'b00000001010111 : begin
                                         u0_m0_wo0_dec22_q <= 1'b1;
                                         u0_m0_wo0_dec22_e <= u0_m0_wo0_dec22_c;
                                     end
                default : begin
                              u0_m0_wo0_dec22_q <= 1'b0;
                              u0_m0_wo0_dec22_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm22(DUALMEM,264)@10 + 2
    assign u0_m0_wo0_cm22_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm22_aa = u0_m0_wo0_dec22_q;
    assign u0_m0_wo0_cm22_ab = u0_m0_wo0_bank_delayr42_q;
    assign u0_m0_wo0_cm22_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm22.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm22_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm22_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm22_aa),
        .data_a(u0_m0_wo0_cm22_ia),
        .wren_a(u0_m0_wo0_dec22_e[0]),
        .address_b(u0_m0_wo0_cm22_ab),
        .q_b(u0_m0_wo0_cm22_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm22_q = u0_m0_wo0_cm22_iq[15:0];

    // u0_m0_wo0_bank_delayr43(DELAY,171)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr43_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr43_q <= u0_m0_wo0_bank_delayr42_q;
        end
    end

    // u0_m0_wo0_dec21(LOOKUP,259)@10 + 1
    assign u0_m0_wo0_dec21_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec21_q <= $unsigned(1'b0);
            u0_m0_wo0_dec21_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000010101 : begin
                                         u0_m0_wo0_dec21_q <= 1'b0;
                                         u0_m0_wo0_dec21_e <= u0_m0_wo0_dec21_c;
                                     end
                14'b00000001010110 : begin
                                         u0_m0_wo0_dec21_q <= 1'b1;
                                         u0_m0_wo0_dec21_e <= u0_m0_wo0_dec21_c;
                                     end
                default : begin
                              u0_m0_wo0_dec21_q <= 1'b0;
                              u0_m0_wo0_dec21_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm21(DUALMEM,261)@10 + 2
    assign u0_m0_wo0_cm21_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm21_aa = u0_m0_wo0_dec21_q;
    assign u0_m0_wo0_cm21_ab = u0_m0_wo0_bank_delayr43_q;
    assign u0_m0_wo0_cm21_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm21.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm21_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm21_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm21_aa),
        .data_a(u0_m0_wo0_cm21_ia),
        .wren_a(u0_m0_wo0_dec21_e[0]),
        .address_b(u0_m0_wo0_cm21_ab),
        .q_b(u0_m0_wo0_cm21_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm21_q = u0_m0_wo0_cm21_iq[15:0];

    // u0_m0_wo0_wi0_r0_join21(BITJOIN,45)@12
    assign u0_m0_wo0_wi0_r0_join21_q = {u0_m0_wo0_wi0_r0_split21_d, u0_m0_wo0_wi0_r0_split21_c, u0_m0_wo0_wi0_r0_split21_b, u0_m0_wo0_wi0_r0_split17_e};

    // u0_m0_wo0_wi0_r0_delayr21(DELAY,47)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr21_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr21_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr21_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr21_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join21_q);
            u0_m0_wo0_wi0_r0_delayr21_delay_1 <= u0_m0_wo0_wi0_r0_delayr21_delay_0;
            u0_m0_wo0_wi0_r0_delayr21_q <= u0_m0_wo0_wi0_r0_delayr21_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split21(BITSELECT,46)@12
    assign u0_m0_wo0_wi0_r0_split21_b = $unsigned(u0_m0_wo0_wi0_r0_delayr21_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split21_c = $unsigned(u0_m0_wo0_wi0_r0_delayr21_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split21_d = $unsigned(u0_m0_wo0_wi0_r0_delayr21_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split21_e = $unsigned(u0_m0_wo0_wi0_r0_delayr21_q[63:48]);

    // u0_m0_wo0_bank_delayr44(DELAY,172)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr44_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr44_q <= u0_m0_wo0_bank_delayr43_q;
        end
    end

    // u0_m0_wo0_dec20(LOOKUP,256)@10 + 1
    assign u0_m0_wo0_dec20_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec20_q <= $unsigned(1'b0);
            u0_m0_wo0_dec20_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000010100 : begin
                                         u0_m0_wo0_dec20_q <= 1'b0;
                                         u0_m0_wo0_dec20_e <= u0_m0_wo0_dec20_c;
                                     end
                14'b00000001010101 : begin
                                         u0_m0_wo0_dec20_q <= 1'b1;
                                         u0_m0_wo0_dec20_e <= u0_m0_wo0_dec20_c;
                                     end
                default : begin
                              u0_m0_wo0_dec20_q <= 1'b0;
                              u0_m0_wo0_dec20_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm20(DUALMEM,258)@10 + 2
    assign u0_m0_wo0_cm20_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm20_aa = u0_m0_wo0_dec20_q;
    assign u0_m0_wo0_cm20_ab = u0_m0_wo0_bank_delayr44_q;
    assign u0_m0_wo0_cm20_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm20.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm20_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm20_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm20_aa),
        .data_a(u0_m0_wo0_cm20_ia),
        .wren_a(u0_m0_wo0_dec20_e[0]),
        .address_b(u0_m0_wo0_cm20_ab),
        .q_b(u0_m0_wo0_cm20_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm20_q = u0_m0_wo0_cm20_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr106_notEnable(LOGICAL,606)@12
    assign u0_m0_wo0_wi0_r0_delayr106_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr106_nor(LOGICAL,607)@12
    assign u0_m0_wo0_wi0_r0_delayr106_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr106_notEnable_q | u0_m0_wo0_wi0_r0_delayr106_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr106_mem_last(CONSTANT,603)
    assign u0_m0_wo0_wi0_r0_delayr106_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr106_cmp(LOGICAL,604)@12
    assign u0_m0_wo0_wi0_r0_delayr106_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr106_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr106_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr106_mem_last_q == u0_m0_wo0_wi0_r0_delayr106_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr106_cmpReg(REG,605)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr106_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr106_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr106_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr106_sticky_ena(REG,608)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr106_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr106_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr106_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr106_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr106_enaAnd(LOGICAL,609)@12
    assign u0_m0_wo0_wi0_r0_delayr106_enaAnd_q = u0_m0_wo0_wi0_r0_delayr106_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr106_rdcnt(COUNTER,600)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr106_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr106_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr106_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr106_rdcnt_q = u0_m0_wo0_wi0_r0_delayr106_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr106_rdmux(MUX,601)@12
    assign u0_m0_wo0_wi0_r0_delayr106_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr106_rdmux_s or u0_m0_wo0_wi0_r0_delayr106_wraddr_q or u0_m0_wo0_wi0_r0_delayr106_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr106_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr106_rdmux_q = u0_m0_wo0_wi0_r0_delayr106_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr106_rdmux_q = u0_m0_wo0_wi0_r0_delayr106_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr106_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join106(BITJOIN,109)@12
    assign u0_m0_wo0_wi0_r0_join106_q = {u0_m0_wo0_wi0_r0_split106_d, u0_m0_wo0_wi0_r0_split106_c, u0_m0_wo0_wi0_r0_split106_b, u0_m0_wo0_wi0_r0_split102_e};

    // u0_m0_wo0_wi0_r0_delayr106_wraddr(REG,602)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr106_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr106_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr106_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr106_mem(DUALMEM,599)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr106_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join106_q);
    assign u0_m0_wo0_wi0_r0_delayr106_mem_aa = u0_m0_wo0_wi0_r0_delayr106_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr106_mem_ab = u0_m0_wo0_wi0_r0_delayr106_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr106_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr106_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr106_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr106_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr106_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr106_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr106_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr106_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr106_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr106_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr106_mem_q = u0_m0_wo0_wi0_r0_delayr106_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split106(BITSELECT,110)@12
    assign u0_m0_wo0_wi0_r0_split106_b = $unsigned(u0_m0_wo0_wi0_r0_delayr106_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split106_c = $unsigned(u0_m0_wo0_wi0_r0_delayr106_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split106_d = $unsigned(u0_m0_wo0_wi0_r0_delayr106_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split106_e = $unsigned(u0_m0_wo0_wi0_r0_delayr106_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr45(DELAY,173)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr45_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr45_q <= u0_m0_wo0_bank_delayr44_q;
        end
    end

    // u0_m0_wo0_dec19(LOOKUP,253)@10 + 1
    assign u0_m0_wo0_dec19_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec19_q <= $unsigned(1'b0);
            u0_m0_wo0_dec19_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000010011 : begin
                                         u0_m0_wo0_dec19_q <= 1'b0;
                                         u0_m0_wo0_dec19_e <= u0_m0_wo0_dec19_c;
                                     end
                14'b00000001010100 : begin
                                         u0_m0_wo0_dec19_q <= 1'b1;
                                         u0_m0_wo0_dec19_e <= u0_m0_wo0_dec19_c;
                                     end
                default : begin
                              u0_m0_wo0_dec19_q <= 1'b0;
                              u0_m0_wo0_dec19_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm19(DUALMEM,255)@10 + 2
    assign u0_m0_wo0_cm19_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm19_aa = u0_m0_wo0_dec19_q;
    assign u0_m0_wo0_cm19_ab = u0_m0_wo0_bank_delayr45_q;
    assign u0_m0_wo0_cm19_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm19.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm19_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm19_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm19_aa),
        .data_a(u0_m0_wo0_cm19_ia),
        .wren_a(u0_m0_wo0_dec19_e[0]),
        .address_b(u0_m0_wo0_cm19_ab),
        .q_b(u0_m0_wo0_cm19_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm19_q = u0_m0_wo0_cm19_iq[15:0];

    // u0_m0_wo0_bank_delayr46(DELAY,174)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr46_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr46_q <= u0_m0_wo0_bank_delayr45_q;
        end
    end

    // u0_m0_wo0_dec18(LOOKUP,250)@10 + 1
    assign u0_m0_wo0_dec18_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec18_q <= $unsigned(1'b0);
            u0_m0_wo0_dec18_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000010010 : begin
                                         u0_m0_wo0_dec18_q <= 1'b0;
                                         u0_m0_wo0_dec18_e <= u0_m0_wo0_dec18_c;
                                     end
                14'b00000001010011 : begin
                                         u0_m0_wo0_dec18_q <= 1'b1;
                                         u0_m0_wo0_dec18_e <= u0_m0_wo0_dec18_c;
                                     end
                default : begin
                              u0_m0_wo0_dec18_q <= 1'b0;
                              u0_m0_wo0_dec18_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm18(DUALMEM,252)@10 + 2
    assign u0_m0_wo0_cm18_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm18_aa = u0_m0_wo0_dec18_q;
    assign u0_m0_wo0_cm18_ab = u0_m0_wo0_bank_delayr46_q;
    assign u0_m0_wo0_cm18_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm18.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm18_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm18_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm18_aa),
        .data_a(u0_m0_wo0_cm18_ia),
        .wren_a(u0_m0_wo0_dec18_e[0]),
        .address_b(u0_m0_wo0_cm18_ab),
        .q_b(u0_m0_wo0_cm18_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm18_q = u0_m0_wo0_cm18_iq[15:0];

    // u0_m0_wo0_bank_delayr47(DELAY,175)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr47_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr47_q <= u0_m0_wo0_bank_delayr46_q;
        end
    end

    // u0_m0_wo0_dec17(LOOKUP,247)@10 + 1
    assign u0_m0_wo0_dec17_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec17_q <= $unsigned(1'b0);
            u0_m0_wo0_dec17_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000010001 : begin
                                         u0_m0_wo0_dec17_q <= 1'b0;
                                         u0_m0_wo0_dec17_e <= u0_m0_wo0_dec17_c;
                                     end
                14'b00000001010010 : begin
                                         u0_m0_wo0_dec17_q <= 1'b1;
                                         u0_m0_wo0_dec17_e <= u0_m0_wo0_dec17_c;
                                     end
                default : begin
                              u0_m0_wo0_dec17_q <= 1'b0;
                              u0_m0_wo0_dec17_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm17(DUALMEM,249)@10 + 2
    assign u0_m0_wo0_cm17_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm17_aa = u0_m0_wo0_dec17_q;
    assign u0_m0_wo0_cm17_ab = u0_m0_wo0_bank_delayr47_q;
    assign u0_m0_wo0_cm17_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm17.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm17_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm17_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm17_aa),
        .data_a(u0_m0_wo0_cm17_ia),
        .wren_a(u0_m0_wo0_dec17_e[0]),
        .address_b(u0_m0_wo0_cm17_ab),
        .q_b(u0_m0_wo0_cm17_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm17_q = u0_m0_wo0_cm17_iq[15:0];

    // u0_m0_wo0_wi0_r0_join17(BITJOIN,42)@12
    assign u0_m0_wo0_wi0_r0_join17_q = {u0_m0_wo0_wi0_r0_split17_d, u0_m0_wo0_wi0_r0_split17_c, u0_m0_wo0_wi0_r0_split17_b, u0_m0_wo0_wi0_r0_split13_e};

    // u0_m0_wo0_wi0_r0_delayr17(DELAY,44)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr17_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr17_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr17_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr17_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join17_q);
            u0_m0_wo0_wi0_r0_delayr17_delay_1 <= u0_m0_wo0_wi0_r0_delayr17_delay_0;
            u0_m0_wo0_wi0_r0_delayr17_q <= u0_m0_wo0_wi0_r0_delayr17_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split17(BITSELECT,43)@12
    assign u0_m0_wo0_wi0_r0_split17_b = $unsigned(u0_m0_wo0_wi0_r0_delayr17_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split17_c = $unsigned(u0_m0_wo0_wi0_r0_delayr17_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split17_d = $unsigned(u0_m0_wo0_wi0_r0_delayr17_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split17_e = $unsigned(u0_m0_wo0_wi0_r0_delayr17_q[63:48]);

    // u0_m0_wo0_bank_delayr48(DELAY,176)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr48_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr48_q <= u0_m0_wo0_bank_delayr47_q;
        end
    end

    // u0_m0_wo0_dec16(LOOKUP,244)@10 + 1
    assign u0_m0_wo0_dec16_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec16_q <= $unsigned(1'b0);
            u0_m0_wo0_dec16_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000010000 : begin
                                         u0_m0_wo0_dec16_q <= 1'b0;
                                         u0_m0_wo0_dec16_e <= u0_m0_wo0_dec16_c;
                                     end
                14'b00000001010001 : begin
                                         u0_m0_wo0_dec16_q <= 1'b1;
                                         u0_m0_wo0_dec16_e <= u0_m0_wo0_dec16_c;
                                     end
                default : begin
                              u0_m0_wo0_dec16_q <= 1'b0;
                              u0_m0_wo0_dec16_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm16(DUALMEM,246)@10 + 2
    assign u0_m0_wo0_cm16_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm16_aa = u0_m0_wo0_dec16_q;
    assign u0_m0_wo0_cm16_ab = u0_m0_wo0_bank_delayr48_q;
    assign u0_m0_wo0_cm16_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm16.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm16_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm16_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm16_aa),
        .data_a(u0_m0_wo0_cm16_ia),
        .wren_a(u0_m0_wo0_dec16_e[0]),
        .address_b(u0_m0_wo0_cm16_ab),
        .q_b(u0_m0_wo0_cm16_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm16_q = u0_m0_wo0_cm16_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr110_notEnable(LOGICAL,617)@12
    assign u0_m0_wo0_wi0_r0_delayr110_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr110_nor(LOGICAL,618)@12
    assign u0_m0_wo0_wi0_r0_delayr110_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr110_notEnable_q | u0_m0_wo0_wi0_r0_delayr110_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr110_mem_last(CONSTANT,614)
    assign u0_m0_wo0_wi0_r0_delayr110_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr110_cmp(LOGICAL,615)@12
    assign u0_m0_wo0_wi0_r0_delayr110_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr110_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr110_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr110_mem_last_q == u0_m0_wo0_wi0_r0_delayr110_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr110_cmpReg(REG,616)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr110_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr110_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr110_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr110_sticky_ena(REG,619)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr110_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr110_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr110_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr110_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr110_enaAnd(LOGICAL,620)@12
    assign u0_m0_wo0_wi0_r0_delayr110_enaAnd_q = u0_m0_wo0_wi0_r0_delayr110_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr110_rdcnt(COUNTER,611)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr110_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr110_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr110_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr110_rdcnt_q = u0_m0_wo0_wi0_r0_delayr110_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr110_rdmux(MUX,612)@12
    assign u0_m0_wo0_wi0_r0_delayr110_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr110_rdmux_s or u0_m0_wo0_wi0_r0_delayr110_wraddr_q or u0_m0_wo0_wi0_r0_delayr110_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr110_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr110_rdmux_q = u0_m0_wo0_wi0_r0_delayr110_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr110_rdmux_q = u0_m0_wo0_wi0_r0_delayr110_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr110_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join110(BITJOIN,112)@12
    assign u0_m0_wo0_wi0_r0_join110_q = {u0_m0_wo0_wi0_r0_split110_d, u0_m0_wo0_wi0_r0_split110_c, u0_m0_wo0_wi0_r0_split110_b, u0_m0_wo0_wi0_r0_split106_e};

    // u0_m0_wo0_wi0_r0_delayr110_wraddr(REG,613)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr110_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr110_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr110_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr110_mem(DUALMEM,610)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr110_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join110_q);
    assign u0_m0_wo0_wi0_r0_delayr110_mem_aa = u0_m0_wo0_wi0_r0_delayr110_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr110_mem_ab = u0_m0_wo0_wi0_r0_delayr110_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr110_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr110_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr110_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr110_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr110_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr110_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr110_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr110_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr110_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr110_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr110_mem_q = u0_m0_wo0_wi0_r0_delayr110_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split110(BITSELECT,113)@12
    assign u0_m0_wo0_wi0_r0_split110_b = $unsigned(u0_m0_wo0_wi0_r0_delayr110_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split110_c = $unsigned(u0_m0_wo0_wi0_r0_delayr110_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split110_d = $unsigned(u0_m0_wo0_wi0_r0_delayr110_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split110_e = $unsigned(u0_m0_wo0_wi0_r0_delayr110_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr49(DELAY,177)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr49_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr49_q <= u0_m0_wo0_bank_delayr48_q;
        end
    end

    // u0_m0_wo0_dec15(LOOKUP,241)@10 + 1
    assign u0_m0_wo0_dec15_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec15_q <= $unsigned(1'b0);
            u0_m0_wo0_dec15_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000001111 : begin
                                         u0_m0_wo0_dec15_q <= 1'b0;
                                         u0_m0_wo0_dec15_e <= u0_m0_wo0_dec15_c;
                                     end
                14'b00000001010000 : begin
                                         u0_m0_wo0_dec15_q <= 1'b1;
                                         u0_m0_wo0_dec15_e <= u0_m0_wo0_dec15_c;
                                     end
                default : begin
                              u0_m0_wo0_dec15_q <= 1'b0;
                              u0_m0_wo0_dec15_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm15(DUALMEM,243)@10 + 2
    assign u0_m0_wo0_cm15_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm15_aa = u0_m0_wo0_dec15_q;
    assign u0_m0_wo0_cm15_ab = u0_m0_wo0_bank_delayr49_q;
    assign u0_m0_wo0_cm15_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm15.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm15_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm15_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm15_aa),
        .data_a(u0_m0_wo0_cm15_ia),
        .wren_a(u0_m0_wo0_dec15_e[0]),
        .address_b(u0_m0_wo0_cm15_ab),
        .q_b(u0_m0_wo0_cm15_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm15_q = u0_m0_wo0_cm15_iq[15:0];

    // u0_m0_wo0_bank_delayr50(DELAY,178)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr50_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr50_q <= u0_m0_wo0_bank_delayr49_q;
        end
    end

    // u0_m0_wo0_dec14(LOOKUP,238)@10 + 1
    assign u0_m0_wo0_dec14_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec14_q <= $unsigned(1'b0);
            u0_m0_wo0_dec14_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000001110 : begin
                                         u0_m0_wo0_dec14_q <= 1'b0;
                                         u0_m0_wo0_dec14_e <= u0_m0_wo0_dec14_c;
                                     end
                14'b00000001001111 : begin
                                         u0_m0_wo0_dec14_q <= 1'b1;
                                         u0_m0_wo0_dec14_e <= u0_m0_wo0_dec14_c;
                                     end
                default : begin
                              u0_m0_wo0_dec14_q <= 1'b0;
                              u0_m0_wo0_dec14_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm14(DUALMEM,240)@10 + 2
    assign u0_m0_wo0_cm14_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm14_aa = u0_m0_wo0_dec14_q;
    assign u0_m0_wo0_cm14_ab = u0_m0_wo0_bank_delayr50_q;
    assign u0_m0_wo0_cm14_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm14.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm14_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm14_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm14_aa),
        .data_a(u0_m0_wo0_cm14_ia),
        .wren_a(u0_m0_wo0_dec14_e[0]),
        .address_b(u0_m0_wo0_cm14_ab),
        .q_b(u0_m0_wo0_cm14_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm14_q = u0_m0_wo0_cm14_iq[15:0];

    // u0_m0_wo0_bank_delayr51(DELAY,179)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr51_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr51_q <= u0_m0_wo0_bank_delayr50_q;
        end
    end

    // u0_m0_wo0_dec13(LOOKUP,235)@10 + 1
    assign u0_m0_wo0_dec13_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec13_q <= $unsigned(1'b0);
            u0_m0_wo0_dec13_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000001101 : begin
                                         u0_m0_wo0_dec13_q <= 1'b0;
                                         u0_m0_wo0_dec13_e <= u0_m0_wo0_dec13_c;
                                     end
                14'b00000001001110 : begin
                                         u0_m0_wo0_dec13_q <= 1'b1;
                                         u0_m0_wo0_dec13_e <= u0_m0_wo0_dec13_c;
                                     end
                default : begin
                              u0_m0_wo0_dec13_q <= 1'b0;
                              u0_m0_wo0_dec13_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm13(DUALMEM,237)@10 + 2
    assign u0_m0_wo0_cm13_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm13_aa = u0_m0_wo0_dec13_q;
    assign u0_m0_wo0_cm13_ab = u0_m0_wo0_bank_delayr51_q;
    assign u0_m0_wo0_cm13_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm13.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm13_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm13_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm13_aa),
        .data_a(u0_m0_wo0_cm13_ia),
        .wren_a(u0_m0_wo0_dec13_e[0]),
        .address_b(u0_m0_wo0_cm13_ab),
        .q_b(u0_m0_wo0_cm13_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm13_q = u0_m0_wo0_cm13_iq[15:0];

    // u0_m0_wo0_wi0_r0_join13(BITJOIN,39)@12
    assign u0_m0_wo0_wi0_r0_join13_q = {u0_m0_wo0_wi0_r0_split13_d, u0_m0_wo0_wi0_r0_split13_c, u0_m0_wo0_wi0_r0_split13_b, u0_m0_wo0_wi0_r0_split9_e};

    // u0_m0_wo0_wi0_r0_delayr13(DELAY,41)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr13_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr13_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr13_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr13_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join13_q);
            u0_m0_wo0_wi0_r0_delayr13_delay_1 <= u0_m0_wo0_wi0_r0_delayr13_delay_0;
            u0_m0_wo0_wi0_r0_delayr13_q <= u0_m0_wo0_wi0_r0_delayr13_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split13(BITSELECT,40)@12
    assign u0_m0_wo0_wi0_r0_split13_b = $unsigned(u0_m0_wo0_wi0_r0_delayr13_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split13_c = $unsigned(u0_m0_wo0_wi0_r0_delayr13_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split13_d = $unsigned(u0_m0_wo0_wi0_r0_delayr13_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split13_e = $unsigned(u0_m0_wo0_wi0_r0_delayr13_q[63:48]);

    // u0_m0_wo0_bank_delayr52(DELAY,180)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr52_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr52_q <= u0_m0_wo0_bank_delayr51_q;
        end
    end

    // u0_m0_wo0_dec12(LOOKUP,232)@10 + 1
    assign u0_m0_wo0_dec12_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec12_q <= $unsigned(1'b0);
            u0_m0_wo0_dec12_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000001100 : begin
                                         u0_m0_wo0_dec12_q <= 1'b0;
                                         u0_m0_wo0_dec12_e <= u0_m0_wo0_dec12_c;
                                     end
                14'b00000001001101 : begin
                                         u0_m0_wo0_dec12_q <= 1'b1;
                                         u0_m0_wo0_dec12_e <= u0_m0_wo0_dec12_c;
                                     end
                default : begin
                              u0_m0_wo0_dec12_q <= 1'b0;
                              u0_m0_wo0_dec12_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm12(DUALMEM,234)@10 + 2
    assign u0_m0_wo0_cm12_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm12_aa = u0_m0_wo0_dec12_q;
    assign u0_m0_wo0_cm12_ab = u0_m0_wo0_bank_delayr52_q;
    assign u0_m0_wo0_cm12_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm12.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm12_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm12_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm12_aa),
        .data_a(u0_m0_wo0_cm12_ia),
        .wren_a(u0_m0_wo0_dec12_e[0]),
        .address_b(u0_m0_wo0_cm12_ab),
        .q_b(u0_m0_wo0_cm12_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm12_q = u0_m0_wo0_cm12_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr114_notEnable(LOGICAL,628)@12
    assign u0_m0_wo0_wi0_r0_delayr114_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr114_nor(LOGICAL,629)@12
    assign u0_m0_wo0_wi0_r0_delayr114_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr114_notEnable_q | u0_m0_wo0_wi0_r0_delayr114_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr114_mem_last(CONSTANT,625)
    assign u0_m0_wo0_wi0_r0_delayr114_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr114_cmp(LOGICAL,626)@12
    assign u0_m0_wo0_wi0_r0_delayr114_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr114_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr114_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr114_mem_last_q == u0_m0_wo0_wi0_r0_delayr114_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr114_cmpReg(REG,627)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr114_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr114_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr114_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr114_sticky_ena(REG,630)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr114_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr114_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr114_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr114_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr114_enaAnd(LOGICAL,631)@12
    assign u0_m0_wo0_wi0_r0_delayr114_enaAnd_q = u0_m0_wo0_wi0_r0_delayr114_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr114_rdcnt(COUNTER,622)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr114_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr114_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr114_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr114_rdcnt_q = u0_m0_wo0_wi0_r0_delayr114_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr114_rdmux(MUX,623)@12
    assign u0_m0_wo0_wi0_r0_delayr114_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr114_rdmux_s or u0_m0_wo0_wi0_r0_delayr114_wraddr_q or u0_m0_wo0_wi0_r0_delayr114_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr114_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr114_rdmux_q = u0_m0_wo0_wi0_r0_delayr114_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr114_rdmux_q = u0_m0_wo0_wi0_r0_delayr114_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr114_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join114(BITJOIN,115)@12
    assign u0_m0_wo0_wi0_r0_join114_q = {u0_m0_wo0_wi0_r0_split114_d, u0_m0_wo0_wi0_r0_split114_c, u0_m0_wo0_wi0_r0_split114_b, u0_m0_wo0_wi0_r0_split110_e};

    // u0_m0_wo0_wi0_r0_delayr114_wraddr(REG,624)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr114_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr114_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr114_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr114_mem(DUALMEM,621)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr114_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join114_q);
    assign u0_m0_wo0_wi0_r0_delayr114_mem_aa = u0_m0_wo0_wi0_r0_delayr114_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr114_mem_ab = u0_m0_wo0_wi0_r0_delayr114_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr114_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr114_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr114_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr114_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr114_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr114_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr114_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr114_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr114_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr114_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr114_mem_q = u0_m0_wo0_wi0_r0_delayr114_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split114(BITSELECT,116)@12
    assign u0_m0_wo0_wi0_r0_split114_b = $unsigned(u0_m0_wo0_wi0_r0_delayr114_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split114_c = $unsigned(u0_m0_wo0_wi0_r0_delayr114_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split114_d = $unsigned(u0_m0_wo0_wi0_r0_delayr114_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split114_e = $unsigned(u0_m0_wo0_wi0_r0_delayr114_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr53(DELAY,181)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr53_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr53_q <= u0_m0_wo0_bank_delayr52_q;
        end
    end

    // u0_m0_wo0_dec11(LOOKUP,229)@10 + 1
    assign u0_m0_wo0_dec11_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec11_q <= $unsigned(1'b0);
            u0_m0_wo0_dec11_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000001011 : begin
                                         u0_m0_wo0_dec11_q <= 1'b0;
                                         u0_m0_wo0_dec11_e <= u0_m0_wo0_dec11_c;
                                     end
                14'b00000001001100 : begin
                                         u0_m0_wo0_dec11_q <= 1'b1;
                                         u0_m0_wo0_dec11_e <= u0_m0_wo0_dec11_c;
                                     end
                default : begin
                              u0_m0_wo0_dec11_q <= 1'b0;
                              u0_m0_wo0_dec11_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm11(DUALMEM,231)@10 + 2
    assign u0_m0_wo0_cm11_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm11_aa = u0_m0_wo0_dec11_q;
    assign u0_m0_wo0_cm11_ab = u0_m0_wo0_bank_delayr53_q;
    assign u0_m0_wo0_cm11_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm11.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm11_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm11_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm11_aa),
        .data_a(u0_m0_wo0_cm11_ia),
        .wren_a(u0_m0_wo0_dec11_e[0]),
        .address_b(u0_m0_wo0_cm11_ab),
        .q_b(u0_m0_wo0_cm11_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm11_q = u0_m0_wo0_cm11_iq[15:0];

    // u0_m0_wo0_bank_delayr54(DELAY,182)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr54_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr54_q <= u0_m0_wo0_bank_delayr53_q;
        end
    end

    // u0_m0_wo0_dec10(LOOKUP,226)@10 + 1
    assign u0_m0_wo0_dec10_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec10_q <= $unsigned(1'b0);
            u0_m0_wo0_dec10_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000001010 : begin
                                         u0_m0_wo0_dec10_q <= 1'b0;
                                         u0_m0_wo0_dec10_e <= u0_m0_wo0_dec10_c;
                                     end
                14'b00000001001011 : begin
                                         u0_m0_wo0_dec10_q <= 1'b1;
                                         u0_m0_wo0_dec10_e <= u0_m0_wo0_dec10_c;
                                     end
                default : begin
                              u0_m0_wo0_dec10_q <= 1'b0;
                              u0_m0_wo0_dec10_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm10(DUALMEM,228)@10 + 2
    assign u0_m0_wo0_cm10_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm10_aa = u0_m0_wo0_dec10_q;
    assign u0_m0_wo0_cm10_ab = u0_m0_wo0_bank_delayr54_q;
    assign u0_m0_wo0_cm10_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm10.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm10_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm10_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm10_aa),
        .data_a(u0_m0_wo0_cm10_ia),
        .wren_a(u0_m0_wo0_dec10_e[0]),
        .address_b(u0_m0_wo0_cm10_ab),
        .q_b(u0_m0_wo0_cm10_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm10_q = u0_m0_wo0_cm10_iq[15:0];

    // u0_m0_wo0_bank_delayr55(DELAY,183)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr55_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr55_q <= u0_m0_wo0_bank_delayr54_q;
        end
    end

    // u0_m0_wo0_dec9(LOOKUP,223)@10 + 1
    assign u0_m0_wo0_dec9_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec9_q <= $unsigned(1'b0);
            u0_m0_wo0_dec9_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000001001 : begin
                                         u0_m0_wo0_dec9_q <= 1'b0;
                                         u0_m0_wo0_dec9_e <= u0_m0_wo0_dec9_c;
                                     end
                14'b00000001001010 : begin
                                         u0_m0_wo0_dec9_q <= 1'b1;
                                         u0_m0_wo0_dec9_e <= u0_m0_wo0_dec9_c;
                                     end
                default : begin
                              u0_m0_wo0_dec9_q <= 1'b0;
                              u0_m0_wo0_dec9_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm9(DUALMEM,225)@10 + 2
    assign u0_m0_wo0_cm9_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm9_aa = u0_m0_wo0_dec9_q;
    assign u0_m0_wo0_cm9_ab = u0_m0_wo0_bank_delayr55_q;
    assign u0_m0_wo0_cm9_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm9.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm9_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm9_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm9_aa),
        .data_a(u0_m0_wo0_cm9_ia),
        .wren_a(u0_m0_wo0_dec9_e[0]),
        .address_b(u0_m0_wo0_cm9_ab),
        .q_b(u0_m0_wo0_cm9_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm9_q = u0_m0_wo0_cm9_iq[15:0];

    // u0_m0_wo0_wi0_r0_join9(BITJOIN,36)@12
    assign u0_m0_wo0_wi0_r0_join9_q = {u0_m0_wo0_wi0_r0_split9_d, u0_m0_wo0_wi0_r0_split9_c, u0_m0_wo0_wi0_r0_split9_b, u0_m0_wo0_wi0_r0_split5_e};

    // u0_m0_wo0_wi0_r0_delayr9(DELAY,38)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr9_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr9_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr9_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr9_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join9_q);
            u0_m0_wo0_wi0_r0_delayr9_delay_1 <= u0_m0_wo0_wi0_r0_delayr9_delay_0;
            u0_m0_wo0_wi0_r0_delayr9_q <= u0_m0_wo0_wi0_r0_delayr9_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split9(BITSELECT,37)@12
    assign u0_m0_wo0_wi0_r0_split9_b = $unsigned(u0_m0_wo0_wi0_r0_delayr9_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split9_c = $unsigned(u0_m0_wo0_wi0_r0_delayr9_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split9_d = $unsigned(u0_m0_wo0_wi0_r0_delayr9_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split9_e = $unsigned(u0_m0_wo0_wi0_r0_delayr9_q[63:48]);

    // u0_m0_wo0_bank_delayr56(DELAY,184)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr56_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr56_q <= u0_m0_wo0_bank_delayr55_q;
        end
    end

    // u0_m0_wo0_dec8(LOOKUP,220)@10 + 1
    assign u0_m0_wo0_dec8_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec8_q <= $unsigned(1'b0);
            u0_m0_wo0_dec8_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000001000 : begin
                                         u0_m0_wo0_dec8_q <= 1'b0;
                                         u0_m0_wo0_dec8_e <= u0_m0_wo0_dec8_c;
                                     end
                14'b00000001001001 : begin
                                         u0_m0_wo0_dec8_q <= 1'b1;
                                         u0_m0_wo0_dec8_e <= u0_m0_wo0_dec8_c;
                                     end
                default : begin
                              u0_m0_wo0_dec8_q <= 1'b0;
                              u0_m0_wo0_dec8_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm8(DUALMEM,222)@10 + 2
    assign u0_m0_wo0_cm8_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm8_aa = u0_m0_wo0_dec8_q;
    assign u0_m0_wo0_cm8_ab = u0_m0_wo0_bank_delayr56_q;
    assign u0_m0_wo0_cm8_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm8.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm8_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm8_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm8_aa),
        .data_a(u0_m0_wo0_cm8_ia),
        .wren_a(u0_m0_wo0_dec8_e[0]),
        .address_b(u0_m0_wo0_cm8_ab),
        .q_b(u0_m0_wo0_cm8_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm8_q = u0_m0_wo0_cm8_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr118_notEnable(LOGICAL,639)@12
    assign u0_m0_wo0_wi0_r0_delayr118_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr118_nor(LOGICAL,640)@12
    assign u0_m0_wo0_wi0_r0_delayr118_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr118_notEnable_q | u0_m0_wo0_wi0_r0_delayr118_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr118_mem_last(CONSTANT,636)
    assign u0_m0_wo0_wi0_r0_delayr118_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr118_cmp(LOGICAL,637)@12
    assign u0_m0_wo0_wi0_r0_delayr118_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr118_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr118_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr118_mem_last_q == u0_m0_wo0_wi0_r0_delayr118_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr118_cmpReg(REG,638)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr118_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr118_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr118_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr118_sticky_ena(REG,641)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr118_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr118_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr118_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr118_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr118_enaAnd(LOGICAL,642)@12
    assign u0_m0_wo0_wi0_r0_delayr118_enaAnd_q = u0_m0_wo0_wi0_r0_delayr118_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr118_rdcnt(COUNTER,633)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr118_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr118_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr118_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr118_rdcnt_q = u0_m0_wo0_wi0_r0_delayr118_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr118_rdmux(MUX,634)@12
    assign u0_m0_wo0_wi0_r0_delayr118_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr118_rdmux_s or u0_m0_wo0_wi0_r0_delayr118_wraddr_q or u0_m0_wo0_wi0_r0_delayr118_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr118_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr118_rdmux_q = u0_m0_wo0_wi0_r0_delayr118_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr118_rdmux_q = u0_m0_wo0_wi0_r0_delayr118_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr118_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join118(BITJOIN,118)@12
    assign u0_m0_wo0_wi0_r0_join118_q = {u0_m0_wo0_wi0_r0_split118_d, u0_m0_wo0_wi0_r0_split118_c, u0_m0_wo0_wi0_r0_split118_b, u0_m0_wo0_wi0_r0_split114_e};

    // u0_m0_wo0_wi0_r0_delayr118_wraddr(REG,635)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr118_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr118_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr118_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr118_mem(DUALMEM,632)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr118_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join118_q);
    assign u0_m0_wo0_wi0_r0_delayr118_mem_aa = u0_m0_wo0_wi0_r0_delayr118_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr118_mem_ab = u0_m0_wo0_wi0_r0_delayr118_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr118_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr118_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr118_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr118_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr118_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr118_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr118_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr118_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr118_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr118_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr118_mem_q = u0_m0_wo0_wi0_r0_delayr118_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split118(BITSELECT,119)@12
    assign u0_m0_wo0_wi0_r0_split118_b = $unsigned(u0_m0_wo0_wi0_r0_delayr118_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split118_c = $unsigned(u0_m0_wo0_wi0_r0_delayr118_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split118_d = $unsigned(u0_m0_wo0_wi0_r0_delayr118_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split118_e = $unsigned(u0_m0_wo0_wi0_r0_delayr118_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr57(DELAY,185)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr57_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr57_q <= u0_m0_wo0_bank_delayr56_q;
        end
    end

    // u0_m0_wo0_dec7(LOOKUP,217)@10 + 1
    assign u0_m0_wo0_dec7_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec7_q <= $unsigned(1'b0);
            u0_m0_wo0_dec7_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000000111 : begin
                                         u0_m0_wo0_dec7_q <= 1'b0;
                                         u0_m0_wo0_dec7_e <= u0_m0_wo0_dec7_c;
                                     end
                14'b00000001001000 : begin
                                         u0_m0_wo0_dec7_q <= 1'b1;
                                         u0_m0_wo0_dec7_e <= u0_m0_wo0_dec7_c;
                                     end
                default : begin
                              u0_m0_wo0_dec7_q <= 1'b0;
                              u0_m0_wo0_dec7_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm7(DUALMEM,219)@10 + 2
    assign u0_m0_wo0_cm7_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm7_aa = u0_m0_wo0_dec7_q;
    assign u0_m0_wo0_cm7_ab = u0_m0_wo0_bank_delayr57_q;
    assign u0_m0_wo0_cm7_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm7.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm7_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm7_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm7_aa),
        .data_a(u0_m0_wo0_cm7_ia),
        .wren_a(u0_m0_wo0_dec7_e[0]),
        .address_b(u0_m0_wo0_cm7_ab),
        .q_b(u0_m0_wo0_cm7_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm7_q = u0_m0_wo0_cm7_iq[15:0];

    // u0_m0_wo0_bank_delayr58(DELAY,186)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr58_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr58_q <= u0_m0_wo0_bank_delayr57_q;
        end
    end

    // u0_m0_wo0_dec6(LOOKUP,214)@10 + 1
    assign u0_m0_wo0_dec6_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec6_q <= $unsigned(1'b0);
            u0_m0_wo0_dec6_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000000110 : begin
                                         u0_m0_wo0_dec6_q <= 1'b0;
                                         u0_m0_wo0_dec6_e <= u0_m0_wo0_dec6_c;
                                     end
                14'b00000001000111 : begin
                                         u0_m0_wo0_dec6_q <= 1'b1;
                                         u0_m0_wo0_dec6_e <= u0_m0_wo0_dec6_c;
                                     end
                default : begin
                              u0_m0_wo0_dec6_q <= 1'b0;
                              u0_m0_wo0_dec6_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm6(DUALMEM,216)@10 + 2
    assign u0_m0_wo0_cm6_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm6_aa = u0_m0_wo0_dec6_q;
    assign u0_m0_wo0_cm6_ab = u0_m0_wo0_bank_delayr58_q;
    assign u0_m0_wo0_cm6_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm6.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm6_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm6_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm6_aa),
        .data_a(u0_m0_wo0_cm6_ia),
        .wren_a(u0_m0_wo0_dec6_e[0]),
        .address_b(u0_m0_wo0_cm6_ab),
        .q_b(u0_m0_wo0_cm6_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm6_q = u0_m0_wo0_cm6_iq[15:0];

    // u0_m0_wo0_bank_delayr59(DELAY,187)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr59_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr59_q <= u0_m0_wo0_bank_delayr58_q;
        end
    end

    // u0_m0_wo0_dec5(LOOKUP,211)@10 + 1
    assign u0_m0_wo0_dec5_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec5_q <= $unsigned(1'b0);
            u0_m0_wo0_dec5_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000000101 : begin
                                         u0_m0_wo0_dec5_q <= 1'b0;
                                         u0_m0_wo0_dec5_e <= u0_m0_wo0_dec5_c;
                                     end
                14'b00000001000110 : begin
                                         u0_m0_wo0_dec5_q <= 1'b1;
                                         u0_m0_wo0_dec5_e <= u0_m0_wo0_dec5_c;
                                     end
                default : begin
                              u0_m0_wo0_dec5_q <= 1'b0;
                              u0_m0_wo0_dec5_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm5(DUALMEM,213)@10 + 2
    assign u0_m0_wo0_cm5_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm5_aa = u0_m0_wo0_dec5_q;
    assign u0_m0_wo0_cm5_ab = u0_m0_wo0_bank_delayr59_q;
    assign u0_m0_wo0_cm5_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm5.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm5_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm5_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm5_aa),
        .data_a(u0_m0_wo0_cm5_ia),
        .wren_a(u0_m0_wo0_dec5_e[0]),
        .address_b(u0_m0_wo0_cm5_ab),
        .q_b(u0_m0_wo0_cm5_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm5_q = u0_m0_wo0_cm5_iq[15:0];

    // u0_m0_wo0_wi0_r0_join5(BITJOIN,33)@12
    assign u0_m0_wo0_wi0_r0_join5_q = {u0_m0_wo0_wi0_r0_split5_d, u0_m0_wo0_wi0_r0_split5_c, u0_m0_wo0_wi0_r0_split5_b, u0_m0_wo0_wi0_r0_split1_e};

    // u0_m0_wo0_wi0_r0_delayr5(DELAY,35)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr5_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr5_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr5_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr5_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join5_q);
            u0_m0_wo0_wi0_r0_delayr5_delay_1 <= u0_m0_wo0_wi0_r0_delayr5_delay_0;
            u0_m0_wo0_wi0_r0_delayr5_q <= u0_m0_wo0_wi0_r0_delayr5_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split5(BITSELECT,34)@12
    assign u0_m0_wo0_wi0_r0_split5_b = $unsigned(u0_m0_wo0_wi0_r0_delayr5_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split5_c = $unsigned(u0_m0_wo0_wi0_r0_delayr5_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split5_d = $unsigned(u0_m0_wo0_wi0_r0_delayr5_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split5_e = $unsigned(u0_m0_wo0_wi0_r0_delayr5_q[63:48]);

    // u0_m0_wo0_bank_delayr60(DELAY,188)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr60_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr60_q <= u0_m0_wo0_bank_delayr59_q;
        end
    end

    // u0_m0_wo0_dec4(LOOKUP,208)@10 + 1
    assign u0_m0_wo0_dec4_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec4_q <= $unsigned(1'b0);
            u0_m0_wo0_dec4_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000000100 : begin
                                         u0_m0_wo0_dec4_q <= 1'b0;
                                         u0_m0_wo0_dec4_e <= u0_m0_wo0_dec4_c;
                                     end
                14'b00000001000101 : begin
                                         u0_m0_wo0_dec4_q <= 1'b1;
                                         u0_m0_wo0_dec4_e <= u0_m0_wo0_dec4_c;
                                     end
                default : begin
                              u0_m0_wo0_dec4_q <= 1'b0;
                              u0_m0_wo0_dec4_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm4(DUALMEM,210)@10 + 2
    assign u0_m0_wo0_cm4_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm4_aa = u0_m0_wo0_dec4_q;
    assign u0_m0_wo0_cm4_ab = u0_m0_wo0_bank_delayr60_q;
    assign u0_m0_wo0_cm4_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm4.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm4_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm4_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm4_aa),
        .data_a(u0_m0_wo0_cm4_ia),
        .wren_a(u0_m0_wo0_dec4_e[0]),
        .address_b(u0_m0_wo0_cm4_ab),
        .q_b(u0_m0_wo0_cm4_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm4_q = u0_m0_wo0_cm4_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr122_notEnable(LOGICAL,650)@12
    assign u0_m0_wo0_wi0_r0_delayr122_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr122_nor(LOGICAL,651)@12
    assign u0_m0_wo0_wi0_r0_delayr122_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr122_notEnable_q | u0_m0_wo0_wi0_r0_delayr122_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr122_mem_last(CONSTANT,647)
    assign u0_m0_wo0_wi0_r0_delayr122_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr122_cmp(LOGICAL,648)@12
    assign u0_m0_wo0_wi0_r0_delayr122_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr122_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr122_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr122_mem_last_q == u0_m0_wo0_wi0_r0_delayr122_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr122_cmpReg(REG,649)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr122_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr122_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr122_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr122_sticky_ena(REG,652)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr122_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr122_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr122_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr122_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr122_enaAnd(LOGICAL,653)@12
    assign u0_m0_wo0_wi0_r0_delayr122_enaAnd_q = u0_m0_wo0_wi0_r0_delayr122_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr122_rdcnt(COUNTER,644)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr122_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr122_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr122_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr122_rdcnt_q = u0_m0_wo0_wi0_r0_delayr122_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr122_rdmux(MUX,645)@12
    assign u0_m0_wo0_wi0_r0_delayr122_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr122_rdmux_s or u0_m0_wo0_wi0_r0_delayr122_wraddr_q or u0_m0_wo0_wi0_r0_delayr122_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr122_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr122_rdmux_q = u0_m0_wo0_wi0_r0_delayr122_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr122_rdmux_q = u0_m0_wo0_wi0_r0_delayr122_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr122_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join122(BITJOIN,121)@12
    assign u0_m0_wo0_wi0_r0_join122_q = {u0_m0_wo0_wi0_r0_split122_d, u0_m0_wo0_wi0_r0_split122_c, u0_m0_wo0_wi0_r0_split122_b, u0_m0_wo0_wi0_r0_split118_e};

    // u0_m0_wo0_wi0_r0_delayr122_wraddr(REG,646)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr122_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr122_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr122_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr122_mem(DUALMEM,643)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr122_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join122_q);
    assign u0_m0_wo0_wi0_r0_delayr122_mem_aa = u0_m0_wo0_wi0_r0_delayr122_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr122_mem_ab = u0_m0_wo0_wi0_r0_delayr122_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr122_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr122_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr122_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr122_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr122_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr122_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr122_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr122_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr122_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr122_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr122_mem_q = u0_m0_wo0_wi0_r0_delayr122_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split122(BITSELECT,122)@12
    assign u0_m0_wo0_wi0_r0_split122_b = $unsigned(u0_m0_wo0_wi0_r0_delayr122_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split122_c = $unsigned(u0_m0_wo0_wi0_r0_delayr122_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split122_d = $unsigned(u0_m0_wo0_wi0_r0_delayr122_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split122_e = $unsigned(u0_m0_wo0_wi0_r0_delayr122_mem_q[63:48]);

    // u0_m0_wo0_bank_delayr61(DELAY,189)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr61_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr61_q <= u0_m0_wo0_bank_delayr60_q;
        end
    end

    // u0_m0_wo0_dec3(LOOKUP,205)@10 + 1
    assign u0_m0_wo0_dec3_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec3_q <= $unsigned(1'b0);
            u0_m0_wo0_dec3_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000000011 : begin
                                         u0_m0_wo0_dec3_q <= 1'b0;
                                         u0_m0_wo0_dec3_e <= u0_m0_wo0_dec3_c;
                                     end
                14'b00000001000100 : begin
                                         u0_m0_wo0_dec3_q <= 1'b1;
                                         u0_m0_wo0_dec3_e <= u0_m0_wo0_dec3_c;
                                     end
                default : begin
                              u0_m0_wo0_dec3_q <= 1'b0;
                              u0_m0_wo0_dec3_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm3(DUALMEM,207)@10 + 2
    assign u0_m0_wo0_cm3_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm3_aa = u0_m0_wo0_dec3_q;
    assign u0_m0_wo0_cm3_ab = u0_m0_wo0_bank_delayr61_q;
    assign u0_m0_wo0_cm3_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm3.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm3_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm3_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm3_aa),
        .data_a(u0_m0_wo0_cm3_ia),
        .wren_a(u0_m0_wo0_dec3_e[0]),
        .address_b(u0_m0_wo0_cm3_ab),
        .q_b(u0_m0_wo0_cm3_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm3_q = u0_m0_wo0_cm3_iq[15:0];

    // u0_m0_wo0_bank_delayr62(DELAY,190)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr62_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr62_q <= u0_m0_wo0_bank_delayr61_q;
        end
    end

    // u0_m0_wo0_dec2(LOOKUP,202)@10 + 1
    assign u0_m0_wo0_dec2_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec2_q <= $unsigned(1'b0);
            u0_m0_wo0_dec2_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000000010 : begin
                                         u0_m0_wo0_dec2_q <= 1'b0;
                                         u0_m0_wo0_dec2_e <= u0_m0_wo0_dec2_c;
                                     end
                14'b00000001000011 : begin
                                         u0_m0_wo0_dec2_q <= 1'b1;
                                         u0_m0_wo0_dec2_e <= u0_m0_wo0_dec2_c;
                                     end
                default : begin
                              u0_m0_wo0_dec2_q <= 1'b0;
                              u0_m0_wo0_dec2_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm2(DUALMEM,204)@10 + 2
    assign u0_m0_wo0_cm2_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm2_aa = u0_m0_wo0_dec2_q;
    assign u0_m0_wo0_cm2_ab = u0_m0_wo0_bank_delayr62_q;
    assign u0_m0_wo0_cm2_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm2.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm2_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm2_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm2_aa),
        .data_a(u0_m0_wo0_cm2_ia),
        .wren_a(u0_m0_wo0_dec2_e[0]),
        .address_b(u0_m0_wo0_cm2_ab),
        .q_b(u0_m0_wo0_cm2_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm2_q = u0_m0_wo0_cm2_iq[15:0];

    // u0_m0_wo0_bank_delayr63(DELAY,191)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr63_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr63_q <= u0_m0_wo0_bank_delayr62_q;
        end
    end

    // u0_m0_wo0_dec1(LOOKUP,199)@10 + 1
    assign u0_m0_wo0_dec1_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec1_q <= $unsigned(1'b0);
            u0_m0_wo0_dec1_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000000001 : begin
                                         u0_m0_wo0_dec1_q <= 1'b0;
                                         u0_m0_wo0_dec1_e <= u0_m0_wo0_dec1_c;
                                     end
                14'b00000001000010 : begin
                                         u0_m0_wo0_dec1_q <= 1'b1;
                                         u0_m0_wo0_dec1_e <= u0_m0_wo0_dec1_c;
                                     end
                default : begin
                              u0_m0_wo0_dec1_q <= 1'b0;
                              u0_m0_wo0_dec1_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm1(DUALMEM,201)@10 + 2
    assign u0_m0_wo0_cm1_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm1_aa = u0_m0_wo0_dec1_q;
    assign u0_m0_wo0_cm1_ab = u0_m0_wo0_bank_delayr63_q;
    assign u0_m0_wo0_cm1_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm1.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm1_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm1_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm1_aa),
        .data_a(u0_m0_wo0_cm1_ia),
        .wren_a(u0_m0_wo0_dec1_e[0]),
        .address_b(u0_m0_wo0_cm1_ab),
        .q_b(u0_m0_wo0_cm1_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm1_q = u0_m0_wo0_cm1_iq[15:0];

    // u0_m0_wo0_wi0_r0_join1(BITJOIN,30)@12
    assign u0_m0_wo0_wi0_r0_join1_q = {u0_m0_wo0_wi0_r0_split1_d, u0_m0_wo0_wi0_r0_split1_c, u0_m0_wo0_wi0_r0_split1_b, u0_m0_wo0_wi0_r0_phasedelay0_q};

    // u0_m0_wo0_wi0_r0_delayr1(DELAY,32)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr1_delay_0 <= '0;
            u0_m0_wo0_wi0_r0_delayr1_delay_1 <= '0;
            u0_m0_wo0_wi0_r0_delayr1_q <= '0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr1_delay_0 <= $unsigned(u0_m0_wo0_wi0_r0_join1_q);
            u0_m0_wo0_wi0_r0_delayr1_delay_1 <= u0_m0_wo0_wi0_r0_delayr1_delay_0;
            u0_m0_wo0_wi0_r0_delayr1_q <= u0_m0_wo0_wi0_r0_delayr1_delay_1;
        end
    end

    // u0_m0_wo0_wi0_r0_split1(BITSELECT,31)@12
    assign u0_m0_wo0_wi0_r0_split1_b = $unsigned(u0_m0_wo0_wi0_r0_delayr1_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split1_c = $unsigned(u0_m0_wo0_wi0_r0_delayr1_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split1_d = $unsigned(u0_m0_wo0_wi0_r0_delayr1_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split1_e = $unsigned(u0_m0_wo0_wi0_r0_delayr1_q[63:48]);

    // u0_m0_wo0_bank_delayr64(DELAY,192)@10
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_bank_delayr64_q <= '0;
        end
        else if (xIn_v == 1'b1)
        begin
            u0_m0_wo0_bank_delayr64_q <= u0_m0_wo0_bank_delayr63_q;
        end
    end

    // u0_m0_wo0_dec0(LOOKUP,196)@10 + 1
    assign u0_m0_wo0_dec0_c = $unsigned(busIn_write);
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_m0_wo0_dec0_q <= $unsigned(1'b0);
            u0_m0_wo0_dec0_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                14'b00000000000000 : begin
                                         u0_m0_wo0_dec0_q <= 1'b0;
                                         u0_m0_wo0_dec0_e <= u0_m0_wo0_dec0_c;
                                     end
                14'b00000001000001 : begin
                                         u0_m0_wo0_dec0_q <= 1'b1;
                                         u0_m0_wo0_dec0_e <= u0_m0_wo0_dec0_c;
                                     end
                default : begin
                              u0_m0_wo0_dec0_q <= 1'b0;
                              u0_m0_wo0_dec0_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm0(DUALMEM,198)@10 + 2
    assign u0_m0_wo0_cm0_ia = $unsigned(d_busIn_writedata_11_q[15:0]);
    assign u0_m0_wo0_cm0_aa = u0_m0_wo0_dec0_q;
    assign u0_m0_wo0_cm0_ab = u0_m0_wo0_bank_delayr64_q;
    assign u0_m0_wo0_cm0_ena_NotRstA = ~ (bus_areset);
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(1),
        .numwords_a(2),
        .width_b(16),
        .widthad_b(1),
        .numwords_b(2),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm0.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_cm0_dmem (
        .clocken1(1'b1),
        .clocken0(u0_m0_wo0_cm0_ena_NotRstA),
        .clock0(bus_clk),
        .clock1(clk),
        .address_a(u0_m0_wo0_cm0_aa),
        .data_a(u0_m0_wo0_cm0_ia),
        .wren_a(u0_m0_wo0_dec0_e[0]),
        .address_b(u0_m0_wo0_cm0_ab),
        .q_b(u0_m0_wo0_cm0_iq),
        .rden_b(xIn_v[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm0_q = u0_m0_wo0_cm0_iq[15:0];

    // u0_m0_wo0_wi0_r0_delayr0_notEnable(LOGICAL,485)@12
    assign u0_m0_wo0_wi0_r0_delayr0_notEnable_q = $unsigned(~ (d_in0_m0_wi0_wo0_assign_id1_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr0_nor(LOGICAL,486)@12
    assign u0_m0_wo0_wi0_r0_delayr0_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr0_notEnable_q | u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr0_mem_last(CONSTANT,482)
    assign u0_m0_wo0_wi0_r0_delayr0_mem_last_q = $unsigned(6'b011100);

    // u0_m0_wo0_wi0_r0_delayr0_cmp(LOGICAL,483)@12
    assign u0_m0_wo0_wi0_r0_delayr0_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr0_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr0_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr0_mem_last_q == u0_m0_wo0_wi0_r0_delayr0_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr0_cmpReg(REG,484)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr0_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_sticky_ena(REG,487)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr0_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_enaAnd(LOGICAL,488)@12
    assign u0_m0_wo0_wi0_r0_delayr0_enaAnd_q = u0_m0_wo0_wi0_r0_delayr0_sticky_ena_q & d_in0_m0_wi0_wo0_assign_id1_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr0_rdcnt(COUNTER,479)@12 + 1
    // low=0, high=29, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_rdcnt_i <= 5'd0;
            u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_12_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_delayr0_rdcnt_i == 5'd28)
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_delayr0_rdcnt_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(5'd3);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_delayr0_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_rdcnt_i) + $unsigned(5'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr0_rdcnt_q = u0_m0_wo0_wi0_r0_delayr0_rdcnt_i[4:0];

    // u0_m0_wo0_wi0_r0_delayr0_rdmux(MUX,480)@12
    assign u0_m0_wo0_wi0_r0_delayr0_rdmux_s = d_in0_m0_wi0_wo0_assign_id1_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr0_rdmux_s or u0_m0_wo0_wi0_r0_delayr0_wraddr_q or u0_m0_wo0_wi0_r0_delayr0_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr0_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr0_rdmux_q = u0_m0_wo0_wi0_r0_delayr0_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr0_rdmux_q = u0_m0_wo0_wi0_r0_delayr0_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr0_rdmux_q = 5'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_delayr0_split_0_nor(LOGICAL,673)@12
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr0_notEnable_q | u0_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr0_split_0_mem_last(CONSTANT,669)
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q = $unsigned(6'b011110);

    // u0_m0_wo0_wi0_r0_delayr0_split_0_cmp(LOGICAL,670)@12
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_last_q == u0_m0_wo0_wi0_r0_delayr0_split_0_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr0_split_0_cmpReg(REG,671)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_split_0_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena(REG,674)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr0_split_0_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_split_0_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_split_0_enaAnd(LOGICAL,675)@12
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q = u0_m0_wo0_wi0_r0_delayr0_split_0_sticky_ena_q & d_in0_m0_wi0_wo0_assign_id1_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt(COUNTER,666)@12 + 1
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i <= 5'd0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i) + $unsigned(5'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q = u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_i[4:0];

    // u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux(MUX,667)@12
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s = d_in0_m0_wi0_wo0_assign_id1_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s or u0_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q or u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = u0_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = u0_m0_wo0_wi0_r0_delayr0_split_0_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q = 5'b0;
        endcase
    end

    // d_bank_u0_m0_wi0_wo0_bit_select_merged_c_12(DELAY,476)@10 + 2
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_bank_u0_m0_wi0_wo0_bit_select_merged_c_12_delay_0 <= $unsigned(bank_u0_m0_wi0_wo0_bit_select_merged_c);
            d_bank_u0_m0_wi0_wo0_bit_select_merged_c_12_q <= d_bank_u0_m0_wi0_wo0_bit_select_merged_c_12_delay_0;
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_split_0_wraddr(REG,668)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q <= $unsigned(5'b11111);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_split_0_mem(DUALMEM,665)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ia = $unsigned(d_bank_u0_m0_wi0_wo0_bit_select_merged_c_12_q);
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_mem_aa = u0_m0_wo0_wi0_r0_delayr0_split_0_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ab = u0_m0_wo0_wi0_r0_delayr0_split_0_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr0_split_0_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(16),
        .widthad_b(5),
        .numwords_b(32),
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
    ) u0_m0_wo0_wi0_r0_delayr0_split_0_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr0_split_0_mem_q = u0_m0_wo0_wi0_r0_delayr0_split_0_mem_iq[15:0];

    // d_in0_m0_wi0_wo0_assign_id1_q_12(DELAY,472)@10 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_12_delay_0 <= '0;
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_12_delay_0 <= $unsigned(xIn_v);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_in0_m0_wi0_wo0_assign_id1_q_12_q <= d_in0_m0_wi0_wo0_assign_id1_q_12_delay_0;
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_wraddr(REG,481)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(5'b11101);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr0_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr0_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr0_mem(DUALMEM,478)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr0_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_delayr0_split_0_mem_q);
    assign u0_m0_wo0_wi0_r0_delayr0_mem_aa = u0_m0_wo0_wi0_r0_delayr0_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr0_mem_ab = u0_m0_wo0_wi0_r0_delayr0_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr0_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr0_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(5),
        .numwords_a(30),
        .width_b(16),
        .widthad_b(5),
        .numwords_b(30),
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
    ) u0_m0_wo0_wi0_r0_delayr0_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr0_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr0_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr0_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr0_mem_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr0_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr0_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr0_mem_q = u0_m0_wo0_wi0_r0_delayr0_mem_iq[15:0];

    // u0_m0_wo0_wi0_r0_phasedelay0(DELAY,29)@12
    assign u0_m0_wo0_wi0_r0_phasedelay0_q = $unsigned(u0_m0_wo0_wi0_r0_delayr0_mem_q);

    // u0_m0_wo0_wi0_r0_delayr126_notEnable(LOGICAL,661)@12
    assign u0_m0_wo0_wi0_r0_delayr126_notEnable_q = $unsigned(~ (d_u0_m0_wo0_compute_q_12_q));

    // u0_m0_wo0_wi0_r0_delayr126_nor(LOGICAL,662)@12
    assign u0_m0_wo0_wi0_r0_delayr126_nor_q = ~ (u0_m0_wo0_wi0_r0_delayr126_notEnable_q | u0_m0_wo0_wi0_r0_delayr126_sticky_ena_q);

    // u0_m0_wo0_wi0_r0_delayr126_mem_last(CONSTANT,658)
    assign u0_m0_wo0_wi0_r0_delayr126_mem_last_q = $unsigned(3'b010);

    // u0_m0_wo0_wi0_r0_delayr126_cmp(LOGICAL,659)@12
    assign u0_m0_wo0_wi0_r0_delayr126_cmp_b = {1'b0, u0_m0_wo0_wi0_r0_delayr126_rdmux_q};
    assign u0_m0_wo0_wi0_r0_delayr126_cmp_q = $unsigned(u0_m0_wo0_wi0_r0_delayr126_mem_last_q == u0_m0_wo0_wi0_r0_delayr126_cmp_b ? 1'b1 : 1'b0);

    // u0_m0_wo0_wi0_r0_delayr126_cmpReg(REG,660)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr126_cmpReg_q <= $unsigned(1'b0);
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr126_cmpReg_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr126_cmp_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr126_sticky_ena(REG,663)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr126_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (u0_m0_wo0_wi0_r0_delayr126_nor_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr126_sticky_ena_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr126_cmpReg_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr126_enaAnd(LOGICAL,664)@12
    assign u0_m0_wo0_wi0_r0_delayr126_enaAnd_q = u0_m0_wo0_wi0_r0_delayr126_sticky_ena_q & d_u0_m0_wo0_compute_q_12_q;

    // u0_m0_wo0_wi0_r0_delayr126_rdcnt(COUNTER,655)@12 + 1
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr126_rdcnt_i <= 2'd0;
        end
        else if (d_u0_m0_wo0_compute_q_12_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_delayr126_rdcnt_i <= $unsigned(u0_m0_wo0_wi0_r0_delayr126_rdcnt_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_delayr126_rdcnt_q = u0_m0_wo0_wi0_r0_delayr126_rdcnt_i[1:0];

    // u0_m0_wo0_wi0_r0_delayr126_rdmux(MUX,656)@12
    assign u0_m0_wo0_wi0_r0_delayr126_rdmux_s = d_u0_m0_wo0_compute_q_12_q;
    always @(u0_m0_wo0_wi0_r0_delayr126_rdmux_s or u0_m0_wo0_wi0_r0_delayr126_wraddr_q or u0_m0_wo0_wi0_r0_delayr126_rdcnt_q)
    begin
        unique case (u0_m0_wo0_wi0_r0_delayr126_rdmux_s)
            1'b0 : u0_m0_wo0_wi0_r0_delayr126_rdmux_q = u0_m0_wo0_wi0_r0_delayr126_wraddr_q;
            1'b1 : u0_m0_wo0_wi0_r0_delayr126_rdmux_q = u0_m0_wo0_wi0_r0_delayr126_rdcnt_q;
            default : u0_m0_wo0_wi0_r0_delayr126_rdmux_q = 2'b0;
        endcase
    end

    // u0_m0_wo0_wi0_r0_join126(BITJOIN,124)@12
    assign u0_m0_wo0_wi0_r0_join126_q = {u0_m0_wo0_wi0_r0_split126_d, u0_m0_wo0_wi0_r0_split126_c, u0_m0_wo0_wi0_r0_split126_b, u0_m0_wo0_wi0_r0_split122_e};

    // u0_m0_wo0_wi0_r0_delayr126_wraddr(REG,657)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_delayr126_wraddr_q <= $unsigned(2'b11);
        end
        else
        begin
            u0_m0_wo0_wi0_r0_delayr126_wraddr_q <= $unsigned(u0_m0_wo0_wi0_r0_delayr126_rdmux_q);
        end
    end

    // u0_m0_wo0_wi0_r0_delayr126_mem(DUALMEM,654)@12 + 2
    assign u0_m0_wo0_wi0_r0_delayr126_mem_ia = $unsigned(u0_m0_wo0_wi0_r0_join126_q);
    assign u0_m0_wo0_wi0_r0_delayr126_mem_aa = u0_m0_wo0_wi0_r0_delayr126_wraddr_q;
    assign u0_m0_wo0_wi0_r0_delayr126_mem_ab = u0_m0_wo0_wi0_r0_delayr126_rdmux_q;
    assign u0_m0_wo0_wi0_r0_delayr126_mem_ena_OrRstB = areset | u0_m0_wo0_wi0_r0_delayr126_enaAnd_q[0];
    assign u0_m0_wo0_wi0_r0_delayr126_mem_reset0 = areset;
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
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) u0_m0_wo0_wi0_r0_delayr126_mem_dmem (
        .clocken1(u0_m0_wo0_wi0_r0_delayr126_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(u0_m0_wo0_wi0_r0_delayr126_mem_reset0),
        .clock1(clk),
        .address_a(u0_m0_wo0_wi0_r0_delayr126_mem_aa),
        .data_a(u0_m0_wo0_wi0_r0_delayr126_mem_ia),
        .wren_a(d_u0_m0_wo0_compute_q_12_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_delayr126_mem_ab),
        .q_b(u0_m0_wo0_wi0_r0_delayr126_mem_iq),
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
    assign u0_m0_wo0_wi0_r0_delayr126_mem_q = u0_m0_wo0_wi0_r0_delayr126_mem_iq[63:0];

    // u0_m0_wo0_wi0_r0_split126(BITSELECT,125)@12
    assign u0_m0_wo0_wi0_r0_split126_b = $unsigned(u0_m0_wo0_wi0_r0_delayr126_mem_q[15:0]);
    assign u0_m0_wo0_wi0_r0_split126_c = $unsigned(u0_m0_wo0_wi0_r0_delayr126_mem_q[31:16]);
    assign u0_m0_wo0_wi0_r0_split126_d = $unsigned(u0_m0_wo0_wi0_r0_delayr126_mem_q[47:32]);
    assign u0_m0_wo0_wi0_r0_split126_e = $unsigned(u0_m0_wo0_wi0_r0_delayr126_mem_q[63:48]);

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // d_u0_m0_wo0_compute_q_15(DELAY,474)@12 + 3
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_compute_q_15_delay_0 <= $unsigned(d_u0_m0_wo0_compute_q_12_q);
            d_u0_m0_wo0_compute_q_15_delay_1 <= d_u0_m0_wo0_compute_q_15_delay_0;
            d_u0_m0_wo0_compute_q_15_q <= d_u0_m0_wo0_compute_q_15_delay_1;
        end
    end

    // d_u0_m0_wo0_compute_q_12(DELAY,473)@10 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_m0_wo0_compute_q_12_delay_0 <= '0;
        end
        else
        begin
            d_u0_m0_wo0_compute_q_12_delay_0 <= $unsigned(xIn_v);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_m0_wo0_compute_q_12_q <= d_u0_m0_wo0_compute_q_12_delay_0;
        end
    end

    // u0_m0_wo0_cma0(CHAINMULTADD,456)@12 + 5
    assign u0_m0_wo0_cma0_reset = areset;
    assign u0_m0_wo0_cma0_ena0 = d_u0_m0_wo0_compute_q_12_q[0] | u0_m0_wo0_cma0_reset;
    assign u0_m0_wo0_cma0_ena1 = d_u0_m0_wo0_compute_q_15_q[0] | u0_m0_wo0_cma0_reset;
    assign u0_m0_wo0_cma0_ena2 = 1'b1;

    assign u0_m0_wo0_cma0_a0 = $unsigned(u0_m0_wo0_wi0_r0_split126_e);
    assign u0_m0_wo0_cma0_b0 = $unsigned(u0_m0_wo0_wi0_r0_phasedelay0_q);
    assign u0_m0_wo0_cma0_c0 = $unsigned(u0_m0_wo0_cm0_q);
    assign u0_m0_wo0_cma0_a1 = $unsigned(u0_m0_wo0_wi0_r0_split126_d);
    assign u0_m0_wo0_cma0_b1 = $unsigned(u0_m0_wo0_wi0_r0_split1_b);
    assign u0_m0_wo0_cma0_c1 = $unsigned(u0_m0_wo0_cm1_q);
    assign u0_m0_wo0_cma0_a2 = $unsigned(u0_m0_wo0_wi0_r0_split126_c);
    assign u0_m0_wo0_cma0_b2 = $unsigned(u0_m0_wo0_wi0_r0_split1_c);
    assign u0_m0_wo0_cma0_c2 = $unsigned(u0_m0_wo0_cm2_q);
    assign u0_m0_wo0_cma0_a3 = $unsigned(u0_m0_wo0_wi0_r0_split126_b);
    assign u0_m0_wo0_cma0_b3 = $unsigned(u0_m0_wo0_wi0_r0_split1_d);
    assign u0_m0_wo0_cma0_c3 = $unsigned(u0_m0_wo0_cm3_q);
    assign u0_m0_wo0_cma0_a4 = $unsigned(u0_m0_wo0_wi0_r0_split122_e);
    assign u0_m0_wo0_cma0_b4 = $unsigned(u0_m0_wo0_wi0_r0_split1_e);
    assign u0_m0_wo0_cma0_c4 = $unsigned(u0_m0_wo0_cm4_q);
    assign u0_m0_wo0_cma0_a5 = $unsigned(u0_m0_wo0_wi0_r0_split122_d);
    assign u0_m0_wo0_cma0_b5 = $unsigned(u0_m0_wo0_wi0_r0_split5_b);
    assign u0_m0_wo0_cma0_c5 = $unsigned(u0_m0_wo0_cm5_q);
    assign u0_m0_wo0_cma0_a6 = $unsigned(u0_m0_wo0_wi0_r0_split122_c);
    assign u0_m0_wo0_cma0_b6 = $unsigned(u0_m0_wo0_wi0_r0_split5_c);
    assign u0_m0_wo0_cma0_c6 = $unsigned(u0_m0_wo0_cm6_q);
    assign u0_m0_wo0_cma0_a7 = $unsigned(u0_m0_wo0_wi0_r0_split122_b);
    assign u0_m0_wo0_cma0_b7 = $unsigned(u0_m0_wo0_wi0_r0_split5_d);
    assign u0_m0_wo0_cma0_c7 = $unsigned(u0_m0_wo0_cm7_q);
    assign u0_m0_wo0_cma0_a8 = $unsigned(u0_m0_wo0_wi0_r0_split118_e);
    assign u0_m0_wo0_cma0_b8 = $unsigned(u0_m0_wo0_wi0_r0_split5_e);
    assign u0_m0_wo0_cma0_c8 = $unsigned(u0_m0_wo0_cm8_q);
    assign u0_m0_wo0_cma0_a9 = $unsigned(u0_m0_wo0_wi0_r0_split118_d);
    assign u0_m0_wo0_cma0_b9 = $unsigned(u0_m0_wo0_wi0_r0_split9_b);
    assign u0_m0_wo0_cma0_c9 = $unsigned(u0_m0_wo0_cm9_q);
    assign u0_m0_wo0_cma0_a10 = $unsigned(u0_m0_wo0_wi0_r0_split118_c);
    assign u0_m0_wo0_cma0_b10 = $unsigned(u0_m0_wo0_wi0_r0_split9_c);
    assign u0_m0_wo0_cma0_c10 = $unsigned(u0_m0_wo0_cm10_q);
    assign u0_m0_wo0_cma0_a11 = $unsigned(u0_m0_wo0_wi0_r0_split118_b);
    assign u0_m0_wo0_cma0_b11 = $unsigned(u0_m0_wo0_wi0_r0_split9_d);
    assign u0_m0_wo0_cma0_c11 = $unsigned(u0_m0_wo0_cm11_q);
    assign u0_m0_wo0_cma0_a12 = $unsigned(u0_m0_wo0_wi0_r0_split114_e);
    assign u0_m0_wo0_cma0_b12 = $unsigned(u0_m0_wo0_wi0_r0_split9_e);
    assign u0_m0_wo0_cma0_c12 = $unsigned(u0_m0_wo0_cm12_q);
    assign u0_m0_wo0_cma0_a13 = $unsigned(u0_m0_wo0_wi0_r0_split114_d);
    assign u0_m0_wo0_cma0_b13 = $unsigned(u0_m0_wo0_wi0_r0_split13_b);
    assign u0_m0_wo0_cma0_c13 = $unsigned(u0_m0_wo0_cm13_q);
    assign u0_m0_wo0_cma0_a14 = $unsigned(u0_m0_wo0_wi0_r0_split114_c);
    assign u0_m0_wo0_cma0_b14 = $unsigned(u0_m0_wo0_wi0_r0_split13_c);
    assign u0_m0_wo0_cma0_c14 = $unsigned(u0_m0_wo0_cm14_q);
    assign u0_m0_wo0_cma0_a15 = $unsigned(u0_m0_wo0_wi0_r0_split114_b);
    assign u0_m0_wo0_cma0_b15 = $unsigned(u0_m0_wo0_wi0_r0_split13_d);
    assign u0_m0_wo0_cma0_c15 = $unsigned(u0_m0_wo0_cm15_q);
    assign u0_m0_wo0_cma0_a16 = $unsigned(u0_m0_wo0_wi0_r0_split110_e);
    assign u0_m0_wo0_cma0_b16 = $unsigned(u0_m0_wo0_wi0_r0_split13_e);
    assign u0_m0_wo0_cma0_c16 = $unsigned(u0_m0_wo0_cm16_q);
    assign u0_m0_wo0_cma0_a17 = $unsigned(u0_m0_wo0_wi0_r0_split110_d);
    assign u0_m0_wo0_cma0_b17 = $unsigned(u0_m0_wo0_wi0_r0_split17_b);
    assign u0_m0_wo0_cma0_c17 = $unsigned(u0_m0_wo0_cm17_q);
    assign u0_m0_wo0_cma0_a18 = $unsigned(u0_m0_wo0_wi0_r0_split110_c);
    assign u0_m0_wo0_cma0_b18 = $unsigned(u0_m0_wo0_wi0_r0_split17_c);
    assign u0_m0_wo0_cma0_c18 = $unsigned(u0_m0_wo0_cm18_q);
    assign u0_m0_wo0_cma0_a19 = $unsigned(u0_m0_wo0_wi0_r0_split110_b);
    assign u0_m0_wo0_cma0_b19 = $unsigned(u0_m0_wo0_wi0_r0_split17_d);
    assign u0_m0_wo0_cma0_c19 = $unsigned(u0_m0_wo0_cm19_q);
    assign u0_m0_wo0_cma0_a20 = $unsigned(u0_m0_wo0_wi0_r0_split106_e);
    assign u0_m0_wo0_cma0_b20 = $unsigned(u0_m0_wo0_wi0_r0_split17_e);
    assign u0_m0_wo0_cma0_c20 = $unsigned(u0_m0_wo0_cm20_q);
    assign u0_m0_wo0_cma0_a21 = $unsigned(u0_m0_wo0_wi0_r0_split106_d);
    assign u0_m0_wo0_cma0_b21 = $unsigned(u0_m0_wo0_wi0_r0_split21_b);
    assign u0_m0_wo0_cma0_c21 = $unsigned(u0_m0_wo0_cm21_q);
    assign u0_m0_wo0_cma0_a22 = $unsigned(u0_m0_wo0_wi0_r0_split106_c);
    assign u0_m0_wo0_cma0_b22 = $unsigned(u0_m0_wo0_wi0_r0_split21_c);
    assign u0_m0_wo0_cma0_c22 = $unsigned(u0_m0_wo0_cm22_q);
    assign u0_m0_wo0_cma0_a23 = $unsigned(u0_m0_wo0_wi0_r0_split106_b);
    assign u0_m0_wo0_cma0_b23 = $unsigned(u0_m0_wo0_wi0_r0_split21_d);
    assign u0_m0_wo0_cma0_c23 = $unsigned(u0_m0_wo0_cm23_q);
    assign u0_m0_wo0_cma0_a24 = $unsigned(u0_m0_wo0_wi0_r0_split102_e);
    assign u0_m0_wo0_cma0_b24 = $unsigned(u0_m0_wo0_wi0_r0_split21_e);
    assign u0_m0_wo0_cma0_c24 = $unsigned(u0_m0_wo0_cm24_q);
    assign u0_m0_wo0_cma0_a25 = $unsigned(u0_m0_wo0_wi0_r0_split102_d);
    assign u0_m0_wo0_cma0_b25 = $unsigned(u0_m0_wo0_wi0_r0_split25_b);
    assign u0_m0_wo0_cma0_c25 = $unsigned(u0_m0_wo0_cm25_q);
    assign u0_m0_wo0_cma0_a26 = $unsigned(u0_m0_wo0_wi0_r0_split102_c);
    assign u0_m0_wo0_cma0_b26 = $unsigned(u0_m0_wo0_wi0_r0_split25_c);
    assign u0_m0_wo0_cma0_c26 = $unsigned(u0_m0_wo0_cm26_q);
    assign u0_m0_wo0_cma0_a27 = $unsigned(u0_m0_wo0_wi0_r0_split102_b);
    assign u0_m0_wo0_cma0_b27 = $unsigned(u0_m0_wo0_wi0_r0_split25_d);
    assign u0_m0_wo0_cma0_c27 = $unsigned(u0_m0_wo0_cm27_q);
    assign u0_m0_wo0_cma0_a28 = $unsigned(u0_m0_wo0_wi0_r0_split98_e);
    assign u0_m0_wo0_cma0_b28 = $unsigned(u0_m0_wo0_wi0_r0_split25_e);
    assign u0_m0_wo0_cma0_c28 = $unsigned(u0_m0_wo0_cm28_q);
    assign u0_m0_wo0_cma0_a29 = $unsigned(u0_m0_wo0_wi0_r0_split98_d);
    assign u0_m0_wo0_cma0_b29 = $unsigned(u0_m0_wo0_wi0_r0_split29_b);
    assign u0_m0_wo0_cma0_c29 = $unsigned(u0_m0_wo0_cm29_q);
    assign u0_m0_wo0_cma0_a30 = $unsigned(u0_m0_wo0_wi0_r0_split98_c);
    assign u0_m0_wo0_cma0_b30 = $unsigned(u0_m0_wo0_wi0_r0_split29_c);
    assign u0_m0_wo0_cma0_c30 = $unsigned(u0_m0_wo0_cm30_q);
    assign u0_m0_wo0_cma0_a31 = $unsigned(u0_m0_wo0_wi0_r0_split98_b);
    assign u0_m0_wo0_cma0_b31 = $unsigned(u0_m0_wo0_wi0_r0_split29_d);
    assign u0_m0_wo0_cma0_c31 = $unsigned(u0_m0_wo0_cm31_q);
    assign u0_m0_wo0_cma0_a32 = $unsigned(u0_m0_wo0_wi0_r0_split94_e);
    assign u0_m0_wo0_cma0_b32 = $unsigned(u0_m0_wo0_wi0_r0_split29_e);
    assign u0_m0_wo0_cma0_c32 = $unsigned(u0_m0_wo0_cm32_q);
    assign u0_m0_wo0_cma0_a33 = $unsigned(u0_m0_wo0_wi0_r0_split94_d);
    assign u0_m0_wo0_cma0_b33 = $unsigned(u0_m0_wo0_wi0_r0_split33_b);
    assign u0_m0_wo0_cma0_c33 = $unsigned(u0_m0_wo0_cm33_q);
    assign u0_m0_wo0_cma0_a34 = $unsigned(u0_m0_wo0_wi0_r0_split94_c);
    assign u0_m0_wo0_cma0_b34 = $unsigned(u0_m0_wo0_wi0_r0_split33_c);
    assign u0_m0_wo0_cma0_c34 = $unsigned(u0_m0_wo0_cm34_q);
    assign u0_m0_wo0_cma0_a35 = $unsigned(u0_m0_wo0_wi0_r0_split94_b);
    assign u0_m0_wo0_cma0_b35 = $unsigned(u0_m0_wo0_wi0_r0_split33_d);
    assign u0_m0_wo0_cma0_c35 = $unsigned(u0_m0_wo0_cm35_q);
    assign u0_m0_wo0_cma0_a36 = $unsigned(u0_m0_wo0_wi0_r0_split90_e);
    assign u0_m0_wo0_cma0_b36 = $unsigned(u0_m0_wo0_wi0_r0_split33_e);
    assign u0_m0_wo0_cma0_c36 = $unsigned(u0_m0_wo0_cm36_q);
    assign u0_m0_wo0_cma0_a37 = $unsigned(u0_m0_wo0_wi0_r0_split90_d);
    assign u0_m0_wo0_cma0_b37 = $unsigned(u0_m0_wo0_wi0_r0_split37_b);
    assign u0_m0_wo0_cma0_c37 = $unsigned(u0_m0_wo0_cm37_q);
    assign u0_m0_wo0_cma0_a38 = $unsigned(u0_m0_wo0_wi0_r0_split90_c);
    assign u0_m0_wo0_cma0_b38 = $unsigned(u0_m0_wo0_wi0_r0_split37_c);
    assign u0_m0_wo0_cma0_c38 = $unsigned(u0_m0_wo0_cm38_q);
    assign u0_m0_wo0_cma0_a39 = $unsigned(u0_m0_wo0_wi0_r0_split90_b);
    assign u0_m0_wo0_cma0_b39 = $unsigned(u0_m0_wo0_wi0_r0_split37_d);
    assign u0_m0_wo0_cma0_c39 = $unsigned(u0_m0_wo0_cm39_q);
    assign u0_m0_wo0_cma0_a40 = $unsigned(u0_m0_wo0_wi0_r0_split86_e);
    assign u0_m0_wo0_cma0_b40 = $unsigned(u0_m0_wo0_wi0_r0_split37_e);
    assign u0_m0_wo0_cma0_c40 = $unsigned(u0_m0_wo0_cm40_q);
    assign u0_m0_wo0_cma0_a41 = $unsigned(u0_m0_wo0_wi0_r0_split86_d);
    assign u0_m0_wo0_cma0_b41 = $unsigned(u0_m0_wo0_wi0_r0_split41_b);
    assign u0_m0_wo0_cma0_c41 = $unsigned(u0_m0_wo0_cm41_q);
    assign u0_m0_wo0_cma0_a42 = $unsigned(u0_m0_wo0_wi0_r0_split86_c);
    assign u0_m0_wo0_cma0_b42 = $unsigned(u0_m0_wo0_wi0_r0_split41_c);
    assign u0_m0_wo0_cma0_c42 = $unsigned(u0_m0_wo0_cm42_q);
    assign u0_m0_wo0_cma0_a43 = $unsigned(u0_m0_wo0_wi0_r0_split86_b);
    assign u0_m0_wo0_cma0_b43 = $unsigned(u0_m0_wo0_wi0_r0_split41_d);
    assign u0_m0_wo0_cma0_c43 = $unsigned(u0_m0_wo0_cm43_q);
    assign u0_m0_wo0_cma0_a44 = $unsigned(u0_m0_wo0_wi0_r0_split82_e);
    assign u0_m0_wo0_cma0_b44 = $unsigned(u0_m0_wo0_wi0_r0_split41_e);
    assign u0_m0_wo0_cma0_c44 = $unsigned(u0_m0_wo0_cm44_q);
    assign u0_m0_wo0_cma0_a45 = $unsigned(u0_m0_wo0_wi0_r0_split82_d);
    assign u0_m0_wo0_cma0_b45 = $unsigned(u0_m0_wo0_wi0_r0_split45_b);
    assign u0_m0_wo0_cma0_c45 = $unsigned(u0_m0_wo0_cm45_q);
    assign u0_m0_wo0_cma0_a46 = $unsigned(u0_m0_wo0_wi0_r0_split82_c);
    assign u0_m0_wo0_cma0_b46 = $unsigned(u0_m0_wo0_wi0_r0_split45_c);
    assign u0_m0_wo0_cma0_c46 = $unsigned(u0_m0_wo0_cm46_q);
    assign u0_m0_wo0_cma0_a47 = $unsigned(u0_m0_wo0_wi0_r0_split82_b);
    assign u0_m0_wo0_cma0_b47 = $unsigned(u0_m0_wo0_wi0_r0_split45_d);
    assign u0_m0_wo0_cma0_c47 = $unsigned(u0_m0_wo0_cm47_q);
    assign u0_m0_wo0_cma0_a48 = $unsigned(u0_m0_wo0_wi0_r0_split78_e);
    assign u0_m0_wo0_cma0_b48 = $unsigned(u0_m0_wo0_wi0_r0_split45_e);
    assign u0_m0_wo0_cma0_c48 = $unsigned(u0_m0_wo0_cm48_q);
    assign u0_m0_wo0_cma0_a49 = $unsigned(u0_m0_wo0_wi0_r0_split78_d);
    assign u0_m0_wo0_cma0_b49 = $unsigned(u0_m0_wo0_wi0_r0_split49_b);
    assign u0_m0_wo0_cma0_c49 = $unsigned(u0_m0_wo0_cm49_q);
    assign u0_m0_wo0_cma0_a50 = $unsigned(u0_m0_wo0_wi0_r0_split78_c);
    assign u0_m0_wo0_cma0_b50 = $unsigned(u0_m0_wo0_wi0_r0_split49_c);
    assign u0_m0_wo0_cma0_c50 = $unsigned(u0_m0_wo0_cm50_q);
    assign u0_m0_wo0_cma0_a51 = $unsigned(u0_m0_wo0_wi0_r0_split78_b);
    assign u0_m0_wo0_cma0_b51 = $unsigned(u0_m0_wo0_wi0_r0_split49_d);
    assign u0_m0_wo0_cma0_c51 = $unsigned(u0_m0_wo0_cm51_q);
    assign u0_m0_wo0_cma0_a52 = $unsigned(u0_m0_wo0_wi0_r0_split74_e);
    assign u0_m0_wo0_cma0_b52 = $unsigned(u0_m0_wo0_wi0_r0_split49_e);
    assign u0_m0_wo0_cma0_c52 = $unsigned(u0_m0_wo0_cm52_q);
    assign u0_m0_wo0_cma0_a53 = $unsigned(u0_m0_wo0_wi0_r0_split74_d);
    assign u0_m0_wo0_cma0_b53 = $unsigned(u0_m0_wo0_wi0_r0_split53_b);
    assign u0_m0_wo0_cma0_c53 = $unsigned(u0_m0_wo0_cm53_q);
    assign u0_m0_wo0_cma0_a54 = $unsigned(u0_m0_wo0_wi0_r0_split74_c);
    assign u0_m0_wo0_cma0_b54 = $unsigned(u0_m0_wo0_wi0_r0_split53_c);
    assign u0_m0_wo0_cma0_c54 = $unsigned(u0_m0_wo0_cm54_q);
    assign u0_m0_wo0_cma0_a55 = $unsigned(u0_m0_wo0_wi0_r0_split74_b);
    assign u0_m0_wo0_cma0_b55 = $unsigned(u0_m0_wo0_wi0_r0_split53_d);
    assign u0_m0_wo0_cma0_c55 = $unsigned(u0_m0_wo0_cm55_q);
    assign u0_m0_wo0_cma0_a56 = $unsigned(u0_m0_wo0_wi0_r0_split70_e);
    assign u0_m0_wo0_cma0_b56 = $unsigned(u0_m0_wo0_wi0_r0_split53_e);
    assign u0_m0_wo0_cma0_c56 = $unsigned(u0_m0_wo0_cm56_q);
    assign u0_m0_wo0_cma0_a57 = $unsigned(u0_m0_wo0_wi0_r0_split70_d);
    assign u0_m0_wo0_cma0_b57 = $unsigned(u0_m0_wo0_wi0_r0_split57_b);
    assign u0_m0_wo0_cma0_c57 = $unsigned(u0_m0_wo0_cm57_q);
    assign u0_m0_wo0_cma0_a58 = $unsigned(u0_m0_wo0_wi0_r0_split70_c);
    assign u0_m0_wo0_cma0_b58 = $unsigned(u0_m0_wo0_wi0_r0_split57_c);
    assign u0_m0_wo0_cma0_c58 = $unsigned(u0_m0_wo0_cm58_q);
    assign u0_m0_wo0_cma0_a59 = $unsigned(u0_m0_wo0_wi0_r0_split70_b);
    assign u0_m0_wo0_cma0_b59 = $unsigned(u0_m0_wo0_wi0_r0_split57_d);
    assign u0_m0_wo0_cma0_c59 = $unsigned(u0_m0_wo0_cm59_q);
    assign u0_m0_wo0_cma0_a60 = $unsigned(u0_m0_wo0_wi0_r0_split66_e);
    assign u0_m0_wo0_cma0_b60 = $unsigned(u0_m0_wo0_wi0_r0_split57_e);
    assign u0_m0_wo0_cma0_c60 = $unsigned(u0_m0_wo0_cm60_q);
    assign u0_m0_wo0_cma0_a61 = $unsigned(u0_m0_wo0_wi0_r0_split66_d);
    assign u0_m0_wo0_cma0_b61 = $unsigned(u0_m0_wo0_wi0_r0_split61_b);
    assign u0_m0_wo0_cma0_c61 = $unsigned(u0_m0_wo0_cm61_q);
    assign u0_m0_wo0_cma0_a62 = $unsigned(u0_m0_wo0_wi0_r0_split66_c);
    assign u0_m0_wo0_cma0_b62 = $unsigned(u0_m0_wo0_wi0_r0_split61_c);
    assign u0_m0_wo0_cma0_c62 = $unsigned(u0_m0_wo0_cm62_q);
    assign u0_m0_wo0_cma0_a63 = $unsigned(u0_m0_wo0_wi0_r0_split66_b);
    assign u0_m0_wo0_cma0_b63 = $unsigned(u0_m0_wo0_wi0_r0_split61_d);
    assign u0_m0_wo0_cma0_c63 = $unsigned(u0_m0_wo0_cm63_q);
    assign u0_m0_wo0_cma0_a64 = $unsigned($signed({15'b000000000000000, GND_q[0:0]}));
    assign u0_m0_wo0_cma0_b64 = $unsigned(u0_m0_wo0_wi0_r0_split61_e);
    assign u0_m0_wo0_cma0_c64 = $unsigned(u0_m0_wo0_cm64_q);
    assign u0_m0_wo0_cma0_a65 = 16'b0;
    assign u0_m0_wo0_cma0_b65 = 16'b0;
    assign u0_m0_wo0_cma0_c65 = 16'b0;
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP32 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a65),
        .by(u0_m0_wo0_cma0_a64),
        .az(u0_m0_wo0_cma0_b65),
        .bz(u0_m0_wo0_cma0_b64),
        .ax(u0_m0_wo0_cma0_c65),
        .bx(u0_m0_wo0_cma0_c64),
        .chainout(u0_m0_wo0_cma0_s64),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainin(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP31 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a63),
        .by(u0_m0_wo0_cma0_a62),
        .az(u0_m0_wo0_cma0_b63),
        .bz(u0_m0_wo0_cma0_b62),
        .ax(u0_m0_wo0_cma0_c63),
        .bx(u0_m0_wo0_cma0_c62),
        .chainin(u0_m0_wo0_cma0_s64),
        .chainout(u0_m0_wo0_cma0_s62),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP30 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a61),
        .by(u0_m0_wo0_cma0_a60),
        .az(u0_m0_wo0_cma0_b61),
        .bz(u0_m0_wo0_cma0_b60),
        .ax(u0_m0_wo0_cma0_c61),
        .bx(u0_m0_wo0_cma0_c60),
        .chainin(u0_m0_wo0_cma0_s62),
        .chainout(u0_m0_wo0_cma0_s60),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP29 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a59),
        .by(u0_m0_wo0_cma0_a58),
        .az(u0_m0_wo0_cma0_b59),
        .bz(u0_m0_wo0_cma0_b58),
        .ax(u0_m0_wo0_cma0_c59),
        .bx(u0_m0_wo0_cma0_c58),
        .chainin(u0_m0_wo0_cma0_s60),
        .chainout(u0_m0_wo0_cma0_s58),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP28 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a57),
        .by(u0_m0_wo0_cma0_a56),
        .az(u0_m0_wo0_cma0_b57),
        .bz(u0_m0_wo0_cma0_b56),
        .ax(u0_m0_wo0_cma0_c57),
        .bx(u0_m0_wo0_cma0_c56),
        .chainin(u0_m0_wo0_cma0_s58),
        .chainout(u0_m0_wo0_cma0_s56),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP27 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a55),
        .by(u0_m0_wo0_cma0_a54),
        .az(u0_m0_wo0_cma0_b55),
        .bz(u0_m0_wo0_cma0_b54),
        .ax(u0_m0_wo0_cma0_c55),
        .bx(u0_m0_wo0_cma0_c54),
        .chainin(u0_m0_wo0_cma0_s56),
        .chainout(u0_m0_wo0_cma0_s54),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP26 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a53),
        .by(u0_m0_wo0_cma0_a52),
        .az(u0_m0_wo0_cma0_b53),
        .bz(u0_m0_wo0_cma0_b52),
        .ax(u0_m0_wo0_cma0_c53),
        .bx(u0_m0_wo0_cma0_c52),
        .chainin(u0_m0_wo0_cma0_s54),
        .chainout(u0_m0_wo0_cma0_s52),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP25 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a51),
        .by(u0_m0_wo0_cma0_a50),
        .az(u0_m0_wo0_cma0_b51),
        .bz(u0_m0_wo0_cma0_b50),
        .ax(u0_m0_wo0_cma0_c51),
        .bx(u0_m0_wo0_cma0_c50),
        .chainin(u0_m0_wo0_cma0_s52),
        .chainout(u0_m0_wo0_cma0_s50),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP24 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a49),
        .by(u0_m0_wo0_cma0_a48),
        .az(u0_m0_wo0_cma0_b49),
        .bz(u0_m0_wo0_cma0_b48),
        .ax(u0_m0_wo0_cma0_c49),
        .bx(u0_m0_wo0_cma0_c48),
        .chainin(u0_m0_wo0_cma0_s50),
        .chainout(u0_m0_wo0_cma0_s48),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP23 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a47),
        .by(u0_m0_wo0_cma0_a46),
        .az(u0_m0_wo0_cma0_b47),
        .bz(u0_m0_wo0_cma0_b46),
        .ax(u0_m0_wo0_cma0_c47),
        .bx(u0_m0_wo0_cma0_c46),
        .chainin(u0_m0_wo0_cma0_s48),
        .chainout(u0_m0_wo0_cma0_s46),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP22 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a45),
        .by(u0_m0_wo0_cma0_a44),
        .az(u0_m0_wo0_cma0_b45),
        .bz(u0_m0_wo0_cma0_b44),
        .ax(u0_m0_wo0_cma0_c45),
        .bx(u0_m0_wo0_cma0_c44),
        .chainin(u0_m0_wo0_cma0_s46),
        .chainout(u0_m0_wo0_cma0_s44),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP21 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a43),
        .by(u0_m0_wo0_cma0_a42),
        .az(u0_m0_wo0_cma0_b43),
        .bz(u0_m0_wo0_cma0_b42),
        .ax(u0_m0_wo0_cma0_c43),
        .bx(u0_m0_wo0_cma0_c42),
        .chainin(u0_m0_wo0_cma0_s44),
        .chainout(u0_m0_wo0_cma0_s42),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP20 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a41),
        .by(u0_m0_wo0_cma0_a40),
        .az(u0_m0_wo0_cma0_b41),
        .bz(u0_m0_wo0_cma0_b40),
        .ax(u0_m0_wo0_cma0_c41),
        .bx(u0_m0_wo0_cma0_c40),
        .chainin(u0_m0_wo0_cma0_s42),
        .chainout(u0_m0_wo0_cma0_s40),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP19 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a39),
        .by(u0_m0_wo0_cma0_a38),
        .az(u0_m0_wo0_cma0_b39),
        .bz(u0_m0_wo0_cma0_b38),
        .ax(u0_m0_wo0_cma0_c39),
        .bx(u0_m0_wo0_cma0_c38),
        .chainin(u0_m0_wo0_cma0_s40),
        .chainout(u0_m0_wo0_cma0_s38),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP18 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a37),
        .by(u0_m0_wo0_cma0_a36),
        .az(u0_m0_wo0_cma0_b37),
        .bz(u0_m0_wo0_cma0_b36),
        .ax(u0_m0_wo0_cma0_c37),
        .bx(u0_m0_wo0_cma0_c36),
        .chainin(u0_m0_wo0_cma0_s38),
        .chainout(u0_m0_wo0_cma0_s36),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP17 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a35),
        .by(u0_m0_wo0_cma0_a34),
        .az(u0_m0_wo0_cma0_b35),
        .bz(u0_m0_wo0_cma0_b34),
        .ax(u0_m0_wo0_cma0_c35),
        .bx(u0_m0_wo0_cma0_c34),
        .chainin(u0_m0_wo0_cma0_s36),
        .chainout(u0_m0_wo0_cma0_s34),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP16 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a33),
        .by(u0_m0_wo0_cma0_a32),
        .az(u0_m0_wo0_cma0_b33),
        .bz(u0_m0_wo0_cma0_b32),
        .ax(u0_m0_wo0_cma0_c33),
        .bx(u0_m0_wo0_cma0_c32),
        .chainin(u0_m0_wo0_cma0_s34),
        .chainout(u0_m0_wo0_cma0_s32),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP15 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a31),
        .by(u0_m0_wo0_cma0_a30),
        .az(u0_m0_wo0_cma0_b31),
        .bz(u0_m0_wo0_cma0_b30),
        .ax(u0_m0_wo0_cma0_c31),
        .bx(u0_m0_wo0_cma0_c30),
        .chainin(u0_m0_wo0_cma0_s32),
        .chainout(u0_m0_wo0_cma0_s30),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP14 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a29),
        .by(u0_m0_wo0_cma0_a28),
        .az(u0_m0_wo0_cma0_b29),
        .bz(u0_m0_wo0_cma0_b28),
        .ax(u0_m0_wo0_cma0_c29),
        .bx(u0_m0_wo0_cma0_c28),
        .chainin(u0_m0_wo0_cma0_s30),
        .chainout(u0_m0_wo0_cma0_s28),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP13 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a27),
        .by(u0_m0_wo0_cma0_a26),
        .az(u0_m0_wo0_cma0_b27),
        .bz(u0_m0_wo0_cma0_b26),
        .ax(u0_m0_wo0_cma0_c27),
        .bx(u0_m0_wo0_cma0_c26),
        .chainin(u0_m0_wo0_cma0_s28),
        .chainout(u0_m0_wo0_cma0_s26),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP12 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a25),
        .by(u0_m0_wo0_cma0_a24),
        .az(u0_m0_wo0_cma0_b25),
        .bz(u0_m0_wo0_cma0_b24),
        .ax(u0_m0_wo0_cma0_c25),
        .bx(u0_m0_wo0_cma0_c24),
        .chainin(u0_m0_wo0_cma0_s26),
        .chainout(u0_m0_wo0_cma0_s24),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP11 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a23),
        .by(u0_m0_wo0_cma0_a22),
        .az(u0_m0_wo0_cma0_b23),
        .bz(u0_m0_wo0_cma0_b22),
        .ax(u0_m0_wo0_cma0_c23),
        .bx(u0_m0_wo0_cma0_c22),
        .chainin(u0_m0_wo0_cma0_s24),
        .chainout(u0_m0_wo0_cma0_s22),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP10 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a21),
        .by(u0_m0_wo0_cma0_a20),
        .az(u0_m0_wo0_cma0_b21),
        .bz(u0_m0_wo0_cma0_b20),
        .ax(u0_m0_wo0_cma0_c21),
        .bx(u0_m0_wo0_cma0_c20),
        .chainin(u0_m0_wo0_cma0_s22),
        .chainout(u0_m0_wo0_cma0_s20),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP9 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a19),
        .by(u0_m0_wo0_cma0_a18),
        .az(u0_m0_wo0_cma0_b19),
        .bz(u0_m0_wo0_cma0_b18),
        .ax(u0_m0_wo0_cma0_c19),
        .bx(u0_m0_wo0_cma0_c18),
        .chainin(u0_m0_wo0_cma0_s20),
        .chainout(u0_m0_wo0_cma0_s18),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP8 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a17),
        .by(u0_m0_wo0_cma0_a16),
        .az(u0_m0_wo0_cma0_b17),
        .bz(u0_m0_wo0_cma0_b16),
        .ax(u0_m0_wo0_cma0_c17),
        .bx(u0_m0_wo0_cma0_c16),
        .chainin(u0_m0_wo0_cma0_s18),
        .chainout(u0_m0_wo0_cma0_s16),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP7 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a15),
        .by(u0_m0_wo0_cma0_a14),
        .az(u0_m0_wo0_cma0_b15),
        .bz(u0_m0_wo0_cma0_b14),
        .ax(u0_m0_wo0_cma0_c15),
        .bx(u0_m0_wo0_cma0_c14),
        .chainin(u0_m0_wo0_cma0_s16),
        .chainout(u0_m0_wo0_cma0_s14),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP6 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a13),
        .by(u0_m0_wo0_cma0_a12),
        .az(u0_m0_wo0_cma0_b13),
        .bz(u0_m0_wo0_cma0_b12),
        .ax(u0_m0_wo0_cma0_c13),
        .bx(u0_m0_wo0_cma0_c12),
        .chainin(u0_m0_wo0_cma0_s14),
        .chainout(u0_m0_wo0_cma0_s12),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP5 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a11),
        .by(u0_m0_wo0_cma0_a10),
        .az(u0_m0_wo0_cma0_b11),
        .bz(u0_m0_wo0_cma0_b10),
        .ax(u0_m0_wo0_cma0_c11),
        .bx(u0_m0_wo0_cma0_c10),
        .chainin(u0_m0_wo0_cma0_s12),
        .chainout(u0_m0_wo0_cma0_s10),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP4 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a9),
        .by(u0_m0_wo0_cma0_a8),
        .az(u0_m0_wo0_cma0_b9),
        .bz(u0_m0_wo0_cma0_b8),
        .ax(u0_m0_wo0_cma0_c9),
        .bx(u0_m0_wo0_cma0_c8),
        .chainin(u0_m0_wo0_cma0_s10),
        .chainout(u0_m0_wo0_cma0_s8),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP3 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a7),
        .by(u0_m0_wo0_cma0_a6),
        .az(u0_m0_wo0_cma0_b7),
        .bz(u0_m0_wo0_cma0_b6),
        .ax(u0_m0_wo0_cma0_c7),
        .bx(u0_m0_wo0_cma0_c6),
        .chainin(u0_m0_wo0_cma0_s8),
        .chainout(u0_m0_wo0_cma0_s6),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP2 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a5),
        .by(u0_m0_wo0_cma0_a4),
        .az(u0_m0_wo0_cma0_b5),
        .bz(u0_m0_wo0_cma0_b4),
        .ax(u0_m0_wo0_cma0_c5),
        .bx(u0_m0_wo0_cma0_c4),
        .chainin(u0_m0_wo0_cma0_s6),
        .chainout(u0_m0_wo0_cma0_s4),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1")
    ) u0_m0_wo0_cma0_DSP1 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a3),
        .by(u0_m0_wo0_cma0_a2),
        .az(u0_m0_wo0_cma0_b3),
        .bz(u0_m0_wo0_cma0_b2),
        .ax(u0_m0_wo0_cma0_c3),
        .bx(u0_m0_wo0_cma0_c2),
        .chainin(u0_m0_wo0_cma0_s4),
        .chainout(u0_m0_wo0_cma0_s2),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .disable_scanin(),
        .disable_chainout(),
        .resulta(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    tennm_mac #(
        .operation_mode("m18x18_systolic"),
        .chain_inout_width(44),
        .clear_type("sclr"),
        .use_chainadder("true"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(16),
        .by_clken("0"),
        .by_width(16),
        .operand_source_may("preadder"),
        .operand_source_mby("preadder"),
        .az_clken("0"),
        .bz_clken("0"),
        .az_width(16),
        .bz_width(16),
        .ax_clken("0"),
        .bx_clken("0"),
        .ax_width(16),
        .bx_width(16),
        .signed_may("true"),
        .signed_mby("true"),
        .signed_max("true"),
        .signed_mbx("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .input_systolic_clken("2"),
        .output_clken("1"),
        .result_a_width(40)
    ) u0_m0_wo0_cma0_DSP0 (
        .clk(clk),
        .ena({ u0_m0_wo0_cma0_ena2, u0_m0_wo0_cma0_ena1, u0_m0_wo0_cma0_ena0 }),
        .clr({ u0_m0_wo0_cma0_reset, u0_m0_wo0_cma0_reset }),
        .ay(u0_m0_wo0_cma0_a1),
        .by(u0_m0_wo0_cma0_a0),
        .az(u0_m0_wo0_cma0_b1),
        .bz(u0_m0_wo0_cma0_b0),
        .ax(u0_m0_wo0_cma0_c1),
        .bx(u0_m0_wo0_cma0_c0),
        .chainin(u0_m0_wo0_cma0_s2),
        .resulta(u0_m0_wo0_cma0_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .coefsela(),
        .coefselb(),
        .cx(),
        .cy(),
        .dx(),
        .dy(),
        .scanin(),
        .scanout(),
        .chainout(),
        .disable_scanin(),
        .disable_chainout(),
        .resultb(),
        .dfxlfsrena(),
        .dfxmisrena()
    );
    dspba_delay_ver #( .width(40), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_m0_wo0_cma0_delay0 ( .xin(u0_m0_wo0_cma0_s0), .xout(u0_m0_wo0_cma0_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_m0_wo0_cma0_q = $unsigned(u0_m0_wo0_cma0_qq0[39:0]);

    // u0_m0_wo0_sys_delay(DELAY,457)@15
    dspba_delay_ver #( .width(1), .depth(64), .reset_kind("SYNC"), .phase(5), .modulus(1) )
    u0_m0_wo0_sys_delay ( .xin(d_u0_m0_wo0_compute_q_15_q), .xout(u0_m0_wo0_sys_delay_q), .ena(d_u0_m0_wo0_compute_q_15_q[0]), .clk(clk), .aclr(areset) );

    // u0_m0_wo0_sys_and(LOGICAL,458)@15
    assign u0_m0_wo0_sys_and_q = u0_m0_wo0_sys_delay_q & d_u0_m0_wo0_compute_q_15_q;

    // u0_m0_wo0_oseq_gated_reg(REG,459)@15 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_m0_wo0_oseq_gated_reg_q <= $unsigned(1'b0);
        end
        else
        begin
            u0_m0_wo0_oseq_gated_reg_q <= $unsigned(u0_m0_wo0_sys_and_q);
        end
    end

    // outchan(COUNTER,464)@16 + 1
    // low=0, high=3, step=1, init=3
    always @ (posedge clk)
    begin
        if (areset)
        begin
            outchan_i <= 2'd3;
        end
        else if (u0_m0_wo0_oseq_gated_reg_q == 1'b1)
        begin
            outchan_i <= $unsigned(outchan_i) + $unsigned(2'd1);
        end
    end
    assign outchan_q = {1'b0, outchan_i[1:0]};

    // d_out0_m0_wo0_assign_id3_q_17(DELAY,475)@16 + 1
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_out0_m0_wo0_assign_id3_q_17_q <= $unsigned(u0_m0_wo0_oseq_gated_reg_q);
        end
    end

    // xOut(PORTOUT,465)@17 + 1
    assign xOut_v = d_out0_m0_wo0_assign_id3_q_17_q;
    assign xOut_c = {5'b00000, outchan_q};
    assign xOut_0 = u0_m0_wo0_cma0_q;

endmodule
