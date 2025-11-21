// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-19 15:28:13
// ------------------------------------------------------------------------- 
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef SOFTWARE_MODEL_DEMO_FFT_FFT_4KATB_H_
#define SOFTWARE_MODEL_DEMO_FFT_FFT_4KATB_H_

#include "support/csl_io.h"
#include "demo_fft_FFT_4K.h"

#include "connector.h"

class demo_fft_FFT_4KATB
{
public:
    void read_from_stm(csl_stimulus_file& stm, demo_fft_FFT_4K::io_struct_xc_s& valueOut)
    {
        stm.skip(1);
        stm.get(valueOut.port_xc_s, 8);
    }

    void read_from_stm(csl_stimulus_file& stm, demo_fft_FFT_4K::io_struct_xr_im& valueOut)
    {
        stm.skip(3);
        stm.get(valueOut.port_xr_im, 16);
    }

    void read_from_stm(csl_stimulus_file& stm, demo_fft_FFT_4K::io_struct_xr_re& valueOut)
    {
        stm.skip(2);
        stm.get(valueOut.port_xr_re, 16);
    }

    void read_from_stm(csl_stimulus_file& stm, demo_fft_FFT_4K::io_struct_xv_s& valueOut)
    {
        stm.get(valueOut.port_xv_s, 1);
    }

    void fft_fun(data_struct* in, data_struct* out)
    {
        int i;
        demo_fft_FFT_4K inst0;
        inst0.reset();

        demo_fft_FFT_4K::io_struct_xc_s io_struct_xc_s0;
        demo_fft_FFT_4K::io_struct_xr_im io_struct_xr_im0;
        demo_fft_FFT_4K::io_struct_xr_re io_struct_xr_re0;
        demo_fft_FFT_4K::io_struct_xv_s io_struct_xv_s0;

        demo_fft_FFT_4K::io_struct_yc_s io_struct_yc_s0;
        demo_fft_FFT_4K::io_struct_yr_im io_struct_yr_im0;
        demo_fft_FFT_4K::io_struct_yr_re io_struct_yr_re0;
        demo_fft_FFT_4K::io_struct_yv_s io_struct_yv_s0;

        demo_fft_FFT_4K::io_struct_zc_s io_struct_zc_s0;
        demo_fft_FFT_4K::io_struct_zr_im io_struct_zr_im0;
        demo_fft_FFT_4K::io_struct_zr_re io_struct_zr_re0;
        demo_fft_FFT_4K::io_struct_zv_s io_struct_zv_s0;

        for (i = 0;i < 12400;i++)
        {
            csl_memcpy(&io_struct_xv_s0.port_xv_s, &in[i].valid, sizeof(int8_t));
            csl_memcpy(&io_struct_xc_s0.port_xc_s, &in[i].channel, sizeof(int8_t));
            csl_memcpy(&io_struct_xr_re0.port_xr_re, &in[i].real, sizeof(int16_t));
            csl_memcpy(&io_struct_xr_im0.port_xr_im, &in[i].imag, sizeof(int16_t));

            inst0.write(io_struct_xc_s0);
            inst0.write(io_struct_xr_im0);
            inst0.write(io_struct_xr_re0);
            inst0.write(io_struct_xv_s0);

            inst0.read(io_struct_yc_s0);
            inst0.read(io_struct_yr_im0);
            inst0.read(io_struct_yr_re0);
            inst0.read(io_struct_yv_s0);

            inst0.read(io_struct_zc_s0);
            inst0.read(io_struct_zr_im0);
            inst0.read(io_struct_zr_re0);
            inst0.read(io_struct_zv_s0);

            csl_memcpy(&out[i].valid, &io_struct_zv_s0.port_zv_s, sizeof(int8_t));
            csl_memcpy(&out[i].channel, &io_struct_zc_s0.port_zc_s, sizeof(int8_t));
            csl_memcpy(&out[i].real, &io_struct_zr_re0.port_zr_re, sizeof(int32_t));
            csl_memcpy(&out[i].imag, &io_struct_zr_im0.port_zr_im, sizeof(int32_t));
        }
    }

