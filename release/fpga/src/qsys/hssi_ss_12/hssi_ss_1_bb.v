module hssi_ss_1 #(
		parameter SIM_MODE                         = 1,
		parameter SUBSYSTEM_RST_ACK_DEASSERT_DELAY = 49152,
		parameter TX_RST_ACK_DEASSERT_DELAY        = 512,
		parameter RX_RST_ACK_DEASSERT_DELAY        = 512,
		parameter DFHv0_FEA_VER                    = 0,
		parameter DFHv0_FEA_MINOR                  = 0,
		parameter DFHv0_FEA_EOL                    = 0,
		parameter DFHv0_FEA_NXT                    = 4096,
		parameter DFHv0_FEA_REV                    = 2,
		parameter DFHv0_FEA_FEAID                  = 21,
		parameter DFHv0_FEA_FEATYPE                = 3,
		parameter DFHv1_INSTID                     = 0,
		parameter SET_AXI_LITE_RESPONSE_TO_ZERO    = 0
	) (
		input  wire        app_ss_lite_clk,              //                axi4_lite_clk.clk,                   AXI-Lite CSR Interface Clock
		input  wire        app_ss_lite_areset_n,         //              axi4_lite_reset.reset_n,               AXI-Lite CSR Interface Asynchronous reset
		input  wire [25:0] app_ss_lite_awaddr,           //          axi4_lite_interface.awaddr,                Write Address
		input  wire [2:0]  app_ss_lite_awprot,           //                             .awprot,                Privilege and security level of the transaction
		input  wire        app_ss_lite_awvalid,          //                             .awvalid,               Write data valid
		output wire        ss_app_lite_awready,          //                             .awready,               Indicates slave is ready to accept a write transaction
		input  wire [31:0] app_ss_lite_wdata,            //                             .wdata,                 Write data
		input  wire [3:0]  app_ss_lite_wstrb,            //                             .wstrb,                 Indicates that the byte lanes that hold valid data
		input  wire        app_ss_lite_wvalid,           //                             .wvalid,                Write data valid
		output wire        ss_app_lite_wready,           //                             .wready,                Indicates that the salve can accept the write data
		output wire [1:0]  ss_app_lite_bresp,            //                             .bresp,                 Indicates the status of the write transaction
		output wire        ss_app_lite_bvalid,           //                             .bvalid,                Write response valid
		input  wire        app_ss_lite_bready,           //                             .bready,                Indicates that the master can accept a write response
		input  wire [25:0] app_ss_lite_araddr,           //                             .araddr,                Read Address
		input  wire [2:0]  app_ss_lite_arprot,           //                             .arprot,                Read address channel privilege and security attribute
		input  wire        app_ss_lite_arvalid,          //                             .arvalid,               Read address channel valid
		output wire        ss_app_lite_arready,          //                             .arready,               Indicates that the slave is ready to accept an read address transaction
		output wire [31:0] ss_app_lite_rdata,            //                             .rdata,                 Read data
		output wire        ss_app_lite_rvalid,           //                             .rvalid,                Read data valid
		input  wire        app_ss_lite_rready,           //                             .rready,                Indicates that the master can accept the read data and response
		output wire [1:0]  ss_app_lite_rresp,            //                             .rresp,                 Indicates the status of the read transfer
		input  wire        p0_app_ss_st_tx_clk,          //             p0_axi_st_tx_clk.clk,                   AXI-ST Tx Client Interface Clock
		input  wire        p0_app_ss_st_tx_areset_n,     //           p0_axi_st_tx_reset.reset_n,               AXI-ST Tx Client Interface Asynchronous Reset
		input  wire        p0_app_ss_st_tx_tvalid,       //       p0_axi_st_tx_interface.tvalid,                Valid
		output wire        p0_ss_app_st_tx_tready,       //                             .tready,                Ready
		input  wire [63:0] p0_app_ss_st_tx_tdata,        //                             .tdata,                 Data
		input  wire [7:0]  p0_app_ss_st_tx_tkeep,        //                             .tkeep,                 1'b1 for data byte, 1'b0 for null byte.Note: doesn't allow null byte in beginning or middle of transfer, only applicable during end of transfer
		input  wire        p0_app_ss_st_tx_tlast,        //                             .tlast,                 Last, indicating end of transfer.
		input  wire [1:0]  p0_app_ss_st_tx_tuser_client, //                             .tuser,                 Tx PTP User signal.Refer HAS Specification
		input  wire        p0_app_ss_st_rx_clk,          //             p0_axi_st_rx_clk.clk,                   AXI-ST Rx Client Interface Clock
		input  wire        p0_app_ss_st_rx_areset_n,     //           p0_axi_st_rx_reset.reset_n,               AXI-ST Rx Client Interface Asynchronous Reset
		output wire        p0_ss_app_st_rx_tvalid,       //       p0_axi_st_rx_interface.tvalid,                Valid
		output wire [63:0] p0_ss_app_st_rx_tdata,        //                             .tdata,                 Data
		output wire [7:0]  p0_ss_app_st_rx_tkeep,        //                             .tkeep,                 1'b1 for data byte, 1'b0 for null byte.Note: doesn't allow null byte in beginning or middle of transfer, only applicable during end of transfer.
		output wire        p0_ss_app_st_rx_tlast,        //                             .tlast,                 Last, indicating end of transfer.
		output wire [6:0]  p0_ss_app_st_rx_tuser_client, //                             .tuser,                 7+(PARAM_DATA/64) - 1:7 -tlast_segment. Used in MAC segmented interface protocol to indicate the TLAST indicator is located in which segment. Exist in F-tile and when MAC segmented interface protocol is enabled.Refer HAS Specification
		output wire [4:0]  p0_ss_app_st_rx_tuser_sts,    //           p0_rx_tuser_status.tuser_1,               Rx Packet Status.Refer HAS Specification
		input  wire        i_p0_tx_pause,                // p0_tx_flow_control_interface.i_p0_tx_pause,         Only functional if pause flow control is enabled. Asserted to send a pause XOFF frame. Note: For 10G/25G channels, i_tx_pause must be held for more than 205 ns to ensure the request is captured by the MAC.
		input  wire [7:0]  i_p0_tx_pfc,                  //                             .i_p0_tx_pfc,           Only functional if priority flow control is enabled. Used to send a pfc XOFF frame for the corresponding priority queue. Note: For 10G/25G channels, i_tx_pfc must be held for more than 205 ns to ensure the request is captured by the MAC.
		output wire        o_p0_rx_pause,                // p0_rx_flow_control_interface.o_p0_rx_pause,         Indicates that a pause XOFF frame was received
		output wire [7:0]  o_p0_rx_pfc,                  //                             .o_p0_rx_pfc,           Indicates that a pfc XOFF frame was received for priority queue q, where q is the bit number that was asserted.
		output wire [0:0]  p0_tx_serial,                 //          p0_tx_srl_interface.p0_tx_serial,          TX serial data. Each tx_serial bit becomes two physical pins that form a differential pair.
		output wire [0:0]  p0_tx_serial_n,               //                             .p0_tx_serial_n,        TX serial data. Each tx_serial bit becomes two physical pins that form a differential pair.
		input  wire [0:0]  p0_rx_serial,                 //          p0_rx_srl_interface.p0_rx_serial,          RX serial data. Each tx_serial bit becomes two physical pins that form a differential pair.
		input  wire [0:0]  p0_rx_serial_n,               //                             .p0_rx_serial_n,        RX serial data. Each tx_serial bit becomes two physical pins that form a differential pair.
		output wire [2:0]  port0_led_speed,              //           p0_qsfp_led_sts_if.port0_led_speed,       Indicates port speed when the profile is ethernet.
		output wire [2:0]  port0_led_status,             //                             .port0_led_status,      Indicates port status when the profile is ethernet.
		output wire [2:0]  port1_led_speed,              //           p1_qsfp_led_sts_if.port1_led_speed,       Indicates port speed when the profile is ethernet.
		output wire [2:0]  port1_led_status,             //                             .port1_led_status,      Indicates port status when the profile is ethernet.
		output wire [2:0]  port2_led_speed,              //           p2_qsfp_led_sts_if.port2_led_speed,       Indicates port speed when the profile is ethernet.
		output wire [2:0]  port2_led_status,             //                             .port2_led_status,      Indicates port status when the profile is ethernet.
		output wire [2:0]  port3_led_speed,              //           p3_qsfp_led_sts_if.port3_led_speed,       Indicates port speed when the profile is ethernet.
		output wire [2:0]  port3_led_status,             //                             .port3_led_status,      Indicates port status when the profile is ethernet.
		output wire [2:0]  port4_led_speed,              //           p4_qsfp_led_sts_if.port4_led_speed,       Indicates port speed when the profile is ethernet.
		output wire [2:0]  port4_led_status,             //                             .port4_led_status,      Indicates port status when the profile is ethernet.
		output wire [2:0]  port5_led_speed,              //           p5_qsfp_led_sts_if.port5_led_speed,       Indicates port speed when the profile is ethernet.
		output wire [2:0]  port5_led_status,             //                             .port5_led_status,      Indicates port status when the profile is ethernet.
		output wire [2:0]  port6_led_speed,              //           p6_qsfp_led_sts_if.port6_led_speed,       Indicates port speed when the profile is ethernet.
		output wire [2:0]  port6_led_status,             //                             .port6_led_status,      Indicates port status when the profile is ethernet.
		output wire [2:0]  port7_led_speed,              //           p7_qsfp_led_sts_if.port7_led_speed,       Indicates port speed when the profile is ethernet.
		output wire [2:0]  port7_led_status,             //                             .port7_led_status,      Indicates port status when the profile is ethernet.
		output wire [2:0]  port8_led_speed,              //           p8_qsfp_led_sts_if.port8_led_speed,       Indicates port speed when the profile is ethernet.
		output wire [2:0]  port8_led_status,             //                             .port8_led_status,      Indicates port status when the profile is ethernet.
		output wire [2:0]  port9_led_speed,              //           p9_qsfp_led_sts_if.port9_led_speed,       Indicates port speed when the profile is ethernet.
		output wire [2:0]  port9_led_status,             //                             .port9_led_status,      Indicates port status when the profile is ethernet.
		output wire [2:0]  port10_led_speed,             //          p10_qsfp_led_sts_if.port10_led_speed,      Indicates port speed when the profile is ethernet.
		output wire [2:0]  port10_led_status,            //                             .port10_led_status,     Indicates port status when the profile is ethernet.
		output wire [2:0]  port11_led_speed,             //          p11_qsfp_led_sts_if.port11_led_speed,      Indicates port speed when the profile is ethernet.
		output wire [2:0]  port11_led_status,            //                             .port11_led_status,     Indicates port status when the profile is ethernet.
		output wire [2:0]  port12_led_speed,             //          p12_qsfp_led_sts_if.port12_led_speed,      Indicates port speed when the profile is ethernet.
		output wire [2:0]  port12_led_status,            //                             .port12_led_status,     Indicates port status when the profile is ethernet.
		output wire [2:0]  port13_led_speed,             //          p13_qsfp_led_sts_if.port13_led_speed,      Indicates port speed when the profile is ethernet.
		output wire [2:0]  port13_led_status,            //                             .port13_led_status,     Indicates port status when the profile is ethernet.
		output wire [2:0]  port14_led_speed,             //          p14_qsfp_led_sts_if.port14_led_speed,      Indicates port speed when the profile is ethernet.
		output wire [2:0]  port14_led_status,            //                             .port14_led_status,     Indicates port status when the profile is ethernet.
		output wire [2:0]  port15_led_speed,             //          p15_qsfp_led_sts_if.port15_led_speed,      Indicates port speed when the profile is ethernet.
		output wire [2:0]  port15_led_status,            //                             .port15_led_status,     Indicates port status when the profile is ethernet.
		output wire        p0_tx_lanes_stable,           //            p0_misc_interface.p0_tx_lanes_stable,    Asserted when all physical TX lanes are stable and ready to transmit data for the corresponding Ethernet channel. Each channel has its own o_tx_lanes_stable
		output wire        p0_rx_pcs_ready,              //                             .p0_rx_pcs_ready,       Asserted when the RX lanes of the corresponding.Ethernet channel are fully aligned and ready to receive data.
		output wire        o_p0_tx_pll_locked,           //                             .o_p0_tx_pll_locked,    Asserts when RX PCS is ready to receive data.
		output wire        o_p0_txfifo_pfull,            //        p0_sl_xcvr_fifo_ports.o_p0_txfifo_pfull,     When asserted, indicates that the transceiver TX FIFO is partially full. At this point, the transceiver FIFO exceeds the programmed Partially Full watermark
		output wire        o_p0_txfifo_pempty,           //                             .o_p0_txfifo_pempty,    When asserted, indicates that the transceiver TX FIFO is partially empty. At this point, the transceiver FIFO is below the programmed Partially Full watermark.
		output wire        o_p0_txfifo_overflow,         //                             .o_p0_txfifo_overflow,  When asserted, indicates that the transceiver TX FIFO has overflowed, and should be reset.
		output wire        o_p0_txfifo_underflow,        //                             .o_p0_txfifo_underflow, When asserted, indicates that the transceiver TX FIFO has underflowed, and should be reset.
		input  wire        subsystem_cold_rst_n,         //         subsystem_cold_rst_n.reset_n,               Active-low hard global reset.Resets the full IP core.Resets the TX MAC, RX MAC, TX PCS, RX PCS,transceivers (transceiver reconfiguration registers and interface), and Ethernet reconfiguration registers.This reset leads to the deassertion of the o_tx_lanes_stable and o_rx_pcs_ready output signals.
		output wire        subsystem_cold_rst_ack_n,     //     subsystem_cold_rst_ack_n.reset_n,               Acknowledge signal for subsystem_cold_rst_n.Active low.User should not deassert subsystem_cold_rst_n until subsystem_cold_rst_ack_n is asserted.
		input  wire        i_p0_tx_rst_n,                //                i_p0_tx_rst_n.reset_n,               Active-low hard reset signal.Resets the TX interface, including the TX PCS and TX MAC. This reset leads to the deassertion of the o_tx_lanes_stable output signal.
		input  wire        i_p0_rx_rst_n,                //                i_p0_rx_rst_n.reset_n,               Active-low hard reset signal.Resets the RX interface, including the RX PCS and RX MAC. This reset leads to the deassertion of the o_rx_pcs_ready output signal.
		output wire        o_p0_rx_rst_ack_n,            //            o_p0_rx_rst_ack_n.reset_n,               Acknowledge signal for i_tx_rst_n. Active low.User should not deassert i_tx_rst_n until o_tx_rst_ack_n is asserted.
		output wire        o_p0_tx_rst_ack_n,            //            o_p0_tx_rst_ack_n.reset_n,               Acknowledge signal for i_rx_rst_n. Active low.User should not deassert i_rx_rst_n until o_rx_rst_ack_n is asserted.
		output wire        o_p0_ereset_n,                //                o_p0_ereset_n.reset_n,               Output reset to subsystem output ereset
		input  wire [2:0]  i_clk_ref,                    //                    i_clk_ref.clk,                   In E-TILE: The input clock i_clk_ref is the reference clock to the Native PHY IP. i_clk_ref[0] is 156.25Mhz, i_clk_ref[1] is 184.32Mhz, i_clk_ref[2] is 153.6Mhz. IN F-TILE: i_clk_ref[0] is 156.25Mhz for ethernet rates, used for FHT PMA channels. should be mapped to refclk[0] pin location.i_clk_ref[1] is not used.i_clk_ref[2] is 156.25Mhz for ethernet rates, used for FGT channels. . should be mapped to refclk[2] pin location.
		output wire        o_p0_clk_pll,                 //                 o_p0_clk_pll.clk,                   E-tile (o_clk_pll_div64).Supports the following clock frequencies:402.83203125 MHz for 25G and 100G with optional RS-FEC(528,514) PORT.415.0390625 MHz for 100G with RS-FEC(544,514) channel.161.1328125 MHz for 10G PORT.This clock is reliable only after o_tx_pll_locked is asserted.F-tile:Clock derived from the F-Tile System PLL associated with this Ethernet Port. The frequency is the system PLL frequency divided by 2 (eg, 806MHz system PLL would result in a 403MHz o_clk_pll).For all interfaces except for MAC AVST in asynchronous mode, i_clk_tx and i_clk_rx must be sourced from o_clk_pll.
		output wire        o_p0_clk_tx_div,              //              o_p0_clk_tx_div.clk,                   E-tile (o_clk_pll_div66):Hard IP for Ethernet block clock times 64/66.Supports the following clock frequencies:390.625 MHz for 25G and 100G with optional RS-FEC(528,514) PORT.402.4621 MHz for 100G with RS-FEC(544,514).156.25 MHz for 10G PORT.805.66 MHz for 25G PTP Channel.322.265625 MHz for 10G PTP Channel.This clock is reliable only after o_tx_pll_locked is asserted.F-tile:Clock derived from the TX serdes rate divided by 66 for No FEC / RS(528,514) / Firecode FEC ports,and 68 for RS(544,514) / Low-Latency FEC ports.
		output wire        o_p0_clk_rec_div64,           //           o_p0_clk_rec_div64.clk,                   E-tile:Derived from RX recovered clock. This clock supports the SyncE standard.The RX recovered clock frequency is:161.1328125 MHz Â±100 ppm for 10G PORT.402.83203125 MHz Â±100 ppm for 25G PORT.402.83203125 MHz Â±100 ppm for 100G with optional RS-FEC(528,514) PORT.415.0390625 MHz Â±100 ppm for 100G with RS-FEC(544,514) PORT.This clock is reliable only after o_cdr_lock[n] is asserted.When using this clock for Synchronous Ethernet, the expected usage is that you drive the TX transceiver reference clock with a filtered and divided version of o_clk_rec_div64 or o_clk_rec_div66, to ensure the receive and transmit functions remain synchronized. To do so you must include an additional component on your board. The IP core does not provide filtering.Note: The RX recovered clock is not available for PTP PORT when PTP enabled.F-tile:Clock derived from the RX (recovered) serdes rate divided by 64.
		output wire        o_p0_clk_rec_div              //             o_p0_clk_rec_div.clk,                   E-tile (o_clk_rec_div66):Derived from RX recovered clock. This clock supports the Synchronous Ethernet standard.The RX recovered clock frequency is:156.25 MHz Â±100 ppm for 10G PORT.390.625 MHz Â±100 ppm for 25G PORT.390.625 MHz Â±100 ppm for 100G with optional RS-FEC(528,514) PORT.402.4621 MHz Â±100 ppm for 100G with optional RS-FEC(528,514) PORT.This clock is reliable only after o_cdr_lock[n] is asserted.When using this clock for Synchronous Ethernet, the expected usage is that you drive the TX transceiver PLL reference clock with a filtered and divided version of o_clk_rec_div64 or o_clk_rec_div66, to ensure the receive and transmit functions remain synchronized. To do so you must include an additional component on your board. The IP core does not provide filtering.Note: The RX recovered clock is not available for PTP PORT when PTP enabled.F-tile:Clock derived from the RX (recovered) serdes rate divided by 66 for No FEC/ RS(528,514) / Firecode FEC ports and 68 for RS(544,514) / Low-Latency FEC ports.
	);
endmodule

