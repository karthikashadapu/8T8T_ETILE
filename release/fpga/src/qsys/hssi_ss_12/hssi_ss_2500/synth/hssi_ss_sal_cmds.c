//#include <stdint.h>
#include <stdio.h>
#include <unistd.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "hssi_ss_reconfig.h"

//int main(){
//    enable_serial_loopback (0,1);
//    disable_serial_loopback (0,1);
//    get_mtu (1);
//    read_stats (0);
//    firmware_version ();
//    }
//
//
//***********************************************************************************************************************
extern unsigned char sim_mode;

void rst_wait(unsigned int i)
{
        //each nop = ~5 cpu cycles
        //1GHz clk = 1ns * 5cycles, n=200 => 1us
        //Each nop = 57clocks ????
        //unsigned int n = 0;
        alt_timestamp_start();
        do {

                //10msec timeout, assuming 250mhz
        } while ((alt_timestamp() < i));
     //   for (n=0; n<20; n++)
     //   {
     //           __asm volatile ("nop" ::);
     //   }
}

unsigned char get_ch_num (unsigned char port_num) {
    unsigned char ch_num;
    if (port_num > 11) {
    	ch_num = port_num + 8;
    } else if (port_num > 3) {
    	ch_num = port_num + 4;
    } else {
    	ch_num = port_num + 0;
    }
    return ch_num;
}

unsigned char get_port_num (unsigned char ch_num) {
    unsigned char port_num;
    if (ch_num > 19) {
    	port_num = ch_num - 8;
    } else if (ch_num > 7) {
    	port_num = ch_num - 4;
    } else {
    	port_num = ch_num;
    }
    return port_num;
}

unsigned char polling_for_cfg_bit (unsigned long xcvr_base_addr, unsigned long reg_num, unsigned short bit_num) {
    unsigned long rdata0;
    unsigned long iteration = 70000;
    unsigned long i = 0;
    unsigned char return_value = 0;

    rdata0 = IORD_8DIRECT(xcvr_base_addr, reg_num);
    if (bit_num == 7) {
        while (((rdata0 & 0x80) != 0x80) && (i < iteration)) {
            
            //    printf ("INFO: Polling for pma register: %lx, configuration bit 7, read data: %ld\n", reg_num, rdata0);
            
            i = i + 1;
            rdata0 = IORD_8DIRECT(xcvr_base_addr, reg_num);
        }
    } else {
        while (((rdata0 & 0x01) != 0x00) && (i < iteration)) {
            
            //    printf ("INFO: Polling for pma register: %lx, configuration bit 0, read data: %ld\n", reg_num, rdata0);
            
            i = i + 1;
            rdata0 = IORD_8DIRECT(xcvr_base_addr, reg_num);
        }
    }

       if (i == iteration) {
        
            printf ("ERROR: Polling for pma register %lx failed\n", reg_num);
        
        return_value = 1;
    }
                rst_wait(200);

    return return_value;
}

unsigned char polling_for_cfg_value_compare (unsigned long xcvr_base_addr, unsigned long reg_num, unsigned short compare_value) {
    unsigned int rdata0;
    unsigned int iteration = 30000;
    unsigned int i = 0;
    unsigned char return_value = 0;

    rdata0 = IORD_8DIRECT(xcvr_base_addr, reg_num);

    while ((rdata0 != compare_value) && (i < iteration)) {
       // printf ("INFO: Polling for pma register: %lx, configuration bit 0, read data: %ld\n", reg_num, rdata0);
        i = i + 1;
        rdata0 = IORD_8DIRECT(xcvr_base_addr, reg_num);
    }

    if (i == iteration) {
        printf ("ERROR: Polling for pma register %lx failed\n", reg_num);
        return_value = 1;
    }

    rst_wait(200);
    return return_value;
}

//PMA XCVR AVMM Config code
unsigned char pma_cfg_code(unsigned char ch_num, unsigned int code, unsigned int data){
		unsigned int return_value = 0;
    unsigned long xcvr_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x50000);

        IOWR_8DIRECT(xcvr_base_addr, 0x84, (data & 0x00ff));
        IOWR_8DIRECT(xcvr_base_addr, 0x85, ((data >> 8) & 0x00ff));
        IOWR_8DIRECT(xcvr_base_addr, 0x86, (code & 0x00ff));
        IOWR_8DIRECT(xcvr_base_addr, 0x87, ((code >> 8) & 0x00ff));

        IOWR_8DIRECT(xcvr_base_addr, 0x90, 0x1);

        // Polling PMA register
        //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A(7) is asserted.
        //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
        return_value += polling_for_cfg_bit (xcvr_base_addr, 0x8A, 7);

        //  Verify that 0x8B(0) de-asserts to indicate that the PMA register read/write transaction completed.
        //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
        return_value += polling_for_cfg_bit (xcvr_base_addr, 0x8B, 0);

        //Verify that 0x88 ,0x89 PMA attribute code is expected to return data
        return_value += polling_for_cfg_value_compare (xcvr_base_addr, 0x88, (code & 0x00ff));
        return_value += polling_for_cfg_value_compare (xcvr_base_addr, 0x89, ((code >> 8) & 0x00ff));

        // Write 1'b1 to 0x8A(7) to clear the 0x8A(7) value
        IOWR_8DIRECT(xcvr_base_addr, 0x8A, 0x80);
        if (return_value == 0){
          return 0;
        }
        else {
          return 1;
        }
}
//PMA XCVR AVMM Config code updated function for 0x2c/0x6c/0xEC attibute code
unsigned char pma_cfg_code_ana_param(unsigned char ch_num, unsigned int code, unsigned int data){
		unsigned int return_value = 0;
		unsigned long xcvr_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x50000);
        IOWR_8DIRECT(xcvr_base_addr, 0x84, (data & 0x00ff));
        IOWR_8DIRECT(xcvr_base_addr, 0x85, ((data >> 8) & 0x00ff));
        IOWR_8DIRECT(xcvr_base_addr, 0x86, (code & 0x00ff));
        IOWR_8DIRECT(xcvr_base_addr, 0x87, ((code >> 8) & 0x00ff));

        IOWR_8DIRECT(xcvr_base_addr, 0x90, 0x1);

        // Polling PMA register
        //  Verify that the PMA register read/write is sent to the PMA by verifying that 0x8A(7) is asserted.
        //    Addr: 8A,bit7: cfg_core_int_in_prog_assert: Expect 1
        return_value += polling_for_cfg_bit (xcvr_base_addr, 0x8A, 7);

        //  Verify that 0x8B(0) de-asserts to indicate that the PMA register read/write transaction completed.
        //   Addr: 8B,bit0: cfg_core_int_in_progress: Expect 0
        return_value += polling_for_cfg_bit (xcvr_base_addr, 0x8B, 0);

        //Read 0x89 to 0x88 if the PMA attribute code is expected to return data. Ignoring for attribute codes 0x2c, 0x6c
        // Write 1'b1 to 0x8A(7) to clear the 0x8A(7) value
        IOWR_8DIRECT(xcvr_base_addr, 0x8A, 0x80);
        if (return_value == 0){
          return 0;
        }
        else {
          return 1;
        }
}
//Enable serial loopback
//In ANLT case
// 1. KR_PAUSE
// 2. wait for pause confirm
// 3. set ignore_nonce 
// 4. enable loopback
// 5. kr_unpause

