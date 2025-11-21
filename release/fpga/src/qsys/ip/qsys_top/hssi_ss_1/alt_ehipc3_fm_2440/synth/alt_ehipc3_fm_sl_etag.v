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

module alt_ehipc3_fm_sl_etag (
   input clk,
   input srst,
   input din_valid,
   input din_am,
   input [65:0] din,
   output reg [65:0] dout,
   output reg dout_valid
);

reg [1:0] ctr;
always @(posedge clk) begin
   if (srst | ~din_am) begin
      ctr <= 2'h0;
   end else if (din_valid) begin
      ctr <= ctr + 2'h1;
   end
end

// Determine if we are going with the IEEE and current consortium
// alignment markers, or the original consortium alignment markers
`ifdef ORIGINAL_CONSORTIUM
localparam M20_0 = 24'h477690;
localparam BIP3_0  = 8'h0;
`else
localparam M20_0 = 24'h2168c1;
localparam BIP3_0  = 8'h33;
`endif

localparam M20_1 = 24'he6c4f0;
localparam M20_2 = 24'h9b65c5;
localparam M20_3 = 24'h3d79a2;
localparam BIP3  = 8'h0;
localparam SH  = 2'b01;

always @(posedge clk) begin
   if (~din_am) begin
      dout <= din;
   end else begin
      case (ctr)
         0: dout <= {~BIP3_0, ~M20_0, BIP3_0, M20_0, SH};
         1: dout <= {~BIP3,   ~M20_1, BIP3,   M20_1, SH};
         2: dout <= {~BIP3,   ~M20_2, BIP3,   M20_2, SH};
         3: dout <= {~BIP3,   ~M20_3, BIP3,   M20_3, SH};
      endcase
   end
end

always @(posedge clk) begin
   dout_valid <= din_valid;
end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B0oMkDSPxufPN5SVb3rZLtBsjdmbkBXeR7fwoOFCzUFTgyHI0NhajxSDL+rfbnba/FDYZGuLUWGFCgHj9gG9TYsCGchTrJ6JX6LZTmrIKTGEYfI7/AFTcO22qbZ/mMDpv/LdDxhzTJulZd88V+KUB4cO7uIrh7rVGyUKeKoZn5Yg8pi6YqZBvpp1ZDBz74CH9x+9YjMLQz3P0WlW99wAfzW7neyu39FrMhb9K9u/pPabPMlfW5ONvfrHn/rvqgwCWMG1aDxWjcKcJIKU/isi/ZNvN6Scjvytwgek+lcFto/zTuqH2Z8wTnLWliWWbDnvDmAizV9Jqr9/PRHw+CRN6zIEd/H88NtJ1DDslVT0w/mvTdqWE0N+CQ7p3tBwzOv/eC3/hhNfhJFCWR3iUkcpHWcQhE44Emw9GHJJxqtuvCvFGryxPG60RfbigIWZFc1vJTEBE5KdTvhAdCrBDZ5MBt73ib/ofmn6ap3nNmXZdBw0pGL8Ezch7fjp47Aa/cU4TvoF2cWJOyO7gvFyc77VInpSzCOzUwMc99RqyHgJJ2rrRuPNZywiG0EqP8KX4EqlFTP1T3LraNroxxTQIwlZ2Qo/bUx6X99UYvQEgfAoAolYGBe00ib11ZdEnDJevkVpUO3FP6pS04YGWjRWuolCFQf8z2xhtPHMiC99VEPXiWcrpdN8kdT1SBMsDDK963AsmyV+J9868Pv6/3Gdb0p/bEXxbAz5nqcAb7j8lEV/vor+2LKHe4J7vlCef/KczQe4HRyLIjfbthQ6EJtbCssCdhZ"
`endif