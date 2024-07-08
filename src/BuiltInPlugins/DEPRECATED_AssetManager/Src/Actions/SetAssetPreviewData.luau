return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "table", string.format("SetAssetPreviewData requires a table, not %s", (type(v0))));
    return {
        assetPreviewData = v0
    };
end);
