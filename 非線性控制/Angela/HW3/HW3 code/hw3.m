clear; clc; close all;

% sys = tf([60.92],[0.002 0.12 1 0]);
sys = tf([1],[0.002 0.12 1 0]);
figure;
nyquist(sys)
xlim([-1.5 0])
ylim([-0.15 0.15])
hold on;
x = [-1,-20]
y = [0,0]
plot(x,y,'-r')
legend('nyquist plot','-1/N(X)')


%% stable? k = 60
sys_1 = tf([60],[0.002 0.1 1 0]);
nyquist(sys_1)

%% (b) solve for X where freq is 22.3607
syms x
w = 10*5^0.5;
K = 70;
G = K/(-0.12*w^2);
eqn = 2/pi*(asin(20/x)+20/x*(1-(20/x)^2)^0.5) == -1/G;
X = vpasolve(eqn)

%% (b) solve for X where freq is 22.7
syms x
w = 22.7;
K = 70;
G = K/(-0.12*w^2);
eqn = 2/pi*(asin(20/x)+20/x*(1-(20/x)^2)^0.5) == -1/G;
X = vpasolve(eqn)

%% text book checking
syms x
w = 10;
G = 10*w/(-2.1*w);
K = 0.25;
eqn = 2*K/pi*(asin(1/x)+1/x*(1-(1/x)^2)^0.5) == -1/G;
X = vpasolve(eqn)

%% simulink time response 
figure;
plot(c_out);
title('c(t)');
xlabel('Time(s)');
ylabel('Response');
set(gca,'FontSize',14);
grid on;

Fs = 1000;
T = 1/Fs;
L = 1500;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;
S = c_time;
Y = fft(S);


%% describing function figure
for i = 21:1000
    N(i) = -(2/pi*(asin(20/i)+20/i*(1-(20/i)^2)^0.5));
end
Re = 0:length(i);
figure;
plot(Re,N)

%% bode plotttt
figure;
sys_1 = tf([60],[0.002 0.12 1 0]);
bode(sys_1)
hold on;
sys_2 = tf([61.8348],[0.002 0.12 1 0]);
bode(sys_2)
grid on;

%% state space
sys = tf([1],[0.002 0.12 1 0]);
H = ss(sys);
e_0 = -30;
% e_0 = -10;
ini = [0 0 e_0]./H.C(3);
K = 70;
