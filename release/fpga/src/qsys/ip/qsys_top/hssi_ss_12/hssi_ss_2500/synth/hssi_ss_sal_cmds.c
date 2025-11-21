#include <stdio.h>
#include <unistd.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "hssi_ss_reconfig.h"
#include <math.h>

extern unsigned char sim_mode;
extern unsigned char sim_fast_en;
unsigned int RST_ACK_TIMEOUT = 200000;



//Reset wait
void rst_wait(unsigned int i)
{
        //each nop = ~5 cpu cycles
        //1GHz clk = 1ns * 5cycles, n=200 => 1us
        //unsigned int n = 0;
        alt_timestamp_start();
        do {

                //10msec timeout, assuming 250mhz
        } while ((alt_timestamp() < i));
        //   for (n=0; n<i; n++)
        //    {
        //            __asm volatile ("nop" ::);
        //    }
}



//polling function
unsigned char polling_for_cfg_bit (unsigned long base_addr, unsigned long reg_num, unsigned short bit_num, unsigned short compare_value) {
        unsigned long rdata0;
                unsigned long iteration = 70000;  //, HW - leave
        if (sim_mode == 1){
                unsigned long iteration = 1000;  //SIM - 2msec
        } 
        unsigned long i = 0;
        unsigned char return_value = 0;

        rdata0 = IORD_32DIRECT(base_addr, reg_num);

        while (((rdata0 & (1<<bit_num)) != (compare_value << bit_num)) && (i < iteration)) {

                //    printf ("INFO: Polling for pma register: %lx, configuration bit 7, read data: %ld\n", reg_num, rdata0);

                i = i + 1;
                rdata0 = IORD_32DIRECT(base_addr, reg_num);
                if (i == iteration) {

                        //printf ("ERROR: Polling for pma register %lx failed\n", reg_num);

                        return_value = 1;
                }
                rst_wait(200);


        }
        return return_value;
}

unsigned long anlt_clr(unsigned int port_num){

        unsigned long rdata, wdata = 0;
        unsigned long anlt_base_addr = (unsigned long) ((port_num << 10) + BASE_KR4); 

        //clearing AN_CFG register reg: 300, Setting AN=0 
        rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_ANCTRL);
        wdata = rdata & 0xFFFFFFFE;
        IOWR_32DIRECT(anlt_base_addr,ADDR_KR4_ANCTRL, wdata);

        //clearing LT_CFG register reg: 340, Setting LT=0
        rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_LT);
        wdata = rdata & 0xFFFFFFFE;
        IOWR_32DIRECT(anlt_base_addr,ADDR_KR4_LT, wdata);

        //Reset ANLT sequencer using reg: 2C0 by setting bit 0 to 1
        rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_BASECTRL);
        wdata = rdata | 0x1;
        IOWR_32DIRECT(anlt_base_addr,ADDR_KR4_BASECTRL, wdata);
        rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_BASECTRL);
        //printf("SEQ:%lx\n",rdata);

        //Reading 3C0 for FSM status i.e. Link Up when FSM 1f0 -- ANLT paused or not
        //0x1B0 -- no loopback and anlt disable
        //0x1F0 -- loopback and anlt disable/enable
        alt_timestamp_start();
        do {
                rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_DEBUG);
        } while ((alt_timestamp() < 125000000) && ((rdata != 0x01F0) && (rdata != 0x1B0)));
        //rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_DEBUG);

        if ((rdata == 0x01F0) || (rdata == 0x1B0)) {
          return 0;
        } else {
          return 1;
        }
}

unsigned long ignore_nonce_enable(unsigned int port_num){
        unsigned long rdata,wdata = 0;
        unsigned long anlt_base_addr = (unsigned long) ((port_num << 10) + BASE_KR4); 

        //Writing AN_CFG register reg: 300, AN enable, ingnore nonce enable 
        rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_ANCTRL);
        wdata = rdata & 0xFFFFFF7E;
        IOWR_32DIRECT(anlt_base_addr,ADDR_KR4_ANCTRL, (wdata | 0x81));

        //Writing LT_CFG register reg: 340. Enable Link training by writing 1 to bit 0
        rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_LT);
        wdata = rdata & 0xFFFFFFFE;
        IOWR_32DIRECT(anlt_base_addr,ADDR_KR4_LT, (wdata | 0x1));
        rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_LT);

        //Reset ANLT sequencer using reg: 2c0 by setting bit 0 to 1
        rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_BASECTRL);
        wdata = wdata | 0x1;
        IOWR_32DIRECT(anlt_base_addr,ADDR_KR4_BASECTRL, wdata);

        //no need to wait for ANLT to complete, as no CPI command is given 
        //alt_timestamp_start();
        //do {
        //rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_DEBUG);
        //} while ((alt_timestamp() < 125000000) && (rdata != 0x01F0));
        ////Reading 3c0 for FSM status i.e. Link Up when FSM 1f0
        ////rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_DEBUG);

        ////Check why 0x1F0
        //if (rdata == 0x01F0) {
        //  return 0;
        //} else {
        //  return 1;
        //}
          return 0;
        
}

