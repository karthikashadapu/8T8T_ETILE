module eth_ptp_adpt_f_top (
    input  wire                     tx_pll_locked                 ,
    output wire                     o_clk_pll                     , // When PTP is enabled, ptp_adpt_f's and ALL eth_f's clock is driven by same sysclk/2 from ptp_adpt_f
    input  wire                     i_reconfig_clk                ,
    input  wire                     i_reconfig_reset              ,

    input  wire [11:0]              i_reconfig_asym_addr           ,
    input  wire [3:0]               i_reconfig_asym_byteenable     ,
    input  wire                     i_reconfig_asym_write          ,
    input  wire [31:0]              i_reconfig_asym_writedata      ,
    input  wire                     i_reconfig_asym_read           ,
    output wire [31:0]              o_reconfig_asym_readdata       ,
    output wire                     o_reconfig_asym_readdata_valid ,
    output wire                     o_reconfig_asym_waitrequest    ,
    
    input  wire [11:0]              i_reconfig_p2p_addr            ,
    input  wire [3:0]               i_reconfig_p2p_byteenable      ,
    input  wire                     i_reconfig_p2p_write           ,
    input  wire [31:0]              i_reconfig_p2p_writedata       ,
    input  wire                     i_reconfig_p2p_read            ,
    output wire [31:0]              o_reconfig_p2p_readdata        ,
    output wire                     o_reconfig_p2p_readdata_valid  ,
    output wire                     o_reconfig_p2p_waitrequest     ,
    
    output wire                     ptp_link                           

);



