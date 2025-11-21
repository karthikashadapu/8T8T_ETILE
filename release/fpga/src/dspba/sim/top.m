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
% Author:      Bhuvnesh Khantwal
% File:        top.m
% Description: top file to load settings and expected vector for dspba 
% and to perform subsystem processing

%% Clear the workspace

clc;
clear           all;
close           all;
warning         ('off','all');
hv_figure_all   = findall(0, 'Type', 'Figure');
delete          (hv_figure_all( arrayfun(@(h) contains(h.Tag, 'Msgbox'), hv_figure_all)))
delete          b2b_1cc_log.txt;
delete          b2b_2cc_log.txt;
bdclose         ("all");

%% Version control

DSPBA_b2b_version = 3.1;
description       = 'Ripple compensation added for 129(DL)+311(UL) taps with testvector size reduced in formatter scripts';

%% Step-1 Input prompt - Selection of testcase, no. of CC, and no. of symbols to run

prompt = {sprintf('Enter testcase number \n1. DSPBA_tc1_100_100 \n2. DSPBA_tc2_60_60 \n3. DSPBA_tc3_100_60 \n4. DSPBA_tc4_100_100_DCSC_PhCmp_en \n5. DSPBA_tc5_60_60_DCSC_PhCmp_en \n6. DSPBA_tc6_100_60_DCSC_PhCmp_en \n7. DSPBA_tc7_100_100_gain_2'),sprintf('CC to run\n 1. 1\n 2. 2'),'Number of Symbols to run (>=4)'};
answer = inputdlg(prompt);
answer = cellfun(@str2num,answer);

DSPBA_b2b_tc_number = answer(1,1);
CC_run              = answer(2,1);
NumSym              = answer(3,1);

func_data_log       (CC_run,DSPBA_b2b_version, description, 1, 1, 'version', 1, 1);
func_data_log       (CC_run, 1, 'NIL', 1, NumSym, 'Symbol select', 1, 1);

%% Step-2 : Run the expected vectors top file, generate each module's expected vectors and settings

run                 ("../../../matlab_scripts/sim_top.m");
display_msgbox      ("Data generation complete!",1);
func_data_log       (CC_run, 1, 'NIL', DSPBA_b2b_tc_name, 1, 'SIM Vectors', 1, 1);
clearvars -except NumSym;

%% Step-3(a) - iFFT
% This loads data from ifft_in.mat file to the input of dspba file , 
% simulates the dspba file and finds out NMSE, saves the output data in
% ./dspba_vectors to be used by next module

if isfile("b2b_1cc_log.txt"); CC_run=1; else; CC_run=2; end

for cc=1:CC_run
    run    ("ifft_input_formatter.m");
    addpath("../mdl/lib");
    cd     ../mdl/low_phy_dl
    open   ("ifft_blocktostream.slx");
    sim    ("ifft_blocktostream.slx");
    cd     ../../sim
    rmpath ("../mdl/low_phy_dl");
    rmpath ("../mdl/lib");

    DLpath_Tap_data_out = double(DLpath_Tap_data_out.Data(DLpath_Tap_dv_out.Data==1));
    save_location       = sprintf("dspba_vectors/ifft/cc%d/ifft_out.mat",cc);
    save                (save_location,"DLpath_Tap_data_out");
    display_msgbox      ("Low-Phy DL",NMSE);
    if                  isfile("b2b_1cc_log.txt"); CC_run=1; else; CC_run=2; end
    func_data_log       (CC_run, 1, 'NIL',1,1,'iFFT', cc, NMSE);
    pause               (5);
    bdclose             ("all");
    close               all;
    clearvars          -except NumSym
end

if isfile("b2b_1cc_log.txt") 
    load                 ("dspba_vectors/ifft/cc1/ifft_out.mat");
    [m,n]                = size(DLpath_Tap_data_out);
    DLpath_Tap_data_out  = complex(zeros(m,n)); 
    save_location        = sprintf("dspba_vectors/ifft/cc2/ifft_out.mat");
    save                 (save_location,"DLpath_Tap_data_out");
end

%% Step-3(b) - CHANNEL_FILTER+DUC
% This loads data generated in previous section to the input of dspba file , 
% simulates the dspba file and finds out NMSE, saves the output data in
% ./dspba_vectors to be used by next module

if isfile("b2b_1cc_log.txt"); CC_run=1; else; CC_run=2; end

for cc=1:CC_run
    run    ("duc_input_formatter.m");
    cd     ../mdl/duc
    open   ("duc_model.mdl");
    sim    ("duc_model.mdl");
    cd     ../../sim
    rmpath ("../mdl/lib");
    rmpath ("../mdl/duc");
    
    save_location   = sprintf("dspba_vectors/duc/cc%d/duc_out.mat",cc);
    save            (save_location,"Mixer_dOut");
    display_msgbox  ("DUC",NMSE);
    if                  isfile("b2b_1cc_log.txt"); CC_run=1; else; CC_run=2; end
    func_data_log   (CC_run, 1, 'NIL',1,1,'DUC', cc, NMSE);
    pause           (5);
    bdclose         ("all");
    close           all;
    clearvars       ;
end

if isfile("b2b_1cc_log.txt") 
    load                 ("dspba_vectors/duc/cc1/duc_out.mat");
    [m,n]                = size(Mixer_dOut);
    Mixer_dOut           = zeros(m, n, 'like', 1j);
    save_location        = sprintf("dspba_vectors/duc/cc2/duc_out.mat");
    save                 (save_location,"Mixer_dOut");
