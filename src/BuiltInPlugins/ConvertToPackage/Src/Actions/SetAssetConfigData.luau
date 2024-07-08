return require(script.Parent.Parent.Parent.Src.Actions.Action)(script.Name, function(v0)
    assert(type(v0) == "table", string.format("assetData must be a table, received %s", (type(v0))));
    return {
        assetConfigData = v0
    };
end);
