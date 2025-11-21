// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-14 19:07:02
// ------------------------------------------------------------------------- 
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_COMPLEXMIXER_H_
#define SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_COMPLEXMIXER_H_

#include "support/csl.h"
#ifdef WRITE_STM_FILES
#include "support/csl_io.h"
#endif

class phase_comp_phase_comp_ComplexMixer_ComplexMixer
{
public:
    // IO struct for "cIn"
    struct io_struct_cIn
    {
        int32_t port_0;

        io_struct_cIn()
            : port_0(0)
        {
        }
    };

    // IO struct for "iIn"
    struct io_struct_iIn
    {
        int8_t port_in_v;
        int8_t port_in_c;
        int16_t port_0;

        io_struct_iIn()
            : port_in_v(0)
            , port_in_c(0)
            , port_0(0)
        {
        }
    };

    // IO struct for "iOut"
    struct io_struct_iOut
    {
        int8_t port_out_v;
        int8_t port_out_c;
        int64_t port_0;

        io_struct_iOut()
            : port_out_v(0)
            , port_out_c(0)
            , port_0(0)
        {
        }
    };

    // IO struct for "qIn"
    struct io_struct_qIn
    {
        int16_t port_0;

        io_struct_qIn()
            : port_0(0)
        {
        }
    };

    // IO struct for "qOut"
    struct io_struct_qOut
    {
        int64_t port_0;

        io_struct_qOut()
            : port_0(0)
        {
        }
    };

    // IO struct for "sIn"
    struct io_struct_sIn
    {
        int32_t port_0;

        io_struct_sIn()
            : port_0(0)
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
    void read(io_struct_iOut& output)
    {
        bool needsToExecute = (m_io_cycle[2] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[2]++;
            execute();
        }

        csl_memcpy(&output.port_out_v, &m_n[IOUT_OUT_V_8], 1);
        csl_memcpy(&output.port_out_c, &m_n[IOUT_OUT_C_8], 1);
        csl_memcpy(&output.port_0, &m_n[IOUT_0_8], 8);

#ifdef WRITE_STM_FILES
        if (needsToExecute)
        {
            m_stm_iout.write_stm_data(output.port_out_v, 1);
            m_stm_iout.write_stm_data(output.port_out_c, 8);
            m_stm_iout.write_stm_data(output.port_0, 35);
            m_stm_iout.next_line();
        }
#endif
    }

    void read(io_struct_qOut& output)
    {
        bool needsToExecute = (m_io_cycle[4] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[4]++;
            execute();
        }

        csl_memcpy(&output.port_0, &m_n[QOUT_0_9], 8);

#ifdef WRITE_STM_FILES
        if (needsToExecute)
        {
            m_stm_qout.write_stm_data(output.port_0, 35);
            m_stm_qout.next_line();
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
    void write(const io_struct_cIn& input)
    {
        bool needsToExecute = (m_io_cycle[0] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[CIN_CIN_0_5], &input.port_0, 4);
#ifdef WRITE_STM_FILES
            m_stm_cin.write_stm_data(input.port_0, 18);
            m_stm_cin.next_line();
#endif
            m_io_cycle[0]++;
            execute();
        }
    }

    void write(const io_struct_iIn& input)
    {
        bool needsToExecute = (m_io_cycle[1] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[IIN_IIN_IN_V_2], &input.port_in_v, 1);
            csl_memcpy(&m_n[IIN_IIN_IN_C_2], &input.port_in_c, 1);
            csl_memcpy(&m_n[IIN_IIN_0_2], &input.port_0, 2);
#ifdef WRITE_STM_FILES
            m_stm_iin.write_stm_data(input.port_in_v, 1);
            m_stm_iin.write_stm_data(input.port_in_c, 8);
            m_stm_iin.write_stm_data(input.port_0, 16);
            m_stm_iin.next_line();
#endif
            m_io_cycle[1]++;
            execute();
        }
    }

    void write(const io_struct_qIn& input)
    {
        bool needsToExecute = (m_io_cycle[3] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[QIN_QIN_0_3], &input.port_0, 2);
#ifdef WRITE_STM_FILES
            m_stm_qin.write_stm_data(input.port_0, 16);
            m_stm_qin.next_line();
#endif
            m_io_cycle[3]++;
            execute();
        }
    }

    void write(const io_struct_sIn& input)
    {
        bool needsToExecute = (m_io_cycle[5] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[SIN_SIN_0_4], &input.port_0, 4);
#ifdef WRITE_STM_FILES
            m_stm_sin.write_stm_data(input.port_0, 18);
            m_stm_sin.next_line();
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
        if ((m_segment_cycle[1] == m_update_cycle) && (m_io_cycle[1] > m_update_cycle))
        {
            execute_segment_1();
            ++m_segment_cycle[1];
        }
        if ((m_segment_cycle[2] == m_update_cycle) && (m_io_cycle[0] > m_update_cycle))
        {
            execute_segment_2();
            ++m_segment_cycle[2];
        }
        if ((m_segment_cycle[3] == m_update_cycle) && (m_io_cycle[3] > m_update_cycle))
        {
            execute_segment_3();
            ++m_segment_cycle[3];
        }
        if ((m_segment_cycle[4] == m_update_cycle) && (m_io_cycle[5] > m_update_cycle))
        {
            execute_segment_4();
            ++m_segment_cycle[4];
        }
        const bool all_io_ready = (m_io_cycle[0] > m_update_cycle) && (m_io_cycle[1] > m_update_cycle) && (m_io_cycle[2] > m_update_cycle) && (m_io_cycle[3] > m_update_cycle) && (m_io_cycle[4] > m_update_cycle) && (m_io_cycle[5] > m_update_cycle);
        if (all_io_ready && (m_segment_cycle[0] > m_update_cycle) && (m_segment_cycle[1] > m_update_cycle) && (m_segment_cycle[2] > m_update_cycle) && (m_segment_cycle[3] > m_update_cycle) && (m_segment_cycle[4] > m_update_cycle))
        {
            execute_segment_update();
            ++m_update_cycle;
        }
    }

