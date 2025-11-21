// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-14 19:07:02
// ------------------------------------------------------------------------- 
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_COMPLEXMIXERATB_H_
#define SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_COMPLEXMIXERATB_H_

#include "support/csl_io.h"
#include "phase_comp_phase_comp_ComplexMixer_ComplexMixer.h"

class phase_comp_phase_comp_ComplexMixer_ComplexMixerATB
{
public:
    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_cIn& valueOut)
    {
        stm.get(valueOut.port_0, 18);
    }

    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_iIn& valueOut)
    {
        stm.get(valueOut.port_in_v, 1);
        stm.get(valueOut.port_in_c, 8);
        stm.get(valueOut.port_0, 16);
    }

    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_qIn& valueOut)
    {
        stm.get(valueOut.port_0, 16);
    }

    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_sIn& valueOut)
    {
        stm.get(valueOut.port_0, 18);
    }

    bool run()
    {
        bool success = true;
        phase_comp_phase_comp_ComplexMixer_ComplexMixer* model_instance = new phase_comp_phase_comp_ComplexMixer_ComplexMixer();
        model_instance->reset();
        csl_info("[phase_comp_phase_comp_ComplexMixer_ComplexMixer] Opening input stimulus files...");
        csl_stimulus_file io_struct_cIn_stm_in0("../phase_comp_phase_comp_ComplexMixer_ComplexMixer_cIn.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_cIn_stm_in0.is_open();
        csl_stimulus_file io_struct_iIn_stm_in1("../phase_comp_phase_comp_ComplexMixer_ComplexMixer_iIn.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_iIn_stm_in1.is_open();
        csl_stimulus_file io_struct_qIn_stm_in2("../phase_comp_phase_comp_ComplexMixer_ComplexMixer_qIn.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_qIn_stm_in2.is_open();
        csl_stimulus_file io_struct_sIn_stm_in3("../phase_comp_phase_comp_ComplexMixer_ComplexMixer_sIn.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_sIn_stm_in3.is_open();
        csl_info("[phase_comp_phase_comp_ComplexMixer_ComplexMixer] Simulating...");
        while(io_struct_cIn_stm_in0.next_line() && io_struct_iIn_stm_in1.next_line() && io_struct_qIn_stm_in2.next_line() && io_struct_sIn_stm_in3.next_line())
        {
            phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_cIn io_struct_cIn0;
            read_from_stm(io_struct_cIn_stm_in0, io_struct_cIn0);
            model_instance->write(io_struct_cIn0);
            phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_iIn io_struct_iIn0;
            read_from_stm(io_struct_iIn_stm_in1, io_struct_iIn0);
            model_instance->write(io_struct_iIn0);
            phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_qIn io_struct_qIn0;
            read_from_stm(io_struct_qIn_stm_in2, io_struct_qIn0);
            model_instance->write(io_struct_qIn0);
            phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_sIn io_struct_sIn0;
            read_from_stm(io_struct_sIn_stm_in3, io_struct_sIn0);
            model_instance->write(io_struct_sIn0);
            phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_iOut io_struct_iOut0;
            model_instance->read(io_struct_iOut0);
            phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_qOut io_struct_qOut0;
            model_instance->read(io_struct_qOut0);
        }
        delete model_instance;
        if (success)
        {
            csl_info("[phase_comp_phase_comp_ComplexMixer_ComplexMixer] Simulation has completed.");
            return true;
        }
        csl_info("[phase_comp_phase_comp_ComplexMixer_ComplexMixer] Simulation failure! Stimulus file IO errors occurred.");
        return false;
    }

    bool compare()
    {
        bool success = true;
        success &= csl_compare_stm_files("phase_comp_phase_comp_ComplexMixer_ComplexMixer_iOut.stm", "../phase_comp_phase_comp_ComplexMixer_ComplexMixer_iOut.stm");
        success &= csl_compare_stm_files("phase_comp_phase_comp_ComplexMixer_ComplexMixer_qOut.stm", "../phase_comp_phase_comp_ComplexMixer_ComplexMixer_qOut.stm");
        if (success)
        {
            csl_info("[phase_comp_phase_comp_ComplexMixer_ComplexMixer] Success! Software model matches Simulink simulation.");
        }
        else
        {
            csl_info("[phase_comp_phase_comp_ComplexMixer_ComplexMixer] Failure! Software model does not match Simulink simulation. This may be expected if the software model simulation mode does not match the DSPBA mode.");
        }
        return success;
    }
};

#endif // SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_COMPLEXMIXERATB_H_

