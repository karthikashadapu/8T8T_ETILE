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
// Module            : hssi_ss_f_pfc_sopa_tx.sv
// Description       : 
// Author            : 
// Created           : 
// Changes           : 
// Keywors           : TODO TBD FIXME
// ==========================================================================
// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module hssi_ss_f_pfc_sopa_tx #(
  parameter AXI_DATA_WIDTH                                       = 64,
  parameter AXI_NUM_BYTES                                        = 8,
  parameter AXI_TUSER_WIDTH                                      = 7,   //Including parity if enabled

  parameter NUM_QUEUES                                           = 2,
  parameter [3:0] AXI_READY_LATENCY                              = 0,  
  parameter QUEUE_WIDTH                                          = 3,

  parameter [31:0] TX_QUEUE_SIZE      [8-1:0]                    = '{default:512}, //Queue size interms of no of words (word length = data_width). 
  parameter [31:0] TX_QUEUE_WIDTH     [8-1:0]                    = '{default:9}, 

  //parameter ENABLE_ECC                                           = 0,
  parameter PREAMBLE_EN                                          = 0,
  parameter SIM_EMULATE                                          = 1

) (
  // PFC control from CSR 
  input                                                          i_reconfig_clk,
  input                                                          i_reconfig_read,
  input          [7:0]                                           i_reconfig_address,
  input                                                          i_rdreq_latch,
  input                                                          i_wrreq_latch,
  input                                                          i_pause_pfc_sel,  //1'b0 - Pause; 1'b1 - PFC
  input                                                          i_flow_cntrol_en, //1'b0 - Bypass PFC; 1'b1 - PFC
  input                                                          i_pfc_tx_arb_sel, //1'b0 - Roundrobin; 1'b1 - Strict Priority
  input          [NUM_QUEUES-1:0][2:0]                           i_pfc_tx_th_cfg,  //TBD: HAS doesn't mention it as per queue signal
  input                                                          i_pfc_tx_stat_clear,

  input                                                          i_preamble_pass_thr_en,

  // AXI ST TX, User side Interface
  input                                                          i_tx_clk,
  input                                                          i_tx_rst_n,
  output  reg                                                    o_axi_app_tx_tready, 
  input                                                          i_axi_app_tx_tvalid,
  input          [AXI_DATA_WIDTH-1:0]                            i_axi_app_tx_tdata,
  input          [AXI_NUM_BYTES-1:0]                             i_axi_app_tx_tkeep,
  input                                                          i_axi_app_tx_tlast,
  input          [AXI_TUSER_WIDTH-1:0]                           i_axi_app_tx_tuser, 
  
  // From PFC to MAC/Line side
  input                                                          i_axi_mac_tx_tready,
  output                                                         o_axi_mac_tx_tvalid,
  output   reg     [AXI_DATA_WIDTH-1:0]                          o_axi_mac_tx_tdata, 
  output   reg     [AXI_NUM_BYTES-1:0]                           o_axi_mac_tx_tkeep,
  output   reg                                                   o_axi_mac_tx_tlast,
  output   reg                                                   o_axi_mac_tx_ttrunc,  
  output   reg     [AXI_TUSER_WIDTH-1:0]                         o_axi_mac_tx_tuser, 
  
  // Control signal on user side                                     
  output  reg    [NUM_QUEUES-1:0]                                o_app_tx_queue_level, //Watermark,threshold level from cfg
  // Control signal from Rx MAC side to stall TX Read buffer
  input          [NUM_QUEUES-1:0]                                i_rx_pfc,   
  input                                                          i_rx_pause,
  
  output  reg    [NUM_QUEUES-1:0] [15:0]                         o_tx_buf_drop_pkt_cntr //In the event where the queue is full, non completed packet will be truncated and tlast_buf_pkt_truncation signal will be asserted at EOP. Any subsequent packet drop due to queue full will be counted in the PFC Rx statistic CSR. 

);

localparam NUM_QUEUES_INT                                        = 8;
localparam FIFO_DATA_WIDTH                                       = AXI_DATA_WIDTH + AXI_NUM_BYTES + AXI_TUSER_WIDTH + 2; //dw+tkeep+(tuser incl parity)+tlast+ttrunc
//AXI_DATA_WIDTH == 64 .10G/25G
//AXI_DATA_WIDTH == 128 .Non Preamble_passthrough enabled case for 40G/50G. But CSR configurable.TBD:
//AXI_DATA_WIDTH == 256 .Preamble_passthrough enabled case for 40G/50G
//AXI_DATA_WIDTH == 512 .100G
localparam PARSER_LATENCY                                        = 1; 

typedef struct packed {
  logic                          ttrunc;  
  logic                          tlast;  
  logic  [AXI_TUSER_WIDTH-1:0]   tuser; 
  logic  [AXI_NUM_BYTES-1:0]     tkeep;
  logic  [AXI_DATA_WIDTH-1:0]    tdata;
} fifo_bus_per_queue; 
typedef fifo_bus_per_queue  [NUM_QUEUES_INT-1:0] fifo_bus; 

//**************************************************************************************************
//                             Wires and regs  
//**************************************************************************************************
// Parser Signals
wire                                                             axi_parser_tx_tvalid;
wire [AXI_DATA_WIDTH-1:0]                                        axi_parser_tx_tdata;
wire [AXI_NUM_BYTES-1:0]                                         axi_parser_tx_tkeep;
wire                                                             axi_parser_tx_tlast;  
wire [AXI_TUSER_WIDTH-1:0]                                       axi_parser_tx_tuser; 
wire [2:0]                                                       tx_packet_pcp; //Priority from VLAN TAG  
wire [2:0]                                                       tx_queue_no_tmp; 
wire [QUEUE_WIDTH-1:0]                                           tx_queue_no; 
reg                                                              axi_parser_tx_tstart;
wire                                                             axi_parser_tx_not_inprog;
reg                                                              axi_parser_tx_tvalid_d1;
reg  [AXI_DATA_WIDTH-1:0]                                        axi_parser_tx_tdata_d1;
reg  [AXI_NUM_BYTES-1:0]                                         axi_parser_tx_tkeep_d1;
reg                                                              axi_parser_tx_tlast_d1;  
reg  [AXI_TUSER_WIDTH-1:0]                                       axi_parser_tx_tuser_d1;
reg  [QUEUE_WIDTH-1:0]                                           tx_queue_no_d1; 
//parser_package::vlan_t                                            parser_tag; //Priority from VLAN TAG  

// Queue Signals
reg  [NUM_QUEUES_INT-1:0]                                        data_available;   
wire [NUM_QUEUES_INT-1:0]                                        data_available_adv;   
reg  [NUM_QUEUES-1:0]                                            fifo_wr_en_a1; 
reg  [NUM_QUEUES-1:0]                                            fifo_wr_en; 
reg  [NUM_QUEUES-1:0]                                            fifo_wr_en_d1; 
fifo_bus                                                         fifo_wr_data;
fifo_bus                                                         fifo_wr_data_d1;
wire [NUM_QUEUES_INT-1:0]                                        fifo_rd_en; 
reg  [NUM_QUEUES_INT-1:0]                                        data_fifo_rd_en_d1; 
reg  [NUM_QUEUES_INT-1:0]                                        data_fifo_rd_en_d2; 
fifo_bus                                                         fifo_rd_data_d1;
fifo_bus                                                         fifo_rd_data_d2;
wire [NUM_QUEUES_INT-1:0]                                        fifo_empty;
wire [NUM_QUEUES_INT-1:0]                                        fifo_full; 
wire [NUM_QUEUES_INT-1:0]                                        fifo_almost_empty; 
wire [NUM_QUEUES_INT-1:0][1:0]                                   fifo_eccstatus;
// wire [NUM_QUEUES_INT-1:0][11-1:0]                                fifo_usedw; 
wire [NUM_QUEUES_INT-1:0][16-1:0]                                fifo_usedw; 
wire [NUM_QUEUES_INT-1:0]                                        fifo_rd_eop_tmp; 
wire [NUM_QUEUES_INT-1:0]                                        fifo_rd_eop; 
reg                                                              fifo_rd_en_any_d2; 
reg                                                              fifo_rd_en_any_d3; 
reg                                                              fifo_rd_any_sop_d3; 
reg                                                              fifo_rd_valid_gate_d4; 
//reg                                                              fifo_rd_any_eop_a1; 
//reg                                                              fifo_rd_any_eop_d0; 
//reg                                                              fifo_rd_any_eop_d1; 
//reg                                                              fifo_rd_any_eop_d2; 
wire                                                             fifo_rd_any_eop_d3; 
reg                                                              fifo_rd_any_eop_d4; 

