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


`timescale 1 ps / 1 ps

(* tile_ip_hip *)
(* altera_attribute = "-name UNCONNECTED_OUTPUT_PORT_MESSAGE_LEVEL OFF" *)
module hssi_ss_1_systemclk_f_300_v5cyd2a_hip #(

// SystemPLL:
   parameter  enables_systempll       = 0,

   parameter  systempll_ethernet_preset_0 = "IE",
   parameter  systempll_ethernet_preset_1 = "IE",
   parameter  systempll_ethernet_preset_2 = "IE",

   parameter  systempll_pcie_preset_0 = "IE",
   parameter  systempll_pcie_preset_1 = "IE",
   parameter  systempll_pcie_preset_2 = "IE",

   parameter  systempll_refsrc_0      = 0,
   parameter  systempll_refsrc_1      = 0,
   parameter  systempll_refsrc_2      = 0,

   parameter  syspll_availpor_0      = 1,
   parameter  syspll_availpor_1      = 1,
   parameter  syspll_availpor_2      = 1,

   parameter  refclk_fgt_always_active_0 = 0,
   parameter  refclk_fgt_always_active_1 = 0,
   parameter  refclk_fgt_always_active_2 = 0,
   parameter  refclk_fgt_always_active_3 = 0,
   parameter  refclk_fgt_always_active_4 = 0,
   parameter  refclk_fgt_always_active_5 = 0,
   parameter  refclk_fgt_always_active_6 = 0,
   parameter  refclk_fgt_always_active_7 = 0,
   parameter  refclk_fgt_always_active_8 = 0,
   parameter  refclk_fgt_always_active_9 = 0,

   parameter  systempll_c0_counter_0         = "IE",
   parameter  systempll_c0_output_enable_0   = "IE",
   parameter  systempll_c1_counter_0         = "IE",
   parameter  systempll_c1_output_enable_0   = "IE",
   parameter  systempll_c2_counter_0         = "IE",
   parameter  systempll_c2_output_enable_0   = "IE",
   parameter  systempll_f_out_c0_hz_0        = "IE",
   parameter  systempll_f_out_c1_hz_0        = "IE",
   parameter  systempll_f_out_c2_hz_0        = "IE",
   parameter  systempll_f_pfd_hz_0           = "IE",
   parameter  systempll_f_ref_hz_0           = "IE",
   parameter  systempll_f_vco_hz_0           = "IE",
   parameter  systempll_fractional_enable_0  = "IE",
   parameter  systempll_m_counter_0          = "IE",
   parameter  systempll_n_counter_0          = "IE",
   parameter  systempll_primary_use_0        = "IE",
   parameter  systempll_refclk_mux_select_0  = "IE",
   parameter  systempll_eth_flux_used_0      = "IE",

   parameter  systempll_c0_counter_1         = "IE",
   parameter  systempll_c0_output_enable_1   = "IE",
   parameter  systempll_c1_counter_1         = "IE",
   parameter  systempll_c1_output_enable_1   = "IE",
   parameter  systempll_c2_counter_1         = "IE",
   parameter  systempll_c2_output_enable_1   = "IE",
   parameter  systempll_f_out_c0_hz_1        = "IE",
   parameter  systempll_f_out_c1_hz_1        = "IE",
   parameter  systempll_f_out_c2_hz_1        = "IE",
   parameter  systempll_f_pfd_hz_1           = "IE",
   parameter  systempll_f_ref_hz_1           = "IE",
   parameter  systempll_f_vco_hz_1           = "IE",
   parameter  systempll_fractional_enable_1  = "IE",
   parameter  systempll_m_counter_1          = "IE",
   parameter  systempll_n_counter_1          = "IE",
   parameter  systempll_primary_use_1        = "IE",
   parameter  systempll_refclk_mux_select_1  = "IE",
   parameter  systempll_eth_flux_used_1      = "IE",

   parameter  systempll_c0_counter_2         = "IE",
   parameter  systempll_c0_output_enable_2   = "IE",
   parameter  systempll_c1_counter_2         = "IE",
   parameter  systempll_c1_output_enable_2   = "IE",
   parameter  systempll_c2_counter_2         = "IE",
   parameter  systempll_c2_output_enable_2   = "IE",
   parameter  systempll_f_out_c0_hz_2        = "IE",
   parameter  systempll_f_out_c1_hz_2        = "IE",
   parameter  systempll_f_out_c2_hz_2        = "IE",
   parameter  systempll_f_pfd_hz_2           = "IE",
   parameter  systempll_f_ref_hz_2           = "IE",
   parameter  systempll_f_vco_hz_2           = "IE",
   parameter  systempll_fractional_enable_2  = "IE",
   parameter  systempll_m_counter_2          = "IE",
   parameter  systempll_n_counter_2          = "IE",
   parameter  systempll_primary_use_2        = "IE",
   parameter  systempll_refclk_mux_select_2  = "IE",
   parameter  systempll_eth_flux_used_2      = "IE",

// FGT Reference Clock:
   parameter  enables_refclk_fgt      = 0,
   parameter  enables_coreclk_fgt     = 0,

   parameter  refclk_fgt_freq_0       = 0,
   parameter  refclk_fgt_freq_1       = 0,
   parameter  refclk_fgt_freq_2       = 0,
   parameter  refclk_fgt_freq_3       = 0,
   parameter  refclk_fgt_freq_4       = 0,
   parameter  refclk_fgt_freq_5       = 0,
   parameter  refclk_fgt_freq_6       = 0,
   parameter  refclk_fgt_freq_7       = 0,
   parameter  refclk_fgt_freq_8       = 0,
   parameter  refclk_fgt_freq_9       = 0,

// FGT Reference Clock:
   parameter  enables_cdrout_fgt      = 0,


// FHT Reference Clock:
   parameter  enables_refclk_fht      = 0,
   parameter  fhtref_fref_hz_0        = "IE",
   parameter  fhtref_fref_hz_1        = "IE",

// Common PLL:
   parameter  enables_commonpll       = 0,
   parameter  commonpll_refsrc_0      = 0,
   parameter  commonpll_refsrc_1      = 0,
   parameter  cmnpll_en_cmos_refclk_out = "IE",
   parameter  cmnpll_xtensa_used_0    = "IE",
   parameter  cmnpll_xtensa_used_1    = "IE",


   parameter  silicon_revision        = "10nm6awhra",
   parameter  device_revision         = "10nm6awhra"


 ) (
   output out_systempll_synthlock_0,
   output out_systempll_synthlock_1,
   output out_systempll_synthlock_2,

   output out_systempll_disconnect_0,
   output out_systempll_disconnect_1,
   output out_systempll_disconnect_2,

   output [3:0] out_systempll_status_0,
   output [3:0] out_systempll_status_1,
   output [3:0] out_systempll_status_2,

   output out_coreclk_0,
   output out_coreclk_1,
   output out_coreclk_2,
   output out_coreclk_3,
   output out_coreclk_4,
   output out_coreclk_5,
   output out_coreclk_6,
   output out_coreclk_7,
   output out_coreclk_8,  // Only 8 physical available.  This is logical
   output out_coreclk_9,

    input in_refclk_fgt_0,
    input in_refclk_fgt_1,
    input in_refclk_fgt_2,
    input in_refclk_fgt_3,
    input in_refclk_fgt_4,
    input in_refclk_fgt_5,
    input in_refclk_fgt_6,
    input in_refclk_fgt_7,
    input in_refclk_fgt_8,
    input in_refclk_fgt_9,

   output out_refclk_fgt_0,
   output out_refclk_fgt_1,
   output out_refclk_fgt_2,
   output out_refclk_fgt_3,
   output out_refclk_fgt_4,
   output out_refclk_fgt_5,
   output out_refclk_fgt_6,
   output out_refclk_fgt_7,
   output out_refclk_fgt_8,
   output out_refclk_fgt_9,

    input in_refclk_fht_0,
    input in_refclk_fht_1,

   output out_fht_cmmpll_clk_0,
   output out_fht_cmmpll_clk_1,

    input in_cdrclk_0,
    input in_cdrclk_1,

   output out_cdrclk_0,
   output out_cdrclk_1,

   output out_systempll_clk_0,
   output out_systempll_clk_1,
   output out_systempll_clk_2,

   output out_ctrl_pll_aibrc_clock_top__pll_0_slice0_clk_real,
   output out_ctrl_pll_aibrc_clock_top__pll_0_slice1_clk_real,
   output out_ctrl_pll_aibrc_clock_top__pll_0_slice2_clk_real,
   output out_ctrl_pll_aibrc_clock_top__pll_0_slice3_clk_real,

   output out_ctrl_pll_aibrc_clock_top__pll_1_slice0_clk_real,
   output out_ctrl_pll_aibrc_clock_top__pll_1_slice1_clk_real,
   output out_ctrl_pll_aibrc_clock_top__pll_1_slice2_clk_real,
   output out_ctrl_pll_aibrc_clock_top__pll_1_slice3_clk_real,

   output out_ctrl_pll_aibrc_clock_top__pll_2_slice0_clk_real,
   output out_ctrl_pll_aibrc_clock_top__pll_2_slice1_clk_real,
   output out_ctrl_pll_aibrc_clock_top__pll_2_slice2_clk_real,
   output out_ctrl_pll_aibrc_clock_top__pll_2_slice3_clk_real,

   
   //  for AVMM1 bb ports
    output        pld_avmm1_busy,
     input        pld_avmm1_clk_rowclk,
    output        pld_avmm1_cmdfifo_wr_full,
    output        pld_avmm1_cmdfifo_wr_pfull,
     input        pld_avmm1_read,
    output [7:0]  pld_avmm1_readdata,
    output        pld_avmm1_readdatavalid,
     input [9:0]  pld_avmm1_reg_addr,
     input        pld_avmm1_request,
     input [8:0]  pld_avmm1_reserved_in,
    output [2:0]  pld_avmm1_reserved_out,
     input        pld_avmm1_write,
     input [7:0]  pld_avmm1_writedata,
    output        pld_chnl_cal_done,
    output        pld_hssi_osc_transfer_en
);

//=================================================================
//                          FGT CDR Clockouts
//=================================================================
localparam REFCLK_FGT_DP_NUM = 2;

wire [REFCLK_FGT_DP_NUM-1:0]  w_cdrclk_out;
wire [REFCLK_FGT_DP_NUM-1:0]  w_cdrclk_in;

`ifdef __TILE_IP__
assign {out_cdrclk_1, out_cdrclk_0} = w_cdrclk_out;
`endif  //__TILE_IP__
assign                  w_cdrclk_in = {in_cdrclk_1, in_cdrclk_0};

for (genvar i=0;i<REFCLK_FGT_DP_NUM;i++) begin : gen_cdrclk_
  if ( enables_cdrout_fgt[i] ) 
  begin : enabled
`ifdef __TILE_IP__
      bb_f_ux_refclk #(
       //.refclk_hz                    ( l_freq ),
       //.refclk_reconfig_span         ( ),
       .syspll_refclk_output_enable  ("ENABLE"),
       //.location      (),
         .silicon_rev   ( silicon_revision )
      )  inst (
         .io_gdr_refclk_in_ds__b_refclk_in_p_srds_pad_lv_real( w_cdrclk_out[i] ),
         .rx_cdr_divclk_link ( w_cdrclk_in[i] ),
         .refclk_link        ( )
     ); 
