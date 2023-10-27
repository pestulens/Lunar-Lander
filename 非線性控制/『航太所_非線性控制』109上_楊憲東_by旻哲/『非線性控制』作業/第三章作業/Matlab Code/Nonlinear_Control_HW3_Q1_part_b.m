%% Nonlinear Control HW3 - Q1 - (b)
clc ; clear ; close all
dt = 0.01 ;
t_final = 10 ;
t = 0: dt : t_final ;
e_IC = 20 ;
K = 1 ;
sim('ClosedLoop_System_Simulink')

LW_1 = 1.4 ;
FS_ax = 16 ;
FS_leg = 12 ;

f(1) = figure() ;
plot(t,c,'b','LineWidth',LW_1) ; 
xlabel('Time (s)')
ylabel('Output $c(t)$','Interpreter','latex')
title(['Initial Condition: $e$(0)=',num2str(e_IC) ],'Interpreter','latex')
ax(1) = gca ;
% ax(1).YLim = [-6 6];
grid on

for i = 1:length(ax)
    set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman')
end