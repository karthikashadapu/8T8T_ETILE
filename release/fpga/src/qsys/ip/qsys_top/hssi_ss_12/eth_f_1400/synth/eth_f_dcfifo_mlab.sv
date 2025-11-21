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

module eth_f_dcfifo_mlab #(
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
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onphzGcqFxa2fb0/Fhpmz8r49XdoAQUZCGDDsL4/kbXzTLSZZ4jsHWxPZ1EZxcSvKSYFA/+pj+gHB9KL5lhJ7mL/GajH3Kv6ZKAmaCZfSN4wK2yStx2AUvWhchpxbj6BPtSoys+aKUI+DHyprQC1TJP0mYt7lM/SY2nFd+qBfTt18BgHTNGbGrw2Ab9Xknd9WY++85vRqcGJ3DNRWmugrBuvDkUB9BAaTDtctdb+6fKFlFQWL5dY+hmDCI4LzS041kxKuAH5qKm4CLXReEHNoej1jocwYz0XTP/q93sN3j+oRHHas+85tf500ibwA1UN2FLLl8zSWuMM0QYn/K2w2FfCrOhdPouUqjwGZ/bef5zY4fK7925WTZZ/HqAeUiHNBjwpiZmVAAxSGrrMWfJ03+69zxILyQghpYpSU+M3d47wZXdXAW24gLabkS/SFEBCqx40G4RotnrYFL5OHL8kAJyObLIE1L/08aI4+23jglOORth30xIHQ4Duq24iY7CjDzWUjikAhQgcDydT4gLfIDyi2heVz9dhcZWNhZUeEUuClKGwImVLayWuhBnCuuvtI42s5m+R4dEm2x4No7QH2FgPgGnYDl+dlGthy4D6ZwIzTZUAAZ0gSvYp8UhHnbrJUTVUjDLujMtkYaTV5rANxvjgMXaB20IRd0wpUsKvHYvGbKbWmclOlyPWhfdIwk0xI4VK94sS1uDRJDeS5Gjyge165LrGSHV9eqRCzEmh2Ud1ssBWoZtkoob/gyPQKBPC+R/hvUIkv/6EVl/gwL2MuYuQ"
`endif