`else
     // Driven by XMR -- assign w_cdrclk_out[i] = 1'b0;  
`endif  //__TILE_IP__
  end
  else
  begin
       // Avoid Lint error:
     assign w_cdrclk_out[i] = 1'b0; 
  end
end

//=================================================================
//                          FGT RefClk
//=================================================================
localparam REFCLK_FGT_NUM = 10;

wire [REFCLK_FGT_NUM-1:0]  w_refclk_fgt_clk_in;
wire [REFCLK_FGT_NUM-1:0]  w_refclk_fgt_clk_out;
wire [REFCLK_FGT_NUM-1:0]  w_coreclk_fgt; // Only 8 physical available.  This is logical


`ifdef __TILE_IP__
assign {out_coreclk_9, out_coreclk_8, out_coreclk_7, out_coreclk_6, 
        out_coreclk_5, out_coreclk_4, out_coreclk_3, out_coreclk_2, 
                                      out_coreclk_1, out_coreclk_0 } = w_coreclk_fgt;
`endif


assign {out_refclk_fgt_9, out_refclk_fgt_8, out_refclk_fgt_7, out_refclk_fgt_6, 
        out_refclk_fgt_5, out_refclk_fgt_4, out_refclk_fgt_3, out_refclk_fgt_2, 
                                            out_refclk_fgt_1, out_refclk_fgt_0 } = w_refclk_fgt_clk_out;

assign w_refclk_fgt_clk_in = {in_refclk_fgt_9, in_refclk_fgt_8, in_refclk_fgt_7, in_refclk_fgt_6, 
                              in_refclk_fgt_5, in_refclk_fgt_4, in_refclk_fgt_3, in_refclk_fgt_2, 
                              in_refclk_fgt_1, in_refclk_fgt_0 };

for (genvar i=0;i<REFCLK_FGT_NUM;i++) begin : gen_refclk_fgt_bb_
  if ( enables_refclk_fgt[i] ) 
  begin : enabled

     localparam l_freq = (i==0)? refclk_fgt_freq_0 :(i==1)? refclk_fgt_freq_1 :(i==2)? refclk_fgt_freq_2 :(i==3)? refclk_fgt_freq_3 :
                         (i==4)? refclk_fgt_freq_4 :(i==5)? refclk_fgt_freq_5 :(i==6)? refclk_fgt_freq_6 :(i==7)? refclk_fgt_freq_7 :
                         (i==8)? refclk_fgt_freq_8 :(i==9)? refclk_fgt_freq_9 :"IE";
     localparam l_freq_v = (l_freq==0) ? "__BB_DONT_CARE__" : l_freq;

     localparam l_refclk_fgt_always_active =
        0 == i ? ( refclk_fgt_always_active_0 ? "TRUE" : "FALSE" )
        :
        1 == i ? ( refclk_fgt_always_active_1 ? "TRUE" : "FALSE" )
        :
        2 == i ? ( refclk_fgt_always_active_2 ? "TRUE" : "FALSE" )
        :
        3 == i ? ( refclk_fgt_always_active_3 ? "TRUE" : "FALSE" )
        :
        4 == i ? ( refclk_fgt_always_active_4 ? "TRUE" : "FALSE" )
        :
        5 == i ? ( refclk_fgt_always_active_5 ? "TRUE" : "FALSE" )
        :
        6 == i ? ( refclk_fgt_always_active_6 ? "TRUE" : "FALSE" )
        :
        7 == i ? ( refclk_fgt_always_active_7 ? "TRUE" : "FALSE" )
        :
        8 == i ? ( refclk_fgt_always_active_8 ? "TRUE" : "FALSE" )
        :
        9 == i ? ( refclk_fgt_always_active_9 ? "TRUE" : "FALSE" )
        :
        "IE"
        ;

     localparam l_passthru_clk_type =
        (enables_coreclk_fgt[i] || l_refclk_fgt_always_active == "FALSE") ? "PASSTHRU_PAD2CMOS" : "PASSTHRU_DISABLE";

`ifdef __TILE_IP__
     wire w_bb_f_ux_refclk_coreclk;

     bb_f_ux_refclk #(
         .refclk_hz                    ( l_freq_v ),
         .passthru_clk_type            ( l_passthru_clk_type ),
         .refclk_available_at_poweron  ( l_refclk_fgt_always_active ),
         .syspll_refclk_output_enable  ( "ENABLE" ),
         .silicon_rev                  ( silicon_revision )
     )  inst (
        // Real-ports:
         .o_xcvrrc_clkrst_ux_ds_0__xcvr_quad_refclk_real     ( w_bb_f_ux_refclk_coreclk ),
         .io_gdr_refclk_in_ds__b_refclk_in_p_srds_pad_lv_real( w_refclk_fgt_clk_in[i] ),

        // Link-ports:
         .rx_cdr_divclk_link ( ),
         .refclk_link        ( w_refclk_fgt_clk_out[i] )
     );

     assign w_coreclk_fgt[i] = (enables_coreclk_fgt[i] || l_refclk_fgt_always_active == "FALSE") ? w_bb_f_ux_refclk_coreclk : 1'b0;
`else
     assign w_refclk_fgt_clk_out[i] = 1'b0;
`endif  //__TILE_IP__

  end
  else
  begin
       // Avoid Lint error:
     assign w_refclk_fgt_clk_out[i] = 1'b0;
     assign w_coreclk_fgt[i] = 1'b0;
  end
end

//=================================================================
//                          FHT RefClk
//=================================================================
localparam REFCLK_FHT_NUM = 2;

wire [REFCLK_FHT_NUM-1:0]  w_refclk_fht_clk_in;
wire [REFCLK_FHT_NUM-1:0]  w_refclk_fht_clk_out;


assign w_refclk_fht_clk_in = { in_refclk_fht_1, in_refclk_fht_0 };

for (genvar i=0;i<REFCLK_FHT_NUM;i++) begin : gen_fht_bb_
  if ( enables_refclk_fht[i] ) 
  begin : enabled

     localparam l_freq = (i==0) ? fhtref_fref_hz_0  : (i==1) ? fhtref_fref_hz_1  : "IE" ;

`ifdef __TILE_IP__
      bb_f_bk_refclk #(
         .freq          ( l_freq ),
         .silicon_rev   ( silicon_revision )
      )  refclk_inst (
         .io_gdr_refclk_in_ds__b_refclk_in_p_srds_pad_lv_real ( w_refclk_fht_clk_in[i] ),
         .refclk_link   ( w_refclk_fht_clk_out[i] )
      );
`else
     assign w_refclk_fht_clk_out[i] = 1'b0;
`endif  //__TILE_IP__

  end
  else
  begin
       // Avoid Lint error:  
     assign w_refclk_fht_clk_out[i] = 1'b0;
  end
end


//=================================================================
//                          Common PLL
//=================================================================
localparam COMMONPLL_NUM = 2;
wire [COMMONPLL_NUM-1:0]  w_cmmpll_clk_out;

assign { out_fht_cmmpll_clk_1, out_fht_cmmpll_clk_0 } = w_cmmpll_clk_out;

for (genvar i=0;i<COMMONPLL_NUM;i++) begin : gen_commonpll_bb_
  if ( enables_commonpll[i] ) 
  begin : enabled

        localparam l_commonpll_refsrc  = (i==0) ? commonpll_refsrc_0   : (i==1) ? commonpll_refsrc_1   : "IE";
        localparam l_xtensa_used       = (i==0) ? cmnpll_xtensa_used_0 : (i==1) ? cmnpll_xtensa_used_1 : "IE";

`ifdef __TILE_IP__
      bb_f_bk_cmnpll #(
       //.bk_clk_en_cmos_refclk_out
         .xtensa_clk    ( l_xtensa_used    ),
         .silicon_rev   ( silicon_revision )
      )  cmpll_inst (
         .pll_link      ( w_cmmpll_clk_out[i] ),
         .refclk_link   ( w_refclk_fht_clk_out[l_commonpll_refsrc] )
      );
`else
     assign w_cmmpll_clk_out[i] = 1'b0;
