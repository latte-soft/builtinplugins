local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Thunks.RecordChangeHistory);
local v2 = require(l_Parent_0.Src.Actions.SelectControlPoint);
local v3 = require(l_Parent_0.Src.Actions.RemoveControlPointState);
return function(v4)
    return function(v5)
        local l_PathReducer_0 = v5:getState().PathReducer;
        if v4 == nil then
            v4 = l_PathReducer_0.SelectedControlPointIndex;
        end;
        local l_ControlPoints_0 = l_PathReducer_0.SelectedObject:GetControlPoints();
        if not (v4 > 0) or #l_ControlPoints_0 < v4 then
            return l_PathReducer_0;
        else
            v5:dispatch(v1("Remove Control Point"));
            local l_v4_0 = v4;
            v5:dispatch(v3(l_v4_0));
            if not game:getFastFlag("PathEditorUsePerformantAPICalls") then
                table.remove(l_ControlPoints_0, l_v4_0);
                l_PathReducer_0.SelectedObject:SetControlPoints(l_ControlPoints_0);
            else
                l_PathReducer_0.SelectedObject:RemoveControlPoint(l_v4_0);
            end;
            v5:dispatch(v2(if #l_PathReducer_0.SelectedObject:GetControlPoints() < l_v4_0 then l_v4_0 - 1 else l_v4_0));
            v5:dispatch(v1());
            return ;
        end;
    end;
end;
