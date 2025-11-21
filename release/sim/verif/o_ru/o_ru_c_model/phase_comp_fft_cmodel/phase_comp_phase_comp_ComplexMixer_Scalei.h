// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-19 18:12:09
// ------------------------------------------------------------------------- 
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_SCALEI_H_
#define SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_SCALEI_H_

#include "support/csl.h"
#ifdef WRITE_STM_FILES
#include "support/csl_io.h"
#endif

class phase_comp_phase_comp_ComplexMixer_Scalei
{
public:
    // IO struct for "qOut"
    struct io_struct_qOut
    {
        int8_t port_v;
        int8_t port_c;
        int16_t port_0;
        int8_t port_eout_0;

        io_struct_qOut()
            : port_v(0)
            , port_c(0)
            , port_0(0)
            , port_eout_0(0)
        {
        }
    };

    // IO struct for "xIn"
    struct io_struct_xIn
    {
        int8_t port_v;
        int8_t port_c;
        int64_t port_0;
        int8_t port_gain_i;

        io_struct_xIn()
            : port_v(0)
            , port_c(0)
            , port_0(0)
            , port_gain_i(0)
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
    void read(io_struct_qOut& output)
    {
        bool needsToExecute = (m_io_cycle[0] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[0]++;
            execute();
        }

        csl_memcpy(&output.port_v, &m_n[QOUT_V_6], 1);
        csl_memcpy(&output.port_c, &m_n[QOUT_C_6], 1);
        csl_memcpy(&output.port_0, &m_n[QOUT_0_6], 2);
        csl_memcpy(&output.port_eout_0, &m_n[QOUT_EOUT_0_6], 1);

#ifdef WRITE_STM_FILES
        if (needsToExecute)
        {
            m_stm_qout.write_stm_data(output.port_v, 1);
            m_stm_qout.write_stm_data(output.port_c, 8);
            m_stm_qout.write_stm_data(output.port_0, 16);
            m_stm_qout.write_stm_data(output.port_eout_0, 1);
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
    void write(const io_struct_xIn& input)
    {
        bool needsToExecute = (m_io_cycle[1] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[XIN_XIN_V_2], &input.port_v, 1);
            csl_memcpy(&m_n[XIN_XIN_C_2], &input.port_c, 1);
            csl_memcpy(&m_n[XIN_XIN_0_2], &input.port_0, 8);
            csl_memcpy(&m_n[XIN_XIN_GAIN_I_2], &input.port_gain_i, 1);
#ifdef WRITE_STM_FILES
            m_stm_xin.write_stm_data(input.port_v, 1);
            m_stm_xin.write_stm_data(input.port_c, 8);
            m_stm_xin.write_stm_data(input.port_0, 35);
            m_stm_xin.write_stm_data(input.port_gain_i, 1);
            m_stm_xin.next_line();
#endif
            m_io_cycle[1]++;
            execute();
        }
    }

private:
    // Segments are chunks of execution that depend on unique sets of inputs
    // These functions are invoked automatically as inputs are provided to the model.
    void execute_segment_0();
    void execute_segment_1();
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
        const bool all_io_ready = (m_io_cycle[0] > m_update_cycle) && (m_io_cycle[1] > m_update_cycle);
        if (all_io_ready && (m_segment_cycle[0] > m_update_cycle) && (m_segment_cycle[1] > m_update_cycle))
        {
            execute_segment_update();
            ++m_update_cycle;
        }
    }

