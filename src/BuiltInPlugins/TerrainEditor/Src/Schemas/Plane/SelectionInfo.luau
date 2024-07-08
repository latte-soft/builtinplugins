local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2)
    assert(#v2 == 1, "Expected selection to have length 1.");
    return (setmetatable({
        _transform = v2[1], 
        _draggerContext = v1
    }, v0));
end;
v0.isEmpty = function(_)
    return false;
end;
v0.getBoundingBox = function(v4)
    if not v4._draggerContext:shouldUseLocalSpace() then
        return CFrame.new(v4._transform.Transform.Position), Vector3.new(), (Vector3.new());
    else
        return v4:getLocalBoundingBox();
    end;
end;
v0.getLocalBoundingBox = function(v5)
    return v5._transform.Transform, Vector3.new(), (Vector3.new());
end;
v0.doesContainItem = function(_, _)
    return true;
end;
v0.isDynamic = function(_)
    return false;
end;
return v0;
