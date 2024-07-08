local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2)
    local v3 = {
        arg = v1, 
        Status = v2
    };
    setmetatable(v3, v0);
    return v3;
end;
v0.GetArg = function(v4)
    return v4.arg;
end;
return v0;
