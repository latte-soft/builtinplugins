local l_Parent_0 = script.Parent.Parent.Parent;
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v2 = require(l_Thunks_0.ModifyControlPoint);
local v3 = require(l_Thunks_0.SetControlPointTangent);
local l_Util_0 = l_Parent_0.Src.Util;
local v5 = require(l_Util_0.getUDim2ScaleFromVector2);
local v6 = require(l_Util_0.getAbsolutePosition);
local v7 = require(l_Util_0.getVector2FromUDim2Scale);
local v8 = require(l_Parent_0.Src.Resources.Constants);
return function(v9, v10, v11)
    return function(v12)
        local l_PathReducer_0 = v12:getState().PathReducer;
        local v14 = v11 - v10;
        if l_PathReducer_0.Path2DToolMode == "Move" then
            local v15 = v11 - v6(l_PathReducer_0.SelectedObject);
            local v16 = v5(v15, l_PathReducer_0.SelectedObject.Parent);
            if not (v9 ~= 1) or v9 == #l_PathReducer_0.ControlPoints then
                local l_Position_0 = l_PathReducer_0.ControlPoints[if v9 == 1 then #l_PathReducer_0.ControlPoints else 1].Position;
                if math.abs((v15 - v7(l_Position_0, l_PathReducer_0.SelectedObject.Parent)).Magnitude) < v8.SnapToPointEpsilon then
                    v16 = l_Position_0;
                end;
            end;
            v12:dispatch(v2(v9, v16));
            return ;
        else
            if l_PathReducer_0.Path2DToolMode == "AddTangent" then
                local _ = l_PathReducer_0.ControlPoints;
                v12:dispatch(v3(v9, if l_PathReducer_0.SelectedTangentSide ~= nil then l_PathReducer_0.SelectedTangentSide else "Left", v14, false, false));
            end;
            return ;
        end;
    end;
end;
