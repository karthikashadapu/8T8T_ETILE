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
 module ddc_top_ss 
 #(
   //parameter    
   //DSP parameters

)(

	// input	[31:0] 		busIn_writedata 		,// -- ufix32
    // input	[13:0] 		busIn_address 			,// -- ufix14
    // input	 			busIn_write 			,//-- ufix1
    // input 				busIn_read 				,//-- ufix1
    // output				busOut_readdatavalid 	,// -- ufix1
    // output	[31:0]		busOut_readdata 		,//  -- ufix32
    // output				busOut_waitrequest 		,// -- ufix1
	
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


    input 				DDC_Valid_In_s 			,//-- ufix1
    input 	[7:0]		DDC_Chan_In_s 			,//-- ufix8
    input 	[15:0]		DDC_Ant_Data_In_0im 	,// -- sfix15_en14
    input 	[15:0]		DDC_Ant_Data_In_0re 	,// -- sfix15_en14
	input 	[15:0]		DDC_Ant_Data_In_1im 	,// -- sfix15_en14
	input 	[15:0]		DDC_Ant_Data_In_1re 	,// -- sfix15_en14
	input 	[15:0]		DDC_Ant_Data_In_2im 	,// -- sfix15_en14
	input 	[15:0]		DDC_Ant_Data_In_2re 	,// -- sfix15_en14
	input 	[15:0]		DDC_Ant_Data_In_3im 	,// -- sfix15_en14
	input 	[15:0]		DDC_Ant_Data_In_3re 	,// -- sfix15_en14
	input 	[15:0]		DDC_Ant_Data_In_4im 	,// -- sfix15_en14
	input 	[15:0]		DDC_Ant_Data_In_4re 	,// -- sfix15_en14
	input 	[15:0]		DDC_Ant_Data_In_5im 	,// -- sfix15_en14
	input 	[15:0]		DDC_Ant_Data_In_5re 	,// -- sfix15_en14
	input 	[15:0]		DDC_Ant_Data_In_6im 	,// -- sfix15_en14
	input 	[15:0]		DDC_Ant_Data_In_6re 	,// -- sfix15_en14
	input 	[15:0]		DDC_Ant_Data_In_7im 	,// -- sfix15_en14
	input 	[15:0]		DDC_Ant_Data_In_7re 	,// -- sfix15_en14

    input 				DDC_NCO_sync_0 			,//-- ufix1
    input 				DDC_NCO_sync_1 			,//-- ufix1
    input 				DDC_NCO_sync_2 			,//-- ufix1
    input 				DDC_NCO_sync_3 			,//-- ufix1
												
    input 	[7:0]		BW_Config_CC1_s 		,//-- ufix8
												
	input 	[7:0]		BW_Config_CC2_s 		,//-- ufix8

	input 	[31:0]		ddc_mux_constant_ant1_1_re	 ,//-- sfix32_en27	
    input 	[31:0]	    ddc_mux_constant_ant1_1_im   ,//-- sfix32_en27
    input 	[31:0]	    ddc_mux_constant_ant2_1_re   ,//-- sfix32_en27
    input 	[31:0]	    ddc_mux_constant_ant2_1_im   ,//-- sfix32_en27
    input 	[31:0]	    ddc_mux_constant_ant3_1_re   ,//-- sfix32_en27
    input 	[31:0]	    ddc_mux_constant_ant3_1_im   ,//-- sfix32_en27
    input 	[31:0]	    ddc_mux_constant_ant4_1_re   ,//-- sfix32_en27
    input 	[31:0]	    ddc_mux_constant_ant4_1_im   ,//-- sfix32_en27
    input               ddc_mux_sel_l1 	,//-- ufix1
	
	input 	[31:0]		ddc_mux_constant_ant1_2_re	 ,//-- sfix32_en27	
    input 	[31:0]	    ddc_mux_constant_ant1_2_im   ,//-- sfix32_en27
    input 	[31:0]	    ddc_mux_constant_ant2_2_re   ,//-- sfix32_en27
    input 	[31:0]	    ddc_mux_constant_ant2_2_im   ,//-- sfix32_en27
    input 	[31:0]	    ddc_mux_constant_ant3_2_re   ,//-- sfix32_en27
    input 	[31:0]	    ddc_mux_constant_ant3_2_im   ,//-- sfix32_en27
    input 	[31:0]	    ddc_mux_constant_ant4_2_re   ,//-- sfix32_en27
    input 	[31:0]	    ddc_mux_constant_ant4_2_im   ,//-- sfix32_en27
    input               ddc_mux_sel_l2 	,//-- ufix1

    output	[15:0]    	ddc_l1_dout_im 			,//-- sfix16_en14
    output	[15:0]    	ddc_l1_dout_re 			,//-- sfix16_en14
    output			    ddc_l1_vout_s 			,//-- ufix1
    output	[7:0]    	ddc_l1_cout_s 			,//-- ufix8	

    output	[15:0]		ddc_l2_dout_im 			,//-- sfix16_en14
    output	[15:0]		ddc_l2_dout_re 			,//-- sfix16_en14
    output				ddc_l2_vout_s  			,//-- ufix1
    output	[7:0]		ddc_l2_cout_s  			,//-- ufix8		
		
	output	[15:0]		mixer_l1_dout_0im 		,//-- sfix16_en14
    output	[15:0]		mixer_l1_dout_0re 		,//-- sfix16_en14
    output	[15:0]		mixer_l1_dout_1im 		,//-- sfix16_en14
    output	[15:0]		mixer_l1_dout_1re 		,//-- sfix16_en14
    output	[15:0]		mixer_l1_dout_2im 		,//-- sfix16_en14
    output	[15:0]		mixer_l1_dout_2re 		,//-- sfix16_en14
    output	[15:0]		mixer_l1_dout_3im 		,//-- sfix16_en14
    output	[15:0]		mixer_l1_dout_3re 		,//-- sfix16_en14
    output				mixer_l1_vout_s 		,//-- ufix1
    output	[7:0]		mixer_l1_cout_s 		,//-- ufix8
												
	output	[15:0]		mixer_l2_dout_0im  		,//-- sfix16_en14
    output	[15:0]		mixer_l2_dout_0re  		,//-- sfix16_en14
    output	[15:0]		mixer_l2_dout_1im  		,//-- sfix16_en14
    output	[15:0]		mixer_l2_dout_1re  		,//-- sfix16_en14
    output	[15:0]		mixer_l2_dout_2im  		,//-- sfix16_en14
    output	[15:0]		mixer_l2_dout_2re  		,//-- sfix16_en14
    output	[15:0]		mixer_l2_dout_3im  		,//-- sfix16_en14
    output	[15:0]		mixer_l2_dout_3re  		,//-- sfix16_en14
    output				mixer_l2_vout_s  		,//-- ufix1
    output	[7:0]		mixer_l2_cout_s  		,//-- ufix8
												
    input 				clk 					,//
    input 				areset 					,//
    input 				bus_clk 				,//
    input 				bus_areset 				
 );	

