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
 
module capture_if_top
#(
   parameter    
   
   NUM_OF_ANT        	        = 8   	,
   CAPTURE_DMA_WIDTH            = 512 	,
   ECPRI_CAPTURE_INSTANCES      = 2   	,
   DSP_CAPTURE_INSTANCES        = 30  	,
   LPHY_DSP_CAPTURE_INST        = 6     ,
   DXC_DSP_CAPTURE_INST         = 22    ,
   IQ_DATAWIDTH                 = 32  	,  
   NUM_OF_FFT       			= 2		,
   CPRI_ETH_DATAWIDTH   		= 128	,
   XRAN_ETH_DATAWIDTH   		= 128	,
   CH_DW 						= 8		,
   NUM_OF_PRACH 				= 2     ,
   ANTENNA_DWIDTH               = 3      
    
       
)
(


input clk_dsp      				,
input rst_dsp_n    				,
input rst_soft_n   				,
input clk_capture_dma	        ,
input rst_capture_dma_n         ,
input clk_eth_xran_ul           ,
input rst_eth_xran_n_ul         ,
input clk_csr                   ,	
input rst_csr_n                 ,  
																   
input   [4:0]                       csr_dsp_capture_address        ,                 
input                               csr_dsp_capture_write          ,       
input                               csr_dsp_capture_read           ,    
input   [31:0]                      csr_dsp_capture_writedata      ,    
output  [31:0]                      csr_dsp_capture_readdata       , 
output								csr_dsp_capture_readdatavalid  ,
output              				csr_dsp_capture_waitrequest    ,


input   [55:0]                      radio_config_status            ,

output reg                              avst_src_capture_valid         , 
output reg [CAPTURE_DMA_WIDTH-1:0]      avst_src_capture_data          ,
input                               avst_src_capture_ready         ,

input     					    lphy_avst_sink_dsp_capture_valid  ,   
input    [ IQ_DATAWIDTH -1 :0]	lphy_avst_sink_dsp_capture_data   ,  
input    [ ANTENNA_DWIDTH-1 :0]	lphy_avst_sink_dsp_capture_chan   , 
																  
input     				 		dxc_avst_sink_dsp_capture_valid   ,
input    [IQ_DATAWIDTH -1 :0] 	dxc_avst_sink_dsp_capture_data    ,
input    [ANTENNA_DWIDTH-1 :0]	dxc_avst_sink_dsp_capture_chan    ,
output wire [31:0]              interface_sel 

);


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



(*preserve_syn_only*) reg				rst_dsp_n_1d	    									;
(*preserve_syn_only*) reg				rst_dsp_n_2d	    									;
(*preserve_syn_only*) reg 				rst_dsp_n_3d	    									;
(*preserve_syn_only*) reg 				rst_dsp_n_4d	    									;

(*preserve_syn_only*) reg 				rst_dsp_n_2d_dup1										;

(*preserve_syn_only*) reg 				rst_dsp_n_3d_dup1										;
(*preserve_syn_only*) reg 				rst_dsp_n_4d_dup1										;

(*preserve_syn_only*) reg 				rst_dsp_n_3d_dup2										;
(*preserve_syn_only*) reg 				rst_dsp_n_4d_dup2										;

(*preserve_syn_only*) reg 				rst_dsp_n_3d_dup3										;
(*preserve_syn_only*) reg 				rst_dsp_n_4d_dup3										;

(*preserve_syn_only*) reg 				rst_dsp_n_5d_dup1										;
(*preserve_syn_only*) reg 				rst_dsp_n_6d_dup1										;

(*preserve_syn_only*) reg 				rst_dsp_n_5d_dup2										;
(*preserve_syn_only*) reg 				rst_dsp_n_6d_dup2										;

(*preserve_syn_only*) reg 				rst_dsp_soft_n_1d 										;
(*preserve_syn_only*) reg 				rst_dsp_soft_n_1d_dup1 									;

(*preserve_syn_only*) reg 				rst_dsp_soft_n_2d 										;
	
