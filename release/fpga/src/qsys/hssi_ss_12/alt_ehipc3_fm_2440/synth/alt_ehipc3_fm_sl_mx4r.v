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

// DESCRIPTION
// 
// This is a registered 4:1 MUX of N bit bus.
// 

module alt_ehipc3_fm_sl_mx4r #(
	parameter WIDTH = 32
)(
	input clk,
	input [4*WIDTH-1:0] din,
	input [1:0] sel,
	output [WIDTH-1:0] dout
);

reg [WIDTH-1:0] dout_r /* synthesis syn_only_preserve */;
reg [WIDTH-1:0] dout_w /* synthesis syn_only_keep */;

assign dout = dout_r;

always @(*) begin
	case (sel) 
		2'b00 : dout_w = din[WIDTH-1:0];
		2'b01 : dout_w = din[(WIDTH*2)-1:WIDTH];
		2'b10 : dout_w = din[(WIDTH*3)-1:(WIDTH*2)];
		2'b11 : dout_w = din[(WIDTH*4)-1:(WIDTH*3)];		
	endcase
end

always @(posedge clk) dout_r <= dout_w;

endmodule


// BENCHMARK INFO :  10AX115R3F40I2SGES
// BENCHMARK INFO :  Quartus II 64-Bit Version 14.0.0 Internal Build 145 02/20/2014 SJ Full Version
// BENCHMARK INFO :  Uses helper file :  alt_mx4r.v
// BENCHMARK INFO :  Max depth :  1.0 LUTs
// BENCHMARK INFO :  Total registers : 32
// BENCHMARK INFO :  Total pins : 163
// BENCHMARK INFO :  Total virtual pins : 0
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Comb ALUTs :  33                 
// BENCHMARK INFO :  ALMs : 33 / 427,200 ( < 1 % )
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : -14.474 ns, From (primary), To dout_r[23]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : -15.819 ns, From (primary), To dout_r[23]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : -17.579 ns, From (primary), To dout_r[30]}
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B1GEGfBnZY023Lnu+Aq8xiSvJ3m6mDi+Jm8al4q+TVF7xGKAESmFYdOFJXdWhZRewDDLEsg04FHX/r8LwvhdJN555hTfOokYK9kjF6iTcYSbG1CewOVznXni7RDOeskp8GrvX47tIr4xEFuA3DimEVE5tw6ka0bindb2iP99n6QkJeDo6pqHT7c+gFOruRSht/eoRE+81KgWuawfsQUyxASvJkXg1tRdfJwQ49V3toVhI4TGJoesJdxq18Mjtj00ThnzQ0LA6x+EuobQynbqOequCKNUvIwy5jruqjkPDFo0OOl98e6EBp/Z9j8q4NtF9EKabihLYk0x0UV6p1X5380zhf5HJbKhsCoNYnY5oPDDsmwim5I76QwB/LbjgWpTAC3X85LHVM5+WBJurqxF+tGMe1M+T7KjeX+YwaDwTEQVMidDG5UVpNb9kw+dQOPS6QromtFbOnCCFyHpfY3LYMcP5kumvK5PL9ACrPuNcYuDnjKA3phLJnYD19Ws+Qerxz5txfV8jJ7vkr85Ve09pvtn8Qaq9ctzQiKuoHfY+05JLDinsXnDer3tM3rcocF2uBMH2r8A5ExgZmV8RFopTl/RF8s2EKr3rPbM+VQTHUWEhtEwB5w92sI0yAJj6h+6ASeI3A7jT4+Pky1TTfJfjn4wIAN6PPZCr08xVgoMTBlsHZ0hpTqUbtJCAanY4OTSbZ7JFYRPp6KjZos/UyR94vwY7k1mtYaA157Cwd86b0oBTyevjNsmhl03u7sagV7Vhgn7+0OF1QKjuwsf4HPf724"
`endif