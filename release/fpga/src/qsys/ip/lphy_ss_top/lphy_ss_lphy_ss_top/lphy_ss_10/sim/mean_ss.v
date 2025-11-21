// -------------------------------------------------------------
// 
// Module: mean_ss
// Source Path: /fpga/src/ip/custom/power_meter/mean_ss
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module mean_ss
          (clk,
           reset_x,
           enb,
           mean_d_i,
           mean_en_i,
		   cpeak_i,
           mean_count_i,
           mean_o,
           valid_o,
           csum_end,
		   max_value,
		   min_value,
		   ypeak_o);


  input   clk;
  input   reset_x;
  input   enb;
  input   [32:0] mean_d_i;  // ufix33_En28
  input   mean_en_i;
  input wire [32:0] cpeak_i;  // ufix33_En28
  input   [15:0] mean_count_i;  // uint16
  output  [31:0] mean_o;  // ufix32_En20
  output  valid_o;
  output  [34:0] csum_end;  // ufix35_En20
  output wire [32:0] max_value;  // ufix33_En28
  output wire [32:0] min_value;   // ufix33_En28
  output reg [15:0] ypeak_o;	// ufix16_En13

  wire pulsegen_ss_out1;
  wire enable_d3;
  wire pulsegen_ss_out3;
  wire pulsegen_ss_out4;
  wire [34:0] acusum_u35_20;  // ufix35_En20
  reg [34:0] Delay_acc_delOut;  // ufix35_En20
  wire [34:0] Delay_acc_ectrl;  // ufix35_En20
  wire [34:0] Delay_acc_out1;  // ufix35_En20
  reg [34:0] Delay_acc_last_value;  // ufix35_En20
  reg [15:0] Delay_cnt_out1;  // uint16
  wire [34:0] mean_u35_20;  // ufix35_En20
  wire [31:0] mean_u32_20;  // ufix32_En20
  
  reg pulsegen_ss_out3_d1, pulsegen_ss_out3_d2;
		


  pulsegen_ss pulsegen_ss_1 (.clk(clk),
                             .reset_x(reset_x),
                             .enb(enb),
                             .level_in(mean_en_i),
                             .acc_rst(pulsegen_ss_out1),
                             .enable(enable_d3),
                             .enable_epulse_ext(pulsegen_ss_out3),
                             .enable_epulse_d1(pulsegen_ss_out4)
                             );

  accumulator_ss accumulator_ss_1 (.clk(clk),
                                   .reset_x(reset_x),
                                   .enb(enb),
                                   .acu_in(mean_d_i),  // ufix33_En28
                                   .acc_rst(pulsegen_ss_out1),
                                   .acc_en(enable_d3),
                                   .acu_sum(acusum_u35_20),  // ufix35_En20
								   .max_value(max_value),// ufix33_En28
								   .min_value(min_value)// ufix33_En28
                                   );

  assign Delay_acc_ectrl = (pulsegen_ss_out3 == 1'b0 ? Delay_acc_delOut :
              acusum_u35_20);


	
  always @(posedge clk or posedge reset_x)
    begin : Delay_acc_lowered_process
      if (reset_x == 1'b1) begin
        Delay_acc_delOut <= 35'h000000000;
      end
      else begin
        if (enb) begin
          Delay_acc_delOut <= Delay_acc_ectrl;
        end
      end
    end
	
	always @(posedge clk or posedge reset_x)
    begin : pulsegen_Delay_process
      if (reset_x == 1'b1) begin
        pulsegen_ss_out3_d1 <= 1'b0;
		pulsegen_ss_out3_d2 <= 1'b0;
      end
      else begin
        if (enb) begin
			pulsegen_ss_out3_d1 <= pulsegen_ss_out3;
			pulsegen_ss_out3_d2 <= pulsegen_ss_out3_d1;
        end
      end
    end	
	
	
	always @(posedge clk or posedge reset_x)
    begin : ypeak_assignment
      if (reset_x == 1'b1) begin
        ypeak_o <= 16'h0000;
      end
      else begin
        if (pulsegen_ss_out3_d2 && enb) begin
          ypeak_o <= cpeak_i[30:15];//16u13 from 33u28
        end
      end
    end

  always @(posedge clk or posedge reset_x)
    begin : Delay_acc_bypass_process
      if (reset_x == 1'b1) begin
        Delay_acc_last_value <= 35'h000000000;
      end
      else begin
        if (enb) begin
          Delay_acc_last_value <= Delay_acc_out1;
        end
      end
    end



  assign Delay_acc_out1 = (pulsegen_ss_out3 == 1'b0 ? Delay_acc_last_value :
              Delay_acc_delOut);



  always @(posedge clk or posedge reset_x)
    begin : Delay_cnt_process
      if (reset_x == 1'b1) begin
        Delay_cnt_out1 <= 16'b0000000000000000;
      end
      else begin
        if (enb) begin
          Delay_cnt_out1 <= mean_count_i;
        end
      end
    end



  assign mean_u35_20 = Delay_acc_out1 >>> Delay_cnt_out1;
  assign mean_u32_20 = {9'b000000000,mean_u35_20[22:0]};



  assign mean_o = mean_u32_20;

  assign valid_o = pulsegen_ss_out4;

  assign csum_end = Delay_acc_out1;

endmodule  // mean_ss

