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

`ifndef O_RU_REF_SV 
`define O_RU_REF_SV 

//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref
//------------------------------------------------------------------------------ 

class o_ru_ref extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref) 
    int sym_prach ;
    o_ru_coverage_cg              o_ru_coverage_cg_h    ;
    o_ru_ref_ecpri_demapper       m_ref_ecpri_demapper;
    o_ru_ref_ecpri_header_extract m_ref_ecpri_header_extract;
    o_ru_ref_oran_demapper        m_ref_oran_demapper ;
    o_ru_ref_fdv_demapper         m_ref_fdv_demapper  ;
    o_ru_ref_ifft                 m_ref_ifft          ;
    o_ru_ref_ifft_power_meter     m_ref_ifft_pwr_mtr  ;
    o_ru_ref_interleaver          m_ref_interleaver   ;
    o_ru_ref_duc                  m_ref_duc           ;
    o_ru_ref_mixer_dl             m_ref_mixer_dl      ;
    o_ru_ref_summer               m_ref_summer        ;
    o_ru_ref_interpolator         m_ref_interpolator  ;
    o_ru_ref_decimator            m_ref_decimator     ;
    o_ru_ref_mixer_ul             m_ref_mixer_ul      ;
    o_ru_ref_ddc                  m_ref_ddc           ;
    o_ru_ref_deinterleaver        m_ref_deinterleaver ;
    o_ru_ref_fft                  m_ref_fft           ;
    o_ru_ref_fft_power_meter      m_ref_fft_pwr_mtr  ;
    o_ru_ref_prach                m_ref_prach         ;
    o_ru_ref_ecpri_mapper         m_ref_ecpri_mapper  ;
    o_ru_ref_ecpri_prach_mapper   m_ref_ecpri_prach_mapper  ;
    o_ru_ref_oran_mapper          m_ref_oran_mapper   ;
    o_ru_ref_oran_prach_mapper    m_ref_oran_prach_mapper   ;
    o_ru_ref_c_u_coupling         m_ref_c_u_coupling  ;
    o_ru_ref_windowing_ul         m_ref_windowing_ul  ;
    o_ru_ref_windowing            m_ref_windowing     ;
    avsts_item                  m_item              ;
    avsts_item                  m_item_inp          ;
    o_ru_ref_avsts_item           ref_item            ; 

   //------------------------------------------------------------------------------ 
   // Constructor 
   //------------------------------------------------------------------------------ 
   function new (string name, uvm_component parent); 
      super.new(name, parent);
   endfunction : new 

extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);
extern virtual task run_phase(uvm_phase phase);

