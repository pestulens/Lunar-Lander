close all ;clc;clear

%% Model parameters
TimeStep = 10^-3;   %Simulation time step(second)
TimeStop = 80;      %Simulation time (second)
I = 1*[0.619 -0.008 0;-0.008 0.782 0;0 0 1.226];
%% Mission Parameters
initial_condition = [20;20;0];
Desire_att = [0;0;90];    %desire attitude in roll pitch yaw(degree)
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

filter_gain_z = 2;
filter_time_constant_z = 0.5;
Schimitt_Upper_bound_z = 3;
Schimitt_Lower_bound_z = 0.15;
Thruster_mom_z = 0.35*0.5*2;
thrust_delay_z = 0.1;%thrust delay (s)
%% Simulink
SimulinkData=sim("lunar_lander_sim_PWPF_tuned.slx",TimeStop);

%% Extract Data
angle = SimulinkData.angle.Data;
angle_rate = SimulinkData.angular_rate.Data;
pwpf_output = SimulinkData.u_z.Data;
pd_out = SimulinkData.PD_out.Data;

%% pwpf output data 整理
% on_pos = zeros(length(pwpf_output),1);
% on_neg = zeros(length(pwpf_output),1);
j = 1;
k = 1;
for i = 1:length(pwpf_output)
    if pwpf_output(i)>0
        on_pos(j,1) = 1;
        on_pos(j,2) = angle(i,3)-Desire_att(3);
        on_pos(j,3) = angle_rate(i,3);
        on_pos(j,4) = angle_rate(i,3)+angle(i,3)-Desire_att(3);
        j = j+1;
    elseif pwpf_output(i)<0
        on_neg(k,1) = 1;
        on_neg(k,2) = angle(i,3)-Desire_att(3);
        on_neg(k,3) = angle_rate(i,3);
        on_neg(j,4) = angle_rate(i,3)+angle(i,3)-Desire_att(3);
        k=k+1;
    end
end
%% find swith point
j = 1;
k = 1;
for i = 1:length(pwpf_output)-1
    if pwpf_output(i) == 0 && pwpf_output(i+1)>0
        switch_point_pos(j,1) = i;
        switch_point_pos(j,2) = Desire_att(3)-angle(i,3);
        switch_point_pos(j,3) = angle_rate(i,3);
        switch_point_pos(j,4) = switch_point_pos(j,2)-switch_point_pos(j,3);
        switch_point_pos(j,5) = pd_out(i);
        j=j+1;

    end
end

%% plot

for i = 1:3
    figure(i)
    plot(Desire_att(i)-angle(:,i),-angle_rate(:,i),"LineWidth",2)
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


% %% test
% c = switch_point_pos(:,2)*0.4-switch_point_pos(:,3)*0.9;
% x = 20:length(c);
% figure(i+1)
% plot(x,c(20:length(c)),x,switch_point_pos(20:length(c),5))
% legend("manul pd","auto pd")