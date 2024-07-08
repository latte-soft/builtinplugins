local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Resources.Constants);
local v2 = require(l_Parent_0.Src.Actions.ChangeControlPointState);
local l_Util_0 = l_Parent_0.Src.Util;
local v4 = require(l_Util_0.constrainToEightDirections);
local v5 = require(l_Util_0.getControlPointState);
local v6 = require(l_Util_0.getTangentNameForSide);
local v7 = require(l_Util_0.getUDim2ScaleFromVector2);
local v8 = require(l_Util_0.getUDim2Inverse);
local v9 = require(l_Util_0.rotatePoint);
local _ = require(l_Parent_0.Src.Types);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
return function(v12, v13, v14, v15, v16, v17)
    return function(v18)
        local l_PathReducer_0 = v18:getState().PathReducer;
        local v20 = false;
        if v12 > 0 then
            v20 = v12 <= #l_PathReducer_0.ControlPoints;
        end;
        assert(v20, "Cannot set tangent for invalid control point index.");
        local l_v12_0 = v12;
        v20 = l_PathReducer_0.SelectedObject:GetControlPoints();
        local l_ControlPointStates_0 = l_PathReducer_0.ControlPointStates;
        if l_PathEditorRotation_0 then
            v14 = v9(v14, Vector2.new(), -1 * l_PathReducer_0.ParentAbsRotation);
        end;
        if not (l_ControlPointStates_0 ~= nil) or #l_ControlPointStates_0 < l_v12_0 then
            return ;
        else
            local v23 = false;
            if #l_PathReducer_0.ControlPoints > 1 then
                if l_v12_0 ~= 1 then
                    v23 = false;
                    if not (l_v12_0 == #l_PathReducer_0.ControlPoints) then
                        goto label0;
                    end;
                end;
                v23 = v20[1].Position == v20[#l_PathReducer_0.ControlPoints].Position;
            end;
            ::label0::;
            local v24 = if not not v23 and l_v12_0 == 1 then #l_PathReducer_0.ControlPoints else 1;
            if v14.Magnitude < v1.DragTangentToCenterToDeleteZoneSizePixels then
                v14 = Vector2.zero;
            end;
            v16 = not l_ControlPointStates_0[l_v12_0].Mirrored;
            if v17 then
                v16 = false;
            end;
            if v15 then
                v14 = v4(v14);
                v14 = v14;
            end;
            local v25 = v13 == "Left" and "Right" or "Left";
            local v26 = v7(v14, l_PathReducer_0.SelectedObject.Parent);
            v20[l_v12_0][v6(v13)] = v26;
            if not v16 then
                v20[l_v12_0][v6(v25)] = v8(v26);
            end;
            if v23 then
                v20[v24][v6(v13)] = v26;
                if not v16 then
                    v20[v24][v6(v25)] = v8(v26);
                end;
                v18:dispatch(v2(v24, v5(v20[v24])));
            end;
            v18:dispatch(v2(l_v12_0, v5(v20[l_v12_0])));
            if not game:getFastFlag("PathEditorUsePerformantAPICalls") then
                l_PathReducer_0.SelectedObject:SetControlPoints(v20);
                return ;
            else
                l_PathReducer_0.SelectedObject:UpdateControlPoint(l_v12_0, v20[l_v12_0]);
                return ;
            end;
        end;
    end;
end;
