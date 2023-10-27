%% Nolinear Control HW4_1
clc;
clear;
close all;

%% Initial Parameter
dt=0.01;
t_final=100;
t=0:dt:t_final;
LW=1.5;
FS_ax=16.5;

%% Plot V_dot range
figure(1)
r=1;
rad=0:pi/100:2*pi;
x_circle=r*cos(rad);
y_circle=r*sin(rad);
plot(x_circle,y_circle, 'k', 'LineWidth', 2)
hold on

%%
c1=[0.5 0.5; -0.5 0.5; 0 -sqrt(2*0.5^2)];
for i=1:size(c1,1)
    [t1, y1]=ode45(@nonlinear, t, c1(i,:));
    plot(y1(:,1),y1(:,2), 'r', 'LineWidth', LW)
    hold on
    plot(y1(1,1), y1(1,2), 'ro')
    hold on
end

c2=[1.1 1.1; -1.1 1.1; 0 -sqrt(2*1.1^2)];
for i=1:size(c2,1)
    [t2, y2]=ode45(@nonlinear, t, c2(i,:));
    plot(y2(:,1),y2(:,2), 'b', 'LineWidth', LW)
    hold on
    plot(y2(1,1), y2(1,2), 'bo')
    hold on
end
xlabel('$x_1$', 'interpreter', 'latex')
ylabel('$x_2$', 'interpreter', 'latex')
text(1,-0.5,'$x_1^2+x_2^2 = 1$','Interpreter','latex','FontSize',16,'Color','k') ; 
ax(1)=gca;
axis equal
set(ax(1), 'XLim', [-3 3], 'YLim', [-3 3])
grid on

%%
for i=1:length(ax)
    set(ax(i),'FontSize',FS_ax, 'FontName','Times New Roman')
end

%% Nonlinear differential equation
function dfdt=nonlinear(t, f)
x1=f(1);
x2=f(2);
del_x1=(x1-x2)*(x1^2+x2^2-1);
del_x2=(x1+x2)*(x1^2+x2^2-1);
dfdt=[del_x1, del_x2]';
end
