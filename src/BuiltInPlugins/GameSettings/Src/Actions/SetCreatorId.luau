return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "number", script.Name .. " requires creatorId to be a number, not " .. typeof(v0));
    return {
        creatorId = v0
    };
end);
