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


// Clock Monitors
// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module alt_ehipc3_fm_clock_mon
  #(
    parameter SIM_EMULATE = 1'b0,
    parameter SIM_HURRY = 1'b0
    )
   
   (
    input wire 	      csr_clk,
    input wire 	      cdr_ref_clk,
    input wire 	      tx_clk64,
    input wire 	      tx_clk66,
    input wire 	      rx_clk64,
    input wire 	      rx_clk66,

    output reg [15:0] khz_ref_phy,
    output reg [15:0] khz_rx_clk64,
    output reg [15:0] khz_tx_clk64,
    output reg [15:0] khz_rx_clk66,
    output reg [15:0] khz_tx_clk66          
    
    );
   
   
//                                  100       011          000      010             001
//wire [7:0] mon_clocks = {{3'b000}, rx_clk66, tx_clk66, rx_clk64, tx_clk64, cdr_ref_clk};  
wire [7:0] mon_clocks = {{3'b000}, rx_clk66, tx_clk66, rx_clk64, tx_clk64, 1'b0};  
reg [2:0] mon_clock_sel = 3'b000;
wire mon_clock_rate_fresh;
wire [15:0] mon_clock_rate;
alt_ehipc3_fm_fmon8 fm0 (
    .clk        (csr_clk),
    .din        (mon_clocks),
    .din_sel    (mon_clock_sel),
    .dout       (mon_clock_rate),
    .dout_fresh (mon_clock_rate_fresh)
);
defparam fm0 .SIM_EMULATE = SIM_EMULATE;
defparam fm0 .SIM_HURRY = SIM_HURRY;

always @(posedge csr_clk) begin
    if (mon_clock_rate_fresh) begin
        if (mon_clock_sel == 3'b100)
            mon_clock_sel   <=  3'b000;
        else
            mon_clock_sel   <=  mon_clock_sel + 1'b1;
    end
end

reg [15:0]  khz_tx_io_phy_i = 0;

always @(posedge csr_clk) begin
    if (mon_clock_rate_fresh) begin
        case (mon_clock_sel)
            3'b000:  khz_rx_clk66        <=  mon_clock_rate;
            3'b001:  khz_ref_phy         <=  mon_clock_rate;
            3'b010:  khz_tx_clk64        <=  mon_clock_rate;
            3'b011:  khz_rx_clk64        <=  mon_clock_rate;
            3'b100:  khz_tx_clk66        <=  mon_clock_rate;
            default: khz_tx_io_phy_i     <=  mon_clock_rate;
        endcase
    end
end

endmodule // alt_ehipc3_fm_clock_mon
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "zxbEFFp84WYRbJsb0HIMeuWjbOOv1K7QQFpH53Gb3V5p0ZRDdhsMAxwP11nnT9uCTG31WcRFMGv1Y3sp3Jccq/UYKIiEbrkv+dnQkRqN6m6gKWqiXtHiiORyaZNWlpsJ1uOJVOw5+WI+1xrepR1EmwGCsDi2F6K1UWIUsyOHvXTbPREtmL97zvP7WTaw1mXrLe+4BbR/6Dd7pfQ4tTt2P5iQPOMdgtxNDjbWzf8Mv5Ojb3ktP5TTr7n1tEtQPRnGRCVCUZvsNO22SiAujDDkn9gQcP+qrT5fywFs34AMwSNSmHTYm+9ADDTkdHGwLXTMBib9JFKBLI9HW8atgMEV95ZAyjaWIwWDRasD4qd+gqsrGx0UsvsfHYu6dUDf5JxWZaO6RSxFiNRdSorK9+vnOn2ak7HY+O2X3CHaO4Nq9e+53NpAqOWlvHg0TW70Uk/ztbYdHFRTGzIVIuXk6mWvA+donx/FA/rZnhzf//u3oQKA0cJD0l93kMVv3L/oxagy1gWSYwGT1dOeaGOz/c4dV0G5nwGaHSg8w7G4HHIfRjzpHuR6TDytuZH9LCPsikjppyqEcEzjPrOGGoW95mbE6N4J/dXozZs5xG8a2Cn3U55IpByDJOUuAx0XokBd5kXjI7/krAgS5YR4cE8iqlL8n3Ekc3D+5ALzA/RAMgPh46ZV3PRmwRl+Bf/Y5Y38uEmyu8/r7PX7oqCBlEO9niAtWszLijwsUF+uCxc8LTtpk7OTmK70PqyT/xI0DEDcVWQDxy0xd63Czdd0m/QQ5T7t96r0Cpi0ZEMemylKKeUdR2mBIspiyMfGTgLJLT4DQkpgKLjUWFZI7jF9Fhwxg7DtjUHZjTMzUR+PgI9YjtRO1hV6npj14hEPf3bM/YQA1znCYcq0KA3APDSEggVLz8uRXflcY9HHkdX5SRMv/iz73Ancpn+XDRfB1MNJdrUcBRJSd12jkR9CwTCuArNzpa2ZRUQ4sRVYASVT3aO5HhF9Iu7If0BclWiPztWEaTPEP93V"
`endif