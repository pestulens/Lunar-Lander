%% Nonlinear Control HW6 - Q1 - (b)
clear ; clc ; close all
dt = 0.01 ; t_final = 4 ;
t = 0 : dt : t_final ;
x1_0 = -2.5 ;  % Initial of x1  
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
FS_lg = 11 ;

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
plot3(x1_c,x2_c,x3_c,'b','LineWidth',LW1) ; hold on ;
plot3(x1_0,x2_0,x3_0,'bo','LineWidth',LW1) ;
plot3([-5 5],[0 0],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot3([0 0],[-6000 2000],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot3([0 0],[0 0],[-6000 2000],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
hs1(1)=legend({'$\mathbf{x}$(0)=(-2.5,2,2)'},'Interpreter','latex');
ax1(1) = gca ;
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
zlabel('$x_3$','Interpreter','Latex') % y label
% axis([-1.5 2.5 -1 2.5 -1 2.5])
axis normal
grid on

f2 = figure ;
plot3(z1_c,z2_c,z3_c,'b','LineWidth',LW1) ; hold on ;
plot3(z1_c(1),z2_c(1),z3_c(1),'bo','LineWidth',LW1) ;
plot3([-4 4],[0 0],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot3([0 0],[-4 4],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot3([0 0],[0 0],[-4 4],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
hs1(2)=legend({'$\mathbf{z}$(0)=(2,-2,-2)'},'Interpreter','latex');
ax1(2) = gca ;
xlabel('$z_1$','Interpreter','Latex') % x label
ylabel('$z_2$','Interpreter','Latex') % y label
zlabel('$z_3$','Interpreter','Latex') % y label
axis([-2 3 -3 1 -4 4])
axis normal
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

%% Plot 2
Cm1 = [0,0.15,0.39; 0,0.3,0.8 ; 0,0.39,0.7 ; 0,0.47,0.51 ; 0,0.47,0.39 ; 0,0.55,0.35 ; 0,0.63,0.35 ; 0,0.75,0.6 ; 0,0.85,0.5 ; 0,0.95,0.4] ;
f4 = figure ;
for i = 1:length(Xt_0(1,:))
    [ t , Xt ] = RK4( @(t,X) Nonlinear_system(K,X) , [0 t_final], Xt_0(:,i) ,dt) ;
    x1t_c = Xt(:,1) ; x2t_c = Xt(:,2) ; x3t_c = Xt(:,3) ;
    
    p1(i) = plot3(x1t_c,x2t_c,x3t_c,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on ;
    plot3(x1t_c(1),x2t_c(1),x3t_c(1),'o','Color',Cm1(i,:),'LineWidth',LW1) ;
           
end
plot3([-5 10],[0 0],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot3([0 0],[-10 15],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot3([0 0],[0 0],[-10 6],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
hs2(1)=legend([p1(1),p1(2),p1(3),p1(4),p1(5),p1(6),p1(7),p1(8),p1(9),p1(10)],...
                        {'$\mathbf{x}$(0)=(9,6,3)','$\mathbf{x}$(0)=(8,6,4)','$\mathbf{x}$(0)=(5.5,2,-6)',...
                         '$\mathbf{x}$(0)=(4,1,-4)','$\mathbf{x}$(0)=(3,-3,-5)','$\mathbf{x}$(0)=(2,5,2.5)',...
                         '$\mathbf{x}$(0)=(7,8,4)','$\mathbf{x}$(0)=(1,-2,-3)','$\mathbf{x}$(0)=(-0.5,3,4)',...
                         '$\mathbf{x}$(0)=(4,7,3.5)'},'Interpreter','latex');
ax2(1) = gca ;
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
zlabel('$x_3$','Interpreter','Latex') % y label
axis([-2 10 -7 15 -8 5])
axis normal
grid on

f5 = figure ;
for i = 1:length(Xt_0(1,:))
       
    [ t , Zt ] = RK4( @(t,Z) Linear_system(K,Ac,Bc,Z) , [0 t_final], Zt_0(:,i) ,dt) ;
    z1t_c = Zt(:,1) ; z2t_c = Zt(:,2) ; z3t_c = Zt(:,3) ;

    p2(i) = plot3(z1t_c,z2t_c,z3t_c,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on ;
    plot3(z1t_c(1),z2t_c(1),z3t_c(1),'o','Color',Cm1(i,:),'LineWidth',LW1) ;
 
end
plot3([-4 10],[0 0],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot3([0 0],[-10 9],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot3([0 0],[0 0],[-30 40],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
hs2(2)=legend([p2(1),p2(2),p2(3),p2(4),p2(5),p2(6),p2(7),p2(8),p2(9),p2(10)],...
                        {'$\mathbf{z}$(0)=(9,-6,-18)','$\mathbf{z}$(0)=(8,-6,-24)','$\mathbf{z}$(0)=(5.5,2.5,34)',...
                         '$\mathbf{z}$(0)=(4,1,18)','$\mathbf{z}$(0)=(3,-1,22)','$\mathbf{z}$(0)=(2,0.5,-8.5)',...
                         '$\mathbf{z}$(0)=(7,-3,-26)','$\mathbf{z}$(0)=(1,0,6)','$\mathbf{z}$(0)=(-0.5,-0.5,-1)',...
                         '$\mathbf{z}$(0)=(4,-0.5,-16.5)'},'Interpreter','latex');
ax2(2) = gca ;                   
xlabel('$z_1$','Interpreter','Latex') % x label
ylabel('$z_2$','Interpreter','Latex') % y label
zlabel('$z_3$','Interpreter','Latex') % y label
axis([-2.5 10 -10 8 -30 40])
axis normal
grid on

f6 = figure ;
for i = 1:length(Xt_0(1,:))
    [ t , Xt ] = RK4( @(t,X) Nonlinear_system(K,X) , [0 t_final], Xt_0(:,i) ,dt) ;
    x1t_c = Xt(:,1) ; x2t_c = Xt(:,2) ; x3t_c = Xt(:,3) ;
    
    for k = 1 : length(t)
        Phi_t(:,k) = [ x1t_c(k) ; -x1t_c(k)+x2t_c(k)-x3t_c(k) ; 2*x1t_c(k)-2*x2t_c(k)+x3t_c(k)-x1t_c(k)*x3t_c(k)] ;
        u_alpha_t(k) = (-3*x1t_c(k)+4*x2t_c(k)-2*x3t_c(k)+3*x1t_c(k)*x3t_c(k)-x2t_c(k)*x3t_c(k)+x1t_c(k)^2+x3t_c(k)^2)/(x1t_c(k)+1) ;
        u_beta_t(k) = -1/(x1t_c(k)+1) ;
        u_c_t(k) =  -u_beta_t(k)*K*Phi_t(:,k) + u_alpha_t(k) ;
    end
  
p3(i) = plot(t,u_c_t,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on
end
hs2(3)=legend([p3(1),p3(2),p3(3),p3(4),p3(5),p3(6),p3(7),p3(8),p3(9),p3(10)],...
                        {'$\mathbf{x}$(0)=(9,6,3)','$\mathbf{x}$(0)=(8,6,4)','$\mathbf{x}$(0)=(5.5,2,-6)',...
                         '$\mathbf{x}$(0)=(4,1,-4)','$\mathbf{x}$(0)=(3,-3,-5)','$\mathbf{x}$(0)=(2,5,2.5)',...
                         '$\mathbf{x}$(0)=(7,8,4)','$\mathbf{x}$(0)=(1,-2,-3)','$\mathbf{x}$(0)=(-0.5,3,4)',...
                         '$\mathbf{x}$(0)=(4,7,3.5)'},'Interpreter','latex');
ax2(3) = gca ;
xlabel('Time (sec)') % x label
ylabel('Control Input $u(\mathbf{x})$','Interpreter','Latex') % y label
axis([0 8 -30 48])
axis normal
grid on

for i = 1:length(ax2)
    set(ax2(i),'FontSize',FS1,'FontName','Times New Roman')
end

for i = 1:length(hs2)
    set(hs2(i),'FontSize',FS_lg,'FontName','Times New Roman')
end

%% Plot 3
Cm1 = [0,0.15,0.39; 0,0.3,0.8 ; 0,0.39,0.7 ; 0,0.47,0.51 ; 0,0.47,0.39 ; 0,0.55,0.35 ; 0,0.63,0.35 ; 0,0.75,0.6 ; 0,0.85,0.5 ; 0,0.95,0.4] ;
f7 = figure ;
for i = 1:length(Xt_0(1,:))
    [ t , Xt ] = RK4( @(t,X) Nonlinear_system(K,X) , [0 t_final], Xt_0(:,i) ,dt) ;
    x1t_c = Xt(:,1) ; x2t_c = Xt(:,2) ; x3t_c = Xt(:,3) ;
    
    p4(i) = plot(x1t_c,x2t_c,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on ;
    plot(x1t_c(1),x2t_c(1),'o','Color',Cm1(i,:),'LineWidth',LW1) ;
           
end
plot([-5 10],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot([0 0],[-10 15],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;

ax3(1) = gca ;
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
axis([-2 10 -7 15])
axis square
grid on


f8 = figure ;
for i = 1:length(Xt_0(1,:))
    [ t , Xt ] = RK4( @(t,X) Nonlinear_system(K,X) , [0 t_final], Xt_0(:,i) ,dt) ;
    x1t_c = Xt(:,1) ; x2t_c = Xt(:,2) ; x3t_c = Xt(:,3) ;
    
    p5(i) = plot(x2t_c,x3t_c,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on ;
    plot(x2t_c(1),x3t_c(1),'o','Color',Cm1(i,:),'LineWidth',LW1) ;
           
end
plot([-10 15],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot([0 0],[-10 7],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;

ax3(2) = gca ;
xlabel('$x_2$','Interpreter','Latex') % x label
ylabel('$x_3$','Interpreter','Latex') % y label
axis([-9 15 -8 7])
axis square
grid on

f9 = figure ;
for i = 1:length(Xt_0(1,:))
    [ t , Xt ] = RK4( @(t,X) Nonlinear_system(K,X) , [0 t_final], Xt_0(:,i) ,dt) ;
    x1t_c = Xt(:,1) ; x2t_c = Xt(:,2) ; x3t_c = Xt(:,3) ;
    
    p6(i) = plot(x1t_c,x3t_c,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on ;
    plot(x1t_c(1),x3t_c(1),'o','Color',Cm1(i,:),'LineWidth',LW1) ;
           
end
plot([-10 15],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot([0 0],[-10 7],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;

ax3(3) = gca ;
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_3$','Interpreter','Latex') % y label
axis([-4 12 -8 7])
axis square
grid on

f10 = figure ;
for i = 1:length(Xt_0(1,:))
       
    [ t , Zt ] = RK4( @(t,Z) Linear_system(K,Ac,Bc,Z) , [0 t_final], Zt_0(:,i) ,dt) ;
    z1t_c = Zt(:,1) ; z2t_c = Zt(:,2) ; z3t_c = Zt(:,3) ;

    p7(i) = plot(z1t_c,z2t_c,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on ;
    plot(z1t_c(1),z2t_c(1),'o','Color',Cm1(i,:),'LineWidth',LW1) ;
 
end
plot([-4 10],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot([0 0],[-10 9],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;

ax3(4) = gca ;                   
xlabel('$z_1$','Interpreter','Latex') % x label
ylabel('$z_2$','Interpreter','Latex') % y label
axis([-2.5 10 -10 8])
axis square
grid on

f11 = figure ;
for i = 1:length(Xt_0(1,:))
       
    [ t , Zt ] = RK4( @(t,Z) Linear_system(K,Ac,Bc,Z) , [0 t_final], Zt_0(:,i) ,dt) ;
    z1t_c = Zt(:,1) ; z2t_c = Zt(:,2) ; z3t_c = Zt(:,3) ;

    p8(i) = plot(z1t_c,z3t_c,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on ;
    plot(z1t_c(1),z3t_c(1),'o','Color',Cm1(i,:),'LineWidth',LW1) ;
 
end
plot([-4 10],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot([0 0],[-30 40],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;

ax3(5) = gca ;                   
xlabel('$z_1$','Interpreter','Latex') % x label
ylabel('$z_3$','Interpreter','Latex') % y label
axis([-2.5 10 -30 40])
axis square
grid on

f12 = figure ;
for i = 1:length(Xt_0(1,:))
       
    [ t , Zt ] = RK4( @(t,Z) Linear_system(K,Ac,Bc,Z) , [0 t_final], Zt_0(:,i) ,dt) ;
    z1t_c = Zt(:,1) ; z2t_c = Zt(:,2) ; z3t_c = Zt(:,3) ;

    p9(i) = plot(z2t_c,z3t_c,'Color',Cm1(i,:),'LineWidth',LW1) ; hold on ;
    plot(z2t_c(1),z3t_c(1),'o','Color',Cm1(i,:),'LineWidth',LW1) ;
 
end
plot([-12 8],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot([0 0],[-32 42],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;

ax3(6) = gca ;                   
xlabel('$z_2$','Interpreter','Latex') % x label
ylabel('$z_3$','Interpreter','Latex') % y label
axis([-12 8 -32 42])
axis square
grid on

for i = 1:length(ax3)
    set(ax3(i),'FontSize',FS1,'FontName','Times New Roman')
    RemovePlotWhiteArea(ax3(i)) ;
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