//unsigned char kr_pause(unsigned char ch_num) {
//  unsigned long rdata;
//	unsigned long eth_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x0);
//  rdata = IORD(eth_base_addr, 0xB0);
//  IOWR(eth_base_addr, 0xB0, ((rdata & 0x7FFFFFFF) | 0x80000000));
//  rdata = IORD(eth_base_addr, 0xB0);
//  //if its not written into 0xB0 register then IP is in reset or ANLT is not enabled
//  if(!(rdata & 0x80000000)) {
//    return 0;
//  }
//  do {
//    rdata = IORD(eth_base_addr, 0xB1);
//  } while (!(rdata & 0x80000000));
//  return 1;
//}

//void kr_unpause(unsigned char ch_num) {
//  unsigned long rdata;
//	unsigned long eth_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x0);
//  rdata = IORD(eth_base_addr, 0xB0);
//  IOWR(eth_base_addr, 0xB0, (rdata & 0x7FFFFFFF));
//  do {
//    rdata = IORD(eth_base_addr, 0xB1);
//  } while (rdata & 0x80000000);
//}

void ignore_nonce_en(unsigned char ch_num) {
  unsigned long rdata;
	unsigned long eth_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x0);
  IOWR(eth_base_addr, 0xD0, 0xE4A81);
  rdata=IORD(eth_base_addr, 0xC0);
  IOWR(eth_base_addr, 0xC0, ((rdata & 0xFFFFFF7F) | 0x00000080));
}

void ignore_nonce_dis(unsigned char ch_num, unsigned char anlt_vsr_en) {
  unsigned long rdata;
	unsigned long eth_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x0);
  if(anlt_vsr_en) {
    IOWR(eth_base_addr, 0xD0, 0xE4A81);
  } else {
    IOWR(eth_base_addr, 0xD0, 0x4A81);
  }
  rdata=IORD(eth_base_addr, 0xC0);
  IOWR(eth_base_addr, 0xC0, ((rdata & 0xFFFFFF7F) | 0x00000000));
}

void kr_restart(unsigned char ch_num) {
  unsigned long rdata;
	unsigned long eth_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x0);
  rdata=IORD(eth_base_addr, 0xB0);
  IOWR(eth_base_addr, 0xB0, ((rdata & 0xFFFFFFFE) | 0x00000001));
}

unsigned char enable_serial_loopback (unsigned int port_num) {
        unsigned int return_value = 0;
        char ch_num = get_ch_num(port_num);
        unsigned long profile, rdata0, rdata1;
        unsigned long wdata1;
        unsigned char hotplug_paused;
        unsigned char anlt_en;
        unsigned long port_params_addr = (unsigned long)(0x4110700) + (unsigned long)(port_num*0x10);
	      unsigned long eth_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x0);
        rdata0 = IORD_ALTERA_AVALON_PIO_DATA(port_params_addr);
        profile = (rdata0 >> 1);

        //Pausing the hotplug logic
        //100G NRZ
        rdata1 = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_HOTPLUG_DISABLE_BASE);
        if(((profile & 0x0000003F) == 27) || ((profile & 0x0000003F) == 26)){
          wdata1 = (0xF << port_num) | (rdata1 & 0xFFFF0000);
        } 
        else {
          wdata1 = (0x1 << port_num) | (rdata1 & 0xFFFF0000);
        }
        IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_HOTPLUG_DISABLE_BASE, wdata1);


        //Waiting for hotplug logic to enter into pause/idle state
		    alt_timestamp_start();
        do {
          rdata1 = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_HOTPLUG_PAUSED_BASE);
          if(((profile & 0x0000003F) == 27) || ((profile & 0x0000003F) == 26)){
            hotplug_paused = (((rdata1 >> port_num) & 0x000F) == 0xF);
          } else {
            hotplug_paused = (((rdata1 >> port_num) & 0x0001) == 0x1);
          }
        } while ((alt_timestamp() < 4000000000) && (hotplug_paused == 0));



        //anlt is bit-18, but shifting 17 as profile is already shifted by 1
        anlt_en = ((profile >> 17) & 0x00000001); 
        //anlt_en = ((profile >> 17) & 0x00000001) & (sim_mode == 0);

        if (anlt_en) {
          //kr_pause(ch_num);
          ignore_nonce_en(ch_num);
        }

        if (anlt_en) {
          rdata0 = IORD(eth_base_addr, 0xB0);
          IOWR(eth_base_addr, 0xB0, ((rdata0 & 0xFFF0FFFF) | 0xF0000));
        } else {
        if((profile & 0x0000003F) == 27){
                return_value += pma_cfg_code(ch_num, 0x8, 0x101);
                return_value += pma_cfg_code(ch_num+1, 0x8, 0x101);
                return_value += pma_cfg_code(ch_num+2, 0x8, 0x101);
                return_value += pma_cfg_code(ch_num+3, 0x8, 0x101);
        }
        else if((profile & 0x0000003F) == 26){
                return_value += pma_cfg_code(ch_num, 0x8, 0x101);
                return_value += pma_cfg_code(ch_num+2, 0x8, 0x101);
        }
        else {
                return_value += pma_cfg_code(ch_num, 0x8, 0x101);
        }
        }
        //		printf("enable serial loopback for 100G\n");
        if(anlt_en) {
          //kr_unpause(ch_num);
          kr_restart(ch_num);
        }

        //unPausing the hotplug logic with setting lpbk en status to hotplug
        rdata1 = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_HOTPLUG_DISABLE_BASE);
        if(((profile & 0x0000003F) == 27) || ((profile & 0x0000003F) == 26)){
          wdata1 = ((0xF << port_num) << 16) | rdata1;
        } 
        else {
          wdata1 = ((0x1 << port_num) << 16) | rdata1;
        }
        //IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_HOTPLUG_DISABLE_BASE, 0x0);
        IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_HOTPLUG_DISABLE_BASE, (wdata1 & 0xFFFF0000));

        if (return_value == 0){
          return 0;
        }
        else {
          return 1;
        }
}


