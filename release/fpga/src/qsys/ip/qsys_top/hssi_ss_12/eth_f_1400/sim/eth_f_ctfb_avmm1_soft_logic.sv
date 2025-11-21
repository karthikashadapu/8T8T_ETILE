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


//-------------------------------------------------------------------------------------------------
// Name:        ctfb_avmm1_soft_logic.sv
// Author:      Ensheng Huang
// Description: This is a simple wrapper file around the ct3_xcvr_avmm_soft_logic_core
//              This wrapper enabled support for multiple interfaces, if needed
//-------------------------------------------------------------------------------------------------

module eth_f_ctfb_avmm1_soft_logic
#(

  //PARAM_LIST_START
  parameter avmm_interfaces = 1,  //Number of AVMM interfaces required - one for each bonded_lane, PLL, and Master CGB
  parameter rcfg_enable     = 0   //Enable/disable reconfig interface in the Native PHY or PLL IP
  //PARAM_LIST_END
)  
(
  //PORT_LIST_START
  // AVMM slave interface signals (user)
  input  wire  [avmm_interfaces-1     :0] avmm_clk, 
  input  wire  [avmm_interfaces-1     :0] avmm_reset,   
  input  wire  [avmm_interfaces*8-1   :0] avmm_writedata, 
  input  wire  [avmm_interfaces*10-1  :0] avmm_address,    // addr[9:8], 2'b11 for MAIB, rest for F-tile, addr[8] is Dword Access
  input  wire  [avmm_interfaces*9-1   :0] avmm_reservedin, //For F-tile high address bits
  input  wire  [avmm_interfaces-1     :0] avmm_write,
  input  wire  [avmm_interfaces-1     :0] avmm_read,
  output reg   [avmm_interfaces*8-1   :0] avmm_readdata, 
  output wire  [avmm_interfaces-1     :0] avmm_waitrequest,
  // Signals from AVMM1 building block
  input  wire  [avmm_interfaces-1     :0] pld_avmm1_busy_real,
  input  wire  [avmm_interfaces-1     :0] pld_avmm1_cmdfifo_wr_full_real,
  input  wire  [avmm_interfaces-1     :0] pld_avmm1_cmdfifo_wr_pfull_real,
  input  wire  [avmm_interfaces*8-1   :0] pld_avmm1_readdata_real,
  input  wire  [avmm_interfaces-1     :0] pld_avmm1_readdatavalid_real,
  input  wire  [avmm_interfaces*3-1   :0] pld_avmm1_reserved_out_real,
  input  wire  [avmm_interfaces-1     :0] pld_chnl_cal_done_real,
  input  wire  [avmm_interfaces-1     :0] pld_hssi_osc_transfer_en_real,
  // Signals to AVMM1 building block
  output wire  [avmm_interfaces-1     :0] pld_avmm1_clk_rowclk_real,
  output wire  [avmm_interfaces-1     :0] pld_avmm1_read_real,
  output wire  [avmm_interfaces*10-1  :0] pld_avmm1_reg_addr_real,
  output wire  [avmm_interfaces-1     :0] pld_avmm1_request_real,
  output wire  [avmm_interfaces*9-1   :0] pld_avmm1_reserved_in_real,
  output wire  [avmm_interfaces-1     :0] pld_avmm1_write_real,
  output wire  [avmm_interfaces*8-1   :0] pld_avmm1_writedata_real
  //PORT_LIST_END
);
 

generate
genvar ig;
for(ig=0;ig<avmm_interfaces;ig=ig+1) begin : avmm_if_soft_logic

assign pld_avmm1_clk_rowclk_real[ig]       =  avmm_clk[ig];
assign pld_avmm1_read_real[ig]             =  avmm_read[ig];
assign pld_avmm1_reg_addr_real[ig*10 +:10] =  avmm_address[ig*10 +:10];
assign pld_avmm1_reserved_in_real[ig*9 +:9]=  avmm_reservedin[ig*9 +:9];
assign pld_avmm1_writedata_real [ig*8 +:8] =  avmm_writedata[ig*8 +:8];

