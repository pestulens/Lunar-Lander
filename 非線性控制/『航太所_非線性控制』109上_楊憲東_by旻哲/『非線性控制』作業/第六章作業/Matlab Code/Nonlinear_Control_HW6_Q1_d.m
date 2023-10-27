%% Nonlinear Control HW6 - Q1 - (d)
clear ; clc ; close all
dt = 0.01 ; t_final = 6 ;
t = 0 : dt : t_final ;
x1_0 = -0.8 ;  % Initial of x1  
x2_0 = 1.5 ;  % Initial of x2  
x3_0 = 1 ;  % Initial of x3  
X0 = [ x1_0 ; x2_0 ; x3_0 ] ;

%% linear System
Z01 = [ x1_0 ; -x1_0+x2_0-x3_0 ; 2*x1_0-2*x2_0+x3_0-x1_0*x3_0] ; % Initial of transformation states Z
Z02 = [ x1_0+x1_0^2 ;...
           -x1_0+x2_0-x3_0-2*x1_0^2+2*x1_0*x2_0-2*x1_0*x3_0 ;...
           (-1-4*x1_0+2*x2_0-2*x3_0)*(-x1_0+x2_0-x3_0)+(1+2*x1_0)*(-x1_0*x3_0-x2_0)+(1+2*x1_0)*x1_0] ; % Initial of transformation states Z
Ac = [ 0 1 0 ; 0 0 1 ; 0 0 0 ] ; % Linear system matrix
Bc = [ 0 ; 0 ; 1 ] ; % Linear system input matrix
lambda = [-2,-2,-2] ; %  Poles of closed loop system
K = acker(Ac,Bc,lambda) ; % Output feedback control gain 

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
[ t , Z1 ] = RK4( @(t,Z) Linear_system1(K,Ac,Bc,Z) , [0 t_final], Z01 ,dt) ;
z1_c1 = Z1(:,1) ; z2_c1 = Z1(:,2) ; z3_c1 = Z1(:,3) ;


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

[ t , Z2 ] = RK4( @(t,Z) Linear_system2(K,Ac,Bc,Z) , [0 t_final], Z02 ,dt) ;
z1_c2 = Z2(:,1) ; z2_c2 = Z2(:,2) ; z3_c2 = Z2(:,3) ;