//Disable serial Loopback 

unsigned char disable_serial_loopback (unsigned int port_num) {
        unsigned int return_value = 0;
        char ch_num = get_ch_num(port_num);
        unsigned long profile, rdata0, rdata1;
        unsigned long wdata1;
        unsigned char hotplug_paused;
        unsigned char anlt_en;
        unsigned long port_params_addr = (unsigned long)(0x4110700) + (unsigned long)(port_num*0x10);
        //unsigned long anlt_vsr_addr = (unsigned long)(0x4110690) + (unsigned long)(port_num*0x10);
        unsigned int anlt_vsr_en = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_ANLT_VSR_EN_BASE);
        unsigned char port_anlt_vsr_en = (anlt_vsr_en >> port_num) & 0x0001;

        rdata0 = IORD_ALTERA_AVALON_PIO_DATA(port_params_addr);
        profile = (rdata0 >> 1);

        //Pausing the hotplug logic
        //100G NRZ
        rdata1 = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_HOTPLUG_DISABLE_BASE);
        if(((profile & 0x0000003F) == 27) || ((profile & 0x0000003F) == 26)){
          wdata1 = (0xF << port_num) | (rdata1 & 0xFFFF0000);
        } 
        else {
          wdata1 = (0x1 << port_num) | (rdata1 & 0xFFFF0000);
        }
        IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_HOTPLUG_DISABLE_BASE, wdata1);


        //Waiting for hotplug logic to enter into pause/idle state
		    alt_timestamp_start();
        do {
          rdata1 = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_HOTPLUG_PAUSED_BASE);
          if(((profile & 0x0000003F) == 27) || ((profile & 0x0000003F) == 26)){
            hotplug_paused = (((rdata1 >> port_num) & 0x000F) == 0xF);
          } else {
            hotplug_paused = (((rdata1 >> port_num) & 0x0001) == 0x1);
          }
        } while ((alt_timestamp() < 4000000000) && (hotplug_paused == 0));


        anlt_en = ((profile >> 17) & 0x00000001);
        //anlt_en = ((profile >> 17) & 0x00000001) & (sim_mode == 0);

        if (anlt_en) {
          //kr_pause(ch_num);
          ignore_nonce_dis(ch_num, port_anlt_vsr_en);
        }

        if (anlt_en) {
          unsigned long eth_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x0);
          rdata0 = IORD(eth_base_addr, 0xB0);
          IOWR(eth_base_addr, 0xB0, ((rdata0 & 0xFFF0FFFF) | 0x00000));
        } else {
        if ((profile & 0x0000003F) == 27){
                return_value += pma_cfg_code(ch_num, 0x8, 0x100);
                return_value += pma_cfg_code(ch_num+1, 0x8, 0x100);
                return_value += pma_cfg_code(ch_num+2, 0x8, 0x100);
                return_value += pma_cfg_code(ch_num+3, 0x8, 0x100);
        } else if ((profile & 0x0000003F) == 26){
                return_value += pma_cfg_code(ch_num, 0x8, 0x100);
                return_value += pma_cfg_code(ch_num+2, 0x8, 0x100);
        } else {
                return_value += pma_cfg_code(ch_num, 0x8, 0x100);
        }
        }
        //		printf("enable serial loopback for 100G\n");
        if(anlt_en) {
          //kr_unpause(ch_num);
          kr_restart(ch_num);
        }

        //unPausing the hotplug logic with setting lpbk en status to hotplug
        rdata1 = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_HOTPLUG_DISABLE_BASE);
        if(((profile & 0x0000003F) == 27) || ((profile & 0x0000003F) == 26)){
          wdata1 = (~((0xF << port_num) << 16)) & rdata1;
        } 
        else {
          wdata1 = (~((0x1 << port_num) << 16)) & rdata1;
        }
        IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_HOTPLUG_DISABLE_BASE, (wdata1 & 0xFFFF0000));

        if (return_value == 0){
          return 0;
        }
        else {
          return 1;
        }
}

// GET_MTU

void get_mtu (unsigned int ch_num ) {
	unsigned long rdata0, rdata1 = 0;
	unsigned long rdata =0;
  //printf("get mtu\n");
		unsigned long eth_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x0);
		rdata0 = IORD(eth_base_addr, 0x407); // Maximum TX frame size
		rdata1 = IORD(eth_base_addr, 0x506); // Maximum RX frame size
		//*tx_fsize = rdata0;  HSSI Read Data CSR is written with 16 bits of Maximum TX frame size to the MSB 
		//*rx_fsize = rdata1; HSSI Read Data CSR is written with 16 bits of Maximum RX frame size to the LSB 
		//rdata = {rdata0,rdata1};
		rdata = ((rdata0 & 0x0000ffff) <<16) | (rdata1 & 0x0000ffff);
    IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_RD_DATA_BASE, rdata);
}

// SET MTU
void set_mtu (unsigned int ch_num) {
        unsigned long wdata =0;
		    unsigned long eth_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x0);

        wdata = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_WR_DATA_BASE);

        IOWR(eth_base_addr, 0x407, ((wdata & 0xffff0000)>>16));         // Maximum TX frame size
        IOWR(eth_base_addr, 0x506, (wdata & 0x0000ffff)); // Maximum RX frame size
}

