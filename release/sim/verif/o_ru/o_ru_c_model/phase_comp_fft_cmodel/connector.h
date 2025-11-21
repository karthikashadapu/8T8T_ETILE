#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <stdbool.h>

#ifdef __cplusplus

extern "C" {
#endif 

struct data_struct {
    int8_t valid;
    int8_t channel;
    int32_t real;
    int32_t imag;
};
struct param_struct {
    int No_of_prbs;
    int tx_rx_sel;
};
int phase_compensation_fft(unsigned int* data_param_arr, unsigned char* phase_comp_in, unsigned char* phase_comp_out);

#ifdef __cplusplus
}
#endif

#endif

