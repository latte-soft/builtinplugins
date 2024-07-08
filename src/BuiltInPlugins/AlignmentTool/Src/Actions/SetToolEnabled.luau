return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "boolean", "Expected enabled to be a boolean");
    return {
        toolEnabled = v0
    };
end);
