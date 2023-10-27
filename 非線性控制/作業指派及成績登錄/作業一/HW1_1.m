% Nonlinear Control HW1_1
%%
clc;
clear;
close all;

%% Initial Condition 1
c1=[3 4];
%% Initial Condition 2
c2=[3.01 4.01];

%% Time span
t0=0;
tf=50;
nout=600;
tspan=linspace(t0, tf, nout);

%% Nonlinear Case 1
[t1, y1]=ode45(@nonlinear, tspan, c1);

%% Nonlinear Case 2
[t2, y2]=ode45(@nonlinear, tspan, c2);

%% Linear Case 1
[t3, y3]=ode45(@linear, tspan, c1);

%% Linear Case 2
[t4, y4]=ode45(@linear, tspan, c2);

%%  Plot
LW_1=1.4;
FS_ax=16;
FS_leg=10;

%% x1 Condition 1 
figure(1)
plot(tspan, y1(:,1), 'r', 'LineWidth',LW_1);
xlabel('Time(s)')
ylabel('$x_1(t)$', 'Interpreter', 'latex')
title('Initial Condition: $x(0)=3$, $\dot x(0)=4$','Interpreter', 'latex')
ax(1)=gca;
ax(1).YLim=[-4 4];
grid on

%% x2 Condition 1 
figure(2)
plot(tspan, y1(:,2), 'r', 'LineWidth',LW_1);
xlabel('Time(s)')
ylabel('$x_2(t)$', 'Interpreter', 'latex')
title('Initial Condition: $x(0)=3$, $\dot x(0)=4$','Interpreter', 'latex')
ax(2)=gca;
ax(2).YLim=[-8 6];
grid on

%% x1 Condition 2
figure(3)
plot(tspan, y2(:,1), 'r', 'LineWidth',LW_1);
xlabel('Time(s)')
ylabel('$x_1(t)$', 'Interpreter', 'latex')
title('Initial Condition: $x(0)=3.01$, $\dot x(0)=4.01$','Interpreter', 'latex')
ax(3)=gca;
ax(3).YLim=[-4 4];
grid on


%% x2 Condition 2 
figure(4)
plot(tspan, y2(:,2), 'r', 'LineWidth',LW_1);
xlabel('Time(s)')
ylabel('$x_2(t)$', 'Interpreter', 'latex')
title('Initial Condition: $x(0)=3.01$, $\dot x(0)=4.01$','Interpreter', 'latex')
ax(4)=gca;
ax(4).YLim=[-8 6];
grid on

%% Compare x1
figure(5)
plot(tspan, y1(:,1), 'b', 'LineWidth',LW_1)
hold on
plot(tspan, y2(:,1), 'r--', 'LineWidth',LW_1);
xlabel('Time(s)')
ylabel('$x_1(t)$', 'Interpreter', 'latex')
ax(5)=gca;
hs(1)=legend({'Initial Condition: $x(0)=3$,$\dot x(0)=4$', 'Initial Condition: $x(0)=3.01$,$\dot x(0)=4.01$'},'Interpreter','latex','Location','Northeast');
ax(5).YLim=[-4 4];
grid on

%% Compare x2
figure(6)
plot(tspan, y1(:,2), 'b', 'LineWidth',LW_1)
hold on
plot(tspan, y2(:,2), 'r--', 'LineWidth',LW_1);
xlabel('Time(s)')
ylabel('$x_2(t)$', 'Interpreter', 'latex')
ax(6)=gca;
hs(2)=legend({'Initial Condition: $x(0)=3$,$\dot x(0)=4$', 'Initial Condition: $x(0)=3.01$,$\dot x(0)=4.01$'},'Interpreter','latex','Location','Northeast');
ax(6).YLim=[-8 6];
grid on

%% Linear Case 
figure(7)
plot(tspan, y3(:,1), 'b', 'LineWidth',LW_1)
hold on
plot(tspan, y4(:,1), 'r--', 'LineWidth',LW_1);
xlabel('Time(s)')
ylabel('$x_1(t)$', 'Interpreter', 'latex')
ax(7)=gca;
hs(3)=legend({'Initial Condition: $x(0)=3$,$\dot x(0)=4$', 'Initial Condition: $x(0)=3.01$,$\dot x(0)=4.01$'},'Interpreter','latex','Location','Northeast');
ax(7).YLim=[-60 70];
grid on


for i=1:length(ax)
    set(ax(i),'FontSize',FS_ax, 'FontName','Times New Roman')
end

for i = 1:length(hs) 
 set(hs(i),'FontSize',FS_leg) 
end

%% Nonlinear differential equation
function dfdt=nonlinear(t, f)
del_x1=f(2);
del_x2=5*cos(t)-0.1*f(2)-f(1)^3;
dfdt=[del_x1, del_x2]';
end

%% Linear differential equation
function dfdt=linear(t, f)
del_x1=f(2);
del_x2=5*cos(t)-0.1*f(2)-f(1);
dfdt=[del_x1, del_x2]';
end












