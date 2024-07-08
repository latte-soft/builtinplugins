local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v2, v3)
    return {
        Material = v2, 
        MaterialStatus = v3
    };
end);
