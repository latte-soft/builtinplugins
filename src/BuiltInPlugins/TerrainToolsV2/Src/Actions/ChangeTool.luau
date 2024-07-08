return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "string", ("Expected currentTool to be a string, received %s"):format((type(v0))));
    return {
        currentTool = v0
    };
end);
