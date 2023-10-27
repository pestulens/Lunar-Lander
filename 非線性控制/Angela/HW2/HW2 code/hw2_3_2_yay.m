clear; clc; close all;

para.T=1;
para.K=4;
para.M0=0.2;
para.e0=0.2;

figure;


x0=[2;0];
tspan=[0,10];

[t_1,x_1]=ode45(@(t,x) odefcn(t,x,para),tspan,x0);
plot(x_1(:,1),x_1(:,2),'r');
line([0.2 0.2],ylim(),'Color','k','LineStyle','--');  
line([-0.2 -0.2],ylim(),'Color','k','LineStyle','--');  
xlim([-0.5 2]);
ylim([-0.8 0.4]);
grid on;
title('Phase-plane of saturated system','FontSize',14);
xlabel('x_1','FontSize',14);
ylabel('x_2','FontSize',14);



function dxdt=odefcn(t,x,para)
dxdt=zeros(2,1);

T=para.T;
K=para.K;
M0=para.M0;

if abs(x(1,1))<=para.e0
    
    dxdt(1)=x(2);
    dxdt(2)=(-x(2)-K*x(1))./T;
    
elseif x(1,1)>para.e0
    dxdt(1)=x(2);
    dxdt(2)=(-x(2)-K*M0)./T;
    
else
    dxdt(1)=x(2);
    dxdt(2)=(-x(2)+K*M0)./T;
    
end
end
