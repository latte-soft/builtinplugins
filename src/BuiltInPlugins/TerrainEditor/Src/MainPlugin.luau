local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.ReactRoblox);
local v4 = require(l_Parent_0.Packages.Framework);
local v5 = require(l_Parent_0.Packages.MaterialFramework);
local l_DockWidget_0 = v4.UI.DockWidget;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_StudioServices_0 = v5.Context.StudioServices;
local v11 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v14 = require(l_Parent_0.Src.Components.App);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v16 = require(l_Controllers_0.ShortcutController);
local v17 = require(l_Controllers_0.PluginController);
local v18 = require(l_Controllers_0.ToolController);
local v19 = require(l_Parent_0.Src.Resources.AnalyticsHandlers);
local v20 = require(l_Parent_0.Src.Flags.getFFlagTerrainEditorFixInitialization);
local v21 = require(l_Parent_0.Src.Flags.getFFlagFixTerrainEditorDETruncations);
local l_Tool_0 = require(l_Parent_0.Src.Types).Tool;
local v23 = v2.PureComponent:extend("MainPlugin");
v23.init = function(v24, v25)
    local l_Plugin_1 = v25.Plugin;
    if not v20() then
        local v27 = false;
        if v25.PluginLoaderContext then
            local l_mainDockWidget_0 = v25.PluginLoaderContext.mainDockWidget;
            local v29 = false;
            if l_mainDockWidget_0 ~= nil then
                v29 = l_mainDockWidget_0.Enabled;
            end;
            v27 = v29;
        end;
        v24:setState({
            enabled = v27
        });
    end;
    v24.toggleEnabled = function()
        if not v24.state.enabled then
            v24.onRestore(true);
            return ;
        else
            v24.onClose();
            return ;
        end;
    end;
    v24.onClose = function()
        v24:setState({
            enabled = false
        });
        if v24.toolController and v24.toolController:getTool()._name ~= l_Tool_0.Empty then
            v24.toolIndex = v24.toolController:getToolIndex();
            v24.tabIndex = v24.toolController:getTabIndex();
            v24.toolController:setTabAndToolIndex(v24.tabIndex, v24.toolIndex);
        end;
    end;
    v24.onCreated = function()
        if v24.props.PluginLoaderContext then
            v24.props.PluginLoaderContext.mainButton:SetActive(v24.state.enabled);
            v24.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v24.toggleEnabled);
        end;
    end;
    v24.onRestore = function(v30)
        v24:setState({
            enabled = v30
        });
        if not ((not v24.toolController or not v24.tabIndex) or not v24.toolIndex) then
            v24.toolController:setTabAndToolIndex(v24.tabIndex, v24.toolIndex);
            v24.toolIndex = nil;
            v24.tabIndex = nil;
        end;
    end;
    v24.onWidgetEnabledChanged = function(v31)
        if not v31.Enabled then
            v24.onClose();
            return ;
        else
            v24.onRestore(v31.Enabled);
            return ;
        end;
    end;
    if not v20() then
        v24.localization = l_ContextServices_0.Localization.new({
            libraries = {
                [v5.Resources.LOCALIZATION_PROJECT_NAME] = {
                    stringResourceTable = v5.Resources.SourceStrings, 
                    translationResourceTable = v5.Resources.LocalizedStrings
                }, 
                [v4.Resources.LOCALIZATION_PROJECT_NAME] = {
                    stringResourceTable = v4.Resources.SourceStrings, 
                    translationResourceTable = v4.Resources.LocalizedStrings
                }
            }, 
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0, 
            pluginName = "TerrainEditor"
        });
        v24.analytics = l_ContextServices_0.Analytics.new(v19);
        v24.shortcutController = v16.new(l_Plugin_1, v24.localization);
        v24.pluginController = v17.new(l_Plugin_1);
        v24.studioServices = l_StudioServices_0.new();
        v24.stylizer = v11();
        v24.toolController = v18.new(v24.pluginController, v24.shortcutController, v24.analytics, v24.localization, v24.stylizer);
    end;
    v24.onFocused = function()
        v24.pluginController:resume();
    end;
    v24.onUnfocused = function()
        v24.pluginController:pause();
    end;
    v24.button = if not v24.props.PluginLoaderContext then nil else v24.props.PluginLoaderContext.mainButton;
    if v20() then
        v24.state = {
            enabled = false
        };
    end;
