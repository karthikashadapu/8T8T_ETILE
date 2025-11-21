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
 module dxc_ss 
 #(
   parameter    
   //DSP parameters
   NUM_OF_ANT        	= 8		,
   NUM_OF_FFT       	= 2		,
   CPRI_ETH_DATAWIDTH   = 128	,
   XRAN_ETH_DATAWIDTH   = 128	,
   CH_DW 				= 8		,
   NUM_OF_PRACH 		= 2     ,
   CAPTURE_DMA_WIDTH    = 512   ,
   IQ_DATAWIDTH 				    = 32 	              ,
   CPRI_FRAME_DATAWIDTH       	    = 64  	              ,
   ECPRI_CAPTURE_INSTANCES          = 2                   ,
   DSP_CAPTURE_INSTANCES            = 30                  ,
   DXC_DSP_CAPTURE_INST             = 22                  
    
   
)(
input                            clk_dsp                  ,
input                            rst_dsp_n                ,
input                            clk_csr                  , 
input                            rst_csr_n                , 
input                            rst_soft_n               ,
					             
input  [31:0]                    duc_l1_busIn_writedata      ,
input  [11:0 ]                   duc_l1_busIn_address        ,
input                            duc_l1_busIn_write          ,
input                            duc_l1_busIn_read           ,
output                           duc_l1_busOut_readdatavalid ,
output [31:0]                    duc_l1_busOut_readdata      ,
output                           duc_l1_busOut_waitrequest   ,

input  [31:0]                    duc_l2_busIn_writedata      ,
input  [11:0 ]                   duc_l2_busIn_address        ,
input                            duc_l2_busIn_write          ,
input                            duc_l2_busIn_read           ,
output                           duc_l2_busOut_readdatavalid ,
output [31:0]                    duc_l2_busOut_readdata      ,
output                           duc_l2_busOut_waitrequest   ,

input  [31:0]                    ca_interp_busIn_writedata      ,
input  [6:0 ]                    ca_interp_busIn_address        ,
input                            ca_interp_busIn_write          ,
input                            ca_interp_busIn_read           ,
output                           ca_interp_busOut_readdatavalid ,
output [31:0]                    ca_interp_busOut_readdata      ,
output                           ca_interp_busOut_waitrequest   ,

input  [31:0] 					 ddc_l1_busIn_writedata      ,
input  [11:0] 					 ddc_l1_busIn_address        ,    
input          					 ddc_l1_busIn_write          ,    
input          					 ddc_l1_busIn_read           ,    
output         					 ddc_l1_busOut_readdatavalid ,    
output [31:0] 					 ddc_l1_busOut_readdata      ,    
output         					 ddc_l1_busOut_waitrequest   ,

input  [31:0] 					 ddc_l2_busIn_writedata      ,
input  [11:0] 					 ddc_l2_busIn_address        ,    
input          					 ddc_l2_busIn_write          ,    
input          					 ddc_l2_busIn_read           ,    
output         					 ddc_l2_busOut_readdatavalid ,    
output [31:0] 					 ddc_l2_busOut_readdata      ,    
output         					 ddc_l2_busOut_waitrequest   ,

input  [31:0] 					 dec_dly_comp_busIn_writedata      ,
input  [6:0] 	 				 dec_dly_comp_busIn_address        ,    
input          					 dec_dly_comp_busIn_write          ,    
input          					 dec_dly_comp_busIn_read           ,    
output         					 dec_dly_comp_busOut_readdatavalid ,    
output [31:0] 					 dec_dly_comp_busOut_readdata      ,    
output         					 dec_dly_comp_busOut_waitrequest   ,    


// ifft output from lphy ss to duc input
input                            ifft_duc_sink_valid1     ,
input   [IQ_DATAWIDTH-1:0]   	 ifft_duc_sink_data1      ,
input   [7:0 ]                   ifft_duc_sink_channel1   ,
input                            ifft_duc_sink_valid2     ,
input   [IQ_DATAWIDTH-1:0]   	 ifft_duc_sink_data2      ,
input   [7:0 ]                   ifft_duc_sink_channel2   ,

// Stream Input to DDC  
input                            avst_sink_valid    	  ,
input  [7:0]                     avst_sink_channel  	  ,
input  [IQ_DATAWIDTH -1:0]       avst_sink_data_l1  	  ,
input  [IQ_DATAWIDTH -1:0]       avst_sink_data_l2  	  ,
input  [IQ_DATAWIDTH -1:0]       avst_sink_data_l3  	  ,
input  [IQ_DATAWIDTH -1:0]       avst_sink_data_l4  	  ,
input  [IQ_DATAWIDTH -1:0]       avst_sink_data_l5  	  ,
input  [IQ_DATAWIDTH -1:0]       avst_sink_data_l6  	  ,
input  [IQ_DATAWIDTH -1:0]       avst_sink_data_l7  	  ,
input  [IQ_DATAWIDTH -1:0]       avst_sink_data_l8  	  ,

// frame status counter reset from top
input                            rfp_pul                  ,
// from radio config
input  [7:0]                     bw_config_cc1            ,
input  [7:0]                     bw_config_cc2            ,

// Stream Output from DUC                                                       
output                     		duc_avst_source_valid  	  ,
output  [IQ_DATAWIDTH -1:0]		duc_avst_source_data0  	  ,
output  [IQ_DATAWIDTH -1:0]		duc_avst_source_data1  	  ,
output  [IQ_DATAWIDTH -1:0]		duc_avst_source_data2  	  ,
output  [IQ_DATAWIDTH -1:0]		duc_avst_source_data3  	  ,
output  [IQ_DATAWIDTH -1:0]		duc_avst_source_data4  	  ,
output  [IQ_DATAWIDTH -1:0]		duc_avst_source_data5  	  ,
output  [IQ_DATAWIDTH -1:0]		duc_avst_source_data6  	  ,
output  [IQ_DATAWIDTH -1:0]		duc_avst_source_data7  	  ,
output  [7:0]              		duc_avst_source_channel	  ,

// ddc output to ul scheduler and DFD subsystem
output                          ddc_source_valid1         ,
output  [IQ_DATAWIDTH -1 :0]    ddc_source_data1          ,
output  [7:0]                   ddc_source_channel1       ,														  
output                          ddc_source_valid2         ,
output  [IQ_DATAWIDTH -1 :0]    ddc_source_data2          ,
output  [7:0]                   ddc_source_channel2       ,


input [31:0]                                      interface_sel,
output reg                                        dxc_avst_selctd_cap_intf_valid,
output reg  [IQ_DATAWIDTH-1:0]                    dxc_avst_selctd_cap_intf_data ,
output reg  [2:0]                 				  dxc_avst_selctd_cap_intf_chan ,

input   [6 :0]      dxc_ss_config_csr_address       	 ,//new
input               dxc_ss_config_csr_write         	 ,
input				dxc_ss_config_csr_read				 ,//new
output				dxc_ss_config_csr_readdatavalid		 ,//new
output				dxc_ss_config_csr_waitrequest		 ,//new
input   [31:0]      dxc_ss_config_csr_writedata     	 ,
output  [31:0]      dxc_ss_config_csr_readdata  
  
 );
 
 localparam    NUM_INTERFACES_LOG2 = (DXC_DSP_CAPTURE_INST > 1) ? $clog2(DXC_DSP_CAPTURE_INST): 1;
 localparam    ANTENNA_DWIDTH      = $clog2(NUM_OF_ANT)   ;
 
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
 
 

 	
(*preserve_syn_only*) reg    			 rst_dsp_n_1d_dup1               	;	
(*preserve_syn_only*) reg    			 rst_dsp_n_1d_dup2               	;
(*preserve_syn_only*) reg     			 rst_dsp_n_2d_dup2               	;
	
