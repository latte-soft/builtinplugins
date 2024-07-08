local v0 = require(script.Parent.Parent.Parent.Packages.DraggerFramework.Utility.Signal);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3)
    local v4 = setmetatable({
        _region = {
            Region = {
                transform = v2, 
                size = v3
            }
        }, 
        _signal = v0.new()
    }, v1);
    v4.SelectionChanged = v4._signal;
    return v4;
end;
v1.SetRegion = function(v5, v6)
    v5._region.Region = v6;
end;
v1.SetRegionWaypoint = function(v7, v8)
    v7._region.Region = v8;
    v7._signal:Fire();
end;
v1.Set = function(_)
end;
v1.Get = function(v10)
    return {
        v10._region
    };
end;
return v1;
