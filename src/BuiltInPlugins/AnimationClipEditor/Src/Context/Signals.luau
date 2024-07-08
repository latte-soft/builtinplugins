local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.DraggerFramework.Utility.Signal);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.ContextItem:extend("Signals");
v2.new = function(v3)
    local v4 = {
        signals = v2:__mapSignalIDs(v3)
    };
    setmetatable(v4, v2);
    return v4;
end;
v2.__mapSignalIDs = function(_, v6)
    local v7 = {};
    for _, v9 in pairs(v6) do
        assert(v7[v9] == nil, "Duplicate action, ID: " .. v9);
        v7[v9] = v1.new();
    end;
    return v7;
end;
v2.get = function(v10, v11)
    return v10.signals[v11];
end;
return v2;
