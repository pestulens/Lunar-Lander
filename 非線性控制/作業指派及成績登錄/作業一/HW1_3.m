% Nonlinear Control HW1_3
%%
clc;
clear;
close all;

%% Initial Parameter
dt=0.001;
t_final=100;
t=0:dt:t_final;
points=8;
LW=1.5;
FS_ax=16.5;


%% Case 1   (u>0)
u_case_1=1;
r_case_1=0.5;

figure(1)
for i=1:8
    theta1=2*pi/points*i;
    X0_1=[r_case_1;theta1];
    [t1, x1]=RK4(@(t, X0_1) Hopf_bifurcation(t, X0_1, u_case_1), t,  X0_1);
    xx_1=x1(:,1).*cos(x1(:,2));
    yy_1=x1(:,1).*sin(x1(:,2));
    plot(xx_1, yy_1, 'b', 'LineWidth', LW);
    hold on
    plot(xx_1(1),yy_1(1),'ro');
end
xlabel('$x$(t)','Interpreter','latex') 
ylabel('$y$(t)','Interpreter','latex') 
title('Initial Condition: $r_0$ = 0.5, $\mu$=1','Interpreter','latex') 
axis equal 
grid on 
ax(1) = gca ; 
ax(1).YTick = [-1 -0.5 0 0.5 1] ; 
ax(1).XLim=([-1 1]);
ax(1).YLim=([-1 1]);
set(ax(1),'FontSize',FS_ax,'FontName','Times New Roman') 

%% Case 2   (u=0)
u_case_2=0;
r_case_2=0.5;

figure(2)
for i=1:8
    theta2=2*pi/points*i;
    X0_2=[r_case_2;  theta2];
    [t2, x2]=RK4(@(t, X0_2) Hopf_bifurcation(t, X0_2, u_case_2), t,  X0_2);
    xx_2=x2(:,1).*cos(x2(:,2));
    yy_2=x2(:,1).*sin(x2(:,2));
    plot(xx_2, yy_2, 'b', 'LineWidth', LW);
    hold on
    plot(xx_2(1),yy_2(1),'ro');
end
xlabel('$x$(t)','Interpreter','latex') 
ylabel('$y$(t)','Interpreter','latex') 
title('Initial Condition: $r_0$ = 0.5, $\mu$=0','Interpreter','latex') 
axis equal 
grid on 
ax(2) = gca ; 
ax(2).YTick = [-1 -0.5 0 0.5 1] ; 
ax(2).XLim=([-1 1]);
ax(2).YLim=([-1 1]);
set(ax(2),'FontSize',FS_ax,'FontName','Times New Roman') 


%% Case 3   (u<0) 改變r的大小
u_case_3=-1;
r_case_3_1=(-u_case_3/2)^(1/4);
r_case_3_2=(-u_case_3/2)^(1/4)+0.1;
r_case_3_3=(-u_case_3/2)^(1/4)-0.1;

figure(3)
for i=1:8
    theta3=2*pi/points*i;
    X0_3=[r_case_3_1  ;theta3];
    [t3, x3]=RK4(@(t, X0_3) Hopf_bifurcation(t,X0_3, u_case_3), t,  X0_3);
    xx_3=x3(:,1).*cos(x3(:,2));
    yy_3=x3(:,1).*sin(x3(:,2));
    p1=plot(xx_3, yy_3, 'b', 'LineWidth', LW);
    hold on
    plot(xx_3(1),yy_3(1),'bo');
end

for i=1:8
    theta3=2*pi/points*i;
    X0_3=[r_case_3_2  ;theta3];
    [t3, x3]=RK4(@(t, X0_3) Hopf_bifurcation(t, X0_3, u_case_3), t,  X0_3);
    xx_3=x3(:,1).*cos(x3(:,2));
    yy_3=x3(:,1).*sin(x3(:,2));
    p2=plot(xx_3, yy_3, 'r', 'LineWidth', LW);
    hold on
    plot(xx_3(1),yy_3(1),'ro');
    hold on
