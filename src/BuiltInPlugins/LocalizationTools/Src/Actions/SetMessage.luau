return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "string", "Expected message to be a string");
    return {
        message = v0
    };
end);
