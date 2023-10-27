%% Nonlinear Control HW4 - Q3 - (c)
clear ; clc ; close all ;
t_final = 10 ;
dT = 0.01 ;
t = 0 : dT : t_final ;
X0(:,:,1) = [ -4 ; 0.1 ] ; X0(:,:,2) = [ 3 ; 0.2 ] ; X0(:,:,3) = [ 1 ; 0.3 ] ; X0(:,:,4) = [ -7 ; 2 ] ;
X0(:,:,5) = [ 7 ; -1.5 ] ; X0(:,:,6) = [ 1.55 ; 1.85 ] ; X0(:,:,7) = [ -1.15 ; -1.15 ] ; X0(:,:,8) = [ 0.5 ; 2 ] ;

x_ax = linspace(-8,8,240) ;
y_ax = linspace(-3,3,90) ;
[X_ax,Y_ax] = meshgrid(x_ax,y_ax) ;
V_xy = X_ax.^2./(1+X_ax.^2) + Y_ax.^2 ;
figure
surf(X_ax,Y_ax,V_xy)
f(1) = figure() ;
contour(X_ax,Y_ax,V_xy,[0.2,0.7,0.9,1,1.5,2,3,4,5,6],'--','LineColor',[0.5 0.5 0.5],'ShowText','on');
hold on
LW = 1.3 ;
FS_ax = 14.5 ;
plot([-8 8],[0 0],'k-.','LineWidth',1) ;
plot([0 0],[-8 8],'k-.','LineWidth',1) ;
plot(0,0,'k.','MarkerSize',25) ;
x_c = ['b','b','b','b','b','r','r','r'] ;
x_mc = ['bo';'bo';'bo';'bo';'bo';'ro';'ro';'ro'] ;
for i = 1:length(X0(1,1,:))
%     x_c(i,1) = ['b'] ;
%     x_mc(i,:) = ['bo'] ;
    [ t , X ] = RK4(@Nonlinear_func,[0 t_final],X0(:,:,i),dT) ;
    plot(X(:,1),X(:,2),x_c(i),'LineWidth',LW)
    plot(X(1,1),X(1,2),x_mc(i,:),'LineWidth',LW)
end

xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
axis([-8 8 -2.5 2.5])
% grid on
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
    dx1 = -6*x1/((1+x1^2)^2) + 2*x2 ;
    dx2 = -2*(x1+x2)/((1+x1^2)^2) ; 
    dX = [ dx1 ; dx2 ] ;
end
