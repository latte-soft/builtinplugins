local v0 = require(script:FindFirstAncestor("TerrainEditor").Packages.DraggerFramework.Utility.Signal);
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    local v3 = setmetatable({
        _transform = {
            Transform = v2
        }
    }, v1);
    v3.SelectionChanged = v0.new();
    return v3;
end;
v1.SetTransform = function(v4, v5)
    v4._transform.Transform = v5;
end;
v1.SetTransformSignal = function(v6, v7)
    v6:SetTransform(v7);
    v6.SelectionChanged:Fire();
end;
v1.Set = function(_)
end;
v1.Get = function(v9)
    return {
        v9._transform
    };
end;
return v1;
