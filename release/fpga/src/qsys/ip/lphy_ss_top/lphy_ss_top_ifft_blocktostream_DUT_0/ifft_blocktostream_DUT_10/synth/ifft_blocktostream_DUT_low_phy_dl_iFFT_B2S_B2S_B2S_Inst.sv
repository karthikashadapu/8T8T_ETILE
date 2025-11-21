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

// SystemVerilog created from ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst
// SystemVerilog created on Thu Jun 12 21:17:49 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst (
    input wire [0:0] in_1_vin_tpl,
    input wire [7:0] in_2_chin_tpl,
    input wire [15:0] in_3_real_din_tpl,
    input wire [15:0] in_3_imag_din_tpl,
    input wire [3:0] in_4_FFTSize_tpl,
    input wire [10:0] in_5_cplen_tpl,
    input wire [11:0] in_6_nprb_tpl,
    output wire [15:0] out_3_real_q_tpl,
    output wire [15:0] out_3_imag_q_tpl,
    output wire [1:0] out_2_cout_tpl,
    output wire [0:0] out_1_vout_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [12:0] BitCombine_q;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_q;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_delay_0;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_delay_1;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_delay_2;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_delay_3;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Const5_x_q;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_running;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_pending;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_v;
    reg [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_q0;
    reg [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_e0;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_f0;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_l0;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_x_a;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_x_b;
    logic [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_x_o;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba_Mux_x_s;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba1_Mux_x_s;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba1_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_edgedetector_Xor_x_q;
    reg [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_s;
    reg [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux1_x_s;
    reg [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux1_x_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Add2_x_a;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Add2_x_b;
    logic [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Add2_x_o;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Add2_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_BitCombine2_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_ChooseBits_x_a;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_ChooseBits_x_q;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Constant1_x_q;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Constant7_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_x_a;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_x_b;
    logic [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_x_o;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_x_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Add2_x_a;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Add2_x_b;
    logic [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Add2_x_o;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Add2_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_BitCombine2_x_q;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Constant7_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_x_a;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_x_b;
    logic [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_x_o;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_x_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Add2_x_a;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Add2_x_b;
    logic [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Add2_x_o;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Add2_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_BitCombine2_x_q;
    wire [2:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Constant1_x_q;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Constant7_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_x_a;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_x_b;
    logic [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_x_o;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_x_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Add2_x_a;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Add2_x_b;
    logic [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Add2_x_o;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Add2_x_q;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Constant7_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_x_a;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_x_b;
    logic [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_x_o;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_s;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Not_x_q;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_running;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_pending;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v;
    reg [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0;
    reg [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_e0;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_f0;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_l0;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_And_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_And1_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Not1_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Or_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Xor_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Xor1_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_sample_maxlatch_0L_Mux_x_s;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_sample_maxlatch_0L_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_qi;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_q;
    wire [16:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_a;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_qi;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Constant4_x_q;
    wire [16:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Sub2_x_a;
    wire [16:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Sub2_x_b;
    logic [16:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Sub2_x_o;
    wire [16:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Sub2_x_q;
    wire [16:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_x_a;
    wire [16:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_x_b;
    logic [16:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_x_o;
    wire [16:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_x_q;
    wire [7:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_a;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_qi;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft1_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Const1_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Const2_x_q;
    wire [3:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Const3_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Constant2_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux1_x_s;
    reg [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux1_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux2_x_s;
    reg [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux2_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_s;
    reg [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L1_Mux_x_s;
    reg [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L1_Mux_x_q;
    reg [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_s;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_q;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_s;
    reg [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_s;
    reg [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Antenna_block_x_a;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Antenna_block_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_BitCombine2_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_ChooseBits_x_a;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_ChooseBits_x_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_x_a;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_x_b;
    logic [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_x_o;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_x_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_x_a;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_x_b;
    logic [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_x_o;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wba_x_a;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wba_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_a;
    wire [9:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Antenna_block_x_a;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Antenna_block_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_BitCombine2_x_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_ChooseBits_x_a;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_ChooseBits_x_q;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_x_a;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_x_b;
    logic [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_x_o;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_x_q;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_x_a;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_x_b;
    logic [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_x_o;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_x_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wba_x_a;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wba_x_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_a;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_q;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Antenna_block_x_a;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Antenna_block_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_BitCombine2_x_q;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_ChooseBits_x_a;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_ChooseBits_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_x_a;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_x_b;
    logic [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_x_o;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_x_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_x_a;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_x_b;
    logic [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_x_o;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_x_q;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wba_x_a;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wba_x_q;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_a;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Antenna_block_x_a;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Antenna_block_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_BitCombine2_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_ChooseBits_x_a;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_ChooseBits_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_x_a;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_x_b;
    logic [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_x_o;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_x_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_x_a;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_x_b;
    logic [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_x_o;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wba_x_a;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wba_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x_a;
    wire [8:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_s;
    reg [3:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_s;
    reg [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba1_Mux_x_s;
    reg [7:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba1_Mux_x_q;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant3_x_q;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant4_x_q;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant5_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_CmpEQ_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_We_mem1_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_CmpEQ_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_We_mem3_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_CmpEQ_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_We_mem2_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_CmpEQ_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_We_mem4_x_q;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_PostCast_primWireOut_sel_x_b;
    wire [9:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Convert_sel_x_b;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_PostCast_primWireOut_sel_x_b;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Convert_sel_x_b;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_PostCast_primWireOut_sel_x_b;
    wire [8:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Convert_sel_x_b;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_PostCast_primWireOut_sel_x_b;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Convert_sel_x_b;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_PostCast_primWireOut_sel_x_b;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_PostCast_primWireOut_sel_x_b;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_sel_x_b;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Data_Type_Conversion_sel_x_b;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_PostCast_primWireOut_sel_x_b;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_PostCast_primWireOut_sel_x_b;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Data_Type_Conversion_sel_x_b;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_PostCast_primWireOut_sel_x_b;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_PostCast_primWireOut_sel_x_b;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_PostCast_primWireOut_sel_x_b;
    wire [14:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_PostCast_primWireOut_sel_x_b;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Data_Type_Conversion_sel_x_b;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_PostCast_primWireOut_sel_x_b;
    wire [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_PostCast_primWireOut_sel_x_b;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_imag_x_s;
    reg [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_imag_x_q;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_real_x_s;
    reg [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_real_x_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Shift_x_fs_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Shift_x_fs_qint;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Shift_x_fs_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Shift_x_fs_qint;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Shift_x_fs_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Shift_x_fs_qint;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Shift_x_fs_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Shift_x_fs_qint;
    wire [17:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift_x_fs_q;
    wire [17:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift_x_fs_qint;
    wire [1:0] leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_s;
    reg [15:0] leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q;
    wire [3:0] leftShiftStage1Idx1Pad4_uid269_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q;
    wire [11:0] leftShiftStage1Idx1Rng4_uid270_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_in;
    wire [11:0] leftShiftStage1Idx1Rng4_uid270_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_b;
    wire [15:0] leftShiftStage1Idx1_uid271_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q;
    wire [7:0] leftShiftStage1Idx2Pad8_uid272_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q;
    wire [7:0] leftShiftStage1Idx2Rng8_uid273_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_in;
    wire [7:0] leftShiftStage1Idx2Rng8_uid273_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_b;
    wire [15:0] leftShiftStage1Idx2_uid274_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q;
    wire [11:0] leftShiftStage1Idx3Pad12_uid275_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q;
    wire [3:0] leftShiftStage1Idx3Rng12_uid276_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_in;
    wire [3:0] leftShiftStage1Idx3Rng12_uid276_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_b;
    wire [15:0] leftShiftStage1Idx3_uid277_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q;
    wire [1:0] leftShiftStage1_uid279_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_s;
    reg [15:0] leftShiftStage1_uid279_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA0_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA0_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA0_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA1_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA1_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA1_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA2_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA2_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA2_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA3_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA3_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA3_c;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_in;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    wire [1:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_hi_b;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB0_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB1_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB2_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB3_h;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_in;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_qB_l0_or0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_qB_l0_or0_q;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA0_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA0_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA0_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA1_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA1_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA1_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA2_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA2_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA2_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA3_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA3_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA3_c;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_qB_l0_or0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_qB_l0_or0_q;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA0_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA0_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA0_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA1_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA1_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA1_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA2_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA2_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA2_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA3_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA3_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA3_c;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_qB_l0_or0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_qB_l0_or0_q;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA0_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA0_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA0_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA1_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA1_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA1_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA2_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA2_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA2_c;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA3_h;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA3_e;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA3_c;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_qB_l0_or0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_reset0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_ena_NotRstA;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_ia;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_aa;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_ab;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_iq;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_q;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_qB_l0_or0_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_reset;
    wire [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_a0;
    wire [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_c0;
    wire [26:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_s0;
    wire [26:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_qq0;
    reg [26:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_q;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_ena0;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_ena1;
    wire ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_ena2;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_trunc_q;
    wire [26:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_trunc_qint;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_add_a;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_add_b;
    logic [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_add_o;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_add_q;
    wire [12:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_shift_q;
    wire [13:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_shift_qint;
    wire [1:0] leftShiftStageSel0Dto0_uid267_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_bit_select_merged_b;
    wire [1:0] leftShiftStageSel0Dto0_uid267_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_bit_select_merged_c;
    wire [15:0] leftShiftStage0Idx1_uid260_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const_q;
    wire [15:0] leftShiftStage0Idx2_uid263_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const_q;
    wire [15:0] leftShiftStage0Idx3_uid266_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const_q;
    reg [12:0] redist0_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_shift_q_1_q;
    reg [11:0] redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    reg [14:0] redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    reg [13:0] redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    reg [12:0] redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    reg [12:0] redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_PostCast_primWireOut_sel_x_b_1_q;
    reg [12:0] redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_PostCast_primWireOut_sel_x_b_1_q;
    reg [12:0] redist7_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_PostCast_primWireOut_sel_x_b_1_q;
    reg [12:0] redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_PostCast_primWireOut_sel_x_b_1_q;
    reg [10:0] redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_1_q;
    reg [3:0] redist11_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_1_q;
    reg [3:0] redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_q;
    reg [3:0] redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_delay_0;
    reg [3:0] redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_delay_1;
    reg [3:0] redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_delay_2;
    reg [3:0] redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_delay_3;
    reg [12:0] redist13_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q_3_q;
    reg [12:0] redist13_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q_3_delay_0;
    reg [1:0] redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q_3_q;
    reg [1:0] redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q_3_delay_0;
    reg [0:0] redist15_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_q_2_q;
    reg [15:0] redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_q_1_q;
    reg [0:0] redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q_5_q;
    reg [0:0] redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q_5_delay_0;
    reg [0:0] redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q_5_delay_1;
    reg [0:0] redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q_5_delay_2;
    reg [0:0] redist18_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_q_3_q;
    reg [0:0] redist18_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_q_3_delay_0;
    reg [0:0] redist19_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_q_9_q;
    reg [0:0] redist20_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_q_10_q;
    reg [0:0] redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_q;
    reg [0:0] redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_delay_0;
    reg [0:0] redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_delay_1;
    reg [0:0] redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_delay_2;
    reg [15:0] redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0_1_q;
    reg [0:0] redist23_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q_3_q;
    reg [0:0] redist23_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q_3_delay_0;
    reg [0:0] redist23_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q_3_delay_1;
    reg [1:0] redist24_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q_3_q;
    reg [1:0] redist24_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q_3_delay_0;
    reg [0:0] redist25_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_q_1_q;
    reg [0:0] redist26_GPIn_cunroll_x_in_1_vin_tpl_3_q;
    reg [0:0] redist26_GPIn_cunroll_x_in_1_vin_tpl_3_delay_0;
    reg [0:0] redist26_GPIn_cunroll_x_in_1_vin_tpl_3_delay_1;
    reg [7:0] redist27_GPIn_cunroll_x_in_2_chin_tpl_1_q;
    reg [15:0] redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q;
    reg [15:0] redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_delay_0;
    reg [15:0] redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_delay_1;
    reg [15:0] redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q;
    reg [15:0] redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_delay_0;
    reg [15:0] redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_delay_1;
    reg [3:0] redist30_GPIn_cunroll_x_in_4_FFTSize_tpl_1_q;
    reg [10:0] redist31_GPIn_cunroll_x_in_5_cplen_tpl_1_q;
    reg [11:0] redist32_GPIn_cunroll_x_in_6_nprb_tpl_1_q;
    wire redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_reset0;
    wire [10:0] redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_ia;
    wire [1:0] redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_aa;
    wire [1:0] redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_ab;
    wire [10:0] redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_iq;
    wire [10:0] redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_q;
    wire [1:0] redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_wraddr_q;
    // Initial-value here is arbitrary, but a resolved value is necessary for simulation.
    (* preserve_syn_only *) reg [1:0] redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_wraddr_i = 2'b11;
    wire [2:0] redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_rdcnt_a;
    wire [2:0] redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_rdcnt_b;
    logic [2:0] redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_rdcnt_o;
    wire [2:0] redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_rdcnt_q;

    import ifft_blocktostream_DUT_safe_path_ver::safe_path_ver;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // leftShiftStage1Idx3Rng12_uid276_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x(BITSELECT,275)@7
    assign leftShiftStage1Idx3Rng12_uid276_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_in = leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q[3:0];
    assign leftShiftStage1Idx3Rng12_uid276_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_b = leftShiftStage1Idx3Rng12_uid276_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_in[3:0];

    // leftShiftStage1Idx3Pad12_uid275_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x(CONSTANT,274)
    assign leftShiftStage1Idx3Pad12_uid275_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q = $unsigned(12'b000000000000);

    // leftShiftStage1Idx3_uid277_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x(BITJOIN,276)@7
    assign leftShiftStage1Idx3_uid277_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q = {leftShiftStage1Idx3Rng12_uid276_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_b, leftShiftStage1Idx3Pad12_uid275_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q};

    // leftShiftStage1Idx2Rng8_uid273_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x(BITSELECT,272)@7
    assign leftShiftStage1Idx2Rng8_uid273_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_in = leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q[7:0];
    assign leftShiftStage1Idx2Rng8_uid273_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_b = leftShiftStage1Idx2Rng8_uid273_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_in[7:0];

    // leftShiftStage1Idx2Pad8_uid272_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x(CONSTANT,271)
    assign leftShiftStage1Idx2Pad8_uid272_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q = $unsigned(8'b00000000);

    // leftShiftStage1Idx2_uid274_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x(BITJOIN,273)@7
    assign leftShiftStage1Idx2_uid274_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q = {leftShiftStage1Idx2Rng8_uid273_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_b, leftShiftStage1Idx2Pad8_uid272_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q};

    // leftShiftStage1Idx1Rng4_uid270_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x(BITSELECT,269)@7
    assign leftShiftStage1Idx1Rng4_uid270_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_in = leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q[11:0];
    assign leftShiftStage1Idx1Rng4_uid270_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_b = leftShiftStage1Idx1Rng4_uid270_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_in[11:0];

    // leftShiftStage1Idx1Pad4_uid269_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x(CONSTANT,268)
    assign leftShiftStage1Idx1Pad4_uid269_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q = $unsigned(4'b0000);

    // leftShiftStage1Idx1_uid271_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x(BITJOIN,270)@7
    assign leftShiftStage1Idx1_uid271_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q = {leftShiftStage1Idx1Rng4_uid270_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_b, leftShiftStage1Idx1Pad4_uid269_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q};

    // leftShiftStage0Idx3_uid266_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const(CONSTANT,484)
    assign leftShiftStage0Idx3_uid266_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const_q = $unsigned(16'b0000000000001000);

    // leftShiftStage0Idx2_uid263_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const(CONSTANT,482)
    assign leftShiftStage0Idx2_uid263_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const_q = $unsigned(16'b0000000000000100);

    // leftShiftStage0Idx1_uid260_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const(CONSTANT,480)
    assign leftShiftStage0Idx1_uid260_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const_q = $unsigned(16'b0000000000000010);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Constant2_x(CONSTANT,109)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Constant2_x_q = $unsigned(16'b0000000000000001);

    // leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x(MUX,267)@7
    assign leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_s = leftShiftStageSel0Dto0_uid267_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_bit_select_merged_b;
    always @(leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_s or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Constant2_x_q or leftShiftStage0Idx1_uid260_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const_q or leftShiftStage0Idx2_uid263_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const_q or leftShiftStage0Idx3_uid266_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const_q)
    begin
        unique case (leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_s)
            2'b00 : leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Constant2_x_q;
            2'b01 : leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q = leftShiftStage0Idx1_uid260_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const_q;
            2'b10 : leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q = leftShiftStage0Idx2_uid263_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const_q;
            2'b11 : leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q = leftShiftStage0Idx3_uid266_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q_const_q;
            default : leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q = 16'b0;
        endcase
    end

    // redist30_GPIn_cunroll_x_in_4_FFTSize_tpl_1(DELAY,515)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist30_GPIn_cunroll_x_in_4_FFTSize_tpl_1_q <= $unsigned(in_4_FFTSize_tpl);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_x(ADD,153)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_x_a = {15'b000000000000000, in_1_vin_tpl};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_x_b = {1'b0, redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_x_a) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_x_o[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_PostCast_primWireOut_sel_x(BITSELECT,217)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_PostCast_primWireOut_sel_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_x_q[14:0];

    // redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_PostCast_primWireOut_sel_x_b_1(DELAY,487)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_PostCast_primWireOut_sel_x_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_x(ADD,154)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_x_a = {1'b0, redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_x_b = {15'b000000000000000, VCC_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_x_a) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_x_o[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_PostCast_primWireOut_sel_x(BITSELECT,216)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_PostCast_primWireOut_sel_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_x_q[14:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_ChooseBits_x(CHOOSEBITS,151)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_ChooseBits_x_a = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr1_PostCast_primWireOut_sel_x_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_ChooseBits_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_ChooseBits_x_a[14:14];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_x(ADD,141)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_x_a = {14'b00000000000000, in_1_vin_tpl};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_x_b = {1'b0, redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_x_a) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_x_o[14:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_PostCast_primWireOut_sel_x(BITSELECT,215)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_PostCast_primWireOut_sel_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_x_q[13:0];

    // redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_PostCast_primWireOut_sel_x_b_1(DELAY,488)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_PostCast_primWireOut_sel_x_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_x(ADD,142)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_x_a = {1'b0, redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_x_b = {14'b00000000000000, VCC_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_x_a) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_x_o[14:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_PostCast_primWireOut_sel_x(BITSELECT,214)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_PostCast_primWireOut_sel_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_x_q[13:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_ChooseBits_x(CHOOSEBITS,139)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_ChooseBits_x_a = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr1_PostCast_primWireOut_sel_x_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_ChooseBits_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_ChooseBits_x_a[13:13];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_x(ADD,129)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_x_a = {13'b0000000000000, in_1_vin_tpl};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_x_b = {1'b0, redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_x_a) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_x_o[13:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_PostCast_primWireOut_sel_x(BITSELECT,212)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_PostCast_primWireOut_sel_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_x_q[12:0];

    // redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_PostCast_primWireOut_sel_x_b_1(DELAY,489)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_PostCast_primWireOut_sel_x_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_x(ADD,130)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_x_a = {1'b0, redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_x_b = {13'b0000000000000, VCC_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_x_a) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_x_o[13:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_PostCast_primWireOut_sel_x(BITSELECT,211)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_PostCast_primWireOut_sel_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_x_q[12:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_ChooseBits_x(CHOOSEBITS,127)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_ChooseBits_x_a = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr1_PostCast_primWireOut_sel_x_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_ChooseBits_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_ChooseBits_x_a[12:12];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_x(ADD,165)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_x_a = {12'b000000000000, in_1_vin_tpl};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_x_b = {1'b0, redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_x_a) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_x_o[12:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_PostCast_primWireOut_sel_x(BITSELECT,220)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_PostCast_primWireOut_sel_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_x_q[11:0];

    // redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_PostCast_primWireOut_sel_x_b_1(DELAY,486)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q <= '0;
        end
        else
        begin
            redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_PostCast_primWireOut_sel_x_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_x(ADD,166)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_x_a = {1'b0, redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_x_b = {12'b000000000000, VCC_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_x_a) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_x_o[12:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_PostCast_primWireOut_sel_x(BITSELECT,219)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_PostCast_primWireOut_sel_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_x_q[11:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_ChooseBits_x(CHOOSEBITS,163)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_ChooseBits_x_a = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr1_PostCast_primWireOut_sel_x_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_ChooseBits_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_ChooseBits_x_a[11:11];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x(LOOKUP,121)@0
    always @(in_4_FFTSize_tpl)
    begin
        // Begin reserved scope level
        unique case (in_4_FFTSize_tpl)
            4'b0000 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b00;
            4'b0001 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b00;
            4'b0010 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b00;
            4'b0011 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b00;
            4'b0100 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b00;
            4'b0101 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b00;
            4'b0110 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b00;
            4'b0111 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b00;
            4'b1000 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b00;
            4'b1001 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b00;
            4'b1010 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b01;
            4'b1011 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b10;
            4'b1100 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b11;
            4'b1101 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b00;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q = 2'b00;
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x(MUX,122)@0 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_s)
                2'b00 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_ChooseBits_x_q;
                2'b01 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_ChooseBits_x_q;
                2'b10 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_ChooseBits_x_q;
                2'b11 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_ChooseBits_x_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_q <= 1'b0;
            endcase
        end
    end

    // redist15_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_q_2(DELAY,500)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist15_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_q_2_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_edgedetector_Xor_x(LOGICAL,36)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_edgedetector_Xor_x_q = redist15_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_q_2_q ^ ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x(MUX,173)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_edgedetector_Xor_x_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_s or redist11_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_1_q or redist30_GPIn_cunroll_x_in_4_FFTSize_tpl_1_q)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q = redist11_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q = redist30_GPIn_cunroll_x_in_4_FFTSize_tpl_1_q;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q = 4'b0;
        endcase
    end

    // redist11_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_1(DELAY,496)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist11_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist11_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q);
        end
    end

    // redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6(DELAY,497)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_delay_0 <= $unsigned(redist11_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_1_q);
            redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_delay_1 <= redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_delay_0;
            redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_delay_2 <= redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_delay_1;
            redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_delay_3 <= redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_delay_2;
            redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_q <= redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_delay_3;
        end
    end

    // leftShiftStageSel0Dto0_uid267_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_bit_select_merged(BITSELECT,478)@7
    assign leftShiftStageSel0Dto0_uid267_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_bit_select_merged_b = redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_q[1:0];
    assign leftShiftStageSel0Dto0_uid267_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_bit_select_merged_c = redist12_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_6_q[3:2];

    // leftShiftStage1_uid279_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x(MUX,278)@7 + 1
    assign leftShiftStage1_uid279_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_s = leftShiftStageSel0Dto0_uid267_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_bit_select_merged_c;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (leftShiftStage1_uid279_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_s)
                2'b00 : leftShiftStage1_uid279_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q <= leftShiftStage0_uid268_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q;
                2'b01 : leftShiftStage1_uid279_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q <= leftShiftStage1Idx1_uid271_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q;
                2'b10 : leftShiftStage1_uid279_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q <= leftShiftStage1Idx2_uid274_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q;
                2'b11 : leftShiftStage1_uid279_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q <= leftShiftStage1Idx3_uid277_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q;
                default : leftShiftStage1_uid279_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q <= 16'b0;
            endcase
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant4_x(CONSTANT,183)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant4_x_q = $unsigned(2'b10);

    // redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_rdcnt(ADD,521)
    assign redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_rdcnt_a = {1'b0, redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_wraddr_q};
    assign redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_rdcnt_b = {1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant4_x_q};
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_rdcnt_o <= $unsigned(redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_rdcnt_a) + $unsigned(redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_rdcnt_b);
        end
    end
    assign redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_rdcnt_q = redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_rdcnt_o[2:0];

    // redist31_GPIn_cunroll_x_in_5_cplen_tpl_1(DELAY,516)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist31_GPIn_cunroll_x_in_5_cplen_tpl_1_q <= $unsigned(in_5_cplen_tpl);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x(MUX,175)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_edgedetector_Xor_x_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_s or redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_1_q or redist31_GPIn_cunroll_x_in_5_cplen_tpl_1_q)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q = redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q = redist31_GPIn_cunroll_x_in_5_cplen_tpl_1_q;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q = 11'b0;
        endcase
    end

    // redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_1(DELAY,494)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q);
        end
    end

    // redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_wraddr(COUNTER,519)
    // low=0, high=3, step=1, init=0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_wraddr_i <= $unsigned(redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_wraddr_i) + $unsigned(2'd1);
        end
    end
    assign redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_wraddr_q = redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_wraddr_i[1:0];

    // redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem(DUALMEM,518)
    assign redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_ia = $unsigned(redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_1_q);
    assign redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_aa = redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_wraddr_q;
    assign redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_ab = redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_rdcnt_q[1:0];
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(11),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(11),
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
    ) redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_aa),
        .data_a(redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_ab),
        .q_b(redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_iq),
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
    assign redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_q = redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_iq[10:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant3_x(CONSTANT,182)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant3_x_q = $unsigned(2'b01);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Const1_x(CONSTANT,104)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Const1_x_q = $unsigned(16'b0110100010111000);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Const2_x(CONSTANT,106)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Const2_x_q = $unsigned(16'b0111001100110011);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Const3_x(CONSTANT,107)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Const3_x_q = $unsigned(4'b1100);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft1_x(LOGICAL,103)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft1_x_q = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Const3_x_q ? 1'b1 : 1'b0);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux1_x(MUX,113)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux1_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft1_x_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux1_x_s or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Const2_x_q or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Const1_x_q)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux1_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux1_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Const2_x_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux1_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Const1_x_q;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux1_x_q = 16'b0;
        endcase
    end

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma(CHAINMULTADD,472)@1 + 5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_reset = areset;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_ena0 = 1'b1;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_ena1 = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_ena0;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_ena2 = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_ena0;

    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_a0 = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_c0 = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux1_x_q);
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("none"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(11),
        .ax_clken("0"),
        .ax_width(16),
        .signed_may("false"),
        .signed_max("true"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(27)
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_DSP0 (
        .clk(clk),
        .ena({ ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_ena2, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_ena1, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_ena0 }),
        .clr({ 1'b0, 1'b0 }),
        .ay(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_a0),
        .ax(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_c0),
        .resulta(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_s0),
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
    dspba_delay_ver #( .width(27), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_delay0 ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_s0), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_q = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_qq0[26:0]);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_trunc(BITSHIFT,474)@6
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_trunc_qint = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mult_x_cma_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_trunc_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_trunc_qint[26:14];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_add(ADD,475)@6
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_add_a = $unsigned({{1{ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_trunc_q[12]}}, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_trunc_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_add_b = $unsigned({{12{ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant3_x_q[1]}}, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant3_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_add_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_add_a) + $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_add_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_add_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_add_o[13:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_shift(BITSHIFT,476)@6
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_shift_qint = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_add_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_shift_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_shift_qint[13:1];

    // redist0_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_shift_q_1(DELAY,485)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist0_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_shift_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_shift_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_sel_x(BITSELECT,209)@7
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_sel_x_b = $unsigned({{2{redist0_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_shift_q_1_q[12]}}, redist0_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_rnd_x_shift_q_1_q[12:0]});

    // redist27_GPIn_cunroll_x_in_2_chin_tpl_1(DELAY,512)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist27_GPIn_cunroll_x_in_2_chin_tpl_1_q <= $unsigned(in_2_chin_tpl);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba1_Mux_x(MUX,177)@1 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba1_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_edgedetector_Xor_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba1_Mux_x_q <= 8'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba1_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba1_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba1_Mux_x_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba1_Mux_x_q <= redist27_GPIn_cunroll_x_in_2_chin_tpl_1_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba1_Mux_x_q <= 8'b0;
            endcase
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x(LOGICAL,102)@2 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_a = {7'b0000000, GND_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_qi = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_a == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba1_Mux_x_q ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q_5(DELAY,502)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q_5_delay_0 <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q);
            redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q_5_delay_1 <= redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q_5_delay_0;
            redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q_5_delay_2 <= redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q_5_delay_1;
            redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q_5_q <= redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q_5_delay_2;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux2_x(MUX,114)@7 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux2_x_s = redist17_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_CmpEQ_fft_x_q_5_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux2_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux2_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Convert_sel_x_b;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux2_x_q <= {4'b0000, redist10_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_cplenlatc_wba_Mux_x_q_6_mem_q};
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux2_x_q <= 15'b0;
            endcase
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_x(ADD,100)@8
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_x_a = {2'b00, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux2_x_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_x_b = {1'b0, leftShiftStage1_uid279_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift1_x_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_x_a) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_x_o[16:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_PostCast_primWireOut_sel_x(BITSELECT,208)@8
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_PostCast_primWireOut_sel_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_x_q[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift_x_fs(BITSHIFT,254)@8
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift_x_fs_qint = { ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Add_PostCast_primWireOut_sel_x_b, 2'b00 };
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift_x_fs_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift_x_fs_qint[17:0];

    // redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_q_1(DELAY,501)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x(MUX,117)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Or_x_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_s or redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_q_1_q or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift_x_fs_q)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_q = redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_q_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_LShift_x_fs_q[15:0];
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_q = 16'b0;
        endcase
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Constant4_x(CONSTANT,98)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Constant4_x_q = $unsigned(16'b0000000000001111);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Sub2_x(SUB,99)@1 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Sub2_x_a = $unsigned({1'b0, redist16_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_q_1_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Sub2_x_b = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Constant4_x_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Sub2_x_o <= 17'b0;
        end
        else
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Sub2_x_o <= $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Sub2_x_a) - $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Sub2_x_b));
        end
    end
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Sub2_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Sub2_x_o[16:0];

    // redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0_1(DELAY,507)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0_1_q <= '0;
        end
        else
        begin
            redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x(LOGICAL,97)@2 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_a = {1'b0, redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_qi = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_a == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_Sub2_x_q ? 1'b1 : 1'b0);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist18_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_q_3(DELAY,503)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist18_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_q_3_delay_0 <= '0;
            redist18_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_q_3_q <= '0;
        end
        else
        begin
            redist18_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_q_3_delay_0 <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_q);
            redist18_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_q_3_q <= redist18_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_q_3_delay_0;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x(LOGICAL,96)@5 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_qi = redist18_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_CmpEQ2_x_q_3_q & redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_q;
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist19_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_q_9(DELAY,504)
    dspba_delay_ver #( .width(1), .depth(8), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    redist19_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_q_9 ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_q), .xout(redist19_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_q_9_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist20_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_q_10(DELAY,505)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist20_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_q_10_q <= '0;
        end
        else
        begin
            redist20_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_q_10_q <= $unsigned(redist19_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_q_9_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Not_x(LOGICAL,74)@14
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Not_x_q = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x(MUX,73)@14 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_s = redist19_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_q_9_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q <= 1'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Not_x_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q <= 1'b0;
            endcase
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba_Mux_x(MUX,31)@1 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_edgedetector_Xor_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba_Mux_x_q <= 1'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba_Mux_x_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux_x_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba_Mux_x_q <= 1'b0;
            endcase
        end
    end

    // redist32_GPIn_cunroll_x_in_6_nprb_tpl_1(DELAY,517)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist32_GPIn_cunroll_x_in_6_nprb_tpl_1_q <= $unsigned(in_6_nprb_tpl);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Const5_x(CONSTANT,27)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Const5_x_q = $unsigned(12'b110011010000);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_x(SUB,30)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_x_a = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Const5_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_x_b = $unsigned({1'b0, redist32_GPIn_cunroll_x_in_6_nprb_tpl_1_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_x_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_x_a) - $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_x_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_x_o[12:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_PostCast_primWireOut_sel_x(BITSELECT,199)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_PostCast_primWireOut_sel_x_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_x_q[11:0]);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x(LOOP,28)@1 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_running <= $unsigned(1'b0);
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_pending <= $unsigned(1'b0);
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_q0 <= 12'b0;
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_e0 <= '1;
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_v <= $unsigned(1'b0);
        end
        else
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_v <= $unsigned(1'b0);
            if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_edgedetector_Xor_x_q == 1'b1)
            begin
                ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_e0 <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Sub3_PostCast_primWireOut_sel_x_b) - $unsigned(12'd1);
                ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_q0 <= 12'b0;
                ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_running <= $unsigned(1'b1);
                if (VCC_q == 1'b1)
                begin
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_pending <= $unsigned(1'b0);
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (VCC_q == 1'b1)
                begin
                    if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_pending == 1'b1)
                    begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_v <= $unsigned(1'b1);
                    end
                    else if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_running == 1'b1)
                    begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_v <= $unsigned(1'b1);
                        if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_q0 == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_e0)
                        begin
                            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_q0 <= 12'b0;
                            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_running <= $unsigned(1'b0);
                            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_q0 <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_q0) + $unsigned(12'd1);
                        end
                    end
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_f0 = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_q0 == 12'b000000000000 ? 1'b1 : 1'b0);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_l0 = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_q0 == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_e0 ? 1'b1 : 1'b0);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba1_Mux_x(MUX,33)@2 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba1_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_Loop_x_l0;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba1_Mux_x_q <= 1'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba1_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba1_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba1_Mux_x_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba1_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba_Mux_x_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba1_Mux_x_q <= 1'b0;
            endcase
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x(DELAY,24)@0
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_delay_0 <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Delay_rd_go_cplenlatc_wba1_Mux_x_q;
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_delay_1 <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_delay_0;
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_delay_2 <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_delay_1;
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_delay_3 <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_delay_2;
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_delay_3;
        end
    end

    // redist25_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_q_1(DELAY,510)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist25_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Xor_x(LOGICAL,92)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Xor_x_q = redist25_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_q_1_q ^ ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_And1_x(LOGICAL,83)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_And1_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Xor_x_q & redist20_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_EndCounterSignals_And1_x_q_10_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Not1_x(LOGICAL,85)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Not1_x_q = ~ (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_And_x(LOGICAL,82)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_And_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Not1_x_q & ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Xor_x_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Or_x(LOGICAL,86)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Or_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_And_x_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_And1_x_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x(LOOP,77)@0 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_running <= $unsigned(1'b0);
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_pending <= $unsigned(1'b0);
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0 <= 16'b0;
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_e0 <= '1;
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v <= $unsigned(1'b0);
        end
        else
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v <= $unsigned(1'b0);
            if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Or_x_q == 1'b1)
            begin
                ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_e0 <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L_Mux_x_q) - $unsigned(16'd1);
                ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0 <= 16'b0;
                ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_running <= $unsigned(1'b1);
                if (VCC_q == 1'b1)
                begin
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_pending <= $unsigned(1'b0);
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v <= $unsigned(1'b1);
                end
                else
                begin
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_pending <= $unsigned(1'b1);
                end
            end
            else
            begin
                if (VCC_q == 1'b1)
                begin
                    if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_pending == 1'b1)
                    begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v <= $unsigned(1'b1);
                    end
                    else if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_running == 1'b1)
                    begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v <= $unsigned(1'b1);
                        if (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0 == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_e0)
                        begin
                            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0 <= 16'b0;
                            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_running <= $unsigned(1'b0);
                            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v <= $unsigned(1'b0);
                        end
                        else
                        begin
                            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0 <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0) + $unsigned(16'd1);
                        end
                    end
                    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_pending <= $unsigned(1'b0);
                end
            end
        end
    end
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_f0 = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0 == 16'b0000000000000000 ? 1'b1 : 1'b0);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_l0 = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0 == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_e0 ? 1'b1 : 1'b0);

    // redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4(DELAY,506)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_delay_0 <= '0;
            redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_delay_1 <= '0;
            redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_delay_2 <= '0;
            redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_q <= '0;
        end
        else
        begin
            redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_delay_0 <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v);
            redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_delay_1 <= redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_delay_0;
            redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_delay_2 <= redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_delay_1;
            redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_q <= redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_delay_2;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_ChooseBits_x(CHOOSEBITS,42)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_ChooseBits_x_a = redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_ChooseBits_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_ChooseBits_x_a[1:1], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_ChooseBits_x_a[0:0]};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x(LOOKUP,37)@2
    always @(redist11_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_1_q)
    begin
        // Begin reserved scope level
        unique case (redist11_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_sample_maxlatch_0L_Mux_x_q_1_q)
            4'b0000 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b00;
            4'b0001 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b00;
            4'b0010 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b00;
            4'b0011 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b00;
            4'b0100 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b00;
            4'b0101 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b00;
            4'b0110 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b00;
            4'b0111 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b00;
            4'b1000 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b00;
            4'b1001 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b00;
            4'b1010 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b01;
            4'b1011 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b10;
            4'b1100 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b11;
            4'b1101 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b00;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q = 2'b00;
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x(MUX,38)@2 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_s)
                2'b00 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_ChooseBits_x_q;
                2'b01 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_ChooseBits_x_q;
                2'b10 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_ChooseBits_x_q;
                2'b11 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_ChooseBits_x_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q <= 2'b0;
            endcase
        end
    end

    // redist24_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q_3(DELAY,509)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist24_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q_3_delay_0 <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q);
            redist24_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q_3_q <= redist24_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q_3_delay_0;
        end
    end

    // redist23_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q_3(DELAY,508)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist23_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q_3_delay_0 <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q);
            redist23_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q_3_delay_1 <= redist23_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q_3_delay_0;
            redist23_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q_3_q <= redist23_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q_3_delay_1;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Shift_x_fs(BITSHIFT,253)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Shift_x_fs_qint = redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Shift_x_fs_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Shift_x_fs_qint[15:2];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L1_Mux_x(MUX,119)@0 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L1_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Or_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L1_Mux_x_q <= 15'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L1_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L1_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L1_Mux_x_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L1_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_SampleregMaxval_Calc2_Mux2_x_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L1_Mux_x_q <= 15'b0;
            endcase
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Constant7_x(CONSTANT,66)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Constant7_x_q = $unsigned(15'b001000000000000);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_x(SUB,69)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_x_a = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Constant7_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_x_b = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L1_Mux_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_x_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_x_a) - $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_x_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_x_o[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_PostCast_primWireOut_sel_x(BITSELECT,207)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_PostCast_primWireOut_sel_x_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_x_q[12:0]);

    // redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_PostCast_primWireOut_sel_x_b_1(DELAY,490)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_PostCast_primWireOut_sel_x_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Add2_x(ADD,64)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Add2_x_a = {1'b0, redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Sub_PostCast_primWireOut_sel_x_b_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Add2_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Shift_x_fs_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Add2_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Add2_x_a) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Add2_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Add2_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Add2_x_o[13:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Convert_sel_x(BITSELECT,206)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Convert_sel_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Add2_x_q[11:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Shift_x_fs(BITSHIFT,251)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Shift_x_fs_qint = redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Shift_x_fs_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Shift_x_fs_qint[15:2];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Constant7_x(CONSTANT,52)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Constant7_x_q = $unsigned(15'b000100000000000);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_x(SUB,55)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_x_a = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Constant7_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_x_b = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L1_Mux_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_x_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_x_a) - $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_x_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_x_o[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_PostCast_primWireOut_sel_x(BITSELECT,203)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_PostCast_primWireOut_sel_x_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_x_q[12:0]);

    // redist7_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_PostCast_primWireOut_sel_x_b_1(DELAY,492)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist7_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_PostCast_primWireOut_sel_x_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Add2_x(ADD,48)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Add2_x_a = {1'b0, redist7_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Sub_PostCast_primWireOut_sel_x_b_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Add2_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Shift_x_fs_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Add2_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Add2_x_a) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Add2_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Add2_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Add2_x_o[13:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Convert_sel_x(BITSELECT,202)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Convert_sel_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Add2_x_q[10:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_BitCombine2_x(BITJOIN,49)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_BitCombine2_x_q = {GND_q, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_Convert_sel_x_b};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Constant1_x(CONSTANT,43)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Constant1_x_q = $unsigned(2'b00);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Shift_x_fs(BITSHIFT,250)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Shift_x_fs_qint = redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Shift_x_fs_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Shift_x_fs_qint[15:2];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Constant7_x(CONSTANT,44)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Constant7_x_q = $unsigned(15'b000010000000000);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_x(SUB,47)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_x_a = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Constant7_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_x_b = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L1_Mux_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_x_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_x_a) - $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_x_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_x_o[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_PostCast_primWireOut_sel_x(BITSELECT,201)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_PostCast_primWireOut_sel_x_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_x_q[12:0]);

    // redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_PostCast_primWireOut_sel_x_b_1(DELAY,493)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_PostCast_primWireOut_sel_x_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Add2_x(ADD,40)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Add2_x_a = {1'b0, redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Sub_PostCast_primWireOut_sel_x_b_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Add2_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Shift_x_fs_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Add2_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Add2_x_a) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Add2_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Add2_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Add2_x_o[13:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Convert_sel_x(BITSELECT,200)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Convert_sel_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Add2_x_q[9:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_BitCombine2_x(BITJOIN,41)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_BitCombine2_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Constant1_x_q, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Convert_sel_x_b};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Constant1_x(CONSTANT,59)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Constant1_x_q = $unsigned(3'b000);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Shift_x_fs(BITSHIFT,252)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Shift_x_fs_qint = redist22_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_q0_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Shift_x_fs_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Shift_x_fs_qint[15:2];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Constant7_x(CONSTANT,60)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Constant7_x_q = $unsigned(15'b000001000000000);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_x(SUB,63)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_x_a = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Constant7_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_x_b = $unsigned({1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_sample_maxlatch_0L1_Mux_x_q});
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_x_o = $unsigned($signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_x_a) - $signed(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_x_b));
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_x_o[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_PostCast_primWireOut_sel_x(BITSELECT,205)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_PostCast_primWireOut_sel_x_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_x_q[12:0]);

    // redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_PostCast_primWireOut_sel_x_b_1(DELAY,491)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_PostCast_primWireOut_sel_x_b_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_PostCast_primWireOut_sel_x_b);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Add2_x(ADD,56)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Add2_x_a = {1'b0, redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Sub_PostCast_primWireOut_sel_x_b_1_q};
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Add2_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Shift_x_fs_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Add2_x_o = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Add2_x_a) + $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Add2_x_b);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Add2_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Add2_x_o[13:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Convert_sel_x(BITSELECT,204)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Convert_sel_x_b = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Add2_x_q[8:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_BitCombine2_x(BITJOIN,57)@2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_BitCombine2_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Constant1_x_q, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_Convert_sel_x_b};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux1_x(MUX,39)@2 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux1_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Lut4_x_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux1_x_s)
                2'b00 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux1_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_512_BitCombine2_x_q;
                2'b01 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux1_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_BitCombine2_x_q;
                2'b10 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux1_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_2048_BitCombine2_x_q;
                2'b11 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux1_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_gen_4096_Convert_sel_x_b;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux1_x_q <= 12'b0;
            endcase
        end
    end

    // BitCombine(BITJOIN,21)@3
    assign BitCombine_q = {redist23_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Mux_x_q_3_q, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux1_x_q};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_hi(BITSELECT,290)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_hi_b = BitCombine_q[12:11];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB3(LOOKUP,295)@3
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_hi_b)
            2'b11 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB3_h = 1'b1;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB3_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo(BITSELECT,296)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_in = $unsigned(BitCombine_q[10:0]);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_in[10:0]);

    // redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3(DELAY,514)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_delay_0 <= $unsigned(in_3_imag_din_tpl);
            redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_delay_1 <= redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_delay_0;
            redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q <= redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_delay_1;
        end
    end

    // redist26_GPIn_cunroll_x_in_1_vin_tpl_3(DELAY,511)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist26_GPIn_cunroll_x_in_1_vin_tpl_3_delay_0 <= $unsigned(in_1_vin_tpl);
            redist26_GPIn_cunroll_x_in_1_vin_tpl_3_delay_1 <= redist26_GPIn_cunroll_x_in_1_vin_tpl_3_delay_0;
            redist26_GPIn_cunroll_x_in_1_vin_tpl_3_q <= redist26_GPIn_cunroll_x_in_1_vin_tpl_3_delay_1;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant5_x(CONSTANT,184)
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant5_x_q = $unsigned(2'b11);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Antenna_block_x(CHOOSEBITS,149)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Antenna_block_x_a = redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Antenna_block_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Antenna_block_x_a[13:13], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Antenna_block_x_a[12:12]};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Antenna_block_x(CHOOSEBITS,137)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Antenna_block_x_a = redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Antenna_block_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Antenna_block_x_a[12:12], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Antenna_block_x_a[11:11]};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Antenna_block_x(CHOOSEBITS,125)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Antenna_block_x_a = redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Antenna_block_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Antenna_block_x_a[11:11], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Antenna_block_x_a[10:10]};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Antenna_block_x(CHOOSEBITS,161)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Antenna_block_x_a = redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Antenna_block_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Antenna_block_x_a[10:10], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Antenna_block_x_a[9:9]};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x(MUX,123)@0 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_s)
                2'b00 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Antenna_block_x_q;
                2'b01 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Antenna_block_x_q;
                2'b10 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Antenna_block_x_q;
                2'b11 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Antenna_block_x_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q <= 2'b0;
            endcase
        end
    end

    // redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q_3(DELAY,499)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q_3_delay_0 <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q);
            redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q_3_q <= redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q_3_delay_0;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_CmpEQ_x(LOGICAL,191)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_CmpEQ_x_q = $unsigned(redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q_3_q == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant5_x_q ? 1'b1 : 1'b0);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_We_mem4_x(LOGICAL,192)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_We_mem4_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_CmpEQ_x_q & redist26_GPIn_cunroll_x_in_1_vin_tpl_3_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wba_x(CHOOSEBITS,159)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wba_x_a = redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wba_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wba_x_a[14:14];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x(CHOOSEBITS,160)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_a = redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_a[11:11], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_a[10:10], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_a[9:9], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_a[8:8], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_a[7:7], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_a[6:6], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_a[5:5], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_a[4:4], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_a[3:3], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_a[2:2], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_a[1:1], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_a[0:0]};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_BitCombine2_x(BITJOIN,150)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_BitCombine2_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wba_x_q, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_wr_addr_x_q};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wba_x(CHOOSEBITS,147)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wba_x_a = redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wba_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wba_x_a[13:13];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x(CHOOSEBITS,148)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_a = redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_a[10:10], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_a[9:9], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_a[8:8], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_a[7:7], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_a[6:6], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_a[5:5], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_a[4:4], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_a[3:3], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_a[2:2], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_a[1:1], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_a[0:0]};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Data_Type_Conversion_sel_x(BITSELECT,213)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Data_Type_Conversion_sel_x_b = {1'b0, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wr_addr_x_q[10:0]};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_BitCombine2_x(BITJOIN,138)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_BitCombine2_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_wba_x_q, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_Data_Type_Conversion_sel_x_b};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wba_x(CHOOSEBITS,135)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wba_x_a = redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wba_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wba_x_a[12:12];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x(CHOOSEBITS,136)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_a = redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_a[9:9], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_a[8:8], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_a[7:7], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_a[6:6], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_a[5:5], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_a[4:4], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_a[3:3], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_a[2:2], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_a[1:1], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_a[0:0]};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Data_Type_Conversion_sel_x(BITSELECT,210)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Data_Type_Conversion_sel_x_b = {2'b00, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wr_addr_x_q[9:0]};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_BitCombine2_x(BITJOIN,126)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_BitCombine2_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_wba_x_q, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_Data_Type_Conversion_sel_x_b};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wba_x(CHOOSEBITS,171)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wba_x_a = redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wba_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wba_x_a[11:11];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x(CHOOSEBITS,172)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x_a = redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Wr_add_incr_PostCast_primWireOut_sel_x_b_1_q;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x_a[8:8], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x_a[7:7], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x_a[6:6], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x_a[5:5], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x_a[4:4], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x_a[3:3], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x_a[2:2], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x_a[1:1], ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x_a[0:0]};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Data_Type_Conversion_sel_x(BITSELECT,218)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Data_Type_Conversion_sel_x_b = {3'b000, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wr_addr_x_q[8:0]};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_BitCombine2_x(BITJOIN,162)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_BitCombine2_x_q = {ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_wba_x_q, ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_Data_Type_Conversion_sel_x_b};

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x(MUX,124)@0 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Lut4_x_q;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_s)
                2'b00 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N512_BitCombine2_x_q;
                2'b01 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N1024_BitCombine2_x_q;
                2'b10 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N2048_BitCombine2_x_q;
                2'b11 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Wr_N4096_BitCombine2_x_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q <= 13'b0;
            endcase
        end
    end

    // redist13_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q_3(DELAY,498)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist13_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q_3_delay_0 <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q);
            redist13_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q_3_q <= redist13_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q_3_delay_0;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi(BITSELECT,280)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b = redist13_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q_3_q[12:11];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA3(LOOKUP,430)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA3_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_We_mem4_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b11 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA3_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA3_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA3_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA3_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo(BITSELECT,287)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_in = $unsigned(redist13_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux2_x_q_3_q[10:0]);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_in[10:0]);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3(DUALMEM,445)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA3_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB3_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB2(LOOKUP,294)@3
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_hi_b)
            2'b10 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB2_h = 1'b1;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB2_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA2(LOOKUP,429)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA2_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_We_mem4_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b10 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA2_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA2_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA2_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA2_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2(DUALMEM,444)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA2_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB2_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB1(LOOKUP,293)@3
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_hi_b)
            2'b01 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB1_h = 1'b1;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB1_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA1(LOOKUP,428)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA1_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_We_mem4_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b01 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA1_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA1_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA1_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA1_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1(DUALMEM,443)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA1_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB1_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB0(LOOKUP,292)@3
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_hi_b)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_hi_b)
            2'b00 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB0_h = 1'b1;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB0_h = 1'b0;
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA0(LOOKUP,427)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA0_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_We_mem4_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b00 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA0_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA0_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA0_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA0_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0(DUALMEM,442)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA0_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB0_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_qB_l0_or0(LOGICAL,447)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_qB_l0_or0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part0_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part1_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part2_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_part3_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_CmpEQ_x(LOGICAL,187)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_CmpEQ_x_q = $unsigned(redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q_3_q == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant4_x_q ? 1'b1 : 1'b0);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_We_mem3_x(LOGICAL,188)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_We_mem3_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_CmpEQ_x_q & redist26_GPIn_cunroll_x_in_1_vin_tpl_3_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA3(LOOKUP,334)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA3_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_We_mem3_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b11 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA3_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA3_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA3_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA3_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3(DUALMEM,349)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA3_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB3_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA2(LOOKUP,333)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA2_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_We_mem3_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b10 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA2_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA2_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA2_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA2_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2(DUALMEM,348)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA2_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB2_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA1(LOOKUP,332)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA1_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_We_mem3_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b01 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA1_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA1_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA1_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA1_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1(DUALMEM,347)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA1_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB1_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA0(LOOKUP,331)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA0_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_We_mem3_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b00 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA0_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA0_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA0_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA0_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0(DUALMEM,346)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA0_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB0_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_qB_l0_or0(LOGICAL,351)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_qB_l0_or0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part0_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part1_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part2_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_part3_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_CmpEQ_x(LOGICAL,189)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_CmpEQ_x_q = $unsigned(redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q_3_q == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Constant3_x_q ? 1'b1 : 1'b0);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_We_mem2_x(LOGICAL,190)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_We_mem2_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_CmpEQ_x_q & redist26_GPIn_cunroll_x_in_1_vin_tpl_3_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA3(LOOKUP,382)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA3_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_We_mem2_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b11 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA3_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA3_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA3_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA3_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3(DUALMEM,397)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA3_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB3_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA2(LOOKUP,381)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA2_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_We_mem2_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b10 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA2_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA2_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA2_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA2_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2(DUALMEM,396)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA2_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB2_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA1(LOOKUP,380)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA1_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_We_mem2_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b01 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA1_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA1_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA1_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA1_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1(DUALMEM,395)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA1_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB1_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA0(LOOKUP,379)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA0_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_We_mem2_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b00 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA0_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA0_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA0_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA0_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0(DUALMEM,394)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA0_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB0_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_qB_l0_or0(LOGICAL,399)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_qB_l0_or0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part0_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part1_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part2_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_part3_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_CmpEQ_x(LOGICAL,185)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_CmpEQ_x_q = $unsigned(redist14_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Wr_addr_Gen2_Wr_addr_Gen2_Mux1_x_q_3_q == ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_rd_addr_1024_Constant1_x_q ? 1'b1 : 1'b0);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_We_mem1_x(LOGICAL,186)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_We_mem1_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_CmpEQ_x_q & redist26_GPIn_cunroll_x_in_1_vin_tpl_3_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA3(LOOKUP,286)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA3_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_We_mem1_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA3_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b11 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA3_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA3_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA3_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA3_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA3_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3(DUALMEM,301)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA3_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB3_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA2(LOOKUP,285)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA2_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_We_mem1_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA2_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b10 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA2_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA2_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA2_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA2_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA2_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2(DUALMEM,300)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA2_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB2_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA1(LOOKUP,284)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA1_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_We_mem1_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA1_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b01 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA1_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA1_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA1_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA1_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA1_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1(DUALMEM,299)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA1_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB1_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA0(LOOKUP,283)@3
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA0_c = $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_We_mem1_x_q);
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA0_c)
    begin
        // Begin reserved scope level
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_hi_b)
            2'b00 : begin
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA0_h = 1'b1;
                        ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA0_e = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA0_c;
                    end
            default : begin
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA0_h = 1'b0;
                          ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA0_e = 1'b0;
                      end
        endcase
        // End reserved scope level
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0(DUALMEM,298)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_ia = $unsigned(redist29_GPIn_cunroll_x_in_3_imag_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA0_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB0_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_qB_l0_or0(LOGICAL,303)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_qB_l0_or0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part0_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part1_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part2_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_part3_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_imag_x(MUX,221)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_imag_x_s = redist24_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q_3_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_imag_x_s or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_qB_l0_or0_q or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_qB_l0_or0_q or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_qB_l0_or0_q or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_qB_l0_or0_q)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_imag_x_s)
            2'b00 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_imag_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_qB_l0_or0_q;
            2'b01 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_imag_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_qB_l0_or0_q;
            2'b10 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_imag_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_qB_l0_or0_q;
            2'b11 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_imag_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_qB_l0_or0_q;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_imag_x_q = 16'b0;
        endcase
    end

    // redist28_GPIn_cunroll_x_in_3_real_din_tpl_3(DELAY,513)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_delay_0 <= $unsigned(in_3_real_din_tpl);
            redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_delay_1 <= redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_delay_0;
            redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q <= redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_delay_1;
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3(DUALMEM,469)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA3_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB3_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2(DUALMEM,468)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA2_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB2_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1(DUALMEM,467)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA1_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB1_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0(DUALMEM,466)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_imag_x_csA0_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB0_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_qB_l0_or0(LOGICAL,471)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_qB_l0_or0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part0_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part1_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part2_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_part3_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3(DUALMEM,373)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA3_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB3_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2(DUALMEM,372)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA2_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB2_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1(DUALMEM,371)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA1_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB1_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0(DUALMEM,370)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_imag_x_csA0_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB0_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_qB_l0_or0(LOGICAL,375)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_qB_l0_or0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part0_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part1_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part2_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_part3_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3(DUALMEM,421)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA3_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB3_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2(DUALMEM,420)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA2_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB2_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1(DUALMEM,419)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA1_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB1_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0(DUALMEM,418)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_imag_x_csA0_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB0_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_qB_l0_or0(LOGICAL,423)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_qB_l0_or0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part0_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part1_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part2_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_part3_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3(DUALMEM,325)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA3_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB3_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2(DUALMEM,324)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA2_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB2_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1(DUALMEM,323)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA1_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB1_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0(DUALMEM,322)@3 + 2
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_ia = $unsigned(redist28_GPIn_cunroll_x_in_3_real_din_tpl_3_q);
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_aa = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrA_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_ab = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_addrB_lo_b;
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_ena_NotRstA = ~ (areset);
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
        .outdata_sclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("Agilex 7"),
        .enable_force_to_zero("TRUE")
    ) ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_dmem (
        .clocken0(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_ena_NotRstA),
        .clock0(clk),
        .address_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_aa),
        .data_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_ia),
        .wren_a(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csA0_e[0]),
        .address_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_ab),
        .q_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_iq),
        .rden_b(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_imag_x_csB0_h[0]),
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
        .sclr(),
        .address2_a(),
        .address2_b(),
        .q_a(),
        .eccstatus()
    );
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_iq[15:0];

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_qB_l0_or0(LOGICAL,327)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_qB_l0_or0_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part0_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part1_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part2_q | ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_part3_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_real_x(MUX,222)@5
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_real_x_s = redist24_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q_3_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_real_x_s or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_qB_l0_or0_q or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_qB_l0_or0_q or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_qB_l0_or0_q or ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_qB_l0_or0_q)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_real_x_s)
            2'b00 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_real_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem_MemArray_real_x_qB_l0_or0_q;
            2'b01 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_real_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem2_MemArray_real_x_qB_l0_or0_q;
            2'b10 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_real_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem1_MemArray_real_x_qB_l0_or0_q;
            2'b11 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_real_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_Subsystem3_MemArray_real_x_qB_l0_or0_q;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_real_x_q = 16'b0;
        endcase
    end

    // GPOut_cunroll_x(GPOUT,23)@5
    assign out_3_real_q_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_real_x_q;
    assign out_3_imag_q_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_MemandMux_mux6_imag_x_q;
    assign out_2_cout_tpl = redist24_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Rdaddr_gen1_Mux_x_q_3_q;
    assign out_1_vout_tpl = redist21_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_WriteOnlyLoop_x_v_4_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Xor1_x(LOGICAL,93)@0
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Xor1_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_q ^ redist25_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_Valid1_x_q_1_q;

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_sample_maxlatch_0L_Mux_x(MUX,94)@0 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_sample_maxlatch_0L_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_Xor1_x_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_sample_maxlatch_0L_Mux_x_q <= 1'b0;
        end
        else
        begin
            unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_sample_maxlatch_0L_Mux_x_s)
                1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_sample_maxlatch_0L_Mux_x_q <= ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_sample_maxlatch_0L_Mux_x_q;
                1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_sample_maxlatch_0L_Mux_x_q <= VCC_q;
                default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_CB_SampleReggen_Counter_go_enable_sig_sample_maxlatch_0L_Mux_x_q <= 1'b0;
            endcase
        end
    end

endmodule
