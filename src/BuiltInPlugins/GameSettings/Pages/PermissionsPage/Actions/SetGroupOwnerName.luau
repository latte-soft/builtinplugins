return require(script.Parent.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "string", script.Name .. " expected groupOwnerName to be a string, not " .. typeof(v0));
    return {
        groupOwnerName = v0
    };
end);
