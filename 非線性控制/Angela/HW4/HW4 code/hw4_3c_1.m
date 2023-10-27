clc; clear; close all;

figure;

x = -5:0.5:5;
[X,Y] = meshgrid(x);
Z = X.^2./(1+X.^2) + Y.^2;
contour(X,Y,Z,'k','ShowText','on');
hold on

for i = -4:2:4
    for j = -4:2:4
        x0 = [i,j];
        tspan = [0:0.001:10];
        [t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
        plot(x(:,1),x(:,2),'LineWidth',2);
        hold on
    end
end

axis([-5,5,-5,5])
xlabel('x_1');
ylabel('x_2');
grid on
set(gca,'FontSize',14);

function dxdt = odefcn(t,x)
dxdt = zeros(2,1);

dxdt(1) = -6*x(1) / (1+x(1)^2)^2 + 2*x(2);
dxdt(2) = -2*(x(1)+x(2)) / (1+x(1)^2)^2;
end