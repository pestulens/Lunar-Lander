clc; clear; close all;

figure;

tspan = [0:0.01:100];

for r = 2
    for d = linspace(0,2*pi,15)
        x0 = [r*sin(d),r*cos(d)];
        
        [t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
        plot(x(:,1),x(:,2),'b','LineWidth',1.2);
        hold on
        plot(x0(1),x0(2),'ko');
        hold on
        plot(x(10001,1),x(10001,2),'rx','LineWidth',2);
        
        [t,x] = ode45(@(t,x) odefcn1(t,x),tspan,x0);
        plot(x(:,1),x(:,2),'m--','LineWidth',1.2);
        hold on
        plot(x0(1),x0(2),'ko');
        hold on
        plot(x(10001,1),x(10001,2),'rx','LineWidth',2);
    end
end

grid on
axis equal
xlabel('$x_1$','Interpreter','latex');
ylabel('$\xi_1$','Interpreter','latex');
% title(['r = ',num2str(r)])
% ylim([-220 110])
% ylim([-25000 16000])
set(gca,'FontSize',14,'FontName','Times New Roman')

function [dx,u] = odefcn(t,x)
dx = zeros(2,1);

k = 3;

u = 1/(1 + (x(2) - 2)^2)*(-2*x(1)^3 - x(1)*x(2) - 2*x(1)^2*x(2) - k*(x(2) + x(1) + x(1)^2));

dx(1) = -x(1) + x(1)^2 + x(1)*x(2);
dx(2) = x(1) + (1 + (x(2) - 2)^2)*u;


end

function [dx,u] = odefcn1(t,x)
dx = zeros(2,1);

k = 3;

u = 1/(1 + (x(2) - 2)^2)*(-(2*x(1)^2 + x(1)*x(2)) - k*(x(2) + x(1)));

dx(1) = -x(1) + x(1)^2 + x(1)*x(2);
dx(2) = x(1) + (1 + (x(2) - 2)^2)*u;


end
