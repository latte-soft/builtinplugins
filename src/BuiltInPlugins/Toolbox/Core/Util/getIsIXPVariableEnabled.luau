local v0 = require(script:FindFirstAncestor("Toolbox").Core.Util.DebugFlags);
return function(v1, v2, v3)
    if v1 then
        if v1:isReady() then
            local v4 = v1:getVariables()[v2];
            if not v4 or not v4[v3] then
                return false;
            else
                return true;
            end;
        else
            return nil;
        end;
    else
        if v0.shouldDebugWarnings() then
            warn("ixp was undefined");
        end;
        return nil;
    end;
end;
