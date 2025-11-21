 close all;
%clearvars -except TestCaseId ManualRun NMSE_ERR CH_ERR resultv;
 % load('prach_temp_out.mat')
% close all;
 % load('simout11.mat');
% 
%load('dspba_tv_simop.mat');
%load('dspba_tv_simop_tc_2.mat')
% prach.CyclicShiftIdx = 1;  % ZCZ  % Cyclic shift index: TS36.141, Table A.6-1
% prach.HighSpeed = 0;       % Normal mode: TS36.104, Table 8.4.2.1-1
% 
% info.NCS = ZeroCorrIndex(prach.CyclicShiftIdx,prach.HighSpeed,1.25); %% SCS parameter added to make it complaint with new zero corr index function
% info.NZC = 839;
%%  compare inputs

data=lprach_tb_exp_out.Prach_tb_data;
valid = lprach_tb_exp_out.Prach_tb_valid;
x=data(valid==1);

if (lprach_tb_exp_out.prach.ConfigIndex==16) 
    x=x(122880*2+1:122880*2+122880*4);
end
data=In_data;
valid = In_valid;
y=data(valid==1);



disp('input stage')
[NMSE,NPSE] = NMSE_NPSE_calc(x,y)
nmseip = NMSE;
npseip = NPSE;
fs=122.88e6; Hs=spectrum.welch; figure; G=y(1:4:end); psd(Hs,G,'Fs',fs); title('prach Input')
%%  CP_removal 
x=lprach_tb_exp_out.Prach_tb_data(prach.symStart+1:prach.symEnd+1);
if (lprach_tb_exp_out.prach.ConfigIndex==16) 
    x=lprach_tb_exp_out.Prach_tb_data(122880*2+prach.symStart+1:122880*2+prach.symEnd+1);
end
t=x;



data=cp_dout;
valid = cp_valid;
y=data(valid==1);



disp('CP removal output')
[NMSE,NPSE] = NMSE_NPSE_calc(x,y);

fs=122.88e6; Hs=spectrum.welch; figure; G=y(1:4:end); psd(Hs,G,'Fs',fs);  title('MIxer Input')

%%  Mixer
f_nco_febug = prach.SampleRateMSPS*1e6* prach.NCO/2^30;
f=-realfreq;%f_nco_febug;
fs=122.88e6;
Len=round(length(x)/4);
n=1:Len;

sinsoidop = exp(1j*2*pi*(f/fs)*n).';
sinsoidop = repelem(sinsoidop,4);

x=x(1:4*Len).*sinsoidop; %% change it to x.*sinusoid

%%/************NCO data*****/
data=NCO_dout;
valid = NCO_valid;
p=data(valid==1);

data=mix_dout;
valid = mix_vout;
y=data(valid==1);



disp('mixer output')
[NMSE,NPSE] = NMSE_NPSE_calc(x,y);
fs=122.88e6; Hs=spectrum.welch; figure; G=y(1:4:end); psd(Hs,G,'Fs',fs);  title('MIxer output')



%% Decimator output
 AxC=4; decimation_factor=3; ip_length=(prach.symEnd-prach.symStart);                              [t1,u1,op_length] = filter_ch_interleaved(x,decimation_factor,AxC,double(b_decimator1), ip_length,decimator_gain1);
 x=t1.';data=dec_dout_stage1;valid = dec_vout_stage1;y=data(valid==1); disp('decimator output stage1');[NMSE,NPSE] = NMSE_NPSE_calc(x,y);


 AxC=4; decimation_factor=2; ip_length=(prach.symEnd-prach.symStart)/(3);                       [t2,u1,op_length] = filter_ch_interleaved(t1,decimation_factor,AxC,double(b_decimator2), ip_length,decimator_gain2);
  x=t2.';data=dec_dout_stage2;valid = dec_vout_stage2;y=data(valid==1); disp('decimator output stage2');[NMSE,NPSE] = NMSE_NPSE_calc(x,y);



 AxC=4; decimation_factor=2; ip_length=(prach.symEnd-prach.symStart)/(3*2);                   [t3,u1,op_length] = filter_ch_interleaved(t2,decimation_factor,AxC,double(b_decimator3), ip_length,decimator_gain3);
  x=t3.';data=dec_dout_stage3;valid = dec_vout_stage3;y=data(valid==1); disp('decimator output stage3');[NMSE,NPSE] = NMSE_NPSE_calc(x,y);


 AxC=4; decimation_factor=2; ip_length=(prach.symEnd-prach.symStart)/(3*2*2);               [t4,u1,op_length] = filter_ch_interleaved(t3,decimation_factor,AxC,double(b_decimator4), ip_length,decimator_gain4); 
  x=t4.';data=dec_dout_stage4;valid = dec_vout_stage4;y=data(valid==1); disp('decimator output stage4');[NMSE,NPSE] = NMSE_NPSE_calc(x,y);

 AxC=4; decimation_factor=2; ip_length=(prach.symEnd-prach.symStart)/(3*2*2*2);           [t5,u1,op_length] = filter_ch_interleaved(t4,decimation_factor,AxC,double(b_decimator5), ip_length,decimator_gain5); 
  x=t5.';data=dec_dout_stage5;valid = dec_vout_stage5;y=data(valid==1); disp('decimator output stage5');[NMSE,NPSE] = NMSE_NPSE_calc(x,y);

 AxC=4; decimation_factor=2; ip_length=(prach.symEnd-prach.symStart)/(3*2*2*2*2);       [t6,u1,op_length] = filter_ch_interleaved(t5,decimation_factor,AxC,double(b_decimator6), ip_length,decimator_gain6);
 x=t6.';data=dec_dout;valid = dec_vout;y=data(valid==1);disp('decimator output');[NMSE,NPSE] = NMSE_NPSE_calc(x,y);

 %% S2B conversion.

 %testdata = 0:1023;
