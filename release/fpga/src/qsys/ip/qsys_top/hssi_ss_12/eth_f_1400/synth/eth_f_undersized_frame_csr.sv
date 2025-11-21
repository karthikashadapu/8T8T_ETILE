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


module eth_f_undersized_frame_csr #(
    parameter PREAMBLE_PASSTHROUGH  = 0,
    parameter CRC_PASSTHROUGH       = 0,
    parameter MIN_FRAME_SIZE        = 16'd64
) (
    input   logic           clk,
    input   logic           reset,

    input   logic   [31:0]  avmm_addr,
    input   logic   [31:0]  avmm_data,
    input   logic           avmm_write,

    output  logic   [15:0]  min_mac_octets
);

    logic           crc_pass_en;
    logic           pream_pass_en;

    logic   [15:0]  crc_offset;
    logic   [15:0]  pream_offset;

    assign crc_offset   = crc_pass_en   ? 16'd0 : -16'd4;
    assign pream_offset = pream_pass_en ? 16'd8 :  16'd0;

    always_ff @(posedge clk) begin
        min_mac_octets   <= 16'(MIN_FRAME_SIZE[15:0] + crc_offset + pream_offset);
    end

    always_ff @(posedge clk) begin
        if (reset) begin
            crc_pass_en     <= CRC_PASSTHROUGH;
            pream_pass_en   <= PREAMBLE_PASSTHROUGH;
        end else begin
            crc_pass_en     <= crc_pass_en;
            pream_pass_en   <= pream_pass_en;
            if (avmm_write) begin
                case (avmm_addr) inside
                    32'h507 : crc_pass_en   <= avmm_data[0];
                    32'h50B : pream_pass_en <= avmm_data[0];
                endcase
            end
        end
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XYEVnOx7i1g6J7voyIfOxgNUVDcc0Lc/0T8dJ1bPNV2DsyDvuT+2BBCVs8XNEoTkWYwv47bNHAEaP3k0RjDRLXb7pMxeVFYO26dRgu7il+LW2Gx5Ywb65nk1JUfyTO2z4hDBiH9aTRC2kAMQSDxTckZwTSzeJJaeA89koFLsv2VT+J1wFfQoVL1YXLN1laNxq/TqbKp6XsJ1p2B8+dp5yr3HUwxowHD7bx01JXvSk3wBx1q+dHRByrtQQRH0MAMtzJdWGDPGRUuvcupHimGVFqJJZLXWOOscuUdZNidDB5jWW1jfzzRYXnmwT3ImZ0rj110j03ML3fAD4feFixrZx7iEi1zI8fcaDKoWMvasWoNbeO97a5PoVEK4+pQpLQ+tgCNfPa9OTSxCdwaoZEGSEzaasE/oNnb/og/fKIYHdiABj6dpyGEWVl5p/tj5hQ8/XHuc+D/Od4BNY7B7sYUhlOFW3/c8IG8X03Ax+DWuY600D1KSHcMsHqPASI0VFrI14URS7iIB0NeIN22REhz5tdK1STMz0QuR/aJsvvcrQIGOYc96A1V1lMAuN7nsU50JEZv2+S2BXSUcYX3GtfS9HzhFuDMNnx189DGOqE9X64l7lUvzCYpG7Y2KKCYxlUtCWCBm6AMtFnFFw1tax3BkvvcFB4/Kh2RN7aCLNZFq0jdELIqjiCarWsPj9CIIi7NAdKl+slj9ptvMInoXBrtlfTCCXler+Kthj1qDlNy3du/dgSM7K9op3r87Jem5IsTvjyNiw95KgRzNW1JyG1GkrLC"
`endif