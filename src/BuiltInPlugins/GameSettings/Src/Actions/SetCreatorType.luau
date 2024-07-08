return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    local v1 = false;
    if typeof(v0) == "EnumItem" then
        v1 = v0.EnumType == Enum.CreatorType;
    end;
    assert(v1, script.Name .. " requires creatorType to be an Enum.CreatorType, not " .. typeof(v0));
    return {
        creatorType = v0
    };
end);
