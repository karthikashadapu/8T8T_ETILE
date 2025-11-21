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


`timescale 1 ps / 1 ps
// baeckler - 06-06-2012

module eth_f_reverse_bits #(
	parameter WIDTH = 20
)(
	input [WIDTH-1:0] din,
	output [WIDTH-1:0] dout
);

genvar i;
generate
	for (i=0; i<WIDTH; i=i+1) begin : lp
		assign dout[WIDTH-1-i] = din[i];		
	end
endgenerate

endmodule
// BENCHMARK INFO :  5SGXEA7N2F45C2
// BENCHMARK INFO :  Max depth :  0.0 LUTs
// BENCHMARK INFO :  Total registers : 0
// BENCHMARK INFO :  Total pins : 40
// BENCHMARK INFO :  Total virtual pins : 0
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Comb ALUTs :                         ; 1               ;       ;
// BENCHMARK INFO :  ALMs : 1 / 234,720 ( < 1 % )
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XbXjb2IplDjLDZ4Ont7KC2SHtU3CMidLQFFzZsOKJcGASvsixhF1/5aA7x6E6JLchQh+z1GGQuvXX+llygrliWX2BMfF/nHwGhkNQYhQXGYCyu2qLC6M5MuRNV/aaKOQHxQ7MknmaBlv1q9Si4Wx4/z4lDk3TI26ZbQTuu10gzlCjvdE+X88C9SVI134SIeKsDTdTHOq3b2+KHLSyudnZ6b/LnbYjp2HtWScWyYy3GVBVcgu5hb+VvAnyrxYgzWwv66RKa9qz/vXMmHQrK4bNHT+KsxhjMD6LWAaObXM3To2gq1bp5NhdZMpORLCnoG3OEH8Q5JbTIPNSC3EJrqV0UAZpVREDiw1Htnlr0yHuvtS/HaZLb/Mml0T0Y5M/q27pb9zGJ8Dd8EgU6sUJ5urLxEx9Nnn7DIjxUI4w65JUOS4Jy5Z70eK9ytAweEP/NjzsLLckvwE/fjyc5CYFqGFW+X6uPgvYTaY7Pq2Xg/A2FguyIxeu8l1ePX5/Twtck17QrkYriOvuTBtqR4bDgRQpJJANr9szv4+H/SHgfymwZf60u3Qcmn4eB/ia2pIKctE2So/93KjSjjL1HnpWBox5orrOLGgoNTjkhrQVx0lcv0zSQ68vczVhQ6iG70TTVzpzjp1p9Ekv8xR8SP5ffjxb0KB7PnNFTEuHrIg9LGwk5JKnfU+AbpApgtsm0nZiBgxxU20Cq4KQtnNOPdDDo09OJDxxGTG52oGrB/a96U5KHo8Le+UYlo2Mu8+zYPO7QhLBJrNeOV+QjKiI64Jl+yzq+e"
`endif