clc; clear; close all;

figure;

x = -5:1:5;
[X,Y] = meshgrid(x);
Z = X.^2./(1+X.^2) + Y.^2;
contour(X,Y,Z,'k','ShowText','on');
hold on

for i = -4:1:4
    for j = -4:1:4
        x0 = [i,j];
        tspan = [0:0.001:10];
        [t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
        plot(x(:,1),x(:,2),'LineWidth',2);
        hold on
    end
end

ax = gca;
ax.XTick = -5:1:5;
ax.YTick = -5:1:5;

axis([-5,5,-5,5])
xlabel('x_1');
ylabel('x_2');
grid on
set(ax,'FontSize',14);

function dxdt = odefcn(t,x)
dxdt = zeros(2,1);

dxdt(1) = -6*x(1) / (1+x(1)^2)^2 + 2*x(2);
dxdt(2) = -2*(x(1)+x(2)) / (1+x(1)^2)^2;
end