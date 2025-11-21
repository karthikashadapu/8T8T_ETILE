close all;
%load('dspba_tv_op_tc_3.mat')


%% phase compensation block comparision
%{
PhaseGen_Tap_dataop = double(out.PhaseGenDout.Data(out.PhaseGenValidout.Data==1));
PhaseGen_Tap_dataop = PhaseGen_Tap_dataop(:).';
PhaseGen_Tap_cosop = double(out.PhaseGenCosSin.Data(out.PhaseGenValidout.Data==1));
PhaseGen_Tap_cosop = PhaseGen_Tap_cosop(:).';


PhaseCompFinaldout = double(out.PhFinalDout.Data(out.PhFinalValid.Data==1));
PhaseCompFinaldout = PhaseCompFinaldout(:).';




PhaseGenRefIp=ipvector_cap;
PhaseGenRefCos = (phasor_v);
PhaseCompRefFinalDout= pc_comp_v;





L = min(length(PhaseGen_Tap_dataop),length(PhaseGenRefIp));



 Diff_DLPath= (abs(PhaseGen_Tap_dataop(1:L)-PhaseGenRefIp(1:L)).^2)./mean(abs(PhaseGenRefIp(1:L).^2));
figure;
stem(PhaseGen_Tap_dataop(1:L),'-g')
stem(PhaseGenRefIp(1:L),'-bx')
stem(Diff_DLPath(1:L),'r')
title('Data in t0  Phase Block ')



 Diff_DLPath= (abs(PhaseGen_Tap_cosop(1:L)-PhaseGenRefCos(1:L)).^2)./mean(abs(PhaseGenRefCos(1:L).^2));
figure;
stem(PhaseGen_Tap_cosop(1:L),'-g')
stem(PhaseGenRefCos(1:L),'-bx')
stem(Diff_DLPath(1:L),'r')
title('Cos in t0  Phase Block ')

L = min(length(PhaseCompFinaldout),length(PhaseCompRefFinalDout));
 Diff_DLPath= (abs(PhaseCompFinaldout(1:L)-PhaseCompRefFinalDout(1:L)).^2)./mean(abs(PhaseCompRefFinalDout(1:L).^2));
figure;
stem(PhaseCompFinaldout(1:L),'-g')
stem(PhaseCompRefFinalDout(1:L),'-bx')
stem(Diff_DLPath(1:L),'r')
title( ' Final Dout Block ')



%% BR&SC
BRSC_ref_datain = pc_comp_v;
BRSC_Tap_datain = double(out.BR_SC_Tap_data_in.Data(out.BR_SC_Tap_dv_in.Data==1));
BRSC_Tap_datain = BRSC_Tap_datain(:).';
L = min(length(BRSC_ref_datain),length(BRSC_Tap_datain));


Diff_BRSC_in = (abs(BRSC_ref_datain(1:L)-BRSC_Tap_datain(1:L)).^2)./mean(abs(BRSC_ref_datain(1:L).^2));
NMSE_BRSC_in= 10*log10(sum(Diff_BRSC_in.^2)/length(Diff_BRSC_in))

figure;
hold on;
stem(Diff_BRSC_in,'-r')
title('Data in to iFFT+ B2S Block')
% stem(BRSC_ref_datain(1:L),'-g')
% stem(BRSC_Tap_datain(1:L),'-b')

figure;
hold on;
stem(BRSC_ref_datain(1:L),'-g')
stem(BRSC_Tap_datain(1:L),'-b')
title('Data in to iFFT+ B2S Block')

%%

BRSC_ref_dataout = dout_brsc_v;
BRSC_Tap_dataout = double(out.BR_SC_Tap_data_out.Data(out.BR_SC_Tap_dv_out.Data==1)).';
L = min(length(BRSC_ref_dataout),length(BRSC_Tap_dataout));



Diff_BRSC= (abs(BRSC_ref_dataout(1:L)-BRSC_Tap_dataout(1:L)).^2)./mean(abs(BRSC_ref_dataout(1:L).^2));
NMSE_BRSC= 10*log10(sum(Diff_BRSC.^2)/length(Diff_BRSC))


figure;
hold on;
stem(Diff_BRSC,'-r')
% stem(BRSC_ref_dataout(1:L),'-g')
% stem(BRSC_Tap_dataout(1:L),'-b')
title('Data out of BR & SC')

%%

iFFT_ref_dataout = ifftout_v;
iFFT_Tap_dataout = double(out.iFFT_Tap_data_out.Data(out.iFFT_Tap_dv_out.Data==1)).';
L = min(length(iFFT_ref_dataout),length(iFFT_Tap_dataout));





Diff_iFFT= (abs(iFFT_ref_dataout(1:L)-iFFT_Tap_dataout(1:L)).^2)./mean(abs(iFFT_ref_dataout(1:L).^2));
NMSE_iFFT= 10*log10(sum(Diff_iFFT.^2)/length(Diff_iFFT))

figure;
hold on;
stem(Diff_iFFT,'-r')
% stem(iFFT_ref_dataout(1:L),'-g')
% stem(iFFT_Tap_dataout(1:L),'-b')
title('Data out of iFFT')
%}
%% DLpath_Tap_dv_out
DLPath_ref_dataout = ifft_tb_exp_out.dout_v;
DLPath_Tap_dataout = double(DLpath_Tap_data_out.Data(DLpath_Tap_dv_out.Data==1)).';
L = min(length(DLPath_ref_dataout),length(DLPath_Tap_dataout));



 Diff_DLPath= (abs(DLPath_ref_dataout(1:L)-DLPath_Tap_dataout(1:L)).^2)./mean(abs(DLPath_ref_dataout(1:L).^2));
