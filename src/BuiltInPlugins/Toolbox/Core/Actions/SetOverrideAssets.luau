return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "table", "SetOverrideAssets resultsArray must be a table");
    return {
        resultsArray = v0
    };
end);
