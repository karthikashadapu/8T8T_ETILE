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
// baeckler - 01-20-2010
// weak meta hardening intended for low toggle rate / low priority status signals

module eth_f_multibit_sync #(
	parameter WIDTH = 32
)(
	input clk,
	input reset_n,
	input [WIDTH-1:0] din,
	output [WIDTH-1:0] dout
);

generate
genvar i;
for (i=0; i<WIDTH; i=i+1)
begin : sync
           eth_f_altera_std_synchronizer_nocut #(
                .depth(3),
                .rst_value({WIDTH{1'b0}})
            )  synchronizer_nocut_inst  (
                .clk(clk),
                .reset_n(reset_n),
                .din(din[i]),
                .dout(dout[i])
            );
end
endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XabhDmHNOBRTpeTQiA11PYlfXV2i4SmVRMAvecXA4ce3pi01nWKztSDgbXkEoBbOP00WlMcdn5y1HRliybOHD7Tr9An5MRClRcRsFby8A1/UhI8LuIeDiyVbs2DiqklkDzbx3RFpXjwnoYKn5x0gE89nIkkCYpmPo58yCH8gNEx0yJszdlSiTBViaXSr406qWboe0VVqYgLzTuAVyj/KG5pnPgllK7Cm2cjbiAKevqJ+J9NkobKb37Z2IZXkk97Gryu4Nq7S5Xxo/xhsAbhdY4KKY+XhzSKkGLd4B+rV5W8+bLD2kgk/pBUIyQKPSn40on00RVUs3TG5GQPB1s3EO8p82qaqpMgrjtMg+qfzrBabT/Kp7wQmh3dkw89BSVqWOkDmg4bLnv2/QlgMbhLgRPgkD/coMuXFYhS7sW3taItsY5CLuJ1YtNxTsHeqU0LLnWn/61mupX+r569jHAKS0DnGttWl4VXp6W9KCkmlzKKoWONZOofdD+o8sJmoeyJffvZGpYCHenESDSv/oLlwS+n7RA/s7srnF7ykMJizChOv7kIT+M9Yrvku+UBsLSs4OqKG5XAdFTcIlz9HvWIL4CJLjlYXbnKn2zSAvwB23Ua2ndxOGOZ9eqrKV1GDWEGcc0BYEjCNcA/rwFtz3SIz3QO+Ayx87tP6s0Mky88LsCVOz+2kecI8GPPQFgElr8gXwbDH5nRRscDeUiDmxt82S+aaPNMTYIFjTHdGXJAgwHTcC1WcLKksoi7w2zkQO8yKCrQ37Fv5NdDVINu74BN8VZB"
`endif