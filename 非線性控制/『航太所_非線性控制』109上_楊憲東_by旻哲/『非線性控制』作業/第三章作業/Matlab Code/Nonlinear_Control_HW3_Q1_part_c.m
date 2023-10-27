%% Nonlinear Control HW3 - Q1 - (c)
clc ; clear ; close all
dt = 0.0005 ;
t_final = 100 ;
t = 0: dt : t_final ;
K = 61 ;
[A,B,C,D] = tf2ss(1,conv([1 0],conv([0.1 1],[0.02 1]))) ;
e_IC = 20 ;
sim('ClosedLoop_System_Simulink')

LW_1 = 1.4 ;
LW_2 = 1 ;
FS_ax = 16 ;
FS_leg = 17 ;

f(1) = figure() ;
plot(t,c,'b','LineWidth',LW_1) ; 
xlabel('Time (s)')
ylabel('Output $c(t)$','Interpreter','latex')
title(['Initial Condition: $e$(0)=',num2str(e_IC) ],'Interpreter','latex')
ax(1) = gca ;
% ax(1).YLim = [-6 6];
grid on

%%
e_IC_2 = [40 ; 20  ;10 ] ;
K_2 = 1 ;
f(2) = figure() ;
color = ['b- ' ; 'r-.' ; 'g--' ] ;

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
% hs(1) = legend(['$e(0)$ = ', num2str(e_IC_2(1))],['$e(0)$ = ', num2str(e_IC_2(2))],['$e(0)$ = ', num2str(e_IC_2(3))],'Interpreter','latex') ;
ax(2) = gca ;
ax(2).YLim = [-40 8];
grid on


%%
e_IC_3 = 20 ;
K_3 = [61 ; 60 ; 59] ;
f(3) = figure() ;
color = ['r--' ; 'g-.' ; 'b- ' ] ;

for i = 1:length(K_3)
    e_IC = e_IC_3 ;
    K = K_3(i) ;
    sim('ClosedLoop_System_Simulink')
    plot(t,c,color(i,:),'LineWidth',LW_2) ; 
    hold on
end
xlabel('Time (s)')
ylabel('Output $c(t)$','Interpreter','latex')
title(['Open Loop Linear System Initial $e(0)$ = ',num2str(e_IC_3) ],'Interpreter','latex')
hs(2) = legend(['$K$ = ', num2str(K_3(1))],['$K$ = ', num2str(K_3(2))],['$K$ = ', num2str(K_3(3))],'Interpreter','latex') ;
ax(3) = gca ;
ax(3).YLim = [-30 50];
grid on


for i = 1:length(ax)
    set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman')
end

for i = 1:length(hs)
    set(hs(i),'FontSize',FS_leg,'FontName','Times New Roman')
end


