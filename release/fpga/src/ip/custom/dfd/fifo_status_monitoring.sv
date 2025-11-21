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
`include "struct_typedef.sv"
 
module fifo_status_monitoring (
   
   clk_csr                                ,
   rst_csr_n                              ,
   clk_eth_xran_ul                        ,
   rst_eth_xran_n_ul                      ,
   rst_soft_n                             ,
   csr_address                            ,
   csr_write                              , 
   csr_writedata                          ,
   csr_read				                  ,
   csr_readdata                           ,
   prach_ant_mux_fifo_full                ,
   ul_arb_output_fifo_full                ,
   cu_coupling_status                     ,
   fifo_full_intr                         ,
   fifo_full_intr_clear                   ,
   fifo_full_intr_mask 
);


input                  clk_csr          ;
input                  rst_csr_n        ;
input                  clk_eth_xran_ul  ;
input                  rst_eth_xran_n_ul;
input                  rst_soft_n       ;

input      [3 :0]      csr_address      ;
input                  csr_write        ;
input                  csr_read         ;
input      [31:0]      csr_writedata    ;
output reg [31:0]      csr_readdata     ;

input prach_fifo_full prach_ant_mux_fifo_full ;
input wire 		       ul_arb_output_fifo_full              ;
input      [31:0]      cu_coupling_status                   ;
output                 fifo_full_intr      					;
input                  fifo_full_intr_clear					;
input                  fifo_full_intr_mask 					;
 
//input wire [1:0]       ul_ant_mux_sc_fifo_full              ;
//input wire [1:0]       ul_ant_mux_sc_fifo_full_time_ref 	  ;
//input wire 		     ul_ant_mux_output_fifo_full          ;


reg [11:0]             fifo_status                          ;
reg [11:0]             fifo_status_1d                       ;
reg [11:0]             fifo_status_2d                       ;

reg 	               csr_write_1d                         ;
reg 	               csr_write_2d                         ;

reg [31:0]             csr_writedata_1d                     ;
reg [31:0]             csr_writedata_2d                     ;

wire 									rst_eth_n_ul_sync										;
reg										rst_eth_n_ul_1d											;
reg										rst_eth_n_ul_2d											;
reg										rst_eth_n_ul_3d											;
reg										rst_eth_n_ul_4d											;

reg										rst_eth_n_ul_2d_dup1									;
reg										rst_eth_n_ul_2d_dup2									;

reg 									rst_eth_n_ul_3d_dup1									;
reg 									rst_eth_n_ul_4d_dup1									;

reg 									rst_eth_n_ul_3d_dup2									;
reg 									rst_eth_n_ul_4d_dup2									;

reg 									rst_eth_n_ul_3d_dup3									;
reg 									rst_eth_n_ul_4d_dup3									;

reg 									rst_eth_n_ul_5d_dup1									;
reg 									rst_eth_n_ul_6d_dup1									;

reg 									rst_eth_n_ul_5d_dup2									;
reg 									rst_eth_n_ul_6d_dup2									;

reg 									rst_eth_n_ul_5d_dup3									;
reg 									rst_eth_n_ul_6d_dup3									;

reg 									rst_eth_n_ul_5d_dup4									;
reg 									rst_eth_n_ul_6d_dup4									;

reg 									rst_eth_soft_n_1d										;
reg 									rst_eth_soft_n_1d_dup1									;
reg 									rst_eth_soft_n_2d										;
reg 									rst_eth_soft_n_3d_dup1									;
reg 									rst_eth_soft_n_4d_dup1									;
reg										rst_eth_soft_n_3d_dup2									;
reg 									rst_eth_soft_n_4d_dup2									;
reg 									rst_eth_soft_n_3d_dup3									;
reg 									rst_eth_soft_n_4d_dup3									;
reg 									rst_eth_soft_n_5d_dup3									;
reg 									rst_eth_soft_n_6d_dup3									;

wire                  cu_plane_coupling_pusch_sc_fifo_full       ;     
wire                  cu_plane_coupling_pusch_ram_write_full     ;
wire                  cu_plane_coupling_pusch_output_fifo_full   ;
wire                  cu_plane_coupling_prach_sc_fifo_full       ;     
wire                  cu_plane_coupling_prach_ram_write_full     ;
wire                  cu_plane_coupling_prach_output_fifo_full   ;

altera_reset_synchronizer
#(
    .ASYNC_RESET(1),
    .DEPTH      (4)
) wrapper_eth_ul_rst_ctrl
(
    .reset_in   (~rst_eth_xran_n_ul     ),
    .clk        (clk_eth_xran_ul        ), 
    .reset_out  (rst_eth_n_ul_sync 		)
);

always @(posedge clk_eth_xran_ul)
	begin
	    rst_eth_n_ul_1d 		<= ~rst_eth_n_ul_sync;
		rst_eth_n_ul_2d 		<= rst_eth_n_ul_1d;	
		rst_eth_n_ul_3d 		<= rst_eth_n_ul_2d;
		rst_eth_n_ul_4d 		<= rst_eth_n_ul_3d;
	end
	
always @(posedge clk_eth_xran_ul)
	begin
	    rst_eth_n_ul_3d_dup1  <= rst_eth_n_ul_2d;
		rst_eth_n_ul_4d_dup1  <= rst_eth_n_ul_3d_dup1;
		 
   		rst_eth_n_ul_3d_dup2  <= rst_eth_n_ul_2d;
		rst_eth_n_ul_4d_dup2  <= rst_eth_n_ul_3d_dup2;
		    
		rst_eth_n_ul_3d_dup3  <= rst_eth_n_ul_2d;
		rst_eth_n_ul_4d_dup3  <= rst_eth_n_ul_3d_dup3;					
	end	
	
always @(posedge clk_eth_xran_ul)
	begin
	    rst_eth_n_ul_5d_dup1  <= rst_eth_n_ul_4d;
		rst_eth_n_ul_6d_dup1  <= rst_eth_n_ul_5d_dup1;
		 
   		rst_eth_n_ul_5d_dup2  <= rst_eth_n_ul_4d;
		rst_eth_n_ul_6d_dup2  <= rst_eth_n_ul_5d_dup2;
		    
		rst_eth_n_ul_5d_dup3  <= rst_eth_n_ul_4d;
		rst_eth_n_ul_6d_dup3  <= rst_eth_n_ul_5d_dup3;	

		rst_eth_n_ul_5d_dup4  <= rst_eth_n_ul_4d;
		rst_eth_n_ul_6d_dup4  <= rst_eth_n_ul_5d_dup4;	
	
	end	
	
always @(posedge clk_eth_xran_ul)
	begin
		rst_eth_soft_n_1d 		<= rst_soft_n;
		rst_eth_soft_n_1d_dup1 	<= rst_soft_n;
		
		rst_eth_soft_n_2d 		<= rst_eth_soft_n_1d;
	
		rst_eth_soft_n_3d_dup1   <= rst_eth_soft_n_2d;
		rst_eth_soft_n_4d_dup1   <= rst_eth_soft_n_3d_dup1;
			
		rst_eth_soft_n_3d_dup2   <= rst_eth_soft_n_2d;
		rst_eth_soft_n_4d_dup2  	<= rst_eth_soft_n_3d_dup2;
			
		rst_eth_soft_n_3d_dup3   <= rst_eth_soft_n_2d;
		rst_eth_soft_n_4d_dup3   <= rst_eth_soft_n_3d_dup3;		
		
		rst_eth_soft_n_5d_dup3   <= rst_eth_soft_n_4d_dup3;
		rst_eth_soft_n_6d_dup3   <= rst_eth_soft_n_5d_dup3;	
	end	

assign                 cu_plane_coupling_pusch_sc_fifo_full       =  cu_coupling_status[3]  ;     
assign                 cu_plane_coupling_pusch_ram_write_full     =  cu_coupling_status[8]  ;
assign                 cu_plane_coupling_pusch_output_fifo_full   =  cu_coupling_status[9]  ;
assign                 cu_plane_coupling_prach_sc_fifo_full       =  cu_coupling_status[19] ;     
assign                 cu_plane_coupling_prach_ram_write_full     =  cu_coupling_status[24] ;
assign                 cu_plane_coupling_prach_output_fifo_full   =  cu_coupling_status[25] ;

assign  fifo_full_intr = (fifo_full_intr_clear | ( fifo_full_intr_mask )) ? 0 : (|fifo_status_2d) ;

// HPS Address Decoding

always @ (posedge clk_csr)
begin : PIPE_DELAY_CSR
    if(~rst_csr_n) 
    begin
        fifo_status_1d          <=  12'b0   				;
        fifo_status_2d          <=  12'b0   				;
    end
    else
    begin
        fifo_status_1d          <=  fifo_status         	;
        fifo_status_2d          <=  fifo_status_1d      	;
    end
end

always @ (posedge clk_csr)
begin : FIFO_STATUS_READ
    if (~rst_csr_n)
    begin
        csr_readdata            <=  12'b0  					;
    end
    else  
    begin
        case(csr_address)
			4'd0: 
			begin
				if (csr_read)
					csr_readdata   <= fifo_status_2d		;
			end
        endcase
    end
end

always @ (posedge clk_eth_xran_ul)
begin : PIPE_DELAY_ETH
    if(~(rst_eth_n_ul_6d_dup4 & (~rst_eth_soft_n_6d_dup3))) 
    begin
        csr_write_1d          <=  1'b0   			;
        csr_write_2d          <=  1'b0   			;
        csr_writedata_1d      <=  32'b0  			;
        csr_writedata_2d      <=  32'b0  			;
    end
    else
    begin
        csr_write_1d          <=  csr_write         ;
        csr_write_2d          <=  csr_write_1d      ;
		csr_writedata_1d      <=  csr_writedata	    ;
        csr_writedata_2d      <=  csr_writedata_1d	;
    end
end

always @ (posedge clk_eth_xran_ul)
begin : FIFO_STATUS_SIGNAL_LATCH
    if (~(rst_eth_n_ul_6d_dup4 & (~rst_eth_soft_n_6d_dup3)))
    begin
        fifo_status         <=  12'b0  				;
    end		
	else if (csr_write_2d)
		fifo_status         <= csr_writedata_2d		;
    else  
    begin
      /*if( ul_ant_mux_sc_fifo_full[0])
            fifo_status[0]        <= 1'b1    ;
		if (ul_ant_mux_sc_fifo_full_time_ref[0])
			fifo_status[1]        <= 1'b1    ;			
		if (ul_ant_mux_sc_fifo_full [1])
			fifo_status[2]        <= 1'b1    ;
		if (ul_ant_mux_sc_fifo_full_time_ref[1])
			fifo_status[3]        <= 1'b1    ;
		if (ul_ant_mux_output_fifo_full)
			fifo_status[4]        <= 1'b1    ;*/	
		if (cu_plane_coupling_pusch_sc_fifo_full )
			fifo_status[0]        <= 1'b1    ;
		if (cu_plane_coupling_pusch_ram_write_full)
			fifo_status[1]        <= 1'b1    ;
		if (cu_plane_coupling_pusch_output_fifo_full)
			fifo_status[2]        <= 1'b1    ;
		if (cu_plane_coupling_prach_sc_fifo_full )
			fifo_status[3]        <= 1'b1    ;
		if (cu_plane_coupling_prach_ram_write_full)
			fifo_status[4]        <= 1'b1    ;
		if (cu_plane_coupling_prach_output_fifo_full)
			fifo_status[5]        <= 1'b1    ;
		if (prach_ant_mux_fifo_full.prach_ant_mux_sc_fifo_full[0])
			fifo_status[6]        <= 1'b1    ;
		if (prach_ant_mux_fifo_full.prach_ant_mux_sc_fifo_full_time_ref[0])
			fifo_status[7]        <= 1'b1    ;
		if (prach_ant_mux_fifo_full.prach_ant_mux_sc_fifo_full[1])
			fifo_status[8]        <= 1'b1    ;
		if (prach_ant_mux_fifo_full.prach_ant_mux_sc_fifo_full_time_ref[1])
			fifo_status[9]        <= 1'b1    ;
		if (prach_ant_mux_fifo_full.prach_ant_mux_output_fifo_full)
			fifo_status[10]        <= 1'b1   ;
		if (ul_arb_output_fifo_full)
			fifo_status[11]        <= 1'b1   ;
    end
end

endmodule
