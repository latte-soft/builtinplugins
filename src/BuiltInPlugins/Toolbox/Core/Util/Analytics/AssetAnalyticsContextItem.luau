local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_ContextItem_0 = require(l_Parent_0.Packages.Framework).ContextServices.ContextItem;
local v2 = require(l_Parent_0.Core.Util.Analytics.AssetAnalytics);
local v3 = l_ContextItem_0:extend("AssetAnalytics");
v3.new = function(v4)
    local v5 = {
        assetAnalytics = v4 or v2.new()
    };
    setmetatable(v5, v3);
    return v5;
end;
v3.get = function(v6)
    return v6.assetAnalytics;
end;
return v3;
