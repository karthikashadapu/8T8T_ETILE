#include<stdio.h>
#include<unistd.h>
#include <stdlib.h>
#include "io.h"
#include "hssi_ss_reconfig.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"

unsigned long rdata3;
unsigned long wdata3;

extern unsigned char sim_mode;

//----------------------------------------------DR_Profile_2_Start-----------------------------------------------------

//Switching from 10G/12G/24GFEC to 10G/12G/24GFEC
int HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(int port_num ,int fec_ena, int cpri_speed ,int rsfec_port_num){

	int return_value = 0;
	int ch_num = 0;
	int rsfec_ch_num=0;
	ch_num = get_ch_num(port_num);
	rsfec_ch_num = get_ch_num(rsfec_port_num);	

	unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
	unsigned long ehip_reconfig_base_addr = (((ch_num+1) << 21) + EHIP_BASE_ADDRESS);
	unsigned long rsfec_base_addr = (((rsfec_ch_num+1) << 21) + RSFEC_BASE_ADDRESS);
	unsigned long xcvr_pma_base_addr = (((ch_num+1) << 21) + PMA_BASE_ADDRESS);
	
	//1. tx/rx asserting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
	IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
	
	//2. serdes disable
	serdes_disable(ch_num);
	
//3 ============================ PMA analog reset  ===================================
	
	pma_analog_reset(ch_num);
	
	if(fec_ena == 1){

	//4  ============================ RS-FEC CONFIG===================================
		
		rdata3 = IORD_8DIRECT(rsfec_base_addr,0x5);
		
		if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFF7) | 0x8;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x15);
			wdata3 = (rdata3 & 0xFFFFFFCF) | 0x10;
			IOWR_8DIRECT(rsfec_base_addr,0x15,wdata3);
			
		}
		else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFB) | 0x4;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x15);
			wdata3 = (rdata3 & 0xFFFFFFFC) | 0x01;
			IOWR_8DIRECT(rsfec_base_addr,0x15,wdata3);

		}
		else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFD) | 0x2;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x14);
			wdata3 = (rdata3 & 0xFFFFFFCF) | 0x10;
			IOWR_8DIRECT(rsfec_base_addr,0x14,wdata3);
		}
		else{
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFE) | 0x1;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x14);
			wdata3 = (rdata3 & 0xFFFFFFFC) | 0x01;
			IOWR_8DIRECT(rsfec_base_addr,0x14,wdata3);
		}
		
	//5  ============================ PMA CONFIG===================================
			
		//Set xcvrif_ctrl0 
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
		wdata3 = (rdata3 & 0xFFFFFFE3) | 0x4;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata3);
		
		//ii xcvrif_ctrl0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
		wdata3 = (rdata3 & 0xFFFFFFCF) | 0x20;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata3);
		
		//iii xcvrif_ctrl0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
		wdata3 = (rdata3 & 0xFFFFFF9F) | 0x0;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata3);
		
		//Set cfg_rx_bit_counter_rollover 
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
		wdata3 = (rdata3 & 0xFFFFFF0F) | 0x3;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata3);
		
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
		wdata3 = (rdata3 & 0xFFFFFF00) | 0x48;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata3);
		
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
		wdata3 = (rdata3 & 0xFFFFFFFE) | 0x1;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata3);
		
		//v //RXBIT CNTR PMA [7] = 0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
		wdata3 = (rdata3 & 0xFFFFFF7F) | 0x0;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata3);
		
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
		rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
		wdata3 = (rdata3 & 0xFFFFFDFF) | 0x0;
		IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);

	//b.  switch ehip_rate
    rdata3 = IORD(ehip_reconfig_base_addr, 0x40B);                                             
    wdata3 = (rdata3 & 0xFFFFFE07) | 0x1E0;                                                    
    IOWR(ehip_reconfig_base_addr, 0x40B, wdata3);  
	}
	
	else{

	//4  ============================ RS-FEC CONFIG===================================
		
		rdata3 = IORD_8DIRECT(rsfec_base_addr,0x5);
		
		if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFF7) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x15);
			wdata3 = (rdata3 & 0xFFFFFFCF) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x15,wdata3);
			
		}
		else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFB) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x15);
			wdata3 = (rdata3 & 0xFFFFFFFC) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x15,wdata3);

		}
		else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFD) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x14);
			wdata3 = (rdata3 & 0xFFFFFFCF) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x14,wdata3);
		}
		else{
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFE) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x14);
			wdata3 = (rdata3 & 0xFFFFFFFC) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x14,wdata3);
		}
		
	//5  ============================ PMA CONFIG===================================
			
		//Set xcvrif_ctrl0 
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
		wdata3 = (rdata3 & 0xFFFFFFE3) | 0x0;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata3);
		
		//ii xcvrif_ctrl0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
		wdata3 = (rdata3 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata3);
		
		//iii xcvrif_ctrl0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
		wdata3 = (rdata3 & 0xFFFFFF9F) | 0x40;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata3);
		
		//Set cfg_rx_bit_counter_rollover 
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
		wdata3 = (rdata3 & 0xFFFFFF0F) | 0x3;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata3);
		
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
		wdata3 = (rdata3 & 0xFFFFFF00) | 0x8A;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata3);
		
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
		wdata3 = (rdata3 & 0xFFFFFFFE) | 0x1;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata3);
		
		//v //RXBIT CNTR PMA [7] = 0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
		wdata3 = (rdata3 & 0xFFFFFF7F) | 0x80;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata3);
		
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
		rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
		wdata3 = (rdata3 & 0xFFFFFDFF) | 0x200;
		IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);

	//b.  switch ehip_rate
    rdata3 = IORD(ehip_reconfig_base_addr, 0x40B);
    wdata3 = (rdata3 & 0xFFFFFE07) | 0x1C8; 
    IOWR(ehip_reconfig_base_addr, 0x40B, wdata3);
		
	}
	
	if(cpri_speed == 0){

	//6  ============================ PMA CONFIG_2===================================
			
	//a.	tx bit/refclk ratio for 24G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0084);

		
	//b.	rx bit/refclk ratio for 24G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0084);
	
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
	//	rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
	//	wdata3 = (rdata3 & 0xFFFFFDFF) | 0x200;
	//	IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);
		
	
	}
	
	else if(cpri_speed == 1){

	//6  ============================ PMA CONFIG_2===================================
			
	//a.	tx bit/refclk ratio for 24G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0042);

		
	//b.	rx bit/refclk ratio for 24G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0042);
	
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
	//	rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
	//	wdata3 = (rdata3 & 0xFFFFFDFF) | 0x200;
	//	IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);
		
	
	}
	
	else {

	//6  ============================ PMA CONFIG_2===================================
			
	//a.	tx bit/refclk ratio for 24G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0037);

		
	//b.	rx bit/refclk ratio for 24G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0037);
	
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
	//	rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
	//	wdata3 = (rdata3 & 0xFFFFFDFF) | 0x200;
	//	IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);
		
	
	}
	
	// set PMA tx/rx width mode , 32bits
	tx_rx_width_mode (ch_num, 0x55);

	// rx phaseslip to change the o_rx_fifo_clk_phase
	rx_phase_slip (ch_num);
	
	//7. serdes enable
	serdes_enable(ch_num);
	
	//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

