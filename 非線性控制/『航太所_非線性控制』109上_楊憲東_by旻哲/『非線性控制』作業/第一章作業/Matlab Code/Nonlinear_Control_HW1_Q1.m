%%  Nonlinear Control HW1 - Q1
clc ; clear ; close all

A1 = [ 0 1 ; 0 -0.1 ] ;
A2 = [ 0 1 ; -1 -0.1 ] ;
B = [ 0 ; 1 ] ;
D = [ 0 ; -1 ] ;
dt = 0.001 ; 
t_final = 30 ;
t = 0 : dt : t_final ;
 
%  =======  case 1 ============ 
x1_0_case1  = 3 ;
x2_0_case1 = 4 ;
X_0_case1 = [ x1_0_case1 ; x2_0_case1] ; 
%  =======  case 2 ============ 
x1_0_case2  = 3.01 ;
x2_0_case2 = 4.01 ;
X_0_case2 = [ x1_0_case2 ; x2_0_case2] ; 

func_nonlinear = @(t,X) Nonlinear_System_Function(t,X,A1,B,D) ;
[ t_1_n , X_1_n ] = ode45( func_nonlinear , t , X_0_case1) ;
[ t_2_n , X_2_n ] = ode45( func_nonlinear , t , X_0_case2) ;

func_linear = @(t,X) linear_System_Function(t,X,A2,B) ;
[ t_1_l , X_1_l ] = ode45( func_linear , t , X_0_case1) ;
[ t_2_l , X_2_l ] = ode45( func_linear , t , X_0_case2) ;

%% Plot
LW_1 = 1.4 ;
FS_ax = 16 ;
FS_leg = 12 ;

f(1) = figure() ;
plot(t,X_1_n(:,1),'b','LineWidth',LW_1) ; 
xlabel('Time (s)')
ylabel('$x$(t)','Interpreter','latex')
title('Initial Condition: $x$(0)=3, $\dot x$(0)=4','Interpreter','latex')
ax(1) = gca ;
ax(1).YLim = [-4 4];
grid on

f(2) = figure() ;
plot(t,X_2_n(:,1),'b','LineWidth',LW_1) ; 
xlabel('Time (s)')
ylabel('$x$(t)','Interpreter','latex')
title('Initial Condition: $x$(0)=3.01, $\dot x$(0)=4.01','Interpreter','latex')
ax(2) = gca ;
ax(2).YLim = [-4 4];
grid on

f(3) = figure() ;
plot(t,X_1_n(:,1),'b','LineWidth',LW_1) ; hold on ; plot(t,X_2_n(:,1),'r--','LineWidth',LW_1)
xlabel('Time (s)')
ylabel('$x$(t)','Interpreter','latex')
ax(3) = gca ;
hs(1)=legend({'Initial Condition: $x$(0)=3, $\dot x$(0)=4','Initial Condition: $x$(0)=3.01, $\dot x$(0)=4.01'},'Interpreter','latex','Location','Northeast');
ax(3).YLim = [-4 4];
grid on

f(4) = figure() ;
plot(t,X_1_l(:,1),'b','LineWidth',LW_1) ; hold on ; plot(t,X_2_l(:,1),'r--','LineWidth',LW_1)
xlabel('Time (s)')
ylabel('$x$(t)','Interpreter','latex')
ax(4) = gca ;
hs(2)=legend({'Initial Condition: $x$(0)=3, $\dot x$(0)=4','Initial Condition: $x$(0)=3.01, $\dot x$(0)=4.01'},'Interpreter','latex','Location','Northwest');
ax(4).YLim = [-50 50];
grid on

for i = 1:length(ax)
    set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman')
    RemovePlotWhiteArea(ax(i)) ;
end

for i = 1:length(hs)
    set(hs(i),'FontSize',FS_leg)
end

function  dX = Nonlinear_System_Function(t,X,A1,B,D)
x1 = X(1) ;
dX = A1*X + B*5*cos(t) + D*(x1^3) ;
end

function  dX = linear_System_Function(t,X,A2,B)
dX = A2*X + B*5*cos(t)  ;
end