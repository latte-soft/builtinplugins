return require(script:FindFirstAncestor("Toolbox").Packages.Framework).Util.Action(script.Name, function(v0, v1, v2)
    return {
        assetIds = v0, 
        positionOverride = v1, 
        scriptWarningOverride = v2
    };
end);
