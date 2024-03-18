clc
clear
close all
%% Data processing
% fileID = uigetfile('*.txt');
% C = readmatrix(fileID);
[file,path] = uigetfile('*.txt'); % opens file selection dialog box. You may choose data from different folder
C = readmatrix(strcat(path,file)); % data will be imported from the specified path

Thrust_bias = 0;

C1 = C(25:end,1:8);
x = C1(:,1); %Time(ms)
y = C1(:,2); %Tank Pressure(bar)
y1 = C1(:,3); %Chamber Pressure(bar)
y2 = C1(:,4)-Thrust_bias; %Thrust(kgf)
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

%% simulink

%sim parameters
wn = 49.2375;           %natural frequency
dp = 0.4113;           %damping ratio
lag_time = 0.094;        %actuactor lag time
stop_time = 10;
timestep = 0.001;

Step_test_open_signal=51;               % second
Step_test_thruster_correction = -0.4;    %kg
average_thruster = mean( y2( OS( Step_test_open_signal+10):OS(end) ) ) ;



out = sim("actuactor_model_2023a.slx");

%take out data from simulink
t_sim       = out.actuactor_response.Time;
response    = out.actuactor_response.Data;

%% plot thrust response
% 
% plot(x(77600:OS(end)+1000)-x(77600),y2(77600:OS(end)+1000)-3.5)
% hold on 
% plot(x(77600)-x(77600),y2(77600)-3.5,"d",x(OS(end))-x(77600),y2(OS(end))-3.5,"d")
% title("Thrust response","FontSize",18)
% xlabel("time(s)","FontSize",14)
% ylabel("Thrust(N)","FontSize",14)


figure(5)
plot(x(OS(Step_test_open_signal):OS(end)+1000)-x(OS(Step_test_open_signal)),y2(OS(Step_test_open_signal):OS(end)+1000)-Step_test_thruster_correction)
hold on 
plot(t_sim,response,'LineWidth',3)
hold on 
plot(x(OS(Step_test_open_signal))-x(OS(Step_test_open_signal)),y2(OS(Step_test_open_signal))-Step_test_thruster_correction,"d",x(OS(end)+100)-x(OS(Step_test_open_signal)),y2(OS(end))-Step_test_thruster_correction,"d")
title("H_2O_2 Thrust response","FontSize",18)
xlabel("time(s)","FontSize",14)
ylabel("Thrust(N)","FontSize",14)
legend("Original Thruster Data","2 order transient model with lag")
