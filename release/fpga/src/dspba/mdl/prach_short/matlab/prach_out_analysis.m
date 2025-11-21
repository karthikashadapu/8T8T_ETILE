%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: prach_out_analysis.m
% Description: Script to analysis prach output
% author: nima safari
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
prach_output_ch0 = prach_dout(prach_vout == 1 & prach_cout == 0);
prach_output_ch1 = prach_dout(prach_vout == 1 & prach_cout == 1);
prach_output_ch2 = prach_dout(prach_vout == 1 & prach_cout == 2);
prach_output_ch3 = prach_dout(prach_vout == 1 & prach_cout == 3);
prach_output_ch4 = prach_dout(prach_vout == 1 & prach_cout == 4);
prach_output_ch5 = prach_dout(prach_vout == 1 & prach_cout == 5);
prach_output_ch6 = prach_dout(prach_vout == 1 & prach_cout == 6);
prach_output_ch7 = prach_dout(prach_vout == 1 & prach_cout == 7);
prach_output_ch8 = prach_dout(prach_vout == 1 & prach_cout == 8);
prach_output_ch9 = prach_dout(prach_vout == 1 & prach_cout == 9);
prach_output_ch10 = prach_dout(prach_vout == 1 & prach_cout == 10);
prach_output_ch11 = prach_dout(prach_vout == 1 & prach_cout == 11);
% prach_output_ch12 = prach_dout(prach_vout == 1 & prach_cout == 12);
% prach_output_ch13 = prach_dout(prach_vout == 1 & prach_cout == 13);
% prach_output_ch14 = prach_dout(prach_vout == 1 & prach_cout == 14);
% prach_output_ch15 = prach_dout(prach_vout == 1 & prach_cout == 15);

prach_ZC = fftshift(prach_output_ch11); % Similar as: prach_ZC = [x.prach_output(421:end); x.prach_output(1:420)];

%% ZC_seq, PreambleIdx and Offset Detection
 
[ZCseq_set, PreambleIdx, offset] = PRACH_corr_detection(prach_ZC, info);

disp('Detected Zadoff-Chu Sequence is:');
ZCseq_set
disp('Detected Preamble index is:');
PreambleIdx
disp('Detected Offset is:');
offset
