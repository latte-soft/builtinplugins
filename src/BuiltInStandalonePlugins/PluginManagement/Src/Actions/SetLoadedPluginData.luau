return require(script.Parent.Parent.Parent.Packages.Action)(script.Name, function(v0)
    assert(type(v0) == "table", "Expected pluginData to be a table.");
    if next(v0) ~= nil then
        assert(type((next(v0))) == "number", "Expected pluginData to be a map.");
    end;
    return {
        pluginData = v0
    };
end);
