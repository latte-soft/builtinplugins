local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Thunks.AddControlPointTangent);
local v3 = require(l_Parent_0.Src.Actions.SelectControlPoint);
return function(v4)
    return function(v5)
        local l_PathReducer_0 = v5:getState().PathReducer;
        if l_PathReducer_0.Path2DToolMode == "AddTangent" then
            v5:dispatch(v2(v4));
        end;
        l_PathReducer_0.SelectedObject.SelectedControlPoint = v4;
        v5:dispatch(v3(v4));
    end;
end;
