return require(script:FindFirstAncestor("R15Migrator").Packages.Framework).Util.Action(script.Name, function(v0, v1)
    return {
        characters = v0, 
        convertedCharacters = v1
    };
end);
