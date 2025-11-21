%% Plotting an averaging PSD
% Author: N SAFARI

function plot_spectrum(x,block_len,Fs,color)
if color == []
    color = 'k'
end;
if block_len == []
    block_len = length(x);
end;
if Fs == []
    error('please enter the sampling frequency');
end;

L = length(x);
n = floor(L/block_len);
sum=0;

for i=1:n
    sum = sum + pwelch( x( 1+(i-1)*block_len:block_len*i), floor(block_len/3), [], block_len );
    %[Pxx,f] = pwelch(x,[],[],[],Fs);
    %sum = sum + Pxx;
end
deltaF = Fs/length(sum);
f = -Fs/2:deltaF:Fs/2-deltaF;

hold on
plot(f,fftshift(10*log10(sum/n)),color);
xlabel('Frequency, MHz')
