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
// Module            : hssi_ss_f_pfc_sopa_rx.sv
// Description       : 
// Author            : 
// Created           : 
// Changes           : 
// Keywors           : TODO TBD FIXME
// ==========================================================================

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module hssi_ss_f_pfc_sopa_rx #(
  parameter AXI_DATA_WIDTH                                        = 64,
  parameter AXI_NUM_BYTES                                         = 8,
  parameter AXI_TUSER_WIDTH                                       = 7,   //Including parity if enabled
  parameter AXI_READY_LATENCY                                     = 0,
  
  parameter NUM_QUEUES                                            = 2,
  parameter QUEUE_WIDTH                                           = 3,
  
  parameter [31:0] RX_QUEUE_SIZE      [8-1:0]                     = '{default:512}, //Queue size interms of no of words (word length = data_width). 
  parameter [31:0] RX_QUEUE_WIDTH     [8-1:0]                     = '{default:9}, 
  
  // parameter ENABLE_ECC                                            = 0,
  parameter PREAMBLE_EN                                           = 0,
  parameter SIM_EMULATE                                           = 1
) (
  // PFC control from CSR 
  input                                                           i_reconfig_clk,
  input                                                           i_reconfig_read,
  input [7:0]                                                     i_reconfig_address,
  input                                                           i_rdreq_latch,
  input                                                           i_wrreq_latch,
  input                                                           i_pause_pfc_sel,  //1'b0 - Pause; 1'b1 - PFC
  input                                                           i_flow_cntrol_en, //1'b0 - Bypass PFC; 1'b1 - PFC
  input                                                           i_pfc_rx_arb_sel, //1'b0 - Roundrobin; 1'b1 - Strict Priority
  input          [NUM_QUEUES-1:0][5:0]                            i_pfc_rx_high_th_cfg,
  input          [NUM_QUEUES-1:0][5:0]                            i_pfc_rx_low_th_cfg,
  input                                                           i_pfc_rx_stat_clear,
  input                                                           i_preamble_pass_thr_en,
    
  //AXI ST RX, HSSI side interface                                  
  input                                                           i_rx_clk, 
  input                                                           i_rx_rst_n,                       
  input                                                           i_axi_app_rx_tvalid,
  input          [AXI_DATA_WIDTH-1:0]                             i_axi_app_rx_tdata,
  input          [AXI_NUM_BYTES-1:0]                              i_axi_app_rx_tkeep,
  input                                                           i_axi_app_rx_tlast,  
  input          [AXI_TUSER_WIDTH-1:0]                            i_axi_app_rx_tuser, 
  //AXI ST RX, User side interface     
  output  reg                                                     o_axi_app_rx_tvalid,
  output  reg    [AXI_DATA_WIDTH-1:0]                             o_axi_app_rx_tdata,
  output  reg    [AXI_NUM_BYTES-1:0]                              o_axi_app_rx_tkeep,
  output  reg                                                     o_axi_app_rx_tlast,  
  // output  reg                                                     o_axi_app_rx_ttrunc,  
  output  reg    [AXI_TUSER_WIDTH-1:0]                            o_axi_app_rx_tuser, 
  output  reg                                                     o_axi_app_rx_tlast_buf_pkt_truncation,
  // output  reg    [NUM_QUEUES-1:0]                                 o_axi_app_rx_tlast_buf_pkt_truncation,
  
  //Control signal from User
  input          [NUM_QUEUES-1:0]                                 i_app_rx_eop_stall,
  //Control signal to MAC side
  output  reg                                                     o_tx_pause,
  output  reg    [NUM_QUEUES-1:0]                                 o_tx_pfc,
  //Rx Pkt stats
  output  reg    [NUM_QUEUES-1:0] [15:0]                          o_rx_buf_drop_pkt_cntr //In the event where the queue is full, non completed packet will be truncated and tlast_buf_pkt_truncation signal will be asserted at EOP. Any subsequent packet drop due to queue full will be counted in the PFC Rx statistic CSR. 
);

localparam NUM_QUEUES_INT                                         = 8;
localparam FIFO_DATA_WIDTH                                       = AXI_DATA_WIDTH + AXI_NUM_BYTES + AXI_TUSER_WIDTH + 2; //dw+tkeep+tuser incl parity+tlast+ttrunc

typedef struct packed {
  logic                          ttrunc;  
  logic                          tlast;  
  logic  [AXI_TUSER_WIDTH-1:0]   tuser; 
  logic  [AXI_NUM_BYTES-1:0]     tkeep;
  logic  [AXI_DATA_WIDTH-1:0]    tdata;
} fifo_bus_per_queue; 
typedef fifo_bus_per_queue [NUM_QUEUES_INT-1:0] fifo_bus; 

//**************************************************************************************************
//                             Wires and regs  
//**************************************************************************************************

// Parser Signals     
wire                                                             axi_parser_rx_tvalid;
wire [AXI_DATA_WIDTH-1:0]                                        axi_parser_rx_tdata;
wire [AXI_NUM_BYTES-1:0]                                         axi_parser_rx_tkeep;
wire                                                             axi_parser_rx_tlast;  
wire [AXI_TUSER_WIDTH-1:0]                                       axi_parser_rx_tuser; 
wire [2:0]                                                       rx_packet_pcp; //Priority from VLAN TAG  
wire [2:0]                                                       rx_queue_no_tmp; 
wire [QUEUE_WIDTH-1:0]                                           rx_queue_no; 
reg                                                              axi_parser_rx_tstart;
wire                                                             axi_parser_rx_not_inprog;
reg                                                              axi_parser_rx_tvalid_d1;
reg  [AXI_DATA_WIDTH-1:0]                                        axi_parser_rx_tdata_d1;
reg  [AXI_NUM_BYTES-1:0]                                         axi_parser_rx_tkeep_d1;
reg                                                              axi_parser_rx_tlast_d1;  
reg  [AXI_TUSER_WIDTH-1:0]                                       axi_parser_rx_tuser_d1;
reg  [QUEUE_WIDTH-1:0]                                           rx_queue_no_d1; 
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
wire fifo_bus                                                    fifo_rd_data_d1;
     fifo_bus                                                    fifo_rd_data_d2;
