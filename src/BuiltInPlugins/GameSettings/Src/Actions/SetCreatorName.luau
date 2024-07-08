return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "string", script.Name .. " requires creatorName to be a string, not " .. typeof(v0));
    return {
        creatorName = v0
    };
end);
