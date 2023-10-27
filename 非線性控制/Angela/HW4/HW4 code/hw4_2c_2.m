clc; clear; close all;

figure;

x0 = [1,0.9];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',2);
hold on

x0 = [-0.9,-1];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',2);
hold on

x0 = [1.4,-2.4];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',2);
hold on

x0 = [-1.1,-1];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',2);
hold on

x0 = [-2.5,2];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',2);
hold on

x0 = [0.8 1.5];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',2);
hold on

x0 = [2,2];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',2);
hold on

x0 = [-2,-2];
tspan = [0:0.001:10];
[t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(x(:,1),x(:,2),'LineWidth',2);
hold on

x1 = 0.01:0.01:100;
y1 = 1./x1;
x2 = -100:0.01:-0.01;
y2 = 1./x2;
patch([x1 fliplr(x2)], [y1 fliplr(y2)], 'b','facealpha',0.2)

xlabel('x_1')
ylabel('x_2')
grid on
axis([-3,3,-3,3])
legend('(x_1,x_2)=(1,0.9)','(x_1,x_2)=(-0.9,-0.1)','(x_1,x_2)=(1.4,-2.4)',...
    '(x_1,x_2)=(-1.1,-1)','(x_1,x_2)=(-2.5,2)','(x_1,x_2)=(0.8,1.5)',...
    '(x_1,x_2)=(2,2)','(x_1,x_2)=(-2,-2)','Location','southeast')
set(gca,'FontSize',20)

function dxdt = odefcn(t,x)
dxdt = zeros(2,1);

dxdt(1) = -x(1) + 2*x(1)^2*x(2);
dxdt(2) = -x(2);
end