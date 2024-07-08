local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v2, v3)
    assert(type(v3) == "number", ("Expected index to be a number, received %s"):format((type(v3))));
    return {
        Index = v3, 
        Material = v2
    };
end);
