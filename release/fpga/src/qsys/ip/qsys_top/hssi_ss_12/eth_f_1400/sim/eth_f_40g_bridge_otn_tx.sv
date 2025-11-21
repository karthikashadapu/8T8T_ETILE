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

module eth_f_40g_bridge_otn_tx #(
 parameter SIM_EMULATE    = 0,
 parameter WIDTH         = 66
)
(
    input   logic 			 	      			  i_clk,
    input   logic				   	  			  i_reset,
    output  logic                                 o_tx_ready,
    input   logic                     			  i_tx_valid,
	input   logic   [0:1][WIDTH -1:0] 			  i_tx_data,
	input   logic   							  i_tx_am,

	
    output  logic   [0:3][WIDTH -1:0]             o_tx_data,
	output  logic 								  o_tx_am,
    output  logic 							      o_tx_valid,
	input   logic                    			  i_ready
	
 );
 
    localparam  BWIDTH = 1+WIDTH; // data
	
    logic 								  empty_w;
    logic 								  full_w;
    logic  			   				      mem_sel;
    logic [1:0]			   		          empty;
    logic [1:0]			   		          full;
    logic [0:1] [BWIDTH-1:0]              fifo_wr_data;
    logic [0:3] [BWIDTH-1:0]              fifo_rd_data;
    logic [0:3] [BWIDTH-1:0]              fifo_dout_reg;
    logic [7:0]                           cnt;
    reg   [30:0]  used;


  logic		tx_am_rising_edge;
  logic		tx_am_falling_edge;
  logic 	tx_am_delayed;
  logic [3:0] 	tx_am_pulse;
  logic   [0:1][WIDTH -1:0] 			  i_tx_data_delayed;
  
  always @ (posedge i_clk) begin
	if(i_reset) 
		tx_am_delayed <= 1'b0;
	else 
	if(i_tx_valid) begin
		tx_am_delayed <= i_tx_am;
		i_tx_data_delayed <= i_tx_data;
	end
  end
  
  assign tx_am_rising_edge = i_tx_am & ~tx_am_delayed;
  assign tx_am_falling_edge = ~i_tx_am & tx_am_delayed;


