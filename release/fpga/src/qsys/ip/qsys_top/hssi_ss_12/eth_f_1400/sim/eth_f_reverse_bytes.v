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


// $Id: $
// $Revision: $
// $Date: $
// $Author: $
//-----------------------------------------------------------------------------

`timescale 1 ps / 1 ps
// baeckler - 10-15-2012

module eth_f_reverse_bytes #(
	parameter NUM_BYTES = 32
)(
	input [NUM_BYTES*8-1:0] din,
	output [NUM_BYTES*8-1:0] dout
);

genvar i;
generate
	for (i=0; i<NUM_BYTES; i=i+1) begin : lp
		assign dout[(NUM_BYTES-1-i)*8+7:(NUM_BYTES-1-i)*8] = din[(i*8)+7:i*8];		
	end
endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XZ79i3OaLASyd4y8HBVCgwbxT2y/CMKbVHsaMqssn8bmzuVdIyf0yejX/PrmShufgtryf24xKDHAvIkgc4AYPeR7FuYUJCM1NwojTQVkcX/eNU+CDoKwpgbfGF8e0SItph+D8RwOkSS0kE04930PZwnFIUwWpu0EsZHSA4Yr207LIv662i7uiJagPIdUSphcHAG2hQGOCAR/4Ho7hVa8g8V1yqPxs1YBkk3U0a+qs9Cx+PKRLM2mCKH2s1CBBHsFyK13rPp7+SwPwFYNU1rp5VOB2acO7i/QscQ2xfYpsojTQhdkqOBX4EiMI7sjIsiodm7PN0LUhRsPU/LrXENx6WzN/zgG8CKDk7MQDyV34trnUOMeuGKWk0sYAS7KyZnvrM+bbWAnVcjGpSpN2PBmpAbfcPBRzB3cG1gs/4F67hGMcyDtzkotM7/d6eCJ3JSSsScubU9XMzpyEB646GOUnuyUrXjWF+6h7ijibjpIIYWeXZsKWNbLBBEWAfUACn7uSwzmumlJ8HNBUXFZHHWW+G+ki1YLe4HzOd8lPFHVUOjkBB4eDDL786QQ0s/0l5uHUqqnpNRgBtD+UX8v38K0M2YoSggdNu3tH91JGk455KLDpgc9rF0J5JIi11C4lXCF6KTAuVakYw0aZ98o9xmO4gt/srE+4FSWnLSPjoiM74QfHvM5Gx+C85o0v6RYCobIJ1qLwdFlH1b7zV/ZCQgJk/G6yieRxHQNqxNGh2wiglylQjvOcS98FgWNXgiOAEDL/DK1BlNGA+jeDD9sZ5xu7Wt"
`endif