(*preserve_syn_only*) reg    			 rst_dsp_n_1d_dup3               	;
(*preserve_syn_only*) reg   			 rst_dsp_n_2d_dup3               	;
			  
(*preserve_syn_only*) reg                rst_dsp_n_1d_dup4               	;
(*preserve_syn_only*) reg                rst_dsp_n_2d_dup4               	;





reg 									rfp_pul_1d							;
reg 									rfp_pul_2d							;
reg 									rfp_pul_3d							;

wire 									rfp_pul_2d_pos_0					;
wire 									rfp_pul_2d_pos_1					;
wire 									rfp_pul_2d_pos_2					;
wire 									rfp_pul_2d_pos_3					;




wire [DXC_DSP_CAPTURE_INST -1 :0] 				     dxc_avst_source_dsp_capture_valid               ;
wire [DXC_DSP_CAPTURE_INST * IQ_DATAWIDTH -1 :0]	 dxc_avst_source_dsp_capture_data                ;
wire [DXC_DSP_CAPTURE_INST * ANTENNA_DWIDTH -1 :0]   dxc_avst_source_dsp_capture_chan                ;




reg  [DXC_DSP_CAPTURE_INST-1:0]                     avst_selctd_intf_shift_valid; 
reg  [DXC_DSP_CAPTURE_INST*IQ_DATAWIDTH-1:0]        avst_selctd_intf_shift_data;
reg  [DXC_DSP_CAPTURE_INST*ANTENNA_DWIDTH-1:0]      avst_selctd_intf_shift_chan;

wire  [XRAN_ETH_DATAWIDTH-1:0]	capt_duc_source_data_l1	   ;
wire 		    				capt_duc_source_valid_l1   ;
wire  [7:0]         			capt_duc_source_channel_l1 ;
														   
wire  [XRAN_ETH_DATAWIDTH-1:0]	capt_duc_source_data_l2	   ;
wire 		    				capt_duc_source_valid_l2   ;
wire  [7:0]        				capt_duc_source_channel_l2 ;

wire [XRAN_ETH_DATAWIDTH-1:0]	capt_summer_source_data	   ;
wire 	    					capt_summer_source_valid   ;
wire [7:0] 						capt_summer_source_channel ;

// DDC mixer output to DFD SS 
wire  [XRAN_ETH_DATAWIDTH-1:0]	capt_mixer_source_data_l1	;
wire 		    				capt_mixer_source_valid_l1	;
wire  [7:0]   					capt_mixer_source_channel_l1;
															
wire  [XRAN_ETH_DATAWIDTH-1:0]	capt_mixer_source_data_l2	;
wire 		    				capt_mixer_source_valid_l2	;
wire  [7:0]   					capt_mixer_source_channel_l2;

