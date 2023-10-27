clc;
clear;
close all;

%%
ap=1; bp=2; cp=-1;
gamma1=10; gamma2=10; gamma3=10;
dt=0.001;
t_final=120;
t=0:dt:10;
LW=1.8;
FS=14;
FS_lg=18;
%%
y0=0; ym0=0; Ky_ini=0; Kf_ini=0; Kr_ini=0;
Y0=[y0; ym0; Ky_ini;  Kf_ini; Kr_ini];

%%
[t1, Yt1]=RK4( @(t,Y0) nonlinear_system_1(t,Y0,ap,bp,cp,gamma1,gamma2,gamma3) , [0 t_final], Y0,dt) ;
[t2, Yt2]=RK4( @(t,Y0) nonlinear_system_2(t,Y0,ap,bp,cp,gamma1,gamma2,gamma3) , [0 t_final], Y0,dt) ;
Yt1=Yt1';
Yt2=Yt2';

for i =1:length(t1)
    [dY1(:,i) , uc1(i) , r1(i) ] = nonlinear_system_1(t1(i), Yt1(:,i),ap,bp,cp,gamma1,gamma2,gamma3) ;
end

for i =1:length(t2)
    [dY2(:,i) , uc2(i) , r2(i) ] = nonlinear_system_2(t2(i), Yt2(:,i),ap,bp,cp,gamma1,gamma2,gamma3) ;
end

%% Figure 1 System Output vs Reference Model Output  (r=1)
f1=figure;
plot(t1,Yt1(1,:),'r','LineWidth',LW);
hold on
plot(t1,Yt1(2,:),'b','LineWidth',LW); 
hs(1)=legend({'$y(t)$','$y_m(t)$'},'Interpreter','latex');
ax(1) = gca ;
xlabel('Time (sec)') 
ylabel('Output Time Response','Interpreter','Latex')
xlim([0 t_final])
ylim([0 1])
axis normal
grid on

%% Figure 2 Tracking Error Output (r=1)
f2 = figure;
plot(t1,Yt1(1,:)-Yt1(2,:),'r','LineWidth',LW);
hold on
ax(2) = gca;
xlabel('Time (sec)') 
ylabel('Output Tracking Error $e(t)$','Interpreter','Latex') 
xlim([0 t_final])
ylim([-0.1 0.1])
axis normal
grid on

%% Figure 3 System Output vs Reference Model Output  (r=2sint+cost)
f3=figure;
plot(t2,Yt2(1,:),'r','LineWidth',LW);
hold on
plot(t2,Yt2(2,:),'b','LineWidth',LW); 
hs(2)=legend({'$y(t)$','$y_m(t)$'},'Interpreter','latex');
ax(3) = gca ;
xlabel('Time (sec)') 
ylabel('Output Time Response','Interpreter','Latex')
xlim([0 t_final])
ylim([-2 2])
axis normal
grid on

%% Figure 4 Tracking Error Output (r=2sint+cost)
f4 = figure;
plot(t2,Yt2(1,:)-Yt2(2,:),'r','LineWidth',LW);
hold on
ax(4) = gca;
xlabel('Time (sec)') 
ylabel('Output Tracking Error $e(t)$','Interpreter','Latex') 
xlim([0 t_final])
ylim([-0.3 0.3])
axis normal
grid on

%% Figure 5 Tracking Error Comparison 
f5=figure;
plot(t1,Yt1(1,:)-Yt1(2,:),'r','LineWidth',LW);
hold on
plot(t2,Yt2(1,:)-Yt2(2,:),'b-.','LineWidth',LW);
ax(5)=gca;
hs(3)=legend({'$r(t)=1$','$r(t)=2sin(t)+cos(t)$'},'Interpreter','latex');
xlabel('Time (sec)') 
ylabel('Output Tracking Error $e(t)$','Interpreter','Latex') 
xlim([0 t_final])
ylim([-0.3 0.3])
axis normal
grid on

%% Figure 6 Control Input (r=1)
f6=figure;
plot(t1, uc1, 'r', 'LineWidth',LW)
ax(6)=gca;
xlabel('Time (sec)') 
ylabel('Control Input $u(t)$','Interpreter','Latex') 
xlim([0 t_final])
ylim([-0.3 0.5])
axis normal
grid on

