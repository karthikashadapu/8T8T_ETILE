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

//Description:  Uplink Arbitration
//              This Uplink Arbiter is generic block which can support arbitration for up to 30 ports. 
//              The arbitration scheme is fixed for now as Strict priority based with Round Robin for ports 
//              of same priority
//
//Interface description:
//              1. AVST sink interface (input interfaces to arbiter)
//                      + Configurable number of interfaces can be supported
//                      by concatenating
//                      + ready latency = 0
//              2. AVST source interface
//                      + Supports backpressure.
//                      + ready latency = 0
//              3. AVMM CSR interface
//                      + write/read latency = 1
//                      + doesn't support pending write/read tansactions

//Metadata format:
//              This block is agnostic to metadata format
//

//Note:
//              The block provides back to back outputs provided the block_available input pulse is available 
//              before eop of the current ongoing packet.
//              This code evaluates next priority on a contiuous basis but the evaluation of next port takes a 
//              worst case of (N-1) cycles, where N is no of ports. So if a block_available pulse arrives on 
//              the EOP of current cycle, it may take N-1 clock cycles to provide next grant (sink_ready).

//Timing Analysis:
//              This code was synthesized successfully with fmax of 503.52MHz for max number of ports (30) on 
//              a -3 Agilex device

`timescale 1 ns / 1 ps

module uplink_arbiter
#(
   parameter NUM_INTERFACES = 30,   //NUM PORTS (Min: 2 and Max: 30)
   parameter DATAWIDTH = 128,       //Streaming Input datawidth parameter.
   parameter METADATAWIDTH = 128,
   parameter CSR_DATAWIDTH = 32,
   parameter CSR_ADDRWIDTH = 3
)
(
   //Clocks and reset
   input  wire                                           arb_clk,         //expected 390.625 MHz based on typical usecase
   input  wire                                           arb_rst_n,
   input  wire                                           csr_clk,         //expected 100 MHz based on typical use case
   input  wire                                           csr_rst_n,

   //AVST sink
   input  wire [NUM_INTERFACES-1:0]                      avst_sink_valid,
   input  wire [NUM_INTERFACES*DATAWIDTH-1:0]            avst_sink_data,
   input  wire [NUM_INTERFACES-1:0]                      avst_sink_sop,
   input  wire [NUM_INTERFACES-1:0]                      avst_sink_eop,
   input  wire [NUM_INTERFACES*$clog2(DATAWIDTH>>3)-1:0] avst_sink_empty, 
   output wire [NUM_INTERFACES-1:0]                      avst_sink_ready,

   //Metadata sink
   input  wire [NUM_INTERFACES*METADATAWIDTH-1:0]        metadata_in,

   //CSR interface
   //input  wire [CSR_ADDRWIDTH-1:0]                       csr_address,
   //input  wire                                           csr_write,
   //input  wire                                           csr_read,
   //input  wire [CSR_DATAWIDTH-1:0]                       csr_writedata,
   //output wire [CSR_DATAWIDTH-1:0]                       csr_readdata,
	
	input wire								arbiter_ctrl,									
	output wire								arbiter_rdy,                                        
	input wire	[CSR_DATAWIDTH-1:0]			arbiter_prio1,                               
	input wire	[CSR_DATAWIDTH-1:0]			arbiter_prio2,
	input wire	[CSR_DATAWIDTH-1:0]			arbiter_prio3,	
	
   //Block available
   input  wire [NUM_INTERFACES-1:0]                      block_available,

   //AVST source
   output wire                                           avst_src_valid,
   output wire [DATAWIDTH-1:0]                           avst_src_data,
   output wire                                           avst_src_sop,
   output wire                                           avst_src_eop,
   output wire [$clog2(DATAWIDTH>>3)-1:0]                avst_src_empty, 
   input  wire                                           avst_src_ready,

   //Metadata source
   output wire [METADATAWIDTH-1:0]                       metadata_out 
);

// ---------  Variable Declaration  --------- //
   localparam                                        NUM_PRIORITY_LEVELS = 4;
   localparam                                        MAX_INTERFACE = 30;
   localparam                                        MAX_NUM_PRIORITY_LEVELS = 8;
   localparam                                        INTERFACE_DWIDTH = $clog2(NUM_INTERFACES);
   localparam                                        EMPTY_DWITH = $clog2(DATAWIDTH>>3);
   localparam                                        MAX_OUTSTANDING_REQUESTS_PER_PORT = 32;  //per interface
   localparam                                        MAX_OUTSTANDING_REQUESTS_PER_PRIOITY = MAX_OUTSTANDING_REQUESTS_PER_PORT*NUM_INTERFACES;  //max value per priority level 
   localparam                                        REQ_CNT_PP_DWIDTH = $clog2(MAX_OUTSTANDING_REQUESTS_PER_PORT);
   localparam                                        REQ_CNT_PR_DWIDTH = $clog2(MAX_OUTSTANDING_REQUESTS_PER_PRIOITY);
   localparam                                        PRIORITY_LEVEL_DWIDTH = $clog2(NUM_PRIORITY_LEVELS);
   localparam [2:0]                                  STATE_IDLE    = 2'h0,
                                                     STATE_PROCESS = 2'h1,
                                                     STATE_DONE    = 2'h2;
   localparam                                        RDY_FIFO_DWIDTH = DATAWIDTH + METADATAWIDTH + EMPTY_DWITH + 2; 
   localparam                                        RDY_FIFO_DEPTH = 8;
   reg  [NUM_INTERFACES-1:0]                         avst_sink_valid_d1, avst_sink_valid_d2, avst_sink_sop_d1, avst_sink_sop_d2,
                                                     avst_sink_eop_d1, avst_sink_eop_d2, block_available_d, block_available_d1;
   reg  [NUM_INTERFACES*DATAWIDTH-1:0]               avst_sink_data_d1, avst_sink_data_d2;
   reg  [NUM_INTERFACES*EMPTY_DWITH-1:0]             avst_sink_empty_d1, avst_sink_empty_d2;
   reg  [NUM_INTERFACES*METADATAWIDTH-1:0]           metadata_in_d1, metadata_in_d2;
   reg                                               arbiter_rdy_d1, arbiter_rdy_d2;
   reg  [CSR_DATAWIDTH-1:0]                          arbiter_prio1_c1, arbiter_prio1_c2, arbiter_prio2_c1, arbiter_prio2_c2,
                                                     arbiter_prio3_c1, arbiter_prio3_c2;
   reg                                               arbiter_ctrl_c1, arbiter_ctrl_c2, arbiter_ctrl_c3;
   wire [MAX_INTERFACE*$clog2(MAX_NUM_PRIORITY_LEVELS)-1:0] arbiter_prio_array;
   wire                                              prio_cfgd_r; 
   reg  [REQ_CNT_PP_DWIDTH-1:0]                      request_cnt [NUM_INTERFACES-1:0];  //per interface counter
   reg  [REQ_CNT_PR_DWIDTH-1:0]                      priority_cnt [NUM_PRIORITY_LEVELS-1:0];
   reg  [REQ_CNT_PR_DWIDTH-1:0]                      priority_cnt_d [NUM_PRIORITY_LEVELS-1:0];
   reg  [INTERFACE_DWIDTH:0]                         block_priow_cnt [NUM_PRIORITY_LEVELS-1:0];
   reg                                               eop_priow_event [NUM_PRIORITY_LEVELS-1:0];
   reg  [INTERFACE_DWIDTH:0]                         block_priow_cnt_d [NUM_PRIORITY_LEVELS-1:0];
   reg                                               eop_priow_event_d [NUM_PRIORITY_LEVELS-1:0];
   reg  [INTERFACE_DWIDTH:0]                         priority_port_list [NUM_PRIORITY_LEVELS-1:0][NUM_INTERFACES-1:0]; 
   reg  [INTERFACE_DWIDTH:0]                         priority_port_list_d [NUM_PRIORITY_LEVELS-1:0][NUM_INTERFACES-1:0]; 
   reg                                               priority_port_bitm [NUM_PRIORITY_LEVELS-1:0][NUM_INTERFACES-1:0]; 
   reg                                               priority_port_bitm_d [NUM_PRIORITY_LEVELS-1:0][NUM_INTERFACES-1:0]; 
   reg  [INTERFACE_DWIDTH:0]                         entry_cnt [NUM_PRIORITY_LEVELS-1:0];
   reg  [INTERFACE_DWIDTH:0]                         entry_cnt_d [NUM_PRIORITY_LEVELS-1:0];
   reg  [INTERFACE_DWIDTH:0]                         entry_cnt_d1 [NUM_PRIORITY_LEVELS-1:0];
   reg  [INTERFACE_DWIDTH-1:0]                       current_port_idx [NUM_PRIORITY_LEVELS-1:0];
   reg                                               prio_upd, prio_upd_d;
   reg  [NUM_INTERFACES*PRIORITY_LEVEL_DWIDTH-1:0]   port_priority_array1, port_priority_array2;
   reg                                               grant_issued, grant_issued_d, grant_issued_d1, grant_issued_d2;
   reg                                               grant_issued_r_1d, grant_issued_r_2d, grant_issued_r_3d;
   reg  [NUM_INTERFACES-1:0]                         grant_issued_pp;
   reg                                               arb_in_prog;
   wire                                              grant_issued_r;
   wire                                              eop_event;
   reg  [1:0]                                        state_next,state_d;
   reg  [INTERFACE_DWIDTH:0]                         port_cnt, port_cnt_d;
   reg  [PRIORITY_LEVEL_DWIDTH-1:0]                  next_priority, next_priority_d;
   reg                                               next_prio_upd, next_prio_upd_d;
   reg  [INTERFACE_DWIDTH:0]                         next_port;
   reg  [INTERFACE_DWIDTH-1:0]                       prev_port;
   wire [NUM_INTERFACES-1:0]                         eop_event_sel;
   reg                                               priority_det, priority_det_d, port_det, port_empty, vport_det;
   wire                                              priority_det_r;
   reg  [NUM_INTERFACES-1:0]                         sink_ready;
   reg  [NUM_INTERFACES-1:0]                         src_valid, src_sop, src_eop;
   reg  [NUM_INTERFACES*DATAWIDTH-1:0]               src_data;
   reg  [NUM_INTERFACES*EMPTY_DWITH-1:0]             src_empty;
   reg  [NUM_INTERFACES*METADATAWIDTH-1:0]           metadata;
   wire [RDY_FIFO_DWIDTH-1:0]                        ff_data, ff_q;
   wire                                              ff_wrreq, ff_rdreq, ff_full, ff_empty;
   integer i,j;
// ---------   Code Starts Here --------- //
//
//
//Input pipeline
   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         block_available_d  <= {NUM_INTERFACES{1'b0}};
         block_available_d1 <= {NUM_INTERFACES{1'b0}};
      end else begin
         block_available_d  <= block_available;
         block_available_d1 <= block_available_d;
      end
   end
  
   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         avst_sink_valid_d1 <= {NUM_INTERFACES{1'b0}};
         avst_sink_data_d1  <= {NUM_INTERFACES*DATAWIDTH{1'b0}};
         avst_sink_sop_d1   <= {NUM_INTERFACES{1'b0}};
         avst_sink_eop_d1   <= {NUM_INTERFACES{1'b0}};
         avst_sink_empty_d1 <= {NUM_INTERFACES*EMPTY_DWITH{1'b0}};
         avst_sink_valid_d2 <= {NUM_INTERFACES{1'b0}};
         avst_sink_data_d2  <= {NUM_INTERFACES*DATAWIDTH{1'b0}};
         avst_sink_sop_d2   <= {NUM_INTERFACES{1'b0}};
         avst_sink_eop_d2   <= {NUM_INTERFACES{1'b0}};
         avst_sink_empty_d2 <= {NUM_INTERFACES*EMPTY_DWITH{1'b0}};
         metadata_in_d1     <= {NUM_INTERFACES*METADATAWIDTH{1'b0}};
         metadata_in_d2     <= {NUM_INTERFACES*METADATAWIDTH{1'b0}};
      end else begin
         avst_sink_valid_d1 <=  avst_sink_valid;
         avst_sink_data_d1  <=  avst_sink_data;
         avst_sink_sop_d1   <=  avst_sink_sop;
         avst_sink_eop_d1   <=  avst_sink_eop;
         avst_sink_empty_d1 <=  avst_sink_empty; 
         avst_sink_valid_d2 <=  avst_sink_valid_d1;
         avst_sink_data_d2  <=  avst_sink_data_d1; 
         avst_sink_sop_d2   <=  avst_sink_sop_d1;  
         avst_sink_eop_d2   <=  avst_sink_eop_d1;  
         avst_sink_empty_d2 <=  avst_sink_empty_d1;  
         metadata_in_d1     <=  metadata_in;
         metadata_in_d2     <=  metadata_in_d1;
      end
   end

/* //Register interface decoding 
   always @ (posedge csr_clk) begin
      if (~csr_rst_n) begin
         csr_readdata_reg   <= {CSR_DATAWIDTH{1'b0}};
         arbiter_ctrl       <= 1'b0;                   //   arbiter_ctrl       <= 1'b1;        
         arbiter_prio1      <= {CSR_DATAWIDTH{1'b0}};  // arbiter_prio1      <= ({28'd0},{2'd3},{2'd3});
         arbiter_prio2      <= {CSR_DATAWIDTH{1'b0}};
         arbiter_prio3      <= {CSR_DATAWIDTH{1'b0}};
      end else begin
         case (csr_address)
            3'd0: begin
                     if (csr_write)
                        arbiter_ctrl <= csr_writedata[0];
                     else if (csr_read)
                        csr_readdata_reg <= {{CSR_DATAWIDTH-2{1'b0}},arbiter_rdy,arbiter_ctrl};
                  end 
            3'd1: begin
                     if (csr_write)
                        arbiter_prio1  <= csr_writedata;
                     else if (csr_read)
                        csr_readdata_reg <= arbiter_prio1;
                  end 
            3'd2: begin
                     if (csr_write)
                        arbiter_prio2 <= csr_writedata;
                     else if (csr_read)
                        csr_readdata_reg <= arbiter_prio2;
                  end 
            3'd3: begin
                     if (csr_write)
                        arbiter_prio3 <= csr_writedata;
                     else if (csr_read)
                        csr_readdata_reg <= arbiter_prio3;
                  end 
            default: csr_readdata_reg <= {CSR_DATAWIDTH{1'b0}}; 
         endcase
      end
   end */

//CDC from arb clk to csr clk
   always @ (posedge csr_clk) begin
      if (~csr_rst_n) begin
         arbiter_rdy_d1 <= 1'b0;
         arbiter_rdy_d2 <= 1'b0;
      end else begin
         arbiter_rdy_d1 <= prio_upd_d;
         arbiter_rdy_d2 <= arbiter_rdy_d1;
      end
   end
   assign arbiter_rdy = arbiter_rdy_d2;

//CDC from csr to arb_clk domain
   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         arbiter_ctrl_c1  <= 1'b0;
         arbiter_ctrl_c2  <= 1'b0;
         arbiter_ctrl_c3  <= 1'b0;
         arbiter_prio1_c1 <= {CSR_DATAWIDTH{1'b0}};
         arbiter_prio1_c2 <= {CSR_DATAWIDTH{1'b0}};
         arbiter_prio2_c1 <= {CSR_DATAWIDTH{1'b0}};
         arbiter_prio2_c2 <= {CSR_DATAWIDTH{1'b0}};
         arbiter_prio3_c1 <= {CSR_DATAWIDTH{1'b0}};
         arbiter_prio3_c2 <= {CSR_DATAWIDTH{1'b0}};
      end else begin
         arbiter_ctrl_c1  <= arbiter_ctrl; 
         arbiter_ctrl_c2  <= arbiter_ctrl_c1;
         arbiter_ctrl_c3  <= arbiter_ctrl_c2;
         arbiter_prio1_c1 <= arbiter_prio1;
         arbiter_prio1_c2 <= arbiter_prio1_c1;
         arbiter_prio2_c1 <= arbiter_prio2;
         arbiter_prio2_c2 <= arbiter_prio2_c1;
         arbiter_prio3_c1 <= arbiter_prio3;
         arbiter_prio3_c2 <= arbiter_prio3_c1;
      end
   end

   assign arbiter_prio_array = (NUM_PRIORITY_LEVELS==4) ? {arbiter_prio2_c2,arbiter_prio1_c2} : 
                               {arbiter_prio3_c2[29:0],arbiter_prio2_c2[29:0],arbiter_prio1_c2[29:0]};
   assign prio_cfgd_r = arbiter_ctrl_c2 && (~arbiter_ctrl_c3);

//Port-wise Priority array
   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         port_priority_array1 <= {NUM_INTERFACES*PRIORITY_LEVEL_DWIDTH{1'b0}}; 
         port_priority_array2 <= {NUM_INTERFACES*PRIORITY_LEVEL_DWIDTH{1'b0}}; 
      end else begin
         port_priority_array1 <= arbiter_prio_array[NUM_INTERFACES*PRIORITY_LEVEL_DWIDTH-1:0];
         port_priority_array2 <= arbiter_prio_array[NUM_INTERFACES*PRIORITY_LEVEL_DWIDTH-1:0];
      end
   end

//Per-port request counter
   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         for (j=0; j<NUM_INTERFACES; j=j+1) begin
            request_cnt[j] <= {REQ_CNT_PP_DWIDTH{1'b0}};
         end
      end else begin
         for (j=0; j<NUM_INTERFACES; j=j+1) begin
            if (grant_issued_pp[j] && ~block_available_d[j])
               request_cnt[j] <= request_cnt[j] - 1'b1;
            else if (block_available_d[j] && ~grant_issued_pp[j])
               request_cnt[j] <= request_cnt[j] + 1'b1;
         end
      end
   end

//Converting per-port request & eop events to per-priority events
   always @* begin
      for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
         block_priow_cnt[i] = {INTERFACE_DWIDTH+1{1'b0}};
         eop_priow_event[i] = 1'b0;
      end
      for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
         for (j=0; j<NUM_INTERFACES; j=j+1) begin
            block_priow_cnt[i] = block_priow_cnt[i] + (priority_port_bitm_d[i][j] && block_available_d[j]);
            eop_priow_event[i] = eop_priow_event[i] || (priority_port_bitm_d[i][j] && grant_issued_pp[j]);
         end
      end
   end
 
//Priority-wise block available counter
   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1)
            priority_cnt[i]  <= {REQ_CNT_PR_DWIDTH{1'b0}};
      end else begin
         for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
            priority_cnt[i] <= priority_cnt[i] + block_priow_cnt_d[i] - eop_priow_event_d[i];
         end
      end
   end

//Formation of priority bucket data structure
   always @* begin
      state_next = STATE_IDLE;
      port_cnt = port_cnt_d;
      for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
         entry_cnt[i] = entry_cnt_d[i];
      end
      for (j=0; j<NUM_INTERFACES; j=j+1) begin
         for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
            priority_port_list[i][j] = priority_port_list_d[i][j];
            priority_port_bitm[i][j] = priority_port_bitm_d[i][j];
         end
      end
      prio_upd = prio_upd_d;
      case (state_d)
         STATE_IDLE: begin
            if (prio_cfgd_r) begin
               for (j=0; j<NUM_INTERFACES; j=j+1) begin
                  for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
                     priority_port_list[i][j] = {INTERFACE_DWIDTH+1{1'b1}};
                     priority_port_bitm[i][j] = 1'b0;
                  end
               end
               prio_upd = 1'b0;
               state_next = STATE_PROCESS;
            end else begin
               state_next = STATE_IDLE;
            end
         end
 
         STATE_PROCESS: begin
            if (port_cnt_d == NUM_INTERFACES) begin
               state_next = STATE_DONE;
            end else begin
               for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
                  priority_port_list[port_priority_array2[port_cnt_d*PRIORITY_LEVEL_DWIDTH+:PRIORITY_LEVEL_DWIDTH]][entry_cnt_d[i]] = port_cnt_d;
                  priority_port_bitm[port_priority_array2[port_cnt_d*PRIORITY_LEVEL_DWIDTH+:PRIORITY_LEVEL_DWIDTH]][entry_cnt_d[i]] = 1'b1;
                  entry_cnt[i] = entry_cnt_d[i] + 1'b1;
                  port_cnt = port_cnt_d + 1'b1;
               end      
               state_next = STATE_PROCESS; 
            end
         end

         STATE_DONE: begin
            prio_upd = 1'b1;
            state_next = STATE_IDLE;
         end

         default: begin
            state_next = STATE_IDLE;
         end
      endcase
   end

//Next priority computation
   always @* begin
      next_priority = next_priority_d;
      priority_det  = priority_det_d;
      next_prio_upd = 1'b0;
      //if (~port_det && prio_upd_d && ~priority_det_d) begin
      if (prio_upd_d) begin
         for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
            if (priority_cnt_d[i] > 0) begin
               next_priority = i;
               priority_det  = 1'b1;
            end 
         end
         if (next_priority > next_priority_d)
            next_prio_upd = 1'b1;
      end
      if (grant_issued_r_3d) begin
         priority_det  = 1'b0;
      end
   end 
   assign priority_det_r = priority_det && (~priority_det_d);

//Next port computation
   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1)
            current_port_idx[i] <= {INTERFACE_DWIDTH{1'b0}};
         next_port              <= {INTERFACE_DWIDTH+1{1'b0}};
         prev_port              <= {INTERFACE_DWIDTH{1'b0}};
         port_det               <= 1'b0;
      end else begin
         if (current_port_idx[next_priority_d] >= entry_cnt_d1[next_priority_d])
            current_port_idx[next_priority_d] <= {INTERFACE_DWIDTH{1'b0}};
         if ((priority_det_d && ~next_prio_upd) && (~port_det || (next_prio_upd_d && arb_in_prog))) begin
            next_port                         <= priority_port_list_d[next_priority_d][current_port_idx[next_priority_d]];
            current_port_idx[next_priority_d] <= current_port_idx[next_priority_d] + 1'b1;
            port_det                          <= 1'b1;
         end else if (port_empty) begin
            port_det                          <= 1'b0;
         end else if (grant_issued_r) begin
            prev_port                         <= next_port[INTERFACE_DWIDTH-1:0];
            //port_det                          <= 1'b0;
         end else if (grant_issued_r_3d) begin  //reset on same clk as priority_det
            port_det                          <= 1'b0;
         end
      end
   end

//Check if next port has pending request
   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         port_empty <= 1'b0;
         vport_det  <= 1'b0;
      end else begin
         if (port_det && (next_port>=NUM_INTERFACES)) begin
            port_empty <= 1'b1;
            vport_det  <= 1'b0;
         end else if (request_cnt[next_port]=='h0 && port_det) begin
            port_empty <= 1'b1;
            vport_det  <= 1'b0;
         end else if (port_det) begin
            port_empty <= 1'b0;
            vport_det  <= 1'b1;
         end else begin
            port_empty <= 1'b0;
            vport_det  <= 1'b0;
         end
      end
   end

//Issue ready to selected port
   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         grant_issued <= 1'b0;
         sink_ready   <= {NUM_INTERFACES{1'b0}};
      end else begin
         if (vport_det && (~arb_in_prog)) begin
            grant_issued <= 1'b1;
            sink_ready   <= (avst_src_ready << next_port);
         end else if (eop_event && vport_det) begin
            grant_issued <= 1'b0;
            sink_ready   <= (avst_src_ready << next_port);
         end else if (eop_event) begin
            grant_issued <= 1'b0;
            sink_ready   <= {NUM_INTERFACES{1'b0}};
         end else if (arb_in_prog) begin
            grant_issued <= grant_issued;
            sink_ready   <= (avst_src_ready << prev_port);
         end
      end
   end

   always @ (posedge arb_clk) begin
      if (~arb_rst_n)
         arb_in_prog  <= 1'b0;
      else if (grant_issued && (|sink_ready) && (~arb_in_prog))
         arb_in_prog  <= 1'b1;
      else if (eop_event)
         arb_in_prog  <= 1'b0;
   end

//All processes below are to create flop stages
   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         state_d    <= STATE_IDLE;
      end else begin
         state_d    <= state_next;
      end
   end

   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
            priority_cnt_d[i]  <= {REQ_CNT_PR_DWIDTH{1'b0}};
         end
      end else begin
         for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
            priority_cnt_d[i]  <= priority_cnt[i];
         end
      end
   end

   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
            block_priow_cnt_d[i] <= {INTERFACE_DWIDTH+1{1'b0}};
            eop_priow_event_d[i] <= 1'b0;
         end
      end else begin
         for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
            block_priow_cnt_d[i] <= block_priow_cnt[i];
            eop_priow_event_d[i] <= eop_priow_event[i];
         end
      end
   end

   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         for (j=0; j<NUM_INTERFACES; j=j+1) begin
            for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
               priority_port_list_d[i][j] <= {INTERFACE_DWIDTH+1{1'b1}};
               priority_port_bitm_d[i][j] <= 1'b0;
            end
         end
      end else begin
         for (j=0; j<NUM_INTERFACES; j=j+1) begin
            for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
               priority_port_list_d[i][j] <= priority_port_list[i][j];
               priority_port_bitm_d[i][j] <= priority_port_bitm[i][j];
            end
         end
      end
   end

   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         next_priority_d <= {PRIORITY_LEVEL_DWIDTH{1'b0}};
         priority_det_d  <= 1'b0; 
         next_prio_upd_d <= 1'b0;
      end else begin
         next_priority_d <= next_priority;
         priority_det_d  <= priority_det;
         next_prio_upd_d <= next_prio_upd;
      end
   end

   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         port_cnt_d <= {INTERFACE_DWIDTH{1'b0}};
         prio_upd_d <= 1'b0;
         for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
            entry_cnt_d[i] <= {INTERFACE_DWIDTH{1'b0}};
            entry_cnt_d1[i] <= {INTERFACE_DWIDTH{1'b0}};
         end
      end else if (prio_cfgd_r) begin
         port_cnt_d <= {INTERFACE_DWIDTH{1'b0}};
         prio_upd_d <= 1'b0;
         for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
            entry_cnt_d[i] <= {INTERFACE_DWIDTH{1'b0}};
            entry_cnt_d1[i] <= {INTERFACE_DWIDTH{1'b0}};
         end
      end else begin
         prio_upd_d <= prio_upd;
         if (state_d==STATE_PROCESS) begin
            port_cnt_d <= port_cnt;
            for (i=0; i<NUM_PRIORITY_LEVELS; i=i+1) begin
               entry_cnt_d[i] <= entry_cnt[i];
               entry_cnt_d1[i] <= entry_cnt_d[i];
            end
         end
      end
   end

   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         grant_issued_d  <= 1'b0;
         grant_issued_d1 <= 1'b0;
         grant_issued_d2 <= 1'b0;
         grant_issued_pp <= {NUM_INTERFACES{1'b0}};
         grant_issued_r_1d <= 1'b0;
         grant_issued_r_2d <= 1'b0;
         grant_issued_r_3d <= 1'b0;
      end else begin
         grant_issued_d  <= grant_issued;
         grant_issued_d1 <= grant_issued_d;
         grant_issued_d2 <= grant_issued_d1;
         grant_issued_pp <= grant_issued_r << next_port;
         grant_issued_r_1d <= grant_issued_r;
         grant_issued_r_2d <= grant_issued_r_1d;
         grant_issued_r_3d <= grant_issued_r_2d;
      end
   end

assign grant_issued_r = grant_issued && ~grant_issued_d;

assign eop_event_sel = (avst_sink_valid & avst_sink_eop)>>prev_port;
assign eop_event = eop_event_sel[0]; //made combinatorial to reduce latency
   //always @ (posedge arb_clk) begin
   //   if (~arb_rst_n) 
   //      eop_event_d <= 1'b0;
   //   else 
   //      eop_event_d <= eop_event;
   //end

//Port selection
   always @ (posedge arb_clk) begin
      if (~arb_rst_n) begin
         src_valid <= {NUM_INTERFACES{1'b0}};
         src_data  <= {NUM_INTERFACES*DATAWIDTH{1'b0}};
         src_sop   <= {NUM_INTERFACES{1'b0}};
         src_eop   <= {NUM_INTERFACES{1'b0}};
         src_empty <= {NUM_INTERFACES*EMPTY_DWITH{1'b0}};
         metadata  <= {NUM_INTERFACES*METADATAWIDTH{1'b0}};
      end else if (grant_issued_d || grant_issued_d1 || grant_issued_d2) begin
         src_valid <= avst_sink_valid_d2 >> prev_port;
         src_data  <= avst_sink_data_d2 >> (prev_port * DATAWIDTH);
         src_sop   <= avst_sink_sop_d2 >> prev_port; 
         src_eop   <= avst_sink_eop_d2 >> prev_port;
         src_empty <= avst_sink_empty_d2 >> (prev_port * EMPTY_DWITH);
         metadata  <= metadata_in_d2 >> (prev_port * METADATAWIDTH);
      end
   end

   assign ff_data = {metadata[METADATAWIDTH-1:0],src_empty[EMPTY_DWITH-1:0],src_eop[0],src_sop[0],src_data[DATAWIDTH-1:0]}; 
   assign ff_wrreq = src_valid[0] && (~ff_full);
   assign ff_rdreq = avst_src_ready && (~ff_empty);

   scfifo  u_ff_rdylat(
               .aclr         (~arb_rst_n),
               .clock        (arb_clk),
               .data         (ff_data),
               .rdreq        (ff_rdreq),
               .wrreq        (ff_wrreq),
               .empty        (ff_empty),
               .full         (ff_full),
               .q            (ff_q),
               .usedw        (),
               .almost_empty (),
               .almost_full  (),
               .eccstatus    (),
               .sclr         (1'b0)
   );
   defparam
       u_ff_rdylat.add_ram_output_register  = "ON",
       u_ff_rdylat.enable_ecc  = "FALSE",
       u_ff_rdylat.intended_device_family  = "Agilex",
       u_ff_rdylat.lpm_numwords  = RDY_FIFO_DEPTH,
       u_ff_rdylat.lpm_showahead  = "ON",
       u_ff_rdylat.lpm_type  = "scfifo",
       u_ff_rdylat.lpm_width  = RDY_FIFO_DWIDTH,
       u_ff_rdylat.lpm_widthu  = $clog2(RDY_FIFO_DEPTH),
       u_ff_rdylat.overflow_checking  = "ON",
       u_ff_rdylat.underflow_checking  = "ON",
       u_ff_rdylat.use_eab  = "ON";

//Output signals
//
assign avst_sink_ready = sink_ready;

assign avst_src_valid = ff_rdreq;               //src_valid[0];
assign avst_src_data  = ff_q[0 +: DATAWIDTH];   //src_data[DATAWIDTH-1:0];
assign avst_src_sop   = ff_q[DATAWIDTH +: 1];   //src_sop[0];
assign avst_src_eop   = ff_q[DATAWIDTH+1 +: 1]; //src_eop[0];
assign avst_src_empty = ff_q[DATAWIDTH+2 +: EMPTY_DWITH]; //src_empty[EMPTY_DWITH-1:0];

assign metadata_out = ff_q[DATAWIDTH+EMPTY_DWITH+2 +: METADATAWIDTH]; //metadata[METADATAWIDTH-1:0];

//assign csr_readdata = csr_readdata_reg;

// ---------   Code Ends Here --------- //
endmodule
