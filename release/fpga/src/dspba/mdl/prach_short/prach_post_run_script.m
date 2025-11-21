 figure;
subplot(3,1,1);
plot(real(X(:,1))/max(real(X(:,1))),'b');
hold on;
plot(imag(X(:,1))/max(real(X(:,1))),'r');
title('Raw FFT output, matlab reference');
subplot(3,1,2);
plot(real(PrachOut_DSPBA(1:Nfft))/max(real(PrachOut_DSPBA(1:Nfft))), 'k');
hold on;
plot(imag(PrachOut_DSPBA(1:Nfft))/max(imag(PrachOut_DSPBA(1:Nfft))), 'm');
title('Raw FFT output, DSP Builder');
subplot(3,1,3);
plot(real(X(:,1))/max(real(X(:,1)))-real(PrachOut_DSPBA(1:Nfft))/max(real(PrachOut_DSPBA(1:Nfft))), 'g');
hold on;
plot(imag(X(:,1))/max(real(X(:,1)))-imag(PrachOut_DSPBA(1:Nfft))/max(imag(PrachOut_DSPBA(1:Nfft))), 'c');
title('Difference');

figure;
subplot(2,1,1);
plot(real(prach_output(:,1))/max(real(prach_output(:,1))),'b');
hold on;
plot(imag(prach_output(:,1))/max(real(prach_output(:,1))),'r');
title('PRACH output, matlab, normalized ');
subplot(2,1,2);
for i=1:139
    PrachOut139reordered_DSPBA(1+PrachIdxOut139_DSPBA(i)) = PrachOut139_DSPBA(i);
end;
plot(real(PrachOut139reordered_DSPBA)/max(real(PrachOut139reordered_DSPBA)), 'k');
hold on;
plot(imag(PrachOut139reordered_DSPBA)/max(imag(PrachOut139reordered_DSPBA)), 'm');
title('PRACH output, DSP Builder, normalized');

 cd ./matlab;

[ZCseq_set, PreambleIdx, offset] = PRACH_corr_detection(PrachOut139reordered_DSPBA(1:139).', info,prach.SequenceIndex)
 disp('Detected Zadoff-Chu Sequence is:');
ZCseq_set
disp('Detected Preamble index is:');
PreambleIdx
disp('Detected Offset is:');
offset

 cd ./../;