wire [NUM_QUEUES_INT-1:0]                                        fifo_empty;
wire [NUM_QUEUES_INT-1:0]                                        fifo_full; 
wire [NUM_QUEUES_INT-1:0]                                        fifo_almost_empty;
wire [NUM_QUEUES_INT-1:0][1:0]                                   fifo_eccstatus;
wire [NUM_QUEUES_INT-1:0][16-1:0]                                fifo_usedw; //For 2048 entries. Choosing the max
// wire [NUM_QUEUES_INT-1:0][RX_QUEUE_WIDTH-1:0]                    fifo_usedw; 
wire [NUM_QUEUES_INT-1:0]                                        fifo_rd_eop; 

wire [NUM_QUEUES_INT-1:0]                                        fifo_rd_eop_tmp;
reg  [NUM_QUEUES_INT-1:0]                                        data_fifo_rd_en_a1;
reg  [NUM_QUEUES_INT-1:0]                                        data_fifo_rd_en;
wire [NUM_QUEUES_INT-1:0]                                        data_fifo_empty;
wire [NUM_QUEUES_INT-1:0]                                        data_fifo_full; 
wire [NUM_QUEUES_INT-1:0]                                        data_fifo_almost_empty;
wire [NUM_QUEUES_INT-1:0][1:0]                                   data_fifo_eccstatus;

reg                                                              axi_app_rx_fifo_tvalid;
reg   [AXI_DATA_WIDTH-1:0]                                       axi_app_rx_fifo_tdata; 
reg   [AXI_NUM_BYTES-1:0]                                        axi_app_rx_fifo_tkeep;
reg                                                              axi_app_rx_fifo_tlast;
reg   [AXI_TUSER_WIDTH-1:0]                                      axi_app_rx_fifo_tuser; 
reg                                                              axi_app_rx_fifo_ttrunc;

//CSR Signals
wire                                                             flow_control_en_sync, pause_pfc_sel_sync, preamble_pass_thr_en_sync;
reg                                                              rx_fc_en_sel;
reg                                                              pause_pfc_sel_wr_gated;
reg                                                              pause_pfc_sel_rd_gated;
reg                                                              flow_control_en_wr_gated;
reg                                                              pfc_rx_arb_sel_sync;
reg                                                              pfc_rx_arb_sel_gated;
reg  [NUM_QUEUES-1:0][5:0]                                       pfc_rx_high_th_cfg_sync;
reg  [NUM_QUEUES-1:0][5:0]                                       pfc_rx_low_th_cfg_sync;

//Arbiter Signals
wire [NUM_QUEUES_INT-1:0]                                        arb_queue_grant; 
wire [NUM_QUEUES_INT-1:0]                                        sp_arb_queue_grant; 
wire [NUM_QUEUES_INT-1:0]                                        rr_arb_queue_grant; 
reg  [NUM_QUEUES-1:0]                                            rx_read_stall;   
  
