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
    int sym_no;
    int FFT_size;
    int No_of_prbs;
    int Mu;
    int cp_enable;
};

int fft(unsigned int* data_param_arr, unsigned char* fft_in, unsigned char* fft_out);
#ifdef __cplusplus
}
#endif

#endif