%% Figure 7 Control Input (r=2sint+cost)
f7=figure;
plot(t1, uc2, 'r', 'LineWidth',LW)
ax(7)=gca;
xlabel('Time (sec)') 
ylabel('Control Input $u(t)$','Interpreter','Latex') 
xlim([0 t_final])
ylim([-2 1.5])
axis normal
grid on

%% Figure 8 Ky (r=1)
f8 = figure;
plot(t1,Yt1(3,:),'r','LineWidth',LW);
hold on
plot(t1,(ap-3)/bp*ones(length(t1),1),'b--','LineWidth',LW)
hs(4)=legend({'$\hat{K}_y(t)$','$K_y^*(t)$'},'Interpreter','latex');
ax(8) = gca ;
title('r(t)=1','Interpreter','Latex')
xlabel('Time (sec)') 
ylabel('Estimated Parameter $K_y$','Interpreter','Latex') 
axis([0 t_final -2 1])
axis normal
grid on

%% Figure 9 Kf (r=1)
f9=figure;
plot(t1,Yt1(4,:),'r','LineWidth',LW)
hold on
plot(t1,cp/bp*ones(length(t1),1),'b--','LineWidth',LW)
hs(5)=legend({'$\hat{K}_f(t)$','$K_f^*(t)$'},'Interpreter','latex');
ax(9) = gca ;
title('r(t)=1','Interpreter','Latex')
xlabel('Time (sec)') 
ylabel('Estimated Parameter $K_f$','Interpreter','Latex') 
axis([0 t_final -1 0.5])
axis normal
grid on

%% Figure 10 Kr (r=1)
f10 = figure ;
plot(t1,Yt1(5,:),'r','LineWidth',LW);
hold on;
plot(t1,2/bp*ones(length(t1),1),'b--','LineWidth',LW)
hs(6)=legend({'$\hat{K}_r(t)$','$K_r^*(t)$'},'Interpreter','latex');
ax(10) = gca ;
title('r(t)=1','Interpreter','Latex')
xlabel('Time (sec)') 
ylabel('Estimated Parameter $K_r$','Interpreter','Latex') 
axis([0 t_final -0.5 2])
axis normal
grid on

%% Figure 11 Ky (r=2sint+cost)
f11 = figure;
plot(t2,Yt2(3,:),'r','LineWidth',LW);
hold on
plot(t2,(ap-3)/bp*ones(length(t2),1),'b--','LineWidth',LW)
hs(7)=legend({'$\hat{K}_y(t)$','$K_y^*(t)$'},'Interpreter','latex');
ax(11) = gca ;
title('r(t)=2sin(t)+cos(t)','Interpreter','Latex')
xlabel('Time (sec)') 
ylabel('Estimated Parameter $K_y$','Interpreter','Latex') 
axis([0 t_final -2 0.5])
axis normal
grid on
%% Figure 12 Kf (r=2sint+cost)
f12 = figure;
plot(t2,Yt2(4,:),'r','LineWidth',LW);
hold on
plot(t2,cp/bp*ones(length(t2),1),'b--','LineWidth',LW)
hs(8)=legend({'$\hat{K}_f(t)$','$K_f^*(t)$'},'Interpreter','latex');
ax(12) = gca ;
title('r(t)=2sin(t)+cos(t)','Interpreter','Latex')
xlabel('Time (sec)') 
ylabel('Estimated Parameter $K_f$','Interpreter','Latex') 
axis([0 t_final -1.5 0.5])
axis normal
grid on
%% Figure 13 Kr (r=2sint+cost)
f13 = figure;
plot(t2,Yt2(5,:),'r','LineWidth',LW);
hold on
plot(t2,2/bp*ones(length(t2),1),'b--','LineWidth',LW)
hs(9)=legend({'$\hat{K}_r(t)$','$K_r^*(t)$'},'Interpreter','latex');
ax(13) = gca ;
title('r(t)=2sin(t)+cos(t)','Interpreter','Latex')
xlabel('Time (sec)') 
ylabel('Estimated Parameter $K_r$','Interpreter','Latex') 
axis([0 t_final -1.5 5])
axis normal
grid on
%% Figure 14 Compare Ky 
f14=figure;
plot(t1,(ap-3)/bp*ones(length(t1),1),'--','Color',[0.5 0.5 0.5],'LineWidth',LW); hold on ;
plot(t2,Yt2(3,:),'r','LineWidth',LW) ; 
plot(t1,Yt1(3,:),'b--','LineWidth',LW) ; 
hs(10)=legend({'$K^*_y$','$r(t) = 2sin(t)+cos(t)$','$r(t) = 1$'},'Interpreter','latex');
ax(14) = gca ;
xlabel('Time (sec)') % x label
ylabel('Estimated Parameter $\hat{K}_y$','Interpreter','Latex') % y label
axis([0 t_final -2 0.5])
axis normal
grid on
%% Figure 15 Compare Kf 
f15 = figure ;
plot(t1,cp/bp*ones(length(t1),1),'--','Color',[0.5 0.5 0.5],'LineWidth',LW); hold on ;
plot(t2,Yt2(4,:),'r','LineWidth',LW) ; 
plot(t1,Yt1(4,:),'b--','LineWidth',LW) ; 
hs(11)=legend({'$K^*_f$','$r(t) = 2sin(t)+cos(t)$','$r(t) = 1$'},'Interpreter','latex');
ax(15) = gca ;
xlabel('Time (sec)') % x label
ylabel('Estimated Parameter $\hat{K}_f$','Interpreter','Latex') % y label
axis([0 t_final -1.5 0.5])
axis normal
grid on

