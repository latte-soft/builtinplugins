return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "table", script.Name .. " requires friends to be a table, not " .. typeof(v0));
    for _, v2 in ipairs(v0) do
        assert(typeof(v2) == "number", script.Name .. " requires a table of numbers for friends, not " .. typeof(v2));
    end;
    return {
        creatorFriends = v0
    };
end);
