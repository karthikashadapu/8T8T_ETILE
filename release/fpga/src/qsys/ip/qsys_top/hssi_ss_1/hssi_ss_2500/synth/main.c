// Copyright (C) 2019 Intel Corporation
// SPDX-License-Identifier: MIT

//check the timeout incase of both axi and nios tries to access ss csr

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
// Optimize for simulation
#define SIM_ONLY

#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "hssi_ss_reconfig.h"

unsigned char sim_mode;

unsigned int sal_function()
{

    unsigned long reg_value;
	  unsigned long current_profile;
    unsigned int op_cmd;
    unsigned char xcvr_byte_no = 0;
    unsigned int sal_cmd;
    unsigned int port_num = 0;
    unsigned int ch_num = 0;
    unsigned long offset_addr = 0;
    //unsigned long wr_data = 0;
    //unsigned long return_data = 0;
    unsigned char return_value = 0;
    unsigned char tx_rst;
    unsigned char rx_rst;
    unsigned char ch_en;

    //CONFIG0 - cmd_start_edge, ack, write, read
    //CONFIG1 - addr[23:0], sal_cmd[7:0] 
    reg_value = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_TYPE_BASE);
    op_cmd = (reg_value & 0x00000007);
    xcvr_byte_no = ((reg_value >> 5) & 0x00000003);
    reg_value = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_COMMAND_BASE);
    sal_cmd = (reg_value & 0x000000FF);
    port_num = ((reg_value >> 8) & 0x0000000F);
    offset_addr = ((reg_value >> 8) & 0x00FFFFFF);
    ch_en = (((offset_addr >> 19) & 0x0000001F) > 0) && (((offset_addr >> 19) & 0x0000001F) < 25); 
    tx_rst = (reg_value >> 16) & 0x00000001;
    rx_rst = (reg_value >> 17) & 0x00000001;
    if (port_num > 11) {
    	ch_num = port_num + 8;
    } else if (port_num > 3) {
    	ch_num = port_num + 4;
    } else {
    	ch_num = port_num + 0;
    }

    if (op_cmd == 1) {
    //read operation
     
        if(sal_cmd==1){
                  //printf("get hssi profile!\n");
				          unsigned long base_profile_addr = (unsigned long)(0x4110300) + (unsigned long)(port_num*0x10);
				          unsigned long curr_profile_addr = (unsigned long)(0x4110400) + (unsigned long)(port_num*0x10);
				          unsigned long rdata_base = IORD_ALTERA_AVALON_PIO_DATA(base_profile_addr);
				          unsigned long rdata_curr = IORD_ALTERA_AVALON_PIO_DATA(curr_profile_addr);
				          current_profile = (rdata_base<<4) | rdata_curr;
                  reg_value = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_PORT_DR_EN_BASE);
                  IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_RD_DATA_BASE, current_profile);
                  if ((reg_value >> port_num) & 0x00000001) {
                    return_value = 0;
                  } else {
                    return_value = 1;
                  }
                 }
        else if(sal_cmd==3){
                  //printf("read mac statistics!\n");
                  read_stats (ch_num, ((offset_addr>>23) & 0x00000001), ((offset_addr>>8) & 0x0000001F));
                 }
        else if(sal_cmd==4){
                  //printf("get mtu!\n");
                  get_mtu (ch_num);
                 }
        else if(sal_cmd==6){
                  //printf("get csr!\n");
                  return_value = get_csr(offset_addr, xcvr_byte_no, ch_en);
                 }
        else if(sal_cmd==11){
		 						  //printf("get link status\n");
		 						  get_link_status(ch_num);
		 			 	 		 }
	
        else if(sal_cmd==255){
                  //printf("get firmware version!\n");
                  firmware_version ();
                 }
        else { //printf("invalid read operation!\n");  
                   return_value = 1;
                  }

    } else if (op_cmd == 2) {
    //Write operation
        if(sal_cmd==0){
                  //printf("NOP!\n");
                  //each nop = ~5 cpu cycles
                  //1GHz clk = 1ns * 5cycles, n=200 => 1us
//                  __asm volatile ("nop" ::);
                 }
        else if(sal_cmd==2){
                  //printf("set hssi profile!\n");
				          return_value=set_hssi_profile(port_num);
                 }
        else if(sal_cmd==5){
                  //printf("set csr!\n");
                  return_value=set_csr(offset_addr, xcvr_byte_no, ch_en);
                 }
        else if(sal_cmd==7){
                  //printf("enable loopback!\n");
                  //reading port-x parameter reg (0x10-0x4)
                  return_value = enable_serial_loopback (port_num);
                 }
        else if(sal_cmd==8){
                  //printf("disable loopback!\n");
                  //reading port-x parameter reg (0x10-0x4)

                  return_value = disable_serial_loopback (port_num);
                 }
        else if(sal_cmd==9){
                 // reset MAC statistics
                 return_value = reset_MAC_stats (ch_num, tx_rst, rx_rst);
                 }
        else if(sal_cmd==10){
		 						  //printf("set mtu \n");
		 						  set_mtu(ch_num);
		 			 	 		 }

        else  {
                  //printf("invalid write operation!\n");
                  return_value = 1;
                  }
    } else {
            //error condition
            //printf("Invalid NIOS command~\n");
            return_value = 1;
    }
    //    #ifdef SIM_ONLY
    //        IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, 0x200); //
    //    #endif
    return return_value;
}

