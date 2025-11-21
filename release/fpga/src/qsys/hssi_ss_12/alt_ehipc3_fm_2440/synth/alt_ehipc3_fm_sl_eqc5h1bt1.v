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
// 5 bit val == const(1b) equality comparator.  Latency 1.

module alt_ehipc3_fm_sl_eqc5h1bt1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [4:0] din,
    output dout
);

wire dout_w;

alt_ehipc3_fm_sl_lut6 t0 (.din(6'h0 | din),.dout(dout_w));
defparam t0 .MASK = 64'h0000000008000000;
defparam t0 .SIM_EMULATE = SIM_EMULATE;

reg dout_r0 = 1'b0;
always @(posedge clk) dout_r0 <= dout_w;

assign dout = dout_r0;
endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B3sI2o3OPgJ4grDwhpL8CHt7s2s7+HlPrT4agdgHb+9kDowPE8JEu/3B4RlocHJ8gGUI1/dcMSfsvgJUjvoI5IoqHMkVN8f9WDzIVpuu11aVpZmdsxIQ0AZKzPu/6t6P19laTKqCnJadcCb5IUQBaZXAVk88jG3MaJ1krKUVaxt1JzPTHQd4nhBk90zhBV06ezf5ewq0cAP0o9giXz1JDv6jRpTcbw1zRaK9rxCtIc1t11cisn7LSWhrpLe2+QJZsym9uyDJ19+GzpPDbe0rGYf6Rr5GhhLxOzgEPyauI4Y65qeQlD2ZglkhPU21npafA6GZnHgHddKdPVS0B4DcU9wbruCyWvn39gGhJt/GCi4mdTfQaOuuXBIqlD9LAPzTnNq5gt+3wkh4o2X3jEvOfuSajBVOlHk19J8rZCH8AGkxzKhfdVwGqAWOOj8MBzeQuXH37ycawYeNTebnkofaKlm7siK4Z8dpB9MaqYZCDhBIu0pWppSVfpqtHNtRmuezXCLeU7lOFbkDp2yFH1bzCjpirXNR68EMs/RCGNDv0NtxFaPruteH583QgR3YxznxDKN9w3E3wMjegIOFdz+BD4eUDo9G7Li31lZMjdUUvyoH4g8wuxd3XN0+naqCczzJkTUL/LZDxRa6wFWAMCKr+5yjy+B5V1JXnEqXVH2+bniwypQ725ygeWd2zHmRqdspJx+E1Ytp7jQW8ysro6SpH+kFQ6DzTv9RL0fcbM08qCPceXMM26nssKcPbQ6JHkz64gZJP3QU2OHNgBes+Bv3Fq3"
`endif