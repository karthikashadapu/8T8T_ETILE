
// -------------------------------------------------------------
// 
// Module: enable_ss
// Source Path:  /fpga/src/ip/custom/power_meter/enable_ss
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module enable_ss
          (clk,
           reset_x,
           enb,
           enable_in,
           enable_ext,
           enable_ext_d1,
		   enable_ext_d2,
		   enable_d3,
           enable_d4);


  input   clk;
  input   reset_x;
  input   enb;
  input   enable_in;
  output  enable_ext;
  output  enable_ext_d1;
  output  enable_ext_d2;
  output  enable_d3;
  output  enable_d4;



  reg  Delay4_out1;
  wire Logical_Operator_out1;
  reg  enable_ext_d1_1;
  reg  enable_ext_d2_1;
  reg  enable_ext_d3_1;
  reg  enable_ext_d4_1;
  reg  [0:4] Delay8_reg;  // ufix1 [3]
  wire [0:4] Delay8_reg_next;  // ufix1 [3]


  always @(posedge clk or posedge reset_x)
    begin : Delay4_process
      if (reset_x == 1'b1) begin
        Delay4_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay4_out1 <= enable_in;
        end
      end
    end



  assign Logical_Operator_out1 = enable_in | Delay4_out1;



  assign enable_ext = Logical_Operator_out1;

  always @(posedge clk or posedge reset_x)
    begin : Delay6_process
      if (reset_x == 1'b1) begin
        enable_ext_d1_1 <= 1'b0;
		enable_ext_d2_1 <= 1'b0;
		enable_ext_d3_1 <= 1'b0;
		enable_ext_d4_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          enable_ext_d1_1 <= Logical_Operator_out1;
		  enable_ext_d2_1 <= enable_ext_d1_1;
		  enable_ext_d3_1 <= enable_ext_d2_1;
		  enable_ext_d4_1 <= enable_ext_d3_1;
        end
      end
    end



  always @(posedge clk or posedge reset_x)
    begin : Delay8_process
      if (reset_x == 1'b1) begin
        Delay8_reg[0] <= 1'b0;
        Delay8_reg[1] <= 1'b0;
		Delay8_reg[2] <= 1'b0;
		Delay8_reg[3] <= 1'b0;
		Delay8_reg[4] <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay8_reg[0] <= Delay8_reg_next[0];
          Delay8_reg[1] <= Delay8_reg_next[1];
		  Delay8_reg[2] <= Delay8_reg_next[2];
		  Delay8_reg[3] <= Delay8_reg_next[3];
		  Delay8_reg[4] <= Delay8_reg_next[4];
        end
      end
    end

  assign enable_d3 = Delay8_reg[1];
  assign enable_d4 = Delay8_reg[4];
  assign Delay8_reg_next[0] = Delay4_out1;
  assign Delay8_reg_next[1] = Delay8_reg[0];
  assign Delay8_reg_next[2] = Delay8_reg[1];
  assign Delay8_reg_next[3] = Delay8_reg[2];
  assign Delay8_reg_next[4] = Delay8_reg[3];


  assign enable_ext_d1 = enable_ext_d1_1;
  assign enable_ext_d2 = enable_ext_d4_1;

endmodule  // enable_ss

