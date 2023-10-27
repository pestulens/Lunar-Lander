%% Nonlinear Control HW9 - Q1 - (c)
% clear ; clc ; close all
hz = 1000 ;
dt = 1/hz ; t_final = 50 ;
t = 0 : dt : t_final ;
y_0 = 0 ;  % Initial of x1  
ym_0 =  0 ;
Ky_0 = 0 ;
Kf_0 = 0 ;
Kr_0 = 0 ;
X_0 = [ y_0 ; ym_0 ; Ky_0 ; Kf_0 ; Kr_0 ] ;
ap = 1 ; bp = 1 ; cp = -1 ;
gamma1 = 20 ; gamma2 = 10 ; gamma3 = 20 ;
syspara = struct('ap',ap,'bp',bp,'cp',cp,'gamma1',gamma1,'gamma2',gamma2,'gamma3',gamma3) ;
%% Plot 1
LW1 = 1.6 ;
LW2 = 1 ;
FS1 = 16 ;
FS_lg = 18 ;

% [ ts , Xt ] = ode45( @(t,X) NonlinearSystem(X,t,syspara) , t, X_0) ;
[ ts , Xt1 ] = RK4( @(t,X) NonlinearSystem1(X,t,syspara) , [0 t_final], X_0,dt) ;
[ ts , Xt2 ] = RK4( @(t,X) NonlinearSystem2(X,t,syspara) , [0 t_final], X_0,dt) ;
Xt1 = Xt1' ;
Xt2 = Xt2' ;

for i =1:length(ts)
    [dX1(:,i) , uc1(i) , r1(i) ] = NonlinearSystem1(Xt1(:,i),t(i),syspara) ;
end

