// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-14 19:07:02
// ------------------------------------------------------------------------- 
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_H_
#define SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_H_

#include "support/csl.h"
#ifdef WRITE_STM_FILES
#include "support/csl_io.h"
#endif
#include "phase_comp_phase_comp_ComplexMixer_Scaleq.h"
#include "phase_comp_phase_comp_ComplexMixer_ComplexMixer.h"
#include "phase_comp_phase_comp_ComplexMixer_Scalei.h"

class phase_comp_phase_comp_ComplexMixer
{
public:
    // IO struct for "in_1_imag_din1_tpl"
    struct io_struct_in_1_imag_din1_tpl
    {
        int16_t port_in_1_imag_din1_tpl;

        io_struct_in_1_imag_din1_tpl()
            : port_in_1_imag_din1_tpl(0)
        {
        }
    };

    // IO struct for "in_1_real_din1_tpl"
    struct io_struct_in_1_real_din1_tpl
    {
        int16_t port_in_1_real_din1_tpl;

        io_struct_in_1_real_din1_tpl()
            : port_in_1_real_din1_tpl(0)
        {
        }
    };

    // IO struct for "in_2_vin_tpl"
    struct io_struct_in_2_vin_tpl
    {
        int8_t port_in_2_vin_tpl;

        io_struct_in_2_vin_tpl()
            : port_in_2_vin_tpl(0)
        {
        }
    };

    // IO struct for "in_3_cin_tpl"
    struct io_struct_in_3_cin_tpl
    {
        int8_t port_in_3_cin_tpl;

        io_struct_in_3_cin_tpl()
            : port_in_3_cin_tpl(0)
        {
        }
    };

    // IO struct for "in_4_sin_tpl"
    struct io_struct_in_4_sin_tpl
    {
        int32_t port_in_4_sin_tpl;

        io_struct_in_4_sin_tpl()
            : port_in_4_sin_tpl(0)
        {
        }
    };

    // IO struct for "in_5_cos_tpl"
    struct io_struct_in_5_cos_tpl
    {
        int32_t port_in_5_cos_tpl;

        io_struct_in_5_cos_tpl()
            : port_in_5_cos_tpl(0)
        {
        }
    };

    // IO struct for "out_1_imag_dout1_tpl"
    struct io_struct_out_1_imag_dout1_tpl
    {
        int16_t port_out_1_imag_dout1_tpl;

        io_struct_out_1_imag_dout1_tpl()
            : port_out_1_imag_dout1_tpl(0)
        {
        }
    };

    // IO struct for "out_1_real_dout1_tpl"
    struct io_struct_out_1_real_dout1_tpl
    {
        int16_t port_out_1_real_dout1_tpl;

        io_struct_out_1_real_dout1_tpl()
            : port_out_1_real_dout1_tpl(0)
        {
        }
    };

    // IO struct for "out_2_vout_tpl"
    struct io_struct_out_2_vout_tpl
    {
        int8_t port_out_2_vout_tpl;

        io_struct_out_2_vout_tpl()
            : port_out_2_vout_tpl(0)
        {
        }
    };

    // IO struct for "out_3_cout_tpl"
    struct io_struct_out_3_cout_tpl
    {
        int8_t port_out_3_cout_tpl;

        io_struct_out_3_cout_tpl()
            : port_out_3_cout_tpl(0)
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
    void read(io_struct_out_1_imag_dout1_tpl& output)
    {
        bool needsToExecute = (m_io_cycle[6] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[6]++;
            execute();
        }

        csl_memcpy(&output.port_out_1_imag_dout1_tpl, &m_n[OUT_1_IMAG_DOUT1_TPL_OUT_1_IMAG_DOUT1_TPL_12], 2);

#ifdef WRITE_STM_FILES
        if (needsToExecute)
        {
            m_stm_out_1_imag_dout1_tpl.write_stm_data(output.port_out_1_imag_dout1_tpl, 16);
            m_stm_out_1_imag_dout1_tpl.next_line();
        }
#endif
    }

    void read(io_struct_out_1_real_dout1_tpl& output)
    {
        bool needsToExecute = (m_io_cycle[7] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[7]++;
            execute();
        }

        csl_memcpy(&output.port_out_1_real_dout1_tpl, &m_n[OUT_1_REAL_DOUT1_TPL_OUT_1_REAL_DOUT1_TPL_13], 2);

#ifdef WRITE_STM_FILES
        if (needsToExecute)
        {
            m_stm_out_1_real_dout1_tpl.write_stm_data(output.port_out_1_real_dout1_tpl, 16);
            m_stm_out_1_real_dout1_tpl.next_line();
        }
#endif
    }

    void read(io_struct_out_2_vout_tpl& output)
    {
        bool needsToExecute = (m_io_cycle[8] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[8]++;
            execute();
        }

        csl_memcpy(&output.port_out_2_vout_tpl, &m_n[OUT_2_VOUT_TPL_OUT_2_VOUT_TPL_14], 1);

#ifdef WRITE_STM_FILES
        if (needsToExecute)
        {
            m_stm_out_2_vout_tpl.write_stm_data(output.port_out_2_vout_tpl, 1);
            m_stm_out_2_vout_tpl.next_line();
        }
#endif
    }

