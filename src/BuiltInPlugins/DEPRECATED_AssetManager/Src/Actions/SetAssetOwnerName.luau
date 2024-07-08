return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0, v1)
    assert(type(v0) == "number", string.format("SetAssetOwnerName requires assetId to be a string, not %s", (type(v0))));
    assert(type(v1) == "string", string.format("SetAssetOwnerName requires username to be a string, not %s", (type(v1))));
    return {
        assetId = v0, 
        username = v1
    };
end);
