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

module alt_ehipc3_fm_100g_rx_aligner (
    input   logic           i_clk,
    input   logic           i_reset,
    input   logic           i_valid,
    input   logic   [0:3]   i_inframe,
    input   logic   [5:0]   i_ptr,  // start
    output  logic           o_valid,
    output  logic   [7:0]   o_ptr   // start
);

    logic           if_last;
    logic   [2:0]   phase;  // position of next block to be written
    logic           stored;
    logic   [7:0]   temp;

    logic   [0:3]   sop;
    logic   [7:0]   ptr_extend;

    assign sop = i_inframe & ~{if_last, i_inframe[0:2]};
    assign ptr_extend = {i_ptr, 2'b00};

    // f(1+6+3) = f(10)
    always_ff @(posedge i_clk) begin
        if (stored) begin
            temp <= 8'(ptr_extend - phase);
        end else begin
            temp <= 8'(ptr_extend + 8'd8 - phase);
        end
    end

    // f(1+1+1+5+3) = f(11)
    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            stored  <= 1'b0;
        end else begin
            if (i_valid) begin
                if (stored) begin
                    case (sop) inside
                        4'b0000 : stored <= (phase >= 3'd4);
                        default : stored <= 1'b1;
                    endcase
                end else begin
                    case (sop) inside
                        4'b0001 : stored <= (phase >= 3'd6);
                        4'b001? : stored <= (phase >= 3'd7);
                        default : stored <= 1'b0;
                    endcase
                end
            end else begin
                stored <= 1'b0;
            end
        end
    end

    // f(1+1+5+3) = f(10)
    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            phase   <= 3'd0;
        end else begin
            if (i_valid) begin
                case (sop) inside
                    4'b0000 : phase <= phase + 3'd4;
                    4'b0001 : phase <= 3'd1;
                    4'b001? : phase <= 3'd2;
                    4'b01?? : phase <= 3'd3;
                    4'b1??? : phase <= 3'd4;
                endcase
            end else begin
                phase <= phase;
            end
        end
    end

    // f(1+1+1+1) = f(4)
    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            if_last <= 1'b0;
        end else begin
            if_last <= i_valid ? i_inframe[3] : if_last;
        end
    end

    // f(1+1+6+3) = f(11)
    always_ff @(posedge i_clk) begin
        if (stored) begin
            o_ptr <= temp;
        end else begin
            o_ptr <= 8'(ptr_extend - phase);
        end
    end

    // f(1+1+1+5+3) = f(11)
    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            o_valid <= 1'b0;
        end else begin
            if (stored) begin
                o_valid <= 1'b1;
            end else begin
                if (i_valid) begin
                    case (sop) inside
                        4'b0000 : o_valid <= (phase >= 3'd4);
                        4'b1??? : o_valid <= (phase >= 3'd1);
                        default : o_valid <= 1'b1;
                    endcase
                end else begin
                    o_valid <= 1'b0;
                end
            end
        end
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh2bSXNHky/Y1B7INajmn8iCZQGqvgHBuLUeBAgF7wve511xUhfGXcn6WyE9I7ejXr5SN0l/NXU4sAbCfBTiF9c9DHmsFXA8XMoLVi8ZPIH2C0SUPmi52ssmLzcwJoZCOLL+M0gqXw4bCC62tiM2a+sZqPOcqFJvvfUP4zZiMMv+B0M8xIbl2+2+VwzMG8M6eVtqdx8nu0WwmuItZtDTALe3cDE+xmgqM2FozrvgmramLU9HZ/13tOaNGcK21M6x9H0e6YOlvocQblZ2ZZRAXryd/RHb9AyQWfdBc+ZsjSN6hQCUZ3aIS0q7afAZ5CwQG5VT++ywyAfRn5tIcWyey5WRPZGkooZ8D+59rF4JJ+nVYWxLNVW3tDY9Dqs6aPQ2/7im5N0zU1nNRFv9Jnd8mbtSy3nBB9k2+F6s9uGzGXWc5QYzZOnUrHWMHX0WwfJQW88VsTlWPrpU5L+5LCwwMmaykrTtnG6GFzduZ0Kqkves05+amOgJb+jg5p1KVl4Jw5Ig+u6Y6rRAcqMQjfZDLV3VGJ0vifSSTxYjk0Cf+SYCWtztQVVwJCG0GwZptimOPjFM3owf9TMsOSfOHN9r/Ua2tnjcHSRkxXbLe/MAcpO7MukW6juEl1yw5qnWNlxqcsQ2TM4dIeOY7QLFH66f9PwEf9KcOGWnLpLzc1B2L5Iw5bfOvz6BtkdslNZcS5c5GYpkZY/BspwDJpKGnZRK7goVjPgenZ3cQpT/iwE9+qkm9aV13kc6QVbwYgKoLzgMSuyHBk4es0zvhohFEGCRZTEU"
`endif