local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local v5 = require(l_Parent_0.Packages.ViewportToolingFramework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Toolbar_0 = v5.Toolbar;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v14 = require(l_Actions_0.ToggleAddPointTool);
local v15 = require(l_Actions_0.ToggleAddTangentTool);
local v16 = require(l_Actions_0.ToggleDone);
local v17 = require(l_Actions_0.ToggleMirrored);
local v18 = require(l_Actions_0.ToggleMoveTool);
local v19 = require(l_Actions_0.ToolbarHovered);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v21 = require(l_Thunks_0.AddControlPointTangent);
local v22 = require(l_Thunks_0.ClearControlPointTangent);
local v23 = require(l_Thunks_0.RemoveControlPoint);
local v24 = require(l_Parent_0.Src.Util.getShortcuts)();
local v25 = require(l_Parent_0.Src.Util.TelemetryGlobals);
local v26 = require(l_Parent_0.Src.Resources.Constants);
local l_PathEditorMaxControlPointDisableAdd_0 = game:GetFastFlag("PathEditorMaxControlPointDisableAdd");
local v28 = game:DefineFastFlag("PathEditorSelectToolRename", false);
local v29 = v2.PureComponent:extend("PathToolbar");
v29.render = function(v30)
    local l_props_0 = v30.props;
    local l_PathToolbar_0 = l_props_0.Stylizer.PathToolbar;
    local l_Localization_1 = l_props_0.Localization;
    local _ = nil;
    if l_props_0.SelectedObject then
        local v36 = {
            {
                Type = "Radio", 
                Value = l_props_0.Path2DToolMode, 
                OnChange = function(v35)
                    if v35 == "Move" then
                        l_props_0.dispatchToggleMoveTool();
                        return ;
                    elseif v35 == "AddPoint" then
                        l_props_0.dispatchToggleAddPointTool();
                        return ;
                    else
                        if v35 == "AddTangent" then
                            l_props_0.dispatchToggleAddTangentTool();
                        end;
                        return ;
                    end;
                end, 
                Items = {
                    {
                        Id = "Move", 
                        Tooltip = ("%* (%*)"):format(l_Localization_1:getText("Info", not v28 and "SelectTool" or "Select"), v24.Move), 
                        Icon = l_PathToolbar_0.MoveImage
                    }, 
                    if not l_PathEditorMaxControlPointDisableAdd_0 or if not l_PathEditorMaxControlPointDisableAdd_0 then nil else #l_props_0.SelectedObject:GetControlPoints() < v26.MaxControlPoints then {
                        Id = "AddPoint", 
                        Tooltip = ("%* (%*)"):format(l_Localization_1:getText("Info", "AddPointTool"), v24.AddPoint), 
                        Icon = l_PathToolbar_0.AddPointImage
                    } else nil, 
                    {
                        Id = "AddTangent", 
                        Tooltip = ("%* (%*)"):format(l_Localization_1:getText("Info", "AddTangentTool"), v24.AddTangent), 
                        Icon = l_PathToolbar_0.AddTangentImage
                    }
                }
            }
        };
        if l_props_0.Path2DToolMode ~= "DoneEditing" then
            table.insert(v36, {
                Type = "TextButton", 
                Text = l_Localization_1:getText("Info", "Done"), 
                OnClick = l_props_0.dispatchToggleDone
            });
        end;
        return v2.createElement(l_Toolbar_0, {
            DisplayOrder = 4, 
            HorizontalItems = v36
        });
    else
        return nil;
    end;
end;
return v3.connect(function(v37, _)
    return {
        ControlPointStates = v37.PathReducer.ControlPointStates, 
        SelectedObject = v37.PathReducer.SelectedObject, 
        Path2DToolMode = v37.PathReducer.Path2DToolMode, 
        SelectedControlPointIndex = v37.PathReducer.SelectedControlPointIndex, 
        SelectedTangentSide = v37.PathReducer.SelectedTangentSide
    };
end, function(v39)
    return {
        dispatchToggleAddPointTool = function()
            local l_v25_0 = v25;
            l_v25_0.addPointModeCount = l_v25_0.addPointModeCount + 1;
            v39(v14());
        end, 
        dispatchToggleAddTangentTool = function()
            local l_v25_1 = v25;
            l_v25_1.addTangentModeCount = l_v25_1.addTangentModeCount + 1;
            v39(v15());
        end, 
        dispatchToggleDone = function()
            v39(v16());
        end, 
        dispatchToggleMoveTool = function()
            local l_v25_2 = v25;
            l_v25_2.selectModeCount = l_v25_2.selectModeCount + 1;
            v39(v18());
        end, 
        dispatchRemoveControlPoint = function()
            v39(v23());
        end, 
        dispatchClearControlPointTangent = function(v43, v44)
            v39(v22(v43, v44));
        end, 
        dispatchClearControlPointTangents = function(v45)
            v39(v22(v45, "Left"));
            v39(v22(v45, "Right"));
        end, 
        dispatchToolbarHovered = function(v46)
            v39(v19(v46));
        end, 
        dispatchAddControlPointTangent = function(v47)
            v39(v21(v47));
        end, 
        dispatchToggleMirrored = function(v48)
            v39(v17(v48));
        end
    };
end)((l_withContext_0({
    Mouse = l_Mouse_0, 
    Plugin = l_Plugin_0, 
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v29)));
