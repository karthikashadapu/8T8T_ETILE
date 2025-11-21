// (C) 2001-2024 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


  // (C) 2001-2020 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.

// ==========================================================================
// Project           : HSSI Subsystem 
// Module            : hssi_ss_multi_stream_top.sv
// Description       : 
// Author            : 
// Created           : 
// Changes           : 
//                   : 
// ==========================================================================


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on


module hssi_ss_multi_stream_top #(
	 parameter PORT_CLIENT_IF     	= 0,
    parameter TDATA_WIDTH      	   = 512,
    parameter NO_OF_BYTES  			= TDATA_WIDTH/8, 
    parameter TUSER_WIDTH_TX  	 	= 2 +90 +328,
    parameter TUSER_WIDTH_RX  	 	= 2 +90 +328,
    parameter ST_READY_LATENCY      = 1,  
    parameter TID   				   = 8,  
	 parameter ENABLE_ECC  			= 1,
	 parameter USE_M20K			 	= "ON",
    parameter PORT_PROFILE   	 	= "200G",	
	 parameter NUM_SEG               = (PORT_PROFILE == "200G")? 8 : 16,  
    parameter NUM_OF_STREAM   		= 1 //2  
	
) (
    input   			             		 	 				i_tx_clk, 
    input   			             		 	 				i_tx_reset_n,
    input   			             		 	 				i_rx_clk, 
    input   			             		 	 				i_rx_reset_n,
/////////// TX ports ///////////////////		 		 	
    //AXI Stream Tx, from User interface		 
			 //SINGLE PACKET COMPATIBLE SIGNALS		 	         
	 input 															i_av_st_tx_ready,	 
    input  [NUM_OF_STREAM-1:0] 								i_axi_st_tx_tvalid,
    input  [NUM_OF_STREAM-1:0][TDATA_WIDTH-1:0] 		 i_axi_st_tx_tdata,
    input  [NUM_OF_STREAM-1:0]       						i_axi_st_tx_tlast,
    input  [NUM_OF_STREAM-1:0][NO_OF_BYTES-1:0]			i_axi_st_tx_tkeep,
    input  [NUM_OF_STREAM-1:0][TUSER_WIDTH_TX-1:0] 		i_axi_st_tx_tuser,
    input  [NUM_OF_STREAM-1:0][TID-1:0]       			i_axi_st_tx_tid,
			 //MULTI PACKET COMPATIBLE SIGNALS		   	     
	 output reg	[NUM_OF_STREAM-1:0]							o_axi_st_tx_tready,
			
    //Avalon Stream Tx, to MAC interface		   		
    output reg  [TDATA_WIDTH-1:0]           				o_axi_st_tx_tdata,
    output reg                          					o_axi_st_tx_tvalid,
    output reg  [NUM_SEG-1:0][8-1:0]  						o_axi_st_tx_tkeep_seg,
	 output reg  [NUM_SEG-1:0]									o_axi_st_tx_tlast_seg,	
    output reg  [TUSER_WIDTH_TX-1:0]      				o_axi_st_tx_tuser,
													 
/////////// RX ports ////////////////////	     
	//////////////////////////////////////////												 
    //Avalon Stream Rx, from MAC interface		 
	//SOP ALIGNED COMPATIBLE SIGNALS		         
	//MAC_SEGMENTED COMPATIBLE SIGNALS		         
    input                           						i_axi_st_rx_tvalid,
    input   [TDATA_WIDTH-1:0]           					i_axi_st_rx_tdata,
    input   [NUM_SEG-1:0]         							i_axi_st_rx_tlast_seg,
    input   [NUM_SEG-1:0] [8-1:0] 							i_axi_st_rx_tkeep_seg,
    input   [TUSER_WIDTH_RX-1:0]      						i_axi_st_rx_tuser,
													 
    //AXI Stream Rx, to User interface				 
    output reg [NUM_OF_STREAM-1:0]        				o_axi_st_rx_tvalid,
    output reg [NUM_OF_STREAM-1:0] [TDATA_WIDTH-1:0]  o_axi_st_rx_tdata,
    output reg [NUM_OF_STREAM-1:0] [NO_OF_BYTES-1:0]  o_axi_st_rx_tkeep,
    output reg [NUM_OF_STREAM-1:0]    		    			o_axi_st_rx_tlast,
    output reg [NUM_OF_STREAM-1:0][TUSER_WIDTH_RX-1:0]	o_axi_st_rx_tuser,
    output reg [NUM_OF_STREAM-1:0][1-1:0]				o_axi_st_rx_tuser_valid,
    output reg [NUM_OF_STREAM-1:0][TID-1:0]       		o_axi_st_rx_tid
	
);

