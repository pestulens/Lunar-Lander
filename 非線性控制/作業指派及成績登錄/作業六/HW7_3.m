%% Nonlinear Control HW7-3
clc;
clear;
close all;

%%
dt=0.001;
t_final=50;
t=0:dt:t_final;
LW=1.2;
FS1=16;
FS_lg=18;
Dfcolor=winter(17);
nPoint=16;

%% Set Initial Condition
for i=0:nPoint
    r=3;
    theta=2*pi/nPoint*i;
    x=r*cos(theta);
    y=r*sin(theta);
    initialPoint_1(1,i+1)=x;
    initialPoint_1(2,i+1)=y;
end
for i=0:nPoint
    r=20;
    theta=2*pi/nPoint*i;
    x=r*cos(theta);
    y=r*sin(theta);
    initialPoint_2(1,i+1)=x;
    initialPoint_2(2,i+1)=y;
end
for i=0:nPoint
    r=150;
    theta=2*pi/nPoint*i;
    x=r*cos(theta);
    y=r*sin(theta);
    initialPoint_3(1,i+1)=x;
    initialPoint_3(2,i+1)=y;
end
for i=0:nPoint
    r=1000;
    theta=2*pi/nPoint*i;
    x=r*cos(theta);
    y=r*sin(theta);
    initialPoint_4(1,i+1)=x;
    initialPoint_4(2,i+1)=y;
end

for i=0:nPoint
    r=0.2;
    theta=2*pi/nPoint*i;
    x=r*cos(theta);
    y=r*sin(theta);
    initialPoint_5(1,i+1)=x;
    initialPoint_5(2,i+1)=y;
end

%% Plot Phase Portrait
f1 = figure ;
for i = 1:size(initialPoint_1,2)
    [ t , Yt1 ] = RK4( @(t,Y) Nonlinear_System_CT1(Y) , [0 t_final], initialPoint_1(:,i) ,dt) ;
    yt1_1_c = Yt1(:,1) ; yt1_2_c = Yt1(:,2) ;

    plot(yt1_1_c,yt1_2_c,'Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;         
    plot(yt1_1_c(1,1),yt1_2_c(1,1),'o','Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;         
end
plot([-10 10],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot([0 0],[-10 15],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot(0,0,'*','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
ax(1) = gca ;
xlabel('$y_1$','Interpreter','Latex') 
ylabel('$y_2$','Interpreter','Latex') 
axis([ -6 6 -6 6 ])
xticks(-6:2:6)
yticks(-6:2:6)
axis square

f2 = figure ;
for i = 1:size(initialPoint_2,2)
    [ t , Yt1 ] = ode45( @(t,Y) Nonlinear_System_CT1(Y) , t , initialPoint_2(:,i)) ;
    yt1_1_c = Yt1(:,1) ; yt1_2_c = Yt1(:,2) ;

    plot(yt1_1_c,yt1_2_c,'Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;         
    plot(yt1_1_c(1,1),yt1_2_c(1,1),'o','Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;         
end
plot([-40 40],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot([0 0],[-40 40],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot(0,0,'*','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
ax(2) = gca ;
xlabel('$y_1$','Interpreter','Latex') 
ylabel('$y_2$','Interpreter','Latex') 
axis([ -30 30 -30 30 ])
xticks(-30:10:30)
yticks(-30:10:30)
axis square

f3 = figure ;
for i = 1:size(initialPoint_3,2)
    [ t , Yt1 ] = ode45( @(t,Y) Nonlinear_System_CT1(Y) , t , initialPoint_3(:,i)) ;
    yt1_1_c = Yt1(:,1) ; yt1_2_c = Yt1(:,2) ;

    plot(yt1_1_c,yt1_2_c,'Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;         
    plot(yt1_1_c(1,1),yt1_2_c(1,1),'o','Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;         
end
plot([-200 200],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot([0 0],[-200 200],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot(0,0,'*','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
ax(3) = gca ;
xlabel('$y_1$','Interpreter','Latex') 
ylabel('$y_2$','Interpreter','Latex') 
axis([ -200 200 -200 200 ])
xticks(-200:50:200)
yticks(-200:50:200)
axis square

f4 = figure ;
for i = 1:size(initialPoint_4,2)
    [ t , Yt1 ] = ode45( @(t,Y) Nonlinear_System_CT1(Y) , t , initialPoint_4(:,i)) ;
    yt1_1_c = Yt1(:,1) ; yt1_2_c = Yt1(:,2) ;

    plot(yt1_1_c,yt1_2_c,'Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;         
    plot(yt1_1_c(1,1),yt1_2_c(1,1),'o','Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;         
end
plot([-1200 1200],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot([0 0],[-1200 1200],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot(0,0,'*','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
ax(4) = gca ;
xlabel('$y_1$','Interpreter','Latex') 
ylabel('$y_2$','Interpreter','Latex') 
axis([ -1200 1200 -1200 1200 ])
xticks(-1200:400:1200)
yticks(-1200:400:1200)
axis square

f5 = figure ;
for i = 1:size(initialPoint_5,2)
    [ t , Yt1 ] = ode45( @(t,Y) Nonlinear_System_CT1(Y) , t , initialPoint_5(:,i)) ;
    yt1_1_c = Yt1(:,1) ; yt1_2_c = Yt1(:,2) ;

    plot(yt1_1_c,yt1_2_c,'Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;         
    plot(yt1_1_c(1,1),yt1_2_c(1,1),'o','Color',Dfcolor(i,:),'LineWidth',LW) ; hold on ;         
end
plot([-0.5 0.5],[0 0],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot([0 0],[-0.5 0.5],'--','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
plot(0,0,'*','Color',[0.5 0.5 0.5],'LineWidth',LW) ;
ax(5) = gca ;
xlabel('$y_1$','Interpreter','Latex') 
ylabel('$y_2$','Interpreter','Latex') 
axis([ -0.3 0.3 -0.3 0.3 ])
xticks(-0.5:0.2:0.5)
yticks(-0.5:0.2:0.5)
axis square


%%
for i = 1:length(ax)
    set(ax(i),'XGrid','on','YGrid','on','FontSize',FS1,'FontName','Times New Roman')
end
%% Nonlinear System Function
function [dY,Phi,u]=Nonlinear_System_CT1(Y)
y1=Y(1);
y2=Y(2);
k=1;

Phi=-y1-y1^2;
u=(1/(1+(y2-2)^2))*((-1-2*y1)*(y1^2+y1*y2)-y1^2-k*(y2+y1+y1^2)-3*y1);

dy1=y1^2+y1*y2;
dy2=3*y1+(1+(y2-2)^2)*u;
dY=[dy1;dy2];
end