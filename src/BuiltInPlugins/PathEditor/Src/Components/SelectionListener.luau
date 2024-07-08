local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Selection_0 = game:GetService("Selection");
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v9 = require(l_Actions_0.SelectPath);
local v10 = require(l_Actions_0.ClearPathSelection);
local v11 = require(l_Actions_0.PathChanged);
local v12 = require(l_Actions_0.ToggleAddPointTool);
local v13 = require(l_Actions_0.ToggleMoveTool);
local v14 = require(l_Actions_0.ToggleAddTangentTool);
local v15 = require(l_Actions_0.ToggleDone);
local v16 = require(l_Parent_0.Src.Thunks.RemoveControlPoint);
local l_Util_0 = l_Parent_0.Src.Util;
local v18 = require(l_Util_0.TelemetryGlobals);
local v19 = require(l_Util_0.isHierarchyValidForPath2D);
local v20 = game:defineFastFlag("PathEditorFixActionBindings", false);
local l_PathEditorHierarchyValidCheckFixes_0 = game:GetFastFlag("PathEditorHierarchyValidCheckFixes");
local v22 = v2.PureComponent:extend("SelectionListener");
v22.addAction = function(v23, v24, v25)
    if not v24 then
        return nil;
    else
        v24.Enabled = false;
        table.insert(v23.Actions, v24);
        table.insert(v23.Connections, v24.Triggered:Connect(v25));
        return v24;
    end;
end;
v22.enableActions = function(_, v27)
    if v27 then
        for _, v29 in ipairs(v27) do
            v29.Enabled = true;
        end;
    end;
end;
v22.disableActions = function(_, v31)
    if v31 then
        for _, v33 in ipairs(v31) do
            v33.Enabled = false;
        end;
    end;
end;
v22.init = function(v34)
    local l_props_0 = v34.props;
    v34.delete = function()
        if v34.props.Path2DToolMode == "AddTangent" then
            if v34.props.SelectedControlPointIndex ~= 0 and v34.props.SelectedTangentSide ~= nil then
                v34.props.dispatchClearControlPointTangent(v34.props.SelectedControlPointIndex, v34.props.SelectedTangentSide);
                return ;
            end;
        else
            v34.props.dispatchRemoveControlPoint();
        end;
    end;
    local function v37(v36)
        if not (v36 ~= "AbsolutePosition") or v36 == "AbsoluteSize" then
            l_props_0.dispatchPathChanged("Position");
        end;
    end;
    local function v38()
        l_props_0.dispatchSelectPathCleared();
        if not v20 then
            v34:disableActions();
        else
            v34:disableActions(v34.Actions);
        end;
        if v34.state.selectedObjectChangedConn ~= nil then
            v34.state.selectedObjectChangedConn:Disconnect();
        end;
        if v34.state.selectedObjectParentChangedConn ~= nil then
            v34.state.selectedObjectParentChangedConn:Disconnect();
        end;
        v34.selectedObject = nil;
    end;
    local function v41(v39)
        if v34.selectedObject == nil then
            return ;
        elseif v39 ~= "Parent" then
            l_props_0.dispatchPathChanged(v39);
            return ;
        else
            if v34.state.selectedObjectParentChangedConn ~= nil then
                v34.state.selectedObjectParentChangedConn:Disconnect();
            end;
            v34:setState({
                selectedObjectParentChangedConn = v34.selectedObject.Parent.Changed:Connect(v37)
            });
            local v40 = if not game:GetFastFlag("PathEditorSurfaceGui") then v34.selectedObject.Parent:IsA("GuiBase2d") else v19(v34.selectedObject);
            if not (v34.props.SelectedObject ~= nil) or v40 then
                if not (v34.props.SelectedObject == nil) or not v40 then
                    l_props_0.dispatchPathChanged(v39);
                    return ;
                else
                    l_props_0.dispatchSelectPath(v34.selectedObject);
                    v34:enableActions(v34.UniversalActions);
                    return ;
                end;
            else
                l_props_0.dispatchSelectPathCleared();
                v34:disableActions();
                return ;
            end;
        end;
    end;
    v34:setState({
        selectionChangedConn = l_Selection_0.SelectionChanged:Connect(function()
            local v42 = l_Selection_0:Get();
            if #v42 == 1 then
                for _, v44 in pairs(v42) do
                    if v44:IsA("Path2D") and v44.Parent ~= nil then
                        if if not l_PathEditorHierarchyValidCheckFixes_0 then v44.Parent:IsA("GuiBase2d") else v19(v44) then
                            l_props_0.dispatchSelectPath(v44);
                            v34:enableActions(v34.UniversalActions);
                        end;
                        v34.selectedObject = v44;
                        v34:setState({
                            selectedObjectChangedConn = v44.Changed:Connect(v41), 
                            selectedObjectParentChangedConn = v44.Parent.Changed:Connect(v37)
                        });
                    else
                        v38();
                    end;
                end;
                return ;
            else
                v38();
                return ;
            end;
        end)
    });
