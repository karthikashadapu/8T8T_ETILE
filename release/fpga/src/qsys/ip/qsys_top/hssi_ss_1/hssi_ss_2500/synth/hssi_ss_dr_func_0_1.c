#include<stdio.h>
#include<unistd.h>
#include <stdlib.h>
#include "io.h"
#include "hssi_ss_reconfig.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"

unsigned long rdata0;
unsigned long wdata0;

extern unsigned char sim_mode;



//*******************************************************************************************************
//----------------------------------------------DR_Profile_0_1_Start-----------------------------------------------------

//PROFILE_1
//*******************************************************************************************************

int HSSI_25GPTPFEC_TO_25GPTPNOFEC(int port_num,int rsfec_port_num){

    int return_value = 0;
    int ch_num = 0;
    int rsfec_ch_num=0;

    ch_num = get_ch_num(port_num);
    rsfec_ch_num = get_ch_num(rsfec_port_num);

    unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
    unsigned long ehip_reconfig_base_addr = ((ch_num+1) << 21) + EHIP_BASE_ADDRESS;
    unsigned long rsfec_base_addr =  ((rsfec_ch_num+1) << 21) + RSFEC_BASE_ADDRESS;
    unsigned long xcvr_pma_base_addr = ((ch_num+1) << 21) + PMA_BASE_ADDRESS;
    //1. tx/rx asserting
    //IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
    IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8); 
    //usleep(1000);
    //2. serdes disable
    serdes_disable(ch_num);
    //3. PMA analog reset
    pma_analog_reset(ch_num);
    
    //4 ============================ EHIP CONFIG ===================================
    
    //Set EHIP TX MAC Feature Configuration (txmac_ehip_cfg)
    rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
	if (sim_mode == 1){
    wdata0 = (rdata0 & 0x00007E07) | 0x09FF80C8;
	}
	else{
    wdata0 = (rdata0 & 0x00007E07) | 0x9FFF80C8;
	}
    IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);
    
    //Set control for TX/RX PCS Datapath (phy_ehip_pcs_modes)
    rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
    wdata0 = (rdata0 & 0xFFFFFDE7) | 0x208;
    IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);
    
    
    //5  ============================ RS-FEC CONFIG===================================
    
    //Set rsfec_top_clk_cfg
    rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);
    
    if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
      wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
      IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
    }
    else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){ 
      wdata0 = (rdata0 & 0xFFFFFFFB) | 0x0;
      IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
    }
    else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
      wdata0 = (rdata0 & 0xFFFFFFFD) | 0x0;
      IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
    }
    else{
      wdata0 = (rdata0 & 0xFFFFFFFE) | 0x0;
      IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
    }
    
    //Set rsfec_top_tx_cfg
    if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
      rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
      wdata0 = (rdata0 & 0xFFFFFF8F) | 0x60;
      IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
    }
    else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){ 
      rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
      wdata0 = (rdata0 & 0xFFFFFFF8) | 0x06;
      IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
    }
    else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
      rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
      wdata0 = (rdata0 & 0xFFFFFF8F) | 0x60;
      IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
    }
    else{
      rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
      wdata0 = (rdata0 & 0xFFFFFFF8) | 0x06;
      IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
    }
    
    //Set rsfec_top_rx_cfg
    if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
      rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
      wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
      IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
    }
    else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){ 
      rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
      wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
      IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
    }
    else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
      rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
      wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
      IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
    }
    else{
      rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
      wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
      IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
    }
    
    //6  ============================ PMA CONFIG===================================
    //Set xcvrif_ctrl0 
    rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
    wdata0 = (rdata0 & 0xFFFFFFE3) | 0x0;
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
    
    rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
    wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
    
    rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
    wdata0 = (rdata0 & 0xFFFFFF9F) | 0x40;
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
    
    //Set cfg_rx_bit_counter 
    rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
    wdata0 = (rdata0 & 0xFFFFFF0F) | 0x3;
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);
    
    rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
    wdata0 = (rdata0 & 0xFFFFFF00) | 0x8A;
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
    
    rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
    wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
    
    rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
    wdata0 = (rdata0 & 0xFFFFFF7F) | 0x80;
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);
    
    //Set dynamic rx_bitslip enable
    rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xA);
    wdata0 = (rdata0 & 0xFFFFFFDF) | 0x20;
    IOWR_8DIRECT(xcvr_pma_base_addr, 0xA, wdata0);
    
    
    //tx bit/refclk ratio for 25G (Based on 156.25MHz ref clk)
    return_value += pma_cfg_code(ch_num, 0x0005, 0x00A5);
 /*   IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
    // Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);
    
    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);
    
    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);
    
    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
  */  
    
    //rx bit/refclk ratio for 25G (Based on 156.25MHz ref clk)
    return_value += pma_cfg_code(ch_num, 0x0006, 0x00A5);
  /*  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
    // Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);
    
    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);
    
    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);
    
    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
    
   */ 
    //Set PMA tx/rx width mode , 32bits
    
    return_value += pma_cfg_code(ch_num, 0x0014, 0x0055);
   /* IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x55);//0x84[7:0]: Set the data rate to reference clock frequency ratio
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x14);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
    // Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);
    
    
    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);
    
    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x14);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);
    
    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
   */ 
    
    //Set rx phaseslip to change the o_rx_fifo_clk_phase
    return_value += pma_cfg_code(ch_num, 0x000E, 0x9C00);
  /*  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x00);//0x84[7:0]: Set the data rate to reference clock frequency ratio
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x9C);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x0E);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
    // Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);
    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);
    
    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x0E);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);
    
    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
   */ 
    //7. serdes enable
    serdes_enable(ch_num);
    
    //8. tx/rx resetting
    //IOWR(ehip_reconfig_base_addr, 0x310, 0x4);
    //IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
    //IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
    //usleep(1000);
    return return_value;
}

//*******************************************************************************************************
//PROFILE_2
//*

int HSSI_25GPTPNOFEC_TO_25GPTPFEC(int port_num, int rsfec_port_num){
int return_value = 0;
int ch_num = 0;
int rsfec_ch_num=0;
ch_num = get_ch_num(port_num);
rsfec_ch_num = get_ch_num(rsfec_port_num);

unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
unsigned long ehip_reconfig_base_addr = ((ch_num+1) << 21) + EHIP_BASE_ADDRESS;
unsigned long rsfec_base_addr = ((rsfec_ch_num+1) << 21) + RSFEC_BASE_ADDRESS;
unsigned long xcvr_pma_base_addr = ((ch_num+1) << 21) + PMA_BASE_ADDRESS;

//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);

serdes_disable(ch_num);

pma_analog_reset(ch_num);


//3 ============================ EHIP CONFIG ===================================

//Set EHIP TX MAC Feature Configuration (txmac_ehip_cfg)
rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
if (sim_mode == 0){
wdata0 = (rdata0 & 0x00007E07) | 0x9FFE00E0;
} else{
wdata0 = (rdata0 & 0x00007E07) | 0x027E00E0; 
}
IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);

//Set control for TX/RX PCS Datapath (phy_ehip_pcs_modes)
rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
wdata0 = (rdata0 & 0xFFFFFDE7) | 0x10;
IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);


//4 ============================ RS-FEC CONFIG ===================================
//Set rsfec_top_clk_cfg
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);

if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
}
else if (port_num == 2 || port_num == 6|| port_num == 10 || port_num == 14){
wdata0 = (rdata0 & 0xFFFFFFFB) | 0x4;
IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
}
else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){
wdata0 = (rdata0 & 0xFFFFFFFD) | 0x2;
IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
}
else{
wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
}


//Set rsfec_top_tx_cfg
if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
}
else if (port_num == 2 || port_num == 6|| port_num == 10 || port_num == 14){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
}
else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
}
else{
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
}

//Set rsfec_top_rx_cfg
if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
}
else if (port_num == 2 || port_num == 6|| port_num == 10 || port_num == 14){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
wdata0 = (rdata0 & 0xFFFFFFFC) | 0x01;
IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
}
else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
}
else{
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
wdata0 = (rdata0 & 0xFFFFFFFC) | 0x01;
IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
}



//5 ============================ PMA config ===================================

//Set xcvrif_ctrl0 
rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
wdata0 = (rdata0 & 0xFFFFFFE3) | 0x04;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
wdata0 = (rdata0 & 0xFFFFFFCF) | 0x20;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
wdata0 = (rdata0 & 0xFFFFFF9F) | 0x0;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);

//Set cfg_rx_bit_counter 
rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
wdata0 = (rdata0 & 0xFFFFFF0F) | 0x3;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
wdata0 = (rdata0 & 0xFFFFFF00) | 0x48;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
wdata0 = (rdata0 & 0xFFFFFF7F) | 0x0;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);

//Set dynamic rx_bitslip enable
rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xA);
wdata0 = (rdata0 & 0xFFFFFFDF) | 0x0;
IOWR_8DIRECT(xcvr_pma_base_addr, 0xA, wdata0);

//tx bit/refclk ratio for 25G (Based on 156.25MHz ref clk)
    return_value += pma_cfg_code(ch_num, 0x0005, 0x00A5);
/*
IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x05);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/

//rx bit/refclk ratio for 25G (Based on 156.25MHz ref clk)
    return_value += pma_cfg_code(ch_num, 0x0006, 0x00A5);
/*IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x06);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/

//Set PMA tx/rx width mode , 32bits
    return_value += pma_cfg_code(ch_num, 0x0014, 0x0055);
/*IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x55);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x14);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x14);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
//Set rx phaseslip to change the o_rx_fifo_clk_phase
    return_value += pma_cfg_code(ch_num, 0x000E, 0x9C00);
/*IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x00);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x9C);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x0E);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x0E);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
serdes_enable(ch_num);
//IOWR(ehip_reconfig_base_addr, 0x310, 0x7);
////IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
//IOWR(ehip_reconfig_base_addr, 0x310, 0x4);
//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
    return return_value;
}

//*******************************************************************************************************
//PROFILE_3
//*

int HSSI_25GPTPFEC_TO_10GPTP(int port_num,int rsfec_port_num){

int return_value = 0;
int ch_num = 0;
int rsfec_ch_num=0;
ch_num = get_ch_num(port_num);
rsfec_ch_num = get_ch_num(rsfec_port_num);
unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
unsigned long ehip_reconfig_base_addr = ((ch_num+1) << 21) + EHIP_BASE_ADDRESS;
unsigned long rsfec_base_addr = ((rsfec_ch_num+1) << 21) + RSFEC_BASE_ADDRESS;
unsigned long xcvr_pma_base_addr = ((ch_num+1) << 21) + PMA_BASE_ADDRESS;

//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
serdes_disable(ch_num);

pma_analog_reset(ch_num);


//3 ============================ PMA config_1 ===================================

//tx bit/refclk ratio for 25G (Based on 156.25MHz ref clk)
return_value += pma_cfg_code(ch_num, 0x0005, 0x0042);
/*
IOWR_8DIRECT(xcvr_pma_base_addr, 0x084, 0x42);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x085, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x086, 0x05);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x087, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x090, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x08A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x08B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x088, 0x05);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x089, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x08A, 0x80);
*/

//rx bit/refclk ratio for 25G (Based on 156.25MHz ref clk)
return_value += pma_cfg_code(ch_num, 0x0006, 0x0042);
/*IOWR_8DIRECT(xcvr_pma_base_addr, 0x084, 0x42);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x085, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x086, 0x06);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x087, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x090, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x08A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x08B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x088, 0x06);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x089, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x08A, 0x80);
*/
//4 ============================ EHIP CONFIG ===================================
//a.	Set EHIP TX MAC Feature Configuration (txmac_ehip_cfg)
rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
if (sim_mode == 0){
wdata0 = (rdata0 & 0x00007E07) | 0x9FFF8108;
} else{
wdata0 = (rdata0 & 0x00007E07) | 0x09FF8108;
}
IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);

//b.	Set Timer Window for Hi-BER Checks
rdata0 = IORD(ehip_reconfig_base_addr, 0x37A);
wdata0 = (rdata0 & 0xFFE00000) | 0xC4E3;
IOWR(ehip_reconfig_base_addr, 0x37A, wdata0);

//c.	Set BER Invalid Count
rdata0 = IORD(ehip_reconfig_base_addr, 0x37B);
wdata0 = (rdata0 & 0xFFFFFF80) | 0x10;
IOWR(ehip_reconfig_base_addr, 0x37B, wdata0);

//d.	Set control for TX/RX PCS Datapath (phy_ehip_pcs_modes)
rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
wdata0 = (rdata0 & 0xFFFFFDE7) | 0x208;
IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);

//5 ============================ RS-FEC ===================================
//Set rsfec_top_clk_cfg
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);

if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
}
else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
wdata0 = (rdata0 & 0xFFFFFFFB) | 0x0;
IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
}
else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){
wdata0 = (rdata0 & 0xFFFFFFFD) | 0x0;
IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
}
else{
wdata0 = (rdata0 & 0xFFFFFFFE) | 0x0;
IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
}

