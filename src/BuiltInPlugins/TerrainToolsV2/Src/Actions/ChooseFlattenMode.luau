return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "string", ("Expected flattenMode to be a string, received %s"):format((type(v0))));
    return {
        flattenMode = v0
    };
end);
