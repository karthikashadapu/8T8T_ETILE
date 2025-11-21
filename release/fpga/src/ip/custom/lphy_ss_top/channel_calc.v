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


`timescale 1ns/1ns
 
module channel_calc
(
   clk_dsp                                  ,
   rst_dsp_n                                ,
   // Stream Input                  
   avst_sink_valid_1                        , 
   
   bw_config_cc1							,
   bw_config_cc2							,
   avst_source_channel_1                    ,
   avst_source_endofpacket_1                  
      
);


input									 clk_dsp       			   ;
input									 rst_dsp_n     			   ;
input [7:0] 							 bw_config_cc1			   ;           
input [7:0] 							 bw_config_cc2			   ;           
input                                    avst_sink_valid_1             ;
output reg  [7:0]                        avst_source_channel_1         ;
output reg                               avst_source_endofpacket_1     ;
	                                                  
reg  [12:0]                              NUM_OF_SUBCARRIER_1           ;
reg  [15:0]                             sink_valid_count_1            ;
reg  [11:0]                             subcarrier_index_1            ;

reg  [1:0]                              axc_index_1                   ;

reg                                     last_axc_index_1              ;

reg                                     source_endofpacket_1          ;

reg [7:0] 								bw_config_reg_cc1_1d		;
reg [7:0] 								bw_config_reg_cc1_2d		;
reg [7:0] 								bw_config_reg_cc2_1d		;
reg [7:0] 								bw_config_reg_cc2_2d		;
reg avst_sink_valid_1_1d ;
reg avst_sink_valid_1_2d ;


// Pipe Line Registers
always @ (posedge clk_dsp)
begin : PIPE_DELAY
    if(~rst_dsp_n) 
    begin
        avst_sink_valid_1_1d                <= 1'b0                             ;
        avst_sink_valid_1_2d                <= 1'b0                             ;    		
		bw_config_reg_cc1_1d				<= 8'd0;
		bw_config_reg_cc1_2d				<= 8'd0;
		bw_config_reg_cc2_1d				<= 8'd0;
		bw_config_reg_cc2_2d				<= 8'd0;
    end 
    else 
    begin
        avst_sink_valid_1_1d                  <= avst_sink_valid_1                  ;      
        avst_sink_valid_1_2d                  <= avst_sink_valid_1_1d               ;   
		
		bw_config_reg_cc1_1d				<= bw_config_cc1				      ;
		bw_config_reg_cc1_2d				<= bw_config_reg_cc1_1d			      ;
		bw_config_reg_cc2_1d				<= bw_config_cc2				      ;
		bw_config_reg_cc2_2d				<= bw_config_reg_cc2_1d			 	  ;
    end
end


			
			
// Subcarrier Configurable for Variable Bandwidth - - Needs to updated for Mixed BW Support		
always @ (posedge clk_dsp)
            begin : NUM_SC_1		
            if (rst_dsp_n == 1'b0)
               NUM_OF_SUBCARRIER_1 <= 'b0 ;
//			else if (~bw_config_reg_cc1_2d [7]  )
			else 
                     begin
               (* parallel_case *) case(bw_config_reg_cc1_2d [6:0])
								'hA    :   NUM_OF_SUBCARRIER_1  <= 'd1944 ;
                                'hE    :   NUM_OF_SUBCARRIER_1  <= 'd3276 ;
								default  : NUM_OF_SUBCARRIER_1  <= 'd3276 ;
                                  endcase
                     end		
            end 

//---------- Sink counter ------------//
always @ (posedge clk_dsp)
begin : SINK_COUNTER_1   
    if (rst_dsp_n == 1'b0) 
        sink_valid_count_1  <= 16'b0 ;
    else if (avst_sink_valid_1)
        sink_valid_count_1  <= sink_valid_count_1 + 1'b1 ;
end


//---------- Subcarrier index ------------//
always @ (posedge clk_dsp)
begin : SUBCARRIER_INDEX_1   
    if (rst_dsp_n == 1'b0) 
        subcarrier_index_1  <= 11'b0 ;
    else if (source_endofpacket_1 & avst_sink_valid_1_2d)
        subcarrier_index_1  <= 11'b0 ;
    else if (avst_sink_valid_1_2d)
        subcarrier_index_1  <= subcarrier_index_1 + 1'b1 ;
end


always @ (posedge clk_dsp)
begin : SOURCE_ENDOFPACKET_1   
    source_endofpacket_1  <= (subcarrier_index_1 == (NUM_OF_SUBCARRIER_1-2)) ;
end



//---------- AXC index ------------//
always @ (posedge clk_dsp)
begin : AXC_INDEX_1   
    if (rst_dsp_n == 1'b0)
        axc_index_1  <= 2'b0 ;
    else if (source_endofpacket_1 & avst_sink_valid_1_2d)
        axc_index_1  <= axc_index_1 + 1'b1 ;
end




always@(posedge clk_dsp)
begin: DATA_OUTPUT
    if (rst_dsp_n == 1'b0) begin
		avst_source_channel_1         <= 'd0; 
		avst_source_endofpacket_1     <= 'd0; 	
    end else if (~bw_config_reg_cc1_2d [7] ) begin // Both CC1 & CC2 Enable
		avst_source_channel_1         <= axc_index_1          ; 
		avst_source_endofpacket_1     <= source_endofpacket_1 ; 
		
	end else  begin // Both CC1 & CC2 Disable
		avst_source_channel_1         <= 'd0; 
		avst_source_endofpacket_1     <= 'd0; 
		
	end
end

endmodule
