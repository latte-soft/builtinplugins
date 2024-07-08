return require(script:FindFirstAncestor("Toolbox").Packages.Framework).Util.Action(script.Name, function(v0, v1)
    return {
        creatingUniverseName = v0, 
        creatingUniverseRootPlaceId = v1
    };
end);
