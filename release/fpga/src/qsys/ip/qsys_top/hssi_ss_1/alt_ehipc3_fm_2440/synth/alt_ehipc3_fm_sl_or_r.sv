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
// This is a registered variable width OR gate. Note that the latency will depend on the input width. The
// Verilog contains some very basic factoring heuristics that may need to be expanded in the future.
// Simulation stops with an error message if the requested width requires additional rules.
// 


module alt_ehipc3_fm_sl_or_r #(
	parameter WIDTH = 8
)(
	input clk,
	input [WIDTH-1:0] din,
	output dout
);

genvar i;
generate
	if (WIDTH <= 6) begin
		reg dout_r = 1'b0;
		always @(posedge clk) dout_r <= |din;
		assign dout = dout_r;
	end
	else if ((WIDTH % 6) == 0) begin
		localparam NUM_HEXES = WIDTH / 6;
		wire [NUM_HEXES-1:0] tmp;
		for (i=0; i<NUM_HEXES; i=i+1) begin : lp
			alt_ehipc3_fm_sl_or_r a (.clk(clk),.din(din[(i+1)*6-1:i*6]),.dout(tmp[i]));
			defparam a .WIDTH = 6;			
		end					
		alt_ehipc3_fm_sl_or_r h (.clk(clk),.din(tmp),.dout(dout));			
		defparam h .WIDTH = NUM_HEXES;
	end
	else if ((WIDTH % 5) == 0) begin
		localparam NUM_QUINTS = WIDTH / 5;
		wire [NUM_QUINTS-1:0] tmp;
		for (i=0; i<NUM_QUINTS; i=i+1) begin : lp
			alt_ehipc3_fm_sl_or_r a (.clk(clk),.din(din[(i+1)*5-1:i*5]),.dout(tmp[i]));
			defparam a .WIDTH = 5;			
		end					
		alt_ehipc3_fm_sl_or_r h (.clk(clk),.din(tmp),.dout(dout));			
		defparam h .WIDTH = NUM_QUINTS;
	end	
	else if ((WIDTH % 4) == 0) begin
		localparam NUM_QUADS = WIDTH / 4;
		wire [NUM_QUADS-1:0] tmp;
		for (i=0; i<NUM_QUADS; i=i+1) begin : lp
			alt_ehipc3_fm_sl_or_r a (.clk(clk),.din(din[(i+1)*4-1:i*4]),.dout(tmp[i]));
			defparam a .WIDTH = 4;			
		end					
		alt_ehipc3_fm_sl_or_r h (.clk(clk),.din(tmp),.dout(dout));			
		defparam h .WIDTH = NUM_QUADS;
	end	
	else begin
		initial begin
			$display ("Oops - no pipelined gate pattern available for width %d",WIDTH);
			$display ("Please add");
			$stop();
		end
	end		
endgenerate

endmodule


// BENCHMARK INFO :  10AX115U2F45I2SGE2
// BENCHMARK INFO :  Quartus Prime Version 15.1.0 Internal Build 99 06/10/2015 TO Standard Edition
// BENCHMARK INFO :  Uses helper file :  alt_or_r.v
// BENCHMARK INFO :  Max depth :  1.0 LUTs
// BENCHMARK INFO :  Total registers : 3
// BENCHMARK INFO :  Total pins : 10
// BENCHMARK INFO :  Total virtual pins : 0
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Comb ALUTs :  3                  
// BENCHMARK INFO :  ALMs : 2 / 427,200 ( < 1 % )
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.484 ns, From alt_or_r:h|dout_r, To dout}
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B1yIPk484U7qmCkqYstIWL9S4L4OmKtomO1uBQ2QhMm3HGxbuCbH2eWLYdseGNDohcHHyJVSlpHb8QAQZQvl8RWMUNtTLWWvM5hAakfPLrEaVLs+ejh06jYh5AVo60m0iUFaA7WyHgfuHqUDI2FW7dWNSyCebzUkWHtYYPADFsHXlaB9UGbuiuexq8EkUDu96O2Ic15QMFzHaU8UN0yHLGy93KPWjWg7XtgedRlT2BWzfUqM8U2VonslEN5KlVzrH4cttyc0QYk7L2P0mJZ9wZUIiMdw7+Psxhqc80/G8aGbLIGUYigN1X/LtYpwViBPRoN2C5SHlETb3LCJ+vYtzRYmOYq7NdPEqRZlOz33DMeZXGQmQ92nhiZKZU5LnRBtKF0WYSzs6YfrtdK4sdgy6H+3aQT9xF/8oaBPlcQrLd+B2eDJ5RN1ypuze9myyUUiYWhx3VYMYb1Q7JJvO2nPwE4kLhTR8PFGgk2f0qSsu44OzMVNftK4XRAorBWb3YbRk6mZ10UOIUy2r8vkxfIIbBk1P124ao8I8fMCgKCLkvUO6+uyu4m/PoQ8HRw4yQF0Wa6XEz1oGZC6YW21lRfWrKe0/iXmKn274Th9e9PMreKAPkLH5dBzCeXbXTmr/cuABNnNvvWdTEesPnPVjGNUoBjGyWV/QfeN7t2jNiq+C4+iyX0+X+Bz3JR75VLPiPUMrRG6xewEfKJmVvnLMOBN9FnhTskz/d/FNNh6t7woeCGcMFvCwgzGn5SauYK3lLbv8KWD+wQN/cg5JB/w/A/US23"
`endif