wire  [1:0]	      ddc_control_register				;		
wire  [31:0]      ddc_mux_constant_ant1_1_re	 	;		
wire  [31:0]      ddc_mux_constant_ant1_1_im   		;		
wire  [31:0]      ddc_mux_constant_ant2_1_re   		;		
wire  [31:0]      ddc_mux_constant_ant2_1_im   		;		
wire  [31:0]      ddc_mux_constant_ant3_1_re   		;		
wire  [31:0]      ddc_mux_constant_ant3_1_im   		;		
wire  [31:0]      ddc_mux_constant_ant4_1_re   		;		
wire  [31:0]      ddc_mux_constant_ant4_1_im   		;
wire  [31:0]      ddc_mux_constant_ant1_2_re	 		;		
wire  [31:0]      ddc_mux_constant_ant1_2_im   		;		
wire  [31:0]      ddc_mux_constant_ant2_2_re   		;		
wire  [31:0]      ddc_mux_constant_ant2_2_im   		;		
wire  [31:0]      ddc_mux_constant_ant3_2_re   		;		
wire  [31:0]      ddc_mux_constant_ant3_2_im   		;		
wire  [31:0]      ddc_mux_constant_ant4_2_re   		;		
wire  [31:0]      ddc_mux_constant_ant4_2_im   		;
wire  [31:0]      dxc_interface_select    			;

reg duc_top_reset ;
reg ddc_top_reset ;

assign dxc_ss_config_csr_waitrequest = 1'b0;
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

always @ (posedge clk_dsp)
		begin
		    rst_dsp_n_1d_dup1 <= rst_dsp_n_4d_dup1  & rst_dsp_soft_n_4d_dup1 ;	
			
		    rst_dsp_n_1d_dup2 <= rst_dsp_n_4d_dup1  & rst_dsp_soft_n_4d_dup1 ;
			rst_dsp_n_2d_dup2 <= rst_dsp_n_1d_dup2;	
			
		    rst_dsp_n_1d_dup3 <= rst_dsp_n_4d_dup1  & rst_dsp_soft_n_4d_dup1 ;
			rst_dsp_n_2d_dup3 <= rst_dsp_n_1d_dup3;
			
			rst_dsp_n_1d_dup4 <= rst_dsp_n_4d_dup1  & rst_dsp_soft_n_4d_dup1 ;
			rst_dsp_n_2d_dup4 <= rst_dsp_n_1d_dup4							 ;
            
		
	
		end	


assign rfp_pul_2d_pos_0 = rfp_pul_2d & (~rfp_pul_3d) ;
assign rfp_pul_2d_pos_1 = rfp_pul_2d & (~rfp_pul_3d) ;
assign rfp_pul_2d_pos_2 = rfp_pul_2d & (~rfp_pul_3d) ;
assign rfp_pul_2d_pos_3 = rfp_pul_2d & (~rfp_pul_3d) ;




always @ (posedge clk_dsp )
begin : PIPE_DELAY_RFP_PUL
    if(~rst_dsp_n_2d_dup4)
    begin
	    rfp_pul_1d      <=  rfp_pul           ;
        rfp_pul_2d      <=  rfp_pul_1d        ;
		rfp_pul_3d      <=  rfp_pul_2d        ;
    end
    else
    begin
	    rfp_pul_1d      <=  rfp_pul           ;
        rfp_pul_2d      <=  rfp_pul_1d        ;
		rfp_pul_3d      <=  rfp_pul_2d        ;
    end
end

always @ (posedge clk_dsp )
begin
    //duc_top_reset <= (~rst_dsp_n_5d_dup1) ;
    //ddc_top_reset <= (~rst_dsp_n_5d_dup2) ;
	  duc_top_reset <= ~(rst_dsp_n_5d_dup1 & rst_dsp_soft_n_5d_dup1);
	  ddc_top_reset <= ~(rst_dsp_n_5d_dup2 & rst_dsp_soft_n_5d_dup2);
end

	
`ifndef SCH_LOOPBACK
`ifndef IFFT_FFT_LOOPBACK 

