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
module eth_f_wptr_gen_tx100a #(
	parameter INBLOCKS         = 8, 
	parameter OUTBLOCKS        = 4,
	parameter MEMBLOCKS        = 8,
    parameter MEMDEPTH         = 'd32,
	parameter EHIP_RATE        = "100G",
    parameter PHASE_VAR           = (EHIP_RATE == "100G") ? 8'd7 : 8'd3
	)
	(
    input   logic                                            i_reset,
    input   logic                                            i_clk,
    input   logic   [OUTBLOCKS-1:0]                          i_num_write,
    output  logic   [0:MEMBLOCKS-1][$clog2(MEMDEPTH)-1:0]    o_write_pointers,
    output  logic   [$clog2(MEMBLOCKS)-1:0]                  offset
);

    logic   [0:MEMBLOCKS-1][$clog2(MEMDEPTH)+$clog2(MEMBLOCKS)-1:0]  phase;
    genvar i;
    generate
        for (i = 0; i < MEMBLOCKS; i++) begin: phase_loop
		if (EHIP_RATE == "100G") begin
            always_ff @(posedge i_clk) begin
                if (i_reset) begin
                    phase[i]    <= PHASE_VAR - i[$clog2(MEMDEPTH)+$clog2(MEMBLOCKS)-1:0];
                end else begin
                    phase[i]    <= 8'(phase[i] + {4'd0,i_num_write});
                end
            end
            assign o_write_pointers[i] = phase[i][$clog2(MEMDEPTH)+$clog2(MEMBLOCKS)-1:$clog2(MEMBLOCKS)];
		end 
		else begin
		always_ff @(posedge i_clk) begin
                if (i_reset) begin
                    phase[i]    <= PHASE_VAR - i[$clog2(MEMDEPTH)+$clog2(MEMBLOCKS)-1:0];
                end else begin
                    phase[i]    <= 6'(phase[i] + {4'd0,i_num_write});
                end
            end
            assign o_write_pointers[i] = phase[i][$clog2(MEMDEPTH)+$clog2(MEMBLOCKS)-1:$clog2(MEMBLOCKS)];
		end
        end
    endgenerate

    assign offset           = phase[MEMBLOCKS-1][$clog2(MEMBLOCKS)-1:0];
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onrbv0a/zGcFMDumrO76NBNal8MLUhtVkDPsRSoc0j1Vgmdb9B00Pg55fULdRzDJITXQqLZ/WsdD/ghSDicBJBDWlfmGLRQk5ajO4YommyhUDzTDKDMwyhXX9bLtBn6apR0IGxnnRc8aiPRVtHkYzRRt3KzcqwF6KmpIY2XBEGfTQA3gAdgcBCHAPrc36XKaENuRnYjzpHme9LOgYJOi/nAFZj7O3bGlX2A3bk1nLLcSRMhRwPhZ7lO0/KfMqOfvXueLs1O3oNcX4YkELwE3fKubNE2Hom5efO26LwXhFfAFgz1JJa/ftaDeX8vaKxeo7JnXCUR452K3djf1KqeedS3tYKrnpo68yxRARinLm5O0ESguaxbM+llS45exvj94jsxAxVkdtQ40RPpePSrcE7+NNJWZz29VfwMYI5QZVmSyTV9c/fA15tAHhGBI5eRMLMraNw3NFchTrx5+Yg3e4z/39IiAZVUuZvOWnnHKrW8ople98FIFbny+zT2/BwRpd56W88TPb7O2ekbGrfrhUWGMM9xUOQePDreaOoI55JdFpLMGQ3f957yBBCrxpR9bE1Tq6niAAjw2g3tVFDiTdR7yC/ROwIxrQIsMCVSOSnTLzCZWlfUV+t08NviJgGMitR7HBjwHWNTUSeOzePSk4kdIlfbKlKg7GRl7Zgu9aEm4AjqKk7MWpHY17ZKOJJkZOjRon6jgGVNT/H0gamzkuy5ttdv0B+Mi/ht1fvIa48U0hkjcVLAf9b9x5p1vZtJLcWfjCcSVNMwoCrKwd+KIVU7r"
`endif