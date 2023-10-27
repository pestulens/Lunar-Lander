clc; clear; close all;

figure;
tspan = [0:0.1:50];

for i = 0.1:0.5:3
    for j = 0.1:0.5:3
        x0 =[i;2;j];
        
        [t,x] = ode45(@(t,x) odefcn(t,x),tspan,[0.5;3;0]);
        plot3(x(:,1),x(:,2),x(:,3),'LineWidth',2);
        hold on
    end
end


grid on
axis equal

% [Y,Z] = meshgrid(-10:10,-10:10);
% X = -1*ones(length(Y),1);
% surf(X,Y,Z,'FaceAlpha',0.2,'EdgeColor','none','FaceColor','k')

xlabel('x_1');
ylabel('x_2');
zlabel('x_3');
xlim([-2 2])
ylim([-2 2])
zlim([-2 2])
set(gca,'FontSize',14)

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