%Groupdelay_offset_ant0=44;
 t_ch0 = double (circshift(x(1:AxC:end),-Groupdelay_offset_ant0)); 
 x_ch0 = bitrevorder (circshift(x(1:AxC:end),-Groupdelay_offset_ant0));  % this is done as output of s2b is bit reversed


 t_ch1 = double (circshift(x(2:AxC:end),-Groupdelay_offset_ant1)); 
 x_ch1 = bitrevorder (circshift(x(2:AxC:end),-Groupdelay_offset_ant1));  % this is done as output of s2b is bit reversed

 

 t_ch2 = double (circshift(x(3:AxC:end),-Groupdelay_offset_ant2)); 
 x_ch2 = bitrevorder (circshift(x(3:AxC:end),-Groupdelay_offset_ant2));  % this is done as output of s2b is bit reversed

 t_ch3 = double (circshift(x(4:AxC:end),-Groupdelay_offset_ant3)); 
 x_ch3 = bitrevorder (circshift(x(4:AxC:end),-Groupdelay_offset_ant3));  % this is done as output of s2b is bit reversed





y_ch0 = S2B_dout(S2B_valid == 1 & S2B_chout == 0);
y_ch1 = S2B_dout(S2B_valid == 1 & S2B_chout == 1);
y_ch2 = S2B_dout(S2B_valid == 1 & S2B_chout == 2);
y_ch3 = S2B_dout(S2B_valid == 1 & S2B_chout == 3);

disp('S2B Ch0');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch0,y_ch0)
disp('S2B Ch1');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch1,y_ch1);
disp('S2B Ch2');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch2,y_ch2);
disp('S2B Ch3');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch3,y_ch3);

%% FFT operation

 x_ch0 = (fft( t_ch0));  
 x_ch1 = (fft( t_ch1));  
 x_ch2 = (fft( t_ch2));  
 x_ch3 = (fft( t_ch3));  


y_ch0 = fft_dout(fft_vout == 1& fft_chout==0);
y_ch1 = fft_dout(fft_vout == 1& fft_chout==1);
y_ch2 = fft_dout(fft_vout == 1& fft_chout==2);
y_ch3 = fft_dout(fft_vout == 1& fft_chout==3);

figure;
plot(real(x_ch0)); title('FFT block output')
disp('FFT Ch0');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch0,y_ch0);
disp('FFT Ch1');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch1,y_ch1);
disp('FFT Ch2');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch2,y_ch2);
disp('FFT Ch3');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch3,y_ch3);
%% FFTshift 
x_ch0 = fftshift(x_ch0);  
y_ch0 = fftshift_dout(fftshift_vout == 1& fftshift_chout==0);
disp('FFT shift Ch0');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch0,y_ch0);

x_ch1 = fftshift(x_ch1);  
y_ch1 = fftshift_dout(fftshift_vout == 1& fftshift_chout==1);
disp('FFT shift Ch1');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch1,y_ch1);

x_ch2 = fftshift(x_ch2);  
y_ch2 = fftshift_dout(fftshift_vout == 1& fftshift_chout==2);
disp('FFT shift Ch2');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch2,y_ch2);

x_ch3 = fftshift(x_ch3);  
y_ch3 = fftshift_dout(fftshift_vout == 1& fftshift_chout==3);
disp('FFT shift Ch3');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch3,y_ch3);

%% Front RB zeropad & selection
x_ch0 = [zeros(1,ZeroPadFront) x_ch0(prach.SCstart:prach.SCend).'].';
y_ch0 = zeropad_front_data(zeropad_front_v == 1& zeropad_front_ch==0);
disp('Zeropad Front After Selection ch0');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch0,y_ch0);

x_ch1 = [zeros(1,ZeroPadFront) x_ch1(prach.SCstart:prach.SCend).'].';
y_ch1 = zeropad_front_data(zeropad_front_v == 1& zeropad_front_ch==1);
disp('Zeropad Front After Selection ch1');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch1,y_ch1);

