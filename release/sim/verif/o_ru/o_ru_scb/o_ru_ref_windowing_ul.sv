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

`ifndef O_RU_REF_WINDOWING_UL_SV 
`define O_RU_REF_WINDOWING_UL_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_windowing_ul
//------------------------------------------------------------------------------ 

class o_ru_ref_windowing_ul extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_windowing_ul) 
 
  bit window_valid_pkt = 0 ;
  int unsigned axc_cnt = 8, c_pkt_cnt=0, sym_cnt = 0;
  int unsigned u_axc_cnt = 0, u_pkt_cnt=0, pusch_pkt_cnt = 0, pkt_cnt = 0;
  bit [47:0] lwr_bound_p = 0, upr_bound_p = 0;
  o_ru_ref_avsts_item ref_item; 
  o_ru_ref_avsts_item m_item; 
  avsts_item m_item_inp; 
  bit [31:0] tod_mod_2p56s;
  real  nanosec_to_sec,nanosec_to_usec,nanosec_reg,sec_reg;
  real  tod_time,tod_mod_2p56s_sec,tod_mod,bound_sec;
  bit [31:0] lwr_bound,upr_bound;

   //------------------------------------------------------------------------------ 
   // Constructor 
   //------------------------------------------------------------------------------ 
   function new (string name, uvm_component parent); 
      super.new(name, parent);
   endfunction : new 

extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);
extern virtual task run_phase(uvm_phase phase);
extern virtual task window_valid_packet_check(ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task window_test_c_u(ref byte unsigned rx_data_que[$],ref o_ru_config_pkg::o_ru_ip_config m_config,int num);
extern virtual task oran_window_u_plane(ref byte unsigned rx_data_que[$],ref o_ru_config_pkg::o_ru_ip_config m_config,int num);
extern virtual task oran_window_prach(ref byte unsigned rx_data_que[$],ref o_ru_config_pkg::o_ru_ip_config m_config,int num);

endclass: o_ru_ref_windowing_ul 

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_windowing_ul::build_phase(uvm_phase phase);
     super.build_phase(phase);
     pkt_cnt[1] = 3;
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_windowing_ul::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_windowing_ul::run_phase(uvm_phase phase);
     for(int i=0; i<2; i++) begin
       fork
          int scb_num = i;
          begin 
             forever 
             begin
                m_item_inp = new();
                m_item     = new();
                ref_item   = new() ;
                m_fifo[scb_num].get(m_item_inp);
                $cast(m_item,m_item_inp);
                ref_item.buf_packet_out = new[m_item.buf_packet_out.size] (m_item.buf_packet_out) ;
                ref_item.rx_data_q = ref_item.buf_packet_out;
                ref_item.symbol_number  = m_item.symbol_number ;
                ref_item.pc_id          = m_item.pc_id ;
                if(m_config.tx_window_enable == 0) begin
                 $cast(m_item_inp,ref_item);
                 m_output[scb_num].write(m_item_inp);
                 `uvm_info("TX WINDOW DISABLE", $sformatf("Output Size: %d,Output Data: %0h",m_output[0].size,m_output[0]),UVM_HIGH);
              end else if (m_config.tx_window_enable == 1)begin
                  window_test_c_u(ref_item.rx_data_q,m_config,scb_num);
                window_valid_packet_check(m_config);
                $cast(m_item_inp,ref_item);
                if(window_valid_pkt == 1) begin
                   m_output[scb_num].write(m_item_inp);
                  `uvm_info("TX_WINDOW", $sformatf("Scoreboard Num: %d,Output Data: %0h,Out Packet Number: %d",scb_num,m_output[scb_num],pkt_cnt[scb_num]),UVM_HIGH);
                end else begin
                  `uvm_info("TX_WINDOW", $sformatf("Packet Dropped"),UVM_HIGH);
                 end
               end
             end	
          end               // Fork
       join_none
     end
  endtask : run_phase


task o_ru_ref_windowing_ul::window_valid_packet_check(ref o_ru_config_pkg::o_ru_ip_config m_config);

     sec_reg = m_o_ru_config.o_ru_cfg.sec_cnt;
     `ifdef ECPRI_ORAN_SS
        nanosec_reg = m_o_ru_config.o_ru_cfg.nsec_cnt + 666;
     `else
        nanosec_reg = m_o_ru_config.o_ru_cfg.nsec_cnt + 123609; 
     `endif
     
     `uvm_info("TX_WINDOW", $sformatf("Seconds Reg Value : %g",sec_reg),UVM_HIGH);
     `uvm_info("TX_WINDOW", $sformatf("Nanosecond: %0d ,Nanoseconds Reg Value + Offset : %g",m_o_ru_config.o_ru_cfg.nsec_cnt,nanosec_reg),UVM_HIGH);

     nanosec_to_sec = nanosec_reg/1000000000;
     `uvm_info("TX_WINDOW", $sformatf("Nanoseconds to Seconds : %g",nanosec_to_sec),UVM_HIGH);

    tod_time = sec_reg + nanosec_to_sec;
    `uvm_info("TX_WINDOW", $sformatf("TOD Time: %g",tod_time),UVM_HIGH);

    `uvm_info("TX_WINDOW", $sformatf("Lwr: %0d, Upr: %0d",lwr_bound,upr_bound),UVM_HIGH);

     bound_sec = 2.56;
     tod_mod_2p56s_sec = tod_time - bound_sec * $floor(tod_time/bound_sec);
     tod_mod_2p56s =tod_mod_2p56s_sec*1000000000;    
     `uvm_info("TX_WINDOW", $sformatf("TOD Mod Value: %g, TOD Conv: %d",tod_mod_2p56s_sec,tod_mod_2p56s),UVM_HIGH);


     if(tod_mod_2p56s > lwr_bound_p && tod_mod_2p56s < upr_bound_p ) begin
        window_valid_pkt = 1 ;
       `uvm_info("TX_WINDOW", $sformatf("Condition Check:  Lower bound = %d ,Upper Bound = %d, Tod Val = %d: ON TIME,pkt valid : %0d",lwr_bound_p,upr_bound_p,tod_mod_2p56s,window_valid_pkt),UVM_HIGH);
     end else if (tod_mod_2p56s < lwr_bound_p) begin
        window_valid_pkt = 0;
       `uvm_info("TX_WINDOW", $sformatf("Condition Check:  Lower bound = %d ,Upper Bound = %d, Tod Val = %d : EARLY,pkt valid : %0d",lwr_bound_p,upr_bound_p,tod_mod_2p56s,window_valid_pkt),UVM_HIGH);
     end else if (tod_mod_2p56s > upr_bound_p) begin
        window_valid_pkt = 0;
        `uvm_info("TX_WINDOW", $sformatf("Condition Check: Lower bound = %d , Upper bound = %d ,Tod Val = %d : LATE,pkt valid : %0d",lwr_bound_p,upr_bound_p,tod_mod_2p56s,window_valid_pkt),UVM_HIGH);
     end else begin
        `uvm_info("TX_WINDOW", $sformatf("Conditions not satisfied window valid pkt = %0d",window_valid_pkt),UVM_HIGH);
    end

 endtask


task o_ru_ref_windowing_ul::window_test_c_u(ref byte unsigned rx_data_que[$], ref o_ru_config_pkg::o_ru_ip_config m_config,int num);

     if(num == 1) begin
       `uvm_info("PRACH TX_WINDOW", $sformatf("pkt cnt initial = %0d", pkt_cnt),UVM_HIGH); 
        oran_window_prach(rx_data_que,m_config,num);
       if(axc_cnt == 15) begin
           axc_cnt = 8;
           c_pkt_cnt = c_pkt_cnt + 1;
       end else begin
          axc_cnt = axc_cnt + 1;
       end
     end else begin //PUSCH
       oran_window_u_plane(rx_data_que,m_config,num);
       `uvm_info("TX_WINDOW", $sformatf("pkt cnt initial = %0d, axc = %0d, C Pkt Cnt = %0d", u_pkt_cnt, u_axc_cnt, pusch_pkt_cnt),UVM_HIGH); 
       u_pkt_cnt = u_pkt_cnt + 1;
       if(u_axc_cnt == 7) begin
         u_axc_cnt = 0;
         if (sym_cnt == 13)
           sym_cnt = 0;
         else
           sym_cnt = sym_cnt + 1;
       end else begin
         u_axc_cnt = u_axc_cnt + 1;
       end
       `uvm_info("TX_WINDOW", $sformatf("pkt cnt initial = %0d, c_sym = %0d, C Pkt Cnt = %0d", u_pkt_cnt,m_config.c_numSymbol[u_axc_cnt][pusch_pkt_cnt][0],pusch_pkt_cnt),UVM_HIGH);
       if((u_pkt_cnt % (m_config.c_numSymbol[u_axc_cnt][pusch_pkt_cnt][0]*8)) == 0) pusch_pkt_cnt = pusch_pkt_cnt + 1;
       else pusch_pkt_cnt = pusch_pkt_cnt ;
     end

endtask


task o_ru_ref_windowing_ul::oran_window_u_plane(ref byte unsigned rx_data_que[$], ref o_ru_config_pkg::o_ru_ip_config m_config,int num);
    int frame_id, subframe_id, symbol_id,slot_id;
    bit [47:0] pkt_rcv_time, sym_time;

    frame_id     = m_config.c_frameId[u_axc_cnt][pusch_pkt_cnt];
    subframe_id  = m_config.c_subframeId[u_axc_cnt][pusch_pkt_cnt];
    symbol_id    =  sym_cnt ;//m_config.c_startSymbolid[u_axc_cnt][pusch_pkt_cnt];
    slot_id      = m_config.c_slotID[u_axc_cnt][pusch_pkt_cnt];

   `uvm_info("TX_WINDOW", $sformatf("axc count = %0d,c pkt_cnt = %0d,frame = %0d, subfn = %0d, sym = %0d,slot_id = %0d",u_axc_cnt,pusch_pkt_cnt,m_config.c_frameId[u_axc_cnt][pusch_pkt_cnt],m_config.c_subframeId[u_axc_cnt][pusch_pkt_cnt],m_config.c_startSymbolid[u_axc_cnt][pusch_pkt_cnt],m_config.c_slotID[u_axc_cnt][pusch_pkt_cnt]),UVM_HIGH);

    `uvm_info("TX_WINDOW", $sformatf("frame = %0d, subfn = %0d, sym = %0d,slot_id = %0d",frame_id,subframe_id,symbol_id,slot_id),UVM_HIGH);
    if (symbol_id == 0 || symbol_id == 14)
     sym_time = 0;
    else
     sym_time = 36186+(35678*(symbol_id-1));

   `uvm_info("TX_WINDOW", $sformatf("symbol time = %0d",sym_time),UVM_HIGH);                              

    pkt_rcv_time = (10000000*(frame_id))+(1000000*(subframe_id))+ sym_time + (slot_id*500000);                              
   `uvm_info("TX_WINDOW", $sformatf("Pkt Receive Time = %0d, T3a_max_up = %0d, T3a_min_up = %0d",pkt_rcv_time,m_config.t3a_max_up,m_config.t3a_min_up),UVM_HIGH);

    lwr_bound = pkt_rcv_time + m_config.t3a_min_up;
    upr_bound = pkt_rcv_time + m_config.t3a_max_up;

    if (lwr_bound > 2560000000 || upr_bound > 2560000000) begin
      lwr_bound_p = lwr_bound - 2560000000;
      upr_bound_p = upr_bound - 2560000000;                                                             
      `uvm_info("TX_WINDOW", $sformatf("Lower bound = %0d, 2.56s Boundary = %0d",lwr_bound,lwr_bound_p),UVM_HIGH);
      `uvm_info("TX_WINDOW", $sformatf("Upper Bound = %0d, 2.56s Boundary = %0d",upr_bound,upr_bound_p),UVM_HIGH);
    end else begin                                                                                       
     lwr_bound_p = lwr_bound;
     upr_bound_p = upr_bound;
    `uvm_info("TX_WINDOW", $sformatf("Lower bound = %0d, Upper bound = %0d",lwr_bound_p,upr_bound_p),UVM_HIGH);
    end

endtask


task o_ru_ref_windowing_ul::oran_window_prach(ref byte unsigned rx_data_que[$], ref o_ru_config_pkg::o_ru_ip_config m_config,int num);

    int frame_id, subframe_id, symbol_id,slot_id;
    bit [47:0] pkt_rcv_time, sym_time;

    frame_id     = m_config.c_frameId[axc_cnt][c_pkt_cnt];
    subframe_id  = m_config.c_subframeId[axc_cnt][c_pkt_cnt];
    symbol_id    = m_config.c_startSymbolid[axc_cnt][c_pkt_cnt];
    slot_id      = m_config.c_slotID[axc_cnt][c_pkt_cnt];
  
   `uvm_info("PRACH C TX_WINDOW", $sformatf("axc count = %0d,c pkt_cnt = %0d,frame = %0d, subfn = %0d, sym = %0d,slot_id = %0d",axc_cnt,c_pkt_cnt,m_config.c_frameId[axc_cnt][c_pkt_cnt],m_config.c_subframeId[axc_cnt][c_pkt_cnt],m_config.c_startSymbolid[axc_cnt][c_pkt_cnt],m_config.c_slotID[axc_cnt][c_pkt_cnt]),UVM_HIGH);

   `uvm_info("PRACH TX_WINDOW", $sformatf("frame = %0d, subfn = %0d, sym = %0d,slot_id = %0d",frame_id,subframe_id,symbol_id,slot_id),UVM_HIGH);

    if (symbol_id == 0 || symbol_id == 14)
     sym_time = 0;
    else
     sym_time = 36186+(35678*(symbol_id-1));

   `uvm_info("PRACH TX_WINDOW", $sformatf("symbol time = %0d",sym_time),UVM_HIGH);

    pkt_rcv_time = (10000000*frame_id)+(1000000*subframe_id)+(sym_time*symbol_id);
    `uvm_info("PRACH TX_WINDOW", $sformatf("PRACH Pkt symbol time = %0d",sym_time),UVM_HIGH);
    `uvm_info("PRACH TX_WINDOW", $sformatf("PRACH Pkt Receive Time = %0d",pkt_rcv_time),UVM_HIGH);

    lwr_bound = pkt_rcv_time + m_config.ta3_min_cp;
    upr_bound = pkt_rcv_time + m_config.ta3_max_cp;
    
   if (lwr_bound > 2560000000 || upr_bound > 2560000000) begin
      lwr_bound_p = lwr_bound - 2560000000;
      upr_bound_p = upr_bound - 2560000000;
      `uvm_info("PRACH TX_WINDOW", $sformatf("Lower bound = %0d, 2.56s Boundary = %0d",lwr_bound,lwr_bound_p),UVM_HIGH);
      `uvm_info("PRACH TX_WINDOW", $sformatf("Upper Bound = %0d, 2.56s Boundary = %0d",upr_bound,upr_bound_p),UVM_HIGH);
    end else begin
     lwr_bound_p = lwr_bound;
     upr_bound_p = upr_bound;
    `uvm_info("PRACH TX_WINDOW", $sformatf("Lower bound = %0d, Upper bound = %0d",lwr_bound_p,upr_bound_p),UVM_HIGH);
    end


endtask

`endif 
