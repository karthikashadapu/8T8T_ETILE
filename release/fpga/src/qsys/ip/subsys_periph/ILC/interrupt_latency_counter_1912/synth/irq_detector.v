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

module irq_detector #(
parameter INTR_TYPE = 1'b1
)(
   clk,
	reset_n,
	irq,
	counter_start,
	counter_stop
);

input   wire  clk;
input   wire  irq;
input   wire  reset_n;
output  wire  counter_start;
output  wire  counter_stop;

reg irq_d;

always @ (posedge clk or negedge reset_n)
   if (~reset_n) begin
        irq_d <= 1'b0;
   end
   else begin
	     irq_d <= irq;
   end
	
generate
if (INTR_TYPE == 1'b0) begin	
	
 assign counter_stop = ~irq & irq_d;
 assign counter_start = irq & ~irq_d;
 
end else begin

  assign counter_start = irq & ~irq_d;
  assign counter_stop = 1'b0;
  
end
endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "htI74XiHCI2kdqVoidtQiKIqa+ANxG0GXV9AaLJ9iPdlXWCzZdfqzW1yJfZkgk5NtywlGbSKcXRbnZNJunuB+wH5XA92YcWlOeMojzBciQ/reXnky4RJN4ejFQJas6WhMtLRUNy474ZOqfXslY6ZYBvCIWiJhlqqPEMN+lNDEpIg3ejy9CccsMu9TbJnuzfsgW/ZulLTfEyUKD1D0ONwcnE93yDlBejWO7N+hstxUWXktFLafTaqYubMtaLkqZbFls84AvHiVHDXHopx8N1N1qN3hxFBZDEZhksyN5cBw78OY4520iuq6vmKgqolGfXS4vhs3YaNMjoFknREqwV/f59mn5Y5dU6zJ8J2hztotDVIRUs36s54BlLoSTK0Nzdvr8UQ2lZsxm069KivQ1m/0eMJt6LCwdOU729STuuvstNMySb3qJ6HSUzKEYy3A4xN05kLQIRKMIK/9DCyykUyXZU/K3LrBwfSyuPVOYKLxlQ6cIxl0RvLL2ubq+7BRMPuMf8bLxQs3daNvDceapituvPhvCgffRkjg5iGaZsVfzgBl7rAawmt2Bg3s0MuCVMjNzi1tMby/y8eCq9V4C36eF1U3cfy0ctyD7eGfhqk5k0U5TIa9w6Z3SrNB8hGQ+UKUPwu2SdK4wmslZTgYS3nluz8ODGZgoMpOnYN7EwBkb/q7sZOjyX0pe6Ny6V13mLIwOrPZbrjnmjrTKt65JVd9dW0ytrBj56sZpUhNNdRA3t9G+9tHwUCHkxwJlMKrqIxg6LJ5mIx7fke99ckOdp9xXg2r9Ib5ZbA1vOKowYj6hjMn7qxKEQdTdOTdXuCOqNKl15f7nLBjrTTwSoga5L8uRg+gadsiPQC7K/QfP/CaKTqrpWqjG3bf/hvzu8YvlfJVA6vvL9oWmDsPP5D6HzceqFOZLnMm3QfxhtUpVxQdy+hP9K91n3ll+HblK0Ys+Fl1KX+8KfNZZ1eqUsIvcUh+d5H/7/amthNU3aTygdJ8sQDMTX/klwUZPrUL6pbVDJy"
`endif