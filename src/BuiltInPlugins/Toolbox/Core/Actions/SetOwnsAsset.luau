return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0, v1)
    assert(type(v0) == "boolean", "SetOwnsAsset expects a boolean.");
    assert(type(v1) == "number", "SetOwnsAsset expects an asset id.");
    return {
        ownsAsset = v0, 
        assetId = v1
    };
end);
