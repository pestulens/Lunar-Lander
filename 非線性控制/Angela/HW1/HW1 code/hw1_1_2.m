%1_a_2
x0=[3,4];
tspan=[0:0.001:150];
[t,x1]=ode45(@(t,x) odefcn(t,x),tspan,x0);
figure;
plot(t,x1(:,1),'r',t,x1(:,2),'b-.');
grid on;
title('x_1=3 , x_2=4','FontSize',14);
xlabel('Time(s)','FontSize',14);
ylabel('x','FontSize',14);
legend('x_1','x_2','FontSize',14,'location','southwest');

%%
%1_b_2
x0=[3.01,4.01];
tspan=[0:0.001:150];
[t,x2]=ode45(@(t,x) odefcn(t,x),tspan,x0);
figure;
plot(t,x2(:,1),'r',t,x2(:,2),'b-.');
grid on;
title('x_1=3.01 , x_2=4.01','FontSize',14);
xlabel('Time(s)','FontSize',14);
ylabel('x','FontSize',14);
legend('x_1','x_2','FontSize',14,'location','southwest');

%%
%error between a&b
tspan=[0:0.001:150];
figure;
plot(t,x1(:,1)-x2(:,1));
grid on;
title('difference between (a) and (b)','FontSize',14);
xlabel('Time(s)','FontSize',14);
ylabel('x','FontSize',14);


function dxdt=odefcn(t,x)
dxdt=zeros(2,1);
dxdt(1)=x(2);
dxdt(2)=5*cos(t)-x(1)-0.1*x(2);
end

