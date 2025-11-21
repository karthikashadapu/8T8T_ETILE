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

module eth_f_delay_reg #(
    parameter CYCLES = 3,
    parameter WIDTH = 1
) (
    input              clk,
    input  [WIDTH-1:0] din,
    output [WIDTH-1:0] dout
);

    genvar i;
    generate
        for (i = 0; i < WIDTH; i=i+1) begin : bit_loop
            eth_f_delay_reg_1b #(
                .CYCLES (CYCLES)
            ) delay_1b (
                .clk    (clk),
                .din    (din[i]),
                .dout   (dout[i])
            );
        end
    endgenerate
endmodule

module eth_f_delay_reg_1b #(
    parameter CYCLES = 1
) (
    input   clk,
    input   din,
    output  dout
);

    generate
        if (CYCLES == 0) begin : g_0_cycle
            assign dout = din;
        end else if (CYCLES == 1) begin : g_1_cycle
            reg state;
            always @(posedge clk) state <= din;
            assign dout = state;
        end else begin : g_n_cycle
            reg [CYCLES-1:0] state;
            always @(posedge clk) state <= {din, state[CYCLES-1:1]};
            assign dout = state[0];
        end
    endgenerate
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XZDiH7omuj/m8QDkPjk9v7ovztEvYl5OxsNWgO6Ic2PMW3+EWEN2qUnurWIY655kjMCbKT4CeihrDAC5r0Yj/Q00gR+TiCREaTSIi/Pi0HYnLAo6KgXZBYJg3FEpTqZF+rlBDMqIp8PiosoAu6gzSJG2q15jV/YTn6VWHBi7XYDcIGjYfW7UPvg4vfNigu61sGLWiuj4OzTeFs4nvP6pMho5MBnHZhtodthxdOczt/ktdN69Pgno8wCrXKB/gPP88nnAAICJAzkpqfWx8xy9wFAFOiihNcC82U6nnrDuEplwSA/j/I9Hq7F7GPMcH8pibQhuR5gjWq5pVp0La1/4fZhB4tlwak8bzFfHsf+qVnCe/ypzEeivXk63JF9evPsWV8R8NhfOR8UEHIDZL4wJGlXuwQGfWxZ0TLzxpa14uNOGDqzbfPDSPCBSximEyIHGLTWtSzv1D685KTH0YVfk2B4o3widbb/dpu4xxiPlwFg2rqcZd3qtRRTkZM6jneX6fSSMZlj+2aSRTKR6iIwvf2bNmVOmCRMPrvvMZohb0edxXEaj0gab4F5fm13efzUXXoUWLCr5Xrz8nwmYWVIKyeKE19JDP6wE4/L2Bq9WMaKUxwnAzHBGsDPJO2XvxkXewm2HEySYX5fVJIMJiqG1pjBcS6GLzPHii6MdDjZKtdmJa2DsxqYsEdkc0AJcN3xtjjNsJPYSIhXS4OAMggYjBr2Zy0EW6Af7mBo6gl4eszB5gQCEzPZBppOKH+5B5WXrIu3KAcNbh38PdDvdFeos5Bt"
`endif