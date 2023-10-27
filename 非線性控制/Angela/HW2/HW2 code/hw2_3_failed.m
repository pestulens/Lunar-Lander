clear; clc; close all;

para.T=1;
para.K=4;
para.M0=0.2;

figure;

for i=0:1:20;
    
    x0_1=2*rand(1,2)-1;
    x0_2=2*rand(1,2)-1;
    x0_3=2*rand(1,2)-1;
    
    tspan=[0,10];
    
    [t,x_1]=ode45(@(t,x) odefcn1(t,x,para),tspan,x0_1);
    [t,x_2]=ode45(@(t,x) odefcn2(t,x,para),tspan,x0_2);
    [t,x_3]=ode45(@(t,x) odefcn3(t,x,para),tspan,x0_3);
    
    if -0.2<x_1<0.2
                
        plot(x_1(:,1),x_1(:,2),'r');
        hold on;
%         line([0 0],ylim(),'Color','k');  %y-axis
%         line(xlim(),[0 0],'Color','k');  %x-axis
%         grid on;
%         title('-e_0<e<e_0','FontSize',14);
%         xlabel('x_1','FontSize',14);
%         ylabel('x_2','FontSize',14);
        
    elseif x_2>0.2
                
        plot(x_2(:,1),x_2(:,2),'r');
        hold on;
%         line([0 0],ylim(),'Color','k');  %y-axis
%         line(xlim(),[0 0],'Color','k');  %x-axis
%         grid on;
%         title('e>e_0','FontSize',14);
%         xlabel('x_1','FontSize',14);
%         ylabel('x_2','FontSize',14);
        
    else x_3<-0.2
                
        plot(x_3(:,1),x_3(:,2),'r');
        hold on;
%         line([0 0],ylim(),'Color','k');  %y-axis
%         line(xlim(),[0 0],'Color','k');  %x-axis
%         grid on;
%         title('e<-e_0','FontSize',14);
%         xlabel('x_1','FontSize',14);
%         ylabel('x_2','FontSize',14);
    end
    
end

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