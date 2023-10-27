%% Nonlinear Control HW7 - Q1 - (b)
clear ; clc ; close all
dt = 0.001 ; t_final = 0.002; 
t = 0 : dt : t_final ;
x1_0 = 1.5 ;  % Initial of x1  
x2_0 = -3 ;  % Initial of x2  
X_0 = [ x1_0 ; x2_0  ] ;

%%%%%% 10 arbitrary initial state values %%%%%%%%%%%%%%
xt1 = [1 ; 1 ] ; xt2 = [1.3 ; 2 ] ; xt3 = [1.8 ; 3 ] ; xt4 = [-1 ; 1 ] ; xt5 = [-1.5 ; 2 ] ; xt6 = [-2 ; 3 ] ;
xt7 = [-2.2 ; -2.5 ] ; xt8 = [-1.6 ; -3.5 ] ; xt9 = [-1 ; -4 ] ; 
Xt_0 = [ xt1 , xt2 , xt3 , xt4 , xt5 , xt6 , xt7 , xt8 , xt9 ] ; 
%% linear System
Z1_0 = [ x1_0 ; x2_0+1 ] ; % Initial of transformation states Z1
Z2_0 = [ x1_0 ; x2_0+2 ] ; % Initial of transformation states Z2
%%%%%% 10 arbitrary initial state values %%%%%%%%%%%%%%
for i = 1:length(Xt_0(1,:))
    Z1t_0(:,i) = [ Xt_0(1,i) ; Xt_0(2,i)+1 ] ;
    Z2t_0(:,i) = [ Xt_0(1,i) ; Xt_0(2,i)+2 ] ;
end

%% Plot 1
LW1 = 1.6 ;
LW2 = 1 ;
FS1 = 16 ;
FS_lg = 18 ;

% [ t , X1 ] = RK4( @(t,X) Nonlinear_System1(X) , [0 t_final], X_0 ,dt) ;
% [ t , Z1 ] = RK4( @(t,Z) Nonlinear_System_of_CT1(Z) , [0 t_final], Z1_0 ,dt) ;
% [ t , X2 ] = RK4( @(t,X) Nonlinear_System2(X) , [0 t_final], X_0 ,dt) ;
% [ t , Z2 ] = RK4( @(t,Z) Nonlinear_System_of_CT2(Z) , [0 t_final], Z2_0 ,dt) ;
% X1 = X1' ; Z1 = Z1' ;
% X2 = X2' ; Z2 = Z2' ;
% x1_1_c = X1(1,:) ; x2_1_c = X1(2,:) ;
% z1_1_c = Z1(1,:) ; z2_1_c = Z1(2,:) ; 
% x1_2_c = X2(1,:) ; x2_2_c = X2(2,:) ;
% z1_2_c = Z2(1,:) ; z2_2_c = Z2(2,:) ; 
% 
% for i =1:length(t)
%     [ dX1(:,i) , PhiX1(i,1) , uX1(i,1)] = Nonlinear_System1(X1(:,i)) ;
%     [ dZ1(:,i) , PhiZ1(i,1) , uZ1(i,1)] = Nonlinear_System_of_CT1(Z1(:,i)) ;
%     [ dX2(:,i) , PhiX2(i,1) , uX2(i,1)] = Nonlinear_System2(X2(:,i)) ;
%     [ dZ2(:,i) , PhiZ2(i,1) , uZ2(i,1)] = Nonlinear_System_of_CT2(Z2(:,i)) ;
% end