//Switching from 10G/12G/24GFEC to 9P8G
int HSSI_cpri9P8Gabove_TO_cpri9P8G(int port_num ,int fec_ena, int cpri_speed ){

	int return_value = 0;
	int ch_num = 0;
	ch_num = get_ch_num(port_num);
	
	unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
	unsigned long ehip_reconfig_base_addr = (((ch_num+1) << 21) + EHIP_BASE_ADDRESS);
	unsigned long xcvr_pma_base_addr = (((ch_num+1) << 21) + PMA_BASE_ADDRESS);
	unsigned long xcvr_pma_capability_base_addr = (((ch_num+1) << 21) + PMA_CAPABILITY_BASE_ADDRESS);
	//1. tx/rx asserting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
	IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
	
	//2. serdes disable
	serdes_disable(ch_num);
	
	//3 ============================ Perform switch_pma_uc_clk_1 select start  ===================================
	if (sim_mode == 0){
	switch_pma_uc_clk_1(ch_num);
	}
	//REFCLK SEL SET
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEE);
	wdata3 = ((rdata3>>4) & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata3);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	//3 ============================ PMA analog reset  ===================================
	
	pma_analog_reset(ch_num);
	
	//6 ============================ CPRI CONFIG ===================================
		//a.	TX DATA PATH MUX
		rdata3 = IORD(ehip_reconfig_base_addr, 0x350);
		wdata3 = (rdata3 & 0xFFFFFFF8) | 0x7;
		IOWR(ehip_reconfig_base_addr, 0x350, wdata3);
		
		//b.	RX DATA PATH MUX
		rdata3 = IORD(ehip_reconfig_base_addr, 0x355);
		wdata3 = (rdata3 & 0xFFFFFFF8) | 0x7;
		IOWR(ehip_reconfig_base_addr, 0x355, wdata3);
	

	//7  ============================ PMA CONFIG_2===================================	
	
	//a.	tx bit/refclk ratio for 9.8G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0040);

		
	//b.	rx bit/refclk ratio for 9.8G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0040);
	
	//8  ============================ PMA CONFIG_1(Reconfig to CPRI 9p8g) ===================================
		
	//a.	AIB CLOCK1 & AIB CLOCK2 Select
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x322);
	wdata3 = (rdata3 & 0xFFFFFFF0) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x322, wdata3);
	
	//c.	RX FIFO STOP READ & RX FIFO PEMPTY
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata3 = (rdata3 & 0xFFFFFF80) | 0x44;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata3);
	
	//d.	RX FIFO POWER MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x31A);
	wdata3 = (rdata3 & 0xFFFFFFE3) | 0x1C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x31A, wdata3);
	
	//e.	RX FIFO FULL Threshold
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata3 = (rdata3 & 0xFFFFFFC0) | 0x3F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata3);
	
	//f.	RX FIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x315);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x315, wdata3);
	
	//g.	RX FIFO PFULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata3 = (rdata3 & 0xFFFFFFC0) | 0x14;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata3);
	
	//h.	TX AIB CLK1 SEL & TX AIB CLK2 SEL & TX FIFO RD CLK SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x30D);
	wdata3 = (rdata3 & 0xFFFFFF03) | 0x14;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x30D, wdata3);
	
	//i.	TX FIFO STOP RD & TX FIFO STOP WR
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata3 = (rdata3 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata3);
	
	//j.	TX GB TX IDWIDTH & TX GB TX ODWIDTH
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata3 = (rdata3 & 0xFFFFFFC1) | 0x2A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata3);
	
	//k.	TX PHCOMP RD SEL & TX TXFIFO FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x301);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x5E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x301, wdata3);
	
	//l.	TXFIFO POWER MODE & TX TXFIFO PFULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xF2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata3);
	
	//m.	TX TXFIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x300);
	wdata3 = (rdata3 & 0xFFFFFF1F) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x300, wdata3);
	
	//n.	DCC CSR EN FSM
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata3 = (rdata3 & 0xFFFFFFFD) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata3);
	
	//o.	RB CONT CAL & RB DCC BYP 7 RB DCC EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x6;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata3);
	
	//p.	RX BIT COUNTER ROLLOVER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata3 = (rdata3 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata3);
	
	//q.	RX BIT COUNTER ROLLOVER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x48;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata3);
	
	//r.	RX BIT COUNTER ROLLOVER & SEL BIT COUNTER ADDER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata3 = (rdata3 & 0xFFFFFF0C) | 0xC2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata3);
	
	//s.	RXBIT CONTR PMA
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata3 = (rdata3 & 0xFFFFFF7F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata3);
	
	//t.	EN DIRECT TX & EN FEC D2 TX & EN TX GBX & TX ML SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata3 = (rdata3 & 0xFFFFFF48) | 0x83;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata3);
	
	//u.	EN FIFO RD RX & RX FIFO CLK SEL & RX ML SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata3 = (rdata3 & 0xFFFFFF85) | 0x68;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata3);
	
	//v.	RX GB ODWIDTH
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xE);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xE, wdata3);
	
	//w.	RX SH LOCATION
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xB);
	wdata3 = (rdata3 & 0xFFFFFFF7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xB, wdata3);
	
	//x.	RX TAG SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x9);
	wdata3 = (rdata3 & 0xFFFFFFDF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x9, wdata3);
	
	//y.	RXFIFO AE THLD
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x11);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x11, wdata3);
	
	//z.	RXFIFO AE THLD & RX FIFO E THLD
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x10);
	wdata3 = (rdata3 & 0xFFFFFF20) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x10, wdata3);
	
	//aa.	RXFIFO AF THLD
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x12);
	wdata3 = (rdata3 & 0xFFFFFF83) | 0x08;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x12, wdata3);
	
	//bb.	RXFIFO RD EMPTY & RXFIFO WR FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x13);
	wdata3 = (rdata3 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x13, wdata3);
	
	//cc.	SH LOCATION
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x8);
	wdata3 = (rdata3 & 0xFFFFFFDF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x8, wdata3);
	
	//dd.	TX CLK DP SEL & TX DATA IN SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata3 = (rdata3 & 0xFFFFFFA3) | 0x0C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata3);
	
	//ee.	TX GB IDWIDTH
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xC);
	wdata3 = (rdata3 & 0xFFFFFF8F) | 0x50;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xC, wdata3);
	
	//ff.	TXFIFO PH COMP
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x17);
	wdata3 = (rdata3 & 0xFFFFFFCF) | 0x30;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x17, wdata3);
	
	//gg.	RX DATAPATH MAPPING MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x218);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x218, wdata3);
	
	//hh.	RX FIFO DOUBLE WRITE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21C);
	wdata3 = (rdata3 & 0xFFFFFFFE) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21C, wdata3);
	
	//ii.	RD CLK SCG EN & WR CLK SCG EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x227);
	wdata3 = (rdata3 & 0xFFFFFFCF) | 0x30;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x227, wdata3);
	
	//jj.	RX FIFO RD CLK SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x226);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x226, wdata3);
	
	//kk.	RX FIFO WR CLK SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x225);
	wdata3 = (rdata3 & 0xFFFFFF1F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x225, wdata3);
	
	//ll.	RX PHCOMP RD SEL & RX RXFIFO FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21B);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x47;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21B, wdata3);
	
	//mm.	RX FIFO POWER MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x220);
	wdata3 = (rdata3 & 0xFFFFFF3F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x220, wdata3);
	
	//nn.	RX RXFIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata3 = (rdata3 & 0xFFFFFF9F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata3);
	
	//oo.	TX DATAPATH MAPPING MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x208);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x208, wdata3);
	
	//pp.	TX FIFO DOUBLE READ
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x20B);
	wdata3 = (rdata3 & 0xFFFFFFF7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x20B, wdata3);
	
	//qq.	TX FIFO RD CLK SCG EN & TX FIFO RD CLK SEL & TX FIFO WR CLK SCG EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x214);
	wdata3 = (rdata3 & 0xFFFFFFFC) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x214, wdata3);
	
	//rr.	HRDRST ALIGN BYPASS & HRDRST DCD CAL DONE BYPASS
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x215);
	wdata3 = (rdata3 & 0xFFFFFF5F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x215, wdata3);
	
	//ss.	TX TX FIFO POWER MODE & TX WORD ALIGN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x210);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x210, wdata3);
	
	//tt.	TX AIB TX DCC BYP & TX AIB TX DCC EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32E);
	wdata3 = (rdata3 & 0xFFFFFFE7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32E, wdata3);
	
	// set PMA tx/rx width mode , 20bits
	tx_rx_width_mode (ch_num, 0x11);

	// rx phaseslip to change the o_rx_fifo_clk_phase
	rx_phase_slip (ch_num);
	
	//7. serdes enable
	serdes_enable(ch_num);
	
	//8. Reset AIB  Assert
	rdata3 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata3 = (rdata3 & 0xFFFFFF55) | 0xAA;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata3);
	
	//9.	Reset AIB  Deassert
	rdata3 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata3 = (rdata3 & 0xFFFFFF55) | 0x0;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata3);
	
	//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

