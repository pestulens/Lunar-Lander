clc; clear; close all;

figure;

x = -4:0.5:4;
[X,Y] = meshgrid(x);
Z = X.^2./(1+X.^2) + Y.^2;
contour(X,Y,Z,'k','ShowText','on');
hold on

tspan = [0:0.01:100];

for r = 1.55
    for d = linspace(0,2*pi,25)
        x0 = [r*sin(d),r*cos(d)];
        
        [t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
        plot(x(:,1),x(:,2),'LineWidth',2);
        hold on
    end
end

grid on
axis equal
xlabel('x_1');
ylabel('x_2');
% xlim([-3 3])
% ylim([-3 3])
title('r = 1.55')
set(gca,'FontSize',14)

function dxdt = odefcn(t,x)
dxdt = zeros(2,1);

dxdt(1) = -6*x(1) / (1+x(1)^2)^2 + 2*x(2);
dxdt(2) = -2*(x(1)+x(2)) / (1+x(1)^2)^2;
end