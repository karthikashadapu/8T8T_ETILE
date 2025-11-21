
% *******************************************************************************
% INTEL CONFIDENTIAL
% Copyright 2023 Intel Corporation All Rights Reserved.
%
% The source code contained or described herein and all documents related to the
% source code ("Material") are owned by Intel Corporation or its suppliers or
% licensors. Title to the Material remains with Intel Corporation or its
% suppliers and licensors. The Material may contain trade secrets and proprietary
% and confidential information of Intel Corporation and its suppliers and
% licensors, and is protected by worldwide copyright and trade secret laws and
% treaty provisions. No part of the Material may be used, copied, reproduced,
% modified, published, uploaded, posted, transmitted, distributed, or disclosed
% in any way without Intel's prior express written permission.
% No license under any patent, copyright, trade secret or other intellectual
% property right is granted to or conferred upon you by disclosure or delivery
% of the Materials, either expressly, by implication, inducement, estoppel or
% otherwise. Any license under such intellectual property rights must be
% express and approved by Intel in writing.
%
% Unless otherwise agreed by Intel in writing, you may not remove or alter this
% notice or any other notice embedded in Materials by Intel or Intel's suppliers
% or licensors in any way.
% *******************************************************************************

OUTPUT_BASEPATH = ['..', filesep, '..', filesep, 'testvector',filesep];

INPUT_SIM_PATH=[OUTPUT_BASEPATH,'input',filesep ,'sim',filesep];
mkdir(fullfile(OUTPUT_BASEPATH, 'output', 'b2b_sim'));
OUTPUT_B2B_SIM_PATH= [OUTPUT_BASEPATH 'output',filesep,'b2b_sim',filesep];
duc_coeff=load(['generation_scripts',filesep,'rc_en_DUC_coeffs.mat']);
ddc_coeff=load(['generation_scripts',filesep,'rc_en_DDC_coeffs.mat']);
duc_channel_filter_delay=floor((length(duc_coeff.Coef100.Numerator)-1)/2);
duc_hb1_delay=duc_channel_filter_delay*2 + floor((length(duc_coeff.HB1_coeffs.Numerator)-1)/2);
duc_hb2_delay=duc_hb1_delay*2 + floor((length(duc_coeff.HB2_coeffs.Numerator)-1)/2);
duc_hb3_delay=duc_hb2_delay*2 + floor((length(duc_coeff.HB3_coeffs.Numerator)-1)/2);
ddc_hb3_delay= (duc_hb3_delay + floor((length(ddc_coeff.HB3_coeffs.Numerator)-1)/2))/2;
ddc_hb2_delay= (ddc_hb3_delay + floor((length(ddc_coeff.HB2_coeffs.Numerator)-1)/2))/2;
ddc_hb1_delay= (ddc_hb2_delay + floor((length(ddc_coeff.HB1_coeffs.Numerator)-1)/2))/2;
ddc_channel_filter_delay=ddc_hb1_delay+floor((length(ddc_coeff.Coef100.Numerator)-1)/2);