f1 = figure ;  % 系統輸出和參考模式輸出比較圖
plot(ts,Xt1(1,:),'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(ts,Xt1(2,:),'--','Color',[0.9 0.04 0],'LineWidth',LW1) ; 
hs1(1)=legend({'$y(t)$','$y_m(t)$'},'Interpreter','latex');
ax1(1) = gca ;
xlabel('Time (sec)') % x label
ylabel('Output Response','Interpreter','Latex') % y label
axis([0 t_final 0 1.5])
axis normal
grid on

f2 = figure ;  % 追蹤誤差
plot(ts,Xt1(1,:)-Xt1(2,:),'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
ax1(2) = gca ;
xlabel('Time (sec)') % x label
ylabel('Output Tracking Error $e(t)$','Interpreter','Latex') % y label
axis normal
grid on

f3 = figure ; % control input
plot(ts,uc1,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
ax1(3) = gca ;
xlabel('Time (sec)') % x label
ylabel('Control Input $u(t)$','Interpreter','Latex') % y label
axis normal
grid on

f4 = figure ; 
plot(ts,Xt1(3,:),'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(ts,(ap-4)/bp*ones(length(ts),1),'--','Color',[0.9 0.04 0],'LineWidth',LW1)
hs1(2)=legend({'$\hat{K}_y(t)$','$K_y^*(t)$'},'Interpreter','latex');
ax1(4) = gca ;
xlabel('Time (sec)') % x label
ylabel('Estimated Parameter $K_y$','Interpreter','Latex') % y label
axis([0 t_final -3.5 1])
axis normal
grid on

f5 = figure ;
plot(ts,Xt1(4,:),'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(ts,cp/bp*ones(length(ts),1),'--','Color',[0.9 0.04 0],'LineWidth',LW1)
hs1(3)=legend({'$\hat{K}_f(t)$','$K_f^*(t)$'},'Interpreter','latex');
ax1(5) = gca ;
xlabel('Time (sec)') % x label
ylabel('Estimated Parameter $K_f$','Interpreter','Latex') % y label
axis([0 t_final -1.3 0.5])
axis normal
grid on

f6 = figure ;
plot(ts,Xt1(5,:),'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(ts,4/bp*ones(length(ts),1),'--','Color',[0.9 0.04 0],'LineWidth',LW1)
hs1(4)=legend({'$\hat{K}_r(t)$','$K_r^*(t)$'},'Interpreter','latex');
ax1(6) = gca ;
xlabel('Time (sec)') % x label
ylabel('Estimated Parameter $K_r$','Interpreter','Latex') % y label
axis([0 t_final 0 4.5])
axis normal
grid on

f7 = figure ;
plot(ts,Xt2(1,:)-Xt2(2,:),'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(ts,Xt1(1,:)-Xt1(2,:),'--','Color',[0.9 0.04 0],'LineWidth',LW1) ; 
hs1(5)=legend({'$r(t) = sin(t)$','$r(t) = 1$'},'Interpreter','latex');
ax1(7) = gca ;
xlabel('Time (sec)') % x label
ylabel('Output Tracking Error $e(t)$','Interpreter','Latex') % y label
% axis([0 t_final 0 1.5])
axis normal
grid on

f8 = figure ;
plot(ts,(ap-4)/bp*ones(length(ts),1),'--','Color',[0.5 0.5 0.5],'LineWidth',LW1); hold on ;
plot(ts,Xt2(3,:),'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; 
plot(ts,Xt1(3,:),'-.','Color',[0.9 0.04 0],'LineWidth',LW1) ; 
hs1(6)=legend({'$K^*_y$','$r(t) = sin(t)$','$r(t) = 1$'},'Interpreter','latex');
ax1(8) = gca ;
xlabel('Time (sec)') % x label
ylabel('Estimated Parameter $\hat{K}_y$','Interpreter','Latex') % y label
axis([0 t_final -3.5 1])
axis normal
grid on

f9 = figure ;
plot(ts,cp/bp*ones(length(ts),1),'--','Color',[0.5 0.5 0.5],'LineWidth',LW1); hold on ;
plot(ts,Xt2(4,:),'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; 
plot(ts,Xt1(4,:),'-.','Color',[0.9 0.04 0],'LineWidth',LW1) ; 
hs1(7)=legend({'$K^*_f$','$r(t) = sin(t)$','$r(t) = 1$'},'Interpreter','latex');
ax1(9) = gca ;
xlabel('Time (sec)') % x label
ylabel('Estimated Parameter $\hat{K}_f$','Interpreter','Latex') % y label
axis([0 t_final -1.3 0.5])
axis normal
grid on

f10 = figure ;
plot(ts,4/bp*ones(length(ts),1),'--','Color',[0.5 0.5 0.5],'LineWidth',LW1); hold on ;
plot(ts,Xt2(5,:),'-','Color',[0 0.2 0.7],'LineWidth',LW1) ;
plot(ts,Xt1(5,:),'-.','Color',[0.9 0.04 0],'LineWidth',LW1) ; 
hs1(8)=legend({'$K^*_f$','$r(t) = sin(t)$','$r(t) = 1$'},'Interpreter','latex');
ax1(10) = gca ;
xlabel('Time (sec)') % x label
ylabel('Estimated Parameter $\hat{K}_r$','Interpreter','Latex') % y label
axis([0 t_final 0 4.5])
axis normal
grid on


for i = 1:length(ax1)
    set(ax1(i),'FontSize',FS1,'FontName','Times New Roman')
end

for i = 1:length(hs1)
    set(hs1(i),'FontSize',FS_lg,'FontName','Times New Roman')
end

%% Nonlinear System Function
function [dX , uc , r ] = NonlinearSystem1(X,t,syspara)
    ap = syspara.ap ;
    bp = syspara.bp ;
    cp = syspara.cp ;
    gamma1 = syspara.gamma1 ;
    gamma2 = syspara.gamma2 ;
    gamma3 = syspara.gamma3 ;
    y = X(1) ; ym = X(2) ;
    Ky = X(3) ; Kf = X(4) ; Kr = X(5) ;
    
    %===== Control Input
    r = 1 ;
    e = y-ym ; 
    uc = Ky*y + Kf*sin(y) + Kr*r ;
    dKy = -gamma1*e*y*sign(bp) ;
    dKf = -gamma2*e*sin(y)*sign(bp) ;
    dKr = -gamma3*e*r*sign(bp) ;
    %===== Nonlinear System
    dy = -ap*y - cp*sin(y) + bp*uc ;
    
    %===== Referenc Model
    dym = -4*ym + 4*r ;
        
    dX = [ dy ; dym ; dKy ; dKf ; dKr ] ;
end

function [dX , uc , r ] = NonlinearSystem2(X,t,syspara)
    ap = syspara.ap ;
    bp = syspara.bp ;
    cp = syspara.cp ;
    gamma1 = syspara.gamma1 ;
    gamma2 = syspara.gamma2 ;
    gamma3 = syspara.gamma3 ;
    y = X(1) ; ym = X(2) ;
    Ky = X(3) ; Kf = X(4) ; Kr = X(5) ;
    
    %===== Control Input
    r = sin(t) ;
    e = y-ym ; 
    uc = Ky*y + Kf*sin(y) + Kr*r ;
    dKy = -gamma1*e*y*sign(bp) ;
    dKf = -gamma2*e*sin(y)*sign(bp) ;
    dKr = -gamma3*e*r*sign(bp) ;
    %===== Nonlinear System
    dy = -ap*y - cp*sin(y) + bp*uc ;
    
    %===== Referenc Model
    dym = -4*ym + 4*r ;
        
    dX = [ dy ; dym ; dKy ; dKf ; dKr ] ;
end
