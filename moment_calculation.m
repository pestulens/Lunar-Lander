close all;clc;clear
r = 0.35; %radius(m)
a = 22.5:45:337.5;
l = zeros(3,8);
I=[0.619 -0.008 0;-0.008 0.782 0;0 0 1.226];
for i = 1:length(a)
    l(1:2,i) = r*[cosd(a(i));sind(a(i))];
end
%% Model parameters
TimeStep = 10^-3;   %Simulation time step(second)
TimeStop = 5;      %Simulation time (second)
%% thrust decomposition
gam = 30;
T = 10 +zeros(1,8);%thrust (N)
for i = 1:length(T)
    if mod(i,2) == 0
        F(1:3,i) = [T(i)*sind(gam)*sind(a(i));-T(i)*sind(gam)*cosd(a(i));T(i)*cosd(gam)];
    else
        F(1:3,i) = [-T(i)*sind(gam)*sind(a(i));T(i)*sind(gam)*cosd(a(i));T(i)*cosd(gam)];
    end
end

%% moment produce by every thruster 

for i = 1:length(T)
    Moment_thrust(1:3,i) = cross(l(1:3,i),F(1:3,i));
end

%% linear formation
for i = 1:length(T)
    A(1:3,i) = Moment_thrust(1:3,i)./T(i);
end

%% Simulink
SimulinkData=sim("lunar_lander_sim_an.slx",TimeStop);
MomentDemand = SimulinkData.torque.Data'; %moment demand

%% Load data from sinulink
Md = SimulinkData.torque.Data';
t  = SimulinkData.torque.time;
LinearTerm = SimulinkData.LinearTerm.Data;
NonLinearTerm = SimulinkData.NonLinearTerm.Data;
for i = 1:length(t)
    LNratio(i,1:3) = LinearTerm(i,1:3)./NonLinearTerm(i,1:3);
    NLratio(i,1:3) = NonLinearTerm(i,1:3)./LinearTerm(i,1:3);
end


%% allocation 
f = [1 1 1 1 1 1 1 1];
for i =1:length(MomentDemand)
    prob = optimproblem;
    x = optimvar('x',8,1,'LowerBound',0,'UpperBound',10);
    Aeq = A;
    beq = MomentDemand(1:3,i);
    cons = Aeq*x == beq;
    prob.Constraints.cons = cons;
    prob.Objective = f*x;
    op = optimset('Display','off');
    x1 = solve(prob,"Options",op);
    u(:,i) = x1.x;
end
u_in = [t u'];
toc
% prob = optimproblem;
%     x = optimvar('x',8,length(Md),'LowerBound',0);
%     Aeq = A;
%     beq = Md;
%     cons = Aeq*x == beq;
%     prob.Constraints.cons = cons;
%     prob.Objective = f*x;
%     x1 = solve(prob);
%     u = x1.x;
%% test 
    % 
    % i = 1
    % prob = optimproblem;
    % x = optimvar('x',8,1,'LowerBound',0);
    % Aeq = A;
    % beq = MomentDemand(1:3,i);
    % cons = Aeq*x == beq;
    % prob.Constraints.cons = cons;
    % prob.Objective = f*x;
    % x1 = solve(prob);
    % linprog(f,Aeq,beq,A,beq,-Inf,Inf)
    % u(:,i) = x1.x;
%% plot
time_plot = 0:TimeStep:TimeStop;
figure(1)
plot(time_plot,u')

figure(2)
for i = 1:8
    subplot(4,2,i)
    plot(time_plot,u(i,:))
    xlabel("time(second)")
    ylabel("Force(N)")
end
%% 
close all

figure(3)
for i = 1:3
    subplot(3,1,i)
    plot(t,LNratio(:,i))
    xlabel("time(second)")
    ylabel("Command Torque")
    switch i
        case 1
            title("X")
        case 2
            title("y")
        case 3
            title("z")
    end
    sgtitle("Linear term to NonLinear term Ratio")
end


figure(4)
for i = 1:3
    subplot(3,1,i)
    plot(t,LinearTerm(:,i))
    xlabel("time(second)")
    ylabel("Command Torque")
    switch i
        case 1
            title("X")
        case 2
            title("y")
        case 3
            title("z")
    end
    sgtitle("Linear term")
end

figure(5)
for i = 1:3
    subplot(3,1,i)
    plot(t,NonLinearTerm(:,i))
    xlabel("time(second)")
    ylabel("Command Torque")
    switch i
        case 1
            title("X")
        case 2
            title("y")
        case 3
            title("z")
    end
    sgtitle("NonLinear term")
end

figure(6)
for i = 1:3
    subplot(3,1,i)
    plot(t,NLratio(:,i))
    xlabel("time(second)")
    switch i
        case 1
            title("X")
        case 2
            title("y")
        case 3
            title("z")
    end
    sgtitle("NonLinear term to Linear term Ratio")
end

%% pwpf input 
test = [time_plot' u(1,:)'];
