return require(script:FindFirstAncestor("AssetImporter").Packages.Framework).Util.Action(script.Name, function(v0)
    return {
        hasInvalidPackageId = v0
    };
end);
