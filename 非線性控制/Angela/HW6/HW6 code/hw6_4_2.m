clc; clear; close all;

syms x1 x2 x3
% expand((-4*x1+2*x2-2*x3)*(-x1+x2-x3)+2*x1*(-x1*x3-x2)+2*x1*x1)
% expand(-2*(-x1+x2-x3)+2*(-x1*x3-x2)-2*(-x1))

A = 10000;
tspan = [0:0.01:15];
x0 =[1,1,0];

[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
exp = A*exp(-2*t);

x1_int = find(exp-x(:,1)<0,1);
x1_t = t(x1_int);
x1_value = x(x1_int,1);
x2_int = find(exp-x(:,2)<0,1);
x2_t = t(x2_int);
x2_value = x(x2_int,1);
x3_int = find(exp-x(:,3)<0,1);
x3_t = t(x3_int);
x3_value = x(x3_int,1);

figure;
subplot(3,1,1);
plot(t,x(:,1),'LineWidth',1.5);
hold on
plot(t,exp,'r--','LineWidth',1.2);
hold on
plot(x1_t,x1_value,'kx','LineWidth',1.8)
ylabel('x_1')
grid on
subplot(3,1,2);
plot(t,x(:,2),'LineWidth',1.5);
hold on
plot(t,exp,'r--','LineWidth',1.2);
hold on
plot(x2_t,x2_value,'kx','LineWidth',1.8)
ylabel('x_2')
grid on
subplot(3,1,3);
plot(t,x(:,3),'LineWidth',1.5);
hold on
plot(t,exp,'r--','LineWidth',1.2);
hold on
plot(x3_t,x3_value,'kx','LineWidth',1.8)
ylabel('x_3')
xlabel('Time(s)')
grid on




% xlabel('x_1');
% ylabel('x_2');
% zlabel('x_3');
% xlim([-2 2])
% ylim([-2 2])
% zlim([-2 3])
% set(gca,'FontSize',14)

function [dx,u] = odefcn(t,x)
dx = zeros(3,1);

a = ((4 - 2*x(3))*(-x(1) + x(2) - x(3)) + 4*(x(1)*x(3) + x(2)) - (2 - 2*x(1))*x(1))/(2 + 2*x(1));
b = 1/(-2 - 2*x(1));
v = 2*(-8*x(1) - 12*(-x(1) + x(2) - x(3)) - 6*(2*x(1) - 2*x(2) + x(3) - x(1)*x(2)));
u = a + b*v;

dx(1) = -x(1) + x(2) - x(3);
dx(2) = -x(1)*x(3) - x(2) + u;
dx(3) = -x(1) + u;

end