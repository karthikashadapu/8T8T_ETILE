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
// Module            : hssi_ss_ms_200x2_tx.sv
// Description       : 
// Author            : 
// Created           : 
// Changes           : 
//                   : 
// ==========================================================================


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on


module hssi_ss_ms_200x2_tx #(
    parameter SIM_EMULATE   	 = 1,
    parameter AXI_DW      	    = 512,
    parameter TUSER  		 	 = 4 +90 +328, 
    parameter TID 	   	 	 = 8, 
    parameter READY_LATENCY    = 1,  
	 parameter PKT_SEG_PARITY_EN = 0,
	 parameter ENABLE_ECC  		 = 0, 
	 parameter USE_M20K			 = "ON",
	 localparam NO_OF_BYTES  	 = AXI_DW/8, 
	 localparam AVST_DW  	 	= 512, 
	 localparam NUM_SEG  		= AVST_DW/64, 
    localparam EMPTY_BITS    	 = $clog2(AVST_DW/8)
	
) (
    input                           	i_tx_clk, 
    input                           	i_tx_reset_n,
																								
    //AXI Stream Tx, User side interface				   
    output reg	[2-1:0]					o_axi_st_tx_tready,
						
    input		[2-1:0]					i_axi_st_tx_tvalid,
    input		[2-1:0][AXI_DW-1:0]  	i_axi_st_tx_tdata,
    input		[2-1:0][NO_OF_BYTES-1:0]i_axi_st_tx_tkeep,
    input		[2-1:0]					i_axi_st_tx_tlast,
    input		[2-1:0][TID-1:0]  		i_axi_st_tx_oid,  //order id
    input		[2-1:0][TUSER-1:0]  	i_axi_st_tx_tuser,
		
    //Avalon Stream Tx, MAC side interface	
	input 											i_av_st_tx_ready,
	
    output reg  [AVST_DW-1:0]           			o_axi_st_tx_tdata,
    output reg                          			o_axi_st_tx_tvalid,
    output reg  [NUM_SEG-1:0][8-1:0]  				o_axi_st_tx_tkeep_seg,
	 output reg  [NUM_SEG-1:0]						   o_axi_st_tx_tlast_seg,	
    output reg  [TUSER-1:0]      					o_axi_st_tx_tuser

);

//***********************************************************
//***********************************************************

localparam MUL_STR_EN =1;
localparam NUM_STREAM =2;
localparam [2:0] IDLE         = 3'h0;
localparam [2:0] STRM_Q0	  = 3'h1;
localparam [2:0] STRM_Q1	  = 3'h2;
localparam [2:0] STRM_Q2	  = 3'h3;
localparam [2:0] STRM_Q3	  = 3'h4;

localparam FIFO_WIDTH = 2+NO_OF_BYTES+AXI_DW+TUSER;
localparam FIFO_DEPTH = 5;  ///TODO need to decide fifo depth

//***********************************************************
//***********************************************************


reg     [2-1:0]	[TID-1:0]  	 axist_tx_oid_d1;
reg     [2-1:0]	[TID-1:0]  	 axist_tx_oid_d2;
reg     [2-1:0]	[TID-1:0]  	 axist_tx_oid_d3;

localparam NUM_PKT = 2**4;  ////TID[3:0];

logic   [NUM_PKT-1:0][4:0]		stm_oid_reg	;			////in [5:0] msb stm_oid_reg[5] is mark for vaid strm no. 1=valid, 0= invalid.to store streamid in 8 locations, 8 location are equivalent to 16 consecutive packet no from 0 to 15
reg     [NUM_PKT-1:0][4:0]		stm_oid_reg_0	;		
reg     [NUM_PKT-1:0][4:0]		stm_oid_reg_1	;		
reg     [3:0]			pkt_id_ctr;
reg     [1:0]			Strm_id;

//wire	[NUM_STREAM*FIFO_WIDTH-1:0]	 fifo_data_in ; 
//wire	[NUM_STREAM*FIFO_WIDTH-1:0]	 fifo_data_out; 
wire	[2-1:0]	[FIFO_WIDTH-1:0]	 fifo_data_in  ; 
wire	[2-1:0]	[FIFO_WIDTH-1:0]	 fifo_data_out ; 
wire	[2-1:0]	[FIFO_DEPTH-1:0]	 axist_tx_fifo_lvl; 


reg		[1:0]					Strm_fifo_rd;
//reg		[NUM_STREAM-1:0]		read_busy_d1;
//reg		[NUM_STREAM-1:0]		data_present;
reg		[2-1:0]		Strm_fifo_wrreq;

reg		[2-1:0]		rdreq;
logic	[2-1:0]		Strm_fifo_rdreq;
reg		[2-1:0]		Strm_fifo_rdreq_d1;
reg		[2-1:0]		Strm_fifo_rdreq_d2;
reg		[2-1:0]		Strm_fifo_rdreq_d3;
wire		[2-1:0]		axist_tx_fifo_empty;
reg		[2-1:0]		fifo_busy;
// reg								Strm1_fifo_rdreq;
// reg								Strm2_fifo_rdreq;
// reg								Strm3_fifo_rdreq;

reg 	[2:0]					fifo_rd_state;

logic 	[2-1:0][TUSER-1:0]					axist_tx_tuser_d1 ;
logic 	[2-1:0][NUM_SEG-1:0][64-1:0]		axist_tx_tdata_d1 ;  	
logic 	[2-1:0][NUM_SEG-1:0][8-1:0]			axist_tx_tkeep_d1;
logic 	[2-1:0]								axist_tx_tlast_d1;
logic 	[2-1:0]								axist_tx_valid_d1;

// logic 	[NUM_SEG-1:0][1:0]		tuser_client_d1;
logic 	[2-1:0][NUM_SEG-1:0][1:0]		tx_tuser_client_d1;
logic 	[2-1:0][89:0]			tx_tuser_ptp_d1;
logic 	[2-1:0][327:0]			tx_tuser_ptp_ext_d1;

logic 	[1:0]					st0_tx_tuser_client_d2[1:NUM_SEG];
logic 	[1:0]					st1_tx_tuser_client_d2[1:NUM_SEG];
reg 	[2-1:0][89:0]			tx_tuser_ptp_d2;
reg 	[2-1:0][327:0]			tx_tuser_ptp_ext_d2;

logic 	[1:0]					st0_tx_tuser_client_d3[1:NUM_SEG];
logic 	[1:0]					st1_tx_tuser_client_d3[1:NUM_SEG];
reg 	[2-1:0][89:0]			tx_tuser_ptp_d3;
reg 	[2-1:0][327:0]			tx_tuser_ptp_ext_d3;

reg 	[2-1:0][TUSER-1:0]					axist_tx_tuser_d2 ;  	
reg 	[2-1:0]								axist_tx_valid_d2;   
reg 	[2-1:0]								axist_tx_tlast_d2;   
reg 	[2-1:0][TUSER-1:0]					axist_tx_tuser_d3 ;  	
reg 	[2-1:0]								axist_tx_valid_d3;   
reg 	[2-1:0]								axist_tx_tlast_d3;   


