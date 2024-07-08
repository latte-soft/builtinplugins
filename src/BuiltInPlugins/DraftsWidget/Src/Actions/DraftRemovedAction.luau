return require(script.Parent.Action)(script.Name, function(v0)
    local v1 = typeof(v0);
    assert(v1 == "Instance", "Expected draft to be Instance. Got '" .. v1 .. "'");
    assert(v0:IsA("LuaSourceContainer"), "Expected draft to be a LuaSourceContainer. Got '" .. v0.ClassName .. "'");
    return {
        Draft = v0
    };
end);
