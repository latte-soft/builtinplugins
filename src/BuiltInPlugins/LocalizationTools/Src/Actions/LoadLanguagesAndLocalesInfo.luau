return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0, v1)
    assert(type(v0) == "table", "Expected allLanguages to be a table");
    assert(type(v1) == "table", "Expected localesToLanguages to be a table");
    return {
        allLanguages = v0, 
        localesToLanguages = v1
    };
end);