unsigned long ignore_nonce_disable(unsigned int port_num){
        unsigned long rdata,wdata = 0;
        unsigned long anlt_base_addr = (unsigned long) ((port_num << 10) + BASE_KR4); 

        //Writing AN_CFG register reg: 300, AN En, and nonce disable(due to enable sal command) 
        rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_ANCTRL);
        wdata = rdata & 0xFFFFFF7E;
        IOWR_32DIRECT(anlt_base_addr,ADDR_KR4_ANCTRL, (wdata | 0x01));

        //Writing LT_CFG register reg: 340. Enable Link training by writing 1 to bit 0
        rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_LT);
        wdata = rdata & 0xFFFFFFFE;
        IOWR_32DIRECT(anlt_base_addr,ADDR_KR4_LT, (wdata | 0x01));
        //printf("LT:%lx\n",rdata);

        //Reset ANLT sequencer using reg: 2c0 by setting bit 0 to 1
        rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_BASECTRL);
        wdata = wdata | 0x1;
        IOWR_32DIRECT(anlt_base_addr,ADDR_KR4_BASECTRL, wdata);

        //alt_timestamp_start();
        //do {
        //        rdata = IORD_32DIRECT(anlt_base_addr,ADDR_KR4_DEBUG);
        //} while ((alt_timestamp() < 125000000) && (rdata != 0x01F0));
        ////Reading 3c0 for FSM status i.e. Link Up when FSM 1f0

        ////Check why 0x1F0
        //if (rdata == 0x01F0) {
        //return 0;
        //} else {
        //  return 1;
        //}
        return 0;
}

//set hssi profile
void set_hssi_profile(unsigned long offset_addr){
	unsigned long dr_base = 0x60000;
	unsigned long user_input = IORD_ALTERA_AVALON_PIO_DATA(CPU_WR_DATA_BASE);
	unsigned long dr_addr = offset_addr;
	
		IOWR_32DIRECT(dr_base,dr_addr,user_input);
	
}

//get hssi profile
void get_hssi_profile(unsigned long offset_addr){
	unsigned long dr_base = 0x60000;
	
	unsigned long dr_addr = offset_addr;
	
	unsigned long dr_data = IORD_32DIRECT(dr_base,dr_addr);
	IOWR_ALTERA_AVALON_PIO_DATA(CPU_RD_DATA_BASE,dr_data);
	
}



//get link status 
void get_link_status (unsigned int port_num, unsigned long ETH_BASE_ADDR) {

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

        unsigned long rdata 		                = 0;
        unsigned long tx_pcs_ready 		          = 0;
        unsigned long rx_aligned   		          = 0;
        unsigned long serdes_link  		          = 0;
        unsigned long LPAF_temp   		          = 0;
        unsigned long Rx_Flow_Ctrl_Flag	 	      = 0;
        unsigned long Tx_Flow_Ctrl_Flag 	      = 0;
        unsigned long Parallel_Detection_Flag   = 0;
        unsigned long Auto_Negotiate_Complete   = 0;
        unsigned long Speed_and_duplex	        = 0;
        unsigned long Link_Flag 	              = 0;
        unsigned long Auto_Negotiate_Flag 	    = 0;
        unsigned long readdata_c2 		          = 0;
        unsigned long port_params_addr 		      = 0;
        unsigned char anlt_en			              = 0;

        unsigned long eth_base_addr  = (unsigned long) (((port_num+1) << 21) + 0x0);
        unsigned long mac_base_addr  = (unsigned long) (eth_base_addr + ETH_BASE_ADDR); //ETH_BASE_ADDR change based on profile
        unsigned long anlt_base_addr = (unsigned long) ((port_num << 10) + BASE_KR4); 

        //getting ANLT enabled status
        port_params_addr 	= (unsigned long)(0x1004040) + (unsigned long)(port_num*0x10);
        readdata_c2 			= IORD_ALTERA_AVALON_PIO_DATA(port_params_addr);
        anlt_en 					= ((readdata_c2 >> 18) & 0x00000001);


        tx_pcs_ready 			= (IORD_32DIRECT(eth_base_addr, 0x118))>>2;
        rx_aligned   			= (IORD_32DIRECT(mac_base_addr, 0x84));
        serdes_link  			= (tx_pcs_ready & rx_aligned & 0x00000001);
        rdata       			= serdes_link << 20;

        if (anlt_en) {
                LPAF_temp   			= IORD_32DIRECT(anlt_base_addr, 0x31C);
                LPAF_temp   			= (LPAF_temp >> 10) & 0x00000003;
                rdata			       	= rdata | (LPAF_temp << 18);

                readdata_c2 			= IORD_32DIRECT(anlt_base_addr, 0x308);
                Auto_Negotiate_Complete = (readdata_c2 >> 2)  & 0x00000001;
                Link_Flag		     	= (readdata_c2 >> 6)  & 0x00000001;
                Parallel_Detection_Flag = (readdata_c2 >> 7)  & 0x00000001;
                Speed_and_duplex	    = (readdata_c2 >> 11) & 0x00000001;

                rdata       			= rdata | (Auto_Negotiate_Complete << 6);
                rdata    	       	= rdata | (Link_Flag << 0);
                rdata       			= rdata | (Parallel_Detection_Flag << 7);
                //rdata	        		= rdata | (Speed_and_duplex << 1);


                Auto_Negotiate_Flag 	= IORD_32DIRECT(anlt_base_addr, 0x300);
                Auto_Negotiate_Flag 	= Auto_Negotiate_Flag & 0x00000001;

                rdata		      	      = rdata | (Auto_Negotiate_Flag << 5);

                //new
                if(Speed_and_duplex)
                        Speed_and_duplex	= 0x0;
                else if(((readdata_c2 >> 17)  & 0x00000001) || ((readdata_c2 >> 18)  & 0x00000001))
                        Speed_and_duplex	= 0xa;
                else if(((readdata_c2 >> 13)  & 0x00000001) || ((readdata_c2 >> 14)  & 0x00000001))
                        Speed_and_duplex	= 0xb;
                else if(((readdata_c2 >> 19)  & 0x00000001))
                        Speed_and_duplex	= 0xc;
                else if(((readdata_c2 >> 15)  & 0x00000001) || ((readdata_c2 >> 16)  & 0x00000001) || ((readdata_c2 >> 20)  & 0x00000001) || ((readdata_c2 >> 22)  & 0x00000001))
                        Speed_and_duplex	= 0xd;
                else
                        Speed_and_duplex	= 0xf;

                rdata	        		= rdata | (Speed_and_duplex << 1);

        } else {
                Link_Flag		     	= serdes_link;
                rdata    	       	= rdata | Link_Flag;
        }

        Rx_Flow_Ctrl_Flag		= IORD_32DIRECT(mac_base_addr , 0x260);
        Rx_Flow_Ctrl_Flag 	= ((Rx_Flow_Ctrl_Flag & 0x000000ff) != 0);
        rdata		 			      = rdata | (Rx_Flow_Ctrl_Flag << 17);


        Tx_Flow_Ctrl_Flag = IORD_32DIRECT(mac_base_addr , 0x22C);
        Tx_Flow_Ctrl_Flag = ((Tx_Flow_Ctrl_Flag & 0x000001ff) != 0);
        rdata		 	       	= rdata | (Tx_Flow_Ctrl_Flag << 16);

        IOWR_ALTERA_AVALON_PIO_DATA(CPU_RD_DATA_BASE, rdata);
}