// when am pulse ?
// assign tx_am_rising_edge = i_tx_valid & i_tx_am;

	
//write toggle logic
	always @(posedge i_clk)
	begin
	  if (i_reset) begin
	     mem_sel <= 'd0;
	  end 
	  else begin 
	     if(i_tx_valid) begin
			if(tx_am_rising_edge ) begin
				mem_sel <= 'd1;
			end 
			else begin
				mem_sel   <= !mem_sel;
			end
		end
	  end
	end

 
   assign fifo_wr_data[0] = {tx_am_delayed,i_tx_data_delayed[0]};
   assign fifo_wr_data[1] = {tx_am_delayed,i_tx_data_delayed[1]};
 
  eth_f_scfifo_mlab #(
		.SIM_EMULATE (SIM_EMULATE),
		.WIDTH       (2*BWIDTH)
	) i_ehip_scfifo_mlab_1 (
		.clk     (i_clk),
		.sclr    (i_reset),
		.wdata   ({fifo_wr_data[0],fifo_wr_data[1]}),
		.wreq    (i_tx_valid && mem_sel==1),
		.full    (full[0]),
		.rdata   ({fifo_rd_data[2],fifo_rd_data[3]}), //read out first set of blocks at mem_sel=0
		.rreq    (~empty[0] && ~empty[1] && i_ready),
		.empty   (empty[0])
	);
				
   eth_f_scfifo_mlab #(
		.SIM_EMULATE (SIM_EMULATE),
		.WIDTH       (2*BWIDTH)
	) i_ehip_scfifo_mlab_2 (
		.clk     (i_clk),
		.sclr    (i_reset),
		.wdata   ({fifo_wr_data[0],fifo_wr_data[1]}),
		.wreq    (i_tx_valid && mem_sel==0),
		.full    (full[1]),
		.rdata   ({fifo_rd_data[0],fifo_rd_data[1]}),
		.rreq    (~empty[0] && ~empty[1] && i_ready),
		.empty   (empty[1])
	);	
	
	always @(posedge i_clk)
	begin
		fifo_dout_reg[0] <=  fifo_rd_data[0];
		fifo_dout_reg[1] <=  fifo_rd_data[1];
		fifo_dout_reg[2] <=  fifo_rd_data[2];
		fifo_dout_reg[3] <=  fifo_rd_data[3];
	end
	
	assign {tx_am_pulse[0],o_tx_data[0]} = fifo_dout_reg[0];
	assign {tx_am_pulse[1],o_tx_data[1]} = fifo_dout_reg[1];
	assign {tx_am_pulse[2],o_tx_data[2]} = fifo_dout_reg[2];
	assign {tx_am_pulse[3],o_tx_data[3]} = fifo_dout_reg[3];

	assign o_tx_am = &tx_am_pulse;
		
	eth_f_delay_reg #(
		.CYCLES (1),
		.WIDTH  (1)
	) valid_out_delay (
		.clk    (i_clk),
		.din    (~empty[0] && ~empty[1] && i_ready),
		.dout   (o_tx_valid)
	);
 
 
   //Ready generation logic
   //Input ready from Tile carries cadence for 156M (4 lanes)
   //Output ready to Adapter needs to carry cadence for 312M (2 lanes)
   //This logic creates 2x high cycles for every 1x input high cycle
   always @(posedge i_clk)
   begin
    if(i_reset)
        cnt <= 8'd0;
    else if(o_tx_ready & i_ready)
        cnt <= cnt + 8'd1;
    else if(o_tx_ready)
        cnt <= cnt - 8'd1;
    else if(i_ready)
        cnt <= cnt + 8'd2;
   end
   assign o_tx_ready = (cnt > 8'd0);
 
 
// logic to monitor 'used' variable  
   assign empty_w  = empty[0];
   assign full_w   = full[0];
   wire    write   = (i_tx_valid && mem_sel==0) && !full_w;
   wire    read    = (~empty_w && ~empty[1] && i_ready) && !empty_w;
     always @(posedge i_clk) begin
        if (i_reset) begin
            used <= 31'd0;
        end else begin
            if (write) begin
                if (read) begin
                    used <= used;
                end else begin
                    used <= {used[29:0], 1'b1};
                end
            end else begin
                if (read) begin
                    used <= {1'b0, used[30:1]};
                end else begin
                    used <= used;
                end
            end
        end
    end
endmodule 




`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XaoWPik7AJRdq5OKz5k2ExmwixyaG1fu4HSkuVxCQrYIOEpQWA5HQremLYjIQaNlJ83DZuaPOA4CGOE4VZjpttBMAyzv/3KLALGWh3dGTWW/ZHHRQ7O4KlcXS8dtIfUJ+BRXlrC7/Mz/thVQHoIhIAirBbW4ENPMRdEskbwApxgWrrhdblhsOH5WPK8spmTbzcQL++7Gd1tFGxMXHQbCvaKmoFmkHnpE8TsJPMTHd8Mb2pOPMEvHp3H3czqgm2FWrHZG54QOTDCEwyC1Mi7I9X5gF/2eRty/QFkOt9b5itd+eV3u7rHQ/9UrR0pghHciLwJamn0htut+qWNc1bm0o5vq8TxUtGbvIEvr/OElnQTcqin/Be55yq8gl18Fvms88hnwd///20XzHmG1UxprpdcpHSc4ghaplvJ906I/J47M8oNVHrB7eFZsyvmZSCA8qqwTAKZTzrYZr3hmoMYcrHTPPo0OHFJBCg3ySzqfYNs9pVZ32cFuLwp6zXPZsWGIPmpDX8ay6I9uYd/QGzXxau71HYSJCnXS+T0RjoKiHjKmt2kdUNy5Eu4LeakRS5C6vhJNFFx+CFdGl2pORXZIp8YTUP/L6yVT4VDxEuICv4RY3ArpFwOG8Z8Bn4PkBq6pU0qfXZONWYvnM7Czd4Gq5v0KfqoMUDGRK30VvskkIcGV2+S8qOTaGB5d38np3oRxTpuVYgFk87v+GfJz8GhujPMhDkLUNmEB6ziOaufst1/mSIUyEuvPFB2C/b3uDqcskLTR++BE+vk9HliFYjsiSnq"
`endif