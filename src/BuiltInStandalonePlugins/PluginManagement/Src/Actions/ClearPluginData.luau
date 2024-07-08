return require(script.Parent.Parent.Parent.Packages.Action)(script.Name, function(v0)
    assert(type(v0) == "string", "Expected pluginId to be a string");
    return {
        pluginId = v0
    };
end);
