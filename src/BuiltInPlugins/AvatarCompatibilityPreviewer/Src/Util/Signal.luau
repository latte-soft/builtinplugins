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
v15.Connect = function(v16, v17)
    local v18 = v5.new(v16, v17);
    if not v16._handlerListHead then
        v16._handlerListHead = v18;
        return v18;
    else
        v18._next = v16._handlerListHead;
        v16._handlerListHead = v18;
        return v18;
    end;
end;
v15.DisconnectAll = function(v19)
    v19._handlerListHead = false;
end;
v15.Fire = function(v20, ...)
    local l__handlerListHead_1 = v20._handlerListHead;
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
v15.Wait = function(v22)
    local v23 = coroutine.running();
    local v24 = nil;
    v24 = v22:Connect(function(...)
        v24:Disconnect();
        task.spawn(v23, ...);
    end);
    return coroutine.yield();
end;
v15.Once = function(v25, v26)
    local v27 = nil;
    v27 = v25:Connect(function(...)
        if v27._connected then
            v27:Disconnect();
        end;
        v26(...);
    end);
    return v27;
end;
setmetatable(v15, {
    __index = function(_, v29)
        error(("Attempt to get Signal::%s (not a valid member)"):format((tostring(v29))), 2);
    end, 
    __newindex = function(_, v31, _)
        error(("Attempt to set Signal::%s (not a valid member)"):format((tostring(v31))), 2);
    end
});
return v15;
