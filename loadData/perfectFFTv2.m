%mducng/SoC/D2/G2touch
% A simple signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; 
clear; 
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
samples     = 512;
Fs          = 512;
dt          = 1/Fs;
f1          = 5;
f2          = 60;
fnoise      = 100;
tVectors    = (0:(samples-1))*dt;
x1          = sin(2*pi*f1*tVectors);
x2          = (1+0.1*sin(2*pi*f2*tVectors)).*sin(2*pi*f1*tVectors);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,1,1);
plot(tVectors,x1,'-.','LineWidth',1.0);
title('Time signal x1.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,1,2);
plot(tVectors,x2,'-.','LineWidth',1.0);
title('Time signal x2.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nfft        = samples;
df          = Fs/Nfft;
fVectors    = (0:Nfft-1)*df;
y1          = fft(x1,Nfft);
P1          = abs(y1/Nfft);
A1          = angle(y1);
subplot(4,1,3);
stem(fVectors,P1,'-x','LineWidth',1.0);
title('Abs. Fourier transform.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y2          = fft(x2,Nfft);
P2          = abs(y2/Nfft);
A2          = angle(y2);
subplot(4,1,4);
stem(fVectors,P2,'-x','LineWidth',1.0);
title('Abs. Fourier transform.');