duc_top_ss duc_inst (
    .duc_l1_busIn_writedata      	(duc_l1_busIn_writedata      			),
	.duc_l1_busIn_address           (duc_l1_busIn_address                   ),
	.duc_l1_busIn_write             (duc_l1_busIn_write                     ),
	.duc_l1_busIn_read              (duc_l1_busIn_read                      ),
	.duc_l1_busOut_readdatavalid    (duc_l1_busOut_readdatavalid            ),
	.duc_l1_busOut_readdata         (duc_l1_busOut_readdata                 ),
	.duc_l1_busOut_waitrequest      (duc_l1_busOut_waitrequest              ),
									
	.duc_l2_busIn_writedata         (duc_l2_busIn_writedata                 ),
	.duc_l2_busIn_address           (duc_l2_busIn_address                   ),
	.duc_l2_busIn_write             (duc_l2_busIn_write                     ),
	.duc_l2_busIn_read              (duc_l2_busIn_read                      ),
	.duc_l2_busOut_readdatavalid    (duc_l2_busOut_readdatavalid            ),
	.duc_l2_busOut_readdata         (duc_l2_busOut_readdata                 ),
	.duc_l2_busOut_waitrequest      (duc_l2_busOut_waitrequest              ),
									
	.ca_interp_busIn_writedata      (ca_interp_busIn_writedata              ),
	.ca_interp_busIn_address        (ca_interp_busIn_address                ),
	.ca_interp_busIn_write          (ca_interp_busIn_write                  ),
	.ca_interp_busIn_read           (ca_interp_busIn_read                   ),
	.ca_interp_busOut_readdatavalid (ca_interp_busOut_readdatavalid         ),
	.ca_interp_busOut_readdata      (ca_interp_busOut_readdata              ),
	.ca_interp_busOut_waitrequest   (ca_interp_busOut_waitrequest           ),
	
    .DUC_Valid_l1_s               	(ifft_duc_sink_valid1                  	),
    .DUC_Chan_l1_s                	(ifft_duc_sink_channel1                	),
    .DUC_Data_l1_im               	(ifft_duc_sink_data1 [31:16]           	),
    .DUC_Data_l1_re               	(ifft_duc_sink_data1 [15:0]            	),
    .DUC_Valid_l2_s               	(ifft_duc_sink_valid2                  	),
    .DUC_Chan_l2_s                	(ifft_duc_sink_channel2                	),
    .DUC_Data_l2_im               	(ifft_duc_sink_data2 [31:16]           	),
    .DUC_Data_l2_re               	(ifft_duc_sink_data2 [15:0]            	),
    .DUC_NCO_sync_0				  	(rfp_pul_2d_pos_0					   	),
    .DUC_NCO_sync_1				  	(rfp_pul_2d_pos_1					   	),
    .DUC_NCO_sync_2				  	(rfp_pul_2d_pos_2					   	),
    .DUC_NCO_sync_3				  	(rfp_pul_2d_pos_3					   	),
	.BW_Config_CC1_s	     		(bw_config_cc1	           				),
	.BW_Config_CC2_s          		(bw_config_cc2             				),	
    .DUC_Valid_Out_s              	(duc_avst_source_valid                  ),
    .DUC_Chan_Out_s               	(duc_avst_source_channel                ),
    .DUC_Ant_Data_Out_0im         	(duc_avst_source_data0 [31:16]          ),
    .DUC_Ant_Data_Out_0re         	(duc_avst_source_data0 [15:0]           ),
    .DUC_Ant_Data_Out_1im         	(duc_avst_source_data1 [31:16]          ),
    .DUC_Ant_Data_Out_1re         	(duc_avst_source_data1 [15:0]           ),
    .DUC_Ant_Data_Out_2im         	(duc_avst_source_data2 [31:16]          ),
    .DUC_Ant_Data_Out_2re         	(duc_avst_source_data2 [15:0]           ),
    .DUC_Ant_Data_Out_3im         	(duc_avst_source_data3 [31:16]          ),
    .DUC_Ant_Data_Out_3re         	(duc_avst_source_data3 [15:0]           ),
    .DUC_Ant_Data_Out_4im         	(duc_avst_source_data4 [31:16]          ),
    .DUC_Ant_Data_Out_4re         	(duc_avst_source_data4 [15:0]           ),
    .DUC_Ant_Data_Out_5im         	(duc_avst_source_data5 [31:16]          ),
    .DUC_Ant_Data_Out_5re         	(duc_avst_source_data5 [15:0]           ),
    .DUC_Ant_Data_Out_6im         	(duc_avst_source_data6 [31:16]          ),
    .DUC_Ant_Data_Out_6re         	(duc_avst_source_data6 [15:0]           ),
    .DUC_Ant_Data_Out_7im         	(duc_avst_source_data7 [31:16]          ),
    .DUC_Ant_Data_Out_7re         	(duc_avst_source_data7 [15:0]           ),
	
	.duc_l1_vout_s				 	(capt_duc_source_valid_l1			 	),
	.duc_l1_cout_s	   			 	(capt_duc_source_channel_l1			 	),
	.duc_l1_dout_0im   			 	(capt_duc_source_data_l1 [31:16]		),
	.duc_l1_dout_0re   			 	(capt_duc_source_data_l1 [ 15:0] 	 	),
	.duc_l1_dout_1im   			 	(capt_duc_source_data_l1 [63:48]	 	),
	.duc_l1_dout_1re   			 	(capt_duc_source_data_l1 [ 47:32]	 	),
	.duc_l1_dout_2im   			 	(capt_duc_source_data_l1 [95:80]	 	),
	.duc_l1_dout_2re   			 	(capt_duc_source_data_l1 [ 79:64]	 	),
	.duc_l1_dout_3im   			 	(capt_duc_source_data_l1 [127:112]	 	),
	.duc_l1_dout_3re   			 	(capt_duc_source_data_l1 [ 111:96]	 	),
	
	.duc_l2_vout_s				 	(capt_duc_source_valid_l2			 	),
	.duc_l2_cout_s				 	(capt_duc_source_channel_l2		 		),
	.duc_l2_dout_0im			 	(capt_duc_source_data_l2 [31:16]	 	),
	.duc_l2_dout_0re			 	(capt_duc_source_data_l2 [ 15:0] 	 	),
	.duc_l2_dout_1im		 	 	(capt_duc_source_data_l2 [63:48]	 	),
	.duc_l2_dout_1re		 	 	(capt_duc_source_data_l2 [ 47:32]	 	),
	.duc_l2_dout_2im		 	 	(capt_duc_source_data_l2 [95:80]	 	),
	.duc_l2_dout_2re		 	 	(capt_duc_source_data_l2 [ 79:64]	 	),
	.duc_l2_dout_3im		 	 	(capt_duc_source_data_l2 [127:112] 		),
	.duc_l2_dout_3re		 	 	(capt_duc_source_data_l2 [ 111:96]	 	),

	.summer_vout_s				 	(capt_summer_source_valid			 	),
	.summer_cout_s				 	(capt_summer_source_channel 		 	),
	.summer_dout_0im			 	(capt_summer_source_data [31:16]		),
	.summer_dout_0re			 	(capt_summer_source_data [ 15:0] 	 	),
	.summer_dout_1im			 	(capt_summer_source_data [63:48]	 	),
	.summer_dout_1re			 	(capt_summer_source_data [ 47:32]	 	),
	.summer_dout_2im			 	(capt_summer_source_data [95:80]	 	),
	.summer_dout_2re			 	(capt_summer_source_data [ 79:64]	 	),
	.summer_dout_3im			 	(capt_summer_source_data [127:112] 		),
	.summer_dout_3re			 	(capt_summer_source_data [ 111:96] 		),
    .clk                            (clk_dsp                             	),
    .areset                         (duc_top_reset                      	),
    .bus_clk                        (clk_csr                             	),
    .bus_areset                     (~rst_csr_n                          	)
    );
	
	
