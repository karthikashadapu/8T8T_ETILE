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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo (
    input wire [0:0] in_1_valid_rd_in_tpl,
    input wire [0:0] in_2_valid_wr_in_tpl,
    input wire [31:0] in_3_time_ref_in_tpl,
    input wire [7:0] in_4_channel_wr_in_tpl,
    input wire [7:0] in_5_ch_rd_in_tpl,
    output wire [31:0] out_1_time_ref_out_tpl,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [0:0] And1_q;
    wire [7:0] CmpEQ1_b;
    wire [0:0] CmpEQ1_q;
    wire FIFO_reset;
    wire [0:0] FIFO_f;
    wire [0:0] FIFO_e;
    wire [0:0] FIFO_t;
    wire [31:0] FIFO_q;
    wire [0:0] FIFO_empty;
    wire [0:0] FIFO_v;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_latch_0L_Mux_x_s;
    reg [31:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_latch_0L_Mux_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge_And_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge_Not_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge_Not_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge1_And_x_q;
    wire [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge1_Not_x_qi;
    reg [0:0] LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge1_Not_x_q;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge_Not_x(LOGICAL,11)@0 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge_Not_x_qi = ~ (in_2_valid_wr_in_tpl);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge_Not_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge_Not_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge_Not_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge_And_x(LOGICAL,10)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge_And_x_q = in_2_valid_wr_in_tpl & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge_Not_x_q;

    // FIFO(FIFO,5)@1
    assign FIFO_reset = areset;
    scfifo #(
        .add_ram_output_register("ON"),
        .almost_empty_value(4),
        .almost_full_value(16),
        .intended_device_family("Agilex 7"),
        .lpm_numwords(32),
        .lpm_showahead("ON"),
        .lpm_type("scfifo"),
        .lpm_width(32),
        .lpm_widthu(5),
        .overflow_checking("ON"),
        .underflow_checking("ON"),
        .use_eab("ON")
    ) FIFO_fifo (
        .aclr(1'b0),
        .sclr(FIFO_reset),
        .clock(clk),
        .rdreq(And1_q[0]),
        .wrreq(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge_And_x_q[0]),
        .data(in_3_time_ref_in_tpl),
        .almost_full(FIFO_f[0]),
        .almost_empty(FIFO_t[0]),
        .empty(FIFO_empty[0]),
        .q(FIFO_q),
        .full(),
        .usedw(),
        .eccstatus()
    );
    assign FIFO_e = ~ (FIFO_t);
    assign FIFO_v = ~ (FIFO_empty);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge1_Not_x(LOGICAL,14)@0 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge1_Not_x_qi = ~ (in_1_valid_rd_in_tpl);
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge1_Not_x_delay ( .xin(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge1_Not_x_qi), .xout(LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge1_Not_x_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge1_And_x(LOGICAL,13)@1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge1_And_x_q = in_1_valid_rd_in_tpl & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge1_Not_x_q;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // CmpEQ1(LOGICAL,3)@1
    assign CmpEQ1_b = {7'b0000000, GND_q};
    assign CmpEQ1_q = $unsigned(in_5_ch_rd_in_tpl == CmpEQ1_b ? 1'b1 : 1'b0);

    // And1(LOGICAL,2)@1
    assign And1_q = CmpEQ1_q & LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_rising_edge1_And_x_q;

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_latch_0L_Mux_x(MUX,8)@1 + 1
    assign LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_latch_0L_Mux_x_s = And1_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_latch_0L_Mux_x_q <= 32'b0;
        end
        else
        begin
            unique case (LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_latch_0L_Mux_x_s)
                1'b0 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_latch_0L_Mux_x_q <= LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_latch_0L_Mux_x_q;
                1'b1 : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_latch_0L_Mux_x_q <= FIFO_q;
                default : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_latch_0L_Mux_x_q <= 32'b0;
            endcase
        end
    end

    // GPOut(GPOUT,7)@2
    assign out_1_time_ref_out_tpl = LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_latch_0L_Mux_x_q;

endmodule
