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
// Delay 1 bit words by 5 cycles.

module alt_ehipc3_fm_sl_delay5w1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [0:0] din,
    output [0:0] dout
);

localparam WIDTH = 1;
localparam LATENCY = 5;

reg [WIDTH*LATENCY-1:0] storage = {(WIDTH*LATENCY){1'b0}} /* synthesis preserve */;
always @(posedge clk) begin
	storage <= {storage [WIDTH*(LATENCY-1)-1:0],din};
end
assign dout = storage [WIDTH*LATENCY-1:WIDTH*(LATENCY-1)];
endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7t3v6t7VeatKvpJE0BTFnleswT1mmWO/Wm5dF4GpI+fEryX4/MpMLKjHkPsOYUHVUMf1UvMB42I6Y2ImQnJZapuarBhBzHw1K1qiatvoiJtHOkbYbwRfxktUFys1a+G1TXDw7BX+J/5hXvqAKkROnLTLwnmyc3vfUefepKc+lmQElP1f3czzig8LhBVLuWSROdL8+iUNNl5QF1IXOghlMOTRKkDEGAbdrv90WFO4vAfhWGw9scNE3aQlgrv/RBrll4orIyZTij42HQigWGu4OqMLesGcTPGTz5frkSqqNSHUZxrBSUDOAoWc6CbjQs/P1uui6lC+zRp1KuQLKtI81FWFQd/04pe/Bz4dXPV3IFimR+xxhvzo0LAvMnIFwjOtj+zEPfy+di1SQQoO19JD2HQ+bt2EqedyvaHptn5rQTL/uqcA7MYiEm02b4WJkptHQYhgxLM/xUTXnNDhQXn1oMNy7zTzKl8n8HULhbDOg3q/JeQJLaTvAjjJZdR67YMQTgUbmMDP7PgrHn/TDWkxA+svsOzp4Ynau37RSjHdqQ2B8MHuz4ulN9qz3A0UGY2VoSLob4XERhT3BYr9XONrrQ8XlBFFcnImbtokh4eqD5B466n04AY0xfhmZ4D+sQzN+K3E0T6aYksGYb4jLOHUKlcTOL8wdPQk+0/nNhAQBuCUj26yaYPDbWbd89sn+ecIHBMliktu4ueLiB0YBH1815RXCa7SrnMnB2xKbadhjAC05x57XY618mLuG8S88M6Ruupp/sMnXhsUCLX+qYREiCI"
`endif