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

module eth_f_reverse_2bits #(
	parameter NUM_SYMBOL = 32
)(
	input [NUM_SYMBOL*2-1:0] din,
	output [NUM_SYMBOL*2-1:0] dout
);

genvar i;
generate
	for (i=0; i<NUM_SYMBOL; i=i+1) begin : lp
		assign dout[(NUM_SYMBOL-1-i)*2+1:(NUM_SYMBOL-1-i)*2] = din[(i*2)+1:i*2];		
	end
endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XZrQBvcVRpmDJk6DScgsur5puUcGkIQdl93xmD4z0+KHyTeyb5iFrq6bTFTfoJhM+z39bLCM9NRukDplLIBRgzy7o1l4MprYiEe5DLaxGP29CMRhLRgFqvV3W0FdisrmbLb6xXUOMum3rW3jM1oHarxtjXbrtRyLCWn3+AKWVk/FVVkAwdAVlwBLFBbb6ZTdnb9rK8k/w6vFGxNX3jNHfzKG9ozBt7AcdAZ3IarpiP4BF/id1hZ/YrVxkMBcB10R6Z6lT/Hfsrm+4WQCvzUBTL0f7lLBAtzP33LBDfZ9+b5CUcJgMy2zJiEwn/1YyWrFBbyqjJI7qP4mV+Usm+XsHyFGMSt/FxzabNSoauVsydT5cKEqjcnapggmDJOsav3xzfOgmnf348NuC2MmJXopFVaQgPYG5EEiopLsby687pnqxs+l4zR+47z0KhvcuGzYu2D7yIdjOZFkzWNy2l3Z6ySuWcUmI+k7OzVbN2l7jjlcHPks3mU55iqE7VHvzfJySeCgWUw0xobWQZOwWwbwhxZmsdzdwHKaTG6MwQjrK5PXvWmMVjJkCIzYJZGiHGq5SoipXTb2UVkw391oqi4mvyoJJfWN1dZU4Y0+em9orM+jCiQRdEUb6X7GfkonjbnRYIk35aGZqIJ45QULObFwrnmkWcSpAjEoG5qvoxx5N6DpWqED41wX/4SUTY7RcQsLs7qR3L1ptbGXRdVarp2iGc1o5MHwTmGEJdteuGrroB/0+FZJsBkNelyYKqCkjPgo2gfQRGd1LnOouNUIWJA+LY7"
`endif