//Set rsfec_top_tx_cfg
if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
wdata0 = (rdata0 & 0xFFFFFF8F) | 0x60;
IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
}
else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
wdata0 = (rdata0 & 0xFFFFFFF8) | 0x06;
IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
}
else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
wdata0 = (rdata0 & 0xFFFFFF8F) | 0x60;
IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
}
else{
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
wdata0 = (rdata0 & 0xFFFFFFF8) | 0x06;
IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
}
//Set rsfec_top_rx_cfg
if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
}
else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
}
else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
}
else{
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
}


//6 ============================ PMA config_2 ===================================
//Set xcvrif_ctrl0 
rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x04);
wdata0 = (rdata0 & 0xFFFFFFE3) | 0x0;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x04, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x05);
wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x05, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x07);
wdata0 = (rdata0 & 0xFFFFFF9F) | 0x40;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x07, wdata0);

//Set cfg_rx_bit_counter 
rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x034);
wdata0 = (rdata0 & 0xFFFFFF0F) | 0x3;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x034, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x035);
wdata0 = (rdata0 & 0xFFFFFF00) | 0x8A;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x035, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x036);
wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x036, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x037);
wdata0 = (rdata0 & 0xFFFFFF7F) | 0x80;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x037, wdata0);

//Set dynamic rx_bitslip enable
rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x00A);
wdata0 = (rdata0 & 0xFFFFFFDF) | 0x20;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x00A, wdata0);

//Set PMA tx/rx width mode , 32bits
    return_value += pma_cfg_code(ch_num, 0x0014, 0x0055);
/*IOWR_8DIRECT(xcvr_pma_base_addr, 0x084, 0x55);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x085, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x086, 0x14);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x087, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x090, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x08A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x08B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x088, 0x14);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x089, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x08A, 0x80);
*/
//Set rx phaseslip to change the o_rx_fifo_clk_phase
IOWR_8DIRECT(xcvr_pma_base_addr, 0x084, 0x00);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x085, 0x9C);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x086, 0x0E);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x087, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x090, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x08A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x08B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x088, 0x0E);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x089, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x08A, 0x80);


serdes_enable(ch_num);

//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

//*******************************************************************************************************
//PROFILE_4
//*