% f1 = figure ;
% plot(t,x1_1_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
% plot(t,x2_1_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
% hs1(1)=legend({'$x_1(t)$','$x_2(t)$'},'Interpreter','latex');
% ax1(1) = gca ;
% xlabel('Time (sec)') % x label
% ylabel('States   $\mathbf{x}(t)$','Interpreter','Latex') % y label
% axis normal
% grid on

% f2 = figure ;
% p1 = plot(t,z1_1_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
% p2 = plot(t,PhiZ1,'-.','Color',[0.82 0.75 0.6],'LineWidth',LW1) ; 
% p3 = plot(t,z2_1_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
% hs1(2)=legend([p1,p3,p2],{'$\bar{x}_1(t)$','$\bar{x}_2(t)$','$\bar{\phi}(\bar{x}_1)$'},'Interpreter','latex');
% ax1(2) = gca ;
% xlabel('Time (sec)') % x label
% ylabel('States   $\bar{\mathbf{x}}(t)$','Interpreter','Latex') % y label
% axis([0 t_final -4 2.5])
% axis normal
% grid on
% 
% f3 = figure ;
% plot(t,uX1,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
% ax1(3) = gca ;
% xlabel('Time (sec)') % x label
% ylabel('Control Input $u(\bar{\mathbf{x}})$','Interpreter','Latex'); % y label
% axis normal
% grid on
% 
% f4 = figure ;
% plot(t,x1_2_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
% plot(t,x2_2_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
% hs1(3)=legend({'$x_1(t)$','$x_2(t)$'},'Interpreter','latex');
% ax1(4) = gca ;
% xlabel('Time (sec)') % x label
% ylabel('States   $\mathbf{x}(t)$','Interpreter','Latex') % y label
% axis normal
% grid on
% 
% f5 = figure ;
% p4 = plot(t,z1_2_c,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
% p5 = plot(t,PhiZ2,'-.','Color',[0.82 0.75 0.6],'LineWidth',LW1) ; 
% p6 = plot(t,z2_2_c,'--','Color',[0 0.65 0.2],'LineWidth',LW1) ; 
% hs1(4)=legend([p4,p6,p5],{'$\bar{x}_1(t)$','$\bar{x}_2(t)$','$\bar{\phi}(\bar{x}_1)$'},'Interpreter','latex');
% ax1(5) = gca ;
% xlabel('Time (sec)') % x label
% ylabel('States   $\bar{\mathbf{x}}(t)$','Interpreter','Latex') % y label
% axis([0 t_final -4 2.3])
% axis normal
% grid on
% 
% f6 = figure ;
% plot(t,uX2,'-','Color',[0 0.2 0.7],'LineWidth',LW1) ; hold on ;
% ax1(6) = gca ;
% xlabel('Time (sec)') % x label
% ylabel('Control Input $u(\bar{\mathbf{x}})$','Interpreter','Latex'); % y label
% axis([0 t_final -0.75 0.2])
% axis normal
% grid on
% 
% for i = 1:length(ax1)
%     set(ax1(i),'XGrid','on','YGrid','on','XMinorGrid','off','YMinorGrid','off','FontSize',FS1,'FontName','Times New Roman')
% end
% 
% for i = 1:length(hs1)
%     set(hs1(i),'FontSize',FS_lg,'FontName','Times New Roman')
% end

%% Plot 2
Dfcolor1 = pink(8) ;
Dfcolor1 = Dfcolor1(2:4,:) ;
Dfcolor2 = summer(5) ;
Dfcolor2 = Dfcolor2(1:3,:) ;
Dfcolor3 = bone(6) ;
Dfcolor3 = Dfcolor3(2:4,:) ;
Dfcolor = [Dfcolor1;Dfcolor2;Dfcolor3] ;

f7 = figure ;
for i = 1%:length(Xt_0(1,:))
    [ t , Xt1 ] = RK4( @(t,X) Nonlinear_System1(X) , [0 t_final], Xt_0(:,i) ,dt) ;
    xt1_1_c = Xt1(:,1) ; xt1_2_c = Xt1(:,2) ;
    plot(xt1_1_c,xt1_2_c,'Color',Dfcolor(i,:),'LineWidth',LW1) ; hold on ;         
    plot(xt1_1_c(1,1),xt1_2_c(1,1),'o','Color',Dfcolor(i,:),'LineWidth',LW2) ; hold on ;         
end
plot([-5 10],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot([0 0],[-10 15],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
plot(0,-1,'*','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
ax2(1) = gca ;
title('$\mathbf{x}_e = (0,-1)$','Interpreter','Latex')
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
axis([ -3 3 -5 4 ])
axis square

% f8 = figure ;
% for i = 1:length(Xt_0(1,:))
%     [ t , Zt1 ] = RK4( @(t,Z) Nonlinear_System_of_CT1(Z) , [0 t_final], Z1t_0(:,i) ,dt) ;
%     zt1_1_c = Zt1(:,1) ; zt1_2_c = Zt1(:,2) ;
%         
%     plot(zt1_1_c,zt1_2_c,'Color',Dfcolor(i,:),'LineWidth',LW1) ; hold on ;         
%     plot(zt1_1_c(1,1),zt1_2_c(1,1),'o','Color',Dfcolor(i,:),'LineWidth',LW2) ; hold on ;         
% end
% plot([-5 10],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
% plot([0 0],[-10 15],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
% plot(0,0,'*','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
% ax2(2) = gca ;
% title('$\bar{\mathbf{x}}_e = (0,0)$','Interpreter','Latex')
% xlabel('$\bar{x}_1$','Interpreter','Latex') % x label
% ylabel('$\bar{x}_2$','Interpreter','Latex') % y label
% axis([ -3 3 -4 5 ])
% axis square
% 
% f9 = figure ;
% for i = 1:length(Xt_0(1,:))
%     [ t , Xt2 ] = RK4( @(t,X) Nonlinear_System2(X) , [0 t_final], Xt_0(:,i) ,dt) ;
%     xt2_1_c = Xt2(:,1) ; xt2_2_c = Xt2(:,2) ;
%         
%     plot(xt2_1_c,xt2_2_c,'Color',Dfcolor(i,:),'LineWidth',LW1) ; hold on ;         
%     plot(xt2_1_c(1,1),xt2_2_c(1,1),'o','Color',Dfcolor(i,:),'LineWidth',LW2) ; hold on ;         
% end
% plot([-5 10],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
% plot([0 0],[-10 15],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
% plot(0,-2,'*','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
% ax2(3) = gca ;
% title('$\mathbf{x}_e = (0,-2)$','Interpreter','Latex')
% xlabel('$x_1$','Interpreter','Latex') % x label
% ylabel('$x_2$','Interpreter','Latex') % y label
% axis([ -3.2 3.6 -5.7 4.2 ])
% axis square
% 
% f10 = figure ;
% for i = 1:length(Xt_0(1,:))
%     [ t , Zt2 ] = RK4( @(t,Z) Nonlinear_System_of_CT2(Z) , [0 t_final], Z2t_0(:,i) ,dt) ;
%     zt2_1_c = Zt2(:,1) ; zt2_2_c = Zt2(:,2) ;
%         
%     plot(zt2_1_c,zt2_2_c,'Color',Dfcolor(i,:),'LineWidth',LW1) ; hold on ;         
%     plot(zt2_1_c(1,1),zt2_2_c(1,1),'o','Color',Dfcolor(i,:),'LineWidth',LW2) ; hold on ;         
% end
% plot([-5 10],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
% plot([0 0],[-10 15],'--','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
% plot(0,0,'*','Color',[0.5 0.5 0.5],'LineWidth',LW2) ;
% ax2(4) = gca ;
% title('$\bar{\mathbf{x}}_e = (0,0)$','Interpreter','Latex')
% xlabel('$\bar{x}_1$','Interpreter','Latex') % x label
% ylabel('$\bar{x}_2$','Interpreter','Latex') % y label
% axis([ -3.4 3.6 -3.6 6 ])
% axis square
% 
% for i = 1:length(ax2)
%     set(ax2(i),'XGrid','on','YGrid','on','XMinorGrid','off','YMinorGrid','off','FontSize',FS1,'FontName','Times New Roman')
% end

%% Nonlinear System Function
function [dX,Phi,u]= Nonlinear_System1(X)
x1 = X(1) ;
x2 = X(2) ;

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

% function [dX,Phi,u] = Nonlinear_System2(X)
% x1 = X(1) ; x2 = X(2) ;
% 
% x1_bar = x1 ;
% x2_bar = x2 +2 ;
% Phi = -x1_bar - x1_bar^2 ;
% dt_Phi = (-1 - 2*x1_bar)*( -x1_bar + x1_bar^2 + x1_bar*x2_bar ) ;
% u = 1/( 1+ (x2_bar-2)^2 )*( -x1_bar - x1_bar^2 - 2*x2_bar + 2*Phi + dt_Phi ) ; % Control Input
% dx1 = x1 + x1^2 + x1*x2 ;
% dx2 = x1 + ( 1+x2^2 )*u ;
% dX = [ dx1 ; dx2  ] ;
% end
% 
% function [dZ,Phi,u] = Nonlinear_System_of_CT2(Z)
% z1 = Z(1) ; z2 = Z(2) ;
% 
% Phi = -z1 - z1^2 ;
% dt_Phi = (-1 - 2*z1)*( -z1 + z1^2 + z1*z2 ) ;
% u = 1/( 1+(z2-2)^2 )*( -z1 - z1^2 - 2*z2 + 2*Phi + dt_Phi) ; % Control Input
% dz1 = -z1 + z1^2 +  z1*z2 ;
% dz2 = z1 + (1+(z2-2)^2)*u ;
% dZ = [ dz1 ; dz2  ] ;
% end