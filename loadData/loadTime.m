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
Nfft        = 2^9;
xFull       = testData;                    % assign a full length data
xVectors    = testData(2000:2000+Nfft-1);  % assign a short length data  
tFull       = (0:1:length(testData)-1)*dt;
tVectors	= (2000:2000+Nfft-1)*dt;       % Time vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
subplot(2,1,1);
plot(tFull,xFull);
axis([0 2*dt*length(testData) -1 2]);
xlabel('time (s)');
ylabel('vowel of "a"');
title('A full range of signal.');
subplot(2,1,2);
plot(tVectors,xVectors);
axis([0 2*dt*length(testData) -1 2]);
xlabel('time (s)');
ylabel('vowel of "a"');
title('A short range of signal.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2);
subplot(2,1,1);
plot(tFull,xFull);
%axis([0 2*dt*length(testData) -1 2]);
xlabel('time (s)');
ylabel('vowel of "a"');
title('A full range of signal.');
subplot(2,1,2);
stem(tVectors,xVectors,':rdiamond');
%axis([0 2*dt*length(testData) -1 2]);
xlabel('time (s)');
ylabel('vowel of "a"');
title('A short range of signal.');
