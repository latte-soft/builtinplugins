local v0 = require(script.Parent.getUDim2ScaleFromVector2);
local v1 = require(script.Parent.getVector2FromUDim2Scale);
local v2 = require(script.Parent.rotatePoint);
getRelativePosFromAbsPos = function(v3, v4)
    if v4:IsA("GuiBase2d") then
        if typeof(v3) == "UDim2" then
            v3 = v1(v3, v4);
        end;
        return v0(v2(v3 - v4.AbsolutePosition, 0.5 * v4.AbsoluteSize, -1 * v4.AbsoluteRotation), v4);
    else
        if typeof(v3) == "Vector2" then
            v3 = v0(v3, v4);
        end;
        return v3;
    end;
end;
return getRelativePosFromAbsPos;
