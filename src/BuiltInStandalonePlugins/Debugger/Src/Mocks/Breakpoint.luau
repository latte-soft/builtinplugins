local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    if v1.Enabled == nil then
        v1.Enabled = true;
    end;
    if v1.ContinueExecution == nil then
        v1.ContinueExecution = false;
    end;
    if v1.Verified == nil then
        v1.Verified = true;
    end;
    if v1.Id == nil then
        v1.Id = 1;
    end;
    if v1.RemoveOnHit == nil then
        v1.RemoveOnHit = false;
    end;
    local v2 = {
        Id = v1.Id, 
        Enabled = v1.Enabled, 
        Line = v1.Line or 1, 
        Script = v1.Script or "1234-5678-9ABC", 
        Condition = v1.Condition or "varNum" .. tostring(v1.Id) .. " == 0", 
        LogMessage = v1.LogMessage or "varNum" .. tostring(v1.Id), 
        ContinueExecution = v1.ContinueExecution, 
        Verified = v1.Verified, 
        MetaBreakpointId = v1.MetaBreakpointId or 6, 
        RemoveOnHit = v1.RemoveOnHit
    };
    setmetatable(v2, v0);
    return v2;
end;
return v0;
