return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "string", ("Expected pivot to be a string, received %s"):format((type(v0))));
    return {
        pivot = v0
    };
end);
