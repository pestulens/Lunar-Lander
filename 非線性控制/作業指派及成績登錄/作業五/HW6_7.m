%% Nonlinear Control HW6_7
clc;
clear;
close all;

%%
dt = 0.01 ; t_final = 8 ;
t = 0 : dt : t_final ;
x1_0 = 4 ;  
x2_0 = 1 ;  
x3_0 = 1 ;  
% x1_0 = 2 ;  
% x2_0 = 2 ;  
% x3_0 = 2 ;  
% x1_0 = -0.8 ;  
% x2_0 = 1.5 ;  
% x3_0 = 1 ;  
X0 = [ x1_0 ; x2_0 ; x3_0 ] ;

%% linear System
Ac = [ 0 1 0 ; 0 0 1 ; 0 0 0 ] ; 
Bc = [ 0 ; 0 ; 1 ] ; 
lambda = [-1,-2,-3] ; 
K = acker(Ac,Bc,lambda) ; 

%% Plot 1
LW1 = 1.6 ;
LW2 = 1 ;
FS1 = 16 ;
FS_lg = 18 ;

[ t , X1 ] = RK4( @(t,X) Nonlinear_system1(K,X) , [0 t_final], X0 ,dt) ;
x1_c1 = X1(:,1) ; x2_c1 = X1(:,2) ; x3_c1 = X1(:,3) ;
for i = 1 : length(t)
Phi1(:,i) = [ x1_c1(i) ; -x1_c1(i)+x2_c1(i)-x3_c1(i) ; 2*x1_c1(i)-2*x2_c1(i)+x3_c1(i)-x1_c1(i)*x3_c1(i)] ;
u_alpha1(i) = (-3*x1_c1(i)+4*x2_c1(i)-2*x3_c1(i)+3*x1_c1(i)*x3_c1(i)-x2_c1(i)*x3_c1(i)+x1_c1(i)^2+x3_c1(i)^2)/(x1_c1(i)+1) ;
u_beta1(i) = -1/(x1_c1(i)+1) ;
u_c1(i) =  -u_beta1(i)*K*Phi1(:,i) + u_alpha1(i) ;
end

[ t , X2 ] = RK4( @(t,X) Nonlinear_system2(K,X) , [0 t_final], X0 ,dt) ;
x1_c2 = X2(:,1) ; x2_c2 = X2(:,2) ; x3_c2 = X2(:,3) ;
for i = 1 : length(t)
Phi2(:,i) = [ x1_c2(i)+x1_c2(i)^2 ;...
           -x1_c2(i)+x2_c2(i)-x3_c2(i)-2*x1_c2(i)^2+2*x1_c2(i)*x2_c2(i)-2*x1_c2(i)*x3_c2(i) ;...
           (-1-4*x1_c2(i)+2*x2_c2(i)-2*x3_c2(i))*(-x1_c2(i)+x2_c2(i)-x3_c2(i))+(1+2*x1_c2(i))*(-x1_c2(i)*x3_c2(i)-x2_c2(i))+(1+2*x1_c2(i))*x1_c2(i)] ;
u_alpha2(i) = ((12*x1_c2(i)-8*x2_c2(i)+5*x3_c2(i)-4*x1_c2(i)*x3_c2(i)+1)*(-x1_c2(i)+x2_c2(i)-x3_c2(i))-...
                    (-8*x1_c2(i)+4*x2_c2(i)-4*x3_c2(i)-2)*(x1_c2(i)*x3_c2(i)+x2_c2(i))-...
                    (5*x1_c2(i)-4*x2_c2(i)+4*x3_c2(i)-2*x1_c2(i)^2+1)*x1_c2(i))/((2*x1_c2(i)+1)*(x1_c2(i)+1)) ;
u_beta2(i) = -1/((2*x1_c2(i)+1)*(x1_c2(i)+1)) ;

u_c2(i) =  -u_beta2(i)*K*Phi2(:,i) + u_alpha2(i) ;
end

