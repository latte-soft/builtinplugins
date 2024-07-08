local v0 = {};
v0.new = function()
    local v1 = {
        _tasks = {}
    };
    setmetatable(v1, v0);
    return v1;
end;
v0.__index = function(v2, v3)
    return v0[v3] or v2._tasks[v3];
end;
v0.__newindex = function(v4, v5, v6)
    if rawget(v4, v5) then
        error(string.format("Cannot use %q as a Maid key", (tostring(v5))));
    end;
    local l__tasks_0 = v4._tasks;
    local v8 = l__tasks_0[v5];
    if v8 == v6 then
        return ;
    else
        l__tasks_0[v5] = v6;
        if v8 then
            v0.cleanupTask(v8);
        end;
        return ;
    end;
end;
v0.give = function(v9, v10)
    local l__tasks_1 = v9._tasks;
    l__tasks_1[#l__tasks_1 + 1] = v10;
end;
v0.cleanupTask = function(v12)
    local v13 = typeof(v12);
    if v13 == "function" then
        v12();
        return ;
    elseif v13 == "RBXScriptConnection" then
        v12:Disconnect();
        return ;
    elseif not v12.Destroy then
        if not v12.destroy then
            error("Unable to cleanup unknown task");
            return ;
        else
            v12:destroy();
            return ;
        end;
    else
        v12:Destroy();
        return ;
    end;
end;
v0.clean = function(v14)
    local l__tasks_2 = v14._tasks;
    for v16, v17 in pairs(l__tasks_2) do
        if typeof(v17) == "RBXScriptConnection" then
            l__tasks_2[v16] = nil;
            v17:Disconnect();
        end;
    end;
    local v18, v19 = next(l__tasks_2);
    while v19 ~= nil do
        l__tasks_2[v18] = nil;
        v0.cleanupTask(v19);
        local v20, v21 = next(l__tasks_2);
        v18 = v20;
        v19 = v21;
    end;
end;
v0.destroy = v0.clean;
return v0;
