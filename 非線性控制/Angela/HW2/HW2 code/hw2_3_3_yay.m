clear; clc; close all;

para.T=1;
para.K=4;
para.M0=0.2;
para.e0=0.2;

figure;


x0=[2;0];
tspan=[0,10];

[t_1,x_1]=ode45(@(t,x) odefcn1(t,x,para),tspan,x0);
plot(x_1(:,1),x_1(:,2),'r');
hold on;
[t_2,x_2]=ode45(@(t,x) odefcn2(t,x,para),tspan,x0);
plot(x_2(:,1),x_2(:,2),'b');
hold on;
[t_3,x_3]=ode45(@(t,x) odefcn3(t,x,para),tspan,x0);
plot(x_3(:,1),x_3(:,2),'g');
line([0.2 0.2],ylim(),'Color','k','LineStyle','--');  
line([-0.2 -0.2],ylim(),'Color','k','LineStyle','--');  
xlim([-2 4]);
% ylim([-0.8 0.4]);
grid on;
title('Phase-plane of saturated system','FontSize',14);
xlabel('x_1','FontSize',14);
ylabel('x_2','FontSize',14);


function dxdt=odefcn1(t,x,para)
dxdt=zeros(2,1);

T=para.T;
K=para.K;
M0=para.M0;

dxdt(1)=x(2);
dxdt(2)=(-x(2)-K*x(1))/T;
end

function dxdt=odefcn2(t,x,para)
dxdt=zeros(2,1);

T=para.T;
K=para.K;
M0=para.M0;

dxdt(1)=x(2);
dxdt(2)=(-x(2)-K*M0)/T;
end

function dxdt=odefcn3(t,x,para)
dxdt=zeros(2,1);

T=para.T;
K=para.K;
M0=para.M0;

dxdt(1)=x(2);
dxdt(2)=(-x(2)+K*M0)/T;
end