//***********************************************************
//***********************************************************

//--------------------------------------------------------------------------------------------------
//          MULTI STREAM INSTANCES
//--------------------------------------------------------------------------------------------------

generate if ((NUM_OF_STREAM == 2) && (PORT_PROFILE == "200G"))
begin : MULTI_STREAM_200x2
	hssi_ss_ms_200x2_tx #(
		.AXI_DW      	(TDATA_WIDTH),
		.TUSER  		(TUSER_WIDTH_TX),
		.TID 	   	 	(TID),
		.READY_LATENCY  (ST_READY_LATENCY),
		.ENABLE_ECC  	(ENABLE_ECC),
		.USE_M20K		(USE_M20K)
	)hssi_ss_ms_200x2_tx_inst(
		.i_tx_clk				(i_tx_clk),
		.i_tx_reset_n			(i_tx_reset_n),															   
		.o_axi_st_tx_tready		(o_axi_st_tx_tready),		
		.i_axi_st_tx_tvalid      (i_axi_st_tx_tvalid),
		.i_axi_st_tx_tdata       (i_axi_st_tx_tdata),
		.i_axi_st_tx_tkeep       (i_axi_st_tx_tkeep),
		.i_axi_st_tx_tlast       (i_axi_st_tx_tlast),
		.i_axi_st_tx_tuser       (i_axi_st_tx_tuser),
		.i_axi_st_tx_oid         (i_axi_st_tx_tid),
		.i_av_st_tx_ready	    	 (i_av_st_tx_ready),
		.o_axi_st_tx_tdata       (o_axi_st_tx_tdata),
		.o_axi_st_tx_tvalid      (o_axi_st_tx_tvalid),
		.o_axi_st_tx_tkeep_seg   (o_axi_st_tx_tkeep_seg),
		.o_axi_st_tx_tlast_seg   (o_axi_st_tx_tlast_seg),
		.o_axi_st_tx_tuser        (o_axi_st_tx_tuser)
	);
			
	hssi_ss_ms_200x2_rx #(	
		.AXI_DW      	(TDATA_WIDTH),
		.TUSER  		(TUSER_WIDTH_RX),
		.TID 		 	(TID)
	)hssi_ss_ms_200x2_rx_inst(
		.i_rx_clk				(i_rx_clk), 
	    .i_rx_reset_n			(i_rx_reset_n),	    
	    .i_axi_st_rx_tvalid		(i_axi_st_rx_tvalid),
	    .i_axi_st_rx_tdata		(i_axi_st_rx_tdata),
	    .i_axi_st_rx_tlast_seg	(i_axi_st_rx_tlast_seg),
	    .i_axi_st_rx_tkeep_seg	(i_axi_st_rx_tkeep_seg),
	    .i_axi_st_rx_tuser		(i_axi_st_rx_tuser),	    	   
	    .o_axi_st_rx_tvalid		(o_axi_st_rx_tvalid),
	    .o_axi_st_rx_tdata		(o_axi_st_rx_tdata),
	    .o_axi_st_rx_tlast		(o_axi_st_rx_tlast),
	    .o_axi_st_rx_tkeep		(o_axi_st_rx_tkeep),
		 .o_axi_st_rx_tid		   (o_axi_st_rx_tid),
	    .o_axi_st_rx_tuser      (o_axi_st_rx_tuser),
       .o_axi_st_rx_tuser_valid (o_axi_st_rx_tuser_valid)
	);
