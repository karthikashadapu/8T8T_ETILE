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
// Delay 1 bit words by 4 cycles.

module alt_ehipc3_fm_sl_delay4w1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [0:0] din,
    output [0:0] dout
);

localparam WIDTH = 1;
localparam LATENCY = 4;

reg [WIDTH*LATENCY-1:0] storage = {(WIDTH*LATENCY){1'b0}} /* synthesis preserve */;
always @(posedge clk) begin
	storage <= {storage [WIDTH*(LATENCY-1)-1:0],din};
end
assign dout = storage [WIDTH*LATENCY-1:WIDTH*(LATENCY-1)];
endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7ttNu2ikG3FXTezenhWgjkmHDiKVKoaA4txpqmerRLCofgW2r0CgyjReeWucDeK8M71sS/3RqhC+Sb6uuCn/sf5V6msPP1xixVt122gBZKIQ423M7wPfLrMX1hk4QcJsR16Y0olgmAEUsil63dn4CtOP1+Ykyt1vCh3s3rYHfnQrwHEte5dcoHk2MNNZc6rQH7IR3JqEpyAUmzhHEIU5M34WVTIwyddtxP9YOdrmjlD1URXQ7snGIKtiifibGwqnCcq7clLitSch7XMFpZoqqigcs/CzqtmySOdVL9y1jMCPqKO1Ympo7Y/GGCyHcMbbOIBTm84nZPqINgdoRZ5eCq3eUnMkxKliG99IRKyi8jSDkvO4UlE/d9xgHXwtMa9kZ0HaZG9dCZCCWR0Vm7zke3+iY2ur5UcTqJh/WEfNWHvvG2XrJtV6HCxTm4cOhLjXgptVMv19Yqh5iuXRKbc1z6qpPaoaENk0AX4D9ypWfOzhJA3LstXE0STH1sK/AXbh85r9lybn3q6eS8laxQVekq8cJF/PK6UWY557+XeBG12XmhcGk/bpeurMUqMmR9svbeYsyjFs9hVX3SwHEOvJsZLCTYLySCemgR3fZsAanFKqNTu9AdRvRRIRvVx82D8TRu7LZa1AdgZSFjX78IarO8eVEO6DWDCQJ5yyb7oaFr/ui5gMjuSw8BY/1jQyyyclveMFMit1Q2E2WMrUwn7PKDCy5lNKcNgKaSRO0ZMVmQJty927yDxM3JJmaqodkEZsdTq7nxXxwXhsERhAIn8vA5t"
`endif