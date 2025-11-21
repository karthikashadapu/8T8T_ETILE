// -------------------------------------------------------------
// 
// Module: power_meter_ss
// Source Path: /fpga/src/ip/custom/power_meter/power_meter_ss
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module power_meter_ss#(
    parameter DATA_WIDTH = 32,
	parameter RAM_WIDTH = 16,
    parameter ADDR_WIDTH = 5,  // 2^5 = 32 locations
	parameter ADDR_WIDTH1 = 12,  // 2^12 = 4096 locations
	parameter ADDR_WIDTH2 = 10  // 2^12 = 4096 locations


)
          (	clk_dsp,   
			rst_dsp_n, 
			ai,
			aq,
			valid_i,
			channel_i,
			nextpow2_count_i,
			mean_o,
			csum,
			valid_o,
			numOFDMsymbols,
			single_in,
			cont_in,
			pwr_start,
			hist_done,
			ping_status_out,
			shared_ram_addr,
			shared_ram_dout,
			shared_ram_din,
			shared_ram_re,
			shared_ram_we,
			stat_ram_addr,	
			stat_ram_din,	
			stat_ram_dout,
			stat_ram_re,
			stat_ram_we,
			hist_ram_addr,	
			hist_ram_din,	
			hist_ram_dout,
			hist_ram_re,
			hist_ram_we);


	input                            	clk_dsp	;
	input                            	rst_dsp_n;

	input   signed 	[15:0] 				ai;  // sfix16_En14
	input   signed 	[15:0] 				aq;  // sfix16_En14
	input   							valid_i;
	input			[7:0]  				channel_i;
	input   		[15:0] 				nextpow2_count_i;  // uint16
	output  		[31:0]				mean_o;  // ufix32_En20
	output  		[34:0] 				csum;  // ufix35_En20
	output  							valid_o;
	
	output  wire 	[ADDR_WIDTH-1:0] 	shared_ram_addr;
	input   wire 	[DATA_WIDTH-1:0] 	shared_ram_dout;
	output 	wire 	[DATA_WIDTH-1:0] 	shared_ram_din;
	output 	wire						shared_ram_re;          // Read enable signal
	output 	wire						shared_ram_we ;
	
	input 	wire 	[16:0] 				numOFDMsymbols;
	input 	wire	 					single_in; // Single control signal
	input 	wire 						cont_in;//Continuous control signal
	input	wire						pwr_start;
	output	wire						hist_done;
	output	wire						ping_status_out;
  
	output 	wire 	[ADDR_WIDTH1-1:0] 	hist_ram_addr;
	output 	wire 	[RAM_WIDTH-1:0] 	hist_ram_din;
	input 	wire	[RAM_WIDTH-1:0] 	hist_ram_dout; 	// Data read from RAM
	output 	wire						hist_ram_re;          // Read enable signal
	output 	wire						hist_ram_we ;	// Write enable signal
	
	output 	wire 	[ADDR_WIDTH2-1:0] 	stat_ram_addr;
	output 	wire 	[RAM_WIDTH-1:0] 	stat_ram_din;
	input 	wire	[RAM_WIDTH-1:0] 	stat_ram_dout; 	// Data read from RAM
	output 	wire						stat_ram_re;          // Read enable signal
	output 	wire						stat_ram_we ;	// Write enable signal

	//SIGNAL DECLARATION
	wire signed [15:0] ai_1;  // sfix16_En14
	wire signed [15:0] aq_1;  // sfix16_En14
	wire en;
	wire [32:0] sq_o;  // ufix33_En28
	wire sq_en_o;
	// wire [15:0] nextpow2_count;  // uint16
	wire [31:0] mean;  // ufix32_En20
	wire valid_out;
  
	wire [32:0] max_value;  // ufix33_En20
	wire [32:0] min_value;   // ufix33_En20
	
	wire [32:0] cpeak_o;  // ufix33_En28
	wire [15:0] ypeak;	// ufix16_En13
	
	reg [31:0] mean_1d,mean_2d,mean_3d,mean_4d,mean_5d,mean_6d;  // ufix32_En20
	reg valid_1d,valid_2d,valid_3d,valid_4d,valid_5d,valid_6d;
	
	reg [7:0] channel_1d,channel_2d,channel_3d;
	
	wire reset_dsp = !rst_dsp_n;
  
	// Calculate the right shift value based on COUNT_THRESHOLD
