// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-14 19:07:02
// ------------------------------------------------------------------------- 
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef SOFTWARE_MODEL_PHASE_COMP_PHASE_COMPATB_H_
#define SOFTWARE_MODEL_PHASE_COMP_PHASE_COMPATB_H_

#include "support/csl_io.h"
#include "phase_comp_phase_comp.h"

#include "connector.h"

class phase_comp_phase_compATB
{
public:
    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp::io_struct_xc_s& valueOut)
    {
        stm.skip(1);
        stm.get(valueOut.port_xc_s, 8);
    }

    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp::io_struct_xd_s& valueOut)
    {
        stm.skip(11);
        stm.get(valueOut.port_xd_s, 1);
    }

    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp::io_struct_xr_im& valueOut)
    {
        stm.skip(3);
        stm.get(valueOut.port_xr_im, 16);
    }

    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp::io_struct_xr_re& valueOut)
    {
        stm.skip(2);
        stm.get(valueOut.port_xr_re, 16);
    }

    void read_from_stm(csl_stimulus_file& stm, phase_comp_phase_comp::io_struct_xv_s& valueOut)
    {
        stm.get(valueOut.port_xv_s, 1);
    }

    void phase_comp(int dir, data_struct* in, data_struct* out)
    {
        int i;
        phase_comp_phase_comp* model_instance = new phase_comp_phase_comp();
        model_instance->reset();

        phase_comp_phase_comp::io_struct_xc_s io_struct_xc_s0;
        phase_comp_phase_comp::io_struct_xr_im io_struct_xr_im0;
        phase_comp_phase_comp::io_struct_xr_re io_struct_xr_re0;
        phase_comp_phase_comp::io_struct_xv_s io_struct_xv_s0;
        phase_comp_phase_comp::io_struct_xd_s io_struct_xd_s0;

        phase_comp_phase_comp::io_struct_jc_s io_struct_jc_s0;
        phase_comp_phase_comp::io_struct_jr_im io_struct_jr_im0;
        phase_comp_phase_comp::io_struct_jr_re io_struct_jr_re0;
        phase_comp_phase_comp::io_struct_jv_s io_struct_jv_s0;

        csl_memcpy(&io_struct_xd_s0.port_xd_s, &dir, sizeof(int8_t));

        for (i = 0;i < 5000;i++)
        {
            // if (i < 400)
                // printf("in main pc_in_%d: %d - %d, %d\n", i, in[i].valid, in[i].real, in[i].imag);

            csl_memcpy(&io_struct_xv_s0.port_xv_s, &in[i].valid, sizeof(int8_t));
            csl_memcpy(&io_struct_xc_s0.port_xc_s, &in[i].channel, sizeof(int8_t));
            csl_memcpy(&io_struct_xr_re0.port_xr_re, &in[i].real, sizeof(int16_t));
            csl_memcpy(&io_struct_xr_im0.port_xr_im, &in[i].imag, sizeof(int16_t));

            model_instance->write(io_struct_xc_s0);
            model_instance->write(io_struct_xr_im0);
            model_instance->write(io_struct_xr_re0);
            model_instance->write(io_struct_xv_s0);
            model_instance->write(io_struct_xd_s0);

            model_instance->read(io_struct_jc_s0);
            model_instance->read(io_struct_jr_im0);
            model_instance->read(io_struct_jr_re0);
            model_instance->read(io_struct_jv_s0);

            csl_memcpy(&out[i].valid, &io_struct_jv_s0.port_jv_s, sizeof(int8_t));
            csl_memcpy(&out[i].channel, &io_struct_jc_s0.port_jc_s, sizeof(int8_t));
            csl_memcpy(&out[i].real, &io_struct_jr_re0.port_jr_re, sizeof(int16_t));
            csl_memcpy(&out[i].imag, &io_struct_jr_im0.port_jr_im, sizeof(int16_t));

            //printf("in main pc_out_%d: %d - %hu, %hu\n", i, out[i].valid, out[i].real, out[i].imag);
        }
    }
    bool run()
    {
        bool success = true;
        phase_comp_phase_comp* model_instance = new phase_comp_phase_comp();
        model_instance->reset();
        csl_info("[phase_comp_phase_comp] Opening input stimulus files...");
        csl_stimulus_file io_struct_xc_s_stm_in0("../phase_comp_phase_comp_PhasorGenerate_ChannelIn_cunroll_x.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_xc_s_stm_in0.is_open();
        csl_stimulus_file io_struct_xd_s_stm_in1("../phase_comp_phase_comp_PhasorGenerate_ChannelIn_cunroll_x.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_xd_s_stm_in1.is_open();
        csl_stimulus_file io_struct_xr_im_stm_in2("../phase_comp_phase_comp_PhasorGenerate_ChannelIn_cunroll_x.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_xr_im_stm_in2.is_open();
        csl_stimulus_file io_struct_xr_re_stm_in3("../phase_comp_phase_comp_PhasorGenerate_ChannelIn_cunroll_x.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_xr_re_stm_in3.is_open();
        csl_stimulus_file io_struct_xv_s_stm_in4("../phase_comp_phase_comp_PhasorGenerate_ChannelIn_cunroll_x.stm", csl_stimulus_file::SIGNED);
        success &= io_struct_xv_s_stm_in4.is_open();
        csl_info("[phase_comp_phase_comp] Simulating...");
        while(io_struct_xc_s_stm_in0.next_line() && io_struct_xd_s_stm_in1.next_line() && io_struct_xr_im_stm_in2.next_line() && io_struct_xr_re_stm_in3.next_line() && io_struct_xv_s_stm_in4.next_line())
        {
            phase_comp_phase_comp::io_struct_xc_s io_struct_xc_s0;
            read_from_stm(io_struct_xc_s_stm_in0, io_struct_xc_s0);
            io_struct_xc_s_stm_in0.skip(10);
            model_instance->write(io_struct_xc_s0);
            phase_comp_phase_comp::io_struct_xd_s io_struct_xd_s0;
            read_from_stm(io_struct_xd_s_stm_in1, io_struct_xd_s0);
            model_instance->write(io_struct_xd_s0);
            phase_comp_phase_comp::io_struct_xr_im io_struct_xr_im0;
            read_from_stm(io_struct_xr_im_stm_in2, io_struct_xr_im0);
            io_struct_xr_im_stm_in2.skip(8);
            model_instance->write(io_struct_xr_im0);
            phase_comp_phase_comp::io_struct_xr_re io_struct_xr_re0;
            read_from_stm(io_struct_xr_re_stm_in3, io_struct_xr_re0);
            io_struct_xr_re_stm_in3.skip(9);
            model_instance->write(io_struct_xr_re0);
            phase_comp_phase_comp::io_struct_xv_s io_struct_xv_s0;
            read_from_stm(io_struct_xv_s_stm_in4, io_struct_xv_s0);
            io_struct_xv_s_stm_in4.skip(11);
            model_instance->write(io_struct_xv_s0);
            phase_comp_phase_comp::io_struct_jc_s io_struct_jc_s0;
            model_instance->read(io_struct_jc_s0);
            phase_comp_phase_comp::io_struct_jr_im io_struct_jr_im0;
            model_instance->read(io_struct_jr_im0);
            phase_comp_phase_comp::io_struct_jr_re io_struct_jr_re0;
            model_instance->read(io_struct_jr_re0);
            phase_comp_phase_comp::io_struct_jv_s io_struct_jv_s0;
            model_instance->read(io_struct_jv_s0);
        }
        delete model_instance;
        if (success)
        {
            csl_info("[phase_comp_phase_comp] Simulation has completed.");
            return true;
        }
        csl_info("[phase_comp_phase_comp] Simulation failure! Stimulus file IO errors occurred.");
        return false;
    }

    bool compare()
    {
        bool success = true;
        success &= csl_compare_stm_files("phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm", "../phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm");
        success &= csl_compare_stm_files("phase_comp_phase_comp_ComplexMixer_Scaleq_qOut.stm", "../phase_comp_phase_comp_ComplexMixer_Scaleq_qOut.stm");
        success &= csl_compare_stm_files("phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm", "../phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm");
        success &= csl_compare_stm_files("phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm", "../phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm");
        if (success)
        {
            csl_info("[phase_comp_phase_comp] Success! Software model matches Simulink simulation.");
        }
        else
        {
            csl_info("[phase_comp_phase_comp] Failure! Software model does not match Simulink simulation. This may be expected if the software model simulation mode does not match the DSPBA mode.");
        }
        return success;
    }
};

#endif // SOFTWARE_MODEL_PHASE_COMP_PHASE_COMPATB_H_