if(exist("DSPBA_b2b_version"))
    SIM_vectors = 0;
    PRACH=0;
    cc_disable = 0;
    ifft_fft_lpbk=0;

    switch(DSPBA_b2b_tc_number)
        case 1
            run("DSPBA_tc1_100_100.m");
            DSPBA_b2b_tc_name = "DSPBA_tc1_100_100";
            load([INPUT_SIM_PATH ,filesep,'tcs_01',filesep,'ifft_in.mat']);
            if (CC_run==1)
                ifft_in(:,2:2:8)=zeros(length(ifft_in),4);
            end
            save([OUTPUT_BASEPATH ,filesep,'output',filesep,'b2b_sim',filesep,'ifft_in.mat'],"ifft_in");
        case 2
            run("DSPBA_tc2_60_60.m");
            DSPBA_b2b_tc_name = "DSPBA_tc2_60_60";
            load([INPUT_SIM_PATH ,filesep,'tcs_02',filesep,'ifft_in.mat']);
            if (CC_run==1)
                ifft_in(:,2:2:8)=zeros(length(ifft_in),4);
            end
            save([OUTPUT_BASEPATH ,filesep,'output',filesep,'b2b_sim',filesep,'ifft_in.mat'],"ifft_in");
        case 3
            run("DSPBA_tc3_100_60.m");
            DSPBA_b2b_tc_name = "DSPBA_tc3_100_60";
            load([INPUT_SIM_PATH ,filesep,'tcs_03',filesep,'ifft_in.mat']);
            if (CC_run==1)
                ifft_in(:,2:2:8)=zeros(length(ifft_in),4);
            end
            save([OUTPUT_BASEPATH ,filesep,'output',filesep,'b2b_sim',filesep,'ifft_in.mat'],"ifft_in");
        case 4
            run("DSPBA_tc4_100_100_DCSC_PhCmp_en.m");
            DSPBA_b2b_tc_name = "DSPBA_tc4_100_100_DCSC_PhCmp_en";
            load([INPUT_SIM_PATH ,filesep,'tcs_01',filesep,'ifft_in.mat']);
            if (CC_run==1)
                ifft_in(:,2:2:8)=zeros(length(ifft_in),4);
            end
            save([OUTPUT_BASEPATH ,filesep,'output',filesep,'b2b_sim',filesep,'ifft_in.mat'],"ifft_in");
        case 5
            run("DSPBA_tc5_60_60_DCSC_PhCmp_en.m");
            DSPBA_b2b_tc_name = "DSPBA_tc5_60_60_DCSC_PhCmp_en";
            load([INPUT_SIM_PATH ,filesep,'tcs_02',filesep,'ifft_in.mat']);
            if (CC_run==1)
                ifft_in(:,2:2:8)=zeros(length(ifft_in),4);
            end
            save([OUTPUT_BASEPATH ,filesep,'output',filesep,'b2b_sim',filesep,'ifft_in.mat'],"ifft_in");
        case 6
            run("DSPBA_tc6_100_60_DCSC_PhCmp_en.m");
            DSPBA_b2b_tc_name = "DSPBA_tc6_100_60_DCSC_PhCmp_en";

            load([INPUT_SIM_PATH ,filesep,'tcs_03',filesep,'ifft_in.mat']);
            if (CC_run==1)
                ifft_in(:,2:2:8)=zeros(length(ifft_in),4);
            end
            save([OUTPUT_BASEPATH ,filesep,'output',filesep,'b2b_sim',filesep,'ifft_in.mat'],"ifft_in");
        case 7
            run("DSPBA_tc7_100_100_gain_2.m");
            DSPBA_b2b_tc_name = "DSPBA_tc7_100_100_gain_2";
            load([INPUT_SIM_PATH ,filesep,'tcs_01',filesep,'ifft_in.mat']);
            if (CC_run==1)
                ifft_in(:,2:2:8)=zeros(length(ifft_in),4);
            end
            save([OUTPUT_BASEPATH ,filesep,'output',filesep,'b2b_sim',filesep,'ifft_in.mat'],"ifft_in");
        otherwise
            disp("Invalid input to dialog");
    end
    start_loop=1;
    end_loop=1;

else
    SIM_vectors=1;
    fileID = fopen('testcase_load.txt', 'r');
    fgetl(fileID);
    data = textscan(fileID, '%d %s %s %d %d');
    fclose(fileID);
    tc_no=data{1};
    tc_name=data{2};
    pc_name=data{3};
    cc_dis=data{4};
    lpbk_sel=data{5};
    vector_gen=input('Press 1 to generate rtl vectors for all testcase and 0 for specific testcase:');
    if (vector_gen==0)
        testcase=input('Enter the testcase number for vector generation:');
        start_loop=testcase;
        end_loop=testcase;
    elseif (vector_gen ==1)
        start_loop=1;
        end_loop=length(tc_no);
    else
        disp('Enter 1 or 0');
        return;
    end
end


for k=start_loop:end_loop
    if(SIM_vectors)
        testcase_no=tc_no(k);
        testcase_name=char(tc_name(k));
        pcap_name=char(pc_name(k));
        cc_disable=cc_dis(k);
        ifft_fft_lpbk=lpbk_sel(k);
        if(testcase_no==15)
            PRACH=1;
        else
            PRACH=0;
        end

        mkdir(fullfile(OUTPUT_BASEPATH,'output','rtl_sim',testcase_name));
        OUTPUT_RTL_SIM_PATH= [OUTPUT_BASEPATH 'output',filesep,'rtl_sim',filesep, testcase_name];
        OUTPUT_B2B_SIM_PATH= [OUTPUT_BASEPATH 'output',filesep,'b2b_sim',filesep];
        run(sprintf("%s_settings.m",testcase_name));
        if(~ PRACH)
            save([OUTPUT_B2B_SIM_PATH ,filesep,'settings.mat'],'ifft_tb_in_l1','ifft_tb_in_l2','duc_tb_in_l1','duc_tb_in_l2','ca_interp_tb_in_l1','dec_dly_comp_tb_in_l1','ddc_tb_in_l1','ddc_tb_in_l2','fft_tb_in_l1','fft_tb_in_l2');
            ifft_in=importdata([INPUT_SIM_PATH pcap_name ,filesep,'ifft_in.mat']);
        end
        
    end
    addpath('generation_scripts');
    if(~ PRACH)
        if(cc_disable)
            no_of_fft=4;
        else
            no_of_fft=8;
        end
        phase_comp_data_out1=[];
        phase_comp_data_out2=[];
        for i=0:settings.num_axc_per_fft-1
            [ifft_out(:,(i*2)+1),ifft_output(:,(i*2)+1),~,power_meter_ifft_fd_out(:,(i*2)+1)]=ifft_top(ifft_in(:,(i*2)+1),ifft_tb_in_l1,0);
            if(no_of_fft==8)
                [ifft_out(:,(i*2)+2),ifft_output(:,(i*2)+2),~,power_meter_ifft_fd_out(:,(i*2)+2)]=ifft_top(ifft_in(:,(i*2)+2),ifft_tb_in_l2,0);
            end
        end
