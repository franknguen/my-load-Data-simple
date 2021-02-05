%mducng/SoC/D2/G2touch
% Load time signal from txt file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load testData.dat;                         % load full file  
Fs          = 22000;                       % Sampling frequency of data 
dt          = 1/Fs;                        % Time interval as corresponding Fs
xFull       = testData;                    % assign a full length data
Nfft        = 2^8;
NfftFull    = length(testData);
xVectors    = testData(2000:2000+Nfft-1);  % assign a short length data  
tFull       = (0:1:length(testData)-1)*dt;
tVectors	= (2000:2000+Nfft-1)*dt;       % Time vector
%%%%%%%%%%%%%%%%
df          = Fs/Nfft;
fVector     = (0:Nfft-1)*df;
yVector     = fft(xVectors,Nfft);
dfFull      = Fs/NfftFull;
fFull       = (0:NfftFull-1)*dfFull;
yFull       = fft(xFull,NfftFull);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
subplot(2,1,1);
plot(tFull,xFull);
axis([0 (NfftFull-1)*dt -1 1]);
xlabel('time (s)');
ylabel('vowel of "a"');
title('A full range of signal.');
subplot(2,1,2);
plot(fFull,abs(yFull/NfftFull));
axis([0 Fs 0 1/2]);
xlabel('freq. (Hz)');
ylabel('power of "a"');
title('A full range of signal.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2);
subplot(2,1,1);
plot(tVectors,xVectors);
axis([2000*dt (2000+Nfft-1)*dt -1 1]);
xlabel('time (s)');
ylabel('vowel of "a"');
title('A short range of signal.');
subplot(2,1,2);
plot(fVector,abs(yVector/Nfft));
axis([0 Fs 0 1/2]);
xlabel('freq. (Hz)');
ylabel('power of "a"');
title('A short range of signal.');
