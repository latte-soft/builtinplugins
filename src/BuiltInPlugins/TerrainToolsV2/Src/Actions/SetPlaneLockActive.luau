return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "boolean", ("Expected planeLockActive to be a boolean, received %s"):format((type(v0))));
    return {
        planeLockActive = v0
    };
end);
