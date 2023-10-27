%% Nonlinear Control HW7 - Q1 - (e)
clear ; clc ; close all
dt = 0.001 ; t_final = 8 ;
t = 0 : dt : t_final ;
x1_0 = 3 ;  % Initial of x1  
x2_0 = -3 ;  % Initial of x2  
X_0 = [ x1_0 ; x2_0  ] ;

%% linear System
Z1_0 = [ x1_0 ; x2_0+2 ] ; % Initial of transformation states Z2

%% Plot 1
LW1 = 1.6 ;
LW2 = 1 ;
FS1 = 16 ;
FS_lg = 17 ;

[ t , X1 ] = ode45( @(t,X) Nonlinear_System1(X) , t , X_0) ;
[ t , Z1 ] = ode45( @(t,Z) Nonlinear_System_of_CT1(Z) , t , Z1_0) ;
[ t , X2 ] = ode45( @(t,X) Nonlinear_System2(X) , t , X_0) ;
[ t , Z2 ] = ode45( @(t,Z) Nonlinear_System_of_CT2(Z) , t , Z1_0) ;
X1 = X1' ; Z1 = Z1' ;
X2 = X2' ; Z2 = Z2' ;
x1_1_c = X1(1,:) ; x2_1_c = X1(2,:) ;
z1_1_c = Z1(1,:) ; z2_1_c = Z1(2,:) ; 
x1_2_c = X2(1,:) ; x2_2_c = X2(2,:) ;
z1_2_c = Z2(1,:) ; z2_2_c = Z2(2,:) ; 

