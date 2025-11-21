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

// SystemVerilog created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_NCO1
// SystemVerilog created on Fri Dec  6 17:01:04 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_NCO1 (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [29:0] xIn_p_0,
    input wire [0:0] xIn_s_0,
    input wire [31:0] busIn_writedata,
    input wire [1:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] ncoOut_v,
    output wire [7:0] ncoOut_c,
    output wire [17:0] sinOut_0,
    output wire [17:0] cosOut_0,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [0:0] d_xIn_s_0_12_q;
    reg [0:0] d_xIn_s_0_12_delay_0;
    reg [29:0] d_xIn_p_0_12_q;
    reg [29:0] d_xIn_p_0_12_delay_0;
    reg [0:0] d_xIn_v_12_q;
    reg [0:0] d_xIn_v_12_delay_0;
    reg [0:0] d_xIn_v_27_q;
    reg [0:0] d_busIn_read_13_q;
    reg [0:0] d_busIn_read_13_delay_0;
    reg [0:0] d_busIn_read_13_delay_1;
    reg [31:0] d_busIn_writedata_11_q;
    reg [1:0] u0_phaseIncrMemLookup_q;
    reg [0:0] u0_phaseIncrMemLookup_h;
    reg [0:0] u0_phaseIncrMemLookup_e;
    wire [0:0] u0_phaseIncrMemLookup_c;
    reg [0:0] d_u0_phaseIncrMemLookup_h_13_q;
    reg [0:0] d_u0_phaseIncrMemLookup_h_13_delay_0;
    wire u0_phaseIncrMem_reset0;
    wire u0_phaseIncrMem_ena_NotRstA;
    wire u0_phaseIncrMem_reset1;
    wire [31:0] u0_phaseIncrMem_ia;
    wire [1:0] u0_phaseIncrMem_aa;
    wire [1:0] u0_phaseIncrMem_ab;
    wire [31:0] u0_phaseIncrMem_iq;
    wire [31:0] u0_phaseIncrMem_q;
    wire readbackMem_reset0;
    wire readbackMem_ena_NotRstA;
    wire [31:0] readbackMem_ia;
    wire [1:0] readbackMem_aa;
    wire [1:0] readbackMem_ab;
    wire [31:0] readbackMem_iq;
    wire [31:0] readbackMem_q;
    wire [29:0] u0_accumAdd_b4_a;
    wire [29:0] u0_accumAdd_b4_b;
    wire [29:0] u0_accumAdd_b4_i;
    wire [29:0] u0_accumAdd_b4_a1;
    wire [29:0] u0_accumAdd_b4_b1;
    logic [29:0] u0_accumAdd_b4_o;
    wire [29:0] u0_accumAdd_b4_q;
    reg [29:0] d_u0_accumAdd_b4_q_14_q;
    reg [29:0] u0_accumLast_b4_q;
    reg [29:0] u0_accumLast_b4_delay_0;
    reg [29:0] u0_accumLast_b4_delay_1;
    reg [2:0] d_u0_octantBitSelect_b_24_q;
    reg [2:0] d_u0_octantBitSelect_b_25_q;
    reg [30:0] u0_rangeLUT_q;
    reg [0:0] u0_addnsubConst_q;
    wire [32:0] u0_rangeAddSub_a;
    wire [32:0] u0_rangeAddSub_b;
    logic [32:0] u0_rangeAddSub_o;
    wire [0:0] u0_rangeAddSub_s;
    wire [31:0] u0_rangeAddSub_q;
    wire u0_sinTable_reset0;
    wire u0_sinTable_ena_NotRstA;
    wire [17:0] u0_sinTable_ia;
    wire [7:0] u0_sinTable_aa;
    wire [7:0] u0_sinTable_ab;
    wire [17:0] u0_sinTable_ir;
    wire [17:0] u0_sinTable_r;
    wire u0_cosTable_reset0;
    wire u0_cosTable_ena_NotRstA;
    wire [17:0] u0_cosTable_ia;
    wire [7:0] u0_cosTable_aa;
    wire [7:0] u0_cosTable_ab;
    wire [17:0] u0_cosTable_ir;
    wire [17:0] u0_cosTable_r;
    wire [31:0] u0_cm1_a;
    wire [31:0] u0_cm1_b;
    logic [31:0] u0_cm1_o;
    wire [31:0] u0_cm1_q;
    wire [26:0] u0_cm2_a;
    wire [26:0] u0_cm2_b;
    logic [26:0] u0_cm2_o;
    wire [26:0] u0_cm2_q;
    wire [32:0] u0_cm3_a;
    wire [32:0] u0_cm3_b;
    logic [32:0] u0_cm3_o;
    wire [32:0] u0_cm3_q;
    wire [19:0] u0_sin_pi_over_4_q;
    wire [19:0] u0_sinAdd_a;
    wire [19:0] u0_sinAdd_b;
    wire [19:0] u0_sinAdd_i;
    wire [19:0] u0_sinAdd_a1;
    wire [19:0] u0_sinAdd_b1;
    logic [19:0] u0_sinAdd_o;
    wire [19:0] u0_sinAdd_q;
    wire [19:0] u0_cosSub_a;
    wire [19:0] u0_cosSub_b;
    wire [19:0] u0_cosSub_i;
    wire [19:0] u0_cosSub_a1;
    wire [19:0] u0_cosSub_b1;
    logic [19:0] u0_cosSub_o;
    wire [19:0] u0_cosSub_q;
    reg [0:0] u0_doSwap_q;
    reg [0:0] u0_doSinInvert_q;
    reg [0:0] u0_doCosInvert_q;
    wire [0:0] u0_sinSwapMux_s;
    reg [18:0] u0_sinSwapMux_q;
    wire [0:0] u0_cosSwapMux_s;
    reg [18:0] u0_cosSwapMux_q;
    wire [17:0] u0_sinInvert_a;
    wire [17:0] u0_sinInvert_b;
    wire [17:0] u0_sinInvert_i;
    wire [17:0] u0_sinInvert_a1;
    wire [17:0] u0_sinInvert_b1;
    logic [17:0] u0_sinInvert_o;
    wire [17:0] u0_sinInvert_q;
    wire [17:0] u0_cosInvert_a;
    wire [17:0] u0_cosInvert_b;
    wire [17:0] u0_cosInvert_i;
    wire [17:0] u0_cosInvert_a1;
    wire [17:0] u0_cosInvert_b1;
    logic [17:0] u0_cosInvert_o;
    wire [17:0] u0_cosInvert_q;
    wire u0_sinMult_cma_reset;
    (* preserve_syn_only *) reg [17:0] u0_sinMult_cma_ah [0:0];
    (* preserve_syn_only *) reg [17:0] u0_sinMult_cma_ch [0:0];
    wire [17:0] u0_sinMult_cma_a0;
    wire [17:0] u0_sinMult_cma_c0;
    wire [35:0] u0_sinMult_cma_s0;
    wire [35:0] u0_sinMult_cma_qq0;
    reg [35:0] u0_sinMult_cma_q;
    wire u0_sinMult_cma_ena0;
    wire u0_sinMult_cma_ena1;
    wire u0_sinMult_cma_ena2;
    wire u0_cosMult_cma_reset;
    (* preserve_syn_only *) reg [17:0] u0_cosMult_cma_ah [0:0];
    (* preserve_syn_only *) reg [17:0] u0_cosMult_cma_ch [0:0];
    wire [17:0] u0_cosMult_cma_a0;
    wire [17:0] u0_cosMult_cma_c0;
    wire [35:0] u0_cosMult_cma_s0;
    wire [35:0] u0_cosMult_cma_qq0;
    reg [35:0] u0_cosMult_cma_q;
    wire u0_cosMult_cma_ena0;
    wire u0_cosMult_cma_ena1;
    wire u0_cosMult_cma_ena2;
    wire [1:0] u0_roundedSin_bias_q;
    wire [21:0] u0_roundedSin_add_a;
    wire [21:0] u0_roundedSin_add_b;
    logic [21:0] u0_roundedSin_add_o;
    wire [20:0] u0_roundedSin_add_q;
    wire [21:0] u0_roundedCos_add_a;
    wire [21:0] u0_roundedCos_add_b;
    logic [21:0] u0_roundedCos_add_o;
    wire [20:0] u0_roundedCos_add_q;
    reg [0:0] d_u0_alphaBitSelect_bit_select_merged_c_23_q;
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
    wire d_u0_phaseIncrMem_q_25_mem_reset0;
    wire d_u0_phaseIncrMem_q_25_mem_ena_OrRstB;
    wire [31:0] d_u0_phaseIncrMem_q_25_mem_ia;
    wire [3:0] d_u0_phaseIncrMem_q_25_mem_aa;
    wire [3:0] d_u0_phaseIncrMem_q_25_mem_ab;
    wire [31:0] d_u0_phaseIncrMem_q_25_mem_iq;
    wire [31:0] d_u0_phaseIncrMem_q_25_mem_q;
    wire [3:0] d_u0_phaseIncrMem_q_25_rdcnt_q;
    (* preserve_syn_only *) reg [3:0] d_u0_phaseIncrMem_q_25_rdcnt_i;
    (* preserve_syn_only *) reg d_u0_phaseIncrMem_q_25_rdcnt_eq;
    reg [3:0] d_u0_phaseIncrMem_q_25_wraddr_q;
    wire [4:0] d_u0_phaseIncrMem_q_25_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_u0_phaseIncrMem_q_25_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_u0_phaseIncrMem_q_25_sticky_ena_q;
    wire d_u0_sinTable_r_23_mem_reset0;
    wire d_u0_sinTable_r_23_mem_ena_OrRstB;
    wire [17:0] d_u0_sinTable_r_23_mem_ia;
    wire [2:0] d_u0_sinTable_r_23_mem_aa;
    wire [2:0] d_u0_sinTable_r_23_mem_ab;
    wire [17:0] d_u0_sinTable_r_23_mem_iq;
    wire [17:0] d_u0_sinTable_r_23_mem_q;
    wire [2:0] d_u0_sinTable_r_23_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] d_u0_sinTable_r_23_rdcnt_i;
    (* preserve_syn_only *) reg d_u0_sinTable_r_23_rdcnt_eq;
    reg [2:0] d_u0_sinTable_r_23_wraddr_q;
    wire [2:0] d_u0_sinTable_r_23_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_u0_sinTable_r_23_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_u0_sinTable_r_23_sticky_ena_q;
    wire d_u0_cosTable_r_23_mem_reset0;
    wire d_u0_cosTable_r_23_mem_ena_OrRstB;
    wire [17:0] d_u0_cosTable_r_23_mem_ia;
    wire [2:0] d_u0_cosTable_r_23_mem_aa;
    wire [2:0] d_u0_cosTable_r_23_mem_ab;
    wire [17:0] d_u0_cosTable_r_23_mem_iq;
    wire [17:0] d_u0_cosTable_r_23_mem_q;
    wire [2:0] d_u0_cosTable_r_23_rdcnt_q;
    (* preserve_syn_only *) reg [2:0] d_u0_cosTable_r_23_rdcnt_i;
    (* preserve_syn_only *) reg d_u0_cosTable_r_23_rdcnt_eq;
    reg [2:0] d_u0_cosTable_r_23_wraddr_q;
    wire [2:0] d_u0_cosTable_r_23_mem_last_q;
    (* preserve_syn_only *) reg [0:0] d_u0_cosTable_r_23_cmpReg_q;
    (* preserve_syn_only *) reg [0:0] d_u0_cosTable_r_23_sticky_ena_q;
    wire [0:0] readbackReadValid_q;
    wire [4:0] d_xIn_c_27_cmp_b;
    wire [0:0] d_xIn_c_27_cmp_q;
    wire [0:0] d_xIn_c_27_notEnable_q;
    wire [0:0] d_xIn_c_27_nor_q;
    wire [0:0] d_xIn_c_27_enaAnd_q;
    wire [4:0] d_u0_phaseIncrMem_q_25_cmp_b;
    wire [0:0] d_u0_phaseIncrMem_q_25_cmp_q;
    wire [0:0] d_u0_phaseIncrMem_q_25_notEnable_q;
    wire [0:0] d_u0_phaseIncrMem_q_25_nor_q;
    wire [0:0] d_u0_phaseIncrMem_q_25_enaAnd_q;
    wire [0:0] d_u0_sinTable_r_23_cmp_q;
    wire [0:0] d_u0_sinTable_r_23_notEnable_q;
    wire [0:0] d_u0_sinTable_r_23_nor_q;
    wire [0:0] d_u0_sinTable_r_23_enaAnd_q;
    wire [0:0] d_u0_cosTable_r_23_cmp_q;
    wire [0:0] d_u0_cosTable_r_23_notEnable_q;
    wire [0:0] d_u0_cosTable_r_23_nor_q;
    wire [0:0] d_u0_cosTable_r_23_enaAnd_q;
    wire [2:0] u0_octantBitSelect_b;
    wire [27:0] u0_alphaBitSelect_bit_select_merged_in;
    wire [7:0] u0_alphaBitSelect_bit_select_merged_b;
    wire [0:0] u0_alphaBitSelect_bit_select_merged_c;
    wire [18:0] u0_alphaBitSelect_bit_select_merged_d;
    wire [37:0] u0_beta_times_4_shift_q;
    wire [37:0] u0_beta_times_4_shift_qint;
    wire [18:0] u0_roundedSin_trunc_q;
    wire [19:0] u0_roundedSin_trunc_qint;
    wire [18:0] u0_roundedCos_trunc_q;
    wire [19:0] u0_roundedCos_trunc_qint;
    wire [19:0] u0_shiftCosB_q;
    wire [35:0] u0_shiftCosB_qint;
    wire [19:0] u0_shiftSinB_q;
    wire [35:0] u0_shiftSinB_qint;
    wire [19:0] u0_roundedSin_shift_q;
    wire [20:0] u0_roundedSin_shift_qint;
    wire [19:0] u0_roundedCos_shift_q;
    wire [20:0] u0_roundedCos_shift_qint;
    wire [0:0] u0_invertSin_bit_select_merged_b;
    wire [0:0] u0_invertSin_bit_select_merged_c;
    wire [19:0] u0_lsSinTable_q;
    wire [19:0] u0_lsSinTable_qint;
    wire [19:0] u0_lsCosTable_q;
    wire [19:0] u0_lsCosTable_qint;
    wire [30:0] u0_ls12_q;
    wire [30:0] u0_ls12_qint;
    wire [28:0] u0_ls10_q;
    wire [28:0] u0_ls10_qint;
    wire [25:0] u0_ls7_q;
    wire [25:0] u0_ls7_qint;
    wire [22:0] u0_ls4_q;
    wire [22:0] u0_ls4_qint;
    wire [35:0] u0_beta_times_pi_over_4_shifted_in;
    wire [17:0] u0_beta_times_pi_over_4_shifted_b;
    wire [18:0] u0_roundedSin_bs_in;
    wire [18:0] u0_roundedSin_bs_b;
    wire [18:0] u0_roundedCos_bs_in;
    wire [18:0] u0_roundedCos_bs_b;
    wire [3:0] u0_sinJoin_q;
    wire [3:0] u0_cosJoin_q;

    import LongPRACH_sim_prach_wrap_safe_path_ver::safe_path_ver;

    // d_busIn_writedata_11(DELAY,76)@10 + 1
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

    // u0_phaseIncrMemLookup(LOOKUP,6)@10 + 1
    assign u0_phaseIncrMemLookup_c = busIn_write;
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            u0_phaseIncrMemLookup_q <= $unsigned(2'b00);
            u0_phaseIncrMemLookup_h <= $unsigned(1'b0);
            u0_phaseIncrMemLookup_e <= $unsigned(1'b0);
        end
        else
        begin
            unique case (busIn_address)
                2'b00 : begin
                            u0_phaseIncrMemLookup_q <= 2'b00;
                            u0_phaseIncrMemLookup_h <= 1'b1;
                            u0_phaseIncrMemLookup_e <= u0_phaseIncrMemLookup_c;
                        end
                2'b01 : begin
                            u0_phaseIncrMemLookup_q <= 2'b01;
                            u0_phaseIncrMemLookup_h <= 1'b1;
                            u0_phaseIncrMemLookup_e <= u0_phaseIncrMemLookup_c;
                        end
                2'b10 : begin
                            u0_phaseIncrMemLookup_q <= 2'b10;
                            u0_phaseIncrMemLookup_h <= 1'b1;
                            u0_phaseIncrMemLookup_e <= u0_phaseIncrMemLookup_c;
                        end
                2'b11 : begin
                            u0_phaseIncrMemLookup_q <= 2'b11;
                            u0_phaseIncrMemLookup_h <= 1'b1;
                            u0_phaseIncrMemLookup_e <= u0_phaseIncrMemLookup_c;
                        end
                default : begin
                              // unreachable
                              u0_phaseIncrMemLookup_q <= 2'bxx;
                              u0_phaseIncrMemLookup_h <= 1'bx;
                              u0_phaseIncrMemLookup_e <= 1'bx;
                          end
            endcase
        end
    end

    // readbackMem(DUALMEM,11)@11 + 2
    assign readbackMem_ia = d_busIn_writedata_11_q;
    assign readbackMem_aa = u0_phaseIncrMemLookup_q;
    assign readbackMem_ab = u0_phaseIncrMemLookup_q;
    assign readbackMem_ena_NotRstA = ~ (bus_areset);
    assign readbackMem_reset0 = bus_areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(32),
        .widthad_b(2),
        .numwords_b(4),
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
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_NCO1_readbackMem.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) readbackMem_dmem (
        .clocken0(readbackMem_ena_NotRstA),
        .sclr(readbackMem_reset0),
        .clock0(bus_clk),
        .address_a(readbackMem_aa),
        .data_a(readbackMem_ia),
        .wren_a(u0_phaseIncrMemLookup_e[0]),
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

    // d_busIn_read_13(DELAY,77)@10 + 3
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

    // d_u0_phaseIncrMemLookup_h_13(DELAY,78)@11 + 2
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            d_u0_phaseIncrMemLookup_h_13_delay_0 <= '0;
        end
        else
        begin
            d_u0_phaseIncrMemLookup_h_13_delay_0 <= $unsigned(u0_phaseIncrMemLookup_h);
        end
    end
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_u0_phaseIncrMemLookup_h_13_q <= d_u0_phaseIncrMemLookup_h_13_delay_0;
        end
    end

    // VCC(CONSTANT,1)@0
    assign VCC_q = $unsigned(1'b1);

    // readbackReadValid(LOGICAL,10)@13
    assign readbackReadValid_q = d_u0_phaseIncrMemLookup_h_13_q & d_busIn_read_13_q;

    // busOut(BUSOUT,12)@13
    assign busOut_readdatavalid = readbackReadValid_q;
    assign busOut_readdata = readbackMem_q;

    // d_u0_phaseIncrMem_q_25_notEnable(LOGICAL,102)@12
    assign d_u0_phaseIncrMem_q_25_notEnable_q = $unsigned(~ (VCC_q));

    // d_u0_phaseIncrMem_q_25_nor(LOGICAL,103)@12
    assign d_u0_phaseIncrMem_q_25_nor_q = ~ (d_u0_phaseIncrMem_q_25_notEnable_q | d_u0_phaseIncrMem_q_25_sticky_ena_q);

    // d_u0_phaseIncrMem_q_25_mem_last(CONSTANT,99)
    assign d_u0_phaseIncrMem_q_25_mem_last_q = $unsigned(5'b01010);

    // d_u0_phaseIncrMem_q_25_cmp(LOGICAL,100)@12
    assign d_u0_phaseIncrMem_q_25_cmp_b = {1'b0, d_u0_phaseIncrMem_q_25_rdcnt_q};
    assign d_u0_phaseIncrMem_q_25_cmp_q = $unsigned(d_u0_phaseIncrMem_q_25_mem_last_q == d_u0_phaseIncrMem_q_25_cmp_b ? 1'b1 : 1'b0);

    // d_u0_phaseIncrMem_q_25_cmpReg(REG,101)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_phaseIncrMem_q_25_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            d_u0_phaseIncrMem_q_25_cmpReg_q <= $unsigned(d_u0_phaseIncrMem_q_25_cmp_q);
        end
    end

    // d_u0_phaseIncrMem_q_25_sticky_ena(REG,104)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_phaseIncrMem_q_25_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (d_u0_phaseIncrMem_q_25_nor_q == 1'b1)
        begin
            d_u0_phaseIncrMem_q_25_sticky_ena_q <= $unsigned(d_u0_phaseIncrMem_q_25_cmpReg_q);
        end
    end

    // d_u0_phaseIncrMem_q_25_enaAnd(LOGICAL,105)@12
    assign d_u0_phaseIncrMem_q_25_enaAnd_q = d_u0_phaseIncrMem_q_25_sticky_ena_q & VCC_q;

    // d_u0_phaseIncrMem_q_25_rdcnt(COUNTER,97)@12 + 1
    // low=0, high=11, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_phaseIncrMem_q_25_rdcnt_i <= 4'd0;
            d_u0_phaseIncrMem_q_25_rdcnt_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_phaseIncrMem_q_25_rdcnt_i == 4'd10)
            begin
                d_u0_phaseIncrMem_q_25_rdcnt_eq <= 1'b1;
            end
            else
            begin
                d_u0_phaseIncrMem_q_25_rdcnt_eq <= 1'b0;
            end
            if (d_u0_phaseIncrMem_q_25_rdcnt_eq == 1'b1)
            begin
                d_u0_phaseIncrMem_q_25_rdcnt_i <= $unsigned(d_u0_phaseIncrMem_q_25_rdcnt_i) + $unsigned(4'd5);
            end
            else
            begin
                d_u0_phaseIncrMem_q_25_rdcnt_i <= $unsigned(d_u0_phaseIncrMem_q_25_rdcnt_i) + $unsigned(4'd1);
            end
        end
    end
    assign d_u0_phaseIncrMem_q_25_rdcnt_q = d_u0_phaseIncrMem_q_25_rdcnt_i[3:0];

    // u0_phaseIncrMem(DUALMEM,8)@10 + 2
    assign u0_phaseIncrMem_ia = d_busIn_writedata_11_q;
    assign u0_phaseIncrMem_aa = u0_phaseIncrMemLookup_q;
    assign u0_phaseIncrMem_ab = xIn_c[1:0];
    assign u0_phaseIncrMem_ena_NotRstA = ~ (bus_areset);
    assign u0_phaseIncrMem_reset1 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(32),
        .widthad_b(2),
        .numwords_b(4),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK1"),
        .indata_reg_b("CLOCK1"),
        .rdcontrol_reg_b("CLOCK1"),
        .byteena_reg_b("CLOCK1"),
        .outdata_reg_b("CLOCK1"),
        .outdata_sclr_b("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_NCO1_u0_phaseIncrMem.hex")),
        .init_file_layout("PORT_B"),
        .intended_device_family("Agilex 7")
    ) u0_phaseIncrMem_dmem (
        .clocken1(1'b1),
        .clocken0(u0_phaseIncrMem_ena_NotRstA),
        .clock0(bus_clk),
        .sclr(u0_phaseIncrMem_reset1),
        .clock1(clk),
        .address_a(u0_phaseIncrMem_aa),
        .data_a(u0_phaseIncrMem_ia),
        .wren_a(u0_phaseIncrMemLookup_e[0]),
        .address_b(u0_phaseIncrMem_ab),
        .q_b(u0_phaseIncrMem_iq),
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
    assign u0_phaseIncrMem_q = u0_phaseIncrMem_iq[31:0];

    // d_u0_phaseIncrMem_q_25_wraddr(REG,98)@12 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_phaseIncrMem_q_25_wraddr_q <= $unsigned(4'b1011);
        end
        else
        begin
            d_u0_phaseIncrMem_q_25_wraddr_q <= $unsigned(d_u0_phaseIncrMem_q_25_rdcnt_q);
        end
    end

    // d_u0_phaseIncrMem_q_25_mem(DUALMEM,96)@12 + 2
    assign d_u0_phaseIncrMem_q_25_mem_ia = u0_phaseIncrMem_q;
    assign d_u0_phaseIncrMem_q_25_mem_aa = d_u0_phaseIncrMem_q_25_wraddr_q;
    assign d_u0_phaseIncrMem_q_25_mem_ab = d_u0_phaseIncrMem_q_25_rdcnt_q;
    assign d_u0_phaseIncrMem_q_25_mem_ena_OrRstB = areset | d_u0_phaseIncrMem_q_25_enaAnd_q[0];
    assign d_u0_phaseIncrMem_q_25_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(4),
        .numwords_a(12),
        .width_b(32),
        .widthad_b(4),
        .numwords_b(12),
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
    ) d_u0_phaseIncrMem_q_25_mem_dmem (
        .clocken1(d_u0_phaseIncrMem_q_25_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(clk),
        .sclr(d_u0_phaseIncrMem_q_25_mem_reset0),
        .clock1(clk),
        .address_a(d_u0_phaseIncrMem_q_25_mem_aa),
        .data_a(d_u0_phaseIncrMem_q_25_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(d_u0_phaseIncrMem_q_25_mem_ab),
        .q_b(d_u0_phaseIncrMem_q_25_mem_iq),
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
    assign d_u0_phaseIncrMem_q_25_mem_q = d_u0_phaseIncrMem_q_25_mem_iq[31:0];

    // u0_invertSin_bit_select_merged(BITSELECT,69)@25
    assign u0_invertSin_bit_select_merged_b = d_u0_phaseIncrMem_q_25_mem_q[31:31];
    assign u0_invertSin_bit_select_merged_c = d_u0_phaseIncrMem_q_25_mem_q[30:30];

    // d_xIn_p_0_12(DELAY,74)@10 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_p_0_12_delay_0 <= '0;
        end
        else
        begin
            d_xIn_p_0_12_delay_0 <= xIn_p_0;
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_xIn_p_0_12_q <= d_xIn_p_0_12_delay_0;
        end
    end

    // d_xIn_s_0_12(DELAY,75)@10 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_s_0_12_delay_0 <= '0;
        end
        else
        begin
            d_xIn_s_0_12_delay_0 <= $unsigned(xIn_s_0);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_xIn_s_0_12_q <= d_xIn_s_0_12_delay_0;
        end
    end

    // d_xIn_v_12(DELAY,71)@10 + 2
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_xIn_v_12_delay_0 <= '0;
        end
        else
        begin
            d_xIn_v_12_delay_0 <= $unsigned(xIn_v);
        end
    end
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            d_xIn_v_12_q <= d_xIn_v_12_delay_0;
        end
    end

    // u0_accumLast_b4(DELAY,14)@12
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_accumLast_b4_delay_0 <= '0;
            u0_accumLast_b4_delay_1 <= '0;
            u0_accumLast_b4_q <= '0;
        end
        else if (d_xIn_v_12_q == 1'b1)
        begin
            u0_accumLast_b4_delay_0 <= u0_accumAdd_b4_q;
            u0_accumLast_b4_delay_1 <= u0_accumLast_b4_delay_0;
            u0_accumLast_b4_q <= u0_accumLast_b4_delay_1;
        end
    end

    // u0_accumAdd_b4(ADD,13)@12 + 1
    assign u0_accumAdd_b4_a = u0_accumLast_b4_q;
    assign u0_accumAdd_b4_b = u0_phaseIncrMem_q[29:0];
    assign u0_accumAdd_b4_i = d_xIn_p_0_12_q;
    assign u0_accumAdd_b4_a1 = d_xIn_s_0_12_q == 1'b1 ? u0_accumAdd_b4_i : u0_accumAdd_b4_a;
    assign u0_accumAdd_b4_b1 = d_xIn_s_0_12_q == 1'b1 ? 30'b0 : u0_accumAdd_b4_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_accumAdd_b4_o <= 30'b0;
        end
        else if (d_xIn_v_12_q == 1'b1)
        begin
            u0_accumAdd_b4_o <= $unsigned(u0_accumAdd_b4_a1) + $unsigned(u0_accumAdd_b4_b1);
        end
    end
    assign u0_accumAdd_b4_q = u0_accumAdd_b4_o[29:0];

    // u0_octantBitSelect(BITSELECT,15)@13
    assign u0_octantBitSelect_b = u0_accumAdd_b4_q[29:27];

    // d_u0_octantBitSelect_b_24(DELAY,81)@13 + 11
    dspba_delay_ver #( .width(3), .depth(11), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u0_octantBitSelect_b_24 ( .xin(u0_octantBitSelect_b), .xout(d_u0_octantBitSelect_b_24_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // d_u0_octantBitSelect_b_25(DELAY,82)@24 + 1
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

    // u0_cosJoin(BITJOIN,50)@25
    assign u0_cosJoin_q = {u0_invertSin_bit_select_merged_c, d_u0_octantBitSelect_b_25_q};

    // u0_doCosInvert(LOOKUP,51)@25 + 1
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

    // u0_roundedSin_bias(CONSTANT,59)@0
    assign u0_roundedSin_bias_q = $unsigned(2'b01);

    // u0_sin_pi_over_4(CONSTANT,39)@0
    assign u0_sin_pi_over_4_q = $unsigned(20'b01011010100000100110);

    // u0_addnsubConst(LOOKUP,17)@13 + 1
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

    // d_u0_accumAdd_b4_q_14(DELAY,80)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_accumAdd_b4_q_14_q <= '0;
        end
        else
        begin
            d_u0_accumAdd_b4_q_14_q <= u0_accumAdd_b4_q;
        end
    end

    // u0_rangeLUT(LOOKUP,16)@13 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_rangeLUT_q <= $unsigned(31'b0000000000000000000000000000000);
        end
        else
        begin
            unique case (u0_octantBitSelect_b)
                3'b000 : u0_rangeLUT_q <= 31'b0000000000000000000000000000000;
                3'b001 : u0_rangeLUT_q <= 31'b0010000000000000000000000000000;
                3'b010 : u0_rangeLUT_q <= 31'b1110000000000000000000000000000;
                3'b011 : u0_rangeLUT_q <= 31'b0100000000000000000000000000000;
                3'b100 : u0_rangeLUT_q <= 31'b1100000000000000000000000000000;
                3'b101 : u0_rangeLUT_q <= 31'b0110000000000000000000000000000;
                3'b110 : u0_rangeLUT_q <= 31'b1010000000000000000000000000000;
                3'b111 : u0_rangeLUT_q <= 31'b1100000000000000000000000000000;
                default : begin
                              // unreachable
                              u0_rangeLUT_q <= 31'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
                          end
            endcase
        end
    end

    // u0_rangeAddSub(ADDSUB,18)@14 + 1
    assign u0_rangeAddSub_s = u0_addnsubConst_q;
    assign u0_rangeAddSub_a = $unsigned({2'b00, u0_rangeLUT_q});
    assign u0_rangeAddSub_b = $unsigned({3'b000, d_u0_accumAdd_b4_q_14_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_rangeAddSub_o <= 33'b0;
        end
        else
        begin
            if (u0_rangeAddSub_s == 1'b1)
            begin
                u0_rangeAddSub_o <= $unsigned($signed(u0_rangeAddSub_a) + $signed(u0_rangeAddSub_b));
            end
            else
            begin
                u0_rangeAddSub_o <= $unsigned($signed(u0_rangeAddSub_a) - $signed(u0_rangeAddSub_b));
            end
        end
    end
    assign u0_rangeAddSub_q = u0_rangeAddSub_o[31:0];

    // u0_alphaBitSelect_bit_select_merged(BITSELECT,70)@15
    assign u0_alphaBitSelect_bit_select_merged_in = u0_rangeAddSub_q[27:0];
    assign u0_alphaBitSelect_bit_select_merged_b = u0_alphaBitSelect_bit_select_merged_in[26:19];
    assign u0_alphaBitSelect_bit_select_merged_c = u0_alphaBitSelect_bit_select_merged_in[27:27];
    assign u0_alphaBitSelect_bit_select_merged_d = u0_alphaBitSelect_bit_select_merged_in[18:0];

    // d_u0_alphaBitSelect_bit_select_merged_c_23(DELAY,85)@15 + 8
    dspba_delay_ver #( .width(1), .depth(8), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_u0_alphaBitSelect_bit_select_merged_c_23 ( .xin(u0_alphaBitSelect_bit_select_merged_c), .xout(d_u0_alphaBitSelect_bit_select_merged_c_23_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u0_ls4(BITSHIFT,28)@15
    assign u0_ls4_qint = { u0_alphaBitSelect_bit_select_merged_d, 4'b0000 };
    assign u0_ls4_q = u0_ls4_qint[22:0];

    // u0_ls7(BITSHIFT,27)@15
    assign u0_ls7_qint = { u0_alphaBitSelect_bit_select_merged_d, 7'b0000000 };
    assign u0_ls7_q = u0_ls7_qint[25:0];

    // u0_cm2(ADD,29)@15 + 1
    assign u0_cm2_a = {1'b0, u0_ls7_q};
    assign u0_cm2_b = {4'b0000, u0_ls4_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cm2_o <= 27'b0;
        end
        else
        begin
            u0_cm2_o <= $unsigned(u0_cm2_a) + $unsigned(u0_cm2_b);
        end
    end
    assign u0_cm2_q = u0_cm2_o[26:0];

    // u0_ls10(BITSHIFT,25)@15
    assign u0_ls10_qint = { u0_alphaBitSelect_bit_select_merged_d, 10'b0000000000 };
    assign u0_ls10_q = u0_ls10_qint[28:0];

    // u0_ls12(BITSHIFT,24)@15
    assign u0_ls12_qint = { u0_alphaBitSelect_bit_select_merged_d, 12'b000000000000 };
    assign u0_ls12_q = u0_ls12_qint[30:0];

    // u0_cm1(SUB,26)@15 + 1
    assign u0_cm1_a = $unsigned({1'b0, u0_ls12_q});
    assign u0_cm1_b = $unsigned({3'b000, u0_ls10_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cm1_o <= 32'b0;
        end
        else
        begin
            u0_cm1_o <= $unsigned($signed(u0_cm1_a) - $signed(u0_cm1_b));
        end
    end
    assign u0_cm1_q = u0_cm1_o[31:0];

    // u0_cm3(ADD,30)@16 + 1
    assign u0_cm3_a = {1'b0, u0_cm1_q};
    assign u0_cm3_b = {6'b000000, u0_cm2_q};
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cm3_o <= 33'b0;
        end
        else
        begin
            u0_cm3_o <= $unsigned(u0_cm3_a) + $unsigned(u0_cm3_b);
        end
    end
    assign u0_cm3_q = u0_cm3_o[32:0];

    // u0_beta_times_4_shift(BITSHIFT,31)@17
    assign u0_beta_times_4_shift_qint = { u0_cm3_q, 5'b00000 };
    assign u0_beta_times_4_shift_q = u0_beta_times_4_shift_qint[37:0];

    // u0_beta_times_pi_over_4_shifted(BITSELECT,32)@17
    assign u0_beta_times_pi_over_4_shifted_in = u0_beta_times_4_shift_q[35:0];
    assign u0_beta_times_pi_over_4_shifted_b = u0_beta_times_pi_over_4_shifted_in[35:18];

    // u0_cosTable(DUALMEM,23)@15 + 2
    assign u0_cosTable_aa = u0_alphaBitSelect_bit_select_merged_b;
    assign u0_cosTable_ena_NotRstA = ~ (areset);
    assign u0_cosTable_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(18),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_NCO1_u0_cosTable.hex")),
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
    assign u0_cosTable_r = u0_cosTable_ir[17:0];

    // u0_cosMult_cma(CHAINMULTADD,58)@18 + 5
    assign u0_cosMult_cma_reset = areset;
    assign u0_cosMult_cma_ena0 = 1'b1;
    assign u0_cosMult_cma_ena1 = u0_cosMult_cma_ena0;
    assign u0_cosMult_cma_ena2 = u0_cosMult_cma_ena0;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cosMult_cma_ah[0] <= '0;
            u0_cosMult_cma_ch[0] <= '0;
        end
        else
        begin
            u0_cosMult_cma_ah[0] <= u0_cosTable_r;
            u0_cosMult_cma_ch[0] <= u0_beta_times_pi_over_4_shifted_b;
        end
    end

    assign u0_cosMult_cma_a0 = u0_cosMult_cma_ah[0];
    assign u0_cosMult_cma_c0 = u0_cosMult_cma_ch[0];
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(18),
        .ax_clken("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(36)
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
    dspba_delay_ver #( .width(36), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_cosMult_cma_delay0 ( .xin(u0_cosMult_cma_s0), .xout(u0_cosMult_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_cosMult_cma_q = $unsigned(u0_cosMult_cma_qq0[35:0]);

    // u0_shiftSinB(BITSHIFT,37)@23
    assign u0_shiftSinB_qint = u0_cosMult_cma_q;
    assign u0_shiftSinB_q = {8'b00000000, u0_shiftSinB_qint[35:24]};

    // d_u0_sinTable_r_23_notEnable(LOGICAL,112)@17
    assign d_u0_sinTable_r_23_notEnable_q = $unsigned(~ (VCC_q));

    // d_u0_sinTable_r_23_nor(LOGICAL,113)@17
    assign d_u0_sinTable_r_23_nor_q = ~ (d_u0_sinTable_r_23_notEnable_q | d_u0_sinTable_r_23_sticky_ena_q);

    // d_u0_sinTable_r_23_mem_last(CONSTANT,109)
    assign d_u0_sinTable_r_23_mem_last_q = $unsigned(3'b011);

    // d_u0_sinTable_r_23_cmp(LOGICAL,110)@17
    assign d_u0_sinTable_r_23_cmp_q = $unsigned(d_u0_sinTable_r_23_mem_last_q == d_u0_sinTable_r_23_rdcnt_q ? 1'b1 : 1'b0);

    // d_u0_sinTable_r_23_cmpReg(REG,111)@17 + 1
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

    // d_u0_sinTable_r_23_sticky_ena(REG,114)@17 + 1
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

    // d_u0_sinTable_r_23_enaAnd(LOGICAL,115)@17
    assign d_u0_sinTable_r_23_enaAnd_q = d_u0_sinTable_r_23_sticky_ena_q & VCC_q;

    // d_u0_sinTable_r_23_rdcnt(COUNTER,107)@17 + 1
    // low=0, high=4, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_sinTable_r_23_rdcnt_i <= 3'd0;
            d_u0_sinTable_r_23_rdcnt_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_sinTable_r_23_rdcnt_i == 3'd3)
            begin
                d_u0_sinTable_r_23_rdcnt_eq <= 1'b1;
            end
            else
            begin
                d_u0_sinTable_r_23_rdcnt_eq <= 1'b0;
            end
            if (d_u0_sinTable_r_23_rdcnt_eq == 1'b1)
            begin
                d_u0_sinTable_r_23_rdcnt_i <= $unsigned(d_u0_sinTable_r_23_rdcnt_i) + $unsigned(3'd4);
            end
            else
            begin
                d_u0_sinTable_r_23_rdcnt_i <= $unsigned(d_u0_sinTable_r_23_rdcnt_i) + $unsigned(3'd1);
            end
        end
    end
    assign d_u0_sinTable_r_23_rdcnt_q = d_u0_sinTable_r_23_rdcnt_i[2:0];

    // u0_sinTable(DUALMEM,22)@15 + 2
    assign u0_sinTable_aa = u0_alphaBitSelect_bit_select_merged_b;
    assign u0_sinTable_ena_NotRstA = ~ (areset);
    assign u0_sinTable_reset0 = areset;
    altera_syncram #(
        .ram_block_type("M20K"),
        .operation_mode("ROM"),
        .width_a(18),
        .widthad_a(8),
        .numwords_a(256),
        .lpm_type("altera_syncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_sclr_a("SCLEAR"),
        .clock_enable_input_a("NORMAL"),
        .power_up_uninitialized("FALSE"),
        .init_file(safe_path_ver("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER_NCO1_u0_sinTable.hex")),
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
    assign u0_sinTable_r = u0_sinTable_ir[17:0];

    // d_u0_sinTable_r_23_wraddr(REG,108)@17 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_sinTable_r_23_wraddr_q <= $unsigned(3'b100);
        end
        else
        begin
            d_u0_sinTable_r_23_wraddr_q <= $unsigned(d_u0_sinTable_r_23_rdcnt_q);
        end
    end

    // d_u0_sinTable_r_23_mem(DUALMEM,106)@17 + 2
    assign d_u0_sinTable_r_23_mem_ia = u0_sinTable_r;
    assign d_u0_sinTable_r_23_mem_aa = d_u0_sinTable_r_23_wraddr_q;
    assign d_u0_sinTable_r_23_mem_ab = d_u0_sinTable_r_23_rdcnt_q;
    assign d_u0_sinTable_r_23_mem_ena_OrRstB = areset | d_u0_sinTable_r_23_enaAnd_q[0];
    assign d_u0_sinTable_r_23_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(18),
        .widthad_a(3),
        .numwords_a(5),
        .width_b(18),
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
    assign d_u0_sinTable_r_23_mem_q = d_u0_sinTable_r_23_mem_iq[17:0];

    // u0_lsSinTable(BITSHIFT,35)@23
    assign u0_lsSinTable_qint = { d_u0_sinTable_r_23_mem_q, 2'b00 };
    assign u0_lsSinTable_q = u0_lsSinTable_qint[19:0];

    // u0_sinAdd(ADD,41)@23 + 1
    assign u0_sinAdd_a = u0_lsSinTable_q;
    assign u0_sinAdd_b = u0_shiftSinB_q;
    assign u0_sinAdd_i = u0_sin_pi_over_4_q;
    assign u0_sinAdd_a1 = d_u0_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? u0_sinAdd_i : u0_sinAdd_a;
    assign u0_sinAdd_b1 = d_u0_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? 20'b0 : u0_sinAdd_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_sinAdd_o <= 20'b0;
        end
        else
        begin
            u0_sinAdd_o <= $unsigned(u0_sinAdd_a1) + $unsigned(u0_sinAdd_b1);
        end
    end
    assign u0_sinAdd_q = u0_sinAdd_o[19:0];

    // u0_roundedSin_trunc(BITSHIFT,60)@24
    assign u0_roundedSin_trunc_qint = u0_sinAdd_q;
    assign u0_roundedSin_trunc_q = u0_roundedSin_trunc_qint[19:1];

    // u0_roundedSin_add(ADD,61)@24 + 1
    assign u0_roundedSin_add_a = $unsigned({3'b000, u0_roundedSin_trunc_q});
    assign u0_roundedSin_add_b = $unsigned({{20{u0_roundedSin_bias_q[1]}}, u0_roundedSin_bias_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_roundedSin_add_o <= 22'b0;
        end
        else
        begin
            u0_roundedSin_add_o <= $unsigned($signed(u0_roundedSin_add_a) + $signed(u0_roundedSin_add_b));
        end
    end
    assign u0_roundedSin_add_q = u0_roundedSin_add_o[20:0];

    // u0_roundedSin_shift(BITSHIFT,62)@25
    assign u0_roundedSin_shift_qint = u0_roundedSin_add_q;
    assign u0_roundedSin_shift_q = u0_roundedSin_shift_qint[20:1];

    // u0_roundedSin_bs(BITSELECT,63)@25
    assign u0_roundedSin_bs_in = u0_roundedSin_shift_q[18:0];
    assign u0_roundedSin_bs_b = u0_roundedSin_bs_in[18:0];

    // u0_sinMult_cma(CHAINMULTADD,57)@18 + 5
    assign u0_sinMult_cma_reset = areset;
    assign u0_sinMult_cma_ena0 = 1'b1;
    assign u0_sinMult_cma_ena1 = u0_sinMult_cma_ena0;
    assign u0_sinMult_cma_ena2 = u0_sinMult_cma_ena0;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_sinMult_cma_ah[0] <= '0;
            u0_sinMult_cma_ch[0] <= '0;
        end
        else
        begin
            u0_sinMult_cma_ah[0] <= u0_sinTable_r;
            u0_sinMult_cma_ch[0] <= u0_beta_times_pi_over_4_shifted_b;
        end
    end

    assign u0_sinMult_cma_a0 = u0_sinMult_cma_ah[0];
    assign u0_sinMult_cma_c0 = u0_sinMult_cma_ch[0];
    tennm_mac #(
        .operation_mode("m18x18_full"),
        .clear_type("sclr"),
        .ay_scan_in_clken("0"),
        .ay_scan_in_width(18),
        .ax_clken("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clken("2"),
        .second_pipeline_clken("2"),
        .output_clken("1"),
        .result_a_width(36)
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
    dspba_delay_ver #( .width(36), .depth(1), .reset_kind("SYNC"), .phase(0), .modulus(1) )
    u0_sinMult_cma_delay0 ( .xin(u0_sinMult_cma_s0), .xout(u0_sinMult_cma_qq0), .clk(clk), .aclr(areset), .ena(1'b1) );
    assign u0_sinMult_cma_q = $unsigned(u0_sinMult_cma_qq0[35:0]);

    // u0_shiftCosB(BITSHIFT,38)@23
    assign u0_shiftCosB_qint = u0_sinMult_cma_q;
    assign u0_shiftCosB_q = {8'b00000000, u0_shiftCosB_qint[35:24]};

    // d_u0_cosTable_r_23_notEnable(LOGICAL,122)@17
    assign d_u0_cosTable_r_23_notEnable_q = $unsigned(~ (VCC_q));

    // d_u0_cosTable_r_23_nor(LOGICAL,123)@17
    assign d_u0_cosTable_r_23_nor_q = ~ (d_u0_cosTable_r_23_notEnable_q | d_u0_cosTable_r_23_sticky_ena_q);

    // d_u0_cosTable_r_23_mem_last(CONSTANT,119)
    assign d_u0_cosTable_r_23_mem_last_q = $unsigned(3'b011);

    // d_u0_cosTable_r_23_cmp(LOGICAL,120)@17
    assign d_u0_cosTable_r_23_cmp_q = $unsigned(d_u0_cosTable_r_23_mem_last_q == d_u0_cosTable_r_23_rdcnt_q ? 1'b1 : 1'b0);

    // d_u0_cosTable_r_23_cmpReg(REG,121)@17 + 1
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

    // d_u0_cosTable_r_23_sticky_ena(REG,124)@17 + 1
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

    // d_u0_cosTable_r_23_enaAnd(LOGICAL,125)@17
    assign d_u0_cosTable_r_23_enaAnd_q = d_u0_cosTable_r_23_sticky_ena_q & VCC_q;

    // d_u0_cosTable_r_23_rdcnt(COUNTER,117)@17 + 1
    // low=0, high=4, step=1, init=0
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_cosTable_r_23_rdcnt_i <= 3'd0;
            d_u0_cosTable_r_23_rdcnt_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_cosTable_r_23_rdcnt_i == 3'd3)
            begin
                d_u0_cosTable_r_23_rdcnt_eq <= 1'b1;
            end
            else
            begin
                d_u0_cosTable_r_23_rdcnt_eq <= 1'b0;
            end
            if (d_u0_cosTable_r_23_rdcnt_eq == 1'b1)
            begin
                d_u0_cosTable_r_23_rdcnt_i <= $unsigned(d_u0_cosTable_r_23_rdcnt_i) + $unsigned(3'd4);
            end
            else
            begin
                d_u0_cosTable_r_23_rdcnt_i <= $unsigned(d_u0_cosTable_r_23_rdcnt_i) + $unsigned(3'd1);
            end
        end
    end
    assign d_u0_cosTable_r_23_rdcnt_q = d_u0_cosTable_r_23_rdcnt_i[2:0];

    // d_u0_cosTable_r_23_wraddr(REG,118)@17 + 1
    always @ (posedge clk)
    begin
        if (areset)
        begin
            d_u0_cosTable_r_23_wraddr_q <= $unsigned(3'b100);
        end
        else
        begin
            d_u0_cosTable_r_23_wraddr_q <= $unsigned(d_u0_cosTable_r_23_rdcnt_q);
        end
    end

    // d_u0_cosTable_r_23_mem(DUALMEM,116)@17 + 2
    assign d_u0_cosTable_r_23_mem_ia = u0_cosTable_r;
    assign d_u0_cosTable_r_23_mem_aa = d_u0_cosTable_r_23_wraddr_q;
    assign d_u0_cosTable_r_23_mem_ab = d_u0_cosTable_r_23_rdcnt_q;
    assign d_u0_cosTable_r_23_mem_ena_OrRstB = areset | d_u0_cosTable_r_23_enaAnd_q[0];
    assign d_u0_cosTable_r_23_mem_reset0 = areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(18),
        .widthad_a(3),
        .numwords_a(5),
        .width_b(18),
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
    assign d_u0_cosTable_r_23_mem_q = d_u0_cosTable_r_23_mem_iq[17:0];

    // u0_lsCosTable(BITSHIFT,36)@23
    assign u0_lsCosTable_qint = { d_u0_cosTable_r_23_mem_q, 2'b00 };
    assign u0_lsCosTable_q = u0_lsCosTable_qint[19:0];

    // u0_cosSub(SUB,42)@23 + 1
    assign u0_cosSub_a = $unsigned(u0_lsCosTable_q);
    assign u0_cosSub_b = $unsigned(u0_shiftCosB_q);
    assign u0_cosSub_i = $unsigned(u0_sin_pi_over_4_q);
    assign u0_cosSub_a1 = d_u0_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? u0_cosSub_i : u0_cosSub_a;
    assign u0_cosSub_b1 = d_u0_alphaBitSelect_bit_select_merged_c_23_q == 1'b1 ? 20'b0 : u0_cosSub_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cosSub_o <= 20'b0;
        end
        else
        begin
            u0_cosSub_o <= $unsigned($signed(u0_cosSub_a1) - $signed(u0_cosSub_b1));
        end
    end
    assign u0_cosSub_q = u0_cosSub_o[19:0];

    // u0_roundedCos_trunc(BITSHIFT,65)@24
    assign u0_roundedCos_trunc_qint = u0_cosSub_q;
    assign u0_roundedCos_trunc_q = u0_roundedCos_trunc_qint[19:1];

    // u0_roundedCos_add(ADD,66)@24 + 1
    assign u0_roundedCos_add_a = $unsigned({3'b000, u0_roundedCos_trunc_q});
    assign u0_roundedCos_add_b = $unsigned({{20{u0_roundedSin_bias_q[1]}}, u0_roundedSin_bias_q});
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_roundedCos_add_o <= 22'b0;
        end
        else
        begin
            u0_roundedCos_add_o <= $unsigned($signed(u0_roundedCos_add_a) + $signed(u0_roundedCos_add_b));
        end
    end
    assign u0_roundedCos_add_q = u0_roundedCos_add_o[20:0];

    // u0_roundedCos_shift(BITSHIFT,67)@25
    assign u0_roundedCos_shift_qint = u0_roundedCos_add_q;
    assign u0_roundedCos_shift_q = u0_roundedCos_shift_qint[20:1];

    // u0_roundedCos_bs(BITSELECT,68)@25
    assign u0_roundedCos_bs_in = u0_roundedCos_shift_q[18:0];
    assign u0_roundedCos_bs_b = u0_roundedCos_bs_in[18:0];

    // u0_doSwap(LOOKUP,45)@24 + 1
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

    // u0_cosSwapMux(MUX,53)@25 + 1
    assign u0_cosSwapMux_s = u0_doSwap_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cosSwapMux_q <= 19'b0;
        end
        else
        begin
            unique case (u0_cosSwapMux_s)
                1'b0 : u0_cosSwapMux_q <= u0_roundedCos_bs_b;
                1'b1 : u0_cosSwapMux_q <= u0_roundedSin_bs_b;
                default : u0_cosSwapMux_q <= 19'b0;
            endcase
        end
    end

    // GND(CONSTANT,0)@0
    assign GND_q = $unsigned(1'b0);

    // u0_cosInvert(SUB,55)@26 + 1
    assign u0_cosInvert_a = $unsigned({{17{GND_q[0]}}, GND_q});
    assign u0_cosInvert_b = $unsigned(u0_cosSwapMux_q[17:0]);
    assign u0_cosInvert_i = u0_cosInvert_b;
    assign u0_cosInvert_a1 = u0_doCosInvert_q == 1'b1 ? u0_cosInvert_i : u0_cosInvert_a;
    assign u0_cosInvert_b1 = u0_doCosInvert_q == 1'b1 ? 18'b0 : u0_cosInvert_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_cosInvert_o <= 18'b0;
        end
        else
        begin
            u0_cosInvert_o <= $unsigned($signed(u0_cosInvert_a1) - $signed(u0_cosInvert_b1));
        end
    end
    assign u0_cosInvert_q = u0_cosInvert_o[17:0];

    // u0_sinJoin(BITJOIN,47)@25
    assign u0_sinJoin_q = {u0_invertSin_bit_select_merged_b, d_u0_octantBitSelect_b_25_q};

    // u0_doSinInvert(LOOKUP,48)@25 + 1
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

    // u0_sinSwapMux(MUX,52)@25 + 1
    assign u0_sinSwapMux_s = u0_doSwap_q;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_sinSwapMux_q <= 19'b0;
        end
        else
        begin
            unique case (u0_sinSwapMux_s)
                1'b0 : u0_sinSwapMux_q <= u0_roundedSin_bs_b;
                1'b1 : u0_sinSwapMux_q <= u0_roundedCos_bs_b;
                default : u0_sinSwapMux_q <= 19'b0;
            endcase
        end
    end

    // u0_sinInvert(SUB,54)@26 + 1
    assign u0_sinInvert_a = $unsigned({{17{GND_q[0]}}, GND_q});
    assign u0_sinInvert_b = $unsigned(u0_sinSwapMux_q[17:0]);
    assign u0_sinInvert_i = u0_sinInvert_b;
    assign u0_sinInvert_a1 = u0_doSinInvert_q == 1'b1 ? u0_sinInvert_i : u0_sinInvert_a;
    assign u0_sinInvert_b1 = u0_doSinInvert_q == 1'b1 ? 18'b0 : u0_sinInvert_b;
    always @ (posedge clk)
    begin
        if (areset)
        begin
            u0_sinInvert_o <= 18'b0;
        end
        else
        begin
            u0_sinInvert_o <= $unsigned($signed(u0_sinInvert_a1) - $signed(u0_sinInvert_b1));
        end
    end
    assign u0_sinInvert_q = u0_sinInvert_o[17:0];

    // d_xIn_c_27_notEnable(LOGICAL,92)@10
    assign d_xIn_c_27_notEnable_q = $unsigned(~ (VCC_q));

    // d_xIn_c_27_nor(LOGICAL,93)@10
    assign d_xIn_c_27_nor_q = ~ (d_xIn_c_27_notEnable_q | d_xIn_c_27_sticky_ena_q);

    // d_xIn_c_27_mem_last(CONSTANT,89)
    assign d_xIn_c_27_mem_last_q = $unsigned(5'b01110);

    // d_xIn_c_27_cmp(LOGICAL,90)@10
    assign d_xIn_c_27_cmp_b = {1'b0, d_xIn_c_27_rdcnt_q};
    assign d_xIn_c_27_cmp_q = $unsigned(d_xIn_c_27_mem_last_q == d_xIn_c_27_cmp_b ? 1'b1 : 1'b0);

    // d_xIn_c_27_cmpReg(REG,91)@10 + 1
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

    // d_xIn_c_27_sticky_ena(REG,94)@10 + 1
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

    // d_xIn_c_27_enaAnd(LOGICAL,95)@10
    assign d_xIn_c_27_enaAnd_q = d_xIn_c_27_sticky_ena_q & VCC_q;

    // d_xIn_c_27_rdcnt(COUNTER,87)@10 + 1
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

    // d_xIn_c_27_wraddr(REG,88)@10 + 1
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

    // d_xIn_c_27_mem(DUALMEM,86)@10 + 2
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

    // d_xIn_v_27(DELAY,72)@12 + 15
    dspba_delay_ver #( .width(1), .depth(15), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    d_xIn_v_27 ( .xin(d_xIn_v_12_q), .xout(d_xIn_v_27_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // ncoOut(PORTOUT,56)@27 + 1
    assign ncoOut_v = d_xIn_v_27_q;
    assign ncoOut_c = d_xIn_c_27_mem_q;
    assign sinOut_0 = u0_sinInvert_q;
    assign cosOut_0 = u0_cosInvert_q;

endmodule
