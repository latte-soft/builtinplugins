return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "table", string.format("SetAssetsModerationData requires a table, not %s", (type(v0))));
    return {
        assetsModerationData = v0
    };
end);
