return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "table", string.format("SetRecentAssets requires a table, not %s", (type(v0))));
    return {
        recentAssets = v0
    };
end);