endclass: o_ru_ref

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------
 
  function void o_ru_ref::build_phase(uvm_phase phase);
     super.build_phase(phase);
     m_ref_ecpri_demapper        =  o_ru_ref_ecpri_demapper::type_id::create(.name("m_ref_ecpri_demapper"), .parent(this));
     m_ref_ecpri_header_extract  =  o_ru_ref_ecpri_header_extract::type_id::create(.name("m_ref_ecpri_header_extract"), .parent(this));
     m_ref_oran_demapper         =  o_ru_ref_oran_demapper::type_id::create(.name("m_ref_oran_demapper"), .parent(this));
     m_ref_fdv_demapper          =  o_ru_ref_fdv_demapper::type_id::create(.name("m_ref_fdv_demapper"), .parent(this));
     m_ref_ifft                  =  o_ru_ref_ifft::type_id::create(.name("m_ref_ifft"), .parent(this));
     m_ref_ifft_pwr_mtr          =  o_ru_ref_ifft_power_meter::type_id::create(.name("m_ref_ifft_pwr_mtr"), .parent(this));
     m_ref_interleaver           =  o_ru_ref_interleaver::type_id::create(.name("m_ref_interleaver"), .parent(this));
     m_ref_duc                   =  o_ru_ref_duc::type_id::create(.name("m_ref_duc"), .parent(this));
     m_ref_mixer_dl              =  o_ru_ref_mixer_dl::type_id::create(.name("m_ref_mixer_dl"), .parent(this));
     m_ref_summer                =  o_ru_ref_summer::type_id::create(.name("m_ref_summer"), .parent(this));
     m_ref_interpolator          =  o_ru_ref_interpolator::type_id::create(.name("m_ref_interpolator"), .parent(this));
     m_ref_decimator             =  o_ru_ref_decimator::type_id::create(.name("m_ref_decimator"), .parent(this));
     m_ref_mixer_ul              =  o_ru_ref_mixer_ul::type_id::create(.name("m_ref_mixer_ul"), .parent(this));
     m_ref_ddc                   =  o_ru_ref_ddc::type_id::create(.name("m_ref_ddc"), .parent(this));
     m_ref_deinterleaver         =  o_ru_ref_deinterleaver::type_id::create(.name("m_ref_deinterleaver"), .parent(this));
     m_ref_fft                   =  o_ru_ref_fft::type_id::create(.name("m_ref_fft"), .parent(this));
     m_ref_fft_pwr_mtr          =  o_ru_ref_fft_power_meter::type_id::create(.name("m_ref_fft_pwr_mtr"), .parent(this));
     m_ref_prach                 =  o_ru_ref_prach::type_id::create(.name("m_ref_prach"), .parent(this));
     m_ref_ecpri_mapper          =  o_ru_ref_ecpri_mapper::type_id::create(.name("m_ref_ecpri_mapper"), .parent(this));
     m_ref_ecpri_prach_mapper    =  o_ru_ref_ecpri_prach_mapper::type_id::create(.name("m_ref_ecpri_prach_mapper"), .parent(this));
     m_ref_oran_mapper           =  o_ru_ref_oran_mapper::type_id::create(.name("m_ref_oran_mapper"), .parent(this));
     m_ref_oran_prach_mapper     =  o_ru_ref_oran_prach_mapper::type_id::create(.name("m_ref_oran_prach_mapper"), .parent(this));
     m_ref_c_u_coupling          =  o_ru_ref_c_u_coupling::type_id::create(.name("m_ref_c_u_coupling"), .parent(this));
     m_ref_windowing             =  o_ru_ref_windowing::type_id::create(.name("m_ref_windowing"), .parent(this));
     m_ref_windowing_ul          =  o_ru_ref_windowing_ul::type_id::create(.name("m_ref_windowing_ul"), .parent(this));
     ref_item                    =  new();
     o_ru_coverage_cg_h            =  new();
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    
    m_ref_ecpri_demapper.m_output[0].connect(m_ref_windowing.m_input[0]);
    m_ref_windowing.m_output[0].connect(m_ref_oran_demapper.m_input[0]);
    if(`ORAN_LPBK_EN == 1) begin
       m_ref_oran_demapper.m_output[0].connect(m_ref_oran_mapper.m_input[0]);
    end else begin
      `ifndef ECPRI_ORAN_SS
        m_ref_oran_demapper.m_output[0].connect(m_ref_fdv_demapper.m_input[0]);
      `endif
    end
    m_ref_fdv_demapper.m_output[0].connect(m_ref_ifft.m_input[0]);
    m_ref_fdv_demapper.m_output[1].connect(m_ref_ifft.m_input[1]);
    m_ref_ifft.m_output[0].connect(m_ref_interleaver.m_input[0]) ;
    m_ref_ifft.m_output[1].connect(m_ref_interleaver.m_input[1]) ;
    m_ref_fdv_demapper.m_output[0].connect(m_ref_ifft_pwr_mtr.m_input[0]) ;
    m_ref_fdv_demapper.m_output[1].connect(m_ref_ifft_pwr_mtr.m_input[1]) ;
    if (`DFE_LPBK_EN == 1) begin
      m_ref_interleaver.m_output[0].connect(m_ref_duc.m_input[0])  ;
      m_ref_interleaver.m_output[1].connect(m_ref_duc.m_input[1])  ;
      m_ref_duc.m_output[0].connect(m_ref_mixer_dl.m_input[0]);
      m_ref_duc.m_output[1].connect(m_ref_mixer_dl.m_input[1]);
      m_ref_mixer_dl.m_output[0].connect(m_ref_summer.m_input[0]);
      m_ref_mixer_dl.m_output[1].connect(m_ref_summer.m_input[1]);
      m_ref_summer.m_output[0].connect(m_ref_interpolator.m_input[0]);
      if(`UL_INJ == 0) begin
        m_ref_interpolator.m_output[0].connect(m_ref_decimator.m_input[0]);
      end
      m_ref_decimator.m_output[0].connect(m_ref_mixer_ul.m_input[0]);
      //m_ref_decimator.m_output[0].connect(m_ref_prach.m_input[0]);
      m_ref_mixer_ul.m_output[0].connect(m_ref_ddc.m_input[0]);
      m_ref_mixer_ul.m_output[1].connect(m_ref_ddc.m_input[1]);
      m_ref_ddc.m_output[0].connect(m_ref_deinterleaver.m_input[0]);
      m_ref_ddc.m_output[1].connect(m_ref_deinterleaver.m_input[1]);
    end else if (`IFFT_FFT_LPBK_EN == 1) begin
      m_ref_ifft.m_output[0].connect(m_ref_deinterleaver.m_input[0])  ;
      m_ref_ifft.m_output[1].connect(m_ref_deinterleaver.m_input[1])  ;
    end
    m_ref_deinterleaver.m_output[0].connect(m_ref_fft.m_input[0]);
    m_ref_deinterleaver.m_output[1].connect(m_ref_fft.m_input[1]);
    m_ref_deinterleaver.m_output[0].connect(m_ref_fft_pwr_mtr.m_input[0]);
    m_ref_deinterleaver.m_output[1].connect(m_ref_fft_pwr_mtr.m_input[1]);
    m_ref_prach.m_output[0].connect(m_ref_c_u_coupling.m_input[2]);
    m_ref_prach.m_output[1].connect(m_ref_c_u_coupling.m_input[3]);
    if (`PCAP_LPBK_EN == 1) begin 
      m_ref_ecpri_demapper.m_output[0].connect(m_ref_oran_mapper.m_input[0]);  
    end else begin 
      m_ref_fft.m_output[0].connect(m_ref_c_u_coupling.m_input[0]);
      m_ref_fft.m_output[1].connect(m_ref_c_u_coupling.m_input[1]);
      m_ref_c_u_coupling.m_output[0].connect(m_ref_windowing_ul.m_input[0]);
      m_ref_c_u_coupling.m_output[1].connect(m_ref_windowing_ul.m_input[1]);
      m_ref_windowing_ul.m_output[0].connect(m_ref_oran_mapper.m_input[0]);
      m_ref_windowing_ul.m_output[1].connect(m_ref_oran_prach_mapper.m_input[0]);

      m_ref_oran_mapper.m_output[0].connect(m_ref_ecpri_mapper.m_input[0]);
      m_ref_oran_prach_mapper.m_output[0].connect(m_ref_ecpri_prach_mapper.m_input[0]);
    end

    ////// Scoreboard Connections  from Reference Model ///////////////
    m_ref_ecpri_demapper.m_output[0].connect(m_output[0]);
    m_ref_oran_demapper.m_output[0].connect(m_output[1]);
    m_ref_fdv_demapper.m_output[0].connect(m_output[2]);
    m_ref_oran_mapper.m_output[0].connect(m_output[3]) ;
    m_ref_ecpri_mapper.m_output[0].connect(m_output[4]);
    m_ref_c_u_coupling.m_output[0].connect(m_output[5]);
    m_ref_fdv_demapper.m_output[1].connect(m_output[6]);
    m_ref_ifft.m_output[0].connect(m_output[7]);
    m_ref_ifft.m_output[1].connect(m_output[8]);
    m_ref_interleaver.m_output[0].connect(m_output[9]) ;
    m_ref_interleaver.m_output[1].connect(m_output[10]);
    m_ref_duc.m_output[0].connect(m_output[11]);
    m_ref_duc.m_output[1].connect(m_output[12]);
    m_ref_mixer_dl.m_output[0].connect(m_output[13]);
    m_ref_mixer_dl.m_output[1].connect(m_output[14]);
    m_ref_summer.m_output[0].connect(m_output[15]);
    m_ref_interpolator.m_output[0].connect(m_output[16]);
    m_ref_decimator.m_output[0].connect(m_output[17]);
    m_ref_mixer_ul.m_output[0].connect(m_output[18]);
    m_ref_mixer_ul.m_output[1].connect(m_output[19]);
    m_ref_ddc.m_output[0].connect(m_output[20]);
    m_ref_ddc.m_output[1].connect(m_output[21]);
    m_ref_deinterleaver.m_output[0].connect(m_output[22]);
    m_ref_deinterleaver.m_output[1].connect(m_output[23]);
    m_ref_fft.m_output[0].connect(m_output[24]);
    m_ref_fft.m_output[1].connect(m_output[25]);
    m_ref_prach.m_output[0].connect(m_output[26]);
    m_ref_prach.m_output[1].connect(m_output[27]);
    m_ref_c_u_coupling.m_output[1].connect(m_output[28]);
    m_ref_oran_prach_mapper.m_output[0].connect(m_output[29]) ;
    m_ref_ecpri_prach_mapper.m_output[0].connect(m_output[30]);

  endfunction: connect_phase


  task o_ru_ref::run_phase(uvm_phase phase);
     o_ru_coverage_cg_h.sample(m_config);
     fork
       forever
       begin
         `ifdef SHORT_PRACH_FORMAT
            sym_prach = 12 * `AXC_NUM   ;
         `else
            sym_prach = 1 * `AXC_NUM    ;
         `endif
         for(int j = 0 ; j < `SF_NUM ; j++) begin
           @(m_config.prach_c_event_done);
           for(int i = 0 ; i < (sym_prach) / 2 ; i++) begin
              m_ref_prach.m_input[0].write(ref_item);
           end 
         end 
       end
       forever
       begin
          m_item    = new(); 
          m_item_inp= new(); 
          m_fifo[0].get(m_item_inp);
          $cast(m_item,m_item_inp);
          ref_item = new();
          foreach(m_item.buf_packet_out[j])
             ref_item.buf_packet_out= m_item.buf_packet_out;
          m_ref_ecpri_header_extract.m_input[0].write(ref_item);
          m_ref_ecpri_demapper.m_input[0].write(ref_item);
          if (`PCAP_LPBK_EN == 1) begin
             m_ref_ecpri_mapper.m_input[0].write(ref_item);   
          end  
       end
       forever
       begin
          m_item    = new(); 
          m_item_inp= new(); 
          m_fifo[1].get(m_item_inp);
          $cast(m_item,m_item_inp);
          ref_item = new();
          ref_item.buf_packet_out= m_item.buf_packet_out;
          m_ref_c_u_coupling.m_input[0].write(ref_item);
          m_item    = new(); 
          m_item_inp= new(); 
          if(m_config.cc2_dis != 1) begin
            m_fifo[2].get(m_item_inp);
            $cast(m_item,m_item_inp);
            ref_item = new();
            ref_item.buf_packet_out= m_item.buf_packet_out;
            m_ref_c_u_coupling.m_input[1].write(ref_item);
            m_item    = new(); 
            m_item_inp= new();
          end 
       end
       forever
       begin
          m_item    = new(); 
          m_item_inp= new(); 
          m_fifo[3].get(m_item_inp);
          $cast(m_item,m_item_inp);
          ref_item = new();
          ref_item.buf_packet_out= m_item.buf_packet_out;
          m_ref_c_u_coupling.m_input[2].write(ref_item);
          m_item    = new(); 
          m_item_inp= new(); 
          if(m_config.cc2_dis != 1) begin
            m_fifo[4].get(m_item_inp);
            $cast(m_item,m_item_inp);
            ref_item = new();
            ref_item.buf_packet_out= m_item.buf_packet_out;
            m_ref_c_u_coupling.m_input[3].write(ref_item);
            m_item    = new(); 
            m_item_inp= new(); 
          end
       end
       forever
       begin
          m_item    = new(); 
          m_item_inp= new(); 
          m_fifo[5].get(m_item_inp);
          $cast(m_item,m_item_inp);
          ref_item = new();
          ref_item.buf_packet_out= m_item.buf_packet_out;
          m_ref_decimator.m_input[0].write(ref_item);
          m_item    = new(); 
          m_item_inp= new(); 
       end
     join_none
  endtask : run_phase
`endif 
