x0=[3,4];
tspan=[0,100];
[t,x]=ode45(@(t,x) odefcn(t,x),tspan,x0);
plot(t,x(:,1),'r',t,x(:,2),'b-.')
title('x_1=3 , x_2=4','FontSize',14);
xlabel('Time(s)','FontSize',14);
ylabel('x','FontSize',14);
legend('x_1','x_2','FontSize',14,'location','southeast');


function dxdt=odefcn(t,x)
dxdt=zeros(2,1);
dxdt(1)=x(2);
dxdt(2)=5*cos(t)-x(1).^3-0.1*x(2);
end

