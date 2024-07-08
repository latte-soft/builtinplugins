local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Shorelines_Tooling_0 = game:GetFastFlag("Shorelines_Tooling");
local l_SmoothVoxels_Tooling_0 = game:GetFastFlag("SmoothVoxels_Tooling");
local v4 = require(l_Parent_0.Packages.Framework);
local v5 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v4.ContextServices;
local l_DockWidget_0 = v4.UI.DockWidget;
local v8 = require(l_Parent_0.Src.Components.Manager);
local v9 = require(l_Parent_0.Src.Components.ShorelineDialog);
local v10 = require(l_Parent_0.Src.Components.SmoothVoxelsDialog);
local v11 = require(l_Parent_0.Src.Components.ToolSelectionListener);
local l_RunService_0 = game:GetService("RunService");
local v13 = not not l_RunService_0 and l_RunService_0:IsEdit();
local v14 = require(l_Parent_0.Src.Util.Constants);
local v15 = Vector2.new(300, 600);
local v16 = v5.PureComponent:extend("TerrainTools");
v16.init = function(v17)
    local v18 = true;
    if not (not l_Shorelines_Tooling_0 or not v17.props.pluginLoaderContext) then
        local l_mainDockWidget_0 = v17.props.pluginLoaderContext.mainDockWidget;
        v18 = l_mainDockWidget_0 and l_mainDockWidget_0.Enabled;
    end;
    v17.state = {
        enabled = v18
    };
    v17.toggleEnabled = function()
        v17:setState(function(v20)
            local v21 = not v20.enabled;
            v17:sendWindowEnabledAnalytics(v21);
            return {
                enabled = v21
            };
        end);
    end;
    v17.onClose = function()
        v17:setEnabled(false, true);
    end;
    v17.onRestore = function(v22)
        v17:setEnabled(v22, false);
    end;
    v17.onDockWidgetCreated = function(v23)
        v17.props.pluginLoaderContext.mainButton:SetActive(v23);
        v17.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v17.toggleEnabled);
    end;
    v17.onWidgetEnabledChanged = function(v24)
        v17:setEnabled(v24.Enabled, true);
    end;
    v17.onFocused = function()
        v17.props.pluginActivationController:restoreSelectedTool();
    end;
    v17.button = not not v17.props.pluginLoaderContext and v17.props.pluginLoaderContext.mainButton or nil;
end;
v16.sendWindowEnabledAnalytics = function(v25, v26)
    if v25.props.analytics then
        v25.props.analytics:report("toggleWidget");
        v25.props.analytics:report(not v26 and "closeWidget" or "openWidget");
        return ;
    else
        return ;
    end;
end;
v16.setEnabled = function(v27, v28, v29)
    v27:setState(function(v30)
        if v30.enabled == v28 then
            return nil;
        else
            if v29 then
                v27:sendWindowEnabledAnalytics(v28);
            end;
            return {
                enabled = v28
            };
        end;
    end);
end;
v16.didUpdate = function(v31, _, v33)
    if v33.enabled ~= v31.state.enabled then
        if not v31.state.enabled then
            v31.props.pluginActivationController:pauseActivatedTool();
        else
            v31.props.pluginActivationController:restoreSelectedTool();
        end;
    end;
    v31.button:SetActive(v31.state.enabled);
end;
v16.render = function(v34)
    local l_enabled_0 = v34.state.enabled;
    local l_plugin_0 = v34.props.plugin;
    local l_mouse_0 = v34.props.mouse;
    local l_store_0 = v34.props.store;
    local l_theme_0 = v34.props.theme;
    local l_devFrameworkThemeItem_0 = v34.props.devFrameworkThemeItem;
    local l_localization_0 = v34.props.localization;
    local l_analytics_0 = v34.props.analytics;
    local l_terrain_0 = v34.props.terrain;
    local l_pluginActivationController_0 = v34.props.pluginActivationController;
    local l_pluginActionsController_0 = v34.props.pluginActionsController;
    local l_terrainImporter_0 = v34.props.terrainImporter;
    local l_terrainGeneration_0 = v34.props.terrainGeneration;
    local l_seaLevel_0 = v34.props.seaLevel;
    local _ = v34.props.partConverter;
    return l_ContextServices_0.provide({
        l_plugin_0, 
        l_mouse_0, 
        l_store_0, 
        l_theme_0, 
        l_devFrameworkThemeItem_0, 
        l_localization_0, 
        l_analytics_0, 
        l_terrain_0, 
        l_pluginActivationController_0, 
        l_pluginActionsController_0, 
        l_terrainImporter_0, 
        l_terrainGeneration_0, 
        l_seaLevel_0, 
        v34.props.imageLoader, 
        v34.props.calloutController, 
        v34.props.shorelineController, 
        v34.props.smoothVoxelsController
    }, {
        TerrainTools = v5.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "TerrainTools", 
            Title = l_localization_0:getText("Main", "Title"), 
            Enabled = l_enabled_0, 
            Widget = not not v34.props.pluginLoaderContext and v34.props.pluginLoaderContext.mainDockWidget or nil, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = v15, 
            MinSize = v14.MIN_WIDGET_SIZE, 
            OnClose = v34.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v34.onRestore, 
            OnWidgetCreated = v34.onDockWidgetCreated, 
            OnWidgetFocused = v34.onFocused, 
            [v5.Change.Enabled] = v34.onWidgetEnabledChanged
        }, not not l_enabled_0 and {
            UIManager = v5.createElement(v8), 
            ToolSelectionListener = v5.createElement(v11)
        } or nil), 
        ShorelineDialog = if not not l_Shorelines_Tooling_0 and v13 then v5.createElement(v9) else nil, 
        SmoothVoxelsDialog = if not not l_SmoothVoxels_Tooling_0 and v13 then v5.createElement(v10) else nil
    });
end;
return v16;
