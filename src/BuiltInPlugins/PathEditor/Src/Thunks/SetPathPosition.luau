local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Thunks.RecordChangeHistory);
local l_Util_0 = l_Parent_0.Src.Util;
local v3 = require(l_Util_0.getRelativePosFromAbsPos);
local v4 = require(l_Util_0.getUDim2ScaleFromVector2);
if not game:GetFastFlag("PathEditorRotation") then
    return function(v5, v6)
        return function(v7)
            local l_PathReducer_0 = v7:getState().PathReducer;
            if l_PathReducer_0.SelectedObject == nil then
                return ;
            else
                if not v6 then
                    v7:dispatch(v1("Setting Path Position"));
                end;
                local l_ControlPoints_0 = l_PathReducer_0.SelectedObject:GetControlPoints();
                local l_Min_0 = l_PathReducer_0.SelectedObject:GetBoundingRect().Min;
                for _, v12 in l_ControlPoints_0, nil, nil do
                    v12.Position = (v12.Position + v5) - v4(l_Min_0, l_PathReducer_0.SelectedObject.Parent);
                end;
                l_PathReducer_0.SelectedObject:SetControlPoints(l_ControlPoints_0);
                if v6 then
                    v7:dispatch(v1());
                end;
                return ;
            end;
        end;
    end;
else
    return function(v13, v14, v15)
        return function(v16)
            local l_PathReducer_1 = v16:getState().PathReducer;
            if l_PathReducer_1.SelectedObject == nil then
                return ;
            else
                if not v15 then
                    v16:dispatch(v1("Setting Path Position"));
                end;
                local l_ControlPoints_1 = l_PathReducer_1.SelectedObject:GetControlPoints();
                local v19 = v14 - l_PathReducer_1.SelectedObject:GetBoundingRect().Min;
                for _, v21 in l_ControlPoints_1, nil, nil do
                    v21.Position = v21.Position + v3(v13 + v19, l_PathReducer_1.SelectedObject.Parent);
                end;
                l_PathReducer_1.SelectedObject:SetControlPoints(l_ControlPoints_1);
                if v15 then
                    v16:dispatch(v1());
                end;
                return ;
            end;
        end;
    end;
end;
