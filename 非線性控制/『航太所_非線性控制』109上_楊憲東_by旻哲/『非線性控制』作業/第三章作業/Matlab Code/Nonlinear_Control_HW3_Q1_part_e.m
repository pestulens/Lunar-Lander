%% Nonlinear Control HW3 - Q1 - (e)
clc ; clear ; close all
dt = 0.001 ;
t_final = 100 ;
t = 0: dt : t_final ;
[A,B,C,D] = tf2ss(1,conv([1 0],conv([0.1 1],[0.02 1]))) ;
e_IC_2 = [100 ; 62  ; 40 ] ;
K_2 = 150 ;

f(1) = figure() ;
color = ['g--' ; 'r-.' ; 'b- ' ] ;
LW_1 = 1.45 ;
LW_2 = 1.4 ;
FS_ax = 16 ;
FS_leg = 17 ;
for i = 1:length(e_IC_2)
    e_IC = e_IC_2(i) ;
    K = K_2 ;
    sim('ClosedLoop_System_Simulink')
    plot(t,c,color(i,:),'LineWidth',LW_2) ; 
    hold on
end
xlabel('Time (s)')
ylabel('Output $c(t)$','Interpreter','latex')
title(['Open Loop Linear System Gain K = ',num2str(K_2) ],'Interpreter','latex')
hs(1) = legend(['$e(0)$ = ', num2str(e_IC_2(1))],['$e(0)$ = ', num2str(e_IC_2(2))],['$e(0)$ = ', num2str(e_IC_2(3))],'Interpreter','latex') ;
ax(1) = gca ;
ax(1).YLim = [-100 150];
grid on


%%
e_IC = 64.66 ;
K = 150 ;
pre_Xc = 62.5603*sin(10*(5)^(1/2)*t) ;
f(2) = figure ;
sim('ClosedLoop_System_Simulink')
plot(t,c,'b','LineWidth',LW_1) ; 
hold on
plot(t,pre_Xc,'r--','LineWidth',LW_1)

xlabel('Time (s)')
ylabel('Output $c(t)$','Interpreter','latex')
title(['Open Loop Linear System Gain K = ',num2str(K) ],'Interpreter','latex')
hs(2) = legend({'Simulation ($\omega_0$ = 21.8546)','Prediction ($\omega_0$ = 22.3607)'},'Interpreter','latex') ;
ax(2) = gca ;
ax(2).YLim = [-80 120] ;
grid on

%% FFT
t = 0: dt : t_final-dt ;
fs = 1/dt ;
c = c(1:end-1);
l = length(t);
F = fs*(0:(l/2))/l;
y=fft(c);
P2=abs(y/l);
P1=P2(1:l/2+1);
P1(2:end)=2*P1(2:end);
f(3) = figure;
stem((F*2*pi),P1,'b','LineWidth',LW_1);
xlabel('Frequency $\omega$(rad/s)','Interpreter','latex')
ylabel('Amplitude $X$','Interpreter','latex')
text(21.9,58,{'$\omega$ = 21.87';'$X$ = 64.85'},'Interpreter','latex','FontSize',16,'Color','k')
ax(3) = gca ;
ax(3).XLim = [21.6 22.15] ;
grid on
%%
for i = 1:length(ax)
    set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman')
end

for i = 1:length(hs)
    set(hs(i),'FontSize',FS_leg,'FontName','Times New Roman')
end