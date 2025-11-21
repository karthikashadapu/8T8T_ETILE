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


//Sub-system offset address >> 2
unsigned char sim_mode;
unsigned char sim_fast_en;

unsigned int sal_function()
{

    unsigned long reg_value;
    //unsigned long current_profile;
    unsigned int op_cmd;
    unsigned char xcvr_byte_no = 0;
    unsigned int sal_cmd;
    unsigned int port_num = 0;
    unsigned long offset_addr = 0;
    unsigned long port_params_addr = 0;
    unsigned int port_profiles =0;
    unsigned long ETH_BASE_ADDR =0;
    //unsigned long wr_data = 0;
    //unsigned long return_data = 0;
    unsigned char return_value = 0;
    unsigned char tx_rst = 0;
    unsigned char rx_rst = 0;
    unsigned char port_en = 0;
    unsigned char anlt_en = 0;
    
    //CONFIG0 - cmd_start_edge, ack, write, read
    //CONFIG1 - addr[23:0], sal_cmd[7:0] 
    reg_value = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_TYPE_BASE); // HSSI Command/Status
    op_cmd = (reg_value & 0x00000007);
    xcvr_byte_no = ((reg_value >> 5) & 0x00000003);
    reg_value = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_COMMAND_BASE); // HSSI Control/Address
    sal_cmd = (reg_value & 0x000000FF);
    port_num = ((reg_value >> 8) & 0x0000001F);
    offset_addr = ((reg_value >> 8) & 0x0FFFFFFF);
    port_en = (((offset_addr >> 19) & 0x0000001F) > 0) && (((offset_addr >> 19) & 0x0000001F) < 21); 
    tx_rst = (reg_value >> 16) & 0x00000001;
    rx_rst = (reg_value >> 17) & 0x00000001;
	  port_params_addr 	= (unsigned long)(0x04111400) + (unsigned long)(port_num*0x10);
	  port_profiles = (unsigned int) ((IORD_ALTERA_AVALON_PIO_DATA(port_params_addr)>>1) & 0x0000003f);
	  anlt_en = (unsigned char) ((IORD_ALTERA_AVALON_PIO_DATA(port_params_addr)>>18) & 0x00000001);
 

    if ((port_profiles == 20) || (port_profiles == 21)){
            ETH_BASE_ADDR = 0x1000; //10GbE and 25GbE
    } else if((port_profiles == 24 ) || (port_profiles == 23)){
            ETH_BASE_ADDR = 0x2000; //50GbE
    } else if((port_profiles == 22) || (port_profiles == 25) || (port_profiles == 26) || (port_profiles == 27)) {
            ETH_BASE_ADDR = 0x3000; //40GbE and 100GbE
    } else if((port_profiles == 28) || (port_profiles == 29) || (port_profiles == 30)) {
            ETH_BASE_ADDR = 0x4000; //200GbE
    } else if((port_profiles == 31) || (port_profiles == 32)) {
            ETH_BASE_ADDR = 0x5000; //400GbE
    }               


    if (op_cmd == 1) {
    //read operation
     
        if(sal_cmd==1){
                  get_hssi_profile(offset_addr);
                 }
        else if(sal_cmd==3){
                  //printf("read mac statistics!\n");
                  read_mac_stats (port_num, ((offset_addr>>23) & 0x00000001), ((offset_addr>>8) & 0x0000001F), ETH_BASE_ADDR);
                 }
        else if(sal_cmd==4){
                  //printf("get mtu!\n");
                  get_mtu (port_num, ETH_BASE_ADDR);
                 }
        else if(sal_cmd==6){
                  //printf("get csr!\n");
                  get_csr(offset_addr);
                 }
        else if(sal_cmd==11){
		 						  //printf("get link status\n");
		 						  get_link_status(port_num,ETH_BASE_ADDR);
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
				         // return_value=set_hssi_profile(port_num);
				          set_hssi_profile(offset_addr);
                 }
        else if(sal_cmd==5){
                  //printf("set csr!\n");
                  set_csr(offset_addr);
                 }
        else if(sal_cmd==7){
                //printf("enable loopback!\n");
                //reading port-x parameter reg (0x10-0x4)
                if (anlt_en == 1){ 
                        return_value	+= anlt_clr(port_num);
                }
                if(port_num < 16) {
                        return_value += enable_serial_loopback_fgt_pma (port_num,port_profiles);
                } else {
                        if(sim_mode==1){
                                return_value +=1;
                        } else {
                                return_value += enable_serial_loopback_fht_pma (port_num,port_profiles);
                        }
                }
                if (anlt_en == 1){ 
                        return_value += ignore_nonce_enable(port_num);
                }

        }
        else if(sal_cmd==8){
                //printf("disable loopback!\n");
                //reading port-x parameter reg (0x10-0x4)
                if (anlt_en == 1){ 
                        return_value += anlt_clr(port_num);
                }         
                if(port_num < 16) {
                        return_value += disable_serial_loopback_fgt_pma (port_num,port_profiles);
                } else {
                        return_value += disable_serial_loopback_fht_pma (port_num,port_profiles);
                }
                if (anlt_en == 1){ 
                        return_value += ignore_nonce_disable(port_num);
                }


        }
        else if(sal_cmd==9){
                         // reset MAC statistics
                         return_value = reset_MAC_stats (port_num, tx_rst, rx_rst,ETH_BASE_ADDR);

                 }
        else if(sal_cmd==10){
                          //printf("set mtu!\n");
                          set_mtu (port_num, ETH_BASE_ADDR);

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
    //do {
    //    usleep(1);
    //    reg_value = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_TYPE_BASE);
    //} while ((reg_value & 0x8) != 0x8);

    reg_value = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_TYPE_BASE);
    sim_mode = (reg_value >> 7) & (0x00000001);
    sim_fast_en = (reg_value >> 8) & (0x00000001);

    //if (sim_mode == 1) {
    //  //in simulation no need to initialize PMA (load config, ical, pcal)
    ////setting command complete, to indiacate processor is up
    //IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_COMPLETE_BASE, 0x1);
    //}
    //else {
    //  //in HW, nios completion is set after PMA initialization
    //  return_data = xcvr_pma_config();
    //  //setting command complete, to indiacate processor is up, with error status
    //  if (return_data == 1) {  
    //    IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_COMPLETE_BASE, 0x3);
    //  } else {
    //    IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_COMPLETE_BASE, 0x1);
    //  }
    //}

    //Setting ack bit to 1 to indicate RTL that nios is up after hex file load
    IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_COMPLETE_BASE, 0x1);

    while(1){
      rst_wait(10);
      reg_value = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_TYPE_BASE);
      if (((reg_value & 0x00000007) == 1) || ((reg_value & 0x00000007) == 2)) {
        //printf("Executing the nios command!\n");
        //setting command complete, to indiacate command is accepted (may be invalid commnad also) 
        IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_CMD_COMPLETE_BASE, 0x0);

        return_data = sal_function();
        rst_wait(10);
        IOWR_32DIRECT(0x0,0x0,0X0);  //for 16021420994;
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
