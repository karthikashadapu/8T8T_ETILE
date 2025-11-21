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


// (C) 2001-2020 Intel Corporation. All rights reserved.
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

// ==========================================================================
// Project           : HSSI Subsystem 
// Module            : hssi_ss_rst_ack_delay.sv
// Description       : 
// Author            : 
// Created           : 
// Changes           : 
//                   : 
// ==========================================================================

module hssi_ss_rst_ack_delay (
  input                         i_clk,
  input                         i_rstn,
  input                  [15:0] i_ncycle_to_rst_ack, // Minimum value is 1, Maximum value is 2^16-1
  output                        o_rst_ackn
);

  //----------------------------------------
  // Signals
  //----------------------------------------

  logic       reset_req;
  logic       reset_ack = 1;
  logic [15:0] ncycle_count = 16'h0;

  //----------------------------------------
  // Cold reset Sync & Ack
  //----------------------------------------

  always @(posedge i_clk) begin
    if (reset_req) begin
	  ncycle_count <= i_ncycle_to_rst_ack;
    end else begin
      if(|ncycle_count) begin
		ncycle_count <= ncycle_count - 1'b1;
      end else begin
        ncycle_count <= 16'h0;
      end
    end
  end

  always @(posedge i_clk) begin
    if (ncycle_count=='h1)
      reset_ack <= i_rstn;
  end

  assign reset_req  = (i_rstn ^ reset_ack) & (ncycle_count==0);
  assign o_rst_ackn = reset_ack;

endmodule
//------------------------------------------------------------------------------
//
//
// End hssi_ss_rst_ack_delay.sv
//
//------------------------------------------------------------------------------
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6ytygaKOihi8JaIPwRSOSh8YpONtu2Q0mdBjUD4z8Kz08plmAuVlIfL6UKilzpKdw0X7Wui2qJ8dBKFdDj/M97vnIl8MF3mqT3PcdgB48/2VQvU/VUAdnlEJT7zhY0s6zOOT/bBybg6WkeBdmitIwL4UV58dWn/NeTy79gvoB3liznPB4vbQz3HBSKzdD3/icc70L2cvY8OjIcm7EaIT6d6uLFQxWVnMZngyOgKXbikfyXrsfeRtk0S8k7enkA8LdhfR3HtW1efKA564M4krzbfr/BIaLfWr6WuDI9pq5Tc+u6/GJIbfRggtNQTgXGBbcMFF+3Q+F94K7LXafWoZb524bNsOTntghiAQPZQpK0bQWl+cKoGURs/SlNZf8Oj3p4fyA2JjgZRvUL9Ob7BW6lgNTNsERFdPi5I2+P87iuPMAxCADjnLChcT7t1lzbiGWKjaz6m5AEqWtm06Y4SSsOfduERxddDDp7gGhtOJRkYvv8G/3ckb3y3g2Osnw931s8AEyUb1FHknyYOqnHy2d8HhYsBcqt5UmpDuE8/+Gr0/1lA7C803saXo9lk/tqQdKLLofD7s2HMtKlCEDAf+bJ80zOY2608d+QyZnxOmNLnNJqWXIwBA3b6v/pyx+glAbzvoHJwxW3A9vdMi2UUYb4UsdeoZ+tggDZWavqAWaNOLqtHnGn6+6WCgmFrqCi9FkBa+f2wZtB/x4RCgYl+yl2/37qO7nmzdJsXQ08lSgO+ZQ15UWh3eIV3iAuhE5jP/YVeHkzy3twSEbE+E51tIUirC"
`endif