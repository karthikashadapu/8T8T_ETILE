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

// SystemVerilog created from ddc_model_DUT
// SystemVerilog created on Thu Jan  9 15:36:33 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module ddc_model_DUT (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [0:0] DDC_Valid_In_s,
    input wire [7:0] DDC_Chan_In_s,
    input wire [31:0] DDC_Ant_Data_In_0im,
    input wire [31:0] DDC_Ant_Data_In_0re,
    input wire [31:0] DDC_Ant_Data_In_1im,
    input wire [31:0] DDC_Ant_Data_In_1re,
    input wire [31:0] DDC_Ant_Data_In_2im,
    input wire [31:0] DDC_Ant_Data_In_2re,
    input wire [31:0] DDC_Ant_Data_In_3im,
    input wire [31:0] DDC_Ant_Data_In_3re,
    input wire [0:0] DDC_NCO_sync_0,
    input wire [0:0] DDC_NCO_sync_1,
    input wire [0:0] DDC_NCO_sync_2,
    input wire [0:0] DDC_NCO_sync_3,
    input wire [7:0] BW_Config_CC1_s,
    input wire [31:0] DDC_Const_Data_In_0im,
    input wire [31:0] DDC_Const_Data_In_0re,
    input wire [31:0] DDC_Const_Data_In_1im,
    input wire [31:0] DDC_Const_Data_In_1re,
    input wire [31:0] DDC_Const_Data_In_2im,
    input wire [31:0] DDC_Const_Data_In_2re,
    input wire [31:0] DDC_Const_Data_In_3im,
    input wire [31:0] DDC_Const_Data_In_3re,
    input wire [0:0] DDC_Const_Data_sel_s,
    output wire [15:0] ddc_l1_dout_im,
    output wire [15:0] ddc_l1_dout_re,
    output wire [0:0] ddc_l1_vout_s,
    output wire [7:0] ddc_l1_cout_s,
    output wire [15:0] mixer_l1_dout_0im,
    output wire [15:0] mixer_l1_dout_0re,
    output wire [15:0] mixer_l1_dout_1im,
    output wire [15:0] mixer_l1_dout_1re,
    output wire [15:0] mixer_l1_dout_2im,
    output wire [15:0] mixer_l1_dout_2re,
    output wire [15:0] mixer_l1_dout_3im,
    output wire [15:0] mixer_l1_dout_3re,
    output wire [0:0] mixer_l1_vout_s,
    output wire [7:0] mixer_l1_cout_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [31:0] busFabric_busOut_readdata;
    wire [0:0] busFabric_busOut_readdatavalid;
    reg [31:0] bus_selector_q;
    reg [0:0] bus_selector_v;
    wire [31:0] DUT_vunroll_cunroll_x_busOut_readdata;
    wire [0:0] DUT_vunroll_cunroll_x_busOut_readdatavalid;
    wire [15:0] DUT_vunroll_cunroll_x_out_1_imag_q1_tpl;
    wire [15:0] DUT_vunroll_cunroll_x_out_1_real_q1_tpl;
    wire [0:0] DUT_vunroll_cunroll_x_out_2_q_v1_tpl;
    wire [7:0] DUT_vunroll_cunroll_x_out_3_q_c1_tpl;
    wire [15:0] DUT_vunroll_cunroll_x_out_4_0_imag_mixer_l1_dout_tpl;
    wire [15:0] DUT_vunroll_cunroll_x_out_4_0_real_mixer_l1_dout_tpl;
    wire [15:0] DUT_vunroll_cunroll_x_out_4_1_imag_mixer_l1_dout_tpl;
    wire [15:0] DUT_vunroll_cunroll_x_out_4_1_real_mixer_l1_dout_tpl;
    wire [15:0] DUT_vunroll_cunroll_x_out_4_2_imag_mixer_l1_dout_tpl;
    wire [15:0] DUT_vunroll_cunroll_x_out_4_2_real_mixer_l1_dout_tpl;
    wire [15:0] DUT_vunroll_cunroll_x_out_4_3_imag_mixer_l1_dout_tpl;
    wire [15:0] DUT_vunroll_cunroll_x_out_4_3_real_mixer_l1_dout_tpl;
    wire [0:0] DUT_vunroll_cunroll_x_out_5_mixer_l1_vout_tpl;
    wire [7:0] DUT_vunroll_cunroll_x_out_6_mixer_l1_cout_tpl;
    reg [0:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_q;
    reg [0:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_0;
    reg [0:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_1;
    reg [0:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_2;
    reg [0:0] ddc_model_DUT_readDelayed_q;
    wire [0:0] ddc_model_DUT_readDataValid_q;
    wire busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_reset0;
    wire busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ena_OrRstB;
    wire [31:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ia;
    wire [1:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_aa;
    wire [1:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ab;
    wire [31:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_iq;
    wire [31:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_q;
    wire [1:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i;
    (* preserve_syn_only *) reg busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_eq;
    reg [1:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_wraddr_q;
    wire [1:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_last_q;
    wire [0:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmp_q;
    (* preserve_syn_only *) reg [0:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmpReg_q;
    wire [0:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_notEnable_q;
    wire [0:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_nor_q;
    (* preserve_syn_only *) reg [0:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_sticky_ena_q;
    wire [0:0] busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_enaAnd_q;
    reg [1:0] reset_fanout_mitigation_signal_out;

    import ddc_model_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_notEnable(LOGICAL,69)
    assign busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_notEnable_q = $unsigned(~ (VCC_q));

    // busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_nor(LOGICAL,70)
    assign busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_nor_q = ~ (busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_notEnable_q | busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_sticky_ena_q);

    // busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_last(CONSTANT,66)
    assign busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_last_q = $unsigned(2'b01);

    // busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmp(LOGICAL,67)
    assign busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmp_q = $unsigned(busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_last_q == busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_q ? 1'b1 : 1'b0);

    // busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmpReg(REG,68)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmpReg_q <= $unsigned(busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmp_q);
        end
    end

    // busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_sticky_ena(REG,71)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_nor_q == 1'b1)
        begin
            busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_sticky_ena_q <= $unsigned(busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmpReg_q);
        end
    end

    // busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_enaAnd(LOGICAL,72)
    assign busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_enaAnd_q = busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_sticky_ena_q & VCC_q;

    // busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt(COUNTER,64)
    // low=0, high=2, step=1, init=0
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i <= 2'd0;
            busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_eq <= 1'b0;
        end
        else
        begin
            if (busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i == 2'd1)
            begin
                busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_eq <= 1'b1;
            end
            else
            begin
                busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_eq <= 1'b0;
            end
            if (busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_eq == 1'b1)
            begin
                busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i <= $unsigned(busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i) + $unsigned(2'd2);
            end
            else
            begin
                busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i <= $unsigned(busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i) + $unsigned(2'd1);
            end
        end
    end
    assign busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_q = busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i[1:0];

    // busFabric(BLACKBOX,2)
    busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz thebusFabric (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .busOut_readdata(busFabric_busOut_readdata),
        .busOut_readdatavalid(busFabric_busOut_readdatavalid),
        .clk(clk),
        .areset(reset_fanout_mitigation_signal_out[0]),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_wraddr(REG,65)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_wraddr_q <= $unsigned(2'b10);
        end
        else
        begin
            busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_wraddr_q <= $unsigned(busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_q);
        end
    end

    // busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem(DUALMEM,63)
    assign busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ia = $unsigned(busFabric_busOut_readdata);
    assign busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_aa = busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_wraddr_q;
    assign busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ab = busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_q;
    assign busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ena_OrRstB = bus_areset | busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_enaAnd_q[0];
    assign busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_reset0 = bus_areset;
    altera_syncram #(
        .ram_block_type("MLAB"),
        .operation_mode("DUAL_PORT"),
        .width_a(32),
        .widthad_a(2),
        .numwords_a(3),
        .width_b(32),
        .widthad_b(2),
        .numwords_b(3),
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
    ) busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_dmem (
        .clocken1(busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(bus_clk),
        .sclr(busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_reset0),
        .clock1(bus_clk),
        .address_a(busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_aa),
        .data_a(busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ab),
        .q_b(busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_iq),
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
    assign busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_q = busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_iq[31:0];

    // busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv(DELAY,59)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_0 <= '0;
        end
        else
        begin
            busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_0 <= $unsigned(busFabric_busOut_readdatavalid);
        end
    end
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_1 <= busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_0;
            busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_2 <= busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_1;
            busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_q <= busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_2;
        end
    end

    // DUT_vunroll_cunroll_x(BLACKBOX,12)
    ddc_model_DUT_DUT theDUT_vunroll_cunroll_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_1_In_v_tpl(DDC_Valid_In_s),
        .in_2_In_c_tpl(DDC_Chan_In_s),
        .in_3_0_imag_In_d_tpl(DDC_Ant_Data_In_0im),
        .in_3_0_real_In_d_tpl(DDC_Ant_Data_In_0re),
        .in_3_1_imag_In_d_tpl(DDC_Ant_Data_In_1im),
        .in_3_1_real_In_d_tpl(DDC_Ant_Data_In_1re),
        .in_3_2_imag_In_d_tpl(DDC_Ant_Data_In_2im),
        .in_3_2_real_In_d_tpl(DDC_Ant_Data_In_2re),
        .in_3_3_imag_In_d_tpl(DDC_Ant_Data_In_3im),
        .in_3_3_real_In_d_tpl(DDC_Ant_Data_In_3re),
        .in_4_0_sync_tpl(DDC_NCO_sync_0),
        .in_4_1_sync_tpl(DDC_NCO_sync_1),
        .in_4_2_sync_tpl(DDC_NCO_sync_2),
        .in_4_3_sync_tpl(DDC_NCO_sync_3),
        .in_5_BW_config_CC1_tpl(BW_Config_CC1_s),
        .in_6_0_imag_In_Const_tpl(DDC_Const_Data_In_0im),
        .in_6_0_real_In_Const_tpl(DDC_Const_Data_In_0re),
        .in_6_1_imag_In_Const_tpl(DDC_Const_Data_In_1im),
        .in_6_1_real_In_Const_tpl(DDC_Const_Data_In_1re),
        .in_6_2_imag_In_Const_tpl(DDC_Const_Data_In_2im),
        .in_6_2_real_In_Const_tpl(DDC_Const_Data_In_2re),
        .in_6_3_imag_In_Const_tpl(DDC_Const_Data_In_3im),
        .in_6_3_real_In_Const_tpl(DDC_Const_Data_In_3re),
        .in_7_In_Sel_tpl(DDC_Const_Data_sel_s),
        .busOut_readdata(DUT_vunroll_cunroll_x_busOut_readdata),
        .busOut_readdatavalid(DUT_vunroll_cunroll_x_busOut_readdatavalid),
        .out_1_imag_q1_tpl(DUT_vunroll_cunroll_x_out_1_imag_q1_tpl),
        .out_1_real_q1_tpl(DUT_vunroll_cunroll_x_out_1_real_q1_tpl),
        .out_2_q_v1_tpl(DUT_vunroll_cunroll_x_out_2_q_v1_tpl),
        .out_3_q_c1_tpl(DUT_vunroll_cunroll_x_out_3_q_c1_tpl),
        .out_4_0_imag_mixer_l1_dout_tpl(DUT_vunroll_cunroll_x_out_4_0_imag_mixer_l1_dout_tpl),
        .out_4_0_real_mixer_l1_dout_tpl(DUT_vunroll_cunroll_x_out_4_0_real_mixer_l1_dout_tpl),
        .out_4_1_imag_mixer_l1_dout_tpl(DUT_vunroll_cunroll_x_out_4_1_imag_mixer_l1_dout_tpl),
        .out_4_1_real_mixer_l1_dout_tpl(DUT_vunroll_cunroll_x_out_4_1_real_mixer_l1_dout_tpl),
        .out_4_2_imag_mixer_l1_dout_tpl(DUT_vunroll_cunroll_x_out_4_2_imag_mixer_l1_dout_tpl),
        .out_4_2_real_mixer_l1_dout_tpl(DUT_vunroll_cunroll_x_out_4_2_real_mixer_l1_dout_tpl),
        .out_4_3_imag_mixer_l1_dout_tpl(DUT_vunroll_cunroll_x_out_4_3_imag_mixer_l1_dout_tpl),
        .out_4_3_real_mixer_l1_dout_tpl(DUT_vunroll_cunroll_x_out_4_3_real_mixer_l1_dout_tpl),
        .out_5_mixer_l1_vout_tpl(DUT_vunroll_cunroll_x_out_5_mixer_l1_vout_tpl),
        .out_6_mixer_l1_cout_tpl(DUT_vunroll_cunroll_x_out_6_mixer_l1_cout_tpl),
        .clk(clk),
        .areset(reset_fanout_mitigation_signal_out[0]),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // bus_selector(SELECTOR,5)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            bus_selector_q <= 32'b0;
            bus_selector_v <= 1'b0;
        end
        else
        begin
            bus_selector_q <= {31'b0000000000000000000000000000000, GND_q};
            bus_selector_v <= $unsigned(1'b0);
            if (busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_q == 1'b1)
            begin
                bus_selector_q <= busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_q;
                bus_selector_v <= $unsigned(1'b1);
            end
            if (DUT_vunroll_cunroll_x_busOut_readdatavalid == 1'b1)
            begin
                bus_selector_q <= DUT_vunroll_cunroll_x_busOut_readdata;
                bus_selector_v <= $unsigned(1'b1);
            end
        end
    end

    // ddc_model_DUT_readDelayed(DELAY,61)
    dspba_delay_ver #( .width(1), .depth(6), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    ddc_model_DUT_readDelayed ( .xin(busIn_read), .xout(ddc_model_DUT_readDelayed_q), .clk(bus_clk), .aclr(bus_areset), .ena(1'b1) );

    // ddc_model_DUT_readDataValid(LOGICAL,62)
    assign ddc_model_DUT_readDataValid_q = bus_selector_v | ddc_model_DUT_readDelayed_q;

    // busOut(BUSOUT,4)
    assign busOut_readdatavalid = ddc_model_DUT_readDataValid_q;
    assign busOut_readdata = bus_selector_q;
    assign busOut_waitrequest = GND_q;

    // ddc_l1_dout_im(GPOUT,37)
    assign ddc_l1_dout_im = DUT_vunroll_cunroll_x_out_1_imag_q1_tpl;

    // ddc_l1_dout_re(GPOUT,38)
    assign ddc_l1_dout_re = DUT_vunroll_cunroll_x_out_1_real_q1_tpl;

    // ddc_l1_vout_s(GPOUT,39)
    assign ddc_l1_vout_s = DUT_vunroll_cunroll_x_out_2_q_v1_tpl;

    // ddc_l1_cout_s(GPOUT,40)
    assign ddc_l1_cout_s = DUT_vunroll_cunroll_x_out_3_q_c1_tpl;

    // mixer_l1_dout_0im(GPOUT,41)
    assign mixer_l1_dout_0im = DUT_vunroll_cunroll_x_out_4_0_imag_mixer_l1_dout_tpl;

    // mixer_l1_dout_0re(GPOUT,42)
    assign mixer_l1_dout_0re = DUT_vunroll_cunroll_x_out_4_0_real_mixer_l1_dout_tpl;

    // mixer_l1_dout_1im(GPOUT,43)
    assign mixer_l1_dout_1im = DUT_vunroll_cunroll_x_out_4_1_imag_mixer_l1_dout_tpl;

    // mixer_l1_dout_1re(GPOUT,44)
    assign mixer_l1_dout_1re = DUT_vunroll_cunroll_x_out_4_1_real_mixer_l1_dout_tpl;

    // mixer_l1_dout_2im(GPOUT,45)
    assign mixer_l1_dout_2im = DUT_vunroll_cunroll_x_out_4_2_imag_mixer_l1_dout_tpl;

    // mixer_l1_dout_2re(GPOUT,46)
    assign mixer_l1_dout_2re = DUT_vunroll_cunroll_x_out_4_2_real_mixer_l1_dout_tpl;

    // mixer_l1_dout_3im(GPOUT,47)
    assign mixer_l1_dout_3im = DUT_vunroll_cunroll_x_out_4_3_imag_mixer_l1_dout_tpl;

    // mixer_l1_dout_3re(GPOUT,48)
    assign mixer_l1_dout_3re = DUT_vunroll_cunroll_x_out_4_3_real_mixer_l1_dout_tpl;

    // mixer_l1_vout_s(GPOUT,49)
    assign mixer_l1_vout_s = DUT_vunroll_cunroll_x_out_5_mixer_l1_vout_tpl;

    // mixer_l1_cout_s(GPOUT,50)
    assign mixer_l1_cout_s = DUT_vunroll_cunroll_x_out_6_mixer_l1_cout_tpl;
    always @ (posedge clk)
    begin
        if (0)
        begin
        end
        else
        begin
            reset_fanout_mitigation_signal_out[1] <= areset;
            reset_fanout_mitigation_signal_out[0:0] <= reset_fanout_mitigation_signal_out[1:1];
        end
    end

endmodule
