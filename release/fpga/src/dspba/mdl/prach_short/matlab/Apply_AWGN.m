%  ================================================================================
%  (c) 2010 Altera Corporation. All rights reserved.
%  Altera products are protected under numerous U.S. and foreign patents, maskwork
%  rights, copyrights and other intellectual property laws.
%  
%  This reference design file, and your use thereof, is subject to and governed
%  by the terms and conditions of the applicable Altera Reference Design License
%  Agreement (either as signed by you, agreed by you upon download or as a
%  "click-through" agreement upon installation andor found at www.altera.com).
%  By using this reference design file, you indicate your acceptance of such terms
%  and conditions between you and Altera Corporation.  In the event that you do
%  not agree with such terms and conditions, you may not use the reference design
%  file and please promptly destroy any copies you have made.
%  
%  This reference design file is being provided on an "as-is" basis and as an
%  accommodation and therefore all warranties, representations or guarantees of
%  any kind (whether express, implied or statutory) including, without limitation,
%  warranties of merchantability, non-infringement, or fitness for a particular
%  purpose, are specifically disclaimed.  By making this reference design file
%  available, Altera expressly does not recommend, suggest or require that this
%  reference design file be used in combination with any other product not
%  provided by Altera.
%  ================================================================================
%  
%  Filename    : Apply_AWGN.m
% 
%  Author      : nsafari
% 
%  Description : This module takes the input complex data and the targeted SNR, 
%                and applies Additive White Gaussian Noise.
%  ================================================================================

function Out = Apply_AWGN(x, SNR);
% Apply complex AWGN noise to input x
% Format:
% Apply_AWGN(x, Targeted_SNR);
% Inputs:
% x is input waveform
% SNR is the targeted Signal to Noise Ratio

S_pow = mean(abs(x).^2);
noise_sigma = sqrt(S_pow/10^(SNR/10));
noise_cplx = 1/sqrt(2) * noise_sigma * complex(randn(length(x),1),randn(length(x),1));
Out = x + noise_cplx;

