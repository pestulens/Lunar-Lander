% Nolinear Control HW2_2
clc;
clear;
close all;

%%
t_final=100;
delta_t=0.01;
tspan=0:delta_t:t_final;
FS_ax=14;
LW=1.5;
points=16;
r_1=1;
r_2=1.1;
r_3=0.9;

%% Unstable Limit Cycle
figure(1)
for i=1:points
    theta1=2*pi*i/points;
    c1=[r_1; theta1];
    [t1, y1]=RK4(@odefun1, tspan, c1);
    x_11=y1(:,1).*cos(y1(:,2));
    x_21=y1(:,1).*sin(y1(:,2));
    p1=plot(x_11, x_21, 'r', 'LineWidth', LW);
    hold on
    plot(x_11(1),x_21(1),'ro');
end

for i=1:points
    theta2=2*pi*i/points;
    c2=[r_2; theta2];
    [t2, y2]=RK4(@odefun1, tspan, c2);
    x_21=y2(:,1).*cos(y2(:,2));
    x_22=y2(:,1).*sin(y2(:,2));
    p2=plot(x_21, x_22, 'g', 'LineWidth', LW);
    hold on
    plot(x_21(1),x_22(1),'go');
end

for i=1:points
    theta3=2*pi*i/points;
    c3=[r_3; theta3];
    [t3, y3]=RK4(@odefun1, tspan, c3);
    x_31=y3(:,1).*cos(y3(:,2));
    x_32=y3(:,1).*sin(y3(:,2));
    p3=plot(x_31, x_32, 'b', 'LineWidth', LW);
    hold on
    plot(x_31(1),x_32(1),'bo');
end

axis equal 
grid on 
ax(1) = gca ; 
set(ax(1),'XLim',([-2 2]),'YLim',([-2 2]),'FontSize',FS_ax,'FontName','Times New Roman') 
xlabel('$x_1$(t)','Interpreter','latex')
ylabel('$x_2$(t)','Interpreter','latex')
hs(1) = legend([p1 p2 p3 ],{'$r_0 = 1$','$r_0 = 1.1$','$r_0 = 0.9$'},'Interpreter','latex') ;

%% Semi-stable Limit Cycle
figure(2)
for i=1:points
    theta1=2*pi*i/points;
    c1=[r_1; theta1];
    [t1, y1]=RK4(@odefun2, tspan, c1);
    x_11=y1(:,1).*cos(y1(:,2));
    x_21=y1(:,1).*sin(y1(:,2));
    p1=plot(x_11, x_21, 'r', 'LineWidth', LW);
    hold on
    plot(x_11(1),x_21(1),'ro');
end

for i=1:points
    theta2=2*pi*i/points;
    c2=[r_2; theta2];
    [t2, y2]=RK4(@odefun2, tspan, c2);
    x_21=y2(:,1).*cos(y2(:,2));
    x_22=y2(:,1).*sin(y2(:,2));
    p2=plot(x_21, x_22, 'g', 'LineWidth', LW);
    hold on
    plot(x_21(1),x_22(1),'go');
end

for i=1:points
    theta3=2*pi*i/points;
    c3=[r_3; theta3];
    [t3, y3]=RK4(@odefun2, tspan, c3);
    x_31=y3(:,1).*cos(y3(:,2));
    x_32=y3(:,1).*sin(y3(:,2));
    p3=plot(x_31, x_32, 'b', 'LineWidth', LW);
    hold on
    plot(x_31(1),x_32(1),'bo');
end

axis equal 
grid on 
ax(2) = gca ; 
set(ax(2),'XLim',([-2 2]),'YLim',([-2 2]),'FontSize',FS_ax,'FontName','Times New Roman') 
xlabel('$x_1$(t)','Interpreter','latex')
ylabel('$x_2$(t)','Interpreter','latex')
hs(2) = legend([p1 p2 p3 ],{'$r_0 = 1$','$r_0 = 1.1$','$r_0 = 0.9$'},'Interpreter','latex') ;
%% Stable Limit Cycle
figure(3)
for i=1:points
    theta1=2*pi*i/points;
    c1=[r_1; theta1];
    [t1, y1]=RK4(@odefun3, tspan, c1);
    x_11=y1(:,1).*cos(y1(:,2));
    x_21=y1(:,1).*sin(y1(:,2));
    p1=plot(x_11, x_21, 'r', 'LineWidth', LW);
    hold on
    plot(x_11(1),x_21(1),'ro');
end

for i=1:points
    theta2=2*pi*i/points;
    c2=[r_2; theta2];
    [t2, y2]=RK4(@odefun3, tspan, c2);
    x_21=y2(:,1).*cos(y2(:,2));
    x_22=y2(:,1).*sin(y2(:,2));
    p2=plot(x_21, x_22, 'g', 'LineWidth', LW);
    hold on
    plot(x_21(1),x_22(1),'go');
end

for i=1:points
    theta3=2*pi*i/points;
    c3=[r_3; theta3];
    [t3, y3]=RK4(@odefun3, tspan, c3);
    x_31=y3(:,1).*cos(y3(:,2));
    x_32=y3(:,1).*sin(y3(:,2));
    p3=plot(x_31, x_32, 'b', 'LineWidth', LW);
    hold on
    plot(x_31(1),x_32(1),'bo');
end

axis equal 
grid on 
ax(3) = gca ; 
set(ax(3),'XLim',([-2 2]),'YLim',([-2 2]),'FontSize',FS_ax,'FontName','Times New Roman') 
xlabel('$x_1$(t)','Interpreter','latex')
ylabel('$x_2$(t)','Interpreter','latex')
hs(3) = legend([p1 p2 p3 ],{'$r_0 = 1$','$r_0 = 1.1$','$r_0 = 0.9$'},'Interpreter','latex') ;
%%
function dfdt=odefun1(t,f)
r=f(1);
dr=r*(r^2-1);
dtheta=-1;
dfdt=[dr,dtheta]';
end

function dfdt=odefun2(t,f)
r=f(1);
dr=-r*(r^2-1)^2;
dtheta=-1;
dfdt=[dr,dtheta]';
end

function dfdt=odefun3(t,f)
r=f(1);
dr=-r*(r^2-1);
dtheta=-1;
dfdt=[dr,dtheta]';
end

function [t,y] = RK4(ODESet,TimeSpan,InitialValue,varargin)
% 2019 V1 
% 2020/08/25 V2 
%... User Given 
y0 = InitialValue; 
h = TimeSpan(2)-TimeSpan(1); 
%... RK4 
t = TimeSpan; 
n = size(y0,1); 
y = zeros(n,length(t)); 
y(:,1) = y0; 
for i = 1:length(t)-1 
 yi = y(:,i); 
 ti = t(i); 
 f1 = ODESet(ti,yi); 
 f2 = ODESet(ti+0.5*h,yi+0.5*h*f1); 
 f3 = ODESet(ti+0.5*h,yi+0.5*h*f2); 
 f4 = ODESet(ti+h,yi+h*f3); 
 y(:,i+1) = yi + h*( 1/6*f1 + 1/3*f2 + 1/3*f3 + 1/6*f4 ); 
end 
y = y.'; 
end