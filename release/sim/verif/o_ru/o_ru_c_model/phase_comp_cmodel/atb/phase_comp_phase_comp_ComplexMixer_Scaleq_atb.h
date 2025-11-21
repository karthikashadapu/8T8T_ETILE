// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-14 19:07:02
// ------------------------------------------------------------------------- 
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_SCALEQATB_H_
#define SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_SCALEQATB_H_

#include "support/csl_io.h"
#include "phase_comp_phase_comp_ComplexMixer_Scaleq.h"

class phase_comp_phase_comp_ComplexMixer_ScaleqATB
{
public:
    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp_ComplexMixer_Scaleq::io_struct_xIn& valueOut)
    {
        stm.get(valueOut.port_v, 1);
        stm.get(valueOut.port_c, 8);
        stm.get(valueOut.port_0, 35);
        stm.get(valueOut.port_gain_i, 1);
    }

    bool run()
    {
        bool success = true;
        phase_comp_phase_comp_ComplexMixer_Scaleq* model_instance = new phase_comp_phase_comp_ComplexMixer_Scaleq();
        model_instance->reset();
        csl_info("[phase_comp_phase_comp_ComplexMixer_Scaleq] Opening input stimulus files...");
        csl_stimulus_file io_struct_xIn_stm_in0("../phase_comp_phase_comp_ComplexMixer_Scaleq_xIn.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_xIn_stm_in0.is_open();
        csl_info("[phase_comp_phase_comp_ComplexMixer_Scaleq] Simulating...");
        while(io_struct_xIn_stm_in0.next_line())
        {
            phase_comp_phase_comp_ComplexMixer_Scaleq::io_struct_xIn io_struct_xIn0;
            read_from_stm(io_struct_xIn_stm_in0, io_struct_xIn0);
            model_instance->write(io_struct_xIn0);
            phase_comp_phase_comp_ComplexMixer_Scaleq::io_struct_qOut io_struct_qOut0;
            model_instance->read(io_struct_qOut0);
        }
        delete model_instance;
        if (success)
        {
            csl_info("[phase_comp_phase_comp_ComplexMixer_Scaleq] Simulation has completed.");
            return true;
        }
        csl_info("[phase_comp_phase_comp_ComplexMixer_Scaleq] Simulation failure! Stimulus file IO errors occurred.");
        return false;
    }

    bool compare()
    {
        bool success = true;
        success &= csl_compare_stm_files("phase_comp_phase_comp_ComplexMixer_Scaleq_qOut.stm", "../phase_comp_phase_comp_ComplexMixer_Scaleq_qOut.stm");
        if (success)
        {
            csl_info("[phase_comp_phase_comp_ComplexMixer_Scaleq] Success! Software model matches Simulink simulation.");
        }
        else
        {
            csl_info("[phase_comp_phase_comp_ComplexMixer_Scaleq] Failure! Software model does not match Simulink simulation. This may be expected if the software model simulation mode does not match the DSPBA mode.");
        }
        return success;
    }
};

#endif // SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_COMPLEXMIXER_SCALEQATB_H_

