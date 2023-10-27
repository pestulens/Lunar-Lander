%% Nonlinear Control HW6_5
clc;
clear;
close all; 

%%
dt = 0.01 ; t_final = 6 ;
t = 0 : dt : t_final ;
x1_0 = 2 ;  % Initial of x1  
x2_0 = 2 ;  % Initial of x2  
x3_0 = 2 ;  % Initial of x3  
X0 = [ x1_0 ; x2_0 ; x3_0 ] ;

%%%%%% 10 arbitrary initial state values %%%%%%%%%%%%%%
xt1 = [9 ; 6 ; 3] ; xt2 = [8 ; 6 ; 4] ; xt3 = [5.5 ; 2 ; -6] ; xt4 = [4 ; 1 ; -4] ; xt5 = [3 ; -3 ; -5] ;
xt6 = [2 ; 5 ; 2.5] ; xt7 = [7 ; 8 ; 4] ; xt8 = [1 ; -2 ; -3] ; xt9 = [-0.5 ; 3 ; 4] ; xt10 = [4 ; 7 ; 3.5] ;
Xt_0 = [ xt1 , xt2 , xt3 , xt4 , xt5 , xt6 , xt7 , xt8 , xt9 , xt10 ] ; 
%% linear System
Z0 = [ x1_0 ; -x1_0+x2_0-x3_0 ; 2*x1_0-2*x2_0+x3_0-x1_0*x3_0] ; % Initial of transformation states Z
Ac = [ 0 1 0 ; 0 0 1 ; 0 0 0 ] ; % Linear system matrix
Bc = [ 0 ; 0 ; 1 ] ; % Linear system input matrix
lambda = [-1,-2,-3] ; %  Poles of closed loop system
K = acker(Ac,Bc,lambda) ; % Output feedback control gain 

%%%%%% 10 arbitrary initial state values %%%%%%%%%%%%%%
for i = 1:10
    Zt_0(:,i) = [ Xt_0(1,i) ; -Xt_0(1,i)+Xt_0(2,i)-Xt_0(3,i) ;  2*Xt_0(1,i)-2*Xt_0(2,i)+Xt_0(3,i)-Xt_0(1,i)*Xt_0(3,i) ] ;
end

%% Plot 1
LW1 = 1.6 ;
LW2 = 1 ;
FS1 = 16 ;
FS_lg = 18 ;

[ t , X ] = RK4( @(t,X) Nonlinear_system(K,X) , [0 t_final], X0 ,dt) ;
x1_c = X(:,1) ; x2_c = X(:,2) ; x3_c = X(:,3) ;
for i = 1 : length(t)
Phi(:,i) = [ x1_c(i) ; -x1_c(i)+x2_c(i)-x3_c(i) ; 2*x1_c(i)-2*x2_c(i)+x3_c(i)-x1_c(i)*x3_c(i)] ;
u_alpha(i) = (-3*x1_c(i)+4*x2_c(i)-2*x3_c(i)+3*x1_c(i)*x3_c(i)-x2_c(i)*x3_c(i)+x1_c(i)^2+x3_c(i)^2)/(x1_c(i)+1) ;
u_beta(i) = -1/(x1_c(i)+1) ;
u_c(i) =  -u_beta(i)*K*Phi(:,i) + u_alpha(i) ;
end

[ t , Z ] = RK4( @(t,Z) Linear_system(K,Ac,Bc,Z) , [0 t_final], Z0 ,dt) ;
z1_c = Z(:,1) ; z2_c = Z(:,2) ; z3_c = Z(:,3) ;

f1 = figure ;
plot(t,x1_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,x2_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
plot(t,x3_c,'-.','Color',[0 0.6 0.7],'LineWidth',LW1) ; 
plot(t,2*exp(-3*t),'r:','LineWidth',LW1+0.2) ;
hs1(1)=legend({'$x_1(t)$','$x_2(t)$','$x_3(t)$'},'Interpreter','latex');
hs1(1)=legend({'$x_1(t)$','$x_2(t)$','$x_3(t)$','2$e^{-3t}$'},'Interpreter','latex');
ax1(1) = gca ;
xlabel('Time (sec)') 
ylabel('States   $\mathbf{x}(t)$','Interpreter','Latex') 
axis([0 t_final -1 2.5])
axis square
grid on

f2 = figure ;
plot(t,z1_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,z2_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
plot(t,z3_c,'-.','Color',[0 0.6 0.7],'LineWidth',LW1) ; 
plot(t,2*exp(-3*t),'r:','LineWidth',LW1+0.2) ;
plot(t,-2*exp(-3*t),'r:','LineWidth',LW1+0.2) 
hs1(2)=legend({'$z_1(t)$','$z_2(t)$','$z_3(t)$'},'Interpreter','latex');
hs1(2)=legend({'$z_1(t)$','$z_2(t)$','$z_3(t)$','$\pm$2$e^{-3t}$'},'Interpreter','latex');
ax1(2) = gca ;
xlabel('Time (sec)') % x label
ylabel('States   $\mathbf{z}(t)$','Interpreter','Latex') % y label
axis([0 t_final -3 3])
axis square
grid on

%%


for i = 1:length(ax1)
    set(ax1(i),'FontSize',FS1,'FontName','Times New Roman')
end

for i = 1:length(hs1)
    set(hs1(i),'FontSize',FS_lg,'FontName','Times New Roman')
end

%% Nonlinear System Function
function dX = Nonlinear_system(K,X)
x1 = X(1) ; x2 = X(2) ; x3 = X(3) ;

Phi = [ x1 ; -x1+x2-x3 ; 2*x1-2*x2+x3-x1*x3] ;
alpha = (-3*x1+4*x2-2*x3+3*x1*x3-x2*x3+x1^2+x3^2)/(x1+1) ;
beta = -1/(x1+1) ;
u = -beta*K*Phi + alpha ;  % Control Input

dx1 = -x1 + x2 - x3 ;
dx2 = -x1*x3 - x2 + u ;
dx3 = -x1 + u ;
dX = [ dx1 ; dx2 ; dx3 ] ;
end

%% Linear System Function
function dZ = Linear_system(K,Ac,Bc,Z)
v = -K*Z ; % Cotrol Input
dZ = Ac*Z + Bc*v ;
end