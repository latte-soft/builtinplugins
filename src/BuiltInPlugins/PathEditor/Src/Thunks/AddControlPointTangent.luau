local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Thunks.RecordChangeHistory);
local v2 = require(l_Parent_0.Src.Actions.ToggleSharp);
local v3 = require(l_Parent_0.Src.Resources.Constants);
local v4 = require(l_Parent_0.Src.Util.getAbsPosFromUDim2);
local v5 = require(l_Parent_0.Src.Util.getAbsolutePosition);
local v6 = require(l_Parent_0.Src.Util.getControlPointState);
local v7 = require(l_Parent_0.Src.Util.getUDim2ScaleFromVector2);
local v8 = game:DefineFastFlag("PathEditorAddTangentUndoFix", false);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
return function(v10)
    return function(v11)
        local l_PathReducer_0 = v11:getState().PathReducer;
        local l_ControlPoints_0 = l_PathReducer_0.SelectedObject:GetControlPoints();
        if not (v10 > 0) or #l_ControlPoints_0 < v10 then
            return ;
        else
            local l_v10_0 = v10;
            local l_ControlPointStates_0 = l_PathReducer_0.ControlPointStates;
            if not v8 then
                if not l_ControlPointStates_0[l_v10_0].Sharp then
                    return ;
                end;
            elseif not v6(l_ControlPoints_0[l_v10_0]).Sharp then
                return ;
            end;
            local v16 = false;
            if #l_PathReducer_0.ControlPoints > 1 then
                if l_v10_0 ~= 1 then
                    v16 = false;
                    if not (l_v10_0 == #l_PathReducer_0.ControlPoints) then
                        goto label0;
                    end;
                end;
                v16 = l_ControlPoints_0[1].Position == l_ControlPoints_0[#l_PathReducer_0.ControlPoints].Position;
            end;
            ::label0::;
            local v17 = if not not v16 and l_v10_0 == 1 then #l_PathReducer_0.ControlPoints else 1;
            if not v8 then
                v1("Add Control Point Tangents");
            else
                v11:dispatch(v1("Add Control Point Tangents"));
            end;
            local v18 = v5(l_PathReducer_0.SelectedObject.Parent);
            local l_AbsoluteSize_0 = l_PathReducer_0.SelectedObject.Parent.AbsoluteSize;
            local v20 = if not l_PathEditorRotation_0 then nil else l_PathReducer_0.ParentAbsRotation;
            if #l_PathReducer_0.ControlPoints == 1 then
                local l_one_0 = Vector2.one;
                l_ControlPoints_0[v10].LeftTangent = v7(l_one_0.Unit * -v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
                l_ControlPoints_0[v10].RightTangent = v7(l_one_0.Unit * v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
            elseif v10 > 1 and v10 < #l_PathReducer_0.ControlPoints then
                local v22 = v4(l_ControlPoints_0[v10 + 1].Position, v18, l_AbsoluteSize_0, if not l_PathEditorRotation_0 then nil else v20) - v4(l_ControlPoints_0[v10 - 1].Position, v18, l_AbsoluteSize_0, if not l_PathEditorRotation_0 then nil else v20);
                if v22.Y == 0 and v22.X == 0 then
                    v22 = Vector2.one;
                end;
                l_ControlPoints_0[v10].LeftTangent = v7(v22.Unit * -v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
                l_ControlPoints_0[v10].RightTangent = v7(v22.Unit * v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
            elseif not v16 then
                if v10 == 1 then
                    local v23 = v4(l_ControlPoints_0[v10 + 1].Position, v18, l_AbsoluteSize_0, if not l_PathEditorRotation_0 then nil else v20) - v4(l_ControlPoints_0[v10].Position, v18, l_AbsoluteSize_0, if not l_PathEditorRotation_0 then nil else v20);
                    if v23.Y == 0 and v23.X == 0 then
                        v23 = Vector2.one;
                    end;
                    l_ControlPoints_0[v10].LeftTangent = v7(v23.Unit * -v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
                    l_ControlPoints_0[v10].RightTangent = v7(v23.Unit * v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
                elseif v10 == #l_PathReducer_0.ControlPoints then
                    local v24 = v4(l_ControlPoints_0[v10].Position, v18, l_AbsoluteSize_0, if not l_PathEditorRotation_0 then nil else v20) - v4(l_ControlPoints_0[v10 - 1].Position, v18, l_AbsoluteSize_0, if not l_PathEditorRotation_0 then nil else v20);
                    if v24.Y == 0 and v24.X == 0 then
                        v24 = Vector2.one;
                    end;
                    l_ControlPoints_0[v10].LeftTangent = v7(v24.Unit * -v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
                    l_ControlPoints_0[v10].RightTangent = v7(v24.Unit * v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
                end;
            else
                local v25 = v4(l_ControlPoints_0[2].Position, v18, l_AbsoluteSize_0, if not l_PathEditorRotation_0 then nil else v20) - v4(l_ControlPoints_0[#l_PathReducer_0.ControlPoints].Position, v18, l_AbsoluteSize_0, if not l_PathEditorRotation_0 then nil else v20);
                if v25.Y == 0 and v25.X == 0 then
                    v25 = Vector2.one;
                end;
                l_ControlPoints_0[v10].LeftTangent = v7(v25.Unit * -v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
                l_ControlPoints_0[v10].RightTangent = v7(v25.Unit * v3.DefaultTangentLength, l_PathReducer_0.SelectedObject.Parent);
                l_ControlPoints_0[v17].LeftTangent = l_ControlPoints_0[v10].LeftTangent;
                l_ControlPoints_0[v17].RightTangent = l_ControlPoints_0[v10].RightTangent;
            end;
            if l_ControlPointStates_0[v10].Sharp then
                v11:dispatch(v2(v10));
            end;
            if not (not v16 or not l_ControlPointStates_0[v17].Sharp) then
                v11:dispatch(v2(v17));
            end;
            if not game:getFastFlag("PathEditorUsePerformantAPICalls") then
                l_PathReducer_0.SelectedObject:SetControlPoints(l_ControlPoints_0);
            else
                l_PathReducer_0.SelectedObject:UpdateControlPoint(v10, l_ControlPoints_0[v10]);
            end;
            v11:dispatch(v1());
            return ;
        end;
    end;
end;