int HSSI_10GPTP_TO_25GPTPFEC(int port_num, int rsfec_port_num){
int return_value = 0;
int ch_num = 0;
int rsfec_ch_num=0;
ch_num = get_ch_num(port_num);
rsfec_ch_num = get_ch_num(rsfec_port_num);
unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
unsigned long ehip_reconfig_base_addr = ((ch_num+1) << 21) + EHIP_BASE_ADDRESS;
unsigned long rsfec_base_addr = ((rsfec_ch_num+1) << 21) + RSFEC_BASE_ADDRESS;
unsigned long xcvr_pma_base_addr = ((ch_num+1) << 21) + PMA_BASE_ADDRESS;

//1. tx/rx asserting
//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
//2. serdes disable
serdes_disable(ch_num);

//3. PMA analog reset
pma_analog_reset(ch_num);

//4  ============================ PMA CONFIG_1===================================

//tx bit/refclk ratio for 25G (Based on 156.25MHz ref clk)
  return_value += pma_cfg_code(ch_num, 0x0005, 0x00A5);
/*
IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x05);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/

//rx bit/refclk ratio for 25G (Based on 156.25MHz ref clk)
  return_value += pma_cfg_code(ch_num, 0x0006, 0x00A5);
/*
  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x06);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/

//5 ============================ EHIP CONFIG ===================================
//a.	Set EHIP TX MAC Feature Configuration (txmac_ehip_cfg)
rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
if (sim_mode == 0){
wdata0 = (rdata0 & 0x00007E07) | 0x9FFE00E0;
} else {
wdata0 = (rdata0 & 0x00007E07) | 0x027E00E0;
}
IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);

//b.	Set Timer Window for Hi-BER Checks
rdata0 = IORD(ehip_reconfig_base_addr, 0x37A);
wdata0 = (rdata0 & 0xFFE00000) | 0xC4E33;
IOWR(ehip_reconfig_base_addr, 0x37A, wdata0);

//c.	Set BER Invalid Count
rdata0 = IORD(ehip_reconfig_base_addr, 0x37B);
wdata0 = (rdata0 & 0xFFFFFF80) | 0x61;
IOWR(ehip_reconfig_base_addr, 0x37B, wdata0);

//d.	Set control for TX/RX PCS Datapath (phy_ehip_pcs_modes)
rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
wdata0 = (rdata0 & 0xFFFFFDE7) | 0x10;
IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);

//6  ============================ RS-FEC CONFIG===================================
//Set rsfec_top_clk_cfg
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);

if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
}
else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
wdata0 = (rdata0 & 0xFFFFFFFB) | 0x4;
IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
}
else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){
wdata0 = (rdata0 & 0xFFFFFFFD) | 0x2;
IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
}
else{
wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
}


//Set rsfec_top_tx_cfg
if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
}
else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
}
else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
}
else{
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
}

//Set rsfec_top_rx_cfg
if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
}
else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
wdata0 = (rdata0 & 0xFFFFFFFC) | 0x01;
IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
}
else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
}
else{
rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
wdata0 = (rdata0 & 0xFFFFFFFC) | 0x01;
IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
}


//7  ============================ PMA CONFIG_2===================================
//Set xcvrif_ctrl0 
rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
wdata0 = (rdata0 & 0xFFFFFFE3) | 0x4;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
wdata0 = (rdata0 & 0xFFFFFFCF) | 0x20;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
wdata0 = (rdata0 & 0xFFFFFF9F) | 0x0;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);

//Set cfg_rx_bit_counter 
rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
wdata0 = (rdata0 & 0xFFFFFF0F) | 0x3;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
wdata0 = (rdata0 & 0xFFFFFF00) | 0x48;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);

rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
wdata0 = (rdata0 & 0xFFFFFF7F) | 0x0;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);

//Set dynamic rx_bitslip enable
rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x0A);
wdata0 = (rdata0 & 0xFFFFFFDF) | 0x0;
IOWR_8DIRECT(xcvr_pma_base_addr, 0x0A, wdata0);

//Set PMA tx/rx width mode , 32bits
return_value += pma_cfg_code(ch_num, 0x0014, 0x0055);
/*IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x55);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x14);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x14);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
//Set rx phaseslip to change the o_rx_fifo_clk_phase
return_value += pma_cfg_code(ch_num, 0x000E, 0x9C00);
/*IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x00);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x9C);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x0E);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x0E);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
serdes_enable(ch_num);
//IOWR(ehip_reconfig_base_addr, 0x310, 0x7);
////IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
//IOWR(ehip_reconfig_base_addr, 0x310, 0x4);
//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

//*******************************************************************************************************
//PROFILE_5
//*

int HSSI_25GPTPNOFEC_TO_10GPTP(int port_num){

int return_value = 0;
int ch_num = 0;
ch_num = get_ch_num(port_num);
unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
unsigned long ehip_reconfig_base_addr = ((ch_num+1) << 21) + EHIP_BASE_ADDRESS;
//unsigned long xcvr_pma_base_addr = ((ch_num+1) << 21) + PMA_BASE_ADDRESS;

//1. tx/rx asserting
//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
//2. serdes disable
serdes_disable(ch_num);

//3. PMA analog reset
pma_analog_reset(ch_num);

//4  ============================ PMA CONFIG_1===================================
//tx bit/refclk ratio for 25G (Based on 156.25MHz ref clk)
return_value += pma_cfg_code(ch_num, 0x0005, 0x0042);
/*
IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x42);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x05);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/

//rx bit/refclk ratio for 25G (Based on 156.25MHz ref clk)
return_value += pma_cfg_code(ch_num, 0x0006, 0x0042);
/*IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x42);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x06);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/


//5 ============================ EHIP CONFIG ===================================

//a.	Set EHIP TX MAC Feature Configuration (txmac_ehip_cfg)
rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
if (sim_mode == 0){
wdata0 = (rdata0 & 0x00007E07) | 0x9FFF8108;
} else {
wdata0 = (rdata0 & 0x00007E07) | 0x09FF8108;
}
IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);

//b.	Set Timer Window for Hi-BER Checks
rdata0 = IORD(ehip_reconfig_base_addr, 0x37A);
wdata0 = (rdata0 & 0xFFE00000) | 0xC4E3;
IOWR(ehip_reconfig_base_addr, 0x37A, wdata0);

//c.	Set BER Invalid Count
rdata0 = IORD(ehip_reconfig_base_addr, 0x37B);
wdata0 = (rdata0 & 0xFFFFFF80) | 0x10;
IOWR(ehip_reconfig_base_addr, 0x37B, wdata0);

////d.	Set control for TX/RX PCS Datapath (phy_ehip_pcs_modes)
//rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
//wdata0 = (rdata0 & 0xFFFFFDE7) | 0x10;
//IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);

//6  ============================ PMA CONFIG_2===================================

//Set PMA tx/rx width mode , 32bits
return_value += pma_cfg_code(ch_num, 0x0014, 0x0055);
/*
IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x55);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x14);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x14);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
//Set rx phaseslip to change the o_rx_fifo_clk_phase
return_value += pma_cfg_code(ch_num, 0x000E, 0x9C00);
/*IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x00);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x9C);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x0E);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x0E);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
serdes_enable(ch_num);
//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

//*******************************************************************************************************
//PROFILE_6
//*

int HSSI_10GPTP_TO_25GPTPNOFEC(int port_num) {

int return_value = 0;
int ch_num = 0;
ch_num = get_ch_num(port_num);
unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
unsigned long ehip_reconfig_base_addr = ((ch_num+1) << 21) + EHIP_BASE_ADDRESS;
//unsigned long xcvr_pma_base_addr = ((ch_num+1) << 21) + PMA_BASE_ADDRESS;

//1. tx/rx asserting
//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
//2. serdes disable
serdes_disable(ch_num);

//3. PMA analog reset
pma_analog_reset(ch_num);

//4  ============================ PMA CONFIG_1===================================

//tx bit/refclk ratio for 25G (Based on 156.25MHz ref clk)
  return_value += pma_cfg_code(ch_num, 0x0005, 0x00A5);
/*
IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x05);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/

//rx bit/refclk ratio for 25G (Based on 156.25MHz ref clk)
  return_value += pma_cfg_code(ch_num, 0x0006, 0x00A5);
/*
  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x06);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
//4 ============================ EHIP CONFIG ===================================

//a.	Set EHIP TX MAC Feature Configuration (txmac_ehip_cfg)
rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
wdata0 = (rdata0 & 0x00007E07) | 0x9FFF80C8;
IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);

//b.	Set Timer Window for Hi-BER Checks
rdata0 = IORD(ehip_reconfig_base_addr, 0x37A);
wdata0 = (rdata0 & 0xFFE00000) | 0xC4E33;
IOWR(ehip_reconfig_base_addr, 0x37A, wdata0);

//c.	Set BER Invalid Count
rdata0 = IORD(ehip_reconfig_base_addr, 0x37B);
wdata0 = (rdata0 & 0xFFFFFF80) | 0x61;
IOWR(ehip_reconfig_base_addr, 0x37B, wdata0);

//6  ============================ PMA CONFIG_2===================================

//Set PMA tx/rx width mode , 32bits
return_value += pma_cfg_code(ch_num, 0x0014, 0x0055);
/*
IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x55);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x14);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x14);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
//Set rx phaseslip to change the o_rx_fifo_clk_phase
return_value += pma_cfg_code(ch_num, 0x000E, 0x9C00);
/*IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x00);//0x84[7:0]: Set the data rate to reference clock frequency ratio
IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x9C);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x0E);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
// Polling PMA register
//  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
//    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

//  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
//   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

//Verify that 0x88 ,0x89 PMA attribute code is expected to return data
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 0x0E);
return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

// Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
serdes_enable(ch_num);
//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}


//*******************************************************************************************************
//CPRI
int HSSI_25GPTPFEC_TO_24GCPRIFEC(int port_num,int rsfec_port_num){

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
	
	
	
//3 ============================ Perform switch_pma_uc_clk_1 select start  ===================================
	if (sim_mode == 0){
	switch_pma_uc_clk_1(ch_num);
	}
	//REFCLK SEL SET
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEE);
	wdata0 = ((rdata0>>4) & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata0);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	// PMA analog reset
	pma_analog_reset(ch_num);

//4  ============================ RS-FEC CONFIG===================================
	

	
	//change FEC mode to CPRI 
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x4C);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x03;
		IOWR_8DIRECT(rsfec_base_addr,0x4C,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x48);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x03;
		IOWR_8DIRECT(rsfec_base_addr,0x48,wdata0);

	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x44);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x03;
		IOWR_8DIRECT(rsfec_base_addr,0x44,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x40);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x03;
		IOWR_8DIRECT(rsfec_base_addr,0x40,wdata0);
		
	}

//5 ============================ EHIP CONFIG ===================================
	
//a.	switch ehip_mode
	//i.	phy_ehip_pcs_modes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
	wdata0 = (rdata0 & 0xFFFFFFEF) | 0x00;
	IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);
	
	//ii.	phy_ehip_mode_muxes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x08;
	IOWR(ehip_reconfig_base_addr, 0x30D, wdata0);
	
	//iii.	tx_pld_conf
	rdata0 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x02;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata0);
	
	//iv.	rx_pld_conf
	rdata0 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x02;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata0);

//b.	switch ehip_rate
	rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
	wdata0 = (rdata0 & 0xFFFFFE3F) | 0x1C0;
	IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);


//6  ============================ PMA CONFIG===================================
		
//a.	tx bit/refclk ratio for 24G 
return_value += pma_cfg_code(ch_num, 0x0005, 0x0084);
/*  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x84);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
	
//b.	rx bit/refclk ratio for 24G
return_value += pma_cfg_code(ch_num, 0x0006, 0x0084);
/* IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x84);//0x84[7:0]: Set the data rate to reference clock frequency ratio
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
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

int HSSI_24GCPRIFEC_TO_25GPTPFEC(int port_num,int rsfec_port_num){

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
	
	
	
//3 ============================ Perform switch_pma_uc_clk_1 select start  ===================================
	if (sim_mode == 0){
	switch_pma_uc_clk_1(ch_num);
	}
	//REFCLK SEL SET
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEE);
	wdata0 = ((rdata0>>0) & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata0);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	// PMA analog reset
	pma_analog_reset(ch_num);

//4  ============================ RS-FEC CONFIG===================================
	

	
	//change FEC mode to CPRI 
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x4C);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x4C,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x48);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x48,wdata0);

	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x44);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x44,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x40);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x40,wdata0);
		
	}

//5 ============================ EHIP CONFIG ===================================
	
//a.	switch ehip_mode
	//i.	phy_ehip_pcs_modes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
	wdata0 = (rdata0 & 0xFFFFFFEF) | 0x10;
	IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);
	
	//ii.	phy_ehip_mode_muxes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x00;
	IOWR(ehip_reconfig_base_addr, 0x30D, wdata0);
	
	//iii.	tx_pld_conf
	rdata0 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata0);
	
	//iv.	rx_pld_conf
	rdata0 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata0);

//b.	switch ehip_rate
	rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
	wdata0 = (rdata0 & 0xFFFFFE07) | 0x0E0;
	IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);


//6  ============================ PMA CONFIG===================================
		
//a.	tx bit/refclk ratio for 24G 
  return_value += pma_cfg_code(ch_num, 0x0005, 0x00A5);
/*
  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
	
//b.	rx bit/refclk ratio for 24G
   return_value += pma_cfg_code(ch_num, 0x0006, 0x00A5);
/*
  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
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

int HSSI_25GPTPFEC_TO_10GCPRI(int port_num,int rsfec_port_num){

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
	
	
	
//3 ============================ Perform switch_pma_uc_clk_1 select start  ===================================
	if (sim_mode == 0){
	switch_pma_uc_clk_1(ch_num);
	}
	//REFCLK SEL SET
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEE);
	wdata0 = ((rdata0>>4) & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata0);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	// PMA analog reset
	pma_analog_reset(ch_num);

//4  ============================ RS-FEC CONFIG===================================
		
	//Set rsfec_top_clk_cfg
	rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);
	
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		wdata0 = (rdata0 & 0xFFFFFFFB) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		wdata0 = (rdata0 & 0xFFFFFFFD) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else{
		wdata0 = (rdata0 & 0xFFFFFFFE) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	
	//Set rsfec_top_tx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x60;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x06;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x60;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x06;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	
	//Set rsfec_top_rx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	
// ============================ 	CPRI SOFT CONFIG (cprisoft_base_addr)  ============================ 
//	rdata0 = IORD(ehip_reconfig_base_addr, 0x0);
//	wdata0 = (rdata0 & 0xE0) | 0x9;
//	IOWR(ehip_reconfig_base_addr, 0x0, wdata0); 
	
//5  ============================ PMA CONFIG_1===================================
		
	//Set xcvrif_ctrl0 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF9F) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	//Set cfg_rx_bit_counter 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0F) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x8A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);
	

//6 ============================ EHIP CONFIG ===================================
	
//a.	switch ehip_mode
	//i.	phy_ehip_pcs_modes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
	wdata0 = (rdata0 & 0xFFFFFDE7) | 0x200;
	IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);
	
	//ii.	phy_ehip_mode_muxes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFFC7) | 0x08;
	IOWR(ehip_reconfig_base_addr, 0x30D, wdata0);
	
	//iii.	tx_pld_conf
	rdata0 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x02;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata0);
	
	//iv.	rx_pld_conf
	rdata0 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x02;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata0);

//b.	switch ehip_rate
	rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
	wdata0 = (rdata0 & 0xFFFFFE07) | 0x1C8;
	IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);


//6  ============================ PMA CONFIG_2===================================
		
//a.	tx bit/refclk ratio for 24G
return_value += pma_cfg_code(ch_num, 0x0005, 0x0037);

/*	IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x37);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
	
//b.	rx bit/refclk ratio for 24G
return_value += pma_cfg_code(ch_num, 0x0006, 0x0037);
/*IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x37);//0x84[7:0]: Set the data rate to reference clock frequency ratio
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
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

int HSSI_10GCPRI_TO_25GPTPFEC(int port_num,int rsfec_port_num){

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
	
	
	
//3 ============================ Perform switch_pma_uc_clk_1 select start  ===================================
	if (sim_mode == 0){
	switch_pma_uc_clk_1(ch_num);
	}
	//REFCLK SEL SET
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEE);
	wdata0 = (rdata0 & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata0);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	// PMA analog reset
	pma_analog_reset(ch_num);

//4  ============================ RS-FEC CONFIG===================================
		
	//Set rsfec_top_clk_cfg
	rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);
	
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		wdata0 = (rdata0 & 0xFFFFFFFB) | 0x4;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		wdata0 = (rdata0 & 0xFFFFFFFD) | 0x2;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else{
		wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	
	//Set rsfec_top_tx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	
	//Set rsfec_top_rx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	
	
//5  ============================ PMA CONFIG_1===================================
		
	//Set xcvrif_ctrl0 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF9F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	//Set cfg_rx_bit_counter 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0F) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x48;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);
	

//6 ============================ EHIP CONFIG ===================================
	
//a.	switch ehip_mode
	//i.	phy_ehip_pcs_modes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
	wdata0 = (rdata0 & 0xFFFFFDEF) | 0x10;
	IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);
	
	//ii.	phy_ehip_mode_muxes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFFC7) | 0x0;
	IOWR(ehip_reconfig_base_addr, 0x30D, wdata0);
	
	//iii.	tx_pld_conf
	rdata0 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata0);
	
	//iv.	rx_pld_conf
	rdata0 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata0);

//b.	switch ehip_rate
	rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
	wdata0 = (rdata0 & 0xFFFFFE07) | 0xE0;
	IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);


//6  ============================ PMA CONFIG_2===================================
		
//a.	tx bit/refclk ratio for 24G 
	  return_value += pma_cfg_code(ch_num, 0x0005, 0x00A5);
/*
  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
	
//b.	rx bit/refclk ratio for 24G
   return_value += pma_cfg_code(ch_num, 0x0006, 0x00A5);
/*
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
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

int HSSI_25GPTPFEC_TO_9P8CPRI(int port_num){

	int return_value = 0;
	int ch_num = 0;
	ch_num = get_ch_num(port_num);
	
	unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
	unsigned long ehip_reconfig_base_addr = (((ch_num+1) << 21) + EHIP_BASE_ADDRESS);
	unsigned long xcvr_pma_base_addr = (((ch_num+1) << 21) + PMA_BASE_ADDRESS);
	
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
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEF);
	wdata0 = ((rdata0>>0) & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata0);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	// PMA analog reset
	pma_analog_reset(ch_num);

	
//5  ============================ PMA CONFIG_1(Reconfig to CPRI 9p8g) ===================================
		
	//a.	AIB CLOCK1 & AIB CLOCK2 Select
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x322);
	wdata0 = (rdata0 & 0xFFFFFFF0) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x322, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata0 = (rdata0 & 0xFFFFFF80) | 0x44;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x31A);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x1C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x31A, wdata0);
	
	//Set cfg_rx_bit_counter 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata0 = (rdata0 & 0xFFFFFFC0) | 0x3F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x315);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x315, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata0 = (rdata0 & 0xFFFFFFC0) | 0x14;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFF03) | 0x14;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x30D, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata0 = (rdata0 & 0xFFFFFFC1) | 0x2A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x301);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x5E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x301, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xF2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x300);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x300, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata0 = (rdata0 & 0xFFFFFFFD) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x6;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x48;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0C) | 0xC2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFF48) | 0x83;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF85) | 0x68;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xE);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xE, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xB);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xB, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x9);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x9, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x11);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x11, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x10);
	wdata0 = (rdata0 & 0xFFFFFF20) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x10, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x12);
	wdata0 = (rdata0 & 0xFFFFFF83) | 0x08;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x12, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x13);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x13, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x8);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x8, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFA3) | 0x0C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xC);
	wdata0 = (rdata0 & 0xFFFFFF8F) | 0x50;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xC, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x17);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x30;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x17, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x218);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x218, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21C);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21C, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x227);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x30;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x227, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x226);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x226, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x225);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x225, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21B);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x47;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21B, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x220);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x220, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata0 = (rdata0 & 0xFFFFFF9F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x208);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x208, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x20B);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x20B, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x214);
	wdata0 = (rdata0 & 0xFFFFFFFC) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x214, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x215);
	wdata0 = (rdata0 & 0xFFFFFF5F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x215, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x210);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x210, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32E);
	wdata0 = (rdata0 & 0xFFFFFFE7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32E, wdata0);

//	TX REFCLK RATIO
return_value += pma_cfg_code(ch_num, 0x0005, 0x0040);
/*
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x40);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
	*/
//RX REFCLK RATIO

return_value += pma_cfg_code(ch_num, 0x0006, 0x0040);
/*	IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x40);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
	 // set PMA tx/rx width mode , 32bits
	tx_rx_width_mode (ch_num, 0x11);


//6 ============================ EHIP CONFIG ===================================
	
//a.	TX DATA PATH MUX

	rdata0 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x7;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata0);
	
//b.	RX DATA PATH MUX
	rdata0 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x7;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata0);

//5 ============================ 	CPRI SOFT CONFIG (cprisoft_base_addr)  ============================ 
//	rdata0 = IORD(ehip_reconfig_base_addr, 0x0);
//	wdata0 = (rdata0 & 0xE0) | 0x6;
//	IOWR(ehip_reconfig_base_addr, 0x0, wdata0);


//6  ============================ PMA CONFIG_2===================================
		
	// rx phaseslip to change the o_rx_fifo_clk_phase
	rx_phase_slip (ch_num);

//7. serdes enable
	serdes_enable(ch_num);
	
//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

int HSSI_9P8CPRI_TO_25GPTPFEC(int port_num,int rsfec_port_num){

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
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEE);
	wdata0 = (rdata0 & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata0);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	// PMA analog reset
	pma_analog_reset(ch_num);

//4  ============================ RS-FEC CONFIG===================================
		
	//a.	change FEC mode to CPRI 
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x4C);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x4C,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x48);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x48,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x44);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x44,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x40);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x40,wdata0);
		
	}
	
		
	//Set rsfec_top_clk_cfg
	rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);
	
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		wdata0 = (rdata0 & 0xFFFFFFFB) | 0x4;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		wdata0 = (rdata0 & 0xFFFFFFFD) | 0x2;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else{
		wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	
	//Set rsfec_top_tx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	
	//Set rsfec_top_rx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	
	
//5  ============================ PMA CONFIG_1 (Reconfig to 25G+PTP+RSFEC) ===================================
		
	//a.	AIB CLOCK1 & AIB CLOCK2 Select
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x322);
	wdata0 = (rdata0 & 0xFFFFFFF0) | 0x9;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x322, wdata0);
	
	//b.	RX FIFO STOP READ & RX FIFO PEMPTY
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata0 = (rdata0 & 0xFFFFFF80) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata0);
	
	//c.	RX FIFO POWER MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x31A);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x0C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x31A, wdata0);
	
	//d.	RX FIFO FULL Threshold
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata0 = (rdata0 & 0xFFFFFFC0) | 0x0F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata0);
	
	//e.	RX FIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x315);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x315, wdata0);
	
	//f.	RX FIFO PFULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata0 = (rdata0 & 0xFFFFFFC0) | 0xA;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata0);
	
	//g.	TX AIB CLK1 SEL & TX AIB CLK2 SEL & TX FIFO RD CLK SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFF03) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x30D, wdata0);
	
	//h.	TX FIFO STOP RD & TX FIFO STOP WR
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0x00;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata0);
	
	//i.	TX GB TX IDWIDTH & TX GB TX ODWIDTH
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata0 = (rdata0 & 0xFFFFFFC1) | 0x8;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata0);
	
	//j.	TX PHCOMP RD SEL & TX TXFIFO FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x301);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x6E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x301, wdata0);
	
	//k.	TXFIFO POWER MODE & TX TXFIFO PFULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x6A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata0);
	
	//l.	TX TXFIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x300);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x300, wdata0);
	
	//m.	DCC CSR EN FSM
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata0 = (rdata0 & 0xFFFFFFFD) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata0);
	
	//n.	RB CONT CAL & RB DCC BYP 7 RB DCC EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata0);
	
	//o.	RX BIT COUNTER ROLLOVER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	//p.	RX BIT COUNTER ROLLOVER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x48;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	//q.	RX BIT COUNTER ROLLOVER & SEL BIT COUNTER ADDER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0C) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);
	
	//r.	RXBIT CONTR PMA
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);
	
	//s.	EN DIRECT TX & EN FEC D2 TX & EN TX GBX & TX ML SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFF48) | 0x24;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	//t.	EN FIFO RD RX & RX FIFO CLK SEL & RX ML SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF85) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	//u.	RX GB ODWIDTH
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xE);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xE, wdata0);
	
	//v.	RX SH LOCATION
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xB);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xB, wdata0);
	
	//w.	RX TAG SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x9);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x9, wdata0);
	
	//x.	RXFIFO AE THLD
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x11);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x11, wdata0);
	
	//y.	RXFIFO AE THLD & RX FIFO E THLD
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x10);
	wdata0 = (rdata0 & 0xFFFFFF20) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x10, wdata0);
	
	//z.	RXFIFO AF THLD
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x12);
	wdata0 = (rdata0 & 0xFFFFFF83) | 0x50;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x12, wdata0);
	
	//aa.	RXFIFO RD EMPTY & RXFIFO WR FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x13);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x13, wdata0);
	
	//bb.	SH LOCATION
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x8);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x8, wdata0);
	
	//cc.	TX CLK DP SEL & TX DATA IN SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFA3) | 0x44;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	//dd.	TX GB IDWIDTH
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xC);
	wdata0 = (rdata0 & 0xFFFFFF8F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xC, wdata0);
	
	//ee.	TXFIFO PH COMP
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x17);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x17, wdata0);
	
	//ff.	RX DATAPATH MAPPING MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x218);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x218, wdata0);
	
	//gg.	RX FIFO DOUBLE WRITE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21C);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21C, wdata0);
	
	//hh.	RD CLK SCG EN & WR CLK SCG EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x227);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x227, wdata0);
	
	//ii.	RX FIFO RD CLK SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x226);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x226, wdata0);
	
	//jj.	RX FIFO WR CLK SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x225);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x225, wdata0);
	
	//kk.	RX PHCOMP RD SEL & RX RXFIFO FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21B);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x6E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21B, wdata0);
	
	//ll.	RX FIFO POWER MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x220);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x220, wdata0);
	
	//mm.	RX RXFIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata0 = (rdata0 & 0xFFFFFF9F) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata0);
	
	//nn.	TX DATAPATH MAPPING MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x208);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x208, wdata0);
	
	//oo.	TX FIFO DOUBLE READ
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x20B);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x20B, wdata0);
	
	//pp.	TX FIFO RD CLK SCG EN & TX FIFO RD CLK SEL & TX FIFO WR CLK SCG EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x214);
	wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x214, wdata0);
	
	//qq.	HRDRST ALIGN BYPASS & HRDRST DCD CAL DONE BYPASS
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x215);
	wdata0 = (rdata0 & 0xFFFFFF5F) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x215, wdata0);
	
	//rr.	TX TX FIFO POWER MODE & TX WORD ALIGN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x210);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x7;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x210, wdata0);
	
	//ss.	TX AIB TX DCC BYP & TX AIB TX DCC EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32E);
	wdata0 = (rdata0 & 0xFFFFFFE7) | 0x18;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32E, wdata0);
	
//tt.	TX REFCLK RATIO
  return_value += pma_cfg_code(ch_num, 0x0005, 0x00A5);

/*  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/	
//uu.	RX REFCLK RATIO
	  return_value += pma_cfg_code(ch_num, 0x0006, 0x00A5);

  /*
  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
	// set PMA tx/rx width mode , 32bits
tx_rx_width_mode (ch_num, 0x55);



//6 ============================ EHIP CONFIG ===================================
	
	//a.	TX DATA PATH MUX
	rdata0 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata0);
	
	//b.	RX DATA PATH MUX
	rdata0 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata0);
	
	//d.	phy_ehip_mode_muxes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFFC7) | 0x0;
	IOWR(ehip_reconfig_base_addr, 0x30D, wdata0);
	
  //c.	phy_ehip_pcs_modes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
	wdata0 = (rdata0 & 0xFFFFFDEF) | 0x10;
	IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);
	
	//e.	txmac_ehip_cfg
	rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
	wdata0 = (rdata0 & 0xFFFFFE07) | 0xE0;
	IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);


//6  ============================ PMA CONFIG_2===================================
		
	// rx phaseslip to change the o_rx_fifo_clk_phase
rx_phase_slip (ch_num);

//7. serdes enable
	serdes_enable(ch_num);
	
//8. Reset AIB  Assert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0xAA;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);
	
//9.	Reset AIB Deassert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0x0;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);

//10. wait for tx/rx_transfer_ready
  do {
       rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0x82);
  } while ((rdata0 & 0x03) != 0x03);
	
	
//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

int HSSI_25GPTPFEC_TO_4P9CPRI(int port_num){

	int return_value = 0;
	int ch_num = 0;
	ch_num = get_ch_num(port_num);
	
	unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
	unsigned long ehip_reconfig_base_addr = (((ch_num+1) << 21) + EHIP_BASE_ADDRESS);
	unsigned long xcvr_pma_base_addr = (((ch_num+1) << 21) + PMA_BASE_ADDRESS);
	
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
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEF);
	wdata0 = ((rdata0 >> 0) & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata0);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	
	// PMA analog reset
	pma_analog_reset(ch_num);

//5 ============================ 	CPRI SOFT CONFIG (cprisoft_base_addr)  ============================ 
//	rdata0 = IORD(ehip_reconfig_base_addr, 0x0);
//	wdata0 = (rdata0 & 0xE0) | 0x4;
//	IOWR(ehip_reconfig_base_addr, 0x0, wdata0);


//4  ============================ PMA CONFIG_1(Reconfig to CPRI 4p9g) ===================================
		
	//a.	AIB CLOCK1 & AIB CLOCK2 Select
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x322);
	wdata0 = (rdata0 & 0xFFFFFFF0) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x322, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xC5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x31A);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x1C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x31A, wdata0);
	
	//Set cfg_rx_bit_counter 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x3F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x315);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x315, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xD9;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFF03) | 0x14;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x30D, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xE4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x2B;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x301);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x5E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x301, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xF4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x300);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x300, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x48;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0C) | 0xC2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFF48) | 0x83;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF85) | 0x68;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xE);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xE, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xB);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xB, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x9);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x9, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x11);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x11, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x10);
	wdata0 = (rdata0 & 0xFFFFFF20) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x10, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x12);
	wdata0 = (rdata0 & 0xFFFFFF83) | 0x08;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x12, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x13);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x13, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x8);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x8, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFA3) | 0x0C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xC);
	wdata0 = (rdata0 & 0xFFFFFF8F) | 0x50;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xC, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x17);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x30;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x17, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x218);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x218, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21C);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21C, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x227);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x30;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x227, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x226);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x226, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x225);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x225, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21B);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x47;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21B, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x220);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x220, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x208);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x208, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x20B);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x20B, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x214);
	wdata0 = (rdata0 & 0xFFFFFFFC) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x214, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x215);
	wdata0 = (rdata0 & 0xFFFFFF5F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x215, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x210);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x210, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32E);
	wdata0 = (rdata0 & 0xFFFFFFE7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32E, wdata0);
	
	//tt.	RX FIFO FULL Threshold
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x231);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x231, wdata0);
	
	//uu.	RX FIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x233);
	wdata0 = (rdata0 & 0xFFFFFFC0) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x233, wdata0);
	
	//vv.	HIP OSC CLK SCG EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x309);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x309, wdata0);
	
	//ww.	TX PHCOMP RD SEL & TX TXFIFO FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x310);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x19;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x310, wdata0);
	
	//xx.	TXFIFO POWER MODE & TX TXFIFO PFULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x311);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x311, wdata0);
	
	//yy.	RX BIT COUNTER ROLLOVER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x318);
	wdata0 = (rdata0 & 0xFFFFFFFC) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x318, wdata0);
	
	//zz.	RX BIT COUNTER ROLLOVER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x320);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x11;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x320, wdata0);
	
	//aaa.	RX BIT COUNTER ROLLOVER & SEL BIT COUNTER ADDER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32C);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32C, wdata0);

//	bbb.	TX REFCLK RATIO

return_value += pma_cfg_code(ch_num, 0x0005, 0x0020);
/*	IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x20);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
	*/
//ccc.	RX REFCLK RATIO

return_value += pma_cfg_code(ch_num, 0x0006, 0x0020);
/*	IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x20);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
	*/
	// set PMA tx/rx width mode , 32bits
tx_rx_width_mode (ch_num, 0x11);


//6 ============================ EHIP CONFIG ===================================
	
//a.	TX DATA PATH MUX

	rdata0 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x7;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata0);
	
