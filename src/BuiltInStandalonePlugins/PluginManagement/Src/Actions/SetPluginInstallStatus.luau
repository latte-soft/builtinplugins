return require(script.Parent.Parent.Parent.Packages.Action)(script.Name, function(v0, v1, v2)
    assert(type(v0) == "string", "Expected pluginId to be a string");
    assert(type(v1) == "number", "Expected statusCode to be a number");
    assert(type(v2) == "string", "Expected message to be a string");
    return {
        pluginId = v0, 
        statusCode = v1, 
        message = v2
    };
end);
