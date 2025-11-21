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

// SystemVerilog created from ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S
// SystemVerilog created on Thu Jun 12 21:17:49 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S (
    input wire [0:0] in_1_v_in_tpl,
    input wire [7:0] in_2_c_in_tpl,
    input wire [15:0] in_3_imag_q_in_tpl,
    input wire [15:0] in_3_real_q_in_tpl,
    input wire [3:0] in_4_sizein_tpl,
    input wire [10:0] in_5_cplen_tpl,
    input wire [11:0] in_6_nprb_tpl,
    output wire [0:0] out_1_vout1_tpl,
    output wire [1:0] out_2_cout1_tpl,
    output wire [15:0] out_3_imag_dout1_tpl,
    output wire [15:0] out_3_real_dout1_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] B2S_Inst_cunroll_x_out_1_vout_tpl;
    wire [1:0] B2S_Inst_cunroll_x_out_2_cout_tpl;
    wire [15:0] B2S_Inst_cunroll_x_out_3_imag_q_tpl;
    wire [15:0] B2S_Inst_cunroll_x_out_3_real_q_tpl;

    import ifft_blocktostream_DUT_safe_path_ver::safe_path_ver;

    // B2S_Inst_cunroll_x(BLACKBOX,2)
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst theB2S_Inst_cunroll_x (
        .in_1_vin_tpl(in_1_v_in_tpl),
        .in_2_chin_tpl(in_2_c_in_tpl),
        .in_3_imag_din_tpl(in_3_imag_q_in_tpl),
        .in_3_real_din_tpl(in_3_real_q_in_tpl),
        .in_4_FFTSize_tpl(in_4_sizein_tpl),
        .in_5_cplen_tpl(in_5_cplen_tpl),
        .in_6_nprb_tpl(in_6_nprb_tpl),
        .out_1_vout_tpl(B2S_Inst_cunroll_x_out_1_vout_tpl),
        .out_2_cout_tpl(B2S_Inst_cunroll_x_out_2_cout_tpl),
        .out_3_imag_q_tpl(B2S_Inst_cunroll_x_out_3_imag_q_tpl),
        .out_3_real_q_tpl(B2S_Inst_cunroll_x_out_3_real_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // out_1_vout1_tpl(GPOUT,10)
    assign out_1_vout1_tpl = B2S_Inst_cunroll_x_out_1_vout_tpl;

    // out_2_cout1_tpl(GPOUT,11)
    assign out_2_cout1_tpl = B2S_Inst_cunroll_x_out_2_cout_tpl;

    // out_3_imag_dout1_tpl(GPOUT,12)
    assign out_3_imag_dout1_tpl = B2S_Inst_cunroll_x_out_3_imag_q_tpl;

    // out_3_real_dout1_tpl(GPOUT,13)
    assign out_3_real_dout1_tpl = B2S_Inst_cunroll_x_out_3_real_q_tpl;

endmodule
