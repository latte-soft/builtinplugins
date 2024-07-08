local v0 = require(script.Parent.rotatePoint);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
getAbsPosFromUDim2 = function(v2, v3, v4, v5)
    if not l_PathEditorRotation_0 then
        return Vector2.new(v2.X.Offset + v2.X.Scale * v4.X, v2.Y.Offset + v2.Y.Scale * v4.Y) + v3;
    else
        return v0(Vector2.new(v2.X.Offset + v2.X.Scale * v4.X, v2.Y.Offset + v2.Y.Scale * v4.Y), v4 * 0.5, v5 or 0) + v3;
    end;
end;
return getAbsPosFromUDim2;