x_ch2 = [zeros(1,ZeroPadFront) x_ch2(prach.SCstart:prach.SCend).'].';
y_ch2 = zeropad_front_data(zeropad_front_v == 1& zeropad_front_ch==2);
disp('Zeropad Front After Selection ch2');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch2,y_ch2);

x_ch3 = [zeros(1,ZeroPadFront) x_ch3(prach.SCstart:prach.SCend).'].';
y_ch3 = zeropad_front_data(zeropad_front_v == 1& zeropad_front_ch==3);
disp('Zeropad Front After Selection ch3');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch3,y_ch3);
 %% Rear Zeopad
Lprach_dout =double(Lprach_dout.Data);
Lprach_vout =double(Lprach_vout.Data);
Lprach_cout =double(Lprach_cout.Data);

x_ch0 = [x_ch0.' zeros(1,ZeroPadRear) ].';


y_ch0 = Lprach_dout(Lprach_vout == 1& Lprach_cout==0);
disp('Zeropad rear After Selection ch0');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch0,y_ch0);

nmseop_ch0= NMSE
npseop_ch0 = NPSE


x_ch1 = [x_ch1.' zeros(1,ZeroPadRear) ].';
y_ch1 = Lprach_dout(Lprach_vout == 1& Lprach_cout==1);
disp('Zeropad rear After Selection ch1');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch1,y_ch1);

nmseop_ch1= NMSE;
npseop_ch1= NPSE;

x_ch2 = [x_ch2.' zeros(1,ZeroPadRear) ].';
y_ch2 = Lprach_dout(Lprach_vout == 1& Lprach_cout==2);
disp('Zeropad rear After Selection ch2');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch2,y_ch2);

nmseop_ch2= NMSE;
npseop_ch2 = NPSE;

x_ch3= [x_ch3.' zeros(1,ZeroPadRear) ].';
y_ch3 = Lprach_dout(Lprach_vout == 1& Lprach_cout==3);
disp('Zeropad rear After Selection ch3');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch3,y_ch3);

nmseop_ch3= NMSE;
npseop_ch3 = NPSE;
%  %  TBD
%  x_ch0 =[zeros(1,25) x_ch0(prach.SCstart:prach.SCend).'].';   
%  x_ch1 =[zeros(1,25) x_ch1(prach.SCstart:prach.SCend).'].';  
%  x_ch2 =[zeros(1,25) x_ch2(prach.SCstart:prach.SCend).'].';   
%  x_ch3 =[zeros(1,25) x_ch3(prach.SCstart:prach.SCend).'].';  
%  
% 
% 
% 
% 
% y_ch0 = prach_dout(prach_vout == 1& prach_cout==0);
% y_ch1 = prach_dout(prach_vout == 1& prach_cout==1);
% y_ch2 = prach_dout(prach_vout == 1& prach_cout==2);
% y_ch3 = prach_dout(prach_vout == 1& prach_cout==3);
% 
% 
% disp('Sym Sel Ch0');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch0,y_ch0)
% disp('Sym Sel Ch1');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch1,y_ch1)
% disp('Sym Sel Ch2');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch2,y_ch2)
% disp('Sym Sel Ch3');[NMSE,NPSE] = NMSE_NPSE_calc(x_ch3,y_ch3)


%%
    [ZCseq_set, PreambleIdx, offset] = PRACH_corr_detection(y_ch0(ZeroPadFront+1:end-ZeroPadRear), info,lprach_tb_exp_out.prach.SeqIdx);

disp('Detected Zadoff-Chu Sequence is:');
ZCseq_set
disp('Detected Preamble index is:');
PreambleIdx
disp('Detected Offset is:');
offset

% resultv(1,TestCaseId) = prach.SeqIdx ;
% resultv(2,TestCaseId) = prach.FreqOffset;
% resultv(3,TestCaseId) = prach.PreambleIdx;
% resultv(4,TestCaseId) = prach.CyclicShiftIdx;
% resultv(5,TestCaseId) = snr ;
% resultv(6,TestCaseId) = timedelay0 ;
% tresultv(7,TestCaseId) =timedelay1 ;
% resultv(8,TestCaseId) = timedelay2 ;
% resultv(9,TestCaseId) = timedelay3 ;
% resultv(10,TestCaseId) =  prach.NCO;
% 
% 
% 
% resultv(21,TestCaseId) = nmseip;
% resultv(22,TestCaseId) = npseip ;
% resultv(23,TestCaseId) =nmseop_ch0;
% resultv(24,TestCaseId) = npseop_ch0;
% resultv(25,TestCaseId) =nmseop_ch1;
% resultv(26,TestCaseId) =npseop_ch1;
% resultv(27,TestCaseId) =nmseop_ch2;
% resultv(28,TestCaseId) = npseop_ch2;
% resultv(29,TestCaseId) = nmseop_ch3;
% resultv(30,TestCaseId) = npseop_ch3;
% 
% 
% resultv(31,TestCaseId) = ZCseq_set;
% resultv(32,TestCaseId) = PreambleIdx;
% resultv(33,TestCaseId) = offset;
% 
% 
% disp('Analysis done')