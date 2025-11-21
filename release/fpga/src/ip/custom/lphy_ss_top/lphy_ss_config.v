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

module lphy_ss_config
(
input    			clk_dsp              		,
input    			rst_dsp_n            		,
input  				rst_soft_n	     	 		,		
output wire [55:0]	frame_status    			,//
input				auxN_tx_rfp          		,//
output              dl_input_hfn_pulse	 		,//
output reg          ul_input_hfn_pulse			,//	 
input wire [1:0]   	dl_ul_start					,
input wire [31:0]   dl_input_config     		,
input wire [31:0]   ul_input_config     			
							            
);

// reg [1:0]   dl_ul_start						;
reg [1:0]   dl_ul_start_1d				  	;
reg [1:0]   dl_ul_start_2d					;

// reg [31:0]  dl_input_config     			;
reg [31:0]  dl_input_config_1d     			;
reg [31:0]  dl_input_config_2d     			;

// reg [31:0]  ul_input_config     			;
reg [31:0]  ul_input_config_1d     			;
reg [31:0]  ul_input_config_2d     			;


reg 			rst_dsp_soft_n_1d				;
reg 			rst_dsp_soft_n_2d				;
reg 			rst_dsp_soft_n_3d				;
reg 			rst_dsp_soft_n_4d				;


wire            	dl_start                	;
wire            	ul_start                	;

wire    [15:0]  dl_input_sample         		;
wire    [4:0]   dl_input_sym            		;
wire    [3:0]   dl_input_sfn            		;
wire            dl_input_rfn            		;
		
wire    [15:0]  ul_input_sample         		;
wire    [4:0]   ul_input_sym            		;
wire    [3:0]   ul_input_sfn            		;
wire            ul_input_rfn            		;

reg 			auxN_tx_rfp_1d					;
reg 			auxN_tx_rfp_2d					;
reg 			auxN_tx_rfp_3d					;
wire 			auxN_tx_rfp_2d_pos				;

reg             tti_pulse               		;
reg             tti_pulse_1d            		;
reg             tti_pulse_2d            		;

reg     [15:0]  sample_cnt_14_limit     ;
reg     [15:0]  sample_cnt_14_limit_1d  ;
reg     [15:0]  sample_cnt_14_limit_2d  ;

reg     [14:0]  sample_cnt_15       	;
reg     [14:0]  sample_cnt_15_1d    	;
reg     [14:0]  sample_cnt_15_2d    	;
reg     [15:0]  sample_cnt_14       	;
reg     [15:0]  sample_cnt_14_1d    	;
reg     [15:0]  sample_cnt_14_2d    	;
reg     [15:0]  sample_cnt_14_2d_dup1	;
reg     [15:0]  sample_cnt_14_2d_dup2	;
reg     [4:0]   sym_cnt_15          	;
reg     [4:0]   sym_cnt_15_1d       	;
reg     [4:0]   sym_cnt_15_2d       	;
reg     [4:0]   sym_cnt_14          	;
reg     [4:0]   sym_cnt_14_1d       	;
reg     [4:0]   sym_cnt_14_2d       	;
reg     [4:0]   sym_cnt_14_2d_dup1  	;
reg     [4:0]   sym_cnt_14_2d_dup2  	;
reg     [3:0]   sfn_cnt             	;
reg     [3:0]   sfn_cnt_1d          	;
reg     [3:0]   sfn_cnt_2d          	;
reg     [3:0]   sfn_cnt_2d_dup1     	;
reg     [3:0]   sfn_cnt_2d_dup2     	;
reg     [9:0]   rfn_cnt             	;
reg     [9:0]   rfn_cnt_1d          	;
reg     [9:0]   rfn_cnt_2d          	;
reg     [9:0]   rfn_cnt_2d_dup1     	;
reg     [9:0]   rfn_cnt_2d_dup2     	;

reg             dl_input_enable         ;
reg             dl_input_enable_1d      ;
reg             ul_input_enable         ;

reg             sample_cnt_14_last 				;
reg             sample_cnt_15_last 				;
reg             sym_cnt_15_last    				;
reg             sym_cnt_14_last    				;
reg             sfn_cnt_last       				;

reg             dl_input_sample_cnt_14_sel       ;
reg             dl_input_sample_cnt_14_sel_1d    ;
reg             dl_input_sample_cnt_14_sel_2d    ;
reg             dl_input_sym_cnt_14_sel          ;
reg             dl_input_sfn_cnt_sel             ;
reg             dl_input_rfn_cnt_sel             ;

