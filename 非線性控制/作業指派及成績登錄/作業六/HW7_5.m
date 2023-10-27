%% Nonlinear Control HW7-5
clc;
clear;
close all;

%%
dt=0.001;
t_final=10;
t=0:dt:t_final;
LW=1.8;
FS1=16;
FS_lg=16;

%% Set Initial Condition
xi_1=[5;-5]; 
xi_2=[-5;5];
Xi_0=[xi_1, xi_2];
for i=1:length(Xi_0(1,:))
    Yi_0(:,i)=[Xi_0(1,i);Xi_0(2,i)+2];
end
K=[1,10,100,1000];

%% For different Lyapunov Function
for i = 1:length(Yi_0(1,:))
    [ t , Yt1 ] = RK4( @(t,Y) Nonlinear_System_CT1(Y,K(1)) , [0 t_final], Yi_0(:,i) ,dt) ;
    yt1_1_c = Yt1(:,1) ; yt1_2_c = Yt1(:,2) ;
    all_y1_1(:,i)=yt1_1_c;
    all_y2_1(:,i)=yt1_2_c;    
end

for i = 1:length(Yi_0(1,:))
    [ t , Yt2 ] = RK4( @(t,Y) Nonlinear_System_CT2(Y,K(1)) , [0 t_final], Yi_0(:,i) ,dt) ;
    yt2_1_c = Yt2(:,1) ; yt2_2_c = Yt2(:,2) ;
    all_y1_2(:,i)=yt2_1_c;
    all_y2_2(:,i)=yt2_2_c;    
end

for i = 1:length(Yi_0(1,:))
    [ t , Yt3 ] = RK4( @(t,Y) Nonlinear_System_CT3(Y,K(1)) , [0 t_final], Yi_0(:,i) ,dt) ;
    yt3_1_c = Yt3(:,1) ; yt3_2_c = Yt3(:,2) ;
    all_y1_3(:,i)=yt3_1_c;
    all_y2_3(:,i)=yt3_2_c;    
end
%% Plot Time Response
f1=figure;
for i=1:size(all_y1_1,2)
    p(1)=plot(t, (all_y1_1(:,i))', 'r', 'LineWidth', LW);
    hold on
end
for i=1:size(all_y1_2,2)
    p(2)=plot(t, (all_y1_2(:,i))', 'g', 'LineWidth', LW);
    hold on
end
for i=1:size(all_y1_3,2)
    p(3)=plot(t, (all_y1_3(:,i))', 'b', 'LineWidth', LW);
    hold on
end
xlabel('Time (s)','Interpreter','Latex') 
ylabel('$y_1$','Interpreter','Latex') 
xlim([0 t_final])
ylim([-6 6])
hs(1)=legend([p(1),p(2),p(3)],{'$V_1(y_1)=\frac{1}{2}y_1^2$', '$V_1^{\prime}(y_1)=\frac{1}{4}y_1^4$','$V_1^{\prime\prime}(y_1)=\frac{1}{6}y_1^6$'} ,'Interpreter','latex');
ax(1)=gca;
grid on

f2=figure;
for i=1:size(all_y2_1,2)
    p(1)=plot(t, (all_y2_1(:,i))', 'r', 'LineWidth', LW);
    hold on
end
for i=1:size(all_y2_2,2)
    p(2)=plot(t, (all_y2_2(:,i))', 'g', 'LineWidth', LW);
    hold on
end
for i=1:size(all_y2_3,2)
    p(3)=plot(t, (all_y2_3(:,i))', 'b', 'LineWidth', LW);
    hold on
end
xlabel('Time (s)','Interpreter','Latex') 
ylabel('$y_2$','Interpreter','Latex') 
xlim([0 5])
ylim([-70 10])
hs(2)=legend([p(1),p(2),p(3)],{'$V_1(y_1)=\frac{1}{2}y_1^2$', '$V_1^\prime(y_1)=\frac{1}{4}y_1^4$','$V_1^{\prime\prime}(y_1)=\frac{1}{6}y_1^6$'} ,'Interpreter','latex', 'location','Southeast');
ax(2)=gca;
grid on

%% For different k value
f3=figure;
for i = 1:length(K)
%     [ t , Yt4 ] = RK4( @(t,Y) Nonlinear_System_CT2(Y,K(i)) , [0 t_final], Yi_0(:,1) ,dt) ;
    [ t , Yt4 ] = ode45( @(t,Y) Nonlinear_System_CT2(Y,K(i)) , t , Yi_0(:,1)) ;
    yt4_1_c = Yt4(:,1) ; yt4_2_c = Yt4(:,2) ;
    all_y1_4(:,i)=yt4_1_c;
    all_y2_4(:,i)=yt4_2_c;    
end
Dfcolor=[1 0 0;0 1 0;0 0 1;0 0 0];
for i=1:length(K)
    p(i+3)=plot(t, (all_y1_4(:,i))' ,'Color',Dfcolor(i,:), 'LineWidth', LW);
    hold on
end
xlabel('Time (s)','Interpreter','Latex') 
ylabel('$y_1$','Interpreter','Latex') 
xlim([0 t_final])
hs(3)=legend([p(4),p(5),p(6),p(7)],{'k=1', 'k=10','k=100','k=1000'} ,'Interpreter','latex');
ax(3)=gca;
grid on

f4=figure;
for i=1:length(K)
    p(i+7)=plot(t, (all_y2_4(:,i))' ,'Color',Dfcolor(i,:), 'LineWidth', LW);
    hold on
end
xlabel('Time (s)','Interpreter','Latex') 
ylabel('$y_2$','Interpreter','Latex') 
xlim([0 t_final])
ylim([-30 1])
hs(4)=legend([p(8),p(9),p(10),p(11)],{'k=1', 'k=10','k=100','k=1000'} ,'Interpreter','latex', 'location','Southeast');
ax(4)=gca;
grid on
%%
for i = 1:length(ax)
    set(ax(i),'XGrid','on','YGrid','on','FontSize',FS1,'FontName','Times New Roman')
end
for i = 1:length(hs)
    set(hs(i),'FontSize',FS_lg,'FontName','Times New Roman')
end
%% Nonlinear System Function
function [dY,Phi,u]=Nonlinear_System_CT1(Y,K)
y1=Y(1);
y2=Y(2);
k=K;

Phi=-y1-y1^2;
u=(1/(1+(y2-2)^2))*((-1-2*y1)*(y1^2+y1*y2)-y1^2-k*(y2+y1+y1^2)-3*y1);

dy1=y1^2+y1*y2;
dy2=3*y1+(1+(y2-2)^2)*u;
dY=[dy1;dy2];
end

function [dY,Phi,u]=Nonlinear_System_CT2(Y,K)
y1=Y(1);
y2=Y(2);
k=K;

Phi=-y1-y1^2;
u=(1/(1+(y2-2)^2))*((-1-2*y1)*(y1^2+y1*y2)-y1^4-k*(y2+y1+y1^2)-3*y1);

dy1=y1^2+y1*y2;
dy2=3*y1+(1+(y2-2)^2)*u;
dY=[dy1;dy2];
end

function [dY,Phi,u]=Nonlinear_System_CT3(Y,K)
y1=Y(1);
y2=Y(2);
k=K;

Phi=-y1-y1^2;
u=(1/(1+(y2-2)^2))*((-1-2*y1)*(y1^2+y1*y2)-y1^6-k*(y2+y1+y1^2)-3*y1);

dy1=y1^2+y1*y2;
dy2=3*y1+(1+(y2-2)^2)*u;
dY=[dy1;dy2];
end