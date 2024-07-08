local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v6 = require(l_Actions_0.SetDefaultEulerAnglesOrder);
local v7 = require(l_Actions_0.SetDefaultRotationType);
local v8 = require(l_Actions_0.SetShowAsSeconds);
local v9 = require(l_Actions_0.SetSnapMode);
local v10 = require(l_Actions_0.SetTimelineUnit);
local v11 = require(l_Actions_0.SetTool);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v13 = require(l_Components_0.AnimationClipEditor);
local v14 = require(l_Components_0.PluginWidget.DockWidget);
local v15 = require(l_Components_0.Draggers.DraggerWrapper);
local _ = require(l_Components_0.BlockingDialog.ErrorDialogContents);
local v17 = require(l_Components_0.BlockingDialog.ErrorList);
local l_Context_0 = l_script_FirstAncestor_0.Src.Context;
local v19 = require(l_Context_0.MainProvider);
local v20 = require(l_Context_0.Signals);
local v21 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local l_Localization_0 = l_ContextServices_0.Localization;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.LocalizedStrings;
local v25 = require(l_script_FirstAncestor_0.Src.Thunks.ReleaseEditor);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v27 = require(l_Util_0.CalloutController);
local v28 = require(l_Util_0.Constants);
local v29 = require(l_Util_0.DebugFlags);
local v30 = require(l_Util_0.MakePluginActions);
local v31 = require(l_Util_0.RigVisualization);
local v32 = require(l_Util_0.showBlockingDialog);
local v33 = require(l_Util_0.Theme);
local v34 = require(l_script_FirstAncestor_0.Src.Resources.AnalyticsHandlers);
local v35 = v2.PureComponent:extend("AnimationClipEditorPlugin");
local l_game_FastString_0 = game:GetFastString("FaceControlsEditorLink");
local v37 = game:DefineFastString("ACECurveEditorLink", "https://create.roblox.com/docs/building-and-visuals/animation/curve-editor");
local v38 = game:DefineFastString("ACEFaceRecorderLink", "https://create.roblox.com/docs/building-and-visuals/animation/face-recorder");
local v39 = game:DefineFastFlag("ACETemporaryToolHack", false);
local v40 = game:DefineFastFlag("ACEHideBonesOnExit", false);
local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local v42 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagFacialAnimationRecordingInStudio);
local v43 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
v35.handleButtonClick = function(v44, v45)
    if not l_RunService_0:IsRunning() then
        v44:setState(function(v46)
            return {
                enabled = not v46.enabled
            };
        end);
        return ;
    else
        v32(v45, v2.createElement(v17, {
            ErrorKey = v28.EDITOR_ERRORS_KEY, 
            ErrorList = {
                {
                    ID = v28.EDITOR_ERRORS.OpenedWhileRunning
                }
            }
        }));
        return ;
    end;
end;
v35.createPluginButton = function(v47, _, _)
    v47.toolbar = v47.props.pluginLoaderContext.toolbar;
    v47.mainButton = v47.props.pluginLoaderContext.mainButton;
