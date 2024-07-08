local v0 = {};
v0.__index = v0;
v0.new = function()
    return (setmetatable({
        _localUserId = 0
    }, v0));
end;
v0.GetUserId = function(v1)
    return v1._localUserId;
end;
return v0;