//Read Mac Stats
void read_mac_stats (unsigned int port_num, unsigned int lsb, unsigned int counter, unsigned long ETH_BASE_ADDR) {
        unsigned long long  rdata = 0;
        unsigned long lower, upper = 0;
        //printf("read stats\n");
        unsigned long eth_base_addr = (unsigned long) ((port_num+1) << 21);
        unsigned long mac_base_addr = (unsigned long) (eth_base_addr + ETH_BASE_ADDR); //ETH_BASE_ADDR change based on profile

        //tx_packets
        if ( counter == 0 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_mcast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_mcast_data_ok_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_bcast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_bcast_data_ok_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_ucast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_ucast_data_ok_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_mcast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_mcast_ctrl_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_bcast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_bcast_ctrl_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_ucast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_ucast_ctrl_lo)))));

        }
        //rx_packets
        if ( counter == 1 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_mcast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_mcast_data_ok_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_bcast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_bcast_data_ok_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_ucast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_ucast_data_ok_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_mcast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_mcast_ctrl_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_bcast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_bcast_ctrl_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_ucast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_ucast_ctrl_lo)))));

        }
        //rx_crc_errors
        if ( counter == 2 ){
                rdata = (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_fcs)))) ;
        }
        //rx_align_errors
        if ( counter == 3 ){
                rdata = (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_fcs)))) - (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_runt)))) ;
        }
        //tx_bytes
        if ( counter == 4 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_payloadoctetsok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_payloadoctetsok_lo))))) ;
        }
        //rx_bytes
        if ( counter == 5 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_payloadoctetsok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_payloadoctetsok_lo))))) ;
        }
        //tx_pause
        if ( counter == 6 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_pause_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_pause_lo))))) ;
        }
        //rx_pause
        if ( counter == 7 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_pause_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_pause_lo))))) ;
        }
        //rx_errors
        if ( counter == 8 ){
                rdata = (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_dropped)))) ;
        }
        //tx_errors
        if ( counter == 9 ){
                rdata = (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_dropped)))) ;
        }
        //rx_unicast
        if ( counter == 10 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_ucast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_ucast_data_ok_lo))))) + 
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_ucast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_ucast_ctrl_lo))))) ;
        }
        //rx_multicast
        if ( counter == 11 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_mcast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_mcast_data_ok_lo))))) + 
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_mcast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_mcast_ctrl_lo))))) ;
        }
        //rx_broadcast
        if ( counter == 12 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_bcast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_bcast_data_ok_lo))))) + 
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_bcast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_bcast_ctrl_lo))))) ;
        }
        //tx_discards
        if ( counter == 13 ){
                rdata = 0;
        }
        //tx_unicast
        if ( counter == 14 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_ucast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_ucast_data_ok_lo))))) + 
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_ucast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_ucast_ctrl_lo))))) ;
        }
        //tx_multicast
        if ( counter == 15 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_mcast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_mcast_data_ok_lo))))) + 
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_mcast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_mcast_ctrl_lo))))) ;
        }
        //tx_broadcast
        if ( counter == 16 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_bcast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_bcast_data_ok_lo))))) + 
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_bcast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_tx_bcast_ctrl_lo))))) ;
        }
        //ether_drops
        if ( counter == 17 ){
                rdata = (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_dropped)))) ;
        }
        //rx_total_bytes
        if ( counter == 18 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_octetsok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_octetsok_lo))))) ;
        }
        //rx_total_packets
        if ( counter == 19 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_mcast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_mcast_data_ok_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_bcast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_bcast_data_ok_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_ucast_data_ok_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_ucast_data_ok_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_mcast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_mcast_ctrl_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_bcast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_bcast_ctrl_lo))))) +
                        ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_ucast_ctrl_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_ucast_ctrl_lo))))) +
                        (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_mcast_data_err)))) +
                        (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_bcast_data_err)))) +
                        (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_ucast_data_err)))) +
                        (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_mcast_ctrl_err)))) +
                        (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_bcast_ctrl_err)))) +
                        (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_ucast_ctrl_err)))) ;
        }
        //rx_undersize
        if ( counter == 20 ){
                rdata = (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_runt)))) ;
        }
        //rx_oversize
        if ( counter == 21 ){
                rdata = (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_oversize)))) ;
        }
        //rx_64_bytes
        if ( counter == 22 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_64b_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_64b_lo))))) ;
        }
        //rx_65_127_bytes
        if ( counter == 23 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_65to127b_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_65to127b_lo))))) ;
        }
        //rx_128_255_bytes
        if ( counter == 24 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_128to255b_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_128to255b_lo))))) ;
        }
        //rx_256_511_bytes
        if ( counter == 25 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_256to511b_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_256to511b_lo))))) ;
        }
        //rx_512_1023_bytes
        if ( counter == 26 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_512to1023b_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_512to1023b_lo))))) ;
        }
        //rx_1024_1518_bytes
        if ( counter == 27 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_1024to1518b_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_1024to1518b_lo))))) ;
        }
        //rx_gte_1519_bytes
        if ( counter == 28 ){
                rdata = ((((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_1519tomaxb_hi))) <<32) | (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_1519tomaxb_lo))))) ;
        }
        //rx_jabbers
        if ( counter == 29 ){
                rdata = (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_jabbers)))) ;
        }
        //rx_runts
        if ( counter == 30 ){
                rdata = (((unsigned long long) ((unsigned long) IORD_32DIRECT(mac_base_addr, cntr_rx_fragments)))) ;
        }

        lower = rdata & 0xFFFFFFFF;
        upper = (rdata >> 32) & 0xFFFFFFFF;
        if (lsb == 1) {
                IOWR_ALTERA_AVALON_PIO_DATA(CPU_RD_DATA_BASE, lower);
        }
        else {
                IOWR_ALTERA_AVALON_PIO_DATA(CPU_RD_DATA_BASE, upper);
        }

}

