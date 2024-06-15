function [counters, eventList] = eventLeave(counters, eventList, currentEvent, currentTime, customerlist)
    selectedCounter = currentEvent.counter;
    
    % 从柜台队列中移除顾客
    counters(selectedCounter).queue(1) = [];
    
    % 如果队列中仍有顾客，开始服务下一个
    if ~isempty(counters(selectedCounter).queue)
        nextCustomerID = counters(selectedCounter).queue(1);% 移除柜台当前服务完的顾客
        serviceTime = customerlist(nextCustomerID).ServiceTime; % 获取下一个顾客的服务时间
        counters(selectedCounter).endTime = currentTime + serviceTime;
        eventList = [eventList; struct('time', counters(selectedCounter).endTime, 'type', 'leave', 'id', nextCustomerID, 'counter', selectedCounter)];
    else
        counters(selectedCounter).isBusy = false;
        counters(selectedCounter).endTime = inf;
    end
end
