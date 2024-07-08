return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0, v1)
    assert(type(v0) == "boolean", "Expected enabled to be a boolean");
    local v2 = true;
    if type(v1) ~= "table" then
        v2 = v1 == nil;
    end;
    assert(v2, "Expected reason to be a table or nil");
    return {
        alignEnabled = v0, 
        disabledReason = v1 or {}
    };
end);