//Enable loopback for FGT PMA
unsigned char enable_serial_loopback_fgt_pma(unsigned int port_num,unsigned int port_profiles ){
        unsigned int return_value = 0;
        unsigned long loopback_flag =0;
        unsigned long loopback_flag_1 =0;
        unsigned char i =0;
        unsigned char no_of_lanes = 1;
        unsigned char iter_lanes  = 1;
        unsigned char rx_rst_ack  = 1;
        unsigned long pma_base_addr = (unsigned long) (((port_num+1) << 21) + PMA_BASE_ADDR);
        unsigned long pma_base_addr_1 = (unsigned long) ((((port_num+4)+1) << 21) + PMA_BASE_ADDR);
        //RX Reset PIO Base addr
        unsigned long pio_reset_addr     = (unsigned long) (PIO_RESET_ADDR)  + (unsigned long)(port_num*0x10);
        unsigned long pio_reset_ack_addr = (unsigned long) (PIO_RESET_ACK_ADDR)  + (unsigned long)(port_num*0x10);
        unsigned char quad_lane_num = IORD_32DIRECT(pma_base_addr, 0xffffc);
        unsigned char lane_num = quad_lane_num & 0x3;
        if (sim_fast_en == 1) {
                RST_ACK_TIMEOUT = 2000000;
        }
          //decoded from profile
        if ((port_profiles == 20) || (port_profiles == 21) || (port_profiles == 24) || (port_profiles == 25)){
                no_of_lanes = 1; //10GbE, 25GbE, 50GbE, 40GbE
        }else if ((port_profiles == 23) || (port_profiles == 26) || (port_profiles == 28)){
                no_of_lanes = 2; //50GbE, 100GbE, 200GbE
        }else if ((port_profiles == 22) || (port_profiles == 27) || (port_profiles == 29) || (port_profiles == 31)){
                no_of_lanes = 4; //40GbE, 100GbE, 200GbE, 400GbE
        }else if ((port_profiles == 30) || (port_profiles == 32)){
                no_of_lanes = 8; //200GbE, 400GbE
        }
        
        //Looping over lanes
        if (no_of_lanes == 8) {
                iter_lanes = 4;
        } else {
                iter_lanes = no_of_lanes;
        }


        // Step 1. Assert rx_reset
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xB);
        //IOWR_32DIRECT(eth_base_addr,0x108,0x4);


        //Check for ACK=0
        if(sim_mode==0){
                alt_timestamp_start();
                do {
                        rx_rst_ack = ((IORD_ALTERA_AVALON_PIO_DATA(pio_reset_ack_addr)>>2)) & 0x01;
                        //100msec timeout, assuming 250mhz
                } while ((alt_timestamp() < 25000000) && (rx_rst_ack == 1));
        } else {
                alt_timestamp_start();
                do {
                        rx_rst_ack = ((IORD_ALTERA_AVALON_PIO_DATA(pio_reset_ack_addr)>>2)) & 0x01;
                        //100msec timeout, assuming 250mhz
                } while ((alt_timestamp() < RST_ACK_TIMEOUT) && (rx_rst_ack == 1));
        }
        if (rx_rst_ack == 1){
                return_value += 1;
        } else {
                return_value += 0;
        }



        for (i=0; i < iter_lanes; i++){

            //fgt loopback data and addr as per lane
            unsigned long loopback_data1 = (0x6A040 + (lane_num * 0x100));
            // Step 2. Enable serial loopback
            IOWR_32DIRECT(pma_base_addr, 0x9003C, loopback_data1);
            if (no_of_lanes == 8) {
                IOWR_32DIRECT(pma_base_addr_1, 0x9003C, loopback_data1);
            }
            return_value += polling_for_cfg_bit(pma_base_addr,0x90040, 0xE, 0x0);
            return_value += polling_for_cfg_bit(pma_base_addr,0x90040, 0xF, 0x1);

            if (no_of_lanes == 8) {
                return_value += polling_for_cfg_bit(pma_base_addr_1,0x90040, 0xE, 0x0);
                return_value += polling_for_cfg_bit(pma_base_addr_1,0x90040, 0xF, 0x1);

            }

            //printf("return_value:%d\n",return_value);
            unsigned long loopback_data2 = (0x62040 + (lane_num * 0x100));
            IOWR_32DIRECT(pma_base_addr, 0x9003C, loopback_data2);
            if (no_of_lanes == 8) {
                IOWR_32DIRECT(pma_base_addr_1, 0x9003C, loopback_data2);
            }
            return_value += polling_for_cfg_bit(pma_base_addr,0x90040, 0xE, 0x0);
            return_value += polling_for_cfg_bit(pma_base_addr,0x90040, 0xF, 0x0);
            if (no_of_lanes == 8) {
                return_value += polling_for_cfg_bit(pma_base_addr_1,0x90040, 0xE, 0x0);
                return_value += polling_for_cfg_bit(pma_base_addr_1,0x90040, 0xF, 0x0);
            }

            if (lane_num>0){
                lane_num = lane_num-1;
            }
        }
        //Step 3. De-assert rx_reset
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xF);

        //Check for ACK=1
        if(sim_mode==0){
                alt_timestamp_start();
                do {
                        rx_rst_ack = ((IORD_ALTERA_AVALON_PIO_DATA(pio_reset_ack_addr)) >> 2) & 0x01;
                        //100msec timeout, assuming 250mhz
                } while ((alt_timestamp() < 25000000) && (rx_rst_ack == 0));
        } else {
                alt_timestamp_start();
        do {
                rx_rst_ack = ((IORD_ALTERA_AVALON_PIO_DATA(pio_reset_ack_addr)) >> 2) & 0x01;
                //100msec timeout, assuming 250mhz
        } while ((alt_timestamp() < RST_ACK_TIMEOUT) && (rx_rst_ack == 0));
}

        if (rx_rst_ack == 0){
                return_value += 1;
        } else {
                return_value += 0;
        }

        //Step 4. Confirm the channel is in serial loopback
        if (sim_mode==0){
                for (i=0; i < iter_lanes; i++){
                        unsigned long flux_lane_fgt  = (0x4781C + (lane_num * 0x8000)); 
                        alt_timestamp_start();
                        do {
                                loopback_flag = IORD_32DIRECT(pma_base_addr, flux_lane_fgt); 
                                if (no_of_lanes == 8) {
                                        loopback_flag_1 = IORD_32DIRECT(pma_base_addr_1, flux_lane_fgt); 

                                }//100msec timeout, assuming 250mhz
                        } while ((alt_timestamp() < 100000000) && ((loopback_flag & 0x00000002) != 0x02) && ((loopback_flag_1 & 0x00000002) != 0x02));
                        //SIM -- skip check, HW - 1sec

                        if (((loopback_flag & 0x02) == 0x02) && ((loopback_flag & 0x02) == 0x02)){
                                return_value += 0;
                        }
                        else {
                                return_value += 1;
                        }
                        if (lane_num>0){
                                lane_num = lane_num-1;
                        }
                }
        }

        return return_value;

}