end

else if ((NUM_OF_STREAM == 4) && (PORT_PROFILE == "200G"))
begin : MULTI_STREAM_200x4	
	hssi_ss_ms_200x4_tx #(
		.AXI_DW      	(TDATA_WIDTH),
		.TUSER  		(TUSER_WIDTH_TX),
		.TID 	   	 	(TID),
		.READY_LATENCY  (ST_READY_LATENCY),
		.ENABLE_ECC  	(ENABLE_ECC),
		.USE_M20K		(USE_M20K)
	)hssi_ss_ms_200x4_tx_inst(
		.i_tx_clk				(i_tx_clk),
		.i_tx_reset_n			(i_tx_reset_n),															   
		.o_axi_st_tx_tready		(o_axi_st_tx_tready),		
		.i_axi_st_tx_tvalid      (i_axi_st_tx_tvalid),
		.i_axi_st_tx_tdata       (i_axi_st_tx_tdata),
		.i_axi_st_tx_tkeep       (i_axi_st_tx_tkeep),
		.i_axi_st_tx_tlast       (i_axi_st_tx_tlast),
		.i_axi_st_tx_tuser       (i_axi_st_tx_tuser),
		.i_axi_st_tx_oid         (i_axi_st_tx_tid),
		.i_av_st_tx_ready	    (i_av_st_tx_ready),
		.o_axi_st_tx_tdata       (o_axi_st_tx_tdata),
		.o_axi_st_tx_tvalid      (o_axi_st_tx_tvalid),
		.o_axi_st_tx_tkeep_seg   (o_axi_st_tx_tkeep_seg),
		.o_axi_st_tx_tlast_seg   (o_axi_st_tx_tlast_seg),
		.o_axi_st_tx_tuser        (o_axi_st_tx_tuser)
	);
			
	hssi_ss_ms_200x4_rx #(	
		.AXI_DW      	(TDATA_WIDTH),
		.TUSER  		(TUSER_WIDTH_RX),
		.TID 		 	(TID)
	)hssi_ss_ms_200x4_rx_inst(
		.i_rx_clk					(i_rx_clk), 
	   .i_rx_reset_n				(i_rx_reset_n),	    
	   .i_axi_st_rx_tvalid		(i_axi_st_rx_tvalid),
	   .i_axi_st_rx_tdata		(i_axi_st_rx_tdata),
	   .i_axi_st_rx_tlast_seg	(i_axi_st_rx_tlast_seg),
	   .i_axi_st_rx_tkeep_seg	(i_axi_st_rx_tkeep_seg),
	   .i_axi_st_rx_tuser		(i_axi_st_rx_tuser),	    	   
	   .o_axi_st_rx_tvalid		(o_axi_st_rx_tvalid),
	   .o_axi_st_rx_tdata		(o_axi_st_rx_tdata),
	   .o_axi_st_rx_tlast		(o_axi_st_rx_tlast),
	   .o_axi_st_rx_tkeep		(o_axi_st_rx_tkeep),
	   .o_axi_st_rx_tuser     	(o_axi_st_rx_tuser),
      .o_axi_st_rx_tuser_valid (o_axi_st_rx_tuser_valid)
	);
end