//b.	RX DATA PATH MUX
	rdata0 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x7;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata0);



//6  ============================ PMA CONFIG_2===================================
		
	
//  Set rx phaseslip to change the o_rx_fifo_clk_phase
rx_phase_slip (ch_num);

//7. serdes enable
	serdes_enable(ch_num);
	
//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

int HSSI_4P9CPRI_TO_25GPTPFEC(int port_num,int rsfec_port_num){

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
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEE);
	wdata0 = (rdata0 & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata0);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	// PMA analog reset
	pma_analog_reset(ch_num);

//4  ============================ RS-FEC CONFIG===================================
		
	//a.	change FEC mode to CPRI 
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x4C);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x4C,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x48);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x48,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x44);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x44,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x40);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x40,wdata0);
		
	}
	
		
	//Set rsfec_top_clk_cfg
	rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);
	
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		wdata0 = (rdata0 & 0xFFFFFFFB) | 0x4;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		wdata0 = (rdata0 & 0xFFFFFFFD) | 0x2;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else{
		wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	
	//Set rsfec_top_tx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	
	//Set rsfec_top_rx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	
	
//5  ============================ PMA CONFIG_1 (Reconfig to 25G+PTP+RSFEC) ===================================
		
	//a.	r_aibdprio0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x231);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x231, wdata0);
	
	//b.	r_aibdprio0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x233);
	wdata0 = (rdata0 & 0xFFFFFFC0) | 0x38;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x233, wdata0);
	
	//c.	hssi_pldadapt_tx_308
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x309);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x23;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x309, wdata0);
	
	//d.	hssi_pldadapt_tx_310
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x310);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x1A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x310, wdata0);
	
	//e.	hssi_pldadapt_tx_310
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x311);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x311, wdata0);
	
	//f.	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x318);
	wdata0 = (rdata0 & 0xFFFFFFFC) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x318, wdata0);
	
	//g.	hssi_pldadapt_tx_320
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x320);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x12;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x320, wdata0);
	
	//h.	hssi_pldadapt_tx_320
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32C);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32C, wdata0);
		
	//i.	AIB CLOCK1 & AIB CLOCK2 Select
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x322);
	wdata0 = (rdata0 & 0xFFFFFFF0) | 0x9;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x322, wdata0);
	
	//j.	RX FIFO STOP READ & RX FIFO PEMPTY
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata0 = (rdata0 & 0xFFFFFFB2) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata0);
	
	//k.	RX FIFO POWER MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x31A);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x0C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x31A, wdata0);
	
	//l.	RX FIFO FULL Threshold
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x4F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata0);
	
	//m.	RX FIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x315);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x315, wdata0);
	
	//n.	RX FIFO PFULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata0 = (rdata0 & 0xFFFFFFEE) | 0x02;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata0);
	
	//o.	TX AIB CLK1 SEL & TX AIB CLK2 SEL & TX FIFO RD CLK SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFF03) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x30D, wdata0);
	
	//p.	TX FIFO STOP RD & TX FIFO STOP WR
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata0 = (rdata0 & 0xFFFFFF20) | 0x02;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata0);
	
	//q.	TX GB TX IDWIDTH & TX GB TX ODWIDTH
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata0 = (rdata0 & 0xFFFFFF09) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata0);
	
	//r.	TX PHCOMP RD SEL & TX TXFIFO FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x301);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x6E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x301, wdata0);
	
	//s.	TXFIFO POWER MODE & TX TXFIFO PFULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x6A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata0);
	
	//t.	TX TXFIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x300);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x300, wdata0);
	
	//u.	DCC CSR EN FSM
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata0 = (rdata0 & 0xFFFFFFFD) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata0);
	
	//v.	RB CONT CAL & RB DCC BYP 7 RB DCC EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata0);
	
	//w.	RX BIT COUNTER ROLLOVER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	//x.	RX BIT COUNTER ROLLOVER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x48;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	//y.	RX BIT COUNTER ROLLOVER & SEL BIT COUNTER ADDER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0C) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);
	
	//z.	RXBIT CONTR PMA
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);
	
	//aa.	EN DIRECT TX & EN FEC D2 TX & EN TX GBX & TX ML SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFF48) | 0x24;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	//bb.	EN FIFO RD RX & RX FIFO CLK SEL & RX ML SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF85) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	//cc.	RX GB ODWIDTH
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xE);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xE, wdata0);
	
	//dd.	RX SH LOCATION
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xB);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xB, wdata0);
	
	//ee.	RX TAG SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x9);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x9, wdata0);
	
	//ff.	RXFIFO AE THLD
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x11);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x11, wdata0);
	
	//gg.	RXFIFO AE THLD & RX FIFO E THLD
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x10);
	wdata0 = (rdata0 & 0xFFFFFF20) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x10, wdata0);
	
	//hh.	RXFIFO AF THLD
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x12);
	wdata0 = (rdata0 & 0xFFFFFF83) | 0x50;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x12, wdata0);
	
	//ii.	RXFIFO RD EMPTY & RXFIFO WR FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x13);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x13, wdata0);
	
	//jj.	SH LOCATION
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x8);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x8, wdata0);
	
	//kk.	TX CLK DP SEL & TX DATA IN SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFA3) | 0x44;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	//ll.	TX GB IDWIDTH
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xC);
	wdata0 = (rdata0 & 0xFFFFFF8F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xC, wdata0);
	
	//mm.	TXFIFO PH COMP
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x17);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x17, wdata0);
	
	//nn.	RX DATAPATH MAPPING MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x218);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x218, wdata0);
	
	//oo.	RX FIFO DOUBLE WRITE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21C);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21C, wdata0);
	
	//pp.	RD CLK SCG EN & WR CLK SCG EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x227);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x227, wdata0);
	
	//qq.	RX FIFO RD CLK SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x226);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x226, wdata0);
	
	//rr.	RX FIFO WR CLK SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x225);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x225, wdata0);
	
	//ss.	RX PHCOMP RD SEL & RX RXFIFO FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21B);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x6E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21B, wdata0);
	
	//tt.	RX FIFO POWER MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x220);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x220, wdata0);
	
	//uu.	RX RXFIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata0);
	
	//vv.	TX DATAPATH MAPPING MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x208);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x208, wdata0);
	
	//ww.	TX FIFO DOUBLE READ
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x20B);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x20B, wdata0);
	
	//xx.	TX FIFO RD CLK SCG EN & TX FIFO RD CLK SEL & TX FIFO WR CLK SCG EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x214);
	wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x214, wdata0);
	
	//yy.	HRDRST ALIGN BYPASS & HRDRST DCD CAL DONE BYPASS
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x215);
	wdata0 = (rdata0 & 0xFFFFFF5F) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x215, wdata0);
	
	//zz.	TX TX FIFO POWER MODE & TX WORD ALIGN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x210);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x7;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x210, wdata0);
	
	//aaa.	TX AIB TX DCC BYP & TX AIB TX DCC EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32E);
	wdata0 = (rdata0 & 0xFFFFFFE7) | 0x18;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32E, wdata0);


