// ================================================================================
// Copyright (c) <2017>, Intel Corporation
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
// 
//     * Redistributions of source code must retain the above copyright notice,
//       this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Intel Corporation nor the names of its contributors
//       may be used to endorse or promote products derived from this software
//       without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ================================================================================ 

// -------------------------------------------------------------
// 
// Module: power_meter_top_ss
// Source Path: /fpga/src/ip/custom/power_meter/power_meter_top_ss
// Hierarchy Level: TOP
// 
// -------------------------------------------------------------


`timescale 1 ns / 1 ns

module power_meter_top_ss#(
    parameter DATA_WIDTH = 32,
	parameter RAM_WIDTH = 16,
    parameter ADDR_WIDTH = 6,  // 2^6 = 64 locations
	parameter ADDR_WIDTH1 = 12,  // 2^12 = 4096 locations
	parameter ADDR_WIDTH2 = 10  // 2^12 = 1024 locations

)
			(	
			input                            	clk_dsp									,
			input                            	rst_dsp_n								,
			input                            	clk_csr                  				, 
			input                            	rst_csr_n                				, 
			input                            	rst_soft_n               				,
						
			input   signed 	[15:0] 				ai										,// sfix16_En14
			input   signed 	[15:0] 				aq										,// sfix16_En14
			input   							valid_i									,
			input			[7:0]  				channel_i								,
			
			output								hist_done_intr						,
			//output								ping_n_status_o						,
			
			// Traffic MM Slave	
			input  			[ADDR_WIDTH-1:0]   	pm_threash_mm_bridge_address		,
			input  			         			pm_threash_mm_bridge_chipselect	,
			input  			         			pm_threash_mm_bridge_read			,
			input  			         			pm_threash_mm_bridge_write			,	
			input  			[DATA_WIDTH-1:0] 	pm_threash_mm_bridge_writedata		,
			input  			[3:0]    			pm_threash_mm_bridge_byteenable	,
			output	reg		[DATA_WIDTH-1:0] 	pm_threash_mm_bridge_readdata		,
			output 			         			pm_threash_mm_bridge_waitrequest	,
			
			// Traffic MM Slave	
			input  			[ADDR_WIDTH1-1:0]  	pm_hist_mm_bridge_address			,
			input  			         			pm_hist_mm_bridge_chipselect		,
			input  			         			pm_hist_mm_bridge_read				,
			input  			         			pm_hist_mm_bridge_write			    ,	
			input  			[DATA_WIDTH-1:0] 	pm_hist_mm_bridge_writedata		    ,
			input  			[3:0]    			pm_hist_mm_bridge_byteenable		,
			output	reg		[DATA_WIDTH-1:0] 	pm_hist_mm_bridge_readdata			,
			output	reg 						pm_hist_mm_bridge_readdatavalid		,
			output 			         			pm_hist_mm_bridge_waitrequest		,
			
			// Traffic MM Slave	
			input  			[ADDR_WIDTH2-1:0]   pm_stat_mm_bridge_address			,
			input  			         			pm_stat_mm_bridge_chipselect		,
			input  			         			pm_stat_mm_bridge_read				,
			input  			         			pm_stat_mm_bridge_write			    ,	
			input  			[DATA_WIDTH-1:0] 	pm_stat_mm_bridge_writedata		    ,
			input  			[3:0]    			pm_stat_mm_bridge_byteenable		,
			output	reg		[DATA_WIDTH-1:0] 	pm_stat_mm_bridge_readdata			,
			output	reg 						pm_stat_mm_bridge_readdatavalid		,
			output 			         			pm_stat_mm_bridge_waitrequest		,
			
			//CONFIG REGISTER BUS
			input 	wire 	[DATA_WIDTH-1:0]	pwr_mtr_config_csr_writedata		,	
			input 	wire 						pwr_mtr_config_csr_read				,
			input 	wire	 					pwr_mtr_config_csr_write			,
			output 	wire 	[DATA_WIDTH-1:0]	pwr_mtr_config_csr_readdata			,
			output 	wire 						pwr_mtr_config_csr_readdatavalid	,	
			input	wire 	[3:0] 				pwr_mtr_config_csr_address
			

			);

	//SIGNAL DECLERATION
						  wire					rst_dsp_sync						;
						  
	(*preserve_syn_only*) reg					rst_dsp_n_1d	    				;
	(*preserve_syn_only*) reg					rst_dsp_n_2d	    				;
	(*preserve_syn_only*) reg 					rst_dsp_n_3d	    				;
	(*preserve_syn_only*) reg 					rst_dsp_n_4d	    				;
	
	(*preserve_syn_only*) reg 					rst_dsp_n_2d_dup1					;
	
	(*preserve_syn_only*) reg 					rst_dsp_n_3d_dup1					;
	(*preserve_syn_only*) reg 					rst_dsp_n_4d_dup1					;
	
	(*preserve_syn_only*) reg 					rst_dsp_n_3d_dup2					;
	(*preserve_syn_only*) reg 					rst_dsp_n_4d_dup2					;
	
	(*preserve_syn_only*) reg 					rst_dsp_n_3d_dup3					;
	(*preserve_syn_only*) reg 					rst_dsp_n_4d_dup3					;
	
	(*preserve_syn_only*) reg 					rst_dsp_n_5d_dup1					;
	(*preserve_syn_only*) reg 					rst_dsp_n_6d_dup1					;
	
	(*preserve_syn_only*) reg 					rst_dsp_n_5d_dup2					;
	(*preserve_syn_only*) reg 					rst_dsp_n_6d_dup2					;
	
	(*preserve_syn_only*) reg 					rst_dsp_soft_n_1d 					;
	(*preserve_syn_only*) reg 					rst_dsp_soft_n_1d_dup1 				;
	
	(*preserve_syn_only*) reg 					rst_dsp_soft_n_2d 					;
	
	(*preserve_syn_only*) reg 					rst_dsp_soft_n_3d_dup1   			;
	(*preserve_syn_only*) reg 					rst_dsp_soft_n_4d_dup1   			;
	
	(*preserve_syn_only*) reg 					rst_dsp_soft_n_3d_dup2   			;
	(*preserve_syn_only*) reg 					rst_dsp_soft_n_4d_dup2  			;
	
	(*preserve_syn_only*) reg 					rst_dsp_soft_n_3d_dup3   			;
	(*preserve_syn_only*) reg 					rst_dsp_soft_n_4d_dup3   			;
	
	(*preserve_syn_only*) reg 					rst_dsp_soft_n_5d_dup1   			;
	(*preserve_syn_only*) reg 					rst_dsp_soft_n_6d_dup1   			;
	
	(*preserve_syn_only*) reg 					rst_dsp_soft_n_5d_dup2   			;
	(*preserve_syn_only*) reg 					rst_dsp_soft_n_6d_dup2   			;
	
	(*preserve_syn_only*) reg    			 	rst_dsp_n_1d_dup1               	;	
	(*preserve_syn_only*) reg    			 	rst_dsp_n_1d_dup2               	;
	(*preserve_syn_only*) reg     			 	rst_dsp_n_2d_dup2               	;
												
	(*preserve_syn_only*) reg    			 	rst_dsp_n_1d_dup3               	;
	(*preserve_syn_only*) reg   			 	rst_dsp_n_2d_dup3               	;
												
	(*preserve_syn_only*) reg                	rst_dsp_n_1d_dup4               	;
	(*preserve_syn_only*) reg                	rst_dsp_n_2d_dup4               	;

    //THREASHOLD DPRAM RTL SIGNALS
						  wire [ADDR_WIDTH-1:0] addr_b								;
						  wire [DATA_WIDTH-1:0] din_b								;
						  wire we_b													;
						  wire re_b													;
						  wire [DATA_WIDTH-1:0] dout_b								;
	//HISTOGRAM DPRAM RTL SIGNALS					  
						  wire [ADDR_WIDTH1-1:0] addr_hist_b						;
						  wire [RAM_WIDTH-1:0] din_hist_b							;
						  wire we_hist_b											;
						  wire re_hist_b											;
						  reg [RAM_WIDTH-1:0] dout_hist_b							;
	//STATISTICS DPRAM RTL SIGNALS					  
						  wire [ADDR_WIDTH2-1:0] addr_stat_b						;
						  wire [RAM_WIDTH-1:0] din_stat_b							;
						  wire we_stat_b											;
						  wire re_stat_b											;
						  wire [RAM_WIDTH-1:0] dout_stat_b							;					  
						  
	//CONTROL/STATUS SIGNALS
	wire [15:0] fft_size_control_sig;// uint16 	--------------> FFT_SIZE
	wire [16:0] longtermtime_symb_control_sig;//	uint16	--------------> LONGTERMTIME_SYMBL
	wire hist_done_status_sig;//	bool	--------------> HISTOGRAM_CAPTURE_DONE
	wire ping_mem_status_sig;// bool	--------------> PING/PONG_MEM_LOCATION
	
	reg hist_done_status_d1;
	reg hist_done_status_d2;
	reg	hist_done_status_d3;
	
	// Status Register Inputs
    reg [1:0] status_data_status;
    reg [1:0] status_saturation;
    reg [15:0] status_reserved1;
    reg [3:0] status_debug_state;

    // Outputs from the register
    wire [3:0] control_pwr_mode;
    wire control_start_nstop;
    wire control_irq_enable;
    wire [1:0] control_dl_pwr_enable;
    wire [1:0] control_ul_pwr_enable;
    wire control_reset;
    wire [31:0] compute_time;
    wire interrupt_mask_error;
    wire interrupt_mask_data_ready;
	
	// 2stage registering for timing fix
	reg control_start_nstop_1d,control_start_nstop_3d,control_start_nstop_5d;
	reg control_start_nstop_2d,control_start_nstop_4d,control_start_nstop_6d;
	
	reg [3:0] control_pwr_mode_1d,control_pwr_mode_3d,control_pwr_mode_5d;
	reg [3:0] control_pwr_mode_2d,control_pwr_mode_4d,control_pwr_mode_6d;
	
	reg [16:0] longtermtime_symb_control_1d,longtermtime_symb_control_3d,longtermtime_symb_control_5d;
	reg [16:0] longtermtime_symb_control_2d,longtermtime_symb_control_4d,longtermtime_symb_control_6d;
	
	reg [15:0] fft_size_control_1d,fft_size_control_3d,fft_size_control_5d;
	reg [15:0] fft_size_control_2d,fft_size_control_4d,fft_size_control_6d;
	
	reg [1:0] status_data_status_d1;
	reg [1:0] status_data_status_d2;
	
	wire single_sig;
	wire cont_sig;
	
	reg [DATA_WIDTH-1:0] 	pm_threash_mm_bridge_readdata_reg1;
	wire [DATA_WIDTH-1:0] 	pm_threash_mm_bridge_readdata_wire;
	
	reg [RAM_WIDTH-1:0] 	pm_hist_mm_bridge_readdata_reg1;
	wire [RAM_WIDTH-1:0] 	pm_hist_mm_bridge_readdata_wire;
	
	reg [RAM_WIDTH-1:0] 	pm_stat_mm_bridge_readdata_reg1;
	wire [RAM_WIDTH-1:0] 	pm_stat_mm_bridge_readdata_wire;
	
	
	reg 			pm_hist_mm_bridge_readdatavalid_d1;
	reg 			pm_stat_mm_bridge_readdatavalid_d1;
	
	reg buffer_overflow;
	reg buffer_underflow;
	
	reg irq;                          // IRQ output (interrupt signal)
    reg irq_triggered;                // IRQ triggered flag (to indicate interrupt has been triggered)

	
	//ASSIGNMENTS
	assign pm_threash_mm_bridge_waitrequest 	= 'd0	;
	assign pm_hist_mm_bridge_waitrequest 		= 'd0	;
	assign pm_stat_mm_bridge_waitrequest 		= 'd0	;
	

	always @(posedge clk_dsp)
	begin
		    control_start_nstop_1d 		<= control_start_nstop;
			control_start_nstop_2d 		<= control_start_nstop_1d;
			control_start_nstop_3d 		<= control_start_nstop_2d;
			control_start_nstop_4d 		<= control_start_nstop_3d;
			control_start_nstop_5d 		<= control_start_nstop_4d;
			control_start_nstop_6d 		<= control_start_nstop_5d;
	end
	
	always @(posedge clk_dsp)
	begin
		    control_pwr_mode_1d 		<= control_pwr_mode;
			control_pwr_mode_2d 		<= control_pwr_mode_1d;
			control_pwr_mode_3d 		<= control_pwr_mode_2d;
			control_pwr_mode_4d 		<= control_pwr_mode_3d;
			control_pwr_mode_5d 		<= control_pwr_mode_4d;
			control_pwr_mode_6d 		<= control_pwr_mode_5d;
	end
	
	assign single_sig = (control_pwr_mode_6d == 4'b0001) ? 1'b1 : 1'b0;
	assign cont_sig = (control_pwr_mode_6d == 4'b0010) ? 1'b1 : 1'b0;
	
	always @(posedge clk_dsp)
	begin
		    longtermtime_symb_control_1d 		<= longtermtime_symb_control_sig;
			longtermtime_symb_control_2d 		<= longtermtime_symb_control_1d;	
			longtermtime_symb_control_3d 		<= longtermtime_symb_control_2d;
			longtermtime_symb_control_4d 		<= longtermtime_symb_control_3d;
			longtermtime_symb_control_5d 		<= longtermtime_symb_control_4d;
			longtermtime_symb_control_6d 		<= longtermtime_symb_control_5d;
	end
	
	always @(posedge clk_dsp)
	begin
		    fft_size_control_1d 		<= fft_size_control_sig;
			fft_size_control_2d 		<= fft_size_control_1d;	
			fft_size_control_3d 		<= fft_size_control_2d;	
			fft_size_control_4d 		<= fft_size_control_3d;	
			fft_size_control_5d 		<= fft_size_control_4d;	
			fft_size_control_6d 		<= fft_size_control_5d;	
	end
	
	always @(posedge clk_csr)
	begin
			hist_done_status_d1 <= hist_done_status_sig;
			hist_done_status_d2 <= hist_done_status_d1;
			hist_done_status_d3 <= hist_done_status_d2;
	end
	
	//assign hist_done_intr = hist_done_status_sig;
	
	always @(posedge clk_csr)
	begin
		pm_threash_mm_bridge_readdata_reg1 <= pm_threash_mm_bridge_readdata_wire;
		pm_threash_mm_bridge_readdata <= pm_threash_mm_bridge_readdata_reg1;

   	end

	always @(posedge clk_csr)
	begin
		pm_hist_mm_bridge_readdata_reg1 <= pm_hist_mm_bridge_readdata_wire;
		pm_hist_mm_bridge_readdata <= {16'b0,pm_hist_mm_bridge_readdata_reg1};
    	end
	
	always @(posedge clk_csr)
	begin
		pm_stat_mm_bridge_readdata_reg1 <= pm_stat_mm_bridge_readdata_wire;
		pm_stat_mm_bridge_readdata <= {16'b0,pm_stat_mm_bridge_readdata_reg1};
    	end
	
	
	always @(posedge clk_csr)
	begin
		pm_hist_mm_bridge_readdatavalid_d1 <= pm_hist_mm_bridge_read;
		pm_hist_mm_bridge_readdatavalid <= pm_hist_mm_bridge_readdatavalid_d1;
    	end
	
	always @(posedge clk_csr)
	begin
		pm_stat_mm_bridge_readdatavalid_d1 <= pm_stat_mm_bridge_read;
		pm_stat_mm_bridge_readdatavalid <= pm_stat_mm_bridge_readdatavalid_d1;
    end
	

	always @(posedge clk_csr or negedge rst_csr_n)
	begin
		if (!rst_csr_n) begin
			status_data_status_d1[0] <= 1'b0;
			status_data_status_d1[1] <= 1'b0;
			//status_reserved1[0]	<= 1'b0;
			status_saturation <= 2'b0;
			status_reserved1 <= 16'b0;
			status_debug_state <= 4'b0;
		end 
		else if ((hist_done_status_d3 && !(hist_done_status_d2))) begin
			status_data_status_d1[0] <= ping_mem_status_sig;//Ping status
			status_data_status_d1[1] <= !ping_mem_status_sig;//Pong status
			status_reserved1[0]	<= 1'b1;
		end else if (control_reset) begin
			status_data_status_d1[0] <= 1'b0;
			status_data_status_d1[1] <= 1'b0;
			//status_reserved1[0]	<= 1'b0;
			status_saturation <= 2'b0;
			status_reserved1 <= 16'b0;
			status_debug_state <= 4'b0;
		end
		else begin
			status_data_status_d1[0] <= status_data_status_d1[0];
			status_data_status_d1[1] <= status_data_status_d1[1];
			status_reserved1[1]	<= buffer_overflow;
			status_reserved1[2]	<= buffer_underflow;
			status_reserved1[3] <= irq_triggered;
		end
	end
	
	always @(posedge clk_csr)
	begin
			status_data_status_d2 		<= status_data_status_d1;
			status_data_status 			<= status_data_status_d2;	
	end
	

	always @(posedge clk_csr or negedge rst_csr_n) begin
		if (!rst_csr_n) begin
			buffer_overflow <= 0;  // Reset overflow flag
		end else if (control_reset) begin
			buffer_overflow <= 0;  // Reset overflow flag;
		end else begin
			// Check for overflow when A-port is reading from Ping memory (status_data_status_d1[0] == 1)
			if (pm_hist_mm_bridge_read == 1 && status_data_status_d1[0] == 1) begin
				if (addr_hist_b < 2048) begin
					buffer_overflow <= 1;  // Overflow: B-port writing outside Ping memory
				end else begin
					buffer_overflow <= 0;  // No overflow
				end
			end
				// Check for overflow when A-port is reading from Pong memory (status_data_status_d1[1] == 1)
			if (pm_hist_mm_bridge_read == 1 && status_data_status_d1[1] == 1) begin
				if (addr_hist_b >= 2048) begin
					buffer_overflow <= 1;  // Overflow: B-port writing outside Pong memory
				end else begin
					buffer_overflow <= 0;  // No overflow
				end
			end
		end
	end	
	
	always @(posedge clk_csr or negedge rst_csr_n) begin
		if (!rst_csr_n) begin
			buffer_underflow <= 0;  // Reset underflow flag
		end else if (control_reset) begin
			buffer_underflow <= 0;  // Reset overflow flag;
		end	else begin
			// Check for underflow when A-port is reading from pong memory (status_data_status_d1[0] == 1)
			if (pm_hist_mm_bridge_read == 1 && status_data_status_d1[0] == 1) begin
				if (pm_hist_mm_bridge_address >= 2048) begin
					buffer_underflow <= 1;  // underflow: A-port reading outside Ping memory
				end else begin
					buffer_underflow <= 0;  // No underflow
				end
			end
			// Check for underflow when A-port is reading from ping memory (status_data_status_d1[1] == 1)
			if (pm_hist_mm_bridge_read == 1 && status_data_status_d1[1] == 1) begin
				if (pm_hist_mm_bridge_address < 2048) begin
					buffer_underflow <= 1;  // underflow: A-port reading outside Pong memory
				end else begin
					buffer_underflow <= 0;  // No underflow
				end
			end
		end
	end	
	
	
	// Interrupt generation logic
    always @(posedge clk_csr or negedge rst_csr_n) begin
        if (!rst_csr_n) begin
            irq <= 0;              // Clear IRQ on reset
            irq_triggered <= 0;     // Clear IRQ triggered flag
        end else if (control_reset) begin
			irq_triggered <= 0;     // Clear IRQ triggered flag
		end	else begin
            irq <= 0;              // Default IRQ signal is low

            // Check if IRQs are enabled and if hist_done is asserted
            if (control_irq_enable && hist_done_status_sig) begin
                // Check if the interrupt is not masked (both error and data_ready interrupts)
                if (~interrupt_mask_error && ~interrupt_mask_data_ready) begin
                    irq <= 1;        // Set IRQ signal high to indicate an interrupt
                    irq_triggered <= 1; // Set IRQ triggered flag
                end
            end else if (control_reset) begin
                irq_triggered <= 0; // Reset IRQ trigger flag if no interrupt is triggered
            end
        end
    end
	assign hist_done_intr = irq;

	
	always @(posedge clk_dsp)
	begin
	
		    rst_dsp_n_1d 		<= rst_dsp_n;//active low reset
			rst_dsp_n_2d 		<= rst_dsp_n_1d;	
			rst_dsp_n_3d 		<= rst_dsp_n_2d;
			rst_dsp_n_4d 		<= rst_dsp_n_3d;
	end
	
	wire reset_dsp_4d = !rst_dsp_n_4d;

	always @(posedge clk_dsp)
	begin
		rst_dsp_n_2d_dup1 		<= rst_dsp_n_1d;
		
		rst_dsp_n_3d_dup1   	<= rst_dsp_n_2d;
		rst_dsp_n_4d_dup1  		<= rst_dsp_n_3d_dup1;
				
		rst_dsp_n_3d_dup2   	<= rst_dsp_n_2d;
		rst_dsp_n_4d_dup2  		<= rst_dsp_n_3d_dup2;
				
		rst_dsp_n_3d_dup3   	<= rst_dsp_n_2d;
		rst_dsp_n_4d_dup3  		<= rst_dsp_n_3d_dup3;		
	end	
		
	always @(posedge clk_dsp)
	begin
	    rst_dsp_n_5d_dup1  		<= rst_dsp_n_4d;
		rst_dsp_n_6d_dup1  		<= rst_dsp_n_5d_dup1;
				
   		rst_dsp_n_5d_dup2  		<= rst_dsp_n_4d;
		rst_dsp_n_6d_dup2  		<= rst_dsp_n_5d_dup2;

	end	
	
	always @(posedge clk_dsp)
	begin
		rst_dsp_soft_n_1d 		<= rst_soft_n;
		rst_dsp_soft_n_1d_dup1 	<= rst_soft_n;
		
		rst_dsp_soft_n_2d 		<= rst_dsp_soft_n_1d;
	
		rst_dsp_soft_n_3d_dup1  <= rst_dsp_soft_n_2d;
		rst_dsp_soft_n_4d_dup1  <= rst_dsp_soft_n_3d_dup1;
		rst_dsp_soft_n_5d_dup1  <= rst_dsp_soft_n_4d_dup1;
		rst_dsp_soft_n_6d_dup1  <= rst_dsp_soft_n_5d_dup1;
								
		rst_dsp_soft_n_3d_dup2  <= rst_dsp_soft_n_2d;
		rst_dsp_soft_n_4d_dup2  <= rst_dsp_soft_n_3d_dup2;
		rst_dsp_soft_n_5d_dup2  <= rst_dsp_soft_n_4d_dup2;
		rst_dsp_soft_n_6d_dup2  <= rst_dsp_soft_n_5d_dup2;
								
		rst_dsp_soft_n_3d_dup3  <= rst_dsp_soft_n_2d;
		rst_dsp_soft_n_4d_dup3  <= rst_dsp_soft_n_3d_dup3;		
		
	end	

	always @ (posedge clk_dsp)
	begin
		rst_dsp_n_1d_dup1 	<= rst_dsp_n_4d_dup1  & rst_dsp_soft_n_4d_dup1 ;	
			
		rst_dsp_n_1d_dup2 	<= rst_dsp_n_4d_dup1  & rst_dsp_soft_n_4d_dup1 ;
		rst_dsp_n_2d_dup2 	<= rst_dsp_n_1d_dup2;	
			
		rst_dsp_n_1d_dup3 	<= rst_dsp_n_4d_dup1  & rst_dsp_soft_n_4d_dup1 ;
		rst_dsp_n_2d_dup3 	<= rst_dsp_n_1d_dup3;
			
		rst_dsp_n_1d_dup4 	<= rst_dsp_n_4d_dup1  & rst_dsp_soft_n_4d_dup1 ;
		rst_dsp_n_2d_dup4 	<= rst_dsp_n_1d_dup4						   ;	
	end	
		
	//INSTANTIATION	
	power_meter_ss #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH), .ADDR_WIDTH1(ADDR_WIDTH1)) u0_power_meter_ss 
	(	
		.clk_dsp   	     (clk_dsp),
		.rst_dsp_n          (rst_dsp_n_4d),//active low reset
		.ai                 (ai),// sfix16_En14
		.aq                 (aq),// sfix16_En14
		.valid_i            (valid_i),
		.channel_i          (channel_i),
		.nextpow2_count_i   (fft_size_control_6d),
		.mean_o             (),// ufix32_En20
		.csum               (),// ufix35_En20
		.valid_o            (),
		.numOFDMsymbols     (longtermtime_symb_control_6d),
		.pwr_start			(control_start_nstop_6d),
		.hist_done			(hist_done_status_sig),
		.ping_status_out	(ping_mem_status_sig),
		.single_in			(single_sig), // Single control signal
		.cont_in			(cont_sig),//Continuous control signal
		.shared_ram_addr    (addr_b),
		.shared_ram_dout    (dout_b),
		.shared_ram_din     (din_b),
		.shared_ram_re		(re_b),
		.shared_ram_we      (we_b),
		.stat_ram_addr      (addr_stat_b),
		.stat_ram_din       (din_stat_b),
		.stat_ram_dout      (dout_stat_b),
		.stat_ram_re		(re_stat_b),
		.stat_ram_we        (we_stat_b),
		.hist_ram_addr      (addr_hist_b),
		.hist_ram_din       (din_hist_b),
		.hist_ram_dout      (dout_hist_b),
		.hist_ram_re		(re_hist_b),
		.hist_ram_we        (we_hist_b)
    );

	oc_ram_32i_32o_64d_dc u2_threash_ram_inst					  
	(
		.data_a    (pm_threash_mm_bridge_writedata),    //   input,  width = 32,    data_a.datain_a
		.q_a       (pm_threash_mm_bridge_readdata_wire),       //   output,  width = 32,       q_a.dataout_a
		.data_b    (din_b),    //   input,  width = 32,    data_b.datain_b
		.q_b       (dout_b),       //   output,  width = 32,       q_b.dataout_b
		.address_a (pm_threash_mm_bridge_address), //   input,  width = 6, address_a.address_a
		.address_b (addr_b), //   input,  width = 6, address_b.address_b
		.wren_a    (pm_threash_mm_bridge_write),    //   input,   width = 1,    wren_a.wren_a
		.wren_b    (we_b),    //   input,   width = 1,    wren_b.wren_b
		.inclock   (clk_dsp),   //   input,   width = 1,   inclock.clk
		.outclock  (clk_dsp),  //   input,   width = 1,  outclock.clk
		.rden_a    (pm_threash_mm_bridge_read),    //   input,   width = 1,    rden_a.rden_a
		.rden_b    (re_b),    //   input,   width = 1,    rden_b.rden_b
		.out_aclr  (reset_dsp_4d)   //   input,   width = 1,  out_aclr.reset //active high reset
	);

	
	wire [RAM_WIDTH-1:0] dout_hist_b_wire;
	reg  [RAM_WIDTH-1:0] dout_hist_b_d1;
	always @(posedge clk_dsp)
	begin
		dout_hist_b_d1 <= dout_hist_b_wire;
		dout_hist_b <= dout_hist_b_d1;
    end
	
	oc_ram_16i_16o_4kd_dc u3_hist_ram_inst
	(
		.data_a    (pm_hist_mm_bridge_writedata[15:0]),    //   input,  width = 16,    data_a.datain_a
		.q_a       (pm_hist_mm_bridge_readdata_wire),       //   output,  width = 16,       q_a.dataout_a
		.data_b    (din_hist_b),    //   input,  width = 16,    data_b.datain_b
		.q_b       (dout_hist_b_wire),       //   output,  width = 16,       q_b.dataout_b
		.address_a (pm_hist_mm_bridge_address), //   input,  width = 12, address_a.address_a
		.address_b (addr_hist_b), //   input,  width = 12, address_b.address_b
		.wren_a    (pm_hist_mm_bridge_write),    //   input,   width = 1,    wren_a.wren_a
		.wren_b    (we_hist_b),    //   input,   width = 1,    wren_b.wren_b
		.inclock   (clk_dsp),   //   input,   width = 1,   inclock.clk
		.outclock  (clk_dsp),  //   input,   width = 1,  outclock.clk
		.rden_a    (pm_hist_mm_bridge_read),    //   input,   width = 1,    rden_a.rden_a
		.rden_b    (re_hist_b),    //   input,   width = 1,    rden_b.rden_b
		.out_aclr  (reset_dsp_4d)   //   input,   width = 1,  out_aclr.reset //active high reset
	);
	
	oc_ram_16i_16o_1kd_dc u4_stat_ram_inst
	(
		.data_a    (pm_stat_mm_bridge_writedata[15:0]),    //   input,  width = 16,    data_a.datain_a
		.q_a       (pm_stat_mm_bridge_readdata_wire),       //   output,  width = 16,       q_a.dataout_a
		.data_b    (din_stat_b),    //   input,  width = 16,    data_b.datain_b
		.q_b       (dout_stat_b),       //   output,  width = 16,       q_b.dataout_b
		.address_a (pm_stat_mm_bridge_address), //   input,  width = 10, address_a.address_a
		.address_b (addr_stat_b), //   input,  width = 10, address_b.address_b
		.wren_a    (pm_stat_mm_bridge_write),    //   input,   width = 1,    wren_a.wren_a
		.wren_b    (we_stat_b),    //   input,   width = 1,    wren_b.wren_b
		.inclock   (clk_dsp),   //   input,   width = 1,   inclock.clk
		.outclock  (clk_dsp),  //   input,   width = 1,  outclock.clk
		.rden_a    (pm_stat_mm_bridge_read),    //   input,   width = 1,    rden_a.rden_a
		.rden_b    (re_stat_b),    //   input,   width = 1,    rden_b.rden_b
		.out_aclr  (reset_dsp_4d)   //   input,   width = 1,  out_aclr.reset //active high reset
	);


	// Instantiate the PWR_MTR_SS_Registers module
	PWR_MTR_SS_Registers u1_pwr_mtr_ss_inst (
		// Bus interface
		.clk								(clk_csr									),//input wire
		.reset								(~rst_csr_n									),//input wire //active high reset
		.writedata							(pwr_mtr_config_csr_writedata				),//input wire [31:0]
		.read								(pwr_mtr_config_csr_read					),//input wire
		.write								(pwr_mtr_config_csr_write					),//input wire
		.byteenable							(4'b1111									),//input wire [3:0] 
		.address							({pwr_mtr_config_csr_address[1:0],2'b00	}	),//input wire [3:0]

		// Control Register Outputs
		.pwr_mtr_control_reg_mode			(control_pwr_mode							),//output reg [3:0]
		.pwr_mtr_control_reg_StartnStop		(control_start_nstop						),//output reg
		.pwr_mtr_control_reg_IRQ_Enable		(control_irq_enable							),//output reg
		.pwr_mtr_control_reg_DL_pwr_en		(control_dl_pwr_enable						),//output reg [1:0] 
		.pwr_mtr_control_reg_UL_pwr_en		(control_ul_pwr_enable						),//output reg [1:0] 
		.pwr_mtr_control_reg_control_reset	(control_reset								),//output reg
			
		// Status Register Inputs
		.pwr_mtr_status_reg_data_status_i	(status_data_status							),//input wire [1:0]
		.pwr_mtr_status_reg_saturation_i	(status_saturation							),//input wire [1:0]
		.pwr_mtr_status_reg_debug_state_i	(status_debug_state							),//input wire [3:0]
		.pwr_mtr_status_reg_reserved1_i		(status_reserved1							),//input wire [15:0]
			
		// Compute Time Register Outputs
		.pwr_mtr_compute_time_comp_time		(compute_time								),//output reg [31:0]
			
		// Interrupt Mask Register Outputs
		.pwr_mtr_intr_mask_reg_Error		(interrupt_mask_error						),//output reg
		.pwr_mtr_intr_mask_reg_data_ready	(interrupt_mask_data_ready					),//output reg

		// Read Data Interface
		.readdata							(pwr_mtr_config_csr_readdata				),//output reg [31:0]
		.readdatavalid						(pwr_mtr_config_csr_readdatavalid			) //output reg
	);

	assign longtermtime_symb_control_sig = compute_time[16:0];
	assign fft_size_control_sig = 16'd12;

endmodule //power_meter_top_ss
