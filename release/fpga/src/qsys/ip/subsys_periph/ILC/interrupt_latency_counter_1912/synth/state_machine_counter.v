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

module state_machine_counter #(
parameter INTR_TYPE = 1'b1
)(
   clk,
	reset_n,
	pulse_irq_counter_stop,
	global_enable_reg,
	counter_start,
	counter_stop,
	enable,
	c_idle,
	level_reset,
	data_store
);

input wire clk;
input wire reset_n;
input wire pulse_irq_counter_stop;
input wire global_enable_reg;
input wire counter_start;
input wire counter_stop;

output reg enable;
output reg level_reset;
output reg data_store;
output reg c_idle;

reg [1:0] state ;
reg [1:0] next_state ;

localparam IDLE  =2'b00;
localparam START =2'b01;
localparam STOP  =2'b10;
localparam STORE =2'b11;

//State machine Sequential logic 

always @ (posedge clk or negedge reset_n)
begin
       if (!reset_n) state <= IDLE;
       else          state<= next_state;
end


//State Machine Transitional conditions

always @(state or counter_start or counter_stop or pulse_irq_counter_stop or global_enable_reg) 
      begin
           case (state)
               IDLE: if (counter_start==1'b0 || global_enable_reg == 1'b0 || pulse_irq_counter_stop==1'b1) begin
					           next_state = IDLE;  // active low reset signal	
                       end else begin                         
							     next_state = START;
							  end
               START: if (global_enable_reg == 1'b0) begin
							     next_state = IDLE;
                            end 
					   else if ((INTR_TYPE == 0 & counter_stop==1'b1) |(INTR_TYPE == 1 & pulse_irq_counter_stop==1'b1))
					        begin
							     next_state = STOP;
					    	end
					   else
					       begin
						        next_state = START;
						   end
               STOP: begin
				  	           next_state = STORE;
							  end  
               STORE: begin
					           next_state = IDLE;
							  end
              default:next_state = IDLE; 
     endcase
end


//combo logic function to control counter

always @ (state) begin
        case (state)
          IDLE: begin
		           enable = 1'b0;
					  level_reset = 1'b0;
		 			  data_store = 1'b0;
					  c_idle = 1'b1;
		        end
          START: begin
		           enable = 1'b1;
					  level_reset = 1'b1;
					  data_store = 1'b0;
					  c_idle = 1'b0;
		        end 
          STOP: begin
		           enable = 1'b0;
					  level_reset = 1'b1;
					  data_store = 1'b0;
					  c_idle = 1'b0;
		        end 
          STORE: begin
		           enable = 1'b0;
					  level_reset = 1'b1;
					  data_store = 1'b1;
					  c_idle = 1'b0;
		        end
        endcase
end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "htI74XiHCI2kdqVoidtQiKIqa+ANxG0GXV9AaLJ9iPdlXWCzZdfqzW1yJfZkgk5NtywlGbSKcXRbnZNJunuB+wH5XA92YcWlOeMojzBciQ/reXnky4RJN4ejFQJas6WhMtLRUNy474ZOqfXslY6ZYBvCIWiJhlqqPEMN+lNDEpIg3ejy9CccsMu9TbJnuzfsgW/ZulLTfEyUKD1D0ONwcnE93yDlBejWO7N+hstxUWUfQqbfFFwF6qAB480ZnOhhHMTlqL55/1fL8QK+AFQ5NZZk9nsvfnx/0fI634a5sElD+dNjPo6jpClI8pFT6iAzbPSeWdOCD1DM4QmllwCTQn4ewDdV7dhbu9fVt0kYC0MUOeLm20tOF1UGDM2Cpcn5DhXgDOk1Z6m9A5UWPAUmEYKK5GtF2mYFm6WcvkXoM5KK4ih8t+Sl3u7WmR3EMs9SedCh8I2oW4mgwTJmYJEnvGb65s3OaF+yEWjtRiozefqZj2jHozh0iqLOpPFu2vYXbMrSVnZKwUYpBA+4c1/PzzcQHQVrWrWaexIyjrKfCEKpOZPApsMl0aTWcVTsiWARBjKRBbXRlMHcSFNbmFdTSYno3jXqe6yR7hHEFkeAqFeAf5lRrUZkT3RfxfAJXVJUD+O5ACJ/BRF9HT8uBFXxMCNKQAWBHlRZuLwHbr+ly1TsLcOpqRp+8wt+JnjMZK4ipiMpRv7py/3z7q+zyKaQrxWV5PfPreY7zlxcaGp393nMUmssuoR10ws89EOaZ3Ct/kAA0Qdz58meL/fygC27scMt/xT7KQ3WCArOkDGe/geXVweHLGF+60ezfB7nfN7TVLja5nfy/OJfPzdJd5kuqMOuWbE6AEBGVoEgM9PYZgu1x37rHzJB/xurTorCykHdMaiWOIZaXHCBehLI5l3ChNWqJTgO0yfgiQfzTU9gR01f4jQeq0xpHuE6BBKA1BVdNlNhHBEBr1bVeEN2fH350i5rpD7rxzEEoYXB2r5xe6ln8wv6ICsNdQOiGKO/M9PI"
`endif