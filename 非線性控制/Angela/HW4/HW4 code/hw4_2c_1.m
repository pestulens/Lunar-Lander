clc; clear; close all;

figure;

x0 = [0.1,1];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',2);
hold on

x0 = [0.5,1];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',2);
hold on

x0 = [0.6,1];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',2);
hold on

x0 = [0.9,1];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',2);
hold on

x0 = [0.99,1];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',2);
hold on

x0 = [1,1];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',2);
hold on

xlabel('x_1')
ylabel('x_2')
grid on
axis([-3,3,-3,3])
% legend('(x_1,x_2)=(-0.5,0.5)')

x1 = 0.01:0.01:100;
y1 = 1./x1;
x2 = -100:0.01:-0.01;
y2 = 1./x2;
patch([x1 fliplr(x2)], [y1 fliplr(y2)], 'b','facealpha',0.25)

function dxdt = odefcn(t,x)
dxdt = zeros(2,1);

dxdt(1) = -x(1) + 2*x(1)^2*x(2);
dxdt(2) = -x(2);
end
