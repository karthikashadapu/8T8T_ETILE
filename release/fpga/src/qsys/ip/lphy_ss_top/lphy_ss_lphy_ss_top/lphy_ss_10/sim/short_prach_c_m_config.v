/*******************************************************************************************
**                                                                                        **
**                                                                                        **
**  Copyright 2016-2017 Intel Corporation.                                                **
**  The source code contained or described herein and all documents related to the        **
**  source code ("Material") are owned by Intel Corporation or its suppliers.             **
**  Title to the Material remains with Intel Corporation, its suppliers, or licensors.    **
**  The Material contains trade secrets and proprietary and confidential information      **
**  of Intel Corporation, its suppliers, and licensors, and is protected by worldwide     **
**  copyright and trade secret laws and treaty provisions. No part of the Material        **
**  may be used, copied, reproduced, modified, published, uploaded, posted,               **
**  transmitted, distributed, or disclosed in any way without Intel's prior express       **
**  written permission.                                                                   **
**  No license under any patent, copyright, trade secret or other intellectual            **
**  property right is granted to or conferred upon you by disclosure or delivery of       **
**  the Materials, either expressly, by implication, inducement, estoppel or otherwise.   **
**  Any license under such intellectual property rights must be express and approved by   **
**  Intel in writing.                                                                     **
**  Unless otherwise agreed by Intel in writing, you may not remove or alter this notice  **
**  or any other notice embedded in Materials by Intel or Intel's suppliers or licensors  **
**  in any way.                                                                           **
**                                                                                        **
**                                                                                        **
*******************************************************************************************/

// ================================================================================ 
// File:        long_prach_nco_config_wrapper.v
// Author:      Boobathi Selvaraj
// Description: It decodes the incoming Sec Type 3 C plane packet from ORAN IP and extracts the freq offset and caculates the 
// NCO value and configures the PRACH IP NCO at SF Boundary.
// It also has a MUX to select whether to configure the NCO from M plane or C plane. 
// ================================================================================ 

