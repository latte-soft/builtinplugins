return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "string", "Expected cloudTableId to be a string");
    return {
        cloudTableId = v0
    };
end);
