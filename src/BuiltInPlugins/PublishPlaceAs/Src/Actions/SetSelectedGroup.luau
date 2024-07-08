local v0 = require(script.Parent.Parent.Parent.Src.Util.AssertType);
return require(script.Parent.Action)(script.Name, function(v1)
    v0.assertNullableType(v1, "number", "SetSelectedGroup arg");
    return {
        selectedGroup = v1
    };
end);
