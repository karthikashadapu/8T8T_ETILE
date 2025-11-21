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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_ComplexMixer1
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_ComplexMixer1 (
    input wire [0:0] In_v,
    input wire [7:0] In_c,
    input wire [15:0] iIn_0,
    input wire [15:0] qIn_0,
    input wire [17:0] sIn_0,
    input wire [17:0] cIn_0,
    output wire [34:0] qOut_0,
    output wire [0:0] Out_v,
    output wire [7:0] Out_c,
    output wire [34:0] iOut_0,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [0:0] d_iIn_In_v_6_q;
    wire u0_as_mult_i_cma_reset;
    (* preserve_syn_only *) reg signed [17:0] u0_as_mult_i_cma_ah [0:1];
    (* preserve_syn_only *) reg signed [15:0] u0_as_mult_i_cma_ch [0:1];
    wire [17:0] u0_as_mult_i_cma_a0;
    wire [15:0] u0_as_mult_i_cma_c0;
    wire [17:0] u0_as_mult_i_cma_a1;
    wire [15:0] u0_as_mult_i_cma_c1;
    wire [34:0] u0_as_mult_i_cma_s0;
    wire [0:0] u0_as_mult_i_cma_sna;
    wire [34:0] u0_as_mult_i_cma_qq0;
    reg [34:0] u0_as_mult_i_cma_q;
    wire u0_as_mult_i_cma_ena0;
    wire u0_as_mult_i_cma_ena1;
    wire u0_as_mult_i_cma_ena2;
    wire u0_as_mult_q_cma_reset;
    (* preserve_syn_only *) reg signed [17:0] u0_as_mult_q_cma_ah [0:1];
    (* preserve_syn_only *) reg signed [15:0] u0_as_mult_q_cma_ch [0:1];
    wire [17:0] u0_as_mult_q_cma_a0;
    wire [15:0] u0_as_mult_q_cma_c0;
    wire [17:0] u0_as_mult_q_cma_a1;
    wire [15:0] u0_as_mult_q_cma_c1;
    wire [34:0] u0_as_mult_q_cma_s0;
    wire [34:0] u0_as_mult_q_cma_qq0;
    reg [34:0] u0_as_mult_q_cma_q;
    wire u0_as_mult_q_cma_ena0;
    wire u0_as_mult_q_cma_ena1;
    wire u0_as_mult_q_cma_ena2;
    wire d_iIn_In_c_6_mem_reset0;
    wire d_iIn_In_c_6_mem_ena_OrRstB;
    wire [7:0] d_iIn_In_c_6_mem_ia;
    wire [2:0] d_iIn_In_c_6_mem_aa;
    wire [2:0] d_iIn_In_c_6_mem_ab;
    wire [7:0] d_iIn_In_c_6_mem_iq;
    wire [7:0] d_iIn_In_c_6_mem_q;
    wire [2:0] d_iIn_In_c_6_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] d_iIn_In_c_6_rdcnt_i;
    (* preserve_syn_only *) reg d_iIn_In_c_6_rdcnt_eq;
    reg [2:0] d_iIn_In_c_6_wraddr_q;
    wire [2:0] d_iIn_In_c_6_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_iIn_In_c_6_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_iIn_In_c_6_sticky_ena_q;
    wire [0:0] d_iIn_In_c_6_cmp_q;
    wire [0:0] d_iIn_In_c_6_notEnable_q;
    wire [0:0] d_iIn_In_c_6_nor_q;
    wire [0:0] d_iIn_In_c_6_enaAnd_q;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // u0_as_mult_q_cma(CHAINMULTADD,11)@1 + 5
    assign u0_as_mult_q_cma_reset = areset;
    assign u0_as_mult_q_cma_ena0 = 1'b1;
    assign u0_as_mult_q_cma_ena1 = u0_as_mult_q_cma_ena0;
    assign u0_as_mult_q_cma_ena2 = u0_as_mult_q_cma_ena0;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_as_mult_q_cma_ah[0] <= '0;
            u0_as_mult_q_cma_ah[1] <= '0;
            u0_as_mult_q_cma_ch[0] <= '0;
            u0_as_mult_q_cma_ch[1] <= '0;
        end
        else
        begin
            u0_as_mult_q_cma_ah[0] <= sIn_0;
            u0_as_mult_q_cma_ah[1] <= cIn_0;
            u0_as_mult_q_cma_ch[0] <= iIn_0;
            u0_as_mult_q_cma_ch[1] <= qIn_0;
        end
    end

    assign u0_as_mult_q_cma_a0 = $unsigned(u0_as_mult_q_cma_ah[0]);
    assign u0_as_mult_q_cma_c0 = $unsigned(u0_as_mult_q_cma_ch[0]);
    assign u0_as_mult_q_cma_a1 = $unsigned(u0_as_mult_q_cma_ah[1]);
    assign u0_as_mult_q_cma_c1 = $unsigned(u0_as_mult_q_cma_ch[1]);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(18),
        .by_clken("0"),
        .by_width(18),
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
        .output_clken("1"),
        .result_a_width(35)
    ) u0_as_mult_q_cma_DSP0 (
        .clk(clk),
        .ena({ u0_as_mult_q_cma_ena2, u0_as_mult_q_cma_ena1, u0_as_mult_q_cma_ena0 }),
        .clr({ u0_as_mult_q_cma_reset, u0_as_mult_q_cma_reset }),
        .ay(u0_as_mult_q_cma_a1),
        .by(u0_as_mult_q_cma_a0),
        .ax(u0_as_mult_q_cma_c1),
        .bx(u0_as_mult_q_cma_c0),
        .resulta(u0_as_mult_q_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
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
    dspba_delay_ver #( .width(35), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_as_mult_q_cma_delay0 ( .xin(u0_as_mult_q_cma_s0), .xout(u0_as_mult_q_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_as_mult_q_cma_q = $unsigned(u0_as_mult_q_cma_qq0[34:0]);

    // qOut(GPOUT,9)@6
    assign qOut_0 = u0_as_mult_q_cma_q;

    // u0_as_mult_i_cma(CHAINMULTADD,10)@1 + 5
    assign u0_as_mult_i_cma_reset = areset;
    assign u0_as_mult_i_cma_ena0 = 1'b1;
    assign u0_as_mult_i_cma_ena1 = u0_as_mult_i_cma_ena0;
    assign u0_as_mult_i_cma_ena2 = u0_as_mult_i_cma_ena0;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_as_mult_i_cma_ah[0] <= '0;
            u0_as_mult_i_cma_ah[1] <= '0;
            u0_as_mult_i_cma_ch[0] <= '0;
            u0_as_mult_i_cma_ch[1] <= '0;
        end
        else
        begin
            u0_as_mult_i_cma_ah[0] <= sIn_0;
            u0_as_mult_i_cma_ah[1] <= cIn_0;
            u0_as_mult_i_cma_ch[0] <= qIn_0;
            u0_as_mult_i_cma_ch[1] <= iIn_0;
        end
    end

    assign u0_as_mult_i_cma_a0 = $unsigned(u0_as_mult_i_cma_ah[0]);
    assign u0_as_mult_i_cma_c0 = $unsigned(u0_as_mult_i_cma_ch[0]);
    assign u0_as_mult_i_cma_a1 = $unsigned(u0_as_mult_i_cma_ah[1]);
    assign u0_as_mult_i_cma_c1 = $unsigned(u0_as_mult_i_cma_ch[1]);
    assign u0_as_mult_i_cma_sna = $unsigned(VCC_q);
    tennm_mac #(
        .operation_mode("m18x18_sumof2"),
        .clear_type("sclr"),
        .use_chainadder("false"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(18),
        .by_clken("0"),
        .by_width(18),
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
        .output_clken("1"),
        .result_a_width(35)
    ) u0_as_mult_i_cma_DSP0 (
        .clk(clk),
        .ena({ u0_as_mult_i_cma_ena2, u0_as_mult_i_cma_ena1, u0_as_mult_i_cma_ena0 }),
        .clr({ u0_as_mult_i_cma_reset, u0_as_mult_i_cma_reset }),
        .sub(u0_as_mult_i_cma_sna[0]),
        .negate(u0_as_mult_i_cma_sna[0]),
        .ay(u0_as_mult_i_cma_a1),
        .by(u0_as_mult_i_cma_a0),
        .ax(u0_as_mult_i_cma_c1),
        .bx(u0_as_mult_i_cma_c0),
        .resulta(u0_as_mult_i_cma_s0),
        .accumulate(),
        .loadconst(),
        .az(),
        .coefsela(),
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
    dspba_delay_ver #( .width(35), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_as_mult_i_cma_delay0 ( .xin(u0_as_mult_i_cma_s0), .xout(u0_as_mult_i_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_as_mult_i_cma_q = $unsigned(u0_as_mult_i_cma_qq0[34:0]);

    // d_iIn_In_c_6_notEnable(LOGICAL,20)@0
    assign d_iIn_In_c_6_notEnable_q = $unsigned(~ (VCC_q));

    // d_iIn_In_c_6_nor(LOGICAL,21)@0
    assign d_iIn_In_c_6_nor_q = ~ (d_iIn_In_c_6_notEnable_q | d_iIn_In_c_6_sticky_ena_q);

    // d_iIn_In_c_6_mem_last(CONSTANT,17)
    assign d_iIn_In_c_6_mem_last_q = $unsigned(3'b011);

    // d_iIn_In_c_6_cmp(LOGICAL,18)@0
    assign d_iIn_In_c_6_cmp_q = $unsigned(d_iIn_In_c_6_mem_last_q == d_iIn_In_c_6_rdcnt_q ? 1'b1 : 1'b0);

    // d_iIn_In_c_6_cmpReg(REG,19)@0 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_iIn_In_c_6_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_iIn_In_c_6_cmpReg_q <= $unsigned(d_iIn_In_c_6_cmp_q);
        end
    end

    // d_iIn_In_c_6_sticky_ena(REG,22)@0 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_iIn_In_c_6_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_iIn_In_c_6_nor_q == 1'b1)
        begin
            d_iIn_In_c_6_sticky_ena_q <= $unsigned(d_iIn_In_c_6_cmpReg_q);
        end
    end

    // d_iIn_In_c_6_enaAnd(LOGICAL,23)@0
    assign d_iIn_In_c_6_enaAnd_q = d_iIn_In_c_6_sticky_ena_q & VCC_q;

    // d_iIn_In_c_6_rdcnt(COUNTER,15)@0 + 1
    // low=0, high=4, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_iIn_In_c_6_rdcnt_i <= 3'd0;
            d_iIn_In_c_6_rdcnt_eq <= 1'b0;
        end
        else
        begin
            if (d_iIn_In_c_6_rdcnt_i == 3'd3)
            begin
                d_iIn_In_c_6_rdcnt_eq <= 1'b1;
            end
            else
            begin
                d_iIn_In_c_6_rdcnt_eq <= 1'b0;
            end
            if (d_iIn_In_c_6_rdcnt_eq == 1'b1)
            begin
                d_iIn_In_c_6_rdcnt_i <= $unsigned(d_iIn_In_c_6_rdcnt_i) + $unsigned(3'd4);
            end
            else
            begin
                d_iIn_In_c_6_rdcnt_i <= $unsigned(d_iIn_In_c_6_rdcnt_i) + $unsigned(3'd1);
            end
        end
    end
    assign d_iIn_In_c_6_rdcnt_q = d_iIn_In_c_6_rdcnt_i[2:0];

    // d_iIn_In_c_6_wraddr(REG,16)@0 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_iIn_In_c_6_wraddr_q <= $unsigned(3'b100);
        end
        else
        begin
            d_iIn_In_c_6_wraddr_q <= $unsigned(d_iIn_In_c_6_rdcnt_q);
        end
    end

    // d_iIn_In_c_6_mem(DUALMEM,14)@0 + 2
    assign d_iIn_In_c_6_mem_ia = In_c;
    assign d_iIn_In_c_6_mem_aa = d_iIn_In_c_6_wraddr_q;
    assign d_iIn_In_c_6_mem_ab = d_iIn_In_c_6_rdcnt_q;
    assign d_iIn_In_c_6_mem_ena_OrRstB = areset | d_iIn_In_c_6_enaAnd_q[0];
    assign d_iIn_In_c_6_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(8),
        .widthad_a(3),
        .numwords_a(5),
        .width_b(8),
        .widthad_b(3),
        .numwords_b(5),
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
    ) d_iIn_In_c_6_mem_dmem (
        .clocken1(d_iIn_In_c_6_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_iIn_In_c_6_mem_reset0),
        .clock1(clk),
        .address_a(d_iIn_In_c_6_mem_aa),
        .data_a(d_iIn_In_c_6_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_iIn_In_c_6_mem_ab),
        .q_b(d_iIn_In_c_6_mem_iq),
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
    assign d_iIn_In_c_6_mem_q = d_iIn_In_c_6_mem_iq[7:0];

    // d_iIn_In_v_6(DELAY,12)@0 + 6
    dspba_delay_ver #( .width(1), .depth(6), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_iIn_In_v_6 ( .xin(In_v), .xout(d_iIn_In_v_6_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // iOut(PORTOUT,8)@6 + 1
    assign Out_v = d_iIn_In_v_6_q;
    assign Out_c = d_iIn_In_c_6_mem_q;
    assign iOut_0 = u0_as_mult_i_cma_q;

endmodule
