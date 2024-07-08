local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v2)
    assert(type(v2) == "table", ("Expected materialBrowserLayout to be a table, received %s"):format((type(v2))));
    return {
        MaterialBrowserLayout = v2
    };
end);