ddc_top_ss ddc_inst(
  .ddc_l1_busIn_writedata      		    (ddc_l1_busIn_writedata     	   ), 
	.ddc_l1_busIn_address               (ddc_l1_busIn_address              ) ,
	.ddc_l1_busIn_write                 (ddc_l1_busIn_write                ) ,
	.ddc_l1_busIn_read                  (ddc_l1_busIn_read                 ) ,
	.ddc_l1_busOut_readdatavalid        (ddc_l1_busOut_readdatavalid       ) ,
	.ddc_l1_busOut_readdata             (ddc_l1_busOut_readdata            ) ,
	.ddc_l1_busOut_waitrequest          (ddc_l1_busOut_waitrequest         ) ,
																		  
	.ddc_l2_busIn_writedata             (ddc_l2_busIn_writedata            ) ,
	.ddc_l2_busIn_address               (ddc_l2_busIn_address              ) ,
	.ddc_l2_busIn_write                 (ddc_l2_busIn_write                ) ,
	.ddc_l2_busIn_read                  (ddc_l2_busIn_read                 ) ,
	.ddc_l2_busOut_readdatavalid        (ddc_l2_busOut_readdatavalid       ) ,
	.ddc_l2_busOut_readdata             (ddc_l2_busOut_readdata            ) ,
	.ddc_l2_busOut_waitrequest          (ddc_l2_busOut_waitrequest         ) ,
																		   
	.dec_dly_comp_busIn_writedata       (dec_dly_comp_busIn_writedata      ) ,
	.dec_dly_comp_busIn_address         (dec_dly_comp_busIn_address        ) ,
	.dec_dly_comp_busIn_write           (dec_dly_comp_busIn_write          ) ,
	.dec_dly_comp_busIn_read            (dec_dly_comp_busIn_read           ) ,
	.dec_dly_comp_busOut_readdatavalid  (dec_dly_comp_busOut_readdatavalid ) ,
	.dec_dly_comp_busOut_readdata       (dec_dly_comp_busOut_readdata      ) ,
	.dec_dly_comp_busOut_waitrequest    (dec_dly_comp_busOut_waitrequest   ) ,
 
  .ddc_l1_dout_im     	 (ddc_source_data1[31:16]  ),  
  .ddc_l1_dout_re     	 (ddc_source_data1[15:0]   ),
  .ddc_l1_vout_s     	 (ddc_source_valid1        ),
  .ddc_l1_cout_s     	 (ddc_source_channel1      ),
  .ddc_l2_dout_im      	 (ddc_source_data2[31:16]  ),
  .ddc_l2_dout_re     	 (ddc_source_data2[15:0]   ),
  .ddc_l2_vout_s         (ddc_source_valid2        ),
  .ddc_l2_cout_s         (ddc_source_channel2      ),
  
  .DDC_Valid_In_s  		 (avst_sink_valid          ),
  .DDC_Chan_In_s  		 (avst_sink_channel        ),
  .DDC_Ant_Data_In_0im   (avst_sink_data_l1[31:16] ),
  .DDC_Ant_Data_In_0re   (avst_sink_data_l1[15:0]  ),
  .DDC_Ant_Data_In_1im   (avst_sink_data_l2[31:16] ),
  .DDC_Ant_Data_In_1re   (avst_sink_data_l2[15:0]  ),
  .DDC_Ant_Data_In_2im   (avst_sink_data_l3[31:16] ),
  .DDC_Ant_Data_In_2re   (avst_sink_data_l3[15:0]  ),
  .DDC_Ant_Data_In_3im   (avst_sink_data_l4[31:16] ),
  .DDC_Ant_Data_In_3re   (avst_sink_data_l4[15:0]  ),
  .DDC_Ant_Data_In_4im   (avst_sink_data_l5[31:16] ),
  .DDC_Ant_Data_In_4re   (avst_sink_data_l5[15:0]  ),
  .DDC_Ant_Data_In_5im   (avst_sink_data_l6[31:16] ),
  .DDC_Ant_Data_In_5re   (avst_sink_data_l6[15:0]  ),
  .DDC_Ant_Data_In_6im   (avst_sink_data_l7[31:16] ),
  .DDC_Ant_Data_In_6re   (avst_sink_data_l7[15:0]  ),
  .DDC_Ant_Data_In_7im   (avst_sink_data_l8[31:16] ),
  .DDC_Ant_Data_In_7re   (avst_sink_data_l8[15:0]  ),
  
  .DDC_NCO_sync_0		 (rfp_pul_2d_pos_0		   ),
  .DDC_NCO_sync_1		 (rfp_pul_2d_pos_1		   ),
  .DDC_NCO_sync_2		 (rfp_pul_2d_pos_2		   ),
  .DDC_NCO_sync_3		 (rfp_pul_2d_pos_3		   ),
  .BW_Config_CC1_s	     (bw_config_cc1	           ),
  .BW_Config_CC2_s       (bw_config_cc2            ),
  
  .ddc_mux_sel_l1				(ddc_control_register[0]   ),
  .ddc_mux_sel_l2               (ddc_control_register[1]   ),
  .ddc_mux_constant_ant1_1_re   (ddc_mux_constant_ant1_1_re),
  .ddc_mux_constant_ant1_1_im   (ddc_mux_constant_ant1_1_im),
  .ddc_mux_constant_ant2_1_re   (ddc_mux_constant_ant2_1_re),
  .ddc_mux_constant_ant2_1_im   (ddc_mux_constant_ant2_1_im),
  .ddc_mux_constant_ant3_1_re   (ddc_mux_constant_ant3_1_re),
  .ddc_mux_constant_ant3_1_im   (ddc_mux_constant_ant3_1_im),
  .ddc_mux_constant_ant4_1_re   (ddc_mux_constant_ant4_1_re),
  .ddc_mux_constant_ant4_1_im   (ddc_mux_constant_ant4_1_im),
  .ddc_mux_constant_ant1_2_re   (ddc_mux_constant_ant1_2_re),
  .ddc_mux_constant_ant1_2_im   (ddc_mux_constant_ant1_2_im),
  .ddc_mux_constant_ant2_2_re   (ddc_mux_constant_ant2_2_re),
  .ddc_mux_constant_ant2_2_im   (ddc_mux_constant_ant2_2_im),
  .ddc_mux_constant_ant3_2_re   (ddc_mux_constant_ant3_2_re),
  .ddc_mux_constant_ant3_2_im   (ddc_mux_constant_ant3_2_im),
  .ddc_mux_constant_ant4_2_re   (ddc_mux_constant_ant4_2_re),
  .ddc_mux_constant_ant4_2_im   (ddc_mux_constant_ant4_2_im),
  
  
  .mixer_l1_dout_0im	 (capt_mixer_source_data_l1[31:16]	),
  .mixer_l1_dout_0re	 (capt_mixer_source_data_l1[ 15:0] 	),
  .mixer_l1_dout_1im	 (capt_mixer_source_data_l1[63:48]	),
  .mixer_l1_dout_1re	 (capt_mixer_source_data_l1[ 47:32]	),
  .mixer_l1_dout_2im	 (capt_mixer_source_data_l1[95:80]	),
  .mixer_l1_dout_2re	 (capt_mixer_source_data_l1[ 79:64]	),
  .mixer_l1_dout_3im	 (capt_mixer_source_data_l1[127:112]),
  .mixer_l1_dout_3re	 (capt_mixer_source_data_l1[ 111:96]),
  .mixer_l1_vout_s		 (capt_mixer_source_valid_l1		),
  .mixer_l1_cout_s		 (capt_mixer_source_channel_l1		),
  .mixer_l2_dout_0im  	 (capt_mixer_source_data_l2[31:16]	),
  .mixer_l2_dout_0re  	 (capt_mixer_source_data_l2[ 15:0] 	),
  .mixer_l2_dout_1im  	 (capt_mixer_source_data_l2[63:48]	),
  .mixer_l2_dout_1re  	 (capt_mixer_source_data_l2[ 47:32]	),
  .mixer_l2_dout_2im  	 (capt_mixer_source_data_l2[95:80]	),
  .mixer_l2_dout_2re  	 (capt_mixer_source_data_l2[ 79:64]	),
  .mixer_l2_dout_3im  	 (capt_mixer_source_data_l2[127:112]),
  .mixer_l2_dout_3re  	 (capt_mixer_source_data_l2[ 111:96]),
  .mixer_l2_vout_s 		 (capt_mixer_source_valid_l2		),
  .mixer_l2_cout_s       (capt_mixer_source_channel_l2		),
  .clk                   (clk_dsp                 			),
  .areset                (ddc_top_reset  			),//rst_dsp_n
  .bus_clk               (clk_csr                 			),
  .bus_areset            (~rst_csr_n               		    )
    );

	
