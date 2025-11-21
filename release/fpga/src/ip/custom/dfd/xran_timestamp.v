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
 
module xran_timestamp(
    
    clk_csr     ,
    rst_csr_n   ,
    
    clk_eth     ,
    rst_eth_n   ,
	 
	clk_ecpri_rx   ,
	rst_ecpri_rx_n ,
    
    csr_address                 ,
    csr_write                   ,
    csr_writedata               ,
    csr_readdata                ,
    
    avst_sink1_valid             ,
    avst_sink1_data              ,
    avst_sink1_channel           ,
    avst_sink1_startofpacket     ,
    avst_sink1_endofpacket       ,

    avst_sink2_valid             ,
    avst_sink2_data              ,
    avst_sink2_channel           ,
    avst_sink2_startofpacket     ,
    avst_sink2_endofpacket       ,
    
    frame_status                ,
	
	tod                          ,
    
    ram_read                    ,
    ram_readdata                    
);

parameter DATAWIDTH =   64 ;

input   clk_csr     ;
input   rst_csr_n   ;
input   clk_eth     ;
input   rst_eth_n   ;

input clk_ecpri_rx   ;  
input rst_ecpri_rx_n ;
 
input   [3 :0]      csr_address         ;
input               csr_write           ;
input   [31:0]      csr_writedata       ;
output  [31:0]      csr_readdata        ;


input                       avst_sink1_valid             ;
input   [DATAWIDTH-1:0]     avst_sink1_data              ;
input   [7:0 ]              avst_sink1_channel           ;
input                       avst_sink1_startofpacket     ;
input                       avst_sink1_endofpacket       ;


input                       avst_sink2_valid             ;
input   [DATAWIDTH-1:0]     avst_sink2_data              ;
input   [7:0 ]              avst_sink2_channel           ;
input                       avst_sink2_startofpacket     ;
input                       avst_sink2_endofpacket       ;


input   [67:0]      frame_status                ;

input   [95:0]      tod                         ;

input               ram_read                    ;
output  [63:0]      ram_readdata                ;


reg     [31:0]      csr_readdata                ;

reg                 ram_read_1d                 ;
reg                 wr_enable                   ;
reg                 wrreq                       ;
reg                 wrreq_1d                    ;
reg                 wrreq_2d                    ;
reg                 wrreq_3d                    ;
reg                 wrreq_4d                    ;
reg     [14:0]      wraddress                   ;
reg     [14:0]      wraddress_1d                ;
reg     [14:0]      wraddress_2d                ;
reg     [14:0]      wraddress_3d                ;
reg     [14:0]      wraddress_4d                ;

wire    [13:0]      ram_address                 ;
wire    [63:0]      ram_q                       ;
reg     [63:0]      ram_readdata                ;

reg     [31:0]      control                     ;
reg     [31:0]      control_1d                  ;
reg     [31:0]      control_2d                  ;
reg     [31:0]      timestamp_mux               ;
reg     [31:0]      timestamp_mux_1d            ;
reg     [31:0]      timestamp_mux_2d            ;
reg     [31:0]      mux_config                  ;
reg     [31:0]      mux_config_1d               ;
reg     [31:0]      mux_config_2d               ;
reg     [31:0]      frame_config                ;
reg     [31:0]      frame_config_1d             ;
reg     [31:0]      frame_config_2d             ;


wire    [1:0 ]      bit_slice_select            ;
wire    [3:0 ]      interface_select            ;
wire    [3:0 ]      channel_select              ;

wire    [14:0]      sample_cnt_15               ;
wire    [3:0]       sym_cnt_15                  ;
wire    [3:0]       sfn_cnt                     ;
wire                rfn_cnt                     ;

reg                 sample_cnt_15_sel           ;
reg                 rfn_sfn_sym_cnt_sel         ;
reg                 sym_cnt_15_sel              ;
reg                 rfn_sfn_cnt_sel             ;
reg                 sfn_cnt_sel                 ;
reg                 rfn_cnt_sel                 ;

wire                capture_start               ;

