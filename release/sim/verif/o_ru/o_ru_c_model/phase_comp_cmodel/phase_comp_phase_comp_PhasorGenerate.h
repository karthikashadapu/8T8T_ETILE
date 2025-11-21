// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-14 19:07:02
// ------------------------------------------------------------------------- 
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_PHASORGENERATE_H_
#define SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_PHASORGENERATE_H_

#include "support/csl.h"
#ifdef WRITE_STM_FILES
#include "support/csl_io.h"
#endif

class phase_comp_phase_comp_PhasorGenerate
{
public:
    // IO struct for "phase_comp/phase_comp/PhasorGenerate/ChannelIn"
    struct io_struct_ChannelIn
    {
        int8_t port_in_1_v_tpl;
        int8_t port_in_2_c_tpl;
        int16_t port_in_3_real_d1_tpl;
        int16_t port_in_3_imag_d1_tpl;
        int16_t port_in_4_tsym1_tpl;
        int16_t port_in_5_cp_t1_tpl;
        int8_t port_in_6_cp_en1_tpl;
        int8_t port_in_7_fft_size_tpl;
        int16_t port_in_8_cplen_tpl;
        double port_in_9_nsc_tpl;
        int8_t port_in_10_dir_tpl;

        io_struct_ChannelIn()
            : port_in_1_v_tpl(0)
            , port_in_2_c_tpl(0)
            , port_in_3_real_d1_tpl(0)
            , port_in_3_imag_d1_tpl(0)
            , port_in_4_tsym1_tpl(0)
            , port_in_5_cp_t1_tpl(0)
            , port_in_6_cp_en1_tpl(0)
            , port_in_7_fft_size_tpl(0)
            , port_in_8_cplen_tpl(0)
            , port_in_9_nsc_tpl(0)
            , port_in_10_dir_tpl(0)
        {
        }
    };

    // IO struct for "phase_comp/phase_comp/PhasorGenerate/ChannelOut"
    struct io_struct_ChannelOut
    {
        int8_t port_out_2_vout_tpl;
        int8_t port_out_3_cout_tpl;
        int16_t port_out_1_real_dout1_tpl;
        int16_t port_out_1_imag_dout1_tpl;
        int32_t port_out_4_sin_tpl;
        int32_t port_out_5_cos_tpl;
        int8_t port_out_6_fft_size_out_tpl;
        int16_t port_out_7_cplenout_tpl;
        double port_out_8_nsc_out_tpl;

