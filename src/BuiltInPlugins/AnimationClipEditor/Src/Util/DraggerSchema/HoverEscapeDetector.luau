local v0 = {};
v0.__index = v0;
v0.new = function(v1, _, _)
    return (setmetatable({
        _draggerContext = v1
    }, v0));
end;
v0.destroy = function(_)
end;
return v0;
