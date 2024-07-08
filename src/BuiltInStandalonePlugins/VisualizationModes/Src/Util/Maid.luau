local v0 = {};
v0.new = function()
    return (setmetatable({
        _tasks = {}
    }, v0));
end;
v0.isMaid = function(v1)
    local v2 = false;
    if type(v1) == "table" then
        v2 = v1.ClassName == "Maid";
    end;
    return v2;
end;
v0.__index = function(v3, v4)
    if not v0[v4] then
        return v3._tasks[v4];
    else
        return v0[v4];
    end;
end;
v0.__newindex = function(v5, v6, v7)
    if v0[v6] ~= nil then
        error(string.format("Cannot use '%s' as a Maid key", (tostring(v6))), 2);
    end;
    local l__tasks_0 = v5._tasks;
    local v9 = l__tasks_0[v6];
    if v9 == v7 then
        return ;
    else
        l__tasks_0[v6] = v7;
        if v9 then
            if type(v9) == "function" then
                v9();
                return ;
            elseif type(v9) == "thread" then
                local v10 = nil;
                if coroutine.running() ~= v9 then
                    v10 = pcall(function()
                        task.cancel(v9);
                    end);
                end;
                if not v10 then
                    task.defer(function()
                        task.cancel(v9);
                    end);
                    return ;
                end;
            elseif typeof(v9) == "RBXScriptConnection" then
                v9:Disconnect();
                return ;
            elseif typeof(v9) == "Instance" then
                v9:Destroy();
                return ;
            elseif not v9.destroy then
                if v9.Destroy then
                    v9:Destroy();
                end;
            else
                v9:destroy();
                return ;
            end;
        end;
        return ;
    end;
end;
v0.add = function(v11, v12)
    if not v12 then
        error("Task cannot be false or nil", 2);
    end;
    v11[#v11._tasks + 1] = v12;
    if not ((not (type(v12) == "table") or v12.destroy) or v12.Destroy) then
        warn("[Maid.giveTask] - Gave table task without .Destroy\n\n" .. debug.traceback());
    end;
    return v12;
end;
v0.giveTask = function(v13, v14)
    if not v14 then
        error("Task cannot be false or nil", 2);
    end;
    local v15 = #v13._tasks + 1;
    v13[v15] = v14;
    if not ((not (type(v14) == "table") or v14.destroy) or v14.Destroy) then
        warn("[Maid.giveTask] - Gave table task without .Destroy\n\n" .. debug.traceback());
    end;
    return v15;
end;
v0.destroy = function(v16)
    local l__tasks_1 = v16._tasks;
    for v18, v19 in l__tasks_1, nil, nil do
        if typeof(v19) == "RBXScriptConnection" then
            l__tasks_1[v18] = nil;
            v19:Disconnect();
        end;
    end;
    local v20, v21 = next(l__tasks_1);
    while v21 ~= nil do
        l__tasks_1[v20] = nil;
        if type(v21) == "function" then
            v21();
        elseif type(v21) == "thread" then
            local v22 = nil;
            if coroutine.running() ~= v21 then
                v22 = pcall(function()
                    task.cancel(v21);
                end);
            end;
            if not v22 then
                local l_v21_0 = v21;
                local l_l_v21_0_0 = l_v21_0 --[[ copy: 5 -> 7 ]];
                task.defer(function()
                    task.cancel(l_l_v21_0_0);
                end);
            end;
        elseif typeof(v21) == "RBXScriptConnection" then
            v21:Disconnect();
        elseif typeof(v21) == "Instance" then
            v21:Destroy();
        elseif not v21.destroy then
            if v21.Destroy then
                v21:Destroy();
            end;
        else
            v21:destroy();
        end;
        local v25, v26 = next(l__tasks_1);
        v20 = v25;
        v21 = v26;
    end;
end;
return v0;
