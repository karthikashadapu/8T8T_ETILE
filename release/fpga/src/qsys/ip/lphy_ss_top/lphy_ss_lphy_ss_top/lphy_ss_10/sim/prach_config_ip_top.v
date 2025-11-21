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

// ================================================================================ 
// File:        prach_config_ip_top.v
// Author:      Boobathi Selvaraj
// Description: This IP basically used to configure the Long Format PRACH IP 
//              It decodes the incoming Sec Type 3 C plane packet from ORAN IP and M plane packets from HPS and Configures the PRACH IP 
// ================================================================================ 

`timescale 1ns/1ns
 
module prach_config_ip_top
(
    clk_eth                       		,
    rst_eth_n                        	,	
 
    clk_csr                       		,
    rst_csr_n                     		,
	
	clk_dsp                      		,
    rst_dsp_n                     		,
	
	// Stream Input 
    avst_sink_c_valid                   ,      // From ORAN IP  
    avst_sink_c_endofpacket             ,
    avst_sink_c_startofpacket           ,
	
	// C plane conduits data               // From ORAN IP
    rx_c_rtc_id                         , //rx_c_rtc_id eAxC Number from rx_c_rtc_id of eCPRI IP. RU Port ID is considered as eAxC ID.     	
	rx_c_dataDirection                  ,              
	rx_sectionType						, 
	rx_c_startsymbolid					,
	rx_c_subframeId  					,
	rx_c_num_symbol						,
	rx_c_slotid							,
	rx_c_frameid						,

    rx_timeOffset                       ,   // From ORAN IP
    rx_cpLength        					,
    rx_frequencyOffset	                ,
	rx_frameStructure                   ,
	
	cpLength_11                         , //decoded from C plane. Input to PRACH IP 
	cpLength_12							,
	
	timeOffset_11                       , //decoded from C plane. Input to PRACH IP 
	timeOffset_12						,
	
	start_sym_11						,//decoded from C plane. Input to PRACH IP 	
	start_sym_12						,	
	
	subframeId_11						,//decoded from C plane. Input to PRACH IP 	
	subframeId_12						,

	num_symbol_11						,
	num_symbol_12						,
	
	slot_id_l1							,
	slot_id_l2							,
	frame_id_l1							,
	frame_id_l2							,

	hps_lw_bridge_readdata_l1  			, // Connect to HPS
	hps_lw_bridge_writedata_l1 			,
	hps_lw_bridge_address_l1   			,
	hps_lw_bridge_readdatavalid_l1      ,
	hps_lw_bridge_read_l1               ,
	hps_lw_bridge_write_l1     			,
	hps_lw_bridge_waitrequest_l1		,
	
	
	hps_lw_bridge_readdata_l2  			,// Connect to HPS
	hps_lw_bridge_writedata_l2 			,
	hps_lw_bridge_address_l2   			,
	hps_lw_bridge_readdatavalid_l2      ,
	hps_lw_bridge_read_l2               ,
	hps_lw_bridge_write_l2     			,
	hps_lw_bridge_waitrequest_l2		,
	

	prach_tech_l1						,// Decoded from M plane. Input to PRACH IP 
	long_prach_cfg_index_l1				,
		
	prach_tech_l2						,// Decoded from M plane. Input to PRACH IP
	long_prach_cfg_index_l2				,
	
	gain_re_l1							,
	gain_im_l1							,
	gain_re_l2							,
	gain_im_l2							,
	sp_gain_re_l1						,	
	sp_gain_im_l1                       ,
	sp_gain_re_l2                       ,
	sp_gain_im_l2                       ,

	prach_lw_bridge_readdata_l1  		,// Connect to PRACH IP
	prach_lw_bridge_writedata_l1 		,
	prach_lw_bridge_address_l1   		,
	prach_lw_bridge_write_l1     		,
	prach_lw_bridge_read_l1	,
	prach_lw_bridge_readdatavalid_l1	,
	prach_lw_bridge_waitrequest_l1		,
	
	prach_lw_bridge_readdata_l2  		,// Connect to PRACH IP
	prach_lw_bridge_writedata_l2 		,
	prach_lw_bridge_address_l2   		,
	prach_lw_bridge_read_l2     		,
	prach_lw_bridge_write_l2     		,
	prach_lw_bridge_readdatavalid_l2	,
	prach_lw_bridge_waitrequest_l2		,	
	
	SF_Number			            		, // SF number from UL scheduler
	c_m_plane_sel							,// C or M plane. C = 0, M = 1
	short_prach_m_freqoff_ul                ,
    short_prach_m_fft_size_ul				,
	ul_start_pulse_latch		
);

  `include "../common/def_param.vh"

	input                   clk_eth         ;
	input                   rst_eth_n       ;
	
	input                   clk_csr         ;
	input                   rst_csr_n       ;
	
	input                   clk_dsp         ;
	input                   rst_dsp_n       ;
	
	
	// Stream input
	input              avst_sink_c_valid                ;
	input              avst_sink_c_endofpacket          ;
	input              avst_sink_c_startofpacket        ;
	
	// C plane conduits data 
	
	input wire [7:0]   rx_c_rtc_id                      ;
	input wire         rx_c_dataDirection               ;
	input wire [7:0]   rx_sectionType                   ;
	input wire [5:0]   rx_c_startsymbolid               ;
	input wire [3:0]   rx_c_subframeId				    ;
	input wire [3:0]	rx_c_num_symbol					;
	input wire [5:0]	rx_c_slotid						;
	input wire [7:0]	rx_c_frameid					;	
	
	input wire [15:0]   rx_timeOffset                   ;
	input wire [15:0]   rx_cpLength                     ;
	input wire [23:0]   rx_frequencyOffset              ;
	input wire [7:0 ]   rx_frameStructure               ;
	
	output wire [15:0]   timeOffset_11                   ;
	output wire [15:0]   timeOffset_12					 ;
	output wire [15:0]   cpLength_11                     ;
	output wire [15:0]   cpLength_12                     ;
	output wire [5:0]   start_sym_11                     ;
	output wire [5:0]   start_sym_12                     ;
	output wire [3:0]   subframeId_11                     ;
	output wire [3:0]   subframeId_12                     ;
	
	output wire [3:0]   num_symbol_11                     ;
	output wire [3:0]   num_symbol_12                     ;
	
	output wire [5:0]   slot_id_l1                     ;
	output wire [5:0]   slot_id_l2                     ;
	output wire [7:0]	frame_id_l1						;
	output wire [7:0]	frame_id_l2						;
	
	// Light Weight Configuration 
	input  [3:0]        	hps_lw_bridge_address_l1  	;
	input            		hps_lw_bridge_write_l1    	;    
	output [31:0]    		hps_lw_bridge_readdata_l1 	;
	input  [31:0]    		hps_lw_bridge_writedata_l1	;
	output					hps_lw_bridge_waitrequest_l1;
	output					hps_lw_bridge_readdatavalid_l1;
	input                   hps_lw_bridge_read_l1        ;
							
	input  [3:0]     		hps_lw_bridge_address_l2  	;
	input            		hps_lw_bridge_write_l2    	;    
	output [31:0]    		hps_lw_bridge_readdata_l2 	;
	input  [31:0]    		hps_lw_bridge_writedata_l2	;
	output					hps_lw_bridge_waitrequest_l2;
	output					hps_lw_bridge_readdatavalid_l2;
	input                   hps_lw_bridge_read_l2        ;
	
	
	output					prach_tech_l1				;
	output	[15:0]			long_prach_cfg_index_l1		;     
	
	output					prach_tech_l2				;
	output	[15:0]			long_prach_cfg_index_l2		; 
	
	output	wire [15:0]			gain_re_l1					;	
	output	wire [15:0]			gain_im_l1					;	
	output	wire [15:0]			gain_re_l2					;	
	output	wire [15:0]			gain_im_l2					;	
	
	output	wire [15:0]			sp_gain_re_l1					;	
	output	wire [15:0]			sp_gain_im_l1					;	
	output	wire [15:0]			sp_gain_re_l2					;	
	output	wire [15:0]			sp_gain_im_l2					;	
	
	// Light Weight Configuration 
	output [3:0]      	prach_lw_bridge_address_l1    		;
	output            	prach_lw_bridge_write_l1      		;
	output            	prach_lw_bridge_read_l1      		;
	input  [31:0]     	prach_lw_bridge_readdata_l1   		;
	output [31:0]     	prach_lw_bridge_writedata_l1  		;
	input             	prach_lw_bridge_waitrequest_l1		;
	input             	prach_lw_bridge_readdatavalid_l1	;

	// Light Weight Configuration 
	output [3:0]      	prach_lw_bridge_address_l2    		;
	output            	prach_lw_bridge_write_l2      		;	
	output            	prach_lw_bridge_read_l2       		;
	input  [31:0]     	prach_lw_bridge_readdata_l2   		;
	output [31:0]     	prach_lw_bridge_writedata_l2  		;
	input             	prach_lw_bridge_waitrequest_l2		;
	input             	prach_lw_bridge_readdatavalid_l2	;

	input	[3:0]		SF_Number						;
	input				c_m_plane_sel					;
	
	input [23:0]short_prach_m_freqoff_ul   ;
    input [3:0] short_prach_m_fft_size_ul  ;
	input wire ul_start_pulse_latch;
	
	wire [29:0]	prach_nco_ant0_l1					;
	wire [29:0]	prach_nco_ant1_l1					;
	wire [29:0]	prach_nco_ant2_l1					;
	wire [29:0]	prach_nco_ant3_l1					;
	wire [29:0]	prach_nco_ant0_l2					;
	wire [29:0]	prach_nco_ant1_l2					;
	wire [29:0]	prach_nco_ant2_l2					;
	wire [29:0]	prach_nco_ant3_l2					;	
	
	wire signed  [31:0]	frequencyOffset_ant0_l1					;
	wire signed  [31:0]	frequencyOffset_ant0_l2					;
	wire signed  [31:0]	frequencyOffset_ant1_l1					;
	wire signed  [31:0]	frequencyOffset_ant1_l2					;
	wire signed  [31:0]	frequencyOffset_ant2_l1					;
	wire signed  [31:0]	frequencyOffset_ant2_l2					;
	wire signed  [31:0]	frequencyOffset_ant3_l1					;
	wire signed  [31:0]	frequencyOffset_ant3_l2					;	
	
	wire signed  [31:0]	nco_offset_l1					;	
	wire signed  [31:0]	nco_offset_l2					;

    wire [7:0]  	sprach_cfg_idx_l1			;
    wire [31:0]    	sprach_cfg_time_idx_l1		;
    wire [31:0]  	n_sprach_slot_l1				;
    wire [31:0] 	active_sprach_slot_l1		;
    wire [31:0]    	sprach_freq_idx_l1			;
    
    wire [7:0]     	sprach_cfg_idx_l2			;
    wire [31:0]    	sprach_cfg_time_idx_l2		;
    wire [31:0]    	n_sprach_slot_l2			;
    wire [31:0] 	active_sprach_slot_l2		;
    wire [31:0] 	sprach_freq_idx_l2			;	
	
    wire [7:0]frameStructure_11 ;
    wire [7:0]frameStructure_12 ;
	wire [23:0] short_prach_rboffset;
	
	
