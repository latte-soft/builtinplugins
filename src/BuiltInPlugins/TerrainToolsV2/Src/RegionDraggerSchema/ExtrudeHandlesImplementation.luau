local v0 = require(script.Parent.Parent.Parent.Src.Util.Constants);
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    return (setmetatable({
        _draggerContext = v2
    }, v1));
end;
v1.getBoundingBox = function(_, _, v5)
    return v5:getBoundingBox();
end;
v1.shouldScaleFromCenter = function(v6, _, _, _)
    return v6._draggerContext:isCtrlKeyDown();
end;
v1.axesToScale = function(v10, _, v12)
    if not v10._draggerContext:isShiftKeyDown() or not v10._draggerContext:isCtrlKeyDown() then
        return ({
            {
                X = true
            }, 
            {
                Y = true
            }, 
            {
                Z = true
            }
        })[v12];
    else
        return {
            X = true, 
            Y = true, 
            Z = true
        };
    end;
end;
v1.getMinMaxSizes = function(_)
    return Vector3.one * v0.REGION_MIN_SIZE, Vector3.one * v0.REGION_MAX_SIZE;
end;
v1.beginScale = function(v14, v15, v16, _)
    local v18, _, v20 = v14:getBoundingBox(v15, v16);
    v14._originalBoundingBoxCFrame = v18;
    v14._originalBoundingBoxSize = v20;
end;
v1.updateScale = function(v21, v22, v23)
    v21._draggerContext.updateRegion(v21._originalBoundingBoxCFrame + v21._originalBoundingBoxCFrame.Rotation * v23, v21._originalBoundingBoxSize + v22);
    return v22, v23;
end;
v1.getPriority = function(_)
    return 1;
end;
v1.endScale = function(_)
end;
v1.render = function(_, _, _)
end;
return v1;