//Disable loopback for FGT PMA
unsigned char disable_serial_loopback_fgt_pma(unsigned int port_num, unsigned int port_profiles){
        unsigned int return_value = 0;
        unsigned long loopback_flag = 0;
        unsigned long loopback_flag_1 = 0;
        unsigned char rx_rst_ack  = 1;
        unsigned char i =0;
        unsigned char no_of_lanes  = 1;
        unsigned char iter_lanes  = 1;
        //unsigned long eth_base_addr = (unsigned long) (((port_num+1) << 21) + ETH_BASE_ADDR);
        unsigned long pma_base_addr = (unsigned long) (((port_num+1) << 21) + PMA_BASE_ADDR);
        unsigned long pma_base_addr_1 = (unsigned long) ((((port_num+4)+1) << 21) + PMA_BASE_ADDR);
        //RX Reset PIO Base addr
        unsigned long pio_reset_addr = (unsigned long) (PIO_RESET_ADDR)  + (unsigned long)(port_num*0x10);
        unsigned long pio_reset_ack_addr = (unsigned long) (PIO_RESET_ACK_ADDR)  + (unsigned long)(port_num*0x10);
        unsigned char lane_num = IORD_32DIRECT(pma_base_addr, 0xffffc);
        lane_num = lane_num & 0x3;
        if (sim_fast_en == 1) {
                        RST_ACK_TIMEOUT = 2000000;
        }
        //decoded from profile
        if ((port_profiles == 20) || (port_profiles == 21) || (port_profiles == 24) || (port_profiles == 25)){
                no_of_lanes = 1; //10GbE, 25GbE, 50GbE, 40GbE
        }else if ((port_profiles == 23) || (port_profiles == 26) || (port_profiles == 28)){
                no_of_lanes = 2; //50GbE, 100GbE, 200GbE
        }else if ((port_profiles == 22) || (port_profiles == 27) || (port_profiles == 29) || (port_profiles == 31)){
                no_of_lanes = 4; //40GbE, 100GbE, 200GbE, 400GbE
        }else if ((port_profiles == 30) || (port_profiles == 32)){
                no_of_lanes = 8; //200GbE, 400GbE
        }
        //Looping over lanes
        if (no_of_lanes == 8) {
                iter_lanes = 4;
        } else {
                iter_lanes = no_of_lanes;
        }

        //Step 1. Assert rx_reset.
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xB);
        //Check for ACK=0
        if(sim_mode==0){
                alt_timestamp_start();
                do {
                        rx_rst_ack = ((IORD_ALTERA_AVALON_PIO_DATA(pio_reset_ack_addr)) >> 2) & 0x01;
                        //100msec timeout, assuming 250mhz
                } while ((alt_timestamp() < 25000000) && (rx_rst_ack == 1));
        } else {
                alt_timestamp_start();
                do {
                        rx_rst_ack = ((IORD_ALTERA_AVALON_PIO_DATA(pio_reset_ack_addr)) >> 2) & 0x01;
                        //100msec timeout, assuming 250mhz
                } while ((alt_timestamp() < RST_ACK_TIMEOUT) && (rx_rst_ack == 1));

        }
        if (rx_rst_ack == 1){
                return_value += 1;

        } else {
                return_value += 0;
        }

        for (i=0; i < iter_lanes; i++){
            //fgt loopback data and addr as per lane
            unsigned long loopback_data1 = (0x0A040 + (lane_num * 0x100));
            // Step 2. Disable serial loopback
            IOWR_32DIRECT(pma_base_addr, 0x9003C, loopback_data1);
            if (no_of_lanes == 8) {
                IOWR_32DIRECT(pma_base_addr_1, 0x9003C, loopback_data1);
            } 
            return_value += polling_for_cfg_bit(pma_base_addr,0x90040, 0xE, 0x0);
            return_value += polling_for_cfg_bit(pma_base_addr,0x90040, 0xF, 0x1);


            if (no_of_lanes == 8) {
                return_value += polling_for_cfg_bit(pma_base_addr_1,0x90040, 0xE, 0x0);
                return_value += polling_for_cfg_bit(pma_base_addr_1,0x90040, 0xF, 0x1);
            } 

            unsigned long loopback_data2 = (0x02040 + (lane_num * 0x100));
            IOWR_32DIRECT(pma_base_addr, 0x9003C, loopback_data2);
            if (no_of_lanes == 8) {
                IOWR_32DIRECT(pma_base_addr_1, 0x9003C, loopback_data2);
            }
            return_value += polling_for_cfg_bit(pma_base_addr,0x90040, 0xE, 0x0);
            return_value += polling_for_cfg_bit(pma_base_addr,0x90040, 0xF, 0x0);
            if (no_of_lanes == 8) {
                return_value += polling_for_cfg_bit(pma_base_addr_1,0x90040, 0xE, 0x0);
                return_value += polling_for_cfg_bit(pma_base_addr_1,0x90040, 0xF, 0x0);
            }
            if (lane_num>0){
                lane_num = lane_num-1;
            }
        }


