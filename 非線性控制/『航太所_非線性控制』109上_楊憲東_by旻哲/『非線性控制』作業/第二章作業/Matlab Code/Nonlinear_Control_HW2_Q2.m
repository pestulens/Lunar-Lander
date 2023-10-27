%%  Nonlinear Control HW2 - Q2
clc ; clear ; close all
dt= 0.001 ;
t_final_1 = 100 ;
t_1 = 0 : dt : t_final_1 ;
t_final_2 = 5 ;
t_2 = 0 : dt : t_final_2 ;
t_final_3 = 0.5 ;
t_3 = 0 : dt : t_final_3 ;


r0_1 = 1 ;
r0_2 = 0.9 ;
r0_3 = 1.1 ;

theta0 = pi/10 ;
X0_1 = [ r0_1 ; theta0] ;
X0_2 = [ r0_2 ; theta0] ;
X0_3 = [ r0_3 ; theta0] ;
[ t_1_1 , X1_1 ] = RK4(@ Nonlinear_system1, t_1 , X0_1 ) ;
[ t_1_2 , X1_2 ] = RK4(@ Nonlinear_system1, t_1 , X0_2 ) ;
[ t_1_3 , X1_3 ] = RK4(@ Nonlinear_system1, t_3 , X0_3 ) ;
x1_1_1 = X1_1(:,1).*cos(X1_1(:,2)) ;
x2_1_1 = X1_1(:,1).*sin(X1_1(:,2)) ;
x1_1_2 = X1_2(:,1).*cos(X1_2(:,2)) ;
x2_1_2 = X1_2(:,1).*sin(X1_2(:,2)) ;
x1_1_3 = X1_3(:,1).*cos(X1_3(:,2)) ;
x2_1_3 = X1_3(:,1).*sin(X1_3(:,2)) ;

[ t_2_1 , X2_1 ] = RK4(@ Nonlinear_system2, t_1 , X0_1 ) ;
[ t_2_2 , X2_2 ] = RK4(@ Nonlinear_system2, t_1 , X0_2 ) ;
[ t_2_3 , X2_3 ] = RK4(@ Nonlinear_system2, t_1 , X0_3 ) ;
x1_2_1 = X2_1(:,1).*cos(X2_1(:,2)) ;
x2_2_1 = X2_1(:,1).*sin(X2_1(:,2)) ;
x1_2_2 = X2_2(:,1).*cos(X2_2(:,2)) ;
x2_2_2 = X2_2(:,1).*sin(X2_2(:,2)) ;
x1_2_3 = X2_3(:,1).*cos(X2_3(:,2)) ;
x2_2_3 = X2_3(:,1).*sin(X2_3(:,2)) ;

[ t_3_1 , X3_1 ] = RK4(@ Nonlinear_system3, t_1 , X0_1 ) ;
[ t_3_2 , X3_2 ] = RK4(@ Nonlinear_system3, t_1 , X0_2 ) ;
[ t_3_3 , X3_3 ] = RK4(@ Nonlinear_system3, t_1 , X0_3 ) ;
x1_3_1 = X3_1(:,1).*cos(X3_1(:,2)) ;
x2_3_1 = X3_1(:,1).*sin(X3_1(:,2)) ;
x1_3_2 = X3_2(:,1).*cos(X3_2(:,2)) ;
x2_3_2 = X3_2(:,1).*sin(X3_2(:,2)) ;
x1_3_3 = X3_3(:,1).*cos(X3_3(:,2)) ;
x2_3_3 = X3_3(:,1).*sin(X3_3(:,2)) ;


LW_1 = 1.4 ;
FS_ax = 16 ;
FS_leg = 14 ;

f(1) = figure ;
p1 = plot(x1_1_1,x2_1_1,'b','LineWidth',LW_1) ;
hold on ;
plot(x1_1_1(1),x2_1_1(1),'bo') ;
p2 = plot(x1_1_2,x2_1_2,'r','LineWidth',LW_1) ;
plot(x1_1_2(1),x2_1_2(1),'ro') ;
hold on ;
p3 = plot(x1_1_3,x2_1_3,'g','LineWidth',LW_1) ;
plot(x1_1_3(1),x2_1_3(1),'go') ;
xlabel('$x_1$(t)','Interpreter','latex')
ylabel('$x_2$(t)','Interpreter','latex')
axis([-1.5 2 -1.5 1.5])
axis equal
grid on 
ax(1) = gca ;
% ax(1).YTick = [-1 -0.5 0 0.5 1] ;
hs(1) = legend([p1 p2 p3 ],{'$r_0 = 1$','$r_0 = 0.9$','$r_0 = 1.1$'},'Interpreter','latex') ;
set(ax(1),'FontSize',FS_ax,'FontName','Times New Roman')
set(hs(1),'FontSize',FS_leg)

