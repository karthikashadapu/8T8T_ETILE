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

// SystemVerilog created from ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch
// SystemVerilog created on Thu Jun 12 21:17:49 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch (
    input wire [0:0] in_1_valid_tpl,
    input wire [7:0] in_2_ch_tpl,
    input wire [15:0] in_3_real_data_tpl,
    input wire [15:0] in_3_imag_data_tpl,
    input wire [3:0] in_4_FFTSize_tpl,
    input wire [11:0] in_5_NSubCarr_tpl,
    input wire [10:0] in_6_cplen_tpl,
    input wire [0:0] in_7_DC_SC_EN1_tpl,
    input wire [15:0] in_8_iftgain_real_tpl,
    input wire [15:0] in_9_ifftgain_imag_tpl,
    input wire [3:0] in_10_ifftshift_tpl,
    input wire [15:0] in_11_ifft_mux_const_data_tpl,
    input wire [0:0] in_12_muxsel_tpl,
    input wire [63:0] in_13_time_in_tpl,
    output wire [0:0] out_1_qvalid_tpl,
    output wire [7:0] out_2_qchannel_tpl,
    output wire [15:0] out_3_real_qdata_tpl,
    output wire [15:0] out_3_imag_qdata_tpl,
    output wire [3:0] out_4_qfftsize_tpl,
    output wire [11:0] out_5_q_nprb_tpl,
    output wire [10:0] out_6_qcplen_tpl,
    output wire [0:0] out_7_q_dc_sc_en_tpl,
    output wire [15:0] out_8_qfft_gain_real_tpl,
    output wire [15:0] out_9_qf_ift_gain_imag_tpl,
    output wire [3:0] out_10_q_ifftshift_tpl,
    output wire [15:0] out_11_q_ifft_mux_const_data_tpl,
    output wire [0:0] out_12_q_muxsel_tpl,
    output wire [63:0] out_13_time_out_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_And_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_Not1_x_qi;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_Not1_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_s;
    reg [7:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_s;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_s;
    reg [3:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_s;
    reg [11:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_s;
    reg [10:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_s;
    reg [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_s;
    reg [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_s;
    reg [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_s;
    reg [3:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_s;
    reg [15:0] ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_q;
    reg [15:0] redist0_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_q_1_q;
    reg [3:0] redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_q_1_q;
    reg [15:0] redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_q_1_q;
    reg [15:0] redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_q_1_q;
    reg [0:0] redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_q_1_q;
    reg [10:0] redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_q_1_q;
    reg [11:0] redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_q_1_q;
    reg [3:0] redist7_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_q_1_q;
    reg [0:0] redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_q_1_q;
    reg [7:0] redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_q_1_q;

    import ifft_blocktostream_DUT_safe_path_ver::safe_path_ver;

    // redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_q_1(DELAY,35)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_Not1_x(LOGICAL,5)@0 + 1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_Not1_x_qi = ~ (in_1_valid_tpl);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("NONE"), .phase(0), .modulus(1) )
    ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_Not1_x_delay ( .xin(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_Not1_x_qi), .xout(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_Not1_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_And_x(LOGICAL,4)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_And_x_q = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_Not1_x_q & in_1_valid_tpl;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x(MUX,9)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_And_x_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_s or redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_q_1_q or in_12_muxsel_tpl)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_q = redist8_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_q_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_q = in_12_muxsel_tpl;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_q = 1'b0;
        endcase
    end

    // redist0_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_q_1(DELAY,27)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist0_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x(MUX,25)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_And_x_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_s or redist0_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_q_1_q or in_11_ifft_mux_const_data_tpl)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_q = redist0_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_q_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_q = in_11_ifft_mux_const_data_tpl;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_q = 16'b0;
        endcase
    end

    // redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_q_1(DELAY,28)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x(MUX,23)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_And_x_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_s or redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_q_1_q or in_10_ifftshift_tpl)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_q = redist1_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_q_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_q = in_10_ifftshift_tpl;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_q = 4'b0;
        endcase
    end

    // redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_q_1(DELAY,29)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x(MUX,21)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_And_x_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_s or redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_q_1_q or in_9_ifftgain_imag_tpl)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_q = redist2_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_q_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_q = in_9_ifftgain_imag_tpl;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_q = 16'b0;
        endcase
    end

    // redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_q_1(DELAY,30)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x(MUX,19)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_And_x_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_s or redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_q_1_q or in_8_iftgain_real_tpl)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_q = redist3_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_q_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_q = in_8_iftgain_real_tpl;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_q = 16'b0;
        endcase
    end

    // redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_q_1(DELAY,31)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x(MUX,17)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_And_x_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_s or redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_q_1_q or in_7_DC_SC_EN1_tpl)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_q = redist4_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_q_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_q = in_7_DC_SC_EN1_tpl;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_q = 1'b0;
        endcase
    end

    // redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_q_1(DELAY,32)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x(MUX,15)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_And_x_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_s or redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_q_1_q or in_6_cplen_tpl)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_q = redist5_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_q_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_q = in_6_cplen_tpl;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_q = 11'b0;
        endcase
    end

    // redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_q_1(DELAY,33)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x(MUX,13)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_And_x_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_s or redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_q_1_q or in_5_NSubCarr_tpl)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_q = redist6_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_q_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_q = in_5_NSubCarr_tpl;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_q = 12'b0;
        endcase
    end

    // redist7_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_q_1(DELAY,34)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist7_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist7_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x(MUX,11)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_And_x_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_s or redist7_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_q_1_q or in_4_FFTSize_tpl)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_q = redist7_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_q_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_q = in_4_FFTSize_tpl;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_q = 4'b0;
        endcase
    end

    // redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_q_1(DELAY,36)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_q_1_q <= '0;
        end
        else
        begin
            redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_q_1_q <= $unsigned(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_q);
        end
    end

    // ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x(MUX,7)@1
    assign ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_s = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_RISING_EDGE1_And_x_q;
    always @(ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_s or redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_q_1_q or in_2_ch_tpl)
    begin
        unique case (ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_s)
            1'b0 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_q = redist9_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_q_1_q;
            1'b1 : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_q = in_2_ch_tpl;
            default : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_q = 8'b0;
        endcase
    end

    // ChannelOut_cunroll_x(PORTOUT,3)@1 + 1
    assign out_1_qvalid_tpl = in_1_valid_tpl;
    assign out_2_qchannel_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L_Mux_x_q;
    assign out_3_real_qdata_tpl = in_3_real_data_tpl;
    assign out_3_imag_qdata_tpl = in_3_imag_data_tpl;
    assign out_4_qfftsize_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L2_Mux_x_q;
    assign out_5_q_nprb_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L3_Mux_x_q;
    assign out_6_qcplen_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L4_Mux_x_q;
    assign out_7_q_dc_sc_en_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L5_Mux_x_q;
    assign out_8_qfft_gain_real_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L6_Mux_x_q;
    assign out_9_qf_ift_gain_imag_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L7_Mux_x_q;
    assign out_10_q_ifftshift_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L8_Mux_x_q;
    assign out_11_q_ifft_mux_const_data_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L9_Mux_x_q;
    assign out_12_q_muxsel_tpl = ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_latch_0L10_Mux_x_q;
    assign out_13_time_out_tpl = in_13_time_in_tpl;

endmodule
