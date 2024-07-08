return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "string", string.format("Expected searchTerm to be a string, received %s", (type(v0))));
    return {
        searchTerm = v0
    };
end);
