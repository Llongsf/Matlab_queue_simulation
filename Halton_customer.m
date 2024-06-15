function customers = Halton_customer(nums)
    maxServiceTime = 10; % 最大服务时间
    minServiceTime = 1;  % 最小服务时间
    
    % 创建 Halton 序列生成器
    p = haltonset(2);
    
    % 生成 Halton 序列
    haltonSeq = net(p, nums);
    
    % 映射客户ID到1到nums
    customerIDs = (1:nums)';
    
    % 映射服务时间到minServiceTime到maxServiceTime
    serviceTimes = minServiceTime + (maxServiceTime - minServiceTime) * haltonSeq(:, 2);
    
    % 创建结构数组存储客户ID和服务时间
    customers = struct('ID', num2cell(customerIDs), 'ServiceTime', num2cell(serviceTimes));
    
    % 根据 ServiceTime 进行排序
    [~, sortIdx] = sort([customers.ServiceTime]);
    customers = customers(sortIdx);
    
    % 打印客户信息，只输出一次按服务时间排序的用户信息
    fprintf('排序后的用户信息:\n');
    for i = 1:nums
        fprintf('Customer ID: %d, Service Time: %.2f seconds\n', customers(i).ID, customers(i).ServiceTime);
    end
end
