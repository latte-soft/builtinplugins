return require(script.Parent.Action)(script.Name, function(v0)
    local v1 = typeof(v0);
    assert(v1 == "table", "Expected draft to be table. Got '" .. v1 .. "'");
    for v2, v3 in ipairs(v0) do
        local v4 = typeof(v3);
        local v5 = false;
        if v4 == "Instance" then
            v5 = v3:IsA("LuaSourceContainer");
        end;
        assert(v5, "Expected drafts[" .. v2 .. "] to be a LuaSourceContainer. Got '" .. (v4 == "Instance" and v3.ClassName or v4) .. "'");
    end;
    return {
        Drafts = v0
    };
end);
