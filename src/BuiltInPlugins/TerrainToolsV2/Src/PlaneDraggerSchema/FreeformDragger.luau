local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2, v3)
    return (setmetatable({
        _draggerContext = v1, 
        _draggerToolModel = v2, 
        _dragInfo = v3
    }, v0));
end;
v0.render = function(_)
    return nil;
end;
v0.rotate = function(_, _)
end;
v0.update = function(_)
end;
v0.destroy = function(_)
end;
return v0;
