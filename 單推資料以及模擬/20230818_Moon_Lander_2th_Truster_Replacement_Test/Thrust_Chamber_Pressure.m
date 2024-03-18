clc
clear
clf
Average_Tank_Pressure(1,4) = zeros;
Average_Chamber_Pressure(1,4) = zeros;
Average_Thrust(1,4) = zeros;
for i = 1:4
fileID = uigetfile('*.txt');
C = readmatrix(fileID);
C1 = C(25:end,1:7);
x = C1(:,1); %Time(ms)
y = C1(:,2); %Tank Pressure(bar)
y1 = C1(:,3); %Chamber Pressure(bar)
y2 = C1(:,4); %Thrust(kgf)
y2 = y2*9.81; %Thrust(N)
y3 = C1(:,5); %Temperature(celsius)
y4 = C1(:,6); %Oxidizer Flow Rate(g/sec)
subplot(3,1,1);
plot(x,y);
title('Tank Pressure');
xlabel('Time(ms)');
ylabel('Tank Pressure(bar)');
hold off;
subplot(3,1,2);
plot(x,y1);
title('Chamber Pressure');
xlabel('Time(ms)');
ylabel('Chamber Pressure(bar)');
subplot(3,1,3);
plot(x,y2);
hold off;
title('Thrust');
xlabel('Time(ms)');
ylabel('Thrust(N)');
hold off
[a,b,button] = ginput(2);
a = a*1000;
Average_Tank_Pressure(i) = mean(y(a(1):a(2)));
Average_Chamber_Pressure(i) = mean(y1(a(1):a(2)));
Average_Thrust(i) = mean(y2(a(1):a(2)));
end
f1 = figure;
plot(Average_Tank_Pressure,Average_Thrust,'o-');
title('Pressure VS Thrust');
xlabel('Pressure(bar)');
ylabel('Thrust(N)');
hold on;
plot(Average_Tank_Pressure,Average_Chamber_Pressure,'o-');
legend('Tank pressure vs Thrust','Tank pressure vs Chamber Pressure');
hold off;
f2 = figure;
plot(Average_Chamber_Pressure,Average_Thrust,'o');
title('Chamber Pressure VS Thrust');
xlabel('Pressure(bar)');
ylabel('Thrust(N)');
hold on;
Chamber_Pressure_Thrust = polyfit(Average_Chamber_Pressure,Average_Thrust,2);
val = polyval(Chamber_Pressure_Thrust,x);



