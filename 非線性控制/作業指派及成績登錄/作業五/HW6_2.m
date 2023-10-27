%% Nonlinear Control HW6_2
clc;
clear;
close all;

%%
dt=0.01;
t_final=20;
t=0:dt:t_final;
LW1=1.6;
FS1=16;
FS_lg=11;

%% Single Point
f1=figure;
x1_0=2; x2_0=2; x3_0=2;
X0=[x1_0;x2_0;x3_0];
[t,x]=ode45(@Nonlinear_system, t, X0);
plot3(x(:,1),x(:,2),x(:,3), 'b', 'LineWidth', LW1) 
hold on
plot3(x1_0,x2_0,x3_0,'bo','LineWidth',LW1);
plot3([-4 4],[0 0],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot3([0 0],[-4 4],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot3([0 0],[0 0],[-4 4],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
hs3(1)=legend({'$\mathbf{x}$(0)=(2,2,2)'},'Interpreter','latex');
ax3(1)=gca;
xlabel('$x_1$','Interpreter','Latex') 
ylabel('$x_2$','Interpreter','Latex') 
zlabel('$x_3$','Interpreter','Latex') 
axis([-1.5 2.5 -1 2.5 -1 2.5]) 
axis normal 
grid on 

%% Choose 10 arbitrary points 3D plot
f2=figure;
x1=[-5;5;5];
x2=[5;-5;5];
x3=[5;5;-5];
x4=[-5;-5;5];
x5=[5;-5;-5];
x6=[-5;5;-5];
x7=[5;5;5];
x8=[-5;-5;-5];
x9=[4;1;6];
x10=[-8;4;3];
x_arb=[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10];
ColorCode = [0,0.15,0.39; 0,0.3,0.8 ; 0,0.39,0.7 ; 0,0.47,0.51 ; 0,0.47,0.39 ; 0,0.55,0.35 ; 0,0.63,0.35 ; 0,0.75,0.6 ; 0,0.85,0.5 ; 0,0.95,0.4];
for i=1:length(x_arb(1,:))
    [t,x_10] = RK4(@(t,x_10) Nonlinear_system(t,x_10) , [0 t_final], x_arb(:,i) ,dt);
    x1_arb=x_10(:,1);
    x2_arb=x_10(:,2);
    x3_arb=x_10(:,3);
    
    p2(i)=plot3(x1_arb, x2_arb, x3_arb, 'Color', ColorCode(i,:), 'LineWidth', LW1);
    hold on
    plot3(x1_arb(1), x2_arb(1), x3_arb(1),'o', 'Color', ColorCode(i,:), 'LineWidth', LW1);
end
plot3([-40 10],[0 0],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot3([0 0],[-7000 1500],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot3([0 0],[0 0],[-7000 150],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
hs3(2)=legend([p2(1),p2(2),p2(3),p2(4),p2(5),p2(6),p2(7),p2(8),p2(9),p2(10)],{'$\mathbf{x}$(0)=(-5,5,5)','$\mathbf{x}$(0)=(5,-5,5)','$\mathbf{x}$(0)=(5,5,-5)','$\mathbf{x}$(0)=(-5,-5,5)','$\mathbf{x}$(0)=(5,-5,-5)','$\mathbf{x}$(0)=(-5,5,-5)','$\mathbf{x}$(0)=(5,5,5)','$\mathbf{x}$(0)=(-5,-5,-5)','$\mathbf{x}$(0)=(4,1,6)','$\mathbf{x}$(0)=(-8,4,3)'},'Interpreter','latex');
ax3(2) = gca ;
xlabel('$x_1$','Interpreter','Latex') 
ylabel('$x_2$','Interpreter','Latex') 
zlabel('$x_3$','Interpreter','Latex') 
axis([-40 10 -7000 1500 -7000 150]) 
axis normal
grid on

%% Choose 10 arbitrary points x1-x2 plot
f3=figure;
for i=1:length(x_arb(1,:))
    [t,x_10] = RK4(@(t,x_10) Nonlinear_system(t,x_10) , [0 t_final], x_arb(:,i) ,dt);
    x1_arb=x_10(:,1);
    x2_arb=x_10(:,2);
    
    p3(i)=plot(x1_arb, x2_arb,'Color', ColorCode(i,:), 'LineWidth', LW1);
    hold on
    plot(x1_arb(1), x2_arb(1),'o', 'Color', ColorCode(i,:), 'LineWidth', LW1);
end
plot([-40 10],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot([0 0],[-7000 1500],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
hs2(1)=legend([p3(1),p3(2),p3(3),p3(4),p3(5),p3(6),p3(7),p3(8),p3(9),p3(10)],{'$\mathbf{x}$(0)=(-5,5,5)','$\mathbf{x}$(0)=(5,-5,5)','$\mathbf{x}$(0)=(5,5,-5)','$\mathbf{x}$(0)=(-5,-5,5)','$\mathbf{x}$(0)=(5,-5,-5)','$\mathbf{x}$(0)=(-5,5,-5)','$\mathbf{x}$(0)=(5,5,5)','$\mathbf{x}$(0)=(-5,-5,-5)','$\mathbf{x}$(0)=(4,1,6)','$\mathbf{x}$(0)=(-8,4,3)'},'Interpreter','latex');
ax2(1) = gca ;
xlabel('$x_1$','Interpreter','Latex') 
ylabel('$x_2$','Interpreter','Latex') 
axis([-40 10 -7000 1500]) 
axis normal
grid on

%% Choose 10 arbitrary points x1-x3 plot
f4=figure;
for i=1:length(x_arb(1,:))
    [t,x_10] = RK4(@(t,x_10) Nonlinear_system(t,x_10) , [0 t_final], x_arb(:,i) ,dt);
    x1_arb=x_10(:,1);
    x3_arb=x_10(:,3);
    
    p4(i)=plot(x1_arb, x3_arb ,'Color', ColorCode(i,:), 'LineWidth', LW1);
    hold on
    plot(x1_arb(1), x3_arb(1),'o', 'Color', ColorCode(i,:), 'LineWidth', LW1);
end
plot([-40 10],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot([0 0],[-7000 150],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
hs2(2)=legend([p4(1),p4(2),p4(3),p4(4),p4(5),p4(6),p4(7),p4(8),p4(9),p4(10)],{'$\mathbf{x}$(0)=(-5,5,5)','$\mathbf{x}$(0)=(5,-5,5)','$\mathbf{x}$(0)=(5,5,-5)','$\mathbf{x}$(0)=(-5,-5,5)','$\mathbf{x}$(0)=(5,-5,-5)','$\mathbf{x}$(0)=(-5,5,-5)','$\mathbf{x}$(0)=(5,5,5)','$\mathbf{x}$(0)=(-5,-5,-5)','$\mathbf{x}$(0)=(4,1,6)','$\mathbf{x}$(0)=(-8,4,3)'},'Interpreter','latex');
ax2(2) = gca ;
xlabel('$x_1$','Interpreter','Latex') 
ylabel('$x_3$','Interpreter','Latex') 
axis([-40 10 -7000 150]) 
axis normal
grid on

%% Choose 10 arbitrary points x2-x3 plot
f5=figure;
for i=1:length(x_arb(1,:))
    [t,x_10] = RK4(@(t,x_10) Nonlinear_system(t,x_10) , [0 t_final], x_arb(:,i) ,dt);
    x2_arb=x_10(:,2);
    x3_arb=x_10(:,3);
    
    p5(i)=plot(x2_arb, x3_arb,'Color', ColorCode(i,:), 'LineWidth', LW1);
    hold on
    plot(x2_arb(1), x3_arb(1),'o', 'Color', ColorCode(i,:), 'LineWidth', LW1);
end
plot([-7000 1500],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot([0 0],[-7000 150],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
hs2(3)=legend([p5(1),p5(2),p5(3),p5(4),p5(5),p5(6),p5(7),p5(8),p5(9),p5(10)],{'$\mathbf{x}$(0)=(-5,5,5)','$\mathbf{x}$(0)=(5,-5,5)','$\mathbf{x}$(0)=(5,5,-5)','$\mathbf{x}$(0)=(-5,-5,5)','$\mathbf{x}$(0)=(5,-5,-5)','$\mathbf{x}$(0)=(-5,5,-5)','$\mathbf{x}$(0)=(5,5,5)','$\mathbf{x}$(0)=(-5,-5,-5)','$\mathbf{x}$(0)=(4,1,6)','$\mathbf{x}$(0)=(-8,4,3)'},'Interpreter','latex');
ax2(3) = gca ;
xlabel('$x_2$','Interpreter','Latex') 
ylabel('$x_3$','Interpreter','Latex') 
axis([-7000 1500 -7000 150]) 
axis normal
grid on

%% Choose 10 arbitrary points 3D plot Again
f6=figure;
x1=[1;2;4]; x2=[2;-3;-5]; x3=[-0.5;-3;-9]; x4=[0;-2;-3]; x5=[4;-6;-6];
x6=[5;7;5]; x7=[6;8;-4]; x8=[7;9;3]; x9=[8;10;-2]; x10=[9;11;1];
x_arb_re=[x1, x2, x3, x4, x5, x6, x7, x8, x9, x10];
ColorCode = [0,0.15,0.39; 0,0.3,0.8 ; 0,0.39,0.7 ; 0,0.47,0.51 ; 0,0.47,0.39 ; 0,0.55,0.35 ; 0,0.63,0.35 ; 0,0.75,0.6 ; 0,0.85,0.5 ; 0,0.95,0.4];
for i=1:length(x_arb_re(1,:))
    [t,x_10_re] = RK4(@(t,x_10_re) Nonlinear_system(t,x_10_re) , [0 t_final], x_arb_re(:,i) ,dt);
    x1_arb_re=x_10_re(:,1);
    x2_arb_re=x_10_re(:,2);
    x3_arb_re=x_10_re(:,3);
    
    
    % Check For Divergence
    if max(x1_arb_re)>15 || abs(max(x1_arb_re))>15
        disp(i)
        disp(': x1_arb_re divergent')
    end
    
    if max(x2_arb_re)>15 || abs(max(x2_arb_re))>15
        disp(i)
        disp(': x2_arb_re divergent')
    end
    
    if max(x3_arb_re)>15 || abs(max(x3_arb_re))>15
        disp(i)
        disp(': x3_arb_re divergent')
    end
        
    p6(i)=plot3(x1_arb_re, x2_arb_re, x3_arb_re, 'Color', ColorCode(i,:), 'LineWidth', LW1);
    hold on
    plot3(x1_arb_re(1), x2_arb_re(1), x3_arb_re(1),'o', 'Color', ColorCode(i,:), 'LineWidth', LW1);
end
plot3([-2 10],[0 0],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot3([0 0],[-10 15],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot3([0 0],[0 0],[-10 5],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
hs3(3)=legend([p6(1),p6(2),p6(3),p6(4),p6(5),p6(6),p6(7),p6(8),p6(9),p6(10)],{'$\mathbf{x}$(0)=(1;2;4)','$\mathbf{x}$(0)=(2;-3;-5)','$\mathbf{x}$(0)=(-0.5;-3;-9)','$\mathbf{x}$(0)=(0;-2;-3)','$\mathbf{x}$(0)=(4;-6;-6)','$\mathbf{x}$(0)=(5;7;5)','$\mathbf{x}$(0)=(6;8;-4)','$\mathbf{x}$(0)=(7;9;3)','$\mathbf{x}$(0)=(8;10;-2)','$\mathbf{x}$(0)=(9;11;1)'},'Interpreter','latex');
ax3(3) = gca ;
xlabel('$x_1$','Interpreter','Latex') 
ylabel('$x_2$','Interpreter','Latex') 
zlabel('$x_3$','Interpreter','Latex') 
axis([-2 10 -10 15 -10 5]) 
axis normal
grid on

%% Choose 10 arbitrary points x1-x2 plot again
f7=figure;
for i=1:length(x_arb_re(1,:))
    [t,x_10_re] = RK4(@(t,x_10_re) Nonlinear_system(t,x_10_re) , [0 t_final], x_arb_re(:,i) ,dt);
    x1_arb_re=x_10_re(:,1);
    x2_arb_re=x_10_re(:,2);
    
    p7(i)=plot(x1_arb_re, x2_arb_re,'Color', ColorCode(i,:), 'LineWidth', LW1);
    hold on
    plot(x1_arb_re(1), x2_arb_re(1),'o', 'Color', ColorCode(i,:), 'LineWidth', LW1);
end
ax2(4) = gca ;
xlabel('$x_1$','Interpreter','Latex') 
ylabel('$x_2$','Interpreter','Latex') 
axis normal
grid on

%% Choose 10 arbitrary points x1-x3 plot again
f8=figure;
for i=1:length(x_arb_re(1,:))
    [t,x_10_re] = RK4(@(t,x_10_re) Nonlinear_system(t,x_10_re) , [0 t_final], x_arb_re(:,i) ,dt);
    x1_arb_re=x_10_re(:,1);
    x3_arb_re=x_10_re(:,3);
    
    p8(i)=plot(x1_arb_re, x3_arb_re,'Color', ColorCode(i,:), 'LineWidth', LW1);
    hold on
    plot(x1_arb_re(1), x3_arb_re(1),'o', 'Color', ColorCode(i,:), 'LineWidth', LW1);
end
ax2(5) = gca ;
xlabel('$x_1$','Interpreter','Latex') 
ylabel('$x_3$','Interpreter','Latex') 
axis normal
grid on

%% Choose 10 arbitrary points x2-x3 plot again
f9=figure;
for i=1:length(x_arb_re(1,:))
    [t,x_10_re] = RK4(@(t,x_10_re) Nonlinear_system(t,x_10_re) , [0 t_final], x_arb_re(:,i) ,dt);
    x1_arb_re=x_10_re(:,1);
    x2_arb_re=x_10_re(:,2);
    x3_arb_re=x_10_re(:,3);
    
    p9(i)=plot(x2_arb_re, x3_arb_re,'Color', ColorCode(i,:), 'LineWidth', LW1);
    hold on
    plot(x2_arb_re(1), x3_arb_re(1),'o', 'Color', ColorCode(i,:), 'LineWidth', LW1);
end
ax2(6) = gca ;
xlabel('$x_2$','Interpreter','Latex') 
ylabel('$x_3$','Interpreter','Latex') 
axis normal
grid on

%%
f10=figure;
ColorCode = [0,0.15,0.39; 0,0.3,0.8 ; 0,0.39,0.7 ; 0,0.47,0.51 ; 0,0.47,0.39 ; 0,0.55,0.35 ; 0,0.63,0.35 ; 0,0.75,0.6 ; 0,0.85,0.5 ; 0,0.95,0.4];
for i=1:length(x_arb(1,:))
    [t,x_10] = RK4(@(t,x_10) Nonlinear_system(t,x_10) , [0 t_final], x_arb(:,i) ,dt);
    x1_arb=x_10(:,1);
    x2_arb=x_10(:,2);
    x3_arb=x_10(:,3);
    endvalue(i,1)=x1_arb(end);
    endvalue(i,2)=x1_arb(end);
    endvalue(i,3)=x1_arb(end);
     p10(i)=plot3(endvalue(i,1), endvalue(i,2), endvalue(i,3),'o', 'Color', ColorCode(i,:), 'LineWidth', LW1);
    hold on
end
plot3([-0.00005 0.00005],[0 0],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot3([0 0],[-0.00005 0.00005],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
plot3([0 0],[0 0],[-0.00005 0.00005],'--','Color',[0.5 0.5 0.5],'LineWidth',LW1);
hs3(4)=legend([p10(1),p10(2),p10(3),p10(4),p10(5),p10(6),p10(7),p10(8),p10(9),p10(10)],{'$\mathbf{x}$(0)=(-5,5,5)','$\mathbf{x}$(0)=(5,-5,5)','$\mathbf{x}$(0)=(5,5,-5)','$\mathbf{x}$(0)=(-5,-5,5)','$\mathbf{x}$(0)=(5,-5,-5)','$\mathbf{x}$(0)=(-5,5,-5)','$\mathbf{x}$(0)=(5,5,5)','$\mathbf{x}$(0)=(-5,-5,-5)','$\mathbf{x}$(0)=(4,1,6)','$\mathbf{x}$(0)=(-8,4,3)'},'Interpreter','latex');
ax3(4) = gca ;
xlabel('$x_1$','Interpreter','Latex') 
ylabel('$x_2$','Interpreter','Latex') 
zlabel('$x_3$','Interpreter','Latex') 
axis([-0.00005 0.00005 -0.00005 0.00005 -0.00005 0.00005]) 
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
for i = 1:length(hs2)
    set(hs2(i),'FontSize',FS_lg,'FontName','Times New Roman')
end
%% Nonlinear System Funciton
function dX=Nonlinear_system(t,x)
phi_1=x(1);
phi_2=-x(1)+x(2)-x(3);
phi_3=2*x(1)-2*x(2)+x(3)-x(1)*x(3);
a=-3*x(1)+4*x(2)-2*x(3)+3*x(1)*x(3)-x(2)*x(3)+(x(1))^2+(x(3))^2;
b=-1-x(1);
k1=6;
k2=11;
k3=6;
u=(b^(-1))*(-a-k1*phi_1-k2*phi_2-k3*phi_3);
dX=zeros(3,1);
dX(1)=-x(1)+x(2)-x(3);
dX(2)=-x(1)*x(3)-x(2)+u;
dX(3)=-x(1)+u;
end