end

for i=1:8
    theta3=2*pi/points*i;
    X0_3=[r_case_3_3  ;theta3];
    [t3, x3]=RK4(@(t, X0_3) Hopf_bifurcation(t, X0_3, u_case_3), t,  X0_3);
    xx_3=x3(:,1).*cos(x3(:,2));
    yy_3=x3(:,1).*sin(x3(:,2));
    p3=plot(xx_3, yy_3, 'k', 'LineWidth', LW);
    hold on
    plot(xx_3(1),yy_3(1),'ko');
    hold on
end

xlabel('$x$(t)','Interpreter','latex') 
ylabel('$y$(t)','Interpreter','latex') 
legend([p1 p2 p3],{'$r=r_c$','$r>r_c$','$r<r_c$'},'Interpreter','latex')
axis equal 
grid on 
ax(3) = gca ; 
ax(3).YTick = [-1 -0.5 0 0.5 1] ; 
ax(3).XLim=([-1.5 1.5]);
ax(3).YLim=([-1.5 1.5]);
set(ax(3),'FontSize',FS_ax,'FontName','Times New Roman') 


%% Case 4   (u<0) 改變u的大小
r_case_4=0.5;
u_case_4_1=-2*(r_case_4)^4;
u_case_4_2=-2*(r_case_4)^4+0.1;
u_case_4_3=-2*(r_case_4)^4-0.1;

figure(4)
for i=1:8
    theta3=2*pi/points*i;
    X0_3=[r_case_4  ;theta3];
    [t3, x3]=RK4(@(t, X0_3) Hopf_bifurcation(t, X0_3, u_case_4_1), t,  X0_3);
    xx_3=x3(:,1).*cos(x3(:,2));
    yy_3=x3(:,1).*sin(x3(:,2));
    p1=plot(xx_3, yy_3, 'b', 'LineWidth', LW);
    hold on
    plot(xx_3(1),yy_3(1),'bo');
end

for i=1:8
    theta3=2*pi/points*i;
    X0_3=[r_case_4  ;theta3];
    [t3, x3]=RK4(@(t, X0_3) Hopf_bifurcation(t, X0_3, u_case_4_2), t,  X0_3);
    xx_3=x3(:,1).*cos(x3(:,2));
    yy_3=x3(:,1).*sin(x3(:,2));
    p2=plot(xx_3, yy_3, 'r', 'LineWidth', LW);
    hold on
    plot(xx_3(1),yy_3(1),'ro');
    hold on
end

for i=1:8
    theta3=2*pi/points*i;
    X0_3=[r_case_4  ;theta3];
    [t3, x3]=RK4(@(t, X0_3) Hopf_bifurcation(t, X0_3, u_case_4_3), t,  X0_3);
    xx_3=x3(:,1).*cos(x3(:,2));
    yy_3=x3(:,1).*sin(x3(:,2));
    p3=plot(xx_3, yy_3, 'k', 'LineWidth', LW);
    hold on
    plot(xx_3(1),yy_3(1),'ko');
    hold on
end

xlabel('$x$(t)','Interpreter','latex') 
ylabel('$y$(t)','Interpreter','latex') 
legend([p1 p2 p3 ],{'$\mu=\mu_c$','$\mu>\mu_c$','$\mu<\mu_c$'},'Interpreter','latex') 
axis equal 
grid on 
ax(4) = gca ; 
ax(4).YTick = [-1 -0.5 0 0.5 1] ; 
ax(4).XLim=([-1 1]);
ax(4).YLim=([-1 1]);
set(ax(4),'FontSize',FS_ax,'FontName','Times New Roman') 

%% Hopf bifurcation differential equation
function dX=Hopf_bifurcation(t, X, u)
r=X(1);
dr=r*(u+2*r^4);
dtheta=1;
dX=[dr dtheta]';
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

