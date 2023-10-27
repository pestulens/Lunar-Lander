%% Nonlinear Control HW6_3
clc;
clear;
close all;

%%
dt=0.01;
t_final=2000;
t=0:dt:t_final;
LW1=1.6;
FS1=16;
FS_lg=11;

%% Single Point with Feedback Linearization Control
f1=figure;
x1_0=-2.5; x2_0=2; x3_0=2;
X0=[x1_0;x2_0;x3_0];
[t,x_u] = RK4(@(t,x_u) Nonlinear_system(t,x_u) , [0 t_final], X0 ,dt);
x_u_1=x_u(:,1);
x_u_2=x_u(:,2);
x_u_3=x_u(:,3);
p1=plot3(x_u_1,x_u_2,x_u_3, 'b', 'LineWidth', LW1);
hold on
plot3(x_u_1(1),x_u_2(1),x_u_3(1),'bo','LineWidth',LW1);
hold on

%% Single Point without Feedback Linearization Control
x1_0=-2.5; x2_0=2; x3_0=2;
X0=[x1_0;x2_0;x3_0];
[t,x_nou] = RK4(@(t,x_nou) Nonlinear_system_u0(t,x_nou) , [0 t_final], X0 ,dt);
x_nou_1=x_nou(:,1);
x_nou_2=x_nou(:,2);
x_nou_3=x_nou(:,3);
p2=plot3(x_nou_1,x_nou_2,x_nou_3, 'r', 'LineWidth', LW1);
hold on
plot3(x_nou_1(1), x_nou_2(1), x_nou_3(1),'ro','LineWidth',LW1);
plot3([-3 0],[0 0],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot3([0 0],[-1000 1000],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot3([0 0],[0 0],[-1000 1000],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
hs3(1)=legend([p1, p2],{'$\mathbf{x}$(0)=(-2.5,2,2) $u\neq0$','$\mathbf{x}$(0)=(-2.5,2,2) $u=0$'},'Interpreter','latex');
ax3(1)=gca;
xlabel('$x_1$','Interpreter','Latex') 
ylabel('$x_2$','Interpreter','Latex') 
zlabel('$x_3$','Interpreter','Latex') 
axis([-3 0 -1000 1000 -1000 1000]) 
axis normal 
grid on 

%% Plot x1-x2
f2=figure;
p3=plot(x_u_1,x_u_2, 'b', 'LineWidth', LW1);
hold on
plot(x_u_1(1),x_u_2(1),'bo','LineWidth',LW1);
hold on
p4=plot(x_nou_1,x_nou_2, 'r', 'LineWidth', LW1);
hold on
plot(x_nou_1(1),x_nou_2(1), 'ro', 'LineWidth', LW1);
plot([-3 0],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot([0 0],[-1000 1000],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
ax2(1) = gca ;
xlabel('$x_1$','Interpreter','Latex') 
ylabel('$x_2$','Interpreter','Latex') 
axis([-3 0 -1000 2500]) 
axis normal
grid on

%% Plot x1-x3
f3=figure;
p5=plot(x_u_1,x_u_3, 'b', 'LineWidth', LW1);
hold on
plot(x_u_1(1),x_u_3(1),'bo','LineWidth',LW1);
hold on
p6=plot(x_nou_1,x_nou_3, 'r', 'LineWidth', LW1);
hold on
plot(x_nou_1(1),x_nou_3(1), 'ro', 'LineWidth', LW1);
plot([-3 0],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot([0 0],[-1000 2500],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
ax2(2) = gca ;
xlabel('$x_1$','Interpreter','Latex') 
ylabel('$x_3$','Interpreter','Latex') 
axis([-3 0 -1000 2500]) 
axis normal
grid on

%% Plot x2-x3
f4=figure;
p7=plot(x_u_2,x_u_3, 'b', 'LineWidth', LW1);
hold on
plot(x_u_2(1),x_u_3(1),'bo','LineWidth',LW1);
hold on
p8=plot(x_nou_2,x_nou_3, 'r', 'LineWidth', LW1);
hold on
plot(x_nou_2(1),x_nou_3(1), 'ro', 'LineWidth', LW1);
plot([-1000 2500],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot([0 0],[-1000 2500],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
ax2(3) = gca ;
xlabel('$x_2$','Interpreter','Latex') 
ylabel('$x_3$','Interpreter','Latex') 
axis([-1000 2500 -1000 2500]) 
axis normal
grid on

%%
for i = 1:length(ax3) 
    set(ax3(i),'FontSize',FS1,'FontName','Times New Roman') 
end 
for i = 1:length(ax2) 
    set(ax2(i),'FontSize',FS1,'FontName','Times New Roman') 
end 
for i = 1:length(hs3)
    set(hs3(i),'FontSize',FS_lg,'FontName','Times New Roman')
end
%% Nonlinear System Funciton
function dX=Nonlinear_system_u0(t,x)
dX=zeros(3,1);
dX(1)=-x(1)+x(2)-x(3);
dX(2)=-x(1)*x(3)-x(2);
dX(3)=-x(1);
end

%% Nonlinear System Funciton
function dX=Nonlinear_system(t,x)
u=(1/(-1-x(1)))*(-(x(1))^2-4*x(1)-3*x(2)-(x(3))^2+7*x(3)+3*x(1)*x(3)+x(2)*x(3));
dX=zeros(3,1);
dX(1)=-x(1)+x(2)-x(3);
dX(2)=-x(1)*x(3)-x(2)+u;
dX(3)=-x(1)+u;
end