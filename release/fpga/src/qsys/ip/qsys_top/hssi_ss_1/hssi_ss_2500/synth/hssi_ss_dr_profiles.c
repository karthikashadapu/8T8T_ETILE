#include <stdio.h>
#include <unistd.h>
#include "io.h"
#include "hssi_ss_reconfig.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"

//Update the port attributes registers of SS CSR after DR switching
//Port Parameters are the port configuration status register
//bit-0       - port_enable
//bits[6:1]   - profile
//bits[9:7]   - data bus width
//bits[11:10] - lowspeed eth param 
//bits[16:12] - sub-profile
//bit-17      - fec_en
//bit-18      - anlt_en
//bit-19      - ptp_en

void port_config_update(unsigned int port_num, unsigned int profile) {
		    //printf("into port_config_update\n");
        unsigned long rdata;
        unsigned long port_params_addr = (unsigned long)(0x4110700) + (unsigned long)(port_num*0x10);
        unsigned int curr_profile = (profile >> 0) & 0x000F;
        unsigned int base_profile = (profile >> 4) & 0x0003;

        rdata = IORD_ALTERA_AVALON_PIO_DATA(port_params_addr);
        unsigned char port_enable      = 0x1;
        unsigned char port_dw          = 0x1; 
        unsigned char port_lowspeed    = 0x0;
        unsigned char port_profile     = 0x15; //25GbE
        unsigned char port_sub_profile = 0x4;  //MAC+PCS
        unsigned char fec_en           = 0x0; 
        unsigned char anlt_en          = (rdata >> 18) & 0x00000001;
        unsigned char ptp_en           = 0x0; 
        unsigned long wdata;
                if(base_profile == 0){
                           //25G ETH only
                           if (curr_profile > 1) {
                              port_profile     = 0x14;
                           }
                           if (curr_profile == 0) {
                              fec_en     = 0x1;
                           }
                           wdata = ((unsigned long) (ptp_en << 19)) + ((unsigned long) (anlt_en << 18)) + ((unsigned long) (fec_en << 17)) + ((unsigned long) (port_sub_profile << 12)) + ((unsigned long) (port_lowspeed << 10)) + ((unsigned long) (port_dw << 7)) + ((unsigned long) (port_profile <<1)) + ((unsigned long) port_enable);
                           IOWR_ALTERA_AVALON_PIO_DATA(port_params_addr,wdata);
                         }
                else if(base_profile == 1){
                            //25G ETH + CPRI
                           if (curr_profile < 3){ //ETH
                             if (curr_profile > 1) {//10G
                               port_profile     = 0x14;
                             }
                             ptp_en     = 0x1;
                           }
                           else { 
                             port_profile     = 0x21; //CPRI
                             if(curr_profile == 3){
                              port_sub_profile = 0xF;  //24G PCS
                                        }
                             else if(curr_profile == 4){
                               port_sub_profile = 0xE;  //12G PCS
                                        }
                             else if(curr_profile == 5){
                               port_sub_profile = 0xD;  //10G PCS
                                        }
                             else if(curr_profile == 6){
                               port_sub_profile = 0xC;  //9.8G PMA
                                        }
                             else if(curr_profile == 7){
                                port_sub_profile = 0x9;  //4.9G PMA
                                        }
                             else if(curr_profile == 8){
                                port_sub_profile = 0x7;  //2.4G PMA
                             } 
                              else {
                               port_sub_profile = 0xF;  //24G PCS
                               }
                           }
                           if ((curr_profile == 0) || (curr_profile == 3)) {
                             fec_en     = 0x1;
                           }
                           wdata = ((unsigned long) (ptp_en << 19)) + ((unsigned long) (anlt_en << 18)) + ((unsigned long) (fec_en << 17)) + ((unsigned long) (port_sub_profile << 12)) + ((unsigned long) (port_lowspeed << 10)) + ((unsigned long) (port_dw << 7)) + ((unsigned long) (port_profile <<1)) + ((unsigned long) port_enable);
                           IOWR_ALTERA_AVALON_PIO_DATA(port_params_addr,wdata);
                         }
                else if(base_profile == 2){
                // CPRI only
                           port_profile     = 0x21; //CPRI
                           if (curr_profile == 0 || curr_profile == 1){
                             port_sub_profile = 0xF;  //24G PCS
                           }
                           else if (curr_profile == 2 || curr_profile == 3){ 
                             port_sub_profile = 0xE;  //12G PCS
                           }
                           else if (curr_profile == 4 || curr_profile == 5){ 
                             port_sub_profile = 0xD;  //10G PCS
                           }
                           else if (curr_profile == 6){ 
                             port_sub_profile = 0xC;  //9.8G PMA
                           }
                           else if (curr_profile == 7){ 
                             port_sub_profile = 0x9;  //4.9G PMA
                           }
                           else if (curr_profile == 8){ 
                             port_sub_profile = 0x7;  //2.4G PMA
                           }
                           else{
                             port_sub_profile = 0xF;  //24G PCS
                           }
                           if ((curr_profile == 0) || (curr_profile == 2) || (curr_profile == 4)) {
                             fec_en     = 0x1;
                           }
                           wdata = ((unsigned long) (ptp_en << 19)) + ((unsigned long) (anlt_en << 18)) + ((unsigned long) (fec_en << 17)) + ((unsigned long) (port_sub_profile << 12)) + ((unsigned long) (port_lowspeed << 10)) + ((unsigned long) (port_dw << 7)) + ((unsigned long) (port_profile <<1)) + ((unsigned long) port_enable);
                           IOWR_ALTERA_AVALON_PIO_DATA(port_params_addr,wdata);
                         }
                else if(base_profile == 3){
                //100G
                          unsigned long port_sub_profile = 0x4;  //MAC+PCS
                          if ((curr_profile == 0) || (curr_profile == 2) || (curr_profile > 3)) {
                             fec_en     = 0x1;
                          }
                          if ((curr_profile <= 1) || (curr_profile > 3)) {//100G
                            port_dw          = 0x4; //512
                            if (curr_profile == 4) {
                              port_profile     = 0x1A; //100GCAUI-2
                            } else {
                              port_profile     = 0x1B; //100GCAUI-4
                            }
                            wdata = ((unsigned long) (ptp_en << 19)) + ((unsigned long) (anlt_en << 18)) + ((unsigned long) (fec_en << 17)) + ((unsigned long) (port_sub_profile << 12)) + ((unsigned long) (port_lowspeed << 10)) + ((unsigned long) (port_dw << 7)) + ((unsigned long) (port_profile <<1)) + ((unsigned long) port_enable);
                            IOWR_ALTERA_AVALON_PIO_DATA(port_params_addr,wdata);
                            wdata = 0;
                            port_params_addr = port_params_addr + 0x10;
                            IOWR_ALTERA_AVALON_PIO_DATA(port_params_addr,wdata);
                            port_params_addr = port_params_addr + 0x10;
                            IOWR_ALTERA_AVALON_PIO_DATA(port_params_addr,wdata);
                            port_params_addr = port_params_addr + 0x10;
                            IOWR_ALTERA_AVALON_PIO_DATA(port_params_addr,wdata);
                          }
                          else {//4x25G
                            wdata = ((unsigned long) (ptp_en << 19)) + ((unsigned long) (anlt_en << 18)) + ((unsigned long) (fec_en << 17)) + ((unsigned long) (port_sub_profile << 12)) + ((unsigned long) (port_lowspeed << 10)) + ((unsigned long) (port_dw << 7)) + ((unsigned long) (port_profile <<1)) + ((unsigned long) port_enable);
                            IOWR_ALTERA_AVALON_PIO_DATA(port_params_addr,wdata);
                            port_params_addr = port_params_addr + 0x10;
                            IOWR_ALTERA_AVALON_PIO_DATA(port_params_addr,wdata);
                            port_params_addr = port_params_addr + 0x10;
                            IOWR_ALTERA_AVALON_PIO_DATA(port_params_addr,wdata);
                            port_params_addr = port_params_addr + 0x10;
                            IOWR_ALTERA_AVALON_PIO_DATA(port_params_addr,wdata);
                          }
                        }
             //  default:{
             //             break;

                          //port_enable      = 0x1;
                          //port_dw          = 0x1; 
                          //port_lowspeed    = 0x1;//change to 1
                          //port_profile     = 0x15; //25GbE
                          //port_sub_profile = 0x4;  //MAC+PCS
                          //wdata = (port_sub_profile << 12) + (port_lowspeed << 10) + (port_dw << 7) + (port_profile <<1 ) + port_enable;
                          //IOWR_ALTERA_AVALON_PIO_DATA(port_params_addr,wdata);
              //         }
}

