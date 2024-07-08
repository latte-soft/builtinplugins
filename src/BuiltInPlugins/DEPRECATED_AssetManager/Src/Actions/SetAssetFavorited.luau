return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0, v1)
    assert(type(v0) == "number", string.format("SetAssetFavorited requires assetId to be a number, not %s", (type(v0))));
    assert(type(v1) == "boolean", string.format("SetAssetFavorited requires isAssetFavorited to be a boolean, not %s", (type(v1))));
    return {
        assetId = v0, 
        isAssetFavorited = v1
    };
end);
