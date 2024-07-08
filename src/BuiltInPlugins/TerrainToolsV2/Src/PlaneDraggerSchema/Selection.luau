local v0 = require(script.Parent.Parent.Parent.Packages.DraggerFramework.Utility.Signal);
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    local v3 = setmetatable({
        _CursorGrid = v2
    }, v1);
    v3.SelectionChanged = v0.new();
    return v3;
end;
v1.Set = function(_, _, _)
end;
v1.Get = function(v7)
    return {
        v7._CursorGrid
    };
end;
return v1;
