local v0 = {};
v0.__index = v0;
v0.new = function(v1, ...)
    return (setmetatable({
        _draggerContext = v1
    }, v0));
end;
v0.beginDrag = function(v2, v3, _)
    assert(#v3 == 1, "Expected selection to have length 1");
    local v5 = v3[1];
    v2._transform = v5.Region.transform;
    v2._size = v5.Region.size;
end;
v0.updateDrag = function(v6, v7)
    v6._draggerContext.updateRegion(v7 * v6._transform, v6._size);
    return v7;
end;
v0.endDrag = function(_)
end;
v0.render = function(_, _)
end;
return v0;