//Step 3. Deassert rx_reset.
IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xF);

//Check for ACK=1
if (sim_mode==0){
    alt_timestamp_start();
    do {
        rx_rst_ack = ((IORD_ALTERA_AVALON_PIO_DATA(pio_reset_ack_addr)) >> 2) & 0x01;
        //100msec timeout, assuming 250mhz
    } while ((alt_timestamp() < 25000000) && (rx_rst_ack == 0));
    // SIM - 2msec, HW 250msec
} else {
    alt_timestamp_start();
    do {
        rx_rst_ack = ((IORD_ALTERA_AVALON_PIO_DATA(pio_reset_ack_addr)) >> 2) & 0x01;
        //100msec timeout, assuming 250mhz
    } while ((alt_timestamp() < RST_ACK_TIMEOUT) && (rx_rst_ack == 0));
    // SIM - 2msec, HW 250msec
}
if (rx_rst_ack == 0){
    return_value += 1;
} else {
    return_value += 0;
} 
if (sim_mode==0){
    for (i=0; i < iter_lanes; i++){
        //Step 4. Confirm the channel is not in serial loopback
        unsigned long disable_flux_lane_fgt  = (0x4781C + (lane_num * 0x8000)); 
        alt_timestamp_start();
        do {
            loopback_flag = IORD_32DIRECT(pma_base_addr, disable_flux_lane_fgt);
            if (no_of_lanes == 8) {
                loopback_flag_1 = IORD_32DIRECT(pma_base_addr_1, disable_flux_lane_fgt);
                //100msec timeout, assuming 250mhz
            }
        } while ((alt_timestamp() < 100000000) && ((loopback_flag & 0x02) != 0x0) && ((loopback_flag_1 & 0x02) != 0x0));
        //SIM -- skip check, HW - 1sec

        if (((loopback_flag & 0x02) == 0x00) && ((loopback_flag & 0x02) == 0x00)){
            return_value += 0;
        }
        else {
            return_value += 1;
        }
        if (lane_num>0){
            lane_num = lane_num-1;
        }
    }
}

    return return_value;
}

//Enable loopback for FHT PMA
unsigned char enable_serial_loopback_fht_pma(unsigned int port_num,unsigned int port_profiles){
        unsigned int return_value = 0;
        unsigned long loopback_flag =0;
        unsigned char rx_rst_ack  = 0;
        unsigned char i =0;
        unsigned char no_of_lanes  = 1;
        unsigned long read = 0;
        unsigned long write = 0;
        //unsigned long eth_base_addr = (unsigned long) (((port_num+1) << 21) + ETH_BASE_ADDR);
        unsigned long pma_base_addr = (unsigned long) (((port_num+1) << 21) + PMA_BASE_ADDR);
        //RX Reset PIO Base addr
        unsigned long pio_reset_addr = (unsigned long) (PIO_RESET_ADDR)  + (unsigned long)(port_num*0x10);
        unsigned long pio_reset_ack_addr = (unsigned long) (PIO_RESET_ACK_ADDR)  + (unsigned long)(port_num*0x10);

        //lane num is the channel no with in the quad
        unsigned char lane_num = IORD_32DIRECT(pma_base_addr, 0xffffc);
        lane_num = lane_num & 0x3;
        //unsigned char lane_num = port_num % 4;

        //decoded from profile
        if ((port_profiles == 20) || (port_profiles == 21) || (port_profiles == 24) || (port_profiles == 25)){
                no_of_lanes = 1; //10GbE, 25GbE, 50GbE, 40GbE
        }else if ((port_profiles == 23) || (port_profiles == 26) || (port_profiles == 28)){
                no_of_lanes = 2; //50GbE, 100GbE, 200GbE
        }else if ((port_profiles == 22) || (port_profiles == 27) || (port_profiles == 29) || (port_profiles == 31)){
                no_of_lanes = 4; //40GbE, 100GbE, 200GbE, 400GbE
        }else if ((port_profiles == 30) || (port_profiles == 32)){
                no_of_lanes = 8; //200GbE, 400GbE
        }
        //Step 1. Assert rx_reset.
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xB);
        //Check for ACK=0
        alt_timestamp_start();
        do {
                rx_rst_ack = ((IORD_ALTERA_AVALON_PIO_DATA(pio_reset_ack_addr)) >> 2) & 0x01;
                //100msec timeout, assuming 250mhz
        } while ((alt_timestamp() < 25000000) && (rx_rst_ack == 1));



        if (rx_rst_ack == 1){
                return_value += 1;
        } else {
                return_value += 0;
        }

            

        for (i=0; i < no_of_lanes; i++){
                       //fht lane addr
                unsigned long flux_lane_fht = (0x45800 + (lane_num * 0x8000)); 
                //Step 2. enable serial internal loopback.
                read = IORD_32DIRECT(pma_base_addr, flux_lane_fht);
                write = read | 0x4000;
                IOWR_32DIRECT(pma_base_addr, flux_lane_fht, write);

                         //Step 4. Confirm the channel is not in serial loopback
                alt_timestamp_start();
                do {
                        loopback_flag = IORD_32DIRECT(pma_base_addr, flux_lane_fht);
                        //10msec timeout, assuming 250mhz
                } while ((alt_timestamp() < 25000000) && (((loopback_flag & 0x4000)>>14) != 0x01));



                if (((loopback_flag & 0x4000)>> 14) == 0x0001){
                        return_value += 0;
                }
                else {
                        return_value += 1;
                }
                if(lane_num >0){
                        lane_num -= 1;
                }
        }
        //Step 3. Deassert rx_reset.
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xF);

        //Check for ACK=1
        alt_timestamp_start();
        do {
                rx_rst_ack = ((IORD_ALTERA_AVALON_PIO_DATA(pio_reset_ack_addr)) >> 2) & 0x01;
                //100msec timeout, assuming 250mhz
        } while ((alt_timestamp() < 25000000) && (rx_rst_ack == 0));



        if (rx_rst_ack == 0){
                return_value += 1;
        } else {
                return_value += 0;
        }      


        return return_value;


}

