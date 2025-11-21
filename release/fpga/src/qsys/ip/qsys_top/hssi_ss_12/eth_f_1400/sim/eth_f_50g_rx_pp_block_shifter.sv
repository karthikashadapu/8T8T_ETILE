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


module eth_f_50g_rx_pp_block_shifter #(
    parameter PW = 7
    ) (
    input   logic               i_clk,
    input   logic               i_reset,
    input   logic               i_valid,
    input   logic   [0:1]       i_inframe,
    input   logic   [PW-1:0]    i_ptr,
    output  logic   [PW-1:0]    o_ptr,
    output  logic               o_valid
);

    logic   phase;  // Phase of next block [0,1]
    logic   if_last;

    logic   [1:0]   sop;

    assign sop = i_inframe & ~{if_last, i_inframe[0]};

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            phase   <= 1'd0;
        end else begin
            if (i_valid) begin
                case (sop) inside
                    2'b00 : phase <= phase;
                    2'b01 : phase <= 1'd1;
                    2'b1? : phase <= 1'd0;
                endcase
            end else begin
                phase <= phase;
            end
        end
    end

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            if_last <= 1'b0;
        end else begin
            if_last <= i_valid ? i_inframe[1] : if_last;
        end
    end

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            o_valid <= 1'b0;
        end else begin
            o_valid <= i_valid;
        end
    end

    always_ff @(posedge i_clk) begin
        if (phase) begin
            case (sop[1]) inside
                1'b0 : o_ptr <= i_ptr - 1'b1;
                1'b1 : o_ptr <= i_ptr;
            endcase
        end else begin
            o_ptr <= i_ptr;
        end
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onrurpe4MRcein8itdrZVjbT43312wwEBKqkhLRQhhwB7J0Yq3PRKXmlvl88KyL3kJIZj1q1p/vT0U4GFig5JY9TsTcfFHA7qM57wICZOPYhINttEzaDBxPcxAXGAXup9zYRSajFVL+etAhQQBmJVVQANgj96w36zooeGWAgAtXgn9gOH7/ksxpt50Ki/bhmio9CQ+Qr1U67+fJxPq8jVtUjEYK32ZobJNdS4F6w2+6YMsv+bpEcaMjQocs6O0UduK8qYJ8iOQBjD2/u8Ktm8MvH0kOU6fl6Jt5zeHdL8KvGKTyfFGZZK2pmwG+C6QA50O6wUONFKI+dSz4lbrfoyd1xtRfDQAP5Ov4UojdmzHvJL0OGFuOsvLoZzDlTDtHvPxWrTBY/ehZwKOIuKVEfvMr0zv0VBdUpaTPoBWwkhaYcI+DCW1+jC8MbVuwb10kNdnCBGUEsgZ3vmLFJ1PINPS7VE63Ze2OpCehbWKMPGy7G2dALZyeWLEetBH9gYRbFGyAzPl9lITlyEFWBZLdJ/OMzSGUA6BHDg7ByaOFrwykE8g7MrqeiNw6Tc3t1jYoHUkpYNPodF/eOu6JeL4vYReoRSgPqc+3MnUY/2atPM4nOznpKCCbBdNgFj612XpOzlMMAC8ZReO5QNfknjUvGfVBQRONBcvVUQP7Grqj8n8ehuTvQxMEzuahaAQleN/VbEQqlG97rjzWcFcwu1kL1P5uh4hHUL2meYjg90xzUUHa2k60XUcZOiCU2lVD/li+WolSKp7xniZFR66VvFGHJi+Lm"
`endif