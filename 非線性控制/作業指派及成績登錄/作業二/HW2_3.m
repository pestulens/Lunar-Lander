% Nolinear Control HW2_3
clc;
clear;
close all;

% T=1, K=4, M0=0.2, e0=0.2

%%
t_final=100;
delta_t=0.01;
tspan=0:delta_t:t_final;
T=1;
K=4;
M0=0.2;
e0=0.2;
para=[T,K,M0,e0];
x0=[2, 0];
LW_1 = 1.4 ;
FS_ax = 16 ;
FS_leg = 14 ;

%% 
[t, x]=ode45(@(tspan, x0) odefun(tspan, x0, para), tspan,x0);
figure
plot(x(:,1),x(:,2),'b','LineWidth',LW_1)
hold on
grid on
plot([e0,e0],[0.6,-0.8],'r--');
plot([-e0,-e0],[0.6,-0.8],'r--');
xlabel('$e$','interpreter','latex')
ylabel('$\dot e$','interpreter','latex')
ax = gca ;
set(ax,'FontSize',FS_ax,'FontName','Times New Roman')

function dx=odefun(t,x,para)
T=para(1);
K=para(2);
M0=para(3);
e0=para(4);
dx = zeros(2,1); %[xa,xb,xc,theta]
if abs(x(1))<=para(4)
 dx(2) =(-x(2)-K*x(1))/T;
 dx(1) =x(2);
elseif x(1)>para(4)
 dx(2) =(-x(2)-K*M0 )/T;
 dx(1) =x(2);
elseif x(1)<-para(4)
 dx(2) =(-x(2)+K*M0 )/T;
 dx(1) =x(2);
end
end