        io_struct_ChannelOut()
            : port_out_2_vout_tpl(0)
            , port_out_3_cout_tpl(0)
            , port_out_1_real_dout1_tpl(0)
            , port_out_1_imag_dout1_tpl(0)
            , port_out_4_sin_tpl(0)
            , port_out_5_cos_tpl(0)
            , port_out_6_fft_size_out_tpl(0)
            , port_out_7_cplenout_tpl(0)
            , port_out_8_nsc_out_tpl(0)
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
    void read(io_struct_ChannelOut& output)
    {
        bool needsToExecute = (m_io_cycle[1] == m_update_cycle);
        if (needsToExecute)
        {
            m_io_cycle[1]++;
            execute();
        }

        csl_memcpy(&output.port_out_2_vout_tpl, &m_n[CHANNELOUT_CUNROLL_X_OUT_2_VOUT_TPL_34], 1);
        csl_memcpy(&output.port_out_3_cout_tpl, &m_n[CHANNELOUT_CUNROLL_X_OUT_3_COUT_TPL_34], 1);
        csl_memcpy(&output.port_out_1_real_dout1_tpl, &m_n[CHANNELOUT_CUNROLL_X_OUT_1_REAL_DOUT1_TPL_34], 2);
        csl_memcpy(&output.port_out_1_imag_dout1_tpl, &m_n[CHANNELOUT_CUNROLL_X_OUT_1_IMAG_DOUT1_TPL_34], 2);
        csl_memcpy(&output.port_out_4_sin_tpl, &m_n[CHANNELOUT_CUNROLL_X_OUT_4_SIN_TPL_34], 4);
        csl_memcpy(&output.port_out_5_cos_tpl, &m_n[CHANNELOUT_CUNROLL_X_OUT_5_COS_TPL_34], 4);
        csl_memcpy(&output.port_out_6_fft_size_out_tpl, &m_n[CHANNELOUT_CUNROLL_X_OUT_6_FFT_SIZE_OUT_TPL_34], 1);
        csl_memcpy(&output.port_out_7_cplenout_tpl, &m_n[CHANNELOUT_CUNROLL_X_OUT_7_CPLENOUT_TPL_34], 2);
        csl_memcpy(&output.port_out_8_nsc_out_tpl, &m_n[CHANNELOUT_CUNROLL_X_OUT_8_NSC_OUT_TPL_34], 8);

#ifdef WRITE_STM_FILES
        if (needsToExecute)
        {
            m_stm_channelout.write_stm_data(output.port_out_2_vout_tpl, 1);
            m_stm_channelout.write_stm_data(output.port_out_3_cout_tpl, 8);
            m_stm_channelout.write_stm_data(output.port_out_1_real_dout1_tpl, 16);
            m_stm_channelout.write_stm_data(output.port_out_1_imag_dout1_tpl, 16);
            m_stm_channelout.write_stm_data(output.port_out_4_sin_tpl, 18);
            m_stm_channelout.write_stm_data(output.port_out_5_cos_tpl, 18);
            m_stm_channelout.write_stm_data(output.port_out_6_fft_size_out_tpl, 4);
            m_stm_channelout.write_stm_data(output.port_out_7_cplenout_tpl, 11);
            m_stm_channelout.write_stm_data(output.port_out_8_nsc_out_tpl);
            m_stm_channelout.next_line();
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
    void write(const io_struct_ChannelIn& input)
    {
        bool needsToExecute = (m_io_cycle[0] == m_update_cycle);
        if (needsToExecute)
        {
            csl_memcpy(&m_n[CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_1_V_TPL_33], &input.port_in_1_v_tpl, 1);
            csl_memcpy(&m_n[CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_2_C_TPL_33], &input.port_in_2_c_tpl, 1);
            csl_memcpy(&m_n[CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_3_REAL_D1_TPL_33], &input.port_in_3_real_d1_tpl, 2);
            csl_memcpy(&m_n[CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_3_IMAG_D1_TPL_33], &input.port_in_3_imag_d1_tpl, 2);
            csl_memcpy(&m_n[CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_4_TSYM1_TPL_33], &input.port_in_4_tsym1_tpl, 2);
            csl_memcpy(&m_n[CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_5_CP_T1_TPL_33], &input.port_in_5_cp_t1_tpl, 2);
            csl_memcpy(&m_n[CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_6_CP_EN1_TPL_33], &input.port_in_6_cp_en1_tpl, 1);
            csl_memcpy(&m_n[CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_7_FFT_SIZE_TPL_33], &input.port_in_7_fft_size_tpl, 1);
            csl_memcpy(&m_n[CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_8_CPLEN_TPL_33], &input.port_in_8_cplen_tpl, 2);
            csl_memcpy(&m_n[CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_9_NSC_TPL_33], &input.port_in_9_nsc_tpl, 8);
            csl_memcpy(&m_n[CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_10_DIR_TPL_33], &input.port_in_10_dir_tpl, 1);
#ifdef WRITE_STM_FILES
            m_stm_channelin.write_stm_data(input.port_in_1_v_tpl, 1);
            m_stm_channelin.write_stm_data(input.port_in_2_c_tpl, 8);
            m_stm_channelin.write_stm_data(input.port_in_3_real_d1_tpl, 16);
            m_stm_channelin.write_stm_data(input.port_in_3_imag_d1_tpl, 16);
            m_stm_channelin.write_stm_data(input.port_in_4_tsym1_tpl, 16);
            m_stm_channelin.write_stm_data(input.port_in_5_cp_t1_tpl, 16);
            m_stm_channelin.write_stm_data(input.port_in_6_cp_en1_tpl, 1);
            m_stm_channelin.write_stm_data(input.port_in_7_fft_size_tpl, 4);
            m_stm_channelin.write_stm_data(input.port_in_8_cplen_tpl, 11);
            m_stm_channelin.write_stm_data(input.port_in_9_nsc_tpl);
            m_stm_channelin.write_stm_data(input.port_in_10_dir_tpl, 1);
            m_stm_channelin.next_line();
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
    static const size_t CORDIC_CNSTATAN_S2_CORDIC_CNSTATAN_S2_Q_87;
    static const size_t CORDIC_CMPYLTZERO_S2_CORDIC_CMPYLTZERO_S2_Q_88;
    static const size_t CORDIC_CMPPGEZERO_S2_CORDIC_CMPPGEZERO_S2_Q_89;
    static const size_t CORDIC_MUXPY_S2_CORDIC_MUXPY_S2_Q_90;
    static const size_t CORDIC_CMPYGEZERO_S2_CORDIC_CMPYGEZERO_S2_Q_91;
    static const size_t CORDIC_CMPPLTZERO_S2_CORDIC_CMPPLTZERO_S2_Q_92;
    static const size_t CORDIC_MUXYP_S2_CORDIC_MUXYP_S2_Q_93;
    static const size_t CORDIC_SHIFTX_S2_CORDIC_SHIFTX_S2_B_94;
    static const size_t CORDIC_SHIFTY_S2_CORDIC_SHIFTY_S2_B_95;
    static const size_t CORDIC_XOUT_S2_CORDIC_XOUT_S2_Q_96;
    static const size_t CMPGE_PRESHIFT_1_CMPGE_PRESHIFT_1_Q_42;
    static const size_t CORDIC_XOUT_S2_CORDIC_XOUT_S2_C_96;
    static const size_t CORDIC_YOUT_S2_CORDIC_YOUT_S2_Q_97;
    static const size_t CORDIC_YOUT_S2_CORDIC_YOUT_S2_C_97;
    static const size_t CORDIC_POUT_S2_CORDIC_POUT_S2_Q_98;
    static const size_t CORDIC_POUT_S2_CORDIC_POUT_S2_C_98;
    static const size_t CORDIC_CNSTATAN_S3_CORDIC_CNSTATAN_S3_Q_100;
    static const size_t CORDIC_CMPYLTZERO_S3_CORDIC_CMPYLTZERO_S3_Q_101;
    static const size_t CORDIC_CMPPGEZERO_S3_CORDIC_CMPPGEZERO_S3_Q_102;
    static const size_t CORDIC_MUXPY_S3_CORDIC_MUXPY_S3_Q_103;
    static const size_t CORDIC_CMPYGEZERO_S3_CORDIC_CMPYGEZERO_S3_Q_104;
    static const size_t CONST2_CONST2_Q_11;
    static const size_t CORDIC_CMPPLTZERO_S3_CORDIC_CMPPLTZERO_S3_Q_105;
    static const size_t CORDIC_MUXYP_S3_CORDIC_MUXYP_S3_Q_106;
    static const size_t CORDIC_SHIFTX_S3_CORDIC_SHIFTX_S3_B_107;
    static const size_t CORDIC_SHIFTY_S3_CORDIC_SHIFTY_S3_B_108;
    static const size_t CORDIC_XOUT_S3_CORDIC_XOUT_S3_Q_109;
    static const size_t CORDIC_XOUT_S3_CORDIC_XOUT_S3_C_109;
    static const size_t CORDIC_YOUT_S3_CORDIC_YOUT_S3_Q_110;
    static const size_t CORDIC_YOUT_S3_CORDIC_YOUT_S3_C_110;
    static const size_t CORDIC_POUT_S3_CORDIC_POUT_S3_Q_111;
    static const size_t CORDIC_POUT_S3_CORDIC_POUT_S3_C_111;
    static const size_t SUB_PRESHIFT_1_SUB_PRESHIFT_1_Q_43;
    static const size_t CORDIC_CNSTATAN_S4_CORDIC_CNSTATAN_S4_Q_113;
    static const size_t CORDIC_CMPYLTZERO_S4_CORDIC_CMPYLTZERO_S4_Q_114;
    static const size_t CORDIC_CMPPGEZERO_S4_CORDIC_CMPPGEZERO_S4_Q_115;
    static const size_t CORDIC_MUXPY_S4_CORDIC_MUXPY_S4_Q_116;
    static const size_t CORDIC_CMPYGEZERO_S4_CORDIC_CMPYGEZERO_S4_Q_117;
    static const size_t CORDIC_CMPPLTZERO_S4_CORDIC_CMPPLTZERO_S4_Q_118;
    static const size_t CORDIC_MUXYP_S4_CORDIC_MUXYP_S4_Q_119;
    static const size_t CORDIC_SHIFTX_S4_CORDIC_SHIFTX_S4_B_120;
    static const size_t CORDIC_SHIFTY_S4_CORDIC_SHIFTY_S4_B_121;
    static const size_t CORDIC_XOUT_S4_CORDIC_XOUT_S4_Q_122;
    static const size_t CONST3_CONST3_Q_12;
    static const size_t CORDIC_XOUT_S4_CORDIC_XOUT_S4_C_122;
    static const size_t CORDIC_YOUT_S4_CORDIC_YOUT_S4_Q_123;
    static const size_t CORDIC_YOUT_S4_CORDIC_YOUT_S4_C_123;
    static const size_t CORDIC_POUT_S4_CORDIC_POUT_S4_Q_124;
    static const size_t CORDIC_POUT_S4_CORDIC_POUT_S4_C_124;
    static const size_t CORDIC_CNSTATAN_S5_CORDIC_CNSTATAN_S5_Q_126;
    static const size_t CORDIC_CMPYLTZERO_S5_CORDIC_CMPYLTZERO_S5_Q_127;
    static const size_t CORDIC_CMPPGEZERO_S5_CORDIC_CMPPGEZERO_S5_Q_128;
    static const size_t CORDIC_MUXPY_S5_CORDIC_MUXPY_S5_Q_129;
    static const size_t CORDIC_CMPYGEZERO_S5_CORDIC_CMPYGEZERO_S5_Q_130;
    static const size_t CONST4_CONST4_Q_13;
    static const size_t CORDIC_CMPPLTZERO_S5_CORDIC_CMPPLTZERO_S5_Q_131;
    static const size_t CORDIC_MUXYP_S5_CORDIC_MUXYP_S5_Q_132;
    static const size_t CORDIC_SHIFTX_S5_CORDIC_SHIFTX_S5_B_133;
    static const size_t CORDIC_SHIFTY_S5_CORDIC_SHIFTY_S5_B_134;
    static const size_t CORDIC_XOUT_S5_CORDIC_XOUT_S5_Q_135;
    static const size_t CORDIC_XOUT_S5_CORDIC_XOUT_S5_C_135;
    static const size_t CORDIC_YOUT_S5_CORDIC_YOUT_S5_Q_136;
    static const size_t CORDIC_YOUT_S5_CORDIC_YOUT_S5_C_136;
    static const size_t CORDIC_POUT_S5_CORDIC_POUT_S5_Q_137;
    static const size_t CORDIC_POUT_S5_CORDIC_POUT_S5_C_137;
    static const size_t CONST5_CONST5_Q_14;
    static const size_t CORDIC_CNSTATAN_S6_CORDIC_CNSTATAN_S6_Q_139;
    static const size_t CORDIC_CMPYLTZERO_S6_CORDIC_CMPYLTZERO_S6_Q_140;
    static const size_t CORDIC_CMPPGEZERO_S6_CORDIC_CMPPGEZERO_S6_Q_141;
    static const size_t CORDIC_MUXPY_S6_CORDIC_MUXPY_S6_Q_142;
    static const size_t CORDIC_CMPYGEZERO_S6_CORDIC_CMPYGEZERO_S6_Q_143;
    static const size_t CORDIC_CMPPLTZERO_S6_CORDIC_CMPPLTZERO_S6_Q_144;
    static const size_t CORDIC_MUXYP_S6_CORDIC_MUXYP_S6_Q_145;
    static const size_t CORDIC_SHIFTX_S6_CORDIC_SHIFTX_S6_B_146;
    static const size_t CORDIC_SHIFTY_S6_CORDIC_SHIFTY_S6_B_147;
    static const size_t CORDIC_XOUT_S6_CORDIC_XOUT_S6_Q_148;
    static const size_t CONST6_CONST6_Q_15;
    static const size_t CORDIC_XOUT_S6_CORDIC_XOUT_S6_C_148;
    static const size_t CORDIC_YOUT_S6_CORDIC_YOUT_S6_Q_149;
    static const size_t CORDIC_YOUT_S6_CORDIC_YOUT_S6_C_149;
    static const size_t CORDIC_POUT_S6_CORDIC_POUT_S6_Q_150;
    static const size_t CORDIC_POUT_S6_CORDIC_POUT_S6_C_150;
    static const size_t CORDIC_CNSTATAN_S7_CORDIC_CNSTATAN_S7_Q_152;
    static const size_t CORDIC_CMPYLTZERO_S7_CORDIC_CMPYLTZERO_S7_Q_153;
    static const size_t CORDIC_CMPPGEZERO_S7_CORDIC_CMPPGEZERO_S7_Q_154;
    static const size_t CORDIC_MUXPY_S7_CORDIC_MUXPY_S7_Q_155;
    static const size_t CORDIC_CMPYGEZERO_S7_CORDIC_CMPYGEZERO_S7_Q_156;
    static const size_t CONST7_CONST7_Q_16;
    static const size_t CORDIC_CMPPLTZERO_S7_CORDIC_CMPPLTZERO_S7_Q_157;
    static const size_t CORDIC_MUXYP_S7_CORDIC_MUXYP_S7_Q_158;
    static const size_t CORDIC_SHIFTX_S7_CORDIC_SHIFTX_S7_B_159;
    static const size_t CORDIC_SHIFTY_S7_CORDIC_SHIFTY_S7_B_160;
    static const size_t CORDIC_XOUT_S7_CORDIC_XOUT_S7_Q_161;
    static const size_t CORDIC_XOUT_S7_CORDIC_XOUT_S7_C_161;
    static const size_t CORDIC_YOUT_S7_CORDIC_YOUT_S7_Q_162;
    static const size_t CORDIC_YOUT_S7_CORDIC_YOUT_S7_C_162;
    static const size_t CORDIC_POUT_S7_CORDIC_POUT_S7_Q_163;
    static const size_t CORDIC_POUT_S7_CORDIC_POUT_S7_C_163;
    static const size_t MUX1_PRESHIFT_0_MUX1_PRESHIFT_0_Q_44;
    static const size_t CORDIC_CNSTATAN_S8_CORDIC_CNSTATAN_S8_Q_165;
    static const size_t CORDIC_CMPYLTZERO_S8_CORDIC_CMPYLTZERO_S8_Q_166;
    static const size_t CORDIC_CMPPGEZERO_S8_CORDIC_CMPPGEZERO_S8_Q_167;
    static const size_t CORDIC_MUXPY_S8_CORDIC_MUXPY_S8_Q_168;
    static const size_t CORDIC_CMPYGEZERO_S8_CORDIC_CMPYGEZERO_S8_Q_169;
    static const size_t CORDIC_CMPPLTZERO_S8_CORDIC_CMPPLTZERO_S8_Q_170;
    static const size_t CORDIC_MUXYP_S8_CORDIC_MUXYP_S8_Q_171;
    static const size_t CORDIC_SHIFTX_S8_CORDIC_SHIFTX_S8_B_172;
    static const size_t CORDIC_SHIFTY_S8_CORDIC_SHIFTY_S8_B_173;
    static const size_t CORDIC_XOUT_S8_CORDIC_XOUT_S8_Q_174;
    static const size_t CONST8_CONST8_Q_17;
    static const size_t VCC_VCC_Q_1;
    static const size_t CORDIC_XOUT_S8_CORDIC_XOUT_S8_C_174;
    static const size_t CORDIC_YOUT_S8_CORDIC_YOUT_S8_Q_175;
    static const size_t CORDIC_YOUT_S8_CORDIC_YOUT_S8_C_175;
    static const size_t CORDIC_POUT_S8_CORDIC_POUT_S8_Q_176;
    static const size_t CORDIC_POUT_S8_CORDIC_POUT_S8_C_176;
    static const size_t CORDIC_CNSTATAN_S9_CORDIC_CNSTATAN_S9_Q_178;
    static const size_t CORDIC_CMPYLTZERO_S9_CORDIC_CMPYLTZERO_S9_Q_179;
    static const size_t CORDIC_CMPPGEZERO_S9_CORDIC_CMPPGEZERO_S9_Q_180;
    static const size_t CORDIC_MUXPY_S9_CORDIC_MUXPY_S9_Q_181;
    static const size_t CORDIC_CMPYGEZERO_S9_CORDIC_CMPYGEZERO_S9_Q_182;
    static const size_t CONST9_CONST9_Q_18;
    static const size_t CORDIC_CMPPLTZERO_S9_CORDIC_CMPPLTZERO_S9_Q_183;
    static const size_t CORDIC_MUXYP_S9_CORDIC_MUXYP_S9_Q_184;
    static const size_t CORDIC_SHIFTX_S9_CORDIC_SHIFTX_S9_B_185;
    static const size_t CORDIC_SHIFTY_S9_CORDIC_SHIFTY_S9_B_186;
    static const size_t CORDIC_XOUT_S9_CORDIC_XOUT_S9_Q_187;
    static const size_t CORDIC_XOUT_S9_CORDIC_XOUT_S9_C_187;
    static const size_t CORDIC_YOUT_S9_CORDIC_YOUT_S9_Q_188;
    static const size_t CORDIC_YOUT_S9_CORDIC_YOUT_S9_C_188;
    static const size_t CORDIC_POUT_S9_CORDIC_POUT_S9_Q_189;
    static const size_t CORDIC_POUT_S9_CORDIC_POUT_S9_C_189;
    static const size_t CONVERT1_RND_CONVERT1_RND_Q_19;
    static const size_t CORDIC_CNSTATAN_S10_CORDIC_CNSTATAN_S10_Q_191;
    static const size_t CORDIC_CMPYLTZERO_S10_CORDIC_CMPYLTZERO_S10_Q_192;
    static const size_t CORDIC_CMPPGEZERO_S10_CORDIC_CMPPGEZERO_S10_Q_193;
    static const size_t CORDIC_MUXPY_S10_CORDIC_MUXPY_S10_Q_194;
    static const size_t CORDIC_CMPYGEZERO_S10_CORDIC_CMPYGEZERO_S10_Q_195;
    static const size_t CORDIC_CMPPLTZERO_S10_CORDIC_CMPPLTZERO_S10_Q_196;
    static const size_t CORDIC_MUXYP_S10_CORDIC_MUXYP_S10_Q_197;
    static const size_t CORDIC_SHIFTX_S10_CORDIC_SHIFTX_S10_B_198;
    static const size_t CORDIC_SHIFTY_S10_CORDIC_SHIFTY_S10_B_199;
    static const size_t CORDIC_XOUT_S10_CORDIC_XOUT_S10_Q_200;
    static const size_t CONVERT3_RND_CONVERT3_RND_Q_20;
    static const size_t CORDIC_XOUT_S10_CORDIC_XOUT_S10_C_200;
    static const size_t CORDIC_YOUT_S10_CORDIC_YOUT_S10_Q_201;
    static const size_t CORDIC_YOUT_S10_CORDIC_YOUT_S10_C_201;
    static const size_t CORDIC_POUT_S10_CORDIC_POUT_S10_Q_202;
    static const size_t CORDIC_POUT_S10_CORDIC_POUT_S10_C_202;
    static const size_t CORDIC_CNSTATAN_S11_CORDIC_CNSTATAN_S11_Q_204;
    static const size_t CORDIC_CMPYLTZERO_S11_CORDIC_CMPYLTZERO_S11_Q_205;
    static const size_t CORDIC_CMPPGEZERO_S11_CORDIC_CMPPGEZERO_S11_Q_206;
    static const size_t CORDIC_MUXPY_S11_CORDIC_MUXPY_S11_Q_207;
    static const size_t CORDIC_CMPYGEZERO_S11_CORDIC_CMPYGEZERO_S11_Q_208;
    static const size_t CONVERT5_RND_CONVERT5_RND_Q_21;
    static const size_t CORDIC_CMPPLTZERO_S11_CORDIC_CMPPLTZERO_S11_Q_209;
    static const size_t CORDIC_MUXYP_S11_CORDIC_MUXYP_S11_Q_210;
    static const size_t CORDIC_SHIFTX_S11_CORDIC_SHIFTX_S11_B_211;
    static const size_t CORDIC_SHIFTY_S11_CORDIC_SHIFTY_S11_B_212;
    static const size_t CORDIC_XOUT_S11_CORDIC_XOUT_S11_Q_213;
    static const size_t CORDIC_XOUT_S11_CORDIC_XOUT_S11_C_213;
    static const size_t CORDIC_YOUT_S11_CORDIC_YOUT_S11_Q_214;
    static const size_t CORDIC_YOUT_S11_CORDIC_YOUT_S11_C_214;
    static const size_t CORDIC_POUT_S11_CORDIC_POUT_S11_Q_215;
    static const size_t CORDIC_POUT_S11_CORDIC_POUT_S11_C_215;
    static const size_t LUT1_LUT1_Q_22;
    static const size_t CORDIC_CNSTATAN_S12_CORDIC_CNSTATAN_S12_Q_217;
    static const size_t CORDIC_CMPYLTZERO_S12_CORDIC_CMPYLTZERO_S12_Q_218;
    static const size_t CORDIC_CMPPGEZERO_S12_CORDIC_CMPPGEZERO_S12_Q_219;
    static const size_t CORDIC_MUXPY_S12_CORDIC_MUXPY_S12_Q_220;
    static const size_t CORDIC_CMPYGEZERO_S12_CORDIC_CMPYGEZERO_S12_Q_221;
    static const size_t CORDIC_CMPPLTZERO_S12_CORDIC_CMPPLTZERO_S12_Q_222;
    static const size_t CORDIC_MUXYP_S12_CORDIC_MUXYP_S12_Q_223;
    static const size_t CORDIC_SHIFTX_S12_CORDIC_SHIFTX_S12_B_224;
    static const size_t CORDIC_SHIFTY_S12_CORDIC_SHIFTY_S12_B_225;
    static const size_t CORDIC_XOUT_S12_CORDIC_XOUT_S12_Q_226;
    static const size_t LUT1_POSTCAST_PRIMWIREOUT_RND_LUT1_POSTCAST_PRIMWIREOUT_RND_Q_23;
    static const size_t CORDIC_XOUT_S12_CORDIC_XOUT_S12_C_226;
    static const size_t CORDIC_YOUT_S12_CORDIC_YOUT_S12_Q_227;
    static const size_t CORDIC_YOUT_S12_CORDIC_YOUT_S12_C_227;
    static const size_t CORDIC_POUT_S12_CORDIC_POUT_S12_Q_228;
    static const size_t CORDIC_POUT_S12_CORDIC_POUT_S12_C_228;
    static const size_t CORDIC_CNSTATAN_S13_CORDIC_CNSTATAN_S13_Q_230;
    static const size_t CORDIC_CMPYLTZERO_S13_CORDIC_CMPYLTZERO_S13_Q_231;
    static const size_t CORDIC_CMPPGEZERO_S13_CORDIC_CMPPGEZERO_S13_Q_232;
    static const size_t CORDIC_MUXPY_S13_CORDIC_MUXPY_S13_Q_233;
    static const size_t CORDIC_CMPYGEZERO_S13_CORDIC_CMPYGEZERO_S13_Q_234;
    static const size_t MULT_MULT_Q_24;
    static const size_t CORDIC_CMPPLTZERO_S13_CORDIC_CMPPLTZERO_S13_Q_235;
    static const size_t CORDIC_MUXYP_S13_CORDIC_MUXYP_S13_Q_236;
    static const size_t CORDIC_SHIFTX_S13_CORDIC_SHIFTX_S13_B_237;
    static const size_t CORDIC_SHIFTY_S13_CORDIC_SHIFTY_S13_B_238;
    static const size_t CORDIC_XOUT_S13_CORDIC_XOUT_S13_Q_239;
    static const size_t CORDIC_XOUT_S13_CORDIC_XOUT_S13_C_239;
    static const size_t CORDIC_YOUT_S13_CORDIC_YOUT_S13_Q_240;
    static const size_t CORDIC_YOUT_S13_CORDIC_YOUT_S13_C_240;
    static const size_t CORDIC_POUT_S13_CORDIC_POUT_S13_Q_241;
    static const size_t CORDIC_POUT_S13_CORDIC_POUT_S13_C_241;
    static const size_t MULT1_MULT1_Q_25;
    static const size_t CORDIC_CNSTATAN_S14_CORDIC_CNSTATAN_S14_Q_243;
    static const size_t CORDIC_CMPYLTZERO_S14_CORDIC_CMPYLTZERO_S14_Q_244;
    static const size_t CORDIC_CMPPGEZERO_S14_CORDIC_CMPPGEZERO_S14_Q_245;
    static const size_t CORDIC_MUXPY_S14_CORDIC_MUXPY_S14_Q_246;
    static const size_t CORDIC_CMPYGEZERO_S14_CORDIC_CMPYGEZERO_S14_Q_247;
    static const size_t CORDIC_CMPPLTZERO_S14_CORDIC_CMPPLTZERO_S14_Q_248;
    static const size_t CORDIC_MUXYP_S14_CORDIC_MUXYP_S14_Q_249;
    static const size_t CORDIC_SHIFTX_S14_CORDIC_SHIFTX_S14_B_250;
    static const size_t CORDIC_SHIFTY_S14_CORDIC_SHIFTY_S14_B_251;
    static const size_t CORDIC_XOUT_S14_CORDIC_XOUT_S14_Q_252;
    static const size_t MUX_MUX_Q_26;
    static const size_t CORDIC_XOUT_S14_CORDIC_XOUT_S14_C_252;
    static const size_t CORDIC_YOUT_S14_CORDIC_YOUT_S14_Q_253;
    static const size_t CORDIC_YOUT_S14_CORDIC_YOUT_S14_C_253;
    static const size_t CORDIC_POUT_S14_CORDIC_POUT_S14_Q_254;
    static const size_t CORDIC_POUT_S14_CORDIC_POUT_S14_C_254;
    static const size_t CORDIC_CNSTATAN_S15_CORDIC_CNSTATAN_S15_Q_256;
    static const size_t CORDIC_CMPYLTZERO_S15_CORDIC_CMPYLTZERO_S15_Q_257;
    static const size_t CORDIC_CMPPGEZERO_S15_CORDIC_CMPPGEZERO_S15_Q_258;
    static const size_t CORDIC_MUXPY_S15_CORDIC_MUXPY_S15_Q_259;
    static const size_t CORDIC_CMPYGEZERO_S15_CORDIC_CMPYGEZERO_S15_Q_260;
    static const size_t MUX1_MUX1_Q_27;
    static const size_t AND_RSRVD_FIX_AND_RSRVD_FIX_Q_2;
    static const size_t CORDIC_CMPPLTZERO_S15_CORDIC_CMPPLTZERO_S15_Q_261;
    static const size_t CORDIC_MUXYP_S15_CORDIC_MUXYP_S15_Q_262;
    static const size_t CORDIC_SHIFTX_S15_CORDIC_SHIFTX_S15_B_263;
    static const size_t CORDIC_SHIFTY_S15_CORDIC_SHIFTY_S15_B_264;
    static const size_t CORDIC_XOUT_S15_CORDIC_XOUT_S15_Q_265;
    static const size_t CORDIC_XOUT_S15_CORDIC_XOUT_S15_C_265;
    static const size_t CORDIC_YOUT_S15_CORDIC_YOUT_S15_Q_266;
    static const size_t CORDIC_YOUT_S15_CORDIC_YOUT_S15_C_266;
    static const size_t CORDIC_POUT_S15_CORDIC_POUT_S15_Q_267;
    static const size_t CORDIC_POUT_S15_CORDIC_POUT_S15_C_267;
    static const size_t MUX2_MUX2_Q_28;
    static const size_t CORDIC_CMPYLTZERO_S16_CORDIC_CMPYLTZERO_S16_Q_270;
    static const size_t CORDIC_CMPPGEZERO_S16_CORDIC_CMPPGEZERO_S16_Q_271;
    static const size_t CORDIC_MUXPY_S16_CORDIC_MUXPY_S16_Q_272;
    static const size_t CORDIC_CMPYGEZERO_S16_CORDIC_CMPYGEZERO_S16_Q_273;
    static const size_t CORDIC_CMPPLTZERO_S16_CORDIC_CMPPLTZERO_S16_Q_274;
    static const size_t CORDIC_MUXYP_S16_CORDIC_MUXYP_S16_Q_275;
    static const size_t CORDIC_SHIFTX_S16_CORDIC_SHIFTX_S16_B_276;
    static const size_t CORDIC_SHIFTY_S16_CORDIC_SHIFTY_S16_B_277;
    static const size_t CORDIC_XOUT_S16_CORDIC_XOUT_S16_Q_278;
    static const size_t CORDIC_XOUT_S16_CORDIC_XOUT_S16_C_278;
    static const size_t MUX2_POSTCAST_PRIMWIREOUT_RND_MUX2_POSTCAST_PRIMWIREOUT_RND_Q_29;
    static const size_t CORDIC_YOUT_S16_CORDIC_YOUT_S16_Q_279;
    static const size_t CORDIC_YOUT_S16_CORDIC_YOUT_S16_C_279;
    static const size_t CORDIC_CONSTZERO_LAST_CORDIC_CONSTZERO_LAST_Q_281;
    static const size_t CORDIC_ZEROADDSUBX_LAST_CORDIC_ZEROADDSUBX_LAST_Q_284;
    static const size_t CORDIC_ZEROADDSUBX_LAST_CORDIC_ZEROADDSUBX_LAST_C_284;
    static const size_t CORDIC_ZEROADDSUBY_LAST_CORDIC_ZEROADDSUBY_LAST_Q_285;
    static const size_t CORDIC_ZEROADDSUBY_LAST_CORDIC_ZEROADDSUBY_LAST_C_285;
    static const size_t CORDIC_SELXOUT_LAST_CORDIC_SELXOUT_LAST_Q_287;
    static const size_t CORDIC_SELYOUT_LAST_CORDIC_SELYOUT_LAST_Q_288;
    static const size_t CORDIC_XOUT_S16_PIPELINE_OUTPUT_TEMP_278;
    static const size_t NEGATE_NEGATE_Q_30;
    static const size_t CORDIC_YOUT_S15_PIPELINE_OUTPUT_TEMP_266;
    static const size_t CORDIC_YOUT_S14_PIPELINE_OUTPUT_TEMP_253;
    static const size_t CORDIC_YOUT_S13_PIPELINE_OUTPUT_TEMP_240;
    static const size_t CORDIC_YOUT_S12_PIPELINE_OUTPUT_TEMP_227;
    static const size_t CORDIC_YOUT_S11_PIPELINE_OUTPUT_TEMP_214;
    static const size_t CORDIC_YOUT_S10_PIPELINE_OUTPUT_TEMP_201;
    static const size_t CORDIC_YOUT_S9_PIPELINE_OUTPUT_TEMP_188;
    static const size_t CORDIC_YOUT_S8_PIPELINE_OUTPUT_TEMP_175;
    static const size_t CORDIC_YOUT_S7_PIPELINE_OUTPUT_TEMP_162;
    static const size_t CORDIC_YOUT_S6_PIPELINE_OUTPUT_TEMP_149;
    static const size_t NEGATE_POSTCAST_PRIMWIREOUT_RND_NEGATE_POSTCAST_PRIMWIREOUT_RND_Q_31;
    static const size_t CORDIC_YOUT_S5_PIPELINE_OUTPUT_TEMP_136;
    static const size_t CORDIC_YOUT_S4_PIPELINE_OUTPUT_TEMP_123;
    static const size_t CORDIC_YOUT_S3_PIPELINE_OUTPUT_TEMP_110;
    static const size_t CORDIC_YOUT_S2_PIPELINE_OUTPUT_TEMP_97;
    static const size_t CORDIC_YOUT_S1_PIPELINE_OUTPUT_TEMP_84;
    static const size_t CORDIC_YOUT_S0_PIPELINE_OUTPUT_TEMP_71;
    static const size_t SUB_PIPELINE_OUTPUT_TEMP_32;
    static const size_t CMPGE_PIPELINE_OUTPUT_TEMP_7;
    static const size_t CORDIC_PADDSUBPI_00_PIPELINE_OUTPUT_TEMP_57;
    static const size_t CORDIC_CMPNEGPIOV2_00_PIPELINE_OUTPUT_TEMP_55;
    static const size_t SUB_SUB_Q_32;
    static const size_t CORDIC_CMPPIOV2_00_PIPELINE_OUTPUT_TEMP_54;
    static const size_t CORDIC_ZEROADDSUBX_00_PIPELINE_OUTPUT_TEMP_51;
    static const size_t CORDIC_POUT_S0_PIPELINE_OUTPUT_TEMP_72;
    static const size_t CORDIC_XOUT_S0_PIPELINE_OUTPUT_TEMP_70;
    static const size_t CORDIC_POUT_S1_PIPELINE_OUTPUT_TEMP_85;
    static const size_t CORDIC_XOUT_S1_PIPELINE_OUTPUT_TEMP_83;
    static const size_t CORDIC_POUT_S2_PIPELINE_OUTPUT_TEMP_98;
    static const size_t CORDIC_XOUT_S2_PIPELINE_OUTPUT_TEMP_96;
    static const size_t CORDIC_POUT_S3_PIPELINE_OUTPUT_TEMP_111;
    static const size_t CORDIC_XOUT_S3_PIPELINE_OUTPUT_TEMP_109;
    static const size_t CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_3_REAL_D1_TPL_33;
    static const size_t CORDIC_POUT_S4_PIPELINE_OUTPUT_TEMP_124;
    static const size_t CORDIC_XOUT_S4_PIPELINE_OUTPUT_TEMP_122;
    static const size_t CORDIC_POUT_S5_PIPELINE_OUTPUT_TEMP_137;
    static const size_t CORDIC_XOUT_S5_PIPELINE_OUTPUT_TEMP_135;
    static const size_t CORDIC_POUT_S6_PIPELINE_OUTPUT_TEMP_150;
    static const size_t CORDIC_XOUT_S6_PIPELINE_OUTPUT_TEMP_148;
    static const size_t CORDIC_POUT_S7_PIPELINE_OUTPUT_TEMP_163;
    static const size_t CORDIC_XOUT_S7_PIPELINE_OUTPUT_TEMP_161;
    static const size_t CORDIC_POUT_S8_PIPELINE_OUTPUT_TEMP_176;
    static const size_t CORDIC_XOUT_S8_PIPELINE_OUTPUT_TEMP_174;
    static const size_t CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_3_IMAG_D1_TPL_33;
    static const size_t CORDIC_POUT_S9_PIPELINE_OUTPUT_TEMP_189;
    static const size_t CORDIC_XOUT_S9_PIPELINE_OUTPUT_TEMP_187;
    static const size_t CORDIC_POUT_S10_PIPELINE_OUTPUT_TEMP_202;
    static const size_t CORDIC_XOUT_S10_PIPELINE_OUTPUT_TEMP_200;
    static const size_t CORDIC_POUT_S11_PIPELINE_OUTPUT_TEMP_215;
    static const size_t CORDIC_XOUT_S11_PIPELINE_OUTPUT_TEMP_213;
    static const size_t CORDIC_POUT_S12_PIPELINE_OUTPUT_TEMP_228;
    static const size_t CORDIC_XOUT_S12_PIPELINE_OUTPUT_TEMP_226;
    static const size_t CORDIC_POUT_S13_PIPELINE_OUTPUT_TEMP_241;
    static const size_t CORDIC_XOUT_S13_PIPELINE_OUTPUT_TEMP_239;
    static const size_t CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_4_TSYM1_TPL_33;
    static const size_t CORDIC_POUT_S14_PIPELINE_OUTPUT_TEMP_254;
    static const size_t CORDIC_XOUT_S14_PIPELINE_OUTPUT_TEMP_252;
    static const size_t CORDIC_POUT_S15_PIPELINE_OUTPUT_TEMP_267;
    static const size_t CORDIC_XOUT_S15_PIPELINE_OUTPUT_TEMP_265;
    static const size_t CORDIC_ZEROADDSUBX_LAST_PIPELINE_OUTPUT_TEMP_284;
    static const size_t NEGATE_PIPELINE_OUTPUT_TEMP_30;
    static const size_t CORDIC_YOUT_S16_PIPELINE_OUTPUT_TEMP_279;
    static const size_t CORDIC_ZEROADDSUBY_LAST_PIPELINE_OUTPUT_TEMP_285;
    static const size_t CHANNELOUT_CUNROLL_X_OUT_2_VOUT_TPL_34;
    static const size_t CHANNELOUT_CUNROLL_X_OUT_3_COUT_TPL_34;
    static const size_t CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_5_CP_T1_TPL_33;
    static const size_t CHANNELOUT_CUNROLL_X_OUT_1_REAL_DOUT1_TPL_34;
    static const size_t CHANNELOUT_CUNROLL_X_OUT_1_IMAG_DOUT1_TPL_34;
    static const size_t CHANNELOUT_CUNROLL_X_OUT_4_SIN_TPL_34;
    static const size_t CHANNELOUT_CUNROLL_X_OUT_5_COS_TPL_34;
    static const size_t CHANNELOUT_CUNROLL_X_OUT_6_FFT_SIZE_OUT_TPL_34;
    static const size_t CHANNELOUT_CUNROLL_X_OUT_7_CPLENOUT_TPL_34;
    static const size_t CHANNELOUT_CUNROLL_X_OUT_8_NSC_OUT_TPL_34;
    static const size_t CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_6_CP_EN1_TPL_33;
    static const size_t BITCOMBINE_BITCOMBINE_Q_3;
    static const size_t CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_7_FFT_SIZE_TPL_33;
    static const size_t CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_8_CPLEN_TPL_33;
    static const size_t CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_9_NSC_TPL_33;
    static const size_t CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_10_DIR_TPL_33;
    static const size_t CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_2_C_TPL_33;
    static const size_t CHANNELIN_CUNROLL_X_CHANNELIN_CUNROLL_X_IN_1_V_TPL_33;
    static const size_t CMPGE_POSTCAST_PRIMWIREOUT_SEL_X_CMPGE_POSTCAST_PRIMWIREOUT_SEL_X_B_35;
    static const size_t CONVERT1_SEL_X_CONVERT1_SEL_X_B_36;
    static const size_t CONVERT3_SEL_X_CONVERT3_SEL_X_B_37;
    static const size_t CONVERT5_SEL_X_CONVERT5_SEL_X_B_38;
    static const size_t BITCOMBINE_POSTCAST_PRIMWIREOUT_BITCOMBINE_POSTCAST_PRIMWIREOUT_B_4;
    static const size_t LUT1_POSTCAST_PRIMWIREOUT_SEL_X_LUT1_POSTCAST_PRIMWIREOUT_SEL_X_B_39;
    static const size_t MUX2_POSTCAST_PRIMWIREOUT_SEL_X_MUX2_POSTCAST_PRIMWIREOUT_SEL_X_B_40;
    static const size_t NEGATE_POSTCAST_PRIMWIREOUT_SEL_X_NEGATE_POSTCAST_PRIMWIREOUT_SEL_X_B_41;
    static const size_t CORDIC_CNSTZERO_0_CORDIC_CNSTZERO_0_Q_45;
    static const size_t CORDIC_CNSTPI_CORDIC_CNSTPI_Q_46;
    static const size_t CORDIC_CNSTPIOV2_CORDIC_CNSTPIOV2_Q_47;
    static const size_t CORDIC_CNSTNEGPIOV2_CORDIC_CNSTNEGPIOV2_Q_48;
    static const size_t CORDIC_XGTEZERO_00_CORDIC_XGTEZERO_00_Q_50;
    static const size_t CORDIC_ZEROADDSUBX_00_CORDIC_ZEROADDSUBX_00_Q_51;
    static const size_t CORDIC_ZEROADDSUBX_00_CORDIC_ZEROADDSUBX_00_C_51;
    static const size_t CHOOSEBITS_CHOOSEBITS_Q_6;
    static const size_t CORDIC_XDATA1_00_CORDIC_XDATA1_00_Q_52;
    static const size_t CORDIC_CMPPIOV2_00_CORDIC_CMPPIOV2_00_C_54;
    static const size_t CORDIC_CMPPIOV2_00_CORDIC_CMPPIOV2_00_Q_54;
    static const size_t CORDIC_CMPNEGPIOV2_00_CORDIC_CMPNEGPIOV2_00_C_55;
    static const size_t CORDIC_CMPNEGPIOV2_00_CORDIC_CMPNEGPIOV2_00_Q_55;
    static const size_t CORDIC_AORB_00_CORDIC_AORB_00_Q_56;
    static const size_t CORDIC_PADDSUBPI_00_CORDIC_PADDSUBPI_00_Q_57;
    static const size_t CORDIC_PADDSUBPI_00_CORDIC_PADDSUBPI_00_C_57;
    static const size_t CORDIC_SELECTP_00_CORDIC_SELECTP_00_Q_58;
    static const size_t CORDIC_P_DATA_00_CORDIC_P_DATA_00_Q_59;
    static const size_t CMPGE_CMPGE_N_7;
    static const size_t CORDIC_CNSTATAN_S0_CORDIC_CNSTATAN_S0_Q_61;
    static const size_t CORDIC_CMPYLTZERO_S0_CORDIC_CMPYLTZERO_S0_Q_62;
    static const size_t CORDIC_CMPPGEZERO_S0_CORDIC_CMPPGEZERO_S0_Q_63;
    static const size_t CORDIC_MUXPY_S0_CORDIC_MUXPY_S0_Q_64;
    static const size_t CORDIC_CMPYGEZERO_S0_CORDIC_CMPYGEZERO_S0_Q_65;
    static const size_t CORDIC_CMPPLTZERO_S0_CORDIC_CMPPLTZERO_S0_Q_66;
    static const size_t CORDIC_MUXYP_S0_CORDIC_MUXYP_S0_Q_67;
    static const size_t CORDIC_SHIFTX_S0_CORDIC_SHIFTX_S0_B_68;
    static const size_t CORDIC_SHIFTY_S0_CORDIC_SHIFTY_S0_B_69;
    static const size_t CORDIC_XOUT_S0_CORDIC_XOUT_S0_Q_70;
    static const size_t CMPGE_POSTCAST_PRIMWIREOUT_RND_CMPGE_POSTCAST_PRIMWIREOUT_RND_Q_8;
    static const size_t CORDIC_XOUT_S0_CORDIC_XOUT_S0_C_70;
    static const size_t CORDIC_YOUT_S0_CORDIC_YOUT_S0_Q_71;
    static const size_t CORDIC_YOUT_S0_CORDIC_YOUT_S0_C_71;
    static const size_t CORDIC_POUT_S0_CORDIC_POUT_S0_Q_72;
    static const size_t CORDIC_POUT_S0_CORDIC_POUT_S0_C_72;
    static const size_t CORDIC_CNSTATAN_S1_CORDIC_CNSTATAN_S1_Q_74;
    static const size_t CORDIC_CMPYLTZERO_S1_CORDIC_CMPYLTZERO_S1_Q_75;
    static const size_t CORDIC_CMPPGEZERO_S1_CORDIC_CMPPGEZERO_S1_Q_76;
    static const size_t CORDIC_MUXPY_S1_CORDIC_MUXPY_S1_Q_77;
    static const size_t CORDIC_CMPYGEZERO_S1_CORDIC_CMPYGEZERO_S1_Q_78;
    static const size_t CONST_RSRVD_FIX_CONST_RSRVD_FIX_Q_9;
    static const size_t CORDIC_CMPPLTZERO_S1_CORDIC_CMPPLTZERO_S1_Q_79;
    static const size_t CORDIC_MUXYP_S1_CORDIC_MUXYP_S1_Q_80;
    static const size_t CORDIC_SHIFTX_S1_CORDIC_SHIFTX_S1_B_81;
    static const size_t CORDIC_SHIFTY_S1_CORDIC_SHIFTY_S1_B_82;
    static const size_t CORDIC_XOUT_S1_CORDIC_XOUT_S1_Q_83;
    static const size_t CORDIC_XOUT_S1_CORDIC_XOUT_S1_C_83;
    static const size_t CORDIC_YOUT_S1_CORDIC_YOUT_S1_Q_84;
    static const size_t CORDIC_YOUT_S1_CORDIC_YOUT_S1_C_84;
    static const size_t CORDIC_POUT_S1_CORDIC_POUT_S1_Q_85;
    static const size_t CORDIC_POUT_S1_CORDIC_POUT_S1_C_85;
    static const size_t CONST1_CONST1_Q_10;

    static const int64_t lut_values_0[1];
    int64_t m_io_cycle[2];
    int64_t m_segment_cycle[2];
    int64_t m_update_cycle;
    static const size_t mux_lookup_0[2];
    static const size_t mux_lookup_10[2];
    static const size_t mux_lookup_11[2];
    static const size_t mux_lookup_12[2];
    static const size_t mux_lookup_13[2];
    static const size_t mux_lookup_14[2];
    static const size_t mux_lookup_15[2];
    static const size_t mux_lookup_16[2];
    static const size_t mux_lookup_17[2];
    static const size_t mux_lookup_18[2];
    static const size_t mux_lookup_19[2];
    static const size_t mux_lookup_1[2];
    static const size_t mux_lookup_20[2];
    static const size_t mux_lookup_21[2];
    static const size_t mux_lookup_22[2];
    static const size_t mux_lookup_23[2];
    static const size_t mux_lookup_24[2];
    static const size_t mux_lookup_25[2];
    static const size_t mux_lookup_26[2];
    static const size_t mux_lookup_27[2];
    static const size_t mux_lookup_28[2];
    static const size_t mux_lookup_29[2];
    static const size_t mux_lookup_2[2];
    static const size_t mux_lookup_30[2];
    static const size_t mux_lookup_31[2];
    static const size_t mux_lookup_32[2];
    static const size_t mux_lookup_33[2];
    static const size_t mux_lookup_34[2];
    static const size_t mux_lookup_35[2];
    static const size_t mux_lookup_36[2];
    static const size_t mux_lookup_37[2];
    static const size_t mux_lookup_38[2];
    static const size_t mux_lookup_39[2];
    static const size_t mux_lookup_3[2];
    static const size_t mux_lookup_40[2];
    static const size_t mux_lookup_41[2];
    static const size_t mux_lookup_4[2];
    static const size_t mux_lookup_5[2];
    static const size_t mux_lookup_6[2];
    static const size_t mux_lookup_7[2];
    static const size_t mux_lookup_8[2];
    static const size_t mux_lookup_9[2];

#ifdef WRITE_STM_FILES
    csl_output_stimulus_file m_stm_channelin;
    csl_output_stimulus_file m_stm_channelout;
#endif

    int64_t m_n[397];
};

#endif // SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_PHASORGENERATE_H_