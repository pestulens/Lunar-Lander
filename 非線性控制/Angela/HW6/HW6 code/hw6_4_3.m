clc; clear; close all;

A = 100;
tspan = [0:0.01:15];
x0 =[1,1,0];

[t_1,x_1] = ode45(@(t,x) odefcn(t,x),tspan,x0);
exp = A*exp(-2*t_1);

[t_2,x_2] = ode45(@(t,x) odefcn1(t,x),tspan,x0);

figure;
subplot(3,1,1);
plot(t_1,x_1(:,1),'LineWidth',1.5);
hold on
plot(t_2,x_2(:,1),'r--','LineWidth',1.5);
ylabel('x_1')
grid on
subplot(3,1,2);
plot(t_1,x_1(:,2),'LineWidth',1.5);
hold on
plot(t_2,x_2(:,2),'r--','LineWidth',1.5);
ylabel('x_2')
grid on
subplot(3,1,3);
plot(t_1,x_1(:,3),'LineWidth',1.5);
hold on
plot(t_2,x_2(:,3),'r--','LineWidth',1.5);
grid on
ylabel('x_3')
xlabel('Time(s)')



function [dx,u] = odefcn(t,x)
dx = zeros(3,1);

a = ((2 - x(3))*(-x(1) + x(2) - x(3)) + 2*(x(1)*x(3) + x(2)) - (1 - x(1))*x(1))/(1 + x(1));
b = 1/(-1 - x(1));
v = -8*x(1) - 12*(-x(1) + x(2) - x(3)) - 6*(2*x(1) - 2*x(2) + x(3) - x(1)*x(2));
u = a + b*v;

dx(1) = -x(1) + x(2) - x(3);
dx(2) = -x(1)*x(3) - x(2) + u;
dx(3) = -x(1) + u;

end

function [dx,u] = odefcn1(t,x)
dx = zeros(3,1);

a = ((4 - 2*x(3))*(-x(1) + x(2) - x(3)) + 4*(x(1)*x(3) + x(2)) - (2 - 2*x(1))*x(1))/(2 + 2*x(1));
b = 1/(-2 - 2*x(1));
v = 2*(-8*x(1) - 12*(-x(1) + x(2) - x(3)) - 6*(2*x(1) - 2*x(2) + x(3) - x(1)*x(2)));
u = a + b*v;

dx(1) = -x(1) + x(2) - x(3);
dx(2) = -x(1)*x(3) - x(2) + u;
dx(3) = -x(1) + u;

end