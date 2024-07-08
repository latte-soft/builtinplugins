return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "string", string.format("SetSearchTerm requires a string, not %s", (type(v0))));
    return {
        searchTerm = v0
    };
end);
