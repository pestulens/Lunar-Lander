%% Nolinear Control HW3_c
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

%% When K=1
e_IC_1=[30;20;10];
K_1=1;
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
ax(1).XLim=[0 10]; 
ax(1).YLim=[-30 8]; 
grid on 

%% K=10
e_IC_1=[30;20;10];
K_2=10;
f(2)=figure() ; 
color=['b- ' ; 'r-.' ; 'g--' ] ; 
for i=1:length(e_IC_1) 
 e_IC=e_IC_1(i) ; 
 K=K_2 ; 
 sim('ClosedLoop_System_Simulink') 
 plot(t,c,color(i,:),'LineWidth',LW_1);
 hold on 
end 
xlabel('Time (s)') 
ylabel('Output $c(t)$','Interpreter','latex') 
title(['Open Loop Linear System Gain K = ',num2str(K_2) ],'Interpreter','latex') 
hs(2) = legend(['$e(0)$ = ', num2str(e_IC_1(1))],['$e(0)$ = ', num2str(e_IC_1(2))],['$e(0)$ = ', num2str(e_IC_1(3))],'Interpreter','latex') ; 
ax(2)=gca;
ax(2).XLim=[0 10]; 
ax(2).YLim=[-30 8]; 
grid on

%% K=20
e_IC_1=[30;20;10];
K_3=20;
f(3)=figure() ; 
color=['b- ' ; 'r-.' ; 'g--' ] ; 
for i=1:length(e_IC_1) 
 e_IC=e_IC_1(i) ; 
 K=K_3 ; 
 sim('ClosedLoop_System_Simulink') 
 plot(t,c,color(i,:),'LineWidth',LW_1);
 hold on 
end 
xlabel('Time (s)') 
ylabel('Output $c(t)$','Interpreter','latex') 
title(['Open Loop Linear System Gain K = ',num2str(K_3) ],'Interpreter','latex') 
hs(3) = legend(['$e(0)$ = ', num2str(e_IC_1(1))],['$e(0)$ = ', num2str(e_IC_1(2))],['$e(0)$ = ', num2str(e_IC_1(3))],'Interpreter','latex') ; 
ax(3)=gca;
ax(3).XLim=[0 10]; 
ax(3).YLim=[-30 30]; 
grid on

%% K=30
e_IC_1=[30;20;10];
K_4=30;
f(4)=figure() ; 
color=['b- ' ; 'r-.' ; 'g--' ] ; 
for i=1:length(e_IC_1) 
 e_IC=e_IC_1(i) ; 
 K=K_4 ; 
 sim('ClosedLoop_System_Simulink') 
 plot(t,c,color(i,:),'LineWidth',LW_1);
 hold on 
end 
xlabel('Time (s)') 
ylabel('Output $c(t)$','Interpreter','latex') 
title(['Open Loop Linear System Gain K = ',num2str(K_4) ],'Interpreter','latex') 
hs(4) = legend(['$e(0)$ = ', num2str(e_IC_1(1))],['$e(0)$ = ', num2str(e_IC_1(2))],['$e(0)$ = ', num2str(e_IC_1(3))],'Interpreter','latex') ; 
ax(4)=gca;
ax(4).XLim=[0 10]; 
ax(4).YLim=[-30 30]; 
grid on

%% K=40
e_IC_1=[30;20;10];
K_5=40;
f(1)=figure() ; 
color=['b- ' ; 'r-.' ; 'g--' ] ; 
for i=1:length(e_IC_1) 
 e_IC=e_IC_1(i) ; 
 K=K_5 ; 
 sim('ClosedLoop_System_Simulink') 
 plot(t,c,color(i,:),'LineWidth',LW_1);
 hold on 
end 
xlabel('Time (s)') 
ylabel('Output $c(t)$','Interpreter','latex') 
title(['Open Loop Linear System Gain K = ',num2str(K_5) ],'Interpreter','latex') 
hs(5) = legend(['$e(0)$ = ', num2str(e_IC_1(1))],['$e(0)$ = ', num2str(e_IC_1(2))],['$e(0)$ = ', num2str(e_IC_1(3))],'Interpreter','latex') ; 
ax(5)=gca;
ax(5).XLim=[0 10]; 
ax(5).YLim=[-30 30]; 
grid on

%% K=50
e_IC_1=[30;20;10];
K_6=50;
f(1)=figure() ; 
color=['b- ' ; 'r-.' ; 'g--' ] ; 
for i=1:length(e_IC_1) 
 e_IC=e_IC_1(i) ; 
 K=K_6 ; 
 sim('ClosedLoop_System_Simulink') 
 plot(t,c,color(i,:),'LineWidth',LW_1);
 hold on 
end 
xlabel('Time (s)') 
ylabel('Output $c(t)$','Interpreter','latex') 
title(['Open Loop Linear System Gain K = ',num2str(K_6) ],'Interpreter','latex') 
hs(6) = legend(['$e(0)$ = ', num2str(e_IC_1(1))],['$e(0)$ = ', num2str(e_IC_1(2))],['$e(0)$ = ', num2str(e_IC_1(3))],'Interpreter','latex') ; 
ax(6)=gca;
ax(6).XLim=[0 10]; 
ax(6).YLim=[-30 30]; 
grid on

