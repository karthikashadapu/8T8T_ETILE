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
// This is a registered 16:1 bus MUX composed from four copies of mx4r. It has a latency of 2 cycles and a
// LUT depth of one.
// 

module alt_ehipc3_fm_sl_mx16r #(
	parameter WIDTH = 16
)(
	input clk,
	input [16*WIDTH-1:0] din,
	input [3:0] sel,
	output [WIDTH-1:0] dout
);

wire [4*WIDTH-1:0] mid_dout;

genvar i;
generate
for (i=0; i<4; i=i+1) begin : lp
	alt_ehipc3_fm_sl_mx4r m (
		.clk(clk),
		.din(din[(i+1)*4*WIDTH-1:i*4*WIDTH]),
		.sel(sel[1:0]),
		.dout(mid_dout[(i+1)*WIDTH-1:i*WIDTH])
	);
	defparam m .WIDTH = WIDTH;
end
endgenerate

reg [1:0] mid_sel = 2'b0 /* synthesis preserve */;
always @(posedge clk) mid_sel <= sel[3:2];

alt_ehipc3_fm_sl_mx4r m (
	.clk(clk),
	.din(mid_dout),
	.sel(mid_sel),
	.dout(dout)
);
defparam m .WIDTH = WIDTH;

endmodule

// BENCHMARK INFO :  10AX115R3F40I2SGES
// BENCHMARK INFO :  Quartus II 64-Bit Version 14.0.0 Internal Build 145 02/20/2014 SJ Full Version
// BENCHMARK INFO :  Uses helper file :  alt_mx16r.v
// BENCHMARK INFO :  Uses helper file :  alt_mx4r.v
// BENCHMARK INFO :  Max depth :  1.0 LUTs
// BENCHMARK INFO :  Total registers : 82
// BENCHMARK INFO :  Total pins : 277
// BENCHMARK INFO :  Total virtual pins : 0
// BENCHMARK INFO :  Total block memory bits : 0
// BENCHMARK INFO :  Comb ALUTs :  81                 
// BENCHMARK INFO :  ALMs : 81 / 427,200 ( < 1 % )
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 1.020 ns, From mid_sel[1], To alt_mx4r:m|dout_r[4]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.994 ns, From mid_sel[1], To alt_mx4r:m|dout_r[4]}
// BENCHMARK INFO :  Worst setup path @ 468.75MHz : 0.655 ns, From mid_sel[1], To alt_mx4r:m|dout_r[10]}
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B2YDFnW6FDHw/aKe7t/x9jBOHRHMsSDg4332Rh1szjNHUN1+LZ8Q4BufF2iRVmLcbGXD2RE3xdTvY0AiOFzsfBNiGFSMdF5MiKyUctRjY2Sm4a2fNNx57dLoXbs8aqDHRIPV/QtuPC2bZFiSbwxBNxZlllZpHpb9GOZClHXMuuZbEHZDe0FiLGEtgo5SJ39HIrcV4k/h8GYnj8x55vDPCjLMsnB42xgAmTS1C6zuMC88NPix/kowiNOLO9aJafAr3smdrxibsLFJyo2ydp+rU0NIhZRAa45m0SAKK/BYgAeyd9W1gOb7JHhCeucAYzAQC8EsvNE2Jqq+K2ja5uGkmhReB4/RriAbYARs7yU0LX3LkxgolFAOLa3CtcSLxCJgxV7nh93E3D4aWeETxOv9FKanYtdEqVGU6V8Q7jgsJz9xMHiagWmokf9IxNb8xNLhYuElyIYqV6tBYcJ9evME3DQUHG4am0Suk+OzqqOO/uZcCWYgxokZpe93CLdk42b5qtXBZlDdD9nl/KHHlU6HLjC/ZsBlYMMtDmzs/Dh6FKBw6AYNBY3g5QbhB3HeuH65MVpAKFG4DaEFeJjCWY9a9F93T+SY+1WD7yNajUmrO03DegXska7G6BRLYVOeHO7ywIb/I9wf1EAnIP0umxaFaHhR+trnlwE1JpSW43v2v33LOunrzx2DDeVoctF52U1EMNfDT0MFfbIJPhcy26izmrfN/iOZWXttuLZMQwCXCD1Ax1i03RvWRaF6nTCe16FqYSGooyDqnKi45/P0J3W+D9n"
`endif