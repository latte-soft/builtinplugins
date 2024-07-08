return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0, v1)
    assert(typeof(v0) == "table", "UpdateOverrideAssetData resultsArray parameter must be a table");
    assert(typeof(v1) == "boolean", "UpdateOverrideAssetData fetchedAll parameter must be a boolean");
    return {
        resultsArray = v0, 
        fetchedAll = v1
    };
end);
