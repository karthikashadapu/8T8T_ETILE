// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-19 15:28:13
// ------------------------------------------------------------------------- 
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef SOFTWARE_MODEL_DEMO_FFT_FFT_4K_H_
#define SOFTWARE_MODEL_DEMO_FFT_FFT_4K_H_

#include "support/csl.h"
#ifdef WRITE_STM_FILES
#include "support/csl_io.h"
#endif
#include "demo_fft_FFT_4K_RXScaling.h"
#include "demo_fft_FFT_4K_RXGainComp.h"
#include "demo_fft_FFT_4K_BitReverseCoreC.h"
#include "demo_fft_FFT_4K_FFT.h"

class demo_fft_FFT_4K
{
public:
    // IO struct for "xc_s"
    struct io_struct_xc_s
    {
        int8_t port_xc_s;

        io_struct_xc_s()
            : port_xc_s(0)
        {
        }
    };

    // IO struct for "xr_im"
    struct io_struct_xr_im
    {
        int16_t port_xr_im;

        io_struct_xr_im()
            : port_xr_im(0)
        {
        }
    };

    // IO struct for "xr_re"
    struct io_struct_xr_re
    {
        int16_t port_xr_re;

        io_struct_xr_re()
            : port_xr_re(0)
        {
        }
    };

    // IO struct for "xv_s"
    struct io_struct_xv_s
    {
        int8_t port_xv_s;

        io_struct_xv_s()
            : port_xv_s(0)
        {
        }
    };

    // IO struct for "yc_s"
    struct io_struct_yc_s
    {
        int8_t port_yc_s;

        io_struct_yc_s()
            : port_yc_s(0)
        {
        }
    };

    // IO struct for "yr_im"
    struct io_struct_yr_im
    {
        int16_t port_yr_im;

        io_struct_yr_im()
            : port_yr_im(0)
        {
        }
    };

    // IO struct for "yr_re"
    struct io_struct_yr_re
    {
        int16_t port_yr_re;

        io_struct_yr_re()
            : port_yr_re(0)
        {
        }
    };

    // IO struct for "yv_s"
    struct io_struct_yv_s
    {
        int8_t port_yv_s;

        io_struct_yv_s()
            : port_yv_s(0)
        {
        }
    };

    // IO struct for "zc_s"
    struct io_struct_zc_s
    {
        int8_t port_zc_s;

        io_struct_zc_s()
            : port_zc_s(0)
        {
        }
    };

    // IO struct for "zr_im"
    struct io_struct_zr_im
    {
        int16_t port_zr_im;

        io_struct_zr_im()
            : port_zr_im(0)
        {
        }
    };

    // IO struct for "zr_re"
    struct io_struct_zr_re
    {
        int16_t port_zr_re;

        io_struct_zr_re()
            : port_zr_re(0)
        {
        }
    };

    // IO struct for "zv_s"
    struct io_struct_zv_s
    {
        int8_t port_zv_s;

        io_struct_zv_s()
            : port_zv_s(0)
        {
        }
    };

public:
    // Resets internal simulation state to default values.
    void reset();

    // Read functions read the values of an output node from the model.
    // Delay correction is applied if the model is bit-accurate
    // but not cycle accurate to simulate latency from delay balancing.
    // DSP Builder applies this same adjustment for bit-accurate
    // non-cycle accurate simulation in Simulink.
    // 
    // Read functions will append output to stimulus files if compiling
    // with WRITE_STM_FILES defined.
    // 
    // Read functions should be called once per cycle per instance.
    // Subsequent calls in the same cycle will copy output values to the
    // provided struct, but will not write stimulus or update internal state.
    void read(io_struct_yc_s& output)
    {
        bool needsToExecute = (m_io_cycle[4] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[4]++;
            execute();
        }

        csl_memcpy(&output.port_yc_s, &m_n[YC_S_YC_S_19], 1);
    }

    void read(io_struct_yr_im& output)
    {
        bool needsToExecute = (m_io_cycle[5] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[5]++;
            execute();
        }

        csl_memcpy(&output.port_yr_im, &m_n[YR_IM_YR_IM_20], 2);
    }

    void read(io_struct_yr_re& output)
    {
        bool needsToExecute = (m_io_cycle[6] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[6]++;
            execute();
        }

        csl_memcpy(&output.port_yr_re, &m_n[YR_RE_YR_RE_21], 2);
    }