`endif
`endif




 assign dxc_avst_source_dsp_capture_valid =  { 
										 ddc_source_valid2			, ddc_source_valid1 		,
										 capt_mixer_source_valid_l2	, capt_mixer_source_valid_l2, capt_mixer_source_valid_l2, capt_mixer_source_valid_l2, 
										 capt_mixer_source_valid_l1	, capt_mixer_source_valid_l1, capt_mixer_source_valid_l1, capt_mixer_source_valid_l1, 
										 capt_summer_source_valid	, capt_summer_source_valid	, capt_summer_source_valid	, capt_summer_source_valid	, 
										 capt_duc_source_valid_l2	, capt_duc_source_valid_l2	, capt_duc_source_valid_l2	, capt_duc_source_valid_l2	,
										 capt_duc_source_valid_l1	, capt_duc_source_valid_l1	, capt_duc_source_valid_l1	, capt_duc_source_valid_l1	 
										 	};

 assign dxc_avst_source_dsp_capture_data =   { 
										 ddc_source_data2					, ddc_source_data1					,
										 capt_mixer_source_data_l2 	[127:96], capt_mixer_source_data_l2 [95:64], capt_mixer_source_data_l2 	[63:32], capt_mixer_source_data_l2 	[31:0], 
										 capt_mixer_source_data_l1 	[127:96], capt_mixer_source_data_l1 [95:64], capt_mixer_source_data_l1 	[63:32], capt_mixer_source_data_l1 	[31:0], 
										 capt_summer_source_data	[127:96], capt_summer_source_data 	[95:64], capt_summer_source_data	[63:32], capt_summer_source_data	[31:0],
										 capt_duc_source_data_l2 	[127:96], capt_duc_source_data_l2 	[95:64], capt_duc_source_data_l2	[63:32], capt_duc_source_data_l2	[31:0], 
										 capt_duc_source_data_l1 	[127:96], capt_duc_source_data_l1 	[95:64], capt_duc_source_data_l1	[63:32], capt_duc_source_data_l1	[31:0]
										 } ; // scheduler_source_data  ;
 
 assign dxc_avst_source_dsp_capture_chan =   { 
										 ddc_source_channel2 			[2:0], ddc_source_channel1 			[2:0],
										 capt_mixer_source_channel_l2 	[2:0], capt_mixer_source_channel_l2	[2:0], capt_mixer_source_channel_l2 [2:0], capt_mixer_source_channel_l2[2:0], 
										 capt_mixer_source_channel_l1 	[2:0], capt_mixer_source_channel_l1	[2:0], capt_mixer_source_channel_l1 [2:0], capt_mixer_source_channel_l1[2:0],
										 capt_summer_source_channel		[2:0], capt_summer_source_channel	[2:0], capt_summer_source_channel	[2:0], capt_summer_source_channel	[2:0], 
										 capt_duc_source_channel_l2		[2:0], capt_duc_source_channel_l2 	[2:0], capt_duc_source_channel_l2 	[2:0], capt_duc_source_channel_l2 	[2:0], 
										 capt_duc_source_channel_l1		[2:0], capt_duc_source_channel_l1 	[2:0], capt_duc_source_channel_l1 	[2:0], capt_duc_source_channel_l1 	[2:0] 										 
										  } ; // {($clog2(NUM_OF_ANT)*DSP_CAPTURE_INSTANCES){1'b0}};                


