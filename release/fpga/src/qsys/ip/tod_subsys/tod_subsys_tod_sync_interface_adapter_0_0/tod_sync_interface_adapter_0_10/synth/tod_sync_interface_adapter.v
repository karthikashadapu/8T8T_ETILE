//**********************************************************************************************************
//
// SPDX-License-Identifier: MIT-0
// Copyright(c) 2022-2022 Intel Corporation.
//
//**********************************************************************************************************
//
// TOD's Synchronizer Interface Conduit Adapter
// A conduit role remapper for TOD's Synchronizer interface. Note: Supports up to 10 Rx and Tx interfaces 
//
//**********************************************************************************************************

`timescale 1 ps / 1 ps
module tod_sync_interface_adapter (
                input              clk,
                input              rst_n,
		input  wire [95:0] time_of_day_96b,     	//      time_of_day_96b.data
		input  wire        valid          ,
		// Rx interfaces up to 10
		
		// Tx interfaces up to 10
		
		output wire [95:0] tx0_tod_master_data,  	//   tx0_tod_master_data.data
		
		output wire [95:0] tx1_tod_master_data,  	//   tx1_tod_master_data.data
		
		output wire [95:0] tx2_tod_master_data,
		
		output wire [95:0] tx3_tod_master_data,
		
		output wire [95:0] rx0_tod_master_data,
		
		output wire        valid_0
		
	);

	
	assign tx0_tod_master_data = time_of_day_96b;
	
	assign tx1_tod_master_data = time_of_day_96b;
	
	assign tx2_tod_master_data = time_of_day_96b;
	
	assign tx3_tod_master_data = time_of_day_96b;
	
	assign rx0_tod_master_data = time_of_day_96b;
	

	
	assign valid_0 = 1'b1  ;
	


endmodule