f1 = figure ;
plot(t,x1_c1,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,x2_c1,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
plot(t,x3_c1,'-.','Color',[0 0.6 0.7],'LineWidth',LW1) ; 
hs1(1)=legend({'$x_1(t)$','$x_2(t)$','$x_3(t)$'},'Interpreter','latex');
ax1(1) = gca ;
xlabel('Time (sec)') % x label
ylabel('States   $\mathbf{x}(t)$','Interpreter','Latex') % y label
% axis([0 t_final -1 2.5])
axis square
grid on

f2 = figure ;
plot(t,u_c1,'b','LineWidth',LW1)
ax1(2) = gca ;
xlabel('Time (sec)') % x label
ylabel('Control Input $u(\mathbf{x})$','Interpreter','Latex') % y label
axis normal
grid on

f3 = figure ;
plot(t,z1_c1,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,z2_c1,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
plot(t,z3_c1,'-.','Color',[0 0.6 0.7],'LineWidth',LW1) ; 
hs1(2)=legend({'$z_1(t)$','$z_2(t)$','$z_3(t)$'},'Interpreter','latex');
ax1(3) = gca ;
xlabel('Time (sec)') % x label
ylabel('States   $\mathbf{z}(t)$','Interpreter','Latex') % y label
% axis([0 t_final -3 3])
axis square
grid on

f4 = figure ;
plot(t,x1_c2,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,x2_c2,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
plot(t,x3_c2,'-.','Color',[0 0.6 0.7],'LineWidth',LW1) ; 
hs1(3)=legend({'$x_1(t)$','$x_2(t)$','$x_3(t)$'},'Interpreter','latex');
ax1(4) = gca ;
xlabel('Time (sec)') % x label
ylabel('States   $\mathbf{x}(t)$','Interpreter','Latex') % y label
% axis([0 t_final -1 2.5])
axis square
grid on

f5 = figure ;
plot(t,u_c2,'b','LineWidth',LW1)
ax1(5) = gca ;
xlabel('Time (sec)') % x label
ylabel('Control Input $u(\mathbf{x})$','Interpreter','Latex') % y label
axis normal
grid on

f6 = figure ;
plot(t,z1_c2,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,z2_c2,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
plot(t,z3_c2,'-.','Color',[0 0.6 0.7],'LineWidth',LW1) ; 
hs1(4)=legend({'$z_1(t)$','$z_2(t)$','$z_3(t)$'},'Interpreter','latex');
ax1(6) = gca ;
xlabel('Time (sec)') % x label
ylabel('States   $\mathbf{z}(t)$','Interpreter','Latex') % y label
% axis([0 t_final -3 3])
axis square
grid on

f7 = figure ;
plot(t,u_c1,'Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on
plot(t,u_c2,'--','Color',[0.9 0.04 0],'LineWidth',LW1)
xlabel('Time (sec)') % x label
ylabel('Control Input $u(\mathbf{x})$','Interpreter','Latex') % y label
% axis([0 t_final -1 2])
hs1(5)=legend({'$\phi_1 = x_1$','$\phi_1 = x_1^2 +  x_1$'},'Interpreter','latex');
ax1(7) = gca ;
axis normal
grid on

for i = 1:length(ax1)
    set(ax1(i),'FontSize',FS1,'FontName','Times New Roman')
end

for i = 1:length(hs1)
    set(hs1(i),'FontSize',FS_lg,'FontName','Times New Roman')
end

f8 = figure ; 
set(f8,'Position',[680,190,593,788])
subplot(3,1,1)
plot(t,x1_c1,'-','Color',[0 0.2 0.7],'LineWidth',LW1+0.15) ; hold on ;
plot(t,x1_c2,'--','Color',[0.9 0.04 0],'LineWidth',LW1+0.15) ; 
hs2(1)=legend({'$\phi_1 = x_1$','$\phi_1 = x_1^2 +  x_1$'},'Interpreter','latex');
ax2(1) = gca ;
axis([0 t_final -1.2 0.2])
set(ax2(1),'Position',[0.1230 , 0.72 , 0.8088 , 0.2426])
xlabel('Time (sec)') % x label
ylabel('$x_1$(t)','Interpreter','Latex') % y label
grid on

subplot(3,1,2)
plot(t,x2_c1,'-','Color',[0 0.2 0.7],'LineWidth',LW1+0.15) ; hold on ;
plot(t,x2_c2,'--','Color',[0.9 0.04 0],'LineWidth',LW1+0.15) ; 
hs2(2)=legend({'$\phi_1 = x_1$','$\phi_1 = x_1^2 +  x_1$'},'Interpreter','latex');
ax2(2) = gca ;
axis([0 t_final -5 25])
set(ax2(2),'Position',[0.1230 , 0.4 , 0.8088 , 0.2426])
xlabel('Time (sec)') % x label
ylabel('$x_2$(t)','Interpreter','Latex') % y label
grid on

subplot(3,1,3)
plot(t,x3_c1,'-','Color',[0 0.2 0.7],'LineWidth',LW1+0.15) ; hold on ;
plot(t,x3_c2,'--','Color',[0.9 0.04 0],'LineWidth',LW1+0.15) ; 
hs2(3)=legend({'$\phi_1 = x_1$','$\phi_1 = x_1^2 +  x_1$'},'Interpreter','latex');
ax2(3) = gca ;
axis([0 t_final -5 25])
xlabel('Time (sec)') % x label
ylabel('$x_3$(t)','Interpreter','Latex') % y label
set(ax2(3),'Position',[0.1230 , 0.08 , 0.8088 , 0.2426])
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

%% Linear System Function
function dZ = Linear_system1(K,Ac,Bc,Z)
v = -K*Z ; % Cotrol Input
dZ = Ac*Z + Bc*v ;
end

function dZ = Linear_system2(K,Ac,Bc,Z)
v = -K*Z ; % Cotrol Input
dZ = Ac*Z + Bc*v ;
end