//6 ============================ EHIP CONFIG ===================================
	
	//a.	TX DATA PATH MUX
	rdata0 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata0);
	
	//b.	RX DATA PATH MUX
	rdata0 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata0);
	
	//c.	phy_ehip_pcs_modes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
	wdata0 = (rdata0 & 0xFFFFFDEF) | 0x10;
	IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);
	
	//d.	phy_ehip_mode_muxes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFFC7) | 0x0;
	IOWR(ehip_reconfig_base_addr, 0x30D, wdata0);
	
	//e.	txmac_ehip_cfg
	rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
	wdata0 = (rdata0 & 0xFFFFFE07) | 0xE0;
	IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);


//6  ============================ PMA CONFIG_2===================================
		
//a.	TX REFCLK RATIO
  return_value += pma_cfg_code(ch_num, 0x0005, 0x00A5);
/*
  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
	*/
//b.	RX REFCLK RATIO
	  return_value += pma_cfg_code(ch_num, 0x0006, 0x00A5);
/*
  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
//c.	set PMA tx/rx width mode , 32bits
tx_rx_width_mode (ch_num, 0x55);

	// rx phaseslip to change the o_rx_fifo_clk_phase
rx_phase_slip (ch_num);

//7. serdes enable
	serdes_enable(ch_num);
	
//8. Reset AIB  Assert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0xAA;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);
	
//9.	Reset AIB  Deassert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0x0;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);

//10. wait for tx/rx_transfer_ready
  do {
       rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0x82);
  } while ((rdata0 & 0x03) != 0x03);
	
	
//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

int HSSI_25GPTPFEC_TO_2P4CPRI(int port_num){

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
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEF);
	wdata0 = ((rdata0 >> 0) & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata0);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	// PMA analog reset
	pma_analog_reset(ch_num);

//5 ============================ 	CPRI SOFT CONFIG (cprisoft_base_addr)  ============================ 
//	rdata0 = IORD(ehip_reconfig_base_addr, 0x0);
//	wdata0 = (rdata0 & 0xE0) | 0x2;
//	IOWR(ehip_reconfig_base_addr, 0x0, wdata0);


//4  ============================ PMA CONFIG_1(Reconfig to CPRI 4p9g) ===================================
		
	//a.	AIB CLOCK1 & AIB CLOCK2 Select
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x322);
	wdata0 = (rdata0 & 0xFFFFFFF0) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x322, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xC5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x31A);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x1C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x31A, wdata0);
	
	//Set cfg_rx_bit_counter 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x3F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x315);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x315, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xD9;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFF03) | 0x14;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x30D, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xE4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x2B;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x301);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x5E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x301, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xF4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x300);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x300, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x48;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0C) | 0xC2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFF48) | 0x83;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF85) | 0x68;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xE);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xE, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xB);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xB, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x9);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x9, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x11);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x11, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x10);
	wdata0 = (rdata0 & 0xFFFFFF20) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x10, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x12);
	wdata0 = (rdata0 & 0xFFFFFF83) | 0x08;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x12, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x13);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x13, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x8);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x8, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFA3) | 0x0C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xC);
	wdata0 = (rdata0 & 0xFFFFFF8F) | 0x50;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xC, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x17);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x30;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x17, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x218);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x218, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21C);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21C, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x227);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x30;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x227, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x226);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x226, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x225);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x225, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21B);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x47;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21B, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x220);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x220, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x208);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x208, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x20B);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x20B, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x214);
	wdata0 = (rdata0 & 0xFFFFFFFC) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x214, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x215);
	wdata0 = (rdata0 & 0xFFFFFF5F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x215, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x210);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x210, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32E);
	wdata0 = (rdata0 & 0xFFFFFFE7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32E, wdata0);
	
	//tt.	RX FIFO FULL Threshold
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x231);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x231, wdata0);
	
	//uu.	RX FIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x233);
	wdata0 = (rdata0 & 0xFFFFFFC0) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x233, wdata0);
	
	//vv.	HIP OSC CLK SCG EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x309);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x309, wdata0);
	
	//ww.	TX PHCOMP RD SEL & TX TXFIFO FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x310);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x19;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x310, wdata0);
	
	//xx.	TXFIFO POWER MODE & TX TXFIFO PFULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x311);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x311, wdata0);
	
	//yy.	RX BIT COUNTER ROLLOVER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x318);
	wdata0 = (rdata0 & 0xFFFFFFFC) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x318, wdata0);
	
	//zz.	RX BIT COUNTER ROLLOVER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x320);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x11;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x320, wdata0);
	
	//aaa.	RX BIT COUNTER ROLLOVER & SEL BIT COUNTER ADDER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32C);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32C, wdata0);

//	bbb.	TX REFCLK RATIO

return_value += pma_cfg_code(ch_num, 0x0005, 0x0010);
/*	IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x10);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
	*/
//ccc.	RX REFCLK RATIO

return_value += pma_cfg_code(ch_num, 0x0006, 0x0010);
/*	IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x10);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
	*/
//ddd.	set PMA tx/rx width mode , 20bits
tx_rx_width_mode (ch_num, 0x11);


//6 ============================ EHIP CONFIG ===================================
	
//a.	TX DATA PATH MUX

	rdata0 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x7;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata0);
	
//b.	RX DATA PATH MUX
	rdata0 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x7;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata0);



//6  ============================ PMA CONFIG_2===================================
		
	
//  Set rx phaseslip to change the o_rx_fifo_clk_phase
rx_phase_slip (ch_num);

//7. serdes enable
	serdes_enable(ch_num);
	
//8.	Reset AIB  Assert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0xAA;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);	

//9.	Reset AIB  Deassert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0x0;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);	

//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

int HSSI_2P4CPRI_TO_25GPTPFEC(int port_num,int rsfec_port_num){

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
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEE);
	wdata0 = (rdata0 & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata0);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	// PMA analog reset
	pma_analog_reset(ch_num);

