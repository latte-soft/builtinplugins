local _ = require(script.Parent.Breakpoint);
local v1 = {};
v1.__index = v1;
v1.SetBreakpointHit = function(v2, v3)
    v2.Breakpoint = v3;
end;
v1.new = function(v4, v5, v6)
    local v7 = {
        Reason = v4, 
        ThreadId = v5, 
        AllThreadsPaused = v6
    };
    setmetatable(v7, v1);
    return v7;
end;
return v1;
