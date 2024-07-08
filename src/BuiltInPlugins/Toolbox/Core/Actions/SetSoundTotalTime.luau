return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "number", "Expected totalTime to be a number");
    return {
        totalTime = v0
    };
end);
