return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "table", "Expected objects to be a table");
    return {
        alignableObjects = v0 or {}
    };
end);
