local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SelectControlPoint);
local v2 = require(l_Parent_0.Src.Thunks.RecordChangeHistory);
local v3 = require(l_Parent_0.Src.Resources.Constants);
local l_Util_0 = l_Parent_0.Src.Util;
local v5 = require(l_Util_0.makeNewPath2DControlPoint);
local v6 = require(l_Util_0.getUDim2ScaleFromOffset);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
return function(v8, v9)
    return function(v10)
        local l_PathReducer_0 = v10:getState().PathReducer;
        if l_PathReducer_0.SelectedObject == nil then
            return ;
        else
            v10:dispatch(v2("Add Control Point"));
            local l_ControlPoints_0 = l_PathReducer_0.SelectedObject:GetControlPoints();
            if l_PathEditorRotation_0 and #l_ControlPoints_0 == v3.MaxControlPoints then
                warn("Path2D: Cannot set more than ", v3.MaxControlPoints, "control points");
                return ;
            else
                local v13 = if (not not v9 and v9 <= #l_ControlPoints_0 + 1) and v9 > 0 then v9 else #l_ControlPoints_0 + 1;
                local v14 = v5();
                v14.Position = v6(v8, l_PathReducer_0.SelectedObject.Parent);
                if not game:getFastFlag("PathEditorUsePerformantAPICalls") then
                    table.insert(l_ControlPoints_0, v13, v14);
                    l_PathReducer_0.SelectedObject:SetControlPoints(l_ControlPoints_0);
                else
                    l_PathReducer_0.SelectedObject:InsertControlPoint(v13, v14);
                end;
                l_PathReducer_0.SelectedObject.SelectedControlPoint = v13;
                if l_PathEditorRotation_0 then
                    v10:dispatch(v1(v13));
                end;
                v10:dispatch(v2());
                return ;
            end;
        end;
    end;
end;
