return require(script:FindFirstAncestor("FileSync").Packages.Framework).Util.Action(script.Name, function(v0)
    return {
        lastOperation = v0
    };
end);