    static const size_t GND_GND_Q_0;
    static const size_t U0_RND_ADD_P2_OF_3_U0_RND_ADD_P2_OF_3_Q_21;
    static const size_t U0_RND_ADD_P3_OF_3_U0_RND_ADD_P3_OF_3_Q_22;
    static const size_t U0_RND_ADD_P1_OF_3_U0_RND_ADD_P1_OF_3_C_20;
    static const size_t U0_RND_ADD_P2_OF_3_U0_RND_ADD_P2_OF_3_C_21;
    static const size_t U0_RND_ADD_P3_OF_3_U0_RND_ADD_P3_OF_3_C_22;
    static const size_t U0_RND_ADD_BITJOIN_FOR_Q_U0_RND_ADD_BITJOIN_FOR_Q_Q_23;
    static const size_t U0_RND_ADD_BITSELECT_FOR_A_TESSEL0_0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL0_0_B_24;
    static const size_t U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_B_U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_B_Q_25;
    static const size_t U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_26;
    static const size_t U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_C_U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_C_Q_27;
    static const size_t VCC_VCC_Q_1;
    static const size_t U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_28;
    static const size_t U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_D_U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_D_Q_29;
    static const size_t U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_B_Q_CONST_U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_B_Q_CONST_Q_64;
    static const size_t U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_C_Q_CONST_U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_C_Q_CONST_Q_75;
    static const size_t REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_Q_78;
    static const size_t REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_Q_79;
    static const size_t REDIST2_U0_RND_ADD_P2_OF_3_Q_1_REDIST2_U0_RND_ADD_P2_OF_3_Q_1_Q_80;
    static const size_t REDIST3_U0_RND_ADD_P1_OF_3_Q_2_REDIST3_U0_RND_ADD_P1_OF_3_Q_2_Q_81;
    static const size_t REDIST4_XIN_V_3_REDIST4_XIN_V_3_Q_82;
    static const size_t REDIST5_XIN_C_3_REDIST5_XIN_C_3_Q_83;
    static const size_t XIN_XIN_0_2;
    static const size_t U0_RND_ADD_P3_OF_3_PIPELINE_STATE_0_22;
    static const size_t U0_RND_ADD_P3_OF_3_PIPELINE_STATE_1_22;
    static const size_t U0_RND_ADD_P3_OF_3_PIPELINE_OUTPUT_TEMP_22;
    static const size_t REDIST2_U0_RND_ADD_P2_OF_3_Q_1_DELAY_OUT_80;
    static const size_t REDIST2_U0_RND_ADD_P2_OF_3_Q_1_DELAY_IDX_80;
    static const size_t REDIST2_U0_RND_ADD_P2_OF_3_Q_1_DELAY_STATE_0_80;
    static const size_t REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_OUT_81;
    static const size_t REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_IDX_81;
    static const size_t REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_STATE_0_81;
    static const size_t REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_STATE_1_81;
    static const size_t XIN_XIN_GAIN_I_2;
    static const size_t REDIST5_XIN_C_3_DELAY_OUT_83;
    static const size_t REDIST5_XIN_C_3_DELAY_IDX_83;
    static const size_t REDIST5_XIN_C_3_DELAY_STATE_0_83;
    static const size_t REDIST5_XIN_C_3_DELAY_STATE_1_83;
    static const size_t REDIST5_XIN_C_3_DELAY_STATE_2_83;
    static const size_t REDIST4_XIN_V_3_DELAY_OUT_82;
    static const size_t REDIST4_XIN_V_3_DELAY_IDX_82;
    static const size_t REDIST4_XIN_V_3_DELAY_STATE_0_82;
    static const size_t REDIST4_XIN_V_3_DELAY_STATE_1_82;
    static const size_t REDIST4_XIN_V_3_DELAY_STATE_2_82;
    static const size_t XIN_XIN_V_2;
    static const size_t QOUT_V_6;
    static const size_t QOUT_C_6;
    static const size_t QOUT_0_6;
    static const size_t QOUT_EOUT_0_6;
    static const size_t U0_RND_ADD_P2_OF_3_PIPELINE_STATE_0_21;
    static const size_t U0_RND_ADD_P2_OF_3_PIPELINE_STATE_1_21;
    static const size_t U0_RND_ADD_P2_OF_3_PIPELINE_OUTPUT_TEMP_21;
    static const size_t REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_OUT_78;
    static const size_t REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_IDX_78;
    static const size_t REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_STATE_0_78;
    static const size_t XIN_XIN_C_2;
    static const size_t REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_STATE_1_78;
    static const size_t U0_RND_ADD_P1_OF_3_PIPELINE_STATE_0_20;
    static const size_t U0_RND_ADD_P1_OF_3_PIPELINE_STATE_1_20;
    static const size_t U0_RND_ADD_P1_OF_3_PIPELINE_OUTPUT_TEMP_20;
    static const size_t REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_DELAY_OUT_79;
    static const size_t REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_DELAY_IDX_79;
    static const size_t REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_DELAY_STATE_0_79;
    static const size_t U0_SHIFTSEL_U0_SHIFTSEL_Q_4;
    static const size_t U0_RND_SHIFT_U0_RND_SHIFT_Q_10;
    static const size_t U0_RND_TRUNC_U0_RND_TRUNC_Q_8;
    static const size_t U0_RND_ADD_P1_OF_3_U0_RND_ADD_P1_OF_3_Q_20;

    int64_t m_io_cycle[2];
    int64_t m_segment_cycle[2];
    int64_t m_update_cycle;

#ifdef WRITE_STM_FILES
    csl_output_stimulus_file m_stm_qout;
    csl_output_stimulus_file m_stm_xin;
#endif

    int64_t m_n[67];
};

#endif // SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_SCALEI_H_