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


// Copyright 2022-2023 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials, and
// your use of them is governed by the express license under which they were
// provided to you ("License"). Unless the License provides otherwise, you may
// not use, modify, copy, publish, distribute, disclose or transmit this
// software or the related documents without Intel's prior written permission.
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.


module stats_aggregator #(
    parameter int DATA_WIDTH         = 32
   ,parameter int RESP_WIDTH         = 2
   ,parameter int ADDR_WIDTH         = 32
   ,parameter int ID_WIDTH           = 1
   ,parameter int NUM_PARSERS        = 3
   ,parameter int LS_DECODE_ADDR_BIT = 9
   ,localparam int STRB_WIDTH        = DATA_WIDTH / 8
   ,localparam int STATS_WIDTH       = 48
   ,localparam DATA_BYTES            = DATA_WIDTH/8
)(
    input  logic                                               clk
   ,input  logic                                               rst
   //input if
   //Write Address Channel
   ,output logic                                               m_awready
   ,input  logic                                               m_awvalid
   ,input  logic [ADDR_WIDTH - 1:0]                            m_awaddr
   //Write Data Channel
   ,output logic                                               m_wready
   ,input  logic                                               m_wvalid
   ,input  logic [STRB_WIDTH - 1:0]                            m_wstrb
   ,input  logic [DATA_WIDTH/8 - 1:0][7:0]                     m_wdata
   //Write Response Channel
   ,input  logic                                               m_bready
   ,output logic                                               m_bvalid
   ,output logic [RESP_WIDTH - 1:0]                            m_bresp
   //Read Address Channel
   ,output logic                                               m_arready
   ,input  logic                                               m_arvalid
   ,input  logic [ADDR_WIDTH - 1:0]                            m_araddr
   ,input  logic [ID_WIDTH - 1:0]                              m_arid
   //Read Data Channel
   ,input  logic                                               m_rready
   ,output logic                                               m_rvalid
   ,output logic [RESP_WIDTH - 1:0]                            m_rresp
   ,output logic [DATA_WIDTH - 1:0]                            m_rdata
   ,output logic [ID_WIDTH - 1:0]                              m_rid
   
   //output if
   //Write Address Channel
   ,input   logic[NUM_PARSERS - 1:0]                           mo_awready
   ,output  logic[NUM_PARSERS - 1:0]                           mo_awvalid
   ,output  logic[NUM_PARSERS - 1:0][ADDR_WIDTH - 1:0]         mo_awaddr
   //Write Data Channel
   ,input   logic[NUM_PARSERS - 1:0]                           mo_wready
   ,output  logic[NUM_PARSERS - 1:0]                           mo_wvalid
   ,output  logic[NUM_PARSERS - 1:0][STRB_WIDTH - 1:0]         mo_wstrb
   ,output  logic[NUM_PARSERS - 1:0][DATA_WIDTH - 1:0]         mo_wdata
   //Write Response Channel
   ,output  logic[NUM_PARSERS - 1:0]                           mo_bready
   ,input   logic[NUM_PARSERS - 1:0]                           mo_bvalid
   ,input   logic[NUM_PARSERS - 1:0][RESP_WIDTH - 1:0]         mo_bresp
   //Read Address Channel
   ,input   logic[NUM_PARSERS - 1:0]                           mo_arready
   ,output  logic[NUM_PARSERS - 1:0]                           mo_arvalid
   ,output  logic[NUM_PARSERS - 1:0][ADDR_WIDTH - 1:0]         mo_araddr
   ,output  logic[NUM_PARSERS - 1:0][ID_WIDTH - 1:0]           mo_arid
   //Read Data Channel
   ,output  logic[NUM_PARSERS - 1:0]                           mo_rready
   ,input   logic[NUM_PARSERS - 1:0]                           mo_rvalid
   ,input   logic[NUM_PARSERS - 1:0][RESP_WIDTH - 1:0]         mo_rresp
   ,input   logic[NUM_PARSERS - 1:0][DATA_WIDTH - 1:0]         mo_rdata
   ,input   logic[NUM_PARSERS - 1:0][ID_WIDTH - 1:0]           mo_rid
);
   logic stat_read_req, stats_aggregated, overflow, waddr_set, wdata_set;
   logic [ADDR_WIDTH - 1:0]                                  raddr, waddr;
   logic [ID_WIDTH - 1:0]                                    arid;
   logic [STRB_WIDTH - 1:0]                                  wstrb;
   logic [DATA_WIDTH/8 - 1:0][7:0]                           wdata;
   logic [NUM_PARSERS - 1:0]                                 accumulated;
   logic [NUM_PARSERS - 1:0][DATA_WIDTH - 1:0]               stat_lo;
   logic [NUM_PARSERS - 1:0][(STATS_WIDTH-DATA_WIDTH) - 1:0] stat_hi;
   logic [NUM_PARSERS - 1:0][STATS_WIDTH - 1:0]              stat;
   logic [STATS_WIDTH - 1:0]                                 stat_accumulator;
   logic [NUM_PARSERS - 1:0][2:0]                            reader_state;
   logic [NUM_PARSERS - 1:0]                                 write_resps_ok, waddr_consumed, w_done;

   always_comb begin
      for(int i=0; i<NUM_PARSERS; i++) begin
         stat[i] = {stat_hi[i], stat_lo[i]};
      end
   end
   //WR
   always_ff @(posedge clk) begin
      if(rst) begin
         m_awready <= 1'b1;
         m_wready  <= 1'b1;
         waddr_set <= 1'b0;
         wdata_set <= 1'b0;
         m_bvalid  <= 1'b0;
         m_bresp   <= '0;
      end else begin
         if(m_awvalid && m_awready) begin
            waddr <= m_awaddr;
            waddr_set <= 1'b1;
            m_awready <= 1'b0;
         end
         if(m_wready && m_wvalid) begin
            for(int i=0; i<STRB_WIDTH; i++) begin
               if(m_wstrb[i]) begin
                  wdata[i] <= m_wdata[i];
               end else begin
                  wdata[i] <= '0;
               end
            end
            wstrb <= m_wstrb;
            m_wready <= 1'b0;
            wdata_set <= 1'b1;
         end
         if(m_bready && m_bvalid) begin
            m_bvalid <= 1'b0;
         end else begin
            if(write_resps_ok == '1) begin
               m_bvalid  <= 1'b1;
               m_awready <= 1'b1;
               m_wready  <= 1'b1;
               waddr_set <= 1'b0;
               wdata_set <= 1'b0;
            end
         end
      end
   end

   for(genvar i = 0; i < NUM_PARSERS ; i++) begin : parser_writers
      always_ff@(posedge clk) begin
         if(rst) begin
            mo_awvalid[i]     <= 1'b0;
            mo_wvalid[i]      <= 1'b0;
            mo_bready[i]      <= 1'b1;
            write_resps_ok[i] <= 1'b0;
            waddr_consumed[i] <= 1'b0;
            w_done[i]         <= 1'b0;
            mo_awvalid[i]     <= 1'b0;
         end else begin
            if(waddr_set && wdata_set) begin
               mo_awaddr[i] <= waddr;
               if(!waddr_consumed[i]) begin
                  mo_awvalid[i] <= 1'b1;
               end else begin
                  mo_awvalid[i] <= 1'b0;
               end
               if(mo_awvalid[i] && mo_awready[i]) begin
                  waddr_consumed[i] <= 1'b1;
               end
               mo_wdata[i] <= wdata;
               mo_wstrb[i] <= wstrb;
               if(!w_done[i]) begin
                  mo_wvalid[i] <= 1'b1;
               end
               if(mo_wvalid[i] && mo_wready[i]) begin
                  mo_wvalid[i] <= 1'b0;
                  w_done[i] <= 1'b1;
                  write_resps_ok[i] <= 1'b0;
               end
               if(mo_bvalid[i]) begin
                  if(mo_bresp[i] == '0) begin
                     write_resps_ok[i] <= 1'b1; 
                  end
               end
            end else begin
               write_resps_ok[i] <= 1'b0;
               waddr_consumed[i] <= 1'b0;
               w_done[i] <= 1'b0;
            end
         end
      end
   end

   //RD
   always_ff @(posedge clk) begin
      if(rst) begin
         stat_read_req <= 1'b0;
         m_rvalid      <= 1'b0;
         m_rresp       <= '0;
         m_arready     <= 1'b1;
      end else begin
         if(m_arvalid && m_arready) begin
            raddr <= m_araddr;
            stat_read_req <= 1'b1;
            m_arready <= 1'b0;
         end else begin
            if(stat_read_req) begin
               m_arready <= 1'b0;
            end else begin
               m_arready <= 1'b1;
            end
         end
         if(stats_aggregated) begin
            stat_read_req <= 1'b0;
            if(!raddr[2]) begin
               m_rdata <= stat_accumulator[DATA_WIDTH - 1:0];
            end else begin
               m_rdata <= stat_accumulator[STATS_WIDTH - 1:DATA_WIDTH];
            end
            if(m_rvalid && m_rready) begin
               m_rvalid <= 1'b0;
            end else begin
               m_rvalid <= 1'b1;
            end
         end
      end
   end

   for(genvar i = 0; i < NUM_PARSERS ; i++) begin : parser_stat_readers
      always_ff@(posedge clk) begin
         if(rst) begin
            reader_state[i] <= '0;
            mo_arvalid[i]   <= 1'b0;
            mo_rready[i]    <= 1'b0;
            stat_lo[i]      <= '0;
            stat_hi[i]      <= '0;
         end else begin
            case(reader_state[i])
               3'b000: begin //wait for read reqest
                  if(stat_read_req) begin
                     reader_state[i] <= 3'b001;
                     mo_rready[i] <= 1'b1;
                  end
               end
               3'b001: begin //set address
                  mo_araddr[i] <= raddr[8:0];
                  mo_arvalid[i] <= 1'b1;
                  if(mo_arvalid[i] && mo_arready[i]) begin
                     mo_rready[i] <= 1'b1;
                     reader_state[i] <= 3'b010;
                  end
               end
               3'b010: begin //read data
                  if(mo_rvalid[i] && mo_rready[i]) begin
                     mo_arvalid[i] <= 1'b0;
                     if(!raddr[2]) begin
                        stat_lo[i] <= mo_rdata[i];
                        mo_rready[i] <= 1'b1;
                        reader_state[i] <= 3'b011;
                     end else begin
                        stat_hi[i] <= mo_rdata[i][(STATS_WIDTH-DATA_WIDTH) - 1:0];
                        mo_rready[i] <= 1'b1;
                        reader_state[i] <= 3'b011;
                     end
                  end
               end
               3'b011: begin //set second address
                  if(!raddr[2]) begin
                     mo_araddr[i] <= raddr[8:0] + 4'h4;
                  end else begin
                     mo_araddr[i] <= raddr[8:0] - 4'h4;
                  end
                  mo_arvalid[i] <= 1'b1;
                  if(mo_arvalid[i] && mo_arready[i]) begin
                     mo_rready[i] <= 1'b1;
                     reader_state[i] <= 3'b100;
                  end
               end
               3'b100: begin //read data
                  if(mo_rready[i] && mo_rvalid[i]) begin
                     mo_arvalid[i] <= 1'b0;
                     if(!raddr[2]) begin
                        stat_hi[i] <= mo_rdata[i][(STATS_WIDTH-DATA_WIDTH) - 1:0];
                        mo_rready[i] <= 1'b1;
                        reader_state[i] <= 3'b111;
                     end else begin
                        stat_lo[i] <= mo_rdata[i];
                        mo_rready[i] <= 1'b1;
                        reader_state[i] <= 3'b111;
                     end
                  end
               end
               3'b111: begin //wait for stat aggregation
                  if(!stat_read_req) begin
                     reader_state[i] <= '0;
                  end
               end
            endcase
         end
      end
   end

   always_ff@(posedge clk) begin
      if(rst) begin
         accumulated <= '0;
         stat_accumulator <= '0;
         stats_aggregated <= 1'b0;
         overflow <= 1'b0;
      end else begin
         if(m_rvalid && m_rready) begin
            stat_accumulator <= '0;
            stats_aggregated <= 1'b0;
            accumulated <= '0;
         end else begin
            if(reader_state == '1) begin
               if(accumulated < NUM_PARSERS) begin
                  if(overflow) begin
                     stat_accumulator <= '1;
                     accumulated <= NUM_PARSERS;
                  end else begin
                     overflow <= 1'b0;
                     {overflow, stat_accumulator} <= stat_accumulator + stat[accumulated];
                     accumulated <= accumulated + 1'b1;
                  end
               end else begin
                  stats_aggregated <= 1'b1;
               end
            end
         end
      end
   end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRhi6Gquz43dm5T3Q7f4Tew8gyT8DnEYxeDXwH2CiOUYfIzGs/yiFztzgcEupZaz40DGvVUb0NxR04HokYqtFpb817zzzrBfhaLU3zggvQd8fYWA3NPeXi+wAM7a2yV+PSX0V4eXCfaz7/Q6TlPXbBtDbQ0KVvFz6OvbXbxcjsk0nThVYo5K1mwMnr/hyurw2pfaZGjpC4epqHNHNprmx/7v1JOOpMP4IDH947chtB3kDHYpgPQmLkOwxOwgKIyxH1qvEQqBlnTTxHkZgtMBSQHrQtre6ybXvyC0vvLS3lqN0Ynh50FyObIzhhAR6BD2+M/N+PdjQDF5yHrl2ubfoFTi2xmfryxj4zO+0V/ITGijXwHBBhV4oGpq4gewlY0gX5afERqtrNqQs71P2TLNNCzTAlDu9acptAELNkFKfiOUPlMw7MMjFv9+sEJYPMU/k+T+YoX7UX5S5+TNSsivrXKTvtBf2aYqE9NuE+6atGdT3FV+h8HhrkBXlYWtkdMU1m5KiuJagtnQ8gZhdyDbfBEVN5az6eptTdHlJd10ZBe43QQaPAtH1rmNa07T1naMPKW/2iPTCyDEztgcTVLemUuFri4OHmWERtgqcGeoMiK2TII7FD8jY1o58IOOSkJXSfioA3VW1e70mGqcy6GCNtA0+eKSiGlVw9Jkd1eVco76GIYknq8Io4laAeZ4UuI81LdDtkG0d1ZxRYm7Fm3bZLP9jNQMfxLqk5u0MdJwYcpvJiL8gTI8DaqFv9tQI9/vbxWZ54LB9tdgcMz87SnmvCoo"
`endif