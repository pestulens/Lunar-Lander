%% Nonlinear Control HW4 - Q1 - (b)
clear ; clc ; close all ;
t_final = 10 ;
dT = 0.01 ;
t = 0 : dT : t_final ;
X0(:,:,1) = [ 0.5 ; 0.5 ] ; X0(:,:,2) = [ 0.6 ; -0.7 ] ; X0(:,:,3) = [ -0.6 ; -0.2 ] ;
X0(:,:,4) = [ 1 ; 0.5 ] ; X0(:,:,5) = [ 0.5 ; -1 ] ; X0(:,:,6) = [ -0.9 ; -0.7 ] ;
r_margin = 1 ;
theta = 0 : 0.01 : 2*pi ;
x_margin = r_margin*cos(theta) ;
y_margin = r_margin*sin(theta) ;

LW = 1.6 ;
FS_ax = 15 ;
col = ['b','b','b','g','g','g'] ;
colm = ['bo';'bo';'bo';'go';'go';'go'] ;
f1 = figure() ;
for i = 1:length(X0(1,1,:))
[ t , X ] = RK4(@Nonlinear_func,[0 t_final],X0(:,:,i),dT) ;
plot(X(:,1),X(:,2),col(i),'LineWidth',LW) ; hold on
plot(X(1,1),X(1,2),colm(i,:),'LineWidth',LW) ; 
end
plot([-2 2],[0 0],'k-.') ;
plot([0 0],[-2 2],'k-.') ;
plot(x_margin,y_margin,'r','LineWidth',LW) ;
text(-0.44,1.2,'$x_1^2+x_2^2 = 1$','Interpreter','latex','FontSize',16,'Color','r') ;
axis equal
ax(1) = gca ;
ax(1).XLim = [-1.6 1.6];
ax(1).YLim = [-1.6 1.6];
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
grid on


for i = length(ax)
    set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman')
end

function dX = Nonlinear_func(t,X)
%     x1 = X(1) ; x2 = X(2) ;
%     dX =  zeros(2,1) ;
%     dX(1) = ( x1 - x2 )*( x1^2 + x2^2 -1 ) ;
%     dX(2) = ( x1 + x2 )*( x1^2 + x2^2 -1 ) ; 
    x1 = X(1) ; x2 = X(2) ;
    dx1 = ( x1 - x2 )*( x1^2 + x2^2 -1 ) ;
    dx2 = ( x1 + x2 )*( x1^2 + x2^2 -1 ) ;
    dX = [ dx1 ; dx2 ] ;
end