`include "../common/def_param.vh" 
 
wire	[31:0]	 agcd_l1_dout_0im_sig; 	//-- sfix32_en27
wire	[31:0]	 agcd_l1_dout_0re_sig; 	//-- sfix32_en27
wire	[31:0]	 agcd_l1_dout_1im_sig; 	//-- sfix32_en27
wire	[31:0]	 agcd_l1_dout_1re_sig; 	//-- sfix32_en27
wire	[31:0]	 agcd_l1_dout_2im_sig; 	//-- sfix32_en27
wire	[31:0]	 agcd_l1_dout_2re_sig; 	//-- sfix32_en27
wire	[31:0]	 agcd_l1_dout_3im_sig; 	//-- sfix32_en27
wire	[31:0]	 agcd_l1_dout_3re_sig; 	//-- sfix32_en27
wire			 agcd_l1_vout_s_sig  ;	//-- ufix1
wire	[7:0]	 agcd_l1_cout_s_sig  ;	//-- ufix8

wire	[31:0]	 agcd_l2_dout_0im_sig; 	//-- sfix32_en27
wire	[31:0]	 agcd_l2_dout_0re_sig; 	//-- sfix32_en27
wire	[31:0]	 agcd_l2_dout_1im_sig; 	//-- sfix32_en27
wire	[31:0]	 agcd_l2_dout_1re_sig; 	//-- sfix32_en27
wire	[31:0]	 agcd_l2_dout_2im_sig; 	//-- sfix32_en27
wire	[31:0]	 agcd_l2_dout_2re_sig; 	//-- sfix32_en27
wire	[31:0]	 agcd_l2_dout_3im_sig; 	//-- sfix32_en27
wire	[31:0]	 agcd_l2_dout_3re_sig; 	//-- sfix32_en27
wire			 agcd_l2_vout_s_sig  ;	//-- ufix1
wire	[7:0]	 agcd_l2_cout_s_sig  ;	//-- ufix8


dec_dly_comp_DUT dut_dec_dly_comp 
	(
        .busIn_writedata 		(dec_dly_comp_busIn_writedata      ),
        .busIn_address 			({7'b0,dec_dly_comp_busIn_address} ),
        .busIn_write 			(dec_dly_comp_busIn_write          ),
        .busIn_read 			(dec_dly_comp_busIn_read           ),
        .busOut_readdatavalid 	(dec_dly_comp_busOut_readdatavalid ),//busOut_readdatavalid
        .busOut_readdata 		(dec_dly_comp_busOut_readdata      ),//busOut_readdata
        .busOut_waitrequest 	(dec_dly_comp_busOut_waitrequest   ),//busOut_waitrequest

        .DDC_Valid_In_s 		(DDC_Valid_In_s 		),
        .DDC_Chan_In_s 			(DDC_Chan_In_s 			),
        .DDC_Ant_Data_In_0im 	(DDC_Ant_Data_In_0im 	),
        .DDC_Ant_Data_In_0re 	(DDC_Ant_Data_In_0re 	),
        .DDC_Ant_Data_In_1im 	(DDC_Ant_Data_In_1im 	),
        .DDC_Ant_Data_In_1re 	(DDC_Ant_Data_In_1re 	),
        .DDC_Ant_Data_In_2im 	(DDC_Ant_Data_In_2im 	),
        .DDC_Ant_Data_In_2re 	(DDC_Ant_Data_In_2re 	),
        .DDC_Ant_Data_In_3im 	(DDC_Ant_Data_In_3im 	),
        .DDC_Ant_Data_In_3re 	(DDC_Ant_Data_In_3re 	),
        .DDC_Ant_Data_In_4im 	(DDC_Ant_Data_In_4im 	),
        .DDC_Ant_Data_In_4re 	(DDC_Ant_Data_In_4re 	),
        .DDC_Ant_Data_In_5im 	(DDC_Ant_Data_In_5im 	),
        .DDC_Ant_Data_In_5re 	(DDC_Ant_Data_In_5re 	),
        .DDC_Ant_Data_In_6im 	(DDC_Ant_Data_In_6im 	),
        .DDC_Ant_Data_In_6re 	(DDC_Ant_Data_In_6re 	),
        .DDC_Ant_Data_In_7im 	(DDC_Ant_Data_In_7im 	),
        .DDC_Ant_Data_In_7re 	(DDC_Ant_Data_In_7re 	),
								
        .alq_l1_dout_0im 		(agcd_l1_dout_0im_sig	),
        .alq_l1_dout_0re 		(agcd_l1_dout_0re_sig	),
        .alq_l1_dout_1im 		(agcd_l1_dout_1im_sig	),
        .alq_l1_dout_1re 		(agcd_l1_dout_1re_sig	),
        .alq_l1_dout_2im 		(agcd_l1_dout_2im_sig	),
        .alq_l1_dout_2re 		(agcd_l1_dout_2re_sig	),
        .alq_l1_dout_3im 		(agcd_l1_dout_3im_sig	),
        .alq_l1_dout_3re 		(agcd_l1_dout_3re_sig	),
        .alq_l1_vout_s 			(agcd_l1_vout_s_sig		),
        .alq_l1_cout_s 			(agcd_l1_cout_s_sig		),
		
        .alq_l2_dout_0im 		(agcd_l2_dout_0im_sig	),
        .alq_l2_dout_0re 		(agcd_l2_dout_0re_sig	),
        .alq_l2_dout_1im 		(agcd_l2_dout_1im_sig	),
        .alq_l2_dout_1re 		(agcd_l2_dout_1re_sig	),
        .alq_l2_dout_2im 		(agcd_l2_dout_2im_sig	),
        .alq_l2_dout_2re 		(agcd_l2_dout_2re_sig	),
        .alq_l2_dout_3im 		(agcd_l2_dout_3im_sig	),
        .alq_l2_dout_3re 		(agcd_l2_dout_3re_sig	),
        .alq_l2_vout_s 			(agcd_l2_vout_s_sig		),
        .alq_l2_cout_s 			(agcd_l2_cout_s_sig		),
							
        .clk 					(clk 					),
        .areset 				(areset 				),
        .bus_clk 				(bus_clk 				),
        .bus_areset 			(bus_areset 			) 
	);

// Code Specific to test 1CC (if NUM_CC_ONE is defined)	
	`ifdef NUM_CC_ONE
	ddc_model_DUT	dut_ddc_l1
	(
        .busIn_writedata 		(ddc_l1_busIn_writedata     ),
        .busIn_address 			({2'b0,ddc_l1_busIn_address}),
        .busIn_write 			(ddc_l1_busIn_write         ),
        .busIn_read 			(ddc_l1_busIn_read          ),
        .busOut_readdatavalid 	(ddc_l1_busOut_readdatavalid),
        .busOut_readdata 		(ddc_l1_busOut_readdata     ),
        .busOut_waitrequest 	(ddc_l1_busOut_waitrequest  ),
								
        .DDC_Valid_In_s 		(agcd_l1_vout_s_sig		),
        .DDC_Chan_In_s 			(agcd_l1_cout_s_sig		),
        .DDC_Ant_Data_In_0im 	(agcd_l1_dout_0im_sig	),
        .DDC_Ant_Data_In_0re 	(agcd_l1_dout_0re_sig	),
        .DDC_Ant_Data_In_1im 	(agcd_l1_dout_1im_sig	),
        .DDC_Ant_Data_In_1re 	(agcd_l1_dout_1re_sig	),
        .DDC_Ant_Data_In_2im 	(agcd_l1_dout_2im_sig	),
        .DDC_Ant_Data_In_2re 	(agcd_l1_dout_2re_sig	),
        .DDC_Ant_Data_In_3im 	(agcd_l1_dout_3im_sig	),
        .DDC_Ant_Data_In_3re 	(agcd_l1_dout_3re_sig	),
								
        .DDC_NCO_sync_0 		(DDC_NCO_sync_0			),
        .DDC_NCO_sync_1 		(DDC_NCO_sync_1			),
        .DDC_NCO_sync_2 		(DDC_NCO_sync_2			),
        .DDC_NCO_sync_3 		(DDC_NCO_sync_3			),
								
        .BW_Config_CC1_s 		(BW_Config_CC1_s		),
							
        .DDC_Const_Data_In_0im 	(ddc_mux_constant_ant1_1_im	),
        .DDC_Const_Data_In_0re 	(ddc_mux_constant_ant1_1_re	),
        .DDC_Const_Data_In_1im 	(ddc_mux_constant_ant2_1_im	),
        .DDC_Const_Data_In_1re 	(ddc_mux_constant_ant2_1_re	),
        .DDC_Const_Data_In_2im 	(ddc_mux_constant_ant3_1_im ),
        .DDC_Const_Data_In_2re 	(ddc_mux_constant_ant3_1_re	),
        .DDC_Const_Data_In_3im 	(ddc_mux_constant_ant4_1_im	),
        .DDC_Const_Data_In_3re 	(ddc_mux_constant_ant4_1_re	),
        .DDC_Const_Data_sel_s 	(ddc_mux_sel_l1	),
								
        .ddc_l1_dout_im 		(ddc_l1_dout_im			),
        .ddc_l1_dout_re 		(ddc_l1_dout_re			),
        .ddc_l1_vout_s 			(ddc_l1_vout_s 			),
        .ddc_l1_cout_s 			(ddc_l1_cout_s 			),
								
        .mixer_l1_dout_0im 		(mixer_l1_dout_0im 		),
        .mixer_l1_dout_0re 		(mixer_l1_dout_0re 		),
        .mixer_l1_dout_1im 		(mixer_l1_dout_1im 		),
        .mixer_l1_dout_1re 		(mixer_l1_dout_1re 		),
        .mixer_l1_dout_2im 		(mixer_l1_dout_2im 		),
        .mixer_l1_dout_2re 		(mixer_l1_dout_2re 		),
        .mixer_l1_dout_3im 		(mixer_l1_dout_3im 		),
        .mixer_l1_dout_3re 		(mixer_l1_dout_3re 		),
        .mixer_l1_vout_s 		(mixer_l1_vout_s 		),
        .mixer_l1_cout_s 		(mixer_l1_cout_s 		),
								
        .clk 					(clk 					),
        .areset 				(areset 				),
        .bus_clk 				(bus_clk 				),
        .bus_areset 			(bus_areset 			)
	);
	
	assign ddc_l2_dout_im 		= 16'b0;
	assign ddc_l2_dout_re 		= 16'b0;
	assign ddc_l2_vout_s 		= 1'b0;
	assign ddc_l2_cout_s 		= 8'b0;
	assign mixer_l2_dout_0im	= 16'b0;
	assign mixer_l2_dout_0re    = 16'b0;
	assign mixer_l2_dout_1im    = 16'b0;
	assign mixer_l2_dout_1re    = 16'b0;
	assign mixer_l2_dout_2im    = 16'b0;
	assign mixer_l2_dout_2re    = 16'b0;
	assign mixer_l2_dout_3im    = 16'b0;
	assign mixer_l2_dout_3re    = 16'b0;
	assign mixer_l2_vout_s      = 1'b0;
	assign mixer_l2_cout_s      = 8'b0;
	`endif

// Code Specific to test 2CC (if NUM_CC_TWO is defined)	
	`ifdef NUM_CC_TWO
	ddc_model_DUT	dut_ddc_l1
	(
        .busIn_writedata 		(ddc_l1_busIn_writedata     ),
        .busIn_address 			({2'b0,ddc_l1_busIn_address}),
        .busIn_write 			(ddc_l1_busIn_write         ),
        .busIn_read 			(ddc_l1_busIn_read          ),
        .busOut_readdatavalid 	(ddc_l1_busOut_readdatavalid),
        .busOut_readdata 		(ddc_l1_busOut_readdata     ),
        .busOut_waitrequest 	(ddc_l1_busOut_waitrequest  ),
								
        .DDC_Valid_In_s 		(agcd_l1_vout_s_sig		),
        .DDC_Chan_In_s 			(agcd_l1_cout_s_sig		),
        .DDC_Ant_Data_In_0im 	(agcd_l1_dout_0im_sig	),
        .DDC_Ant_Data_In_0re 	(agcd_l1_dout_0re_sig	),
        .DDC_Ant_Data_In_1im 	(agcd_l1_dout_1im_sig	),
        .DDC_Ant_Data_In_1re 	(agcd_l1_dout_1re_sig	),
        .DDC_Ant_Data_In_2im 	(agcd_l1_dout_2im_sig	),
        .DDC_Ant_Data_In_2re 	(agcd_l1_dout_2re_sig	),
        .DDC_Ant_Data_In_3im 	(agcd_l1_dout_3im_sig	),
        .DDC_Ant_Data_In_3re 	(agcd_l1_dout_3re_sig	),
								
        .DDC_NCO_sync_0 		(DDC_NCO_sync_0			),
        .DDC_NCO_sync_1 		(DDC_NCO_sync_1			),
        .DDC_NCO_sync_2 		(DDC_NCO_sync_2			),
        .DDC_NCO_sync_3 		(DDC_NCO_sync_3			),
								
        .BW_Config_CC1_s 		(BW_Config_CC1_s		),
							
        .DDC_Const_Data_In_0im 	(ddc_mux_constant_ant1_1_im	),
        .DDC_Const_Data_In_0re 	(ddc_mux_constant_ant1_1_re	),
        .DDC_Const_Data_In_1im 	(ddc_mux_constant_ant2_1_im	),
        .DDC_Const_Data_In_1re 	(ddc_mux_constant_ant2_1_re	),
        .DDC_Const_Data_In_2im 	(ddc_mux_constant_ant3_1_im ),
        .DDC_Const_Data_In_2re 	(ddc_mux_constant_ant3_1_re	),
        .DDC_Const_Data_In_3im 	(ddc_mux_constant_ant4_1_im	),
        .DDC_Const_Data_In_3re 	(ddc_mux_constant_ant4_1_re	),
        .DDC_Const_Data_sel_s 	(ddc_mux_sel_l1	),
								
        .ddc_l1_dout_im 		(ddc_l1_dout_im			),
        .ddc_l1_dout_re 		(ddc_l1_dout_re			),
        .ddc_l1_vout_s 			(ddc_l1_vout_s 			),
        .ddc_l1_cout_s 			(ddc_l1_cout_s 			),
								
        .mixer_l1_dout_0im 		(mixer_l1_dout_0im 		),
        .mixer_l1_dout_0re 		(mixer_l1_dout_0re 		),
        .mixer_l1_dout_1im 		(mixer_l1_dout_1im 		),
        .mixer_l1_dout_1re 		(mixer_l1_dout_1re 		),
        .mixer_l1_dout_2im 		(mixer_l1_dout_2im 		),
        .mixer_l1_dout_2re 		(mixer_l1_dout_2re 		),
        .mixer_l1_dout_3im 		(mixer_l1_dout_3im 		),
        .mixer_l1_dout_3re 		(mixer_l1_dout_3re 		),
        .mixer_l1_vout_s 		(mixer_l1_vout_s 		),
        .mixer_l1_cout_s 		(mixer_l1_cout_s 		),
								
        .clk 					(clk 					),
        .areset 				(areset 				),
        .bus_clk 				(bus_clk 				),
        .bus_areset 			(bus_areset 			)
	);
	
	ddc_model_DUT	dut_ddc_l2
	(
        .busIn_writedata 		(ddc_l2_busIn_writedata      ),
        .busIn_address 			({2'b0,ddc_l2_busIn_address}),
        .busIn_write 			(ddc_l2_busIn_write          ),
        .busIn_read 			(ddc_l2_busIn_read           ),
        .busOut_readdatavalid 	(ddc_l2_busOut_readdatavalid ),//busOut_readdatavalid	
        .busOut_readdata 		(ddc_l2_busOut_readdata      ),//busOut_readdata 		
        .busOut_waitrequest 	(ddc_l2_busOut_waitrequest   ),//busOut_waitrequest 	
								
        .DDC_Valid_In_s 		(agcd_l2_vout_s_sig		),
        .DDC_Chan_In_s 			(agcd_l2_cout_s_sig		),
        .DDC_Ant_Data_In_0im 	(agcd_l2_dout_0im_sig	),
        .DDC_Ant_Data_In_0re 	(agcd_l2_dout_0re_sig	),
        .DDC_Ant_Data_In_1im 	(agcd_l2_dout_1im_sig	),
        .DDC_Ant_Data_In_1re 	(agcd_l2_dout_1re_sig	),
        .DDC_Ant_Data_In_2im 	(agcd_l2_dout_2im_sig	),
        .DDC_Ant_Data_In_2re 	(agcd_l2_dout_2re_sig	),
        .DDC_Ant_Data_In_3im 	(agcd_l2_dout_3im_sig	),
        .DDC_Ant_Data_In_3re 	(agcd_l2_dout_3re_sig	),
								
        .DDC_NCO_sync_0 		(DDC_NCO_sync_0			),
        .DDC_NCO_sync_1 		(DDC_NCO_sync_1			),
        .DDC_NCO_sync_2 		(DDC_NCO_sync_2			),
        .DDC_NCO_sync_3 		(DDC_NCO_sync_3			),
								
        .BW_Config_CC1_s 		(BW_Config_CC2_s		),
							
        .DDC_Const_Data_In_0im 	(ddc_mux_constant_ant1_2_im	),
        .DDC_Const_Data_In_0re 	(ddc_mux_constant_ant1_2_re	),
        .DDC_Const_Data_In_1im 	(ddc_mux_constant_ant2_2_im	),
        .DDC_Const_Data_In_1re 	(ddc_mux_constant_ant2_2_re	),
        .DDC_Const_Data_In_2im 	(ddc_mux_constant_ant3_2_im ),
        .DDC_Const_Data_In_2re 	(ddc_mux_constant_ant3_2_re	),
        .DDC_Const_Data_In_3im 	(ddc_mux_constant_ant4_2_im	),
        .DDC_Const_Data_In_3re 	(ddc_mux_constant_ant4_2_re	),
        .DDC_Const_Data_sel_s 	(ddc_mux_sel_l2	),
								
        .ddc_l1_dout_im 		(ddc_l2_dout_im			),
        .ddc_l1_dout_re 		(ddc_l2_dout_re			),
        .ddc_l1_vout_s 			(ddc_l2_vout_s 			),
        .ddc_l1_cout_s 			(ddc_l2_cout_s 			),
								
        .mixer_l1_dout_0im 		(mixer_l2_dout_0im 		),
        .mixer_l1_dout_0re 		(mixer_l2_dout_0re 		),
        .mixer_l1_dout_1im 		(mixer_l2_dout_1im 		),
        .mixer_l1_dout_1re 		(mixer_l2_dout_1re 		),
        .mixer_l1_dout_2im 		(mixer_l2_dout_2im 		),
        .mixer_l1_dout_2re 		(mixer_l2_dout_2re 		),
        .mixer_l1_dout_3im 		(mixer_l2_dout_3im 		),
        .mixer_l1_dout_3re 		(mixer_l2_dout_3re 		),
        .mixer_l1_vout_s 		(mixer_l2_vout_s 		),
        .mixer_l1_cout_s 		(mixer_l2_cout_s 		),
								
        .clk 					(clk 					),
        .areset 				(areset 				),
        .bus_clk 				(bus_clk 				),
        .bus_areset 			(bus_areset 			)
	);
	`endif

endmodule