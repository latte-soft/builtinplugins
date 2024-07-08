return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0, v1)
    assert(type(v0) == "number", string.format("IncrementAssetFavoriteCount requires assetId to be a number, not %s", (type(v0))));
    assert(type(v1) == "number", string.format("IncrementAssetFavoriteCount requires incrementCount to be a number, not %s", (type(v1))));
    return {
        assetId = v0, 
        incrementCount = v1
    };
end);
