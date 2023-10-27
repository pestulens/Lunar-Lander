%% Nolinear Control HW4_2
clc;
clear;
close all;

%% Initial Parameter
t_final=100;
dt=0.01;
t=0:dt:t_final;
LW = 1.4 ; 
FS_ax = 14.5 ; 

%% Convergence Region
% (a)
x_CR1_p=0.01:0.01:5;
y_CR1_p=1./(2*x_CR1_p);
x_CR1_n=-0.01:-0.01:-5;
y_CR1_n=1./(2*x_CR1_n);
x_CR1=[x_CR1_p,x_CR1_n];
y_CR1=[y_CR1_p,y_CR1_n];
patch(x_CR1,y_CR1,'g','linewidth',1.5,'facecolor','g','edgecolor','g','facealpha',0.2) ; 
hold on 
% (b)
x_CR2_p=0.01:0.01:5;
y_CR2_p=1./(x_CR2_p);
x_CR2_n=-0.01:-0.01:-5;
y_CR2_n=1./(x_CR2_n);
x_CR2=[x_CR2_p,x_CR2_n];
y_CR2=[y_CR2_p,y_CR2_n];
patch(x_CR2,y_CR2,'y','linewidth',1.5,'facecolor','y','edgecolor','y','facealpha',0.2) ; 
hold on 
plot([-5 5],[0 0],'k-.') ; 
plot([0 0],[-5 5],'k-.') ; 
plot(0,0,'k.','MarkerSize',25) ; 
text(0.3,-0.4,'$x_e = (0,0)$','Interpreter','latex','FontSize',15,'Color','k') ; 
text(0.5,2,'$\leftarrow x_1x_2=1$','Interpreter','latex','FontSize',15,'Color','k');
text(0.71,0.75,'$\leftarrow 2x_1x_2=1$','Interpreter','latex','FontSize',15,'Color','k');

%% Plot
c=[1 -1; 0.2 0.2;-0.2 -0.2;-1 1;3 -1;-3 1;0.9 0.9;-0.9 -0.9;2 0.4;-2 -0.4;-1 -2;-2 -1;1 2;2 1];
x_c = ['b','b','b','b','b','b','r','r','r','r','m','m','m','m'] ; 
x_mc = ['bo';'bo';'bo';'bo';'bo';'bo';'ro';'ro';'ro';'ro';'mo';'mo';'mo';'mo'] ; 
for i = 1:size(c,1)
 [ t , X ] = ode45(@Nonlinear_func,t,c(i,:)) ; 
 plot(X(:,1),X(:,2),x_c(i),'LineWidth',LW) 
 plot(X(1,1),X(1,2),x_mc(i,:),'LineWidth',LW) 
end 
axis equal 
xlabel('$x_1$','Interpreter','Latex') 
ylabel('$x_2$','Interpreter','Latex') 
axis([-3.5 3.5 -3.5 3.5]) 
grid on 
ax(1) = gca ; 
for i = 1:length(ax) 
 set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman') 
end 
xticks(-3:1:3)
function dX = Nonlinear_func(t,X) 
 x1 = X(1) ; 
 x2 = X(2) ; 
 dx1 = -x1 + 2*(x1^2)*x2 ; 
 dx2 = -x2 ; 
 dX = [ dx1 ; dx2 ] ; 
end