%%
%%% Power Meter IFFT %%%
        longterm_int_symb_ifft = 112;
        cont_ifft = 0;
        numBins_ifft = 32;% number of Bins in each Histogram
        thresholds_ifft = linspace(0,1,numBins_ifft+1);
        numAxC_ifft = settings.num_axc_per_fft;

        [stat_data_ifft, hist_data_ifft] = power_meter_ss_top(power_meter_ifft_fd_out, numAxC_ifft, longterm_int_symb_ifft,thresholds_ifft,cont_ifft,numBins_ifft, 0);

%%
        save([OUTPUT_B2B_SIM_PATH ,filesep,'ifft_out.mat'],'ifft_out');
        save([OUTPUT_B2B_SIM_PATH ,filesep,'pm_ifft_fd_out.mat'],'power_meter_ifft_fd_out');
        if(~ifft_fft_lpbk)
            for i=0:settings.num_axc_per_fft-1
                    [duc_out(:,(i*2)+1),mixer_out(:,(i*2)+1)]=duc_top(ifft_out(:,(i*2)+1),duc_tb_in_l1,i+1);

                if(no_of_fft==8)
                    [duc_out(:,(i*2)+2),mixer_out(:,(i*2)+2)]=duc_top(ifft_out(:,(i*2)+2),duc_tb_in_l2,i+1);
                end
            end

            save([OUTPUT_B2B_SIM_PATH ,filesep,'duc_out.mat'],'duc_out');
            save([OUTPUT_B2B_SIM_PATH ,filesep,'mixer_out.mat'] ,'mixer_out');
          
            summer_out=[];
            interp_out=[];
            for i=0:settings.num_axc_per_fft-1
                if(no_of_fft==4)
                    mixer_out(:,(i*2)+2)=0;
                    [summer_out(:,i+1),interp_out(:,i+1)]=ca_interp_top(mixer_out(:,(i*2)+1),mixer_out(:,(i*2)+2),ca_interp_tb_in_l1,i+1);
                else
                    [summer_out(:,i+1),interp_out(:,i+1)]=ca_interp_top(mixer_out(:,(i*2)+1),mixer_out(:,(i*2)+2),ca_interp_tb_in_l1,i+1);
                end
            end
            save([OUTPUT_B2B_SIM_PATH ,filesep,'interpolator_out.mat'],'interp_out');
            save([OUTPUT_B2B_SIM_PATH ,filesep,'summer_out.mat'],'summer_out');
            decimator_out=[];
            dec_dly_out1=[];
            dec_dly_out2=[];
            for i=0:settings.num_axc_per_fft-1
                [decimator_out(:,i+1),dec_dly_out1(:,i+1),dec_dly_out2(:,i+1)]=dec_delay_comp_top(interp_out(:,i+1),dec_dly_comp_tb_in_l1,i+1);
            end
            save([OUTPUT_B2B_SIM_PATH ,filesep,'decimator_out.mat'],'decimator_out');
            
            mixer_out_ddc=[];
            ddc_out=[];
            for i=0:settings.num_axc_per_fft-1
                
                    [mixer_out_ddc(:,((i*2)+1)),ddc_out(:,((i*2)+1))]=ddc_top(dec_dly_out1(:,i+1),ddc_tb_in_l1,i+1);
                if(no_of_fft==8)                    
                    [mixer_out_ddc(:,((i*2)+2)),ddc_out(:,((i*2)+2))]=ddc_top(dec_dly_out2(:,i+1),ddc_tb_in_l2,i+1);
                end
            end
            save([OUTPUT_B2B_SIM_PATH ,filesep,'mixer_out_ddc.mat'],'mixer_out_ddc');
            save([OUTPUT_B2B_SIM_PATH ,filesep,'ddc_out.mat'],'ddc_out');
        end
        cp_removal=[];
        fft_out=[]; 
        
        for i=0:settings.num_axc_per_fft-1
            if(~ifft_fft_lpbk)
                [fft_out(:,(i*2)+1),cp_removal(:,(i*2)+1),power_meter_fft_td_out(:,(i*2)+1)]=fft_top(ddc_out(:,((i*2)+1)),fft_tb_in_l1,ddc_channel_filter_delay,settings.delay,0);
                if(no_of_fft==8)
                    [fft_out(:,(i*2)+2),cp_removal(:,(i*2)+2),power_meter_fft_td_out(:,(i*2)+2)]=fft_top(ddc_out(:,((i*2)+2)),fft_tb_in_l2,ddc_channel_filter_delay,settings.delay,0);
                end
            else
                [fft_out(:,(i*2)+1),cp_removal(:,(i*2)+1),power_meter_fft_td_out(:,(i*2)+1)]=fft_top(ifft_out(:,((i*2)+1)),fft_tb_in_l1,0,settings.delay,0);
                if(no_of_fft==8)
                    [fft_out(:,(i*2)+2),cp_removal(:,(i*2)+2),power_meter_fft_td_out(:,(i*2)+2)]=fft_top(ifft_out(:,((i*2)+2)),fft_tb_in_l2,0,settings.delay,0);
                end
            end
        end
