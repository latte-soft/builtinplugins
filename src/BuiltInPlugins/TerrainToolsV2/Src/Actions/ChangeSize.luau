return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "table", ("Expected size to be a table, received %s"):format((type(v0))));
    local v1 = tonumber(v0.X);
    local v2 = tonumber(v0.Y);
    local v3 = tonumber(v0.Z);
    assert(v1, ("Expected size.X to be a number, received %s"):format((type(v0.x))));
    assert(v2, ("Expected size.Y to be a number, received %s"):format((type(v0.y))));
    assert(v3, ("Expected size.Z to be a number, received %s"):format((type(v0.z))));
    return {
        size = {
            X = v1, 
            Y = v2, 
            Z = v3
        }
    };
end);
