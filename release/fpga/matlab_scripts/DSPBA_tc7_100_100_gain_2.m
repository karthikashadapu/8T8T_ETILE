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
% Author:      
% File:  DSPBA_tc7_100_100_gain_2.m      
% Description: 100+100MHz gain_2 testcase
settings.fftout_size=917280;
settings.fftin_size=1228800;
settings.num_fft=2;
settings.num_axc_per_fft=4;
settings.delay=0;

cc1_bw=100e6;
cc2_bw=100e6;
phase_comp_enable=0;
dc_sc_enable=0;
rc_enable=1;
if (cc1_bw==100e6)
    cc1_nprb=3276;
    cc1_duc_channel_filter_coeff=duc_coeff.Coef100.Numerator;
    cc1_ddc_channel_filter_coeff=ddc_coeff.Coef100.Numerator;
    cc1_bw_config=14;
else
    cc1_nprb=1944;
    cc1_duc_channel_filter_coeff=duc_coeff.Coef60.Numerator;
    cc1_ddc_channel_filter_coeff=ddc_coeff.Coef60.Numerator;
    cc1_bw_config=10;
end

if (cc2_bw==100e6)
    cc2_nprb=3276;
    cc2_duc_channel_filter_coeff=duc_coeff.Coef100.Numerator;
    cc2_ddc_channel_filter_coeff=ddc_coeff.Coef100.Numerator;
    cc2_bw_config=14;
else
    cc2_nprb=1944;
    cc2_duc_channel_filter_coeff=duc_coeff.Coef60.Numerator;
    cc2_ddc_channel_filter_coeff=ddc_coeff.Coef60.Numerator;
    cc2_bw_config=10;
end

%ifft l1 settings
ifft_tb_in_l1.num_fft = 1;
ifft_tb_in_l1.num_axc_per_fft =4;
ifft_tb_in_l1.bw_sel=cc1_bw;
ifft_tb_in_l1.NumSym=1;
ifft_tb_in_l1.fftsize_in=4096;
ifft_tb_in_l1.NPRB=cc1_nprb;
ifft_tb_in_l1.constgain=2*16384;
ifft_tb_in_l1.Muxsel=0;
ifft_tb_in_l1.MuxConstData =0;
ifft_tb_in_l1.ifftshift=12;
ifft_tb_in_l1.DC_SC_EN=dc_sc_enable ;
ifft_tb_in_l1.Tech_CP=phase_comp_enable;
ifft_tb_in_l1.Digital_power_real=0.9999;
ifft_tb_in_l1.Digital_power_imag=0;
ifft_tb_in_l1.F1=3.7497;
ifft_tb_in_l1.Tsym =0;
ifft_tb_in_l1.TCP =1;
ifft_tb_in_l1.CPLen_in=352;
ifft_tb_in_l1.lut  = [2.86458333333333e-06	3.85416666666667e-05	7.42187500000000e-05	0.000109895833333333	0.000145572916666667	0.000181250000000000	0.000216927083333333	0.000252604166666667	0.000288281250000000	0.000323958333333333	0.000359635416666667	0.000395312500000000	0.000430989583333333	0.000466666666666667 ]*1e9;
ifft_tb_in_l1.rc_en=rc_enable;
ifft_tb_in_l1.Chan_filter_coeffs=cc1_duc_channel_filter_coeff;

%ifft l2 settings
ifft_tb_in_l2.num_fft = 1; 
ifft_tb_in_l2.num_axc_per_fft =4;
ifft_tb_in_l2.bw_sel=cc2_bw;
ifft_tb_in_l2.NumSym=1;
ifft_tb_in_l2.fftsize_in=4096;
ifft_tb_in_l2.NPRB=cc2_nprb;
ifft_tb_in_l2.constgain=2*16384;
ifft_tb_in_l2.Muxsel=0;
ifft_tb_in_l2.MuxConstData =0;
ifft_tb_in_l2.ifftshift=12;
ifft_tb_in_l2.DC_SC_EN=dc_sc_enable ;
ifft_tb_in_l2.Tech_CP=phase_comp_enable;
ifft_tb_in_l2.Digital_power_real=0.9999;
ifft_tb_in_l2.Digital_power_imag=0;
ifft_tb_in_l2.F1=3.7497;
ifft_tb_in_l2.Tsym =0;
ifft_tb_in_l2.TCP =1;
ifft_tb_in_l2.CPLen_in=352;
ifft_tb_in_l2.lut  = [2.86458333333333e-06	3.85416666666667e-05	7.42187500000000e-05	0.000109895833333333	0.000145572916666667	0.000181250000000000	0.000216927083333333	0.000252604166666667	0.000288281250000000	0.000323958333333333	0.000359635416666667	0.000395312500000000	0.000430989583333333	0.000466666666666667 ]*1e9;
ifft_tb_in_l2.rc_en=rc_enable;
ifft_tb_in_l2.Chan_filter_coeffs=cc2_duc_channel_filter_coeff;

