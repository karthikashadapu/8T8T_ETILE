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

`ifndef O_RU_REF_WINDOWING_SV 
`define O_RU_REF_WINDOWING_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_windowing
//------------------------------------------------------------------------------ 

class o_ru_ref_windowing extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_windowing) 
 
  bit window_valid_pkt = 0 ;
  bit [31:0] lwr_bound_p = 0 , upr_bound_p = 0;
  o_ru_ref_avsts_item ref_item; 
  o_ru_ref_avsts_item m_item; 
  avsts_item m_item_inp;
  bit [31:0] time_of_day_96b_2p56_mod,tod_mod_2p56s;
  real  nanosec_to_sec,nanosec_to_usec,nanosec_reg,sec_reg;
  real  tod_time,tod_mod_2p56s_sec,tod_mod,bound_sec;
  bit [31:0] lwr_bound_usec,upr_bound_usec;
  bit signed [31:0] lwr_bound,upr_bound;
  bit [31:0] bound_sec_ns,tod_mod_2p56s_ns,tod_mod_2p56s_sec_ns;
  bit [47:0] tod_time_ns;
  bit [31:0] pkt_cnt_early, pkt_cnt_late;

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
extern virtual task window_test_c_u(ref byte unsigned rx_data_que[$],ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task oran_window_u_plane(ref byte unsigned rx_data_que[$],ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task oran_window_c_plane(ref byte unsigned rx_data_que[$],ref o_ru_config_pkg::o_ru_ip_config m_config);
endclass: o_ru_ref_windowing 

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_windowing::build_phase(uvm_phase phase);
     super.build_phase(phase);

  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_windowing::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_windowing::run_phase(uvm_phase phase);
     fork
        begin 
           forever 
           begin
              m_item_inp = new();
              m_item     = new();
              ref_item   = new() ;
              m_fifo[0].get(m_item_inp);
              $cast(m_item,m_item_inp);
              ref_item.buf_packet_out = new[m_item.buf_packet_out.size] (m_item.buf_packet_out) ;
              ref_item.rx_data_q = ref_item.buf_packet_out;
               if(m_config.rx_window_enable == 0) begin
                 $cast(m_item_inp,ref_item);
                 m_output[0].write(m_item_inp);
                 `uvm_info("WINDOW DISABLE", $sformatf("Output Size: %d,Output Data: %0h",m_output[0].size,m_output[0]),UVM_HIGH);
              end else if (m_config.rx_window_enable == 1)begin
                 window_test_c_u(ref_item.rx_data_q,m_config);
                 window_valid_packet_check(m_config);
                 if(window_valid_pkt == 1) begin
                    $cast(m_item_inp,ref_item);
                    m_output[0].write(m_item_inp);
                    `uvm_info("RX_WINDOW", $sformatf("Output Size: %d,Output Data: %0h",m_output[0].size,m_output[0]),UVM_HIGH);
                 end else begin
                   `uvm_info("RX_WINDOW", $sformatf("Packet Dropped"),UVM_HIGH);
                 end
            end
          end	
        end               // Fork
     join_none
  endtask : run_phase


 task o_ru_ref_windowing::window_valid_packet_check(ref o_ru_config_pkg::o_ru_ip_config m_config);
   
     sec_reg = m_o_ru_config.o_ru_cfg.sec_cnt;
     nanosec_reg = m_o_ru_config.o_ru_cfg.nsec_cnt - 2235;   /// Reference Model wil be called at EoP but Design will latch at SoP /// 
     `uvm_info("RX_WINDOW", $sformatf("Seconds Reg Value : %g",sec_reg),UVM_HIGH);
     `uvm_info("RX_WINDOW", $sformatf("Nanosecond: %0d ,Nanoseconds Reg Value + Offset : %g",m_o_ru_config.o_ru_cfg.nsec_cnt,nanosec_reg),UVM_HIGH);

     nanosec_to_sec = nanosec_reg/1000000000;
     `uvm_info("RX_WINDOW", $sformatf("Nanoseconds to Seconds : %g",nanosec_to_sec),UVM_HIGH);
  
     tod_time = sec_reg + nanosec_to_sec;
     `uvm_info("RX_WINDOW", $sformatf("TOD Time: %g",tod_time),UVM_HIGH);

    `uvm_info("RX_WINDOW", $sformatf("Lwr: %0d, Upr: %0d",lwr_bound,upr_bound),UVM_HIGH);


     tod_time_ns = (m_o_ru_config.o_ru_cfg.nsec_cnt - 2235) + (m_o_ru_config.o_ru_cfg.sec_cnt*1000000000);   /// ToD time in Seconds
     `uvm_info("RX_WINDOW", $sformatf("TOD Value ns : %d, sec : %d, nsec : %d",tod_time_ns,m_o_ru_config.o_ru_cfg.nsec_cnt,m_o_ru_config.o_ru_cfg.sec_cnt),UVM_HIGH);
     bound_sec_ns = 2560000000;    // Frame Roll Over 
     tod_mod_2p56s_sec_ns = tod_time_ns % 2560000000;     /// Checking Second boundary 
     if ((m_o_ru_config.o_ru_cfg.nsec_cnt - 2235) < 360000000) begin   /// Checking NS roll over with respect to 2.56 seconds boundary as reset value is 15.360000000 
         tod_mod_2p56s_ns =tod_mod_2p56s_sec_ns;
         `uvm_info("RX_WINDOW", $sformatf("Condition 1:TOD Mod Value ns: %d : TOD Conv ns : %d",tod_mod_2p56s_sec_ns,tod_mod_2p56s_ns),UVM_HIGH);
     end else if (lwr_bound[31] == 1 | upr_bound[31] == 1)  begin
         tod_mod_2p56s_ns =tod_mod_2p56s_sec_ns+2560000000;  // Negative values should be Added with Frame roll over as mentioned in oRAN Spec
         `uvm_info("RX_WINDOW", $sformatf("Condition 2: TOD Mod Value ns : %d, TOD Conv ns : %d",tod_mod_2p56s_sec_ns,tod_mod_2p56s_ns),UVM_HIGH);
     end else begin
         tod_mod_2p56s_ns =tod_mod_2p56s_sec_ns;
         `uvm_info("RX_WINDOW", $sformatf("Condition 3: TOD Mod Value ns : %d, TOD Conv ns : %d",tod_mod_2p56s_sec_ns,tod_mod_2p56s_ns),UVM_HIGH);
     end
     `uvm_info("RX_WINDOW", $sformatf("TOD Mod Value ns : %d, TOD Conv ns : %d",tod_mod_2p56s_sec_ns,tod_mod_2p56s_ns),UVM_HIGH);

  if(m_config.msg_type == 2) begin
    if(tod_mod_2p56s_ns > lwr_bound_p && tod_mod_2p56s_ns < upr_bound_p ) begin
       window_valid_pkt = 1 ;
      `uvm_info("C_RX_WINDOW", $sformatf("Condition Check:  Lower bound = %d ,Upper Bound = %d, Tod Val = %d: ON TIME,pkt valid : %0d",lwr_bound_p,upr_bound_p,tod_mod_2p56s_ns,window_valid_pkt),UVM_HIGH);
    end else if (tod_mod_2p56s_ns < lwr_bound_p) begin
       window_valid_pkt = 0;
       m_o_ru_config.o_ru_cfg.pkt_cnt_c_early = m_o_ru_config.o_ru_cfg.pkt_cnt_c_early + 1;
      `uvm_info("C_RX_WINDOW", $sformatf("Condition Check:  Lower bound = %d ,Upper Bound = %d, Tod Val = %d : EARLY,pkt valid : %0d, Cnt = %0d",lwr_bound_p,upr_bound_p,tod_mod_2p56s_ns,window_valid_pkt,m_o_ru_config.o_ru_cfg.pkt_cnt_c_early),UVM_HIGH);
    end else if (tod_mod_2p56s_ns > upr_bound_p) begin
       window_valid_pkt = 0;
       m_o_ru_config.o_ru_cfg.pkt_cnt_c_late = m_o_ru_config.o_ru_cfg.pkt_cnt_c_late + 1;
       `uvm_info("C_RX_WINDOW", $sformatf("Condition Check: Lower bound = %d , Upper bound = %d ,Tod Val = %d : LATE,pkt valid : %0d, Cnt = %0d",lwr_bound_p,upr_bound_p,tod_mod_2p56s_ns,window_valid_pkt,m_o_ru_config.o_ru_cfg.pkt_cnt_c_early),UVM_HIGH);            end else begin
       `uvm_info("RX_WINDOW", $sformatf("Conditions not satisfied window valid pkt = %0d",window_valid_pkt),UVM_HIGH);
   end

  end else begin
    if(tod_mod_2p56s_ns > lwr_bound_p && tod_mod_2p56s_ns < upr_bound_p ) begin
       window_valid_pkt = 1 ;
      `uvm_info("RX_WINDOW", $sformatf("Condition Check:  Lower bound = %d ,Upper Bound = %d, Tod Val = %d: ON TIME,pkt valid : %0d",lwr_bound_p,upr_bound_p,tod_mod_2p56s_ns,window_valid_pkt),UVM_HIGH);
    end else if (tod_mod_2p56s_ns < lwr_bound_p) begin
       window_valid_pkt = 0;
       m_o_ru_config.o_ru_cfg.pkt_cnt_early = m_o_ru_config.o_ru_cfg.pkt_cnt_early + 1;
      `uvm_info("RX_WINDOW", $sformatf("Condition Check:  Lower bound = %d ,Upper Bound = %d, Tod Val = %d : EARLY,pkt valid : %0d, Cnt = %0d",lwr_bound_p,upr_bound_p,tod_mod_2p56s_ns,window_valid_pkt,m_o_ru_config.o_ru_cfg.pkt_cnt_early),UVM_HIGH);
    end else if (tod_mod_2p56s_ns > upr_bound_p) begin
       window_valid_pkt = 0;
       m_o_ru_config.o_ru_cfg.pkt_cnt_late = m_o_ru_config.o_ru_cfg.pkt_cnt_late + 1;
       `uvm_info("RX_WINDOW", $sformatf("Condition Check: Lower bound = %d , Upper bound = %d ,Tod Val = %d : LATE,pkt valid : %0d, Cnt = %0d",lwr_bound_p,upr_bound_p,tod_mod_2p56s_ns,window_valid_pkt,m_o_ru_config.o_ru_cfg.pkt_cnt_late),UVM_HIGH);
    end else begin
       `uvm_info("RX_WINDOW", $sformatf("Conditions not satisfied window valid pkt = %0d",window_valid_pkt),UVM_HIGH);
   end
  end

    endtask

task o_ru_ref_windowing::window_test_c_u(ref byte unsigned rx_data_que[$], ref o_ru_config_pkg::o_ru_ip_config m_config); 

   if(m_config.msg_type == 2)
     oran_window_c_plane(rx_data_que,m_config);
   else
      oran_window_u_plane(rx_data_que,m_config);
endtask


task o_ru_ref_windowing::oran_window_u_plane(ref byte unsigned rx_data_que[$], ref o_ru_config_pkg::o_ru_ip_config m_config);

    int frame_id, subframe_id, slot_id, symbol_id;
    bit [47:0] pkt_rcv_time, sym_time;

    frame_id      = rx_data_que[1]      ;
    subframe_id   = rx_data_que[2][7:4] ;
    slot_id       = {rx_data_que[2][3:0] ,rx_data_que[3][7:6]} ;
    symbol_id     = rx_data_que[3][5:0] ;

    `uvm_info("RX_WINDOW", $sformatf("frame = %0d, subfn = %0d, sym = %0d, slot_id = %0d",frame_id,subframe_id,symbol_id,slot_id),UVM_HIGH);

   if (symbol_id == 0 || symbol_id == 14)
     sym_time = 0;
    else
     sym_time = 36186+(35678*(symbol_id-1));

   `uvm_info("RX_WINDOW", $sformatf("symbol time = %0d",sym_time),UVM_HIGH);

    pkt_rcv_time = (10000000*(frame_id))+(1000000*(subframe_id))+ sym_time+(slot_id*500000);
   `uvm_info("RX_WINDOW", $sformatf("Pkt Receive Time = %0d, T2a_max_up = %0d, T2a_min_up = %0d",pkt_rcv_time,m_config.t2a_max_up,m_config.t2a_min_up),UVM_HIGH);

    lwr_bound = pkt_rcv_time - m_config.t2a_max_up;
    upr_bound = pkt_rcv_time - m_config.t2a_min_up;

   if (lwr_bound[31] == 1 || upr_bound[31] == 1) begin
       lwr_bound_p = lwr_bound + 2560000000;
       upr_bound_p = upr_bound + 2560000000;
       `uvm_info("RX_WINDOW", $sformatf("Lower bound = %0d, 2.56s Boundary = %0d",lwr_bound,lwr_bound_p),UVM_HIGH);
       `uvm_info("RX_WINDOW", $sformatf("Upper Bound = %0d, 2.56s Boundary = %0d",upr_bound,upr_bound_p),UVM_HIGH);
    end else begin
       lwr_bound_p = lwr_bound;
       upr_bound_p = upr_bound;
       `uvm_info("RX_WINDOW", $sformatf("Lower bound = %0d, Upper bound = %0d",lwr_bound_p,upr_bound_p),UVM_HIGH);
    end
endtask


task o_ru_ref_windowing::oran_window_c_plane(ref byte unsigned rx_data_que[$], ref o_ru_config_pkg::o_ru_ip_config m_config);

    int frame_id, subframe_id, slot_id, symbol_id;
    bit [47:0] pkt_rcv_time, sym_time;
   
    frame_id    = rx_data_que[1]      ; 
    subframe_id = rx_data_que[2][7:4] ;
    slot_id     = {rx_data_que[2][3:0] ,rx_data_que[3][7:6]};
    symbol_id   = rx_data_que[3][5:0] ;
    
    `uvm_info("C_RX_WINDOW", $sformatf("frame = %0d, subfn = %0d, sym = %0d, slot_id = %0d",frame_id,subframe_id,symbol_id,slot_id),UVM_HIGH);
    
    if (symbol_id == 0 || symbol_id == 14)
     sym_time = 0;
    else
     sym_time = 36186+(35678*(symbol_id-1));
 
   `uvm_info("C_RX_WINDOW", $sformatf("symbol time = %0d",sym_time),UVM_HIGH);
    
    pkt_rcv_time = (10000000*(frame_id))+(1000000*(subframe_id))+sym_time+(slot_id*500000);
    
    `uvm_info("C_RX_WINDOW", $sformatf("C Plane Pkt Receive Time = %0d, T1a_max_cp = %0d, T1a_min_cp = %0d",pkt_rcv_time,m_config.t1a_max_cp,m_config.t1a_min_cp),UVM_HIGH);
    
    lwr_bound = pkt_rcv_time - m_config.t1a_max_cp;
    upr_bound = pkt_rcv_time - m_config.t1a_min_cp;
    
    if (lwr_bound[31] == 1 || upr_bound[31] == 1) begin
       lwr_bound_p = lwr_bound + 2560000000; 
       upr_bound_p = upr_bound + 2560000000;
       `uvm_info("C_RX_WINDOW", $sformatf("C Plane Lower bound = %0d, 2.56s Boundary = %0d",lwr_bound,lwr_bound_p),UVM_HIGH);
       `uvm_info("C_RX_WINDOW", $sformatf("C Plane Upper Bound = %0d, 2.56s Boundary = %0d",upr_bound,upr_bound_p),UVM_HIGH);
    end else begin
       lwr_bound_p = lwr_bound;
       upr_bound_p = upr_bound;
       `uvm_info("C_RX_WINDOW", $sformatf("C Plane Lower bound = %0d, C Plane Upper bound = %0d",lwr_bound_p,upr_bound_p),UVM_HIGH);
    end
endtask

`endif 