eth_f_ctfb_avmm_maib_if
#(
   //The soft logic core has logic for handling cases related to both avmm1 and avmm2
   //This instantiation only looks as logic related to AVMM1
   .avmm_interface_type        ("avmm1"                         ),           
   .rcfg_enable                (rcfg_enable                     )
) 
ctfb_avmm_maib_if_inst (
   //Inputs
   .avmm_clk                   ( avmm_clk            [ig]        ),
   .avmm_reset                 ( avmm_reset          [ig]        ),
   .avmm_writedata             ( avmm_writedata      [ig*8+:8]   ), 
   .avmm_address               ( {2'b0, avmm_reservedin[ig*9+:9], avmm_address[ig*10+:10]}),
   .avmm_write                 ( avmm_write          [ig]        ),
   .avmm_read                  ( avmm_read           [ig]        ),
   .avmm_readdata_int          ( pld_avmm1_readdata_real         [ig*8+:8]   ),
   .avmm_readdatavalid         ( pld_avmm1_readdatavalid_real    [ig]        ),
   .avmm_cmdfifo_pfull         ( pld_avmm1_cmdfifo_wr_pfull_real [ig]        ),
   .avmm_busy                  ( pld_avmm1_busy_real             [ig]        ),
   .avmm_reservedout           ( pld_avmm1_reserved_out_real     [ig*3+:3]   ),
   .avmm_writedone             ( 1'b0 /*not used for AVMM1, used reservedout[1] instead*/     ),
   //Outputs
   .avmm_readdata              ( avmm_readdata                  [ig*8+:8]   ), 
   .avmm_waitrequest           ( avmm_waitrequest               [ig]        ),
   .avmm_request               ( pld_avmm1_request_real         [ig]        ),
   .soft_avmm_write            ( pld_avmm1_write_real           [ig]        ),
   .soft_avmm_read             ( /*not used for AVMM1*/          )
);

end //end for begin
endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX+3TXOKZcUXDiXv2ppDh0dX5N+3WuUmZY73TTiqb5wAhBkkgdVamooszolv/IdgTI6lM31KVLGmQzpJj7zzE38P91uBJmIO0gm+/v1Q99eDB16viefVA56CxUaqw8PduRHKoCRq7yT7DM7Wb21Z4FRBaTC6e3NXvLFo03dfKuJaTbTUT1C7RsvZs7STZ84zNeiZL7+yx1lt/dwV2pYlAyGV+DFZW/j12GN7eC0TmoGgV1KaX1OFDO6xt9nbUcPLhMxkUfHIciDGbvMTgir5g5Jn/ipm8Ry19O/6U+9y2sAjnb/YxFRWgrckjZQLtv1bbQUsZl1W1eHgkAAstTHoGkH2AVFiVBVmyYZDSqchR6WXdfFqZye1ap147o9c7Q9UyJ9+kJnp4qZo/YxnpPCxlWxM9w/BeMbk3knm/hCivUIEl/ACx33v8KNHCq0wuH0a+E3rVR8XZkkvzMc8q6iAxG9VeV2BilHRYXSxt7vLaxEycLqYDQh4Mv33TKaYOfsNYLqHFsbYlPZyDH6UDEppOaN6+WDYSxPyfHN2Y/PqqjYW/m0VzJMuAipRhSnOwEUAJtJU/0vZEyeIw034MpBTPDm7PgQmJZO25lbW5WW1jyqbCTS56w6e5BVfiMWa5cpwRTyc7wo+aYiqlwmcePAsDqQ774LdxsE1dHX14YdCajVwOzhwY70qfEMlZuRNwPP5+6ijNYDxEUSky999QAXk6Zws/kcJW7vFTS+U8KdX45FY+7F6syIK0l8L3feZ4Kyrv5SkiIHtv6OPI6opFt8sD07D"
`endif