reg  [NUM_QUEUES_INT-1:0]                                        data_fifo_rd_en_a1; 
reg  [NUM_QUEUES_INT-1:0]                                        data_fifo_rd_en; 
wire [NUM_QUEUES_INT-1:0]                                        data_fifo_empty;
wire [NUM_QUEUES_INT-1:0]                                        data_fifo_full; 
wire [NUM_QUEUES_INT-1:0]                                        data_fifo_almost_empty; 
wire [NUM_QUEUES_INT-1:0][1:0]                                   data_fifo_eccstatus;

reg  [NUM_QUEUES_INT-1:0]                                        pfc_tx_tready;  
wire                                                             axist_tx_tready_delayed; // Delayed ready signal for READY_LATENCY support
wire                                                             axist_tx_tready_parser_delayed; // Delayed ready signal for READY_LATENCY support
reg                                                              axist_tx_tready_parser_delayed_d1; 

wire                                                             axi_mac_tx_fifo_tvalid;
reg   [AXI_DATA_WIDTH-1:0]                                       axi_mac_tx_fifo_tdata; 
reg   [AXI_NUM_BYTES-1:0]                                        axi_mac_tx_fifo_tkeep;
reg                                                              axi_mac_tx_fifo_tlast;
reg                                                              axi_mac_tx_fifo_ttrunc;
reg   [AXI_TUSER_WIDTH-1:0]                                      axi_mac_tx_fifo_tuser; 

/*
reg                                                              axi_mac_tx_tvalid;
reg   [AXI_DATA_WIDTH-1:0]                                       axi_mac_tx_tdata; 
reg   [AXI_NUM_BYTES-1:0]                                        axi_mac_tx_tkeep;
reg                                                              axi_mac_tx_tlast;
reg   [AXI_TUSER_WIDTH-1:0]                                      axi_mac_tx_tuser; 
*/

//CSR Signals
wire                                                             flow_control_en_sync, pause_pfc_sel_sync, preamble_pass_thr_en_sync;
// reg                                                              tx_fc_en_sel;
reg                                                              pause_pfc_sel_gated;
reg                                                              flow_control_en_wr_gated;
wire                                                             pfc_tx_arb_sel_sync;
reg                                                              pfc_tx_arb_sel_gated;
reg  [NUM_QUEUES-1:0][2:0]                                       pfc_tx_th_cfg_sync;
reg  [NUM_QUEUES-1:0]                                            rx_pfc_sync;   
reg                                                              rx_pause_sync;

//Arbiter Signals
wire [NUM_QUEUES_INT-1:0]                                        arb_queue_grant; 
wire [NUM_QUEUES_INT-1:0]                                        sp_arb_queue_grant; 
wire [NUM_QUEUES_INT-1:0]                                        rr_arb_queue_grant; 
reg  [NUM_QUEUES-1:0]                                            tx_read_stall;   

reg                                                              axi_mac_tx_tready_mux_d1; //, axi_mac_tx_tready_mux_d2;
// reg                                                              axi_mac_tx_tready_d1;

//Truncation Signals
reg                                                              tx_tvalid_gate_d1;
reg                                                              tx_tlast_truncation_d1; //Dummy EOP pulse
reg                                                              tx_tlast_truncation_wen_d1; //Dummy EOP pulse
reg                                                              tx_tlast_truncation_flg; //Dummy EOP pulse
reg                                                              fifo_wr_eop;
reg                                                              fifo_wr_eop_d1;
reg [NUM_QUEUES_INT-1:0] [15:0]                                  tx_buf_drop_pkt_cntr; 
reg [7:0]                                                        i_reconfig_address_d1;
wire                                                             pkt_stat_snap_shot;
reg                                                              pkt_stat_snap_shot_hold;
wire                                                             pkt_stat_snapshot;
reg                                                              pkt_stat_snapshot_d;
wire                                                             pkt_stat_snapshot_pedge;
wire                                                             pkt_stat_clear;
reg                                                              pkt_stat_clear_hold;
wire                                                             pkt_stat_clear_sync;
reg                                                              pkt_stat_clear_sync_d;
wire                                                             pkt_stat_clear_sync_pedge;
wire                                                             threshold_snap_shot;
wire                                                             threshold_snapshot;
reg                                                              threshold_snapshot_nedge;
reg                                                              threshold_snap_shot_hold;
reg                                                              threshold_snapshot_d;

genvar i;

//**************************************************************************************************
//                            VLAN Priority Detection Parser
//**************************************************************************************************
hssi_ss_f_pfc_sopa_parser #(
  .AXI_DATA_WIDTH                     (AXI_DATA_WIDTH                   ),
  .AXI_NUM_BYTES                      (AXI_NUM_BYTES                    ),
  .AXI_TUSER_WIDTH                    (AXI_TUSER_WIDTH                  )  
) U_TX_Parser_DUT (
  .i_clk                              (i_tx_clk                         ),
  .i_rst_n                            (i_tx_rst_n                       ),
  .i_preamble_pass_thr_en             (preamble_pass_thr_en_sync        ), 
  //.i_axi_tvalid                        (i_axi_app_tx_tvalid && axist_tx_tready_delayed    ),
  .i_axi_tvalid                       (i_axi_app_tx_tvalid              ),
  .i_axi_tdata                        (i_axi_app_tx_tdata               ),
  .i_axi_tkeep                        (i_axi_app_tx_tkeep               ),
  .i_axi_tuser                        (i_axi_app_tx_tuser               ),
  .i_axi_tlast                        (i_axi_app_tx_tlast               ),
  .i_axi_tready                       (axist_tx_tready_delayed          ),
  .o_packet_pcp                       (tx_packet_pcp                    ),
  .o_axi_tvalid                       (axi_parser_tx_tvalid             ),
  .o_axi_tdata                        (axi_parser_tx_tdata              ),
  .o_axi_tkeep                        (axi_parser_tx_tkeep              ),
  .o_axi_tuser                        (axi_parser_tx_tuser              ),
  .o_axi_tlast                        (axi_parser_tx_tlast              ),
  .o_axi_tready                       (axist_tx_tready_parser_delayed   )

);

assign axi_parser_tx_not_inprog = axi_parser_tx_tstart && ~(axi_parser_tx_tvalid && axist_tx_tready_parser_delayed);

always @(posedge i_tx_clk or negedge i_tx_rst_n)
begin
  if(~i_tx_rst_n)
    pause_pfc_sel_gated <= 1'b0;
  else if(axi_parser_tx_tvalid && axi_parser_tx_tlast && axist_tx_tready_parser_delayed)
    pause_pfc_sel_gated <= pause_pfc_sel_sync; //At SOP aligned
    else if(axi_parser_tx_not_inprog)
    pause_pfc_sel_gated <= pause_pfc_sel_sync; //At SOP aligned
end

always @(posedge i_tx_clk or negedge i_tx_rst_n)
begin
  if(~i_tx_rst_n)
    flow_control_en_wr_gated <= 1'b1;
  else if(axi_parser_tx_tvalid && axi_parser_tx_tlast && axist_tx_tready_parser_delayed)
    flow_control_en_wr_gated <= flow_control_en_sync; //At SOP aligned
    else if(axi_parser_tx_not_inprog)
    flow_control_en_wr_gated <= flow_control_en_sync; //At SOP aligned