/* 	function [15:0] calculate_shift_value(input [15:0] threshold);
        begin
            // Using $clog2 to calculate the shift value
            // Note: In practice, you'll use the right shift operation directly
            calculate_shift_value = $clog2(threshold);
        end
    endfunction */
	
	//ASSIGNMENT
	assign ai_1 = ai;

	assign aq_1 = aq;

	assign en = (valid_i != 1'b0 ? 1'b1 :
              1'b0);

	//INSTANTIATION
	square_ss u5_square_ss (.clk(clk_dsp),
                         .reset_x(reset_dsp),
                         .enb(1'b1),
                         .in_i(ai_1),  // sfix16_En14
                         .in_q(aq_1),  // sfix16_En14
                         .sq_en_i(en),
                         .sq_out_data(sq_o),  // ufix33_En28
                         .sq_en_out(sq_en_o),
						 .cpeak(cpeak_o)//ufix33_28
                         );

	// Determine the right shift value
    //assign nextpow2_count = calculate_shift_value(nextpow2_count_i);

	mean_ss u6_mean_ss_1 (.clk(clk_dsp),
                     .reset_x(reset_dsp),
                     .enb(1'b1),
                     .mean_d_i(sq_o),  // ufix33_En28
                     .mean_en_i(sq_en_o),
					 .cpeak_i(cpeak_o),// ufix33_En28
                     .mean_count_i(nextpow2_count_i),  // uint16
                     .mean_o(mean),  // ufix32_En20
                     .valid_o(valid_out),
                     .csum_end(csum),  // ufix35_En20
					 .max_value(max_value),// ufix33_En28
					 .min_value(min_value),// ufix33_En28
					 .ypeak_o(ypeak)	// ufix16_En13
                     );

	always @(posedge clk_dsp)
	begin
		begin
		    mean_1d 		<= mean;
			mean_2d			<= mean_1d;
			mean_3d			<= mean_2d;
			mean_4d			<= mean_3d;
			mean_5d			<= mean_4d;
			mean_6d			<= mean_5d;
		end
	end
	
	always @(posedge clk_dsp)
	begin
		begin
		    valid_1d 		<= valid_out;
			valid_2d		<= valid_1d;
			valid_3d		<= valid_2d;
			valid_4d		<= valid_3d;
			valid_5d		<= valid_4d;
			valid_6d		<= valid_5d;
		end
	end
	
	always @(posedge clk_dsp)
	begin
		begin
		    channel_1d 		<= channel_i;
			channel_2d		<= channel_1d;
			channel_3d		<= channel_2d;
		end
	end
	
	assign mean_o = mean_6d;

	assign valid_o = valid_6d;

  
	// Interface to access histograms
  
	histogram_state_machine #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH), .ADDR_WIDTH1(ADDR_WIDTH1)) u7_histo_state (
					.clk			(clk_dsp),                  // Clock signal
					.reset			(reset_dsp),                // Asynchronous reset
					.valid_in		(valid_6d),             // Input signal to indicate data is valid
					.yms_out		(mean_6d),       // Input data (assuming 16-bit for example)
					.symbol_in		(channel_3d),
					.single_in		(single_in), // Single control signal
					.cont_in		(cont_in),//Continuous control signal
					.numOFDMsymbols	(numOFDMsymbols),
					.ypeak_out		(ypeak), 
					.pwr_start		(pwr_start),
					.hist_done		(hist_done),
					.ping_status_out (ping_status_out),
					.thesh_ram_addr	(shared_ram_addr),
					.thesh_ram_dout	(shared_ram_dout),
					.thesh_ram_re	(shared_ram_re),
					.stat_ram_addr	(stat_ram_addr),	
					.stat_ram_din	(stat_ram_din),	
					.stat_ram_dout	(stat_ram_dout),
					.stat_ram_re	(stat_ram_re),
					.stat_ram_we	(stat_ram_we),
					.hist_ram_addr	(hist_ram_addr),
					.hist_ram_din	(hist_ram_din),
					.hist_ram_dout	(hist_ram_dout), // Data read from RAM
					.hist_ram_re	(hist_ram_re),
					.hist_ram_we    (hist_ram_we)
  );
	assign shared_ram_we = 1'b0;
	assign shared_ram_din = 16'd0;

endmodule  // power_meter_ss