f(2) = figure ;
p6 = plot(x1_2_3,x2_2_3,'g','LineWidth',LW_1) ;
hold on ;
plot(x1_2_3(1),x2_2_3(1),'go') ;
plot(x1_2_1(1),x2_2_1(1),'bo') ;
hold on ;
p5 = plot(x1_2_2,x2_2_2,'r','LineWidth',LW_1) ;
plot(x1_2_2(1),x2_2_2(1),'ro') ;
p4 = plot(x1_2_1,x2_2_1,'b','LineWidth',LW_1) ;
xlabel('$x_1$(t)','Interpreter','latex')
ylabel('$x_2$(t)','Interpreter','latex')
axis([-1.5 2 -1.5 1.5])
axis equal
grid on 
ax(2) = gca ;
% ax(1).YTick = [-1 -0.5 0 0.5 1] ;
hs(2) = legend([p4 p5 p6 ],{'$r_0 = 1$','$r_0 = 0.9$','$r_0 = 1.1$'},'Interpreter','latex') ;
set(ax(2),'FontSize',FS_ax,'FontName','Times New Roman')
set(hs(2),'FontSize',FS_leg)

f(3) = figure ;
p9 = plot(x1_3_3,x2_3_3,'g','LineWidth',LW_1) ;
hold on ;
plot(x1_3_3(1),x2_3_3(1),'go') ;
plot(x1_3_1(1),x2_3_1(1),'bo') ;
hold on ;
p8 = plot(x1_3_2,x2_3_2,'r','LineWidth',LW_1) ;
plot(x1_3_2(1),x2_3_2(1),'ro') ;
p7 = plot(x1_3_1,x2_3_1,'b','LineWidth',LW_1) ;
xlabel('$x_1$(t)','Interpreter','latex')
ylabel('$x_2$(t)','Interpreter','latex')
axis([-1.5 2 -1.5 1.5])
axis equal
grid on 
ax(3) = gca ;
% ax(1).YTick = [-1 -0.5 0 0.5 1] ;
hs(3) = legend([p7 p8 p9 ],{'$r_0 = 1$','$r_0 = 0.9$','$r_0 = 1.1$'},'Interpreter','latex') ;
set(ax(3),'FontSize',FS_ax,'FontName','Times New Roman')
set(hs(3),'FontSize',FS_leg)


function dX = Nonlinear_system1(t , X)
r = X(1) ;
dr = r*(r^2-1) ;
dtheta = -1 ;
dX = [dr ; dtheta] ;
end

function dX = Nonlinear_system2(t , X)
r = X(1) ;
dr = -r*(r^2-1)^2 ;
dtheta = -1 ;
dX = [dr ; dtheta] ;
end

function dX = Nonlinear_system3(t , X)
r = X(1) ;
dr = -r*(r^2-1) ;
dtheta = -1 ;
dX = [dr ; dtheta] ;
end

function [t,y] = RK4(ODESet,TimeSpan,InitialValue,varargin)
% 2019       V1
% 2020/08/25 V2
%... User Given
y0 = InitialValue;
h  = TimeSpan(2)-TimeSpan(1);
%... RK4
t = TimeSpan;
n = size(y0,1);
y = zeros(n,length(t));
y(:,1) = y0;
for i = 1:length(t)-1
    yi = y(:,i);
    ti = t(i);
    f1 = ODESet(ti,yi);
    f2 = ODESet(ti+0.5*h,yi+0.5*h*f1);
    f3 = ODESet(ti+0.5*h,yi+0.5*h*f2);
    f4 = ODESet(ti+h,yi+h*f3);
    y(:,i+1) = yi + h*( 1/6*f1 + 1/3*f2 + 1/3*f3 + 1/6*f4 );
end
y = y.';
end