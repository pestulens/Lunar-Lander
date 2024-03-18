clear
clc
xlsxFILE = '20220627';
%% Chamber Pressure
y1 = xlsread(xlsxFILE,1,'C:C'); %Chamber Pressure(bar)
y1 = y1(28150:35550);
N = length(y1);
dt = 0.001;
fs = 1/dt;
f = fs./2.*linspace(0,1,N/2+1);
r1 = y1 - mean(y1);
R1 = fft(r1.^2)./N;
subplot(3,1,1);
plot(f,abs(R1(1:N/2+1)))
xlabel('Frequency (Hz)')
ylabel('Amplitude')
title('Fourier Spectrum (Chamber pressure)')
%% Tank Pressure
y2 = xlsread(xlsxFILE,1,'B:B'); %Tank Pressure(bar)
y2 = y2(28150:35550);
n = length(y2);
dT = 0.001;
Fs = 1/dt;
F = fs./2.*linspace(0,1,n/2+1);
r1 = y2 - mean(y1);
r1 = fft(r1.^2)./n;
subplot(3,1,2);
plot(F,abs(r1(1:n/2+1)))
xlabel('Frequency (Hz)')
ylabel('Amplitude')
title('Fourier Spectrum (Tank Pressure)')
%% Mass Flow Rate
y6 = xlsread(xlsxFILE,1,'F:F'); %Tank Pressure(bar)
y6 = y6(28150:35550);
n = length(y6);
dT = 0.001;
Fs = 1/dt;
F = fs./2.*linspace(0,1,n/2+1);
r1 = y2 - mean(y1);
r1 = fft(r1.^2)./n;
subplot(3,1,3);
plot(F,abs(r1(1:n/2+1)))
xlabel('Frequency (Hz)')
ylabel('Amplitude')
title('Fourier Spectrum (Mass Flow Rate)')