//Switching from 10G/12G/24GFEC to 4.9G/2.4G
int HSSI_cpri9P8Gabove_TO_cpri9P8Gbelow(int port_num ,int fec_ena, int cpri_speed ){

	int return_value = 0;
	int ch_num = 0;
	ch_num = get_ch_num(port_num);
	
	unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
	unsigned long ehip_reconfig_base_addr = (((ch_num+1) << 21) + EHIP_BASE_ADDRESS);
	unsigned long xcvr_pma_base_addr = (((ch_num+1) << 21) + PMA_BASE_ADDRESS);
	unsigned long xcvr_pma_capability_base_addr = (((ch_num+1) << 21) + PMA_CAPABILITY_BASE_ADDRESS);
	//1. tx/rx asserting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
	IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
	//2. serdes disable
	serdes_disable(ch_num);
	
	//3 ============================ Perform switch_pma_uc_clk_1 select start  ===================================
	if (sim_mode == 0){
	switch_pma_uc_clk_1(ch_num);
	}
	//REFCLK SEL SET
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEE);
	wdata3 = ((rdata3>>4) & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata3);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}

	//3 ============================ PMA analog reset  ===================================
	
	pma_analog_reset(ch_num);
	
	//6 ============================ CPRI CONFIG ===================================
		//a.	TX DATA PATH MUX
		rdata3 = IORD(ehip_reconfig_base_addr, 0x350);
		wdata3 = (rdata3 & 0xFFFFFFF8) | 0x7;
		IOWR(ehip_reconfig_base_addr, 0x350, wdata3);
		
		//b.	RX DATA PATH MUX
		rdata3 = IORD(ehip_reconfig_base_addr, 0x355);
		wdata3 = (rdata3 & 0xFFFFFFF8) | 0x7;
		IOWR(ehip_reconfig_base_addr, 0x355, wdata3);
	

	//4  ============================ PMA CONFIG_1(Reconfig to CPRI 4p9g) ===================================
		
	//a.	AIB CLOCK1 & AIB CLOCK2 Select
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x322);
	wdata3 = (rdata3 & 0xFFFFFFF0) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x322, wdata3);
	
	//b.	RX FIFO STOP READ & RX FIFO PEMPTY
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xC5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata3);
	
	//c.	RX FIFO POWER MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x31A);
	wdata3 = (rdata3 & 0xFFFFFFE3) | 0x1C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x31A, wdata3);
	
	//Set cfg_rx_bit_counter 
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x3F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata3);
	
	//e.	RX FIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x315);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x315, wdata3);
	
	//f.	RX FIFO PFULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xD9;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata3);
	
	//g.	TX AIB CLK1 SEL & TX AIB CLK2 SEL & TX FIFO RD CLK SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x30D);
	wdata3 = (rdata3 & 0xFFFFFF03) | 0x14;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x30D, wdata3);
	
	//h.	TX FIFO STOP RD & TX FIFO STOP WR
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xE4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata3);
	
	//i.	TX GB TX IDWIDTH & TX GB TX ODWIDTH
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x2B;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata3);
	
	//j.	TX PHCOMP RD SEL & TX TXFIFO FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x301);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x5E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x301, wdata3);
	
	//k.	TXFIFO POWER MODE & TX TXFIFO PFULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xF4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata3);
	
	//l.	TX TXFIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x300);
	wdata3 = (rdata3 & 0xFFFFFF1F) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x300, wdata3);
	
	//m.	DCC CSR EN FSM
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata3);
	
	//n.	RB CONT CAL & RB DCC BYP 7 RB DCC EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata3);
	
	//o.	RX BIT COUNTER ROLLOVER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata3 = (rdata3 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata3);
	
	//p.	RX BIT COUNTER ROLLOVER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x48;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata3);
	
	//q.	RX BIT COUNTER ROLLOVER & SEL BIT COUNTER ADDER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata3 = (rdata3 & 0xFFFFFF0C) | 0xC2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata3);
	
	//r.	RXBIT CONTR PMA
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata3 = (rdata3 & 0xFFFFFF7F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata3);
	
	//s.	EN DIRECT TX & EN FEC D2 TX & EN TX GBX & TX ML SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata3 = (rdata3 & 0xFFFFFF48) | 0x83;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata3);
	
	//t.	EN FIFO RD RX & RX FIFO CLK SEL & RX ML SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata3 = (rdata3 & 0xFFFFFF85) | 0x68;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata3);
	
	//u.	RX GB ODWIDTH
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xE);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xE, wdata3);
	
	//v.	RX SH LOCATION
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xB);
	wdata3 = (rdata3 & 0xFFFFFFF7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xB, wdata3);
	
	//w.	RX TAG SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x9);
	wdata3 = (rdata3 & 0xFFFFFFDF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x9, wdata3);
	
	//x.	RXFIFO AE THLD
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x11);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x11, wdata3);
	
	//y.	RXFIFO AE THLD & RX FIFO E THLD
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x10);
	wdata3 = (rdata3 & 0xFFFFFF10) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x10, wdata3);
	
	//z.	RXFIFO AF THLD
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x12);
	wdata3 = (rdata3 & 0xFFFFFF83) | 0x08;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x12, wdata3);
	
	//aa.	RXFIFO RD EMPTY & RXFIFO WR FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x13);
	wdata3 = (rdata3 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x13, wdata3);
	
	//bb.	SH LOCATION
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x8);
	wdata3 = (rdata3 & 0xFFFFFFDF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x8, wdata3);
	
	//cc.	TX CLK DP SEL & TX DATA IN SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata3 = (rdata3 & 0xFFFFFFA3) | 0x0C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata3);
	
	//dd.	TX GB IDWIDTH
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xC);
	wdata3 = (rdata3 & 0xFFFFFF8F) | 0x50;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xC, wdata3);
	
	//ee.	TXFIFO PH COMP
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x17);
	wdata3 = (rdata3 & 0xFFFFFFCF) | 0x30;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x17, wdata3);
	
	//ff.	RX DATAPATH MAPPING MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x218);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x218, wdata3);
	
	//gg.	RX FIFO DOUBLE WRITE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21C);
	wdata3 = (rdata3 & 0xFFFFFFFE) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21C, wdata3);
	
	//hh.	RD CLK SCG EN & WR CLK SCG EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x227);
	wdata3 = (rdata3 & 0xFFFFFFCF) | 0x30;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x227, wdata3);
	
	//ii.	RX FIFO RD CLK SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x226);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x226, wdata3);
	
	//jj.	RX FIFO WR CLK SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x225);
	wdata3 = (rdata3 & 0xFFFFFF1F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x225, wdata3);
	
	//kk.	RX PHCOMP RD SEL & RX RXFIFO FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21B);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x47;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21B, wdata3);
	
	//ll.	RX FIFO POWER MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x220);
	wdata3 = (rdata3 & 0xFFFFFF3F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x220, wdata3);
	
	//mm.	RX RXFIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata3);
	
	//nn.	TX DATAPATH MAPPING MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x208);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x208, wdata3);
	
	//oo.	FIFO DOUBLE READ
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x20B);
	wdata3 = (rdata3 & 0xFFFFFFF7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x20B, wdata3);
	
	//pp.	TX FIFO RD CLK SCG EN & TX FIFO RD CLK SEL & TX FIFO WR CLK SCG EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x214);
	wdata3 = (rdata3 & 0xFFFFFFFC) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x214, wdata3);
	
	//qq.	HRDRST ALIGN BYPASS & HRDRST DCD CAL DONE BYPASS
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x215);
	wdata3 = (rdata3 & 0xFFFFFF5F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x215, wdata3);
	
	//rr.	 TX TX FIFO POWER MODE & TX WORD ALIGN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x210);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x210, wdata3);
	
	//ss.	TX AIB TX DCC BYP & TX AIB TX DCC EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32E);
	wdata3 = (rdata3 & 0xFFFFFFE7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32E, wdata3);
	
	//tt.	RX FIFO FULL Threshold
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x231);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x231, wdata3);
	
	//uu.	RX FIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x233);
	wdata3 = (rdata3 & 0xFFFFFFC0) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x233, wdata3);
	
	//vv.	HIP OSC CLK SCG EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x309);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x309, wdata3);
	
	//ww.	TX PHCOMP RD SEL & TX TXFIFO FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x310);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x19;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x310, wdata3);
	
	//xx.	TXFIFO POWER MODE & TX TXFIFO PFULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x311);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x311, wdata3);
	
	//yy.	RX BIT COUNTER ROLLOVER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x318);
	wdata3 = (rdata3 & 0xFFFFFFFC) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x318, wdata3);
	
	//zz.	RX BIT COUNTER ROLLOVER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x320);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x11;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x320, wdata3);
	
	//aaa.	RX BIT COUNTER ROLLOVER & SEL BIT COUNTER ADDER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32C);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32C, wdata3);

	if (cpri_speed == 4) {
		//	bbb.	TX REFCLK RATIO
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0020);
		
		//ccc.	RX REFCLK RATIO
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0020);
		
	}
	else{
		//	bbb.	TX REFCLK RATIO
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0010);
		
		//ccc.	RX REFCLK RATIO
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0010);
		
	}
	// set PMA tx/rx width mode , 20bits
	tx_rx_width_mode (ch_num, 0x11);

	// rx phaseslip to change the o_rx_fifo_clk_phase
	rx_phase_slip (ch_num);
	
	//7. serdes enable
	serdes_enable(ch_num);
	
	//8. Reset AIB  Assert
	rdata3 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata3 = (rdata3 & 0xFFFFFF55) | 0xAA;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata3);
	
	//9.	Reset AIB  Deassert
	rdata3 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata3 = (rdata3 & 0xFFFFFF55) | 0x0;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata3);
	
	//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

