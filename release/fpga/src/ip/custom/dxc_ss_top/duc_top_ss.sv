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
 module duc_top_ss 
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
	
	
	input  [31:0]                    duc_l1_busIn_writedata      ,
	input  [11:0 ]                   duc_l1_busIn_address        ,//--ufix14
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
	
												
    input 				DUC_Valid_l1_s 			,//-- ufix1
    input 	[7:0]		DUC_Chan_l1_s 			,//-- ufix8
    input 	[15:0]		DUC_Data_l1_im 			,// -- sfix16_en14
    input 	[15:0]		DUC_Data_l1_re 			,// -- sfix16_en14
												
	input 				DUC_Valid_l2_s 			,//-- ufix1
	input 	[7:0]		DUC_Chan_l2_s 			,//-- ufix8
	input 	[15:0]		DUC_Data_l2_im 			,// -- sfix16_en14
	input 	[15:0]		DUC_Data_l2_re 			,// -- sfix16_en14

    input 				DUC_NCO_sync_0 			,//-- ufix1
    input 				DUC_NCO_sync_1 			,//-- ufix1
    input 				DUC_NCO_sync_2 			,//-- ufix1
    input 				DUC_NCO_sync_3 			,//-- ufix1
												
    input 	[7:0]		BW_Config_CC1_s 		,//-- ufix8
												
	input 	[7:0]		BW_Config_CC2_s 		,//-- ufix8
												
	output				DUC_Valid_Out_s 		,// -- ufix1
	output	[7:0]		DUC_Chan_Out_s 			,// -- ufix8
	output	[15:0]		DUC_Ant_Data_Out_0im	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_0re	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_1im	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_1re	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_2im	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_2re	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_3im	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_3re	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_4im	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_4re	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_5im	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_5re	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_6im	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_6re	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_7im	,//  -- sfix16_en14
	output	[15:0]		DUC_Ant_Data_Out_7re	,//  -- sfix16_en14		
												
	output				duc_l1_vout_s 			,// -- ufix1
	output	[7:0]		duc_l1_cout_s 			,// -- ufix8
	output	[15:0]		duc_l1_dout_0im 		,//  -- sfix16_en14
	output	[15:0]		duc_l1_dout_0re 		,//  -- sfix16_en14
	output	[15:0]		duc_l1_dout_1im 		,//  -- sfix16_en14
	output	[15:0]		duc_l1_dout_1re 		,//  -- sfix16_en14
	output	[15:0]		duc_l1_dout_2im 		,//  -- sfix16_en14
	output	[15:0]		duc_l1_dout_2re 		,//  -- sfix16_en14
	output	[15:0]		duc_l1_dout_3im 		,//  -- sfix16_en14
	output	[15:0]		duc_l1_dout_3re 		,//  -- sfix16_en14
												
	output				duc_l2_vout_s 			,//:= (others => '0');  -- ufix1
	output	[7:0]		duc_l2_cout_s 			,//:= (others => '0');  -- ufix8
	output	[15:0]		duc_l2_dout_0im 		,//:= (others => '0');  -- sfix16_en14
	output	[15:0]		duc_l2_dout_0re 		,//:= (others => '0');  -- sfix16_en14
	output	[15:0]		duc_l2_dout_1im 		,//:= (others => '0');  -- sfix16_en14
	output	[15:0]		duc_l2_dout_1re 		,//:= (others => '0');  -- sfix16_en14
	output	[15:0]		duc_l2_dout_2im 		,//:= (others => '0');  -- sfix16_en14
	output	[15:0]		duc_l2_dout_2re 		,//:= (others => '0');  -- sfix16_en14
	output	[15:0]		duc_l2_dout_3im 		,//:= (others => '0');  -- sfix16_en14
	output	[15:0]		duc_l2_dout_3re 		,//:= (others => '0');  -- sfix16_en14
												
	output				summer_vout_s 			,// -- ufix1
	output	[7:0]		summer_cout_s 			,// -- ufix8
	output	[15:0]		summer_dout_0im 		,//  -- sfix16_en14
	output	[15:0]		summer_dout_0re 		,//  -- sfix16_en14
	output	[15:0]		summer_dout_1im 		,//  -- sfix16_en14
	output	[15:0]		summer_dout_1re 		,//  -- sfix16_en14
	output	[15:0]		summer_dout_2im 		,//  -- sfix16_en14
	output	[15:0]		summer_dout_2re 		,//  -- sfix16_en14
	output	[15:0]		summer_dout_3im 		,//  -- sfix16_en14
	output	[15:0]		summer_dout_3re 		,//  -- sfix16_en14
												
    input 				clk 					,//
    input 				areset 					,//
    input 				bus_clk 				,//
    input 				bus_areset 				
 );	
