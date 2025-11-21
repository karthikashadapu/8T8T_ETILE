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
// Name:        ctfb_avmm2_soft_logic.sv
// Author:      Ensheng Huang
// Description: This is a multi-channel wrapper file that connects agx_f avmm building blocks
//              or hip, to ct3_avmm_soft_logic_core.
//-------------------------------------------------------------------------------------------------
 
module eth_f_ctfb_avmm2_soft_logic
#(
  parameter avmm_interfaces                  = 1,                        //Number of AVMM interfaces required - one for each bonded_lane, PLL, and Master CGB
  parameter rcfg_enable                      = 0                        //Enable/disable reconfig interface in the XCVR PMA or PCIe IPs
) (
  // AVMM slave interface signals (user)
  input  wire  [avmm_interfaces-1     :0] avmm_clk,
  input  wire  [avmm_interfaces-1     :0] avmm_reset,
  input  wire  [avmm_interfaces*8-1   :0] avmm_writedata, 
  input  wire  [avmm_interfaces*21-1  :0] avmm_address, // Same address width as shown in avmm2 atom
  input  wire  [avmm_interfaces-1     :0] avmm_write,
  input  wire  [avmm_interfaces-1     :0] avmm_read,
  output reg   [avmm_interfaces*8-1   :0] avmm_readdata, 
  output wire  [avmm_interfaces-1     :0] avmm_waitrequest,
  //AVMM interface busy with calibration
  output wire  [avmm_interfaces-1     :0] avmm_busy,
     
  // Expose clkchnl to wire up with pld_adapt avmmclk for Place and Route in Fitter
  output  wire  [avmm_interfaces-1    :0] avmm_clkchnl,
 
  // ports to/from hip ports of building block
  output wire  [avmm_interfaces-1     :0]  hip_avmm_read_real,
  input  wire  [avmm_interfaces*8-1   :0]  hip_avmm_readdata_real,
  input  wire  [avmm_interfaces-1     :0]  hip_avmm_readdatavalid_real,
  output wire  [avmm_interfaces*21-1  :0]  hip_avmm_reg_addr_real,
  input  wire  [avmm_interfaces*5-1   :0]  hip_avmm_reserved_out_real,
  output wire  [avmm_interfaces-1     :0]  hip_avmm_write_real,
  output wire  [avmm_interfaces*8-1   :0]  hip_avmm_writedata_real,
  input  wire  [avmm_interfaces-1     :0]  hip_avmm_writedone_real,
  input  wire  [avmm_interfaces-1     :0]  pld_avmm2_busy_real,
  output wire  [avmm_interfaces-1     :0]  pld_avmm2_clk_rowclk_real,
  input  wire  [avmm_interfaces-1     :0]  pld_avmm2_cmdfifo_wr_full_real,
  input  wire  [avmm_interfaces-1     :0]  pld_avmm2_cmdfifo_wr_pfull_real,
  output wire  [avmm_interfaces-1     :0]  pld_avmm2_request_real,
  input  wire  [avmm_interfaces-1     :0]  pld_pll_cal_done_real,
  // below are unused ports in hip mode
  output wire  [avmm_interfaces-1     :0]  pld_avmm2_write_real,
  output wire  [avmm_interfaces-1     :0]  pld_avmm2_read_real,
  output wire  [avmm_interfaces*9-1   :0]  pld_avmm2_reg_addr_real,
  input  wire  [avmm_interfaces*8-1   :0]  pld_avmm2_readdata_real,
  output wire  [avmm_interfaces*8-1   :0]  pld_avmm2_writedata_real,
  input  wire  [avmm_interfaces-1     :0]  pld_avmm2_readdatavalid_real,
  output wire  [avmm_interfaces*6-1  :0]  pld_avmm2_reserved_in_real,
  input  wire  [avmm_interfaces-1   :0]  pld_avmm2_reserved_out_real
 
 );
 
//****************************************************
//                   SIGNALS
//****************************************************
wire  [avmm_interfaces-1  :0]   avmm_readdatavalid;
wire  [avmm_interfaces-1  :0]   avmm_request;
wire  [avmm_interfaces*8-1:0]   avmm_readdata_int;
wire  [avmm_interfaces-1  :0]   avmm_cmdfifo_pfull;
wire  [avmm_interfaces*3-1  :0] avmm_reservedout;
wire  [avmm_interfaces-1  :0]   avmm_writedone;
wire  [avmm_interfaces-1  :0]   soft_avmm_read;
wire  [avmm_interfaces-1  :0]   soft_avmm_write;
 
 
assign  hip_avmm_reg_addr_real    =   avmm_address;
assign  hip_avmm_writedata_real   =   avmm_writedata;
assign  pld_avmm2_clk_rowclk_real =   avmm_clk;
assign  avmm_clkchnl              =   avmm_clk;

