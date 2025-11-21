function [cp_rmv_out,mixer_out_quant,filt_out_3_quant,y] = prach_fixedP_model(x,info,prach)
NprachRE = info.NZC;  
phi = 7;
f_RACH_SP = 1250; % Hz, PRACH subcarrier Spacing
f_OFDM_SP = 15000; % Hz, OFDM subcarrier spacing
K =  f_OFDM_SP / f_RACH_SP;
nRB_sc = 12;
nRB_UL = 100;
k0 = prach.RBOffset*nRB_sc - nRB_UL*nRB_sc/2;
nco_freq = -1*( phi + K*(k0+0.5)+floor(NprachRE/2) ) * f_RACH_SP;

%y = HWprach_model_fixedP(x,nco_freq,prach.Format,1,1);

load('hbcoefficient.mat');  
fft_scale_bit_select = 0;
prach_start = 1630; 
prach_end   = 420;
grpDelay = 6;
% sampleDelay = length(HB_Coeff_st2)/2 + 2 * length(HB_Coeff_st3)/2 + ... 
%     4 * length(dec_by3_Coeff)/2;
% grpDelay = round(sampleDelay/12);

[cp_rmv_out,mixer_out_quant,filt_out_3_quant,y] = ...
    prach_model(x,nco_freq,0,HB_Coeff_st2,0, ...
    HB_Coeff_st3,0,dec_by3_Coeff,fft_scale_bit_select,prach_start,prach_end,grpDelay);