%mducng/SoC/D2/G2touch
% A simple signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; 
clear; 
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N        = 22050;
n        = 0:N-1;
Fs       = 11025;
dt       = 1/Fs;
f        = 1000;
Nfft     = 128;
df       = Fs/Nfft;
tVectors = n*dt;
fVectors = (0:1:Nfft-1)*df;
x1       = cos(2*pi*f*tVectors);
X1       = fft(x1(1:Nfft),Nfft);
figure(1);
subplot(2,1,1);
stem(tVectors(1:50),x1(1:50));
title('1 kHz Sinusoid with fs = 11.025 kHz','fontsize',18);
ylabel('Amplitude','fontsize',14);
xlabel('Sequence Index - n','fontsize',14);
subplot(2,1,2);
stem(fVectors,abs(X1/Nfft));
title('1 kHz Sinusoid with fs = 11.025 kHz','fontsize',18);