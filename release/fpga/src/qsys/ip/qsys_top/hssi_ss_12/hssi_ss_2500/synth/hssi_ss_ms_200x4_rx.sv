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
// Module            : hssi_ss_ms_200x4_rx.sv
// Description       : 
// Author            : 
// Created           : 
// Changes           : 
//                   : 
// ==========================================================================


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on


module hssi_ss_ms_200x4_rx #(
    parameter AXI_DW      	    = 256,
    parameter TUSER  		 	 = 4 +90 +328, 
    parameter TID 		 	 = 8,
    localparam NUM_STREAM       = 4,
    localparam NO_OF_BYTES       = AXI_DW/8,
    localparam AVST_DW      	 = 512,
    localparam NUM_SEG      	 = AVST_DW/64,
    localparam EMPTY_BITS      	 = $clog2(AVST_DW/8)
) (
    input                           	i_rx_clk, 
    input                           	i_rx_reset_n,
																					
    //Avalon Stream Rx, MAC side interface	
    input                           	i_axi_st_rx_tvalid,
    input   [AVST_DW-1:0]           	i_axi_st_rx_tdata,
    input   [NUM_SEG-1:0]         		i_axi_st_rx_tlast_seg,
    input   [NUM_SEG-1:0][8-1:0]		 	i_axi_st_rx_tkeep_seg,
    input   [TUSER-1:0]      				i_axi_st_rx_tuser,
											
    //AXI Stream Rx, User side interface		   
    output reg [NUM_STREAM-1:0]        				o_axi_st_rx_tvalid,
    output reg [NUM_STREAM-1:0] [AXI_DW-1:0]    	o_axi_st_rx_tdata,
    output reg [NUM_STREAM-1:0]    		    			o_axi_st_rx_tlast,
    output reg [NUM_STREAM-1:0] [NO_OF_BYTES-1:0]  o_axi_st_rx_tkeep,
    output reg [NUM_STREAM-1:0] [7-1:0]   			o_axi_st_rx_tid,
    output reg [NUM_STREAM-1:0][TUSER-1:0]				o_axi_st_rx_tuser,
    output reg [NUM_STREAM-1:0][1-1:0]				   o_axi_st_rx_tuser_valid

);

//***********************************************************
//***********************************************************

localparam FIFO_WIDTH = 3+EMPTY_BITS+AVST_DW+TUSER;
localparam FIFO_DEPTH = 5;  ///TODO need to decide fifo depth
localparam BYTES_USED  	 = 8;

reg								axist_rx_tvalid_d1;        
reg	[AVST_DW-1:0]			axist_rx_tdata_d1;         
reg	[TUSER-1:0]				axist_rx_tuser_d1;         
reg	[NUM_SEG-1:0]			axist_rx_tlast_segment_d1;
reg	[NUM_SEG-1:0][8-1:0] axist_rx_tkeep_segment_d1;
reg								axist_rx_tvalid_d2;        
reg	[AVST_DW-1:0]			axist_rx_tdata_d2;         
reg	[TUSER-1:0]				axist_rx_tuser_d2;         
reg	[NUM_SEG-1:0]			axist_rx_tlast_segment_d2;
reg	[NUM_SEG-1:0][8-1:0] axist_rx_tkeep_segment_d2;



reg	[TUSER-1:0]				axist_rx_tuser_d3;         

logic	[NUM_SEG-1:0]			st0_axist_rx_tvalid_d3;        
logic	[AVST_DW-1:0]			st0_axist_rx_tdata_d3;         
logic	[NUM_SEG-1:0][6-1:0]	st0_axist_rx_user_d3;        /// 6=ERR+FCS_ERR+MAC_STS
logic	[NUM_SEG-1:0]			st0_axist_rx_tlast_d3;
logic	[NO_OF_BYTES-1:0]       st0_axist_rx_tkeep_d3;
logic	[96-1:0]       			st0_axist_rx_ptp_its_d3;
logic	[1-1:0]       			st0_axist_rx_tuser_vld_d3;
reg		[4-1:0]   				st0_axist_rx_oid_d4;

logic	[NUM_SEG-1:0]			st1_axist_rx_tvalid_d3;        
logic	[AVST_DW-1:0]			st1_axist_rx_tdata_d3;         
logic	[NUM_SEG-1:0][6-1:0]	st1_axist_rx_user_d3;         
logic	[NUM_SEG-1:0]			st1_axist_rx_tlast_d3;
logic	[NO_OF_BYTES-1:0]    	st1_axist_rx_tkeep_d3;
logic	[96-1:0]       			st1_axist_rx_ptp_its_d3;
logic	[1-1:0]       			st1_axist_rx_tuser_vld_d3;
reg		[4-1:0]   				st1_axist_rx_oid_d4;


