//****************************************************************************
//
// SPDX-License-Identifier: MIT-0
// Copyright(c) 2019-2021 Intel Corporation.
//
//****************************************************************************
// This is a generated system top level RTL file. 



module ghrd_agilex_top #(
  parameter FP_WIDTH = 20,
  parameter NUM_PORTS= 4
)
(

//Additional refclk_bti to preserve Ftile XCVR
input    wire                   refclk_bti,
// Clock and Reset
//input    wire                   tod_refclk,            //ToD ref clk 156.25 MHz
input    wire                   dsp_clk_491m,                //DSP clk 491.52MHz
input    wire [1-1:0]           fpga_clk_100,
output   wire [4-1:0]           fpga_led_pio,
output   wire [9:0]             user_io,
output   wire [7:0]             user_led,
input    wire [4-1:0]           fpga_dipsw_pio,
input    wire [4-1:0]           fpga_button_pio,
input    wire [1:0]             ftile_clk_ref,
input    wire                   ftile_master_todclk_ref,
output   wire [NUM_PORTS-1:0]   ftile_tx_serial,                                        // in this design, *tx_serial[0] corrsponds to hssi port8 and *tx_serial[1] to hssi_port12
output   wire [NUM_PORTS-1:0]   ftile_tx_serial_n,
input    wire [NUM_PORTS-1:0]   ftile_rx_serial,
input    wire [NUM_PORTS-1:0]   ftile_rx_serial_n,
output   wire                   master_tod_top_0_pulse_per_second,
input    wire                   ref_pps_in,
output   wire [NUM_PORTS-1:0]   hssi_cdr_clk_out,   // *clk_out[0] corresponds to hissi_port8 cdr clk and clk_out[1] to hssi_port12 cdr clk
input    wire                   jesd_xcvr_clk,
input    wire                   sysref,

output   wire [8-1:0]           jesd_tx_serial,
output   wire [8-1:0]           jesd_tx_serial_n,
input    wire [8-1:0]           jesd_rx_serial,
input    wire [8-1:0]           jesd_rx_serial_n,                                   


//QSFP Sideband
input    wire                   qsfpdd_modprsn,
output   wire                   qsfpdd_resetn,
output   wire                   qsfpdd_modseln,
input    wire                   qsfpdd_intn,
// initmode  == lpmode
output   wire                   qsfpdd_initmode,
inout    wire                   qsfpdd_i2c_scl,
inout    wire                   qsfpdd_i2c_sda,
inout    wire                   zl_i2c_scl,
inout    wire                   zl_i2c_sda,

input    wire                   uart1_RX,
output   wire                   uart1_TX,
//SPI
output   wire                   agilex_hps_spim1_mosi_o,                                //                      agilex_hps_spim1.mosi_o
input    wire                   agilex_hps_spim1_miso_i,                                //                                      .miso_i
//input    wire           agilex_hps_spim1_ss_in_n,                               //                                      .ss_in_n
output   wire                   agilex_hps_spim1_mosi_oe,                               //                                      .mosi_oe
output   wire                   agilex_hps_spim1_ss0_n_o,                               //                                      .ss0_n_o
output   wire                   agilex_hps_spim1_ss1_n_o,                               //                                      .ss1_n_o
output   wire                   agilex_hps_spim1_ss2_n_o,                               //                                      .ss2_n_o
output   wire                   agilex_hps_spim1_ss3_n_o,                               //                                      .ss3_n_o
output   wire                   agilex_hps_spim1_sclk_out_clk,                          //             agilex_hps_spim1_sclk_out.clk

//HPS
// HPS EMIF
output   wire [0:0]    emif_hps_mem_mem_ck,
output   wire [0:0]    emif_hps_mem_mem_ck_n,
output   wire [16:0]   emif_hps_mem_mem_a,
output   wire [0:0]    emif_hps_mem_mem_act_n,
output   wire [1:0]    emif_hps_mem_mem_ba,
output   wire [1-1:0]    emif_hps_mem_mem_bg,
output   wire [0:0]    emif_hps_mem_mem_cke,
output   wire [1:0]    emif_hps_mem_mem_cs_n,
output   wire [0:0]    emif_hps_mem_mem_odt,
output   wire [0:0]    emif_hps_mem_mem_reset_n,
output   wire [0:0]    emif_hps_mem_mem_par,
input    wire [0:0]    emif_hps_mem_mem_alert_n,
input    wire          emif_hps_oct_oct_rzqin,
input    wire          emif_hps_pll_ref_clk,
inout    wire [9-1:0]   emif_hps_mem_mem_dbi_n,
inout    wire [72-1:0]   emif_hps_mem_mem_dq,
inout    wire [9-1:0]   emif_hps_mem_mem_dqs,
inout    wire [9-1:0]   emif_hps_mem_mem_dqs_n,

input    wire        hps_jtag_tck,
input    wire        hps_jtag_tms,
output   wire        hps_jtag_tdo,
input    wire        hps_jtag_tdi,
output   wire        hps_sdmmc_CCLK, 
inout    wire        hps_sdmmc_CMD,          
inout    wire        hps_sdmmc_D0,          
inout    wire        hps_sdmmc_D1,          
inout    wire        hps_sdmmc_D2,        
inout    wire        hps_sdmmc_D3,
inout    wire        hps_sdmmc_D4, 
inout    wire        hps_sdmmc_D5, 
inout    wire        hps_sdmmc_D6, 
inout    wire        hps_sdmmc_D7,          
inout    wire        hps_usb0_DATA0,         
inout    wire        hps_usb0_DATA1,      
inout    wire        hps_usb0_DATA2,        
inout    wire        hps_usb0_DATA3,       
inout    wire        hps_usb0_DATA4,        
inout    wire        hps_usb0_DATA5,      
inout    wire        hps_usb0_DATA6,      
inout    wire        hps_usb0_DATA7,         
input    wire        hps_usb0_CLK,         
output   wire        hps_usb0_STP,       
input    wire        hps_usb0_DIR,        
input    wire        hps_usb0_NXT, 
output   wire        hps_emac0_TX_CLK,       //TODO: may need to change RMII TX CLK to be input instead, check
input    wire        hps_emac0_RX_CLK,      
output   wire        hps_emac0_TX_CTL,
input    wire        hps_emac0_RX_CTL,      
output   wire        hps_emac0_TXD0,       
output   wire        hps_emac0_TXD1,
input    wire        hps_emac0_RXD0,     
input    wire        hps_emac0_RXD1,                
output   wire        hps_emac0_TXD2,        
output   wire        hps_emac0_TXD3,
input    wire        hps_emac0_RXD2,        
input    wire        hps_emac0_RXD3, 
inout    wire        hps_emac0_MDIO,         
output   wire        hps_emac0_MDC,
input    wire        hps_uart0_RX,       
output   wire        hps_uart0_TX, 
output   wire        hps_emac1_TX_CLK,       //TODO: may need to change RMII TX CLK to be input instead, check
input    wire        hps_emac1_RX_CLK,      
output   wire        hps_emac1_TX_CTL,
input    wire        hps_emac1_RX_CTL,      
output   wire        hps_emac1_TXD0,       
output   wire        hps_emac1_TXD1,
input    wire        hps_emac1_RXD0,     
input    wire        hps_emac1_RXD1,                
output   wire        hps_emac1_TXD2,        
output   wire        hps_emac1_TXD3,
input    wire        hps_emac1_RXD2,        
input    wire        hps_emac1_RXD3, 
inout    wire        hps_emac1_MDIO,         
output   wire        hps_emac1_MDC,
input    wire        hps_uart1_RX,       
output   wire        hps_uart1_TX, 
inout    wire        hps_i2c1_SDA,        
inout    wire        hps_i2c1_SCL, 
inout    wire        hps_gpio0_io11,
inout    wire        hps_gpio0_io12,
inout    wire        hps_gpio0_io13,
inout    wire        hps_gpio0_io14,
inout    wire        hps_gpio0_io15,
inout    wire        hps_gpio0_io16,
inout    wire        hps_gpio0_io17,
inout    wire        hps_gpio0_io18,
inout    wire        hps_gpio1_io16,
inout    wire        hps_gpio1_io17,
//inout    wire        hps_i2c1_SDA,        
//inout    wire        hps_i2c1_SCL, 
inout    wire        hps_gpio1_io0,
inout    wire        hps_gpio1_io1,
inout    wire        hps_gpio1_io4,
inout    wire        hps_gpio1_io5,
inout    wire        hps_gpio1_io6,
inout    wire        hps_gpio1_io7,
inout    wire        hps_gpio1_io19,
inout    wire        hps_gpio1_io20,
inout    wire        hps_gpio1_io21,
input    wire        hps_ref_clk,
input    wire [1-1:0]   fpga_reset_n,

output   wire			hps_spim0_clk   ,
output   wire			hps_spim0_mosi_o,
input    wire			hps_spim0_miso_i,
output   wire			hps_spim0_ss0_n ,
 
output   wire			hps_spim1_clk   ,
output   wire			hps_spim1_mosi_o,
input    wire			hps_spim1_miso_i,
output   wire			hps_spim1_ss0_n ,
output   wire			hps_spim1_ss1_n 
);

localparam int NUM_ETH_CHANNELS           = 2;

ofs_fim_hssi_ss_tx_axis_if        hssi_ss_st_tx [NUM_ETH_CHANNELS-1:0]();

wire                        port12_tx_dma_fifo_0_out_ts_req_valid;       // dma_subsys_dma_subsys_port12_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req.valid
wire [31:0]                 port12_tx_dma_fifo_0_out_ts_req_fingerprint; // .fingerprint

wire                        port8_tx_dma_fifo_0_out_ts_req_valid;        //  dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req.valid
wire [19:0]                 port8_tx_dma_fifo_0_out_ts_req_fingerprint;  // .fingerprint

wire                        clk_dspby2   ;
wire                        system_clk_100;
wire                        system_clk_100_internal;
wire                        ninit_done;
wire                        fpga_reset_n_debounced_wire;
reg                         fpga_reset_n_debounced;
wire                        src_reset_n;
wire                        system_reset_n;
wire                        h2f_reset;
wire                        niosv_issp_reset;

wire  [7:0]                 source_wire;
wire  [19:0]                ftile_debug_status;
//-------------RESET LOGIC --------------------
wire                        hssi_tx_rst_n,hssi_rx_rst_n; 
wire                        hssi_cold_boot_rstn, hssi_cold_boot_rstackn_sync;
wire  [(NUM_PORTS*10)-1:0]  status_vector;// {10 status bits for each port}
wire                        p8_rx_pcs_rdy, p12_rx_pcs_rdy;
wire                        port8_eth_link_down_reset, port12_eth_link_down_reset;
wire                        a_rst_n, rdl_ready;

reg                         hssi_cold_boot_reg;
// 2 step ptp signal

wire  		ptp_ets_valid   		;
wire [19:0] ptp_ets_fp 		;
wire [95:0] ptp_ets   		;
wire  		ptp_rx_its_valid 		;    
wire [95:0] ptp_rx_its		;
wire [95:0] mac_ptp_rx_its  ;
wire  		mac_ptp_rx_its_valid  ;
wire 		mac_ptp_ts_req  ;                  
wire [21:0]	mac_ptp_fp ;

wire 		mac_ptp_ts_req_out  ;                  
wire [21:0]	mac_ptp_fp_out ;

wire 		 tx_egrs0_interface_tvalid ;
wire [127:0] tx_egrs0_interface_tdata  ;
wire [95:0 ] i_axi_st_rx_ingrts0_tdata ;
wire 		 i_axi_st_rx_ingrts0_tvalid;

wire [31:0]  tx_egrs0_interface_fp; 
wire [127:0] tx_egrs0_interface_data;
wire  [93:0] o_axi_st_tx_tuser_ptp;         
wire [327:0] o_axi_st_tx_tuser_ptp_extended;

wire [4:0]   p0_rx_tuser_status_tuser_1;
 
wire hssi_rx_streaming_valid          ;       
wire hssi_rx_streaming_startofpacket  ;

wire iopll_491_locked ;
wire clk_dsp          ;
wire iopll_390_locked ;
wire rx_pcs_ready    ;
wire tx_lanes_stable ;

wire jesd_link_clk,jesd_frame_clk,jesd_tx_rst_s,jesd_rx_rst_s,dsp_tx_rst_s,dsp_rx_rst_s;
wire tx_jesd_avst_valid,tx_jesd_avst_ready;
wire [511:0] tx_jesd_avst_data;
wire rx_jesd_avst_valid,rx_jesd_avst_ready;
wire [511:0] rx_jesd_avst_data;
wire jesd_core_pll_lock;
wire jesd_core_pll_lock_r;
wire jesd_tx_ack_rst_n,jesd_rx_ack_rst_n;
wire dfe_lpbk;
wire [511:0] tx_arranged_data;
wire [511:0] rx_arranged_data;

