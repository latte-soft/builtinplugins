return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "table", string.format("Expected args to be a table, received %s", (type(v0))));
    return {
        events = v0
    };
end);