    void read(io_struct_out_3_cout_tpl& output)
    {
        bool needsToExecute = (m_io_cycle[9] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[9]++;
            execute();
        }

        csl_memcpy(&output.port_out_3_cout_tpl, &m_n[OUT_3_COUT_TPL_OUT_3_COUT_TPL_15], 1);

#ifdef WRITE_STM_FILES
        if (needsToExecute)
        {
            m_stm_out_3_cout_tpl.write_stm_data(output.port_out_3_cout_tpl, 8);
            m_stm_out_3_cout_tpl.next_line();
        }
#endif
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
    void write(const io_struct_in_1_imag_din1_tpl& input)
    {
        bool needsToExecute = (m_io_cycle[0] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[IN_1_IMAG_DIN1_TPL_IN_1_IMAG_DIN1_TPL_IN_1_IMAG_DIN1_TPL_6], &input.port_in_1_imag_din1_tpl, 2);
#ifdef WRITE_STM_FILES
            m_stm_in_1_imag_din1_tpl.write_stm_data(input.port_in_1_imag_din1_tpl, 16);
            m_stm_in_1_imag_din1_tpl.next_line();
#endif
            m_io_cycle[0]++;
            execute();
        }
    }

    void write(const io_struct_in_1_real_din1_tpl& input)
    {
        bool needsToExecute = (m_io_cycle[1] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[IN_1_REAL_DIN1_TPL_IN_1_REAL_DIN1_TPL_IN_1_REAL_DIN1_TPL_7], &input.port_in_1_real_din1_tpl, 2);
#ifdef WRITE_STM_FILES
            m_stm_in_1_real_din1_tpl.write_stm_data(input.port_in_1_real_din1_tpl, 16);
            m_stm_in_1_real_din1_tpl.next_line();
#endif
            m_io_cycle[1]++;
            execute();
        }
    }

