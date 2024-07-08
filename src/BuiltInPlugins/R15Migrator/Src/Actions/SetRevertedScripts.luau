return require(script:FindFirstAncestor("R15Migrator").Packages.Framework).Util.Action(script.Name, function(v0)
    return {
        revertedScripts = v0
    };
end);