//Disable loopback for FHT PMA
unsigned char disable_serial_loopback_fht_pma(unsigned int port_num, unsigned int port_profiles){
        unsigned int return_value = 0;
        unsigned long loopback_flag = 0;
        unsigned char rx_rst_ack  = 0;
        unsigned char i =0;
        unsigned char no_of_lanes  = 1;
        unsigned long read = 0;
        unsigned long write = 0;
        //unsigned long eth_base_addr = (unsigned long) (((port_num+1) << 21) + ETH_BASE_ADDR);
        unsigned long pma_base_addr = (unsigned long) (((port_num+1) << 21) + PMA_BASE_ADDR);
        //RX Reset PIO Base addr
        unsigned long pio_reset_addr = (unsigned long) (PIO_RESET_ADDR)  + (unsigned long)(port_num*0x10);
        unsigned long pio_reset_ack_addr = (unsigned long) (PIO_RESET_ACK_ADDR)  + (unsigned long)(port_num*0x10);

        //lane num is the channel no with in the quad
        unsigned char lane_num = IORD_32DIRECT(pma_base_addr, 0xffffc);
        lane_num = lane_num & 0x3;

        //decoded from profile
        if ((port_profiles == 20) || (port_profiles == 21) || (port_profiles == 24) || (port_profiles == 25)){
                no_of_lanes = 1; //10GbE, 25GbE, 50GbE, 40GbE
        }else if ((port_profiles == 23) || (port_profiles == 26) || (port_profiles == 28)){
                no_of_lanes = 2; //50GbE, 100GbE, 200GbE
        }else if ((port_profiles == 22) || (port_profiles == 27) || (port_profiles == 29) || (port_profiles == 31)){
                no_of_lanes = 4; //40GbE, 100GbE, 200GbE, 400GbE
        }else if ((port_profiles == 30) || (port_profiles == 32)){
                no_of_lanes = 8; //200GbE, 400GbE
        }
        //Step 1. Assert rx_reset.
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xB);
        //Check for ACK=0
        alt_timestamp_start();
        do {
                rx_rst_ack = ((IORD_ALTERA_AVALON_PIO_DATA(pio_reset_ack_addr)) >> 2) & 0x01;
                //100msec timeout, assuming 250mhz
        } while ((alt_timestamp() < 25000000) && (rx_rst_ack == 1));

        if (rx_rst_ack == 1){
                return_value += 1;
        } else {
                return_value += 0;
        } 


        for (i=0; i < no_of_lanes; i++){
                
                unsigned long disable_flux_lane_fht  = (0x45800 + (lane_num * 0x8000)); 
                //Step 2. Write 1'b0 to register 0x45800 bit 1 to disable serial loopback
                read = IORD_32DIRECT(pma_base_addr, disable_flux_lane_fht);
                write = read & 0xFFFFBFFF;
                IOWR_32DIRECT(pma_base_addr, disable_flux_lane_fht, write);
          
        
                //Step 4. Confirm the channel is not in serial loopback
                alt_timestamp_start();
                do {
                        loopback_flag = IORD_32DIRECT(pma_base_addr, disable_flux_lane_fht);
                        //10msec timeout, assuming 250mhz
                } while ((alt_timestamp() < 25000000) && (((loopback_flag & 0x4000)>>14) != 0x00));


                if (((loopback_flag & 0x4000)>>14) == 0x00){
                        return_value += 0;
                }
                else {
                        return_value += 1;
                }
                if(lane_num>0){
                        lane_num -= 1;
                }  
        }
        //Step 3. Deassert rx_reset.
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xF);

        //Check for ACK=1
        alt_timestamp_start();
        do {
                rx_rst_ack = ((IORD_ALTERA_AVALON_PIO_DATA(pio_reset_ack_addr)) >> 2) & 0x01;
                //100msec timeout, assuming 250mhz
        } while ((alt_timestamp() < 25000000) && (rx_rst_ack == 0));

        if (rx_rst_ack == 0){
                return_value += 1;
        } else {
                return_value += 0;
        }     


        return return_value;

}

//Firmware_version
void firmware_version () {
        unsigned int version =  0x10;
        IOWR_ALTERA_AVALON_PIO_DATA(CPU_RD_DATA_BASE, version);
        //printf("get firmware_version\n");
}