    void write(const io_struct_in_2_vin_tpl& input)
    {
        bool needsToExecute = (m_io_cycle[2] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[IN_2_VIN_TPL_IN_2_VIN_TPL_IN_2_VIN_TPL_8], &input.port_in_2_vin_tpl, 1);
#ifdef WRITE_STM_FILES
            m_stm_in_2_vin_tpl.write_stm_data(input.port_in_2_vin_tpl, 1);
            m_stm_in_2_vin_tpl.next_line();
#endif
            m_io_cycle[2]++;
            execute();
        }
    }

    void write(const io_struct_in_3_cin_tpl& input)
    {
        bool needsToExecute = (m_io_cycle[3] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[IN_3_CIN_TPL_IN_3_CIN_TPL_IN_3_CIN_TPL_9], &input.port_in_3_cin_tpl, 1);
#ifdef WRITE_STM_FILES
            m_stm_in_3_cin_tpl.write_stm_data(input.port_in_3_cin_tpl, 8);
            m_stm_in_3_cin_tpl.next_line();
#endif
            m_io_cycle[3]++;
            execute();
        }
    }

    void write(const io_struct_in_4_sin_tpl& input)
    {
        bool needsToExecute = (m_io_cycle[4] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[IN_4_SIN_TPL_IN_4_SIN_TPL_IN_4_SIN_TPL_10], &input.port_in_4_sin_tpl, 4);
#ifdef WRITE_STM_FILES
            m_stm_in_4_sin_tpl.write_stm_data(input.port_in_4_sin_tpl, 18);
            m_stm_in_4_sin_tpl.next_line();
#endif
            m_io_cycle[4]++;
            execute();
        }
    }

    void write(const io_struct_in_5_cos_tpl& input)
    {
        bool needsToExecute = (m_io_cycle[5] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[IN_5_COS_TPL_IN_5_COS_TPL_IN_5_COS_TPL_11], &input.port_in_5_cos_tpl, 4);
#ifdef WRITE_STM_FILES
            m_stm_in_5_cos_tpl.write_stm_data(input.port_in_5_cos_tpl, 18);
            m_stm_in_5_cos_tpl.next_line();
#endif
            m_io_cycle[5]++;
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
        if ((m_segment_cycle[2] == m_update_cycle) && (m_io_cycle[4] > m_update_cycle))
        {
            execute_segment_2();
            ++m_segment_cycle[2];
        }
        if ((m_segment_cycle[3] == m_update_cycle) && (m_io_cycle[3] > m_update_cycle))
        {
            execute_segment_3();
            ++m_segment_cycle[3];
        }
        if ((m_segment_cycle[4] == m_update_cycle) && (m_io_cycle[2] > m_update_cycle))
        {
            execute_segment_4();
            ++m_segment_cycle[4];
        }
        if ((m_segment_cycle[5] == m_update_cycle) && (m_io_cycle[0] > m_update_cycle))
        {
            execute_segment_5();
            ++m_segment_cycle[5];
        }
        if ((m_segment_cycle[6] == m_update_cycle) && (m_io_cycle[1] > m_update_cycle))
        {
            execute_segment_6();
            ++m_segment_cycle[6];
        }
        const bool all_io_ready = (m_io_cycle[0] > m_update_cycle) && (m_io_cycle[1] > m_update_cycle) && (m_io_cycle[2] > m_update_cycle) && (m_io_cycle[3] > m_update_cycle) && (m_io_cycle[4] > m_update_cycle) && (m_io_cycle[5] > m_update_cycle) && (m_io_cycle[6] > m_update_cycle) && (m_io_cycle[7] > m_update_cycle) && (m_io_cycle[8] > m_update_cycle) && (m_io_cycle[9] > m_update_cycle);
        if (all_io_ready && (m_segment_cycle[0] > m_update_cycle) && (m_segment_cycle[1] > m_update_cycle) && (m_segment_cycle[2] > m_update_cycle) && (m_segment_cycle[3] > m_update_cycle) && (m_segment_cycle[4] > m_update_cycle) && (m_segment_cycle[5] > m_update_cycle) && (m_segment_cycle[6] > m_update_cycle))
        {
            execute_segment_update();
            ++m_update_cycle;
        }
    }

    static const size_t GND_GND_Q_0;
    static const size_t SCALEQ_SCALEQ_QOUT_0_5;
    static const size_t SCALEQ_SCALEQ_QOUT_V_5;
    static const size_t SCALEQ_SCALEQ_QOUT_C_5;
    static const size_t SCALEQ_SCALEQ_EOUT_0_5;
    static const size_t IN_1_IMAG_DIN1_TPL_IN_1_IMAG_DIN1_TPL_IN_1_IMAG_DIN1_TPL_6;
    static const size_t IN_1_REAL_DIN1_TPL_IN_1_REAL_DIN1_TPL_IN_1_REAL_DIN1_TPL_7;
    static const size_t IN_2_VIN_TPL_IN_2_VIN_TPL_IN_2_VIN_TPL_8;
    static const size_t IN_3_CIN_TPL_IN_3_CIN_TPL_IN_3_CIN_TPL_9;
    static const size_t IN_4_SIN_TPL_IN_4_SIN_TPL_IN_4_SIN_TPL_10;
    static const size_t IN_5_COS_TPL_IN_5_COS_TPL_IN_5_COS_TPL_11;
    static const size_t VCC_VCC_Q_1;
    static const size_t OUT_3_COUT_TPL_OUT_3_COUT_TPL_15;
    static const size_t OUT_2_VOUT_TPL_OUT_2_VOUT_TPL_14;
    static const size_t OUT_1_REAL_DOUT1_TPL_OUT_1_REAL_DOUT1_TPL_13;
    static const size_t OUT_1_IMAG_DOUT1_TPL_OUT_1_IMAG_DOUT1_TPL_12;
    static const size_t COMPLEXMIXER_COMPLEXMIXER_IOUT_0_2;
    static const size_t COMPLEXMIXER_COMPLEXMIXER_QOUT_0_2;
    static const size_t COMPLEXMIXER_COMPLEXMIXER_OUT_V_2;
    static const size_t COMPLEXMIXER_COMPLEXMIXER_OUT_C_2;
    static const size_t SCALEI_SCALEI_QOUT_0_4;
    static const size_t SCALEI_SCALEI_QOUT_V_4;
    static const size_t SCALEI_SCALEI_QOUT_C_4;
    static const size_t SCALEI_SCALEI_EOUT_0_4;

    int64_t m_io_cycle[10];
    phase_comp_phase_comp_ComplexMixer_ComplexMixer m_phase_comp_phase_comp_ComplexMixer_ComplexMixer_inst0;
    phase_comp_phase_comp_ComplexMixer_Scalei m_phase_comp_phase_comp_ComplexMixer_Scalei_inst0;
    phase_comp_phase_comp_ComplexMixer_Scaleq m_phase_comp_phase_comp_ComplexMixer_Scaleq_inst0;
    int64_t m_segment_cycle[7];
    int64_t m_update_cycle;

#ifdef WRITE_STM_FILES
    csl_output_stimulus_file m_stm_in_1_imag_din1_tpl;
    csl_output_stimulus_file m_stm_in_1_real_din1_tpl;
    csl_output_stimulus_file m_stm_in_2_vin_tpl;
    csl_output_stimulus_file m_stm_in_3_cin_tpl;
    csl_output_stimulus_file m_stm_in_4_sin_tpl;
    csl_output_stimulus_file m_stm_in_5_cos_tpl;
    csl_output_stimulus_file m_stm_out_1_imag_dout1_tpl;
    csl_output_stimulus_file m_stm_out_1_real_dout1_tpl;
    csl_output_stimulus_file m_stm_out_2_vout_tpl;
    csl_output_stimulus_file m_stm_out_3_cout_tpl;
#endif

    int64_t m_n[24];
};

#endif // SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_H_