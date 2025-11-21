%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: setup_demo_fft.m
% Description: Script to set variables in Matlab workspace to configure
% demo_fft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Configuration Parameters
if exist('OverrideClockRate', 'var')
    dspb_fft.ClockRate = OverrideClockRate;
else
    dspb_fft.ClockRate = 200;
end

dspb_fft.ClockMargin = 0.0;
dspb_fft.SampleTime = 1;

%% FFT data
dspb_fft.IFFT = false;
dspb_fft.bit_reversed = false; % applies to the overall FFT, not the FFT core block

dspb_fft.N = 12;
dspb_fft.subchannels = 1; % must be a power of 2
dspb_fft.FFTsize = 2^dspb_fft.N;
dspb_fft.blockSize = dspb_fft.subchannels * dspb_fft.FFTsize;

%% Data Type Specification
dspb_fft.input_type   = fixdt(1,16,15);
dspb_fft.twiddle_type = fixdt(1,18,17);

%% The pruning strategy:

% We must set the radix2 flag if the first two stages
% of the FFT could both be radix2 (rather than radix4)
% stages. If we don't do this, the datapath between
% these stages will be too narrow and we risk getting an overflow.
% This is never necessary for the single-wire streaming FFTs.
dspb_fft.radix2 = false;

% (1) Full word growth (best SNR but highest cost)
dspb_fft.type_strings = ...
    dspba.fft.full_wordgrowth(true, dspb_fft.radix2, dspb_fft.N,...
        dspb_fft.input_type, dspb_fft.twiddle_type);

% (2) Mild pruning of LS bits
% dspb_fft.type_strings = ...
%    dspba.fft.mild_pruning(true, dspb_fft.radix2, dspb_fft.N,...
%        dspb_fft.input_type, dspb_fft.twiddle_type);

% (3) Brutal pruning of LS bits
%dspb_fft.type_strings = ...
%    dspba.fft.prune_to_width(19, true, dspb_fft.radix2, dspb_fft.N,...
%        dspb_fft.input_type, dspb_fft.twiddle_type);

% (4) Invent your own application-specific strategy

% 5 sets of input should provide 3 sets of output, allowing for latency in both the BitReverse buffer and the FFT itself.
dspb_fft.SimulationTime = ceil(dspb_fft.blockSize / 0.9) * 5 + 100;

% Generate some input samples
dspb_fft.sampledata = ...
    generate_fft_sample_data(...
        dspb_fft.SimulationTime, ...
        dspb_fft.FFTsize, ...
        [2.3, 0.1; 60, 0.1; 950.2, 0.1], ...
        0.2);

dspb_fft.valid_in = zeros(1,dspb_fft.SimulationTime);
dspb_fft.channel_in = zeros(1,dspb_fft.SimulationTime);
dspb_fft.x_in = zeros(1,dspb_fft.SimulationTime);

% Generate the data stream, with random delays inserted.
dspb_fft.point = 0;
for count = 1 : dspb_fft.SimulationTime
    if rand(1) < 0.9
        dspb_fft.point = dspb_fft.point + 1;
        dspb_fft.valid_in(1,count) = 1;
        dspb_fft.channel_in(1,count) = ceil(dspb_fft.point / dspb_fft.blockSize);
        dspb_fft.x_in(1,count) = dspb_fft.sampledata(dspb_fft.point);
    end;
end;
