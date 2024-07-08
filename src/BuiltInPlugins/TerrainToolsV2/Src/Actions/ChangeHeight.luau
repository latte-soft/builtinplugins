return require(script.Parent.Action)(script.Name, function(v0)
    local v1 = tonumber(v0);
    assert(v1, ("Expected height to be a number, received %s"):format((type(v0))));
    return {
        height = v1
    };
end);
