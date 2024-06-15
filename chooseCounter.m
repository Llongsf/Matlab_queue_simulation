function [chosenCounter, counters] = chooseCounter(counters)
    % 选择空闲柜台
    waitTimes = [counters.endTime];
    % 选择等待时间最短的柜台
    [~, chosenCounter] = min(waitTimes);
end
