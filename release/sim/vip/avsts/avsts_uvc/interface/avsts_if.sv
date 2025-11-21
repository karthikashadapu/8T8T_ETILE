/* ******************************************************************************************************************
 INTEL CONFIDENTIAL
 Copyright 2023 Intel Corporation All Rights Reserved.
 The source code contained or described herein and all documents related to the
 source code ("Material") are owned by Intel Corporation or its suppliers or
 licensors. Title to the Material remains with Intel Corporation or its
 suppliers and licensors. The Material may contain trade secrets and proprietary
 and confidential information of Intel Corporation and its suppliers and
 licensors, and is protected by worldwide copyright and trade secret laws and
 treaty provisions. No part of the Material may be used, copied, reproduced,
 modified, published, uploaded, posted, transmitted, distributed, or disclosed
 in any way without Intels prior express written permission.
 No license under any patent, copyright, trade secret or other intellectual
 property right is granted to or conferred upon you by disclosure or delivery
 of the Materials, either expressly, by implication, inducement, estoppel or
 otherwise. Any license under such intellectual property rights must be
 express and approved by Intel in writing.
 Unless otherwise agreed by Intel in writing, you may not remove or alter this
 notice or any other notice embedded in Materials by Intel or Intels suppliers
 or licensors in any way.
****************************************************************************************************************** */
`ifndef AVSTS_IF_SV 
`define AVSTS_IF_SV 

interface avsts_if
import uvm_pkg::*;
import avsts_pkg::*;
#(
// Parameters
parameter DATA_WIDTH =64,
parameter DRIVER     = 1,
parameter SOP_EOP_DIS = 0 
)
(
// Inputs
input logic clk,
input logic rst_n
);

   // Actual RX Signals
   wire  [DATA_WIDTH-1:0]          avsts_rx_data ;
   wire                            avsts_rx_valid  ;
   wire  [2:0]                     avsts_rx_empty  ;
   wire  [2:0]                     avsts_rx_channel;
   wire                            avsts_rx_sop  ;
   wire                            avsts_rx_eop  ;
   wire                            avsts_rx_ready  ;
   
   // Actual TX Signals
   logic  [DATA_WIDTH-1:0]          avsts_tx_data ;
   logic                            avsts_tx_valid  ;
   logic  [2:0]                     avsts_tx_empty  ;
   logic  [2:0]                     avsts_tx_channel;
   logic                            avsts_tx_sop  ;
   logic                            avsts_tx_eop  ;
   logic                            avsts_tx_ready ;
   real time_cnt ;
   int   DATA_STOP_SIZE ; 
   int  ready_latency=0 ; 
   bit channel_flag ;
   bit [127:0] avsts_tx_ready_delay;
   bit [127:0] avsts_rx_ready_delay;
   o_ru_config_pkg::o_ru_ip_config m_config ;
   // synopsys translate_on
   clocking drv_cb @(posedge clk); 
      output  avsts_tx_valid;
      output  avsts_tx_sop;
      output  avsts_tx_data;
      output  avsts_tx_eop;
      output  avsts_tx_empty;
      output  avsts_tx_channel;
      input   avsts_tx_ready;
   endclocking

   clocking mon_cb @(negedge clk); 
      input  avsts_rx_data;
      input  avsts_rx_valid;
      input  avsts_rx_empty;
      input  avsts_rx_sop;
      input  avsts_rx_eop;
      input  avsts_rx_channel;
      input  avsts_rx_ready;
   endclocking
    
   modport drv_mp(clocking drv_cb);
   modport mon_mp(clocking mon_cb);

   initial begin
     avsts_tx_data    = 0 ;  
     avsts_tx_valid   = 0 ;
     avsts_tx_sop     = 0 ;
     avsts_tx_eop     = 0 ;
     avsts_tx_empty   = 0 ;
     avsts_tx_channel = 0 ;
   end

   assign avsts_rx_ready= (DRIVER===1)?avsts_tx_ready:1;
   assign avsts_rx_data= (DRIVER===1)?avsts_tx_data:'hz;
   assign avsts_rx_valid= (DRIVER===1)?avsts_tx_valid:'hz;
   assign avsts_rx_sop= (DRIVER===1)?avsts_tx_sop:'hz;
   assign avsts_rx_eop= (DRIVER===1)?avsts_tx_eop:'hz;
   assign avsts_rx_empty= (DRIVER===1)?avsts_tx_empty:'hz;
   assign avsts_rx_channel= (DRIVER===1)?avsts_tx_channel : 'hz;
   
