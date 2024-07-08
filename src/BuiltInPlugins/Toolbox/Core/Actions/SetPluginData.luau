return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "table", "pluginData must be a table");
    assert(next(v0) ~= nil, "pluginData can't be an empty table");
    return {
        pluginData = v0
    };
end);
