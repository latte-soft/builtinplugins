return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "number", string.format("SetAssets requires a number, not %s", (type(v0))));
    return {
        editPlaceId = v0
    };
end);
