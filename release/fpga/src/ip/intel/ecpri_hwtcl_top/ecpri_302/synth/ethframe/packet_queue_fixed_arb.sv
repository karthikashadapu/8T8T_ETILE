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


 `timescale 1 ps / 1 ps

module packet_queue_fixed_arb
#(

parameter DEVICE_FAMILY   = "Stratix 10",
parameter BITSPERSYMBOL   = 8,                                    // Streaming Data symbol width in bits
parameter SYMBOLSPERBEAT  = 8,                                    // Streaming Number of symbols per symb
parameter READY_LATENCY   = 3,                                    // Streaming ready latency
parameter DATA_WIDTH      = (BITSPERSYMBOL * SYMBOLSPERBEAT),     // Streaming Data bit width
parameter ERROR_WIDTH     = 1,                                    // Streaming port error width
parameter EMPTY_WIDTH     = 3,                                    // Streaming Empty width
parameter EMPTY_BITWIDTH  = ((EMPTY_WIDTH>0) ? (EMPTY_WIDTH-1):0),// Streaming Empty bit width
parameter PTP_TS_FP_WIDTH = 6
//parameter TS_FINGERPRINT_UD = 0

)
(
//Common clock and Reset
input  logic                      clk,                // mac_source from PQ clktxmac
input  logic                      reset_n,            // reset_n


//Avalon St logic DataIn (Sink) Interface from Ethernet top
input  logic                       ecpri_sop_in,
input  logic                       ecpri_eop_in,
input  logic                       ecpri_valid_in,
output logic                       ecpri_ready_out,
input  logic [(DATA_WIDTH)-1:0]    ecpri_data_in,
input  logic [EMPTY_WIDTH-1:0]     ecpri_empty_in,
input  logic [(ERROR_WIDTH)-1:0]   ecpri_error_in,
input  logic [ 2:0]                ecpri_vlan_pcp_in,
input  logic                       ecpri_ready_in,

input  logic                       msg5_pkt,
input  logic                       msg5_ptp_ts_insert,
input  logic                       msg5_ptp_ts_valid,
input  logic                       msg5_ptp_ts_rt_update,
input  logic [15:0]                msg5_offset_correction_field,
input  logic [15:0]                msg5_offset_timestamp,

output logic                       ecpri_state_l2cos_idle,

//Redo inout port for fixed prio packet queue, added ext_sink_0 and ext_sink_1
input  logic                       ext_sink_0_ptp_in,
input  logic                       ext_sink_0_ready_in,   // Queue Ready , Data available
input  logic                       ext_sink_0_sop_in,
input  logic                       ext_sink_0_eop_in,
input  logic                       ext_sink_0_valid_in,
input  logic [(DATA_WIDTH)-1:0]    ext_sink_0_data_in,
input  logic [EMPTY_WIDTH-1:0]     ext_sink_0_empty_in,
input  logic [(ERROR_WIDTH)-1:0]   ext_sink_0_error_in,
input  logic [ 2:0]                ext_sink_0_vlan_pcp_in,
output logic                       ext_sink_0_ready_out, /* synthesis preserve_syn_only */

input  logic [15:0]                ext_sink_0_offset_timestamp_in,
input  logic [15:0]                ext_sink_0_offset_correction_field_in,
input  logic                       ext_sink_0_timestamp_insert_in,
input  logic                       ext_sink_0_timestamp_request_valid_in,
input  logic [PTP_TS_FP_WIDTH+1:0] ext_sink_0_timestamp_request_fingerprint_in,
input  logic [95:0]                ext_sink_0_tx_ingress_timestamp_96b_data_in,
input  logic                       ext_sink_0_tx_etstamp_ins_ctrl_residence_time_update_in,

input  logic                       ext_sink_1_ptp_in,
input  logic                       ext_sink_1_ready_in,   // Queue Ready , Data available
input  logic                       ext_sink_1_sop_in,
input  logic                       ext_sink_1_eop_in,
input  logic                       ext_sink_1_valid_in,
input  logic [(DATA_WIDTH)-1:0]    ext_sink_1_data_in,
input  logic [EMPTY_WIDTH-1:0]     ext_sink_1_empty_in,
input  logic [(ERROR_WIDTH)-1:0]   ext_sink_1_error_in,
input  logic [ 2:0]                ext_sink_1_vlan_pcp_in,
output logic                       ext_sink_1_ready_out, /* synthesis preserve_syn_only */

input  logic [15:0]                ext_sink_1_offset_timestamp_in,
input  logic [15:0]                ext_sink_1_offset_correction_field_in,
input  logic                       ext_sink_1_timestamp_insert_in,
input  logic                       ext_sink_1_timestamp_request_valid_in,
input  logic [PTP_TS_FP_WIDTH+1:0] ext_sink_1_timestamp_request_fingerprint_in,
input  logic [95:0]                ext_sink_1_tx_ingress_timestamp_96b_data_in,
input  logic                       ext_sink_1_tx_etstamp_ins_ctrl_residence_time_update_in,

//Avalon St logic DataOut (Source) Interface to Ethernet MAC
output logic                       data_source_sop,
output logic                       data_source_eop,
output logic                       data_source_valid,
input  logic                       data_source_ready,
output logic [(DATA_WIDTH)-1:0]    data_source_data,
output logic [EMPTY_WIDTH-1:0]     data_source_empty,
output logic [(ERROR_WIDTH)-1:0]   data_source_error,

output logic [15:0]                ptp_offset_timestamp_out,
output logic [15:0]                ptp_offset_correction_field_out,
output logic                       ptp_timestamp_insert_out,
output logic                       ptp_timestamp_request_valid_out,
output logic [PTP_TS_FP_WIDTH+1:0] ptp_timestamp_request_fingerprint_out,
output logic [95:0]                ptp_tx_ingress_timestamp_96b_data_out,
output logic                       ptp_tx_etstamp_ins_ctrl_residence_time_update_out,

input  logic                       queue_ext_sink_0_priority_flag_in,
output logic                       queue_ext_sink_0_clr_cnt_o,
output logic                       queue_ext_sink_0_sop_cnt_en_o,

input  logic                       queue_ext_sink_1_priority_flag_in,
output logic                       queue_ext_sink_1_clr_cnt_o,
output logic                       queue_ext_sink_1_sop_cnt_en_o

//input  logic                       queue_misc_priority_flag_in,
//output logic                       queue_clr_cnt_o,
//output logic                       queue_sop_cnt_en_o


);

localparam LREADY_LATENCY                   = (READY_LATENCY > 0) ? (READY_LATENCY-1) : 0;
localparam LREADY_LAT_USE                   = (READY_LATENCY > 1) ? (READY_LATENCY-2) : 0;
localparam ECPRI_PTP_FINGERPRINT            = 1<<(PTP_TS_FP_WIDTH-1);

localparam QUEUE_FSM_WIDTH = 2;


typedef enum logic[(QUEUE_FSM_WIDTH-1):0]
{
   QSTATE_IDLE    = 2'b00,
   QSTATE_EXT0_DAT  = 2'b01,
   QSTATE_ECPRI_DAT  = 2'b10,
   QSTATE_EXT1_DAT  = 2'b11,
   QSTATE_XPROP = {QUEUE_FSM_WIDTH{1'bx}}
} queue_state_t;

queue_state_t next_queue_state;
queue_state_t queue_state;


logic                     ecpri_source_ready;
logic                     queue_ext_sink_0_ready_in;
logic                     queue_ext_sink_1_ready_in;

logic                     queue_sop_out;
logic                     queue_eop_out;
logic                     queue_valid_out;
logic [(DATA_WIDTH)-1:0]  queue_data_out;
logic [EMPTY_WIDTH-1:0]   queue_empty_out;
logic [(ERROR_WIDTH)-1:0] queue_error_out;

logic                     ecpri_high;



logic                         msg5_timestamp_insert;
logic [PTP_TS_FP_WIDTH+1:0]   msg5_timestamp_request_fingerprint;
logic                         msg5_tx_etstamp_ins_ctrl_residence_time_update;
logic                         msg5_timestamp_request_valid;
logic [95:0]                  queue_tx_ingress_timestamp_96b_data;


logic [LREADY_LATENCY:0]  data_source_ready_d;
generate
  if (READY_LATENCY > 0) begin
     always_ff @(posedge clk) begin
          if (reset_n == 1'b0) begin
             data_source_ready_d <= {READY_LATENCY{1'b0}};
          end else begin
             data_source_ready_d <= {data_source_ready_d[READY_LATENCY-2:0], data_source_ready};
          end
      end

 end else begin
    assign data_source_ready_d   = data_source_ready;
 end
endgenerate



assign ecpri_ready_out = ecpri_source_ready;
assign ext_sink_0_ready_out = queue_ext_sink_0_ready_in ;
assign ext_sink_1_ready_out = queue_ext_sink_1_ready_in;


assign ecpri_high                                               = (ecpri_vlan_pcp_in >= ext_sink_1_vlan_pcp_in);//To compare priority of ecpri and ext_sink_1  

assign msg5_timestamp_insert                                    = (msg5_pkt & ecpri_sop_in & ecpri_valid_in) ? msg5_ptp_ts_insert : 1'b0;
assign msg5_tx_etstamp_ins_ctrl_residence_time_update           = (msg5_pkt & ecpri_sop_in & ecpri_valid_in) ? msg5_ptp_ts_rt_update : 1'b0;
assign msg5_timestamp_request_valid                             = (msg5_pkt & ecpri_sop_in & ecpri_valid_in) ? msg5_ptp_ts_valid : 1'b0;

//if(TS_FINGERPRINT_UD) begin 
//Encoding 2bit 01 for ecpri fingerprint
  assign msg5_timestamp_request_fingerprint = (msg5_pkt & ecpri_sop_in & ecpri_valid_in) ? {2'b01,ECPRI_PTP_FINGERPRINT[PTP_TS_FP_WIDTH-1:0]} : '0;
/*end else begin
  assign msg5_timestamp_request_fingerprint = (msg5_pkt & ecpri_sop_in & ecpri_valid_in) ? 4'd1 : 4'd0;
end*/



logic ecpri_gen;
logic ext0_gen;
always_ff @(posedge clk) begin
  if (reset_n == 1'b0) begin
    ecpri_gen <= 1'b0;
    ext0_gen <= 1'b0;
  end else begin
      if (next_queue_state == QSTATE_EXT0_DAT) begin
        ext0_gen <= 1'b1;
        ecpri_gen <= 1'b0;
      end else if (next_queue_state == QSTATE_ECPRI_DAT) begin
        ecpri_gen <= 1'b1;
        ext0_gen <= 1'b0;
      end else begin
        ecpri_gen <= 1'b0;
        ext0_gen <= 1'b0;
      end
  end
end

always_ff @(posedge clk) begin
  ptp_timestamp_insert_out                           <= (ext0_gen)? ext_sink_0_timestamp_insert_in                          : 
                                                        (ecpri_gen) ? msg5_timestamp_insert                                : 
                                                        ext_sink_1_timestamp_insert_in;
  ptp_timestamp_request_fingerprint_out              <= (ext0_gen)? ext_sink_0_timestamp_request_fingerprint_in             : 
                                                        (ecpri_gen) ? msg5_timestamp_request_fingerprint                   : 
                                                        ext_sink_1_timestamp_request_fingerprint_in;
  ptp_tx_etstamp_ins_ctrl_residence_time_update_out  <= (ext0_gen)? ext_sink_0_tx_etstamp_ins_ctrl_residence_time_update_in : 
                                                        (ecpri_gen) ? msg5_tx_etstamp_ins_ctrl_residence_time_update       : 
                                                        ext_sink_1_tx_etstamp_ins_ctrl_residence_time_update_in;
  ptp_timestamp_request_valid_out                    <= (ext0_gen)? ext_sink_0_timestamp_request_valid_in                   : 
                                                        (ecpri_gen) ? msg5_timestamp_request_valid                         : 
                                                        ext_sink_1_timestamp_request_valid_in;
  ptp_offset_timestamp_out                           <= (ext0_gen)? ext_sink_0_offset_timestamp_in                          : 
                                                        (ecpri_gen) ? msg5_offset_timestamp                                : 
                                                        ext_sink_1_offset_timestamp_in;
  ptp_offset_correction_field_out                    <= (ext0_gen)? ext_sink_0_offset_correction_field_in                   : 
                                                        (ecpri_gen) ? msg5_offset_correction_field                         : 
                                                        ext_sink_1_offset_correction_field_in;
end


always_ff @(posedge clk) begin
  if (~reset_n) begin
     queue_state                <= QSTATE_IDLE;
  end else begin
     queue_state                <= next_queue_state;
  end
end

// Assumption here is all incoming packets are complete i.e SOP & EOP present for a packet, no packet loss.
// As the incoming external packet could be slower clock domain, the queue need to change to ptp immediately after the current packet eop arrived

//Comparison signal
logic p1_starvation_flag;
logic p3_starvation_flag;
logic p1_higher;
logic p1_ptp;
logic p1_ptp_p3;
logic p2_higher;
logic p2_highest;
logic p3_highest;

assign p1_starvation_flag = queue_ext_sink_0_priority_flag_in; 
assign p1_higher = ((ext_sink_1_ready_in ? (ext_sink_0_vlan_pcp_in > ext_sink_1_vlan_pcp_in) : 1) && (ecpri_ready_in ? (ext_sink_0_vlan_pcp_in > ecpri_vlan_pcp_in) : 1));//P1>P2 && P1>P3
assign p1_ptp_p2 = (ext_sink_0_vlan_pcp_in == ecpri_vlan_pcp_in && ext_sink_0_ptp_in && ~(p3_highest & ext_sink_1_ready_in));//P1=P2 && P1_ptp
assign p1_ptp_p3 = (ext_sink_0_vlan_pcp_in == ext_sink_1_vlan_pcp_in && ext_sink_0_ptp_in && ~(p2_highest & ecpri_ready_in));//P1=P3 && P1_ptp
//assign p1_only   = (~ecpri_ready_in && ~ext_sink_1_ready_in);
assign p2_higher = ((ext_sink_1_ready_in ? (ecpri_vlan_pcp_in > ext_sink_1_vlan_pcp_in) : 1) && ~p3_starvation_flag);//P2>P3 & ~P3_starvation_flag
assign p2_p3_not_ptp = (ecpri_vlan_pcp_in == ext_sink_1_vlan_pcp_in && ~ext_sink_1_ptp_in && ~p3_starvation_flag);//P2 = P3 & ~p3_ptp & ~p3_starvation_flag
//assign p2_only   = (~ext_sink_0_ready_in && ~ext_sink_1_ready_in);
assign p3_starvation_flag = queue_ext_sink_1_priority_flag_in;
assign p2_highest = ecpri_vlan_pcp_in > ext_sink_0_vlan_pcp_in && ecpri_vlan_pcp_in > ext_sink_1_vlan_pcp_in;
assign p3_highest = ext_sink_1_vlan_pcp_in > ext_sink_0_vlan_pcp_in && ext_sink_1_vlan_pcp_in > ecpri_vlan_pcp_in;



always_comb
  begin: queue_state_logic_ALWAYS
      next_queue_state = queue_state;
      case (queue_state)
         QSTATE_IDLE:   begin
                        //    if (misc_ready_in & ~queue_misc_priority_flag_in) begin
                        //        next_queue_state = QSTATE_EXT0_DAT;
                        //    end else if (ecpri_ready_in & ~queue_misc_priority_flag_in) begin
                        //        if (ext_sink_1_ready_in & ~ecpri_high) begin
                        //            next_queue_state = QSTATE_EXT1_DAT;
                        //        end else begin
                        //            next_queue_state = QSTATE_ECPRI_DAT;
                        //        end
                        //    end else if (ext_sink_1_ready_in) begin
                        //        next_queue_state = QSTATE_EXT1_DAT;
                        //    end else begin
                        //        next_queue_state = QSTATE_IDLE;
                        //    end
                        //end
                            if (data_source_ready_d[LREADY_LAT_USE]) begin
                                if (ext_sink_0_ready_in && (p1_starvation_flag || p1_higher || p1_ptp_p2 || p1_ptp_p3)) begin
                                    next_queue_state = QSTATE_EXT0_DAT;
                                end else if (ecpri_ready_in && (p2_higher || p2_p3_not_ptp)) begin
                                    next_queue_state = QSTATE_ECPRI_DAT;
                                end else if (ext_sink_1_ready_in)begin
                                    next_queue_state = QSTATE_EXT1_DAT;                                
                                end else begin
                                    next_queue_state = QSTATE_IDLE;
                                end
                            end else begin
                                next_queue_state = QSTATE_IDLE;
                            end
                        end
         QSTATE_EXT0_DAT: begin
                            if (ext_sink_0_eop_in & ext_sink_0_valid_in & data_source_ready_d[LREADY_LAT_USE]) begin
                                next_queue_state = QSTATE_IDLE;
                            end else begin
                                next_queue_state = QSTATE_EXT0_DAT;
                            end
                        end
         QSTATE_ECPRI_DAT: begin
                            if (ecpri_eop_in & ecpri_valid_in & data_source_ready_d[LREADY_LAT_USE]) begin
                                next_queue_state = QSTATE_IDLE;
                            end else begin
                                next_queue_state = QSTATE_ECPRI_DAT;
                            end
                        end
         QSTATE_EXT1_DAT: begin
                            if (ext_sink_1_eop_in & ext_sink_1_valid_in & data_source_ready_d[LREADY_LAT_USE]) begin
                                next_queue_state = QSTATE_IDLE;
                            end else begin
                                next_queue_state = QSTATE_EXT1_DAT;
                            end
                        end
         default: begin
                                next_queue_state = QSTATE_XPROP;
                        end
      endcase
  end

assign ecpri_state_l2cos_idle = (queue_state != QSTATE_IDLE)? 1'b0 : 1'b1;

assign queue_sop_out                       = ((queue_state == QSTATE_EXT0_DAT) ? ext_sink_0_sop_in   : (queue_state == QSTATE_ECPRI_DAT) ? ecpri_sop_in   : (queue_state == QSTATE_EXT1_DAT) ? ext_sink_1_sop_in   : 1'b0);
assign queue_eop_out                       = ((queue_state == QSTATE_EXT0_DAT) ? ext_sink_0_eop_in   : (queue_state == QSTATE_ECPRI_DAT) ? ecpri_eop_in   : (queue_state == QSTATE_EXT1_DAT) ? ext_sink_1_eop_in   : 1'b0);
assign queue_valid_out                     = ((queue_state == QSTATE_EXT0_DAT) ? ext_sink_0_valid_in : (queue_state == QSTATE_ECPRI_DAT) ? ecpri_valid_in : (queue_state == QSTATE_EXT1_DAT) ? ext_sink_1_valid_in : 1'b0);
assign queue_data_out                      = ((queue_state == QSTATE_EXT0_DAT) ? ext_sink_0_data_in  : (queue_state == QSTATE_ECPRI_DAT) ? ecpri_data_in  : (queue_state == QSTATE_EXT1_DAT) ? ext_sink_1_data_in  : {DATA_WIDTH{1'b0}});
assign queue_empty_out                     = ((queue_state == QSTATE_EXT0_DAT) ? ext_sink_0_empty_in : (queue_state == QSTATE_ECPRI_DAT) ? ecpri_empty_in : (queue_state == QSTATE_EXT1_DAT) ? ext_sink_1_empty_in : {(EMPTY_WIDTH){1'b0}});
assign queue_error_out                     = ((queue_state == QSTATE_EXT0_DAT) ? ext_sink_0_error_in : (queue_state == QSTATE_ECPRI_DAT) ? ecpri_error_in : (queue_state == QSTATE_EXT1_DAT) ? ext_sink_1_error_in : {ERROR_WIDTH{1'b0}});
assign queue_tx_ingress_timestamp_96b_data =  (queue_state == QSTATE_EXT0_DAT) ? ext_sink_0_tx_ingress_timestamp_96b_data_in : 
                                              (queue_state == QSTATE_ECPRI_DAT) ? 96'h0                                       :
                                              ext_sink_1_tx_ingress_timestamp_96b_data_in;

//assign queue_clr_cnt_o = (queue_state == QSTATE_EXT1_DAT) ? 1'b1 : 1'b0;
assign queue_ext_sink_0_clr_cnt_o       =  (queue_state == QSTATE_EXT0_DAT) ? 1'b1 : 1'b0;
assign queue_ext_sink_1_clr_cnt_o       =  (queue_state == QSTATE_EXT1_DAT) ? 1'b1 : 1'b0;

always_ff @(posedge clk) begin
  if (reset_n == 1'b0) begin
     //queue_sop_cnt_en_o  <= 1'b0;
     queue_ext_sink_0_sop_cnt_en_o  <= 1'b0;     
     queue_ext_sink_1_sop_cnt_en_o  <= 1'b0;     
     ecpri_source_ready  <= 1'b0;
     queue_ext_sink_0_ready_in <= 1'b0;
     queue_ext_sink_1_ready_in <= 1'b0;
  end else begin
     queue_ext_sink_0_sop_cnt_en_o  <= ((ecpri_sop_in & (queue_state == QSTATE_ECPRI_DAT)) || (ext_sink_1_sop_in & (queue_state == QSTATE_EXT1_DAT))) ? data_source_ready_d[LREADY_LAT_USE] : 1'b0;
     queue_ext_sink_1_sop_cnt_en_o  <= ((ecpri_sop_in & (queue_state == QSTATE_ECPRI_DAT)) || (ext_sink_0_sop_in & (queue_state == QSTATE_EXT0_DAT))) ? data_source_ready_d[LREADY_LAT_USE] : 1'b0;     
     //queue_sop_cnt_en_o  <= ((ecpri_sop_in & (queue_state == QSTATE_ECPRI_DAT)) || (ext_sink_0_sop_in & (queue_state == QSTATE_EXT0_DAT))) ? data_source_ready_d[LREADY_LAT_USE] : 1'b0;
     ecpri_source_ready  <= (((queue_state == QSTATE_ECPRI_DAT) & ~(ecpri_eop_in & ecpri_valid_in))| ((queue_state == QSTATE_IDLE) & (next_queue_state == QSTATE_ECPRI_DAT))) ? data_source_ready_d[LREADY_LAT_USE-1] : 1'b0;
     queue_ext_sink_0_ready_in <= (((queue_state == QSTATE_EXT0_DAT) & ~(ext_sink_0_eop_in   & ext_sink_0_valid_in )) | ((queue_state == QSTATE_IDLE) & (next_queue_state == QSTATE_EXT0_DAT))) ? data_source_ready_d[LREADY_LAT_USE-1] : 1'b0;
     queue_ext_sink_1_ready_in <= (((queue_state == QSTATE_EXT1_DAT) & ~(ext_sink_1_eop_in  & ext_sink_1_valid_in)) | ((queue_state == QSTATE_IDLE) & (next_queue_state == QSTATE_EXT1_DAT))) ? data_source_ready_d[LREADY_LAT_USE-1] : 1'b0;
  end
end


 always_ff @(posedge clk) begin
  if (reset_n == 1'b0) begin
     data_source_valid  <= 1'b0;
  end else begin
     data_source_valid  <= queue_valid_out;
  end
end


always_ff @(posedge clk) begin
    data_source_sop     <= queue_sop_out;
    data_source_eop     <= queue_eop_out;
    data_source_empty   <= queue_empty_out;
    data_source_error   <= queue_error_out;
    data_source_data    <= queue_data_out;
end

always_ff @(posedge clk) begin
    ptp_tx_ingress_timestamp_96b_data_out <= queue_tx_ingress_timestamp_96b_data;
end

endmodule