int main()
{
    unsigned long reg_value;
    unsigned char return_data = 0;

    printf("CPU is alive!\n");
	// Upon Power up, resets have been released
    // sl_csr_rst_n
    // sl_tx_rst_n
    // sl_rx_rst_n
    // i_reconfig_reset


    // Wait for the ehip_ready to be asserted from dut before enable serdes loopback
    //checker_pass_sync
    // o_rx_ptp_ready
    // o_tx_ptp_ready
    // o_sl_rx_pcs_ready
    // o_tx_pll_locked & &o_sl_tx_lanes_stable
    // o_sl_rx_block_lock & o_rx_cdr_lock
    // o_ehip_ready

    //do {
    //    usleep(1);
    //    reg_value = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_TYPE_BASE);
    //} while ((reg_value & 0x8) != 0x8);

      //Sub-system offset address >> 2
    //unsigned char sim_mode;
    reg_value = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_TYPE_BASE);
    sim_mode = (reg_value >> 7) & (0x00000001);

    if (sim_mode == 1) {
      //in simulation no need to initialize PMA (load config, ical, pcal)
    //setting command complete, to indiacate processor is up
    IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_COMPLETE_BASE, 0x1);
    }
    else {
      //in HW, nios completion is set after PMA initialization
      return_data = xcvr_pma_config();
      //setting command complete, to indiacate processor is up, with error status
      if (return_data == 1) {  
        IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_COMPLETE_BASE, 0x3);
      } else {
        IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_COMPLETE_BASE, 0x1);
      }
    }
    //IOWR_8DIRECT(0x250000, 0x80, 0x12345678);
    //enabling interrupt on command start
    //IOWR_ALTERA_AVALON_PIO_IRQ_MASK(HSSI_SS_DR_CPU_0_CPU_CMD_START_BASE, 0xf);
    while(1){
      
      rst_wait(10);
      reg_value = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_TYPE_BASE);
      if (((reg_value & 0x00000007) == 1) || ((reg_value & 0x00000007) == 2)) {
        //printf("Executing the nios command!\n");
        //setting command complete, to indiacate command is accepted (may be invalid commnad also) 
        IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_COMPLETE_BASE, 0x0);

        return_data = sal_function();

        //setting command complete, to indiacate command is completed 
        if (return_data == 1) {  
          IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_COMPLETE_BASE, 0x3);
        } else {
        IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_COMPLETE_BASE, 0x1);
        }
        reg_value = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_TYPE_BASE);

        while (((reg_value >> 3) & 0x00000001) == 0) {
                rst_wait(10);
                //waiting till command compelte passes to the hw
                reg_value = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_TYPE_BASE);
        }
      }
    }

}
