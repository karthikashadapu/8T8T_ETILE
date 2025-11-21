// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-19 18:12:09
// ------------------------------------------------------------------------- 
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_H_
#define SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_H_

#include "support/csl.h"
#ifdef WRITE_STM_FILES
#include "support/csl_io.h"
#endif
#include "phase_comp_phase_comp_ComplexMixer.h"
#include "phase_comp_phase_comp_PhasorGenerate.h"

class phase_comp_phase_comp
{
public:
    // IO struct for "jc_s"
    struct io_struct_jc_s
    {
        int8_t port_jc_s;

        io_struct_jc_s()
            : port_jc_s(0)
        {
        }
    };

    // IO struct for "jr_im"
    struct io_struct_jr_im
    {
        int16_t port_jr_im;

        io_struct_jr_im()
            : port_jr_im(0)
        {
        }
    };

    // IO struct for "jr_re"
    struct io_struct_jr_re
    {
        int16_t port_jr_re;

        io_struct_jr_re()
            : port_jr_re(0)
        {
        }
    };

    // IO struct for "jv_s"
    struct io_struct_jv_s
    {
        int8_t port_jv_s;

        io_struct_jv_s()
            : port_jv_s(0)
        {
        }
    };

    // IO struct for "xc_s"
    struct io_struct_xc_s
    {
        int8_t port_xc_s;

        io_struct_xc_s()
            : port_xc_s(0)
        {
        }
    };

    // IO struct for "xd_s"
    struct io_struct_xd_s
    {
        int8_t port_xd_s;

        io_struct_xd_s()
            : port_xd_s(0)
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
    void read(io_struct_jc_s& output)
    {
        bool needsToExecute = (m_io_cycle[0] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[0]++;
            execute();
        }

        csl_memcpy(&output.port_jc_s, &m_n[JC_S_JC_S_16], 1);
    }

    void read(io_struct_jr_im& output)
    {
        bool needsToExecute = (m_io_cycle[1] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[1]++;
            execute();
        }

        csl_memcpy(&output.port_jr_im, &m_n[JR_IM_JR_IM_17], 2);
    }

    void read(io_struct_jr_re& output)
    {
        bool needsToExecute = (m_io_cycle[2] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[2]++;
            execute();
        }

        csl_memcpy(&output.port_jr_re, &m_n[JR_RE_JR_RE_18], 2);
    }

    void read(io_struct_jv_s& output)
    {
        bool needsToExecute = (m_io_cycle[3] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[3]++;
            execute();
        }

        csl_memcpy(&output.port_jv_s, &m_n[JV_S_JV_S_15], 1);
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
        bool needsToExecute = (m_io_cycle[4] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[XC_S_XC_S_XC_S_11], &input.port_xc_s, 1);
            m_io_cycle[4]++;
            execute();
        }
    }

