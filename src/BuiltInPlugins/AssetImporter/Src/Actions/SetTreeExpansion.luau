return require(script:FindFirstAncestor("AssetImporter").Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "table", "expansion should be a table");
    return {
        expansion = v0
    };
end);
