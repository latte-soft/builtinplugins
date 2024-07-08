local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Thunks.RecordChangeHistory);
local v3 = require(l_Parent_0.Src.Actions.SelectTangentSide);
local v4 = require(l_Parent_0.Src.Actions.ToggleSharp);
local v5 = require(l_Parent_0.Src.Util.getTangentNameForSide);
return function(v6, v7)
    return function(v8)
        local l_PathReducer_0 = v8:getState().PathReducer;
        if not (v6 > 0) or #l_PathReducer_0.ControlPoints < v6 then
            return l_PathReducer_0;
        else
            local l_v6_0 = v6;
            local l_ControlPoints_0 = l_PathReducer_0.SelectedObject:GetControlPoints();
            local l_ControlPointStates_0 = l_PathReducer_0.ControlPointStates;
            local v13 = v5(v7);
            if l_ControlPoints_0[l_v6_0][v13] == UDim2.new() then
                return l_PathReducer_0;
            else
                v8:dispatch(v2("Removed Tangent"));
                l_ControlPoints_0[l_v6_0][v13] = UDim2.new();
                if not l_ControlPointStates_0[l_v6_0].Sharp then
                    v8:dispatch(v4(l_v6_0));
                end;
                if not game:getFastFlag("PathEditorUsePerformantAPICalls") then
                    l_PathReducer_0.SelectedObject:SetControlPoints(l_ControlPoints_0);
                else
                    l_PathReducer_0.SelectedObject:UpdateControlPoint(l_v6_0, l_ControlPoints_0[l_v6_0]);
                end;
                if v7 == l_PathReducer_0.SelectedTangentSide then
                    v8:dispatch(v3(nil));
                end;
                v8:dispatch(v2());
                return ;
            end;
        end;
    end;
end;