% pcap or randomly generated ip data

%fft l1 settings
fft_tb_in_l1.bw_sel=cc1_bw;
fft_tb_in_l1.NPRB=cc1_nprb;
fft_tb_in_l1.group_delay=269;%For 311+193 taps
fft_tb_in_l1.num_fft = 1;
fft_tb_in_l1.num_axc_per_fft =4;
fft_tb_in_l1.lut  = [2.86458333333333e-06	3.85416666666667e-05	7.42187500000000e-05	0.000109895833333333	0.000145572916666667	0.000181250000000000	0.000216927083333333	0.000252604166666667	0.000288281250000000	0.000323958333333333	0.000359635416666667	0.000395312500000000	0.000430989583333333	0.000466666666666667 ]*1e9;
fft_tb_in_l1.fftsize_in = 12;
fft_tb_in_l1.constgain=2*16384;
fft_tb_in_l1.Dout=0;
fft_tb_in_l1.fftshift= 0;
fft_tb_in_l1.DC_SC_EN=dc_sc_enable;
fft_tb_in_l1.Tech_CP=phase_comp_enable;
fft_tb_in_l1.CPLen_in=352;
fft_tb_in_l1.F1=3.7497; 
fft_tb_in_l1.Tsym=11010;
fft_tb_in_l1.Hcsshift_v=0;
fft_tb_in_l1.rc_en=rc_enable;
fft_tb_in_l1.Chan_filter_coeffs=cc1_ddc_channel_filter_coeff;

%fft l2 settings
fft_tb_in_l2.bw_sel=cc2_bw;
fft_tb_in_l2.NPRB=cc2_nprb;
fft_tb_in_l2.group_delay=269;%For 311+193 taps
fft_tb_in_l2.num_fft = 1;
fft_tb_in_l2.num_axc_per_fft =4;
fft_tb_in_l2.lut  = [2.86458333333333e-06	3.85416666666667e-05	7.42187500000000e-05	0.000109895833333333	0.000145572916666667	0.000181250000000000	0.000216927083333333	0.000252604166666667	0.000288281250000000	0.000323958333333333	0.000359635416666667	0.000395312500000000	0.000430989583333333	0.000466666666666667 ]*1e9;
fft_tb_in_l2.fftsize_in = 12;
fft_tb_in_l2.constgain=2*16384;
fft_tb_in_l2.Dout=0;
fft_tb_in_l2.fftshift= 0;
fft_tb_in_l2.DC_SC_EN=dc_sc_enable;
fft_tb_in_l2.Tech_CP=phase_comp_enable;
fft_tb_in_l2.CPLen_in=352;
fft_tb_in_l2.F1=3.7497;
fft_tb_in_l2.Tsym=11010;
fft_tb_in_l2.Hcsshift_v=0;
fft_tb_in_l2.Chan_filter_coeffs=cc2_ddc_channel_filter_coeff;
fft_tb_in_l2.rc_en=rc_enable;

%duc l1 settings
duc_tb_in_l1.num_fft=1;
duc_tb_in_l1.num_axc=4;
duc_tb_in_l1.bw_sel=cc1_bw; 
duc_tb_in_l1.duc_nco =[ 50  -50  50  -50 ];
duc_tb_in_l1.HB1_coeffs=duc_coeff.HB1_coeffs.Numerator;
duc_tb_in_l1.HB2_coeffs=duc_coeff.HB2_coeffs.Numerator;
duc_tb_in_l1.Coef100=duc_coeff.Coef100.Numerator;
duc_tb_in_l1.Coef60=duc_coeff.Coef60.Numerator;
duc_tb_in_l1.Chan_filter_coeffs=cc1_duc_channel_filter_coeff;
duc_tb_in_l1.bw_cc_config=cc1_bw_config;

