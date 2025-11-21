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
// Delay 2 bit words by 2 cycles.

module alt_ehipc3_fm_sl_delay2w2 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [1:0] din,
    output [1:0] dout
);

localparam WIDTH = 2;
localparam LATENCY = 2;

reg [WIDTH*LATENCY-1:0] storage = {(WIDTH*LATENCY){1'b0}} /* synthesis preserve */;
always @(posedge clk) begin
	storage <= {storage [WIDTH*(LATENCY-1)-1:0],din};
end
assign dout = storage [WIDTH*LATENCY-1:WIDTH*(LATENCY-1)];
endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7u3fWAfhWz83bxegLk8DfyReWVqDePgeEmLHoqpD7NU0vgLpRC8PbL0oNpVIRdmxIYBo+6Rm5r2iICvWfAF6hAdycNa+2fM0Js0spBEW2a9lQBYZV8ZCWVnJhyzjo/ROYvv3W3GYhfADOt3+xkdCDDqrxCMBsbt0IeNDRDREs/PFrsX0MSyBa1mDU9aHKxJ94c7SKVxjGl6Ma6/ftd+FC3hC6ZJ16dFwpKG+pmL4QYKdiPftTzZveuxLzXcpZner+nJfsvzewI/F3xgId4ppxy8B1JH/rwNrrSmYpZQj2kD+wxVDw1xRLS5VpU/5Pm7cMasa4lTeV+PknacFJR+nQJIM6T0PuIvW2+eN4Y0HvhxzsxP5C4lYBEHBaLMlhHOQjUmpfuNjpJI5+YJO5RYGDX5NdbvmIYZ1eYh/NcJzapDOIOxkCquF5hKepGbbt0YKIL4oK5R0pWgdrlew1yGsgPrF+GxP6fzXzuevt0VzKYh/P8lzbJT2PiOjq6dQDUm0ns/fm2/CioccmPp6QCOJqXCMbnWahr7WY2VGKRcHnRvyhbrzTz7l2yQOnjQPtJk51yAGbIdstIs8ZaYVn4Buur5nA5OBz0AC4jb9kJw5rYgxyl8Deou8hsr+A8HKMPj65icfRvmNR61yuwObyucFdu6igcUehu1l8gLZbBfUXBKPAelnu9A+u9Z5KQpNPNrXCgKXDyZYYYWLrDuxxPWMVNfLlLeVmIRnZUQal5uzTHhE7CTh9RDeVaw8X9uPanKTpHqwfTt6pJclTbkFrUdjROJ"
`endif