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


// S10 32 deep mlab dc fifo
// Fifo synchronizes aclr
// No underflow or overflow protection
// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module alt_ehipc3_fm_dcfifo_mlab #(
    parameter WIDTH         = 32,
    parameter SYNC_ACLR_W   = "ON",
    parameter SYNC_ACLR_R   = "ON"
) (
    input   logic               aclr,

    input   logic               wclk,
    input   logic               write,
    input   logic   [WIDTH-1:0] wdata,
    output  logic               full,

    input   logic               rclk,
    input   logic               read,
    output  logic   [WIDTH-1:0] rdata,
    output  logic               empty
);

    dcfifo #(
        .enable_ecc             ("FALSE"),
        .intended_device_family ("Stratix 10"),
        .lpm_hint               ("RAM_BLOCK_TYPE=MLAB,MAXIMUM_DEPTH=32,DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE"),
        .lpm_numwords           (32),
        .lpm_showahead          ("OFF"),
        .lpm_type               ("dcfifo"),
        .lpm_width              (WIDTH),
        .lpm_widthu             (5),
        .overflow_checking      ("OFF"),
        .rdsync_delaypipe       (4),
        .read_aclr_synch        (SYNC_ACLR_R),
        .underflow_checking     ("OFF"),
        .use_eab                ("ON"),
        .write_aclr_synch       (SYNC_ACLR_W),
        .wrsync_delaypipe       (4)
    ) dcfifo_component (
        .aclr       (aclr),
        .data       (wdata),
        .rdclk      (rclk),
        .rdreq      (read),
        .wrclk      (wclk),
        .wrreq      (write),
        .q          (rdata),
        .rdempty    (empty),
        .wrfull     (full),
        .eccstatus  (/* unused */),
        .rdfull     (/* unused */),
        .rdusedw    (/* unused */),
        .wrempty    (/* unused */),
        .wrusedw    (/* unused */)
    );

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh0n1GIJjvMKn3bM99kIGvuwtjddZTSP+enpln3zEt7OPQVtlf8DEzKaRsiYsWm1yc1r8E+M4ISqvlYKzZu+DoyRuvAU3yvXi6LddoRkSrZbrZu3yitH7oUuHgfgRSeDky22/R02au3CjgCYzLSKSgcr0yNcWk/YLGnfbetv00bQIWIh8mPHCeHRLeobVxd8fKdXVhiN7nNfYVqv7WHXGj227TU4DxvVuja2SNEK7kTPRK4v89o7WBn/XYVGpOohy1TbZH+XxUUpPlfje+BMvGFD47iQBCBIZoHgkkeaDDs+7kaumvdxONmoK8A+fSji5t2fWGIpNP+o2gbBUOKDN22ZVKT4bScWQLadFh4ftQQfS9K2rwuSary8rvMVbkQBNaxcFMgokEDaYZFgAPo2A4LQfq2rqW51y+7QRTw5MORt+rD+oLYsWBLbyiJxEqltGgD6Y7MYM3dMzB57ldHzn1tffIeLWp8rON7k2ydxwR6Ze6bW+PkZrQrgUHjp9hzfJLkTUEnCI4Ev+LXBwbtpaK4bJ0ylrYELl28mydQam1oVwr26NVm/h9pEcG2R3Spsr+K/0tUon/nCXN2La4tAjct0PzobGhjfYa/baCqskIMpvgdqKViWDA6SoPcHztzQwiYogTORhhOaqqs8HPgRWlpkhWNIQ5n8Y8vlmHC4yyJztMT3c/ZP5KCI8UUR2blNRH249l3PLOW0ca71uQRazios32868WAHn7+dwrQue3/1y7AqMcRrar9ckxdMBRSqTToIbEO3LjC0r95veDrXdRTv"
`endif