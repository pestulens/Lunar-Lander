clc
clear
fileID = uigetfile('*.txt');
C = readmatrix(fileID);
C1 = C(25:end,1:7);


