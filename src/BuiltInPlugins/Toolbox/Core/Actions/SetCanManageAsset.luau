return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0, v1)
    assert(type(v0) == "boolean", "SetCanManageAsset expects a boolean.");
    assert(type(v1) == "number", "SetCanManageAsset expects an asset id.");
    return {
        canManage = v0, 
        assetId = v1
    };
end);
