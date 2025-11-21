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


// (C) 2001-2022 Intel Corporation. All rights reserved.
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


//**********************************************************************************
// Synchronous ROM for storing multiple configurations
//**********************************************************************************
`timescale 1 ps/1 ps


module hssi_ss_hotplug_rcp_load_rom

#(
  parameter RCP_ROM_SEL      = "10G_NRZ",
  parameter RCFG_ROM_STYLE   = "LOGIC",           //Type of inferred rom ("", "MLAB", or "M20K")
  parameter ROM_ADDR_WIDTH = 8,
  parameter ROM_DATA_WIDTH= 32
)(
  input  wire                               clk,
  input  wire [ROM_ADDR_WIDTH-1:0]          addr,
  output reg  [ROM_DATA_WIDTH-1:0]          data
);


  localparam ROM_DEPTH = 2**ROM_ADDR_WIDTH;

  (* romstyle = RCFG_ROM_STYLE *) reg [ROM_DATA_WIDTH-1:0] rom [0:ROM_DEPTH-1]; //Inferred rom

  initial begin
    if(RCP_ROM_SEL == "25G_NRZ")
      rom = hssi_ss_hotplug_rcp_load_rom_params_25g::config_rom;
    else if(RCP_ROM_SEL == "50G_PAM4")
      rom = hssi_ss_hotplug_rcp_load_rom_params_50g::config_rom;
    else
      rom = hssi_ss_hotplug_rcp_load_rom_params_10g::config_rom;
  end

  always @ (posedge clk) begin
    data <= rom[addr]; //Synchronously read data from rom
  end


/*
  always @ (posedge clk) begin
if (addr == 0)  data = 32'h8000_1234;
if (addr == 1)  data = 32'h7700_ABCD;
if (addr == 2)  data = 32'hFFFF_FFFF;

end
*/
endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6yvrSiga6BhNfGfS7u4b8wjDQNB5ueQVbtH6XadsqUy1rIUDkpbMuOoz9L1uHBVsJq59N0gC0NTSQYfaU7C2DaEWZIXtyCRfGHy0WlDCixt4DXjOi/ggWUYMR/E8aZslcngC+HhCDhAcvLBJbvNzHBHnPPnAY7BhlDRECJ/DmVrC2uB/K5fS2tMmdjJGcCLVvrolZELcFzihrI6jGWx27eC3Su3cfV0McPCOTD6gYkP/9I8tWY9OqgkUvJU7FUeO2iwVHrcuW5GP/ErAYCbQA6iASPLsu7+unMGv+2lKVzd0pjIOOq8kWAUaV8qOQdejQFZEmCIFuaBW9GP8nlrb5/CY98c79cTpGUxRgPeFo6meYhg4J6bqKSxW4lHbgNSbbyYFg2Du9J7qWsLMEw1vy3dejxJ6gDYVRqXINVNGh9fbag/qTcOmHql6zWCRZZMZJaA9k+oJcV1WLCyLPU9nx1L1A4N42CEV5mcJwGwdukKtuy5leo929jmfpS3kbpkCf+9PuHlxbApJi40upUXALQazsDjJ8pZM01mMnmQIv/xoQmgDC24WFDmgPgBIAOApG4sGCDRNxOtHivpzclwE0NKKLlLX8Xqufd0L9WaUxyTUSwxOlxd34DtXXX8PvcfK97ieJo7xpWVLWKWlzfuoKbvMCsnaFvRhsK+FLM+CZGV6PgyOhHeIt/8TfhlXj873JxITpTJq8r2HlLSrueVLJ02rpa4BMRhFT2YBysSOs0nPNf3Y50fiZMEHsRO7WaJES06aaJAXrm6RZIJplIvhdEVS"
`endif