    void read(io_struct_yv_s& output)
    {
        bool needsToExecute = (m_io_cycle[7] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[7]++;
            execute();
        }

        csl_memcpy(&output.port_yv_s, &m_n[YV_S_YV_S_18], 1);
    }

    void read(io_struct_zc_s& output)
    {
        bool needsToExecute = (m_io_cycle[8] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[8]++;
            execute();
        }

        csl_memcpy(&output.port_zc_s, &m_n[ZC_S_ZC_S_15], 1);
    }

    void read(io_struct_zr_im& output)
    {
        bool needsToExecute = (m_io_cycle[9] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[9]++;
            execute();
        }

        csl_memcpy(&output.port_zr_im, &m_n[ZR_IM_ZR_IM_16], 2);
    }

    void read(io_struct_zr_re& output)
    {
        bool needsToExecute = (m_io_cycle[10] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[10]++;
            execute();
        }

        csl_memcpy(&output.port_zr_re, &m_n[ZR_RE_ZR_RE_17], 2);
    }

    void read(io_struct_zv_s& output)
    {
        bool needsToExecute = (m_io_cycle[11] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[11]++;
            execute();
        }

        csl_memcpy(&output.port_zv_s, &m_n[ZV_S_ZV_S_14], 1);
    }

    // Write functions write the values of an input node to the model
    // and initiates any internal simulation that depends on that 
    // input and any other inputs previously provided for the
    // current cycle. When all inputs nodes have been provided,
    // the next cycle will begin automatically.
    // 
    // Write functions will append output to stimulus files if compiling
    // with WRITE_STM_FILES defined.
    // 
    // Write functions should be called once per cycle per instance.
    // Subsequent calls in the same cycle will do nothing.
    void write(const io_struct_xc_s& input)
    {
        bool needsToExecute = (m_io_cycle[0] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[XC_S_XC_S_XC_S_11], &input.port_xc_s, 1);
            m_io_cycle[0]++;
            execute();
        }
    }

    void write(const io_struct_xr_im& input)
    {
        bool needsToExecute = (m_io_cycle[1] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[XR_IM_XR_IM_XR_IM_12], &input.port_xr_im, 2);
            m_io_cycle[1]++;
            execute();
        }
    }

    void write(const io_struct_xr_re& input)
    {
        bool needsToExecute = (m_io_cycle[2] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[XR_RE_XR_RE_XR_RE_13], &input.port_xr_re, 2);
            m_io_cycle[2]++;
            execute();
        }
    }

    void write(const io_struct_xv_s& input)
    {
        bool needsToExecute = (m_io_cycle[3] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[XV_S_XV_S_XV_S_10], &input.port_xv_s, 1);
            m_io_cycle[3]++;
            execute();
        }
    }

