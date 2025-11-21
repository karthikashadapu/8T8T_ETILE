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

// SystemVerilog created from busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz
// SystemVerilog created on Thu Jan  9 15:34:39 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz (
    input wire [31:0] busIn_writedata,
    input wire [13:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    reg [31:0] bus_selector_q;
    reg [0:0] bus_selector_v;
    wire [31:0] mm_reg_808_x_a;
    wire [0:0] mm_reg_808_x_b;
    reg [31:0] mm_reg_808_x_v;
    reg [31:0] mm_reg_808_x_q;
    wire [0:0] addr_808_cmp_x_q;
    wire [13:0] addr_808_const_808_x_q;
    wire [0:0] addr_808_readHit_and_x_q;
    wire [0:0] addr_808_writeHit_and_x_q;

    import duc_model_DUT_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // addr_808_const_808_x(CONSTANT,8)
    assign addr_808_const_808_x_q = $unsigned(14'b00001100101000);

    // addr_808_cmp_x(LOGICAL,7)@0
    assign addr_808_cmp_x_q = $unsigned(addr_808_const_808_x_q == busIn_address ? 1'b1 : 1'b0);

    // addr_808_writeHit_and_x(LOGICAL,10)@0
    assign addr_808_writeHit_and_x_q = addr_808_cmp_x_q & busIn_write;

    // mm_reg_808_x(SYNCREG,6)@0
    assign mm_reg_808_x_a = busIn_writedata;
    assign mm_reg_808_x_b = addr_808_writeHit_and_x_q;
    dspba_sync_reg_ver #( .width1(32), .width2(32), .init_value(32'b00000000000000000000000000000010), .reset_kind("SYNC"), .implementation("ASYNC"), .pulse_multiplier(1) )
    mm_reg_808_x ( .xin(mm_reg_808_x_a), .ena(mm_reg_808_x_b), .xout(mm_reg_808_x_q), .clk1(bus_clk), .aclr1(bus_areset), .sxout(mm_reg_808_x_v), .clk2(clk), .aclr2(areset) );

    // addr_808_readHit_and_x(LOGICAL,9)@0
    assign addr_808_readHit_and_x_q = addr_808_cmp_x_q & busIn_read;

    // bus_selector(SELECTOR,4)@0 + 1
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
            if (addr_808_readHit_and_x_q == 1'b1)
            begin
                bus_selector_q <= mm_reg_808_x_q;
                bus_selector_v <= $unsigned(1'b1);
            end
        end
    end

    // busOut(BUSOUT,3)@1
    assign busOut_readdatavalid = bus_selector_v;
    assign busOut_readdata = bus_selector_q;

endmodule