//Switching from 9P8G to 10G/12G/24GFEC
int HSSI_cpri9P8G_TO_cpri9P8Gabove(int port_num ,int fec_ena, int cpri_speed ,int rsfec_port_num){

	int return_value = 0;
	int ch_num = 0;
	int rsfec_ch_num=0;
	ch_num = get_ch_num(port_num);
	rsfec_ch_num = get_ch_num(rsfec_port_num);	
	unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
	unsigned long ehip_reconfig_base_addr = (((ch_num+1) << 21) + EHIP_BASE_ADDRESS);
	unsigned long rsfec_base_addr = (((rsfec_ch_num+1) << 21) + RSFEC_BASE_ADDRESS);
	unsigned long xcvr_pma_base_addr = (((ch_num+1) << 21) + PMA_BASE_ADDRESS);
	unsigned long xcvr_pma_capability_base_addr = (((ch_num+1) << 21) + PMA_CAPABILITY_BASE_ADDRESS);
	
	//1. tx/rx asserting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
	IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);	
	//2. serdes disable
	serdes_disable(ch_num);
	
	//3 ============================ Perform switch_pma_uc_clk_1 select start  ===================================
	if (sim_mode == 0){
	switch_pma_uc_clk_1(ch_num);
	}
	//REFCLK SEL SET
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEE);
	wdata3 = ((rdata3>>0) & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata3);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	
	//3 ============================ PMA analog reset  ===================================
	
	pma_analog_reset(ch_num);
	
	//4  ============================ PMA CONFIG_1(Reconfig to CPRI 4p9g) ===================================
		
	//a.	AIB CLOCK1 & AIB CLOCK2 Select
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x322);
	wdata3 = (rdata3 & 0xFFFFFFF0) | 0x9;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x322, wdata3);
	
	//b.	RX FIFO STOP READ & RX FIFO PEMPTY
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata3 = (rdata3 & 0xFFFFFF80) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata3);
	
	//c.	RX FIFO POWER MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x31A);
	wdata3 = (rdata3 & 0xFFFFFFE3) | 0x0C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x31A, wdata3);
	
	//Set cfg_rx_bit_counter 
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata3 = (rdata3 & 0xFFFFFFC0) | 0x0F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata3);
	
	//e.	RX FIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x315);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x315, wdata3);
	
	//f.	RX FIFO PFULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata3 = (rdata3 & 0xFFFFFFC0) | 0xA;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata3);
	
	//g.	TX AIB CLK1 SEL & TX AIB CLK2 SEL & TX FIFO RD CLK SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x30D);
	wdata3 = (rdata3 & 0xFFFFFF03) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x30D, wdata3);
	
	//h.	TX FIFO STOP RD & TX FIFO STOP WR
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata3 = (rdata3 & 0xFFFFFF3F) | 0x00;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata3);
	
	//i.	TX GB TX IDWIDTH & TX GB TX ODWIDTH
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata3 = (rdata3 & 0xFFFFFFC1) | 0x8;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata3);
	
	//j.	TX PHCOMP RD SEL & TX TXFIFO FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x301);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x6E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x301, wdata3);
	
	//k.	TXFIFO POWER MODE & TX TXFIFO PFULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x6A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata3);
	
	//l.	TX TXFIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x300);
	wdata3 = (rdata3 & 0xFFFFFF1F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x300, wdata3);
	
	//m.	DCC CSR EN FSM
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata3 = (rdata3 & 0xFFFFFFFD) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata3);
	
	//n.	RB CONT CAL & RB DCC BYP 7 RB DCC EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata3);
	
	//s.	EN DIRECT TX & EN FEC D2 TX & EN TX GBX & TX ML SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata3 = (rdata3 & 0xFFFFFF58) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata3);
	
	//t.	EN FIFO RD RX & RX FIFO CLK SEL & RX ML SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata3 = (rdata3 & 0xFFFFFF85) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata3);
	
	//u.	RX GB ODWIDTH
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xE);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xE, wdata3);
	
	//v.	RX SH LOCATION
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xB);
	wdata3 = (rdata3 & 0xFFFFFFF7) | 0x8;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xB, wdata3);
	
	//w.	RX TAG SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x9);
	wdata3 = (rdata3 & 0xFFFFFFDF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x9, wdata3);
	
	//x.	RXFIFO AE THLD
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x11);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x11, wdata3);
	
	//y.	RXFIFO AE THLD & RX FIFO E THLD
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x10);
	wdata3 = (rdata3 & 0xFFFFFF20) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x10, wdata3);
	
	//z.	RXFIFO AF THLD
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x12);
	wdata3 = (rdata3 & 0xFFFFFF83) | 0x50;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x12, wdata3);
	
	//aa.	RXFIFO RD EMPTY & RXFIFO WR FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x13);
	wdata3 = (rdata3 & 0xFFFFFF3F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x13, wdata3);
	
	//bb.	SH LOCATION
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x8);
	wdata3 = (rdata3 & 0xFFFFFFDF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x8, wdata3);
	
	//cc.	TX CLK DP SEL & TX DATA IN SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata3 = (rdata3 & 0xFFFFFFA3) | 0x44;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata3);
	
	//dd.	TX GB IDWIDTH
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xC);
	wdata3 = (rdata3 & 0xFFFFFF8F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xC, wdata3);
	
	//ee.	TXFIFO PH COMP
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x17);
	wdata3 = (rdata3 & 0xFFFFFFCF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x17, wdata3);
	
	//ff.	RX DATAPATH MAPPING MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x218);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x218, wdata3);
	
	//gg.	RX FIFO DOUBLE WRITE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21C);
	wdata3 = (rdata3 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21C, wdata3);
	
	//hh.	RD CLK SCG EN & WR CLK SCG EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x227);
	wdata3 = (rdata3 & 0xFFFFFFCF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x227, wdata3);
	
	//ii.	RX FIFO RD CLK SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x226);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x226, wdata3);
	
	//jj.	RX FIFO WR CLK SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x225);
	wdata3 = (rdata3 & 0xFFFFFF1F) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x225, wdata3);
	
	//kk.	RX PHCOMP RD SEL & RX RXFIFO FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21B);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x6E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21B, wdata3);
	
	//ll.	RX FIFO POWER MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x220);
	wdata3 = (rdata3 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x220, wdata3);
	
	//mm.	RX RXFIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata3 = (rdata3 & 0xFFFFFF9F) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata3);
	
	//nn.	TX DATAPATH MAPPING MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x208);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x208, wdata3);
	
	//oo.	FIFO DOUBLE READ
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x20B);
	wdata3 = (rdata3 & 0xFFFFFFF7) | 0x8;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x20B, wdata3);
	
	//pp.	TX FIFO RD CLK SCG EN & TX FIFO RD CLK SEL & TX FIFO WR CLK SCG EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x214);
	wdata3 = (rdata3 & 0xFFFFFFFC) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x214, wdata3);
	
	//qq.	HRDRST ALIGN BYPASS & HRDRST DCD CAL DONE BYPASS
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x215);
	wdata3 = (rdata3 & 0xFFFFFF5F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x215, wdata3);
	
	//rr.	 TX TX FIFO POWER MODE & TX WORD ALIGN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x210);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x7;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x210, wdata3);
	
	//ss.	TX AIB TX DCC BYP & TX AIB TX DCC EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32E);
	wdata3 = (rdata3 & 0xFFFFFFE7) | 0x18;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32E, wdata3);
	
	//6 ============================ CPRI CONFIG ===================================
	//a.	TX DATA PATH MUX
	rdata3 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x2;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata3);
		
	//b.	RX DATA PATH MUX
	rdata3 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x2;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata3);
	
	//c.	phy_ehip_mode_muxes
	rdata3 = IORD(ehip_reconfig_base_addr, 0x30D);
	wdata3 = (rdata3 & 0xFFFFFFF7) | 0x8;
	IOWR(ehip_reconfig_base_addr, 0x30D, wdata3);
	
	if(fec_ena == 1){

	//4  ============================ RS-FEC CONFIG===================================
		
		rdata3 = IORD_8DIRECT(rsfec_base_addr,0x5);
		
		if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFF7) | 0x8;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x15);
			wdata3 = (rdata3 & 0xFFFFFFCF) | 0x10;
			IOWR_8DIRECT(rsfec_base_addr,0x15,wdata3);
			
		}
		else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFB) | 0x4;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x15);
			wdata3 = (rdata3 & 0xFFFFFFFC) | 0x01;
			IOWR_8DIRECT(rsfec_base_addr,0x15,wdata3);

		}
		else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFD) | 0x2;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x14);
			wdata3 = (rdata3 & 0xFFFFFFCF) | 0x10;
			IOWR_8DIRECT(rsfec_base_addr,0x14,wdata3);
		}
		else{
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFE) | 0x1;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x14);
			wdata3 = (rdata3 & 0xFFFFFFFC) | 0x01;
			IOWR_8DIRECT(rsfec_base_addr,0x14,wdata3);
		}
		
	//5  ============================ PMA CONFIG===================================
			
		//Set xcvrif_ctrl0 
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
		wdata3 = (rdata3 & 0xFFFFFFE3) | 0x4;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata3);
		
		//ii xcvrif_ctrl0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
		wdata3 = (rdata3 & 0xFFFFFFCF) | 0x20;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata3);
		
		//iii xcvrif_ctrl0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
		wdata3 = (rdata3 & 0xFFFFFF9F) | 0x0;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata3);
		
		//Set cfg_rx_bit_counter_rollover 
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
		wdata3 = (rdata3 & 0xFFFFFF0F) | 0x3;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata3);
		
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
		wdata3 = (rdata3 & 0xFFFFFF00) | 0x48;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata3);
		
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
		wdata3 = (rdata3 & 0xFFFFFFFE) | 0x1;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata3);
		
		//v //RXBIT CNTR PMA [7] = 0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
		wdata3 = (rdata3 & 0xFFFFFF7F) | 0x0;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata3);
		
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
		rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
		wdata3 = (rdata3 & 0xFFFFFDFF) | 0x0;
		IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);

	//b.  switch ehip_rate
    rdata3 = IORD(ehip_reconfig_base_addr, 0x40B);
    wdata3 = (rdata3 & 0xFFFFFE07) | 0x1E0; 
    IOWR(ehip_reconfig_base_addr, 0x40B, wdata3);
		
	}
	
	else{

	//4  ============================ RS-FEC CONFIG===================================
		
		rdata3 = IORD_8DIRECT(rsfec_base_addr,0x5);
		
		if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFF7) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x15);
			wdata3 = (rdata3 & 0xFFFFFFCF) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x15,wdata3);
			
		}
		else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFB) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x15);
			wdata3 = (rdata3 & 0xFFFFFFFC) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x15,wdata3);

		}
		else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFD) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x14);
			wdata3 = (rdata3 & 0xFFFFFFCF) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x14,wdata3);
		}
		else{
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFE) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x14);
			wdata3 = (rdata3 & 0xFFFFFFFC) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x14,wdata3);
		}
		
	//5  ============================ PMA CONFIG===================================
			
		//Set xcvrif_ctrl0 
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
		wdata3 = (rdata3 & 0xFFFFFFE3) | 0x0;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata3);
		
		//ii xcvrif_ctrl0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
		wdata3 = (rdata3 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata3);
		
		//iii xcvrif_ctrl0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
		wdata3 = (rdata3 & 0xFFFFFF9F) | 0x40;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata3);
		
		//Set cfg_rx_bit_counter_rollover 
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
		wdata3 = (rdata3 & 0xFFFFFF0F) | 0x3;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata3);
		
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
		wdata3 = (rdata3 & 0xFFFFFF00) | 0x8A;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata3);
		
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
		wdata3 = (rdata3 & 0xFFFFFFFE) | 0x1;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata3);
		
		//v //RXBIT CNTR PMA [7] = 0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
		wdata3 = (rdata3 & 0xFFFFFF7F) | 0x80;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata3);
		
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
		rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
		wdata3 = (rdata3 & 0xFFFFFDFF) | 0x200;
		IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);

	//b.  switch ehip_rate
    rdata3 = IORD(ehip_reconfig_base_addr, 0x40B);
    wdata3 = (rdata3 & 0xFFFFFE07) | 0x1C8; 
    IOWR(ehip_reconfig_base_addr, 0x40B, wdata3);
		
	}
	
	if(cpri_speed == 0){

	//6  ============================ PMA CONFIG_2===================================
			
	//a.	tx bit/refclk ratio for 24G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0084);

		
	//b.	rx bit/refclk ratio for 24G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0084);
	
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
	//	rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
	//	wdata3 = (rdata3 & 0xFFFFFDFF) | 0x200;
	//	IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);
		
	
	}
	
	else if(cpri_speed == 1){

	//6  ============================ PMA CONFIG_2===================================
			
	//a.	tx bit/refclk ratio for 12G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0042);

		
	//b.	rx bit/refclk ratio for 24G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0042);
	
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
	//	rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
	//	wdata3 = (rdata3 & 0xFFFFFDFF) | 0x200;
	//	IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);
		
	
	}
	
	else {

	//6  ============================ PMA CONFIG_2===================================
			
	//a.	tx bit/refclk ratio for 10G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0037);

		
	//b.	rx bit/refclk ratio for 24G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0037);
	
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
	//	rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
	//	wdata3 = (rdata3 & 0xFFFFFDFF) | 0x200;
	//	IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);
		
	
	}
	
	// set PMA tx/rx width mode , 32bits
	tx_rx_width_mode (ch_num, 0x55);

	// rx phaseslip to change the o_rx_fifo_clk_phase
	rx_phase_slip (ch_num);
	
	//7. serdes enable
	serdes_enable(ch_num);
	
	//8. Reset AIB  Assert
	rdata3 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata3 = (rdata3 & 0xFFFFFF55) | 0xAA;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata3);
	
	//9.	Reset AIB  Deassert
	rdata3 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata3 = (rdata3 & 0xFFFFFF55) | 0x0;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata3);
	
	//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

