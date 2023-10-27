% Nolinear Control HW2_1
clc;
clear;
close all;

%%
t_final=100;
delta_t=0.01;
tspan=0:delta_t:t_final;
FS_ax=14;

%% 穩定焦點 (Stable focus)
figure(1)
sys1=[1 2 5];
for i=-1:0.2:1
    for j=-1:0.2:1
        x1=[i j];
        [t1, y1]=ode45(@(tspan, x1) odefun(tspan, x1, sys1), tspan, x1);
        plot(y1(:,1), y1(:,2), 'r-')
        hold on
    end
end

ax=gca;
title('Phase Plane of Stable focus , $(a,b)=(2,5)$', 'interpreter', 'latex')
xlabel('$x$', 'interpreter', 'latex')
ylabel('$\dot{x}$', 'interpreter', 'latex')
set(gca, 'XLim' ,[-1.5 1.5], 'YLim' ,[-1.5 1.5], 'FontSize', FS_ax, 'FontName', 'Time New Roman')
grid on

r1=roots(sys1);
figure(2)
scatter( real(r1), imag(r1), 'x', 'r')
ax=gca;
title('Roots of Characteristic Function with $(a,b)=(2,5)$' , 'interpreter', 'latex')
set(gca, 'XLim' ,[-2 0.1], 'YLim' ,[-3 3], 'FontSize', FS_ax, 'FontName', 'Time New Roman')
xlabel('$Re$', 'interpreter', 'latex')
ylabel('$j\omega$', 'interpreter', 'latex')
line([0 0],ylim(),'Color','k'); 
line(xlim(),[0 0],'Color','k');
grid on
%% 不穩定焦點 (Unstable focus)
figure(3)
sys2=[1 -2 5];
for i=-1:0.2:1
    for j=-1:0.2:1
        x2=[i j];
        [t2, y2]=ode45(@(tspan, x2) odefun(tspan, x2, sys2), tspan, x2);
        plot(y2(:,1), y2(:,2), 'r-')
        hold on
    end
end

ax=gca;
title('Phase Plane of Unstable focus , $(a,b)=(-2,5)$', 'interpreter', 'latex')
xlabel('$x$', 'interpreter', 'latex')
ylabel('$\dot{x}$', 'interpreter', 'latex')
set(gca, 'XLim' ,[-1000 1000], 'YLim' ,[-1000 1000], 'FontSize', FS_ax, 'FontName', 'Time New Roman')
grid on

r2=roots(sys2);
figure(4)
scatter( real(r2), imag(r2), 'x', 'r')
ax=gca;
title('Roots of Characteristic Function with $(a,b)=(-2,5)$' , 'interpreter', 'latex')
set(gca, 'XLim' ,[-0.1 2], 'YLim' ,[-3 3], 'FontSize', FS_ax, 'FontName', 'Time New Roman')
xlabel('$Re$', 'interpreter', 'latex')
ylabel('$j\omega$', 'interpreter', 'latex')
line([0 0],ylim(),'Color','k'); 
line(xlim(),[0 0],'Color','k');
grid on
%% 穩定節點 (Stable node)
figure(5)
sys3=[1 4 3];
for i=-1:0.2:1
    for j=-1:0.2:1
        x3=[i j];
        [t3, y3]=ode45(@(tspan, x3) odefun(tspan, x3, sys3), tspan, x3);
        plot(y3(:,1), y3(:,2), 'r-')
        hold on
    end
end

ax=gca;
title('Phase Plane of Stable node , $(a,b)=(4,3)$', 'interpreter', 'latex')
xlabel('$x$', 'interpreter', 'latex')
ylabel('$\dot{x}$', 'interpreter', 'latex')
set(gca, 'XLim' ,[-1.5 1.5], 'YLim' ,[-1.5 1.5], 'FontSize', FS_ax, 'FontName', 'Time New Roman')
grid on

r3=roots(sys3);
figure(6)
scatter( real(r3), imag(r3), 'x', 'r')
ax=gca;
title('Roots of Characteristic Function with $(a, b)=(4,3)$' , 'interpreter', 'latex')
set(gca, 'XLim' ,[-4 0.1], 'YLim' ,[-3 3], 'FontSize', FS_ax, 'FontName', 'Time New Roman')
xlabel('$Re$', 'interpreter', 'latex')
ylabel('$j\omega$', 'interpreter', 'latex')
line([0 0],ylim(),'Color','k'); 
line(xlim(),[0 0],'Color','k');
grid on
%% 不穩定節點 (Unstable node)
figure(7)
sys4=[1 -4 3];
for i=-1:0.2:1
    for j=-1:0.2:1
        x4=[i j];
        [t4, y4]=ode45(@(tspan, x4) odefun(tspan, x4, sys4), tspan, x4);
        plot(y4(:,1), y4(:,2), 'r-')
        hold on
    end
