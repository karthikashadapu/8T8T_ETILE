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



module eth_f_pause #(
    parameter DWIDTH        = 64,
    parameter NUM_SEG       = 8,
    parameter AIB_LANES	    =16,
    parameter EHIP_RATE     = 5,
    parameter SIM_EMULATE   = 0
) (
    input   logic                       	i_clk,
    input   logic                       	i_reset,
 
    input   logic   [AIB_LANES-1:0][DWIDTH-1:0]   i_data,
    input   logic   [AIB_LANES-1:0]               i_inframe,
    input   logic   [AIB_LANES-1:0]               i_error,
    input   logic   [AIB_LANES-1:0][2:0]          i_empty,
    input   logic                                 i_valid,
    input   logic   [AIB_LANES-1:0]               i_skip_crc,
    output  logic                                 o_ready_sip,
	 
    input   logic                                 i_qvalid,
    input   logic    [15:0]              	  i_quanta,
    output   logic                    		  o_rx_pause,
    input   logic                                 tx_flow_control, //YES - 1, NO - 0
    input   logic                                 enable_sfc,                     
 
    output  logic   [AIB_LANES-1:0][DWIDTH-1:0]   o_data,
    output  logic   [AIB_LANES-1:0]               o_inframe,
    output  logic   [AIB_LANES-1:0]               o_error,
    output  logic   [AIB_LANES-1:0][2:0]          o_empty,
    output  logic                                 o_valid,
    output  logic   [AIB_LANES-1:0]               o_skip_crc,
    input   logic                                 i_ready
 
);
 
    genvar i;
    localparam  BWIDTH 		= 1+1+1+3+DWIDTH; // if, error, crc, empty, data
    localparam  SEG_WIDTH 	= $clog2(AIB_LANES);
    localparam  PWIDTH 		= 5; //FIFO Address width 
    localparam  FIFO_LO_THRSH_VAL = 5'h14; //dec 15

    logic                               reset_str;
 
    logic   [AIB_LANES-1:0]             if_inframe;
    logic   [AIB_LANES-1:0]             if_error;
    logic   [AIB_LANES-1:0][2:0]        if_empty;
    logic   [AIB_LANES-1:0]             if_skip_crc;
    logic   [AIB_LANES-1:0][DWIDTH-1:0] if_data;
    logic   [AIB_LANES-1:0][PWIDTH-1:0] if_write_pointers; 
    logic   [AIB_LANES-1:0][PWIDTH:0] fifo_stat_wr; 
    logic   [AIB_LANES-1:0][PWIDTH:0] fifo_stat_rd; 
 
    logic   [AIB_LANES-1:0][BWIDTH-1:0]   			write_data;
    logic   [AIB_LANES-1:0][BWIDTH-1:0]   			read_data;
    (* dont_merge *) logic   [AIB_LANES-1:0][BWIDTH-1:0]   	read_data_reg;
    logic   [AIB_LANES-1:0]               			o_inframe_int;
    logic   [AIB_LANES-1:0]               			o_inframe_tmp;
    logic   [AIB_LANES-1:0]               			o_inframe_tmp1;
    logic   [AIB_LANES-1:0]              			 o_inframe_tmp2;
    logic   [AIB_LANES-1:0]               			o_eop;
    logic   [AIB_LANES-1:0]               			o_sop;
	 
    logic   [AIB_LANES-1:0][DWIDTH-1:0]   			o_data_tmp;
    logic   [AIB_LANES-1:0]               			o_error_tmp;
    logic   [AIB_LANES-1:0][2:0]          			o_empty_tmp;
    logic   [AIB_LANES-1:0]               			o_skip_crc_tmp;
    logic           						if_valid;
    logic     							op_valid;
    logic     							ready_pedge, ready_d1;
    logic   [AIB_LANES-1:0]   					read_mem;
    logic   [AIB_LANES-1:0]    					read_mem_t;
    logic   [AIB_LANES-1:0]    					read_back;
    logic   [AIB_LANES-1:0] [PWIDTH-1:0]   			read_pointers;
    logic 							read_data_valid;
   (* dont_merge *)  logic  [AIB_LANES-1:0] 			rd_stop;
  	 
	 /////Quanta counter
    logic [19:0] 						quanta_count;
    logic 							quanta_in_prog;
	 logic quanta_in_prog1;
    logic 							quanta_detected;
    logic 							o_valid_s;
    logic 							quanta_done;
    logic [AIB_LANES-1:0] 					rd_pause;
    logic [AIB_LANES-1:0] 					rd_flag;
    logic 							tx_flow_control_sync;
    logic 							enable_sfc_sync;

 	logic [19:0] 						quanta_value;
	logic [19:0] 						quanta_r;
	logic 							qvalid_r;
	logic 							quanta_clear;
	(* dont_merge *) logic 					quanta_done_r,quanta_done_r1,quanta_done_r2;
	logic 							no_inframe;
	logic 							XON_rcvd;