// This file reads current hssi prfile and switches to next hssi profile only if the profile switching is found to be valid
 
unsigned char set_hssi_profile(unsigned int port_num) {
        unsigned int rsfec_port_num = 0;
        unsigned int quad_num = 0;
        unsigned int quad_port_num=0;
        unsigned int i=0;
        unsigned int fec_ena=0;
        unsigned int cpri_speed=0;
        unsigned int return_hssi = 1;
        unsigned long rdata =0;
        unsigned char return_value = 0;
        unsigned long rdata1 =0;
        unsigned long wdata1 =0;
        unsigned char hotplug_paused;

        unsigned long base_profile_addr = (unsigned long)(0x4110300) + (unsigned long)(port_num*0x10);//getting the base profile address for one of the 4 profiles we have
        unsigned long curr_profile_addr = (unsigned long)(0x4110400) + (unsigned long)(port_num*0x10);//getting the sub profile address of the chosen base profile
        unsigned long rdata_base = IORD_ALTERA_AVALON_PIO_DATA(base_profile_addr);// getting the value in base profile adddress
        unsigned long rdata_curr = IORD_ALTERA_AVALON_PIO_DATA(curr_profile_addr);//getting the value in sub profile address
        unsigned long next_profile = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_WR_DATA_BASE);//getting value of next profile to be switched
        unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);

        int ch_num = 0;
        if (port_num > 11) {
                ch_num = port_num + 8;
        } else if (port_num > 3) {
                ch_num = port_num + 4;
        } else {
                ch_num = port_num + 0;
        }
        unsigned long ehip_reconfig_base_addr = ((ch_num+1) << 21) + EHIP_BASE_ADDRESS;

        //printf("current_profile:%lx\n",current_profile);
        //printf("next_profile:%lx\n",next_profile);

        //-----------------------------------------------------------
        //getting the 1st fec enabled port in a quad to access FEC registers 
        quad_num = (unsigned int) (port_num/4); //getting the starting port number of the Quad
        rdata = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_PORT_DR_EN_BASE);//

        // rsfec port num is same as the chosen port num for Profile 0x3 -> 100G profile
        if (rdata_base == 0x3){
                rsfec_port_num = port_num;
        } else { 
                for (i=0;i<4;i++){
                        quad_port_num = quad_num*4+i;
                        //no need to check base profile as FEC is supported on all base ports
                        if ( ((rdata >> quad_port_num) & 0x00000001) ==1 ){
                                rsfec_port_num = quad_port_num;
                                break;
                        }
                }
        }

        //-----------------------------------------------------------
        //Checking DR enabled or not on that port
        if ( !((rdata >> port_num) & 0x00000001) ){
                //printf("DR is not enabled on port %d!\n", port_num);
                return_value = 1;
        }
        else if ((rdata >> port_num) & 0x00000001){
          //
          //Pausing the hotplug logic
          //100G DR 
          if(rdata_base == 0x3) {
            wdata1 = (0xF << port_num);
          } 
          else {
            wdata1 = (0x1 << port_num);
          }
          IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_HOTPLUG_DISABLE_BASE, wdata1);

          //wait for hotplug pause indication
		      alt_timestamp_start();
          do {
            rdata1 = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_HOTPLUG_PAUSED_BASE);
            if(rdata_base == 0x3) {
              hotplug_paused = (((rdata1 >> port_num) & 0x000F) == 0xF);
            } else {
              hotplug_paused = (((rdata1 >> port_num) & 0x0001) == 0x1);
            }
          } while ((alt_timestamp() < 50000) && (hotplug_paused == 0));

                        //------------------------------------ PROFILE_0_start DR switching 25G Eth+FEC ----------------------------------------------
                if(rdata_base == 0){
                                   
                                        if(rdata_curr == 0){
                                                              if (next_profile == 0x01){
                                                                      //Switching from 25G_FEC to 25G_NOFEC 
                                                                      //using same function of with PTP, as settings are same 
                                                                      return_hssi = HSSI_25GPTPFEC_TO_25GPTPNOFEC(port_num,rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                              }
                                                              else if (next_profile == 0x02){
                                                                      //Switching from 25G_FEC to 10G
                                                                      return_hssi = HSSI_25GPTPFEC_TO_10GPTP(port_num,rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 1){
                                                              if (next_profile == 0x0){
                                                                      //Switching from 25G_NOFEC to 25G_FEC 
                                                                      return_hssi = HSSI_25GPTPNOFEC_TO_25GPTPFEC(port_num,rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x02){
                                                                      //Switching from 25G_NOFEC to 10G 
                                                                      return_hssi = HSSI_25GPTPNOFEC_TO_10GPTP(port_num);
                                                                      //tx/rx restting
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 2){
                                                              if (next_profile == 0x0){
                                                                      //Switching from 10G to 25G_FEC 
                                                                      return_hssi = HSSI_10GPTP_TO_25GPTPFEC(port_num,rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x01){
                                                                      //Switching from 10G to 25G_NOFEC 
                                                                      return_hssi = HSSI_10GPTP_TO_25GPTPNOFEC(port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }	
                                               else {
                                                                // printf("DR switching to profile %lx is not supported in group-0 25G+FEC on port %d!\n", next_profile, port_num);
                                                                return_value = 1;
                                                        }
                               }
                               //*************************************PROFILE_0_END*************************************************************

                               //-------------------------------------- PROFILE_1_start DR switching 25G Eth+FEC+PTP ------------------------------------------
                else if(rdata_base == 1){
                                        if(rdata_curr == 0){
                                                              if (next_profile == 0x11){
                                                                      //Switching from 25G_PTP_FEC to 25G_PTP_NOFEC 
                                                                      return_hssi = HSSI_25GPTPFEC_TO_25GPTPNOFEC(port_num,rsfec_port_num);
                                                                      //sets the time for a single TX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB10, 0x9EE01);
                                                                      //sets the time for a single RX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB11, 0x9EE01);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                              }
                                                              else if (next_profile == 0x12){
                                                                      //Switching from 25G_PTP_FEC to 10G_PTP 
                                                                      return_hssi = HSSI_25GPTPFEC_TO_10GPTP(port_num,rsfec_port_num);
                                                                      //sets the time for a single TX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB10, 0x18D302);
                                                                      //sets the time for a single RX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB11, 0x18D302);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                              }
                                                              else if (next_profile == 0x13){
                                                                      //Switching from 25G_PTP_FEC to 24G_CPRI_FEC 
                                                                      return_hssi = HSSI_25GPTPFEC_TO_24GCPRIFEC(port_num,rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x3);
                                                              }
                                                              else if (next_profile == 0x14){
                                                                      //Switching from 25G_PTP_FEC to 12G_CPRI 
                                                                      return_hssi = HSSI_25GPTPFEC_TO_12GCPRI(port_num,rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x4);
                                                              }
                                                              else if (next_profile == 0x15){
                                                                      //Switching from 25G_PTP_FEC to 10G_CPRI 
                                                                      return_hssi = HSSI_25GPTPFEC_TO_10GCPRI(port_num,rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x5);
                                                              }
                                                              else if (next_profile == 0x16){
                                                                      //Switching from 25G_PTP_FEC to 9P8G_CPRI 
                                                                      return_hssi = HSSI_25GPTPFEC_TO_9P8CPRI(port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x6);
                                                              }
                                                              else if (next_profile == 0x17){
                                                                      //Switching from 25G_PTP_FEC to 4P9G_CPRI 
                                                                      return_hssi = HSSI_25GPTPFEC_TO_4P9CPRI(port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x7);
                                                              }
                                                              else if (next_profile == 0x18){
                                                                      //Switching from 25G_PTP_FEC to 2P4G_CPRI 
                                                                      return_hssi = HSSI_25GPTPFEC_TO_2P4CPRI(port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x8);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 1){
                                                              if (next_profile == 0x10){
                                                                      //Switching from 25G_PTP_NOFEC to 25G_PTP_FEC 
                                                                      return_hssi = HSSI_25GPTPNOFEC_TO_25GPTPFEC(port_num,rsfec_port_num);
                                                                      //sets the time for a single TX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB10, 0x9EE01);
                                                                      //sets the time for a single RX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB11, 0x9EE01);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x12){
                                                                      //Switching from 25G_PTP_NOFEC to 10G_PTP 
                                                                      return_hssi = HSSI_25GPTPNOFEC_TO_10GPTP(port_num);
                                                                      //sets the time for a single TX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB10, 0x18D302);
                                                                      //sets the time for a single RX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB11, 0x18D302);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 2){
                                                              if (next_profile == 0x10){
                                                                      //Switching from 10G_PTP to 25G_PTP_FEC
                                                                      return_hssi = HSSI_10GPTP_TO_25GPTPFEC(port_num,rsfec_port_num);
                                                                      //sets the time for a single TX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB10, 0x9EE01);
                                                                      //sets the time for a single RX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB11, 0x9EE01);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x11){
                                                                      //Switching from 10G_PTP to 25G_PTP_NOFEC
                                                                      return_hssi = HSSI_10GPTP_TO_25GPTPNOFEC(port_num);
                                                                      //sets the time for a single TX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB10, 0x9EE01);
                                                                      //sets the time for a single RX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB11, 0x9EE01);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 3){
                                                              if (next_profile == 0x10){
                                                                      //Switching from 24G_CPRI_FEC to 25G_PTP_FEC
                                                                      return_hssi = HSSI_24GCPRIFEC_TO_25GPTPFEC(port_num,rsfec_port_num);
                                                                      //sets the time for a single TX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB10, 0x9EE01);
                                                                      //sets the time for a single RX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB11, 0x9EE01);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x14){
                                                                      //Switching from 24G_CPRI_FEC to 12G_CPRI
                                                                      return_hssi = HSSI_24GCPRIFEC_TO_12GCPRI(port_num,rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x4);
                                                              }
                                                              else if (next_profile == 0x15){
                                                                      //Switching from 24G_CPRI_FEC to 10G_CPRI
                                                                      return_hssi = HSSI_24GCPRIFEC_TO_10GCPRI(port_num,rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x5);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 4){
                                                              if (next_profile == 0x10){
                                                                      //Switching from 12G_CPRI to 25G_PTP_FEC
                                                                      return_hssi = HSSI_12GCPRI_TO_25GPTPFEC(port_num,rsfec_port_num);
                                                                      //sets the time for a single TX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB10, 0x9EE01);
                                                                      //sets the time for a single RX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB11, 0x9EE01);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x15){
                                                                      //Switching from 12G_CPRI to 10G_CPRI
                                                                      return_hssi = HSSI_12GCPRI_TO_10GCPRI(port_num,rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x5);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 5){
                                                              if (next_profile == 0x10){
                                                                      //Switching from 10G_CPRI to 25G_PTP_FEC
                                                                      return_hssi = HSSI_10GCPRI_TO_25GPTPFEC(port_num,rsfec_port_num);
                                                                      //sets the time for a single TX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB10, 0x9EE01);
                                                                      //sets the time for a single RX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB11, 0x9EE01);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x16){
                                                                      //Switching from 10G_CPRI to 9P8G_CPRI
                                                                      return_hssi = HSSI_10GCPRI_TO_9P8CPRI(port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x6);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 6){
                                                              if (next_profile == 0x10){
                                                                      //Switching from 9P8G_CPRI to 25G_PTP_FEC
                                                                      return_hssi = HSSI_9P8CPRI_TO_25GPTPFEC(port_num,rsfec_port_num);
                                                                      //sets the time for a single TX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB10, 0x9EE01);
                                                                      //sets the time for a single RX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB11, 0x9EE01);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x17){
                                                                      //Switching from 9P8G_CPRI to 4P9G_CPRI
                                                                      return_hssi = HSSI_9P8CPRI_TO_4P9CPRI(port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x7);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 7){
                                                              if (next_profile == 0x10){
                                                                      //Switching from 4P9G_CPRI to 25G_PTP_FEC
                                                                      return_hssi = HSSI_4P9CPRI_TO_25GPTPFEC(port_num,rsfec_port_num);
                                                                      //sets the time for a single TX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB10, 0x9EE01);
                                                                      //sets the time for a single RX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB11, 0x9EE01);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x18){
                                                                      //Switching from 4P9G_CPRI to 2P4G_CPRI
                                                                      return_hssi = HSSI_4P9CPRI_TO_2P4CPRI(port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x8);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 8){
                                                              if (next_profile == 0x10){
                                                                      //Switching from 2P4G_CPRI to 25G_PTP_FEC
                                                                      return_hssi = HSSI_2P4CPRI_TO_25GPTPFEC(port_num,rsfec_port_num);
                                                                      //sets the time for a single TX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB10, 0x9EE01);
                                                                      //sets the time for a single RX serial bit
                                                                      IOWR(ehip_reconfig_base_addr, 0xB11, 0x9EE01);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x13){
                                                                      //Switching from 2P4G_CPRI to 24G_CPRI_FEC
                                                                      return_hssi = HSSI_2P4CPRI_TO_24GCPRIFEC(port_num,rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x3);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                               else {
                                                                //printf("DR switching to profile %lx is not supported in group-1 25G+PTP+FEC on port %d!\n", next_profile, port_num);
                                                                return_value = 1;
                                                        }
                                       
                               }

                               //************************************ PROFILE_1_END*************************************************************

                               //-------------------------------------- PROFILE_2_start DR switching 24G CPRI+FEC ---------------------------------------------
                else if(rdata_base == 2){
                                        if(rdata_curr == 0){
                                                              if (next_profile == 0x21){
                                                                      //Switching from 24G_CPRI_FEC to 24G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                              }
                                                              else if (next_profile == 0x22){
                                                                      //Switching from 24G_CPRI_FEC to 12G_CPRI _RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                              }
                                                              else if (next_profile == 0x23){
                                                                      //Switching from 24G_CPRI_FEC to 12G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x3);
                                                              }
                                                              else if (next_profile == 0x24){
                                                                      //Switching from 24G_CPRI_FEC to 10G_CPRI _RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x4);
                                                              }
                                                              else if (next_profile == 0x25){
                                                                      //Switching from 24G_CPRI_FEC to 10G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x5);
                                                              }
                                                              else if (next_profile == 0x26){
                                                                      //Switching from 24G_CPRI_FEC to 9.8G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 3;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8G(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x6);
                                                              }
                                                              else if (next_profile == 0x27){
                                                                      //Switching from 24G_CPRI_FEC to 4.9G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 4;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x7);
                                                              }
                                                              else if (next_profile == 0x28){
                                                                      //Switching from 24G_CPRI_FEC to 2.4G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 5;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x8);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 1){
                                                              if (next_profile == 0x20){
                                                                      //Switching from 24G_CPRI to 24G_CPRI_FEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x22){
                                                                      //Switching from 24G_CPRI to 12G_CPRI_RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                              }
                                                              else if (next_profile == 0x23){
                                                                      //Switching from 24G_CPRI to 12G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x3);
                                                              }
                                                              else if (next_profile == 0x24){
                                                                      //Switching from 24G_CPRI to 10G_CPRI_RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x4);
                                                              }
                                                              else if (next_profile == 0x25){
                                                                      //Switching from 24G_CPRI to 10G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x5);
                                                              }
                                                              else if (next_profile == 0x26){
                                                                      //Switching from 24G_CPRI to 9.8G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 3;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8G(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x6);
                                                              }
                                                              else if (next_profile == 0x27){
                                                                      //Switching from 24G_CPRI to 4.9G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 4;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x7);
                                                              }
                                                              else if (next_profile == 0x28){
                                                                      //Switching from 24G_CPRI to 2.4G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 5;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x8);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 2){
                                                              if (next_profile == 0x20){
                                                                      //Switching from 12G_CPRI_RSFEC to 24G_CPRI_FEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x21){
                                                                      //Switching from 12G_CPRI_RSFEC to 24G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                              }
                                                              else if (next_profile == 0x23){
                                                                      //Switching from 12G_CPRI_RSFEC to 12G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x3);
                                                              }
                                                              else if (next_profile == 0x24){
                                                                      //Switching from 12G_CPRI_RSFEC to 10G_CPRI_RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x4);
                                                              }
                                                              else if (next_profile == 0x25){
                                                                      //Switching from 12G_CPRI_RSFEC to 10G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x5);
                                                              }
                                                              else if (next_profile == 0x26){
                                                                      //Switching from 12G_CPRI_RSFEC to 9.8G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 3;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8G(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x6);
                                                              }
                                                              else if (next_profile == 0x27){
                                                                      //Switching from 12G_CPRI_RSFEC to 4.9G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 4;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x7);
                                                              }
                                                              else if (next_profile == 0x28){
                                                                      //Switching from 12G_CPRI_RSFEC to 2.4G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 5;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x8);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 3){
                                                              if (next_profile == 0x20){
                                                                      //Switching from 12G_CPRI to 24G_CPRI_FEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x21){
                                                                      //Switching from 12G_CPRI to 24G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                              }
                                                              else if (next_profile == 0x22){
                                                                      //Switching from 12G_CPRI to 12G_CPRI_RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                              }
                                                              else if (next_profile == 0x24){
                                                                      //Switching from 12G_CPRI to 10G_CPRI_RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x4);
                                                              }
                                                              else if (next_profile == 0x25){
                                                                      //Switching from 12G_CPRI to 10G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x5);
                                                              }
                                                              else if (next_profile == 0x26){
                                                                      //Switching from 12G_CPRI to 9.8G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 3;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8G(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x6);
                                                              }
                                                              else if (next_profile == 0x27){
                                                                      //Switching from 12G_CPRI to 4.9G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 4;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x7);
                                                              }
                                                              else if (next_profile == 0x28){
                                                                      //Switching from 12G_CPRI to 2.4G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 5;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x8);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 4){
                                                              if (next_profile == 0x20){
                                                                      //Switching from 10G_CPRI_RSFEC to 24G_CPRI_FEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x21){
                                                                      //Switching from 10G_CPRI_RSFEC to 24G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                              }
                                                              else if (next_profile == 0x22){
                                                                      //Switching from 10G_CPRI_RSFEC to 12G_CPRI_RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                              }
                                                              else if (next_profile == 0x23){
                                                                      //Switching from 10G_CPRI_RSFEC to 12G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x3);
                                                              }
                                                              else if (next_profile == 0x25){
                                                                      //Switching from 10G_CPRI_RSFEC to 10G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x5);
                                                              }
                                                              else if (next_profile == 0x26){
                                                                      //Switching from 10G_CPRI_RSFEC to 9.8G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 3;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8G(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x6);
                                                              }
                                                              else if (next_profile == 0x27){
                                                                      //Switching from 10G_CPRI_RSFEC to 4.9G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 4;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x7);
                                                              }
                                                              else if (next_profile == 0x28){
                                                                      //Switching from 10G_CPRI_RSFEC to 2.4G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 5;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x8);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 5){
                                                              if (next_profile == 0x20){
                                                                      //Switching from 10G_CPRI to 24G_CPRI_FEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x21){
                                                                      //Switching from 10G_CPRI to 24G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                              }
                                                              else if (next_profile == 0x22){
                                                                      //Switching from 10G_CPRI to 12G_CPRI_RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                              }
                                                              else if (next_profile == 0x23){
                                                                      //Switching from 10G_CPRI to 12G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x3);
                                                              }
                                                              else if (next_profile == 0x24){
                                                                      //Switching from 10G_CPRI to 10G_CPRI_RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x4);
                                                              }
                                                              else if (next_profile == 0x26){
                                                                      //Switching from 10G_CPRI to 9.8G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 3;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8G(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x6);
                                                              }
                                                              else if (next_profile == 0x27){
                                                                      //Switching from 10G_CPRI to 4.9G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 4;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x7);
                                                              }
                                                              else if (next_profile == 0x28){
                                                                      //Switching from 10G_CPRI to 2.4G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 5;
                                                                      return_hssi = HSSI_cpri9P8Gabove_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x8);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 6){
                                                              if (next_profile == 0x20){
                                                                      //Switching from 9.8G_CPRI to 24G_CPRI_FEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8G_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x21){
                                                                      //Switching from 9.8G_CPRI to 24G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8G_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                              }
                                                              else if (next_profile == 0x22){
                                                                      //Switching from 9.8G_CPRI to 12G_CPRI_RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8G_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                              }
                                                              else if (next_profile == 0x23){
                                                                      //Switching from 9.8G_CPRI to 12G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8G_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x3);
                                                              }
                                                              else if (next_profile == 0x24){
                                                                      //Switching from 9.8G_CPRI to 10G_CPRI_RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8G_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x4);
                                                              }
                                                              else if (next_profile == 0x25){
                                                                      //Switching from 9.8G_CPRI to 10G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8G_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x5);
                                                              }
                                                              else if (next_profile == 0x27){
                                                                      //Switching from 9.8G_CPRI to 4.9G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 4;
                                                                      return_hssi = HSSI_cpri9P8G_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x7);
                                                              }
                                                              else if (next_profile == 0x28){
                                                                      //Switching from 9.8G_CPRI to 2.4G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 5;
                                                                      return_hssi = HSSI_cpri9P8G_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x8);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 7){
                                                              if (next_profile == 0x20){
                                                                      //Switching from 4.9G_CPRI to 24G_CPRI_FEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x21){
                                                                      //Switching from 4.9G_CPRI to 24G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                              }
                                                              else if (next_profile == 0x22){
                                                                      //Switching from 4.9G_CPRI to 12G_CPRI_RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                              }
                                                              else if (next_profile == 0x23){
                                                                      //Switching from 4.9G_CPRI to 12G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x3);
                                                              }
                                                              else if (next_profile == 0x24){
                                                                      //Switching from 4.9G_CPRI to 10G_CPRI_RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x4);
                                                              }
                                                              else if (next_profile == 0x25){
                                                                      //Switching from 4.9G_CPRI to 10G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x5);
                                                              }
                                                              else if (next_profile == 0x26){
                                                                      //Switching from 4.9G_CPRI to 9.8G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 3;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8G(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x6);
                                                              }
                                                              else if (next_profile == 0x28){
                                                                      //Switching from 4.9G_CPRI to 2.4G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 5;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x8);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else if(rdata_curr == 8){
                                                              if (next_profile == 0x20){
                                                                      //Switching from 2.4G_CPRI to 24G_CPRI_FEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                              }
                                                              else if (next_profile == 0x21){
                                                                      //Switching from 2.4G_CPRI to 24G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 0;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                              }
                                                              else if (next_profile == 0x22){
                                                                      //Switching from 2.4G_CPRI to 12G_CPRI_RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                              }
                                                              else if (next_profile == 0x23){
                                                                      //Switching from 2.4G_CPRI to 12G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 1;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x3);
                                                              }
                                                              else if (next_profile == 0x24){
                                                                      //Switching from 2.4G_CPRI to 10G_CPRI_RSFEC
                                                                      fec_ena = 1;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x4);
                                                              }
                                                              else if (next_profile == 0x25){
                                                                      //Switching from 2.4G_CPRI to 10G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 2;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8Gabove(port_num, fec_ena, cpri_speed, rsfec_port_num);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x5);
                                                              }
                                                              else if (next_profile == 0x26){
                                                                      //Switching from 2.4G_CPRI to 9.8G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 3;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8G(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x6);
                                                              }
                                                              else if (next_profile == 0x27){
                                                                      //Switching from 2.4G_CPRI to 4.9G_CPRI
                                                                      fec_ena = 0;
                                                                      cpri_speed = 4;
                                                                      return_hssi = HSSI_cpri9P8Gbelow_TO_cpri9P8Gbelow(port_num, fec_ena, cpri_speed);
                                                                      IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x7);
                                                              }
                                                              if (return_hssi != 0){
                                                                      return_value = 1;
                                                              }
                                                      }
                                        else {
                                                                // printf("DR switching to profile %lx is not supported in group-2 24G+CPRI+FEC on port %d!\n", next_profile, port_num);
                                                                return_value = 1;
                                                        }

                               }
                               //************************************ PROFILE_2_END*************************************************************

                               //-------------------------------------- PROFILE_3_start DR switching 100G FEC -------------------------------------------------
                else if(rdata_base == 3){
                                       //checking DR switch command on Port 0,4,8,12
                                       if (port_num == 0 || port_num == 4 || port_num == 8 || port_num == 12 ){
                                        if(rdata_curr == 0){
                                                                      if(next_profile == 0x31){
                                                                              //Switching to 100G_NOFEC 
                                                                              return_hssi = HSSI_TO_100G_NOFEC(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                                      }
                                                                      else if(next_profile == 0x32){
                                                                              //Switching to 4x25G_FEC 
                                                                              return_hssi = HSSI_TO_4x25g_fec(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                                      }
                                                                      else if(next_profile == 0x33){
                                                                              //Switching to 4x25G_NOFEC 
                                                                              return_hssi = HSSI_TO_4x25g_nofec(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x3);
                                                                      }
                                                                      else if(next_profile == 0x34){
                                                                              //Switching to 4x25G_NOFEC 
                                                                              return_hssi = HSSI_TO_PAM4(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x4);
                                                                      }
                                                                      else if(next_profile == 0x35){
                                                                              //Switching to 100G NRZ 544/514 FEC 
                                                                              return_hssi = HSSI_TO_100G_KPFEC(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x5);
                                                                      }
                                                                      else{
                                                                          return_hssi = 1;
                                                                      }
                                                                      if (return_hssi != 0){
                                                                              return_value = 1;
                                                                      }
                                                              }

                                        else if(rdata_curr == 1){
                                                                      if(next_profile == 0x30){
                                                                              //Switching to 100G_FEC 
                                                                              return_hssi = HSSI_TO_100G_FEC(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                                      }
                                                                      else if(next_profile == 0x32){
                                                                              //Switching to 4x25G_FEC 
                                                                              return_hssi = HSSI_TO_4x25g_fec(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                                      }
                                                                      else if(next_profile == 0x33){
                                                                              //Switching to 4x25G_NOFEC 
                                                                              return_hssi = HSSI_TO_4x25g_nofec(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x3);
                                                                      }
                                                                      else if(next_profile == 0x34){
                                                                              //Switching to 4x25G_NOFEC 
                                                                              return_hssi = HSSI_TO_PAM4(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x4);
                                                                      }
                                                                      else if(next_profile == 0x35){
                                                                              //Switching to 100G NRZ 544/514 FEC 
                                                                              return_hssi = HSSI_TO_100G_KPFEC(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x5);
                                                                      }
                                                                      else{
                                                                          return_hssi = 1;
                                                                      }
                                                                      if (return_hssi != 0){
                                                                              return_value = 1;
                                                                      }
                                                              }

                                        else if(rdata_curr == 2){
                                                                      if(next_profile == 0x30){
                                                                              //Switching to 100G_FEC 
                                                                              return_hssi = HSSI_TO_100G_FEC(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                                      }
                                                                      else if(next_profile == 0x31){
                                                                              //Switching to 100G_NOFEC 
                                                                              return_hssi = HSSI_TO_100G_NOFEC(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                                      }
                                                                      else if(next_profile == 0x33){
                                                                              //Switching to 4x25G_NOFEC 
                                                                              return_hssi = HSSI_TO_4x25g_nofec(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x3);
                                                                      }
                                                                      if (return_hssi != 0){
                                                                              return_value = 1;
                                                                      }
                                                              }

                                        else if(rdata_curr == 3){
                                                                      if(next_profile == 0x30){
                                                                              //Switching to 100G_FEC 
                                                                              return_hssi = HSSI_TO_100G_FEC(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                                      }
                                                                      else if(next_profile == 0x31){
                                                                              //Switching to 100G_NOFEC 
                                                                              return_hssi = HSSI_TO_100G_NOFEC(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                                      }
                                                                      else if(next_profile == 0x32){
                                                                              //Switching to 4x25G_FEC 
                                                                              return_hssi = HSSI_TO_4x25g_fec(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x2);
                                                                      }
                                                                      if (return_hssi != 0){
                                                                              return_value = 1;
                                                                      }
                                                              }
                                        else if(rdata_curr == 4){
                                                                      if(next_profile == 0x30){
                                                                              //Switching to 100G_FEC 
                                                                              return_hssi = HSSI_TO_100G_FEC(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                                      }
                                                                      else if(next_profile == 0x31){
                                                                              //Switching to 100G_NOFEC 
                                                                              return_hssi = HSSI_TO_100G_NOFEC(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                                      }
                                                                      if (return_hssi != 0){
                                                                              return_value = 1;
                                                                      }
                                                              }
                                        else if(rdata_curr == 5){
                                                                      if(next_profile == 0x30){
                                                                              //Switching to 100G_FEC 
                                                                              return_hssi = HSSI_TO_100G_FEC(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
                                                                      }
                                                                      else if(next_profile == 0x31){
                                                                              //Switching to 100G_NOFEC 
                                                                              return_hssi = HSSI_TO_100G_NOFEC(port_num);
                                                                              IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x1);
                                                                      }
                                                                      if (return_hssi != 0){
                                                                              return_value = 1;
                                                                      }
                                                              }
                                                       else {
                                                                        //printf("DR switching to profile %lx is not supported in group-3 100G+FEC on port %d!\n", next_profile, port_num);
                                                                        return_value = 1;
                                                                }
                                               }
                                       }

                               //************************************ PROFILE_3_END*************************************************************
                        else {
                                         //printf("next profile:%lx is invalid for DR Operation on %d !\n", next_profile, port_num);
                                         return_value = 1;
                                 }
        }
        //Removing tx/rx and bridge resets(this is for all profiles)
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
        if (return_value == 0) {        
                port_config_update(port_num, next_profile);
        }

        //unPausing the hotplug logic
        IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_HOTPLUG_DISABLE_BASE, 0x0);

        return return_value;
}