//Switching from 9P8G to 4.9G/2.4G
int HSSI_cpri9P8G_TO_cpri9P8Gbelow(int port_num ,int fec_ena, int cpri_speed ){

	int return_value = 0;
	int ch_num = 0;
	ch_num = get_ch_num(port_num);
	unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
	unsigned long xcvr_pma_base_addr = (((ch_num+1) << 21) + PMA_BASE_ADDRESS);
	unsigned long xcvr_pma_capability_base_addr = (((ch_num+1) << 21) + PMA_CAPABILITY_BASE_ADDRESS);
	//1. tx/rx asserting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
	IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
	//2. serdes disable
	serdes_disable(ch_num);

	//3 ============================ PMA analog reset  ===================================
	
	pma_analog_reset(ch_num);
	

	//4  ============================ PMA CONFIG_1(Reconfig to CPRI 4p9g) ===================================
		
	//a. AIB CLOCK1 & AIB CLOCK2 Select
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata3);
	
	//b.	RX FIFO STOP READ & RX FIFO PEMPTY
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata3);
	
	//c.	RX FIFO POWER MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata3);
	
	//d.	RX FIFO FULL Threshold
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x231);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x231, wdata3);
	
	//e.	RX FIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x233);
	wdata3 = (rdata3 & 0xFFFFFFC0) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x233, wdata3);
	
	//f.	TX AIB CLK1 SEL & TX AIB CLK2 SEL & TX FIFO RD CLK SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xE4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata3);
	
	//g.	TX FIFO STOP RD & TX FIFO STOP WR
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xF4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata3);
	
	//h.	TX GB TX IDWIDTH & TX GB TX ODWIDTH
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x2B;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata3);
	
	//i.	HIP OSC CLK SCG EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x309);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x309, wdata3);
	
	//j.	TX PHCOMP RD SEL & TX TXFIFO FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x310);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x19;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x310, wdata3);
	
	//k.	TXFIFO POWER MODE & TX TXFIFO PFULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x311);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x311, wdata3);
	
	//l.	TX TXFIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x3F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata3);
	
	//m.	DCC CSR EN FSM
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xC5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata3);
	
	//n.	RB CONT CAL & RB DCC BYP 7 RB DCC EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xD9;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata3);
	
	//o.	RX BIT COUNTER ROLLOVER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x318);
	wdata3 = (rdata3 & 0xFFFFFFFC) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x318, wdata3);
	
	//p.	RX BIT COUNTER ROLLOVER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x320);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x11;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x320, wdata3);
	
	//q.	RX BIT COUNTER ROLLOVER & SEL BIT COUNTER ADDER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32C);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32C, wdata3);
	

	if (cpri_speed == 4) {
		
	//	bbb.	i.	tx bit/refclk ratio for 4.9G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0020);
		
	//ii.	rx bit/refclk ratio for 4.9G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0020);
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
		
	}
	else{//2.4G
	//	iii.	tx bit/refclk ratio for 2.4G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0010);
		
	//iv.	rx bit/refclk ratio for 2.4G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0010);
		
	}
	
	// set PMA tx/rx width mode , 20bits
	tx_rx_width_mode (ch_num, 0x11);

	// rx phaseslip to change the o_rx_fifo_clk_phase
	rx_phase_slip (ch_num);
	
	//7. serdes enable
	serdes_enable(ch_num);
	
	//8. Reset AIB  Assert
	rdata3 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata3 = (rdata3 & 0xFFFFFF55) | 0xAA;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata3);
	
	//9.	Reset AIB  Deassert
	rdata3 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata3 = (rdata3 & 0xFFFFFF55) | 0x0;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata3);
	
	//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

