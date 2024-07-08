local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v4.UI.Pane;
local l_withContext_0 = v4.ContextServices.withContext;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v8 = require(l_Actions_0.PathChanged);
local v9 = require(l_Actions_0.ToggleMoveTool);
local v10 = require(l_Parent_0.Src.Util.getAbsolutePosition);
local l_Components_0 = l_Parent_0.Src.Components;
local v12 = require(l_Components_0.ControlPoint);
local v13 = require(l_Components_0.GuiShim);
local v14 = require(l_Components_0.Line);
local v15 = v2.PureComponent:extend("VisualizationGui");
v15.render = function(v16)
    local l_props_0 = v16.props;
    if l_props_0.SelectedObject then
        local v18 = v10(l_props_0.SelectedObject.Parent);
        local v19 = {};
        local l_ControlPoints_0 = l_props_0.ControlPoints;
        if l_props_0.Path2DToolMode == "AddPoint" then
            for v21, v22 in l_ControlPoints_0, nil, nil do
                v19[v21] = v2.createElement(v12, {
                    index = v21, 
                    point = v22, 
                    showTangentsPhantom = l_props_0.IsDraggingPoint and l_props_0.SelectedControlPointIndex == v21, 
                    isSelected = l_props_0.SelectedControlPointIndex == v21, 
                    Disabled = true
                });
            end;
        end;
        return v2.createElement(not game:GetFastFlag("PathEditorSurfaceGui") and "ScreenGui" or v13, {
            DisplayOrder = 1
        }, {
            EmptySpaceInputBlocker = l_props_0.Path2DToolMode ~= "DoneEditing" and v2.createElement(l_Pane_0, {
                Size = UDim2.fromScale(1, 1), 
                OnClick = function()
                end
            }), 
            LineFrame = v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                Position = UDim2.fromOffset(v18.X, v18.Y)
            }, {
                Line = l_props_0.SelectedObject.Visible == false and v2.createElement(v14, {
                    Style = "Visualization", 
                    ControlPoints = l_props_0.ControlPoints
                })
            }), 
            PointFrame = v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, v19)
        });
    else
        return nil;
    end;
end;
return v3.connect(function(v23, _)
    return {
        Refreshed = v23.PathReducer.Refreshed, 
        SelectedObject = v23.PathReducer.SelectedObject, 
        Path2DToolMode = v23.PathReducer.Path2DToolMode, 
        ControlPoints = v23.PathReducer.ControlPoints, 
        SelectedControlPointIndex = v23.PathReducer.SelectedControlPointIndex, 
        IsDraggingPoint = v23.PathReducer.IsDraggingPoint
    };
end, function(v25)
    return {
        dispatchPathChanged = function(v26)
            v25(v8(v26));
        end, 
        dispatchToggleMoveTool = function()
            v25(v9());
        end
    };
end)((l_withContext_0({})(v15)));
