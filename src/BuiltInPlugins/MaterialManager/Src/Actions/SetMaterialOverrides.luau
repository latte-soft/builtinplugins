local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v2, v3)
    assert(type(v3) == "table", ("Expected overrides to be a table, received %s"):format((type(v3))));
    return {
        Material = v2, 
        Overrides = v3
    };
end);
