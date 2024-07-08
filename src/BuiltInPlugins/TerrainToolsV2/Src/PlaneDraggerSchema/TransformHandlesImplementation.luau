local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    return (setmetatable({
        _draggerContext = v1, 
        _updatePlaneFn = v1.updatePlaneFn
    }, v0));
end;
v0.beginDrag = function(v2, v3, _)
    assert(#v3 == 1, "Expected selection to have length 1.");
    v2.initCFrame = v3[1].planeCFrame;
end;
v0.updateDrag = function(v5, v6)
    v5._updatePlaneFn(v6 * v5.initCFrame);
    return v6;
end;
v0.endDrag = function(_)
end;
v0.render = function(_, _)
    return nil;
end;
return v0;
