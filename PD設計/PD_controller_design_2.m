close all; clc; clear;

% 定義已知參數
phi_m = deg2rad(90); % 相位裕度，需根據具體問題設置
c = 0.11;     % 常數 c，需根據具體問題設置
a = -0.9;     % 常數 a，需根據具體問題設置
b = 0;
d = -0.7;
omega_c = 1; % 交越頻率，需根據具體問題設置
J = 1.2;     % 常數 J

% 定義需要求解的未知數
syms Kd

% 由方程 (12) 求解 Kd (根據相位裕度公式)
eq1 = tan(phi_m) == Kd * omega_c - (c / -a) * omega_c^(-d);
eq2 = (Kd / (1 + (Kd * omega_c)^2)) - ((c / -a) * omega_c^(-d-1)) / (1 + ((c / -a) * omega_c^(-d))^2) == 0;


% 求解方程 (12) 來得到 Kd 的所有解
Kd_solutions_1 = solve(eq1, Kd);
Kd_solutions_2 = solve(eq2, Kd);

% 顯示從 eq1 得到的所有解
% disp('從 eq1 得到的所有 Kd 解:');
Kd_solutions_1 = double(Kd_solutions_1);
Kd_solutions_2 = double(Kd_solutions_2);% 將符號解轉為數字
Kd_solutions = [Kd_solutions_1;Kd_solutions_2];
% disp(Kd_solutions);

% ------------------- 計算對應的 Kp -------------------
Kp_solutions = []; % 用於儲存對應的 Kp
for i = 1:length(Kd_solutions)
    Kd_sol = Kd_solutions(i);

    % 計算 Kp 根據求得的 Kd 解
    Kp_sol = (J * omega_c^2) / (sqrt(a^2 + (c * omega_c^(-d))^2) * (1 + (Kd_sol * omega_c)^2));

    % 儲存 Kp 結果
    Kp_solutions = [Kp_solutions; Kp_sol];

    % 顯示結果
    fprintf('Kd = %.4f, Kp = %.4f\n', Kd_sol, Kp_sol);
end

% % 顯示所有計算出的 Kp 解
% disp('對應的 Kp 解:');
% disp(Kp_solutions);
