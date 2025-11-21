#ifndef PCAP_PARSER_H
#define PCAP_PARSER_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#include <pcap.h>

char errbuff[PCAP_ERRBUF_SIZE];
pcap_t* pcap;
struct pcap_pkthdr* header;

unsigned char msg_type_up=0x00;//00-uplane
unsigned char msg_type_cp=0x02;//02-cplane
unsigned char data_dir_ul=0x00;//00-uplink(0*******)
unsigned char data_dir_dl=0x80;//80-downlink(1*******)
int num_axc;
int compression_type;
int fs_offset;
int eaxc_id_sel;
char p_file[100];

struct data_struct_cplane {
    int frame_id;
    int subframe_id;
    int slot_id;
    int symbol_id;
    int no_of_sections;
    int section_id;
    int start_prb;
    int no_of_prbs;
};

//int init_pcap(const char* file);
//int readPcap(unsigned char* out_dat,int* length);
//int pcap_extraction();
//int iq_extraction(unsigned char* pcap_out, int length, int32_t* pcap_16b, int* out_c);

#endif

