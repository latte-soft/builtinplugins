local v0 = {};
v0.__index = v0;
v0.new = function()
    local v1 = {};
    setmetatable(v1, v0);
    v1.eventCount = 0;
    v1.lastEvent = nil;
    v1.SendEventDeferred = function(v2, v3, v4, v5, v6)
        local v7 = {
            target = v3, 
            ctx = v4, 
            evt = v5
        };
        assert(type(v6) == "table", "expected table, argsTable was " .. type(v6));
        for v8, v9 in pairs(v6) do
            if v7[v8] ~= nil then
                warn("overriding base keyword " .. v8 .. "in via argsTable in SendEventDeferred().");
            end;
            v7[v8] = v9;
        end;
        v2.lastEvent = v7;
        v2.eventCount = v2.eventCount + 1;
    end;
    return v1;
end;
return v0;