%% Figure 16 Compare Kr 
f16 = figure ;
plot(t1,2/bp*ones(length(t1),1),'--','Color',[0.5 0.5 0.5],'LineWidth',LW); hold on ;
plot(t2,Yt2(5,:),'r','LineWidth',LW) ;
plot(t1,Yt1(5,:),'b--','LineWidth',LW) ; 
hs(12)=legend({'$K^*_r$','$r(t) = 2sin(t)+cos(t)$','$r(t) = 1$'},'Interpreter','latex');
ax(16) = gca ;
xlabel('Time (sec)') % x label
ylabel('Estimated Parameter $\hat{K}_r$','Interpreter','Latex') % y label
axis([0 t_final -1.5 5])
axis normal
grid on

%%
for i = 1:length(ax)
    set(ax(i),'FontSize',FS,'FontName','Times New Roman')
end

for i = 1:length(hs)
    set(hs(i),'FontSize',FS_lg,'FontName','Times New Roman')
end
%% Nonlinear Equation
function [dY, u, r]=nonlinear_system_1(t,Y0,ap,bp,cp,gamma1,gamma2,gamma3)
y=Y0(1);
ym=Y0(2);
Ky_est=Y0(3);
Kf_est=Y0(4);
Kr_est=Y0(5);

% Input
r=1; % Reference Command
e=y-ym;
u=Ky_est*y+Kf_est*cos(y)+Kr_est*r;
dKy=-sign(bp)*e*y*gamma1;
dKf=-sign(bp)*e*cos(y)*gamma2;
dKr=-sign(bp)*e*r*gamma3;

% Nonlinear System
dy=bp*u-ap*y-cp*cos(y);

% Reference Model
dym=2*r-3*ym;

dY=[dy;dym;dKy;dKf;dKr];
end

function [dY, u, r]=nonlinear_system_2(t,Y0,ap,bp,cp,gamma1,gamma2,gamma3)
y=Y0(1);
ym=Y0(2);
Ky_est=Y0(3);
Kf_est=Y0(4);
Kr_est=Y0(5);

% Input
%r=2*sin(t)+cos(t); % Reference Command
r=sin(t);
e=y-ym;
u=Ky_est*y+Kf_est*cos(y)+Kr_est*r;
dKy=-sign(bp)*e*y*gamma1;
dKf=-sign(bp)*e*cos(y)*gamma2;
dKr=-sign(bp)*e*r*gamma3;

% Nonlinear System
dy=bp*u-ap*y-cp*cos(y);

% Reference Model
dym=2*r-3*ym;

dY=[dy;dym;dKy;dKf;dKr];
end