% NMSE_DLpath= 10*log10(sum(Diff_DLPath.^2)/length(Diff_DLPath))

figure;
hold on;
stem(Diff_DLPath,'-r')
%stem(DLPath_ref_dataout(1:L),'-g')
%stem(DLPath_Tap_dataout(1:L),'-b')
title('Data out err of iFFT + B2S Block')


figure;
hold on;
%stem(Diff_DLPath,'-r')
stem(DLPath_ref_dataout(1:L),'-g')
stem(DLPath_Tap_dataout(1:L),'-rx')
title('Data out of iFFT + B2S Block')
 [NMSE,NPSE] = NMSE_NPSE_calc(DLPath_ref_dataout(1:L),DLPath_Tap_dataout(1:L))
% Diff_DLPath= mean((abs(DLPath_ref_dataout(1:L)-DLPath_Tap_dataout(1:L))).^2)./mean(abs(DLPath_ref_dataout(1:L).^2));
% NMSE_DLpath= 10*log10(Diff_DLPath)
% NMSE_ERR (TestCaseId) = NMSE_DLpath;
% NMSE_ERR
% 
% 
% Diff_DLPath= max((abs(DLPath_ref_dataout(1:L)-DLPath_Tap_dataout(1:L))).^2)./mean(abs(DLPath_ref_dataout(1:L).^2));
% NPSE_DLpath= 10*log10(Diff_DLPath)
% NPSE_ERR (TestCaseId) = NPSE_DLpath;
% 
% 
% 
% NPSE_ERR
% AnalisisLen=L
%% Chout err

Ref_ch_out = ifft_tb_exp_out.AxC_out_v;
Tap_ch_out = double(DLpath_Tap_ch_out.Data(DLpath_Tap_dv_out.Data==1)).';
L = min(length(Ref_ch_out),length(Tap_ch_out));

CH_TotErr = sum(Ref_ch_out(1:L)-Tap_ch_out(1:L))
% Ch_out_ERR (TestCaseId) = CH_TotErr;
% Ch_out_ERR
disp('NMSE_DLpath')
% disp(NMSE_DLpath)
% NPSE_DLpath