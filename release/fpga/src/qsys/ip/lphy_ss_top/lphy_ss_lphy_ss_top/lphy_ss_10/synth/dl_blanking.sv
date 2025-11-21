// ================================================================================
// Copyright (c) <2024>, Intel Corporation
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
 
module dl_blanking
#( parameter DSP_DATAWIDTH = 32,
parameter FIFO_DATAWIDTH = 64,
parameter NUM_ANT = 4,
parameter NUM_SYM = 28,
parameter MAX_NUM_SECTIONS = 8
)
(input logic clk_eth,
input logic	rst_eth,
input logic	clk_dsp,
input logic	rst_dsp,
input logic	avst_sink_valid,
input logic	[DSP_DATAWIDTH-1:0] avst_sink_data,
input logic	[7:0] avst_sink_channel,
input logic avst_sink_sop,
input logic avst_sink_eop,
output logic avst_sink_ready,
output logic avst_src_valid,
output logic [DSP_DATAWIDTH-1:0] avst_src_data,
output logic [7:0] avst_src_channel,
output logic avst_src_sop,
output logic avst_src_eop,
input logic avst_src_ready,
input logic	cplane_valid,
input logic	[$clog2(NUM_ANT)-1:0] cplane_channel,
input logic	[41:0] cplane_metadata     
);
/*  Cplane_metadata 
startprb [9:0] 	 - 10 bits
numprb	 [10:17] - 8 bits
startsym [23:18] - 6 bits
numsym   [27:24] - 4 bits
slot	 [33:28] - 6 bits
num_sections [41:34] - 8 bits
*/
localparam SYM_SHIFT = $clog2(MAX_NUM_SECTIONS) + $clog2(NUM_ANT) ;
localparam AXC_SHIFT = $clog2(MAX_NUM_SECTIONS) ;

