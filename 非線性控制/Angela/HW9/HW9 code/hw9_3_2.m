clc; clear; close all;

tsp = [0 500];
x0  = [0 0 0 0 0].';

% opts = odeset('RelTol',1e-8);
% [t,x] = ode45(@(t,y)odefcn(t,y),tsp,y0,opts);
[t,x] = ode45(@(t,x)odefcn(t,x),tsp,x0);

n = length(t);
Ky = -3*ones(n,1);
Kf = -1*ones(n,1);
Kr = 4*ones(n,1);

y = x(:,1);
ym = x(:,2);
e = y - ym;
e_y = x(:,3) - Ky;
e_f = x(:,4) - Kf;
e_r = x(:,5) - Kr;


fig(1) = figure('Position',[100 550 550 400]);
p1 = plot(t,y,t,ym);
ylabel('$y$','Interpreter','latex');
xlabel('Time (s)');
ax(1) = gca;

fig(2) = figure('Position',[100 50 550 400]);
p2 = plot(t,e);
ylabel('$e$','Interpreter','latex');
xlabel('Time (s)');
ax(2) = gca;

fig(3) = figure('Position',[700 550 550 400]);
p3 = plot(t,e_y);
ylabel('$\bar{{K}_y}$','Interpreter','latex');
xlabel('Time (s)');
ax(3) = gca;

fig(4) = figure('Position',[700 50 550 400]);
p4 = plot(t,e_f);
ylabel('$\bar{{K}_f}$','Interpreter','latex');
xlabel('Time (s)');
ax(4) = gca;

fig(5) = figure('Position',[1300 300 550 400]);
p5 = plot(t,e_r);
ylabel('$\bar{{K}_r}$','Interpreter','latex');
xlabel('Time (s)');
ax(5) = gca;

set(ax,'FontSize',14,'FontName','Times New Roman');
set(ax,'XGrid','on','YGrid','on');
set([p1; p2; p3; p4; p5],'LineWidth',1.25);



function [dx,t] = odefcn(t,x)
dx = zeros(5,1);

% x(1) = y;
% x(2) = ym; 
% x(3) = ey;
% x(4) = ef;
% x(5) = er;

r = sin(t);
e = x(1) - x(2);

u = x(3)*x(1) + x(4)*sin(x(1)) + x(5)*r;

dx(1) = -x(1) + sin(x(1)) + u;
dx(2) = -4*x(2) + 4*r;
dx(3) = -e*x(1);
dx(4) = -e*sin(x(1));
dx(5) = -e*r;

end