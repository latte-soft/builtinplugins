local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v2)
    assert(type(v2) == "boolean", ("Expected material to be a boolean, received %s"):format((type(v2))));
    return {
        Use2022Materials = v2
    };
end);