`include "../common/def_param.vh" 
 
wire 			DUC_Valid_l1_s_sig 	;
wire [7:0]		DUC_Chan_l1_s_sig 	;
wire [15:0]		DUC_Data_l1_0im_sig ;
wire [15:0]		DUC_Data_l1_0re_sig ;
wire [15:0]		DUC_Data_l1_1im_sig ;
wire [15:0]		DUC_Data_l1_1re_sig ;
wire [15:0]		DUC_Data_l1_2im_sig ;
wire [15:0]		DUC_Data_l1_2re_sig ;
wire [15:0]		DUC_Data_l1_3im_sig ;
wire [15:0]		DUC_Data_l1_3re_sig ;

wire 			DUC_Valid_l2_s_sig 	;
wire [7:0]		DUC_Chan_l2_s_sig 	;
wire [15:0]		DUC_Data_l2_0im_sig ;
wire [15:0]		DUC_Data_l2_0re_sig ;
wire [15:0]		DUC_Data_l2_1im_sig ;
wire [15:0]		DUC_Data_l2_1re_sig ;
wire [15:0]		DUC_Data_l2_2im_sig ;
wire [15:0]		DUC_Data_l2_2re_sig ;
wire [15:0]		DUC_Data_l2_3im_sig ;
wire [15:0]		DUC_Data_l2_3re_sig ;

// Code Specific to test CC1 (if NUM_CC_ONE is defined)	
	`ifdef NUM_CC_ONE
	duc_model_DUT dut_duc_l1	
	(
			//---------- INPUT DUC_DUT
			.busIn_writedata 			(duc_l1_busIn_writedata			),
			.busIn_address 				({2'b0,duc_l1_busIn_address }	),
			.busIn_write 				(duc_l1_busIn_write          	),
			.busIn_read 				(duc_l1_busIn_read           	),
			.busOut_readdatavalid 		(duc_l1_busOut_readdatavalid 	),//busOut_readdatavalid
			.busOut_readdata 			(duc_l1_busOut_readdata      	),//busOut_readdata
			.busOut_waitrequest 		(duc_l1_busOut_waitrequest   	),//busOut_waitrequest
										
			.DUC_Valid_l1_s 			(DUC_Valid_l1_s			),
			.DUC_Chan_l1_s 				(DUC_Chan_l1_s 			),
			.DUC_Data_l1_im 			(DUC_Data_l1_im			),
			.DUC_Data_l1_re 			(DUC_Data_l1_re			),
										
			.DUC_NCO_sync_0 			(DUC_NCO_sync_0 		),
			.DUC_NCO_sync_1 			(DUC_NCO_sync_1 		),
			.DUC_NCO_sync_2 			(DUC_NCO_sync_2 		),
			.DUC_NCO_sync_3 			(DUC_NCO_sync_3 		),
										
			.BW_Config_CC1_s 			(BW_Config_CC1_s		),
			//-------- OUTPUT DUC_DUT     CM OUT
			.DUC_Valid_Out_s 			(DUC_Valid_l1_s_sig		),
			.DUC_Chan_Out_s 			(DUC_Chan_l1_s_sig		),
			.DUC_Data_Out_0im 			(DUC_Data_l1_0im_sig	),
			.DUC_Data_Out_0re 			(DUC_Data_l1_0re_sig	),
			.DUC_Data_Out_1im 			(DUC_Data_l1_1im_sig	),
			.DUC_Data_Out_1re 			(DUC_Data_l1_1re_sig	),
			.DUC_Data_Out_2im 			(DUC_Data_l1_2im_sig	),
			.DUC_Data_Out_2re 			(DUC_Data_l1_2re_sig	),
			.DUC_Data_Out_3im 			(DUC_Data_l1_3im_sig	),
			.DUC_Data_Out_3re 			(DUC_Data_l1_3re_sig	),
										
			//------- EXTRA SIGNALS      
			.duc_l1_vout_s 				(duc_l1_vout_s 			),
			.duc_l1_cout_s 				(duc_l1_cout_s 			),
			.duc_l1_dout_0im 			(duc_l1_dout_0im		),
			.duc_l1_dout_0re 			(duc_l1_dout_0re		),
			.duc_l1_dout_1im 			(duc_l1_dout_1im		),
			.duc_l1_dout_1re 			(duc_l1_dout_1re		),
			.duc_l1_dout_2im 			(duc_l1_dout_2im		),
			.duc_l1_dout_2re 			(duc_l1_dout_2re		),
			.duc_l1_dout_3im 			(duc_l1_dout_3im		),
			.duc_l1_dout_3re 			(duc_l1_dout_3re		),
										
			.clk 						(clk 					),
			.areset 					(areset 				),
			.bus_clk 					(bus_clk 				),
			.bus_areset 				(bus_areset 			)
	);
	
	
   ca_interp_DUT dut_ca_interp 
   (
   			//---------- INPUT CA_INTERP_DUT
			.busIn_writedata 			(ca_interp_busIn_writedata      ),
			.busIn_address 				({7'b0,ca_interp_busIn_address }),
			.busIn_write 				(ca_interp_busIn_write          ),
			.busIn_read 				(ca_interp_busIn_read           ),
			.busOut_readdatavalid 		(ca_interp_busOut_readdatavalid ),
			.busOut_readdata 			(ca_interp_busOut_readdata      ),
			.busOut_waitrequest 		(ca_interp_busOut_waitrequest   ),
																 
			.DUC_Valid_l1_s 			(DUC_Valid_l1_s_sig		),
			.DUC_Chan_l1_s 				(DUC_Chan_l1_s_sig		),
			.DUC_Data_l1_0im 			(DUC_Data_l1_0im_sig	),
			.DUC_Data_l1_0re 			(DUC_Data_l1_0re_sig	),
			.DUC_Data_l1_1im 			(DUC_Data_l1_1im_sig	),
			.DUC_Data_l1_1re 			(DUC_Data_l1_1re_sig	),
			.DUC_Data_l1_2im 			(DUC_Data_l1_2im_sig	),
			.DUC_Data_l1_2re 			(DUC_Data_l1_2re_sig	),
			.DUC_Data_l1_3im 			(DUC_Data_l1_3im_sig	),
			.DUC_Data_l1_3re 			(DUC_Data_l1_3re_sig	),
																 
			.DUC_Valid_l2_s 			(1'b0 	),
			.DUC_Chan_l2_s 				(8'b0	),
			.DUC_Data_l2_0im 			(16'b0	),
			.DUC_Data_l2_0re 			(16'b0	),
			.DUC_Data_l2_1im 			(16'b0	),
			.DUC_Data_l2_1re 			(16'b0	),
			.DUC_Data_l2_2im 			(16'b0	),
			.DUC_Data_l2_2re 			(16'b0	),
			.DUC_Data_l2_3im 			(16'b0	),
			.DUC_Data_l2_3re 			(16'b0	),
																 
			//.---------- OUTPUT CA_INTERP_DUT                      
			.DUC_Valid_Out_s 			(DUC_Valid_Out_s 		),
			.DUC_Chan_Out_s 			(DUC_Chan_Out_s 		),
			.DUC_Ant_Data_Out_0im 		(DUC_Ant_Data_Out_0im 	),
			.DUC_Ant_Data_Out_0re 		(DUC_Ant_Data_Out_0re 	),
			.DUC_Ant_Data_Out_1im 		(DUC_Ant_Data_Out_1im 	),
			.DUC_Ant_Data_Out_1re 		(DUC_Ant_Data_Out_1re 	),
			.DUC_Ant_Data_Out_2im 		(DUC_Ant_Data_Out_2im 	),
			.DUC_Ant_Data_Out_2re 		(DUC_Ant_Data_Out_2re 	),
			.DUC_Ant_Data_Out_3im 		(DUC_Ant_Data_Out_3im 	),
			.DUC_Ant_Data_Out_3re 		(DUC_Ant_Data_Out_3re 	),
			.DUC_Ant_Data_Out_4im 		(DUC_Ant_Data_Out_4im 	),
			.DUC_Ant_Data_Out_4re 		(DUC_Ant_Data_Out_4re 	),
			.DUC_Ant_Data_Out_5im 		(DUC_Ant_Data_Out_5im 	),
			.DUC_Ant_Data_Out_5re 		(DUC_Ant_Data_Out_5re 	),
			.DUC_Ant_Data_Out_6im 		(DUC_Ant_Data_Out_6im 	),
			.DUC_Ant_Data_Out_6re 		(DUC_Ant_Data_Out_6re 	),
			.DUC_Ant_Data_Out_7im 		(DUC_Ant_Data_Out_7im 	),
			.DUC_Ant_Data_Out_7re 		(DUC_Ant_Data_Out_7re 	),
																 
			//.---------- EXTRA SIGNAL                              
			.summer_vout_s 				(summer_vout_s 			),
			.summer_cout_s 				(summer_cout_s 			),
			.summer_dout_0im 			(summer_dout_0im 		),
			.summer_dout_0re 			(summer_dout_0re 		),
			.summer_dout_1im 			(summer_dout_1im 		),
			.summer_dout_1re 			(summer_dout_1re 		),
			.summer_dout_2im 			(summer_dout_2im 		),
			.summer_dout_2re 			(summer_dout_2re 		),
			.summer_dout_3im 			(summer_dout_3im 		),
			.summer_dout_3re 			(summer_dout_3re 		),
																 
			.clk 						(clk			 		),
			.areset	 					(areset	 				),
			.bus_clk 					(bus_clk 				),
			.bus_areset 				(bus_areset				)

	);
	`endif	
	
// Code Specific to test CC2 (if NUM_CC_TWO is defined)	
	`ifdef NUM_CC_TWO
	duc_model_DUT dut_duc_l1	
	(
			//---------- INPUT DUC_DUT
			.busIn_writedata 			(duc_l1_busIn_writedata			),
			.busIn_address 				({2'b0,duc_l1_busIn_address }	),
			.busIn_write 				(duc_l1_busIn_write          	),
			.busIn_read 				(duc_l1_busIn_read           	),
			.busOut_readdatavalid 		(duc_l1_busOut_readdatavalid 	),//busOut_readdatavalid
			.busOut_readdata 			(duc_l1_busOut_readdata      	),//busOut_readdata
			.busOut_waitrequest 		(duc_l1_busOut_waitrequest   	),//busOut_waitrequest
										
			.DUC_Valid_l1_s 			(DUC_Valid_l1_s			),
			.DUC_Chan_l1_s 				(DUC_Chan_l1_s 			),
			.DUC_Data_l1_im 			(DUC_Data_l1_im			),
			.DUC_Data_l1_re 			(DUC_Data_l1_re			),
										
			.DUC_NCO_sync_0 			(DUC_NCO_sync_0 		),
			.DUC_NCO_sync_1 			(DUC_NCO_sync_1 		),
			.DUC_NCO_sync_2 			(DUC_NCO_sync_2 		),
			.DUC_NCO_sync_3 			(DUC_NCO_sync_3 		),
										
			.BW_Config_CC1_s 			(BW_Config_CC1_s		),
			//-------- OUTPUT DUC_DUT     CM OUT
			.DUC_Valid_Out_s 			(DUC_Valid_l1_s_sig		),
			.DUC_Chan_Out_s 			(DUC_Chan_l1_s_sig		),
			.DUC_Data_Out_0im 			(DUC_Data_l1_0im_sig	),
			.DUC_Data_Out_0re 			(DUC_Data_l1_0re_sig	),
			.DUC_Data_Out_1im 			(DUC_Data_l1_1im_sig	),
			.DUC_Data_Out_1re 			(DUC_Data_l1_1re_sig	),
			.DUC_Data_Out_2im 			(DUC_Data_l1_2im_sig	),
			.DUC_Data_Out_2re 			(DUC_Data_l1_2re_sig	),
			.DUC_Data_Out_3im 			(DUC_Data_l1_3im_sig	),
			.DUC_Data_Out_3re 			(DUC_Data_l1_3re_sig	),
										
			//------- EXTRA SIGNALS      
			.duc_l1_vout_s 				(duc_l1_vout_s 			),
			.duc_l1_cout_s 				(duc_l1_cout_s 			),
			.duc_l1_dout_0im 			(duc_l1_dout_0im		),
			.duc_l1_dout_0re 			(duc_l1_dout_0re		),
			.duc_l1_dout_1im 			(duc_l1_dout_1im		),
			.duc_l1_dout_1re 			(duc_l1_dout_1re		),
			.duc_l1_dout_2im 			(duc_l1_dout_2im		),
			.duc_l1_dout_2re 			(duc_l1_dout_2re		),
			.duc_l1_dout_3im 			(duc_l1_dout_3im		),
			.duc_l1_dout_3re 			(duc_l1_dout_3re		),
										
			.clk 						(clk 					),
			.areset 					(areset 				),
			.bus_clk 					(bus_clk 				),
			.bus_areset 				(bus_areset 			)
	);

	duc_model_DUT dut_duc_l2	
	(
			//---------- INPUT DUC_DUT
			.busIn_writedata 			(duc_l2_busIn_writedata			),
			.busIn_address 				({2'b0,duc_l2_busIn_address }	),
			.busIn_write 				(duc_l2_busIn_write          	),
			.busIn_read 				(duc_l2_busIn_read           	),
			.busOut_readdatavalid 		(duc_l2_busOut_readdatavalid 	),//busOut_readdatavalid
			.busOut_readdata 			(duc_l2_busOut_readdata      	),//busOut_readdata
			.busOut_waitrequest 		(duc_l2_busOut_waitrequest   	),//busOut_waitrequest
										
			.DUC_Valid_l1_s 			(DUC_Valid_l2_s 		),
			.DUC_Chan_l1_s 				(DUC_Chan_l2_s 			),
			.DUC_Data_l1_im 			(DUC_Data_l2_im 		),
			.DUC_Data_l1_re 			(DUC_Data_l2_re 		),
										
			.DUC_NCO_sync_0 			(DUC_NCO_sync_0 		),
			.DUC_NCO_sync_1 			(DUC_NCO_sync_1 		),
			.DUC_NCO_sync_2 			(DUC_NCO_sync_2 		),
			.DUC_NCO_sync_3 			(DUC_NCO_sync_3 		),
										
			.BW_Config_CC1_s 			(BW_Config_CC2_s		),
			//-------- OUTPUT DUC_DUT     CM OUT
			.DUC_Valid_Out_s 			(DUC_Valid_l2_s_sig 	),
			.DUC_Chan_Out_s 			(DUC_Chan_l2_s_sig 		),
			.DUC_Data_Out_0im 			(DUC_Data_l2_0im_sig	),
			.DUC_Data_Out_0re 			(DUC_Data_l2_0re_sig	),
			.DUC_Data_Out_1im 			(DUC_Data_l2_1im_sig	),
			.DUC_Data_Out_1re 			(DUC_Data_l2_1re_sig	),
			.DUC_Data_Out_2im 			(DUC_Data_l2_2im_sig	),
			.DUC_Data_Out_2re 			(DUC_Data_l2_2re_sig	),
			.DUC_Data_Out_3im 			(DUC_Data_l2_3im_sig	),
			.DUC_Data_Out_3re 			(DUC_Data_l2_3re_sig	),
										
			//------- EXTRA SIGNALS      
			.duc_l1_vout_s 				(duc_l2_vout_s 			),
			.duc_l1_cout_s 				(duc_l2_cout_s 			),
			.duc_l1_dout_0im 			(duc_l2_dout_0im		),
			.duc_l1_dout_0re 			(duc_l2_dout_0re		),
			.duc_l1_dout_1im 			(duc_l2_dout_1im		),
			.duc_l1_dout_1re 			(duc_l2_dout_1re		),
			.duc_l1_dout_2im 			(duc_l2_dout_2im		),
			.duc_l1_dout_2re 			(duc_l2_dout_2re		),
			.duc_l1_dout_3im 			(duc_l2_dout_3im		),
			.duc_l1_dout_3re 			(duc_l2_dout_3re		),
										
			.clk 						(clk 					),
			.areset 					(areset 				),
			.bus_clk 					(bus_clk 				),
			.bus_areset 				(bus_areset 			)
	);
	
	
	
   ca_interp_DUT dut_ca_interp 
   (
   			//---------- INPUT CA_INTERP_DUT
			.busIn_writedata 			(ca_interp_busIn_writedata      ),
			.busIn_address 				({7'b0,ca_interp_busIn_address }),
			.busIn_write 				(ca_interp_busIn_write          ),
			.busIn_read 				(ca_interp_busIn_read           ),
			.busOut_readdatavalid 		(ca_interp_busOut_readdatavalid ),
			.busOut_readdata 			(ca_interp_busOut_readdata      ),
			.busOut_waitrequest 		(ca_interp_busOut_waitrequest   ),
																 
			.DUC_Valid_l1_s 			(DUC_Valid_l1_s_sig		),
			.DUC_Chan_l1_s 				(DUC_Chan_l1_s_sig		),
			.DUC_Data_l1_0im 			(DUC_Data_l1_0im_sig	),
			.DUC_Data_l1_0re 			(DUC_Data_l1_0re_sig	),
			.DUC_Data_l1_1im 			(DUC_Data_l1_1im_sig	),
			.DUC_Data_l1_1re 			(DUC_Data_l1_1re_sig	),
			.DUC_Data_l1_2im 			(DUC_Data_l1_2im_sig	),
			.DUC_Data_l1_2re 			(DUC_Data_l1_2re_sig	),
			.DUC_Data_l1_3im 			(DUC_Data_l1_3im_sig	),
			.DUC_Data_l1_3re 			(DUC_Data_l1_3re_sig	),
																 
			.DUC_Valid_l2_s 			(DUC_Valid_l2_s_sig 	),
			.DUC_Chan_l2_s 				(DUC_Chan_l2_s_sig 		),
			.DUC_Data_l2_0im 			(DUC_Data_l2_0im_sig	),
			.DUC_Data_l2_0re 			(DUC_Data_l2_0re_sig	),
			.DUC_Data_l2_1im 			(DUC_Data_l2_1im_sig	),
			.DUC_Data_l2_1re 			(DUC_Data_l2_1re_sig	),
			.DUC_Data_l2_2im 			(DUC_Data_l2_2im_sig	),
			.DUC_Data_l2_2re 			(DUC_Data_l2_2re_sig	),
			.DUC_Data_l2_3im 			(DUC_Data_l2_3im_sig	),
			.DUC_Data_l2_3re 			(DUC_Data_l2_3re_sig	),
																 
			//.---------- OUTPUT CA_INTERP_DUT                      
			.DUC_Valid_Out_s 			(DUC_Valid_Out_s 		),
			.DUC_Chan_Out_s 			(DUC_Chan_Out_s 		),
			.DUC_Ant_Data_Out_0im 		(DUC_Ant_Data_Out_0im 	),
			.DUC_Ant_Data_Out_0re 		(DUC_Ant_Data_Out_0re 	),
			.DUC_Ant_Data_Out_1im 		(DUC_Ant_Data_Out_1im 	),
			.DUC_Ant_Data_Out_1re 		(DUC_Ant_Data_Out_1re 	),
			.DUC_Ant_Data_Out_2im 		(DUC_Ant_Data_Out_2im 	),
			.DUC_Ant_Data_Out_2re 		(DUC_Ant_Data_Out_2re 	),
			.DUC_Ant_Data_Out_3im 		(DUC_Ant_Data_Out_3im 	),
			.DUC_Ant_Data_Out_3re 		(DUC_Ant_Data_Out_3re 	),
			.DUC_Ant_Data_Out_4im 		(DUC_Ant_Data_Out_4im 	),
			.DUC_Ant_Data_Out_4re 		(DUC_Ant_Data_Out_4re 	),
			.DUC_Ant_Data_Out_5im 		(DUC_Ant_Data_Out_5im 	),
			.DUC_Ant_Data_Out_5re 		(DUC_Ant_Data_Out_5re 	),
			.DUC_Ant_Data_Out_6im 		(DUC_Ant_Data_Out_6im 	),
			.DUC_Ant_Data_Out_6re 		(DUC_Ant_Data_Out_6re 	),
			.DUC_Ant_Data_Out_7im 		(DUC_Ant_Data_Out_7im 	),
			.DUC_Ant_Data_Out_7re 		(DUC_Ant_Data_Out_7re 	),
																 
			//.---------- EXTRA SIGNAL                              
			.summer_vout_s 				(summer_vout_s 			),
			.summer_cout_s 				(summer_cout_s 			),
			.summer_dout_0im 			(summer_dout_0im 		),
			.summer_dout_0re 			(summer_dout_0re 		),
			.summer_dout_1im 			(summer_dout_1im 		),
			.summer_dout_1re 			(summer_dout_1re 		),
			.summer_dout_2im 			(summer_dout_2im 		),
			.summer_dout_2re 			(summer_dout_2re 		),
			.summer_dout_3im 			(summer_dout_3im 		),
			.summer_dout_3re 			(summer_dout_3re 		),
																 
			.clk 						(clk			 		),
			.areset	 					(areset	 				),
			.bus_clk 					(bus_clk 				),
			.bus_areset 				(bus_areset				)

	);
	
	`endif
	
	



endmodule