end

ax=gca;
title('Phase Plane of Unstable node , $(a,b)=(-4,3)$', 'interpreter', 'latex')
xlabel('$x$', 'interpreter', 'latex')
ylabel('$\dot{x}$', 'interpreter', 'latex')
set(gca, 'XLim' ,[-5 5], 'YLim' ,[-5 5], 'xtick', [-5:1:5], 'ytick', [-5:1:5], 'FontSize', FS_ax, 'FontName', 'Time New Roman')
grid on

r4=roots(sys4);
figure(8)
scatter( real(r4), imag(r4), 'x', 'r')
ax=gca;
title('Roots of Characteristic Function with $(a,b)=(-4,3)$' , 'interpreter', 'latex')
set(gca, 'XLim' ,[-1 4], 'YLim' ,[-3 3], 'FontSize', FS_ax, 'FontName', 'Time New Roman')
xlabel('$Re$', 'interpreter', 'latex')
ylabel('$j\omega$', 'interpreter', 'latex')
line([0 0],ylim(),'Color','k'); 
line(xlim(),[0 0],'Color','k');
grid on
%% 中心點 (Center)
figure(9)
sys5=[1 0 3];
for i=-1:0.2:1
    for j=-1:0.2:1
        x5=[i j];
        [t5, y5]=ode45(@(tspan, x5) odefun(tspan, x5, sys5), tspan, x5);
        plot(y5(:,1), y5(:,2), 'r-')
        hold on
    end
end

ax=gca;
title('Phase Plane of Center , $(a,b)=(0,3)$', 'interpreter', 'latex')
xlabel('$x$', 'interpreter', 'latex')
ylabel('$\dot{x}$', 'interpreter', 'latex')
set(gca, 'XLim' ,[-2.5 2.5], 'YLim' ,[-2.5 2.5], 'FontSize', FS_ax, 'FontName', 'Time New Roman')
grid on

r5=roots(sys5);
figure(10)
scatter( real(r5), imag(r5), 'x', 'r')
ax=gca;
title('Roots of Characteristic Function with $(a,b)=(0,3)$' , 'interpreter', 'latex')
set(gca, 'XLim' ,[-2 2], 'YLim' ,[-3 3], 'FontSize', FS_ax, 'FontName', 'Time New Roman')
xlabel('$Re$', 'interpreter', 'latex')
ylabel('$j\omega$', 'interpreter', 'latex')
line([0 0],ylim(),'Color','k'); 
line(xlim(),[0 0],'Color','k');
grid on
%% 鞍點 (Saddle point)
figure(11)
sys6=[1 3 -4];
for i=-1:0.2:1
    for j=-1:0.2:1
        x6=[i j];
        [t6, y6]=ode45(@(tspan, x6) odefun(tspan, x6, sys6), tspan, x6);
        
        plot(y6(:,1), y6(:,2), 'r-')
        hold on
    end
end

ax=gca;
title('Phase Plane of Saddle point , $(a,b)=(3,-4)$', 'interpreter', 'latex')
xlabel('$x$', 'interpreter', 'latex')
ylabel('$\dot{x}$', 'interpreter', 'latex')
set(gca, 'XLim' ,[-1.5 1.5], 'YLim' ,[-1.5 1.5], 'FontSize', FS_ax, 'FontName', 'Time New Roman')
grid on

r6=roots(sys6);
figure(12)
scatter( real(r6), imag(r6), 'x', 'r')
ax=gca;
title('Roots of Characteristic Function with $(a,b)=(3,-4)$' , 'interpreter', 'latex')
set(gca, 'XLim' ,[-5 2], 'YLim' ,[-3 3], 'FontSize', FS_ax, 'FontName', 'Time New Roman')
xlabel('$Re$', 'interpreter', 'latex')
ylabel('$j\omega$', 'interpreter', 'latex')
line([0 0],ylim(),'Color','k'); 
line(xlim(),[0 0],'Color','k');
grid on
%% Differential Equation
function dfdt=odefun(t, f, para)
a=para(2);
b=para(3);

del_x1=f(2);
del_x2=-a*f(2)-b*f(1);
dfdt=[del_x1, del_x2]';
end

