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

// SystemVerilog created from busFabric_prach_shortFormat_fftShift_prach_3i06i3ib0063663c63o60160760uq5ux5gubo0u
// SystemVerilog created on Wed Nov  6 19:28:32 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module busFabric_prach_shortFormat_fftShift_prach_3i06i3ib0063663c63o60160760uq5ux5gubo0u (
    input wire [31:0] busIn_writedata,
    input wire [9:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [7:0] out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl,
    output wire [2:0] out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl,
    output wire [0:0] out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl,
    output wire [0:0] out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl,
    output wire [7:0] out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl,
    output wire [11:0] out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
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
    wire [31:0] mm_reg_14_x_a;
    wire [0:0] mm_reg_14_x_b;
    reg [31:0] mm_reg_14_x_v;
    reg [31:0] mm_reg_14_x_q;
    wire [0:0] addr_8_cmp_x_q;
    wire [9:0] addr_8_const_8_x_q;
    wire [0:0] addr_9_cmp_x_q;
    wire [9:0] addr_9_const_9_x_q;
    wire [0:0] addr_10_cmp_x_q;
    wire [9:0] addr_10_const_10_x_q;
    wire [0:0] addr_11_cmp_x_q;
    wire [9:0] addr_11_const_11_x_q;
    wire [0:0] addr_12_cmp_x_q;
    wire [9:0] addr_12_const_12_x_q;
    wire [0:0] addr_13_cmp_x_q;
    wire [9:0] addr_13_const_13_x_q;
    wire [0:0] addr_14_cmp_x_q;
    wire [9:0] addr_14_const_14_x_q;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_bitsel_x_b;
    wire [2:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_bitsel_x_b;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_bitsel_x_b;
    wire [0:0] prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_bitsel_x_b;
    wire [7:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_bitsel_x_b;
    wire [11:0] prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_bitsel_x_b;
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
    wire [0:0] addr_14_readHit_and_x_q;
    wire [0:0] addr_14_writeHit_and_x_q;
    reg [31:0] bus_selector_opt_lev0_id0_q;
    reg [0:0] bus_selector_opt_lev0_id0_v;
    reg [31:0] bus_selector_opt_lev0_id1_q;
    reg [0:0] bus_selector_opt_lev0_id1_v;
    reg [31:0] bus_selector_opt_lev1_id0_q;
    reg [0:0] bus_selector_opt_lev1_id0_v;

    import prach_shortFormat_fftShift_prach_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // addr_14_const_14_x(CONSTANT,32)
    assign addr_14_const_14_x_q = $unsigned(10'b0000001110);

    // addr_14_cmp_x(LOGICAL,31)@0
    assign addr_14_cmp_x_q = $unsigned(addr_14_const_14_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_14_writeHit_and_x(LOGICAL,58)@0
    assign addr_14_writeHit_and_x_q = addr_14_cmp_x_q & busIn_write;

    // mm_reg_14_x(SYNCREG,12)@0
    assign mm_reg_14_x_a = busIn_writedata;
    assign mm_reg_14_x_b = addr_14_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_14_x ( .xin(mm_reg_14_x_a), .ena(mm_reg_14_x_b), .xout(mm_reg_14_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_14_x_v), .clk2(clk), .aclr2(areset) );

    // addr_14_readHit_and_x(LOGICAL,57)@0
    assign addr_14_readHit_and_x_q = addr_14_cmp_x_q & busIn_read;

    // addr_13_const_13_x(CONSTANT,30)
    assign addr_13_const_13_x_q = $unsigned(10'b0000001101);

    // addr_13_cmp_x(LOGICAL,29)@0
    assign addr_13_cmp_x_q = $unsigned(addr_13_const_13_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_13_writeHit_and_x(LOGICAL,56)@0
    assign addr_13_writeHit_and_x_q = addr_13_cmp_x_q & busIn_write;

    // mm_reg_13_x(SYNCREG,11)@0
    assign mm_reg_13_x_a = busIn_writedata;
    assign mm_reg_13_x_b = addr_13_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_13_x ( .xin(mm_reg_13_x_a), .ena(mm_reg_13_x_b), .xout(mm_reg_13_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_13_x_v), .clk2(clk), .aclr2(areset) );

    // addr_13_readHit_and_x(LOGICAL,55)@0
    assign addr_13_readHit_and_x_q = addr_13_cmp_x_q & busIn_read;

    // addr_12_const_12_x(CONSTANT,28)
    assign addr_12_const_12_x_q = $unsigned(10'b0000001100);

    // addr_12_cmp_x(LOGICAL,27)@0
    assign addr_12_cmp_x_q = $unsigned(addr_12_const_12_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_12_writeHit_and_x(LOGICAL,54)@0
    assign addr_12_writeHit_and_x_q = addr_12_cmp_x_q & busIn_write;

    // mm_reg_12_x(SYNCREG,10)@0
    assign mm_reg_12_x_a = busIn_writedata;
    assign mm_reg_12_x_b = addr_12_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000001100), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_12_x ( .xin(mm_reg_12_x_a), .ena(mm_reg_12_x_b), .xout(mm_reg_12_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_12_x_v), .clk2(clk), .aclr2(areset) );

    // addr_12_readHit_and_x(LOGICAL,53)@0
    assign addr_12_readHit_and_x_q = addr_12_cmp_x_q & busIn_read;

    // addr_11_const_11_x(CONSTANT,26)
    assign addr_11_const_11_x_q = $unsigned(10'b0000001011);

    // addr_11_cmp_x(LOGICAL,25)@0
    assign addr_11_cmp_x_q = $unsigned(addr_11_const_11_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_11_writeHit_and_x(LOGICAL,52)@0
    assign addr_11_writeHit_and_x_q = addr_11_cmp_x_q & busIn_write;

    // mm_reg_11_x(SYNCREG,9)@0
    assign mm_reg_11_x_a = busIn_writedata;
    assign mm_reg_11_x_b = addr_11_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_11_x ( .xin(mm_reg_11_x_a), .ena(mm_reg_11_x_b), .xout(mm_reg_11_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_11_x_v), .clk2(clk), .aclr2(areset) );

    // addr_11_readHit_and_x(LOGICAL,51)@0
    assign addr_11_readHit_and_x_q = addr_11_cmp_x_q & busIn_read;

    // bus_selector_opt_lev0_id1(SELECTOR,60)@0
    always @(addr_11_readHit_and_x_q or mm_reg_11_x_q or addr_12_readHit_and_x_q or mm_reg_12_x_q or addr_13_readHit_and_x_q or mm_reg_13_x_q)
    begin
        bus_selector_opt_lev0_id1_q = 32'b0;
        bus_selector_opt_lev0_id1_v = $unsigned(1'b0);
        if (addr_13_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id1_q = mm_reg_13_x_q;
            bus_selector_opt_lev0_id1_v = $unsigned(1'b1);
        end
        if (addr_12_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id1_q = mm_reg_12_x_q;
            bus_selector_opt_lev0_id1_v = $unsigned(1'b1);
        end
        if (addr_11_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id1_q = mm_reg_11_x_q;
            bus_selector_opt_lev0_id1_v = $unsigned(1'b1);
        end
    end

    // addr_10_const_10_x(CONSTANT,24)
    assign addr_10_const_10_x_q = $unsigned(10'b0000001010);

    // addr_10_cmp_x(LOGICAL,23)@0
    assign addr_10_cmp_x_q = $unsigned(addr_10_const_10_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_10_writeHit_and_x(LOGICAL,50)@0
    assign addr_10_writeHit_and_x_q = addr_10_cmp_x_q & busIn_write;

    // mm_reg_10_x(SYNCREG,8)@0
    assign mm_reg_10_x_a = busIn_writedata;
    assign mm_reg_10_x_b = addr_10_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_10_x ( .xin(mm_reg_10_x_a), .ena(mm_reg_10_x_b), .xout(mm_reg_10_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_10_x_v), .clk2(clk), .aclr2(areset) );

    // addr_10_readHit_and_x(LOGICAL,49)@0
    assign addr_10_readHit_and_x_q = addr_10_cmp_x_q & busIn_read;

    // addr_9_const_9_x(CONSTANT,22)
    assign addr_9_const_9_x_q = $unsigned(10'b0000001001);

    // addr_9_cmp_x(LOGICAL,21)@0
    assign addr_9_cmp_x_q = $unsigned(addr_9_const_9_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_9_writeHit_and_x(LOGICAL,48)@0
    assign addr_9_writeHit_and_x_q = addr_9_cmp_x_q & busIn_write;

    // mm_reg_9_x(SYNCREG,7)@0
    assign mm_reg_9_x_a = busIn_writedata;
    assign mm_reg_9_x_b = addr_9_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000000), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_9_x ( .xin(mm_reg_9_x_a), .ena(mm_reg_9_x_b), .xout(mm_reg_9_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_9_x_v), .clk2(clk), .aclr2(areset) );

    // addr_9_readHit_and_x(LOGICAL,47)@0
    assign addr_9_readHit_and_x_q = addr_9_cmp_x_q & busIn_read;

    // addr_8_const_8_x(CONSTANT,20)
    assign addr_8_const_8_x_q = $unsigned(10'b0000001000);

    // addr_8_cmp_x(LOGICAL,19)@0
    assign addr_8_cmp_x_q = $unsigned(addr_8_const_8_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_8_writeHit_and_x(LOGICAL,46)@0
    assign addr_8_writeHit_and_x_q = addr_8_cmp_x_q & busIn_write;

    // mm_reg_8_x(SYNCREG,6)@0
    assign mm_reg_8_x_a = busIn_writedata;
    assign mm_reg_8_x_b = addr_8_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000010100111), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_8_x ( .xin(mm_reg_8_x_a), .ena(mm_reg_8_x_b), .xout(mm_reg_8_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_8_x_v), .clk2(clk), .aclr2(areset) );

    // addr_8_readHit_and_x(LOGICAL,45)@0
    assign addr_8_readHit_and_x_q = addr_8_cmp_x_q & busIn_read;

    // bus_selector_opt_lev0_id0(SELECTOR,59)@0
    always @(addr_8_readHit_and_x_q or mm_reg_8_x_q or addr_9_readHit_and_x_q or mm_reg_9_x_q or addr_10_readHit_and_x_q or mm_reg_10_x_q)
    begin
        bus_selector_opt_lev0_id0_q = 32'b0;
        bus_selector_opt_lev0_id0_v = $unsigned(1'b0);
        if (addr_10_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id0_q = mm_reg_10_x_q;
            bus_selector_opt_lev0_id0_v = $unsigned(1'b1);
        end
        if (addr_9_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id0_q = mm_reg_9_x_q;
            bus_selector_opt_lev0_id0_v = $unsigned(1'b1);
        end
        if (addr_8_readHit_and_x_q == 1'b1)
        begin
            bus_selector_opt_lev0_id0_q = mm_reg_8_x_q;
            bus_selector_opt_lev0_id0_v = $unsigned(1'b1);
        end
    end

    // bus_selector_opt_lev1_id0(SELECTOR,61)@0 + 1
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            bus_selector_opt_lev1_id0_q <= 32'b0;
            bus_selector_opt_lev1_id0_v <= 1'b0;
        end
        else
        begin
            bus_selector_opt_lev1_id0_q <= {31'b0000000000000000000000000000000, GND_q};
            bus_selector_opt_lev1_id0_v <= $unsigned(1'b0);
            if (addr_14_readHit_and_x_q == 1'b1)
            begin
                bus_selector_opt_lev1_id0_q <= mm_reg_14_x_q;
                bus_selector_opt_lev1_id0_v <= $unsigned(1'b1);
            end
            if (bus_selector_opt_lev0_id1_v == 1'b1)
            begin
                bus_selector_opt_lev1_id0_q <= bus_selector_opt_lev0_id1_q;
                bus_selector_opt_lev1_id0_v <= $unsigned(1'b1);
            end
            if (bus_selector_opt_lev0_id0_v == 1'b1)
            begin
                bus_selector_opt_lev1_id0_q <= bus_selector_opt_lev0_id0_q;
                bus_selector_opt_lev1_id0_v <= $unsigned(1'b1);
            end
        end
    end

    // busOut(BUSOUT,3)@1
    assign busOut_readdatavalid = bus_selector_opt_lev1_id0_v;
    assign busOut_readdata = bus_selector_opt_lev1_id0_q;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_bitsel_x(BITSELECT,33)@0
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_bitsel_x_b = mm_reg_8_x_v[7:0];

    // out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl(GPOUT,13)@0
    assign out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_bitsel_x_b;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_bitsel_x(BITSELECT,35)@0
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_bitsel_x_b = mm_reg_9_x_v[2:0];

    // out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl(GPOUT,14)@0
    assign out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_bitsel_x_b;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_bitsel_x(BITSELECT,37)@0
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_bitsel_x_b = mm_reg_10_x_v[0:0];

    // out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl(GPOUT,15)@0
    assign out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_bitsel_x_b;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_bitsel_x(BITSELECT,39)@0
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_bitsel_x_b = mm_reg_11_x_v[0:0];

    // out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl(GPOUT,16)@0
    assign out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl = prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_bitsel_x_b;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_bitsel_x(BITSELECT,41)@0
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_bitsel_x_b = mm_reg_12_x_v[7:0];

    // out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl(GPOUT,17)@0
    assign out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_bitsel_x_b;

    // prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_bitsel_x(BITSELECT,43)@0
    assign prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_bitsel_x_b = mm_reg_13_x_v[11:0];

    // out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl(GPOUT,18)@0
    assign out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl = prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_bitsel_x_b;

endmodule
