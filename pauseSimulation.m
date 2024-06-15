function pauseSimulation(~, ~)
        % 获取当前handles
        handles = guidata(hFig);
        % 切换暂停状态
        handles.pauseState = ~handles.pauseState;
        if handles.pauseState
            set(hPauseButton, 'String', 'Resume');
        else
            set(hPauseButton, 'String', 'Pause');
        end
        % 更新handles
        guidata(hFig, handles);
    end

    % 调用模拟函数
    simulateQueue(nCustomers, maxTime, hFig);
end