local v0 = {};
v0.__index = v0;
v0.new = function()
    local v1 = setmetatable({}, v0);
    v1.order = 0;
    return v1;
end;
v0.getNextOrder = function(v2)
    v2.order = v2.order + 1;
    return v2.order;
end;
return v0;
