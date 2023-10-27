%% Nonlinear Control HW6_6
clc;
clear;
close all;

%% 
dt=0.01;
t_final=4;
t=0:dt:t_final;
x1_0=2;
x2_0=2;
x3_0=2;
X0=[x1_0;x2_0;x3_0];
LW1=1.6;
FS1=16;
FS_lg=14;

%%
Ac = [ 0 1 0 ; 0 0 1 ; 0 0 0 ] ; 
Bc = [ 0 ; 0 ; 1 ] ; 
lambda_1 = [-1,-2,-3] ; 
K1 = acker(Ac,Bc,lambda_1) ; 
lambda_2 = [-3,-3,-3] ; 
K2 = acker(Ac,Bc,lambda_2) ; 
lambda_3 = [-10,-10,-10] ; 
K3 = acker(Ac,Bc,lambda_3) ; 

%%
[t1, x1]=RK4( @(t1,x1) Nonlinear_system(K1,x1) , [0 t_final], X0 ,dt);
[t2, x2]=RK4( @(t2,x2) Nonlinear_system(K2,x2) , [0 t_final], X0 ,dt);
[t3, x3]=RK4( @(t3,x3) Nonlinear_system(K3,x3) , [0 t_final], X0 ,dt);
x1_1=x1(:,1); x2_1=x1(:,2); x3_1=x1(:,3); 
x1_2=x2(:,1); x2_2=x2(:,2); x3_2=x2(:,3); 
x1_3=x3(:,1); x2_3=x3(:,2); x3_3=x3(:,3); 

for k = 1 : length(t1)
    Phi_1(:,k) = [ x1_1(k) ; -x1_1(k)+x2_1(k)-x3_1(k) ; 2*x1_1(k)-2*x2_1(k)+x3_1(k)-x1_1(k)*x3_1(k)] ;
    u_alpha_1(k) = (-3*x1_1(k)+4*x2_1(k)-2*x3_1(k)+3*x1_1(k)*x3_1(k)-x2_1(k)*x3_1(k)+x1_1(k)^2+x3_1(k)^2)/(x1_1(k)+1) ;
    u_beta_1(k) = -1/(x1_1(k)+1) ;
    u_1(k) =  -u_beta_1(k)*K1*Phi_1(:,k) + u_alpha_1(k) ;
end

for k = 1 : length(t2)
    Phi_2(:,k) = [ x1_2(k) ; -x1_2(k)+x2_2(k)-x3_2(k) ; 2*x1_2(k)-2*x2_2(k)+x3_2(k)-x1_2(k)*x3_2(k)] ;
    u_alpha_2(k) = (-3*x1_2(k)+4*x2_2(k)-2*x3_2(k)+3*x1_2(k)*x3_2(k)-x2_2(k)*x3_2(k)+x1_2(k)^2+x3_2(k)^2)/(x1_2(k)+1) ;
    u_beta_2(k) = -1/(x1_2(k)+1) ;
    u_2(k)=-u_beta_2(k)*K2*Phi_2(:,k) + u_alpha_2(k) ;
end

for k = 1 : length(t3)
    Phi_3(:,k) = [ x1_3(k) ; -x1_3(k)+x2_3(k)-x3_3(k) ; 2*x1_3(k)-2*x2_3(k)+x3_3(k)-x1_3(k)*x3_3(k)] ;
    u_alpha_3(k) = (-3*x1_3(k)+4*x2_3(k)-2*x3_3(k)+3*x1_3(k)*x3_3(k)-x2_3(k)*x3_3(k)+x1_3(k)^2+x3_3(k)^2)/(x1_3(k)+1) ;
    u_beta_3(k) = -1/(x1_3(k)+1) ;
    u_3(k)=-u_beta_3(k)*K3*Phi_3(:,k) + u_alpha_3(k) ;
end