%duc l2 settings
duc_tb_in_l2.num_fft=2;
duc_tb_in_l2.num_axc=4;
duc_tb_in_l2.bw_sel=cc2_bw;
duc_tb_in_l2.duc_nco =[ -50  50  -50  50];
duc_tb_in_l2.HB1_coeffs=duc_coeff.HB1_coeffs.Numerator;
duc_tb_in_l2.HB2_coeffs=duc_coeff.HB2_coeffs.Numerator;
duc_tb_in_l2.Coef100=duc_coeff.Coef100.Numerator;
duc_tb_in_l2.Coef60=duc_coeff.Coef60.Numerator;
duc_tb_in_l2.Chan_filter_coeffs=cc2_duc_channel_filter_coeff;
duc_tb_in_l2.bw_cc_config=cc2_bw_config;

%ca_interp_tb_in_l1 settings
ca_interp_tb_in_l1.num_fft=2;
ca_interp_tb_in_l1.num_axc=4;
ca_interp_tb_in_l1.HB3_coeffs=duc_coeff.HB3_coeffs.Numerator;
ca_interp_tb_in_l1.duc_gain=[8192 8192 8192 8192];
ca_interp_tb_in_l1.duc_cc1_delay=[0 0 0 0];
ca_interp_tb_in_l1.duc_cc2_delay=[0 0 0 0];
ca_interp_tb_in_l1.dfe_lpbk_ctrl=1;

%dec_dly_comp_tb_in_l1 settings
dec_dly_comp_tb_in_l1.num_fft=2;
dec_dly_comp_tb_in_l1.num_axc=4;
dec_dly_comp_tb_in_l1.HB3_coeffs=ddc_coeff.HB3_coeffs.Numerator;
dec_dly_comp_tb_in_l1.ddc_gain=[8192,8192,8192,8192];
dec_dly_comp_tb_in_l1.ddc_cc1_delay=[0 0 0 0];
dec_dly_comp_tb_in_l1.ddc_cc2_delay=[0 0 0 0];
dec_dly_comp_tb_in_l1.dfe_lpbk_ctrl=1;

%ddc l1 settings
ddc_tb_in_l1.ddc_mux_sel=0;
ddc_tb_in_l1.bw_sel=cc1_bw;
ddc_tb_in_l1.ddc_nco =[-50 50 -50 50];
ddc_tb_in_l1.HB1_coeffs=ddc_coeff.HB1_coeffs.Numerator;
ddc_tb_in_l1.HB2_coeffs=ddc_coeff.HB2_coeffs.Numerator;
ddc_tb_in_l1.Coeff100=ddc_coeff.Coef100.Numerator;
ddc_tb_in_l1.Coef60=ddc_coeff.Coef60.Numerator;
ddc_tb_in_l1.ddc_mux_const_real=[0 0 0 0];
ddc_tb_in_l1.ddc_mux_const_imag=[0 0 0 0];
ddc_tb_in_l1.Chan_filter_coeffs=cc1_ddc_channel_filter_coeff;
ddc_tb_in_l1.bw_cc_config=cc1_bw_config;

%ddc l2 settings
ddc_tb_in_l2.ddc_mux_sel=0;
ddc_tb_in_l2.bw_sel=cc2_bw;
ddc_tb_in_l2.ddc_nco =[50 -50 50 -50 ];
ddc_tb_in_l2.HB1_coeffs=ddc_coeff.HB1_coeffs.Numerator;
ddc_tb_in_l2.HB2_coeffs=ddc_coeff.HB2_coeffs.Numerator;
ddc_tb_in_l2.Coeff100=ddc_coeff.Coef100.Numerator;
ddc_tb_in_l2.Coef60=ddc_coeff.Coef60.Numerator;
ddc_tb_in_l2.ddc_mux_const_real=[0 0 0 0];
ddc_tb_in_l2.ddc_mux_const_imag=[0 0 0 0];
ddc_tb_in_l2.Chan_filter_coeffs=cc2_ddc_channel_filter_coeff;
ddc_tb_in_l2.bw_cc_config=cc2_bw_config;

save([OUTPUT_BASEPATH ,filesep,'output',filesep,'b2b_sim',filesep,'settings.mat'],'settings','ifft_tb_in_l1','ifft_tb_in_l2','duc_tb_in_l1','duc_tb_in_l2','ca_interp_tb_in_l1','dec_dly_comp_tb_in_l1','ddc_tb_in_l1','ddc_tb_in_l2','fft_tb_in_l1','fft_tb_in_l2');