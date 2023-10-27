%% Nonlinear Control HW8_2 
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
[ t , X ] = ode45( @(t,X) Nonlinear_System_rand(X,t) , t, X0);
X=X';
for i =1:length(t)
    [dX(:,i) , theta_1(i) , theta_2(i) , u(i) , s(i) ] = Nonlinear_System_rand(X(:,i),t(i)) ;
end

%% Plot State time response for Nonlinear_System_rand
figure(1)
plot(t, X(1,:), 'r', 'LineWidth', LW)
hold on
plot(t, X(2,:), 'b', 'LineWidth', LW)
hs(1)=legend({'$x_1(t)$','$x_2(t)$'},'Interpreter','latex');
ax(1)=gca;
xlabel('Time (sec)') 
ylabel('States    $x_1, x_2 $','Interpreter','Latex') 
axis normal
grid on

figure(2)
plot(t,u,'-','Color','b','LineWidth',LW);
ax(2) = gca ;
xlabel('Time (sec)') 
ylabel('Control Input $u(t)$','Interpreter','Latex') 
axis normal
grid on

figure(3)
plot(t,s,'b','LineWidth',LW)
ax(3)=gca;
xlabel('Time (sec)') 
ylabel('Sliding Surface $S(t)$','Interpreter','Latex') 
axis normal
grid on

