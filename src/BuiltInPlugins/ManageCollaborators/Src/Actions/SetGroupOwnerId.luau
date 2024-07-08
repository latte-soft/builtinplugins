return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "number", script.Name .. " expected groupOwnerId to be a number, not " .. typeof(v0));
    return {
        groupOwnerId = v0
    };
end);
