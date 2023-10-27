%%  Nonlinear Control HW1 - Q1
clc ; clear ; close all
lambda_1 = -3 ; lambda_2 = 3 ; % case 1
a = -lambda_1-lambda_2 ; b = lambda_1*lambda_2 ;
a2 = 1 ;  b2 = 1 ;
a1 = -b2 - a ; b1 = a1 - b ;
A = [ a1 a2 ; b1 b2 ] ;
lamda_1 = (-a+(a^2-4*b)^(1/2))/2 ;
lamda_2 = (-a-(a^2-4*b)^(1/2))/2 ;
dt = 0.001 ; 
t_final = 1 ;
t = 0 : dt : t_final ;
 
%  =======  case 1 ============ 
x1_0 = -0.05 ;
x2_0 = 0.05 ;
x1_0_r = 0.05 ;
x2_0_r = -0.05 ;
X_0 = [ x1_0 ; x2_0] ; 
X_0_r = [ x1_0_r ; x2_0_r] ; 

func_linear = @(t,X) linear_System_Function(t,X,A) ;
[ t , X1 ] = ode45( func_linear , t , X_0) ;
[ t , X2 ] = ode45( func_linear , t , X_0_r) ;

%% Plot
LW_1 = 1.4 ;
FS_ax = 18 ;
FS_leg = 12 ;

f(1) = figure() ;
plot(X1(:,1),X1(:,2),'b','LineWidth',LW_1) ; hold on ; plot(X1(1,1),X1(1,2),'ro','LineWidth',LW_1) ; 
plot(X2(:,1),X2(:,2),'b','LineWidth',LW_1) ;  plot(X2(1,1),X2(1,2),'ro','LineWidth',LW_1) ; 
xlabel('$x$','Interpreter','latex')
ylabel('$\dot{x}$','Interpreter','latex')
title(['Eigenvalue: $\lambda_1$ = ', num2str(lambda_1) , ' , $\lambda_2$ = ', num2str(lambda_2)],'Interpreter','latex')
% title('Eigenvalue: $\lambda_1$ = 5i , $\lambda_2$ = -5i ','Interpreter','latex')
ax(1) = gca ;
ax(1).XLim = [-2.2 2.2];
ax(1).YLim = [-8 8];
grid on

for i = 1:length(ax)
    set(ax(i),'FontSize',FS_ax,'FontName','Times New Roman')
%     RemovePlotWhiteArea(ax(i)) ;
end


function  dX = linear_System_Function(t,X,A)
dX = A*X  ;
end