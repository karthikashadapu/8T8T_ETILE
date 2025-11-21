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
module eth_f_50g_rx_pp_wptr_gen (                    //need to merge
    input   logic               i_clk,
    input   logic               i_reset,
    input   logic               i_valid,
    output  logic   [0:1][4:0]  o_write_pointers,
    output  logic        [6:0]  o_block_pointer
);

    logic   [0:1][5:0]  write_pointer_phase;

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            write_pointer_phase <= {6'd1, 6'd0};
            o_block_pointer     <= 7'd0;
        end else begin
            if (i_valid) begin
                write_pointer_phase[0]  <= write_pointer_phase[0] + 6'd1;
                write_pointer_phase[1]  <= write_pointer_phase[1] + 6'd1;
                o_block_pointer         <= o_block_pointer + 7'd2;
            end else begin
                write_pointer_phase[0]  <= write_pointer_phase[0];
                write_pointer_phase[1]  <= write_pointer_phase[1];
                o_block_pointer         <= o_block_pointer;
            end
        end
    end

    assign o_write_pointers[0]  = write_pointer_phase[0][5:1];
    assign o_write_pointers[1]  = write_pointer_phase[1][5:1];
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onorGNVG+biyAWQb4DA63TqJnhp3pv2YQa3GemIukICjKyxcU0JZjFLVXIaSjsbE+OHjtFHt6bRkNWYx+tFD81YTML3Kl0QV7/vl8i65MgK1yVvVY0hP/K6j52XMFJq2uS/YgzoI37poCAoarSYWAYHCYjYZYWSR3fYnqX322CefAdtC9L9ytkZpnl80Can98gzbcvvddNnn6biPDDE1FZdP0B1mjBiHDPeK8z6jJhrh1pVjnRGKKfl/RfQjIfCow5Fo0Rx0elkUnCU5/Xayz9PiJP2D0cXiDKng1zunq8t7CEE8ugZ6LuZs9ENCyhSzlAHoNpj4Zph3frhNrBFVBI/RG2zZJyifQBGCeZBy9K7n2BLZYXriOR11CJYIlrieEsTYtHcNrM0yk8ASeCinLt7J4TtKEdEIpWAifwvT8Y3j70dpoiLTuRG7QaaRdYgL1863wZqBC7VEl89hz/A/K6a8fEHgzKgMlF3dPIdKsgkg5lM890qTtnQpD7iljQ0Dfa0sp2aT2DskzZfhidRy39C0mGaGoudnN5xhSoi7gCvv6mYAoC1rtcVsAWDhjQqbqLXso3rAIdlYbb35D2dpZHclIhvFjzt5cJmxrrzdHp0D2yeBjiM7qaBG56xScF05/fMIHLV58EOB61nFF8DKNb1UAz4t0VezB8mF6PJvF/KJalPhT1SOmmjyRlhlS3ZPbNtO1BCZKtrBYJD/EXfdsBbwelrdkc+qA/EtY4U/+3TfrAn5Wafj3MJJaoGlFp7eX/QxoqrRmV+ewzZRtAsIoE9W"
`endif