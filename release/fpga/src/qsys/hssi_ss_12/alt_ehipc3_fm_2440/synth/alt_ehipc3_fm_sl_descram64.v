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
// Ethernet style descrambler for 64 bit data.

module alt_ehipc3_fm_sl_descram64 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input din_valid,
    input [63:0] din,
    output [63:0] dout,
    output dout_valid
);

localparam WIDTH = 64;

reg [57:0] scram_state = {58{1'b1}};
wire [WIDTH+58-1:0] history;
wire [WIDTH-1:0] dout_w;
reg [WIDTH-1:0] dout_r = {WIDTH{1'b0}};
assign history = {din,scram_state};

genvar i;
generate
	for (i=0; i<WIDTH; i=i+1) begin : lp
		alt_ehipc3_fm_sl_lut6 w (
			.din({history[58+i-58],
			  history[58+i-39],
			  history[58+i],
			  3'b0}),
			.dout(dout_w[i]));
		defparam w .MASK = 64'h6996966996696996;
		defparam w .SIM_EMULATE = SIM_EMULATE;
		
	end
endgenerate

always @(posedge clk) begin
	if (din_valid) scram_state <= history[WIDTH+58-1:WIDTH];
	dout_r <= dout_w;
end
assign dout = dout_r;

reg din_valid_r = 1'b0;
always @(posedge clk) din_valid_r <= din_valid;
assign dout_valid = din_valid_r;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7u59cscmxD2ut9VzF7Ap6095YxgTZpGN28hrz+s/X6omsTKzyDFHX4Ad+wSAi2LF1KPE+QOl98W1Bc4Alb68ykucjNiUv4pD3yHazKI6haaIrgCrz1E29S9m91MsNSLlFoLZSa+6EdkjNNrTasNytn0WkMLXuZAm03LcBAD2vsgCr6a5zapA3mRCefUQi6wgB7Xfo9YDh3p5on/RRcmhJu34kvhltoOatiP3j7knL3e0e6tDJwUHxe7SIwsZm2pamuSGm41fNpb4A/6AbnAQ4Wquae1DHSI21equxaTY+zpWvcbSc2lOHrr3fZeLUaUUCFKx6SbkKaKtGReV2PE2D1Gq6V1xRaaiZqRDxGfmQzPQAmXbjXe8tbfNqgDJR7PCc7V0mspyBNn325jAlsPHv6YEi9gdvsJitdAzpfbQ36f0n/OdPGDyiPlqgkrO+K5NwebvtEopmsLSFTelDq9Orh1s/+KHGH20L9EN0/Pq3maca5AZvLx0if8sl/rjNZJlAngIyOKXT4IRQGhm9L9W5A6CmoOUD/StORsaot/a+U3mloPFVjejbW1UHMZFVil+wHdQsUJHG1IqniDmqsJJZYEO96TLCPtR8iiEq/J+8bMu/uoP22LPTKbLUnM9FH/sV+P2H756Omr7ddaS0OdqvmpbRnZ2eTpVeGUJf212Ooz+I61/OEUpr6C0cIgzgpOvbBN0Lkux8TFj2IXyhvp4fUR6MrmO9IVjIPc7ES0uNgghyJf/M0cSp50zceS1FTxA27vm8Da68WOdx8cEE1NiKIj"
`endif