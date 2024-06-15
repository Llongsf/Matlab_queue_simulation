function vzq(counters, axesHandle, customerlist)
    % 可视化排队情况

    % 不显示x轴和y轴
    axis(axesHandle,'off');

    % 清除当前绘图区域
    cla(axesHandle);
    hold(axesHandle, 'on');

    % 初始化说明栏的Y轴位置
    ex_Y = 480; % 从绘图区域顶部开始
    
    % 遍历每个柜台
    for i = 1:length(counters)
        
        % 显示当前柜台的等待人数
        text(i*100, 500, sprintf('柜台%d等待人数: %d', i, length(counters(i).queue)), 'HorizontalAlignment', 'center', 'Parent', axesHandle);
        
        % 如果当前柜台队伍非空
        if ~isempty(counters(i).queue)
            % 遍历当前柜台的队列
            for j = 1:length(counters(i).queue)
                % 确定矩形的位置和尺寸、颜色
                rectangle('Position', [i*100, j*20, 80, 20], 'FaceColor', '#F08080', 'Parent', axesHandle);
                
                % 在矩形中间添加用户ID
                customerID = counters(i).queue(j);
                text(i*100 + 40, j*20 + 9, num2str(customerID), 'HorizontalAlignment', 'center', 'Parent', axesHandle);
                
                % 添加说明栏
                customerIndex = find([customerlist.ID] == customerID);
                if ~isempty(customerIndex)
                    ex_text = sprintf('柜台%d: 用户%d 开始排队，服务时间为:%.2fmin', i, customerlist(customerIndex).ID, customerlist(customerIndex).ServiceTime);
                    text(290, ex_Y, ex_text, 'HorizontalAlignment', 'left', 'Parent', axesHandle);
                    
                    % 更新说明栏的Y轴位置
                    ex_Y = ex_Y - 20; % 每个说明间隔20
                end
            end
        end
    end
    
    % 设置绘图区域的X轴和Y轴范围
    xlim(axesHandle, [0 500]); % 扩展X轴范围以容纳说明栏
    ylim(axesHandle, [0 500]);
    hold(axesHandle, 'off');
end