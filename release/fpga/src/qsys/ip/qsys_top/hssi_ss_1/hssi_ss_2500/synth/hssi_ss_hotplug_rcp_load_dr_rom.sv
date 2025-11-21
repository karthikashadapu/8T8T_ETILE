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


module hssi_ss_hotplug_rcp_load_dr_rom

#(
  parameter RCP_ROM_SEL      = "DR",
  parameter RCFG_ROM_STYLE   = "LOGIC",           //Type of inferred rom ("", "MLAB", or "M20K")
  parameter ROM_ADDR_WIDTH = 10,
  parameter ROM_DATA_WIDTH= 32
)(
  input  wire                               clk,
  input  wire [ROM_ADDR_WIDTH-1:0]          addr,
  output reg  [ROM_DATA_WIDTH-1:0]          data
);


  localparam ROM_DEPTH = 2**ROM_ADDR_WIDTH;

  (* romstyle = RCFG_ROM_STYLE *) reg [ROM_DATA_WIDTH-1:0] rom [0:ROM_DEPTH-1]; //Inferred rom

  initial begin
    if(RCP_ROM_SEL == "DR")
      rom = hssi_ss_hotplug_rcp_load_rom_params_dr::config_rom;
    else
      rom = hssi_ss_hotplug_rcp_load_rom_params_dr::config_rom;
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
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6ythEG1OSO/E3CVWfNlPCwxEjrkMwby/G9DsE3No2ueZGdpNJyripfvJyCV2yiIRgI/JIcRGreCoxKznH911F50asQ+ZQuOKz7hNbHSe3bMUMuoyHDcRHcueY9TLOmX/evdEV0UUlkvL6SJjdD8DDYNkV1IymeE1AFIdNrBFFx/sCDLgm4iF0YGa0yiHn5EjxIHYk2orR+TKVkzn3oiXDHnuVIu2IBbgvjCL8i4QPPU0MiGwtjdyXPkGs1+A1bWJ1tcZwbDFkQ4QqmEb4eyDqCi7UNJ0GDyjQsaItRgOydNuQ5vQ+JE2Qz2YtMKz4H4vV20Exfzt/xouM4LsKiF/o+ALK0dXlMTGml5acuVt8PaVcLQjzR9PgIuM1KVHX6jWScjX64zCAtsPlsf8RhTa2a/zr3UBGXPDqLQEk1ujVuZUnpV0LSuwEhRU5D6EnIls0Is8sap933m+naMkwaF0DKPcJAo0o2GSXW7Sqetsu1jRRc4oFfvMaC98klCeTmPi/NSSSTpF2tUQNOkS5AoOvIFu7WESC2uDaWushxLlrG7QDAIN/5RlyWdp0Km1AeU2UJD46CbfLAXyiBcG22nLAAqBrwNd/ALwZIbY5USaYhyxOopy1QctJ2FmvMIfDdb3ElLiVVWrW/Nz+7Zzfc8YJOJPp5yjUOYTZendEU49cSv/5jssF3cJA1gT4Fq4vNTvSlz6gpFLxL5u6Px79lxVFPrQMlEB+sPulfs9xtLgUcn/zBzmTTDN3i5vuY545q/iDLbtcRZ4GC60A0NNqzb7pSQo"
`endif