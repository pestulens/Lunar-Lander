%% Nolinear Control HW3_e
clc;
clear;
close all;

%% System Parameters
dt = 0.0005; 
t_final=100; 
t=0:dt:t_final; 
[A,B,C,D]=tf2ss(1,conv([1 0],conv([0.1 1],[0.02 1]))); 
LW_1=1.4;
LW_2=1;
FS_ax=16; 
FS_leg=17; 

%% 
e_IC_1=[25;40.6;80];
K_1=100;
f(1)=figure() ; 
color=['b- ' ; 'r-.' ; 'g--' ] ; 
for i=1:length(e_IC_1) 
 e_IC=e_IC_1(i) ; 
 K=K_1 ; 
 sim('ClosedLoop_System_Simulink') 
 plot(t,c,color(i,:),'LineWidth',LW_1);
 hold on 
end 
xlabel('Time (s)') 
ylabel('Output $c(t)$','Interpreter','latex') 
title(['Open Loop Linear System Gain K = ',num2str(K_1) ],'Interpreter','latex') 
hs(1) = legend(['$e(0)$ = ', num2str(e_IC_1(1))],['$e(0)$ = ', num2str(e_IC_1(2))],['$e(0)$ = ', num2str(e_IC_1(3))],'Interpreter','latex') ; 
ax(1)=gca;
ax(1).XLim=[0 3]; 
ax(1).YLim=[-100 100]; 
grid on 

%%
e_IC = 40.6 ; 
K = 100 ; 
pre_Xc = 40.6627*sin(10*(5)^(1/2)*t) ; 
f(2) = figure ; 
sim('ClosedLoop_System_Simulink') 
plot(t,c,'b','LineWidth',LW_1) ; 
hold on 
plot(t,pre_Xc,'r--','LineWidth',LW_1) 
xlabel('Time (s)') 
ylabel('Output $c(t)$','Interpreter','latex') 
title(['Open Loop Linear System Gain K = ',num2str(K) ],'Interpreter','latex') 
hs(2) = legend({'Simulation ','Prediction'},'Interpreter','latex') ; 
ax(2) = gca ; 
ax(2).XLim = [0 3] ;
ax(2).YLim = [-75 75] ; 
grid on

%%
for i = 1:length(ax) 
 set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman') 
end 
for i = 1:length(hs) 
 set(hs(i),'FontSize',FS_leg,'FontName','Times New Roman') 
end