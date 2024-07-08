local v0 = require(script:FindFirstAncestor("CompositorDebugger").Packages.Framework);
local _ = v0.Dash.None;
return v0.Util.Action(script.Name, function(v2, v3)
    return {
        layerFilters = {
            [v2] = v3
        }
    };
end);
