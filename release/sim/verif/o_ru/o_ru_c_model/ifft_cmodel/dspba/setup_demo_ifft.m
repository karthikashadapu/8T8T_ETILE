%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: setup_demo_ifft.m
% Description: Script to set variables in Matlab workspace to configure
% demo_ifft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if exist('OverrideClockRate', 'var')
    dspb_ifft.ClockRate = OverrideClockRate;
else
    dspb_ifft.ClockRate = 200;
end

%% Configuration Parameters
dspb_ifft.ClockMargin = 0.0;
dspb_ifft.SampleTime  = 1;

%% FFT data
dspb_ifft.IFFT = true;
dspb_ifft.bit_reversed = false; % applies to the overall FFT, not the FFT core block

dspb_ifft.N = 12;
dspb_ifft.subchannels = 1; % must be a power of 2
dspb_ifft.FFTsize = 2^dspb_ifft.N;
dspb_ifft.blockSize = dspb_ifft.subchannels * dspb_ifft.FFTsize;

%% Data Type Specification
dspb_ifft.input_type   = fixdt(1,16,15);
%dspb_ifft.twiddle_type = fixdt(1,18,17);%orig
dspb_ifft.twiddle_type = fixdt(1,16,15);%sr

%% The pruning strategy:

% We must set the radix2 flag if the first two stages
% of the FFT could both be radix2 (rather than radix4)
% stages. If we don't do this, the datapath between
% these stages will be too narrow and we risk getting an overflow.
% This is never necessary for the single-wire streaming FFTs.
dspb_ifft.radix2 = false;

% (1) Full word growth (best SNR but highest cost)
dspb_ifft.type_strings = ...
    dspba.fft.full_wordgrowth(true, dspb_ifft.radix2, dspb_ifft.N,...
        dspb_ifft.input_type, dspb_ifft.twiddle_type);

% (2) Mild pruning of LS bits
% dspb_ifft.type_strings = ...
%    dspba.fft.mild_pruning(true, dspb_ifft.radix2, dspb_ifft.N,...
%        dspb_ifft.input_type, dspb_ifft.twiddle_type);

% (3) Brutal pruning of LS bits
%dspb_ifft.type_strings = ...
%    dspba.fft.prune_to_width(19, true, dspb_ifft.radix2, dspb_ifft.N,...
%        dspb_ifft.input_type, dspb_ifft.twiddle_type);

% (4) Invent your own application-specific strategy

%% 5 sets of input should provide 3 sets of output, allowing for latency in both the BitReverse buffer and the FFT itself.
dspb_ifft.SimulationTime = ceil(dspb_ifft.blockSize / 0.9) * 5 + 100;

%% Generate some input samples
dspb_ifft.sampledata = ...
    generate_fft_sample_data(...
        dspb_ifft.SimulationTime, ...
        dspb_ifft.FFTsize, ...
        [2.3, 0.1; 60, 0.1; 950.2, 0.1], ...
        0.2);

dspb_ifft.valid_in = zeros(1,dspb_ifft.SimulationTime);
dspb_ifft.channel_in = zeros(1,dspb_ifft.SimulationTime);
dspb_ifft.x_in = zeros(1,dspb_ifft.SimulationTime);

%% Generate the data stream, with random delays inserted.
dspb_ifft.point = 0;
for count = 1 : dspb_ifft.SimulationTime
    if rand(1) < 0.9
        dspb_ifft.point = dspb_ifft.point + 1;
        dspb_ifft.valid_in(1,count) = 1;
        dspb_ifft.channel_in(1,count) = ceil(dspb_ifft.point / dspb_ifft.blockSize);
        dspb_ifft.x_in(1,count) = dspb_ifft.sampledata(dspb_ifft.point);
    end
end