`endif  //__TILE_IP__
  end
  else
  begin
       // Avoid Lint error:  
     assign w_cmmpll_clk_out[i] = 1'b0;
  end

end

//=================================================================
//                          SystemPLL
//=================================================================
localparam SYSTEMPLL_NUM = 3;

wire   [SYSTEMPLL_NUM-1:0]  w_systempll_clk_out;
wire   [SYSTEMPLL_NUM-1:0]  w_systempll_synthlock_out;
//wire [SYSTEMPLL_NUM-1:0]  w_systempll_disconnect_out;
wire [4*SYSTEMPLL_NUM-1:0]  w_systempll_status_out;

assign  { out_systempll_clk_2, out_systempll_clk_1, out_systempll_clk_0 } = w_systempll_clk_out;

for (genvar i=0;i<SYSTEMPLL_NUM;i++) begin : gen_systempll_bb_
  if ( enables_systempll[i] ) 
  begin : enabled

        localparam l_c0_counter          = (i==0) ? systempll_c0_counter_0  : (i==1) ? systempll_c0_counter_1  : (i==2) ? systempll_c0_counter_2  : "IE" ;
        localparam l_c1_counter          = (i==0) ? systempll_c1_counter_0  : (i==1) ? systempll_c1_counter_1  : (i==2) ? systempll_c1_counter_2  : "IE" ;
        localparam l_f_out_c0_hz         = (i==0) ? systempll_f_out_c0_hz_0 : (i==1) ? systempll_f_out_c0_hz_1 : (i==2) ? systempll_f_out_c0_hz_2 : "IE" ;
        localparam l_f_out_c1_hz         = (i==0) ? systempll_f_out_c1_hz_0 : (i==1) ? systempll_f_out_c1_hz_1 : (i==2) ? systempll_f_out_c1_hz_2 : "IE" ;
        localparam l_f_pfd_hz            = (i==0) ? systempll_f_pfd_hz_0    : (i==1) ? systempll_f_pfd_hz_1    : (i==2) ? systempll_f_pfd_hz_2    : "IE" ;
        localparam l_f_ref_hz            = (i==0) ? systempll_f_ref_hz_0    : (i==1) ? systempll_f_ref_hz_1    : (i==2) ? systempll_f_ref_hz_2    : "IE" ;
        localparam l_f_vco_hz            = (i==0) ? systempll_f_vco_hz_0    : (i==1) ? systempll_f_vco_hz_1    : (i==2) ? systempll_f_vco_hz_2    : "IE" ;
        localparam l_m_counter           = (i==0) ? systempll_m_counter_0   : (i==1) ? systempll_m_counter_1   : (i==2) ? systempll_m_counter_2   : "IE" ;
        localparam l_n_counter           = (i==0) ? systempll_n_counter_0   : (i==1) ? systempll_n_counter_1   : (i==2) ? systempll_n_counter_2   : "IE" ;

        localparam l_systempll_refsrc    = (i==0) ? systempll_refsrc_0      : (i==1) ? systempll_refsrc_1      : (i==2) ? systempll_refsrc_2      : "IE" ;

        localparam l_ethernet_preset     = (i==0) ? systempll_ethernet_preset_0 : (i==1) ? systempll_ethernet_preset_1 : (i==2) ? systempll_ethernet_preset_2 : "IE" ;
        localparam l_pcie_preset         = (i==0) ? systempll_pcie_preset_0     : (i==1) ? systempll_pcie_preset_1     : (i==2) ? systempll_pcie_preset_2     : "IE" ;
        localparam l_primary_use         = (i==0) ? systempll_primary_use_0     : (i==1) ? systempll_primary_use_1     : (i==2) ? systempll_primary_use_2     : "IE" ;

        localparam l_c2_output_enable    = (i==0) ? systempll_c2_output_enable_0: (i==1) ? systempll_c2_output_enable_1: (i==2) ? systempll_c2_output_enable_2: "IE" ;
        localparam l_f_out_c2_hz         = (i==0) ? systempll_f_out_c2_hz_0     : (i==1) ? systempll_f_out_c2_hz_1     : (i==2) ? systempll_f_out_c2_hz_2     : "IE" ;
        localparam l_c2_counter          = (i==0) ? systempll_c2_counter_0      : (i==1) ? systempll_c2_counter_1      : (i==2) ? systempll_c2_counter_2      : "IE" ;

        localparam l_eth_flux_used       = (i==0) ? systempll_eth_flux_used_0   : (i==1) ? systempll_eth_flux_used_1   : (i==2) ? systempll_eth_flux_used_2   : "IE" ;

        localparam l_availpor            = (i==0) ? syspll_availpor_0           : (i==1) ? syspll_availpor_1           : (i==2) ? syspll_availpor_2   : "IE" ;

`ifdef __TILE_IP__
     assign  { out_systempll_synthlock_2,  out_systempll_synthlock_1,  out_systempll_synthlock_0     } = w_systempll_synthlock_out;
   //assign  { out_systempll_disconnect_2, out_systempll_disconnect_1, out_systempll_disconnect_0    } = w_systempll_disconnect_out;
   //assign  { out_systempll_status_2,     out_systempll_status_1,     out_systempll_status_0        } = w_systempll_status_out;

     wire out_ctrl_pll_aibrc_clock_top__pll_slice0_clk_real;
     wire out_ctrl_pll_aibrc_clock_top__pll_slice1_clk_real;
     wire out_ctrl_pll_aibrc_clock_top__pll_slice2_clk_real;
     wire out_ctrl_pll_aibrc_clock_top__pll_slice3_clk_real;

     if (i==0) begin
       assign out_ctrl_pll_aibrc_clock_top__pll_0_slice0_clk_real = out_ctrl_pll_aibrc_clock_top__pll_slice0_clk_real;
       assign out_ctrl_pll_aibrc_clock_top__pll_0_slice1_clk_real = out_ctrl_pll_aibrc_clock_top__pll_slice1_clk_real;
       assign out_ctrl_pll_aibrc_clock_top__pll_0_slice2_clk_real = out_ctrl_pll_aibrc_clock_top__pll_slice2_clk_real;
       assign out_ctrl_pll_aibrc_clock_top__pll_0_slice3_clk_real = out_ctrl_pll_aibrc_clock_top__pll_slice3_clk_real;
     end
     if (i==1) begin
       assign out_ctrl_pll_aibrc_clock_top__pll_1_slice0_clk_real = out_ctrl_pll_aibrc_clock_top__pll_slice0_clk_real;
       assign out_ctrl_pll_aibrc_clock_top__pll_1_slice1_clk_real = out_ctrl_pll_aibrc_clock_top__pll_slice1_clk_real;
       assign out_ctrl_pll_aibrc_clock_top__pll_1_slice2_clk_real = out_ctrl_pll_aibrc_clock_top__pll_slice2_clk_real;
       assign out_ctrl_pll_aibrc_clock_top__pll_1_slice3_clk_real = out_ctrl_pll_aibrc_clock_top__pll_slice3_clk_real;
     end
     if (i==2) begin
       assign out_ctrl_pll_aibrc_clock_top__pll_2_slice0_clk_real = out_ctrl_pll_aibrc_clock_top__pll_slice0_clk_real;
       assign out_ctrl_pll_aibrc_clock_top__pll_2_slice1_clk_real = out_ctrl_pll_aibrc_clock_top__pll_slice1_clk_real;
       assign out_ctrl_pll_aibrc_clock_top__pll_2_slice2_clk_real = out_ctrl_pll_aibrc_clock_top__pll_slice2_clk_real;
       assign out_ctrl_pll_aibrc_clock_top__pll_2_slice3_clk_real = out_ctrl_pll_aibrc_clock_top__pll_slice3_clk_real;
     end

     bb_f_system_pll #(
      .silicon_rev      ( silicon_revision ),

      .refclk_available_at_poweron( (l_availpor)?"TRUE":"FALSE"),
      .primary_use ("__BB_DONT_CARE__"), //now instantiated for JESD protocol

   // Configure C0:
      .f_vco_hz         ( l_f_vco_hz ),
      .f_ref_hz         ( l_f_ref_hz ),
      .f_pfd_hz         ( l_f_pfd_hz ),
      .f_out_c0_hz      ( l_f_out_c0_hz ),
      .c0_counter   ( l_c0_counter ),
      .m_counter    ( l_m_counter ),
      .n_counter    ( l_n_counter ),
      .c0_output_enable ( "C0_OUTPUT_ENABLE" ),

   // Configure C1:
      .c1_output_enable ( "C1_OUTPUT_ENABLE"),
      .f_out_c1_hz      ( l_f_out_c1_hz ),
      .c1_counter       ( l_c1_counter ),

   // Disable C2
    .c2_output_enable   (  l_c2_output_enable ),
    .f_out_c2_hz        ( (l_c2_output_enable=="__BB_DONT_CARE__") ? "__BB_DONT_CARE__" : l_f_out_c2_hz ),
    .c2_counter         ( (l_c2_output_enable=="__BB_DONT_CARE__") ? "__BB_DONT_CARE__" : l_c2_counter  ),

   // Preset settings
      .ethernet_preset  ( l_ethernet_preset ),
      .pcie_preset      ( l_pcie_preset ),

      .eth_flux_used    ( l_eth_flux_used ),

   // Not currently supported
    /*
      .dts_ctrl_f_en_attr()          -- Thermo sensor
      .primary_dfd_power_off_attr()  -- Design for debug
      .topology         ()           -- Set by z-level, not at IP level
      .primary_use  ()           -- Let RBC resolve 
    */   

   // Common settings
      .fractional_enable( "FRACTIONAL_DISABLED" ),
      .sup_mode         ( "ADVANCED_USER_MODE" )
     ) inst (
         .disconnect_status_real (/* w_systempll_disconnect_out[i] */           ),
         .slice_status_real      (/* w_systempll_status_out[4*i+:4]*/           ),
         .synthlock_status_real  (   w_systempll_synthlock_out[i]               ),
         .pll_link               (   w_systempll_clk_out[i]                     ),
         .refclk_link            (   w_refclk_fgt_clk_out[ l_systempll_refsrc ] ),
         .o_ctrl_pll_aibrc_clock_top__pll_slice0_clk_real(out_ctrl_pll_aibrc_clock_top__pll_slice0_clk_real),
         .o_ctrl_pll_aibrc_clock_top__pll_slice1_clk_real(out_ctrl_pll_aibrc_clock_top__pll_slice1_clk_real),
         .o_ctrl_pll_aibrc_clock_top__pll_slice2_clk_real(out_ctrl_pll_aibrc_clock_top__pll_slice2_clk_real),
         .o_ctrl_pll_aibrc_clock_top__pll_slice3_clk_real(out_ctrl_pll_aibrc_clock_top__pll_slice3_clk_real)
     );
