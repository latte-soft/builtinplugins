local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_withContext_0 = require(l_Parent_0.Packages.Framework).ContextServices.withContext;
local v5 = require(l_Parent_0.Src.Thunks.AddControlPoint);
local l_Components_0 = l_Parent_0.Src.Components;
local v7 = require(l_Components_0.ControlPoint);
local v8 = require(l_Components_0.GuiShim);
local v9 = v2.PureComponent:extend("ControlPointEditGui");
v9.render = function(v10)
    local l_props_0 = v10.props;
    local v12 = {};
    if not (l_props_0.SelectedObject and l_props_0.Path2DToolMode ~= "DoneEditing") or l_props_0.Path2DToolMode == "AddPoint" then
        return nil;
    else
        for v13, v14 in pairs(l_props_0.ControlPoints) do
            local v15 = l_props_0.SelectedControlPointIndex == v13;
            local v16 = false;
            if l_props_0.SelectedControlPointIndex > 0 then
                v16 = l_props_0.SelectedControlPointIndex <= #l_props_0.ControlPoints;
            end;
            local l_v16_0 = v16;
            if l_v16_0 then
                l_v16_0 = true;
                if l_props_0.SelectedControlPointIndex - 1 ~= v13 then
                    l_v16_0 = l_props_0.SelectedControlPointIndex + 1 == v13;
                end;
            end;
            v12[v13] = v2.createElement(v7, {
                index = v13, 
                point = v14, 
                showTangents = v15, 
                showTangentsPhantom = l_v16_0, 
                isSelected = l_props_0.SelectedControlPointIndex == v13
            });
        end;
        return v2.createElement(not game:GetFastFlag("PathEditorSurfaceGui") and "ScreenGui" or v8, {
            DisplayOrder = 2, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, v12);
    end;
end;
return v3.connect(function(v18, _)
    return {
        Refreshed = v18.PathReducer.Refreshed, 
        SelectedObject = v18.PathReducer.SelectedObject, 
        Path2DToolMode = v18.PathReducer.Path2DToolMode, 
        ControlPoints = v18.PathReducer.ControlPoints, 
        SelectedControlPointIndex = v18.PathReducer.SelectedControlPointIndex
    };
end, function(v20)
    return {
        dispatchAddControlPoint = function(v21)
            v20(v5(v21));
        end
    };
end)((l_withContext_0({})(v9)));
