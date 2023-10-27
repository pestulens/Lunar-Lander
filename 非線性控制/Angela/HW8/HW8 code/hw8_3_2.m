clc; clear; close all;

para.a = 2;
para.b = 2;

r1 = rand(10,1)*2 - 1;
r2 = rand(10,1)*2 - 1;

tsp = [0 10];

figure;
for r = 1:5:11
    for d = linspace(0,2*pi,6)
        x0 = [r*sin(d),r*cos(d)].';
        
        for i = 1:5
            
            para.theta1 = r1(i)*2;
            para.theta2 = r2(i)*2;
            
            [t,x] = ode45(@(t,x)odefcn(t,x,para),tsp,x0);
            x1 = x(:,1);
            x2 = x(:,2);
            
            plot(x1,x2,'LineWidth',1.2);
            hold on
            
        end
    end
end

grid on
xlabel('x_1')
ylabel('x_2')
title(['a = ',num2str(para.a),', b = ',num2str(para.b)])
set(gca, 'FontSize', 14,'FontName','Times New Roman');

function [dx,u] = odefcn(t,x,para)
dx = zeros(2,1);

a = para.a;
b = para.b;

theta1 = para.theta1;
theta2 = para.theta2;

b_0 = 1;
S = (1 + a)*x(1) + x(2);

u_eq = -x(1) - (1 + a)*x(2);
beta = a*(1 + a)*abs(x(1)) + b*x(2)^2 + b_0;

u = u_eq - beta*sign(S);

dx(1) = x(2) + theta1*x(1)*sin(x(2));
dx(2) = theta2*x(2)^2 + x(1) + u;

end