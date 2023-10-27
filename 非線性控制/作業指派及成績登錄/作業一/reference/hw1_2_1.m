%2_a_1
x0=[1,1,0];
tspan=[0:0.001:100];
[t,x1]=ode45(@(t,x) odefcn(t,x),tspan,x0);
figure;
plot3(x1(:,1),x1(:,2),x1(:,3));
grid on;
view([30 30]);
title('x=1 , y=1 , z=0 , T=100','FontSize',14);
xlabel('x','FontSize',14);
ylabel('y','FontSize',14);
zlabel('z','FontSize',14);

%%
%2_b_1
x0=[1,1,0];
tspan=[0:0.001:1000];
[t,x1]=ode45(@(t,x) odefcn(t,x),tspan,x0);
figure;
plot3(x1(:,1),x1(:,2),x1(:,3));
grid on;
view([30 30]);
title('x=1 , y=1 , z=0 , T=1000','FontSize',14);
xlabel('x','FontSize',14);
ylabel('y','FontSize',14);
zlabel('z','FontSize',14);

%%
%2_c_1
x0=[1,1,0];
tspan=[0:0.001:10000];
[t,x1]=ode45(@(t,x) odefcn(t,x),tspan,x0);
figure;
plot3(x1(:,1),x1(:,2),x1(:,3));
grid on;
view([30 30]);
title('x=1 , y=1 , z=0 , T=10000','FontSize',14);
xlabel('x','FontSize',14);
ylabel('y','FontSize',14);
zlabel('z','FontSize',14);

function dxdt=odefcn(t,x)
dxdt=zeros(3,1);
dxdt(1)=10*(x(2)-x(1));
dxdt(2)=x(1)*(28-x(3))-x(2);
dxdt(3)=x(1).*x(2)-8*x(3)/3;
end