f1 = figure ;
plot(t,u_c1,'Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on
plot(t,u_c2,'--','Color',[0.9 0.04 0],'LineWidth',LW1)
xlabel('Time (sec)')
ylabel('Control Input $u(\mathbf{x})$','Interpreter','Latex') 
xlim([0 t_final])
% ylim([-5 5])
hs1(1)=legend({'$\phi_1 = x_1$','$\phi_1 = x_1^2 +  x_1$'},'Interpreter','latex');
ax1(1) = gca ;
axis normal
grid on

for i = 1:length(ax1)
    set(ax1(i),'FontSize',FS1,'FontName','Times New Roman')
end

for i = 1:length(hs1)
    set(hs1(i),'FontSize',FS_lg,'FontName','Times New Roman')
end

%%
f2 = figure ; 
set(f2,'Position',[680,190,593,788])
subplot(3,1,1)
plot(t,x1_c1,'-','Color',[0 0.2 0.7],'LineWidth',LW1+0.15) ; hold on ;
plot(t,x1_c2,'--','Color',[0.9 0.04 0],'LineWidth',LW1+0.15) ; 
hs2(1)=legend({'$\phi_1 = x_1$','$\phi_1 = x_1^2 +  x_1$'},'Interpreter','latex');
ax2(1) = gca ;
set(ax2(1),'Position',[0.1230 , 0.72 , 0.8088 , 0.2426])
xlabel('Time (sec)') 
ylabel('$x_1$(t)','Interpreter','Latex') 
xlim([0 t_final])
ylim([-1 4.5])
grid on

subplot(3,1,2)
plot(t,x2_c1,'-','Color',[0 0.2 0.7],'LineWidth',LW1+0.15) ; hold on ;
plot(t,x2_c2,'--','Color',[0.9 0.04 0],'LineWidth',LW1+0.15) ; 
hs2(2)=legend({'$\phi_1 = x_1$','$\phi_1 = x_1^2 +  x_1$'},'Interpreter','latex');
ax2(2) = gca ;
set(ax2(2),'Position',[0.1230 , 0.4 , 0.8088 , 0.2426])
xlabel('Time (sec)') 
ylabel('$x_2$(t)','Interpreter','Latex') 
xlim([0 t_final])
ylim([-1 4.5])
grid on

subplot(3,1,3)
plot(t,x3_c1,'-','Color',[0 0.2 0.7],'LineWidth',LW1+0.15) ; hold on ;
plot(t,x3_c2,'--','Color',[0.9 0.04 0],'LineWidth',LW1+0.15) ; 
hs2(3)=legend({'$\phi_1 = x_1$','$\phi_1 = x_1^2 +  x_1$'},'Interpreter','latex');
ax2(3) = gca ;
xlabel('Time (sec)') 
ylabel('$x_3$(t)','Interpreter','Latex') 
set(ax2(3),'Position',[0.1230 , 0.08 , 0.8088 , 0.2426])
xlim([0 t_final])
ylim([-1 4.5])
grid on

for i = 1:length(ax2)
    set(ax2(i),'FontSize',FS1,'FontName','Times New Roman')
end

for i = 1:length(hs2)
    set(hs2(i),'FontSize',16,'FontName','Times New Roman')
end
%% Nonlinear System Function
function dX = Nonlinear_system1(K,X)
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

function dX = Nonlinear_system2(K,X)
x1 = X(1) ; x2 = X(2) ; x3 = X(3) ;

Phi = [ x1+x1^2 ;...
           -x1+x2-x3-2*x1^2+2*x1*x2-2*x1*x3 ;...
           (-1-4*x1+2*x2-2*x3)*(-x1+x2-x3)+(1+2*x1)*(-x1*x3-x2)+(1+2*x1)*x1] ;
alpha = ((12*x1-8*x2+5*x3-4*x1*x3+1)*(-x1+x2-x3)-(-8*x1+4*x2-4*x3-2)*(x1*x3+x2)-(5*x1-4*x2+4*x3-2*x1^2+1)*x1)/((2*x1+1)*(x1+1)) ;
beta = -1/((2*x1+1)*(x1+1)) ;
u = -beta*K*Phi + alpha ;  % Control Input

dx1 = -x1 + x2 - x3 ;
dx2 = -x1*x3 - x2 + u ;
dx3 = -x1 + u ;
dX = [ dx1 ; dx2 ; dx3 ] ;
end