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
// Equality compare of two 3 bit words.  Latency 0.

module alt_ehipc3_fm_sl_eq3t0 #(
    parameter SIM_EMULATE = 1'b0
) (
    input [2:0] dina,
    input [2:0] dinb,
    output dout
);

alt_ehipc3_fm_sl_lut6 t0 (.din({dina[2:0],dinb[2:0]}),.dout(dout));
defparam t0 .SIM_EMULATE = SIM_EMULATE;
defparam t0 .MASK = 64'h8040201008040201; // {a,b,c} == {d,e,f};

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7um7HAd8ahCyom2CINI1+jMuVAuhO6D9S0JFX2eG7Bczmw/1us1hU1fjts68GAyGpRq6qun23rj8Er/C9D/n8E2DaSBzi5gEaJTOScOV9udLL2kP00vHMZTbfuIbDN3fucdp89D3e1BNtpjMf44Mwm8GGXm2L2SURkPOSPzAhuuAIPuRRnUIu0fvFHOU2v3P3XQd+X5tNeIvBsp3AH0LM5xdZ7lK+RAL8b+SaayeWXWgWlyD188flF1Z0SLan3vQ9bRcxsnksJCeBEl4Z1Hv74rDICoeb9RqzCz60OYgTRTxRnSrgVU+OCsxH99CnlLJktqd2O0JjskdWSnR6KgDNyWmaCZm3knCmFgSkvnC9oOfoIqOnPMFu3FMK9GZ81O95fXoJ43fCHM865sVHzy/qvv1IZWMtpOn38YTfluOSnGYpoMmEVmSZ3uXG9sGXfXmWjmRau/Gn2dlcrZt/h4h/nvm9x/pFRyez+pfWpQL2dAYCIdtDn4OF7SBELdJ9L6Zx8iRbLI3DuCChpAgdFvwx9PbgTGrkehrtJjzTCtScwl/hmQmKykKXQAzkk9SJnZtYMBbB34jCttZcQCtoh3EGOvQZrcHmFjeb0kVPqyS6pdFv0gtLWhTO87IdeLsq9shXFoKebI/SnUifsfE9ZL6N+ued2SD1kmB0BP+EThQmp1EWi/5eJLXmA98vy6RAc4/ALPSsEZUpugYeJJU14G7L15hMFoFFGil51nByjHNkA3JMgkNIvCaky2Wtq1WP91wZQW+nfis9feTUUwfKhUP6im"
`endif