else if ((NUM_OF_STREAM == 2) && (PORT_PROFILE == "400G"))
begin : MULTI_STREAM_400x2	
	hssi_ss_ms_400x2_tx #(
		.AXI_DW      	(TDATA_WIDTH),
		.TUSER  		(TUSER_WIDTH_TX),
		.TID 	   	 	(TID),
		.READY_LATENCY  (ST_READY_LATENCY),
		.ENABLE_ECC  	(ENABLE_ECC),
		.USE_M20K		(USE_M20K)
	)hssi_ss_ms_400x2_tx_inst(
		.i_tx_clk				(i_tx_clk),
		.i_tx_reset_n			(i_tx_reset_n),															   
		.o_axi_st_tx_tready		(o_axi_st_tx_tready),		
		.i_axi_st_tx_tvalid      (i_axi_st_tx_tvalid),
		.i_axi_st_tx_tdata       (i_axi_st_tx_tdata),
		.i_axi_st_tx_tkeep       (i_axi_st_tx_tkeep),
		.i_axi_st_tx_tlast       (i_axi_st_tx_tlast),
		.i_axi_st_tx_tuser       (i_axi_st_tx_tuser),
		.i_axi_st_tx_oid         (i_axi_st_tx_tid),
		.i_av_st_tx_ready	    (i_av_st_tx_ready),
		.o_axi_st_tx_tdata       (o_axi_st_tx_tdata),
		.o_axi_st_tx_tvalid      (o_axi_st_tx_tvalid),
		.o_axi_st_tx_tkeep_seg   (o_axi_st_tx_tkeep_seg),
		.o_axi_st_tx_tlast_seg   (o_axi_st_tx_tlast_seg),
		.o_axi_st_tx_tuser        (o_axi_st_tx_tuser)
	);
			
	hssi_ss_ms_400x2_rx #(	
		.AXI_DW      	(TDATA_WIDTH),
		.TUSER  		(TUSER_WIDTH_RX),
		.TID 		 	(TID)
	)hssi_ss_ms_400x2_rx_inst(
		.i_rx_clk				(i_rx_clk), 
	    .i_rx_reset_n			(i_rx_reset_n),	    
	    .i_axi_st_rx_tvalid		(i_axi_st_rx_tvalid),
	    .i_axi_st_rx_tdata		(i_axi_st_rx_tdata),
	    .i_axi_st_rx_tlast_seg	(i_axi_st_rx_tlast_seg),
	    .i_axi_st_rx_tkeep_seg	(i_axi_st_rx_tkeep_seg),
	    .i_axi_st_rx_tuser		(i_axi_st_rx_tuser),	    	   
	    .o_axi_st_rx_tvalid		(o_axi_st_rx_tvalid),
	    .o_axi_st_rx_tdata		(o_axi_st_rx_tdata),
	    .o_axi_st_rx_tlast		(o_axi_st_rx_tlast),
	    .o_axi_st_rx_tkeep		(o_axi_st_rx_tkeep),
	    .o_axi_st_rx_tuser       (o_axi_st_rx_tuser),
	    .o_axi_st_rx_tuser_valid (o_axi_st_rx_tuser_valid)
	);
end

