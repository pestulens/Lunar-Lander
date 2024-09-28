function [A_ok, B_ok, C_ok, D_ok] = system_identification(file_path)
    % 讀取資料
    original_data = readmatrix(file_path);

    % 整理資料
    Start_index = find(~isnan(original_data(:, 1)), 1, 'first'); % 找到第一個非NaN值的位置
    End_index = find(original_data(:, 1) < 0, 1, 'first') - 1; % 找到資料中小於0的第一個值，並將其作為結束點
    if isempty(End_index)
        End_index = length(original_data); % 如果沒有找到結束點，則使用資料的最後一點
    end
    Data = original_data(Start_index:End_index, :); % 擷取有效範圍的資料

    % 提取資料
    Time = Data(:,1); % 時間資料
    Tank_pressure = Data(:,2); % 儲罐壓力
    Tank_pressure_filter = Data(:,3); % 濾波後的儲罐壓力
    Chamber_pressure = Data(:,4); % 燃燒室壓力
    Chamber_pressure_filter = Data(:,5); % 濾波後的燃燒室壓力
    H2O2_flow_rate_filter = Data(:,6); % 濾波後的H2O2流量
    raw_Thrust = -(1291.9 * Data(:,7) - 6268.6); % 原始推力資料
    Thrust_filter = Data(:,8); % 濾波後的推力
    H2O2_flow_rate = Data(:,9) * 0.88 / 6.67; % 計算流量
    Open_Signal = Data(:,10); % 開關信號

    % 推力基線調整
    baseline_samples = 10; % 使用前10個樣本計算基線
    baseline_value = mean(raw_Thrust(1:baseline_samples)); % 計算基線平均值
    Thrust = raw_Thrust - baseline_value; % 調整後的推力

    % 系統辨識部分
    thrust_t = (Thrust * 9.81/1000) * 0.35; % 推力轉換為牛頓
    input_t = 0.35 * (Open_Signal / 5); % 控制信號轉換

    % 填補 input_t 中的 NaN 值
    input_now = 0;
    for k = 1:length(input_t)
        if ~isnan(input_t(k))
            input_now = input_t(k); % 如果不是 NaN，儲存當前值
        else
            input_t(k) = input_now; % 如果是 NaN，使用上一次的有效值
        end
    end
    input_t = input_t';

    % 系統辨識模型
    [G_ok, H_ok, C_ok, D_ok, L_ok] = Auxi_OKID_JXL(input_t, thrust_t', 3, 4, 0);

    % 將離散模型轉換為連續模型
    [A_ok, B_ok] = d2c(G_ok, H_ok, 0.001); % 離散轉連續
end
