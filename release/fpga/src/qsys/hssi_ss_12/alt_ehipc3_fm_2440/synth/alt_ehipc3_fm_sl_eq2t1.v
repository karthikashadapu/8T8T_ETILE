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
// Equality compare of two 2 bit words.  Latency 1.

module alt_ehipc3_fm_sl_eq2t1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [1:0] dina,
    input [1:0] dinb,
    output dout
);

wire dout_w;
alt_ehipc3_fm_sl_eq2t0 eq0 (
    .dina(dina),
    .dinb(dinb),
    .dout(dout_w)
);

defparam eq0 .SIM_EMULATE = SIM_EMULATE;

reg dout_r = 1'b0;
always @(posedge clk) dout_r <= dout_w;
assign dout = dout_r;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7tJbsoHcqomIimy5KwTLCNUaBzUPLlQuA5f4IiviZlzpeYVfVMPlLWw15NgrzPIR5LFsNmQhvyy7rNm7G8pJbSWCGGONDZBjs5onV86oH8Wz/mFqCH4IbP35HlIwLnGbwr88cKgJY10jy0hpvCbeHH6eOYzM5Oj925JKzFZjF4aPPQGECU31ZUrFgJdvI/WhFfwNjAndEbRNpho7XVlwZqI76296SRaNicPF0XwOyrybK6rFysZIFCONtxJFvuq+5/tbmxPiQm1lqzgHq7SSeQ7opF4XPB6iWG5cMIydkZ66PQ6+fYj4puTX2EhiVNjC9APNLKF7R04+Zg0o/PAP592qjVaqfQuuZ3OFdt1Ii6Ombd2OdloE0oqSS9lzCxyq6hlUR/WS2SvlzwTuPlumP+sh/8DlO5hB2+cLRqDFjwOHGCEHqnq67lmVMCIUBf7ADgy0LrzJEpVRAjHLq8Iw+KYYBhweWwua+sybvlgh7xGmHtxiY+N9kvhdePpvnskiPtaUHRNB4vhWwdXNWFQQZTbJZsvHH0QVt+ZAbAsUXXGlJFwVkzhU8mwV0OyLjkaHpteqcOGtAXhBYHE4BloNEcpLu7Inlsxzg33yFuWjuKtF/Gurk6B0HUSUCohXRT9Ck9kTOC41P0bt9RM18N6igIKNrtndWYOaSD/6NkhOE/qzWGlQ1v8mKGQhbCpG9ceCqCWg/vejfpW0BakQDX2gh1JXxukig1Sl4mknTkJTdIvKD9Nob6rRy2EfaW2aXM4tZfpg8NMYv3pUJJ86WlL8dK5"
`endif