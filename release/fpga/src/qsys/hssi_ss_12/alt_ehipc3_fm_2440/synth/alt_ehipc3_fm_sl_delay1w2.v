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
// Delay 2 bit words by 1 cycles.

module alt_ehipc3_fm_sl_delay1w2 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [1:0] din,
    output [1:0] dout
);

localparam WIDTH = 2;
reg [WIDTH-1:0] storage = {WIDTH{1'b0}} /* synthesis syn_only_preserve */;
always @(posedge clk) storage <= din;
assign dout = storage;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7tGVSUZgD0WNlJaQAFkEaMVanEsBWZC6o64mFUOVGdycz2apljSqkEgIzEa3i/5NG43Gk7ViIMuvC3FeO6RodC3Y4KdrdNI0liRcnyhqgzC80yPGaSc0DOQImExweJCMZsCWlRN8kcLls4eKrbuYPrBPQ8kTMpSqDJthRUfoM9Fu0HUEPrYZ4/fdqX0MAhV9OyQ2YxfeYx0YQ1DkJk8tu356WVT2HpE2+MTL0tB+YwJrbeXmDfHAP9Cq+SeczAiYuFG1zBC2/8c7Yw0WoYqy2hyW1zD5UvlLmQm+Y8vK+x1ZnHPCXngr2ek+pcQ+PdK9HS+xLkQsQ8F3y6W55gakmy5rci66/2NXNPqCZwxfoa1BZIpW3O+tlShG3UHotrxkL6JvdC71eaxsvP4NUFubZ9ef5yHzbsP7sfUwi435R5M7hnlPUAOfbrSrZho6xV1GoBxtTk53lwr5AjoWjYzk+yXBkisEWmkTtS8E5CRKFgyROvpipdbZUMZfbAbgPzwGqW665Mm7pXHJEAuRLK++C6JSp8ZTHcAKkm+H0Jj8zk/m5nPf++9peZlPFCSa+R97b2VZwL91Ag1WejJPdQaqVn3SA+vvXrfM+ujArCgKjtKZBvXSXONm4yvTDwqgsgiFFUHd9bDbbRHeYweHqpsufati74QR0oDv3xvvcDTamOMpTTgSjEpsyoRrKYCp00r8i+PkaOQjoFMUyPKpcscQMpkeK0qNpFfsBJ3V44wAIAI5H4PQk7jzmph11XBloO/xaT3Pc6IWc1DhePzvOpdaysW"
`endif