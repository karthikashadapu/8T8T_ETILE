function [cp_rmv_out,mixer_out_quant,filt_out_3_quant,fft_out_quant] = prach_model(rxPrachSeq,nco_freq_val,preamble,dec_1_coeff,dec1_sel,dec_2_coeff,dec2_sel,dec_3_coeff,fft_scale,output_start,output_end, grpDelay)

%% Parameters
InputWaveform = 'LTE20';
num_of_runs = 10; 
ZCseq_vals = round(837*rand(1,num_of_runs));
nRB_vals = round(94*rand(1,num_of_runs));
offset_vals = randi([0 200],1,num_of_runs);
noise_power_vals = randi([20 50],1,num_of_runs);
prachSNR = 20;% dB
i = 3;
sf_data_length = 2048 *15; 
q_16s15 = quantizer('fixed', 'round', 'saturate', [16 15]);
q_18s17 = quantizer('fixed', 'round', 'saturate', [18 17]);

%% Assignment
if(preamble == 0)
    symStart = 3168;
    prach_seq_length = 24576;
elseif(preamble == 1)
    symStart = 21024;
    prach_seq_length = 24576;
elseif(preamble == 2)
    symStart = 6240;
    prach_seq_length = 2*24576;
elseif(preamble == 3)
    symStart = 21024;
    prach_seq_length = 2*24576;   
elseif(preamble == 4)
    symStart = 448;  
    prach_seq_length = 4096;
end 

%% CP Removal
% rxPrachSeq_quant = quantize(q_16s15,rxPrachSeq);
rxPrachSeq_quant= fi(rxPrachSeq, 1, 16, 15) ;

cp_rmv_out = rxPrachSeq_quant(symStart+1:symStart+prach_seq_length);

%% NCO Value Generation

Fs = 30.72e6;
F0 = nco_freq_val;      % Output frequency = 510 Hz
df = 0.05;              % Frequency resolution = 0.05 Hz
minSFDR =96;             % Spurious free dynamic range >= 96 dB
Ts = 1/Fs;               % Sample period = 1/4000 sec

if(sign(nco_freq_val)==-1)
    dphi = pi;             % Desired phase offset = pi/2;
else
    dphi = 0;             % Desired phase offset = pi/2;
end

% Calculate number of accumulator bits required for the given
% frequency resolution
Nacc = ceil(log2(1/(df*Ts)));
Nacc = 32; % value from DSP Builder
% Calculate number of quantized accumulator bits required from the
% SFDR requirement
 Nqacc = ceil((minSFDR)/6);
% Calculate the phase increment
phIncr = round(F0*Ts*2^Nacc);
% Calculate the phase offset
% if(phIncr<0)
%     dphi = pi;             % Desired phase offset = pi/2;
% else
%     dphi = 0;             % Desired phase offset = pi/2;
% end

phOffset = 2^Nacc*dphi/(2*pi);
phOffset = 0;

nco = dsp.NCO('PhaseIncrementSource', 'Property', ...
    'PhaseIncrement', phIncr,...
    'PhaseOffsetSource','Property',...
    'PhaseOffset', phOffset,...
    'NumDitherBits', 4, ...
    'Waveform', 'Complex exponential',...
    'SamplesPerFrame', prach_seq_length,...
    'CustomAccumulatorDataType', numerictype([],Nacc),...
    'OutputDataType','Custom',...
    'CustomOutputDataType',numerictype([],18,17),...
    'NumQuantizerAccumulatorBits',Nqacc);

NCO_out = step(nco);
NCO_out = double(NCO_out);
% NCO_out_quant = quantize(q_18s17,NCO_out);
NCO_out_quant= fi(NCO_out, 1, 18, 17) ;

%% Complex Mixer
mixer_out = NCO_out_quant .* cp_rmv_out ;
% mixer_out_quant = quantize(q_16s15,mixer_out);
mixer_out_quant= fi(mixer_out, 1, 16, 15) ;


%% For filter residue
mixer_out_quant = [mixer_out_quant;mixer_out_quant];

%% Decimation stage 1 - Half band filter
% a=double((fi(fir1(24, 0.5),1,16,15)));
% a_quant=quantize(q_16s15,a)

% a=double(fi([(repmat(0,12,1))' 0.5 (repmat(0,12,1))']));
a=double(dec_1_coeff);
% a_quant= fi(a, 1, 16, 15) ;
% y=zeros(length(mixer_out_quant),1);
% z=zeros(length(a_quant),1);
% for n=1:length(mixer_out_quant)
%     z=[mixer_out_quant(n);z(1:end-1)];
%     y(n) = a_quant*z;
% end

