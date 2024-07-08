local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    local v2 = setmetatable({}, v0);
    v2.lambda = v1;
    return v2;
end;
v0.getText = function(v3, v4, v5, v6)
    return v3.lambda(v4, v5, v6);
end;
v0.Destroy = function(v7)
    v7.lambda = nil;
end;
return v0;
