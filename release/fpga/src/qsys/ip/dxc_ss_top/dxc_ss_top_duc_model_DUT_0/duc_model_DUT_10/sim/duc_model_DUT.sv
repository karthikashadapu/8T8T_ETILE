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

// SystemVerilog created from duc_model_DUT
// SystemVerilog created on Thu Jan  9 15:34:39 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module duc_model_DUT (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [0:0] DUC_Valid_l1_s,
    input wire [7:0] DUC_Chan_l1_s,
    input wire [15:0] DUC_Data_l1_im,
    input wire [15:0] DUC_Data_l1_re,
    input wire [0:0] DUC_NCO_sync_0,
    input wire [0:0] DUC_NCO_sync_1,
    input wire [0:0] DUC_NCO_sync_2,
    input wire [0:0] DUC_NCO_sync_3,
    input wire [7:0] BW_Config_CC1_s,
    output wire [0:0] DUC_Valid_Out_s,
    output wire [7:0] DUC_Chan_Out_s,
    output wire [15:0] DUC_Data_Out_0im,
    output wire [15:0] DUC_Data_Out_0re,
    output wire [15:0] DUC_Data_Out_1im,
    output wire [15:0] DUC_Data_Out_1re,
    output wire [15:0] DUC_Data_Out_2im,
    output wire [15:0] DUC_Data_Out_2re,
    output wire [15:0] DUC_Data_Out_3im,
    output wire [15:0] DUC_Data_Out_3re,
    output wire [0:0] duc_l1_vout_s,
    output wire [7:0] duc_l1_cout_s,
    output wire [15:0] duc_l1_dout_0im,
    output wire [15:0] duc_l1_dout_0re,
    output wire [15:0] duc_l1_dout_1im,
    output wire [15:0] duc_l1_dout_1re,
    output wire [15:0] duc_l1_dout_2im,
    output wire [15:0] duc_l1_dout_2re,
    output wire [15:0] duc_l1_dout_3im,
    output wire [15:0] duc_l1_dout_3re,
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
    wire [31:0] ChanFilt_DUC_vunroll_cunroll_x_busOut_readdata;
    wire [0:0] ChanFilt_DUC_vunroll_cunroll_x_busOut_readdatavalid;
    wire [7:0] ChanFilt_DUC_vunroll_cunroll_x_out_1_cout_tpl;
    wire [0:0] ChanFilt_DUC_vunroll_cunroll_x_out_2_vout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_3_0_imag_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_3_0_real_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_3_1_imag_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_3_1_real_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_3_2_imag_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_3_2_real_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_3_3_imag_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_3_3_real_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_4_0_imag_duc_l1_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_4_0_real_duc_l1_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_4_1_imag_duc_l1_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_4_1_real_duc_l1_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_4_2_imag_duc_l1_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_4_2_real_duc_l1_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_4_3_imag_duc_l1_dout_tpl;
    wire [15:0] ChanFilt_DUC_vunroll_cunroll_x_out_4_3_real_duc_l1_dout_tpl;
    wire [0:0] ChanFilt_DUC_vunroll_cunroll_x_out_5_duc_l1_vout_tpl;
    wire [7:0] ChanFilt_DUC_vunroll_cunroll_x_out_6_duc_l1_cout_tpl;
    reg [0:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_q;
    reg [0:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_0;
    reg [0:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_1;
    reg [0:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_2;
    reg [0:0] duc_model_DUT_readDelayed_q;
    wire [0:0] duc_model_DUT_readDataValid_q;
    wire busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_reset0;
    wire busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ena_OrRstB;
    wire [31:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ia;
    wire [1:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_aa;
    wire [1:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ab;
    wire [31:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_iq;
    wire [31:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_q;
    wire [1:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_q;
    (* preserve_syn_only *) reg [1:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i;
    (* preserve_syn_only *) reg busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_eq;
    reg [1:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_wraddr_q;
    wire [1:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_last_q;
    wire [0:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmp_q;
    (* preserve_syn_only *) reg [0:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmpReg_q;
    wire [0:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_notEnable_q;
    wire [0:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_nor_q;
    (* preserve_syn_only *) reg [0:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_sticky_ena_q;
    wire [0:0] busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_enaAnd_q;
    reg [1:0] reset_fanout_mitigation_signal_out;

    import duc_model_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_notEnable(LOGICAL,60)
    assign busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_notEnable_q = $unsigned(~ (VCC_q));

    // busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_nor(LOGICAL,61)
    assign busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_nor_q = ~ (busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_notEnable_q | busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_sticky_ena_q);

    // busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_last(CONSTANT,57)
    assign busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_last_q = $unsigned(2'b01);

    // busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmp(LOGICAL,58)
    assign busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmp_q = $unsigned(busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_last_q == busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_q ? 1'b1 : 1'b0);

    // busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmpReg(REG,59)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmpReg_q <= $unsigned(1'b0);
        end
        else
        begin
            busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmpReg_q <= $unsigned(busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmp_q);
        end
    end

    // busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_sticky_ena(REG,62)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_sticky_ena_q <= $unsigned(1'b0);
        end
        else if (busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_nor_q == 1'b1)
        begin
            busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_sticky_ena_q <= $unsigned(busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_cmpReg_q);
        end
    end

    // busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_enaAnd(LOGICAL,63)
    assign busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_enaAnd_q = busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_sticky_ena_q & VCC_q;

    // busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt(COUNTER,55)
    // low=0, high=2, step=1, init=0
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i <= 2'd0;
            busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_eq <= 1'b0;
        end
        else
        begin
            if (busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i == 2'd1)
            begin
                busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_eq <= 1'b1;
            end
            else
            begin
                busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_eq <= 1'b0;
            end
            if (busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_eq == 1'b1)
            begin
                busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i <= $unsigned(busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i) + $unsigned(2'd2);
            end
            else
            begin
                busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i <= $unsigned(busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i) + $unsigned(2'd1);
            end
        end
    end
    assign busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_q = busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_i[1:0];

    // busFabric(BLACKBOX,2)
    busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz thebusFabric (
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

    // busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_wraddr(REG,56)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_wraddr_q <= $unsigned(2'b10);
        end
        else
        begin
            busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_wraddr_q <= $unsigned(busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_q);
        end
    end

    // busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem(DUALMEM,54)
    assign busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ia = $unsigned(busFabric_busOut_readdata);
    assign busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_aa = busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_wraddr_q;
    assign busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ab = busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_rdcnt_q;
    assign busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ena_OrRstB = bus_areset | busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_enaAnd_q[0];
    assign busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_reset0 = bus_areset;
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
    ) busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_dmem (
        .clocken1(busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ena_OrRstB),
        .clocken0(1'b1),
        .clock0(bus_clk),
        .sclr(busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_reset0),
        .clock1(bus_clk),
        .address_a(busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_aa),
        .data_a(busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ia),
        .wren_a(VCC_q[0]),
        .address_b(busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_ab),
        .q_b(busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_iq),
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
    assign busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_q = busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_iq[31:0];

    // busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv(DELAY,50)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_0 <= '0;
        end
        else
        begin
            busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_0 <= $unsigned(busFabric_busOut_readdatavalid);
        end
    end
    always @ (posedge bus_clk)
    begin
        if (0)
        begin
        end
        else
        begin
            busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_1 <= busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_0;
            busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_2 <= busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_1;
            busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_q <= busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_delay_2;
        end
    end

    // ChanFilt_DUC_vunroll_cunroll_x(BLACKBOX,12)
    duc_model_DUT_ChanFilt_DUC theChanFilt_DUC_vunroll_cunroll_x (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .in_1_v_1_tpl(DUC_Valid_l1_s),
        .in_2_c_1_tpl(DUC_Chan_l1_s),
        .in_3_imag_d_1_tpl(DUC_Data_l1_im),
        .in_3_real_d_1_tpl(DUC_Data_l1_re),
        .in_4_0_sync_tpl(DUC_NCO_sync_0),
        .in_4_1_sync_tpl(DUC_NCO_sync_1),
        .in_4_2_sync_tpl(DUC_NCO_sync_2),
        .in_4_3_sync_tpl(DUC_NCO_sync_3),
        .in_5_BWconfig_1_tpl(BW_Config_CC1_s),
        .busOut_readdata(ChanFilt_DUC_vunroll_cunroll_x_busOut_readdata),
        .busOut_readdatavalid(ChanFilt_DUC_vunroll_cunroll_x_busOut_readdatavalid),
        .out_1_cout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_1_cout_tpl),
        .out_2_vout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_2_vout_tpl),
        .out_3_0_imag_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_3_0_imag_dout_tpl),
        .out_3_0_real_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_3_0_real_dout_tpl),
        .out_3_1_imag_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_3_1_imag_dout_tpl),
        .out_3_1_real_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_3_1_real_dout_tpl),
        .out_3_2_imag_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_3_2_imag_dout_tpl),
        .out_3_2_real_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_3_2_real_dout_tpl),
        .out_3_3_imag_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_3_3_imag_dout_tpl),
        .out_3_3_real_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_3_3_real_dout_tpl),
        .out_4_0_imag_duc_l1_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_4_0_imag_duc_l1_dout_tpl),
        .out_4_0_real_duc_l1_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_4_0_real_duc_l1_dout_tpl),
        .out_4_1_imag_duc_l1_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_4_1_imag_duc_l1_dout_tpl),
        .out_4_1_real_duc_l1_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_4_1_real_duc_l1_dout_tpl),
        .out_4_2_imag_duc_l1_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_4_2_imag_duc_l1_dout_tpl),
        .out_4_2_real_duc_l1_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_4_2_real_duc_l1_dout_tpl),
        .out_4_3_imag_duc_l1_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_4_3_imag_duc_l1_dout_tpl),
        .out_4_3_real_duc_l1_dout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_4_3_real_duc_l1_dout_tpl),
        .out_5_duc_l1_vout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_5_duc_l1_vout_tpl),
        .out_6_duc_l1_cout_tpl(ChanFilt_DUC_vunroll_cunroll_x_out_6_duc_l1_cout_tpl),
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
            if (busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_rdv_q == 1'b1)
            begin
                bus_selector_q <= busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz_d_mem_q;
                bus_selector_v <= $unsigned(1'b1);
            end
            if (ChanFilt_DUC_vunroll_cunroll_x_busOut_readdatavalid == 1'b1)
            begin
                bus_selector_q <= ChanFilt_DUC_vunroll_cunroll_x_busOut_readdata;
                bus_selector_v <= $unsigned(1'b1);
            end
        end
    end

    // duc_model_DUT_readDelayed(DELAY,52)
    dspba_delay_ver #( .width(1), .depth(6), .reset_kind("SYNC"), .phase(0), .modulus(1024) )
    duc_model_DUT_readDelayed ( .xin(busIn_read), .xout(duc_model_DUT_readDelayed_q), .clk(bus_clk), .aclr(bus_areset), .ena(1'b1) );

    // duc_model_DUT_readDataValid(LOGICAL,53)
    assign duc_model_DUT_readDataValid_q = bus_selector_v | duc_model_DUT_readDelayed_q;

    // busOut(BUSOUT,4)
    assign busOut_readdatavalid = duc_model_DUT_readDataValid_q;
    assign busOut_readdata = bus_selector_q;
    assign busOut_waitrequest = GND_q;

    // DUC_Valid_Out_s(GPOUT,22)
    assign DUC_Valid_Out_s = ChanFilt_DUC_vunroll_cunroll_x_out_2_vout_tpl;

    // DUC_Chan_Out_s(GPOUT,23)
    assign DUC_Chan_Out_s = ChanFilt_DUC_vunroll_cunroll_x_out_1_cout_tpl;

    // DUC_Data_Out_0im(GPOUT,24)
    assign DUC_Data_Out_0im = ChanFilt_DUC_vunroll_cunroll_x_out_3_0_imag_dout_tpl;

    // DUC_Data_Out_0re(GPOUT,25)
    assign DUC_Data_Out_0re = ChanFilt_DUC_vunroll_cunroll_x_out_3_0_real_dout_tpl;

    // DUC_Data_Out_1im(GPOUT,26)
    assign DUC_Data_Out_1im = ChanFilt_DUC_vunroll_cunroll_x_out_3_1_imag_dout_tpl;

    // DUC_Data_Out_1re(GPOUT,27)
    assign DUC_Data_Out_1re = ChanFilt_DUC_vunroll_cunroll_x_out_3_1_real_dout_tpl;

    // DUC_Data_Out_2im(GPOUT,28)
    assign DUC_Data_Out_2im = ChanFilt_DUC_vunroll_cunroll_x_out_3_2_imag_dout_tpl;

    // DUC_Data_Out_2re(GPOUT,29)
    assign DUC_Data_Out_2re = ChanFilt_DUC_vunroll_cunroll_x_out_3_2_real_dout_tpl;

    // DUC_Data_Out_3im(GPOUT,30)
    assign DUC_Data_Out_3im = ChanFilt_DUC_vunroll_cunroll_x_out_3_3_imag_dout_tpl;

    // DUC_Data_Out_3re(GPOUT,31)
    assign DUC_Data_Out_3re = ChanFilt_DUC_vunroll_cunroll_x_out_3_3_real_dout_tpl;

    // duc_l1_vout_s(GPOUT,32)
    assign duc_l1_vout_s = ChanFilt_DUC_vunroll_cunroll_x_out_5_duc_l1_vout_tpl;

    // duc_l1_cout_s(GPOUT,33)
    assign duc_l1_cout_s = ChanFilt_DUC_vunroll_cunroll_x_out_6_duc_l1_cout_tpl;

    // duc_l1_dout_0im(GPOUT,34)
    assign duc_l1_dout_0im = ChanFilt_DUC_vunroll_cunroll_x_out_4_0_imag_duc_l1_dout_tpl;

    // duc_l1_dout_0re(GPOUT,35)
    assign duc_l1_dout_0re = ChanFilt_DUC_vunroll_cunroll_x_out_4_0_real_duc_l1_dout_tpl;

    // duc_l1_dout_1im(GPOUT,36)
    assign duc_l1_dout_1im = ChanFilt_DUC_vunroll_cunroll_x_out_4_1_imag_duc_l1_dout_tpl;

    // duc_l1_dout_1re(GPOUT,37)
    assign duc_l1_dout_1re = ChanFilt_DUC_vunroll_cunroll_x_out_4_1_real_duc_l1_dout_tpl;

    // duc_l1_dout_2im(GPOUT,38)
    assign duc_l1_dout_2im = ChanFilt_DUC_vunroll_cunroll_x_out_4_2_imag_duc_l1_dout_tpl;

    // duc_l1_dout_2re(GPOUT,39)
    assign duc_l1_dout_2re = ChanFilt_DUC_vunroll_cunroll_x_out_4_2_real_duc_l1_dout_tpl;

    // duc_l1_dout_3im(GPOUT,40)
    assign duc_l1_dout_3im = ChanFilt_DUC_vunroll_cunroll_x_out_4_3_imag_duc_l1_dout_tpl;

    // duc_l1_dout_3re(GPOUT,41)
    assign duc_l1_dout_3re = ChanFilt_DUC_vunroll_cunroll_x_out_4_3_real_duc_l1_dout_tpl;
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
