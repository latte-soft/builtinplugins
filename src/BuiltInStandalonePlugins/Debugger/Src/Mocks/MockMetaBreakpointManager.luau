local l_Signal_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Signal;
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {};
    setmetatable(v2, v1);
    v2.MetaBreakpointAdded = l_Signal_0.new();
    v2.MetaBreakpointAdded:Connect(function(v3)
        v2.MockMetaBreakpointsById[v3.Id] = v3;
    end);
    v2.MetaBreakpointChanged = l_Signal_0.new();
    v2.MetaBreakpointSetChanged = l_Signal_0.new();
    v2.MetaBreakpointRemoved = l_Signal_0.new();
    v2.MockMetaBreakpointsById = {};
    v2.MockSetMetaBreakpointById = function(v4, v5)
        v2.MockMetaBreakpointsById[v4] = v5;
    end;
    v2.deletedBreakpoints = {};
    return v2;
end;
v1.RemoveBreakpointById = function(v6, v7)
    v6.deletedBreakpoints[v7] = true;
end;
v1.GetBreakpointById = function(v8, v9)
    return v8.MockMetaBreakpointsById[v9];
end;
return v1;
