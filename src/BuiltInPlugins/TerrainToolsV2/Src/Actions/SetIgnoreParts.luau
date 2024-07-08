return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "boolean", ("Expected ignoreParts to be a boolean, received %s"):format((type(v0))));
    return {
        ignoreParts = v0
    };
end);
