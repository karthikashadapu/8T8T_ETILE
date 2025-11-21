// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-19 15:28:13
// ------------------------------------------------------------------------- 
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef SOFTWARE_MODEL_DEMO_FFT_FFT_4K_RXGAINCOMP_H_
#define SOFTWARE_MODEL_DEMO_FFT_FFT_4K_RXGAINCOMP_H_

#include "support/csl.h"
#ifdef WRITE_STM_FILES
#include "support/csl_io.h"
#endif

class demo_fft_FFT_4K_RXGainComp
{
public:
    // IO struct for "demo_fft/FFT_4K/RXGainComp/channel_RXG1_in"
    struct io_struct_channel_RXG1_in
    {
        int8_t port_in_1_vin_tpl;
        int8_t port_in_2_chin_tpl;
        int16_t port_in_3_real_din_tpl;
        int16_t port_in_3_imag_din_tpl;
        int16_t port_in_5_size_tpl;
        int16_t port_in_4_nsc_tpl;
        int16_t port_in_6_fft_gain_re_tpl;
        int16_t port_in_7_fft_gain_im_tpl;
        int16_t port_in_8_time_in_tpl;

        io_struct_channel_RXG1_in()
            : port_in_1_vin_tpl(0)
            , port_in_2_chin_tpl(0)
            , port_in_3_real_din_tpl(0)
            , port_in_3_imag_din_tpl(0)
            , port_in_5_size_tpl(0)
            , port_in_4_nsc_tpl(0)
            , port_in_6_fft_gain_re_tpl(0)
            , port_in_7_fft_gain_im_tpl(0)
            , port_in_8_time_in_tpl(0)
        {
        }
    };

    // IO struct for "demo_fft/FFT_4K/RXGainComp/channel_RXG1_out"
    struct io_struct_channel_RXG1_out
    {
        int8_t port_out_1_vout_tpl;
        int8_t port_out_2_chout_tpl;
        int16_t port_out_3_real_dout_tpl;
        int16_t port_out_3_imag_dout_tpl;
        int16_t port_out_5_size_out_tpl;
        int16_t port_out_4_nsc_out_tpl;
        int16_t port_out_6_time_out_tpl;

        io_struct_channel_RXG1_out()
            : port_out_1_vout_tpl(0)
            , port_out_2_chout_tpl(0)
            , port_out_3_real_dout_tpl(0)
            , port_out_3_imag_dout_tpl(0)
            , port_out_5_size_out_tpl(0)
            , port_out_4_nsc_out_tpl(0)
            , port_out_6_time_out_tpl(0)
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
    void read(io_struct_channel_RXG1_out& output)
    {
        bool needsToExecute = (m_io_cycle[1] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[1]++;
            execute();
            m_delay_correction_channel_RXG1_out_port_out_1_vout_tpl.delay(m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_1_VOUT_TPL_21]);
            m_delay_correction_channel_RXG1_out_port_out_2_chout_tpl.delay(m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_2_CHOUT_TPL_21]);
            m_delay_correction_channel_RXG1_out_port_out_3_real_dout_tpl.delay(m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_3_REAL_DOUT_TPL_21]);
            m_delay_correction_channel_RXG1_out_port_out_3_imag_dout_tpl.delay(m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_21]);
            m_delay_correction_channel_RXG1_out_port_out_5_size_out_tpl.delay(m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_5_SIZE_OUT_TPL_21]);
            m_delay_correction_channel_RXG1_out_port_out_4_nsc_out_tpl.delay(m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_4_NSC_OUT_TPL_21]);
            m_delay_correction_channel_RXG1_out_port_out_6_time_out_tpl.delay(m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_6_TIME_OUT_TPL_21]);
        }

#ifndef DISABLE_DELAY_CORRECTON
        csl_memcpy(&output.port_out_1_vout_tpl, &m_delay_correction_channel_RXG1_out_port_out_1_vout_tpl.get(), 1);
        csl_memcpy(&output.port_out_2_chout_tpl, &m_delay_correction_channel_RXG1_out_port_out_2_chout_tpl.get(), 1);
        csl_memcpy(&output.port_out_3_real_dout_tpl, &m_delay_correction_channel_RXG1_out_port_out_3_real_dout_tpl.get(), 2);
        csl_memcpy(&output.port_out_3_imag_dout_tpl, &m_delay_correction_channel_RXG1_out_port_out_3_imag_dout_tpl.get(), 2);
        csl_memcpy(&output.port_out_5_size_out_tpl, &m_delay_correction_channel_RXG1_out_port_out_5_size_out_tpl.get(), 2);
        csl_memcpy(&output.port_out_4_nsc_out_tpl, &m_delay_correction_channel_RXG1_out_port_out_4_nsc_out_tpl.get(), 2);
        csl_memcpy(&output.port_out_6_time_out_tpl, &m_delay_correction_channel_RXG1_out_port_out_6_time_out_tpl.get(), 2);
