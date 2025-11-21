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
module eth_f_50g_rx_pp_data_rotate_async #(
    parameter WIDTH = 8,
    parameter PREAMBLE_PASSTHROUGH = 0
) (
    input   logic                       i_clk,
    input   logic   [1:0]               i_index,
    input   logic   [0:3][WIDTH-1:0]    i_data,
    output  logic   [0:1][WIDTH-1:0]    o_data,
    output  logic        [WIDTH-1:0]    o_preamble
);

generate
if(PREAMBLE_PASSTHROUGH == 1) begin
    always_ff @(posedge i_clk) begin
        case (i_index)
            2'd0 : o_data   <= {i_data[0], i_data[1]};
            2'd1 : o_data   <= {i_data[1], i_data[2]};
            2'd2 : o_data   <= {i_data[2], i_data[3]};
            2'd3 : o_data   <= {i_data[3], i_data[0]};
        endcase
        case (i_index)
            2'd0 : o_preamble <= i_data[3];
            2'd1 : o_preamble <= i_data[0];
            2'd2 : o_preamble <= i_data[1];
            2'd3 : o_preamble <= i_data[2];
        endcase
    end
end    
else begin
    always_ff @(posedge i_clk) begin
        case (i_index[0])
            1'd0 : o_data <= {i_data[0], i_data[1]};
            1'd1 : o_data <= {i_data[1], i_data[0]};
        endcase
    end
	 assign o_preamble = 64'b0;
end    
endgenerate 

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onrUqDBKSt8B6pDhONpcxDWGnPr0NaQWb9ETosjmL8/lQr8HuhxZUzj/ST/aFWEj6Uu0eo2v8rVjd6MZ25pil5yo2qM7TWJT+VrXgmWZoi8eP7tjXDKpLXXqX2u7WhSqD6C3+3War/Ci/GHHArYbizLaTePYhbPzvXDJkOFIjFgoCWTxe2kcPHvA70fa5HXD5pigPvbA3kch4UK49M1wF2EEsb2G+DwOU5cd2kaRt/Mpgn/+dSwor2fBAzZCwBKm7t3KLaf35bBeU4d/vieKQotqYISHEr0z0Wi0rIADWbc1Q9PMv0H7rAPYhHKCu5hS9F8WpLV51moA24zYZ+bYshXTA8qnLEr9nOYPfDgeWJeBnFgvBZJVsGmqyPeURAmEiYSv43AcuDvvJzoLsfwHhj8UZJW1rT8FS8nNXg0RzMoAZ+2eCzfNAMFHG8Pv4MkBwZ4oKRlXr+axKacmcmG94EYwdKgy5uQqXHQFp7+2VxUhGQhV6IVeDhLmHspR5kOE9QGM6njxrmrslkWUVGs5p5bt1dvETuZRBIjKkAGw8r3vhV02N5OKziYQPhzZtgypZ1TrpfqcPX9upNNjRQHVyqQytkX3DPVwaYltOOaOeUwKDCWk07WGoMZzrrFTrbcCDB+QlVzIfLWtMMzx7kvg9rpQNLRA1ysdM7UZwpnULQvcY42mJOeOCer/kC0uSrmTU70t3ncM2ky+LZDNF70RFebtQbm2j4xyEmsZ9vg8RTA+1FiY9PD2/hwUYkTp4bA0PFGe0n3hKFc1jOT8eoct25pP"
`endif