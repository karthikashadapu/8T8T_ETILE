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

// SystemVerilog created from ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen
// SystemVerilog created on Thu Jun 12 21:17:49 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen (
    input wire [0:0] in_1_vin_tpl,
    input wire [7:0] in_2_chin_tpl,
    input wire [15:0] in_3_real_din_tpl,
    input wire [15:0] in_3_imag_din_tpl,
    input wire [0:0] in_4_eAxC_in_tpl,
    output wire [0:0] out_1_vout_tpl,
    output wire [7:0] out_2_chout_tpl,
    output wire [15:0] out_3_real_dout_tpl,
    output wire [15:0] out_3_imag_dout_tpl,
    output wire [0:0] out_4_eAxC_out_tpl,
    output wire [0:0] out_5_eop_eAxC_tpl,
    output wire [0:0] out_6_eop_sym_tpl,
    output wire [0:0] out_7_sop_eAxC_tpl,
    output wire [0:0] out_8_sop_sym_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] VCC_q;
    wire [0:0] And_rsrvd_fix_q;
    wire [0:0] And1_q;
    wire [7:0] CmpEQ_b;
    wire [0:0] CmpEQ_q;
    wire [7:0] CmpEQ1_b;
    wire [0:0] CmpEQ1_q;
    wire [7:0] Const_rsrvd_fix_q;
    wire [7:0] Const1_q;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl;
    wire [0:0] ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_falling_edge_Finite_State_Machine_x_out_1_fsm_q_tpl;
    reg [0:0] redist0_channel_RXG1_in_cunroll_x_in_1_vin_tpl_1_q;
    reg [7:0] redist1_channel_RXG1_in_cunroll_x_in_2_chin_tpl_1_q;
    reg [15:0] redist2_channel_RXG1_in_cunroll_x_in_3_real_din_tpl_1_q;
    reg [15:0] redist3_channel_RXG1_in_cunroll_x_in_3_imag_din_tpl_1_q;
    reg [0:0] redist4_channel_RXG1_in_cunroll_x_in_4_eAxC_in_tpl_1_q;

    import ifft_blocktostream_DUT_safe_path_ver::safe_path_ver;

    // Const1(CONSTANT,9)
    assign Const1_q = $unsigned(8'b00000000);

    // CmpEQ1(LOGICAL,7)@0
    assign CmpEQ1_b = {7'b0000000, redist4_channel_RXG1_in_cunroll_x_in_4_eAxC_in_tpl_1_q};
    assign CmpEQ1_q = $unsigned(Const1_q == CmpEQ1_b ? 1'b1 : 1'b0);

    // And1(LOGICAL,5)@0
    assign And1_q = ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl & CmpEQ1_q;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_Rising_edge_Finite_State_Machine_x(BLACKBOX,18)@0
    ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_Rising_edge_Finite_State_Machine theifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_Rising_edge_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(redist0_channel_RXG1_in_cunroll_x_in_1_vin_tpl_1_q),
        .out_1_fsm_q_tpl(ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // Const_rsrvd_fix(CONSTANT,8)
    assign Const_rsrvd_fix_q = $unsigned(8'b00000011);

    // CmpEQ(LOGICAL,6)@0
    assign CmpEQ_b = {7'b0000000, in_4_eAxC_in_tpl};
    assign CmpEQ_q = $unsigned(Const_rsrvd_fix_q == CmpEQ_b ? 1'b1 : 1'b0);

    // And_rsrvd_fix(LOGICAL,4)@0
    assign And_rsrvd_fix_q = ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_falling_edge_Finite_State_Machine_x_out_1_fsm_q_tpl & CmpEQ_q;

    // ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_falling_edge_Finite_State_Machine_x(BLACKBOX,20)@0
    ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_falling_edge_Finite_State_Machine theifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_falling_edge_Finite_State_Machine_x (
        .in_1_go_tpl(VCC_q),
        .in_2_x_tpl(in_1_vin_tpl),
        .out_1_fsm_q_tpl(ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_falling_edge_Finite_State_Machine_x_out_1_fsm_q_tpl),
        .clk(clk),
        .areset(areset)
    );

    // redist4_channel_RXG1_in_cunroll_x_in_4_eAxC_in_tpl_1(DELAY,29)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist4_channel_RXG1_in_cunroll_x_in_4_eAxC_in_tpl_1_q <= $unsigned(in_4_eAxC_in_tpl);
        end
    end

    // redist3_channel_RXG1_in_cunroll_x_in_3_imag_din_tpl_1(DELAY,28)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist3_channel_RXG1_in_cunroll_x_in_3_imag_din_tpl_1_q <= $unsigned(in_3_imag_din_tpl);
        end
    end

    // redist2_channel_RXG1_in_cunroll_x_in_3_real_din_tpl_1(DELAY,27)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist2_channel_RXG1_in_cunroll_x_in_3_real_din_tpl_1_q <= $unsigned(in_3_real_din_tpl);
        end
    end

    // redist1_channel_RXG1_in_cunroll_x_in_2_chin_tpl_1(DELAY,26)
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            redist1_channel_RXG1_in_cunroll_x_in_2_chin_tpl_1_q <= $unsigned(in_2_chin_tpl);
        end
    end

    // redist0_channel_RXG1_in_cunroll_x_in_1_vin_tpl_1(DELAY,25)
    always @ (posedge clk)
    begin
        if (areset)
        begin
            redist0_channel_RXG1_in_cunroll_x_in_1_vin_tpl_1_q <= '0;
        end
        else
        begin
            redist0_channel_RXG1_in_cunroll_x_in_1_vin_tpl_1_q <= $unsigned(in_1_vin_tpl);
        end
    end

    // channel_RXG1_out_cunroll_x(PORTOUT,16)@0 + 1
    assign out_1_vout_tpl = redist0_channel_RXG1_in_cunroll_x_in_1_vin_tpl_1_q;
    assign out_2_chout_tpl = redist1_channel_RXG1_in_cunroll_x_in_2_chin_tpl_1_q;
    assign out_3_real_dout_tpl = redist2_channel_RXG1_in_cunroll_x_in_3_real_din_tpl_1_q;
    assign out_3_imag_dout_tpl = redist3_channel_RXG1_in_cunroll_x_in_3_imag_din_tpl_1_q;
    assign out_4_eAxC_out_tpl = redist4_channel_RXG1_in_cunroll_x_in_4_eAxC_in_tpl_1_q;
    assign out_5_eop_eAxC_tpl = ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_falling_edge_Finite_State_Machine_x_out_1_fsm_q_tpl;
    assign out_6_eop_sym_tpl = And_rsrvd_fix_q;
    assign out_7_sop_eAxC_tpl = ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_Rising_edge_Finite_State_Machine_x_out_1_fsm_q_tpl;
    assign out_8_sop_sym_tpl = And1_q;

endmodule