reg             ul_input_sample_cnt_14_sel       ;
reg             ul_input_sample_cnt_14_sel_1d    ;
reg             ul_input_sample_cnt_14_sel_2d    ;
reg             ul_input_sym_cnt_14_sel          ;
reg             ul_input_sfn_cnt_sel             ;
reg             ul_input_rfn_cnt_sel             ;



always @ (posedge clk_dsp )
begin : PIPE_DELAY
    if(~rst_dsp_n )
    begin
		dl_ul_start_1d					<= 	'd0	;
		dl_ul_start_2d					<= 	'd0	;
		dl_input_config_1d     			<= 	'd0	;
		dl_input_config_2d     			<= 	'd0	;
		ul_input_config_1d     			<= 	'd0	;
		ul_input_config_2d     			<= 	'd0	;
	end
	else if(~rst_soft_n)
    begin
		dl_ul_start_1d					<= 	'd0	;
		dl_ul_start_2d					<= 	'd0	;
		dl_input_config_1d     			<= 	'd0	;
		dl_input_config_2d     			<= 	'd0	;
		ul_input_config_1d     			<= 	'd0	;
		ul_input_config_2d     			<= 	'd0	;
	end
    else
    begin
		dl_ul_start_1d					<= 	dl_ul_start				  		;
		dl_ul_start_2d					<= 	dl_ul_start_1d					;
		dl_input_config_1d     			<= 	dl_input_config	     			;
		dl_input_config_2d     			<= 	dl_input_config_1d     			;
		ul_input_config_1d     			<= 	ul_input_config	     			;
		ul_input_config_2d     			<= 	ul_input_config_1d     			;
	end
end

always @(posedge clk_dsp)
	begin: DSP_SOFT_RST_PIPE
		rst_dsp_soft_n_1d 		<= rst_soft_n		;
		rst_dsp_soft_n_2d		<= rst_dsp_soft_n_1d;
		rst_dsp_soft_n_3d		<= rst_dsp_soft_n_2d;
		rst_dsp_soft_n_4d		<= rst_dsp_soft_n_3d;
		
	end	
	

assign dl_start         	=   dl_ul_start_2d[0]      		;
assign ul_start         	=   dl_ul_start_2d[1]          	;
	
assign dl_input_sample  =   dl_input_config_2d [15:0 ]  ;//16
assign dl_input_sym     =   dl_input_config_2d [20:16]  ;//5
assign dl_input_sfn     =   dl_input_config_2d [24:21]  ;//4
assign dl_input_rfn     =   dl_input_config_2d [25]     ;//1
	
assign ul_input_sample  =   ul_input_config_2d [15:0 ]  ;
assign ul_input_sym     =   ul_input_config_2d [20:16]  ;
assign ul_input_sfn     =   ul_input_config_2d [24:21]  ;
assign ul_input_rfn     =   ul_input_config_2d [25]     ;


