local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.getUDim2ScaleFromOffset);
local v2 = require(l_Parent_0.Src.Util.getVector2FromUDim2Scale);
local v3 = require(l_Parent_0.Src.Util.getUDim2FromVector2);
local v4 = require(l_Parent_0.Src.Util.rotatePoint);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
return function(v6, v7)
    return function(v8)
        local l_PathReducer_0 = v8:getState().PathReducer;
        if not (v6 > 0) or #l_PathReducer_0.ControlPoints < v6 then
            return l_PathReducer_0;
        else
            local l_v7_0 = v7;
            if l_PathEditorRotation_0 and l_PathReducer_0.ParentAbsRotation ~= 0 then
                l_v7_0 = v3(v4(v2(l_v7_0, l_PathReducer_0.SelectedObject.Parent), l_PathReducer_0.ParentAbsSize * 0.5, -1 * l_PathReducer_0.ParentAbsRotation));
            end;
            local l_ControlPoints_0 = l_PathReducer_0.ControlPoints;
            if l_PathReducer_0.ScalePositionMode then
                l_v7_0 = v1(l_v7_0, l_PathReducer_0.SelectedObject.Parent);
            end;
            l_ControlPoints_0[v6].Position = l_v7_0;
            if not game:getFastFlag("PathEditorUsePerformantAPICalls") then
                l_PathReducer_0.SelectedObject:SetControlPoints(l_ControlPoints_0);
                return ;
            else
                l_PathReducer_0.SelectedObject:UpdateControlPoint(v6, l_ControlPoints_0[v6]);
                return ;
            end;
        end;
    end;
end;