`else
//     assign w_systempll_status_out[4*i+:4] = 4'b0;
//     assign w_systempll_synthlock_out[i]   = 1'b0;
       assign w_systempll_clk_out[i]         = 1'b0;

`endif  // __TILE_IP__
  end
  else
  begin
       // Avoid Lint error:  
     assign w_systempll_status_out[4*i+:4] = 4'b0;
     assign w_systempll_synthlock_out[i]   = 1'b0;
     assign w_systempll_clk_out[i]         = 1'b0;
  end
end

`ifdef __TILE_IP__
 bb_m_hdpldadapt_avmm1 #(
                          .location ("MAIB0"), 
                          .silicon_rev  (silicon_revision),
                          .auto_profile_id ("__${ip_inst_d}__") 
                   )
                   x_bb_f_avmm1 (
                   .pld_avmm1_busy_real              ( pld_avmm1_busy ), 
                   .pld_avmm1_clk_rowclk_real        ( pld_avmm1_clk_rowclk ),
                   .pld_avmm1_cmdfifo_wr_full_real   ( pld_avmm1_cmdfifo_wr_full ),
                   .pld_avmm1_cmdfifo_wr_pfull_real  ( pld_avmm1_cmdfifo_wr_pfull ),
                   .pld_avmm1_read_real              ( pld_avmm1_read ),
                   .pld_avmm1_readdata_real          ( pld_avmm1_readdata ),
                   .pld_avmm1_readdatavalid_real     ( pld_avmm1_readdatavalid ),
                   .pld_avmm1_reg_addr_real          ( pld_avmm1_reg_addr ),
                   .pld_avmm1_request_real           ( pld_avmm1_request ),
                   .pld_avmm1_reserved_in_real       ( pld_avmm1_reserved_in ),
                   .pld_avmm1_reserved_out_real      ( pld_avmm1_reserved_out ),
                   .pld_avmm1_write_real             ( pld_avmm1_write),
                   .pld_avmm1_writedata_real         ( pld_avmm1_writedata ),
                   .pld_chnl_cal_done_real           ( pld_chnl_cal_done),
                   .pld_hssi_osc_transfer_en_real    ( pld_hssi_osc_transfer_en ),
                   .avmm1_link                       ( )
              );
`endif  // __TILE_IP__
`ifdef __TILE_IP__

`endif  // __TILE_IP__

endmodule

(* tile_ip *)
module hssi_ss_1_systemclk_f_300_v5cyd2a #(

// SystemPLL:
   parameter  enables_systempll       = 0,

   parameter  systempll_ethernet_preset_0 = "IE",
   parameter  systempll_ethernet_preset_1 = "IE",
   parameter  systempll_ethernet_preset_2 = "IE",

   parameter  systempll_pcie_preset_0 = "IE",
   parameter  systempll_pcie_preset_1 = "IE",
   parameter  systempll_pcie_preset_2 = "IE",

   parameter  systempll_refsrc_0      = 0,
   parameter  systempll_refsrc_1      = 0,
   parameter  systempll_refsrc_2      = 0,

   parameter  syspll_availpor_0       = 1,
   parameter  syspll_availpor_1       = 1,
   parameter  syspll_availpor_2       = 1,

   parameter  systempll_c0_counter_0         = "IE",
   parameter  systempll_c0_output_enable_0   = "IE",
   parameter  systempll_c1_counter_0         = "IE",
   parameter  systempll_c1_output_enable_0   = "IE",
   parameter  systempll_c2_counter_0         = "IE",
   parameter  systempll_c2_output_enable_0   = "IE",
   parameter  systempll_f_out_c0_hz_0        = "IE",
   parameter  systempll_f_out_c1_hz_0        = "IE",
   parameter  systempll_f_out_c2_hz_0        = "IE",
   parameter  systempll_f_pfd_hz_0           = "IE",
   parameter  systempll_f_ref_hz_0           = "IE",
   parameter  systempll_f_vco_hz_0           = "IE",
   parameter  systempll_fractional_enable_0  = "IE",
   parameter  systempll_m_counter_0          = "IE",
   parameter  systempll_n_counter_0          = "IE",
   parameter  systempll_primary_use_0        = "IE",
   parameter  systempll_refclk_mux_select_0  = "IE",
   parameter  systempll_eth_flux_used_0      = "IE",

   parameter  systempll_c0_counter_1         = "IE",
   parameter  systempll_c0_output_enable_1   = "IE",
   parameter  systempll_c1_counter_1         = "IE",
   parameter  systempll_c1_output_enable_1   = "IE",
   parameter  systempll_c2_counter_1         = "IE",
   parameter  systempll_c2_output_enable_1   = "IE",
   parameter  systempll_f_out_c0_hz_1        = "IE",
   parameter  systempll_f_out_c1_hz_1        = "IE",
   parameter  systempll_f_out_c2_hz_1        = "IE",
   parameter  systempll_f_pfd_hz_1           = "IE",
   parameter  systempll_f_ref_hz_1           = "IE",
   parameter  systempll_f_vco_hz_1           = "IE",
   parameter  systempll_fractional_enable_1  = "IE",
   parameter  systempll_m_counter_1          = "IE",
   parameter  systempll_n_counter_1          = "IE",
   parameter  systempll_primary_use_1        = "IE",
   parameter  systempll_refclk_mux_select_1  = "IE",
   parameter  systempll_eth_flux_used_1      = "IE",

   parameter  systempll_c0_counter_2         = "IE",
   parameter  systempll_c0_output_enable_2   = "IE",
   parameter  systempll_c1_counter_2         = "IE",
   parameter  systempll_c1_output_enable_2   = "IE",
   parameter  systempll_c2_counter_2         = "IE",
   parameter  systempll_c2_output_enable_2   = "IE",
   parameter  systempll_f_out_c0_hz_2        = "IE",
   parameter  systempll_f_out_c1_hz_2        = "IE",
   parameter  systempll_f_out_c2_hz_2        = "IE",
   parameter  systempll_f_pfd_hz_2           = "IE",
   parameter  systempll_f_ref_hz_2           = "IE",
   parameter  systempll_f_vco_hz_2           = "IE",
   parameter  systempll_fractional_enable_2  = "IE",
   parameter  systempll_m_counter_2          = "IE",
   parameter  systempll_n_counter_2          = "IE",
   parameter  systempll_primary_use_2        = "IE",
   parameter  systempll_refclk_mux_select_2  = "IE",
   parameter  systempll_eth_flux_used_2      = "IE",

// FGT Reference Clock:
   parameter  enables_refclk_fgt             = 0,
   parameter  enables_coreclk_fgt            = 0,
   
   parameter  refclk_fgt_always_active_0 = 0,
   parameter  refclk_fgt_always_active_1 = 0,
   parameter  refclk_fgt_always_active_2 = 0,
   parameter  refclk_fgt_always_active_3 = 0,
   parameter  refclk_fgt_always_active_4 = 0,
   parameter  refclk_fgt_always_active_5 = 0,
   parameter  refclk_fgt_always_active_6 = 0,
   parameter  refclk_fgt_always_active_7 = 0,
   parameter  refclk_fgt_always_active_8 = 0,
   parameter  refclk_fgt_always_active_9 = 0,

   parameter  refclk_fgt_freq_0              = 0,
   parameter  refclk_fgt_freq_1              = 0,
   parameter  refclk_fgt_freq_2              = 0,
   parameter  refclk_fgt_freq_3              = 0,
   parameter  refclk_fgt_freq_4              = 0,
   parameter  refclk_fgt_freq_5              = 0,
   parameter  refclk_fgt_freq_6              = 0,
   parameter  refclk_fgt_freq_7              = 0,
   parameter  refclk_fgt_freq_8              = 0,
   parameter  refclk_fgt_freq_9              = 0,

// FGT Reference Clock:
   parameter  enables_cdrout_fgt      = 0,


// FHT Reference Clock:
   parameter  enables_refclk_fht      = 0,
   parameter  fhtref_fref_hz_0        = "IE",
   parameter  fhtref_fref_hz_1        = "IE",

// Common PLL:
   parameter  enables_commonpll       = 0,
   parameter  commonpll_refsrc_0      = 0,
   parameter  commonpll_refsrc_1      = 0,
   parameter  cmnpll_en_cmos_refclk_out = "IE",
   parameter  cmnpll_xtensa_used_0    = "IE",
   parameter  cmnpll_xtensa_used_1    = "IE",


   parameter  silicon_revision        = "10nm6awhra",
   parameter  device_revision         = "10nm6awhra",
   
      
