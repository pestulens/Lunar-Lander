close all ;clc;clear

%% Model parameters
TimeStep = 10^-3;   %Simulation time step(second)
TimeStop = 20;      %Simulation time (second)
%% Mission Parameters
initial_condition = [10;10;0];
Desire_att = [0;0;90];    %desire attitude in roll pitch yaw(degree)
%% PWPF parameter
Schimitt_Upper_bound_x = 0.5;
Schimitt_Lower_bound_x = 0.15;
Thruster_mom_x = 0.1;

Schimitt_Upper_bound_y = 0.5;
Schimitt_Lower_bound_y = 0.15;
Thruster_mom_y = 0.1;

Schimitt_Upper_bound_z = 0.5;
Schimitt_Lower_bound_z = 0.15;
Thruster_mom_z = 0.3;
%% Simulink
SimulinkData=sim("lunar_lander_sim_PWPF_2023a.slx",TimeStop);