//Reset MAC Stats
unsigned char reset_MAC_stats (unsigned int port_num, unsigned char tx_rst, unsigned char rx_rst, unsigned long ETH_BASE_ADDR) {

        unsigned long rdata,wdata;
        unsigned long eth_base_addr = (unsigned long) ((port_num+1) << 21);
        unsigned long mac_base_addr = (unsigned long) (eth_base_addr + ETH_BASE_ADDR);

        if (tx_rst == 1 && rx_rst == 0) {
                rdata = IORD_32DIRECT(mac_base_addr, cntr_tx_config);
                wdata = rdata | 0x00000001;
                IOWR_32DIRECT(mac_base_addr, cntr_tx_config, wdata);
                rst_wait(1200);
                wdata = rdata & 0xFFFFFFFE;
                IOWR_32DIRECT(mac_base_addr, cntr_tx_config, wdata);
                return 0;
        }
        else if (tx_rst == 0 && rx_rst == 1) {
                rdata = IORD_32DIRECT(mac_base_addr, cntr_rx_config);
                wdata = rdata | 0x00000001;
                IOWR_32DIRECT(mac_base_addr, cntr_rx_config, wdata);
                rst_wait(1200);
                wdata = rdata & 0xFFFFFFFE;
                IOWR_32DIRECT(mac_base_addr, cntr_rx_config, wdata);
                return 0;
        }
        else if (tx_rst == 1 && rx_rst == 1) {
                rdata = IORD_32DIRECT(mac_base_addr, cntr_tx_config);
                wdata = rdata | 0x00000001;
                IOWR_32DIRECT(mac_base_addr, cntr_tx_config, wdata);
                rst_wait(1200);
                wdata = rdata & 0xFFFFFFFE;
                IOWR_32DIRECT(mac_base_addr, cntr_tx_config, wdata);

                rdata = IORD_32DIRECT(mac_base_addr, cntr_rx_config);
                wdata = rdata | 0x00000001;
                IOWR_32DIRECT(mac_base_addr, cntr_rx_config, wdata);
                rst_wait(1200);
                wdata = rdata & 0xFFFFFFFE;
                IOWR_32DIRECT(mac_base_addr, cntr_rx_config, wdata);
                return 0;
        }
        else{
                //printf("Error: None of Rx and TX MAC reset are not set");
                return 1;
        }
}

// GET_MTU

void get_mtu (unsigned int port_num, unsigned long ETH_BASE_ADDR) {
        unsigned long rdata0, rdata1 = 0;
        unsigned long rdata =0;
        //printf("get mtu\n");
        unsigned long eth_base_addr = (unsigned long) ((port_num+1) << 21);
        unsigned long mac_base_addr = (unsigned long) (eth_base_addr + ETH_BASE_ADDR);

        rdata0 = IORD_32DIRECT(mac_base_addr, 0x208); // Maximum TX frame size
        rdata1 = IORD_32DIRECT(mac_base_addr, 0x21C); // Maximum RX frame size
        //*tx_fsize = rdata0;  HSSI Read Data CSR is written with 16 bits of Maximum TX frame size to the MSB 
        //*rx_fsize = rdata1; HSSI Read Data CSR is written with 16 bits of Maximum RX frame size to the LSB 
        //rdata = {rdata0,rdata1};
        rdata = ((rdata0 << 16) | rdata1);
        IOWR_ALTERA_AVALON_PIO_DATA(CPU_RD_DATA_BASE, rdata);
}

// SET MTU

void set_mtu (unsigned int port_num, unsigned long ETH_BASE_ADDR) {
        unsigned long wdata =0;
        unsigned long tx_max_size_data =0;
        unsigned long rx_max_size_data = 0;
        unsigned long eth_base_addr = (unsigned long) ((port_num+1) << 21);
        unsigned long mac_base_addr = (unsigned long) (eth_base_addr + ETH_BASE_ADDR);

        wdata = IORD_ALTERA_AVALON_PIO_DATA(CPU_WR_DATA_BASE);

        IOWR_32DIRECT(mac_base_addr, 0x208, ((wdata & 0xffff0000)>>16));         // Maximum TX frame size
        rst_wait(100);

        //wait till tx max frame size
        alt_timestamp_start();
        do {
                tx_max_size_data = IORD_32DIRECT(mac_base_addr, 0x208);
        }while ((alt_timestamp() < 2500000) && (tx_max_size_data != ((wdata & 0xffff0000)>>16)));
        rst_wait(100);

        IOWR_32DIRECT(mac_base_addr, 0x21C, (wdata & 0x0000ffff)); // Maximum RX frame size

        //wait till rx max frame size
        alt_timestamp_start();
        do {
                rx_max_size_data = IORD_32DIRECT(mac_base_addr, 0x21C);
        }while ((alt_timestamp() < 2500000) && (rx_max_size_data != (wdata & 0x0000ffff)));
        rst_wait(100);

}

// SET CSR

unsigned char set_csr(unsigned long offset_addr) {
        //time out of 10msec is given at RTL waitrequest generation; timeout in C will work only inside IOWR function
        unsigned long wr_data;
        wr_data = IORD_ALTERA_AVALON_PIO_DATA(CPU_WR_DATA_BASE);
        IOWR((offset_addr<<2), 0x0, wr_data);
        return 0;
}

//GET CSR
unsigned char get_csr(unsigned long offset_addr) {
        //time out of 10msec assuming axi lite clock is 125mhz
        //after timeout user needs to give app_ss_lite reset to bring bridge out of hung state
        unsigned long rd_data =0;
        rd_data = IORD((offset_addr<<2), 0x00000000);
        IOWR_ALTERA_AVALON_PIO_DATA(CPU_RD_DATA_BASE, rd_data);
        return 0;
}






