//Switching from 4.9G/2.4G to 10G/12G/24GFEC
int HSSI_cpri9P8Gbelow_TO_cpri9P8Gabove(int port_num,int fec_ena,int cpri_speed, int rsfec_port_num){

	int return_value = 0;
	int ch_num = 0;
	int rsfec_ch_num=0;
	ch_num = get_ch_num(port_num);
	rsfec_ch_num = get_ch_num(rsfec_port_num);	
	unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
	unsigned long ehip_reconfig_base_addr = (((ch_num+1) << 21) + EHIP_BASE_ADDRESS);
	unsigned long rsfec_base_addr = (((rsfec_ch_num+1) << 21) + RSFEC_BASE_ADDRESS);
	unsigned long xcvr_pma_base_addr = (((ch_num+1) << 21) + PMA_BASE_ADDRESS);
	unsigned long xcvr_pma_capability_base_addr = (((ch_num+1) << 21) + PMA_CAPABILITY_BASE_ADDRESS);
	
	//1. tx/rx asserting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
	IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
	//2. serdes disable
	serdes_disable(ch_num);
	
	
	
//3 ============================ Perform switch_pma_uc_clk_1 select start  ===================================
	if (sim_mode == 0){
	switch_pma_uc_clk_1(ch_num);
	}
	//REFCLK SEL SET
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEE);
	wdata3 = ((rdata3>>0) & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata3);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	// PMA analog reset
	pma_analog_reset(ch_num);


