local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(script.Parent.getUDim2FromVector2);
local v2 = require(script.Parent.getPositionMatchesControlPoint);
local _ = require(script.Parent.rotateUDim2Point);
local l_SnapToPointEpsilon_0 = require(l_Parent_0.Src.Resources.Constants).SnapToPointEpsilon;
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local _ = nil;
if not l_PathEditorRotation_0 then
    return function(v7, v8, v9, v10)
        local l_v7_0 = v7;
        local l_l_SnapToPointEpsilon_0_0 = l_SnapToPointEpsilon_0;
        for _, v14 in v8, nil, nil do
            local v15, v16 = v2(v7, v14, v9, v10, l_l_SnapToPointEpsilon_0_0);
            if v15 then
                l_v7_0 = v14.Position;
                l_l_SnapToPointEpsilon_0_0 = v16;
            end;
        end;
        return l_v7_0;
    end;
else
    return function(v17, v18, v19)
        local l_v17_0 = v17;
        local l_l_SnapToPointEpsilon_0_1 = l_SnapToPointEpsilon_0;
        for _, v23 in v18, nil, nil do
            local v24, v25 = v2(v17, v23, v19, l_l_SnapToPointEpsilon_0_1);
            if v24 then
                l_v17_0 = v23.Position;
                l_l_SnapToPointEpsilon_0_1 = v25;
            end;
        end;
        return l_v17_0;
    end;
end;
