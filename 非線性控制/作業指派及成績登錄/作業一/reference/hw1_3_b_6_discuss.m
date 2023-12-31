%3_b_6_discuss
u=-2;
x0=[1.1,0];
tspan=[0:0.01:10];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
figure;
plot(xx,yy);
hold on;
x0=[1.1,pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[1.1,2*pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[1.1,3*pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[1.1,4*pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[1.1,5*pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[1.1,6*pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[1.1,7*pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[1.1,8*pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
%%
x0=[0.9,0];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[0.9,pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[0.9,2*pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[0.9,3*pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[0.9,4*pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[0.9,5*pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[0.9,6*pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[0.9,7*pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
x0=[0.9,8*pi/4];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
%%
x0=[1,0];
tspan=[0:0.01:10];
[t,x1]=ode45(@(t,x) odefcn(t,x,u),tspan,x0);
xx=x1(:,1).*cos(x1(:,2));
yy=x1(:,1).*sin(x1(:,2));
plot(xx,yy);
hold on;
grid on;
axis equal;
title('\mu=-2 for r=0.9 , r=1 , r=1.1','FontSize',14);
xlabel('x(t)','FontSize',14);
ylabel('y(t)','FontSize',14);

function dxdt=odefcn(t,x,u)
dxdt=zeros(2,1);
dxdt(1)=x(1).*(u+2*x(1)^4);
dxdt(2)=1;
end