//4  ============================ RS-FEC CONFIG===================================
		
	//a.	change FEC mode to CPRI 
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x4C);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x4C,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x48);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x48,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x44);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x44,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x40);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x40,wdata0);
		
	}
	
		
	//Set rsfec_top_clk_cfg
	rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);
	
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		wdata0 = (rdata0 & 0xFFFFFFFB) | 0x4;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		wdata0 = (rdata0 & 0xFFFFFFFD) | 0x2;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else{
		wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	
	//Set rsfec_top_tx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	
	//Set rsfec_top_rx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	
	
//5  ============================ PMA CONFIG_1 (Reconfig to 25G+PTP+RSFEC) ===================================
		
	//a.	r_aibdprio0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x231);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x231, wdata0);
	
	//b.	r_aibdprio0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x233);
	wdata0 = (rdata0 & 0xFFFFFFC0) | 0x38;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x233, wdata0);
	
	//c.	hssi_pldadapt_tx_309
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x309);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x23;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x309, wdata0);
	
	//d.	hssi_pldadapt_tx_310
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x310);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x1A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x310, wdata0);
	
	//e.	hssi_pldadapt_tx_310
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x311);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x311, wdata0);
	
	//f.	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x318);
	wdata0 = (rdata0 & 0xFFFFFFFC) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x318, wdata0);
	
	//g.	hssi_pldadapt_tx_320
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x320);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x12;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x320, wdata0);
	
	//h.	hssi_pldadapt_tx_320
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32C);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32C, wdata0);
		
	//i.	AIB CLOCK1 & AIB CLOCK2 Select
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x322);
	wdata0 = (rdata0 & 0xFFFFFFF0) | 0x9;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x322, wdata0);
	
	//j.	RX FIFO STOP READ & RX FIFO PEMPTY
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata0 = (rdata0 & 0xFFFFFFB2) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata0);
	
	//k.	RX FIFO POWER MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x31A);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x0C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x31A, wdata0);
	
	//l.	RX FIFO FULL Threshold
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x4F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata0);
	
	//m.	RX FIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x315);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x315, wdata0);
	
	//n.	RX FIFO PFULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata0 = (rdata0 & 0xFFFFFFEE) | 0x02;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata0);
	
	//o.	TX AIB CLK1 SEL & TX AIB CLK2 SEL & TX FIFO RD CLK SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFF03) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x30D, wdata0);
	
	//p.	TX FIFO STOP RD & TX FIFO STOP WR
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata0 = (rdata0 & 0xFFFFFF20) | 0x02;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata0);
	
	//q.	TX GB TX IDWIDTH & TX GB TX ODWIDTH
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata0 = (rdata0 & 0xFFFFFF09) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata0);
	
	//r.	TX PHCOMP RD SEL & TX TXFIFO FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x301);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x6E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x301, wdata0);
	
	//s.	TXFIFO POWER MODE & TX TXFIFO PFULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x6A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata0);
	
	//t.	TX TXFIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x300);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x300, wdata0);
	
	//u.	DCC CSR EN FSM
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata0 = (rdata0 & 0xFFFFFFFD) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata0);
	
	//v.	RB CONT CAL & RB DCC BYP 7 RB DCC EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata0);
	
	//w.	RX BIT COUNTER ROLLOVER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	//x.	RX BIT COUNTER ROLLOVER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x48;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	//y.	RX BIT COUNTER ROLLOVER & SEL BIT COUNTER ADDER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0C) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);
	
	//z.	RXBIT CONTR PMA
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);
	
	//aa.	EN DIRECT TX & EN FEC D2 TX & EN TX GBX & TX ML SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFF48) | 0x24;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	//bb.	EN FIFO RD RX & RX FIFO CLK SEL & RX ML SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF85) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	//cc.	RX GB ODWIDTH
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xE);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xE, wdata0);
	
	//dd.	RX SH LOCATION
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xB);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xB, wdata0);
	
	//ee.	RX TAG SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x9);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x9, wdata0);
	
	//ff.	RXFIFO AE THLD
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x11);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x11, wdata0);
	
	//gg.	RXFIFO AE THLD & RX FIFO E THLD
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x10);
	wdata0 = (rdata0 & 0xFFFFFF20) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x10, wdata0);
	
	//hh.	RXFIFO AF THLD
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x12);
	wdata0 = (rdata0 & 0xFFFFFF83) | 0x50;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x12, wdata0);
	
	//ii.	RXFIFO RD EMPTY & RXFIFO WR FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x13);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x13, wdata0);
	
	//jj.	SH LOCATION
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x8);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x8, wdata0);
	
	//kk.	TX CLK DP SEL & TX DATA IN SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFA3) | 0x44;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	//ll.	TX GB IDWIDTH
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xC);
	wdata0 = (rdata0 & 0xFFFFFF8F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xC, wdata0);
	
	//mm.	TXFIFO PH COMP
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x17);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x17, wdata0);
	
	//nn.	RX DATAPATH MAPPING MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x218);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x218, wdata0);
	
	//oo.	RX FIFO DOUBLE WRITE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21C);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21C, wdata0);
	
	//pp.	RD CLK SCG EN & WR CLK SCG EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x227);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x227, wdata0);
	
	//qq.	RX FIFO RD CLK SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x226);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x226, wdata0);
	
	//rr.	RX FIFO WR CLK SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x225);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x225, wdata0);
	
	//ss.	RX PHCOMP RD SEL & RX RXFIFO FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21B);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x6E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21B, wdata0);
	
	//tt.	RX FIFO POWER MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x220);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x220, wdata0);
	
	//uu.	RX RXFIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata0);
	
	//vv.	TX DATAPATH MAPPING MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x208);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x208, wdata0);
	
	//ww.	TX FIFO DOUBLE READ
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x20B);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x20B, wdata0);
	
	//xx.	TX FIFO RD CLK SCG EN & TX FIFO RD CLK SEL & TX FIFO WR CLK SCG EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x214);
	wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x214, wdata0);
	
	//yy.	HRDRST ALIGN BYPASS & HRDRST DCD CAL DONE BYPASS
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x215);
	wdata0 = (rdata0 & 0xFFFFFF5F) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x215, wdata0);
	
	//zz.	TX TX FIFO POWER MODE & TX WORD ALIGN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x210);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x7;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x210, wdata0);
	
	//aaa.	TX AIB TX DCC BYP & TX AIB TX DCC EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32E);
	wdata0 = (rdata0 & 0xFFFFFFE7) | 0x18;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32E, wdata0);


//6 ============================ EHIP CONFIG ===================================
	
	//a.	TX DATA PATH MUX
	rdata0 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata0);
	
	//b.	RX DATA PATH MUX
	rdata0 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata0);
	
	//d.	phy_ehip_mode_muxes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFFC7) | 0x0;
	IOWR(ehip_reconfig_base_addr, 0x30D, wdata0);
	
	//c.	phy_ehip_pcs_modes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
	wdata0 = (rdata0 & 0xFFFFFDEF) | 0x10;
	IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);
	
  //e.	txmac_ehip_cfg
	rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
	wdata0 = (rdata0 & 0xFFFFFE07) | 0xE0;
	IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);


//6  ============================ PMA CONFIG_2===================================
		
//a.	TX REFCLK RATIO
  return_value += pma_cfg_code(ch_num, 0x0005, 0x00A5);
/*
  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
	*/
//b.	RX REFCLK RATIO

  return_value += pma_cfg_code(ch_num, 0x0006, 0x00A5);
 /* IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
//c.	set PMA tx/rx width mode , 32bits
tx_rx_width_mode (ch_num, 0x55);

	// rx phaseslip to change the o_rx_fifo_clk_phase
rx_phase_slip (ch_num);

//7. serdes enable
	serdes_enable(ch_num);
	
//8. Reset AIB  Assert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0xAA;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);
	
//9.	Reset AIB  Deassert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0x0;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);

//10. wait for tx/rx_transfer_ready
  do {
       rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0x82);
  } while ((rdata0 & 0x03) != 0x03);

	
	
//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

int HSSI_24GCPRIFEC_TO_10GCPRI(int port_num,int rsfec_port_num){

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

//4  ============================ RS-FEC CONFIG===================================
		
	//change FEC mode to CPRI 
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x4C);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x4C,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x48);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x48,wdata0);

	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x44);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x44,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x40);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x40,wdata0);
		
	}

		
	//Set rsfec_top_clk_cfg
	rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);
	
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		wdata0 = (rdata0 & 0xFFFFFFFB) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		wdata0 = (rdata0 & 0xFFFFFFFD) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else{
		wdata0 = (rdata0 & 0xFFFFFFFE) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	
	//Set rsfec_top_tx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x60;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x06;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x60;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x06;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	
	//Set rsfec_top_rx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	

//5  ============================ PMA CONFIG_1===================================
		
	//Set xcvrif_ctrl0 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF9F) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	//Set cfg_rx_bit_counter 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0F) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x8A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);
	

//6 ============================ EHIP CONFIG ===================================
	
//a.	switch ehip_mode
//i.	phy_ehip_pcs_modes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
	wdata0 = (rdata0 & 0xFFFFFDE7) | 0x200;
	IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);

//b.	txmac_ehip_cfg
	rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
	wdata0 = (rdata0 & 0xFFFFFE07) | 0x1C8;
	IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);

// ============================ 	CPRI SOFT CONFIG (cprisoft_base_addr)  ============================ 
//	rdata0 = IORD(ehip_reconfig_base_addr, 0x0);
//	wdata0 = (rdata0 & 0xE0) | 0x2;
//	IOWR(ehip_reconfig_base_addr, 0x0, wdata0);
	


//6  ============================ PMA CONFIG_2===================================
		
//a.	tx bit/refclk ratio for 10G (Based on 184.32MHz ref clk)

return_value += pma_cfg_code(ch_num, 0x0005, 0x0037);
/*  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x37);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
	
//b.	rx bit/refclk ratio for 10G (Based on 184.32MHz ref clk)

return_value += pma_cfg_code(ch_num, 0x0006, 0x0037);
/*IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x37);//0x84[7:0]: Set the data rate to reference clock frequency ratio
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
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

int HSSI_10GCPRI_TO_9P8CPRI(int port_num){

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
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEF);
	wdata0 = ((rdata0 >> 0) & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata0);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	// PMA analog reset
	pma_analog_reset(ch_num);

	
//5  ============================ PMA CONFIG_1(Reconfig to CPRI 9p8g) ===================================
		
	//a.	AIB CLOCK1 & AIB CLOCK2 Select
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x322);
	wdata0 = (rdata0 & 0xFFFFFFF0) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x322, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata0 = (rdata0 & 0xFFFFFF80) | 0x44;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x31A);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x1C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x31A, wdata0);
	
	//Set cfg_rx_bit_counter 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata0 = (rdata0 & 0xFFFFFFC0) | 0x3F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x315);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x315, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata0 = (rdata0 & 0xFFFFFFC0) | 0x14;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFF03) | 0x14;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x30D, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata0 = (rdata0 & 0xFFFFFFC1) | 0x2A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x301);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x5E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x301, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xF2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x300);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x300, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata0 = (rdata0 & 0xFFFFFFFD) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x6;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x48;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0C) | 0xC2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFF48) | 0x83;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF85) | 0x68;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xE);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xE, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xB);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xB, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x9);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x9, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x11);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x11, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x10);
	wdata0 = (rdata0 & 0xFFFFFF20) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x10, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x12);
	wdata0 = (rdata0 & 0xFFFFFF83) | 0x08;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x12, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x13);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x13, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x8);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x8, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFA3) | 0x0C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xC);
	wdata0 = (rdata0 & 0xFFFFFF8F) | 0x50;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xC, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x17);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x30;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x17, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x218);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x218, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21C);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21C, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x227);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x30;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x227, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x226);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x226, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x225);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x225, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21B);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x47;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21B, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x220);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x220, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata0 = (rdata0 & 0xFFFFFF9F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x208);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x208, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x20B);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x20B, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x214);
	wdata0 = (rdata0 & 0xFFFFFFFC) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x214, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x215);
	wdata0 = (rdata0 & 0xFFFFFF5F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x215, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x210);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x210, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32E);
	wdata0 = (rdata0 & 0xFFFFFFE7) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32E, wdata0);

//	TX REFCLK RATIO

return_value += pma_cfg_code(ch_num, 0x0005, 0x0040);
/*	IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x40);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
	*/
//RX REFCLK RATIO

return_value += pma_cfg_code(ch_num, 0x0006, 0x0040);
/*	IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x40);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
	// set PMA tx/rx width mode , 32bits
tx_rx_width_mode (ch_num, 0x11);


//6 ============================ EHIP CONFIG ===================================
	
//a.	TX DATA PATH MUX

	rdata0 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x7;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata0);
	
//b.	RX DATA PATH MUX
	rdata0 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x7;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata0);

//5 ============================ 	CPRI SOFT CONFIG (cprisoft_base_addr)  ============================ 
//	rdata0 = IORD(ehip_reconfig_base_addr, 0x0);
//	wdata0 = (rdata0 & 0xE0) | 0x6;
//	IOWR(ehip_reconfig_base_addr, 0x0, wdata0);


//6  ============================ PMA CONFIG_2===================================
		
	// rx phaseslip to change the o_rx_fifo_clk_phase
rx_phase_slip (ch_num);
//7. serdes enable
	serdes_enable(ch_num);

//8. Reset AIB  Assert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0xAA;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);
	
//9.	Reset AIB  Deassert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0x0;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);
	

//10. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

int HSSI_9P8CPRI_TO_4P9CPRI(int port_num){

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
	
	
	
//3 ============================ PMA analog reset ===================================

	pma_analog_reset(ch_num);

//5 ============================ 	CPRI SOFT CONFIG (cprisoft_base_addr)  ============================ 
//	rdata0 = IORD(ehip_reconfig_base_addr, 0x0);
//	wdata0 = (rdata0 & 0xE0) | 0x4;
//	IOWR(ehip_reconfig_base_addr, 0x0, wdata0);


//4  ============================ PMA CONFIG_1(Reconfig to CPRI 4p9g) ===================================
		
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xC5;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata0);

	//Set cfg_rx_bit_counter 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x3F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata0);

	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xD9;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata0);

	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xE4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x2B;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xF4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata0);

	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x231);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x231, wdata0);
	
	//uu.	RX FIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x233);
	wdata0 = (rdata0 & 0xFFFFFFC0) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x233, wdata0);
	
	//vv.	HIP OSC CLK SCG EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x309);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x309, wdata0);
	
	//ww.	TX PHCOMP RD SEL & TX TXFIFO FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x310);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x19;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x310, wdata0);
	
	//xx.	TXFIFO POWER MODE & TX TXFIFO PFULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x311);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x311, wdata0);
	
	//yy.	RX BIT COUNTER ROLLOVER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x318);
	wdata0 = (rdata0 & 0xFFFFFFFC) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x318, wdata0);
	
	//zz.	RX BIT COUNTER ROLLOVER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x320);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x11;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x320, wdata0);
	
	//aaa.	RX BIT COUNTER ROLLOVER & SEL BIT COUNTER ADDER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32C);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32C, wdata0);

//	bbb.	TX REFCLK RATIO

return_value += pma_cfg_code(ch_num, 0x0005, 0x0020);
/*	IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x20);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
	*/
//ccc.	RX REFCLK RATIO

