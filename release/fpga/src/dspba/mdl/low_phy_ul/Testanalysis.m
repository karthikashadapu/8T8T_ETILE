 close all;
%clear all;
%clc;
% load('dspba_tv_op_tc_9.mat')
%% ULpath  S2B validation 

%  ULPath_ref_dataout_S2B = ifftout_v;
% ULPath_Tap_dataout_S2B= double(mod_dout.Data(mod_dv.Data==1)).';
% L = min(length(ULPath_ref_dataout_S2B),length(ULPath_Tap_dataout_S2B));
% 
% Diff_ULPath = (abs(ULPath_ref_dataout_S2B(1:L)-ULPath_Tap_dataout_S2B(1:L)).^2)./mean(abs(ULPath_ref_dataout_S2B(1:L).^2));
% NMSE_DLPath= 10*log10(sum(Diff_ULPath.^2)/length(Diff_ULPath))
% figure;
% hold on;
% stem(Diff_ULPath,'-r')
% stem(ULPath_ref_dataout_S2B(1:L),'-g')
% stem(ULPath_Tap_dataout_S2B(1:L),'-b')
% title('Data out of FFT + S2B  Block')
% %% UL path FFT op Validation
% ULPath_ref_dataout_FFT = dout_brsc_v;
% ULPath_Tap_dataout_FFT= double(fft_out.Data(fft_out_dv.Data==1)).';
% L = min(length(ULPath_ref_dataout_FFT),length(ULPath_Tap_dataout_FFT));
% 
% Diff_ULPath = (abs(ULPath_ref_dataout_FFT(1:L)-ULPath_Tap_dataout_FFT(1:L)).^2)./mean(abs(ULPath_ref_dataout_FFT(1:L).^2));
% NMSE_DLPath= 10*log10(sum(Diff_ULPath)/length(Diff_ULPath))
% figure;
% hold on;
% %stem(Diff_ULPath,'-r')
% stem(ULPath_ref_dataout_FFT(1:L),'-g')
% stem(ULPath_Tap_dataout_FFT(1:L),'-bx')
% title('Data out of FFT block') 

%% UL path BRSC op Validation


ULPath_ref_dataout_BRSC= fft_tb_exp_out.ipvector_cap;
ULPath_Tap_dataout_BRSC= double(Final_Dout.Data(Final_Dout_V.Data==1)).';
L = min(length(ULPath_ref_dataout_BRSC),length(ULPath_Tap_dataout_BRSC));

Diff_ULPath = (abs(ULPath_ref_dataout_BRSC(1:L)-ULPath_Tap_dataout_BRSC(1:L)).^2)./mean(abs(ULPath_ref_dataout_BRSC(1:L).^2));
%NMSE_DLPath= 10*log10(sum(Diff_ULPath)/length(Diff_ULPath))
figure;
hold on;
stem(Diff_ULPath,'-r')
% stem(ULPath_ref_dataout_BRSC(1:L),'-g')
% stem(ULPath_Tap_dataout_BRSC(1:L),'-b')
title('Data out of brsc block')

figure;
hold on;
%stem(Diff_ULPath,'-r')
stem(ULPath_ref_dataout_BRSC(1:L),'-rx')
stem(ULPath_Tap_dataout_BRSC(1:L),'-b')
title('Data out of brsc block')

figure;
hold on;
stem(Diff_ULPath,'-r')
% stem(ULPath_ref_dataout_BRSC(1:L),'-g')
% stem(ULPath_Tap_dataout_BRSC(1:L),'-b')
title('Diff Data out of brsc block')

 [NMSE,NPSE] = NMSE_NPSE_calc(ULPath_ref_dataout_BRSC(1:L),ULPath_Tap_dataout_BRSC(1:L))
% Diff_ULPath= mean((abs(ULPath_ref_dataout_BRSC(1:L)-ULPath_Tap_dataout_BRSC(1:L))).^2)./mean(abs(ULPath_ref_dataout_BRSC(1:L).^2));
% NMSE_DLpath= 10*log10(Diff_ULPath)
% NMSE_ERR (TestCaseId) = NMSE_DLpath;
% AnalysisLength = L
% % NMSE_ERR
% 
% Diff_ULPath= max((abs(ULPath_ref_dataout_BRSC(1:L)-ULPath_Tap_dataout_BRSC(1:L))).^2)./mean(abs(ULPath_ref_dataout_BRSC(1:L).^2));
% NPSE_DLpath= 10*log10(Diff_ULPath)
% NPSE_ERR (TestCaseId) = NPSE_DLpath;
% AnalysisLength = L
% % NPSE_ERR
%% 
ULPath_ref_chout_BRSC= fft_tb_exp_out.ip_ch_cap;
ULPath_Tap_chout_BRSC= double(Final_Chout.Data(Final_Dout_V.Data==1)).';
L = min(length(ULPath_ref_chout_BRSC),length(ULPath_Tap_chout_BRSC));

chout_err = sum(ULPath_ref_chout_BRSC(1:L)-ULPath_Tap_chout_BRSC(1:L))

% CH_ERR (TestCaseId) = choute;
% CH_ERR