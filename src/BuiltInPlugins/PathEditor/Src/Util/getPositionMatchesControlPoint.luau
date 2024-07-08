local l_SnapToPointEpsilon_0 = require(script.Parent.Parent.Parent.Src.Resources.Constants).SnapToPointEpsilon;
local v1 = require(script.Parent.getVector2FromUDim2Scale);
local v2 = require(script.Parent.getVector2FromUDim2Offset);
local v3 = require(script.Parent.getAbsPosFromUDim2);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local _ = nil;
if not l_PathEditorRotation_0 then
    return function(v6, v7, v8, v9, v10)
        if v7 == nil then
            return false;
        else
            local v11 = v10 or l_SnapToPointEpsilon_0;
            local v12 = math.abs(((v3(v7.Position, v8, v9) - v8) - v2(v6)).Magnitude);
            return v12 < v11, v12;
        end;
    end;
else
    return function(v13, v14, v15, v16)
        if v14 == nil then
            return false;
        else
            local v17 = v16 or l_SnapToPointEpsilon_0;
            local v18 = math.abs(v1(v14.Position - v13, v15).Magnitude);
            return v18 < v17, v18;
        end;
    end;
end;
