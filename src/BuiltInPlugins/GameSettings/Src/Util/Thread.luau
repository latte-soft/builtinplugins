local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    return (setmetatable({
        __running = false, 
        __finished = false, 
        __success = nil, 
        __results = nil, 
        __callback = v1, 
        __event = Instance.new("BindableEvent")
    }, v0));
end;
v0.start = function(v2, ...)
    if not v2.__running and not v2.__finished then
        v2.__running = true;
        local v3 = {
            ...
        };
        coroutine.wrap(function()
            local v4 = {
                pcall(v2.__callback, unpack(v3))
            };
            v2.__success = v4[1];
            v2.__results = table.move(v4, 2, #v4, 1, {});
            v2.__running = false;
            v2.__finished = true;
            v2.__event:Fire();
        end)();
        if not (not v2.__finished or v2.__success) then
            error(v2.__results[1], 2);
        end;
        return ;
    else
        return ;
    end;
end;
v0.join = function(v5)
    if not (v5.__finished or v5.__running) then
        error("Attempt to join on unstarted thread", 2);
    end;
    if not v5.__finished then
        v5.__event.Event:Wait();
    end;
    if not v5.__success then
        error(v5.__results[1], 2);
        return ;
    else
        return unpack(v5.__results);
    end;
end;
v0.isAlive = function(v6)
    return v6.__running;
end;
return v0;
