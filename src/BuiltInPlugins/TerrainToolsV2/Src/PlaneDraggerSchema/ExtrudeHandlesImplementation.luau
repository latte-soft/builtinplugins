local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    return (setmetatable({
        _draggerContext = v1
    }, v0));
end;
v0.getBoundingBox = function(_, _, v4)
    return v4:getBoundingBox();
end;
v0.shouldScaleFromCenter = function(v5, _, _, _)
    return v5._draggerContext:isCtrlKeyDown();
end;
v0.beginScale = function(v9, v10, v11, _)
    local v13, v14, v15 = v9:getBoundingBox(v10, v11);
    v9._originalBoundingBoxCFrame = v13 * CFrame.new(v14);
    v9._originalBoundingBoxSize = v15;
end;
v0.updateScale = function(v16, v17, v18)
    local _ = v16._originalBoundingBoxCFrame * CFrame.new(v18);
    local _ = (v16._originalBoundingBoxSize + v17) / v16._originalBoundingBoxSize;
    return v17, v18;
end;
v0.endScale = function(_)
end;
v0.render = function(_, _, _)
end;
return v0;
