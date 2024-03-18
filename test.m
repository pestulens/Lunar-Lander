close all;clc;clear
%% simulink
stop_time = 10;
timestep = 0.01;
lag_time = 0.126;
out = sim("actuactor_model.slx")