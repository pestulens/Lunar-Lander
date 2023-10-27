%%  Nonlinear Control HW1 - Q2
clc ; clear ; close all
dT = 0.01 ;
t_final_1 = 100 ; t_final_2 = 1000 ; t_final_3 = 10000 ;
t_1 = 0 : dT : t_final_1 ;
t_2 = 0 : dT : t_final_2 ;
t_3 = 0 : dT : t_final_3 ;
% ===== case 1 ===========
x_0_case1 = 1 ;
y_0_case1 = 1 ;
z_0_case1 = 0 ;
X_0_case1 = [ x_0_case1 ; y_0_case1 ; z_0_case1 ] ;
% ===== case 2 ===========
x_0_case2 = 10 ;
y_0_case2 = 1 ;
z_0_case2 = 0 ;
X_0_case2 = [ x_0_case2 ; y_0_case2 ; z_0_case2 ] ;


[t_1_case1 , X1_case1] = ode45(@ Lorentz_System , t_1 , X_0_case1 ) ;
[t_2_case1 , X2_case1] = ode45(@ Lorentz_System , t_2 , X_0_case1 ) ;
[t_3_case1 , X3_case1] = ode45(@ Lorentz_System , t_3 , X_0_case1 ) ;

[t_1_case2 , X1_case2] = ode45(@ Lorentz_System , t_1 , X_0_case2 ) ;
[t_2_case2 , X2_case2] = ode45(@ Lorentz_System , t_2 , X_0_case2 ) ;
[t_3_case2 , X3_case2] = ode45(@ Lorentz_System , t_3 , X_0_case2 ) ;

LW_1 = 1.3 ;
LW_2 = 1.3 ;
FS_ax = 16.5 ;
FS_leg = 15 ;

f(1) = figure('Units','Normalized','Position',[0.29,0.29,0.477,0.415]) ;
plot3(X3_case1(:,1),X3_case1(:,2),X3_case1(:,3),'g--','LineWidth',LW_1) ;
hold on ;
plot3(X2_case1(:,1),X2_case1(:,2),X2_case1(:,3),'r-.','LineWidth',LW_1) ;
plot3(X1_case1(:,1),X1_case1(:,2),X1_case1(:,3),'b','LineWidth',LW_1) ;
xlabel('$x$(t)','Interpreter','latex')
ylabel('$y$(t)','Interpreter','latex')
zlabel('$z$(t)','Interpreter','latex')
title('Initial Condition: ($x$,$y$,$z$) = (1,1,0)','Interpreter','latex')
ax(1) = gca ;
hs(1) = legend(['T =',num2str(t_final_3)],['T =',num2str(t_final_2)],['T =',num2str(t_final_1)],'Interpreter','latex') ;
grid on

f(2) = figure('Units','Normalized','Position',[0.29,0.29,0.477,0.415]) ;
plot3(X3_case2(:,1),X3_case2(:,2),X3_case2(:,3),'g--','LineWidth',LW_1) ;
hold on ;
plot3(X2_case2(:,1),X2_case2(:,2),X2_case2(:,3),'r-.','LineWidth',LW_1) ;
plot3(X1_case2(:,1),X1_case2(:,2),X1_case2(:,3),'b','LineWidth',LW_1) ;
xlabel('$x$(t)','Interpreter','latex')
ylabel('$y$(t)','Interpreter','latex')
zlabel('$z$(t)','Interpreter','latex')
title('Initial Condition: ($x$,$y$,$z$) = (10,1,0)','Interpreter','latex')
ax(2) = gca ;
hs(2) = legend(['T =',num2str(t_final_3)],['T =',num2str(t_final_2)],['T =',num2str(t_final_1)],'Interpreter','latex') ;
grid on

f(3) = figure ;
plot(t_1_case1,X1_case1(:,1),'g','LineWidth',LW_2) ; hold on ;
plot(t_1_case2,X1_case2(:,1),'b--','LineWidth',LW_2)
xlabel('Time (s)')
ylabel('$x$(t)','Interpreter','latex')
ax(3) = gca ;
legend({'Initial Condition: ($x$,$y$,$z$) = (1,1,0)','Initial Condition: ($x$,$y$,$z$) = (10,1,0)'},'Interpreter','latex','Location','Northeast');
ax(3).YLim = [-25 30];
grid on


for i = 1:length(ax)
    set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman')
end

for i = 1:length(hs)
set(hs(i),'Position',[0.70,0.29,0.15,0.21],'Fontsize',FS_leg)
end
 
function dX = Lorentz_System(t,X)
x = X(1) ; y = X(2) ; z = X(3) ;
dx = 10*(y-x) ;
dy = x*(28-z)-y ;
dz = x*y - 8*z/3 ;
dX = [ dx ; dy ; dz ] ;
end