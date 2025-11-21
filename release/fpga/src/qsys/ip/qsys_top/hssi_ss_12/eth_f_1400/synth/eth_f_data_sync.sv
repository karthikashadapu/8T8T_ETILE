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

module eth_f_data_sync #(
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

    always_ff @(posedge clk_in or posedge aclr) begin
        if (aclr) begin
		valid <= 1'b0;
        end else begin
            valid   <= ~ack_sync;
        end
    end

    always_ff @(posedge clk_in) begin
	    valid_last <= valid;
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

//    eth_f_reset_synchronizer rst_sync_0 (
//        .aclr       (aclr),
//        .clk        (clk_in),
//        .aclr_sync  (reset_in)
//    );

    eth_f_altera_std_synchronizer_nocut rst_sync_0 (
        .clk     (clk_in),
        .reset_n (1'b1),
        .din     (aclr),
        .dout    (reset_in)
    );

    eth_f_altera_std_synchronizer_nocut valid_sync_0 (
        .clk     (clk_out),
        .reset_n (1'b1),
        .din     (valid),
        .dout    (valid_sync)
    );

    eth_f_altera_std_synchronizer_nocut ack_sync_0 (
        .clk     (clk_in),
        .reset_n (1'b1),
        .din     (ack),
        .dout    (ack_sync)
    );
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XaX23CGeh8bwnDkW2R1uG2uxOuBBQqdTcnscVZ8cf2PRQVtgDQUWCSf1GmsRNefxCvhiulCtBoZBTMXvTo/juI7MKQ51M7GuxKoIt2eT+RoK+voOCsD/IqeU1rNUqvo8p9QI+cuE4VIsrjLcQn1i7LI8J4GjC+a2jfQij4v5f9c+SVhnik7r0rqZfENBsW2nde2b8uW4tgbmNxDXCW5tzB+sej8iFaSoTOVtekdO+VRKe+wM7swivDIEVjZmHfNnMp+BaURvgKiO0vTC6R2Qqat8hFa8egSqTxdosCY9BiyKxMvBlA0L0vkiyMpq0od2rPa04hDX2ht3+4OAcY7qF3deqliWSlCuS8ikmb6bNPVrwKcxJQNbbh9WhrYX2jocIU3QSw4VA8uvHnxhYmh2oXusiYv5Pv7dz57L26Ai1Gat9S64C+/ps3IZ6+LfY+9UhFNBRDeK4P2TS9F39fkjGSnxMjouhwx7Juia5WnbQbbKE6mMBkErY81Zzu9AlnG4c0YTppyjkF0nLaGBLU5ii8VNYOx/llkrV2oeTSYk1b9vCqv09oVIy/uJFTx1EFRzsiUmkjdOzVybTuqwd6LNI65WJ8hT/Xg0IkjM01pdejXpEmi8S3VxyhOJI8Dbbi9RXZzpIa8/uVKpzoK2fw3GHCqEq9gKYjxj909/OpxaATbD3/0T7rnfcetfu0D78xGwQx8TtXFtzncotnuCLHD7xC9NxI10SjoLaOeNWMaUNwAbMPcTqsrgHkWlotRUYYsS17DPBj/sgJW0n0S+DAcWy0f"
`endif