//6  ============================ PMA CONFIG===================================
		
	//a.	r_aibdprio0
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x231);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x231, wdata3);
	
	//b.	r_aibdprio0
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x233);
	wdata3 = (rdata3 & 0xFFFFFFC0) | 0x38;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x233, wdata3);
	
	//c.	hssi_pldadapt_tx_309
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x309);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x23;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x309, wdata3);
	
	//d.	hssi_pldadapt_tx_310
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x310);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x1A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x310, wdata3);
	
	//e.	hssi_pldadapt_tx_310
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x311);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x311, wdata3);
	
	//f.	
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x318);
	wdata3 = (rdata3 & 0xFFFFFFFC) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x318, wdata3);
	
	//g.	hssi_pldadapt_tx_320
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x320);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x12;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x320, wdata3);
	
	//h.	hssi_pldadapt_tx_320
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32C);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32C, wdata3);
		
	//i.	AIB CLOCK1 & AIB CLOCK2 Select
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x322);
	wdata3 = (rdata3 & 0xFFFFFFF0) | 0x9;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x322, wdata3);
	
	//j.	RX FIFO STOP READ & RX FIFO PEMPTY
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata3 = (rdata3 & 0xFFFFFFB2) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata3);
	
	//k.	RX FIFO POWER MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x31A);
	wdata3 = (rdata3 & 0xFFFFFFE3) | 0x0C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x31A, wdata3);
	
	//l.	RX FIFO FULL Threshold
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x4F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata3);
	
	//m.	RX FIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x315);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x315, wdata3);
	
	//n.	RX FIFO PFULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata3 = (rdata3 & 0xFFFFFFEE) | 0x02;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata3);
	
	//o.	TX AIB CLK1 SEL & TX AIB CLK2 SEL & TX FIFO RD CLK SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x30D);
	wdata3 = (rdata3 & 0xFFFFFF03) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x30D, wdata3);
	
	//p.	TX FIFO STOP RD & TX FIFO STOP WR
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata3 = (rdata3 & 0xFFFFFF20) | 0x02;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata3);
	
	//q.	TX GB TX IDWIDTH & TX GB TX ODWIDTH
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata3 = (rdata3 & 0xFFFFFF09) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata3);
	
	//r.	TX PHCOMP RD SEL & TX TXFIFO FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x301);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x6E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x301, wdata3);
	
	//s.	TXFIFO POWER MODE & TX TXFIFO PFULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x6A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata3);
	
	//t.	TX TXFIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x300);
	wdata3 = (rdata3 & 0xFFFFFF1F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x300, wdata3);
	
	//u.	DCC CSR EN FSM
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata3 = (rdata3 & 0xFFFFFFFD) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata3);
	
	//v.	RB CONT CAL & RB DCC BYP 7 RB DCC EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata3);
	
	//aa.	EN DIRECT TX & EN FEC D2 TX & EN TX GBX & TX ML SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata3 = (rdata3 & 0xFFFFFF58) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata3);
	
	//bb.	EN FIFO RD RX & RX FIFO CLK SEL & RX ML SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata3 = (rdata3 & 0xFFFFFF85) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata3);
	
	//cc.	RX GB ODWIDTH
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xE);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xE, wdata3);
	
	//dd.	RX SH LOCATION
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xB);
	wdata3 = (rdata3 & 0xFFFFFFF7) | 0x8;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xB, wdata3);
	
	//ee.	RX TAG SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x9);
	wdata3 = (rdata3 & 0xFFFFFFDF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x9, wdata3);
	
	//ff.	RXFIFO AE THLD
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x11);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x11, wdata3);
	
	//gg.	RXFIFO AE THLD & RX FIFO E THLD
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x10);
	wdata3 = (rdata3 & 0xFFFFFF20) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x10, wdata3);
	
	//hh.	RXFIFO AF THLD
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x12);
	wdata3 = (rdata3 & 0xFFFFFF83) | 0x50;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x12, wdata3);
	
	//ii.	RXFIFO RD EMPTY & RXFIFO WR FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x13);
	wdata3 = (rdata3 & 0xFFFFFF3F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x13, wdata3);
	
	//jj.	SH LOCATION
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x8);
	wdata3 = (rdata3 & 0xFFFFFFDF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x8, wdata3);
	
	//kk.	TX CLK DP SEL & TX DATA IN SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata3 = (rdata3 & 0xFFFFFFA3) | 0x44;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata3);
	
	//ll.	TX GB IDWIDTH
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0xC);
	wdata3 = (rdata3 & 0xFFFFFF8F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xC, wdata3);
	
	//mm.	TXFIFO PH COMP
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x17);
	wdata3 = (rdata3 & 0xFFFFFFCF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x17, wdata3);
	
	//nn.	RX DATAPATH MAPPING MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x218);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x218, wdata3);
	
	//oo.	RX FIFO DOUBLE WRITE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21C);
	wdata3 = (rdata3 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21C, wdata3);
	
	//pp.	RD CLK SCG EN & WR CLK SCG EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x227);
	wdata3 = (rdata3 & 0xFFFFFFCF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x227, wdata3);
	
	//qq.	RX FIFO RD CLK SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x226);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x226, wdata3);
	
	//rr.	RX FIFO WR CLK SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x225);
	wdata3 = (rdata3 & 0xFFFFFF1F) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x225, wdata3);
	
	//ss.	RX PHCOMP RD SEL & RX RXFIFO FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21B);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x6E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21B, wdata3);
	
	//tt.	RX FIFO POWER MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x220);
	wdata3 = (rdata3 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x220, wdata3);
	
	//uu.	RX RXFIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata3);
	
	//vv.	TX DATAPATH MAPPING MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x208);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x208, wdata3);
	
	//ww.	TX FIFO DOUBLE READ
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x20B);
	wdata3 = (rdata3 & 0xFFFFFFF7) | 0x8;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x20B, wdata3);
	
	//xx.	TX FIFO RD CLK SCG EN & TX FIFO RD CLK SEL & TX FIFO WR CLK SCG EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x214);
	wdata3 = (rdata3 & 0xFFFFFFFC) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x214, wdata3);
	
	//yy.	HRDRST ALIGN BYPASS & HRDRST DCD CAL DONE BYPASS
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x215);
	wdata3 = (rdata3 & 0xFFFFFF5F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x215, wdata3);
	
	//zz.	TX TX FIFO POWER MODE & TX WORD ALIGN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x210);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x7;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x210, wdata3);
	
	//aaa.	TX AIB TX DCC BYP & TX AIB TX DCC EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32E);
	wdata3 = (rdata3 & 0xFFFFFFE7) | 0x18;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32E, wdata3);
	
//6 ============================ CPRI CONFIG ===================================
	//a.	TX DATA PATH MUX
	rdata3 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x2;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata3);
		
	//b.	RX DATA PATH MUX
	rdata3 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x2;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata3);
	
	//c.	phy_ehip_mode_muxes
	rdata3 = IORD(ehip_reconfig_base_addr, 0x30D);
	wdata3 = (rdata3 & 0xFFFFFFF7) | 0x8;
	IOWR(ehip_reconfig_base_addr, 0x30D, wdata3);
	
	if(fec_ena == 1){

	//4  ============================ RS-FEC CONFIG===================================
		
		rdata3 = IORD_8DIRECT(rsfec_base_addr,0x5);
		
		if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFF7) | 0x8;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x15);
			wdata3 = (rdata3 & 0xFFFFFFCF) | 0x10;
			IOWR_8DIRECT(rsfec_base_addr,0x15,wdata3);
			
		}
		else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFB) | 0x4;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x15);
			wdata3 = (rdata3 & 0xFFFFFFFC) | 0x01;
			IOWR_8DIRECT(rsfec_base_addr,0x15,wdata3);

		}
		else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFD) | 0x2;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x14);
			wdata3 = (rdata3 & 0xFFFFFFCF) | 0x10;
			IOWR_8DIRECT(rsfec_base_addr,0x14,wdata3);
		}
		else{
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFE) | 0x1;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x14);
			wdata3 = (rdata3 & 0xFFFFFFFC) | 0x01;
			IOWR_8DIRECT(rsfec_base_addr,0x14,wdata3);
		}
		
	//5  ============================ PMA CONFIG===================================
			
		//Set xcvrif_ctrl0 
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
		wdata3 = (rdata3 & 0xFFFFFFE3) | 0x4;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata3);
		
		//ii xcvrif_ctrl0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
		wdata3 = (rdata3 & 0xFFFFFFCF) | 0x20;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata3);
		
		//iii xcvrif_ctrl0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
		wdata3 = (rdata3 & 0xFFFFFF9F) | 0x0;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata3);
		
		//Set cfg_rx_bit_counter_rollover 
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
		wdata3 = (rdata3 & 0xFFFFFF0F) | 0x3;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata3);
		
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
		wdata3 = (rdata3 & 0xFFFFFF00) | 0x48;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata3);
		
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
		wdata3 = (rdata3 & 0xFFFFFFFE) | 0x1;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata3);
		
		//v //RXBIT CNTR PMA [7] = 0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
		wdata3 = (rdata3 & 0xFFFFFF7F) | 0x0;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata3);
		
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
		rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
		wdata3 = (rdata3 & 0xFFFFFDFF) | 0x0;
		IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);

	//b.  switch ehip_rate
    rdata3 = IORD(ehip_reconfig_base_addr, 0x40B);
    wdata3 = (rdata3 & 0xFFFFFE07) | 0x1E0; 
    IOWR(ehip_reconfig_base_addr, 0x40B, wdata3);
		
	}
	
	else{

	//4  ============================ RS-FEC CONFIG===================================
		
		rdata3 = IORD_8DIRECT(rsfec_base_addr,0x5);
		
		if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFF7) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x15);
			wdata3 = (rdata3 & 0xFFFFFFCF) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x15,wdata3);
			
		}
		else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFB) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x15);
			wdata3 = (rdata3 & 0xFFFFFFFC) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x15,wdata3);

		}
		else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFD) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x14);
			wdata3 = (rdata3 & 0xFFFFFFCF) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x14,wdata3);
		}
		else{
			//Set rsfec_top_clk_cfg
			wdata3 = (rdata3 & 0xFFFFFFFE) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x5,wdata3);
			
			//Set rsfec_top_rx_cfg
			rdata3 = IORD_8DIRECT(rsfec_base_addr,0x14);
			wdata3 = (rdata3 & 0xFFFFFFFC) | 0x0;
			IOWR_8DIRECT(rsfec_base_addr,0x14,wdata3);
		}
		
	//5  ============================ PMA CONFIG===================================
			
		//Set xcvrif_ctrl0 
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
		wdata3 = (rdata3 & 0xFFFFFFE3) | 0x0;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata3);
		
		//ii xcvrif_ctrl0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
		wdata3 = (rdata3 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata3);
		
		//iii xcvrif_ctrl0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
		wdata3 = (rdata3 & 0xFFFFFF9F) | 0x40;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata3);
		
		//Set cfg_rx_bit_counter_rollover 
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
		wdata3 = (rdata3 & 0xFFFFFF0F) | 0x3;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata3);
		
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
		wdata3 = (rdata3 & 0xFFFFFF00) | 0x8A;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata3);
		
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
		wdata3 = (rdata3 & 0xFFFFFFFE) | 0x1;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata3);
		
		//v //RXBIT CNTR PMA [7] = 0
		rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
		wdata3 = (rdata3 & 0xFFFFFF7F) | 0x80;
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata3);
		
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
		rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
		wdata3 = (rdata3 & 0x0000FDFF) | 0x200;
		IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);

	//b.  switch ehip_rate
    rdata3 = IORD(ehip_reconfig_base_addr, 0x40B);
    wdata3 = (rdata3 & 0xFFFFFE07) | 0x1C8; 
    IOWR(ehip_reconfig_base_addr, 0x40B, wdata3);
		
	}
	
	if(cpri_speed == 0){

	//6  ============================ PMA CONFIG_2===================================
			
	//a.	tx bit/refclk ratio for 24G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0084);

		
	//b.	rx bit/refclk ratio for 24G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0084);
	
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
	//	rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
	//	wdata3 = (rdata3 & 0xFFFFFDFF) | 0x200;
	//	IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);
		
	
	}
	
	else if(cpri_speed == 1){

	//6  ============================ PMA CONFIG_2===================================
			
	//a.	tx bit/refclk ratio for 12G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0042);

		
	//b.	rx bit/refclk ratio for 24G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0042);
	
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
	//	rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
	//	wdata3 = (rdata3 & 0xFFFFFDFF) | 0x200;
	//	IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);
		
	
	}
	
	else {

	//6  ============================ PMA CONFIG_2===================================
			
	//a.	tx bit/refclk ratio for 10G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0037);

		
	//b.	rx bit/refclk ratio for 24G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0037);
	
	//6 ============================ CPRI CONFIG ===================================
		//i.	phy_ehip_pcs_modes
	//	rdata3 = IORD(ehip_reconfig_base_addr, 0x30E);
	//	wdata3 = (rdata3 & 0xFFFFFDFF) | 0x200;
	//	IOWR(ehip_reconfig_base_addr, 0x30E, wdata3);
		
	
	}

		
	// set PMA tx/rx width mode , 32bits
	tx_rx_width_mode (ch_num, 0x55);

	// rx phaseslip to change the o_rx_fifo_clk_phase
	rx_phase_slip (ch_num);

	//7. serdes enable
	serdes_enable(ch_num);
	
