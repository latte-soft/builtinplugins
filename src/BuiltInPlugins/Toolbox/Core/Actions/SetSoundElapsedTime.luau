return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "number", "Expected elapsedTime to be a number");
    return {
        elapsedTime = v0
    };
end);
