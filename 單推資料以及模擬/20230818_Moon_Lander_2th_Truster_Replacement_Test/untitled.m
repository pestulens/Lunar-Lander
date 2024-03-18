clc
clear
close all
%% Data processing
fileID = uigetfile('*.txt');
C = readmatrix(fileID);
C1 = C(25:end,1:8);
x = C1(:,1); %Time(ms)
y = C1(:,2); %Tank Pressure(bar)
y1 = C1(:,3); %Chamber Pressure(bar)
y2 = C1(:,4); %Thrust(kgf)
y2 = y2*9.81; %Thrust(N)
y3 = C1(:,5); %Temperature(celsius)
y4 = C1(:,6); %Oxidizer Flow Rate(g/sec)
S = C1(:,8);
%% find open valve siignal 
OS = find(S==1);
OT = x(OS);
%% plot 
f1 = figure;
subplot(2,2,1);
plot(x,y1);
hold on;
title('Chamber Pressure');
xlabel('Time(ms)');
ylabel('Chamber Pressure(bar)');
hold off;
subplot(2,2,2);
y2_initial = y2(1000:10000);
initial_mean = mean(y2_initial);
y2 = y2 - initial_mean;
plot(x,y2);
hold on;
title('Thrust');
xlabel('Time(ms)');
ylabel('Thrust(N)');
hold off
subplot(2,2,3);
plot(x,y3);
hold on;
title('Temperature');
xlabel('Time(ms)');
ylabel('Temperature(celsius)');
hold off
subplot(2,2,4);
plot(x,y4);
hold on;
title('Oxidizer Flow Rate');
xlabel('Time(ms)');
ylabel('Oxidizer Flow Rate(g/sec)');
hold off
average_flow_rate = mean(y4);
f2 = figure;
plot(x,y2)
hold on;
title('Thrust');
xlabel('Time(ms)');
ylabel('Thrust(N)');
hold off;
f3 = figure;
plot(x,y1);
hold on;
title('Chamber Pressure');
xlabel('Time(ms)');
ylabel('Chamber Pressure(bar)');
hold off;
f4 = figure;
plot(x,y);
hold on;
title('Tank Pressure');
xlabel('Time(ms)');
ylabel('Tank Pressure(bar)');
hold off;