wire       			dl_avst_source_valid  	;
wire [127:0]  		dl_avst_source_data  	;
wire [31:0]			dl_avst_source_data_l0	;
wire [31:0]			dl_avst_source_data_l1	;
wire [31:0]			dl_avst_source_data_l2	;
wire [31:0]			dl_avst_source_data_l3	;
wire [31:0]			dl_avst_source_data_l4	;
wire [31:0]			dl_avst_source_data_l5	;
wire [31:0]			dl_avst_source_data_l6	;
wire [31:0]			dl_avst_source_data_l7	;


wire                ul_avst_source_valid    ;
wire [31:0]         ul_avst_source_data_l0  ;
wire [31:0]         ul_avst_source_data_l1  ;
wire [31:0]         ul_avst_source_data_l2  ;
wire [31:0]         ul_avst_source_data_l3  ;
wire [31:0]         ul_avst_source_data_l4  ;
wire [31:0]         ul_avst_source_data_l5  ;
wire [31:0]         ul_avst_source_data_l6  ;
wire [31:0]         ul_avst_source_data_l7  ;

wire 		        ul_avst_sink_valid;
wire [127:0]        ul_avst_sink_data;
wire [31:0]         ul_avst_sink_data_l0  ;
wire [31:0]         ul_avst_sink_data_l1  ;
wire [31:0]         ul_avst_sink_data_l2  ;
wire [31:0]         ul_avst_sink_data_l3  ;
wire [31:0]         ul_avst_sink_data_l4  ;
wire [31:0]         ul_avst_sink_data_l5  ;
wire [31:0]         ul_avst_sink_data_l6  ;
wire [31:0]         ul_avst_sink_data_l7  ;

wire 		        ul_avst_jesd_sink_valid;
wire [127:0]        ul_avst_jesd_sink_data;

wire ftile_clk  ;

wire 		ecpri_mac_valid          ;                  
wire [63:0]	ecpri_mac_data           ;          
wire 		ecpri_mac_ready          ; 
wire 		ecpri_mac_startofpacket  ; 
wire [2:0]	ecpri_mac_empty          ; 
wire 		ecpri_mac_endofpacket    ;

wire 	   bridge_avst_tx_if_ready           ;       
wire 	   bridge_avst_tx_if_valid           ;
wire [63:0]bridge_avst_tx_if_data            ;
wire 	   bridge_avst_tx_if_startofpacket   ;
wire	   bridge_avst_tx_if_endofpacket     ;
wire [2:0] bridge_avst_tx_if_empty           ;
wire 	   bridge_avst_tx_if_error           ;

wire 		p0_axi_st_tx_interface_tvalid ;
wire 		p0_axi_st_tx_interface_tready ;
wire [63:0] p0_axi_st_tx_interface_tdata  ;
wire [7:0]  p0_axi_st_tx_interface_tkeep  ;
wire     	p0_axi_st_tx_interface_tlast  ;
wire [1:0]	p0_axi_st_tx_interface_tuser  ;

logic [95:0]master_tod_time_of_day_96b;
logic [95:0]master_tod_time_of_day_96b_synced_tod;



// Two-stage pipeline for timing closure and fanout buffering tod
logic [95:0] stage1_reg;
logic [95:0] stage2_reg;

always @(posedge fpga_clk_100 or negedge hssi_cold_boot_rstn)
  if(~hssi_cold_boot_rstn)
begin
		stage1_reg <= 96'h0;
		stage2_reg <= 96'h0;
	end else begin
		stage1_reg <= master_tod_time_of_day_96b;
		stage2_reg <= stage1_reg;
	end


assign master_tod_time_of_day_96b_synced_tod = stage2_reg;

//DL to UL Loopback
//---------------------------------------------------------------
assign ul_avst_source_valid     = dl_avst_source_valid;
assign ul_avst_source_data_l0 	= dl_avst_source_data_l0;
assign ul_avst_source_data_l1 	= dl_avst_source_data_l1;
assign ul_avst_source_data_l2 	= dl_avst_source_data_l2;
assign ul_avst_source_data_l3 	= dl_avst_source_data_l3;
assign ul_avst_source_data_l4 	= dl_avst_source_data_l4;
assign ul_avst_source_data_l5 	= dl_avst_source_data_l5;
assign ul_avst_source_data_l6 	= dl_avst_source_data_l6;
assign ul_avst_source_data_l7 	= dl_avst_source_data_l7;


assign ul_avst_sink_valid = (dfe_lpbk) ? ul_avst_source_valid : ul_avst_jesd_sink_valid;

assign ul_avst_sink_data_l0 = (dfe_lpbk) ? ul_avst_source_data_l0 : ul_avst_jesd_sink_data[31:0];
assign ul_avst_sink_data_l1 = (dfe_lpbk) ? ul_avst_source_data_l1 : ul_avst_jesd_sink_data[63:32];
assign ul_avst_sink_data_l2 = (dfe_lpbk) ? ul_avst_source_data_l2 : ul_avst_jesd_sink_data[95:64];
assign ul_avst_sink_data_l3 = (dfe_lpbk) ? ul_avst_source_data_l3 : ul_avst_jesd_sink_data[127:96];
assign ul_avst_sink_data_l4 = (dfe_lpbk) ? ul_avst_source_data_l4 : 'd0;
assign ul_avst_sink_data_l5 = (dfe_lpbk) ? ul_avst_source_data_l5 : 'd0;
assign ul_avst_sink_data_l6 = (dfe_lpbk) ? ul_avst_source_data_l6 : 'd0;
assign ul_avst_sink_data_l7 = (dfe_lpbk) ? ul_avst_source_data_l7 : 'd0;

wire        measure_dsp_clk_491_valid;
wire [31:0] refclk_measure_dsp_clk_491;

wire        measure_iopll_390p625_valid;
wire [31:0] refclk_measure_iopll_390p625;
	
wire        measure_sysref_valid;
wire [31:0] refclk_measure_sysref;
	
wire        measure_ftile_clk_valid;
wire [31:0] refclk_measure_ftile_clk;


alt_reset_delay rd1 ( .clk    (fpga_clk_100), .ready_in(~ninit_done),  .ready_out(a_rst_n) );
defparam rd1.CNTR_BITS = 28;//TODO check 16bits


//assign system_reset_n = fpga_reset_n_debounced & src_reset_n & ~h2f_reset & ~ninit_done & source_wire[0];
assign system_reset_n      = a_rst_n & ~source_wire[0];

assign hssi_tx_rst_n       = a_rst_n & ~source_wire[3];
assign hssi_rx_rst_n       = a_rst_n & ~source_wire[2];
assign hssi_cold_boot_rstn = a_rst_n & ~source_wire[1];

