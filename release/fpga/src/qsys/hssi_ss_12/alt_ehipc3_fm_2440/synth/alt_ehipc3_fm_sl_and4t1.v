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
// 4 input AND gate.  Latency 1.

module alt_ehipc3_fm_sl_and4t1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [3:0] din,
    output dout
);

wire dout_w;
alt_ehipc3_fm_sl_and4t0 c0 (
    .din(din),
    .dout(dout_w)
);
defparam c0 .SIM_EMULATE = SIM_EMULATE;

reg dout_r = 1'b0;
always @(posedge clk) dout_r <= dout_w;
assign dout = dout_r;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7sT/QK7tE5ndyC1XOYcqzcDT0H/cqEWzMdYamTgOOE5X6RszlY0Mu54/muoP63cF7gDmdFigv2JEByM50jDvVP+6oQDIUO5e3x1A4914WQcOgDlC/JPRmHWtHrS6deQ9NceNql1zAa0iEWwYCI/3ZKPS6fo9GQCEoPXMfsP1P/px2kUJrPUzKl8V99OfK4ADCIDnOMKQG4BAwprH8jATA+d8oZTKqhAnW7NMWo27hImZsEIEcXBwCf7rKpDAi6pOKvg+PTnOCcq2ktV+LCPi8DanR+G6U8eVQSRq0E+/kigYMmkv45doD4Y0/INw+bUGmh7ClceI761yRJt3vIhIgwG2KcztCy16qBSFzO0bAFXWOX19OQpiSleVLg9RoUuubay6jLNqOIRSN768zrlxFp+HVNLAV5HFbjDweud/Ovj/8dZ9nbkw17JY4Rdj6Wl5un9bOz2OX2Nrfg071o1ojDSy4GQm/wfuLlj4/MTkDbZNGaC5mEDCYGKiKdcPVj4UcXlyALTr6Ir9f3iSKcoRCYKyrYLFWeNzYqT/9uktMtwaa6+NvQs9xr9WFCZdSl8z1+fjLYX5wrb63Iq+ht9ljazDKTQSv2jU/AKhfXx5mqEfFZKrh2zNuqCLl1y+Jps5AWX1CuzTFgV28Z/cgCPQTWgQKBX0y4TqPmQKzf4o6T2Q7vk9OLPtdvyiY0rdPRbxlQMNksjt7xMRFcEX1+zKWtZCITzVB9FoALtIg2zYq/0VwkiAE+cW6fH53G8dOJ+BfB/tEfj1+tWDHhPRHNsHoWu"
`endif