private:
    // Segments are chunks of execution that depend on unique sets of inputs
    // These functions are invoked automatically as inputs are provided to the model.
    void execute_segment_0();
    void execute_segment_1();
    void execute_segment_2();
    void execute_segment_3();
    void execute_segment_4();
    void execute_segment_5();
    void execute_segment_update();

    // Progresses the internal simulation state based on the currently
    // available input values
    void execute()
    {
        if ((m_segment_cycle[0] == m_update_cycle))
        {
            execute_segment_0();
            ++m_segment_cycle[0];
        }
        if ((m_segment_cycle[1] == m_update_cycle) && (m_io_cycle[2] > m_update_cycle))
        {
            execute_segment_1();
            ++m_segment_cycle[1];
        }
        if ((m_segment_cycle[2] == m_update_cycle) && (m_io_cycle[1] > m_update_cycle))
        {
            execute_segment_2();
            ++m_segment_cycle[2];
        }
        if ((m_segment_cycle[3] == m_update_cycle) && (m_io_cycle[0] > m_update_cycle))
        {
            execute_segment_3();
            ++m_segment_cycle[3];
        }
        if ((m_segment_cycle[4] == m_update_cycle) && (m_io_cycle[3] > m_update_cycle))
        {
            execute_segment_4();
            ++m_segment_cycle[4];
        }
        if ((m_segment_cycle[5] == m_update_cycle) && (m_io_cycle[1] > m_update_cycle) && (m_io_cycle[2] > m_update_cycle) && (m_io_cycle[0] > m_update_cycle) && (m_io_cycle[3] > m_update_cycle))
        {
            execute_segment_5();
            ++m_segment_cycle[5];
        }
        const bool all_io_ready = (m_io_cycle[0] > m_update_cycle) && (m_io_cycle[1] > m_update_cycle) && (m_io_cycle[2] > m_update_cycle) && (m_io_cycle[3] > m_update_cycle) && (m_io_cycle[4] > m_update_cycle) && (m_io_cycle[5] > m_update_cycle) && (m_io_cycle[6] > m_update_cycle) && (m_io_cycle[7] > m_update_cycle) && (m_io_cycle[8] > m_update_cycle) && (m_io_cycle[9] > m_update_cycle) && (m_io_cycle[10] > m_update_cycle) && (m_io_cycle[11] > m_update_cycle);
        if (all_io_ready && (m_segment_cycle[0] > m_update_cycle) && (m_segment_cycle[1] > m_update_cycle) && (m_segment_cycle[2] > m_update_cycle) && (m_segment_cycle[3] > m_update_cycle) && (m_segment_cycle[4] > m_update_cycle) && (m_segment_cycle[5] > m_update_cycle))
        {
            execute_segment_update();
            ++m_update_cycle;
        }
    }

    static const size_t GND_GND_Q_0;
    static const size_t FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_2_QC_TPL_7;
    static const size_t FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_IMAG_Q_TPL_7;
    static const size_t FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_REAL_Q_TPL_7;
    static const size_t RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_1_VOUT_TPL_8;
    static const size_t RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_2_CHOUT_TPL_8;
    static const size_t RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_8;
    static const size_t RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_3_REAL_DOUT_TPL_8;
    static const size_t RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_4_NSC_OUT_TPL_8;
    static const size_t RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_5_SIZE_OUT_TPL_8;
    static const size_t RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_6_TIME_OUT_TPL_8;
    static const size_t VCC_VCC_Q_1;
    static const size_t RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_1_VOUT_TPL_9;
    static const size_t RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_2_CHOUT_TPL_9;
    static const size_t RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_9;
    static const size_t RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_3_REAL_DOUT_TPL_9;
    static const size_t RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_4_SIZE_OUT_TPL_9;
    static const size_t RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_5_NSC_OUT_TPL_9;
    static const size_t RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_6_TIME_OUT_TPL_9;
    static const size_t XV_S_XV_S_XV_S_10;
    static const size_t XC_S_XC_S_XC_S_11;
    static const size_t XR_IM_XR_IM_XR_IM_12;
    static const size_t CONST_RSRVD_FIX_CONST_RSRVD_FIX_Q_2;
    static const size_t XR_RE_XR_RE_XR_RE_13;
    static const size_t YR_RE_YR_RE_21;
    static const size_t YR_IM_YR_IM_20;
    static const size_t YC_S_YC_S_19;
    static const size_t YV_S_YV_S_18;
    static const size_t ZR_RE_ZR_RE_17;
    static const size_t ZR_IM_ZR_IM_16;
    static const size_t ZC_S_ZC_S_15;
    static const size_t ZV_S_ZV_S_14;
    static const size_t CONST1_CONST1_Q_3;
    static const size_t CONST3_CONST3_Q_5;
    static const size_t BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_1_QV_TPL_6;
    static const size_t BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_2_QC_TPL_6;
    static const size_t BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_IMAG_Q_TPL_6;
    static const size_t BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_REAL_Q_TPL_6;
    static const size_t FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_1_QV_TPL_7;

    demo_fft_FFT_4K_BitReverseCoreC m_demo_fft_FFT_4K_BitReverseCoreC_inst0;
    demo_fft_FFT_4K_FFT m_demo_fft_FFT_4K_FFT_inst0;
    demo_fft_FFT_4K_RXGainComp m_demo_fft_FFT_4K_RXGainComp_inst0;
    demo_fft_FFT_4K_RXScaling m_demo_fft_FFT_4K_RXScaling_inst0;
    int64_t m_io_cycle[12];
    int64_t m_segment_cycle[6];
    int64_t m_update_cycle;

    int64_t m_n[39];
};

#endif // SOFTWARE_MODEL_DEMO_FFT_FFT_4K_H_