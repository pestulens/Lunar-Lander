clear; clc; close all;

figure;

for i=-1:0.5:1;
    for j=-1:0.5:1;
        x0=[i,j];

tspan=[0,10];
[t,x]=ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'r');
hold on;
% line([0 0],ylim(),'Color','k');  %y-axis
% line(xlim(),[0 0],'Color','k');  %x-axis
grid on;
title('Stability of limit cycle: stable','FontSize',14);
xlabel('x_1','FontSize',14);
ylabel('x_2','FontSize',14);
axis equal;

    end
end

function dxdt=odefcn(t,x)
dxdt=zeros(2,1);

dxdt(1)=x(2)-x(1)*(x(1)^2+x(2)^2-1);
dxdt(2)=-x(1)-x(2)*(x(1)^2+x(2)^2-1);
end