wire 	[2-1:0]						axist_tx_tready_delayed;   
reg 	[2-1:0]						axist_tx_tready_delayed_d1;   
reg 	[2-1:0]						axist_tx_tready_delayed_d2;   
reg 	[2-1:0]						axist_tx_tready_delayed_d3;   

reg 	[63:0]					axist_tx_st0_seg_tdata_d2 [1:NUM_SEG];
reg 	[63:0]					axist_tx_st1_seg_tdata_d2 [1:NUM_SEG];
reg 	[63:0]					axist_tx_st0_seg_tdata_d3 [1:NUM_SEG];
reg 	[63:0]					axist_tx_st1_seg_tdata_d3 [1:NUM_SEG];
reg 	[8-1:0]					axist_tx_st0_seg_tkeep_d2 [1:NUM_SEG];
reg 	[8-1:0]					axist_tx_st1_seg_tkeep_d2 [1:NUM_SEG];
reg 	[8-1:0]					axist_tx_st0_seg_tkeep_d3 [1:NUM_SEG];
reg 	[8-1:0]					axist_tx_st1_seg_tkeep_d3 [1:NUM_SEG];
reg 	[1-1:0]					axist_tx_st0_seg_tlast_d2 ;
reg 	[1-1:0]					axist_tx_st1_seg_tlast_d2 ;
reg 	[TUSER-1:0]				axist_tx_st0_seg_tuser_d2 ;
reg 	[TUSER-1:0]				axist_tx_st1_seg_tuser_d2 ;
reg 	[1-1:0]					axist_tx_st0_seg_tlast_d3 ;
reg 	[1-1:0]					axist_tx_st1_seg_tlast_d3 ;
reg 	[TUSER-1:0]				axist_tx_st0_seg_tuser_d3 ;
reg 	[TUSER-1:0]				axist_tx_st1_seg_tuser_d3 ;
// reg		[63:0]		axist_tx_st2_seg_data_d1 [1:NUM_SEG];
// reg		[63:0]		axist_tx_st3_seg_data_d1 [1:NUM_SEG];



//***********************************************************
//***********************************************************