//AVMM parameters
    parameter  avmm_data_width  = 32, 
    parameter  avmm_addr_width  = 18,
    parameter  read_pipeline_enable = 1,
    parameter  avmm_jtag_enable     = 0,
    parameter  refclkready_enable   = 0

 ) (
                              output    out_systempll_synthlock_0,
                              output    out_systempll_synthlock_1,
                              output    out_systempll_synthlock_2,

                              output    out_systempll_disconnect_0,
                              output    out_systempll_disconnect_1,
                              output    out_systempll_disconnect_2,

                              output [3:0] out_systempll_status_0,
                              output [3:0] out_systempll_status_1,
                              output [3:0] out_systempll_status_2,

                              output    out_coreclk_0,
                              output    out_coreclk_1,
                              output    out_coreclk_2,
                              output    out_coreclk_3,
                              output    out_coreclk_4,
                              output    out_coreclk_5,
                              output    out_coreclk_6,
                              output    out_coreclk_7,
                              output    out_coreclk_8,  // Only 8 physical available.  This is logical
                              output    out_coreclk_9,
                              
                              output    refclk_fgt_enabled_0,
                              output    refclk_fgt_enabled_1,
                              output    refclk_fgt_enabled_2,
                              output    refclk_fgt_enabled_3,
                              output    refclk_fgt_enabled_4,
                              output    refclk_fgt_enabled_5,
                              output    refclk_fgt_enabled_6,
                              output    refclk_fgt_enabled_7,
                              output    refclk_fgt_enabled_8,
                              output    refclk_fgt_enabled_9,
                              
                               input    en_refclk_fgt_0,
                               input    en_refclk_fgt_1,
                               input    en_refclk_fgt_2,
                               input    en_refclk_fgt_3,
                               input    en_refclk_fgt_4,
                               input    en_refclk_fgt_5,
                               input    en_refclk_fgt_6,
                               input    en_refclk_fgt_7,
                               input    en_refclk_fgt_8,
                               input    en_refclk_fgt_9,
							   
							   input tri0 disable_refclk_monitor_0,
                               input tri0 disable_refclk_monitor_1,
                               input tri0 disable_refclk_monitor_2,
                               input tri0 disable_refclk_monitor_3,
                               input tri0 disable_refclk_monitor_4,
                               input tri0 disable_refclk_monitor_5,
                               input tri0 disable_refclk_monitor_6,
                               input tri0 disable_refclk_monitor_7,
                               input tri0 disable_refclk_monitor_8,
                               input tri0 disable_refclk_monitor_9,

    (* tile_ip_find_net *)     input    in_refclk_fgt_0,
    (* tile_ip_find_net *)     input    in_refclk_fgt_1,
    (* tile_ip_find_net *)     input    in_refclk_fgt_2,
    (* tile_ip_find_net *)     input    in_refclk_fgt_3,
    (* tile_ip_find_net *)     input    in_refclk_fgt_4,
    (* tile_ip_find_net *)     input    in_refclk_fgt_5,
    (* tile_ip_find_net *)     input    in_refclk_fgt_6,
    (* tile_ip_find_net *)     input    in_refclk_fgt_7,
    (* tile_ip_find_net *)     input    in_refclk_fgt_8,
    (* tile_ip_find_net *)     input    in_refclk_fgt_9,

    (* tile_ip_find_net *)    output    out_refclk_fgt_0,
    (* tile_ip_find_net *)    output    out_refclk_fgt_1,
    (* tile_ip_find_net *)    output    out_refclk_fgt_2,
    (* tile_ip_find_net *)    output    out_refclk_fgt_3,
    (* tile_ip_find_net *)    output    out_refclk_fgt_4,
    (* tile_ip_find_net *)    output    out_refclk_fgt_5,
    (* tile_ip_find_net *)    output    out_refclk_fgt_6,
    (* tile_ip_find_net *)    output    out_refclk_fgt_7,
    (* tile_ip_find_net *)    output    out_refclk_fgt_8,
    (* tile_ip_find_net *)    output    out_refclk_fgt_9,

    (* tile_ip_find_net *)     input    in_refclk_fht_0,
    (* tile_ip_find_net *)     input    in_refclk_fht_1,

    (* tile_ip_find_net *)    output    out_fht_cmmpll_clk_0,
    (* tile_ip_find_net *)    output    out_fht_cmmpll_clk_1,

    (* tile_ip_find_net *)     input    in_cdrclk_0,
    (* tile_ip_find_net *)     input    in_cdrclk_1,

    (* tile_ip_find_net *)    output    out_cdrclk_0,
    (* tile_ip_find_net *)    output    out_cdrclk_1,

    (* tile_ip_find_net *)    output    out_systempll_clk_0,
    (* tile_ip_find_net *)    output    out_systempll_clk_1,
    (* tile_ip_find_net *)    output    out_systempll_clk_2,

    //AVMM ports
                               input    avmm_clk,
                               input    avmm_reset,
                               input[2:0] refclock_ready,
                              output    refclock_status
 );
    // Some derived clocks to core
    wire w_ctrl_pll_aibrc_clock_top__pll_slice0_clk_real;
    wire w_ctrl_pll_aibrc_clock_top__pll_slice1_clk_real;
    wire w_ctrl_pll_aibrc_clock_top__pll_slice2_clk_real;
    wire w_ctrl_pll_aibrc_clock_top__pll_slice3_clk_real;
    
  //  for AVMM1 bb ports
  wire        pld_avmm1_busy;
  wire        pld_avmm1_clk_rowclk;
  wire        pld_avmm1_cmdfifo_wr_full;
  wire        pld_avmm1_cmdfifo_wr_pfull;
  wire        pld_avmm1_read;
  wire  [7:0] pld_avmm1_readdata;
  wire        pld_avmm1_readdatavalid;
  wire  [9:0] pld_avmm1_reg_addr;
  wire        pld_avmm1_request;
  wire  [8:0] pld_avmm1_reserved_in;
  wire  [2:0] pld_avmm1_reserved_out;
  wire        pld_avmm1_write;
  wire  [7:0] pld_avmm1_writedata;
  wire        pld_chnl_cal_done;
  wire        pld_hssi_osc_transfer_en;
  


