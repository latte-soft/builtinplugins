return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    local v1 = false;
    if typeof(v0) == "Instance" then
        v1 = v0:IsA("DataModel");
    end;
    assert(v1, string.format(script.Name .. " requires game to be a DataModel, not %s", (typeof(v0))));
    return {
        game = v0
    };
end);