unsigned char set_csr(unsigned long offset_addr, unsigned char xcvr_byte_no, unsigned char ch_en) {
//time out of 10msec assuming axi lite clock is 125Mhz
//after timeout user needs to give app_ss_lite reset to bring bridge out of hung state
    unsigned long wr_data;
    wr_data = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_WR_DATA_BASE); 
    //unsigned char done = 0;
    //unsigned char error = 1;
		//alt_timestamp_start();
    //do {
      if ((((offset_addr >> 15) & 0x0000000F) == 2) && ch_en) {
        IOWR_8DIRECT((offset_addr <<2), xcvr_byte_no, (wr_data & 0xFF));
    //    done = 1;
    //    error = 0;
      } else {
        IOWR((offset_addr <<2), 0x0, wr_data);
    //    done = 1;
    //    error = 0;
      }
    //} while ((done == 0) || (alt_timestamp() < CSR_ACCESS_TIMER));
    //return error;
    return 0;
}

unsigned char get_csr(unsigned long offset_addr, unsigned char xcvr_byte_no, unsigned char ch_en) {
//time out of 10msec assuming axi lite clock is 125Mhz
//after timeout user needs to give app_ss_lite reset to bring bridge out of hung state
    unsigned long rd_data =0;
    //unsigned char done = 0;
    //unsigned char error = 1;
		//alt_timestamp_start();
    //do {
      if ((((offset_addr >> 15) & 0x0000000F)  == 2) && ch_en) {
        //XCVR PMA access
        rd_data = IORD_8DIRECT((offset_addr <<2), xcvr_byte_no);
    //    done = 1;
    //    error = 0;
      } else {
        rd_data = IORD((offset_addr <<2), 0x00000000);
   //     done = 1;
   //     error = 0;
      }
    //} while ((done == 0) || (alt_timestamp() < CSR_ACCESS_TIMER));
    IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_RD_DATA_BASE, rd_data);
    return 0;
    //return error;
}


//get link status 
void get_link_status (unsigned int ch_num) {

	//{
		//10bit zeros,
		//1bit OEM link speed valid (zero)
		//1bit serdes link,
		//2bit Link Partner Advertised Flow Control,
		//1bit Rx Flow Control Flag
		//1bit Tx Flow Control Flag
		//1bit Link Partner Advertised Speed and Duplex 10THD
		//1bit Link Partner Advertised Speed and Duplex 10TFD
		//1bit Link Partner Advertised Speed and Duplex 100TXHD
		//1bit Link Partner Advertised Speed and Duplex 100TXFD
		//1bit Link Partner Advertised Speed and Duplex 100T4
		//1bit Link Partner Advertised Speed and Duplex 1000THD
		//1bit Link Partner Advertised Speed and Duplex 1000TFD
		//1bit Reserved
		//1bit Parallel Detection Flag
		//1bit Auto Negotiate Complete
		//1bit Auto Negotiate Flag
		//4bit Speed and duplex
		//1bit Link Flag
	//}

	unsigned long rdata 		  		        = 0;
	unsigned long tx_pcs_ready 				    = 0;
	unsigned long rx_aligned   				    = 0;
	unsigned long serdes_link  				    = 0;
	unsigned long LPAF_temp   				    = 0;
	unsigned long Rx_Flow_Ctrl_Flag			  	= 0;
	unsigned long Tx_Flow_Ctrl_Flag 			= 0;
	unsigned long Parallel_Detection_Flag 		= 0;
	unsigned long Auto_Negotiate_Complete 		= 0;
	unsigned long Speed_and_duplex			  	= 0;
	unsigned long Link_Flag 					= 0;
	unsigned long Auto_Negotiate_Flag 			= 0;
	unsigned long readdata_c2 				    = 0;
	unsigned char port_num                		= 0;
	unsigned long port_params_addr 				= 0;
	unsigned char anlt_en						= 0;

	unsigned long eth_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x0);

	//getting ANLT enabled status
	port_num 				= get_port_num(ch_num);
	port_params_addr 		= (unsigned long)(0x4110700) + (unsigned long)(port_num*0x10);
	readdata_c2 			= IORD_ALTERA_AVALON_PIO_DATA(port_params_addr);
	anlt_en 				= ((readdata_c2 >> 18) & 0x00000001);


	tx_pcs_ready 			= IORD(eth_base_addr, 0x322);
	rx_aligned   			= IORD(eth_base_addr, 0x326);
	serdes_link  			= (tx_pcs_ready & rx_aligned & 0x00000001);
	rdata       			= serdes_link << 20;

	if (anlt_en) {
		LPAF_temp   			= IORD(eth_base_addr, 0xCB);
		LPAF_temp   			= (LPAF_temp >> 28) & 0x00000003;
		rdata			       	= rdata | (LPAF_temp << 18);

		readdata_c2 			= IORD(eth_base_addr, 0xC2);
		Auto_Negotiate_Complete = (readdata_c2 >> 2)  & 0x00000001;
		Link_Flag		     	= (readdata_c2 >> 6)  & 0x00000001;
		Parallel_Detection_Flag = (readdata_c2 >> 7)  & 0x00000001;
		Speed_and_duplex	    = (readdata_c2 >> 11) & 0x00000001;

		rdata       			= rdata | (Auto_Negotiate_Complete << 6);
		rdata    	       		= rdata | (Link_Flag << 0);
		rdata       			= rdata | (Parallel_Detection_Flag << 7);
		//rdata	        		= rdata | (Speed_and_duplex << 1);


		Auto_Negotiate_Flag 	= IORD(eth_base_addr, 0xC0);
		Auto_Negotiate_Flag 	= Auto_Negotiate_Flag & 0x00000001;

		rdata		      	    = rdata | (Auto_Negotiate_Flag << 5);

		//new
		if(Speed_and_duplex)
			Speed_and_duplex	= 0x0;
		else if(((readdata_c2 >> 21)  & 0x00000001) || ((readdata_c2 >> 22)  & 0x00000001))
			Speed_and_duplex	= 0xa;
		else if(((readdata_c2 >> 15)  & 0x00000001) || ((readdata_c2 >> 16)  & 0x00000001))
			Speed_and_duplex	= 0xb;
		else if(((readdata_c2 >> 19)  & 0x00000001) || ((readdata_c2 >> 23)  & 0x00000001))
			Speed_and_duplex	= 0xd;
		else
			Speed_and_duplex	= 0x0;

		rdata	        		= rdata | (Speed_and_duplex << 1);


	} else {
		Link_Flag		     	= serdes_link;
		rdata    	       		= rdata | Link_Flag;
	}

	Rx_Flow_Ctrl_Flag		= IORD(eth_base_addr , 0x705);
	Rx_Flow_Ctrl_Flag 		= ((Rx_Flow_Ctrl_Flag & 0x000000ff) != 0);
	rdata		 			= rdata | (Rx_Flow_Ctrl_Flag << 17);


	Tx_Flow_Ctrl_Flag 		= IORD(eth_base_addr , 0x605);
	Tx_Flow_Ctrl_Flag 		= ((Tx_Flow_Ctrl_Flag & 0x000001ff) != 0);
	rdata		 	       	= rdata | (Tx_Flow_Ctrl_Flag << 16);

	IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_RD_DATA_BASE, rdata);
}


