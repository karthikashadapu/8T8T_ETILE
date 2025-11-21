// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-19 18:12:09
// ------------------------------------------------------------------------- 
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_PHASORGENERATEATB_H_
#define SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_PHASORGENERATEATB_H_

#include "support/csl_io.h"
#include "phase_comp_phase_comp_PhasorGenerate.h"

class phase_comp_phase_comp_PhasorGenerateATB
{
public:
    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp_PhasorGenerate::io_struct_ChannelIn& valueOut)
    {
        stm.get(valueOut.port_in_1_v_tpl, 1);
        stm.get(valueOut.port_in_2_c_tpl, 8);
        stm.get(valueOut.port_in_3_real_d1_tpl, 16);
        stm.get(valueOut.port_in_3_imag_d1_tpl, 16);
        stm.get(valueOut.port_in_4_tsym1_tpl, 16);
        stm.get(valueOut.port_in_5_cp_t1_tpl, 16);
        stm.get(valueOut.port_in_6_cp_en1_tpl, 1);
        stm.get(valueOut.port_in_7_fft_size_tpl, 4);
        stm.get(valueOut.port_in_8_cplen_tpl, 11);
        stm.get(valueOut.port_in_9_nsc_tpl);
        stm.get(valueOut.port_in_10_dir_tpl, 1);
    }

    bool run()
    {
        bool success = true;
        phase_comp_phase_comp_PhasorGenerate* model_instance = new phase_comp_phase_comp_PhasorGenerate();
        model_instance->reset();
        csl_info("[phase_comp_phase_comp_PhasorGenerate] Opening input stimulus files...");
        csl_stimulus_file io_struct_ChannelIn_stm_in0("../phase_comp_phase_comp_PhasorGenerate_ChannelIn_cunroll_x.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_ChannelIn_stm_in0.is_open();
        csl_info("[phase_comp_phase_comp_PhasorGenerate] Simulating...");
        while(io_struct_ChannelIn_stm_in0.next_line())
        {
            phase_comp_phase_comp_PhasorGenerate::io_struct_ChannelIn io_struct_ChannelIn0;
            read_from_stm(io_struct_ChannelIn_stm_in0, io_struct_ChannelIn0);
            model_instance->write(io_struct_ChannelIn0);
            phase_comp_phase_comp_PhasorGenerate::io_struct_ChannelOut io_struct_ChannelOut0;
            model_instance->read(io_struct_ChannelOut0);
        }
        delete model_instance;
        if (success)
        {
            csl_info("[phase_comp_phase_comp_PhasorGenerate] Simulation has completed.");
            return true;
        }
        csl_info("[phase_comp_phase_comp_PhasorGenerate] Simulation failure! Stimulus file IO errors occurred.");
        return false;
    }

    bool compare()
    {
        bool success = true;
        success &= csl_compare_stm_files("phase_comp_phase_comp_PhasorGenerate_ChannelOut_cunroll_x.stm", "../phase_comp_phase_comp_PhasorGenerate_ChannelOut_cunroll_x.stm");
        if (success)
        {
            csl_info("[phase_comp_phase_comp_PhasorGenerate] Success! Software model matches Simulink simulation.");
        }
        else
        {
            csl_info("[phase_comp_phase_comp_PhasorGenerate] Failure! Software model does not match Simulink simulation. This may be expected if the software model simulation mode does not match the DSPBA mode.");
        }
        return success;
    }
};

#endif // SOFTWARE_MODEL_PHASE_COMP_PHASE_COMP_PHASORGENERATEATB_H_

