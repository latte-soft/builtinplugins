return require(script:FindFirstAncestor("R15Migrator").Packages.Framework).Util.Action(script.Name, function(v0, v1)
    return {
        characterInfo = v0, 
        isConverted = v1
    };
end);
