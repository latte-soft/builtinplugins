return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "boolean", string.format("SetRecentViewToggled requires a boolean, not %s", (type(v0))));
    return {
        recentViewToggled = v0
    };
end);