reg     [67:0]      frame_status_1d             ;
reg     [67:0]      frame_status_2d             ;
reg     [67:0]      frame_status_3d             ;
reg     [67:0]      frame_status_4d             ;

reg     [95:0]      tod_1d                      ;
reg     [95:0]      tod_2d                      ;
reg     [95:0]      tod_3d                      ;
reg     [95:0]      tod_4d                      ;
reg     [95:0]      tod_5d                      ;

reg                         avst_sink_valid_1d         ;
reg                         avst_sink_valid_2d         ;
reg                         avst_sink_valid_3d         ;
reg                         avst_sink_valid_4d         ;
reg                         avst_sink_valid_5d         ;
reg     [DATAWIDTH-1:0]     avst_sink_data_1d          ;
reg     [DATAWIDTH-1:0]     avst_sink_data_2d          ;
reg     [DATAWIDTH-1:0]     avst_sink_data_3d          ;
reg     [DATAWIDTH-1:0]     avst_sink_data_4d          ;
reg     [DATAWIDTH-1:0]     avst_sink_data_5d          ;
reg     [7:0 ]              avst_sink_channel_1d       ;
reg     [7:0 ]              avst_sink_channel_2d       ;
reg                         avst_sink_startofpacket_1d ;
reg                         avst_sink_startofpacket_2d ;
reg                         avst_sink_endofpacket_1d   ;
reg                         avst_sink_endofpacket_2d   ;
reg     [15:0]              avst_sink_valid_count      ;
reg     [15:0]              avst_sink_valid_count_1d   ;


wire    [12:0]      ram_rdusedw                 ;
wire                ram_rdempty                 ;
wire                ram_wrfull                  ;

reg     [63:0]      avst_sink_data_mux          ;
reg     [63:0]      avst_sink_data_mux_1d       ;
reg     [63:0]      avst_sink_data_mux_2d       ;
reg     [63:0]      avst_sink_data_mux_3d       ;

wire                       avst_sink_valid             ;
wire   [DATAWIDTH-1:0]     avst_sink_data              ;
wire   [7:0 ]              avst_sink_channel           ;
wire                       avst_sink_startofpacket     ;
wire                       avst_sink_endofpacket       ;

assign  capture_start   = control_2d[0]         ;

assign   avst_sink_valid            = timestamp_mux_2d[0] ?  avst_sink1_valid         : avst_sink2_valid             ;
assign   avst_sink_data             = timestamp_mux_2d[0] ?  avst_sink1_data          : avst_sink2_data              ;
assign   avst_sink_channel          = timestamp_mux_2d[0] ?  avst_sink1_channel       : avst_sink2_channel           ;
assign   avst_sink_startofpacket    = timestamp_mux_2d[0] ?  avst_sink1_startofpacket : avst_sink2_startofpacket     ;
assign   avst_sink_endofpacket      = timestamp_mux_2d[0] ?  avst_sink1_endofpacket   : avst_sink2_endofpacket       ;


