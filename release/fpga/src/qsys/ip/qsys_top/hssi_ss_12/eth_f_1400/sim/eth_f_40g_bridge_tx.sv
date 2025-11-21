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

module eth_f_40g_bridge_tx #(
 parameter SIM_EMULATE    = 0,
 parameter WIDTH         = 64
)
(
    input   logic 			 	      			  i_clk,
    input   logic				   	  			  i_reset,
    output  logic                                 o_tx_ready,
    input   logic                     			  i_tx_valid,
	input   logic   [0:1][WIDTH -1:0] 			  i_tx_data,
	input   logic   [0:1]             			  i_tx_inframe,
	input   logic   [0:1][2:0]         			  i_tx_empty,
	input   logic   [0:1]             			  i_tx_error,
	input   logic   [0:1]             			  i_tx_skip_crc,
	
    output  logic   [0:3][WIDTH -1:0]             o_tx_data,
	output  logic   [0:3]                         o_tx_inframe,
	output  logic   [0:3][2:0]                    o_tx_empty,
	output  logic   [0:3]                         o_tx_error,
	output  logic   [0:3]                         o_tx_skip_crc,
    output  logic 							      o_tx_valid,
	input   logic                    			  i_ready
	
 );
 
    localparam  BWIDTH = 1+3+1+1+WIDTH; // if, crc, error, empty, data
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
	
 //write toggle logic
	always @(posedge i_clk)
	begin
	  if (i_reset) begin
	     mem_sel <= 'd0;
	  end else begin 
	     if(i_tx_valid) begin
				mem_sel   <= !mem_sel;
		end
      end
	end

   assign fifo_wr_data[0] = {i_tx_inframe[0],i_tx_skip_crc[0],i_tx_error[0],i_tx_empty[0],i_tx_data[0]};
   assign fifo_wr_data[1] = {i_tx_inframe[1],i_tx_skip_crc[1],i_tx_error[1],i_tx_empty[1],i_tx_data[1]};

  eth_f_scfifo_mlab #(
		.SIM_EMULATE (SIM_EMULATE),
		.WIDTH       (2*BWIDTH)
	) i_ehip_scfifo_mlab_1 (
		.clk     (i_clk),
		.sclr    (i_reset),
		.wdata   ({fifo_wr_data[0],fifo_wr_data[1]}),
		.wreq    (i_tx_valid && mem_sel==0),
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
		.wreq    (i_tx_valid && mem_sel==1),
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
	
	assign {o_tx_inframe[0],o_tx_skip_crc[0],o_tx_error[0],o_tx_empty[0],o_tx_data[0]} = fifo_dout_reg[0];
	assign {o_tx_inframe[1],o_tx_skip_crc[1],o_tx_error[1],o_tx_empty[1],o_tx_data[1]} = fifo_dout_reg[1];
	assign {o_tx_inframe[2],o_tx_skip_crc[2],o_tx_error[2],o_tx_empty[2],o_tx_data[2]} = fifo_dout_reg[2];
	assign {o_tx_inframe[3],o_tx_skip_crc[3],o_tx_error[3],o_tx_empty[3],o_tx_data[3]} = fifo_dout_reg[3];
	
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
        cnt <= 0;
    else if(o_tx_ready & i_ready)
        cnt <= cnt + 8'h01;
    else if(o_tx_ready)
        cnt <= cnt - 8'h01;
    else if(i_ready)
        cnt <= cnt + 8'h02;
   end
   assign o_tx_ready = (cnt > 0);


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
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XZOob5ti8JetZRpx6BCSGkOwyK3X+k7A7Tr3mzcBFL7a4kI3XRjYBSaLUG3D+5UNqdz87skD9myuD6f2Gvo5RmW3ajZm401gOgwoUDhSV+XQE7QTU6Lk0jEb+I6hwTFU15AlWIzV3eBI+jnd+V+KTrfC0yKCIAVeJArWOBRjBcsvzoxK4Q3xOZSGYtpaAvnfIwtM4QN+VDuGjPzgZcNM7Neux54UDA8Bv4jVo0lQ0qsu9IOg8hXIlsOr6Zm0prlZr2/CbGNsIIf0RbBfcVNKZWK0j2zzf6gxZ2EckI/ETYHTGgZKRmmh10/cb/LfHsov4gbfrp4S1gfmxqhmplKyEvT2bR1ArMIGsVRVdbgUFcVNGpvc7a6NIDlhreKmNlw6OAfh4rZriBTnDmQVhcvlkp3bculgOdaajjM16dDtaYIInzdnRoAqe/ml3NI0sMYSlHB14wf6pVhBGIMORET3913OPwH5XLE6malxzpLLFvtawQsZM8yLQIuF++foYlOuZlDBdNvzYdkALZ64QAB3kPE5NN1HlESJlxZAvWRCG8buGgEgLxtKspLIKYn0Ah1UzpMKpuURo8WvEkeM47rDZRMTG9QTWoxc3JWKTeCOqqtgblQdrWHAS6WmJy7OmVCKFKkQcHtrgWu8RkwJWI1KxJ86Akft3/4Ysku/nseqiqSQEYlU0G0s3UR8whrNQdRc/D4rCmUsBDTp5Whj1vvef7MlBi8md3uIZVOyg9MHJstNFV8KpdaVfOOdi+88VFtm+SjZra2uqEV1poZzgPwE6Cj"
`endif