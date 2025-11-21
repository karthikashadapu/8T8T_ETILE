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

module alt_ehipc3_fm_100g_adapter_wptr_addgen (
    input   logic               i_reset,
    input   logic               i_clk,
    input   logic               i_valid,
    output  logic   [0:1][4:0]  lane_ptrs,
    output  logic   [0:3][7:0]  mem_ptrs /* synthesis dont_retime */
);

    logic   [0:1][5:0]  phase;

    assign lane_ptrs[0] = phase[0][5:1];
    assign lane_ptrs[1] = phase[1][5:1];

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            phase[0]        <= 6'd1;
            phase[1]        <= 6'd0;
            mem_ptrs[0]    <= 8'd0;
            mem_ptrs[1]    <= 8'd1;
            mem_ptrs[2]    <= 8'd2;
            mem_ptrs[3]    <= 8'd3;
        end else begin
            if (i_valid) begin
                phase[0]        <= phase[0] + 1'b1;
                phase[1]        <= phase[1] + 1'b1;
                mem_ptrs[0]    <= mem_ptrs[0] + 8'd4;
                mem_ptrs[1]    <= mem_ptrs[1] + 8'd4;
                mem_ptrs[2]    <= mem_ptrs[2] + 8'd4;
                mem_ptrs[3]    <= mem_ptrs[3] + 8'd4;
            end else begin
                phase[0]        <= phase[0];
                phase[1]        <= phase[1];
                mem_ptrs[0]    <= mem_ptrs[0];
                mem_ptrs[1]    <= mem_ptrs[1];
                mem_ptrs[2]    <= mem_ptrs[2];
                mem_ptrs[3]    <= mem_ptrs[3];
            end
        end
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B1kx3hHOYh4D6Hzv2HbKM1FWjqvuZ7jn/bKSnLp10RhpaAh5BN7Z7p7/dcYJL/soO1gEG0exHWoF+FEpBHvuy0i/UZ5C1vsS+1NIyVH4Nyzg6Bx8O6B+hk6RTyO6rg21HJAcdZu3HZCTYsakXTIZkVMDOJgUWLWiFht11j95Ya0PWOuKlbvZMS5wA6Z2cKrKkGMKGejbKK0xqfpwJerZO3E5XOKUw4c0tHyGh5ouwuFEAQUq7BCFoMNWJEqIjoHcd97tdXPdg7+gp5LKNrgeouGw0exjG2e/1IMM9Bd6vFGnuXs3OdRjGsjs9KiYw4Uf0nssoODfRzXf/w5O4htdoTEUtNB56E6a7U1oSPfSCvUQqhC34vqxG66iyOUM/zI7/Id26TR1LHRvIqf/LmAXxNc01+0wbqDqyx1yyX4SdEmHsc7WUvNS+CreI7MSB5tNSI+OeotGAXMPv/9G4LzbHpZaJu0j0q4U855aCkKvu+r4rSkht6XwNDxGdI7BgVuc9i/tQ8LtAUqLI4rI7RXcH22zxyEIFqRVnLcW8h8SO6ZVTAaAZDj5NArbtOI5HXhNmLJxpoXH9ey8+gHK1N9qWNWLs/Sc8KPlxcnvvG55DCr78y5RraA3fZrb0WUZ6vr8e6o+blmcbooVkcc9F+jBXknYs1wRz12+yRKz7wyEwHcLJ1udxRgLKf1SsW62kqfItFHp0XD6dikSlDLGUmnHrHLSY8fdbs2JwjcGx5avmKYobK+mg/eLG4qx5GvXQWQQd/cVCvxPFlOyrn3MMxGoe8a"
`endif