%%
%%% Power Meter FFT %%%
        longterm_int_symb_fft = 112;
        cont_fft = 0;
        numBins_fft = 32;% number of Bins in each Histogram
        thresholds_fft = linspace(0,1,numBins_fft+1);
        numAxC_fft = settings.num_axc_per_fft;

        [stat_data_fft, hist_data_fft] = power_meter_ss_top(power_meter_fft_td_out, numAxC_fft, longterm_int_symb_fft,thresholds_fft,cont_fft,numBins_fft, 0);

%%        
        save([OUTPUT_B2B_SIM_PATH ,filesep,'fft_out.mat'],'fft_out');
        save([OUTPUT_B2B_SIM_PATH ,filesep,'pm_fft_td_out.mat'],'power_meter_fft_td_out');
        if(SIM_vectors)
            ifft_top_sim(ifft_in,ifft_out,ifft_output,OUTPUT_RTL_SIM_PATH,no_of_fft,ifft_tb_in_l1,ifft_tb_in_l2);
            if(~ifft_fft_lpbk)
                duc_top_sim(duc_out,mixer_out,summer_out,interp_out,OUTPUT_RTL_SIM_PATH,no_of_fft);
                ddc_top_sim(decimator_out,mixer_out_ddc,ddc_out,OUTPUT_RTL_SIM_PATH,no_of_fft);
            end
            fft_top_sim(fft_out,cp_removal,OUTPUT_RTL_SIM_PATH,no_of_fft,fft_tb_in_l1,fft_tb_in_l2);
        end
    else
        addpath(['generation_scripts',filesep,'long_prach']);
        [long_prach_input,long_prach_output,~,~]=PRACH_lf(prach_lf_in);
        input_filename = [OUTPUT_RTL_SIM_PATH,filesep,'long_prach_input_for_mif.txt'];
        fileID = fopen(input_filename,'w');
        fprintf(fileID,'%lu\n',long_prach_input);

        long_prach_expected = [long_prach_output long_prach_output long_prach_output long_prach_output long_prach_output long_prach_output long_prach_output long_prach_output];
        mkdir(fullfile(OUTPUT_RTL_SIM_PATH,'long_prach_vectors'));
        file_name_prach_l1_out = [OUTPUT_RTL_SIM_PATH,filesep,'long_prach_vectors',filesep,'long_prach_lineup1_expected.csv'];
        id2=fopen(file_name_prach_l1_out,'w');

        file_name_prach_l2_out =[OUTPUT_RTL_SIM_PATH,filesep,'long_prach_vectors',filesep,'long_prach_lineup2_expected.csv'];
        id3=fopen(file_name_prach_l2_out,'w');
        data=[];
        for j=1:4
            data(864*(j-1)+1:864*j,1) = long_prach_expected(1:864,(j*2)-1);
        end
        file_data(1:length(data),1)=string(dec2hex(bitshift(double(typecast(int16(2^8*imag(data(:,1))),'uint16')),16)+double(typecast(int16(2^8*real(data(:,1))),'uint16'))));
        fprintf(id2,'%s\n',file_data);
        fclose(id2);
        clear file_data;
        data=[];
        for j=1:4
            data(864*(j-1)+1:864*j,1) = long_prach_expected(1:864,(j*2));
        end
        file_data(1:length(data),1)=string(dec2hex(bitshift(double(typecast(int16(2^8*imag(data(:,1))),'uint16')),16)+double(typecast(int16(2^8*real(data(:,1))),'uint16'))));
        fprintf(id3,'%s\n',file_data);
        fclose(id3);
        clear file_data;
    end
    if(SIM_vectors==0)
        disp('sim_top.m Executed');
    else
        disp([testcase_name ' Executed']);
    end
end
