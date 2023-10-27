%% Nonlinear Control HW7 - Q1 - (a)
clear ; clc ; close all
dt = 0.01 ; t_final = 1000 ;
t = 0 : dt : t_final ;
x1_0 = 1.5 ;  % Initial of x1  

%% Plot 1
LW1 = 1.6 ;
LW2 = 1 ;
FS1 = 16 ;
FS_lg = 18 ;

[ t , X1 ] = RK4( @(t,X) NonlinearSystem1(X) , [0 t_final], x1_0 ,dt) ;
[ t , X2 ] = RK4( @(t,X) NonlinearSystem2(X) , [0 t_final], x1_0 ,dt) ;

for i =1:length(t)
    [ dX1(:,i) , phi1(i,1) ] = NonlinearSystem1(X1(i)) ;
    [ dX2(:,i) , phi2(i,1) ] = NonlinearSystem2(X2(i)) ;
end

f1 = figure ;
plot(t,X1,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,phi1,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
hs1(1)=legend({'$\bar{x}_1$','$\bar{\phi}(x_1)=-\bar{x}_1-\bar{x}_1^2$'},'Interpreter','latex');
ax1(1) = gca ;
xlabel('Time (sec)') % x label
ylabel('States    $\bar{x}_1, \bar{\phi} $','Interpreter','Latex') % y label
axis normal
grid on

f2 = figure ;
plot(t,X2,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,phi2,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
hs1(2)=legend({'$\bar{x}_1$','$\bar{\phi}(x_1)=-\bar{x}_1-\bar{x}_1^2$'},'Interpreter','latex');
ax1(2) = gca ;
xlabel('Time (sec)') % x label
ylabel('States    $\bar{x}_1, \bar{\phi} $','Interpreter','Latex') % y label
axis normal
grid on

for i = 1:length(ax1)
    set(ax1(i),'FontSize',FS1,'FontName','Times New Roman')
end

for i = 1:length(hs1)
    set(hs1(i),'FontSize',FS_lg,'FontName','Times New Roman')
end

%% Nonlinear System Function
function [dX , phi] = NonlinearSystem1(X)
    phi = -X-X^2;   
    dX = X^2+X*phi  ;
end

function [dX , phi] = NonlinearSystem2(X)
    phi = -X-X^2;   
    dX = -X +X^2+X*phi  ;
end