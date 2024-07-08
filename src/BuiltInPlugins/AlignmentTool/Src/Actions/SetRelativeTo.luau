return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "string", "Expected relativeTo to be a string");
    return {
        relativeTo = v0
    };
end);
