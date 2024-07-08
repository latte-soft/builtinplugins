local l_Thunks_0 = script.Parent.Parent.Parent.Src.Thunks;
local v1 = require(l_Thunks_0.SetControlPointTangent);
local v2 = require(l_Thunks_0.RecordChangeHistory);
return function(v3)
    return function(v4)
        local l_PathReducer_0 = v4:getState().PathReducer;
        if l_PathReducer_0.Path2DToolMode == "Move" then
            return ;
        else
            if l_PathReducer_0.Path2DToolMode == "AddTangent" then
                v4:dispatch(v2("Removed Tangents"));
                v4:dispatch(v1(v3, "Left", Vector2.zero, false, false));
                v4:dispatch(v1(v3, "Right", Vector2.zero, false, false));
                v4:dispatch(v2());
            end;
            return ;
        end;
    end;
end;
