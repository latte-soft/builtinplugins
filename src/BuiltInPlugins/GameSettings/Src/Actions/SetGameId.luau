return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "number", string.format(script.Name .. " requires gameId to be a number, not %s", (typeof(v0))));
    return {
        gameId = v0
    };
end);
