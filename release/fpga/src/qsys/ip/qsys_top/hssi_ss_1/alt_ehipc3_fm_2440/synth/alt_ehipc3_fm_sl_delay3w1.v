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
// Delay 1 bit words by 3 cycles.

module alt_ehipc3_fm_sl_delay3w1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [0:0] din,
    output [0:0] dout
);

localparam WIDTH = 1;
localparam LATENCY = 3;

reg [WIDTH*LATENCY-1:0] storage = {(WIDTH*LATENCY){1'b0}} /* synthesis preserve */;
always @(posedge clk) begin
	storage <= {storage [WIDTH*(LATENCY-1)-1:0],din};
end
assign dout = storage [WIDTH*LATENCY-1:WIDTH*(LATENCY-1)];
endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7uB4zi7rshvLLjvGzCjE7DWAkNB/yzV2McUeF5Dj09nV1iC8zA4NjAtZjsgBSJiKfYQxVdlgp9zyIAYqEJvhJcUgle9hfeHJh9U9E+3rPnFN462ZXuKcH1gyTWycOXzMc8LIUOWJQVW+ePoEgQ9eLf2QLG7hb3IWTxaHbQmpbSbmBu+52FOB3ibVZ7tNANJOy1Z19xad9Lrs7novKpA4jScQQK0BmvIrJEmmhGPcOYRrfFpjU2rLXmJrl41dDsr00we5HeYMJTA5+uqTENYXTXqEK9EFhGBSfpNXuuA2MwGUdD2kuJHCe0yE1upHbxk7oH/gjLD8zQKm/KRld7+nQmVHKwjnK4BxOy8S5Pl7Z2YFEi28ZvqpLrNR+Q658tqaXZHN4JshcQIWevImHklqHboYLxl8arC7dT8arJvG0m2XvOkZVo8yJKxHH+tRK6U6YnUxD+wB/jkaZno+QB0I4SKNUBgp882t/YlfxAj2euOwJFHAcy5ZBBkvBeGd4CPSY4N8wM+vdTs1b4dqXnpe4RXSiGyvKBqEzMfFx/OtGFUJQm1YTz23RRUtLVbHSwKOPxnFJfSsSE2hPkjTLPnAEjPrhyOdoIQb/1g3if87zdtxjbcd27/e3ft+3K7N+cYSTOsIOAlOiHlo8DC65yePuYArR8NJVs0LqeQoFgpTtQkZYP8hQcL2ZhI2rnF44XJDl6da/djiPsoIiLnIshw4+tB4B34t0j+jkKCz5vQUlJSrt6ECNw9k3M17enDlJc4PpZPsxg9LT8dEHE+37pxQCEo"
`endif