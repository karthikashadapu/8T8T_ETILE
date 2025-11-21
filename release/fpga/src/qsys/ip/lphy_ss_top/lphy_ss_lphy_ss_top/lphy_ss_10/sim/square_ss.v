// -------------------------------------------------------------
// 
// Module: square_ss
// Source Path: /power_meter/rtl/square_ss
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module square_ss
          (clk,
           reset_x,
           enb,
           in_i,
           in_q,
           sq_en_i,
           sq_out_data,
           sq_en_out,
		   cpeak);


  input   clk;
  input   reset_x;
  input   enb;
  input   signed [15:0] in_i;  // sfix16_En14
  input   signed [15:0] in_q;  // sfix16_En14
  input   sq_en_i;
  output  [32:0] sq_out_data;  // ufix33_En28
  output  sq_en_out;
  output reg  [32:0] cpeak;  // ufix33_En28

  wire en_ext;
  wire en_ext_d1;
  wire en_ext_d2;
  wire en_d3;
  wire en_d4;
  reg  in_valid_d1,in_valid_d2;
  
  reg [32:0] cpeak_d1, cpeak_d2;	
  
  reg signed [15:0] delay_ai_delOut;  // sfix16_En14
  reg signed [31:0] Product_i_mul_temp;  // sfix32_En28
  wire [31:0] isq;  // ufix32_En28
  reg [31:0] isq_d1;  // ufix32_En28
  reg signed [15:0] delay_aq_delOut;  // sfix16_En14
  reg signed [31:0] Product_q_mul_temp;  // sfix32_En28
  wire [31:0] qsq;  // ufix32_En28
  reg [31:0] qsq_d1;  // ufix32_En28
  reg [32:0] Delay_en_add_out1;  // ufix33_En28

  //reg [32:0] current_peak;         // 33-bit register for the peak value (i^2 + Q^2)
  reg peak_rst;

  enable_ss enable_ss_1 (.clk(clk),
                         .reset_x(reset_x),
                         .enb(enb),
                         .enable_in(sq_en_i),
                         .enable_ext(en_ext),
                         .enable_ext_d1(en_ext_d1),
						 .enable_ext_d2(en_ext_d2),
                         .enable_d3(en_d3),
						 .enable_d4(en_d4)
                         );

  always @(posedge clk or posedge reset_x)
    begin : Delay_valid_process
      if (reset_x == 1'b1) begin
        in_valid_d1 <= 1'b0;
		in_valid_d2 <= 1'b0;
      end
      else begin
        if (enb) begin
          in_valid_d1 <= en_ext_d2;
		  in_valid_d2 <= in_valid_d1;
        end
      end
    end

  always @(posedge clk or posedge reset_x)
    begin : peakrst_process
      if (reset_x == 1'b1) begin
        peak_rst <= 1'b0;
      end
      else begin
        if (enb) begin
          peak_rst <= ~en_d4;
        end
      end
    end



  always @(posedge clk or posedge reset_x)
    begin : delay_ai_lowered_process
      if (reset_x == 1'b1) begin
        delay_ai_delOut <= 16'sb0000000000000000;
      end
      else begin
        if (en_ext && enb) begin
          delay_ai_delOut <= in_i;
        end
      end
    end

    reg signed [15:0] imult_reg1; // First register to hold the input
    reg signed [15:0] imult_reg2; // Second register for intermediate storage
	
	always @(posedge clk or posedge reset_x) begin
        if (reset_x) begin
            imult_reg1 <= 16'sb0000000000000000; // Reset intermediate registers
            imult_reg2 <= 16'sb0000000000000000;
        end else begin
		if (enb) begin
            imult_reg1 <= delay_ai_delOut; // Capture input
            imult_reg2 <= imult_reg1; // Pipeline to next stage
		end
        end
    end
	
  always @(posedge clk or posedge reset_x)
    begin : Product_i_mul_temp_reg
      if (reset_x == 1'b1) begin
        Product_i_mul_temp <= 32'sb00000000000000000000000000000000;
      end else begin
	  if (enb) begin
          Product_i_mul_temp <= imult_reg1 * imult_reg1;
	  end
	  end
    end
	
  assign isq = Product_i_mul_temp;


  always @(posedge clk or posedge reset_x)
    begin : Delay_en_isq_lowered_process
      if (reset_x == 1'b1) begin
        isq_d1 <= 32'b00000000000000000000000000000000;
      end
      else begin
        if (en_ext_d2 && enb) begin
        isq_d1 <= isq;
        end
      end
    end




  always @(posedge clk or posedge reset_x)
    begin : delay_aq_lowered_process
      if (reset_x == 1'b1) begin
        delay_aq_delOut <= 16'sb0000000000000000;
      end
      else begin
        if (en_ext && enb) begin
          delay_aq_delOut <= in_q;
        end
      end
    end

    reg signed [15:0] qmult_reg1; // First register to hold the input
    reg signed [15:0] qmult_reg2; // Second register for intermediate storage
	
	always @(posedge clk or posedge reset_x) begin
        if (reset_x) begin
            qmult_reg1 <= 16'sb0000000000000000; // Reset intermediate registers
            qmult_reg2 <= 16'sb0000000000000000;
        end else begin
		if (enb) begin
            qmult_reg1 <= delay_aq_delOut; // Capture input
            qmult_reg2 <= qmult_reg1; // Pipeline to next stage
		end
        end
    end
	
  always @(posedge clk or posedge reset_x)
    begin : Product_q_mul_temp_reg
      if (reset_x == 1'b1) begin
        Product_q_mul_temp <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          Product_q_mul_temp <= qmult_reg1 * qmult_reg1;
		end
      end
    end
	
  //assign Product_q_mul_temp = delay_aq_out1 * delay_aq_out1;
  assign qsq = Product_q_mul_temp;


  always @(posedge clk or posedge reset_x)
    begin : Delay_en_qsq_lowered_process
      if (reset_x == 1'b1) begin
        qsq_d1 <= 32'b00000000000000000000000000000000;
      end
      else begin
        if (en_ext_d2 && enb) begin
          qsq_d1 <= qsq;
        end
      end
    end


  always @(posedge clk or posedge reset_x)
    begin : Delay_en_add_lowered_process
      if (reset_x == 1'b1) begin
        Delay_en_add_out1 <= 33'h000000000;
      end
      else begin
        if (in_valid_d1 && enb) begin
          Delay_en_add_out1 <= ({1'b0, isq_d1}) + ({1'b0, qsq_d1});
        end
      end
    end

  always @(posedge clk or posedge reset_x)
    begin : ypeak_calc_process
      if (reset_x == 1'b1 || peak_rst == 1'b1) begin
        cpeak_d1  <= 33'h000000000;
      end
      else begin
		// Compare the squared magnitude with the current peak
        if (Delay_en_add_out1 > cpeak) begin
            cpeak_d1 <= Delay_en_add_out1;
        end
      end
    end
	
	always @(posedge clk or posedge reset_x)
    begin : ypeak_reg_process
      if (reset_x == 1'b1) begin
        cpeak_d2  <= 33'h000000000;
		cpeak  <= 33'h000000000;
      end
      else begin
            cpeak_d2 <= cpeak_d1;
			cpeak <= cpeak_d2;
      end
    end
	
	

  assign sq_out_data = Delay_en_add_out1;

  assign sq_en_out = en_d4;

endmodule  // square_ss

