%% Nonlinear Control HW7 - Q1 - (c)
clear ; clc ; close all
dt = 0.001 ; t_final = 10 ;
t = 0 : dt : t_final ;
x1_0 = 50 ;  % Initial of x1  
x2_0 = -40 ;  % Initial of x2  
X_0 = [ x1_0 ; x2_0  ] ;

%%%%%% 10 arbitrary initial state values %%%%%%%%%%%%%%
xt1 = [100 ; 100 ] ; xt2 = [80 ; 80 ] ; xt3 = [60 ; 60 ] ; xt4 = [-115 ; 140 ] ; xt5 = [-70 ; 130 ] ; xt6 = [-50 ; 100 ] ;
xt7 = [-90 ; -100 ] ; xt8 = [-60 ; -80 ] ; xt9 = [-40 ; -60 ] ; 
Xt_0 = [ xt1 , xt2 , xt3 , xt4 , xt5 , xt6 , xt7 , xt8 , xt9 ] ; 
%% linear System
Z2_0 = [ x1_0 ; x2_0+2 ] ; % Initial of transformation states Z2
%%%%%% 10 arbitrary initial state values %%%%%%%%%%%%%%
for i = 1:length(Xt_0(1,:))
      Z2t_0(:,i) = [ Xt_0(1,i) ; Xt_0(2,i)+2 ] ;
end

%% Plot 1
LW1 = 1.6 ;
LW2 = 1 ;
FS1 = 16 ;
FS_lg = 18 ;

[ t , X2 ] = ode45( @(t,X) Nonlinear_System2(X) , t , X_0) ;
[ t , Z2 ] = ode45( @(t,Z) Nonlinear_System_of_CT2(Z) , t , Z2_0) ;
X2 = X2' ; Z2 = Z2' ;
x1_2_c = X2(1,:) ; x2_2_c = X2(2,:) ;
z1_2_c = Z2(1,:) ; z2_2_c = Z2(2,:) ; 

for i =1:length(t)
    [ dX2(:,i) , PhiX2(i,1) , uX2(i,1)] = Nonlinear_System2(X2(:,i)) ;
    [ dZ2(:,i) , PhiZ2(i,1) , uZ2(i,1)] = Nonlinear_System_of_CT2(Z2(:,i)) ;
end

