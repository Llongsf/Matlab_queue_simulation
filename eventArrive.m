function [counters, eventList] = eventArrive(counters, eventList, currentEvent, currentTime, serviceTime)
    % 找到最短队列的柜台
    minQueueLength = inf;
    selectedCounter = 0;
    
    for i = 1:length(counters)
        queueLength = length(counters(i).queue);
        if queueLength < minQueueLength
            minQueueLength = queueLength;
            selectedCounter = i;
        end
    end

    % 将顾客加入最短队列的柜台
    counters(selectedCounter).queue = [counters(selectedCounter).queue, currentEvent.id];
    
    % 如果柜台空闲，立即开始服务
    if ~counters(selectedCounter).isBusy
        counters(selectedCounter).isBusy = true;
        counters(selectedCounter).endTime = currentTime + serviceTime;
        eventList = [eventList; struct('time', counters(selectedCounter).endTime, 'type', 'leave', 'id', currentEvent.id, 'counter', selectedCounter)];
    end
end