//READ_STATISTICS 

void read_stats (unsigned int ch_num, unsigned int lsb, unsigned int counter) {
	unsigned long long  rdata = 0;
	unsigned long lower, upper = 0;
	//printf("read stats\n");

	unsigned long eth_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x0);
	//tx_packets
	if ( counter == 0 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x827))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x826))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x829))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x828))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x82B))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x82A))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x82D))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x82C))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x82F))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x82E))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x831))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x830))))) ;
	}
	//rx_packets
	if ( counter == 1 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x927))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x926))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x929))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x928))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92B))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92A))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92D))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92C))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92F))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92E))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x931))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x930))))) ;
	}
	//rx_crc_errors
	if ( counter == 2 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x905))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x904))))) ;
	}
	//rx_align_errors
	if ( counter == 3 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x905))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x904))))) - 
            ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x935))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x934))))) ;
	}
	//tx_bytes
	if ( counter == 4 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x861))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x860))))) ;
	}
	//rx_bytes
	if ( counter == 5 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x961))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x960))))) ;
	}
	//tx_pause
	if ( counter == 6 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x833))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x832))))) ;
	}
	//rx_pause
	if ( counter == 7 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x933))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x932))))) ;
	}
	//rx_errors
	if ( counter == 8 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x967))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x966))))) ;
	}
	//tx_errors
	if ( counter == 9 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x867))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x866))))) ;
	}
	//rx_unicast
	if ( counter == 10 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92B))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92A))))) + 
            ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x931))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x930))))) ;
	}
	//rx_multicast
	if ( counter == 11 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x927))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x926))))) + 
            ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92D))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92C))))) ;
	}
	//rx_broadcast
	if ( counter == 12 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x929))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x928))))) + 
            ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92F))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92E))))) ;
	}
	//tx_discards
	if ( counter == 13 ){
		rdata = 0;
	}
	//tx_unicast
	if ( counter == 14 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x82B))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x82A))))) + 
            ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x831))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x830))))) ;
	}
	

	//tx_multicast
	if ( counter == 15 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x827))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x826))))) + 
            ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x82D))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x82C))))) ;
	}
	

	//tx_broadcast
	if ( counter == 16 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x829))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x828))))) + 
            ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x82F))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x82E))))) ;
	}
	//ether_drops
	if ( counter == 17 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x967))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x966))))) ;
	}

	//rx_total_bytes
	if ( counter == 18 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x963))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x962))))) ;
	}
	//rx_total_packets
	if ( counter == 19 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x927))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x926))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x929))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x928))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92B))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92A))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92D))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92C))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92F))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x92E))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x931))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x930))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x909))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x908))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x90B))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x90A))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x90D))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x90C))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x90F))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x90E))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x911))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x910))))) +
				    ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x913))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x912))))) ;
	}
	//rx_undersize
	if ( counter == 20 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x935))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x934))))) ;
	}

	//rx_oversize
	if ( counter == 21 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x925))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x924))))) ;
	}
	//rx_64_bytes
	if ( counter == 22 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x917))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x916))))) ;
	}
	//rx_65_127_bytes
	if ( counter == 23 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x919))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x918))))) ;
	}
	
	//rx_128_255_bytes
	if ( counter == 24 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x91B))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x91A))))) ;
	}

	//rx_256_511_bytes
	if ( counter == 25 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x91D))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x91C))))) ;
	}
	//rx_512_1023_bytes
	if ( counter == 26 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x91F))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x91E))))) ;
	}
	//rx_1024_1518_bytes
	if ( counter == 27 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x921))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x920))))) ;
	}

	//rx_gte_1519_bytes
	if ( counter == 28 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x923))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x922))))) ;
	}

	//rx_jabbers
	if ( counter == 29 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x903))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x902))))) ;
	}
	//rx_runts
	if ( counter == 30 ){
		rdata = ((((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x935))) <<32) | (((unsigned long long) ((unsigned long) IORD(eth_base_addr, 0x934))))) ;
	}

	lower = rdata & 0xFFFFFFFF;
	upper = (rdata >> 32) & 0xFFFFFFFF;
	if (lsb == 1) {
    IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_RD_DATA_BASE, lower);
	}
	else {
    IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_RD_DATA_BASE, upper);
	}
}

//Firmware_version

void firmware_version () {
  unsigned int version =  0x01;
  IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_RD_DATA_BASE, version);
  //printf("get firmware_version\n");
 }


//***********************************************************************************************************************

unsigned char reset_MAC_stats (unsigned int ch_num, unsigned char tx_rst, unsigned char rx_rst) {
	
	unsigned long rdata,wdata;

	unsigned long eth_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x0);
	
	if (tx_rst == 1 && rx_rst == 0) {
		rdata = IORD(eth_base_addr, 0x845);
		wdata = rdata | 0x00000001;
		IOWR(eth_base_addr, 0x845, wdata);
    rst_wait(1200);
		wdata = rdata & 0xFFFFFFFE;
		IOWR(eth_base_addr, 0x845, wdata);
		return 0;
	}
	else if (tx_rst == 0 && rx_rst == 1) {
		rdata = IORD(eth_base_addr, 0x945);
		wdata = rdata | 0x00000001;
		IOWR(eth_base_addr, 0x945, wdata);
    rst_wait(1200);
		wdata = rdata & 0xFFFFFFFE;
		IOWR(eth_base_addr, 0x945, wdata);
		return 0;
	}
	else if (tx_rst == 1 && rx_rst == 1) {
		rdata = IORD(eth_base_addr, 0x845);
		wdata = rdata | 0x00000001;
		IOWR(eth_base_addr, 0x845, wdata);
    rst_wait(1200);
		wdata = rdata & 0xFFFFFFFE;
		IOWR(eth_base_addr, 0x845, wdata);

		rdata = IORD(eth_base_addr, 0x945);
		wdata = rdata | 0x00000001;
		IOWR(eth_base_addr, 0x945, wdata);
    rst_wait(1200);
		wdata = rdata & 0xFFFFFFFE;
		IOWR(eth_base_addr, 0x945, wdata);
		return 0;
	}
	else{
		//printf("Error: None of Rx and TX MAC reset are not set");
		return 1;
	}
}

