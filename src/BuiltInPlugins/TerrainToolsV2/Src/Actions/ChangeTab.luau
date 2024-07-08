return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "string", ("Expected tabName to be a string, received %s"):format((type(v0))));
    return {
        tabName = v0
    };
end);