// cold boot reset logic
    altera_eth_1588_tod_synchronizer_std_synchr_nocut cold_boot_rstackn_sync_inst (
        .clk        (fpga_clk_100),
        .reset_n    (1'b1),
        .din        (status_vector[0]),          // cold boot reset ackn
        .dout       (hssi_cold_boot_rstackn_sync[0])
    );

always @(posedge fpga_clk_100 or negedge hssi_cold_boot_rstn)
  if(~hssi_cold_boot_rstn)
    hssi_cold_boot_reg <= 1'b0;
  else if(~hssi_cold_boot_rstackn_sync)
    hssi_cold_boot_reg <= 1'b1;




assign  ftile_debug_status[6:0]   = status_vector[9:3];      // port 8 status
assign  p8_rx_pcs_rdy  = status_vector[5];

assign  port8_eth_link_down_reset =  ~(status_vector[3] & status_vector[5]);

assign system_clk_100   = fpga_clk_100;

assign system_clk_100_internal  = system_clk_100;

wire [4-1:0]     fpga_debounced_buttons;
wire [4-2:0]     fpga_led_internal;
wire           	 heartbeat_led;
reg  [22:0]    	 heartbeat_count;
assign fpga_led_pio = {heartbeat_led,fpga_led_internal};
assign heartbeat_led = ~heartbeat_count[22];

wire [31:0]    f2h_irq1_irq;


wire [43:0]    stm_hw_events;

assign stm_hw_events    = {{20{1'b0}}, heartbeat_led, fpga_led_internal, fpga_dipsw_pio, fpga_debounced_buttons};

//----------QSFPDD LOGIC --------------------------------
wire qsfpdd_i2c_scl_oe;
wire qsfpdd_i2c_sda_oe;
wire zl_i2c_scl_oe;
wire zl_i2c_sda_oe;
wire [1:0]  qsfpdd_status_pio;
wire [5:0]  qsfpdd_spi_ctrl_pio;
wire        agilex_hps_spim1_ss_in_n;
wire [1:0]  glitch_free_cmux_sel;


assign qsfpdd_resetn            = qsfpdd_spi_ctrl_pio[0]; //1'b1;
assign qsfpdd_initmode          = qsfpdd_spi_ctrl_pio[1]; //1'b1;	//known as LPMode in QSFPDD
assign qsfpdd_modseln           = qsfpdd_spi_ctrl_pio[2]; //1'b0;
assign agilex_hps_spim1_ss_in_n = qsfpdd_spi_ctrl_pio[3]; //1'b1;
assign glitch_free_cmux_sel     = qsfpdd_spi_ctrl_pio[5:4];// 2'b01

assign qsfpdd_i2c_scl = (qsfpdd_i2c_scl_oe == 1'b1) ? 1'b0 : 1'bz;
assign qsfpdd_i2c_sda = (qsfpdd_i2c_sda_oe == 1'b1) ? 1'b0 : 1'bz;

assign zl_i2c_scl = (zl_i2c_scl_oe == 1'b1) ? 1'b0 : 1'bz;
assign zl_i2c_sda = (zl_i2c_sda_oe == 1'b1) ? 1'b0 : 1'bz;

assign qsfpdd_status_pio = {qsfpdd_intn, qsfpdd_modprsn};


assign f2h_irq1_irq    = {32'b0};

//Temporary disable src_reset_n
assign src_reset_n = 1'b1;

logic hssi_pll_rst  ;

fim_resync #(
    .SYNC_CHAIN_LENGTH  (2),
    .WIDTH              (1),
    .INIT_VALUE         (1),
    .NO_CUT             (0)
   ) st_tx_rst_sync(
    .clk                (ftile_clk),
    .reset              (~hssi_tx_rst_n),
    .d                  (1'b0),
    .q                  (hssi_pll_rst)
);




// //-------------------- Qsys Top module -------------------
// qsys_top  #(
//   .FP_WIDTH  (FP_WIDTH)
// )
// soc_inst
// (
// 	.clk_csr_in_clk_clk                              										 (system_clk_100_internal),
// 	.clk_dsp_in_clk_clk                              										 (clk_dsp),
// 	.rst_csr_in_reset_reset_n                        										 (system_reset_n),
// 	.rst_dsp_in_reset_reset                          										 ((~system_reset_n) & iopll_491_locked),
// 	.rst_eth_in_reset_reset                          										 ((~system_reset_n)),
// 	.clk_100_clk                                     										 (system_clk_100_internal),
// 	.rst_csr_act_high_in_reset_reset                 										 (system_reset_n),
// 	.ts_chs_compl_0_rst_bus_in_reset                 										 (hssi_pll_rst),
// 	.hssi_ss_1_i_clk_ref_clk                         										 (ftile_clk_ref),
// 	.ninit_done_ninit_done                           										 (ninit_done),
// 	.led_pio_external_connection_in_port             										 (fpga_led_internal),
// 	.led_pio_external_connection_out_port            										 (fpga_led_internal),
// 	.dipsw_pio_external_connection_export            										 (fpga_dipsw_pio),
// 	.button_pio_external_connection_export           										 (fpga_debounced_buttons),
// 	.qsfpdd_status_pio_external_connection_export    										 (qsfpdd_status_pio),
// 	.qsfpdd_ctrl_pio_0_econ_export                   										 (qsfpdd_spi_ctrl_pio),

// 	.hssi_ss_1_p0_tx_srl_interface_p0_tx_serial      										 (ftile_tx_serial[0]),
// 	.hssi_ss_1_p0_tx_srl_interface_p0_tx_serial_n    										 (ftile_tx_serial_n[0]),
// 	.hssi_ss_1_p0_rx_srl_interface_p0_rx_serial      										 (ftile_rx_serial[0]),
// 	.hssi_ss_1_p0_rx_srl_interface_p0_rx_serial_n    										 (ftile_rx_serial_n[0]),
	
// 	.qsys_top_master_todclk_0_in_clk_clk                                 					 (ftile_master_todclk_ref),
// 	.master_tod_top_0_pulse_per_second_pps                               					 (master_tod_top_0_pulse_per_second),        //  master_tod_top_0_pulse_per_second.writeresponsevalid_n
// 	.mtod_subsys_pps_in_pulse_per_second                                 					 (ref_pps_in),

// 	.agilex_hps_f2h_stm_hw_events_stm_hwevents 												 (stm_hw_events),     
// 	//Terminate the CS_JTAG.
// 	.agilex_hps_h2f_cs_ntrst                                             					 (1'b1),  
// 	.agilex_hps_h2f_cs_tck                                               					 (1'b1),    
// 	.agilex_hps_h2f_cs_tdi                                               					 (1'b1),    
// 	.agilex_hps_h2f_cs_tdo                                               					 (),    
// 	.agilex_hps_h2f_cs_tdoen                                             					 (),  
// 	.agilex_hps_h2f_cs_tms                                               					 (1'b1),    
// 	.emif_hps_pll_ref_clk_clk                                            					 (emif_hps_pll_ref_clk),   
// 	.emif_hps_mem_mem_ck                                                 					 (emif_hps_mem_mem_ck),   
// 	.emif_hps_mem_mem_ck_n                                               					 (emif_hps_mem_mem_ck_n),  
// 	.emif_hps_mem_mem_a                                                  					 (emif_hps_mem_mem_a),       
// 	.emif_hps_mem_mem_act_n                                              					 (emif_hps_mem_mem_act_n),   
// 	.emif_hps_mem_mem_ba                                                 					 (emif_hps_mem_mem_ba),      
// 	.emif_hps_mem_mem_bg                                                 					 (emif_hps_mem_mem_bg),      
// 	.emif_hps_mem_mem_cke                                                					 (emif_hps_mem_mem_cke),    
// 	.emif_hps_mem_mem_cs_n                                               					 (emif_hps_mem_mem_cs_n),    
// 	.emif_hps_mem_mem_odt                                                					 (emif_hps_mem_mem_odt),     
// 	.emif_hps_mem_mem_reset_n                                            					 (emif_hps_mem_mem_reset_n),
// 	.emif_hps_mem_mem_par                                                					 (emif_hps_mem_mem_par),          
// 	.emif_hps_mem_mem_alert_n                                            					 (emif_hps_mem_mem_alert_n),    
// 	.emif_hps_mem_mem_dqs                                                					 (emif_hps_mem_mem_dqs),       
// 	.emif_hps_mem_mem_dqs_n                                              					 (emif_hps_mem_mem_dqs_n),     
// 	.emif_hps_mem_mem_dq                                                 					 (emif_hps_mem_mem_dq), 
// 	.emif_hps_mem_mem_dbi_n                                              					 (emif_hps_mem_mem_dbi_n), 
// 	.emif_hps_oct_oct_rzqin                                              					 (emif_hps_oct_oct_rzqin), 

// 	.hps_io_EMAC1_TX_CLK                                                 					 (hps_emac1_TX_CLK),     
// 	.hps_io_EMAC1_RX_CLK                                                 					 (hps_emac1_RX_CLK),     
// 	.hps_io_EMAC1_TX_CTL                                                 					 (hps_emac1_TX_CTL),    
// 	.hps_io_EMAC1_RX_CTL                                                 					 (hps_emac1_RX_CTL),    
// 	.hps_io_EMAC1_TXD0                                                   					 (hps_emac1_TXD0),     
// 	.hps_io_EMAC1_TXD1                                                   					 (hps_emac1_TXD1),
// 	.hps_io_EMAC1_RXD0                                                   					 (hps_emac1_RXD0),       
// 	.hps_io_EMAC1_RXD1                                                   					 (hps_emac1_RXD1),        
// 	.hps_io_EMAC1_TXD2                                                   					 (hps_emac1_TXD2),      
// 	.hps_io_EMAC1_TXD3                                                   					 (hps_emac1_TXD3),   
// 	.hps_io_EMAC1_RXD2                                                   					 (hps_emac1_RXD2),        
// 	.hps_io_EMAC1_RXD3                                                   					 (hps_emac1_RXD3),
// 	.hps_io_EMAC1_MDIO                                                   					 (hps_emac1_MDIO),       
// 	.hps_io_EMAC1_MDC                                                    					 (hps_emac1_MDC), 
// 	.hps_io_SDMMC_CCLK                                                   					 (hps_sdmmc_CCLK),   
// 	.hps_io_SDMMC_CMD                                                    					 (hps_sdmmc_CMD), 
// 	.hps_io_SDMMC_D0                                                     					 (hps_sdmmc_D0),          
// 	.hps_io_SDMMC_D1                                                     					 (hps_sdmmc_D1),          
// 	.hps_io_SDMMC_D2                                                     					 (hps_sdmmc_D2),         
// 	.hps_io_SDMMC_D3                                                     					 (hps_sdmmc_D3), 
// 	.hps_io_SDMMC_D4                                                     					 (hps_sdmmc_D4),
// 	.hps_io_SDMMC_D5                                                     					 (hps_sdmmc_D5), 
// 	.hps_io_SDMMC_D6                                                     					 (hps_sdmmc_D6), 
// 	.hps_io_SDMMC_D7                                                     					 (hps_sdmmc_D7),        
// 	.hps_io_I2C1_SDA           											 					 (hps_i2c1_SDA),     
// 	.hps_io_I2C1_SCL           											 					 (hps_i2c1_SCL),
// 	.hps_io_UART1_RX                                                     					 (hps_uart1_RX),          
// 	.hps_io_UART1_TX                                                     					 (hps_uart1_TX),
// 	.hps_io_gpio0_io11                                                    					 (hps_gpio0_io11),
// 	.hps_io_gpio0_io12                                                    					 (hps_gpio0_io12),
// 	.hps_io_gpio0_io13                                                    					 (hps_gpio0_io13),
// 	.hps_io_gpio0_io14                                                    					 (hps_gpio0_io14),
// 	.hps_io_gpio0_io15           										  					 (hps_gpio0_io15),
// 	.hps_io_gpio0_io16           										  					 (hps_gpio0_io16),
// 	.hps_io_gpio0_io17                                                    					 (hps_gpio0_io17),
// 	.hps_io_gpio0_io18                                                    					 (hps_gpio0_io18),
// 	.hps_io_gpio1_io16                                                    					 (hps_gpio1_io16),
// 	.hps_io_gpio1_io17                                                    					 (hps_gpio1_io17),
// 	.hps_io_SPIM0_CLK                                                     					 (hps_spim0_clk ),      //   input  wire                   .ss_in_n
// 	.hps_io_SPIM0_MOSI                                                    					 (hps_spim0_mosi_o),    //   output wire   agilex_hps_spim1.mosi_o
// 	.hps_io_SPIM0_MISO                                                    					 (hps_spim0_miso_i),    //   input  wire                   .miso_i
// 	.hps_io_SPIM0_SS0_N                                                   					 (hps_spim0_ss0_n),     //   output wire                   .ss0_n_o
// 	.hps_io_SPIM1_CLK                                                     					 (hps_spim1_clk),       //   input  wire                   .ss_in_n
// 	.hps_io_SPIM1_MOSI                                                    					 (hps_spim1_mosi_o),    //   output wire   agilex_hps_spim1.mosi_o
// 	.hps_io_SPIM1_MISO                                                    					 (hps_spim1_miso_i),    //   input  wire                   .miso_i
// 	.hps_io_SPIM1_SS0_N                                                   					 (hps_spim1_ss0_n),     //   output wire                   .ss0_n_o
// 	.hps_io_SPIM1_SS1_N                                                   					 (hps_spim1_ss1_n), 
					
// 	.hssi_ss_1_subsystem_cold_rst_n_reset_n                               					 (hssi_cold_boot_reg),   //                         hssi_ss_1_subsystem_cold_rst_n.reset_n
// 	.hssi_ss_1_i_p0_rx_rst_n_reset_n                                      					 (hssi_rx_rst_n),        //                                hssi_ss_1_i_p8_rx_rst_n.reset_n
// 	.hssi_ss_1_i_p0_tx_rst_n_reset_n                                      					 (hssi_tx_rst_n),        //                                hssi_ss_1_i_p8_tx_rst_n.reset_n
// 	.hssi_ss_1_p0_axi_st_rx_reset_reset_n                                 					 (hssi_rx_rst_n),        //                           hssi_ss_1_p8_axi_st_rx_reset.reset_n
// 	.hssi_ss_1_p0_axi_st_tx_reset_reset_n                                 					 (hssi_tx_rst_n),        //                           hssi_ss_1_p8_axi_st_tx_reset.reset_n

// 	.hssi_ss_1_subsystem_cold_rst_ack_n_reset_n                            					 (status_vector[0]),     //                     hssi_ss_1_subsystem_cold_rst_ack_n.reset_n
// 	.hssi_ss_1_o_p0_rx_rst_ack_n_reset_n                                   					 (status_vector[1]),     //                            hssi_ss_1_o_p8_rx_rst_ack_n.reset_n
// 	.hssi_ss_1_o_p0_tx_rst_ack_n_reset_n                                   					 (status_vector[2]),     //                            hssi_ss_1_o_p8_tx_rst_ack_n.reset_n
// 	.hssi_ss_1_p0_misc_interface_p0_tx_lanes_stable                        					 (status_vector[3]),     //                            hssi_ss_1_p8_misc_interface.p8_tx_lanes_stable
// 	.hssi_ss_1_p0_misc_interface_o_p0_tx_pll_locked                        					 (status_vector[4]),     //                                                       .o_p8_tx_pll_locked
// 	.hssi_ss_1_p0_misc_interface_p0_rx_pcs_ready                           					 (status_vector[5]),     //                                                       .p8_rx_pcs_ready
// 	.hssi_ss_1_p0_tx_ptp_ready_o_p0_tx_ptp_ready                           					 (status_vector[6]),     //                              hssi_ss_1_p8_tx_ptp_ready.o_p8_tx_ptp_ready
// 	.hssi_ss_1_p0_rx_ptp_ready_o_p0_rx_ptp_ready                           					 (status_vector[7]),     //                              hssi_ss_1_p8_rx_ptp_ready.o_p8_rx_ptp_ready
// 	//.hssi_ss_1_p0_ptp_offset_data_valid_o_p0_rx_ptp_offset_data_valid      					 (status_vector[8]),     //            hssi_ss_1_p8_ptp_offset_data_valid.o_p8_rx_ptp_offset_data_valid
// 	//.hssi_ss_1_p0_ptp_offset_data_valid_o_p0_tx_ptp_offset_data_valid      					 (status_vector[9]),     //                                              .o_p8_tx_ptp_offset_data_valid
	
	
// 	.hssi_ss_1_p0_axi_st_tx_interface_tvalid          										 (p0_axi_st_tx_interface_tvalid  ),     //   input,    width = 1,                        
// 	.hssi_ss_1_p0_axi_st_tx_interface_tready          										 (p0_axi_st_tx_interface_tready  ),     //  output,    width = 1,                        
// 	.hssi_ss_1_p0_axi_st_tx_interface_tdata           										 (p0_axi_st_tx_interface_tdata   ),     //   input,   width = 64,                        
// 	.hssi_ss_1_p0_axi_st_tx_interface_tkeep           										 (p0_axi_st_tx_interface_tkeep   ),     //   input,    width = 8,                        
// 	.hssi_ss_1_p0_axi_st_tx_interface_tlast           										 (p0_axi_st_tx_interface_tlast   ),     //   input,    width = 1,                        
// 	.hssi_ss_1_p0_axi_st_tx_interface_tuser           										 (p0_axi_st_tx_interface_tuser   ),     //   input,    width = 2, 
	
// 	.avst_axist_bridge_0_axit_tx_if_tready      											 (p0_axi_st_tx_interface_tready),       //   input,    width = 1,                                              avst_axist_bridge_0_axit_tx_if.tready
// 	.avst_axist_bridge_0_axit_tx_if_tvalid      											 (p0_axi_st_tx_interface_tvalid),       //  output,    width = 1,                                                                            .tvalid
// 	.avst_axist_bridge_0_axit_tx_if_tdata       											 (p0_axi_st_tx_interface_tdata ),       //  output,   width = 64,                                                                            .tdata
// 	.avst_axist_bridge_0_axit_tx_if_tlast       											 (p0_axi_st_tx_interface_tlast ),       //  output,    width = 1,                                                                            .tlast
// 	.avst_axist_bridge_0_axit_tx_if_tkeep       											 (p0_axi_st_tx_interface_tkeep ),       //  output,    width = 8,                                                                            .tkeep
// 	.avst_axist_bridge_0_axit_tx_if_tuser       											 (p0_axi_st_tx_interface_tuser ),


//     .hssi_ss_1_p0_tx_flow_control_interface_i_p0_tx_pause                      				 (),                                                   
//     .hssi_ss_1_p0_tx_flow_control_interface_i_p0_tx_pfc                        				 (8'd0),              
//     //.hssi_ss_1_p0_axi_st_tx_tuser_last_seg_interface_tx_last_segment           				 (p0_axi_st_tx_interface_tlast),              
//     .hssi_ss_1_o_p0_clk_rec_div_clk						                       				 (hssi_cdr_clk_out[0]),

//     .dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_valid       (port8_tx_dma_fifo_0_out_ts_req_valid),        
//     .dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_fingerprint (port8_tx_dma_fifo_0_out_ts_req_fingerprint),  
    
//     .dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_valid            (ptp_ets_valid),           			   //   input,    width = 1,       dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts.valid
//     .dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_fingerprint      ({ptp_ets_fp}),            			   //   input,   width = 20,                                                                             .fingerprint
//     .dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_data             (ptp_ets),
 
//     .mtod_subsys_master_tod_top_0_i_upstr_pll_lock               							 ('b1),                            
//     .tod_slave_subsys_port_8_tod_stack_tx_pll_locked_lock                    				 (status_vector[4]),                       // input to port_tod_stack
//    // .tod_slave_subsys_oran_tod_stack_tx_pll_locked_lock      								 (status_vector[4]),                       //   input,    width = 1,                               tod_slave_subsys_oran_tod_stack_tx_pll_locked.lock
//     .ftile_debug_status_econ_export                                          				 (ftile_debug_status),
//     .f2h_irq1_irq                                      										 (f2h_irq1_irq),
//     .hps_io_hps_osc_clk                                										 (hps_ref_clk),
//     .agilex_hps_h2f_reset_reset                        										 (h2f_reset),
//     .reset_reset_n                                     										 (system_reset_n),
//     .dma_subsys_port0_rx_dma_resetn_reset_n            										 (system_reset_n),
//     .dma_subsys_port1_rx_dma_resetn_reset_n            										 (system_reset_n),
//     .dma_subsys_ninit_done_reset                       										 (ninit_done),
//     .phipps_peak_0_rx_pcs_ready_rx_pcs_ready           										 (status_vector[5]),
//     .phipps_peak_0_tx_lanes_stable_tx_lanes_stable     										 (status_vector[3]),

//     .duc_avst_source_duc_avst_source_valid            										 (dl_avst_source_valid			),   //  output,    width = 1,     dl_avst_source_valid.data
// 	.duc_avst_source_duc_avst_source_data0            										 (dl_avst_source_data_l0		),   //  output,   width = 32,     dl_avst_source_data_l0.data
// 	.duc_avst_source_duc_avst_source_data1            										 (dl_avst_source_data_l1		),   //  output,   width = 32,     dl_avst_source_data_l1.data
// 	.duc_avst_source_duc_avst_source_data2            										 (dl_avst_source_data_l2		),   //  output,   width = 32,     dl_avst_source_data_l2.data
// 	.duc_avst_source_duc_avst_source_data3            										 (dl_avst_source_data_l3		),   //  output,   width = 32,     dl_avst_source_data_l3.data
// 	.duc_avst_source_duc_avst_source_data4            										 (dl_avst_source_data_l4		),   //  output,   width = 32,     dl_avst_source_data_l4.data
// 	.duc_avst_source_duc_avst_source_data5            										 (dl_avst_source_data_l5		),   //  output,   width = 32,     dl_avst_source_data_l5.data
// 	.duc_avst_source_duc_avst_source_data6            										 (dl_avst_source_data_l6		),   //  output,   width = 32,     dl_avst_source_data_l6.data
// 	.duc_avst_source_duc_avst_source_data7            										 (dl_avst_source_data_l7		),   //  output,   width = 32,     dl_avst_source_data_l7.data
// 	.ddc_avst_sink_avst_sink_valid                                                           (ul_avst_sink_valid			),     //   input,    width = 1,       ul_avst_source_valid.data
// 	.ddc_avst_sink_avst_sink_data_l1                                                         (ul_avst_sink_data_l0		),   //   input,   width = 32,     ul_avst_source_data_l0.data
// 	.ddc_avst_sink_avst_sink_data_l2                                                         (ul_avst_sink_data_l1		),   //   input,   width = 32,     ul_avst_source_data_l1.data
// 	.ddc_avst_sink_avst_sink_data_l3                                                         (ul_avst_sink_data_l2		),   //   input,   width = 32,     ul_avst_source_data_l2.data
// 	.ddc_avst_sink_avst_sink_data_l4                                                         (ul_avst_sink_data_l3		),   //   input,   width = 32,     ul_avst_source_data_l3.data
// 	.ddc_avst_sink_avst_sink_data_l5                                                         (ul_avst_sink_data_l4		),   //   input,   width = 32,     ul_avst_source_data_l4.data
// 	.ddc_avst_sink_avst_sink_data_l6                                                         (ul_avst_sink_data_l5		),   //   input,   width = 32,     ul_avst_source_data_l5.data
// 	.ddc_avst_sink_avst_sink_data_l7                                                         (ul_avst_sink_data_l6		),   //   input,   width = 32,     ul_avst_source_data_l6.data
// 	.ddc_avst_sink_avst_sink_data_l8                                                         (ul_avst_sink_data_l7		),
	
// 	/*.ddc_avst_sink_avst_sink_valid                    										 (ul_avst_sink_valid			),   //   input,    width = 1,       ul_avst_source_valid.data
// 	.ddc_avst_sink_avst_sink_data_l1                  										 (ul_avst_sink_data[31:0]		),   //   input,   width = 32,     ul_avst_source_data_l0.data
// 	.ddc_avst_sink_avst_sink_data_l2                  										 (ul_avst_sink_data[63:32]),         //   input,   width = 32,     ul_avst_source_data_l1.data
// 	.ddc_avst_sink_avst_sink_data_l3                  										 (ul_avst_sink_data[95:64]),         //   input,   width = 32,     ul_avst_source_data_l2.data
// 	.ddc_avst_sink_avst_sink_data_l4                  										 (ul_avst_sink_data[127:96]),        //   input,   width = 32,     ul_avst_source_data_l3.data
// 	.ddc_avst_sink_avst_sink_data_l5                  										 (32'd0		),                       //   input,   width = 32,     ul_avst_source_data_l4.data
// 	.ddc_avst_sink_avst_sink_data_l6                  										 (32'd0		),                       //   input,   width = 32,     ul_avst_source_data_l5.data
// 	.ddc_avst_sink_avst_sink_data_l7                  										 (32'd0		),                       //   input,   width = 32,     ul_avst_source_data_l6.data
// 	.ddc_avst_sink_avst_sink_data_l8                  										 (32'd0		),	                     //   input,   width = 32,      ul_avst_source_data_l7.data */

//     .ptp_tod_concat_out_o_mac_ptp_fp                  										 (mac_ptp_fp),              		 //  output,    width = 22,                                  ob_core_0_time_of_day.o_mac_ptp_fp
//     .ptp_tod_concat_out_o_mac_ptp_ts_req              										 (mac_ptp_ts_req),          		 //  output,    width = 1,                                                        .o_mac_ptp_ts_req
//     .ptp_tod_concat_out_i_mac_ptp_tx_ets_valid        										 (tx_egrs0_interface_tvalid),		 //(mac_ptp_ets_valid),        //   input,    width = 1,                          .i_mac_ptp_tx_ets_valid
//     .ptp_tod_concat_out_i_mac_ptp_tx_ets              										 (tx_egrs0_interface_data[95:0]),	 //(mac_ptp_ets),              //   input,   width = 96,                          .i_mac_ptp_tx_ets
//     .ptp_tod_concat_out_i_mac_ptp_tx_ets_fp           										 (tx_egrs0_interface_data[117:96]),  //(mac_ptp_ets_fp),          //   input,    width = 22,                          .i_mac_ptp_tx_ets_fp

// 	.ptp_tod_concat_out_i_mac_ptp_rx_its_valid        										 (mac_ptp_rx_its_valid),
// 	.ptp_tod_concat_out_i_mac_ptp_rx_its              										 (mac_ptp_rx_its),          		//   input,   width = 96,                                                       .i_mac_ptp_rx_its
// 	.ptp_tod_concat_out_i_ext_ptp_ts_req              										 (port8_tx_dma_fifo_0_out_ts_req_valid), 
// 	.ptp_tod_concat_out_i_ext_ptp_fp                  										 (port8_tx_dma_fifo_0_out_ts_req_fingerprint),      //   input,    width = 20,   .i_ext_ptp_fp
// 	.ptp_tod_concat_out_o_ext_ptp_tx_ets_valid        										 (ptp_ets_valid),           		//  output,    width = 1,                    .o_ext_ptp_tx_ets_valid
// 	.ptp_tod_concat_out_o_ext_ptp_tx_ets              										 (ptp_ets),                 		//  output,   width = 96,                    .o_ext_ptp_tx_ets
// 	.ptp_tod_concat_out_o_ext_ptp_tx_ets_fp           										 (ptp_ets_fp),              		//  output,    width = 20,                   .o_ext_ptp_tx_ets_fp
// 	.ptp_tod_concat_out_o_ext_ptp_rx_its              										 (ptp_rx_its),              		//  output,   width = 96,                    .o_ext_ptp_rx_its
// 	.ptp_tod_concat_out_o_ext_ptp_rx_its_valid        										 (ptp_rx_its_valid),        		//  output,   width =  1, 

// 	.hssi_ss_1_p0_axi_st_tx_egrs0_interface_tvalid    										 (tx_egrs0_interface_tvalid),       //  output,    width = 1,                                       hssi_ss_1_p0_axi_st_tx_egrs0_interface.tvalid
//     .hssi_ss_1_p0_axi_st_tx_egrs0_interface_tdata     										 (tx_egrs0_interface_data),
// 	.dma_subsys_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_valid 			 (ptp_rx_its_valid),                //   input,    width = 1,       dma_subsys_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts.valid
// 	.dma_subsys_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_data  			 (ptp_rx_its), 
   
// 	.avst_rx_ptp_o_av_st_rxstatus_data            											 (),                                //  output,   width = 40,       avst_rx_ptp.o_av_st_rxstatus_data
// 	.avst_rx_ptp_o_av_st_rxstatus_valid           											 (mac_ptp_rx_its_valid),            //  output,    width = 1,                  .o_av_st_rxstatus_valid
// 	.avst_rx_ptp_o_av_st_ptp_rx_its               											 (mac_ptp_rx_its),
	
	
// 	.avst_tx_ptp_i_av_st_tx_skip_crc               											 ('d0),                    //   input,    width = 1,       avst_tx_ptp.i_av_st_tx_skip_crc
//     .avst_tx_ptp_i_av_st_tx_ptp_ts_valid           											 ('d0),                    //   input,    width = 2,                  .i_av_st_tx_ptp_ts_valid
//   //.avst_tx_ptp_i_av_st_tx_ptp_ts_req             											 (mac_ptp_ts_req_out),   //   input,    width = 1,                  .i_av_st_tx_ptp_ts_req
//     .avst_tx_ptp_i_av_st_tx_ptp_ins_ets            											 ('d0),                    //   input,    width = 1,                  .i_av_st_tx_ptp_ins_ets
//   //.avst_tx_ptp_i_av_st_tx_ptp_fp                 											 ({10'b0,mac_ptp_fp_out}),  //   input,   width = 32,               .i_av_st_tx_ptp_fp
//     .avst_tx_ptp_i_av_st_tx_ptp_ins_cf             											 ('d0),                    //   input,    width = 1,                  .i_av_st_tx_ptp_ins_cf
//     .avst_tx_ptp_i_av_st_tx_ptp_tx_its             											 ('d0),                    //   input,   width = 96,                  .i_av_st_tx_ptp_tx_its
//     .avst_tx_ptp_i_av_st_tx_ptp_asym_p2p_idx       											 ('d0),                    //   input,    width = 7,                  .i_av_st_tx_ptp_asym_p2p_idx
//     .avst_tx_ptp_i_av_st_tx_ptp_asym_sign          											 ('d0),                    //   input,    width = 1,                  .i_av_st_tx_ptp_asym_sign
//     .avst_tx_ptp_i_av_st_tx_ptp_asym               											 ('d0),                    //   input,    width = 1,                  .i_av_st_tx_ptp_asym
//     .avst_tx_ptp_i_av_st_tx_ptp_p2p                											 ('d0),                    //   input,    width = 1,                  .i_av_st_tx_ptp_p2p
//     .avst_tx_ptp_i_av_st_tx_ptp_ts_format          											 ('d0),                    //   input,    width = 1,                  .i_av_st_tx_ptp_ts_format
//     .avst_tx_ptp_i_av_st_tx_ptp_update_eb          											 ('d0),                    //   input,    width = 1,                  .i_av_st_tx_ptp_update_eb
//     .avst_tx_ptp_i_av_st_tx_ptp_zero_csum          											 ('d0),                    //   input,    width = 1,                  .i_av_st_tx_ptp_zero_csum
//     .avst_tx_ptp_i_av_st_tx_ptp_eb_offset          											 ('d0),                    //   input,   width = 16,                  .i_av_st_tx_ptp_eb_offset
//     .avst_tx_ptp_i_av_st_tx_ptp_csum_offset        											 ('d0),                    //   input,   width = 16,                  .i_av_st_tx_ptp_csum_offset
//     .avst_tx_ptp_i_av_st_tx_ptp_cf_offset          											 ('d0),                    //   input,   width = 16,                  .i_av_st_tx_ptp_cf_offset
//     .avst_tx_ptp_i_av_st_tx_ptp_ts_offset          											 ('d0),
	 
// 	.hssi_ss_1_p0_rx_tuser_status_tuser_1              										 (p0_rx_tuser_status_tuser_1  ) ,

// 	.axist_rx_user_i_axi_st_rx_tuser_sts               										 (p0_rx_tuser_status_tuser_1),       //   input,    width = 5, axist_rx_user.i_axi_st_rx_tuser_sts
//     .axist_rx_user_i_axi_st_rx_tuser_sts_extended      										 (),                                 //   input,   width = 32,  			.i_axi_st_rx_tuser_sts_extended
//     .axist_rx_user_i_axi_st_rx_ingrts0_tdata           										 (i_axi_st_rx_ingrts0_tdata ),       //   input,   width = 96,  			.i_axi_st_rx_ingrts0_tdata
//     .axist_rx_user_i_axi_st_rx_ingrts0_tvalid          										 (i_axi_st_rx_ingrts0_tvalid ),

// 	.hssi_ss_1_p0_axi_st_rx_ingrs0_interface_tvalid    										 (i_axi_st_rx_ingrts0_tvalid),        //  output,    width = 1, hssi_ss_1_p0_axi_st_rx_ingrs0_interface.tvalid
//     .hssi_ss_1_p0_axi_st_rx_ingrs0_interface_tdata     										 (i_axi_st_rx_ingrts0_tdata),
// 	.axist_tx_user_o_axi_st_tx_tuser_ptp               										 (o_axi_st_tx_tuser_ptp ),            //  output,   width = 94,  axist_tx_user.o_axi_st_tx_tuser_ptp
//     .axist_tx_user_o_axi_st_tx_tuser_ptp_extended      										 (o_axi_st_tx_tuser_ptp_extended ),
// 	.hssi_ss_1_p0_tx_tuser_ptp_tuser_1                 										 (o_axi_st_tx_tuser_ptp),             //   input,   width = 94,  hssi_ss_1_p0_tx_tuser_ptp.tuser_1
//     .hssi_ss_1_p0_tx_tuser_ptp_extended_tuser_2        										 (o_axi_st_tx_tuser_ptp_extended),
	
// 	.tod_timestamp_96b_0_pps_in_pps_in             											 (ref_pps_in) ,
// 	.dfd_subsystem_clock_bridge_dspby2_in_clk_clk  											 (clk_dspby2),

// 	.ftile_out_clk_clk																		 (ftile_clk) ,

//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_tx_rst_ack_n_export                             (jesd_tx_ack_rst_n),                 //  output,    width = 1,                        j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_tx_rst_ack_n.export
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rx_rst_ack_n_export                             (jesd_rx_ack_rst_n),                 //  output,    width = 1,                        j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_tx_rst_ack_n.export
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_txlclk_ctrl_export                              (1'b1),                              //   input,    width = 1,                         j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_txlclk_ctrl.export
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_txfclk_ctrl_export                              (1'b1),                              //   input,    width = 1,                         j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_txfclk_ctrl.export
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_tx_avst_data                                    (tx_arranged_data),                  //   input,  width = 512,                             j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_tx_avst.data
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_tx_avst_valid                                   (tx_jesd_avst_valid),                //   input,    width = 1,                                                                            .valid
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_tx_avst_ready                                   (tx_jesd_avst_ready),                //  output,    width = 1,                                                                            .ready
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_tx_cmd_data                                     (24'd0),                             //   input,   width = 48,                              j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_tx_cmd.data
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_tx_cmd_valid                                    (),                                  //   input,    width = 1,                                                                            .valid
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_tx_cmd_ready                                    (),                                  //  output,    width = 1,                                                                            .ready
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_tx_sysref_export                                (sysref),                            //   input,    width = 1,                           j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_tx_sysref.export

//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rxlclk_ctrl_export                              (1'b1),                              //   input,    width = 1,                         j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rxlclk_ctrl.export
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rxfclk_ctrl_export                              (1'b1),                              //   input,    width = 1,                         j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rxfclk_ctrl.export
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rx_sysref_export                                (sysref),                            //   input,    width = 1,                           j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rx_sysref.export
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rx_avst_data                                    (rx_jesd_avst_data),                 //  output,  width = 512,                             j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rx_avst.data
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rx_avst_valid                                   (rx_jesd_avst_valid),                //  output,    width = 1,                                                                            .valid
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rx_avst_ready                                   (rx_jesd_avst_ready),                //   input,    width = 1,                                                                            .ready
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rx_cmd_data                                     (),                                  //  output,   width = 48,                              j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rx_cmd.data
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rx_cmd_valid                                    (),                                  //  output,    width = 1,                                                                            .valid
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_j204c_rx_cmd_ready                                    (1'b1),                              //   input,    width = 1,                                                                            .ready
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_tx_serial_data_export                                 (jesd_tx_serial),                    //  output,    width = 8,                            j204c_f_rx_tx_ip_intel_jesd204c_f_tx_serial_data.export
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_tx_serial_data_n_export                               (jesd_tx_serial_n),                  //  output,    width = 8,                          j204c_f_rx_tx_ip_intel_jesd204c_f_tx_serial_data_n.export
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_rx_serial_data_export                                 (jesd_rx_serial),                    //   input,    width = 8,                            j204c_f_rx_tx_ip_intel_jesd204c_f_rx_serial_data.export
//     //.j204c_f_rx_tx_ip_intel_jesd204c_f_rx_serial_data_n_export                               (jesd_rx_serial_n),                  //   input,    width = 8,                          j204c_f_rx_tx_ip_intel_jesd204c_f_rx_serial_data_n.export
//     //.j204c_f_rx_tx_ip_jesd_link_clk_in_clk_clk                                               (jesd_link_clk),                     //   input,    width = 1,                                       j204c_f_rx_tx_ip_jesd_link_clk_in_clk.clk
//     //.j204c_f_rx_tx_ip_reset_out1_reset                                                       (),                                  //  output,    width = 1,                                                 j204c_f_rx_tx_ip_reset_out1.reset
//     //.j204c_f_rx_tx_ip_reset_out2_reset                                                       (jesd_tx_rst),                       //  output,    width = 1,                                                 j204c_f_rx_tx_ip_reset_out2.reset
//     //.j204c_f_rx_tx_ip_reset_out4_reset                                                       (jesd_rx_rst),                       //  output,    width = 1,                                                 j204c_f_rx_tx_ip_reset_out4.reset
//    //.j204c_f_rx_tx_ip_reset1_dsrt_qual_reset1_dsrt_qual                                      (jesd_core_pll_lock_r),              //   input,    width = 1,                                           j204c_f_rx_tx_ip_reset1_dsrt_qual.reset1_dsrt_qual
//     //.j204c_f_rx_tx_ip_reset2_dsrt_qual_reset2_dsrt_qual                                      (~jesd_tx_ack_rst_n),                //   input,    width = 1,                                           j204c_f_rx_tx_ip_reset2_dsrt_qual.reset2_dsrt_qual
//     //.j204c_f_rx_tx_ip_reset4_dsrt_qual_reset4_dsrt_qual                                      (~jesd_rx_ack_rst_n),                //   input,    width = 1,                                           j204c_f_rx_tx_ip_reset4_dsrt_qual.reset4_dsrt_qual
//     //.j204c_f_rx_tx_ip_systemclk_f_refclk_fgt_in_refclk_fgt_0     		                     (jesd_xcvr_clk),
// 	.phipps_peak_0_lphy_ss_top_0_lphy_ss_top_duc_ddc_lpbk_en_data							 (dfe_lpbk)
// );	     

       

//-------------------- Qsys Top module (E-tile) -------------------
(*preserve*) logic sampling_tod_clk;
qsys_top  #(
  .FP_WIDTH  (FP_WIDTH)
)
soc_inst
(
	// Common System Clocks and Resets
	.clk_csr_in_clk_clk                              										 (system_clk_100_internal),
	.clk_dsp_in_clk_clk                              										 (clk_dsp),
	.rst_csr_in_reset_reset_n                        										 (system_reset_n),
	.rst_dsp_in_reset_reset                          										 ((~system_reset_n) & iopll_491_locked),
	.rst_eth_in_reset_reset                          										 ((~system_reset_n)),
	.clk_100_clk                                     										 (system_clk_100_internal),
	.rst_csr_act_high_in_reset_reset                 										 (system_reset_n),
	.reset_reset_n                                   										 (system_reset_n),
	.ninit_done_ninit_done                           										 (ninit_done),
	
	// PIO Connections
	.led_pio_external_connection_in_port             										 (fpga_led_internal),
	.led_pio_external_connection_out_port            										 (fpga_led_internal),
	.dipsw_pio_external_connection_export            										 (fpga_dipsw_pio),
	.button_pio_external_connection_export           										 (fpga_debounced_buttons),
	.qsfpdd_status_pio_external_connection_export    										 (qsfpdd_status_pio),
	.qsfpdd_ctrl_pio_0_econ_export                   										 (qsfpdd_spi_ctrl_pio),

	// HSSI Serial Interface - Port 0
	.hssi_ss_1_p0_tx_srl_interface_p0_tx_serial      										 (ftile_tx_serial[0]),
	.hssi_ss_1_p0_tx_srl_interface_p0_tx_serial_n    										 (ftile_tx_serial_n[0]),
	.hssi_ss_1_p0_rx_srl_interface_p0_rx_serial      										 (ftile_rx_serial[0]),
	.hssi_ss_1_p0_rx_srl_interface_p0_rx_serial_n    										 (ftile_rx_serial_n[0]),
	
	// HSSI Serial Interface - Port 1
	.hssi_ss_1_p1_tx_srl_interface_p1_tx_serial      										 (ftile_tx_serial[1]),
	.hssi_ss_1_p1_tx_srl_interface_p1_tx_serial_n    										 (ftile_tx_serial_n[1]),
	.hssi_ss_1_p1_rx_srl_interface_p1_rx_serial      										 (ftile_rx_serial[1]),
	.hssi_ss_1_p1_rx_srl_interface_p1_rx_serial_n    										 (ftile_rx_serial_n[1]),
	
	// HSSI Serial Interface - Port 2
	.hssi_ss_1_p2_rx_srl_interface_p2_rx_serial      										 (ftile_rx_serial[2]),
	.hssi_ss_1_p2_rx_srl_interface_p2_rx_serial_n    										 (ftile_rx_serial_n[2]),
	
	// HSSI Serial Interface - Port 3
	.hssi_ss_1_p3_rx_srl_interface_p3_rx_serial      										 (ftile_rx_serial[3]),
	.hssi_ss_1_p3_rx_srl_interface_p3_rx_serial_n    										 (ftile_rx_serial_n[3]),
	
	// HSSI Reference Clock
	.hssi_ss_1_i_clk_ref_clk                         										 (ftile_clk_ref),
	
	// HSSI Subsystem Resets
	.hssi_ss_1_subsystem_cold_rst_n_reset_n          										 (hssi_cold_boot_reg),
	.hssi_ss_1_subsystem_cold_rst_ack_n_reset_n      										 (status_vector[0]),
	
	// HSSI Port 0 Resets
	.hssi_ss_1_i_p0_rx_rst_n_reset_n                 										 (hssi_rx_rst_n),
	.hssi_ss_1_i_p0_tx_rst_n_reset_n                 										 (hssi_tx_rst_n),
	.hssi_ss_1_o_p0_rx_rst_ack_n_reset_n             										 (status_vector[1]),
	.hssi_ss_1_o_p0_tx_rst_ack_n_reset_n             										 (status_vector[2]),
	
	// HSSI Port 1 Resets
	.hssi_ss_1_i_p1_rx_rst_n_reset_n                 										 (hssi_rx_rst_n),
	.hssi_ss_1_i_p1_tx_rst_n_reset_n                 										 (hssi_tx_rst_n),
	.hssi_ss_1_o_p1_rx_rst_ack_n_reset_n             										 (),
	.hssi_ss_1_o_p1_tx_rst_ack_n_reset_n             										 (),
	
	// HSSI Port 2 Resets
	.hssi_ss_1_i_p2_rx_rst_n_reset_n                 										 (hssi_rx_rst_n),
	.hssi_ss_1_i_p2_tx_rst_n_reset_n                 										 (hssi_tx_rst_n),
	
	// HSSI Port 3 Resets
	.hssi_ss_1_i_p3_rx_rst_n_reset_n                 										 (hssi_rx_rst_n),
	.hssi_ss_1_i_p3_tx_rst_n_reset_n                 										 (hssi_tx_rst_n),
	
	// HSSI Port 0 TX AXI Stream Interface
	.hssi_ss_1_p0_axi_st_tx_reset_reset_n            										 (hssi_tx_rst_n),
	.hssi_ss_1_p0_axi_st_tx_interface_tvalid         										 (p0_axi_st_tx_interface_tvalid),
	.hssi_ss_1_p0_axi_st_tx_interface_tready         										 (p0_axi_st_tx_interface_tready),
	.hssi_ss_1_p0_axi_st_tx_interface_tdata          										 (p0_axi_st_tx_interface_tdata),
	.hssi_ss_1_p0_axi_st_tx_interface_tkeep          										 (p0_axi_st_tx_interface_tkeep),
	.hssi_ss_1_p0_axi_st_tx_interface_tlast          										 (p0_axi_st_tx_interface_tlast),
	.hssi_ss_1_p0_axi_st_tx_interface_tuser          										 (p0_axi_st_tx_interface_tuser),
	.hssi_ss_1_p0_tx_tuser_ptp_tuser_1               										 (o_axi_st_tx_tuser_ptp),
	.hssi_ss_1_p0_tx_tuser_ptp_extended_tuser_2      										 (o_axi_st_tx_tuser_ptp_extended),
	
	// HSSI Port 1 TX AXI Stream Interface
	.hssi_ss_1_p1_axi_st_tx_reset_reset_n            										 (hssi_tx_rst_n),
	.hssi_ss_1_p1_axi_st_tx_interface_tvalid         										 (1'b0),
	.hssi_ss_1_p1_axi_st_tx_interface_tready         										 (),
	.hssi_ss_1_p1_axi_st_tx_interface_tdata          										 (64'd0),
	.hssi_ss_1_p1_axi_st_tx_interface_tkeep          										 (8'd0),
	.hssi_ss_1_p1_axi_st_tx_interface_tlast          										 (1'b0),
	.hssi_ss_1_p1_axi_st_tx_interface_tuser          										 (2'd0),
	.hssi_ss_1_p1_tx_tuser_ptp_tuser_1               										 (94'd0),
	.hssi_ss_1_p1_tx_tuser_ptp_extended_tuser_2      										 (328'd0),
	
	// HSSI Port 2 TX AXI Stream Interface
	.hssi_ss_1_p2_axi_st_tx_reset_reset_n            										 (hssi_tx_rst_n),
	.hssi_ss_1_p2_axi_st_tx_interface_tvalid         										 (1'b0),
	.hssi_ss_1_p2_axi_st_tx_interface_tready         										 (),
	.hssi_ss_1_p2_axi_st_tx_interface_tdata          										 (64'd0),
	.hssi_ss_1_p2_axi_st_tx_interface_tkeep          										 (8'd0),
	.hssi_ss_1_p2_axi_st_tx_interface_tlast          										 (1'b0),
	.hssi_ss_1_p2_axi_st_tx_interface_tuser          										 (2'd0),
	.hssi_ss_1_p2_tx_tuser_ptp_tuser_1               										 (94'd0),
	.hssi_ss_1_p2_tx_tuser_ptp_extended_tuser_2      										 (328'd0),
	
	// HSSI Port 3 TX AXI Stream Interface
	.hssi_ss_1_p3_axi_st_tx_reset_reset_n            										 (hssi_tx_rst_n),
	.hssi_ss_1_p3_axi_st_tx_interface_tvalid         										 (1'b0),
	.hssi_ss_1_p3_axi_st_tx_interface_tready         										 (),
	.hssi_ss_1_p3_axi_st_tx_interface_tdata          										 (64'd0),
	.hssi_ss_1_p3_axi_st_tx_interface_tkeep          										 (8'd0),
	.hssi_ss_1_p3_axi_st_tx_interface_tlast          										 (1'b0),
	.hssi_ss_1_p3_axi_st_tx_interface_tuser          										 (2'd0),
	.hssi_ss_1_p3_tx_tuser_ptp_tuser_1               										 (94'd0),
	.hssi_ss_1_p3_tx_tuser_ptp_extended_tuser_2      										 (328'd0),
	
	// HSSI Port 0 RX AXI Stream Interface
	.hssi_ss_1_p0_axi_st_rx_reset_reset_n            										 (hssi_rx_rst_n),
	.hssi_ss_1_p0_rx_tuser_status_tuser_1            										 (p0_rx_tuser_status_tuser_1),
	
	// HSSI Port 1 RX AXI Stream Interface
	.hssi_ss_1_p1_axi_st_rx_reset_reset_n            										 (hssi_rx_rst_n),
	.hssi_ss_1_p1_axi_st_rx_interface_tvalid         										 (),
	.hssi_ss_1_p1_axi_st_rx_interface_tdata          										 (),
	.hssi_ss_1_p1_axi_st_rx_interface_tkeep          										 (),
	.hssi_ss_1_p1_axi_st_rx_interface_tlast          										 (),
	.hssi_ss_1_p1_axi_st_rx_interface_tuser          										 (),
	
	// HSSI Port 2 RX AXI Stream Interface
	.hssi_ss_1_p2_axi_st_rx_reset_reset_n            										 (hssi_rx_rst_n),
	.hssi_ss_1_p2_axi_st_rx_interface_tvalid         										 (),
	.hssi_ss_1_p2_axi_st_rx_interface_tdata          										 (),
	.hssi_ss_1_p2_axi_st_rx_interface_tkeep          										 (),
	.hssi_ss_1_p2_axi_st_rx_interface_tlast          										 (),
	.hssi_ss_1_p2_axi_st_rx_interface_tuser          										 (),
	
	// HSSI Port 3 RX AXI Stream Interface
	.hssi_ss_1_p3_axi_st_rx_reset_reset_n            										 (hssi_rx_rst_n),
	.hssi_ss_1_p3_axi_st_rx_interface_tvalid         										 (),
	.hssi_ss_1_p3_axi_st_rx_interface_tdata          										 (),
	.hssi_ss_1_p3_axi_st_rx_interface_tkeep          										 (),
	.hssi_ss_1_p3_axi_st_rx_interface_tlast          										 (),
	.hssi_ss_1_p3_axi_st_rx_interface_tuser          										 (),
	// newly exported ports
	.hssi_ss_1_p0_axi_st_tx_ptp_interface_tvalid                                             (1'b1),                                             //   input,    width = 1,                                        hssi_ss_1_p0_axi_st_tx_ptp_interface.tvalid
	.hssi_ss_1_p0_axi_st_tx_ptp_interface_tdata                                              (master_tod_time_of_day_96b_synced_tod),                                              //   input,   width = 96,                                                                            .tdata

	// HSSI PTP Egress/Ingress Timestamps
	.hssi_ss_1_p0_axi_st_tx_egrs0_interface_tvalid   										 (tx_egrs0_interface_tvalid),
	.hssi_ss_1_p0_axi_st_tx_egrs0_interface_tdata    										 (tx_egrs0_interface_data),
	.hssi_ss_1_p0_axi_st_rx_ingrs0_interface_tvalid  										 (i_axi_st_rx_ingrts0_tvalid),
	.hssi_ss_1_p0_axi_st_rx_ingrs0_interface_tdata   										 (i_axi_st_rx_ingrts0_tdata),
	
	// HSSI Flow Control
	.hssi_ss_1_p0_tx_flow_control_interface_i_p0_tx_pause 									 (1'b0),
	.hssi_ss_1_p0_tx_flow_control_interface_i_p0_tx_pfc   									 (8'd0),
	.hssi_ss_1_p1_tx_flow_control_interface_i_p1_tx_pause 									 (1'b0),
	.hssi_ss_1_p1_tx_flow_control_interface_i_p1_tx_pfc   									 (8'd0),
	.hssi_ss_1_p2_tx_flow_control_interface_i_p2_tx_pause 									 (1'b0),
	.hssi_ss_1_p2_tx_flow_control_interface_i_p2_tx_pfc   									 (8'd0),
	.hssi_ss_1_p3_tx_flow_control_interface_i_p3_tx_pause 									 (1'b0),
	.hssi_ss_1_p3_tx_flow_control_interface_i_p3_tx_pfc   									 (8'd0),
	
	// HSSI Clock Recovery
	.hssi_ss_1_o_p0_clk_rec_div_clk                  										 (hssi_cdr_clk_out[0]),
	.ftile_out_clk_clk                               										 (ftile_clk),
	.ftile_debug_status_econ_export                  										 (ftile_debug_status),
	
	// AVST to AXIST Bridge for TX
	.avst_axist_bridge_0_axit_tx_if_tready           										 (p0_axi_st_tx_interface_tready),
	.avst_axist_bridge_0_axit_tx_if_tvalid           										 (p0_axi_st_tx_interface_tvalid),
	.avst_axist_bridge_0_axit_tx_if_tdata            										 (p0_axi_st_tx_interface_tdata),
	.avst_axist_bridge_0_axit_tx_if_tlast            										 (p0_axi_st_tx_interface_tlast),
	.avst_axist_bridge_0_axit_tx_if_tkeep            										 (p0_axi_st_tx_interface_tkeep),
	.avst_axist_bridge_0_axit_tx_if_tuser            										 (p0_axi_st_tx_interface_tuser),
	
	// AVST TX PTP
	.avst_tx_ptp_i_av_st_tx_skip_crc                 										 (1'b0),
	.avst_tx_ptp_i_av_st_tx_ptp_ts_valid             										 (2'd0),
	.avst_tx_ptp_i_av_st_tx_ptp_ins_ets              										 (1'b0),
	.avst_tx_ptp_i_av_st_tx_ptp_ins_cf               										 (1'b0),
	.avst_tx_ptp_i_av_st_tx_ptp_tx_its               										 (96'd0),
	.avst_tx_ptp_i_av_st_tx_ptp_asym_p2p_idx         										 (7'd0),
	.avst_tx_ptp_i_av_st_tx_ptp_asym_sign            										 (1'b0),
	.avst_tx_ptp_i_av_st_tx_ptp_asym                 										 (1'b0),
	.avst_tx_ptp_i_av_st_tx_ptp_p2p                  										 (1'b0),
	.avst_tx_ptp_i_av_st_tx_ptp_ts_format            										 (1'b0),
	.avst_tx_ptp_i_av_st_tx_ptp_update_eb            										 (1'b0),
	.avst_tx_ptp_i_av_st_tx_ptp_zero_csum            										 (1'b0),
	.avst_tx_ptp_i_av_st_tx_ptp_eb_offset            										 (16'd0),
	.avst_tx_ptp_i_av_st_tx_ptp_csum_offset          										 (16'd0),
	.avst_tx_ptp_i_av_st_tx_ptp_cf_offset            										 (16'd0),
	.avst_tx_ptp_i_av_st_tx_ptp_ts_offset            										 (16'd0),
	
	// AXIST TX User PTP
	.axist_tx_user_o_axi_st_tx_tuser_ptp             										 (o_axi_st_tx_tuser_ptp),
	.axist_tx_user_o_axi_st_tx_tuser_ptp_extended    										 (o_axi_st_tx_tuser_ptp_extended),
	
	// AVST RX PTP
	.avst_rx_ptp_o_av_st_rxstatus_data               										 (),
	.avst_rx_ptp_o_av_st_rxstatus_valid              										 (mac_ptp_rx_its_valid),
	.avst_rx_ptp_o_av_st_ptp_rx_its                  										 (mac_ptp_rx_its),
	
	// AXIST RX User PTP
	.axist_rx_user_i_axi_st_rx_tuser_sts             										 (p0_rx_tuser_status_tuser_1),
	.axist_rx_user_i_axi_st_rx_tuser_sts_extended    										 (32'd0),
	.axist_rx_user_i_axi_st_rx_ingrts0_tdata         										 (i_axi_st_rx_ingrts0_tdata),
	.axist_rx_user_i_axi_st_rx_ingrts0_tvalid        										 (i_axi_st_rx_ingrts0_tvalid),
	
	// PTP TOD Concatenation
	.ptp_tod_concat_out_o_mac_ptp_fp                 										 (mac_ptp_fp),
	.ptp_tod_concat_out_o_mac_ptp_ts_req             										 (mac_ptp_ts_req),
	.ptp_tod_concat_out_i_mac_ptp_tx_ets_valid       										 (tx_egrs0_interface_tvalid),
	.ptp_tod_concat_out_i_mac_ptp_tx_ets             										 (tx_egrs0_interface_data[95:0]),
	.ptp_tod_concat_out_i_mac_ptp_tx_ets_fp          										 (tx_egrs0_interface_data[117:96]),
	.ptp_tod_concat_out_i_mac_ptp_rx_its_valid       										 (mac_ptp_rx_its_valid),
	.ptp_tod_concat_out_i_mac_ptp_rx_its             										 (mac_ptp_rx_its),
	.ptp_tod_concat_out_i_ext_ptp_ts_req             										 (port8_tx_dma_fifo_0_out_ts_req_valid),
	.ptp_tod_concat_out_i_ext_ptp_fp                 										 (port8_tx_dma_fifo_0_out_ts_req_fingerprint),
	.ptp_tod_concat_out_o_ext_ptp_tx_ets_valid       										 (ptp_ets_valid),
	.ptp_tod_concat_out_o_ext_ptp_tx_ets             										 (ptp_ets),
	.ptp_tod_concat_out_o_ext_ptp_tx_ets_fp          										 (ptp_ets_fp),
	.ptp_tod_concat_out_o_ext_ptp_rx_its             										 (ptp_rx_its),
	.ptp_tod_concat_out_o_ext_ptp_rx_its_valid       										 (ptp_rx_its_valid),
	
	// DMA Subsystem
	.dma_subsys_ninit_done_reset                     										 (ninit_done),
	.dma_subsys_port0_rx_dma_resetn_reset_n          										 (system_reset_n),
	.dma_subsys_port1_rx_dma_resetn_reset_n          										 (system_reset_n),
	.dma_subsys_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_valid 			 (ptp_rx_its_valid),
	.dma_subsys_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_data  			 (ptp_rx_its),
	.ts_chs_compl_0_rst_bus_in_reset                 										 (hssi_pll_rst),
	.dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_valid 			 (ptp_ets_valid),
	.dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_fingerprint 	 (ptp_ets_fp),
	.dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_data 			 (ptp_ets),
	.dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_valid 	 (port8_tx_dma_fifo_0_out_ts_req_valid),
	.dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_fingerprint (port8_tx_dma_fifo_0_out_ts_req_fingerprint),
	
	// HPS STM Events
	.agilex_hps_f2h_stm_hw_events_stm_hwevents       										 (stm_hw_events),
	
	// HPS CoreSight JTAG (Terminated)
	.agilex_hps_h2f_cs_ntrst                         										 (1'b1),
	.agilex_hps_h2f_cs_tck                           										 (1'b1),
	.agilex_hps_h2f_cs_tdi                           										 (1'b1),
	.agilex_hps_h2f_cs_tdo                           										 (),
	.agilex_hps_h2f_cs_tdoen                         										 (),
	.agilex_hps_h2f_cs_tms                           										 (1'b1),
	
	// HPS EMIF
	.emif_hps_pll_ref_clk_clk                        										 (emif_hps_pll_ref_clk),
	.emif_hps_mem_mem_ck                             										 (emif_hps_mem_mem_ck),
	.emif_hps_mem_mem_ck_n                           										 (emif_hps_mem_mem_ck_n),
	.emif_hps_mem_mem_a                              										 (emif_hps_mem_mem_a),
	.emif_hps_mem_mem_act_n                          										 (emif_hps_mem_mem_act_n),
	.emif_hps_mem_mem_ba                             										 (emif_hps_mem_mem_ba),
	.emif_hps_mem_mem_bg                             										 (emif_hps_mem_mem_bg),
	.emif_hps_mem_mem_cke                            										 (emif_hps_mem_mem_cke),
	.emif_hps_mem_mem_cs_n                           										 (emif_hps_mem_mem_cs_n),
	.emif_hps_mem_mem_odt                            										 (emif_hps_mem_mem_odt),
	.emif_hps_mem_mem_reset_n                        										 (emif_hps_mem_mem_reset_n),
	.emif_hps_mem_mem_par                            										 (emif_hps_mem_mem_par),
	.emif_hps_mem_mem_alert_n                        										 (emif_hps_mem_mem_alert_n),
	.emif_hps_mem_mem_dqs                            										 (emif_hps_mem_mem_dqs),
	.emif_hps_mem_mem_dqs_n                          										 (emif_hps_mem_mem_dqs_n),
	.emif_hps_mem_mem_dq                             										 (emif_hps_mem_mem_dq),
	.emif_hps_mem_mem_dbi_n                          										 (emif_hps_mem_mem_dbi_n),
	.emif_hps_oct_oct_rzqin                          										 (emif_hps_oct_oct_rzqin),
	
	// HPS EMAC1
	.hps_io_EMAC1_TX_CLK                             										 (hps_emac1_TX_CLK),
	.hps_io_EMAC1_RX_CLK                             										 (hps_emac1_RX_CLK),
	.hps_io_EMAC1_TX_CTL                             										 (hps_emac1_TX_CTL),
	.hps_io_EMAC1_RX_CTL                             										 (hps_emac1_RX_CTL),
	.hps_io_EMAC1_TXD0                               										 (hps_emac1_TXD0),
	.hps_io_EMAC1_TXD1                               										 (hps_emac1_TXD1),
	.hps_io_EMAC1_RXD0                               										 (hps_emac1_RXD0),
	.hps_io_EMAC1_RXD1                               										 (hps_emac1_RXD1),
	.hps_io_EMAC1_TXD2                               										 (hps_emac1_TXD2),
	.hps_io_EMAC1_TXD3                               										 (hps_emac1_TXD3),
	.hps_io_EMAC1_RXD2                               										 (hps_emac1_RXD2),
	.hps_io_EMAC1_RXD3                               										 (hps_emac1_RXD3),
	.hps_io_EMAC1_MDIO                               										 (hps_emac1_MDIO),
	.hps_io_EMAC1_MDC                                										 (hps_emac1_MDC),
	
	// HPS SDMMC
	.hps_io_SDMMC_CCLK                               										 (hps_sdmmc_CCLK),
	.hps_io_SDMMC_CMD                                										 (hps_sdmmc_CMD),
	.hps_io_SDMMC_D0                                 										 (hps_sdmmc_D0),
	.hps_io_SDMMC_D1                                 										 (hps_sdmmc_D1),
	.hps_io_SDMMC_D2                                 										 (hps_sdmmc_D2),
	.hps_io_SDMMC_D3                                 										 (hps_sdmmc_D3),
	.hps_io_SDMMC_D4                                 										 (hps_sdmmc_D4),
	.hps_io_SDMMC_D5                                 										 (hps_sdmmc_D5),
	.hps_io_SDMMC_D6                                 										 (hps_sdmmc_D6),
	.hps_io_SDMMC_D7                                 										 (hps_sdmmc_D7),
	
	// HPS I2C1
	.hps_io_I2C1_SDA                                 										 (hps_i2c1_SDA),
	.hps_io_I2C1_SCL                                 										 (hps_i2c1_SCL),
	
	// HPS UART1
	.hps_io_UART1_RX                                 										 (hps_uart1_RX),
	.hps_io_UART1_TX                                 										 (hps_uart1_TX),
	
	// HPS GPIO
	.hps_io_gpio0_io11                               										 (hps_gpio0_io11),
	.hps_io_gpio0_io12                               										 (hps_gpio0_io12),
	.hps_io_gpio0_io13                               										 (hps_gpio0_io13),
	.hps_io_gpio0_io14                               										 (hps_gpio0_io14),
	.hps_io_gpio0_io15                               										 (hps_gpio0_io15),
	.hps_io_gpio0_io16                               										 (hps_gpio0_io16),
	.hps_io_gpio0_io17                               										 (hps_gpio0_io17),
	.hps_io_gpio0_io18                               										 (hps_gpio0_io18),
	.hps_io_gpio1_io16                               										 (hps_gpio1_io16),
	.hps_io_gpio1_io17                               										 (hps_gpio1_io17),
	
	// HPS SPIM0
	.hps_io_SPIM0_CLK                                										 (hps_spim0_clk),
	.hps_io_SPIM0_MOSI                               										 (hps_spim0_mosi_o),
	.hps_io_SPIM0_MISO                               										 (hps_spim0_miso_i),
	.hps_io_SPIM0_SS0_N                              										 (hps_spim0_ss0_n),
	
	// HPS SPIM1
	.hps_io_SPIM1_CLK                                										 (hps_spim1_clk),
	.hps_io_SPIM1_MOSI                               										 (hps_spim1_mosi_o),
	.hps_io_SPIM1_MISO                               										 (hps_spim1_miso_i),
	.hps_io_SPIM1_SS0_N                              										 (hps_spim1_ss0_n),
	.hps_io_SPIM1_SS1_N                              										 (hps_spim1_ss1_n),
	
	// HPS OSC Clock and Reset
	.hps_io_hps_osc_clk                              										 (hps_ref_clk),
	.agilex_hps_h2f_reset_reset                      										 (h2f_reset),
	.f2h_irq1_irq                                    										 (f2h_irq1_irq),
	
	// TOD Master
	.qsys_top_master_todclk_0_in_clk_clk             										 (ftile_master_todclk_ref),
	.master_tod_top_0_pulse_per_second_pps           										 (master_tod_top_0_pulse_per_second),
	.mtod_subsys_pps_in_pulse_per_second             										 (ref_pps_in),
	.mtod_subsys_master_tod_top_0_i_upstr_pll_lock   										 (1'b1),
	.tod_timestamp_96b_0_pps_in_pps_in               										 (ref_pps_in),
	.tod_subsys_0_master_tod_subsys_0_mtod_subsys_pps_load_tod_0_time_of_day_96b_data 		 (master_tod_time_of_day_96b),
	.tod_subsys_0_tod_slave_sub_system_0_master_tod_split_conduit_end_10_data 				 (),//master_tod_time_of_day_96b_synced_tod),
	.tod_subsys_0_tod_slave_sub_system_0_master_tod_split_conduit_end_10_valid 			 (),
	.tod_subsys_0_tod_slave_port_8_tod_stack_rx_tod_interface_tdata 						 (),
	.tod_subsys_0_tod_slave_port_8_tod_stack_rx_tod_interface_tvalid 						 (),
	.tod_slave_subsys_port_8_tod_stack_tx_pll_locked_lock 									 (status_vector[4]),
	// DUC AVST Source (Downlink)
	.duc_avst_source_duc_avst_source_valid           										 (dl_avst_source_valid),
	.duc_avst_source_duc_avst_source_data0           										 (dl_avst_source_data_l0),
	.duc_avst_source_duc_avst_source_data1           										 (dl_avst_source_data_l1),
	.duc_avst_source_duc_avst_source_data2           										 (dl_avst_source_data_l2),
	.duc_avst_source_duc_avst_source_data3           										 (dl_avst_source_data_l3),
	.duc_avst_source_duc_avst_source_data4           										 (dl_avst_source_data_l4),
	.duc_avst_source_duc_avst_source_data5           										 (dl_avst_source_data_l5),
	.duc_avst_source_duc_avst_source_data6           										 (dl_avst_source_data_l6),
	.duc_avst_source_duc_avst_source_data7           										 (dl_avst_source_data_l7),
	.duc_avst_source_duc_avst_source_channel         										 (),
	
	// DDC AVST Sink (Uplink)
	.ddc_avst_sink_avst_sink_valid                   										 (ul_avst_sink_valid),
	.ddc_avst_sink_avst_sink_data_l1                 										 (ul_avst_sink_data_l0),
	.ddc_avst_sink_avst_sink_data_l2                 										 (ul_avst_sink_data_l1),
	.ddc_avst_sink_avst_sink_data_l3                 										 (ul_avst_sink_data_l2),
	.ddc_avst_sink_avst_sink_data_l4                 										 (ul_avst_sink_data_l3),
	.ddc_avst_sink_avst_sink_data_l5                 										 (ul_avst_sink_data_l4),
	.ddc_avst_sink_avst_sink_data_l6                 										 (ul_avst_sink_data_l5),
	.ddc_avst_sink_avst_sink_data_l7                 										 (ul_avst_sink_data_l6),
	.ddc_avst_sink_avst_sink_data_l8                 										 (ul_avst_sink_data_l7),
	.ddc_avst_sink_avst_sink_channel                 										 (8'd0),
	
	// DFD Subsystem
	.dfd_subsystem_clock_bridge_dspby2_in_clk_clk    										 (clk_dspby2),
	
	// PHIPPS Peak
	.phipps_peak_0_rx_pcs_ready_rx_pcs_ready         										 (status_vector[5]),
	.phipps_peak_0_tx_lanes_stable_tx_lanes_stable   										 (status_vector[3]),
	.phipps_peak_0_lphy_ss_top_0_pb_avst_sink_valid  										 (1'b0),
	.phipps_peak_0_lphy_ss_top_0_pb_avst_sink_data   										 (64'd0),
	.phipps_peak_0_lphy_ss_top_0_pb_avst_sink_ready  										 (),
	.phipps_peak_0_lphy_ss_top_0_lphy_ss_top_duc_ddc_lpbk_en_data 							 (dfe_lpbk)
);


//------------ debounce fpga_reset_n -------------------------------------

debounce fpga_reset_n_debounce_inst (
.clk          (system_clk_100_internal),
.reset_n      (~ninit_done),
.data_in      (fpga_reset_n),
.data_out     (fpga_reset_n_debounced_wire)
);
defparam debounce_inst.WIDTH = 1;
defparam debounce_inst.POLARITY = "LOW";
defparam debounce_inst.TIMEOUT = 10000;               // at 100Mhz this is a debounce time of 1ms
defparam debounce_inst.TIMEOUT_WIDTH = 32;            // ceil(log2(TIMEOUT))

always @ (posedge system_clk_100_internal or posedge ninit_done)
begin
    if (ninit_done == 1'b1)
        fpga_reset_n_debounced <= 1'b0;
    else
        fpga_reset_n_debounced <= fpga_reset_n_debounced_wire;  
end

// Debounce logic to clean out glitches within 1ms
debounce debounce_inst (
.clk          (system_clk_100_internal),
.reset_n      (system_reset_n),  
.data_in      (fpga_button_pio),
.data_out     (fpga_debounced_buttons)
);
defparam debounce_inst.WIDTH = 4;
defparam debounce_inst.POLARITY = "LOW";
defparam debounce_inst.TIMEOUT = 10000;               // at 100Mhz this is a debounce time of 1ms
defparam debounce_inst.TIMEOUT_WIDTH = 32;            // ceil(log2(TIMEOUT))

always @(posedge system_clk_100_internal or negedge system_reset_n) begin
  if (~system_reset_n)
    heartbeat_count <= 23'd0;
  else
    heartbeat_count <= heartbeat_count + 23'd1;
end

iopll_491p52 u_iopll_491p52 (
	.rst      (~system_reset_n),      //   input,  width = 1,   reset.reset
	.refclk   (dsp_clk_491m),         //   input,  width = 1,  refclk.clk
	.locked   (iopll_491_locked),     //  output,  width = 1,  locked.export
	.outclk_0 (clk_dsp),              //  output,  width = 1, outclk0.clk
	.outclk_1 (jesd_link_clk)         //  output,  width = 1, outclk1.clk
);

assign jesd_frame_clk = jesd_link_clk;

iopll_dspby2 u_iopll_dspby2 (
	.rst      (~system_reset_n),          //   input,  width = 1,   reset.reset
	.refclk   (dsp_clk_491m),             //   input,  width = 1,  refclk.clk
	.locked   (),                         //  output,  width = 1,  locked.export
	.outclk_0 (clk_dspby2)                //  output,  width = 1, outclk0.clk
);


// CDC FIFO for JESD Tx and JESD Rx Interface
assign dl_avst_source_data = {dl_avst_source_data_l3, dl_avst_source_data_l2, dl_avst_source_data_l1, dl_avst_source_data_l0};
assign jesd_core_pll_lock  = iopll_491_locked;

altera_reset_synchronizer #(.ASYNC_RESET(0), .DEPTH(4)) jesd_tx_sync_inst (.reset_in (jesd_tx_rst), .clk (jesd_frame_clk), .reset_out (jesd_tx_rst_s));
altera_reset_synchronizer #(.ASYNC_RESET(0), .DEPTH(4)) jesd_rx_sync_inst (.reset_in (jesd_rx_rst), .clk (jesd_frame_clk), .reset_out (jesd_rx_rst_s));
altera_reset_synchronizer #(.ASYNC_RESET(0), .DEPTH(4)) dsp_tx_sync_inst (.reset_in (jesd_tx_rst), .clk (clk_dsp), .reset_out (dsp_tx_rst_s));
altera_reset_synchronizer #(.ASYNC_RESET(0), .DEPTH(4)) dsp_rx_sync_inst (.reset_in (jesd_rx_rst), .clk (clk_dsp), .reset_out (dsp_rx_rst_s));


j204c_bit_synchronizer core_pll_locked_sync (
      .source_clk(1'b0),
      .source_clk_rstn(1'b0),
      .dest_clk(system_clk_100_internal),
      .dest_clk_rstn(system_reset_n),
      .datain(jesd_core_pll_lock),
      .dataout(jesd_core_pll_lock_r)
   );
 	
	
avst_cdc_fifo #(
    .INPUT_DATAWIDTH  (128),
	.OUTPUT_DATAWIDTH (512)
) u_cdc_tx_jesd_data (
	.dst_clk         (jesd_frame_clk),         	
	.dst_rst_n       (~jesd_tx_rst_s),
	.src_clk         (clk_dsp),        	
	.src_rst_n       (~dsp_tx_rst_s),
	.avst_sink_valid (dl_avst_source_valid),
	.avst_sink_data  (dl_avst_source_data), 
	.avst_sink_ready (),
	.avst_src_valid  (tx_jesd_avst_valid),
	.avst_src_data   (tx_jesd_avst_data),		
	.avst_src_ready  (tx_jesd_avst_ready)

);


// Tx Data Arrangement

assign tx_arranged_data [511:496]  = tx_jesd_avst_data  [15:0]   ;
assign tx_arranged_data [495:480]  = tx_jesd_avst_data  [31:16]  ;
assign tx_arranged_data [383:368]  = tx_jesd_avst_data  [143:128];
assign tx_arranged_data [367:352]  = tx_jesd_avst_data  [159:144];
assign tx_arranged_data [255:240]  = tx_jesd_avst_data  [271:256];
assign tx_arranged_data [239:224]  = tx_jesd_avst_data  [287:272];
assign tx_arranged_data [127:112]  = tx_jesd_avst_data  [399:384];
assign tx_arranged_data [111:96]   = tx_jesd_avst_data  [415:400];

assign tx_arranged_data [479:464] = tx_jesd_avst_data   [47:32]  ;
assign tx_arranged_data [463:448] = tx_jesd_avst_data   [63:48]  ;
assign tx_arranged_data [351:336] = tx_jesd_avst_data   [175:160];
assign tx_arranged_data [335:320] = tx_jesd_avst_data   [191:176];
assign tx_arranged_data [223:208] = tx_jesd_avst_data   [303:288];
assign tx_arranged_data [207:192] = tx_jesd_avst_data   [319:304];
assign tx_arranged_data [95:80]   = tx_jesd_avst_data   [431:416];
assign tx_arranged_data [79:64]   = tx_jesd_avst_data   [447:432];

assign tx_arranged_data [447:432] = tx_jesd_avst_data   [79:64];
assign tx_arranged_data [431:416] = tx_jesd_avst_data   [95:80];
assign tx_arranged_data [319:304] = tx_jesd_avst_data   [207:192];
assign tx_arranged_data [303:288] = tx_jesd_avst_data   [223:208];
assign tx_arranged_data [191:176] = tx_jesd_avst_data   [335:320];
assign tx_arranged_data [175:160] = tx_jesd_avst_data   [351:336];
assign tx_arranged_data [63:48]   = tx_jesd_avst_data   [463:448] ;
assign tx_arranged_data [47:32]   = tx_jesd_avst_data   [479:464] ;

assign tx_arranged_data [415:400]  = tx_jesd_avst_data [111:96] ;
assign tx_arranged_data [399:384]  = tx_jesd_avst_data [127:112];
assign tx_arranged_data [287:272]  = tx_jesd_avst_data [239:224];
assign tx_arranged_data [271:256]  = tx_jesd_avst_data [255:240];
assign tx_arranged_data [159:144]  = tx_jesd_avst_data [367:352];
assign tx_arranged_data [143:128]  = tx_jesd_avst_data [383:368];
assign tx_arranged_data [31:16]    = tx_jesd_avst_data [495:480];
assign tx_arranged_data [15:0]     = tx_jesd_avst_data [511:496];

// RX Data Arrangement

//Rx3
assign rx_arranged_data [511:496] = rx_jesd_avst_data [15:0]     ;
assign rx_arranged_data [495:480] = rx_jesd_avst_data [31:16]	 ;	
assign rx_arranged_data [383:368] = rx_jesd_avst_data [143:128]  ;
assign rx_arranged_data [367:352] = rx_jesd_avst_data [159:144]  ;
assign rx_arranged_data [255:240] = rx_jesd_avst_data [271:256]  ;
assign rx_arranged_data [239:224] = rx_jesd_avst_data [287:272]  ;
assign rx_arranged_data [127:112] = rx_jesd_avst_data [399:384]  ;
assign rx_arranged_data [111:96]  = rx_jesd_avst_data [415:400]	 ;

//Rx2
assign rx_arranged_data [479:464] = rx_jesd_avst_data   [47:32]  ;
assign rx_arranged_data [463:448] = rx_jesd_avst_data   [63:48]  ;
assign rx_arranged_data [351:336] = rx_jesd_avst_data   [175:160];
assign rx_arranged_data [335:320] = rx_jesd_avst_data   [191:176];
assign rx_arranged_data [223:208] = rx_jesd_avst_data   [303:288];
assign rx_arranged_data [207:192] = rx_jesd_avst_data   [319:304];
assign rx_arranged_data [95:80]   = rx_jesd_avst_data   [431:416];
assign rx_arranged_data [79:64]   = rx_jesd_avst_data   [447:432];

//RX1
assign rx_arranged_data [447:432] = rx_jesd_avst_data   [79:64];
assign rx_arranged_data [431:416] = rx_jesd_avst_data   [95:80];
assign rx_arranged_data [319:304] = rx_jesd_avst_data   [207:192];
assign rx_arranged_data [303:288] = rx_jesd_avst_data   [223:208];
assign rx_arranged_data [191:176] = rx_jesd_avst_data   [335:320];
assign rx_arranged_data [175:160] = rx_jesd_avst_data   [351:336];
assign rx_arranged_data [63:48]   = rx_jesd_avst_data   [463:448];
assign rx_arranged_data [47:32]   = rx_jesd_avst_data   [479:464];

//Rx0
assign rx_arranged_data [415:400]  = rx_jesd_avst_data [111:96] ;
assign rx_arranged_data [399:384]  = rx_jesd_avst_data [127:112];
assign rx_arranged_data [287:272]  = rx_jesd_avst_data [239:224];
assign rx_arranged_data [271:256]  = rx_jesd_avst_data [255:240];
assign rx_arranged_data [159:144]  = rx_jesd_avst_data [367:352];
assign rx_arranged_data [143:128]  = rx_jesd_avst_data [383:368];
assign rx_arranged_data [31:16]    = rx_jesd_avst_data [495:480];
assign rx_arranged_data [15:0]     = rx_jesd_avst_data [511:496];



									  
avst_cdc_fifo #(
    .INPUT_DATAWIDTH  (512),
	.OUTPUT_DATAWIDTH (128)
) u_cdc_rx_jesd_data (
	.dst_clk         (clk_dsp),         	
	.dst_rst_n       (~dsp_rx_rst_s),
	.src_clk         (jesd_frame_clk),        	
	.src_rst_n       (~jesd_rx_rst_s),
	.avst_sink_valid (rx_jesd_avst_valid),
	.avst_sink_data  (rx_arranged_data),		
	.avst_sink_ready (rx_jesd_avst_ready),
	.avst_src_valid  (ul_avst_jesd_sink_valid),
	.avst_src_data   (ul_avst_jesd_sink_data),		
	.avst_src_ready  (1'b1)

);





//---------------------------------------------------------------
// Measure Clock - 491.52MHz
//---------------------------------------------------------------

measure_refclk measure_iopll_491p52
    (
    .RefClock           (clk_dsp),      
    .Measure_Clk        (system_clk_100_internal),  
    .reset              (~system_reset_n),  
    .Valid              (measure_dsp_clk_491_valid),        
    .RefClock_Measure   (refclk_measure_dsp_clk_491)        
    );

//---------------------------------------------------------------
// Measure Clock - SYSREF
//---------------------------------------------------------------
	 
measure_refclk measure_sysref
	(
	.RefClock			(sysref),		
	.Measure_Clk		(system_clk_100_internal),	
	.reset				(~system_reset_n),	
	.Valid				(measure_sysref_valid),		
	.RefClock_Measure 	(refclk_measure_sysref)		
	);	 

	//---------------------------------------------------------------
// Measure Clock - 402.83MHz
//---------------------------------------------------------------
measure_refclk measure_ftile_clk
	(
	.RefClock			(ftile_clk),		
	.Measure_Clk		(system_clk_100_internal),	
	.reset				(~system_reset_n),	
	.Valid				(measure_ftile_clk_valid),		
	.RefClock_Measure 	(refclk_measure_ftile_clk)		
	);
	


endmodule


