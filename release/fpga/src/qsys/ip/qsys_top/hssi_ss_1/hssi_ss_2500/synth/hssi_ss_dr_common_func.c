#include<stdio.h>
#include<unistd.h>
#include <stdlib.h>
#include "io.h"
#include "hssi_ss_reconfig.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"



//*******************************************************************************************************
unsigned char serdes_disable (unsigned char ch_num){
    unsigned char return_value = 0;
    unsigned int tx_pma_ready;
    unsigned int rx_pma_ready;
    unsigned char pma_ready_deassert;
    unsigned char port_num = get_port_num(ch_num);

    // Disable the PMA by using PMA attribute code 0x0001
    return_value = pma_cfg_code(ch_num, 0x0001, 0x0000);

    //Needs to check tx and rx pma ready de-assertion, adding temp delay of 25usec for both sim and HW
		alt_timestamp_start();
    do {
      tx_pma_ready = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_TX_PMA_READY_BASE); 
      rx_pma_ready = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_RX_PMA_READY_BASE); 
      pma_ready_deassert = (((tx_pma_ready >> port_num) & 0x0001) | ((rx_pma_ready >> port_num) & 0x0001));
    } while ((alt_timestamp() < 50000) & pma_ready_deassert);

    
    return return_value;
}
    
    
//*******************************************************************************************************
unsigned char serdes_enable (unsigned char ch_num){
    unsigned char return_value = 0;

    return_value = pma_cfg_code(ch_num, 0x0001, 0x0007);
    
    return return_value;
}

//*******************************************************************************************************
unsigned char pma_analog_reset (unsigned char ch_num){
    unsigned char return_value = 0;
    unsigned long xcvr_pma_base_addr = ((ch_num+1) << 21) + PMA_BASE_ADDRESS;
    //Reset the internal controller inside the PMA because the REFCLK source changed
    
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x200, 0x0);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x201, 0x0);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x202, 0x0);
    IOWR_8DIRECT(xcvr_pma_base_addr, 0x203, 0x81);
    return_value += polling_for_cfg_bit (xcvr_pma_base_addr, 0x207, 7);
    return return_value;
}

//*******************************************************************************************************
unsigned char switch_pma_uc_clk_1(unsigned char ch_num){

    unsigned char return_value = 0;

    //	switch PMA uC clock to XCVR-Refclk 1
    return_value = pma_cfg_code(ch_num, 0x0030, 0x0003);

    return return_value;
}
    
//*******************************************************************************************************
unsigned char switch_pma_uc_clk_0(unsigned char ch_num){

    unsigned char return_value = 0; 

    //	Switch PMA uC Clock to XCVR-Refclk 0
    return_value = pma_cfg_code(ch_num, 0x0030, 0x0000);

    return return_value;
}

//*******************************************************************************************************
unsigned char tx_rx_width_mode (unsigned char ch_num, unsigned char width_mode){

    unsigned char return_value = 0; 
    
    //Set PMA tx/rx width mode , 32bits
    return_value = pma_cfg_code(ch_num, 0x0014, (width_mode & 0x00ff));
    
    return return_value;   
}

//*******************************************************************************************************
unsigned char rx_phase_slip (unsigned char ch_num){

    unsigned char return_value=0;
    
    //Set rx phaseslip to change the o_rx_fifo_clk_phase
    return_value = pma_cfg_code(ch_num, 0x000E, 0x9C00);
    
    return return_value;
}

//*******************************************************************************************************

