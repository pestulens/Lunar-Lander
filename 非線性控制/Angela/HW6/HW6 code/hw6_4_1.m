clc; clear; close all;

figure;
tspan = [0:0.01:50];

r = 1;
for d = linspace(0,2*pi,10)
    x0 =[r*sin(d), r*cos(d), 0];
    
    [t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
    plot3(x(:,1),x(:,2),x(:,3),'LineWidth',2);
    hold on
end

% for r = 1
%     for d = linspace(0,2*pi,10)
%         x0 =[-1.5 + r*sin(d), -1.5 + r*cos(d), -2];
%         
%         [t,x] = ode45(@(t,x) odefcn(t,x),tspan,x0);
%         plot3(x(:,1),x(:,2),x(:,3),'LineWidth',2);
%         hold on
%     end
% end


grid on
axis equal

[Y,Z] = meshgrid(-10:10,-10:10);
X = -1*ones(length(Y),1);
surf(X,Y,Z,'FaceAlpha',0.2,'EdgeColor','none','FaceColor','k')

xlabel('x_1');
ylabel('x_2');
zlabel('x_3');
xlim([-2 2])
ylim([-2 2])
zlim([-2 2])
set(gca,'FontSize',14)

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