end

assign tx_queue_no_tmp = (~pause_pfc_sel_gated || ~flow_control_en_wr_gated)  ? 3'd0 : tx_packet_pcp; 
assign tx_queue_no     = (tx_queue_no_tmp > (NUM_QUEUES-1))? '0: tx_queue_no_tmp[QUEUE_WIDTH-1:0];
// assign tx_queue_no = tx_queue_no_tmp[QUEUE_WIDTH-1:0]; 

//**************************************************************************************************
//                              Write Side logic
//**************************************************************************************************
//since tx_queue_no is assigned based on flow_control_en_wr_gated, updated o_axi_app_tx_tready gen w.r.t gated signal
//else queue no will be w.r.t gated and ready will be w.r.t sync signal

// always @(posedge i_tx_clk)
// begin
  // axi_mac_tx_tready_d1     <= i_axi_mac_tx_tready;
  // axi_mac_tx_tready_mux_d2 <= axi_mac_tx_tready_mux_d1; 
// end

always @(posedge i_tx_clk or negedge i_tx_rst_n)
begin
  if(~i_tx_rst_n)
  begin
    axi_mac_tx_tready_mux_d1 <= 1'b0;
    o_axi_app_tx_tready <= 1'b0;
  end
  else if (flow_control_en_wr_gated == 1'b0)
  begin
     axi_mac_tx_tready_mux_d1 <= i_axi_mac_tx_tready;
     if(fifo_usedw[0][0 +: TX_QUEUE_WIDTH[0]] >= (AXI_READY_LATENCY+PARSER_LATENCY+10)) //buffers are not used fully 
        o_axi_app_tx_tready <= 1'd0;
    else if (i_axi_mac_tx_tready)
       o_axi_app_tx_tready <= 1'd1;
  end
  else if (pause_pfc_sel_gated == 1'b0)
  begin
     axi_mac_tx_tready_mux_d1 <= i_axi_mac_tx_tready;  
    o_axi_app_tx_tready <= pfc_tx_tready[0];                //When Q0 is full, removing ready to user (should not give ready when other Q's are not full) 
  end
  else
  begin
    axi_mac_tx_tready_mux_d1 <= i_axi_mac_tx_tready; 
    o_axi_app_tx_tready <= |pfc_tx_tready;
  end
end

hssi_ss_delay_reg #(
  .CYCLES (AXI_READY_LATENCY), 
  .WIDTH  (1)
) U_ready_latency_delay_reg (
  .clk    (i_tx_clk),
  .din    (o_axi_app_tx_tready),
  .dout   (axist_tx_tready_delayed) 
);
/*
hssi_ss_delay_reg #(
  .CYCLES (PARSER_LATENCY), 
  .WIDTH  (1)
) U_ready_latency_delay_parser_reg (
  .clk    (i_tx_clk),
  .din    (axist_tx_tready_delayed),
  .dout   (axist_tx_tready_parser_delayed) 
);
*/
//AXI_READY_LATENCY+3+PARSER_LATENCY -> 6 = parser module latency, 2 clks latency for o_ready to de-assert
generate 
begin : TX_TREADY_GEN
  for(i=0; i<NUM_QUEUES; i=i+1) 
  begin :TX_TREADY
    always @(posedge i_tx_clk or negedge i_tx_rst_n) 
    begin
      if(~i_tx_rst_n)
        pfc_tx_tready[i] <= 1'b0;
      else if(fifo_usedw[i][0 +: TX_QUEUE_WIDTH[i]] >= (TX_QUEUE_SIZE[i]-(AXI_READY_LATENCY+PARSER_LATENCY+10))) // Sync delay+1 delay of usedw+Parser delay
        pfc_tx_tready[i] <= 1'b0;
      else if(fifo_usedw[i][0 +: TX_QUEUE_WIDTH[i]] <= (AXI_READY_LATENCY+PARSER_LATENCY+10)) 
        pfc_tx_tready[i] <= 1'b1;
      else 
        pfc_tx_tready[i] <= i_axi_mac_tx_tready;
    end
  end
  //for disabled queues
  if (NUM_QUEUES < 8)
  begin:TX_TREADY_DISABLED
    for(i=NUM_QUEUES; i<NUM_QUEUES_INT; i=i+1) 
    begin :TX_TREADY_DIS
      always @(posedge i_tx_clk or negedge i_tx_rst_n) 
      begin
        if(~i_tx_rst_n)
          pfc_tx_tready[i] <= 1'b0;
        else //if(i_axi_mac_tx_tready)
          pfc_tx_tready[i] <= 1'b0;
      end
    end
  end

end
endgenerate

hssi_ss_resync_std #(
   .SYNC_CHAIN_LENGTH         (2),
   .WIDTH                     (3),
   .INIT_VALUE                (0)
) U_sync_pfc_sel (
   .clk                       (i_tx_clk), 
   .reset                     (1'b0),
   .d                         ({i_flow_cntrol_en,i_pause_pfc_sel,i_preamble_pass_thr_en}), 
   .q                         ({flow_control_en_sync,pause_pfc_sel_sync,preamble_pass_thr_en_sync})
);

//**************************************************************************************************
//                                          TX Threshold
//**************************************************************************************************
assign threshold_snap_shot  = i_wrreq_latch;

always @(posedge i_reconfig_clk) begin
  threshold_snap_shot_hold <= threshold_snap_shot;
end

hssi_ss_resync_std #(
   .SYNC_CHAIN_LENGTH         (2),
   .WIDTH                     (1),
   .INIT_VALUE                (0)
) U_tx_threshold_snapshot (
   .clk                       (i_tx_clk), 
   .reset                     (1'b0),
   .d                         (threshold_snap_shot_hold),
   .q                         (threshold_snapshot)
);

always @(posedge i_tx_clk) begin
  threshold_snapshot_d     <= threshold_snapshot;
  threshold_snapshot_nedge <= threshold_snapshot_d & ~threshold_snapshot;
end


generate 
begin: TX_THRESHOLD_SYNC 
  for(i=0; i< NUM_QUEUES; i=i+1) 
  begin : QUEUE
    always @(posedge i_tx_clk or negedge i_tx_rst_n) begin
      if (~i_tx_rst_n) 
        pfc_tx_th_cfg_sync[i] <= 3'd4;
      else if (threshold_snapshot_nedge)
        pfc_tx_th_cfg_sync[i] <= i_pfc_tx_th_cfg[i];
    end
  end
end
endgenerate

//***************************************************************************************************************************
//                                     Dummy EOP Generation
//***************************************************************************************************************************
always @(posedge i_tx_clk or negedge i_tx_rst_n)
begin
  if(~i_tx_rst_n)
    axi_parser_tx_tstart <= 1'b1;
  else if(axi_parser_tx_tvalid && axi_parser_tx_tlast && axist_tx_tready_parser_delayed)
    axi_parser_tx_tstart <= 1'b1;
  else if(axi_parser_tx_tvalid && axist_tx_tready_parser_delayed)
    axi_parser_tx_tstart <= 1'b0;
end    

//Works in terms of PFC, For pause, only one q is used so we need not truncate the packet during last fifo write since once ready is asserted again the user can complete the packet - no packet loss
always @(posedge i_tx_clk or negedge i_tx_rst_n)
begin
  if(~i_tx_rst_n) begin
    tx_tvalid_gate_d1      <= 1'b1;
    tx_tlast_truncation_d1 <= 1'b0; 
    tx_tlast_truncation_wen_d1 <= 1'b0; 
  end 
  else if((fifo_usedw[tx_queue_no] >= (TX_QUEUE_SIZE[tx_queue_no]-8) && axi_parser_tx_tvalid && axist_tx_tready_parser_delayed)) begin //Dummy EOP inserted at POS:FIFO_DEPTH-1 & TIMESTAMP:1 cycle before full 
    tx_tvalid_gate_d1      <= 1'b0;
    tx_tlast_truncation_d1 <= ~axi_parser_tx_tlast && tx_tvalid_gate_d1;
    tx_tlast_truncation_wen_d1 <= tx_tvalid_gate_d1;
  end 
  else if(axi_parser_tx_tvalid && axi_parser_tx_tstart && axist_tx_tready_parser_delayed) begin //Next SOP
    if(fifo_usedw[tx_queue_no] < (TX_QUEUE_SIZE[tx_queue_no]-8)) begin
      tx_tvalid_gate_d1      <= 1'b1;
      tx_tlast_truncation_d1 <= 1'b0; 
      tx_tlast_truncation_wen_d1 <= 1'b0; 
    end 
    else begin
      tx_tvalid_gate_d1      <= 1'b0;
      tx_tlast_truncation_d1 <= 1'b0; 
      tx_tlast_truncation_wen_d1 <= 1'b0; 
    end
  end
  else begin
    tx_tvalid_gate_d1      <= tx_tvalid_gate_d1;
    tx_tlast_truncation_d1 <= 1'b0; 
    tx_tlast_truncation_wen_d1 <= 1'b0; 
  end
end

always @(posedge i_tx_clk or negedge i_tx_rst_n)
begin
  if(~i_tx_rst_n)
    tx_tlast_truncation_flg <= 1'b0; 
  else if (tx_tvalid_gate_d1)
    tx_tlast_truncation_flg <= 1'b0;
  else begin
    if (tx_tlast_truncation_d1)
      tx_tlast_truncation_flg <= 1'b0; 
    else if (axi_parser_tx_tvalid_d1 && axi_parser_tx_tlast_d1)
      tx_tlast_truncation_flg <= 1'b1;
  end
end

always @(posedge i_tx_clk) 
begin
  axi_parser_tx_tvalid_d1             <=   axi_parser_tx_tvalid;
  axi_parser_tx_tdata_d1              <=   axi_parser_tx_tdata;
  axi_parser_tx_tkeep_d1              <=   axi_parser_tx_tkeep;
  axi_parser_tx_tlast_d1              <=   axi_parser_tx_tlast;  
  axi_parser_tx_tuser_d1              <=   axi_parser_tx_tuser;
  tx_queue_no_d1                      <=   tx_queue_no;  
  fifo_wr_eop                         <=   axi_parser_tx_tlast_d1 || tx_tlast_truncation_d1;
  axist_tx_tready_parser_delayed_d1   <=   axist_tx_tready_parser_delayed;  
end

generate 
begin: TX_WRITE
  for(i=0; i< NUM_QUEUES; i=i+1) 
  begin : QUEUE
    always @(posedge i_tx_clk) 
    begin //TBD : Review. Expressed as %
      // o_app_tx_queue_level[i] <= (fifo_usedw[i][TX_QUEUE_WIDTH[i]-1:0] >= ((pfc_tx_th_cfg_sync[i]*TX_QUEUE_SIZE[i])/NUM_QUEUES)-3-PARSER_LATENCY);
      o_app_tx_queue_level[i] <= ((fifo_usedw[i][TX_QUEUE_WIDTH[i]-1:TX_QUEUE_WIDTH[i]-3]) >= (pfc_tx_th_cfg_sync[i])); //generates 
    end

    //assign fifo_wr_data[i] = {tx_tlast_truncation_d1,(axi_parser_tx_tlast_d1||tx_tlast_truncation_d1),axi_parser_tx_tuser_d1,axi_parser_tx_tkeep_d1,axi_parser_tx_tdata_d1}; 
    always @(posedge i_tx_clk or negedge i_tx_rst_n)
    begin
      if(~i_tx_rst_n) 
      begin
        fifo_wr_en_a1[i]   <= 'd0; 
        fifo_wr_en[i]   <= 'd0; 
        fifo_wr_en_d1[i]<= 'd0; 
        fifo_wr_data[i] <= 'd0; 
        fifo_wr_data_d1[i] <= 'd0;
        fifo_wr_eop_d1 <= 'd0;
      end 
      else
      begin
        //fifo_wr_data[i] <= {axi_parser_tx_tlast,axi_parser_tx_tuser,axi_parser_tx_tkeep,axi_parser_tx_tdata};
        //if(flow_control_en_wr_gated == 1'b0)  //Disable both Pause and PFC
        //  fifo_wr_en[i] <= 1'b0;
        //else //Note: pause_pfc_sel_gated latency is 3, parser latency is 2(worst). Data will be available. Ready asserted before parser valid  
          //fifo_wr_en[i] <= ((~pause_pfc_sel_gated || ~flow_control_en_wr_gated) && (i>0)) ? 1'b0 : ((axist_tx_tready_parser_delayed && axi_parser_tx_tvalid && (tx_queue_no == i)) ? 1'b1 : 1'b0); 
          fifo_wr_en_a1[i]   <= (axist_tx_tready_parser_delayed && axi_parser_tx_tvalid && (tx_queue_no == i)) ? 1'b1 : 1'b0; 
          fifo_wr_en[i]      <= fifo_wr_en_a1[i] && (tx_tvalid_gate_d1 || tx_tlast_truncation_wen_d1);
          fifo_wr_en_d1[i]   <= fifo_wr_en[i];
          fifo_wr_data[i] <= {tx_tlast_truncation_d1,(axi_parser_tx_tlast_d1||tx_tlast_truncation_d1),axi_parser_tx_tuser_d1,axi_parser_tx_tkeep_d1,axi_parser_tx_tdata_d1}; 
          fifo_wr_data_d1[i] <= fifo_wr_data[i]; 
          fifo_wr_eop_d1     <= fifo_wr_eop;
      end
    end
  end

  if (NUM_QUEUES < 8)
  begin : QUEUE_DISABLED
    for(i=NUM_QUEUES; i<NUM_QUEUES_INT; i=i+1) 
    begin : QUEUE_DIS
      assign fifo_wr_data[i] = 'd0; 
    end
  end
end
endgenerate
  
//**************************************************************************************************
//                              TX Buffer
//**************************************************************************************************
//wrreq (fifo_wr_en[i] && (tx_tvalid_gate_d1 || tx_tlast_truncation_d1) && ~fifo_full[i]), //PFC - ready can be high when any one q has bandwidth to accept data. to not write when fifo is full ~fifo_full[i] condition is used
generate 
begin: TX_QUEUE
  for(i=0; i< NUM_QUEUES; i=i+1) 
  begin : QUEUE
     // if (ENABLE_ECC) begin : FIFO_WITH_ECC
        // dcfifo  # (
          // .enable_ecc               ("FALSE"),
          // .intended_device_family   ("Agilex"),
          // .lpm_hint                 ("RAM_BLOCK_TYPE=M20K,DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE"),
          // .lpm_width                (FIFO_DATA_WIDTH),
          // .lpm_widthu               (TX_QUEUE_WIDTH[i]),
          // .lpm_numwords             (TX_QUEUE_SIZE[i]), 
          // .lpm_type                 ("dcfifo"),
          // .lpm_showahead            ("OFF"),
          // .rdsync_delaypipe         (2),
          // .wrsync_delaypipe         (2),                  
          // .overflow_checking        ("OFF"),
          // .underflow_checking       ("OFF"),
          // .use_eab                  ("ON"),
          // .almost_empty_value       ('h2), //A cycle before empty is asserted.
          // .add_ram_output_register  ("ON")
          // ) U_tx_data_queue (
          // .data                     (fifo_wr_data[i]),
          // .rdclk                    (i_tx_clk),       
          // .rdreq                    (data_fifo_rd_en[i] && ~data_fifo_empty[i]), 
          // .wrclk                    (i_tx_clk),       
          // .wrreq                    (fifo_wr_en[i] && ~data_fifo_full[i]),
          // .q                        (fifo_rd_data_d1[i]),         
          // .rdempty                  (data_fifo_empty[i]),//Asserted at usedw= 1->0 & Deasserted at usedw = 2->3
          // .wrfull                   (data_fifo_full[i]),//Asserted at usedw = queuezise --> 0
          // .aclr                     (~i_tx_rst_n),
          // .rdfull                   (),
          // .rdusedw                  (),
          // .wrempty                  (),       
          // .wrusedw                  (),//fifo_usedw[i][0 +: TX_QUEUE_WIDTH[i]]),
          // .almost_empty             (data_fifo_almost_empty[i]), //Asserted at usedw<almost_empty_value i.e "2->1", Deasserted at usedw=almost_empty_value i.e "1->2"
          // .almost_full              (),
          // .eccstatus                (fifo_eccstatus[i]) //TODO: Exists only if ENABLE_ECC
          // .sclr                     (~i_tx_rst_n)
        // );   
     // end     
     // else begin : FIFO_WITHOUT_ECC
        dcfifo  # (
          .intended_device_family   ("Agilex"),
          .lpm_hint                 ("RAM_BLOCK_TYPE=M20K,DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE"),
          .lpm_width                (FIFO_DATA_WIDTH),
          .lpm_widthu               (TX_QUEUE_WIDTH[i]),
          .lpm_numwords             (TX_QUEUE_SIZE[i]), 
          .lpm_type                 ("dcfifo"),
          .lpm_showahead            ("OFF"),
          .rdsync_delaypipe         (2),
          .wrsync_delaypipe         (2),                  
          .overflow_checking        ("OFF"),
          .underflow_checking       ("OFF"),
          .use_eab                  ("ON"),
          .add_ram_output_register  ("ON")
          ) U_tx_data_queue (
          .data                     (fifo_wr_data_d1[i]),
          .rdclk                    (i_tx_clk),       
          .rdreq                    (data_fifo_rd_en[i] && ~data_fifo_empty[i]), 
          .wrclk                    (i_tx_clk),       
          .wrreq                    (fifo_wr_en_d1[i] && ~data_fifo_full[i]),
          .q                        (fifo_rd_data_d1[i]),         
          .rdempty                  (data_fifo_empty[i]),//Asserted at usedw= 1->0 & Deasserted at usedw = 2->3
          .wrfull                   (data_fifo_full[i]),//Asserted at usedw = queuezise --> 0
          .aclr                     (~i_tx_rst_n),
          .rdfull                   (),
          .rdusedw                  (),
          .wrempty                  (),       
          .wrusedw                  ()//fifo_usedw[i][0 +: TX_QUEUE_WIDTH[i]]),
          // .almost_empty             (data_fifo_almost_empty[i]), //Asserted at usedw<almost_empty_value i.e "2->1", Deasserted at usedw=almost_empty_value i.e "1->2"
          // .almost_full              (),
          //.eccstatus                (fifo_eccstatus[i]), //TODO: Exists only if ENABLE_ECC
          // .sclr                     (~i_tx_rst_n)
        );

        scfifo  # (
          //.enable_ecc               (1),
          .intended_device_family   ("Agilex"),
          .lpm_hint                 ("RAM_BLOCK_TYPE=M20K"),
          .lpm_width                (1),
          .lpm_widthu               (TX_QUEUE_WIDTH[i]),
          .lpm_numwords             (TX_QUEUE_SIZE[i]), 
          .lpm_type                 ("scfifo"),
          .lpm_showahead            ("ON"),
          .overflow_checking        ("OFF"),
          .underflow_checking       ("OFF"),
          .use_eab                  ("ON"),
          .almost_empty_value       ('h2), //A cycle before empty is asserted.
          .add_ram_output_register  ("ON")
          ) U_tx_queue (
          .clock                    (i_tx_clk),
          .data                     (fifo_wr_eop_d1),
          .wrreq                    (fifo_wr_en_d1[i] && ~fifo_full[i]),
          .rdreq                    (fifo_rd_en[i]), 
          .empty                    (fifo_empty[i]),//Asserted at usedw= 1->0 & Deasserted at usedw = 2->3
          .full                     (fifo_full[i]),//Asserted at usedw = queuezise --> 0
          .q                        (fifo_rd_eop_tmp[i]),
          .usedw                    (fifo_usedw[i][0 +: TX_QUEUE_WIDTH[i]]),
          .aclr                     (~i_tx_rst_n),
          //.aclr                     (1'b0),			 
          .almost_empty             (fifo_almost_empty[i]), //Asserted at usedw<almost_empty_value i.e "2->1", Deasserted at usedw=almost_empty_value i.e "1->2"
          .almost_full              (),
          //.eccstatus                (fifo_eccstatus[i]), //TODO: Exists only if ENABLE_ECC
          .sclr                     (1'b0)
          //.sclr                     (~i_tx_rst_n)			 
        );
     // end
    assign fifo_usedw[i][15:TX_QUEUE_WIDTH[i]] = 'd0;
  end

  if (NUM_QUEUES < 8)
  begin : QUEUE_DISABLED
    for(i=NUM_QUEUES; i<NUM_QUEUES_INT; i=i+1) 
    begin : QUEUE_DIS
      assign fifo_rd_data_d1[i]     = 'd0; 
      assign fifo_empty[i]          = 'd1; 
      assign fifo_full[i]           = 'd0; 
      assign fifo_usedw[i]          = 'd0; 
      assign fifo_almost_empty[i]   = 'd1; 
      assign fifo_eccstatus[i]      = 'd0;
      assign fifo_rd_eop_tmp[i]     = 'd0;
    end
  end
end
endgenerate 

//**************************************************************************************************
//                                  Read Side logic
//**************************************************************************************************

hssi_ss_resync_std #(
   .SYNC_CHAIN_LENGTH         (2),
   .WIDTH                     (1),
   .INIT_VALUE                (0)
) U_sync_pfc_tx_pri_arb (
   .clk                       (i_tx_clk), 
   .reset                     (1'b0),
   .d                         (i_pfc_tx_arb_sel),
   .q                         (pfc_tx_arb_sel_sync)
);

hssi_ss_resync_std #(
   .SYNC_CHAIN_LENGTH         (2),
   .WIDTH                     (NUM_QUEUES+1),
   .INIT_VALUE                (0)
) U_sync_rx_pfc (
   .clk                       (i_tx_clk), 
   .reset                     (1'b0),
   .d                         ({i_rx_pfc, i_rx_pause}),
   .q                         ({rx_pfc_sync, rx_pause_sync})
);

always @(posedge i_tx_clk or negedge i_tx_rst_n)
begin
  if(~i_tx_rst_n)
    pfc_tx_arb_sel_gated <= 1'b0;
  else if((|fifo_rd_eop) || ((|data_available_adv) == 1'b0))
    pfc_tx_arb_sel_gated <= pfc_tx_arb_sel_sync;
end

//************************************** RD CTRL ***************************************************
//In SOP aligned case only one fifo is read in a clock
//Stall can be in middle of packet
//In pfc to pause switch, FIFO 1-7 competes for a/rbitration and data present in the FIFO 1-7 is read.Read time is variable 
//If flow control is disabled, then the data present in the FIFO's is read and dropped
always @(posedge i_tx_clk)
begin
  if(flow_control_en_sync == 1'b0)
    tx_read_stall <= {NUM_QUEUES{1'b0}};  //Ignoring stall 
  else
    tx_read_stall <= pause_pfc_sel_sync ? rx_pfc_sync[NUM_QUEUES-1:0] : {{(NUM_QUEUES-1){1'b0}}, rx_pause_sync}; //TBD: packet boundary? 
    //tx_read_stall = pause_pfc_sel_sync ? rx_pfc_sync : {{(NUM_QUEUES-1){1'b1}}, rx_pause_sync}; 
end

generate 
begin : TX_READ_CTRL
  //always @(posedge i_tx_clk)
  //begin
  //  if(axi_mac_tx_tready_mux_d1)
  //    arb_queue_grant <= pfc_tx_arb_sel_sync ? sp_arb_queue_grant : rr_arb_queue_grant;
  //  else
  //    arb_queue_grant <= 8'b0;
  //end
  assign arb_queue_grant         =  pfc_tx_arb_sel_sync? sp_arb_queue_grant : rr_arb_queue_grant; //sel signal can be synced not gated
  for(i=0; i<NUM_QUEUES; i=i+1) 
  begin :QUEUE
    assign fifo_rd_eop[i]        =  fifo_rd_eop_tmp[i] && fifo_rd_en[i];
    //assign fifo_rd_eop[i]        =  fifo_rd_data[i].tlast && fifo_rd_en[i];
    //Reading as per scheduled queue irrespective of pfc/pause
    //assign fifo_rd_en[i]         =  arb_queue_grant[i] && ~fifo_empty[i];
    assign fifo_rd_en[i]         =  arb_queue_grant[i] && axi_mac_tx_tready_mux_d1 && ~fifo_empty[i];
    always @(posedge i_tx_clk)
    begin
      data_fifo_rd_en_a1[i] <= arb_queue_grant[i] && axi_mac_tx_tready_mux_d1;
      data_fifo_rd_en[i]    <= data_fifo_rd_en_a1[i]; 
    end
    
    //Reading Q1-Q7 irrespective of grant
    //assign fifo_rd_en[i]         =  (~rd_pfc_sel_sync && i>0) ? ~fifo_empty[i] : (arb_queue_grant[i] && axi_mac_tx_tready_mux_d1 && ~fifo_empty[i]);
    
    //This is to consider the case where fifo becomes empty in the middle of the packet to hold the request
    //ALMOST FULL FUNCTIONAL TIMING:When the almost_empty_value is set too low, it is possible to observe that 
    //                              SCFIFO asserts the empty signal without asserting the almost_emtpy signal.
    //Effect on SP: This will add a cycle after fifo_empty is deasserted.Afterwards, all packets are read continuously.
    //Effect on RR: No issue since top_prirority_reg will be at updated at every EOP though the data_available is high throughout.
    always @(posedge i_tx_clk or negedge i_tx_rst_n)
    begin
      if(~i_tx_rst_n)
         data_available[i] <= 1'b0;
      else if(fifo_rd_eop[i]) 
      begin
        if(tx_read_stall[i])
          data_available[i] <= 1'b0;
        else
          data_available[i] <= ~fifo_almost_empty[i]; //if FIFO is aempty then there is only one word (EOP) is present, after that sch goes to new Q
      end
      else if(~fifo_empty[i] && ~tx_read_stall[i])
        data_available[i] <= 1'b1;
    end

    assign data_available_adv[i] = ((fifo_almost_empty[i] || tx_read_stall[i]) && fifo_rd_eop[i]) ? 1'b0 : data_available[i];
  end
  //disabled queues
  if (NUM_QUEUES < 8)
  begin : QUEUE_DISABLED
    for(i=NUM_QUEUES; i<NUM_QUEUES_INT; i=i+1) 
    begin : QUEUE_DIS
      assign fifo_rd_eop[i] = 'd0; 
      assign fifo_rd_en[i]  = 'd0; 
      assign data_available_adv[i]  = 'd0; 
      always @(posedge i_tx_clk)
      begin
          data_available[i]   <= 'd0; 
          data_fifo_rd_en[i]  <= 'd0;
      end
    end
  end
end
endgenerate

//**************************************************************************************************
//                              Read Scheduler (SP & DWRR)
//**************************************************************************************************
hssi_ss_f_pfc_sopa_arbiter  # ( 
  .NUM_REQUESTERS         (NUM_QUEUES_INT),
  .SCHEME                 ("strict-priority"), //top_prirority = 1
  .PIPELINE               (0),
  .SYNC_RESET             (1)
) U_SP_arbiter (
  .clk                    (i_tx_clk),
  .reset                  (~i_tx_rst_n),
  .request                (data_available_adv),
  //.request                (data_available | ~fifo_empty ), //If almost empty is missed at EOP. //data_available 
  .grant                  (sp_arb_queue_grant),
  .increment_top_priority (|fifo_rd_eop), //1'b0), 
  .save_top_priority      (1'b0) 
);

hssi_ss_f_pfc_sopa_arbiter  # ( 
  .NUM_REQUESTERS         (NUM_QUEUES_INT),
  .SCHEME                 ("round-robin"),
  .PIPELINE               (0),
  .SYNC_RESET             (1)
) U_RR_arbiter (
  .clk                    (i_tx_clk),
  .reset                  (~i_tx_rst_n),
  .request                (data_available_adv), 
  //.request                (data_available), 
  .grant                  (rr_arb_queue_grant),
  .increment_top_priority (|fifo_rd_eop), //top_prirority_reg will be updated at SOP. This signal has higer priority
  .save_top_priority      (1'b0) 
);

//************************************** RD DATA *****************************************************
always@(posedge i_tx_clk)
begin
  fifo_rd_en_any_d2 <= (|data_fifo_rd_en_d1); 
  fifo_rd_en_any_d3 <= fifo_rd_en_any_d2; 
end

always@(posedge i_tx_clk or negedge i_tx_rst_n)
begin
  if(~i_tx_rst_n) 
    fifo_rd_any_sop_d3 <= 1'b1;
  else if(fifo_rd_any_eop_d3)
    fifo_rd_any_sop_d3 <= 1'b1;
  else if(fifo_rd_en_any_d3)
    fifo_rd_any_sop_d3 <= 1'b0;
end    

always@(posedge i_tx_clk or negedge i_tx_rst_n)
begin
  if(~i_tx_rst_n) 
    fifo_rd_valid_gate_d4 <= 1'b0;
  else if(fifo_rd_any_eop_d3)
    fifo_rd_valid_gate_d4 <= 1'b0;    
  else if(fifo_rd_any_sop_d3 && fifo_rd_en_any_d3) 
    fifo_rd_valid_gate_d4 <= 1'b1;
end     

assign o_axi_mac_tx_tvalid = fifo_rd_valid_gate_d4 || fifo_rd_any_eop_d4;
assign fifo_rd_any_eop_d3 = axi_mac_tx_fifo_tlast & fifo_rd_en_any_d3;

//Combo MUX cause timing issues
always@(posedge i_tx_clk or negedge i_tx_rst_n)
begin
  if(~i_tx_rst_n) 
  begin
    //fifo_rd_any_eop_a1     <= 'h0;
    //fifo_rd_any_eop_d0     <= 'h0;
    //fifo_rd_any_eop_d1     <= 'h0;
    //fifo_rd_any_eop_d2     <= 'h0;
    //fifo_rd_any_eop_d3     <= 'h0;
    fifo_rd_any_eop_d4     <= 'h0;
        //
    axi_mac_tx_fifo_tdata  <= 'h0; 
    axi_mac_tx_fifo_tkeep  <= 'h0; 
    axi_mac_tx_fifo_tuser  <= 'h0; 
    axi_mac_tx_fifo_tlast  <= 'h0;
    //axi_mac_tx_fifo_tvalid <= 'h0;
    axi_mac_tx_fifo_ttrunc <= 'h0;
    fifo_rd_data_d2        <= 'd0;
    data_fifo_rd_en_d1     <= 'd0;
    data_fifo_rd_en_d2     <= 'd0;
  end else 
  begin
        //fifo_rd_any_eop_a1       <= |fifo_rd_eop;
        //fifo_rd_any_eop_d0       <= fifo_rd_any_eop_a1;
        //fifo_rd_any_eop_d1       <= fifo_rd_any_eop_d0;
        //fifo_rd_any_eop_d2       <= fifo_rd_any_eop_d1;
        //fifo_rd_any_eop_d3       <= fifo_rd_any_eop_d2;
        fifo_rd_any_eop_d4       <= fifo_rd_any_eop_d3;
        fifo_rd_data_d2          <= fifo_rd_data_d1;
        data_fifo_rd_en_d1       <= data_fifo_rd_en & (~data_fifo_empty); 
        data_fifo_rd_en_d2       <= data_fifo_rd_en_d1;
        //
    //axi_mac_tx_fifo_tvalid <= |fifo_rd_en;
    //Doesn't matter though
    for(int k=0; k<NUM_QUEUES; k=k+1)
     begin
      if(data_fifo_rd_en_d2[k])
      begin
        axi_mac_tx_fifo_tdata  <= fifo_rd_data_d2[k].tdata; 
        axi_mac_tx_fifo_tkeep  <= fifo_rd_data_d2[k].tkeep; 
        axi_mac_tx_fifo_tuser  <= fifo_rd_data_d2[k].tuser; 
        axi_mac_tx_fifo_tlast  <= fifo_rd_data_d2[k].tlast;
        axi_mac_tx_fifo_ttrunc <= fifo_rd_data_d2[k].ttrunc;
      end
    end
  end
end

/*
generate
genvar k;
for(k=0; k<NUM_QUEUES; k=k+1)
begin
  always@(*) 
  begin
    axi_mac_tx_tvalid = |(fifo_rd_en); 
    axi_mac_tx_tdata  = arb_queue_grant[k] ? fifo_rd_data[k].tdata :'hzz; 
    axi_mac_tx_tkeep  = arb_queue_grant[k] ? fifo_rd_data[k].tkeep :'hzz; 
    axi_mac_tx_tuser  = arb_queue_grant[k] ? fifo_rd_data[k].tuser :'hzz; 
    axi_mac_tx_tlast  = arb_queue_grant[k] ? fifo_rd_data[k].tlast :'hzz;
  end
end
endgenerate

always @(posedge i_tx_clk or negedge i_tx_rst_n)
begin
  if(~i_tx_rst_n)
  begin
    axi_mac_tx_fifo_tvalid <= 'd0;
    axi_mac_tx_fifo_tdata  <= 'd0; 
    axi_mac_tx_fifo_tkeep  <= 'd0; 
    axi_mac_tx_fifo_tuser  <= 'd0; 
    axi_mac_tx_fifo_tlast  <= 'd0;
  end
  else
  begin
    axi_mac_tx_fifo_tvalid <= axi_mac_tx_tvalid;
    if(axi_mac_tx_tvalid)
    begin
      axi_mac_tx_fifo_tdata  <= axi_mac_tx_tdata; 
      axi_mac_tx_fifo_tkeep  <= axi_mac_tx_tkeep; 
      axi_mac_tx_fifo_tuser  <= axi_mac_tx_tuser; 
      axi_mac_tx_fifo_tlast  <= axi_mac_tx_tlast;
    end
  end
end
*/

//********************************************************************************************
//**************************  Flow control Mux ***********************************************
//********************************************************************************************

//1. FC Enabled : AXI AVMM Bridge Ready Latency = USER ready Latency + 1 (mac ready dly) + 1 (fifo mux dly) + 1 (data mux dly)
//2. FC Disabled : AXI AVMM Bridge Ready Latency = USER ready Latency + 2(mac ready dly) + 1 (data mux dly) 

//always @(posedge i_tx_clk)
//begin
//  if(axi_mac_tx_fifo_tvalid && ~flow_control_en_sync)   //gating 1 to 0 change
//  begin
//    if(axi_mac_tx_tready_mux_d2 && axi_mac_tx_fifo_tlast)
//      tx_fc_en_sel <= 1'b0;
//  end
//  else if(i_axi_app_tx_tvalid && flow_control_en_sync) // gating 0 to 1 change
//  begin
//    if(axist_tx_tready_delayed && i_axi_app_tx_tlast)
//      tx_fc_en_sel <= 1'b1;
//  end
//  else
//      tx_fc_en_sel <= flow_control_en_sync;
//end


//read from FIFO_0, stall=0, ready to user is generated at (READY_LATENCY) like bridge

always @(posedge i_tx_clk)
begin
  //if(tx_fc_en_sel == 1'b0)  //this works only for zero user ready latency
  //begin
  //  o_axi_mac_tx_tvalid <= i_axi_app_tx_tvalid;
  //  o_axi_mac_tx_tdata  <= i_axi_app_tx_tdata;
  //  o_axi_mac_tx_tkeep  <= i_axi_app_tx_tkeep;
  //  o_axi_mac_tx_tlast  <= i_axi_app_tx_tlast;
  //  o_axi_mac_tx_tuser  <= i_axi_app_tx_tuser;
  //end
  //else
  //begin
    //o_axi_mac_tx_tvalid <= axi_mac_tx_fifo_tvalid;
    o_axi_mac_tx_tdata  <= axi_mac_tx_fifo_tdata;
    o_axi_mac_tx_tkeep  <= axi_mac_tx_fifo_tkeep;
    o_axi_mac_tx_tlast  <= axi_mac_tx_fifo_tlast;
    o_axi_mac_tx_ttrunc <= axi_mac_tx_fifo_ttrunc;
    o_axi_mac_tx_tuser  <= axi_mac_tx_fifo_tuser;
  //end
end

//**************************************************************************************************
//                                  TX Queue Statistics
//**************************************************************************************************
//Counter Instantiation

//assign pkt_stat_snap_shot  = i_reconfig_read && (i_reconfig_address == i_reconfig_address_d1); //& (i_reconfig_address == PKT_STAT_COUNT_START);
assign pkt_stat_snap_shot  = i_rdreq_latch;
assign pkt_stat_clear      = i_pfc_tx_stat_clear; 

always @(posedge i_reconfig_clk) begin
  i_reconfig_address_d1   <= i_reconfig_address;
  pkt_stat_snap_shot_hold <= pkt_stat_snap_shot;
  pkt_stat_clear_hold     <= pkt_stat_clear;
end

hssi_ss_resync_std #(
   .SYNC_CHAIN_LENGTH         (2),
   .WIDTH                     (2),
   .INIT_VALUE                (0)
) U_tx_pkt_stat_snapshot (
   .clk                       (i_tx_clk), 
   .reset                     (1'b0),
   .d                         ({pkt_stat_clear_hold, pkt_stat_snap_shot_hold}),
   .q                         ({pkt_stat_clear_sync, pkt_stat_snapshot})
);

always @(posedge i_tx_clk) begin
  pkt_stat_snapshot_d     <= pkt_stat_snapshot;
  pkt_stat_clear_sync_d   <= pkt_stat_clear_sync;
end

assign pkt_stat_snapshot_pedge  = pkt_stat_snapshot & ~pkt_stat_snapshot_d;
assign pkt_stat_clear_sync_pedge  = pkt_stat_clear_sync & ~pkt_stat_clear_sync_d;

generate 
begin: TX_COUNTER
  for(i=0; i< NUM_QUEUES; i=i+1) 
  begin : QUEUE
    /*pfc_q_stat_count #( 
      .LANES(1)
    ) U_tx_pkt_cnt (
      .clk         (i_tx_clk),
      .resetn      (i_tx_rst_n),
      .clear_count (), //Clear
      .stat_cnt_inc(fifo_full[i] && axi_parser_tx_tlast), 
      .stat_count  (tx_buf_drop_pkt_cntr[i])
    );*/

//PFC - if one q is full, ready might still be high since writes to other queues are possible and if the user still sends data to the q that is full, we drop the packects and incr stat cntr
    always @(posedge i_tx_clk or negedge i_tx_rst_n) begin
      if (~i_tx_rst_n) 
        tx_buf_drop_pkt_cntr[i] <= 16'h0;
      //else if (pkt_stat_clear_sync_pedge)
      else if (pkt_stat_clear_sync)
        tx_buf_drop_pkt_cntr[i] <= 16'h0;
      else if(tx_buf_drop_pkt_cntr[i] == 16'hFFFF)
        tx_buf_drop_pkt_cntr[i] <= tx_buf_drop_pkt_cntr[i]; 
      else if (~tx_tvalid_gate_d1 && tx_tlast_truncation_flg && axi_parser_tx_tlast_d1 && axi_parser_tx_tvalid_d1 && axist_tx_tready_parser_delayed_d1 && (tx_queue_no_d1 == i)) //else if (fifo_full[i] && axi_parser_tx_tlast)
        tx_buf_drop_pkt_cntr[i] <= tx_buf_drop_pkt_cntr[i] + 1'd1;
    end

    always @(posedge i_tx_clk or negedge i_tx_rst_n) begin
      if (~i_tx_rst_n) 
        o_tx_buf_drop_pkt_cntr[i] <= 16'h0;
      else if (pkt_stat_snapshot_pedge) 
        o_tx_buf_drop_pkt_cntr[i] <= tx_buf_drop_pkt_cntr[i];
    end
  end
  //disabled queues
  if (NUM_QUEUES < 8)
  begin : QUEUE_DISABLED_STAT_CNT
    for(i=NUM_QUEUES; i<NUM_QUEUES_INT; i=i+1) 
    begin : QUEUE_DIS_STAT_CNT
      always @(posedge i_tx_clk or negedge i_tx_rst_n)
      begin
        if(~i_tx_rst_n) 
          tx_buf_drop_pkt_cntr[i]   <= 16'h0;
        else
          tx_buf_drop_pkt_cntr[i]   <= 16'h0;
      end
    end
  end    
end
endgenerate

//**************************************************************************************************
//                              SIM_EMULATE = 1
//**************************************************************************************************
/*
integer fp;
integer fp1;
integer tx_queue_file_out [0:NUM_QUEUES-1];
integer tx_queue_file_in  [0:NUM_QUEUES-1];
integer tx_queue_timestamp_file_out [0:NUM_QUEUES-1];
integer tx_queue_timestamp_file_in  [0:NUM_QUEUES-1];
integer file_out [0:NUM_QUEUES-1];
integer file_in  [0:NUM_QUEUES-1];
string  value_in;
string  value_out;

wire [2:0]        arb_rd_queue_no; 
reg  [2:0]        arb_rd_queue_no_d1; 
reg  [2:0]        arb_rd_queue_no_d2; 

// synthesis translate_off
assign arb_rd_queue_no = $clog2(arb_queue_grant);
// synthesis translate_on

generate 
if (SIM_EMULATE ==1 ) begin: IO_FILE_TX_DUMP
  initial begin
    fp = $fopen ( "axi_sopa_tx_input.txt", "w" );
    fp1 = $fopen ( "axi_sopa_tx_output.txt", "w" );
  end
  always @ (posedge i_tx_clk ) begin: QUEUE
    arb_rd_queue_no_d1 <= arb_rd_queue_no;
    arb_rd_queue_no_d2 <= arb_rd_queue_no_d1;
    $fwrite ( fp, "%h %h %h %h %h %h \n",tx_queue_no, axi_parser_tx_tdata, axi_parser_tx_tvalid, axi_parser_tx_tkeep, axi_parser_tx_tuser, axi_parser_tx_tlast );
    $fwrite ( fp1, "%h %h %h %h %h %h \n",arb_rd_queue_no_d2, o_axi_mac_tx_tdata, o_axi_mac_tx_tvalid, o_axi_mac_tx_tkeep, o_axi_mac_tx_tuser, o_axi_mac_tx_tlast);
  end
end
endgenerate    
  
generate 
if (SIM_EMULATE ==1 ) begin: TX_QUEUE_OUTPUT
  for (i=0; i< NUM_QUEUES; i=i+1) begin: TX
    initial begin
      tx_queue_file_out[i]  = $fopen($sformatf("axi_sopa_tx_queue_out%0d.txt", i), "w");
      tx_queue_timestamp_file_out[i]  = $fopen($sformatf("axi_sopa_tx_timestamp_queue_out%0d.txt", i), "w");
    end
    always @ (posedge i_tx_clk ) begin : QUEUE
      if (arb_rd_queue_no_d2 == i) begin //Showahead 
        $fwrite ( tx_queue_timestamp_file_out[i], "%t \n",$time);
        $fwrite ( tx_queue_file_out[i], "%h %h %h %h %h %h \n",arb_rd_queue_no_d2, o_axi_mac_tx_tdata, o_axi_mac_tx_tvalid, o_axi_mac_tx_tkeep, o_axi_mac_tx_tuser, o_axi_mac_tx_tlast);
      end
    end
  end
end
endgenerate

generate 
if (SIM_EMULATE ==1 ) begin: TX_QUEUE_INPUT
  for (i=0; i< NUM_QUEUES; i=i+1) begin: TX
    initial begin
      tx_queue_file_in[i]  = $fopen($sformatf("axi_sopa_tx_queue_in%0d.txt", i), "w");
      tx_queue_timestamp_file_in[i]  = $fopen($sformatf("axi_sopa_tx_timestamp_queue_in%0d.txt", i), "w");
    end
    always @ (posedge i_tx_clk ) begin: QUEUE
      if (fifo_wr_en[i] && ~fifo_full[i]) begin //Taking only with VALID WR_EN
          $fwrite ( tx_queue_timestamp_file_in[i], "%t \n",$time);
          $fwrite ( tx_queue_file_in[i], "%h %h %h %h %h %h \n",tx_queue_no_d1, axi_parser_tx_tdata_d1, axi_parser_tx_tvalid_d1, axi_parser_tx_tkeep_d1, axi_parser_tx_tuser_d1, axi_parser_tx_tlast_d1 );
      end
    end
  end
end
endgenerate
*/

endmodule



`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6yur7Wc7l7w+CM4TPQC8jrzCq4An4dfCsv53kLYR/GPKoMlA1okQUHvLBPzVYBYmuJlEYmN7NVbJrDVJdP1xghA7jXuf5Km2Nle4/vFV28y9d/lqj9V67BWDPlEx+qI1EYXi2oORzJ1/obw04in3e2TiwSwGo44lWHWSpxw3bdZ0W791D9lql2ODxTjuyTN/og8AGuRxJgh9uYzjOX7pTt0HAsZNVerln/MbZM0icqA6hUBkFu95qEX/F4OUkt0ccwNrtTw5WnFvLEBDf8gOzCqLxfz3frnDlhG/uEz5EBN/TcNjBKoWrpoBIQeChX0YHrTsjqgvWj8suUoGdxbpcySBwAeJ5nvj2Y/bR/m233otkgfJkbnTgeAAxz3jUDTQeYEt/h40xH0NdO5AOZPbrhGs3a1XbyTufaPI9Ih5h3rQ+dGxTHe/Pq/WZ0xI6y+YMcZBJehgtAwqb132oE1veiHl8mArYN/pwth/hIQchvkzMU65oJR+9Mn0t2HALZUINCsbEnX51YSnb9Xp9F3uNZyi4PBY69Y0l4DeltAjwIuxkujvB1VlsLgfYq5ZX8mHNGDJ3+1LnbH1JNBVSIxL1bZv/f6fW1s74jKsd1bujIQhjnkYlJLfBOGGbWTubAKS+BBQk38CRYLDJ+Se7qrTKIi3qY6QUa7VY29+EcPxJnnm+MQOHE+1q5s11/BsFMvXkhB2j0zcKO/i2RAjB+NtBIP7Tp+B4WqtG1aW7OWCipQPgHfo8GxueDjAdlDdJlHrXf5yrFJhKCdcACbmxuedREZQ"
`endif