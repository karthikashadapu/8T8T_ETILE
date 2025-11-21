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
 
module ul_ant_scheduler
(
 clk_dsp                ,
 rst_dsp_n              ,
 ul_start_pulse         ,
 avst_sink_valid_l1     ,
 avst_sink_data_l1      ,
 avst_sink_channel_l1   ,
 avst_sink_valid_l2     ,
 avst_sink_data_l2      ,
 avst_sink_channel_l2   ,
 avst_source_valid_l1     ,
 avst_source_data_l1      ,
 avst_source_channel_l1   ,
 avst_source_valid_l2     ,
 avst_source_data_l2      ,
 avst_source_channel_l2   ,
 ul_frame_status	  ,
 frame_sync_status    ,
 ul_start_pulse_latch
 );
 
input wire clk_dsp           ;
input wire rst_dsp_n         ;
input wire ul_start_pulse    ;

input wire         avst_sink_valid_l1  ; 
input wire [31:0]  avst_sink_data_l1   ;
input wire [7:0]   avst_sink_channel_l1;
input wire         avst_sink_valid_l2  ;
input wire [31:0]  avst_sink_data_l2   ;
input wire [7:0]   avst_sink_channel_l2;

output wire        avst_source_valid_l1  ; 
output wire [31:0] avst_source_data_l1   ;
output wire [7:0]  avst_source_channel_l1;
output wire        avst_source_valid_l2  ;
output wire [31:0] avst_source_data_l2   ;
output wire [7:0]  avst_source_channel_l2;

output wire [13:0] ul_frame_status;
output reg 	   ul_start_pulse_latch ; 
input wire   [67:0] frame_sync_status   ;


reg [15:0]      sample_cnt_14_limit;
reg [15:0]      sample_cnt_14;
reg [3:0]       sym_cnt_14;
reg             sample_cnt_14_last;
reg             sym_cnt_14_last;
reg             subframe_last;
reg             slot_id;
reg [3:0]       subframe_num;
reg [9:0]       frame_num;

reg         avst_sink_valid_l1_1d  ; 
reg [31:0]  avst_sink_data_l1_1d   ;
reg [7:0]   avst_sink_channel_l1_1d;
reg         avst_sink_valid_l2_1d  ;
reg [31:0]  avst_sink_data_l2_1d   ;
reg [7:0]   avst_sink_channel_l2_1d;
reg         ul_start_pulse_1d    ;
wire        ul_start_latch_pulse ;

//reg   	   ul_start_pulse_latch ; 

always @ (posedge clk_dsp )
begin : DELAY
    if(~rst_dsp_n)
    begin
        avst_sink_valid_l1_1d       <=  'd0;
        avst_sink_channel_l1_1d     <=  'd0;
		avst_sink_data_l1_1d        <=  'd0;
		avst_sink_valid_l2_1d       <=  'd0;
        avst_sink_channel_l2_1d     <=  'd0;
		avst_sink_data_l2_1d        <=  'd0;
    end
    else
    begin
        avst_sink_valid_l1_1d       <=  avst_sink_valid_l1 ;
        avst_sink_channel_l1_1d     <=  avst_sink_channel_l1;
		avst_sink_data_l1_1d        <=  avst_sink_data_l1;
		avst_sink_valid_l2_1d       <=  avst_sink_valid_l2 ;
        avst_sink_channel_l2_1d     <=  avst_sink_channel_l2;
		avst_sink_data_l2_1d        <=  avst_sink_data_l2;
    end
end

always @ (posedge clk_dsp )
begin : SYM_CNT_LIMIT
    if(~rst_dsp_n)
        sample_cnt_14_limit <=  16'd17790               ;
	else
    begin
        case(sym_cnt_14)
        4'd0    :   sample_cnt_14_limit <= 16'd17790    ;
        4'd1    :   sample_cnt_14_limit <= 16'd17534    ;
        4'd2    :   sample_cnt_14_limit <= 16'd17534    ;
        4'd3    :   sample_cnt_14_limit <= 16'd17534    ;
        4'd4    :   sample_cnt_14_limit <= 16'd17534    ;
        4'd5    :   sample_cnt_14_limit <= 16'd17534    ;
        4'd6    :   sample_cnt_14_limit <= 16'd17534    ;
        4'd7    :   sample_cnt_14_limit <= 16'd17534    ;
        4'd8    :   sample_cnt_14_limit <= 16'd17534    ;
        4'd9    :   sample_cnt_14_limit <= 16'd17534    ;
        4'd10   :   sample_cnt_14_limit <= 16'd17534    ;
        4'd11   :   sample_cnt_14_limit <= 16'd17534    ;
        4'd12   :   sample_cnt_14_limit <= 16'd17534    ;
        4'd13   :   sample_cnt_14_limit <= 16'd17534    ;
		default : 	sample_cnt_14_limit <=  sample_cnt_14_limit;
        endcase
    end
