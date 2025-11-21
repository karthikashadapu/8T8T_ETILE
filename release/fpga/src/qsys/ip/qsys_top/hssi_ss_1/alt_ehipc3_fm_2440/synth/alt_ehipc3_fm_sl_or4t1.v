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




`timescale 1ps/1ps

// DESCRIPTION
// 4 input OR gate.  Latency 1.

module alt_ehipc3_fm_sl_or4t1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [3:0] din,
    output dout
);

wire dout_w;
alt_ehipc3_fm_sl_or4t0 c0 (
    .din(din),
    .dout(dout_w)
);
defparam c0 .SIM_EMULATE = SIM_EMULATE;

reg dout_r = 1'b0;
always @(posedge clk) dout_r <= dout_w;
assign dout = dout_r;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B3y+iUyMo7vMypL+/N6BLZXEYWSJXD/+2AAwQSRFuv9Nij6MSgIuvcCVp8dyDXz7GOo+1yj9czgRH+Otm2Jbd4m6DCDYlsC1iK1sMgDDUDLwwNwacn8ihGm6tah4KGRuiM2YgD1XiWeYjn1hqnhWNlmxfHQJzeEGzqwP/jv5AnD0Y9y7CXxXvMTWe92mSYqpy1n4Ev5toqO24zg3m5M1qg/JZ2uCqdhWtcwuJ6wHt4kfZOvgdyW5RLK/0WZnatLfT0AH9QxFNA+3IazwRY/Uh4QGie1HHQHWbFmbnlkA0x7X3iv2mpw8T5qT+51yVVZWCCn3qJlQbLOWKdxIr8ItiDSJ0k8o7QQ2vF1DsC59tLawqPs5Ci0U77fYfx+ABhbXWBF5P9mEOJ3AnLQ2Z1jwIUGKOR2+x/NB6m8+2H5Xg+dRojhKqZL5RMG60AXuvtyfaJza4TMzlY4QhbUWSmuAVgZzIuRFwhxxroSa6XZ376nt282+WRAh5lhstR9Q8eeq2RyOBrDIptI1Pdv3ZJfJeTI93lD1HXPhvVeiVifq/XGM5dS5zN4+ykBJGVZZZbUwzafoZLwg+4GvndFJv3OngWpZ3uvA+eJkvhJbvP6ABY2uoytt8f3hNlLQBnt4zqlJB013vur3YkbvE4z7tztAi2/GRm70lCGbjEdsBjoE5+Un9DvOz/snVe4kTfRJmIM/cBt4m6PTxBCjbcqVNpeejyUgOs/2JYOYdALh41UHxUeY8/1BzuA25hGOJYnEa3KdYtjF8k06r89IeWZOT9EkrNA"
`endif