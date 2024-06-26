close all;clc;clear

% 定義已知參數
phi_m = deg2rad(40); % 相位裕度，需根據具體問題設置
c = 0.11;     % 常數 c，需根據具體問題設置
a = -0.9;     % 常數 a，需根據具體問題設置
b = 0;
d = -0.7;     % 指數 d，需根據具體問題設置
omega_c = 0.5; % 交越頻率，需根據具體問題設置
J = 1;
% 定義需要求解的未知數
syms Kd gamma

% 方程 (12)
eq1 = gamma * atan(Kd * omega_c) - atan((c / -a) * omega_c^(-d)) == phi_m;

% 方程 (7) 和 (11)
eq2 = (gamma * Kd) / (1 + (Kd * omega_c)^2) - ((c / -a) * omega_c^(-d-1)) / (1 + ((c / -a) * omega_c^(-d))^2) == 0;

% 求解方程組
sol = solve([eq1, eq2], [Kd, gamma]);

% 提取解
Kd_sol = double(sol.Kd);
gamma_sol = double(sol.gamma);

% 顯示結果
fprintf('Kd = %.4f\n', Kd_sol);
fprintf('gamma = %.4f\n', gamma_sol);

% 計算 Kp
Kp = (J * omega_c^2) / ((1 + (Kd_sol * omega_c)^2)^(gamma_sol / 2) * sqrt(a^2 + (c * omega_c^(-d))^2));

% 顯示結果
fprintf('Kp = %.4f\n', Kp);