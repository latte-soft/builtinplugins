local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v2)
    assert(type(v2) == "number", ("Expected material to be a number, received %s"):format((type(v2))));
    return {
        MaterialTileSize = v2
    };
end);
