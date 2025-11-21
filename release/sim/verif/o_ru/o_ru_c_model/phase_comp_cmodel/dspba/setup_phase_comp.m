%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: setup_phase_comp.m
% Description: Script to set variables in Matlab workspace to configure
% phase_compensation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dspb_ifft.SampleTime  = 1;

dspb_ifft.N = 12;
dspb_ifft.subchannels = 1; % must be a power of 2
dspb_ifft.FFTsize = 2^dspb_ifft.N;
dspb_ifft.blockSize = dspb_ifft.subchannels * dspb_ifft.FFTsize;


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