#else
        csl_memcpy(&output.port_out_1_vout_tpl, &m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_1_VOUT_TPL_21], 1);
        csl_memcpy(&output.port_out_2_chout_tpl, &m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_2_CHOUT_TPL_21], 1);
        csl_memcpy(&output.port_out_3_real_dout_tpl, &m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_3_REAL_DOUT_TPL_21], 2);
        csl_memcpy(&output.port_out_3_imag_dout_tpl, &m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_21], 2);
        csl_memcpy(&output.port_out_5_size_out_tpl, &m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_5_SIZE_OUT_TPL_21], 2);
        csl_memcpy(&output.port_out_4_nsc_out_tpl, &m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_4_NSC_OUT_TPL_21], 2);
        csl_memcpy(&output.port_out_6_time_out_tpl, &m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_6_TIME_OUT_TPL_21], 2);
#endif

#ifdef WRITE_STM_FILES
        if (needsToExecute)
        {
            m_stm_channel_rxg1_out.write_stm_data(output.port_out_1_vout_tpl, 1);
            m_stm_channel_rxg1_out.write_stm_data(output.port_out_2_chout_tpl, 8);
            m_stm_channel_rxg1_out.write_stm_data(output.port_out_3_real_dout_tpl, 16);
            m_stm_channel_rxg1_out.write_stm_data(output.port_out_3_imag_dout_tpl, 16);
            m_stm_channel_rxg1_out.write_stm_data(output.port_out_5_size_out_tpl, 16);
            m_stm_channel_rxg1_out.write_stm_data(output.port_out_4_nsc_out_tpl, 16);
            m_stm_channel_rxg1_out.write_stm_data(output.port_out_6_time_out_tpl, 16);
            m_stm_channel_rxg1_out.next_line();
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
    void write(const io_struct_channel_RXG1_in& input)
    {
        bool needsToExecute = (m_io_cycle[0] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_1_VIN_TPL_20], &input.port_in_1_vin_tpl, 1);
            csl_memcpy(&m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_2_CHIN_TPL_20], &input.port_in_2_chin_tpl, 1);
            csl_memcpy(&m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_3_REAL_DIN_TPL_20], &input.port_in_3_real_din_tpl, 2);
            csl_memcpy(&m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_3_IMAG_DIN_TPL_20], &input.port_in_3_imag_din_tpl, 2);
            csl_memcpy(&m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_5_SIZE_TPL_20], &input.port_in_5_size_tpl, 2);
            csl_memcpy(&m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_4_NSC_TPL_20], &input.port_in_4_nsc_tpl, 2);
            csl_memcpy(&m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_6_FFT_GAIN_RE_TPL_20], &input.port_in_6_fft_gain_re_tpl, 2);
            csl_memcpy(&m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_7_FFT_GAIN_IM_TPL_20], &input.port_in_7_fft_gain_im_tpl, 2);
            csl_memcpy(&m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_8_TIME_IN_TPL_20], &input.port_in_8_time_in_tpl, 2);
#ifdef WRITE_STM_FILES
            m_stm_channel_rxg1_in.write_stm_data(input.port_in_1_vin_tpl, 1);
            m_stm_channel_rxg1_in.write_stm_data(input.port_in_2_chin_tpl, 8);
            m_stm_channel_rxg1_in.write_stm_data(input.port_in_3_real_din_tpl, 16);
            m_stm_channel_rxg1_in.write_stm_data(input.port_in_3_imag_din_tpl, 16);
            m_stm_channel_rxg1_in.write_stm_data(input.port_in_5_size_tpl, 16);
            m_stm_channel_rxg1_in.write_stm_data(input.port_in_4_nsc_tpl, 16);
            m_stm_channel_rxg1_in.write_stm_data(input.port_in_6_fft_gain_re_tpl, 16);
            m_stm_channel_rxg1_in.write_stm_data(input.port_in_7_fft_gain_im_tpl, 16);
            m_stm_channel_rxg1_in.write_stm_data(input.port_in_8_time_in_tpl, 16);
            m_stm_channel_rxg1_in.next_line();
