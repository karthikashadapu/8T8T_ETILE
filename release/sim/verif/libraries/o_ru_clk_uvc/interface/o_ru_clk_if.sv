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
`ifndef TIMEUNIT_VAL
 `define TIMEUNIT_VAL 1ns
`endif
`ifndef TIMEPRECISION_VAL
 `define TIMEPRECISION_VAL 1fs
`endif

`ifndef O_RU_CLK_IF
`define O_RU_CLK_IF



interface o_ru_clk_if 
// synopsys translate_off
#(
  // Parameters 
  //parameter realtime TIME_PERIOD      = 1.0ns,
  parameter realtime TIME_PERIOD      = 1000ps,
  parameter logic    RESET_ACTIVE_LOW = 1'b1
) 
// synopsys translate_on
();

timeunit `TIMEUNIT_VAL;
timeprecision `TIMEPRECISION_VAL;
  // Interface Signals
  logic  clk;
  logic  rst; 

  // Control flags
  // synopsys translate_off
  bit                     c_has_checks = 1;
  realtime                c_reset_off  = 5.12us;
  
  // synopsys translate_on

  modport master (
    output clk,
    output rst 
  );
  
  modport slave (
    input clk, 
    input rst 
  );
  
  modport monitor (
    input  clk,
    input  rst 
  );

  //
  // Drive CLK
  // 
  initial begin
    clk <= 1'b0;
    forever begin
      #(TIME_PERIOD / 2);
      clk <= ~clk;
    end
  end

  //
  // Drive RESET
  // 
  initial begin
    if(RESET_ACTIVE_LOW) begin
      rst <= 1'b0;
    end else begin
      rst <= 1'b1;
    end
    #c_reset_off;             
    rst <= ~rst;
  end

endinterface : o_ru_clk_if
`endif