hssi_ss_1_systemclk_f_300_v5cyd2a_hip
    #(
        .enables_systempll(enables_systempll),
        .systempll_ethernet_preset_0(systempll_ethernet_preset_0),
        .systempll_ethernet_preset_1(systempll_ethernet_preset_1),
        .systempll_ethernet_preset_2(systempll_ethernet_preset_2),
        .systempll_pcie_preset_0(systempll_pcie_preset_0),
        .systempll_pcie_preset_1(systempll_pcie_preset_1),
        .systempll_pcie_preset_2(systempll_pcie_preset_2),
        .systempll_refsrc_0(systempll_refsrc_0),
        .systempll_refsrc_1(systempll_refsrc_1),
        .systempll_refsrc_2(systempll_refsrc_2),
        .syspll_availpor_0(syspll_availpor_0),
        .syspll_availpor_1(syspll_availpor_1),
        .syspll_availpor_2(syspll_availpor_2),
        .refclk_fgt_always_active_0(refclk_fgt_always_active_0),
        .refclk_fgt_always_active_1(refclk_fgt_always_active_1),
        .refclk_fgt_always_active_2(refclk_fgt_always_active_2),
        .refclk_fgt_always_active_3(refclk_fgt_always_active_3),
        .refclk_fgt_always_active_4(refclk_fgt_always_active_4),
        .refclk_fgt_always_active_5(refclk_fgt_always_active_5),
        .refclk_fgt_always_active_6(refclk_fgt_always_active_6),
        .refclk_fgt_always_active_7(refclk_fgt_always_active_7),
        .refclk_fgt_always_active_8(refclk_fgt_always_active_8),
        .refclk_fgt_always_active_9(refclk_fgt_always_active_9),
        .systempll_c0_counter_0(systempll_c0_counter_0),
        .systempll_c0_output_enable_0(systempll_c0_output_enable_0),
        .systempll_c1_counter_0(systempll_c1_counter_0),
        .systempll_c1_output_enable_0(systempll_c1_output_enable_0),
        .systempll_c2_counter_0(systempll_c2_counter_0),
        .systempll_c2_output_enable_0(systempll_c2_output_enable_0),
        .systempll_f_out_c0_hz_0(systempll_f_out_c0_hz_0),
        .systempll_f_out_c1_hz_0(systempll_f_out_c1_hz_0),
        .systempll_f_out_c2_hz_0(systempll_f_out_c2_hz_0),
        .systempll_f_pfd_hz_0(systempll_f_pfd_hz_0),
        .systempll_f_ref_hz_0(systempll_f_ref_hz_0),
        .systempll_f_vco_hz_0(systempll_f_vco_hz_0),
        .systempll_fractional_enable_0(systempll_fractional_enable_0),
        .systempll_m_counter_0(systempll_m_counter_0),
        .systempll_n_counter_0(systempll_n_counter_0),
        .systempll_primary_use_0(systempll_primary_use_0),
        .systempll_refclk_mux_select_0(systempll_refclk_mux_select_0),
        .systempll_eth_flux_used_0(systempll_eth_flux_used_0),
        .systempll_c0_counter_1(systempll_c0_counter_1),
        .systempll_c0_output_enable_1(systempll_c0_output_enable_1),
        .systempll_c1_counter_1(systempll_c1_counter_1),
        .systempll_c1_output_enable_1(systempll_c1_output_enable_1),
        .systempll_c2_counter_1(systempll_c2_counter_1),
        .systempll_c2_output_enable_1(systempll_c2_output_enable_1),
        .systempll_f_out_c0_hz_1(systempll_f_out_c0_hz_1),
        .systempll_f_out_c1_hz_1(systempll_f_out_c1_hz_1),
        .systempll_f_out_c2_hz_1(systempll_f_out_c2_hz_1),
        .systempll_f_pfd_hz_1(systempll_f_pfd_hz_1),
        .systempll_f_ref_hz_1(systempll_f_ref_hz_1),
        .systempll_f_vco_hz_1(systempll_f_vco_hz_1),
        .systempll_fractional_enable_1(systempll_fractional_enable_1),
        .systempll_m_counter_1(systempll_m_counter_1),
        .systempll_n_counter_1(systempll_n_counter_1),
        .systempll_primary_use_1(systempll_primary_use_1),
        .systempll_refclk_mux_select_1(systempll_refclk_mux_select_1),
        .systempll_eth_flux_used_1(systempll_eth_flux_used_1),
        .systempll_c0_counter_2(systempll_c0_counter_2),
        .systempll_c0_output_enable_2(systempll_c0_output_enable_2),
        .systempll_c1_counter_2(systempll_c1_counter_2),
        .systempll_c1_output_enable_2(systempll_c1_output_enable_2),
        .systempll_c2_counter_2(systempll_c2_counter_2),
        .systempll_c2_output_enable_2(systempll_c2_output_enable_2),
        .systempll_f_out_c0_hz_2(systempll_f_out_c0_hz_2),
        .systempll_f_out_c1_hz_2(systempll_f_out_c1_hz_2),
        .systempll_f_out_c2_hz_2(systempll_f_out_c2_hz_2),
        .systempll_f_pfd_hz_2(systempll_f_pfd_hz_2),
        .systempll_f_ref_hz_2(systempll_f_ref_hz_2),
        .systempll_f_vco_hz_2(systempll_f_vco_hz_2),
        .systempll_fractional_enable_2(systempll_fractional_enable_2),
        .systempll_m_counter_2(systempll_m_counter_2),
        .systempll_n_counter_2(systempll_n_counter_2),
        .systempll_primary_use_2(systempll_primary_use_2),
        .systempll_refclk_mux_select_2(systempll_refclk_mux_select_2),
        .systempll_eth_flux_used_2(systempll_eth_flux_used_2),
        .enables_refclk_fgt(enables_refclk_fgt),
        .enables_coreclk_fgt(enables_coreclk_fgt),
        .refclk_fgt_freq_0(refclk_fgt_freq_0),
        .refclk_fgt_freq_1(refclk_fgt_freq_1),
        .refclk_fgt_freq_2(refclk_fgt_freq_2),
        .refclk_fgt_freq_3(refclk_fgt_freq_3),
        .refclk_fgt_freq_4(refclk_fgt_freq_4),
        .refclk_fgt_freq_5(refclk_fgt_freq_5),
        .refclk_fgt_freq_6(refclk_fgt_freq_6),
        .refclk_fgt_freq_7(refclk_fgt_freq_7),
        .refclk_fgt_freq_8(refclk_fgt_freq_8),
        .refclk_fgt_freq_9(refclk_fgt_freq_9),
        .enables_cdrout_fgt(enables_cdrout_fgt),
        .enables_refclk_fht(enables_refclk_fht),
        .fhtref_fref_hz_0(fhtref_fref_hz_0),
        .fhtref_fref_hz_1(fhtref_fref_hz_1),
        .enables_commonpll(enables_commonpll),
        .commonpll_refsrc_0(commonpll_refsrc_0),
        .commonpll_refsrc_1(commonpll_refsrc_1),
        .cmnpll_en_cmos_refclk_out(cmnpll_en_cmos_refclk_out),
        .cmnpll_xtensa_used_0(cmnpll_xtensa_used_0),
        .cmnpll_xtensa_used_1(cmnpll_xtensa_used_1),
        .silicon_revision(silicon_revision),
        .device_revision(device_revision)
    ) x_hip (
        .*,
        .out_ctrl_pll_aibrc_clock_top__pll_0_slice0_clk_real(w_ctrl_pll_aibrc_clock_top__pll_0_slice0_clk_real),
        .out_ctrl_pll_aibrc_clock_top__pll_0_slice1_clk_real(w_ctrl_pll_aibrc_clock_top__pll_0_slice1_clk_real),
        .out_ctrl_pll_aibrc_clock_top__pll_0_slice2_clk_real(w_ctrl_pll_aibrc_clock_top__pll_0_slice2_clk_real),
        .out_ctrl_pll_aibrc_clock_top__pll_0_slice3_clk_real(w_ctrl_pll_aibrc_clock_top__pll_0_slice3_clk_real),

        .out_ctrl_pll_aibrc_clock_top__pll_1_slice0_clk_real(w_ctrl_pll_aibrc_clock_top__pll_1_slice0_clk_real),
        .out_ctrl_pll_aibrc_clock_top__pll_1_slice1_clk_real(w_ctrl_pll_aibrc_clock_top__pll_1_slice1_clk_real),
        .out_ctrl_pll_aibrc_clock_top__pll_1_slice2_clk_real(w_ctrl_pll_aibrc_clock_top__pll_1_slice2_clk_real),
        .out_ctrl_pll_aibrc_clock_top__pll_1_slice3_clk_real(w_ctrl_pll_aibrc_clock_top__pll_1_slice3_clk_real),

        .out_ctrl_pll_aibrc_clock_top__pll_2_slice0_clk_real(w_ctrl_pll_aibrc_clock_top__pll_2_slice0_clk_real),
        .out_ctrl_pll_aibrc_clock_top__pll_2_slice1_clk_real(w_ctrl_pll_aibrc_clock_top__pll_2_slice1_clk_real),
        .out_ctrl_pll_aibrc_clock_top__pll_2_slice2_clk_real(w_ctrl_pll_aibrc_clock_top__pll_2_slice2_clk_real),
        .out_ctrl_pll_aibrc_clock_top__pll_2_slice3_clk_real(w_ctrl_pll_aibrc_clock_top__pll_2_slice3_clk_real),



        // AVMM1 ports
        .pld_avmm1_busy( pld_avmm1_busy ),
        .pld_avmm1_clk_rowclk( pld_avmm1_clk_rowclk ),
        .pld_avmm1_cmdfifo_wr_full( pld_avmm1_cmdfifo_wr_full ),
        .pld_avmm1_cmdfifo_wr_pfull( pld_avmm1_cmdfifo_wr_pfull ),
        .pld_avmm1_read ( pld_avmm1_read ),
        .pld_avmm1_readdata ( pld_avmm1_readdata ),
        .pld_avmm1_readdatavalid ( pld_avmm1_readdatavalid ),
        .pld_avmm1_reg_addr( pld_avmm1_reg_addr ),
        .pld_avmm1_request( pld_avmm1_request ),
        .pld_avmm1_reserved_in ( pld_avmm1_reserved_in ),
        .pld_avmm1_reserved_out ( pld_avmm1_reserved_out ),
        .pld_avmm1_write ( pld_avmm1_write ),
        .pld_avmm1_writedata( pld_avmm1_writedata ),
        .pld_chnl_cal_done( pld_chnl_cal_done ),
        .pld_hssi_osc_transfer_en( pld_hssi_osc_transfer_en )

       
 
    );

    hssi_ss_1_systemclk_f_300_v5cyd2a_sip #(
        .enables_systempll(enables_systempll),
        .enables_refclk_fgt(enables_refclk_fgt),
        .enables_coreclk_fgt(enables_coreclk_fgt),
        .refclk_fgt_always_active_0(refclk_fgt_always_active_0),
        .refclk_fgt_always_active_1(refclk_fgt_always_active_1),
        .refclk_fgt_always_active_2(refclk_fgt_always_active_2),
        .refclk_fgt_always_active_3(refclk_fgt_always_active_3),
        .refclk_fgt_always_active_4(refclk_fgt_always_active_4),
        .refclk_fgt_always_active_5(refclk_fgt_always_active_5),
        .refclk_fgt_always_active_6(refclk_fgt_always_active_6),
        .refclk_fgt_always_active_7(refclk_fgt_always_active_7),
        .refclk_fgt_always_active_8(refclk_fgt_always_active_8),
        .refclk_fgt_always_active_9(refclk_fgt_always_active_9),
        .avmm_data_width(avmm_data_width),
        .avmm_addr_width (avmm_addr_width ),
        .read_pipeline_enable(read_pipeline_enable),
        .avmm_jtag_enable(avmm_jtag_enable),
        .refclkready_enable(refclkready_enable)
    )
    x_sip
    (
        .in_ctrl_pll_aibrc_clock_top__pll_0_slice0_clk_real(w_ctrl_pll_aibrc_clock_top__pll_0_slice0_clk_real),
        .in_ctrl_pll_aibrc_clock_top__pll_0_slice1_clk_real(w_ctrl_pll_aibrc_clock_top__pll_0_slice1_clk_real),
        .in_ctrl_pll_aibrc_clock_top__pll_0_slice2_clk_real(w_ctrl_pll_aibrc_clock_top__pll_0_slice2_clk_real),
        .in_ctrl_pll_aibrc_clock_top__pll_0_slice3_clk_real(w_ctrl_pll_aibrc_clock_top__pll_0_slice3_clk_real),

        .in_ctrl_pll_aibrc_clock_top__pll_1_slice0_clk_real(w_ctrl_pll_aibrc_clock_top__pll_1_slice0_clk_real),
        .in_ctrl_pll_aibrc_clock_top__pll_1_slice1_clk_real(w_ctrl_pll_aibrc_clock_top__pll_1_slice1_clk_real),
        .in_ctrl_pll_aibrc_clock_top__pll_1_slice2_clk_real(w_ctrl_pll_aibrc_clock_top__pll_1_slice2_clk_real),
        .in_ctrl_pll_aibrc_clock_top__pll_1_slice3_clk_real(w_ctrl_pll_aibrc_clock_top__pll_1_slice3_clk_real),

        .in_ctrl_pll_aibrc_clock_top__pll_2_slice0_clk_real(w_ctrl_pll_aibrc_clock_top__pll_2_slice0_clk_real),
        .in_ctrl_pll_aibrc_clock_top__pll_2_slice1_clk_real(w_ctrl_pll_aibrc_clock_top__pll_2_slice1_clk_real),
        .in_ctrl_pll_aibrc_clock_top__pll_2_slice2_clk_real(w_ctrl_pll_aibrc_clock_top__pll_2_slice2_clk_real),
        .in_ctrl_pll_aibrc_clock_top__pll_2_slice3_clk_real(w_ctrl_pll_aibrc_clock_top__pll_2_slice3_clk_real),

        .in_coreclk_0(out_coreclk_0),
        .in_coreclk_1(out_coreclk_1),
        .in_coreclk_2(out_coreclk_2),
        .in_coreclk_3(out_coreclk_3),
        .in_coreclk_4(out_coreclk_4),
        .in_coreclk_5(out_coreclk_5),
        .in_coreclk_6(out_coreclk_6),
        .in_coreclk_7(out_coreclk_7),
        .in_coreclk_8(out_coreclk_8),
        .in_coreclk_9(out_coreclk_9),
        .avmm_clk(avmm_clk),
        .avmm_reset(avmm_reset),
        .refclock_ready(refclock_ready),
        .refclock_status(refclock_status),

        // AVMM1 ports
        .pld_avmm1_busy( pld_avmm1_busy ),
        .pld_avmm1_clk_rowclk( pld_avmm1_clk_rowclk ),
        .pld_avmm1_cmdfifo_wr_full( pld_avmm1_cmdfifo_wr_full ),
        .pld_avmm1_cmdfifo_wr_pfull( pld_avmm1_cmdfifo_wr_pfull ),
        .pld_avmm1_read ( pld_avmm1_read ),
        .pld_avmm1_readdata ( pld_avmm1_readdata ),
        .pld_avmm1_readdatavalid ( pld_avmm1_readdatavalid ),
        .pld_avmm1_reg_addr( pld_avmm1_reg_addr ),
        .pld_avmm1_request( pld_avmm1_request ),
        .pld_avmm1_reserved_in ( pld_avmm1_reserved_in ),
        .pld_avmm1_reserved_out ( pld_avmm1_reserved_out ),
        .pld_avmm1_write ( pld_avmm1_write ),
        .pld_avmm1_writedata( pld_avmm1_writedata ),
        .pld_chnl_cal_done( pld_chnl_cal_done ),
        .pld_hssi_osc_transfer_en( pld_hssi_osc_transfer_en )
       
    );

