%%  Nonlinear Control HW1 - Q3
clc ; clear ; close all
dt= 0.001 ;
t_final = 100 ;
t = 0 : dt : t_final ;
number = 8 ; 

% ======= case 1 (u>0) =========
u_case1_1 = 1 ; 
r0_case1_1 = 0.5 ;

LW_1 = 1.4 ;
FS_ax = 16 ;
FS_leg = 12 ;
f(1) = figure ;
for i = 1 : number
    theta0 = 2*pi/number*i ;
    X0 = [ r0_case1_1 ; theta0] ;
    [ t_1 , X ] = RK4(@ (t,X) Hopf_bifurcation_system(t , X , u_case1_1) , t , X0 ) ;
    x = X(:,1).*cos(X(:,2)) ;
    y = X(:,1).*sin(X(:,2)) ;
    
    plot(x,y,'b','LineWidth',LW_1) ;
    hold on ;
    plot(x(1),y(1),'ro') ;
end
xlabel('$x$(t)','Interpreter','latex')
ylabel('$y$(t)','Interpreter','latex')
title('Initial Condition: $r_0$ = 0.5','Interpreter','latex')
axis([-1 1 -1 1])
axis equal
grid on 
ax(1) = gca ;
ax(1).YTick = [-1 -0.5 0 0.5 1] ;
set(ax(1),'FontSize',FS_ax,'FontName','Times New Roman')

% ======= case 2 (u=0) =========
u_case2_1 = 0 ;

f(2) = figure ;
for i = 1 : number
    theta0 = 2*pi/number*i ;
    X0 = [ r0_case1_1 ; theta0] ;
    [ t_1 , X ] = RK4(@ (t,X) Hopf_bifurcation_system(t , X , u_case2_1) , t , X0 ) ;
    x = X(:,1).*cos(X(:,2)) ;
    y = X(:,1).*sin(X(:,2)) ;
    
    plot(x,y,'b','LineWidth',LW_1) ;
    hold on ;
    plot(x(1),y(1),'ro') ;
end
xlabel('$x$(t)','Interpreter','latex')
ylabel('$y$(t)','Interpreter','latex')
title('Initial Condition: $r_0$ = 0.5','Interpreter','latex')
axis([-1 1 -1 1])
axis equal
grid on 
ax(2) = gca ;
ax(2).YTick = [-1 -0.5 0 0.5 1] ;
set(ax(2),'FontSize',FS_ax,'FontName','Times New Roman')

% ======= case 3 (u<0) =========
u_case3_1 = -1 ; 
r0_case3_1 = (-u_case3_1/2)^(1/4) ;
r0_case3_2 = (-u_case3_1/2)^(1/4)+0.1 ;
r0_case3_3 = (-u_case3_1/2)^(1/4) -0.1 ;

 f(3) = figure ;
for i = 1 : number
    theta0 = 2*pi/number*i ;
    X0 = [ r0_case3_1 ; theta0] ;
    [ t_1 , X ] = RK4(@ (t,X) Hopf_bifurcation_system(t , X , u_case3_1) , t , X0 ) ;
    x = X(:,1).*cos(X(:,2)) ;
    y = X(:,1).*sin(X(:,2)) ;
    
   p1 =  plot(x,y,'b','LineWidth',LW_1) ;
    hold on ;
    plot(x(1),y(1),'bo') ;
end

for i = 1 : number
    theta0 = 2*pi/number*i ;
    X0 = [ r0_case3_2 ; theta0] ;
    [ t_1 , X ] = RK4(@ (t,X) Hopf_bifurcation_system(t , X , u_case3_1) , t , X0 ) ;
    x = X(:,1).*cos(X(:,2)) ;
    y = X(:,1).*sin(X(:,2)) ;
    
    p2 = plot(x,y,'k','LineWidth',LW_1) ;
    hold on ;
    plot(x(1),y(1),'ko') ;
end

for i = 1 : number
    theta0 = 2*pi/number*i ;
    X0 = [ r0_case3_3 ; theta0] ;
    [ t_1 , X ] = RK4(@ (t,X) Hopf_bifurcation_system(t , X , u_case3_1) , t , X0 ) ;
    x = X(:,1).*cos(X(:,2)) ;
    y = X(:,1).*sin(X(:,2)) ;
    
    p3 = plot(x,y,'g','LineWidth',LW_1) ;
    hold on ;
    plot(x(1),y(1),'go') ;
end
xlabel('$x$(t)','Interpreter','latex')
ylabel('$y$(t)','Interpreter','latex')
legend([p1 p2 p3 ],{'$r=r_c$','$r>r_c$','$r<r_c$'},'Interpreter','latex')
axis([-1.3 1.3 -1.3 1.3])
axis equal
grid on 
ax(3) = gca ;
ax(3).YTick = [-1 -0.5 0 0.5 1] ;
set(ax(3),'FontSize',FS_ax,'FontName','Times New Roman')

% ======= case 4 (u<0) =========
r0_case4_1 = 0.5 ; 
u_case4_1 = -2*(r0_case4_1)^4  ;
u_case4_2 = -2*(r0_case4_1)^4 + 0.1 ; 
u_case4_3 = -2*(r0_case4_1)^4 - 0.1 ;

 f(4) = figure ;
for i = 1 : number
    theta0 = 2*pi/number*i ;
    X0 = [ r0_case4_1 ; theta0] ;
    [ t_1 , X ] = RK4(@ (t,X) Hopf_bifurcation_system(t , X , u_case4_1) , t , X0 ) ;
    x = X(:,1).*cos(X(:,2)) ;
    y = X(:,1).*sin(X(:,2)) ;
    
   p1 =  plot(x,y,'b','LineWidth',LW_1) ;
    hold on ;
    plot(x(1),y(1),'ro') ;
end

for i = 1 : number
    theta0 = 2*pi/number*i ;
    X0 = [ r0_case4_1 ; theta0] ;
    [ t_1 , X ] = RK4(@ (t,X) Hopf_bifurcation_system(t , X , u_case4_2) , t , X0 ) ;
    x = X(:,1).*cos(X(:,2)) ;
    y = X(:,1).*sin(X(:,2)) ;
    
    p2 = plot(x,y,'k','LineWidth',LW_1) ;
    hold on ;
    plot(x(1),y(1),'ro') ;
end

for i = 1 : number
    theta0 = 2*pi/number*i ;
    X0 = [ r0_case4_1 ; theta0] ;
    [ t_1 , X ] = RK4(@ (t,X) Hopf_bifurcation_system(t , X , u_case4_3) , t , X0 ) ;
    x = X(:,1).*cos(X(:,2)) ;
    y = X(:,1).*sin(X(:,2)) ;
    
    p3 = plot(x,y,'g','LineWidth',LW_1) ;
    hold on ;
    plot(x(1),y(1),'ro') ;
end
xlabel('$x$(t)','Interpreter','latex')
ylabel('$y$(t)','Interpreter','latex')
legend([p1 p2 p3 ],{'$\mu=\mu_c$','$\mu>\mu_c$','$\mu<\mu_c$'},'Interpreter','latex')
axis([-1 1 -1 1])
axis equal
grid on 
ax(4) = gca ;
ax(4).YTick = [-1 -0.5 0 0.5 1] ;
set(ax(4),'FontSize',FS_ax,'FontName','Times New Roman')

function dX = Hopf_bifurcation_system(t , X , u_case1_1)
r = X(1) ;
dr = r*(u_case1_1 + 2*(r^4)) ;
dtheta = 1 ;
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