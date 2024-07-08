local l_Parent_0 = script.Parent.Parent.Parent;
local l_ContextItem_0 = require(l_Parent_0.Packages.Framework).ContextServices.ContextItem;
local v2 = require(l_Parent_0.Src.ContextServices.NetworkingImpl);
local v3 = l_ContextItem_0:extend(script.Name);
v3.new = function(...)
    return (setmetatable({
        impl = v2.new(...)
    }, v3));
end;
v3.get = function(v4)
    return v4.impl;
end;
return v3;
