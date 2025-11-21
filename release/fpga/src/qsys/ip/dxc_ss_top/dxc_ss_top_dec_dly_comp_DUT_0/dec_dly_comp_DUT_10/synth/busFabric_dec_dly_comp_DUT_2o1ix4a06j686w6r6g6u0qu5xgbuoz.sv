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

// SystemVerilog created from busFabric_dec_dly_comp_DUT_2o1ix4a06j686w6r6g6u0qu5xgbuoz
// SystemVerilog created on Tue Jan  7 17:06:26 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module busFabric_dec_dly_comp_DUT_2o1ix4a06j686w6r6g6u0qu5xgbuoz (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [15:0] out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl,
    output wire [15:0] out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl,
    output wire [15:0] out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl,
    output wire [15:0] out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl,
    output wire [7:0] out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl,
    output wire [7:0] out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl,
    output wire [7:0] out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl,
    output wire [7:0] out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl,
    output wire [7:0] out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl,
    output wire [7:0] out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl,
    output wire [7:0] out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl,
    output wire [7:0] out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl,
    output wire [15:0] out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [31:0] mm_reg_0_x_a;
    wire [0:0] mm_reg_0_x_b;
    reg [31:0] mm_reg_0_x_v;
    reg [31:0] mm_reg_0_x_q;
    wire [31:0] mm_reg_1_x_a;
    wire [0:0] mm_reg_1_x_b;
    reg [31:0] mm_reg_1_x_v;
    reg [31:0] mm_reg_1_x_q;
    wire [31:0] mm_reg_2_x_a;
    wire [0:0] mm_reg_2_x_b;
    reg [31:0] mm_reg_2_x_v;
    reg [31:0] mm_reg_2_x_q;
    wire [31:0] mm_reg_3_x_a;
    wire [0:0] mm_reg_3_x_b;
    reg [31:0] mm_reg_3_x_v;
    reg [31:0] mm_reg_3_x_q;
    wire [31:0] mm_reg_4_x_a;
    wire [0:0] mm_reg_4_x_b;
    reg [31:0] mm_reg_4_x_v;
    reg [31:0] mm_reg_4_x_q;
    wire [31:0] mm_reg_5_x_a;
    wire [0:0] mm_reg_5_x_b;
    reg [31:0] mm_reg_5_x_v;
    reg [31:0] mm_reg_5_x_q;
    wire [31:0] mm_reg_6_x_a;
    wire [0:0] mm_reg_6_x_b;
    reg [31:0] mm_reg_6_x_v;
    reg [31:0] mm_reg_6_x_q;
    wire [31:0] mm_reg_7_x_a;
    wire [0:0] mm_reg_7_x_b;
    reg [31:0] mm_reg_7_x_v;
    reg [31:0] mm_reg_7_x_q;
    wire [31:0] mm_reg_8_x_a;
    wire [0:0] mm_reg_8_x_b;
    reg [31:0] mm_reg_8_x_v;
    reg [31:0] mm_reg_8_x_q;
    wire [31:0] mm_reg_9_x_a;
    wire [0:0] mm_reg_9_x_b;
    reg [31:0] mm_reg_9_x_v;
    reg [31:0] mm_reg_9_x_q;
    wire [31:0] mm_reg_10_x_a;
    wire [0:0] mm_reg_10_x_b;
    reg [31:0] mm_reg_10_x_v;
    reg [31:0] mm_reg_10_x_q;
    wire [31:0] mm_reg_11_x_a;
    wire [0:0] mm_reg_11_x_b;
    reg [31:0] mm_reg_11_x_v;
    reg [31:0] mm_reg_11_x_q;
    wire [31:0] mm_reg_12_x_a;
    wire [0:0] mm_reg_12_x_b;
    reg [31:0] mm_reg_12_x_v;
    reg [31:0] mm_reg_12_x_q;
    wire [31:0] mm_reg_13_x_a;
    wire [0:0] mm_reg_13_x_b;
    reg [31:0] mm_reg_13_x_v;
    reg [31:0] mm_reg_13_x_q;
    wire [0:0] addr_0_cmp_x_q;
    wire [13:0] addr_0_const_0_x_q;
    wire [0:0] addr_1_cmp_x_q;
    wire [13:0] addr_1_const_1_x_q;
    wire [0:0] addr_2_cmp_x_q;
    wire [13:0] addr_2_const_2_x_q;
    wire [0:0] addr_3_cmp_x_q;
    wire [13:0] addr_3_const_3_x_q;
    wire [0:0] addr_4_cmp_x_q;
    wire [13:0] addr_4_const_4_x_q;
    wire [0:0] addr_5_cmp_x_q;
    wire [13:0] addr_5_const_5_x_q;
    wire [0:0] addr_6_cmp_x_q;
    wire [13:0] addr_6_const_6_x_q;
    wire [0:0] addr_7_cmp_x_q;
    wire [13:0] addr_7_const_7_x_q;
    wire [0:0] addr_8_cmp_x_q;
    wire [13:0] addr_8_const_8_x_q;
    wire [0:0] addr_9_cmp_x_q;
    wire [13:0] addr_9_const_9_x_q;
    wire [0:0] addr_10_cmp_x_q;
    wire [13:0] addr_10_const_10_x_q;
    wire [0:0] addr_11_cmp_x_q;
    wire [13:0] addr_11_const_11_x_q;
    wire [0:0] addr_12_cmp_x_q;
    wire [13:0] addr_12_const_12_x_q;
    wire [0:0] addr_13_cmp_x_q;
    wire [13:0] addr_13_const_13_x_q;
    wire [15:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_bitsel_x_b;
    wire [15:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_bitsel_x_b;
    wire [15:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_bitsel_x_b;
    wire [15:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_bitsel_x_b;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_bitsel_x_b;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_bitsel_x_b;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_bitsel_x_b;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_bitsel_x_b;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_bitsel_x_b;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_bitsel_x_b;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_bitsel_x_b;
    wire [7:0] dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_bitsel_x_b;
    wire [15:0] dec_dly_comp_DUT_DUT_By_Pass_RegField_bitsel_x_b;
    wire [0:0] addr_0_readHit_and_x_q;
    wire [0:0] addr_0_writeHit_and_x_q;
    wire [0:0] addr_1_readHit_and_x_q;
    wire [0:0] addr_1_writeHit_and_x_q;
    wire [0:0] addr_2_readHit_and_x_q;
    wire [0:0] addr_2_writeHit_and_x_q;
    wire [0:0] addr_3_readHit_and_x_q;
    wire [0:0] addr_3_writeHit_and_x_q;
    wire [0:0] addr_4_readHit_and_x_q;
    wire [0:0] addr_4_writeHit_and_x_q;
    wire [0:0] addr_5_readHit_and_x_q;
    wire [0:0] addr_5_writeHit_and_x_q;
    wire [0:0] addr_6_readHit_and_x_q;
    wire [0:0] addr_6_writeHit_and_x_q;
    wire [0:0] addr_7_readHit_and_x_q;
    wire [0:0] addr_7_writeHit_and_x_q;
    wire [0:0] addr_8_readHit_and_x_q;
    wire [0:0] addr_8_writeHit_and_x_q;
    wire [0:0] addr_9_readHit_and_x_q;
    wire [0:0] addr_9_writeHit_and_x_q;
    wire [0:0] addr_10_readHit_and_x_q;
    wire [0:0] addr_10_writeHit_and_x_q;
    wire [0:0] addr_11_readHit_and_x_q;
    wire [0:0] addr_11_writeHit_and_x_q;
    wire [0:0] addr_12_readHit_and_x_q;
    wire [0:0] addr_12_writeHit_and_x_q;
    wire [0:0] addr_13_readHit_and_x_q;
    wire [0:0] addr_13_writeHit_and_x_q;
    reg [31:0] bus_selector_opt_lev0_id0_q;
    reg [0:0] bus_selector_opt_lev0_id0_v;
    reg [31:0] bus_selector_opt_lev0_id1_q;
    reg [0:0] bus_selector_opt_lev0_id1_v;
    reg [31:0] bus_selector_opt_lev0_id2_q;
    reg [0:0] bus_selector_opt_lev0_id2_v;
    reg [31:0] bus_selector_opt_lev0_id3_q;
    reg [0:0] bus_selector_opt_lev0_id3_v;
    reg [31:0] bus_selector_opt_lev0_id4_q;
    reg [0:0] bus_selector_opt_lev0_id4_v;
    reg [31:0] bus_selector_opt_lev1_id0_q;
    reg [0:0] bus_selector_opt_lev1_id0_v;
    reg [31:0] bus_selector_opt_lev2_id0_q;
    reg [0:0] bus_selector_opt_lev2_id0_v;

    import dec_dly_comp_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // addr_13_const_13_x(CONSTANT,60)
    assign addr_13_const_13_x_q = $unsigned(14'b00000000001101);

    // addr_13_cmp_x(LOGICAL,59)@0
    assign addr_13_cmp_x_q = $unsigned(addr_13_const_13_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_13_writeHit_and_x(LOGICAL,114)@0
    assign addr_13_writeHit_and_x_q = addr_13_cmp_x_q & busIn_write;

    // mm_reg_13_x(SYNCREG,19)@0
    assign mm_reg_13_x_a = busIn_writedata;
    assign mm_reg_13_x_b = addr_13_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000001), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_13_x ( .xin(mm_reg_13_x_a), .ena(mm_reg_13_x_b), .xout(mm_reg_13_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_13_x_v), .clk2(clk), .aclr2(areset) );

    // addr_13_readHit_and_x(LOGICAL,113)@0
    assign addr_13_readHit_and_x_q = addr_13_cmp_x_q & busIn_read;

    // addr_12_const_12_x(CONSTANT,58)
    assign addr_12_const_12_x_q = $unsigned(14'b00000000001100);

    // addr_12_cmp_x(LOGICAL,57)@0
    assign addr_12_cmp_x_q = $unsigned(addr_12_const_12_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_12_writeHit_and_x(LOGICAL,112)@0
    assign addr_12_writeHit_and_x_q = addr_12_cmp_x_q & busIn_write;

    // mm_reg_12_x(SYNCREG,18)@0
    assign mm_reg_12_x_a = busIn_writedata;
    assign mm_reg_12_x_b = addr_12_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_12_x ( .xin(mm_reg_12_x_a), .ena(mm_reg_12_x_b), .xout(mm_reg_12_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_12_x_v), .clk2(clk), .aclr2(areset) );

    // addr_12_readHit_and_x(LOGICAL,111)@0
    assign addr_12_readHit_and_x_q = addr_12_cmp_x_q & busIn_read;

    // bus_selector_opt_lev0_id4(SELECTOR,119)@0
    always @(addr_12_readHit_and_x_q or mm_reg_12_x_q or addr_13_readHit_and_x_q or mm_reg_13_x_q)
    begin
        bus_selector_opt_lev0_id4_q = 32'b0;
        bus_selector_opt_lev0_id4_v = $unsigned(1'b0);
        if (addr_13_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id4_q = mm_reg_13_x_q;
            bus_selector_opt_lev0_id4_v = $unsigned(1'b1);
        end
        if (addr_12_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id4_q = mm_reg_12_x_q;
            bus_selector_opt_lev0_id4_v = $unsigned(1'b1);
        end
    end

    // addr_11_const_11_x(CONSTANT,56)
    assign addr_11_const_11_x_q = $unsigned(14'b00000000001011);

    // addr_11_cmp_x(LOGICAL,55)@0
    assign addr_11_cmp_x_q = $unsigned(addr_11_const_11_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_11_writeHit_and_x(LOGICAL,110)@0
    assign addr_11_writeHit_and_x_q = addr_11_cmp_x_q & busIn_write;

    // mm_reg_11_x(SYNCREG,17)@0
    assign mm_reg_11_x_a = busIn_writedata;
    assign mm_reg_11_x_b = addr_11_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_11_x ( .xin(mm_reg_11_x_a), .ena(mm_reg_11_x_b), .xout(mm_reg_11_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_11_x_v), .clk2(clk), .aclr2(areset) );

    // addr_11_readHit_and_x(LOGICAL,109)@0
    assign addr_11_readHit_and_x_q = addr_11_cmp_x_q & busIn_read;

    // addr_10_const_10_x(CONSTANT,54)
    assign addr_10_const_10_x_q = $unsigned(14'b00000000001010);

    // addr_10_cmp_x(LOGICAL,53)@0
    assign addr_10_cmp_x_q = $unsigned(addr_10_const_10_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_10_writeHit_and_x(LOGICAL,108)@0
    assign addr_10_writeHit_and_x_q = addr_10_cmp_x_q & busIn_write;

    // mm_reg_10_x(SYNCREG,16)@0
    assign mm_reg_10_x_a = busIn_writedata;
    assign mm_reg_10_x_b = addr_10_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_10_x ( .xin(mm_reg_10_x_a), .ena(mm_reg_10_x_b), .xout(mm_reg_10_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_10_x_v), .clk2(clk), .aclr2(areset) );

    // addr_10_readHit_and_x(LOGICAL,107)@0
    assign addr_10_readHit_and_x_q = addr_10_cmp_x_q & busIn_read;

    // addr_9_const_9_x(CONSTANT,52)
    assign addr_9_const_9_x_q = $unsigned(14'b00000000001001);

    // addr_9_cmp_x(LOGICAL,51)@0
    assign addr_9_cmp_x_q = $unsigned(addr_9_const_9_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_9_writeHit_and_x(LOGICAL,106)@0
    assign addr_9_writeHit_and_x_q = addr_9_cmp_x_q & busIn_write;

    // mm_reg_9_x(SYNCREG,15)@0
    assign mm_reg_9_x_a = busIn_writedata;
    assign mm_reg_9_x_b = addr_9_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_9_x ( .xin(mm_reg_9_x_a), .ena(mm_reg_9_x_b), .xout(mm_reg_9_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_9_x_v), .clk2(clk), .aclr2(areset) );

    // addr_9_readHit_and_x(LOGICAL,105)@0
    assign addr_9_readHit_and_x_q = addr_9_cmp_x_q & busIn_read;

    // bus_selector_opt_lev0_id3(SELECTOR,118)@0
    always @(addr_9_readHit_and_x_q or mm_reg_9_x_q or addr_10_readHit_and_x_q or mm_reg_10_x_q or addr_11_readHit_and_x_q or mm_reg_11_x_q)
    begin
        bus_selector_opt_lev0_id3_q = 32'b0;
        bus_selector_opt_lev0_id3_v = $unsigned(1'b0);
        if (addr_11_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id3_q = mm_reg_11_x_q;
            bus_selector_opt_lev0_id3_v = $unsigned(1'b1);
        end
        if (addr_10_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id3_q = mm_reg_10_x_q;
            bus_selector_opt_lev0_id3_v = $unsigned(1'b1);
        end
        if (addr_9_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id3_q = mm_reg_9_x_q;
            bus_selector_opt_lev0_id3_v = $unsigned(1'b1);
        end
    end

    // addr_8_const_8_x(CONSTANT,50)
    assign addr_8_const_8_x_q = $unsigned(14'b00000000001000);

    // addr_8_cmp_x(LOGICAL,49)@0
    assign addr_8_cmp_x_q = $unsigned(addr_8_const_8_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_8_writeHit_and_x(LOGICAL,104)@0
    assign addr_8_writeHit_and_x_q = addr_8_cmp_x_q & busIn_write;

    // mm_reg_8_x(SYNCREG,14)@0
    assign mm_reg_8_x_a = busIn_writedata;
    assign mm_reg_8_x_b = addr_8_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_8_x ( .xin(mm_reg_8_x_a), .ena(mm_reg_8_x_b), .xout(mm_reg_8_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_8_x_v), .clk2(clk), .aclr2(areset) );

    // addr_8_readHit_and_x(LOGICAL,103)@0
    assign addr_8_readHit_and_x_q = addr_8_cmp_x_q & busIn_read;

    // addr_7_const_7_x(CONSTANT,48)
    assign addr_7_const_7_x_q = $unsigned(14'b00000000000111);

    // addr_7_cmp_x(LOGICAL,47)@0
    assign addr_7_cmp_x_q = $unsigned(addr_7_const_7_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_7_writeHit_and_x(LOGICAL,102)@0
    assign addr_7_writeHit_and_x_q = addr_7_cmp_x_q & busIn_write;

    // mm_reg_7_x(SYNCREG,13)@0
    assign mm_reg_7_x_a = busIn_writedata;
    assign mm_reg_7_x_b = addr_7_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_7_x ( .xin(mm_reg_7_x_a), .ena(mm_reg_7_x_b), .xout(mm_reg_7_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_7_x_v), .clk2(clk), .aclr2(areset) );

    // addr_7_readHit_and_x(LOGICAL,101)@0
    assign addr_7_readHit_and_x_q = addr_7_cmp_x_q & busIn_read;

    // addr_6_const_6_x(CONSTANT,46)
    assign addr_6_const_6_x_q = $unsigned(14'b00000000000110);

    // addr_6_cmp_x(LOGICAL,45)@0
    assign addr_6_cmp_x_q = $unsigned(addr_6_const_6_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_6_writeHit_and_x(LOGICAL,100)@0
    assign addr_6_writeHit_and_x_q = addr_6_cmp_x_q & busIn_write;

    // mm_reg_6_x(SYNCREG,12)@0
    assign mm_reg_6_x_a = busIn_writedata;
    assign mm_reg_6_x_b = addr_6_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_6_x ( .xin(mm_reg_6_x_a), .ena(mm_reg_6_x_b), .xout(mm_reg_6_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_6_x_v), .clk2(clk), .aclr2(areset) );

    // addr_6_readHit_and_x(LOGICAL,99)@0
    assign addr_6_readHit_and_x_q = addr_6_cmp_x_q & busIn_read;

    // bus_selector_opt_lev0_id2(SELECTOR,117)@0
    always @(addr_6_readHit_and_x_q or mm_reg_6_x_q or addr_7_readHit_and_x_q or mm_reg_7_x_q or addr_8_readHit_and_x_q or mm_reg_8_x_q)
    begin
        bus_selector_opt_lev0_id2_q = 32'b0;
        bus_selector_opt_lev0_id2_v = $unsigned(1'b0);
        if (addr_8_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id2_q = mm_reg_8_x_q;
            bus_selector_opt_lev0_id2_v = $unsigned(1'b1);
        end
        if (addr_7_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id2_q = mm_reg_7_x_q;
            bus_selector_opt_lev0_id2_v = $unsigned(1'b1);
        end
        if (addr_6_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id2_q = mm_reg_6_x_q;
            bus_selector_opt_lev0_id2_v = $unsigned(1'b1);
        end
    end

    // addr_5_const_5_x(CONSTANT,44)
    assign addr_5_const_5_x_q = $unsigned(14'b00000000000101);

    // addr_5_cmp_x(LOGICAL,43)@0
    assign addr_5_cmp_x_q = $unsigned(addr_5_const_5_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_5_writeHit_and_x(LOGICAL,98)@0
    assign addr_5_writeHit_and_x_q = addr_5_cmp_x_q & busIn_write;

    // mm_reg_5_x(SYNCREG,11)@0
    assign mm_reg_5_x_a = busIn_writedata;
    assign mm_reg_5_x_b = addr_5_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_5_x ( .xin(mm_reg_5_x_a), .ena(mm_reg_5_x_b), .xout(mm_reg_5_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_5_x_v), .clk2(clk), .aclr2(areset) );

    // addr_5_readHit_and_x(LOGICAL,97)@0
    assign addr_5_readHit_and_x_q = addr_5_cmp_x_q & busIn_read;

    // addr_4_const_4_x(CONSTANT,42)
    assign addr_4_const_4_x_q = $unsigned(14'b00000000000100);

    // addr_4_cmp_x(LOGICAL,41)@0
    assign addr_4_cmp_x_q = $unsigned(addr_4_const_4_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_4_writeHit_and_x(LOGICAL,96)@0
    assign addr_4_writeHit_and_x_q = addr_4_cmp_x_q & busIn_write;

    // mm_reg_4_x(SYNCREG,10)@0
    assign mm_reg_4_x_a = busIn_writedata;
    assign mm_reg_4_x_b = addr_4_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_4_x ( .xin(mm_reg_4_x_a), .ena(mm_reg_4_x_b), .xout(mm_reg_4_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_4_x_v), .clk2(clk), .aclr2(areset) );

    // addr_4_readHit_and_x(LOGICAL,95)@0
    assign addr_4_readHit_and_x_q = addr_4_cmp_x_q & busIn_read;

    // addr_3_const_3_x(CONSTANT,40)
    assign addr_3_const_3_x_q = $unsigned(14'b00000000000011);

    // addr_3_cmp_x(LOGICAL,39)@0
    assign addr_3_cmp_x_q = $unsigned(addr_3_const_3_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_3_writeHit_and_x(LOGICAL,94)@0
    assign addr_3_writeHit_and_x_q = addr_3_cmp_x_q & busIn_write;

    // mm_reg_3_x(SYNCREG,9)@0
    assign mm_reg_3_x_a = busIn_writedata;
    assign mm_reg_3_x_b = addr_3_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000010000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_3_x ( .xin(mm_reg_3_x_a), .ena(mm_reg_3_x_b), .xout(mm_reg_3_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_3_x_v), .clk2(clk), .aclr2(areset) );

    // addr_3_readHit_and_x(LOGICAL,93)@0
    assign addr_3_readHit_and_x_q = addr_3_cmp_x_q & busIn_read;

    // bus_selector_opt_lev0_id1(SELECTOR,116)@0
    always @(addr_3_readHit_and_x_q or mm_reg_3_x_q or addr_4_readHit_and_x_q or mm_reg_4_x_q or addr_5_readHit_and_x_q or mm_reg_5_x_q)
    begin
        bus_selector_opt_lev0_id1_q = 32'b0;
        bus_selector_opt_lev0_id1_v = $unsigned(1'b0);
        if (addr_5_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id1_q = mm_reg_5_x_q;
            bus_selector_opt_lev0_id1_v = $unsigned(1'b1);
        end
        if (addr_4_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id1_q = mm_reg_4_x_q;
            bus_selector_opt_lev0_id1_v = $unsigned(1'b1);
        end
        if (addr_3_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id1_q = mm_reg_3_x_q;
            bus_selector_opt_lev0_id1_v = $unsigned(1'b1);
        end
    end

    // addr_2_const_2_x(CONSTANT,38)
    assign addr_2_const_2_x_q = $unsigned(14'b00000000000010);

    // addr_2_cmp_x(LOGICAL,37)@0
    assign addr_2_cmp_x_q = $unsigned(addr_2_const_2_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_2_writeHit_and_x(LOGICAL,92)@0
    assign addr_2_writeHit_and_x_q = addr_2_cmp_x_q & busIn_write;

    // mm_reg_2_x(SYNCREG,8)@0
    assign mm_reg_2_x_a = busIn_writedata;
    assign mm_reg_2_x_b = addr_2_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000010000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_2_x ( .xin(mm_reg_2_x_a), .ena(mm_reg_2_x_b), .xout(mm_reg_2_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_2_x_v), .clk2(clk), .aclr2(areset) );

    // addr_2_readHit_and_x(LOGICAL,91)@0
    assign addr_2_readHit_and_x_q = addr_2_cmp_x_q & busIn_read;

    // addr_1_const_1_x(CONSTANT,36)
    assign addr_1_const_1_x_q = $unsigned(14'b00000000000001);

    // addr_1_cmp_x(LOGICAL,35)@0
    assign addr_1_cmp_x_q = $unsigned(addr_1_const_1_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_1_writeHit_and_x(LOGICAL,90)@0
    assign addr_1_writeHit_and_x_q = addr_1_cmp_x_q & busIn_write;

    // mm_reg_1_x(SYNCREG,7)@0
    assign mm_reg_1_x_a = busIn_writedata;
    assign mm_reg_1_x_b = addr_1_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000010000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_1_x ( .xin(mm_reg_1_x_a), .ena(mm_reg_1_x_b), .xout(mm_reg_1_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_1_x_v), .clk2(clk), .aclr2(areset) );

    // addr_1_readHit_and_x(LOGICAL,89)@0
    assign addr_1_readHit_and_x_q = addr_1_cmp_x_q & busIn_read;

    // addr_0_const_0_x(CONSTANT,34)
    assign addr_0_const_0_x_q = $unsigned(14'b00000000000000);

    // addr_0_cmp_x(LOGICAL,33)@0
    assign addr_0_cmp_x_q = $unsigned(addr_0_const_0_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_0_writeHit_and_x(LOGICAL,88)@0
    assign addr_0_writeHit_and_x_q = addr_0_cmp_x_q & busIn_write;

    // mm_reg_0_x(SYNCREG,6)@0
    assign mm_reg_0_x_a = busIn_writedata;
    assign mm_reg_0_x_b = addr_0_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000010000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_0_x ( .xin(mm_reg_0_x_a), .ena(mm_reg_0_x_b), .xout(mm_reg_0_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_0_x_v), .clk2(clk), .aclr2(areset) );

    // addr_0_readHit_and_x(LOGICAL,87)@0
    assign addr_0_readHit_and_x_q = addr_0_cmp_x_q & busIn_read;

    // bus_selector_opt_lev0_id0(SELECTOR,115)@0
    always @(addr_0_readHit_and_x_q or mm_reg_0_x_q or addr_1_readHit_and_x_q or mm_reg_1_x_q or addr_2_readHit_and_x_q or mm_reg_2_x_q)
    begin
        bus_selector_opt_lev0_id0_q = 32'b0;
        bus_selector_opt_lev0_id0_v = $unsigned(1'b0);
        if (addr_2_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id0_q = mm_reg_2_x_q;
            bus_selector_opt_lev0_id0_v = $unsigned(1'b1);
        end
        if (addr_1_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id0_q = mm_reg_1_x_q;
            bus_selector_opt_lev0_id0_v = $unsigned(1'b1);
        end
        if (addr_0_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id0_q = mm_reg_0_x_q;
            bus_selector_opt_lev0_id0_v = $unsigned(1'b1);
        end
    end

    // bus_selector_opt_lev1_id0(SELECTOR,120)@0
    always @(bus_selector_opt_lev0_id0_v or bus_selector_opt_lev0_id0_q or bus_selector_opt_lev0_id1_v or bus_selector_opt_lev0_id1_q or bus_selector_opt_lev0_id2_v or bus_selector_opt_lev0_id2_q)
    begin
        bus_selector_opt_lev1_id0_q = 32'b0;
        bus_selector_opt_lev1_id0_v = $unsigned(1'b0);
        if (bus_selector_opt_lev0_id2_v == 1'b1)
        begin
            bus_selector_opt_lev1_id0_q = bus_selector_opt_lev0_id2_q;
            bus_selector_opt_lev1_id0_v = $unsigned(1'b1);
        end
        if (bus_selector_opt_lev0_id1_v == 1'b1)
        begin
            bus_selector_opt_lev1_id0_q = bus_selector_opt_lev0_id1_q;
            bus_selector_opt_lev1_id0_v = $unsigned(1'b1);
        end
        if (bus_selector_opt_lev0_id0_v == 1'b1)
        begin
            bus_selector_opt_lev1_id0_q = bus_selector_opt_lev0_id0_q;
            bus_selector_opt_lev1_id0_v = $unsigned(1'b1);
        end
    end

    // bus_selector_opt_lev2_id0(SELECTOR,121)@0 + 1
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            bus_selector_opt_lev2_id0_q <= 32'b0;
            bus_selector_opt_lev2_id0_v <= 1'b0;
        end
        else
        begin
            bus_selector_opt_lev2_id0_q <= {31'b0000000000000000000000000000000, GND_q};
            bus_selector_opt_lev2_id0_v <= $unsigned(1'b0);
            if (bus_selector_opt_lev0_id4_v == 1'b1)
            begin
                bus_selector_opt_lev2_id0_q <= bus_selector_opt_lev0_id4_q;
                bus_selector_opt_lev2_id0_v <= $unsigned(1'b1);
            end
            if (bus_selector_opt_lev0_id3_v == 1'b1)
            begin
                bus_selector_opt_lev2_id0_q <= bus_selector_opt_lev0_id3_q;
                bus_selector_opt_lev2_id0_v <= $unsigned(1'b1);
            end
            if (bus_selector_opt_lev1_id0_v == 1'b1)
            begin
                bus_selector_opt_lev2_id0_q <= bus_selector_opt_lev1_id0_q;
                bus_selector_opt_lev2_id0_v <= $unsigned(1'b1);
            end
        end
    end

    // busOut(BUSOUT,3)@1
    assign busOut_readdatavalid = bus_selector_opt_lev2_id0_v;
    assign busOut_readdata = bus_selector_opt_lev2_id0_q;

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_bitsel_x(BITSELECT,61)@0
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_bitsel_x_b = mm_reg_0_x_v[15:0];

    // out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl(GPOUT,20)@0
    assign out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_bitsel_x_b;

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_bitsel_x(BITSELECT,63)@0
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_bitsel_x_b = mm_reg_1_x_v[15:0];

    // out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl(GPOUT,21)@0
    assign out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_bitsel_x_b;

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_bitsel_x(BITSELECT,65)@0
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_bitsel_x_b = mm_reg_2_x_v[15:0];

    // out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl(GPOUT,22)@0
    assign out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_bitsel_x_b;

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_bitsel_x(BITSELECT,67)@0
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_bitsel_x_b = mm_reg_3_x_v[15:0];

    // out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl(GPOUT,23)@0
    assign out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_bitsel_x_b;

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_bitsel_x(BITSELECT,69)@0
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_bitsel_x_b = mm_reg_7_x_v[7:0];

    // out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl(GPOUT,24)@0
    assign out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_bitsel_x_b;

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_bitsel_x(BITSELECT,71)@0
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_bitsel_x_b = mm_reg_8_x_v[7:0];

    // out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl(GPOUT,25)@0
    assign out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_bitsel_x_b;

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_bitsel_x(BITSELECT,73)@0
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_bitsel_x_b = mm_reg_11_x_v[7:0];

    // out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl(GPOUT,26)@0
    assign out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_bitsel_x_b;

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_bitsel_x(BITSELECT,75)@0
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_bitsel_x_b = mm_reg_5_x_v[7:0];

    // out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl(GPOUT,27)@0
    assign out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_bitsel_x_b;

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_bitsel_x(BITSELECT,77)@0
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_bitsel_x_b = mm_reg_6_x_v[7:0];

    // out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl(GPOUT,28)@0
    assign out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_bitsel_x_b;

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_bitsel_x(BITSELECT,79)@0
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_bitsel_x_b = mm_reg_12_x_v[7:0];

    // out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl(GPOUT,29)@0
    assign out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_bitsel_x_b;

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_bitsel_x(BITSELECT,81)@0
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_bitsel_x_b = mm_reg_9_x_v[7:0];

    // out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl(GPOUT,30)@0
    assign out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_bitsel_x_b;

    // dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_bitsel_x(BITSELECT,83)@0
    assign dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_bitsel_x_b = mm_reg_10_x_v[7:0];

    // out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl(GPOUT,31)@0
    assign out_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl = dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_bitsel_x_b;

    // dec_dly_comp_DUT_DUT_By_Pass_RegField_bitsel_x(BITSELECT,85)@0
    assign dec_dly_comp_DUT_DUT_By_Pass_RegField_bitsel_x_b = mm_reg_4_x_v[15:0];

    // out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl(GPOUT,32)@0
    assign out_AMMregisterWireData_dec_dly_comp_DUT_DUT_By_Pass_RegField_x_tpl = dec_dly_comp_DUT_DUT_By_Pass_RegField_bitsel_x_b;

endmodule
