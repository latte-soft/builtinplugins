return require(script.Parent.Parent.Parent.Src.Actions.Action)(script.Name, function(v0)
    assert(type(v0) == "table", string.format("assetData arg must be a table, received %s", (tostring(v0))));
    return {
        assetGroupData = v0
    };
end);
