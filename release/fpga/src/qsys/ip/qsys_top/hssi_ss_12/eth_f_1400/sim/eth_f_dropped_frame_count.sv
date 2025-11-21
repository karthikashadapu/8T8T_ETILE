// (C) 2001-2024 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module eth_f_dropped_frame_count #(
    parameter LANES         = 4,
    parameter FRAME_MARKERS = "sop"
) (
    input   logic               clk,
    input   logic               reset,
    input   logic               clear_count,
    input   logic               valid,
    input   logic   [0:LANES-1] inframe_unfiltered,
    input   logic   [0:LANES-1] inframe_filtered,
    output  logic   [63:0]      dropped_frames
);

    logic               valid_delay;
    logic               if_last_uf;
    logic               if_last_f;
    logic   [0:LANES]   if_vec_uf;
    logic   [0:LANES]   if_vec_f;
    logic   [0:LANES-1] edges_uf;
    logic   [0:LANES-1] edges_f;
    logic   [2:0]       frames_f;
    logic   [2:0]       frames_uf;
    logic   [2:0]       drops;
    logic   [2:0]       valid_drops;
    logic               clear_count_int;

    eth_f_delay_reg #(
        .CYCLES (3),
        .WIDTH  (1)
    ) valid_delay_inst (
        .clk    (clk),
        .din    (valid),
        .dout   (valid_delay)
    );

    assign if_vec_uf = {if_last_uf, inframe_unfiltered};
    assign if_vec_f  = {if_last_f,  inframe_filtered};

    always_ff @(posedge clk) begin
        clear_count_int <= clear_count || reset;
        if (FRAME_MARKERS == "sop") begin   // Use SOPs
            edges_uf       <= ~if_vec_uf[0+:LANES] & if_vec_uf[1+:LANES];
            edges_f        <= ~if_vec_f [0+:LANES] & if_vec_f [1+:LANES];
        end else begin          // Use EOPs
            edges_uf       <= ~if_vec_uf[1+:LANES] & if_vec_uf[0+:LANES];
            edges_f        <= ~if_vec_f [1+:LANES] & if_vec_f [0+:LANES];
        end
        frames_uf       <= count_ones(edges_uf);
        frames_f        <= count_ones(edges_f);
        drops           <= 3'(frames_uf - frames_f);
        valid_drops     <= valid_delay ? drops : 3'd0;
    end

    always_ff @(posedge clk) begin
        if (reset) begin
            if_last_uf  <= 1'b0;
            if_last_f   <= 1'b0;
        end else begin
            if (valid) begin
                if_last_uf  <= inframe_unfiltered[LANES-1];
                if_last_f   <= inframe_filtered[LANES-1];
            end else begin
                if_last_uf  <= if_last_uf;
                if_last_f   <= if_last_f;
            end
        end
    end

    eth_f_accumulator_64b_4c acc0 (
        .clear  (clear_count_int),
        .clk    (clk),
        .din    ({61'd0, valid_drops}),
        .cin    (1'b0),
        .dout   (dropped_frames),
        .cout   (/* unused */)
    );

    function automatic [2:0] count_ones;
        input   logic   [3:0]   din;
        case (din)
            4'b0000 : count_ones = 3'd0;
            4'b0001 : count_ones = 3'd1;
            4'b0010 : count_ones = 3'd1;
            4'b0011 : count_ones = 3'd2;
            4'b0100 : count_ones = 3'd1;
            4'b0101 : count_ones = 3'd2;
            4'b0110 : count_ones = 3'd2;
            4'b0111 : count_ones = 3'd3;
            4'b1000 : count_ones = 3'd1;
            4'b1001 : count_ones = 3'd2;
            4'b1010 : count_ones = 3'd2;
            4'b1011 : count_ones = 3'd3;
            4'b1100 : count_ones = 3'd2;
            4'b1101 : count_ones = 3'd3;
            4'b1110 : count_ones = 3'd3;
            4'b1111 : count_ones = 3'd4;
        endcase
    endfunction
endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onpV9HTmzKq1KBRin8p0EN9P42oJayCGpvQHv9QgziOzFDgkn9OMeMmv5pvqW3Ysow9OQliyZOt+h7ME5IivH/OkKppkW1sSVMVO+f1LyiSSDQXpCOkFzR5ftpy/vRy5slGaYytH18qr9QWjJmXUrfEZwjKMQ5QHSf2At+1PG2GJRvZIJprjbP5DSU+UdIQ+sECjv8dbsoUVNiT+y2jcZbdhw2HcemEWuyqE2Py8sd5DgqFh36dVsqLJIJweQ2zh58fTxSGa9CcaFYLe/kx3nR8Yc7OkavK6Mg2EGZreJiS1UObfNbDhQLAFqng+ramPlMB/79M9VuFPrRAD7hFYm3luH9eFBcNq49as4vXjamvIROvcbIW2o9he9NTATUydjanKr1LfRXp6oTxVpaWMvhk3MdxWOvQH4tN/G74ud8zaLYfC2oNlt5OFINfaoo05X9lBStXJ6pVIDpUIoN9Hf1fKaRxxqG+Lfvr+wAY2kT2RTbx1FvRNGA9mu0AytrpZzb/0KUsXLCQrF22IcuMRp/YtoM/8QPTl6Ucm7n1Yzc1Z2VOIDELXEtYt2mdw5JfcX5u5lfcITeaGyA7O8I1XLTbAloKeV0uS9ubH9xaS4Ew7xdmrNtSCg7TUwBWFntFzc8HUmU2pk0ceQS2psbEQJjeLtgKsiQS2UY+rgadpBNaEOrRwwOR5wGfM+BJWQNKDi2cBWaDTlNj5+WAw/utOBosO5HW2THKJc2gZNu1+nmUn0SSZxHe/O561bfuUys5fRvYb31nJtriaf9zvuIlQtK3h"
`endif