//Interface selection 
   always @ (posedge clk_dsp) begin
      if (~rst_dsp_n) begin
         avst_selctd_intf_shift_valid <= {DXC_DSP_CAPTURE_INST{1'b0}};
         avst_selctd_intf_shift_data  <= {DXC_DSP_CAPTURE_INST*IQ_DATAWIDTH{1'b0}};
         avst_selctd_intf_shift_chan  <= {DXC_DSP_CAPTURE_INST*ANTENNA_DWIDTH{1'b0}};
         
      end else begin
         avst_selctd_intf_shift_valid <= dxc_avst_source_dsp_capture_valid >> interface_sel[NUM_INTERFACES_LOG2-1:0];
         avst_selctd_intf_shift_data  <= dxc_avst_source_dsp_capture_data >> (interface_sel[NUM_INTERFACES_LOG2-1:0]*IQ_DATAWIDTH);
         avst_selctd_intf_shift_chan  <= dxc_avst_source_dsp_capture_chan >> (interface_sel[NUM_INTERFACES_LOG2-1:0]*ANTENNA_DWIDTH);
         
      end
   end

   always @ (posedge clk_dsp) begin
      if (~rst_dsp_n) begin
         dxc_avst_selctd_cap_intf_valid <= 1'b0;
         dxc_avst_selctd_cap_intf_data  <= {IQ_DATAWIDTH{1'b0}};
         dxc_avst_selctd_cap_intf_chan  <= {ANTENNA_DWIDTH{1'b0}};
      end else begin
         dxc_avst_selctd_cap_intf_valid <= avst_selctd_intf_shift_valid[0];
         dxc_avst_selctd_cap_intf_data  <= avst_selctd_intf_shift_data[IQ_DATAWIDTH-1:0];
         dxc_avst_selctd_cap_intf_chan  <= avst_selctd_intf_shift_chan[ANTENNA_DWIDTH-1:0];
      end
   end
   
   DXC_SS_Registers u_dxc_ss_regs
	(
		.ddc_control_register_ddc_mux_sel_l1						(ddc_control_register[0]),//output reg 			
		.ddc_control_register_ddc_mux_sel_l2						(ddc_control_register[1]),//output reg 			
		.ddc_mux_constant_ant1_1_re_ddc_mux_constant_ant1_1_re		(ddc_mux_constant_ant1_1_re),//output reg [31:0] 	
		.ddc_mux_constant_ant1_1_im_ddc_mux_constant_ant1_1_im		(ddc_mux_constant_ant1_1_im),//output reg [31:0] 	
		.ddc_mux_constant_ant2_1_re_ddc_mux_constant_ant2_1_re		(ddc_mux_constant_ant2_1_re),//output reg [31:0] 	
		.ddc_mux_constant_ant2_1_im_ddc_mux_constant_ant2_1_im		(ddc_mux_constant_ant2_1_im),//output reg [31:0] 	
		.ddc_mux_constant_ant3_1_re_ddc_mux_constant_ant3_1_re		(ddc_mux_constant_ant3_1_re),//output reg [31:0] 	
		.ddc_mux_constant_ant3_1_im_ddc_mux_constant_ant3_1_im		(ddc_mux_constant_ant3_1_im),//output reg [31:0] 	
		.ddc_mux_constant_ant4_1_re_ddc_mux_constant_ant4_1_re		(ddc_mux_constant_ant4_1_re),//output reg [31:0] 	
		.ddc_mux_constant_ant4_1_im_ddc_mux_constant_ant4_1_im		(ddc_mux_constant_ant4_1_im),//output reg [31:0] 	
		.ddc_mux_constant_ant1_2_re_ddc_mux_constant_ant1_2_re		(ddc_mux_constant_ant1_2_re),//output reg [31:0] 	
		.ddc_mux_constant_ant1_2_im_ddc_mux_constant_ant1_2_im		(ddc_mux_constant_ant1_2_im),//output reg [31:0] 	
		.ddc_mux_constant_ant2_2_re_ddc_mux_constant_ant2_2_re		(ddc_mux_constant_ant2_2_re),//output reg [31:0] 	
		.ddc_mux_constant_ant2_2_im_ddc_mux_constant_ant2_2_im		(ddc_mux_constant_ant2_2_im),//output reg [31:0] 	
		.ddc_mux_constant_ant3_2_re_ddc_mux_constant_ant3_2_re		(ddc_mux_constant_ant3_2_re),//output reg [31:0] 	
		.ddc_mux_constant_ant3_2_im_ddc_mux_constant_ant3_2_im		(ddc_mux_constant_ant3_2_im),//output reg [31:0] 	
		.ddc_mux_constant_ant4_2_re_ddc_mux_constant_ant4_2_re		(ddc_mux_constant_ant4_2_re),//output reg [31:0] 	
		.ddc_mux_constant_ant4_2_im_ddc_mux_constant_ant4_2_im		(ddc_mux_constant_ant4_2_im),//output reg [31:0] 	
		.dxc_interface_select_dxc_interface_select					(dxc_interface_select	   ),//output reg [31:0] 	
		.clk														(clk_csr),//input wire 			
		.reset														(~rst_csr_n),//input wire 			
		.writedata													(dxc_ss_config_csr_writedata),//input wire [31:0]	
		.read														(dxc_ss_config_csr_read),//input wire 			
		.write														(dxc_ss_config_csr_write),//input wire 			
		.byteenable													(4'b1111),//input wire [3:0] 	
		.readdata													(dxc_ss_config_csr_readdata),//output reg [31:0] 	
		.readdatavalid												(dxc_ss_config_csr_readdatavalid),//output reg 			
		.address                                                    ({dxc_ss_config_csr_address[4:0],2'b00}) //input wire [6:0] 	
	);

 
   
// dxc_ss_config u_dxc_ss_config
// (
  // .clk_dsp       (clk_dsp)              	    ,
  // .rst_dsp_n     (rst_dsp_n)       	            ,
  // .clk_csr       (clk_csr)       	            ,
  // .rst_csr_n     (rst_csr_n)       	            ,
  // .clk_eth		 (clk_eth)			            ,
  // .rst_eth_n	 (rst_eth_n)		 	        ,
  // .rst_soft_n	 (rst_soft_n)	    	        ,
  // .csr_address   (dxc_ss_config_csr_address)    ,
  // .csr_write     (dxc_ss_config_csr_write)      ,
  // .csr_writedata (dxc_ss_config_csr_writedata)  ,
  // .csr_readdata  (dxc_ss_config_csr_readdata)   ,
  //// DXC Subsystem Registers		
  // .ddc_control_register			(ddc_control_register)   ,
  // .ddc_mux_constant_ant1_1_re	(ddc_mux_constant_ant1_1_re)  			,
  // .ddc_mux_constant_ant1_1_im	(ddc_mux_constant_ant1_1_im)  			,
  // .ddc_mux_constant_ant2_1_re	(ddc_mux_constant_ant2_1_re)  			,
  // .ddc_mux_constant_ant2_1_im	(ddc_mux_constant_ant2_1_im)  			,
  // .ddc_mux_constant_ant3_1_re	(ddc_mux_constant_ant3_1_re)  			,
  // .ddc_mux_constant_ant3_1_im	(ddc_mux_constant_ant3_1_im)  			,
  // .ddc_mux_constant_ant4_1_re	(ddc_mux_constant_ant4_1_re)  			,
  // .ddc_mux_constant_ant4_1_im	(ddc_mux_constant_ant4_1_im)  			,
  // .ddc_mux_constant_ant1_2_re	(ddc_mux_constant_ant1_2_re)  			,
  // .ddc_mux_constant_ant1_2_im	(ddc_mux_constant_ant1_2_im)  			,
  // .ddc_mux_constant_ant2_2_re	(ddc_mux_constant_ant2_2_re)  			,
  // .ddc_mux_constant_ant2_2_im	(ddc_mux_constant_ant2_2_im)  			,
  // .ddc_mux_constant_ant3_2_re	(ddc_mux_constant_ant3_2_re)  			,
  // .ddc_mux_constant_ant3_2_im	(ddc_mux_constant_ant3_2_im)  			,
  // .ddc_mux_constant_ant4_2_re	(ddc_mux_constant_ant4_2_re)  			,
  // .ddc_mux_constant_ant4_2_im	(ddc_mux_constant_ant4_2_im)  			,
  // .dxc_interface_select			(dxc_interface_select	   )        
// );









































endmodule
