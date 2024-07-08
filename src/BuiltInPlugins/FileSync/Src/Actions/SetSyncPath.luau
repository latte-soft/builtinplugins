return require(script:FindFirstAncestor("FileSync").Packages.Framework).Util.Action(script.Name, function(v0)
    return {
        syncPath = v0
    };
end);
