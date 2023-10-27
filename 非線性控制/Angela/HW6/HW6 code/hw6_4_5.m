clc; clear; close all;

figure;
tspan = [0:0.1:10];

% x0 = [2+0.5*cosd(0:60:360);3*ones(1,7);2+0.5*sind(0:60:360)];
% 
% for i = 1:7
%     [t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0(:,i));
%     plot3(x(:,1),x(:,2),x(:,3),'LineWidth',2);
%     hold on
% end

r = 4;
for d = linspace(0,2*pi,10)
    x0 =[r*sin(d), r*cos(d), 0];
    
    [t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
    plot3(x(:,1),x(:,2),x(:,3),'LineWidth',2);
    hold on
end

grid on
xlabel('x_1');
ylabel('x_2');
zlabel('x_3');
xlim([-3 4])
ylim([-3 4])
zlim([0 3])
set(gca,'FontSize',14)

[Y,Z] = meshgrid(-10:10,-10:10);
X = -1*ones(length(Y),1);
surf(X,Y,Z,'FaceAlpha',0.2,'EdgeColor','none','FaceColor','k')
hold on

[Y1,Z1] = meshgrid(-10:10,-10:10);
X1 = 0*ones(length(Y1),1);
surf(X1,Y1,Z1,'FaceAlpha',0.2,'EdgeColor','none','FaceColor','k')


function [dx,u] = odefcn(t,x)
dx = zeros(3,1);

a = ((6*x(1) - 4*x(1)*x(3) - 8*x(2) + 6*x(3))*(-x(1) + x(2) - x(3)) + (4*x(2) - 8*x(1) - 4*x(3))*(-x(1)*x(3) - x(2))...
    - (4*x(3) - 2*x(1)^2 - 4*x(2) + 6*x(1))*x(1))/(2*x(1)^2 + 2*x(1));
b = 1/(-2*x(1)^2 - 2*x(1));
v = -8*x(1)^2 - 12*(-2*x(1)^2 + 2*x(1)*x(2) - 2*x(1)*x(3)) - ...
    6*(6*x(1)^2 + 2*x(2)^2 + 2*x(3)^2 - 2*x(1)^2*x(3) - 8*x(1)*x(2) - 4*x(2)*x(3) + 6*x(1)*x(3));
u = a + b*v;

dx(1) = -x(1) + x(2) - x(3);
dx(2) = -x(1)*x(3) - x(2) + u;
dx(3) = -x(1) + u;

end