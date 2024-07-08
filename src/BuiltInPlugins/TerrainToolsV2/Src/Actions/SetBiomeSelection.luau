return require(script.Parent.Action)(script.Name, function(v0, v1)
    assert(type(v0) == "string", ("Expected biome to be a string, received %s"):format((type(v0))));
    assert(type(v1) == "boolean", ("Expected value to be a boolean, received %s"):format((type(v1))));
    return {
        newBiomeUpdate = {
            [v0] = v1
        }
    };
end);
