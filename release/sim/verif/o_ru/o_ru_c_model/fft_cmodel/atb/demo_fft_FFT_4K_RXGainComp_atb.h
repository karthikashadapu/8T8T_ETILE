// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-19 15:28:13
// ------------------------------------------------------------------------- 
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef SOFTWARE_MODEL_DEMO_FFT_FFT_4K_RXGAINCOMPATB_H_
#define SOFTWARE_MODEL_DEMO_FFT_FFT_4K_RXGAINCOMPATB_H_

#include "support/csl_io.h"
#include "demo_fft_FFT_4K_RXGainComp.h"

class demo_fft_FFT_4K_RXGainCompATB
{
public:
    void read_from_stm(csl_stimulus_file& stm, demo_fft_FFT_4K_RXGainComp::io_struct_channel_RXG1_in& valueOut)
    {
        stm.get(valueOut.port_in_1_vin_tpl, 1);
        stm.get(valueOut.port_in_2_chin_tpl, 8);
        stm.get(valueOut.port_in_3_real_din_tpl, 16);
        stm.get(valueOut.port_in_3_imag_din_tpl, 16);
        stm.get(valueOut.port_in_5_size_tpl, 16);
        stm.get(valueOut.port_in_4_nsc_tpl, 16);
        stm.get(valueOut.port_in_6_fft_gain_re_tpl, 16);
        stm.get(valueOut.port_in_7_fft_gain_im_tpl, 16);
        stm.get(valueOut.port_in_8_time_in_tpl, 16);
    }

    bool run()
    {
        bool success = true;
        demo_fft_FFT_4K_RXGainComp* model_instance = new demo_fft_FFT_4K_RXGainComp();
        model_instance->reset();
        csl_info("[demo_fft_FFT_4K_RXGainComp] Opening input stimulus files...");
        csl_stimulus_file io_struct_channel_RXG1_in_stm_in0("../demo_fft_FFT_4K_RXGainComp_channel_RXG1_in_cunroll_x.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_channel_RXG1_in_stm_in0.is_open();
        csl_info("[demo_fft_FFT_4K_RXGainComp] Simulating...");
        while(io_struct_channel_RXG1_in_stm_in0.next_line())
        {
            demo_fft_FFT_4K_RXGainComp::io_struct_channel_RXG1_in io_struct_channel_RXG1_in0;
            read_from_stm(io_struct_channel_RXG1_in_stm_in0, io_struct_channel_RXG1_in0);
            model_instance->write(io_struct_channel_RXG1_in0);
            demo_fft_FFT_4K_RXGainComp::io_struct_channel_RXG1_out io_struct_channel_RXG1_out0;
            model_instance->read(io_struct_channel_RXG1_out0);
        }
        delete model_instance;
        if (success)
        {
            csl_info("[demo_fft_FFT_4K_RXGainComp] Simulation has completed.");
            return true;
        }
        csl_info("[demo_fft_FFT_4K_RXGainComp] Simulation failure! Stimulus file IO errors occurred.");
        return false;
    }

    bool compare()
    {
        bool success = true;
        success &= csl_compare_stm_files("demo_fft_FFT_4K_RXGainComp_channel_RXG1_out_cunroll_x.stm", "../demo_fft_FFT_4K_RXGainComp_channel_RXG1_out_cunroll_x.stm");
        if (success)
        {
            csl_info("[demo_fft_FFT_4K_RXGainComp] Success! Software model matches Simulink simulation.");
        }
        else
        {
            csl_info("[demo_fft_FFT_4K_RXGainComp] Failure! Software model does not match Simulink simulation. This may be expected if the software model simulation mode does not match the DSPBA mode.");
        }
        return success;
    }
};

#endif // SOFTWARE_MODEL_DEMO_FFT_FFT_4K_RXGAINCOMPATB_H_