task automatic DriveData(ref avsts_pkg::avsts_item item);
 
   drive_avst_pkt(item);
endtask : DriveData

task automatic DriveData2(ref avsts_pkg::avsts_item item);                                          
   
   drive_avst_pkt(item);                                                                                 
endtask : DriveData2

task automatic drive_avst_pkt(ref avsts_pkg::avsts_item item);  
   byte unsigned pkdbytes[];
   bit [2:0] empty_temp;
   bit [DATA_WIDTH-1:0] buf64[];
      ready_latency = item.ready_latency;
      pkdbytes = new[item.buf_packet_out.size](item.buf_packet_out);
      if(pkdbytes.size()%8==0) 
      begin
         empty_temp=3'd0;
      end else begin
         empty_temp= 8-(pkdbytes.size()%8);
      end
      buf64 = {>>8{pkdbytes}};
      wait(rst_n == 1);
      wait(avsts_tx_ready==1);
      for(int i=0;i<buf64.size();)begin
        @(drv_cb);
        for(int j = 127 ; j> 0 ; j--)begin
           avsts_tx_ready_delay[j] <= avsts_tx_ready_delay[j-1];
        end
        avsts_tx_ready_delay[0]<= avsts_tx_ready;

        if(avsts_tx_ready_delay[ready_latency]==1) begin
           avsts_tx_valid <= 1;
           if(i==0) begin
              if(SOP_EOP_DIS != 1)begin
                 avsts_tx_sop <=1;
              end else begin
                 avsts_tx_sop<=0;
              end
              if(channel_flag == 1 ) begin
                 if(avsts_tx_channel == 3) avsts_tx_channel <= 0;
                 else avsts_tx_channel <= avsts_tx_channel + 1 ;
                 channel_flag = 0 ;
              end
           end
           else 
              avsts_tx_sop<=0;
           if((i == buf64.size -1 )&&(avsts_tx_ready_delay[ready_latency]))begin
              if(SOP_EOP_DIS != 1)begin
                 avsts_tx_eop <= 1;
                 channel_flag <= 1; 
              end else begin
                 avsts_tx_eop <= 0;
                 channel_flag <= 0; 
              end
              avsts_tx_empty <= empty_temp;
           end
           else
              avsts_tx_eop<=0;
           avsts_tx_data  <= buf64[i] ;
           i++;
        end else begin 
           avsts_tx_data <= buf64[i];
           avsts_tx_valid<=0 ;
           avsts_tx_sop<=0 ;
           avsts_tx_eop<=0 ;
           avsts_tx_empty<=0 ;             
        end  
      end
endtask : drive_avst_pkt
  
   
task automatic MonitorData(ref avsts_pkg::avsts_item item);
   MonitorData_avsts_pkt(item);
endtask : MonitorData
  
task automatic MonitorData_avsts_pkt(ref avsts_pkg::avsts_item item);
   
   byte unsigned lane_data[8] ; 
   bit  lane_valid[8];
   bit [DATA_WIDTH-1:0] payload[$];
   byte unsigned payload_bytes[];
   int packet_size_temp;
   int counter;
   payload = {};
   item = new();
   forever 
   begin 
      @(mon_cb);
      for(int j = 127 ; j> 0 ; j--)begin
         avsts_rx_ready_delay[j] <= avsts_rx_ready_delay[j-1];
      end
      avsts_rx_ready_delay[0] = avsts_rx_ready;
      if(avsts_rx_valid && avsts_rx_ready ) begin
         payload.push_back({>>8{avsts_rx_data}}) ;
         counter +=1;
      end
      if((avsts_rx_valid == 1'b1 && avsts_rx_eop == 1'b1 && avsts_rx_ready==1'b1) || (avsts_rx_valid == 1'b1 && counter == (DATA_STOP_SIZE/(DATA_WIDTH/8)) && avsts_rx_ready==1'b1))
      begin
         item.break_enb = 1;
         payload_bytes = new[payload.size];
         {>>{payload_bytes}} = payload ;
         payload_bytes = new[(payload_bytes.size) - avsts_rx_empty](payload_bytes);
         item.len = payload_bytes.size();
         if(payload_bytes.size != 0) 
	 begin 
         item.buf_packet_out = new[payload_bytes.size](payload_bytes);
         end
         break; 
      end 
   end //forever

endtask : MonitorData_avsts_pkt


endinterface : avsts_if
`endif