//Truncation Signals
reg                                                              fifo_wr_eop;
reg                                                              fifo_wr_eop_d1;
reg                                                              rx_tvalid_gate_d1;
reg                                                              rx_tlast_truncation_d1; //Dummy EOP pulse
reg                                                              rx_tlast_truncation_wen_d1; //Dummy EOP pulse
reg                                                              rx_tlast_truncation_flg; //Dummy EOP pulse
reg [NUM_QUEUES-1:0] [15:0]                                      rx_buf_drop_pkt_cntr; 
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
  .AXI_DATA_WIDTH                     (AXI_DATA_WIDTH                     ),
  .AXI_NUM_BYTES                      (AXI_NUM_BYTES                      ),
  .AXI_TUSER_WIDTH                    (AXI_TUSER_WIDTH                    )  
) U_RX_Parser_DUT (
  .i_clk                              (i_rx_clk                           ),
  .i_rst_n                            (i_rx_rst_n                         ),
  // .i_preamble_pass_thr_en             (PREAMBLE_EN ? 1'b1 : 1'b0          ), //TODO: CSR Config
  .i_preamble_pass_thr_en             (preamble_pass_thr_en_sync          ), 
  .i_axi_tvalid                       (i_axi_app_rx_tvalid                ),
  .i_axi_tdata                        (i_axi_app_rx_tdata                 ),
  .i_axi_tkeep                        (i_axi_app_rx_tkeep                 ),
  .i_axi_tuser                        (i_axi_app_rx_tuser                 ),
  .i_axi_tlast                        (i_axi_app_rx_tlast                 ),
  .i_axi_tready                       (1'b1                               ),
  .o_packet_pcp                       (rx_packet_pcp                      ),
  .o_axi_tvalid                       (axi_parser_rx_tvalid               ),
  .o_axi_tdata                        (axi_parser_rx_tdata                ),
  .o_axi_tkeep                        (axi_parser_rx_tkeep                ),
  .o_axi_tuser                        (axi_parser_rx_tuser                ),
  .o_axi_tlast                        (axi_parser_rx_tlast                ),
  .o_axi_tready                       ()
);
  
assign axi_parser_rx_not_inprog = axi_parser_rx_tstart && ~axi_parser_rx_tvalid;

always @(posedge i_rx_clk or negedge i_rx_rst_n) //3 cycles
begin
  if(~i_rx_rst_n)
    pause_pfc_sel_wr_gated <= 1'b0;
  else if(axi_parser_rx_tvalid && axi_parser_rx_tlast)
    pause_pfc_sel_wr_gated <= pause_pfc_sel_sync; //At SOP aligned
  else if(axi_parser_rx_not_inprog)
    pause_pfc_sel_wr_gated <= pause_pfc_sel_sync; //At SOP aligned

end

always @(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n)
    flow_control_en_wr_gated <= 1'b1;
  else if(axi_parser_rx_tvalid && axi_parser_rx_tlast)
    flow_control_en_wr_gated <= flow_control_en_sync; //At SOP aligned
  else if(axi_parser_rx_not_inprog)
    flow_control_en_wr_gated <= flow_control_en_sync; //At SOP aligned  
end

assign rx_queue_no_tmp = (~pause_pfc_sel_wr_gated || ~flow_control_en_wr_gated) ? 3'd0 : rx_packet_pcp; 
assign rx_queue_no     = (rx_queue_no_tmp > (NUM_QUEUES-1))? '0: rx_queue_no_tmp[QUEUE_WIDTH-1:0];

//***************************************************************************************************************************
//    Case A: tlast never arrives(Dummy EOP asserted & written in FIFO at FIFO_DEPTH-1.Any writes thereafter are discared & stats updated accordingly.
//    Case B: tlast at FIFO_DEPTH-1(Considered as normal transaction)
//    Case C: tlast at middle of FIFO_DEPTH(Normal transaction)
//**************************************************************************************************
always @(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n)
    axi_parser_rx_tstart <= 1'b1;
  else if(axi_parser_rx_tvalid && axi_parser_rx_tlast)
    axi_parser_rx_tstart <= 1'b1;
  else if(axi_parser_rx_tvalid)
    axi_parser_rx_tstart <= 1'b0;
end    


//at fifo_full the usedw value is 0x0, this 0x0 is causing problem in pause gen so gating wr_en before fifo_full so full case never occurs.
always @(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n) begin
    rx_tvalid_gate_d1      <= 1'b1;
    rx_tlast_truncation_d1 <= 1'b0; 
    rx_tlast_truncation_wen_d1 <= 1'b0; 
  end else if((fifo_usedw[rx_queue_no] >= (RX_QUEUE_SIZE[rx_queue_no]-8) && axi_parser_rx_tvalid)) begin //Dummy EOP inserted at POS:FIFO_DEPTH-1 & TIMESTAMP:1 cycle before full 
    rx_tvalid_gate_d1      <= 1'b0;
    rx_tlast_truncation_d1 <= ~axi_parser_rx_tlast && rx_tvalid_gate_d1;
    rx_tlast_truncation_wen_d1 <= rx_tvalid_gate_d1;
  end else if(axi_parser_rx_tvalid && axi_parser_rx_tstart) begin //Next SOP
    if(fifo_usedw[rx_queue_no] < (RX_QUEUE_SIZE[rx_queue_no]-8)) begin
      rx_tvalid_gate_d1      <= 1'b1;
      rx_tlast_truncation_d1 <= 1'b0; 
      rx_tlast_truncation_wen_d1 <= 1'b0; 
    end else begin
      rx_tvalid_gate_d1      <= 1'b0;
      rx_tlast_truncation_d1 <= 1'b0; 
      rx_tlast_truncation_wen_d1 <= 1'b0; 
    end
  end
  else begin
    rx_tvalid_gate_d1      <= rx_tvalid_gate_d1;
    rx_tlast_truncation_d1 <= 1'b0; 
    rx_tlast_truncation_wen_d1 <= 1'b0; 
  end
end
                      
always @(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n) 
     rx_tlast_truncation_flg <= 1'b0; 
  else if (rx_tvalid_gate_d1)
     rx_tlast_truncation_flg <= 1'b0; 
  else begin
     if (rx_tlast_truncation_d1)  
        rx_tlast_truncation_flg <= 1'b0;
     else if(axi_parser_rx_tvalid_d1 && axi_parser_rx_tlast_d1)  
        rx_tlast_truncation_flg <= 1'b1; 
  end
end
                      
//**************************************************************************************************
//                              Write Side logic
//**************************************************************************************************
hssi_ss_resync_std #(
   .SYNC_CHAIN_LENGTH         (2),
   .WIDTH                     (3),
   .INIT_VALUE                (0)
) U_sync_pfc_sel (
   .clk                       (i_rx_clk), 
   .reset                     (1'b0),
   .d                         ({i_flow_cntrol_en,i_pause_pfc_sel,i_preamble_pass_thr_en}), 
   .q                         ({flow_control_en_sync,pause_pfc_sel_sync,preamble_pass_thr_en_sync})
);

//**************************************************************************************************
//                                          RX Threshold
//**************************************************************************************************
assign threshold_snap_shot  = i_wrreq_latch;

always @(posedge i_reconfig_clk) begin
  threshold_snap_shot_hold <= threshold_snap_shot;
end

hssi_ss_resync_std #(
   .SYNC_CHAIN_LENGTH         (2),
   .WIDTH                     (1),
   .INIT_VALUE                (0)
) U_rx_threshold_snapshot (
   .clk                       (i_rx_clk), 
   .reset                     (1'b0),
   .d                         (threshold_snap_shot_hold),
   .q                         (threshold_snapshot)
);

always @(posedge i_rx_clk) begin
  threshold_snapshot_d     <= threshold_snapshot;
  threshold_snapshot_nedge <= threshold_snapshot_d & ~threshold_snapshot;
end


generate 
begin: RX_THRESHOLD_SYNC 
  for(i=0; i< NUM_QUEUES; i=i+1) 
  begin : QUEUE
    always @(posedge i_rx_clk or negedge i_rx_rst_n) begin
      if (~i_rx_rst_n) begin 
        pfc_rx_high_th_cfg_sync[i] <= 6'd3;
        pfc_rx_low_th_cfg_sync[i]  <= 6'd2;
      end
      else if (threshold_snapshot_nedge) begin
        pfc_rx_high_th_cfg_sync[i] <= i_pfc_rx_high_th_cfg[i];
        pfc_rx_low_th_cfg_sync[i]  <= i_pfc_rx_low_th_cfg[i];
      end
    end
  end
end
endgenerate

always @(posedge i_rx_clk) //TBD : Review
begin
  if(pause_pfc_sel_sync || ~flow_control_en_sync)
    o_tx_pause <= 1'b0;
  else if(fifo_usedw[0] >= ({10'd0,pfc_rx_high_th_cfg_sync[0]} << 7))
    o_tx_pause <= 1'b1;
  else if(fifo_usedw[0] < ({10'd0,pfc_rx_low_th_cfg_sync[0]} << 7))
    o_tx_pause <= 1'b0;
end
//o_tx_pause <= (fifo_usedw[0] < (pfc_rx_low_th_cfg_sync[0]*128)) ? 1'b0: (fifo_usedw[0] >= (pfc_rx_high_th_cfg_sync[0]*128)) ? 1'b1 && ~pause_pfc_sel_sync  : 1'b0;
  
always @(posedge i_rx_clk) 
begin
  axi_parser_rx_tvalid_d1 <=   axi_parser_rx_tvalid;
  axi_parser_rx_tdata_d1  <=   axi_parser_rx_tdata;
  axi_parser_rx_tkeep_d1  <=   axi_parser_rx_tkeep;
  axi_parser_rx_tlast_d1  <=   axi_parser_rx_tlast;  
  axi_parser_rx_tuser_d1  <=   axi_parser_rx_tuser;
  rx_queue_no_d1          <=   rx_queue_no;  
  fifo_wr_eop             <=   axi_parser_rx_tlast_d1 || rx_tlast_truncation_d1;
end

generate
begin: RX_WRITE
  
  for (i=0; i< NUM_QUEUES; i=i+1) 
  begin : QUEUE
    
    always @(posedge i_rx_clk) //TBD : Review
    begin
      if(~pause_pfc_sel_sync || ~flow_control_en_sync)
        o_tx_pfc[i] <= 1'b0;
      else if(fifo_usedw[i] >= ({10'd0,pfc_rx_high_th_cfg_sync[i]} << 7))
        o_tx_pfc[i] <= 1'b1;
      else if(fifo_usedw[i] < ({10'd0,pfc_rx_low_th_cfg_sync[i]} << 7))
        o_tx_pfc[i] <= 1'b0;
    end
    //always @(posedge i_rx_clk)
    //begin
    //  o_tx_pfc[i] <= (fifo_usedw[i] < (pfc_rx_low_th_cfg_sync[i]*128)) ? 1'b0: (fifo_usedw[i] >= (pfc_rx_high_th_cfg_sync[i]*128)) ? 1'b1 && pause_pfc_sel_sync: 1'b0;
    //end
    
    //assign fifo_wr_data[i] = {rx_tlast_truncation_d1,(axi_parser_rx_tlast_d1||rx_tlast_truncation_d1),axi_parser_rx_tuser_d1,axi_parser_rx_tkeep_d1,axi_parser_rx_tdata_d1}; 
    always @(posedge i_rx_clk or negedge i_rx_rst_n)
    begin
      if(~i_rx_rst_n) 
      begin
        fifo_wr_en_a1[i]    <= 1'b0; 
        fifo_wr_en[i]       <= 1'b0; 
        fifo_wr_en_d1[i]    <= 1'b0; 
        fifo_wr_data[i]     <= 'd0;
        fifo_wr_data_d1[i]  <= 'd0;
        fifo_wr_eop_d1      <= 'd0;
      end
      else
      begin
        fifo_wr_en_a1[i]    <= axi_parser_rx_tvalid && (rx_queue_no == i); 
        fifo_wr_en[i]       <= fifo_wr_en_a1[i] && (rx_tvalid_gate_d1 || rx_tlast_truncation_wen_d1);
        fifo_wr_en_d1[i]    <= fifo_wr_en[i]; 
        fifo_wr_data[i]     <= {rx_tlast_truncation_d1,(axi_parser_rx_tlast_d1||rx_tlast_truncation_d1),axi_parser_rx_tuser_d1,axi_parser_rx_tkeep_d1,axi_parser_rx_tdata_d1}; 
        fifo_wr_data_d1[i]  <= fifo_wr_data[i]; 
        fifo_wr_eop_d1      <= fifo_wr_eop;
      end
    end


    //always @(posedge i_rx_clk or negedge i_rx_rst_n)
    //begin
    //  if(~i_rx_rst_n) 
    //  begin
    //    fifo_wr_data[i] <= 'd0; 
    //    fifo_wr_en[i]   <= 'd0; 
    //  end else
    //  begin 
    //    fifo_wr_data[i] <= {(axi_parser_rx_tlast||rx_tlast_trunc_pulse_d1),axi_parser_rx_tuser,axi_parser_rx_tkeep,axi_parser_rx_tdata}; 
    //    if(flow_control_en_wr_gated == 1'b0)  //Disable both Pause and PFC
    //      fifo_wr_en[i] <= 1'b0;
    //    else
    //      fifo_wr_en[i] <= (~pause_pfc_sel_wr_gated && (i>0)) ? 1'b0 :  axi_parser_rx_tvalid && (rx_tlast_trunc_pulse_d1 || rx_tvalid_gate_d1) && (rx_queue_no == i); 
    //  end
    //end
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
//                              RX Buffer
//**************************************************************************************************
generate 
begin: RX_QUEUE
  for (i=0; i< NUM_QUEUES; i=i+1) 
  begin : QUEUE
     // if (ENABLE_ECC) begin : FIFO_WITH_ECC
        // dcfifo  # (
          // .enable_ecc               ("FALSE"),
          // .intended_device_family   ("Agilex"),
          // .lpm_hint                 ("RAM_BLOCK_TYPE=M20K,DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE"),
          // .lpm_width                (FIFO_DATA_WIDTH),
          // .lpm_widthu               (RX_QUEUE_WIDTH[i]),
          // .lpm_numwords             (RX_QUEUE_SIZE[i]), 
          // .lpm_type                 ("dcfifo"),
          // .lpm_showahead            ("OFF"),
          // .rdsync_delaypipe         (2),
          // .wrsync_delaypipe         (2),          
          // .overflow_checking        ("OFF"),
          // .underflow_checking       ("OFF"), 
          // .use_eab                  ("ON"),
          // .almost_empty_value       ('h2), //A cycle before empty is asserted.
          // .add_ram_output_register  ("ON")
          // ) U_rx_data_queue (
          // .data                      (fifo_wr_data[i]),
          // .rdclk                     (i_rx_clk),        
          // .rdreq                     (data_fifo_rd_en[i] && ~data_fifo_empty[i]),   
          // .wrclk                     (i_rx_clk),          
          // .wrreq                     (fifo_wr_en[i] && ~data_fifo_full[i]),
          // .q                         (fifo_rd_data_d1[i]), 
          // .rdempty                   (data_fifo_empty[i]),
          // .wrfull                    (data_fifo_full[i]),
          // .aclr                      (~i_rx_rst_n),
          // .rdfull                    (),
          // .rdusedw                   (),
          // .wrempty                   (),              
          // .wrusedw                   (),//fifo_usedw[i][0 +: RX_QUEUE_WIDTH[i]]),
          // .almost_empty              (data_fifo_almost_empty[i]), //Asserted at usedw<almost_empty_value i.e "2->1", Deasserted at usedw=almost_empty_value i.e "1->2"
          // .almost_full               (),
          // .eccstatus                 (fifo_eccstatus[i])
        // );  
     // end     
     // else begin : FIFO_WITHOUT_ECC
        dcfifo  # (
          .intended_device_family   ("Agilex"),
          .lpm_hint                 ("RAM_BLOCK_TYPE=M20K,DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE"),
          .lpm_width                (FIFO_DATA_WIDTH),
          .lpm_widthu               (RX_QUEUE_WIDTH[i]),
          .lpm_numwords             (RX_QUEUE_SIZE[i]), 
          .lpm_type                 ("dcfifo"),
          .lpm_showahead            ("OFF"),
          .rdsync_delaypipe         (2),
          .wrsync_delaypipe         (2),          
          .overflow_checking        ("OFF"),
          .underflow_checking       ("OFF"), 
          .use_eab                  ("ON"),
          .add_ram_output_register  ("ON")
          ) U_rx_data_queue (
          .data                      (fifo_wr_data_d1[i]),
          .rdclk                     (i_rx_clk),        
          .rdreq                     (data_fifo_rd_en[i] && ~data_fifo_empty[i]),   
          .wrclk                     (i_rx_clk),          
          .wrreq                     (fifo_wr_en_d1[i] && ~data_fifo_full[i]),
          .q                         (fifo_rd_data_d1[i]), 
          .rdempty                   (data_fifo_empty[i]),
          .wrfull                    (data_fifo_full[i]),
          .aclr                      (~i_rx_rst_n),
          .rdfull                    (),
          .rdusedw                   (),
          .wrempty                   (),              
          .wrusedw                   ()//fifo_usedw[i][0 +: RX_QUEUE_WIDTH[i]]),
          // .almost_empty              (data_fifo_almost_empty[i]), //Asserted at usedw<almost_empty_value i.e "2->1", Deasserted at usedw=almost_empty_value i.e "1->2"
          // .almost_full               (),
          //.eccstatus                 (fifo_eccstatus[i]),
        );
        scfifo  # (
          //.enable_ecc               (1),
          .intended_device_family   ("Agilex"),
          .lpm_hint                 ("RAM_BLOCK_TYPE=M20K"),
          .lpm_width                (FIFO_DATA_WIDTH),
          .lpm_widthu               (RX_QUEUE_WIDTH[i]),
          .lpm_numwords             (RX_QUEUE_SIZE[i]), 
          .lpm_type                 ("scfifo"),
          .lpm_showahead            ("ON"),
          .overflow_checking        ("OFF"),
          .underflow_checking       ("OFF"), 
          .use_eab                  ("ON"),
          .almost_empty_value       ('h2), //A cycle before empty is asserted.
          .add_ram_output_register  ("ON")
          ) U_rx_queue (
          .clock                     (i_rx_clk),
          .data                      (fifo_wr_eop_d1),
          .wrreq                     (fifo_wr_en_d1[i] && ~fifo_full[i]),
          .rdreq                     (fifo_rd_en[i]), 
          .empty                     (fifo_empty[i]),
          .full                      (fifo_full[i]),
          .q                         (fifo_rd_eop_tmp[i]), //fifo_rd_data[i]), //Data obtained after a cycle(Normal mode)
                                                      //Cases2Consider A: FIFO empty by the time tlast deasserted(Middle of packet) & arbiter keep is high since eop not detected.Generate dummy tlast
                                                      //                B: No tlast.Dummy tlast inserted at wr side of RX  
          .usedw                     (fifo_usedw[i][0 +: RX_QUEUE_WIDTH[i]]),
          .aclr                      (~i_rx_rst_n),
          //.aclr                      (1'b0),			 
          .almost_empty              (fifo_almost_empty[i]), //Asserted at usedw<almost_empty_value i.e "2->1", Deasserted at usedw=almost_empty_value i.e "1->2"
          .almost_full               (),
          //.eccstatus                 (fifo_eccstatus[i]),
          //.sclr                      (~i_rx_rst_n)
          .sclr                      (1'b0)			 
        );
     // end
    assign fifo_usedw[i][15:RX_QUEUE_WIDTH[i]] = 'd0;
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
//                              Read Side logic
//**************************************************************************************************
hssi_ss_resync_std #(
   .SYNC_CHAIN_LENGTH         (2),
   .WIDTH                     (1),
   .INIT_VALUE                (0)
) U_sync_pfc_rx_pri_arb (
   .clk                       (i_rx_clk), 
   .reset                     (1'b0),
   .d                         (i_pfc_rx_arb_sel),
   .q                         (pfc_rx_arb_sel_sync)
);

always @(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n)
  begin
    pfc_rx_arb_sel_gated   <= 1'b0;
    pause_pfc_sel_rd_gated <= 1'b0;
  end
  else if((|fifo_rd_eop) || ((|data_available_adv) == 1'b0))
  begin
    pfc_rx_arb_sel_gated   <= pfc_rx_arb_sel_sync;
    pause_pfc_sel_rd_gated <= pause_pfc_sel_sync;
  end
end
//******************************RD Control***********************************************************
// If flow control is disabled then the data present in the FIFO's is read and dropped
// If pause is enabled then the data present in the FIFO's Q1-Q7 is read irrespective of stall
always @(posedge i_rx_clk)
begin
  if(flow_control_en_sync == 1'b0)
    rx_read_stall <= {NUM_QUEUES{1'b0}};  //ignoring stall 
  else if(pause_pfc_sel_sync)
    rx_read_stall <= i_app_rx_eop_stall; 
  else
    rx_read_stall <= {{(NUM_QUEUES-1){1'b0}},i_app_rx_eop_stall[0]};  //ignoring stall Q1-Q7 at packet boundary
end

generate 
begin : RX_READ_CTRL
  //always @(posedge i_rx_clk)
  //begin
  //  // if(axi_mac_tx_tready_mux_d1)
  //    arb_queue_grant         <= pfc_rx_arb_sel_sync ? sp_arb_queue_grant : rr_arb_queue_grant;
  //  // else
  //    // arb_queue_grant <= 8'b0;
  //end  
  
  assign arb_queue_grant         = pfc_rx_arb_sel_sync ? sp_arb_queue_grant : rr_arb_queue_grant;
  for (i=0; i< NUM_QUEUES; i=i+1) 
  begin : QUEUE
    assign fifo_rd_eop[i]        =  fifo_rd_eop_tmp[i] && fifo_rd_en[i];
    //assign fifo_rd_eop[i]        =  fifo_rd_data[i].tlast && fifo_rd_en[i];
    assign fifo_rd_en[i]         =  arb_queue_grant[i] && ~fifo_empty[i]; 
    always @(posedge i_rx_clk)
    begin
      data_fifo_rd_en_a1[i] <= arb_queue_grant[i];
      data_fifo_rd_en[i]    <= data_fifo_rd_en_a1[i];
    end
    
    always @(posedge i_rx_clk or negedge i_rx_rst_n)
    begin
      if(~i_rx_rst_n)
         data_available[i] <= 1'b0;
      else if(fifo_rd_eop[i]) 
      begin
        if(rx_read_stall[i]) //Only at EOP check
          data_available[i] <= 1'b0;
        else
          data_available[i] <= ~fifo_almost_empty[i];
      end
      else if(~fifo_empty[i] && ~rx_read_stall[i])
        data_available[i] <= 1'b1;
    end

    assign data_available_adv[i] = ((fifo_almost_empty[i] || rx_read_stall[i]) && fifo_rd_eop[i]) ? 1'b0 : data_available[i];
  end
  //disabled queues
  if (NUM_QUEUES < 8)
  begin : QUEUE_DISABLED
    for(i=NUM_QUEUES; i<NUM_QUEUES_INT; i=i+1) 
    begin : QUEUE_DIS
      assign fifo_rd_eop[i] = 'd0; 
      assign fifo_rd_en[i]  = 'd0; 
      assign data_available_adv[i]  = 'd0; 
      always @(posedge i_rx_clk)
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
  .clk                    (i_rx_clk),
  .reset                  (~i_rx_rst_n),
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
  .clk                    (i_rx_clk),
  .reset                  (~i_rx_rst_n),
  .request                (data_available_adv), 
  //.request                (data_available), 
  .grant                  (rr_arb_queue_grant),
  .increment_top_priority (|fifo_rd_eop), //top_prirority_reg will be updated at SOP. This signal has higer priority
  .save_top_priority      (1'b0) 
);


//************************************** RD DATA *****************************************************

//Combo MUX cause timing issues
always@(posedge i_rx_clk or negedge i_rx_rst_n)
begin
  if(~i_rx_rst_n) 
  begin
     axi_app_rx_fifo_tdata  <= 'h0; 
     axi_app_rx_fifo_tkeep  <= 'h0; 
     axi_app_rx_fifo_tuser  <= 'h0; 
     axi_app_rx_fifo_tlast  <= 'h0;
     axi_app_rx_fifo_tvalid <= 'h0;
     axi_app_rx_fifo_ttrunc <= 'h0;
     fifo_rd_data_d2        <= 'd0;
     data_fifo_rd_en_d1     <= 'd0;    
     data_fifo_rd_en_d2     <= 'd0;    
  end else 
  begin
     fifo_rd_data_d2        <= fifo_rd_data_d1;
     data_fifo_rd_en_d1     <= data_fifo_rd_en & (~data_fifo_empty);  
     data_fifo_rd_en_d2     <= data_fifo_rd_en_d1;  
     axi_app_rx_fifo_tvalid <= (|data_fifo_rd_en_d2); 
    for(int k=0; k<NUM_QUEUES; k=k+1)
     begin
      if(data_fifo_rd_en_d2[k])
      begin
        axi_app_rx_fifo_tdata  <= fifo_rd_data_d2[k].tdata; 
        axi_app_rx_fifo_tkeep  <= fifo_rd_data_d2[k].tkeep; 
        axi_app_rx_fifo_tuser  <= fifo_rd_data_d2[k].tuser; 
        axi_app_rx_fifo_tlast  <= fifo_rd_data_d2[k].tlast;
        axi_app_rx_fifo_ttrunc <= fifo_rd_data_d2[k].ttrunc;
      end
    end
  end
end

//********************************************************************************************
//**************************  Flow control Mux ***********************************************
//********************************************************************************************

//1. FC Enabled : AXI AVMM Bridge Ready Latency = USER ready Latency + 1 (mac ready dly) + 1 (fifo mux dly) + 1 (data mux dly)
//2. FC Disabled : AXI AVMM Bridge Ready Latency = USER ready Latency + 2(mac ready dly) + 1 (data mux dly) 

//always @(posedge i_rx_clk)
//begin
//  if(axi_app_rx_fifo_tvalid && ~flow_control_en_sync)   //gating 1 to 0 change
//  begin
//    if(axi_app_rx_fifo_tlast)
//      rx_fc_en_sel <= 1'b0;
//  end
//  else if(i_axi_app_rx_tvalid && flow_control_en_sync) // gating 0 to 1 change
//  begin
//    if(i_axi_app_rx_tlast)
//      rx_fc_en_sel <= 1'b1;
//  end
//  else
//      rx_fc_en_sel <= flow_control_en_sync;
//end

always @(posedge i_rx_clk)
begin
  //if(rx_fc_en_sel == 1'b0)
  //begin
  //  o_axi_app_rx_tvalid <= i_axi_app_rx_tvalid;
  //  o_axi_app_rx_tdata  <= i_axi_app_rx_tdata;
  //  o_axi_app_rx_tkeep  <= i_axi_app_rx_tkeep;
  //  o_axi_app_rx_tlast  <= i_axi_app_rx_tlast;
  //  o_axi_app_rx_ttrunc <= 1'b0;
  //  o_axi_app_rx_tuser  <= i_axi_app_rx_tuser;
  //end
  //else
  //begin
    o_axi_app_rx_tvalid <= axi_app_rx_fifo_tvalid;
    o_axi_app_rx_tdata  <= axi_app_rx_fifo_tdata;
    o_axi_app_rx_tkeep  <= axi_app_rx_fifo_tkeep;
    o_axi_app_rx_tlast  <= axi_app_rx_fifo_tlast;
    // o_axi_app_rx_ttrunc <= axi_app_rx_fifo_ttrunc;
    o_axi_app_rx_tlast_buf_pkt_truncation <= axi_app_rx_fifo_ttrunc;
    o_axi_app_rx_tuser  <= axi_app_rx_fifo_tuser;
  //end
end

//**************************************************************************************************
//                                  RX Queue Statistics
//**************************************************************************************************
//assign pkt_stat_snap_shot  = i_reconfig_read && (i_reconfig_address == i_reconfig_address_d1); //& (i_reconfig_address == PKT_STAT_COUNT_START);
assign pkt_stat_snap_shot  = i_rdreq_latch; 
assign pkt_stat_clear      = i_pfc_rx_stat_clear; 

always @(posedge i_reconfig_clk) begin
  i_reconfig_address_d1   <= i_reconfig_address;
  pkt_stat_snap_shot_hold <= pkt_stat_snap_shot;
  pkt_stat_clear_hold     <= pkt_stat_clear;
end

hssi_ss_resync_std #(
   .SYNC_CHAIN_LENGTH         (2),
   .WIDTH                     (2),
   .INIT_VALUE                (0)
) U_rx_pkt_stat_snapshot (
   .clk                       (i_rx_clk), 
   .reset                     (1'b0),
   .d                         ({pkt_stat_clear_hold, pkt_stat_snap_shot_hold}),
   .q                         ({pkt_stat_clear_sync, pkt_stat_snapshot})
);

always @(posedge i_rx_clk) begin
  pkt_stat_snapshot_d     <= pkt_stat_snapshot;
  pkt_stat_clear_sync_d   <= pkt_stat_clear_sync;
end

assign pkt_stat_snapshot_pedge  = pkt_stat_snapshot & ~pkt_stat_snapshot_d;
assign pkt_stat_clear_sync_pedge  = pkt_stat_clear_sync & ~pkt_stat_clear_sync_d;

generate 
begin: RX_COUNTER
  for(i=0; i< NUM_QUEUES; i=i+1) 
  begin : QUEUE
    /*pfc_q_stat_count #( 
      .LANES(1)
    ) U_rx_pkt_cnt (
      .clk         (i_rx_clk),
      .resetn      (i_rx_rst_n),
      .clear_count (), //Clear
      .stat_cnt_inc(~rx_tvalid_gate_d1 && axi_parser_rx_tlast_d1 && axi_parser_rx_tvalid_d1 && (rx_queue_no_d1 == i)), //tlas_buf_trunc is high after dummy EOP insertion
      .stat_count  (rx_buf_drop_pkt_cntr[i])
    );*/

    always @(posedge i_rx_clk or negedge i_rx_rst_n) begin
      if (~i_rx_rst_n)
        rx_buf_drop_pkt_cntr[i] <= 16'h0;
      //else if(pkt_stat_clear_sync_pedge)
      else if(pkt_stat_clear_sync)
        rx_buf_drop_pkt_cntr[i] <= 16'h0;
      else if(rx_buf_drop_pkt_cntr[i] == 16'hFFFF)
        rx_buf_drop_pkt_cntr[i] <= rx_buf_drop_pkt_cntr[i]; 
      else if (~rx_tvalid_gate_d1 && rx_tlast_truncation_flg && axi_parser_rx_tlast_d1 && axi_parser_rx_tvalid_d1 && (rx_queue_no_d1 == i)) //tlas_buf_trunc is high after dummy EOP insertion
        rx_buf_drop_pkt_cntr[i] <= rx_buf_drop_pkt_cntr[i] + 1'd1;
    end

    always @(posedge i_rx_clk or negedge i_rx_rst_n) begin
      if (~i_rx_rst_n)
        o_rx_buf_drop_pkt_cntr[i] <= 16'h0;
      else if (pkt_stat_snapshot_pedge) 
        o_rx_buf_drop_pkt_cntr[i] <= rx_buf_drop_pkt_cntr[i];
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
integer rx_queue_file_out [0:NUM_QUEUES-1];
integer rx_queue_file_in  [0:NUM_QUEUES-1];
integer rx_queue_timestamp_file_out [0:NUM_QUEUES-1];
integer rx_queue_timestamp_file_in  [0:NUM_QUEUES-1];

wire [2:0]         arb_rd_queue_no; 
reg  [2:0]         arb_rd_queue_no_d1; 
reg  [2:0]         arb_rd_queue_no_d2; 

// synthesis translate_off
assign arb_rd_queue_no = $clog2(arb_queue_grant);
// synthesis translate_on

generate 
if (SIM_EMULATE ==1 ) begin: IO_FILE_RX_DUMP
  initial begin
    fp = $fopen ( "axi_sopa_rx_input.txt", "w" );
    fp1 = $fopen ( "axi_sopa_rx_output.txt", "w" );
  end
  always @ (posedge i_rx_clk ) begin
    arb_rd_queue_no_d1    <= arb_rd_queue_no; //No combo mux 
    arb_rd_queue_no_d2 <= arb_rd_queue_no_d1;
    $fwrite ( fp, "%h %h %h %h %h %h \n", rx_queue_no,  axi_parser_rx_tdata, axi_parser_rx_tvalid,axi_parser_rx_tkeep,axi_parser_rx_tuser,axi_parser_rx_tlast);
    $fwrite ( fp1, "%h %h %h %h %h %h \n", arb_rd_queue_no_d2, o_axi_app_rx_tdata, o_axi_app_rx_tvalid, o_axi_app_rx_tkeep, o_axi_app_rx_tuser, o_axi_app_rx_tlast);
  end
end
endgenerate    
  
generate 
if (SIM_EMULATE ==1 ) begin: RX_QUEUE_OUTPUT
  for (i=0; i< NUM_QUEUES; i=i+1) begin: RX
    initial begin
      rx_queue_file_out[i]  = $fopen($sformatf("axi_sopa_rx_queue_out%0d.txt", i), "w");
      rx_queue_timestamp_file_out[i]  = $fopen($sformatf("axi_sopa_rx_timestamp_queue_out%0d.txt", i), "w");
    end
    always @ (posedge i_rx_clk ) begin: QUEUE
      if ( (arb_rd_queue_no_d2 == i) ) begin //Taking only VALID data for comparision
        $fwrite ( rx_queue_timestamp_file_out[i], "%t \n",$time);
        $fwrite ( rx_queue_file_out[i], "%h %h %h %h %h %h \n", arb_rd_queue_no_d2, o_axi_app_rx_tdata, o_axi_app_rx_tvalid, o_axi_app_rx_tkeep, o_axi_app_rx_tuser, o_axi_app_rx_tlast);
      end
    end
  end
end
endgenerate


generate 
if (SIM_EMULATE ==1 ) begin: RX_QUEUE_INPUT
  for (i=0; i< NUM_QUEUES; i=i+1) begin: RX
    initial begin
      rx_queue_file_in[i]  = $fopen($sformatf("axi_sopa_rx_queue_in%0d.txt", i), "w");
      rx_queue_timestamp_file_in[i]  = $fopen($sformatf("axi_sopa_rx_timestamp_queue_in%0d.txt", i), "w");
    end
    always @ (posedge i_rx_clk ) begin: QUEUE
      if (fifo_wr_en[i] & ~fifo_full[i]) begin //Taking only with VALID WR_EN
          $fwrite ( rx_queue_timestamp_file_in[i], "%t \n",$time);
          $fwrite ( rx_queue_file_in[i], "%h %h %h %h %h %h \n", rx_queue_no_d1, axi_parser_rx_tdata_d1, axi_parser_rx_tvalid_d1, axi_parser_rx_tkeep_d1, axi_parser_rx_tuser_d1, axi_parser_rx_tlast_d1 );
      end
    end
  end
end
endgenerate
*/
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6yt0Xpg4FPvZFe7aw0tbeij6ZP0fJ4N63o+Me+mVyRiMrwKorMLPuBaTkiRli+55iuWGy/Lz1+Lu3zPjgJyZpvp0eYzGXt24u32NsIZxUfaLp4PZ9Y3VB8yEdrFbJumxYWmCfigiK2KCQVnxKh2mMr2XwclrEEPmByXLkySV7LYCEJcpbzIzI4gCfOHrdSaeQ2qiLw5/Xz0esK3YLOpzIJHfslDkdPQRv6po+cn+oocDE92b1LI0F1qT7pd3cFVMmuspnBiVrlL2+J7ZoH1tFx6H+7NoQDTUpRT702177NXb3JIr6m9uey1/9/GFwn/XPw7RpV/GS1ljaKrqjEF+inEWflmdf2Y98uBPhKMKQM6rtF+aagC40EP1tiXfRRViddiEskktB5cE+lI6aggW8ZzfPhbutFUkXP7VXgsUL/r6HXK7PbvHiRI2zy5HGYPBKF0cWGS5HvVZk+/tMtcqZ86Bg97UjMEmbZ56+9f5n2ICCJ8O8Nn43eWMvA8qmWWQiz810KlGZUahqCHcdEg4qKENCuGsP1DsQB9rF+9Uy4HP6NphOxWQjWrgWljnToHCjP7EAeNC5RQwRP53e3XSE3rFebydG+RDoMw9CP4gbnOISHm26afdbSLh4Jx04wMkdK4vhRwaCBmN8Lagh8DfpyKQSBisUapm5IRqHQ3/DEMv5/cBdi5Zb/Mpvdv1GTp2MnFfBhEYj+bqpWBc64iB3fPb7SBi+P3woDSRNZ49QFt6vr2gc8wiq2NzFJjlfzcRAHcPeLvSAoi5IrMWINxzur5F"
`endif