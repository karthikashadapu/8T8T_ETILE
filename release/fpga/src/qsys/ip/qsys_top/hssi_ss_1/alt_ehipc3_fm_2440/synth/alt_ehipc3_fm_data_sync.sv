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

module alt_ehipc3_fm_data_sync #(
    parameter WIDTH = 32
) (
    input   logic               aclr,

    input   logic               clk_in,
    input   logic   [WIDTH-1:0] data_in,
    input   logic               clk_out,
    output  logic   [WIDTH-1:0] data_out
);

    logic   reset_in;
    logic   valid;
    logic   valid_last;
    logic   valid_sync;

    logic   ack;
    logic   ack_last;
    logic   ack_sync;

    logic   [WIDTH-1:0] din_reg;

    always_ff @(posedge clk_in) begin
        valid_last  <= valid;
        if (reset_in) begin
            valid   <= 1'b0;
        end else begin
            valid   <= ~ack_sync;
        end

        if (valid && !valid_last) begin
            din_reg <= data_in;
        end else begin
            din_reg <= din_reg;
        end
    end

    always_ff @(posedge clk_out) begin
        ack         <= valid_sync;
        ack_last    <= ack;

        if (ack && !ack_last) begin
            data_out <= din_reg;
        end
    end

    alt_ehipc3_fm_reset_synchronizer rst_sync_0 (
        .aclr       (aclr),
        .clk        (clk_in),
        .aclr_sync  (reset_in)
    );

    alt_ehipc3_fm_altera_std_synchronizer_nocut valid_sync_0 (
        .clk     (clk_out),
        .reset_n (1'b1),
        .din     (valid),
        .dout    (valid_sync)
    );

    alt_ehipc3_fm_altera_std_synchronizer_nocut ack_sync_0 (
        .clk     (clk_in),
        .reset_n (1'b1),
        .din     (ack),
        .dout    (ack_sync)
    );
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh2o183RzYoltPvwKZ6YCY6DtsOhl4RMS38GSMIZzGxM5OMY4fkY7cefA3Xvip1e0eB0W3Xdx8DDjzqFjvUbDnPdvoC3mkr3fdr6BbnmjVFzdrOHADuc9o1dUTn/c0SFqCNVgHD8I53QSn+RV2M9xyqsC3TrGtMczEyiyzJNdvcLs/DpiE8HjFf+g64meP3EGSFVolqLJSnx6Bjc55Y2Xu0Ez8RcZK9CZB0Jxxe8pfScNTt+AebvU8eaXnVhpH4KJ0JVnduus/kLNfzj/EMLibXaVYcN6qEoT8u58USG967OXErEiOBvgm+FzB6e4nMjb/ZMwAGDmTp08QIl6DYXUPGQ5MbURG+7BIhOUlD0+hiSsug/2C2SSK+cgdl2ta4jGjVza9FJOQVnaLfCra3AinNpSvIhi2uuK1kItTSVU9YeNrRPOgY3b8nAQ9pkv1fbbMpwHvGTKDYSWe/cinxZJAmyuzDQ6vYbTG+6SuA+nrbLXxXVnN1Iybv/+A05d0zLJsggVmhCKoClzCXR6VXReVLcxuC6tSz0eTjJKolpmCrcqUqC2aKogVcdUjDPmyrzGt5D7Qex2oRpcHHkl6nN3Ti94/lpfEfPjysy+3KS7uGcPXTxeInG+mIkIWfxk1Ow8FqyD8nVZbolef1x5UTfVVu0xnFIyVIdIhSQHzesvCq19n6owicZ64NxySLNXKZ1U02GHE401WJD2V4f3pm9fbUExPvZcoD9Ue0L3T/At4jRlBpZVN4kY3h0UBJFzGbwC/FLTla3z9Ug0OyJyvtK4Oru"
`endif