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
module eth_f_rptr_gen_tx100a (
    input   logic               i_reset,
    input   logic               i_clk,
    input   logic               i_read,
    output  logic   [0:1][4:0]  o_read_pointers,
    output  logic               o_rotation
);
    logic   [0:1][5:0]  phase;

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            phase[0]    <= 6'd1;
            phase[1]    <= 6'd0;
        end else begin
            if (i_read) begin
                phase[0]    <= phase[0] + 6'd1;
                phase[1]    <= phase[1] + 6'd1;
            end else begin
                phase[0]    <= phase[0];
                phase[1]    <= phase[1];
            end
        end
    end

    assign o_read_pointers[0] = phase[0][5:1];
    assign o_read_pointers[1] = phase[1][5:1];
    assign o_rotation         = phase[1][0];
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onpWJVf0MsUVrNoWQ1AHOi7u4HJtbZlDTFrHIC8wXWy448gpiuuRlkWBvC1xd+pQy/sPzM7NQq9JLtH9/3jqaU1Kp6iB5KWnLMTI4As+9/R6Csof771NV8dk7jC5oSWNGr4rHvfUkDWkV+8y50CT5RuQQ+K8SNqQxKNh6NRfoxH2wfEcc2agc7iLD5UAbZZLBghyeou0YDmqX8WFhmK95r/R1IqwaY8SSklvZ9DjrXFUBfld8LIKVXSWx9iI++vFvxu9H2LisUzs/r/brOF2fEeEPI0Ci9AGIyOcKp0UcRIQ/4I7+qDru4pycD+I1ljx2QKWqKjd3Hib6iqXllpenZXc9I4TINieNuLJkBWbw5UO97PEenavBYcRoMXraAvJibJcYVrGpORUkhPRUOIJhi8rPmC3ZqZC5Z5X8wHtFqjjrHwkLwsnMArSiWf51kNSfW3Ddrf0by0iUPw8pf9gV+Qg62A6+8gGKqgw/sWFZg/eV/o0rDzRD1K0VW0FUTY1IOiqvgL3OTkg+Mf+Z8SXtO1aVCo6+1P1IYs0pXRS9qWtb2JZ0ivT0eYSqrIH/vHQdzuSdKYxduZEB1hYZU1CaNebIhb0USp2cotM3rfJIB8O/5/cd9/lpvi8/YcHPOroiNZHw5Q5A9rWh7YfXnAH86GnCVK/yVwJGPzHAQ1wLarQkk3FhBBVOAitUf2zF8p4yLyLcD9/+q2SU35ZHtEVQJKfUTK231Ywcer1GCj9ThPJlJhPlkmet9heyw2qwN+s6lZ+dG8ym/zhmYrurLoCMnXf"
`endif