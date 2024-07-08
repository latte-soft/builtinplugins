local v0 = {};
v0.__index = v0;
v0.SetEnabled = function(v1, v2)
    v1.Enabled = v2;
    if v1.mockMetaBreakpointManager then
        v1.mockMetaBreakpointManager.MetaBreakpointChanged:Fire(v1);
    end;
end;
v0.SetContinueExecution = function(v3, v4)
    v3.ContinueExecution = v4;
    if v3.mockMetaBreakpointManager then
        v3.mockMetaBreakpointManager.MetaBreakpointChanged:Fire(v3);
    end;
end;
v0.SetRemoveOnHit = function(v5, v6)
    v5.RemoveOnHit = v6;
    if v5.mockMetaBreakpointManager then
        v5.mockMetaBreakpointManager.MetaBreakpointChanged:Fire(v5);
    end;
end;
v0.SetMockMetaBreakpointManager = function(v7, v8)
    v7.mockMetaBreakpointManager = v8;
end;
v0.GetContextBreakpoints = function(_)
    return {};
end;
v0.new = function(v10)
    if v10.Enabled == nil then
        v10.Enabled = true;
    end;
    if v10.ContinueExecution == nil then
        v10.ContinueExecution = false;
    end;
    if v10.IsLogpoint == nil then
        v10.IsLogpoint = false;
    end;
    if v10.RemoveOnHit == nil then
        v10.RemoveOnHit = false;
    end;
    local v11 = {
        Script = v10.Script or "1234-5678-9ABC", 
        Line = v10.Line or 1, 
        Condition = v10.Condition or "", 
        Id = v10.Id or 1, 
        LogMessage = v10.LogMessage or "", 
        Enabled = v10.Enabled, 
        ContinueExecution = v10.ContinueExecution, 
        IsLogpoint = v10.IsLogpoint, 
        RemoveOnHit = v10.RemoveOnHit
    };
    setmetatable(v11, v0);
    return v11;
end;
return v0;
