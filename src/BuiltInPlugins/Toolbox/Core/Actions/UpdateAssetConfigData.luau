return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "table", "assetData has to be a table.");
    assert(next(v0) ~= nil, "assetData can't be an empty table.");
    return {
        assetConfigData = v0
    };
end);
