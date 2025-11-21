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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on
module eth_f_50g_rx_wptr_gen_async (
    input   logic           i_reset,
    input   logic           i_clk,
    input   logic           i_valid,
    output  logic   [4:0]   write_pointer
);

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            write_pointer   <= 5'd0;
        end else begin
            if (i_valid) begin
                write_pointer   <= write_pointer + 5'd1;
            end else begin
                write_pointer   <= write_pointer;
            end
        end
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onqQg3/mJ6FAW6iT+dBZII1YAZbvv2SsXhR58bcY2TgW9/yuy5+4RoNmDrkWJSQsn6WQgQQI67VKMGVlAD0s5HWtdmhP73LkD9nVRKAFezyn0XS1mAfRHImP5J1pwaMXX/6ek9d4pxMFHQmyQgDzoWqmg4qyQcck+5jo++ldLFcoHYgVB97g0DUNNiBOPYdPFuRLRNOJmP6JVksVCfQC/nZTQOQJ02b0er/Fo2cw+CzN7E5vKe4AnEVAOxbr+pEv8ogXXuOnOiILUXFfrBId0YaWhlm/cQeL17jrbtkVDLsdz/ctpseVWJsaUAocM9ThownEvm7r0FPvcvjqktRAUBW7DgOY942Utz6C4BVqLd6YC8293IymX+zURABSHpx6ws4eiYznHlr/Ci124LTauritOBTSirdrMr2RnFYD0wb560AoRuN2rN3+Hh46MkrXSOqi302kinqvde3SS7Z5GtX4pcxyhrHIlLx6pGgxnSLP6xVjaHBp7rkNChpJfdcM0h8m5o2Upzpq0s8M5B4A/1Y6NtAsYPQV5srrnir3kamfRvF+2qQPTsM6B+sIKkIWNgsniLLQMTHs0F533VNpmg5QrpmBcntqAg3bDW3Z24R4uY8CovPN/puYmxuCugGxaMM+vby9/cWmGEmcF3ERYf3YNhvvt5dvtpfAAVm8uGW5QLklpC0Mo+3SAz379vcxhYgYq5S96STmF2jyw1Gc/JcHBF9pqoCfUnQlRZlEF2KiFe55w4aYnPZKxBpFegJLp7oLam7lf44NpQxki9Yhoapp"
`endif