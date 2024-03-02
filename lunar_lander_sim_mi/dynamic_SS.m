close all;clc;clear

%% parameters
Ini = [1 0 0;0 1 0; 0 0 1];
kp = 1.2 ;
kd = 1.2 ;
tspan = 0:0.01:5;
y0 = [0;0;0;5;5;5]*pi/180;
dydt = zeros(6,1);
[t,y] = ode45(@(t,y) odefcn(t,y,Ini,kp,kd,dydt), tspan, y0);

%% ode function
function dydt = odefcn(t,y,Ini,kp,kd,dydt)
  
  p             = dydt(1);      %w_x dot
  q             = dydt(2);      %w_y dot
  r             = dydt(3);      %w_z dot
  phi_dot       = dydt(4);
  theta_dot     = dydt(5);
  psi_dot       = dydt(6);
  
  w = [y(1);y(2);y(3)];
  w_dot = [p;q;r];
  u_x = kp*y(4)+kd*phi_dot;
  u_y = kp*y(5)+kd*theta_dot;
  u_z = kp*y(6)+kd*psi_dot;
  u = [u_x;u_y;u_z];
  w_dot = Ini\u-Ini\( cross(w,Ini*w) );
end