(*preserve_syn_only*) reg 				rst_dsp_soft_n_3d_dup1   								;
(*preserve_syn_only*) reg 				rst_dsp_soft_n_4d_dup1   								;
			
(*preserve_syn_only*) reg 				rst_dsp_soft_n_3d_dup2   								;
(*preserve_syn_only*) reg 				rst_dsp_soft_n_4d_dup2  								;
			
(*preserve_syn_only*) reg 				rst_dsp_soft_n_3d_dup3   								;
(*preserve_syn_only*) reg 				rst_dsp_soft_n_4d_dup3   								;

(*preserve_syn_only*) reg 				rst_dsp_soft_n_5d_dup1   								;
(*preserve_syn_only*) reg 				rst_dsp_soft_n_6d_dup1   								;

(*preserve_syn_only*) reg 				rst_dsp_soft_n_5d_dup2   								;
(*preserve_syn_only*) reg 				rst_dsp_soft_n_6d_dup2   								;

wire  [1:0]   avst_sink_dsp_capture_valid			    ;
wire  [63:0]  avst_sink_dsp_capture_data				;
wire  [5:0]   avst_sink_dsp_capture_chan				;



wire  [ECPRI_CAPTURE_INSTANCES-1:0]                ecpri_trigger_event							;
wire  [DSP_CAPTURE_INSTANCES-1:0]                  dsp_trigger_event							;


wire                          			avst_src_dsp_capture_valid 								; 
wire  [CAPTURE_DMA_WIDTH-1:0] 			avst_src_dsp_capture_data  								;



assign csr_dsp_capture_waitrequest = 1'b0 ; 

	
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



altera_reset_synchronizer
#(
    .ASYNC_RESET(1),
    .DEPTH      (4)
) wrapper_dsp_rst_ctrl
(
    .reset_in   (~rst_dsp_n     ),
    .clk        (clk_dsp        ), 
    .reset_out  (rst_dsp_sync   )
);

always @(posedge clk_dsp)
	begin
		begin
		    rst_dsp_n_1d 		<= ~rst_dsp_sync;
			rst_dsp_n_2d 		<= rst_dsp_n_1d;	
			rst_dsp_n_3d 		<= rst_dsp_n_2d;
			rst_dsp_n_4d 		<= rst_dsp_n_3d;
		end
	end	
	
always @(posedge clk_dsp)
	begin
		rst_dsp_n_2d_dup1 	<= rst_dsp_n_1d;
	
		rst_dsp_n_3d_dup1   <= rst_dsp_n_2d;
		rst_dsp_n_4d_dup1  	<= rst_dsp_n_3d_dup1;
			
		rst_dsp_n_3d_dup2   <= rst_dsp_n_2d;
		rst_dsp_n_4d_dup2  	<= rst_dsp_n_3d_dup2;
			
		rst_dsp_n_3d_dup3   <= rst_dsp_n_2d;
		rst_dsp_n_4d_dup3  	<= rst_dsp_n_3d_dup3;		
	end	
	
always @(posedge clk_dsp)
	begin
	    rst_dsp_n_5d_dup1  <= rst_dsp_n_4d;
		rst_dsp_n_6d_dup1  <= rst_dsp_n_5d_dup1;
		 
   		rst_dsp_n_5d_dup2  <= rst_dsp_n_4d;
		rst_dsp_n_6d_dup2  <= rst_dsp_n_5d_dup2;

	end	
	
	
