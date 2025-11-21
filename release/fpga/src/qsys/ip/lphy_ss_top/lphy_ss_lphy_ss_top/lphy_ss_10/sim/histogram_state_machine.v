// -------------------------------------------------------------
// 
// Module: histogram_state_machine
// Source Path: /power_meter/rtl/histogram_state_machine
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module histogram_state_machine #(
    parameter DATA_WIDTH = 32,
	parameter RAM_WIDTH = 16,
    parameter ADDR_WIDTH = 5,  // 2^5 = 32 locations
	parameter ADDR_WIDTH1 = 11,  // 2^12 = 4096 locations
	parameter ADDR_WIDTH2 = 10  // 2^10 = 1024 locations
)(
	input wire clk,
    input wire reset,
    input wire valid_in,
    input wire [DATA_WIDTH-1:0] yms_out, // Assuming ufix32_En20 maps to a 32-bit input
	input wire [7:0] symbol_in,
    input wire single_in, // Single control signal
	input wire cont_in,//Continuous control signal
	input wire [16:0] numOFDMsymbols,
	input wire pwr_start, // Start histogram calculation
	input wire [15:0] ypeak_out,	// ufix16_En13
	output reg hist_done,
	output wire ping_status_out,
    // Interface to access histograms
	output reg [ADDR_WIDTH-1:0] thesh_ram_addr,
	input  wire [DATA_WIDTH-1:0] thesh_ram_dout,
	output reg thesh_ram_re,          // Read enable signal
	//
	output reg [ADDR_WIDTH2-1:0] stat_ram_addr,
	output reg [RAM_WIDTH-1:0] stat_ram_din,
	input wire [RAM_WIDTH-1:0] stat_ram_dout, // Data read from RAM
	output reg stat_ram_re,          // Read enable signal
	output reg stat_ram_we,          // Write enable signa
	
	output reg [ADDR_WIDTH1-1:0] hist_ram_addr,
	output reg [RAM_WIDTH-1:0] hist_ram_din,
	input wire [RAM_WIDTH-1:0] hist_ram_dout, // Data read from RAM
	output reg hist_ram_re,          // Read enable signal
	output reg hist_ram_we          // Write enable signal
);

    // Define states for HISTOGRAM
    localparam IDLE_STATE = 4'd0;
	localparam CLEARING_STATE = 4'd1;
	localparam CLEARING_STAT_STATE = 5'd19;
	localparam RESET_MEMORY_STATE = 4'd2;
	localparam WAIT_FOR_SYMBOL_0_STATE = 5'd20;
    localparam WAIT_FOR_DATA_STATE = 4'd3;
	localparam READ_THRESHOLD_STATE = 4'd4;
    localparam PROCESS_THRESHOLD_0_STATE = 4'd5;
	localparam PROCESS_THRESHOLD_STATE = 4'd6;
	localparam PROCESS_THRESHOLD_n_STATE = 4'd7;
    localparam HISTOGRAM_STATE = 4'd8;
	localparam HIST_READ_STATE = 4'd9;
	localparam HIST_READ1_STATE = 4'd10;
	localparam UPDATE_STATE = 4'd11;
	localparam UPDATE_STATE_WAIT = 4'd12;
	localparam STATE_WAIT1 = 4'd13;
	localparam STATE_WAIT2 = 4'd14;
	localparam READ_WAIT1 = 4'd15;
	localparam STATE_WAIT3 = 5'd16;
	localparam STATE_WAIT4 = 5'd17;
	localparam HIST_READ2_STATE = 5'd18;
	localparam SYMBOL_INC_STATE = 5'd21;
	localparam HIST_READ1D1_STATE = 5'd22;
	localparam HIST_READ1D2_STATE = 5'd23;
	localparam STATE_WAIT_VALID = 5'd24;
	
    // Internal registers
    reg [4:0] current_state;
    reg [15:0] symbol_counter; // Counter for symbols
    reg [4:0] bin_idx;
	//reg [2:0] stat_idx;
   // reg [31:0] counter; // Counter for numOFDMsymbols
	reg [1:0] axc_count; // Count for numAxC
	reg busy_clrn;
	reg [DATA_WIDTH-1:0] prev_threshold, current_threshold;
	//reg [DATA_WIDTH-1:0] yms_dup, thr_dup;
	reg [RAM_WIDTH-1:0] current_count;    // Holds the current count read from RAM
    // Constants
    localparam numSymbols = 14;
	localparam numAXCs = 4;
	localparam num_bins = 33;
	localparam total_mem = 2048;//numSymbols* 64* numAXCs *2
	localparam total_stat_mem = 512;//numSymbols* 64* numAXCs *2
	
    // Integer declarations
    integer i, j, loop_idx;

    // State behavior logic
    reg [4:0] mapped_symbol;
    reg bin_found;

    // Edge detection for single_cont
    reg single_d; // Delayed signal
	reg cont_d; // Delayed cont
    reg single_rising; // Rising edge detection

	reg [1:0] current_axc; // 2 bits are enough for 4 AXCs (00, 01, 10, 11)
	// reg [RAM_WIDTH-1:0] max_yms_out [0:numAXCs-1]; // Maximum values for each AXC
	// reg [RAM_WIDTH-1:0] min_yms_out [0:numAXCs-1]; // Minimum values for each AXC
	
	reg [3:0] wait_cnt;
	
	reg pong_en;
	reg [ADDR_WIDTH1-1:0] addr_offset;//ping/pong memory starting address
	reg [ADDR_WIDTH2-1:0] stat_addr_offset;//ping/pong stat memory starting address
	
	reg [DATA_WIDTH-1:0] yms_out_1d;
	reg [DATA_WIDTH-1:0] yms_out_2d;
	reg [DATA_WIDTH-1:0] yms_out_3d;
	
	reg valid_in_1d,valid_in_2d,valid_in_3d;
	
	reg condition_check;
	wire [ADDR_WIDTH-1:0] target_value; 
	reg condition_met,condition_met_b1,condition_met_b2;
	// reg condition_met1,condition_met1_b1,condition_met1_b2;
		
	reg condition_met_reg1;
	// reg condition_met1_reg1;
	
	reg end_signal;

    // Edge detection logic for single_cont
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            single_d <= 1'b0;
            single_rising <= 1'b0;
        end else begin
            single_d <= single_in;
            single_rising <= (single_in & ~single_d);
        end
    end
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            cont_d <= 1'b0;
        end else begin
            cont_d <= cont_in;
        end
    end
	
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			addr_offset <= 12'd0;
		end else if (pong_en) begin
			addr_offset <= 12'd2048;
		end else begin
			addr_offset <= 12'd0;
		end
	end
	
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			stat_addr_offset <= 10'd0;
		end else if (pong_en) begin
			stat_addr_offset <= 10'd512;
		end else begin
			stat_addr_offset <= 10'd0;
		end
	end
	
    // State encoding for Modulous Calculation
    
    localparam	 	IDLE 		= 2'b00;
    localparam 		CALCULATE 	= 2'b01;
    reg [1:0] current_map;

    reg [15:0] temp_value; // Temporary value for calculations
	reg start_calculation;
	reg calculation_done;
    // State transition and output logic in a single always block
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_map <= IDLE;
			calculation_done <= 1'b0;
            mapped_symbol <= 5'b0;
            temp_value <= 16'd0;
        end else begin
            case (current_map)
                IDLE: begin
					if (start_calculation) begin
						mapped_symbol <= mapped_symbol; // Reset output
						temp_value <= symbol_counter; // Load symbol_counter into temp_value
						calculation_done <= 1'b1;
						current_map <= CALCULATE; // Transition to CALCULATE
					end    
                end

                CALCULATE: begin
                    if (temp_value >= numSymbols) begin
                        temp_value <= temp_value - numSymbols; // Subtract the divisor
                    end else begin
                        mapped_symbol <= temp_value[4:0]; // Final result
						calculation_done <= 1'b0;
                        current_map <= IDLE; // Go back to IDLE
                    end
                end

                default: current_map <= IDLE; // Default case
            endcase
        end
    end

	
	

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			yms_out_1d <= 32'd0;
			yms_out_2d <= 32'd0;
			yms_out_3d <= 32'd0;
		end else begin
			yms_out_1d <= yms_out;
			yms_out_2d <= yms_out_1d;
			yms_out_3d <= yms_out_2d;
		end
	end

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			valid_in_1d <= 1'b0;
			valid_in_2d <= 1'b0;
			valid_in_3d <= 1'b0;
		end else begin
			valid_in_1d <= valid_in;
			valid_in_2d <= valid_in_1d;
			valid_in_3d <= valid_in_2d;
		end
	end

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			end_signal <= 1'b0;
		end else if ((!(symbol_counter[15:0] ^ (numOFDMsymbols[15:0]-1'b1))) && axc_count == 2'd3) begin
			end_signal <= 1'b1;
		end else begin
			end_signal <= 1'b0;
		end
	end

	assign target_value = (num_bins - 1'b1);
	
 	// Update max and min values for the current AXC

	// State encoding for Statistic Memory
    
    localparam	 	CLEAR_STAT 				= 5'd0;
	localparam	 	CLR_STAT_MEM 			= 5'd1;
	localparam	 	LOAD_STAT 				= 5'd2;
    localparam 		READ_MIN	 			= 5'd3;
	localparam 		READ_MAX	 			= 5'd4;
	localparam 		READ_LAT1				= 5'd5;
	localparam 		READ_LAT2				= 5'd6;
	localparam 		READ_LAT3				= 5'd7;
	localparam 		WRITE_MIN_YMS		    = 5'd8;
	localparam 		WRITE_MAX_YMS			= 5'd9;
	localparam 		READ_TOTAL_MSS_LSB		= 5'd10;
	localparam 		READ_TOTAL_MSS_MSB		= 5'd11;
	localparam 		READ_TOTAL_SAMPLE_LSB   = 5'd12;
	localparam 		READ_TOTAL_SAMPLE_MSB   = 5'd13;
	localparam 		READ_PEAK_PWR			= 5'd14;
	localparam 		READ_STAT_WAIT1			= 5'd15;
	localparam 		WRITE_TOTAL_MSS_LSB		= 5'd16;	
	localparam 		WRITE_TOTAL_MSS_MSB     = 5'd17;
	localparam 		WRITE_TOTAL_SAMPLES_LSB = 5'd18;
	localparam 		WRITE_TOTAL_SAMPLES_MSB = 5'd19;
	localparam		WRITE_PEAK_PWR			= 5'd20;
	
	
	
    reg [4:0] current_stat;
	reg clear_stat_mem;
	reg stat_calculation, stat_reset;
	reg stat_done;
	reg [RAM_WIDTH-1 : 0] yms_out_3d_u16;
	reg [RAM_WIDTH-1 : 0] max_yms_current;
	reg [RAM_WIDTH-1 : 0] min_yms_current;
	// Internal registers for total MSS
    reg [DATA_WIDTH-1:0] current_total_mss;
	reg [DATA_WIDTH-1:0] total_mss;      // Total MSS output
	reg [DATA_WIDTH-1:0] current_total_samples ;  // Total Samples output
	reg [DATA_WIDTH-1:0] total_samples ;  // Total Samples output
	reg [RAM_WIDTH-1 :0] current_peak_pwr ; // Peak Power
	// State transition and output logic in a single always block
    always @(posedge clk or posedge reset) begin
        if (reset) begin
			yms_out_3d_u16 <= 16'd0;
			max_yms_current <= 16'd0;
			min_yms_current <= 16'hFFFF;
			stat_done <= 1'b0;
			current_total_mss <= 32'd0;
			total_mss <= 32'b0;
			total_samples <= 32'b0;
			
			stat_ram_addr <= 10'b0 + stat_addr_offset;
			stat_ram_din <= 16'b0;
			stat_ram_we <= 1'b0;
			stat_ram_re <= 1'b0;
			j <= 0;
			
            current_stat <= CLEAR_STAT;
        end else begin
            case (current_stat)
                CLEAR_STAT: begin													//0
					if(clear_stat_mem) begin
						stat_ram_addr <= 10'b0 + stat_addr_offset;
						stat_ram_din <= 16'hFFFF;   // Data to write
						stat_ram_we <= 1'b1;
						j <= 0;
						current_stat <= CLR_STAT_MEM;
					end
					else begin
						yms_out_3d_u16 <= 16'd0;
						max_yms_current <= 16'd0;
						min_yms_current <= 16'hFFFF;
						current_total_mss <= 32'd0;
						total_mss <= 32'b0;
						total_samples <= 32'b0;
			
						stat_done <= 1'b0;
						
						stat_ram_addr <= 10'b0 + stat_addr_offset;
						stat_ram_din <= 16'hFFFF;
						stat_ram_we <= 1'b0;
						stat_ram_re <= 1'b0;
						j <= 0;
						current_stat <= CLEAR_STAT;
					end
				end
				
				CLR_STAT_MEM: begin														//1
 					if (j == total_stat_mem-1) begin
						stat_ram_din <= 16'd0;   // Data to write
						stat_ram_we <= 1'b0;     // Enable write
						stat_ram_addr <= 10'b0 + stat_addr_offset; // Increment address
						j <= 0;
						current_stat <= LOAD_STAT;
					end  
					else begin
					 // Logic to write `16'hFFFF` at positions 0, 8, 16, ...
                        if (j % 8 == 7) begin
                            stat_ram_din <= 16'hFFFF;  // Write 16'hFFFF
							//stat_ram_din <= 16'd0;   // Data to write
							stat_ram_we <= 1'b1;     // Enable write
							stat_ram_addr <= stat_ram_addr + 1; // Increment address
							j <= j + 1;
                        end else begin
                            stat_ram_din <= 16'd0;  // Write 16'h0000
							stat_ram_we <= 1'b1;     // Enable write
							stat_ram_addr <= stat_ram_addr + 1; // Increment address
							j <= j + 1;
                        end						

						current_stat <= CLR_STAT_MEM;
					end
				end
				
				LOAD_STAT: begin														//2
					if (stat_calculation) begin
						stat_ram_we <= 1'b0;
						stat_ram_re <= 1'b0;							
						yms_out_3d_u16 <= yms_out_3d[22:7];//16_13 from 32_20
						stat_done <= 1'b0;
						current_stat <= READ_MIN; // Transition to read max
					end 
					else if (stat_reset) begin
						stat_ram_we <= 1'b0;
						stat_ram_re <= 1'b0;
						current_stat <= CLEAR_STAT;
					end
					else begin
						stat_ram_we <= 1'b0;
						stat_ram_re <= 1'b0;
						current_stat <= LOAD_STAT;
					end
				end
				
				READ_MIN: begin															//3
					stat_ram_we <= 1'b0;
					stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + 0) + stat_addr_offset;//address_offset MIN 
					stat_ram_re <= 1'b1;  // Read first part 
					current_stat = READ_MAX; // Move to next state
				end
				READ_MAX: begin															//4
					stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + 1) + stat_addr_offset;//address_offset MAX
					stat_ram_re <= 1'b1;  // Read second part
					current_stat <= READ_LAT1; // Move to next state
				end
				
				READ_LAT1: begin														//5
					stat_ram_re <= 1'b0;
					current_stat <= READ_LAT2; // Move to next state
				end
				
				READ_LAT2: begin														//6
					min_yms_current <= stat_ram_dout;//Update the mIN CURRENT
					current_stat <= READ_LAT3; // Move to next state
				end
				
				READ_LAT3: begin														//7
					max_yms_current <= stat_ram_dout;//Update the mAX CURRENT
					//CALC MIN CURRENT PER SYMBOL PER AXC
					if (yms_out_3d_u16 < min_yms_current) begin
						min_yms_current <= yms_out_3d_u16;//ufix32_En20 maps to a 16-bit ufix16_En13
					end

					current_stat <= WRITE_MIN_YMS; // Move to next state
				end

				WRITE_MIN_YMS: begin													//8
					//CALC MAX CURRENT PER SYMBOL PER AXC
					if (yms_out_3d_u16 > max_yms_current) begin
						max_yms_current <= yms_out_3d_u16;//ufix32_En20 maps to a 16-bit ufix16_En13
					end
					stat_done <= 1'b0;
					stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + 0)+stat_addr_offset; //address_offset MIN
					stat_ram_we <= 1'b1;
					stat_ram_din <= min_yms_current;  // Write min_yms_out to memory
					current_stat <= WRITE_MAX_YMS;   // Move to next state
				end
				
				WRITE_MAX_YMS: begin													//9
					stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + 1)+stat_addr_offset; //address_offset MAX
					stat_ram_we <= 1'b1;
					stat_ram_din <= max_yms_current;  // Write max_yms_out to memory
					current_stat <= READ_TOTAL_MSS_LSB;      // Move to next state
				end
				
	            READ_TOTAL_MSS_LSB: begin												//10
					stat_ram_we <= 1'b0;
					stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + 2) + stat_addr_offset; //address_offset TOTAL_MSS_LSB
					stat_ram_re <= 1'b1;  // Read first part
					current_stat <= READ_TOTAL_MSS_MSB; // Move to next state
				end
				READ_TOTAL_MSS_MSB: begin												//11
					stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + 3) + stat_addr_offset; //address_offset TOTAL_MSS_MSB
					stat_ram_re <= 1'b1;  // Read second part 
					current_stat <= READ_TOTAL_SAMPLE_LSB; // Move to next state
				end
				
				READ_TOTAL_SAMPLE_LSB: begin											//12
					stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + 4) + stat_addr_offset; //address_offset TOTAL_SAMPLE_LSB
					stat_ram_re <= 1'b1;  // Read second part 
					current_stat <= READ_TOTAL_SAMPLE_MSB; // Move to next state
				end
				
				READ_TOTAL_SAMPLE_MSB: begin											//13
					current_total_mss[15:0] <= stat_ram_dout; // Update the lOWER part of current_total_mss
					stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + 5) + stat_addr_offset; //address_offset TOTAL_SAMPLE_MSB
					stat_ram_re <= 1'b1;  // Read second part
					current_stat <= READ_PEAK_PWR; // Move to next state
				end
				READ_PEAK_PWR: begin													//14
					current_total_mss[31:16] <= stat_ram_dout; // Update the UPPER part of current_total_mss
					stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + 6) + stat_addr_offset;//address_offset PEAK_POWER
					stat_ram_re <= 1'b1;  // Read 
					current_stat <= READ_STAT_WAIT1; // Move to next state
				end
				READ_STAT_WAIT1 : begin													//15
					stat_ram_re <= 1'b0;
					total_mss <= current_total_mss + yms_out_3d_u16;  // Add the values for total_mss
					current_total_samples[15:0] <= stat_ram_dout; // Update the lOWER part of current_total_samples
					current_stat <= WRITE_TOTAL_MSS_LSB; // Move to next state
				end
				
				WRITE_TOTAL_MSS_LSB : begin												//16
					current_total_samples[31:16] <= stat_ram_dout; // Update the UPPER part of current_total_samples
					stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + 2) + stat_addr_offset; //address_offset TOTAL_MSS_LSB
					stat_ram_we <= 1'b1;
					
					stat_ram_din <= total_mss[15:0];  // Write lower part of total_mss
					current_stat <= WRITE_TOTAL_MSS_MSB; // Move to next state
				end
				
				WRITE_TOTAL_MSS_MSB: begin												//17
					current_peak_pwr <= stat_ram_dout; // Update the current_peak_power
					stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + 3) + stat_addr_offset; //address_offset TOTAL_MSS_MSB
					stat_ram_we <= 1'b1;
					stat_ram_din <= total_mss[31:16];  // Write upper part of total_mss
					
					total_samples <= current_total_samples + 16'd4096;
					current_stat <= WRITE_TOTAL_SAMPLES_LSB; // Move to next state
				end
				
				WRITE_TOTAL_SAMPLES_LSB: begin											//18	
					stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + 4) + stat_addr_offset; //address_offset TOTAL_SAMPLE_LSB
					stat_ram_we <= 1'b1;
					stat_ram_din <= total_samples[15:0];  // Write lower part of total_samples
					if (ypeak_out > current_peak_pwr) begin // check peak
						current_peak_pwr <= ypeak_out;//
					end
					current_stat <= WRITE_TOTAL_SAMPLES_MSB; // Move to next state
				end
				WRITE_TOTAL_SAMPLES_MSB: begin											//19
					stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + 5) + stat_addr_offset; //address_offset TOTAL_SAMPLE_MSB
					stat_ram_we <= 1'b1;
					stat_ram_din <= total_samples[31:16];  // Write upper part of total_samples
					current_stat <= WRITE_PEAK_PWR; // End the sequence and return to IDLE
				end
				
				WRITE_PEAK_PWR: begin													//20
					stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + 6) + stat_addr_offset; //address_offset TOTAL_SAMPLE_LSB
					stat_ram_we <= 1'b1;
					stat_ram_din <= current_peak_pwr;  // Write peak power
					current_stat <= LOAD_STAT; // End the sequence and return to IDLE
				end
                default: current_stat <= CLEAR_STAT; // Default case
            endcase
        end
    end


	//Symbol 0 detection
	// State encoding for Symbol 0 detection
    localparam	 	IDLE_DET	= 2'b00;
    localparam 		DETECT_SYM0	= 2'b01;
    reg [1:0] current_det;

	// Declare a register to store the previous value of symbol_in
	reg [7:0] symbol_in_prev;
	reg detect_symbol0;
	reg start_detect;//1 -- START 0 -- STOP
	//reg stop_detect;
	////Always block to detect symbol_in change from 13 to 0
	// always @(posedge clk or posedge reset) begin
		// if (reset) begin
			// detect_symbol0 <= 1'b0;
		// end else begin
			// detect_symbol0 <= (symbol_in == 8'd0) && (symbol_in != symbol_in_prev);
		// end
	// end
	
    ////State transition and output logic in a single always block
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_det <= IDLE_DET;
			detect_symbol0 <= 1'b0;

        end else begin
            case (current_det)
                IDLE_DET: begin
					if (start_detect) begin
						detect_symbol0 <= 1'b0;
						current_det <= DETECT_SYM0; // Transition
					end    
                end

                DETECT_SYM0: begin
					if (!start_detect) begin
						current_det <= IDLE_DET; // Default case
					end else begin
						detect_symbol0 <= (symbol_in == 8'd0) && (symbol_in != symbol_in_prev);
						current_det <= DETECT_SYM0; // Transition to CALCULATE
					end
                end

                default: current_det <= IDLE_DET; // Default case
            endcase
        end
    end

	
	
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			// Reset logic
			current_state <= IDLE_STATE;
			// Initialize outputs and internal variables
			i <= 0;
			//j <= 0;
			busy_clrn <= 1;
			thesh_ram_addr <= 0;
			hist_ram_addr <= 12'b0;
			hist_ram_din <= 16'b0;
			hist_ram_we <= 1'b0;
			
			// stat_ram_addr <= 10'b0;
			// stat_ram_din <= 16'b0;
			// stat_ram_we <= 1'b0;
			// stat_ram_re <= 1'b0;
			
			hist_ram_re <= 1'b0;
			thesh_ram_re <= 1'b0;
			
			start_calculation <= 1'b0;
			stat_calculation <= 1'b0;
			clear_stat_mem <= 1'b0;
			stat_reset <= 1'b1;
						
			current_count <= 32'b0;
			current_axc <= 2'b0;

			wait_cnt <= 4'd0;
			hist_done <= 1'b0;
			loop_idx <= 0;
			prev_threshold <= 32'd0;
			current_threshold <= 32'd0;

			pong_en <= 1'b0;
			condition_check <= 1'b0;
			
			//Update the previous value of symbol_in
			symbol_in_prev <= 8'd13;//symbol_in
			start_detect <= 1'b0;
			
		end else begin
			case (current_state)
				IDLE_STATE: begin
					i <= 0;
					//j <= 0;
					busy_clrn <= 1;
					thesh_ram_addr <= 0;
					hist_ram_addr <= 12'b0; 
					hist_ram_din <= 16'b0; 
					hist_ram_we <= 1'b0; 
					
					// stat_ram_addr <= 10'b0;
					// stat_ram_din <= 16'b0;
					// stat_ram_we <= 1'b0;
					// stat_ram_re <= 1'b0;
			
					hist_ram_re <= 1'b0;
					thesh_ram_re <= 1'b0;
					
					start_calculation <= 1'b0;
					stat_calculation <= 1'b0;
					clear_stat_mem <= 1'b0;
					stat_reset <= 1'b1;
						
					current_count <= 32'b0; 
					
					current_axc	<= 2'b00;

					wait_cnt <= 4'd0;
					hist_done <= 1'b0;
					loop_idx <= 0;
					prev_threshold <= 32'd0;
					current_threshold <= 32'd0;

					pong_en <= 1'b0;
								
					//Update the previous value of symbol_in
					symbol_in_prev <= 8'd13;//symbol_in
					start_detect <= 1'b0;
					
					current_state <= RESET_MEMORY_STATE;
				end

				RESET_MEMORY_STATE: begin
					if (single_rising || cont_d == 1'b1) begin
					// Clear local variables
						i <= 0;
						//j <= 0;						

						symbol_counter <= 16'h0000;
						axc_count <= 2'b00;
						current_axc <= 2'b00;
						busy_clrn <= 1;
						bin_idx <= 0;
						//stat_idx <= 0;
						bin_found <= 0;

						thesh_ram_addr <= 0;
						hist_ram_addr <= 12'b0 + addr_offset;
						hist_ram_din <= 16'b0;
						hist_ram_we <= 1'b1;
						
						// stat_ram_addr <= 10'b0  + stat_addr_offset;
						// stat_ram_din <= 16'b0;
						// stat_ram_we <= 1'b0;
						// stat_ram_re <= 1'b0;
						
						hist_ram_re <= 1'b0;
						thesh_ram_re <= 1'b0;
						
						start_calculation <= 1'b0;
						stat_calculation <= 1'b0;
						clear_stat_mem <= 1'b0;
						stat_reset <= 1'b1;
						
						current_count <= 32'b0;
						wait_cnt <= 4'd0;
						hist_done <= 1'b0;
						loop_idx <= 0;
						prev_threshold <= 32'd0;
						current_threshold <= 32'd0;

						pong_en <= pong_en;
												
						//Update the previous value of symbol_in
						symbol_in_prev <= symbol_in;
						start_detect <= 1'b1;
						
						current_state <= CLEARING_STATE;
					end 
					else begin
						// Clear local variables
						i <= 0;
						//j <= 0;

						symbol_counter <= 16'h0000;
						axc_count <= 2'b00;
						current_axc <= 2'b00;
						busy_clrn <= 1;
						bin_idx <= 0;
						//stat_idx <= 0;
						bin_found <= 0;
						
						start_calculation <= 1'b0;
						start_calculation <= 1'b0;
						stat_calculation <= 1'b0;
						clear_stat_mem <= 1'b0;
						stat_reset <= 1'b1;

						thesh_ram_addr <= 0;
						hist_ram_addr <= 12'b0 + addr_offset;
						hist_ram_din <= 16'b0;
						hist_ram_we <= 1'b0;
						
						// stat_ram_addr <= 10'b0 + stat_addr_offset;
						// stat_ram_din <= 16'b0;
						// stat_ram_we <= 1'b0;
						// stat_ram_re <= 1'b0;
						
						hist_ram_re <= 1'b0;
						thesh_ram_re <= 1'b0;
						
						current_count <= 32'b0;
						wait_cnt <= 4'd0;
						hist_done <= 1'b0;
						loop_idx <= 0;
						prev_threshold <= 32'd0;
						current_threshold <= 32'd0;
									
						//Update the previous value of symbol_in
						symbol_in_prev <= symbol_in;
						start_detect <= 1'b1;
						
						current_state <= RESET_MEMORY_STATE;
					end
				end

				CLEARING_STATE: begin
					if (i == total_mem-1) begin
						hist_ram_din <= 16'd0;   // Data to write
						hist_ram_we <= 1'b1;     // Enable write
						hist_ram_addr <= hist_ram_addr + 1; // Increment address
						// stat_ram_addr <= 10'b0 + stat_addr_offset;
						// stat_ram_din <= 16'd0;   // Data to write
						// stat_ram_we <= 1'b1;  
						i <= 0;//i + 1;
						clear_stat_mem <= 1'b1;
						current_state <= CLEARING_STAT_STATE;
					end 
					
					else begin
						hist_ram_din <= 16'd0;   // Data to write
						hist_ram_we <= 1'b1;     // Enable write
						hist_ram_addr <= hist_ram_addr + 1 ; // Increment address
						i <= i + 1;
						// stat_ram_we <= 1'b0;
						// stat_ram_addr <= 0;
						busy_clrn <= 1;
						thesh_ram_addr <= 0;
						current_count <= 32'b0;
						wait_cnt <= 4'd0;
						hist_done <= 1'b0;
						current_state <= CLEARING_STATE;
					end
				end
				
				CLEARING_STAT_STATE: begin
 					if (i == total_stat_mem-1) begin
						//stat_ram_din <= 16'd0;   // Data to write
						//stat_ram_we <= 1'b1;     // Enable write
						//stat_ram_addr <= stat_ram_addr + 1; // Increment address
						i <= 0;
						clear_stat_mem <= 1'b0;
						start_detect <= 1'b1;
						current_state <= WAIT_FOR_SYMBOL_0_STATE;
					end  
					else begin
						// stat_ram_din <= 16'd0;   // Data to write
						// stat_ram_we <= 1'b1;     // Enable write
						// stat_ram_addr <= stat_ram_addr + 1; // Increment address
						i <= i + 1;
						hist_ram_we <= 1'b0;
						hist_ram_addr <= 0;
						busy_clrn <= 1;
						thesh_ram_addr <= 0;
						current_count <= 32'b0;
						wait_cnt <= 4'd0;
						hist_done <= 1'b0;
						current_state <= CLEARING_STAT_STATE;
					end
				end
				
				WAIT_FOR_SYMBOL_0_STATE : begin
					if (detect_symbol0 && pwr_start == 1'b1) begin //) begin
						//stat_ram_we <= 1'b0;
						start_calculation <= 1'b1;
						stat_calculation <= 1'b0;
						stat_reset <= 1'b0;
						clear_stat_mem <= 1'b0;
						current_state <= STATE_WAIT_VALID;//WAIT_FOR_DATA_STATE;
						//Update the previous value of symbol_in
						symbol_in_prev <= symbol_in;
					end
					else begin
						//stat_ram_we <= 1'b0;
						start_calculation <= 1'b0;
						stat_calculation <= 1'b0;
						stat_reset <= 1'b0;
						clear_stat_mem <= 1'b0;
						symbol_in_prev <= symbol_in;
						current_state <= WAIT_FOR_SYMBOL_0_STATE;
						
					end
				end	
								
				STATE_WAIT_VALID : begin
					if (wait_cnt == 4'd15) begin
						wait_cnt <= 4'd0;
						current_state <= WAIT_FOR_DATA_STATE;
					end else begin
						wait_cnt <= wait_cnt + 1'b1;
						stat_calculation <= 1'b0;
						start_calculation <= 1'b0;
						hist_ram_we <= 1'b0;
						prev_threshold <= 32'd0;
						current_threshold <= 32'd0;
						//Update the previous value of symbol_in
						symbol_in_prev <= symbol_in;
						start_detect <= 1'b1;
						current_state <= STATE_WAIT_VALID;
					end
				end
					
				WAIT_FOR_DATA_STATE: begin
					if (valid_in_3d) begin //&& pwr_start == 1'b1) begin
						bin_found <= 0;
						start_calculation <= 1'b0;
						stat_calculation <= 1'b1;
						
						thesh_ram_addr <= 0;
						hist_ram_we <= 1'b0; // Disable write
						
						hist_ram_re <= 1'b0;
						//stat_ram_we <= 1'b0;     // Enable write
						thesh_ram_re <= 1'b1;
						hist_done <= 1'b0;	
						
						loop_idx <= 0;
						current_count <= 32'b0; // Reset current count
						condition_met <= 1'b0;
						//condition_met1 <= 1'b0;
						condition_check <= 1'b0;
						condition_met <= 1'b0;
						
						symbol_in_prev <= symbol_in;
						start_detect <= 1'b0;
						
						current_state <= STATE_WAIT1;//READ_THRESHOLD_STATE;

					end
					else begin
						stat_calculation <= 1'b0;
						start_calculation <= 1'b0;
						hist_ram_we <= 1'b0;
						prev_threshold <= 32'd0;
						current_threshold <= 32'd0;
						current_state <= WAIT_FOR_DATA_STATE;
						//Update the previous value of symbol_in
						symbol_in_prev <= symbol_in;
						start_detect <= 1'b1;

					end
				end
				
				STATE_WAIT1 : begin
					condition_check <= !(thesh_ram_addr[ADDR_WIDTH-1:0] ^ target_value[ADDR_WIDTH-1:0]);//if(th_add==32)
					start_calculation <= 1'b0;
					stat_calculation <= 1'b0;

					current_state <= STATE_WAIT3;
				
				end

				
				STATE_WAIT3 : begin
					if (wait_cnt == 4'd3) begin
						wait_cnt <= 4'd0;

						current_state <= STATE_WAIT4;
					end else begin
						condition_check <= !(thesh_ram_addr[ADDR_WIDTH-1:0] ^ target_value[ADDR_WIDTH-1:0]);
						wait_cnt <= wait_cnt + 1'b1;

						current_state <= STATE_WAIT3;
					end
				end
				
				STATE_WAIT4 : begin
					current_threshold <= thesh_ram_dout;
					thesh_ram_re <= 1'b0;
					stat_calculation <= 1'b0;
					current_state <= READ_THRESHOLD_STATE;
				
				end

				READ_THRESHOLD_STATE: begin
				// Read the current threshold from external memory

					if (bin_found) begin
						thesh_ram_re <= 1'b0;
						//stat_idx <= 1'b0;
						current_state <= HISTOGRAM_STATE; // Move to histogram state if a bin is found
					end 
					else if (thesh_ram_addr == 0) begin
						// Initial condition handling
						condition_met_b1 <= (yms_out_3d <= current_threshold);

						//condition_met1_b1 <= (thesh_ram_addr < num_bins);

						current_state <= READ_WAIT1;//PROCESS_THRESHOLD_0_STATE; // Proceed to process threshold 0
					end 
					else if (condition_check) begin
						// Handling condition when thesh_ram_addr equals num_bins - 1
						condition_met_b1 <= (yms_out_3d > current_threshold);

						//condition_met1_b1 <= (thesh_ram_addr < num_bins);

						current_state <= READ_WAIT1;//PROCESS_THRESHOLD_n_STATE; // Proceed to process threshold n
					end 

					else begin
						// General case for processing thresholds
						condition_met_b1 <= (yms_out_3d > prev_threshold);
						condition_met_b2 <= (yms_out_3d < current_threshold);
						
						//condition_met1_b1 <= (thesh_ram_addr < num_bins);

						current_state <= READ_WAIT1;
					end
				end

				READ_WAIT1: begin
				// Check for the first condition
				if (thesh_ram_addr == 0) begin
					condition_met <= condition_met_b1;
					//condition_met1 <= condition_met1_b1;
					
					condition_met_reg1 <= condition_met;
					//condition_met1_reg1 <= condition_met1;
					current_state <= PROCESS_THRESHOLD_0_STATE; // Proceed to process threshold 0
				end 
				else if (condition_check) begin
					condition_met <= condition_met_b1;
					//condition_met1 <= condition_met1_b1;
					
					condition_met_reg1 <= condition_met;
					//condition_met1_reg1 <= condition_met1;
					current_state <= PROCESS_THRESHOLD_n_STATE; // Proceed to process threshold n
				end 
				else begin
					condition_met <= condition_met_b1 && condition_met_b2;
					//condition_met1 <= condition_met1_b1;
					
					condition_met_reg1 <= condition_met;
					//condition_met1_reg1 <= condition_met1;
					current_state <= PROCESS_THRESHOLD_STATE; // Move to process after thresholds
				end
			end
			
			
 				PROCESS_THRESHOLD_0_STATE: begin
						if (condition_met) begin
							// Process the bin found condition
							bin_idx <= 0;
							//stat_idx <= 0;
							bin_found <= 1; // A bin was found
							condition_met_b1 <= 1'b0;
							condition_met_b2 <= 1'b0;
							condition_met <= 1'b0;
							current_state <= STATE_WAIT1;//READ_THRESHOLD_STATE;
						end else begin //if (condition_met1) begin
							// Increment threshold index if no bin is found
							thesh_ram_addr <= thesh_ram_addr + 1; // Move to the next threshold
							thesh_ram_re <= 1'b1;
							loop_idx <= 0;
							prev_threshold <= current_threshold;
							//condition_met1_b1 <= 1'b0;
							//condition_met1_b2 <= 1'b0;
							//condition_met1 <= 1'b0;
							current_state <= STATE_WAIT1;//READ_THRESHOLD_STATE;
						end
					//current_state <= STATE_WAIT1;//READ_THRESHOLD_STATE;

				end
				
 				PROCESS_THRESHOLD_STATE: begin
						if (condition_met) begin
							bin_idx <= loop_idx + 1;
							bin_found <= 1;
							condition_met_b1 <= 1'b0;
							condition_met_b2 <= 1'b0;
							condition_met <= 1'b0;
							current_state <= STATE_WAIT1;
						end else begin //if (condition_met1) begin
							thesh_ram_addr <= thesh_ram_addr + 1;
							thesh_ram_re <= 1'b1;
							loop_idx <= loop_idx + 1;
							prev_threshold <= current_threshold;
							//condition_met1_b1 <= 1'b0;
							//condition_met1_b2 <= 1'b0;
							//condition_met1 <= 1'b0;
							current_state <= STATE_WAIT1;
						end
					//current_state <= STATE_WAIT1;
		
				end

				PROCESS_THRESHOLD_n_STATE: begin
						if (condition_met) begin
							bin_idx <= num_bins - 2;
							bin_found <= 1;
							start_calculation <= 1'b1;
							stat_calculation <= 1'b0;
							condition_met_b1 <= 1'b0;
							condition_met_b2 <= 1'b0;
							condition_met <= 1'b0;
							thesh_ram_addr <= thesh_ram_addr + 1;
							current_state <= STATE_WAIT1;
						end else begin //if (condition_met1) begin
							thesh_ram_addr <= thesh_ram_addr + 1;
							thesh_ram_re <= 1'b1;
							loop_idx <= loop_idx + 1;
							prev_threshold <= current_threshold;
							//condition_met1_b1 <= 1'b0;
							//condition_met1_b2 <= 1'b0;
							//condition_met1 <= 1'b0;
							current_state <= STATE_WAIT1;
						end 
					//current_state <= STATE_WAIT1;

				end 

				HISTOGRAM_STATE: begin
					// Calculate the index for the RAM
					hist_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 5) + bin_idx)+addr_offset; // 32 bins per mapped symbol
					hist_ram_re <= 1'b1;
					// //Calculate the index for the STAT RAM
					// stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + stat_idx)+stat_addr_offset; //
					// stat_ram_we <= 1'b1;
					// stat_ram_din <= max_yms_out[current_axc]; // Increment the current count
					
					current_state <= HIST_READ_STATE;
				end

				HIST_READ_STATE: begin
					//current_count <= hist_ram_dout; // Read current count from RAM
					//stat_idx <= 1'b1;//min value
					//stat_ram_we <= 1'b1;
					current_state <= HIST_READ1D1_STATE;//HIST_READ1_STATE;
				end
				
				HIST_READ1D1_STATE: begin
					current_state <= HIST_READ1D2_STATE;//
				end
				HIST_READ1D2_STATE: begin
					current_state <= HIST_READ1_STATE;
				end
				
				
				HIST_READ1_STATE: begin
					//current_count <= hist_ram_dout; // Read current count from RAM
					//hist_ram_re <= 1'b1;
					// // Calculate the index for the STAT RAM
					// stat_ram_addr <= (((mapped_symbol + (axc_count * numSymbols)) << 3) + stat_idx)+stat_addr_offset; //
					// stat_ram_we <= 1'b1;
					// stat_ram_din <= min_yms_out[current_axc]; // Increment the current count
					current_state <= HIST_READ2_STATE;
				end
				
				HIST_READ2_STATE: begin
					current_count <= hist_ram_dout; // Read current count from RAM
					hist_ram_re <= 1'b0;
					current_state <= UPDATE_STATE;
				end
				
				UPDATE_STATE: begin
			    // Update histograms with temp storage
					//counter <= counter + 1;
					bin_found <= 0;
					start_calculation <= 1'b0;
					stat_calculation <= 1'b0;
					loop_idx <= 0;	
					hist_ram_re <= 1'b0;
					//if (symbol_counter < (numOFDMsymbols)) begin
					hist_ram_we <= 1'b1; // Enable write
					//stat_ram_we <= 1'b0;
					hist_ram_din <= current_count + 1; // Increment the current count
					thesh_ram_addr <= 0;
                    current_state <= SYMBOL_INC_STATE;//STATE_WAIT2;//WAIT_FOR_DATA_STATE; // Continue processing in continuous mode or until numOFDMsymbols
					//end else begin
					//hist_ram_we <= 1'b0; // disable write
					//thesh_ram_addr <= 0;
                    //current_state <= UPDATE_STATE_WAIT; //
					//end
				end
				
				SYMBOL_INC_STATE: begin
					if (axc_count == 2'd3 ) begin
					// Calculate current AXC index using the axc_count directly					
						symbol_counter <= symbol_counter + 1'b1;
						axc_count <= axc_count +1;
						current_axc <= current_axc +1;		
						start_calculation <= 1'b1;
						current_state <= STATE_WAIT2;
					end
					else begin
						start_calculation <= 1'b0;
						axc_count <= axc_count +1; 
						current_axc <= current_axc +1;	
						current_state <= STATE_WAIT2;
					end	
				end
				
				STATE_WAIT2 : begin
					if(end_signal) begin					
						// if (cont_d) begin
							// hist_ram_we <= 1'b1; //  write
							// hist_done <= 1'b1;
							// thesh_ram_addr <= 0;
							// hist_ram_din <= hist_ram_din;
							// symbol_counter <= 16'h0000;
							// axc_count <= 2'b11;
							// current_axc <= 2'b11;
							// current_state <= WAIT_FOR_DATA_STATE;
						// end
						// else begin
							hist_ram_we <= 1'b1; //  write
							hist_done <= 1'b1;
							pong_en <= ~(pong_en);
							thesh_ram_addr <= 0;
							current_state <= UPDATE_STATE_WAIT; //
						// end
					end else begin
						hist_ram_we <= 1'b1; // Enable write
						hist_ram_din <= hist_ram_din;
						//axc_count <= axc_count +1; 
						//current_axc <= current_axc+1; //axc_count % numAXCs; // Update current_axc based on axc_count
						current_state <= WAIT_FOR_DATA_STATE;
					end
				end
				
	
				UPDATE_STATE_WAIT: begin
					if (wait_cnt == 4'd15) begin
						hist_done <= 1'b0;					
						current_state <= RESET_MEMORY_STATE;
					end else begin
						hist_done <= 1'b1;
						wait_cnt <= wait_cnt + 1'b1;
						hist_ram_we <= 1'b0; // disable write
						thesh_ram_addr <= 0;
						current_state <= UPDATE_STATE_WAIT;
					end
				end

				default: current_state <= IDLE_STATE;
			endcase
		end
	end

	assign ping_status_out = pong_en;

endmodule
