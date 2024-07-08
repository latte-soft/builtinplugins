local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return require(l_Parent_0.Src.Actions.Action)(script.Name, function(v2)
    assert(v2 ~= nil, "AddErrors argument cannot be nil");
    assert(v2 ~= v1.None, "AddErrors: Can't clear ALL errors by passing Cryo.None. Pass Cryo.None as a specific value");
    assert(type(v2) == "table", string.format("AddErrors argument must be a table, not %s", (type(v2))));
    return {
        errors = v2
    };
end);
