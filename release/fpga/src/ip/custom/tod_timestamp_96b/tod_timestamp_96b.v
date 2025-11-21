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

module tod_timestamp_96b (
clk_tod								,
rst_clk_tod_n						,
clk_100       						,
system_reset_n						,
pps_in        						,
//pps_in_pos    					,
irq_delay_pulse  					,
eth_tod_master_96b_tx				,
csr_address                			,
csr_write                  			,
csr_read							,
csr_writedata              			,
csr_readdata               			,
csr_readdatavalid					,
csr_waitrequest						,
eth_tod_master_96b_tx_load_data 	,
eth_tod_master_96b_tx_load_valid    ,
rfp_sync_pul						,
rfp_sync_pul_dup				    ,
rfp_sync_pul_cpri					,
ram_read                            ,
ram_q       
);

input wire           clk_tod           		;
input wire           rst_clk_tod_n        	;
input                clk_100               	;
input wire           system_reset_n        	;
input wire  [95:0]   eth_tod_master_96b_tx	;
input wire           pps_in                	;  
wire                 pps_in_pos            	; 
output reg           irq_delay_pulse       	;
output wire [127:0]  ram_q                	;


output reg           eth_tod_master_96b_tx_load_valid ;
output reg  [95:0]   eth_tod_master_96b_tx_load_data  ;
output wire          rfp_sync_pul                     ;
output wire          rfp_sync_pul_dup                 ;
output wire          rfp_sync_pul_cpri                ;

input       [4 :0]   csr_address                      ;
input                csr_write                        ;
input                csr_read						  ;
input       [31:0]   csr_writedata                    ;
output   [31:0]   	csr_readdata                     ;
output 		     	csr_readdatavalid				  ;
output				 csr_waitrequest      			  ;


										              
input                ram_read                         ;
reg                  ram_read_1d                      ;


wire [12:0]          ram_rdusedw                      ;
wire                 ram_rdempty                      ;
wire                 ram_wrfull                       ; 

reg                  pps_in_delay                     ;
reg                  pps_in_delay_1d                  ;
reg                  pps_in_delay_2d                  ;
reg                  pps_in_delay_3d                  ;
reg  [31:0]          irq_delay_cnt                    ;

wire  [31:0]          control               	          ;
reg  [31:0]          control_1d                       ;
reg  [31:0]          control_2d                       ;
wire  [15:0]          seconds_msb                      ;
reg  [15:0]          seconds_msb_1d                   ;
reg  [15:0]          seconds_msb_2d                   ;
wire  [31:0]          seconds_lsb              		  ;
reg  [31:0]          seconds_lsb_1d                   ;
reg  [31:0]          seconds_lsb_2d                   ;
wire  [31:0]          nanoseconds                      ;
reg  [31:0]          nanoseconds_1d                   ;
reg  [31:0]          nanoseconds_2d                   ;
wire  [31:0]          fr_nanoseconds                   ;
reg  [31:0]          fr_nanoseconds_1d                ;
reg  [31:0]          fr_nanoseconds_2d                ;
wire [47:0]          seconds                          ;

reg  [95:0]          tod_fs                           ;
reg                  sec_sel                          ;
reg                  ns_sel                           ;
reg                  fns_sel                          ;

reg                  rfp_sync_pul_1d                  ;
reg                  rfp_sync_pul_2d                  ;
reg                  rfp_sync_pul_3d                  ;
reg                  rfp_sync_pul_4d                  ;
reg		     		 rfp_sync_pulse		 			  ;
reg		     	 	rfp_sync_pulse_ext		 		  ;

reg      			 rfp_sync_pulse_1d				  ;
reg      			 rfp_sync_pulse_2d				  ;
reg      			 rfp_sync_pulse_3d				  ;

// Outputs from the TOD_TS_Registers instance
wire tod_control_load_tod;
wire tod_control_comparator;
wire [15:0] fractional_nanoseconds;

