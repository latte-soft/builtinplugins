local v0 = require(script:FindFirstAncestor("CompositorDebugger").Packages.Framework);
local l_None_0 = v0.Dash.None;
return v0.Util.Action(script.Name, function(v2)
    return {
        event = v2 or l_None_0
    };
end);