end

always @ (posedge clk_dsp )
begin : FRAME_LAST
    if(~rst_dsp_n)
    begin
        sample_cnt_14_last  <=  1'b0    ;
        sym_cnt_14_last     <=  1'b0    ;
        subframe_last       <=  1'b0    ;
    end
    else
    begin
        sample_cnt_14_last  <=  sample_cnt_14 == sample_cnt_14_limit ;
        sym_cnt_14_last     <=  sym_cnt_14 == 'd13;
		subframe_last       <=  subframe_num == 'd9;
    end
end

always @ (posedge clk_dsp )
begin : UL_START_PUL
    if(~rst_dsp_n)
		begin
        ul_start_pulse_latch   <=  'd0;
		end
	else if (~ul_start_pulse)
		begin
		if(sample_cnt_14_last & sym_cnt_14_last & (slot_id==1'b1) & subframe_last)
			ul_start_pulse_latch <= 'd0;
		end
    else if(ul_start_pulse)
		begin
		if( (avst_sink_valid_l1 & (avst_sink_channel_l1 == 'd0)) |  (avst_sink_valid_l2 & (avst_sink_channel_l2 == 'd0)) )
			ul_start_pulse_latch <= 'd1;
        end
end

always @ (posedge clk_dsp )
begin : SAMPLE_CNT_14
    if(~rst_dsp_n)
        sample_cnt_14   <=  16'b0   ;
	 else if (~ul_start_pulse_latch)
		  sample_cnt_14   <=  16'b0   ;
    else if(sample_cnt_14_last)
        sample_cnt_14   <=  16'b0   ;
    else if(ul_start_pulse_latch & (avst_sink_valid_l1_1d | avst_sink_valid_l2_1d))
        sample_cnt_14   <=  sample_cnt_14 + 1'b1 ;
end

always @ (posedge clk_dsp)
begin : SYM_CNT_14
    if(~rst_dsp_n)
        sym_cnt_14  <=  4'b0    ;
	 else if (~ul_start_pulse_latch)
		  sym_cnt_14  <=  4'b0    ;
    else if(sample_cnt_14_last & sym_cnt_14_last)
        sym_cnt_14  <=  4'b0    ;
    else if(sample_cnt_14_last)
        sym_cnt_14  <=  sym_cnt_14 + 1'b1    ;
end

always @ (posedge clk_dsp)
begin : SLOT_NUM
    if(~rst_dsp_n) 
        slot_id  <=  'd1   ;
	 else if (~ul_start_pulse_latch)
		  slot_id  <=  'd0   ;
    else if (sample_cnt_14_last & sym_cnt_14_last )
        slot_id  <=  ~slot_id    ;
end

always @ (posedge clk_dsp)
begin : SUBFRAME
    if(~rst_dsp_n) 
        subframe_num  <=  'd9   ;
	 else if (~ul_start_pulse_latch)
		  subframe_num  <=  'd0   ;
	 else if (sample_cnt_14_last & sym_cnt_14_last & slot_id==1'b1 & subframe_last)
        subframe_num <=  'd0   ;
    else if (sample_cnt_14_last & sym_cnt_14_last & slot_id==1'b1)
        subframe_num <=  subframe_num + 4'b1 ;
end

always @ (posedge clk_dsp)
begin : FRAME
    if(~rst_dsp_n) 
        frame_num  <=  'd255   ;
     else if ((~ul_start_pulse_latch) | ul_start_latch_pulse)
		  frame_num  <=  frame_sync_status [54:45]   ;
	 else if (sample_cnt_14_last & sym_cnt_14_last & slot_id==1'b1 & subframe_last)
        frame_num <=  frame_num + 1'b1;
end

always @ (posedge clk_dsp)
begin 
    if(~rst_dsp_n)
      ul_start_pulse_1d <= 1'b0 ;
    else
	  ul_start_pulse_1d <= ul_start_pulse ;    
end

assign ul_start_latch_pulse  =  ul_start_pulse & (~ul_start_pulse_1d) ;
 
assign ul_frame_status        = {1'b0,frame_num[7:0],subframe_num,slot_id};
assign avst_source_valid_l1   = avst_sink_valid_l1_1d & ul_start_pulse_latch  ;
assign avst_source_data_l1    = avst_sink_data_l1_1d   ;
assign avst_source_channel_l1 = avst_sink_channel_l1_1d;
assign avst_source_valid_l2   = avst_sink_valid_l2_1d & ul_start_pulse_latch ;
assign avst_source_data_l2    = avst_sink_data_l2_1d   ;
assign avst_source_channel_l2 = avst_sink_channel_l2_1d;

//assign ul_start_pulse_latch_out = ul_start_pulse_latch ;
 
endmodule
