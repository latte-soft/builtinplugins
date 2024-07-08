local l_Parent_0 = script.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local v2 = require(l_Parent_0.Src.Util.View);
return l_Action_0(script.Name, function(v3)
    assert(typeof(v3) == "table", string.format("SetView requires a table, not %s", (typeof(v3))));
    assert(v2[v3.Key] ~= nil, string.format("Invalid SetView: %s does not exist", v3.Key));
    return {
        view = v3
    };
end);
