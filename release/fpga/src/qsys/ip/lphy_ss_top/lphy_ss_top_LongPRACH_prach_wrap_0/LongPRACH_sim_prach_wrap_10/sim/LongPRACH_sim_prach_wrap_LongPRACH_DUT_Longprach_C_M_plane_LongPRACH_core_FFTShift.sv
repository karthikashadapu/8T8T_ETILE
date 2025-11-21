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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift (
    input wire [0:0] in_2_data_valid_tpl,
    input wire [7:0] in_3_chin_tpl,
    input wire [15:0] in_1_real_data_in_tpl,
    input wire [15:0] in_1_imag_data_in_tpl,
    output wire [0:0] out_2_valid_out_tpl,
    output wire [7:0] out_3_ch_no_tpl,
    output wire [15:0] out_1_real_data_out_tpl,
    output wire [15:0] out_1_imag_data_out_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [12:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_PostCast_primWireOut_extendPad_sel_x_b;
    wire DualMem_imag_x_reset0;
    wire DualMem_imag_x_ena_NotRstA;
    wire [15:0] DualMem_imag_x_ia;
    wire [10:0] DualMem_imag_x_aa;
    wire [10:0] DualMem_imag_x_ab;
    wire [15:0] DualMem_imag_x_iq;
    wire [15:0] DualMem_imag_x_q;
    wire DualMem_real_x_reset0;
    wire DualMem_real_x_ena_NotRstA;
    wire [15:0] DualMem_real_x_ia;
    wire [10:0] DualMem_real_x_aa;
    wire [10:0] DualMem_real_x_ab;
    wire [15:0] DualMem_real_x_iq;
    wire [15:0] DualMem_real_x_q;
    wire [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_BitCombine_x_q;
    wire [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Const2_x_q;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_running;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_pending;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v;
    reg [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_q0;
    reg [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_e0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_f0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_l0;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Not_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_EdgeDetect_Xor_x_q;
    wire [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Add_x_a;
    wire [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Add_x_b;
    logic [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Add_x_o;
    wire [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Add_x_q;
    wire [9:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Const3_x_q;
    wire [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add_x_a;
    wire [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add_x_b;
    logic [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add_x_o;
    wire [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add_x_q;
    wire [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_x_a;
    wire [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_x_b;
    logic [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_x_o;
    wire [11:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_x_q;
    wire [1:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Const1_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_Xor_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_s;
    reg [7:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_q;
    wire [9:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Convert_sel_x_b;
    wire [9:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Convert_sel_x_b;
    wire [10:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b;
    reg [10:0] redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1_q;
    reg [10:0] redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_2_q;
    reg [7:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_q_3_q;
    reg [7:0] redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_q_3_delay_0;
    reg [0:0] redist3_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_1_q;
    reg [0:0] redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_2_q;
    reg [0:0] redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v_3_q;
    reg [0:0] redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v_3_delay_0;
    reg [0:0] redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v_3_delay_1;
    reg [15:0] redist6_DualMem_real_x_q_1_q;
    reg [15:0] redist7_DualMem_imag_x_q_1_q;
    reg [0:0] redist8_ChannelIn_cunroll_x_in_2_data_valid_tpl_1_q;
    reg [7:0] redist9_ChannelIn_cunroll_x_in_3_chin_tpl_1_q;
    reg [15:0] redist10_ChannelIn_cunroll_x_in_1_real_data_in_tpl_1_q;
    reg [15:0] redist11_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_1_q;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Const1_x(CONSTANT,22)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Const1_x_q = $unsigned(2'b01);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add_x(ADD,19)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add_x_a = {1'b0, redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1_q};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add_x_b = {11'b00000000000, in_2_data_valid_tpl};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add_x_o = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add_x_a) + $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add_x_b);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add_x_o[11:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x(BITSELECT,32)@0
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add_x_q[10:0];

    // redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1(DELAY,36)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b);
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_x(ADD,20)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_x_a = {1'b0, redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1_q};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_x_b = {10'b0000000000, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Const1_x_q};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_x_o = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_x_a) + $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_x_b);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_x_o[11:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_PostCast_primWireOut_extendPad_sel_x(BITSELECT,5)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_PostCast_primWireOut_extendPad_sel_x_b = {1'b0, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_x_q[11:0]};

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x(BITSELECT,25)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_Add1_PostCast_primWireOut_extendPad_sel_x_b[10:10];

    // redist3_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_1(DELAY,39)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist3_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_1_q <= '0;
        end
        else
        begin
            redist3_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_1_q <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b);
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Not_x(LOGICAL,14)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Not_x_q = ~ (redist3_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_1_q);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Const3_x(CONSTANT,18)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Const3_x_q = $unsigned(10'b1000000000);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Const2_x(CONSTANT,12)
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Const2_x_q = $unsigned(11'b10000000000);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_EdgeDetect_Xor_x(LOGICAL,16)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_EdgeDetect_Xor_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b ^ redist3_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_1_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x(LOOP,13)@1 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_running <= $unsigned(1'b0);
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_pending <= $unsigned(1'b0);
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_q0 <= 11'b0;
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_e0 <= '1;
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v <= $unsigned(1'b0);
        end
        else
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v <= $unsigned(1'b0);
            if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_EdgeDetect_Xor_x_q == 1'b1)
            begin
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_e0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Const2_x_q) - $unsigned(11'd1);
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_q0 <= 11'b0;
                LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_running <= $unsigned(1'b1);
                if (VCC_q == 1'b1)
                begin
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_pending <= $unsigned(1'b0);
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (VCC_q == 1'b1)
                begin
                    if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_pending == 1'b1)
                    begin
                        LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v <= $unsigned(1'b1);
                    end
                    else if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_running == 1'b1)
                    begin
                        LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v <= $unsigned(1'b1);
                        if (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_q0 == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_e0)
                        begin
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_q0 <= 11'b0;
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_running <= $unsigned(1'b0);
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_q0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_q0) + $unsigned(11'd1);
                        end
                    end
                    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_f0 = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_q0 == 11'b00000000000 ? 1'b1 : 1'b0);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_l0 = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_q0 == LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_e0 ? 1'b1 : 1'b0);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Convert_sel_x(BITSELECT,30)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Convert_sel_x_b = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_q0[9:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Add_x(ADD,17)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Add_x_a = {1'b0, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Convert_sel_x_b};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Add_x_b = {1'b0, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Const3_x_q};
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Add_x_o = $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Add_x_a) + $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Add_x_b);
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Add_x_q = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Add_x_o[10:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Convert_sel_x(BITSELECT,31)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Convert_sel_x_b = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Add_x_q[9:0];

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_BitCombine_x(BITJOIN,10)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_BitCombine_x_q = {LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Not_x_q, LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_FFT_shiftAddrMap_Convert_sel_x_b};

    // redist11_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_1(DELAY,47)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist11_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_1_q <= $unsigned(in_1_imag_data_in_tpl);
        end
    end

    // redist8_ChannelIn_cunroll_x_in_2_data_valid_tpl_1(DELAY,44)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist8_ChannelIn_cunroll_x_in_2_data_valid_tpl_1_q <= '0;
        end
        else
        begin
            redist8_ChannelIn_cunroll_x_in_2_data_valid_tpl_1_q <= $unsigned(in_2_data_valid_tpl);
        end
    end

    // redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_2(DELAY,37)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_2_q <= '0;
        end
        else
        begin
            redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_2_q <= $unsigned(redist0_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_1_q);
        end
    end

    // DualMem_imag_x(DUALMEM,8)@2 + 2
    assign DualMem_imag_x_ia = $unsigned(redist11_ChannelIn_cunroll_x_in_1_imag_data_in_tpl_1_q);
    assign DualMem_imag_x_aa = redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_2_q;
    assign DualMem_imag_x_ab = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_BitCombine_x_q;
    assign DualMem_imag_x_ena_NotRstA = ~ (areset);
    assign DualMem_imag_x_reset0 = areset;
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
        .intended_device_family("Agilex 7")
    ) DualMem_imag_x_dmem (
        .clocken0(DualMem_imag_x_ena_NotRstA),
        .sclr(DualMem_imag_x_reset0),
        .clock0(clk),
        .address_a(DualMem_imag_x_aa),
        .data_a(DualMem_imag_x_ia),
        .wren_a(redist8_ChannelIn_cunroll_x_in_2_data_valid_tpl_1_q[0]),
        .address_b(DualMem_imag_x_ab),
        .q_b(DualMem_imag_x_iq),
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
    assign DualMem_imag_x_q = DualMem_imag_x_iq[15:0];

    // redist7_DualMem_imag_x_q_1(DELAY,43)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist7_DualMem_imag_x_q_1_q <= $unsigned(DualMem_imag_x_q);
        end
    end

    // redist10_ChannelIn_cunroll_x_in_1_real_data_in_tpl_1(DELAY,46)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist10_ChannelIn_cunroll_x_in_1_real_data_in_tpl_1_q <= $unsigned(in_1_real_data_in_tpl);
        end
    end

    // DualMem_real_x(DUALMEM,9)@2 + 2
    assign DualMem_real_x_ia = $unsigned(redist10_ChannelIn_cunroll_x_in_1_real_data_in_tpl_1_q);
    assign DualMem_real_x_aa = redist1_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_SampleDelay_PostCast_primWireOut_sel_x_b_2_q;
    assign DualMem_real_x_ab = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_BitCombine_x_q;
    assign DualMem_real_x_ena_NotRstA = ~ (areset);
    assign DualMem_real_x_reset0 = areset;
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
        .intended_device_family("Agilex 7")
    ) DualMem_real_x_dmem (
        .clocken0(DualMem_real_x_ena_NotRstA),
        .sclr(DualMem_real_x_reset0),
        .clock0(clk),
        .address_a(DualMem_real_x_aa),
        .data_a(DualMem_real_x_ia),
        .wren_a(redist8_ChannelIn_cunroll_x_in_2_data_valid_tpl_1_q[0]),
        .address_b(DualMem_real_x_ab),
        .q_b(DualMem_real_x_iq),
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
    assign DualMem_real_x_q = DualMem_real_x_iq[15:0];

    // redist6_DualMem_real_x_q_1(DELAY,42)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_DualMem_real_x_q_1_q <= $unsigned(DualMem_real_x_q);
        end
    end

    // redist9_ChannelIn_cunroll_x_in_3_chin_tpl_1(DELAY,45)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist9_ChannelIn_cunroll_x_in_3_chin_tpl_1_q <= $unsigned(in_3_chin_tpl);
        end
    end

    // redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_2(DELAY,40)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_2_q <= '0;
        end
        else
        begin
            redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_2_q <= $unsigned(redist3_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_1_q);
        end
    end

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_Xor_x(LOGICAL,27)@2
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_Xor_x_q = redist4_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_2_q ^ redist3_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_wr_control_Wr_addr_gen_datablkwrite1_x_b_1_q;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x(MUX,28)@2 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_s = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_Xor_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_q <= 8'b0;
        end
        else
        begin
            unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_s)
                1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_q <= LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_q;
                1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_q <= redist9_ChannelIn_cunroll_x_in_3_chin_tpl_1_q;
                default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_q <= 8'b0;
            endcase
        end
    end

    // redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_q_3(DELAY,38)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_q_3_delay_0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_q);
            redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_q_3_q <= redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_q_3_delay_0;
        end
    end

    // redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v_3(DELAY,41)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v_3_delay_0 <= '0;
        end
        else
        begin
            redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v_3_delay_0 <= $unsigned(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v_3_delay_1 <= redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v_3_delay_0;
            redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v_3_q <= redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v_3_delay_1;
        end
    end

    // ChannelOut_cunroll_x(PORTOUT,7)@5 + 1
    assign out_2_valid_out_tpl = redist5_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Mem_rd_wr_Mem_rd_control_Loop_x_v_3_q;
    assign out_3_ch_no_tpl = redist2_LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift_Subsystem_latch_0L_Mux_x_q_3_q;
    assign out_1_real_data_out_tpl = redist6_DualMem_real_x_q_1_q;
    assign out_1_imag_data_out_tpl = redist7_DualMem_imag_x_q_1_q;

endmodule