return_value += pma_cfg_code(ch_num, 0x0006, 0x0020);
/*	IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x20);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/	
	// set PMA tx/rx width mode , 32bits
tx_rx_width_mode (ch_num, 0x11);

//  Set rx phaseslip to change the o_rx_fifo_clk_phase
rx_phase_slip (ch_num);


//7. serdes enable
	serdes_enable(ch_num);

//8. Reset AIB  Assert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0xAA;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);
	
//9.	Reset AIB  Deassert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0x0;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);
	

//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

int HSSI_4P9CPRI_TO_2P4CPRI(int port_num){

	int return_value = 0;
	int ch_num = 0;
	ch_num = get_ch_num(port_num);
	
	unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
//	unsigned long xcvr_pma_base_addr = (((ch_num+1) << 21) + PMA_BASE_ADDRESS);
	unsigned long xcvr_pma_capability_base_addr = (((ch_num+1) << 21) + PMA_CAPABILITY_BASE_ADDRESS);
	
	//1. tx/rx asserting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
	IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
	
	//2. serdes disable
	serdes_disable(ch_num);
	
	
	
//3 ============================  PMA analog reset ===================================
	
	pma_analog_reset(ch_num);

//5 ============================ 	CPRI SOFT CONFIG (cprisoft_base_addr)  ============================ 
//	rdata0 = IORD(ehip_reconfig_base_addr, 0x0);
//	wdata0 = (rdata0 & 0xE0) | 0x2;
//	IOWR(ehip_reconfig_base_addr, 0x0, wdata0);


//4  ============================ PMA CONFIG ===================================
		

//	bbb.	TX REFCLK RATIO

return_value += pma_cfg_code(ch_num, 0x0005, 0x0010);
/*	IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x10);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
	*/
//ccc.	RX REFCLK RATIO
return_value += pma_cfg_code(ch_num, 0x0006, 0x0010);
/*	IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x10);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
	*/
//ddd.	set PMA tx/rx width mode , 20bits
tx_rx_width_mode (ch_num, 0x11);

//  Set rx phaseslip to change the o_rx_fifo_clk_phase
rx_phase_slip (ch_num);

//7. serdes enable
	serdes_enable(ch_num);
	
//8.	Reset AIB  Assert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0xAA;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);	

//9.	Reset AIB  Deassert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0x0;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);	

//8. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

int HSSI_2P4CPRI_TO_24GCPRIFEC(int port_num,int rsfec_port_num){

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
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEE);
	wdata0 = ((rdata0>>4) & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata0);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	// PMA analog reset
	pma_analog_reset(ch_num);

//4 ============================ 	CPRI SOFT CONFIG (cprisoft_base_addr)  ============================ 
//	rdata0 = IORD(ehip_reconfig_base_addr, 0x0);
//	wdata0 = (rdata0 & 0xE0) | 0x1B;
//	IOWR(ehip_reconfig_base_addr, 0x0, wdata0);


//5  ============================ RS-FEC CONFIG===================================
	
	//change FEC mode to CPRI 
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x4C);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x03;
		IOWR_8DIRECT(rsfec_base_addr,0x4C,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x48);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x03;
		IOWR_8DIRECT(rsfec_base_addr,0x48,wdata0);

	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x44);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x03;
		IOWR_8DIRECT(rsfec_base_addr,0x44,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x40);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x03;
		IOWR_8DIRECT(rsfec_base_addr,0x40,wdata0);
		
	}
	
	//Set rsfec_top_clk_cfg
	rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);
	
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		wdata0 = (rdata0 & 0xFFFFFFFB) | 0x4;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		wdata0 = (rdata0 & 0xFFFFFFFD) | 0x2;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else{
		wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	
	//Set rsfec_top_tx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	
	//Set rsfec_top_rx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}

//5 ============================ EHIP CONFIG ===================================
	
//a.	switch ehip_mode
	//i.	phy_ehip_pcs_modes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
	wdata0 = (rdata0 & 0xFFFFFDEF) | 0x00;
	IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);
	
	//ii.	phy_ehip_mode_muxes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x08;
	IOWR(ehip_reconfig_base_addr, 0x30D, wdata0);
	
	//iii.	tx_pld_conf
	rdata0 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x02;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata0);
	
	//iv.	rx_pld_conf
	rdata0 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x02;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata0);

//b.	switch ehip_rate
	rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
	wdata0 = (rdata0 & 0xFFFFFE07) | 0x1E0;
	IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);


//6  ============================ PMA CONFIG===================================
		
	//a.	r_aibdprio0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x231);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x231, wdata0);
	
	//b.	r_aibdprio0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x233);
	wdata0 = (rdata0 & 0xFFFFFFC0) | 0x38;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x233, wdata0);
	
	//c.	hssi_pldadapt_tx_309
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x309);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x23;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x309, wdata0);
	
	//d.	hssi_pldadapt_tx_310
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x310);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x1A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x310, wdata0);
	
	//e.	hssi_pldadapt_tx_310
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x311);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x311, wdata0);
	
	//f.	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x318);
	wdata0 = (rdata0 & 0xFFFFFFFC) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x318, wdata0);
	
	//g.	hssi_pldadapt_tx_320
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x320);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x12;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x320, wdata0);
	
	//h.	hssi_pldadapt_tx_320
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32C);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32C, wdata0);
		
	//i.	AIB CLOCK1 & AIB CLOCK2 Select
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x322);
	wdata0 = (rdata0 & 0xFFFFFFF0) | 0x9;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x322, wdata0);
	
	//j.	RX FIFO STOP READ & RX FIFO PEMPTY
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x313);
	wdata0 = (rdata0 & 0xFFFFFFB2) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x313, wdata0);
	
	//k.	RX FIFO POWER MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x31A);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x0C;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x31A, wdata0);
	
	//l.	RX FIFO FULL Threshold
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x312);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x4F;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x312, wdata0);
	
	//m.	RX FIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x315);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x315, wdata0);
	
	//n.	RX FIFO PFULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x314);
	wdata0 = (rdata0 & 0xFFFFFFEE) | 0x02;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x314, wdata0);
	
	//o.	TX AIB CLK1 SEL & TX AIB CLK2 SEL & TX FIFO RD CLK SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFF03) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x30D, wdata0);
	
	//p.	TX FIFO STOP RD & TX FIFO STOP WR
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x302);
	wdata0 = (rdata0 & 0xFFFFFF20) | 0x02;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x302, wdata0);
	
	//q.	TX GB TX IDWIDTH & TX GB TX ODWIDTH
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x306);
	wdata0 = (rdata0 & 0xFFFFFF09) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x306, wdata0);
	
	//r.	TX PHCOMP RD SEL & TX TXFIFO FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x301);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x6E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x301, wdata0);
	
	//s.	TXFIFO POWER MODE & TX TXFIFO PFULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x303);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x6A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x303, wdata0);
	
	//t.	TX TXFIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x300);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x300, wdata0);
	
	//u.	DCC CSR EN FSM
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x3C);
	wdata0 = (rdata0 & 0xFFFFFFFD) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x3C, wdata0);
	
	//v.	RB CONT CAL & RB DCC BYP 7 RB DCC EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x38);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x38, wdata0);
	
	//w.	RX BIT COUNTER ROLLOVER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	//x.	RX BIT COUNTER ROLLOVER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x48;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	//y.	RX BIT COUNTER ROLLOVER & SEL BIT COUNTER ADDER
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0C) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);
	
	//z.	RXBIT CONTR PMA
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);
	
	//aa.	EN DIRECT TX & EN FEC D2 TX & EN TX GBX & TX ML SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFF48) | 0x24;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	//bb.	EN FIFO RD RX & RX FIFO CLK SEL & RX ML SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF85) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	//cc.	RX GB ODWIDTH
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xE);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xE, wdata0);
	
	//dd.	RX SH LOCATION
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xB);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xB, wdata0);
	
	//ee.	RX TAG SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x9);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x9, wdata0);
	
	//ff.	RXFIFO AE THLD
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x11);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x11, wdata0);
	
	//gg.	RXFIFO AE THLD & RX FIFO E THLD
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x10);
	wdata0 = (rdata0 & 0xFFFFFF20) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x10, wdata0);
	
	//hh.	RXFIFO AF THLD
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x12);
	wdata0 = (rdata0 & 0xFFFFFF83) | 0x50;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x12, wdata0);
	
	//ii.	RXFIFO RD EMPTY & RXFIFO WR FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x13);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x13, wdata0);
	
	//jj.	SH LOCATION
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x8);
	wdata0 = (rdata0 & 0xFFFFFFDF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x8, wdata0);
	
	//kk.	TX CLK DP SEL & TX DATA IN SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFA3) | 0x44;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	//ll.	TX GB IDWIDTH
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xC);
	wdata0 = (rdata0 & 0xFFFFFF8F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xC, wdata0);
	
	//mm.	TXFIFO PH COMP
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x17);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x17, wdata0);
	
	//nn.	RX DATAPATH MAPPING MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x218);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x218, wdata0);
	
	//oo.	RX FIFO DOUBLE WRITE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21C);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21C, wdata0);
	
	//pp.	RD CLK SCG EN & WR CLK SCG EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x227);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x227, wdata0);
	
	//qq.	RX FIFO RD CLK SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x226);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x226, wdata0);
	
	//rr.	RX FIFO WR CLK SEL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x225);
	wdata0 = (rdata0 & 0xFFFFFF1F) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x225, wdata0);
	
	//ss.	RX PHCOMP RD SEL & RX RXFIFO FULL
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21B);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x6E;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21B, wdata0);
	
	//tt.	RX FIFO POWER MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x220);
	wdata0 = (rdata0 & 0xFFFFFF3F) | 0xC0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x220, wdata0);
	
	//uu.	RX RXFIFO MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x21A);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0xA0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x21A, wdata0);
	
	//vv.	TX DATAPATH MAPPING MODE
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x208);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x2;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x208, wdata0);
	
	//ww.	TX FIFO DOUBLE READ
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x20B);
	wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x20B, wdata0);
	
	//xx.	TX FIFO RD CLK SCG EN & TX FIFO RD CLK SEL & TX FIFO WR CLK SCG EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x214);
	wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x214, wdata0);
	
	//yy.	HRDRST ALIGN BYPASS & HRDRST DCD CAL DONE BYPASS
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x215);
	wdata0 = (rdata0 & 0xFFFFFF5F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x215, wdata0);
	
	//zz.	TX TX FIFO POWER MODE & TX WORD ALIGN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x210);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x7;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x210, wdata0);
	
	//aaa.	TX AIB TX DCC BYP & TX AIB TX DCC EN
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x32E);
	wdata0 = (rdata0 & 0xFFFFFFE7) | 0x18;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x32E, wdata0);
		
	//bbb.	xcvrif_ctrl0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
		
	//ccc.	xcvrif_ctrl0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	//ddd.	xcvrif_ctrl0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF9F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
		
//a.	tx bit/refclk ratio for 24G
return_value += pma_cfg_code(ch_num, 0x0005, 0x0084);
/* 
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x84);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
	
//b.	rx bit/refclk ratio for 24G
return_value += pma_cfg_code(ch_num, 0x0006, 0x0084);
/*
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x84);//0x84[7:0]: Set the data rate to reference clock frequency ratio
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
	// set PMA tx/rx width mode , 32bits
tx_rx_width_mode (ch_num, 0x55);

	// rx phaseslip to change the o_rx_fifo_clk_phase
rx_phase_slip (ch_num);

	//7. serdes enable
	serdes_enable(ch_num);
	
	//8. Reset AIB  Assert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0xAA;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);
	
//9.	Reset AIB  Deassert
	rdata0 = IORD_8DIRECT(xcvr_pma_capability_base_addr, 0xE2);
	wdata0 = (rdata0 & 0xFFFFFF55) | 0x0;
	IOWR_8DIRECT(xcvr_pma_capability_base_addr, 0xE2, wdata0);
	
	//10. tx/rx resetting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
	//IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
	return return_value;
}

int HSSI_12GCPRI_TO_25GPTPFEC(int port_num,int rsfec_port_num){

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
	
	
	
//3 ============================ Perform switch_pma_uc_clk_1 select start  ===================================
	if (sim_mode == 0){
	switch_pma_uc_clk_1(ch_num);
	}
	//REFCLK SEL SET
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEE);
	wdata0 = (rdata0 & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata0);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}	
	// PMA analog reset
	pma_analog_reset(ch_num);

//4  ============================ RS-FEC CONFIG===================================
		
	//Set rsfec_top_clk_cfg
	rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);
	
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		wdata0 = (rdata0 & 0xFFFFFFF7) | 0x8;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		wdata0 = (rdata0 & 0xFFFFFFFB) | 0x4;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		wdata0 = (rdata0 & 0xFFFFFFFD) | 0x2;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else{
		wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	
	//Set rsfec_top_tx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x01;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	
	//Set rsfec_top_rx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x1;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	
	
//5  ============================ PMA CONFIG_1 (Reconfig to 25G+PTP+RSFEC) ===================================
		
	
	//a.	xcvrif_ctrl0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x4;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	//b.	xcvrif_ctrl0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x20;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	//c.	xcvrif_ctrl0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF9F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	//d.	cfg_rx_bit_counter_rollover 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0F) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);

	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x48;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);


//6 ============================ EHIP CONFIG ===================================
	
	
	
	//c.	phy_ehip_pcs_modes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
	wdata0 = (rdata0 & 0xFFFFFDEF) | 0x10;
	IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);
	
	//d.	phy_ehip_mode_muxes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFFC7) | 0x0;
	IOWR(ehip_reconfig_base_addr, 0x30D, wdata0);
	
	//a.	TX DATA PATH MUX
	rdata0 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata0);
	
	//b.	RX DATA PATH MUX
	rdata0 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x1;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata0);
	
	//e.	txmac_ehip_cfg
	rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
	wdata0 = (rdata0 & 0xFFFFFE07) | 0xE0;
	IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);


//6  ============================ PMA CONFIG_2===================================
		
//a.	TX REFCLK RATIO

  return_value += pma_cfg_code(ch_num, 0x0005, 0x00A5);
/*  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
	*/
