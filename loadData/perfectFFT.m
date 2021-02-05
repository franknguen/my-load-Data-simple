%mducng/SoC/D2/G2touch
% to check FFT power
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; 
clear; 
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs          =  64;
dT          =  1/Fs;
f1          =  10;
f2          =  10.2;
f3          =  10;
Nfft        =  Fs;
dF          =  Fs/Nfft;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tVectors    =  (0:1:(Nfft-1))*dT;
x1          =  cos(2*pi*f1*tVectors);
x2          =  cos(2*pi*f2*tVectors);
tVectors3   =  (0:1:(Nfft*3/4-1))*dT;
x3          =  [cos(2*pi*f3*tVectors3),zeros(1,Nfft/4)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fVectors    =  (0:1:(Nfft-1))*dF;
y1          =   fft(x1,Nfft);
y2          =   fft(x2,Nfft);
y3          =   fft(x3,Nfft);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot time signal
subplot(2,3,1);
stem(tVectors,x1,':rdiamond');
xlabel('Time (s)');
ylabel('Amplitude ');
subplot(2,3,2);
stem(tVectors,x2,':rdiamond');
xlabel('Time (s)');
ylabel('Amplitude ');
subplot(2,3,3);
stem(tVectors,x3,':rdiamond');
xlabel('Time (s)');
ylabel('Amplitude ');
%Plot frequency signal
subplot(2,3,4);
stem(fVectors,abs(y1/Nfft));
xlabel('Frequency (Hz)');
ylabel('Power ');
subplot(2,3,5);
stem(fVectors,abs(y2/Nfft));
xlabel('Frequency (Hz)');
ylabel('Power ');
subplot(2,3,6);
stem(fVectors,abs(y3/Nfft));
xlabel('Frequency (Hz)');
ylabel('Power ');