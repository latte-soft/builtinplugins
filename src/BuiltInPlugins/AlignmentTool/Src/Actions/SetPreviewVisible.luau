return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "boolean", "Expected visible to be a boolean");
    return {
        visible = v0
    };
end);
