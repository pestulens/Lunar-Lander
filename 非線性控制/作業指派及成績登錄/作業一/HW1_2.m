% Nonlinear Control HW1_2
%%
clc;
clear;
close all;

%% Initial Condition
c1=[1 1 0];
c2=[10 1 0];

%% Time Span
delta_t=0.01;
t_final_1=100;
t_final_2=1000;
t_final_3=10000;
t1=0:delta_t:t_final_1;
t2=0:delta_t:t_final_2;
t3=0:delta_t:t_final_3;

%% Case 1
[t1_case1, X1_case1]=ode45(@Lorentz, t1, c1);
[t2_case1, X2_case1]=ode45(@Lorentz, t2, c1);
[t3_case1, X3_case1]=ode45(@Lorentz, t3, c1);

%% Case 2
[t1_case2, X1_case2]=ode45(@Lorentz, t1, c2);
[t2_case2, X2_case2]=ode45(@Lorentz, t2, c2);
[t3_case2, X3_case2]=ode45(@Lorentz, t3, c2);

%% Plot
LW_1=1;
LW_2=1.3;
FS_ax=16.5;
FS_leg=15;


%% Initial Condition 1, T=100
f(1) = figure('Units','Normalized','Position',[0.29,0.29,0.477,0.415]) ;  
plot3(X1_case1(:,1),X1_case1(:,2),X1_case1(:,3),'r','LineWidth',LW_1) ; 
xlabel('$x(t)$', 'Interpreter', 'latex')
ylabel('$y(t)$', 'Interpreter', 'latex')
zlabel('$z(t)$', 'Interpreter', 'latex')
title('Initial Condition: $(x,y,z)=(1,1,0)$', 'Interpreter', 'latex')
ax(1)=gca;
hs(1) = legend(['T =',num2str(t_final_1)]) ; 
grid on


%% Initial Condition 1, T=1000
f(2) = figure('Units','Normalized','Position',[0.29,0.29,0.477,0.415]) ;  
plot3(X2_case1(:,1),X2_case1(:,2),X2_case1(:,3),'r','LineWidth',LW_1) ; 
xlabel('$x(t)$', 'Interpreter', 'latex')
ylabel('$y(t)$', 'Interpreter', 'latex')
zlabel('$z(t)$', 'Interpreter', 'latex')
title('Initial Condition: $(x,y,z)=(1,1,0)$', 'Interpreter', 'latex')
ax(2)=gca;
hs(2) = legend(['T =',num2str(t_final_2)]) ; 
grid on

%% Initial Condition 1, T=10000
f(3) = figure('Units','Normalized','Position',[0.29,0.29,0.477,0.415]) ;  
plot3(X3_case1(:,1),X3_case1(:,2),X3_case1(:,3),'r','LineWidth',LW_1) ; 
xlabel('$x(t)$', 'Interpreter', 'latex')
ylabel('$y(t)$', 'Interpreter', 'latex')
zlabel('$z(t)$', 'Interpreter', 'latex')
title('Initial Condition: $(x,y,z)=(1,1,0)$', 'Interpreter', 'latex')
ax(3)=gca;
hs(3) = legend(['T =',num2str(t_final_3)]) ; 
grid on

%% Initial Condition 2, T=100
f(4) = figure('Units','Normalized','Position',[0.29,0.29,0.477,0.415]) ;  
plot3(X1_case2(:,1),X1_case2(:,2),X1_case2(:,3),'r','LineWidth',LW_1) ; 
xlabel('$x(t)$', 'Interpreter', 'latex')
ylabel('$y(t)$', 'Interpreter', 'latex')
zlabel('$z(t)$', 'Interpreter', 'latex')
title('Initial Condition: $(x,y,z)=(1,1,0)$', 'Interpreter', 'latex')
ax(4)=gca;
hs(4) = legend(['T =',num2str(t_final_1)]) ; 
grid on


%% Initial Condition 2, T=1000
f(5) = figure('Units','Normalized','Position',[0.29,0.29,0.477,0.415]) ;  
plot3(X2_case2(:,1),X2_case2(:,2),X2_case2(:,3),'r','LineWidth',LW_1) ; 
xlabel('$x(t)$', 'Interpreter', 'latex')
ylabel('$y(t)$', 'Interpreter', 'latex')
zlabel('$z(t)$', 'Interpreter', 'latex')
title('Initial Condition: $(x,y,z)=(1,1,0)$', 'Interpreter', 'latex')
ax(5)=gca;
hs(5) = legend(['T =',num2str(t_final_2)]) ; 
grid on

%% Initial Condition 2, T=10000
f(6) = figure('Units','Normalized','Position',[0.29,0.29,0.477,0.415]) ;  
plot3(X3_case2(:,1),X3_case2(:,2),X3_case2(:,3),'r','LineWidth',LW_1) ; 
xlabel('$x(t)$', 'Interpreter', 'latex')
ylabel('$y(t)$', 'Interpreter', 'latex')
zlabel('$z(t)$', 'Interpreter', 'latex')
title('Initial Condition: $(x,y,z)=(1,1,0)$', 'Interpreter', 'latex')
ax(6)=gca;
hs(6) = legend(['T =',num2str(t_final_3)]) ; 
grid on

%% Time Response
f(7) = figure('Units','Normalized','Position',[0.29,0.29,0.477,0.415]) ; 
plot(t1, X1_case1(:,1), 'b','LineWidth',LW_1)
hold on
plot(t1, X1_case2(:,1), 'g--','LineWidth',LW_1)
xlabel('Time (s)')
ylabel('$x(t)$', 'Interpreter', 'latex')
title('Time Response of x')
ax(7)=gca;
legend({'Initial Condition: $(x,y,z)=(1,1,0)$', 'Initial Condition: $(x,y,z)=(10,1,0)$'},'Interpreter','latex','Location','Northeast');
ax(7).YLim=([-20 40]);
grid on


for i = 1:length(ax) 
 set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman') 
end 

for i = 1:length(hs) 
set(hs(i),'Position',[0.70,0.29,0.15,0.21],'Fontsize',FS_leg) 
end 


function dX=Lorentz(t,X)
x=X(1);
y=X(2);
z=X(3);
dx=10*(y-x);
dy=x*(28-z)-y;
dz=x*y-8*z/3;
dX=[dx dy dz]';
end


