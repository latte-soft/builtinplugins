return require(script:FindFirstAncestor("Toolbox").Packages.Framework).Util.Action(script.Name, function(v0, v1)
    return {
        assetId = v0, 
        assetData = v1
    };
end);