//***********************************************************************************************************************
//PMA adaptation of all enabled ports, ports with ADME enabled, Recipe enabled, LT disabled 

void ical_run(unsigned char port_num, unsigned char load_en) {
  unsigned long xcvr_base_addr;
  unsigned char ch_num;

  ch_num = get_ch_num(port_num);
	xcvr_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x50000);
  if (load_en) {
    IOWR_8DIRECT(xcvr_base_addr, 0x200, 0xD1); 
    //IOWR(xcvr_base_addr, 0x200, 0x960102D1); 
  } 
  else {
    IOWR_8DIRECT(xcvr_base_addr, 0x200, 0xC1); 
    //IOWR(xcvr_base_addr, 0x200, 0x960102C1); 
  }
    IOWR_8DIRECT(xcvr_base_addr, 0x201, 0x02); 
    IOWR_8DIRECT(xcvr_base_addr, 0x202, 0x01); 
    IOWR_8DIRECT(xcvr_base_addr, 0x203, 0x96); 
}

void pcal_run(unsigned char port_num, unsigned char load_en) {
  unsigned long xcvr_base_addr;
  unsigned char ch_num;

  ch_num = get_ch_num(port_num);
	xcvr_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x50000);
  if (load_en) {
    IOWR_8DIRECT(xcvr_base_addr, 0x200, 0xF5); 
    //IOWR(xcvr_base_addr, 0x200, 0x960301F5); 
  } 
  else {
    IOWR_8DIRECT(xcvr_base_addr, 0x200, 0xE5); 
    //IOWR(xcvr_base_addr, 0x200, 0x960301E5); 
  }
    IOWR_8DIRECT(xcvr_base_addr, 0x201, 0x01); 
    IOWR_8DIRECT(xcvr_base_addr, 0x202, 0x03); 
    IOWR_8DIRECT(xcvr_base_addr, 0x203, 0x96); 
}