// HPS Address Decoding
always @ (posedge clk_csr or negedge rst_csr_n)
begin
    if (~rst_csr_n)
    begin
        control         <=  32'b0  ;
        timestamp_mux   <=  32'b0  ;
    end
    else  
    begin
        case(csr_address)
        4'd0: 
        begin
            if(csr_write)
                control     <= csr_writedata    ;
            csr_readdata    <= control          ;
        end
        4'd1: 
        begin
            csr_readdata    <= {18'b0,ram_rdempty,ram_rdusedw} ;
        end
        4'd2: 
        begin
            if(csr_write)
                timestamp_mux <= csr_writedata    ;
            csr_readdata    <= timestamp_mux      ;
        end
        endcase
    end
end




always @ (posedge clk_eth)
begin : PIPE_DELAY
    if(~rst_eth_n) 
    begin
        control_1d                  <=  32'b0   ;
        control_2d                  <=  32'b0   ;
        timestamp_mux_1d            <=  32'b0   ;
        timestamp_mux_2d            <=  32'b0   ;
        frame_status_1d             <=  67'b0   ;
        frame_status_2d             <=  67'b0   ;
        frame_status_3d             <=  67'b0   ;
        frame_status_4d             <=  67'b0   ;
		tod_1d                      <=  96'b0   ;
		tod_2d                      <=  96'b0   ;
		tod_3d                      <=  96'b0   ;
		tod_4d                      <=  96'b0   ;
		tod_5d                      <=  96'b0   ;
        avst_sink_valid_1d          <=  1'b0    ; 
        avst_sink_valid_2d          <=  1'b0    ;
        avst_sink_valid_3d          <=  1'b0    ;
        avst_sink_valid_4d          <=  1'b0    ;
        avst_sink_valid_5d          <=  1'b0    ;
        avst_sink_data_1d           <=  {DATAWIDTH{1'b0}}   ;
        avst_sink_data_2d           <=  {DATAWIDTH{1'b0}}   ;
        avst_sink_data_3d           <=  {DATAWIDTH{1'b0}}   ;
        avst_sink_data_4d           <=  {DATAWIDTH{1'b0}}   ;
        avst_sink_data_5d           <=  {DATAWIDTH{1'b0}}   ;
        avst_sink_channel_1d        <=  8'b0    ;
        avst_sink_channel_2d        <=  8'b0    ;
        avst_sink_startofpacket_1d  <=  1'b0    ;
        avst_sink_startofpacket_2d  <=  1'b0    ;
        avst_sink_endofpacket_1d    <=  1'b0    ;
        avst_sink_endofpacket_2d    <=  1'b0    ;
        wrreq_1d                    <=  1'b0    ;
        wrreq_2d                    <=  1'b0    ;
        wrreq_3d                    <=  1'b0    ;
        wrreq_4d                    <=  1'b0    ;
          
        avst_sink_data_mux_1d       <=  64'b0   ;
        avst_sink_data_mux_2d       <=  64'b0   ;
        avst_sink_data_mux_3d       <=  64'b0   ;
        avst_sink_valid_count_1d    <=  16'b0   ;
    end
    else
    begin
        control_1d                  <=  control                     ;
        control_2d                  <=  control_1d                  ;
        timestamp_mux_1d            <=  timestamp_mux               ;
        timestamp_mux_2d            <=  timestamp_mux_1d            ;
        frame_status_1d             <=  frame_status                ;
        frame_status_2d             <=  frame_status_1d             ;
        frame_status_3d             <=  frame_status_2d             ;
        frame_status_4d             <=  frame_status_3d             ;
		tod_1d                      <=  tod                         ;
		tod_2d                      <=  tod_1d                         ;
		tod_3d                      <=  tod_2d                         ;
		tod_4d                      <=  tod_3d                         ;
		tod_5d                      <=  tod_4d                         ;
        avst_sink_valid_1d          <=  avst_sink_valid             ; 
        avst_sink_valid_2d          <=  avst_sink_valid_1d          ;
        avst_sink_valid_3d          <=  avst_sink_valid_2d          ;
        avst_sink_valid_4d          <=  avst_sink_valid_3d          ;
        avst_sink_valid_5d          <=  avst_sink_valid_4d          ;
        avst_sink_data_1d           <=  avst_sink_data              ;
        avst_sink_data_2d           <=  avst_sink_data_1d           ;
        avst_sink_data_3d           <=  avst_sink_data_2d           ;
        avst_sink_data_4d           <=  avst_sink_data_3d           ;
        avst_sink_data_5d           <=  avst_sink_data_4d           ;
        avst_sink_channel_1d        <=  avst_sink_channel           ;
        avst_sink_channel_2d        <=  avst_sink_channel_1d        ;
        avst_sink_startofpacket_1d  <=  avst_sink_startofpacket     ;
        avst_sink_startofpacket_2d  <=  avst_sink_startofpacket_1d  ;
        avst_sink_endofpacket_1d    <=  avst_sink_endofpacket       ;
        avst_sink_endofpacket_2d    <=  avst_sink_endofpacket_1d    ;
        wrreq_1d                    <=  wrreq                       ;
        wrreq_2d                    <=  wrreq_1d                    ;
        wrreq_3d                    <=  wrreq_2d                    ;
        wrreq_4d                    <=  wrreq_3d                    ;
       
        avst_sink_data_mux_1d       <=  avst_sink_data_mux          ;
        avst_sink_data_mux_2d       <=  avst_sink_data_mux_1d       ;
        avst_sink_data_mux_3d       <=  avst_sink_data_mux_2d       ;
        avst_sink_valid_count_1d    <=  avst_sink_valid_count       ;
    end
end

always @ (posedge clk_csr or negedge rst_csr_n )
begin : CSR_PIPE_DELAY
    if (rst_csr_n == 1'b0)
		begin
			ram_read_1d	 	<=   1'b0   ;
			ram_readdata  <=  64'b0   ; 
		end
    else 
		begin
		  ram_read_1d  <=  ram_read	;
		  ram_readdata <=  ram_q ;
		end
end


always @ (posedge clk_eth or negedge rst_eth_n )
begin : WRITE_COUNT
    if (rst_eth_n == 1'b0)
        avst_sink_valid_count   <= 16'b0 ; 
    else if (avst_sink_valid_2d & avst_sink_endofpacket_2d)
        avst_sink_valid_count   <= 16'b0 ; 
    else if (avst_sink_valid_2d)
        avst_sink_valid_count   <=  avst_sink_valid_count + 1'b1;
end


always @ (posedge clk_eth or negedge rst_eth_n )
begin : WRITE_ENABLE
    if (rst_eth_n == 1'b0)
        wr_enable   <= 1'b0 ; 
    else if (avst_sink_valid_2d & (avst_sink_valid_count==16'd2))
        wr_enable   <= capture_start ;
    else if (avst_sink_valid_2d & (avst_sink_valid_count==16'd9))
        wr_enable   <= 1'b0 ;
end


always @ (posedge clk_eth or negedge rst_eth_n )
begin : WRITE_REQ
    if (rst_eth_n == 1'b0)
        wrreq   <= 1'b0 ; 
    else
        wrreq   <= avst_sink_valid_3d & wr_enable ;
end


always @ (posedge clk_eth or negedge rst_eth_n )
begin : WRITE_Data_mux
    if (rst_eth_n == 1'b0)
        avst_sink_data_mux  <= 64'b0 ; 
    else if(avst_sink_valid_count_1d==16'd2)
        avst_sink_data_mux  <= avst_sink_data_3d;
    else if(avst_sink_valid_count_1d==16'd3)
        avst_sink_data_mux  <= avst_sink_data_3d;
	else if(avst_sink_valid_count_1d==16'd4)
        avst_sink_data_mux  <= avst_sink_data_3d;
	else if(avst_sink_valid_count_1d==16'd5)
        avst_sink_data_mux  <= avst_sink_data_3d;
    else if (avst_sink_valid_count_1d==16'd6)
        avst_sink_data_mux  <= frame_status_4d[63:0]  ; //lte_sf_cnt,rfn_cnt,sfn_cnt,sym_cnt_15,sym_cnt_14,sample_cnt_15,sample_cnt_14
	else if (avst_sink_valid_count_1d==16'd7)	
	    avst_sink_data_mux  <= {16'b0,tod_5d[95:48]}  ;
	else if (avst_sink_valid_count_1d==16'd8)
        avst_sink_data_mux  <= {16'b0,tod_5d[47:0]}  ;	
	else 
         avst_sink_data_mux  <= 64'b0 ; 	
end


ff_64i_64o_4096kd u_ff_64i_64o_4096kd
(
    .data       (avst_sink_data_mux_2d  ),   
    .wrreq      (wrreq_2d               ),   
    .rdreq      (ram_read & ~ram_read_1d),   
    .wrclk      (clk_eth                ),   
    .rdclk      (clk_csr                ),   
    .aclr       (~capture_start         ),   
    .q          (ram_q                  ),   
    .rdusedw    (ram_rdusedw            ),   
    .rdempty    (ram_rdempty            ),   
    .wrfull     (ram_wrfull             )    
);


endmodule