f1 = figure;
plot(t,x1_1,'-','Color',[0 0.2 0.7],'LineWidth',LW1); hold on
plot(t,x2_1,'--','Color',[0 0.65 0.2],'LineWidth',LW1); hold on
plot(t,x3_1,'-.','Color',[0 0.6 0.7],'LineWidth',LW1); hold on
plot(t,2*exp(-t),'r:','LineWidth',LW1+0.2); hold on
hs(1)=legend({'$x_1(t)$','$x_2(t)$','$x_3(t)$','2$e^{-t}$'},'Interpreter','latex');
ax(1) = gca ;
xlabel('Time (sec)') 
ylabel('States   $\mathbf{x}(t)$','Interpreter','Latex') 
title('($\lambda_1$, $\lambda_2$, $\lambda_3$)=(-1, -2, -3)','Interpreter','latex')
axis([0 t_final -1 2.5])
axis square
grid on

f2 = figure;
plot(t,x1_2,'-','Color',[0 0.2 0.7],'LineWidth',LW1); hold on
plot(t,x2_2,'--','Color',[0 0.65 0.2],'LineWidth',LW1); hold on
plot(t,x3_2,'-.','Color',[0 0.6 0.7],'LineWidth',LW1); hold on
plot(t,2*exp(-t),'r:','LineWidth',LW1+0.2); hold on
hs(2)=legend({'$x_1(t)$','$x_2(t)$','$x_3(t)$','2$e^{-t}$'},'Interpreter','latex');
ax(2) = gca ;
xlabel('Time (sec)') 
ylabel('States   $\mathbf{x}(t)$','Interpreter','Latex') 
title('($\lambda_1$, $\lambda_2$, $\lambda_3$)=(-3, -3, -3)','Interpreter','latex')
axis([0 t_final -1 2.5])
axis square
grid on


f3=figure;
plot(t,u_1,'r','LineWidth',LW1)
hs(3)=legend({'$\mathbf{x}$(0)=(2,2,2)'},'Interpreter','latex');
ax(3) = gca ;
xlabel('Time (sec)') 
ylabel('Control Input $u(\mathbf{x})$','Interpreter','Latex') 
title('($\lambda_1$, $\lambda_2$, $\lambda_3$)=(-1, -2, -3)','Interpreter','latex')
axis([0 t_final -3 0.1])
axis normal
grid on

f4=figure;
plot(t,u_2,'r','LineWidth',LW1)
hs(4)=legend({'$\mathbf{x}$(0)=(2,2,2)'},'Interpreter','latex');
ax(4) = gca ;
xlabel('Time (sec)') 
ylabel('Control Input $u(\mathbf{x})$','Interpreter','Latex') 
title('($\lambda_1$, $\lambda_2$, $\lambda_3$)=(-3, -3, -3)','Interpreter','latex')
axis([0 t_final -3 0.1])
axis normal
grid on

f5 = figure;
plot(t,x1_3,'-','Color',[0 0.2 0.7],'LineWidth',LW1); hold on
plot(t,x2_3,'--','Color',[0 0.65 0.2],'LineWidth',LW1); hold on
plot(t,x3_3,'-.','Color',[0 0.6 0.7],'LineWidth',LW1); hold on
plot(t,2*exp(-t),'r:','LineWidth',LW1+0.2); hold on
hs(5)=legend({'$x_1(t)$','$x_2(t)$','$x_3(t)$','2$e^{-t}$'},'Interpreter','latex');
ax(5) = gca ;
xlabel('Time (sec)') 
ylabel('States   $\mathbf{x}(t)$','Interpreter','Latex') 
title('($\lambda_1$, $\lambda_2$, $\lambda_3$)=(-10, -10, -10)','Interpreter','latex')
% axis([0 t_final -1 2.5])
axis square
grid on

f6=figure;
plot(t,u_3,'r','LineWidth',LW1)
hs(6)=legend({'$\mathbf{x}$(0)=(2,2,2)'},'Interpreter','latex');
ax(6) = gca ;
xlabel('Time (sec)') 
ylabel('Control Input $u(\mathbf{x})$','Interpreter','Latex') 
title('($\lambda_1$, $\lambda_2$, $\lambda_3$)=(-10, -10, -10)','Interpreter','latex')
% axis([0 t_final -3 0.1])
axis normal
grid on

for i = 1:length(ax)
    set(ax(i),'FontSize',FS1,'FontName','Times New Roman')
end
for i = 1:length(hs)
    set(hs(i),'FontSize',FS_lg,'FontName','Times New Roman')
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