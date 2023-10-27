%% Nolinear Control HW3_d
clc;
clear;
close all;

%% System Parameters 
K = 1;
num=[K];
den1=conv([0.1 1],[0.02 1]);
den=conv([1 0],den1);
sys=tf(num,den);
margin(sys)
grid on