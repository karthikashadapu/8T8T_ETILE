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

`ifndef O_RU_REG_ADAPTER_AVMM_SV
`define O_RU_REG_ADAPTER_AVMM_SV

  class o_ru_reg_adapter_avmm extends uvm_reg_adapter;
    `uvm_object_utils(o_ru_reg_adapter_avmm)
  
    function new(string name="o_ru_reg_adapter_avmm");
      super.new(name);
    endfunction : new
  
    extern function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    extern function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
  endclass : o_ru_reg_adapter_avmm
  
  function uvm_sequence_item o_ru_reg_adapter_avmm::reg2bus(const ref uvm_reg_bus_op rw);
    avmm_item item;
    item        = avmm_item::type_id::create("item");
    item.m_addr = rw.addr;
    item.m_data = rw.data;
    item.m_direction = rw.kind; 
    return (item);
  endfunction : reg2bus
  
  function void o_ru_reg_adapter_avmm::bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    avmm_item item;
    if (!$cast(item, bus_item)) begin
      `uvm_fatal("NOT_REG_TYPE","Provided bus_item is not of the correct type. Expecting reg_item")
       return;
    end
    rw.kind   = item.m_direction; 
    rw.addr   = item.m_addr;
    rw.data   = item.m_data;
    rw.status = UVM_IS_OK;
  endfunction  : bus2reg

`endif 
