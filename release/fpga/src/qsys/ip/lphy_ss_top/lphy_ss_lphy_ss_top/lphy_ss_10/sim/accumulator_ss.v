// -------------------------------------------------------------
// 
// Module: accumulator_ss
// Source Path: /fpga/src/ip/custom/power_meter/accumulator_ss
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module accumulator_ss
          (clk,
           reset_x,
           enb,
           acu_in,
           acc_rst,
           acc_en,
           acu_sum,
		   max_value,
		   min_value);


  input   clk;
  input   reset_x;
  input   enb;
  input   [32:0] acu_in;  // ufix33_En28
  input   acc_rst;
  input   acc_en;
  output  [34:0] acu_sum;  // ufix35_En20
  output reg [32:0] max_value;  // ufix33_En28
  output reg [32:0] min_value;   // ufix33_En28

  wire [43:0] Sum_of_Elements_add_temp;  // ufix44_En28 
  wire [34:0] acusum_u35_20;  // ufix35_En20
  reg [34:0] Delay_out1;  // ufix35_En20

  //---------------------------------------------------------
  // Pulse for falling edge of acc_rst
  reg acc_rst_prev;
  wire acc_rst_falling;

  always @(posedge clk or posedge reset_x) begin
    if (reset_x) begin
      acc_rst_prev <= 1'b0;
    end else begin
      acc_rst_prev <= acc_rst;
    end
  end

  assign acc_rst_falling = !acc_rst && acc_rst_prev; // Detect falling edge

  // Initialize max_value and min_value on reset or falling edge of acc_rst
  always @(posedge clk or posedge reset_x) begin
    if (reset_x) begin
      max_value <= 33'b0;  // Reset max_value
      min_value <= 33'hFFFFFFFF;  // Initialize min_value to maximum possible
    end else if (acc_rst_falling) begin
      max_value <= 33'b0;  // Reset max_value on falling edge
      min_value <= 33'hFFFFFFFF;  // Reset min_value on falling edge
    end else if (enb) begin
      // Update max_value
      if (acu_in > max_value) begin
        max_value <= acu_in;
      end
      
      // Update min_value
      if (acu_in < min_value) begin
        min_value <= acu_in;
      end
    end
  end
  //---------------------------------------------------------

	assign Sum_of_Elements_add_temp = ({11'b0, acu_in}) + ({1'b0, {Delay_out1, 8'b00000000}});//ufix44_En28
	assign acusum_u35_20 = Sum_of_Elements_add_temp[42:8];
	
	assign acu_sum = acusum_u35_20;
	
	always @(posedge clk or posedge reset_x)
    begin : Delay_accumulator
      if (reset_x == 1'b1 || acc_rst == 1'b1) begin
        Delay_out1 <= 35'h000000000;
      end
      else begin
		if (acc_en && enb) begin
        Delay_out1 <= acusum_u35_20;
		end
      end
    end

endmodule  // accumulator_ss

