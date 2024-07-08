local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.Action);
local v2 = require(l_Parent_0.Src.Resources.Constants);
return v1(script.Name, function(v3)
    assert(type(v3) == "string", string.format("SetScreen requires a string, not %s", (type(v3))));
    assert(v2.SCREENS[v3] ~= nil, string.format("Invalid SetScreen: %s does not exist", v3));
    return {
        screen = v3
    };
end);
