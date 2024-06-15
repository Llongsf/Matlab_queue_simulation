function visualizeQueue(counters, axesHandle,customerlist)
    % 可视化排队情况
    cla(axesHandle);
    hold(axesHandle, 'on');
    
    % 遍历每个柜台
    cus = 1;
    for i = 1:length(counters)
        % 如果当前柜台队伍非空
        if ~isempty(counters(i).queue)
            % 遍历当前柜台的队列
            for j = 1:length(counters(i).queue)
                % 确定矩形的位置和尺寸、颜色
                rectangle('Position', [i*100, j*20, 80, 20], 'FaceColor', '#F08080', 'Parent', axesHandle);
                % 在矩阵中间添加用户ID
                text(i*100 + 40, j*20 + 9, num2str(customerlist(cus).ID), 'HorizontalAlignment', 'center', 'Parent', axesHandle);
                cus = cus + 1;
            end
        end
    end
    % 整个绘图区域的X轴范围为[0, 300],Y轴范围为[0, 500]
    xlim(axesHandle, [0 300]);
    ylim(axesHandle, [0 500]);
    hold(axesHandle, 'off');
end