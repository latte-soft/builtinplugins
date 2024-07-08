return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    local v1 = true;
    if type(v0) ~= "number" then
        v1 = type(v0) == "nil";
    end;
    assert(v1, string.format("SetEditDevProductId requires a number or nil, not %s", (type(v0))));
    return {
        editDevProductId = v0
    };
end);
