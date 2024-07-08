local l_Parent_0 = script.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local _ = require(l_Parent_0.Core.Types.HomeTypes);
return l_Action_0(script.Name, function(v3, v4)
    return {
        assetType = v3, 
        configuration = v4
    };
end);