end;
if v20() then
    v23.didMount = function(v32)
        local l_Plugin_2 = v32.props.Plugin;
        if not v32.localization then
            v32.localization = l_ContextServices_0.Localization.new({
                libraries = {
                    [v5.Resources.LOCALIZATION_PROJECT_NAME] = {
                        stringResourceTable = v5.Resources.SourceStrings, 
                        translationResourceTable = v5.Resources.LocalizedStrings
                    }, 
                    [v4.Resources.LOCALIZATION_PROJECT_NAME] = {
                        stringResourceTable = v4.Resources.SourceStrings, 
                        translationResourceTable = v4.Resources.LocalizedStrings
                    }
                }, 
                stringResourceTable = l_SourceStrings_0, 
                translationResourceTable = l_LocalizedStrings_0, 
                pluginName = "TerrainEditor"
            });
        end;
        if not v32.analytics then
            v32.analytics = l_ContextServices_0.Analytics.new(v19);
        end;
        if not v32.shortcutController then
            v32.shortcutController = v16.new(l_Plugin_2, v32.localization);
        end;
        if not v32.pluginController then
            v32.pluginController = v17.new(l_Plugin_2);
        end;
        if not v32.studioServices then
            v32.studioServices = l_StudioServices_0.new();
        end;
        if not v32.stylizer then
            v32.stylizer = v11();
        end;
        if not v32.toolController then
            v32.toolController = v18.new(v32.pluginController, v32.shortcutController, v32.analytics, v32.localization, v32.stylizer);
        end;
        if not v32._initialized then
            local v34 = false;
            if v32.props.PluginLoaderContext then
                local l_mainDockWidget_1 = v32.props.PluginLoaderContext.mainDockWidget;
                local v36 = false;
                if l_mainDockWidget_1 ~= nil then
                    v36 = l_mainDockWidget_1.Enabled;
                end;
                v34 = v36;
            end;
            v32:setState({
                enabled = v34
            });
            v32._initialized = true;
        end;
    end;
end;
v23.didUpdate = function(v37)
    v37.button:SetActive(v37.state.enabled);
end;
v23.willUnmount = function(v38)
    v38.pluginController:destroy();
    v38.toolController:destroy();
end;
v23.render = function(v39)
    local l_props_0 = v39.props;
    local l_state_0 = v39.state;
    local l_Plugin_3 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    if not v20() or v39.localization then
        return l_ContextServices_0.provide({
            l_Plugin_0.new(l_Plugin_3), 
            l_Mouse_0.new(l_Plugin_3:getMouse()), 
            v39.stylizer, 
            v39.localization, 
            v39.analytics, 
            v39.shortcutController, 
            v39.pluginController, 
            v39.studioServices, 
            v39.toolController
        }, {
            MainWidget = v2.createElement(l_DockWidget_0, {
                Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "TerrainEditor", 
                Enabled = l_enabled_0, 
                Title = v39.localization:getText("Plugin", "Name"), 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                InitialDockState = Enum.InitialDockState.Left, 
                Size = Vector2.new(640, 480), 
                MinSize = if not v21() then Vector2.new(320, 200) else Vector2.new(350, 200), 
                OnClose = v39.onClose, 
                ShouldRestore = true, 
                OnWidgetCreated = v39.onCreated, 
                OnWidgetFocused = v39.onFocused, 
                OnWidgetFocusReleased = v39.onUnfocused, 
                OnWidgetRestored = v39.onRestore, 
                Widget = if not v39.props.PluginLoaderContext then nil else v39.props.PluginLoaderContext.mainDockWidget, 
                [v3.Change.Enabled] = v39.onWidgetEnabledChanged
            }, {
                App = v2.createElement(v14)
            })
        }, true);
    else
        return ;
    end;
end;
return v23;
