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
module pb_st(
   clk,
   rst_n,
   sync_in,
   //  MEM WR Interface
   mem_address,
   mem_chipselect,
   mem_read,
   mem_readdata,
   mem_write,
   mem_writedata,
   mem_byteenable,
   mem_waitrequest,
   // Stream Output
   avst_source_valid,
   avst_source_data,
   avst_source_ready,
   avst_source_endofpacket,
   avst_source_startofpacket,
   avst_source_channel,
   // Light weight Memory Interface
   clk_lw_in,
   reset_lw_in_n,
   Pb_enable

);
//`include "def_param.vh"


input clk;
input rst_n;
input sync_in;
input clk_lw_in;
input reset_lw_in_n;


// Traffic MM Slave
input   [16:0]     mem_address;
input              mem_chipselect;
input              mem_read;
input              mem_write;
input   [31:0]     mem_writedata;
input   [3:0]      mem_byteenable;
output  [31:0]     mem_readdata;
output             mem_waitrequest;
input wire Pb_enable;

// Stream Output
output        avst_source_valid;
output [31:0] avst_source_data;
output [7:0]  avst_source_channel;
output        avst_source_endofpacket;
output        avst_source_startofpacket;
input         avst_source_ready;

//Declaration
reg [31:0]               readdata                              ;

reg [17:0]               mem_rd_address                        ;
reg [17:0]               mem_rd_address_1d                     ;
reg [17:0]               mem_rd_address_2d                     ;
reg [31:0]               st_readdata_1d                        ;
reg [31:0]               st_readdata_2d                        ;
reg                      ram_rd_req_1d                         ;
reg                      ram_rd_req_2d                         ;
reg                      ram_rd_req_3d                         ;
reg                      ram_rd_req_4d                         ;
reg                      sync_start                            ;
reg                      sync_in_1d                            ;
reg                      sync_in_2d                            ;
wire [31:0]              st_readdata                           ;
wire [31:0]              avst_source_data                      ;
wire [31:0]              mem_readdata                          ;
wire                     avst_source_valid                     ;
wire                     ram_rd_req                            ;
wire                     sync_in_pul                           ;
wire                     pattern_ena                           ;
reg	[2:0]				 axc_count							   ;
reg	[2:0]				 axc_count_1d						   ;
reg	[2:0]				 axc_count_2d						   ;
reg	[2:0]				 axc_count_3d						   ;
reg	[2:0]				 axc_count_4d						   ;

`ifdef SHORT_PRACH_FORMAT
   ram_32i_32o_122kd_dc u_ram_32i_32o_122kd_dc (
      .data      (mem_writedata         ),   //  ram_input.datain
      .wraddress (mem_address [16:0]    ),   //  .wraddress
      .rdaddress (mem_rd_address [16:0] ),   //  .rdaddress
      .wren      (mem_write             ),   //  .wren
      .wrclock   (clk_lw_in             ),   //  .wrclock
      .rdclock   (clk                   ),   //  .rdclock
      .rden      (ram_rd_req            ),   //  .rden
      .rd_aclr   (~rst_n                ),   //  .rd_aclr
      .q         (st_readdata           )    //  ram_output.dataout
   );
`else  
   ram_32i_32o_122kd_dc_long u_ram_32i_32o_122kd_dc_long (
      .data      (mem_writedata         ),   //  ram_input.datain
      .wraddress (mem_address [16:0]    ),   //  .wraddress
      .rdaddress (mem_rd_address [16:0] ),   //  .rdaddress
      .wren      (mem_write             ),   //  .wren
      .wrclock   (clk_lw_in             ),   //  .wrclock
      .rdclock   (clk                   ),   //  .rdclock
      .rden      (ram_rd_req            ),   //  .rden
      .rd_aclr   (~rst_n                ),   //  .rd_aclr
      .q         (st_readdata           )    //  ram_output.dataout
   );
`endif

// CB Interface
assign mem_readdata    =  32'd0      ;
assign mem_waitrequest = 'd0;


//Pipe delay
always @ (posedge clk)
begin
   if(~rst_n)
   begin
     st_readdata_1d           <= 32'b0;
     st_readdata_2d           <= 32'b0;
     mem_rd_address_1d        <= 16'b0;
     mem_rd_address_2d        <= 16'b0;
     ram_rd_req_1d            <= 1'b0;
     ram_rd_req_2d            <= 1'b0;
     ram_rd_req_3d            <= 1'b0;
     ram_rd_req_4d            <= 1'b0;
     sync_in_1d               <= 1'b0;
     sync_in_2d               <= 1'b0;
	 axc_count_1d			  <= 'd0;
	 axc_count_2d			  <= 'd0;
	 axc_count_3d			  <= 'd0;
	 axc_count_4d			  <= 'd0;
   end
   else
   begin
     mem_rd_address_1d         <= mem_rd_address   ;
     mem_rd_address_2d         <= mem_rd_address_1d;
     ram_rd_req_1d             <= ram_rd_req       ;
     ram_rd_req_2d             <= ram_rd_req_1d    ;
     ram_rd_req_3d             <= ram_rd_req_2d    ;
     ram_rd_req_4d             <= ram_rd_req_3d    ;
     sync_in_1d                <= sync_in			;
     sync_in_2d                <= sync_in_1d		;
     st_readdata_1d            <= st_readdata		;
     st_readdata_2d            <= st_readdata_1d	;
	 axc_count_1d			  <= axc_count			;
	 axc_count_2d			  <= axc_count_1d		;
	 axc_count_3d			  <= axc_count_2d		;
	 axc_count_4d			  <= axc_count_3d		;
   end
end
   
    
    //Assignments
    assign pattern_ena       =  Pb_enable		;     
    assign ram_rd_req        =  sync_start & avst_source_ready	;
    assign sync_in_pul       = sync_in_1d & (~sync_in_2d)		;

   // Buffer Sync Start
   always @ (posedge clk) 
   begin
      if (~rst_n)
         sync_start <= 1'b0;
     else if (pattern_ena  == 1'b0 ) 
         sync_start <= 1'b0;
     else if (sync_in_pul == 1'b1)
         sync_start <= 1'b1;
    end

   // Buffer read Address 
   always @ (posedge clk) 
   begin
      if (~rst_n)
         mem_rd_address <= 16'b0;
     else if (sync_start  == 1'b0 ) 
         mem_rd_address <= 16'b0;
     else if ((mem_rd_address >= 17'd122879) & (ram_rd_req == 1'b1) & (axc_count == 3'd3))
	     mem_rd_address <= 16'b0;
     else if (ram_rd_req == 1'b1 & axc_count == 3'd3) 
         mem_rd_address <= mem_rd_address + 1'b1;
    end
	
   always @ (posedge clk) 
   begin
      if (~rst_n)
         axc_count <= 3'd0;
	  else if (axc_count == 3'd3 & ram_rd_req == 1'b1)
		 axc_count <= 3'd0;
	  else if( ram_rd_req == 'd1)
		 axc_count <= axc_count + 3'd1;
    end
	

// Streaming Output
assign avst_source_data            = st_readdata_1d       ;
assign avst_source_valid           = ram_rd_req_3d        ;
assign avst_source_channel		   = {5'd0, axc_count_3d} ;

endmodule
