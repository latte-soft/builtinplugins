local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Dash);
local l_SplitPane_0 = v2.UI.SplitPane;
return v1.memo(function(v5)
    local v6, v7 = v1.useState(v5.InitialSizes);
    return v1.createElement(l_SplitPane_0, v3.join({
        Sizes = v6, 
        OnSizesChange = v7, 
        MinSizes = v5.MinSizes
    }, v5));
end);