assign avmm_busy = '0; //no driver, assign 0
 
// Connect the AVMM2 building block to soft logic per interface
generate
genvar ig;
for( ig=0; ig<avmm_interfaces; ig=ig+1 ) begin : avmm_sip_insts
 
   assign  avmm_reservedout             [ig*3  +: 3]   =   3'h0;
   
   // Use the common soft logic module, parameterized for AVMM2
   eth_f_ctfb_avmm_maib_if
   #(
   .avmm_interface_type        ("avmm2"                         ),           
   .rcfg_enable                (rcfg_enable                     )
   ) agx_xcvr_avmm_soft_logic_inst (
   //Inputs
   .avmm_clk                   (avmm_clk            [ig]        ),
   .avmm_reset                 (avmm_reset          [ig]        ),
   .avmm_writedata             (avmm_writedata      [ig*8+:8]   ), 
   .avmm_address               (avmm_address        [ig*21+:21] ),
   .avmm_write                 (avmm_write          [ig]        ),
   .avmm_read                  (avmm_read           [ig]        ),
   .avmm_readdata_int          (hip_avmm_readdata_real   [ig*8+:8]   ),
   .avmm_readdatavalid         (hip_avmm_readdatavalid_real  [ig]     ),
   .avmm_cmdfifo_pfull         (pld_avmm2_cmdfifo_wr_pfull_real  [ig] ),
   .avmm_busy                  (pld_avmm2_busy_real       [ig]        ),
   .avmm_reservedout           (avmm_reservedout    [ig*3+:3]   ),
   .avmm_writedone             (hip_avmm_writedone_real [ig]    ),
   //Outputs
   .avmm_readdata              (avmm_readdata       [ig*8+:8]   ), 
   .avmm_waitrequest           (avmm_waitrequest    [ig]        ),
   .avmm_request               (pld_avmm2_request_real [ig]     ),
   .soft_avmm_write            (hip_avmm_write_real    [ig]     ),
   .soft_avmm_read             (hip_avmm_read_real     [ig]     )  //Specific to AVMM2
 );
 
   assign  pld_avmm2_write_real         [ig]      = 1'b0;
   assign  pld_avmm2_read_real          [ig]      = 1'b0;
   assign  pld_avmm2_reg_addr_real      [ig*9+:9] = 9'h0;
   assign  pld_avmm2_writedata_real     [ig*8+:8]      = 8'b0;
   assign  pld_avmm2_reserved_in_real [ig*6+:6] = 6'h0;
 
 
end //  for each interface
endgenerate
 
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX+qNVmSHH7m8RClgCssjAu0jrR0Z29kchmfWiysd57Ai+VvNO2F4V6q3lMljICvY7kIw+IzvsRr9sNwNG2nJpwTr9q5GzMSqx0nkX28hn4wAgQgKhYSBhs3DKkVmODpNY5QVKYSsGSxJIupVSE94R9QgO3mcSi4++UACsa5F/roGXmfbMz61oXLr8USCsYmM7bT3nmnvQOvaqCCJstMe2p7i+nO4SDSj+/eft1ZxGN0GmZORv5Noo+o1rIREi7ZZtxFzEkE8Hsivnt5RbTQHRe39ojg+tTxoJ5Pw75iA+md83x/dknoe5sYm/kyYZeDjj4nZx1JJXNC8NZIMwaLne9WhsdnDAuVF2h6BQHMLkEEiLIAAPmnk7NPJkf2N2Bv3UUOuOpMHgSsuTAXLAhZeTK18v9RjnXdq6fI3JzNfOaAkcktW5Dgmhd26wELTKGBiuOWbk0WZ2Yj2NTZb6b7a5R7G20fgkefHZJow2EXn8F1ouNw1pVOGQ8yA5tCaxtje9+ryCiWO9eZJ8GFfncEI7qyLqyitE+InIYgXFI5DTQnqidrbox9xWqoIYt3UIJdu4IiEDlUjcSpGRhw+98q/JSIekOUDF811l4odkCSsCohcPNG8ZkMNiYAJGJlciFlAsh0SzR/tFHxqfW/nq6RCL6vAb8k7I2u0xy2hNfTM9REoXqN2Ev5Ux60RQ9ILSCii2yIXvIdHFrxIGayQgSKHtQbGsO/5QxstShMGSdHLI3HkoMKww5sQkQ/NcsXSwHAf1CtLs5r1EspNukl7d+xFawo"
`endif