logic XOFF_rcvd ;
(* dont_merge *) logic XOFF, XOFF_rcvd_reg ;
(* dont_merge *) logic XOFF_rcvd_reg1; 
(* dont_merge *) logic XOFF_rcvd_reg2;
(* dont_merge *) logic XOFF_rcvd_reg3; 
(* dont_merge *) logic XOFF_rcvd_reg4; 
(* dont_merge *) logic XOFF_rcvd_reg5; 
(* dont_merge *) logic XOFF_rcvd_reg6;

(* dont_merge *)  logic  [AIB_LANES-1:0] 	wr_stop;
(* dont_merge *)  logic  [AIB_LANES-1:0] 	wr_full;
(* dont_merge *)  logic  [AIB_LANES-1:0] 	rd_empty;
logic [3:0] post_quanta_counter;
logic post_quanta_counter_en;

	logic 							i_ready_r3;

assign quanta_value =(EHIP_RATE == 0)  ?  (i_quanta << 3)  : (EHIP_RATE == 1)  ?  (i_quanta << 3) : (EHIP_RATE == 2)  ?  (i_quanta << 2) : (EHIP_RATE == 3)  ?  (i_quanta << 2) : (EHIP_RATE == 4) ?  (i_quanta << 1) :  {3'b000,i_quanta}  ;


eth_f_xcvr_resync_std #(
           .SYNC_CHAIN_LENGTH(3),    .WIDTH(1),  .INIT_VALUE(0) 
       ) sync_tx_flow_control (
           .clk    (i_clk),
           .reset  (1'b0),
           .d  (tx_flow_control),
           .q  (tx_flow_control_sync)
       );
		 
eth_f_xcvr_resync_std #(
           .SYNC_CHAIN_LENGTH(3),    .WIDTH(1),  .INIT_VALUE(0) 
       ) sync_enable_sfc (
           .clk    (i_clk),
           .reset  (1'b0),
           .d  (enable_sfc),
           .q  (enable_sfc_sync)
       );

////registering input quanta
 always_ff @(posedge i_clk) begin
	 if (reset_str ) begin
              qvalid_r    <= 'b0;
              quanta_r    <= 'b0;
	 end else begin
		  qvalid_r   <= i_qvalid;
                  quanta_r <= quanta_value;
	 end 
end	 
	
 ////Quanta counter
 always_ff @(posedge i_clk) begin
	 if (reset_str ) begin
		  quanta_count    <= {20{1'b1}};
	 end else if(qvalid_r) begin
		  quanta_count   <= quanta_r;
	 end else if (quanta_done) begin
		  quanta_count    <= 'b1;
	 end else if(quanta_in_prog1== 1'b1 && i_ready==1'b1) begin
	 	  quanta_count   <= quanta_count -1'b1;
	 end
end

////rx pause
 always_ff @(posedge i_clk) begin
	 if (reset_str || quanta_done || ~enable_sfc_sync ) begin
		  o_rx_pause    <= 1'b0;
	 end else if (XOFF == 1'b1) begin
		  o_rx_pause   <= 1'b1;
	 end
end

////quanta in progress, asserted when the packet in flight is completed and EOP is detected.
 always_ff @(posedge i_clk) begin
	 if (reset_str || quanta_done ==1'b1 ) begin
		  quanta_in_prog1    <= 1'b0;
	 end else if(&rd_stop == 1'b1 ) begin
		  quanta_in_prog1   <= 1'b1;
	 end 
end 

////Quanta detected. asserted when a non zero quanta value is got and cleared when rx pause starts.
 always_ff @(posedge i_clk) begin
	 if (reset_str  || quanta_in_prog ) begin
		  quanta_detected    <= 1'b0;
	 end else if(XOFF_rcvd_reg6 == 1'b1) begin
		  quanta_detected   <= 1'b1;
	 end
end 

//////quanta done - cleared when non zero quanta value is got
 always_ff @(posedge i_clk) begin
	 if (reset_str ||if_valid ||wr_stop[0]|| ~tx_flow_control_sync || ~enable_sfc_sync) begin
		  post_quanta_counter_en    <= 1'b0;
	 end else if(quanta_in_prog1 == 1'b1 && quanta_done == 1'b1)begin
		  post_quanta_counter_en   <= 1'b1;
	 end 
end

assign quanta_in_prog = quanta_in_prog1 || post_quanta_counter_en;

//////quanta done - cleared when non zero quanta value is got
 always_ff @(posedge i_clk) begin
	 if ( reset_str ) begin
		  quanta_done    <= 1'b0;
	 end else if(XON_rcvd== 1'b1 || quanta_count == 0)begin
		  quanta_done   <= 1'b1;
         end else begin
                  quanta_done   <= 1'b0;
	 end 
        // quanta_done_r <= quanta_done;
 	 quanta_done_r <= quanta_in_prog;
end 

//////
 always_ff @(posedge i_clk) begin
	 if ( reset_str || rd_flag[0] && read_mem[0]&& read_mem_t[0] ) begin
		  quanta_done_r1    <= 1'b0;
	 end else if(quanta_done == 1'b1 && quanta_in_prog == 1'b1 )begin
		  quanta_done_r1   <= 1'b1;
	 end 
end 

//////
 always_ff @(posedge i_clk) begin
	 if ( reset_str  ) begin
                  quanta_done_r2   <= 1'b0; 
	 end else begin
		  quanta_done_r2   <= quanta_done_r1;
	 end 
end 

assign XON_rcvd = (quanta_value==0)?i_qvalid : 1'b0; 
assign XOFF_rcvd = (quanta_value!=0 && quanta_count >=2 )?i_qvalid : 1'b0; 

 always_ff @(posedge i_clk) begin
	 if (reset_str ) begin
           XOFF_rcvd_reg    <= 1'b0;
	   XOFF_rcvd_reg1   <= 1'b0; 
	   XOFF_rcvd_reg2   <= 1'b0;
 	   XOFF_rcvd_reg3   <= 1'b0; 
	   XOFF_rcvd_reg4   <= 1'b0; 
	   XOFF_rcvd_reg5   <= 1'b0; 
	   XOFF_rcvd_reg6   <= 1'b0;
           XOFF 	     <= 1'b0;
	end  else begin 
           XOFF_rcvd_reg   <= XOFF_rcvd;
           XOFF_rcvd_reg1   <= XOFF_rcvd_reg; 
	   XOFF_rcvd_reg2   <= XOFF_rcvd_reg1;
 	   XOFF_rcvd_reg3   <= XOFF_rcvd_reg2; 
	   XOFF_rcvd_reg4   <= XOFF_rcvd_reg3; 
	   XOFF_rcvd_reg5   <= XOFF_rcvd_reg4; 
	   XOFF_rcvd_reg6   <= XOFF_rcvd_reg5;
	   XOFF		    <= XOFF_rcvd_reg || XOFF_rcvd_reg1 || XOFF_rcvd_reg2 || XOFF_rcvd_reg3 || XOFF_rcvd_reg4 || XOFF_rcvd_reg5 || XOFF_rcvd_reg6; 

        end
end

///quanta clear
assign quanta_clear = (~quanta_in_prog) && quanta_done_r;
 
    eth_f_reset_str_16 rss (
        .i_reset    (i_reset),
        .i_clk      (i_clk),
        .o_reset    (reset_str)
    );
 
    //Registering the inputs
    always_ff @(posedge i_clk) 
    begin
        if (reset_str) begin
            if_data         <= 'b0;
            if_inframe      <= 'b0;
            if_empty        <= 'b0;
            if_error        <= 'b0;
            if_skip_crc     <= 'b0;
            if_valid        <= 'b0;
            op_valid        <= 'b0;
        end else begin
          for(int j=0;j<AIB_LANES;j=j+1)
          begin
            if_data[j]      <= i_data[j];
            if_inframe[j]   <= i_inframe[j];
            if_empty[j]     <= i_empty[j];
            if_error[j]     <= i_error[j];
            if_skip_crc[j]  <= i_skip_crc[j];
          end   
          if_valid        <= i_valid;
          op_valid        <= if_valid;
        end
    end

eth_f_delay_reg #(
        .CYCLES (4),
        .WIDTH  (1)
    ) i_ready3_delay (
        .clk    (i_clk),
        .din    (i_ready),
        .dout   (i_ready_r3)
    );	

 
    //Write side Logic - Write Pointer generation
    
 
    //Memory - NUM_SEGx segment Memory
    
    generate
        for (i = 0; i < AIB_LANES; i++) begin : mem_loop
            assign write_data[i] = {if_inframe[i], if_error[i], if_skip_crc[i], if_empty[i], if_data[i]};
 
            eth_f_mlab #(
                .WIDTH      (BWIDTH),
                .ADDR_WIDTH (5),
                .SIM_EMULATE(SIM_EMULATE)
            ) mem_0 (
                .wclk       (i_clk),
                .wdata_reg  (write_data[i]),
                .wena       (if_valid),
                .waddr_reg  (if_write_pointers[i][4:0]),
                .raddr      (read_pointers[i][4:0]),
                .rdata      (read_data[i])
            );

           eth_f_wptr_gen_pause #(.PWIDTH(PWIDTH)) wptr_gen_inst (
        .i_reset            (reset_str),
        .i_clk              (i_clk),
        .i_num_write        (if_valid),
        .o_write_pointers   (if_write_pointers[i][4:0]) //1 cycle delay
       
    );
	 
	  eth_f_rptr_gen_pause #(.PWIDTH(PWIDTH)) rptr_gen_inst (
	  .i_reset            (reset_str),
	  .i_clk              (i_clk),
	  .i_read             (rd_flag[i] && read_mem[i]&& read_mem_t[i]),
	  //.i_re_read          (rd_pause[i]&quanta_clear),
          .i_re_read          (read_back[i]),
	  .o_read_pointers    (read_pointers[i][4:0])
     );

always_ff @(posedge i_clk) begin
if (reset_str) begin
 rd_flag[i]    <= 1'b0;
end else if (read_mem[i]==1'b1 && if_write_pointers[i][4:0]>=5'b01110) begin
rd_flag[i] <= 1'b1;
end
end

always_ff @(posedge i_clk) begin
if (reset_str) begin
 read_data_reg[i]    <= 'b0;
end else  begin
read_data_reg[i] <= read_data[i];
end
end

eth_f_delay_reg #(
        .CYCLES (3),
        .WIDTH  (1)
    ) i_ready2_delay (
        .clk    (i_clk),
        .din    (i_ready),
        .dout   (read_mem[i])
    );	 
 
assign read_mem_t[i] = enable_sfc_sync ? ((~tx_flow_control_sync)? 1'b1 : (~(quanta_in_prog || rd_stop[i]) )) : 1'b1; 

 end
 
        for (i = 0; i < AIB_LANES; i++) begin : o_data_loop
            assign {o_inframe_int[i], o_error_tmp[i], o_skip_crc_tmp[i], o_empty_tmp[i], o_data_tmp[i]} = read_data_reg[i];
				assign rd_stop[i] = enable_sfc_sync ? (tx_flow_control_sync? ((|o_eop==1'b1 || ~no_inframe) && quanta_detected && ~quanta_in_prog) :qvalid_r) : 1'b0;

        end
		  
		  
		  for (i = 0; i < AIB_LANES; i++) begin : o_inframe_mux
           // assign o_inframe_tmp[i] = (~tx_flow_control_sync)? o_inframe_int[i]:(rd_stop[i]) ? o_inframe_tmp1[i]  : 
	   //				(quanta_in_prog||quanta_done_r1) ? 'b0  : 
           //				      ((( quanta_done_r2) && rd_flag[i] && read_mem[i]&& read_mem_t[i])?  o_inframe_tmp2[i] : 
           //				 o_inframe_int[i]);

            assign o_inframe_tmp[i] = enable_sfc_sync ? ((EHIP_RATE == 0 || EHIP_RATE == 1) ? ((~tx_flow_control_sync)? o_inframe_int[i]:(rd_stop[i]) ? o_inframe_tmp1[i]  : 
					(quanta_in_prog||quanta_done_r1) ? 'b0  : o_inframe_int[i]) :
				    (~tx_flow_control_sync)? o_inframe_int[i]:(rd_stop[i]) ? o_inframe_tmp1[i]  : 
					(quanta_in_prog||quanta_done_r1) ? 'b0  : 
				      (( quanta_done_r2 && rd_flag[i] && o_valid_s && read_mem_t[i])? ((|o_eop==1'b1 && o_sop[0] ==1'b1)? 'b0 : o_inframe_tmp2[i])  : 
				 o_inframe_int[i])) : o_inframe_int[i];

            assign read_back[i] = enable_sfc_sync ? ((EHIP_RATE == 0 || EHIP_RATE == 1) ? 1'b0 : 
		                  (tx_flow_control_sync ? (((|o_eop==1'b0 && ~no_inframe && quanta_detected && o_valid_s) || (|rd_pause && quanta_in_prog && ~quanta_done_r))? 1'b1:1'b0):1'b0)):1'b0;
                  end
		  
for (i = 0; i < AIB_LANES; i++) begin : wr_threshold

always_ff @(posedge i_clk) begin
if (reset_str) begin
 wr_full[i] <= 'b0;
end else if (if_write_pointers[i][4:0] > FIFO_LO_THRSH_VAL)  begin
wr_full[i]  <= 1'b1;
end else begin
wr_full[i]  <= 1'b0;
end
end


always_ff @(posedge i_clk) begin
if (reset_str) begin
 rd_empty[i] <= 1'b0;
end else if (fifo_stat_wr[i][4:0] < 5'h9 )  begin
rd_empty[i]  <= 1'b1;
end else begin
rd_empty[i]  <= 1'b0;
end
end

always_ff @(posedge i_clk) begin
if (reset_str) begin
wr_stop[i] <= 1'b0;
end else if (fifo_stat_wr[i][4:0] > FIFO_LO_THRSH_VAL+2) begin
wr_stop[i]  <=  1'b1;
end else begin
wr_stop[i]  <=  1'b0;
end
end

assign fifo_stat_wr[i] = if_write_pointers[i][4:0] - read_pointers[i][4:0];
assign fifo_stat_rd[i] = read_pointers[i][4:0] - if_write_pointers[i][4:0];
	 
end		  
		  
		  
	 
    endgenerate

		  eth_f_eop_inframe_mapper #(
                .NUM_SEG      (AIB_LANES)
            ) eopmap_0 (
                .i_reset      	(reset_str),
                .i_clk  	(i_clk),
		.i_valid         (o_valid_s),
                .inframe_i       (o_inframe_int),
                .inframe_o_f  	(o_inframe_tmp1),
                .inframe_o_s  	(o_inframe_tmp2),
		 .sop_o           (o_sop),
		 .eop_o           (o_eop),
                .read_lastaddr	(rd_pause)
            );	 

 

           
 always_ff @(posedge i_clk) begin
        read_data_valid     <= |read_mem & |(~quanta_in_prog);
    end
 
        assign no_inframe = (o_valid_s)? |o_inframe_int : 1'b1;
 
    always_ff @(posedge i_clk) begin
        if (reset_str)
            o_ready_sip <= 1'b0;
        else
            o_ready_sip <= enable_sfc_sync ? ~(tx_flow_control_sync)? i_ready : (i_ready && (~(quanta_in_prog1 || wr_stop[0]))) : i_ready;

    end
	 
	 assign o_valid_s =   i_ready_r3 ;
		 
 always_ff @(posedge i_clk) begin
        o_data       <= o_data_tmp ;
        o_inframe    <= o_inframe_tmp ;
        o_empty      <= o_empty_tmp ;
        o_skip_crc   <= o_skip_crc_tmp ;
        o_error      <= o_error_tmp ;
        o_valid      <= o_valid_s; 
end
 
endmodule
 
module eth_f_reset_str_16 (
    input   logic   i_reset,
    input   logic   i_clk,
    output  logic   o_reset
);
    logic   [3:0]   timer;
 
    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            timer   <= 4'hF;
            o_reset <= 1'b1;
        end else begin
            if (timer == 4'd0) begin
                timer   <= timer;
                o_reset <= 1'b0;
            end else begin
                timer   <= timer - 1'd1;
                o_reset <= 1'b1;
            end
        end
    end
endmodule
 
module eth_f_rptr_gen_pause #(parameter PWIDTH=5) (
    input   logic               i_reset,
    input   logic               i_clk,
    input   logic               i_read,
	 input   logic          i_re_read,
    output  logic [PWIDTH-1:0]  o_read_pointers
);
    logic   [PWIDTH-1:0]  phase;
 
    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            phase    <= {PWIDTH{1'b0}};
	end else if (i_re_read) begin
                phase    <= phase - PWIDTH'(1);
        end else if (i_read) begin
                phase    <= phase + PWIDTH'(1);
        end
    end
 
    assign o_read_pointers = phase[PWIDTH-1:0];
endmodule
 
 
module eth_f_wptr_gen_pause #(parameter PWIDTH=6) (
    input   logic                       i_reset,
    input   logic                       i_clk,
    input   logic 		         i_num_write,
    output  logic [PWIDTH-1:0]           o_write_pointers
);
 
logic   [PWIDTH-1:0]  phase;
 
    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            phase    <= {PWIDTH{1'b0}};
        end else begin
            if (i_num_write) begin
                phase    <= phase + PWIDTH'(1);
            end
       
        end
    end
 
    assign o_write_pointers = phase[PWIDTH-1:0];
 
    endmodule

module eth_f_eop_inframe_mapper #(parameter NUM_SEG=8) (
    input   logic                     i_reset,
    input   logic                     i_clk,
    input     logic                   i_valid,
    input   logic [NUM_SEG-1:0]       inframe_i,
    output  logic [NUM_SEG-1:0]       inframe_o_f,
	output  logic [NUM_SEG-1:0]       inframe_o_s,
	output  logic   [NUM_SEG-1:0]     eop_o,
	output  logic   [NUM_SEG-1:0]     sop_o,
	output   logic   [NUM_SEG-1:0]    read_lastaddr
);
 
 //localparam NUM = (NUM_SEG==8)?4:(NUM_SEG==4)?2:(NUM_SEG==2)?1:0;

	 logic eop_valid, eop_valid_r,eop_valid_s;
	 integer j;
	 logic   [NUM_SEG-1:0]     o_eop, eop_r;	 
	 logic [NUM_SEG-1:0] lastaddr;
	 logic [NUM_SEG-1:0] inframe_i_r;
		 
eth_f_sop_eop_detection # (
    .INFRAME (NUM_SEG)
) sop_detect (

   .rx_mac_inframe  (inframe_i),
   .clk_i           (i_clk),
   .srst_n_i        (~i_reset),
   .rx_mac_valid    (i_valid),
   .SOP_detected    (sop_o),
   .EOP_detected    (o_eop)
 ); 

assign eop_o = o_eop;

always_ff @(posedge i_clk) begin 
if (i_reset) eop_r <= 'b0;
else if (eop_valid) eop_r <= o_eop;
end
	 
always_ff @(posedge i_clk) begin 
if (i_reset) eop_valid_r <= 'b0;
else eop_valid_r <= eop_valid;
end
	
assign eop_valid_s = |o_eop;
assign eop_valid = (|o_eop)? i_valid : 1'b0 ;

always_ff @(posedge i_clk) begin 
if (i_reset) inframe_i_r <= 'b0;
else inframe_i_r <= inframe_i;
end


generate 
	if(NUM_SEG==1) begin
      always @(*) begin
	  if(eop_valid) begin
        inframe_o_f   = inframe_i; 
         end else begin
        inframe_o_f   = 1'b0; 
      end
      end
	    assign inframe_o_s = 1'd0  ;    

end else if(NUM_SEG==2) begin
      always @(*) begin
		if (eop_valid)begin	  
            case (o_eop)
                2'b01   :  begin  inframe_o_f = 2'b00;  end
                2'b10   :  begin  inframe_o_f = {1'b0, inframe_i[0]};  end
		default :  begin  inframe_o_f = 2'b00; end
            endcase
        end else begin
          inframe_o_f = 2'b00;
        end
	end
 always_ff @(posedge i_clk) begin
        if (i_reset) inframe_o_s <= 2'b00  ;
		else begin 
        if (eop_valid_r	)begin	
            case (eop_r)
                2'b01  : begin 	if (inframe_i_r[1]==1'b1) inframe_o_s <= {inframe_i_r[1] ,1'b0}; else inframe_o_s <= inframe_i; end
                2'b10  : begin inframe_o_s <= inframe_i  ;  end
		default: begin inframe_o_s <= 2'b00  ;  end
            endcase
	end
        end
	end

end else if(NUM_SEG==4) begin
 always @(*) begin
        if (eop_valid) begin
            case (o_eop)
		4'b0001 : begin inframe_o_f   = 4'd0; end
                4'b0010 : begin inframe_o_f   = {3'b000, inframe_i[0]};  end	
                4'b0100 : begin inframe_o_f   = {2'b00, inframe_i[1:0]}; end
                4'b1000 : begin inframe_o_f   = {1'b0, inframe_i[2:0]}; end
		default : begin inframe_o_f   = 4'd0; end
            endcase
        end else begin
            inframe_o_f = 'b0;
          end
end
 always_ff @(posedge i_clk) begin
        if (i_reset) inframe_o_s <= 4'b0000  ;
	else begin 
	if (eop_valid_r) begin
            case (eop_r)
	        4'b0001  : begin if (inframe_i_r[3:1]=='b0) inframe_o_s <= inframe_i ; 	else inframe_o_s <= {inframe_i_r[3:1], 1'b0} ; 	end
                4'b0010  : begin if (inframe_i_r[3:2]=='b0) inframe_o_s <= inframe_i ; else inframe_o_s <= {inframe_i_r[3:2], 2'b00};   end	
                4'b0100  : begin if (inframe_i_r[3]=='b0) inframe_o_s <= inframe_i ; else inframe_o_s <= {inframe_i_r[3], 3'b000}; end
                4'b1000  : begin inframe_o_s <= inframe_i; end
		default  : begin inframe_o_s <= 4'd0  ; end
            endcase
	  end
          end
end
    end else if(NUM_SEG==8) begin
		  always @(*) begin
		  if (eop_valid) begin
            case (o_eop)
		8'b00000001 : begin inframe_o_f = 8'd0;  end
                8'b00000010 : begin inframe_o_f = {7'b0000000, inframe_i[0]}; end
                8'b00000100 : begin inframe_o_f ={6'b000000, inframe_i[1:0]}; end
                8'b00001000 : begin inframe_o_f = {5'b00000, inframe_i[2:0]}; end
  		8'b00010000 : begin inframe_o_f = {4'b0000, inframe_i[3:0]}; end
 		8'b00100000 : begin inframe_o_f = {3'b000, inframe_i[4:0]}; end
 		8'b01000000 : begin inframe_o_f = {2'b00, inframe_i[5:0]}; end
 		8'b10000000 : begin inframe_o_f = {1'b0, inframe_i[6:0]};  end
 		default     : begin inframe_o_f = 8'd0; end
            endcase
        end else begin
          inframe_o_f = 'b0;
        end
    end 
    always_ff @(posedge i_clk) begin
    if (i_reset) inframe_o_s <= 8'd0  ;
    else begin 
    if (eop_valid_r) begin
      case (eop_r)
      8'b00000001 : begin if (inframe_i_r[7:1]=='b0) inframe_o_s <= inframe_i ; else inframe_o_s <= {inframe_i_r[7:1], 1'b0} ;  end
      8'b00000010 : begin if (inframe_i_r[7:2]=='b0) inframe_o_s <= inframe_i ; else inframe_o_s <= {inframe_i_r[7:2], 2'b00} ; end
      8'b00000100 : begin if (inframe_i_r[7:3]=='b0) inframe_o_s <= inframe_i ; else inframe_o_s <= {inframe_i_r[7:3], 3'b000} ;  end
      8'b00001000 : begin if (inframe_i_r[7:4]=='b0) inframe_o_s <= inframe_i ; else inframe_o_s <= {inframe_i_r[7:4], 4'b0000} ; end
      8'b00010000 : begin if (inframe_i_r[7:5]=='b0) inframe_o_s <= inframe_i ; else inframe_o_s <= {inframe_i_r[7:5], 5'b00000} ; end
      8'b00100000 : begin if (inframe_i_r[7:6]=='b0) inframe_o_s <= inframe_i ; else inframe_o_s <= {inframe_i_r[7:6], 6'b000000} ; end
      8'b01000000 : begin if (inframe_i_r[7]=='b0) inframe_o_s <= inframe_i ; else inframe_o_s <= {inframe_i_r[7], 7'b0000000} ; end
      8'b10000000 : begin inframe_o_s <= inframe_i; end
      default     : begin inframe_o_s <= inframe_i; end ///N=8 can have two EOPs in 1 cycle
      endcase
     end
    end
    end 
	end 
    endgenerate

	 generate 
	 if(NUM_SEG==1) begin
	     assign lastaddr = 1'b0; 
	 end else if(NUM_SEG==2) begin
        always_ff @(posedge i_clk) begin
		  if (i_reset) begin
			lastaddr <= 2'b00;
	     end else if (eop_valid)begin	
		if (o_eop ==  2'b01 &&inframe_i[1] == 1'b1 )  lastaddr <= 2'b11;
		else lastaddr <= 2'b00;
             end
	end
		  
     end else if(NUM_SEG==4) begin
        always_ff @(posedge i_clk) begin
	if (i_reset) begin
	lastaddr <= 4'b0000;
	end else if (eop_valid) begin
	if ((o_eop >= 4'd8)  && (o_eop <= 4'd15))    lastaddr <= 4'b0000; 
	else if (((o_eop >= 4'd4)  && (o_eop <= 4'd7)) && (inframe_i[3] == 1'b0))   lastaddr <= 4'b0000; 
	else if (((o_eop == 4'd2)  || (o_eop == 4'd3 ))  &&  (inframe_i[3:2] == 2'b00))  lastaddr <= 4'b0000;
	else if (( o_eop ==  4'd1) && (inframe_i[3:1] == 3'b000) ) lastaddr <= 4'b0000;
	else lastaddr <= 4'b1111; 
	end
        end

    end else if(NUM_SEG==8) begin
	 always_ff @(posedge i_clk) begin
	 if (i_reset) lastaddr <= 8'b00000000;
	 else if (eop_valid) begin
	if ((o_eop >= 8'd128) && (o_eop <= 8'd255)) 
		lastaddr <= 8'b00000000;  
	else if (((o_eop >= 8'd64)  && (o_eop <= 8'd127)) && (inframe_i[7] == 1'b0))
		lastaddr <= 8'b00000000; 
	else if (((o_eop >= 8'd32)  && (o_eop <= 8'd63)) && (inframe_i[7:6] == 2'b00))
		lastaddr <= 8'b00000000; 
	else if (((o_eop >= 8'd16)  && (o_eop <= 8'd31)) && (inframe_i[7:5] == 3'b000))
		lastaddr <= 8'b00000000; 
	else if (((o_eop >= 8'd8)  && (o_eop <= 8'd15)) && (inframe_i[7:4] == 4'b0000))   
		lastaddr <= 8'b00000000; 
	else if (((o_eop >= 8'd4)  && (o_eop <= 8'd7)) && (inframe_i[7:3] == 5'b00000))   
                lastaddr <= 8'b00000000; 
	else if (((o_eop == 8'd2)  || (o_eop == 8'd3 ))  &&  (inframe_i[7:2] == 6'b000000))  
                lastaddr <= 8'b00000000;
	else if (( o_eop ==  8'b00000001) && (inframe_i[7:1] == 7'b0000000) )
                lastaddr <= 8'b00000000;
        else lastaddr <= 8'b1111111;
        end
    end 
	end 
    endgenerate	 
	 
assign read_lastaddr = lastaddr;
	 
	 
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onqPUwaj7JWZ3mC6XDEZGo+q7G85+kl6IjJDX/EDUu2D9vdpba9PX/37WNHuOCOHpUuCzPBmL7HlDdg8C5QfSIS0RH0Noq/lDXmArmN2KlTQE1LGSdsWIBexkqqs/ssuE139xRv5TMimTDiXaixrQb98yp1Ybnlcy/iQIWiR8Km/odaCgh7+DmOi7HEEbADvt/PLac10oh2+F/vEI1zKQG/ufUGUdRs4l0ZmxZMoMCu8URmWKeKgijs8qqp19ubw/uIuMyUAoEZJQ2S237mPW+CdlyN6LqY2/QPoU5yiLnyFfdUz73igQvuKVvTWVGNKWmomq6vIrpzyvjz8kh8x4oKJuHwwaAaPlaM7Gk+sPT1NP3AHNqlpYJqKNRxpF2i+xEX6bYs3SFOIpCT6nZtht9JhsetsaQszAph7OB0uZC929sq7ojsPUCyunEZf5TLWmMOwPoES/oc5zNAneWWmznFVJgwENHHymXzsKR720wRC2pQBtsP2zX7ZUBCPKuLgHs7IlWg6vxfeQicm1hj0m5l1+n7nedSGnNE6vJAKo5iH3T7jg7edNNRed5VlzGhzy52xNVw2X1Gf4bXm9oZwSRJ0OzyWV/QQMKCcvdpY0F5LHryqaFg8BKBhaxtd9k17LR3oui76i4xQm/M8dLZYwkOcemHYVuctf23YumfxH1i+G5tBefiay35xffWFyhpz14cINKB1JUnM02fn8zLoCIX65MCUXaCKXnEWAUXyCYN2807cXVYcMSiX6amzNXvFp4hD1S32/UkGtfLCMsDVYsWV"
`endif