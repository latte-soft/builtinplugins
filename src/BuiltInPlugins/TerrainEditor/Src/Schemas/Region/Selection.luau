local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.DraggerFramework.Utility.Signal);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5)
    local v6 = setmetatable({
        _region = {
            Region = {
                transform = v4, 
                size = v5
            }
        }
    }, v3);
    v6.SelectionChanged = v1.new();
    return v6;
end;
v3.SetRegion = function(v7, v8)
    v7._region.Region = {
        size = v8.Size, 
        transform = v8.Transform
    };
end;
v3.SetRegionSignal = function(v9, v10)
    v9:SetRegion(v10);
    v9.SelectionChanged:Fire();
end;
v3.Set = function(_)
end;
v3.Get = function(v12)
    return {
        v12._region
    };
end;
return v3;
