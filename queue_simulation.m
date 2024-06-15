% queue_simulation函数创建GUI窗口，包含一个开始按钮和绘图区域。
% startSimulation函数初始化参数并开始模拟过程，包括事件处理和可视化。
% eventArrive函数处理客户到达事件。
% eventLeave函数处理客户离开事件。
% chooseCounter函数选择空闲柜台或等待时间最短的柜台。
% visualizeQueue函数用于可视化排队情况。
clc;clear;
% 主脚本：queue_simulation.m

% 创建GUI窗口
fig = figure('Name', 'Queue Simulation', 'NumberTitle', 'off', 'Position', [100, 100, 800, 600]);

% 创建开始按钮
uicontrol('Style', 'pushbutton', 'String', 'Start Simulation','Position', [350, 50, 100, 50], 'Callback', @startSimulation);


% 创建绘图区域
axesHandle = axes('Units', 'pixels', 'Position', [100, 150, 600, 400]);

% 存储绘图区域句柄
guidata(fig, struct('axesHandle', axesHandle));