end;
v22.didMount = function(v45)
    local l_PluginActions_0 = v45.props.PluginActions;
    v45.Connections = {};
    v45.Actions = {};
    v45.EditingActions = {};
    v45.UniversalActions = {};
    table.insert(v45.EditingActions, v45:addAction(l_PluginActions_0:get("DoneEditing"), v45.props.dispatchToggleDone));
    table.insert(v45.UniversalActions, v45:addAction(l_PluginActions_0:get("MoveTool"), v45.props.dispatchToggleMoveTool));
    table.insert(v45.UniversalActions, v45:addAction(l_PluginActions_0:get("AddPointMode"), v45.props.dispatchToggleAddPointTool));
    table.insert(v45.UniversalActions, v45:addAction(l_PluginActions_0:get("AddTangentMode"), v45.props.dispatchToggleAddTangentTool));
end;
v22.willUnmount = function(v47)
    if v47.state.selectionChangedConn ~= nil then
        v47.state.selectionChangedConn:Disconnect();
    end;
    if v47.state.selectedObjectChangedConn ~= nil then
        v47.state.selectedObjectChangedConn:Disconnect();
    end;
    if v47.state.selectedObjectParentChangedConn ~= nil then
        v47.state.selectedObjectParentChangedConn:Disconnect();
    end;
    if v47.Connections then
        for _, v49 in ipairs(v47.Connections) do
            v49:Disconnect();
        end;
        v47.Connections = {};
    end;
    if v47.Actions then
        for _, v51 in ipairs(v47.Actions) do
            v51.Enabled = false;
        end;
    end;
end;
v22.render = function(v52)
    local l_props_1 = v52.props;
    if v52.lastToolingMode ~= l_props_1.Path2DToolMode then
        v52.lastToolingMode = l_props_1.Path2DToolMode;
        if v52.lastToolingMode == "DoneEditing" then
            v52:disableActions(v52.EditingActions);
        else
            v52:enableActions(v52.EditingActions);
        end;
    end;
    return nil;
end;
return v3.connect(function(v54, _)
    return {
        SelectedObject = v54.PathReducer.SelectedObject, 
        SelectedControlPointIndex = v54.PathReducer.SelectedControlPointIndex, 
        SelectedTangentSide = v54.PathReducer.SelectedTangentSide, 
        Path2DToolMode = v54.PathReducer.Path2DToolMode
    };
end, function(v56)
    return {
        dispatchToggleDone = function()
            v56(v15());
        end, 
        dispatchToggleAddPointTool = function()
            local l_v18_0 = v18;
            l_v18_0.addPointModeCount = l_v18_0.addPointModeCount + 1;
            v56(v12());
        end, 
        dispatchToggleAddTangentTool = function()
            local l_v18_1 = v18;
            l_v18_1.addTangentModeCount = l_v18_1.addTangentModeCount + 1;
            v56(v14());
        end, 
        dispatchToggleMoveTool = function()
            local l_v18_2 = v18;
            l_v18_2.selectModeCount = l_v18_2.selectModeCount + 1;
            v56(v13());
        end, 
        dispatchPathChanged = function(v60)
            v56(v11(v60));
        end, 
        dispatchSelectPath = function(v61)
            v56(v9(v61));
        end, 
        dispatchSelectPathCleared = function()
            v56(v10());
        end, 
        dispatchRemoveControlPoint = function()
            v56(v16());
        end
    };
end)((l_withContext_0({
    PluginActions = l_ContextServices_0.PluginActions, 
    Mouse = l_ContextServices_0.Mouse
})(v22)));
