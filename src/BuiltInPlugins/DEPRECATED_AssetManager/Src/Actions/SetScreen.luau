local l_Parent_0 = script.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local v2 = require(l_Parent_0.Src.Util.Screens);
return l_Action_0(script.Name, function(v3)
    assert(typeof(v3) == "table", string.format("SetScreen requires a table, not %s", (typeof(v3))));
    assert(v2[v3.Path] ~= nil, string.format("Invalid SetScreen: %s does not exist", v3.Path));
    return {
        screen = v3
    };
end);