dec_2_1_filter = dfilt.dffir(a);
dec_2_1_filter.Arithmetic = 'fixed';
dec_2_1_filter.CoeffAutoScale = false;
dec_2_1_filter.NumFracLength = 15;
y = filter(dec_2_1_filter,mixer_out_quant);

if(dec1_sel == 0)
   filt_out_1 = y(1:2:end);
else   
    filt_out_1 = y(2:2:end);
end
% filt_out_1_quant = quantize(q_16s15,filt_out_1);
filt_out_1_quant= fi(filt_out_1, 1, 16, 15) ;


%% Decimation stage 2 - Half band filter
% a=double((fi(fir1(24, 0.5),1,16,15)));
% a_quant=quantize(q_16s15,a)

% a=double(fi([(repmat(0,16,1))' 0.5 (repmat(0,16,1))']));
a=double(dec_2_coeff);
% a_quant= fi(a, 1, 16, 15) ;
% y=zeros(length(filt_out_1_quant),1);
% z=zeros(length(a),1);
% for n=1:length(filt_out_1_quant)
%     z=[filt_out_1_quant(n);z(1:end-1)];
%     y(n) = a*z;
% end

dec_2_2_filter = dfilt.dffir(a);
dec_2_2_filter.Arithmetic = 'fixed';
dec_2_2_filter.CoeffAutoScale = false;
dec_2_2_filter.NumFracLength = 15;
y = filter(dec_2_2_filter,filt_out_1_quant);

if(dec2_sel == 0)
   filt_out_2 = y(1:2:end);
else   
   filt_out_2 = y(2:2:end);
end

% filt_out_2_quant = quantize(q_16s15,filt_out_2);
filt_out_2_quant= fi(filt_out_2, 1, 16, 15) ;

%% Decimation stage 3 - Decimation by 3
% a=double(fi(fir1(32, 0.333),1,16,15));
% a_quant=quantize(q_16s15,a)
% a=double(fi([(repmat(0,24,1))' 0.5 (repmat(0,24,1))']));
a=double(dec_3_coeff);
% a_quant= fi(a, 1, 16, 15) ;
% y=zeros(length(filt_out_2_quant),1);
% z=zeros(length(a),1);
% for n=1:length(filt_out_2_quant)
%     z=[filt_out_2_quant(n);z(1:end-1)];
%     y(n) = a*z;
% end

dec_3_filter = dfilt.dffir(a);
dec_3_filter.Arithmetic = 'fixed';
dec_3_filter.CoeffAutoScale = false;
dec_3_filter.NumFracLength = 15;
y = filter(dec_3_filter,filt_out_2_quant);

%grpDelay = 6;
filt_out_3 = y(1:3:end);
filt_out_3 = [filt_out_3(grpDelay+1:end); zeros(grpDelay,1)];

% filt_out_3_quant = quantize(q_16s15,filt_out_3);
filt_out_3_quant= fi(filt_out_3, 1, 16, 15) ;

%% For filter residue
filt_out_3_quant = filt_out_3_quant((prach_seq_length/12)+1:end);
mixer_out_quant = mixer_out_quant(1:length(mixer_out_quant)/2);

% disp('size of filt_out_3')
% size(filt_out_3)
% disp('size of filt_out_3_quant')
% size(filt_out_3_quant)

%% Decimation stage 3 - Decimation by 3
dec_factor = 2*2*3;
fft_out   = fft(double(filt_out_3_quant),prach_seq_length/dec_factor);
fft_out = fft_out*2^fft_scale;

% fft_out_quant = quantize(q_16s15,fft_out);
fft_out_quant= fi(fft_out, 1, 16, 10) ;

cp_rmv_out = double(cp_rmv_out);
NCO_out_quant = double(NCO_out_quant);
mixer_out_quant = double(mixer_out_quant);
filt_out_1_quant = double(filt_out_1_quant);
filt_out_2_quant = double(filt_out_2_quant);
filt_out_3_quant = double(filt_out_3_quant);
%fft_out_quant = double(fft_out_quant(output_start:output_end));
fft_out_quant = double([fft_out_quant(1:output_end);fft_out_quant(output_start:end)]);

%% Save the intermediate values
% save('prach_model.mat','cp_rmv_out','NCO_out_quant','mixer_out_quant','filt_out_1_quant','filt_out_2_quant','filt_out_3_quant','fft_out_quant');

end