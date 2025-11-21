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
`ifndef AVMM_IF
`define AVMM_IF

  `include "uvm_macros.svh"
interface avmm_if 
import uvm_pkg::*;
import avmm_pkg::*;
// synopsys translate_off
#(
  // Parameters 
  parameter         PADDR_WIDTH  = 32,
  parameter         PWDATA_WIDTH = 32,
  parameter         PRDATA_WIDTH = 32, 
  parameter  string name         = "avstmm_master_vif",
  parameter         DRIVER       = 1
) 
// synopsys translate_on
// synopsys translate_off
(
  // Inputs
  input clk, 
  input rst_n
);
// synopsys translate_on

  logic m_ready ;
  logic m_done  ;
  // Control flags
  // synopsys translate_off
  bit                has_checks = 1;
  bit                has_coverage = 1;
  bit                has_error_signal = 1;
  parameter          pready_low_max_time = 100; //TODO should be parameter
  bit                en_pready_low_max_time = 1;
  int                count=0;
  // Actual Signals
  logic [PADDR_WIDTH-1:0]  paddr;
  logic                    pwrite;
  logic [PWDATA_WIDTH-1:0] pwdata;
  logic                    pread;
  logic [PRDATA_WIDTH-1:0] prdata;
  logic                    prdata_valid;
  logic                    pwait_request;
 

  clocking drv_cb @(posedge clk);
     output paddr;
     output pwrite;
     output pwdata;
     output pread;
     //input  prdata;
     //input  prdata_valid;
     output  m_ready;
     input pwait_request ;
  endclocking

  clocking mon_cb @(posedge clk);
     input  prdata;
     input  prdata_valid;
  endclocking


  modport drv_mp(clocking drv_cb);
  modport mon_mp(clocking mon_cb);

  avmm_pkg::avmm_item m_item;
  avmm_pkg::avmm_config m_config;

   initial begin 
      master_reset_signals();
   end 

   // Reset all master signals
   task master_reset_signals();
  
     paddr    = 0;    
     pwrite   = 0;        
     pread    = 0;    
     pwdata   = 0;     
   endtask : master_reset_signals

   task automatic DriveData(ref avmm_pkg::avmm_item item);
      $cast(m_item, item);          
      `uvm_info("AVMM_DBG", $psprintf("DriveData ITEM :\n%s",m_item.sprint()), UVM_HIGH)
    m_ready = 1'b1;
    if (m_item.m_transmit_delay > 0) begin
      repeat(m_item.m_transmit_delay) @(drv_cb);
      //repeat(m_item.m_transmit_delay) @(posedge clk);
    end

    @(drv_cb );
    if (m_item.m_direction == UVM_WRITE) begin //WRITE OPERATION
       count=count+1;
       if (count==1)begin
          repeat (5)  @(drv_cb );
          //repeat (4)  @(posedge clk );
       end
       wait (!pwait_request);
       repeat(1)@(drv_cb);
       paddr  = m_item.m_addr;
       pwrite = 1'b1;
       pwdata = m_item.m_data;
       pread  = 1'b0;
       @(drv_cb );
       //@(posedge clk );
       pwrite = 1'b0;
       pwdata = 0;
    end else if (m_item.m_direction == UVM_READ) begin //READ OPERATION
       wait (!pwait_request);
       repeat(1)@(drv_cb);
       pread = 1'b1;
       paddr  = m_item.m_addr;
       pwrite = 1'b0;
       pwdata = 0;
       @(drv_cb); 
       pread = 1'b0;        
       `uvm_info("AVMM_DBG", $psprintf("READ REGISTER ADDR FIRST:%h,DATA:%h",paddr,prdata), UVM_HIGH)
       //@(mon_cb.prdata_valid);
       wait (!pwait_request);
       @(posedge prdata_valid);
       //pread = 1'b0;
       @(mon_cb);
       m_item.m_data = prdata;
       `uvm_info("AVMM_DBG", $psprintf("READ REGISTER ADDR SECOND:%h,DATA:%h",paddr,prdata), UVM_HIGH)
    end  
    `uvm_info("AVMM_DBG", $psprintf("DriveData ITEM :\n%s",m_item.sprint()), UVM_HIGH)
      $cast(item, m_item);       
      m_ready = 1'b0;            
   endtask : DriveData 
    
  task automatic MonitorData(ref avmm_pkg::avmm_item item);
     forever begin
       @(posedge m_done);
`uvm_info("AVMM_DBG", $psprintf("MonitorData ITEM :\n%s",item.sprint()), UVM_HIGH)
       $cast(m_item, item);
     end
   endtask : MonitorData  


  
    task do_mon(avmm_item m_item);
    `uvm_info("AVMM_MON", "Do Monitor Called", UVM_DEBUG)
    forever begin
      @(drv_cb);
      //@(posedge clk);

      m_item.m_addr = paddr;
      m_item.m_slave = {>> {m_item.m_addr}};//m_config.get_slave_name_by_addr(m_item.m_addr);
      
      case (pwrite)
        1'b0 : m_item.m_direction = UVM_READ;
        1'b1 : m_item.m_direction = UVM_WRITE;
      endcase
      
      @(drv_cb);
      //@(posedge clk);
      
      if(m_item.m_direction == UVM_READ)
        m_item.m_data = prdata;
      if (m_item.m_direction == UVM_WRITE)
        m_item.m_data = pwdata;
  
      @(drv_cb);
      //@(posedge clk);
      if(m_item.m_direction == UVM_READ) begin
        if(prdata_valid != 1'b1)
          @(drv_cb);
          //@(posedge clk);
        m_item.m_data = prdata;
      end

      `uvm_info("AVMM_MON", $psprintf("Transfer collected :\n%s",
                m_item.sprint()), UVM_MEDIUM)
      end
  endtask : do_mon

endinterface : avmm_if

`endif // avmm_if

