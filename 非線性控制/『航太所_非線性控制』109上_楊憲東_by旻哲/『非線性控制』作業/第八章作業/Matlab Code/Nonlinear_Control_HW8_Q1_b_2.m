%% Nonlinear Control HW8 - Q1 - (b-2)
clear ; clc ; close all
hz = 2000 ;
dt = 1/hz ; t_final = 6 ;
t = 0 : dt : t_final ;
X_0_1 = [1  ; 2] ; X_0_2 = [2  ; 1] ; X_0_3 = [3  ; -1] ;
X_0_4 = [-1  ; -2] ; X_0_5 = [-2  ; -1] ; X_0_6 = [-3  ; 2] ;
X_0_t = [ X_0_1 , X_0_2 , X_0_3 , X_0_4 , X_0_5 , X_0_6 ] ;
%% Plot 1
LW1 = 1.6 ;
LW2 = 1 ;
FS1 = 16 ;
FS_lg = 15 ;
Dfcolor1 = summer(5) ;
Dfcolor1 = Dfcolor1(1:3,:) ;
Dfcolor2 = bone(6) ;
Dfcolor2 = Dfcolor2(2:4,:) ;
Dfcolor = [Dfcolor1;Dfcolor2] ;

for i = 1:length(X_0_t(1,:))
    [ ts , Xt ] = ode45( @(t,X) NonlinearSystem(X,t) , t, X_0_t(:,i)) ;
%     [ ts , Xt ] = RK4( @(t,X) NonlinearSystem(X,t) , [0 t_final], X_0_t(:,i),dt) ;
    Xt = Xt' ;
    x1 = Xt(1,:) ;
    x2 = Xt(2,:) ;
    X1(i,:) = x1 ;
    X2(i,:) = x2 ;
    
    for k =1:length(ts)
        [dX(:,k) , theta1(k) , theta2(k) , uc(k) , s(:,k) ] = NonlinearSystem(Xt(:,k),t(k)) ;
    end
    st(i,:) = s ;
end

figure(1)
for i = 1:length(X_0_t(1,:))
    plot(ts,X1(i,:),'-','Color',Dfcolor(i,:),'LineWidth',LW1) ; hold on ;  
end
hs1(1)=legend({'test1','test2','test3','test4','test5','test6'},'Interpreter','latex');
ax1(1) = gca ;
xlabel('Time (sec)') % x label
ylabel('States    $x_1$','Interpreter','Latex') % y label
axis normal
grid on

figure(2)
for i = 1:length(X_0_t(1,:))
    plot(ts,X2(i,:),'-','Color',Dfcolor(i,:),'LineWidth',LW1) ; hold on ;
end
hs1(2)=legend({'test1','test2','test3','test4','test5','test6'},'Interpreter','latex');
ax1(2) = gca ;
xlabel('Time (sec)') % x label
ylabel('States    $x_2$','Interpreter','Latex') % y label
axis normal
grid on 

figure(3) ;
for i = 1:length(X_0_t(1,:))
    plot(ts,st(i,:),'-','Color',Dfcolor(i,:),'LineWidth',LW1) ; hold on ;
end
hs1(3)=legend({'test1','test2','test3','test4','test5','test6'},'Interpreter','latex');
ax1(3) = gca ;
axis([0 t_final -6 6])
xlabel('Time (sec)') % x label
ylabel('Sliding Variables  $s$','Interpreter','Latex') % y label
axis normal
grid on
 
 
figure(4) ;
x1s = -4:0.1:4 ;
x2s = -(1+1).*x1s ;
plot(x1s,x2s,'-.','Color',[0.9 0.04 0],'LineWidth',LW2) ; hold on ; 
plot([-5 5],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ; 
plot([0 0],[-5 5],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
for i = 1:length(X_0_t(1,:))
    plot(X1(i,:),X2(i,:),'-','Color',Dfcolor(i,:),'LineWidth',LW1) ; 
    plot(X1(i,1),X2(i,1),'o','Color',Dfcolor(i,:),'LineWidth',LW1) ; 
end
ax1(4) = gca ;
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
axis([ -5.5 5.5 -5.5 5.5 ])
ax1(4).XTick = [-4 -2 0 2 4] ;
ax1(4).YTick = [-4 -2 0 2 4] ;
axis square
grid on

for i = 1:length(ax1)
    set(ax1(i),'FontSize',FS1,'FontName','Times New Roman')
end

for i = 1:length(hs1)
    set(hs1(i),'FontSize',FS_lg,'FontName','Times New Roman')
end

%% Nonlinear System Function
function [dX , theta1 , theta2 , uc , s ] = NonlinearSystem(X,t)
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

