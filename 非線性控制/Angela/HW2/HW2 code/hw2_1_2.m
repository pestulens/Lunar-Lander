clear; clc; close all;

para.a=-1;
para.b=2;

figure;

for i=-1:1:1;
    for j=-1:1:1;
        x0=[i,j];
 
tspan=[0,10];
[t,x]=ode45(@(t,x) odefcn(t,x,para),tspan,x0);
plot(x(:,1),x(:,2),'r');
hold on;
line([0 0],ylim(),'Color','k');  %y-axis
line(xlim(),[0 0],'Color','k');  %x-axis
grid on;
title('a=-1, b=2','FontSize',14);
xlabel('x_1','FontSize',14);
ylabel('x_2','FontSize',14);
   end
end

r=roots([1 para.a para.b])
figure;
scatter(real(r),imag(r),'x','red');
xlim([-0.2 1]);
ylim([-2 2]);
line([0 0],ylim(),'Color','k');  %y-axis
line(xlim(),[0 0],'Color','k');  %x-axis
title('Characteristic value of a=-1, b=2','Fontsize',14);
xlabel('Re','FontSize',14);
ylabel('Im','FontSize',14);
grid on;

function dxdt=odefcn(t,x,para)
dxdt=zeros(2,1);

a=para.a;
b=para.b;

dxdt(1)=x(2);
dxdt(2)=-b*x(1)-a*x(2);
end