endmodule

(* tile_ip_sip *)
module hssi_ss_1_systemclk_f_300_v5cyd2a_sip
#(
    parameter  enables_systempll        = 0,
    parameter  enables_refclk_fgt       = 0,
    parameter  enables_coreclk_fgt      = 0,
    parameter  refclk_fgt_always_active_0 = 0,
    parameter  refclk_fgt_always_active_1 = 0,
    parameter  refclk_fgt_always_active_2 = 0,
    parameter  refclk_fgt_always_active_3 = 0,
    parameter  refclk_fgt_always_active_4 = 0,
    parameter  refclk_fgt_always_active_5 = 0,
    parameter  refclk_fgt_always_active_6 = 0,
    parameter  refclk_fgt_always_active_7 = 0,
    parameter  refclk_fgt_always_active_8 = 0,
    parameter  refclk_fgt_always_active_9 = 0,
    parameter  avmm_data_width          = 32, 
    parameter  avmm_addr_width          = 18,
    parameter  read_pipeline_enable     = 0,
    parameter  avmm_jtag_enable         = 0,
    parameter  refclkready_enable       = 0
)
(
    input in_ctrl_pll_aibrc_clock_top__pll_0_slice0_clk_real,
    input in_ctrl_pll_aibrc_clock_top__pll_0_slice1_clk_real,
    input in_ctrl_pll_aibrc_clock_top__pll_0_slice2_clk_real,
    input in_ctrl_pll_aibrc_clock_top__pll_0_slice3_clk_real,
    input in_ctrl_pll_aibrc_clock_top__pll_1_slice0_clk_real,
    input in_ctrl_pll_aibrc_clock_top__pll_1_slice1_clk_real,
    input in_ctrl_pll_aibrc_clock_top__pll_1_slice2_clk_real,
    input in_ctrl_pll_aibrc_clock_top__pll_1_slice3_clk_real,
    input in_ctrl_pll_aibrc_clock_top__pll_2_slice0_clk_real,
    input in_ctrl_pll_aibrc_clock_top__pll_2_slice1_clk_real,
    input in_ctrl_pll_aibrc_clock_top__pll_2_slice2_clk_real,
    input in_ctrl_pll_aibrc_clock_top__pll_2_slice3_clk_real,

    input in_coreclk_0,
    input in_coreclk_1,
    input in_coreclk_2,
    input in_coreclk_3,
    input in_coreclk_4,
    input in_coreclk_5,
    input in_coreclk_6,
    input in_coreclk_7,
    input in_coreclk_8,
    input in_coreclk_9,
    
    // AVMM ports from/to top
    input avmm_clk,
    input avmm_reset,
    input[2:0] refclock_ready,

    output  refclock_status,
    input   en_refclk_fgt_0,
    input   en_refclk_fgt_1,
    input   en_refclk_fgt_2,
    input   en_refclk_fgt_3,
    input   en_refclk_fgt_4,
    input   en_refclk_fgt_5,
    input   en_refclk_fgt_6,
    input   en_refclk_fgt_7,
    input   en_refclk_fgt_8,
    input   en_refclk_fgt_9,
    
    output refclk_fgt_enabled_0,
    output refclk_fgt_enabled_1,
    output refclk_fgt_enabled_2,
    output refclk_fgt_enabled_3,
    output refclk_fgt_enabled_4,
    output refclk_fgt_enabled_5,
    output refclk_fgt_enabled_6,
    output refclk_fgt_enabled_7,
    output refclk_fgt_enabled_8,
    output refclk_fgt_enabled_9,
    
    input tri0 disable_refclk_monitor_0,
    input tri0 disable_refclk_monitor_1,
    input tri0 disable_refclk_monitor_2,
    input tri0 disable_refclk_monitor_3,
    input tri0 disable_refclk_monitor_4,
    input tri0 disable_refclk_monitor_5,
    input tri0 disable_refclk_monitor_6,
    input tri0 disable_refclk_monitor_7,
    input tri0 disable_refclk_monitor_8,
    input tri0 disable_refclk_monitor_9,


  //  for AVMM1 bb ports
  input  pld_avmm1_busy,
  output pld_avmm1_clk_rowclk,
  input  pld_avmm1_cmdfifo_wr_full,
  input  pld_avmm1_cmdfifo_wr_pfull,
  output  pld_avmm1_read,
  input [7:0]    pld_avmm1_readdata,
  input  pld_avmm1_readdatavalid,
  output [9:0]   pld_avmm1_reg_addr,
  output  pld_avmm1_request,
  output [8:0] pld_avmm1_reserved_in,
  input  [2:0] pld_avmm1_reserved_out,
  output  pld_avmm1_write,
  output [7:0] pld_avmm1_writedata,
  input   pld_chnl_cal_done,
  input   pld_hssi_osc_transfer_en
);

//Avmm1 mail box soft logic
  logic avmm_write;
  logic avmm_read;
  logic  [17:0] avmm_address;
  logic  [3:0]  avmm_byteenable;
  logic  [31:0] avmm_writedata;
  logic [31:0] avmm_readdata;
  logic        avmm_waitrequest;
  logic        avmm_readdatavalid;

 
  localparam S8_ADDR_WIDTH = 21;
  localparam BE_WIDTH      = avmm_data_width/8;
  logic [S8_ADDR_WIDTH-1:0]  avmm_m8_addr         ;  
  logic [7:0]                avmm_m8_wdata        ;  
  logic                      avmm_m8_write        ;  
  logic                      avmm_m8_read         ;  
  logic [7:0]                avmm_m8_readdata     ;  
  logic                      avmm_m8_waitrequest  ;  
  logic                      m32_read;
  logic                      m32_write;
  logic[avmm_data_width-1:0] m32_writedata  ;
  logic[avmm_data_width-1:0] m32_readdata ;
  logic                      m32_waitrequest;
  logic                      m32_readdatavalid;
  logic[avmm_addr_width-1:0] m32_address;
  logic [BE_WIDTH-1:0]       m32_byteenable;
 (* preserve *)
  logic                      cnoc_clk;

`ifndef ALTERA_RESERVED_QIS
  localparam learning_count=12000;
  localparam detetction_count=1200;
  always begin
    #2ns cnoc_clk = ~cnoc_clk;
  end
  initial begin
    cnoc_clk = 1'b0;
  end

`else
  localparam learning_count=120000;
  localparam detetction_count=12000;
  altera_config_clock_source_endpoint clock_endpoint (
    .clk(cnoc_clk)
    );