for i =1:length(t)
    [ dX1(:,i) , PhiX1(i,1) , uX1(i,1)] = Nonlinear_System1(X1(:,i)) ;
    [ dZ1(:,i) , PhiZ1(i,1) , uZ1(i,1)] = Nonlinear_System_of_CT1(Z1(:,i)) ;
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
p1 = plot(t,z1_2_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
p2 = plot(t,PhiZ2,'-.','Color',[0.82 0.75 0.6],'LineWidth',LW1) ; 
p3 = plot(t,z2_2_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
hs1(2)=legend([p1,p3,p2],{'$\bar{x}_1(t)$','$\bar{x}_2(t)$','$\bar{\phi}(\bar{x}_1)=-\bar{x}_1$'},'Interpreter','latex');
ax1(2) = gca ;
xlabel('Time (sec)') % x label
ylabel('States   $\bar{\mathbf{x}}(t)$','Interpreter','Latex') % y label
axis normal
grid on

f3 = figure ;
plot(t,uX2,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
ax1(3) = gca ;
xlabel('Time (sec)') % x label
ylabel('Control Input $u(\bar{\mathbf{x}})$','Interpreter','Latex'); % y label
axis normal
grid on

f4 = figure ;
plot(t,x1_1_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,x1_2_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
hs1(3)=legend({'$\bar{\phi}(\bar{x}_1)=-\bar{x}_1-\bar{x}_1^2$','$\bar{\phi}(\bar{x}_1)=-\bar{x}_1$'},'Interpreter','latex');
ax1(4) = gca ;
xlabel('Time (sec)') % x label
ylabel('$x_1(t)$','Interpreter','Latex') % y label
Ytick = [0 1 2 3] ;
axis square
grid on

f5 = figure ;
plot(t,x2_1_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,x2_2_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
hs1(4)=legend({'$\bar{\phi}(\bar{x}_1)=-\bar{x}_1-\bar{x}_1^2$','$\bar{\phi}(\bar{x}_1)=-\bar{x}_1$'},'Interpreter','latex');
ax1(5) = gca ;
xlabel('Time (sec)') % x label
ylabel('$x_2(t)$','Interpreter','Latex') % y label
% axis([0 t_final -3.5 -2])
axis square
grid on

f6 = figure ;
plot(t,z1_1_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,z1_2_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
hs1(5)=legend({'$\bar{\phi}(\bar{x}_1)=-\bar{x}_1-\bar{x}_1^2$','$\bar{\phi}(\bar{x}_1)=-\bar{x}_1$'},'Interpreter','latex');
ax1(6) = gca ;
xlabel('Time (sec)') % x label
ylabel('$\bar{x}_1(t)$','Interpreter','Latex') % y label
axis square
grid on

f7 = figure ;
plot(t,z2_1_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,z2_2_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
hs1(6)=legend({'$\bar{\phi}(\bar{x}_1)=-\bar{x}_1-\bar{x}_1^2$','$\bar{\phi}(\bar{x}_1)=-\bar{x}_1$'},'Interpreter','latex');
ax1(7) = gca ;
xlabel('Time (sec)') % x label
ylabel('$\bar{x}_2(t)$','Interpreter','Latex') % y label
% axis([0 t_final -1.5 0])
axis square
grid on

f8 = figure ;
plot(t,uX1,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
plot(t,uX2,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; hold on ;
hs1(7)=legend({'$\bar{\phi}(\bar{x}_1)=-\bar{x}_1-\bar{x}_1^2$','$\bar{\phi}(\bar{x}_1)=-\bar{x}_1$'},'Interpreter','latex');
ax1(8) = gca ;
xlabel('Time (sec)') % x label
ylabel('Control Input $u(\bar{\mathbf{x}})$','Interpreter','Latex'); % y label
% axis([0 t_final -0.625 0.22])
axis normal
grid on

for i = 1:length(ax1)
    set(ax1(i),'XGrid','on','YGrid','on','XMinorGrid','off','YMinorGrid','off','FontSize',FS1,'FontName','Times New Roman')
end

for i = 1:length(hs1)
    set(hs1(i),'FontSize',FS_lg,'FontName','Times New Roman')
end

%% Nonlinear System Function
function [dX,Phi,u]= Nonlinear_System1(X)
x1 = X(1) ; x2 = X(2) ;

x1_bar = x1 ;
x2_bar = x2 +2 ;
Phi = -x1_bar - x1_bar^2 ;
dt_Phi = (-1 - 2*x1_bar )*( -x1_bar + x1_bar^2 + x1_bar*x2_bar ) ;
u = 1/(1+( x2_bar - 2 )^2)*( -x1_bar - x1_bar^2 - 2*x2_bar + 2*Phi+ dt_Phi) ; % Control Input
dx1 = x1 + x1^2 + x1*x2 ;
dx2 = x1 + ( 1+ x2^2 )*u ;
dX = [ dx1 ; dx2  ] ;
end

function [dZ,Phi,u] = Nonlinear_System_of_CT1(Z)
z1 = Z(1) ; z2 = Z(2) ;

Phi = -z1 - z1^2 ;
dt_Phi = (-1 - 2*z1 )*( -z1 + z1^2 +  z1*z2  ) ;
u = 1/(1+(z2-2)^2)*( -z1 - z1^2 - 2*z2 + 2*Phi + dt_Phi ) ; % Control Input
dz1 = -z1 + z1^2 +  z1*z2 ;
dz2 = z1 + (1+(z2-2)^2)*u ;
dZ = [ dz1 ; dz2  ] ;
end

function [dX,Phi,u] = Nonlinear_System2(X)
x1 = X(1) ; x2 = X(2) ;

x1_bar = x1 ;
x2_bar = x2 +2 ;
Phi = -x1_bar  ;
dt_Phi = -1*( -x1_bar + x1_bar^2 + x1_bar*x2_bar ) ;
u = 1/( 1+ (x2_bar-2)^2 )*( -x1_bar - x1_bar^2 - 2*x2_bar + 2*Phi + dt_Phi ) ; % Control Input
dx1 = x1 + x1^2 + x1*x2 ;
dx2 = x1 + ( 1+ x2^2 )*u ;
dX = [ dx1 ; dx2  ] ;
end

function [dZ,Phi,u] = Nonlinear_System_of_CT2(Z)
z1 = Z(1) ; z2 = Z(2) ;

Phi = -z1 ;
dt_Phi = -1*( -z1 + z1^2 + z1*z2 ) ;
u = 1/( 1+(z2-2)^2 )*( -z1 - z1^2 - 2*z2 + 2*Phi + dt_Phi) ; % Control Input
dz1 = -z1 + z1^2 +  z1*z2 ;
dz2 = z1 + (1+(z2-2)^2)*u ;
dZ = [ dz1 ; dz2  ] ;
end