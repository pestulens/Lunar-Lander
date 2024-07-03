close all;clc;clear

% 定義已知參數
phi_m = deg2rad(40); % 相位裕度，需根據具體問題設置
c = -0.12;    % 常數 c
a = -0.8;    % 常數 a
d = -0.74;    % 指數 d
omega_c = 0.5; % 交越頻率，需根據具體問題設置
J = 1;     % 常數 J

% 定義需要求解的未知數
syms Kd

% 由方程 (12) 求解 Kd
eq1 = tan(phi_m) == Kd * omega_c - (c / -a) * omega_c^(-d);

% 由方程 (7) 和 (11) 求解 Kd
eq2 = (Kd / (1 + (Kd * omega_c)^2)) - ((c / -a) * omega_c^(-d-1)) / (1 + ((c / -a) * omega_c^(-d))^2) == 0;

% 求解方程 (12) 來得到 Kd 的初步解
Kd_sol_initial = solve(eq1, Kd);

% 對每個初步解驗證是否滿足方程 (7) 和 (11)
Kd_sol_valid = [];
for i = 1:length(Kd_sol_initial)
    Kd_candidate = double(Kd_sol_initial(i));
    if abs(double(subs(eq2, Kd, Kd_candidate))) < 1e-6
        Kd_sol_valid = [Kd_sol_valid; Kd_candidate];
    end
end

% 如果有多個解，選擇其中一個
Kd_sol = Kd_sol_valid(1);

% 計算 Kp
Kp = (J * omega_c^2) / (sqrt(a^2 + (c * omega_c^(-d))^2) * (1 + (Kd_sol * omega_c)^2));

% 顯示結果
fprintf('Kd = %.4f\n', Kd_sol);
fprintf('Kp = %.4f\n', Kp);
