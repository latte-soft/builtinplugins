local l_Parent_0 = script.Parent.Parent;
local l_ContextItem_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).ContextServices.ContextItem;
local v2 = require(l_Parent_0.Controllers.WorldRootPhysicsController);
local v3 = l_ContextItem_0:extend(script.Name);
v3.new = function(...)
    local v4 = {
        impl = v2.new(...)
    };
    setmetatable(v4, v3);
    return v4;
end;
v3.get = function(v5)
    return v5.impl;
end;
return v3;
