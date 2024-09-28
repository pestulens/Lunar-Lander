close all; clc; clear;

% 定義已知參數
phi_m = deg2rad(70); % 相位裕度
c = 0.12;    % 常數 c
a = -0.9;    % 常數 a
d = 0.74;    % 指數 d
omega_c = 5; % 交越頻率
J = 1.2;       % 常數 J

% 定義需要求解的未知數
syms Kd

% 由方程 (12) 求解 Kd1
eq1 = tan(phi_m) == Kd * omega_c - (c / -a) * omega_c^(-d);
Kd_sol_1 = solve(eq1, Kd);

% 由方程 (7) 和 (11) 求解 Kd2
eq2 = (Kd / (1 + (Kd * omega_c)^2)) - ((c / -a) * omega_c^(-d-1)) / (1 + ((c / -a) * omega_c^(-d))^2) == 0;
Kd_sol_2 = solve(eq2, Kd);

% 計算兩組解對應的 Kp
Kp_1 = (J * omega_c^2) ./ (sqrt(a^2 + (c * omega_c^(-d))^2) .* (1 + (Kd_sol_1 .* omega_c).^2));
Kp_2 = (J * omega_c^2) ./ (sqrt(a^2 + (c * omega_c^(-d))^2) .* (1 + (Kd_sol_2 .* omega_c).^2));

% 顯示結果
fprintf('--- 解 Kd1 ---\n');
for i = 1:length(Kd_sol_1)
    fprintf('Kd1 = %.4f\n', double(Kd_sol_1(i)));
    fprintf('Kp1 = %.4f\n', double(Kp_1(i)));
end

fprintf('--- 解 Kd2 ---\n');
for i = 1:length(Kd_sol_2)
    fprintf('Kd2 = %.4f\n', double(Kd_sol_2(i)));
    fprintf('Kp2 = %.4f\n', double(Kp_2(i)));
end