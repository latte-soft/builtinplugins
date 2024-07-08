return require(script.Parent.Action)(script.Name, function(v0, v1)
    assert(type(v0) == "string", ("Expected toolName to be a string, received %s"):format((type(v0))));
    assert(type(v1) == "table", ("Expected toolAction to be a table, received %s"):format((type(v1))));
    return {
        toolName = v0, 
        toolAction = v1
    };
end);