always @ (posedge clk_dsp )
begin : PIPE_DELAY_2
    if(~rst_dsp_n)
    begin
		auxN_tx_rfp_1d					<= 	1'b0    	;
		auxN_tx_rfp_2d					<=	1'b0    	;
		auxN_tx_rfp_3d                  <=	1'b0    	;
		tti_pulse_1d            		<=  1'b0    	;
        tti_pulse_2d            		<=  1'b0    	;
        dl_input_sample_cnt_14_sel_1d   <=  1'b0    	;
        dl_input_sample_cnt_14_sel_2d   <=  1'b0    	;
        ul_input_sample_cnt_14_sel_1d 	<= 1'b0 		;
        ul_input_sample_cnt_14_sel_2d 	<= 1'b0 		;
        sample_cnt_15_1d    			<=  15'b0   	;
        sample_cnt_15_2d    			<=  15'b0   	;
        sample_cnt_14_1d    			<=  16'b0   	;
        sample_cnt_14_2d    			<=  16'b0   	;
        sample_cnt_14_2d_dup1   		<=  16'b0   	;
        sample_cnt_14_2d_dup2   		<=  16'b0   	;
        sym_cnt_15_1d           		<=   5'b0   	;
        sym_cnt_15_2d           		<=   5'b0   	;
        sym_cnt_14_1d           		<=   5'b0   	;
        sym_cnt_14_2d           		<=   5'b0   	;
        sym_cnt_14_2d_dup1      		<=   5'b0   	;
        sym_cnt_14_2d_dup2      		<=   5'b0   	;
        sfn_cnt_1d              		<=   4'b0   	;
        sfn_cnt_2d              		<=   4'b0   	;
        sfn_cnt_2d_dup1         		<=   4'b0   	;
        sfn_cnt_2d_dup2         		<=   4'b0   	;
        rfn_cnt_1d              		<=  10'b0   	;
        rfn_cnt_2d              		<=  10'b0   	;
        rfn_cnt_2d_dup1         		<=  10'b0   	;
        rfn_cnt_2d_dup2         		<=  10'b0   	;
        sample_cnt_14_limit_1d  		<=  16'd17790   ;
        sample_cnt_14_limit_2d  		<=  16'd17790   ;
		dl_input_enable_1d              <=  1'b0        ;
        
    end
    else
    begin
		auxN_tx_rfp_1d      			<=  auxN_tx_rfp         			;
        auxN_tx_rfp_2d     				<=  auxN_tx_rfp_1d      			;
		auxN_tx_rfp_3d      			<=  auxN_tx_rfp_2d      			;
		tti_pulse_1d            		<=  tti_pulse           			;
        tti_pulse_2d            		<=  tti_pulse_1d        			;
        dl_input_sample_cnt_14_sel_1d   <=  dl_input_sample_cnt_14_sel      ;
        dl_input_sample_cnt_14_sel_2d   <=  dl_input_sample_cnt_14_sel_1d   ;
        ul_input_sample_cnt_14_sel_1d 	<=  ul_input_sample_cnt_14_sel    	;
        ul_input_sample_cnt_14_sel_2d 	<=  ul_input_sample_cnt_14_sel_1d 	;
        sample_cnt_15_1d   				<=  sample_cnt_15       			;
        sample_cnt_15_2d   				<=  sample_cnt_15_1d    			;
        sample_cnt_14_1d   				<=  sample_cnt_14       			;
        sample_cnt_14_2d   				<=  sample_cnt_14_1d    			;
        sample_cnt_14_2d_dup1   		<=  sample_cnt_14_1d    			;
        sample_cnt_14_2d_dup2   		<=  sample_cnt_14_1d    			;
        sym_cnt_15_1d           		<=  sym_cnt_15          			;
        sym_cnt_15_2d           		<=  sym_cnt_15_1d       			;
        sym_cnt_14_1d           		<=  sym_cnt_14          			;
        sym_cnt_14_2d           		<=  sym_cnt_14_1d       			;
        sym_cnt_14_2d_dup1      		<=  sym_cnt_14_1d       			;
        sym_cnt_14_2d_dup2      		<=  sym_cnt_14_1d       			;
        sfn_cnt_1d          			<=  sfn_cnt             			;
        sfn_cnt_2d          			<=  sfn_cnt_1d          			;
        sfn_cnt_2d_dup1         		<=  sfn_cnt_1d          			;
        sfn_cnt_2d_dup2         		<=  sfn_cnt_1d          			;
        rfn_cnt_1d          			<=  rfn_cnt             			;
        rfn_cnt_2d          			<=  rfn_cnt_1d          			;
        rfn_cnt_2d_dup1         		<=  rfn_cnt_1d          			;
        rfn_cnt_2d_dup2         		<=  rfn_cnt_1d          			;
        sample_cnt_14_limit_1d  		<=  sample_cnt_14_limit     		;
        sample_cnt_14_limit_2d  		<=  sample_cnt_14_limit_1d  		;
		dl_input_enable_1d              <= dl_input_enable                  ;
        
    end
end


assign frame_status     	=   {tti_pulse_1d,rfn_cnt_2d,sfn_cnt_2d	,
								sym_cnt_15_2d,sym_cnt_14_2d						    ,
								sample_cnt_15_2d,sample_cnt_14_2d}	; // {1'b1, 10'd0, 4'd0,5'd0,5'd0,15'd0,16'd0};

assign auxN_tx_rfp_2d_pos = auxN_tx_rfp_2d & (~auxN_tx_rfp_3d) ;

