return require(script:FindFirstAncestor("AssetImporter").Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "table", "checked should be a table");
    return {
        checked = v0
    };
end);