unsigned char xcvr_pma_config () {

  	unsigned int xcvr_ready;
  	unsigned int xcvr_load_en, qhip_en, ch_en;
  	unsigned long qhip_chs;
  	unsigned char rdata;
  	unsigned long rdata2;
  	//unsigned long eth_base_addr;
  	unsigned long xcvr_base_addr;
  	unsigned char ch_num, port_num, inst_num, num_chs;
		unsigned char qhip_ready;
    //unsigned char bypass_rst, bypass_load, insert_dly, bypass_ready;
  	unsigned short done=0, load_error=0, ical_error=0, pcal_error=0;
    unsigned char is_100g, load_error_100g;
    unsigned char return_value;
  	unsigned long port_params_addr;
		#define CLOCKS_TO_TIMEOUT 2000000000 

    //reading QHIP instance enable from PIO, QHIP 0-15
    qhip_en = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_QHIP_ENABLE_BASE);

    //reading no of channels per QHIP from PIO, 2bits per port,  QHIP 0 -15 
    qhip_chs = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_QHIP_NUM_CHANNELS_BASE); 

    //reading XCVR channel enable from PIO, Ch's 0-15
    ch_en = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_XCVR_CHANNEL_ENABLE_BASE); 

    //reading adaptation enable from PIO, QHIP 0-15 (port enable, ADME enable, Recipe Enabled and LT disabled)
    xcvr_load_en = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_LOAD_RECIPE_ENABLE_BASE); 
    //reading xcvr ready from each channel from PIO, channels 0-15
    xcvr_ready = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_XCVR_READY_BASE); 

    //rdata2 = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_COMMAND_BASE);
		//bypass_rst  = (rdata2 >> 8) & 0x00000001;
		//bypass_load = (rdata2 >> 9) & 0x00000001;
		//bypass_ready = (rdata2 >> 10) & 0x00000001;
		//insert_dly  = (rdata2 >> 11) & 0x00000001;

    //printf("qhip_en = %x \n", qhip_en);
    //printf("qhip_chs = %lx \n", qhip_chs);
    //printf("ch_en = %x \n", ch_en);
    //printf("xcvr_load_en = %x \n", xcvr_load_en);
    //printf("xcvr_ready = %x \n", xcvr_ready);

    // 1. Enabling AN/LT kr pause (for all ports) 
  	//for (port_num=0; port_num<16; port_num++) {
  	//  ch_num = get_ch_num(port_num);
		//	eth_base_addr = (unsigned long) (((ch_num+1) << 21));
  	//  rdata2 = IORD(eth_base_addr, 0xB0);
  	//  IOWR(eth_base_addr, 0xB0, ((rdata2 & 0x7FFFFFFF) | 0x80000000));
  	//}

	  // 2. Waiting for XCVR ready from enabled channels 
		// alt_timestamp_start();
    // printf("clock ticks = %x \n", alt_timestamp());	
	  //do {
	  //  xcvr_ready = IORD_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_XCVR_READY_BASE); 
	  //  done = (xcvr_ready | ~ch_en);
	  //} while ((done != 0xFFFF) & (alt_timestamp() < CLOCKS_TO_TIMEOUT));

    //printf("clock ticks = %x \n", alt_timestamp());	
		
		//if (bypass_ready) {
		//	xcvr_ready = 0xFFFF;
		//	printf("XCVR ready is bypassed\n");
		//}
		//if (bypass_load) {
		//	xcvr_load_en = 0x0000;
		//	printf("XCVR Load is bypassed\n");
		//}
		
	  done = (xcvr_ready | ~ch_en);
	  //printf("done = %x \n", done);
	
	  //setting cal error for failed channels 
		////load_error = ~xcvr_ready & ch_en;
		ical_error  = ~xcvr_ready & ch_en;
		pcal_error  = ~xcvr_ready & ch_en;
	
		//setting load error for failed channels, load error is set to 1 only if all channels with in that qhip are failed
	  for (inst_num=0; inst_num<16; inst_num++) {
			qhip_ready = 0;
			num_chs = ((qhip_chs >> (inst_num*2)) & 0x00000003) + 1;
	  	for (port_num=inst_num; port_num<(inst_num+num_chs); port_num++) {
			  qhip_ready = qhip_ready | ((xcvr_ready >> port_num) & 0x0001);
		  }
			if (qhip_ready == 0) {
				load_error = load_error | ((1 << inst_num) & xcvr_load_en);
			}
		}

	  //printf("load_error = %x \n", load_error);
	  //Disabling the enables for failed qhips/channels
	  xcvr_load_en = xcvr_load_en & ~load_error;
	  qhip_en = qhip_en & ~load_error;
	  ch_en   = ch_en & done;
	
	  //printf("qhip_en = %x \n", qhip_en);
	  //printf("ch_en = %x \n", ch_en);
	  //printf("xcvr_load_en = %x \n", xcvr_load_en);
	  //printf("xcvr_ready = %x \n", xcvr_ready);
	
	 
		//if (bypass_rst) {
		//				printf("Reset is bypassed\n");
		//}
		//else {
	  // 2. assert TX/RX reset for all ports (disabled ports rst is ignored in rtl) 
	  	for (port_num=0; port_num<16; port_num++) {
	   	 IOWR_ALTERA_AVALON_PIO_DATA((HSSI_SS_DR_CPU_0_CPU_P0_RESET_PIO_BASE + port_num*16), 0x08);
	 	  }
      rst_wait(1200);

	  // 3. de-assert TX reset for all ports (disabled ports rst is ignored in rtl) 
	  	for (port_num=0; port_num<16; port_num++) {
	  	  IOWR_ALTERA_AVALON_PIO_DATA((HSSI_SS_DR_CPU_0_CPU_P0_RESET_PIO_BASE + port_num*16), 0x0B);
	  	}
      rst_wait(1200);
		//}
	
	  // 4. check for load enabled inst's and load pma configuration
	  for (inst_num=0; inst_num<16; inst_num++) {
	    if ((xcvr_load_en >> inst_num) & 0x0001) {
	      ch_num = get_ch_num(inst_num);
			  xcvr_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x40000);
	      IOWR_8DIRECT(xcvr_base_addr, 0x143, 0x80);
	      //printf("loadng configuration for instance = %x \n", inst_num);
	    }
	  }

		//if (insert_dly) {
		//	printf("Inserting delay after load\n");
		//	alt_timestamp_start();
	  //	do {
	  //	} while (alt_timestamp() < CLOCKS_TO_TIMEOUT);
		//}
	
	  // 5. wait till load configuration complete for all QHIP's, and setting load error 
		alt_timestamp_start();
    //printf("clock ticks = %x \n", alt_timestamp());	
		//setting load error by default for all load enabled ports, and setting it to 0 after passing
	  for (inst_num=0; inst_num<16; inst_num++) {
			num_chs = ((qhip_chs >> (inst_num*2)) & 0x00000003) + 1;
	    for (port_num=inst_num; port_num<(inst_num+num_chs); port_num++) {
				load_error = load_error | (((xcvr_load_en >> inst_num) & 0x0001) << port_num);
			}
		}
	  done  = ~xcvr_load_en;
	  do {
	    for (inst_num=0; inst_num<16; inst_num++) {
			  num_chs = ((qhip_chs >> (inst_num*2)) & 0x00000003) + 1;
	      if (((xcvr_load_en >> inst_num) & 0x0001) & !((done >> inst_num) & 0x0001)) {
	        ch_num = get_ch_num(inst_num);
			    xcvr_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x40000);
	        rdata = IORD_8DIRECT(xcvr_base_addr, 0x144);
	        done = done | (((rdata & 0x01) | ((rdata >> 1) & 0x01)) << inst_num); 
	        //printf("load status for instance %x = %x \n", inst_num, rdata);
					if (~((rdata>>1) & 0x01) & (rdata & 0x01)) {
	        	for (port_num=inst_num; port_num<(inst_num+num_chs); port_num++) {
							load_error = load_error & ~(1 << port_num);
	        	}
				  }
	      }
	    }
	  } while ((done != 0xFFFF) & (alt_timestamp() < CLOCKS_TO_TIMEOUT));
	
    //printf("clock ticks = %x \n", alt_timestamp());	
    //printf("done = %x \n", done);	
    //printf("Load error = %x \n", load_error);	
    //printf("ICal error = %x \n", ical_error);	
    //printf("PCal error = %x \n", pcal_error);	
	  // 6. start ICAL for all QHIP's (including failed load config qhip's)
	  for (inst_num=0; inst_num<16; inst_num++) {
			num_chs = ((qhip_chs >> (inst_num*2)) & 0x00000003) + 1;
	    if ((qhip_en >> inst_num) & 0x0001) {
	      for (port_num=inst_num; port_num<(inst_num+num_chs); port_num++) {
					if ((ch_en >> port_num) & 0x0001) {
	      		//do ICAL for load fail case w/o parameter loading(bit-4) 
	        	if (((xcvr_load_en >> inst_num) & 0x0001) & !((load_error >> inst_num) & 0x0001)) { 
	        	  //printf("Running iCAL with load for port = %x \n", port_num);
	        	  ical_run(port_num, 1);
	        	} else {
	        	  //printf("Running iCAL with out load for port = %x \n", port_num);
	        	  ical_run(port_num, 0);
	        	}
	        }
	      }
	    }
	  }

		//if (insert_dly) {
		//	printf("Inserting delay after ICAL\n");
		//	alt_timestamp_start();
	  //	do {
	  //	} while ((alt_timestamp() < CLOCKS_TO_TIMEOUT));
		//}
	
	  // 7. wait for ICAL to finish or timeout 
		alt_timestamp_start();
    //printf("clock ticks = %x \n", alt_timestamp());	
	  done  = ~ch_en;
		//setting cal error by default for all enabled channels, and setting it to 0 after passing
		ical_error = ical_error | ch_en;
	  do {
	    for (inst_num=0; inst_num<16; inst_num++) {
				num_chs = ((qhip_chs >> (inst_num*2)) & 0x00000003) + 1;
	      if ((qhip_en >> inst_num) & 0x0001) {
	        for (port_num=inst_num; port_num<(inst_num+num_chs); port_num++) {
					  if (((ch_en>>port_num) & 0x0001) & !((done >> port_num) & 0x0001)) {
	          	ch_num = get_ch_num(port_num);
			      	xcvr_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x50000);
	          	rdata = IORD_8DIRECT(xcvr_base_addr, 0x207);
	          	if ((rdata == 0x80)) {
							  ical_error = ical_error & ~(1 << port_num);
								done = done | (1 << port_num);
	          	  //printf("ICAL status for port %x = %x \n", port_num, rdata);
							}
	          }
	        }
	      }
	    }
	  } while ((done != 0xFFFF) & (alt_timestamp() < CLOCKS_TO_TIMEOUT));
	
    //printf("clock ticks = %x \n", alt_timestamp());	
    //printf("ICAL done = %x \n", done);	
    //printf("Load error = %x \n", load_error);	
    //printf("ICal error = %x \n", ical_error);	
    //printf("PCal error = %x \n", pcal_error);	

		//disabling the ical failed channels
		//ch_en = ch_en & ~ical_error;
	
	
	  // 8. start PCAL for all QHIP's (including failed load config qhip's but failed ical channels as to disable ILB and PRBS)
	  for (inst_num=0; inst_num<16; inst_num++) {
			num_chs = ((qhip_chs >> (inst_num*2)) & 0x00000003) + 1;
	    if ((qhip_en >> inst_num) & 0x0001) {
	      for (port_num = inst_num; port_num<(inst_num+num_chs); port_num++) {
					if ((ch_en >> port_num) & 0x0001) {
	        	if (((xcvr_load_en >> inst_num) & 0x0001) & !((load_error >> inst_num) & 0x0001)) { 
	        	  //printf("Running pCAL with load for port = %x \n", port_num);
	        	  pcal_run(port_num, 1); 
	        	} else {
	        	  //printf("Running pCAL with out load for port = %x \n", port_num);
	        	  pcal_run(port_num, 0); 
					  }
	        }
	      }
	    }
	  }

		//if (insert_dly) {
		//	printf("Inserting delay after PCAL\n");
		//	alt_timestamp_start();
	  //	do {
	  //	} while ((alt_timestamp() < CLOCKS_TO_TIMEOUT));
		//}
	
	  // 9. wait for PCAL to finish or timeout 
		alt_timestamp_start();
    //printf("clock ticks = %x \n", alt_timestamp());	
	  done  = ~ch_en;
		//setting cal error by default for all enabled channels, and setting it to 0 after passing
		pcal_error = pcal_error | ch_en;
	  do {
	    for (inst_num=0; inst_num<16; inst_num++) {
				num_chs = ((qhip_chs >> (inst_num*2)) & 0x00000003) + 1;
	      if ((qhip_en >> inst_num) & 0x0001) {
	        for (port_num=inst_num; port_num<(inst_num+num_chs); port_num++) {
					  if (((ch_en>>port_num) & 0x0001) & !((done >> port_num) & 0x0001)) {
	          	ch_num = get_ch_num(port_num);
			      	xcvr_base_addr = (unsigned long) (((ch_num+1) << 21) + 0x50000);
	          	rdata = IORD_8DIRECT(xcvr_base_addr, 0x207);
	          	if ((rdata == 0x80)) {
							  pcal_error = pcal_error & ~(1 << port_num);
								done = done | (1 << port_num);
	          	  //printf("PCAL status for port %x = %x \n", port_num, rdata);
							}
	          }
	        }
	      }
	    }
	  } while ((done != 0xFFFF) & (alt_timestamp() < CLOCKS_TO_TIMEOUT));
	
    //printf("clock ticks = %x \n", alt_timestamp());	
    //printf("ICAL done = %x \n", done);	
	  //printf(" Load status : %x \n", load_error); 
	  //printf(" ICAL status : %x \n", ical_error); 
	  //printf(" PCAL status : %x \n", pcal_error); 
	
	  // 10. de-assert RX reset for all ports (disabled ports rst is ignored in rtl) 
		//if (bypass_rst) {
		//				printf("Reset is bypassed\n");
		//}
		//else
		//{
	  	for (port_num=0; port_num<16; port_num++) {
	    	IOWR_ALTERA_AVALON_PIO_DATA((HSSI_SS_DR_CPU_0_CPU_P0_RESET_PIO_BASE + port_num*16), 0x0F);
	  	}
		//}
	
	  ////Enabling AN/LT kr pause (for all ports) 
	  //for (port_num=0; port_num<16; port_num++) {
	  //  ch_num = get_ch_num(port_num);
		//	eth_base_addr = (unsigned long) (((ch_num+1) << 21));
	  //  rdata2 = IORD(eth_base_addr, 0xB0);
	  //  IOWR(eth_base_addr, 0xB0, (rdata2 & 0x7FFFFFFF));
	  //}

    for (port_num=0; port_num<16; port_num++) {
      port_params_addr = (unsigned long)(0x4110700) + (unsigned long)(port_num*0x10);
      if ((qhip_en >> port_num) & 0x0001) {
        rdata2 = IORD_ALTERA_AVALON_PIO_DATA(port_params_addr);
        rdata2 = (rdata2 >> 1);
        is_100g = ((rdata2 & 0x0000003F) == 0x1B) | ((rdata2 & 0x0000003F) == 0x1A);
	      //printf(" 100g Port status : %x rdata = %lx\n", is_100g, rdata2); 
        if (is_100g) {
          load_error_100g = (load_error >> port_num) | (load_error >> (port_num+1)) | (load_error >> (port_num+2)) |  (load_error >> (port_num+3));
          load_error = load_error | (load_error_100g << port_num);
        }
      }
    }
	
	  //printf(" Load status : %x \n", load_error); 
	  IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_LOAD_RECIPE_ERROR_BASE, load_error);
	  IOWR_ALTERA_AVALON_PIO_DATA(HSSI_SS_DR_CPU_0_CPU_XCVR_CAL_ERROR_BASE, (ical_error | pcal_error)); 
    return_value = (load_error != 0x0000) | (ical_error != 0x0000) | (pcal_error != 0x0000);
	
  return return_value; 

}
