close all; clc; clear;

%% 調用系統辨識函數
% 定義輸入檔案路徑
file_path = "H:\我的雲端硬碟\碩士班\登月器\1N推進器\推力測試資料\一號推進器\20240925\10s_5_3.txt";

% 調用系統辨識函數，獲取辨識後的推力及輸入信號
[A_ok, B_ok, C_ok, D_ok] = system_identification(file_path);

%% 模型參數
TimeStep = 10^-3;   % 模擬時間步長（秒）
TimeStop = 80;      % 模擬總時間（秒）
I = 1 * [0.619 -0.008 0; -0.008 0.782 0; 0 0 1.226]; % 慣性矩陣

% 任務參數
initial_condition = [20; 20; 0]; % 初始條件
Desire_att = [0; 0; 90]; % 期望姿態 (roll, pitch, yaw)

% PWPF 參數
filter_gain_x = 2;
filter_time_constant_x = 0.5;
Schimitt_Upper_bound_x = 3;
Schimitt_Lower_bound_x = 0.15;
Thruster_mom_x = 0.35 * 1;
thrust_delay_x = 0.1;

filter_gain_y = 2;
filter_time_constant_y = 0.5;
Schimitt_Upper_bound_y = 3;
Schimitt_Lower_bound_y = 0.15;
Thruster_mom_y = 0.35 * 1;
thrust_delay_y = 0.1;

filter_gain_z = 2;
filter_time_constant_z = 0.5;
Schimitt_Upper_bound_z = 3;
Schimitt_Lower_bound_z = 0.15;
Thruster_mom_z = 0.35 * 1 * 2;
thrust_delay_z = 0.1; % 推力延遲時間（秒）

%% 進行 Simulink 模擬
SimulinkData = sim("rate_control.slx", TimeStop);

%% 提取模擬結果
angle = SimulinkData.angle.Data; % 姿態角度
angle_rate = SimulinkData.angular_rate.Data; % 角速度
thruster_positve_z = SimulinkData.thruster_positve_z.Data; % 正推力
thruster_command_positve_z = SimulinkData.thruster_command_positve_z.Data; % 正推力命令

%% 繪圖
t = 0:TimeStep:TimeStop;

for i = 1:3
    figure(i)
    plot(Desire_att(i) - angle(:,i), -angle_rate(:,i), "LineWidth", 2)
    xlabel("姿態誤差(度)", "FontSize", 14)
    ylabel("角速度(度/秒)", "FontSize", 14)
    switch i
        case 1
            title("X方向", "FontSize", 20)
        case 2
            title("Y方向", "FontSize", 20)
        case 3
            title("Z方向", "FontSize", 20)
    end
end

figure(i+1)
for j = 1:3
    plot(t, angle(:,j), "LineWidth", 2)
    hold on
end
xlabel("時間(秒)", "FontSize", 14)
ylabel("姿態(度)", "FontSize", 14)
title("姿態響應", "FontSize", 20)
legend("phi angle", "theta angle", "psi angle")

%% 推力圖
figure(i+2)
yyaxis left
plot(t, 100 * (thruster_positve_z / 0.7), 'LineWidth', 2)
xlabel("時間(秒)", "FontSize", 16)
ylabel("推力(g)", "FontSize", 16)

yyaxis right
plot(t, thruster_command_positve_z, 'LineWidth', 2)
legend("推力", "開閥信號", "FontSize", 12)
title("+Z旋轉方向推力與命令對比圖", "FontSize", 20)