logic ff_wrreq;
logic [FIFO_DATAWIDTH-1:0] ff_writedata;
logic ff_wrfull;
logic ff_rdempty;
logic ff_rdreq,ff_rdreq_1d,ff_rdreq_2d;
logic [FIFO_DATAWIDTH-1:0] ff_readdata;
logic cplane_valid_1d,cplane_valid_2d;
logic [8:0] c_start_prb,c_start_prb_1d,ff_start_prb,ff_start_prb_1d,ff_start_prb_2d,ff_start_prb_3d;
logic [8:0] c_num_prb,c_num_prb_1d,ff_num_prb,ff_num_prb_1d,ff_num_prb_2d,ff_num_prb_3d;
logic [4:0] c_start_symbol,c_start_symbol_1d,ff_start_symbol;
logic [4:0]	c_num_symbol,c_num_symbol_1d,ff_num_symbol;
logic [7:0] c_num_section,c_num_section_1d,ff_num_section,ff_num_section_1d,ff_num_section_2d,ff_num_section_3d,u_numsec;
logic [$clog2(NUM_ANT)-1:0] c_axc_id,c_axc_id_1d,ff_axc,ff_axc_1d,ff_axc_2d,ff_axc_3d;
logic [5:0] c_slot_id,c_slot_id_1d;
logic avst_sink_valid_1d,avst_sink_valid_2d,avst_sink_valid_3d;
logic avst_sink_valid_4d,avst_sink_valid_5d,avst_sink_valid_6d,avst_sink_valid_7d;
logic avst_sink_sop_1d,avst_sink_sop_2d,avst_sink_sop_3d;
logic avst_sink_sop_4d,avst_sink_sop_5d,avst_sink_sop_6d,avst_sink_sop_7d;
logic avst_sink_eop_1d,avst_sink_eop_2d,avst_sink_eop_3d;
logic avst_sink_eop_4d,avst_sink_eop_5d,avst_sink_eop_6d,avst_sink_eop_7d;
logic [7:0] avst_sink_channel_1d,avst_sink_channel_2d,avst_sink_channel_3d;
logic [7:0] avst_sink_channel_4d,avst_sink_channel_5d,avst_sink_channel_6d,avst_sink_channel_7d;
logic [DSP_DATAWIDTH-1:0] avst_sink_data_1d,avst_sink_data_2d,avst_sink_data_3d;
logic [DSP_DATAWIDTH-1:0] avst_sink_data_4d,avst_sink_data_5d,avst_sink_data_6d,avst_sink_data_7d;
logic valid_pos,valid_pos_1d,valid_pos_2d,valid_pos_3d;
logic control_start,control_start_1d,control_start_2d;
/* logic [NUM_ANT-1:0] c_sym [NUM_SYM-1:0];
logic [7:0] c_numsec [NUM_SYM-1:0][NUM_ANT-1:0];
logic [8:0] c_startprb [(NUM_SYM*NUM_ANT*MAX_NUM_SECTIONS)-1:0];
logic [8:0] c_numprb [(NUM_SYM*NUM_ANT*MAX_NUM_SECTIONS)-1:0]; */
logic Sym_valid,Sym_valid_1d,Sym_valid_2d,Sym_valid_3d; 
logic [4:0] cplane_sym,cplane_sym_1d,cplane_sym_2d;
logic [3:0] re_cnt,re_cnt_1d,re_cnt_2d,re_cnt_3d,re_cnt_4d,re_cnt_5d;
logic [8:0] prb_cnt,prb_cnt_1d,prb_cnt_2d,prb_cnt_3d,prb_cnt_4d,prb_cnt_5d;
logic [$clog2(NUM_ANT)-1:0] axc_cnt;
logic [$clog2(NUM_SYM)-1:0] sym_cnt;
logic [($clog2(NUM_ANT)+$clog2(MAX_NUM_SECTIONS))-1:0] axc_place,cplane_axc_place;
logic [($clog2(NUM_SYM)+$clog2(NUM_ANT)+$clog2(MAX_NUM_SECTIONS))-1:0] sym_place,cplane_sym_place;
logic [($clog2(NUM_SYM)+$clog2(NUM_ANT)+$clog2(MAX_NUM_SECTIONS))-1:0] current_place;
logic [7:0] c_section_id,sec_id_slot0,sec_id_slot1;
logic [$clog2(MAX_NUM_SECTIONS)-1:0] ff_section_id,current_section;
logic Prb_valid,blanking;
logic [8:0] u_startprb;
logic [8:0] u_numprb;
/* logic [MAX_NUM_SECTIONS-1:0] sym_shift;
logic [MAX_NUM_SECTIONS-1:0] axc_shift; */
logic control,control_1d,control_2d,control_3d;
logic wren,rden,rden_1d,rden_2d;	
logic [9:0] wraddress,rdaddress;
logic [DSP_DATAWIDTH-1:0] writedata,readdata;
logic sym_reset_enable,sym_reset_start,sym_reset_start_1d,sym_reset_start_pos;
logic [$clog2(NUM_SYM)-1:0] sym_reset_value,sym_reset_value_1d,reset_cnt;

/* separate startprb , start_symbol & num symbol from cplane_metadata*/
always @(posedge clk_eth) begin : CPLANE_INFORMATION
	if (~rst_eth) begin
		c_start_prb		<= 'd0;
		c_start_symbol	<= 'd31;
		c_num_symbol	<= 'd0;
		c_num_section	<= 'd0;
		c_axc_id		<= 'd0;
		c_slot_id		<= 'd0;
	end else if (cplane_valid) begin
		c_start_prb		<= cplane_metadata[0 +: 9];
		c_start_symbol	<= cplane_metadata[18 +: 6] + (14 * cplane_metadata[28 +: 6]);
		c_num_symbol	<= cplane_metadata[24 +: 4] - 'd1 + cplane_metadata[18 +: 6] + (14 * cplane_metadata[28 +: 6]);
		c_num_section	<= cplane_metadata[34 +: 8] - 'd1;
		c_axc_id		<= cplane_channel;
		c_slot_id		<= cplane_metadata[28 +: 6];
	end