`endif // ifndef ALTERA_RESERVED_QIS  
///mailbox implementation
   // ref clock ready signal OR operation
   logic refclock_ready_or;
   //read status indication to user
   logic refclock_status_out;
   
   enum logic [3:0] {ST_IDLE, ST_WRITE, ST_WRITE_PAUSE, ST_READ_check, ST_READ, ST_READ_PAUSE, ST_WRITE_CLEAR, ST_CLEAR} cur_st, next_st;

   
   //refclock ready signal OR operation
   assign refclock_ready_or = |refclock_ready;
  always_ff @(posedge avmm_clk ) begin
   if(avmm_reset) begin
      cur_st     <= ST_IDLE;
   end else begin
       cur_st     <= next_st;
    end
 end

always_comb  begin
     avmm_write = 1'b0;
     avmm_read  =1'b0;
     avmm_address =18'h0;
     avmm_byteenable =4'b0;
     avmm_writedata =32'h0;
     refclock_status_out = 1'b0;
     next_st      = ST_IDLE;
  case (cur_st) 
    ST_IDLE: begin
           avmm_write = 1'b0;
           avmm_read  =1'b0;
		   refclock_status_out = 1'b0;
           avmm_address =18'h0;
           avmm_byteenable =4'b0;
           avmm_writedata =32'h0;
           next_st = ST_WRITE;
       end
      ST_WRITE: begin
          if (avmm_waitrequest && refclock_ready_or) begin
              avmm_write = 1'b1;
              avmm_read  =1'b0;
              avmm_address =18'h0001;
              avmm_byteenable =4'b1111;
              avmm_writedata =32'h90000000;
              next_st = ST_WRITE;
		end else if (!avmm_waitrequest && refclock_ready_or) begin 
	          avmm_write = 1'b0;
              avmm_byteenable =4'b0000;
              avmm_address =18'h0001;
		      next_st = ST_READ_check;	
           end else 
		   next_st = ST_IDLE;		     
        end
     ST_WRITE_PAUSE: begin
              avmm_write = 1'b0;
              avmm_byteenable =4'b0000;
              avmm_address =18'h0001;
              if(!avmm_waitrequest) begin
              next_st = ST_READ_check;            
               end
               else begin
               next_st = ST_WRITE_PAUSE;
               end
              end
      ST_READ_check: begin  
                  if (avmm_waitrequest && refclock_ready_or) begin
                      next_st = ST_READ;
                      end
                      else begin
                      next_st = ST_READ_check;
                      end
                     end
      ST_READ: begin   
                      avmm_write = 1'b0;
                      avmm_read  =1'b1;
                      avmm_address =18'h0002;
                      avmm_byteenable =4'b1111;
	           if (!avmm_waitrequest && (avmm_readdata[31:28]==4'h8 || avmm_readdata[31:28]==4'hA)) begin
                      next_st = ST_WRITE_CLEAR;
			   end else 
			          next_st = ST_READ;
          end
      ST_READ_PAUSE: begin
               if (!avmm_waitrequest && (avmm_readdata[31:28]==4'h8 || avmm_readdata[31:28]==4'hA)) begin
                  next_st = ST_WRITE_CLEAR;
                  refclock_status_out = 1'b1;
                  end
                  else begin
                  next_st=ST_READ;
                  refclock_status_out = 1'b0;
                  end
                 end
     ST_WRITE_CLEAR: begin
          if (avmm_waitrequest&&refclock_ready_or) begin
		      refclock_status_out = 1'b1;
              avmm_write = 1'b1;
              avmm_read  =1'b0;
              avmm_address =18'h0001;
              avmm_byteenable =4'b1111;
              avmm_writedata =32'h00000000;
              next_st = ST_CLEAR;
           end else
              refclock_status_out = 1'b1;		     
        end
     ST_CLEAR: begin
	        if (!refclock_ready_or) begin
                 next_st = ST_IDLE;
                 refclock_status_out = 1'b0;
             end else begin 
                  next_st = ST_CLEAR;
                  refclock_status_out = 1'b1;
            end
              avmm_write = 1'b0;
              avmm_read  =1'b0;
              avmm_address =18'h0;
              avmm_byteenable =4'b0;
              avmm_writedata =32'h0;
             // refclock_status_out = 1'b0;
            end 
  endcase
end

localparam integer MAX_CHARS_ALT_XCVR_NATIVE_S10 = 86;
  ////////////////////////////////////////////////////////////////////
  // Convert an integer to a string
  function [MAX_CHARS_ALT_XCVR_NATIVE_S10*8-1:0] int2str_alt_xcvr_native_s10(
    input integer in_int
  );
    integer i;
    integer this_char;
    i = 0;
    int2str_alt_xcvr_native_s10 = "";
    do
    begin
      this_char = (in_int % 10) + 48;
      int2str_alt_xcvr_native_s10[i*8+:8] = this_char[7:0];
      i=i+1;
      in_int = in_int / 10; 
    end
    while(in_int > 0);
  endfunction
 
 //assign avmm_readdata = m32_readdata;
 
 //Removed JTAG enable RTL code
         assign avmm_waitrequest   = m32_waitrequest  ;
         assign avmm_readdatavalid = m32_readdatavalid ;
         assign avmm_readdata      = m32_readdata;
         assign m32_read           = avmm_read    ;
         assign m32_write          = avmm_write   ;
         assign m32_address        = avmm_address ;
         assign m32_byteenable     = avmm_byteenable;
         assign m32_writedata      = avmm_writedata ;
         assign refclock_status    = refclock_status_out ;
 
    ft_avmm_32to8_bridge 
           #(   .ADDR_WIDTH ( avmm_addr_width ),
                .READ_PIPELINE_ENABLE ( read_pipeline_enable )
            )
      avmm_32to8_inst (
       // AVMM slave Port
       .i_clk                   (  avmm_clk ), 
       .i_rst                   (  avmm_reset ),
       
       .i_avmm_s32_addr         ( m32_address ),  
       .i_avmm_s32_wdata        ( m32_writedata ), 
       .i_avmm_s32_write        ( m32_write ), 
       .i_avmm_s32_read         ( m32_read ), 
       .i_avmm_s32_byte_enable  ( m32_byteenable ),
       .o_avmm_s32_readdata     ( m32_readdata ), 
       .o_avmm_s32_waitrequest  ( m32_waitrequest ),
       .o_avmm_s32_readdatavalid( m32_readdatavalid ),
 
       // Master Port
       .o_avmm_m8_addr          ( avmm_m8_addr ),
       .o_avmm_m8_wdata         ( avmm_m8_wdata ), 
       .o_avmm_m8_write         ( avmm_m8_write ), 
       .o_avmm_m8_read          ( avmm_m8_read ), 
       .i_avmm_m8_readdata      ( avmm_m8_readdata ), 
       .i_avmm_m8_waitrequest   ( avmm_m8_waitrequest )   
   );
       
      // instantiate avmm2 core logic
   ctfb_avmm1_soft_logic
                #(  .avmm_interfaces(1),                 //Number of AVMM interfaces required - one for each bonded_lane, PLL, and Master CGB
                    .rcfg_enable (1)                    //Enable/disable reconfig interface 
                 ) avmm1_ena_inst   (
                // AVMM slave interface signals (user)
                 .avmm_clk (avmm_clk) ,
                 .avmm_reset (avmm_reset),
                 .avmm_writedata (avmm_m8_wdata), 
                .avmm_address (avmm_m8_addr[9:0]), 
                .avmm_write (avmm_m8_write),
                .avmm_read (avmm_m8_read),
                .avmm_readdata (avmm_m8_readdata), 
                .avmm_waitrequest (avmm_m8_waitrequest),
                   
                // Signals from AVMM1 building block
                 .pld_avmm1_busy_real             ( pld_avmm1_busy),
                 .pld_avmm1_cmdfifo_wr_full_real  ( pld_avmm1_cmdfifo_wr_full ),
                 .pld_avmm1_cmdfifo_wr_pfull_real ( pld_avmm1_cmdfifo_wr_pfull ),
                 .pld_avmm1_readdata_real         ( pld_avmm1_readdata ),
                 .pld_avmm1_readdatavalid_real    ( pld_avmm1_readdatavalid),
                 .pld_avmm1_reserved_out_real     ( pld_avmm1_reserved_out ),
                 .pld_chnl_cal_done_real          ( pld_chnl_cal_done ),        
                 .pld_hssi_osc_transfer_en_real   ( pld_hssi_osc_transfer_en ),
                // Signals to AVMM1 building block
                 .pld_avmm1_clk_rowclk_real       ( pld_avmm1_clk_rowclk ),
                 .pld_avmm1_read_real             ( pld_avmm1_read),
                 .pld_avmm1_reg_addr_real         ( pld_avmm1_reg_addr),
                 .pld_avmm1_request_real          ( pld_avmm1_request ),
                 .pld_avmm1_reserved_in_real      ( pld_avmm1_reserved_in ),
                 .pld_avmm1_write_real            ( pld_avmm1_write ),
                 .pld_avmm1_writedata_real        ( pld_avmm1_writedata)
 
                );


//CLKRX Implementation 


localparam REFCLK_FGT_NUM = 10;

    wire [REFCLK_FGT_NUM-1:0] w_coreclk;
    assign w_coreclk = {
        in_coreclk_9,
        in_coreclk_8,
        in_coreclk_7,
        in_coreclk_6, 
        in_coreclk_5,
        in_coreclk_4,
        in_coreclk_3,
        in_coreclk_2, 
        in_coreclk_1,
        in_coreclk_0
        };

   for (genvar i=0;i<REFCLK_FGT_NUM;i++) begin : refclk_fgt_passthru
        localparam l_refclk_fgt_always_active =
           0 == i ? ( refclk_fgt_always_active_0 ? "TRUE" : "FALSE" )
           :
           1 == i ? ( refclk_fgt_always_active_1 ? "TRUE" : "FALSE" )
           :
           2 == i ? ( refclk_fgt_always_active_2 ? "TRUE" : "FALSE" )
           :
           3 == i ? ( refclk_fgt_always_active_3 ? "TRUE" : "FALSE" )
           :
           4 == i ? ( refclk_fgt_always_active_4 ? "TRUE" : "FALSE" )
           :
           5 == i ? ( refclk_fgt_always_active_5 ? "TRUE" : "FALSE" )
           :
           6 == i ? ( refclk_fgt_always_active_6 ? "TRUE" : "FALSE" )
           :
           7 == i ? ( refclk_fgt_always_active_7 ? "TRUE" : "FALSE" )
           :
           8 == i ? ( refclk_fgt_always_active_8 ? "TRUE" : "FALSE" )
           :
           9 == i ? ( refclk_fgt_always_active_9 ? "TRUE" : "FALSE" )
           :
           "IE"
           ;

        if ( enables_refclk_fgt[i] && (enables_coreclk_fgt[i] || l_refclk_fgt_always_active == "FALSE") ) begin : coreclk_enabled
            (* preserve, noprune *) reg coreclk_sdc;
            always_ff @(posedge w_coreclk[i]) begin
                coreclk_sdc <= ~coreclk_sdc;
            end
        end
    end

    for ( genvar i=0;i<3;i++ ) begin : gen_systempll
        if ( enables_systempll[i] ) begin : enabled
            wire in_ctrl_pll_aibrc_clock_top__pll_slice1_clk_real;
            assign in_ctrl_pll_aibrc_clock_top__pll_slice1_clk_real =
                (i==0) ? in_ctrl_pll_aibrc_clock_top__pll_0_slice1_clk_real :
                (i==1) ? in_ctrl_pll_aibrc_clock_top__pll_1_slice1_clk_real :
                (i==2) ? in_ctrl_pll_aibrc_clock_top__pll_2_slice1_clk_real :
                'bz
                ;
            (* preserve, noprune *) reg ctrl_pll_aibrc_clock_top__pll_slice1_clk_sdc;
            always_ff @(posedge in_ctrl_pll_aibrc_clock_top__pll_slice1_clk_real) begin
                ctrl_pll_aibrc_clock_top__pll_slice1_clk_sdc <= ~ctrl_pll_aibrc_clock_top__pll_slice1_clk_sdc;
            end
        end
    end

endmodule