    static const size_t GND_GND_Q_0;
    static const size_t D_IIN_IN_V_4_D_IIN_IN_V_4_Q_12;
    static const size_t D_IIN_IN_C_4_D_IIN_IN_C_4_Q_13;
    static const size_t U0_AS_MULT_I_CMA_CMA_STATE_0_0_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_SUM_0_0_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_CTRL_ACC_PIPELINE_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_CTRL_SUB_PIPELINE_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_CTRL_NEG_PIPELINE_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_PROD_0_0_0_A_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_PROD_0_0_0_B_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_PROD_0_1_0_A_10;
    static const size_t VCC_VCC_Q_1;
    static const size_t U0_AS_MULT_I_CMA_CMA_PROD_0_1_0_B_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_REG_A_0_0_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_REG_A_0_1_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_REG_B_0_0_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_REG_B_0_1_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_REG_C_0_0_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_REG_C_0_1_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_REG_D_0_0_10;
    static const size_t U0_AS_MULT_I_CMA_CMA_REG_D_0_1_10;
    static const size_t D_IIN_IN_C_4_DELAY_OUT_13;
    static const size_t IIN_IIN_0_2;
    static const size_t D_IIN_IN_C_4_DELAY_IDX_13;
    static const size_t D_IIN_IN_C_4_DELAY_STATE_0_13;
    static const size_t D_IIN_IN_C_4_DELAY_STATE_1_13;
    static const size_t D_IIN_IN_C_4_DELAY_STATE_2_13;
    static const size_t D_IIN_IN_C_4_DELAY_STATE_3_13;
    static const size_t D_IIN_IN_V_4_DELAY_OUT_12;
    static const size_t D_IIN_IN_V_4_DELAY_IDX_12;
    static const size_t D_IIN_IN_V_4_DELAY_STATE_0_12;
    static const size_t D_IIN_IN_V_4_DELAY_STATE_1_12;
    static const size_t D_IIN_IN_V_4_DELAY_STATE_2_12;
    static const size_t QIN_QIN_0_3;
    static const size_t D_IIN_IN_V_4_DELAY_STATE_3_12;
    static const size_t IOUT_OUT_V_8;
    static const size_t IOUT_OUT_C_8;
    static const size_t IOUT_0_8;
    static const size_t U0_AS_MULT_Q_CMA_CMA_STATE_0_0_11;
    static const size_t U0_AS_MULT_Q_CMA_CMA_SUM_0_0_11;
    static const size_t U0_AS_MULT_Q_CMA_CMA_CTRL_ACC_PIPELINE_11;
    static const size_t U0_AS_MULT_Q_CMA_CMA_CTRL_SUB_PIPELINE_11;
    static const size_t U0_AS_MULT_Q_CMA_CMA_CTRL_NEG_PIPELINE_11;
    static const size_t U0_AS_MULT_Q_CMA_CMA_PROD_0_0_0_A_11;
    static const size_t IIN_IIN_IN_V_2;
    static const size_t U0_AS_MULT_Q_CMA_CMA_PROD_0_0_0_B_11;
    static const size_t U0_AS_MULT_Q_CMA_CMA_PROD_0_1_0_A_11;
    static const size_t U0_AS_MULT_Q_CMA_CMA_PROD_0_1_0_B_11;
    static const size_t U0_AS_MULT_Q_CMA_CMA_REG_A_0_0_11;
    static const size_t U0_AS_MULT_Q_CMA_CMA_REG_A_0_1_11;
    static const size_t U0_AS_MULT_Q_CMA_CMA_REG_B_0_0_11;
    static const size_t U0_AS_MULT_Q_CMA_CMA_REG_B_0_1_11;
    static const size_t U0_AS_MULT_Q_CMA_CMA_REG_C_0_0_11;
    static const size_t U0_AS_MULT_Q_CMA_CMA_REG_C_0_1_11;
    static const size_t U0_AS_MULT_Q_CMA_CMA_REG_D_0_0_11;
    static const size_t IIN_IIN_IN_C_2;
    static const size_t U0_AS_MULT_Q_CMA_CMA_REG_D_0_1_11;
    static const size_t QOUT_0_9;
    static const size_t SIN_SIN_0_4;
    static const size_t CIN_CIN_0_5;
    static const size_t U0_AS_MULT_I_CMA_U0_AS_MULT_I_CMA_Q_10;
    static const size_t U0_AS_MULT_Q_CMA_U0_AS_MULT_Q_CMA_Q_11;

    int64_t m_io_cycle[6];
    int64_t m_segment_cycle[5];
    int64_t m_update_cycle;

#ifdef WRITE_STM_FILES
    csl_output_stimulus_file m_stm_cin;
    csl_output_stimulus_file m_stm_iin;
    csl_output_stimulus_file m_stm_iout;
    csl_output_stimulus_file m_stm_qin;
    csl_output_stimulus_file m_stm_qout;
    csl_output_stimulus_file m_stm_sin;
#endif

    int64_t m_n[62];
};

#endif // SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_COMPLEXMIXER_H_