//b.	RX REFCLK RATIO
	
  return_value += pma_cfg_code(ch_num, 0x0006, 0x00A5);
 /* IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0xA5);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
//c.	set PMA tx/rx width mode , 32bits
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

int HSSI_25GPTPFEC_TO_12GCPRI(int port_num,int rsfec_port_num){

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
	
	
	
//3 ============================ Perform switch_pma_uc_clk_1 select start  ===================================
	if (sim_mode == 0){
	switch_pma_uc_clk_1(ch_num);
	}
	//REFCLK SEL SET
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0xEE);
	wdata0 = ((rdata0>>4) & 0xFFFFFF0F) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0xEC, wdata0);
	if (sim_mode == 0){
	switch_pma_uc_clk_0(ch_num);
	}
	// PMA analog reset
	pma_analog_reset(ch_num);

//4  ============================ RS-FEC CONFIG===================================
		
	//Set rsfec_top_clk_cfg
	rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);
	
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		wdata0 = (rdata0 & 0xFFFFFFFB) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		wdata0 = (rdata0 & 0xFFFFFFFD) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else{
		wdata0 = (rdata0 & 0xFFFFFFFE) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	
	//Set rsfec_top_tx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x60;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x06;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x60;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x06;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	
	//Set rsfec_top_rx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	
	
//5  ============================ PMA CONFIG_1 (Reconfig to 25G+PTP+RSFEC) ===================================
		
	
	//a.	xcvrif_ctrl0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	//b.	xcvrif_ctrl0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	//c.	xcvrif_ctrl0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF9F) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	//d.	cfg_rx_bit_counter_rollover 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0F) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);

	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x8A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);


//6 ============================ EHIP CONFIG ===================================
	
	//c.	phy_ehip_pcs_modes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
	wdata0 = (rdata0 & 0xFFFFFDE7) | 0x200;
	IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);
	
	//d.	phy_ehip_mode_muxes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30D);
	wdata0 = (rdata0 & 0xFFFFFFC7) | 0x08;
	IOWR(ehip_reconfig_base_addr, 0x30D, wdata0);
	
	//a.	TX DATA PATH MUX
	rdata0 = IORD(ehip_reconfig_base_addr, 0x350);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x02;
	IOWR(ehip_reconfig_base_addr, 0x350, wdata0);
	
	//b.	RX DATA PATH MUX
	rdata0 = IORD(ehip_reconfig_base_addr, 0x355);
	wdata0 = (rdata0 & 0xFFFFFFF8) | 0x02;
	IOWR(ehip_reconfig_base_addr, 0x355, wdata0);
	
	//e.	txmac_ehip_cfg
	rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
	wdata0 = (rdata0 & 0xFFFFFE07) | 0x1C8;
	IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);

//5 ============================ 	CPRI SOFT CONFIG (cprisoft_base_addr)  ============================ 
//	rdata0 = IORD(ehip_reconfig_base_addr, 0x0);
//	wdata0 = (rdata0 & 0xE0) | 0x9;
//	IOWR(ehip_reconfig_base_addr, 0x0, wdata0);

//6  ============================ PMA CONFIG_2===================================
		
//a.	TX REFCLK RATIO
return_value += pma_cfg_code(ch_num, 0x0005, 0x0042);
/*  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x42);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
	*/
//b.	RX REFCLK RATIO
return_value += pma_cfg_code(ch_num, 0x0006, 0x0042);
/*IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x42);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
//c.	set PMA tx/rx width mode , 32bits
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

int HSSI_24GCPRIFEC_TO_12GCPRI(int port_num,int rsfec_port_num){

	int return_value = 0;
	int ch_num = 0;
	int rsfec_ch_num=0;
	ch_num = get_ch_num(port_num);
	rsfec_ch_num = get_ch_num(rsfec_port_num);	
	unsigned long pio_reset_addr = (unsigned long) (0x4110500) + (unsigned long)(port_num*0x10);
	unsigned long ehip_reconfig_base_addr = (((ch_num+1) << 21) + EHIP_BASE_ADDRESS);
	unsigned long rsfec_base_addr = (((rsfec_ch_num+1) << 21) + RSFEC_BASE_ADDRESS);
	unsigned long xcvr_pma_base_addr = (((ch_num+1) << 21) + PMA_BASE_ADDRESS);
	
//1. tx/rx asserting
	//IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
	IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
	
//2. serdes disable
	serdes_disable(ch_num);
	
	
	
//3 ============================ PMA analog reset===================================
	
	pma_analog_reset(ch_num);

//4  ============================ RS-FEC CONFIG===================================
		
	//change FEC mode to CPRI 
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x4C);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x4C,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x48);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x48,wdata0);

	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x44);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x44,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x40);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x40,wdata0);
		
	}
	
		
	//Set rsfec_top_clk_cfg
	rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);
	
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		wdata0 = (rdata0 & 0xFFFFFFFB) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		wdata0 = (rdata0 & 0xFFFFFFFD) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else{
		wdata0 = (rdata0 & 0xFFFFFFFE) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	
	//Set rsfec_top_tx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x60;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x06;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x60;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x06;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	
	//Set rsfec_top_rx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	
	
//5  ============================ PMA CONFIG_1 (Reconfig to 25G+PTP+RSFEC) ===================================
		
	
	//a.	xcvrif_ctrl0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	//b.	xcvrif_ctrl0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	//c.	xcvrif_ctrl0
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF9F) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	//d.	cfg_rx_bit_counter_rollover 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0F) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);

	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x8A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);


//6 ============================ EHIP CONFIG ===================================
	
	//c.	phy_ehip_pcs_modes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
	wdata0 = (rdata0 & 0xFFFFFDE7) | 0x200;
	IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);
	
	//e.	txmac_ehip_cfg
	rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
	wdata0 = (rdata0 & 0xFFFFFE07) | 0x1C8;
	IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);

//5 ============================ 	CPRI SOFT CONFIG (cprisoft_base_addr)  ============================ 
//	rdata0 = IORD(ehip_reconfig_base_addr, 0x0);
//	wdata0 = (rdata0 & 0xE0) | 0x2;
//	IOWR(ehip_reconfig_base_addr, 0x0, wdata0);

//6  ============================ PMA CONFIG_2===================================
		
//a.	TX REFCLK RATIO
return_value += pma_cfg_code(ch_num, 0x0005, 0x0042);
/*  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x42);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
	*/
//b.	RX REFCLK RATIO
return_value += pma_cfg_code(ch_num, 0x0006, 0x0042);
/*IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x42);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
//c.	set PMA tx/rx width mode , 32bits
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

//The below profile matched exactly with HSSI_24GCPRIFEC_TO_10GCPRI as per Document
int HSSI_12GCPRI_TO_10GCPRI(int port_num,int rsfec_port_num){

	int return_value = 0;
	int ch_num = 0;
	int rsfec_ch_num=0;
	ch_num = get_ch_num(port_num);
	rsfec_ch_num = get_ch_num(rsfec_port_num);	
	unsigned long pio_reset_addr = (unsigned long) (0x4110500) + (unsigned long)(port_num*0x10);
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

//4  ============================ RS-FEC CONFIG===================================
		
	//change FEC mode to CPRI 
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x4C);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x4C,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x48);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x48,wdata0);

	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x44);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x44,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x40);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x00;
		IOWR_8DIRECT(rsfec_base_addr,0x40,wdata0);
		
	}

		
	//Set rsfec_top_clk_cfg
	rdata0 = IORD_8DIRECT(rsfec_base_addr,0x5);
	
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		wdata0 = (rdata0 & 0xFFFFFFF7) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		wdata0 = (rdata0 & 0xFFFFFFFB) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		wdata0 = (rdata0 & 0xFFFFFFFD) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	else{
		wdata0 = (rdata0 & 0xFFFFFFFE) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x5,wdata0);
		
	}
	
	//Set rsfec_top_tx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x60;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x11);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x06;
		IOWR_8DIRECT(rsfec_base_addr,0x11,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFF8F) | 0x60;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x10);
		wdata0 = (rdata0 & 0xFFFFFFF8) | 0x06;
		IOWR_8DIRECT(rsfec_base_addr,0x10,wdata0);
		
	}
	
	//Set rsfec_top_rx_cfg
	if (port_num == 3 || port_num == 7 || port_num == 11 || port_num == 15){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 2 || port_num == 6 || port_num == 10 || port_num == 14){
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x15);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x15,wdata0);
		
	}
	else if (port_num == 1 || port_num == 5 || port_num == 9 || port_num == 13){ 
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFCF) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	else{
		rdata0 = IORD_8DIRECT(rsfec_base_addr,0x14);
		wdata0 = (rdata0 & 0xFFFFFFFC) | 0x0;
		IOWR_8DIRECT(rsfec_base_addr,0x14,wdata0);
		
	}
	

//5  ============================ PMA CONFIG_1===================================
		
	//Set xcvrif_ctrl0 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x4);
	wdata0 = (rdata0 & 0xFFFFFFE3) | 0x0;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x4, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x5);
	wdata0 = (rdata0 & 0xFFFFFFCF) | 0x10;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x5, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x7);
	wdata0 = (rdata0 & 0xFFFFFF9F) | 0x40;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x7, wdata0);
	
	//Set cfg_rx_bit_counter 
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x34);
	wdata0 = (rdata0 & 0xFFFFFF0F) | 0x3;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x34, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x35);
	wdata0 = (rdata0 & 0xFFFFFF00) | 0x8A;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x35, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x36);
	wdata0 = (rdata0 & 0xFFFFFFFE) | 0x1;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x36, wdata0);
	
	rdata0 = IORD_8DIRECT(xcvr_pma_base_addr, 0x37);
	wdata0 = (rdata0 & 0xFFFFFF7F) | 0x80;
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x37, wdata0);
	

//6 ============================ EHIP CONFIG ===================================
	
//a.	switch ehip_mode
//i.	phy_ehip_pcs_modes
	rdata0 = IORD(ehip_reconfig_base_addr, 0x30E);
	wdata0 = (rdata0 & 0xFFFFFDE7) | 0x200;
	IOWR(ehip_reconfig_base_addr, 0x30E, wdata0);

//b.	txmac_ehip_cfg
	rdata0 = IORD(ehip_reconfig_base_addr, 0x40B);
	wdata0 = (rdata0 & 0xFFFFFE07) | 0x1C8;
	IOWR(ehip_reconfig_base_addr, 0x40B, wdata0);

// ============================ 	CPRI SOFT CONFIG (cprisoft_base_addr)  ============================ 
//	rdata0 = IORD(ehip_reconfig_base_addr, 0x0);
//	wdata0 = (rdata0 & 0xE0) | 0x2;
//	IOWR(ehip_reconfig_base_addr, 0x0, wdata0);
	


//6  ============================ PMA CONFIG_2===================================
		
//a.	tx bit/refclk ratio for 10G (Based on 184.32MHz ref clk)
return_value += pma_cfg_code(ch_num, 0x0005, 0x0037);
/*  IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x37);//0x84[7:0]: Set the data rate to reference clock frequency ratio
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x05);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
	IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 5);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
	
//b.	rx bit/refclk ratio for 10G (Based on 184.32MHz ref clk)
return_value += pma_cfg_code(ch_num, 0x0006, 0x0037);
/*    IOWR_8DIRECT(xcvr_pma_base_addr, 0x84, 0x37);//0x84[7:0]: Set the data rate to reference clock frequency ratio
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x85, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x86, 0x06);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x87, 0x00);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x90, 0x01);
	// Polling PMA register
    //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A[7] is asserted.
    //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8A, 7);

    //  Verify that 0x8B[0] de-asserts to indicate that the PMA register read/write transaction completed.
    //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x8B, 0);

    //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x88, 6);
    return_value += polling_for_cfg_value_compare (xcvr_pma_base_addr, 0x89, 0);

    // Write 1'b1 to 0x8A[7] to clear the 0x8A[7] value
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x8A, 0x80);
*/
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

//**********************************************DR_Profile_0_1_End****************************************************
