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
// Delay 1 bit words by 6 cycles.

module alt_ehipc3_fm_sl_delay6w1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [0:0] din,
    output [0:0] dout
);

localparam WIDTH = 1;
localparam LATENCY = 6;

reg [WIDTH*LATENCY-1:0] storage = {(WIDTH*LATENCY){1'b0}} /* synthesis preserve */;
always @(posedge clk) begin
	storage <= {storage [WIDTH*(LATENCY-1)-1:0],din};
end
assign dout = storage [WIDTH*LATENCY-1:WIDTH*(LATENCY-1)];
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7s3kSRWxG8hc4XDa8HBcRcTVIuOJTRnxatWMHLlmE4EagLslK2ASlXLc30AcNlAMuvrC8L0eSjRnPuzOUwR/sJL6C4IJYVKq6Lo8ouHwyKBZWfXmNMiVEwt+wEKk7V4K2Qjnu1mTaV2rCu9CeVFoGf0GAwU7nM9d1sZDMMHp1gunwyTtj1SwW3ECf/tITq19a/wfuDJQvedQ3vNAC0wv4DhDTE01xO82cpgQAU5EdHZGHjL2NlpIkARQvoYzY5kf00LDUv27JcnDrrL1L2FtH8ZoS98OUOkiAijcuq+/B4kZI6xb8abkF87onvTesmWVNIKvJ/nLWj2Y32Q2y8seoWtBDjmZzluiq8gIu6gcL5INHGHyyDl0a9tRLRyNfgWYQ6GlvnFizRcJ7CsMOU7CiAiIlwELKq8GAnB1tNLZd6w61Yt9SFJ0u+OCfjpQ+y+bwTUQfDkVFm4eU2zsTYxdc77UtEH/JOsL9+nx9BcUryV94wpsVCuhZUXiRJpVX25YsTiV+yVnMY+x54OnxQnGtpc3eUPOqh5+gAJjaTMoRAoOAawVprBWqxc+HVOiYr9qezCEVb2TIc+ku5Fm7e3tUu6FkSPg5upJX+G40QvrJ6rLQci3GUPtJ+EpgDlebl53J6rewR9bCwDQiW6AsS1diTgNE0W5Nn9n2DsF4G8wMUaIUrplalPEte9kjkFPTJ5pf1oYwkVCqOH7rTOIjpsEzWn4k6rvKeBVvrMHDDRprzlTmKggIAYxpQLerTrFZGdLfdtL1KxoyNDOaxw74jhDvxO"
`endif