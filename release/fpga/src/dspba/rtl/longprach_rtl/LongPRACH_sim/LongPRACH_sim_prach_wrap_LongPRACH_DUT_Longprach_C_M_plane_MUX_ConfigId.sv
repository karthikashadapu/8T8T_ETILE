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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId (
    input wire [0:0] in_2_vin0_tpl,
    input wire [7:0] in_3_chin0_tpl,
    input wire [15:0] in_1_real_din0_tpl,
    input wire [15:0] in_1_imag_din0_tpl,
    input wire [20:0] in_7_cp_len_tpl,
    input wire [20:0] in_8_offset_tpl,
    input wire [0:0] in_9_c_m_plane_sel_tpl,
    input wire [0:0] in_10_prach_tech_tpl,
    input wire [15:0] in_11_prcah_sym_start_tpl,
    input wire [18:0] in_12_prcah_sym_end_tpl,
    input wire [6:0] in_13_prach_out_start_tpl,
    input wire [9:0] in_14_prach_out_end_tpl,
    input wire [7:0] in_5_SubFrame_tpl,
    input wire [15:0] in_6_prach_config_index_tpl,
    input wire [11:0] in_4_SFN_tpl,
    input wire [3:0] in_15_start_sym_tpl,
    input wire [7:0] in_16_Subframe_cplane_tpl,
    input wire [11:0] in_17_SFN_cplane_tpl,
    output wire [0:0] out_2_vout_tpl,
    output wire [7:0] out_3_cout_tpl,
    output wire [15:0] out_1_real_dout_tpl,
    output wire [15:0] out_1_imag_dout_tpl,
    output wire [31:0] out_4_TimeReference_tpl,
    output wire [21:0] out_5_cp_start_tpl,
    output wire [22:0] out_6_gt_end_tpl,
    output wire [6:0] out_7_prach_outstart_tpl,
    output wire [9:0] out_8_prach_outend_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [21:0] Add_a;
    wire [21:0] Add_b;
    wire [21:0] Add_i;
    wire [21:0] Add_a1;
    wire [21:0] Add_b1;
    logic [21:0] Add_o;
    wire [21:0] Add_q;
    wire [22:0] Add1_a;
    wire [22:0] Add1_b;
    logic [22:0] Add1_o;
    wire [22:0] Add1_q;
    wire [0:0] And_rsrvd_fix_q;
    wire [0:0] And1_q;
    wire [31:0] BitCombine_q;
    wire [0:0] CmpNE_q;
    wire [14:0] Const1_q;
    wire [15:0] Const2_q;
    wire [20:0] Const4_q;
    wire [0:0] Mux_s;
    reg [21:0] Mux_q;
    wire [0:0] Mux1_s;
    reg [0:0] Mux1_q;
    wire [0:0] Mux2_s;
    reg [22:0] Mux2_q;
    wire [0:0] Mux3_s;
    reg [0:0] Mux3_q;
    wire [0:0] Mux4_s;
    reg [3:0] Mux4_q;
    wire [3:0] maxsym_q;
    wire [2:0] rsvd_q;
    wire [3:0] startofsym_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And1_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And2_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And2_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_BitExtract_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ1_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ10_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ10_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ10_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ11_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ11_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ11_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ12_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ12_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ12_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ3_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ3_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ3_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ4_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ4_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ4_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ5_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ5_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ5_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ6_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ6_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ6_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ7_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ7_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ7_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ8_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ8_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ8_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ9_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ9_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ9_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_Not_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_Or_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_Or1_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_And1_x_q;
    wire [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ_x_a;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ1_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ1_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ2_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ2_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ3_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ3_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ4_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ4_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ5_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ5_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Or_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Or_x_q;
    wire [17:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_x_a;
    wire [17:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_x_b;
    logic [17:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_x_o;
    wire [17:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_s;
    reg [15:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Or_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Or_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch1_latch_0L_Mux_x_s;
    reg [20:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch1_latch_0L_Mux_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch2_latch_0L_Mux_x_s;
    reg [20:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch2_latch_0L_Mux_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_latch_0L_Mux_x_s;
    reg [15:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_latch_0L_Mux_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_CmpEQ4_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_CmpEQ4_x_q;
    wire [17:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Const4_x_q;
    wire [18:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Const5_x_q;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Const6_x_q;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_running;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_pending;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_v;
    reg [17:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_q0;
    reg [17:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_e0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_f0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_l0;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_running;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_pending;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_v;
    reg [18:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_q0;
    reg [18:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_e0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_f0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_l0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Mux_x_s;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Mux_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_delay_valid_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_And_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_And_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_CmpEQ_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_CmpEQ1_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_latch_0L_Mux_x_s;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_latch_0L_Mux_x_q;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_CmpEQ3_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_CmpEQ3_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_delay_valid1_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_Or_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_Or_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_latch_0L_Mux_x_s;
    reg [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_latch_0L_Mux_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_CmpEQ_x_q;
    wire [13:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Const6_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Mux4_x_s;
    reg [21:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Mux4_x_q;
    wire [22:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_x_a;
    wire [22:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_x_b;
    logic [22:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_x_o;
    wire [22:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_x_q;
    wire [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_PostCast_primWireOut_sel_x_b;
    wire [20:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_PostCast_primWireOut_sel_x_b;
    wire [3:0] normYNoLeadOne_uid192_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in;
    wire [3:0] normYNoLeadOne_uid192_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [4:0] normYIsOneC2_uid193_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_a;
    wire [0:0] normYIsOneC2_uid193_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [0:0] normYIsOneC2_uid196_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [0:0] normYIsOne_uid197_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [4:0] yIsZero_uid198_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [0:0] yIsZero_uid198_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    reg [17:0] invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [17:0] oneInvRes_uid202_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [0:0] invResPostOneHandling2_uid203_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s;
    reg [17:0] invResPostOneHandling2_uid203_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [2:0] cWOut_uid204_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [3:0] rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_a;
    wire [3:0] rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    logic [3:0] rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_o;
    wire [3:0] rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [28:0] prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in;
    wire [17:0] prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [0:0] allOnes_uid209_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_qi;
    reg [0:0] allOnes_uid209_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [0:0] invAllOnes_uid211_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [18:0] prodPostRightShiftPostRnd_uid213_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_a;
    wire [18:0] prodPostRightShiftPostRnd_uid213_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    logic [18:0] prodPostRightShiftPostRnd_uid213_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_o;
    wire [18:0] prodPostRightShiftPostRnd_uid213_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [17:0] prodPostRightShiftPostRndRange_uid214_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in;
    wire [16:0] prodPostRightShiftPostRndRange_uid214_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [16:0] cstValOvf_uid215_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [0:0] resFinal_uid216_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s;
    reg [16:0] resFinal_uid216_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [3:0] rVStage_uid219_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [0:0] vCount_uid220_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [2:0] mO_uid221_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [0:0] vStage_uid222_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in;
    wire [0:0] vStage_uid222_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [3:0] cStage_uid223_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [0:0] vStagei_uid225_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s;
    reg [3:0] vStagei_uid225_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [1:0] zs_uid226_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [0:0] vCount_uid228_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [0:0] vStagei_uid231_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s;
    reg [1:0] vStagei_uid231_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [0:0] rVStage_uid233_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [0:0] vCount_uid234_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [2:0] r_uid235_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [4:0] updatedY_uid194_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_const_q;
    wire [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Convert1_rnd_x_sel_b;
    wire [25:0] LShift_fs_q;
    wire [25:0] LShift_fs_qint;
    wire [26:0] LShift1_fs_q;
    wire [26:0] LShift1_fs_qint;
    wire startsym_lutmem_reset0;
    wire startsym_lutmem_ena_NotRstA;
    wire [3:0] startsym_lutmem_ia;
    wire [8:0] startsym_lutmem_aa;
    wire [8:0] startsym_lutmem_ab;
    wire [3:0] startsym_lutmem_ir;
    wire [3:0] startsym_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_ia;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_aa;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_ia;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_aa;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_ia;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_aa;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_ia;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_aa;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_ia;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_aa;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_ia;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_aa;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_ia;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_aa;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_ia;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_aa;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_ia;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_aa;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_ia;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_aa;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_ena_NotRstA;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_ia;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_aa;
    wire [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_ab;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_ir;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_ia;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_aa;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_ia;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_aa;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_ia;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_aa;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_ia;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_aa;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_ena_NotRstA;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_ia;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_aa;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_ab;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_ir;
    wire [3:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_ena_NotRstA;
    wire [4:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_ia;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_aa;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_ab;
    wire [4:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_ir;
    wire [4:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_reset0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_ena_NotRstA;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_ia;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_aa;
    wire [8:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_ab;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_ir;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_r;
    wire [2:0] leftShiftStage0Idx1Rng2_uid291_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in;
    wire [2:0] leftShiftStage0Idx1Rng2_uid291_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [4:0] leftShiftStage0Idx1_uid292_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [4:0] leftShiftStage0Idx2_uid295_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [1:0] leftShiftStage0_uid298_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s;
    reg [4:0] leftShiftStage0_uid298_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [3:0] leftShiftStage1Idx1Rng1_uid300_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in;
    wire [3:0] leftShiftStage1Idx1Rng1_uid300_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [4:0] leftShiftStage1Idx1_uid301_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [0:0] leftShiftStage1_uid303_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s;
    reg [4:0] leftShiftStage1_uid303_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [28:0] rightShiftStage0Idx1Rng1_uid307_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [29:0] rightShiftStage0Idx1_uid309_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [27:0] rightShiftStage0Idx2Rng2_uid310_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [29:0] rightShiftStage0Idx2_uid312_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [26:0] rightShiftStage0Idx3Rng3_uid313_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [29:0] rightShiftStage0Idx3_uid315_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [1:0] rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s;
    reg [29:0] rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [25:0] rightShiftStage1Idx1Rng4_uid318_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [29:0] rightShiftStage1Idx1_uid320_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [21:0] rightShiftStage1Idx2Rng8_uid321_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [7:0] rightShiftStage1Idx2Pad8_uid322_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [29:0] rightShiftStage1Idx2_uid323_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [17:0] rightShiftStage1Idx3Rng12_uid324_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
    wire [11:0] rightShiftStage1Idx3Pad12_uid325_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [29:0] rightShiftStage1Idx3_uid326_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire [1:0] rightShiftStage1_uid328_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s;
    reg [29:0] rightShiftStage1_uid328_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_reset;
    (* preserve_syn_only *) reg [4:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ah [0:0];
    (* preserve_syn_only *) reg [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ch [0:0];
    wire [4:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_a0;
    wire [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_c0;
    wire [16:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_s0;
    wire [16:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_qq0;
    reg [16:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_q;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ena0;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ena1;
    wire LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ena2;
    wire prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_reset;
    (* preserve_syn_only *) reg [11:0] prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ah [0:0];
    (* preserve_syn_only *) reg [17:0] prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ch [0:0];
    wire [11:0] prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_a0;
    wire [17:0] prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_c0;
    wire [29:0] prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_s0;
    wire [29:0] prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_qq0;
    reg [29:0] prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_q;
    wire prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ena0;
    wire prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ena1;
    wire prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ena2;
    wire [1:0] rightShiftStageSel0Dto0_uid316_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_b;
    wire [1:0] rightShiftStageSel0Dto0_uid316_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_c;
    wire [1:0] rVStage_uid227_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_b;
    wire [1:0] rVStage_uid227_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_c;
    wire [1:0] leftShiftStageSel0Dto1_uid297_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_b;
    wire [0:0] leftShiftStageSel0Dto1_uid297_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_c;
    reg [0:0] redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_r_18_q;
    reg [4:0] redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_1_q;
    reg [4:0] redist3_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_11_q;
    reg [0:0] redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_r_1_q;
    reg [11:0] redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Convert1_rnd_x_sel_b_1_q;
    reg [2:0] redist6_r_uid235_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_6_q;
    reg [0:0] redist7_vStage_uid222_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_1_q;
    reg [0:0] redist8_vCount_uid220_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_1_q;
    reg [17:0] redist9_prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_1_q;
    reg [17:0] redist10_prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_2_q;
    reg [11:0] redist11_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_PostCast_primWireOut_sel_x_b_1_q;
    reg [0:0] redist12_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_And_x_q_21_q;
    reg [0:0] redist13_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_CmpEQ4_x_q_19_q;
    reg [0:0] redist14_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Or_x_q_18_q;
    reg [0:0] redist15_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And2_x_q_17_q;
    reg [0:0] redist16_ChannelIn_cunroll_x_in_2_vin0_tpl_22_q;
    reg [0:0] redist20_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_3_q;
    reg [0:0] redist20_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_3_delay_0;
    reg [0:0] redist20_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_3_delay_1;
    reg [0:0] redist21_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_22_q;
    reg [0:0] redist22_ChannelIn_cunroll_x_in_10_prach_tech_tpl_21_q;
    reg [15:0] redist23_ChannelIn_cunroll_x_in_11_prcah_sym_start_tpl_3_q;
    reg [15:0] redist23_ChannelIn_cunroll_x_in_11_prcah_sym_start_tpl_3_delay_0;
    reg [15:0] redist23_ChannelIn_cunroll_x_in_11_prcah_sym_start_tpl_3_delay_1;
    reg [18:0] redist24_ChannelIn_cunroll_x_in_12_prcah_sym_end_tpl_3_q;
    reg [18:0] redist24_ChannelIn_cunroll_x_in_12_prcah_sym_end_tpl_3_delay_0;
    reg [18:0] redist24_ChannelIn_cunroll_x_in_12_prcah_sym_end_tpl_3_delay_1;
    reg [7:0] redist27_ChannelIn_cunroll_x_in_5_SubFrame_tpl_1_q;
    reg [7:0] redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q;
    reg [7:0] redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_delay_0;
    reg [11:0] redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4_q;
    reg [11:0] redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4_delay_0;
    reg [11:0] redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4_delay_1;
    reg [11:0] redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4_delay_2;
    reg [11:0] redist31_ChannelIn_cunroll_x_in_4_SFN_tpl_5_q;
    reg [11:0] redist33_ChannelIn_cunroll_x_in_4_SFN_tpl_23_q;
    reg [11:0] redist33_ChannelIn_cunroll_x_in_4_SFN_tpl_23_delay_0;
    reg [11:0] redist33_ChannelIn_cunroll_x_in_4_SFN_tpl_23_delay_1;
    reg [3:0] redist34_ChannelIn_cunroll_x_in_15_start_sym_tpl_2_q;
    reg [3:0] redist34_ChannelIn_cunroll_x_in_15_start_sym_tpl_2_delay_0;
    reg [3:0] redist35_ChannelIn_cunroll_x_in_15_start_sym_tpl_3_q;
    reg [0:0] redist38_CmpNE_q_21_q;
    reg [0:0] redist39_CmpNE_q_22_q;
    wire redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_reset0;
    wire redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_ena_OrRstB;
    wire [4:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_ia;
    wire [2:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_aa;
    wire [2:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_ab;
    wire [4:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_iq;
    wire [4:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_q;
    wire [2:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_rdcnt_i;
    reg [2:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_wraddr_q;
    wire [3:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_last_q;
    wire [3:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_cmp_b;
    wire [0:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_cmp_q;
    (* preserve_syn_only *) reg [0:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_cmpReg_q;
    wire [0:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_notEnable_q;
    wire [0:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_nor_q;
    (* preserve_syn_only *) reg [0:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_sticky_ena_q;
    wire [0:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_enaAnd_q;
    wire redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_reset0;
    wire [7:0] redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_ia;
    wire [4:0] redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_aa;
    wire [4:0] redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_ab;
    wire [7:0] redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_iq;
    wire [7:0] redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_q;
    wire [4:0] redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_wraddr_i = 5'b11111;
    wire [4:0] redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_offset_q;
    wire [5:0] redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_rdcnt_a;
    wire [5:0] redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_rdcnt_b;
    logic [5:0] redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_rdcnt_o;
    wire [5:0] redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_rdcnt_q;
    wire redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_reset0;
    wire [15:0] redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_ia;
    wire [4:0] redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_aa;
    wire [4:0] redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_ab;
    wire [15:0] redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_iq;
    wire [15:0] redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_q;
    wire [4:0] redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_wraddr_i = 5'b11111;
    wire [5:0] redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_rdcnt_a;
    wire [5:0] redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_rdcnt_b;
    logic [5:0] redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_rdcnt_o;
    wire [5:0] redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_rdcnt_q;
    wire redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_reset0;
    wire [15:0] redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_ia;
    wire [4:0] redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_aa;
    wire [4:0] redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_ab;
    wire [15:0] redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_iq;
    wire [15:0] redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_q;
    wire [4:0] redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_wraddr_i = 5'b11111;
    wire [5:0] redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_rdcnt_a;
    wire [5:0] redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_rdcnt_b;
    logic [5:0] redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_rdcnt_o;
    wire [5:0] redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_rdcnt_q;
    wire redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_reset0;
    wire [6:0] redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_ia;
    wire [4:0] redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_aa;
    wire [4:0] redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_ab;
    wire [6:0] redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_iq;
    wire [6:0] redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_q;
    wire [4:0] redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_wraddr_i = 5'b11111;
    wire [5:0] redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_rdcnt_a;
    wire [5:0] redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_rdcnt_b;
    logic [5:0] redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_rdcnt_o;
    wire [5:0] redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_rdcnt_q;
    wire redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_reset0;
    wire [9:0] redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_ia;
    wire [4:0] redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_aa;
    wire [4:0] redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_ab;
    wire [9:0] redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_iq;
    wire [9:0] redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_q;
    wire [4:0] redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_wraddr_i = 5'b11111;
    wire [5:0] redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_rdcnt_a;
    wire [5:0] redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_rdcnt_b;
    logic [5:0] redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_rdcnt_o;
    wire [5:0] redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_rdcnt_q;
    wire redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_reset0;
    wire redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_ena_OrRstB;
    wire [7:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_ia;
    wire [4:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_aa;
    wire [4:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_ab;
    wire [7:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_iq;
    wire [7:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_q;
    wire [4:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_q;
    (* preserve_syn_only *) reg [4:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_i;
    (* preserve_syn_only *) reg redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_eq;
    reg [4:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_wraddr_q;
    wire [5:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_last_q;
    wire [5:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_cmp_b;
    wire [0:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_cmp_q;
    (* preserve_syn_only *) reg [0:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_cmpReg_q;
    wire [0:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_notEnable_q;
    wire [0:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_nor_q;
    (* preserve_syn_only *) reg [0:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_sticky_ena_q;
    wire [0:0] redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_enaAnd_q;
    reg [11:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_outputreg0_q;
    wire redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_reset0;
    wire redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_ena_OrRstB;
    wire [11:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_ia;
    wire [3:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_aa;
    wire [3:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_ab;
    wire [11:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_iq;
    wire [11:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_q;
    wire [3:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_q;
    (* preserve_syn_only *) reg [3:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_i;
    (* preserve_syn_only *) reg redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_eq;
    reg [3:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_wraddr_q;
    wire [4:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_last_q;
    wire [4:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_cmp_b;
    wire [0:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_cmp_q;
    (* preserve_syn_only *) reg [0:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_cmpReg_q;
    wire [0:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_notEnable_q;
    wire [0:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_nor_q;
    (* preserve_syn_only *) reg [0:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_sticky_ena_q;
    wire [0:0] redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_enaAnd_q;
    wire redist36_Mux2_q_20_mem_reset0;
    wire [22:0] redist36_Mux2_q_20_mem_ia;
    wire [4:0] redist36_Mux2_q_20_mem_aa;
    wire [4:0] redist36_Mux2_q_20_mem_ab;
    wire [22:0] redist36_Mux2_q_20_mem_iq;
    wire [22:0] redist36_Mux2_q_20_mem_q;
    wire [4:0] redist36_Mux2_q_20_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist36_Mux2_q_20_wraddr_i = 5'b11111;
    wire [4:0] redist36_Mux2_q_20_offset_q;
    wire [5:0] redist36_Mux2_q_20_rdcnt_a;
    wire [5:0] redist36_Mux2_q_20_rdcnt_b;
    logic [5:0] redist36_Mux2_q_20_rdcnt_o;
    wire [5:0] redist36_Mux2_q_20_rdcnt_q;
    wire redist37_Mux_q_20_mem_reset0;
    wire [21:0] redist37_Mux_q_20_mem_ia;
    wire [4:0] redist37_Mux_q_20_mem_aa;
    wire [4:0] redist37_Mux_q_20_mem_ab;
    wire [21:0] redist37_Mux_q_20_mem_iq;
    wire [21:0] redist37_Mux_q_20_mem_q;
    wire [4:0] redist37_Mux_q_20_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [4:0] redist37_Mux_q_20_wraddr_i = 5'b11111;
    wire [5:0] redist37_Mux_q_20_rdcnt_a;
    wire [5:0] redist37_Mux_q_20_rdcnt_b;
    logic [5:0] redist37_Mux_q_20_rdcnt_o;
    wire [5:0] redist37_Mux_q_20_rdcnt_q;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_offset(CONSTANT,388)
    assign redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_offset_q = $unsigned(5'b01100);

    // redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_rdcnt(ADD,405)
    assign redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_rdcnt_a = {1'b0, redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_wraddr_q};
    assign redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_rdcnt_b = {1'b0, redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_rdcnt_o <= $unsigned(redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_rdcnt_a) + $unsigned(redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_rdcnt_b);
        end
    end
    assign redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_rdcnt_q = redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_rdcnt_o[5:0];

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_wraddr(COUNTER,403)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_wraddr_i <= $unsigned(redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_wraddr_q = redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_wraddr_i[4:0];

    // redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem(DUALMEM,402)
    assign redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_ia = $unsigned(in_14_prach_out_end_tpl);
    assign redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_aa = redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_wraddr_q;
    assign redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_ab = redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_rdcnt_q[4:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(10),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(10),
        .widthad_b(5),
        .numwords_b(32),
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
    ) redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_aa),
        .data_a(redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_ab),
        .q_b(redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_iq),
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
    assign redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_q = redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_iq[9:0];

    // redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_rdcnt(ADD,401)
    assign redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_rdcnt_a = {1'b0, redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_wraddr_q};
    assign redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_rdcnt_b = {1'b0, redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_rdcnt_o <= $unsigned(redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_rdcnt_a) + $unsigned(redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_rdcnt_b);
        end
    end
    assign redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_rdcnt_q = redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_rdcnt_o[5:0];

    // redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_wraddr(COUNTER,399)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_wraddr_i <= $unsigned(redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_wraddr_q = redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_wraddr_i[4:0];

    // redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem(DUALMEM,398)
    assign redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_ia = $unsigned(in_13_prach_out_start_tpl);
    assign redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_aa = redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_wraddr_q;
    assign redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_ab = redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_rdcnt_q[4:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(7),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(7),
        .widthad_b(5),
        .numwords_b(32),
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
    ) redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_aa),
        .data_a(redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_ab),
        .q_b(redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_iq),
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
    assign redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_q = redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_iq[6:0];

    // redist36_Mux2_q_20_offset(CONSTANT,429)
    assign redist36_Mux2_q_20_offset_q = $unsigned(5'b10000);

    // redist36_Mux2_q_20_rdcnt(ADD,430)
    assign redist36_Mux2_q_20_rdcnt_a = {1'b0, redist36_Mux2_q_20_wraddr_q};
    assign redist36_Mux2_q_20_rdcnt_b = {1'b0, redist36_Mux2_q_20_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist36_Mux2_q_20_rdcnt_o <= $unsigned(redist36_Mux2_q_20_rdcnt_a) + $unsigned(redist36_Mux2_q_20_rdcnt_b);
        end
    end
    assign redist36_Mux2_q_20_rdcnt_q = redist36_Mux2_q_20_rdcnt_o[5:0];

    // redist24_ChannelIn_cunroll_x_in_12_prcah_sym_end_tpl_3(DELAY,360)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist24_ChannelIn_cunroll_x_in_12_prcah_sym_end_tpl_3_delay_0 <= $unsigned(in_12_prcah_sym_end_tpl);
            redist24_ChannelIn_cunroll_x_in_12_prcah_sym_end_tpl_3_delay_1 <= redist24_ChannelIn_cunroll_x_in_12_prcah_sym_end_tpl_3_delay_0;
            redist24_ChannelIn_cunroll_x_in_12_prcah_sym_end_tpl_3_q <= redist24_ChannelIn_cunroll_x_in_12_prcah_sym_end_tpl_3_delay_1;
        end
    end

    // Const1(CONSTANT,33)
    assign Const1_q = $unsigned(15'b110000000000000);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Const6_x(CONSTANT,159)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Const6_x_q = $unsigned(14'b11110000000000);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_x(SUB,161)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_x_a = $unsigned({1'b0, Add_q});
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_x_b = $unsigned({9'b000000000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Const6_x_q});
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_x_o = $unsigned($signed(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_x_a) - $signed(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_x_b));
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_x_o[22:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_PostCast_primWireOut_sel_x(BITSELECT,186)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_PostCast_primWireOut_sel_x_b = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_x_q[20:0]);

    // redist27_ChannelIn_cunroll_x_in_5_SubFrame_tpl_1(DELAY,363)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist27_ChannelIn_cunroll_x_in_5_SubFrame_tpl_1_q <= '0;
        end
        else
        begin
            redist27_ChannelIn_cunroll_x_in_5_SubFrame_tpl_1_q <= $unsigned(in_5_SubFrame_tpl);
        end
    end

    // CmpNE(LOGICAL,31)@0
    assign CmpNE_q = $unsigned(in_5_SubFrame_tpl != redist27_ChannelIn_cunroll_x_in_5_SubFrame_tpl_1_q ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch2_latch_0L_Mux_x(MUX,124)@0 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch2_latch_0L_Mux_x_s = CmpNE_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch2_latch_0L_Mux_x_q <= 21'b0;
        end
        else
        begin
            unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch2_latch_0L_Mux_x_s)
                1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch2_latch_0L_Mux_x_q <= LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch2_latch_0L_Mux_x_q;
                1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch2_latch_0L_Mux_x_q <= in_8_offset_tpl;
                default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch2_latch_0L_Mux_x_q <= 21'b0;
            endcase
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Or_x(LOGICAL,111)@0 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Or_x_qi = CmpNE_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Or_x_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Or_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Or_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Or_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // Const4(CONSTANT,36)
    assign Const4_q = $unsigned(21'b000000000110001100000);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch1_latch_0L_Mux_x(MUX,118)@0 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch1_latch_0L_Mux_x_s = CmpNE_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch1_latch_0L_Mux_x_q <= 21'b0;
        end
        else
        begin
            unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch1_latch_0L_Mux_x_s)
                1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch1_latch_0L_Mux_x_q <= LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch1_latch_0L_Mux_x_q;
                1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch1_latch_0L_Mux_x_q <= in_7_cp_len_tpl;
                default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch1_latch_0L_Mux_x_q <= 21'b0;
            endcase
        end
    end

    // Add(ADD,26)@1 + 1
    assign Add_a = {1'b0, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch1_latch_0L_Mux_x_q};
    assign Add_b = {1'b0, Const4_q};
    assign Add_i = {1'b0, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch2_latch_0L_Mux_x_q};
    assign Add_a1 = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Or_x_q == 1'b1 ? Add_i : Add_a;
    assign Add_b1 = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Or_x_q == 1'b1 ? 22'b0 : Add_b;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            Add_o <= $unsigned(Add_a1) + $unsigned(Add_b1);
        end
    end
    assign Add_q = Add_o[21:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Const6_x(CONSTANT,132)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Const6_x_q = $unsigned(4'b1000);

    // redist34_ChannelIn_cunroll_x_in_15_start_sym_tpl_2(DELAY,370)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist34_ChannelIn_cunroll_x_in_15_start_sym_tpl_2_delay_0 <= '0;
        end
        else
        begin
            redist34_ChannelIn_cunroll_x_in_15_start_sym_tpl_2_delay_0 <= $unsigned(in_15_start_sym_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist34_ChannelIn_cunroll_x_in_15_start_sym_tpl_2_q <= redist34_ChannelIn_cunroll_x_in_15_start_sym_tpl_2_delay_0;
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_CmpEQ_x(LOGICAL,157)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_CmpEQ_x_q = $unsigned(redist34_ChannelIn_cunroll_x_in_15_start_sym_tpl_2_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Const6_x_q ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Mux4_x(MUX,160)@2 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Mux4_x_s = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_CmpEQ_x_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Mux4_x_s)
                1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Mux4_x_q <= Add_q;
                1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Mux4_x_q <= {1'b0, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Sub_PostCast_primWireOut_sel_x_b};
                default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Mux4_x_q <= 22'b0;
            endcase
        end
    end

    // Add1(ADD,27)@3
    assign Add1_a = {1'b0, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Mux4_x_q};
    assign Add1_b = {8'b00000000, Const1_q};
    assign Add1_o = $unsigned(Add1_a) + $unsigned(Add1_b);
    assign Add1_q = Add1_o[22:0];

    // LShift1_fs(BITSHIFT,267)@3
    assign LShift1_fs_qint = { Add1_q, 4'b0000 };
    assign LShift1_fs_q = LShift1_fs_qint[26:0];

    // redist20_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_3(DELAY,356)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist20_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_3_delay_0 <= '0;
        end
        else
        begin
            redist20_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_3_delay_0 <= $unsigned(in_9_c_m_plane_sel_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist20_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_3_delay_1 <= redist20_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_3_delay_0;
            redist20_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_3_q <= redist20_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_3_delay_1;
        end
    end

    // Mux2(MUX,45)@3 + 1
    assign Mux2_s = redist20_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_3_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (Mux2_s)
                1'b0 : Mux2_q <= LShift1_fs_q[22:0];
                1'b1 : Mux2_q <= {4'b0000, redist24_ChannelIn_cunroll_x_in_12_prcah_sym_end_tpl_3_q};
                default : Mux2_q <= 23'b0;
            endcase
        end
    end

    // redist36_Mux2_q_20_wraddr(COUNTER,428)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist36_Mux2_q_20_wraddr_i <= $unsigned(redist36_Mux2_q_20_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist36_Mux2_q_20_wraddr_q = redist36_Mux2_q_20_wraddr_i[4:0];

    // redist36_Mux2_q_20_mem(DUALMEM,427)
    assign redist36_Mux2_q_20_mem_ia = $unsigned(Mux2_q);
    assign redist36_Mux2_q_20_mem_aa = redist36_Mux2_q_20_wraddr_q;
    assign redist36_Mux2_q_20_mem_ab = redist36_Mux2_q_20_rdcnt_q[4:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(23),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(23),
        .widthad_b(5),
        .numwords_b(32),
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
    ) redist36_Mux2_q_20_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist36_Mux2_q_20_mem_aa),
        .data_a(redist36_Mux2_q_20_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist36_Mux2_q_20_mem_ab),
        .q_b(redist36_Mux2_q_20_mem_iq),
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
    assign redist36_Mux2_q_20_mem_q = redist36_Mux2_q_20_mem_iq[22:0];

    // redist37_Mux_q_20_rdcnt(ADD,434)
    assign redist37_Mux_q_20_rdcnt_a = {1'b0, redist37_Mux_q_20_wraddr_q};
    assign redist37_Mux_q_20_rdcnt_b = {1'b0, redist36_Mux2_q_20_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist37_Mux_q_20_rdcnt_o <= $unsigned(redist37_Mux_q_20_rdcnt_a) + $unsigned(redist37_Mux_q_20_rdcnt_b);
        end
    end
    assign redist37_Mux_q_20_rdcnt_q = redist37_Mux_q_20_rdcnt_o[5:0];

    // redist23_ChannelIn_cunroll_x_in_11_prcah_sym_start_tpl_3(DELAY,359)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist23_ChannelIn_cunroll_x_in_11_prcah_sym_start_tpl_3_delay_0 <= $unsigned(in_11_prcah_sym_start_tpl);
            redist23_ChannelIn_cunroll_x_in_11_prcah_sym_start_tpl_3_delay_1 <= redist23_ChannelIn_cunroll_x_in_11_prcah_sym_start_tpl_3_delay_0;
            redist23_ChannelIn_cunroll_x_in_11_prcah_sym_start_tpl_3_q <= redist23_ChannelIn_cunroll_x_in_11_prcah_sym_start_tpl_3_delay_1;
        end
    end

    // LShift_fs(BITSHIFT,266)@3
    assign LShift_fs_qint = { LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_Timeoffset_scaling_adjustment_Mux4_x_q, 4'b0000 };
    assign LShift_fs_q = LShift_fs_qint[25:0];

    // Mux(MUX,43)@3 + 1
    assign Mux_s = redist20_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_3_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (Mux_s)
                1'b0 : Mux_q <= LShift_fs_q[21:0];
                1'b1 : Mux_q <= {6'b000000, redist23_ChannelIn_cunroll_x_in_11_prcah_sym_start_tpl_3_q};
                default : Mux_q <= 22'b0;
            endcase
        end
    end

    // redist37_Mux_q_20_wraddr(COUNTER,432)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist37_Mux_q_20_wraddr_i <= $unsigned(redist37_Mux_q_20_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist37_Mux_q_20_wraddr_q = redist37_Mux_q_20_wraddr_i[4:0];

    // redist37_Mux_q_20_mem(DUALMEM,431)
    assign redist37_Mux_q_20_mem_ia = $unsigned(Mux_q);
    assign redist37_Mux_q_20_mem_aa = redist37_Mux_q_20_wraddr_q;
    assign redist37_Mux_q_20_mem_ab = redist37_Mux_q_20_rdcnt_q[4:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(22),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(22),
        .widthad_b(5),
        .numwords_b(32),
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
    ) redist37_Mux_q_20_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist37_Mux_q_20_mem_aa),
        .data_a(redist37_Mux_q_20_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist37_Mux_q_20_mem_ab),
        .q_b(redist37_Mux_q_20_mem_iq),
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
    assign redist37_Mux_q_20_mem_q = redist37_Mux_q_20_mem_iq[21:0];

    // rsvd(CONSTANT,51)
    assign rsvd_q = $unsigned(3'b000);

    // redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_notEnable(LOGICAL,423)
    assign redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_notEnable_q = $unsigned(~ (VCC_q));

    // redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_nor(LOGICAL,424)
    assign redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_nor_q = ~ (redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_notEnable_q | redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_sticky_ena_q);

    // redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_last(CONSTANT,420)
    assign redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_last_q = $unsigned(5'b01011);

    // redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_cmp(LOGICAL,421)
    assign redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_cmp_b = {1'b0, redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_q};
    assign redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_cmp_q = $unsigned(redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_last_q == redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_cmp_b ? 1'b1 : 1'b0);

    // redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_cmpReg(REG,422)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_cmpReg_q <= $unsigned(redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_cmp_q);
        end
    end

    // redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_sticky_ena(REG,425)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_nor_q == 1'b1)
        begin
            redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_sticky_ena_q <= $unsigned(redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_cmpReg_q);
        end
    end

    // redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_enaAnd(LOGICAL,426)
    assign redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_enaAnd_q = redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_sticky_ena_q & VCC_q;

    // redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt(COUNTER,418)
    // low=0, high=12, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_i <= 4'd0;
            redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_eq <= 1'b0;
        end
        else
        begin
            if (redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_i == 4'd11)
            begin
                redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_eq <= 1'b1;
            end
            else
            begin
                redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_eq <= 1'b0;
            end
            if (redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_eq == 1'b1)
            begin
                redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_i <= $unsigned(redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_i) + $unsigned(4'd4);
            end
            else
            begin
                redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_i <= $unsigned(redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_i) + $unsigned(4'd1);
            end
        end
    end
    assign redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_q = redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_i[3:0];

    // redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4(DELAY,366)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4_delay_0 <= '0;
        end
        else
        begin
            redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4_delay_0 <= $unsigned(in_4_SFN_tpl);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4_delay_1 <= redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4_delay_0;
            redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4_delay_2 <= redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4_delay_1;
            redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4_q <= redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4_delay_2;
        end
    end

    // redist31_ChannelIn_cunroll_x_in_4_SFN_tpl_5(DELAY,367)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist31_ChannelIn_cunroll_x_in_4_SFN_tpl_5_q <= '0;
        end
        else
        begin
            redist31_ChannelIn_cunroll_x_in_4_SFN_tpl_5_q <= $unsigned(redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4_q);
        end
    end

    // redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_wraddr(REG,419)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_wraddr_q <= $unsigned(4'b1100);
        end
        else
        begin
            redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_wraddr_q <= $unsigned(redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_q);
        end
    end

    // redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem(DUALMEM,417)
    assign redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_ia = $unsigned(redist31_ChannelIn_cunroll_x_in_4_SFN_tpl_5_q);
    assign redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_aa = redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_wraddr_q;
    assign redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_ab = redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_rdcnt_q;
    assign redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_ena_OrRstB = areset | redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_enaAnd_q[0];
    assign redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(12),
        .widthad_a(4),
        .numwords_a(13),
        .width_b(12),
        .widthad_b(4),
        .numwords_b(13),
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
    ) redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_dmem (
        .clocken1(redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_reset0),
        .clock1(clk),
        .address_a(redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_aa),
        .data_a(redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_ab),
        .q_b(redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_iq),
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
    assign redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_q = redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_iq[11:0];

    // redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_outputreg0(DELAY,416)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_outputreg0_q <= '0;
        end
        else
        begin
            redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_outputreg0_q <= $unsigned(redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_mem_q);
        end
    end

    // redist33_ChannelIn_cunroll_x_in_4_SFN_tpl_23(DELAY,369)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist33_ChannelIn_cunroll_x_in_4_SFN_tpl_23_delay_0 <= '0;
        end
        else
        begin
            redist33_ChannelIn_cunroll_x_in_4_SFN_tpl_23_delay_0 <= $unsigned(redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_outputreg0_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist33_ChannelIn_cunroll_x_in_4_SFN_tpl_23_delay_1 <= redist33_ChannelIn_cunroll_x_in_4_SFN_tpl_23_delay_0;
            redist33_ChannelIn_cunroll_x_in_4_SFN_tpl_23_q <= redist33_ChannelIn_cunroll_x_in_4_SFN_tpl_23_delay_1;
        end
    end

    // redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_notEnable(LOGICAL,412)
    assign redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_notEnable_q = $unsigned(~ (VCC_q));

    // redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_nor(LOGICAL,413)
    assign redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_nor_q = ~ (redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_notEnable_q | redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_sticky_ena_q);

    // redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_last(CONSTANT,409)
    assign redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_last_q = $unsigned(6'b010001);

    // redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_cmp(LOGICAL,410)
    assign redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_cmp_b = {1'b0, redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_q};
    assign redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_cmp_q = $unsigned(redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_last_q == redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_cmp_b ? 1'b1 : 1'b0);

    // redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_cmpReg(REG,411)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_cmpReg_q <= $unsigned(redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_cmp_q);
        end
    end

    // redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_sticky_ena(REG,414)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_nor_q == 1'b1)
        begin
            redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_sticky_ena_q <= $unsigned(redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_cmpReg_q);
        end
    end

    // redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_enaAnd(LOGICAL,415)
    assign redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_enaAnd_q = redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_sticky_ena_q & VCC_q;

    // redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt(COUNTER,407)
    // low=0, high=18, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_i <= 5'd0;
            redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_eq <= 1'b0;
        end
        else
        begin
            if (redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_i == 5'd17)
            begin
                redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_eq <= 1'b1;
            end
            else
            begin
                redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_eq <= 1'b0;
            end
            if (redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_eq == 1'b1)
            begin
                redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_i <= $unsigned(redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_i) + $unsigned(5'd14);
            end
            else
            begin
                redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_i <= $unsigned(redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_i) + $unsigned(5'd1);
            end
        end
    end
    assign redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_q = redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_i[4:0];

    // redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3(DELAY,364)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_delay_0 <= '0;
        end
        else
        begin
            redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_delay_0 <= $unsigned(redist27_ChannelIn_cunroll_x_in_5_SubFrame_tpl_1_q);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q <= redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_delay_0;
        end
    end

    // redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_wraddr(REG,408)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_wraddr_q <= $unsigned(5'b10010);
        end
        else
        begin
            redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_wraddr_q <= $unsigned(redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_q);
        end
    end

    // redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem(DUALMEM,406)
    assign redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_ia = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q);
    assign redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_aa = redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_wraddr_q;
    assign redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_ab = redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_rdcnt_q;
    assign redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_ena_OrRstB = areset | redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_enaAnd_q[0];
    assign redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(8),
        .widthad_a(5),
        .numwords_a(19),
        .width_b(8),
        .widthad_b(5),
        .numwords_b(19),
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
    ) redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_dmem (
        .clocken1(redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_reset0),
        .clock1(clk),
        .address_a(redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_aa),
        .data_a(redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_ab),
        .q_b(redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_iq),
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
    assign redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_q = redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_iq[7:0];

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // maxsym(CONSTANT,50)
    assign maxsym_q = $unsigned(4'b0001);

    // startofsym(CONSTANT,52)
    assign startofsym_q = $unsigned(4'b0000);

    // BitCombine(BITJOIN,30)@23
    assign BitCombine_q = {rsvd_q, redist33_ChannelIn_cunroll_x_in_4_SFN_tpl_23_q, redist29_ChannelIn_cunroll_x_in_5_SubFrame_tpl_23_mem_q, GND_q, maxsym_q, startofsym_q};

    // redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_rdcnt(ADD,397)
    assign redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_rdcnt_a = {1'b0, redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_wraddr_q};
    assign redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_rdcnt_b = {1'b0, redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_rdcnt_o <= $unsigned(redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_rdcnt_a) + $unsigned(redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_rdcnt_b);
        end
    end
    assign redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_rdcnt_q = redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_rdcnt_o[5:0];

    // redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_wraddr(COUNTER,395)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_wraddr_i <= $unsigned(redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_wraddr_q = redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_wraddr_i[4:0];

    // redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem(DUALMEM,394)
    assign redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_ia = $unsigned(in_1_imag_din0_tpl);
    assign redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_aa = redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_wraddr_q;
    assign redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_ab = redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_rdcnt_q[4:0];
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
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_aa),
        .data_a(redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_ab),
        .q_b(redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_iq),
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
    assign redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_q = redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_iq[15:0];

    // redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_rdcnt(ADD,393)
    assign redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_rdcnt_a = {1'b0, redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_wraddr_q};
    assign redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_rdcnt_b = {1'b0, redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_rdcnt_o <= $unsigned(redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_rdcnt_a) + $unsigned(redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_rdcnt_b);
        end
    end
    assign redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_rdcnt_q = redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_rdcnt_o[5:0];

    // redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_wraddr(COUNTER,391)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_wraddr_i <= $unsigned(redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_wraddr_q = redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_wraddr_i[4:0];

    // redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem(DUALMEM,390)
    assign redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_ia = $unsigned(in_1_real_din0_tpl);
    assign redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_aa = redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_wraddr_q;
    assign redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_ab = redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_rdcnt_q[4:0];
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
        .outdata_reg_b("CLOCK0"),
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("Agilex 7")
    ) redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_aa),
        .data_a(redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_ab),
        .q_b(redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_iq),
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
    assign redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_q = redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_iq[15:0];

    // redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_rdcnt(ADD,389)
    assign redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_rdcnt_a = {1'b0, redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_wraddr_q};
    assign redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_rdcnt_b = {1'b0, redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_offset_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_rdcnt_o <= $unsigned(redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_rdcnt_a) + $unsigned(redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_rdcnt_b);
        end
    end
    assign redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_rdcnt_q = redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_rdcnt_o[5:0];

    // redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_wraddr(COUNTER,387)
    // low=0, high=31, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_wraddr_i <= $unsigned(redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_wraddr_i) + $unsigned(5'd1);
        end
    end
    assign redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_wraddr_q = redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_wraddr_i[4:0];

    // redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem(DUALMEM,386)
    assign redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_ia = $unsigned(in_3_chin0_tpl);
    assign redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_aa = redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_wraddr_q;
    assign redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_ab = redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_rdcnt_q[4:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(8),
        .widthad_a(5),
        .numwords_a(32),
        .width_b(8),
        .widthad_b(5),
        .numwords_b(32),
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
    ) redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_aa),
        .data_a(redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_ab),
        .q_b(redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_iq),
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
    assign redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_q = redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_iq[7:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Const5_x(CONSTANT,131)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Const5_x_q = $unsigned(19'b1111000000000000000);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Const4_x(CONSTANT,130)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Const4_x_q = $unsigned(18'b111100000000000000);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x(LOOP,133)@22 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_running <= $unsigned(1'b0);
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_pending <= $unsigned(1'b0);
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_q0 <= 18'b0;
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_e0 <= '1;
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_v <= $unsigned(1'b0);
        end
        else
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_v <= $unsigned(1'b0);
            if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_delay_valid_x_q == 1'b1)
            begin
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_e0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Const4_x_q) - $unsigned(18'd1);
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_q0 <= 18'b0;
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_running <= $unsigned(1'b1);
                if (VCC_q == 1'b1)
                begin
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_pending <= $unsigned(1'b0);
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (VCC_q == 1'b1)
                begin
                    if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_pending == 1'b1)
                    begin
                        LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_v <= $unsigned(1'b1);
                    end
                    else if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_running == 1'b1)
                    begin
                        LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_v <= $unsigned(1'b1);
                        if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_q0 == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_e0)
                        begin
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_q0 <= 18'b0;
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_running <= $unsigned(1'b0);
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_q0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_q0) + $unsigned(18'd1);
                        end
                    end
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_f0 = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_q0 == 18'b000000000000000000 ? 1'b1 : 1'b0);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_l0 = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_q0 == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_e0 ? 1'b1 : 1'b0);

    // redist38_CmpNE_q_21(DELAY,374)
    dspba_delay_ver #( .width(1), .depth(21), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist38_CmpNE_q_21 ( .xin(CmpNE_q), .xout(redist38_CmpNE_q_21_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist39_CmpNE_q_22(DELAY,375)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist39_CmpNE_q_22_q <= '0;
        end
        else
        begin
            redist39_CmpNE_q_22_q <= $unsigned(redist38_CmpNE_q_21_q);
        end
    end

    // redist16_ChannelIn_cunroll_x_in_2_vin0_tpl_22(DELAY,352)
    dspba_delay_ver #( .width(1), .depth(22), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist16_ChannelIn_cunroll_x_in_2_vin0_tpl_22 ( .xin(in_2_vin0_tpl), .xout(redist16_ChannelIn_cunroll_x_in_2_vin0_tpl_22_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // cstValOvf_uid215_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(CONSTANT,214)
    assign cstValOvf_uid215_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = $unsigned(17'b11111111111111111);

    // rightShiftStage1Idx3Pad12_uid325_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(CONSTANT,324)
    assign rightShiftStage1Idx3Pad12_uid325_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = $unsigned(12'b000000000000);

    // rightShiftStage1Idx3Rng12_uid324_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,323)@11
    assign rightShiftStage1Idx3Rng12_uid324_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[29:12];

    // rightShiftStage1Idx3_uid326_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITJOIN,325)@11
    assign rightShiftStage1Idx3_uid326_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = {rightShiftStage1Idx3Pad12_uid325_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q, rightShiftStage1Idx3Rng12_uid324_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b};

    // rightShiftStage1Idx2Pad8_uid322_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(CONSTANT,321)
    assign rightShiftStage1Idx2Pad8_uid322_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = $unsigned(8'b00000000);

    // rightShiftStage1Idx2Rng8_uid321_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,320)@11
    assign rightShiftStage1Idx2Rng8_uid321_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[29:8];

    // rightShiftStage1Idx2_uid323_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITJOIN,322)@11
    assign rightShiftStage1Idx2_uid323_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = {rightShiftStage1Idx2Pad8_uid322_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q, rightShiftStage1Idx2Rng8_uid321_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b};

    // rightShiftStage1Idx1Rng4_uid318_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,317)@11
    assign rightShiftStage1Idx1Rng4_uid318_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[29:4];

    // rightShiftStage1Idx1_uid320_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITJOIN,319)@11
    assign rightShiftStage1Idx1_uid320_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = {startofsym_q, rightShiftStage1Idx1Rng4_uid318_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b};

    // rightShiftStage0Idx3Rng3_uid313_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,312)@11
    assign rightShiftStage0Idx3Rng3_uid313_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_q[29:3];

    // rightShiftStage0Idx3_uid315_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITJOIN,314)@11
    assign rightShiftStage0Idx3_uid315_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = {rsvd_q, rightShiftStage0Idx3Rng3_uid313_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b};

    // zs_uid226_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(CONSTANT,225)
    assign zs_uid226_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = $unsigned(2'b00);

    // rightShiftStage0Idx2Rng2_uid310_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,309)@11
    assign rightShiftStage0Idx2Rng2_uid310_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_q[29:2];

    // rightShiftStage0Idx2_uid312_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITJOIN,311)@11
    assign rightShiftStage0Idx2_uid312_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = {zs_uid226_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q, rightShiftStage0Idx2Rng2_uid310_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b};

    // rightShiftStage0Idx1Rng1_uid307_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,306)@11
    assign rightShiftStage0Idx1Rng1_uid307_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_q[29:1];

    // rightShiftStage0Idx1_uid309_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITJOIN,308)@11
    assign rightShiftStage0Idx1_uid309_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = {GND_q, rightShiftStage0Idx1Rng1_uid307_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b};

    // oneInvRes_uid202_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(CONSTANT,201)
    assign oneInvRes_uid202_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = $unsigned(18'b100000000000000000);

    // leftShiftStage1Idx1Rng1_uid300_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,299)@4
    assign leftShiftStage1Idx1Rng1_uid300_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in = leftShiftStage0_uid298_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[3:0];
    assign leftShiftStage1Idx1Rng1_uid300_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = leftShiftStage1Idx1Rng1_uid300_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in[3:0];

    // leftShiftStage1Idx1_uid301_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITJOIN,300)@4
    assign leftShiftStage1Idx1_uid301_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = {leftShiftStage1Idx1Rng1_uid300_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b, GND_q};

    // updatedY_uid194_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_const(CONSTANT,236)
    assign updatedY_uid194_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_const_q = $unsigned(5'b00000);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_latch_0L_Mux_x(MUX,126)@0 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_latch_0L_Mux_x_s = CmpNE_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_latch_0L_Mux_x_q <= 16'b0;
        end
        else
        begin
            unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_latch_0L_Mux_x_s)
                1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_latch_0L_Mux_x_q <= LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_latch_0L_Mux_x_q;
                1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_latch_0L_Mux_x_q <= in_6_prach_config_index_tpl;
                default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_latch_0L_Mux_x_q <= 16'b0;
            endcase
        end
    end

    // Const2(CONSTANT,34)
    assign Const2_q = $unsigned(16'b0000000000011011);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x(MUX,110)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_s = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Or_x_q;
    always @(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_s or Const2_q or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_latch_0L_Mux_x_q)
    begin
        unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_s)
            1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q = Const2_q;
            1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_latch_0L_Mux_x_q;
            default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q = 16'b0;
        endcase
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem(DUALMEM,285)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[8:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(5),
        .widthad_a(9),
        .numwords_a(512),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000_unpaired_X_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_ir[4:0];

    // vStage_uid222_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,221)@3
    assign vStage_uid222_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r[0:0];
    assign vStage_uid222_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = vStage_uid222_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in[0:0];

    // redist7_vStage_uid222_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_1(DELAY,343)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist7_vStage_uid222_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_1_q <= '0;
        end
        else
        begin
            redist7_vStage_uid222_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_1_q <= $unsigned(vStage_uid222_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b);
        end
    end

    // leftShiftStage0Idx2_uid295_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITJOIN,294)@4
    assign leftShiftStage0Idx2_uid295_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = {redist7_vStage_uid222_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_1_q, startofsym_q};

    // leftShiftStage0Idx1Rng2_uid291_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,290)@4
    assign leftShiftStage0Idx1Rng2_uid291_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in = redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_1_q[2:0];
    assign leftShiftStage0Idx1Rng2_uid291_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = leftShiftStage0Idx1Rng2_uid291_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in[2:0];

    // leftShiftStage0Idx1_uid292_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITJOIN,291)@4
    assign leftShiftStage0Idx1_uid292_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = {leftShiftStage0Idx1Rng2_uid291_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b, zs_uid226_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q};

    // redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_1(DELAY,337)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_1_q <= '0;
        end
        else
        begin
            redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_1_q <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r);
        end
    end

    // leftShiftStage0_uid298_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(MUX,297)@4
    assign leftShiftStage0_uid298_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s = leftShiftStageSel0Dto1_uid297_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_b;
    always @(leftShiftStage0_uid298_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s or redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_1_q or leftShiftStage0Idx1_uid292_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q or leftShiftStage0Idx2_uid295_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q or updatedY_uid194_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_const_q)
    begin
        unique case (leftShiftStage0_uid298_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s)
            2'b00 : leftShiftStage0_uid298_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_1_q;
            2'b01 : leftShiftStage0_uid298_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = leftShiftStage0Idx1_uid292_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
            2'b10 : leftShiftStage0_uid298_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = leftShiftStage0Idx2_uid295_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
            2'b11 : leftShiftStage0_uid298_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = updatedY_uid194_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_const_q;
            default : leftShiftStage0_uid298_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 5'b0;
        endcase
    end

    // rVStage_uid219_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,218)@3
    assign rVStage_uid219_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r[4:1];

    // vCount_uid220_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(LOGICAL,219)@3
    assign vCount_uid220_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = $unsigned(rVStage_uid219_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b == startofsym_q ? 1'b1 : 1'b0);

    // redist8_vCount_uid220_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_1(DELAY,344)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist8_vCount_uid220_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_1_q <= '0;
        end
        else
        begin
            redist8_vCount_uid220_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_1_q <= $unsigned(vCount_uid220_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q);
        end
    end

    // mO_uid221_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(CONSTANT,220)
    assign mO_uid221_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = $unsigned(3'b111);

    // cStage_uid223_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITJOIN,222)@3
    assign cStage_uid223_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = {vStage_uid222_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b, mO_uid221_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q};

    // vStagei_uid225_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(MUX,224)@3 + 1
    assign vStagei_uid225_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s = vCount_uid220_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            vStagei_uid225_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q <= 4'b0;
        end
        else
        begin
            unique case (vStagei_uid225_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s)
                1'b0 : vStagei_uid225_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q <= rVStage_uid219_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
                1'b1 : vStagei_uid225_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q <= cStage_uid223_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
                default : vStagei_uid225_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q <= 4'b0;
            endcase
        end
    end

    // rVStage_uid227_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged(BITSELECT,334)@4
    assign rVStage_uid227_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_b = vStagei_uid225_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[3:2];
    assign rVStage_uid227_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_c = vStagei_uid225_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[1:0];

    // vCount_uid228_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(LOGICAL,227)@4
    assign vCount_uid228_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = $unsigned(rVStage_uid227_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_b == zs_uid226_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q ? 1'b1 : 1'b0);

    // vStagei_uid231_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(MUX,230)@4
    assign vStagei_uid231_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s = vCount_uid228_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    always @(vStagei_uid231_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s or rVStage_uid227_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_b or rVStage_uid227_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_c)
    begin
        unique case (vStagei_uid231_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s)
            1'b0 : vStagei_uid231_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = rVStage_uid227_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_b;
            1'b1 : vStagei_uid231_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = rVStage_uid227_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_c;
            default : vStagei_uid231_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 2'b0;
        endcase
    end

    // rVStage_uid233_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,232)@4
    assign rVStage_uid233_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = vStagei_uid231_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[1:1];

    // vCount_uid234_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(LOGICAL,233)@4
    assign vCount_uid234_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = $unsigned(rVStage_uid233_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b == GND_q ? 1'b1 : 1'b0);

    // r_uid235_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITJOIN,234)@4
    assign r_uid235_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = {redist8_vCount_uid220_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_1_q, vCount_uid228_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q, vCount_uid234_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q};

    // leftShiftStageSel0Dto1_uid297_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged(BITSELECT,335)@4
    assign leftShiftStageSel0Dto1_uid297_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_b = r_uid235_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[2:1];
    assign leftShiftStageSel0Dto1_uid297_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_c = r_uid235_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[0:0];

    // leftShiftStage1_uid303_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(MUX,302)@4 + 1
    assign leftShiftStage1_uid303_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s = leftShiftStageSel0Dto1_uid297_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_c;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            leftShiftStage1_uid303_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q <= 5'b0;
        end
        else
        begin
            unique case (leftShiftStage1_uid303_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s)
                1'b0 : leftShiftStage1_uid303_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q <= leftShiftStage0_uid298_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
                1'b1 : leftShiftStage1_uid303_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q <= leftShiftStage1Idx1_uid301_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
                default : leftShiftStage1_uid303_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q <= 5'b0;
            endcase
        end
    end

    // normYNoLeadOne_uid192_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,191)@5
    assign normYNoLeadOne_uid192_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in = leftShiftStage1_uid303_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[3:0];
    assign normYNoLeadOne_uid192_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = normYNoLeadOne_uid192_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in[3:0];

    // invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(LOOKUP,198)@5
    always @(normYNoLeadOne_uid192_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b)
    begin
        // Begin reserved scope level
        unique case (normYNoLeadOne_uid192_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b)
            4'b0000 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b100000000000000000;
            4'b0001 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b011110000111100010;
            4'b0010 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b011100011100011100;
            4'b0011 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b011010111100101000;
            4'b0100 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b011001100110011010;
            4'b0101 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b011000011000011000;
            4'b0110 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b010111010001011101;
            4'b0111 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b010110010000101101;
            4'b1000 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b010101010101010101;
            4'b1001 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b010100011110101110;
            4'b1010 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b010011101100010100;
            4'b1011 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b010010111101101000;
            4'b1100 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b010010010010010010;
            4'b1101 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b010001101001111100;
            4'b1110 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b010001000100010001;
            4'b1111 : invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b010000100001000010;
            default : begin
                          // unreachable
                          invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'bxxxxxxxxxxxxxxxxxx;
                      end
        endcase
        // End reserved scope level
    end

    // normYIsOneC2_uid193_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(LOGICAL,194)@5
    assign normYIsOneC2_uid193_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_a = {1'b0, normYNoLeadOne_uid192_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b};
    assign normYIsOneC2_uid193_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = $unsigned(normYIsOneC2_uid193_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_a == updatedY_uid194_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_const_q ? 1'b1 : 1'b0);

    // normYIsOneC2_uid196_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,195)@5
    assign normYIsOneC2_uid196_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = $unsigned(leftShiftStage1_uid303_normY_uid191_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[4:4]);

    // normYIsOne_uid197_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(LOGICAL,196)@5
    assign normYIsOne_uid197_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = normYIsOneC2_uid196_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b & normYIsOneC2_uid193_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;

    // invResPostOneHandling2_uid203_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(MUX,202)@5
    assign invResPostOneHandling2_uid203_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s = normYIsOne_uid197_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    always @(invResPostOneHandling2_uid203_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s or invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q or oneInvRes_uid202_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q)
    begin
        unique case (invResPostOneHandling2_uid203_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s)
            1'b0 : invResPostOneHandling2_uid203_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = invResPostOneHandling_uid199_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
            1'b1 : invResPostOneHandling2_uid203_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = oneInvRes_uid202_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
            default : invResPostOneHandling2_uid203_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 18'b0;
        endcase
    end

    // prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma(CHAINMULTADD,332)@5 + 5
    // out q@11
    assign prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_reset = areset;
    assign prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ena0 = 1'b1;
    assign prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ena1 = prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ena0;
    assign prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ena2 = prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ena0;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ah[0] <= '0;
            prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ch[0] <= '0;
        end
        else
        begin
            prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ah[0] <= redist31_ChannelIn_cunroll_x_in_4_SFN_tpl_5_q;
            prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ch[0] <= invResPostOneHandling2_uid203_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
        end
    end

    assign prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_a0 = prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ah[0];
    assign prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_c0 = prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ch[0];
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(12),
        .ax_clken("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(30)
    ) prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_DSP0 (
        .clk(clk),
        .ena({ prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ena2, prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ena1, prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_ena0 }),
        .clr({ prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_reset, prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_reset }),
        .ay(prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_a0),
        .ax(prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_c0),
        .resulta(prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_s0),
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
    dspba_delay_ver #( .width(30), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_delay0 ( .xin(prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_s0), .xout(prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_q = $unsigned(prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_qq0[29:0]);

    // rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(MUX,316)@11
    assign rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s = rightShiftStageSel0Dto0_uid316_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_b;
    always @(rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s or prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_q or rightShiftStage0Idx1_uid309_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q or rightShiftStage0Idx2_uid312_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q or rightShiftStage0Idx3_uid315_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q)
    begin
        unique case (rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s)
            2'b00 : rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = prodXInvY_uid206_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_cma_q;
            2'b01 : rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = rightShiftStage0Idx1_uid309_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
            2'b10 : rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = rightShiftStage0Idx2_uid312_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
            2'b11 : rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = rightShiftStage0Idx3_uid315_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
            default : rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 30'b0;
        endcase
    end

    // redist6_r_uid235_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_6(DELAY,342)
    dspba_delay_ver #( .width(3), .depth(6), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist6_r_uid235_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_6 ( .xin(r_uid235_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q), .xout(redist6_r_uid235_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_6_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // cWOut_uid204_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(CONSTANT,203)
    assign cWOut_uid204_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = $unsigned(3'b100);

    // rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(SUB,204)@10 + 1
    assign rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_a = $unsigned({1'b0, cWOut_uid204_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q});
    assign rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = $unsigned({1'b0, redist6_r_uid235_zCount_uid190_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q_6_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_o <= 4'b0;
        end
        else
        begin
            rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_o <= $unsigned($signed(rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_a) - $signed(rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b));
        end
    end
    assign rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_o[3:0];

    // rightShiftStageSel0Dto0_uid316_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged(BITSELECT,333)@11
    assign rightShiftStageSel0Dto0_uid316_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_b = rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[1:0];
    assign rightShiftStageSel0Dto0_uid316_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_c = rShiftCount_uid205_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[3:2];

    // rightShiftStage1_uid328_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(MUX,327)@11
    assign rightShiftStage1_uid328_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s = rightShiftStageSel0Dto0_uid316_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_bit_select_merged_c;
    always @(rightShiftStage1_uid328_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s or rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q or rightShiftStage1Idx1_uid320_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q or rightShiftStage1Idx2_uid323_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q or rightShiftStage1Idx3_uid326_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q)
    begin
        unique case (rightShiftStage1_uid328_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s)
            2'b00 : rightShiftStage1_uid328_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = rightShiftStage0_uid317_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
            2'b01 : rightShiftStage1_uid328_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = rightShiftStage1Idx1_uid320_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
            2'b10 : rightShiftStage1_uid328_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = rightShiftStage1Idx2_uid323_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
            2'b11 : rightShiftStage1_uid328_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = rightShiftStage1Idx3_uid326_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
            default : rightShiftStage1_uid328_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 30'b0;
        endcase
    end

    // prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,207)@11
    assign prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in = rightShiftStage1_uid328_prodPostRightShift_uid207_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[28:0];
    assign prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in[28:11];

    // redist9_prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_1(DELAY,345)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist9_prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_1_q <= '0;
        end
        else
        begin
            redist9_prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_1_q <= $unsigned(prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b);
        end
    end

    // allOnes_uid209_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(LOGICAL,208)@12 + 1
    assign allOnes_uid209_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_qi = $unsigned(redist9_prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_1_q == 18'b111111111111111111 ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    allOnes_uid209_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_delay ( .xin(allOnes_uid209_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_qi), .xout(allOnes_uid209_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // invAllOnes_uid211_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(LOGICAL,210)@13
    assign invAllOnes_uid211_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = ~ (allOnes_uid209_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q);

    // redist10_prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_2(DELAY,346)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist10_prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_2_q <= $unsigned(redist9_prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_1_q);
        end
    end

    // prodPostRightShiftPostRnd_uid213_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(ADD,212)@13
    assign prodPostRightShiftPostRnd_uid213_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_a = {1'b0, redist10_prodPostRightShiftPost_uid208_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b_2_q};
    assign prodPostRightShiftPostRnd_uid213_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = {18'b000000000000000000, invAllOnes_uid211_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q};
    assign prodPostRightShiftPostRnd_uid213_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_o = $unsigned(prodPostRightShiftPostRnd_uid213_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_a) + $unsigned(prodPostRightShiftPostRnd_uid213_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b);
    assign prodPostRightShiftPostRnd_uid213_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = prodPostRightShiftPostRnd_uid213_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_o[18:0];

    // prodPostRightShiftPostRndRange_uid214_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(BITSELECT,213)@13
    assign prodPostRightShiftPostRndRange_uid214_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in = prodPostRightShiftPostRnd_uid213_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[17:0];
    assign prodPostRightShiftPostRndRange_uid214_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = prodPostRightShiftPostRndRange_uid214_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_in[17:1];

    // redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_notEnable(LOGICAL,382)
    assign redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_notEnable_q = $unsigned(~ (VCC_q));

    // redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_nor(LOGICAL,383)
    assign redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_nor_q = ~ (redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_notEnable_q | redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_sticky_ena_q);

    // redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_last(CONSTANT,379)
    assign redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_last_q = $unsigned(4'b0110);

    // redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_cmp(LOGICAL,380)
    assign redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_cmp_b = {1'b0, redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_rdcnt_q};
    assign redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_cmp_q = $unsigned(redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_last_q == redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_cmp_b ? 1'b1 : 1'b0);

    // redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_cmpReg(REG,381)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_cmpReg_q <= $unsigned(redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_cmp_q);
        end
    end

    // redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_sticky_ena(REG,384)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_nor_q == 1'b1)
        begin
            redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_sticky_ena_q <= $unsigned(redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_cmpReg_q);
        end
    end

    // redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_enaAnd(LOGICAL,385)
    assign redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_enaAnd_q = redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_sticky_ena_q & VCC_q;

    // redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_rdcnt(COUNTER,377)
    // low=0, high=7, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_rdcnt_i <= 3'd0;
        end
        else
        begin
            redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_rdcnt_i <= $unsigned(redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_rdcnt_i) + $unsigned(3'd1);
        end
    end
    assign redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_rdcnt_q = redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_rdcnt_i[2:0];

    // redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_wraddr(REG,378)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_wraddr_q <= $unsigned(3'b111);
        end
        else
        begin
            redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_wraddr_q <= $unsigned(redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_rdcnt_q);
        end
    end

    // redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem(DUALMEM,376)
    assign redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_ia = $unsigned(redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_1_q);
    assign redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_aa = redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_wraddr_q;
    assign redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_ab = redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_rdcnt_q;
    assign redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_ena_OrRstB = areset | redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_enaAnd_q[0];
    assign redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(5),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(5),
        .widthad_b(3),
        .numwords_b(8),
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
    ) redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_dmem (
        .clocken1(redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_reset0),
        .clock1(clk),
        .address_a(redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_aa),
        .data_a(redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_ab),
        .q_b(redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_iq),
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
    assign redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_q = redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_iq[4:0];

    // yIsZero_uid198_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(LOGICAL,197)@13
    assign yIsZero_uid198_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b = {4'b0000, GND_q};
    assign yIsZero_uid198_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = $unsigned(redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_q == yIsZero_uid198_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b ? 1'b1 : 1'b0);

    // resFinal_uid216_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x(MUX,215)@13
    assign resFinal_uid216_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s = yIsZero_uid198_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
    always @(resFinal_uid216_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s or prodPostRightShiftPostRndRange_uid214_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b or cstValOvf_uid215_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q)
    begin
        unique case (resFinal_uid216_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_s)
            1'b0 : resFinal_uid216_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = prodPostRightShiftPostRndRange_uid214_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_b;
            1'b1 : resFinal_uid216_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = cstValOvf_uid215_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q;
            default : resFinal_uid216_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q = 17'b0;
        endcase
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Convert1_rnd_x_sel(BITSELECT,248)@13
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Convert1_rnd_x_sel_b = resFinal_uid216_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Divide1_x_q[16:5];

    // redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Convert1_rnd_x_sel_b_1(DELAY,341)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Convert1_rnd_x_sel_b_1_q <= '0;
        end
        else
        begin
            redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Convert1_rnd_x_sel_b_1_q <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Convert1_rnd_x_sel_b);
        end
    end

    // redist3_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_11(DELAY,339)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_11_q <= $unsigned(redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_10_mem_q);
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma(CHAINMULTADD,331)@14 + 5
    // out q@20
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_reset = areset;
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ena0 = 1'b1;
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ena1 = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ena0;
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ena2 = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ena0;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ah[0] <= '0;
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ch[0] <= '0;
        end
        else
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ah[0] <= redist3_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_X_x_lutmem_r_11_q;
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ch[0] <= redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Convert1_rnd_x_sel_b_1_q;
        end
    end

    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_a0 = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ah[0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_c0 = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ch[0];
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(5),
        .ax_clken("0"),
        .ax_width(12),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(17)
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_DSP0 (
        .clk(clk),
        .ena({ LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ena2, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ena1, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_ena0 }),
        .clr({ LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_reset, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_reset }),
        .ay(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_a0),
        .ax(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_c0),
        .resulta(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_s0),
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
    dspba_delay_ver #( .width(17), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_delay0 ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_s0), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_q = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_qq0[16:0]);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_x(SUB,102)@20
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_x_a = $unsigned({6'b000000, redist32_ChannelIn_cunroll_x_in_4_SFN_tpl_20_outputreg0_q});
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_x_b = $unsigned({1'b0, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Mult_x_cma_q});
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_x_o = $unsigned($signed(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_x_a) - $signed(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_x_b));
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_x_o[17:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_PostCast_primWireOut_sel_x(BITSELECT,175)@20
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_PostCast_primWireOut_sel_x_b = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_x_q[11:0]);

    // redist11_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_PostCast_primWireOut_sel_x_b_1(DELAY,347)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist11_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist11_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_PostCast_primWireOut_sel_x_b);
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem(DUALMEM,286)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[8:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(1),
        .widthad_a(9),
        .numwords_a(512),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000_unpaired_Y_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_ir[0:0];

    // redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_r_18(DELAY,336)
    dspba_delay_ver #( .width(1), .depth(18), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_r_18 ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_r), .xout(redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_r_18_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ_x(LOGICAL,93)@21
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ_x_a = {11'b00000000000, redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Y_x_lutmem_r_18_q};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ_x_q = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ_x_a == redist11_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Sub_PostCast_primWireOut_sel_x_b_1_q ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem(DUALMEM,280)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[8:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(9),
        .numwords_a(512),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000aired_SufF1_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ5_x(LOGICAL,98)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ5_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF1_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ5_x_q = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ5_x_b ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem(DUALMEM,283)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[8:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(9),
        .numwords_a(512),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000aired_SufF8_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ3_x(LOGICAL,96)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ3_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF8_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ3_x_q = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ3_x_b ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem(DUALMEM,282)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[8:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(9),
        .numwords_a(512),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000aired_SufF7_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ4_x(LOGICAL,97)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ4_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF7_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ4_x_q = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ4_x_b ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem(DUALMEM,281)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[8:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(9),
        .numwords_a(512),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000aired_SufF6_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ1_x(LOGICAL,94)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ1_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF6_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ1_x_q = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ1_x_b ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem(DUALMEM,284)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[8:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(9),
        .numwords_a(512),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000aired_SufF9_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ2_x(LOGICAL,95)@3
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ2_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_SufF9_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ2_x_q = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ2_x_b ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Or_x(LOGICAL,101)@3 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Or_x_qi = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ2_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ1_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ4_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ3_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ5_x_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Or_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Or_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Or_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist14_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Or_x_q_18(DELAY,350)
    dspba_delay_ver #( .width(1), .depth(17), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist14_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Or_x_q_18 ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Or_x_q), .xout(redist14_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Or_x_q_18_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_And1_x(LOGICAL,92)@21
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_And1_x_q = redist14_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_Or_x_q_18_q & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_CmpEQ_x_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_BitExtract_x(BITSELECT,63)@4
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_BitExtract_x_b = redist30_ChannelIn_cunroll_x_in_4_SFN_tpl_4_q[0:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ1_x(LOGICAL,65)@4
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ1_x_q = $unsigned(GND_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_BitExtract_x_b ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem(DUALMEM,279)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[7:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(1),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000fig_Index_X_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_ir[0:0];

    // redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_r_1(DELAY,340)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_r_1_q <= '0;
        end
        else
        begin
            redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_r_1_q <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_r);
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ_x(LOGICAL,64)@4
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ_x_q = $unsigned(redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_X_x_lutmem_r_1_q == GND_q ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And1_x(LOGICAL,61)@4
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And1_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ_x_q & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ1_x_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_Not_x(LOGICAL,78)@4
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_Not_x_q = ~ (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ_x_q);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_Or_x(LOGICAL,79)@4
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_Or_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_Not_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And1_x_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem(DUALMEM,269)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[7:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF0_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ10_x(LOGICAL,66)@3 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ10_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF0_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ10_x_qi = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ10_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ10_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ10_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ10_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem(DUALMEM,270)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[7:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF1_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ12_x(LOGICAL,68)@3 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ12_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF1_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ12_x_qi = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ12_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ12_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ12_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ12_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem(DUALMEM,271)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[7:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF2_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ11_x(LOGICAL,67)@3 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ11_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF2_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ11_x_qi = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ11_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ11_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ11_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ11_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem(DUALMEM,272)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[7:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF3_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ9_x(LOGICAL,75)@3 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ9_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF3_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ9_x_qi = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ9_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ9_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ9_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ9_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem(DUALMEM,273)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[7:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF4_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ8_x(LOGICAL,74)@3 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ8_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF4_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ8_x_qi = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ8_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ8_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ8_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ8_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem(DUALMEM,274)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[7:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF5_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ7_x(LOGICAL,73)@3 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ7_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF5_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ7_x_qi = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ7_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ7_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ7_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ7_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem(DUALMEM,275)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[7:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF6_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ5_x(LOGICAL,71)@3 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ5_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF6_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ5_x_qi = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ5_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ5_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ5_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ5_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem(DUALMEM,276)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[7:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF7_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ6_x(LOGICAL,72)@3 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ6_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF7_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ6_x_qi = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ6_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ6_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ6_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ6_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem(DUALMEM,277)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[7:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF8_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ3_x(LOGICAL,69)@3 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ3_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF8_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ3_x_qi = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ3_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ3_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ3_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ3_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem(DUALMEM,278)@1 + 2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[7:0];
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_ena_NotRstA = ~ (areset);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_LongPRAC0000Index_SufF9_x_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_dmem (
        .clocken0(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_ena_NotRstA),
        .sclr(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_reset0),
        .clock0(clk),
        .address_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_aa),
        .q_a(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_ir),
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
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_r = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_ir[3:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ4_x(LOGICAL,70)@3 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ4_x_b = {4'b0000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_SufF9_x_lutmem_r};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ4_x_qi = $unsigned(redist28_ChannelIn_cunroll_x_in_5_SubFrame_tpl_3_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ4_x_b ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ4_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ4_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ4_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_Or1_x(LOGICAL,80)@4
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_Or1_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ4_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ3_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ6_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ5_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ7_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ8_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ9_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ11_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ12_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_CmpEQ10_x_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And2_x(LOGICAL,62)@4 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And2_x_qi = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_Or1_x_q & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_Or_x_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And2_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And2_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And2_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist15_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And2_x_q_17(DELAY,351)
    dspba_delay_ver #( .width(1), .depth(16), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist15_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And2_x_q_17 ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And2_x_q), .xout(redist15_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And2_x_q_17_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist22_ChannelIn_cunroll_x_in_10_prach_tech_tpl_21(DELAY,358)
    dspba_delay_ver #( .width(1), .depth(21), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist22_ChannelIn_cunroll_x_in_10_prach_tech_tpl_21 ( .xin(in_10_prach_tech_tpl), .xout(redist22_ChannelIn_cunroll_x_in_10_prach_tech_tpl_21_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // Mux1(MUX,44)@21 + 1
    assign Mux1_s = redist22_ChannelIn_cunroll_x_in_10_prach_tech_tpl_21_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            Mux1_q <= 1'b0;
        end
        else
        begin
            unique case (Mux1_s)
                1'b0 : Mux1_q <= redist15_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_4G_Config_Index_And2_x_q_17_q;
                1'b1 : Mux1_q <= LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_5G_Config_Index_unpaired_And1_x_q;
                default : Mux1_q <= 1'b0;
            endcase
        end
    end

    // And_rsrvd_fix(LOGICAL,28)@22
    assign And_rsrvd_fix_q = Mux1_q & redist16_ChannelIn_cunroll_x_in_2_vin0_tpl_22_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_CmpEQ1_x(LOGICAL,142)@0
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_CmpEQ1_x_q = $unsigned(in_4_SFN_tpl == in_17_SFN_cplane_tpl ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_CmpEQ_x(LOGICAL,141)@0
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_CmpEQ_x_q = $unsigned(in_5_SubFrame_tpl == in_16_Subframe_cplane_tpl ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_And_x(LOGICAL,140)@0 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_And_x_qi = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_CmpEQ_x_q & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_CmpEQ1_x_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_And_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_And_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_And_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist12_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_And_x_q_21(DELAY,348)
    dspba_delay_ver #( .width(1), .depth(20), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist12_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_And_x_q_21 ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_And_x_q), .xout(redist12_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_And_x_q_21_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_latch_0L_Mux_x(MUX,143)@21 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_latch_0L_Mux_x_s = redist38_CmpNE_q_21_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_latch_0L_Mux_x_q <= 1'b0;
        end
        else
        begin
            unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_latch_0L_Mux_x_s)
                1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_latch_0L_Mux_x_q <= LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_latch_0L_Mux_x_q;
                1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_latch_0L_Mux_x_q <= redist12_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_And_x_q_21_q;
                default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_latch_0L_Mux_x_q <= 1'b0;
            endcase
        end
    end

    // And1(LOGICAL,29)@22
    assign And1_q = redist16_ChannelIn_cunroll_x_in_2_vin0_tpl_22_q & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_SFN_SubFN_valid_gen_latch_0L_Mux_x_q;

    // redist21_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_22(DELAY,357)
    dspba_delay_ver #( .width(1), .depth(19), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist21_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_22 ( .xin(redist20_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_3_q), .xout(redist21_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_22_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // Mux3(MUX,46)@22
    assign Mux3_s = redist21_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_22_q;
    always @(Mux3_s or And1_q or And_rsrvd_fix_q)
    begin
        unique case (Mux3_s)
            1'b0 : Mux3_q = And1_q;
            1'b1 : Mux3_q = And_rsrvd_fix_q;
            default : Mux3_q = 1'b0;
        endcase
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_delay_valid_x(LOGICAL,137)@22
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_delay_valid_x_q = Mux3_q & redist39_CmpNE_q_22_q;

    // startsym_lutmem(DUALMEM,268)@1 + 2
    assign startsym_lutmem_aa = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DefaultLatch_Mux_x_q[8:0];
    assign startsym_lutmem_ena_NotRstA = ~ (areset);
    assign startsym_lutmem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(4),
        .widthad_a(9),
        .numwords_a(512),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_startsym_lutmem.hex")),
        .init_file_layout("PORT_A"),
        .intended_device_family("Agilex 7")
    ) startsym_lutmem_dmem (
        .clocken0(startsym_lutmem_ena_NotRstA),
        .sclr(startsym_lutmem_reset0),
        .clock0(clk),
        .address_a(startsym_lutmem_aa),
        .q_a(startsym_lutmem_ir),
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
    assign startsym_lutmem_r = startsym_lutmem_ir[3:0];

    // redist35_ChannelIn_cunroll_x_in_15_start_sym_tpl_3(DELAY,371)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist35_ChannelIn_cunroll_x_in_15_start_sym_tpl_3_q <= $unsigned(redist34_ChannelIn_cunroll_x_in_15_start_sym_tpl_2_q);
        end
    end

    // Mux4(MUX,47)@3
    assign Mux4_s = redist20_ChannelIn_cunroll_x_in_9_c_m_plane_sel_tpl_3_q;
    always @(Mux4_s or redist35_ChannelIn_cunroll_x_in_15_start_sym_tpl_3_q or startsym_lutmem_r)
    begin
        unique case (Mux4_s)
            1'b0 : Mux4_q = redist35_ChannelIn_cunroll_x_in_15_start_sym_tpl_3_q;
            1'b1 : Mux4_q = startsym_lutmem_r;
            default : Mux4_q = 4'b0;
        endcase
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_CmpEQ4_x(LOGICAL,128)@3 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_CmpEQ4_x_qi = $unsigned(Mux4_q == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Const6_x_q ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_CmpEQ4_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_CmpEQ4_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_CmpEQ4_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist13_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_CmpEQ4_x_q_19(DELAY,349)
    dspba_delay_ver #( .width(1), .depth(18), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    redist13_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_CmpEQ4_x_q_19 ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_CmpEQ4_x_q), .xout(redist13_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_CmpEQ4_x_q_19_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Mux_x(MUX,135)@22
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Mux_x_s = redist13_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_CmpEQ4_x_q_19_q;
    always @(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Mux_x_s or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_delay_valid_x_q or LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_l0)
    begin
        unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Mux_x_s)
            1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Mux_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_delay_valid_x_q;
            1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Mux_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop_x_l0;
            default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Mux_x_q = 1'b0;
        endcase
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x(LOOP,134)@22 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_running <= $unsigned(1'b0);
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_pending <= $unsigned(1'b0);
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_q0 <= 19'b0;
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_e0 <= '1;
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_v <= $unsigned(1'b0);
        end
        else
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_v <= $unsigned(1'b0);
            if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Mux_x_q == 1'b1)
            begin
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_e0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Const5_x_q) - $unsigned(19'd1);
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_q0 <= 19'b0;
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_running <= $unsigned(1'b1);
                if (VCC_q == 1'b1)
                begin
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_pending <= $unsigned(1'b0);
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (VCC_q == 1'b1)
                begin
                    if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_pending == 1'b1)
                    begin
                        LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_v <= $unsigned(1'b1);
                    end
                    else if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_running == 1'b1)
                    begin
                        LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_v <= $unsigned(1'b1);
                        if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_q0 == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_e0)
                        begin
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_q0 <= 19'b0;
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_running <= $unsigned(1'b0);
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_q0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_q0) + $unsigned(19'd1);
                        end
                    end
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_f0 = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_q0 == 19'b0000000000000000000 ? 1'b1 : 1'b0);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_l0 = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_q0 == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_e0 ? 1'b1 : 1'b0);

    // ChannelOut_cunroll_x(PORTOUT,56)@23 + 1
    assign out_2_vout_tpl = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_DelayValid_Delayed_valid_gen_Loop1_x_v;
    assign out_3_cout_tpl = redist17_ChannelIn_cunroll_x_in_3_chin0_tpl_23_mem_q;
    assign out_1_real_dout_tpl = redist18_ChannelIn_cunroll_x_in_1_real_din0_tpl_23_mem_q;
    assign out_1_imag_dout_tpl = redist19_ChannelIn_cunroll_x_in_1_imag_din0_tpl_23_mem_q;
    assign out_4_TimeReference_tpl = BitCombine_q;
    assign out_5_cp_start_tpl = redist37_Mux_q_20_mem_q;
    assign out_6_gt_end_tpl = redist36_Mux2_q_20_mem_q;
    assign out_7_prach_outstart_tpl = redist25_ChannelIn_cunroll_x_in_13_prach_out_start_tpl_23_mem_q;
    assign out_8_prach_outend_tpl = redist26_ChannelIn_cunroll_x_in_14_prach_out_end_tpl_23_mem_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_CmpEQ3_x(LOGICAL,145)@0
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_CmpEQ3_x_b = {7'b0000000, GND_q};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_CmpEQ3_x_q = $unsigned(in_5_SubFrame_tpl == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_CmpEQ3_x_b ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_delay_valid1_x(LOGICAL,148)@0
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_delay_valid1_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_CmpEQ3_x_q & CmpNE_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_Or_x(LOGICAL,150)@0 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_Or_x_qi = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_delay_valid1_x_q | LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_Or_x_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_Or_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_Or_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_Or_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_latch_0L_Mux_x(MUX,153)@0 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_latch_0L_Mux_x_s = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_delay_valid1_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_latch_0L_Mux_x_q <= 4'b0;
        end
        else
        begin
            unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_latch_0L_Mux_x_s)
                1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_latch_0L_Mux_x_q <= LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_latch_0L_Mux_x_q;
                1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_latch_0L_Mux_x_q <= in_15_start_sym_tpl;
                default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_StartSymLatch_at_oth_SubFN_DefaultLatch1_latch_0L_Mux_x_q <= 4'b0;
            endcase
        end
    end

endmodule
