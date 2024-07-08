return require(script.Parent.Parent.Parent.Packages.Action)(script.Name, function(v0, v1, v2, v3, v4, v5)
    assert(type(v0) == "string", "Expected pluginId to be a string");
    assert(type(v1) == "string", "Expected name to be a string");
    assert(type(v2) == "string", "Expected description to be a string");
    assert(type(v3) == "string", "Expected versionId to be a string");
    assert(type(v4) == "string", "Expected created to be a string");
    assert(type(v5) == "string", "Expected updated to be a string");
    return {
        pluginId = v0, 
        name = v1, 
        description = v2, 
        versionId = v3, 
        created = v4, 
        updated = v5
    };
end);
