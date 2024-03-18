close all;clc;
r = 0.3; %radius(m)
a = 0:45:315;
l = zeros(3,8);
for i = 1:length(a)
    l(1:2,i) = r*[cosd(a(i));sind(a(i))];
end

%% thrust decomposition
gama = 30;
T = 10 +zeros(1,8);%thrust (N)
for i = 1:length(T)
    if mod(i,2) == 0
        F(1:3,i) = [T(i)*sind(gama)*sind(a(i));-T(i)*sind(gama)*cosd(a(i));T(i)*cosd(gama)];
    else
        F(1:3,i) = [-T(i)*sind(gama)*sind(a(i));T(i)*sind(gama)*cosd(a(i));T(i)*cosd(gama)];
    end
end

%% moment calculation

for i = 1:length(T)
    mom(1:3,i) = cross(l(1:3,i),F(1:3,i));
end

%% linear formation
for i = 1:length(T)
    A(1:3,i) = mom(1:3,i)./T(i);
end

%% Load data from sinulink

Md = out.torque.Data';
t  = out.torque.time;
%% allocation 
f = [1 1 1 1 1 1 1 1];
for i =1:length(Md)
    prob = optimproblem;
    x = optimvar('x',8,1,'LowerBound',0);
    Aeq = A;
    beq = Md(1:3,i);
    cons = Aeq*x == beq;
    prob.Constraints.cons = cons;
    prob.Objective = f*x;
    x1 = solve(prob);
    u(:,i) = x1.x;
end
u_in = [t u'];
% prob = optimproblem;
%     x = optimvar('x',8,length(Md),'LowerBound',0);
%     Aeq = A;
%     beq = Md;
%     cons = Aeq*x == beq;
%     prob.Constraints.cons = cons;
%     prob.Objective = f*x;
%     x1 = solve(prob);
%     u = x1.x;
