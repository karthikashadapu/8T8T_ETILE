// -------------------------------------------------------------
// 
// Module: pulsegen_ss
// Source Path: /fpga/src/ip/custom/power_meter/pulsegen_ss
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module pulsegen_ss
          (clk,
           reset_x,
           enb,
           level_in,
           acc_rst,
           enable,
           enable_epulse_ext,
           enable_epulse_d1);


  input   clk;
  input   reset_x;
  input   enb;
  input   level_in;
  output  acc_rst;
  output  enable;
  output  enable_epulse_ext;
  output  enable_epulse_d1;


  reg  Delay1_out1;
  wire Logical_Operator3_out1;
  reg  Delay4_out1;

  assign acc_rst =  ~ level_in;

  assign enable = level_in;

  always @(posedge clk or posedge reset_x)
    begin : Delay1_process
      if (reset_x == 1'b1) begin
        Delay1_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= level_in;
        end
      end
    end

  assign Logical_Operator3_out1 = Delay1_out1 & (~ level_in);

  always @(posedge clk or posedge reset_x)
    begin : Delay4_process
      if (reset_x == 1'b1) begin
        Delay4_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay4_out1 <= Logical_Operator3_out1;
        end
      end
    end


  assign enable_epulse_ext = Logical_Operator3_out1 | Delay4_out1;

  assign enable_epulse_d1 = Delay4_out1;

endmodule  // pulsegen_ss

