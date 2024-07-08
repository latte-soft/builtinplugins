local v0 = nil;
local function v3(v1, ...)
    local l_v0_0 = v0;
    v0 = nil;
    v1(...);
    v0 = l_v0_0;
end;
local function v4()
    while true do
        v3(coroutine.yield());
    end;
end;
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7)
    return (setmetatable({
        _connected = true, 
        _signal = v6, 
        _fn = v7, 
        _next = false
    }, v5));
end;
v5.Disconnect = function(v8)
    v8._connected = false;
    if v8._signal._handlerListHead == v8 then
        v8._signal._handlerListHead = v8._next;
        return ;
    else
        local l__handlerListHead_0 = v8._signal._handlerListHead;
        while l__handlerListHead_0 and l__handlerListHead_0._next ~= v8 do
            l__handlerListHead_0 = l__handlerListHead_0._next;
        end;
        if l__handlerListHead_0 then
            l__handlerListHead_0._next = v8._next;
        end;
        return ;
    end;
end;
v5.Destroy = v5.Disconnect;
v5.destroy = v5.Disconnect;
setmetatable(v5, {
    __index = function(_, v11)
        error(("Attempt to get Connection::%s (not a valid member)"):format((tostring(v11))), 2);
    end, 
    __newindex = function(_, v13, _)
        error(("Attempt to set Connection::%s (not a valid member)"):format((tostring(v13))), 2);
    end
});
local v15 = {};
v15.__index = v15;
v15.new = function()
    return (setmetatable({
        _handlerListHead = false
    }, v15));
end;
v15.isSignal = function(v16)
    local v17 = false;
    if type(v16) == "table" then
        v17 = getmetatable(v16) == v15;
    end;
    return v17;
end;
v15.Connect = function(v18, v19)
    local v20 = v5.new(v18, v19);
    if not v18._handlerListHead then
        v18._handlerListHead = v20;
        return v20;
    else
        v20._next = v18._handlerListHead;
        v18._handlerListHead = v20;
        return v20;
    end;
end;
v15.DisconnectAll = function(v21)
    v21._handlerListHead = false;
end;
v15.Fire = function(v22, ...)
    local l__handlerListHead_1 = v22._handlerListHead;
    while l__handlerListHead_1 do
        if l__handlerListHead_1._connected then
            if not v0 then
                v0 = coroutine.create(v4);
                coroutine.resume(v0);
            end;
            task.spawn(v0, l__handlerListHead_1._fn, ...);
        end;
        l__handlerListHead_1 = l__handlerListHead_1._next;
    end;
end;
v15.Wait = function(v24)
    local v25 = coroutine.running();
    local v26 = nil;
    v26 = v24:Connect(function(...)
        v26:Disconnect();
        task.spawn(v25, ...);
    end);
    return coroutine.yield();
end;
v15.Once = function(v27, v28)
    local v29 = nil;
    v29 = v27:Connect(function(...)
        if v29._connected then
            v29:Disconnect();
        end;
        v28(...);
    end);
    return v29;
end;
v15.Destroy = v15.DisconnectAll;
v15.destroy = v15.DisconnectAll;
setmetatable(v15, {
    __index = function(_, v31)
        error(("Attempt to get Signal::%s (not a valid member)"):format((tostring(v31))), 2);
    end, 
    __newindex = function(_, v33, _)
        error(("Attempt to set Signal::%s (not a valid member)"):format((tostring(v33))), 2);
    end
});
return v15;
