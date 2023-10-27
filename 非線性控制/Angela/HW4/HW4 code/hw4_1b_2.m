clc; clear; close all;

figure;

i = 1;
j = 1;
x0 = [i,j];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',1.5);
hold on;

i = 1;
j = -1;
x0 = [i,j];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',1.5);
hold on;

i = -1;
j = 1;
x0 = [i,j];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',1.5);
hold on;

grid on;
xlabel('x_1');
ylabel('x_2');
set(gca,'FontSize',14);

function dxdt = odefcn(t,x)
dxdt = zeros(2,1);

dxdt(1) = (x(1)-x(2))*(x(1)^2+x(2)^2-1);
dxdt(2) = (x(1)+x(2))*(x(1)^2+x(2)^2-1);
end