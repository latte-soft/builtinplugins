return function(v0, v1)
    local v2 = nil;
    local v3 = false;
    local v4 = nil;
    return function(...)
        v2 = {
            ...
        };
        if v3 then
            if v4 ~= nil and coroutine.status(v4) == "suspended" then
                task.cancel(v4);
            end;
            v3 = false;
        end;
        if not v3 then
            v3 = true;
            v4 = task.delay(v1, function()
                v3 = false;
                v0(unpack(v2));
            end);
        end;
    end;
end;
