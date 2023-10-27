%% Nonlinear Control HW4 - Q2 - (c)
clear ; clc ; close all ;
t_final = 10 ;
dT = 0.01 ;
t = 0 : dT : t_final ;
X0(:,:,1) = [ 1 ; 0.8 ] ; X0(:,:,2) = [ 2.5 ; -2.5 ] ; X0(:,:,3) = [ -0.4 ; -1.5 ] ; X0(:,:,4) = [ -2 ; 2 ] ;
X0(:,:,5) = [ 0.8 ; 2 ] ; X0(:,:,6) = [ 1.8 ; 1 ] ; X0(:,:,7) = [ -1.6 ; -1 ] ; X0(:,:,8) = [ -1 ; -2 ] ;

x_m_p = 0.01 : 0.01 : 10 ;
y_m_p = 1./x_m_p ; 
x_m_n = -0.01 : -0.01 : -10 ;
y_m_n = 1./x_m_n ; 
X_m = [x_m_p,x_m_n];
Y_m=[y_m_p,y_m_n ];


LW = 1.4 ;
FS_ax = 14.5 ;
patch(X_m,Y_m,'g','linewidth',1.5,'facecolor','g','edgecolor','g','facealpha',0.2) ;
hold on 
plot([-5 5],[0 0],'k-.') ;
plot([0 0],[-5 5],'k-.') ;
plot(0,0,'k.','MarkerSize',25) ;
text(0.3,-0.4,'$x_e = (0,0)$','Interpreter','latex','FontSize',15,'Color','k') ;
x_c = ['b','b','b','b','r','r','r','r'] ;
x_mc = ['bo';'bo';'bo';'bo';'ro';'ro';'ro';'ro'] ;
for i = 1:length(X0(1,1,:))
    [ t , X ] = RK4(@Nonlinear_func,[0 t_final],X0(:,:,i),dT) ;
    plot(X(:,1),X(:,2),x_c(i),'LineWidth',LW)
    plot(X(1,1),X(1,2),x_mc(i,:),'LineWidth',LW)
end
axis equal
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
axis([-3.3 3.3 -3.3 3.3])
grid on
ax(1) = gca ;

for i = 1:length(ax)
    set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman','box','on')
end

function dX = Nonlinear_func(t,X)
%     x1 = X(1) ; x2 = X(2) ;
%     dX =  zeros(2,1) ;
%     dX(1) = -x1 + 2*(x1^2)*x2 ;
%     dX(2) = -x2 ; 
    x1 = X(1) ; x2 = X(2) ;
    dx1 = -x1 + 2*(x1^2)*x2 ;
    dx2 = -x2 ; 
    dX = [ dx1 ; dx2 ] ;
end
