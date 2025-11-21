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

module eth_f_40g_bridge_otn_rx #(
  parameter SIM_EMULATE    = 0,
  parameter WIDTH         = 66
)
(
   input   logic 			 	      	      i_clk,
   input   logic				   	          i_reset,
   input   logic                			i_rx_valid, 
   input   logic [0:3] [WIDTH -1:0]   i_rx_data,
   input   logic        		          i_rx_am_valid,
   
   output  logic [0:1] [WIDTH -1:0]   o_rx_data,
   output  logic                      o_rx_am_valid,
   output  logic 				              o_rx_valid
 );
   
   logic [0:1]                          o_rx_am_valid_temp;
   localparam  BWIDTH = 1+WIDTH;  // am_valid + data
   logic 			                	 mem_sel;
   logic [1:0] 			       			 empty;						
   logic [0:3] [BWIDTH-1:0]              fifo_wr_data;
   logic [0:3] [BWIDTH-1:0]              fifo_rd_data;
   logic [0:1] [BWIDTH-1:0]              fifo_dout_reg;
  
   assign fifo_wr_data[0] = { i_rx_am_valid,  i_rx_data[0]};	
   assign fifo_wr_data[1] = { i_rx_am_valid,  i_rx_data[1]};
   assign fifo_wr_data[2] = { i_rx_am_valid,  i_rx_data[2]};
   assign fifo_wr_data[3] = { i_rx_am_valid,  i_rx_data[3]};  
		

 //empty[0] - 2nd set of 4-lanes data i.e. [0] & [1] are read out. 
 //Indicates true empty of both FIFOs - !empty[0] used as read enable
 eth_f_scfifo_mlab #(
		.SIM_EMULATE (SIM_EMULATE),
		.WIDTH       (2*(BWIDTH))
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
		.WIDTH       (2*(BWIDTH))
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
	
	assign { o_rx_am_valid_temp[0], o_rx_data[0]} = fifo_dout_reg[0];
	assign { o_rx_am_valid_temp[1], o_rx_data[1]} = fifo_dout_reg[1];

	assign  o_rx_am_valid = o_rx_am_valid_temp[0];
	
	always @(posedge i_clk) 
	begin
	o_rx_valid    	<= !empty[0];
	end 
 
endmodule 




`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XZXww3UE7CKagp6NkDE963gTsRH8KHl6z5sE2BxkPA4CjdcYtOeSZJFjI7WdG8DxAeRNVblXZgBvIlMcs/IXYYaVjqI5oLvpRhRCE18Vvwd1rE6arfRLN8oSBeXVfp6dcAsgwo+jIhKDNrvvFewLGrRht/v4NPLEOGN7pTHecl8DekfjmzE9OXlrV59HynEsOwyuLkDAdQcDVbzmR8zWnBp6RKgMvZh4FCPfnN/eQfd+CDdDP1aZ6U0m3Le5wGrZYoS4kF35InZAD1yLT238+CHlBsEmcpje61D6gru8qg2s2ZJeX2Ddk45/s0GOC7kShF9eu2SZnCb9r72eVCqa2oSkT5qqWKoTvkvI5w9i3u6F8/79H++5628qFpb8rTTxXbgWkjsuoL/it+KiVxzaMEuF9WuReavX4eMES7csrBW6Ht4iWIcw41duvT5ZvOfIj40NDxyfT+lr+vwlDnOkk7Zv7hQL4W1l0F1UvXR5MoPc3BUw6DXxvvCbaWVMdZee5MNa0busZIztMK7iFnu0dzoq9BMkckf/VymgTAOhbQ1Tgna00Ls/REM+ScVB4bd2aPJm8aNvjX78scNzU1oQ0yftSjSPK+XkMumomMBlcoRcMgS2gJ14CGyLHUqziB9tzjgvgqgVLySLgbkM67JL1pUPcYplGWxnGZY9+y5O0IVp0Igp987N/0dXh5/BVBp/vodmMxrDwPJAIQFD7pJSclTbR/WV39XRm6ZfxYQYwoVnRX+mgtuE5UHt0BgQQ0+JDCRSYsU7vmO+zQXuvIqxXhs"
`endif