#endif
            m_io_cycle[0]++;
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
        if ((m_segment_cycle[1] == m_update_cycle) && (m_io_cycle[0] > m_update_cycle))
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
    static const size_t SCALE1_REAL_LCMP_X_SCALE1_REAL_LCMP_X_N_10;
    static const size_t SCALE1_REAL_LCONST_X_SCALE1_REAL_LCONST_X_Q_11;
    static const size_t SCALE1_REAL_MUX_X_SCALE1_REAL_MUX_X_Q_12;
    static const size_t SCALE1_REAL_RND_X_SCALE1_REAL_RND_X_Q_13;
    static const size_t MULT_IMAGADD_X_MULT_IMAGADD_X_Q_14;
    static const size_t MULT_IMAGMULT1_X_MULT_IMAGMULT1_X_Q_15;
    static const size_t MULT_IMAGMULT2_X_MULT_IMAGMULT2_X_Q_16;
    static const size_t MULT_REALMULT1_X_MULT_REALMULT1_X_Q_17;
    static const size_t MULT_REALMULT2_X_MULT_REALMULT2_X_Q_18;
    static const size_t MULT_REALSUB_X_MULT_REALSUB_X_Q_19;
    static const size_t VCC_VCC_Q_1;
    static const size_t CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_3_REAL_DIN_TPL_20;
    static const size_t CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_3_IMAG_DIN_TPL_20;
    static const size_t CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_5_SIZE_TPL_20;
    static const size_t CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_4_NSC_TPL_20;
    static const size_t CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_6_FFT_GAIN_RE_TPL_20;
    static const size_t CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_7_FFT_GAIN_IM_TPL_20;
    static const size_t CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_8_TIME_IN_TPL_20;
    static const size_t CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_2_CHIN_TPL_20;
    static const size_t CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_1_VIN_TPL_20;
    static const size_t DUPNAME_0_SCALE1_IMAG_X_DUPNAME_0_SCALE1_IMAG_X_Q_22;
    static const size_t SCALE1_IMAG_HCMP_X_SCALE1_IMAG_HCMP_X_N_2;
    static const size_t DUPNAME_0_SCALE1_REAL_X_DUPNAME_0_SCALE1_REAL_X_Q_23;
    static const size_t DUPNAME_1_SCALE1_IMAG_X_DUPNAME_1_SCALE1_IMAG_X_Q_24;
    static const size_t DUPNAME_1_SCALE1_REAL_X_DUPNAME_1_SCALE1_REAL_X_Q_25;
    static const size_t SCALE1_IMAG_SEL_X_SCALE1_IMAG_SEL_X_B_26;
    static const size_t SCALE1_REAL_SEL_X_SCALE1_REAL_SEL_X_B_27;
    static const size_t MULT_IMAGADD_X_PIPELINE_OUTPUT_TEMP_14;
    static const size_t SCALE1_IMAG_HCMP_X_PIPELINE_OUTPUT_TEMP_2;
    static const size_t SCALE1_IMAG_LCMP_X_PIPELINE_OUTPUT_TEMP_4;
    static const size_t MULT_REALSUB_X_PIPELINE_OUTPUT_TEMP_19;
    static const size_t SCALE1_REAL_HCMP_X_PIPELINE_OUTPUT_TEMP_8;
    static const size_t SCALE1_IMAG_HCONST_X_SCALE1_IMAG_HCONST_X_Q_3;
    static const size_t SCALE1_REAL_LCMP_X_PIPELINE_OUTPUT_TEMP_10;
    static const size_t CHANNEL_RXG1_OUT_CUNROLL_X_OUT_1_VOUT_TPL_21;
    static const size_t CHANNEL_RXG1_OUT_CUNROLL_X_OUT_2_CHOUT_TPL_21;
    static const size_t CHANNEL_RXG1_OUT_CUNROLL_X_OUT_3_REAL_DOUT_TPL_21;
    static const size_t CHANNEL_RXG1_OUT_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_21;
    static const size_t CHANNEL_RXG1_OUT_CUNROLL_X_OUT_5_SIZE_OUT_TPL_21;
    static const size_t CHANNEL_RXG1_OUT_CUNROLL_X_OUT_4_NSC_OUT_TPL_21;
    static const size_t CHANNEL_RXG1_OUT_CUNROLL_X_OUT_6_TIME_OUT_TPL_21;
    static const size_t SCALE1_IMAG_LCMP_X_SCALE1_IMAG_LCMP_X_N_4;
    static const size_t SCALE1_IMAG_LCONST_X_SCALE1_IMAG_LCONST_X_Q_5;
    static const size_t SCALE1_IMAG_MUX_X_SCALE1_IMAG_MUX_X_Q_6;
    static const size_t SCALE1_IMAG_RND_X_SCALE1_IMAG_RND_X_Q_7;
    static const size_t SCALE1_REAL_HCMP_X_SCALE1_REAL_HCMP_X_N_8;
    static const size_t SCALE1_REAL_HCONST_X_SCALE1_REAL_HCONST_X_Q_9;

    csl_delay_correction<int64_t, 5> m_delay_correction_channel_RXG1_out_port_out_1_vout_tpl;
    csl_delay_correction<int64_t, 5> m_delay_correction_channel_RXG1_out_port_out_2_chout_tpl;
    csl_delay_correction<int64_t, 5> m_delay_correction_channel_RXG1_out_port_out_3_imag_dout_tpl;
    csl_delay_correction<int64_t, 5> m_delay_correction_channel_RXG1_out_port_out_3_real_dout_tpl;
    csl_delay_correction<int64_t, 5> m_delay_correction_channel_RXG1_out_port_out_4_nsc_out_tpl;
    csl_delay_correction<int64_t, 5> m_delay_correction_channel_RXG1_out_port_out_5_size_out_tpl;
    csl_delay_correction<int64_t, 5> m_delay_correction_channel_RXG1_out_port_out_6_time_out_tpl;
    int64_t m_io_cycle[2];
    int64_t m_segment_cycle[2];
    int64_t m_update_cycle;

#ifdef WRITE_STM_FILES
    csl_output_stimulus_file m_stm_channel_rxg1_in;
    csl_output_stimulus_file m_stm_channel_rxg1_out;
#endif

    int64_t m_n[48];
};

#endif // SOFTWARE_MODEL_DEMO_FFT_FFT_4K_RXGAINCOMP_H_