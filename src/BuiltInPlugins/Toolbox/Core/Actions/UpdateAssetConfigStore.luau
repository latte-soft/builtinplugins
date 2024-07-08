return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "table", "storeData has to be a table.");
    assert(next(v0) ~= nil, "storeData can't be an empty table.");
    return {
        storeData = v0
    };
end);
