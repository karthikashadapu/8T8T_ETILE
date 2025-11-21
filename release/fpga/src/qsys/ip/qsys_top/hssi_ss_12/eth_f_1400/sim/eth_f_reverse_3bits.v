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

module eth_f_reverse_3bits #(
	parameter NUM_SYMBOL = 32
)(
	input [NUM_SYMBOL*3-1:0] din,
	output [NUM_SYMBOL*3-1:0] dout
);

genvar i;
generate
	for (i=0; i<NUM_SYMBOL; i=i+1) begin : lp
		assign dout[(NUM_SYMBOL-1-i)*3+2:(NUM_SYMBOL-1-i)*3] = din[(i*3)+2:i*3];		
	end
endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XbHl/l0q1qqfUGK7LMFDOxGVnsCAwiJNMXBOb9vAD97TCxgP9gu6LsBKpN8f788HggEyhy+Qax2mSF4frQpdEcFcHKsy5xDsV2+U2NA41nm63FLitAR8FmlYyOghhlSTL1li8rK3vWqN6NgcJGjEqE8hSFaFUGPdC+YpPHbAGACROKs+IAIXb7+/pxnuaW1r4wIPGkVVJSnVjnAvWCkxX4uR3/cZCzWgqmLO+JwJfO8qF27mUfUxpfh7ojkWKqVDCXVD1rdpmnmzIczLJyfBJnSqTuhrm5eTuRzFFfbaEAKBj1cDutK1l34IvfNIX09nDkBZrR3h01taOyPWRs010b99l4bM28GR4+Qm57L0sybjFSWUQfrxj1FF1t+bK1LHySius7X/WCpueFE/uFoLGywDjZv+kn4U8devxCvKh1wBB2XoWW1AeaM7g5Jdd+YVZbQ70dfv4Fs6NxE1sy4gXOqVCjfFJTwp0luPq28Tv5Kjw7Ew0IccKx+hkUVTFWWNsFiyCGeJFcqjgzri7LobS2tWFbvvHjGPynMSDFvOqv51iogkDs24zK97yCoqwwDwxvpUSnT8lc/tTLjsHn+w+FpLcQPeuTD/y84AsFtV6ppWez9SGeq2Cjpwxsfjc8jYeBCMSvzkSn3yBDgGGWcaUcwgVN9dALEyjsExxaxDKOq7oWuL7Uh0sJAp5dv/Ydhj9epWl0kziZ17Ql9SnEgM9a3N8ii1IHPCvbzD2v6NmL1JOa5qITDsZqkLZL9SovDZwN1EfkoHnMxTWWHL4Nw7Jh/"
`endif