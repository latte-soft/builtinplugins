local v0 = require(script.Parent.Parent.Parent.Src.Util.getVector2FromUDim2Scale);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local function v6(v2, v3)
    v3 = math.clamp(v3, 0, 1);
    local v4 = #v2:GetControlPoints() - 1;
    local v5 = math.clamp(v3 * v4, 0, v4 - 1);
    return {
        v5, 
        v3 * v4 - v5
    };
end;
local _ = nil;
if not l_PathEditorRotation_0 then
    return function(v8, v9)
        local v10 = 5000;
        local v11 = 0;
        local v12 = 0;
        for v13 = 0, 500 do
            local l_Magnitude_0 = (v0(v8:getPositionOnCurve(v13 / 500), v8.Parent) - v9).Magnitude;
            if l_Magnitude_0 < v10 then
                v10 = l_Magnitude_0;
                v11 = v6(v8, v13 / 500)[1];
                v12 = v13 / 500;
            end;
        end;
        return {
            v11, 
            v10, 
            v12
        };
    end;
else
    return function(v15, v16)
        local v17 = 5000;
        local v18 = 0;
        local v19 = 0;
        local v20 = nil;
        v20 = if typeof(v16) == "UDim2" then v0(v16, v15.Parent) else v16;
        for v21 = 0, 500 do
            local l_Magnitude_1 = (v0(v15:getPositionOnCurve(v21 / 500), v15.Parent) - v20).Magnitude;
            if l_Magnitude_1 < v17 then
                v17 = l_Magnitude_1;
                v18 = v6(v15, v21 / 500)[1];
                v19 = v21 / 500;
            end;
        end;
        return {
            v18, 
            v17, 
            v19
        };
    end;
end;
