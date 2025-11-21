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


// (C) 2001-2018 Intel Corporation. All rights reserved.
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


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module checker_fifo (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	wrfull);

	input	  aclr;
	input	[287:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[287:0]  q;
	output	  rdempty;
	output	  wrfull;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

/*
	dc_fifo_s10 dcfifo_component (
		.rdclk   (rdclk),   //   input,   width = 1,            .rdclk
		.wrclk   (wrclk),   //   input,   width = 1,            .wrclk
		.wrreq   (wrreq),   //   input,   width = 1,            .wrreq
		.aclr    (aclr),
		.data    (data),    //   input,  width = 72,  fifo_input.datain
		.rdreq   (rdreq),   //   input,   width = 1,            .rdreq
		.wrfull  (wrfull),   //  output,   width = 1,            .wrfull
		.q       (q),       //  output,  width = 72, fifo_output.dataout
		.rdempty (rdempty) //  output,   width = 1,            .rdempty
	);
*/
pcs_scfifo_mlab #(
              .SIM_EMULATE (1),
              .WIDTH       (288)
) Idfifo (
    .clk(wrclk),
    .sclr(aclr),
    .wdata(data[287:0]),
    .wreq(wrreq),
    .full(wrfull),
    .rdata(q[287:0]),
    .rreq(rdreq),
    .empty(rdempty)
);


endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7ulhegStohm6Aq+iLDuaEw+pKRMAzJF0GYLXWB/6V+1/AbVRUIlHVvdgl8rsEFYaJd6NvbNqalEOp7lyoa1jZYC0zKAY4q0WLdzSDW4sn//7nalvjJNQmjKHFj2NjYJz5xrX12cOTnn1u/Z+Tmh18RZBLd38uaMsrFxHsYoXEVG3yuEAyW+QNqoZYzj/54AH8dF4usxDxTPefNMjXPpcC5cj7XKsAiviV1AWvON/IjaEdBxbmToQ6sSGhKNePJ7jyYL5PhiKEQK7bgPRlD+QS8mNGQ6VfBavq9gMFghKw3pPymQkB3ObwlzggOzXPXbxVXrbGeHvP0+mg39Kd0nybewxfV96MX64De5hcKR/z9fq8m3NmexP477fFdkKv4Kfc3JgT4Hk8KQEzEGgeskhkubprjkIamC+zS9UAYjvGGLZPGsFZ3lVUuGZi9WL9XNFmcew4BFqYTyPyGhVq3WG27qE7CvYUj35DEfnDdlZmyFwS2u+NHh28XDmq8b+s2AG3P826RH5tuhkXjcKmndGOoXaxfrSn6jDZBfobUAjW6Y+sdN3M+aLZp5PdskBDfxCtWdXUpbci7GttYfKt0p2Lz431ckXv7QCFYSor8fAm/9c4SbQdkrnwhL8JcsI7cNc9LjKUYIshKxLuI6l6S2HLGcHpTajb84e2Uz8UEiJ4kQ4g66Dj7Xo7K15nQXkcpInHqRBwvsBhgKNOgws8OFyNprXSQa+WOedcDpBNmn6iUZjvh3bC8P9KlYE1vLdV9zKFDbuwK8PFjJVi0UjA695t/O"
`endif