end;
v35.init = function(v50, v51)
    assert(v51.plugin ~= nil, "AnimationClipEditorPlugin requires a Plugin.");
    local v52 = {
        v3.thunkMiddleware
    };
    if v29.LogRoduxEvents() then
        table.insert(v52, v3.loggerMiddleware);
    end;
    v50.store = v3.Store.new(v21, nil, v52);
    v50.localization = l_Localization_0.new({
        pluginName = v28.PLUGIN_NAME, 
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0
    });
    v50.calloutController = v27.new();
    v50.calloutController:defineCallout("FaceControlsEditorCallout", v50.localization:getText("FaceControlsEditorButtonCallout", "Title"), v50.localization:getText("FaceControlsEditorButtonCallout", "Description"), l_game_FastString_0);
    v50.calloutController:defineCallout("CurveEditorCallout", v50.localization:getText("CurveEditorCallout", "Title"), v50.localization:getText("CurveEditorCallout", "Description"), v37);
    if v42() then
        v50.calloutController:defineCallout("FaceRecorderCallout", v50.localization:getText("FaceCapture", "TeachingCalloutTitle"), v50.localization:getText("FaceCapture", "TeachingCalloutDescription"), v38);
    end;
    v50.actions = l_ContextServices_0.PluginActions.new(v51.plugin, v30(v51.plugin, v50.localization));
    v50.state = {
        enabled = false, 
        pluginGui = nil
    };
    v50.signals = v20.new(v28.SIGNAL_KEYS);
    v50.analytics = l_ContextServices_0.Analytics.new(v34);
    v50.onDockWidgetLoaded = function(v53)
        v50.dockWidget = v53;
    end;
    v50:createPluginButton(v51.plugin, v50.localization);
    v50.mainButton:SetActive(v50.state.enabled);
    task.defer(function()
        v51.pluginLoaderContext.mainButtonClickedSignal:Connect(function()
            v50:handleButtonClick(v51.plugin);
        end);
    end);
    v50.onDockWidgetEnabledChanged = function(v54)
        if v50.state.enabled == v54 then
            return ;
        else
            v50:setState({
                enabled = v54
            });
            return ;
        end;
    end;
    v50.onToolSelected = function(v55)
        local l_plugin_0 = v51.plugin;
        if not (not ((v55 ~= Enum.RibbonTool.Select and v55 ~= Enum.RibbonTool.Rotate) and v55 ~= Enum.RibbonTool.Move) or v55 == Enum.RibbonTool.Scale) or not v50.state.enabled then
            return ;
        else
            local v57 = nil;
            v57 = l_RunService_0.Heartbeat:Connect(function()
                v57:Disconnect();
                v50.mainButton:SetActive(true);
                l_plugin_0:Activate(true);
            end);
            v55 = v55 == Enum.RibbonTool.Scale and Enum.RibbonTool.Select or v55;
            v50.store:dispatch(v11(v55));
            v50.analytics:report("onToolChanged", v55.Name);
            return true;
        end;
    end;
    v50.deactivationInProgress = false;
    local function v59()
        local l_SelectedRibbonTool_0 = v51.plugin:GetSelectedRibbonTool();
        if not (l_SelectedRibbonTool_0 ~= Enum.RibbonTool.None) or not v50.onToolSelected(l_SelectedRibbonTool_0) then
            if v50.state.enabled then
                v50.store:dispatch(v25(v50.analytics));
            end;
            return ;
        else
            return ;
        end;
    end;
    v50.deactivationListener = v50.props.plugin.Deactivation:Connect(function()
        local l_plugin_1 = v51.plugin;
        if v40 then
            v31.clearMicrobones();
        end;
        if not v39 then
            local l_l_plugin_1_SelectedRibbonTool_0 = l_plugin_1:GetSelectedRibbonTool();
            if not (l_l_plugin_1_SelectedRibbonTool_0 ~= Enum.RibbonTool.None) or not v50.onToolSelected(l_l_plugin_1_SelectedRibbonTool_0) then
                if v50.state.enabled then
                    v50.store:dispatch(v25(v50.analytics));
                end;
                return ;
            else
                return ;
            end;
        else
            v50.deactivationInProgress = true;
            task.wait();
            task.wait();
            v59();
            v50.deactivationInProgress = false;
            return ;
        end;
    end);
    v50.unloadingListener = if not v39 then nil else v50.props.plugin.Unloading:Connect(function()
        if v50.deactivationInProgress then
            v59();
            v50.deactivationInProgress = false;
        end;
    end);
    v50.mouse = v50.props.plugin:GetMouse();
    v50.theme = v33();
    v50.closeWidget = function()
        v50:setState({
            enabled = false
        });
    end;
end;
v35.getPluginSettings = function(v62)
    local l_plugin_2 = v62.props.plugin;
    local l_l_plugin_2_Setting_0 = l_plugin_2:GetSetting(v28.SETTINGS.SnapMode);
    local l_l_plugin_2_Setting_1 = l_plugin_2:GetSetting(v28.SETTINGS.ShowAsSeconds);
    local l_l_plugin_2_Setting_2 = l_plugin_2:GetSetting(v28.SETTINGS.TimelineUnit);
    if l_l_plugin_2_Setting_0 ~= nil then
        v62.store:dispatch(v9(l_l_plugin_2_Setting_0));
    else
        l_l_plugin_2_Setting_0 = l_plugin_2:GetSetting("SnapMode");
        if l_l_plugin_2_Setting_0 ~= nil then
            v62.store:dispatch(v9(l_l_plugin_2_Setting_0));
        else
            v62.store:dispatch(v9(v28.SNAP_MODES.Keyframes));
        end;
    end;
    if not v43() then
        if l_l_plugin_2_Setting_1 ~= nil then
            v62.store:dispatch(v8(l_l_plugin_2_Setting_1));
        else
            l_l_plugin_2_Setting_1 = l_plugin_2:GetSetting("ShowAsSeconds");
            if l_l_plugin_2_Setting_1 ~= nil then
                v62.store:dispatch(v8(l_l_plugin_2_Setting_1));
            end;
        end;
    elseif not l_l_plugin_2_Setting_2 then
        if l_l_plugin_2_Setting_1 ~= nil then
            v62.store:dispatch(v10(if not l_l_plugin_2_Setting_1 then v28.TIMELINE_UNITS.Frames else v28.TIMELINE_UNITS.Seconds));
        end;
    else
        v62.store:dispatch(v10(l_l_plugin_2_Setting_2));
    end;
    local l_l_plugin_2_Setting_3 = l_plugin_2:GetSetting(v28.SETTINGS.RotationType);
    if not l_l_plugin_2_Setting_3 then
        l_l_plugin_2_Setting_3 = l_plugin_2:GetSetting("RotationType");
        if not l_l_plugin_2_Setting_3 then
            v62.store:dispatch(v7(v28.TRACK_TYPES.EulerAngles));
        else
            v62.store:dispatch(v7(l_l_plugin_2_Setting_3));
        end;
    else
        v62.store:dispatch(v7(l_l_plugin_2_Setting_3));
    end;
    local l_l_plugin_2_Setting_4 = l_plugin_2:GetSetting(v28.SETTINGS.EulerAnglesOrder);
    v62.store:dispatch(v6(if not l_l_plugin_2_Setting_4 then Enum.RotationOrder.XYZ else Enum.RotationOrder[l_l_plugin_2_Setting_4]));