figure(4)
x1s=-3:0.1:3 ;
x2s=-2.*x1s;
plot(x1s,x2s,'r--','LineWidth',LW)
hold on
plot(X(1,:),X(2,:),'b','LineWidth',LW)    
plot(X(1,1),X(2,1),'bo','LineWidth',LW) ; 
plot([-5 5],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot([0 0],[-5 5],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
ax(4) = gca ;
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
axis([ -3 3 -4 4 ])
axis square
grid on

%% Calculate Results for Nonlinear_System_sinusoidal
[ t , X ] = ode45( @(t,X) Nonlinear_System_sin(X,t) , t, X0);
X=X';
for i =1:length(t)
    [dX(:,i) , theta_1(i) , theta_2(i) , u(i) , s(i) ] = Nonlinear_System_sin(X(:,i),t(i)) ;
end

%% Plot State time response for Nonlinear_System_sin
figure(5)
plot(t, X(1,:), 'r', 'LineWidth', LW)
hold on
plot(t, X(2,:), 'b', 'LineWidth', LW)
hs(2)=legend({'$x_1(t)$','$x_2(t)$'},'Interpreter','latex');
ax(5)=gca;
xlabel('Time (sec)') 
ylabel('States    $x_1, x_2 $','Interpreter','Latex') 
axis normal
grid on

figure(6)
plot(t,u,'-','Color','b','LineWidth',LW);
ax(6) = gca ;
xlabel('Time (sec)') 
ylabel('Control Input $u(t)$','Interpreter','Latex') 
axis normal
grid on

figure(7)
plot(t,s,'b','LineWidth',LW)
ax(7)=gca;
xlabel('Time (sec)') 
ylabel('Sliding Surface $S(t)$','Interpreter','Latex') 
axis normal
grid on

figure(8)
x1s=-3:0.1:3 ;
x2s=-2.*x1s;
plot(x1s,x2s,'r--','LineWidth',LW)
hold on
plot(X(1,:),X(2,:),'b','LineWidth',LW)    
plot(X(1,1),X(2,1),'bo','LineWidth',LW) ; 
plot([-5 5],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot([0 0],[-5 5],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
ax(8) = gca ;
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
axis([ -3 3 -4 4 ])
axis square
grid on

%% Calculate Results for Nonlinear_System_cos
[ t , X ] = ode45( @(t,X) Nonlinear_System_cos(X,t) , t, X0);
X=X';
for i =1:length(t)
    [dX(:,i) , theta_1(i) , theta_2(i) , u(i) , s(i) ] = Nonlinear_System_cos(X(:,i),t(i)) ;
end

%% Plot State time response for Nonlinear_System_cos
figure(9)
plot(t, X(1,:), 'r', 'LineWidth', LW)
hold on
plot(t, X(2,:), 'b', 'LineWidth', LW)
hs(3)=legend({'$x_1(t)$','$x_2(t)$'},'Interpreter','latex');
ax(9)=gca;
xlabel('Time (sec)') 
ylabel('States    $x_1, x_2 $','Interpreter','Latex') 
axis normal
grid on

figure(10)
plot(t,u,'-','Color','b','LineWidth',LW);
ax(10) = gca ;
xlabel('Time (sec)') 
ylabel('Control Input $u(t)$','Interpreter','Latex') 
axis normal
grid on

figure(11)
plot(t,s,'b','LineWidth',LW)
ax(11)=gca;
xlabel('Time (sec)') 
ylabel('Sliding Surface $S(t)$','Interpreter','Latex') 
axis normal
grid on

figure(12)
x1s=-3:0.1:3 ;
x2s=-2.*x1s;
plot(x1s,x2s,'r--','LineWidth',LW)
hold on
plot(X(1,:),X(2,:),'b','LineWidth',LW)    
plot(X(1,1),X(2,1),'bo','LineWidth',LW) ; 
plot([-5 5],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot([0 0],[-5 5],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
ax(12) = gca ;
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
axis([ -3 3 -4 4 ])
axis square
grid on

%% Calculate Results for Nonlinear_System_sin_cos
[ t , X ] = ode45( @(t,X) Nonlinear_System_sin_cos(X,t) , t, X0);
X=X';
for i =1:length(t)
    [dX(:,i) , theta_1(i) , theta_2(i) , u(i) , s(i) ] = Nonlinear_System_sin_cos(X(:,i),t(i)) ;
end

%% Plot State time response for Nonlinear_System_sin_cos
figure(13)
plot(t, X(1,:), 'r', 'LineWidth', LW)
hold on
plot(t, X(2,:), 'b', 'LineWidth', LW)
hs(4)=legend({'$x_1(t)$','$x_2(t)$'},'Interpreter','latex');
ax(13)=gca;
xlabel('Time (sec)') 
ylabel('States    $x_1, x_2 $','Interpreter','Latex') 
axis normal
grid on

figure(14)
plot(t,u,'-','Color','b','LineWidth',LW);
ax(14) = gca ;
xlabel('Time (sec)') 
ylabel('Control Input $u(t)$','Interpreter','Latex') 
axis normal
grid on

figure(15)
plot(t,s,'b','LineWidth',LW)
ax(15)=gca;
xlabel('Time (sec)') 
ylabel('Sliding Surface $S(t)$','Interpreter','Latex') 
axis normal
grid on

figure(16)
x1s=-3:0.1:3 ;
x2s=-2.*x1s;
plot(x1s,x2s,'r--','LineWidth',LW)
hold on
plot(X(1,:),X(2,:),'b','LineWidth',LW)    
plot(X(1,1),X(2,1),'bo','LineWidth',LW) ; 
plot([-5 5],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot([0 0],[-5 5],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
ax(16) = gca ;
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
axis([ -3 3 -4 4 ])
axis square
grid on


%% Multiple Point
X_0_1 = [1  ; 2] ; X_0_2 = [2  ; 1] ; X_0_3 = [3  ; -1] ;
X_0_4 = [-1  ; -2] ; X_0_5 = [-2  ; -1] ; X_0_6 = [-3  ; 2] ;
X_0_t = [ X_0_1 , X_0_2 , X_0_3 , X_0_4 , X_0_5 , X_0_6 ] ;
Dfcolor1 = summer(5) ;
Dfcolor1 = Dfcolor1(1:3,:) ;
Dfcolor2 = bone(6) ;
Dfcolor2 = Dfcolor2(2:4,:) ;
Dfcolor = [Dfcolor1;Dfcolor2] ;

for i = 1:length(X_0_t(1,:))
    [ ts , Xt ] = ode45( @(t,X) Nonlinear_System_rand(X,t) , t, X_0_t(:,i)) ;
    Xt = Xt' ;
    x1 = Xt(1,:) ;
    x2 = Xt(2,:) ;
    X1(i,:) = x1 ;
    X2(i,:) = x2 ;
    
    for k =1:length(ts)
        [dX(:,k) , theta1(k) , theta2(k) , uc(k) , s(:,k) ] = Nonlinear_System_rand(Xt(:,k),t(k)) ;
    end
    st(i,:) = s ;
end

figure(17) ;
for i = 1:length(X_0_t(1,:))
    plot(ts,st(i,:),'-','Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;
end
hs(5)=legend({'Test1','Test2','Test3','Test4','Test5','Test6'},'Interpreter','latex');
ax(17) = gca ;
axis([0 6 -6 6])
xlabel('Time (sec)') % x label
ylabel('Sliding Surface  $s$','Interpreter','Latex') % y label
axis normal
grid on

figure(18) ;
x1s = -4:0.1:4 ;
x2s = -(1+1).*x1s ;
plot(x1s,x2s,'-.','Color',[0.9 0.04 0],'LineWidth',LW) ; hold on ; 
plot([-6 6],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ; 
plot([0 0],[-6 6],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
for i = 1:length(X_0_t(1,:))
    plot(X1(i,:),X2(i,:),'-','Color',Dfcolor(i,:),'LineWidth',LW) ; 
    plot(X1(i,1),X2(i,1),'o','Color',Dfcolor(i,:),'LineWidth',LW) ; 
end
ax(18) = gca ;
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
xlim([-6  6]) ;
ylim([-6  6]) ;
axis square
grid on

%% 
for i = 1:length(ax)
    set(ax(i),'FontSize',FS,'FontName','Times New Roman')
end

for i = 1:length(hs)
    set(hs(i),'FontSize',FS_lg,'FontName','Times New Roman')
end
%% Nonlinear System uniform [-1 1]
function [dX, theta_1,theta_2,u,s]=Nonlinear_System_rand(X,t)
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

%% Nonlinear System sin [-1 1]
function [dX, theta_1,theta_2,u,s]=Nonlinear_System_sin(X,t)
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

theta_1=sin(t);
theta_2=sin(t);

dx1=x2+theta_1*x1*sin(x2);
dx2=theta_2*x2^2+x1+u;
dX=[dx1;dx2];
end

%% Nonlinear System cos [-1 1]
function [dX, theta_1,theta_2,u,s]=Nonlinear_System_cos(X,t)
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

theta_1=cos(t);
theta_2=cos(t);

dx1=x2+theta_1*x1*sin(x2);
dx2=theta_2*x2^2+x1+u;
dX=[dx1;dx2];
end

%% Nonlinear System sin_cos [-1 1]
function [dX, theta_1,theta_2,u,s]=Nonlinear_System_sin_cos(X,t)
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

theta_1=sin(t);
theta_2=cos(t);

dx1=x2+theta_1*x1*sin(x2);
dx2=theta_2*x2^2+x1+u;
dX=[dx1;dx2];
end
