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
module eth_f_50g_tx_pp_rptr_gen_async (
    input   logic               i_clk,
    input   logic               i_reset,
    input   logic               i_read,
    output  logic               o_rotate,
    output  logic   [0:1][3:0]  o_read_pointers
);

    genvar i;

    logic   [0:1][4:0]  read_phase;

    generate
        for (i = 0; i < 2; i++) begin : mem2_loop
            always_ff @(posedge i_clk) begin
                if (i_reset) begin
                    read_phase[i]  <= 5'd1 - i[4:0];
                end else begin
                    read_phase[i]  <= i_read ? read_phase[i] + 5'd1 : read_phase[i];
                end
            end

            assign o_read_pointers[i] = read_phase[i][4:1];
        end
    endgenerate

    assign o_rotate = read_phase[1][0];
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onrysVm2RDVuNL2kmxKjYy0e4OwtJFMVpqyixkHCr1tB5tXr0bfLZafr1lTdk9TIzZ5GqGXkYz7Z8NwsKofogczcrpH+DwSNWWD+0EPeTpkRCxalbcYD9HozjkR7oba/khnAhSez+1xzJ27cjX/8xMYV67nhYYFx6evG7/QfDmARfe0Dpf5n5gOlJCD0ZdB+HjTsxhFlgWRl2yDtYJX/zJ6LAvRaBemCBBcVh1mAC2jwyaXxbOseLJUMvb79ZIg3/E+eyWTWs9eUoP9GUrvVWJVbnPLUpuNGUi+Hhajs9fSRdNAjJRnY2hdQebQ4hMHKCVDWpxFvb/8rqBeiSkeMbGHuNbM1R38GuI62Nbblwl4bLLhlamGk+J09QJv/OKOWst9H4qL0hhBZaVaa9I0AcD5VvR1lcyWwGlcUlLvLXfrvdlsWTcPxc9qGcPlbdrRW6itX3ehRUMaqPPw4v0g5Az/n22x9Txc9QXdTa/0RKCzRSigEA2aPQa7dlYtrdIoISJfPQnwsbD+HQX0Rj64ChYK4HHIc8W38eLk/tYwRt++dAwVbvKIO8+linYlxfp12Ib3nbXWx96qqJahm3wOE0oqs5dsZdF/AFsIw39zMdXPUlzQivv6VATHNx0cQl6MQeSnsKyjxL4xY0WtzDmpkWjZrsrytv73gciYSFQA2fLCDcOtBlQnICFXvThr7cuaM05Xvf47RklzfI3QDgNfvh1VdFTpc/CDNm2ZkuZxWHybW2xoCJem6EqCMDda9HgnKCMKlPO9WYXNPNse4IttGDR+8"
`endif