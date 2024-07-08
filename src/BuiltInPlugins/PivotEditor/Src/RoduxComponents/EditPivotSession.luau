local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
local v7 = require(l_DraggerFramework_0.Handles.MoveHandles);
local v8 = require(l_DraggerFramework_0.Handles.RotateHandles);
local v9 = require(l_Parent_0.Src.DraggerSchemaPivot.PivotHandle);
local v10 = require(l_Parent_0.Src.DraggerSchemaPivot.DraggerSchema);
local v11 = require(l_Parent_0.Src.DraggerSchemaPivot.DraggerContext_Pivot);
local v12 = require(l_Parent_0.Src.RoduxComponents.SelectionUpdaterBound);
local v13 = require(l_Parent_0.Src.Actions.BeginSelectingPivot);
local v14 = require(l_Parent_0.Src.Actions.DoneSelectingPivot);
local v15 = require(l_Parent_0.Src.Utility.EditingMode);
local v16 = require(l_Parent_0.Src.Utility.StatusMessage);
local v17 = require(l_Parent_0.Src.Utility.ToastNotification);
local v18 = v1.PureComponent:extend("EditPivotSession");
local function _(v19)
    if not (v19 ~= v16.None) or v19 == v16.NoSelection then
        return false;
    else
        return true;
    end;
end;
v18.didMount = function(v21)
    v21._oldShowPivot = v21._draggerContext:setPivotIndicator(v21.props.statusMessage == v16.None);
end;
v18._getCurrentDraggerHandles = function(v22)
    if v22.props.editingMode == v15.Transform then
        return {
            v7.new(v22._draggerContext, {
                Outset = 0.5, 
                ShowBoundingBox = false, 
                Summonable = false, 
                MustPositionAtPivot = true
            }, v10.MoveHandlesImplementation.new(v22._draggerContext, "EditPivot")), 
            v8.new(v22._draggerContext, {
                ShowBoundingBox = false, 
                Summonable = false
            }, v10.RotateHandlesImplementation.new(v22._draggerContext, "EditPivot")), 
            v9.new(v22._draggerContext)
        };
    else
        return {};
    end;
end;
v18.render = function(v23)
    local l_editingMode_0 = v23.props.editingMode;
    local v25 = {};
    local v26 = v23.props.Plugin:get();
    local l_v26_Mouse_0 = v26:GetMouse();
    v23._draggerContext = v23.props.DraggerContext;
    if not v23._draggerContext then
        v23._draggerContext = v11.new(v26, game, settings(), v10.Selection.new());
    end;
    if not (l_editingMode_0 ~= v15.Transform) or l_editingMode_0 == v15.None then
        v25.DraggerToolComponent = v1.createElement(v6, {
            Mouse = l_v26_Mouse_0, 
            DraggerContext = v23._draggerContext, 
            DraggerSchema = v10, 
            DraggerSettings = {
                AnalyticsName = "EditPivot", 
                AllowDragSelect = false, 
                AllowFreeformDrag = l_editingMode_0 == v15.Transform, 
                ShowLocalSpaceIndicator = false, 
                HandlesList = v23:_getCurrentDraggerHandles()
            }
        });
    end;
    v25.SelectionUpdaterBound = v1.createElement(v12);
    return v1.createFragment(v25);
end;
v18.willUpdate = function(v28, v29, _)
    local l_statusMessage_0 = v29.statusMessage;
    v28._draggerContext:setPivotIndicator(l_statusMessage_0 == v16.None);
    local l_statusMessage_1 = v28.props.statusMessage;
    if l_statusMessage_1 ~= l_statusMessage_0 then
        if l_statusMessage_1 ~= v16.None then
            v28.props.ToastNotification:hideNotification(l_statusMessage_1);
        end;
        if l_statusMessage_0 ~= v16.None and l_statusMessage_0 ~= v16.NoSelection then
            v28.props.ToastNotification:showNotification(v28.props.Localization:getText("Notification", l_statusMessage_0), l_statusMessage_0);
        end;
    end;
end;
v18.willUnmount = function(v33)
    v33._draggerContext:setPivotIndicator(v33._oldShowPivot);
end;
return v2.connect(function(v34, _)
    return {
        editingMode = v34.editingMode, 
        statusMessage = v34.statusMessage, 
        targetObject = v34.targetObject
    };
end, function(v36)
    return {
        beginSelectingPivot = function(v37, v38)
            v36(v13(v37, v38));
        end, 
        doneSelectingPivot = function()
            v36(v14());
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    ToastNotification = v17
})(v18)));