// Version : 01
// Latest change: Changed the NCO register assignment from 32 bits to 30 bits for all four antennas, appending zeroes for extra 2 bits
//				  lw_bridge_writedata	<= {0, 0, prach_nco_ant0_2d[29:0]};
//				  lw_bridge_writedata	<= {0, 0, frequencyOffset_ant0_2d[29:0]};		

	`timescale 1ns/1ns
 
	module short_prach_c_m_config(
		//CSR Clock
		clk_csr					,
		rst_csr_n				,

		// HPS Interface
		lw_bridge_waitrequest  	,
		lw_bridge_readdata     	,
		lw_bridge_readdatavalid	,
		lw_bridge_writedata    	,
		lw_bridge_address      	,
		lw_bridge_write        	,
		lw_bridge_read         	,
		
		SF         		        ,  // LSB Bit of Sub frame number
		c_m_plane_sel 			,  // 0 C plane, 1 M plane
		
		prach_c_freq_offset		,	// C Plane				
		prach_c_fft_size        ,
        prach_m_freq_offset		,	// M Plane				
		prach_m_fft_size	    ,
        prach_cfg_idx			,
        prach_cfg_time_idx		,
        n_prach_slot			,
        active_prach_slot		,
        prach_freq_idx			,
		ul_start_pulse_latch
			
	);
	  
	parameter IDLE 			= 4'b0000;
	parameter ST0 			= 4'b0001;
	parameter ST1		 	= 4'b0010;
	parameter ST2			= 4'b0011;
	parameter ST3 			= 4'b0100;
	parameter ST4		 	= 4'b0101; 
	parameter ST5			= 4'b0110;
	parameter ST6 			= 4'b0111;
	parameter ST7		 	= 4'b1000; 
    parameter version		= 32'h01;
	
	input clk_csr;
	input rst_csr_n;

	// Light Weight Configuration 
	output  [1:0]      lw_bridge_address		;
	output             lw_bridge_write			;
	output             lw_bridge_read			;	
	input   [31:0]     lw_bridge_readdata		;
	input              lw_bridge_readdatavalid	;
	output  [31:0]     lw_bridge_writedata		;
	input              lw_bridge_waitrequest	;	

	input   		   SF 					    ; 
	input   		   c_m_plane_sel   		    ;

	input [23:0]		prach_c_freq_offset         ;	
	input [3:0]			prach_c_fft_size            ; 
	input [23:0]		prach_m_freq_offset         ;	
	input [3:0]			prach_m_fft_size            ; 
	
    input [7:0]  		prach_cfg_idx			;
    input [31:0]    	prach_cfg_time_idx		;
    input [31:0]  		n_prach_slot		    ;
    input [31:0] 		active_prach_slot		;
    input [31:0]    	prach_freq_idx			;
	input wire ul_start_pulse_latch;
	reg ul_start_pulse_latch_1d;
	wire ul_start_pos;
	
	reg     [4:0]      state	;

	reg     [3:0]      lw_bridge_address		;
	reg                lw_bridge_write			;
	reg                lw_bridge_read			;
	wire   [31:0]      lw_bridge_readdata		;
	wire               lw_bridge_readdatavalid	;
	reg    [31:0]      lw_bridge_writedata		;
	wire               lw_bridge_waitrequest	;

	reg                SF_1d				;
	reg                SF_2d				;
	reg                SF_3d				;
	reg                SF_4d				;
	
	reg                c_m_plane_sel_1d		;
	reg                c_m_plane_sel_2d		;

	wire               SF_Change_detect;

    reg [23:0]			prach_c_freq_offset_1d         ;	
	reg [3:0]			prach_c_fft_size_1d            ; 
	reg [23:0]			prach_m_freq_offset_1d         ;	
	reg [3:0]			prach_m_fft_size_1d            ; 
	reg [23:0]			prach_c_freq_offset_2d         ;	
	reg [3:0]			prach_c_fft_size_2d            ; 
	reg [23:0]			prach_m_freq_offset_2d         ;	
	reg [3:0]			prach_m_fft_size_2d            ; 
	
    reg [7:0]  			prach_cfg_idx_1d			;
    reg [31:0]    		prach_cfg_time_idx_1d		;
    reg [31:0]  		n_prach_slot_1d		    	;
    reg [31:0] 			active_prach_slot_1d		;
    reg [31:0]    		prach_freq_idx_1d			;
    
    reg [7:0]  			prach_cfg_idx_2d			;
    reg [31:0]    		prach_cfg_time_idx_2d		;
    reg [31:0]  		n_prach_slot_2d		    	;
    reg [31:0] 			active_prach_slot_2d		;
    reg [31:0]    		prach_freq_idx_2d			;	
	
		 
	always @ (posedge clk_csr)
    begin : PIPE_DELAY
        if (rst_csr_n == 1'b0) 
        begin 
		    SF_1d 	<= 'd0	;
		    SF_2d 	<= 'd0	;
		    SF_3d 	<= 'd0	;
		    SF_4d 	<= 'd0	;	
		    c_m_plane_sel_1d			<= 'd0;
		    c_m_plane_sel_2d			<= 'd0;
			prach_cfg_idx_1d            <= 'd0;		
			prach_cfg_time_idx_1d	    <= 'd0;
			n_prach_slot_1d		        <= 'd0;
			active_prach_slot_1d	    <= 'd0;
			prach_freq_idx_1d		    <= 'd0;
			prach_c_freq_offset_1d      <= 'd0;
			prach_c_fft_size_1d         <= 'd0;
			prach_m_freq_offset_1d      <= 'd0;
			prach_m_fft_size_1d         <= 'd0;
			prach_c_freq_offset_2d      <= 'd0;
			prach_c_fft_size_2d         <= 'd0;
			prach_m_freq_offset_2d      <= 'd0;
			prach_m_fft_size_2d         <= 'd0;
			prach_cfg_idx_2d		    <= 'd0;
			prach_cfg_time_idx_2d	    <= 'd0;
			n_prach_slot_2d		        <= 'd0;
			active_prach_slot_2d	    <= 'd0;
			prach_freq_idx_2d		    <= 'd0;
			ul_start_pulse_latch_1d		<= 'd0;
				
		end
		else
		begin
		    SF_1d 	<= SF		    ;
		    SF_2d 	<= SF_1d		;		   
		    SF_3d 	<= SF_2d		;		   
		    SF_4d 	<= SF_3d		;		   			
		    c_m_plane_sel_1d			<= c_m_plane_sel	;			
		    c_m_plane_sel_2d			<= c_m_plane_sel_1d	;
		    prach_cfg_idx_1d            <= prach_cfg_idx        ;		
			prach_cfg_time_idx_1d	    <= prach_cfg_time_idx	;
			n_prach_slot_1d		        <= n_prach_slot		    ;
			active_prach_slot_1d	    <= active_prach_slot	;
			prach_freq_idx_1d		    <= prach_freq_idx		;
			prach_c_freq_offset_1d      <= prach_c_freq_offset  ;
			prach_c_fft_size_1d         <= prach_c_fft_size     ;
			prach_m_freq_offset_1d      <= prach_m_freq_offset  ;
			prach_m_fft_size_1d         <= prach_m_fft_size     ;
			prach_c_freq_offset_2d      <= prach_c_freq_offset_1d  ;
			prach_c_fft_size_2d         <= prach_c_fft_size_1d     ;
			prach_m_freq_offset_2d      <= prach_m_freq_offset_1d  ;
			prach_m_fft_size_2d         <= prach_m_fft_size_1d     ;
			prach_cfg_idx_2d		    <= prach_cfg_idx_1d			;
			prach_cfg_time_idx_2d	    <= prach_cfg_time_idx_1d	;
			n_prach_slot_2d		        <= n_prach_slot_1d		    ;
			active_prach_slot_2d	    <= active_prach_slot_1d		;
			prach_freq_idx_2d		    <= prach_freq_idx_1d		;
			ul_start_pulse_latch_1d		<= ul_start_pulse_latch		;
		   
		end
	end
	assign ul_start_pos = ul_start_pulse_latch & ~ul_start_pulse_latch_1d;
	assign SF_Change_detect = (SF_4d ^ SF_3d) | ul_start_pos;
	
	always @ (posedge clk_csr)
	begin
		if (~rst_csr_n) 
			state   <=  IDLE  ; 
		else
			case (state)
			IDLE: // read complete as valid in //0
				begin 
					if(SF_Change_detect)   
						state <= ST0;
					else
						state <= IDLE;
				end
			
			ST0:  //1
				begin 
					if(~lw_bridge_waitrequest)
						state <= ST1;
					else
						state <= ST0;
				end	
				
			ST1:  
				begin 
					if(~lw_bridge_waitrequest)
						state <= ST2;
					else
						state <= ST1;			   
				end	
			
			ST2:  
				begin 
					if(~lw_bridge_waitrequest)								
						state <= ST3;
						
					else
						state <= ST2;	
				end	
			
			ST3:  
				begin 
					if(~lw_bridge_waitrequest)
						state <= ST4;				
					else
						state <= ST3;	
				end	
			
			ST4:  
				begin 
					if(~lw_bridge_waitrequest)					
						state <= ST5;				
					else
						state <= ST4;	
				end	
            ST5:  
				begin 
					if(~lw_bridge_waitrequest)					
						state <= ST6;				
					else
						state <= ST5;	
				end	
            ST6:  
				begin 
					if(~lw_bridge_waitrequest)					
						state <= ST7;				
					else
						state <= ST6;	
				end	
            ST7:  
				begin 
					if(~lw_bridge_waitrequest)					
						state <= IDLE;				
					else
						state <= ST7;	
				end					
		
			default  :   //4                                
				begin 
					state <= state;
				end
			endcase
	end
  
  
	always @ (posedge clk_csr)
	begin
		if (~rst_csr_n) 	 
			begin	
				lw_bridge_write   	<= 'b0;
				lw_bridge_address 	<= 'd0;
				lw_bridge_writedata 	<= 'd0;
				lw_bridge_read 		<= 'b0;
			end
		else 
			begin
			case (state)
			IDLE: 
				begin 
					lw_bridge_write   		<= 'b0;
					lw_bridge_address 		<= 'd0;
					lw_bridge_writedata   	<= 'd0;	
					lw_bridge_read 			<= 'b0;			
				end	
			
			ST1:                                                            
	        begin : FFT_SIZE                                                
		    if( ~lw_bridge_waitrequest )                                    
			begin                                                           
				lw_bridge_write   	<= 'b1;                                
	 			lw_bridge_address 	<= 'd12 ;
                if(c_m_plane_sel_2d)				
				 lw_bridge_writedata	<= {28'b0,prach_m_fft_size_2d};  
                else
                 lw_bridge_writedata	<= {28'b0,prach_c_fft_size_2d};				
				lw_bridge_read <= 'b0;                                     
            end					                                            
			else
			begin
				lw_bridge_write   <= 'b0; 
			end
			end	
	
	        ST2:  
			begin : RB_OFFSET
			if( ~lw_bridge_waitrequest )
			begin 
				lw_bridge_write   	<= 'b1;
	 			lw_bridge_address 	<= 'd13 ;
				if(c_m_plane_sel_2d)
				 lw_bridge_writedata	<= {8'b0,prach_m_freq_offset_2d};
				else
				 lw_bridge_writedata	<= {8'b0,prach_c_freq_offset_2d};
				lw_bridge_read 		<= 'b0;
            end					                                                  
			else
			begin
				lw_bridge_write   <= 'b0; 
	 			
			end
			end	
		  
			ST3:  
			begin : CFG_IDX
			if( ~lw_bridge_waitrequest )
			begin 
				lw_bridge_write   	<= 'b1;
	 			lw_bridge_address 	<= 'd8 ;
				lw_bridge_writedata	<= {24'b0, prach_cfg_idx_2d};                            	 
				lw_bridge_read <= 'b0;                                              
				                                                                    	
            end					                                                     
			else                                                                    
			begin
				lw_bridge_write   <= 'b0; 	 		
			end
			end	
		  
			ST4:  
			begin : CFG_TIME_IDX
			if( ~lw_bridge_waitrequest )
			begin 
				lw_bridge_write   	<= 'b1;
	 			lw_bridge_address 	<= 'd9 ;
				lw_bridge_writedata	<= prach_cfg_time_idx_2d;
				lw_bridge_read <= 'b0;
            end					 
			else
			begin
				lw_bridge_write   <= 'b0; 
			end
			end		
		  
			ST5:  
			begin : N_PRACH_SLOT
			if( ~lw_bridge_waitrequest)
			begin 
				lw_bridge_write   	<= 'b1;
	 			lw_bridge_address 	<= 'd10 ;
				lw_bridge_writedata	<= n_prach_slot_2d;
				lw_bridge_read <= 'b0;
            end					 
			else
			begin
				lw_bridge_write   <= 'b0; 
			end
			end	
		  
			ST6:  
			begin : ACTIVE_PRACH_SLOT
			if( ~lw_bridge_waitrequest)
			begin 
				lw_bridge_write   	<= 'b1;
	 			lw_bridge_address 	<= 'd11 ;
				lw_bridge_writedata	<= active_prach_slot_2d;
				lw_bridge_read <= 'b0;
            end					 
			else
			begin
				lw_bridge_write   <= 'b0; 
			end
			end	

			ST7:  
			begin : FREQ_IDX
			if( ~lw_bridge_waitrequest)
			begin 
				lw_bridge_write   	<= 'b1;
	 			lw_bridge_address 	<= 'd14 ;
				lw_bridge_writedata	<= prach_freq_idx_2d;
				lw_bridge_read <= 'b0;
            end					 
			else
			begin
				lw_bridge_write   <= 'b0; 
			end
			end	
		
			default  :                                  
				begin 
					lw_bridge_write   	<= 'b0	;
					lw_bridge_address 	<= 'd0 	;
					lw_bridge_writedata <= 'd0	;	
					lw_bridge_read 		<= 'b0	;
				end	  
			
			endcase
			end
	end
	
endmodule
