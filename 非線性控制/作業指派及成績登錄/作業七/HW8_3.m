%% Nonlinear Control HW8_3
clc;
clear;
close all;

%% Initial Value
dt=0.0001;
t_final=10;
t=0:dt:t_final;
x1_0=2;
x2_0=2;
X0=[x1_0;x2_0];

%% Plot Parameter
LW = 1.6 ;
FS = 16 ;
FS_lg = 18 ;

%% Calculate Results for Nonlinear_System_rand
[ t1 , X1 ] = ode45( @(t,X) Nonlinear_System_rand_ab1(X,t) , t, X0);
X1=X1';
for i =1:length(t1)
    [dX1(:,i) , theta_1_1(i) , theta_2_1(i) , u1(i) , s1(i) ] = Nonlinear_System_rand_ab1(X1(:,i),t1(i)) ;
end

[ t2 , X2 ] = ode45( @(t,X) Nonlinear_System_rand_ab2(X,t) , t, X0);
X2=X2';
for i =1:length(t2)
    [dX2(:,i) , theta_1_2(i) , theta_2_2(i) , u2(i) , s2(i) ] = Nonlinear_System_rand_ab2(X2(:,i),t2(i)) ;
end

%% Plot State time response for Nonlinear_System_rand
figure(1)
plot(t, X2(1,:), 'r', 'LineWidth', LW)
hold on
plot(t, X2(2,:), 'b', 'LineWidth', LW)
hs(1)=legend({'$x_1(t)$','$x_2(t)$'},'Interpreter','latex');
ax(1)=gca;
title('$a=b=2$','Interpreter','Latex') 
xlabel('Time (sec)') 
ylabel('States    $x_1, x_2 $','Interpreter','Latex') 
ylim([-5 2.5])
axis normal
grid on

figure(2)
plot(t1,u2,'-','Color','b','LineWidth',LW);
hold on
plot(t1,u2,'-','Color','b','LineWidth',LW);
ax(2) = gca ;
xlabel('Time (sec)') 
ylabel('Control Input $u(t)$','Interpreter','Latex') 
axis normal
grid on

figure(3)
x1_s = -5:0.1:5 ;
x2_s = -(1+2).*x1_s ;
plot(x1_s,x2_s,'r--','LineWidth',LW)
hold on
plot(X2(1,:),X2(2,:),'b','LineWidth',LW)    
plot(X2(1,1),X2(2,1),'bo','LineWidth',LW) ; 
plot([-5 5],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot([0 0],[-6 6],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
ax(3) = gca ;
xlabel('$x_1$','Interpreter','Latex')
ylabel('$x_2$','Interpreter','Latex') 
axis([-5 5 -6 6])
grid on
axis square


figure(4)
p(1)=plot(t1,s1,'r','LineWidth',LW);
hold on
p(2)=plot(t2,s2,'b','LineWidth',LW);
hs(2)=legend([p(1),p(2)],{'$a=b=1$','$a=b=2$'},'Interpreter','latex');
ax(4) = gca ;
xlabel('Time (sec)') 
ylabel('Sliding Surface $s$','Interpreter','Latex') 
xlim([0 t_final])
ylim([-1 9])
axis normal
grid on

figure(5)
p(3)=plot(t1,X1(1,:),'r','LineWidth',LW);
hold on
p(4)=plot(t1,X2(1,:),'b','LineWidth',LW);
hs(3)=legend([p(3),p(4)],{'$a=b=1$','$a=b=2$'},'Interpreter','latex');
ax(5) = gca ;
xlabel('Time (sec)') % x label
ylabel('State  $x_1(t)$','Interpreter','Latex') % y label
axis normal
grid on

figure(6)
p(5)=plot(t2,X1(2,:),'r','LineWidth',LW);
hold on
p(6)=plot(t2,X2(2,:),'b','LineWidth',LW);
hs(4)=legend([p(5),p(6)],{'$a=b=1$','$a=b=2$'},'Interpreter','latex');
ax(6) = gca ;
xlabel('Time (sec)') % x label
ylabel('State  $x_2(t)$','Interpreter','Latex') % y label
axis normal
grid on

figure(7)
p(7)=plot(t1,u1,'-','Color','r','LineWidth',LW);
hold on
p(8)=plot(t2,u2,'-','Color','b','LineWidth',LW);
ax(7) = gca ;
hs(5)=legend([p(7),p(8)],{'$a=b=1$','$a=b=2$'},'Interpreter','latex');
xlabel('Time (sec)') 
ylabel('Control Input $u(t)$','Interpreter','Latex') 
axis normal
grid on
%% 
for i = 1:length(ax)
    set(ax(i),'FontSize',FS,'FontName','Times New Roman')
end

for i = 1:length(hs)
    set(hs(i),'FontSize',FS_lg,'FontName','Times New Roman')
end
%% Nonlinear System 
function [dX, theta_1,theta_2,u,s]=Nonlinear_System_rand_ab1(X,t)
% Constant
a=1;
b=1;
b0=1;
x1=X(1);
x2=X(2);
s=(1+a)*x1+x2; % Sliding Surface

u_eq=-x1-(1+a)*x2;
beta=a*(1+a)*abs(x1)+b*x2^2+b0;
u=u_eq-beta*sign(s);

theta_1=-1+2*rand(1);
theta_2=-1+2*rand(1);

dx1=x2+theta_1*x1*sin(x2);
dx2=theta_2*x2^2+x1+u;
dX=[dx1;dx2];
end

function [dX, theta_1,theta_2,u,s]=Nonlinear_System_rand_ab2(X,t)
% Constant
a=2;
b=2;
b0=1;
x1=X(1);
x2=X(2);
s=(1+a)*x1+x2; % Sliding Surface

u_eq=-x1-(1+a)*x2;
beta=a*(1+a)*abs(x1)+b*x2^2+b0;
u=u_eq-beta*sign(s);

theta_1=-2+4*rand(1);
theta_2=-2+4*rand(1);

dx1=x2+theta_1*x1*sin(x2);
dx2=theta_2*x2^2+x1+u;
dX=[dx1;dx2];
end