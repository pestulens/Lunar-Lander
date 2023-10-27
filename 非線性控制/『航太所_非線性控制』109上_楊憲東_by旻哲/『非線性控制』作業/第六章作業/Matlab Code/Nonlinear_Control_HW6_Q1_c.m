%% Nonlinear Control HW6 - Q1 - (c)
clear ; clc ; close all
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
lambda = [-2,-2,-2] ; %  Poles of closed loop system
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
plot(t,2*exp(-2*t),'r:','LineWidth',LW1+0.2) ;
hs1(1)=legend({'$x_1(t)$','$x_2(t)$','$x_3(t)$'},'Interpreter','latex');
hs1(1)=legend({'$x_1(t)$','$x_2(t)$','$x_3(t)$','2$e^{-2t}$'},'Interpreter','latex');
ax1(1) = gca ;
xlabel('Time (sec)') % x label
ylabel('States   $\mathbf{x}(t)$','Interpreter','Latex') % y label
axis([0 t_final -1 2.5])
axis square
grid on

f2 = figure ;
plot(t,z1_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,z2_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
plot(t,z3_c,'-.','Color',[0 0.6 0.7],'LineWidth',LW1) ; 
plot(t,2*exp(-2*t),'r:','LineWidth',LW1+0.2) ;
plot(t,-2*exp(-2*t),'r:','LineWidth',LW1+0.2) 
hs1(2)=legend({'$z_1(t)$','$z_2(t)$','$z_3(t)$'},'Interpreter','latex');
hs1(2)=legend({'$z_1(t)$','$z_2(t)$','$z_3(t)$','$\pm$2$e^{-2t}$'},'Interpreter','latex');
ax1(2) = gca ;
xlabel('Time (sec)') % x label
ylabel('States   $\mathbf{z}(t)$','Interpreter','Latex') % y label
axis([0 t_final -3 3])
axis square
grid on

f3 = figure ;
plot(t,u_c,'b','LineWidth',LW1)
ax1(3) = gca ;
xlabel('Time (sec)') % x label
ylabel('Control Input $u(\mathbf{x})$','Interpreter','Latex') % y label
axis normal
grid on

for i = 1:length(ax1)
    set(ax1(i),'FontSize',FS1,'FontName','Times New Roman')
end

for i = 1:length(hs1)
    set(hs1(i),'FontSize',FS_lg,'FontName','Times New Roman')
end

%% Plot 2
Cm1 = [0,0.15,0.39; 0,0.3,0.8 ; 0,0.39,0.7 ; 0,0.47,0.51 ; 0,0.47,0.39 ; 0,0.55,0.35 ; 0,0.63,0.35 ; 0,0.75,0.6 ; 0,0.85,0.5 ; 0,0.95,0.4] ;
f4 = figure ;
for i = 1:length(Xt_0(1,:))
    [ t , Xt ] = RK4( @(t,X) Nonlinear_system(K,X) , [0 t_final], Xt_0(:,i) ,dt) ;
    x1t_c = Xt(:,1) ; x2t_c = Xt(:,2) ; x3t_c = Xt(:,3) ;
        
    plot(t,x1t_c,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on ;         
end
ax2(1) = gca ;  
hs2(1)=legend({'$x_1$(0)=9','$x_1$(0)=8','$x_1$(0)=5.5',...
                         '$x_1$(0)=4','$x_1$(0)=3','$x_1$(0)=2',...
                         '$x_1$(0)=7','$x_1$(0)=1','$x_1$(0)=-0.5',...
                         '$x_1$(0)=4'},'Interpreter','latex');
xlabel('Time (sec)') % x label
ylabel('State $x_1(t)$','Interpreter','Latex') % y label
axis([ 0 t_final -3 12 ])
axis square
grid on

f5 = figure ;
for i = 1:length(Xt_0(1,:))
    [ t , Xt ] = RK4( @(t,X) Nonlinear_system(K,X) , [0 t_final], Xt_0(:,i) ,dt) ;
    x1t_c = Xt(:,1) ; x2t_c = Xt(:,2) ; x3t_c = Xt(:,3) ;
        
    plot(t,x2t_c,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on ;         
end
ax2(2) = gca ;  
hs2(2)=legend({'$x_2$(0)=6','$x_2$(0)=6','$x_2$(0)=2',...
                         '$x_2$(0)=1','$x_2$(0)=-3','$x_2$(0)=5',...
                         '$x_2$(0)=8','$x_2$(0)=-2','$x_2$(0)=3',...
                         '$x_2$(0)=7'},'Interpreter','latex');
xlabel('Time (sec)') % x label
ylabel('State $x_2(t)$','Interpreter','Latex') % y label
axis([ 0 t_final -7 17 ])
axis square
grid on

f6 = figure ;
for i = 1:length(Xt_0(1,:))
    [ t , Xt ] = RK4( @(t,X) Nonlinear_system(K,X) , [0 t_final], Xt_0(:,i) ,dt) ;
    x1t_c = Xt(:,1) ; x2t_c = Xt(:,2) ; x3t_c = Xt(:,3) ;
        
    plot(t,x3t_c,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on ;         
end
ax2(3) = gca ;  
hs2(3)=legend({'$x_3$(0)=3','$x_3$(0)=4','$x_3$(0)=-6',...
                         '$x_3$(0)=-4','$x_3$(0)=-5','$x_3$(0)=5',...
                         '$x_3$(0)=4','$x_3$(0)=-3','$x_3$(0)=4',...
                         '$x_3$(0)=3.5'},'Interpreter','latex');
xlabel('Time (sec)') % x label
ylabel('State $x_3(t)$','Interpreter','Latex') % y label
axis([ 0 t_final -11 5 ])
axis square
grid on


f7 = figure ;
for i = 1:length(Xt_0(1,:))
    [ t , Zt ] = RK4( @(t,Z) Linear_system(K,Ac,Bc,Z) , [0 t_final], Zt_0(:,i) ,dt) ;
    z1t_c = Zt(:,1) ; z2t_c = Zt(:,2) ; z3t_c = Zt(:,3) ;
    plot(t,z1t_c,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on ;
     
end
ax2(4) = gca ;  
hs2(4)=legend({'$z_1$(0)=9','$z_1$(0)=8','$z_1$(0)=5.5',...
                         '$z_1$(0)=4','$z_1$(0)=3','$z_1$(0)=2',...
                         '$z_1$(0)=7','$z_1$(0)=1','$z_1$(0)=-0.5',...
                         '$z_1$(0)=4'},'Interpreter','latex');
xlabel('Time (sec)') % x label
ylabel('State $z_1(t)$','Interpreter','Latex') % y label
axis([ 0 t_final -2.5 12 ])
axis square
grid on

f8 = figure ;
for i = 1:length(Xt_0(1,:))
    [ t , Zt ] = RK4( @(t,Z) Linear_system(K,Ac,Bc,Z) , [0 t_final], Zt_0(:,i) ,dt) ;
    z1t_c = Zt(:,1) ; z2t_c = Zt(:,2) ; z3t_c = Zt(:,3) ;
    plot(t,z2t_c,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on ;
     
end
ax2(5) = gca ;  
hs2(5)=legend({'$z_2$(0)=-6','$z_2$(0)=-6','$z_2$(0)=2.5',...
                         '$z_2$(0)=1','$z_2$(0)=-1','$z_2$(0)=0.5',...
                         '$z_2$(0)=-3','$z_2$(0)=0','$z_2$(0)=-0.5',...
                         '$z_2$(0)=-0.5'},'Interpreter','latex');
xlabel('Time (sec)') % x label
ylabel('State $z_2(t)$','Interpreter','Latex') % y label
axis([ 0 t_final -14 6 ])
axis square
grid on

f9 = figure ;
for i = 1:length(Xt_0(1,:))
    [ t , Zt ] = RK4( @(t,Z) Linear_system(K,Ac,Bc,Z) , [0 t_final], Zt_0(:,i) ,dt) ;
    z1t_c = Zt(:,1) ; z2t_c = Zt(:,2) ; z3t_c = Zt(:,3) ;
    plot(t,z3t_c,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on ;
     
end
ax2(6) = gca ;  
hs2(6)=legend({'$z_3$(0)=-18','$z_3$(0)=-24','$z_3$(0)=34',...
                         '$z_3$(0)=18','$z_3$(0)=22','$z_3$(0)=-8.5',...
                         '$z_3$(0)=-26','$z_3$(0)=6','$z_3$(0)=-1',...
                         '$z_3$(0)=-16.5'},'Interpreter','latex');
xlabel('Time (sec)') % x label
ylabel('State $z_3(t)$','Interpreter','Latex') % y label
axis([ 0 t_final -30 60 ])
axis square
grid on

for i = 1:length(ax2)
    set(ax2(i),'FontSize',FS1,'FontName','Times New Roman')
end

for i = 1:length(hs2)
    set(hs2(i),'FontSize',FS_lg-6,'FontName','Times New Roman')
end

%% Plot 3
[ t , X ] = RK4( @(t,X) Nonlinear_system(K,X) , [0 t_final], X0 ,dt) ;
x1_c = X(:,1) ; x2_c = X(:,2) ; x3_c = X(:,3) ;

[ t , Z ] = RK4( @(t,Z) Linear_system(K,Ac,Bc,Z) , [0 t_final], Z0 ,dt) ;
z1_c = Z(:,1) ; z2_c = Z(:,2) ; z3_c = Z(:,3) ;

f10 = figure ;
plot(t,x1_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,x2_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
plot(t,x3_c,'-.','Color',[0 0.6 0.7],'LineWidth',LW1) ; 
plot(t,z1_c,'-','Color',[0.69 0.15 0.15],'LineWidth',LW1) ; hold on ;
plot(t,z2_c,'--','Color',[1 0.5 0],'LineWidth',LW1) ; 
plot(t,z3_c,'-.','Color',[1 0 0.6],'LineWidth',LW1) ; 
hs3(1)=legend({'$x_1(t)$','$x_2(t)$','$x_3(t)$','$z_1(t)$','$z_2(t)$','$z_3(t)$'},'Interpreter','latex');
ax3(1) = gca ;
xlabel('Time (sec)') % x label
ylabel('States   $\mathbf{x}(t)$, $\mathbf{z}(t)$','Interpreter','Latex') % y label
axis([0 t_final -2.5 2.5])
axis square
grid on

for i = 1:length(ax3)
    set(ax3(i),'FontSize',FS1,'FontName','Times New Roman')
    RemovePlotWhiteArea(ax3(i)) ;
end

for i = 1:length(hs3)
    set(hs3(i),'FontSize',FS_lg,'FontName','Times New Roman')
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