////Write Logic//////////
genvar i;
genvar i_seg;
genvar o_id;
generate 

	for (i=0; i<NUM_STREAM; i=i+1)
	begin : STREAM_QUEUE
	
		always @(posedge i_tx_clk or negedge i_tx_reset_n)
		begin
			if(~i_tx_reset_n)
				o_axi_st_tx_tready[i] <= 1'b0;
			else if(i_av_st_tx_ready)
				o_axi_st_tx_tready[i] <= 1'b1;
			else if(axist_tx_fifo_lvl[i] == 'd10) 
				o_axi_st_tx_tready[i] <= 1'b0;
		end
		
		hssi_ss_delay_reg #(
		.CYCLES (READY_LATENCY), 
		.WIDTH  (1)
		) i_axi_ready_latency_delay_reg (
		.clk    (i_tx_clk),
		.din    (o_axi_st_tx_tready[i]),
		.dout   (axist_tx_tready_delayed[i])
		);
	
		always @(posedge i_tx_clk or negedge i_tx_reset_n)
		begin
			if(~i_tx_reset_n) begin
				axist_tx_tready_delayed_d1[i] <= 1'b0;
				axist_tx_tready_delayed_d2[i] <= 1'b0;
				axist_tx_tready_delayed_d3[i] <= 1'b0;
			end
			else begin
				axist_tx_tready_delayed_d1[i] <= axist_tx_tready_delayed[i];
				axist_tx_tready_delayed_d2[i] <= axist_tx_tready_delayed_d1[i];
				axist_tx_tready_delayed_d3[i] <= axist_tx_tready_delayed_d2[i];
			end
		end
			
			// 2*(2+NO_OF_BYTES+AXI_DW+TUSER);			
		assign 	Strm_fifo_wrreq[i] = (i_axi_st_tx_tvalid[i] && axist_tx_tready_delayed[i]) ? 1'b1 : 1'b0;
		// assign 	Strm_fifo_wrreq[i] = axist_tx_tready_delayed[i];
		
		assign fifo_data_in[i] [TUSER-1:0]	= i_axi_st_tx_tuser[i];
		assign fifo_data_in[i] [AXI_DW+TUSER-1:TUSER] = i_axi_st_tx_tdata[i];
		assign fifo_data_in[i] [NO_OF_BYTES+AXI_DW+TUSER-1:AXI_DW+TUSER] = i_axi_st_tx_tkeep[i];               
		assign fifo_data_in[i] [FIFO_WIDTH-2] = i_axi_st_tx_tlast[i];	
		assign fifo_data_in[i] [FIFO_WIDTH-1] = i_axi_st_tx_tvalid[i];	


		//Assumed that the packets with in the stream will come in order, there wont be any re-ordering of the packets with in a stream
		//Check for full packet we

		scfifo #(
			.enable_ecc             (ENABLE_ECC),  //available in S10 and A10. Agilex?
			.intended_device_family ("AGILEX"), //$family for simulation
			//.lpm_hint               ("RAM_BLOCK_TYPE=MLAB,MAXIMUM_DEPTH=32,DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE"),
			.lpm_numwords           (2**FIFO_DEPTH),
			.lpm_showahead          ("OFF"),
			.lpm_type               ("SCFIFO"),
			.lpm_width              (FIFO_WIDTH),
			.lpm_widthu             (FIFO_DEPTH),
			.overflow_checking      ("OFF"),
			.underflow_checking     ("OFF"),
			.use_eab                (USE_M20K)  //use block ram or not
		) stream_queue (
			.sclr       (~i_tx_reset_n),
			.data       (fifo_data_in[i]),
			.clock      (i_tx_clk),
			.rdreq      (rdreq[i] && (~axist_tx_fifo_empty[i])),
			.wrreq      (Strm_fifo_wrreq[i]),
			.q          (fifo_data_out[i]),
			.empty      (axist_tx_fifo_empty[i]),
			//.full       (av_st_tx_fifo_full)
			//.eccstatus  (),
			.usedw      (axist_tx_fifo_lvl[i])
		);
	

		assign axist_tx_tuser_d1[i]	= (rdreq[i]) ? fifo_data_out[i][TUSER-1:0] : {TUSER{1'b0}};									
		assign axist_tx_tdata_d1[i] = (rdreq[i]) ? fifo_data_out[i][AXI_DW+TUSER-1:TUSER] : {AXI_DW{1'b0}};					
		assign axist_tx_tkeep_d1[i] = (rdreq[i]) ? fifo_data_out[i][NO_OF_BYTES+AXI_DW+TUSER-1:AXI_DW+TUSER] : {NO_OF_BYTES{1'b0}};	
		assign axist_tx_tlast_d1[i]	= (rdreq[i]) ? fifo_data_out[i][FIFO_WIDTH-2] : 1'b0;
		assign axist_tx_valid_d1[i]	= (rdreq[i]) ? fifo_data_out[i][FIFO_WIDTH-1] : 1'b0;
		
		//assign tx_tuser_client_d1[i] 	= axist_tx_tuser_d1[i][(2*NUM_SEG)-1:0];
      //assign tx_tuser_ptp_d1[i] 		= axist_tx_tuser_d1[i][90-1:0];
		//assign tx_tuser_ptp_ext_d1[i] 	= axist_tx_tuser_d1[i][328-1:0];
      assign tx_tuser_client_d1[i]     = axist_tx_tuser_d1[i][(2*NUM_SEG)+90+328-1:90+328];
      assign tx_tuser_ptp_d1[i]         = axist_tx_tuser_d1[i][90+328-1:328];
		assign tx_tuser_ptp_ext_d1[i] 	= axist_tx_tuser_d1[i][328-1:0];
		

		always @(posedge i_tx_clk or negedge i_tx_reset_n) begin
			if (~i_tx_reset_n) begin
				axist_tx_oid_d1[i] <= {TID{1'b0}};
				axist_tx_oid_d2[i] <= {TID{1'b0}};
				axist_tx_oid_d3[i] <= {TID{1'b0}};
			end
			else begin
				axist_tx_oid_d1[i] <= i_axi_st_tx_oid[i];
				axist_tx_oid_d2[i] <= axist_tx_oid_d1[i];
				axist_tx_oid_d3[i] <= axist_tx_oid_d2[i];
			end
		end
	
	end
	
	
	////TODO: LHS should be _d2
		for (i_seg=1; i_seg<=NUM_SEG; i_seg=i_seg+1)
		begin: DATA2DATASEG
			always @(posedge i_tx_clk) begin
				axist_tx_st0_seg_tdata_d2[i_seg] <=  axist_tx_tdata_d1[0][i_seg-1][63:0];
				axist_tx_st1_seg_tdata_d2[i_seg] <=  axist_tx_tdata_d1[1][i_seg-1][63:0];
				axist_tx_st0_seg_tdata_d3[i_seg] <=  axist_tx_st0_seg_tdata_d2[i_seg];
				axist_tx_st1_seg_tdata_d3[i_seg] <=  axist_tx_st1_seg_tdata_d2[i_seg];
				axist_tx_st0_seg_tkeep_d2[i_seg] <=  axist_tx_tkeep_d1[0][i_seg-1][7:0];
				axist_tx_st1_seg_tkeep_d2[i_seg] <=  axist_tx_tkeep_d1[1][i_seg-1][7:0];
				axist_tx_st0_seg_tkeep_d3[i_seg] <=  axist_tx_st0_seg_tkeep_d2[i_seg];
				axist_tx_st1_seg_tkeep_d3[i_seg] <=  axist_tx_st1_seg_tkeep_d2[i_seg];
				st0_tx_tuser_client_d2[i_seg]	 <=	 tx_tuser_client_d1[0][i_seg-1][1:0];
				st1_tx_tuser_client_d2[i_seg]	 <=	 tx_tuser_client_d1[1][i_seg-1][1:0];
				st0_tx_tuser_client_d3[i_seg]	 <=	 st0_tx_tuser_client_d2[i_seg];
				st1_tx_tuser_client_d3[i_seg]	 <=	 st1_tx_tuser_client_d2[i_seg];				
			end
		end
		
		always @(posedge i_tx_clk) begin
			axist_tx_valid_d2 <=  axist_tx_valid_d1;
			axist_tx_valid_d3 <=  axist_tx_valid_d2;
			axist_tx_tlast_d2 <=  axist_tx_tlast_d1;
			axist_tx_tlast_d3 <=  axist_tx_tlast_d2;
			// axist_tx_tuser_d2 <=  axist_tx_tuser_d1;
			// axist_tx_tuser_d3 <=  axist_tx_tuser_d2;
			tx_tuser_ptp_d2	  <=  tx_tuser_ptp_d1;
			tx_tuser_ptp_d3	  <=  tx_tuser_ptp_d2;
			tx_tuser_ptp_ext_d2	  <=  tx_tuser_ptp_ext_d1;
			tx_tuser_ptp_ext_d3	  <=  tx_tuser_ptp_ext_d2;
		end
		
		//////////////////////////////////////////////////////////////////////////////////////
		// each element of array equal to orderid/pktid and will store respective stream num
		// 	
		// for (o_id=0; o_id < 8; o_id=o_id+1)
		// begin : OID_ARRAY
			// always @(posedge i_tx_clk) begin
				// if (i_axi_st_tx_tvalid[0] && axist_tx_tready_delayed[0] && (i_axi_st_tx_oid[0][2:0] == o_id))
					// stm_oid_reg[o_id] <= {1'b1,i_axi_st_tx_oid[0][7:3]};
				// else if (i_axi_st_tx_tvalid[1] && axist_tx_tready_delayed[1] && (axist_tx_oid_d1[1][2:0] == o_id))
					// stm_oid_reg[o_id] <= {1'b1,axist_tx_oid_d1[1][7:3]};
				// else 
					// stm_oid_reg[o_id] <= 6'b0;
			// end
		// end
		for (o_id=0; o_id < NUM_PKT; o_id=o_id+1)
		begin : OID_ARRAY
		
			always @(posedge i_tx_clk) begin
				if (~i_tx_reset_n) 
					stm_oid_reg_0[o_id] <= 5'b0;
				else if (i_axi_st_tx_tvalid[0] && axist_tx_tready_delayed[0] && (i_axi_st_tx_oid[0][3:0] == o_id))
					stm_oid_reg_0[o_id] <= ({1'b1,i_axi_st_tx_oid[0][7:4]});
				else 
					stm_oid_reg_0[o_id] <= stm_oid_reg_0[o_id];
			end
			
			always @(posedge i_tx_clk) begin 
				if (~i_tx_reset_n) 
					stm_oid_reg_1[o_id] <= 5'b0;
				else if (i_axi_st_tx_tvalid[1] && axist_tx_tready_delayed[1] && (i_axi_st_tx_oid[1][3:0] == o_id))
					stm_oid_reg_1[o_id] <= ({1'b1,i_axi_st_tx_oid[1][7:4]});
				else 
					stm_oid_reg_1[o_id] <= stm_oid_reg_1[o_id];
			end			
				assign stm_oid_reg[o_id] = stm_oid_reg_0[o_id] + stm_oid_reg_1[o_id];
			// assign stm_oid_reg_0[o_id] = (i_axi_st_tx_tvalid[0] && axist_tx_tready_delayed[0] && (i_axi_st_tx_oid[0][3:0] == o_id)) ? ({1'b1,i_axi_st_tx_oid[0][7:4]}) : 5'b0;
			// assign stm_oid_reg_1[o_id] = (i_axi_st_tx_tvalid[1] && axist_tx_tready_delayed[1] && (i_axi_st_tx_oid[1][3:0] == o_id)) ? ({1'b1,i_axi_st_tx_oid[1][7:4]}) : 5'b0;

			// always @(posedge i_tx_clk) begin
				// stm_oid_reg[o_id] <= stm_oid_reg_0[o_id] + stm_oid_reg_1[o_id];              //////both strea can not have same pkt no at a time.
			// end
		end
	
	//end
//	assign dummy_oid = stm_oid_reg;
endgenerate


//***********************************************************
//						Read side order ID logic
//***********************************************************


always @(posedge i_tx_clk or negedge i_tx_reset_n)
begin
	if (~i_tx_reset_n) begin	 
		fifo_rd_state <= IDLE;
		// Strm_fifo_rdreq <= 4'b0;
		rdreq <= 2'b0;
		 pkt_id_ctr <= 4'b0;
		 fifo_busy <= 2'b0;
		 Strm_id <= 2'b0;
	end
	else begin
		case(fifo_rd_state)
		IDLE:	begin
					if (stm_oid_reg[pkt_id_ctr] == {1'b1,4'b00}) begin 
						rdreq[0] <= 1'b1;
						fifo_rd_state <= STRM_Q0;
						pkt_id_ctr <= pkt_id_ctr + 1'b1;
						fifo_busy[0] <= 1'b1;
						Strm_id <= 2'b00;
					end
					else if (stm_oid_reg[pkt_id_ctr] == {1'b1,4'b01}) begin
						rdreq[1] <= 1'b1;
						fifo_rd_state <= STRM_Q1;
						pkt_id_ctr <= pkt_id_ctr + 1'b1;
						fifo_busy[1] <= 1'b1;
						Strm_id <= 2'b01;
					end
					else begin
						fifo_rd_state <= IDLE;
						rdreq <= 2'b0;
						pkt_id_ctr <= pkt_id_ctr + 1'b1;
						// pkt_id_ctr <= 4'b0;
						fifo_busy <= 2'b0;
						Strm_id <= 2'b00;
					end
				end
		STRM_Q0:	begin
						if (axist_tx_tlast_d1[0]) begin
							// fifo_busy[0] <= 1'b0;
							if (stm_oid_reg[pkt_id_ctr] == {1'b1,4'b00}) begin
								rdreq <= 2'b01;
								fifo_rd_state <= STRM_Q0;
								pkt_id_ctr <= pkt_id_ctr + 1'b1;
								fifo_busy[0] <= 1'b1;
								fifo_busy[1] <= 1'b0;
							end
							else if (stm_oid_reg[pkt_id_ctr] == {1'b1,4'b01}) begin
								rdreq <= 2'b10;
								fifo_rd_state <= STRM_Q1;
								pkt_id_ctr <= pkt_id_ctr + 1'b1;
								fifo_busy[0] <= 1'b0;
								fifo_busy[1] <= 1'b1;
							end
							else begin
								rdreq <= 2'b0;
								fifo_rd_state <= fifo_rd_state;
								pkt_id_ctr <= pkt_id_ctr;
							end					
						end
						else begin
							rdreq[0] <= 1'b1;
							fifo_busy[0] <= 1'b1;
							fifo_rd_state <= STRM_Q0;
							// pkt_id_ctr <= (!fifo_busy[0]) ? pkt_id_ctr +1'b1 : pkt_id_ctr;
						end			
						Strm_id <= 2'b00;
					end
		STRM_Q1:	begin
						if (axist_tx_tlast_d1[1]) begin
							fifo_busy[1] <= 1'b0;
							if (stm_oid_reg[pkt_id_ctr] == {1'b1,4'b00}) begin
								rdreq <= 2'b01;
								fifo_rd_state <= STRM_Q0;
								pkt_id_ctr <= pkt_id_ctr + 1'b1;
								fifo_busy[0] <= 1'b1;
								fifo_busy[1] <= 1'b0;
							end
							else if (stm_oid_reg[pkt_id_ctr] == {1'b1,4'b01}) begin
								rdreq <= 2'b10;
								fifo_rd_state <= STRM_Q1;
								pkt_id_ctr <= pkt_id_ctr + 1'b1;
								fifo_busy[0] <= 1'b0;
								fifo_busy[1] <= 1'b1;
							end
							else begin
								rdreq <= 2'b0;
								fifo_rd_state <= fifo_rd_state;
								pkt_id_ctr <= pkt_id_ctr;
							end		
						end
						else begin
							rdreq[1] <= 1'b1;
							fifo_busy[1] <= 1'b1;
							fifo_rd_state <= STRM_Q1;
							// pkt_id_ctr <= (!fifo_busy[1]) ? pkt_id_ctr +1'b1 : pkt_id_ctr;
						end			
						Strm_id <= 2'b01;
					end
		default:	begin
						fifo_rd_state <= IDLE;
					end
		endcase
	end
end

// always_comb begin
	// if (axist_tx_tlast_d1[0])
		// Strm_fifo_rdreq[0] = 1'b0;
	// else 
		// Strm_fifo_rdreq[0] = rdreq[0]; 
	// if (axist_tx_tlast_d1[1])
		// Strm_fifo_rdreq[1] = 1'b0;
	// else 
		// Strm_fifo_rdreq[1] = rdreq[1];
// end

// assign Strm_fifo_rdreq = rdreq & (!axist_tx_tlast_d1); 

always @(posedge i_tx_clk) begin
	// Strm_fifo_rdreq_d1 <=  Strm_fifo_rdreq;
	Strm_fifo_rdreq_d1 <=  rdreq;
	Strm_fifo_rdreq_d2 <=  Strm_fifo_rdreq_d1;
	Strm_fifo_rdreq_d3 <=  Strm_fifo_rdreq_d2;
end
			
localparam NUMSEG_BITS  = $clog2(NUM_SEG)+1;

wire [NUM_STREAM-1:0]	[EMPTY_BITS:0]				strm_bytes_used;       /////size is 1 bit extra to match the widths in : BYTES_USED
wire [NUM_STREAM-1:0]	[EMPTY_BITS:0]				strm_bytes_unused;
wire [NUM_STREAM-1:0]	[NUMSEG_BITS-1:0]			no_of_seg;

reg [64-1:0]				s0_mac_data_d4 [1:NUM_SEG];
reg [64-1:0]				s1_mac_data_d4 [1:NUM_SEG];
reg [64-1:0]				s0_mac_data_d5 [1:NUM_SEG];
reg [64-1:0]				s1_mac_data_d5 [1:NUM_SEG];

// reg [TUSER-1:0]		s0_mac_tuser_d4	[1:NUM_SEG];
// reg [TUSER-1:0]		s1_mac_tuser_d4	[1:NUM_SEG];
// reg [TUSER-1:0]		s0_mac_tuser_d5	[1:NUM_SEG];
// reg [TUSER-1:0]		s1_mac_tuser_d5	[1:NUM_SEG];

reg [2-1:0]		s0_mac_tuser_client_d4	[1:NUM_SEG];
reg [2-1:0]		s0_mac_tuser_client_d5	[1:NUM_SEG];
reg [2-1:0]		s1_mac_tuser_client_d4	[1:NUM_SEG];
reg [2-1:0]		s1_mac_tuser_client_d5	[1:NUM_SEG];

reg [2-1:0][90-1:0]		mac_tuser_ptp_d4;
reg [2-1:0][90-1:0]		mac_tuser_ptp_d5;

reg [2-1:0][328-1:0]	mac_tuser_ptp_ext_d4;
reg [2-1:0][328-1:0]	mac_tuser_ptp_ext_d5;



reg [8-1:0]		s0_mac_tkeep_d4	[1:NUM_SEG];
reg [8-1:0]		s1_mac_tkeep_d4	[1:NUM_SEG];
reg [8-1:0]		s0_mac_tkeep_d5	[1:NUM_SEG];
reg [8-1:0]		s1_mac_tkeep_d5	[1:NUM_SEG];

reg [1-1:0]					s0_mac_tvalid_d4	[1:NUM_SEG];
reg [1-1:0]					s1_mac_tvalid_d4	[1:NUM_SEG];
reg [1-1:0]					s0_mac_tvalid_d5	[1:NUM_SEG];
reg [1-1:0]					s1_mac_tvalid_d5	[1:NUM_SEG];

reg [1-1:0]					s0_mac_tlast_d4	[1:NUM_SEG];
reg [1-1:0]					s1_mac_tlast_d4	[1:NUM_SEG];
reg [1-1:0]					s0_mac_tlast_d5	[1:NUM_SEG];
reg [1-1:0]					s1_mac_tlast_d5	[1:NUM_SEG];

wire [64-1:0]				mac_tdata	[1:NUM_SEG];
wire [8-1:0]				mac_tkeep	[1:NUM_SEG];
wire [1-1:0]				mac_tvalid	[1:NUM_SEG];
wire [1-1:0]				mac_tlast	[1:NUM_SEG];
wire [2-1:0]				mac_tuser_client[1:NUM_SEG];


//reg [AVST_DW-1:0]			mac_data_d4;
//reg [AVST_DW-1:0]			mac_data_d5;
//reg [8-1:0]								mac_data_byte_left;
// reg 						unused_segments_flag;
wire 						unused_segments_flag;
// reg 						unused_segments_d3;

reg [NUMSEG_BITS-1:0]		seg_used_d4;
reg [NUMSEG_BITS-1:0]		seg_used_d5;
reg [NUMSEG_BITS-1:0]		seg_unused_d4;
reg [NUMSEG_BITS-1:0]		seg_unused_d5;

wire [3:0] keep2empty_st0_d3 [NO_OF_BYTES/8-1:0];
wire [3:0] keep2empty_st1_d3 [NO_OF_BYTES/8-1:0];
logic  [2-1:0][EMPTY_BITS-1:0] empty_bits_d3;


/////keep inside generate
genvar j;
generate 
	for (j=0; j<NO_OF_BYTES/8; j=j+1) 
	begin: KEEP2EMPTY
		keep2empty #(
			.EMPTY_BITS  (4),
		    .NO_OF_BYTES (8)
			)keep2empty_st0_inst(
				.clk	(i_tx_clk), 
			    .rst_n	(i_tx_reset_n),
				.keep_bits_in  (axist_tx_st0_seg_tkeep_d2[j+1]), 
				.empty_bits_out_d1(keep2empty_st0_d3[j])		  	////TODO: use keep2empty_st0_d3	
			);
			
		keep2empty #(
			.EMPTY_BITS  (4),
		    .NO_OF_BYTES (8)
			)keep2empty_st1_inst(
				.clk	(i_tx_clk), 
			    .rst_n	(i_tx_reset_n),
				.keep_bits_in  (axist_tx_st1_seg_tkeep_d2[j+1]), 
				.empty_bits_out_d1(keep2empty_st1_d3[j])			////TODO: use keep2empty_st1_d3	
			);
	end
  always_comb begin
    empty_bits_d3[0] = 'd0; 
    empty_bits_d3[1] = 'd0; 
	  for (int p=0; p<NO_OF_BYTES/8; p=p+1) begin 
      empty_bits_d3[0] = empty_bits_d3[0] + keep2empty_st0_d3[p];			////TODO: use empty_bits_d3	
      empty_bits_d3[1] = empty_bits_d3[1] + keep2empty_st1_d3[p];
  end
end
endgenerate		

genvar st;
generate 
	for (st=0;st<NUM_STREAM;st=st+1)
begin: BYTES_USED
		//assign strm_bytes_used[st] = (axist_tx_tlast_d1[st] && axist_tx_valid_d1) ? (AXI_DW/8 - empty_bits_d3[st]) : AXI_DW/8;
		assign strm_bytes_used[st] = (axist_tx_tready_delayed_d3[st]&& axist_tx_valid_d3[st]) ? (NO_OF_BYTES - empty_bits_d3[st]) : NO_OF_BYTES;
		assign no_of_seg[st] = bytes2seg(strm_bytes_used[st]);		
end
endgenerate		
//////////////////////

always @(posedge i_tx_clk or negedge i_tx_reset_n)   
begin
	if (~i_tx_reset_n) begin	
		seg_used_d4 <= {NUMSEG_BITS{1'b0}};
		seg_unused_d4 <= {NUMSEG_BITS{1'b0}};
	end
	else begin
		if (axist_tx_valid_d3[0] && axist_tx_tready_delayed_d3[0] && (Strm_fifo_rdreq_d3[0] == 1'b1) && (axist_tx_tlast_d3[0])) begin
			seg_used_d4 <= (no_of_seg[0] > seg_unused_d5) ? no_of_seg[0] - seg_unused_d5 : no_of_seg[0];       ////seg_unused_d4 from previous stream - seg used in current eop
			seg_unused_d4 <= 4'd8 - no_of_seg[0] + seg_unused_d5;
		end
		else if (axist_tx_valid_d3[1] && axist_tx_tready_delayed_d3[1] && (Strm_fifo_rdreq_d3[1] == 1'b1) && (axist_tx_tlast_d3[1])) begin
			seg_used_d4 <= (no_of_seg[0] > seg_unused_d5) ? no_of_seg[0] - seg_unused_d5 : no_of_seg[0];       ////seg_unused_d4 from previous stream
			seg_unused_d4 <= 4'd8 - no_of_seg[1] + seg_unused_d5;
		end
		// else if ((axist_tx_valid_d3[0] && axist_tx_tready_delayed_d3[0] && (Strm_fifo_rdreq_d3 == 4'd1)) || (axist_tx_valid_d3[1] && axist_tx_tready_delayed_d3[1] && (Strm_fifo_rdreq_d3 == 4'd2)))  begin
			// unused_segments_flag <= unused_segments_flag;
			// seg_unused_d4 <= 4'b1000;
		// end
		else begin
			seg_unused_d4 <= 4'b0;
		end
	end   
end		

assign unused_segments_flag = (seg_unused_d4 == 5'b0) ? 1'b0 : 1'b1;
							

always @(posedge i_tx_clk or negedge i_tx_reset_n)   
begin
	if (~i_tx_reset_n) begin	
		seg_used_d5 <= {NUMSEG_BITS{1'b0}};
		seg_unused_d5 <= {NUMSEG_BITS{1'b0}};  
		end
	else begin
		seg_used_d5 <= seg_used_d4;
	    seg_unused_d5 <= seg_unused_d4;	
	end
end		


genvar k;
generate  
	for (k=1;k<=NUM_SEG;k=k+1)
	begin : DATA_MUX
		always @(posedge i_tx_clk or negedge i_tx_reset_n)
		begin
			if (~i_tx_reset_n) begin	
				s0_mac_data_d4[k] 		<= 64'b0;
				s1_mac_data_d4[k] 		<= 64'b0;
				s0_mac_tkeep_d4[k] 		<= 8'b0;
				s1_mac_tkeep_d4[k] 		<= 8'b0;
				s0_mac_tlast_d4[k] 		<= 1'b0;
				s1_mac_tlast_d4[k] 		<= 1'b0;
				s0_mac_tvalid_d4[k] 	<= 1'b0;
				s1_mac_tvalid_d4[k] 	<= 1'b0;
				s0_mac_tuser_client_d4[k]	<= 2'b0;
				s1_mac_tuser_client_d4[k]	<= 2'b0;
				
			end
			else if ((Strm_fifo_rdreq_d3[0] == 1'b1) && axist_tx_valid_d3[0] && axist_tx_tready_delayed_d3[0]) begin
					if (unused_segments_flag) begin		///if some segments still left from previous dtata stream. and stream no is 0
						s0_mac_data_d4[k] <= axist_tx_st0_seg_tdata_d3[k+seg_unused_d5];
						s0_mac_tkeep_d4[k] <= axist_tx_st0_seg_tkeep_d3[k+seg_unused_d5];
						// s0_mac_tuser_d4[k] <= axist_tx_st0_seg_tuser_d3[k+seg_unused_d5];
						s0_mac_tuser_client_d4[k] <= st0_tx_tuser_client_d3[k+seg_unused_d5];
					end
					else begin
						s0_mac_data_d4[k] <= axist_tx_st0_seg_tdata_d3[k];
						s0_mac_tkeep_d4[k] <= axist_tx_st0_seg_tkeep_d3[k];
						// s0_mac_tuser_d4[k] <= axist_tx_st0_seg_tuser_d3[k];
						s0_mac_tuser_client_d4[k] <= st0_tx_tuser_client_d3[k];
					end	
					s0_mac_tvalid_d4[k] <=  1'b1;
					s0_mac_tlast_d4[k] <= ((k==no_of_seg[0]) && axist_tx_tlast_d3[0]) ? 1'b1 : 1'b0;					
			end
			else if ((Strm_fifo_rdreq_d3[1] == 1'b1) && axist_tx_valid_d3[1] && axist_tx_tready_delayed_d3[1]) begin
					if (unused_segments_flag) begin		///if some segments still left from previous dtata stream. and stream no is 0
						s1_mac_data_d4[k] <= axist_tx_st1_seg_tdata_d3[k+seg_unused_d5];
						s1_mac_tkeep_d4[k] <= axist_tx_st1_seg_tkeep_d3[k+seg_unused_d5];
						// s1_mac_tuser_d4[k] <= axist_tx_st1_seg_tuser_d3[k+seg_unused_d5];
						s1_mac_tuser_client_d4[k] <= st1_tx_tuser_client_d3[k+seg_unused_d5];
					end	
					else begin
						s1_mac_data_d4[k] <= axist_tx_st1_seg_tdata_d3[k];
						s1_mac_tkeep_d4[k] <= axist_tx_st1_seg_tkeep_d3[k];
						// s1_mac_tuser_d4[k] <= axist_tx_st1_seg_tuser_d3[k];
						s1_mac_tuser_client_d4[k] <= st1_tx_tuser_client_d3[k];
					end						
					s1_mac_tvalid_d4[k] <=  1'b1;
					s1_mac_tlast_d4[k] <= ((k==no_of_seg[1]) && axist_tx_tlast_d3[1]) ? 1'b1 : 1'b0;					
			end
			else begin
				s0_mac_data_d4[k]			<=	64'b0;
				s0_mac_tkeep_d4[k]			<=	8'b0;
				s0_mac_tvalid_d4[k]			<=	1'b0;				
				s0_mac_tlast_d4[k]			<=	1'b0;				
				s0_mac_tuser_client_d4[k]	<=	2'b0;			
				s1_mac_data_d4[k]			<=	64'b0;
				s1_mac_tkeep_d4[k]			<=	8'b0;
				s1_mac_tvalid_d4[k]			<=	1'b0;			
				s1_mac_tlast_d4[k]			<=	1'b0;			
				s1_mac_tuser_client_d4[k]	<=	2'b0;			
		end
		end
		
		always @(posedge i_tx_clk or negedge i_tx_reset_n)
		begin
			if (~i_tx_reset_n) begin	
				s0_mac_data_d5[k] 			<= 64'b0;
				s1_mac_data_d5[k] 			<= 64'b0;
				s0_mac_tkeep_d5[k] 			<= 8'b0;
				s1_mac_tkeep_d5[k] 			<= 8'b0;
				s0_mac_tlast_d5[k] 			<= 1'b0;
				s1_mac_tlast_d5[k] 			<= 1'b0;
				s0_mac_tvalid_d5[k] 		<= 1'b0;
				s1_mac_tvalid_d5[k] 		<= 1'b0;
				s0_mac_tuser_client_d5[k] 	<= 64'b0;
				s1_mac_tuser_client_d5[k] 	<= 64'b0;
			end
			else begin
				if (unused_segments_flag && (Strm_fifo_rdreq_d3[0] == 1'b1) && axist_tx_valid_d3[0]) begin		///if some segments still left from previous dtata stream. and stream no is 0
					s1_mac_data_d5[k] <= (k > seg_used_d5)? axist_tx_st0_seg_tdata_d3[k-seg_used_d5] : s1_mac_data_d4[k];   
					s1_mac_tkeep_d5[k] <= (k > seg_used_d5)? axist_tx_st0_seg_tkeep_d3[k-seg_used_d5] : s1_mac_tkeep_d4[k];
					s1_mac_tuser_client_d5[k] <= (k > seg_used_d5)? st0_tx_tuser_client_d3[k-seg_used_d5] : s1_mac_tuser_client_d4[k];
					s1_mac_tvalid_d5[k] <= s1_mac_tvalid_d4[k];		
					s1_mac_tlast_d5[k] <= s1_mac_tlast_d4[k];		
				end
				else begin
					s1_mac_data_d5[k]	<= s1_mac_data_d4[k];
				    s1_mac_tkeep_d5[k] 	<= s1_mac_tkeep_d4[k];
					s1_mac_tvalid_d5[k] <= s1_mac_tvalid_d4[k];		
				    s1_mac_tuser_client_d5[k] 	<= s1_mac_tuser_client_d4[k];
					s1_mac_tlast_d5[k] <= s1_mac_tlast_d4[k];		
				end
				if (unused_segments_flag && (Strm_fifo_rdreq_d3[1] == 1'b1) && axist_tx_valid_d3[1]) begin		///if some segments still left from previous dtata stream. and stream no is 0
					s0_mac_data_d5[k] <= (k > seg_used_d5)? axist_tx_st1_seg_tdata_d3[k-seg_used_d5] : s0_mac_data_d4[k];   ///TBD check if seg_unused_d4 =0 case
					s0_mac_tkeep_d5[k] <= (k > seg_used_d5)? axist_tx_st1_seg_tkeep_d3[k-seg_used_d5] : s0_mac_tkeep_d4[k];   
					s0_mac_tuser_client_d5[k] <= (k > seg_used_d5)? st1_tx_tuser_client_d3[k-seg_used_d5] : s0_mac_tuser_client_d4[k];
					s0_mac_tvalid_d5[k] <= s0_mac_tvalid_d4[k];		
					s0_mac_tlast_d5[k] <= s0_mac_tlast_d4[k];		
				end	
				else begin
					s0_mac_data_d5[k]	<= s0_mac_data_d4[k];
				    s0_mac_tkeep_d5[k] 	<= s0_mac_tkeep_d4[k];
					s0_mac_tvalid_d5[k] <= s0_mac_tvalid_d4[k];		
				    s0_mac_tuser_client_d5[k] 	<= s0_mac_tuser_client_d4[k];
					s0_mac_tlast_d5[k] <= s0_mac_tlast_d4[k];		
				end
			end			
		end   
			
		assign mac_tdata[k] = s0_mac_data_d5[k] + s1_mac_data_d5[k];
		assign mac_tkeep[k] = s0_mac_tkeep_d5[k] + s1_mac_tkeep_d5[k];
		assign mac_tvalid[k] = s0_mac_tvalid_d5[k] + s1_mac_tvalid_d5[k];
		assign mac_tlast[k] = s0_mac_tlast_d5[k] + s1_mac_tlast_d5[k];   
		// assign mac_tuser[k] = s0_mac_tuser_d5[k] + s1_mac_tuser_d5[k];   
		assign mac_tuser_client[k] = s0_mac_tuser_client_d5[k] + s1_mac_tuser_client_d5[k];   
end
endgenerate
			

wire [NUM_SEG-1:0]		mac_tvalid_pkd;
wire [NUM_SEG-1:0][1:0]	tuser_client_pkd;

genvar m;
generate 
	for (m=0;m<NUM_SEG;m=m+1)////need to correct the assignment
	begin: PKD2UNPKD
		assign o_axi_st_tx_tdata[64*(m+1)-1:64*(m)] = mac_tdata[m+1];	 
		assign o_axi_st_tx_tkeep_seg[m] 			= mac_tkeep[m+1];	
		assign o_axi_st_tx_tlast_seg[m] 			= mac_tlast[m+1];	
		assign mac_tvalid_pkd[m] 					= mac_tvalid[m+1];	
		assign tuser_client_pkd[m] 					= mac_tuser_client[m+1];	
	end
	assign o_axi_st_tx_tvalid	= |mac_tvalid_pkd;	
	// assign o_axi_st_tx_tuser	= {tuser_client_pkd,;	
endgenerate

always @(posedge i_tx_clk) begin
		mac_tuser_ptp_d4 		<= tx_tuser_ptp_d3;
		mac_tuser_ptp_ext_d4 	<= tx_tuser_ptp_ext_d3;
	if (Strm_fifo_rdreq_d3[0] == 1'b1)
		o_axi_st_tx_tuser 		<= {tuser_client_pkd,mac_tuser_ptp_d4[0],mac_tuser_ptp_ext_d4[0]};
	else if (Strm_fifo_rdreq_d3[1] == 1'b1)
		o_axi_st_tx_tuser 		<= {tuser_client_pkd,mac_tuser_ptp_d4[1],mac_tuser_ptp_ext_d4[1]};
	else
		o_axi_st_tx_tuser	<= {TUSER{1'b0}};
end


function automatic [NUMSEG_BITS-1:0] bytes2seg;
	input [EMPTY_BITS:0] bytes_used;
	begin
		if (bytes_used <= 8'd8) 
			bytes2seg = 5'd1; 
		else if((bytes_used > 8'd8) && (bytes_used <= 8'd16)) 
			bytes2seg = 5'd2;
		else if((bytes_used > 8'd16) && (bytes_used <= 8'd24))
			bytes2seg = 5'd3;
		else if((bytes_used > 8'd24) && (bytes_used <= 8'd32))
			bytes2seg = 5'd4;
		else if((bytes_used > 8'd32) && (bytes_used <= 8'd40))
			bytes2seg = 5'd5;
		else if((bytes_used > 8'd40) && (bytes_used <= 8'd48)) 
			bytes2seg = 5'd6;
		else if((bytes_used > 8'd48) && (bytes_used <= 8'd56)) 
			bytes2seg = 5'd7;
		else 
			bytes2seg = 5'd8;	 
	end	
endfunction

endmodule



// function [EMPTY_BITS-1:0] bytes2seg;
	// input [NO_OF_BYTES-1:0] strm_bytes_used;
	// wire [NO_OF_BYTES-1:0] bytes_used;
	// byte_used = strm_bytes_used;
	// bytes2seg = (bytes_used <= 8'd8) ? 5'd1 : (((bytes_used > 8'd8) && (bytes_used <= 8'd16)) ? 5'd2 :
					  // (((bytes_used > 8'd16) && (bytes_used <= 8'd24)) ? 5'd3 : (((bytes_used > 8'd24) && (bytes_used <= 8'd32)) ? 5'd4 :
					  // (((bytes_used > 8'd32) && (bytes_used <= 8'd40)) ? 5'd5 : (((bytes_used > 8'd40) && (bytes_used <= 8'd48)) ? 5'd6 :
					  // (((bytes_used > 8'd48) && (bytes_used <= 8'd56)) ? 5'd7 : (((bytes_used > 8'd56) && (bytes_used <= 8'd64)) ? 5'd8 :
					  // (((bytes_used > 8'd64) && (bytes_used <= 8'd72)) ? 5'd9 : (((bytes_used > 8'd72) && (bytes_used <= 8'd80)) ? 5'd10 :
					  // (((bytes_used > 8'd80) && (bytes_used <= 8'd88)) ? 5'd11 : (((bytes_used > 8'd88) && (bytes_used <= 8'd96)) ? 5'd12 :
					  // (((bytes_used > 8'd96) && (bytes_used <= 8'd104)) ? 5'd13 : (((bytes_used > 8'd104) && (bytes_used <= 8'd112)) ? 5'd14 :
					  // (((bytes_used > 8'd112) && (bytes_used <= 8'd120)) ? 5'd15 : 5'd16))))))))))))));	 
// endfunction

/*		always @(posedge i_tx_clk or negedge i_tx_reset_n)
		begin
			if (~i_tx_reset_n) begin	
				s0_mac_data_d4[k] <= 64'b0;
				s1_mac_data_d4[k] <= 64'b0;
				s0_mac_data_d5[k] <= 64'b0;
				s1_mac_data_d5[k] <= 64'b0;
				s0_mac_tkeep_d4[k] <= 8'b0;
				s1_mac_tkeep_d4[k] <= 8'b0;
				s0_mac_tkeep_d5[k] <= 8'b0;
				s1_mac_tkeep_d5[k] <= 8'b0;
				s0_mac_tlast_d4[k] <= 1'b0;
				s1_mac_tlast_d4[k] <= 1'b0;
				s0_mac_tlast_d5[k] <= 1'b0;
				s1_mac_tlast_d5[k] <= 1'b0;
				s0_mac_tvalid_d4[k] <= 1'b0;
				s1_mac_tvalid_d4[k] <= 1'b0;
				s0_mac_tvalid_d5[k] <= 1'b0;
				s1_mac_tvalid_d5[k] <= 1'b0;
			end
			else if ((Strm_fifo_rdreq_d3[0] == 1'b1) && axist_tx_valid_d3[0] && axist_tx_tready_delayed_d3[0]) begin
					if (unused_segments_flag) begin		///if some segments still left from previous dtata stream. and stream no is 0
						s1_mac_data_d5[k] <= (k > seg_used_d3)? axist_tx_st0_seg_tdata_d3[k-seg_used_d3] : s1_mac_data_d5[k];   ///TBD check if seg_unused_d2 =0 case
						s0_mac_data_d4[k] <= axist_tx_st0_seg_tdata_d3[k+seg_unused_d3];
						s1_mac_tkeep_d5[k] <= (k > seg_used_d3)? axist_tx_st0_seg_tkeep_d3[k-seg_used_d3] : s1_mac_tkeep_d5[k];   ///TBD check if seg_unused_d2 =0 case
						s0_mac_tkeep_d4[k] <= axist_tx_st0_seg_tkeep_d3[k+seg_unused_d3];
						s0_mac_tvalid_d4[k] <=  1'b1;
					end
					else begin
						s0_mac_data_d4[k] <= axist_tx_st0_seg_tdata_d3[k];
						s0_mac_tkeep_d4[k] <= axist_tx_st0_seg_tkeep_d3[k];
						s0_mac_tvalid_d4[k] <=  1'b1;
					end	
				s0_mac_data_d5[k] <= s0_mac_data_d4[k];
				s0_mac_tkeep_d5[k] <= s0_mac_tkeep_d4[k];
				s0_mac_tvalid_d5[k] <= s0_mac_tvalid_d4[k];
			end
			else if ((Strm_fifo_rdreq_d3[1] == 1'b1) && axist_tx_valid_d3[1] && axist_tx_tready_delayed_d3[1]) begin
					if (unused_segments_flag) begin		///if some segments still left from previous dtata stream. and stream no is 0
						s0_mac_data_d5[k] <= (k > seg_used_d3)? axist_tx_st1_seg_tdata_d3[k-seg_used_d3] : s0_mac_data_d5[k];   ///TBD check if seg_unused_d2 =0 case
						s1_mac_data_d4[k] <= axist_tx_st1_seg_tdata_d3[k+seg_unused_d3];
						s0_mac_tkeep_d5[k] <= (k > seg_used_d3)? axist_tx_st1_seg_tkeep_d3[k-seg_used_d3] : s0_mac_tkeep_d5[k];   ///TBD check if seg_unused_d2 =0 case
						s1_mac_tkeep_d4[k] <= axist_tx_st1_seg_tkeep_d3[k+seg_unused_d3];
						s1_mac_tvalid_d4[k] <=  1'b1;
					end	
					else begin
						s1_mac_data_d4[k] <= axist_tx_st1_seg_tdata_d3[k];
						s1_mac_tkeep_d4[k] <= axist_tx_st1_seg_tkeep_d3[k];
						s1_mac_tvalid_d4[k] <=  1'b1;
					end						
				s1_mac_data_d5[k] <= s1_mac_data_d4[k];
				s1_mac_tkeep_d5[k] <= s1_mac_tkeep_d4[k];   
				s1_mac_tvalid_d5[k] <= s1_mac_tvalid_d4[k];
			end
			else begin
				s0_mac_data_d4[k]	<=	64'b0;
				s0_mac_tkeep_d4[k]	<=	8'b0;
				s0_mac_tvalid_d4[k]	<=	1'b0;				
				s1_mac_data_d4[k]	<=	64'b0;
				s1_mac_tkeep_d4[k]	<=	8'b0;
				s1_mac_tvalid_d4[k]	<=	1'b0;				
			end			
		end
*/
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6yuiAY3cLPQh8162ytrBHBdGWl4fSY1gxzf8aqelfXjj4r6aK82fClrXBdwM80beyHrGUNKO43oXggJ+utOheBEXw9MOtbLMQ8XTyoWGsyu7mXptk+lTrrhMMfosTDAsBdcF+mLxigWrbRT6UO8V+pxh9qERo86WbLEleHTAU63+srX6X4UWcKjTuTU29JuZhhKSnUfsj9xpWFXxfzITcxyEpf9Uri/RYx/6Rl9dO5KFR8vXrOYIxigKK22Vj3IZc4y84OFPB5x3PssPQDaZsa6A41l7ZN8fGNvki2CbK/E1xfYYDmkf8FxFDkqHH4n4s9F7m19lh+CfaG/iBCtiRRLRh6Qg0GZtvlk7M16qIIKIE69U9Ic/4kqjHb6xsU3PBw15riIgy10C/hQOhmFzFTgi45kcr1kCE3Okq5fBXoBKpIqjOelgEhisQK4rX7IPYU6YXm4qtLaoI4muiP4zqrEsRFZt/q9L3wVjjyzhoN7MWL1ojV5YR90Tlwj6oD/A3RZ1Xqm8DTesniDWdQlVK0pyxtwhrVKtPUUGcoWZX+dYRSmwO1Ga3zx02jqagOMTo41wRCBwlippavsvyKIfS/HUvkHTP6RrQt2XSY7JO673wORZ9SXWycBFq7dccS/hoXTXeDdYfa+qUPrgEs9wHCDePUXyntBtW4Et8JYy6D6cS2jORd/YSvSo8wssREOuRxKwrQrq215Sq17EHIhF6pG3ppUnWAxuyiKAKbENx2JYiCCXYa68SkJOTcP2mff8XSwi0d9GQktK1pnrwLQGKE9H"
`endif