#ifndef FUN_PCAP_PARSER_H
#define FUN_PCAP_PARSER_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <pcap.h>

int init_pcap(const char* file);
int readPcap(unsigned char* out_dat,int* length);
int pcap_extraction(char* pcap_file, double *n_axc, double *c_type,double *fs_off,double *eaxc_id, double *out);
int iq_extraction(unsigned char* pcap_out, int length,int32_t* pcap_16b, int* out_c);

#endif
