/*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %                                                                           %
 % BigCat Wireless Pvt Ltd CONFIDENTIAL                                      %
 %                                                                           %
 % [2018]  BigCat Wireless Pvt Ltd                                           %
 %  All Rights Reserved.                                                     %
 %                                                                           %
 % All information contained herein is, and remains the property of          %
 % BigCat Wireless. The intellectual and technical concepts contained        %
 % herein are proprietary to BigCat Wireless Pvt Ltd and may be covered      %
 % by Patents, patents in process and protected by trade secret or           %
 % copyright law. Dissemination of this information or reproduction of       %
 % this material is strictly forbidden unless prior written permission is    %
 % obtained from BigCat Wireless Pvt Ltd.                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/

`ifndef REG_ADAPTER_SV
`define REG_ADAPTER_SV

  class reg_adapter extends uvm_reg_adapter;
    `uvm_object_utils(reg_adapter)
  
    function new(string name="reg_adapter");
      super.new(name);
    endfunction : new
  
    extern function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    extern function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
  endclass : reg_adapter
  
  function uvm_sequence_item reg_adapter::reg2bus(const ref uvm_reg_bus_op rw);
    avmm_item item;
    item        = avmm_item::type_id::create("item");
    item.m_addr = rw.addr;
    item.m_data = rw.data;
    item.m_direction = rw.kind; 
    item.m_transmit_delay = 2;
    return (item);
  endfunction : reg2bus
  
  function void reg_adapter::bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    avmm_item item;
    if (!$cast(item, bus_item)) begin
      `uvm_fatal("NOT_REG_TYPE","Provided bus_item is not of the correct type. Expecting avmm_item")
       return;
    end
    rw.kind   = item.m_direction; 
    rw.addr   = item.m_addr;
    rw.data   = item.m_data;
    rw.status = UVM_IS_OK;
  endfunction  : bus2reg

`endif 