end
/* assign 273 if numprb is 0 */
always @(posedge clk_eth) begin : NUMPRB
	if (~rst_eth) begin
		c_num_prb <= 'd511;	
	end else if (cplane_valid & cplane_metadata[10 +: 8] == 'd0) begin
		c_num_prb <= 'd273;
	end else if (cplane_valid) begin
		c_num_prb <= cplane_metadata[10 +: 8];
	end
end

/* delay for c-plane information*/
always @(posedge clk_eth) begin : PIPE_DELAY_ETH
	if (~rst_eth) begin
		cplane_valid_1d 		<= 'd0;
		cplane_valid_2d 		<= 'd0;
		c_start_prb_1d			<= 'd0;
		c_num_prb_1d 			<= 'd0;
		c_start_symbol_1d		<= 'd31;
		c_num_symbol_1d			<= 'd0;
		c_num_section_1d		<= 'd0;
		c_axc_id_1d				<= 'd0;
		c_slot_id_1d			<= 'd0;
	end else begin
		cplane_valid_1d 		<= cplane_valid;
		cplane_valid_2d 		<= cplane_valid_1d;
		c_start_prb_1d			<= c_start_prb;
		c_num_prb_1d 			<= c_start_prb + (c_num_prb - 1'd1);
		c_start_symbol_1d		<= c_start_symbol; 
		c_num_symbol_1d			<= c_num_symbol;
		c_num_section_1d		<= c_num_section;
		c_axc_id_1d				<= c_axc_id;
		c_slot_id_1d			<= c_slot_id;
	end
end

/* section id generation for slot 0*/
always @(posedge clk_eth) begin : SECTION_ID_SLOT0
	if (~rst_eth) begin
		sec_id_slot0 <= 'd255;
	end else if (sym_cnt== 'd0 & axc_cnt == 'd0 & prb_cnt == 'd0 & re_cnt == 'd0) begin
		sec_id_slot0 <= 'd255;
	end else if (cplane_valid_1d & c_start_symbol_1d  == 'd31 & c_slot_id == 'd0) begin
		sec_id_slot0 <= sec_id_slot0 + 1'd1;  
	end else if (cplane_valid_1d & c_start_symbol_1d  == c_start_symbol & c_axc_id_1d == c_axc_id  & c_slot_id == 'd0) begin
		sec_id_slot0 <= sec_id_slot0 + 1'd1;
	end else if (cplane_valid_1d & c_slot_id == 'd0) begin
		sec_id_slot0 <= 'd0;
	end
end

/* section id generation for slot 1*/
always @(posedge clk_eth) begin : SECTION_ID_SLOT1
	if (~rst_eth) begin
		sec_id_slot1 <= 'd255;
	end else if (sym_cnt== 'd14 & axc_cnt == 'd0 & prb_cnt == 'd0 & re_cnt == 'd0) begin
		sec_id_slot1 <= 'd255;
	end else if (cplane_valid_1d & c_start_symbol_1d  == 'd31 & c_slot_id == 'd1) begin
		sec_id_slot1 <= sec_id_slot1 + 1'd1;  
	end else if (cplane_valid_1d & c_start_symbol_1d  == c_start_symbol & c_axc_id_1d == c_axc_id & c_slot_id == 'd1) begin
		sec_id_slot1 <= sec_id_slot1 + 1'd1;
	end else if (cplane_valid_1d & c_slot_id == 'd1) begin
		sec_id_slot1 <= 'd0;
	end
end

assign c_section_id = ( c_slot_id == 'd1) ? sec_id_slot1 : sec_id_slot0;

/* delay for Avalon streaming interface*/
always @(posedge clk_dsp) begin : PIPE_DELAY_DSP
	if (~rst_dsp) begin
		avst_sink_valid_1d		<= 'd0;
		avst_sink_valid_2d		<= 'd0;
		avst_sink_valid_3d		<= 'd0;
		avst_sink_valid_4d		<= 'd0;
		avst_sink_valid_5d		<= 'd0;
		avst_sink_valid_6d		<= 'd0;
		avst_sink_valid_7d		<= 'd0;
		avst_sink_channel_1d	<= 'd0;
		avst_sink_channel_2d	<= 'd0;
		avst_sink_channel_3d	<= 'd0;
		avst_sink_channel_4d	<= 'd0;
		avst_sink_channel_5d	<= 'd0;
		avst_sink_channel_6d	<= 'd0;
		avst_sink_channel_7d	<= 'd0;
		avst_sink_sop_1d		<= 'd0;
		avst_sink_sop_2d		<= 'd0;
		avst_sink_sop_3d		<= 'd0;
		avst_sink_sop_4d		<= 'd0;
		avst_sink_sop_5d		<= 'd0;
		avst_sink_sop_6d		<= 'd0;
		avst_sink_sop_7d		<= 'd0;
		avst_sink_eop_1d		<= 'd0;
		avst_sink_eop_2d		<= 'd0;
		avst_sink_eop_3d		<= 'd0;
		avst_sink_eop_4d		<= 'd0;
		avst_sink_eop_5d		<= 'd0;
		avst_sink_eop_6d		<= 'd0;
		avst_sink_eop_7d		<= 'd0;
		avst_sink_data_1d		<= 'd0;
		avst_sink_data_2d		<= 'd0;
		avst_sink_data_3d		<= 'd0;
		avst_sink_data_4d		<= 'd0;
		avst_sink_data_5d		<= 'd0;
		avst_sink_data_6d		<= 'd0;
		avst_sink_data_7d		<= 'd0;
		ff_rdreq_1d				<= 'd0;
		ff_rdreq_2d				<= 'd0;
		control_start_1d		<= 'd1;	
		control_start_2d		<= 'd1;
		ff_axc_1d				<= 'd0;
		ff_axc_2d				<= 'd0;
		ff_axc_3d				<= 'd0;
		ff_num_section_1d		<= 'd0;
		ff_num_section_2d		<= 'd0;
		ff_num_section_3d		<= 'd0;
		ff_start_prb_1d			<= 'd0;
		ff_start_prb_2d			<= 'd0;
		ff_start_prb_3d			<= 'd0;
		ff_num_prb_1d			<= 'd0;
		ff_num_prb_2d			<= 'd0;
		ff_num_prb_3d			<= 'd0;
		Sym_valid_1d			<= 'd0;
		Sym_valid_2d			<= 'd0;
		Sym_valid_3d			<= 'd0;
		prb_cnt_1d				<= 'd0;
		prb_cnt_2d				<= 'd0;
		prb_cnt_3d				<= 'd0;
		prb_cnt_4d				<= 'd0;
		prb_cnt_5d				<= 'd0;
		re_cnt_1d				<= 'd0;
		re_cnt_2d				<= 'd0;
		re_cnt_3d				<= 'd0;
		re_cnt_4d				<= 'd0;
		re_cnt_5d				<= 'd0;
		control_1d				<= 'd0;
		control_2d				<= 'd0;
		control_3d				<= 'd0;
		cplane_sym_1d           <= 'd0;
		cplane_sym_2d           <= 'd0;
		valid_pos_1d			<= 'd0;
		valid_pos_2d			<= 'd0;
		valid_pos_3d			<= 'd0;
		rden_1d					<= 'd0;
		rden_2d					<= 'd0;
		sym_reset_start_1d		<= 'd0;
		sym_reset_value_1d		<= 'd0;	
	end else begin
		avst_sink_valid_1d		<= avst_sink_valid;
		avst_sink_valid_2d		<= avst_sink_valid_1d;
		avst_sink_valid_3d		<= avst_sink_valid_2d;
		avst_sink_valid_4d		<= avst_sink_valid_3d;
		avst_sink_valid_5d		<= avst_sink_valid_4d;
		avst_sink_valid_6d		<= avst_sink_valid_5d;
		avst_sink_valid_7d		<= avst_sink_valid_6d;
		avst_sink_channel_1d	<= avst_sink_channel;
		avst_sink_channel_2d	<= avst_sink_channel_1d;
		avst_sink_channel_3d	<= avst_sink_channel_2d;
		avst_sink_channel_4d	<= avst_sink_channel_3d;
		avst_sink_channel_5d	<= avst_sink_channel_4d;
		avst_sink_channel_6d	<= avst_sink_channel_5d;
		avst_sink_channel_7d	<= avst_sink_channel_6d;
		avst_sink_sop_1d		<= avst_sink_sop;
		avst_sink_sop_2d		<= avst_sink_sop_1d;
		avst_sink_sop_3d		<= avst_sink_sop_2d;
		avst_sink_sop_4d		<= avst_sink_sop_3d;
		avst_sink_sop_5d		<= avst_sink_sop_4d;
		avst_sink_sop_6d		<= avst_sink_sop_5d;
		avst_sink_sop_7d		<= avst_sink_sop_6d;
		avst_sink_eop_1d		<= avst_sink_eop;
		avst_sink_eop_2d		<= avst_sink_eop_1d;
		avst_sink_eop_3d		<= avst_sink_eop_2d;
		avst_sink_eop_4d		<= avst_sink_eop_3d;
		avst_sink_eop_5d		<= avst_sink_eop_4d;
		avst_sink_eop_6d		<= avst_sink_eop_5d;
		avst_sink_eop_7d		<= avst_sink_eop_6d;
		avst_sink_data_1d		<= avst_sink_data;
		avst_sink_data_2d		<= avst_sink_data_1d;
		avst_sink_data_3d		<= avst_sink_data_2d;
		avst_sink_data_4d		<= avst_sink_data_3d;
		avst_sink_data_5d		<= avst_sink_data_4d;
		avst_sink_data_6d		<= avst_sink_data_5d;
		avst_sink_data_7d		<= avst_sink_data_6d;
		ff_rdreq_1d				<= ff_rdreq;
		ff_rdreq_2d				<= ff_rdreq_1d;
		control_start_1d		<= control_start;
		control_start_2d		<= control_start_1d;
		ff_axc_1d				<= ff_axc;
		ff_axc_2d				<= ff_axc_1d;
		ff_axc_3d				<= ff_axc_2d;
		ff_num_section_1d		<= ff_num_section;
		ff_num_section_2d		<= ff_num_section_1d;
		ff_num_section_3d		<= ff_num_section_2d;
		ff_start_prb_1d			<= ff_start_prb;
		ff_start_prb_2d			<= ff_start_prb_1d;
		ff_start_prb_3d			<= ff_start_prb_2d;
		ff_num_prb_1d			<= ff_num_prb;
		ff_num_prb_2d			<= ff_num_prb_1d;
		ff_num_prb_3d			<= ff_num_prb_2d;
		Sym_valid_1d			<= Sym_valid;
		Sym_valid_2d			<= Sym_valid_1d;
		Sym_valid_3d			<= Sym_valid_2d;
		prb_cnt_1d				<= prb_cnt;
		prb_cnt_2d				<= prb_cnt_1d;
		prb_cnt_3d				<= prb_cnt_2d;
		prb_cnt_4d				<= prb_cnt_3d;
		prb_cnt_5d				<= prb_cnt_4d;
		re_cnt_1d				<= re_cnt;
		re_cnt_2d				<= re_cnt_1d;
		re_cnt_3d				<= re_cnt_2d;
		re_cnt_4d				<= re_cnt_3d;
		re_cnt_5d				<= re_cnt_4d;
		control_1d				<= control;
		control_2d				<= control_1d;
		control_3d				<= control_2d;
		cplane_sym_1d           <= cplane_sym;
		cplane_sym_2d           <= cplane_sym_1d;
		valid_pos_1d			<= valid_pos;
		valid_pos_2d			<= valid_pos_1d;
		valid_pos_3d			<= valid_pos_2d;
		rden_1d					<= rden;
		rden_2d					<= rden_1d;
		sym_reset_start_1d		<= sym_reset_start;
		sym_reset_value_1d		<= sym_reset_value;
	end
end

/* Write conditions for fifo */
assign ff_wrreq = ~ff_wrfull & cplane_valid_2d; 
assign ff_writedata = {c_axc_id_1d,c_section_id,c_num_section_1d,c_num_symbol_1d,c_start_symbol_1d,c_num_prb_1d,c_start_prb_1d};

/* read request generation to read one data to process that information*/
assign ff_rdreq = ~ ff_rdempty & ~control_start & ~sym_reset_start;
assign ff_start_prb 	= ff_readdata[0 +: 9];
assign ff_num_prb		= ff_readdata[9 +: 9];
assign ff_start_symbol	= ff_readdata[18 +: 5];
assign ff_num_symbol	= ff_readdata[23 +: 5];
assign ff_num_section	= ff_readdata[28 +: 8];
assign ff_section_id	= ff_readdata[36 +: 8];
assign ff_axc			= ff_readdata[44 +: $clog2(NUM_ANT)];

/* Fifo to store all c-plane information depth is 512 = (14 symbols * 4 axc's * 8 max no. of sections)
	CDC to convert 390.625MHz to 491.52MHz*/
ff_64i_64o_512d_dc u_ff_64i_64o_512d_dc (
		.wrclk   (clk_eth),   		//   input,   width = 1,            .wrclk
		.wrreq   (ff_wrreq),   		//   input,   width = 1,            .wrreq
		.data    (ff_writedata),    //   input,  width = 32,  fifo_input.datain
		.wrfull  (ff_wrfull),   		//  output,   width = 1,            .wrfull
		.rdclk   (clk_dsp),   		//   input,   width = 1,            .rdclk
		.rdreq   (ff_rdreq),   		//   input,   width = 1,            .rdreq
		.q       (ff_readdata),     //  output,  width = 32, fifo_output.dataout
		.rdempty (ff_rdempty) 		//  output,   width = 1,            .rdempty		
	);

/* control_start register to stop read_request until the read data information is processed*/
always @(posedge clk_dsp) begin : CONTROL_START
	if (~rst_dsp) begin
		control_start <= 'd0;	
	end else if (ff_rdreq) begin
		control_start <= 'd1;
	end else if (cplane_sym == ff_num_symbol) begin
		control_start <= 'd0;	
	end
end

incremental_counter #( .COUNTER_WIDTH(5)) u_cplane_sym
(	.clk			(clk_dsp),
	.rst			(rst_dsp & ~ff_rdreq),
	.start_value	(ff_start_symbol),
	.end_value		(ff_num_symbol),
	.reset_value	('d31),
	.start_condition(ff_rdreq_1d),
	.incr_condition	(control_start),
	.counter		(cplane_sym)
);

assign control = control_start_1d & control_start;

always @(posedge clk_dsp) begin : RAM_WRITE
        if (~rst_dsp) begin
            wren		<= 'd0;
			wraddress 	<= 'd0;
			writedata 	<= 'd0;
        end else if (control) begin
            wren		<= 'd1;
			wraddress 	<= (cplane_sym << SYM_SHIFT)+(ff_axc << AXC_SHIFT)+ff_section_id;
			writedata 	<= {6'b0,ff_num_section,ff_num_prb,ff_start_prb};
		end else if (sym_reset_start_1d) begin
			wren		<= 'd1;
			wraddress 	<= (sym_reset_value_1d << SYM_SHIFT) + reset_cnt;
			writedata 	<= 32'h8007FFFF;
		end else begin
			wren		<= 'd0;
			wraddress 	<= 'd0;
			writedata 	<= 'd0;
		end 
end


always @(posedge clk_dsp) begin : SYM_RESET_START
        if (~rst_dsp) begin
			sym_reset_start 	<= 'd0;
		end else if (reset_cnt == (MAX_NUM_SECTIONS*NUM_ANT)-2) begin
			sym_reset_start 	<= 'd0;
		end else if (sym_reset_enable & ff_rdempty & ~control_start & ~sym_reset_start) begin
			sym_reset_start 	<= 'd1;
		end 
end

always @(posedge clk_dsp) begin : RESET_CNT
        if (~rst_dsp) begin
			reset_cnt <= 'd31;
		end else if (sym_reset_start) begin
			reset_cnt <= reset_cnt + 'd1;
		end 
end

/* integer i,j;
always @(posedge clk_dsp) begin : C_SYM
        if (~rst_dsp) begin
            c_sym 		<= '{default: 'd0};;
			c_numsec 	<= '{default: 'd0};;
			c_startprb 	<= '{default: 'd0};;
			c_numprb 	<= '{default: 'd0};;
        end else begin
			if (control_1d) begin
				c_sym [cplane_sym_1d][ff_axc_1d] 							<= 1'b1;
				c_numsec [cplane_sym_1d][ff_axc_1d] 						<= ff_num_section_1d;
				c_startprb [(cplane_sym_1d*32)+(ff_axc_1d*8)+section_num] 	<= ff_start_prb_1d;
				c_numprb [(cplane_sym_1d*32)+(ff_axc_1d*8)+section_num] 	<= ff_num_prb_1d;
			end
			if ( valid_pos & (axc_cnt == (NUM_ANT-'d1)) ) begin
				for (i=0;i<NUM_ANT;i=i+1) begin
					c_sym [sym_cnt][i] 				<= 1'b0;
					c_numsec [sym_cnt][i] 			<= 8'b0;
					for (j=0;j<MAX_NUM_SECTIONS;j=j+1) begin 
						c_startprb [(sym_cnt*32)+(i*8)+j] 	<= 9'b0; 
						c_numprb [(sym_cnt*32)+(i*8)+j] 	<= 9'b0; 
					end
				end
			end
        end
end */

ram_32i_32o_1024d_sc u_dl_blanking_ram(
		.clock     (clk_dsp			),     	//   input, width = 1,  clock.clk
		.wren      (wren			),      //   input, width = 1,  wren.wren
		.wraddress (wraddress		), 		//   input, width = 10, wraddress.wraddress
		.data      (writedata		),      //   input, width = 32, data.datain
		.rden      (rden			),      //   input, width = 1,  rden.rden
		.rdaddress (rdaddress		), 		//   input, width = 10, rdaddress.rdaddress
		.q         (readdata		)       //   output,width = 32, q.dataout
	);
 
assign valid_pos = avst_sink_valid & (~avst_sink_valid_1d);
assign sym_reset_start_pos = sym_reset_start & (~sym_reset_start_1d);

/* Incremental counter Resourece block */
incremental_counter #( .COUNTER_WIDTH(4)) u_re_cnt
(	.clk			(clk_dsp),
	.rst			(rst_dsp),
	.start_value	('d0),
	.end_value		('d11),
	.reset_value	('d11),
	.start_condition(valid_pos),
	.incr_condition	(avst_sink_valid),
	.counter		(re_cnt)
);

/* Incremental counter PRB */
incremental_counter #( .COUNTER_WIDTH(9)) u_prb_cnt
(	.clk			(clk_dsp),
	.rst			(rst_dsp),
	.start_value	('d0),
	.end_value		('d272),
	.reset_value	('d272),
	.start_condition(valid_pos),
	.incr_condition	(avst_sink_valid & re_cnt == 'd11),
	.counter		(prb_cnt)
);

/* Incremental counter AXC */
incremental_counter #( .COUNTER_WIDTH($clog2(NUM_ANT))) u_axc_cnt
(	.clk			(clk_dsp),
	.rst			(rst_dsp),
	.start_value	('d0),
	.end_value		(NUM_ANT-'d1),
	.reset_value	(NUM_ANT-'d1),
	.start_condition('d0),
	.incr_condition	(valid_pos),
	.counter		(axc_cnt)
);

/* Incremental counter Symbol */
incremental_counter #( .COUNTER_WIDTH($clog2(NUM_SYM))) u_sym_cnt
(	.clk			(clk_dsp),
	.rst			(rst_dsp),
	.start_value	('d0),
	.end_value		(NUM_SYM-1),
	.reset_value	(NUM_SYM-1),
	.start_condition('d0),
	.incr_condition	(valid_pos & (axc_cnt == NUM_ANT-'d1)),
	.counter		(sym_cnt)
);

/* Blank signal generation based on c_sym array formed. signal extened for 1 symbol*/
/* always @(posedge clk_dsp) begin : SYM_VALID
        if (~rst_dsp) begin
            Sym_valid <= 'd0;
        end else if (avst_sink_valid_1d & re_cnt =='d0 & prb_cnt =='d0) begin
            Sym_valid <= c_sym [sym_cnt][axc_cnt];
        end
end  */

/* always @(posedge clk_dsp) begin : CURRENT_SYM_AXC_PLACE
        if (~rst_dsp) begin
            sym_place <= 'd0;
			axc_place <= 'd0;
        end else if (avst_sink_valid_1d) begin
            sym_place <= sym_cnt << SYM_SHIFT;
			axc_place <= axc_cnt << AXC_SHIFT;
        end
end */

always @(posedge clk_dsp) begin : CURRENT_VALUE
        if (~rst_dsp) begin
            current_place <= 'd0;
        end else if (avst_sink_valid_1d) begin
			current_place <= (sym_cnt << SYM_SHIFT) + (axc_cnt << AXC_SHIFT) + current_section;
        end
end

always @(posedge clk_dsp) begin : RAM_READ
        if (~rst_dsp) begin
            rden 	  <= 'd0;
			rdaddress <= 'd0;
        end else if (valid_pos_2d) begin
            rden 	  <= 'd1;
			rdaddress <= current_place;
		end else if (avst_sink_valid_5d & (re_cnt_4d == 'd9)& prb_cnt_4d == u_numprb & u_numsec > 'd0 & current_section <= u_numsec)begin
			rden 	  <= 'd1;
			rdaddress <= current_place;
		end else begin
			rden 	  <= 'd0;
			rdaddress <= 'd0;
        end
end

always @(posedge clk_dsp) begin : RAM_READDATA
        if (~rst_dsp) begin
            u_startprb  <= 'd511;
			u_numprb	<= 'd511;
			u_numsec 	<= 'd0;
			blanking	<= 'd1;
        end else if (rden_2d) begin
            u_startprb  <= readdata[8:0];
			u_numprb 	<= readdata[17:9];
			u_numsec 	<= readdata[25:18];
			blanking	<= readdata[31];
        end
end

always @(posedge clk_dsp) begin : PRB_VALID
        if (~rst_dsp) begin
            Prb_valid <= 'd0;
		end else if (blanking) begin
			Prb_valid <= 'd0;
        end else if (avst_sink_valid_6d & (re_cnt_5d == 'd0) &(prb_cnt_5d >= u_startprb & prb_cnt_4d <= u_numprb) ) begin
            Prb_valid <= 'd1;
		end else if (avst_sink_valid_6d & (re_cnt_5d == 'd0))begin
			Prb_valid <= 'd0;
        end
end

always @(posedge clk_dsp) begin : U_SECTION
        if (~rst_dsp) begin
            current_section <= 'd0;
        end else if (valid_pos) begin
            current_section <= 'd0;
		end else if (avst_sink_valid_6d & (re_cnt_5d == 'd0)& prb_cnt_5d == u_numprb & current_section < u_numsec)  begin
			current_section <= current_section  + 'd1;
        end
end 

assign last_sample = (~avst_sink_valid_6d & avst_sink_valid_7d ) & (axc_cnt == NUM_ANT-1);

always @(posedge clk_dsp) begin : SYM_RESET
        if (~rst_dsp) begin
            sym_reset_enable <= 'd0;
			sym_reset_value	 <= 'd31;
        end else if (last_sample) begin
            sym_reset_enable <= 'd1;
			sym_reset_value	 <= sym_cnt;
        end else if (reset_cnt == (MAX_NUM_SECTIONS*NUM_ANT)-2) begin
			sym_reset_enable <= 'd0;
			sym_reset_value	 <= 'd31;
		end
end 

assign avst_sink_ready	= 1'd1;

assign avst_src_valid	= avst_sink_valid_7d;
assign avst_src_data	= ( Prb_valid ) ? avst_sink_data_7d :  32'b0 ;
assign avst_src_channel	= avst_sink_channel_7d;	
assign avst_src_sop		= avst_sink_sop_7d;
assign avst_src_eop		= avst_sink_eop_7d;

endmodule