assign csr_waitrequest = 1'b0 ; 

    // Instantiate the TOD_TS_Registers module
    TOD_TS_Registers u_tod_ts_registers (
        // Connect outputs
        .tod_control_load_tod					(tod_control_load_tod							),//output reg
        .tod_control_comparator					(tod_control_comparator							),//output reg
        .nanoseconds_nanoseconds				(nanoseconds									),//output reg [31:0]
        .fr_nanoseconds_fractional_nanoseconds	(fractional_nanoseconds							),//output reg [15:0]
        .seconds_msb_seconds_msb				(seconds_msb									),//output reg [15:0]
        .seconds_lsb_seconds_lsb				(seconds_lsb									),//output reg [31:0]
        // Connect inputs
        .ram_status_rfp_pul_ram_rdusedw_i		(ram_rdusedw									),//input wire [12:0]
        .ram_status_rfp_pul_ram_rdempty_i		(ram_rdempty									),//input wire
        .ram_status_rfp_pul_rfp_sync_pul_i		(rfp_sync_pul_2d								),//input wire
        // Connect bus interface
        .clk									(clk_100										),//input wire
        .reset									(~system_reset_n								),//input wire
        .writedata								(csr_writedata									),//input wire [31:0]
        .read									(csr_read										),//input wire
        .write									(csr_write										),//input wire
        .byteenable								(4'b1111										),//input wire [3:0]
        .readdata								(csr_readdata									),//output reg[31:0]
        .readdatavalid							(csr_readdatavalid								),//output reg
        .address								({csr_address[3:0],2'b00}						)//input wire [4:0]
    );
	
	assign control =  {30'b0,tod_control_comparator,tod_control_load_tod} ; //{30'b0,tod_control_load_tod,tod_control_comparator};
	assign fr_nanoseconds = {16'b0,fractional_nanoseconds};

//// HPS Address Decoding
// always @ (posedge clk_100 or negedge system_reset_n)
// begin
    // if (~system_reset_n)
    // begin
        // control         <=  32'b0  ;
		// nanoseconds     <=  32'b0  ;
		// fr_nanoseconds  <=  32'b0  ;
		// seconds_msb     <=  16'b0  ;
		// seconds_lsb     <=  32'b0  ;
        
    // end
    // else  
    // begin
        // case(csr_address)
        // 4'd0: 
        // begin
            // if(csr_write)
                // control     <= csr_writedata    	;
            // csr_readdata    <= control          	;
        // end
		
		// 4'd1: 
        // begin
            // if(csr_write)
                // nanoseconds <= csr_writedata    	;
            // csr_readdata    <= nanoseconds      	;
        // end
		
		// 4'd2: 
        // begin
            // if(csr_write)
                // fr_nanoseconds <= csr_writedata     ;
            // csr_readdata       <= fr_nanoseconds    ;
        // end
		
		// 4'd3: 
        // begin
            // if(csr_write)
                // seconds_msb    <= csr_writedata[15:0]  ;
            // csr_readdata[15:0] <= seconds_msb      	   ;
        // end
		
		// 4'd4: 
        // begin
            // if(csr_write)
                // seconds_lsb <= csr_writedata    	;
            // csr_readdata    <= seconds_lsb      	;
        // end
		
		// 4'd5: 
        // begin
            // csr_readdata    <= {17'b0,rfp_sync_pul_2d,ram_rdempty,ram_rdusedw} ;
        // end
        
        
        // endcase
    // end
// end


always @ (posedge clk_tod)
begin : PIPE_DELAY
    if(~rst_clk_tod_n) 
    begin
        control_1d                  <=  32'b0   ;
        control_2d                  <=  32'b0   ;
		nanoseconds_1d              <=  32'b0   ;
		nanoseconds_2d              <=  32'b0   ;
		fr_nanoseconds_1d           <=  32'b0   ;
		fr_nanoseconds_2d           <=  32'b0   ;
		seconds_msb_1d              <=  16'b0   ;
        seconds_msb_2d              <=  16'b0   ;
		seconds_lsb_1d              <=  32'b0   ;
        seconds_lsb_2d              <=  32'b0   ;
		
	end
    else
    begin
        control_1d                  <=  control                     ;
        control_2d                  <=  control_1d                  ;
		nanoseconds_1d              <=  nanoseconds                 ;
		nanoseconds_2d              <=  nanoseconds_1d              ;
		fr_nanoseconds_1d           <=  fr_nanoseconds              ;
		fr_nanoseconds_2d           <=  fr_nanoseconds_1d           ;
		seconds_msb_1d              <=  seconds_msb                 ;
		seconds_msb_2d              <=  seconds_msb_1d              ;  
		seconds_lsb_1d              <=  seconds_lsb                 ;
		seconds_lsb_2d              <=  seconds_lsb_1d              ;  
    end
    end
	  
always @ (posedge clk_tod)
 begin
  if (~rst_clk_tod_n)
  begin
      rfp_sync_pulse_1d  <= 1'b0;
      rfp_sync_pulse_2d  <= 1'b0;
      rfp_sync_pulse_3d  <= 1'b0;
	  rfp_sync_pulse_ext <= 1'b0;
  end	  
  else
  begin
     rfp_sync_pulse_1d  <= rfp_sync_pulse	;
     rfp_sync_pulse_2d  <= rfp_sync_pulse_1d;
     rfp_sync_pulse_3d  <= rfp_sync_pulse_2d;
	 rfp_sync_pulse_ext <= rfp_sync_pulse_1d | rfp_sync_pulse_2d | rfp_sync_pulse_3d ;
	 
  end
 end

//assign rfp_sync_pulse_ext = rfp_sync_pulse_1d | rfp_sync_pulse_2d | rfp_sync_pulse_3d ;

always @ (posedge clk_100)
begin 
    if(~system_reset_n) 
    begin
     rfp_sync_pul_1d <= 'b0					;	
	 rfp_sync_pul_2d <= 'b0					;
 	 end
	else
    begin	
     rfp_sync_pul_1d <= rfp_sync_pulse_ext  ;
	 rfp_sync_pul_2d <= rfp_sync_pul_1d     ;
	 end
end
	 

assign rfp_sync_pul_cpri = rfp_sync_pul 		;
assign rfp_sync_pul      = rfp_sync_pulse		;
assign rfp_sync_pul_dup  = rfp_sync_pulse       ;

assign seconds = {seconds_msb_2d,seconds_lsb_2d};
     


always @ (posedge clk_tod)
 begin
  if (~rst_clk_tod_n)
  begin
      pps_in_delay    <= 1'b0;
      pps_in_delay_1d <= 1'b0;
      pps_in_delay_2d <= 1'b0;
      pps_in_delay_3d <= 1'b0;
  end	  
  else
  begin
     pps_in_delay    <= pps_in			;
     pps_in_delay_1d <= pps_in_delay	;
     pps_in_delay_2d <= pps_in_delay_1d	;
     pps_in_delay_3d <= pps_in_delay_2d	;
  end
 end
  
  
assign pps_in_pos = pps_in_delay_2d & (~pps_in_delay_3d);
 
 

   always @ (posedge clk_tod)
  begin
  if ((~rst_clk_tod_n)| pps_in_pos )
  irq_delay_cnt <= 32'b0				;
  else
  irq_delay_cnt <= irq_delay_cnt + 32'b1;
  end
 
  always @ (posedge clk_tod)
  begin
  if ((~rst_clk_tod_n) | pps_in_pos)
  irq_delay_pulse <= 1'b0;
  else if (irq_delay_cnt == 32'd156250000 )
  irq_delay_pulse <= 1'b1;
  end
 
 
   always @ (posedge clk_tod)
  begin
  if (~rst_clk_tod_n)
  eth_tod_master_96b_tx_load_valid <= 1'b0		;
  else if (control_2d[0])
  eth_tod_master_96b_tx_load_valid <= pps_in_pos;
  else 
  eth_tod_master_96b_tx_load_valid <= 1'b0   	;
  end
  
  
 
   always @ (posedge clk_tod)
  begin
  if (~rst_clk_tod_n)
  eth_tod_master_96b_tx_load_data <= 96'b0;
  else if (pps_in_pos & control_2d[0])
  eth_tod_master_96b_tx_load_data <= {seconds,nanoseconds_2d,fr_nanoseconds_2d[15:0]};
  end
  
  always @ (posedge clk_tod)
  begin
  if (~rst_clk_tod_n)
  tod_fs   <= 96'b0;
  else if (control_2d[1])
  tod_fs   <= {seconds,nanoseconds_2d,fr_nanoseconds_2d[15:0]};
  end
  
  
 /* always @ (posedge clk_tod )
begin : TOD_SEL
    if(~rst_clk_tod_n)
    begin
        sec_sel         <=  1'b0    ;
        ns_sel          <=  1'b0    ;
        fns_sel         <=  1'b0    ;
    end		
    else
    begin
        sec_sel      <=  tod_fs[95:48] ==  eth_tod_master_96b_tx[95:48]            ;
        ns_sel       <=  tod_fs[47:20] ==  eth_tod_master_96b_tx[47:20]            ; // ignoring lsb 4 bits
        fns_sel      <=  tod_fs[15:0]  ==  eth_tod_master_96b_tx[15:0]             ;
        
    end 
end  */

 always @ (posedge clk_tod )
begin : TOD_SEL
    if(~rst_clk_tod_n)
    begin
        sec_sel         <=  1'b0    ;
        ns_sel          <=  1'b0    ;
        fns_sel         <=  1'b0    ;
    end		
    else
     begin
        sec_sel      <=  eth_tod_master_96b_tx[95:48] == tod_fs[95:48]             ;
        ns_sel       <=  eth_tod_master_96b_tx[47:16] >= tod_fs[47:16]             ; // ignoring lsb 4 bits
        fns_sel      <=  eth_tod_master_96b_tx[15:0]  == tod_fs[15:0]              ;
        
     end  
end 


always @ (posedge clk_tod )
begin : OUTPUT_RFP
    if(~rst_clk_tod_n) 
        rfp_sync_pulse <=  1'b0   ;
    else if (~control_2d[1])
        rfp_sync_pulse <=  1'b0   ;	
    else if (sec_sel & ns_sel)
        rfp_sync_pulse <=  1'b1   ;
end
  
  
 ff_96i_96o_4096kd u_ff_96i_96o_4096kd
(
    .data       ({32'b0,eth_tod_master_96b_tx}       ),   
    .wrreq      (pps_in_pos              			 ),   
    .rdreq      (ram_read							 ),   
    .wrclk      (clk_tod              				 ),   
    .rdclk      (clk_100                  			 ),   
    .aclr       (~system_reset_n                     ),   
    .q          (ram_q                    			 ),   
    .rdusedw    (ram_rdusedw              			 ),   
    .rdempty    (ram_rdempty              			 ),   
    .wrfull     (ram_wrfull               			 )    
);  
 
  

endmodule

