return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "string", ("Expected brushShape to be a string, received %s"):format((type(v0))));
    return {
        brushShape = v0
    };
end);
