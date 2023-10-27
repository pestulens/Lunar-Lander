%%  Nonlinear Control HW1 - Q3
clc ; clear ; close all
dt= 0.001 ;
t_final = 15 ;
t = 0:dt:t_final ;

T = 1; k = 4; M0 = 0.2; e0 = 0.2;
para = [T, k , M0 , e0];
x = [2,0] ; % e ,e_dot

[T,X] = ode45(@(t,x) ode1(t,x,para),t,x);


LW_1 = 1.4 ;
FS_ax = 16 ;
FS_leg = 14 ;

figure
plot(X(:,1),X(:,2),'b','LineWidth',LW_1)
hold on
grid on
% axis([-2,2,-2,2])
% axis equal
plot([e0,e0],[0.6,-0.8],'r--');
plot([-e0,-e0],[0.6,-0.8],'r--');
xlabel('$e$','interpreter','latex')
ylabel('$\dot e$','interpreter','latex')
ax = gca ;
set(ax,'FontSize',FS_ax,'FontName','Times New Roman')

function dx = ode1(t,x,para)
T = para(1); k = para(2); M0 = para(3); e0 = para(4);
dx = zeros(2,1); %[xa,xb,xc,theta]
if abs(x(1))<=para(4)
 dx(2) =(-x(2)-k*x(1))/T;
 dx(1) =x(2);
elseif x(1)>para(4)
 dx(2) =(-x(2)-k*M0 )/T;
 dx(1) =x(2);
elseif x(1)<-para(4)
 dx(2) =(-x(2)+k*M0 )/T;
 dx(1) =x(2);
end
end