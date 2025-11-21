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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module eth_f_40g_bridge_rx #(
  parameter SIM_EMULATE    = 0,
  parameter WIDTH         = 64
)
(
   input   logic 			 	      	      i_clk,
   input   logic				   	          i_reset,
   input   logic                			  i_rx_valid, 
   input   logic [0:3] [WIDTH -1:0]           i_rx_data,
   input   logic [0:3] 			              i_rx_inframe,
   input   logic [0:3] [2:0] 	        	  i_rx_empty,
   input   logic [0:3] [1:0]      	          i_rx_error,
   input   logic [0:3] 			              i_rx_fcs_error,
   input   logic [0:3] [2:0] 	        	  i_rx_status,
   
   output  logic [0:1] [WIDTH -1:0]           o_rx_data,
   output  logic [0:1]                        o_rx_inframe,
   output  logic [0:1] [2:0]       		      o_rx_empty,
   output  logic [1:0] [1:0]                  o_rx_error,
   output  logic [1:0]                        o_rx_fcs_error,
   output  logic [1:0] [2:0] 		          o_rx_status,
   output  logic 				              o_rx_valid
 );
 
   localparam  BWIDTH = 1+3+2+1+3+WIDTH;  // if + empty + error + fcs_error + status + data
   logic 			                	 mem_sel;
   logic [1:0] 			       			 empty;						
   logic [0:3] [BWIDTH-1:0]              fifo_wr_data;
   logic [0:3] [BWIDTH-1:0]              fifo_rd_data;
   logic [0:1] [BWIDTH-1:0]              fifo_dout_reg;
  
   assign fifo_wr_data[0] = {i_rx_inframe[0], i_rx_empty[0], i_rx_error[0], i_rx_fcs_error[0], i_rx_status[0], i_rx_data[0]};	
   assign fifo_wr_data[1] = {i_rx_inframe[1], i_rx_empty[1], i_rx_error[1], i_rx_fcs_error[1], i_rx_status[1], i_rx_data[1]};
   assign fifo_wr_data[2] = {i_rx_inframe[2], i_rx_empty[2], i_rx_error[2], i_rx_fcs_error[2], i_rx_status[2], i_rx_data[2]};
   assign fifo_wr_data[3] = {i_rx_inframe[3], i_rx_empty[3], i_rx_error[3], i_rx_fcs_error[3], i_rx_status[3], i_rx_data[3]};  
		

 //empty[0] - 2nd set of 4-lanes data i.e. [0] & [1] are read out. 
 //Indicates true empty of both FIFOs - !empty[0] used as read enable
 eth_f_scfifo_mlab #(
		.SIM_EMULATE (SIM_EMULATE),
		.WIDTH       (2*(WIDTH+1+3+2+1+3))
	) i_bridge_rx_scfifo_mlab_1 (
		.clk     (i_clk),
		.sclr    (i_reset),
		.wdata   ({fifo_wr_data[0],fifo_wr_data[1]}),
		.wreq    (i_rx_valid),
		.full    (),//unused
		.rdata   ({fifo_rd_data[0],fifo_rd_data[1]}),
		.rreq    (~empty[0] && mem_sel==1), 
		.empty   (empty[0])
	);
				
   eth_f_scfifo_mlab #(
		.SIM_EMULATE (SIM_EMULATE),
		.WIDTH       (2*(WIDTH+1+3+2+1+3))
	) i_bridge_rx_scfifo_mlab_2 (
		.clk     (i_clk),
		.sclr    (i_reset),
		.wdata   ({fifo_wr_data[2],fifo_wr_data[3]}),
		.wreq    (i_rx_valid),
		.full    (),//unused
		.rdata   ({fifo_rd_data[2],fifo_rd_data[3]}),
		.rreq    (~empty[0] && mem_sel==0), //data from this FIFO should be sent out first
		.empty   (empty[1])
	);
	  		
//read toggle logic		
	always @(posedge i_clk)
	begin
	  if (i_reset) begin
	     mem_sel <= 'd0;
	  end else begin 
	     if(!empty[0]) begin
            mem_sel   <= !mem_sel;
		end
      end
	end
	
    always @(posedge i_clk) begin
		if (mem_sel == 0) begin
		   {fifo_dout_reg[0],fifo_dout_reg[1]} <= {fifo_rd_data[2],fifo_rd_data[3]}; //first
		end else begin 
		   {fifo_dout_reg[0],fifo_dout_reg[1]} <= {fifo_rd_data[0],fifo_rd_data[1]}; //second
		end
	end
	
	assign {o_rx_inframe[0], o_rx_empty[0], o_rx_error[0], o_rx_fcs_error[0], o_rx_status[0], o_rx_data[0]} = fifo_dout_reg[0];
	assign {o_rx_inframe[1], o_rx_empty[1], o_rx_error[1], o_rx_fcs_error[1], o_rx_status[1], o_rx_data[1]} = fifo_dout_reg[1];

	
	always @(posedge i_clk) 
	begin
	o_rx_valid    	<= !empty[0];
	end 
 
endmodule 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XazsoXE5EMExs+XP4ElDvljax49EK1r/eiRpyvc7sADDwVjc1RHGFdMVvKRkhMEFbeG9KBBr3S2JJBTBGrl5HQbDt1rgqVvyRGVrhnLHupCYoviUzmS89cEBWYb6fDjmK/+APsKy87ZiPuaCWI161KFsrcsDUKoBV6ZeZ7PgVlT+TUvCBDSMaRwSi1l5jUU3pXdWVZ5kCHzNA656M99c4Oy3qAKWHzk1EixtAbUOfTg1RySXLrNbI0TC7wNXhWH9BmnyFM2agkULKY4x+GGq+T0bVqOBwd4pXj/TouMfZPyyGLHr3X5NQzBThpt0IN78psilMXwR9/6/k8AEae0T92RU9w3qAfYibuYyOEdLRakhKMdXXERZR1FSvA8DyExCZVQTCaShcm9hjdIRmjTHZdf2+cl2cFezk/1D+nfAQDc6n0E94Lv7GnimtdRRy+Cc0NGGiGzwtHHI1/5PzA4z/yWDJHzwosAeHf8k7iSMJxhwSNn5YccC89kaH73NhNVfr+ueDFRuinRiSHehMjpNkW0/suaxafomWtmdGPwQjPFbagTlGsnx21wR0d9PMvyytw+1DqINGmACOi24vHWjGml8udPVmEkViS8SKoVd3v9AUIM2DDbDU/8c/L5ksnW1jbMLsQEbh8QJC4d8P40pDW6Vmv3GzIvRim4RkVE2Z4/sUVKXrIMy/tuSO/kVKwmpB8vL4Ltu9yABT//K9pagiA3V9Yh+T4TQ2lXaDLb4vz012DF4Q/rMzZOnIAuCbHizL7gC6YHyM8CUh32ma9+44Zq"
`endif