//---------------------------------------------------------------
// PTP Adapter IP
//---------------------------------------------------------------
wire    ptp_adpt_f_sys_clk; // this clock must share the same system clock source with all associated eth_f IPs
wire    ptp_adpt_o_clk_pll;
wire    ptp_adpt_f_rst_n_src, ptp_adpt_f_rst_n; // sysclk/2_lock status signal is available from any eth_f IP. // For system design involving DR and eth_f IP with PTP is not always active, could 'OR' all available tx_pll_locked
wire   [16:0]               w_i_reconfig_ptp_asym_addr;
wire   [3:0]                w_i_reconfig_ptp_asym_byteenable;
wire                        w_i_reconfig_ptp_asym_write;
wire   [31:0]               w_i_reconfig_ptp_asym_writedata;
wire                        w_i_reconfig_ptp_asym_read;
wire   [31:0]               w_o_reconfig_ptp_asym_readdata;
wire                        w_o_reconfig_ptp_asym_readdata_valid;
wire                        w_o_reconfig_ptp_asym_waitrequest;
wire   [16:0]               w_i_reconfig_ptp_p2p_addr;
wire   [3:0]                w_i_reconfig_ptp_p2p_byteenable;
wire                        w_i_reconfig_ptp_p2p_write;
wire   [31:0]               w_i_reconfig_ptp_p2p_writedata;
wire                        w_i_reconfig_ptp_p2p_read;
wire   [31:0]               w_o_reconfig_ptp_p2p_readdata;
wire                        w_o_reconfig_ptp_p2p_readdata_valid;
wire                        w_o_reconfig_ptp_p2p_waitrequest;
// 0 == 0 - connect to avmm_decoder
// For p2p and asym addresses, append 5'h5 to the output of the decoder
// for we only expose 0_5000 ~ 0_5FFC for aib6/7
assign w_i_reconfig_ptp_p2p_addr          = {5'h5, i_reconfig_p2p_addr};
assign w_i_reconfig_ptp_p2p_byteenable    = i_reconfig_p2p_byteenable;
assign w_i_reconfig_ptp_p2p_write         = i_reconfig_p2p_write;
assign w_i_reconfig_ptp_p2p_writedata     = i_reconfig_p2p_writedata;
assign w_i_reconfig_ptp_p2p_read          = i_reconfig_p2p_read;
assign o_reconfig_p2p_readdata              = w_o_reconfig_ptp_p2p_readdata;
assign o_reconfig_p2p_readdata_valid        = w_o_reconfig_ptp_p2p_readdata_valid;
assign o_reconfig_p2p_waitrequest           = w_o_reconfig_ptp_p2p_waitrequest;

assign w_i_reconfig_ptp_asym_addr         = {5'h5, i_reconfig_asym_addr};
assign w_i_reconfig_ptp_asym_byteenable   = i_reconfig_asym_byteenable;
assign w_i_reconfig_ptp_asym_write        = i_reconfig_asym_write;
assign w_i_reconfig_ptp_asym_writedata    = i_reconfig_asym_writedata;
assign w_i_reconfig_ptp_asym_read         = i_reconfig_asym_read;
assign o_reconfig_asym_readdata             = w_o_reconfig_ptp_asym_readdata;
assign o_reconfig_asym_readdata_valid       = w_o_reconfig_ptp_asym_readdata_valid;
assign o_reconfig_asym_waitrequest          = w_o_reconfig_ptp_asym_waitrequest;

assign ptp_adpt_f_sys_clk = ptp_adpt_o_clk_pll;
assign o_clk_pll          = ptp_adpt_o_clk_pll;

assign ptp_adpt_f_rst_n_src = tx_pll_locked;

alt_xcvr_resync_std #(
    .SYNC_CHAIN_LENGTH  (3+5), // increase flops to relax timing
    .WIDTH              (1),
    .INIT_VALUE         (0)
) ptp_adpt_rst_n_sync (
    .clk                (ptp_adpt_f_sys_clk),
    .reset              (1'b0),
    .d                  (ptp_adpt_f_rst_n_src),
    .q                  (ptp_adpt_f_rst_n)
);

`ifndef __TILE_IP__
eth_ptp_adpt_f  ptp_adpt_f (
    .o_clk_pll                          (ptp_adpt_o_clk_pll                   ), // When PTP is enabled, ptp_adpt_f's and ALL eth_f's clock is driven by same sysclk/2 from ptp_adpt_f
    .i_sys_clk                          (ptp_adpt_f_sys_clk                   ),
    .i_rst_n                            (ptp_adpt_f_rst_n                     ),
    .i_reconfig_clk                     (i_reconfig_clk                       ),
    .i_reconfig_reset                   (i_reconfig_reset                     ),

    .i_reconfig_ptp_asym_addr           (w_i_reconfig_ptp_asym_addr           ),
    .i_reconfig_ptp_asym_byteenable     (w_i_reconfig_ptp_asym_byteenable     ),
    .i_reconfig_ptp_asym_write          (w_i_reconfig_ptp_asym_write          ),
    .i_reconfig_ptp_asym_writedata      (w_i_reconfig_ptp_asym_writedata      ),
    .i_reconfig_ptp_asym_read           (w_i_reconfig_ptp_asym_read           ),
    .o_reconfig_ptp_asym_readdata       (w_o_reconfig_ptp_asym_readdata       ),
    .o_reconfig_ptp_asym_readdata_valid (w_o_reconfig_ptp_asym_readdata_valid ),
    .o_reconfig_ptp_asym_waitrequest    (w_o_reconfig_ptp_asym_waitrequest    ),
    
    .i_reconfig_ptp_p2p_addr            (w_i_reconfig_ptp_p2p_addr            ),
    .i_reconfig_ptp_p2p_byteenable      (w_i_reconfig_ptp_p2p_byteenable      ),
    .i_reconfig_ptp_p2p_write           (w_i_reconfig_ptp_p2p_write           ),
    .i_reconfig_ptp_p2p_writedata       (w_i_reconfig_ptp_p2p_writedata       ),
    .i_reconfig_ptp_p2p_read            (w_i_reconfig_ptp_p2p_read            ),
    .o_reconfig_ptp_p2p_readdata        (w_o_reconfig_ptp_p2p_readdata        ),
    .o_reconfig_ptp_p2p_readdata_valid  (w_o_reconfig_ptp_p2p_readdata_valid  ),
    .o_reconfig_ptp_p2p_waitrequest     (w_o_reconfig_ptp_p2p_waitrequest     ),
    
    .ptp_link                           (ptp_link                             )
);
`endif
// PTP Adapter IP -- end
//---------------------------------------------------------------
endmodule
