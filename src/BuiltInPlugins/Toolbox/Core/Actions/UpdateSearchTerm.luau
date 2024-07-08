return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "string", "searchTerm must be a string");
    return {
        searchTerm = v0
    };
end);