short_long_prach_config_wrapper u_short_long_prach_config_wrapper(
		// Light Weight clock
		.clk_csr                   	(clk_csr  					),
		.rst_csr_n                 	(rst_csr_n					),
		
		// HPS Interface	
		.lw_bridge_waitrequest_l1  	(prach_lw_bridge_waitrequest_l1  	),
		.lw_bridge_readdata_l1     	(prach_lw_bridge_readdata_l1       ),
		.lw_bridge_writedata_l1    	(prach_lw_bridge_writedata_l1    	), // Write into PRACH IP
		.lw_bridge_address_l1      	(prach_lw_bridge_address_l1      	),
		.lw_bridge_write_l1        	(prach_lw_bridge_write_l1        	),
		.lw_bridge_read_l1         	(prach_lw_bridge_read_l1         	),
		.lw_bridge_readdatavalid_l1	(prach_lw_bridge_readdatavalid_l1	),
		
		.lw_bridge_waitrequest_l2  	(prach_lw_bridge_waitrequest_l2  	),
		.lw_bridge_readdata_l2     	(prach_lw_bridge_readdata_l2       ),
		.lw_bridge_writedata_l2    	(prach_lw_bridge_writedata_l2    	),// Write into PRACH IP
		.lw_bridge_address_l2      	(prach_lw_bridge_address_l2      	),
		.lw_bridge_write_l2        	(prach_lw_bridge_write_l2        	),
		.lw_bridge_read_l2         	(prach_lw_bridge_read_l2         	),
		.lw_bridge_readdatavalid_l2	(prach_lw_bridge_readdatavalid_l2	),
		
		.SF       				    (SF_Number[0] 			 	),
		.c_m_plane_sel			    (c_m_plane_sel	 		    ),
		
		.prach_nco_ant0_l1		    ({2'b0,prach_nco_ant0_l1}    ), // NCO from HPS
		.prach_nco_ant1_l1		    ({2'b0,prach_nco_ant1_l1}    ),
		.prach_nco_ant2_l1		    ({2'b0,prach_nco_ant2_l1}    ),
		.prach_nco_ant3_l1		    ({2'b0,prach_nco_ant3_l1}    ),
		.prach_nco_ant0_l2		    ({2'b0,prach_nco_ant0_l2}    ),
		.prach_nco_ant1_l2		    ({2'b0,prach_nco_ant1_l2}    ),
		.prach_nco_ant2_l2		    ({2'b0,prach_nco_ant2_l2}    ),
		.prach_nco_ant3_l2		    ({2'b0,prach_nco_ant3_l2}    ),
		
		.frequencyOffset_ant0_l1	(frequencyOffset_ant0_l1           ), // NCO from CPLane
		.frequencyOffset_ant0_l2	(frequencyOffset_ant0_l2           ), 
		.frequencyOffset_ant1_l1	(frequencyOffset_ant1_l1           ), 
		.frequencyOffset_ant1_l2	(frequencyOffset_ant1_l2           ), 
		.frequencyOffset_ant2_l1	(frequencyOffset_ant2_l1           ), 
		.frequencyOffset_ant2_l2	(frequencyOffset_ant2_l2           ), 
		.frequencyOffset_ant3_l1	(frequencyOffset_ant3_l1           ), 
		.frequencyOffset_ant3_l2    (frequencyOffset_ant3_l2		   ),
        
		.sprach_c_freq_offset        (short_prach_rboffset),                        
		//.sprach_c_fft_size            (frameStructure_11[7:4]),
        .sprach_c_fft_size            ('d12),		
		.sprach_m_freq_offset         (short_prach_m_freqoff_ul ),                        
		.sprach_m_fft_size            (short_prach_m_fft_size_ul),                        
		.sprach_cfg_idx_l1		     (sprach_cfg_idx_l1),       
		.sprach_cfg_time_idx_l1	     (sprach_cfg_time_idx_l1),
		.n_sprach_slot_l1		     (n_sprach_slot_l1),
		.active_sprach_slot_l1	     (active_sprach_slot_l1),
		.sprach_freq_idx_l1		     (sprach_freq_idx_l1),
		.sprach_cfg_idx_l2 		     (sprach_cfg_idx_l2),     
		.sprach_cfg_time_idx_l2 	 (sprach_cfg_time_idx_l2),
		.n_sprach_slot_l2 		     (n_sprach_slot_l2),
		.active_sprach_slot_l2 	     (active_sprach_slot_l2),
		.sprach_freq_idx_l2 		 (sprach_freq_idx_l2),
		.ul_start_pulse_latch        (ul_start_pulse_latch)

		);
		

  `ifndef SHORT_PRACH_FORMAT
   
   Long_PRACH_Registers_L1 u_Long_PRACH_Registers_L1 (
	
   .long_prach1_nco_ant1_lprach1_nco_ant1(prach_nco_ant0_l1),                             
   .long_prach1_nco_ant2_lprach1_nco_ant2(prach_nco_ant1_l1),                                          
   .long_prach1_nco_ant3_lprach1_nco_ant3(prach_nco_ant2_l1),  
   .long_prach1_nco_ant4_lprach1_nco_ant4(prach_nco_ant3_l1),   
   .long_prach1_technology_l1_prach_technology(prach_tech_l1),  
   .long_prach1_cfg_index_lprach1_cfg_index(long_prach_cfg_index_l1),  
   .long_prach1_nco_offset_lprach1_nco_offset(nco_offset_l1),  
   .long_prach1_gain_real_gain_real_l1(gain_re_l1),
   .long_prach1_gain_imag_gain_imag_l1(gain_im_l1),
   .clk(clk_csr),
   .reset(~rst_csr_n),
   .writedata(hps_lw_bridge_writedata_l1),
   .read(hps_lw_bridge_read_l1),
   .write(hps_lw_bridge_write_l1),
   .byteenable(4'b1111),
   .readdata(hps_lw_bridge_readdata_l1),
   .readdatavalid(hps_lw_bridge_readdatavalid_l1),
   .address({hps_lw_bridge_address_l1,2'b0}) 
  );
  
  Long_PRACH_Registers_L2 u_Long_PRACH_Registers_L2 (
	
   .long_prach2_nco_ant1_lprach2_nco_ant1(prach_nco_ant0_l2),                             
   .long_prach2_nco_ant2_lprach2_nco_ant2(prach_nco_ant1_l2),                                          
   .long_prach2_nco_ant3_lprach2_nco_ant3(prach_nco_ant2_l2),  
   .long_prach2_nco_ant4_lprach2_nco_ant4(prach_nco_ant3_l2),   
   .long_prach2_technology_l2_prach_technology(prach_tech_l2),  
   .long_prach2_cfg_index_lprach2_cfg_index(long_prach_cfg_index_l2),  
   .long_prach2_nco_offset_lprach2_nco_offset(nco_offset_l2),  
   .long_prach2_gain_real_gain_real_l2(gain_re_l2),
   .long_prach2_gain_imag_gain_imag_l2(gain_im_l2),
   .clk(clk_csr),
   .reset(~rst_csr_n),
   .writedata(hps_lw_bridge_writedata_l2),
   .read(hps_lw_bridge_read_l2),
   .write(hps_lw_bridge_write_l2),
   .byteenable(4'b1111),
   .readdata(hps_lw_bridge_readdata_l2),
   .readdatavalid(hps_lw_bridge_readdatavalid_l2),
   .address({hps_lw_bridge_address_l2,2'b0}) 
  );

  `else
  
  Short_PRACH_Registers_L1 u_Short_PRACH_Registers_L1 (
	
	
    .short_Prach1_cfg_index_sprach1_cfg_index(sprach_cfg_idx_l1),
    .short_Prach1_cfg_time_index_sprach1_cfg_time_index(sprach_cfg_time_idx_l1),
    .n_short_prach1_slot_n_sprach1_slot(n_sprach_slot_l1),
    .active_short_prach1_slot_active_sprach1_slot(active_sprach_slot_l1),
    .short_prach1_freq_idx_sprach1_freq_idx(sprach_freq_idx_l1),
	.short_prach1_gain_real_sp_gain_real_l1(sp_gain_re_l1),
	.short_prach1_gain_imag_sp_gain_imag_l1(sp_gain_im_l1),
    .clk(clk_csr),
    .reset(~rst_csr_n),
    .writedata(hps_lw_bridge_writedata_l1),
    .read(hps_lw_bridge_read_l1),
    .write(hps_lw_bridge_write_l1),
    .byteenable(4'b1111),
    .readdata(hps_lw_bridge_readdata_l1),
    .readdatavalid(hps_lw_bridge_readdatavalid_l1),
    .address({hps_lw_bridge_address_l1,2'b0})   
	                                      
	); 
    
    Short_PRACH_Registers_L2 u_Short_PRACH_Registers_L2 (
	
	
    .short_Prach2_cfg_index_sprach2_cfg_index(sprach_cfg_idx_l2),
    .short_Prach2_cfg_time_index_sprach2_cfg_time_index(sprach_cfg_time_idx_l2),
    .n_short_prach2_slot_n_sprach2_slot(n_sprach_slot_l2),
    .active_short_prach2_slot_active_sprach2_slot(active_sprach_slot_l2),
    .short_prach2_freq_idx_sprach2_freq_idx(sprach_freq_idx_l2),
	.short_prach2_gain_real_sp_gain_real_l2(sp_gain_re_l2),
	.short_prach2_gain_imag_sp_gain_imag_l2(sp_gain_im_l2),
    .clk(clk_csr),
    .reset(~rst_csr_n),
    .writedata(hps_lw_bridge_writedata_l2),
    .read(hps_lw_bridge_read_l2),
    .write(hps_lw_bridge_write_l2),
    .byteenable(4'b1111),
    .readdata(hps_lw_bridge_readdata_l2),
    .readdatavalid(hps_lw_bridge_readdatavalid_l2),
    .address({hps_lw_bridge_address_l2,2'b0})   
	                                      
	);

  `endif	

   prach_cplane_decode u_prach_cplane_decode(

    .clk_eth                            (clk_eth                   ),
    .rst_eth_n                          (rst_eth_n                 ),
	
	.clk_csr                	        (clk_csr  					),
	.rst_csr_n              	        (rst_csr_n					),
								        
	.clk_dsp                	        (clk_dsp  					),
	.rst_dsp_n              	        (rst_dsp_n					),
	
    .avst_sink_c_valid                  (avst_sink_c_valid         ), 
    .avst_sink_c_endofpacket            (avst_sink_c_endofpacket   ),
    .avst_sink_c_startofpacket          (avst_sink_c_startofpacket ),
	
    .rx_c_rtc_id                        (rx_c_rtc_id               ), 
	.rx_c_dataDirection                 (rx_c_dataDirection        ), 
	.rx_sectionType						(rx_sectionType			   ), 
	.rx_c_startsymbolid					(rx_c_startsymbolid		   ),
	.rx_c_subframeId					(rx_c_subframeId		   ),
	.rx_c_num_symbol					(rx_c_num_symbol			),
	.rx_c_slotid						(rx_c_slotid				),
	.rx_c_frameid						(rx_c_frameid				),
	
    .rx_timeOffset                      (rx_timeOffset             ),
    .rx_cpLength        			    (rx_cpLength        	   ),
    .rx_frequencyOffset	                (rx_frequencyOffset	       ),
	.rx_frameStructure                  (rx_frameStructure		   ),
 
	
	.frequencyOffset_ant0_l1_out       (frequencyOffset_ant0_l1      ), 
	.frequencyOffset_ant0_l2_out       (frequencyOffset_ant0_l2      ),
	.frequencyOffset_ant1_l1_out       (frequencyOffset_ant1_l1      ),
	.frequencyOffset_ant1_l2_out       (frequencyOffset_ant1_l2      ),
	.frequencyOffset_ant2_l1_out       (frequencyOffset_ant2_l1      ),
	.frequencyOffset_ant2_l2_out       (frequencyOffset_ant2_l2      ),
	.frequencyOffset_ant3_l1_out       (frequencyOffset_ant3_l1      ),
	.frequencyOffset_ant3_l2_out       (frequencyOffset_ant3_l2      ),
	.frameStructure_11                 (frameStructure_11            ), 
	.frameStructure_12                 (frameStructure_12            ), 
	.cpLength_11_2d                     (cpLength_11               ),
	.cpLength_12_2d						(cpLength_12			   ),
	.timeOffset_11_2d                   (timeOffset_11             ),
	.timeOffset_12_2d                   (timeOffset_12             ),
	.nco_offset_l1	                	(nco_offset_l1      	   ),
	.nco_offset_l2	                	(nco_offset_l2      	   ),
	.start_sym_11_2d	                (start_sym_11      		   ),
	.start_sym_12_2d	                (start_sym_12      		   ),
	.subframeId_11_2d	                (subframeId_11     		   ),
	.subframeId_12_2d	                (subframeId_12     		   ),
	.short_prach_rboffset               (short_prach_rboffset      ),
	.num_symbol_11_2d					(num_symbol_11),
	.num_symbol_12_2d                   (num_symbol_12),
	.slot_id_l1_2d	                    (slot_id_l1),
	.slot_id_l2_2d                      (slot_id_l2),
	.frame_id_l1_2d						(frame_id_l1),
	.frame_id_l2_2d						(frame_id_l2)
	
);	

endmodule