end


%% Step-3(c) - SUMMER+INTERP
% This loads data generated in previous section to the input of dspba file , 
% simulates the dspba file and finds out NMSE, saves the output data in
% ./dspba_vectors to be used by next module

run    ("ca_interp_input_formatter.m");
cd     ../mdl/ca_interp/
open   ("ca_interp.mdl");
sim    ("ca_interp.mdl");
cd     ../../sim
rmpath ("../mdl/lib");
rmpath ("../mdl/ca_interp");

save_location   = sprintf("dspba_vectors/ca_interp/ca_interp_out.mat");
save            (save_location,"PolyPhase0_dOut");
display_msgbox  ("Summer+Interpolator",NMSE);
if isfile("b2b_1cc_log.txt"); CC_run=1; else; CC_run=2; end
func_data_log   (CC_run, 1, 'NIL',1,1,'ca_interp', 1, NMSE);
pause           (5);
bdclose         ("all");
close           all;
clearvars       ;

%% Step-3(d) - DEC-DLY-COMP
% This loads data generated in previous section to the input of dspba file , 
% simulates the dspba file and finds out NMSE, saves the output data in
% ./dspba_vectors to be used by next module

run    ("dec_dly_comp_input_formatter.m");
cd     ../mdl/dec_dly_comp/
open   ("dec_dly_comp.mdl");
sim    ("dec_dly_comp.mdl");
cd     ../../sim
rmpath ("../mdl/lib");
rmpath ("../mdl/dec_dly_comp");

save_location   = sprintf("dspba_vectors/dec_dly_comp/dec_dly_comp_out.mat");
save            (save_location,"decimator_out_dspba1");
display_msgbox  ("Decimator",NMSE);
if isfile("b2b_1cc_log.txt"); CC_run=1; else; CC_run=2; end
func_data_log   (CC_run, 1, 'NIL',1,1,'dec_dly', 1, NMSE);
pause           (5);
bdclose         ("all");
close           all;
clearvars       ;

%% Step-3(e) - DDC
% This loads data generated in previous section to the input of dspba file , 
% simulates the dspba file and finds out NMSE, saves the output data in
% ./dspba_vectors to be used by next module

if isfile("b2b_1cc_log.txt"); CC_run=1; else; CC_run=2; end

for cc=1:CC_run
    run    ("ddc_input_formatter.m");
    cd     ../mdl/ddc/
    open   ("ddc_model.mdl");
    sim    ("ddc_model.mdl");
    cd     ../../sim
    rmpath ("../mdl/lib");
    rmpath ("../mdl/ddc");
    
    save_location   = sprintf("dspba_vectors/ddc/cc%d/ddc_out.mat",cc);
    save            (save_location,"chFiltOut");
    display_msgbox  ("DDC",NMSE);
    if isfile("b2b_1cc_log.txt"); CC_run=1; else; CC_run=2; end
    func_data_log   (CC_run, 1, 'NIL',1,1,'DDC', cc, NMSE);
    pause           (5);
    bdclose         ("all");
    close           all;
    clearvars       ;
end

if isfile("b2b_1cc_log.txt") 
    load                 ("dspba_vectors/ddc/cc1/ddc_out.mat");
    [m,n]                = size(chFiltOut);
    chFiltOut            = complex(zeros(m,n)); 
    save_location        = sprintf("dspba_vectors/ddc/cc2/ddc_out.mat");
    save                 (save_location,"chFiltOut");
end

%% Step-3(f) : FFT 
% This loads data generated in previous section to the input of dspba file , 
% simulates the dspba file and finds out NMSE, saves the output data in
% ./dspba_vectors to be used for constellation plotting

if isfile("b2b_1cc_log.txt"); CC_run=1; else; CC_run=2; end

for cc=1:CC_run
    run    ("fft_input_formatter.m");
    cd     ../mdl/low_phy_ul/
    open   ("streamtoblock_fft.mdl");
    sim    ("streamtoblock_fft.mdl");
    cd     ../../sim
    rmpath ("../mdl/low_phy_ul");
    rmpath ("../mdl/lib");
    
    save_location   = sprintf("dspba_vectors/fft/cc%d/fft_out.mat",cc);
    save            (save_location,"Final_Dout","Final_Dout_V","fft_tb_in");
    display_msgbox  ("Low-Phy UL",NMSE);
    if isfile("b2b_1cc_log.txt"); CC_run=1; else; CC_run=2; end
    func_data_log   (CC_run, 1, 'NIL',1,1,'FFT', cc, NMSE);
    pause           (5);
    bdclose         ("all");
    close           all;
    clearvars       ;
end

if isfile("b2b_1cc_log.txt") 
    load                 ("dspba_vectors/fft/cc1/fft_out.mat");
    [m,n]                = size(Final_Dout.data);
    Final_Dout.data      = complex(zeros(m,n));
    save_location        = sprintf("dspba_vectors/fft/cc2/fft_out.mat");
    save                 (save_location,"Final_Dout");
end

%% Step-4 : Plot constellation of the chain's final ouput 

cc1 = load("dspba_vectors/fft/cc1/fft_out.mat");
cc2 = load("dspba_vectors/fft/cc2/fft_out.mat");
display_constellation(cc1.Final_Dout.data, cc2.Final_Dout.data, cc1.Final_Dout_V.data, cc1.fft_tb_in.nprb_v)

