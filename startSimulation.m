function startSimulation(~, ~)
    % 获取绘图区域句柄
    data = guidata(gcf);
    axesHandle = data.axesHandle;

    % 初始化参数
    numCustomers = 20;
    customerlist = Halton_customer(numCustomers);
    
    arrivalRate = 1; % 每秒一个客户到达
    eventList = [];
    currentTime = 0;

    % 初始化两个柜台
    counters = struct('isBusy', false, 'endTime', inf, 'queue', []);
    counters(1:2) = counters; % 拓展结构体数组前两个元素

    % 创建到达事件
    for i = 1:numCustomers

        eventList = [eventList; struct('time', currentTime + exprnd(arrivalRate), 'type', 'arrive', 'id', customerlist(i).ID, 'counter', [])];
    end

    % 事件处理循环
    cus = 1;
    while ~isempty(eventList)
        % 从事件列表中更新当前事件
        currentEvent = eventList(1);
        % 清空事件列表中的当前事件
        eventList(1) = [];
        % 读取该顾客的服务时间
        currentTime = currentEvent.time;

        switch currentEvent.type
            % 如果顾客到达
            case 'arrive'
                [counters, eventList] = eventArrive(counters, eventList, currentEvent, currentTime, customerlist(cus).ServiceTime);
                cus = cus + 1;
            % 如果顾客准备结账离开
            case 'leave'
                [counters, eventList] = eventLeave(counters, eventList, currentEvent, currentTime, customerlist);
        end
        
        vzq(counters, axesHandle, customerlist);
        pause(0.8); % 用于可视化的暂停
    end
end
