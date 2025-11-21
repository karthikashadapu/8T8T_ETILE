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

module alt_ehipc3_fm_kpfec_cadence_gen (
    input   logic   clk,
    input   logic   reset,
    output  logic   cadence_pulse
);

    logic [5:0]  cadence_counter;
    always_ff @(posedge clk) begin
        if (reset) begin
            cadence_counter     <= 6'd0;
            cadence_pulse       <= 1'b0;
        end else begin
            if (cadence_counter >= 6'd16) begin
                cadence_counter     <= 6'd0;
                cadence_pulse       <= 1'b0;
            end else begin
                cadence_counter     <= cadence_counter + 1'b1;
                cadence_pulse       <= 1'b1;
            end
        end
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "zxbEFFp84WYRbJsb0HIMeuWjbOOv1K7QQFpH53Gb3V5p0ZRDdhsMAxwP11nnT9uCTG31WcRFMGv1Y3sp3Jccq/UYKIiEbrkv+dnQkRqN6m6gKWqiXtHiiORyaZNWlpsJ1uOJVOw5+WI+1xrepR1EmwGCsDi2F6K1UWIUsyOHvXTbPREtmL97zvP7WTaw1mXrLe+4BbR/6Dd7pfQ4tTt2P5iQPOMdgtxNDjbWzf8Mv5PNxKmuRC+DuH0oHonpuqFwp12VLjUbNp6IIgr0+nt9kzLzoZtr+IceGKiGnqqKd2D2uLoEBq7/FaMveRdOFgfIq1zlJ61SDRfsySM2ODzPrtZakQRIAaRyuzOTuyvxBtNGkgrqJeJvTs32+dPmG3nP996uMtJEajs1LuEZhN3MVrCIokSGD2XpJPj+FzHeT4EWU6Z440Z48gCK/qVa2fo7YBqFXPuPeAzeC8TPCpz1f12+bcSk6xi+Hf6P/ZogbyuO96gKXe8QgeqEvcPEl0SwXJ03ZZWpzxjoDhvoUtGMWxyEFgZ4WC6ZvoBwN+zVzafw3ExZvlufUTTnuZU3VSQXCwsMBwMRPT8u2GDJh24RthrTq0s6Yyl5w281aySDw3rYrOdKkfOovZFfrhxM3DGzmCudacv6P2sYRLHT6JetPNj32w73H+ureJn97Dr1hhdm7CJGYAH/1Qzg1QGrkMdEC28PQmLFQ2wCwImaWjdT0ELUdEQ/QHcNfoj/i+d50xSwAHcYmpnr7LKyg5z7cnTRMpXlxqXost3YzNpfhBdhNO6Rr7rkDXKfreOy3G7gWfm1Orn2HsHOjTJLc5TWYANJVQ+NeUFx6FS4gmfQx3XsRppO54Fkt0LWn4AqXW5JEJjXmLl1EuaFK5ZVgTf/zecwekTB5KiLvhZ+oIUH6ybNnG57QQxQFYLbgSyIM5h9fVa5kssiDkfaZQH6h4rYFZhj2++GzIJwKKGd/sbDRuFg6bazjTlY5aRA7zVCzxQFaWyODiIElnjWPDi4YwQH1tnn"
`endif