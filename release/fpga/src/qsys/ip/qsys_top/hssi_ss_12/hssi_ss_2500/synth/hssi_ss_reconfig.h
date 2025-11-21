#ifndef HSSI_RECONFIG_H_
#define HSSI_RECONFIG_H_

#include <stdio.h>
#include <unistd.h>
#include "io.h"

// Optimize for simulation
//#define SIM_ONLY

// EHIP lane register offsets
#define cntr_tx_mcast_data_ok_lo    0x898
#define cntr_tx_mcast_data_ok_hi    0x89C
#define cntr_tx_bcast_data_ok_lo    0x8A0
#define cntr_tx_bcast_data_ok_hi    0x8A4
#define cntr_tx_ucast_data_ok_lo    0x8A8
#define cntr_tx_ucast_data_ok_hi    0x8AC
#define cntr_tx_mcast_ctrl_lo       0x8B0
#define cntr_tx_mcast_ctrl_hi       0x8B4
#define cntr_tx_bcast_ctrl_lo       0x8B8
#define cntr_tx_bcast_ctrl_hi       0x8BC
#define cntr_tx_ucast_ctrl_lo       0x8C0
#define cntr_tx_ucast_ctrl_hi       0x8C4
#define cntr_tx_pause_lo            0x8C8
#define cntr_tx_pause_hi            0x8CC
#define cntr_tx_runt_lo             0x8D0
#define cntr_tx_payloadoctetsok_lo  0x8F8
#define cntr_tx_payloadoctetsok_hi  0x8FC
#define cntr_tx_dropped             0x910
#define cntr_tx_config				      0x274

#define cntr_rx_mcast_data_ok_lo    0x9CC
#define cntr_rx_mcast_data_ok_hi    0x9D0
#define cntr_rx_bcast_data_ok_lo    0x9D4
#define cntr_rx_bcast_data_ok_hi    0x9D8
#define cntr_rx_ucast_data_ok_lo    0x9DC
#define cntr_rx_ucast_data_ok_hi    0x9E0
#define cntr_rx_mcast_ctrl_lo       0x9E4
#define cntr_rx_mcast_ctrl_hi       0x9E8
#define cntr_rx_bcast_ctrl_lo       0x9EC
#define cntr_rx_bcast_ctrl_hi       0x9F0
#define cntr_rx_ucast_ctrl_lo       0x9F4
#define cntr_rx_ucast_ctrl_hi       0x9F8
#define cntr_rx_pause_lo            0x9FC
#define cntr_rx_pause_hi            0xA00
#define cntr_rx_runt                0xA04
#define cntr_rx_st_lo               0xA0C
#define cntr_rx_st_hi               0xA10
#define cntr_rx_fcs                 0x944
#define cntr_rx_payloadoctetsok_lo  0xA2C
#define cntr_rx_payloadoctetsok_hi  0xA30
#define cntr_rx_dropped             0xA44
#define cntr_rx_octetsok_lo         0xA34
#define cntr_rx_octetsok_hi         0xA38
#define cntr_rx_bcast_ctrl_err      0x974
#define cntr_rx_mcast_ctrl_err      0x96C
#define cntr_rx_ucast_ctrl_err      0x97C
#define cntr_rx_pause_err           0x984
#define cntr_rx_fcs_err_okpkt       0x94C
#define cntr_rx_mcast_data_err      0x954
#define cntr_rx_bcast_data_err      0x95C
#define cntr_rx_ucast_data_err      0x964
#define cntr_rx_oversize            0x9C4
#define cntr_rx_64b_lo              0x98C
#define cntr_rx_64b_hi              0x990
#define cntr_rx_65to127b_lo         0x994
#define cntr_rx_65to127b_hi         0x998
#define cntr_rx_128to255b_lo        0x99C
#define cntr_rx_128to255b_hi        0x9A0
#define cntr_rx_256to511b_lo        0x9A4
#define cntr_rx_256to511b_hi        0x9A8
#define cntr_rx_512to1023b_lo       0x9AC
#define cntr_rx_512to1023b_hi       0x9B0
#define cntr_rx_1024to1518b_lo      0x9B4
#define cntr_rx_1024to1518b_hi      0x9B8
#define cntr_rx_1519tomaxb_lo       0x9BC
#define cntr_rx_1519tomaxb_hi       0x9C0
#define cntr_rx_jabbers             0x93C
#define cntr_rx_fragments           0x934
#define cntr_rx_config				      0x278


//BASE ADDRESS
//#define ETH_BASE_ADDR              0x1000
#define PMA_BASE_ADDR              0X100000
#define PIO_RESET_ADDR             0x04110B00
#define PIO_RESET_ACK_ADDR         0x04110F00

//ANLT CFG registers
#define BASE_KR4             0x10000 
#define ADDR_KR4_BASECTRL    0x2c0
#define ADDR_KR4_ANCTRL      0x300
#define ADDR_KR4_DEBUG       0x3c0
#define ADDR_KR4_AN          0x308
#define ADDR_KR4_LT          0x340


extern unsigned int port_profiles;

//#if ((port_profiles == 20) || (port_profiles == 21))
//#define ETH_BASE_ADDR  0x1000 //10GbE and 25GbE
//#elif((port_profiles == 24 ) || (port_profiles == 23))
//#undef ETH_BASE_ADDR
//#define ETH_BASE_ADDR  0x2000 //50GbE
//#elif((port_profiles == 22) || (port_profiles == 25) || (port_profiles == 26) || (port_profiles == 27))
//#undef ETH_BASE_ADDR
//#define ETH_BASE_ADDR  0x3000 //40GbE and 100GbE
//#endif

//SAL Functions
void rst_wait();
unsigned char polling_for_cfg_bit (unsigned long , unsigned long , unsigned short , unsigned short );
void read_mac_stats (unsigned int , unsigned int , unsigned int , unsigned long);
unsigned char enable_serial_loopback_fgt_pma(unsigned int,unsigned int  );
unsigned char enable_serial_loopback_fht_pma(unsigned int ,unsigned int );
unsigned char disable_serial_loopback_fgt_pma(unsigned int, unsigned int  );
unsigned char disable_serial_loopback_fht_pma(unsigned int,unsigned int);
void firmware_version ();
unsigned char reset_MAC_stats (unsigned int , unsigned char , unsigned char, unsigned long );
void get_mtu (unsigned int, unsigned long);
void set_mtu (unsigned int, unsigned long);
unsigned char set_csr(unsigned long );
unsigned char get_csr(unsigned long );
void get_link_status (unsigned int, unsigned long);
unsigned long anlt_clr (unsigned int);
unsigned long ignore_nonce_enable (unsigned int);
unsigned long ignore_nonce_disable (unsigned int);
void get_hssi_profile(unsigned long);
void set_hssi_profile(unsigned long);

#endif /* HSSI_RECONFIG_H_ */














