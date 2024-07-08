local v0 = require(script:FindFirstAncestor("Toolbox").Core.Util.DebugFlags);
return function()
    local v1 = -1;
    local l_status_0, l_result_0 = pcall(function()
        v1 = game.PlaceId;
    end);
    if not (l_status_0 or not v0.shouldDebugWarnings()) then
        warn(l_result_0);
    end;
    return v1;
end;
