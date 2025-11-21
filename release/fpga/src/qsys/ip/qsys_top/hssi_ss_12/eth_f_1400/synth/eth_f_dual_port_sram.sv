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


// Dual port RAM module designed to
// infer a RAM block
module eth_f_dual_port_sram #(
    parameter WIDTH     = 8,
    parameter DEPTH     = 16,
    parameter ADDR_BITS = $clog2(DEPTH)
) (
    input                   read_clk,
    input  [ADDR_BITS-1:0]  read_addr,
    input                   read,
    output reg [WIDTH-1:0]  read_data,

    input                   write_clk,
    input  [ADDR_BITS-1:0]  write_addr,
    input                   write,
    input  [WIDTH-1:0]      write_data
);

wire rdenA,wrenB,clocken2,clocken3;
wire [WIDTH-1:0] dataB;
assign rdenA = 1'b1;
assign wrenB = 1'b0;
assign clocken2 = 1'b1;
assign clocken3 = 1'b1;
assign dataB = {WIDTH{1'b1}};
altsyncram fifo_altsyncram
    (
// Read 
        .clock0          (write_clk),
        .clocken0        (1'b1),
        .aclr0           (1'b0),
        .address_a       (write_addr),
        .byteena_a       (1'b1),
        .wren_a          (write),
        .rden_a          (rdenA),
        .data_a          (write_data),
        .q_a             (),
        .addressstall_a  (1'b0),
// Write
        .clock1          (read_clk),
        .clocken1        (1'b1),
        .aclr1           (1'b0),
        .address_b       (read_addr),
        .byteena_b       (1'b1),
        .wren_b          (wrenB),
        .rden_b          (read),
        .data_b          (dataB),
        .q_b             (read_data),
        .addressstall_b  (1'b0),
        .eccstatus       (),
        .clocken2        (clocken2),
        .clocken3        (clocken3)
    );
 
  defparam fifo_altsyncram.width_a         = WIDTH,
           fifo_altsyncram.widthad_a       = ADDR_BITS,
           fifo_altsyncram.width_byteena_a = 1,
           fifo_altsyncram.numwords_a      = 1 << ADDR_BITS,
			  fifo_altsyncram.width_b         = WIDTH,
           fifo_altsyncram.widthad_b       = ADDR_BITS,
           fifo_altsyncram.width_byteena_b = 1,
           fifo_altsyncram.numwords_b      = 1 << ADDR_BITS,
           fifo_altsyncram.maximum_depth   = DEPTH,
           fifo_altsyncram.lpm_type        = "altsyncram",
           fifo_altsyncram.operation_mode  = "DUAL_PORT",
           fifo_altsyncram.outdata_reg_b   = "UNREGISTERED",
           fifo_altsyncram.ram_block_type  = "M20K",
           fifo_altsyncram.intended_device_family = "Agilex";

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XY/juV6xg7PS1BNOkbTKqBpWHYvWVuVrcApI3PZYvUGJA0v4WlTEYF3vDXiZdiiPPqAsKAJC2OOSTSuURCS278iIaS2cu0oZEPKhsGd61tOx40WewAVz+gxzapFlc6AxoxPHen2kUSQeGIEUK7zVACHftQrzzvD50e0AJC60X99WVGXvsiB6LVW1a386w7bKsqXsrzqkebc+Ce1Nb5eDLTEHk+wOgFpXKfznX323N9nX1VDIEcyhd66lqrfAdIE1eZ7NkShFsL/Z97GRsIrc/CylHGm4xAh+bCvWxzq1vyrGl5eeeHZ/IIlEX7w+GWtMVrFNsPPOVd/D/ADXb0QpqAGPuZm/ETwGYDdhTWbuS7Xp1LjrRiiZlJx8bs3LZgR6SLyNJmkBs1onIR/qIX8DzGyIr/BQY2NGHV43i8RlIdNmlfTOlRA475ibvBP1ZBDVhcE/UPhy+DbMA8xNXDViZQzVEBw1uKtJk9GrEmLdmy/OI0eM86ZDjg1HCwOx59DUf5JHA+ODLtW+7ikdxYfjHFHR2NYsWHCWmkwItB5IsaXgAOP3iTatLss+tw3jeuSDqaLEdFENBF+CST3WQtoQUXSKDj+4eVSmH1b5n3WKFkwl9ARDQZ/MppKoKGXhQds38aeUgypR//BWnsnnEyX+YJ1bYCHlWE5KXRDwyMZo4PhU7jtmCwwVqJNb68MOVIu/ogu5mdeWIxt/GvLiRi4OfljHeF7oB78tTRpRzRaxhLa/U0JSkQite8kjzLmNW/gpJDxqzM2TZbUWP4I2oEnw4Sa"
`endif