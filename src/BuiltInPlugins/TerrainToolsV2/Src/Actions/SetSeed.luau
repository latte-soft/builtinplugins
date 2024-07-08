return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "string", ("Expected seed to be a string, received %s"):format((type(v0))));
    return {
        seed = v0
    };
end);
