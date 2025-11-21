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
module eth_f_50g_tx_pp_data_rotate_3to4_async #(
    parameter WIDTH = 8
) (
    input   logic                       i_clk,
    input   logic   [1:0]               i_rotation,
    input   logic   [0:2][WIDTH-1:0]    i_data,
    output  logic   [0:3][WIDTH-1:0]    o_data
);
    localparam BLANK = {WIDTH{1'b0}};

    always_ff @(posedge i_clk) begin
        case (i_rotation)
            2'd0 : o_data <= {i_data[0], i_data[1], i_data[2], BLANK    };
            2'd1 : o_data <= {BLANK,     i_data[0], i_data[1], i_data[2]};
            2'd2 : o_data <= {i_data[2], BLANK,     i_data[0], i_data[1]};
            2'd3 : o_data <= {i_data[1], i_data[2], BLANK,     i_data[0]};
        endcase
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onol7wrElB+aYS79Ixv0Lqz4ufl3noPKo+7MSxi59pU5yd2lF3gV647Vu/FVo4xAPerNx8cD5HRPdwcMap1xXKFMJc6FLmYFUnLL4qiIHbbL8x6nEM64rDKxhp+nUYxil8+ab6XrSa13H1fn8kp2Dv2w3YoUgUqQAf7YlaWxOU+JDvuRlX9+rat31fptTD++IcY35VeFHB4C/KzpEQRitVFMtscZLJsQGdGF2emuUZGOWCgEgztZmPxW8ZCWq+6n4xHVbTnV7nqS4ImJbvZCkc7TbJYR12buY+Z6HZX9n3+EBlNrW6VTlbLbhRtrwsCgH0imMhNpfDq0Domfsi+seIpABSyreMjLyZvI5pWHFcj0FoemIwfNIsdaPdjCD/RwpNEUJXnfrhkQOOtPpxJqjdJTtR6vEJoJzq7NOoDLSpZ9p+8TLq55Eg+Xl5sQGUFg7ADNKqZcCqaV3w05Nxg2OZHk2SQiLnXkcd1Nd0h0XroCluA1JkT2061krj+YdIuROOR6d3dnFWmFAZI8xZ0dlgp4mTO99KqdTExqsT+NSdyRE79HmAgmknm0bXTZ0qoCa1OFR9Wgutd0Q1FGvefq86hEG6htH30lG5rq9O0DtnDDETK/JAvwQYeDFjU1q5HrRHN9zxZkXgL8oaU00U9LK7I74tniOGPlBV6z8YKZJEQqURuKvB4nAuZR+nij6dJ3id2JVZ+X/64IRM4VvPJLS74xU4hnWy67T8ZU9euM3VVcVNSNXUytlxsGKuqjUscS2b8Ast1wOVloRpgjcRIGuBkn"
`endif