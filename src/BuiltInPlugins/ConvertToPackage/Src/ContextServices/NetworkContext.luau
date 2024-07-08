local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextItem_0 = require(l_Parent_0.Packages.Framework).ContextServices.ContextItem;
local v3 = require(l_Parent_0.Src.Util.Symbol).named("NetworkInterface");
local v4 = v1.PureComponent:extend("NetworkContext");
v4.init = function(v5, v6)
    v5._context[v3] = v6.networkInterface;
end;
v4.render = function(v7)
    return v1.oneChild(v7.props[v1.Children]);
end;
return l_ContextItem_0:createSimple("Network");
