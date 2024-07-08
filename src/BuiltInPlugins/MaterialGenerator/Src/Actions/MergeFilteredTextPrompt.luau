return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0, v1)
    assert(type(v0) == "string", "Bad original");
    assert(type(v1) == "string", "Bad filteredText");
    return {
        original = v0, 
        filteredText = v1
    };
end);
