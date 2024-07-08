return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "boolean", ("Expected haveCaves to be a boolean, received %s"):format((type(v0))));
    return {
        haveCaves = v0
    };
end);
