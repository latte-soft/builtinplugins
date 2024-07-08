local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2)
    return (setmetatable({
        _region = v2[1], 
        _draggerContext = v1
    }, v0));
end;
v0.isEmpty = function(_)
    return false;
end;
v0.getBoundingBox = function(v4)
    if not v4._draggerContext:shouldUseLocalSpace() then
        return v4._region.Region.transform, Vector3.new(), v4._region.Region.size;
    else
        return v4._region.Region.transform, Vector3.new(), v4._region.Region.size;
    end;
end;
v0.doesContainItem = function(_, _)
    return true;
end;
v0.isDynamic = function(_)
    return false;
end;
return v0;
