local v0 = {};
v0.__index = v0;
v0.new = function()
    local v1 = {};
    setmetatable(v1, v0);
    v1.decoded = {};
    return v1;
end;
v0.JSONDecode = function(v2, v3)
    v2.decoded[v3] = true;
    return v3;
end;
return v0;
