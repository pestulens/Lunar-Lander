close all ;clc;clear

%% Model parameters
TimeStep = 10^-6;   %Simulation time step(second)
TimeStop = 60;      %Simulation time (second)
%% Mission Parameters
initial_condition = [20;20;0];
Desire_att = [0;0;45];    %desire attitude in roll pitch yaw(degree)
%% PWPF parameter
filter_gain_x = 4;
filter_time_constant_x = 0.1;
Schimitt_Upper_bound_x = 0.5;
Schimitt_Lower_bound_x = 0.15;
Thruster_mom_x = 0.35*0.5;
thrust_delay_x = 0.1;

filter_gain_y = 4;
filter_time_constant_y = 0.1;
Schimitt_Upper_bound_y = 0.5;
Schimitt_Lower_bound_y = 0.15;
Thruster_mom_y = 0.35*0.5;
thrust_delay_y = 0.1;

filter_gain_z = 4;
filter_time_constant_z = 0.5;
Schimitt_Upper_bound_z = 0.5;
Schimitt_Lower_bound_z = 0.15;
Thruster_mom_z = 0.35*0.5*2;
thrust_delay_z = 0.1;%thrust delay (s)
%% Simulink
SimulinkData=sim("lunar_lander_sim_PWPF_tuned_2023b.slx",TimeStop);

%% Extract Data
angle = SimulinkData.angle.Data;
angle_rate = SimulinkData.angular_rate.Data;

for i = 1:3
    figure(i)
    plot(angle(:,i),angle_rate(:,i),"LineWidth",2)
    xlabel("Attitude(degree)","FontSize",14)
    ylabel("Angular rate(degree/s)","FontSize",14)
    switch i
        case 1
            title("X-Direction","FontSize",20)
        case 2
            title("Y-Direction","FontSize",20)
        case 3
            title("Z-Direction","FontSize",20)
    end
end