always @ (posedge clk_dsp )
begin : TTI_PULSE
    if(~rst_dsp_n )
        tti_pulse   <=  1'b0    ;
    else if((sample_cnt_15 == 15'd0) & (sym_cnt_15 == 5'd0))
        tti_pulse   <=  1'b1    ;
    else if(sample_cnt_15 == 15'd100)
        tti_pulse   <=  1'b0    ;
end

always @ (posedge clk_dsp )
begin : SYM_CNT_14_LIMIT
    if(~rst_dsp_n)
        sample_cnt_14_limit <=  16'd17790  ;
    else if(auxN_tx_rfp_2d_pos)
        sample_cnt_14_limit <=  16'd17790  ;
	else
    begin
        case(sym_cnt_14_2d)
        5'd0    :   sample_cnt_14_limit <= 16'd17790    ;
        5'd1    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd2    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd3    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd4    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd5    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd6    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd7    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd8    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd9    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd10   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd11   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd12   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd13   :   sample_cnt_14_limit <= 16'd17534    ;
	    5'd14   :   sample_cnt_14_limit <= 16'd17790    ;
        5'd15   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd16   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd17   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd18   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd19   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd20   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd21   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd22   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd23   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd24   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd25   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd26   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd27   :   sample_cnt_14_limit <= 16'd17534    ;
		default : 	sample_cnt_14_limit <=  sample_cnt_14_limit  ;
        endcase
    end
end

always @ (posedge clk_dsp )
begin : FRAME_LAST
    if(~rst_dsp_n)
    begin
        sample_cnt_14_last  <=  1'b0    ;
        sample_cnt_15_last  <=  1'b0    ;
        sym_cnt_15_last     <=  1'b0    ;
        sym_cnt_14_last     <=  1'b0    ;
        sfn_cnt_last        <=  1'b0    ;
    end
    else
    begin
        sample_cnt_14_last  <=  sample_cnt_14 == sample_cnt_14_limit_2d ;
        sample_cnt_15_last  <=  sample_cnt_15 == 15'd16382            	;
        sym_cnt_15_last     <=  sym_cnt_15 == 5'd29                     ;
        sym_cnt_14_last     <=  sym_cnt_14 == 5'd27                     ;
        sfn_cnt_last        <=  sfn_cnt == 4'd9                         ;
    end
end

always @ (posedge clk_dsp )
begin : SAMPLE_CNT_15
    if(~rst_dsp_n)
        sample_cnt_15   <=  15'b0   ;
	else if(auxN_tx_rfp_2d_pos)
        sample_cnt_15   <=  16'b0   ;
    else if(sample_cnt_15_last)
        sample_cnt_15   <=  15'b0   ;
    else
        sample_cnt_15   <=  sample_cnt_15 + 1'b1 ;
end	

always @ (posedge clk_dsp )
begin : SAMPLE_CNT_14
    if(~rst_dsp_n)
        sample_cnt_14   <=  16'b0   ;
    else if(auxN_tx_rfp_2d_pos)
        sample_cnt_14   <=  16'b0   ;
    else if(sample_cnt_14_last)
        sample_cnt_14   <=  16'b0   ;
    else
        sample_cnt_14   <=  sample_cnt_14 + 1'b1 ;
end

always @ (posedge clk_dsp )
begin : SYM_CNT_15
    if(~rst_dsp_n)
        sym_cnt_15  <=  5'b0    			;
    else if(auxN_tx_rfp_2d_pos)
        sym_cnt_15  <=  5'b0    			;
    else if(sample_cnt_15_last & sym_cnt_15_last)
        sym_cnt_15  <=  5'b0    			;
    else if(sample_cnt_15_last)
        sym_cnt_15  <=  sym_cnt_15 + 1'b1 	;
end

always @ (posedge clk_dsp)
begin : SYM_CNT_14
    if(~rst_dsp_n)
        sym_cnt_14  <=  5'b0    ;
	else if(auxN_tx_rfp_2d_pos)
        sym_cnt_14  <=  5'b0    ;
    else if(sample_cnt_14_last & sym_cnt_14_last)
        sym_cnt_14  <=  5'b0    ;
    else if(sample_cnt_14_last)
        sym_cnt_14  <=  sym_cnt_14 + 1'b1    ;
end

always @ (posedge clk_dsp  )
begin : SFN_CNT
    if(~rst_dsp_n)
        sfn_cnt <=  4'b0    ;
	else if(auxN_tx_rfp_2d_pos)
        sfn_cnt <=  4'b0    ;
    else if(sample_cnt_15_last & sym_cnt_15_last & sfn_cnt_last)
        sfn_cnt <=  4'b0    ;
    else if(sample_cnt_15_last & sym_cnt_15_last)
        sfn_cnt <=  sfn_cnt + 1'b1  ;
end

always @ (posedge clk_dsp )
begin : RFN_CNT
    if(~rst_dsp_n)
        rfn_cnt <=  'b0    ;
	else if(auxN_tx_rfp_2d_pos)
        rfn_cnt <= 'b0     ;
    else if(sample_cnt_15_last & sym_cnt_15_last & sfn_cnt_last)
        rfn_cnt <=  rfn_cnt + 1'b1  ;
end

always @ (posedge clk_dsp )
begin : DL_INPUT_FRAME_SEL
    if(~rst_dsp_n)
    begin
        dl_input_rfn_cnt_sel         <=  1'b0    ;
        dl_input_sfn_cnt_sel         <=  1'b0    ;
        dl_input_sym_cnt_14_sel      <=  1'b0    ;
        dl_input_sample_cnt_14_sel   <=  1'b0    ;
        ul_input_rfn_cnt_sel         <=  1'b0    ;
        ul_input_sfn_cnt_sel         <=  1'b0    ;
        ul_input_sym_cnt_14_sel      <=  1'b0    ;
        ul_input_sample_cnt_14_sel   <=  1'b0    ;
    end
	else if(~rst_soft_n)
    begin
        dl_input_rfn_cnt_sel         <=  1'b0    ;
        dl_input_sfn_cnt_sel         <=  1'b0    ;
        dl_input_sym_cnt_14_sel      <=  1'b0    ;
        dl_input_sample_cnt_14_sel   <=  1'b0    ;
        ul_input_rfn_cnt_sel         <=  1'b0    ;
        ul_input_sfn_cnt_sel         <=  1'b0    ;
        ul_input_sym_cnt_14_sel      <=  1'b0    ;
        ul_input_sample_cnt_14_sel   <=  1'b0    ;
    end
    else
    begin
        dl_input_rfn_cnt_sel         <=  rfn_cnt_2d_dup1[0] == dl_input_rfn          ;
        dl_input_sfn_cnt_sel         <=  sfn_cnt_2d_dup1 == dl_input_sfn             ;
        dl_input_sym_cnt_14_sel      <=  sym_cnt_14_2d_dup1 == dl_input_sym          ;
        dl_input_sample_cnt_14_sel   <=  sample_cnt_14_2d_dup1 == dl_input_sample    ;
        ul_input_rfn_cnt_sel         <=  rfn_cnt_2d_dup2[0] == ul_input_rfn          ;
        ul_input_sfn_cnt_sel         <=  sfn_cnt_2d_dup2 == ul_input_sfn             ;
        ul_input_sym_cnt_14_sel      <=  sym_cnt_14_2d_dup2 == ul_input_sym          ;
        ul_input_sample_cnt_14_sel   <=  sample_cnt_14_2d_dup2 == ul_input_sample    ;
    end
end

always @ (posedge clk_dsp )
begin : DL_INPUT_ENABLE
    if(~rst_dsp_n)
        dl_input_enable <=  1'b0        ;
	else if(~rst_soft_n)
		dl_input_enable <=  1'b0        ;
    else if(dl_input_sample_cnt_14_sel & dl_input_sym_cnt_14_sel &
            dl_input_sfn_cnt_sel & dl_input_rfn_cnt_sel)
        dl_input_enable <=  dl_start    ;
end

assign dl_input_hfn_pulse = dl_input_enable & (~dl_input_enable_1d) ;

always @ (posedge clk_dsp )
begin : UL_INPUT_ENABLE
    if(~rst_dsp_n)
        ul_input_enable <=  1'b0        ;
	else if(~rst_soft_n)
		ul_input_enable <=  1'b0        ;	
    else if(ul_input_sample_cnt_14_sel & ul_input_sym_cnt_14_sel &
            ul_input_sfn_cnt_sel & ul_input_rfn_cnt_sel)
        ul_input_enable <=  ul_start    ;
end

always @ (posedge clk_dsp )
begin : UL_INPUT_PULSE
    if(~rst_dsp_n)
        ul_input_hfn_pulse  <=  1'b0            ;
	else if(~rst_soft_n)
        ul_input_hfn_pulse  <=  1'b0            ;	
    else
        ul_input_hfn_pulse  <=  ul_input_enable ;
end

endmodule