reg  [NUM_SEG-1:0]	axist_sop_d1;
reg  [NUM_SEG-1:0]	axist_eop_d1;
reg  [NUM_SEG-1:0]	axist_sop_d2;
reg  [NUM_SEG-1:0]	axist_eop_d2;
reg  [NUM_SEG-1:0]	axist_sop_latch;

logic [2:0]					eop_cntr;
logic [2:0]					sop_cntr;

// logic     strm_cntr [0:NUM_SEG-1] = [1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0];
// logic  [NUM_SEG-1:0]   strm_cntr;
logic  [NUM_SEG-1:0]   strm_cntr_d1;
reg  [NUM_SEG-1:0]   strm_cntr_d2;

wire	[NUM_SEG-1:0][2-1:0]     	rx_mac_error_d2;	
wire	[NUM_SEG-1:0][1-1:0] 		rx_mac_fcs_error_d2;
wire	[NUM_SEG-1:0][3-1:0] 		rx_mac_status_d2;
wire	[96-1:0]      				rx_mac_ptp_its_d2;


/////////////////////////////

always @(posedge i_rx_clk or negedge i_rx_reset_n)
begin
	if (~i_rx_reset_n) begin
		axist_rx_tvalid_d1          <= 1'b0;
		axist_rx_tvalid_d2          <= 1'b0;
		axist_rx_tdata_d1           <= {AVST_DW{1'b0}};
		axist_rx_tdata_d2           <= {AVST_DW{1'b0}};
		axist_rx_tuser_d1           <= {TUSER{1'b0}};
		axist_rx_tuser_d2           <= {TUSER{1'b0}};
		axist_rx_tuser_d3           <= {TUSER{1'b0}};
		axist_rx_tkeep_segment_d1 <= {(NUM_SEG*8){1'b0}};		
		axist_rx_tkeep_segment_d2 <= {(NUM_SEG*8){1'b0}};		
		axist_rx_tlast_segment_d1 <= {NUM_SEG{1'b0}};		
		axist_rx_tlast_segment_d2 <= {NUM_SEG{1'b0}};		
	end
	else begin
		axist_rx_tvalid_d1          <= i_axi_st_rx_tvalid;
		axist_rx_tvalid_d2          <= axist_rx_tvalid_d1;
		axist_rx_tdata_d1           <= i_axi_st_rx_tdata;
		axist_rx_tdata_d2           <= axist_rx_tdata_d1;
		axist_rx_tuser_d1           <= i_axi_st_rx_tuser;
		axist_rx_tuser_d2           <= axist_rx_tuser_d1;
		axist_rx_tuser_d3           <= axist_rx_tuser_d2;
		axist_rx_tkeep_segment_d1 <= i_axi_st_rx_tkeep_seg;	
		axist_rx_tkeep_segment_d2 <= axist_rx_tkeep_segment_d1;	
		axist_rx_tlast_segment_d1 <= i_axi_st_rx_tlast_seg;	
		axist_rx_tlast_segment_d2 <= axist_rx_tlast_segment_d1;	
	end
end

assign	rx_mac_error_d2 	   	= axist_rx_tuser_d2[TUSER-1:96+NUM_SEG*1+NUM_SEG*3];
assign	rx_mac_fcs_error_d2   	= axist_rx_tuser_d2[96+NUM_SEG*1+NUM_SEG*3-1:96+NUM_SEG*3];
assign	rx_mac_status_d2      	= axist_rx_tuser_d2[96+NUM_SEG*3-1:96];
assign	rx_mac_ptp_its_d2  		= axist_rx_tuser_d2[96-1:0];	

generate 
begin: SOP_EOP
genvar i;
	for (i=0; i<NUM_SEG; i=i+1) 
	begin : SOP_EOP_CALC
	
		always @(posedge i_rx_clk or negedge i_rx_reset_n) 
		begin
			if (~i_rx_reset_n) begin
				axist_eop_d1[i] <= 1'b0;
				axist_sop_latch[i] <= 1'b1;
			end
			else if (i_axi_st_rx_tvalid && i_axi_st_rx_tlast_seg[i]) begin
				axist_eop_d1[i] <= 1'b1 ;
				axist_sop_latch[i] <= 1'b1 ;
			end
			else if (i_axi_st_rx_tvalid) begin
				axist_eop_d1[i] <= 1'b0 ;
				axist_sop_latch[i] <= 1'b0 ;
			end			
			else begin
				axist_eop_d1[i] <= 1'b0;
				axist_sop_latch[i] <= axist_sop_latch[i];
			end		
		end
				
		always @(posedge i_rx_clk or negedge i_rx_reset_n) 
		begin
			if (~i_rx_reset_n) 
				axist_sop_d1[i] <= 1'b0;
			else if (i_axi_st_rx_tvalid && i_axi_st_rx_tkeep_seg[i] == 8'hff) begin
				if ((i==0) && ((axist_sop_latch[NUM_SEG-1]) || (axist_rx_tvalid_d1 && (axist_rx_tlast_segment_d1[NUM_SEG-1] || (axist_rx_tkeep_segment_d1[NUM_SEG-1] == 8'b0)))))	
					axist_sop_d1[i] <= 1'b1;
				else if ((i!=0) && (i_axi_st_rx_tlast_seg[i-1] || (i_axi_st_rx_tkeep_seg[i-1] == 8'b0)))
					axist_sop_d1[i] <= 1'b1;
				else 
					axist_sop_d1[i] <= 1'b0;	
			end
			else 
				axist_sop_d1[i] <= 1'b0;		
		end
		
		always_comb begin
			strm_cntr_d1[i] = 1'b1;
			if (axist_sop_d1[i])
					strm_cntr_d1[i] = (i==0) ? ((strm_cntr_d2[NUM_SEG-1]) ? 1'b0 : 1'b1) : ((strm_cntr_d1[i-1]) ? 1'b0 : 1'b1) ;
			else
				strm_cntr_d1[i] = (i==0) ? strm_cntr_d2[NUM_SEG-1] : strm_cntr_d1[i-1];
		end		
		
		always @(posedge i_rx_clk or negedge i_rx_reset_n) 
		begin
			if (~i_rx_reset_n) begin
				strm_cntr_d2[i] <= 1'b1;
				axist_sop_d2[i] <= 1'b0;
				axist_eop_d2[i] <= 1'b0;			
			end		
			else begin
			strm_cntr_d2[i] <= strm_cntr_d1[i];
			axist_sop_d2[i] <= axist_sop_d1[i];
			axist_eop_d2[i] <= axist_eop_d1[i];
		end
		end
	
	end		
end 
endgenerate

generate 
begin: MULTI2SINGLE
genvar j;
	// for (j=0; j<NO_OF_BYTES/8; j=j+1) 
	for (j=0; j<NUM_SEG; j=j+1)	
	begin : DATA_DEMUX
		always @ (posedge i_rx_clk or negedge i_rx_reset_n) begin
			if (~i_rx_reset_n) begin 
				st0_axist_rx_tdata_d3[64*(j+1)-1:64*j] <= {AVST_DW{1'b0}};			
				st1_axist_rx_tdata_d3[64*(j+1)-1:64*j] <= {AVST_DW{1'b0}};			
				st0_axist_rx_tkeep_d3[8*(j+1)-1:8*j]   <= 8'b0;			
				st1_axist_rx_tkeep_d3[8*(j+1)-1:8*j]   <= 8'b0;			
				st0_axist_rx_tvalid_d3[j] <= 1'b0;			
				st1_axist_rx_tvalid_d3[j] <= 1'b0;			
				st0_axist_rx_tlast_d3[j] <= 1'b0;			
				st1_axist_rx_tlast_d3[j] <= 1'b0;			
				st0_axist_rx_user_d3[j] <= 6'b0;			
				st1_axist_rx_user_d3[j] <= 6'b0;				
			end		
			else if ((strm_cntr_d2[j] == 1'b0) && axist_rx_tvalid_d2 && (axist_rx_tkeep_segment_d2[j] != 8'b0)) begin
				st0_axist_rx_tdata_d3[64*(j+1)-1:64*j] <= axist_rx_tdata_d2[64*(j+1)-1:64*j];
				st0_axist_rx_tkeep_d3[8*(j+1)-1:8*j]   <= axist_rx_tkeep_segment_d2[j];
				st0_axist_rx_tvalid_d3[j] <= 1'b1;
				st0_axist_rx_tlast_d3[j] <= (axist_eop_d2[j]) ? 1'b1 : 1'b0;
				st0_axist_rx_user_d3[j] <= {rx_mac_error_d2[j],rx_mac_fcs_error_d2[j],rx_mac_status_d2[j]};
				st1_axist_rx_tvalid_d3[j] <= 1'b0;
				st1_axist_rx_tlast_d3[j] <= 1'b0;				
			end			
			else if ((strm_cntr_d2[j] == 1'b1) && axist_rx_tvalid_d2 && (axist_rx_tkeep_segment_d2[j] != 8'b0)) begin
			    st1_axist_rx_tdata_d3[64*(j+1)-1:64*j] <= axist_rx_tdata_d2[64*(j+1)-1:64*j];
				st1_axist_rx_tkeep_d3[8*(j+1)-1:8*j]   <= axist_rx_tkeep_segment_d2[j];
				st1_axist_rx_tvalid_d3[j] <= 1'b1;
				st1_axist_rx_tlast_d3[j] <= (axist_eop_d2[j]) ? 1'b1 : 1'b0;
				st1_axist_rx_user_d3[j] <= {rx_mac_error_d2[j],rx_mac_fcs_error_d2[j],rx_mac_status_d2[j]};
				st0_axist_rx_tvalid_d3[j] <= 1'b0;
				st0_axist_rx_tlast_d3[j] <= 1'b0;								
			end
			else begin
				st0_axist_rx_tdata_d3[64*(j+1)-1:64*j] <= {AVST_DW{1'b0}};
		        st1_axist_rx_tdata_d3[64*(j+1)-1:64*j] <= {AVST_DW{1'b0}};
				st0_axist_rx_tkeep_d3[8*(j+1)-1:8*j]   <= 8'b0;
				st1_axist_rx_tkeep_d3[8*(j+1)-1:8*j]   <= 8'b0;
				st0_axist_rx_tvalid_d3[j] <= 1'b0;
				st1_axist_rx_tvalid_d3[j] <= 1'b0;
				st0_axist_rx_tlast_d3[j] <= 1'b0;
				st1_axist_rx_tlast_d3[j] <= 1'b0;
				st0_axist_rx_user_d3[j] <= 6'b0;			
				st1_axist_rx_user_d3[j] <= 6'b0;				
			end
			end
		end

	always @ (posedge i_rx_clk or negedge i_rx_reset_n) begin
		if (~i_rx_reset_n) begin 
			st0_axist_rx_ptp_its_d3		<= 96'b0;
		    st0_axist_rx_tuser_vld_d3	<= 1'b0;		
			st1_axist_rx_ptp_its_d3		<= 96'b0;
		    st1_axist_rx_tuser_vld_d3	<= 1'b0;		
	end
		else if ((strm_cntr_d2 == 1'b0) && axist_sop_d2) begin
			st0_axist_rx_ptp_its_d3		<= rx_mac_ptp_its_d2;
		    st0_axist_rx_tuser_vld_d3	<= 1'b1;
			st1_axist_rx_ptp_its_d3		<= 96'b0;
		    st1_axist_rx_tuser_vld_d3	<= 1'b0;		
		end			
		else if ((strm_cntr_d2 == 1'b1) && axist_sop_d2) begin
			st1_axist_rx_ptp_its_d3		<= rx_mac_ptp_its_d2;
		    st1_axist_rx_tuser_vld_d3	<= 1'b1;
			st0_axist_rx_ptp_its_d3		<= 96'b0;
		    st0_axist_rx_tuser_vld_d3	<= 1'b0;		
		end
		else begin
			st0_axist_rx_ptp_its_d3		<= 96'b0;
		    st0_axist_rx_tuser_vld_d3	<= 1'b0;	
			st1_axist_rx_ptp_its_d3		<= 96'b0;
		    st1_axist_rx_tuser_vld_d3	<= 1'b0;		
		end
	end
	
	
end
endgenerate

// st1_axist_rx_tid_d1

always @(posedge i_rx_clk or negedge i_rx_reset_n) begin
	if (~i_rx_reset_n) begin
		st0_axist_rx_oid_d4	<= 4'b0;
		st1_axist_rx_oid_d4	<= 4'b1;
	end
	else begin
		if ((|(st0_axist_rx_tvalid_d3)) && (|(st0_axist_rx_tlast_d3)))
			st0_axist_rx_oid_d4		<= st0_axist_rx_oid_d4 + 2'b10;
		if ((|(st1_axist_rx_tvalid_d3)) && (|(st1_axist_rx_tlast_d3)))
			st1_axist_rx_oid_d4		<= st1_axist_rx_oid_d4 + 2'b10;
	end
end

// assign o_axi_st_rx_tid[0] = {4'b0,st0_axist_rx_oid_d4};
// assign o_axi_st_rx_tid[1] = {4'b1,st1_axist_rx_oid_d4};

always @(posedge i_rx_clk or negedge i_rx_reset_n) begin
	if (~i_rx_reset_n) begin
		o_axi_st_rx_tvalid	<= 1'b0;
		o_axi_st_rx_tdata	<= {NUM_STREAM*AXI_DW{1'b0}};
		o_axi_st_rx_tlast	<= 1'b0;
		o_axi_st_rx_tkeep	<= {NUM_STREAM*NO_OF_BYTES{1'b0}};
		o_axi_st_rx_tuser	<= {NUM_STREAM*TUSER{1'b0}};
	end
	else begin
		o_axi_st_rx_tvalid[0]	<= |(st0_axist_rx_tvalid_d3);  
		o_axi_st_rx_tdata[0]		<= st0_axist_rx_tdata_d3;
		o_axi_st_rx_tlast[0]		<= |(st0_axist_rx_tlast_d3);
		o_axi_st_rx_tkeep[0]		<= st0_axist_rx_tkeep_d3;
		o_axi_st_rx_tid[0] 		<= {4'b0,st0_axist_rx_oid_d4};
		o_axi_st_rx_tuser[0]		<= {st0_axist_rx_user_d3,st0_axist_rx_ptp_its_d3};
		o_axi_st_rx_tuser_valid[0] 	<= st0_axist_rx_tuser_vld_d3;
		o_axi_st_rx_tvalid[1]	<= |(st1_axist_rx_tvalid_d3);
		o_axi_st_rx_tdata[1]		<= st1_axist_rx_tdata_d3;
		o_axi_st_rx_tlast[1]		<= |(st1_axist_rx_tlast_d3);
		o_axi_st_rx_tkeep[1]		<= st1_axist_rx_tkeep_d3;
		o_axi_st_rx_tid[1] 		<= {4'b1,st1_axist_rx_oid_d4};
		o_axi_st_rx_tuser[1]		<= {st1_axist_rx_user_d3,st1_axist_rx_ptp_its_d3};
		o_axi_st_rx_tuser_valid[1] 	<= st1_axist_rx_tuser_vld_d3;
	end
end

		
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6ytexK0gDAwWlCP1vYQRIzlnRyk6ODaz/dWJQxlb0GLB8GGkmrrmj0R3fRQJ+nG3WeCPkzaClKMTzD9tY+eKeFwcE8QOylVK7Sd4b8wnZSX7AB3ytTTyYbadkze6C07b1VsmhqYIYM9I8ZKCaqb+5tY3SD3RTEhip/tTye9GlAbBH2Bj4iL230mhaQVt/UqqgXxbvoEqX1B783es7uVIzEBCuAYM3FaftFVG3nyGIJhOEI/ygq1bzKfonCjJDR941WXlYC6ESK6An+yLX1yBpJ6WizklUZixk3eXHx9aaeCKABdJ7hX5zkij47ZsKofFLcMWesc9bjbhy3yHMD/10vxz9WfTVhOCEf/gthRShnVVUa24niGZlO4i5yrcu2F6NPvqo4hUMK1VZG74PM0PywuRQEEaD58AqWMD22J95tGStuXkMavwL1YG2C8NfgYMHSTl51PPTIRDuU5g9wfa4uBzWMVdcgMOACXgP90xLKntH+EEIxsLroMtBwp6GjpLkn7VERA3Vqu+eDisE8CSdyopIh0aO1D7duKDOHaaX05a8ldTa7poLjk29SIwtwg9azP4wYg2tGyY7mRa6unOvFT6nAOTwM7CLgncV9YET2OyRfam4DmvHdZElUSg1odvgroftk9WiR9IkEhwR/S9vOk7aI4VIqi23/3mBIR2VO6d9d5Aiuf19mSBjK6GsgayPJtCthu9wSks1vW9NKOBB94uxvJzUcfibE2P9H7YJRIW0SE81/m6+lk4US7e0q8TP7aifI4gWSytE1gKvVmpmUw7"
`endif