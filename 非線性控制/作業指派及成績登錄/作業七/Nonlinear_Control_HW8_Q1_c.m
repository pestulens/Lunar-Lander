%% Nonlinear Control HW8 - Q1 - (c)
clear ; clc ; close all
hz = 1000 ;
dt = 1/hz ; t_final =8;
t = 0 : dt : t_final ;
x1_0 = 2 ;  % Initial of x1  
x2_0 =  -1.3 ;
X_0 = [ x1_0 ; x2_0 ] ;
%% Plot 1
LW1 = 1.6 ;
LW2 = 1 ;
FS1 = 16 ;
FS_lg = 18 ;

[ ts , Xt1 ] = ode45( @(t,X) NonlinearSystem1(X,t) , t, X_0) ;
[ ts , Xt2 ] = ode45( @(t,X) NonlinearSystem2(X,t) , t, X_0) ;
% [ ts , Xt1 ] = RK4( @(t,X) NonlinearSystem(X,t) , [0 t_final], X_0,dt) ;
% [ ts , Xt2 ] = RK4( @(t,X) NonlinearSystem(X,t) , [0 t_final], X_0,dt) ;
Xt1 = Xt1' ;
Xt2 = Xt2' ;

for i =1:length(ts)
    [dX1(:,i) , theta1_1(i) , theta1_2(i) , uc1(i) , s1(i) ] = NonlinearSystem1(Xt1(:,i),t(i)) ;
end
for i =1:length(ts)
    [dX2(:,i) , theta2_1(i) , theta2_2(i) , uc2(i) , s2(i) ] = NonlinearSystem2(Xt2(:,i),t(i)) ;
end

f1 = figure ;
plot(ts,Xt1(1,:),'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(ts,Xt1(2,:),'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
hs1(1)=legend({'$x_1(t)$','$x_2(t)$'},'Interpreter','latex');
ax1(1) = gca ;
xlabel('Time (sec)') % x label
ylabel('States    $x_1, x_2 $','Interpreter','Latex') % y label
axis normal
grid on

f2 = figure ;
plot(ts,uc1,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
ax1(2) = gca ;
xlabel('Time (sec)') % x label
ylabel('Control Input $u(t)$','Interpreter','Latex') % y label
axis normal
grid on

f3 = figure ;
plot(ts,s1,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
ax1(3) = gca ;
xlabel('Time (sec)') % x label
ylabel('Sliding Variable $s$','Interpreter','Latex') % y label
axis normal
grid on

f4 = figure ;
plot(ts,theta1_1,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(ts,theta1_2,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
hs1(2)=legend({'$\theta_1$','$\theta_2$'},'Interpreter','latex');
ax1(4) = gca ;
xlabel('Time (sec)') % x label
ylabel('System Uncertainties $\theta_1, \theta_2 $','Interpreter','Latex') % y label
axis([0 t_final -2.2 2.6])
axis normal
grid on

f5 = figure ;
x1_1s = -4:0.1:4 ;
x1_2s = -(1+2).*x1_1s ;
plot(x1_1s,x1_2s,'-.','Color',[0.9 0.04 0],'LineWidth',LW2) ; hold on ;      
plot(Xt1(1,:),Xt1(2,:),'Color',[0 0.2 0.7],'LineWidth',LW1)    
plot(Xt1(1,1),Xt1(2,1),'o','Color',[0 0.2 0.7],'LineWidth',LW2) ; 
plot([-5 5],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot([0 0],[-6 6],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
ax1(5) = gca ;
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
axis([ -3 3 -5 5 ])
axis square
grid on

f6 = figure ;
plot(ts,s2,'-','Color',[0.9 0.04 0],'LineWidth',LW1)  ; hold on ;
plot(ts,s1,'-.','Color',[0 0.2 0.7],'LineWidth',LW1) ; 
hs1(3)=legend({'$a=b=1$','$a=b=2$'},'Interpreter','latex');
ax1(6) = gca ;
xlabel('Time (sec)') % x label
ylabel('Sliding Variables $s$','Interpreter','Latex') % y label
axis normal
grid on

f7 = figure ;
plot(ts,Xt2(1,:),'-','Color',[0.9 0.04 0],'LineWidth',LW1)  ; hold on ;
plot(ts,Xt1(1,:),'-.','Color',[0 0.2 0.7],'LineWidth',LW1) ; 
hs1(4)=legend({'$a=b=1$','$a=b=2$'},'Interpreter','latex');
ax1(7) = gca ;
xlabel('Time (sec)') % x label
ylabel('State  $x_1(t)$','Interpreter','Latex') % y label
axis normal
grid on

f8 = figure ;
plot(ts,Xt2(2,:),'-','Color',[0.9 0.04 0],'LineWidth',LW1)  ; hold on ;
plot(ts,Xt1(2,:),'-.','Color',[0 0.2 0.7],'LineWidth',LW1) ; 
hs1(5)=legend({'$a=b=1$','$a=b=2$'},'Interpreter','latex');
ax1(8) = gca ;
xlabel('Time (sec)') % x label
ylabel('State  $x_2(t)$','Interpreter','Latex') % y label
axis normal
grid on


for i = 1:length(ax1)
    set(ax1(i),'FontSize',FS1,'FontName','Times New Roman')
end

for i = 1:length(hs1)
    set(hs1(i),'FontSize',FS_lg,'FontName','Times New Roman')
end

%% Nonlinear System Function
function [dX , theta1 , theta2 , uc , s ] = NonlinearSystem1(X,t)
    a = 2 ; b = 2 ; 
    b0 = 1 ;
    
    x1 = X(1) ; x2 = X(2) ;
    s = (1+a)*x1 + x2 ;    % Sliding variable 
    %===== Control Input
    beta = a*(1+a)*abs(x1) + b*(x2^2) + b0 ;
    uc = -x1 - (1+a)*x2 - beta*(sign(s)) ;
    
    %===== Nonlinear System
    theta1 = (rand(1)*cos(15*t)+rand(1)*cos(7*t)) ;   % System uncertainty
    theta2 = (-rand(1)*sin(7*t)+rand(1)*sin(20*t)) ;   % System uncertainty
    dx1 = x2 + theta1*x1*sin(x2) ;
    dx2 = theta2*(x2^2) + x1 + uc ;
    dX = [ dx1 ; dx2 ] ;
end

function [dX , theta1 , theta2 , uc , s ] = NonlinearSystem2(X,t)
    a = 1 ; b = 1 ; 
    b0 = 1 ;
    
    x1 = X(1) ; x2 = X(2) ;
    s = (1+a)*x1 + x2 ;    % Sliding variable 
    %===== Control Input
    beta = a*(1+a)*abs(x1) + b*(x2^2) + b0 ;
    uc = -x1 - (1+a)*x2 - beta*(sign(s)) ;
    
    %===== Nonlinear System
    theta1 = 1/2*(rand(1)*cos(15*t)+rand(1)*cos(7*t)) ;   % System uncertainty
    theta2 = 1/2*(-rand(1)*sin(7*t)+rand(1)*sin(20*t)) ;   % System uncertainty
    dx1 = x2 + theta1*x1*sin(x2) ;
    dx2 = theta2*(x2^2) + x1 + uc ;
    dX = [ dx1 ; dx2 ] ;
end