always @(posedge clk_dsp)
	begin
		rst_dsp_soft_n_1d 		<= rst_soft_n;
		rst_dsp_soft_n_1d_dup1 	<= rst_soft_n;
		
		rst_dsp_soft_n_2d 		<= rst_dsp_soft_n_1d;
	
		rst_dsp_soft_n_3d_dup1   <= rst_dsp_soft_n_2d;
		rst_dsp_soft_n_4d_dup1   <= rst_dsp_soft_n_3d_dup1;
		rst_dsp_soft_n_5d_dup1   <= rst_dsp_soft_n_4d_dup1;
		rst_dsp_soft_n_6d_dup1   <= rst_dsp_soft_n_5d_dup1;

		rst_dsp_soft_n_3d_dup2   <= rst_dsp_soft_n_2d;
		rst_dsp_soft_n_4d_dup2   <= rst_dsp_soft_n_3d_dup2;
		rst_dsp_soft_n_5d_dup2   <= rst_dsp_soft_n_4d_dup2;
		rst_dsp_soft_n_6d_dup2   <= rst_dsp_soft_n_5d_dup2;
		
		rst_dsp_soft_n_3d_dup3   <= rst_dsp_soft_n_2d;
		rst_dsp_soft_n_4d_dup3   <= rst_dsp_soft_n_3d_dup3;		
		
		
	end	

 
 
// capture IN/OUT dsp blocks
 assign avst_sink_dsp_capture_valid =   {lphy_avst_sink_dsp_capture_valid  ,  dxc_avst_sink_dsp_capture_valid  };
 assign avst_sink_dsp_capture_data  =   {lphy_avst_sink_dsp_capture_data   ,  dxc_avst_sink_dsp_capture_data   };
 assign avst_sink_dsp_capture_chan  =   {lphy_avst_sink_dsp_capture_chan   ,  dxc_avst_sink_dsp_capture_chan   };

assign dsp_trigger_event = {DSP_CAPTURE_INSTANCES{1'b0}};
 

capture_if #(
      .NUM_INTERFACES     	 (DSP_CAPTURE_INSTANCES),
      .DATAWIDTH          	 (32),
      .MAX_CHANNELS       	 (NUM_OF_ANT),
      .DMA_DATAWIDTH      	 (CAPTURE_DMA_WIDTH),
	  .IQ_DATAWIDTH       	 (32),
	  .FRAME_STATUS_WIDTH	 (56),
	  .TRIGGER_BASED_CAPTURE (0),
      .FRAME_BASED_CAPTURE   (1)
   ) u_dsp_block_capture (
      .clk_st                 (clk_dsp						),      
      .rst_st_n               (rst_dsp_n_6d_dup2 & rst_dsp_soft_n_6d_dup2),
      
      .clk_dma                (clk_capture_dma				),     
      .rst_dma_n              (rst_capture_dma_n			),
      
      .clk_csr                (clk_csr						),     
      .rst_csr_n              (rst_csr_n					),
      
      .avst_sink_valid        (avst_sink_dsp_capture_valid	),
      .avst_sink_data         (avst_sink_dsp_capture_data 	),
      .avst_sink_channel      (avst_sink_dsp_capture_chan 	),
      
	  .trigger_event          (dsp_trigger_event			),
	  
      .avst_src_valid         (avst_src_dsp_capture_valid	),
      .avst_src_data          (avst_src_dsp_capture_data 	),
      .avst_src_ready         (avst_src_capture_ready	 	),
      
      .csr_address            (csr_dsp_capture_address  	),
      .csr_write              (csr_dsp_capture_write    	),
      .csr_read               (csr_dsp_capture_read     	),
      .csr_writedata          (csr_dsp_capture_writedata	),
      .csr_readdata           (csr_dsp_capture_readdata		), //
	  .csr_readdatavalid	  (csr_dsp_capture_readdatavalid), //
      .frame_status           (radio_config_status     		),
	  .interface_select       (interface_sel                )  //           
   ); 
   
   
   
 //Mux - interface selection
   always @ (posedge clk_capture_dma) begin
      if (~rst_capture_dma_n) begin
         avst_src_capture_valid   <= {1'b0};
         avst_src_capture_data    <= {CAPTURE_DMA_WIDTH{1'b0}};
      end 
	  else if (avst_src_dsp_capture_valid && avst_src_capture_ready) begin
         avst_src_capture_valid   <= avst_src_dsp_capture_valid;
         avst_src_capture_data    <= avst_src_dsp_capture_data ;
      end
	  else begin
		 avst_src_capture_valid   <= {1'b0};
         avst_src_capture_data    <= {CAPTURE_DMA_WIDTH{1'b0}};
      end
   end
 
endmodule