end;
v35.setPluginSettings = function(v69)
    local l_plugin_3 = v69.props.plugin;
    local l_Status_0 = v69.store:getState().Status;
    if not v43() then
        l_plugin_3:SetSetting(v28.SETTINGS.ShowAsSeconds, l_Status_0.ShowAsSeconds);
    else
        l_plugin_3:SetSetting(v28.SETTINGS.TimelineUnit, l_Status_0.TimelineUnit);
    end;
    l_plugin_3:SetSetting(v28.SETTINGS.SnapMode, l_Status_0.SnapMode);
    l_plugin_3:SetSetting(v28.SETTINGS.RotationType, l_Status_0.DefaultRotationType);
    l_plugin_3:SetSetting(v28.SETTINGS.EulerAnglesOrder, l_Status_0.DefaultEulerAnglesOrder);
end;
local function _(v72)
    if v72 then
        return v72:FindFirstChild(v28.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME);
    else
        return nil;
    end;
end;
local function _(v74)
    local v75 = if v74 then v74:FindFirstChild(v28.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME) else nil;
    if not v75 then
        v75 = Instance.new("BindableEvent");
        v75.Name = v28.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME;
        v75.Parent = v74;
    end;
    return v75;
end;
local function _(v77)
    local v78 = if v77 then v77:FindFirstChild(v28.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME) else nil;
    if v78 then
        v78:Destroy();
    end;
end;
v35.didMount = function(v80)
    v80:setState({
        pluginGui = v80.dockWidget, 
        enabled = v80.dockWidget.Enabled
    });
    v80:getPluginSettings();
    local l_dockWidget_0 = v80.dockWidget;
    if not if l_dockWidget_0 then l_dockWidget_0:FindFirstChild(v28.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME) else nil then
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        l_BindableEvent_0.Name = v28.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME;
        l_BindableEvent_0.Parent = l_dockWidget_0;
    end;
end;
v35.willUnmount = function(v83)
    if v83.deactivationListener then
        v83.deactivationListener:Disconnect();
    end;
    if not (not v39 or not v83.unloadingListener) then
        v83.unloadingListener:Disconnect();
    end;
    local l_dockWidget_1 = v83.dockWidget;
    local v85 = if l_dockWidget_1 then l_dockWidget_1:FindFirstChild(v28.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME) else nil;
    if v85 then
        v85:Destroy();
    end;
    v83:setPluginSettings();
    v83.theme:destroy();
end;
v35.render = function(v86)
    local l_props_0 = v86.props;
    local l_store_0 = v86.store;
    local l_localization_0 = v86.localization;
    local l_plugin_4 = l_props_0.plugin;
    local l_actions_0 = v86.actions;
    local l_analytics_0 = v86.analytics;
    local l_mouse_0 = v86.mouse;
    local l_theme_0 = v86.theme;
    local l_pluginGui_0 = v86.state.pluginGui;
    local v96 = l_pluginGui_0 ~= nil;
    local l_enabled_0 = v86.state.enabled;
    v86.mainButton:SetActive(l_enabled_0);
    return v2.createElement(v14, {
        Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "AnimationClipEditor", 
        Title = l_localization_0:getText("Plugin", "Name"), 
        Name = "AnimationClipEditor", 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        Widget = l_props_0.pluginLoaderContext.mainDockWidget, 
        Enabled = l_enabled_0, 
        [v2.Ref] = v86.onDockWidgetLoaded, 
        [v2.Change.Enabled] = v86.onDockWidgetEnabledChanged, 
        OnClose = v86.closeWidget
    }, {
        MainProvider = (v96 and l_enabled_0) and v2.createElement(v19, {
            theme = l_theme_0, 
            focusGui = l_pluginGui_0, 
            store = l_store_0, 
            plugin = l_plugin_4, 
            localization = l_localization_0, 
            pluginActions = l_actions_0, 
            mouse = l_mouse_0, 
            analytics = l_analytics_0, 
            signals = v86.signals, 
            calloutController = v86.calloutController
        }, {
            AnimationClipEditor = v2.createElement(v13), 
            Dragger = v2.createElement(v15)
        })
    });
end;
return v35;