%% K=60
e_IC_1=[30;20;10];
K_7=60;
f(7)=figure() ; 
color=['b- ' ; 'r-.' ; 'g--' ] ; 
for i=1:length(e_IC_1) 
 e_IC=e_IC_1(i) ; 
 K=K_7 ; 
 sim('ClosedLoop_System_Simulink') 
 plot(t,c,color(i,:),'LineWidth',LW_1);
 hold on 
end 
xlabel('Time (s)') 
ylabel('Output $c(t)$','Interpreter','latex') 
title(['Open Loop Linear System Gain K = ',num2str(K_7) ],'Interpreter','latex') 
hs(7) = legend(['$e(0)$ = ', num2str(e_IC_1(1))],['$e(0)$ = ', num2str(e_IC_1(2))],['$e(0)$ = ', num2str(e_IC_1(3))],'Interpreter','latex') ; 
ax(7)=gca;
ax(7).XLim=[0 7]; 
ax(7).YLim=[-30 30]; 
grid on

%% K=70
e_IC_1=[30;20;10];
K_8=70;
f(8)=figure() ; 
color=['b- ' ; 'r-.' ; 'g--'] ; 
for i=1:length(e_IC_1) 
 e_IC=e_IC_1(i) ; 
 K=K_8 ; 
 sim('ClosedLoop_System_Simulink') 
 plot(t,c,color(i,:),'LineWidth',LW_1);
 hold on 
end 
xlabel('Time (s)') 
ylabel('Output $c(t)$','Interpreter','latex') 
title(['Open Loop Linear System Gain K = ',num2str(K_8) ],'Interpreter','latex') 
hs(8) = legend(['$e(0)$ = ', num2str(e_IC_1(1))],['$e(0)$ = ', num2str(e_IC_1(2))],['$e(0)$ = ', num2str(e_IC_1(3))],'Interpreter','latex') ; 
ax(8)=gca;
ax(8).XLim=[0 7]; 
ax(8).YLim=[-30 30]; 
grid on

%%
e_IC_1=20;
K_9=[20;50;60;80];
f(8)=figure() ; 
color=['b- ' ;'r-.';'g--';'c- '] ; %'c-'
for i=1:length(K_9) 
 e_IC=e_IC_1 ; 
 K=K_9(i) ; 
 sim('ClosedLoop_System_Simulink') 
 plot(t,c,color(i,:),'LineWidth',LW_1);
 hold on 
end 
xlabel('Time (s)') 
ylabel('Output $c(t)$','Interpreter','latex') 
title(['Open Loop Linear System Initial $e(0)$ = ',num2str(e_IC_1) ],'Interpreter','latex') 
hs(9) = legend(['$K$ = ', num2str(K_9(1))],['$K$ = ', num2str(K_9(2))],['$K$ = ', num2str(K_9(3))],['$K$ = ', num2str(K_9(4))],'Interpreter','latex') ; 
ax(9)=gca;
ax(9).XLim=[0 15]; 
ax(9).YLim=[-40 40]; 
grid on

%% 
e_IC_1=20;
K_10=[61;60;59];
f(9)=figure() ; 
color = ['r--' ; 'g-.' ; 'b- ' ] ; 
for i=1:length(K_10) 
 e_IC=e_IC_1 ; 
 K=K_10(i) ; 
 sim('ClosedLoop_System_Simulink') 
 plot(t,c,color(i,:),'LineWidth',LW_1);
 hold on 
end 
xlabel('Time (s)') 
ylabel('Output $c(t)$','Interpreter','latex') 
title(['Open Loop Linear System Initial $e(0)$ = ',num2str(e_IC_1) ],'Interpreter','latex') 
hs(10) = legend(['$K$ = ', num2str(K_10(1))],['$K$ = ', num2str(K_10(2))],['$K$ = ', num2str(K_10(3))],'Interpreter','latex') ; 
ax(10)=gca;
ax(10).XLim=[0 60]; 
ax(10).YLim=[-40 40]; 
grid on

%% 
e_IC_1=[30;70;100];
K_11=60;
f(10)=figure() ; 
color=['b- ' ; 'r-.' ; 'g--'] ; 
for i=1:length(e_IC_1) 
 e_IC=e_IC_1(i) ; 
 K=K_11 ; 
 sim('ClosedLoop_System_Simulink') 
 plot(t,c,color(i,:),'LineWidth',LW_1);
 hold on 
end 
xlabel('Time (s)') 
ylabel('Output $c(t)$','Interpreter','latex') 
title(['Open Loop Linear System Gain K = ',num2str(K_11) ],'Interpreter','latex') 
hs(10) = legend(['$e(0)$ = ', num2str(e_IC_1(1))],['$e(0)$ = ', num2str(e_IC_1(2))],['$e(0)$ = ', num2str(e_IC_1(3))],'Interpreter','latex') ; 
ax(10)=gca;
ax(10).XLim=[0 5]; 
ax(10).YLim=[-110 100]; 
grid on

%%
for i = 1:length(ax) 
 set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman') 
end 
for i = 1:length(hs) 
 set(hs(i),'FontSize',FS_leg,'FontName','Times New Roman') 
end