//8. Reset AIB  Assert
	rdata3 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata3 = (rdata3 & 0xFFFFFF55) | 0xAA;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata3);
	
//9.	Reset AIB  Deassert
	rdata3 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata3 = (rdata3 & 0xFFFFFF55) | 0x0;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata3);
	
	//10. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

//Switching from 4.9G/2.4G to 9P8G
int HSSI_cpri9P8Gbelow_TO_cpri9P8G(int port_num ,int fec_ena, int cpri_speed ){

	int return_value = 0;
	int ch_num = 0;
	ch_num = get_ch_num(port_num);
	unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
	unsigned long xcvr_pma_base_addr = (((ch_num+1) << 21) + PMA_BASE_ADDRESS);
	unsigned long xcvr_pma_capability_base_addr = (((ch_num+1) << 21) + PMA_CAPABILITY_BASE_ADDRESS);
	//1. tx/rx asserting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
	IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
	//2. serdes disable
	serdes_disable(ch_num);
	
	
	//3 ============================ PMA analog reset  ===================================
	
	pma_analog_reset(ch_num);

	//7  ============================ PMA CONFIG_2===================================	
	
	//a.	tx bit/refclk ratio for 4.9G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0040);

		
	//b.	rx bit/refclk ratio for 9.8G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0040);
	
	//8  ============================ PMA CONFIG_1(Reconfig to CPRI 9p8g) ===================================
		
	//a. AIB CLOCK1 & AIB CLOCK2 Select
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x6;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata3);
	
	//b.	RX FIFO STOP READ & RX FIFO PEMPTY
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata3);
	
	//c.	RX FIFO POWER MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata3 = (rdata3 & 0xFFFFFF9F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata3);
	
	//d.	RX FIFO FULL Threshold
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x231);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x231, wdata3);
	
	//e.	RX FIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x233);
	wdata3 = (rdata3 & 0xFFFFFFC0) | 0x38;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x233, wdata3);
	
	//f.	TX AIB CLK1 SEL & TX AIB CLK2 SEL & TX FIFO RD CLK SEL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xE2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata3);
	
	//g.	TX FIFO STOP RD & TX FIFO STOP WR
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xF2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata3);
	
	//h.	TX GB TX IDWIDTH & TX GB TX ODWIDTH
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xAB;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata3);
	
	//i.	HIP OSC CLK SCG EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x309);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x23;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x309, wdata3);
	
	//j.	TX PHCOMP RD SEL & TX TXFIFO FULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x310);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x1A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x310, wdata3);
	
	//k.	TXFIFO POWER MODE & TX TXFIFO PFULL
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x311);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x311, wdata3);
	
	//l.	TX TXFIFO MODE
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x7F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata3);
	
	//m.	DCC CSR EN FSM
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xC4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata3);
	
	//n.	RB CONT CAL & RB DCC BYP 7 RB DCC EN
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0xD4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata3);
	
	//o.	RX BIT COUNTER ROLLOVER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x318);
	wdata3 = (rdata3 & 0xFFFFFFFC) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x318, wdata3);
	
	//p.	RX BIT COUNTER ROLLOVER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x320);
	wdata3 = (rdata3 & 0xFFFFFF00) | 0x12;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x320, wdata3);
	
	//q.	RX BIT COUNTER ROLLOVER & SEL BIT COUNTER ADDER
	rdata3 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32C);
	wdata3 = (rdata3 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32C, wdata3);
	
	// set PMA tx/rx width mode , 20bits
	tx_rx_width_mode (ch_num, 0x11);

	// rx phaseslip to change the o_rx_fifo_clk_phase
	rx_phase_slip (ch_num);
	
	//7. serdes enable
	serdes_enable(ch_num);
	
	//8. Reset AIB  Assert
	rdata3 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata3 = (rdata3 & 0xFFFFFF55) | 0xAA;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata3);
	
	//9.	Reset AIB  Deassert
	rdata3 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata3 = (rdata3 & 0xFFFFFF55) | 0x0;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata3);
	
	//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

//Switching from 4.9G/2.4G to 4.9G/2.4G
int HSSI_cpri9P8Gbelow_TO_cpri9P8Gbelow(int port_num ,int fec_ena, int cpri_speed ){

	int return_value = 0;
	int ch_num = 0;
	ch_num = get_ch_num(port_num);

	unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
	unsigned long xcvr_pma_base_addr = (((ch_num+1) << 21) + PMA_BASE_ADDRESS);
	//1. tx/rx asserting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
	IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
	
	//2. serdes disable
	serdes_disable(ch_num);
	
	
	//3 ============================ PMA analog reset  ===================================
	
	pma_analog_reset(ch_num);

	//7  ============================ PMA CONFIG_2===================================	
	
	if (cpri_speed == 4) {
		
	//	bbb.	i.	tx bit/refclk ratio for 4.9G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0020);
		
	//ii.	rx bit/refclk ratio for 4.9G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0020);
		IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
		
	}
	else{//2.4G
	//	iii.	tx bit/refclk ratio for 2.4G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0005, 0x0010);
		
	//iv.	rx bit/refclk ratio for 2.4G (Based on 184.32MHz ref clk)
		return_value += pma_cfg_code(ch_num, 0x0006, 0x0010);
		
	}
	
	
	// set PMA tx/rx width mode , 20bits
	tx_rx_width_mode (ch_num, 0x11);

	// rx phaseslip to change the o_rx_fifo_clk_phase
	rx_phase_slip (ch_num);
	
	//7. serdes enable
	serdes_enable(ch_num);
	
	//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

//**********************************************DR_Profile_2_End****************************************************
