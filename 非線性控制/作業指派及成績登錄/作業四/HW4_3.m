%% Nolinear Control HW4_3
clc;
clear;
close all;

%% Initial Parameter
LW = 1.3;
FS_ax = 14.5;
t_final=100;
dt=0.01;
t=0:dt:t_final;

%% Contour Map
x_ax = linspace(-8,8,240) ; 
y_ax = linspace(-3,3,90) ; 
[X_ax,Y_ax] = meshgrid(x_ax,y_ax) ; 
V_xy = X_ax.^2./(1+X_ax.^2) + Y_ax.^2 ; 
f(1) = figure() ; 
contour(X_ax,Y_ax,V_xy,[0.2,0.7,0.9,1,1.5,2,3,4,5,6],'--','LineColor',[0.5 0.5 0.5],'ShowText','on'); 
hold on 

%% 
c=[0.1 0.1;-0.1 -0.1;1 0.3;-1 -0.3;2.3 0.3;-2.3 -0.3;4.3 0.5;-4.3 -0.5;-3.7 0.9;3.7 -0.9;-4.6 1.3;4.6 -1.3;-5.2 1.6;5.2 -1.6;-5.8 1.8;5.8 -1.8;-6.4 2;6.4 -2;-7 2.4;7 -2.4;4.4 0.9;-4.4 -0.9;4.5 1.3;-4.5 -1.3; 4.6 1.6; -4.6 -1.6;5 1.8;-5 -1.8;6 2.1;-6 -2.1];                                                                                                               
x_c = ['b','b','b','b','b','b','r','r','b','b','b','b','b','b','b','b','b','b','b','b','r','r','r','r','r','r','r','r','r','r'] ; 
x_mc = ['bo';'bo';'bo';'bo';'bo';'bo';'ro';'ro';'bo';'bo';'bo';'bo';'bo';'bo';'bo';'bo';'bo';'bo';'bo';'bo';'ro';'ro';'ro';'ro';'ro';'ro';'ro';'ro';'ro';'ro'] ; 
for i = 1:size(c,1)
[t,X]=ode45(@Nonlinear_func,t,c(i,:));
 plot(X(:,1),X(:,2),x_c(i),'LineWidth',LW) 
 plot(X(1,1),X(1,2),x_mc(i,:),'LineWidth',LW) 
 hold on
end 
plot([-8 8],[0 0],'k-.','LineWidth',1) ; 
plot([0 0],[-8 8],'k-.','LineWidth',1) ; 
plot(0,0,'k.','MarkerSize',25) ;
xlabel('$x_1$','Interpreter','Latex') % x label 
ylabel('$x_2$','Interpreter','Latex') % y label 
axis([-8 8 -2.5 2.5]) 
grid on 

ax(1) = gca ;
for i = 1:length(ax) 
 set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman','box','on') 
end
function dX = Nonlinear_func(t,X)  
 x1=X(1);
 x2=X(2); 
 dx1=-6*x1/((1+x1^2)^2) + 2*x2;
 dx2=-2*(x1+x2)/((1+x1^2)^2);
 dX=[ dx1 ; dx2 ];
end