    void write(const io_struct_xd_s& input)
    {
        bool needsToExecute = (m_io_cycle[5] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[XD_S_XD_S_XD_S_14], &input.port_xd_s, 1);
            m_io_cycle[5]++;
            execute();
        }
    }

    void write(const io_struct_xr_im& input)
    {
        bool needsToExecute = (m_io_cycle[6] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[XR_IM_XR_IM_XR_IM_12], &input.port_xr_im, 2);
            m_io_cycle[6]++;
            execute();
        }
    }

    void write(const io_struct_xr_re& input)
    {
        bool needsToExecute = (m_io_cycle[7] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[XR_RE_XR_RE_XR_RE_13], &input.port_xr_re, 2);
            m_io_cycle[7]++;
            execute();
        }
    }

    void write(const io_struct_xv_s& input)
    {
        bool needsToExecute = (m_io_cycle[8] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[XV_S_XV_S_XV_S_10], &input.port_xv_s, 1);
            m_io_cycle[8]++;
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
    void execute_segment_6();
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
        if ((m_segment_cycle[1] == m_update_cycle) && (m_io_cycle[5] > m_update_cycle))
        {
            execute_segment_1();
            ++m_segment_cycle[1];
        }
        if ((m_segment_cycle[2] == m_update_cycle) && (m_io_cycle[7] > m_update_cycle))
        {
            execute_segment_2();
            ++m_segment_cycle[2];
        }
        if ((m_segment_cycle[3] == m_update_cycle) && (m_io_cycle[6] > m_update_cycle))
        {
            execute_segment_3();
            ++m_segment_cycle[3];
        }
        if ((m_segment_cycle[4] == m_update_cycle) && (m_io_cycle[4] > m_update_cycle))
        {
            execute_segment_4();
            ++m_segment_cycle[4];
        }
        if ((m_segment_cycle[5] == m_update_cycle) && (m_io_cycle[8] > m_update_cycle))
        {
            execute_segment_5();
            ++m_segment_cycle[5];
        }
        if ((m_segment_cycle[6] == m_update_cycle) && (m_io_cycle[4] > m_update_cycle) && (m_io_cycle[7] > m_update_cycle) && (m_io_cycle[8] > m_update_cycle) && (m_io_cycle[5] > m_update_cycle) && (m_io_cycle[6] > m_update_cycle))
        {
            execute_segment_6();
            ++m_segment_cycle[6];
        }
        const bool all_io_ready = (m_io_cycle[0] > m_update_cycle) && (m_io_cycle[1] > m_update_cycle) && (m_io_cycle[2] > m_update_cycle) && (m_io_cycle[3] > m_update_cycle) && (m_io_cycle[4] > m_update_cycle) && (m_io_cycle[5] > m_update_cycle) && (m_io_cycle[6] > m_update_cycle) && (m_io_cycle[7] > m_update_cycle) && (m_io_cycle[8] > m_update_cycle);
        if (all_io_ready && (m_segment_cycle[0] > m_update_cycle) && (m_segment_cycle[1] > m_update_cycle) && (m_segment_cycle[2] > m_update_cycle) && (m_segment_cycle[3] > m_update_cycle) && (m_segment_cycle[4] > m_update_cycle) && (m_segment_cycle[5] > m_update_cycle) && (m_segment_cycle[6] > m_update_cycle))
        {
            execute_segment_update();
            ++m_update_cycle;
        }
    }

    static const size_t GND_GND_Q_0;
    static const size_t PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_1_IMAG_DOUT1_TPL_9;
    static const size_t PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_1_REAL_DOUT1_TPL_9;
    static const size_t PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_2_VOUT_TPL_9;
    static const size_t PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_3_COUT_TPL_9;
    static const size_t PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_4_SIN_TPL_9;
    static const size_t PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_5_COS_TPL_9;
    static const size_t PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_6_FFT_SIZE_OUT_TPL_9;
    static const size_t PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_7_CPLENOUT_TPL_9;
    static const size_t PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_8_NSC_OUT_TPL_9;
    static const size_t XV_S_XV_S_XV_S_10;
    static const size_t VCC_VCC_Q_1;
    static const size_t XC_S_XC_S_XC_S_11;
    static const size_t XR_IM_XR_IM_XR_IM_12;
    static const size_t XR_RE_XR_RE_XR_RE_13;
    static const size_t XD_S_XD_S_XD_S_14;
    static const size_t JR_RE_JR_RE_18;
    static const size_t JR_IM_JR_IM_17;
    static const size_t JC_S_JC_S_16;
    static const size_t JV_S_JV_S_15;
    static const size_t CONST2_CONST2_Q_2;
    static const size_t CONST4_CONST4_Q_4;
    static const size_t CONST7_CONST7_Q_6;
    static const size_t CONSTANT_RSRVD_FIX_CONSTANT_RSRVD_FIX_Q_7;
    static const size_t COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_1_IMAG_DOUT1_TPL_8;
    static const size_t COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_1_REAL_DOUT1_TPL_8;
    static const size_t COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_2_VOUT_TPL_8;
    static const size_t COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_3_COUT_TPL_8;

    int64_t m_io_cycle[9];
    phase_comp_phase_comp_ComplexMixer m_phase_comp_phase_comp_ComplexMixer_inst0;
    phase_comp_phase_comp_PhasorGenerate m_phase_comp_phase_comp_PhasorGenerate_inst0;
    int64_t m_segment_cycle[7];
    int64_t m_update_cycle;

    int64_t m_n[28];
};

#endif // SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_H_