    bool run()
    {
        bool success = true;
        demo_fft_FFT_4K* model_instance = new demo_fft_FFT_4K();
        model_instance->reset();
        csl_info("[demo_fft_FFT_4K] Opening input stimulus files...");
        csl_stimulus_file io_struct_xc_s_stm_in0("../demo_fft_FFT_4K_RXGainComp_channel_RXG1_in_cunroll_x.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_xc_s_stm_in0.is_open();
        csl_stimulus_file io_struct_xr_im_stm_in1("../demo_fft_FFT_4K_RXGainComp_channel_RXG1_in_cunroll_x.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_xr_im_stm_in1.is_open();
        csl_stimulus_file io_struct_xr_re_stm_in2("../demo_fft_FFT_4K_RXGainComp_channel_RXG1_in_cunroll_x.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_xr_re_stm_in2.is_open();
        csl_stimulus_file io_struct_xv_s_stm_in3("../demo_fft_FFT_4K_RXGainComp_channel_RXG1_in_cunroll_x.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_xv_s_stm_in3.is_open();
        csl_info("[demo_fft_FFT_4K] Simulating...");
        while(io_struct_xc_s_stm_in0.next_line() && io_struct_xr_im_stm_in1.next_line() && io_struct_xr_re_stm_in2.next_line() && io_struct_xv_s_stm_in3.next_line())
        {
            demo_fft_FFT_4K::io_struct_xc_s io_struct_xc_s0;
            read_from_stm(io_struct_xc_s_stm_in0, io_struct_xc_s0);
            io_struct_xc_s_stm_in0.skip(7);
            model_instance->write(io_struct_xc_s0);
            demo_fft_FFT_4K::io_struct_xr_im io_struct_xr_im0;
            read_from_stm(io_struct_xr_im_stm_in1, io_struct_xr_im0);
            io_struct_xr_im_stm_in1.skip(5);
            model_instance->write(io_struct_xr_im0);
            demo_fft_FFT_4K::io_struct_xr_re io_struct_xr_re0;
            read_from_stm(io_struct_xr_re_stm_in2, io_struct_xr_re0);
            io_struct_xr_re_stm_in2.skip(6);
            model_instance->write(io_struct_xr_re0);
            demo_fft_FFT_4K::io_struct_xv_s io_struct_xv_s0;
            read_from_stm(io_struct_xv_s_stm_in3, io_struct_xv_s0);
            io_struct_xv_s_stm_in3.skip(8);
            model_instance->write(io_struct_xv_s0);
            demo_fft_FFT_4K::io_struct_yc_s io_struct_yc_s0;
            model_instance->read(io_struct_yc_s0);
            demo_fft_FFT_4K::io_struct_yr_im io_struct_yr_im0;
            model_instance->read(io_struct_yr_im0);
            demo_fft_FFT_4K::io_struct_yr_re io_struct_yr_re0;
            model_instance->read(io_struct_yr_re0);
            demo_fft_FFT_4K::io_struct_yv_s io_struct_yv_s0;
            model_instance->read(io_struct_yv_s0);
            demo_fft_FFT_4K::io_struct_zc_s io_struct_zc_s0;
            model_instance->read(io_struct_zc_s0);
            demo_fft_FFT_4K::io_struct_zr_im io_struct_zr_im0;
            model_instance->read(io_struct_zr_im0);
            demo_fft_FFT_4K::io_struct_zr_re io_struct_zr_re0;
            model_instance->read(io_struct_zr_re0);
            demo_fft_FFT_4K::io_struct_zv_s io_struct_zv_s0;
            model_instance->read(io_struct_zv_s0);
        }
        delete model_instance;
        if (success)
        {
            csl_info("[demo_fft_FFT_4K] Simulation has completed.");
            return true;
        }
        csl_info("[demo_fft_FFT_4K] Simulation failure! Stimulus file IO errors occurred.");
        return false;
    }

    bool compare()
    {
        bool success = true;
        success &= csl_compare_stm_files("demo_fft_FFT_4K_BitReverseCoreC_ChannelOut_cunroll_x.stm", "../demo_fft_FFT_4K_BitReverseCoreC_ChannelOut_cunroll_x.stm");
        success &= csl_compare_stm_files("demo_fft_FFT_4K_BitReverseCoreC_ChannelOut_cunroll_x.stm", "../demo_fft_FFT_4K_BitReverseCoreC_ChannelOut_cunroll_x.stm");
        success &= csl_compare_stm_files("demo_fft_FFT_4K_BitReverseCoreC_ChannelOut_cunroll_x.stm", "../demo_fft_FFT_4K_BitReverseCoreC_ChannelOut_cunroll_x.stm");
        success &= csl_compare_stm_files("demo_fft_FFT_4K_BitReverseCoreC_ChannelOut_cunroll_x.stm", "../demo_fft_FFT_4K_BitReverseCoreC_ChannelOut_cunroll_x.stm");
        success &= csl_compare_stm_files("demo_fft_FFT_4K_RXScaling_channel_RXS1_out.stm", "../demo_fft_FFT_4K_RXScaling_channel_RXS1_out.stm");
        success &= csl_compare_stm_files("demo_fft_FFT_4K_RXScaling_channel_RXS1_out.stm", "../demo_fft_FFT_4K_RXScaling_channel_RXS1_out.stm");
        success &= csl_compare_stm_files("demo_fft_FFT_4K_RXScaling_channel_RXS1_out.stm", "../demo_fft_FFT_4K_RXScaling_channel_RXS1_out.stm");
        success &= csl_compare_stm_files("demo_fft_FFT_4K_RXScaling_channel_RXS1_out.stm", "../demo_fft_FFT_4K_RXScaling_channel_RXS1_out.stm");
        if (success)
        {
            csl_info("[demo_fft_FFT_4K] Success! Software model matches Simulink simulation.");
        }
        else
        {
            csl_info("[demo_fft_FFT_4K] Failure! Software model does not match Simulink simulation. This may be expected if the software model simulation mode does not match the DSPBA mode.");
        }
        return success;
    }
};

#endif // SOFTWARE_MODEL_DEMO_FFT_FFT_4KATB_H_

