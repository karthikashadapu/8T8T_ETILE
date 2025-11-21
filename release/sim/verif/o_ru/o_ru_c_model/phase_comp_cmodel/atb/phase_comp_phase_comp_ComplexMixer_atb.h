// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-14 19:07:02
// ------------------------------------------------------------------------- 
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXERATB_H_
#define SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXERATB_H_

#include "support/csl_io.h"
#include "phase_comp_phase_comp_ComplexMixer.h"

class phase_comp_phase_comp_ComplexMixerATB
{
public:
    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp_ComplexMixer::io_struct_in_1_imag_din1_tpl& valueOut)
    {
        stm.get(valueOut.port_in_1_imag_din1_tpl, 16);
    }

    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp_ComplexMixer::io_struct_in_1_real_din1_tpl& valueOut)
    {
        stm.skip(2);
        stm.get(valueOut.port_in_1_real_din1_tpl, 16);
    }

    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp_ComplexMixer::io_struct_in_2_vin_tpl& valueOut)
    {
        stm.get(valueOut.port_in_2_vin_tpl, 1);
    }

    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp_ComplexMixer::io_struct_in_3_cin_tpl& valueOut)
    {
        stm.skip(1);
        stm.get(valueOut.port_in_3_cin_tpl, 8);
    }

    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp_ComplexMixer::io_struct_in_4_sin_tpl& valueOut)
    {
        stm.get(valueOut.port_in_4_sin_tpl, 18);
    }

    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp_ComplexMixer::io_struct_in_5_cos_tpl& valueOut)
    {
        stm.get(valueOut.port_in_5_cos_tpl, 18);
    }

    bool run()
    {
        bool success = true;
        phase_comp_phase_comp_ComplexMixer* model_instance = new phase_comp_phase_comp_ComplexMixer();
        model_instance->reset();
        csl_info("[phase_comp_phase_comp_ComplexMixer] Opening input stimulus files...");
        csl_stimulus_file io_struct_in_1_imag_din1_tpl_stm_in0("../phase_comp_phase_comp_ComplexMixer_ComplexMixer_qIn.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_in_1_imag_din1_tpl_stm_in0.is_open();
        csl_stimulus_file io_struct_in_1_real_din1_tpl_stm_in1("../phase_comp_phase_comp_ComplexMixer_ComplexMixer_iIn.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_in_1_real_din1_tpl_stm_in1.is_open();
        csl_stimulus_file io_struct_in_2_vin_tpl_stm_in2("../phase_comp_phase_comp_ComplexMixer_ComplexMixer_iIn.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_in_2_vin_tpl_stm_in2.is_open();
        csl_stimulus_file io_struct_in_3_cin_tpl_stm_in3("../phase_comp_phase_comp_ComplexMixer_ComplexMixer_iIn.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_in_3_cin_tpl_stm_in3.is_open();
        csl_stimulus_file io_struct_in_4_sin_tpl_stm_in4("../phase_comp_phase_comp_ComplexMixer_ComplexMixer_sIn.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_in_4_sin_tpl_stm_in4.is_open();
        csl_stimulus_file io_struct_in_5_cos_tpl_stm_in5("../phase_comp_phase_comp_ComplexMixer_ComplexMixer_cIn.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_in_5_cos_tpl_stm_in5.is_open();
        csl_info("[phase_comp_phase_comp_ComplexMixer] Simulating...");
        while(io_struct_in_1_imag_din1_tpl_stm_in0.next_line() && io_struct_in_1_real_din1_tpl_stm_in1.next_line() && io_struct_in_2_vin_tpl_stm_in2.next_line() && io_struct_in_3_cin_tpl_stm_in3.next_line() && io_struct_in_4_sin_tpl_stm_in4.next_line() && io_struct_in_5_cos_tpl_stm_in5.next_line())
        {
            phase_comp_phase_comp_ComplexMixer::io_struct_in_1_imag_din1_tpl io_struct_in_1_imag_din1_tpl0;
            read_from_stm(io_struct_in_1_imag_din1_tpl_stm_in0, io_struct_in_1_imag_din1_tpl0);
            model_instance->write(io_struct_in_1_imag_din1_tpl0);
            phase_comp_phase_comp_ComplexMixer::io_struct_in_1_real_din1_tpl io_struct_in_1_real_din1_tpl0;
            read_from_stm(io_struct_in_1_real_din1_tpl_stm_in1, io_struct_in_1_real_din1_tpl0);
            model_instance->write(io_struct_in_1_real_din1_tpl0);
            phase_comp_phase_comp_ComplexMixer::io_struct_in_2_vin_tpl io_struct_in_2_vin_tpl0;
            read_from_stm(io_struct_in_2_vin_tpl_stm_in2, io_struct_in_2_vin_tpl0);
            io_struct_in_2_vin_tpl_stm_in2.skip(2);
            model_instance->write(io_struct_in_2_vin_tpl0);
            phase_comp_phase_comp_ComplexMixer::io_struct_in_3_cin_tpl io_struct_in_3_cin_tpl0;
            read_from_stm(io_struct_in_3_cin_tpl_stm_in3, io_struct_in_3_cin_tpl0);
            io_struct_in_3_cin_tpl_stm_in3.skip(1);
            model_instance->write(io_struct_in_3_cin_tpl0);
            phase_comp_phase_comp_ComplexMixer::io_struct_in_4_sin_tpl io_struct_in_4_sin_tpl0;
            read_from_stm(io_struct_in_4_sin_tpl_stm_in4, io_struct_in_4_sin_tpl0);
            model_instance->write(io_struct_in_4_sin_tpl0);
            phase_comp_phase_comp_ComplexMixer::io_struct_in_5_cos_tpl io_struct_in_5_cos_tpl0;
            read_from_stm(io_struct_in_5_cos_tpl_stm_in5, io_struct_in_5_cos_tpl0);
            model_instance->write(io_struct_in_5_cos_tpl0);
            phase_comp_phase_comp_ComplexMixer::io_struct_out_1_imag_dout1_tpl io_struct_out_1_imag_dout1_tpl0;
            model_instance->read(io_struct_out_1_imag_dout1_tpl0);
            phase_comp_phase_comp_ComplexMixer::io_struct_out_1_real_dout1_tpl io_struct_out_1_real_dout1_tpl0;
            model_instance->read(io_struct_out_1_real_dout1_tpl0);
            phase_comp_phase_comp_ComplexMixer::io_struct_out_2_vout_tpl io_struct_out_2_vout_tpl0;
            model_instance->read(io_struct_out_2_vout_tpl0);
            phase_comp_phase_comp_ComplexMixer::io_struct_out_3_cout_tpl io_struct_out_3_cout_tpl0;
            model_instance->read(io_struct_out_3_cout_tpl0);
        }
        delete model_instance;
        if (success)
        {
            csl_info("[phase_comp_phase_comp_ComplexMixer] Simulation has completed.");
            return true;
        }
        csl_info("[phase_comp_phase_comp_ComplexMixer] Simulation failure! Stimulus file IO errors occurred.");
        return false;
    }

    bool compare()
    {
        bool success = true;
        success &= csl_compare_stm_files("phase_comp_phase_comp_ComplexMixer_Scaleq_qOut.stm", "../phase_comp_phase_comp_ComplexMixer_Scaleq_qOut.stm");
        success &= csl_compare_stm_files("phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm", "../phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm");
        success &= csl_compare_stm_files("phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm", "../phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm");
        success &= csl_compare_stm_files("phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm", "../phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm");
        if (success)
        {
            csl_info("[phase_comp_phase_comp_ComplexMixer] Success! Software model matches Simulink simulation.");
        }
        else
        {
            csl_info("[phase_comp_phase_comp_ComplexMixer] Failure! Software model does not match Simulink simulation. This may be expected if the software model simulation mode does not match the DSPBA mode.");
        }
        return success;
    }
};

#endif // SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXERATB_H_

