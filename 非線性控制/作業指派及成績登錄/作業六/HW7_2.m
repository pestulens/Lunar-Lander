%% Nonlinear Control HW7-2
clc;
clear;
close all;

%%
dt=0.001;
t_final=20;
t=0:dt:t_final;
LW=1.2;
FS1=16;
FS_lg=18;
Dfcolor=winter(10);

%% Set Initial Condition
xi_1=[1;1]; xi_2=[0.5;3]; xi_3=[-1;-3]; xi_4=[-2;-4]; xi_5=[2;-3];
xi_6=[0.7;-2]; xi_7=[-4;1]; xi_8=[-0.9;2]; xi_9=[2.3;2.7]; xi_10=[4;-3];
Xi_0=[xi_1, xi_2, xi_3, xi_4, xi_5, xi_6, xi_7, xi_8, xi_9, xi_10];
for i=1:length(Xi_0(1,:))
    Yi_0(:,i)=[Xi_0(1,i);Xi_0(2,i)+2];
end

%% Plot Phase Portrait
f1 = figure ;
for i = 1:length(Xi_0(1,:))
    [ t , Xt1 ] = RK4( @(t,X) Nonlinear_System_Orig1(X) , [0 t_final], Xi_0(:,i) ,dt) ;
    xt1_1_c = Xt1(:,1) ; xt1_2_c = Xt1(:,2) ;
    all_x1(:,i)=xt1_1_c;
    all_x2(:,i)=xt1_2_c;
    plot(xt1_1_c,xt1_2_c,'Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;         
    plot(xt1_1_c(1,1),xt1_2_c(1,1),'o','Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;         
end
plot([-10 10],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot([0 0],[-10 15],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot(0,-2,'*','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
ax(1) = gca ;
title('$\mathbf{x}_e = (0,-2)$','Interpreter','Latex')
xlabel('$x_1$','Interpreter','Latex') % x label
ylabel('$x_2$','Interpreter','Latex') % y label
axis([ -6 6 -8 4 ])
xticks(-6:2:6)
yticks(-8:2:4)
axis square

f2 = figure ;
for i = 1:length(Yi_0(1,:))
    [ t , Yt1 ] = RK4( @(t,Y) Nonlinear_System_CT1(Y) , [0 t_final], Yi_0(:,i) ,dt) ;
    yt1_1_c = Yt1(:,1) ; yt1_2_c = Yt1(:,2) ;
    all_y1(:,i)=yt1_1_c;
    all_y2(:,i)=yt1_2_c;
    plot(yt1_1_c,yt1_2_c,'Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;         
    plot(yt1_1_c(1,1),yt1_2_c(1,1),'o','Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;         
end
plot([-10 10],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot([0 0],[-10 15],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot(0,0,'*','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
ax(2) = gca ;
title('$\bar{\mathbf{x}}_e = (0,0)$','Interpreter','Latex')
xlabel('$y_1$','Interpreter','Latex') % x label
ylabel('$y_2$','Interpreter','Latex') % y label
axis([ -6 6 -6 6 ])
xticks(-6:2:6)
yticks(-6:2:6)
axis square

%% Plot Time Response
f3 = figure ;
for i=1:size(all_x1,2)
    plot(t, (all_x1(:,i))', 'Color',Dfcolor(i,:),'LineWidth',LW);
    hold on
end
xlabel('Time (s)','Interpreter','Latex') 
ylabel('$x_1$','Interpreter','Latex') 
xlim([0 t_final])
ylim([-6 6])
ax(3)=gca;
grid on

f4 = figure ;
for i=1:size(all_x2,2)
    plot(t, (all_x2(:,i))', 'Color',Dfcolor(i,:),'LineWidth',LW);
    hold on
end
xlabel('Time (s)','Interpreter','Latex') 
ylabel('$x_2$','Interpreter','Latex') 
xlim([0 t_final])
ylim([-8 5])
ax(4)=gca;
grid on

f5 = figure ;
for i=1:size(all_y1,2)
    plot(t, (all_y1(:,i))', 'Color',Dfcolor(i,:),'LineWidth',LW);
    hold on
end
xlabel('Time (s)','Interpreter','Latex') 
ylabel('$y_1$','Interpreter','Latex') 
xlim([0 t_final])
ylim([-6 6])
ax(5)=gca;
grid on

f6 = figure ;
for i=1:size(all_y1,2)
    plot(t, (all_y2(:,i))', 'Color',Dfcolor(i,:),'LineWidth',LW);
    hold on
end
xlabel('Time (s)','Interpreter','Latex') 
ylabel('$y_2$','Interpreter','Latex') 
xlim([0 t_final])
ylim([-6 6])
ax(6)=gca;
grid on

%%
for i = 1:length(ax)
    set(ax(i),'XGrid','on','YGrid','on','FontSize',FS1,'FontName','Times New Roman')
end
%% Nonlinear System Function
function [dX,Phi,u]=Nonlinear_System_Orig1(X)
x1=X(1);
x2=X(2);
k=2;

y1=x1;
y2=x2+2;
Phi=-y1-y1^2;
u=(1/(1+(y2-2)^2))*((-1-2*y1)*(y1^2+y1*y2)-y1^2-k*(y2+y1+y1^2)-3*y1);

dx1=2*x1+x1^2+x1*x2;
dx2=3*x1+(1+x2^2)*u;
dX=[dx1;dx2];
end

function [dY,Phi,u]=Nonlinear_System_CT1(Y)
y1=Y(1);
y2=Y(2);
k=2;

Phi=-y1-y1^2;
u=(1/(1+(y2-2)^2))*((-1-2*y1)*(y1^2+y1*y2)-y1^2-k*(y2+y1+y1^2)-3*y1);

dy1=y1^2+y1*y2;
dy2=3*y1+(1+(y2-2)^2)*u;
dY=[dy1;dy2];
end