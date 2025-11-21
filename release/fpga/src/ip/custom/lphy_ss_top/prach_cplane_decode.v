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
// File:        prach_cplane_fdv_buffer.v
// Author:      Boobathi Selvaraj
// Description: Sub block of PRACH Config IP
 
//              Decodes the incoming Sec Type 3 C plane packet and extracts the CPlength and Time offset and Frequency offset
//				It outputs the Frequency offset for all 8 antenna and CPlength and Timeoffset for link1(Anx 0 to 3) and link2 (Axc 4 to 7)
 
// ================================================================================ 

`timescale 1ns/1ns
module prach_cplane_decode
(
    clk_eth                             ,
    rst_eth_n                           ,
	clk_csr   				            ,
	rst_csr_n                           ,
	clk_dsp                             ,
	rst_dsp_n                           ,
 
    // Stream Input 
    avst_sink_c_valid                   ,        
    avst_sink_c_endofpacket             ,
    avst_sink_c_startofpacket           ,
	// C plane conduits data
    rx_c_rtc_id                         , //rx_c_rtc_id eAxC Number from rx_c_rtc_id of eCPRI IP. RU Port ID is considered as eAxC ID.     	
	rx_c_dataDirection                  ,              
	rx_sectionType						, 
	rx_c_startsymbolid					,
	rx_c_subframeId  					,
	rx_c_num_symbol						,
	rx_c_slotid							,
	rx_c_frameid						,
	
 
    rx_timeOffset                       ,
    rx_cpLength        					,
    rx_frequencyOffset	                ,
	rx_frameStructure                   ,
	frequencyOffset_ant0_l1_out            , 
	frequencyOffset_ant0_l2_out            ,
	frequencyOffset_ant1_l1_out            ,
	frequencyOffset_ant1_l2_out            ,
	frequencyOffset_ant2_l1_out            ,
	frequencyOffset_ant2_l2_out            ,
	frequencyOffset_ant3_l1_out            ,
	frequencyOffset_ant3_l2_out            ,
	cpLength_11_2d                      ,
	cpLength_12_2d						,	
	timeOffset_11_2d                    ,
	timeOffset_12_2d					,
	nco_offset_l1						,
	nco_offset_l2                       ,
	frameStructure_11                   , 
	frameStructure_12                   ,
	start_sym_11_2d						,
	start_sym_12_2d						,
	subframeId_11_2d					,
	subframeId_12_2d                    ,
	short_prach_rboffset				,
	num_symbol_11_2d					,
	num_symbol_12_2d					,
	slot_id_l1_2d						,
	slot_id_l2_2d						,
	frame_id_l1_2d						,
	frame_id_l2_2d
);
 
 
//NCO Value calculation
 
//frequency_offset from Cplane = freqOffset × f × 0.5
 
// (0.5*1.25*1000(KHz)*(2**30))/(122.88*1000000(MHZ))
 
// Final Constant multipler --> 5461.33333333*2^16
 
parameter Constant = 32'sh 1555_5555;// EAAAAAAB      ;
 
 
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
input wire [3:0]   rx_c_subframeId                  ;
input wire [3:0]   rx_c_num_symbol                  ;
input wire [5:0]   rx_c_slotid	                  ;
input wire [7:0]   rx_c_frameid						;					
 
input wire [15:0]   rx_timeOffset                   ;
input wire [15:0]   rx_cpLength                     ;
input signed [23:0]   rx_frequencyOffset              ;
input [7:0]           rx_frameStructure                  ;
 
output reg [15:0]   timeOffset_11_2d                   ;
output reg [15:0]   timeOffset_12_2d				   ;
output reg [15:0]   cpLength_11_2d                     ;
output reg [15:0]   cpLength_12_2d                     ;
output reg [5:0]   start_sym_11_2d                     ;
output reg [5:0]   start_sym_12_2d                     ;
output reg [3:0]   subframeId_11_2d                     ;
output reg [3:0]   subframeId_12_2d                     ;
output reg [3:0]   num_symbol_11_2d                     ;
output reg [3:0]   num_symbol_12_2d                     ;
output reg [5:0]   slot_id_l1_2d                    	;
output reg [5:0]   slot_id_l2_2d                     	;
output reg [7:0]   frame_id_l1_2d                    	;
output reg [7:0]   frame_id_l2_2d                     	;
output reg [7:0] frameStructure_11  					;
output reg [7:0] frameStructure_12  					;
 
output signed  [31:0]   frequencyOffset_ant0_l1_out           ;
output signed  [31:0]   frequencyOffset_ant0_l2_out           ;
output signed  [31:0]   frequencyOffset_ant1_l1_out           ;
output signed  [31:0]   frequencyOffset_ant1_l2_out           ;
output signed  [31:0]   frequencyOffset_ant2_l1_out           ;
output signed  [31:0]   frequencyOffset_ant2_l2_out           ;
output signed  [31:0]   frequencyOffset_ant3_l1_out           ;
output signed  [31:0]   frequencyOffset_ant3_l2_out           ;
 
input  signed  [31:0]   nco_offset_l1           ;
input  signed  [31:0]   nco_offset_l2          ;

output [23:0]      short_prach_rboffset  ;

 
reg [15:0]   timeOffset_11_1d                   ;
reg [15:0]   timeOffset_12_1d					;
reg [15:0]   cpLength_11_1d                     ;
reg [15:0]   cpLength_12_1d                     ;
reg [15:0]   timeOffset_11                   ;
reg [15:0]   timeOffset_12					 ;
reg [15:0]   cpLength_11                     ;
reg [15:0]   cpLength_12                     ;
reg [5:0]    rx_c_startsymbolid_1d           ;
reg [3:0]    rx_c_subframeId_1d              ;
reg [5:0]    rx_c_slotid_1d           ;
reg [7:0]    rx_c_frameid_1d			;
reg [3:0]    rx_c_num_symbol_1d              ;
reg [5:0]   start_sym_11_1d                     ;
reg [5:0]   start_sym_12_1d                     ;
reg [5:0]   start_sym_11                     ;
reg [5:0]   start_sym_12                     ;

reg [5:0]   slot_id_l1_1d                     ;
reg [5:0]   slot_id_l2_1d                     ;
reg [5:0]   slot_id_l1                    ;
reg [5:0]   slot_id_l2                    ;

reg [7:0]   frame_id_l1_1d                     ;
reg [7:0]   frame_id_l2_1d                     ;
reg [7:0]   frame_id_l1                    ;
reg [7:0]   frame_id_l2                    ;

reg [3:0]   num_symbol_11_1d                     ;
reg [3:0]   num_symbol_12_1d                     ;
reg [3:0]   num_symbol_11                     ;
reg [3:0]   num_symbol_12                     ;

reg [3:0]   subframeId_11_1d                     ;
reg [3:0]   subframeId_12_1d                     ;
reg [3:0]   subframeId_11                     ;
reg [3:0]   subframeId_12                     ;
 
//internal signals
 
reg          avst_sink_c_valid_1d                 ;
reg          avst_sink_c_startofpacket_1d         ;
reg          avst_sink_c_valid_2d                 ;
reg          avst_sink_c_startofpacket_2d         ;
reg          avst_sink_c_valid_3d                 ;
reg          avst_sink_c_startofpacket_3d         ;
reg          avst_sink_c_valid_4d                 ;
reg          avst_sink_c_startofpacket_4d         ;
reg          avst_sink_c_valid_5d                 ;
reg          avst_sink_c_startofpacket_5d         ;
 
reg [7:0]    rx_c_rtc_id_1d                       ;
reg [15:0]   rx_timeOffset_1d                     ;
reg [15:0]   rx_cpLength_1d                       ;
reg signed [23:0]   rx_frequencyOffset_1d         ;
reg        [23:0]   rx_sp_c_rbOffset           	  ;
reg        [23:0]   rx_sp_c_rbOffset_1d           ;
reg        [23:0]   rx_sp_c_rbOffset_2d           ;
reg [7:0]           rx_frameStructure_1d          ; 
 
reg signed [63:0]   frequencyOffset_ant0_l1_mul            ;
reg signed [63:0]   frequencyOffset_ant0_l2_mul            ;
reg signed [63:0]   frequencyOffset_ant1_l1_mul            ;
reg signed [63:0]   frequencyOffset_ant1_l2_mul            ;
reg signed [63:0]   frequencyOffset_ant2_l1_mul            ;
reg signed [63:0]   frequencyOffset_ant2_l2_mul            ;
reg signed [63:0]   frequencyOffset_ant3_l1_mul            ;
reg signed [63:0]   frequencyOffset_ant3_l2_mul            ;
 
reg signed [23:0]   frequencyOffset_ant0_l1            ;
reg signed [23:0]   frequencyOffset_ant0_l2            ;
reg signed [23:0]   frequencyOffset_ant1_l1            ;
reg signed [23:0]   frequencyOffset_ant1_l2            ;
reg signed [23:0]   frequencyOffset_ant2_l1            ;
reg signed [23:0]   frequencyOffset_ant2_l2            ;
reg signed [23:0]   frequencyOffset_ant3_l1            ;
reg signed [23:0]   frequencyOffset_ant3_l2            ;	 
reg signed [23:0]   frequencyOffset_ant0_l1_1d             ;
reg signed [23:0]   frequencyOffset_ant0_l2_1d             ;
reg signed [23:0]   frequencyOffset_ant1_l1_1d             ;
reg signed [23:0]   frequencyOffset_ant1_l2_1d             ;
reg signed [23:0]   frequencyOffset_ant2_l1_1d             ;
reg signed [23:0]   frequencyOffset_ant2_l2_1d             ;
reg signed [23:0]   frequencyOffset_ant3_l1_1d             ;
reg signed [23:0]   frequencyOffset_ant3_l2_1d             ;
reg signed [23:0]   frequencyOffset_ant0_l1_2d             ;
reg signed [23:0]   frequencyOffset_ant0_l2_2d             ;
reg signed [23:0]   frequencyOffset_ant1_l1_2d             ;
reg signed [23:0]   frequencyOffset_ant1_l2_2d             ;
reg signed [23:0]   frequencyOffset_ant2_l1_2d             ;
reg signed [23:0]   frequencyOffset_ant2_l2_2d             ;
reg signed [23:0]   frequencyOffset_ant3_l1_2d             ;
reg signed [23:0]   frequencyOffset_ant3_l2_2d             ;
 
reg signed  [31:0]   frequencyOffset_ant0_l1_out           ;
reg signed  [31:0]   frequencyOffset_ant0_l2_out           ;
reg signed  [31:0]   frequencyOffset_ant1_l1_out           ;
reg signed  [31:0]   frequencyOffset_ant1_l2_out           ;
reg signed  [31:0]   frequencyOffset_ant2_l1_out           ;
reg signed  [31:0]   frequencyOffset_ant2_l2_out           ;
reg signed  [31:0]   frequencyOffset_ant3_l1_out           ;
reg signed  [31:0]   frequencyOffset_ant3_l2_out           ;
 
reg signed  [31:0]   frequencyOffset_ant0_l1_out_temp           ;
reg signed  [31:0]   frequencyOffset_ant0_l2_out_temp           ;
reg signed  [31:0]   frequencyOffset_ant1_l1_out_temp           ;
reg signed  [31:0]   frequencyOffset_ant1_l2_out_temp           ;
reg signed  [31:0]   frequencyOffset_ant2_l1_out_temp           ;
reg signed  [31:0]   frequencyOffset_ant2_l2_out_temp           ;
reg signed  [31:0]   frequencyOffset_ant3_l1_out_temp           ;
reg signed  [31:0]   frequencyOffset_ant3_l2_out_temp           ;


reg [7:0] frameStructure_11_1d  ;
reg [7:0] frameStructure_12_1d  ;
reg [7:0] frameStructure_11_2d  ;
reg [7:0] frameStructure_12_2d  ;
 
	always @ (posedge clk_eth  )
	begin : VALID_CPLANE_DETECT1
		if (rst_eth_n == 1'b0) 
		begin			
     		avst_sink_c_valid_1d           <=  'd0   ;
			avst_sink_c_startofpacket_1d   <=  'd0   ; 			
		end
		else if (avst_sink_c_valid & avst_sink_c_startofpacket & (rx_c_dataDirection == 'd0) & (rx_sectionType == 'd3) )
		begin						
			avst_sink_c_valid_1d           <=  avst_sink_c_valid           ;  			 
			avst_sink_c_startofpacket_1d   <=  avst_sink_c_startofpacket  ;  						
		end
		else
		begin						
			avst_sink_c_valid_1d           <=  'd0   ;
			avst_sink_c_startofpacket_1d   <=  'd0   ; 			
		end		
	end
	always @ (posedge clk_eth  )
	begin : REG_VALID_SOP
		if (rst_eth_n == 1'b0) 
		begin			
			avst_sink_c_valid_2d           <=  'd0  ;  			 
			avst_sink_c_startofpacket_2d   <=  'd0  ; 
			avst_sink_c_valid_3d           <=  'd0  ;  			 
			avst_sink_c_startofpacket_3d   <=  'd0  ;
			avst_sink_c_valid_4d           <=  'd0  ;  			 
			avst_sink_c_startofpacket_4d   <=  'd0  ; 
			avst_sink_c_valid_5d           <=  'd0  ;  			 
			avst_sink_c_startofpacket_5d   <=  'd0  ;				
		end
		else 
		begin						
			avst_sink_c_valid_2d           <=  avst_sink_c_valid_1d           ;  			 
			avst_sink_c_startofpacket_2d   <=  avst_sink_c_startofpacket_1d   ; 
			avst_sink_c_valid_3d           <=  avst_sink_c_valid_2d           ;  			 
			avst_sink_c_startofpacket_3d   <=  avst_sink_c_startofpacket_2d   ;	
			avst_sink_c_valid_4d           <=  avst_sink_c_valid_3d           ;  			 
			avst_sink_c_startofpacket_4d   <=  avst_sink_c_startofpacket_3d   ;
			avst_sink_c_valid_5d           <=  avst_sink_c_valid_4d           ;  			 
			avst_sink_c_startofpacket_5d   <=  avst_sink_c_startofpacket_4d   ;			
		end		
	end

    always @ (posedge clk_eth  )
	begin : VALID_CPLANE_DETECT2
		if (rst_eth_n == 1'b0) 
		begin						
			rx_c_rtc_id_1d             <=  'd0       ;			            
            rx_timeOffset_1d           <=  'd0		 ;						
            rx_cpLength_1d             <=  'd0	     ;								
            rx_frequencyOffset_1d      <= -'sd 78624 ; 			// fix here for testing -'sd 78624
			rx_frameStructure_1d       <=  'd192     ;  // fft size reset value 12 , rx_frameStructure[7:4]
			rx_c_startsymbolid_1d      <=  'd1 		  ;
			rx_c_subframeId_1d         <=  'd10		  ;
			rx_c_num_symbol_1d         <=  'd0	;
			rx_c_slotid_1d     	   	   <=  'd0	;
			rx_c_frameid_1d				<= 'd0 ;
			rx_sp_c_rbOffset 	   	   <=  'd0  ;
		end
		else if (avst_sink_c_valid & avst_sink_c_startofpacket & (rx_c_dataDirection == 'd0) & (rx_sectionType == 'd3) )
		begin												
			rx_c_rtc_id_1d             <=  rx_c_rtc_id                    ;			                       											
            rx_timeOffset_1d           <=  rx_timeOffset         		  ;						
            rx_cpLength_1d             <=  rx_cpLength          		  ;								
            rx_frequencyOffset_1d      <=  rx_frequencyOffset     		  ;	// fix here for testing -'sd 78624;  
			rx_frameStructure_1d       <=  rx_frameStructure              ;
			rx_c_startsymbolid_1d      <=  rx_c_startsymbolid			  ;
			rx_c_subframeId_1d     	   <=  rx_c_subframeId			 	  ;
			rx_c_num_symbol_1d         <=  rx_c_num_symbol			  ;
			rx_c_slotid_1d     	   	   <=  rx_c_slotid		 	  ;
			rx_c_frameid_1d				<= rx_c_frameid				;
			rx_sp_c_rbOffset <=    (rx_frequencyOffset + 3276 ) / (2 * 12 );
		end		
	end
	
	always @ (posedge clk_csr  )
	begin 
		if (rst_csr_n == 1'b0) 
		begin						
			rx_sp_c_rbOffset_1d 	   <=   'd0       ;
			rx_sp_c_rbOffset_2d 	   <=   'd0       ;
		end
		else 
		begin												
			rx_sp_c_rbOffset_1d 	   <=   rx_sp_c_rbOffset       	  ;
			rx_sp_c_rbOffset_2d 	   <=   rx_sp_c_rbOffset_1d       ;
		end		
	end
 
 assign short_prach_rboffset = rx_sp_c_rbOffset_2d   ;
 
 
// default value from Keysight ORAN Studio --> -78624
 
	always @ (posedge clk_eth  )
	begin : FREQ_OFFSET_DETECT_ETH
		if (rst_eth_n == 1'b0) 
		begin			
     		frequencyOffset_ant0_l1   <= -'sd 78624; 
            frequencyOffset_ant0_l2   <= -'sd 78624; 
            frequencyOffset_ant1_l1   <= -'sd 78624; 
            frequencyOffset_ant1_l2   <= -'sd 78624; 
            frequencyOffset_ant2_l1   <= -'sd 78624; 
            frequencyOffset_ant2_l2   <= -'sd 78624; 
            frequencyOffset_ant3_l1   <= -'sd 78624; 
            frequencyOffset_ant3_l2   <= -'sd 78624; 		
		end
		else if (avst_sink_c_valid_1d & avst_sink_c_startofpacket_1d  )
		begin												
			case(rx_c_rtc_id_1d)
				'd8:  frequencyOffset_ant0_l1   <= rx_frequencyOffset_1d ;
				'd9:  frequencyOffset_ant0_l2   <= rx_frequencyOffset_1d ;
				'd10: frequencyOffset_ant1_l1   <= rx_frequencyOffset_1d ;
				'd11: frequencyOffset_ant1_l2   <= rx_frequencyOffset_1d ;
				'd12: frequencyOffset_ant2_l1   <= rx_frequencyOffset_1d ;
				'd13: frequencyOffset_ant2_l2   <= rx_frequencyOffset_1d ;
				'd14: frequencyOffset_ant3_l1   <= rx_frequencyOffset_1d ;
				'd15: frequencyOffset_ant3_l2   <= rx_frequencyOffset_1d ;
				default: 
				begin			
					frequencyOffset_ant0_l1   <= frequencyOffset_ant0_l1; 
					frequencyOffset_ant0_l2   <= frequencyOffset_ant0_l2; 
					frequencyOffset_ant1_l1   <= frequencyOffset_ant1_l1; 
					frequencyOffset_ant1_l2   <= frequencyOffset_ant1_l2; 
					frequencyOffset_ant2_l1   <= frequencyOffset_ant2_l1; 
					frequencyOffset_ant2_l2   <= frequencyOffset_ant2_l2; 
					frequencyOffset_ant3_l1   <= frequencyOffset_ant3_l1; 
					frequencyOffset_ant3_l2   <= frequencyOffset_ant3_l2; 		
				end
			endcase	
		end	
	end	
	always @ (posedge clk_csr  )
	begin : FREQ_OFFSET_DETECT_CSR
		if (rst_csr_n == 1'b0) 
		begin			
     		frequencyOffset_ant0_l1_1d   <= -'sd 78624; 
            frequencyOffset_ant0_l2_1d   <= -'sd 78624; 
            frequencyOffset_ant1_l1_1d   <= -'sd 78624; 
            frequencyOffset_ant1_l2_1d   <= -'sd 78624; 
            frequencyOffset_ant2_l1_1d   <= -'sd 78624; 
            frequencyOffset_ant2_l2_1d   <= -'sd 78624; 
            frequencyOffset_ant3_l1_1d   <= -'sd 78624; 
            frequencyOffset_ant3_l2_1d   <= -'sd 78624; 
     		frequencyOffset_ant0_l1_2d   <= -'sd 78624; 
            frequencyOffset_ant0_l2_2d   <= -'sd 78624; 
            frequencyOffset_ant1_l1_2d   <= -'sd 78624; 
            frequencyOffset_ant1_l2_2d   <= -'sd 78624; 
            frequencyOffset_ant2_l1_2d   <= -'sd 78624; 
            frequencyOffset_ant2_l2_2d   <= -'sd 78624; 
            frequencyOffset_ant3_l1_2d   <= -'sd 78624; 
            frequencyOffset_ant3_l2_2d   <= -'sd 78624; 			
		end
		else 
		begin												
			frequencyOffset_ant0_l1_1d   <= frequencyOffset_ant0_l1 ;
			frequencyOffset_ant0_l2_1d   <= frequencyOffset_ant0_l2 ;
			frequencyOffset_ant1_l1_1d   <= frequencyOffset_ant1_l1 ;
			frequencyOffset_ant1_l2_1d   <= frequencyOffset_ant1_l2 ;
			frequencyOffset_ant2_l1_1d   <= frequencyOffset_ant2_l1 ;
			frequencyOffset_ant2_l2_1d   <= frequencyOffset_ant2_l2 ;
			frequencyOffset_ant3_l1_1d   <= frequencyOffset_ant3_l1 ;
			frequencyOffset_ant3_l2_1d   <= frequencyOffset_ant3_l2 ;
			frequencyOffset_ant0_l1_2d   <= frequencyOffset_ant0_l1_1d ;
			frequencyOffset_ant0_l2_2d   <= frequencyOffset_ant0_l2_1d ;
			frequencyOffset_ant1_l1_2d   <= frequencyOffset_ant1_l1_1d ;
			frequencyOffset_ant1_l2_2d   <= frequencyOffset_ant1_l2_1d ;
			frequencyOffset_ant2_l1_2d   <= frequencyOffset_ant2_l1_1d ;
			frequencyOffset_ant2_l2_2d   <= frequencyOffset_ant2_l2_1d ;
			frequencyOffset_ant3_l1_2d   <= frequencyOffset_ant3_l1_1d ;
			frequencyOffset_ant3_l2_2d   <= frequencyOffset_ant3_l2_1d ;				
		end	
	end
//	dec2hex(round(-5461.33333333*2^16*78624)) =  'FFFFE66800000011'

	always @ (posedge clk_csr  )
	begin : FREQ_OFFSET_MUL_CONST_CSR
		if (rst_csr_n == 1'b0) 
		begin			
     		frequencyOffset_ant0_l1_mul   <= 'sh 0; 
            frequencyOffset_ant0_l2_mul   <= 'sh 0; 
            frequencyOffset_ant1_l1_mul   <= 'sh 0; 
            frequencyOffset_ant1_l2_mul   <= 'sh 0; 
            frequencyOffset_ant2_l1_mul   <= 'sh 0; 
            frequencyOffset_ant2_l2_mul   <= 'sh 0; 
            frequencyOffset_ant3_l1_mul   <= 'sh 0; 
            frequencyOffset_ant3_l2_mul   <= 'sh 0; 		
		end
		else 
		begin												
			frequencyOffset_ant0_l1_mul   <= frequencyOffset_ant0_l1_2d * Constant ;
			frequencyOffset_ant0_l2_mul   <= frequencyOffset_ant0_l2_2d * Constant ;
			frequencyOffset_ant1_l1_mul   <= frequencyOffset_ant1_l1_2d * Constant ;
			frequencyOffset_ant1_l2_mul   <= frequencyOffset_ant1_l2_2d * Constant ;
			frequencyOffset_ant2_l1_mul   <= frequencyOffset_ant2_l1_2d * Constant ;
			frequencyOffset_ant2_l2_mul   <= frequencyOffset_ant2_l2_2d * Constant ;
			frequencyOffset_ant3_l1_mul   <= frequencyOffset_ant3_l1_2d * Constant ;
			frequencyOffset_ant3_l2_mul   <= frequencyOffset_ant3_l2_2d * Constant ;	
		end	
	end	
 
	always @ (posedge clk_csr  )
	begin : FREQ_OFFSET_TRUNCATE_CSR
		if (rst_csr_n == 1'b0) 
		begin			
			frequencyOffset_ant0_l1_out   <= 'sh 0;           // 'h FFFFE6680000 + 'h 470000('d 46530560;   
            frequencyOffset_ant0_l2_out   <= 'sh 0; 
            frequencyOffset_ant1_l1_out   <= 'sh 0; 
            frequencyOffset_ant1_l2_out   <= 'sh 0; 
            frequencyOffset_ant2_l1_out   <= 'sh 0; 
            frequencyOffset_ant2_l2_out   <= 'sh 0; 
            frequencyOffset_ant3_l1_out   <= 'sh 0; 
            frequencyOffset_ant3_l2_out   <= 'sh 0; 	


			frequencyOffset_ant0_l1_out_temp   <= 'sh 0;           
            frequencyOffset_ant0_l2_out_temp   <= 'sh 0; 
            frequencyOffset_ant1_l1_out_temp   <= 'sh 0; 
            frequencyOffset_ant1_l2_out_temp   <= 'sh 0; 
            frequencyOffset_ant2_l1_out_temp   <= 'sh 0; 
            frequencyOffset_ant2_l2_out_temp   <= 'sh 0; 
            frequencyOffset_ant3_l1_out_temp   <= 'sh 0; 
            frequencyOffset_ant3_l2_out_temp   <= 'sh 0; 			
		end
		else 
		begin												
			frequencyOffset_ant0_l1_out_temp   <= (frequencyOffset_ant0_l1_mul >> 'd16) + nco_offset_l1 ;
			frequencyOffset_ant0_l2_out_temp   <= (frequencyOffset_ant0_l2_mul >> 'd16) + nco_offset_l2 ;
			frequencyOffset_ant1_l1_out_temp   <= (frequencyOffset_ant1_l1_mul >> 'd16) + nco_offset_l1 ;
			frequencyOffset_ant1_l2_out_temp   <= (frequencyOffset_ant1_l2_mul >> 'd16) + nco_offset_l2 ;
			frequencyOffset_ant2_l1_out_temp   <= (frequencyOffset_ant2_l1_mul >> 'd16) + nco_offset_l1 ;
			frequencyOffset_ant2_l2_out_temp   <= (frequencyOffset_ant2_l2_mul >> 'd16) + nco_offset_l2 ;
			frequencyOffset_ant3_l1_out_temp   <= (frequencyOffset_ant3_l1_mul >> 'd16) + nco_offset_l1 ;
			frequencyOffset_ant3_l2_out_temp   <= (frequencyOffset_ant3_l2_mul >> 'd16) + nco_offset_l2 ;	

			frequencyOffset_ant0_l1_out   <= frequencyOffset_ant0_l1_out_temp * -1;
			frequencyOffset_ant0_l2_out   <= frequencyOffset_ant0_l2_out_temp * -1;
			frequencyOffset_ant1_l1_out   <= frequencyOffset_ant1_l1_out_temp * -1;
			frequencyOffset_ant1_l2_out   <= frequencyOffset_ant1_l2_out_temp * -1;
			frequencyOffset_ant2_l1_out   <= frequencyOffset_ant2_l1_out_temp * -1;
			frequencyOffset_ant2_l2_out   <= frequencyOffset_ant2_l2_out_temp * -1;
			frequencyOffset_ant3_l1_out   <= frequencyOffset_ant3_l1_out_temp * -1;
			frequencyOffset_ant3_l2_out   <= frequencyOffset_ant3_l2_out_temp * -1;


		end	
	end	
 
 
	always @ (posedge clk_eth  )
	begin : CPLENGTH_DETECT_ETH
		if (rst_eth_n == 1'b0) 
		begin			
     		cpLength_11   <= 'd0 ; 
            cpLength_12   <= 'd0 ;		
		end
		else if (avst_sink_c_valid_1d & avst_sink_c_startofpacket_1d  )
		begin												
			case(rx_c_rtc_id_1d)
				'd8:  cpLength_11   <= rx_cpLength_1d ;
				'd9:  cpLength_12   <= rx_cpLength_1d ;
				'd10: cpLength_11   <= rx_cpLength_1d ;
				'd11: cpLength_12   <= rx_cpLength_1d ;
				'd12: cpLength_11   <= rx_cpLength_1d ;
				'd13: cpLength_12   <= rx_cpLength_1d ;
				'd14: cpLength_11   <= rx_cpLength_1d ;
				'd15: cpLength_12   <= rx_cpLength_1d ;
				default: 
				begin			
					cpLength_11   <= cpLength_11;  
					cpLength_12   <= cpLength_12; 		
				end
			endcase	
		end	
	end	
	always @ (posedge clk_dsp  )
	begin : CPLENGTH_DETECT_DSP
		if (rst_dsp_n == 1'b0) 
		begin			
     		cpLength_11_1d   <= 'd0 ; 
            cpLength_12_1d   <= 'd0 ; 	
     		cpLength_11_2d   <= 'd0 ; 
            cpLength_12_2d   <= 'd0 ; 			
		end
		else 
		begin			
			cpLength_11_1d   <= cpLength_11 ;
			cpLength_12_1d   <= cpLength_12 ;
			cpLength_11_2d   <= cpLength_11_1d ;
			cpLength_12_2d   <= cpLength_12_1d ;
		end	
	end	
	
	always @ (posedge clk_eth  )
	begin : FRAMESTRUCT_DETECT_ETH
		if (rst_eth_n == 1'b0) 
		begin			
     		frameStructure_11   <= 'd192 ; 
            frameStructure_12   <= 'd192 ;		
		end
		else if (avst_sink_c_valid_1d & avst_sink_c_startofpacket_1d  )
		begin												
			case(rx_c_rtc_id_1d)
				'd8:  frameStructure_11   <= rx_frameStructure_1d ;
				'd9:  frameStructure_12   <= rx_frameStructure_1d ;
				'd10: frameStructure_11   <= rx_frameStructure_1d ;
				'd11: frameStructure_12   <= rx_frameStructure_1d ;
				'd12: frameStructure_11   <= rx_frameStructure_1d ;
				'd13: frameStructure_12   <= rx_frameStructure_1d ;
				'd14: frameStructure_11   <= rx_frameStructure_1d ;
				'd15: frameStructure_12   <= rx_frameStructure_1d ;
				default: 
				begin			
					frameStructure_11   <= frameStructure_11;  
					frameStructure_12   <= frameStructure_12; 		
				end
			endcase	
		end	
	end	
	always @ (posedge clk_dsp  )
	begin : FRAMESTRUCT_DETECT_DSP
		if (rst_dsp_n == 1'b0) 
		begin			
     		frameStructure_11_1d   <= 'd192 ; 
            frameStructure_12_1d   <= 'd192 ; 	
     		frameStructure_11_2d   <= 'd192 ; 
            frameStructure_12_2d   <= 'd192 ; 			
		end
		else 
		begin			
			frameStructure_11_1d   <= frameStructure_11 ;
			frameStructure_12_1d   <= frameStructure_12 ;
			frameStructure_11_2d   <= frameStructure_11_1d ;
			frameStructure_12_2d   <= frameStructure_12_1d ;
		end	
	end	
	
	always @ (posedge clk_eth  )
	begin : TIME_OFFSET_DETECT_ETH
		if (rst_eth_n == 1'b0) 
		begin			
			timeOffset_11   <= 'd3168 ;
			timeOffset_12   <= 'd3168 ;		
		end
		else if (avst_sink_c_valid_1d & avst_sink_c_startofpacket_1d  )
		begin												
			case(rx_c_rtc_id_1d)
				'd8:  timeOffset_11   <= rx_timeOffset_1d ;
				'd9:  timeOffset_12   <= rx_timeOffset_1d ;
				'd10: timeOffset_11   <= rx_timeOffset_1d ;
				'd11: timeOffset_12   <= rx_timeOffset_1d ;
				'd12: timeOffset_11   <= rx_timeOffset_1d ;
				'd13: timeOffset_12   <= rx_timeOffset_1d ;
				'd14: timeOffset_11   <= rx_timeOffset_1d ;
				'd15: timeOffset_12   <= rx_timeOffset_1d ;
				default: 
				begin			
					timeOffset_11   <= timeOffset_11 ;
					timeOffset_12   <= timeOffset_12 ;		
				end
			endcase	
		end	
	end	
	always @ (posedge clk_dsp  )
	begin : TIME_OFFSET_DETECT_DSP
		if (rst_dsp_n == 1'b0) 
		begin			
     		timeOffset_11_1d   <= 'd0 ; 
            timeOffset_12_1d   <= 'd0 ; 	
     		timeOffset_11_2d   <= 'd0 ;
            timeOffset_12_2d   <= 'd0 ;  			
		end
		else 
		begin			
			timeOffset_11_1d   <= timeOffset_11 ;
			timeOffset_12_1d   <= timeOffset_12 ;
			timeOffset_11_2d   <= timeOffset_11_1d ;
			timeOffset_12_2d   <= timeOffset_12_1d ;
		end	
	end
	
	always @ (posedge clk_eth  )
	begin : Start_Symb_ETH
		if (rst_eth_n == 1'b0) 
		begin			
			start_sym_11   <= 'd1 ;
			start_sym_12   <= 'd1 ;	
		end
		else if (avst_sink_c_valid_1d & avst_sink_c_startofpacket_1d  )
		begin												
			case(rx_c_rtc_id_1d)
				'd8:  start_sym_11   <= rx_c_startsymbolid_1d ;
				'd9:  start_sym_12   <= rx_c_startsymbolid_1d ;
				'd10: start_sym_11   <= rx_c_startsymbolid_1d ;
				'd11: start_sym_12   <= rx_c_startsymbolid_1d ;
				'd12: start_sym_11   <= rx_c_startsymbolid_1d ;
				'd13: start_sym_12   <= rx_c_startsymbolid_1d ;
				'd14: start_sym_11   <= rx_c_startsymbolid_1d ;
				'd15: start_sym_12   <= rx_c_startsymbolid_1d ;
				default: 
				begin			
					start_sym_11   <= start_sym_11 ;
					start_sym_12   <= start_sym_12 ;		
				end
			endcase	
		end	
	end	
	
	always @ (posedge clk_dsp  )
	begin : Start_Symb_DSP
		if (rst_dsp_n == 1'b0) 
		begin			
     		start_sym_11_1d   <= 'd1 ; 
            start_sym_12_1d   <= 'd1 ; 	
     		start_sym_11_2d   <= 'd1 ;
            start_sym_12_2d   <= 'd1 ;  			
		end
		else 
		begin			
			start_sym_11_1d   <= start_sym_11 ;
			start_sym_12_1d   <= start_sym_12 ;
			start_sym_11_2d   <= start_sym_11_1d ;
			start_sym_12_2d   <= start_sym_12_1d ;
		end	
	end
 
 	always @ (posedge clk_eth  )
	begin : SubframeId_EH
		if (rst_eth_n == 1'b0) 
		begin			
			subframeId_11   <= 'd10 ;
			subframeId_12   <= 'd10 ;	
		end
		else if (avst_sink_c_valid_1d & avst_sink_c_startofpacket_1d)
		begin												
			case(rx_c_rtc_id_1d)
				'd8:  subframeId_11   <= rx_c_subframeId_1d ;
				'd9:  subframeId_12   <= rx_c_subframeId_1d ;
				'd10: subframeId_11   <= rx_c_subframeId_1d ;
				'd11: subframeId_12   <= rx_c_subframeId_1d ;
				'd12: subframeId_11   <= rx_c_subframeId_1d ;
				'd13: subframeId_12   <= rx_c_subframeId_1d ;
				'd14: subframeId_11   <= rx_c_subframeId_1d ;
				'd15: subframeId_12   <= rx_c_subframeId_1d ;
				default: 
				begin			
					subframeId_11   <= subframeId_11 ;
					subframeId_12   <= subframeId_12 ;		
				end
			endcase	
		end	
	end	
	
	always @ (posedge clk_dsp  )
	begin : SubframeId_DSP
		if (rst_dsp_n == 1'b0) 
		begin			
     		subframeId_11_1d   <= 'd10 ; 
            subframeId_12_1d   <= 'd10 ; 	
     		subframeId_11_2d   <= 'd10 ;
            subframeId_12_2d   <= 'd10 ;  			
		end
		else 
		begin			
			subframeId_11_1d   <= subframeId_11 ;
			subframeId_12_1d   <= subframeId_12 ;
			subframeId_11_2d   <= subframeId_11_1d ;
			subframeId_12_2d   <= subframeId_12_1d ;
		end	
	end
	
	always @ (posedge clk_eth  )
	begin : NUMSYMBOL_ETH
		if (rst_eth_n == 1'b0) 
		begin			
			num_symbol_11   <= 'd15 ;
			num_symbol_12   <= 'd15 ;	
		end
		else if (avst_sink_c_valid_1d & avst_sink_c_startofpacket_1d)
		begin												
			case(rx_c_rtc_id_1d)
				'd8:  num_symbol_11   <= rx_c_num_symbol_1d ;
				'd9:  num_symbol_12   <= rx_c_num_symbol_1d ;
				'd10: num_symbol_11   <= rx_c_num_symbol_1d ;
				'd11: num_symbol_12   <= rx_c_num_symbol_1d ;
				'd12: num_symbol_11   <= rx_c_num_symbol_1d ;
				'd13: num_symbol_12   <= rx_c_num_symbol_1d ;
				'd14: num_symbol_11   <= rx_c_num_symbol_1d ;
				'd15: num_symbol_12   <= rx_c_num_symbol_1d ;
				default: 
				begin			
					num_symbol_11   <= num_symbol_11 ;
					num_symbol_12   <= num_symbol_12 ;		
				end
			endcase	
		end	
	end	
	
	always @ (posedge clk_dsp  )
	begin : NUMSYMBOL_DSP
		if (rst_dsp_n == 1'b0) 
		begin			
     		num_symbol_11_1d   <= 'd15 ; 
            num_symbol_12_1d   <= 'd15 ; 	
     		num_symbol_11_2d   <= 'd15 ;
            num_symbol_12_2d   <= 'd15 ;  			
		end
		else 
		begin			
			num_symbol_11_1d   <= num_symbol_11 ;
			num_symbol_12_1d   <= num_symbol_12 ;
			num_symbol_11_2d   <= num_symbol_11_1d ;
			num_symbol_12_2d   <= num_symbol_12_1d ;
		end	
	end
	
	always @ (posedge clk_eth  )
	begin : SLOT_ID_ETH
		if (rst_eth_n == 1'b0) 
		begin			
			slot_id_l1   <= 'd15 ;
			slot_id_l2   <= 'd15 ;	
		end
		else if (avst_sink_c_valid_1d & avst_sink_c_startofpacket_1d)
		begin												
			case(rx_c_rtc_id_1d)
				'd8:  slot_id_l1   <= rx_c_slotid_1d ;
				'd9:  slot_id_l2   <= rx_c_slotid_1d ;
				'd10: slot_id_l1   <= rx_c_slotid_1d ;
				'd11: slot_id_l2   <= rx_c_slotid_1d ;
				'd12: slot_id_l1   <= rx_c_slotid_1d ;
				'd13: slot_id_l2   <= rx_c_slotid_1d ;
				'd14: slot_id_l1   <= rx_c_slotid_1d ;
				'd15: slot_id_l2   <= rx_c_slotid_1d ;
				default: 
				begin			
					slot_id_l1   <= slot_id_l1 ;
					slot_id_l2   <= slot_id_l2 ;		
				end
			endcase	
		end	
	end	
	
	always @ (posedge clk_dsp  )
	begin : SLOT_ID_DSP
		if (rst_dsp_n == 1'b0) 
		begin			
     		slot_id_l1_1d   <= 'd15 ; 
            slot_id_l2_1d   <= 'd15 ; 	
     		slot_id_l1_2d   <= 'd15 ;
            slot_id_l2_2d   <= 'd15 ;  			
		end
		else 
		begin			
			slot_id_l1_1d   <= slot_id_l1 ;
			slot_id_l2_1d   <= slot_id_l2 ;
			slot_id_l1_2d   <= slot_id_l1_1d ;
			slot_id_l2_2d   <= slot_id_l2_1d ;
		end	
	end
	
	always @ (posedge clk_eth  )
	begin : FRAME_ID_ETH
		if (rst_eth_n == 1'b0) 
		begin			
			frame_id_l1   <= 'd255 ;
			frame_id_l2   <= 'd255 ;	
		end
		else if (avst_sink_c_valid_1d & avst_sink_c_startofpacket_1d)
		begin												
			case(rx_c_rtc_id_1d)
				'd8:  frame_id_l1   <= rx_c_frameid_1d ;
				'd9:  frame_id_l2   <= rx_c_frameid_1d ;
				'd10: frame_id_l1   <= rx_c_frameid_1d ;
				'd11: frame_id_l2   <= rx_c_frameid_1d ;
				'd12: frame_id_l1   <= rx_c_frameid_1d ;
				'd13: frame_id_l2   <= rx_c_frameid_1d ;
				'd14: frame_id_l1   <= rx_c_frameid_1d ;
				'd15: frame_id_l2   <= rx_c_frameid_1d ;
				default: 
				begin			
					frame_id_l1   <= frame_id_l1 ;
					frame_id_l2   <= frame_id_l2 ;		
				end
			endcase	
		end	
	end	
	
	always @ (posedge clk_dsp  )
	begin : FRAME_ID_DSP
		if (rst_dsp_n == 1'b0) 
		begin			
     		frame_id_l1_1d   <= 'd255 ; 
            frame_id_l2_1d   <= 'd255 ; 	
     		frame_id_l1_2d   <= 'd255 ;
            frame_id_l2_2d   <= 'd255 ;  			
		end
		else 
		begin			
			frame_id_l1_1d   <= frame_id_l1 ;
			frame_id_l2_1d   <= frame_id_l2 ;
			frame_id_l1_2d   <= frame_id_l1_1d ;
			frame_id_l2_2d   <= frame_id_l2_1d ;
		end	
	end
 
 
endmodule