f1 = figure ;
plot(t,x1_2_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,x2_2_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
hs1(1)=legend({'$x_1(t)$','$x_2(t)$'},'Interpreter','latex');
ax1(1) = gca ;
xlabel('Time (sec)') % x label
ylabel('States   $\mathbf{x}(t)$','Interpreter','Latex') % y label
axis normal
grid on

f2 = figure ;
plot(t,z1_2_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,z2_2_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
hs1(2)=legend({'$\bar{x}_1(t)$','$\bar{x}_2(t)$'},'Interpreter','latex');
ax1(2) = gca ;
xlabel('Time (sec)') % x label
ylabel('States   $\bar{\mathbf{x}}(t)$','Interpreter','Latex') % y label
% axis([0 t_final -4 2.3])
axis normal
grid on

f3 = figure ;
plot(t,uX2,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
ax1(3) = gca ;
xlabel('Time (sec)') % x label
ylabel('Control Input $u(\bar{\mathbf{x}})$','Interpreter','Latex'); % y label
% axis([0 t_final -0.75 0.2])
axis normal
grid on

for i = 1:length(ax1)
    set(ax1(i),'XGrid','on','YGrid','on','XMinorGrid','off','YMinorGrid','off','FontSize',FS1,'FontName','Times New Roman')
end

for i = 1:length(hs1)
    set(hs1(i),'FontSize',FS_lg,'FontName','Times New Roman')
end

%% Plot 2
Dfcolor1 = pink(8) ;
Dfcolor1 = Dfcolor1(2:4,:) ;
Dfcolor2 = summer(5) ;
Dfcolor2 = Dfcolor2(1:3,:) ;
Dfcolor3 = bone(6) ;
Dfcolor3 = Dfcolor3(2:4,:) ;
Dfcolor = [Dfcolor1;Dfcolor2;Dfcolor3] ;

f4 = figure ;
for i = 1:length(Xt_0(1,:))
    [ t , Xt2 ] = ode45( @(t,X) Nonlinear_System2(X) , t , Xt_0(:,i)) ;
    xt2_1_c = Xt2(:,1) ; xt2_2_c = Xt2(:,2) ;
        
    plot(xt2_1_c,xt2_2_c,'Color',Dfcolor(i,:),'LineWidth',LW1) ; hold on ;         
    plot(xt2_1_c(1,1),xt2_2_c(1,1),'o','Color',Dfcolor(i,:),'LineWidth',LW2) ; hold on ;         
end
plot([-150 150],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot([0 0],[-150 150],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot(0,-2,'*','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
ax2(1) = gca ;
title('$\mathbf{x}_e = (0,-2)$','Interpreter','Latex')
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
axis([ -150 150 -140 160 ])
axis square

f5 = figure ;
for i = 1:length(Xt_0(1,:))
    [ t , Zt2 ] = ode45( @(t,Z) Nonlinear_System_of_CT2(Z) , t, Z2t_0(:,i)) ;
    zt2_1_c = Zt2(:,1) ; zt2_2_c = Zt2(:,2) ;
        
    plot(zt2_1_c,zt2_2_c,'Color',Dfcolor(i,:),'LineWidth',LW1) ; hold on ;         
    plot(zt2_1_c(1,1),zt2_2_c(1,1),'o','Color',Dfcolor(i,:),'LineWidth',LW2) ; hold on ;         
end
plot([-150 150],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot([0 0],[-150 150],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot(0,0,'*','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
ax2(2) = gca ;
title('$\bar{\mathbf{x}}_e = (0,0)$','Interpreter','Latex')
xlabel('$\bar{x}_1$','Interpreter','Latex') % x label
ylabel('$\bar{x}_2$','Interpreter','Latex') % y label
axis([ -150 150 -140 160 ])
axis square

for i = 1:length(ax2)
    set(ax2(i),'XGrid','on','YGrid','on','XMinorGrid','off','YMinorGrid','off','FontSize',FS1,'FontName','Times New Roman')
end

%% Nonlinear System Function
function [dX,Phi,u]= Nonlinear_System1(X)
x1 = X(1) ; x2 = X(2) ;

x1_bar = x1 ;
x2_bar = x2 +1 ;
Phi = -x1_bar - x1_bar^2 ;
dt_Phi = (-1 - 2*x1_bar )*( x1_bar^2 + x1_bar*x2_bar ) ;
u = 1/(1+( x2_bar - 1 )^2)*( -x1_bar - x1_bar^2 - 2*x2_bar + 2*Phi+ dt_Phi) ; % Control Input
dx1 = x1 + x1^2 + x1*x2 ;
dx2 = x1 + ( 1+ x2^2 )*u ;
dX = [ dx1 ; dx2  ] ;
end

function [dZ,Phi,u] = Nonlinear_System_of_CT1(Z)
z1 = Z(1) ; z2 = Z(2) ;

Phi = -z1 - z1^2 ;
dt_Phi = (-1 - 2*z1 )*( z1^2 + z1*z2 ) ;
u = 1/(1+(z2-1)^2)*( -z1 - z1^2 - 2*z2 + 2*Phi + dt_Phi ) ; % Control Input
dz1 = z1^2 +  z1*z2 ;
dz2 = z1 + (1+(z2-1)^2)*u ;
dZ = [ dz1 ; dz2  ] ;
end

function [dX,Phi,u] = Nonlinear_System2(X)
x1 = X(1) ; x2 = X(2) ;

x1_bar = x1 ;
x2_bar = x2 +2 ;
Phi = -x1_bar - x1_bar^2 ;
dt_Phi = (-1 - 2*x1_bar)*( -x1_bar + x1_bar^2 + x1_bar*x2_bar ) ;
u = 1/( 1+ (x2_bar-2)^2 )*( -x1_bar - x1_bar^2 - 2*x2_bar + 2*Phi + dt_Phi ) ; % Control Input
dx1 = x1 + x1^2 + x1*x2 ;
dx2 = x1 + ( 1+x2^2 )*u ;
dX = [ dx1 ; dx2  ] ;
end

function [dZ,Phi,u] = Nonlinear_System_of_CT2(Z)
z1 = Z(1) ; z2 = Z(2) ;

Phi = -z1 - z1^2 ;
dt_Phi = (-1 - 2*z1)*( -z1 + z1^2 + z1*z2 ) ;
u = 1/( 1+(z2-2)^2 )*( -z1 - z1^2 - 2*z2 + 2*Phi + dt_Phi) ; % Control Input
dz1 = -z1 + z1^2 +  z1*z2 ;
dz2 = z1 + (1+(z2-2)^2)*u ;
dZ = [ dz1 ; dz2  ] ;
end