else if ((NUM_OF_STREAM == 4) && (PORT_PROFILE == "400G"))
begin : MULTI_STREAM_400x4	
	hssi_ss_ms_400x4_tx #(
		.AXI_DW      	(TDATA_WIDTH),
		.TUSER  		(TUSER_WIDTH_TX),
		.TID 	   	 	(TID),
		.READY_LATENCY  (ST_READY_LATENCY),
		.ENABLE_ECC  	(ENABLE_ECC),
		.USE_M20K		(USE_M20K)
	)hssi_ss_ms_400x4_tx_inst(
		.i_tx_clk				(i_tx_clk),
		.i_tx_reset_n			(i_tx_reset_n),															   
		.o_axi_st_tx_tready		(o_axi_st_tx_tready),		
		.i_axi_st_tx_tvalid      (i_axi_st_tx_tvalid),
		.i_axi_st_tx_tdata       (i_axi_st_tx_tdata),
		.i_axi_st_tx_tkeep       (i_axi_st_tx_tkeep),
		.i_axi_st_tx_tlast       (i_axi_st_tx_tlast),
		.i_axi_st_tx_tuser       (i_axi_st_tx_tuser),
		.i_axi_st_tx_oid         (i_axi_st_tx_tid),
		.i_av_st_tx_ready	    (i_av_st_tx_ready),
		.o_axi_st_tx_tdata       (o_axi_st_tx_tdata),
		.o_axi_st_tx_tvalid      (o_axi_st_tx_tvalid),
		.o_axi_st_tx_tkeep_seg   (o_axi_st_tx_tkeep_seg),
		.o_axi_st_tx_tlast_seg   (o_axi_st_tx_tlast_seg),
		.o_axi_st_tx_tuser        (o_axi_st_tx_tuser)
	);
			
	hssi_ss_ms_400x4_rx #(	
		.AXI_DW      	(TDATA_WIDTH),
		.TUSER  		(TUSER_WIDTH_RX),
		.TID 		 	(TID)
	)hssi_ss_ms_400x4_rx_inst(
		.i_rx_clk				(i_rx_clk), 
	    .i_rx_reset_n			(i_rx_reset_n),	    
	    .i_axi_st_rx_tvalid		(i_axi_st_rx_tvalid),
	    .i_axi_st_rx_tdata		(i_axi_st_rx_tdata),
	    .i_axi_st_rx_tlast_seg	(i_axi_st_rx_tlast_seg),
	    .i_axi_st_rx_tkeep_seg	(i_axi_st_rx_tkeep_seg),
	    .i_axi_st_rx_tuser		(i_axi_st_rx_tuser),	    	   
	    .o_axi_st_rx_tvalid		(o_axi_st_rx_tvalid),
	    .o_axi_st_rx_tdata		(o_axi_st_rx_tdata),
	    .o_axi_st_rx_tlast		(o_axi_st_rx_tlast),
	    .o_axi_st_rx_tkeep		(o_axi_st_rx_tkeep),
	    .o_axi_st_rx_tuser       (o_axi_st_rx_tuser),
       .o_axi_st_rx_tuser_valid (o_axi_st_rx_tuser_valid)
	);
end
				
endgenerate
		
	
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6ytx9RJMUJpDR1pKNqpO41P65xkhNGa8v0mn2eij+FhdrxYxjeeIR3izVFn8oT4u22+3nLKtvATcy/ONVYlqHd2NeIQbaJn5CXoFYLJXQE7RvPsmG2NSdcCZ8RL2wxPE45G17oADpKMWgeHcxPcYmHSvdVY7oO6Q0twX8ObvG6Yi0VmVe6gCln8gTJCZR9IIIBLw/iczjKmPMT0M/4UA7Lc6C7mzVAx4eMOj1dfxcZfN/1FhXocOg8wWpJwFkdkyx9mmFiU/1GsUV1jXFgw2sB/pjK8izbwmmMDV89sYHxOhJ9/QZeyImV+wj3bsjlIb5Akk3p9pGnCgKIbZPhHseCWyp6cr8qHbmSXaB+hGEKfI6Zi/AffaEuJjBfb2dW9xwo0dnleL3q8kmJI7kL8QIwxCjfM+R1gmyZ5i7NwuMMyS6MTO8TT6UJA51/7Qa01CNykYcVhcr03s/KsTUb1C7cgQWpqyQIxGTK54Od2Tte7jp/XvmkqWrPj3DR7jLkJsQWUVSVNPtyF4FznwdmIAfW7assacb3+zWR3mIL7p3C5GJuPr9v2hU4sS3MPmL3B6gDx7brUsnw/Jxn4rb6oNXBcZnF5mhC6WzdsTT7TD1q49lUVgBXSYKPU+A7lCo8QgRZ9cGb81FQeorcd3d5+zE2xJ0CVKMetWeX8nyPrzYFakQscaNbQsRpQVotrMwvCe33CXz51I5KlEqXf/p3C3wtqIetOXzxJ1SobxTIE9HpfrfnRKDC5aUnH7sbHimx8zuKxjzFC0oVBhIiIeSc5PJdhv"
`endif