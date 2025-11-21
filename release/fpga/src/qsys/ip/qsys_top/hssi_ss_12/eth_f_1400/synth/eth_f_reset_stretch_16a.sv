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
module eth_f_reset_stretch_16a #(
	parameter EHIP_RATE             = "100G",
	parameter COUNT_VAR       = (EHIP_RATE == "100G") ? 1'd1 : 4'd1
) (
    input   logic   i_reset,
    input   logic   i_clk,
    output  logic   o_reset
);
    logic   [3:0]   timer;

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            timer   <= 4'hF;
            o_reset <= 1'b1;
        end else begin
            if (timer == 4'd0) begin
                timer   <= timer;
                o_reset <= 1'b0;
            end else begin
                timer   <= timer - COUNT_VAR;
                o_reset <= 1'b1;
            end
        end
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onpdmKi+VJeY2Vvb3hbGQYtEtmjIfCx9cWAqttsLQwh0X9Jflxx0xCB++8YQ82J+6TLeGhN4cM7PCej2WHIaBf5V00rkdGaoQFWECYEhElj83JDcxPwhFQbnA+RGt19/VGPv5rr8d+C/t2RAFJgY8r0iLb7WCo9ytIrEpu7MpKtKfHiGEDKPEswMOaKowWmEa10mEedvEAcXOUViDGUA/m7CwWxo18d/utUDgLggP1QEp5fa+u6072cA77URZBZiwbkmU341qqqpE3ExWg0xkOhsq8S/4GYFvAODfIVkfne1KZNP7Jg2fEnoOUdG+R7XziGJ8rJNoDSZljPZFz9/O1pE5JtiiGuDST88Pb7uQSAEEMQ1qw/ySQPD997hT47tJZ5ksWY0x1J4fyEaiHdMpVGlSaFVwkSCmxJaBZ+g8EJhvHTgnXdmk7/ThFpZoIop4kW/TMh3DIcP7IRry9n81eHDEybMs8A8IQ2Omi7fQIc8KGEteF7btd8luGi38y1+DgsxBXgiYNQiQ4H/n2SGgx8ArF3gt7nmg68ycj8nbgNFfCQVCwR1DYRvvJCA9znaRGgDlprPjc9qqc3Ea6tHaTEF97LrCwuMkCTijUeXVAAQOmTrQdrV6oj9Gu3KKvaJNfscEXxi1m/+ICqxiOHH8EgEFcF/HwnSTGWZ6MvHtUxOKPGef5s3n07+xBBVcHASxDlC2RnK63dFqlYaRbeUwtJJwai8aPBwVgpzH/vegKKW0Kwh4/DfzPGqZpGrPIzFN6sW9yIwC+imeHI8v248CEEL"
`endif